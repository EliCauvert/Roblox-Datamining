! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "294af7ba7a76d2f5eb5991ccb0123c62b29f38d0"
        };
        var o = (new e.Error).stack;
        o && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[o] = "9a495f1b-34c9-4ff1-8cb3-46f7985666eb", e._sentryDebugIdIdentifier = "sentry-dbid-9a495f1b-34c9-4ff1-8cb3-46f7985666eb")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e = {},
        o = {};

    function t(n) {
        var r = o[n];
        if (void 0 !== r) return r.exports;
        var u = o[n] = {
            exports: {}
        };
        return e[n](u, u.exports, t), u.exports
    }
    t.m = e, t.r = function(e) {
        "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, t.rv = function() {
        return "1.7.12"
    }, t.ruid = "bundler=rspack@1.7.12", ["https://cdn.foundation.roblox.com/current/fonts/builder-sans/BuilderSans-Regular.woff2", "https://cdn.foundation.roblox.com/current/fonts/builder-sans/BuilderSans-Medium.woff2", "https://cdn.foundation.roblox.com/current/fonts/builder-sans/BuilderSans-SemiBold.woff2", "https://cdn.foundation.roblox.com/current/fonts/builder-sans/BuilderSans-Bold.woff2"].map(function(e) {
        return '<link rel="preload" as="font" type="font/woff2" crossorigin href="'.concat(e, '">')
    }).join("")
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "Builder");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/builder-fa11f13cb27850e5.js.map