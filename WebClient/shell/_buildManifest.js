self.__BUILD_MANIFEST = function(e, s, t, a, r) {
    return {
        __rewrites: {
            afterFiles: [],
            beforeFiles: [{
                has: void 0,
                source: "/6536749aa05e452da9c4d6ed4b464613ff9ba84a/_next/:path+",
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
        "/": [s, r, "static/chunks/pages/index-378f53d0d6d44e48.js"],
        "/WebClient/Launcher": [s, "static/chunks/pages/WebClient/Launcher-ba9c76d2497e7b48.js"],
        "/_error": ["static/chunks/pages/_error-5366f00fee9a89ba.js"],
        "/games/start": [s, r, "static/chunks/pages/games/start-95660a61a2f135cd.js"],
        sortedPages: ["/", "/WebClient/Launcher", "/_app", "/_error", "/games/start"]
    }
}(0, "static/chunks/625-1b544f6168c24e1c.js", 1e-4, null, "static/chunks/51-e67dc1acff0bee27.js"), self.__BUILD_MANIFEST_CB && self.__BUILD_MANIFEST_CB();