self.__BUILD_MANIFEST = function(e, s, t, r, a) {
    return {
        __rewrites: {
            afterFiles: [],
            beforeFiles: [{
                has: void 0,
                source: "/4cf83f8627d9609709ef5165081e6f27acdfe5d8/_next/:path+",
                destination: "/_next/:path+"
            }],
            fallback: []
        },
        __routerFilterStatic: {
            numItems: 0,
            errorRate: 1e-4,
            numBits: 0,
            numHashes: null,
            bitArray: []
        },
        __routerFilterDynamic: {
            numItems: e,
            errorRate: 1e-4,
            numBits: e,
            numHashes: null,
            bitArray: []
        },
        "/": [r, a, "static/chunks/pages/index-e5ae9ddb406d6be0.js"],
        "/_error": ["static/chunks/pages/_error-5366f00fee9a89ba.js"],
        "/games/start": [r, a, "static/chunks/pages/games/start-920e79298a9ac7db.js"],
        sortedPages: ["/", "/_app", "/_error", "/games/start"]
    }
}(0, 1e-4, null, "static/chunks/463-eb1bf35b6d125952.js", "static/chunks/774-3688b4b1497af314.js"), self.__BUILD_MANIFEST_CB && self.__BUILD_MANIFEST_CB();