{%- from "logrotate/map.jinja" import logrotate with context %}

install-logrotate:
  pkg.installed:
    - name: {{ logrotate.name }}
