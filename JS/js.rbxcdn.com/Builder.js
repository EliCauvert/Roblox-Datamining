! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "837222793d053b739a1006d8d8100193c380b802"
        };
        var o = (new e.Error).stack;
        o && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[o] = "bc67c1c0-100c-41a4-932c-c6c3e2acaa0d", e._sentryDebugIdIdentifier = "sentry-dbid-bc67c1c0-100c-41a4-932c-c6c3e2acaa0d")
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
        c = {};

    function r(e) {
        var o = c[e];
        if (void 0 !== o) return o.exports;
        var n = c[e] = {
            exports: {}
        };
        return t[e](n, n.exports, r), n.exports
    }
    r.m = t, r.r = function(e) {
        "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, r.rv = function() {
        return "1.7.12"
    }, r.ruid = "bundler=rspack@1.7.12", e = r(1369), o = r(3366), [e, o, r(6668), r(9518)].map(function(e) {
        return '<link rel="preload" as="font" type="font/woff2" crossorigin href="'.concat(e, '">')
    }).join("")
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Builder");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/builder-cd1e223ad79de3c0.js.map