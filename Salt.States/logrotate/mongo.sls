include:
  - logrotate

nginx:
  file.managed:
    - name: /etc/logrotate.d/mongodb
    - source: salt://logrotate/files/mongodb
    - mode: "0644"
    - user: root
    - group: root