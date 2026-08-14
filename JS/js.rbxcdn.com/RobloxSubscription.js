! function() {
    try {
        var e = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "366bdfa7448497e2fedab9d3c8283a182a50cc01"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "d6b673f8-e5ff-4223-9598-b2047f66190d", e._sentryDebugIdIdentifier = "sentry-dbid-d6b673f8-e5ff-4223-9598-b2047f66190d")
    } catch (e) {}
}(),
function() {
    var e = {
            792: function(e, t, r) {
                function n(e) {
                    return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }
                var i = 0 / 0,
                    o = /^\s+|\s+$/g,
                    a = /^[-+]0x[0-9a-f]+$/i,
                    l = /^0b[01]+$/i,
                    c = /^0o[0-7]+$/i,
                    s = parseInt,
                    u = (void 0 === r.g ? "undefined" : n(r.g)) == "object" && r.g && r.g.Object === Object && r.g,
                    d = ("undefined" == typeof self ? "undefined" : n(self)) == "object" && self && self.Object === Object && self,
                    f = u || d || Function("return this")(),
                    p = Object.prototype.toString,
                    m = Math.max,
                    y = Math.min,
                    b = function() {
                        return f.Date.now()
                    };

                function h(e) {
                    var t = void 0 === e ? "undefined" : n(e);
                    return !!e && ("object" == t || "function" == t)
                }

                function v(e) {
                    if ("number" == typeof e) return e;
                    if ((void 0 === (t = e) ? "undefined" : n(t)) == "symbol" || t && (void 0 === t ? "undefined" : n(t)) == "object" && "[object Symbol]" == p.call(t)) return i;
                    if (h(e)) {
                        var t, r = "function" == typeof e.valueOf ? e.valueOf() : e;
                        e = h(r) ? r + "" : r
                    }
                    if ("string" != typeof e) return 0 === e ? e : +e;
                    e = e.replace(o, "");
                    var u = l.test(e);
                    return u || c.test(e) ? s(e.slice(2), u ? 2 : 8) : a.test(e) ? i : +e
                }
                e.exports = function(e, t, r) {
                    var n, i, o, a, l, c, s = 0,
                        u = !1,
                        d = !1,
                        f = !0;
                    if ("function" != typeof e) throw TypeError("Expected a function");

                    function p(t) {
                        var r = n,
                            o = i;
                        return n = i = void 0, s = t, a = e.apply(o, r)
                    }

                    function g(e) {
                        var r = e - c,
                            n = e - s;
                        return void 0 === c || r >= t || r < 0 || d && n >= o
                    }

                    function x() {
                        var e, r, n, i = b();
                        if (g(i)) return w(i);
                        l = setTimeout(x, (e = i - c, r = i - s, n = t - e, d ? y(n, o - r) : n))
                    }

                    function w(e) {
                        return (l = void 0, f && n) ? p(e) : (n = i = void 0, a)
                    }

                    function S() {
                        var e, r = b(),
                            o = g(r);
                        if (n = arguments, i = this, c = r, o) {
                            if (void 0 === l) return s = e = c, l = setTimeout(x, t), u ? p(e) : a;
                            if (d) return l = setTimeout(x, t), p(c)
                        }
                        return void 0 === l && (l = setTimeout(x, t)), a
                    }
                    return t = v(t) || 0, h(r) && (u = !!r.leading, o = (d = "maxWait" in r) ? m(v(r.maxWait) || 0, t) : o, f = "trailing" in r ? !!r.trailing : f), S.cancel = function() {
                        void 0 !== l && clearTimeout(l), s = 0, n = c = i = l = void 0
                    }, S.flush = function() {
                        return void 0 === l ? a : w(b())
                    }, S
                }
            },
            964: function(e, t) {
                "use strict";
                Object.defineProperty(t, "__esModule", {
                    value: !0
                });
                var r, n, i, o = {
                        exports: {}
                    },
                    a = o.exports = {};

                function l() {
                    throw Error("setTimeout has not been defined")
                }

                function c() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    r = "function" == typeof setTimeout ? setTimeout : l
                } catch (e) {
                    r = l
                }
                try {
                    n = "function" == typeof clearTimeout ? clearTimeout : c
                } catch (e) {
                    n = c
                }

                function s(e) {
                    if (r === setTimeout) return setTimeout(e, 0);
                    if ((r === l || !r) && setTimeout) return r = setTimeout, setTimeout(e, 0);
                    try {
                        return r(e, 0)
                    } catch (t) {
                        try {
                            return r.call(null, e, 0)
                        } catch (t) {
                            return r.call(this, e, 0)
                        }
                    }
                }
                var u = [],
                    d = !1,
                    f = -1;

                function p() {
                    d && i && (d = !1, i.length ? u = i.concat(u) : f = -1, u.length && m())
                }

                function m() {
                    if (!d) {
                        var e = s(p);
                        d = !0;
                        for (var t = u.length; t;) {
                            for (i = u, u = []; ++f < t;) i && i[f].run();
                            f = -1, t = u.length
                        }
                        i = null, d = !1,
                            function(e) {
                                if (n === clearTimeout) return clearTimeout(e);
                                if ((n === c || !n) && clearTimeout) return n = clearTimeout, clearTimeout(e);
                                try {
                                    n(e)
                                } catch (t) {
                                    try {
                                        return n.call(null, e)
                                    } catch (t) {
                                        return n.call(this, e)
                                    }
                                }
                            }(e)
                    }
                }

                function y(e, t) {
                    this.fun = e, this.array = t
                }

                function b() {}

                function h() {}
                a.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var r = 1; r < arguments.length; r++) t[r - 1] = arguments[r];
                    u.push(new y(e, t)), 1 !== u.length || d || s(m)
                }, y.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, a.title = "browser", a.browser = !0, a.env = {}, a.argv = [], a.version = "", a.versions = {}, a.on = b, a.addListener = b, a.once = b, a.off = b, a.removeListener = b, a.removeAllListeners = b, a.emit = b, a.prependListener = b, a.prependOnceListener = b, a.listeners = function(e) {
                    return []
                }, a.binding = function(e) {
                    throw Error("process.binding is not supported")
                }, a.cwd = function() {
                    return "/"
                }, a.chdir = function(e) {
                    throw Error("process.chdir is not supported")
                }, a.umask = function() {
                    return 0
                };
                var v = o.exports.browser,
                    g = o.exports.binding,
                    x = {},
                    w = "browser",
                    S = "browser",
                    O = "browser",
                    P = [],
                    E = {
                        nextTick: o.exports.nextTick,
                        title: o.exports.title,
                        browser: v,
                        env: o.exports.env,
                        argv: o.exports.argv,
                        version: o.exports.version,
                        versions: o.exports.versions,
                        on: o.exports.on,
                        addListener: o.exports.addListener,
                        once: o.exports.once,
                        off: o.exports.off,
                        removeListener: o.exports.removeListener,
                        removeAllListeners: o.exports.removeAllListeners,
                        emit: o.exports.emit,
                        emitWarning: h,
                        prependListener: o.exports.prependListener,
                        prependOnceListener: o.exports.prependOnceListener,
                        listeners: o.exports.listeners,
                        binding: g,
                        cwd: o.exports.cwd,
                        chdir: o.exports.chdir,
                        umask: o.exports.umask,
                        exit: h,
                        pid: 1,
                        features: x,
                        kill: h,
                        dlopen: h,
                        uptime: h,
                        memoryUsage: h,
                        uvCounters: h,
                        platform: w,
                        arch: S,
                        execPath: O,
                        execArgv: P
                    };
                t.addListener = o.exports.addListener, t.arch = S, t.argv = o.exports.argv, t.binding = g, t.browser = v, t.chdir = o.exports.chdir, t.cwd = o.exports.cwd, t.default = E, t.dlopen = h, t.emit = o.exports.emit, t.emitWarning = h, t.env = o.exports.env, t.execArgv = P, t.execPath = O, t.exit = h, t.features = x, t.kill = h, t.listeners = o.exports.listeners, t.memoryUsage = h, t.nextTick = o.exports.nextTick, t.off = o.exports.off, t.on = o.exports.on, t.once = o.exports.once, t.pid = 1, t.platform = w, t.prependListener = o.exports.prependListener, t.prependOnceListener = o.exports.prependOnceListener, t.removeAllListeners = o.exports.removeAllListeners, t.removeListener = o.exports.removeListener, t.title = o.exports.title, t.umask = o.exports.umask, t.uptime = h, t.uvCounters = h, t.version = o.exports.version, t.versions = o.exports.versions, t = e.exports = E
            },
            160: function(e, t, r) {
                "use strict";
                e.exports = {}
            }
        },
        t = {};

    function r(n) {
        var i = t[n];
        if (void 0 !== i) return i.exports;
        var o = t[n] = {
            exports: {}
        };
        return e[n](o, o.exports, r), o.exports
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
    }, r.k = function(e) {
        return "" + e + ".css"
    }, r.g = function() {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || Function("return this")()
        } catch (e) {
            if ("object" == typeof window) return window
        }
    }(), r.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, r.r = function(e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, r.nc = void 0, r.rv = function() {
        return "1.5.7"
    }, r.g.importScripts && (n = r.g.location + "");
    var n, i = r.g.document;
    if (!n && i && (i.currentScript && "SCRIPT" === i.currentScript.tagName.toUpperCase() && (n = i.currentScript.src), !n)) {
        var o = i.getElementsByTagName("script");
        if (o.length)
            for (var a = o.length - 1; a > -1 && (!n || !/^http(s?):/.test(n));) n = o[a--].src
    }
    if (!n) throw Error("Automatic publicPath is not supported in this browser");
    r.p = n.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), r.ruid = "bundler=rspack@1.5.7",
        function() {
            "use strict";
            var e, t, n, i, o, a, l, c, s, u, d, f, p, m, y, b, h, v, g, x, w = window.ReactJSX,
                S = window.Roblox["core-scripts"].react,
                O = window.Roblox["core-scripts"].util.ready,
                P = r.n(O),
                E = JSON.parse('{"P":["Feature.RobloxSubscription"]}'),
                j = window.TanstackQuery;

            function T(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var N = function(e, t) {
                return (N = Object.setPrototypeOf || T({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function I(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function r() {
                    this.constructor = e
                }
                N(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
            }
            var D = function() {
                return (D = Object.assign || function(e) {
                    for (var t, r = 1, n = arguments.length; r < n; r++)
                        for (var i in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                    return e
                }).apply(this, arguments)
            };

            function C(e, t, r, n) {
                return new(r || (r = Promise))(function(i, o) {
                    function a(e) {
                        try {
                            c(n.next(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function l(e) {
                        try {
                            c(n.throw(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function c(e) {
                        var t;
                        e.done ? i(e.value) : (T(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, l)
                    }
                    c((n = n.apply(e, t || [])).next())
                })
            }

            function A(e, t) {
                var r, n, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(c) {
                        var s = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                            switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function k(e, t, r) {
                if (r || 2 == arguments.length)
                    for (var n, i = 0, o = t.length; i < o; i++) !n && i in t || (n || (n = Array.prototype.slice.call(t, 0, i)), n[i] = t[i]);
                return e.concat(n || Array.prototype.slice.call(t))
            }
            "function" == typeof SuppressedError && SuppressedError;
            var M = {
                    envName: ""
                },
                R = !1,
                _ = function() {
                    try {
                        if ("undefined" == typeof window) return D({}, M);
                        var e = localStorage.getItem("Roblox.MrRouterConfig");
                        if (null == e) return D({}, M);
                        var t = JSON.parse(e);
                        if ("object" != (void 0 === t ? "undefined" : t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) || null === t) return D({}, M);
                        var r = D(D({}, M), "envName" in t && "string" == typeof t.envName && {
                            envName: t.envName
                        });
                        return r.envName && !R && (R = !0, console.warn('[MrRouter] Routing to non-production environment: "'.concat(r.envName, '"'))), r
                    } catch (e) {
                        return D({}, M)
                    }
                },
                L = "mrrouter-env",
                U = "tracestate",
                B = "traceparent",
                F = function(e) {
                    var t = e.indexOf("=");
                    return (-1 === t ? e : e.slice(0, t)).trim()
                },
                z = function(e, t) {
                    var r = "".concat(L, "=").concat(encodeURIComponent(t)),
                        n = null == e ? void 0 : e.trim(),
                        i = n ? n.split(",") : [],
                        o = i.findIndex(function(e) {
                            return F(e) === L
                        });
                    if (-1 === o) return k(k([], i.map(function(e) {
                        return e.trim()
                    }), !0), [r], !1).join(",");
                    var a = i.filter(function(e) {
                        return F(e) !== L
                    }).map(function(e) {
                        return e.trim()
                    });
                    return a.splice(o, 0, r), a.join(",")
                },
                G = function(e) {
                    var t = new Uint8Array(e);
                    return crypto.getRandomValues(t), Array.from(t, function(e) {
                        return e.toString(16).padStart(2, "0")
                    }).join("")
                },
                W = "undefined" != typeof crypto && "function" == typeof crypto.randomUUID,
                V = function() {
                    return W ? crypto.randomUUID().replaceAll("-", "").slice(0, 32) : G(16)
                },
                q = function() {
                    return W ? crypto.randomUUID().replaceAll("-", "").slice(0, 16) : G(8)
                },
                K = function(e) {
                    var t = _().envName;
                    if (t.length > 0 && (e[U] = z(e[U], t), !e[B])) {
                        var r = V(),
                            n = q();
                        e[B] = "00-".concat(r, "-").concat(n, "-01")
                    }
                };

            function H(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            r(964);
            var X, Y = function(e) {
                    return e.replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/\d+/, "/number")
                },
                $ = function(e, t) {
                    return !1 === t.ok && !1 === [401, 403, 404].includes(t.status) && e(Error("Network error"), {
                        tags: {
                            apiUrl: Y(t.url),
                            apiStatus: null == t ? void 0 : t.status,
                            cors: !1
                        }
                    }), t
                },
                J = function(e, t) {
                    e(Error("Network error"), {
                        tags: {
                            apiUrl: Y(t),
                            cors: !0
                        }
                    })
                },
                Z = function() {
                    function e(e) {
                        this.captureException = e
                    }
                    return e.prototype.post = function(e) {
                        return C(this, void 0, void 0, function() {
                            return A(this, function(t) {
                                return [2, $(this.captureException, e.response)]
                            })
                        })
                    }, e.prototype.onError = function(e) {
                        return C(this, void 0, void 0, function() {
                            return A(this, function(t) {
                                return J(this.captureException, e.url), [2]
                            })
                        })
                    }, e
                }(),
                Q = function(e) {
                    if (document) {
                        var t, r, n = document.getElementById("hba-frame");
                        return null === n && ((t = document.createElement("iframe")).id = "hba-frame", t.style.cssText = "position: fixed; top: 0; left: 0; width: 0%; height: 0%; z-index: -1", t.src = "https://www.".concat(e, "/hba/iframe"), r = t, n = (null == document ? void 0 : document.body) ? document.body.appendChild(r) : null), n
                    }
                    return null
                },
                ee = function() {
                    var e = window.location.hostname.split(".").slice(0, -2).join(".");
                    return e.includes("create") ? "creator_hub" : e.includes("advertise") ? "ads_manager" : "creator_hub"
                },
                et = function(e, t) {
                    try {
                        fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                            method: "POST",
                            body: JSON.stringify({
                                name: "load_time_hba_frame",
                                value: t,
                                labelValues: {
                                    origin_site: ee()
                                }
                            })
                        })
                    } catch (e) {}
                },
                er = function(e, t) {
                    try {
                        fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                            method: "POST",
                            body: JSON.stringify({
                                name: "response_time_hba_frame",
                                value: t,
                                labelValues: {
                                    origin_site: ee()
                                }
                            })
                        })
                    } catch (e) {}
                },
                en = function(e, t, r) {
                    return void 0 === r && (r = 1500), new Promise(function(n, i) {
                        var o, a, l = performance.now(),
                            c = window.setTimeout(function() {
                                et(e, performance.now() - l),
                                    function(e) {
                                        try {
                                            fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                                method: "POST",
                                                body: JSON.stringify({
                                                    name: "event_hba_frame",
                                                    value: 1,
                                                    labelValues: {
                                                        event_type: "FrameLoadTimedOut",
                                                        origin_site: ee()
                                                    }
                                                })
                                            })
                                        } catch (e) {}
                                    }(e), i(Error("Promise timed out after ".concat(r, " ms")))
                            }, r),
                            s = o = function(t) {
                                var r = t.data;
                                t.origin === "https://www.".concat(e) && "dataFromHbaFrame" === r.msg && "loaded" === r.data.type && (window.removeEventListener("message", o, !1), window.clearTimeout(c), et(e, performance.now() - l), n())
                            };
                        window.addEventListener("message", s, !1), null == (a = t.contentWindow) || a.postMessage({
                            msg: "checkLoadedRequest"
                        }, "https://www.".concat(e))
                    })
                },
                ei = function(e, t, r, n, i, o, a) {
                    var l;
                    if (void 0 === a && (a = 100), window) {
                        var c, s = performance.now(),
                            u = window.setTimeout(function() {
                                er(r, performance.now() - s),
                                    function(e) {
                                        try {
                                            fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                                method: "POST",
                                                body: JSON.stringify({
                                                    name: "event_hba_frame",
                                                    value: 1,
                                                    labelValues: {
                                                        event_type: "FrameResponseTimedOut",
                                                        origin_site: ee()
                                                    }
                                                })
                                            })
                                        } catch (e) {}
                                    }(r), e({
                                        url: i.url,
                                        init: i.init
                                    })
                            }, a),
                            d = c = function(t) {
                                var n = t.data,
                                    a = i.url,
                                    l = i.init;
                                if (t.origin === "https://www.".concat(r) && "dataFromHbaFrame" === n.msg && "batHeader" === n.data.type && (!n.data.identifier || n.data.identifier === o))
                                    if (!n.data.isError && n.data.batHeader) {
                                        window.clearTimeout(u), window.removeEventListener("message", c, !1), er(r, performance.now() - s);
                                        var d = n.data.batHeader;
                                        e({
                                            url: a,
                                            init: D(D({}, l), {
                                                headers: D(D({}, l.headers), {
                                                    "x-bound-auth-token": d["x-bound-auth-token"]
                                                })
                                            })
                                        })
                                    } else window.clearTimeout(u), window.removeEventListener("message", c, !1), er(r, performance.now() - s), e({
                                        url: a,
                                        init: l
                                    })
                            };
                        window.addEventListener("message", d, !1), null == (l = n.contentWindow) || l.postMessage({
                            msg: "signSubdomainRequest",
                            identifier: o,
                            serializedSubdomainRequestData: JSON.stringify({
                                url: i.url,
                                requestInit: i.init
                            })
                        }, "https://www.".concat(r))
                    }
                },
                eo = function() {
                    return crypto.randomUUID()
                },
                ea = function() {
                    function e(e, t, r) {
                        void 0 === t && (t = 1500), void 0 === r && (r = 100), this.robloxSiteDomain = e, this.hbaFrameAlreadyLoaded = !1, this.hbaFrameLoadFailed = !1, this.hbaFrame = null, this.loadTimeOut = t, this.dataTimeOut = r
                    }
                    return e.prototype.getOrCreateHbaFrame = function() {
                        return Q(this.robloxSiteDomain)
                    }, e.prototype.pre = function(e) {
                        var t = this;
                        return new Promise(function(r, n) {
                            var i = e.url,
                                o = e.init;
                            if (t.hbaFrame = t.getOrCreateHbaFrame(), null !== t.hbaFrame) {
                                var a = eo();
                                t.hbaFrameAlreadyLoaded ? ei(r, 0, t.robloxSiteDomain, t.hbaFrame, e, a, t.dataTimeOut) : t.hbaFrameLoadFailed ? r({
                                    url: i,
                                    init: o
                                }) : en(t.robloxSiteDomain, t.hbaFrame, t.loadTimeOut).then(function() {
                                    t.hbaFrame ? (t.hbaFrameAlreadyLoaded = !0, ei(r, 0, t.robloxSiteDomain, t.hbaFrame, e, a, t.dataTimeOut)) : r({
                                        url: i,
                                        init: o
                                    })
                                }).catch(function() {
                                    t.hbaFrameLoadFailed = !0, r({
                                        url: i,
                                        init: o
                                    })
                                })
                            } else r({
                                url: i,
                                init: o
                            })
                        })
                    }, e
                }();
            (n = X || (X = {})).UNKNOWN = "unknown", n.INVALIDATED = "invalidated", n.ABANDONED = "abandoned", n.LOADFAILED = "loadfailed";
            var el = function(e) {
                    function t(t) {
                        var r = e.call(this, "challenge error for challenge kind ".concat(t.kind)) || this;
                        return r.parameters = t, r
                    }
                    return I(t, e), t.prototype.match = function(e) {
                        return this.parameters.kind === e.parameters.kind && JSON.stringify(this.parameters.data) === JSON.stringify(e.parameters.data)
                    }, t.prototype.matchAbandoned = function(e) {
                        return this.match(e) && e.parameters.kind === X.ABANDONED
                    }, t
                }(Error),
                ec = "rblx-challenge-id",
                es = "rblx-challenge-type",
                eu = "rblx-challenge-metadata",
                ed = function(e, t) {
                    return 403 === e.status && e.headers.has(ec) && e.headers.has(es) && e.headers.has(eu) && "iframe" === t
                },
                ef = function(e) {
                    var t, r, n, i, o, a, l, c, s, u = e.url,
                        d = e.request,
                        f = e.response,
                        p = e.robloxSiteDomain,
                        m = (o = new URLSearchParams([
                            ["challenge-type", "generic"],
                            ["dark-mode", "true"],
                            ["barista-mode", "true"],
                            ["generic-challenge-type", null != (t = f.headers.get(es)) ? t : ""],
                            ["generic-challenge-id", null != (r = f.headers.get(ec)) ? r : ""],
                            ["challenge-metadata-json", null != (n = f.headers.get(eu)) ? n : ""],
                            ["origin", null != (i = window.location.hostname.split(".").slice(0, -2).join(".")) ? i : ""]
                        ]), a = new URL("https://www.".concat(p, "/challenge/cdn/hybrid?").concat(o.toString())), (l = document.createElement("iframe")).id = "challenge-frame", l.allowFullscreen = !0, l.setAttribute("allowtransparency", "true"), l.setAttribute("allow", "publickey-credentials-get;publickey-credentials-create"), l.style.cssText = "position: fixed; top: 0; left: 0; width: 100%; height: 100%; visibility: hidden; color-scheme: normal; border: none; z-index: 2147483647;", l.src = a.toString(), l.onload = function() {
                            l.style.visibility = "visible"
                        }, c = l, document && document.body ? document.body.appendChild(c) : null);
                    return new Promise(function(e, t) {
                        window && m && (s = function(r) {
                            var n, i, o, a, l, c, s, p, m, y, b;
                            if (r.data && r.data.genericChallengeResponse) switch (r.data.genericChallengeResponse.type) {
                                case "challengeAbandoned":
                                    t(new el({
                                        kind: X.ABANDONED,
                                        data: {
                                            challengeType: null != (n = f.headers.get(es)) ? n : ""
                                        }
                                    }));
                                    break;
                                case "challengeDisplayed":
                                    break;
                                case "challengeCompleted":
                                    (s = r.data.genericChallengeResponse.data).challengeType && s.metadata ? e((p = s.metadata, fetch(u, D(D({}, d), {
                                        headers: D(D({}, d.headers), ((m = {})[ec] = null != (y = f.headers.get(ec)) ? y : "", m[eu] = btoa(JSON.stringify(p)), m[es] = null != (b = f.headers.get(es)) ? b : "", m))
                                    })))) : t(new el({
                                        kind: X.UNKNOWN,
                                        data: {
                                            challengeType: null != (i = f.headers.get(es)) ? i : ""
                                        }
                                    }));
                                    break;
                                case "challengeInvalidated":
                                    t((s = r.data.genericChallengeResponse.data) && s.challengeType && s.metadata ? new el({
                                        kind: X.INVALIDATED,
                                        data: s
                                    }) : new el({
                                        kind: X.INVALIDATED,
                                        data: {
                                            challengeType: null != (o = f.headers.get(es)) ? o : ""
                                        }
                                    }));
                                    break;
                                case "challengeParsed":
                                    !1 === (s = r.data.genericChallengeResponse.data).parsed && t(new el({
                                        kind: X.UNKNOWN,
                                        data: {
                                            challengeType: null != (a = f.headers.get(es)) ? a : ""
                                        }
                                    }));
                                    break;
                                case "challengeInitialized":
                                    !1 === (s = r.data.genericChallengeResponse.data).initialized && t(new el({
                                        kind: X.UNKNOWN,
                                        data: {
                                            challengeType: null != (l = f.headers.get(es)) ? l : ""
                                        }
                                    }));
                                    break;
                                case "challengePageLoaded":
                                    !1 === (s = r.data.genericChallengeResponse.data).pageLoaded && t(new el({
                                        kind: X.LOADFAILED,
                                        data: {
                                            challengeType: null != (c = f.headers.get(es)) ? c : ""
                                        }
                                    }))
                            }
                        }, window.addEventListener("message", s, !1))
                    }).finally(function() {
                        null == m || m.remove(), s && window.removeEventListener("message", s, !1)
                    })
                },
                ep = function() {
                    function e(e, t) {
                        void 0 === t && (t = "iframe"), this.robloxSiteDomain = e, this.genericChallengeMiddlewareType = t
                    }
                    return e.prototype.post = function(e) {
                        var t = e.url,
                            r = e.init,
                            n = e.response;
                        return ed(n, this.genericChallengeMiddlewareType) ? ef({
                            url: t,
                            request: r,
                            response: n,
                            robloxSiteDomain: this.robloxSiteDomain
                        }) : Promise.resolve(n)
                    }, e
                }(),
                em = function(e) {
                    var t = e.elapsedTime,
                        r = e.url,
                        n = e.status,
                        i = e.schemaPath;
                    return {
                        eventName: "apiVitals",
                        parameters: {
                            elapsedTime: String(t),
                            apiUrl: r,
                            statusCode: String(n),
                            schemaPath: i
                        }
                    }
                },
                ey = function() {
                    function e(e) {
                        this.unifiedLogger = e
                    }
                    return e.prototype.post = function(e) {
                        return this.unifiedLogger.logApiVitalsEvent(em({
                            elapsedTime: e.elapsedTime,
                            url: e.url,
                            status: e.response.status,
                            schemaPath: e.schemaPath
                        })), Promise.resolve(e.response)
                    }, e
                }(),
                eb = "x-csrf-token",
                eh = ["POST", "PATCH", "DELETE", "PUT"],
                ev = function() {
                    var e, t = "";
                    try {
                        "undefined" != typeof window && (t = null != (e = localStorage.getItem(eb)) ? e : "")
                    } catch (e) {
                        console.warn("Error reading localStorage key “".concat(eb, "”:"), e)
                    }
                    return t
                },
                eg = ev(),
                ex = function(e) {
                    try {
                        eg = e, "undefined" != typeof window && localStorage.setItem(eb, e)
                    } catch (e) {
                        console.warn("Error setting localStorage key “".concat(eb, "”:"), e)
                    }
                },
                ew = function() {
                    function e() {
                        this.currentToken = ev()
                    }
                    return e.prototype.pre = function(e) {
                        var t, r = e.url,
                            n = e.init,
                            i = this.currentToken;
                        return n.headers && "object" == ((t = n.headers) && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) && eb in n.headers && (i = n.headers[eb]) && (this.currentToken = i, ex(i)), n.method && eh.includes(n.method) ? Promise.resolve({
                            url: r,
                            init: this.prepareRequestInit(n)
                        }) : Promise.resolve({
                            url: r,
                            init: n
                        })
                    }, e.prototype.post = function(e) {
                        var t = e.fetch,
                            r = e.url,
                            n = e.init,
                            i = e.response,
                            o = i.headers.get(eb);
                        return 403 === i.status && i.headers.has(eb) && null !== o ? (this.currentToken = o, ex(o), t(r, this.prepareRequestInit(n))) : Promise.resolve(i)
                    }, e.prototype.prepareRequestInit = function(e) {
                        var t;
                        return D(D({}, e), {
                            headers: D(D({}, e.headers), ((t = {})[eb] = this.currentToken, t))
                        })
                    }, e
                }(),
                eS = [],
                eO = function(e) {
                    eS = eS.filter(function(t) {
                        return t !== e
                    })
                },
                eP = function(e) {
                    var t = e.url;
                    503 === e.status && eS.forEach(function(e) {
                        return e(t)
                    })
                },
                eE = function() {
                    function e() {}
                    return e.prototype.subscribe = function(e) {
                        return eS.push(e),
                            function() {
                                return eO(e)
                            }
                    }, e.prototype.unsubscribe = function(e) {
                        return eO(e)
                    }, e.prototype.post = function(e) {
                        var t = e.response;
                        return eP(t), Promise.resolve(t)
                    }, e
                }(),
                ej = function() {
                    function e() {}
                    return e.prototype.pre = function(e) {
                        var t = e.url,
                            r = e.init;
                        if (!_().envName) return Promise.resolve({
                            url: t,
                            init: r
                        });
                        var n = D({}, r.headers);
                        return K(n), Promise.resolve({
                            url: t,
                            init: D(D({}, r), {
                                headers: n
                            })
                        })
                    }, e
                }(),
                eT = new ew,
                eN = new eE,
                eI = [function(e) {
                    return e.captureException ? new Z(e.captureException) : void 0
                }, function(e) {
                    return e.robloxSiteDomain && e.enableBoundAuthToken ? new ea(e.robloxSiteDomain, e.boundAuthTokenLoadTimeout, e.boundAuthTokenDataTimeout) : void 0
                }, function(e) {
                    return e.robloxSiteDomain ? new ep(e.robloxSiteDomain, e.genericChallengeMiddlewareType) : void 0
                }, function(e) {
                    return e.unifiedLogger ? new ey(e.unifiedLogger) : void 0
                }, function() {
                    return eT
                }, function() {
                    return eN
                }, function(e) {
                    return e.enableMrRouter ? new ej : void 0
                }],
                eD = function() {
                    function e(e) {
                        void 0 === e && (e = {}), this.configuration = e
                    }
                    return Object.defineProperty(e.prototype, "config", {
                        set: function(e) {
                            this.configuration = e
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(e.prototype, "basePath", {
                        get: function() {
                            return this.configuration.basePath
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(e.prototype, "fetchApi", {
                        get: function() {
                            return this.configuration.fetchApi || window.fetch.bind(window)
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(e.prototype, "middleware", {
                        get: function() {
                            return this.configuration.middleware || []
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(e.prototype, "queryParamsStringify", {
                        get: function() {
                            return this.configuration.queryParamsStringify || function e(t, r) {
                                return void 0 === r && (r = ""), Object.keys(t).map(function(n) {
                                    return function t(r, n, i) {
                                        void 0 === i && (i = "");
                                        var o = i + (i.length ? "[".concat(r, "]") : r);
                                        if (H(n, Array)) {
                                            var a = n.map(function(e) {
                                                return encodeURIComponent(String(e))
                                            }).join("&".concat(encodeURIComponent(o), "="));
                                            return "".concat(encodeURIComponent(o), "=").concat(a)
                                        }
                                        return H(n, Set) ? t(r, Array.from(n), i) : H(n, Date) ? "".concat(encodeURIComponent(o), "=").concat(encodeURIComponent(n.toISOString())) : H(n, Object) ? e(n, o) : "".concat(encodeURIComponent(o), "=").concat(encodeURIComponent(String(n)))
                                    }(n, t[n], r)
                                }).filter(function(e) {
                                    return e.length > 0
                                }).join("&")
                            }
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(e.prototype, "username", {
                        get: function() {
                            return this.configuration.username
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(e.prototype, "password", {
                        get: function() {
                            return this.configuration.password
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(e.prototype, "apiKey", {
                        get: function() {
                            var e = this.configuration.apiKey;
                            if (e) return "function" == typeof e ? e : function() {
                                return e
                            }
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(e.prototype, "accessToken", {
                        get: function() {
                            var e = this,
                                t = this.configuration.accessToken;
                            if (t) return "function" == typeof t ? t : function() {
                                return C(e, void 0, void 0, function() {
                                    return A(this, function(e) {
                                        return [2, t]
                                    })
                                })
                            }
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(e.prototype, "headers", {
                        get: function() {
                            return this.configuration.headers
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(e.prototype, "credentials", {
                        get: function() {
                            return this.configuration.credentials
                        },
                        enumerable: !1,
                        configurable: !0
                    }), e
                }(),
                eC = new eD,
                eA = function() {
                    function e(e) {
                        void 0 === e && (e = eC);
                        var t = this;
                        this.configuration = e, this.fetchApi = function(e, r, n) {
                            return C(t, void 0, void 0, function() {
                                var t, i, o, a, l, c, s, u, d, f, p, m, y, b = this;
                                return A(this, function(h) {
                                    switch (h.label) {
                                        case 0:
                                            t = function(e, t) {
                                                return b.fetchApi(e, t, n)
                                            }, i = {
                                                url: e,
                                                init: r
                                            }, o = 0, a = this.middleware, h.label = 1;
                                        case 1:
                                            return o < a.length ? (y = a[o]).pre ? [4, y.pre(D({
                                                fetch: t
                                            }, i))] : [3, 3] : [3, 4];
                                        case 2:
                                            i = h.sent() || i, h.label = 3;
                                        case 3:
                                            return o++, [3, 1];
                                        case 4:
                                            l = void 0, c = performance.now(), h.label = 5;
                                        case 5:
                                            return h.trys.push([5, 7, , 12]), [4, (this.configuration.fetchApi || fetch)(i.url, i.init)];
                                        case 6:
                                            return l = h.sent(), s = performance.now(), [3, 12];
                                        case 7:
                                            u = h.sent(), s = performance.now(), d = 0, f = this.middleware, h.label = 8;
                                        case 8:
                                            return d < f.length ? (y = f[d]).onError ? [4, y.onError({
                                                fetch: t,
                                                url: i.url,
                                                init: i.init,
                                                error: u,
                                                response: l ? l.clone() : void 0
                                            })] : [3, 10] : [3, 11];
                                        case 9:
                                            l = h.sent() || l, h.label = 10;
                                        case 10:
                                            return d++, [3, 8];
                                        case 11:
                                            if (void 0 === l) throw H(u, Error) ? new eM(u, "The request failed and the interceptors did not return an alternative response") : u;
                                            return [3, 12];
                                        case 12:
                                            p = 0, m = this.middleware, h.label = 13;
                                        case 13:
                                            return p < m.length ? (y = m[p]).post ? [4, y.post({
                                                fetch: t,
                                                url: i.url,
                                                init: i.init,
                                                response: l.clone(),
                                                elapsedTime: s - c,
                                                schemaPath: n
                                            })] : [3, 15] : [3, 16];
                                        case 14:
                                            l = h.sent() || l, h.label = 15;
                                        case 15:
                                            return p++, [3, 13];
                                        case 16:
                                            return [2, l]
                                    }
                                })
                            })
                        }, this.middleware = e.middleware
                    }
                    return e.prototype.withMiddleware = function() {
                        for (var e, t = [], r = 0; r < arguments.length; r++) t[r] = arguments[r];
                        var n = this.clone();
                        return n.middleware = (e = n.middleware).concat.apply(e, t), n
                    }, e.prototype.withPreMiddleware = function() {
                        for (var e = [], t = 0; t < arguments.length; t++) e[t] = arguments[t];
                        var r = e.map(function(e) {
                            return {
                                pre: e
                            }
                        });
                        return this.withMiddleware.apply(this, r)
                    }, e.prototype.withPostMiddleware = function() {
                        for (var e = [], t = 0; t < arguments.length; t++) e[t] = arguments[t];
                        var r = e.map(function(e) {
                            return {
                                post: e
                            }
                        });
                        return this.withMiddleware.apply(this, r)
                    }, e.prototype.isJsonMime = function(t) {
                        return !!t && e.jsonRegex.test(t)
                    }, e.prototype.request = function(e, t) {
                        return C(this, void 0, void 0, function() {
                            var r, n, i, o;
                            return A(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        return [4, this.createFetchParams(e, t)];
                                    case 1:
                                        return n = (r = a.sent()).url, i = r.init, [4, this.fetchApi(n, i, e.schemaPath)];
                                    case 2:
                                        if ((o = a.sent()) && o.status >= 200 && o.status < 300) return [2, o];
                                        throw new ek(o, "Response from ".concat(o.url, " returned an error code ").concat(o.status))
                                }
                            })
                        })
                    }, e.prototype.createFetchParams = function(e, t) {
                        return C(this, void 0, void 0, function() {
                            var r, n, i, o, a, l, c, s = this;
                            return A(this, function(u) {
                                var d, f;
                                switch (u.label) {
                                    case 0:
                                        return r = this.configuration.basePath + e.path, void 0 !== e.query && 0 !== Object.keys(e.query).length && (r += "?" + this.configuration.queryParamsStringify(e.query)), Object.keys(n = Object.assign({}, this.configuration.headers, e.headers)).forEach(function(e) {
                                            return void 0 === n[e] ? delete n[e] : {}
                                        }), i = "function" == typeof t ? t : function() {
                                            return C(s, void 0, void 0, function() {
                                                return A(this, function(e) {
                                                    return [2, t]
                                                })
                                            })
                                        }, o = {
                                            method: e.method,
                                            headers: n,
                                            body: e.body,
                                            credentials: this.configuration.credentials
                                        }, l = [D({}, o)], [4, i({
                                            init: o,
                                            context: e
                                        })];
                                    case 1:
                                        return a = D.apply(void 0, l.concat([u.sent()])), c = D(D({}, a), {
                                            body: (d = a.body, "undefined" != typeof FormData && H(d, FormData) || H(a.body, URLSearchParams) || (f = a.body, "undefined" != typeof Blob && H(f, Blob)) ? a.body : JSON.stringify(a.body))
                                        }), [2, {
                                            url: r,
                                            init: c
                                        }]
                                }
                            })
                        })
                    }, e.prototype.clone = function() {
                        var e = new(0, this.constructor)(this.configuration);
                        return e.middleware = this.middleware.slice(), e
                    }, e.jsonRegex = RegExp("^(:?application/json|[^;/ 	]+/[^;/ 	]+[+]json)[ 	]*(:?;.*)?$", "i"), e
                }(),
                ek = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.response = t, n.name = "ResponseError", n
                    }
                    return I(t, e), t
                }(Error),
                eM = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.cause = t, n.name = "FetchError", n
                    }
                    return I(t, e), t
                }(Error),
                eR = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.field = t, n.name = "RequiredError", n
                    }
                    return I(t, e), t
                }(Error);

            function e_(e, t) {
                return null != e[t]
            }
            var eL = function() {
                    function e(e, t) {
                        void 0 === t && (t = function(e) {
                            return e
                        }), this.raw = e, this.transformer = t
                    }
                    return e.prototype.value = function() {
                        return C(this, void 0, void 0, function() {
                            var e;
                            return A(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return e = this.transformer, [4, this.raw.json()];
                                    case 1:
                                        return [2, e.apply(this, [t.sent()])]
                                }
                            })
                        })
                    }, e
                }(),
                eU = ((function(e) {
                    this.raw = e
                }).prototype.value = function() {
                    return C(this, void 0, void 0, function() {
                        return A(this, function(e) {
                            return [2, void 0]
                        })
                    })
                }, (function(e) {
                    this.raw = e
                }).prototype.value = function() {
                    return C(this, void 0, void 0, function() {
                        return A(this, function(e) {
                            switch (e.label) {
                                case 0:
                                    return [4, this.raw.blob()];
                                case 1:
                                    return [2, e.sent()]
                            }
                        })
                    })
                }, (function(e) {
                    this.raw = e
                }).prototype.value = function() {
                    return C(this, void 0, void 0, function() {
                        return A(this, function(e) {
                            switch (e.label) {
                                case 0:
                                    return [4, this.raw.text()];
                                case 1:
                                    return [2, e.sent()]
                            }
                        })
                    })
                }, function(e) {
                    function t(t) {
                        void 0 === t && (t = {});
                        var r, n = D({}, t),
                            i = n.middleware || [];
                        return i.unshift.apply(i, (r = t, eI.map(function(e) {
                            return e(r)
                        }).filter(function(e) {
                            return e
                        }))), n.middleware = i, e.call(this, n) || this
                    }
                    return I(t, e), t
                }(eD));

            function eB(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var eF = function(e, t) {
                return (eF = Object.setPrototypeOf || eB({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function ez(e, t, r, n) {
                return new(r || (r = Promise))(function(i, o) {
                    function a(e) {
                        try {
                            c(n.next(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function l(e) {
                        try {
                            c(n.throw(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function c(e) {
                        var t;
                        e.done ? i(e.value) : (eB(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, l)
                    }
                    c((n = n.apply(e, t || [])).next())
                })
            }

            function eG(e, t) {
                var r, n, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(c) {
                        var s = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                            switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function eW(e) {
                return e
            }
            "function" == typeof SuppressedError && SuppressedError;

            function eV(e, t) {
                return null == e ? e : {
                    currencyCode: e.currencyCode,
                    units: e.units,
                    nanos: e.nanos
                }
            }

            function eq(e) {
                return e
            }

            function eK(e) {
                var t, r;
                return null == (t = e) ? t : {
                    offerType: e_(t, "offerType") ? t.offerType : void 0,
                    freeTrialOffer: e_(t, "freeTrialOffer") ? null == (r = t.freeTrialOffer) ? r : {
                        periodType: r.periodType,
                        duration: r.duration,
                        estimatedTrialEndDate: e_(r, "estimatedTrialEndDate") ? null === r.estimatedTrialEndDate ? null : new Date(r.estimatedTrialEndDate) : void 0
                    } : void 0
                }
            }
            var eH = "Blackbird";

            function eX(e) {
                var t;
                return null == (t = e) ? t : {
                    type: t.type,
                    id: t.id
                }
            }

            function eY(e) {
                var t;
                return null == (t = e) ? t : {
                    tierId: t.tierId,
                    periodIndex: t.periodIndex,
                    discountPercent: t.discountPercent
                }
            }

            function e$(e) {
                var t, r, n, i, o, a, l;
                return null == (t = e) ? t : {
                    productKey: eX(t.productKey),
                    periodType: t.periodType,
                    periodCount: t.periodCount,
                    localizedPrice: eV(t.localizedPrice),
                    localizedPriceDisplayString: t.localizedPriceDisplayString,
                    localizedStrikethroughPrice: eV(t.localizedStrikethroughPrice),
                    localizedStrikethroughPriceDisplayString: t.localizedStrikethroughPriceDisplayString,
                    productTypeDetails: null == (r = t.productTypeDetails) ? r : {
                        currencySubscriptionProductDetails: e_(r, "currencySubscriptionProductDetails") ? null == (n = r.currencySubscriptionProductDetails) ? n : {
                            currencyType: n.currencyType,
                            entitledAmountMicros: n.entitledAmountMicros
                        } : void 0,
                        developerSubscriptionProductDetails: e_(r, "developerSubscriptionProductDetails") ? null == (i = r.developerSubscriptionProductDetails) ? i : {
                            universeId: i.universeId,
                            imageAssetId: i.imageAssetId,
                            localizedName: i.localizedName,
                            localizedDescription: i.localizedDescription
                        } : void 0,
                        robloxSubscriptionProductDetails: e_(r, "robloxSubscriptionProductDetails") ? null == (o = r.robloxSubscriptionProductDetails) ? o : {
                            featureConfig: null == (a = o.featureConfig) ? a : {
                                virtualTransactionDiscounts: null === a.virtualTransactionDiscounts ? null : a.virtualTransactionDiscounts.map(eY),
                                isRobuxTransferEnabled: a.isRobuxTransferEnabled,
                                isTradingEnabled: a.isTradingEnabled,
                                isUgcPublishingEnabled: a.isUgcPublishingEnabled,
                                privateServerDiscounts: null === a.privateServerDiscounts ? null : a.privateServerDiscounts.map(eY),
                                currencySubscriptionConfig: null == (l = a.currencySubscriptionConfig) ? l : {
                                    currencyType: l.currencyType,
                                    entitledAmountMicros: l.entitledAmountMicros
                                }
                            }
                        } : void 0
                    },
                    eligibleOffers: t.eligibleOffers.map(eK)
                }
            }

            function eJ(e) {
                var t, r, n, i, o, a, l;
                return null == (t = e) ? t : {
                    productKey: eX(t.productKey),
                    periodType: t.periodType,
                    displayPrice: eV(t.displayPrice),
                    activationTimestampMs: t.activationTimestampMs,
                    expirationTimestampMs: t.expirationTimestampMs,
                    nextRenewalTimestampMs: t.nextRenewalTimestampMs,
                    paymentProvider: eq(t.paymentProvider),
                    purchasePlatform: t.purchasePlatform,
                    paymentProfile: null == (r = t.paymentProfile) ? r : {
                        id: r.id,
                        cardInfo: null == (n = r.cardInfo) ? n : {
                            cardNetwork: n.cardNetwork,
                            lastFourDigits: n.lastFourDigits,
                            expirationMonth: n.expirationMonth,
                            expirationYear: n.expirationYear
                        }
                    },
                    activeOffers: t.activeOffers.map(eK),
                    productTypeMembershipDetails: null == (i = t.productTypeMembershipDetails) ? i : {
                        robloxSubscriptionMembershipDetails: e_(i, "robloxSubscriptionMembershipDetails") ? null == (o = i.robloxSubscriptionMembershipDetails) ? o : {
                            features: null == (a = o.features) ? a : {
                                productType: a.productType,
                                virtualTransactionDiscountTierId: a.virtualTransactionDiscountTierId,
                                isRobuxTransferEnabled: a.isRobuxTransferEnabled,
                                isTradingEnabled: a.isTradingEnabled,
                                isUgcPublishingEnabled: a.isUgcPublishingEnabled,
                                privateServerDiscountTierId: a.privateServerDiscountTierId
                            },
                            currencySubscriptionBenefit: null == (l = o.currencySubscriptionBenefit) ? l : {
                                currencyType: l.currencyType,
                                entitledAmountMicrosPerGrantingPeriod: l.entitledAmountMicrosPerGrantingPeriod,
                                grantingPeriodType: l.grantingPeriodType
                            }
                        } : void 0
                    },
                    productInfo: e$(t.productInfo)
                }
            }
            var eZ = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return function(e, t) {
                        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                        function r() {
                            this.constructor = e
                        }
                        eF(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
                    }(t, e), t.prototype.subscriptionsV2GetProductDisplayPriceRaw = function(e, t) {
                        return ez(this, void 0, void 0, function() {
                            var r, n;
                            return eG(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eR("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eR("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        return r = {}, n = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(i.sent(), function(e) {
                                            return null == e ? e : {
                                                displayPrice: eV(e.displayPrice)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductDisplayPrice = function(e, t) {
                        return ez(this, void 0, void 0, function() {
                            return eG(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2GetProductDisplayPriceRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductPaymentMetadataRaw = function(e, t) {
                        return ez(this, void 0, void 0, function() {
                            var r, n;
                            return eG(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eR("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eR("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/payment-metadata".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(i.sent(), function(e) {
                                            return null == e ? e : {
                                                paymentMethods: e.paymentMethods.map(eW),
                                                paymentProviders: e.paymentProviders.map(eq)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductPaymentMetadata = function(e, t) {
                        return ez(this, void 0, void 0, function() {
                            return eG(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2GetProductPaymentMetadataRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetSubscriptionProductInfoRaw = function(e, t) {
                        return ez(this, void 0, void 0, function() {
                            var r, n;
                            return eG(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eR("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eR("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(i.sent(), function(e) {
                                            return null == e ? e : {
                                                subscriptionProductInfo: e$(e.subscriptionProductInfo)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetSubscriptionProductInfo = function(e, t) {
                        return ez(this, void 0, void 0, function() {
                            return eG(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2GetSubscriptionProductInfoRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListAvailableSubscriptionProductsRaw = function(e, t) {
                        return ez(this, void 0, void 0, function() {
                            var r, n;
                            return eG(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return r = {}, void 0 !== e.productType && (r.ProductType = e.productType), void 0 !== e.includePurchased && (r.IncludePurchased = e.includePurchased), void 0 !== e.includeBundles && (r.IncludeBundles = e.includeBundles), void 0 !== e.purchasePlatform && (r.PurchasePlatform = e.purchasePlatform), void 0 !== e.skipEligibilityCheck && (r.SkipEligibilityCheck = e.skipEligibilityCheck), void 0 !== e.grantType && (r.GrantType = e.grantType), void 0 !== e.paymentProvider && (r.PaymentProvider = e.paymentProvider), n = {}, [4, this.request({
                                            path: "/v2/products",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(i.sent(), function(e) {
                                            return null == e ? e : {
                                                productKeys: e.productKeys.map(eX),
                                                products: e.products.map(e$)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListAvailableSubscriptionProducts = function() {
                        return ez(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eG(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2ListAvailableSubscriptionProductsRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListSubscriptionsRaw = function(e, t) {
                        return ez(this, void 0, void 0, function() {
                            var r, n;
                            return eG(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return r = {}, void 0 !== e.productType && (r.ProductType = e.productType), void 0 !== e.expirationTimestampMsStart && (r.ExpirationTimestampMsStart = e.expirationTimestampMsStart), void 0 !== e.expirationTimestampMsEnd && (r.ExpirationTimestampMsEnd = e.expirationTimestampMsEnd), void 0 !== e.cursor && (r.Cursor = e.cursor), void 0 !== e.resultsPerPage && (r.ResultsPerPage = e.resultsPerPage), n = {}, [4, this.request({
                                            path: "/v2/user/subscriptions",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(i.sent(), function(e) {
                                            return null == e ? e : {
                                                subscriptions: e.subscriptions.map(eJ),
                                                hasMore: e.hasMore,
                                                cursor: e.cursor
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListSubscriptions = function() {
                        return ez(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eG(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2ListSubscriptionsRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2PreparePurchaseV2Raw = function(e, t) {
                        return ez(this, void 0, void 0, function() {
                            var r, n;
                            return eG(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eR("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eR("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                                        return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxUniverseId && null !== e.robloxUniverseId && (n["Roblox-Universe-Id"] = String(e.robloxUniverseId)), [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/prepare-purchase".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            method: "POST",
                                            headers: n,
                                            query: r,
                                            body: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    paymentProvider: e.paymentProvider,
                                                    universeId: e.universeId,
                                                    paymentProviderPurchaseOptions: function(e) {
                                                        if (void 0 !== e) return null === e ? null : {
                                                            stripePurchaseOptions: function(e) {
                                                                if (void 0 !== e) return null === e ? null : {
                                                                    cancelUrlPathName: e.cancelUrlPathName,
                                                                    successUrlPathName: e.successUrlPathName
                                                                }
                                                            }(e.stripePurchaseOptions),
                                                            appleAppStorePurchaseOptions: function(e) {
                                                                if (void 0 !== e) return null === e ? null : {
                                                                    providerCountryCode: e.providerCountryCode
                                                                }
                                                            }(e.appleAppStorePurchaseOptions),
                                                            braintreePurchaseOptions: function(e) {
                                                                if (void 0 !== e) return null === e ? null : {
                                                                    paymentMethod: e.paymentMethod
                                                                }
                                                            }(e.braintreePurchaseOptions)
                                                        }
                                                    }(e.paymentProviderPurchaseOptions),
                                                    paymentSessionId: e.paymentSessionId
                                                }
                                            }(e.preparePurchaseV2Request)
                                        }, t)];
                                    case 1:
                                        return [2, new eL(i.sent(), function(e) {
                                            var t, r, n, i, o, a;
                                            return null == e ? e : {
                                                paymentProvider: eq(e.paymentProvider),
                                                providerPurchasePayload: null == (t = e.providerPurchasePayload) ? t : {
                                                    stripePurchasePayload: e_(t, "stripePurchasePayload") ? null == (r = t.stripePurchasePayload) ? r : {
                                                        checkoutUrl: r.checkoutUrl
                                                    } : void 0,
                                                    appleAppStorePurchasePayload: e_(t, "appleAppStorePurchasePayload") ? null == (n = t.appleAppStorePurchasePayload) ? n : {
                                                        appAccountToken: n.appAccountToken,
                                                        partnerBillingJwtToken: n.partnerBillingJwtToken,
                                                        partnerBillingGenericProductId: n.partnerBillingGenericProductId
                                                    } : void 0,
                                                    googlePlayStorePurchasePayload: e_(t, "googlePlayStorePurchasePayload") ? null == (i = t.googlePlayStorePurchasePayload) ? i : {
                                                        providerProductId: i.providerProductId,
                                                        providerProductType: i.providerProductType,
                                                        chargeRequestId: i.chargeRequestId,
                                                        offerId: e_(i, "offerId") ? i.offerId : void 0
                                                    } : void 0,
                                                    creditBalancePurchasePayload: e_(t, "creditBalancePurchasePayload") ? null == (o = t.creditBalancePurchasePayload) ? o : {
                                                        checkoutUrl: o.checkoutUrl
                                                    } : void 0,
                                                    braintreePurchasePayload: e_(t, "braintreePurchasePayload") ? null == (a = t.braintreePurchasePayload) ? a : {
                                                        productToken: a.productToken,
                                                        price: a.price,
                                                        currencyCode: a.currencyCode,
                                                        clientAuthorizationToken: a.clientAuthorizationToken
                                                    } : void 0
                                                },
                                                nativeProviderPurchasePayloadString: e.nativeProviderPurchasePayloadString
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2PreparePurchaseV2 = function(e, t) {
                        return ez(this, void 0, void 0, function() {
                            return eG(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2PreparePurchaseV2Raw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t
                }(eA),
                eQ = window.Roblox["core-scripts"].guac,
                e0 = window.Roblox["core-scripts"].meta.device,
                e1 = "roblox_subscription_redirect_url",
                e2 = window.React,
                e3 = r.n(e2),
                e4 = function() {
                    for (var e, t, r = 0, n = "", i = arguments.length; r < i; r++)(e = arguments[r]) && (t = function e(t) {
                        var r, n, i = "";
                        if ("string" == typeof t || "number" == typeof t) i += t;
                        else if ("object" == (void 0 === t ? "undefined" : t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t))
                            if (Array.isArray(t)) {
                                var o = t.length;
                                for (r = 0; r < o; r++) t[r] && (n = e(t[r])) && (i && (i += " "), i += n)
                            } else
                                for (n in t) t[n] && (i && (i += " "), i += n);
                        return i
                    }(e)) && (n && (n += " "), n += t);
                    return n
                },
                e6 = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                e5 = e3().forwardRef(function(e, t) {
                    var r = e.name,
                        n = e.size,
                        i = e.className,
                        o = (e.children, function(e, t) {
                            if (null == e) return {};
                            var r, n, i = function(e, t) {
                                if (null == e) return {};
                                var r, n, i = {},
                                    o = Object.keys(e);
                                for (n = 0; n < o.length; n++) r = o[n], t.indexOf(r) >= 0 || (i[r] = e[r]);
                                return i
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var o = Object.getOwnPropertySymbols(e);
                                for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r])
                            }
                            return i
                        }(e, ["name", "size", "className", "children"]));
                    return e3().createElement("span", function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                var n;
                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = n
                            })
                        }
                        return e
                    }({
                        ref: t,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: e4("grow-0 shrink-0 basis-auto icon", r, e6[void 0 === n ? "Medium" : n], i)
                    }, o))
                });
            e5.displayName = "Icon";
            var e8 = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                e7 = function(e) {
                    var t = e.className;
                    return e3().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: e4("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                e9 = "opacity-[0.5]",
                te = function(e) {
                    var t = e.width,
                        r = e.height;
                    return e3().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, e3().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function tt(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tr(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function tn() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = tr(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : tr(t[e], null)
                        }
                    }
                }
            }

            function ti() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return e2.useCallback(tn.apply(void 0, function(e) {
                    if (Array.isArray(e)) return tt(e)
                }(t) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tt(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tt(e, t)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function to(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ta(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function tl(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function tc(e, t) {
                if (null == e) return {};
                var r, n, i = function(e, t) {
                    if (null == e) return {};
                    var r, n, i = {},
                        o = Object.keys(e);
                    for (n = 0; n < o.length; n++) r = o[n], t.indexOf(r) >= 0 || (i[r] = e[r]);
                    return i
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r])
                }
                return i
            }

            function ts(e) {
                return function(e) {
                    if (Array.isArray(e)) return to(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return to(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return to(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tu(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var td = Symbol.for("react.lazy"),
                tf = e2[" use ".trim().toString()];

            function tp(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : tu(e)) === "object" && "$$typeof" in e && e.$$typeof === td && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : tu(t)) === "object" && null !== t && "then" in t
            }
            var tm = ((e = e2.forwardRef(function(e, t) {
                    var r = e.children,
                        n = tc(e, ["children"]);
                    if (tp(r) && "function" == typeof tf && (r = tf(r._payload)), e2.isValidElement(r)) {
                        var i, o, a, l, c, s = (c = (l = null == (o = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (c = (l = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                            u = function(e, t) {
                                var r = ta({}, t);
                                for (var n in t) ! function(n) {
                                    var i = e[n],
                                        o = t[n];
                                    /^on[A-Z]/.test(n) ? i && o ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = o.apply(void 0, ts(t));
                                        return i.apply(void 0, ts(t)), n
                                    } : i && (r[n] = i) : "style" === n ? r[n] = ta({}, i, o) : "className" === n && (r[n] = [i, o].filter(Boolean).join(" "))
                                }(n);
                                return ta({}, e, r)
                            }(n, r.props);
                        return r.type !== e2.Fragment && (u.ref = t ? tn(t, s) : s), e2.cloneElement(r, u)
                    }
                    return e2.Children.count(r) > 1 ? e2.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), i = e, (o = e2.forwardRef(function(e, t) {
                    var r = e.children,
                        n = tc(e, ["children"]);
                    tp(r) && "function" == typeof tf && (r = tf(r._payload));
                    var o = e2.Children.toArray(r),
                        a = o.find(tb);
                    if (a) {
                        var l = a.props.children,
                            c = o.map(function(e) {
                                return e !== a ? e : e2.Children.count(l) > 1 ? e2.Children.only(null) : e2.isValidElement(l) ? l.props.children : null
                            });
                        return (0, w.jsx)(i, tl(ta({}, n), {
                            ref: t,
                            children: e2.isValidElement(l) ? e2.cloneElement(l, void 0, c) : null
                        }))
                    }
                    return (0, w.jsx)(i, tl(ta({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), o),
                ty = Symbol("radix.slottable");

            function tb(e) {
                return e2.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === ty
            }

            function th(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function tv(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function tg(e, t) {
                if (null == e) return {};
                var r, n, i = function(e, t) {
                    if (null == e) return {};
                    var r, n, i = {},
                        o = Object.keys(e);
                    for (n = 0; n < o.length; n++) r = o[n], t.indexOf(r) >= 0 || (i[r] = e[r]);
                    return i
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r])
                }
                return i
            }
            var tx = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                tw = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                tS = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                tO = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                tP = (0, e2.forwardRef)(function(e, t) {
                    var r = e.children,
                        n = e.className,
                        i = e.style,
                        o = e.isDisabled,
                        a = void 0 !== o && o,
                        l = e.isLoading,
                        c = void 0 !== l && l,
                        s = e.icon,
                        u = e.size,
                        d = void 0 === u ? "Large" : u,
                        f = e.variant,
                        p = void 0 === f ? "Emphasis" : f,
                        m = e.asChild,
                        y = tg(e, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        b = e4("foundation-web-button", a ? e9 : [e8, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", tw[d], a ? tO[p] : tS[p], n),
                        h = th({
                            textDecoration: "none"
                        }, i),
                        v = function(e) {
                            return e3().createElement(e3().Fragment, null, e3().createElement(e7, null), c && e3().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, e3().createElement(te, {
                                width: tx[d],
                                height: tx[d]
                            })), e3().createElement("span", {
                                className: e4("flex items-center min-width-0", "Large" === d || "Medium" === d ? "gap-small" : "gap-xsmall", c && "invisible")
                            }, s && e3().createElement(e5, {
                                name: s,
                                size: d
                            }), e3().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (m) {
                        y.as;
                        var g = tg(y, ["as"]),
                            x = e3().Children.only(r);
                        return e3().createElement(tm, tv(th({
                            ref: t
                        }, g), {
                            className: b,
                            style: h,
                            "aria-disabled": a || void 0
                        }), e3().cloneElement(x, {}, v(x.props.children)))
                    }
                    if ("a" === y.as) {
                        y.as;
                        var w = y.href,
                            S = tg(y, ["as", "href"]);
                        return e3().createElement("a", tv(th({
                            ref: t
                        }, S), {
                            "aria-disabled": a,
                            href: a ? void 0 : w,
                            className: b,
                            style: h
                        }), v(r))
                    }
                    y.as;
                    var O = tg(y, ["as"]);
                    return e3().createElement("button", tv(th({
                        ref: t,
                        type: "button"
                    }, O), {
                        disabled: a,
                        className: b,
                        style: h
                    }), v(r))
                }),
                tE = function() {
                    var e = (0, S.useTranslation)().translate,
                        t = (0, e2.useCallback)(function() {
                            window.history.back()
                        }, []);
                    return (0, w.jsxs)("div", {
                        className: "height-[210px] gap-y-small margin-top-[240px] flex flex-col items-center",
                        children: [(0, w.jsx)(e5, {
                            className: "content-muted !size-1400",
                            name: "icon-regular-triangle-exclamation"
                        }), (0, w.jsx)("p", {
                            className: "text-heading-small",
                            children: e("Message.Error.Generic")
                        }), (0, w.jsxs)("div", {
                            className: "gap-x-medium padding-top-medium flex",
                            children: [(0, w.jsx)(tP, {
                                className: "min-width-[96px]",
                                size: "Small",
                                variant: "SoftEmphasis",
                                onClick: t,
                                children: e("Action.Back")
                            }), (0, w.jsx)(tP, {
                                as: "a",
                                className: "min-width-[96px]",
                                href: "/home",
                                size: "Small",
                                variant: "Standard",
                                children: e("Action.Home")
                            })]
                        })]
                    })
                };

            function tj(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }
            var tT = (0, e2.createContext)(null),
                tN = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-medium"
                },
                tI = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                tD = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                tC = (0, e2.forwardRef)(function(e, t) {
                    var r = e.isContained,
                        n = e.size,
                        i = e.divider,
                        o = e.alignment,
                        a = e.title,
                        l = e.isTitleBold,
                        c = e.text,
                        s = e.isMultiline,
                        u = e.metadata,
                        d = e.description,
                        f = e.leading,
                        p = e.trailing,
                        m = e.onSelect,
                        y = e.className,
                        b = void 0 === u && void 0 === d && void 0 === o && void 0 === n;
                    if ((void 0 !== c || void 0 !== s) && !b) throw Error('ListItem: Cannot use deprecated "text" or "isMultiline" props with "metadata", "description", "alignment", or "size".');
                    var h = null != n ? n : "Large",
                        v = void 0 !== m,
                        g = v ? "button" : "div",
                        x = !!b && s,
                        w = "Top" === o ? "justify-start" : "justify-center";
                    x && (w = "justify-start");
                    var S = e3().createElement(g, tj({
                            className: e4("bg-none width-full flex gap-medium stroke-none foundation-web-list-item padding-y-none", r ? "padding-x-medium" : "padding-x-xlarge", "Full" === i && "foundation-web-list-item-bottom-divider", v && "relative clip group/interactable focus-visible:outline-focus disabled:outline-none", v && "cursor-pointer", y)
                        }, v && {
                            onClick: function() {
                                return m()
                            }
                        }), v && e3().createElement(e7, null), f && e3().createElement("div", {
                            className: e4("flex flex-col padding-y-large", w)
                        }, f), e3().createElement("div", {
                            className: "flex fill clip-x padding-y-large gap-x-medium relative "
                        }, e3().createElement("div", {
                            className: e4("flex flex-col fill clip-x justify-center", x && "gap-xsmall")
                        }, a && e3().createElement("div", {
                            className: e4("content-emphasis text-align-x-start", void 0 === l || l ? tI[h] : tD[h])
                        }, a), b && c && e3().createElement("div", {
                            className: e4("content-default text-align-x-start", tN[h], !s && "text-truncate-split text-no-wrap")
                        }, c), !b && u && e3().createElement("div", {
                            className: e4("content-default text-align-x-start text-truncate-split text-no-wrap", tN[h])
                        }, u), !b && d && e3().createElement("div", {
                            className: e4("content-default text-align-x-start padding-top-xsmall", tN[h])
                        }, d)), p && e3().createElement("div", {
                            className: e4("flex flex-col", w)
                        }, p), "Inset" === i && e3().createElement("div", {
                            className: "foundation-web-list-item-inset-divider"
                        }))),
                        O = (0, e2.useMemo)(function() {
                            return {
                                size: h
                            }
                        }, [h]);
                    return e3().createElement("li", {
                        ref: t,
                        style: {
                            listStyle: "none"
                        }
                    }, e3().createElement(tT.Provider, {
                        value: O
                    }, S))
                });
            tC.displayName = "ListItem";
            var tA = (0, e2.forwardRef)(function(e, t) {
                var r = e.children,
                    n = e.className,
                    i = e.as,
                    o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = function(e, t) {
                            if (null == e) return {};
                            var r, n, i = {},
                                o = Object.keys(e);
                            for (n = 0; n < o.length; n++) r = o[n], t.indexOf(r) >= 0 || (i[r] = e[r]);
                            return i
                        }(e, t);
                        if (Object.getOwnPropertySymbols) {
                            var o = Object.getOwnPropertySymbols(e);
                            for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r])
                        }
                        return i
                    }(e, ["children", "className", "as"]);
                return e3().createElement(void 0 === i ? "ul" : i, tj({
                    ref: t,
                    className: e4("foundation-web-list", n)
                }, o), r)
            });
            tA.displayName = "List";
            var tk = "height-full min-width-0 grow-1 gap-x-large radius-medium !bg-surface-100 stroke-standard stroke-default padding-medium box-border flex items-center",
                tM = function(e) {
                    var t = e.expandedPrimary,
                        r = e.expandedSecondary,
                        n = e.iconName,
                        i = e.onTileClick,
                        o = e.primary,
                        a = e.secondary,
                        l = (0, w.jsxs)(e2.Fragment, {
                            children: [(0, w.jsx)("div", {
                                className: "flex shrink-0 items-center justify-center",
                                children: (0, w.jsx)(e5, {
                                    name: n,
                                    size: "Large"
                                })
                            }), (0, w.jsxs)("div", {
                                className: "min-width-0 grow-1 gap-xsmall flex flex-col justify-center",
                                children: [(0, w.jsx)("div", {
                                    className: "text-title-medium content-emphasis text-align-x-start",
                                    children: o
                                }), (0, w.jsx)("div", {
                                    className: "text-body-medium content-default text-align-x-start",
                                    children: a
                                })]
                            })]
                        });
                    return (0, w.jsx)("li", {
                        className: "min-width-0 height-full flex list-none flex-col [list-style:none]",
                        children: null != i ? (0, w.jsx)("button", {
                            "aria-label": o,
                            className: "".concat(tk, " width-full text-align-x-start cursor-pointer font-[inherit]"),
                            type: "button",
                            onClick: function() {
                                i(t, r)
                            },
                            children: l
                        }) : (0, w.jsx)("div", {
                            className: tk,
                            children: l
                        })
                    })
                },
                tR = function(e) {
                    var t = e.featureConfig,
                        r = e.periodType,
                        n = e.overrideIconName,
                        i = e.onTileClick,
                        o = (0, S.useTranslation)(),
                        a = o.translate,
                        l = o.intl,
                        c = (0, e2.useMemo)(function() {
                            var e;
                            return null == (e = t.virtualTransactionDiscounts) ? void 0 : e.find(function(e) {
                                return 0 === e.periodIndex
                            })
                        }, [t]),
                        s = (0, e2.useMemo)(function() {
                            var e;
                            return null == (e = t.virtualTransactionDiscounts) ? void 0 : e.filter(function(e) {
                                return e.periodIndex > 0
                            }).reduce(function(e, t) {
                                return null === e || t.periodIndex < e.periodIndex ? t : e
                            }, null)
                        }, [t]),
                        u = (0, e2.useMemo)(function() {
                            var e;
                            return null == (e = t.privateServerDiscounts) ? void 0 : e.find(function(e) {
                                return 0 === e.periodIndex
                            })
                        }, [t]);
                    return (0, w.jsxs)(tA, {
                        className: "width-full large:[grid-template-columns:repeat(2,minmax(0,1fr))] grid gap-x-[12px] gap-y-[12px] [grid-template-columns:minmax(0,1fr)]",
                        children: [c && (0, w.jsx)(tM, {
                            expandedPrimary: a("Description.Benefit.DiscountBaseExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.DiscountBaseExpandedBody"),
                            iconName: null != n ? n : "icon-regular-tag",
                            primary: a("Description.Benefit.DiscountBase", {
                                discountPercent: l.n(.01 * c.discountPercent, {
                                    style: "percent"
                                })
                            }),
                            secondary: a("Description.Benefit.DiscountBaseSubtitle"),
                            onTileClick: i
                        }), s && (0, w.jsx)(tM, {
                            expandedPrimary: a("Description.Benefit.DiscountNextExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.DiscountNextExpandedBody"),
                            iconName: null != n ? n : "icon-regular-tag-arrow-up",
                            primary: a("Description.Benefit.DiscountNext", {
                                productName: a("Label.Blackbird"),
                                discountPercent: l.n(.01 * s.discountPercent, {
                                    style: "percent"
                                }),
                                discountPeriodCount: l.n(s.periodIndex),
                                discountPeriodUnit: r
                            }),
                            secondary: a("Description.Benefit.DiscountNextSubtitle"),
                            onTileClick: i
                        }), u && (0, w.jsx)(tM, {
                            expandedPrimary: a("Description.Benefit.PrivateServersExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.PrivateServersExpandedBody"),
                            iconName: null != n ? n : "icon-regular-controller",
                            primary: a("Description.Benefit.PrivateServers", {
                                discountPercent: l.n(.01 * u.discountPercent, {
                                    style: "percent"
                                })
                            }),
                            secondary: a("Description.Benefit.PrivateServersSubtitle"),
                            onTileClick: i
                        }), t.isRobuxTransferEnabled && (0, w.jsx)(tM, {
                            expandedPrimary: a("Description.Benefit.RobuxTransfersExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.RobuxTransfersExpandedBody"),
                            iconName: null != n ? n : "icon-regular-robux",
                            primary: a("Description.Benefit.RobuxTransfers"),
                            secondary: a("Description.Benefit.RobuxTransfersSubtitle"),
                            onTileClick: i
                        }), t.isTradingEnabled && (0, w.jsx)(tM, {
                            expandedPrimary: a("Description.Benefit.TradeResellItemsExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.TradeResellItemsExpandedBody"),
                            iconName: null != n ? n : "icon-regular-hand-two-arrows-horizontal",
                            primary: a("Description.Benefit.TradeResellItems"),
                            secondary: a("Description.Benefit.TradeResellItemsSubtitle"),
                            onTileClick: i
                        }), t.isUgcPublishingEnabled && (0, w.jsx)(tM, {
                            expandedPrimary: a("Description.Benefit.PublishItemsExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.PublishItemsExpandedBody"),
                            iconName: null != n ? n : "icon-regular-arrow-up-from-landscape-rectangle",
                            primary: a("Description.Benefit.PublishItems"),
                            secondary: a("Description.Benefit.PublishItemsSubtitle"),
                            onTileClick: i
                        })]
                    })
                },
                t_ = function(e) {
                    var t = e.children;
                    return (0, w.jsx)("div", {
                        children: t
                    })
                },
                tL = function() {
                    return (0, w.jsx)("div", {
                        className: "backdrop-texture width-full height-[210px] pointer-events-none absolute"
                    })
                },
                tU = function() {
                    return (0, w.jsx)("div", {
                        className: "stroke-default stroke-standard self-stretch"
                    })
                };

            function tB(e) {
                var t = e.productTypeDetails.robloxSubscriptionProductDetails;
                if (!(null == t ? void 0 : t.featureConfig)) throw Error("featureConfig is missing on robloxSubscriptionProductDetails");
                return t.featureConfig
            }

            function tF(e) {
                var t, r = e.productTypeDetails.robloxSubscriptionProductDetails,
                    n = null == r ? void 0 : r.featureConfig.currencySubscriptionConfig;
                return Math.floor((null != (t = null == n ? void 0 : n.entitledAmountMicros) ? t : 0) / 1e6)
            }

            function tz(e) {
                return e.eligibleOffers.find(function(e) {
                    return "FreeTrial" === e.offerType
                })
            }
            var tG = function(e) {
                    var t = e.robloxSubscriptionProduct,
                        r = e.onDismiss,
                        n = (0, S.useTranslation)().translate,
                        i = (0, w.jsx)(tP, {
                            className: "width-full",
                            size: "Large",
                            variant: "Emphasis",
                            onClick: r,
                            children: n("Action.OK")
                        }),
                        o = (0, w.jsxs)("p", {
                            className: "text-body-small content-muted text-center",
                            children: [n("Description.FeatureAccessDisclaimer"), " ", (0, w.jsx)("a", {
                                className: "text-link",
                                href: "https://help.roblox.com/hc/articles/39143693116052-Understanding-Age-Checks-on-Roblox",
                                children: n("Action.ViewDetails")
                            })]
                        });
                    return (0, w.jsxs)(e2.Fragment, {
                        children: [(0, w.jsx)(tL, {}), (0, w.jsx)("div", {
                            className: "flex flex-col items-center",
                            children: (0, w.jsxs)("div", {
                                className: "padding-x-xlarge content-emphasis gap-y-xxlarge width-full large:max-width-[730px] flex flex-col",
                                children: [(0, w.jsxs)("div", {
                                    className: "gap-y-small large:items-center flex flex-col items-start",
                                    children: [(0, w.jsxs)("div", {
                                        className: "gap-x-small flex items-center",
                                        children: [(0, w.jsx)(e5, {
                                            className: "!size-600",
                                            name: "icon-regular-roblox-plus"
                                        }), (0, w.jsx)("h1", {
                                            className: "text-heading-medium",
                                            children: n("Title.FreeTrialConfirmation")
                                        })]
                                    }), (0, w.jsx)("p", {
                                        className: "text-body-large content-default",
                                        children: n("Description.FreeTrialConfirmation")
                                    })]
                                }), (0, w.jsx)(tR, {
                                    featureConfig: tB(t),
                                    periodType: t.periodType
                                }), (0, w.jsx)(t_, {
                                    children: (0, w.jsxs)("div", {
                                        className: "large:flex large:flex-col large:items-center width-full gap-y-medium hidden",
                                        "data-testid": "free-trial-action-inline",
                                        children: [i, o]
                                    })
                                })]
                            })
                        }), (0, w.jsxs)("div", {
                            "aria-label": n("Action.OK"),
                            className: "bottom-dock padding-t-medium bg-surface-100 large:!hidden width-full gap-y-medium flex flex-col",
                            "data-testid": "free-trial-action-dock",
                            role: "region",
                            children: [(0, w.jsx)(tU, {}), (0, w.jsxs)("div", {
                                className: "width-full gap-y-medium padding-b-[env(safe-area-inset-bottom\\,0px)] padding-x-xxlarge flex flex-col items-stretch",
                                children: [i, o]
                            })]
                        })]
                    })
                },
                tW = {
                    Small: {
                        dimension: 16,
                        strokeWidth: 2,
                        textClass: "text-caption-small"
                    },
                    Medium: {
                        dimension: 32,
                        strokeWidth: 3,
                        textClass: "text-caption-small",
                        valueContainerSize: 36
                    },
                    Large: {
                        dimension: 48,
                        strokeWidth: 4,
                        textClass: "text-caption-medium",
                        valueContainerSize: 52
                    }
                },
                tV = e3().forwardRef(function(e, t) {
                    var r = e.className,
                        n = e.size,
                        i = void 0 === n ? "Large" : n,
                        o = e.variant,
                        a = e.value,
                        l = e.showValue,
                        c = void 0 !== l && l,
                        s = e.ariaLabel,
                        u = function(e, t) {
                            if (null == e) return {};
                            var r, n, i = function(e, t) {
                                if (null == e) return {};
                                var r, n, i = {},
                                    o = Object.keys(e);
                                for (n = 0; n < o.length; n++) r = o[n], t.indexOf(r) >= 0 || (i[r] = e[r]);
                                return i
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var o = Object.getOwnPropertySymbols(e);
                                for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r])
                            }
                            return i
                        }(e, ["className", "size", "variant", "value", "showValue", "ariaLabel"]),
                        d = tW[i],
                        f = d.dimension,
                        p = d.strokeWidth,
                        m = d.textClass,
                        y = d.valueContainerSize,
                        b = (f - p) / 2,
                        h = 2 * Math.PI * b,
                        v = f / 2,
                        g = Math.min(100, Math.max(0, void 0 === a ? 0 : a)),
                        x = c && void 0 !== y ? y : f,
                        w = "Determinate" === (void 0 === o ? "Determinate" : o);
                    return e3().createElement("div", function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                var n;
                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = n
                            })
                        }
                        return e
                    }({
                        ref: t,
                        className: e4("foundation-web-progress-circle inline-flex items-center justify-center", r),
                        role: "progressbar",
                        "aria-label": s,
                        "aria-valuemin": w ? 0 : void 0,
                        "aria-valuemax": w ? 100 : void 0,
                        "aria-valuenow": w ? g : void 0,
                        style: {
                            width: x,
                            height: x
                        }
                    }, u), e3().createElement("svg", {
                        width: f,
                        height: f,
                        viewBox: "0 0 ".concat(f, " ").concat(f),
                        className: "relative"
                    }, e3().createElement("circle", {
                        cx: v,
                        cy: v,
                        r: b,
                        fill: "none",
                        strokeWidth: p,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), e3().createElement("circle", {
                        cx: v,
                        cy: v,
                        r: b,
                        fill: "none",
                        strokeWidth: p,
                        strokeDasharray: w ? h : "".concat(.75 * h, " ").concat(.25 * h),
                        strokeDashoffset: w ? h * (1 - g / 100) : 0,
                        strokeLinecap: "round",
                        className: e4(!w && "foundation-web-progress-circle-indeterminate"),
                        style: w ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), w && c && "Large" === i && e3().createElement("div", {
                        className: e4("absolute content-emphasis flex items-center justify-center", m),
                        "aria-hidden": "true"
                    }, e3().createElement("span", null, Math.round(g)), e3().createElement("span", null, "%")))
                });
            tV.displayName = "ProgressCircle";
            var tq = function() {
                    var e = (0, S.useTranslation)().translate;
                    return (0, w.jsx)("div", {
                        className: "margin-top-[240px] flex flex-col items-center",
                        children: (0, w.jsx)(tV, {
                            ariaLabel: e("Label.Loading"),
                            size: "Medium",
                            variant: "Indeterminate"
                        })
                    })
                },
                tK = window.CoreRobloxUtilities,
                tH = window.Roblox,
                tX = window.Roblox["core-scripts"].localStorage.localStorage,
                tY = r.n(tX),
                t$ = window.CoreUtilities,
                tJ = window.Roblox["core-scripts"].paymentsFlow,
                tZ = r.n(tJ),
                tQ = window.EventTracker;

            function t0(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function t1(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var t2 = ((a = {}).GET = "GET", a.POST = "POST", a),
                t3 = ((l = {}).PAYMENT = "Payment", l.ROBUX = "Robux", l.ROBUX_GIFTING = "RobuxGifting", l.ROBUX_REDESIGN = "RobuxRedesign", l),
                t4 = ((c = {}).VERIFY_PHONE_VERIFICATION_SESSION = "VerifyPhoneVerificationSession", c.LANDING_PAGE_METADATA = "GetLandingPageMetadata", c.GET_USER_NAME = "GetUserName", c.PREPARE_PAYMENT = "PreparePayment", c.GET_METADATA = "GetMetadata", c.GET_PRODUCTS = "GetProducts", c.GET_PAYMENT_METHODS_INFO = "GetPaymentMethodsInfo", c.GET_PURCHASE_WARNING = "GetPurchaseWarning", c.GET_USER_PURCHASE_ELIGIBILITY = "GetUserPurchaseEligibility", c.CREATE_PAYMENT_SESSION = "CreatePaymentSession", c.GET_PAYMENT_SESSION = "GetPaymentSession", c.GET_PAYMENT_SESSION_BY_CHECKOUT_SESSION_ID = "GetPaymentSessionByCheckoutSessionId", c.CREATE_BONUS_SESSION = "CreateBonusSession", c.GET_BONUS_SESSION_BY_CHECKOUT_SESSION_ID = "GetBonusSessionByCheckoutSessionId", c.GET_DISPLAYABLE_BONUS_FOR_PRODUCT = "GetDisplayableBonusForProduct", c.GET_THUMBNAILS = "GetThumbnails", c.HANDLE_GAME_PASS_JOIN_EVENT = "HandleGamePassJoinEvent", c.GET_ROBUX_BALANCE = "GetRobuxBalance", c.GET_AUTH_TICKET = "GetAuthTicket", c.GET_CLIENT_ASSERTION = "GetClientAssertion", c),
                t6 = function(e, t, r) {
                    return new Promise(function(n) {
                        (0, tQ.fireEvent)("API_COUNTER_".concat(e, "_").concat(t, "_").concat(r || "Throughput")), n()
                    })
                },
                t5 = function(e, t, r) {
                    return new Promise(function(n) {
                        (0, tQ.fireEvent)("ERROR_COUNTER_".concat(e, "_").concat(t, "_").concat(r || "UnknownAxiosError")), n()
                    })
                };

            function t8(e, t, r, n, i) {
                var o;
                return (o = function(e, t, r, n, i) {
                    var o, a, l, c, s, u, d;
                    return function(e, t) {
                        var r, n, i, o = {
                                label: 0,
                                sent: function() {
                                    if (1 & i[0]) throw i[1];
                                    return i[1]
                                },
                                trys: [],
                                ops: []
                            },
                            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                        return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                            return this
                        }), a;

                        function l(l) {
                            return function(c) {
                                var s = [l, c];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                                    if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                                    switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                        case 0:
                                        case 1:
                                            i = s;
                                            break;
                                        case 4:
                                            return o.label++, {
                                                value: s[1],
                                                done: !1
                                            };
                                        case 5:
                                            o.label++, n = s[1], s = [0];
                                            continue;
                                        case 7:
                                            s = o.ops.pop(), o.trys.pop();
                                            continue;
                                        default:
                                            if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                o = 0;
                                                continue
                                            }
                                            if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                o.label = s[1];
                                                break
                                            }
                                            if (6 === s[0] && o.label < i[1]) {
                                                o.label = i[1], i = s;
                                                break
                                            }
                                            if (i && o.label < i[2]) {
                                                o.label = i[2], o.ops.push(s);
                                                break
                                            }
                                            i[2] && o.ops.pop(), o.trys.pop();
                                            continue
                                    }
                                    s = t.call(e, o)
                                } catch (e) {
                                    s = [6, e], n = 0
                                } finally {
                                    r = i = 0
                                }
                                if (5 & s[0]) throw s[1];
                                return {
                                    value: s[0] ? s[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(f) {
                        switch (f.label) {
                            case 0:
                                o = r.feature, a = r.call, t6(o, a), f.label = 1;
                            case 1:
                                return f.trys.push([1, 3, , 4]), [4, "GET" === e ? t$.httpService.get(t, n) : t$.httpService.post(t, n)];
                            case 2:
                                return c = (l = f.sent()).data, s = l.headers, t6(o, a, 200), [2, (null == i ? void 0 : i(c, s)) || c];
                            case 3:
                                var p, m, y;
                                return (void 0 === (p = u = f.sent()) ? "undefined" : t1(p)) === "object" && "status" in p ? t5(o, a, u.status) : (void 0 === u ? "undefined" : t1(u)) === "object" && "config" in u ? t5(o, a, null == (d = u.response) ? void 0 : d.status) : (console.error(u), m = o, y = a, new Promise(function(e) {
                                    (0, tQ.fireEvent)("ERROR_COUNTER_".concat(m, "_").concat(y, "_NonAxiosError")), e()
                                })), [2, void 0];
                            case 4:
                                return [2]
                        }
                    })
                }, function() {
                    var e = this,
                        t = arguments;
                    return new Promise(function(r, n) {
                        var i = o.apply(e, t);

                        function a(e) {
                            t0(i, r, n, a, l, "next", e)
                        }

                        function l(e) {
                            t0(i, r, n, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }).apply(this, arguments)
            }

            function t7(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function t9(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var o = e.apply(t, r);

                        function a(e) {
                            t7(o, n, i, a, l, "next", e)
                        }

                        function l(e) {
                            t7(o, n, i, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function re(e, t) {
                var r, n, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(c) {
                        var s = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                            switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function rt(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rr(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function rn(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rt(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rt(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ri = "paymentSession-".concat((null === tH.CurrentUser || void 0 === tH.CurrentUser ? void 0 : tH.CurrentUser.userId) || "loggedout");

            function ro(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ra(e) {
                return function(e) {
                    if (Array.isArray(e)) return ro(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ro(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ro(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rl = "__FN_nvfToKPAOuiV__",
                rc = new RegExp("".concat(rl, "(\\d+)\\|")),
                rs = function(e, t, r, n) {
                    var i = function(e) {
                            for (var t = 1; t < arguments.length; t++) {
                                var r = null != arguments[t] ? arguments[t] : {},
                                    n = Object.keys(r);
                                "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                    return Object.getOwnPropertyDescriptor(r, e).enumerable
                                }))), n.forEach(function(t) {
                                    var n;
                                    n = r[t], t in e ? Object.defineProperty(e, t, {
                                        value: n,
                                        enumerable: !0,
                                        configurable: !0,
                                        writable: !0
                                    }) : e[t] = n
                                })
                            }
                            return e
                        }({}, n),
                        o = {};
                    null == r || r.forEach(function(e, t) {
                        var r = t.toString(),
                            n = "".concat(rl).concat(r, "|"),
                            a = "".concat("__FN_END_nvfToKPAOuiV__").concat(r, "|");
                        i[e.opening] = n, i[e.closing] = a, o[r] = {
                            start: n,
                            end: a,
                            render: e.render,
                            used: !1
                        }
                    });
                    var a = e(t, i),
                        l = function(e) {
                            var r = [],
                                n = rc.exec(e);
                            if (!n) return [e];
                            n.index > 0 && r.push(e.slice(0, n.index));
                            var i = n[1] && o[n[1]];
                            if (!i) return console.warn("Unexpected malformed segment", t), [];
                            i.used = !0;
                            var a = e.indexOf(i.end);
                            if (-1 === a) return console.warn("Unexpected malformed segment", t), [];
                            var c = e.slice(n.index + n[0].length, a),
                                s = i.render(l(c));
                            Array.isArray(s) ? r.push.apply(r, ra(s)) : r.push(s);
                            var u = e.slice(a + i.end.length);
                            return u.length > 0 && r.push.apply(r, ra(l(u))), r
                        },
                        c = l(a).filter(function(e) {
                            return "" !== e
                        });
                    return Object.values(o).some(function(e) {
                        return !e.used
                    }) ? (console.warn("Unused segments found", t), []) : c.map(function(e, t) {
                        return (0, w.jsx)(e2.Fragment, {
                            children: e
                        }, t)
                    })
                };

            function ru(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var rd = function(e) {
                    var t, r = e.productType,
                        n = e.productId,
                        i = e.deviceMeta,
                        o = e.variant,
                        a = e.size,
                        l = e.className,
                        c = e.isDisabled,
                        s = void 0 !== c && c,
                        u = e.redirectUrl,
                        d = e.paymentSessionId,
                        f = e.onSubscribeClick,
                        p = e.onMobilePurchaseInitiated,
                        m = e.isLoading,
                        y = e.children,
                        b = e.trackSubscriptionButtonClick,
                        h = e.loadingStateDisabled,
                        v = (t = (0, e2.useState)(!1), function(e) {
                            if (Array.isArray(e)) return e
                        }(t) || function(e, t) {
                            var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != i) {
                                var o = [],
                                    a = !0,
                                    l = !1;
                                try {
                                    for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), o.length !== t); a = !0);
                                } catch (e) {
                                    l = !0, n = e
                                } finally {
                                    try {
                                        a || null == i.return || i.return()
                                    } finally {
                                        if (l) throw n
                                    }
                                }
                                return o
                            }
                        }(t, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return ru(e, 2);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ru(e, t)
                            }
                        }(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        g = v[0],
                        x = v[1],
                        S = i.isAndroidApp || i.isIosApp,
                        O = r === eH ? "RobloxPlus" : r,
                        P = (0, e2.useMemo)(function() {
                            var e = new URL(S ? "/mobile-app-upgrades/buy" : "/upgrades/paymentmethods", window.location.origin);
                            return e.searchParams.append("ctx", "subscription"), e.searchParams.append("type", O), e.searchParams.append("id", n), d && e.searchParams.append("paymentSessionId", d), !S && u && e.searchParams.append("redirectUrl", u), e.toString()
                        }, [S, O, n, d, u]),
                        E = (0, e2.useCallback)(function() {
                            if (!s) {
                                if (null == b || b(), u && function(e) {
                                        try {
                                            var t = JSON.stringify({
                                                url: e,
                                                ts: Date.now()
                                            });
                                            sessionStorage.setItem(e1, t)
                                        } catch (e) {}
                                    }(u), null == f || f(), S) {
                                    null == p || p();
                                    return
                                }
                                x(!0)
                            }
                        }, [s, b, u, f, S, p]);
                    return (0, w.jsx)(tP, {
                        as: "a",
                        className: l,
                        href: P,
                        isDisabled: s,
                        isLoading: void 0 !== h && h ? void 0 : null != m ? m : g,
                        size: a,
                        variant: void 0 === o ? "Emphasis" : o,
                        onClick: E,
                        children: y
                    })
                },
                rf = function(e) {
                    var t = e.title,
                        r = e.body,
                        n = e.equipText,
                        i = e.onEquip,
                        o = e.onItemDetailsClick,
                        a = null != o;
                    return (0, w.jsxs)("div", {
                        "aria-label": a ? t : void 0,
                        className: "bg-shift-200 radius-medium padding-medium gap-medium width-full flex items-center ".concat(a ? "hover:bg-surface-100 cursor-pointer" : ""),
                        role: a ? "button" : void 0,
                        tabIndex: a ? 0 : void 0,
                        onClick: o,
                        onKeyDown: a ? function(e) {
                            e.target === e.currentTarget && ("Enter" === e.key || " " === e.key) && (e.preventDefault(), null == o || o())
                        } : void 0,
                        children: [(0, w.jsx)("div", {
                            className: "radius-medium size-[50px] shrink-0 overflow-hidden",
                            children: (0, w.jsx)("img", {
                                alt: t,
                                className: "size-full object-cover",
                                src: "https://images.rbxcdn.com/edf7aeadb32b5c26.png"
                            })
                        }), (0, w.jsxs)("div", {
                            className: "min-width-0 grow-1 shrink-1 flex basis-0 flex-col justify-center",
                            children: [(0, w.jsx)("span", {
                                className: "text-title-medium content-emphasis",
                                children: t
                            }), (0, w.jsx)("span", {
                                className: "text-body-medium content-default",
                                children: r
                            })]
                        }), null != n && null != i && (0, w.jsx)(tP, {
                            className: "shrink-0",
                            size: "Medium",
                            variant: "Standard",
                            onClick: function(e) {
                                e.stopPropagation(), null == i || i()
                            },
                            children: n
                        })]
                    })
                },
                rp = function(e) {
                    var t = e.size,
                        r = e.variant,
                        n = (0, (0, S.useTranslation)().translate)("Label.Blackbird");
                    return "compact" === (void 0 === r ? "default" : r) ? (0, w.jsxs)("div", {
                        className: "gap-x-xxsmall flex items-center",
                        children: [(0, w.jsx)(e5, {
                            className: "relative",
                            name: "icon-regular-roblox-plus",
                            size: "Large",
                            style: {
                                top: -1
                            }
                        }), (0, w.jsx)("span", {
                            className: "text-label-large content-emphasis text-no-wrap",
                            children: n
                        })]
                    }) : (0, w.jsxs)("div", {
                        className: "gap-x-small flex items-center",
                        children: [(0, w.jsx)(e5, {
                            className: "!size-1000 relative",
                            name: "icon-regular-roblox-plus",
                            style: {
                                top: -4
                            }
                        }), "large" === (void 0 === t ? "large" : t) ? (0, w.jsx)("h1", {
                            className: "font-builder-extended text-display-small text-no-wrap",
                            children: n
                        }) : (0, w.jsx)("h2", {
                            className: "text-heading-large",
                            children: n
                        })]
                    })
                },
                rm = window.Roblox["core-scripts"].format.string,
                ry = function(e, t) {
                    var r = (0, S.useTranslation)().intl;
                    return (0, e2.useMemo)(function() {
                        var n = e.units + 1e-9 * e.nanos;
                        return r.n(n, function(e) {
                            for (var t = 1; t < arguments.length; t++) {
                                var r = null != arguments[t] ? arguments[t] : {},
                                    n = Object.keys(r);
                                "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                    return Object.getOwnPropertyDescriptor(r, e).enumerable
                                }))), n.forEach(function(t) {
                                    var n;
                                    n = r[t], t in e ? Object.defineProperty(e, t, {
                                        value: n,
                                        enumerable: !0,
                                        configurable: !0,
                                        writable: !0
                                    }) : e[t] = n
                                })
                            }
                            return e
                        }({
                            style: "currency",
                            currency: e.currencyCode
                        }, t))
                    }, [r, e, t])
                },
                rb = function(e) {
                    var t, r = e.eligibleOffers,
                        n = e.price,
                        i = e.periodType,
                        o = (0, S.useTranslation)().translate,
                        a = ry(n),
                        l = o("Description.BillingInfo", {
                            price: "<span class='text-heading-medium'>".concat((0, rm.escapeHtml)(a), "</span>"),
                            periodType: i
                        }),
                        c = o("Description.BillingInfoWithFreeTrialOffer", {
                            boldTagStart: "<b>",
                            boldTagEnd: "</b>",
                            trialPeriod: 1,
                            trialPeriodType: i,
                            price: (0, rm.escapeHtml)(a),
                            periodType: i
                        }),
                        s = null != (t = null == r ? void 0 : r.some(function(e) {
                            return "FreeTrial" === e.offerType
                        })) && t;
                    return (0, w.jsx)("span", {
                        dangerouslySetInnerHTML: {
                            __html: s ? c : l
                        },
                        className: "text-body-large"
                    })
                },
                rh = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                rv = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                rg = function(e) {
                    var t = e.variant,
                        r = e.size,
                        n = e.isCircular,
                        i = e.className,
                        o = function(e, t) {
                            if (null == e) return {};
                            var r, n, i = function(e, t) {
                                if (null == e) return {};
                                var r, n, i = {},
                                    o = Object.keys(e);
                                for (n = 0; n < o.length; n++) r = o[n], t.indexOf(r) >= 0 || (i[r] = e[r]);
                                return i
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var o = Object.getOwnPropertySymbols(e);
                                for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r])
                            }
                            return i
                        }(e, ["variant", "size", "isCircular", "className"]);
                    return e3().createElement("button", function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                var n;
                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = n
                            })
                        }
                        return e
                    }({
                        type: "button",
                        className: e4("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", e8, rv[t], rh[r], n && "radius-circle", i)
                    }, o), e3().createElement(e7, null), e3().createElement(e5, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function rx(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    i = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === i || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function rw(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rS(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function rO(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        rS(e, t, r[t])
                    })
                }
                return e
            }

            function rP(e, t) {
                if (null == e) return {};
                var r, n, i = function(e, t) {
                    if (null == e) return {};
                    var r, n, i = {},
                        o = Object.keys(e);
                    for (n = 0; n < o.length; n++) r = o[n], t.indexOf(r) >= 0 || (i[r] = e[r]);
                    return i
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r])
                }
                return i
            }

            function rE(e) {
                return function(e) {
                    if (Array.isArray(e)) return rw(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rw(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rw(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rj() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                var n = t[0];
                if (1 === t.length) return n;
                var i = function() {
                    var e = t.map(function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    });
                    return function(t) {
                        var r = e.reduce(function(e, r) {
                            var n = r.useScope,
                                i = r.scopeName;
                            return rO({}, e, n(t)["__scope".concat(i)])
                        }, {});
                        return e2.useMemo(function() {
                            return rS({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return i.scopeName = n.scopeName, i
            }
            var rT = (null == (g = globalThis) ? void 0 : g.document) ? e2.useLayoutEffect : function() {};

            function rN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var rI = e2[" useId ".trim().toString()] || function() {},
                rD = 0;

            function rC(e) {
                var t, r = (t = e2.useState(rI()), function(e) {
                        if (Array.isArray(e)) return e
                    }(t) || function(e, t) {
                        var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != i) {
                            var o = [],
                                a = !0,
                                l = !1;
                            try {
                                for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), o.length !== t); a = !0);
                            } catch (e) {
                                l = !0, n = e
                            } finally {
                                try {
                                    a || null == i.return || i.return()
                                } finally {
                                    if (l) throw n
                                }
                            }
                            return o
                        }
                    }(t, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return rN(e, 2);
                            var r = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rN(e, t)
                        }
                    }(t, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    n = r[0],
                    i = r[1];
                return rT(function() {
                    e || i(function(e) {
                        return null != e ? e : String(rD++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function rA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rk(e) {
                var t = e2.useRef(e);
                return e2.useEffect(function() {
                    t.current = e
                }), e2.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), i = 0; i < r; i++) n[i] = arguments[i];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return rA(e)
                        }(n) || function(e) {
                            if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return rA(e, void 0);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rA(e, t)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function rM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rR(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rM(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rM(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var r_ = window.RadixUI["react-dismissable-layer"],
                rL = window.ReactDOM,
                rU = r.n(rL);

            function rB(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rF(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function rz(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function rG(e, t) {
                if (null == e) return {};
                var r, n, i = function(e, t) {
                    if (null == e) return {};
                    var r, n, i = {},
                        o = Object.keys(e);
                    for (n = 0; n < o.length; n++) r = o[n], t.indexOf(r) >= 0 || (i[r] = e[r]);
                    return i
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r])
                }
                return i
            }

            function rW(e) {
                return function(e) {
                    if (Array.isArray(e)) return rB(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rB(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rB(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rV(e) {
                var t, r, n = (t = e, (r = e2.forwardRef(function(e, t) {
                        var r = e.children,
                            n = rG(e, ["children"]);
                        if (e2.isValidElement(r)) {
                            var i, o, a, l, c, s = (c = (l = null == (o = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (c = (l = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                                u = function(e, t) {
                                    var r = rF({}, t);
                                    for (var n in t) ! function(n) {
                                        var i = e[n],
                                            o = t[n];
                                        /^on[A-Z]/.test(n) ? i && o ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            o.apply(void 0, rW(t)), i.apply(void 0, rW(t))
                                        } : i && (r[n] = i) : "style" === n ? r[n] = rF({}, i, o) : "className" === n && (r[n] = [i, o].filter(Boolean).join(" "))
                                    }(n);
                                    return rF({}, e, r)
                                }(n, r.props);
                            return r.type !== e2.Fragment && (u.ref = t ? tn(t, s) : s), e2.cloneElement(r, u)
                        }
                        return e2.Children.count(r) > 1 ? e2.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    i = e2.forwardRef(function(e, t) {
                        var r = e.children,
                            i = rG(e, ["children"]),
                            o = e2.Children.toArray(r),
                            a = o.find(rK);
                        if (a) {
                            var l = a.props.children,
                                c = o.map(function(e) {
                                    return e !== a ? e : e2.Children.count(l) > 1 ? e2.Children.only(null) : e2.isValidElement(l) ? l.props.children : null
                                });
                            return (0, w.jsx)(n, rz(rF({}, i), {
                                ref: t,
                                children: e2.isValidElement(l) ? e2.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, w.jsx)(n, rz(rF({}, i), {
                            ref: t,
                            children: r
                        }))
                    });
                return i.displayName = "".concat(e, ".Slot"), i
            }
            var rq = Symbol("radix.slottable");

            function rK(e) {
                return e2.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === rq
            }

            function rH(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function rX(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        rH(e, t, r[t])
                    })
                }
                return e
            }

            function rY(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }
            var r$ = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                var r = rV("Primitive.".concat(t)),
                    n = e2.forwardRef(function(e, n) {
                        var i = e.asChild,
                            o = function(e, t) {
                                if (null == e) return {};
                                var r, n, i = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, i = {},
                                        o = Object.keys(e);
                                    for (n = 0; n < o.length; n++) r = o[n], t.indexOf(r) >= 0 || (i[r] = e[r]);
                                    return i
                                }(e, t);
                                if (Object.getOwnPropertySymbols) {
                                    var o = Object.getOwnPropertySymbols(e);
                                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r])
                                }
                                return i
                            }(e, ["asChild"]),
                            a = i ? r : t;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, w.jsx)(a, rY(rX({}, o), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), rY(rX({}, e), rH({}, t, n))
            }, {});

            function rJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rZ(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || rQ(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rQ(e, t) {
                if (e) {
                    if ("string" == typeof e) return rJ(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rJ(e, t)
                }
            }
            var r0 = "focusScope.autoFocusOnMount",
                r1 = "focusScope.autoFocusOnUnmount",
                r2 = {
                    bubbles: !1,
                    cancelable: !0
                },
                r3 = e2.forwardRef(function(e, t) {
                    var r, n, i = e.loop,
                        o = void 0 !== i && i,
                        a = e.trapped,
                        l = void 0 !== a && a,
                        c = e.onMountAutoFocus,
                        s = e.onUnmountAutoFocus,
                        u = function(e, t) {
                            if (null == e) return {};
                            var r, n, i = function(e, t) {
                                if (null == e) return {};
                                var r, n, i = {},
                                    o = Object.keys(e);
                                for (n = 0; n < o.length; n++) r = o[n], t.indexOf(r) >= 0 || (i[r] = e[r]);
                                return i
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var o = Object.getOwnPropertySymbols(e);
                                for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r])
                            }
                            return i
                        }(e, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        d = rZ(e2.useState(null), 2),
                        f = d[0],
                        p = d[1],
                        m = rk(c),
                        y = rk(s),
                        b = e2.useRef(null),
                        h = ti(t, function(e) {
                            return p(e)
                        }),
                        v = e2.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    e2.useEffect(function() {
                        if (l) {
                            var e = function(e) {
                                    if (!v.paused && f) {
                                        var t = e.target;
                                        f.contains(t) ? b.current = t : r5(b.current, {
                                            select: !0
                                        })
                                    }
                                },
                                t = function(e) {
                                    if (!v.paused && f) {
                                        var t = e.relatedTarget;
                                        null !== t && (f.contains(t) || r5(b.current, {
                                            select: !0
                                        }))
                                    }
                                };
                            document.addEventListener("focusin", e), document.addEventListener("focusout", t);
                            var r = new MutationObserver(function(e) {
                                if (document.activeElement === document.body) {
                                    var t = !0,
                                        r = !1,
                                        n = void 0;
                                    try {
                                        for (var i, o = e[Symbol.iterator](); !(t = (i = o.next()).done); t = !0) i.value.removedNodes.length > 0 && r5(f)
                                    } catch (e) {
                                        r = !0, n = e
                                    } finally {
                                        try {
                                            t || null == o.return || o.return()
                                        } finally {
                                            if (r) throw n
                                        }
                                    }
                                }
                            });
                            return f && r.observe(f, {
                                    childList: !0,
                                    subtree: !0
                                }),
                                function() {
                                    document.removeEventListener("focusin", e), document.removeEventListener("focusout", t), r.disconnect()
                                }
                        }
                    }, [l, f, v.paused]), e2.useEffect(function() {
                        if (f) {
                            r8.add(v);
                            var e = document.activeElement;
                            if (!f.contains(e)) {
                                var t = new CustomEvent(r0, r2);
                                f.addEventListener(r0, m), f.dispatchEvent(t), t.defaultPrevented || (function(e) {
                                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                        r = t.select,
                                        n = void 0 !== r && r,
                                        i = document.activeElement,
                                        o = !0,
                                        a = !1,
                                        l = void 0;
                                    try {
                                        for (var c, s = e[Symbol.iterator](); !(o = (c = s.next()).done); o = !0) {
                                            var u = c.value;
                                            if (r5(u, {
                                                    select: n
                                                }), document.activeElement !== i) return
                                        }
                                    } catch (e) {
                                        a = !0, l = e
                                    } finally {
                                        try {
                                            o || null == s.return || s.return()
                                        } finally {
                                            if (a) throw l
                                        }
                                    }
                                }(r4(f).filter(function(e) {
                                    return "A" !== e.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === e && r5(f))
                            }
                            return function() {
                                f.removeEventListener(r0, m), setTimeout(function() {
                                    var t = new CustomEvent(r1, r2);
                                    f.addEventListener(r1, y), f.dispatchEvent(t), t.defaultPrevented || r5(null != e ? e : document.body, {
                                        select: !0
                                    }), f.removeEventListener(r1, y), r8.remove(v)
                                }, 0)
                            }
                        }
                    }, [f, m, y, v]);
                    var g = e2.useCallback(function(e) {
                        if ((o || l) && !v.paused) {
                            var t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                                r = document.activeElement;
                            if (t && r) {
                                var n, i, a = e.currentTarget,
                                    c = rZ([r6(i = r4(n = a), n), r6(i.reverse(), n)], 2),
                                    s = c[0],
                                    u = c[1];
                                s && u ? e.shiftKey || r !== u ? e.shiftKey && r === s && (e.preventDefault(), o && r5(u, {
                                    select: !0
                                })) : (e.preventDefault(), o && r5(s, {
                                    select: !0
                                })) : r === a && e.preventDefault()
                            }
                        }
                    }, [o, l, v.paused]);
                    return (0, w.jsx)(r$.div, (r = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                var n;
                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = n
                            })
                        }
                        return e
                    }({
                        tabIndex: -1
                    }, u), n = n = {
                        ref: h,
                        onKeyDown: g
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e, t) {
                        var r = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var n = Object.getOwnPropertySymbols(e);
                            r.push.apply(r, n)
                        }
                        return r
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r))
                });

            function r4(e) {
                for (var t = [], r = document.createTreeWalker(e, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(e) {
                            var t = "INPUT" === e.tagName && "hidden" === e.type;
                            return e.disabled || e.hidden || t ? NodeFilter.FILTER_SKIP : e.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); r.nextNode();) t.push(r.currentNode);
                return t
            }

            function r6(e, t) {
                var r = !0,
                    n = !1,
                    i = void 0;
                try {
                    for (var o, a = e[Symbol.iterator](); !(r = (o = a.next()).done); r = !0) {
                        var l = o.value;
                        if (! function(e, t) {
                                var r = t.upTo;
                                if ("hidden" === getComputedStyle(e).visibility) return !0;
                                for (; e && (void 0 === r || e !== r);) {
                                    if ("none" === getComputedStyle(e).display) return !0;
                                    e = e.parentElement
                                }
                                return !1
                            }(l, {
                                upTo: t
                            })) return l
                    }
                } catch (e) {
                    n = !0, i = e
                } finally {
                    try {
                        r || null == a.return || a.return()
                    } finally {
                        if (n) throw i
                    }
                }
            }

            function r5(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = t.select;
                if (e && e.focus) {
                    var n, i, o, a = document.activeElement;
                    e.focus({
                        preventScroll: !0
                    }), e !== a && (i = n = e, null != (o = HTMLInputElement) && "undefined" != typeof Symbol && o[Symbol.hasInstance] ? !!o[Symbol.hasInstance](i) : i instanceof o) && "select" in n && void 0 !== r && r && e.select()
                }
            }
            r3.displayName = "FocusScope";
            var r8 = (t = [], {
                add: function(e) {
                    var r = t[0];
                    e !== r && (null == r || r.pause()), (t = r7(t, e)).unshift(e)
                },
                remove: function(e) {
                    var r;
                    null == (r = (t = r7(t, e))[0]) || r.resume()
                }
            });

            function r7(e, t) {
                var r = function(e) {
                        if (Array.isArray(e)) return rJ(e)
                    }(e) || function(e) {
                        if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(e) || rQ(e) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r.indexOf(t);
                return -1 !== n && r.splice(n, 1), r
            }

            function r9(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var ne = e2.forwardRef(function(e, t) {
                var r, n, i, o, a, l = e.container,
                    c = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = function(e, t) {
                            if (null == e) return {};
                            var r, n, i = {},
                                o = Object.keys(e);
                            for (n = 0; n < o.length; n++) r = o[n], t.indexOf(r) >= 0 || (i[r] = e[r]);
                            return i
                        }(e, t);
                        if (Object.getOwnPropertySymbols) {
                            var o = Object.getOwnPropertySymbols(e);
                            for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r])
                        }
                        return i
                    }(e, ["container"]),
                    s = (r = e2.useState(!1), function(e) {
                        if (Array.isArray(e)) return e
                    }(r) || function(e, t) {
                        var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != i) {
                            var o = [],
                                a = !0,
                                l = !1;
                            try {
                                for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), o.length !== t); a = !0);
                            } catch (e) {
                                l = !0, n = e
                            } finally {
                                try {
                                    a || null == i.return || i.return()
                                } finally {
                                    if (l) throw n
                                }
                            }
                            return o
                        }
                    }(r, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return r9(e, 2);
                            var r = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return r9(e, t)
                        }
                    }(r, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    u = s[0],
                    d = s[1];
                rT(function() {
                    return d(!0)
                }, []);
                var f = l || u && (null == (a = globalThis) || null == (o = a.document) ? void 0 : o.body);
                return f ? rU().createPortal((0, w.jsx)(r$.div, (n = function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var r = null != arguments[t] ? arguments[t] : {},
                            n = Object.keys(r);
                        "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                            return Object.getOwnPropertyDescriptor(r, e).enumerable
                        }))), n.forEach(function(t) {
                            var n;
                            n = r[t], t in e ? Object.defineProperty(e, t, {
                                value: n,
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : e[t] = n
                        })
                    }
                    return e
                }({}, c), i = i = {
                    ref: t
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(i)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(i)).forEach(function(e) {
                    Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(i, e))
                }), n)), f) : null
            });

            function nt(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nr(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return nt(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nt(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            ne.displayName = "Portal";
            var nn = function(e) {
                var t, r, n, i, o, a, l, c, s, u, d, f, p, m, y, b, h, v = e.present,
                    g = e.children,
                    x = (t = v, o = (i = nr(e2.useState(), 2))[0], a = i[1], l = e2.useRef({}), c = e2.useRef(t), s = e2.useRef("none"), d = (u = nr((r = t ? "mounted" : "unmounted", n = {
                        mounted: {
                            UNMOUNT: "unmounted",
                            ANIMATION_OUT: "unmountSuspended"
                        },
                        unmountSuspended: {
                            MOUNT: "mounted",
                            ANIMATION_END: "unmounted"
                        },
                        unmounted: {
                            MOUNT: "mounted"
                        }
                    }, e2.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], f = u[1], e2.useEffect(function() {
                        var e = ni(l.current);
                        s.current = "mounted" === d ? e : "none"
                    }, [d]), rT(function() {
                        var e = l.current,
                            r = c.current;
                        if (r !== t) {
                            var n = s.current,
                                i = ni(e);
                            t ? f("MOUNT") : "none" === i || (null == e ? void 0 : e.display) === "none" ? f("UNMOUNT") : r && n !== i ? f("ANIMATION_OUT") : f("UNMOUNT"), c.current = t
                        }
                    }, [t, f]), rT(function() {
                        if (o) {
                            var e, t, r = null != (t = o.ownerDocument.defaultView) ? t : window,
                                n = function(t) {
                                    var n = ni(l.current).includes(t.animationName);
                                    if (t.target === o && n && (f("ANIMATION_END"), !c.current)) {
                                        var i = o.style.animationFillMode;
                                        o.style.animationFillMode = "forwards", e = r.setTimeout(function() {
                                            "forwards" === o.style.animationFillMode && (o.style.animationFillMode = i)
                                        })
                                    }
                                },
                                i = function(e) {
                                    e.target === o && (s.current = ni(l.current))
                                };
                            return o.addEventListener("animationstart", i), o.addEventListener("animationcancel", n), o.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(e), o.removeEventListener("animationstart", i), o.removeEventListener("animationcancel", n), o.removeEventListener("animationend", n)
                                }
                        }
                        f("ANIMATION_END")
                    }, [o, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: e2.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    w = "function" == typeof g ? g({
                        present: x.isPresent
                    }) : e2.Children.only(g),
                    S = ti(x.ref, (h = (b = null == (m = Object.getOwnPropertyDescriptor((p = w).props, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning) ? p.ref : (h = (b = null == (y = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : y.get) && "isReactWarning" in b && b.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof g || x.isPresent ? e2.cloneElement(w, {
                    ref: S
                }) : null
            };

            function ni(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            nn.displayName = "Presence";
            var no = window.RadixUI["react-focus-guards"],
                na = function() {
                    return (na = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var i in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                        return e
                    }).apply(this, arguments)
                };

            function nl(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var i = 0, n = Object.getOwnPropertySymbols(e); i < n.length; i++) 0 > t.indexOf(n[i]) && Object.prototype.propertyIsEnumerable.call(e, n[i]) && (r[n[i]] = e[n[i]]);
                return r
            }
            var nc = "right-scroll-bar-position",
                ns = "width-before-scroll-bar";

            function nu(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var nd = "undefined" != typeof window ? e2.useLayoutEffect : e2.useEffect,
                nf = new WeakMap,
                np = (void 0 === s && (s = {}), (void 0 === u && (u = function(e) {
                    return e
                }), d = [], f = !1, p = {
                    read: function() {
                        if (f) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return d.length ? d[d.length - 1] : null
                    },
                    useMedium: function(e) {
                        var t = u(e, f);
                        return d.push(t),
                            function() {
                                d = d.filter(function(e) {
                                    return e !== t
                                })
                            }
                    },
                    assignSyncMedium: function(e) {
                        for (f = !0; d.length;) {
                            var t = d;
                            d = [], t.forEach(e)
                        }
                        d = {
                            push: function(t) {
                                return e(t)
                            },
                            filter: function() {
                                return d
                            }
                        }
                    },
                    assignMedium: function(e) {
                        f = !0;
                        var t = [];
                        if (d.length) {
                            var r = d;
                            d = [], r.forEach(e), t = d
                        }
                        var n = function() {
                                var r = t;
                                t = [], r.forEach(e)
                            },
                            i = function() {
                                return Promise.resolve().then(n)
                            };
                        i(), d = {
                            push: function(e) {
                                t.push(e), i()
                            },
                            filter: function(e) {
                                return t = t.filter(e), d
                            }
                        }
                    }
                }).options = na({
                    async: !0,
                    ssr: !1
                }, s), p),
                nm = function() {},
                ny = e2.forwardRef(function(e, t) {
                    var r, n, i, o, a = e2.useRef(null),
                        l = e2.useState({
                            onScrollCapture: nm,
                            onWheelCapture: nm,
                            onTouchMoveCapture: nm
                        }),
                        c = l[0],
                        s = l[1],
                        u = e.forwardProps,
                        d = e.children,
                        f = e.className,
                        p = e.removeScrollBar,
                        m = e.enabled,
                        y = e.shards,
                        b = e.sideCar,
                        h = e.noRelative,
                        v = e.noIsolation,
                        g = e.inert,
                        x = e.allowPinchZoom,
                        w = e.as,
                        S = e.gapMode,
                        O = nl(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        P = (r = [a, t], n = function(e) {
                            return r.forEach(function(t) {
                                return nu(t, e)
                            })
                        }, (i = (0, e2.useState)(function() {
                            return {
                                value: null,
                                callback: n,
                                facade: {
                                    get current() {
                                        return i.value
                                    },
                                    set current(value) {
                                        var e = i.value;
                                        e !== value && (i.value = value, i.callback(value, e))
                                    }
                                }
                            }
                        })[0]).callback = n, o = i.facade, nd(function() {
                            var e = nf.get(o);
                            if (e) {
                                var t = new Set(e),
                                    n = new Set(r),
                                    i = o.current;
                                t.forEach(function(e) {
                                    n.has(e) || nu(e, null)
                                }), n.forEach(function(e) {
                                    t.has(e) || nu(e, i)
                                })
                            }
                            nf.set(o, r)
                        }, [r]), o),
                        E = na(na({}, O), c);
                    return e2.createElement(e2.Fragment, null, m && e2.createElement(b, {
                        sideCar: np,
                        removeScrollBar: p,
                        shards: y,
                        noRelative: h,
                        noIsolation: v,
                        inert: g,
                        setCallbacks: s,
                        allowPinchZoom: !!x,
                        lockRef: a,
                        gapMode: S
                    }), u ? e2.cloneElement(e2.Children.only(d), na(na({}, E), {
                        ref: P
                    })) : e2.createElement(void 0 === w ? "div" : w, na({}, E, {
                        className: f,
                        ref: P
                    }), d))
                });
            ny.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, ny.classNames = {
                fullWidth: ns,
                zeroRight: nc
            };
            var nb = function(e) {
                var t = e.sideCar,
                    r = nl(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var n = t.read();
                if (!n) throw Error("Sidecar medium not found");
                return e2.createElement(n, na({}, r))
            };
            nb.isSideCarExport = !0;
            var nh = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(n) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = x || r.nc;
                                    return t && e.setAttribute("nonce", t), e
                                }())) {
                                var i, o;
                                (i = t).styleSheet ? i.styleSheet.cssText = n : i.appendChild(document.createTextNode(n)), o = t, (document.head || document.getElementsByTagName("head")[0]).appendChild(o)
                            }
                            e++
                        },
                        remove: function() {
                            --e || !t || (t.parentNode && t.parentNode.removeChild(t), t = null)
                        }
                    }
                },
                nv = function() {
                    var e = nh();
                    return function(t, r) {
                        e2.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && r])
                    }
                },
                ng = function() {
                    var e = nv();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                nx = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                nw = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                nS = function(e) {
                    var t = window.getComputedStyle(document.body),
                        r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        n = t["padding" === e ? "paddingTop" : "marginTop"],
                        i = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [nw(r), nw(n), nw(i)]
                },
                nO = function(e) {
                    if (void 0 === e && (e = "margin"), "undefined" == typeof window) return nx;
                    var t = nS(e),
                        r = document.documentElement.clientWidth,
                        n = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, n - r + t[2] - t[0])
                    }
                },
                nP = ng(),
                nE = "data-scroll-locked",
                nj = function(e, t, r, n) {
                    var i = e.left,
                        o = e.top,
                        a = e.right,
                        l = e.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(l, "px ").concat(n, ";\n  }\n  body[").concat(nE, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(i, "px;\n    padding-top: ").concat(o, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(nc, " {\n    right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(ns, " {\n    margin-right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(nc, " .").concat(nc, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(ns, " .").concat(ns, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(nE, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                nT = function() {
                    var e = parseInt(document.body.getAttribute(nE) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                nN = function() {
                    e2.useEffect(function() {
                        return document.body.setAttribute(nE, (nT() + 1).toString()),
                            function() {
                                var e = nT() - 1;
                                e <= 0 ? document.body.removeAttribute(nE) : document.body.setAttribute(nE, e.toString())
                            }
                    }, [])
                },
                nI = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        n = e.gapMode,
                        i = void 0 === n ? "margin" : n;
                    nN();
                    var o = e2.useMemo(function() {
                        return nO(i)
                    }, [i]);
                    return e2.createElement(nP, {
                        styles: nj(o, !t, i, r ? "" : "!important")
                    })
                },
                nD = !1;
            if ("undefined" != typeof window) try {
                var nC = Object.defineProperty({}, "passive", {
                    get: function() {
                        return nD = !0, !0
                    }
                });
                window.addEventListener("test", nC, nC), window.removeEventListener("test", nC, nC)
            } catch (e) {
                nD = !1
            }
            var nA = !!nD && {
                passive: !1
            };

            function nk(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var nM = function(e, t) {
                    if (!nk(e, Element)) return !1;
                    var r = window.getComputedStyle(e);
                    return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
                },
                nR = function(e, t) {
                    var r = t.ownerDocument,
                        n = t;
                    do {
                        if ("undefined" != typeof ShadowRoot && nk(n, ShadowRoot) && (n = n.host), n_(e, n)) {
                            var i = nL(e, n);
                            if (i[1] > i[2]) return !0
                        }
                        n = n.parentNode
                    } while (n && n !== r.body);
                    return !1
                },
                n_ = function(e, t) {
                    return "v" === e ? nM(t, "overflowY") : nM(t, "overflowX")
                },
                nL = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                nU = function(e, t, r, n, i) {
                    var o, a = (o = window.getComputedStyle(t).direction, "h" === e && "rtl" === o ? -1 : 1),
                        l = a * n,
                        c = r.target,
                        s = t.contains(c),
                        u = !1,
                        d = l > 0,
                        f = 0,
                        p = 0;
                    do {
                        if (!c) break;
                        var m = nL(e, c),
                            y = m[0],
                            b = m[1] - m[2] - a * y;
                        (y || b) && n_(e, c) && (f += b, p += y);
                        var h = c.parentNode;
                        c = h && h.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? h.host : h
                    } while (!s && c !== document.body || s && (t.contains(c) || t === c));
                    return d && (i && 1 > Math.abs(f) || !i && l > f) ? u = !0 : !d && (i && 1 > Math.abs(p) || !i && -l > p) && (u = !0), u
                },
                nB = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                nF = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                nz = function(e) {
                    return e && "current" in e ? e.current : e
                },
                nG = 0,
                nW = [],
                nV = (m = function(e) {
                    var t = e2.useRef([]),
                        r = e2.useRef([0, 0]),
                        n = e2.useRef(),
                        i = e2.useState(nG++)[0],
                        o = e2.useState(ng)[0],
                        a = e2.useRef(e);
                    e2.useEffect(function() {
                        a.current = e
                    }, [e]), e2.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(i));
                            var t = (function(e, t, r) {
                                if (r || 2 == arguments.length)
                                    for (var n, i = 0, o = t.length; i < o; i++) !n && i in t || (n || (n = Array.prototype.slice.call(t, 0, i)), n[i] = t[i]);
                                return e.concat(n || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(nz), !0).filter(Boolean);
                            return t.forEach(function(e) {
                                    return e.classList.add("allow-interactivity-".concat(i))
                                }),
                                function() {
                                    document.body.classList.remove("block-interactivity-".concat(i)), t.forEach(function(e) {
                                        return e.classList.remove("allow-interactivity-".concat(i))
                                    })
                                }
                        }
                    }, [e.inert, e.lockRef.current, e.shards]);
                    var l = e2.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !a.current.allowPinchZoom;
                            var i, o = nB(e),
                                l = r.current,
                                c = "deltaX" in e ? e.deltaX : l[0] - o[0],
                                s = "deltaY" in e ? e.deltaY : l[1] - o[1],
                                u = e.target,
                                d = Math.abs(c) > Math.abs(s) ? "h" : "v";
                            if ("touches" in e && "h" === d && "range" === u.type) return !1;
                            var f = nR(d, u);
                            if (!f) return !0;
                            if (f ? i = d : (i = "v" === d ? "h" : "v", f = nR(d, u)), !f) return !1;
                            if (!n.current && "changedTouches" in e && (c || s) && (n.current = i), !i) return !0;
                            var p = n.current || i;
                            return nU(p, t, e, "h" === p ? c : s, !0)
                        }, []),
                        c = e2.useCallback(function(e) {
                            if (nW.length && nW[nW.length - 1] === o) {
                                var r = "deltaY" in e ? nF(e) : nB(e),
                                    n = t.current.filter(function(t) {
                                        var n;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                                    })[0];
                                if (n && n.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!n) {
                                    var i = (a.current.shards || []).map(nz).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (i.length > 0 ? l(e, i[0]) : !a.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        s = e2.useCallback(function(e, r, n, i) {
                            var o = {
                                name: e,
                                delta: r,
                                target: n,
                                should: i,
                                shadowParent: function(e) {
                                    for (var t, r, n = null; null !== e;) t = e, (null != (r = ShadowRoot) && "undefined" != typeof Symbol && r[Symbol.hasInstance] ? !!r[Symbol.hasInstance](t) : t instanceof r) && (n = e.host, e = e.host), e = e.parentNode;
                                    return n
                                }(n)
                            };
                            t.current.push(o), setTimeout(function() {
                                t.current = t.current.filter(function(e) {
                                    return e !== o
                                })
                            }, 1)
                        }, []),
                        u = e2.useCallback(function(e) {
                            r.current = nB(e), n.current = void 0
                        }, []),
                        d = e2.useCallback(function(t) {
                            s(t.type, nF(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        f = e2.useCallback(function(t) {
                            s(t.type, nB(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    e2.useEffect(function() {
                        return nW.push(o), e.setCallbacks({
                                onScrollCapture: d,
                                onWheelCapture: d,
                                onTouchMoveCapture: f
                            }), document.addEventListener("wheel", c, nA), document.addEventListener("touchmove", c, nA), document.addEventListener("touchstart", u, nA),
                            function() {
                                nW = nW.filter(function(e) {
                                    return e !== o
                                }), document.removeEventListener("wheel", c, nA), document.removeEventListener("touchmove", c, nA), document.removeEventListener("touchstart", u, nA)
                            }
                    }, []);
                    var p = e.removeScrollBar,
                        m = e.inert;
                    return e2.createElement(e2.Fragment, null, m ? e2.createElement(o, {
                        styles: "\n  .block-interactivity-".concat(i, " {pointer-events: none;}\n  .allow-interactivity-").concat(i, " {pointer-events: all;}\n")
                    }) : null, p ? e2.createElement(nI, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, np.useMedium(m), nb),
                nq = e2.forwardRef(function(e, t) {
                    return e2.createElement(ny, na({}, e, {
                        ref: t,
                        sideCar: nV
                    }))
                });
            nq.classNames = ny.classNames;
            var nK = new WeakMap,
                nH = new WeakMap,
                nX = {},
                nY = 0,
                n$ = function(e) {
                    return e && (e.host || n$(e.parentNode))
                },
                nJ = function(e, t, r, n) {
                    var i = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var r = n$(e);
                        return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    nX[r] || (nX[r] = new WeakMap);
                    var o = nX[r],
                        a = [],
                        l = new Set,
                        c = new Set(i),
                        s = function(e) {
                            !e || l.has(e) || (l.add(e), s(e.parentNode))
                        };
                    i.forEach(s);
                    var u = function(e) {
                        !e || c.has(e) || Array.prototype.forEach.call(e.children, function(e) {
                            if (l.has(e)) u(e);
                            else try {
                                var t = e.getAttribute(n),
                                    i = null !== t && "false" !== t,
                                    c = (nK.get(e) || 0) + 1,
                                    s = (o.get(e) || 0) + 1;
                                nK.set(e, c), o.set(e, s), a.push(e), 1 === c && i && nH.set(e, !0), 1 === s && e.setAttribute(r, "true"), i || e.setAttribute(n, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return u(t), l.clear(), nY++,
                        function() {
                            a.forEach(function(e) {
                                var t = nK.get(e) - 1,
                                    i = o.get(e) - 1;
                                nK.set(e, t), o.set(e, i), t || (nH.has(e) || e.removeAttribute(n), nH.delete(e)), i || e.removeAttribute(r)
                            }), --nY || (nK = new WeakMap, nK = new WeakMap, nH = new WeakMap, nX = {})
                        }
                },
                nZ = function(e, t, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var n = Array.from(Array.isArray(e) ? e : [e]),
                        i = t || ("undefined" == typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return i ? (n.push.apply(n, Array.from(i.querySelectorAll("[aria-live], script"))), nJ(n, i, r, "aria-hidden")) : function() {
                        return null
                    }
                };

            function nQ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function n0(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function n1(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function n2(e, t) {
                if (null == e) return {};
                var r, n, i = function(e, t) {
                    if (null == e) return {};
                    var r, n, i = {},
                        o = Object.keys(e);
                    for (n = 0; n < o.length; n++) r = o[n], t.indexOf(r) >= 0 || (i[r] = e[r]);
                    return i
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r])
                }
                return i
            }

            function n3(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return nQ(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nQ(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var n4 = "Dialog",
                n6 = n3(function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        n = function() {
                            var t = r.map(function(e) {
                                return e2.createContext(e)
                            });
                            return function(r) {
                                var n = (null == r ? void 0 : r[e]) || t;
                                return e2.useMemo(function() {
                                    var t, i;
                                    return rS({}, "__scope".concat(e), (t = rO({}, r), i = null != (i = rS({}, e, n)) ? i : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(i)) : (function(e, t) {
                                        var r = Object.keys(e);
                                        if (Object.getOwnPropertySymbols) {
                                            var n = Object.getOwnPropertySymbols(e);
                                            r.push.apply(r, n)
                                        }
                                        return r
                                    })(Object(i)).forEach(function(e) {
                                        Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(i, e))
                                    }), t))
                                }, [r, n])
                            }
                        };
                    return n.scopeName = e, [function(t, n) {
                        var i = e2.createContext(n),
                            o = r.length;
                        r = rE(r).concat([n]);
                        var a = function(t) {
                            var r, n = t.scope,
                                a = t.children,
                                l = rP(t, ["scope", "children"]),
                                c = (null == n || null == (r = n[e]) ? void 0 : r[o]) || i,
                                s = e2.useMemo(function() {
                                    return l
                                }, Object.values(l));
                            return (0, w.jsx)(c.Provider, {
                                value: s,
                                children: a
                            })
                        };
                        return a.displayName = t + "Provider", [a, function(r, a) {
                            var l, c = (null == a || null == (l = a[e]) ? void 0 : l[o]) || i,
                                s = e2.useContext(c);
                            if (s) return s;
                            if (void 0 !== n) return n;
                            throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                        }]
                    }, rj.apply(void 0, [n].concat(rE(t)))]
                }(n4), 2),
                n5 = n6[0];
            n6[1];
            var n8 = n3(n5(n4), 2),
                n7 = n8[0],
                n9 = n8[1],
                ie = function(e) {
                    var t, r, n, i, o, a, l, c, s, u, d, f, p, m, y, b, h, v = e.__scopeDialog,
                        g = e.children,
                        x = e.open,
                        S = e.defaultOpen,
                        O = e.onOpenChange,
                        P = e.modal,
                        E = e2.useRef(null),
                        j = e2.useRef(null),
                        T = n3((s = (c = {
                            prop: x,
                            defaultProp: S,
                            onChange: O
                        }).prop, p = (f = rR((r = (t = {
                            defaultProp: c.defaultProp,
                            onChange: d = void 0 === (u = c.onChange) ? function() {} : u
                        }).defaultProp, n = t.onChange, o = rR(i = e2.useState(r), 1)[0], a = e2.useRef(o), l = rk(n), e2.useEffect(function() {
                            a.current !== o && (l(o), a.current = o)
                        }, [o, a, l]), i), 2))[0], m = f[1], b = (y = void 0 !== s) ? s : p, h = rk(d), [b, e2.useCallback(function(e) {
                            if (y) {
                                var t = "function" == typeof e ? e(s) : e;
                                t !== s && h(t)
                            } else m(e)
                        }, [y, s, m, h])]), 2),
                        N = T[0],
                        I = T[1];
                    return (0, w.jsx)(n7, {
                        scope: v,
                        triggerRef: E,
                        contentRef: j,
                        contentId: rC(),
                        titleId: rC(),
                        descriptionId: rC(),
                        open: void 0 !== N && N,
                        onOpenChange: I,
                        onOpenToggle: e2.useCallback(function() {
                            return I(function(e) {
                                return !e
                            })
                        }, [I]),
                        modal: void 0 === P || P,
                        children: g
                    })
                };
            ie.displayName = n4;
            var it = "DialogTrigger";
            e2.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = n2(e, ["__scopeDialog"]),
                    i = n9(it, r),
                    o = ti(t, i.triggerRef);
                return (0, w.jsx)(r$.button, n1(n0({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": i.open,
                    "aria-controls": i.contentId,
                    "data-state": iO(i.open)
                }, n), {
                    ref: o,
                    onClick: rx(e.onClick, i.onOpenToggle)
                }))
            }).displayName = it;
            var ir = "DialogPortal",
                ii = n3(n5(ir, {
                    forceMount: void 0
                }), 2),
                io = ii[0],
                ia = ii[1],
                il = function(e) {
                    var t = e.__scopeDialog,
                        r = e.forceMount,
                        n = e.children,
                        i = e.container,
                        o = n9(ir, t);
                    return (0, w.jsx)(io, {
                        scope: t,
                        forceMount: r,
                        children: e2.Children.map(n, function(e) {
                            return (0, w.jsx)(nn, {
                                present: r || o.open,
                                children: (0, w.jsx)(ne, {
                                    asChild: !0,
                                    container: i,
                                    children: e
                                })
                            })
                        })
                    })
                };
            il.displayName = ir;
            var ic = "DialogOverlay",
                is = e2.forwardRef(function(e, t) {
                    var r = ia(ic, e.__scopeDialog),
                        n = e.forceMount,
                        i = void 0 === n ? r.forceMount : n,
                        o = n2(e, ["forceMount"]),
                        a = n9(ic, e.__scopeDialog);
                    return a.modal ? (0, w.jsx)(nn, {
                        present: i || a.open,
                        children: (0, w.jsx)(id, n1(n0({}, o), {
                            ref: t
                        }))
                    }) : null
                });
            is.displayName = ic;
            var iu = rV("DialogOverlay.RemoveScroll"),
                id = e2.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = n2(e, ["__scopeDialog"]),
                        i = n9(ic, r);
                    return (0, w.jsx)(nq, {
                        as: iu,
                        allowPinchZoom: !0,
                        shards: [i.contentRef],
                        children: (0, w.jsx)(r$.div, n1(n0({
                            "data-state": iO(i.open)
                        }, n), {
                            ref: t,
                            style: n0({
                                pointerEvents: "auto"
                            }, n.style)
                        }))
                    })
                }),
                ip = "DialogContent",
                im = e2.forwardRef(function(e, t) {
                    var r = ia(ip, e.__scopeDialog),
                        n = e.forceMount,
                        i = void 0 === n ? r.forceMount : n,
                        o = n2(e, ["forceMount"]),
                        a = n9(ip, e.__scopeDialog);
                    return (0, w.jsx)(nn, {
                        present: i || a.open,
                        children: a.modal ? (0, w.jsx)(iy, n1(n0({}, o), {
                            ref: t
                        })) : (0, w.jsx)(ib, n1(n0({}, o), {
                            ref: t
                        }))
                    })
                });
            im.displayName = ip;
            var iy = e2.forwardRef(function(e, t) {
                    var r = n9(ip, e.__scopeDialog),
                        n = e2.useRef(null),
                        i = ti(t, r.contentRef, n);
                    return e2.useEffect(function() {
                        var e = n.current;
                        if (e) return nZ(e)
                    }, []), (0, w.jsx)(ih, n1(n0({}, e), {
                        ref: i,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: rx(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: rx(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                r = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || r) && e.preventDefault()
                        }),
                        onFocusOutside: rx(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                ib = e2.forwardRef(function(e, t) {
                    var r = n9(ip, e.__scopeDialog),
                        n = e2.useRef(!1),
                        i = e2.useRef(!1);
                    return (0, w.jsx)(ih, n1(n0({}, e), {
                        ref: t,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(t) {
                            var o, a;
                            null == (o = e.onCloseAutoFocus) || o.call(e, t), t.defaultPrevented || (n.current || null == (a = r.triggerRef.current) || a.focus(), t.preventDefault()), n.current = !1, i.current = !1
                        },
                        onInteractOutside: function(t) {
                            null == (o = e.onInteractOutside) || o.call(e, t), t.defaultPrevented || (n.current = !0, "pointerdown" === t.detail.originalEvent.type && (i.current = !0));
                            var o, a, l = t.target;
                            (null == (a = r.triggerRef.current) ? void 0 : a.contains(l)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && i.current && t.preventDefault()
                        }
                    }))
                }),
                ih = e2.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = e.trapFocus,
                        i = e.onOpenAutoFocus,
                        o = e.onCloseAutoFocus,
                        a = n2(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = n9(ip, r),
                        c = e2.useRef(null),
                        s = ti(t, c);
                    return (0, no.useFocusGuards)(), (0, w.jsxs)(w.Fragment, {
                        children: [(0, w.jsx)(r3, {
                            asChild: !0,
                            loop: !0,
                            trapped: n,
                            onMountAutoFocus: i,
                            onUnmountAutoFocus: o,
                            children: (0, w.jsx)(r_.DismissableLayer, n1(n0({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": iO(l.open)
                            }, a), {
                                ref: s,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, w.jsxs)(w.Fragment, {
                            children: [(0, w.jsx)(iT, {
                                titleId: l.titleId
                            }), (0, w.jsx)(iN, {
                                contentRef: c,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                iv = "DialogTitle",
                ig = e2.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = n2(e, ["__scopeDialog"]),
                        i = n9(iv, r);
                    return (0, w.jsx)(r$.h2, n1(n0({
                        id: i.titleId
                    }, n), {
                        ref: t
                    }))
                });
            ig.displayName = iv;
            var ix = "DialogDescription";
            e2.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = n2(e, ["__scopeDialog"]),
                    i = n9(ix, r);
                return (0, w.jsx)(r$.p, n1(n0({
                    id: i.descriptionId
                }, n), {
                    ref: t
                }))
            }).displayName = ix;
            var iw = "DialogClose",
                iS = e2.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = n2(e, ["__scopeDialog"]),
                        i = n9(iw, r);
                    return (0, w.jsx)(r$.button, n1(n0({
                        type: "button"
                    }, n), {
                        ref: t,
                        onClick: rx(e.onClick, function() {
                            return i.onOpenChange(!1)
                        })
                    }))
                });

            function iO(e) {
                return e ? "open" : "closed"
            }
            iS.displayName = iw;
            var iP = "DialogTitleWarning",
                iE = n3((y = {
                    contentName: ip,
                    titleName: iv,
                    docsSlug: "dialog"
                }, b = e2.createContext(y), (h = function(e) {
                    var t = e.children,
                        r = rP(e, ["children"]),
                        n = e2.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, w.jsx)(b.Provider, {
                        value: n,
                        children: t
                    })
                }).displayName = iP + "Provider", [h, function(e) {
                    var t = e2.useContext(b);
                    if (t) return t;
                    if (void 0 !== y) return y;
                    throw Error("`".concat(e, "` must be used within `").concat(iP, "`"))
                }]), 2),
                ij = (iE[0], iE[1]),
                iT = function(e) {
                    var t = e.titleId,
                        r = ij(iP),
                        n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return e2.useEffect(function() {
                        t && (document.getElementById(t) || console.error(n))
                    }, [n, t]), null
                },
                iN = function(e) {
                    var t = e.contentRef,
                        r = e.descriptionId,
                        n = ij("DialogDescriptionWarning"),
                        i = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
                    return e2.useEffect(function() {
                        var e, n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        r && n && (document.getElementById(r) || console.warn(i))
                    }, [i, t, r]), null
                };

            function iI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iD(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function iC(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function iA(e, t) {
                if (null == e) return {};
                var r, n, i = function(e, t) {
                    if (null == e) return {};
                    var r, n, i = {},
                        o = Object.keys(e);
                    for (n = 0; n < o.length; n++) r = o[n], t.indexOf(r) >= 0 || (i[r] = e[r]);
                    return i
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r])
                }
                return i
            }

            function ik(e) {
                return function(e) {
                    if (Array.isArray(e)) return iI(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return iI(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iI(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var iM = Symbol("radix.slottable");

            function iR(e) {
                return e2.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === iM
            }

            function i_(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function iL(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        i_(e, t, r[t])
                    })
                }
                return e
            }

            function iU(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }
            var iB = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r, n, i, o, a, l = (r = i = "Primitive.".concat(t), (n = e2.forwardRef(function(e, t) {
                        var r = e.children,
                            n = iA(e, ["children"]);
                        if (e2.isValidElement(r)) {
                            var i, o, a, l, c, s = (c = (l = null == (o = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (c = (l = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                                u = function(e, t) {
                                    var r = iD({}, t);
                                    for (var n in t) ! function(n) {
                                        var i = e[n],
                                            o = t[n];
                                        /^on[A-Z]/.test(n) ? i && o ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = o.apply(void 0, ik(t));
                                            return i.apply(void 0, ik(t)), n
                                        } : i && (r[n] = i) : "style" === n ? r[n] = iD({}, i, o) : "className" === n && (r[n] = [i, o].filter(Boolean).join(" "))
                                    }(n);
                                    return iD({}, e, r)
                                }(n, r.props);
                            return r.type !== e2.Fragment && (u.ref = t ? tn(t, s) : s), e2.cloneElement(r, u)
                        }
                        return e2.Children.count(r) > 1 ? e2.Children.only(null) : null
                    })).displayName = "".concat(r, ".SlotClone"), o = n, (a = e2.forwardRef(function(e, t) {
                        var r = e.children,
                            n = iA(e, ["children"]),
                            i = e2.Children.toArray(r),
                            a = i.find(iR);
                        if (a) {
                            var l = a.props.children,
                                c = i.map(function(e) {
                                    return e !== a ? e : e2.Children.count(l) > 1 ? e2.Children.only(null) : e2.isValidElement(l) ? l.props.children : null
                                });
                            return (0, w.jsx)(o, iC(iD({}, n), {
                                ref: t,
                                children: e2.isValidElement(l) ? e2.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, w.jsx)(o, iC(iD({}, n), {
                            ref: t,
                            children: r
                        }))
                    })).displayName = "".concat(i, ".Slot"), a),
                    c = e2.forwardRef(function(e, r) {
                        var n = e.asChild,
                            i = function(e, t) {
                                if (null == e) return {};
                                var r, n, i = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, i = {},
                                        o = Object.keys(e);
                                    for (n = 0; n < o.length; n++) r = o[n], t.indexOf(r) >= 0 || (i[r] = e[r]);
                                    return i
                                }(e, t);
                                if (Object.getOwnPropertySymbols) {
                                    var o = Object.getOwnPropertySymbols(e);
                                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r])
                                }
                                return i
                            }(e, ["asChild"]),
                            o = n ? l : t;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, w.jsx)(o, iU(iL({}, i), {
                            ref: r
                        }))
                    });
                return c.displayName = "Primitive.".concat(t), iU(iL({}, e), i_({}, t, c))
            }, {});

            function iF(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }
            var iz = Object.freeze({
                    position: "absolute",
                    border: 0,
                    width: 1,
                    height: 1,
                    padding: 0,
                    margin: -1,
                    overflow: "hidden",
                    clip: "rect(0, 0, 0, 0)",
                    whiteSpace: "nowrap",
                    wordWrap: "normal"
                }),
                iG = e2.forwardRef(function(e, t) {
                    var r, n;
                    return (0, w.jsx)(iB.span, (r = iF({}, e), n = n = {
                        ref: t,
                        style: iF({}, iz, e.style)
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e, t) {
                        var r = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var n = Object.getOwnPropertySymbols(e);
                            r.push.apply(r, n)
                        }
                        return r
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r))
                });

            function iW(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function iV(e, t) {
                if (null == e) return {};
                var r, n, i = function(e, t) {
                    if (null == e) return {};
                    var r, n, i = {},
                        o = Object.keys(e);
                    for (n = 0; n < o.length; n++) r = o[n], t.indexOf(r) >= 0 || (i[r] = e[r]);
                    return i
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r])
                }
                return i
            }
            iG.displayName = "VisuallyHidden";
            var iq = (0, e2.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                iK = function() {
                    var e = (0, e2.useContext)(iq);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                iH = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                iX = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                iY = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                i$ = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.children,
                        i = e.size,
                        o = e.type,
                        a = void 0 === o ? "Default" : o,
                        l = e.isModal,
                        c = e.hasCloseAffordance,
                        s = e.closeLabel,
                        u = e.hasMarginTop,
                        d = void 0 === u || u,
                        f = e.hasMarginBottom,
                        p = void 0 === f || f,
                        m = e.hasDescription,
                        y = void 0 !== m && m,
                        b = e.experimentalDisablePointerEventsStylingOnBody,
                        h = void 0 !== b && b,
                        v = (0, e2.useMemo)(function() {
                            return {
                                size: i,
                                isModal: l,
                                type: a,
                                hasCloseAffordance: c,
                                closeLabel: s,
                                hasMarginTop: d,
                                hasMarginBottom: p,
                                hasDescription: y
                            }
                        }, [i, l, a, c, s, d, p, y]);
                    return (0, e2.useEffect)(function() {
                        h && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [h, t]), e3().createElement(iq.Provider, {
                        value: v
                    }, e3().createElement(ie, {
                        open: t,
                        onOpenChange: r
                    }, n))
                };
            i$.displayName = "Dialog";
            var iJ = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.style,
                    i = e.overlayClassName,
                    o = e.overlayStyle,
                    a = e.onOpenAutoFocus,
                    l = iV(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    c = iK(),
                    s = c.size,
                    u = c.isModal,
                    d = c.hasCloseAffordance,
                    f = c.closeLabel,
                    p = c.hasDescription,
                    m = e4("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", u && "bg-common-backdrop", i),
                    y = e4("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return e3().createElement(il, null, e3().createElement(is, {
                    className: m,
                    style: o
                }, e3().createElement(im, iW({
                    className: y,
                    "data-size": s,
                    style: n,
                    onOpenAutoFocus: a
                }, !p && {
                    "aria-describedby": void 0
                }, l), d && e3().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, e3().createElement(iS, {
                    asChild: !0
                }, e3().createElement(rg, {
                    variant: "OverMedia",
                    size: s,
                    isCircular: !0,
                    "aria-label": f
                }))), t)))
            };
            iJ.displayName = "DialogContent";
            var iZ = function(e) {
                var t = e.children,
                    r = e.className,
                    n = iV(e, ["children", "className"]),
                    i = iK(),
                    o = i.size,
                    a = i.hasMarginTop,
                    l = i.hasMarginBottom,
                    c = e4(iH[o], a && iX[o], l && iY[o], r);
                return e3().createElement("div", iW({
                    className: c
                }, n), t)
            };
            iZ.displayName = "DialogBody";
            var iQ = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.hidden,
                    i = iV(e, ["children", "className", "hidden"]),
                    o = e3().createElement(ig, iW({
                        className: r
                    }, i), t);
                return n ? e3().createElement(iG, null, o) : o
            };
            iQ.displayName = "DialogTitle";
            var i0 = function(e) {
                var t = e.children,
                    r = e.className,
                    n = iV(e, ["children", "className"]),
                    i = iK().size,
                    o = e4(iH[i], iY[i], r);
                return e3().createElement("div", iW({
                    className: o
                }, n), t)
            };
            i0.displayName = "DialogFooter";
            var i1 = function(e) {
                var t = e.open,
                    r = e.onOpenChange,
                    n = e.title,
                    i = e.body,
                    o = (0, S.useTranslation)().translate;
                return (0, w.jsx)(i$, {
                    closeLabel: o("Action.Close"),
                    hasCloseAffordance: !0,
                    isModal: !0,
                    open: t,
                    size: "Small",
                    type: "Default",
                    onOpenChange: r,
                    children: (0, w.jsxs)(iJ, {
                        className: "stroke-standard stroke-default flex flex-col items-start",
                        style: {
                            width: "100%",
                            maxWidth: 320
                        },
                        children: [(0, w.jsxs)(iZ, {
                            className: "width-full gap-small padding-top-medium padding-x-xlarge padding-bottom-large flex flex-col items-start",
                            children: [(0, w.jsx)(iQ, {
                                className: "margin-none text-heading-small content-emphasis text-align-x-start",
                                children: n
                            }), (0, w.jsx)("p", {
                                className: "margin-none text-body-medium content-default text-align-x-start whitespace-pre-line",
                                children: i
                            })]
                        }), (0, w.jsx)(i0, {
                            className: "width-full",
                            children: (0, w.jsx)(tP, {
                                className: "width-full",
                                size: "Medium",
                                variant: "Emphasis",
                                onClick: function() {
                                    r(!1)
                                },
                                children: o("Action.OK")
                            })
                        })]
                    })
                })
            };

            function i2(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function i3(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function i4(e, t) {
                if (null == e) return {};
                var r, n, i = function(e, t) {
                    if (null == e) return {};
                    var r, n, i = {},
                        o = Object.keys(e);
                    for (n = 0; n < o.length; n++) r = o[n], t.indexOf(r) >= 0 || (i[r] = e[r]);
                    return i
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r])
                }
                return i
            }
            var i6 = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                i5 = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                i8 = {
                    Large: {
                        circular: "radius-circle",
                        square: "radius-medium"
                    },
                    Medium: {
                        circular: "radius-circle",
                        square: "radius-medium"
                    },
                    Small: {
                        circular: "radius-circle",
                        square: "radius-medium"
                    },
                    XSmall: {
                        circular: "radius-circle",
                        square: "radius-small"
                    }
                },
                i7 = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                i9 = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                oe = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                ot = {
                    Default: {
                        Emphasis: "content-action-emphasis",
                        Standard: "content-action-standard",
                        Alert: "content-action-alert",
                        Utility: "content-emphasis",
                        OverMedia: "content-emphasis"
                    },
                    Inverse: {
                        Emphasis: "content-inverse-action-emphasis",
                        Standard: "content-inverse-action-standard",
                        Alert: "content-inverse-action-alert",
                        Utility: "content-inverse-emphasis",
                        OverMedia: "content-inverse-emphasis"
                    }
                },
                or = {
                    Default: {
                        Emphasis: "content-action-standard",
                        Standard: "content-action-standard",
                        Alert: "content-action-standard",
                        Utility: "content-emphasis",
                        OverMedia: "content-emphasis"
                    },
                    Inverse: {
                        Emphasis: "content-inverse-action-standard",
                        Standard: "content-inverse-action-standard",
                        Alert: "content-inverse-action-standard",
                        Utility: "content-inverse-emphasis",
                        OverMedia: "content-inverse-emphasis"
                    }
                },
                on = (0, e2.forwardRef)(function(e, t) {
                    var r, n = e.className,
                        i = e.icon,
                        o = e.ariaLabel,
                        a = e.isDisabled,
                        l = void 0 !== a && a,
                        c = e.isCircular,
                        s = e.isSelected,
                        u = e.size,
                        d = void 0 === u ? "Large" : u,
                        f = e.variant,
                        p = void 0 === f ? "Emphasis" : f,
                        m = e.iconColor,
                        y = void 0 === m ? "Default" : m,
                        b = e.asChild,
                        h = e.children,
                        v = i4(e, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]);
                    r = l ? i9[p] : void 0 !== s && s ? oe[p] : i7[p];
                    var g = e4("foundation-web-icon-button", l ? e9 : [e8, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", i6[d], i8[d][void 0 !== c && c ? "circular" : "square"], r, n),
                        x = e3().createElement(e3().Fragment, null, e3().createElement(e7, null), e3().createElement("span", {
                            className: e4("icon", i, i5[d], l ? or[y][p] : ot[y][p])
                        }));
                    if (b) {
                        v.as;
                        var w = i4(v, ["as"]),
                            S = e3().Children.only(h);
                        return e3().createElement(tm, i3(i2({
                            ref: t
                        }, w), {
                            className: g,
                            "aria-label": o,
                            "aria-disabled": l || void 0
                        }), e3().cloneElement(S, {}, x))
                    }
                    if ("a" === v.as) {
                        v.as;
                        var O = v.href,
                            P = i4(v, ["as", "href"]);
                        return e3().createElement("a", i3(i2({
                            ref: t
                        }, P), {
                            "aria-label": o,
                            "aria-disabled": l,
                            href: l ? void 0 : O,
                            className: g
                        }), x)
                    }
                    v.as;
                    var E = i4(v, ["as"]);
                    return e3().createElement("button", i3(i2({
                        ref: t,
                        type: "button"
                    }, E), {
                        "aria-label": o,
                        disabled: l,
                        className: g
                    }), x)
                });

            function oi(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }
            var oo = (0, e2.forwardRef)(function(e, t) {
                var r, n, i = e.className,
                    o = e.style,
                    a = e.orientation,
                    l = void 0 === a ? "horizontal" : a,
                    c = e.variant,
                    s = void 0 === c ? "Standard" : c,
                    u = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = function(e, t) {
                            if (null == e) return {};
                            var r, n, i = {},
                                o = Object.keys(e);
                            for (n = 0; n < o.length; n++) r = o[n], t.indexOf(r) >= 0 || (i[r] = e[r]);
                            return i
                        }(e, t);
                        if (Object.getOwnPropertySymbols) {
                            var o = Object.getOwnPropertySymbols(e);
                            for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r])
                        }
                        return i
                    }(e, ["className", "style", "orientation", "variant"]),
                    d = "vertical" === l,
                    f = {};
                return d || "Inset" !== s ? d || "InsetLeft" !== s ? d || "InsetRight" !== s || (f = {
                    marginRight: "var(--padding-xlarge)"
                }) : f = {
                    marginLeft: "var(--padding-xlarge)"
                } : f = {
                    marginLeft: "var(--padding-xlarge)",
                    marginRight: "var(--padding-xlarge)"
                }, e3().createElement("div", (r = oi({
                    ref: t
                }, u), n = n = {
                    role: "separator",
                    "data-orientation": l,
                    "aria-orientation": l,
                    style: oi({
                        borderRightWidth: 0,
                        borderBottomWidth: 0,
                        boxSizing: "border-box",
                        borderStyle: "solid"
                    }, d ? {
                        height: "100%",
                        width: 0,
                        borderLeftWidth: "var(--stroke-standard)",
                        borderTopWidth: 0
                    } : "Thick" === s ? {
                        height: "var(--size-250)",
                        borderTop: "var(--stroke-standard)",
                        borderLeftWidth: 0,
                        background: "var(--color-common-heavydivider, rgba(0, 0, 0, 0.50))"
                    } : {
                        height: 0,
                        borderTopWidth: "var(--stroke-standard)",
                        borderLeftWidth: 0
                    }, f, o),
                    className: e4("stroke-default self-stretch", i)
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(n)).forEach(function(e) {
                    Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                }), r))
            });
            oo.displayName = "Divider";
            var oa = function(e) {
                var t = e.type,
                    r = e.sideSheetSide,
                    n = e.isSideSheetFlush,
                    i = e.centerSheetSize,
                    o = e.children,
                    a = e.overlayClassName,
                    l = e.contentClassName,
                    c = e.onOpenAutoFocus,
                    s = e.onCloseAutoFocus,
                    u = e.onPointerDownOutside,
                    d = e.onEscapeKeyDown,
                    f = e.onInteractOutside;
                return e3().createElement(il, null, e3().createElement(is, {
                    "data-testid": "fui-base-sheet-overlay",
                    "data-type": t,
                    "data-side": "sideSheet" === t ? void 0 === r ? "right" : r : void 0,
                    "data-flush": "sideSheet" === t ? void 0 !== n && n : void 0,
                    "data-size": "centerSheet" === t ? void 0 === i ? "Medium" : i : void 0,
                    className: e4("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", a)
                }, e3().createElement(im, {
                    "data-testid": "fui-base-sheet-content",
                    className: e4("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", l),
                    onOpenAutoFocus: c,
                    onCloseAutoFocus: s,
                    onPointerDownOutside: u,
                    onEscapeKeyDown: d,
                    onInteractOutside: f
                }, o)))
            };

            function ol(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var oc = function(e) {
                    return ("function" != typeof e.checkVisibility || e.checkVisibility()) && !("disabled" in e && e.disabled || "true" === e.getAttribute("aria-disabled"))
                },
                os = function(e) {
                    ol(e, HTMLInputElement) && "function" == typeof e.select && e.select()
                },
                ou = function(e) {
                    var t = e.currentTarget;
                    if (t) {
                        var r = t.querySelectorAll("[data-autofocus-priority]");
                        if (0 !== r.length) {
                            var n = [];
                            r.forEach(function(e) {
                                var t = parseInt(e.getAttribute("data-autofocus-priority") || "", 10);
                                !Number.isNaN(t) && ol(e, HTMLElement) && n.push({
                                    element: e,
                                    priority: t
                                })
                            }), n.sort(function(e, t) {
                                return e.priority - t.priority
                            });
                            var i = n.find(function(e) {
                                return oc(e.element)
                            });
                            if (i) {
                                e.preventDefault();
                                var o = document.activeElement === i.element;
                                i.element.focus(), o || os(i.element)
                            }
                        }
                    }
                };

            function od(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            r(792);
            var of = "undefined" != typeof window ? e2.useLayoutEffect : e2.useEffect, op = "undefined" == typeof window;

            function om(e) {
                var t, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = r.defaultValue,
                    i = void 0 !== n && n,
                    o = r.initializeWithValue,
                    a = void 0 === o || o,
                    l = function(e) {
                        return op ? i : window.matchMedia(e).matches
                    },
                    c = (t = (0, e2.useState)(function() {
                        return a ? l(e) : i
                    }), function(e) {
                        if (Array.isArray(e)) return e
                    }(t) || function(e, t) {
                        var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != i) {
                            var o = [],
                                a = !0,
                                l = !1;
                            try {
                                for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), o.length !== t); a = !0);
                            } catch (e) {
                                l = !0, n = e
                            } finally {
                                try {
                                    a || null == i.return || i.return()
                                } finally {
                                    if (l) throw n
                                }
                            }
                            return o
                        }
                    }(t, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return od(e, 2);
                            var r = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return od(e, t)
                        }
                    }(t, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    s = c[0],
                    u = c[1];

                function d() {
                    u(l(e))
                }
                return of(function() {
                    var t = window.matchMedia(e);
                    return d(), t.addListener ? t.addListener(d) : t.addEventListener("change", d),
                        function() {
                            t.removeListener ? t.removeListener(d) : t.removeEventListener("change", d)
                        }
                }, [e]), s
            }

            function oy(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function ob(e, t) {
                if (null == e) return {};
                var r, n, i = function(e, t) {
                    if (null == e) return {};
                    var r, n, i = {},
                        o = Object.keys(e);
                    for (n = 0; n < o.length; n++) r = o[n], t.indexOf(r) >= 0 || (i[r] = e[r]);
                    return i
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r])
                }
                return i
            }
            var oh = (0, e2.createContext)(null),
                ov = function() {
                    var e = (0, e2.useContext)(oh);
                    if (!e) throw Error("Sheet components must be used within a Sheet");
                    return e
                },
                og = "padding-x-xlarge",
                ox = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.defaultOpen,
                        i = e.children;
                    return e3().createElement(ie, {
                        open: t,
                        onOpenChange: r,
                        defaultOpen: n,
                        modal: !0
                    }, i)
                },
                ow = function(e) {
                    var t, r = e.children,
                        n = e.centerSheetSize,
                        i = void 0 === n ? "Medium" : n,
                        o = e.largeScreenVariant,
                        a = void 0 === o ? "center" : o,
                        l = e.closeLabel,
                        c = e.className,
                        s = e.mobilePortraitClassName,
                        u = e.mobileLandscapeClassName,
                        d = e.largeScreenClassName,
                        f = e.onOpenAutoFocus,
                        p = e.onCloseAutoFocus,
                        m = e.onPointerDownOutside,
                        y = e.onEscapeKeyDown,
                        b = e.onInteractOutside,
                        h = om("(orientation: portrait) and (max-width: 600px)"),
                        v = om("(orientation: landscape) and (max-height: 600px)");
                    t = h ? "bottomSheet" : v || "side" === a ? "sideSheet" : "centerSheet";
                    var g = (0, e2.useMemo)(function() {
                            return {
                                centerSheetSize: i,
                                largeScreenVariant: a,
                                closeLabel: l,
                                isPortraitMobile: h,
                                isLandscapeMobile: v,
                                type: t
                            }
                        }, [i, a, l, h, v, t]),
                        x = e4(c, h && s, v && u, !h && !v && d);
                    return e3().createElement(oh.Provider, {
                        value: g
                    }, e3().createElement(oa, {
                        type: t,
                        sideSheetSide: "right",
                        isSideSheetFlush: v,
                        centerSheetSize: i,
                        contentClassName: x,
                        onOpenAutoFocus: null != f ? f : ou,
                        onCloseAutoFocus: p,
                        onPointerDownOutside: m,
                        onEscapeKeyDown: y,
                        onInteractOutside: b
                    }, r))
                },
                oS = (0, e2.forwardRef)(function(e, t) {
                    var r = e.children,
                        n = e.className,
                        i = e.hasPaddingX,
                        o = ob(e, ["children", "className", "hasPaddingX"]),
                        a = ov().type;
                    return e3().createElement("div", oy({
                        ref: t,
                        className: e4("scroll-y", (void 0 === i || i) && og, "sideSheet" === a ? "grow-1" : "", n)
                    }, o), r)
                });
            oS.displayName = "SheetBody";
            var oO = function(e) {
                    var t = e.className,
                        r = e.children,
                        n = e.navigation,
                        i = e.utilities,
                        o = e.visuallyHideTitleText,
                        a = ov().closeLabel,
                        l = e3().createElement(ig, {
                            className: "text-heading-small margin-none"
                        }, r);
                    return e3().createElement("div", {
                        className: e4(t, n ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
                    }, e3().createElement("div", {
                        className: e4("flex items-center", n && "gap-xsmall")
                    }, n, o ? e3().createElement(iG, null, l) : l), e3().createElement("div", {
                        className: e4("flex items-center", i && "gap-xxsmall")
                    }, i, e3().createElement("div", {
                        className: "fui-sheet-close-affordance-container"
                    }, e3().createElement(iS, {
                        asChild: !0
                    }, e3().createElement(on, {
                        variant: "Utility",
                        size: "Medium",
                        icon: "icon-regular-x",
                        ariaLabel: a || "",
                        "data-autofocus-priority": "1000"
                    })))))
                },
                oP = function(e) {
                    var t = e.children,
                        r = e.className,
                        n = ob(e, ["children", "className"]);
                    return e3().createElement(e3().Fragment, null, e3().createElement(oo, null), e3().createElement("div", oy({
                        className: e4(og, "margin-y-small shrink-0", r)
                    }, n), t))
                },
                oE = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600"
                },
                oj = {
                    XSmall: "size-150",
                    Small: "size-200",
                    Medium: "size-250"
                },
                oT = {
                    XSmall: "size-1200",
                    Small: "size-1400",
                    Medium: "size-1600"
                },
                oN = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium"
                },
                oI = {
                    XSmall: void 0,
                    Small: "padding-top-xxsmall",
                    Medium: "padding-y-xxsmall"
                },
                oD = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium"
                },
                oC = {
                    XSmall: "padding-medium",
                    Small: "padding-large",
                    Medium: "padding-xlarge"
                },
                oA = {
                    XSmall: "Small",
                    Small: "Medium",
                    Medium: "Large"
                },
                ok = (0, e2.forwardRef)(function(e, t) {
                    var r = e.layout,
                        n = e.size,
                        i = e.type,
                        o = e.isDisabled,
                        a = e.label,
                        l = e.description,
                        c = e.media,
                        s = e.icon,
                        u = e.metadata,
                        d = e.isSelected,
                        f = e.onSelect,
                        p = e.hideSelectedIndicator,
                        m = void 0 !== p && p,
                        y = (0, e2.useMemo)(function() {
                            return a && e3().createElement("div", {
                                className: e4(oN[n], oI[n], "content-emphasis text-align-x-start", "clip [display:-webkit-box] [-webkit-line-clamp:3] [-webkit-box-orient:vertical]")
                            }, a)
                        }, [a, n]),
                        b = (0, e2.useMemo)(function() {
                            return u && e3().createElement("div", {
                                className: e4("text-caption-small content-default text-align-x-start", "text-truncate-split text-no-wrap width-full")
                            }, u)
                        }, [u]),
                        h = (0, e2.useMemo)(function() {
                            return l && e3().createElement("div", {
                                className: e4(oD[n], "content-default text-align-x-start")
                            }, l)
                        }, [l, n]),
                        v = (0, e2.useMemo)(function() {
                            return s && e3().createElement(e5, {
                                name: s,
                                size: oA[n]
                            })
                        }, [s, n]),
                        g = (0, e2.useMemo)(function() {
                            switch (i) {
                                case "Checkmark":
                                    return d && e3().createElement(e5, {
                                        name: "icon-filled-check",
                                        size: oA[n]
                                    });
                                case "Checkbox":
                                    return e3().createElement("div", {
                                        className: e4(oE[n], "flex items-center justify-center radius-small padding-none content-default", d ? "stroke-none" : "stroke-standard stroke-emphasis", d ? "bg-system-contrast" : "bg-none")
                                    }, d && e3().createElement("div", {
                                        className: e4(oE[n], "content-inverse-emphasis icon icon-filled-check")
                                    }));
                                case "Radio":
                                    return e3().createElement("div", {
                                        className: e4(oE[n], "radius-circle flex items-center justify-center stroke-emphasis stroke-standard", d ? "bg-system-contrast" : "bg-none")
                                    }, d && e3().createElement("div", {
                                        className: e4("radius-circle bg-inverse-action-sub-emphasis", oj[n])
                                    }));
                                default:
                                    return console.error("Invalid OptionSelector type ".concat(i)), null
                            }
                        }, [i, n, d]),
                        x = (0, e2.useMemo)(function() {
                            return c && e3().createElement("div", {
                                className: e4(oT[n], "flex items-center justify-center clip shrink-0")
                            }, c)
                        }, [c, n]),
                        w = (0, e2.useMemo)(function() {
                            var e = !m && e3().createElement("div", {
                                className: oE[n]
                            }, g);
                            switch (r) {
                                case "Horizontal":
                                    return e3().createElement("div", {
                                        className: "flex gap-large"
                                    }, x, e3().createElement("div", {
                                        className: "flex flex-col gap-xsmall fill clip"
                                    }, e3().createElement("div", {
                                        className: "flex gap-small items-start"
                                    }, e3().createElement("div", {
                                        className: "flex flex-col items-start fill clip"
                                    }, e3().createElement("div", {
                                        className: "flex gap-small items-center width-full"
                                    }, v, y), b), e), h));
                                case "Vertical":
                                    return e3().createElement("div", {
                                        className: "flex flex-col gap-xsmall"
                                    }, e3().createElement("div", {
                                        className: "flex gap-small"
                                    }, e3().createElement("div", {
                                        className: "flex flex-col gap-medium fill min-width-0"
                                    }, x, e3().createElement("div", {
                                        className: "flex flex-col gap-xsmall"
                                    }, v, y, b)), e), h);
                                default:
                                    return console.error("Invalid OptionSelector layout ".concat(r)), null
                            }
                        }, [r, x, v, y, h, g, n, b, m]);
                    return e3().createElement("button", {
                        type: "button",
                        className: e4(e8, "focus:outline-focus bg-none width-full radius-medium stroke-standard", d ? "stroke-system-contrast" : "stroke-contrast-alpha", oC[n], o && "opacity-[0.5]", !o && "cursor-pointer"),
                        disabled: o,
                        ref: t,
                        onClick: function() {
                            return f()
                        }
                    }, !o && e3().createElement(e7, null), w)
                });
            ok.displayName = "OptionSelector";
            var oM = ((v = {}).LIST_AVAILABLE_PRODUCTS_FAILED = "ListAvailableProductsFailed", v.LIST_AVAILABLE_PRODUCTS_EMPTY = "ListAvailableProductsEmpty", v.LIST_SUBSCRIPTIONS_FAILED = "ListSubscriptionsFailed", v.GET_USER_BENEFITS_FAILED = "GetUserBenefitsFailed", v.GUAC_APP_POLICY_FAILED = "GuacAppPolicyFailed", v.MEMBERSHIP_POLLING_TIMEOUT = "MembershipPollingTimeout", v.PURCHASE_VIEW_SHOWN = "PurchaseViewShown", v.PURCHASE_VIEW_OPEN_SHEET_CLICK = "PurchaseViewOpenSheetClick", v.BUNDLE_PICKER_SHEET_OPENED = "BundlePickerSheetOpened", v.BUNDLE_PICKER_TIER_SELECTED = "BundlePickerTierSelected", v.BUNDLE_PICKER_SUBSCRIBE_CLICK = "BundlePickerSubscribeClick", v.BUNDLE_PICKER_ROW_MISSING_ROBUX_ALLOWANCE = "BundlePickerRowMissingRobuxAllowance", v.BUNDLE_PICKER_ROW_MISSING_STRIKETHROUGH_PRICE = "BundlePickerRowMissingStrikethroughPrice", v.MISSING_FEATURE_CONFIG = "MissingFeatureConfig", v),
                oR = (0, window.Roblox["web-telemetry"].fire.createFireTelemetryCounter)("RobloxSubscription"),
                o_ = function(e) {
                    var t = e.product,
                        r = e.isBundle,
                        n = (0, S.useTranslation)(),
                        i = n.translate,
                        o = n.intl,
                        a = tF(t);
                    (0, e2.useEffect)(function() {
                        r && 0 === a && oR(oM.BUNDLE_PICKER_ROW_MISSING_ROBUX_ALLOWANCE, {
                            productId: t.productKey.id
                        }), r && !t.localizedStrikethroughPriceDisplayString && oR(oM.BUNDLE_PICKER_ROW_MISSING_STRIKETHROUGH_PRICE, {
                            productId: t.productKey.id,
                            currencyCode: t.localizedPrice.currencyCode
                        })
                    }, [r, t.localizedPrice.currencyCode, t.localizedStrikethroughPriceDisplayString, t.productKey.id, a]);
                    var l = o.n(a),
                        c = a > 0 ? "".concat(i("Label.BlackbirdShort"), " ").concat(a) : i("Label.Blackbird"),
                        s = t.localizedPriceDisplayString,
                        u = t.localizedStrikethroughPriceDisplayString;
                    return (0, w.jsxs)("div", {
                        className: "width-full min-height-700 flex flex-col items-stretch justify-center",
                        children: [(0, w.jsxs)("div", {
                            className: "width-full flex flex-row items-center justify-between",
                            children: [(0, w.jsx)("span", {
                                className: "text-title-medium content-emphasis",
                                children: c
                            }), (0, w.jsxs)("div", {
                                className: "gap-small flex flex-row items-center justify-end",
                                children: [u && (0, w.jsx)("span", {
                                    className: "text-body-medium strike-through",
                                    style: {
                                        color: "#6a6f81"
                                    },
                                    children: u
                                }), (0, w.jsx)("span", {
                                    className: "text-body-medium content-emphasis text-strikethrough",
                                    children: s
                                })]
                            })]
                        }), a > 0 && (0, w.jsx)("div", {
                            className: "width-full gap-xsmall flex flex-row items-center justify-start",
                            children: (0, w.jsx)("span", {
                                className: "text-body-medium content-default flex flex-row items-center",
                                children: rs(i, "Plus.LandingPage.BottomSheet.Benefit", [{
                                    opening: "amountStart",
                                    closing: "amountEnd",
                                    render: function(e) {
                                        return (0, w.jsxs)("span", {
                                            className: "padding-left-xxsmall gap-x-xxsmall flex flex-row items-center",
                                            children: [(0, w.jsx)(e5, {
                                                name: "icon-regular-robux",
                                                size: "XSmall"
                                            }), e]
                                        })
                                    }
                                }], {
                                    price: l
                                })
                            })
                        })]
                    })
                },
                oL = function(e) {
                    var t = e.product,
                        r = e.isSelected,
                        n = e.onSelect,
                        i = e.isBundle;
                    return (0, w.jsx)("div", {
                        "data-testid": "bundle-picker-tier-".concat(t.productKey.id),
                        children: (0, w.jsx)(ok, {
                            hideSelectedIndicator: !0,
                            isSelected: r,
                            label: void 0,
                            layout: "Horizontal",
                            metadata: (0, w.jsx)(o_, {
                                isBundle: i,
                                product: t
                            }),
                            size: "XSmall",
                            type: "Checkmark",
                            onSelect: n
                        })
                    })
                };

            function oU(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var oB = function(e) {
                    var t, r, n, i, o, a, l = e.isOpen,
                        c = e.onOpenChange,
                        s = e.products,
                        u = e.deviceMeta,
                        d = e.isEntrypointDisabled,
                        f = e.onMobilePurchaseInitiated,
                        p = e.paymentSessionId,
                        m = (0, S.useTranslation)().translate,
                        y = null == (o = s[0]) ? void 0 : o.productKey.id,
                        b = (t = (0, e2.useState)(y), function(e) {
                            if (Array.isArray(e)) return e
                        }(t) || function(e, t) {
                            var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != i) {
                                var o = [],
                                    a = !0,
                                    l = !1;
                                try {
                                    for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), o.length !== t); a = !0);
                                } catch (e) {
                                    l = !0, n = e
                                } finally {
                                    try {
                                        a || null == i.return || i.return()
                                    } finally {
                                        if (l) throw n
                                    }
                                }
                                return o
                            }
                        }(t, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return oU(e, 2);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oU(e, t)
                            }
                        }(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        h = b[0],
                        v = b[1];
                    (0, e2.useEffect)(function() {
                        h && s.some(function(e) {
                            return e.productKey.id === h
                        }) || v(y)
                    }, [y, s, h]);
                    var g = (0, e2.useMemo)(function() {
                            var e;
                            return null != (e = s.find(function(e) {
                                return e.productKey.id === h
                            })) ? e : s[0]
                        }, [s, h]),
                        x = !!g && void 0 !== tz(g),
                        O = (0, e2.useRef)(!1);
                    (0, e2.useEffect)(function() {
                        if (!l) {
                            O.current = !1;
                            return
                        }!O.current && p && (O.current = !0, tZ().sendUserPurchaseFlowEvent(tZ().ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, tZ().ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, tZ().ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, tZ().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_BUNDLE_SHEET_OPENED, p ? {
                            paymentSessionId: p
                        } : {}), oR(oM.BUNDLE_PICKER_SHEET_OPENED, {
                            tierCount: String(s.length),
                            defaultProductId: null != y ? y : ""
                        }))
                    }, [l, p, s.length, y]);
                    var P = (0, e2.useCallback)(function(e) {
                            v(e), tZ().sendUserPurchaseFlowEvent(tZ().ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, tZ().ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, tZ().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, tZ().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_BUNDLE_TIER_SELECTED, function(e) {
                                for (var t = 1; t < arguments.length; t++) {
                                    var r = null != arguments[t] ? arguments[t] : {},
                                        n = Object.keys(r);
                                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                                    }))), n.forEach(function(t) {
                                        var n;
                                        n = r[t], t in e ? Object.defineProperty(e, t, {
                                            value: n,
                                            enumerable: !0,
                                            configurable: !0,
                                            writable: !0
                                        }) : e[t] = n
                                    })
                                }
                                return e
                            }({
                                product_id: e
                            }, p ? {
                                paymentSessionId: p
                            } : {})), oR(oM.BUNDLE_PICKER_TIER_SELECTED, {
                                productId: e
                            })
                        }, [p]),
                        E = (0, e2.useCallback)(function() {
                            var e = x ? tZ().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : tZ().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                            tZ().sendUserPurchaseFlowEvent(tZ().ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, tZ().ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, tZ().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, e, p ? {
                                paymentSessionId: p
                            } : {}), oR(oM.BUNDLE_PICKER_SUBSCRIBE_CLICK, {
                                productId: null != h ? h : "",
                                isFreeTrial: String(x)
                            })
                        }, [x, h, p]);
                    if (!g) return null;
                    var j = [{
                            opening: "linkStart",
                            closing: "linkEnd",
                            render: function(e) {
                                return (0, w.jsx)("a", {
                                    className: "content-link underline",
                                    href: "https://www.roblox.com/info/terms",
                                    rel: "noopener noreferrer",
                                    target: "_blank",
                                    children: e
                                })
                            }
                        }],
                        T = (i = null == (n = tz(g)) || null == (r = n.freeTrialOffer) ? void 0 : r.estimatedTrialEndDate) ? new Date(i).toLocaleDateString(void 0, {
                            year: "numeric",
                            month: "long",
                            day: "numeric"
                        }) : "",
                        N = d ? m("Description.EntrypointDisabled") : rs(m, x ? "Description.SubscriptionFreeTrialLegal" : "Description.SubscriptionLegal", j, x ? {
                            date: T
                        } : void 0),
                        I = u.isAndroidApp || u.isIosApp,
                        D = x ? m("Action.TryItForFree") : m("Action.PricePerMonth", {
                            price: null != (a = g.localizedPriceDisplayString) ? a : "",
                            periodType: g.periodType
                        });
                    return (0, w.jsx)(ox, {
                        open: l,
                        onOpenChange: c,
                        children: (0, w.jsxs)(ow, {
                            centerSheetSize: "Medium",
                            closeLabel: m("Action.Close"),
                            largeScreenVariant: "center",
                            children: [(0, w.jsx)(oO, {
                                children: m("Label.PickAPlan")
                            }), (0, w.jsx)(oS, {
                                className: "gap-y-medium padding-y-medium flex flex-col",
                                "data-testid": "bundle-picker-sheet-body",
                                children: s.map(function(e, t) {
                                    return (0, w.jsx)(oL, {
                                        isBundle: 0 !== t,
                                        isSelected: g.productKey.id === e.productKey.id,
                                        product: e,
                                        onSelect: function() {
                                            P(e.productKey.id)
                                        }
                                    }, e.productKey.id)
                                })
                            }), (0, w.jsx)(oP, {
                                children: (0, w.jsxs)("div", {
                                    className: "gap-y-small flex flex-col",
                                    children: [(0, w.jsx)(rd, {
                                        className: "width-full",
                                        deviceMeta: u,
                                        isDisabled: d,
                                        paymentSessionId: p,
                                        productId: null != h ? h : "",
                                        productType: g.productKey.type,
                                        size: "Medium",
                                        trackSubscriptionButtonClick: E,
                                        onSubscribeClick: I ? f : void 0,
                                        children: D
                                    }), (0, w.jsx)("p", {
                                        className: "text-caption-small content-muted text-align-x-left",
                                        "data-testid": "bundle-picker-legal-footer",
                                        children: N
                                    })]
                                })
                            })]
                        })
                    })
                },
                oF = window.Roblox["core-scripts"].deepLink,
                oz = {
                    itemId: 0x4b45c0ee905a,
                    itemType: oF.ItemType.Asset
                },
                oG = function(e) {
                    var t = e.itemId,
                        r = e.itemType;
                    return "roblox://navigation/item_details?itemId=".concat(t, "&itemType=").concat(r)
                },
                oW = function(e) {
                    var t = e.itemId,
                        r = e.itemType;
                    return "roblox://navigation/avatar?itemId=".concat(t, "&itemType=").concat(r)
                },
                oV = function(e) {
                    return (0, oF.navigateToDeepLink)(oG(e))
                },
                oq = function(e) {
                    var t, r;
                    return (0, oF.navigateToDeepLink)(null != (r = null == (t = (0, e0.getDeviceMeta)()) ? void 0 : t.isInApp) && r ? oW(e) : "roblox://navigation/avatar")
                };

            function oK(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oH(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function oX(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function oY(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return oK(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oK(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var o$ = {
                    enabled: !1,
                    arrivedGiftDate: new Date(2026, 7, 14)
                },
                oJ = function(e) {
                    var t, r, n, i, o = e.deviceMeta,
                        a = e.robloxSubscriptionProducts,
                        l = e.isEntrypointDisabled,
                        c = e.onMobilePurchaseInitiated,
                        s = (0, S.useTranslation)().translate,
                        u = (null != (t = function() {
                            var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                            return function() {
                                var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0],
                                    t = rn((0, e2.useState)(e ? void 0 : tY().getLocalStorage(ri)), 2),
                                    r = t[0],
                                    n = t[1],
                                    i = rn((0, e2.useState)(!1), 2),
                                    o = i[0],
                                    a = i[1],
                                    l = (0, e2.useCallback)(function(e) {
                                        var t;
                                        return (t = function() {
                                            var t, r;
                                            return function(e, t) {
                                                var r, n, i, o = {
                                                        label: 0,
                                                        sent: function() {
                                                            if (1 & i[0]) throw i[1];
                                                            return i[1]
                                                        },
                                                        trys: [],
                                                        ops: []
                                                    },
                                                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                                    return this
                                                }), a;

                                                function l(l) {
                                                    return function(c) {
                                                        var s = [l, c];
                                                        if (r) throw TypeError("Generator is already executing.");
                                                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                                                            if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                                                            switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                                                case 0:
                                                                case 1:
                                                                    i = s;
                                                                    break;
                                                                case 4:
                                                                    return o.label++, {
                                                                        value: s[1],
                                                                        done: !1
                                                                    };
                                                                case 5:
                                                                    o.label++, n = s[1], s = [0];
                                                                    continue;
                                                                case 7:
                                                                    s = o.ops.pop(), o.trys.pop();
                                                                    continue;
                                                                default:
                                                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                                        o = 0;
                                                                        continue
                                                                    }
                                                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                                        o.label = s[1];
                                                                        break
                                                                    }
                                                                    if (6 === s[0] && o.label < i[1]) {
                                                                        o.label = i[1], i = s;
                                                                        break
                                                                    }
                                                                    if (i && o.label < i[2]) {
                                                                        o.label = i[2], o.ops.push(s);
                                                                        break
                                                                    }
                                                                    i[2] && o.ops.pop(), o.trys.pop();
                                                                    continue
                                                            }
                                                            s = t.call(e, o)
                                                        } catch (e) {
                                                            s = [6, e], n = 0
                                                        } finally {
                                                            r = i = 0
                                                        }
                                                        if (5 & s[0]) throw s[1];
                                                        return {
                                                            value: s[0] ? s[1] : void 0,
                                                            done: !0
                                                        }
                                                    }
                                                }
                                            }(this, function(i) {
                                                switch (i.label) {
                                                    case 0:
                                                        if (!e) return [3, 2];
                                                        return [4, t9(function() {
                                                            return re(this, function(t) {
                                                                return [2, t8(t2.GET, {
                                                                    withCredentials: !0,
                                                                    url: "".concat(tH.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions/").concat(e)
                                                                }, {
                                                                    feature: t3.PAYMENT,
                                                                    call: t4.GET_PAYMENT_SESSION
                                                                })]
                                                            })
                                                        })()];
                                                    case 1:
                                                        return r = i.sent(), [3, 4];
                                                    case 2:
                                                        return [4, t9(function() {
                                                            return re(this, function(e) {
                                                                return [2, t8(t2.POST, {
                                                                    withCredentials: !0,
                                                                    url: "".concat(tH.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions")
                                                                }, {
                                                                    feature: t3.PAYMENT,
                                                                    call: t4.CREATE_PAYMENT_SESSION
                                                                }, {
                                                                    paymentFlowId: tZ().getPaymentFlowUuid()
                                                                })]
                                                            })
                                                        })()];
                                                    case 3:
                                                        r = i.sent(), i.label = 4;
                                                    case 4:
                                                        if (!(t = r)) return [2];
                                                        return tY().setLocalStorage(ri, t.paymentSession), n(t.paymentSession), [2]
                                                }
                                            })
                                        }, function() {
                                            var e = this,
                                                r = arguments;
                                            return new Promise(function(n, i) {
                                                var o = t.apply(e, r);

                                                function a(e) {
                                                    rr(o, n, i, a, l, "next", e)
                                                }

                                                function l(e) {
                                                    rr(o, n, i, a, l, "throw", e)
                                                }
                                                a(void 0)
                                            })
                                        })()
                                    }, []);
                                return (0, e2.useEffect)(function() {
                                    if (r) {
                                        new Date(r.expiresAt) < new Date && (a(!0), l());
                                        return
                                    }
                                    var e, t = null == (e = t$.urlService.getQueryParam("paymentSessionId")) ? void 0 : e.toString();
                                    t || a(!0), l(t)
                                }, [l, r]), (0, e2.useMemo)(function() {
                                    return {
                                        paymentSession: r,
                                        wasCreatedByCurrentClient: o
                                    }
                                }, [r, o])
                            }(e).paymentSession
                        }()) ? t : {}).id,
                        d = a[0],
                        f = a.length > 1,
                        p = oY((0, e2.useState)(!1), 2),
                        m = p[0],
                        y = p[1],
                        b = (0, e2.useMemo)(function() {
                            return o$.arrivedGiftDate.toLocaleDateString(void 0, {
                                day: "2-digit",
                                month: "short",
                                year: "numeric"
                            })
                        }, []);
                    if (!d) throw Error("PurchaseView requires at least one subscription product");
                    var h = d.productKey,
                        v = h.id,
                        g = h.type,
                        x = (0, e2.useMemo)(function() {
                            return d.eligibleOffers.find(function(e) {
                                return "FreeTrial" === e.offerType
                            })
                        }, [d.eligibleOffers]),
                        O = null != x,
                        P = (0, e2.useMemo)(function() {
                            var e, t = null == x || null == (e = x.freeTrialOffer) ? void 0 : e.estimatedTrialEndDate;
                            return t ? new Date(t).toLocaleDateString(void 0, {
                                year: "numeric",
                                month: "long",
                                day: "numeric"
                            }) : ""
                        }, [x]),
                        E = (0, e2.useMemo)(function() {
                            return [{
                                opening: "linkStart",
                                closing: "linkEnd",
                                render: function(e) {
                                    return (0, w.jsx)("a", {
                                        className: "content-link underline",
                                        href: "https://www.roblox.com/info/terms",
                                        rel: "noopener noreferrer",
                                        target: "_blank",
                                        children: e
                                    })
                                }
                            }]
                        }, []),
                        j = l ? s("Description.EntrypointDisabled") : rs(s, O ? "Description.SubscriptionFreeTrialLegal" : "Description.SubscriptionLegal", E, O ? {
                            date: P
                        } : void 0),
                        T = (0, e2.useRef)(!1);
                    (0, e2.useEffect)(function() {
                        if (!T.current && u) {
                            T.current = !0;
                            var e = O ? tK.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : tK.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                            tK.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(tK.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, tK.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, tK.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, e, u ? {
                                paymentSessionId: u
                            } : {}), oR(oM.PURCHASE_VIEW_SHOWN, {
                                variant: f ? "multi" : "single",
                                tierCount: String(a.length),
                                isFreeTrial: String(O)
                            })
                        }
                    }, [u, O, f, a.length]);
                    var N = o.isAndroidApp || o.isIosApp,
                        I = oY((0, e2.useState)(null), 2),
                        D = I[0],
                        C = I[1],
                        A = (0, e2.useCallback)(function() {
                            var e = O ? tK.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : tK.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                            tK.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(tK.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, tK.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, tK.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, e, u ? {
                                paymentSessionId: u
                            } : {})
                        }, [O, u]),
                        k = s(O ? "Action.TryItForFree" : "Action.Subscribe"),
                        M = {
                            productId: v,
                            productType: g,
                            deviceMeta: o,
                            isDisabled: l,
                            paymentSessionId: u,
                            trackSubscriptionButtonClick: A,
                            onSubscribeClick: N ? c : void 0
                        },
                        R = function() {
                            l || (oR(oM.PURCHASE_VIEW_OPEN_SHEET_CLICK), y(!0))
                        },
                        _ = function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "Large";
                            return (0, w.jsx)(tP, {
                                className: e,
                                "data-testid": "purchase-open-sheet-button",
                                isDisabled: l,
                                size: t,
                                variant: "Emphasis",
                                onClick: R,
                                children: k
                            })
                        },
                        L = rs(s, "Label.PlusLandingPage.Subtitle.V3", [{
                            opening: "boldStart",
                            closing: "boldEnd",
                            render: function(e) {
                                return (0, w.jsx)("span", {
                                    className: "text-heading-small",
                                    children: e
                                })
                            }
                        }], {
                            price: null != (r = d.localizedPriceDisplayString) ? r : "",
                            periodType: d.periodType
                        }),
                        U = (0, w.jsxs)("div", {
                            "aria-label": s("Action.Subscribe"),
                            className: "bottom-dock padding-t-medium bg-surface-100 large:hidden width-full gap-y-medium flex flex-col",
                            "data-testid": "purchase-subscribe-dock",
                            role: "region",
                            children: [(0, w.jsx)(tU, {}), (0, w.jsxs)("div", {
                                className: "width-full gap-y-medium padding-b-[env(safe-area-inset-bottom\\,0px)] padding-x-xxlarge flex flex-col items-stretch",
                                children: [f ? _("min-width-0 width-full") : (0, w.jsx)(rd, oX(oH({}, M), {
                                    className: "min-width-0 width-full",
                                    size: "Medium",
                                    children: k
                                })), (0, w.jsx)("p", {
                                    className: "text-caption-small content-muted margin-bottom-[24px] large:margin-bottom-none padding-x-xsmall text-align-x-start",
                                    children: j
                                })]
                            })]
                        });
                    return (0, w.jsxs)(e2.Fragment, {
                        children: [(0, w.jsx)(tL, {}), (0, w.jsx)("div", {
                            className: "width-full min-width-0 large:items-center flex flex-col items-start",
                            children: (0, w.jsxs)("div", {
                                className: "margin-top-[48px] width-full min-width-0 content-emphasis large:max-width-[730px] large:gap-y-[32px] large:self-auto large:padding-x-xlarge flex flex-col gap-y-[32px] self-stretch",
                                children: [o$.enabled && (0, w.jsx)("div", {
                                    className: "width-full min-width-0 padding-x-xxlarge large:padding-x-none",
                                    children: (0, w.jsx)(rf, {
                                        body: s("Description.BannerBodyArrivedPurchase", {
                                            date: b
                                        }),
                                        title: s("Description.BannerTitleArrivedPurchase"),
                                        onItemDetailsClick: function() {
                                            oV(oz).catch(function() {})
                                        }
                                    })
                                }), (0, w.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge text-align-x-start large:gap-y-[24px] large:items-center large:padding-x-none large:text-align-x-center flex flex-col items-start",
                                    children: [(0, w.jsxs)("div", {
                                        className: "gap-y-xsmall large:items-center flex flex-col items-start",
                                        children: [(0, w.jsx)(rp, {
                                            variant: "compact"
                                        }), (0, w.jsxs)("h1", {
                                            className: "font-builder-extended text-display-small large:![font-size:var(--font-size-1000)] content-emphasis ![font-size:var(--font-size-800)]",
                                            children: [(0, w.jsx)("span", {
                                                className: "large:inline block",
                                                children: s("Title.PurchasePromoHeadlinePart1")
                                            }), (0, w.jsx)("span", {
                                                className: "large:inline hidden",
                                                children: "\xa0"
                                            }), (0, w.jsx)("span", {
                                                className: "large:inline block",
                                                children: s("Title.PurchasePromoHeadlinePart2")
                                            })]
                                        })]
                                    }), (0, w.jsxs)("div", {
                                        className: "gap-y-xsmall width-full min-width-0 large:text-align-x-center flex flex-col",
                                        children: [f ? (0, w.jsx)("span", {
                                            className: "text-body-large content-emphasis",
                                            children: L
                                        }) : (0, w.jsx)(rb, {
                                            eligibleOffers: d.eligibleOffers,
                                            periodType: d.periodType,
                                            price: d.localizedPrice
                                        }), (0, w.jsx)("div", {
                                            className: "width-full gap-y-medium padding-t-none large:margin-x-auto large:margin-top-[24px] large:flex large:max-width-[min(440px,100%)] large:width-full large:flex-col large:items-center hidden items-start",
                                            children: (0, w.jsx)("div", {
                                                className: "width-full gap-x-small flex shrink-0 flex-row items-start justify-center",
                                                children: f ? _("width-full large:width-[230px] shrink-0", "Medium") : (0, w.jsx)(rd, oX(oH({}, M), {
                                                    className: "width-full large:width-[230px] shrink-0",
                                                    size: "Medium",
                                                    children: k
                                                }))
                                            })
                                        })]
                                    })]
                                }), (0, w.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge large:padding-x-none flex flex-col",
                                    children: [(0, w.jsx)("span", {
                                        className: "text-heading-small",
                                        children: s("Title.Benefits", {
                                            productShort: s("Label.BlackbirdShort")
                                        })
                                    }), (0, w.jsx)("div", {
                                        className: "width-full padding-b-xlarge large:padding-b-none",
                                        children: (0, w.jsx)(tR, {
                                            featureConfig: tB(d),
                                            periodType: d.periodType,
                                            onTileClick: function(e, t) {
                                                C({
                                                    primary: e,
                                                    secondary: t
                                                })
                                            }
                                        })
                                    }), (0, w.jsx)("p", {
                                        className: "text-caption-small content-muted padding-x-xsmall text-align-x-start large:block large:padding-x-none hidden",
                                        "data-testid": "purchase-legal-footer",
                                        children: j
                                    })]
                                })]
                            })
                        }), U, (0, w.jsx)(i1, {
                            body: null != (n = null == D ? void 0 : D.secondary) ? n : "",
                            open: null != D,
                            title: null != (i = null == D ? void 0 : D.primary) ? i : "",
                            onOpenChange: function(e) {
                                e || C(null)
                            }
                        }), f && (0, w.jsx)(oB, {
                            deviceMeta: o,
                            isEntrypointDisabled: l,
                            isOpen: m,
                            paymentSessionId: u,
                            products: a,
                            onMobilePurchaseInitiated: c,
                            onOpenChange: y
                        })]
                    })
                },
                oZ = function(e) {
                    var t = e.title,
                        r = e.body;
                    return (0, w.jsxs)("div", {
                        className: "bg-shift-200 radius-medium padding-medium gap-medium width-full flex items-center",
                        children: [(0, w.jsx)("div", {
                            className: "radius-medium size-[50px] shrink-0 flex items-center justify-center",
                            children: (0, w.jsx)(e5, {
                                className: "!size-900",
                                name: "icon-regular-roblox-plus"
                            })
                        }), (0, w.jsxs)("div", {
                            className: "min-width-0 grow-1 shrink-1 flex basis-0 flex-col justify-center",
                            children: [(0, w.jsx)("span", {
                                className: "text-title-medium content-emphasis",
                                children: t
                            }), (0, w.jsx)("span", {
                                className: "text-body-medium content-default",
                                children: r
                            })]
                        })]
                    })
                };

            function oQ(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var o0 = function(e, t) {
                return (o0 = Object.setPrototypeOf || oQ({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function o1(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function r() {
                    this.constructor = e
                }
                o0(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
            }

            function o2(e, t, r, n) {
                return new(r || (r = Promise))(function(i, o) {
                    function a(e) {
                        try {
                            c(n.next(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function l(e) {
                        try {
                            c(n.throw(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function c(e) {
                        var t;
                        e.done ? i(e.value) : (oQ(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, l)
                    }
                    c((n = n.apply(e, t || [])).next())
                })
            }

            function o3(e, t) {
                var r, n, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(c) {
                        var s = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                            switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            "function" == typeof SuppressedError && SuppressedError;

            function o4(e) {
                var t;
                return null == (t = e) ? t : {
                    periodIndex: t.periodIndex,
                    discountPercent: t.discountPercent
                }
            }
            var o6 = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return o1(t, e), t.prototype.robloxPlusGetRobloxPlusUserBenefitsRaw = function(e) {
                        return o2(this, void 0, void 0, function() {
                            var t, r;
                            return o3(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return t = {}, r = {}, [4, this.request({
                                            path: "/v1/roblox-plus/benefits",
                                            method: "GET",
                                            headers: r,
                                            query: t
                                        }, e)];
                                    case 1:
                                        return [2, new eL(n.sent(), function(e) {
                                            return null == e ? e : {
                                                robuxSavedWithPlus: e.robuxSavedWithPlus,
                                                itemsBoughtWithPlusDiscount: e.itemsBoughtWithPlusDiscount,
                                                robuxSentToFriends: e.robuxSentToFriends,
                                                privateServersCreatedForFree: e.privateServersCreatedForFree
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.robloxPlusGetRobloxPlusUserBenefits = function(e) {
                        return o2(this, void 0, void 0, function() {
                            return o3(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return [4, this.robloxPlusGetRobloxPlusUserBenefitsRaw(e)];
                                    case 1:
                                        return [4, t.sent().value()];
                                    case 2:
                                        return [2, t.sent()]
                                }
                            })
                        })
                    }, t
                }(eA),
                o5 = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return o1(t, e), t.prototype.robloxSubscriptionMetadataGetRobloxSubscriptionMetadataRaw = function(e, t) {
                        return o2(this, void 0, void 0, function() {
                            var r, n;
                            return o3(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return r = {}, n = {}, void 0 !== e.robloxUniverseId && null !== e.robloxUniverseId && (n["Roblox-Universe-Id"] = String(e.robloxUniverseId)), [4, this.request({
                                            path: "/v1/metadata",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(i.sent(), function(e) {
                                            var t, r;
                                            return null == e ? e : {
                                                unifiedPurchaseFlowMetadata: null == (t = e.unifiedPurchaseFlowMetadata) ? t : {
                                                    isUserEligibleForUnifiedPurchaseFlow: t.isUserEligibleForUnifiedPurchaseFlow,
                                                    expiresInSeconds: t.expiresInSeconds
                                                },
                                                robloxSubscriptionExperimentMetadata: null == (r = e.robloxSubscriptionExperimentMetadata) ? r : {
                                                    subscriptionsVariant: e_(r, "subscriptionsVariant") ? r.subscriptionsVariant : void 0
                                                }
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.robloxSubscriptionMetadataGetRobloxSubscriptionMetadata = function() {
                        return o2(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), o3(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.robloxSubscriptionMetadataGetRobloxSubscriptionMetadataRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t
                }(eA),
                o8 = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return o1(t, e), t.prototype.robloxSubscriptionProductsGetRobloxSubscriptionProductRaw = function(e, t) {
                        return o2(this, void 0, void 0, function() {
                            var r, n;
                            return o3(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.robloxSubscriptionProductId || void 0 === e.robloxSubscriptionProductId) throw new eR("robloxSubscriptionProductId", "Required parameter requestParameters.robloxSubscriptionProductId was null or undefined when calling robloxSubscriptionProductsGetRobloxSubscriptionProduct.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/products/{robloxSubscriptionProductId}".replace("{".concat("robloxSubscriptionProductId", "}"), encodeURIComponent(String(e.robloxSubscriptionProductId))),
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(i.sent(), function(e) {
                                            var t, r, n, i;
                                            return null == e ? e : {
                                                product: null == (t = e.product) ? t : {
                                                    id: t.id,
                                                    productType: t.productType,
                                                    productStatus: t.productStatus,
                                                    price: null == (r = t.price) ? r : {
                                                        currencyCode: r.currencyCode,
                                                        units: r.units,
                                                        nanos: r.nanos
                                                    },
                                                    periodType: t.periodType,
                                                    isRenewable: t.isRenewable,
                                                    featureConfig: null == (n = t.featureConfig) ? n : {
                                                        virtualTransactionDiscounts: null === n.virtualTransactionDiscounts ? null : n.virtualTransactionDiscounts.map(o4),
                                                        isRobuxTransferEnabled: n.isRobuxTransferEnabled,
                                                        isTradingEnabled: n.isTradingEnabled,
                                                        isUgcPublishingEnabled: n.isUgcPublishingEnabled,
                                                        privateServerDiscounts: null === n.privateServerDiscounts ? null : n.privateServerDiscounts.map(o4),
                                                        currencySubscriptionConfig: null == (i = n.currencySubscriptionConfig) ? i : {
                                                            currencyType: i.currencyType,
                                                            entitledAmountMicros: i.entitledAmountMicros
                                                        }
                                                    }
                                                }
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.robloxSubscriptionProductsGetRobloxSubscriptionProduct = function(e, t) {
                        return o2(this, void 0, void 0, function() {
                            return o3(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.robloxSubscriptionProductsGetRobloxSubscriptionProductRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t
                }(eA),
                o7 = function(e, t) {
                    return new Date(Date.UTC(e, t + 1, 0)).getUTCDate()
                },
                o9 = function(e, t) {
                    var r = e.getUTCFullYear(),
                        n = e.getUTCMonth(),
                        i = e.getUTCDate(),
                        o = n + t,
                        a = r + Math.floor(o / 12),
                        l = (o % 12 + 12) % 12,
                        c = Math.min(i, o7(a, l));
                    return new Date(Date.UTC(a, l, c, e.getUTCHours(), e.getUTCMinutes(), e.getUTCSeconds(), e.getUTCMilliseconds()))
                },
                ae = function(e, t) {
                    var r = e.getUTCFullYear() + t,
                        n = e.getUTCMonth(),
                        i = Math.min(e.getUTCDate(), o7(r, n));
                    return new Date(Date.UTC(r, n, i, e.getUTCHours(), e.getUTCMinutes(), e.getUTCSeconds(), e.getUTCMilliseconds()))
                },
                at = function(e, t, r) {
                    var n = new Date(e);
                    switch (r) {
                        case "Week":
                            return n.setUTCDate(n.getUTCDate() + 7 * t), n;
                        case "Month":
                            return o9(n, t);
                        case "Year":
                            return ae(n, t);
                        default:
                            throw Error("Unsupported period type: ".concat(r))
                    }
                },
                ar = function(e, t, r, n) {
                    for (var i = 0; i < 1e3 && !(n < at(e, i + 1, t).getTime());) i += 1;
                    return r && r < n && i > 0 && (i -= 1), i
                },
                an = function(e) {
                    var t = e.currentDiscountPercent,
                        r = e.nextDiscount,
                        n = e.activationTimestampMs,
                        i = e.isCancelled,
                        o = e.periodType,
                        a = (0, S.useTranslation)(),
                        l = a.translate,
                        c = a.intl,
                        s = (0, e2.useMemo)(function() {
                            if (!r) return null;
                            var e = Date.now(),
                                t = at(n, r.periodIndex, o).getTime();
                            return {
                                discountPercent: r.discountPercent,
                                targetDateDaysUntil: Math.max(0, Math.ceil((t - e) / 864e5)),
                                targetDateProgressPercent: Math.min(Math.max(0, (e - n) / (t - n) * 100), 100)
                            }
                        }, [r, n, o]);
                    if (null === s && 0 === t) return null;
                    var u = null === s,
                        d = null !== s && s.targetDateDaysUntil <= 15,
                        f = function(e) {
                            return (0, w.jsxs)("div", {
                                className: "margin-right-[-16px] relative flex size-[60px] shrink-0 items-center justify-center",
                                children: [(0, w.jsx)("div", {
                                    "aria-hidden": !0,
                                    className: "stroke-emphasis stroke-standard absolute inset-[0] rounded-[2.4px] [transform:rotate(-15deg)]"
                                }), e]
                            })
                        };
                    return (0, w.jsxs)("div", {
                        className: "radius-medium padding-large bg-shift-200 width-full gap-x-small flex items-center justify-between [overflow:clip]",
                        children: [(0, w.jsxs)("div", {
                            className: "gap-y-small min-width-0 flex flex-col items-start justify-center",
                            children: [(0, w.jsx)("span", {
                                className: "text-title-medium content-default",
                                children: i ? l(u ? "Description.Benefit.DiscountStaySubscribedToKeep" : "Description.Benefit.DiscountStaySubscribedToGet") : u ? l("Description.Benefit.DiscountMaxReached") : l("Description.Benefit.DiscountCurrent", {
                                    discountPercent: c.n(.01 * t, {
                                        style: "percent"
                                    })
                                })
                            }), (0, w.jsx)("span", {
                                className: "text-heading-large content-emphasis",
                                children: u ? l(i ? "Description.Benefit.DiscountAllPurchases" : "Description.Benefit.DiscountUnlocked", {
                                    discountPercent: c.n(.01 * t, {
                                        style: "percent"
                                    })
                                }) : l("Description.Benefit.DiscountOffInDays", {
                                    discountPercent: c.n(.01 * s.discountPercent, {
                                        style: "percent"
                                    }),
                                    dayCount: s.targetDateDaysUntil
                                })
                            })]
                        }), (0, w.jsx)("div", {
                            className: "shrink-0",
                            children: u ? f((0, w.jsx)(e5, {
                                name: "icon-regular-circle-check",
                                size: "XLarge"
                            })) : d && !i ? (0, w.jsx)(tV, {
                                ariaLabel: l("Label.Progress"),
                                className: "[--fui-future-alpha-color-system-progress:var(--color-content-emphasis)]",
                                size: "Large",
                                value: s.targetDateProgressPercent,
                                variant: "Determinate"
                            }) : f((0, w.jsx)(e5, {
                                name: "icon-regular-calendar",
                                size: "XLarge"
                            }))
                        })]
                    })
                };

            function ai(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var ao = function(e) {
                    var t, r = e.robloxSubscriptionProduct,
                        n = (0, S.useTranslation)().translate,
                        i = (t = (0, e2.useState)(!1), function(e) {
                            if (Array.isArray(e)) return e
                        }(t) || function(e, t) {
                            var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != i) {
                                var o = [],
                                    a = !0,
                                    l = !1;
                                try {
                                    for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), o.length !== t); a = !0);
                                } catch (e) {
                                    l = !0, n = e
                                } finally {
                                    try {
                                        a || null == i.return || i.return()
                                    } finally {
                                        if (l) throw n
                                    }
                                }
                                return o
                            }
                        }(t, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return ai(e, 2);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ai(e, t)
                            }
                        }(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        o = i[0],
                        a = i[1],
                        l = (0, e2.useCallback)(function() {
                            a(!0)
                        }, []),
                        c = (0, e2.useMemo)(function() {
                            var e = new URL("/my/account#!/subscriptions", window.location.origin);
                            return e.searchParams.append("id", r.productKey.id), e.searchParams.append("type", r.productKey.type), e.toString()
                        }, [r.productKey.id, r.productKey.type]);
                    return (0, w.jsx)(tP, {
                        as: "a",
                        href: c,
                        isLoading: o,
                        variant: "Standard",
                        onClick: l,
                        children: n("Action.Manage")
                    })
                },
                aa = function(e) {
                    var t = e.title,
                        r = e.value;
                    return (0, w.jsxs)("div", {
                        className: "radius-medium bg-shift-200 padding-large gap-y-small min-width-0 grow-1 flex basis-0 flex-col",
                        children: [(0, w.jsx)("span", {
                            className: "text-title-medium content-default",
                            children: t
                        }), (0, w.jsx)("span", {
                            className: "text-heading-large content-emphasis",
                            children: r
                        })]
                    })
                },
                al = function(e) {
                    var t = e.currentDiscountPercent,
                        r = e.savedRobux,
                        n = e.itemsBoughtWithDiscountCount,
                        i = e.privateServersCreatedCount,
                        o = e.robuxSentToFriendsCount,
                        a = (0, S.useTranslation)(),
                        l = a.translate,
                        c = a.intl;
                    return (0, w.jsxs)("div", {
                        className: "gap-y-large flex flex-col",
                        children: [(0, w.jsxs)("div", {
                            className: "gap-x-xsmall text-heading-small content-emphasis wrap flex items-center",
                            children: [(0, w.jsx)("span", {
                                children: l("Heading.SavingsYouveSaved")
                            }), (0, w.jsx)(e5, {
                                name: "icon-regular-robux",
                                size: "Medium"
                            }), (0, w.jsx)("span", {
                                children: void 0 === r ? "—" : c.n(r)
                            }), (0, w.jsx)("span", {
                                children: l("Heading.SavingsWithPlus")
                            })]
                        }), (0, w.jsxs)("div", {
                            className: "gap-y-small flex flex-col",
                            children: [(0, w.jsxs)("div", {
                                className: "gap-x-small flex",
                                children: [(0, w.jsx)(aa, {
                                    title: l("Label.Savings.InGameItems"),
                                    value: l("Label.Savings.PercentOff", {
                                        discountPercent: c.n(.01 * t, {
                                            style: "percent"
                                        })
                                    })
                                }), (0, w.jsx)(aa, {
                                    title: l("Label.Savings.ItemsBought"),
                                    value: void 0 === n ? "—" : c.n(n)
                                })]
                            }), (0, w.jsxs)("div", {
                                className: "gap-x-small flex",
                                children: [(0, w.jsx)(aa, {
                                    title: l("Label.Savings.PrivateServers"),
                                    value: void 0 === i ? "—" : c.n(i)
                                }), (0, w.jsx)(aa, {
                                    title: l("Label.Savings.RobuxSent"),
                                    value: (0, w.jsxs)("span", {
                                        className: "gap-x-xsmall flex items-center",
                                        children: [(0, w.jsx)(e5, {
                                            name: "icon-regular-robux",
                                            size: "Medium"
                                        }), void 0 === o ? "—" : c.n(o)]
                                    })
                                })]
                            }), (0, w.jsx)("span", {
                                className: "text-caption-medium content-muted",
                                children: l("Description.SavingsDataDelay")
                            })]
                        })]
                    })
                };

            function ac(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function as(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function au(e, t) {
                if (null == e) return {};
                var r, n, i = function(e, t) {
                    if (null == e) return {};
                    var r, n, i = {},
                        o = Object.keys(e);
                    for (n = 0; n < o.length; n++) r = o[n], t.indexOf(r) >= 0 || (i[r] = e[r]);
                    return i
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r])
                }
                return i
            }
            var ad = {
                    Small: "XSmall",
                    Medium: "Small",
                    Large: "Medium"
                },
                af = {
                    Small: ["height-600", "text-label-small"],
                    Medium: ["height-800", "text-label-medium"],
                    Large: ["height-1000", "text-label-medium"]
                },
                ap = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-large"
                },
                am = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-medium"
                },
                ay = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-large"
                },
                ab = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-medium"
                },
                ah = {
                    Small: "padding-left-xsmall",
                    Medium: "padding-left-[var(--size-150)]",
                    Large: "padding-left-small"
                },
                av = {
                    Small: "padding-right-[var(--size-150)]",
                    Medium: "padding-right-small",
                    Large: "padding-right-[var(--size-250)]"
                },
                ag = {
                    Standard: "bg-shift-300",
                    Utility: "bg-none"
                },
                ax = {
                    Small: "size-[var(--icon-size-xsmall)]",
                    Medium: "size-[var(--icon-size-small)]",
                    Large: "size-[var(--icon-size-medium)]"
                },
                aw = function(e) {
                    var t = e.iconName,
                        r = e.node,
                        n = e.size;
                    return null != t ? e3().createElement(e5, {
                        name: t,
                        size: ad[n]
                    }) : null != r ? e3().createElement("span", {
                        className: e4("inline-flex items-center justify-center shrink-0", ax[n])
                    }, r) : null
                },
                aS = (0, e2.forwardRef)(function(e, t) {
                    var r = e.className,
                        n = e.style,
                        i = e.text,
                        o = e.isDisabled,
                        a = void 0 !== o && o,
                        l = e.size,
                        c = void 0 === l ? "Medium" : l,
                        s = e.variant,
                        u = void 0 === s ? "Standard" : s,
                        d = e.leadingIconName,
                        f = e.leadingIconNode,
                        p = e.trailingIconName,
                        m = e.trailingIconNode,
                        y = au(e, ["className", "style", "text", "isDisabled", "size", "variant", "leadingIconName", "leadingIconNode", "trailingIconName", "trailingIconNode"]),
                        b = null != d || null != f,
                        h = null != p || null != m,
                        v = e4(a ? e9 : [e8, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", b ? am[c] : ap[c], h ? ab[c] : ay[c], af[c], r),
                        g = e3().createElement(e3().Fragment, null, e3().createElement(e7, null), e3().createElement(aw, {
                            iconName: d,
                            node: f,
                            size: c
                        }), e3().createElement("span", {
                            className: e4("padding-y-xsmall text-no-wrap text-truncate-end", b && ah[c], h && av[c])
                        }, i), e3().createElement(aw, {
                            iconName: p,
                            node: m,
                            size: c
                        })),
                        x = ac({
                            textDecoration: "none"
                        }, n);
                    if ("a" === y.as) {
                        y.as;
                        var w = y.href,
                            S = au(y, ["as", "href"]);
                        return e3().createElement("a", as(ac({
                            ref: t
                        }, S), {
                            "aria-disabled": a,
                            href: a ? void 0 : w,
                            className: e4(v, ag[u], "content-action-utility"),
                            style: x
                        }), g)
                    }
                    y.as;
                    var O = y.isChecked,
                        P = y.onCheckedChange,
                        E = au(y, ["as", "isChecked", "onCheckedChange"]);
                    return e3().createElement("button", as(ac({
                        ref: t,
                        type: "button"
                    }, E), {
                        className: e4(O ? "bg-inverse-surface-0" : ag[u], O ? "content-inverse-emphasis" : "content-action-utility", v),
                        style: x,
                        "aria-pressed": O,
                        disabled: a,
                        onClick: null == P ? void 0 : function() {
                            return P(!O)
                        }
                    }), g)
                }),
                aO = function(e) {
                    var t = e.activationTimestampMs,
                        r = e.expirationTimestampMs,
                        n = e.nextRenewalTimestampMs,
                        i = e.hasFreeTrial,
                        o = (0, S.useTranslation)(),
                        a = o.translate,
                        l = o.intl,
                        c = (0, e2.useMemo)(function() {
                            return l.getDateTimeFormatter()
                        }, [l]),
                        s = null === n || 0 === n;
                    return (0, w.jsxs)("div", {
                        className: "gap-x-small flex items-center",
                        children: [(0, w.jsx)("span", {
                            className: "text-body-medium content-emphasis",
                            children: s ? a("Description.ActiveUntil", {
                                date: c.getCustomDateTime(r, {
                                    month: "long",
                                    day: "numeric",
                                    year: "numeric"
                                })
                            }) : a("Description.SubscribedSince", {
                                date: c.getCustomDateTime(t, {
                                    month: "long",
                                    day: "numeric",
                                    year: "numeric"
                                })
                            })
                        }), s ? (0, w.jsx)(aS, {
                            className: "bg-system-warning light-mode-content-emphasis pointer-events-none",
                            isChecked: !1,
                            size: "Small",
                            text: a("Label.Status.AutoRenewOff")
                        }) : i ? (0, w.jsx)(aS, {
                            className: "bg-shift-300 content-emphasis pointer-events-none",
                            isChecked: !1,
                            size: "Small",
                            text: a("Label.Status.Freetrial")
                        }) : (0, w.jsx)(aS, {
                            className: "bg-shift-300 content-emphasis pointer-events-none",
                            isChecked: !1,
                            size: "Small",
                            text: a("Label.Status.Active")
                        })]
                    })
                },
                aP = function(e) {
                    var t = e.featureConfig,
                        r = (0, S.useTranslation)().translate;
                    return (0, w.jsxs)("div", {
                        className: "gap-y-medium flex flex-col",
                        children: [(0, w.jsx)("span", {
                            className: "text-heading-medium",
                            children: r("Label.ExploreMoreBenefits")
                        }), (0, w.jsxs)("div", {
                            className: "foundation-web-list-item-container",
                            children: [t.isTradingEnabled && (0, w.jsx)(tC, {
                                description: r("Description.Benefit.TradeResellItemsSubtitle"),
                                divider: "None",
                                isContained: !0,
                                leading: (0, w.jsx)(e5, {
                                    name: "icon-regular-hand-two-arrows-horizontal",
                                    size: "Medium"
                                }),
                                size: "Medium",
                                title: r("Description.Benefit.TradeResellItems"),
                                trailing: (0, w.jsx)(e5, {
                                    name: "icon-regular-chevron-small-right"
                                }),
                                onSelect: function() {
                                    window.location.href = "https://help.roblox.com/hc/articles/203313310-Trading-System"
                                }
                            }), t.isUgcPublishingEnabled && (0, w.jsx)(tC, {
                                description: r("Description.Benefit.PublishItemsSubtitle"),
                                divider: "None",
                                isContained: !0,
                                leading: (0, w.jsx)(e5, {
                                    name: "icon-regular-arrow-up-from-landscape-rectangle",
                                    size: "Medium"
                                }),
                                size: "Medium",
                                title: r("Description.Benefit.PublishItems"),
                                trailing: (0, w.jsx)(e5, {
                                    name: "icon-regular-chevron-small-right"
                                }),
                                onSelect: function() {
                                    window.location.href = "https://help.roblox.com/hc/articles/203313180-Creating-and-Selling-Avatar-Items"
                                }
                            })]
                        })]
                    })
                },
                aE = function(e) {
                    var t, r, n = e.robloxSubscriptionProduct,
                        i = e.robloxSubscriptionMembership,
                        o = e.robloxPlusUserBenefits,
                        a = e.isFaeFreeTrial,
                        l = (0, S.useTranslation)().translate,
                        c = null == o ? void 0 : o.robuxSavedWithPlus,
                        s = null == o ? void 0 : o.itemsBoughtWithPlusDiscount,
                        u = null == o ? void 0 : o.privateServersCreatedForFree,
                        d = null == o ? void 0 : o.robuxSentToFriends,
                        f = (0, e2.useMemo)(function() {
                            return i.activeOffers.some(function(e) {
                                return "FreeTrial" === e.offerType
                            })
                        }, [i.activeOffers]),
                        p = (0, e2.useMemo)(function() {
                            return ar(i.activationTimestampMs, i.periodType, i.nextRenewalTimestampMs, Date.now())
                        }, [i.activationTimestampMs, i.nextRenewalTimestampMs, i.periodType]),
                        m = (0, e2.useMemo)(function() {
                            var e, t, r, o, a, l, c, s, u, d, f;
                            return t = tB(n), r = null == (e = i.productTypeMembershipDetails.robloxSubscriptionMembershipDetails) ? void 0 : e.features.virtualTransactionDiscountTierId, d = t.virtualTransactionDiscounts, f = null != (s = null == (o = r ? null != (l = null != (a = null == d ? void 0 : d.find(function(e) {
                                return e.tierId === r
                            })) ? a : null == d ? void 0 : d.toSorted(function(e, t) {
                                return t.periodIndex - e.periodIndex
                            })[0]) ? l : null : null != (c = null == d ? void 0 : d.filter(function(e) {
                                return e.periodIndex <= p
                            }).toSorted(function(e, t) {
                                return t.periodIndex - e.periodIndex
                            })[0]) ? c : null) ? void 0 : o.periodIndex) ? s : p, {
                                current: o,
                                next: null != (u = null == d ? void 0 : d.filter(function(e) {
                                    return e.periodIndex > f
                                }).toSorted(function(e, t) {
                                    return e.periodIndex - t.periodIndex
                                })[0]) ? u : null
                            }
                        }, [n, i.productTypeMembershipDetails, p]),
                        y = null != (r = null == (t = m.current) ? void 0 : t.discountPercent) ? r : 0;
                    return (0, w.jsx)("div", {
                        className: "flex flex-col items-center",
                        children: (0, w.jsxs)("div", {
                            className: "margin-top-[48px] padding-x-xlarge content-emphasis gap-y-xxlarge width-full large:max-width-[730px] flex flex-col",
                            children: [(0, w.jsx)(rf, {
                                body: l("Description.BannerBodyUnboxed"),
                                equipText: l("Action.BannerEquip"),
                                title: l("Description.BannerTitleUnboxed"),
                                onEquip: function() {
                                    oq(oz).catch(function() {})
                                },
                                onItemDetailsClick: function() {
                                    oV(oz).catch(function() {})
                                }
                            }), a && (0, w.jsx)(oZ, {
                                body: l("Subtext.FreeTrialBanner", {
                                    date: new Date(i.expirationTimestampMs).toLocaleDateString(void 0, {
                                        day: "2-digit",
                                        month: "short",
                                        year: "numeric"
                                    })
                                }),
                                title: l("Header.FreeTrialBannerTitle")
                            }), (0, w.jsxs)("div", {
                                className: "gap-y-small large:items-center flex flex-col",
                                children: [(0, w.jsx)(rp, {}), (0, w.jsx)(aO, {
                                    activationTimestampMs: i.activationTimestampMs,
                                    expirationTimestampMs: i.expirationTimestampMs,
                                    hasFreeTrial: f,
                                    nextRenewalTimestampMs: i.nextRenewalTimestampMs
                                }), (0, w.jsx)(an, {
                                    activationTimestampMs: i.activationTimestampMs,
                                    currentDiscountPercent: y,
                                    isCancelled: null === i.nextRenewalTimestampMs || 0 === i.nextRenewalTimestampMs,
                                    nextDiscount: m.next,
                                    periodType: i.periodType
                                })]
                            }), (0, w.jsxs)("div", {
                                className: "flex flex-col gap-y-[32px]",
                                children: [(0, w.jsx)(al, {
                                    currentDiscountPercent: y,
                                    itemsBoughtWithDiscountCount: s,
                                    privateServersCreatedCount: u,
                                    robuxSentToFriendsCount: d,
                                    savedRobux: c
                                }), (0, w.jsx)(aP, {
                                    featureConfig: tB(n)
                                }), (0, w.jsx)(t_, {
                                    children: (0, w.jsx)("div", {
                                        className: "gap-y-medium flex flex-col",
                                        children: (0, w.jsx)(ao, {
                                            robloxSubscriptionProduct: n
                                        })
                                    })
                                })]
                            })]
                        })
                    })
                };

            function aj(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var aT = function(e) {
                    var t, r, n, i = e.deviceMeta,
                        o = e.robloxSubscriptionProduct,
                        a = e.onDismiss,
                        l = (0, S.useTranslation)().translate,
                        c = (t = (0, e2.useState)(null), function(e) {
                            if (Array.isArray(e)) return e
                        }(t) || function(e, t) {
                            var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != i) {
                                var o = [],
                                    a = !0,
                                    l = !1;
                                try {
                                    for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), o.length !== t); a = !0);
                                } catch (e) {
                                    l = !0, n = e
                                } finally {
                                    try {
                                        a || null == i.return || i.return()
                                    } finally {
                                        if (l) throw n
                                    }
                                }
                                return o
                            }
                        }(t, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return aj(e, 2);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aj(e, t)
                            }
                        }(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        s = c[0],
                        u = c[1];
                    (0, e2.useEffect)(function() {
                        window.scrollTo({
                            top: 0,
                            behavior: "smooth"
                        })
                    }, []);
                    var d = !i.isInApp && (0, w.jsxs)("div", {
                        "aria-label": l("Action.OK"),
                        className: "bottom-dock padding-t-medium bg-surface-100 large:hidden width-full gap-y-medium flex flex-col",
                        "data-testid": "welcome-dismiss-dock",
                        role: "region",
                        children: [(0, w.jsx)(tU, {}), (0, w.jsx)("div", {
                            className: "width-full gap-y-medium padding-bottom-[env(safe-area-inset-bottom\\,0px)] padding-x-xxlarge flex flex-col items-stretch",
                            children: (0, w.jsx)(tP, {
                                className: "min-width-0 width-full margin-bottom-[24px] large:margin-bottom-none",
                                size: "Large",
                                variant: "Emphasis",
                                onClick: a,
                                children: l("Action.OK")
                            })
                        })]
                    });
                    return (0, w.jsxs)(e2.Fragment, {
                        children: [(0, w.jsx)(tL, {}), (0, w.jsx)("div", {
                            className: "width-full min-width-0 large:items-center flex flex-col items-start",
                            children: (0, w.jsxs)("div", {
                                className: "margin-top-[48px] width-full min-width-0 content-emphasis large:max-width-[730px] large:gap-y-[60px] large:self-auto large:padding-x-xlarge flex flex-col gap-y-[var(--size-1200)] self-stretch",
                                children: [(0, w.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge text-align-x-start large:gap-y-[24px] large:items-center large:padding-x-none large:text-align-x-center flex flex-col items-start",
                                    children: [(0, w.jsxs)("div", {
                                        className: "gap-y-xsmall large:items-center flex flex-col items-start",
                                        children: [(0, w.jsx)(e5, {
                                            className: "!size-1800 margin-bottom-medium",
                                            name: "icon-regular-roblox-plus"
                                        }), (0, w.jsx)("h1", {
                                            className: "text-heading-large",
                                            children: l("Title.Welcome", {
                                                productShort: l("Label.BlackbirdShort")
                                            })
                                        }), (0, w.jsx)("p", {
                                            className: "text-body-large content-default",
                                            children: l("Description.Welcome", {
                                                product: l("Label.Blackbird")
                                            })
                                        })]
                                    }), !i.isInApp && (0, w.jsx)("div", {
                                        className: "width-full gap-y-medium padding-t-none large:margin-x-auto large:margin-top-[12px] large:flex large:max-width-[min(440px,100%)] large:width-full large:flex-col large:items-center hidden items-start",
                                        "data-testid": "welcome-dismiss-inline",
                                        children: (0, w.jsx)("div", {
                                            className: "width-full gap-x-small flex shrink-0 flex-row items-start justify-center",
                                            children: (0, w.jsx)(tP, {
                                                className: "width-full large:width-[230px] shrink-0",
                                                size: "Medium",
                                                variant: "Emphasis",
                                                onClick: a,
                                                children: l("Action.OK")
                                            })
                                        })
                                    })]
                                }), (0, w.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge large:padding-x-none flex flex-col",
                                    children: [(0, w.jsx)("span", {
                                        className: "text-heading-small",
                                        children: l("Title.BenefitsUnlocked")
                                    }), (0, w.jsx)(tR, {
                                        featureConfig: tB(o),
                                        overrideIconName: "icon-filled-check",
                                        periodType: o.periodType,
                                        onTileClick: function(e, t) {
                                            u({
                                                primary: e,
                                                secondary: t
                                            })
                                        }
                                    })]
                                })]
                            })
                        }), d, (0, w.jsx)(i1, {
                            body: null != (r = null == s ? void 0 : s.secondary) ? r : "",
                            open: null != s,
                            title: null != (n = null == s ? void 0 : s.primary) ? n : "",
                            onOpenChange: function(e) {
                                e || u(null)
                            }
                        })]
                    })
                },
                aN = function(e, t) {
                    return "https://apis.".concat(e, "/").concat(t)
                };

            function aI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var aD = function(e) {
                    var t, r = document.querySelector('meta[name="environment-meta"]');
                    if (null == r ? void 0 : r.dataset.domain) return {
                        production: "false" === r.dataset.isTestingSite,
                        domainName: r.dataset.domain.split(".")[0],
                        rootDomain: r.dataset.domain
                    };
                    if ("localhost" === e) return {
                        production: !1,
                        domainName: "sitetest3",
                        rootDomain: "sitetest3.robloxlabs.com"
                    };
                    var n = (t = e.split(".").reverse(), function(e) {
                            if (Array.isArray(e)) return e
                        }(t) || function(e, t) {
                            var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != i) {
                                var o = [],
                                    a = !0,
                                    l = !1;
                                try {
                                    for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), o.length !== t); a = !0);
                                } catch (e) {
                                    l = !0, n = e
                                } finally {
                                    try {
                                        a || null == i.return || i.return()
                                    } finally {
                                        if (l) throw n
                                    }
                                }
                                return o
                            }
                        }(t, 3) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return aI(e, 3);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aI(e, t)
                            }
                        }(t, 3) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        i = n[0],
                        o = n[1],
                        a = n[2];
                    if (null != i && null != o) {
                        var l = "".concat(o, ".").concat(i);
                        if ("roblox.com" === l || "simulprod.com" === l || "rblx.org" === l) return {
                            production: !0,
                            domainName: "roblox",
                            rootDomain: "roblox.com"
                        };
                        if (null == a ? void 0 : a.startsWith("sitetest")) return {
                            production: !1,
                            domainName: a,
                            rootDomain: "".concat(a, ".robloxlabs.com")
                        }
                    }
                    throw Error("Unknown environment for ".concat(e))
                },
                aC = aD(window.location.hostname),
                aA = new eD({
                    robloxSiteDomain: aC.rootDomain,
                    basePath: aN(aC.rootDomain, "roblox-subscriptions"),
                    credentials: "include"
                });
            new o5(aA);
            var ak = new o6(aA);
            new o8(aA);
            var aM = aD(window.location.hostname),
                aR = new eZ(new eU({
                    robloxSiteDomain: aM.rootDomain,
                    basePath: aN(aM.rootDomain, "subscriptions"),
                    credentials: "include"
                })),
                a_ = function(e, t) {
                    var r = (0, e2.useRef)();
                    return t(e) && (r.current = e), r.current
                };

            function aL(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aU(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function aB(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var o = e.apply(t, r);

                        function a(e) {
                            aU(o, n, i, a, l, "next", e)
                        }

                        function l(e) {
                            aU(o, n, i, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function aF(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return aL(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aL(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function az(e, t) {
                var r, n, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(c) {
                        var s = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                            switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var aG = function() {
                    var e, t, r = (0, e2.useMemo)(function() {
                            return (0, e0.getDeviceMeta)()
                        }, []),
                        n = aF((0, e2.useState)(function() {
                            return new URLSearchParams(window.location.search).has("welcome")
                        }), 2),
                        i = n[0],
                        o = n[1],
                        a = aF((0, e2.useState)(function() {
                            return new URLSearchParams(window.location.search).has("faeFreeTrialConfirmation")
                        }), 2),
                        l = a[0],
                        c = a[1],
                        s = aF((0, e2.useState)(i || l), 2),
                        u = s[0],
                        d = s[1],
                        f = (0, j.useQuery)({
                            queryKey: ["get-roblox-subscription-membership"],
                            queryFn: function() {
                                return aB(function() {
                                    var e;
                                    return az(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, aR.subscriptionsV2ListSubscriptions({
                                                    productType: eH,
                                                    expirationTimestampMsStart: Date.now(),
                                                    resultsPerPage: 1
                                                })];
                                            case 1:
                                                if (!(e = t.sent().subscriptions[0])) return [2, null];
                                                return [2, e]
                                        }
                                    })
                                })()
                            },
                            retry: 3,
                            retryDelay: 100,
                            refetchInterval: !!u && 3e3
                        }),
                        p = a_(f.data, function() {
                            return void 0 !== f.data
                        }),
                        m = null == p ? void 0 : p.productKey.id,
                        y = (0, j.useQuery)({
                            queryKey: ["check-fae-free-trial", m],
                            queryFn: function() {
                                return aB(function() {
                                    var e, t;
                                    return az(this, function(r) {
                                        switch (r.label) {
                                            case 0:
                                                if (!m) return [2, !1];
                                                return [4, aR.subscriptionsV2ListAvailableSubscriptionProducts({
                                                    productType: eH,
                                                    includePurchased: !0,
                                                    grantType: "FaeFreeTrial"
                                                })];
                                            case 1:
                                                if (void 0 === (t = null == (e = r.sent().products.find(function(e) {
                                                        return "Week" === e.periodType
                                                    })) ? void 0 : e.productKey.id) || t !== m) throw Error("FAE trial product not found yet");
                                                return [2, !0]
                                        }
                                    })
                                })()
                            },
                            enabled: !!p,
                            retry: function(e) {
                                return e < 3
                            },
                            retryDelay: 100
                        }),
                        b = (0, j.useQuery)({
                            queryKey: ["list-roblox-subscription-available-products"],
                            queryFn: function() {
                                return aB(function() {
                                    var e;
                                    return az(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, aR.subscriptionsV2ListAvailableSubscriptionProducts({
                                                    productType: eH,
                                                    includePurchased: !0,
                                                    includeBundles: !0,
                                                    skipEligibilityCheck: !0
                                                })];
                                            case 1:
                                                if (0 === (e = t.sent().products).length) return [2, null];
                                                return [2, e.toSorted(function(e, t) {
                                                    return tF(e) - tF(t)
                                                })]
                                        }
                                    })
                                })()
                            },
                            enabled: null === f.data,
                            retry: 3,
                            retryDelay: 100
                        }),
                        h = a_(b.data, function() {
                            return void 0 !== b.data
                        }),
                        v = a_(null != (t = null == (e = f.data) ? void 0 : e.productInfo) ? t : null == h ? void 0 : h[0], function() {
                            var e;
                            return (null == (e = f.data) ? void 0 : e.productInfo) !== void 0 || void 0 !== h
                        }),
                        g = (0, j.useQuery)({
                            queryKey: ["get-roblox-plus-user-benefits"],
                            queryFn: function() {
                                return ak.robloxPlusGetRobloxPlusUserBenefits()
                            },
                            enabled: !!p,
                            retry: 3
                        }),
                        x = (0, j.useQuery)({
                            queryKey: ["guac/app-policy/disable-blackbird-entrypoints"],
                            queryFn: function() {
                                return aB(function() {
                                    return az(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return e.trys.push([0, 2, , 3]), [4, (0, eQ.callBehaviour)("app-policy")];
                                            case 1:
                                                return [2, !0 === e.sent().DisableBlackbirdEntrypoints];
                                            case 2:
                                                return e.sent(), [2, !1];
                                            case 3:
                                                return [2]
                                        }
                                    })
                                })()
                            },
                            retry: 3,
                            retryDelay: 100,
                            staleTime: 1 / 0
                        }),
                        S = a_(x.data, function() {
                            return void 0 !== x.data
                        }),
                        O = (0, e2.useCallback)(function() {
                            var e = new URL(window.location.href);
                            e.searchParams.set("welcome", ""), window.history.replaceState(null, "", e.toString()), o(!0)
                        }, []),
                        P = (0, e2.useCallback)(function() {
                            var e = function() {
                                try {
                                    var e = sessionStorage.getItem(e1);
                                    if (!e) return null;
                                    sessionStorage.removeItem(e1);
                                    var t = JSON.parse(e);
                                    if ((void 0 === t ? "undefined" : t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) != "object" || null === t || !("url" in t) || !("ts" in t)) return null;
                                    var r = t.url,
                                        n = t.ts;
                                    if ("string" != typeof r || "number" != typeof n || Date.now() - n > 18e5) return null;
                                    return r
                                } catch (e) {
                                    return null
                                }
                            }();
                            if (e) {
                                window.location.href = e;
                                return
                            }
                            var t = new URL(window.location.href);
                            t.searchParams.delete("welcome"), window.history.replaceState(null, "", t.toString()), o(!1)
                        }, []),
                        E = (0, e2.useCallback)(function() {
                            var e = new URL(window.location.href);
                            e.searchParams.delete("faeFreeTrialConfirmation"), window.history.replaceState(null, "", e.toString()), c(!1)
                        }, []);
                    (0, e2.useEffect)(function() {
                        if (u) {
                            var e = setTimeout(function() {
                                d(!1)
                            }, 6e4);
                            return function() {
                                clearTimeout(e)
                            }
                        }
                    }, [u]), (0, e2.useEffect)(function() {
                        u && f.data && (d(!1), l || O())
                    }, [O, l, u, f.data]);
                    var T = (0, e2.useCallback)(function() {
                        d(!0)
                    }, []);
                    if (b.error || null === b.data || f.error && !u || x.error || !r) return (0, w.jsx)(tE, {});
                    if (void 0 === v || void 0 === p || void 0 === S) return (0, w.jsx)(tq, {});
                    var N = null !== p;
                    if (l) return N ? y.isLoading ? (0, w.jsx)(tq, {}) : y.data ? (0, w.jsx)(tG, {
                        robloxSubscriptionProduct: v,
                        onDismiss: E
                    }) : (0, w.jsx)(tE, {}) : u ? (0, w.jsx)(tq, {}) : (0, w.jsx)(tE, {});
                    if (i)
                        if (N) return (0, w.jsx)(aT, {
                            deviceMeta: r,
                            robloxSubscriptionMembership: p,
                            robloxSubscriptionProduct: v,
                            onDismiss: P
                        });
                        else if (u) return (0, w.jsx)(tq, {});
                    else return (0, w.jsx)(tE, {});
                    return N ? (0, w.jsx)(aE, {
                        isFaeFreeTrial: !0 === y.data,
                        robloxPlusUserBenefits: g.data,
                        robloxSubscriptionMembership: p,
                        robloxSubscriptionProduct: v
                    }) : h ? (0, w.jsx)(oJ, {
                        deviceMeta: r,
                        isEntrypointDisabled: S,
                        robloxSubscriptionProducts: h,
                        onMobilePurchaseInitiated: T
                    }) : (0, w.jsx)(tq, {})
                },
                aW = function(e) {
                    var t = e.children;
                    return (0, w.jsx)("div", {
                        className: "clip-x margin-bottom-[160px] min-height-[400px] padding-top-[16px] large:margin-bottom-[120px] relative",
                        children: t
                    })
                },
                aV = function() {
                    return (0, w.jsx)(j.QueryClientProvider, {
                        client: S.queryClient,
                        children: (0, w.jsx)(aW, {
                            children: (0, w.jsx)(aG, {})
                        })
                    })
                };
            r(160), P()(function() {
                (0, S.renderWithErrorBoundary)((0, w.jsx)(S.TranslationProvider, {
                    config: E.P,
                    children: (0, w.jsx)(aV, {})
                }), document.getElementById("roblox-subscription-container"), void 0, (0, w.jsx)(aW, {
                    children: (0, w.jsx)(tE, {})
                }))
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("RobloxSubscription");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/robloxSubscription-ce125191969b87b3.js.map