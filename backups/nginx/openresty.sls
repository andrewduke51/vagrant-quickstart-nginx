{%- from "apt/map.jinja" import aptitude with context %}

install.deps:
  pkg.installed:
    - pkgs:
      - nginx-common
      - libpcre3

openresty_install:
   file.managed:
    - name: /tmp/openresty_1.7.0.1-1_amd64.deb
    - source: http://{{ aptitude.mirror }}/snagajob/openresty/openresty_1.7.0.1-1_amd64.deb
    - source_hash: http://{{ aptitude.mirror }}/snagajob/openresty/openresty_1.7.0.1-1_amd64.md5
  cmd.wait:
    - name: dpkg -i /tmp/openresty_1.7.0.1-1_amd64.deb
    - require:
      - file: /tmp/openresty_1.7.0.1-1_amd64.deb
    - watch:
      - file: /tmp/openresty_1.7.0.1-1_amd64.deb
