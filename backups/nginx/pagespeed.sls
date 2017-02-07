{%- from "nginx/map.jinja" import nginx with context %}

install-pagespeed-deps:
  pkg.installed:
    - pkgs:
      - libxslt1.1
      - libfontconfig1
      - libjpeg8
      - libtiff5
      - libvpx1
      - libxpm4
      - libgd3

nginx-common:
  pkg.installed:
    - sources:
      - nginx-common: http://{{ nginx.mirror }}/snagajob/nginx/nginx-common_1.4.6-1-snagajob-nps2_all.deb
    - hold: True

nginx-full:
  pkg.installed:
    - sources:
      - nginx-full: http://{{ nginx.mirror }}/snagajob/nginx/nginx-full_1.4.6-1-snagajob-nps2_amd64.deb
    - require:
      - pkg: nginx-common
    - hold: True
