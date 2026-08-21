! function() {
    try {
        var e = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "7fd3019ec06d4926ce56ebed1d2aa088f3e3d145"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "21a7010c-4102-445b-8f74-99c718bf420d", e._sentryDebugIdIdentifier = "sentry-dbid-21a7010c-4102-445b-8f74-99c718bf420d")
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
                    s = /^0b[01]+$/i,
                    l = /^0o[0-7]+$/i,
                    c = parseInt,
                    u = (void 0 === r.g ? "undefined" : n(r.g)) == "object" && r.g && r.g.Object === Object && r.g,
                    d = ("undefined" == typeof self ? "undefined" : n(self)) == "object" && self && self.Object === Object && self,
                    f = u || d || Function("return this")(),
                    p = Object.prototype.toString,
                    m = Math.max,
                    y = Math.min,
                    h = function() {
                        return f.Date.now()
                    };

                function v(e) {
                    var t = void 0 === e ? "undefined" : n(e);
                    return !!e && ("object" == t || "function" == t)
                }

                function b(e) {
                    if ("number" == typeof e) return e;
                    if ((void 0 === (t = e) ? "undefined" : n(t)) == "symbol" || t && (void 0 === t ? "undefined" : n(t)) == "object" && "[object Symbol]" == p.call(t)) return i;
                    if (v(e)) {
                        var t, r = "function" == typeof e.valueOf ? e.valueOf() : e;
                        e = v(r) ? r + "" : r
                    }
                    if ("string" != typeof e) return 0 === e ? e : +e;
                    e = e.replace(o, "");
                    var u = s.test(e);
                    return u || l.test(e) ? c(e.slice(2), u ? 2 : 8) : a.test(e) ? i : +e
                }
                e.exports = function(e, t, r) {
                    var n, i, o, a, s, l, c = 0,
                        u = !1,
                        d = !1,
                        f = !0;
                    if ("function" != typeof e) throw TypeError("Expected a function");

                    function p(t) {
                        var r = n,
                            o = i;
                        return n = i = void 0, c = t, a = e.apply(o, r)
                    }

                    function g(e) {
                        var r = e - l,
                            n = e - c;
                        return void 0 === l || r >= t || r < 0 || d && n >= o
                    }

                    function x() {
                        var e, r, n, i = h();
                        if (g(i)) return w(i);
                        s = setTimeout(x, (e = i - l, r = i - c, n = t - e, d ? y(n, o - r) : n))
                    }

                    function w(e) {
                        return (s = void 0, f && n) ? p(e) : (n = i = void 0, a)
                    }

                    function S() {
                        var e, r = h(),
                            o = g(r);
                        if (n = arguments, i = this, l = r, o) {
                            if (void 0 === s) return c = e = l, s = setTimeout(x, t), u ? p(e) : a;
                            if (d) return s = setTimeout(x, t), p(l)
                        }
                        return void 0 === s && (s = setTimeout(x, t)), a
                    }
                    return t = b(t) || 0, v(r) && (u = !!r.leading, o = (d = "maxWait" in r) ? m(b(r.maxWait) || 0, t) : o, f = "trailing" in r ? !!r.trailing : f), S.cancel = function() {
                        void 0 !== s && clearTimeout(s), c = 0, n = l = i = s = void 0
                    }, S.flush = function() {
                        return void 0 === s ? a : w(h())
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

                function s() {
                    throw Error("setTimeout has not been defined")
                }

                function l() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    r = "function" == typeof setTimeout ? setTimeout : s
                } catch (e) {
                    r = s
                }
                try {
                    n = "function" == typeof clearTimeout ? clearTimeout : l
                } catch (e) {
                    n = l
                }

                function c(e) {
                    if (r === setTimeout) return setTimeout(e, 0);
                    if ((r === s || !r) && setTimeout) return r = setTimeout, setTimeout(e, 0);
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
                        var e = c(p);
                        d = !0;
                        for (var t = u.length; t;) {
                            for (i = u, u = []; ++f < t;) i && i[f].run();
                            f = -1, t = u.length
                        }
                        i = null, d = !1,
                            function(e) {
                                if (n === clearTimeout) return clearTimeout(e);
                                if ((n === l || !n) && clearTimeout) return n = clearTimeout, clearTimeout(e);
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

                function h() {}

                function v() {}
                a.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var r = 1; r < arguments.length; r++) t[r - 1] = arguments[r];
                    u.push(new y(e, t)), 1 !== u.length || d || c(m)
                }, y.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, a.title = "browser", a.browser = !0, a.env = {}, a.argv = [], a.version = "", a.versions = {}, a.on = h, a.addListener = h, a.once = h, a.off = h, a.removeListener = h, a.removeAllListeners = h, a.emit = h, a.prependListener = h, a.prependOnceListener = h, a.listeners = function(e) {
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
                var b = o.exports.browser,
                    g = o.exports.binding,
                    x = {},
                    w = "browser",
                    S = "browser",
                    P = "browser",
                    O = [],
                    I = {
                        nextTick: o.exports.nextTick,
                        title: o.exports.title,
                        browser: b,
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
                        emitWarning: v,
                        prependListener: o.exports.prependListener,
                        prependOnceListener: o.exports.prependOnceListener,
                        listeners: o.exports.listeners,
                        binding: g,
                        cwd: o.exports.cwd,
                        chdir: o.exports.chdir,
                        umask: o.exports.umask,
                        exit: v,
                        pid: 1,
                        features: x,
                        kill: v,
                        dlopen: v,
                        uptime: v,
                        memoryUsage: v,
                        uvCounters: v,
                        platform: w,
                        arch: S,
                        execPath: P,
                        execArgv: O
                    };
                t.addListener = o.exports.addListener, t.arch = S, t.argv = o.exports.argv, t.binding = g, t.browser = b, t.chdir = o.exports.chdir, t.cwd = o.exports.cwd, t.default = I, t.dlopen = v, t.emit = o.exports.emit, t.emitWarning = v, t.env = o.exports.env, t.execArgv = O, t.execPath = P, t.exit = v, t.features = x, t.kill = v, t.listeners = o.exports.listeners, t.memoryUsage = v, t.nextTick = o.exports.nextTick, t.off = o.exports.off, t.on = o.exports.on, t.once = o.exports.once, t.pid = 1, t.platform = w, t.prependListener = o.exports.prependListener, t.prependOnceListener = o.exports.prependOnceListener, t.removeAllListeners = o.exports.removeAllListeners, t.removeListener = o.exports.removeListener, t.title = o.exports.title, t.umask = o.exports.umask, t.uptime = v, t.uvCounters = v, t.version = o.exports.version, t.versions = o.exports.versions, t = e.exports = I
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
            var e, t, n, i, o, a, s, l, c, u, d, f, p, m, y, h, v, b, g, x, w, S = window.ReactJSX,
                P = window.Roblox["core-scripts"].react,
                O = window.Roblox["core-scripts"].util.ready,
                I = r.n(O),
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

            function C(e, t) {
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

            function A(e, t, r, n) {
                return new(r || (r = Promise))(function(i, o) {
                    function a(e) {
                        try {
                            l(n.next(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function s(e) {
                        try {
                            l(n.throw(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function l(e) {
                        var t;
                        e.done ? i(e.value) : (T(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, s)
                    }
                    l((n = n.apply(e, t || [])).next())
                })
            }

            function R(e, t) {
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
                return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function s(s) {
                    return function(l) {
                        var c = [s, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, c[0] && (o = 0)), o;) try {
                            if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                            switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                case 0:
                                case 1:
                                    i = c;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                        o.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && o.label < i[1]) {
                                        o.label = i[1], i = c;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(c);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            c = t.call(e, o)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
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
                _ = !1,
                U = function() {
                    try {
                        if ("undefined" == typeof window) return D({}, M);
                        var e = localStorage.getItem("Roblox.MrRouterConfig");
                        if (null == e) return D({}, M);
                        var t = JSON.parse(e);
                        if ("object" != (void 0 === t ? "undefined" : t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) || null === t) return D({}, M);
                        var r = D(D({}, M), "envName" in t && "string" == typeof t.envName && {
                            envName: t.envName
                        });
                        return r.envName && !_ && (_ = !0, console.warn('[MrRouter] Routing to non-production environment: "'.concat(r.envName, '"'))), r
                    } catch (e) {
                        return D({}, M)
                    }
                },
                L = "mrrouter-env",
                B = "tracestate",
                F = "traceparent",
                G = function(e) {
                    var t = e.indexOf("=");
                    return (-1 === t ? e : e.slice(0, t)).trim()
                },
                z = function(e, t) {
                    var r = "".concat(L, "=").concat(encodeURIComponent(t)),
                        n = null == e ? void 0 : e.trim(),
                        i = n ? n.split(",") : [],
                        o = i.findIndex(function(e) {
                            return G(e) === L
                        });
                    if (-1 === o) return k(k([], i.map(function(e) {
                        return e.trim()
                    }), !0), [r], !1).join(",");
                    var a = i.filter(function(e) {
                        return G(e) !== L
                    }).map(function(e) {
                        return e.trim()
                    });
                    return a.splice(o, 0, r), a.join(",")
                },
                q = function(e) {
                    var t = new Uint8Array(e);
                    return crypto.getRandomValues(t), Array.from(t, function(e) {
                        return e.toString(16).padStart(2, "0")
                    }).join("")
                },
                V = "undefined" != typeof crypto && "function" == typeof crypto.randomUUID,
                W = function() {
                    return V ? crypto.randomUUID().replaceAll("-", "").slice(0, 32) : q(16)
                },
                K = function() {
                    return V ? crypto.randomUUID().replaceAll("-", "").slice(0, 16) : q(8)
                },
                H = function(e) {
                    var t = U().envName;
                    if (t.length > 0 && (e[B] = z(e[B], t), !e[F])) {
                        var r = W(),
                            n = K();
                        e[F] = "00-".concat(r, "-").concat(n, "-01")
                    }
                };

            function X(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            r(964);
            var Y, $ = function(e) {
                    return e.replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/\d+/, "/number")
                },
                J = function(e, t) {
                    return !1 === t.ok && !1 === [401, 403, 404].includes(t.status) && e(Error("Network error"), {
                        tags: {
                            apiUrl: $(t.url),
                            apiStatus: null == t ? void 0 : t.status,
                            cors: !1
                        }
                    }), t
                },
                Q = function(e, t) {
                    e(Error("Network error"), {
                        tags: {
                            apiUrl: $(t),
                            cors: !0
                        }
                    })
                },
                Z = function() {
                    function e(e) {
                        this.captureException = e
                    }
                    return e.prototype.post = function(e) {
                        return A(this, void 0, void 0, function() {
                            return R(this, function(t) {
                                return [2, J(this.captureException, e.response)]
                            })
                        })
                    }, e.prototype.onError = function(e) {
                        return A(this, void 0, void 0, function() {
                            return R(this, function(t) {
                                return Q(this.captureException, e.url), [2]
                            })
                        })
                    }, e
                }(),
                ee = function(e) {
                    if (document) {
                        var t, r, n = document.getElementById("hba-frame");
                        return null === n && ((t = document.createElement("iframe")).id = "hba-frame", t.style.cssText = "position: fixed; top: 0; left: 0; width: 0%; height: 0%; z-index: -1", t.src = "https://www.".concat(e, "/hba/iframe"), r = t, n = (null == document ? void 0 : document.body) ? document.body.appendChild(r) : null), n
                    }
                    return null
                },
                et = function() {
                    var e = window.location.hostname.split(".").slice(0, -2).join(".");
                    return e.includes("create") ? "creator_hub" : e.includes("advertise") ? "ads_manager" : "creator_hub"
                },
                er = function(e, t) {
                    try {
                        fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                            method: "POST",
                            body: JSON.stringify({
                                name: "load_time_hba_frame",
                                value: t,
                                labelValues: {
                                    origin_site: et()
                                }
                            })
                        })
                    } catch (e) {}
                },
                en = function(e, t) {
                    try {
                        fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                            method: "POST",
                            body: JSON.stringify({
                                name: "response_time_hba_frame",
                                value: t,
                                labelValues: {
                                    origin_site: et()
                                }
                            })
                        })
                    } catch (e) {}
                },
                ei = function(e, t, r) {
                    return void 0 === r && (r = 1500), new Promise(function(n, i) {
                        var o, a, s = performance.now(),
                            l = window.setTimeout(function() {
                                er(e, performance.now() - s),
                                    function(e) {
                                        try {
                                            fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                                method: "POST",
                                                body: JSON.stringify({
                                                    name: "event_hba_frame",
                                                    value: 1,
                                                    labelValues: {
                                                        event_type: "FrameLoadTimedOut",
                                                        origin_site: et()
                                                    }
                                                })
                                            })
                                        } catch (e) {}
                                    }(e), i(Error("Promise timed out after ".concat(r, " ms")))
                            }, r),
                            c = o = function(t) {
                                var r = t.data;
                                t.origin === "https://www.".concat(e) && "dataFromHbaFrame" === r.msg && "loaded" === r.data.type && (window.removeEventListener("message", o, !1), window.clearTimeout(l), er(e, performance.now() - s), n())
                            };
                        window.addEventListener("message", c, !1), null == (a = t.contentWindow) || a.postMessage({
                            msg: "checkLoadedRequest"
                        }, "https://www.".concat(e))
                    })
                },
                eo = function(e, t, r, n, i, o, a) {
                    var s;
                    if (void 0 === a && (a = 100), window) {
                        var l, c = performance.now(),
                            u = window.setTimeout(function() {
                                en(r, performance.now() - c),
                                    function(e) {
                                        try {
                                            fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                                method: "POST",
                                                body: JSON.stringify({
                                                    name: "event_hba_frame",
                                                    value: 1,
                                                    labelValues: {
                                                        event_type: "FrameResponseTimedOut",
                                                        origin_site: et()
                                                    }
                                                })
                                            })
                                        } catch (e) {}
                                    }(r), e({
                                        url: i.url,
                                        init: i.init
                                    })
                            }, a),
                            d = l = function(t) {
                                var n = t.data,
                                    a = i.url,
                                    s = i.init;
                                if (t.origin === "https://www.".concat(r) && "dataFromHbaFrame" === n.msg && "batHeader" === n.data.type && (!n.data.identifier || n.data.identifier === o))
                                    if (!n.data.isError && n.data.batHeader) {
                                        window.clearTimeout(u), window.removeEventListener("message", l, !1), en(r, performance.now() - c);
                                        var d = n.data.batHeader;
                                        e({
                                            url: a,
                                            init: D(D({}, s), {
                                                headers: D(D({}, s.headers), {
                                                    "x-bound-auth-token": d["x-bound-auth-token"]
                                                })
                                            })
                                        })
                                    } else window.clearTimeout(u), window.removeEventListener("message", l, !1), en(r, performance.now() - c), e({
                                        url: a,
                                        init: s
                                    })
                            };
                        window.addEventListener("message", d, !1), null == (s = n.contentWindow) || s.postMessage({
                            msg: "signSubdomainRequest",
                            identifier: o,
                            serializedSubdomainRequestData: JSON.stringify({
                                url: i.url,
                                requestInit: i.init
                            })
                        }, "https://www.".concat(r))
                    }
                },
                ea = function() {
                    return crypto.randomUUID()
                },
                es = function() {
                    function e(e, t, r) {
                        void 0 === t && (t = 1500), void 0 === r && (r = 100), this.robloxSiteDomain = e, this.hbaFrameAlreadyLoaded = !1, this.hbaFrameLoadFailed = !1, this.hbaFrame = null, this.loadTimeOut = t, this.dataTimeOut = r
                    }
                    return e.prototype.getOrCreateHbaFrame = function() {
                        return ee(this.robloxSiteDomain)
                    }, e.prototype.pre = function(e) {
                        var t = this;
                        return new Promise(function(r, n) {
                            var i = e.url,
                                o = e.init;
                            if (t.hbaFrame = t.getOrCreateHbaFrame(), null !== t.hbaFrame) {
                                var a = ea();
                                t.hbaFrameAlreadyLoaded ? eo(r, 0, t.robloxSiteDomain, t.hbaFrame, e, a, t.dataTimeOut) : t.hbaFrameLoadFailed ? r({
                                    url: i,
                                    init: o
                                }) : ei(t.robloxSiteDomain, t.hbaFrame, t.loadTimeOut).then(function() {
                                    t.hbaFrame ? (t.hbaFrameAlreadyLoaded = !0, eo(r, 0, t.robloxSiteDomain, t.hbaFrame, e, a, t.dataTimeOut)) : r({
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
            (n = Y || (Y = {})).UNKNOWN = "unknown", n.INVALIDATED = "invalidated", n.ABANDONED = "abandoned", n.LOADFAILED = "loadfailed";
            var el = function(e) {
                    function t(t) {
                        var r = e.call(this, "challenge error for challenge kind ".concat(t.kind)) || this;
                        return r.parameters = t, r
                    }
                    return C(t, e), t.prototype.match = function(e) {
                        return this.parameters.kind === e.parameters.kind && JSON.stringify(this.parameters.data) === JSON.stringify(e.parameters.data)
                    }, t.prototype.matchAbandoned = function(e) {
                        return this.match(e) && e.parameters.kind === Y.ABANDONED
                    }, t
                }(Error),
                ec = "rblx-challenge-id",
                eu = "rblx-challenge-type",
                ed = "rblx-challenge-metadata",
                ef = function(e, t) {
                    return 403 === e.status && e.headers.has(ec) && e.headers.has(eu) && e.headers.has(ed) && "iframe" === t
                },
                ep = function(e) {
                    var t, r, n, i, o, a, s, l, c, u = e.url,
                        d = e.request,
                        f = e.response,
                        p = e.robloxSiteDomain,
                        m = (o = new URLSearchParams([
                            ["challenge-type", "generic"],
                            ["dark-mode", "true"],
                            ["barista-mode", "true"],
                            ["generic-challenge-type", null != (t = f.headers.get(eu)) ? t : ""],
                            ["generic-challenge-id", null != (r = f.headers.get(ec)) ? r : ""],
                            ["challenge-metadata-json", null != (n = f.headers.get(ed)) ? n : ""],
                            ["origin", null != (i = window.location.hostname.split(".").slice(0, -2).join(".")) ? i : ""]
                        ]), a = new URL("https://www.".concat(p, "/challenge/cdn/hybrid?").concat(o.toString())), (s = document.createElement("iframe")).id = "challenge-frame", s.allowFullscreen = !0, s.setAttribute("allowtransparency", "true"), s.setAttribute("allow", "publickey-credentials-get;publickey-credentials-create"), s.style.cssText = "position: fixed; top: 0; left: 0; width: 100%; height: 100%; visibility: hidden; color-scheme: normal; border: none; z-index: 2147483647;", s.src = a.toString(), s.onload = function() {
                            s.style.visibility = "visible"
                        }, l = s, document && document.body ? document.body.appendChild(l) : null);
                    return new Promise(function(e, t) {
                        window && m && (c = function(r) {
                            var n, i, o, a, s, l, c, p, m, y, h;
                            if (r.data && r.data.genericChallengeResponse) switch (r.data.genericChallengeResponse.type) {
                                case "challengeAbandoned":
                                    t(new el({
                                        kind: Y.ABANDONED,
                                        data: {
                                            challengeType: null != (n = f.headers.get(eu)) ? n : ""
                                        }
                                    }));
                                    break;
                                case "challengeDisplayed":
                                    break;
                                case "challengeCompleted":
                                    (c = r.data.genericChallengeResponse.data).challengeType && c.metadata ? e((p = c.metadata, fetch(u, D(D({}, d), {
                                        headers: D(D({}, d.headers), ((m = {})[ec] = null != (y = f.headers.get(ec)) ? y : "", m[ed] = btoa(JSON.stringify(p)), m[eu] = null != (h = f.headers.get(eu)) ? h : "", m))
                                    })))) : t(new el({
                                        kind: Y.UNKNOWN,
                                        data: {
                                            challengeType: null != (i = f.headers.get(eu)) ? i : ""
                                        }
                                    }));
                                    break;
                                case "challengeInvalidated":
                                    t((c = r.data.genericChallengeResponse.data) && c.challengeType && c.metadata ? new el({
                                        kind: Y.INVALIDATED,
                                        data: c
                                    }) : new el({
                                        kind: Y.INVALIDATED,
                                        data: {
                                            challengeType: null != (o = f.headers.get(eu)) ? o : ""
                                        }
                                    }));
                                    break;
                                case "challengeParsed":
                                    !1 === (c = r.data.genericChallengeResponse.data).parsed && t(new el({
                                        kind: Y.UNKNOWN,
                                        data: {
                                            challengeType: null != (a = f.headers.get(eu)) ? a : ""
                                        }
                                    }));
                                    break;
                                case "challengeInitialized":
                                    !1 === (c = r.data.genericChallengeResponse.data).initialized && t(new el({
                                        kind: Y.UNKNOWN,
                                        data: {
                                            challengeType: null != (s = f.headers.get(eu)) ? s : ""
                                        }
                                    }));
                                    break;
                                case "challengePageLoaded":
                                    !1 === (c = r.data.genericChallengeResponse.data).pageLoaded && t(new el({
                                        kind: Y.LOADFAILED,
                                        data: {
                                            challengeType: null != (l = f.headers.get(eu)) ? l : ""
                                        }
                                    }))
                            }
                        }, window.addEventListener("message", c, !1))
                    }).finally(function() {
                        null == m || m.remove(), c && window.removeEventListener("message", c, !1)
                    })
                },
                em = function() {
                    function e(e, t) {
                        void 0 === t && (t = "iframe"), this.robloxSiteDomain = e, this.genericChallengeMiddlewareType = t
                    }
                    return e.prototype.post = function(e) {
                        var t = e.url,
                            r = e.init,
                            n = e.response;
                        return ef(n, this.genericChallengeMiddlewareType) ? ep({
                            url: t,
                            request: r,
                            response: n,
                            robloxSiteDomain: this.robloxSiteDomain
                        }) : Promise.resolve(n)
                    }, e
                }(),
                ey = function(e) {
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
                eh = function() {
                    function e(e) {
                        this.unifiedLogger = e
                    }
                    return e.prototype.post = function(e) {
                        return this.unifiedLogger.logApiVitalsEvent(ey({
                            elapsedTime: e.elapsedTime,
                            url: e.url,
                            status: e.response.status,
                            schemaPath: e.schemaPath
                        })), Promise.resolve(e.response)
                    }, e
                }(),
                ev = "x-csrf-token",
                eb = ["POST", "PATCH", "DELETE", "PUT"],
                eg = function() {
                    var e, t = "";
                    try {
                        "undefined" != typeof window && (t = null != (e = localStorage.getItem(ev)) ? e : "")
                    } catch (e) {
                        console.warn("Error reading localStorage key “".concat(ev, "”:"), e)
                    }
                    return t
                },
                ex = eg(),
                ew = function(e) {
                    try {
                        ex = e, "undefined" != typeof window && localStorage.setItem(ev, e)
                    } catch (e) {
                        console.warn("Error setting localStorage key “".concat(ev, "”:"), e)
                    }
                },
                eS = function() {
                    function e() {
                        this.currentToken = eg()
                    }
                    return e.prototype.pre = function(e) {
                        var t, r = e.url,
                            n = e.init,
                            i = this.currentToken;
                        return n.headers && "object" == ((t = n.headers) && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) && ev in n.headers && (i = n.headers[ev]) && (this.currentToken = i, ew(i)), n.method && eb.includes(n.method) ? Promise.resolve({
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
                            o = i.headers.get(ev);
                        return 403 === i.status && i.headers.has(ev) && null !== o ? (this.currentToken = o, ew(o), t(r, this.prepareRequestInit(n))) : Promise.resolve(i)
                    }, e.prototype.prepareRequestInit = function(e) {
                        var t;
                        return D(D({}, e), {
                            headers: D(D({}, e.headers), ((t = {})[ev] = this.currentToken, t))
                        })
                    }, e
                }(),
                eP = [],
                eO = function(e) {
                    eP = eP.filter(function(t) {
                        return t !== e
                    })
                },
                eI = function(e) {
                    var t = e.url;
                    503 === e.status && eP.forEach(function(e) {
                        return e(t)
                    })
                },
                eE = function() {
                    function e() {}
                    return e.prototype.subscribe = function(e) {
                        return eP.push(e),
                            function() {
                                return eO(e)
                            }
                    }, e.prototype.unsubscribe = function(e) {
                        return eO(e)
                    }, e.prototype.post = function(e) {
                        var t = e.response;
                        return eI(t), Promise.resolve(t)
                    }, e
                }(),
                ej = function() {
                    function e() {}
                    return e.prototype.pre = function(e) {
                        var t = e.url,
                            r = e.init;
                        if (!U().envName) return Promise.resolve({
                            url: t,
                            init: r
                        });
                        var n = D({}, r.headers);
                        return H(n), Promise.resolve({
                            url: t,
                            init: D(D({}, r), {
                                headers: n
                            })
                        })
                    }, e
                }(),
                eT = new eS,
                eN = new eE,
                eC = [function(e) {
                    return e.captureException ? new Z(e.captureException) : void 0
                }, function(e) {
                    return e.robloxSiteDomain && e.enableBoundAuthToken ? new es(e.robloxSiteDomain, e.boundAuthTokenLoadTimeout, e.boundAuthTokenDataTimeout) : void 0
                }, function(e) {
                    return e.robloxSiteDomain ? new em(e.robloxSiteDomain, e.genericChallengeMiddlewareType) : void 0
                }, function(e) {
                    return e.unifiedLogger ? new eh(e.unifiedLogger) : void 0
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
                                        if (X(n, Array)) {
                                            var a = n.map(function(e) {
                                                return encodeURIComponent(String(e))
                                            }).join("&".concat(encodeURIComponent(o), "="));
                                            return "".concat(encodeURIComponent(o), "=").concat(a)
                                        }
                                        return X(n, Set) ? t(r, Array.from(n), i) : X(n, Date) ? "".concat(encodeURIComponent(o), "=").concat(encodeURIComponent(n.toISOString())) : X(n, Object) ? e(n, o) : "".concat(encodeURIComponent(o), "=").concat(encodeURIComponent(String(n)))
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
                                return A(e, void 0, void 0, function() {
                                    return R(this, function(e) {
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
                eA = new eD,
                eR = function() {
                    function e(e) {
                        void 0 === e && (e = eA);
                        var t = this;
                        this.configuration = e, this.fetchApi = function(e, r, n) {
                            return A(t, void 0, void 0, function() {
                                var t, i, o, a, s, l, c, u, d, f, p, m, y, h = this;
                                return R(this, function(v) {
                                    switch (v.label) {
                                        case 0:
                                            t = function(e, t) {
                                                return h.fetchApi(e, t, n)
                                            }, i = {
                                                url: e,
                                                init: r
                                            }, o = 0, a = this.middleware, v.label = 1;
                                        case 1:
                                            return o < a.length ? (y = a[o]).pre ? [4, y.pre(D({
                                                fetch: t
                                            }, i))] : [3, 3] : [3, 4];
                                        case 2:
                                            i = v.sent() || i, v.label = 3;
                                        case 3:
                                            return o++, [3, 1];
                                        case 4:
                                            s = void 0, l = performance.now(), v.label = 5;
                                        case 5:
                                            return v.trys.push([5, 7, , 12]), [4, (this.configuration.fetchApi || fetch)(i.url, i.init)];
                                        case 6:
                                            return s = v.sent(), c = performance.now(), [3, 12];
                                        case 7:
                                            u = v.sent(), c = performance.now(), d = 0, f = this.middleware, v.label = 8;
                                        case 8:
                                            return d < f.length ? (y = f[d]).onError ? [4, y.onError({
                                                fetch: t,
                                                url: i.url,
                                                init: i.init,
                                                error: u,
                                                response: s ? s.clone() : void 0
                                            })] : [3, 10] : [3, 11];
                                        case 9:
                                            s = v.sent() || s, v.label = 10;
                                        case 10:
                                            return d++, [3, 8];
                                        case 11:
                                            if (void 0 === s) throw X(u, Error) ? new eM(u, "The request failed and the interceptors did not return an alternative response") : u;
                                            return [3, 12];
                                        case 12:
                                            p = 0, m = this.middleware, v.label = 13;
                                        case 13:
                                            return p < m.length ? (y = m[p]).post ? [4, y.post({
                                                fetch: t,
                                                url: i.url,
                                                init: i.init,
                                                response: s.clone(),
                                                elapsedTime: c - l,
                                                schemaPath: n
                                            })] : [3, 15] : [3, 16];
                                        case 14:
                                            s = v.sent() || s, v.label = 15;
                                        case 15:
                                            return p++, [3, 13];
                                        case 16:
                                            return [2, s]
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
                        return A(this, void 0, void 0, function() {
                            var r, n, i, o;
                            return R(this, function(a) {
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
                        return A(this, void 0, void 0, function() {
                            var r, n, i, o, a, s, l, c = this;
                            return R(this, function(u) {
                                var d, f;
                                switch (u.label) {
                                    case 0:
                                        return r = this.configuration.basePath + e.path, void 0 !== e.query && 0 !== Object.keys(e.query).length && (r += "?" + this.configuration.queryParamsStringify(e.query)), Object.keys(n = Object.assign({}, this.configuration.headers, e.headers)).forEach(function(e) {
                                            return void 0 === n[e] ? delete n[e] : {}
                                        }), i = "function" == typeof t ? t : function() {
                                            return A(c, void 0, void 0, function() {
                                                return R(this, function(e) {
                                                    return [2, t]
                                                })
                                            })
                                        }, o = {
                                            method: e.method,
                                            headers: n,
                                            body: e.body,
                                            credentials: this.configuration.credentials
                                        }, s = [D({}, o)], [4, i({
                                            init: o,
                                            context: e
                                        })];
                                    case 1:
                                        return a = D.apply(void 0, s.concat([u.sent()])), l = D(D({}, a), {
                                            body: (d = a.body, "undefined" != typeof FormData && X(d, FormData) || X(a.body, URLSearchParams) || (f = a.body, "undefined" != typeof Blob && X(f, Blob)) ? a.body : JSON.stringify(a.body))
                                        }), [2, {
                                            url: r,
                                            init: l
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
                    return C(t, e), t
                }(Error),
                eM = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.cause = t, n.name = "FetchError", n
                    }
                    return C(t, e), t
                }(Error),
                e_ = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.field = t, n.name = "RequiredError", n
                    }
                    return C(t, e), t
                }(Error);

            function eU(e, t) {
                return null != e[t]
            }
            var eL = function() {
                    function e(e, t) {
                        void 0 === t && (t = function(e) {
                            return e
                        }), this.raw = e, this.transformer = t
                    }
                    return e.prototype.value = function() {
                        return A(this, void 0, void 0, function() {
                            var e;
                            return R(this, function(t) {
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
                eB = ((function(e) {
                    this.raw = e
                }).prototype.value = function() {
                    return A(this, void 0, void 0, function() {
                        return R(this, function(e) {
                            return [2, void 0]
                        })
                    })
                }, (function(e) {
                    this.raw = e
                }).prototype.value = function() {
                    return A(this, void 0, void 0, function() {
                        return R(this, function(e) {
                            switch (e.label) {
                                case 0:
                                    return [4, this.raw.blob()];
                                case 1:
                                    return [2, e.sent()]
                            }
                        })
                    })
                }, function() {
                    function e(e) {
                        this.raw = e
                    }
                    return e.prototype.value = function() {
                        return A(this, void 0, void 0, function() {
                            return R(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        return [4, this.raw.text()];
                                    case 1:
                                        return [2, e.sent()]
                                }
                            })
                        })
                    }, e
                }()),
                eF = function(e) {
                    function t(t) {
                        void 0 === t && (t = {});
                        var r, n = D({}, t),
                            i = n.middleware || [];
                        return i.unshift.apply(i, (r = t, eC.map(function(e) {
                            return e(r)
                        }).filter(function(e) {
                            return e
                        }))), n.middleware = i, e.call(this, n) || this
                    }
                    return C(t, e), t
                }(eD);

            function eG(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var ez = function(e, t) {
                return (ez = Object.setPrototypeOf || eG({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function eq(e, t, r, n) {
                return new(r || (r = Promise))(function(i, o) {
                    function a(e) {
                        try {
                            l(n.next(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function s(e) {
                        try {
                            l(n.throw(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function l(e) {
                        var t;
                        e.done ? i(e.value) : (eG(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, s)
                    }
                    l((n = n.apply(e, t || [])).next())
                })
            }

            function eV(e, t) {
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
                return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function s(s) {
                    return function(l) {
                        var c = [s, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, c[0] && (o = 0)), o;) try {
                            if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                            switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                case 0:
                                case 1:
                                    i = c;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                        o.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && o.label < i[1]) {
                                        o.label = i[1], i = c;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(c);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            c = t.call(e, o)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function eW(e) {
                return e
            }
            "function" == typeof SuppressedError && SuppressedError;

            function eK(e, t) {
                return null == e ? e : {
                    currencyCode: e.currencyCode,
                    units: e.units,
                    nanos: e.nanos
                }
            }

            function eH(e) {
                return e
            }

            function eX(e) {
                var t, r;
                return null == (t = e) ? t : {
                    offerType: eU(t, "offerType") ? t.offerType : void 0,
                    freeTrialOffer: eU(t, "freeTrialOffer") ? null == (r = t.freeTrialOffer) ? r : {
                        periodType: r.periodType,
                        duration: r.duration,
                        estimatedTrialEndDate: eU(r, "estimatedTrialEndDate") ? null === r.estimatedTrialEndDate ? null : new Date(r.estimatedTrialEndDate) : void 0
                    } : void 0
                }
            }
            var eY = "Blackbird";

            function e$(e) {
                var t;
                return null == (t = e) ? t : {
                    type: t.type,
                    id: t.id
                }
            }

            function eJ(e) {
                var t;
                return null == (t = e) ? t : {
                    tierId: t.tierId,
                    periodIndex: t.periodIndex,
                    discountPercent: t.discountPercent
                }
            }

            function eQ(e) {
                var t, r, n, i, o, a, s;
                return null == (t = e) ? t : {
                    productKey: e$(t.productKey),
                    periodType: t.periodType,
                    periodCount: t.periodCount,
                    localizedPrice: eK(t.localizedPrice),
                    localizedPriceDisplayString: t.localizedPriceDisplayString,
                    localizedStrikethroughPrice: eK(t.localizedStrikethroughPrice),
                    localizedStrikethroughPriceDisplayString: t.localizedStrikethroughPriceDisplayString,
                    productTypeDetails: null == (r = t.productTypeDetails) ? r : {
                        currencySubscriptionProductDetails: eU(r, "currencySubscriptionProductDetails") ? null == (n = r.currencySubscriptionProductDetails) ? n : {
                            currencyType: n.currencyType,
                            entitledAmountMicros: n.entitledAmountMicros
                        } : void 0,
                        developerSubscriptionProductDetails: eU(r, "developerSubscriptionProductDetails") ? null == (i = r.developerSubscriptionProductDetails) ? i : {
                            universeId: i.universeId,
                            imageAssetId: i.imageAssetId,
                            localizedName: i.localizedName,
                            localizedDescription: i.localizedDescription
                        } : void 0,
                        robloxSubscriptionProductDetails: eU(r, "robloxSubscriptionProductDetails") ? null == (o = r.robloxSubscriptionProductDetails) ? o : {
                            featureConfig: null == (a = o.featureConfig) ? a : {
                                virtualTransactionDiscounts: null === a.virtualTransactionDiscounts ? null : a.virtualTransactionDiscounts.map(eJ),
                                isRobuxTransferEnabled: a.isRobuxTransferEnabled,
                                isTradingEnabled: a.isTradingEnabled,
                                isUgcPublishingEnabled: a.isUgcPublishingEnabled,
                                privateServerDiscounts: null === a.privateServerDiscounts ? null : a.privateServerDiscounts.map(eJ),
                                currencySubscriptionConfig: null == (s = a.currencySubscriptionConfig) ? s : {
                                    currencyType: s.currencyType,
                                    entitledAmountMicros: s.entitledAmountMicros
                                }
                            }
                        } : void 0
                    },
                    eligibleOffers: t.eligibleOffers.map(eX)
                }
            }

            function eZ(e) {
                var t, r, n, i, o, a, s;
                return null == (t = e) ? t : {
                    productKey: e$(t.productKey),
                    periodType: t.periodType,
                    displayPrice: eK(t.displayPrice),
                    activationTimestampMs: t.activationTimestampMs,
                    expirationTimestampMs: t.expirationTimestampMs,
                    nextRenewalTimestampMs: t.nextRenewalTimestampMs,
                    paymentProvider: eH(t.paymentProvider),
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
                    activeOffers: t.activeOffers.map(eX),
                    productTypeMembershipDetails: null == (i = t.productTypeMembershipDetails) ? i : {
                        robloxSubscriptionMembershipDetails: eU(i, "robloxSubscriptionMembershipDetails") ? null == (o = i.robloxSubscriptionMembershipDetails) ? o : {
                            features: null == (a = o.features) ? a : {
                                productType: a.productType,
                                virtualTransactionDiscountTierId: a.virtualTransactionDiscountTierId,
                                isRobuxTransferEnabled: a.isRobuxTransferEnabled,
                                isTradingEnabled: a.isTradingEnabled,
                                isUgcPublishingEnabled: a.isUgcPublishingEnabled,
                                privateServerDiscountTierId: a.privateServerDiscountTierId
                            },
                            currencySubscriptionBenefit: null == (s = o.currencySubscriptionBenefit) ? s : {
                                currencyType: s.currencyType,
                                entitledAmountMicrosPerGrantingPeriod: s.entitledAmountMicrosPerGrantingPeriod,
                                grantingPeriodType: s.grantingPeriodType
                            }
                        } : void 0
                    },
                    productInfo: eQ(t.productInfo)
                }
            }
            var e0 = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return function(e, t) {
                        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                        function r() {
                            this.constructor = e
                        }
                        ez(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
                    }(t, e), t.prototype.subscriptionsV2GetProductDisplayPriceRaw = function(e, t) {
                        return eq(this, void 0, void 0, function() {
                            var r, n;
                            return eV(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new e_("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new e_("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        return r = {}, n = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(i.sent(), function(e) {
                                            return null == e ? e : {
                                                displayPrice: eK(e.displayPrice)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductDisplayPrice = function(e, t) {
                        return eq(this, void 0, void 0, function() {
                            return eV(this, function(r) {
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
                        return eq(this, void 0, void 0, function() {
                            var r, n;
                            return eV(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new e_("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new e_("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
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
                                                paymentProviders: e.paymentProviders.map(eH)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductPaymentMetadata = function(e, t) {
                        return eq(this, void 0, void 0, function() {
                            return eV(this, function(r) {
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
                        return eq(this, void 0, void 0, function() {
                            var r, n;
                            return eV(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new e_("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new e_("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(i.sent(), function(e) {
                                            return null == e ? e : {
                                                subscriptionProductInfo: eQ(e.subscriptionProductInfo)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetSubscriptionProductInfo = function(e, t) {
                        return eq(this, void 0, void 0, function() {
                            return eV(this, function(r) {
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
                        return eq(this, void 0, void 0, function() {
                            var r, n;
                            return eV(this, function(i) {
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
                                                productKeys: e.productKeys.map(e$),
                                                products: e.products.map(eQ)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListAvailableSubscriptionProducts = function() {
                        return eq(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eV(this, function(r) {
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
                        return eq(this, void 0, void 0, function() {
                            var r, n;
                            return eV(this, function(i) {
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
                                                subscriptions: e.subscriptions.map(eZ),
                                                hasMore: e.hasMore,
                                                cursor: e.cursor
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListSubscriptions = function() {
                        return eq(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eV(this, function(r) {
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
                        return eq(this, void 0, void 0, function() {
                            var r, n;
                            return eV(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new e_("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new e_("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
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
                                                paymentProvider: eH(e.paymentProvider),
                                                providerPurchasePayload: null == (t = e.providerPurchasePayload) ? t : {
                                                    stripePurchasePayload: eU(t, "stripePurchasePayload") ? null == (r = t.stripePurchasePayload) ? r : {
                                                        checkoutUrl: r.checkoutUrl
                                                    } : void 0,
                                                    appleAppStorePurchasePayload: eU(t, "appleAppStorePurchasePayload") ? null == (n = t.appleAppStorePurchasePayload) ? n : {
                                                        appAccountToken: n.appAccountToken,
                                                        partnerBillingJwtToken: n.partnerBillingJwtToken,
                                                        partnerBillingGenericProductId: n.partnerBillingGenericProductId
                                                    } : void 0,
                                                    googlePlayStorePurchasePayload: eU(t, "googlePlayStorePurchasePayload") ? null == (i = t.googlePlayStorePurchasePayload) ? i : {
                                                        providerProductId: i.providerProductId,
                                                        providerProductType: i.providerProductType,
                                                        chargeRequestId: i.chargeRequestId,
                                                        offerId: eU(i, "offerId") ? i.offerId : void 0
                                                    } : void 0,
                                                    creditBalancePurchasePayload: eU(t, "creditBalancePurchasePayload") ? null == (o = t.creditBalancePurchasePayload) ? o : {
                                                        checkoutUrl: o.checkoutUrl
                                                    } : void 0,
                                                    braintreePurchasePayload: eU(t, "braintreePurchasePayload") ? null == (a = t.braintreePurchasePayload) ? a : {
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
                        return eq(this, void 0, void 0, function() {
                            return eV(this, function(r) {
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
                }(eR),
                e1 = window.Roblox["core-scripts"].guac,
                e2 = window.Roblox["core-scripts"].meta.device,
                e4 = "roblox_subscription_redirect_url",
                e3 = window.React,
                e5 = r.n(e3),
                e6 = function() {
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
                e8 = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                e7 = e5().forwardRef(function(e, t) {
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
                    return e5().createElement("span", function(e) {
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
                        className: e6("grow-0 shrink-0 basis-auto icon", r, e8[void 0 === n ? "Medium" : n], i)
                    }, o))
                });
            e7.displayName = "Icon";
            var e9 = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                te = function(e) {
                    var t = e.className;
                    return e5().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: e6("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                tt = "opacity-[0.5]",
                tr = function(e) {
                    var t = e.width,
                        r = e.height;
                    return e5().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, e5().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function tn(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ti(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function to() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = ti(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : ti(t[e], null)
                        }
                    }
                }
            }

            function ta() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return e3.useCallback(to.apply(void 0, function(e) {
                    if (Array.isArray(e)) return tn(e)
                }(t) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tn(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tn(e, t)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function ts(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tl(e) {
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

            function tc(e, t) {
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

            function tu(e, t) {
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

            function td(e) {
                return function(e) {
                    if (Array.isArray(e)) return ts(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ts(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ts(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tf(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var tp = Symbol.for("react.lazy"),
                tm = e3[" use ".trim().toString()];

            function ty(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : tf(e)) === "object" && "$$typeof" in e && e.$$typeof === tp && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : tf(t)) === "object" && null !== t && "then" in t
            }
            var th = ((e = e3.forwardRef(function(e, t) {
                    var r = e.children,
                        n = tu(e, ["children"]);
                    if (ty(r) && "function" == typeof tm && (r = tm(r._payload)), e3.isValidElement(r)) {
                        var i, o, a, s, l, c = (l = (s = null == (o = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in s && s.isReactWarning) ? i.ref : (l = (s = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in s && s.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                            u = function(e, t) {
                                var r = tl({}, t);
                                for (var n in t) ! function(n) {
                                    var i = e[n],
                                        o = t[n];
                                    /^on[A-Z]/.test(n) ? i && o ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = o.apply(void 0, td(t));
                                        return i.apply(void 0, td(t)), n
                                    } : i && (r[n] = i) : "style" === n ? r[n] = tl({}, i, o) : "className" === n && (r[n] = [i, o].filter(Boolean).join(" "))
                                }(n);
                                return tl({}, e, r)
                            }(n, r.props);
                        return r.type !== e3.Fragment && (u.ref = t ? to(t, c) : c), e3.cloneElement(r, u)
                    }
                    return e3.Children.count(r) > 1 ? e3.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), i = e, (o = e3.forwardRef(function(e, t) {
                    var r = e.children,
                        n = tu(e, ["children"]);
                    ty(r) && "function" == typeof tm && (r = tm(r._payload));
                    var o = e3.Children.toArray(r),
                        a = o.find(tb);
                    if (a) {
                        var s = a.props.children,
                            l = o.map(function(e) {
                                return e !== a ? e : e3.Children.count(s) > 1 ? e3.Children.only(null) : e3.isValidElement(s) ? s.props.children : null
                            });
                        return (0, S.jsx)(i, tc(tl({}, n), {
                            ref: t,
                            children: e3.isValidElement(s) ? e3.cloneElement(s, void 0, l) : null
                        }))
                    }
                    return (0, S.jsx)(i, tc(tl({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), o),
                tv = Symbol("radix.slottable");

            function tb(e) {
                return e3.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === tv
            }

            function tg(e) {
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

            function tx(e, t) {
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

            function tw(e, t) {
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
            var tS = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                tP = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                tO = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                tI = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                tE = (0, e3.forwardRef)(function(e, t) {
                    var r = e.children,
                        n = e.className,
                        i = e.style,
                        o = e.isDisabled,
                        a = void 0 !== o && o,
                        s = e.isLoading,
                        l = void 0 !== s && s,
                        c = e.icon,
                        u = e.size,
                        d = void 0 === u ? "Large" : u,
                        f = e.variant,
                        p = void 0 === f ? "Emphasis" : f,
                        m = e.asChild,
                        y = tw(e, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        h = e6("foundation-web-button", a ? tt : [e9, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", tP[d], a ? tI[p] : tO[p], n),
                        v = tg({
                            textDecoration: "none"
                        }, i),
                        b = function(e) {
                            return e5().createElement(e5().Fragment, null, e5().createElement(te, null), l && e5().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, e5().createElement(tr, {
                                width: tS[d],
                                height: tS[d]
                            })), e5().createElement("span", {
                                className: e6("flex items-center min-width-0", "Large" === d || "Medium" === d ? "gap-small" : "gap-xsmall", l && "invisible")
                            }, c && e5().createElement(e7, {
                                name: c,
                                size: d
                            }), e5().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (m) {
                        y.as;
                        var g = tw(y, ["as"]),
                            x = e5().Children.only(r);
                        return e5().createElement(th, tx(tg({
                            ref: t
                        }, g), {
                            className: h,
                            style: v,
                            "aria-disabled": a || void 0
                        }), e5().cloneElement(x, {}, b(x.props.children)))
                    }
                    if ("a" === y.as) {
                        y.as;
                        var w = y.href,
                            S = tw(y, ["as", "href"]);
                        return e5().createElement("a", tx(tg({
                            ref: t
                        }, S), {
                            "aria-disabled": a,
                            href: a ? void 0 : w,
                            className: h,
                            style: v
                        }), b(r))
                    }
                    y.as;
                    var P = tw(y, ["as"]);
                    return e5().createElement("button", tx(tg({
                        ref: t,
                        type: "button"
                    }, P), {
                        disabled: a,
                        className: h,
                        style: v
                    }), b(r))
                }),
                tj = function() {
                    var e = (0, P.useTranslation)().translate,
                        t = (0, e3.useCallback)(function() {
                            window.history.back()
                        }, []);
                    return (0, S.jsxs)("div", {
                        className: "height-[210px] gap-y-small margin-top-[240px] flex flex-col items-center",
                        children: [(0, S.jsx)(e7, {
                            className: "content-muted !size-1400",
                            name: "icon-regular-triangle-exclamation"
                        }), (0, S.jsx)("p", {
                            className: "text-heading-small",
                            children: e("Message.Error.Generic")
                        }), (0, S.jsxs)("div", {
                            className: "gap-x-medium padding-top-medium flex",
                            children: [(0, S.jsx)(tE, {
                                className: "min-width-[96px]",
                                size: "Small",
                                variant: "SoftEmphasis",
                                onClick: t,
                                children: e("Action.Back")
                            }), (0, S.jsx)(tE, {
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

            function tT(e) {
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
            var tN = (0, e3.createContext)(null),
                tC = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-medium"
                },
                tD = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                tA = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                tR = (0, e3.forwardRef)(function(e, t) {
                    var r = e.isContained,
                        n = e.size,
                        i = e.divider,
                        o = e.alignment,
                        a = e.title,
                        s = e.isTitleBold,
                        l = e.text,
                        c = e.isMultiline,
                        u = e.metadata,
                        d = e.description,
                        f = e.leading,
                        p = e.trailing,
                        m = e.onSelect,
                        y = e.className,
                        h = void 0 === u && void 0 === d && void 0 === o && void 0 === n;
                    if ((void 0 !== l || void 0 !== c) && !h) throw Error('ListItem: Cannot use deprecated "text" or "isMultiline" props with "metadata", "description", "alignment", or "size".');
                    var v = null != n ? n : "Large",
                        b = void 0 !== m,
                        g = b ? "button" : "div",
                        x = !!h && c,
                        w = "Top" === o ? "justify-start" : "justify-center";
                    x && (w = "justify-start");
                    var S = e5().createElement(g, tT({
                            className: e6("bg-none width-full flex gap-medium stroke-none foundation-web-list-item padding-y-none", r ? "padding-x-medium" : "padding-x-xlarge", "Full" === i && "foundation-web-list-item-bottom-divider", b && "relative clip group/interactable focus-visible:outline-focus disabled:outline-none", b && "cursor-pointer", y)
                        }, b && {
                            onClick: function() {
                                return m()
                            }
                        }), b && e5().createElement(te, null), f && e5().createElement("div", {
                            className: e6("flex flex-col padding-y-large", w)
                        }, f), e5().createElement("div", {
                            className: "flex fill clip-x padding-y-large gap-x-medium relative "
                        }, e5().createElement("div", {
                            className: e6("flex flex-col fill clip-x justify-center", x && "gap-xsmall")
                        }, a && e5().createElement("div", {
                            className: e6("content-emphasis text-align-x-start", void 0 === s || s ? tD[v] : tA[v])
                        }, a), h && l && e5().createElement("div", {
                            className: e6("content-default text-align-x-start", tC[v], !c && "text-truncate-split text-no-wrap")
                        }, l), !h && u && e5().createElement("div", {
                            className: e6("content-default text-align-x-start text-truncate-split text-no-wrap", tC[v])
                        }, u), !h && d && e5().createElement("div", {
                            className: e6("content-default text-align-x-start padding-top-xsmall", tC[v])
                        }, d)), p && e5().createElement("div", {
                            className: e6("flex flex-col", w)
                        }, p), "Inset" === i && e5().createElement("div", {
                            className: "foundation-web-list-item-inset-divider"
                        }))),
                        P = (0, e3.useMemo)(function() {
                            return {
                                size: v
                            }
                        }, [v]);
                    return e5().createElement("li", {
                        ref: t,
                        style: {
                            listStyle: "none"
                        }
                    }, e5().createElement(tN.Provider, {
                        value: P
                    }, S))
                });
            tR.displayName = "ListItem";
            var tk = (0, e3.forwardRef)(function(e, t) {
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
                return e5().createElement(void 0 === i ? "ul" : i, tT({
                    ref: t,
                    className: e6("foundation-web-list", n)
                }, o), r)
            });
            tk.displayName = "List";
            var tM = "height-full min-width-0 grow-1 gap-x-large radius-medium !bg-surface-100 stroke-standard stroke-default padding-medium box-border flex items-center",
                t_ = function(e) {
                    var t = e.expandedPrimary,
                        r = e.expandedSecondary,
                        n = e.iconName,
                        i = e.onTileClick,
                        o = e.primary,
                        a = e.secondary,
                        s = (0, S.jsxs)(e3.Fragment, {
                            children: [(0, S.jsx)("div", {
                                className: "flex shrink-0 items-center justify-center",
                                children: (0, S.jsx)(e7, {
                                    name: n,
                                    size: "Large"
                                })
                            }), (0, S.jsxs)("div", {
                                className: "min-width-0 grow-1 gap-xsmall flex flex-col justify-center",
                                children: [(0, S.jsx)("div", {
                                    className: "text-title-medium content-emphasis text-align-x-start",
                                    children: o
                                }), (0, S.jsx)("div", {
                                    className: "text-body-medium content-default text-align-x-start",
                                    children: a
                                })]
                            })]
                        });
                    return (0, S.jsx)("li", {
                        className: "min-width-0 height-full flex list-none flex-col [list-style:none]",
                        children: null != i ? (0, S.jsx)("button", {
                            "aria-label": o,
                            className: "".concat(tM, " width-full text-align-x-start cursor-pointer font-[inherit]"),
                            type: "button",
                            onClick: function() {
                                i(t, r)
                            },
                            children: s
                        }) : (0, S.jsx)("div", {
                            className: tM,
                            children: s
                        })
                    })
                },
                tU = function(e) {
                    var t = e.featureConfig,
                        r = e.periodType,
                        n = e.overrideIconName,
                        i = e.onTileClick,
                        o = (0, P.useTranslation)(),
                        a = o.translate,
                        s = o.intl,
                        l = (0, e3.useMemo)(function() {
                            var e;
                            return null == (e = t.virtualTransactionDiscounts) ? void 0 : e.find(function(e) {
                                return 0 === e.periodIndex
                            })
                        }, [t]),
                        c = (0, e3.useMemo)(function() {
                            var e;
                            return null == (e = t.virtualTransactionDiscounts) ? void 0 : e.filter(function(e) {
                                return e.periodIndex > 0
                            }).reduce(function(e, t) {
                                return null === e || t.periodIndex < e.periodIndex ? t : e
                            }, null)
                        }, [t]),
                        u = (0, e3.useMemo)(function() {
                            var e;
                            return null == (e = t.privateServerDiscounts) ? void 0 : e.find(function(e) {
                                return 0 === e.periodIndex
                            })
                        }, [t]);
                    return (0, S.jsxs)(tk, {
                        className: "width-full large:[grid-template-columns:repeat(2,minmax(0,1fr))] grid gap-x-[12px] gap-y-[12px] [grid-template-columns:minmax(0,1fr)]",
                        children: [l && (0, S.jsx)(t_, {
                            expandedPrimary: a("Description.Benefit.DiscountBaseExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.DiscountBaseExpandedBody"),
                            iconName: null != n ? n : "icon-regular-tag",
                            primary: a("Description.Benefit.DiscountBase", {
                                discountPercent: s.n(.01 * l.discountPercent, {
                                    style: "percent"
                                })
                            }),
                            secondary: a("Description.Benefit.DiscountBaseSubtitle"),
                            onTileClick: i
                        }), c && (0, S.jsx)(t_, {
                            expandedPrimary: a("Description.Benefit.DiscountNextExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.DiscountNextExpandedBody"),
                            iconName: null != n ? n : "icon-regular-tag-arrow-up",
                            primary: a("Description.Benefit.DiscountNext", {
                                productName: a("Label.Blackbird"),
                                discountPercent: s.n(.01 * c.discountPercent, {
                                    style: "percent"
                                }),
                                discountPeriodCount: s.n(c.periodIndex),
                                discountPeriodUnit: r
                            }),
                            secondary: a("Description.Benefit.DiscountNextSubtitle"),
                            onTileClick: i
                        }), u && (0, S.jsx)(t_, {
                            expandedPrimary: a("Description.Benefit.PrivateServersExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.PrivateServersExpandedBody"),
                            iconName: null != n ? n : "icon-regular-controller",
                            primary: a("Description.Benefit.PrivateServers", {
                                discountPercent: s.n(.01 * u.discountPercent, {
                                    style: "percent"
                                })
                            }),
                            secondary: a("Description.Benefit.PrivateServersSubtitle"),
                            onTileClick: i
                        }), t.isRobuxTransferEnabled && (0, S.jsx)(t_, {
                            expandedPrimary: a("Description.Benefit.RobuxTransfersExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.RobuxTransfersExpandedBody"),
                            iconName: null != n ? n : "icon-regular-robux",
                            primary: a("Description.Benefit.RobuxTransfers"),
                            secondary: a("Description.Benefit.RobuxTransfersSubtitle"),
                            onTileClick: i
                        }), t.isTradingEnabled && (0, S.jsx)(t_, {
                            expandedPrimary: a("Description.Benefit.TradeResellItemsExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.TradeResellItemsExpandedBody"),
                            iconName: null != n ? n : "icon-regular-hand-two-arrows-horizontal",
                            primary: a("Description.Benefit.TradeResellItems"),
                            secondary: a("Description.Benefit.TradeResellItemsSubtitle"),
                            onTileClick: i
                        }), t.isUgcPublishingEnabled && (0, S.jsx)(t_, {
                            expandedPrimary: a("Description.Benefit.PublishItemsExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.PublishItemsExpandedBody"),
                            iconName: null != n ? n : "icon-regular-arrow-up-from-landscape-rectangle",
                            primary: a("Description.Benefit.PublishItems"),
                            secondary: a("Description.Benefit.PublishItemsSubtitle"),
                            onTileClick: i
                        })]
                    })
                },
                tL = function(e) {
                    var t = e.children;
                    return (0, S.jsx)("div", {
                        children: t
                    })
                },
                tB = function() {
                    return (0, S.jsx)("div", {
                        className: "backdrop-texture width-full height-[210px] pointer-events-none absolute"
                    })
                },
                tF = function() {
                    return (0, S.jsx)("div", {
                        className: "stroke-default stroke-standard self-stretch"
                    })
                };

            function tG(e) {
                var t = e.productTypeDetails.robloxSubscriptionProductDetails;
                if (!(null == t ? void 0 : t.featureConfig)) throw Error("featureConfig is missing on robloxSubscriptionProductDetails");
                return t.featureConfig
            }

            function tz(e) {
                var t, r = e.productTypeDetails.robloxSubscriptionProductDetails,
                    n = null == r ? void 0 : r.featureConfig.currencySubscriptionConfig;
                return Math.floor((null != (t = null == n ? void 0 : n.entitledAmountMicros) ? t : 0) / 1e6)
            }

            function tq(e) {
                return e.eligibleOffers.find(function(e) {
                    return "FreeTrial" === e.offerType
                })
            }
            var tV = function(e) {
                    var t = e.robloxSubscriptionProduct,
                        r = e.onDismiss,
                        n = (0, P.useTranslation)().translate,
                        i = (0, S.jsx)(tE, {
                            className: "width-full",
                            size: "Large",
                            variant: "Emphasis",
                            onClick: r,
                            children: n("Action.OK")
                        }),
                        o = (0, S.jsxs)("p", {
                            className: "text-body-small content-muted text-center",
                            children: [n("Description.FeatureAccessDisclaimer"), " ", (0, S.jsx)("a", {
                                className: "text-link",
                                href: "https://help.roblox.com/hc/articles/39143693116052-Understanding-Age-Checks-on-Roblox",
                                children: n("Action.ViewDetails")
                            })]
                        });
                    return (0, S.jsxs)(e3.Fragment, {
                        children: [(0, S.jsx)(tB, {}), (0, S.jsx)("div", {
                            className: "flex flex-col items-center",
                            children: (0, S.jsxs)("div", {
                                className: "padding-x-xlarge content-emphasis gap-y-xxlarge width-full large:max-width-[730px] flex flex-col",
                                children: [(0, S.jsxs)("div", {
                                    className: "gap-y-small large:items-center flex flex-col items-start",
                                    children: [(0, S.jsxs)("div", {
                                        className: "gap-x-small flex items-center",
                                        children: [(0, S.jsx)(e7, {
                                            className: "!size-600",
                                            name: "icon-regular-roblox-plus"
                                        }), (0, S.jsx)("h1", {
                                            className: "text-heading-medium",
                                            children: n("Title.FreeTrialConfirmation")
                                        })]
                                    }), (0, S.jsx)("p", {
                                        className: "text-body-large content-default",
                                        children: n("Description.FreeTrialConfirmation")
                                    })]
                                }), (0, S.jsx)(tU, {
                                    featureConfig: tG(t),
                                    periodType: t.periodType
                                }), (0, S.jsx)(tL, {
                                    children: (0, S.jsxs)("div", {
                                        className: "large:flex large:flex-col large:items-center width-full gap-y-medium hidden",
                                        "data-testid": "free-trial-action-inline",
                                        children: [i, o]
                                    })
                                })]
                            })
                        }), (0, S.jsxs)("div", {
                            "aria-label": n("Action.OK"),
                            className: "bottom-dock padding-t-medium bg-surface-100 large:!hidden width-full gap-y-medium flex flex-col",
                            "data-testid": "free-trial-action-dock",
                            role: "region",
                            children: [(0, S.jsx)(tF, {}), (0, S.jsxs)("div", {
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
                tK = e5().forwardRef(function(e, t) {
                    var r = e.className,
                        n = e.size,
                        i = void 0 === n ? "Large" : n,
                        o = e.variant,
                        a = e.value,
                        s = e.showValue,
                        l = void 0 !== s && s,
                        c = e.ariaLabel,
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
                        h = (f - p) / 2,
                        v = 2 * Math.PI * h,
                        b = f / 2,
                        g = Math.min(100, Math.max(0, void 0 === a ? 0 : a)),
                        x = l && void 0 !== y ? y : f,
                        w = "Determinate" === (void 0 === o ? "Determinate" : o);
                    return e5().createElement("div", function(e) {
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
                        className: e6("foundation-web-progress-circle inline-flex items-center justify-center", r),
                        role: "progressbar",
                        "aria-label": c,
                        "aria-valuemin": w ? 0 : void 0,
                        "aria-valuemax": w ? 100 : void 0,
                        "aria-valuenow": w ? g : void 0,
                        style: {
                            width: x,
                            height: x
                        }
                    }, u), e5().createElement("svg", {
                        width: f,
                        height: f,
                        viewBox: "0 0 ".concat(f, " ").concat(f),
                        className: "relative"
                    }, e5().createElement("circle", {
                        cx: b,
                        cy: b,
                        r: h,
                        fill: "none",
                        strokeWidth: p,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), e5().createElement("circle", {
                        cx: b,
                        cy: b,
                        r: h,
                        fill: "none",
                        strokeWidth: p,
                        strokeDasharray: w ? v : "".concat(.75 * v, " ").concat(.25 * v),
                        strokeDashoffset: w ? v * (1 - g / 100) : 0,
                        strokeLinecap: "round",
                        className: e6(!w && "foundation-web-progress-circle-indeterminate"),
                        style: w ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), w && l && "Large" === i && e5().createElement("div", {
                        className: e6("absolute content-emphasis flex items-center justify-center", m),
                        "aria-hidden": "true"
                    }, e5().createElement("span", null, Math.round(g)), e5().createElement("span", null, "%")))
                });
            tK.displayName = "ProgressCircle";
            var tH = function() {
                    var e = (0, P.useTranslation)().translate;
                    return (0, S.jsx)("div", {
                        className: "margin-top-[240px] flex flex-col items-center",
                        children: (0, S.jsx)(tK, {
                            ariaLabel: e("Label.Loading"),
                            size: "Medium",
                            variant: "Indeterminate"
                        })
                    })
                },
                tX = window.CoreRobloxUtilities,
                tY = window.Roblox,
                t$ = window.Roblox["core-scripts"].localStorage.localStorage,
                tJ = r.n(t$),
                tQ = window.CoreUtilities,
                tZ = window.Roblox["core-scripts"].paymentsFlow,
                t0 = r.n(tZ),
                t1 = window.EventTracker;

            function t2(e, t, r, n, i, o, a) {
                try {
                    var s = e[o](a),
                        l = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(n, i)
            }

            function t4(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var t3 = ((a = {}).GET = "GET", a.POST = "POST", a),
                t5 = ((s = {}).PAYMENT = "Payment", s.ROBUX = "Robux", s.ROBUX_GIFTING = "RobuxGifting", s.ROBUX_REDESIGN = "RobuxRedesign", s),
                t6 = ((l = {}).VERIFY_PHONE_VERIFICATION_SESSION = "VerifyPhoneVerificationSession", l.LANDING_PAGE_METADATA = "GetLandingPageMetadata", l.GET_USER_NAME = "GetUserName", l.PREPARE_PAYMENT = "PreparePayment", l.GET_METADATA = "GetMetadata", l.GET_PRODUCTS = "GetProducts", l.GET_PAYMENT_METHODS_INFO = "GetPaymentMethodsInfo", l.GET_PURCHASE_WARNING = "GetPurchaseWarning", l.GET_USER_PURCHASE_ELIGIBILITY = "GetUserPurchaseEligibility", l.CREATE_PAYMENT_SESSION = "CreatePaymentSession", l.GET_PAYMENT_SESSION = "GetPaymentSession", l.GET_PAYMENT_SESSION_BY_CHECKOUT_SESSION_ID = "GetPaymentSessionByCheckoutSessionId", l.CREATE_BONUS_SESSION = "CreateBonusSession", l.GET_BONUS_SESSION_BY_CHECKOUT_SESSION_ID = "GetBonusSessionByCheckoutSessionId", l.GET_DISPLAYABLE_BONUS_FOR_PRODUCT = "GetDisplayableBonusForProduct", l.GET_THUMBNAILS = "GetThumbnails", l.HANDLE_GAME_PASS_JOIN_EVENT = "HandleGamePassJoinEvent", l.GET_ROBUX_BALANCE = "GetRobuxBalance", l.GET_AUTH_TICKET = "GetAuthTicket", l.GET_CLIENT_ASSERTION = "GetClientAssertion", l),
                t8 = function(e, t, r) {
                    return new Promise(function(n) {
                        (0, t1.fireEvent)("API_COUNTER_".concat(e, "_").concat(t, "_").concat(r || "Throughput")), n()
                    })
                },
                t7 = function(e, t, r) {
                    return new Promise(function(n) {
                        (0, t1.fireEvent)("ERROR_COUNTER_".concat(e, "_").concat(t, "_").concat(r || "UnknownAxiosError")), n()
                    })
                };

            function t9(e, t, r, n, i) {
                var o;
                return (o = function(e, t, r, n, i) {
                    var o, a, s, l, c, u, d;
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
                        return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                            return this
                        }), a;

                        function s(s) {
                            return function(l) {
                                var c = [s, l];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; a && (a = 0, c[0] && (o = 0)), o;) try {
                                    if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                                    switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                        case 0:
                                        case 1:
                                            i = c;
                                            break;
                                        case 4:
                                            return o.label++, {
                                                value: c[1],
                                                done: !1
                                            };
                                        case 5:
                                            o.label++, n = c[1], c = [0];
                                            continue;
                                        case 7:
                                            c = o.ops.pop(), o.trys.pop();
                                            continue;
                                        default:
                                            if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                o = 0;
                                                continue
                                            }
                                            if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                                o.label = c[1];
                                                break
                                            }
                                            if (6 === c[0] && o.label < i[1]) {
                                                o.label = i[1], i = c;
                                                break
                                            }
                                            if (i && o.label < i[2]) {
                                                o.label = i[2], o.ops.push(c);
                                                break
                                            }
                                            i[2] && o.ops.pop(), o.trys.pop();
                                            continue
                                    }
                                    c = t.call(e, o)
                                } catch (e) {
                                    c = [6, e], n = 0
                                } finally {
                                    r = i = 0
                                }
                                if (5 & c[0]) throw c[1];
                                return {
                                    value: c[0] ? c[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(f) {
                        switch (f.label) {
                            case 0:
                                o = r.feature, a = r.call, t8(o, a), f.label = 1;
                            case 1:
                                return f.trys.push([1, 3, , 4]), [4, "GET" === e ? tQ.httpService.get(t, n) : tQ.httpService.post(t, n)];
                            case 2:
                                return l = (s = f.sent()).data, c = s.headers, t8(o, a, 200), [2, (null == i ? void 0 : i(l, c)) || l];
                            case 3:
                                var p, m, y;
                                return (void 0 === (p = u = f.sent()) ? "undefined" : t4(p)) === "object" && "status" in p ? t7(o, a, u.status) : (void 0 === u ? "undefined" : t4(u)) === "object" && "config" in u ? t7(o, a, null == (d = u.response) ? void 0 : d.status) : (console.error(u), m = o, y = a, new Promise(function(e) {
                                    (0, t1.fireEvent)("ERROR_COUNTER_".concat(m, "_").concat(y, "_NonAxiosError")), e()
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
                            t2(i, r, n, a, s, "next", e)
                        }

                        function s(e) {
                            t2(i, r, n, a, s, "throw", e)
                        }
                        a(void 0)
                    })
                }).apply(this, arguments)
            }

            function re(e, t, r, n, i, o, a) {
                try {
                    var s = e[o](a),
                        l = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(n, i)
            }

            function rt(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var o = e.apply(t, r);

                        function a(e) {
                            re(o, n, i, a, s, "next", e)
                        }

                        function s(e) {
                            re(o, n, i, a, s, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function rr(e, t) {
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
                return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function s(s) {
                    return function(l) {
                        var c = [s, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, c[0] && (o = 0)), o;) try {
                            if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                            switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                case 0:
                                case 1:
                                    i = c;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                        o.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && o.label < i[1]) {
                                        o.label = i[1], i = c;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(c);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            c = t.call(e, o)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function rn(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ri(e, t, r, n, i, o, a) {
                try {
                    var s = e[o](a),
                        l = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(n, i)
            }

            function ro(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rn(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rn(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ra = "paymentSession-".concat((null === tY.CurrentUser || void 0 === tY.CurrentUser ? void 0 : tY.CurrentUser.userId) || "loggedout");

            function rs(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rl(e) {
                return function(e) {
                    if (Array.isArray(e)) return rs(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rs(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rs(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rc = "__FN_nvfToKPAOuiV__",
                ru = new RegExp("".concat(rc, "(\\d+)\\|")),
                rd = function(e, t, r, n) {
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
                            n = "".concat(rc).concat(r, "|"),
                            a = "".concat("__FN_END_nvfToKPAOuiV__").concat(r, "|");
                        i[e.opening] = n, i[e.closing] = a, o[r] = {
                            start: n,
                            end: a,
                            render: e.render,
                            used: !1
                        }
                    });
                    var a = e(t, i),
                        s = function(e) {
                            var r = [],
                                n = ru.exec(e);
                            if (!n) return [e];
                            n.index > 0 && r.push(e.slice(0, n.index));
                            var i = n[1] && o[n[1]];
                            if (!i) return console.warn("Unexpected malformed segment", t), [];
                            i.used = !0;
                            var a = e.indexOf(i.end);
                            if (-1 === a) return console.warn("Unexpected malformed segment", t), [];
                            var l = e.slice(n.index + n[0].length, a),
                                c = i.render(s(l));
                            Array.isArray(c) ? r.push.apply(r, rl(c)) : r.push(c);
                            var u = e.slice(a + i.end.length);
                            return u.length > 0 && r.push.apply(r, rl(s(u))), r
                        },
                        l = s(a).filter(function(e) {
                            return "" !== e
                        });
                    return Object.values(o).some(function(e) {
                        return !e.used
                    }) ? (console.warn("Unused segments found", t), []) : l.map(function(e, t) {
                        return (0, S.jsx)(e3.Fragment, {
                            children: e
                        }, t)
                    })
                };

            function rf(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var rp = function(e) {
                    var t, r = e.productType,
                        n = e.productId,
                        i = e.deviceMeta,
                        o = e.variant,
                        a = e.size,
                        s = e.className,
                        l = e.isDisabled,
                        c = void 0 !== l && l,
                        u = e.redirectUrl,
                        d = e.paymentSessionId,
                        f = e.onSubscribeClick,
                        p = e.onMobilePurchaseInitiated,
                        m = e.isLoading,
                        y = e.children,
                        h = e.trackSubscriptionButtonClick,
                        v = e.loadingStateDisabled,
                        b = (t = (0, e3.useState)(!1), function(e) {
                            if (Array.isArray(e)) return e
                        }(t) || function(e, t) {
                            var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != i) {
                                var o = [],
                                    a = !0,
                                    s = !1;
                                try {
                                    for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), o.length !== t); a = !0);
                                } catch (e) {
                                    s = !0, n = e
                                } finally {
                                    try {
                                        a || null == i.return || i.return()
                                    } finally {
                                        if (s) throw n
                                    }
                                }
                                return o
                            }
                        }(t, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return rf(e, 2);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rf(e, t)
                            }
                        }(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        g = b[0],
                        x = b[1],
                        w = i.isAndroidApp || i.isIosApp,
                        P = r === eY ? "RobloxPlus" : r,
                        O = (0, e3.useMemo)(function() {
                            var e = new URL(w ? "/mobile-app-upgrades/buy" : "/upgrades/paymentmethods", window.location.origin);
                            return e.searchParams.append("ctx", "subscription"), e.searchParams.append("type", P), e.searchParams.append("id", n), d && e.searchParams.append("paymentSessionId", d), !w && u && e.searchParams.append("redirectUrl", u), e.toString()
                        }, [w, P, n, d, u]),
                        I = (0, e3.useCallback)(function() {
                            if (!c) {
                                if (null == h || h(), u && function(e) {
                                        try {
                                            var t = JSON.stringify({
                                                url: e,
                                                ts: Date.now()
                                            });
                                            sessionStorage.setItem(e4, t)
                                        } catch (e) {}
                                    }(u), null == f || f(), w) {
                                    null == p || p();
                                    return
                                }
                                x(!0)
                            }
                        }, [c, h, u, f, w, p]);
                    return (0, S.jsx)(tE, {
                        as: "a",
                        className: s,
                        href: O,
                        isDisabled: c,
                        isLoading: void 0 !== v && v ? void 0 : null != m ? m : g,
                        size: a,
                        variant: void 0 === o ? "Emphasis" : o,
                        onClick: I,
                        children: y
                    })
                },
                rm = function(e) {
                    var t = e.title,
                        r = e.body,
                        n = e.equipText,
                        i = e.onEquip,
                        o = e.onItemDetailsClick,
                        a = null != o;
                    return (0, S.jsxs)("div", {
                        "aria-label": a ? t : void 0,
                        className: "bg-shift-200 radius-medium padding-medium gap-medium width-full flex items-center ".concat(a ? "hover:bg-surface-100 cursor-pointer" : ""),
                        role: a ? "button" : void 0,
                        tabIndex: a ? 0 : void 0,
                        onClick: o,
                        onKeyDown: a ? function(e) {
                            e.target === e.currentTarget && ("Enter" === e.key || " " === e.key) && (e.preventDefault(), null == o || o())
                        } : void 0,
                        children: [(0, S.jsx)("div", {
                            className: "radius-medium size-[50px] shrink-0 overflow-hidden",
                            children: (0, S.jsx)("img", {
                                alt: t,
                                className: "size-full object-cover",
                                src: "https://images.rbxcdn.com/edf7aeadb32b5c26.png"
                            })
                        }), (0, S.jsxs)("div", {
                            className: "min-width-0 grow-1 shrink-1 flex basis-0 flex-col justify-center",
                            children: [(0, S.jsx)("span", {
                                className: "text-title-medium content-emphasis",
                                children: t
                            }), (0, S.jsx)("span", {
                                className: "text-body-medium content-default",
                                children: r
                            })]
                        }), null != n && null != i && (0, S.jsx)(tE, {
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
                ry = function(e) {
                    var t = e.size,
                        r = e.variant,
                        n = (0, (0, P.useTranslation)().translate)("Label.Blackbird");
                    return "compact" === (void 0 === r ? "default" : r) ? (0, S.jsxs)("div", {
                        className: "gap-x-xxsmall flex items-center",
                        children: [(0, S.jsx)(e7, {
                            className: "relative",
                            name: "icon-regular-roblox-plus",
                            size: "Large",
                            style: {
                                top: -1
                            }
                        }), (0, S.jsx)("span", {
                            className: "text-label-large content-emphasis text-no-wrap",
                            children: n
                        })]
                    }) : (0, S.jsxs)("div", {
                        className: "gap-x-small flex items-center",
                        children: [(0, S.jsx)(e7, {
                            className: "!size-1000 relative",
                            name: "icon-regular-roblox-plus",
                            style: {
                                top: -4
                            }
                        }), "large" === (void 0 === t ? "large" : t) ? (0, S.jsx)("h1", {
                            className: "font-builder-extended text-display-small text-no-wrap",
                            children: n
                        }) : (0, S.jsx)("h2", {
                            className: "text-heading-large",
                            children: n
                        })]
                    })
                },
                rh = window.Roblox["core-scripts"].format.string,
                rv = function(e, t) {
                    var r = (0, P.useTranslation)().intl;
                    return (0, e3.useMemo)(function() {
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
                        o = (0, P.useTranslation)().translate,
                        a = rv(n),
                        s = o("Description.BillingInfo", {
                            price: "<span class='text-heading-medium'>".concat((0, rh.escapeHtml)(a), "</span>"),
                            periodType: i
                        }),
                        l = o("Description.BillingInfoWithFreeTrialOffer", {
                            boldTagStart: "<b>",
                            boldTagEnd: "</b>",
                            trialPeriod: 1,
                            trialPeriodType: i,
                            price: (0, rh.escapeHtml)(a),
                            periodType: i
                        }),
                        c = null != (t = null == r ? void 0 : r.some(function(e) {
                            return "FreeTrial" === e.offerType
                        })) && t;
                    return (0, S.jsx)("span", {
                        dangerouslySetInnerHTML: {
                            __html: c ? l : s
                        },
                        className: "text-body-large"
                    })
                },
                rg = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                rx = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                rw = function(e) {
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
                    return e5().createElement("button", function(e) {
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
                        className: e6("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", e9, rx[t], rg[r], n && "radius-circle", i)
                    }, o), e5().createElement(te, null), e5().createElement(e7, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function rS(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    i = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === i || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function rP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rO(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function rI(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        rO(e, t, r[t])
                    })
                }
                return e
            }

            function rE(e, t) {
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

            function rj(e) {
                return function(e) {
                    if (Array.isArray(e)) return rP(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rP(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rP(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rT() {
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
                            return rI({}, e, n(t)["__scope".concat(i)])
                        }, {});
                        return e3.useMemo(function() {
                            return rO({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return i.scopeName = n.scopeName, i
            }
            var rN = (null == (x = globalThis) ? void 0 : x.document) ? e3.useLayoutEffect : function() {};

            function rC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var rD = e3[" useId ".trim().toString()] || function() {},
                rA = 0;

            function rR(e) {
                var t, r = (t = e3.useState(rD()), function(e) {
                        if (Array.isArray(e)) return e
                    }(t) || function(e, t) {
                        var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != i) {
                            var o = [],
                                a = !0,
                                s = !1;
                            try {
                                for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), o.length !== t); a = !0);
                            } catch (e) {
                                s = !0, n = e
                            } finally {
                                try {
                                    a || null == i.return || i.return()
                                } finally {
                                    if (s) throw n
                                }
                            }
                            return o
                        }
                    }(t, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return rC(e, 2);
                            var r = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rC(e, t)
                        }
                    }(t, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    n = r[0],
                    i = r[1];
                return rN(function() {
                    e || i(function(e) {
                        return null != e ? e : String(rA++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function rk(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rM(e) {
                var t = e3.useRef(e);
                return e3.useEffect(function() {
                    t.current = e
                }), e3.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), i = 0; i < r; i++) n[i] = arguments[i];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return rk(e)
                        }(n) || function(e) {
                            if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return rk(e, void 0);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rk(e, t)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function r_(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rU(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return r_(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return r_(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rL = window.RadixUI["react-dismissable-layer"],
                rB = window.ReactDOM,
                rF = r.n(rB);

            function rG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rz(e) {
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

            function rq(e, t) {
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

            function rV(e, t) {
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
                    if (Array.isArray(e)) return rG(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rG(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rG(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rK(e) {
                var t, r, n = (t = e, (r = e3.forwardRef(function(e, t) {
                        var r = e.children,
                            n = rV(e, ["children"]);
                        if (e3.isValidElement(r)) {
                            var i, o, a, s, l, c = (l = (s = null == (o = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in s && s.isReactWarning) ? i.ref : (l = (s = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in s && s.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                                u = function(e, t) {
                                    var r = rz({}, t);
                                    for (var n in t) ! function(n) {
                                        var i = e[n],
                                            o = t[n];
                                        /^on[A-Z]/.test(n) ? i && o ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            o.apply(void 0, rW(t)), i.apply(void 0, rW(t))
                                        } : i && (r[n] = i) : "style" === n ? r[n] = rz({}, i, o) : "className" === n && (r[n] = [i, o].filter(Boolean).join(" "))
                                    }(n);
                                    return rz({}, e, r)
                                }(n, r.props);
                            return r.type !== e3.Fragment && (u.ref = t ? to(t, c) : c), e3.cloneElement(r, u)
                        }
                        return e3.Children.count(r) > 1 ? e3.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    i = e3.forwardRef(function(e, t) {
                        var r = e.children,
                            i = rV(e, ["children"]),
                            o = e3.Children.toArray(r),
                            a = o.find(rX);
                        if (a) {
                            var s = a.props.children,
                                l = o.map(function(e) {
                                    return e !== a ? e : e3.Children.count(s) > 1 ? e3.Children.only(null) : e3.isValidElement(s) ? s.props.children : null
                                });
                            return (0, S.jsx)(n, rq(rz({}, i), {
                                ref: t,
                                children: e3.isValidElement(s) ? e3.cloneElement(s, void 0, l) : null
                            }))
                        }
                        return (0, S.jsx)(n, rq(rz({}, i), {
                            ref: t,
                            children: r
                        }))
                    });
                return i.displayName = "".concat(e, ".Slot"), i
            }
            var rH = Symbol("radix.slottable");

            function rX(e) {
                return e3.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === rH
            }

            function rY(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function r$(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        rY(e, t, r[t])
                    })
                }
                return e
            }

            function rJ(e, t) {
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
            var rQ = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                var r = rK("Primitive.".concat(t)),
                    n = e3.forwardRef(function(e, n) {
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
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, S.jsx)(a, rJ(r$({}, o), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), rJ(r$({}, e), rY({}, t, n))
            }, {});

            function rZ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function r0(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || r1(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function r1(e, t) {
                if (e) {
                    if ("string" == typeof e) return rZ(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rZ(e, t)
                }
            }
            var r2 = "focusScope.autoFocusOnMount",
                r4 = "focusScope.autoFocusOnUnmount",
                r3 = {
                    bubbles: !1,
                    cancelable: !0
                },
                r5 = e3.forwardRef(function(e, t) {
                    var r, n, i = e.loop,
                        o = void 0 !== i && i,
                        a = e.trapped,
                        s = void 0 !== a && a,
                        l = e.onMountAutoFocus,
                        c = e.onUnmountAutoFocus,
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
                        d = r0(e3.useState(null), 2),
                        f = d[0],
                        p = d[1],
                        m = rM(l),
                        y = rM(c),
                        h = e3.useRef(null),
                        v = ta(t, function(e) {
                            return p(e)
                        }),
                        b = e3.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    e3.useEffect(function() {
                        if (s) {
                            var e = function(e) {
                                    if (!b.paused && f) {
                                        var t = e.target;
                                        f.contains(t) ? h.current = t : r7(h.current, {
                                            select: !0
                                        })
                                    }
                                },
                                t = function(e) {
                                    if (!b.paused && f) {
                                        var t = e.relatedTarget;
                                        null !== t && (f.contains(t) || r7(h.current, {
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
                                        for (var i, o = e[Symbol.iterator](); !(t = (i = o.next()).done); t = !0) i.value.removedNodes.length > 0 && r7(f)
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
                    }, [s, f, b.paused]), e3.useEffect(function() {
                        if (f) {
                            r9.add(b);
                            var e = document.activeElement;
                            if (!f.contains(e)) {
                                var t = new CustomEvent(r2, r3);
                                f.addEventListener(r2, m), f.dispatchEvent(t), t.defaultPrevented || (function(e) {
                                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                        r = t.select,
                                        n = void 0 !== r && r,
                                        i = document.activeElement,
                                        o = !0,
                                        a = !1,
                                        s = void 0;
                                    try {
                                        for (var l, c = e[Symbol.iterator](); !(o = (l = c.next()).done); o = !0) {
                                            var u = l.value;
                                            if (r7(u, {
                                                    select: n
                                                }), document.activeElement !== i) return
                                        }
                                    } catch (e) {
                                        a = !0, s = e
                                    } finally {
                                        try {
                                            o || null == c.return || c.return()
                                        } finally {
                                            if (a) throw s
                                        }
                                    }
                                }(r6(f).filter(function(e) {
                                    return "A" !== e.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === e && r7(f))
                            }
                            return function() {
                                f.removeEventListener(r2, m), setTimeout(function() {
                                    var t = new CustomEvent(r4, r3);
                                    f.addEventListener(r4, y), f.dispatchEvent(t), t.defaultPrevented || r7(null != e ? e : document.body, {
                                        select: !0
                                    }), f.removeEventListener(r4, y), r9.remove(b)
                                }, 0)
                            }
                        }
                    }, [f, m, y, b]);
                    var g = e3.useCallback(function(e) {
                        if ((o || s) && !b.paused) {
                            var t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                                r = document.activeElement;
                            if (t && r) {
                                var n, i, a = e.currentTarget,
                                    l = r0([r8(i = r6(n = a), n), r8(i.reverse(), n)], 2),
                                    c = l[0],
                                    u = l[1];
                                c && u ? e.shiftKey || r !== u ? e.shiftKey && r === c && (e.preventDefault(), o && r7(u, {
                                    select: !0
                                })) : (e.preventDefault(), o && r7(c, {
                                    select: !0
                                })) : r === a && e.preventDefault()
                            }
                        }
                    }, [o, s, b.paused]);
                    return (0, S.jsx)(rQ.div, (r = function(e) {
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
                        ref: v,
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

            function r6(e) {
                for (var t = [], r = document.createTreeWalker(e, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(e) {
                            var t = "INPUT" === e.tagName && "hidden" === e.type;
                            return e.disabled || e.hidden || t ? NodeFilter.FILTER_SKIP : e.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); r.nextNode();) t.push(r.currentNode);
                return t
            }

            function r8(e, t) {
                var r = !0,
                    n = !1,
                    i = void 0;
                try {
                    for (var o, a = e[Symbol.iterator](); !(r = (o = a.next()).done); r = !0) {
                        var s = o.value;
                        if (! function(e, t) {
                                var r = t.upTo;
                                if ("hidden" === getComputedStyle(e).visibility) return !0;
                                for (; e && (void 0 === r || e !== r);) {
                                    if ("none" === getComputedStyle(e).display) return !0;
                                    e = e.parentElement
                                }
                                return !1
                            }(s, {
                                upTo: t
                            })) return s
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

            function r7(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = t.select;
                if (e && e.focus) {
                    var n, i, o, a = document.activeElement;
                    e.focus({
                        preventScroll: !0
                    }), e !== a && (i = n = e, null != (o = HTMLInputElement) && "undefined" != typeof Symbol && o[Symbol.hasInstance] ? !!o[Symbol.hasInstance](i) : i instanceof o) && "select" in n && void 0 !== r && r && e.select()
                }
            }
            r5.displayName = "FocusScope";
            var r9 = (t = [], {
                add: function(e) {
                    var r = t[0];
                    e !== r && (null == r || r.pause()), (t = ne(t, e)).unshift(e)
                },
                remove: function(e) {
                    var r;
                    null == (r = (t = ne(t, e))[0]) || r.resume()
                }
            });

            function ne(e, t) {
                var r = function(e) {
                        if (Array.isArray(e)) return rZ(e)
                    }(e) || function(e) {
                        if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(e) || r1(e) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r.indexOf(t);
                return -1 !== n && r.splice(n, 1), r
            }

            function nt(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var nr = e3.forwardRef(function(e, t) {
                var r, n, i, o, a, s = e.container,
                    l = function(e, t) {
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
                    c = (r = e3.useState(!1), function(e) {
                        if (Array.isArray(e)) return e
                    }(r) || function(e, t) {
                        var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != i) {
                            var o = [],
                                a = !0,
                                s = !1;
                            try {
                                for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), o.length !== t); a = !0);
                            } catch (e) {
                                s = !0, n = e
                            } finally {
                                try {
                                    a || null == i.return || i.return()
                                } finally {
                                    if (s) throw n
                                }
                            }
                            return o
                        }
                    }(r, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return nt(e, 2);
                            var r = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nt(e, t)
                        }
                    }(r, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    u = c[0],
                    d = c[1];
                rN(function() {
                    return d(!0)
                }, []);
                var f = s || u && (null == (a = globalThis) || null == (o = a.document) ? void 0 : o.body);
                return f ? rF().createPortal((0, S.jsx)(rQ.div, (n = function(e) {
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
                }({}, l), i = i = {
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

            function nn(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ni(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return nn(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nn(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            nr.displayName = "Portal";
            var no = function(e) {
                var t, r, n, i, o, a, s, l, c, u, d, f, p, m, y, h, v, b = e.present,
                    g = e.children,
                    x = (t = b, o = (i = ni(e3.useState(), 2))[0], a = i[1], s = e3.useRef({}), l = e3.useRef(t), c = e3.useRef("none"), d = (u = ni((r = t ? "mounted" : "unmounted", n = {
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
                    }, e3.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], f = u[1], e3.useEffect(function() {
                        var e = na(s.current);
                        c.current = "mounted" === d ? e : "none"
                    }, [d]), rN(function() {
                        var e = s.current,
                            r = l.current;
                        if (r !== t) {
                            var n = c.current,
                                i = na(e);
                            t ? f("MOUNT") : "none" === i || (null == e ? void 0 : e.display) === "none" ? f("UNMOUNT") : r && n !== i ? f("ANIMATION_OUT") : f("UNMOUNT"), l.current = t
                        }
                    }, [t, f]), rN(function() {
                        if (o) {
                            var e, t, r = null != (t = o.ownerDocument.defaultView) ? t : window,
                                n = function(t) {
                                    var n = na(s.current).includes(t.animationName);
                                    if (t.target === o && n && (f("ANIMATION_END"), !l.current)) {
                                        var i = o.style.animationFillMode;
                                        o.style.animationFillMode = "forwards", e = r.setTimeout(function() {
                                            "forwards" === o.style.animationFillMode && (o.style.animationFillMode = i)
                                        })
                                    }
                                },
                                i = function(e) {
                                    e.target === o && (c.current = na(s.current))
                                };
                            return o.addEventListener("animationstart", i), o.addEventListener("animationcancel", n), o.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(e), o.removeEventListener("animationstart", i), o.removeEventListener("animationcancel", n), o.removeEventListener("animationend", n)
                                }
                        }
                        f("ANIMATION_END")
                    }, [o, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: e3.useCallback(function(e) {
                            e && (s.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    w = "function" == typeof g ? g({
                        present: x.isPresent
                    }) : e3.Children.only(g),
                    S = ta(x.ref, (v = (h = null == (m = Object.getOwnPropertyDescriptor((p = w).props, "ref")) ? void 0 : m.get) && "isReactWarning" in h && h.isReactWarning) ? p.ref : (v = (h = null == (y = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : y.get) && "isReactWarning" in h && h.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof g || x.isPresent ? e3.cloneElement(w, {
                    ref: S
                }) : null
            };

            function na(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            no.displayName = "Presence";
            var ns = window.RadixUI["react-focus-guards"],
                nl = function() {
                    return (nl = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var i in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                        return e
                    }).apply(this, arguments)
                };

            function nc(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var i = 0, n = Object.getOwnPropertySymbols(e); i < n.length; i++) 0 > t.indexOf(n[i]) && Object.prototype.propertyIsEnumerable.call(e, n[i]) && (r[n[i]] = e[n[i]]);
                return r
            }
            var nu = "right-scroll-bar-position",
                nd = "width-before-scroll-bar";

            function nf(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var np = "undefined" != typeof window ? e3.useLayoutEffect : e3.useEffect,
                nm = new WeakMap,
                ny = (void 0 === c && (c = {}), (void 0 === u && (u = function(e) {
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
                }).options = nl({
                    async: !0,
                    ssr: !1
                }, c), p),
                nh = function() {},
                nv = e3.forwardRef(function(e, t) {
                    var r, n, i, o, a = e3.useRef(null),
                        s = e3.useState({
                            onScrollCapture: nh,
                            onWheelCapture: nh,
                            onTouchMoveCapture: nh
                        }),
                        l = s[0],
                        c = s[1],
                        u = e.forwardProps,
                        d = e.children,
                        f = e.className,
                        p = e.removeScrollBar,
                        m = e.enabled,
                        y = e.shards,
                        h = e.sideCar,
                        v = e.noRelative,
                        b = e.noIsolation,
                        g = e.inert,
                        x = e.allowPinchZoom,
                        w = e.as,
                        S = e.gapMode,
                        P = nc(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        O = (r = [a, t], n = function(e) {
                            return r.forEach(function(t) {
                                return nf(t, e)
                            })
                        }, (i = (0, e3.useState)(function() {
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
                        })[0]).callback = n, o = i.facade, np(function() {
                            var e = nm.get(o);
                            if (e) {
                                var t = new Set(e),
                                    n = new Set(r),
                                    i = o.current;
                                t.forEach(function(e) {
                                    n.has(e) || nf(e, null)
                                }), n.forEach(function(e) {
                                    t.has(e) || nf(e, i)
                                })
                            }
                            nm.set(o, r)
                        }, [r]), o),
                        I = nl(nl({}, P), l);
                    return e3.createElement(e3.Fragment, null, m && e3.createElement(h, {
                        sideCar: ny,
                        removeScrollBar: p,
                        shards: y,
                        noRelative: v,
                        noIsolation: b,
                        inert: g,
                        setCallbacks: c,
                        allowPinchZoom: !!x,
                        lockRef: a,
                        gapMode: S
                    }), u ? e3.cloneElement(e3.Children.only(d), nl(nl({}, I), {
                        ref: O
                    })) : e3.createElement(void 0 === w ? "div" : w, nl({}, I, {
                        className: f,
                        ref: O
                    }), d))
                });
            nv.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, nv.classNames = {
                fullWidth: nd,
                zeroRight: nu
            };
            var nb = function(e) {
                var t = e.sideCar,
                    r = nc(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var n = t.read();
                if (!n) throw Error("Sidecar medium not found");
                return e3.createElement(n, nl({}, r))
            };
            nb.isSideCarExport = !0;
            var ng = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(n) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = w || r.nc;
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
                nx = function() {
                    var e = ng();
                    return function(t, r) {
                        e3.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && r])
                    }
                },
                nw = function() {
                    var e = nx();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                nS = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                nP = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                nO = function(e) {
                    var t = window.getComputedStyle(document.body),
                        r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        n = t["padding" === e ? "paddingTop" : "marginTop"],
                        i = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [nP(r), nP(n), nP(i)]
                },
                nI = function(e) {
                    if (void 0 === e && (e = "margin"), "undefined" == typeof window) return nS;
                    var t = nO(e),
                        r = document.documentElement.clientWidth,
                        n = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, n - r + t[2] - t[0])
                    }
                },
                nE = nw(),
                nj = "data-scroll-locked",
                nT = function(e, t, r, n) {
                    var i = e.left,
                        o = e.top,
                        a = e.right,
                        s = e.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(s, "px ").concat(n, ";\n  }\n  body[").concat(nj, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(i, "px;\n    padding-top: ").concat(o, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(s, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(s, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(nu, " {\n    right: ").concat(s, "px ").concat(n, ";\n  }\n  \n  .").concat(nd, " {\n    margin-right: ").concat(s, "px ").concat(n, ";\n  }\n  \n  .").concat(nu, " .").concat(nu, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(nd, " .").concat(nd, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(nj, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(s, "px;\n  }\n")
                },
                nN = function() {
                    var e = parseInt(document.body.getAttribute(nj) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                nC = function() {
                    e3.useEffect(function() {
                        return document.body.setAttribute(nj, (nN() + 1).toString()),
                            function() {
                                var e = nN() - 1;
                                e <= 0 ? document.body.removeAttribute(nj) : document.body.setAttribute(nj, e.toString())
                            }
                    }, [])
                },
                nD = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        n = e.gapMode,
                        i = void 0 === n ? "margin" : n;
                    nC();
                    var o = e3.useMemo(function() {
                        return nI(i)
                    }, [i]);
                    return e3.createElement(nE, {
                        styles: nT(o, !t, i, r ? "" : "!important")
                    })
                },
                nA = !1;
            if ("undefined" != typeof window) try {
                var nR = Object.defineProperty({}, "passive", {
                    get: function() {
                        return nA = !0, !0
                    }
                });
                window.addEventListener("test", nR, nR), window.removeEventListener("test", nR, nR)
            } catch (e) {
                nA = !1
            }
            var nk = !!nA && {
                passive: !1
            };

            function nM(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var n_ = function(e, t) {
                    if (!nM(e, Element)) return !1;
                    var r = window.getComputedStyle(e);
                    return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
                },
                nU = function(e, t) {
                    var r = t.ownerDocument,
                        n = t;
                    do {
                        if ("undefined" != typeof ShadowRoot && nM(n, ShadowRoot) && (n = n.host), nL(e, n)) {
                            var i = nB(e, n);
                            if (i[1] > i[2]) return !0
                        }
                        n = n.parentNode
                    } while (n && n !== r.body);
                    return !1
                },
                nL = function(e, t) {
                    return "v" === e ? n_(t, "overflowY") : n_(t, "overflowX")
                },
                nB = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                nF = function(e, t, r, n, i) {
                    var o, a = (o = window.getComputedStyle(t).direction, "h" === e && "rtl" === o ? -1 : 1),
                        s = a * n,
                        l = r.target,
                        c = t.contains(l),
                        u = !1,
                        d = s > 0,
                        f = 0,
                        p = 0;
                    do {
                        if (!l) break;
                        var m = nB(e, l),
                            y = m[0],
                            h = m[1] - m[2] - a * y;
                        (y || h) && nL(e, l) && (f += h, p += y);
                        var v = l.parentNode;
                        l = v && v.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? v.host : v
                    } while (!c && l !== document.body || c && (t.contains(l) || t === l));
                    return d && (i && 1 > Math.abs(f) || !i && s > f) ? u = !0 : !d && (i && 1 > Math.abs(p) || !i && -s > p) && (u = !0), u
                },
                nG = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                nz = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                nq = function(e) {
                    return e && "current" in e ? e.current : e
                },
                nV = 0,
                nW = [],
                nK = (m = function(e) {
                    var t = e3.useRef([]),
                        r = e3.useRef([0, 0]),
                        n = e3.useRef(),
                        i = e3.useState(nV++)[0],
                        o = e3.useState(nw)[0],
                        a = e3.useRef(e);
                    e3.useEffect(function() {
                        a.current = e
                    }, [e]), e3.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(i));
                            var t = (function(e, t, r) {
                                if (r || 2 == arguments.length)
                                    for (var n, i = 0, o = t.length; i < o; i++) !n && i in t || (n || (n = Array.prototype.slice.call(t, 0, i)), n[i] = t[i]);
                                return e.concat(n || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(nq), !0).filter(Boolean);
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
                    var s = e3.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !a.current.allowPinchZoom;
                            var i, o = nG(e),
                                s = r.current,
                                l = "deltaX" in e ? e.deltaX : s[0] - o[0],
                                c = "deltaY" in e ? e.deltaY : s[1] - o[1],
                                u = e.target,
                                d = Math.abs(l) > Math.abs(c) ? "h" : "v";
                            if ("touches" in e && "h" === d && "range" === u.type) return !1;
                            var f = nU(d, u);
                            if (!f) return !0;
                            if (f ? i = d : (i = "v" === d ? "h" : "v", f = nU(d, u)), !f) return !1;
                            if (!n.current && "changedTouches" in e && (l || c) && (n.current = i), !i) return !0;
                            var p = n.current || i;
                            return nF(p, t, e, "h" === p ? l : c, !0)
                        }, []),
                        l = e3.useCallback(function(e) {
                            if (nW.length && nW[nW.length - 1] === o) {
                                var r = "deltaY" in e ? nz(e) : nG(e),
                                    n = t.current.filter(function(t) {
                                        var n;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                                    })[0];
                                if (n && n.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!n) {
                                    var i = (a.current.shards || []).map(nq).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (i.length > 0 ? s(e, i[0]) : !a.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        c = e3.useCallback(function(e, r, n, i) {
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
                        u = e3.useCallback(function(e) {
                            r.current = nG(e), n.current = void 0
                        }, []),
                        d = e3.useCallback(function(t) {
                            c(t.type, nz(t), t.target, s(t, e.lockRef.current))
                        }, []),
                        f = e3.useCallback(function(t) {
                            c(t.type, nG(t), t.target, s(t, e.lockRef.current))
                        }, []);
                    e3.useEffect(function() {
                        return nW.push(o), e.setCallbacks({
                                onScrollCapture: d,
                                onWheelCapture: d,
                                onTouchMoveCapture: f
                            }), document.addEventListener("wheel", l, nk), document.addEventListener("touchmove", l, nk), document.addEventListener("touchstart", u, nk),
                            function() {
                                nW = nW.filter(function(e) {
                                    return e !== o
                                }), document.removeEventListener("wheel", l, nk), document.removeEventListener("touchmove", l, nk), document.removeEventListener("touchstart", u, nk)
                            }
                    }, []);
                    var p = e.removeScrollBar,
                        m = e.inert;
                    return e3.createElement(e3.Fragment, null, m ? e3.createElement(o, {
                        styles: "\n  .block-interactivity-".concat(i, " {pointer-events: none;}\n  .allow-interactivity-").concat(i, " {pointer-events: all;}\n")
                    }) : null, p ? e3.createElement(nD, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, ny.useMedium(m), nb),
                nH = e3.forwardRef(function(e, t) {
                    return e3.createElement(nv, nl({}, e, {
                        ref: t,
                        sideCar: nK
                    }))
                });
            nH.classNames = nv.classNames;
            var nX = new WeakMap,
                nY = new WeakMap,
                n$ = {},
                nJ = 0,
                nQ = function(e) {
                    return e && (e.host || nQ(e.parentNode))
                },
                nZ = function(e, t, r, n) {
                    var i = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var r = nQ(e);
                        return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    n$[r] || (n$[r] = new WeakMap);
                    var o = n$[r],
                        a = [],
                        s = new Set,
                        l = new Set(i),
                        c = function(e) {
                            !e || s.has(e) || (s.add(e), c(e.parentNode))
                        };
                    i.forEach(c);
                    var u = function(e) {
                        !e || l.has(e) || Array.prototype.forEach.call(e.children, function(e) {
                            if (s.has(e)) u(e);
                            else try {
                                var t = e.getAttribute(n),
                                    i = null !== t && "false" !== t,
                                    l = (nX.get(e) || 0) + 1,
                                    c = (o.get(e) || 0) + 1;
                                nX.set(e, l), o.set(e, c), a.push(e), 1 === l && i && nY.set(e, !0), 1 === c && e.setAttribute(r, "true"), i || e.setAttribute(n, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return u(t), s.clear(), nJ++,
                        function() {
                            a.forEach(function(e) {
                                var t = nX.get(e) - 1,
                                    i = o.get(e) - 1;
                                nX.set(e, t), o.set(e, i), t || (nY.has(e) || e.removeAttribute(n), nY.delete(e)), i || e.removeAttribute(r)
                            }), --nJ || (nX = new WeakMap, nX = new WeakMap, nY = new WeakMap, n$ = {})
                        }
                },
                n0 = function(e, t, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var n = Array.from(Array.isArray(e) ? e : [e]),
                        i = t || ("undefined" == typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return i ? (n.push.apply(n, Array.from(i.querySelectorAll("[aria-live], script"))), nZ(n, i, r, "aria-hidden")) : function() {
                        return null
                    }
                };

            function n1(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function n2(e) {
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

            function n4(e, t) {
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

            function n3(e, t) {
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

            function n5(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return n1(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return n1(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var n6 = "Dialog",
                n8 = n5(function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        n = function() {
                            var t = r.map(function(e) {
                                return e3.createContext(e)
                            });
                            return function(r) {
                                var n = (null == r ? void 0 : r[e]) || t;
                                return e3.useMemo(function() {
                                    var t, i;
                                    return rO({}, "__scope".concat(e), (t = rI({}, r), i = null != (i = rO({}, e, n)) ? i : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(i)) : (function(e, t) {
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
                        var i = e3.createContext(n),
                            o = r.length;
                        r = rj(r).concat([n]);
                        var a = function(t) {
                            var r, n = t.scope,
                                a = t.children,
                                s = rE(t, ["scope", "children"]),
                                l = (null == n || null == (r = n[e]) ? void 0 : r[o]) || i,
                                c = e3.useMemo(function() {
                                    return s
                                }, Object.values(s));
                            return (0, S.jsx)(l.Provider, {
                                value: c,
                                children: a
                            })
                        };
                        return a.displayName = t + "Provider", [a, function(r, a) {
                            var s, l = (null == a || null == (s = a[e]) ? void 0 : s[o]) || i,
                                c = e3.useContext(l);
                            if (c) return c;
                            if (void 0 !== n) return n;
                            throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                        }]
                    }, rT.apply(void 0, [n].concat(rj(t)))]
                }(n6), 2),
                n7 = n8[0];
            n8[1];
            var n9 = n5(n7(n6), 2),
                ie = n9[0],
                it = n9[1],
                ir = function(e) {
                    var t, r, n, i, o, a, s, l, c, u, d, f, p, m, y, h, v, b = e.__scopeDialog,
                        g = e.children,
                        x = e.open,
                        w = e.defaultOpen,
                        P = e.onOpenChange,
                        O = e.modal,
                        I = e3.useRef(null),
                        E = e3.useRef(null),
                        j = n5((c = (l = {
                            prop: x,
                            defaultProp: w,
                            onChange: P
                        }).prop, p = (f = rU((r = (t = {
                            defaultProp: l.defaultProp,
                            onChange: d = void 0 === (u = l.onChange) ? function() {} : u
                        }).defaultProp, n = t.onChange, o = rU(i = e3.useState(r), 1)[0], a = e3.useRef(o), s = rM(n), e3.useEffect(function() {
                            a.current !== o && (s(o), a.current = o)
                        }, [o, a, s]), i), 2))[0], m = f[1], h = (y = void 0 !== c) ? c : p, v = rM(d), [h, e3.useCallback(function(e) {
                            if (y) {
                                var t = "function" == typeof e ? e(c) : e;
                                t !== c && v(t)
                            } else m(e)
                        }, [y, c, m, v])]), 2),
                        T = j[0],
                        N = j[1];
                    return (0, S.jsx)(ie, {
                        scope: b,
                        triggerRef: I,
                        contentRef: E,
                        contentId: rR(),
                        titleId: rR(),
                        descriptionId: rR(),
                        open: void 0 !== T && T,
                        onOpenChange: N,
                        onOpenToggle: e3.useCallback(function() {
                            return N(function(e) {
                                return !e
                            })
                        }, [N]),
                        modal: void 0 === O || O,
                        children: g
                    })
                };
            ir.displayName = n6;
            var ii = "DialogTrigger";
            e3.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = n3(e, ["__scopeDialog"]),
                    i = it(ii, r),
                    o = ta(t, i.triggerRef);
                return (0, S.jsx)(rQ.button, n4(n2({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": i.open,
                    "aria-controls": i.contentId,
                    "data-state": iI(i.open)
                }, n), {
                    ref: o,
                    onClick: rS(e.onClick, i.onOpenToggle)
                }))
            }).displayName = ii;
            var io = "DialogPortal",
                ia = n5(n7(io, {
                    forceMount: void 0
                }), 2),
                is = ia[0],
                il = ia[1],
                ic = function(e) {
                    var t = e.__scopeDialog,
                        r = e.forceMount,
                        n = e.children,
                        i = e.container,
                        o = it(io, t);
                    return (0, S.jsx)(is, {
                        scope: t,
                        forceMount: r,
                        children: e3.Children.map(n, function(e) {
                            return (0, S.jsx)(no, {
                                present: r || o.open,
                                children: (0, S.jsx)(nr, {
                                    asChild: !0,
                                    container: i,
                                    children: e
                                })
                            })
                        })
                    })
                };
            ic.displayName = io;
            var iu = "DialogOverlay",
                id = e3.forwardRef(function(e, t) {
                    var r = il(iu, e.__scopeDialog),
                        n = e.forceMount,
                        i = void 0 === n ? r.forceMount : n,
                        o = n3(e, ["forceMount"]),
                        a = it(iu, e.__scopeDialog);
                    return a.modal ? (0, S.jsx)(no, {
                        present: i || a.open,
                        children: (0, S.jsx)(im, n4(n2({}, o), {
                            ref: t
                        }))
                    }) : null
                });
            id.displayName = iu;
            var ip = rK("DialogOverlay.RemoveScroll"),
                im = e3.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = n3(e, ["__scopeDialog"]),
                        i = it(iu, r);
                    return (0, S.jsx)(nH, {
                        as: ip,
                        allowPinchZoom: !0,
                        shards: [i.contentRef],
                        children: (0, S.jsx)(rQ.div, n4(n2({
                            "data-state": iI(i.open)
                        }, n), {
                            ref: t,
                            style: n2({
                                pointerEvents: "auto"
                            }, n.style)
                        }))
                    })
                }),
                iy = "DialogContent",
                ih = e3.forwardRef(function(e, t) {
                    var r = il(iy, e.__scopeDialog),
                        n = e.forceMount,
                        i = void 0 === n ? r.forceMount : n,
                        o = n3(e, ["forceMount"]),
                        a = it(iy, e.__scopeDialog);
                    return (0, S.jsx)(no, {
                        present: i || a.open,
                        children: a.modal ? (0, S.jsx)(iv, n4(n2({}, o), {
                            ref: t
                        })) : (0, S.jsx)(ib, n4(n2({}, o), {
                            ref: t
                        }))
                    })
                });
            ih.displayName = iy;
            var iv = e3.forwardRef(function(e, t) {
                    var r = it(iy, e.__scopeDialog),
                        n = e3.useRef(null),
                        i = ta(t, r.contentRef, n);
                    return e3.useEffect(function() {
                        var e = n.current;
                        if (e) return n0(e)
                    }, []), (0, S.jsx)(ig, n4(n2({}, e), {
                        ref: i,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: rS(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: rS(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                r = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || r) && e.preventDefault()
                        }),
                        onFocusOutside: rS(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                ib = e3.forwardRef(function(e, t) {
                    var r = it(iy, e.__scopeDialog),
                        n = e3.useRef(!1),
                        i = e3.useRef(!1);
                    return (0, S.jsx)(ig, n4(n2({}, e), {
                        ref: t,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(t) {
                            var o, a;
                            null == (o = e.onCloseAutoFocus) || o.call(e, t), t.defaultPrevented || (n.current || null == (a = r.triggerRef.current) || a.focus(), t.preventDefault()), n.current = !1, i.current = !1
                        },
                        onInteractOutside: function(t) {
                            null == (o = e.onInteractOutside) || o.call(e, t), t.defaultPrevented || (n.current = !0, "pointerdown" === t.detail.originalEvent.type && (i.current = !0));
                            var o, a, s = t.target;
                            (null == (a = r.triggerRef.current) ? void 0 : a.contains(s)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && i.current && t.preventDefault()
                        }
                    }))
                }),
                ig = e3.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = e.trapFocus,
                        i = e.onOpenAutoFocus,
                        o = e.onCloseAutoFocus,
                        a = n3(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        s = it(iy, r),
                        l = e3.useRef(null),
                        c = ta(t, l);
                    return (0, ns.useFocusGuards)(), (0, S.jsxs)(S.Fragment, {
                        children: [(0, S.jsx)(r5, {
                            asChild: !0,
                            loop: !0,
                            trapped: n,
                            onMountAutoFocus: i,
                            onUnmountAutoFocus: o,
                            children: (0, S.jsx)(rL.DismissableLayer, n4(n2({
                                role: "dialog",
                                id: s.contentId,
                                "aria-describedby": s.descriptionId,
                                "aria-labelledby": s.titleId,
                                "data-state": iI(s.open)
                            }, a), {
                                ref: c,
                                onDismiss: function() {
                                    return s.onOpenChange(!1)
                                }
                            }))
                        }), (0, S.jsxs)(S.Fragment, {
                            children: [(0, S.jsx)(iN, {
                                titleId: s.titleId
                            }), (0, S.jsx)(iC, {
                                contentRef: l,
                                descriptionId: s.descriptionId
                            })]
                        })]
                    })
                }),
                ix = "DialogTitle",
                iw = e3.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = n3(e, ["__scopeDialog"]),
                        i = it(ix, r);
                    return (0, S.jsx)(rQ.h2, n4(n2({
                        id: i.titleId
                    }, n), {
                        ref: t
                    }))
                });
            iw.displayName = ix;
            var iS = "DialogDescription";
            e3.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = n3(e, ["__scopeDialog"]),
                    i = it(iS, r);
                return (0, S.jsx)(rQ.p, n4(n2({
                    id: i.descriptionId
                }, n), {
                    ref: t
                }))
            }).displayName = iS;
            var iP = "DialogClose",
                iO = e3.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = n3(e, ["__scopeDialog"]),
                        i = it(iP, r);
                    return (0, S.jsx)(rQ.button, n4(n2({
                        type: "button"
                    }, n), {
                        ref: t,
                        onClick: rS(e.onClick, function() {
                            return i.onOpenChange(!1)
                        })
                    }))
                });

            function iI(e) {
                return e ? "open" : "closed"
            }
            iO.displayName = iP;
            var iE = "DialogTitleWarning",
                ij = n5((y = {
                    contentName: iy,
                    titleName: ix,
                    docsSlug: "dialog"
                }, h = e3.createContext(y), (v = function(e) {
                    var t = e.children,
                        r = rE(e, ["children"]),
                        n = e3.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, S.jsx)(h.Provider, {
                        value: n,
                        children: t
                    })
                }).displayName = iE + "Provider", [v, function(e) {
                    var t = e3.useContext(h);
                    if (t) return t;
                    if (void 0 !== y) return y;
                    throw Error("`".concat(e, "` must be used within `").concat(iE, "`"))
                }]), 2),
                iT = (ij[0], ij[1]),
                iN = function(e) {
                    var t = e.titleId,
                        r = iT(iE),
                        n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return e3.useEffect(function() {
                        t && (document.getElementById(t) || console.error(n))
                    }, [n, t]), null
                },
                iC = function(e) {
                    var t = e.contentRef,
                        r = e.descriptionId,
                        n = iT("DialogDescriptionWarning"),
                        i = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
                    return e3.useEffect(function() {
                        var e, n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        r && n && (document.getElementById(r) || console.warn(i))
                    }, [i, t, r]), null
                };

            function iD(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iA(e) {
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

            function iR(e, t) {
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

            function ik(e, t) {
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

            function iM(e) {
                return function(e) {
                    if (Array.isArray(e)) return iD(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return iD(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iD(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var i_ = Symbol("radix.slottable");

            function iU(e) {
                return e3.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === i_
            }

            function iL(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function iB(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        iL(e, t, r[t])
                    })
                }
                return e
            }

            function iF(e, t) {
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
            var iG = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r, n, i, o, a, s = (r = i = "Primitive.".concat(t), (n = e3.forwardRef(function(e, t) {
                        var r = e.children,
                            n = ik(e, ["children"]);
                        if (e3.isValidElement(r)) {
                            var i, o, a, s, l, c = (l = (s = null == (o = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in s && s.isReactWarning) ? i.ref : (l = (s = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in s && s.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                                u = function(e, t) {
                                    var r = iA({}, t);
                                    for (var n in t) ! function(n) {
                                        var i = e[n],
                                            o = t[n];
                                        /^on[A-Z]/.test(n) ? i && o ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = o.apply(void 0, iM(t));
                                            return i.apply(void 0, iM(t)), n
                                        } : i && (r[n] = i) : "style" === n ? r[n] = iA({}, i, o) : "className" === n && (r[n] = [i, o].filter(Boolean).join(" "))
                                    }(n);
                                    return iA({}, e, r)
                                }(n, r.props);
                            return r.type !== e3.Fragment && (u.ref = t ? to(t, c) : c), e3.cloneElement(r, u)
                        }
                        return e3.Children.count(r) > 1 ? e3.Children.only(null) : null
                    })).displayName = "".concat(r, ".SlotClone"), o = n, (a = e3.forwardRef(function(e, t) {
                        var r = e.children,
                            n = ik(e, ["children"]),
                            i = e3.Children.toArray(r),
                            a = i.find(iU);
                        if (a) {
                            var s = a.props.children,
                                l = i.map(function(e) {
                                    return e !== a ? e : e3.Children.count(s) > 1 ? e3.Children.only(null) : e3.isValidElement(s) ? s.props.children : null
                                });
                            return (0, S.jsx)(o, iR(iA({}, n), {
                                ref: t,
                                children: e3.isValidElement(s) ? e3.cloneElement(s, void 0, l) : null
                            }))
                        }
                        return (0, S.jsx)(o, iR(iA({}, n), {
                            ref: t,
                            children: r
                        }))
                    })).displayName = "".concat(i, ".Slot"), a),
                    l = e3.forwardRef(function(e, r) {
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
                            o = n ? s : t;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, S.jsx)(o, iF(iB({}, i), {
                            ref: r
                        }))
                    });
                return l.displayName = "Primitive.".concat(t), iF(iB({}, e), iL({}, t, l))
            }, {});

            function iz(e) {
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
            var iq = Object.freeze({
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
                iV = e3.forwardRef(function(e, t) {
                    var r, n;
                    return (0, S.jsx)(iG.span, (r = iz({}, e), n = n = {
                        ref: t,
                        style: iz({}, iq, e.style)
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

            function iK(e, t) {
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
            iV.displayName = "VisuallyHidden";
            var iH = (0, e3.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                iX = function() {
                    var e = (0, e3.useContext)(iH);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                iY = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                i$ = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                iJ = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                iQ = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.children,
                        i = e.size,
                        o = e.type,
                        a = void 0 === o ? "Default" : o,
                        s = e.isModal,
                        l = e.hasCloseAffordance,
                        c = e.closeLabel,
                        u = e.hasMarginTop,
                        d = void 0 === u || u,
                        f = e.hasMarginBottom,
                        p = void 0 === f || f,
                        m = e.hasDescription,
                        y = void 0 !== m && m,
                        h = e.experimentalDisablePointerEventsStylingOnBody,
                        v = void 0 !== h && h,
                        b = (0, e3.useMemo)(function() {
                            return {
                                size: i,
                                isModal: s,
                                type: a,
                                hasCloseAffordance: l,
                                closeLabel: c,
                                hasMarginTop: d,
                                hasMarginBottom: p,
                                hasDescription: y
                            }
                        }, [i, s, a, l, c, d, p, y]);
                    return (0, e3.useEffect)(function() {
                        v && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [v, t]), e5().createElement(iH.Provider, {
                        value: b
                    }, e5().createElement(ir, {
                        open: t,
                        onOpenChange: r
                    }, n))
                };
            iQ.displayName = "Dialog";
            var iZ = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.style,
                    i = e.overlayClassName,
                    o = e.overlayStyle,
                    a = e.onOpenAutoFocus,
                    s = iK(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    l = iX(),
                    c = l.size,
                    u = l.isModal,
                    d = l.hasCloseAffordance,
                    f = l.closeLabel,
                    p = l.hasDescription,
                    m = e6("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", u && "bg-common-backdrop", i),
                    y = e6("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return e5().createElement(ic, null, e5().createElement(id, {
                    className: m,
                    style: o
                }, e5().createElement(ih, iW({
                    className: y,
                    "data-size": c,
                    style: n,
                    onOpenAutoFocus: a
                }, !p && {
                    "aria-describedby": void 0
                }, s), d && e5().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, e5().createElement(iO, {
                    asChild: !0
                }, e5().createElement(rw, {
                    variant: "OverMedia",
                    size: c,
                    isCircular: !0,
                    "aria-label": f
                }))), t)))
            };
            iZ.displayName = "DialogContent";
            var i0 = function(e) {
                var t = e.children,
                    r = e.className,
                    n = iK(e, ["children", "className"]),
                    i = iX(),
                    o = i.size,
                    a = i.hasMarginTop,
                    s = i.hasMarginBottom,
                    l = e6(iY[o], a && i$[o], s && iJ[o], r);
                return e5().createElement("div", iW({
                    className: l
                }, n), t)
            };
            i0.displayName = "DialogBody";
            var i1 = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.hidden,
                    i = iK(e, ["children", "className", "hidden"]),
                    o = e5().createElement(iw, iW({
                        className: r
                    }, i), t);
                return n ? e5().createElement(iV, null, o) : o
            };
            i1.displayName = "DialogTitle";
            var i2 = function(e) {
                var t = e.children,
                    r = e.className,
                    n = iK(e, ["children", "className"]),
                    i = iX().size,
                    o = e6(iY[i], iJ[i], r);
                return e5().createElement("div", iW({
                    className: o
                }, n), t)
            };
            i2.displayName = "DialogFooter";
            var i4 = function(e) {
                var t = e.open,
                    r = e.onOpenChange,
                    n = e.title,
                    i = e.body,
                    o = (0, P.useTranslation)().translate;
                return (0, S.jsx)(iQ, {
                    closeLabel: o("Action.Close"),
                    hasCloseAffordance: !0,
                    isModal: !0,
                    open: t,
                    size: "Small",
                    type: "Default",
                    onOpenChange: r,
                    children: (0, S.jsxs)(iZ, {
                        className: "stroke-standard stroke-default flex flex-col items-start",
                        style: {
                            width: "100%",
                            maxWidth: 320
                        },
                        children: [(0, S.jsxs)(i0, {
                            className: "width-full gap-small padding-top-medium padding-x-xlarge padding-bottom-large flex flex-col items-start",
                            children: [(0, S.jsx)(i1, {
                                className: "margin-none text-heading-small content-emphasis text-align-x-start",
                                children: n
                            }), (0, S.jsx)("p", {
                                className: "margin-none text-body-medium content-default text-align-x-start whitespace-pre-line",
                                children: i
                            })]
                        }), (0, S.jsx)(i2, {
                            className: "width-full",
                            children: (0, S.jsx)(tE, {
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

            function i3(e) {
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

            function i5(e, t) {
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

            function i6(e, t) {
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
            var i8 = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                i7 = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                i9 = {
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
                oe = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                ot = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                or = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                on = {
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
                oi = {
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
                oo = (0, e3.forwardRef)(function(e, t) {
                    var r, n = e.className,
                        i = e.icon,
                        o = e.ariaLabel,
                        a = e.isDisabled,
                        s = void 0 !== a && a,
                        l = e.isCircular,
                        c = e.isSelected,
                        u = e.size,
                        d = void 0 === u ? "Large" : u,
                        f = e.variant,
                        p = void 0 === f ? "Emphasis" : f,
                        m = e.iconColor,
                        y = void 0 === m ? "Default" : m,
                        h = e.asChild,
                        v = e.children,
                        b = i6(e, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]);
                    r = s ? ot[p] : void 0 !== c && c ? or[p] : oe[p];
                    var g = e6("foundation-web-icon-button", s ? tt : [e9, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", i8[d], i9[d][void 0 !== l && l ? "circular" : "square"], r, n),
                        x = e5().createElement(e5().Fragment, null, e5().createElement(te, null), e5().createElement("span", {
                            className: e6("icon", i, i7[d], s ? oi[y][p] : on[y][p])
                        }));
                    if (h) {
                        b.as;
                        var w = i6(b, ["as"]),
                            S = e5().Children.only(v);
                        return e5().createElement(th, i5(i3({
                            ref: t
                        }, w), {
                            className: g,
                            "aria-label": o,
                            "aria-disabled": s || void 0
                        }), e5().cloneElement(S, {}, x))
                    }
                    if ("a" === b.as) {
                        b.as;
                        var P = b.href,
                            O = i6(b, ["as", "href"]);
                        return e5().createElement("a", i5(i3({
                            ref: t
                        }, O), {
                            "aria-label": o,
                            "aria-disabled": s,
                            href: s ? void 0 : P,
                            className: g
                        }), x)
                    }
                    b.as;
                    var I = i6(b, ["as"]);
                    return e5().createElement("button", i5(i3({
                        ref: t,
                        type: "button"
                    }, I), {
                        "aria-label": o,
                        disabled: s,
                        className: g
                    }), x)
                });

            function oa(e) {
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
            var os = (0, e3.forwardRef)(function(e, t) {
                var r, n, i = e.className,
                    o = e.style,
                    a = e.orientation,
                    s = void 0 === a ? "horizontal" : a,
                    l = e.variant,
                    c = void 0 === l ? "Standard" : l,
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
                    d = "vertical" === s,
                    f = {};
                return d || "Inset" !== c ? d || "InsetLeft" !== c ? d || "InsetRight" !== c || (f = {
                    marginRight: "var(--padding-xlarge)"
                }) : f = {
                    marginLeft: "var(--padding-xlarge)"
                } : f = {
                    marginLeft: "var(--padding-xlarge)",
                    marginRight: "var(--padding-xlarge)"
                }, e5().createElement("div", (r = oa({
                    ref: t
                }, u), n = n = {
                    role: "separator",
                    "data-orientation": s,
                    "aria-orientation": s,
                    style: oa({
                        borderRightWidth: 0,
                        borderBottomWidth: 0,
                        boxSizing: "border-box",
                        borderStyle: "solid"
                    }, d ? {
                        height: "100%",
                        width: 0,
                        borderLeftWidth: "var(--stroke-standard)",
                        borderTopWidth: 0
                    } : "Thick" === c ? {
                        height: "var(--size-250)",
                        borderTop: "var(--stroke-standard)",
                        borderLeftWidth: 0,
                        background: "var(--color-common-heavydivider, rgba(0, 0, 0, 0.50))"
                    } : {
                        height: 0,
                        borderTopWidth: "var(--stroke-standard)",
                        borderLeftWidth: 0
                    }, f, o),
                    className: e6("stroke-default self-stretch", i)
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
            os.displayName = "Divider";
            var ol = function(e) {
                var t = e.type,
                    r = e.sideSheetSide,
                    n = e.isSideSheetFlush,
                    i = e.centerSheetSize,
                    o = e.children,
                    a = e.overlayClassName,
                    s = e.contentClassName,
                    l = e.onOpenAutoFocus,
                    c = e.onCloseAutoFocus,
                    u = e.onPointerDownOutside,
                    d = e.onEscapeKeyDown,
                    f = e.onInteractOutside;
                return e5().createElement(ic, null, e5().createElement(id, {
                    "data-testid": "fui-base-sheet-overlay",
                    "data-type": t,
                    "data-side": "sideSheet" === t ? void 0 === r ? "right" : r : void 0,
                    "data-flush": "sideSheet" === t ? void 0 !== n && n : void 0,
                    "data-size": "centerSheet" === t ? void 0 === i ? "Medium" : i : void 0,
                    className: e6("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", a)
                }, e5().createElement(ih, {
                    "data-testid": "fui-base-sheet-content",
                    className: e6("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", s),
                    onOpenAutoFocus: l,
                    onCloseAutoFocus: c,
                    onPointerDownOutside: u,
                    onEscapeKeyDown: d,
                    onInteractOutside: f
                }, o)))
            };

            function oc(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var ou = function(e) {
                    return ("function" != typeof e.checkVisibility || e.checkVisibility()) && !("disabled" in e && e.disabled || "true" === e.getAttribute("aria-disabled"))
                },
                od = function(e) {
                    oc(e, HTMLInputElement) && "function" == typeof e.select && e.select()
                },
                of = function(e) {
                    var t = e.currentTarget;
                    if (t) {
                        var r = t.querySelectorAll("[data-autofocus-priority]");
                        if (0 !== r.length) {
                            var n = [];
                            r.forEach(function(e) {
                                var t = parseInt(e.getAttribute("data-autofocus-priority") || "", 10);
                                !Number.isNaN(t) && oc(e, HTMLElement) && n.push({
                                    element: e,
                                    priority: t
                                })
                            }), n.sort(function(e, t) {
                                return e.priority - t.priority
                            });
                            var i = n.find(function(e) {
                                return ou(e.element)
                            });
                            if (i) {
                                e.preventDefault();
                                var o = document.activeElement === i.element;
                                i.element.focus(), o || od(i.element)
                            }
                        }
                    }
                };

            function op(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            r(792);
            var om = "undefined" != typeof window ? e3.useLayoutEffect : e3.useEffect,
                oy = "undefined" == typeof window;

            function oh(e) {
                var t, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = r.defaultValue,
                    i = void 0 !== n && n,
                    o = r.initializeWithValue,
                    a = void 0 === o || o,
                    s = function(e) {
                        return oy ? i : window.matchMedia(e).matches
                    },
                    l = (t = (0, e3.useState)(function() {
                        return a ? s(e) : i
                    }), function(e) {
                        if (Array.isArray(e)) return e
                    }(t) || function(e, t) {
                        var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != i) {
                            var o = [],
                                a = !0,
                                s = !1;
                            try {
                                for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), o.length !== t); a = !0);
                            } catch (e) {
                                s = !0, n = e
                            } finally {
                                try {
                                    a || null == i.return || i.return()
                                } finally {
                                    if (s) throw n
                                }
                            }
                            return o
                        }
                    }(t, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return op(e, 2);
                            var r = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return op(e, t)
                        }
                    }(t, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    c = l[0],
                    u = l[1];

                function d() {
                    u(s(e))
                }
                return om(function() {
                    var t = window.matchMedia(e);
                    return d(), t.addListener ? t.addListener(d) : t.addEventListener("change", d),
                        function() {
                            t.removeListener ? t.removeListener(d) : t.removeEventListener("change", d)
                        }
                }, [e]), c
            }

            function ov(e) {
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
            var og = (0, e3.createContext)(null),
                ox = function() {
                    var e = (0, e3.useContext)(og);
                    if (!e) throw Error("Sheet components must be used within a Sheet");
                    return e
                },
                ow = "padding-x-xlarge",
                oS = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.defaultOpen,
                        i = e.children;
                    return e5().createElement(ir, {
                        open: t,
                        onOpenChange: r,
                        defaultOpen: n,
                        modal: !0
                    }, i)
                },
                oP = function(e) {
                    var t, r = e.children,
                        n = e.centerSheetSize,
                        i = void 0 === n ? "Medium" : n,
                        o = e.largeScreenVariant,
                        a = void 0 === o ? "center" : o,
                        s = e.closeLabel,
                        l = e.className,
                        c = e.mobilePortraitClassName,
                        u = e.mobileLandscapeClassName,
                        d = e.largeScreenClassName,
                        f = e.onOpenAutoFocus,
                        p = e.onCloseAutoFocus,
                        m = e.onPointerDownOutside,
                        y = e.onEscapeKeyDown,
                        h = e.onInteractOutside,
                        v = oh("(orientation: portrait) and (max-width: 600px)"),
                        b = oh("(orientation: landscape) and (max-height: 600px)");
                    t = v ? "bottomSheet" : b || "side" === a ? "sideSheet" : "centerSheet";
                    var g = (0, e3.useMemo)(function() {
                            return {
                                centerSheetSize: i,
                                largeScreenVariant: a,
                                closeLabel: s,
                                isPortraitMobile: v,
                                isLandscapeMobile: b,
                                type: t
                            }
                        }, [i, a, s, v, b, t]),
                        x = e6(l, v && c, b && u, !v && !b && d);
                    return e5().createElement(og.Provider, {
                        value: g
                    }, e5().createElement(ol, {
                        type: t,
                        sideSheetSide: "right",
                        isSideSheetFlush: b,
                        centerSheetSize: i,
                        contentClassName: x,
                        onOpenAutoFocus: null != f ? f : of,
                        onCloseAutoFocus: p,
                        onPointerDownOutside: m,
                        onEscapeKeyDown: y,
                        onInteractOutside: h
                    }, r))
                },
                oO = (0, e3.forwardRef)(function(e, t) {
                    var r = e.children,
                        n = e.className,
                        i = e.hasPaddingX,
                        o = ob(e, ["children", "className", "hasPaddingX"]),
                        a = ox().type;
                    return e5().createElement("div", ov({
                        ref: t,
                        className: e6("scroll-y", (void 0 === i || i) && ow, "sideSheet" === a ? "grow-1" : "", n)
                    }, o), r)
                });
            oO.displayName = "SheetBody";
            var oI = function(e) {
                    var t = e.className,
                        r = e.children,
                        n = e.navigation,
                        i = e.utilities,
                        o = e.visuallyHideTitleText,
                        a = ox().closeLabel,
                        s = e5().createElement(iw, {
                            className: "text-heading-small margin-none"
                        }, r);
                    return e5().createElement("div", {
                        className: e6(t, n ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
                    }, e5().createElement("div", {
                        className: e6("flex items-center", n && "gap-xsmall")
                    }, n, o ? e5().createElement(iV, null, s) : s), e5().createElement("div", {
                        className: e6("flex items-center", i && "gap-xxsmall")
                    }, i, e5().createElement("div", {
                        className: "fui-sheet-close-affordance-container"
                    }, e5().createElement(iO, {
                        asChild: !0
                    }, e5().createElement(oo, {
                        variant: "Utility",
                        size: "Medium",
                        icon: "icon-regular-x",
                        ariaLabel: a || "",
                        "data-autofocus-priority": "1000"
                    })))))
                },
                oE = function(e) {
                    var t = e.children,
                        r = e.className,
                        n = ob(e, ["children", "className"]);
                    return e5().createElement(e5().Fragment, null, e5().createElement(os, null), e5().createElement("div", ov({
                        className: e6(ow, "margin-y-small shrink-0", r)
                    }, n), t))
                },
                oj = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600"
                },
                oT = {
                    XSmall: "size-150",
                    Small: "size-200",
                    Medium: "size-250"
                },
                oN = {
                    XSmall: "size-1200",
                    Small: "size-1400",
                    Medium: "size-1600"
                },
                oC = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium"
                },
                oD = {
                    XSmall: void 0,
                    Small: "padding-top-xxsmall",
                    Medium: "padding-y-xxsmall"
                },
                oA = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium"
                },
                oR = {
                    XSmall: "padding-medium",
                    Small: "padding-large",
                    Medium: "padding-xlarge"
                },
                ok = {
                    XSmall: "Small",
                    Small: "Medium",
                    Medium: "Large"
                },
                oM = (0, e3.forwardRef)(function(e, t) {
                    var r = e.layout,
                        n = e.size,
                        i = e.type,
                        o = e.isDisabled,
                        a = e.label,
                        s = e.description,
                        l = e.media,
                        c = e.icon,
                        u = e.metadata,
                        d = e.isSelected,
                        f = e.onSelect,
                        p = e.hideSelectedIndicator,
                        m = void 0 !== p && p,
                        y = (0, e3.useMemo)(function() {
                            return a && e5().createElement("div", {
                                className: e6(oC[n], oD[n], "content-emphasis text-align-x-start", "clip [display:-webkit-box] [-webkit-line-clamp:3] [-webkit-box-orient:vertical]")
                            }, a)
                        }, [a, n]),
                        h = (0, e3.useMemo)(function() {
                            return u && e5().createElement("div", {
                                className: e6("text-caption-small content-default text-align-x-start", "text-truncate-split text-no-wrap width-full")
                            }, u)
                        }, [u]),
                        v = (0, e3.useMemo)(function() {
                            return s && e5().createElement("div", {
                                className: e6(oA[n], "content-default text-align-x-start")
                            }, s)
                        }, [s, n]),
                        b = (0, e3.useMemo)(function() {
                            return c && e5().createElement(e7, {
                                name: c,
                                size: ok[n]
                            })
                        }, [c, n]),
                        g = (0, e3.useMemo)(function() {
                            switch (i) {
                                case "Checkmark":
                                    return d && e5().createElement(e7, {
                                        name: "icon-filled-check",
                                        size: ok[n]
                                    });
                                case "Checkbox":
                                    return e5().createElement("div", {
                                        className: e6(oj[n], "flex items-center justify-center radius-small padding-none content-default", d ? "stroke-none" : "stroke-standard stroke-emphasis", d ? "bg-system-contrast" : "bg-none")
                                    }, d && e5().createElement("div", {
                                        className: e6(oj[n], "content-inverse-emphasis icon icon-filled-check")
                                    }));
                                case "Radio":
                                    return e5().createElement("div", {
                                        className: e6(oj[n], "radius-circle flex items-center justify-center stroke-emphasis stroke-standard", d ? "bg-system-contrast" : "bg-none")
                                    }, d && e5().createElement("div", {
                                        className: e6("radius-circle bg-inverse-action-sub-emphasis", oT[n])
                                    }));
                                default:
                                    return console.error("Invalid OptionSelector type ".concat(i)), null
                            }
                        }, [i, n, d]),
                        x = (0, e3.useMemo)(function() {
                            return l && e5().createElement("div", {
                                className: e6(oN[n], "flex items-center justify-center clip shrink-0")
                            }, l)
                        }, [l, n]),
                        w = (0, e3.useMemo)(function() {
                            var e = !m && e5().createElement("div", {
                                className: oj[n]
                            }, g);
                            switch (r) {
                                case "Horizontal":
                                    return e5().createElement("div", {
                                        className: "flex gap-large"
                                    }, x, e5().createElement("div", {
                                        className: "flex flex-col gap-xsmall fill clip"
                                    }, e5().createElement("div", {
                                        className: "flex gap-small items-start"
                                    }, e5().createElement("div", {
                                        className: "flex flex-col items-start fill clip"
                                    }, e5().createElement("div", {
                                        className: "flex gap-small items-center width-full"
                                    }, b, y), h), e), v));
                                case "Vertical":
                                    return e5().createElement("div", {
                                        className: "flex flex-col gap-xsmall"
                                    }, e5().createElement("div", {
                                        className: "flex gap-small"
                                    }, e5().createElement("div", {
                                        className: "flex flex-col gap-medium fill min-width-0"
                                    }, x, e5().createElement("div", {
                                        className: "flex flex-col gap-xsmall"
                                    }, b, y, h)), e), v);
                                default:
                                    return console.error("Invalid OptionSelector layout ".concat(r)), null
                            }
                        }, [r, x, b, y, v, g, n, h, m]);
                    return e5().createElement("button", {
                        type: "button",
                        className: e6(e9, "focus:outline-focus bg-none width-full radius-medium stroke-standard", d ? "stroke-system-contrast" : "stroke-contrast-alpha", oR[n], o && "opacity-[0.5]", !o && "cursor-pointer"),
                        disabled: o,
                        ref: t,
                        onClick: function() {
                            return f()
                        }
                    }, !o && e5().createElement(te, null), w)
                });
            oM.displayName = "OptionSelector";
            var o_ = ((b = {}).LIST_AVAILABLE_PRODUCTS_FAILED = "ListAvailableProductsFailed", b.LIST_AVAILABLE_PRODUCTS_EMPTY = "ListAvailableProductsEmpty", b.LIST_SUBSCRIPTIONS_FAILED = "ListSubscriptionsFailed", b.GET_USER_BENEFITS_FAILED = "GetUserBenefitsFailed", b.GUAC_APP_POLICY_FAILED = "GuacAppPolicyFailed", b.MEMBERSHIP_POLLING_TIMEOUT = "MembershipPollingTimeout", b.PURCHASE_VIEW_SHOWN = "PurchaseViewShown", b.PURCHASE_VIEW_OPEN_SHEET_CLICK = "PurchaseViewOpenSheetClick", b.BUNDLE_PICKER_SHEET_OPENED = "BundlePickerSheetOpened", b.BUNDLE_PICKER_TIER_SELECTED = "BundlePickerTierSelected", b.BUNDLE_PICKER_SUBSCRIBE_CLICK = "BundlePickerSubscribeClick", b.BUNDLE_PICKER_ROW_MISSING_ROBUX_ALLOWANCE = "BundlePickerRowMissingRobuxAllowance", b.BUNDLE_PICKER_ROW_MISSING_STRIKETHROUGH_PRICE = "BundlePickerRowMissingStrikethroughPrice", b.MISSING_FEATURE_CONFIG = "MissingFeatureConfig", b),
                oU = (0, window.Roblox["web-telemetry"].fire.createFireTelemetryCounter)("RobloxSubscription"),
                oL = function(e) {
                    var t = e.product,
                        r = e.isBundle,
                        n = (0, P.useTranslation)(),
                        i = n.translate,
                        o = n.intl,
                        a = tz(t);
                    (0, e3.useEffect)(function() {
                        r && 0 === a && oU(o_.BUNDLE_PICKER_ROW_MISSING_ROBUX_ALLOWANCE, {
                            productId: t.productKey.id
                        }), r && !t.localizedStrikethroughPriceDisplayString && oU(o_.BUNDLE_PICKER_ROW_MISSING_STRIKETHROUGH_PRICE, {
                            productId: t.productKey.id,
                            currencyCode: t.localizedPrice.currencyCode
                        })
                    }, [r, t.localizedPrice.currencyCode, t.localizedStrikethroughPriceDisplayString, t.productKey.id, a]);
                    var s = o.n(a),
                        l = a > 0 ? "".concat(i("Label.BlackbirdShort"), " ").concat(a) : i("Label.Blackbird"),
                        c = t.localizedPriceDisplayString,
                        u = t.localizedStrikethroughPriceDisplayString;
                    return (0, S.jsxs)("div", {
                        className: "width-full min-height-700 flex flex-col items-stretch justify-center",
                        children: [(0, S.jsxs)("div", {
                            className: "width-full flex flex-row items-center justify-between",
                            children: [(0, S.jsx)("span", {
                                className: "text-title-medium content-emphasis",
                                children: l
                            }), (0, S.jsxs)("div", {
                                className: "gap-small flex flex-row items-center justify-end",
                                children: [u && (0, S.jsx)("span", {
                                    className: "text-body-medium strike-through",
                                    style: {
                                        color: "#6a6f81"
                                    },
                                    children: u
                                }), (0, S.jsx)("span", {
                                    className: "text-body-medium content-emphasis text-strikethrough",
                                    children: c
                                })]
                            })]
                        }), a > 0 && (0, S.jsx)("div", {
                            className: "width-full gap-xsmall flex flex-row items-center justify-start",
                            children: (0, S.jsx)("span", {
                                className: "text-body-medium content-default flex flex-row items-center",
                                children: rd(i, "Plus.LandingPage.BottomSheet.Benefit", [{
                                    opening: "amountStart",
                                    closing: "amountEnd",
                                    render: function(e) {
                                        return (0, S.jsxs)("span", {
                                            className: "padding-left-xxsmall gap-x-xxsmall flex flex-row items-center",
                                            children: [(0, S.jsx)(e7, {
                                                name: "icon-regular-robux",
                                                size: "XSmall"
                                            }), e]
                                        })
                                    }
                                }], {
                                    price: s
                                })
                            })
                        })]
                    })
                },
                oB = function(e) {
                    var t = e.product,
                        r = e.isSelected,
                        n = e.onSelect,
                        i = e.isBundle;
                    return (0, S.jsx)("div", {
                        "data-testid": "bundle-picker-tier-".concat(t.productKey.id),
                        children: (0, S.jsx)(oM, {
                            hideSelectedIndicator: !0,
                            isSelected: r,
                            label: void 0,
                            layout: "Horizontal",
                            metadata: (0, S.jsx)(oL, {
                                isBundle: i,
                                product: t
                            }),
                            size: "XSmall",
                            type: "Checkmark",
                            onSelect: n
                        })
                    })
                };

            function oF(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var oG = function(e) {
                    var t, r, n, i, o, a, s = e.isOpen,
                        l = e.onOpenChange,
                        c = e.products,
                        u = e.deviceMeta,
                        d = e.isEntrypointDisabled,
                        f = e.onMobilePurchaseInitiated,
                        p = e.paymentSessionId,
                        m = (0, P.useTranslation)().translate,
                        y = null == (o = c[0]) ? void 0 : o.productKey.id,
                        h = (t = (0, e3.useState)(y), function(e) {
                            if (Array.isArray(e)) return e
                        }(t) || function(e, t) {
                            var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != i) {
                                var o = [],
                                    a = !0,
                                    s = !1;
                                try {
                                    for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), o.length !== t); a = !0);
                                } catch (e) {
                                    s = !0, n = e
                                } finally {
                                    try {
                                        a || null == i.return || i.return()
                                    } finally {
                                        if (s) throw n
                                    }
                                }
                                return o
                            }
                        }(t, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return oF(e, 2);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oF(e, t)
                            }
                        }(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        v = h[0],
                        b = h[1];
                    (0, e3.useEffect)(function() {
                        v && c.some(function(e) {
                            return e.productKey.id === v
                        }) || b(y)
                    }, [y, c, v]);
                    var g = (0, e3.useMemo)(function() {
                            var e;
                            return null != (e = c.find(function(e) {
                                return e.productKey.id === v
                            })) ? e : c[0]
                        }, [c, v]),
                        x = !!g && void 0 !== tq(g),
                        w = (0, e3.useRef)(!1);
                    (0, e3.useEffect)(function() {
                        if (!s) {
                            w.current = !1;
                            return
                        }!w.current && p && (w.current = !0, t0().sendUserPurchaseFlowEvent(t0().ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, t0().ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, t0().ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, t0().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_BUNDLE_SHEET_OPENED, p ? {
                            paymentSessionId: p
                        } : {}), oU(o_.BUNDLE_PICKER_SHEET_OPENED, {
                            tierCount: String(c.length),
                            defaultProductId: null != y ? y : ""
                        }))
                    }, [s, p, c.length, y]);
                    var O = (0, e3.useCallback)(function(e) {
                            b(e), t0().sendUserPurchaseFlowEvent(t0().ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, t0().ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, t0().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, t0().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_BUNDLE_TIER_SELECTED, function(e) {
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
                            } : {})), oU(o_.BUNDLE_PICKER_TIER_SELECTED, {
                                productId: e
                            })
                        }, [p]),
                        I = (0, e3.useCallback)(function() {
                            var e = x ? t0().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : t0().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                            t0().sendUserPurchaseFlowEvent(t0().ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, t0().ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, t0().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, e, p ? {
                                paymentSessionId: p
                            } : {}), oU(o_.BUNDLE_PICKER_SUBSCRIBE_CLICK, {
                                productId: null != v ? v : "",
                                isFreeTrial: String(x)
                            })
                        }, [x, v, p]);
                    if (!g) return null;
                    var E = [{
                            opening: "linkStart",
                            closing: "linkEnd",
                            render: function(e) {
                                return (0, S.jsx)("a", {
                                    className: "content-link underline",
                                    href: "https://www.roblox.com/info/terms",
                                    rel: "noopener noreferrer",
                                    target: "_blank",
                                    children: e
                                })
                            }
                        }],
                        j = (i = null == (n = tq(g)) || null == (r = n.freeTrialOffer) ? void 0 : r.estimatedTrialEndDate) ? new Date(i).toLocaleDateString(void 0, {
                            year: "numeric",
                            month: "long",
                            day: "numeric"
                        }) : "",
                        T = d ? m("Description.EntrypointDisabled") : rd(m, x ? "Description.SubscriptionFreeTrialLegal" : "Description.SubscriptionLegal", E, x ? {
                            date: j
                        } : void 0),
                        N = u.isAndroidApp || u.isIosApp,
                        C = x ? m("Action.TryItForFree") : m("Action.PricePerMonth", {
                            price: null != (a = g.localizedPriceDisplayString) ? a : "",
                            periodType: g.periodType
                        });
                    return (0, S.jsx)(oS, {
                        open: s,
                        onOpenChange: l,
                        children: (0, S.jsxs)(oP, {
                            centerSheetSize: "Medium",
                            closeLabel: m("Action.Close"),
                            largeScreenVariant: "center",
                            children: [(0, S.jsx)(oI, {
                                children: m("Label.PickAPlan")
                            }), (0, S.jsx)(oO, {
                                className: "gap-y-medium padding-y-medium flex flex-col",
                                "data-testid": "bundle-picker-sheet-body",
                                children: c.map(function(e, t) {
                                    return (0, S.jsx)(oB, {
                                        isBundle: 0 !== t,
                                        isSelected: g.productKey.id === e.productKey.id,
                                        product: e,
                                        onSelect: function() {
                                            O(e.productKey.id)
                                        }
                                    }, e.productKey.id)
                                })
                            }), (0, S.jsx)(oE, {
                                children: (0, S.jsxs)("div", {
                                    className: "gap-y-small flex flex-col",
                                    children: [(0, S.jsx)(rp, {
                                        className: "width-full",
                                        deviceMeta: u,
                                        isDisabled: d,
                                        paymentSessionId: p,
                                        productId: null != v ? v : "",
                                        productType: g.productKey.type,
                                        size: "Medium",
                                        trackSubscriptionButtonClick: I,
                                        onSubscribeClick: N ? f : void 0,
                                        children: C
                                    }), (0, S.jsx)("p", {
                                        className: "text-caption-small content-muted text-align-x-left",
                                        "data-testid": "bundle-picker-legal-footer",
                                        children: T
                                    })]
                                })
                            })]
                        })
                    })
                },
                oz = window.Roblox["core-scripts"].deepLink,
                oq = {
                    itemId: 0x4b45c0ee905a,
                    itemType: oz.ItemType.Asset
                },
                oV = function(e) {
                    var t = e.itemId,
                        r = e.itemType;
                    return "roblox://navigation/item_details?itemId=".concat(t, "&itemType=").concat(r)
                },
                oW = function(e) {
                    return (0, oz.navigateToDeepLink)(oV(e))
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
                            s = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (s) throw n
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
                        s = e.isEntrypointDisabled,
                        l = e.onMobilePurchaseInitiated,
                        c = (0, P.useTranslation)().translate,
                        u = (null != (t = function() {
                            var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                            return function() {
                                var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0],
                                    t = ro((0, e3.useState)(e ? void 0 : tJ().getLocalStorage(ra)), 2),
                                    r = t[0],
                                    n = t[1],
                                    i = ro((0, e3.useState)(!1), 2),
                                    o = i[0],
                                    a = i[1],
                                    s = (0, e3.useCallback)(function(e) {
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
                                                return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                                    return this
                                                }), a;

                                                function s(s) {
                                                    return function(l) {
                                                        var c = [s, l];
                                                        if (r) throw TypeError("Generator is already executing.");
                                                        for (; a && (a = 0, c[0] && (o = 0)), o;) try {
                                                            if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                                                            switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                                                case 0:
                                                                case 1:
                                                                    i = c;
                                                                    break;
                                                                case 4:
                                                                    return o.label++, {
                                                                        value: c[1],
                                                                        done: !1
                                                                    };
                                                                case 5:
                                                                    o.label++, n = c[1], c = [0];
                                                                    continue;
                                                                case 7:
                                                                    c = o.ops.pop(), o.trys.pop();
                                                                    continue;
                                                                default:
                                                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                                        o = 0;
                                                                        continue
                                                                    }
                                                                    if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                                                        o.label = c[1];
                                                                        break
                                                                    }
                                                                    if (6 === c[0] && o.label < i[1]) {
                                                                        o.label = i[1], i = c;
                                                                        break
                                                                    }
                                                                    if (i && o.label < i[2]) {
                                                                        o.label = i[2], o.ops.push(c);
                                                                        break
                                                                    }
                                                                    i[2] && o.ops.pop(), o.trys.pop();
                                                                    continue
                                                            }
                                                            c = t.call(e, o)
                                                        } catch (e) {
                                                            c = [6, e], n = 0
                                                        } finally {
                                                            r = i = 0
                                                        }
                                                        if (5 & c[0]) throw c[1];
                                                        return {
                                                            value: c[0] ? c[1] : void 0,
                                                            done: !0
                                                        }
                                                    }
                                                }
                                            }(this, function(i) {
                                                switch (i.label) {
                                                    case 0:
                                                        if (!e) return [3, 2];
                                                        return [4, rt(function() {
                                                            return rr(this, function(t) {
                                                                return [2, t9(t3.GET, {
                                                                    withCredentials: !0,
                                                                    url: "".concat(tY.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions/").concat(e)
                                                                }, {
                                                                    feature: t5.PAYMENT,
                                                                    call: t6.GET_PAYMENT_SESSION
                                                                })]
                                                            })
                                                        })()];
                                                    case 1:
                                                        return r = i.sent(), [3, 4];
                                                    case 2:
                                                        return [4, rt(function() {
                                                            return rr(this, function(e) {
                                                                return [2, t9(t3.POST, {
                                                                    withCredentials: !0,
                                                                    url: "".concat(tY.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions")
                                                                }, {
                                                                    feature: t5.PAYMENT,
                                                                    call: t6.CREATE_PAYMENT_SESSION
                                                                }, {
                                                                    paymentFlowId: t0().getPaymentFlowUuid()
                                                                })]
                                                            })
                                                        })()];
                                                    case 3:
                                                        r = i.sent(), i.label = 4;
                                                    case 4:
                                                        if (!(t = r)) return [2];
                                                        return tJ().setLocalStorage(ra, t.paymentSession), n(t.paymentSession), [2]
                                                }
                                            })
                                        }, function() {
                                            var e = this,
                                                r = arguments;
                                            return new Promise(function(n, i) {
                                                var o = t.apply(e, r);

                                                function a(e) {
                                                    ri(o, n, i, a, s, "next", e)
                                                }

                                                function s(e) {
                                                    ri(o, n, i, a, s, "throw", e)
                                                }
                                                a(void 0)
                                            })
                                        })()
                                    }, []);
                                return (0, e3.useEffect)(function() {
                                    if (r) {
                                        new Date(r.expiresAt) < new Date && (a(!0), s());
                                        return
                                    }
                                    var e, t = null == (e = tQ.urlService.getQueryParam("paymentSessionId")) ? void 0 : e.toString();
                                    t || a(!0), s(t)
                                }, [s, r]), (0, e3.useMemo)(function() {
                                    return {
                                        paymentSession: r,
                                        wasCreatedByCurrentClient: o
                                    }
                                }, [r, o])
                            }(e).paymentSession
                        }()) ? t : {}).id,
                        d = a[0],
                        f = a.length > 1,
                        p = oY((0, e3.useState)(!1), 2),
                        m = p[0],
                        y = p[1],
                        h = (0, e3.useMemo)(function() {
                            return o$.arrivedGiftDate.toLocaleDateString(void 0, {
                                day: "2-digit",
                                month: "short",
                                year: "numeric"
                            })
                        }, []);
                    if (!d) throw Error("PurchaseView requires at least one subscription product");
                    var v = d.productKey,
                        b = v.id,
                        g = v.type,
                        x = (0, e3.useMemo)(function() {
                            return d.eligibleOffers.find(function(e) {
                                return "FreeTrial" === e.offerType
                            })
                        }, [d.eligibleOffers]),
                        w = null != x,
                        O = (0, e3.useMemo)(function() {
                            var e, t = null == x || null == (e = x.freeTrialOffer) ? void 0 : e.estimatedTrialEndDate;
                            return t ? new Date(t).toLocaleDateString(void 0, {
                                year: "numeric",
                                month: "long",
                                day: "numeric"
                            }) : ""
                        }, [x]),
                        I = (0, e3.useMemo)(function() {
                            return [{
                                opening: "linkStart",
                                closing: "linkEnd",
                                render: function(e) {
                                    return (0, S.jsx)("a", {
                                        className: "content-link underline",
                                        href: "https://www.roblox.com/info/terms",
                                        rel: "noopener noreferrer",
                                        target: "_blank",
                                        children: e
                                    })
                                }
                            }]
                        }, []),
                        E = s ? c("Description.EntrypointDisabled") : rd(c, w ? "Description.SubscriptionFreeTrialLegal" : "Description.SubscriptionLegal", I, w ? {
                            date: O
                        } : void 0),
                        j = (0, e3.useRef)(!1);
                    (0, e3.useEffect)(function() {
                        if (!j.current && u) {
                            j.current = !0;
                            var e = w ? tX.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : tX.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                            tX.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(tX.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, tX.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, tX.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, e, u ? {
                                paymentSessionId: u
                            } : {}), oU(o_.PURCHASE_VIEW_SHOWN, {
                                variant: f ? "multi" : "single",
                                tierCount: String(a.length),
                                isFreeTrial: String(w)
                            })
                        }
                    }, [u, w, f, a.length]);
                    var T = o.isAndroidApp || o.isIosApp,
                        N = oY((0, e3.useState)(null), 2),
                        C = N[0],
                        D = N[1],
                        A = (0, e3.useCallback)(function() {
                            var e = w ? tX.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : tX.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                            tX.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(tX.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, tX.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, tX.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, e, u ? {
                                paymentSessionId: u
                            } : {})
                        }, [w, u]),
                        R = c(w ? "Action.TryItForFree" : "Action.Subscribe"),
                        k = {
                            productId: b,
                            productType: g,
                            deviceMeta: o,
                            isDisabled: s,
                            paymentSessionId: u,
                            trackSubscriptionButtonClick: A,
                            onSubscribeClick: T ? l : void 0
                        },
                        M = function() {
                            s || (oU(o_.PURCHASE_VIEW_OPEN_SHEET_CLICK), y(!0))
                        },
                        _ = function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "Large";
                            return (0, S.jsx)(tE, {
                                className: e,
                                "data-testid": "purchase-open-sheet-button",
                                isDisabled: s,
                                size: t,
                                variant: "Emphasis",
                                onClick: M,
                                children: R
                            })
                        },
                        U = rd(c, "Label.PlusLandingPage.Subtitle.V3", [{
                            opening: "boldStart",
                            closing: "boldEnd",
                            render: function(e) {
                                return (0, S.jsx)("span", {
                                    className: "text-heading-small",
                                    children: e
                                })
                            }
                        }], {
                            price: null != (r = d.localizedPriceDisplayString) ? r : "",
                            periodType: d.periodType
                        }),
                        L = (0, S.jsxs)("div", {
                            "aria-label": c("Action.Subscribe"),
                            className: "bottom-dock padding-t-medium bg-surface-100 large:hidden width-full gap-y-medium flex flex-col",
                            "data-testid": "purchase-subscribe-dock",
                            role: "region",
                            children: [(0, S.jsx)(tF, {}), (0, S.jsxs)("div", {
                                className: "width-full gap-y-medium padding-b-[env(safe-area-inset-bottom\\,0px)] padding-x-xxlarge flex flex-col items-stretch",
                                children: [f ? _("min-width-0 width-full") : (0, S.jsx)(rp, oX(oH({}, k), {
                                    className: "min-width-0 width-full",
                                    size: "Medium",
                                    children: R
                                })), (0, S.jsx)("p", {
                                    className: "text-caption-small content-muted margin-bottom-[24px] large:margin-bottom-none padding-x-xsmall text-align-x-start",
                                    children: E
                                })]
                            })]
                        });
                    return (0, S.jsxs)(e3.Fragment, {
                        children: [(0, S.jsx)(tB, {}), (0, S.jsx)("div", {
                            className: "width-full min-width-0 large:items-center flex flex-col items-start",
                            children: (0, S.jsxs)("div", {
                                className: "margin-top-[48px] width-full min-width-0 content-emphasis large:max-width-[730px] large:gap-y-[32px] large:self-auto large:padding-x-xlarge flex flex-col gap-y-[32px] self-stretch",
                                children: [o$.enabled && (0, S.jsx)("div", {
                                    className: "width-full min-width-0 padding-x-xxlarge large:padding-x-none",
                                    children: (0, S.jsx)(rm, {
                                        body: c("Description.BannerBodyArrivedPurchase", {
                                            date: h
                                        }),
                                        title: c("Description.BannerTitleArrivedPurchase"),
                                        onItemDetailsClick: function() {
                                            oW(oq).catch(function() {})
                                        }
                                    })
                                }), (0, S.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge text-align-x-start large:gap-y-[24px] large:items-center large:padding-x-none large:text-align-x-center flex flex-col items-start",
                                    children: [(0, S.jsxs)("div", {
                                        className: "gap-y-xsmall large:items-center flex flex-col items-start",
                                        children: [(0, S.jsx)(ry, {
                                            variant: "compact"
                                        }), (0, S.jsxs)("h1", {
                                            className: "font-builder-extended text-display-small large:![font-size:var(--font-size-1000)] content-emphasis ![font-size:var(--font-size-800)]",
                                            children: [(0, S.jsx)("span", {
                                                className: "large:inline block",
                                                children: c("Title.PurchasePromoHeadlinePart1")
                                            }), (0, S.jsx)("span", {
                                                className: "large:inline hidden",
                                                children: "\xa0"
                                            }), (0, S.jsx)("span", {
                                                className: "large:inline block",
                                                children: c("Title.PurchasePromoHeadlinePart2")
                                            })]
                                        })]
                                    }), (0, S.jsxs)("div", {
                                        className: "gap-y-xsmall width-full min-width-0 large:text-align-x-center flex flex-col",
                                        children: [f ? (0, S.jsx)("span", {
                                            className: "text-body-large content-emphasis",
                                            children: U
                                        }) : (0, S.jsx)(rb, {
                                            eligibleOffers: d.eligibleOffers,
                                            periodType: d.periodType,
                                            price: d.localizedPrice
                                        }), (0, S.jsx)("div", {
                                            className: "width-full gap-y-medium padding-t-none large:margin-x-auto large:margin-top-[24px] large:flex large:max-width-[min(440px,100%)] large:width-full large:flex-col large:items-center hidden items-start",
                                            children: (0, S.jsx)("div", {
                                                className: "width-full gap-x-small flex shrink-0 flex-row items-start justify-center",
                                                children: f ? _("width-full large:width-[230px] shrink-0", "Medium") : (0, S.jsx)(rp, oX(oH({}, k), {
                                                    className: "width-full large:width-[230px] shrink-0",
                                                    size: "Medium",
                                                    children: R
                                                }))
                                            })
                                        })]
                                    })]
                                }), (0, S.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge large:padding-x-none flex flex-col",
                                    children: [(0, S.jsx)("span", {
                                        className: "text-heading-small",
                                        children: c("Title.Benefits", {
                                            productShort: c("Label.BlackbirdShort")
                                        })
                                    }), (0, S.jsx)("div", {
                                        className: "width-full padding-b-xlarge large:padding-b-none",
                                        children: (0, S.jsx)(tU, {
                                            featureConfig: tG(d),
                                            periodType: d.periodType,
                                            onTileClick: function(e, t) {
                                                D({
                                                    primary: e,
                                                    secondary: t
                                                })
                                            }
                                        })
                                    }), (0, S.jsx)("p", {
                                        className: "text-caption-small content-muted padding-x-xsmall text-align-x-start large:block large:padding-x-none hidden",
                                        "data-testid": "purchase-legal-footer",
                                        children: E
                                    })]
                                })]
                            })
                        }), L, (0, S.jsx)(i4, {
                            body: null != (n = null == C ? void 0 : C.secondary) ? n : "",
                            open: null != C,
                            title: null != (i = null == C ? void 0 : C.primary) ? i : "",
                            onOpenChange: function(e) {
                                e || D(null)
                            }
                        }), f && (0, S.jsx)(oG, {
                            deviceMeta: o,
                            isEntrypointDisabled: s,
                            isOpen: m,
                            paymentSessionId: u,
                            products: a,
                            onMobilePurchaseInitiated: l,
                            onOpenChange: y
                        })]
                    })
                },
                oQ = function(e) {
                    var t = e.title,
                        r = e.body;
                    return (0, S.jsxs)("div", {
                        className: "bg-shift-200 radius-medium padding-medium gap-medium width-full flex items-center",
                        children: [(0, S.jsx)("div", {
                            className: "radius-medium size-[50px] shrink-0 flex items-center justify-center",
                            children: (0, S.jsx)(e7, {
                                className: "!size-900",
                                name: "icon-regular-roblox-plus"
                            })
                        }), (0, S.jsxs)("div", {
                            className: "min-width-0 grow-1 shrink-1 flex basis-0 flex-col justify-center",
                            children: [(0, S.jsx)("span", {
                                className: "text-title-medium content-emphasis",
                                children: t
                            }), (0, S.jsx)("span", {
                                className: "text-body-medium content-default",
                                children: r
                            })]
                        })]
                    })
                };

            function oZ(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var o0 = function(e, t) {
                return (o0 = Object.setPrototypeOf || oZ({
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
                            l(n.next(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function s(e) {
                        try {
                            l(n.throw(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function l(e) {
                        var t;
                        e.done ? i(e.value) : (oZ(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, s)
                    }
                    l((n = n.apply(e, t || [])).next())
                })
            }

            function o4(e, t) {
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
                return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function s(s) {
                    return function(l) {
                        var c = [s, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, c[0] && (o = 0)), o;) try {
                            if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                            switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                case 0:
                                case 1:
                                    i = c;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                        o.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && o.label < i[1]) {
                                        o.label = i[1], i = c;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(c);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            c = t.call(e, o)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            "function" == typeof SuppressedError && SuppressedError;

            function o3(e) {
                var t;
                return null == (t = e) ? t : {
                    periodIndex: t.periodIndex,
                    discountPercent: t.discountPercent
                }
            }
            var o5 = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return o1(t, e), t.prototype.robloxPlusGetRobloxPlusUserBenefitsRaw = function(e) {
                        return o2(this, void 0, void 0, function() {
                            var t, r;
                            return o4(this, function(n) {
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
                            return o4(this, function(t) {
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
                }(eR),
                o6 = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return o1(t, e), t.prototype.robloxSubscriptionMetadataGetRobloxSubscriptionMetadataRaw = function(e, t) {
                        return o2(this, void 0, void 0, function() {
                            var r, n;
                            return o4(this, function(i) {
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
                                                    subscriptionsVariant: eU(r, "subscriptionsVariant") ? r.subscriptionsVariant : void 0
                                                }
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.robloxSubscriptionMetadataGetRobloxSubscriptionMetadata = function() {
                        return o2(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), o4(this, function(r) {
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
                }(eR),
                o8 = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return o1(t, e), t.prototype.robloxSubscriptionProductsGetRobloxSubscriptionProductRaw = function(e, t) {
                        return o2(this, void 0, void 0, function() {
                            var r, n;
                            return o4(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.robloxSubscriptionProductId || void 0 === e.robloxSubscriptionProductId) throw new e_("robloxSubscriptionProductId", "Required parameter requestParameters.robloxSubscriptionProductId was null or undefined when calling robloxSubscriptionProductsGetRobloxSubscriptionProduct.");
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
                                                        virtualTransactionDiscounts: null === n.virtualTransactionDiscounts ? null : n.virtualTransactionDiscounts.map(o3),
                                                        isRobuxTransferEnabled: n.isRobuxTransferEnabled,
                                                        isTradingEnabled: n.isTradingEnabled,
                                                        isUgcPublishingEnabled: n.isUgcPublishingEnabled,
                                                        privateServerDiscounts: null === n.privateServerDiscounts ? null : n.privateServerDiscounts.map(o3),
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
                            return o4(this, function(r) {
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
                }(eR),
                o7 = function(e, t) {
                    return new Date(Date.UTC(e, t + 1, 0)).getUTCDate()
                },
                o9 = function(e, t) {
                    var r = e.getUTCFullYear(),
                        n = e.getUTCMonth(),
                        i = e.getUTCDate(),
                        o = n + t,
                        a = r + Math.floor(o / 12),
                        s = (o % 12 + 12) % 12,
                        l = Math.min(i, o7(a, s));
                    return new Date(Date.UTC(a, s, l, e.getUTCHours(), e.getUTCMinutes(), e.getUTCSeconds(), e.getUTCMilliseconds()))
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
                        a = (0, P.useTranslation)(),
                        s = a.translate,
                        l = a.intl,
                        c = (0, e3.useMemo)(function() {
                            if (!r) return null;
                            var e = Date.now(),
                                t = at(n, r.periodIndex, o).getTime();
                            return {
                                discountPercent: r.discountPercent,
                                targetDateDaysUntil: Math.max(0, Math.ceil((t - e) / 864e5)),
                                targetDateProgressPercent: Math.min(Math.max(0, (e - n) / (t - n) * 100), 100)
                            }
                        }, [r, n, o]);
                    if (null === c && 0 === t) return null;
                    var u = null === c,
                        d = null !== c && c.targetDateDaysUntil <= 15,
                        f = function(e) {
                            return (0, S.jsxs)("div", {
                                className: "margin-right-[-16px] relative flex size-[60px] shrink-0 items-center justify-center",
                                children: [(0, S.jsx)("div", {
                                    "aria-hidden": !0,
                                    className: "stroke-emphasis stroke-standard absolute inset-[0] rounded-[2.4px] [transform:rotate(-15deg)]"
                                }), e]
                            })
                        };
                    return (0, S.jsxs)("div", {
                        className: "radius-medium padding-large bg-shift-200 width-full gap-x-small flex items-center justify-between [overflow:clip]",
                        children: [(0, S.jsxs)("div", {
                            className: "gap-y-small min-width-0 flex flex-col items-start justify-center",
                            children: [(0, S.jsx)("span", {
                                className: "text-title-medium content-default",
                                children: i ? s(u ? "Description.Benefit.DiscountStaySubscribedToKeep" : "Description.Benefit.DiscountStaySubscribedToGet") : u ? s("Description.Benefit.DiscountMaxReached") : s("Description.Benefit.DiscountCurrent", {
                                    discountPercent: l.n(.01 * t, {
                                        style: "percent"
                                    })
                                })
                            }), (0, S.jsx)("span", {
                                className: "text-heading-large content-emphasis",
                                children: u ? s(i ? "Description.Benefit.DiscountAllPurchases" : "Description.Benefit.DiscountUnlocked", {
                                    discountPercent: l.n(.01 * t, {
                                        style: "percent"
                                    })
                                }) : s("Description.Benefit.DiscountOffInDays", {
                                    discountPercent: l.n(.01 * c.discountPercent, {
                                        style: "percent"
                                    }),
                                    dayCount: c.targetDateDaysUntil
                                })
                            })]
                        }), (0, S.jsx)("div", {
                            className: "shrink-0",
                            children: u ? f((0, S.jsx)(e7, {
                                name: "icon-regular-circle-check",
                                size: "XLarge"
                            })) : d && !i ? (0, S.jsx)(tK, {
                                ariaLabel: s("Label.Progress"),
                                className: "[--fui-future-alpha-color-system-progress:var(--color-content-emphasis)]",
                                size: "Large",
                                value: c.targetDateProgressPercent,
                                variant: "Determinate"
                            }) : f((0, S.jsx)(e7, {
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
                        n = (0, P.useTranslation)().translate,
                        i = (t = (0, e3.useState)(!1), function(e) {
                            if (Array.isArray(e)) return e
                        }(t) || function(e, t) {
                            var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != i) {
                                var o = [],
                                    a = !0,
                                    s = !1;
                                try {
                                    for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), o.length !== t); a = !0);
                                } catch (e) {
                                    s = !0, n = e
                                } finally {
                                    try {
                                        a || null == i.return || i.return()
                                    } finally {
                                        if (s) throw n
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
                        s = (0, e3.useCallback)(function() {
                            a(!0)
                        }, []),
                        l = (0, e3.useMemo)(function() {
                            var e = new URL("/my/account#!/subscriptions", window.location.origin);
                            return e.searchParams.append("id", r.productKey.id), e.searchParams.append("type", r.productKey.type), e.toString()
                        }, [r.productKey.id, r.productKey.type]);
                    return (0, S.jsx)(tE, {
                        as: "a",
                        href: l,
                        isLoading: o,
                        variant: "Standard",
                        onClick: s,
                        children: n("Action.Manage")
                    })
                },
                aa = function(e) {
                    var t = e.title,
                        r = e.value;
                    return (0, S.jsxs)("div", {
                        className: "radius-medium bg-shift-200 padding-large gap-y-small min-width-0 grow-1 flex basis-0 flex-col",
                        children: [(0, S.jsx)("span", {
                            className: "text-title-medium content-default",
                            children: t
                        }), (0, S.jsx)("span", {
                            className: "text-heading-large content-emphasis",
                            children: r
                        })]
                    })
                },
                as = function(e) {
                    var t = e.currentDiscountPercent,
                        r = e.savedRobux,
                        n = e.itemsBoughtWithDiscountCount,
                        i = e.privateServersCreatedCount,
                        o = e.robuxSentToFriendsCount,
                        a = (0, P.useTranslation)(),
                        s = a.translate,
                        l = a.intl;
                    return (0, S.jsxs)("div", {
                        className: "gap-y-large flex flex-col",
                        children: [(0, S.jsxs)("div", {
                            className: "gap-x-xsmall text-heading-small content-emphasis wrap flex items-center",
                            children: [(0, S.jsx)("span", {
                                children: s("Heading.SavingsYouveSaved")
                            }), (0, S.jsx)(e7, {
                                name: "icon-regular-robux",
                                size: "Medium"
                            }), (0, S.jsx)("span", {
                                children: void 0 === r ? "—" : l.n(r)
                            }), (0, S.jsx)("span", {
                                children: s("Heading.SavingsWithPlus")
                            })]
                        }), (0, S.jsxs)("div", {
                            className: "gap-y-small flex flex-col",
                            children: [(0, S.jsxs)("div", {
                                className: "gap-x-small flex",
                                children: [(0, S.jsx)(aa, {
                                    title: s("Label.Savings.InGameItems"),
                                    value: s("Label.Savings.PercentOff", {
                                        discountPercent: l.n(.01 * t, {
                                            style: "percent"
                                        })
                                    })
                                }), (0, S.jsx)(aa, {
                                    title: s("Label.Savings.ItemsBought"),
                                    value: void 0 === n ? "—" : l.n(n)
                                })]
                            }), (0, S.jsxs)("div", {
                                className: "gap-x-small flex",
                                children: [(0, S.jsx)(aa, {
                                    title: s("Label.Savings.PrivateServers"),
                                    value: void 0 === i ? "—" : l.n(i)
                                }), (0, S.jsx)(aa, {
                                    title: s("Label.Savings.RobuxSent"),
                                    value: (0, S.jsxs)("span", {
                                        className: "gap-x-xsmall flex items-center",
                                        children: [(0, S.jsx)(e7, {
                                            name: "icon-regular-robux",
                                            size: "Medium"
                                        }), void 0 === o ? "—" : l.n(o)]
                                    })
                                })]
                            }), (0, S.jsx)("span", {
                                className: "text-caption-medium content-muted",
                                children: s("Description.SavingsDataDelay")
                            })]
                        })]
                    })
                };

            function al(e) {
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

            function ac(e, t) {
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
                ah = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-medium"
                },
                av = {
                    Small: "padding-left-xsmall",
                    Medium: "padding-left-[var(--size-150)]",
                    Large: "padding-left-small"
                },
                ab = {
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
                    return null != t ? e5().createElement(e7, {
                        name: t,
                        size: ad[n]
                    }) : null != r ? e5().createElement("span", {
                        className: e6("inline-flex items-center justify-center shrink-0", ax[n])
                    }, r) : null
                },
                aS = (0, e3.forwardRef)(function(e, t) {
                    var r = e.className,
                        n = e.style,
                        i = e.text,
                        o = e.isDisabled,
                        a = void 0 !== o && o,
                        s = e.size,
                        l = void 0 === s ? "Medium" : s,
                        c = e.variant,
                        u = void 0 === c ? "Standard" : c,
                        d = e.leadingIconName,
                        f = e.leadingIconNode,
                        p = e.trailingIconName,
                        m = e.trailingIconNode,
                        y = au(e, ["className", "style", "text", "isDisabled", "size", "variant", "leadingIconName", "leadingIconNode", "trailingIconName", "trailingIconNode"]),
                        h = null != d || null != f,
                        v = null != p || null != m,
                        b = e6(a ? tt : [e9, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", h ? am[l] : ap[l], v ? ah[l] : ay[l], af[l], r),
                        g = e5().createElement(e5().Fragment, null, e5().createElement(te, null), e5().createElement(aw, {
                            iconName: d,
                            node: f,
                            size: l
                        }), e5().createElement("span", {
                            className: e6("padding-y-xsmall text-no-wrap text-truncate-end", h && av[l], v && ab[l])
                        }, i), e5().createElement(aw, {
                            iconName: p,
                            node: m,
                            size: l
                        })),
                        x = al({
                            textDecoration: "none"
                        }, n);
                    if ("a" === y.as) {
                        y.as;
                        var w = y.href,
                            S = au(y, ["as", "href"]);
                        return e5().createElement("a", ac(al({
                            ref: t
                        }, S), {
                            "aria-disabled": a,
                            href: a ? void 0 : w,
                            className: e6(b, ag[u], "content-action-utility"),
                            style: x
                        }), g)
                    }
                    y.as;
                    var P = y.isChecked,
                        O = y.onCheckedChange,
                        I = au(y, ["as", "isChecked", "onCheckedChange"]);
                    return e5().createElement("button", ac(al({
                        ref: t,
                        type: "button"
                    }, I), {
                        className: e6(P ? "bg-inverse-surface-0" : ag[u], P ? "content-inverse-emphasis" : "content-action-utility", b),
                        style: x,
                        "aria-pressed": P,
                        disabled: a,
                        onClick: null == O ? void 0 : function() {
                            return O(!P)
                        }
                    }), g)
                }),
                aP = function(e) {
                    var t = e.activationTimestampMs,
                        r = e.expirationTimestampMs,
                        n = e.nextRenewalTimestampMs,
                        i = e.hasFreeTrial,
                        o = (0, P.useTranslation)(),
                        a = o.translate,
                        s = o.intl,
                        l = (0, e3.useMemo)(function() {
                            return s.getDateTimeFormatter()
                        }, [s]),
                        c = null === n || 0 === n;
                    return (0, S.jsxs)("div", {
                        className: "gap-x-small flex items-center",
                        children: [(0, S.jsx)("span", {
                            className: "text-body-medium content-emphasis",
                            children: c ? a("Description.ActiveUntil", {
                                date: l.getCustomDateTime(r, {
                                    month: "long",
                                    day: "numeric",
                                    year: "numeric"
                                })
                            }) : a("Description.SubscribedSince", {
                                date: l.getCustomDateTime(t, {
                                    month: "long",
                                    day: "numeric",
                                    year: "numeric"
                                })
                            })
                        }), c ? (0, S.jsx)(aS, {
                            className: "bg-system-warning light-mode-content-emphasis pointer-events-none",
                            isChecked: !1,
                            size: "Small",
                            text: a("Label.Status.AutoRenewOff")
                        }) : i ? (0, S.jsx)(aS, {
                            className: "bg-shift-300 content-emphasis pointer-events-none",
                            isChecked: !1,
                            size: "Small",
                            text: a("Label.Status.Freetrial")
                        }) : (0, S.jsx)(aS, {
                            className: "bg-shift-300 content-emphasis pointer-events-none",
                            isChecked: !1,
                            size: "Small",
                            text: a("Label.Status.Active")
                        })]
                    })
                },
                aO = function(e) {
                    var t = e.featureConfig,
                        r = (0, P.useTranslation)().translate;
                    return (0, S.jsxs)("div", {
                        className: "gap-y-medium flex flex-col",
                        children: [(0, S.jsx)("span", {
                            className: "text-heading-medium",
                            children: r("Label.ExploreMoreBenefits")
                        }), (0, S.jsxs)("div", {
                            className: "foundation-web-list-item-container",
                            children: [t.isTradingEnabled && (0, S.jsx)(tR, {
                                description: r("Description.Benefit.TradeResellItemsSubtitle"),
                                divider: "None",
                                isContained: !0,
                                leading: (0, S.jsx)(e7, {
                                    name: "icon-regular-hand-two-arrows-horizontal",
                                    size: "Medium"
                                }),
                                size: "Medium",
                                title: r("Description.Benefit.TradeResellItems"),
                                trailing: (0, S.jsx)(e7, {
                                    name: "icon-regular-chevron-small-right"
                                }),
                                onSelect: function() {
                                    window.location.href = "https://help.roblox.com/hc/articles/203313310-Trading-System"
                                }
                            }), t.isUgcPublishingEnabled && (0, S.jsx)(tR, {
                                description: r("Description.Benefit.PublishItemsSubtitle"),
                                divider: "None",
                                isContained: !0,
                                leading: (0, S.jsx)(e7, {
                                    name: "icon-regular-arrow-up-from-landscape-rectangle",
                                    size: "Medium"
                                }),
                                size: "Medium",
                                title: r("Description.Benefit.PublishItems"),
                                trailing: (0, S.jsx)(e7, {
                                    name: "icon-regular-chevron-small-right"
                                }),
                                onSelect: function() {
                                    window.location.href = "https://help.roblox.com/hc/articles/203313180-Creating-and-Selling-Avatar-Items"
                                }
                            })]
                        })]
                    })
                },
                aI = window.Roblox["core-scripts"].meta.user;

            function aE(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var aj = function(e, t) {
                return (aj = Object.setPrototypeOf || aE({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function aT(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function r() {
                    this.constructor = e
                }
                aj(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
            }

            function aN(e, t, r, n) {
                return new(r || (r = Promise))(function(i, o) {
                    function a(e) {
                        try {
                            l(n.next(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function s(e) {
                        try {
                            l(n.throw(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function l(e) {
                        var t;
                        e.done ? i(e.value) : (aE(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, s)
                    }
                    l((n = n.apply(e, t || [])).next())
                })
            }

            function aC(e, t) {
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
                return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function s(s) {
                    return function(l) {
                        var c = [s, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, c[0] && (o = 0)), o;) try {
                            if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                            switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                case 0:
                                case 1:
                                    i = c;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                        o.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && o.label < i[1]) {
                                        o.label = i[1], i = c;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(c);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            c = t.call(e, o)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function aD(e) {
                var t;
                return null == (t = e) ? t : {
                    name: eU(t, "name") ? t.name : void 0,
                    displayName: eU(t, "displayName") ? t.displayName : void 0,
                    filter: eU(t, "filter") ? t.filter : void 0,
                    id: eU(t, "id") ? t.id : void 0,
                    type: eU(t, "type") ? t.type : void 0,
                    categoryType: eU(t, "categoryType") ? t.categoryType : void 0
                }
            }

            function aA(e) {
                var t;
                return null == (t = e) ? t : {
                    name: eU(t, "name") ? t.name : void 0,
                    displayName: eU(t, "displayName") ? t.displayName : void 0,
                    categoryType: eU(t, "categoryType") ? t.categoryType : void 0,
                    items: eU(t, "items") ? t.items.map(aD) : void 0
                }
            }
            "function" == typeof SuppressedError && SuppressedError;

            function aR(e, t) {
                return null == e ? e : {
                    categories: eU(e, "categories") ? e.categories.map(aA) : void 0
                }
            }

            function ak(e) {
                var t;
                return null == (t = e) ? t : {
                    userAssetId: eU(t, "userAssetId") ? t.userAssetId : void 0,
                    serialNumber: eU(t, "serialNumber") ? t.serialNumber : void 0,
                    assetId: eU(t, "assetId") ? t.assetId : void 0,
                    name: eU(t, "name") ? t.name : void 0,
                    recentAveragePrice: eU(t, "recentAveragePrice") ? t.recentAveragePrice : void 0,
                    originalPrice: eU(t, "originalPrice") ? t.originalPrice : void 0,
                    assetStock: eU(t, "assetStock") ? t.assetStock : void 0,
                    buildersClubMembershipType: eU(t, "buildersClubMembershipType") ? t.buildersClubMembershipType : void 0,
                    isOnHold: eU(t, "isOnHold") ? t.isOnHold : void 0
                }
            }

            function aM(e) {
                var t;
                return null == (t = e) ? t : {
                    id: eU(t, "id") ? t.id : void 0,
                    name: eU(t, "name") ? t.name : void 0,
                    type: eU(t, "type") ? t.type : void 0,
                    instanceId: eU(t, "instanceId") ? t.instanceId : void 0
                }
            }

            function a_(e) {
                var t, r;
                return null == (t = e) ? t : {
                    universeId: eU(t, "universeId") ? t.universeId : void 0,
                    placeId: eU(t, "placeId") ? t.placeId : void 0,
                    name: eU(t, "name") ? t.name : void 0,
                    creator: eU(t, "creator") ? null == (r = t.creator) ? r : {
                        id: eU(r, "id") ? r.id : void 0,
                        name: eU(r, "name") ? r.name : void 0,
                        type: eU(r, "type") ? r.type : void 0
                    } : void 0,
                    priceInRobux: eU(t, "priceInRobux") ? t.priceInRobux : void 0
                }
            }(function(e) {
                function t() {
                    return null !== e && e.apply(this, arguments) || this
                }
                aT(t, e), t.prototype.v1PackagesPackageIdAssetsGetRaw = function(e, t) {
                    return aN(this, void 0, void 0, function() {
                        var r, n;
                        return aC(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    if (null === e.packageID || void 0 === e.packageID) throw new e_("packageID", "Required parameter requestParameters.packageID was null or undefined when calling v1PackagesPackageIdAssetsGet.");
                                    return r = {}, n = {}, [4, this.request({
                                        path: "/v1/packages/{packageId}/assets".replace("{".concat("packageID", "}"), encodeURIComponent(String(e.packageID))),
                                        schemaPath: "/v1/packages/{packageId}/assets",
                                        method: "GET",
                                        headers: n,
                                        query: r
                                    }, t)];
                                case 1:
                                    return [2, new eL(i.sent(), function(e) {
                                        return null == e ? e : {
                                            assetIds: eU(e, "assetIds") ? e.assetIds : void 0
                                        }
                                    })]
                            }
                        })
                    })
                }, t.prototype.v1PackagesPackageIdAssetsGet = function(e, t) {
                    return aN(this, void 0, void 0, function() {
                        return aC(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    return [4, this.v1PackagesPackageIdAssetsGetRaw(e, t)];
                                case 1:
                                    return [4, r.sent().value()];
                                case 2:
                                    return [2, r.sent()]
                            }
                        })
                    })
                }
            })(eR),
            function(e) {
                function t() {
                    return null !== e && e.apply(this, arguments) || this
                }
                aT(t, e), t.prototype.v1CollectionsItemsItemTypeItemTargetIdDeleteRaw = function(e, t) {
                    return aN(this, void 0, void 0, function() {
                        var r, n;
                        return aC(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    if (null === e.itemType || void 0 === e.itemType) throw new e_("itemType", "Required parameter requestParameters.itemType was null or undefined when calling v1CollectionsItemsItemTypeItemTargetIdDelete.");
                                    if (null === e.itemTargetId || void 0 === e.itemTargetId) throw new e_("itemTargetId", "Required parameter requestParameters.itemTargetId was null or undefined when calling v1CollectionsItemsItemTypeItemTargetIdDelete.");
                                    return r = {}, n = {}, [4, this.request({
                                        path: "/v1/collections/items/{itemType}/{itemTargetId}".replace("{".concat("itemType", "}"), encodeURIComponent(String(e.itemType))).replace("{".concat("itemTargetId", "}"), encodeURIComponent(String(e.itemTargetId))),
                                        schemaPath: "/v1/collections/items/{itemType}/{itemTargetId}",
                                        method: "DELETE",
                                        headers: n,
                                        query: r
                                    }, t)];
                                case 1:
                                    return [2, new eL(i.sent())]
                            }
                        })
                    })
                }, t.prototype.v1CollectionsItemsItemTypeItemTargetIdDelete = function(e, t) {
                    return aN(this, void 0, void 0, function() {
                        return aC(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    return [4, this.v1CollectionsItemsItemTypeItemTargetIdDeleteRaw(e, t)];
                                case 1:
                                    return [4, r.sent().value()];
                                case 2:
                                    return [2, r.sent()]
                            }
                        })
                    })
                }, t.prototype.v1CollectionsItemsItemTypeItemTargetIdPostRaw = function(e, t) {
                    return aN(this, void 0, void 0, function() {
                        var r, n;
                        return aC(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    if (null === e.itemType || void 0 === e.itemType) throw new e_("itemType", "Required parameter requestParameters.itemType was null or undefined when calling v1CollectionsItemsItemTypeItemTargetIdPost.");
                                    if (null === e.itemTargetId || void 0 === e.itemTargetId) throw new e_("itemTargetId", "Required parameter requestParameters.itemTargetId was null or undefined when calling v1CollectionsItemsItemTypeItemTargetIdPost.");
                                    return r = {}, n = {}, [4, this.request({
                                        path: "/v1/collections/items/{itemType}/{itemTargetId}".replace("{".concat("itemType", "}"), encodeURIComponent(String(e.itemType))).replace("{".concat("itemTargetId", "}"), encodeURIComponent(String(e.itemTargetId))),
                                        schemaPath: "/v1/collections/items/{itemType}/{itemTargetId}",
                                        method: "POST",
                                        headers: n,
                                        query: r
                                    }, t)];
                                case 1:
                                    return [2, new eL(i.sent())]
                            }
                        })
                    })
                }, t.prototype.v1CollectionsItemsItemTypeItemTargetIdPost = function(e, t) {
                    return aN(this, void 0, void 0, function() {
                        return aC(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    return [4, this.v1CollectionsItemsItemTypeItemTargetIdPostRaw(e, t)];
                                case 1:
                                    return [4, r.sent().value()];
                                case 2:
                                    return [2, r.sent()]
                            }
                        })
                    })
                }
            }(eR);
            var aU = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return aT(t, e), t.prototype.v1UsersUserIdAssetsCollectiblesGetRaw = function(e, t) {
                        return aN(this, void 0, void 0, function() {
                            var r, n;
                            return aC(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new e_("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdAssetsCollectiblesGet.");
                                        return r = {}, void 0 !== e.assetType && (r.assetType = e.assetType), void 0 !== e.limit && (r.limit = e.limit), void 0 !== e.cursor && (r.cursor = e.cursor), void 0 !== e.sortOrder && (r.sortOrder = e.sortOrder), n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/assets/collectibles".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                            schemaPath: "/v1/users/{userId}/assets/collectibles",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(i.sent(), function(e) {
                                            return null == e ? e : {
                                                previousPageCursor: eU(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                                nextPageCursor: eU(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                                data: eU(e, "data") ? e.data.map(ak) : void 0
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdAssetsCollectiblesGet = function(e, t) {
                        return aN(this, void 0, void 0, function() {
                            return aC(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.v1UsersUserIdAssetsCollectiblesGetRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdCanViewInventoryGetRaw = function(e, t) {
                        return aN(this, void 0, void 0, function() {
                            var r, n;
                            return aC(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new e_("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdCanViewInventoryGet.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/can-view-inventory".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                            schemaPath: "/v1/users/{userId}/can-view-inventory",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(i.sent(), function(e) {
                                            return null == e ? e : {
                                                canView: eU(e, "canView") ? e.canView : void 0
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdCanViewInventoryGet = function(e, t) {
                        return aN(this, void 0, void 0, function() {
                            return aC(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.v1UsersUserIdCanViewInventoryGetRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdCategoriesFavoritesGetRaw = function(e, t) {
                        return aN(this, void 0, void 0, function() {
                            var r, n;
                            return aC(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new e_("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdCategoriesFavoritesGet.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/categories/favorites".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                            schemaPath: "/v1/users/{userId}/categories/favorites",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(i.sent(), function(e) {
                                            return aR(e)
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdCategoriesFavoritesGet = function(e, t) {
                        return aN(this, void 0, void 0, function() {
                            return aC(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.v1UsersUserIdCategoriesFavoritesGetRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdCategoriesGetRaw = function(e, t) {
                        return aN(this, void 0, void 0, function() {
                            var r, n;
                            return aC(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new e_("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdCategoriesGet.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/categories".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                            schemaPath: "/v1/users/{userId}/categories",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(i.sent(), function(e) {
                                            return aR(e)
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdCategoriesGet = function(e, t) {
                        return aN(this, void 0, void 0, function() {
                            return aC(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.v1UsersUserIdCategoriesGetRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdItemsItemTypeItemTargetIdGetRaw = function(e, t) {
                        return aN(this, void 0, void 0, function() {
                            var r, n;
                            return aC(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new e_("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdGet.");
                                        if (null === e.itemType || void 0 === e.itemType) throw new e_("itemType", "Required parameter requestParameters.itemType was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdGet.");
                                        if (null === e.itemTargetId || void 0 === e.itemTargetId) throw new e_("itemTargetId", "Required parameter requestParameters.itemTargetId was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdGet.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/items/{itemType}/{itemTargetId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("itemType", "}"), encodeURIComponent(String(e.itemType))).replace("{".concat("itemTargetId", "}"), encodeURIComponent(String(e.itemTargetId))),
                                            schemaPath: "/v1/users/{userId}/items/{itemType}/{itemTargetId}",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(i.sent(), function(e) {
                                            return null == e ? e : {
                                                previousPageCursor: eU(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                                nextPageCursor: eU(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                                data: eU(e, "data") ? e.data.map(aM) : void 0
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdItemsItemTypeItemTargetIdGet = function(e, t) {
                        return aN(this, void 0, void 0, function() {
                            return aC(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.v1UsersUserIdItemsItemTypeItemTargetIdGetRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGetRaw = function(e, t) {
                        return aN(this, void 0, void 0, function() {
                            var r, n, i;
                            return aC(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new e_("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet.");
                                        if (null === e.itemType || void 0 === e.itemType) throw new e_("itemType", "Required parameter requestParameters.itemType was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet.");
                                        if (null === e.itemTargetId || void 0 === e.itemTargetId) throw new e_("itemTargetId", "Required parameter requestParameters.itemTargetId was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/items/{itemType}/{itemTargetId}/is-owned".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("itemType", "}"), encodeURIComponent(String(e.itemType))).replace("{".concat("itemTargetId", "}"), encodeURIComponent(String(e.itemTargetId))),
                                            schemaPath: "/v1/users/{userId}/items/{itemType}/{itemTargetId}/is-owned",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return i = o.sent(), this.isJsonMime(i.headers.get("content-type")) ? [2, new eL(i)] : [2, new eB(i)]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet = function(e, t) {
                        return aN(this, void 0, void 0, function() {
                            return aC(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGetRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t
                }(eR),
                aL = eR;

            function aB() {
                return null !== aL && aL.apply(this, arguments) || this
            }
            aT(aB, aL), aB.prototype.v1UsersUserIdPlacesInventoryGetRaw = function(e, t) {
                return aN(this, void 0, void 0, function() {
                    var r, n;
                    return aC(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new e_("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdPlacesInventoryGet.");
                                if (null === e.placesTab || void 0 === e.placesTab) throw new e_("placesTab", "Required parameter requestParameters.placesTab was null or undefined when calling v1UsersUserIdPlacesInventoryGet.");
                                if (null === e.itemsPerPage || void 0 === e.itemsPerPage) throw new e_("itemsPerPage", "Required parameter requestParameters.itemsPerPage was null or undefined when calling v1UsersUserIdPlacesInventoryGet.");
                                if (null === e.cursor || void 0 === e.cursor) throw new e_("cursor", "Required parameter requestParameters.cursor was null or undefined when calling v1UsersUserIdPlacesInventoryGet.");
                                return r = {}, void 0 !== e.placesTab && (r.placesTab = e.placesTab), void 0 !== e.itemsPerPage && (r.itemsPerPage = e.itemsPerPage), void 0 !== e.cursor && (r.cursor = e.cursor), n = {}, [4, this.request({
                                    path: "/v1/users/{userId}/places/inventory".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/places/inventory",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return [2, new eL(i.sent(), function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: eU(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: eU(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: eU(e, "data") ? e.data.map(a_) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, aB.prototype.v1UsersUserIdPlacesInventoryGet = function(e, t) {
                return aN(this, void 0, void 0, function() {
                    return aC(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1UsersUserIdPlacesInventoryGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            };
            var aF = function(e, t) {
                return "https://apis.".concat(e, "/").concat(t)
            };

            function aG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var az = function(e) {
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
                                    s = !1;
                                try {
                                    for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), o.length !== t); a = !0);
                                } catch (e) {
                                    s = !0, n = e
                                } finally {
                                    try {
                                        a || null == i.return || i.return()
                                    } finally {
                                        if (s) throw n
                                    }
                                }
                                return o
                            }
                        }(t, 3) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return aG(e, 3);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aG(e, t)
                            }
                        }(t, 3) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        i = n[0],
                        o = n[1],
                        a = n[2];
                    if (null != i && null != o) {
                        var s = "".concat(o, ".").concat(i);
                        if ("roblox.com" === s || "simulprod.com" === s || "rblx.org" === s) return {
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
                aq = az(window.location.hostname),
                aV = new aU(new eF({
                    robloxSiteDomain: aq.rootDomain,
                    basePath: (g = aq.rootDomain, "https://".concat("inventory", ".").concat(g)),
                    credentials: "include"
                })),
                aW = function(e) {
                    if (e === oz.ItemType.Asset) return 0;
                    throw Error("Unsupported gift item type: ".concat(e))
                },
                aK = function() {
                    var e = (0, aI.userId)();
                    return (0, j.useQuery)({
                        queryKey: ["owns-gift-item", e, oq.itemId, oq.itemType],
                        queryFn: function() {
                            if (null == e) throw Error("Cannot check gift item ownership without a user id");
                            return aV.v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet({
                                userId: e,
                                itemType: aW(oq.itemType),
                                itemTargetId: oq.itemId
                            })
                        },
                        enabled: null != e
                    })
                },
                aH = function(e) {
                    var t, r, n = e.robloxSubscriptionProduct,
                        i = e.robloxSubscriptionMembership,
                        o = e.robloxPlusUserBenefits,
                        a = e.isFaeFreeTrial,
                        s = (0, P.useTranslation)().translate,
                        l = null == o ? void 0 : o.robuxSavedWithPlus,
                        c = null == o ? void 0 : o.itemsBoughtWithPlusDiscount,
                        u = null == o ? void 0 : o.privateServersCreatedForFree,
                        d = null == o ? void 0 : o.robuxSentToFriends,
                        f = (0, e3.useMemo)(function() {
                            return i.activeOffers.some(function(e) {
                                return "FreeTrial" === e.offerType
                            })
                        }, [i.activeOffers]),
                        p = (0, e3.useMemo)(function() {
                            return ar(i.activationTimestampMs, i.periodType, i.nextRenewalTimestampMs, Date.now())
                        }, [i.activationTimestampMs, i.nextRenewalTimestampMs, i.periodType]),
                        m = (0, e3.useMemo)(function() {
                            var e, t, r, o, a, s, l, c, u, d, f;
                            return t = tG(n), r = null == (e = i.productTypeMembershipDetails.robloxSubscriptionMembershipDetails) ? void 0 : e.features.virtualTransactionDiscountTierId, d = t.virtualTransactionDiscounts, f = null != (c = null == (o = r ? null != (s = null != (a = null == d ? void 0 : d.find(function(e) {
                                return e.tierId === r
                            })) ? a : null == d ? void 0 : d.toSorted(function(e, t) {
                                return t.periodIndex - e.periodIndex
                            })[0]) ? s : null : null != (l = null == d ? void 0 : d.filter(function(e) {
                                return e.periodIndex <= p
                            }).toSorted(function(e, t) {
                                return t.periodIndex - e.periodIndex
                            })[0]) ? l : null) ? void 0 : o.periodIndex) ? c : p, {
                                current: o,
                                next: null != (u = null == d ? void 0 : d.filter(function(e) {
                                    return e.periodIndex > f
                                }).toSorted(function(e, t) {
                                    return e.periodIndex - t.periodIndex
                                })[0]) ? u : null
                            }
                        }, [n, i.productTypeMembershipDetails, p]),
                        y = null != (r = null == (t = m.current) ? void 0 : t.discountPercent) ? r : 0,
                        h = aK().data;
                    return (0, S.jsx)("div", {
                        className: "flex flex-col items-center",
                        children: (0, S.jsxs)("div", {
                            className: "margin-top-[48px] padding-x-xlarge content-emphasis gap-y-xxlarge width-full large:max-width-[730px] flex flex-col",
                            children: [!0 === h && (0, S.jsx)(rm, {
                                body: s("Description.BannerBodyUnboxed"),
                                equipText: s("Action.BannerEquip"),
                                title: s("Description.BannerTitleUnboxed"),
                                onEquip: function() {
                                    (0, oz.navigateToDeepLink)("roblox://navigation/avatar").catch(function() {})
                                },
                                onItemDetailsClick: function() {
                                    oW(oq).catch(function() {})
                                }
                            }), a && (0, S.jsx)(oQ, {
                                body: s("Subtext.FreeTrialBanner", {
                                    date: new Date(i.expirationTimestampMs).toLocaleDateString(void 0, {
                                        day: "2-digit",
                                        month: "short",
                                        year: "numeric"
                                    })
                                }),
                                title: s("Header.FreeTrialBannerTitle")
                            }), (0, S.jsxs)("div", {
                                className: "gap-y-small large:items-center flex flex-col",
                                children: [(0, S.jsx)(ry, {}), (0, S.jsx)(aP, {
                                    activationTimestampMs: i.activationTimestampMs,
                                    expirationTimestampMs: i.expirationTimestampMs,
                                    hasFreeTrial: f,
                                    nextRenewalTimestampMs: i.nextRenewalTimestampMs
                                }), (0, S.jsx)(an, {
                                    activationTimestampMs: i.activationTimestampMs,
                                    currentDiscountPercent: y,
                                    isCancelled: null === i.nextRenewalTimestampMs || 0 === i.nextRenewalTimestampMs,
                                    nextDiscount: m.next,
                                    periodType: i.periodType
                                })]
                            }), (0, S.jsxs)("div", {
                                className: "flex flex-col gap-y-[32px]",
                                children: [(0, S.jsx)(as, {
                                    currentDiscountPercent: y,
                                    itemsBoughtWithDiscountCount: c,
                                    privateServersCreatedCount: u,
                                    robuxSentToFriendsCount: d,
                                    savedRobux: l
                                }), (0, S.jsx)(aO, {
                                    featureConfig: tG(n)
                                }), (0, S.jsx)(tL, {
                                    children: (0, S.jsx)("div", {
                                        className: "gap-y-medium flex flex-col",
                                        children: (0, S.jsx)(ao, {
                                            robloxSubscriptionProduct: n
                                        })
                                    })
                                })]
                            })]
                        })
                    })
                };

            function aX(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var aY = function(e) {
                    var t, r, n, i = e.deviceMeta,
                        o = e.robloxSubscriptionProduct,
                        a = e.onDismiss,
                        s = (0, P.useTranslation)().translate,
                        l = (t = (0, e3.useState)(null), function(e) {
                            if (Array.isArray(e)) return e
                        }(t) || function(e, t) {
                            var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != i) {
                                var o = [],
                                    a = !0,
                                    s = !1;
                                try {
                                    for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), o.length !== t); a = !0);
                                } catch (e) {
                                    s = !0, n = e
                                } finally {
                                    try {
                                        a || null == i.return || i.return()
                                    } finally {
                                        if (s) throw n
                                    }
                                }
                                return o
                            }
                        }(t, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return aX(e, 2);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aX(e, t)
                            }
                        }(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        c = l[0],
                        u = l[1];
                    (0, e3.useEffect)(function() {
                        window.scrollTo({
                            top: 0,
                            behavior: "smooth"
                        })
                    }, []);
                    var d = !i.isInApp && (0, S.jsxs)("div", {
                        "aria-label": s("Action.OK"),
                        className: "bottom-dock padding-t-medium bg-surface-100 large:hidden width-full gap-y-medium flex flex-col",
                        "data-testid": "welcome-dismiss-dock",
                        role: "region",
                        children: [(0, S.jsx)(tF, {}), (0, S.jsx)("div", {
                            className: "width-full gap-y-medium padding-bottom-[env(safe-area-inset-bottom\\,0px)] padding-x-xxlarge flex flex-col items-stretch",
                            children: (0, S.jsx)(tE, {
                                className: "min-width-0 width-full margin-bottom-[24px] large:margin-bottom-none",
                                size: "Large",
                                variant: "Emphasis",
                                onClick: a,
                                children: s("Action.OK")
                            })
                        })]
                    });
                    return (0, S.jsxs)(e3.Fragment, {
                        children: [(0, S.jsx)(tB, {}), (0, S.jsx)("div", {
                            className: "width-full min-width-0 large:items-center flex flex-col items-start",
                            children: (0, S.jsxs)("div", {
                                className: "margin-top-[48px] width-full min-width-0 content-emphasis large:max-width-[730px] large:gap-y-[60px] large:self-auto large:padding-x-xlarge flex flex-col gap-y-[var(--size-1200)] self-stretch",
                                children: [(0, S.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge text-align-x-start large:gap-y-[24px] large:items-center large:padding-x-none large:text-align-x-center flex flex-col items-start",
                                    children: [(0, S.jsxs)("div", {
                                        className: "gap-y-xsmall large:items-center flex flex-col items-start",
                                        children: [(0, S.jsx)(e7, {
                                            className: "!size-1800 margin-bottom-medium",
                                            name: "icon-regular-roblox-plus"
                                        }), (0, S.jsx)("h1", {
                                            className: "text-heading-large",
                                            children: s("Title.Welcome", {
                                                productShort: s("Label.BlackbirdShort")
                                            })
                                        }), (0, S.jsx)("p", {
                                            className: "text-body-large content-default",
                                            children: s("Description.Welcome", {
                                                product: s("Label.Blackbird")
                                            })
                                        })]
                                    }), !i.isInApp && (0, S.jsx)("div", {
                                        className: "width-full gap-y-medium padding-t-none large:margin-x-auto large:margin-top-[12px] large:flex large:max-width-[min(440px,100%)] large:width-full large:flex-col large:items-center hidden items-start",
                                        "data-testid": "welcome-dismiss-inline",
                                        children: (0, S.jsx)("div", {
                                            className: "width-full gap-x-small flex shrink-0 flex-row items-start justify-center",
                                            children: (0, S.jsx)(tE, {
                                                className: "width-full large:width-[230px] shrink-0",
                                                size: "Medium",
                                                variant: "Emphasis",
                                                onClick: a,
                                                children: s("Action.OK")
                                            })
                                        })
                                    })]
                                }), (0, S.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge large:padding-x-none flex flex-col",
                                    children: [(0, S.jsx)("span", {
                                        className: "text-heading-small",
                                        children: s("Title.BenefitsUnlocked")
                                    }), (0, S.jsx)(tU, {
                                        featureConfig: tG(o),
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
                        }), d, (0, S.jsx)(i4, {
                            body: null != (r = null == c ? void 0 : c.secondary) ? r : "",
                            open: null != c,
                            title: null != (n = null == c ? void 0 : c.primary) ? n : "",
                            onOpenChange: function(e) {
                                e || u(null)
                            }
                        })]
                    })
                },
                a$ = az(window.location.hostname),
                aJ = new eD({
                    robloxSiteDomain: a$.rootDomain,
                    basePath: aF(a$.rootDomain, "roblox-subscriptions"),
                    credentials: "include"
                });
            new o6(aJ);
            var aQ = new o5(aJ);
            new o8(aJ);
            var aZ = az(window.location.hostname),
                a0 = new e0(new eF({
                    robloxSiteDomain: aZ.rootDomain,
                    basePath: aF(aZ.rootDomain, "subscriptions"),
                    credentials: "include"
                })),
                a1 = function(e, t) {
                    var r = (0, e3.useRef)();
                    return t(e) && (r.current = e), r.current
                };

            function a2(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function a4(e, t, r, n, i, o, a) {
                try {
                    var s = e[o](a),
                        l = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(n, i)
            }

            function a3(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var o = e.apply(t, r);

                        function a(e) {
                            a4(o, n, i, a, s, "next", e)
                        }

                        function s(e) {
                            a4(o, n, i, a, s, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function a5(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return a2(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return a2(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function a6(e, t) {
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
                return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function s(s) {
                    return function(l) {
                        var c = [s, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, c[0] && (o = 0)), o;) try {
                            if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                            switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                case 0:
                                case 1:
                                    i = c;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                        o.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && o.label < i[1]) {
                                        o.label = i[1], i = c;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(c);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            c = t.call(e, o)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var a8 = function() {
                    var e, t, r = (0, e3.useMemo)(function() {
                            return (0, e2.getDeviceMeta)()
                        }, []),
                        n = a5((0, e3.useState)(function() {
                            return new URLSearchParams(window.location.search).has("welcome")
                        }), 2),
                        i = n[0],
                        o = n[1],
                        a = a5((0, e3.useState)(function() {
                            return new URLSearchParams(window.location.search).has("faeFreeTrialConfirmation")
                        }), 2),
                        s = a[0],
                        l = a[1],
                        c = a5((0, e3.useState)(i || s), 2),
                        u = c[0],
                        d = c[1],
                        f = (0, j.useQuery)({
                            queryKey: ["get-roblox-subscription-membership"],
                            queryFn: function() {
                                return a3(function() {
                                    var e;
                                    return a6(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, a0.subscriptionsV2ListSubscriptions({
                                                    productType: eY,
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
                        p = a1(f.data, function() {
                            return void 0 !== f.data
                        }),
                        m = null == p ? void 0 : p.productKey.id,
                        y = (0, j.useQuery)({
                            queryKey: ["check-fae-free-trial", m],
                            queryFn: function() {
                                return a3(function() {
                                    var e, t;
                                    return a6(this, function(r) {
                                        switch (r.label) {
                                            case 0:
                                                if (!m) return [2, !1];
                                                return [4, a0.subscriptionsV2ListAvailableSubscriptionProducts({
                                                    productType: eY,
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
                        h = (0, j.useQuery)({
                            queryKey: ["list-roblox-subscription-available-products"],
                            queryFn: function() {
                                return a3(function() {
                                    var e;
                                    return a6(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, a0.subscriptionsV2ListAvailableSubscriptionProducts({
                                                    productType: eY,
                                                    includePurchased: !0,
                                                    includeBundles: !0,
                                                    skipEligibilityCheck: !0
                                                })];
                                            case 1:
                                                if (0 === (e = t.sent().products).length) return [2, null];
                                                return [2, e.toSorted(function(e, t) {
                                                    return tz(e) - tz(t)
                                                })]
                                        }
                                    })
                                })()
                            },
                            enabled: null === f.data,
                            retry: 3,
                            retryDelay: 100
                        }),
                        v = a1(h.data, function() {
                            return void 0 !== h.data
                        }),
                        b = a1(null != (t = null == (e = f.data) ? void 0 : e.productInfo) ? t : null == v ? void 0 : v[0], function() {
                            var e;
                            return (null == (e = f.data) ? void 0 : e.productInfo) !== void 0 || void 0 !== v
                        }),
                        g = (0, j.useQuery)({
                            queryKey: ["get-roblox-plus-user-benefits"],
                            queryFn: function() {
                                return aQ.robloxPlusGetRobloxPlusUserBenefits()
                            },
                            enabled: !!p,
                            retry: 3
                        }),
                        x = (0, j.useQuery)({
                            queryKey: ["guac/app-policy/disable-blackbird-entrypoints"],
                            queryFn: function() {
                                return a3(function() {
                                    return a6(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return e.trys.push([0, 2, , 3]), [4, (0, e1.callBehaviour)("app-policy")];
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
                        w = a1(x.data, function() {
                            return void 0 !== x.data
                        }),
                        P = (0, e3.useCallback)(function() {
                            var e = new URL(window.location.href);
                            e.searchParams.set("welcome", ""), window.history.replaceState(null, "", e.toString()), o(!0)
                        }, []),
                        O = (0, e3.useCallback)(function() {
                            var e = function() {
                                try {
                                    var e = sessionStorage.getItem(e4);
                                    if (!e) return null;
                                    sessionStorage.removeItem(e4);
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
                        I = (0, e3.useCallback)(function() {
                            var e = new URL(window.location.href);
                            e.searchParams.delete("faeFreeTrialConfirmation"), window.history.replaceState(null, "", e.toString()), l(!1)
                        }, []);
                    (0, e3.useEffect)(function() {
                        if (u) {
                            var e = setTimeout(function() {
                                d(!1)
                            }, 6e4);
                            return function() {
                                clearTimeout(e)
                            }
                        }
                    }, [u]), (0, e3.useEffect)(function() {
                        u && f.data && (d(!1), s || P())
                    }, [P, s, u, f.data]);
                    var E = (0, e3.useCallback)(function() {
                        d(!0)
                    }, []);
                    if (h.error || null === h.data || f.error && !u || x.error || !r) return (0, S.jsx)(tj, {});
                    if (void 0 === b || void 0 === p || void 0 === w) return (0, S.jsx)(tH, {});
                    var T = null !== p;
                    if (s) return T ? y.isLoading ? (0, S.jsx)(tH, {}) : y.data ? (0, S.jsx)(tV, {
                        robloxSubscriptionProduct: b,
                        onDismiss: I
                    }) : (0, S.jsx)(tj, {}) : u ? (0, S.jsx)(tH, {}) : (0, S.jsx)(tj, {});
                    if (i)
                        if (T) return (0, S.jsx)(aY, {
                            deviceMeta: r,
                            robloxSubscriptionMembership: p,
                            robloxSubscriptionProduct: b,
                            onDismiss: O
                        });
                        else if (u) return (0, S.jsx)(tH, {});
                    else return (0, S.jsx)(tj, {});
                    return T ? (0, S.jsx)(aH, {
                        isFaeFreeTrial: !0 === y.data,
                        robloxPlusUserBenefits: g.data,
                        robloxSubscriptionMembership: p,
                        robloxSubscriptionProduct: b
                    }) : v ? (0, S.jsx)(oJ, {
                        deviceMeta: r,
                        isEntrypointDisabled: w,
                        robloxSubscriptionProducts: v,
                        onMobilePurchaseInitiated: E
                    }) : (0, S.jsx)(tH, {})
                },
                a7 = function(e) {
                    var t = e.children;
                    return (0, S.jsx)("div", {
                        className: "clip-x margin-bottom-[160px] min-height-[400px] padding-top-[16px] large:margin-bottom-[120px] relative",
                        children: t
                    })
                },
                a9 = function() {
                    return (0, S.jsx)(j.QueryClientProvider, {
                        client: P.queryClient,
                        children: (0, S.jsx)(a7, {
                            children: (0, S.jsx)(a8, {})
                        })
                    })
                };
            r(160), I()(function() {
                (0, P.renderWithErrorBoundary)((0, S.jsx)(P.TranslationProvider, {
                    config: E.P,
                    children: (0, S.jsx)(a9, {})
                }), document.getElementById("roblox-subscription-container"), void 0, (0, S.jsx)(a7, {
                    children: (0, S.jsx)(tj, {})
                }))
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("RobloxSubscription");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/robloxSubscription-60a50f8a6500c00d.js.map