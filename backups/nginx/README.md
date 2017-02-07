Nginx OpenResty
===

Compile OpenResty Package
=========================
You may need to install the the following development packages

```sh
libssl-dev
libpcre3-dev
```

Then do the follow stuffs.

```sh
$ wget http://openresty.org/download/ngx_openresty-1.7.0.1.tar.gz
$ tar xzf ngx_openresty-1.7.0.1.tar.gz
$ cd ngx_openresty-1.7.0.1
$ ./configure \
    --with-luajit \
    --sbin-path=/usr/sbin/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --error-log-path=/var/log/nginx/error.log \
    --http-client-body-temp-path=/var/lib/nginx/body \
    --http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
    --http-log-path=/var/log/nginx/access.log \
    --http-proxy-temp-path=/var/lib/nginx/proxy \
    --http-scgi-temp-path=/var/lib/nginx/scgi \
    --http-uwsgi-temp-path=/var/lib/nginx/uwsgi \
    --lock-path=/var/lock/nginx.lock \
    --pid-path=/run/nginx.pid \
    --with-http_iconv_module \
    -j2 \
    --with-ipv6
$ apt-get -y install make ruby1.9.1 ruby1.9.1-dev git-core libpcre3-dev libxslt1-dev libgd2-xpm-dev libgeoip-dev unzip zip build-essential
$ gem install fpm
$ make
$ INSTALL=/tmp/openresty
$ make install DESTDIR=$INSTALL
$ mkdir -p $INSTALL/var/lib/nginx
$ fpm -s dir -t deb -n openresty -v 1.7.0.1 --iteration 1 -C $INSTALL \
    --description "openresty 1.7.0.1 (snagajob)" \
    -d libpcre3 \
    -d "nginx-common (>= 1.4.1)" \
    --conflicts nginx-extras \
    --conflicts nginx-full \
    --conflicts nginx-light \
    run usr var
```

Compile ngx_pagespeed Package
=============================
See https://developers.google.com/speed/pagespeed/module/build_ngx_pagespeed_from_source for ngx_pagespeed and psol versions.

```
$ cd ~
$ mkdir ngx_pagespeed
$ cd ngx_pagespeed
$ apt-get source nginx
$ cd nginx-${NGINX_VERSION}/debian/modules
$ wget https://github.com/pagespeed/ngx_pagespeed/archive/release-${NPS_VERSION}-beta.zip
$ unzip release-${NPS_VERSION}-beta.zip
$ cd ngx_pagespeed-release-${NPS_VERSION}-beta/
$ wget https://dl.google.com/dl/page-speed/psol/${NPS_VERSION}.tar.gz
$ tar -xzvf ${NPS_VERSION}.tar.gz
$ vim ~/ngx_pagespeed/nginx-1.4.4/debian/rules
```
Add the following line to the `config.env.full` section
```
--add-module=$(MODULESDIR)/ngx_pagespeed-${NPS_VERSION}-beta \
```
Update the changelog with the correct versioning and messages.
```
vim ~/ngx_pagespeed/nginx-1.4.4/debian/changelog
```
And finally build the debian packages
```
dpkg-buildpackage -b
```
