logrotate:
  file.managed:
    - name: /usr/local/scripts/logrotate
    - source: salt://logrotate/files/logrotate
    - mode: "0755"
    - user: root
    - group: root
    - makedirs: True

/usr/local/scripts/logrotate:
  cron.present:
    - user: root
    - minute: 5
    - hour: 0

/etc/cron.daily/logrotate:
  file:
    - absent
    - user: root
    - group: root