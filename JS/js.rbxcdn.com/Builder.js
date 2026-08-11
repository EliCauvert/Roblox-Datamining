! function() {
    try {
        var e = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "0ae8cb452c2b288d50c5e43b3518aaee739ffd6b"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "7436ffbf-0860-4751-ab34-e0d4528985e2", e._sentryDebugIdIdentifier = "sentry-dbid-7436ffbf-0860-4751-ab34-e0d4528985e2")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e, t, r = {
            3804: function(e) {
                e.exports = "https://css.rbxcdn.com/3e19a797e2ce0522.woff2"
            },
            5516: function(e) {
                e.exports = "https://css.rbxcdn.com/7f3ddcb5a3796526.woff2"
            },
            3647: function(e) {
                e.exports = "https://css.rbxcdn.com/5f8b8d5d1962b747.woff2"
            },
            4102: function(e) {
                e.exports = "https://css.rbxcdn.com/77cbcd18c888e0f1.woff2"
            },
            1625: function(e, t, r) {
                e.exports = {}
            }
        },
        o = {};

    function n(e) {
        var t = o[e];
        if (void 0 !== t) return t.exports;
        var c = o[e] = {
            exports: {}
        };
        return r[e](c, c.exports, n), c.exports
    }
    n.m = r, n.k = function(e) {
        return "" + e + ".css"
    }, n.g = function() {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || Function("return this")()
        } catch (e) {
            if ("object" == typeof window) return window
        }
    }(), n.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, n.r = function(e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, n.rv = function() {
        return "1.5.7"
    }, n.g.importScripts && (c = n.g.location + "");
    var c, i = n.g.document;
    if (!c && i && (i.currentScript && "SCRIPT" === i.currentScript.tagName.toUpperCase() && (c = i.currentScript.src), !c)) {
        var f = i.getElementsByTagName("script");
        if (f.length)
            for (var s = f.length - 1; s > -1 && (!c || !/^http(s?):/.test(c));) c = f[s--].src
    }
    if (!c) throw Error("Automatic publicPath is not supported in this browser");
    n.p = c.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), n.ruid = "bundler=rspack@1.5.7", n(1625), e = n(3647), t = n(5516), [e, t, n(4102), n(3804)].map(function(e) {
        return '<link rel="preload" as="font" type="font/woff2" crossorigin href="'.concat(e, '">')
    }).join("")
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Builder");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/builder-72a2183a708588f4.js.map