#!stateconf
{% from 'states/uwsgi/map.jinja' import uwsgi as uwsgi_map with context %}

.params:
    stateconf.set: []
# --- end of state config ---

uwsgi:
  pkg.installed:
    - pkgs: {{ uwsgi_map.packages }}

  service.running:
    - name: {{ uwsgi_map.service }}
    - enable: true
    - require:
      - pkg: uwsgi

