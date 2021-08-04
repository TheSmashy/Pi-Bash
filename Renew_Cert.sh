#!/bin/bash

certbot certonly --manual-public-ip-logging-ok --non-interactive --agree-tos --email cert@wmode.anonaddy.com --manual --preferred-challenges=dns --manual-auth-hook ~/certbot-domainvalidation-dynu/scripts/script-pre.sh --manual-cleanup-hook ~/certbot-domainvalidation-dynu/scripts/script-post.sh -d wigglyfins.freeddns.org

cp /etc/letsencrypt/live/wigglyfins.freeddns.org/fullchain.pem /home/chronic0ps/swag/etc/letsencrypt/live/wigglyfins.freeddns.org/fullchain.pem
cp /etc/letsencrypt/live/wigglyfins.freeddns.org/privkey.pem /home/chronic0ps/swag/etc/letsencrypt/live/wigglyfins.freeddns.org/privkey.pem