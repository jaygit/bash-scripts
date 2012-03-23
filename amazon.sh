#!/bin/sh
#curl --verbose -L --proxy sdcwebcachevip2.sdc.hp.com:8080 http://www.dublinbus.ie/en/Your-Journey1/Timetables/All-Timetables/66 > xx.txt
curl --verbose -L --proxy sdcwebcachevip2.sdc.hp.com:8080 "http://www.amazon.co.uk/gp/registry/wishlist/25QIRF5TGJY27?reveal=unpurchased&filter=all&sort=date-added&layout=compact&.x=14&.y=12" | grep "> by" -B 1 | sed -e "s/<[^>]*>//g" | grep  "[^-+]"
