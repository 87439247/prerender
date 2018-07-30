#!/usr/bin/env bash
docker rm -vf prerender
docker build . -t "docker-registry.hexun.com/prerender/prerender:5.4.2"
docker run -d --name=prerender -p 3000:3000 docker-registry.hexun.com/prerender/prerender:5.4.2
docker logs -f prerender