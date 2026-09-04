! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "7dd1427733ace37b11c373bec2ccb29663c84427"
        };
        var o = (new e.Error).stack;
        o && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[o] = "d851878d-d0d0-405d-ae73-b89972db874e", e._sentryDebugIdIdentifier = "sentry-dbid-d851878d-d0d0-405d-ae73-b89972db874e")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e, o, t = {
            9518: function(e) {
                e.exports = "https://css.rbxcdn.com/3e19a797e2ce0522.woff2"
            },
            3366: function(e) {
                e.exports = "https://css.rbxcdn.com/7f3ddcb5a3796526.woff2"
            },
            1369: function(e) {
                e.exports = "https://css.rbxcdn.com/5f8b8d5d1962b747.woff2"
            },
            6668: function(e) {
                e.exports = "https://css.rbxcdn.com/77cbcd18c888e0f1.woff2"
            }
        },
        r = {};

    function n(e) {
        var o = r[e];
        if (void 0 !== o) return o.exports;
        var d = r[e] = {
            exports: {}
        };
        return t[e](d, d.exports, n), d.exports
    }
    n.m = t, n.r = function(e) {
        "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, n.rv = function() {
        return "1.7.12"
    }, n.ruid = "bundler=rspack@1.7.12", e = n(1369), o = n(3366), [e, o, n(6668), n(9518)].map(function(e) {
        return '<link rel="preload" as="font" type="font/woff2" crossorigin href="'.concat(e, '">')
    }).join("")
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Builder");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/builder-cd1e223ad79de3c0.js.map