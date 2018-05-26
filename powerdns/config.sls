{% from "powerdns/map.jinja" import powerdns with context %}

include:
  - powerdns

powerdns_config:
  file.managed:
    - name: {{ powerdns.lookup.config_file }}
    - source: salt://powerdns/files/pdns.conf
    - template: jinja
    - user: {{ powerdns.lookup.config_user }}
    - group: {{ powerdns.lookup.config_group }}
    - mode: 600
    - require:
      - pkg: powerdns
    - watch_in:
      - service: powerdns
