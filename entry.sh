#!/usr/bin/env bash
prerender_ajs=./lib/plugins/remote/prerender.ajs
DISCONF_URL=${DISCONF_URL:"http://disconf.intcoop.hexun.com/api/config/file?app=prerender&env=test&version=1_0_0_0&key=prerender_cache.js"}
echo $DISCONF_URL;
echo "module.exports = {" > $prerender_ajs
echo "remoteUrl : \"$DISCONF_URL\"" >> $prerender_ajs
echo "}" >> $prerender_ajs

npm start

tail -f /etc/hosts