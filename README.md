# Reproduction steps

1. `npm install`.
2. `npm test`.

- **Expected:** No errors logged.
- **Actual:** An error is thrown when performing the redirect:
```
failed to get redirect response TypeError: fetch failed
    at Object.fetch (node:internal/deps/undici/undici:11576:11)
    at process.processTicksAndRejections (node:internal/process/task_queues:95:5)
    at async globalThis.fetch (/Users/alex/Projects/next-server-action-redirect-issue/.next/server/chunks/22.js:1:123262)
    at async rp (/Users/alex/Projects/next-server-action-redirect-issue/node_modules/next/dist/compiled/next-server/app-page.runtime.prod.js:15:4325)
    at async rm (/Users/alex/Projects/next-server-action-redirect-issue/node_modules/next/dist/compiled/next-server/app-page.runtime.prod.js:16:741)
    at async rq (/Users/alex/Projects/next-server-action-redirect-issue/node_modules/next/dist/compiled/next-server/app-page.runtime.prod.js:18:1249)
    at async doRender (/Users/alex/Projects/next-server-action-redirect-issue/node_modules/next/dist/server/base-server.js:1395:30)
    at async cacheEntry.responseCache.get.routeKind (/Users/alex/Projects/next-server-action-redirect-issue/node_modules/next/dist/server/base-server.js:1556:28)
    at async NextNodeServer.renderToResponseWithComponentsImpl (/Users/alex/Projects/next-server-action-redirect-issue/node_modules/next/dist/server/base-server.js:1464:28)
    at async NextNodeServer.renderPageComponent (/Users/alex/Projects/next-server-action-redirect-issue/node_modules/next/dist/server/base-server.js:1861:24) {
  cause: [Error: 401C53DE01000000:error:0A00010B:SSL routines:ssl3_get_record:wrong version number:ssl/record/ssl3_record.c:355:
  ] {
    library: 'SSL routines',
    reason: 'wrong version number',
    code: 'ERR_SSL_WRONG_VERSION_NUMBER'
  }
}
```
