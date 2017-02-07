# Install NGINX
include:
  - logrotate.nginx

install-nginx:
  pkg.installed:
    - name: nginx
  service.running:
    - name: nginx
    - require:
      - pkg: install-nginx
