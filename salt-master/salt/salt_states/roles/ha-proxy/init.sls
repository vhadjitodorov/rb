openssl_install:
  pkg.installed:
    - pkgs:
      - openssl

haproxy:
  pkg:
    - installed
  service.running:
    - watch:
      - pkg: haproxy
      - file: /etc/haproxy/haproxy.cfg

/etc/haproxy/haproxy.cfg:
  file.managed:
    - source: salt://roles/ha-proxy/files/etc/haproxy/haproxy.cfg
    - template: jinja
    - user: root
    - group: root
    - mode: 644
