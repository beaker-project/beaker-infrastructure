#!/bin/sh

find /var/www/{{ website_domain }}/jenkins-results/ -type f -mtime +7 -delete
find /var/www/{{ website_domain }}/jenkins-results/ -type d -mindepth 1 -empty -delete

