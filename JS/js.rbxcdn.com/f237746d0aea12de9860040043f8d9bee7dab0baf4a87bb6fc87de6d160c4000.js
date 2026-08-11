! function() {
    "use strict";
    var e = {},
        n = {};

    function t(o) {
        var r = n[o];
        if (void 0 !== r) return r.exports;
        var i = n[o] = {
            exports: {}
        };
        return e[o](i, i.exports, t), i.exports
    }
    t.d = function(e, n) {
        for (var o in n) t.o(n, o) && !t.o(e, o) && Object.defineProperty(e, o, {
            enumerable: !0,
            get: n[o]
        })
    }, t.o = function(e, n) {
        return Object.prototype.hasOwnProperty.call(e, n)
    }, t.r = function(e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, t.rv = function() {
        return "1.2.8"
    }, t.ruid = "bundler=rspack@1.2.8";
    var o = {};
    t.r(o), t.d(o, {
        getADFromCookie: function() {
            return c
        },
        readme: function() {
            return a
        },
        setADInCookie: function() {
            return l
        }
    });
    var r = {};
    t.r(r), t.d(r, {
        bundlesByName: function() {
            return d
        },
        readme: function() {
            return s
        }
    });
    var i = function() {
            var e, n = null !== (e = window.location.hostname) && void 0 !== e ? e : "";
            return n.substring(n.indexOf(".") + 1)
        },
        u = "WebAppComponentSuffix",
        a = "setADInCookie({AD username}) is for set AD into cookie; getADFromCookie() returns current Current AD from cookie. For more questions, ask in #web-frontend slack channel",
        c = function() {
            var e, n;
            return null !== (n = null === (e = document.cookie.split("; ").find(function(e) {
                return e.startsWith("".concat(u, "="))
            })) || void 0 === e ? void 0 : e.split("=")[1]) && void 0 !== n ? n : null
        },
        l = function(e) {
            document.cookie = "".concat(u, "=").concat(encodeURIComponent(e), "; path=/; domain=.").concat(i(), ";");
            var n = c();
            return "" === e && (null == n || "" === n) ? "You have reset back to master build" : n === e ? "Nice, you have set ".concat(e, " in cookie successfully!") : "Oh no, you have not set ".concat(e, " in cookie, could you try again ? or contact #web-frontend slack channel")
        },
        d = function() {
            var e = new Map,
                n = !0,
                t = !1,
                o = void 0;
            try {
                for (var r, i = Array.from(document.scripts).filter(function(e) {
                        return null != e.dataset.bundlename
                    })[Symbol.iterator](); !(n = (r = i.next()).done); n = !0) {
                    var u = r.value.dataset,
                        a = u.bundlename,
                        c = u.bundleSource,
                        l = u.bundleContext;
                    e.set(a, {
                        bundleSource: "Main" === c ? "Master Build" : "".concat(c, " Build"),
                        bundleContext: null != l ? l : ""
                    })
                }
            } catch (e) {
                t = !0, o = e
            } finally {
                try {
                    n || null == i.return || i.return()
                } finally {
                    if (t) throw o
                }
            }
            return e
        },
        s = "Master build means the official deployed build from admin site in the current environment; \n\n Validation Build means the current build is only deployed for validation (VPN users will see only); \n\n Development build is the resource from Engineer local build, depend on which AD setup in to cookie, check ConfigureWebApps.getADFromCookie(); \n\n Unknown Build might be translation string bundle or invalid ";

    function f(e) {
        for (var n = 1; n < arguments.length; n++) {
            var t = null != arguments[n] ? arguments[n] : {},
                o = Object.keys(t);
            "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(t).filter(function(e) {
                return Object.getOwnPropertyDescriptor(t, e).enumerable
            }))), o.forEach(function(n) {
                var o;
                o = t[n], n in e ? Object.defineProperty(e, n, {
                    value: o,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[n] = o
            })
        }
        return e
    }
    var b = f({}, o),
        m = f({}, r);
    window.ConfigureWebApps = b, window.StaticBundlesInfo = m
}();
//# debugId=bcbede86-d36a-46ba-b3ed-5da2f1b4f724
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/configureWebApps-38b0e6406a4075a5.js.map
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("ConfigureWebApps");