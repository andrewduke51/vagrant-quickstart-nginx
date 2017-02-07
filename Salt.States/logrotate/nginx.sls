include:
  - logrotate

logrotate_nginx:
  file.managed:
    - name: /etc/logrotate.d/nginx
    - source: salt://logrotate/files/nginx
    - mode: "0644"
    - user: root
    - group: root
