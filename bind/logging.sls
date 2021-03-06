{% from 'states/rsyslog/map.jinja' import rsyslog as rsyslog_map with context %}
{% from 'states/bind/map.jinja' import bind as bind_map with context %}

bind-log:
  file.accumulated:
    - filename: {{ rsyslog_map.include_basedir }}/{{ rsyslog_map.applications_conf }}
    - text:
      - {{ bind_map.logging }}
    - require_in:
      - file: rsyslog-applications
