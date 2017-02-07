##############################
# Update nginx configuration #
##############################
nginx.conf:
  file.managed:
    - name: /opt/nginx/conf/nginx.conf
    - source: salt://nginx/files/nginx.conf
    - user: nginx
    - group: nginx
    - mode: 0644

/opt/nginx/conf/conf.d:
  file.directory:
    - group: nginx
    - mode: 0644
    - makedirs: True

/var/log/nginx:
  file.directory:
    - group: nginx
    - mode: 0644
    - makedirs: True

nginx.init:
  file.managed:
    - name: /etc/init.d/nginx
    - source: salt://nginx/files/nginx
    - mode: 0755

#########################
# Startup automatically #
#########################
run_startup:
  cmd.run:
    - name: 'update-rc.d nginx defaults'
    - name: 'service nginx start'
