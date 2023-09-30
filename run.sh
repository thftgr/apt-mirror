#!/bin/bash

apt-mirror
(crontab -l 2>/dev/null; echo '0 * * * * apt-mirror > /var/log/apt-mirror.log 2>&1') | crontab -
nginx -g "daemon off;"
