#!/bin/bash
/etc/init.d/php5-fpm restart
/etc/init.d/nginx restart
echo "complete"