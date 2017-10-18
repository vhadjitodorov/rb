# rb
A design and implementation of technical solution for R.B.

## Intoduction

I've got two solutions for the given task - a basic and an advanced. I've implemented the basic one, which is a PoC to justify the used technologies and necessary skillset . The proposed advanced solution is way more sophisticated, adding scalability, automation and more oriented security features. This complexity however makes troubleshooting more challenging, thus monitoring and proper documentation are highly recommended.


## Basic solution (implemented)

## Advanced solution (proposal)

### Technical overview

My Solution consists of the following elements:
- Cloudflare entry point
  - Hides the HA proxy IP address
  - DDoS protection
  - Web app firewall
- Caching CDN
- HA proxy
- GitLab app Docker containers
  - Hosts only the app, no DB, user files, logs, etc.
  - nginx
  - Straightforward deployment of app updates
  - Easy to lock package version dependencies
  - Session data is kept on the DB or file storage
- PostgreSQL / MySQL DB cluster
- File storage
  - Keeps the user files from the app, logs
  - Stores container images
- Redis cluster
- Logic monitor collector
- McAffee EPO
- Salt Master
  - Keeps the states for the different roles:
    - HA proxy
    - Container hosts
    - Jumpbox
    - …
  - States are stored in a GIT repo on the file server
- Jumpbox
  - 2FA
  - The infrastructure is not visible from the outside world

Notes and additional features:
1. Preferred OS is RHEL 7.
2. Only the JB and HA proxy have public IP addresses. firewalld limits exposed ports to 22 for JB and 443 for HA proxy.
3. Patching is done every other week. If there is a testing environments, pathing in testing is done a week ahead of production. Version lock or a private yum repo can be used to enforce the same packages version for both testing and prod.
4. Scaling can be automated with LM measuring the load of the servers and issuing API calls to power up additional instances of app containers and adding them to the HA proxy.
5. Make sure critical system processes are running as separate users - postgres, www-data, etc.
6. Make use of SELinux security policies.
7. Password policy is in place, root login is disabled, strong SSH crypto in enforced, set version banner to none in /etc/ssh/sshd_config
8. The storage is encrypted
9.
