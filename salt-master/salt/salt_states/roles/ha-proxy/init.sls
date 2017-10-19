haproxy:
  pkg:
    - installed
  service.running:
    - watch:
      - pkg: haproxy
#      - file: /etc/haproxy/haproxy.cfg
#      - file: /etc/default/haproxy
#
#/etc/haproxy/haproxy.cfg:
#  file.managed:
#    - source: salt://haproxy/files/etc/haproxy/haproxy.cfg.jinja
#    - template: jinja
#    - user: root
#    - group: root
#    - mode: 644
#
#/etc/default/haproxy:
#  file.managed:
#    - source: salt://haproxy/files/etc/default/haproxy
#    - user: root
#    - group: root
#    - mode: 644
