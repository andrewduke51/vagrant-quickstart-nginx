#!/bin/bash
rm /var/run/deploy.status
sudo /usr/local/scripts/dodeploy.sh &
echo "true" > /var/run/deploy.status
