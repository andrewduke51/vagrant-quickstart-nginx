include:
  - logrotate

diamond:
  file.managed:
    - name: /etc/logrotate.d/diamond
    - source: salt://logrotate/files/diamond
    - mode: "0644"
    - user: root
    - group: root
