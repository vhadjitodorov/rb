base:
  '*':
    - schedule
    - firewall
  'app-server*':
    - roles.app-server
  'ha-proxy*':
    - roles.ha-proxy
