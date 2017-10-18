base:
  '*':
    - schedule
    - firewall
  'app-server*':
    - roles.app-server
