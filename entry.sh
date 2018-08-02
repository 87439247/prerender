#!/usr/bin/env bash
prerender_ajs=./lib/plugins/remote/prerender.ajs
DISCONF_URL=${DISCONF_URL:"http://disconf.intcoop.hexun.com/api/config/file?app=prerender&env=test&version=1_0_0_0&key=prerender_cache.js"}
echo $DISCONF_URL;
echo "module.exports = {" > $prerender_ajs
echo "remoteUrl : \"$DISCONF_URL\"" >> $prerender_ajs
echo "}" >> $prerender_ajs

mkdir -p /usr/share/fonts/win && cd /usr/share/fonts/win && chmod 755 *.ttf && mkfontscale && mkfontdir && fc-cache -fv

cd /opt/prerender && npm start

tail -f /etc/hosts