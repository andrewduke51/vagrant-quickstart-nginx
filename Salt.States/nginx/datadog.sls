################################
# Datadog nginx configuration  #
################################
datadog.conf:
  file.managed:
    - name: /etc/dd-agent/conf.d/nginx.yaml
    - source: salt://nginx/files/nginx.conf
    - user: root
    - group: root
    - mode: 0644