install_app-server_packages:
  pkg.installed:
    - pkgs:
      - postfix

postfix:
  service.running:
    - enable: True

open_443:
  firewalld.service:
    - name: www
    - services:
      - https
