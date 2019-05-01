#!/usr/bin/env bash

VER=$(grep "version" website.properties|cut -d'=' -f2)  && docker build -t domix/website:$VER . #&& docker push domix/website:$VER #&& kubectl set image deployment/website website=domix/website:$VER'
