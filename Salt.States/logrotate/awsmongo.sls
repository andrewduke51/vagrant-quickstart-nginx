include:
  - logrotate

nginx:
  file.managed:
    - name: /etc/logrotate.d/awsmongodb
    - source: salt://logrotate/files/awsmongodb
    - mode: "0644"
    - user: root
    - group: root
