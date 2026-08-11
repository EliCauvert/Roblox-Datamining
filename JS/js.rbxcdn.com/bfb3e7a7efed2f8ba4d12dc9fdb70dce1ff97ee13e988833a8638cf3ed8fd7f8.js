! function() {
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
    r.n = function(e) {
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
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, r.rv = function() {
        return "1.2.8"
    }, r.ruid = "bundler=rspack@1.2.8";
    var o = {};
    r.r(o), r.d(o, {
        isAvailable: function() {
            return m
        },
        publish: function() {
            return v
        },
        subscribe: function() {
            return g
        },
        unsubscribe: function() {
            return b
        }
    });
    var a = {};
    r.r(a), r.d(a, {
        attachLogger: function() {
            return V
        },
        isAvailable: function() {
            return m
        },
        isMasterTab: function() {
            return B
        },
        subscribeToMasterChange: function() {
            return J
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
            return z
        },
        pubSub: function() {
            return $
        }
    });
    var u = function(e, t) {
            var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
            if ("string" == typeof e) n[e] = t;
            else {
                var r = function(e) {
                        if (Array.isArray(e)) return s(e)
                    }(e) || function(e) {
                        if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(e) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return s(e, void 0);
                            var n = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return s(e, t)
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
                        var m, d, g = l.value;
                        null !== (d = (m = a)[g]) && void 0 !== d || (m[g] = {}), a = a[g]
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
        c = window.jQuery,
        l = r.n(c),
        f = function() {
            var e = "roblox";
            try {
                return localStorage.setItem(e, e), localStorage.removeItem(e), !0
            } catch (e) {
                return !1
            }
        },
        m = function() {
            return f()
        },
        d = function(e, t) {
            return "storage.".concat(e, "_").concat(t)
        },
        g = function(e, t, n) {
            var r = d(e, t);
            l()(window).unbind(r).bind(r, function(t) {
                t.originalEvent.key === e && n(t.originalEvent.newValue)
            })
        },
        b = function(e, t) {
            var n = d(e, t);
            l()(window).unbind(n)
        },
        v = function(e, t) {
            localStorage.removeItem(e), localStorage.setItem(e, t)
        },
        y = "Roblox.CrossTabCommunication.Kingmaker",
        p = {
            masterId: "".concat(y, ".masterId"),
            electionInProgress: "".concat(y, ".electionInProgress"),
            masterIdRequest: "".concat(y, ".masterIdRequest"),
            masterIdResponse: "".concat(y, ".masterIdResponse"),
            masterLastResponseTime: "".concat(y, ".masterLastResponseTime")
        },
        I = "",
        x = null,
        h = !1,
        S = null,
        w = Date.now() - 1e4,
        T = Math.floor(100 * Math.random() + 1),
        M = 2e3 + T,
        R = 1500 + T,
        A = 400 + T,
        P = (e = new Date().getTime(), "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g, function(t) {
            var n = (e + 16 * Math.random()) % 16 | 0;
            return e = Math.floor(e / 16), ("x" === t ? n : 3 & n | 8).toString(16)
        })),
        C = [],
        D = [],
        O = function(e) {
            var t = !0,
                n = !1,
                r = void 0;
            try {
                for (var o, a = D[Symbol.iterator](); !(t = (o = a.next()).done); t = !0) {
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
        j = function() {
            O("Master is: ".concat(x))
        },
        L = function() {
            return Date.now().toString()
        },
        k = function(e) {
            O("Announcing: Is this tab the master? ".concat(e));
            var t = !0,
                n = !1,
                r = void 0;
            try {
                for (var o, a = C[Symbol.iterator](); !(t = (o = a.next()).done); t = !0) {
                    var i = o.value;
                    try {
                        i(e)
                    } catch (e) {
                        O("Error running subscribed election result handler: ".concat(JSON.stringify(e)))
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
        q = function() {
            O("Declaring myself as the master ".concat(x)), x = P, h = !0, v(p.masterId, x), localStorage.removeItem(p.electionInProgress), k(!0), l()(window).unbind("unload.".concat(y)).bind("unload.".concat(y), function() {
                localStorage.getItem(p.masterId)
            })
        },
        E = function() {
            var e = localStorage.getItem(p.electionInProgress);
            x = "", e ? (O("Election already in progress"), window.setTimeout(function() {
                0 === x.length ? q() : x !== P && k(!1), j()
            }, A)) : (O("Election not in progress"), localStorage.setItem(p.electionInProgress, L()), 0 === x.length ? q() : x !== P && k(!1), j())
        },
        _ = function() {
            O("Checking if Master still active"), !(!0 === h || Date.now() - w <= 2500) && (I = "", v(p.masterIdRequest, "q"), window.setTimeout(function() {
                if (0 === I.length) {
                    if (!0 === h || Date.now() - w <= 2500) {
                        q();
                        return
                    }
                    O("Master did not respond. Initiating election"), E()
                } else x !== I && (k(!1), x = I, j())
            }, R))
        },
        Q = function() {
            S && clearTimeout(S), S = window.setTimeout(function() {
                !1 === h ? _() : localStorage.setItem(p.masterLastResponseTime, L()), Q()
            }, M)
        },
        K = function() {
            O("Binding to events"), g(p.masterIdRequest, y, function(e) {
                !0 === h && "q" === e && (O("Query Received - Confirming Still Master"), v(p.masterIdResponse, P), localStorage.setItem(p.masterLastResponseTime, L()))
            }), g(p.masterId, y, function(e) {
                if (e) {
                    O("Received Notice Of Master"), w = Date.now();
                    var t = h;
                    !1 == (h = (x = e) === P) && t && (k(!1), Q()), !0 !== h || t || q(), localStorage.removeItem(p.electionInProgress), j()
                }
            }), g(p.masterIdResponse, y, function(e) {
                e ? (O("Master Responded to Query"), w = Date.now(), I = e, Q()) : O("Master Responded to Query - no message")
            })
        },
        N = function() {
            var e = localStorage.getItem(p.electionInProgress),
                t = parseInt(e, 10);
            e && Date.now() - t > 500 && localStorage.removeItem(p.electionInProgress), window.setTimeout(N, 500)
        },
        U = function() {
            var e = localStorage.getItem(p.masterId);
            K();
            var t = localStorage.getItem(p.masterLastResponseTime);
            w = t && 0 !== t.length ? parseInt(t, 10) : 0, e ? e === P ? h = !0 : w > 0 && Date.now() - w > 2e4 ? E() : _() : E(), window.setTimeout(function() {
                N()
            }, 500), Q()
        };
    l()(function() {
        m() && U()
    });
    var B = function() {
            return h
        },
        J = function(e) {
            C.push(e)
        },
        V = function(e) {
            D.push(e)
        },
        $ = o,
        z = a;
    u(["Roblox", "core-scripts", "util", "crossTabCommunication"], i), u(["Roblox", "CrossTabCommunication"], {
        PubSub: {
            IsAvailable: $.isAvailable,
            Publish: $.publish,
            Subscribe: $.subscribe,
            Unsubscribe: $.unsubscribe
        },
        Kingmaker: {
            IsAvailable: z.isAvailable,
            IsMasterTab: z.isMasterTab,
            SubscribeToMasterChange: z.subscribeToMasterChange,
            AttachLogger: z.attachLogger
        }
    })
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/crossTabCommunication-0c4ef429e155baff.js.map
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("CrossTabCommunication");