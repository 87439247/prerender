#!/usr/bin/env node
var prerender = require('./lib');

var server = prerender({
    pageDoneCheckInterval: 100,
    pageLoadTimeout: 40 * 1000,
    logRequests: true,
    chromeFlags: ['--no-sandbox', '--headless', '--disable-gpu', '--remote-debugging-port=9222', '--hide-scrollbars']

});


server.use(prerender.blockResources());
server.use(prerender.removeScriptTags());
server.use(prerender.httpHeaders());
// server.use(prerender.redisCache());

server.start();
