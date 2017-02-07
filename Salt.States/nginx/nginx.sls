# Install NGINX

{% set version = '1.10.3' %}
{% set checksum = 'sha256=204a20cb4f0b0c9db746c630d89ff4ea' %}
{% set source_hash = 'sha1=95cf32c3e33efc53ac81338a5779fbaa425f02e2' %}

######################
# Create nginx group #
######################
nginx_group:
  group.present:
    - name: nginx

##################
# Add nginx user #
##################
nginx_user:
  user.present:
  - name: nginx
  - system: true
  - shell: /sbin/nologin
  - home: /home/nginx
  - groups:
      - nginx
  - require:
      - group: nginx

##############################
# Verify nginx prerequisites #
##############################
get-nginx:
  pkg.installed:
    - names:
      - libpcre3
      - libpcre3-dev
      - build-essential
      - zlib1g-dev

###########################
# Download nginx tar file #
###########################
nginx_download:
  file.managed:
    - name: /tmp/nginx-{{ version }}.tar.gz
    - source: http://nginx.org/download/nginx-{{ version }}.tar.gz
    - source_hash: {{ source_hash }}

########################################
# Extract nginx tar file and configure #
########################################
extract-nginx:
  archive.extracted:
    - name: /opt/
    - source: /tmp/nginx-{{ version }}.tar.gz
    - user: nginx
    - group: nginx
    - if_missing: /opt/nginx-{{ version }}.tar.gz
  cmd.run:
    - name: |
        cd /opt/nginx-{{ version }}
        ./configure --prefix=/opt/nginx --user=nginx --group=nginx --with-http_stub_status_module --with-http_gzip_static_module
        cd /opt/nginx-{{ version }}
        make
        sudo make install

#########################
# Remove nginx tar file #
#########################
remove_tar:
  cmd.run:
    - name: 'rm /tmp/nginx-{{ version }}.tar.gz'

#######################
# Remove nginx folder #
#######################
remove_folder:
  cmd.run:
    - name: 'rm -rf /opt/nginx-{{ version }}'