#!/usr/bin/env node
var prerender = require('./lib');

var server = prerender({
    logRequests: true
});
// server.use(prerender.basicAuth());
// server.use(prerender.sendPrerenderHeader());
server.use(prerender.blockResources());
server.use(prerender.removeScriptTags());
server.use(prerender.httpHeaders());
server.use(prerender.redisCache());

server.start();
