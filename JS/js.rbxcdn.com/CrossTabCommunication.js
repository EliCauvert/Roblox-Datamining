! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "3d359e452fffbb0d78c5c5b22408cc4b943c799a"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "e72a727d-6626-4ea6-acc5-f5ea6e21f79b", e._sentryDebugIdIdentifier = "sentry-dbid-e72a727d-6626-4ea6-acc5-f5ea6e21f79b")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e, t = {},
        n = {};

    function r(e) {
        var o = n[e];
        if (void 0 !== o) return o.exports;
        var a = n[e] = {
            exports: {}
        };
        return t[e](a, a.exports, r), a.exports
    }
    r.d = function(e, t) {
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
    var o = {};
    r.r(o), r.d(o, {
        isAvailable: function() {
            return l
        },
        publish: function() {
            return b
        },
        subscribe: function() {
            return m
        },
        unsubscribe: function() {
            return g
        }
    });
    var a = {};
    r.r(a), r.d(a, {
        attachLogger: function() {
            return Y
        },
        isAvailable: function() {
            return l
        },
        isMasterTab: function() {
            return J
        },
        subscribeToMasterChange: function() {
            return V
        }
    });
    var i = {};

    function s(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
        return r
    }
    r.r(i), r.d(i, {
        kingmaker: function() {
            return a
        },
        pubSub: function() {
            return o
        }
    });
    var u = function(e, t) {
            var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
            if ("string" == typeof e) n[e] = t;
            else {
                var r = function(e) {
                        if (Array.isArray(e)) return s(e)
                    }(e) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(e) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return s(e, void 0);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return s(e, void 0)
                        }
                    }(e) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    o = r.pop(),
                    a = n,
                    i = !0,
                    u = !1,
                    c = void 0;
                try {
                    for (var l, f = r[Symbol.iterator](); !(i = (l = f.next()).done); i = !0) {
                        var d, m = l.value;
                        null != (d = a)[m] || (d[m] = {}), a = a[m]
                    }
                } catch (e) {
                    u = !0, c = e
                } finally {
                    try {
                        i || null == f.return || f.return()
                    } finally {
                        if (u) throw c
                    }
                }
                a[o] = t
            }
        },
        c = function() {
            var e = "roblox";
            try {
                return localStorage.setItem(e, e), localStorage.removeItem(e), !0
            } catch (e) {
                return !1
            }
        },
        l = function() {
            return c()
        },
        f = function(e, t) {
            return "".concat(e, "_").concat(t)
        },
        d = new Map,
        m = function(e, t, n) {
            var r = f(e, t),
                o = d.get(r);
            o && window.removeEventListener("storage", o);
            var a = function(t) {
                t.key === e && n(t.newValue)
            };
            d.set(r, a), window.addEventListener("storage", a)
        },
        g = function(e, t) {
            var n = f(e, t),
                r = d.get(n);
            r && (window.removeEventListener("storage", r), d.delete(n))
        },
        b = function(e, t) {
            localStorage.removeItem(e), localStorage.setItem(e, t)
        },
        v = "Roblox.CrossTabCommunication.Kingmaker",
        y = {
            masterId: "".concat(v, ".masterId"),
            electionInProgress: "".concat(v, ".electionInProgress"),
            masterIdRequest: "".concat(v, ".masterIdRequest"),
            masterIdResponse: "".concat(v, ".masterIdResponse"),
            masterLastResponseTime: "".concat(v, ".masterLastResponseTime")
        },
        p = "",
        I = null,
        w = !1,
        x = null,
        h = null,
        S = Date.now() - 1e4,
        R = Math.floor(100 * Math.random() + 1),
        T = 2e3 + R,
        M = 1500 + R,
        D = 400 + R,
        E = (e = Date.now(), "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g, function(t) {
            var n = (e + 16 * Math.random()) % 16 | 0;
            return e = Math.floor(e / 16), ("x" === t ? n : 3 & n | 8).toString(16)
        })),
        L = [],
        A = [],
        P = function(e) {
            var t = !0,
                n = !1,
                r = void 0;
            try {
                for (var o, a = A[Symbol.iterator](); !(t = (o = a.next()).done); t = !0) {
                    var i = o.value;
                    try {
                        i(e)
                    } catch (e) {}
                }
            } catch (e) {
                n = !0, r = e
            } finally {
                try {
                    t || null == a.return || a.return()
                } finally {
                    if (n) throw r
                }
            }
        },
        C = function() {
            P("Master is: ".concat(I))
        },
        O = function() {
            return Date.now().toString()
        },
        k = function(e) {
            P("Announcing: Is this tab the master? ".concat(e));
            var t = !0,
                n = !1,
                r = void 0;
            try {
                for (var o, a = L[Symbol.iterator](); !(t = (o = a.next()).done); t = !0) {
                    var i = o.value;
                    try {
                        i(e)
                    } catch (e) {
                        P("Error running subscribed election result handler: ".concat(JSON.stringify(e)))
                    }
                }
            } catch (e) {
                n = !0, r = e
            } finally {
                try {
                    t || null == a.return || a.return()
                } finally {
                    if (n) throw r
                }
            }
        },
        _ = function() {
            P("Declaring myself as the master ".concat(I)), I = E, w = !0, b(y.masterId, I), localStorage.removeItem(y.electionInProgress), k(!0), x && window.removeEventListener("unload", x), x = function() {
                localStorage.getItem(y.masterId)
            }, window.addEventListener("unload", x)
        },
        j = function() {
            var e = localStorage.getItem(y.electionInProgress);
            I = "", e ? (P("Election already in progress"), window.setTimeout(function() {
                null != I && 0 === I.length ? _() : I !== E && k(!1), C()
            }, D)) : (P("Election not in progress"), localStorage.setItem(y.electionInProgress, O()), 0 === I.length ? _() : I !== E && k(!1), C())
        },
        q = function() {
            P("Checking if Master still active"), w || Date.now() - S <= 2500 || (p = "", b(y.masterIdRequest, "q"), window.setTimeout(function() {
                if (0 === p.length) {
                    if (w || Date.now() - S <= 2500) return void _();
                    P("Master did not respond. Initiating election"), j()
                } else I !== p && (k(!1), I = p, C())
            }, M))
        },
        B = function() {
            h && clearTimeout(h), h = window.setTimeout(function() {
                w ? localStorage.setItem(y.masterLastResponseTime, O()) : q(), B()
            }, T)
        },
        N = function() {
            P("Binding to events"), m(y.masterIdRequest, v, function(e) {
                w && "q" === e && (P("Query Received - Confirming Still Master"), b(y.masterIdResponse, E), localStorage.setItem(y.masterLastResponseTime, O()))
            }), m(y.masterId, v, function(e) {
                if (e) {
                    P("Received Notice Of Master"), S = Date.now();
                    var t = w;
                    (w = (I = e) === E) || !t || (k(!1), B()), w && !t && _(), localStorage.removeItem(y.electionInProgress), C()
                }
            }), m(y.masterIdResponse, v, function(e) {
                e ? (P("Master Responded to Query"), S = Date.now(), p = e, B()) : P("Master Responded to Query - no message")
            })
        },
        Q = function() {
            var e = localStorage.getItem(y.electionInProgress),
                t = parseInt(null != e ? e : "", 10);
            e && Date.now() - t > 500 && localStorage.removeItem(y.electionInProgress), window.setTimeout(Q, 500)
        },
        K = function() {
            var e = localStorage.getItem(y.masterId);
            N();
            var t = localStorage.getItem(y.masterLastResponseTime);
            S = t && 0 !== t.length ? parseInt(t, 10) : 0, e ? e === E ? w = !0 : S > 0 && Date.now() - S > 2e4 ? j() : q() : j(), window.setTimeout(function() {
                Q()
            }, 500), B()
        },
        U = function() {
            l() && K()
        };
    "u" > typeof document && ("loading" === document.readyState ? document.addEventListener("DOMContentLoaded", U) : U());
    var J = function() {
            return w
        },
        V = function(e) {
            L.push(e)
        },
        Y = function(e) {
            A.push(e)
        };
    u(["Roblox", "core-scripts", "util", "crossTabCommunication"], i), u(["Roblox", "CrossTabCommunication"], {
        PubSub: {
            IsAvailable: l,
            Publish: b,
            Subscribe: m,
            Unsubscribe: g
        },
        Kingmaker: {
            IsAvailable: l,
            IsMasterTab: J,
            SubscribeToMasterChange: V,
            AttachLogger: Y
        }
    })
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("CrossTabCommunication");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/crossTabCommunication-b73c1838f3ffedf1.js.map