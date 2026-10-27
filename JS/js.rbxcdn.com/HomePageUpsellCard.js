! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "e207e865fc624329eb8567cce692bfc3f455d694"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "e2b4a510-473c-4d1f-8f1f-073ef1ab38cd", e._sentryDebugIdIdentifier = "sentry-dbid-e2b4a510-473c-4d1f-8f1f-073ef1ab38cd")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e = {},
        t = {};

    function r(n) {
        var o = t[n];
        if (void 0 !== o) return o.exports;
        var a = t[n] = {
            exports: {}
        };
        return e[n](a, a.exports, r), a.exports
    }
    r.m = e, r.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return r.d(t, {
            a: t
        }), t
    }, r.d = function(e, t) {
        for (var n in t) r.o(t, n) && !r.o(e, n) && Object.defineProperty(e, n, {
            enumerable: !0,
            get: t[n]
        })
    }, r.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, r.r = function(e) {
        "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, r.rv = function() {
        return "1.7.12"
    }, r.ruid = "bundler=rspack@1.7.12";
    var n = window.Roblox["core-scripts"].http.http,
        o = window.Roblox["core-scripts"].guac;
    window.Roblox["core-scripts"].eventStream;
    var a = window.Roblox["core-scripts"].environmentUrls,
        i = r.n(a),
        u = i().apiGatewayUrl;

    function c(e, t, r, n, o, a, i) {
        try {
            var u = e[a](i),
                c = u.value
        } catch (e) {
            r(e);
            return
        }
        u.done ? t(c) : Promise.resolve(c).then(n, o)
    }
    i().voiceApi, window.Roblox.HomePageUpsellCardService = {
        getHomePageUpsellCardVariation: function() {
            return n.get({
                retryable: !1,
                withCredentials: !0,
                url: "".concat(u, "/upsellCard/type")
            }).then(function(e) {
                return e.data
            })
        },
        getVoicePolicy: function() {
            var e;
            return (e = function() {
                return function(e, t) {
                    var r, n, o, a = {
                            label: 0,
                            sent: function() {
                                if (1 & o[0]) throw o[1];
                                return o[1]
                            },
                            trys: [],
                            ops: []
                        },
                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                        u = Object.defineProperty;
                    return u(i, "next", {
                        value: c(0)
                    }), u(i, "throw", {
                        value: c(1)
                    }), u(i, "return", {
                        value: c(2)
                    }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                        value: function() {
                            return this
                        }
                    }), i;

                    function c(u) {
                        return function(c) {
                            var l = [u, c];
                            if (r) throw TypeError("Generator is already executing.");
                            for (; i && (i = 0, l[0] && (a = 0)), a;) try {
                                if (r = 1, n && (o = 2 & l[0] ? n.return : l[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, l[1])).done) return o;
                                switch (n = 0, o && (l = [2 & l[0], o.value]), l[0]) {
                                    case 0:
                                    case 1:
                                        o = l;
                                        break;
                                    case 4:
                                        return a.label++, {
                                            value: l[1],
                                            done: !1
                                        };
                                    case 5:
                                        a.label++, n = l[1], l = [0];
                                        continue;
                                    case 7:
                                        l = a.ops.pop(), a.trys.pop();
                                        continue;
                                    default:
                                        if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                            a = 0;
                                            continue
                                        }
                                        if (3 === l[0] && (!o || l[1] > o[0] && l[1] < o[3])) {
                                            a.label = l[1];
                                            break
                                        }
                                        if (6 === l[0] && a.label < o[1]) {
                                            a.label = o[1], o = l;
                                            break
                                        }
                                        if (o && a.label < o[2]) {
                                            a.label = o[2], a.ops.push(l);
                                            break
                                        }
                                        o[2] && a.ops.pop(), a.trys.pop();
                                        continue
                                }
                                l = t.call(e, a)
                            } catch (e) {
                                l = [6, e], n = 0
                            } finally {
                                r = o = 0
                            }
                            if (5 & l[0]) throw l[1];
                            return {
                                value: l[0] ? l[1] : void 0,
                                done: !0
                            }
                        }
                    }
                }(this, function(e) {
                    switch (e.label) {
                        case 0:
                            return [4, (0, o.callBehaviour)("free-communication-infographics")];
                        case 1:
                            return [2, e.sent()]
                    }
                })
            }, function() {
                var t = this,
                    r = arguments;
                return new Promise(function(n, o) {
                    var a = e.apply(t, r);

                    function i(e) {
                        c(a, n, o, i, u, "next", e)
                    }

                    function u(e) {
                        c(a, n, o, i, u, "throw", e)
                    }
                    i(void 0)
                })
            })()
        }
    }
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "HomePageUpsellCard");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/homePageUpsellCard-471545281d763dff.js.map