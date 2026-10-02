! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "1c0e401d49bd5985c8bb5d48d59198656d813fc5"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "1e85827a-a101-48f2-b23e-ec4aa5bb9f3d", e._sentryDebugIdIdentifier = "sentry-dbid-1e85827a-a101-48f2-b23e-ec4aa5bb9f3d")
    } catch (e) {}
}(),
function() {
    var e = {
            611: function(e) {
                function t(e) {
                    return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }!
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var r = {}.hasOwnProperty;

                    function n() {
                        for (var e = "", o = 0; o < arguments.length; o++) {
                            var a = arguments[o];
                            a && (e = i(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : t(e)) !== "object") return "";
                                if (Array.isArray(e)) return n.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var o = "";
                                for (var a in e) r.call(e, a) && e[a] && (o = i(o, a));
                                return o
                            }(a)))
                        }
                        return e
                    }

                    function i(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (n.default = n, e.exports = n) : "function" == typeof define && "object" === t(define.amd) && define.amd ? define("classnames", [], function() {
                        return n
                    }) : window.classNames = n
                }()
            },
            977: function(e, t, r) {
                function n(e) {
                    return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }
                var i = 0 / 0,
                    o = /^\s+|\s+$/g,
                    a = /^[-+]0x[0-9a-f]+$/i,
                    l = /^0b[01]+$/i,
                    u = /^0o[0-7]+$/i,
                    c = parseInt,
                    s = (void 0 === r.g ? "undefined" : n(r.g)) == "object" && r.g && r.g.Object === Object && r.g,
                    d = ("u" < typeof self ? "undefined" : n(self)) == "object" && self && self.Object === Object && self,
                    f = s || d || Function("return this")(),
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

                function g(e) {
                    if ("number" == typeof e) return e;
                    if ((void 0 === (t = e) ? "undefined" : n(t)) == "symbol" || t && (void 0 === t ? "undefined" : n(t)) == "object" && "[object Symbol]" == p.call(t)) return i;
                    if (h(e)) {
                        var t, r = "function" == typeof e.valueOf ? e.valueOf() : e;
                        e = h(r) ? r + "" : r
                    }
                    if ("string" != typeof e) return 0 === e ? e : +e;
                    e = e.replace(o, "");
                    var s = l.test(e);
                    return s || u.test(e) ? c(e.slice(2), s ? 2 : 8) : a.test(e) ? i : +e
                }
                e.exports = function(e, t, r) {
                    var n, i, o, a, l, u, c = 0,
                        s = !1,
                        d = !1,
                        f = !0;
                    if ("function" != typeof e) throw TypeError("Expected a function");

                    function p(t) {
                        var r = n,
                            o = i;
                        return n = i = void 0, c = t, a = e.apply(o, r)
                    }

                    function v(e) {
                        var r = e - u,
                            n = e - c;
                        return void 0 === u || r >= t || r < 0 || d && n >= o
                    }

                    function w() {
                        var e, r, n, i = b();
                        if (v(i)) return x(i);
                        l = setTimeout(w, (e = i - u, r = i - c, n = t - e, d ? y(n, o - r) : n))
                    }

                    function x(e) {
                        return (l = void 0, f && n) ? p(e) : (n = i = void 0, a)
                    }

                    function j() {
                        var e, r = b(),
                            o = v(r);
                        if (n = arguments, i = this, u = r, o) {
                            if (void 0 === l) return c = e = u, l = setTimeout(w, t), s ? p(e) : a;
                            if (d) return l = setTimeout(w, t), p(u)
                        }
                        return void 0 === l && (l = setTimeout(w, t)), a
                    }
                    return t = g(t) || 0, h(r) && (s = !!r.leading, o = (d = "maxWait" in r) ? m(g(r.maxWait) || 0, t) : o, f = "trailing" in r ? !!r.trailing : f), j.cancel = function() {
                        void 0 !== l && clearTimeout(l), c = 0, n = u = i = l = void 0
                    }, j.flush = function() {
                        return void 0 === l ? a : x(b())
                    }, j
                }
            },
            773: function(e, t) {
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

                function u() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    r = "function" == typeof setTimeout ? setTimeout : l
                } catch (e) {
                    r = l
                }
                try {
                    n = "function" == typeof clearTimeout ? clearTimeout : u
                } catch (e) {
                    n = u
                }

                function c(e) {
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
                var s = [],
                    d = !1,
                    f = -1;

                function p() {
                    d && i && (d = !1, i.length ? s = i.concat(s) : f = -1, s.length && m())
                }

                function m() {
                    if (!d) {
                        var e = c(p);
                        d = !0;
                        for (var t = s.length; t;) {
                            for (i = s, s = []; ++f < t;) i && i[f].run();
                            f = -1, t = s.length
                        }
                        i = null, d = !1,
                            function(e) {
                                if (n === clearTimeout) return clearTimeout(e);
                                if ((n === u || !n) && clearTimeout) return n = clearTimeout, clearTimeout(e);
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
                    s.push(new y(e, t)), 1 !== s.length || d || c(m)
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
                var g = o.exports.browser,
                    v = o.exports.binding,
                    w = {},
                    x = "browser",
                    j = "browser",
                    O = "browser",
                    S = [],
                    I = {
                        nextTick: o.exports.nextTick,
                        title: o.exports.title,
                        browser: g,
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
                        binding: v,
                        cwd: o.exports.cwd,
                        chdir: o.exports.chdir,
                        umask: o.exports.umask,
                        exit: h,
                        pid: 1,
                        features: w,
                        kill: h,
                        dlopen: h,
                        uptime: h,
                        memoryUsage: h,
                        uvCounters: h,
                        platform: x,
                        arch: j,
                        execPath: O,
                        execArgv: S
                    };
                t.addListener = o.exports.addListener, t.arch = j, t.argv = o.exports.argv, t.binding = v, t.browser = g, t.chdir = o.exports.chdir, t.cwd = o.exports.cwd, t.default = I, t.dlopen = h, t.emit = o.exports.emit, t.emitWarning = h, t.env = o.exports.env, t.execArgv = S, t.execPath = O, t.exit = h, t.features = w, t.kill = h, t.listeners = o.exports.listeners, t.memoryUsage = h, t.nextTick = o.exports.nextTick, t.off = o.exports.off, t.on = o.exports.on, t.once = o.exports.once, t.pid = 1, t.platform = x, t.prependListener = o.exports.prependListener, t.prependOnceListener = o.exports.prependOnceListener, t.removeAllListeners = o.exports.removeAllListeners, t.removeListener = o.exports.removeListener, t.title = o.exports.title, t.umask = o.exports.umask, t.uptime = h, t.uvCounters = h, t.version = o.exports.version, t.versions = o.exports.versions, e.exports = I
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
            "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(e, "__esModule", {
                value: !0
            })
        }, r.nc = void 0, r.rv = function() {
            return "1.7.12"
        }, r.ruid = "bundler=rspack@1.7.12",
        function() {
            "use strict";
            var e, t, n, i, o, a, l, u, c, s, d, f, p, m, y, b, h, g, v, w, x, j, O, S, I, M, P, N, T = window.ReactJSX,
                E = window.Roblox["core-scripts"].react,
                D = window.Roblox["core-scripts"].util.ready,
                A = r.n(D),
                L = JSON.parse('{"P":["Feature.RobloxSubscription"]}'),
                C = window.TanstackQuery;

            function k(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var R = function(e, t) {
                return (R = Object.setPrototypeOf || k({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function z(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function r() {
                    this.constructor = e
                }
                R(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
            }
            var U = function() {
                return (U = Object.assign || function(e) {
                    for (var t, r = 1, n = arguments.length; r < n; r++)
                        for (var i in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                    return e
                }).apply(this, arguments)
            };

            function _(e, t, r, n) {
                return new(r || (r = Promise))(function(i, o) {
                    function a(e) {
                        try {
                            u(n.next(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function l(e) {
                        try {
                            u(n.throw(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function u(e) {
                        var t;
                        e.done ? i(e.value) : (k(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, l)
                    }
                    u((n = n.apply(e, t || [])).next())
                })
            }

            function B(e, t) {
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
                    return function(u) {
                        var c = [l, u];
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

            function F(e, t, r) {
                if (r || 2 == arguments.length)
                    for (var n, i = 0, o = t.length; i < o; i++) !n && i in t || (n || (n = Array.prototype.slice.call(t, 0, i)), n[i] = t[i]);
                return e.concat(n || Array.prototype.slice.call(t))
            }
            "function" == typeof SuppressedError && SuppressedError;
            var Y = {
                    envName: ""
                },
                G = !1,
                V = function() {
                    try {
                        if ("u" < typeof window) return U({}, Y);
                        var e = localStorage.getItem("Roblox.MrRouterConfig");
                        if (null == e) return U({}, Y);
                        var t = JSON.parse(e);
                        if ("object" != (void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) || null === t) return U({}, Y);
                        var r = U(U({}, Y), "envName" in t && "string" == typeof t.envName && {
                            envName: t.envName
                        });
                        return r.envName && !G && (G = !0, console.warn('[MrRouter] Routing to non-production environment: "'.concat(r.envName, '"'))), r
                    } catch (e) {
                        return U({}, Y)
                    }
                },
                W = "mrrouter-env",
                Q = "tracestate",
                q = "traceparent",
                K = function(e) {
                    var t = e.indexOf("=");
                    return (-1 === t ? e : e.slice(0, t)).trim()
                },
                H = function(e, t) {
                    var r = "".concat(W, "=").concat(encodeURIComponent(t)),
                        n = null == e ? void 0 : e.trim(),
                        i = n ? n.split(",") : [],
                        o = i.findIndex(function(e) {
                            return K(e) === W
                        });
                    if (-1 === o) return F(F([], i.map(function(e) {
                        return e.trim()
                    }), !0), [r], !1).join(",");
                    var a = i.filter(function(e) {
                        return K(e) !== W
                    }).map(function(e) {
                        return e.trim()
                    });
                    return a.splice(o, 0, r), a.join(",")
                },
                X = function(e) {
                    var t = new Uint8Array(e);
                    return crypto.getRandomValues(t), Array.from(t, function(e) {
                        return e.toString(16).padStart(2, "0")
                    }).join("")
                },
                Z = "u" > typeof crypto && "function" == typeof crypto.randomUUID,
                $ = function() {
                    return Z ? crypto.randomUUID().replaceAll("-", "").slice(0, 32) : X(16)
                },
                J = function() {
                    return Z ? crypto.randomUUID().replaceAll("-", "").slice(0, 16) : X(8)
                },
                ee = function(e) {
                    var t = V().envName;
                    if (t.length > 0 && (e[Q] = H(e[Q], t), !e[q])) {
                        var r = $(),
                            n = J();
                        e[q] = "00-".concat(r, "-").concat(n, "-01")
                    }
                };

            function et(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            r(773);
            var er, en = function(e) {
                    return e.replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/\d+/, "/number")
                },
                ei = function(e, t) {
                    return !1 === t.ok && !1 === [401, 403, 404].includes(t.status) && e(Error("Network error"), {
                        tags: {
                            apiUrl: en(t.url),
                            apiStatus: null == t ? void 0 : t.status,
                            cors: !1
                        }
                    }), t
                },
                eo = function(e, t) {
                    e(Error("Network error"), {
                        tags: {
                            apiUrl: en(t),
                            cors: !0
                        }
                    })
                },
                ea = function() {
                    function e(e) {
                        this.captureException = e
                    }
                    return e.prototype.post = function(e) {
                        return _(this, void 0, void 0, function() {
                            return B(this, function(t) {
                                return [2, ei(this.captureException, e.response)]
                            })
                        })
                    }, e.prototype.onError = function(e) {
                        return _(this, void 0, void 0, function() {
                            return B(this, function(t) {
                                return eo(this.captureException, e.url), [2]
                            })
                        })
                    }, e
                }(),
                el = function(e) {
                    if (document) {
                        var t, r, n = document.getElementById("hba-frame");
                        return null === n && ((t = document.createElement("iframe")).id = "hba-frame", t.style.cssText = "position: fixed; top: 0; left: 0; width: 0%; height: 0%; z-index: -1", t.src = "https://www.".concat(e, "/hba/iframe"), r = t, n = (null == document ? void 0 : document.body) ? document.body.appendChild(r) : null), n
                    }
                    return null
                },
                eu = function() {
                    var e = window.location.hostname.split(".").slice(0, -2).join(".");
                    return e.includes("create") ? "creator_hub" : e.includes("advertise") ? "ads_manager" : "creator_hub"
                },
                ec = function(e, t) {
                    try {
                        fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                            method: "POST",
                            body: JSON.stringify({
                                name: "load_time_hba_frame",
                                value: t,
                                labelValues: {
                                    origin_site: eu()
                                }
                            })
                        })
                    } catch (e) {}
                },
                es = function(e, t) {
                    try {
                        fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                            method: "POST",
                            body: JSON.stringify({
                                name: "response_time_hba_frame",
                                value: t,
                                labelValues: {
                                    origin_site: eu()
                                }
                            })
                        })
                    } catch (e) {}
                },
                ed = function(e, t, r) {
                    return void 0 === r && (r = 1500), new Promise(function(n, i) {
                        var o, a, l = performance.now(),
                            u = window.setTimeout(function() {
                                ec(e, performance.now() - l),
                                    function(e) {
                                        try {
                                            fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                                method: "POST",
                                                body: JSON.stringify({
                                                    name: "event_hba_frame",
                                                    value: 1,
                                                    labelValues: {
                                                        event_type: "FrameLoadTimedOut",
                                                        origin_site: eu()
                                                    }
                                                })
                                            })
                                        } catch (e) {}
                                    }(e), i(Error("Promise timed out after ".concat(r, " ms")))
                            }, r),
                            c = o = function(t) {
                                var r = t.data;
                                t.origin === "https://www.".concat(e) && "dataFromHbaFrame" === r.msg && "loaded" === r.data.type && (window.removeEventListener("message", o, !1), window.clearTimeout(u), ec(e, performance.now() - l), n())
                            };
                        window.addEventListener("message", c, !1), null == (a = t.contentWindow) || a.postMessage({
                            msg: "checkLoadedRequest"
                        }, "https://www.".concat(e))
                    })
                },
                ef = function(e, t, r, n, i, o, a) {
                    var l;
                    if (void 0 === a && (a = 100), window) {
                        var u, c = performance.now(),
                            s = window.setTimeout(function() {
                                es(r, performance.now() - c),
                                    function(e) {
                                        try {
                                            fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                                method: "POST",
                                                body: JSON.stringify({
                                                    name: "event_hba_frame",
                                                    value: 1,
                                                    labelValues: {
                                                        event_type: "FrameResponseTimedOut",
                                                        origin_site: eu()
                                                    }
                                                })
                                            })
                                        } catch (e) {}
                                    }(r), e({
                                        url: i.url,
                                        init: i.init
                                    })
                            }, a),
                            d = u = function(t) {
                                var n = t.data,
                                    a = i.url,
                                    l = i.init;
                                if (t.origin === "https://www.".concat(r) && "dataFromHbaFrame" === n.msg && "batHeader" === n.data.type && (!n.data.identifier || n.data.identifier === o))
                                    if (!n.data.isError && n.data.batHeader) {
                                        window.clearTimeout(s), window.removeEventListener("message", u, !1), es(r, performance.now() - c);
                                        var d = n.data.batHeader;
                                        e({
                                            url: a,
                                            init: U(U({}, l), {
                                                headers: U(U({}, l.headers), {
                                                    "x-bound-auth-token": d["x-bound-auth-token"]
                                                })
                                            })
                                        })
                                    } else window.clearTimeout(s), window.removeEventListener("message", u, !1), es(r, performance.now() - c), e({
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
                ep = function() {
                    return crypto.randomUUID()
                },
                em = function() {
                    function e(e, t, r) {
                        void 0 === t && (t = 1500), void 0 === r && (r = 100), this.robloxSiteDomain = e, this.hbaFrameAlreadyLoaded = !1, this.hbaFrameLoadFailed = !1, this.hbaFrame = null, this.loadTimeOut = t, this.dataTimeOut = r
                    }
                    return e.prototype.getOrCreateHbaFrame = function() {
                        return el(this.robloxSiteDomain)
                    }, e.prototype.pre = function(e) {
                        var t = this;
                        return new Promise(function(r, n) {
                            var i = e.url,
                                o = e.init;
                            if (t.hbaFrame = t.getOrCreateHbaFrame(), null !== t.hbaFrame) {
                                var a = ep();
                                t.hbaFrameAlreadyLoaded ? ef(r, 0, t.robloxSiteDomain, t.hbaFrame, e, a, t.dataTimeOut) : t.hbaFrameLoadFailed ? r({
                                    url: i,
                                    init: o
                                }) : ed(t.robloxSiteDomain, t.hbaFrame, t.loadTimeOut).then(function() {
                                    t.hbaFrame ? (t.hbaFrameAlreadyLoaded = !0, ef(r, 0, t.robloxSiteDomain, t.hbaFrame, e, a, t.dataTimeOut)) : r({
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
            (n = er || (er = {})).UNKNOWN = "unknown", n.INVALIDATED = "invalidated", n.ABANDONED = "abandoned", n.LOADFAILED = "loadfailed";
            var ey = function(e) {
                    function t(t) {
                        var r = e.call(this, "challenge error for challenge kind ".concat(t.kind)) || this;
                        return r.parameters = t, r
                    }
                    return z(t, e), t.prototype.match = function(e) {
                        return this.parameters.kind === e.parameters.kind && JSON.stringify(this.parameters.data) === JSON.stringify(e.parameters.data)
                    }, t.prototype.matchAbandoned = function(e) {
                        return this.match(e) && e.parameters.kind === er.ABANDONED
                    }, t
                }(Error),
                eb = "rblx-challenge-id",
                eh = "rblx-challenge-type",
                eg = "rblx-challenge-metadata",
                ev = function(e, t) {
                    return 403 === e.status && e.headers.has(eb) && e.headers.has(eh) && e.headers.has(eg) && "iframe" === t
                },
                ew = function(e) {
                    var t, r, n, i, o, a, l, u, c, s = e.url,
                        d = e.request,
                        f = e.response,
                        p = e.robloxSiteDomain,
                        m = (o = new URLSearchParams([
                            ["challenge-type", "generic"],
                            ["dark-mode", "true"],
                            ["barista-mode", "true"],
                            ["generic-challenge-type", null != (t = f.headers.get(eh)) ? t : ""],
                            ["generic-challenge-id", null != (r = f.headers.get(eb)) ? r : ""],
                            ["challenge-metadata-json", null != (n = f.headers.get(eg)) ? n : ""],
                            ["origin", null != (i = window.location.hostname.split(".").slice(0, -2).join(".")) ? i : ""]
                        ]), a = new URL("https://www.".concat(p, "/challenge/cdn/hybrid?").concat(o.toString())), (l = document.createElement("iframe")).id = "challenge-frame", l.allowFullscreen = !0, l.setAttribute("allowtransparency", "true"), l.setAttribute("allow", "publickey-credentials-get;publickey-credentials-create"), l.style.cssText = "position: fixed; top: 0; left: 0; width: 100%; height: 100%; visibility: hidden; color-scheme: normal; border: none; z-index: 2147483647;", l.src = a.toString(), l.onload = function() {
                            l.style.visibility = "visible"
                        }, u = l, document && document.body ? document.body.appendChild(u) : null);
                    return new Promise(function(e, t) {
                        window && m && (c = function(r) {
                            var n, i, o, a, l, u, c, p, m, y, b;
                            if (r.data && r.data.genericChallengeResponse) switch (r.data.genericChallengeResponse.type) {
                                case "challengeAbandoned":
                                    t(new ey({
                                        kind: er.ABANDONED,
                                        data: {
                                            challengeType: null != (n = f.headers.get(eh)) ? n : ""
                                        }
                                    }));
                                    break;
                                case "challengeDisplayed":
                                    break;
                                case "challengeCompleted":
                                    (c = r.data.genericChallengeResponse.data).challengeType && c.metadata ? e((p = c.metadata, fetch(s, U(U({}, d), {
                                        headers: U(U({}, d.headers), ((m = {})[eb] = null != (y = f.headers.get(eb)) ? y : "", m[eg] = btoa(JSON.stringify(p)), m[eh] = null != (b = f.headers.get(eh)) ? b : "", m))
                                    })))) : t(new ey({
                                        kind: er.UNKNOWN,
                                        data: {
                                            challengeType: null != (i = f.headers.get(eh)) ? i : ""
                                        }
                                    }));
                                    break;
                                case "challengeInvalidated":
                                    t((c = r.data.genericChallengeResponse.data) && c.challengeType && c.metadata ? new ey({
                                        kind: er.INVALIDATED,
                                        data: c
                                    }) : new ey({
                                        kind: er.INVALIDATED,
                                        data: {
                                            challengeType: null != (o = f.headers.get(eh)) ? o : ""
                                        }
                                    }));
                                    break;
                                case "challengeParsed":
                                    !1 === (c = r.data.genericChallengeResponse.data).parsed && t(new ey({
                                        kind: er.UNKNOWN,
                                        data: {
                                            challengeType: null != (a = f.headers.get(eh)) ? a : ""
                                        }
                                    }));
                                    break;
                                case "challengeInitialized":
                                    !1 === (c = r.data.genericChallengeResponse.data).initialized && t(new ey({
                                        kind: er.UNKNOWN,
                                        data: {
                                            challengeType: null != (l = f.headers.get(eh)) ? l : ""
                                        }
                                    }));
                                    break;
                                case "challengePageLoaded":
                                    !1 === (c = r.data.genericChallengeResponse.data).pageLoaded && t(new ey({
                                        kind: er.LOADFAILED,
                                        data: {
                                            challengeType: null != (u = f.headers.get(eh)) ? u : ""
                                        }
                                    }))
                            }
                        }, window.addEventListener("message", c, !1))
                    }).finally(function() {
                        null == m || m.remove(), c && window.removeEventListener("message", c, !1)
                    })
                },
                ex = function() {
                    function e(e, t) {
                        void 0 === t && (t = "iframe"), this.robloxSiteDomain = e, this.genericChallengeMiddlewareType = t
                    }
                    return e.prototype.post = function(e) {
                        var t = e.url,
                            r = e.init,
                            n = e.response;
                        return ev(n, this.genericChallengeMiddlewareType) ? ew({
                            url: t,
                            request: r,
                            response: n,
                            robloxSiteDomain: this.robloxSiteDomain
                        }) : Promise.resolve(n)
                    }, e
                }(),
                ej = function(e) {
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
                eO = function() {
                    function e(e) {
                        this.unifiedLogger = e
                    }
                    return e.prototype.post = function(e) {
                        return this.unifiedLogger.logApiVitalsEvent(ej({
                            elapsedTime: e.elapsedTime,
                            url: e.url,
                            status: e.response.status,
                            schemaPath: e.schemaPath
                        })), Promise.resolve(e.response)
                    }, e
                }(),
                eS = "x-csrf-token",
                eI = ["POST", "PATCH", "DELETE", "PUT"],
                eM = function() {
                    var e, t = "";
                    try {
                        "u" > typeof window && (t = null != (e = localStorage.getItem(eS)) ? e : "")
                    } catch (e) {
                        console.warn("Error reading localStorage key “".concat(eS, "”:"), e)
                    }
                    return t
                },
                eP = eM(),
                eN = function(e) {
                    try {
                        eP = e, "u" > typeof window && localStorage.setItem(eS, e)
                    } catch (e) {
                        console.warn("Error setting localStorage key “".concat(eS, "”:"), e)
                    }
                },
                eT = function() {
                    function e() {
                        this.currentToken = eM()
                    }
                    return e.prototype.pre = function(e) {
                        var t, r = e.url,
                            n = e.init,
                            i = this.currentToken;
                        return n.headers && "object" == ((t = n.headers) && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) && eS in n.headers && (i = n.headers[eS]) && (this.currentToken = i, eN(i)), n.method && eI.includes(n.method) ? Promise.resolve({
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
                            o = i.headers.get(eS);
                        return 403 === i.status && i.headers.has(eS) && null !== o ? (this.currentToken = o, eN(o), t(r, this.prepareRequestInit(n))) : Promise.resolve(i)
                    }, e.prototype.prepareRequestInit = function(e) {
                        var t;
                        return U(U({}, e), {
                            headers: U(U({}, e.headers), ((t = {})[eS] = this.currentToken, t))
                        })
                    }, e
                }(),
                eE = [],
                eD = function(e) {
                    eE = eE.filter(function(t) {
                        return t !== e
                    })
                },
                eA = function(e) {
                    var t = e.url;
                    503 === e.status && eE.forEach(function(e) {
                        return e(t)
                    })
                },
                eL = function() {
                    function e() {}
                    return e.prototype.subscribe = function(e) {
                        return eE.push(e),
                            function() {
                                return eD(e)
                            }
                    }, e.prototype.unsubscribe = function(e) {
                        return eD(e)
                    }, e.prototype.post = function(e) {
                        var t = e.response;
                        return eA(t), Promise.resolve(t)
                    }, e
                }(),
                eC = function() {
                    function e() {}
                    return e.prototype.pre = function(e) {
                        var t = e.url,
                            r = e.init;
                        if (!V().envName) return Promise.resolve({
                            url: t,
                            init: r
                        });
                        var n = U({}, r.headers);
                        return ee(n), Promise.resolve({
                            url: t,
                            init: U(U({}, r), {
                                headers: n
                            })
                        })
                    }, e
                }(),
                ek = new eT,
                eR = new eL,
                ez = [function(e) {
                    return e.captureException ? new ea(e.captureException) : void 0
                }, function(e) {
                    return e.robloxSiteDomain && e.enableBoundAuthToken ? new em(e.robloxSiteDomain, e.boundAuthTokenLoadTimeout, e.boundAuthTokenDataTimeout) : void 0
                }, function(e) {
                    return e.robloxSiteDomain ? new ex(e.robloxSiteDomain, e.genericChallengeMiddlewareType) : void 0
                }, function(e) {
                    return e.unifiedLogger ? new eO(e.unifiedLogger) : void 0
                }, function() {
                    return ek
                }, function() {
                    return eR
                }, function(e) {
                    return e.enableMrRouter ? new eC : void 0
                }],
                eU = function() {
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
                                        if (et(n, Array)) {
                                            var a = n.map(function(e) {
                                                return encodeURIComponent(String(e))
                                            }).join("&".concat(encodeURIComponent(o), "="));
                                            return "".concat(encodeURIComponent(o), "=").concat(a)
                                        }
                                        return et(n, Set) ? t(r, Array.from(n), i) : et(n, Date) ? "".concat(encodeURIComponent(o), "=").concat(encodeURIComponent(n.toISOString())) : et(n, Object) ? e(n, o) : "".concat(encodeURIComponent(o), "=").concat(encodeURIComponent(String(n)))
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
                                return _(e, void 0, void 0, function() {
                                    return B(this, function(e) {
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
                e_ = new eU,
                eB = function() {
                    function e(e) {
                        void 0 === e && (e = e_);
                        var t = this;
                        this.configuration = e, this.fetchApi = function(e, r, n) {
                            return _(t, void 0, void 0, function() {
                                var t, i, o, a, l, u, c, s, d, f, p, m, y, b = this;
                                return B(this, function(h) {
                                    switch (h.label) {
                                        case 0:
                                            t = function(e, t) {
                                                return b.fetchApi(e, t, n)
                                            }, i = {
                                                url: e,
                                                init: r
                                            }, o = 0, a = this.middleware, h.label = 1;
                                        case 1:
                                            return o < a.length ? (y = a[o]).pre ? [4, y.pre(U({
                                                fetch: t
                                            }, i))] : [3, 3] : [3, 4];
                                        case 2:
                                            i = h.sent() || i, h.label = 3;
                                        case 3:
                                            return o++, [3, 1];
                                        case 4:
                                            l = void 0, u = performance.now(), h.label = 5;
                                        case 5:
                                            return h.trys.push([5, 7, , 12]), [4, (this.configuration.fetchApi || fetch)(i.url, i.init)];
                                        case 6:
                                            return l = h.sent(), c = performance.now(), [3, 12];
                                        case 7:
                                            s = h.sent(), c = performance.now(), d = 0, f = this.middleware, h.label = 8;
                                        case 8:
                                            return d < f.length ? (y = f[d]).onError ? [4, y.onError({
                                                fetch: t,
                                                url: i.url,
                                                init: i.init,
                                                error: s,
                                                response: l ? l.clone() : void 0
                                            })] : [3, 10] : [3, 11];
                                        case 9:
                                            l = h.sent() || l, h.label = 10;
                                        case 10:
                                            return d++, [3, 8];
                                        case 11:
                                            if (void 0 === l) throw et(s, Error) ? new eY(s, "The request failed and the interceptors did not return an alternative response") : s;
                                            return [3, 12];
                                        case 12:
                                            p = 0, m = this.middleware, h.label = 13;
                                        case 13:
                                            return p < m.length ? (y = m[p]).post ? [4, y.post({
                                                fetch: t,
                                                url: i.url,
                                                init: i.init,
                                                response: l.clone(),
                                                elapsedTime: c - u,
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
                        return _(this, void 0, void 0, function() {
                            var r, n, i, o;
                            return B(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        return [4, this.createFetchParams(e, t)];
                                    case 1:
                                        return n = (r = a.sent()).url, i = r.init, [4, this.fetchApi(n, i, e.schemaPath)];
                                    case 2:
                                        if ((o = a.sent()) && o.status >= 200 && o.status < 300) return [2, o];
                                        throw new eF(o, "Response from ".concat(o.url, " returned an error code ").concat(o.status))
                                }
                            })
                        })
                    }, e.prototype.createFetchParams = function(e, t) {
                        return _(this, void 0, void 0, function() {
                            var r, n, i, o, a, l, u, c = this;
                            return B(this, function(s) {
                                var d, f;
                                switch (s.label) {
                                    case 0:
                                        return r = this.configuration.basePath + e.path, void 0 !== e.query && 0 !== Object.keys(e.query).length && (r += "?" + this.configuration.queryParamsStringify(e.query)), Object.keys(n = Object.assign({}, this.configuration.headers, e.headers)).forEach(function(e) {
                                            return void 0 === n[e] ? delete n[e] : {}
                                        }), i = "function" == typeof t ? t : function() {
                                            return _(c, void 0, void 0, function() {
                                                return B(this, function(e) {
                                                    return [2, t]
                                                })
                                            })
                                        }, o = {
                                            method: e.method,
                                            headers: n,
                                            body: e.body,
                                            credentials: this.configuration.credentials
                                        }, l = [U({}, o)], [4, i({
                                            init: o,
                                            context: e
                                        })];
                                    case 1:
                                        return a = U.apply(void 0, l.concat([s.sent()])), u = U(U({}, a), {
                                            body: (d = a.body, "u" > typeof FormData && et(d, FormData) || et(a.body, URLSearchParams) || (f = a.body, "u" > typeof Blob && et(f, Blob)) ? a.body : JSON.stringify(a.body))
                                        }), [2, {
                                            url: r,
                                            init: u
                                        }]
                                }
                            })
                        })
                    }, e.prototype.clone = function() {
                        var e = new(0, this.constructor)(this.configuration);
                        return e.middleware = this.middleware.slice(), e
                    }, e.jsonRegex = RegExp("^(:?application/json|[^;/ 	]+/[^;/ 	]+[+]json)[ 	]*(:?;.*)?$", "i"), e
                }(),
                eF = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.response = t, n.name = "ResponseError", n
                    }
                    return z(t, e), t
                }(Error),
                eY = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.cause = t, n.name = "FetchError", n
                    }
                    return z(t, e), t
                }(Error),
                eG = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.field = t, n.name = "RequiredError", n
                    }
                    return z(t, e), t
                }(Error);

            function eV(e, t) {
                return null != e[t]
            }
            var eW = function() {
                    function e(e, t) {
                        void 0 === t && (t = function(e) {
                            return e
                        }), this.raw = e, this.transformer = t
                    }
                    return e.prototype.value = function() {
                        return _(this, void 0, void 0, function() {
                            var e;
                            return B(this, function(t) {
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
                eQ = function() {
                    function e(e) {
                        this.raw = e
                    }
                    return e.prototype.value = function() {
                        return _(this, void 0, void 0, function() {
                            return B(this, function(e) {
                                return [2, void 0]
                            })
                        })
                    }, e
                }(),
                eq = ((function(e) {
                    this.raw = e
                }).prototype.value = function() {
                    return _(this, void 0, void 0, function() {
                        return B(this, function(e) {
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
                        return _(this, void 0, void 0, function() {
                            return B(this, function(e) {
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
                eK = function(e) {
                    function t(t) {
                        void 0 === t && (t = {});
                        var r, n = U({}, t),
                            i = n.middleware || [];
                        return i.unshift.apply(i, (r = t, ez.map(function(e) {
                            return e(r)
                        }).filter(function(e) {
                            return e
                        }))), n.middleware = i, e.call(this, n) || this
                    }
                    return z(t, e), t
                }(eU);

            function eH(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var eX = function(e, t) {
                return (eX = Object.setPrototypeOf || eH({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function eZ(e, t, r, n) {
                return new(r || (r = Promise))(function(i, o) {
                    function a(e) {
                        try {
                            u(n.next(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function l(e) {
                        try {
                            u(n.throw(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function u(e) {
                        var t;
                        e.done ? i(e.value) : (eH(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, l)
                    }
                    u((n = n.apply(e, t || [])).next())
                })
            }

            function e$(e, t) {
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
                    return function(u) {
                        var c = [l, u];
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
            var eJ = "CreditAndDebitCard",
                e0 = "Paypal",
                e1 = "Venmo";

            function e2(e) {
                return e
            }
            var e4 = "Week",
                e3 = "Month",
                e5 = "Year";

            function e6(e, t) {
                return null == e ? e : {
                    currencyCode: e.currencyCode,
                    units: e.units,
                    nanos: e.nanos
                }
            }
            var e8 = "Braintree";

            function e9(e) {
                return e
            }

            function e7(e) {
                var t, r;
                return null == (t = e) ? t : {
                    offerType: eV(t, "offerType") ? t.offerType : void 0,
                    freeTrialOffer: eV(t, "freeTrialOffer") ? null == (r = t.freeTrialOffer) ? r : {
                        periodType: r.periodType,
                        duration: r.duration,
                        estimatedTrialEndDate: eV(r, "estimatedTrialEndDate") ? null === r.estimatedTrialEndDate ? null : new Date(r.estimatedTrialEndDate) : void 0
                    } : void 0
                }
            }
            var te = "CurrencySubscription",
                tt = "Blackbird";

            function tr(e) {
                var t;
                return null == (t = e) ? t : {
                    type: t.type,
                    id: t.id
                }
            }

            function tn(e) {
                var t;
                return null == (t = e) ? t : {
                    tierId: t.tierId,
                    periodIndex: t.periodIndex,
                    discountPercent: t.discountPercent
                }
            }

            function ti(e) {
                var t, r, n, i, o, a, l, u, c;
                return null == (t = e) ? t : {
                    productKey: tr(t.productKey),
                    periodType: t.periodType,
                    periodCount: t.periodCount,
                    localizedPrice: e6(t.localizedPrice),
                    localizedPriceDisplayString: t.localizedPriceDisplayString,
                    localizedStrikethroughPrice: e6(t.localizedStrikethroughPrice),
                    localizedStrikethroughPriceDisplayString: t.localizedStrikethroughPriceDisplayString,
                    productTypeDetails: null == (r = t.productTypeDetails) ? r : {
                        currencySubscriptionProductDetails: eV(r, "currencySubscriptionProductDetails") ? null == (n = r.currencySubscriptionProductDetails) ? n : {
                            currencyType: n.currencyType,
                            entitledAmountMicros: n.entitledAmountMicros
                        } : void 0,
                        developerSubscriptionProductDetails: eV(r, "developerSubscriptionProductDetails") ? null == (i = r.developerSubscriptionProductDetails) ? i : {
                            universeId: i.universeId,
                            imageAssetId: i.imageAssetId,
                            localizedName: i.localizedName,
                            localizedDescription: i.localizedDescription
                        } : void 0,
                        robloxSubscriptionProductDetails: eV(r, "robloxSubscriptionProductDetails") ? null == (o = r.robloxSubscriptionProductDetails) ? o : {
                            featureConfig: null == (a = o.featureConfig) ? a : {
                                virtualTransactionDiscounts: null === a.virtualTransactionDiscounts ? null : a.virtualTransactionDiscounts.map(tn),
                                isRobuxTransferEnabled: a.isRobuxTransferEnabled,
                                isTradingEnabled: a.isTradingEnabled,
                                isUgcPublishingEnabled: a.isUgcPublishingEnabled,
                                privateServerDiscounts: null === a.privateServerDiscounts ? null : a.privateServerDiscounts.map(tn),
                                currencySubscriptionConfig: null == (l = a.currencySubscriptionConfig) ? l : {
                                    currencyType: l.currencyType,
                                    entitledAmountMicros: l.entitledAmountMicros
                                },
                                coreContentPublishingConfig: null == (u = a.coreContentPublishingConfig) ? u : {
                                    minimumPeriodIndex: u.minimumPeriodIndex
                                },
                                isAppThemesEnabled: a.isAppThemesEnabled,
                                isProfileFrameEnabled: a.isProfileFrameEnabled,
                                isAiBackgroundEnabled: a.isAiBackgroundEnabled,
                                robuxTransferConfig: null == (c = a.robuxTransferConfig) ? c : {
                                    isElevatedLimitEnabled: c.isElevatedLimitEnabled
                                },
                                referralConfig: a.referralConfig
                            }
                        } : void 0
                    },
                    eligibleOffers: t.eligibleOffers.map(e7)
                }
            }

            function to(e) {
                var t;
                return null == (t = e) ? t : {
                    planChangeId: t.planChangeId,
                    currentSubscriptionProductKey: tr(t.currentSubscriptionProductKey),
                    targetSubscriptionProductKey: tr(t.targetSubscriptionProductKey),
                    status: t.status,
                    scheduledTimestampMs: t.scheduledTimestampMs,
                    createdTimestampMs: t.createdTimestampMs,
                    updatedTimestampMs: t.updatedTimestampMs
                }
            }

            function ta(e) {
                var t;
                return null == (t = e) ? t : {
                    referralId: t.referralId,
                    senderUserId: t.senderUserId,
                    status: t.status,
                    createdTimestampMs: t.createdTimestampMs
                }
            }

            function tl(e) {
                var t, r, n, i, o, a, l;
                return null == (t = e) ? t : {
                    subscriptionId: t.subscriptionId,
                    productKey: tr(t.productKey),
                    periodType: t.periodType,
                    displayPrice: e6(t.displayPrice),
                    activationTimestampMs: t.activationTimestampMs,
                    expirationTimestampMs: t.expirationTimestampMs,
                    nextRenewalTimestampMs: t.nextRenewalTimestampMs,
                    paymentProvider: e9(t.paymentProvider),
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
                    activeOffers: t.activeOffers.map(e7),
                    productTypeMembershipDetails: null == (i = t.productTypeMembershipDetails) ? i : {
                        robloxSubscriptionMembershipDetails: eV(i, "robloxSubscriptionMembershipDetails") ? null == (o = i.robloxSubscriptionMembershipDetails) ? o : {
                            features: null == (a = o.features) ? a : {
                                productType: a.productType,
                                virtualTransactionDiscountTierId: a.virtualTransactionDiscountTierId,
                                isRobuxTransferEnabled: a.isRobuxTransferEnabled,
                                isTradingEnabled: a.isTradingEnabled,
                                isUgcPublishingEnabled: a.isUgcPublishingEnabled,
                                privateServerDiscountTierId: a.privateServerDiscountTierId,
                                isCoreContentPublishingEnabled: a.isCoreContentPublishingEnabled,
                                isAppThemesEnabled: a.isAppThemesEnabled,
                                isProfileFrameEnabled: a.isProfileFrameEnabled,
                                isAiBackgroundEnabled: a.isAiBackgroundEnabled,
                                isRobuxTransferElevatedLimitEnabled: a.isRobuxTransferElevatedLimitEnabled
                            },
                            currencySubscriptionBenefit: null == (l = o.currencySubscriptionBenefit) ? l : {
                                currencyType: l.currencyType,
                                entitledAmountMicrosPerGrantingPeriod: l.entitledAmountMicrosPerGrantingPeriod,
                                grantingPeriodType: l.grantingPeriodType
                            }
                        } : void 0
                    },
                    productInfo: ti(t.productInfo)
                }
            }
            var tu = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return function(e, t) {
                        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                        function r() {
                            this.constructor = e
                        }
                        eX(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
                    }(t, e), t.prototype.subscriptionsV2CheckSubscriptionReferralEligibilityRaw = function(e, t) {
                        return eZ(this, void 0, void 0, function() {
                            var r, n;
                            return e$(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return r = {}, void 0 !== e.referrerId && (r.referrerId = e.referrerId), n = {}, [4, this.request({
                                            path: "/v2/referral-eligibility",
                                            schemaPath: "/v2/referral-eligibility",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eW(i.sent(), function(e) {
                                            return null == e ? e : {
                                                eligibility: e.eligibility,
                                                ineligibilityReason: eV(e, "ineligibilityReason") ? e.ineligibilityReason : void 0
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2CheckSubscriptionReferralEligibility = function() {
                        return eZ(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), e$(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2CheckSubscriptionReferralEligibilityRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ClaimSubscriptionProductRaw = function(e, t) {
                        return eZ(this, void 0, void 0, function() {
                            var r, n;
                            return e$(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eG("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2ClaimSubscriptionProduct.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eG("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2ClaimSubscriptionProduct.");
                                        return r = {}, void 0 !== e.grantType && (r.grantType = e.grantType), n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/claim".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/claim",
                                            method: "POST",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eW(i.sent())]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ClaimSubscriptionProduct = function(e, t) {
                        return eZ(this, void 0, void 0, function() {
                            return e$(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2ClaimSubscriptionProductRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2CreateSubscriptionReferralRaw = function(e, t) {
                        return eZ(this, void 0, void 0, function() {
                            var r, n;
                            return e$(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return r = {}, void 0 !== e.referrerId && (r.referrerId = e.referrerId), n = {}, [4, this.request({
                                            path: "/v2/referrals",
                                            schemaPath: "/v2/referrals",
                                            method: "POST",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eW(i.sent(), function(e) {
                                            return null == e ? e : {
                                                referralId: e.referralId
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2CreateSubscriptionReferral = function() {
                        return eZ(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), e$(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2CreateSubscriptionReferralRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2CreateSubscriptionReferralLinkRaw = function(e) {
                        return eZ(this, void 0, void 0, function() {
                            var t, r;
                            return e$(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return t = {}, r = {}, [4, this.request({
                                            path: "/v2/referral-links",
                                            schemaPath: "/v2/referral-links",
                                            method: "POST",
                                            headers: r,
                                            query: t
                                        }, e)];
                                    case 1:
                                        return [2, new eW(n.sent(), function(e) {
                                            return null == e ? e : {
                                                deepLinkUrl: e.deepLinkUrl
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2CreateSubscriptionReferralLink = function(e) {
                        return eZ(this, void 0, void 0, function() {
                            return e$(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2CreateSubscriptionReferralLinkRaw(e)];
                                    case 1:
                                        return [4, t.sent().value()];
                                    case 2:
                                        return [2, t.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductDisplayPriceRaw = function(e, t) {
                        return eZ(this, void 0, void 0, function() {
                            var r, n;
                            return e$(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eG("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eG("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        return r = {}, n = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eW(i.sent(), function(e) {
                                            return null == e ? e : {
                                                displayPrice: e6(e.displayPrice)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductDisplayPrice = function(e, t) {
                        return eZ(this, void 0, void 0, function() {
                            return e$(this, function(r) {
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
                        return eZ(this, void 0, void 0, function() {
                            var r, n;
                            return e$(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eG("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eG("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/payment-metadata".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/payment-metadata",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eW(i.sent(), function(e) {
                                            return null == e ? e : {
                                                paymentMethods: e.paymentMethods.map(e2),
                                                paymentProviders: e.paymentProviders.map(e9)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductPaymentMetadata = function(e, t) {
                        return eZ(this, void 0, void 0, function() {
                            return e$(this, function(r) {
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
                        return eZ(this, void 0, void 0, function() {
                            var r, n;
                            return e$(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eG("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eG("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        return r = {}, void 0 !== e.referrerId && (r.referrerId = e.referrerId), n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eW(i.sent(), function(e) {
                                            return null == e ? e : {
                                                subscriptionProductInfo: ti(e.subscriptionProductInfo)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetSubscriptionProductInfo = function(e, t) {
                        return eZ(this, void 0, void 0, function() {
                            return e$(this, function(r) {
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
                        return eZ(this, void 0, void 0, function() {
                            var r, n;
                            return e$(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return r = {}, void 0 !== e.productType && (r.ProductType = e.productType), void 0 !== e.includePurchased && (r.IncludePurchased = e.includePurchased), void 0 !== e.includeBundles && (r.IncludeBundles = e.includeBundles), void 0 !== e.purchasePlatform && (r.PurchasePlatform = e.purchasePlatform), void 0 !== e.skipEligibilityCheck && (r.SkipEligibilityCheck = e.skipEligibilityCheck), void 0 !== e.grantType && (r.GrantType = e.grantType), void 0 !== e.paymentProvider && (r.PaymentProvider = e.paymentProvider), void 0 !== e.includeExtendedTermProducts && (r.IncludeExtendedTermProducts = e.includeExtendedTermProducts), void 0 !== e.referrerId && (r.ReferrerId = e.referrerId), void 0 !== e.includePlanChanges && (r.IncludePlanChanges = e.includePlanChanges), n = {}, [4, this.request({
                                            path: "/v2/products",
                                            schemaPath: "/v2/products",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eW(i.sent(), function(e) {
                                            return null == e ? e : {
                                                productKeys: e.productKeys.map(tr),
                                                products: e.products.map(ti)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListAvailableSubscriptionProducts = function() {
                        return eZ(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), e$(this, function(r) {
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
                    }, t.prototype.subscriptionsV2ListSubscriptionPlanChangesRaw = function(e, t) {
                        return eZ(this, void 0, void 0, function() {
                            var r, n;
                            return e$(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionId || void 0 === e.subscriptionId) throw new eG("subscriptionId", "Required parameter requestParameters.subscriptionId was null or undefined when calling subscriptionsV2ListSubscriptionPlanChanges.");
                                        return r = {}, void 0 !== e.status && (r.status = e.status), void 0 !== e.pageSize && (r.pageSize = e.pageSize), void 0 !== e.cursor && (r.cursor = e.cursor), n = {}, [4, this.request({
                                            path: "/v2/subscriptions/{subscriptionId}/plan-changes".replace("{".concat("subscriptionId", "}"), encodeURIComponent(String(e.subscriptionId))),
                                            schemaPath: "/v2/subscriptions/{subscriptionId}/plan-changes",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eW(i.sent(), function(e) {
                                            return null == e ? e : {
                                                planChanges: e.planChanges.map(to),
                                                nextCursor: e.nextCursor,
                                                hasMore: e.hasMore
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListSubscriptionPlanChanges = function(e, t) {
                        return eZ(this, void 0, void 0, function() {
                            return e$(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2ListSubscriptionPlanChangesRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListSubscriptionReferralsRaw = function(e, t) {
                        return eZ(this, void 0, void 0, function() {
                            var r, n;
                            return e$(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return r = {}, void 0 !== e.status && (r.Status = e.status), void 0 !== e.earliestCreatedTimestampMs && (r.EarliestCreatedTimestampMs = e.earliestCreatedTimestampMs), void 0 !== e.pageSize && (r.PageSize = e.pageSize), void 0 !== e.cursor && (r.Cursor = e.cursor), n = {}, [4, this.request({
                                            path: "/v2/referrals",
                                            schemaPath: "/v2/referrals",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eW(i.sent(), function(e) {
                                            return null == e ? e : {
                                                referrals: e.referrals.map(ta),
                                                nextCursor: e.nextCursor,
                                                hasMore: e.hasMore
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListSubscriptionReferrals = function() {
                        return eZ(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), e$(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2ListSubscriptionReferralsRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListSubscriptionsRaw = function(e, t) {
                        return eZ(this, void 0, void 0, function() {
                            var r, n;
                            return e$(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return r = {}, void 0 !== e.productType && (r.ProductType = e.productType), void 0 !== e.expirationTimestampMsStart && (r.ExpirationTimestampMsStart = e.expirationTimestampMsStart), void 0 !== e.expirationTimestampMsEnd && (r.ExpirationTimestampMsEnd = e.expirationTimestampMsEnd), void 0 !== e.cursor && (r.Cursor = e.cursor), void 0 !== e.resultsPerPage && (r.ResultsPerPage = e.resultsPerPage), n = {}, [4, this.request({
                                            path: "/v2/user/subscriptions",
                                            schemaPath: "/v2/user/subscriptions",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eW(i.sent(), function(e) {
                                            return null == e ? e : {
                                                subscriptions: e.subscriptions.map(tl),
                                                hasMore: e.hasMore,
                                                cursor: e.cursor
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListSubscriptions = function() {
                        return eZ(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), e$(this, function(r) {
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
                        return eZ(this, void 0, void 0, function() {
                            var r, n;
                            return e$(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eG("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eG("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                                        return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxUniverseId && null !== e.robloxUniverseId && (n["Roblox-Universe-Id"] = String(e.robloxUniverseId)), [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/prepare-purchase".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/prepare-purchase",
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
                                                    paymentSessionId: e.paymentSessionId,
                                                    referrerId: e.referrerId
                                                }
                                            }(e.preparePurchaseV2Request)
                                        }, t)];
                                    case 1:
                                        return [2, new eW(i.sent(), function(e) {
                                            var t, r, n, i, o, a;
                                            return null == e ? e : {
                                                paymentProvider: e9(e.paymentProvider),
                                                providerPurchasePayload: null == (t = e.providerPurchasePayload) ? t : {
                                                    stripePurchasePayload: eV(t, "stripePurchasePayload") ? null == (r = t.stripePurchasePayload) ? r : {
                                                        checkoutUrl: r.checkoutUrl
                                                    } : void 0,
                                                    appleAppStorePurchasePayload: eV(t, "appleAppStorePurchasePayload") ? null == (n = t.appleAppStorePurchasePayload) ? n : {
                                                        appAccountToken: n.appAccountToken,
                                                        partnerBillingJwtToken: n.partnerBillingJwtToken,
                                                        partnerBillingGenericProductId: n.partnerBillingGenericProductId
                                                    } : void 0,
                                                    googlePlayStorePurchasePayload: eV(t, "googlePlayStorePurchasePayload") ? null == (i = t.googlePlayStorePurchasePayload) ? i : {
                                                        providerProductId: i.providerProductId,
                                                        providerProductType: i.providerProductType,
                                                        chargeRequestId: i.chargeRequestId,
                                                        offerId: eV(i, "offerId") ? i.offerId : void 0
                                                    } : void 0,
                                                    creditBalancePurchasePayload: eV(t, "creditBalancePurchasePayload") ? null == (o = t.creditBalancePurchasePayload) ? o : {
                                                        checkoutUrl: o.checkoutUrl,
                                                        checkoutToken: eV(o, "checkoutToken") ? o.checkoutToken : void 0,
                                                        robloxManagedTax: eV(o, "robloxManagedTax") ? o.robloxManagedTax : void 0,
                                                        requiresBillingAddress: eV(o, "requiresBillingAddress") ? o.requiresBillingAddress : void 0,
                                                        chargeRequestId: eV(o, "chargeRequestId") ? o.chargeRequestId : void 0,
                                                        baseAmount: eV(o, "baseAmount") ? o.baseAmount : void 0,
                                                        taxAmount: eV(o, "taxAmount") ? o.taxAmount : void 0,
                                                        totalAmount: eV(o, "totalAmount") ? o.totalAmount : void 0,
                                                        currencyCode: eV(o, "currencyCode") ? o.currencyCode : void 0
                                                    } : void 0,
                                                    braintreePurchasePayload: eV(t, "braintreePurchasePayload") ? null == (a = t.braintreePurchasePayload) ? a : {
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
                        return eZ(this, void 0, void 0, function() {
                            return e$(this, function(r) {
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
                    }, t.prototype.subscriptionsV2PrepareSubscriptionPlanChangeRaw = function(e, t) {
                        return eZ(this, void 0, void 0, function() {
                            var r, n;
                            return e$(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionId || void 0 === e.subscriptionId) throw new eG("subscriptionId", "Required parameter requestParameters.subscriptionId was null or undefined when calling subscriptionsV2PrepareSubscriptionPlanChange.");
                                        return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                            path: "/v2/subscriptions/{subscriptionId}/prepare-plan-change".replace("{".concat("subscriptionId", "}"), encodeURIComponent(String(e.subscriptionId))),
                                            schemaPath: "/v2/subscriptions/{subscriptionId}/prepare-plan-change",
                                            method: "POST",
                                            headers: n,
                                            query: r,
                                            body: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    targetSubscriptionProductKey: function(e) {
                                                        if (void 0 !== e) return null === e ? null : {
                                                            type: e.type,
                                                            id: e.id
                                                        }
                                                    }(e.targetSubscriptionProductKey)
                                                }
                                            }(e.prepareSubscriptionPlanChangeRequest)
                                        }, t)];
                                    case 1:
                                        return [2, new eW(i.sent(), function(e) {
                                            return null == e ? e : {
                                                planChangeId: e.planChangeId
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2PrepareSubscriptionPlanChange = function(e, t) {
                        return eZ(this, void 0, void 0, function() {
                            return e$(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2PrepareSubscriptionPlanChangeRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ReserveSubscriptionPlanChangeRaw = function(e, t) {
                        return eZ(this, void 0, void 0, function() {
                            var r, n;
                            return e$(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionId || void 0 === e.subscriptionId) throw new eG("subscriptionId", "Required parameter requestParameters.subscriptionId was null or undefined when calling subscriptionsV2ReserveSubscriptionPlanChange.");
                                        return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                            path: "/v2/subscriptions/{subscriptionId}/reserve-plan-change".replace("{".concat("subscriptionId", "}"), encodeURIComponent(String(e.subscriptionId))),
                                            schemaPath: "/v2/subscriptions/{subscriptionId}/reserve-plan-change",
                                            method: "POST",
                                            headers: n,
                                            query: r,
                                            body: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    planChangeId: e.planChangeId
                                                }
                                            }(e.reserveSubscriptionPlanChangeRequest)
                                        }, t)];
                                    case 1:
                                        return [2, new eQ(i.sent())]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ReserveSubscriptionPlanChange = function(e, t) {
                        return eZ(this, void 0, void 0, function() {
                            return e$(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2ReserveSubscriptionPlanChangeRaw(e, t)];
                                    case 1:
                                        return r.sent(), [2]
                                }
                            })
                        })
                    }, t
                }(eB),
                tc = window.Roblox["core-scripts"].endpoints,
                ts = window.Roblox["core-scripts"].guac,
                td = window.Roblox["core-scripts"].meta.device,
                tf = function() {
                    var e, t = document.querySelector('meta[name="subscription-referral-data"]');
                    return null != (e = null == t ? void 0 : t.dataset) ? e : null
                },
                tp = function() {
                    var e;
                    return (null == (e = tf()) ? void 0 : e.isEnabled) === "true"
                },
                tm = "https://www.roblox.com/info/terms",
                ty = "referrals",
                tb = "roblox_subscription_redirect_url",
                th = window.React,
                tg = r.n(th),
                tv = function() {
                    for (var e, t, r = 0, n = "", i = arguments.length; r < i; r++)(e = arguments[r]) && (t = function e(t) {
                        var r, n, i = "";
                        if ("string" == typeof t || "number" == typeof t) i += t;
                        else if ("object" == (void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t))
                            if (Array.isArray(t)) {
                                var o = t.length;
                                for (r = 0; r < o; r++) t[r] && (n = e(t[r])) && (i && (i += " "), i += n)
                            } else
                                for (n in t) t[n] && (i && (i += " "), i += n);
                        return i
                    }(e)) && (n && (n += " "), n += t);
                    return n
                };

            function tw(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tx(e) {
                if (Array.isArray(e)) return e
            }

            function tj() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function tO(e, t) {
                if (e) {
                    if ("string" == typeof e) return tw(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tw(e, t)
                }
            }
            var tS = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                tI = tg().forwardRef(function(e, t) {
                    var r, n = tx(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || tO(r) || tj(),
                        i = n[0],
                        o = n.slice(1),
                        a = i.name,
                        l = i.size,
                        u = i.className,
                        c = (i.children, function(e, t) {
                            if (null == e) return {};
                            var r, n, i, o = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }
                            if (o = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, i = {},
                                        o = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                    return i
                                }(e, t), Object.getOwnPropertySymbols)
                                for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }(i, ["name", "size", "className", "children"])),
                        s = (tx(o) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(o) || tO(o, 1) || tj())[0];
                    return tg().createElement("span", function(e) {
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
                        ref: s,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: tv("grow-0 shrink-0 basis-auto icon", a, tS[void 0 === l ? "Medium" : l], u)
                    }, c))
                });
            tI.displayName = "Icon";
            var tM = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                tP = function(e) {
                    var t = e.className;
                    return tg().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: tv("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                tN = "opacity-[0.5]",
                tT = function(e) {
                    var t = e.width,
                        r = e.height;
                    return tg().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, tg().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function tE(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tD(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function tA() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = tD(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : tD(t[e], null)
                        }
                    }
                }
            }

            function tL() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return th.useCallback(tA.apply(void 0, function(e) {
                    if (Array.isArray(e)) return tE(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tE(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tE(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function tC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tk(e) {
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

            function tR(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function tz(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }

            function tU(e) {
                return function(e) {
                    if (Array.isArray(e)) return tC(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tC(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tC(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function t_(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var tB = Symbol.for("react.lazy"),
                tF = th[" use ".trim().toString()];

            function tY(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : t_(e)) === "object" && "$$typeof" in e && e.$$typeof === tB && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : t_(t)) === "object" && null !== t && "then" in t
            }
            var tG = ((e = th.forwardRef(function(e, t) {
                    var r = e.children,
                        n = tz(e, ["children"]);
                    if (tY(r) && "function" == typeof tF && (r = tF(r._payload)), th.isValidElement(r)) {
                        var i, o, a, l, u, c = (u = (l = null == (o = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (u = (l = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                            s = function(e, t) {
                                var r = tk({}, t);
                                for (var n in t) ! function(n) {
                                    var i = e[n],
                                        o = t[n];
                                    /^on[A-Z]/.test(n) ? i && o ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = o.apply(void 0, tU(t));
                                        return i.apply(void 0, tU(t)), n
                                    } : i && (r[n] = i) : "style" === n ? r[n] = tk({}, i, o) : "className" === n && (r[n] = [i, o].filter(Boolean).join(" "))
                                }(n);
                                return tk({}, e, r)
                            }(n, r.props);
                        return r.type !== th.Fragment && (s.ref = t ? tA(t, c) : c), th.cloneElement(r, s)
                    }
                    return th.Children.count(r) > 1 ? th.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), i = e, (o = th.forwardRef(function(e, t) {
                    var r = e.children,
                        n = tz(e, ["children"]);
                    tY(r) && "function" == typeof tF && (r = tF(r._payload));
                    var o = th.Children.toArray(r),
                        a = o.find(tW);
                    if (a) {
                        var l = a.props.children,
                            u = o.map(function(e) {
                                return e !== a ? e : th.Children.count(l) > 1 ? th.Children.only(null) : th.isValidElement(l) ? l.props.children : null
                            });
                        return (0, T.jsx)(i, tR(tk({}, n), {
                            ref: t,
                            children: th.isValidElement(l) ? th.cloneElement(l, void 0, u) : null
                        }))
                    }
                    return (0, T.jsx)(i, tR(tk({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), o),
                tV = Symbol("radix.slottable");

            function tW(e) {
                return th.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === tV
            }

            function tQ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tq(e) {
                if (Array.isArray(e)) return e
            }

            function tK() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function tH(e) {
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

            function tX(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function tZ(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }

            function t$(e, t) {
                if (e) {
                    if ("string" == typeof e) return tQ(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tQ(e, t)
                }
            }
            var tJ = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                t0 = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                t1 = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                t2 = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                t4 = (0, th.forwardRef)(function(e, t) {
                    var r, n = tq(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || t$(r) || tK(),
                        i = n[0],
                        o = n.slice(1),
                        a = i.children,
                        l = i.className,
                        u = i.style,
                        c = i.isDisabled,
                        s = void 0 !== c && c,
                        d = i.isLoading,
                        f = void 0 !== d && d,
                        p = i.icon,
                        m = i.size,
                        y = void 0 === m ? "Large" : m,
                        b = i.variant,
                        h = void 0 === b ? "Emphasis" : b,
                        g = i.asChild,
                        v = tZ(i, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        w = (tq(o) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(o) || t$(o, 1) || tK())[0],
                        x = tv("foundation-web-button", s ? tN : [tM, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", t0[y], s ? t2[h] : t1[h], l),
                        j = tH({
                            textDecoration: "none"
                        }, u),
                        O = function(e) {
                            return tg().createElement(tg().Fragment, null, tg().createElement(tP, null), f && tg().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, tg().createElement(tT, {
                                width: tJ[y],
                                height: tJ[y]
                            })), tg().createElement("span", {
                                className: tv("flex items-center min-width-0", "Large" === y || "Medium" === y ? "gap-small" : "gap-xsmall", f && "invisible")
                            }, p && tg().createElement(tI, {
                                name: p,
                                size: y
                            }), tg().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (g) {
                        v.as;
                        var S = tZ(v, ["as"]),
                            I = tg().Children.only(a);
                        return tg().createElement(tG, tX(tH({
                            ref: w
                        }, S), {
                            className: x,
                            style: j,
                            "aria-disabled": s || void 0
                        }), tg().cloneElement(I, {}, O(I.props.children)))
                    }
                    if ("a" === v.as) {
                        v.as;
                        var M = v.href,
                            P = tZ(v, ["as", "href"]);
                        return tg().createElement("a", tX(tH({
                            ref: w
                        }, P), {
                            "aria-disabled": s,
                            href: s ? void 0 : M,
                            className: x,
                            style: j
                        }), O(a))
                    }
                    v.as;
                    var N = tZ(v, ["as"]);
                    return tg().createElement("button", tX(tH({
                        ref: w,
                        type: "button"
                    }, N), {
                        disabled: s,
                        className: x,
                        style: j
                    }), O(a))
                }),
                t3 = function() {
                    var e = (0, E.useTranslation)().translate,
                        t = (0, th.useCallback)(function() {
                            window.history.back()
                        }, []);
                    return (0, T.jsxs)("div", {
                        className: "height-[210px] gap-y-small margin-top-[240px] flex flex-col items-center",
                        children: [(0, T.jsx)(tI, {
                            className: "content-muted !size-1400",
                            name: "icon-regular-triangle-exclamation"
                        }), (0, T.jsx)("p", {
                            className: "text-heading-small",
                            children: e("Message.Error.Generic")
                        }), (0, T.jsxs)("div", {
                            className: "gap-x-medium padding-top-medium flex",
                            children: [(0, T.jsx)(t4, {
                                className: "min-width-[96px]",
                                size: "Small",
                                variant: "SoftEmphasis",
                                onClick: t,
                                children: e("Action.Back")
                            }), (0, T.jsx)(t4, {
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

            function t5(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function t6(e) {
                if (Array.isArray(e)) return e
            }

            function t8() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function t9(e) {
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

            function t7(e, t) {
                if (e) {
                    if ("string" == typeof e) return t5(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return t5(e, t)
                }
            }
            var re = (0, th.createContext)(null),
                rt = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-medium"
                },
                rr = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                rn = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                ri = (0, th.forwardRef)(function(e, t) {
                    var r = e.isContained,
                        n = e.size,
                        i = e.divider,
                        o = e.alignment,
                        a = e.title,
                        l = e.isTitleBold,
                        u = e.text,
                        c = e.isMultiline,
                        s = e.metadata,
                        d = e.description,
                        f = e.leading,
                        p = e.trailing,
                        m = e.onSelect,
                        y = e.className,
                        b = void 0 === s && void 0 === d && void 0 === o && void 0 === n;
                    if ((void 0 !== u || void 0 !== c) && !b) throw Error('ListItem: Cannot use deprecated "text" or "isMultiline" props with "metadata", "description", "alignment", or "size".');
                    var h = null != n ? n : "Large",
                        g = void 0 !== m,
                        v = g ? "button" : "div",
                        w = !!b && c,
                        x = "Top" === o ? "justify-start" : "justify-center";
                    w && (x = "justify-start");
                    var j = tg().createElement(v, t9({
                            className: tv("bg-none width-full flex gap-medium stroke-none foundation-web-list-item padding-y-none", r ? "padding-x-medium" : "padding-x-xlarge", "Full" === i && "foundation-web-list-item-bottom-divider", g && "relative clip group/interactable focus-visible:outline-focus disabled:outline-none", g && "cursor-pointer", y)
                        }, g && {
                            onClick: function() {
                                return m()
                            }
                        }), g && tg().createElement(tP, null), f && tg().createElement("div", {
                            className: tv("flex flex-col padding-y-large", x)
                        }, f), tg().createElement("div", {
                            className: "flex fill clip-x padding-y-large gap-x-medium relative "
                        }, tg().createElement("div", {
                            className: tv("flex flex-col fill clip-x justify-center", w && "gap-xsmall")
                        }, a && tg().createElement("div", {
                            className: tv("content-emphasis text-align-x-start", void 0 === l || l ? rr[h] : rn[h])
                        }, a), b && u && tg().createElement("div", {
                            className: tv("content-default text-align-x-start", rt[h], !c && "text-truncate-split text-no-wrap")
                        }, u), !b && s && tg().createElement("div", {
                            className: tv("content-default text-align-x-start text-truncate-split text-no-wrap", rt[h])
                        }, s), !b && d && tg().createElement("div", {
                            className: tv("content-default text-align-x-start padding-top-xsmall", rt[h])
                        }, d)), p && tg().createElement("div", {
                            className: tv("flex flex-col", x)
                        }, p), "Inset" === i && tg().createElement("div", {
                            className: "foundation-web-list-item-inset-divider"
                        }))),
                        O = (0, th.useMemo)(function() {
                            return {
                                size: h
                            }
                        }, [h]);
                    return tg().createElement("li", {
                        ref: t,
                        style: {
                            listStyle: "none"
                        }
                    }, tg().createElement(re.Provider, {
                        value: O
                    }, j))
                });
            ri.displayName = "ListItem";
            var ro = (0, th.forwardRef)(function(e, t) {
                var r, n = t6(r = [e, t]) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(r) || t7(r) || t8(),
                    i = n[0],
                    o = n.slice(1),
                    a = i.children,
                    l = i.className,
                    u = i.as,
                    c = function(e, t) {
                        if (null == e) return {};
                        var r, n, i, o = {};
                        if ("u" > typeof Reflect && Reflect.ownKeys) {
                            for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }
                        if (o = function(e, t) {
                                if (null == e) return {};
                                var r, n, i = {},
                                    o = Object.getOwnPropertyNames(e);
                                for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                return i
                            }(e, t), Object.getOwnPropertySymbols)
                            for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                        return o
                    }(i, ["children", "className", "as"]),
                    s = (t6(o) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var i = [],
                                o = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); o = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    o || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return i
                        }
                    }(o) || t7(o, 1) || t8())[0];
                return tg().createElement(void 0 === u ? "ul" : u, t9({
                    ref: s,
                    className: tv("foundation-web-list", l)
                }, c), a)
            });
            ro.displayName = "List";
            var ra = "height-full min-width-0 grow-1 gap-x-large radius-medium !bg-surface-100 stroke-standard stroke-default padding-medium box-border flex items-center",
                rl = function(e) {
                    var t = e.expandedPrimary,
                        r = e.expandedSecondary,
                        n = e.iconName,
                        i = e.onTileClick,
                        o = e.primary,
                        a = e.secondary,
                        l = (0, T.jsxs)(th.Fragment, {
                            children: [(0, T.jsx)("div", {
                                className: "flex shrink-0 items-center justify-center",
                                children: (0, T.jsx)(tI, {
                                    name: n,
                                    size: "Large"
                                })
                            }), (0, T.jsxs)("div", {
                                className: "min-width-0 grow-1 gap-xsmall flex flex-col justify-center",
                                children: [(0, T.jsx)("div", {
                                    className: "text-title-medium content-emphasis text-align-x-start",
                                    children: o
                                }), (0, T.jsx)("div", {
                                    className: "text-body-medium content-default text-align-x-start",
                                    children: a
                                })]
                            })]
                        });
                    return (0, T.jsx)("li", {
                        className: "min-width-0 height-full flex list-none flex-col [list-style:none]",
                        children: null != i ? (0, T.jsx)("button", {
                            "aria-label": o,
                            className: "".concat(ra, " width-full text-align-x-start cursor-pointer font-[inherit]"),
                            type: "button",
                            onClick: function() {
                                i(t, r)
                            },
                            children: l
                        }) : (0, T.jsx)("div", {
                            className: ra,
                            children: l
                        })
                    })
                },
                ru = function(e) {
                    var t = e.featureConfig,
                        r = e.overrideIconName,
                        n = e.onTileClick,
                        i = e.includeReferralBenefit,
                        o = (0, E.useTranslation)(),
                        a = o.translate,
                        l = o.intl,
                        u = (0, th.useMemo)(function() {
                            var e;
                            return null == (e = t.virtualTransactionDiscounts) ? void 0 : e.find(function(e) {
                                return 0 === e.periodIndex
                            })
                        }, [t]),
                        c = (0, th.useMemo)(function() {
                            var e;
                            return null == (e = t.virtualTransactionDiscounts) ? void 0 : e.filter(function(e) {
                                return e.periodIndex > 0
                            }).reduce(function(e, t) {
                                return null === e || t.periodIndex < e.periodIndex ? t : e
                            }, null)
                        }, [t]),
                        s = (0, th.useMemo)(function() {
                            var e;
                            return null == (e = t.privateServerDiscounts) ? void 0 : e.find(function(e) {
                                return 0 === e.periodIndex
                            })
                        }, [t]);
                    return (0, T.jsxs)(ro, {
                        className: "width-full large:[grid-template-columns:repeat(2,minmax(0,1fr))] grid gap-x-[12px] gap-y-[12px] [grid-template-columns:minmax(0,1fr)]",
                        children: [u && (0, T.jsx)(rl, {
                            expandedPrimary: a("Description.Benefit.DiscountBaseExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.DiscountBaseExpandedBody"),
                            iconName: null != r ? r : "icon-regular-tag",
                            primary: c ? a("Description.Benefit.DiscountBaseV2") : a("Description.Benefit.DiscountBase", {
                                discountPercent: l.n(.01 * u.discountPercent, {
                                    style: "percent"
                                })
                            }),
                            secondary: c ? a("Description.Benefit.DiscountBaseSubtitleV2", {
                                discountPercentTier1: l.n(.01 * u.discountPercent, {
                                    style: "percent"
                                }),
                                discountTier1Days: l.n(60),
                                discountPercentTier2: l.n(.01 * c.discountPercent, {
                                    style: "percent"
                                })
                            }) : a("Description.Benefit.DiscountBaseSubtitle"),
                            onTileClick: n
                        }), t.isAiBackgroundEnabled && (0, T.jsx)(rl, {
                            expandedPrimary: a("Description.Benefit.AvatarBackground"),
                            expandedSecondary: a("Description.Benefit.AvatarBackgroundSubtitle"),
                            iconName: null != r ? r : "icon-regular-image-person",
                            primary: a("Description.Benefit.AvatarBackground"),
                            secondary: a("Description.Benefit.AvatarBackgroundSubtitle"),
                            onTileClick: n
                        }), t.isAppThemesEnabled && (0, T.jsx)(rl, {
                            expandedPrimary: a("Description.Benefit.AppThemes"),
                            expandedSecondary: a("Description.Benefit.AppThemesSubtitle"),
                            iconName: null != r ? r : "icon-regular-paint-brush",
                            primary: a("Description.Benefit.AppThemes"),
                            secondary: a("Description.Benefit.AppThemesSubtitle"),
                            onTileClick: n
                        }), t.isProfileFrameEnabled && (0, T.jsx)(rl, {
                            expandedPrimary: a("Description.Benefit.ProfileFrames"),
                            expandedSecondary: a("Description.Benefit.ProfileFramesSubtitle"),
                            iconName: null != r ? r : "icon-regular-circle-dashed-person",
                            primary: a("Description.Benefit.ProfileFrames"),
                            secondary: a("Description.Benefit.ProfileFramesSubtitle"),
                            onTileClick: n
                        }), s && (0, T.jsx)(rl, {
                            expandedPrimary: a("Description.Benefit.PrivateServersExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.PrivateServersExpandedBody"),
                            iconName: null != r ? r : "icon-regular-controller",
                            primary: a("Description.Benefit.PrivateServers", {
                                discountPercent: l.n(.01 * s.discountPercent, {
                                    style: "percent"
                                })
                            }),
                            secondary: a("Description.Benefit.PrivateServersSubtitle"),
                            onTileClick: n
                        }), t.isRobuxTransferEnabled && (0, T.jsx)(rl, {
                            expandedPrimary: a("Description.Benefit.RobuxTransfersExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.RobuxTransfersExpandedBody"),
                            iconName: null != r ? r : "icon-regular-robux",
                            primary: a("Description.Benefit.RobuxTransfers"),
                            secondary: a("Description.Benefit.RobuxTransfersSubtitle"),
                            onTileClick: n
                        }), t.isTradingEnabled && (0, T.jsx)(rl, {
                            expandedPrimary: a("Description.Benefit.TradeResellItemsExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.TradeResellItemsExpandedBody"),
                            iconName: null != r ? r : "icon-regular-hand-two-arrows-horizontal",
                            primary: a("Description.Benefit.TradeResellItems"),
                            secondary: a("Description.Benefit.TradeResellItemsSubtitle"),
                            onTileClick: n
                        }), t.isUgcPublishingEnabled && (0, T.jsx)(rl, {
                            expandedPrimary: a("Description.Benefit.PublishItemsExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.PublishItemsExpandedBody"),
                            iconName: null != r ? r : "icon-regular-arrow-up-from-landscape-rectangle",
                            primary: a("Description.Benefit.PublishItems"),
                            secondary: a("Description.Benefit.PublishItemsSubtitle"),
                            onTileClick: n
                        }), void 0 !== i && i && tp() && (0, T.jsx)(rl, {
                            expandedPrimary: a("Description.Benefit.Referral"),
                            expandedSecondary: a("Description.Benefit.ReferralSubtitle", {
                                amount: l.n(100)
                            }),
                            iconName: null != r ? r : "icon-regular-person-plus",
                            primary: a("Description.Benefit.Referral"),
                            secondary: a("Description.Benefit.ReferralSubtitle", {
                                amount: l.n(100)
                            }),
                            onTileClick: n
                        })]
                    })
                },
                rc = function(e) {
                    var t = e.children;
                    return (0, T.jsx)("div", {
                        children: t
                    })
                },
                rs = function() {
                    return (0, T.jsx)("div", {
                        className: "backdrop-texture width-full height-[210px] pointer-events-none absolute"
                    })
                },
                rd = function() {
                    return (0, T.jsx)("div", {
                        className: "stroke-default stroke-standard self-stretch"
                    })
                };

            function rf(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            rf(v = {}, tt.toLowerCase(), tt), rf(v, "robloxplus", tt), rf(v, te.toLowerCase(), te), rf(w = {}, e4, "Weekly"), rf(w, e3, "Monthly"), rf(w, e5, "Yearly"), rf(x = {}, e4, "Label.DurationTitleWeekly"), rf(x, e3, "Label.DurationTitle"), rf(x, e5, "Label.DurationTitleYearly");
            var rp = (rf(j = {}, e4, {
                singular: "Label.SubscriptionPeriodWeek",
                plural: "Label.SubscriptionPeriodWeeks"
            }), rf(j, e3, {
                singular: "Label.SubscriptionPeriodMonth",
                plural: "Label.SubscriptionPeriodMonths"
            }), rf(j, e5, {
                singular: "Label.SubscriptionPeriodYear",
                plural: "Label.SubscriptionPeriodYears"
            }), j);

            function rm(e) {
                return e.units + e.nanos / 1e9
            }

            function ry(e) {
                var t = e.price,
                    r = e.strikethroughPrice;
                if (r && r.currencyCode === t.currencyCode && !(r.amount <= t.amount)) {
                    var n = Math.round((1 - t.amount / r.amount) * 100);
                    return n > 0 ? n : void 0
                }
            }

            function rb(e) {
                var t = e.productTypeDetails.robloxSubscriptionProductDetails;
                if (!(null == t ? void 0 : t.featureConfig)) throw Error("featureConfig is missing on robloxSubscriptionProductDetails");
                return t.featureConfig
            }

            function rh(e) {
                var t, r = e.productTypeDetails.robloxSubscriptionProductDetails,
                    n = null == r ? void 0 : r.featureConfig.currencySubscriptionConfig;
                return Math.floor((null != (t = null == n ? void 0 : n.entitledAmountMicros) ? t : 0) / 1e6)
            }

            function rg(e) {
                return function(e, t) {
                    var r = null != t && t > 0 ? t : 1;
                    switch (e) {
                        case e3:
                            return r;
                        case e5:
                            return 12 * r;
                        case e4:
                            return
                    }
                }(e.periodType, e.periodCount)
            }

            function rv(e) {
                return e.eligibleOffers.find(function(e) {
                    return "FreeTrial" === e.offerType
                })
            }

            function rw(e) {
                return !!e && void 0 !== rv(e)
            }

            function rx(e) {
                var t, r, n, i = e.localizedPrice,
                    o = e.localizedStrikethroughPrice,
                    a = null == (n = rv(e)) || null == (r = n.freeTrialOffer) ? void 0 : r.estimatedTrialEndDate;
                return {
                    productId: e.productKey.id,
                    productType: e.productKey.type,
                    months: null != (t = rg(e)) ? t : 1,
                    price: {
                        amount: rm(i),
                        currencyCode: i.currencyCode
                    },
                    strikethroughPrice: o ? {
                        amount: rm(o),
                        currencyCode: o.currencyCode
                    } : void 0,
                    freeTrialEndDate: a ? new Date(a) : void 0
                }
            }
            rf(O = {}, eJ.toLowerCase(), eJ), rf(O, e0.toLowerCase(), e0), rf(O, e1.toLowerCase(), e1), rf(S = {}, eJ, "Stripe"), rf(S, e0, e8), rf(S, e1, e8), rf(S, "RobloxCredit", "CreditBalance");
            var rj = function(e) {
                var t = e.robloxSubscriptionProduct,
                    r = e.onDismiss,
                    n = (0, E.useTranslation)().translate,
                    i = (0, T.jsx)(t4, {
                        className: "width-full",
                        size: "Large",
                        variant: "Emphasis",
                        onClick: r,
                        children: n("Action.OK")
                    }),
                    o = (0, T.jsxs)("p", {
                        className: "text-body-small content-muted text-center",
                        children: [n("Description.FeatureAccessDisclaimer"), " ", (0, T.jsx)("a", {
                            className: "text-link",
                            href: "https://help.roblox.com/hc/articles/39143693116052-Understanding-Age-Checks-on-Roblox",
                            children: n("Action.ViewDetails")
                        })]
                    });
                return (0, T.jsxs)(th.Fragment, {
                    children: [(0, T.jsx)(rs, {}), (0, T.jsx)("div", {
                        className: "flex flex-col items-center",
                        children: (0, T.jsxs)("div", {
                            className: "padding-x-xlarge content-emphasis gap-y-xxlarge width-full large:max-width-[792px] flex flex-col",
                            children: [(0, T.jsxs)("div", {
                                className: "gap-y-small large:items-center flex flex-col items-start",
                                children: [(0, T.jsxs)("div", {
                                    className: "gap-x-small flex items-center",
                                    children: [(0, T.jsx)(tI, {
                                        className: "!size-600",
                                        name: "icon-regular-roblox-plus"
                                    }), (0, T.jsx)("h1", {
                                        className: "text-heading-medium",
                                        children: n("Title.FreeTrialConfirmation")
                                    })]
                                }), (0, T.jsx)("p", {
                                    className: "text-body-large content-default",
                                    children: n("Description.FreeTrialConfirmation")
                                })]
                            }), (0, T.jsx)(ru, {
                                featureConfig: rb(t),
                                periodType: t.periodType
                            }), (0, T.jsx)(rc, {
                                children: (0, T.jsxs)("div", {
                                    className: "large:flex large:flex-col large:items-center width-full gap-y-medium hidden",
                                    "data-testid": "free-trial-action-inline",
                                    children: [i, o]
                                })
                            })]
                        })
                    }), (0, T.jsxs)("div", {
                        "aria-label": n("Action.OK"),
                        className: "bottom-dock padding-t-medium bg-surface-100 large:!hidden width-full gap-y-medium flex flex-col",
                        "data-testid": "free-trial-action-dock",
                        role: "region",
                        children: [(0, T.jsx)(rd, {}), (0, T.jsxs)("div", {
                            className: "width-full gap-y-medium padding-b-[env(safe-area-inset-bottom\\,0px)] padding-x-xxlarge flex flex-col items-stretch",
                            children: [i, o]
                        })]
                    })]
                })
            };

            function rO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rS(e) {
                if (Array.isArray(e)) return e
            }

            function rI() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function rM(e, t) {
                if (e) {
                    if ("string" == typeof e) return rO(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rO(e, t)
                }
            }
            var rP = {
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
                rN = tg().forwardRef(function(e, t) {
                    var r, n = rS(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || rM(r) || rI(),
                        i = n[0],
                        o = n.slice(1),
                        a = i.className,
                        l = i.size,
                        u = void 0 === l ? "Large" : l,
                        c = i.variant,
                        s = i.value,
                        d = i.showValue,
                        f = void 0 !== d && d,
                        p = i.ariaLabel,
                        m = function(e, t) {
                            if (null == e) return {};
                            var r, n, i, o = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }
                            if (o = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, i = {},
                                        o = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                    return i
                                }(e, t), Object.getOwnPropertySymbols)
                                for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }(i, ["className", "size", "variant", "value", "showValue", "ariaLabel"]),
                        y = (rS(o) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(o) || rM(o, 1) || rI())[0],
                        b = rP[u],
                        h = b.dimension,
                        g = b.strokeWidth,
                        v = b.textClass,
                        w = b.valueContainerSize,
                        x = (h - g) / 2,
                        j = 2 * Math.PI * x,
                        O = h / 2,
                        S = Math.min(100, Math.max(0, void 0 === s ? 0 : s)),
                        I = f && void 0 !== w ? w : h,
                        M = "Determinate" === (void 0 === c ? "Determinate" : c);
                    return tg().createElement("div", function(e) {
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
                        ref: y,
                        className: tv("foundation-web-progress-circle inline-flex items-center justify-center", a),
                        role: "progressbar",
                        "aria-label": p,
                        "aria-valuemin": M ? 0 : void 0,
                        "aria-valuemax": M ? 100 : void 0,
                        "aria-valuenow": M ? S : void 0,
                        style: {
                            width: I,
                            height: I
                        }
                    }, m), tg().createElement("svg", {
                        width: h,
                        height: h,
                        viewBox: "0 0 ".concat(h, " ").concat(h),
                        className: "relative"
                    }, tg().createElement("circle", {
                        cx: O,
                        cy: O,
                        r: x,
                        fill: "none",
                        strokeWidth: g,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), tg().createElement("circle", {
                        cx: O,
                        cy: O,
                        r: x,
                        fill: "none",
                        strokeWidth: g,
                        strokeDasharray: M ? j : "".concat(.75 * j, " ").concat(.25 * j),
                        strokeDashoffset: M ? j * (1 - S / 100) : 0,
                        strokeLinecap: "round",
                        className: tv(!M && "foundation-web-progress-circle-indeterminate"),
                        style: M ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), M && f && "Large" === u && tg().createElement("div", {
                        className: tv("absolute content-emphasis flex items-center justify-center", v),
                        "aria-hidden": "true"
                    }, tg().createElement("span", null, Math.round(S)), tg().createElement("span", null, "%")))
                });
            rN.displayName = "ProgressCircle";
            var rT = function() {
                    var e = (0, E.useTranslation)().translate;
                    return (0, T.jsx)("div", {
                        className: "margin-top-[240px] flex flex-col items-center",
                        children: (0, T.jsx)(rN, {
                            ariaLabel: e("Label.Loading"),
                            size: "Medium",
                            variant: "Indeterminate"
                        })
                    })
                },
                rE = window.Roblox["core-scripts"].meta.user,
                rD = 0,
                rA = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        t = (0, th.useRef)();
                    return t.current || (rD += 1, t.current = "".concat(e).concat(rD)), t.current
                };

            function rL(e) {
                var t = e.className;
                return tg().createElement("svg", {
                    xmlns: "http://www.w3.org/2000/svg",
                    width: "13",
                    height: "6",
                    viewBox: "0 0 13 6",
                    fill: "none",
                    className: tv("block", t),
                    style: {
                        marginTop: -1
                    }
                }, tg().createElement("path", {
                    d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
                    fill: "currentColor"
                }))
            }

            function rC(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    i = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === i || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function rk(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rR(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function rz() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = rR(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : rR(t[e], null)
                        }
                    }
                }
            }

            function rU() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return th.useCallback(rz.apply(void 0, function(e) {
                    if (Array.isArray(e)) return rk(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return rk(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rk(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function r_(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rB(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function rF(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        rB(e, t, r[t])
                    })
                }
                return e
            }

            function rY(e) {
                return function(e) {
                    if (Array.isArray(e)) return r_(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return r_(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return r_(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rG(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    n = function() {
                        var t = r.map(function(e) {
                            return th.createContext(e)
                        });
                        return function(r) {
                            var n = (null == r ? void 0 : r[e]) || t;
                            return th.useMemo(function() {
                                var t, i;
                                return rB({}, "__scope".concat(e), (t = rF({}, r), i = null != (i = rB({}, e, n)) ? i : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(i)) : (function(e) {
                                    var t = Object.keys(e);
                                    if (Object.getOwnPropertySymbols) {
                                        var r = Object.getOwnPropertySymbols(e);
                                        t.push.apply(t, r)
                                    }
                                    return t
                                })(Object(i)).forEach(function(e) {
                                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(i, e))
                                }), t))
                            }, [r, n])
                        }
                    };
                return n.scopeName = e, [function(t, n) {
                    var i = th.createContext(n),
                        o = r.length;
                    r = rY(r).concat([n]);
                    var a = function(t) {
                        var r, n = t.scope,
                            a = t.children,
                            l = function(e, t) {
                                if (null == e) return {};
                                var r, n, i, o = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                    return o
                                }
                                if (o = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, i = {},
                                            o = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                        return i
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }(t, ["scope", "children"]),
                            u = (null == n || null == (r = n[e]) ? void 0 : r[o]) || i,
                            c = th.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, T.jsx)(u.Provider, {
                            value: c,
                            children: a
                        })
                    };
                    return a.displayName = t + "Provider", [a, function(r, a) {
                        var l, u = (null == a || null == (l = a[e]) ? void 0 : l[o]) || i,
                            c = th.useContext(u);
                        if (c) return c;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, rV.apply(void 0, [n].concat(rY(t)))]
            }

            function rV() {
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
                            return rF({}, e, n(t)["__scope".concat(i)])
                        }, {});
                        return th.useMemo(function() {
                            return rB({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return i.scopeName = n.scopeName, i
            }
            var rW = window.RadixUI["react-dismissable-layer"],
                rQ = (null == (I = globalThis) ? void 0 : I.document) ? th.useLayoutEffect : function() {};

            function rq(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var rK = th["useId".toString()] || function() {},
                rH = 0,
                rX = ["top", "right", "bottom", "left"],
                rZ = Math.min,
                r$ = Math.max,
                rJ = Math.round,
                r0 = Math.floor,
                r1 = function(e) {
                    return {
                        x: e,
                        y: e
                    }
                },
                r2 = {
                    left: "right",
                    right: "left",
                    bottom: "top",
                    top: "bottom"
                },
                r4 = {
                    start: "end",
                    end: "start"
                };

            function r3(e, t) {
                return "function" == typeof e ? e(t) : e
            }

            function r5(e) {
                return e.split("-")[0]
            }

            function r6(e) {
                return e.split("-")[1]
            }

            function r8(e) {
                return "x" === e ? "y" : "x"
            }

            function r9(e) {
                return "y" === e ? "height" : "width"
            }
            var r7 = new Set(["top", "bottom"]);

            function ne(e) {
                return r7.has(r5(e)) ? "y" : "x"
            }

            function nt(e) {
                return e.replace(/start|end/g, function(e) {
                    return r4[e]
                })
            }
            var nr = ["left", "right"],
                nn = ["right", "left"],
                ni = ["top", "bottom"],
                no = ["bottom", "top"];

            function na(e) {
                return e.replace(/left|right|bottom|top/g, function(e) {
                    return r2[e]
                })
            }

            function nl(e) {
                return "number" != typeof e ? function(e) {
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
                    top: 0,
                    right: 0,
                    bottom: 0,
                    left: 0
                }, e) : {
                    top: e,
                    right: e,
                    bottom: e,
                    left: e
                }
            }

            function nu(e) {
                var t = e.x,
                    r = e.y,
                    n = e.width,
                    i = e.height;
                return {
                    width: n,
                    height: i,
                    top: r,
                    left: t,
                    right: t + n,
                    bottom: r + i,
                    x: t,
                    y: r
                }
            }

            function nc(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ns(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function nd(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var o = e.apply(t, r);

                        function a(e) {
                            ns(o, n, i, a, l, "next", e)
                        }

                        function l(e) {
                            ns(o, n, i, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function nf(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function np(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        nf(e, t, r[t])
                    })
                }
                return e
            }

            function nm(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function ny(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }

            function nb(e) {
                return function(e) {
                    if (Array.isArray(e)) return nc(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return nc(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nc(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nh(e, t) {
                var r, n, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(a, "next", {
                    value: u(0)
                }), l(a, "throw", {
                    value: u(1)
                }), l(a, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function u(l) {
                    return function(u) {
                        var c = [l, u];
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

            function ng(e, t, r) {
                var n, i = e.reference,
                    o = e.floating,
                    a = ne(t),
                    l = r8(ne(t)),
                    u = r9(l),
                    c = r5(t),
                    s = "y" === a,
                    d = i.x + i.width / 2 - o.width / 2,
                    f = i.y + i.height / 2 - o.height / 2,
                    p = i[u] / 2 - o[u] / 2;
                switch (c) {
                    case "top":
                        n = {
                            x: d,
                            y: i.y - o.height
                        };
                        break;
                    case "bottom":
                        n = {
                            x: d,
                            y: i.y + i.height
                        };
                        break;
                    case "right":
                        n = {
                            x: i.x + i.width,
                            y: f
                        };
                        break;
                    case "left":
                        n = {
                            x: i.x - o.width,
                            y: f
                        };
                        break;
                    default:
                        n = {
                            x: i.x,
                            y: i.y
                        }
                }
                switch (r6(t)) {
                    case "start":
                        n[l] -= p * (r && s ? -1 : 1);
                        break;
                    case "end":
                        n[l] += p * (r && s ? -1 : 1)
                }
                return n
            }

            function nv(e, t) {
                return nd(function() {
                    var r, n, i, o, a, l, u, c, s, d, f, p, m, y, b, h, g, v, w, x, j, O, S, I, M, P, N, T, E, D, A;
                    return nh(this, function(L) {
                        switch (L.label) {
                            case 0:
                                return void 0 === t && (t = {}), n = e.x, i = e.y, o = e.platform, a = e.rects, l = e.elements, u = e.strategy, d = void 0 === (s = (c = r3(t, e)).boundary) ? "clippingAncestors" : s, p = void 0 === (f = c.rootBoundary) ? "viewport" : f, y = void 0 === (m = c.elementContext) ? "floating" : m, h = void 0 !== (b = c.altBoundary) && b, v = nl(void 0 === (g = c.padding) ? 0 : g), w = "floating" === y ? "reference" : "floating", x = l[h ? w : y], O = o.getClippingRect, S = {}, [4, null == o.isElement ? void 0 : o.isElement(x)];
                            case 1:
                                if (!(null == (r = L.sent()) || r)) return [3, 2];
                                return I = x, [3, 5];
                            case 2:
                                if (M = x.contextElement) return [3, 4];
                                return [4, null == o.getDocumentElement ? void 0 : o.getDocumentElement(l.floating)];
                            case 3:
                                M = L.sent(), L.label = 4;
                            case 4:
                                I = M, L.label = 5;
                            case 5:
                                return [4, O.apply(o, [(S.element = I, S.boundary = d, S.rootBoundary = p, S.strategy = u, S)])];
                            case 6:
                                return j = nu.apply(void 0, [L.sent()]), P = "floating" === y ? {
                                    x: n,
                                    y: i,
                                    width: a.floating.width,
                                    height: a.floating.height
                                } : a.reference, [4, null == o.getOffsetParent ? void 0 : o.getOffsetParent(l.floating)];
                            case 7:
                                return N = L.sent(), [4, null == o.isElement ? void 0 : o.isElement(N)];
                            case 8:
                                if (!L.sent()) return [3, 10];
                                return [4, null == o.getScale ? void 0 : o.getScale(N)];
                            case 9:
                                return E = L.sent() || {
                                    x: 1,
                                    y: 1
                                }, [3, 11];
                            case 10:
                                E = {
                                    x: 1,
                                    y: 1
                                }, L.label = 11;
                            case 11:
                                if (T = E, !o.convertOffsetParentRelativeRectToViewportRelativeRect) return [3, 13];
                                return [4, o.convertOffsetParentRelativeRectToViewportRelativeRect({
                                    elements: l,
                                    rect: P,
                                    offsetParent: N,
                                    strategy: u
                                })];
                            case 12:
                                return A = L.sent(), [3, 14];
                            case 13:
                                A = P, L.label = 14;
                            case 14:
                                return D = nu.apply(void 0, [A]), [2, {
                                    top: (j.top - D.top + v.top) / T.y,
                                    bottom: (D.bottom - j.bottom + v.bottom) / T.y,
                                    left: (j.left - D.left + v.left) / T.x,
                                    right: (D.right - j.right + v.right) / T.x
                                }]
                        }
                    })
                })()
            }

            function nw(e, t) {
                return {
                    top: e.top - t.height,
                    right: e.right - t.width,
                    bottom: e.bottom - t.height,
                    left: e.left - t.width
                }
            }

            function nx(e) {
                return rX.some(function(t) {
                    return e[t] >= 0
                })
            }
            var nj = new Set(["left", "top"]);

            function nO(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function nS() {
                return "u" > typeof window
            }

            function nI(e) {
                return nN(e) ? (e.nodeName || "").toLowerCase() : "#document"
            }

            function nM(e) {
                var t;
                return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
            }

            function nP(e) {
                var t;
                return null == (t = (nN(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
            }

            function nN(e) {
                return !!nS() && (nO(e, Node) || nO(e, nM(e).Node))
            }

            function nT(e) {
                return !!nS() && (nO(e, Element) || nO(e, nM(e).Element))
            }

            function nE(e) {
                return !!nS() && (nO(e, HTMLElement) || nO(e, nM(e).HTMLElement))
            }

            function nD(e) {
                return !(!nS() || "u" < typeof ShadowRoot) && (nO(e, ShadowRoot) || nO(e, nM(e).ShadowRoot))
            }
            var nA = new Set(["inline", "contents"]);

            function nL(e) {
                var t = nV(e),
                    r = t.overflow,
                    n = t.overflowX,
                    i = t.overflowY,
                    o = t.display;
                return /auto|scroll|overlay|hidden|clip/.test(r + i + n) && !nA.has(o)
            }
            var nC = new Set(["table", "td", "th"]),
                nk = [":popover-open", ":modal"];

            function nR(e) {
                return nk.some(function(t) {
                    try {
                        return e.matches(t)
                    } catch (e) {
                        return !1
                    }
                })
            }
            var nz = ["transform", "translate", "scale", "rotate", "perspective"],
                nU = ["transform", "translate", "scale", "rotate", "perspective", "filter"],
                n_ = ["paint", "layout", "strict", "content"];

            function nB(e) {
                var t = nF(),
                    r = nT(e) ? nV(e) : e;
                return nz.some(function(e) {
                    return !!r[e] && "none" !== r[e]
                }) || !!r.containerType && "normal" !== r.containerType || !t && !!r.backdropFilter && "none" !== r.backdropFilter || !t && !!r.filter && "none" !== r.filter || nU.some(function(e) {
                    return (r.willChange || "").includes(e)
                }) || n_.some(function(e) {
                    return (r.contain || "").includes(e)
                })
            }

            function nF() {
                return !("u" < typeof CSS) && !!CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")
            }
            var nY = new Set(["html", "body", "#document"]);

            function nG(e) {
                return nY.has(nI(e))
            }

            function nV(e) {
                return nM(e).getComputedStyle(e)
            }

            function nW(e) {
                return nT(e) ? {
                    scrollLeft: e.scrollLeft,
                    scrollTop: e.scrollTop
                } : {
                    scrollLeft: e.scrollX,
                    scrollTop: e.scrollY
                }
            }

            function nQ(e) {
                if ("html" === nI(e)) return e;
                var t = e.assignedSlot || e.parentNode || nD(e) && e.host || nP(e);
                return nD(t) ? t.host : t
            }

            function nq(e, t, r) {
                void 0 === t && (t = []), void 0 === r && (r = !0);
                var n, i = function e(t) {
                        var r = nQ(t);
                        return nG(r) ? t.ownerDocument ? t.ownerDocument.body : t.body : nE(r) && nL(r) ? r : e(r)
                    }(e),
                    o = i === (null == (n = e.ownerDocument) ? void 0 : n.body),
                    a = nM(i);
                if (o) {
                    var l = nK(a);
                    return t.concat(a, a.visualViewport || [], nL(i) ? i : [], l && r ? nq(l) : [])
                }
                return t.concat(i, nq(i, [], r))
            }

            function nK(e) {
                return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
            }

            function nH(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nX(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function nZ(e) {
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

            function n$(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function nJ(e) {
                return function(e) {
                    if (Array.isArray(e)) return nH(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || n0(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function n0(e, t) {
                if (e) {
                    if ("string" == typeof e) return nH(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nH(e, t)
                }
            }

            function n1(e) {
                var t = nV(e),
                    r = parseFloat(t.width) || 0,
                    n = parseFloat(t.height) || 0,
                    i = nE(e),
                    o = i ? e.offsetWidth : r,
                    a = i ? e.offsetHeight : n,
                    l = rJ(r) !== o || rJ(n) !== a;
                return l && (r = o, n = a), {
                    width: r,
                    height: n,
                    $: l
                }
            }

            function n2(e) {
                return nT(e) ? e : e.contextElement
            }

            function n4(e) {
                var t = n2(e);
                if (!nE(t)) return r1(1);
                var r = t.getBoundingClientRect(),
                    n = n1(t),
                    i = n.width,
                    o = n.height,
                    a = n.$,
                    l = (a ? rJ(r.width) : r.width) / i,
                    u = (a ? rJ(r.height) : r.height) / o;
                return l && Number.isFinite(l) || (l = 1), u && Number.isFinite(u) || (u = 1), {
                    x: l,
                    y: u
                }
            }
            var n3 = r1(0);

            function n5(e) {
                var t = nM(e);
                return nF() && t.visualViewport ? {
                    x: t.visualViewport.offsetLeft,
                    y: t.visualViewport.offsetTop
                } : n3
            }

            function n6(e, t, r, n) {
                void 0 === t && (t = !1), void 0 === r && (r = !1);
                var i, o = e.getBoundingClientRect(),
                    a = n2(e),
                    l = r1(1);
                t && (n ? nT(n) && (l = n4(n)) : l = n4(e));
                var u = (void 0 === (i = r) && (i = !1), n && (!i || n === nM(a)) && i) ? n5(a) : r1(0),
                    c = (o.left + u.x) / l.x,
                    s = (o.top + u.y) / l.y,
                    d = o.width / l.x,
                    f = o.height / l.y;
                if (a)
                    for (var p = nM(a), m = n && nT(n) ? nM(n) : n, y = p, b = nK(y); b && n && m !== y;) {
                        var h = n4(b),
                            g = b.getBoundingClientRect(),
                            v = nV(b),
                            w = g.left + (b.clientLeft + parseFloat(v.paddingLeft)) * h.x,
                            x = g.top + (b.clientTop + parseFloat(v.paddingTop)) * h.y;
                        c *= h.x, s *= h.y, d *= h.x, f *= h.y, c += w, s += x, b = nK(y = nM(b))
                    }
                return nu({
                    width: d,
                    height: f,
                    x: c,
                    y: s
                })
            }

            function n8(e, t) {
                var r = nW(e).scrollLeft;
                return t ? t.left + r : n6(nP(e)).left + r
            }

            function n9(e, t) {
                var r = e.getBoundingClientRect();
                return {
                    x: r.left + t.scrollLeft - n8(e, r),
                    y: r.top + t.scrollTop
                }
            }
            var n7 = new Set(["absolute", "fixed"]);

            function ie(e, t, r) {
                if ("viewport" === t) n = function(e, t) {
                    var r = nM(e),
                        n = nP(e),
                        i = r.visualViewport,
                        o = n.clientWidth,
                        a = n.clientHeight,
                        l = 0,
                        u = 0;
                    if (i) {
                        o = i.width, a = i.height;
                        var c = nF();
                        (!c || c && "fixed" === t) && (l = i.offsetLeft, u = i.offsetTop)
                    }
                    var s = n8(n);
                    if (s <= 0) {
                        var d = n.ownerDocument,
                            f = d.body,
                            p = getComputedStyle(f),
                            m = "CSS1Compat" === d.compatMode && parseFloat(p.marginLeft) + parseFloat(p.marginRight) || 0,
                            y = Math.abs(n.clientWidth - f.clientWidth - m);
                        y <= 25 && (o -= y)
                    } else s <= 25 && (o += s);
                    return {
                        width: o,
                        height: a,
                        x: l,
                        y: u
                    }
                }(e, r);
                else if ("document" === t) i = nP(e), o = nP(i), a = nW(i), l = i.ownerDocument.body, u = r$(o.scrollWidth, o.clientWidth, l.scrollWidth, l.clientWidth), c = r$(o.scrollHeight, o.clientHeight, l.scrollHeight, l.clientHeight), s = -a.scrollLeft + n8(i), d = -a.scrollTop, "rtl" === nV(l).direction && (s += r$(o.clientWidth, l.clientWidth) - u), n = {
                    width: u,
                    height: c,
                    x: s,
                    y: d
                };
                else if (nT(t)) p = (f = n6(t, !0, "fixed" === r)).top + t.clientTop, m = f.left + t.clientLeft, y = nE(t) ? n4(t) : r1(1), n = {
                    width: t.clientWidth * y.x,
                    height: t.clientHeight * y.y,
                    x: m * y.x,
                    y: p * y.y
                };
                else {
                    var n, i, o, a, l, u, c, s, d, f, p, m, y, b = n5(e);
                    n = {
                        x: t.x - b.x,
                        y: t.y - b.y,
                        width: t.width,
                        height: t.height
                    }
                }
                return nu(n)
            }

            function it(e, t, r) {
                var n = nE(t),
                    i = nP(t),
                    o = "fixed" === r,
                    a = n6(e, !0, o, t),
                    l = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    u = r1(0);
                if (n || !n && !o)
                    if (("body" !== nI(t) || nL(i)) && (l = nW(t)), n) {
                        var c = n6(t, !0, o, t);
                        u.x = c.x + t.clientLeft, u.y = c.y + t.clientTop
                    } else i && (u.x = n8(i));
                o && !n && i && (u.x = n8(i));
                var s = !i || n || o ? r1(0) : n9(i, l);
                return {
                    x: a.left + l.scrollLeft - u.x - s.x,
                    y: a.top + l.scrollTop - u.y - s.y,
                    width: a.width,
                    height: a.height
                }
            }

            function ir(e) {
                return "static" === nV(e).position
            }

            function ii(e, t) {
                if (!nE(e) || "fixed" === nV(e).position) return null;
                if (t) return t(e);
                var r = e.offsetParent;
                return nP(e) === r && (r = r.ownerDocument.body), r
            }

            function io(e, t) {
                var r, n = nM(e);
                if (nR(e)) return n;
                if (!nE(e)) {
                    for (var i = nQ(e); i && !nG(i);) {
                        if (nT(i) && !ir(i)) return i;
                        i = nQ(i)
                    }
                    return n
                }
                for (var o = ii(e, t); o && (r = o, nC.has(nI(r))) && ir(o);) o = ii(o, t);
                return o && nG(o) && ir(o) && !nB(o) ? n : o || function(e) {
                    for (var t = nQ(e); nE(t) && !nG(t);) {
                        if (nB(t)) return t;
                        if (nR(t)) break;
                        t = nQ(t)
                    }
                    return null
                }(e) || n
            }
            var ia = {
                convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
                    var t = e.elements,
                        r = e.rect,
                        n = e.offsetParent,
                        i = "fixed" === e.strategy,
                        o = nP(n),
                        a = !!t && nR(t.floating);
                    if (n === o || a && i) return r;
                    var l = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        u = r1(1),
                        c = r1(0),
                        s = nE(n);
                    if ((s || !s && !i) && (("body" !== nI(n) || nL(o)) && (l = nW(n)), nE(n))) {
                        var d = n6(n);
                        u = n4(n), c.x = d.x + n.clientLeft, c.y = d.y + n.clientTop
                    }
                    var f = !o || s || i ? r1(0) : n9(o, l);
                    return {
                        width: r.width * u.x,
                        height: r.height * u.y,
                        x: r.x * u.x - l.scrollLeft * u.x + c.x + f.x,
                        y: r.y * u.y - l.scrollTop * u.y + c.y + f.y
                    }
                },
                getDocumentElement: nP,
                getClippingRect: function(e) {
                    var t = e.element,
                        r = e.boundary,
                        n = e.rootBoundary,
                        i = e.strategy,
                        o = nJ("clippingAncestors" === r ? nR(t) ? [] : function(e, t) {
                            var r = t.get(e);
                            if (r) return r;
                            for (var n = nq(e, [], !1).filter(function(e) {
                                    return nT(e) && "body" !== nI(e)
                                }), i = null, o = "fixed" === nV(e).position, a = o ? nQ(e) : e; nT(a) && !nG(a);) {
                                var l = nV(a),
                                    u = nB(a);
                                u || "fixed" !== l.position || (i = null), (o ? !u && !i : !u && "static" === l.position && !!i && n7.has(i.position) || nL(a) && !u && function e(t, r) {
                                    var n = nQ(t);
                                    return !(n === r || !nT(n) || nG(n)) && ("fixed" === nV(n).position || e(n, r))
                                }(e, a)) ? n = n.filter(function(e) {
                                    return e !== a
                                }) : i = l, a = nQ(a)
                            }
                            return t.set(e, n), n
                        }(t, this._c) : [].concat(r)).concat([n]),
                        a = o[0],
                        l = o.reduce(function(e, r) {
                            var n = ie(t, r, i);
                            return e.top = r$(n.top, e.top), e.right = rZ(n.right, e.right), e.bottom = rZ(n.bottom, e.bottom), e.left = r$(n.left, e.left), e
                        }, ie(t, a, i));
                    return {
                        width: l.right - l.left,
                        height: l.bottom - l.top,
                        x: l.left,
                        y: l.top
                    }
                },
                getOffsetParent: io,
                getElementRects: function(e) {
                    var t;
                    return (t = function() {
                        var t, r, n, i;
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
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                l = Object.defineProperty;
                            return l(a, "next", {
                                value: u(0)
                            }), l(a, "throw", {
                                value: u(1)
                            }), l(a, "return", {
                                value: u(2)
                            }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), a;

                            function u(l) {
                                return function(u) {
                                    var c = [l, u];
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
                        }(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    return t = this.getOffsetParent || io, [4, (0, this.getDimensions)(e.floating)];
                                case 1:
                                    return r = o.sent(), n = {}, i = [e.reference], [4, t(e.floating)];
                                case 2:
                                    return [2, (n.reference = it.apply(void 0, i.concat([o.sent(), e.strategy])), n.floating = {
                                        x: 0,
                                        y: 0,
                                        width: r.width,
                                        height: r.height
                                    }, n)]
                            }
                        })
                    }, function() {
                        var e = this,
                            r = arguments;
                        return new Promise(function(n, i) {
                            var o = t.apply(e, r);

                            function a(e) {
                                nX(o, n, i, a, l, "next", e)
                            }

                            function l(e) {
                                nX(o, n, i, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    }).call(this)
                },
                getClientRects: function(e) {
                    return Array.from(e.getClientRects())
                },
                getDimensions: function(e) {
                    var t = n1(e);
                    return {
                        width: t.width,
                        height: t.height
                    }
                },
                getScale: n4,
                isElement: nT,
                isRTL: function(e) {
                    return "rtl" === nV(e).direction
                }
            };

            function il(e, t) {
                return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
            }

            function iu(e, t, r, n) {
                void 0 === n && (n = {});
                var i, o = n.ancestorScroll,
                    a = void 0 === o || o,
                    l = n.ancestorResize,
                    u = void 0 === l || l,
                    c = n.elementResize,
                    s = void 0 === c ? "function" == typeof ResizeObserver : c,
                    d = n.layoutShift,
                    f = void 0 === d ? "function" == typeof IntersectionObserver : d,
                    p = n.animationFrame,
                    m = void 0 !== p && p,
                    y = n2(e),
                    b = a || u ? nJ(y ? nq(y) : []).concat(nJ(nq(t))) : [];
                b.forEach(function(e) {
                    a && e.addEventListener("scroll", r, {
                        passive: !0
                    }), u && e.addEventListener("resize", r)
                });
                var h = y && f ? function(e, t) {
                        var r, n = null,
                            i = nP(e);

                        function o() {
                            var e;
                            clearTimeout(r), null == (e = n) || e.disconnect(), n = null
                        }
                        return ! function a(l, u) {
                            void 0 === l && (l = !1), void 0 === u && (u = 1), o();
                            var c = e.getBoundingClientRect(),
                                s = c.left,
                                d = c.top,
                                f = c.width,
                                p = c.height;
                            if (l || t(), f && p) {
                                var m = {
                                        rootMargin: -r0(d) + "px " + -r0(i.clientWidth - (s + f)) + "px " + -r0(i.clientHeight - (d + p)) + "px " + -r0(s) + "px",
                                        threshold: r$(0, rZ(1, u)) || 1
                                    },
                                    y = !0;
                                try {
                                    n = new IntersectionObserver(b, n$(nZ({}, m), {
                                        root: i.ownerDocument
                                    }))
                                } catch (e) {
                                    n = new IntersectionObserver(b, m)
                                }
                                n.observe(e)
                            }

                            function b(t) {
                                var n = t[0].intersectionRatio;
                                if (n !== u) {
                                    if (!y) return a();
                                    n ? a(!1, n) : r = setTimeout(function() {
                                        a(!1, 1e-7)
                                    }, 1e3)
                                }
                                1 !== n || il(c, e.getBoundingClientRect()) || a(), y = !1
                            }
                        }(!0), o
                    }(y, r) : null,
                    g = -1,
                    v = null;
                s && (v = new ResizeObserver(function(e) {
                    var n = (function(e) {
                        if (Array.isArray(e)) return e
                    }(e) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var i = [],
                                o = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); o = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    o || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return i
                        }
                    }(e) || n0(e, 1) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())[0];
                    n && n.target === y && v && (v.unobserve(t), cancelAnimationFrame(g), g = requestAnimationFrame(function() {
                        var e;
                        null == (e = v) || e.observe(t)
                    })), r()
                }), y && !m && v.observe(y), v.observe(t));
                var w = m ? n6(e) : null;
                return m && function t() {
                        var n = n6(e);
                        w && !il(w, n) && r(), w = n, i = requestAnimationFrame(t)
                    }(), r(),
                    function() {
                        var e;
                        b.forEach(function(e) {
                            a && e.removeEventListener("scroll", r), u && e.removeEventListener("resize", r)
                        }), null == h || h(), null == (e = v) || e.disconnect(), v = null, m && cancelAnimationFrame(i)
                    }
            }
            var ic = function(e) {
                    return {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            return nd(function() {
                                var r, n, i, o, a, l, u, c, s, d, f, p, m, y, b, h, g, v, w, x, j, O, S, I, M, P, N, T, E, D, A, L, C, k, R, z, U;
                                return nh(this, function(_) {
                                    switch (_.label) {
                                        case 0:
                                            if (r = t.x, n = t.y, i = t.placement, o = t.rects, a = t.platform, l = t.elements, u = t.middlewareData, s = (c = r3(e, t) || {}).element, f = void 0 === (d = c.padding) ? 0 : d, null == s) return [2, {}];
                                            return p = nl(f), m = {
                                                x: r,
                                                y: n
                                            }, b = r9(y = r8(ne(i))), [4, a.getDimensions(s)];
                                        case 1:
                                            return h = _.sent(), v = (g = "y" === y) ? "top" : "left", w = g ? "bottom" : "right", x = g ? "clientHeight" : "clientWidth", j = o.reference[b] + o.reference[y] - m[y] - o.floating[b], O = m[y] - o.reference[y], [4, null == a.getOffsetParent ? void 0 : a.getOffsetParent(s)];
                                        case 2:
                                            if (M = !(I = (S = _.sent()) ? S[x] : 0)) return [3, 4];
                                            return [4, null == a.isElement ? void 0 : a.isElement(S)];
                                        case 3:
                                            M = !_.sent(), _.label = 4;
                                        case 4:
                                            return M && (I = l.floating[x] || o.floating[b]), P = j / 2 - O / 2, N = I / 2 - h[b] / 2 - 1, T = rZ(p[v], N), E = rZ(p[w], N), D = T, A = I - h[b] - E, C = r$(D, rZ(L = I / 2 - h[b] / 2 + P, A)), R = (k = !u.arrow && null != r6(i) && L !== C && o.reference[b] / 2 - (L < D ? T : E) - h[b] / 2 < 0) ? L < D ? L - D : L - A : 0, [2, (nf(U = {}, y, m[y] + R), nf(U, "data", np((nf(z = {}, y, C), nf(z, "centerOffset", L - C - R), z), k && {
                                                alignmentOffset: R
                                            })), nf(U, "reset", k), U)]
                                    }
                                })
                            })()
                        }
                    }
                },
                is = function(e, t, r) {
                    var n, i = new Map,
                        o = nZ({
                            platform: ia
                        }, r),
                        a = n$(nZ({}, o.platform), {
                            _c: i
                        });
                    return n = n$(nZ({}, o), {
                        platform: a
                    }), nd(function() {
                        var r, i, o, a, l, u, c, s, d, f, p, m, y, b, h, g, v, w, x, j, O, S, I, M, P, N;
                        return nh(this, function(T) {
                            switch (T.label) {
                                case 0:
                                    return i = void 0 === (r = n.placement) ? "bottom" : r, a = void 0 === (o = n.strategy) ? "absolute" : o, u = void 0 === (l = n.middleware) ? [] : l, c = n.platform, s = u.filter(Boolean), [4, null == c.isRTL ? void 0 : c.isRTL(t)];
                                case 1:
                                    return d = T.sent(), [4, c.getElementRects({
                                        reference: e,
                                        floating: t,
                                        strategy: a
                                    })];
                                case 2:
                                    m = (p = ng(f = T.sent(), i, d)).x, y = p.y, b = i, h = {}, g = 0, v = 0, T.label = 3;
                                case 3:
                                    if (!(v < s.length)) return [3, 11];
                                    return x = (w = s[v]).name, [4, (0, w.fn)({
                                        x: m,
                                        y: y,
                                        initialPlacement: i,
                                        placement: b,
                                        strategy: a,
                                        middlewareData: h,
                                        rects: f,
                                        platform: c,
                                        elements: {
                                            reference: e,
                                            floating: t
                                        }
                                    })];
                                case 4:
                                    var E;
                                    if (O = (j = T.sent()).x, S = j.y, I = j.data, M = j.reset, m = null != O ? O : m, y = null != S ? S : y, h = nm(np({}, h), nf({}, x, np({}, h[x], I))), !(M && g <= 50)) return [3, 10];
                                    if (g++, (void 0 === M ? "undefined" : (E = M) && "u" > typeof Symbol && E.constructor === Symbol ? "symbol" : typeof E) != "object") return [3, 9];
                                    if (M.placement && (b = M.placement), !M.rects) return [3, 8];
                                    if (!0 !== M.rects) return [3, 6];
                                    return [4, c.getElementRects({
                                        reference: e,
                                        floating: t,
                                        strategy: a
                                    })];
                                case 5:
                                    return P = T.sent(), [3, 7];
                                case 6:
                                    P = M.rects, T.label = 7;
                                case 7:
                                    f = P, T.label = 8;
                                case 8:
                                    m = (N = ng(f, b, d)).x, y = N.y, T.label = 9;
                                case 9:
                                    v = -1, T.label = 10;
                                case 10:
                                    return v++, [3, 3];
                                case 11:
                                    return [2, {
                                        x: m,
                                        y: y,
                                        placement: b,
                                        strategy: a,
                                        middlewareData: h
                                    }]
                            }
                        })
                    })()
                },
                id = window.ReactDOM,
                ip = r.n(id);

            function im(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iy(e) {
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

            function ib(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function ih(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return im(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return im(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ig(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var iv = "u" > typeof document ? th.useLayoutEffect : function() {};

            function iw(e, t) {
                if (e === t) return !0;
                if ((void 0 === e ? "undefined" : ig(e)) !== (void 0 === t ? "undefined" : ig(t))) return !1;
                if ("function" == typeof e && e.toString() === t.toString()) return !0;
                if (e && t && (void 0 === e ? "undefined" : ig(e)) === "object") {
                    if (Array.isArray(e)) {
                        if ((r = e.length) !== t.length) return !1;
                        for (n = r; 0 != n--;)
                            if (!iw(e[n], t[n])) return !1;
                        return !0
                    }
                    if ((r = (i = Object.keys(e)).length) !== Object.keys(t).length) return !1;
                    for (n = r; 0 != n--;)
                        if (!({}).hasOwnProperty.call(t, i[n])) return !1;
                    for (n = r; 0 != n--;) {
                        var r, n, i, o = i[n];
                        if (("_owner" !== o || !e.$$typeof) && !iw(e[o], t[o])) return !1
                    }
                    return !0
                }
                return e != e && t != t
            }

            function ix(e) {
                return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
            }

            function ij(e, t) {
                var r = ix(e);
                return Math.round(t * r) / r
            }

            function iO(e) {
                var t = th.useRef(e);
                return iv(function() {
                    t.current = e
                }), t
            }
            var iS = function(e, t) {
                    var r;
                    return ib(iy({}, (void 0 === (r = e) && (r = 0), {
                        name: "offset",
                        options: r,
                        fn: function(e) {
                            return nd(function() {
                                var t, n, i, o, a, l, u;
                                return nh(this, function(c) {
                                    switch (c.label) {
                                        case 0:
                                            var s;
                                            return i = e.x, o = e.y, a = e.placement, l = e.middlewareData, [4, (s = r, nd(function() {
                                                var t, r, n, i, o, a, l, u, c, d, f, p, m, y;
                                                return nh(this, function(b) {
                                                    switch (b.label) {
                                                        case 0:
                                                            return t = e.placement, r = e.platform, n = e.elements, [4, null == r.isRTL ? void 0 : r.isRTL(n.floating)];
                                                        case 1:
                                                            return i = b.sent(), o = r5(t), a = r6(t), l = "y" === ne(t), u = nj.has(o) ? -1 : 1, c = i && l ? -1 : 1, p = (f = "number" == typeof(d = r3(s, e)) ? {
                                                                mainAxis: d,
                                                                crossAxis: 0,
                                                                alignmentAxis: null
                                                            } : {
                                                                mainAxis: d.mainAxis || 0,
                                                                crossAxis: d.crossAxis || 0,
                                                                alignmentAxis: d.alignmentAxis
                                                            }).mainAxis, m = f.crossAxis, y = f.alignmentAxis, a && "number" == typeof y && (m = "end" === a ? -1 * y : y), [2, l ? {
                                                                x: m * c,
                                                                y: p * u
                                                            } : {
                                                                x: p * u,
                                                                y: m * c
                                                            }]
                                                    }
                                                })
                                            })())];
                                        case 1:
                                            if (u = c.sent(), a === (null == (t = l.offset) ? void 0 : t.placement) && null != (n = l.arrow) && n.alignmentOffset) return [2, {}];
                                            return [2, {
                                                x: i + u.x,
                                                y: o + u.y,
                                                data: nm(np({}, u), {
                                                    placement: a
                                                })
                                            }]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                iI = function(e, t) {
                    var r;
                    return ib(iy({}, (void 0 === (r = e) && (r = {}), {
                        name: "shift",
                        options: r,
                        fn: function(e) {
                            return nd(function() {
                                var t, n, i, o, a, l, u, c, s, d, f, p, m, y, b, h, g, v, w, x, j, O, S, I, M, P, N, T;
                                return nh(this, function(E) {
                                    switch (E.label) {
                                        case 0:
                                            return t = e.x, n = e.y, i = e.placement, l = void 0 === (a = (o = r3(r, e)).mainAxis) || a, c = void 0 !== (u = o.crossAxis) && u, d = void 0 === (s = o.limiter) ? {
                                                fn: function(e) {
                                                    return {
                                                        x: e.x,
                                                        y: e.y
                                                    }
                                                }
                                            } : s, f = ny(o, ["mainAxis", "crossAxis", "limiter"]), p = {
                                                x: t,
                                                y: n
                                            }, [4, nv(e, f)];
                                        case 1:
                                            return m = E.sent(), h = p[b = r8(y = ne(r5(i)))], g = p[y], l && (v = "y" === b ? "top" : "left", w = "y" === b ? "bottom" : "right", x = h + m[v], j = h - m[w], h = r$(x, rZ(h, j))), c && (O = "y" === y ? "top" : "left", S = "y" === y ? "bottom" : "right", I = g + m[O], M = g - m[S], g = r$(I, rZ(g, M))), N = d.fn(nm(np({}, e), (nf(P = {}, b, h), nf(P, y, g), P))), [2, nm(np({}, N), {
                                                data: {
                                                    x: N.x - t,
                                                    y: N.y - n,
                                                    enabled: (nf(T = {}, b, l), nf(T, y, c), T)
                                                }
                                            })]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                iM = function(e, t) {
                    var r;
                    return ib(iy({}, (void 0 === (r = e) && (r = {}), {
                        options: r,
                        fn: function(e) {
                            var t, n = e.x,
                                i = e.y,
                                o = e.placement,
                                a = e.rects,
                                l = e.middlewareData,
                                u = r3(r, e),
                                c = u.offset,
                                s = u.mainAxis,
                                d = u.crossAxis,
                                f = {
                                    x: n,
                                    y: i
                                },
                                p = ne(o),
                                m = r8(p),
                                y = f[m],
                                b = f[p],
                                h = r3(void 0 === c ? 0 : c, e),
                                g = "number" == typeof h ? {
                                    mainAxis: h,
                                    crossAxis: 0
                                } : np({
                                    mainAxis: 0,
                                    crossAxis: 0
                                }, h);
                            if (void 0 === s || s) {
                                var v = "y" === m ? "height" : "width",
                                    w = a.reference[m] - a.floating[v] + g.mainAxis,
                                    x = a.reference[m] + a.reference[v] - g.mainAxis;
                                y < w ? y = w : y > x && (y = x)
                            }
                            if (void 0 === d || d) {
                                var j, O, S = "y" === m ? "width" : "height",
                                    I = nj.has(r5(o)),
                                    M = a.reference[p] - a.floating[S] + (I && (null == (j = l.offset) ? void 0 : j[p]) || 0) + (I ? 0 : g.crossAxis),
                                    P = a.reference[p] + a.reference[S] + (I ? 0 : (null == (O = l.offset) ? void 0 : O[p]) || 0) - (I ? g.crossAxis : 0);
                                b < M ? b = M : b > P && (b = P)
                            }
                            return nf(t = {}, m, y), nf(t, p, b), t
                        }
                    })), {
                        options: [e, t]
                    })
                },
                iP = function(e, t) {
                    var r;
                    return ib(iy({}, (void 0 === (r = e) && (r = {}), {
                        name: "flip",
                        options: r,
                        fn: function(e) {
                            return nd(function() {
                                var t, n, i, o, a, l, u, c, s, d, f, p, m, y, b, h, g, v, w, x, j, O, S, I, M, P, N, T, E, D, A, L, C, k, R, z, U, _, B, F;
                                return nh(this, function(Y) {
                                    var G, V, W, Q, q, K, H, X, Z, $, J, ee, et, er, en;
                                    switch (Y.label) {
                                        case 0:
                                            if (i = e.placement, o = e.middlewareData, a = e.rects, l = e.initialPlacement, u = e.platform, c = e.elements, f = void 0 === (d = (s = r3(r, e)).mainAxis) || d, m = void 0 === (p = s.crossAxis) || p, y = s.fallbackPlacements, h = void 0 === (b = s.fallbackStrategy) ? "bestFit" : b, v = void 0 === (g = s.fallbackAxisSideDirection) ? "none" : g, x = void 0 === (w = s.flipAlignment) || w, j = ny(s, ["mainAxis", "crossAxis", "fallbackPlacements", "fallbackStrategy", "fallbackAxisSideDirection", "flipAlignment"]), null != (t = o.arrow) && t.alignmentOffset) return [2, {}];
                                            return O = r5(i), S = ne(l), I = r5(l) === l, [4, null == u.isRTL ? void 0 : u.isRTL(c.floating)];
                                        case 1:
                                            return M = Y.sent(), P = y || (I || !x ? [na(l)] : (V = na(G = l), [nt(G), V, nt(V)])), N = "none" !== v, !y && N && (T = P).push.apply(T, nb((W = l, Q = x, q = v, K = M, H = r6(W), X = function(e, t, r) {
                                                switch (e) {
                                                    case "top":
                                                    case "bottom":
                                                        if (r) return t ? nn : nr;
                                                        return t ? nr : nn;
                                                    case "left":
                                                    case "right":
                                                        return t ? ni : no;
                                                    default:
                                                        return []
                                                }
                                            }(r5(W), "start" === q, K), H && (X = X.map(function(e) {
                                                return e + "-" + H
                                            }), Q && (X = X.concat(X.map(nt)))), X))), E = [l].concat(nb(P)), [4, nv(e, j)];
                                        case 2:
                                            if (D = Y.sent(), A = [], L = (null == (n = o.flip) ? void 0 : n.overflows) || [], f && A.push(D[O]), m && (Z = i, $ = a, void 0 === (J = M) && (J = !1), ee = r6(Z), er = r9(et = r8(ne(Z))), en = "x" === et ? ee === (J ? "end" : "start") ? "right" : "left" : "start" === ee ? "bottom" : "top", $.reference[er] > $.floating[er] && (en = na(en)), C = [en, na(en)], A.push(D[C[0]], D[C[1]])), L = nb(L).concat([{
                                                    placement: i,
                                                    overflows: A
                                                }]), !A.every(function(e) {
                                                    return e <= 0
                                                })) {
                                                if ((U = E[z = ((null == (k = o.flip) ? void 0 : k.index) || 0) + 1]) && ("alignment" !== m || S === ne(U) || L.every(function(e) {
                                                        return ne(e.placement) !== S || e.overflows[0] > 0
                                                    }))) return [2, {
                                                    data: {
                                                        index: z,
                                                        overflows: L
                                                    },
                                                    reset: {
                                                        placement: U
                                                    }
                                                }];
                                                if (!(_ = null == (R = L.filter(function(e) {
                                                        return e.overflows[0] <= 0
                                                    }).sort(function(e, t) {
                                                        return e.overflows[1] - t.overflows[1]
                                                    })[0]) ? void 0 : R.placement)) switch (h) {
                                                    case "bestFit":
                                                        (F = null == (B = L.filter(function(e) {
                                                            if (N) {
                                                                var t = ne(e.placement);
                                                                return t === S || "y" === t
                                                            }
                                                            return !0
                                                        }).map(function(e) {
                                                            return [e.placement, e.overflows.filter(function(e) {
                                                                return e > 0
                                                            }).reduce(function(e, t) {
                                                                return e + t
                                                            }, 0)]
                                                        }).sort(function(e, t) {
                                                            return e[1] - t[1]
                                                        })[0]) ? void 0 : B[0]) && (_ = F);
                                                        break;
                                                    case "initialPlacement":
                                                        _ = l
                                                }
                                                if (i !== _) return [2, {
                                                    reset: {
                                                        placement: _
                                                    }
                                                }]
                                            }
                                            return [2, {}]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                iN = function(e, t) {
                    var r;
                    return ib(iy({}, (void 0 === (r = e) && (r = {}), {
                        name: "size",
                        options: r,
                        fn: function(e) {
                            return nd(function() {
                                var t, n, i, o, a, l, u, c, s, d, f, p, m, y, b, h, g, v, w, x, j, O, S, I, M, P, N, T, E, D;
                                return nh(this, function(A) {
                                    switch (A.label) {
                                        case 0:
                                            return i = e.placement, o = e.rects, a = e.platform, l = e.elements, s = void 0 === (c = (u = r3(r, e)).apply) ? function() {} : c, [4, nv(e, ny(u, ["apply"]))];
                                        case 1:
                                            if (d = A.sent(), f = r5(i), p = r6(i), m = "y" === ne(i), b = (y = o.floating).width, h = y.height, "top" !== f && "bottom" !== f) return [3, 3];
                                            return g = f, [4, null == a.isRTL ? void 0 : a.isRTL(l.floating)];
                                        case 2:
                                            return v = p === (A.sent() ? "start" : "end") ? "left" : "right", [3, 4];
                                        case 3:
                                            v = f, g = "end" === p ? "top" : "bottom", A.label = 4;
                                        case 4:
                                            return w = h - d.top - d.bottom, x = b - d.left - d.right, j = rZ(h - d[g], w), O = rZ(b - d[v], x), S = !e.middlewareData.shift, I = j, M = O, null != (t = e.middlewareData.shift) && t.enabled.x && (M = x), null != (n = e.middlewareData.shift) && n.enabled.y && (I = w), S && !p && (P = r$(d.left, 0), N = r$(d.right, 0), T = r$(d.top, 0), E = r$(d.bottom, 0), m ? M = b - 2 * (0 !== P || 0 !== N ? P + N : r$(d.left, d.right)) : I = h - 2 * (0 !== T || 0 !== E ? T + E : r$(d.top, d.bottom))), [4, s(nm(np({}, e), {
                                                availableWidth: M,
                                                availableHeight: I
                                            }))];
                                        case 5:
                                            return A.sent(), [4, a.getDimensions(l.floating)];
                                        case 6:
                                            if (D = A.sent(), b !== D.width || h !== D.height) return [2, {
                                                reset: {
                                                    rects: !0
                                                }
                                            }];
                                            return [2, {}]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                iT = function(e, t) {
                    var r;
                    return ib(iy({}, (void 0 === (r = e) && (r = {}), {
                        name: "hide",
                        options: r,
                        fn: function(e) {
                            return nd(function() {
                                var t, n, i, o, a, l, u;
                                return nh(this, function(c) {
                                    switch (c.label) {
                                        case 0:
                                            switch (t = e.rects, o = void 0 === (i = (n = r3(r, e)).strategy) ? "referenceHidden" : i, a = ny(n, ["strategy"]), o) {
                                                case "referenceHidden":
                                                    return [3, 1];
                                                case "escaped":
                                                    return [3, 3]
                                            }
                                            return [3, 5];
                                        case 1:
                                            return [4, nv(e, nm(np({}, a), {
                                                elementContext: "reference"
                                            }))];
                                        case 2:
                                            return [2, {
                                                data: {
                                                    referenceHiddenOffsets: l = nw(c.sent(), t.reference),
                                                    referenceHidden: nx(l)
                                                }
                                            }];
                                        case 3:
                                            return [4, nv(e, nm(np({}, a), {
                                                altBoundary: !0
                                            }))];
                                        case 4:
                                            return [2, {
                                                data: {
                                                    escapedOffsets: u = nw(c.sent(), t.floating),
                                                    escaped: nx(u)
                                                }
                                            }];
                                        case 5:
                                            return [2, {}];
                                        case 6:
                                            return [2]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                iE = function(e, t) {
                    return ib(iy({}, {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            var r = "function" == typeof e ? e(t) : e,
                                n = r.element,
                                i = r.padding;
                            return n && ({}).hasOwnProperty.call(n, "current") ? null != n.current ? ic({
                                element: n.current,
                                padding: i
                            }).fn(t) : {} : n ? ic({
                                element: n,
                                padding: i
                            }).fn(t) : {}
                        }
                    }), {
                        options: [e, t]
                    })
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

            function iL(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function iC(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }

            function ik(e) {
                return function(e) {
                    if (Array.isArray(e)) return iD(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return iD(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iD(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var iR = th.forwardRef(function(e, t) {
                var r = e.children,
                    n = iC(e, ["children"]),
                    i = th.Children.toArray(r),
                    o = i.find(i_);
                if (o) {
                    var a = o.props.children,
                        l = i.map(function(e) {
                            return e !== o ? e : th.Children.count(a) > 1 ? th.Children.only(null) : th.isValidElement(a) ? a.props.children : null
                        });
                    return (0, T.jsx)(iz, iL(iA({}, n), {
                        ref: t,
                        children: th.isValidElement(a) ? th.cloneElement(a, void 0, l) : null
                    }))
                }
                return (0, T.jsx)(iz, iL(iA({}, n), {
                    ref: t,
                    children: r
                }))
            });
            iR.displayName = "Slot";
            var iz = th.forwardRef(function(e, t) {
                var r = e.children,
                    n = iC(e, ["children"]);
                if (th.isValidElement(r)) {
                    var i, o, a, l, u, c = (u = (l = null == (o = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (u = (l = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref;
                    return th.cloneElement(r, iL(iA({}, function(e, t) {
                        var r = iA({}, t);
                        for (var n in t) ! function(n) {
                            var i = e[n],
                                o = t[n];
                            /^on[A-Z]/.test(n) ? i && o ? r[n] = function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                o.apply(void 0, ik(t)), i.apply(void 0, ik(t))
                            } : i && (r[n] = i) : "style" === n ? r[n] = iA({}, i, o) : "className" === n && (r[n] = [i, o].filter(Boolean).join(" "))
                        }(n);
                        return iA({}, e, r)
                    }(n, r.props)), {
                        ref: t ? rz(t, c) : c
                    }))
                }
                return th.Children.count(r) > 1 ? th.Children.only(null) : null
            });
            iz.displayName = "SlotClone";
            var iU = function(e) {
                var t = e.children;
                return (0, T.jsx)(T.Fragment, {
                    children: t
                })
            };

            function i_(e) {
                return th.isValidElement(e) && e.type === iU
            }

            function iB(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function iF(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        iB(e, t, r[t])
                    })
                }
                return e
            }

            function iY(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }
            var iG = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                    var r = th.forwardRef(function(e, r) {
                        var n = e.asChild,
                            i = function(e, t) {
                                if (null == e) return {};
                                var r, n, i, o = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                    return o
                                }
                                if (o = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, i = {},
                                            o = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                        return i
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }(e, ["asChild"]),
                            o = n ? iR : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, T.jsx)(o, iY(iF({}, i), {
                            ref: r
                        }))
                    });
                    return r.displayName = "Primitive.".concat(t), iY(iF({}, e), iB({}, t, r))
                }, {}),
                iV = th.forwardRef(function(e, t) {
                    var r, n, i = e.children,
                        o = e.width,
                        a = e.height,
                        l = function(e, t) {
                            if (null == e) return {};
                            var r, n, i, o = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }
                            if (o = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, i = {},
                                        o = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                    return i
                                }(e, t), Object.getOwnPropertySymbols)
                                for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }(e, ["children", "width", "height"]);
                    return (0, T.jsx)(iG.svg, (r = function(e) {
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
                    }({}, l), n = n = {
                        ref: t,
                        width: void 0 === o ? 10 : o,
                        height: void 0 === a ? 5 : a,
                        viewBox: "0 0 30 10",
                        preserveAspectRatio: "none",
                        children: e.asChild ? i : (0, T.jsx)("polygon", {
                            points: "0,0 30,0 15,10"
                        })
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r))
                });

            function iW(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iQ(e) {
                var t = th.useRef(e);
                return th.useEffect(function() {
                    t.current = e
                }), th.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), i = 0; i < r; i++) n[i] = arguments[i];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return iW(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return iW(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iW(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function iq(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iK(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iH(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function iX(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        iH(e, t, r[t])
                    })
                }
                return e
            }

            function iZ(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function i$(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }

            function iJ(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                }(e, t) || i0(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function i0(e, t) {
                if (e) {
                    if ("string" == typeof e) return iK(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iK(e, t)
                }
            }
            iV.displayName = "Arrow";
            var i1 = "Popper",
                i2 = iJ(rG(i1), 2),
                i4 = i2[0],
                i3 = i2[1],
                i5 = iJ(i4(i1), 2),
                i6 = i5[0],
                i8 = i5[1],
                i9 = function(e) {
                    var t = e.__scopePopper,
                        r = e.children,
                        n = iJ(th.useState(null), 2),
                        i = n[0],
                        o = n[1];
                    return (0, T.jsx)(i6, {
                        scope: t,
                        anchor: i,
                        onAnchorChange: o,
                        children: r
                    })
                };
            i9.displayName = i1;
            var i7 = "PopperAnchor",
                oe = th.forwardRef(function(e, t) {
                    var r = e.__scopePopper,
                        n = e.virtualRef,
                        i = i$(e, ["__scopePopper", "virtualRef"]),
                        o = i8(i7, r),
                        a = th.useRef(null),
                        l = rU(t, a);
                    return th.useEffect(function() {
                        o.onAnchorChange((null == n ? void 0 : n.current) || a.current)
                    }), n ? null : (0, T.jsx)(iG.div, iZ(iX({}, i), {
                        ref: l
                    }))
                });
            oe.displayName = i7;
            var ot = "PopperContent",
                or = iJ(i4(ot), 2),
                on = or[0],
                oi = or[1],
                oo = th.forwardRef(function(e, t) {
                    var r, n, i, o, a, l, u, c, s, d, f, p, m, y, b, h, g, v, w, x, j, O, S, I, M, P, N, E, D, A, L, C, k, R, z, U, _, B, F, Y, G, V, W, Q, q, K, H, X, Z, $, J, ee, et, er, en, ei, eo = e.__scopePopper,
                        ea = e.side,
                        el = e.sideOffset,
                        eu = e.align,
                        ec = void 0 === eu ? "center" : eu,
                        es = e.alignOffset,
                        ed = e.arrowPadding,
                        ef = e.avoidCollisions,
                        ep = void 0 === ef || ef,
                        em = e.collisionBoundary,
                        ey = void 0 === em ? [] : em,
                        eb = e.collisionPadding,
                        eh = void 0 === eb ? 0 : eb,
                        eg = e.sticky,
                        ev = e.hideWhenDetached,
                        ew = e.updatePositionStrategy,
                        ex = void 0 === ew ? "optimized" : ew,
                        ej = e.onPlaced,
                        eO = i$(e, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        eS = i8(ot, eo),
                        eI = iJ(th.useState(null), 2),
                        eM = eI[0],
                        eP = eI[1],
                        eN = rU(t, function(e) {
                            return eP(e)
                        }),
                        eT = iJ(th.useState(null), 2),
                        eE = eT[0],
                        eD = eT[1],
                        eA = (i = (n = function(e) {
                            if (Array.isArray(e)) return e
                        }(r = th.useState(void 0)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(r) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return iq(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iq(e, 2)
                            }
                        }(r) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], o = n[1], rQ(function() {
                            if (eE) {
                                o({
                                    width: eE.offsetWidth,
                                    height: eE.offsetHeight
                                });
                                var e = new ResizeObserver(function(e) {
                                    if (Array.isArray(e) && e.length) {
                                        var t, r, n = e[0];
                                        if ("borderBoxSize" in n) {
                                            var i = n.borderBoxSize,
                                                a = Array.isArray(i) ? i[0] : i;
                                            t = a.inlineSize, r = a.blockSize
                                        } else t = eE.offsetWidth, r = eE.offsetHeight;
                                        o({
                                            width: t,
                                            height: r
                                        })
                                    }
                                });
                                return e.observe(eE, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return e.unobserve(eE)
                                    }
                            }
                            o(void 0)
                        }, [eE]), i),
                        eL = null != (Z = null == eA ? void 0 : eA.width) ? Z : 0,
                        eC = null != ($ = null == eA ? void 0 : eA.height) ? $ : 0,
                        ek = "number" == typeof eh ? eh : iX({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, eh),
                        eR = Array.isArray(ey) ? ey : [ey],
                        ez = eR.length > 0,
                        eU = {
                            padding: ek,
                            boundary: eR.filter(oc),
                            altBoundary: ez
                        },
                        e_ = (u = void 0 === (l = (a = {
                            strategy: "fixed",
                            placement: (void 0 === ea ? "bottom" : ea) + ("center" !== ec ? "-" + ec : ""),
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return iu.apply(void 0, ((function(e) {
                                    if (Array.isArray(e)) return iK(e)
                                })(t) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(t) || i0(t) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()).concat([{
                                    animationFrame: "always" === ex
                                }]))
                            },
                            elements: {
                                reference: eS.anchor
                            },
                            middleware: [iS({
                                mainAxis: (void 0 === el ? 0 : el) + eC,
                                alignmentAxis: void 0 === es ? 0 : es
                            }), ep && iI(iX({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === eg ? "partial" : eg) ? iM() : void 0
                            }, eU)), ep && iP(iX({}, eU)), iN(iZ(iX({}, eU), {
                                apply: function(e) {
                                    var t = e.elements,
                                        r = e.rects,
                                        n = e.availableWidth,
                                        i = e.availableHeight,
                                        o = r.reference,
                                        a = o.width,
                                        l = o.height,
                                        u = t.floating.style;
                                    u.setProperty("--radix-popper-available-width", "".concat(n, "px")), u.setProperty("--radix-popper-available-height", "".concat(i, "px")), u.setProperty("--radix-popper-anchor-width", "".concat(a, "px")), u.setProperty("--radix-popper-anchor-height", "".concat(l, "px"))
                                }
                            })), eE && iE({
                                element: eE,
                                padding: void 0 === ed ? 0 : ed
                            }), os({
                                arrowWidth: eL,
                                arrowHeight: eC
                            }), void 0 !== ev && ev && iT(iX({
                                strategy: "referenceHidden"
                            }, eU))]
                        }).placement) ? "bottom" : l, s = void 0 === (c = a.strategy) ? "absolute" : c, f = void 0 === (d = a.middleware) ? [] : d, p = a.platform, b = (y = void 0 === (m = a.elements) ? {} : m).reference, h = y.floating, v = void 0 === (g = a.transform) || g, w = a.whileElementsMounted, x = a.open, O = (j = ih(th.useState({
                            x: 0,
                            y: 0,
                            strategy: s,
                            placement: u,
                            middlewareData: {},
                            isPositioned: !1
                        }), 2))[0], S = j[1], M = (I = ih(th.useState(f), 2))[0], P = I[1], iw(M, f) || P(f), E = (N = ih(th.useState(null), 2))[0], D = N[1], L = (A = ih(th.useState(null), 2))[0], C = A[1], k = th.useCallback(function(e) {
                            e !== _.current && (_.current = e, D(e))
                        }, []), R = th.useCallback(function(e) {
                            e !== B.current && (B.current = e, C(e))
                        }, []), z = b || E, U = h || L, _ = th.useRef(null), B = th.useRef(null), F = th.useRef(O), Y = null != w, G = iO(w), V = iO(p), W = iO(x), Q = th.useCallback(function() {
                            if (_.current && B.current) {
                                var e = {
                                    placement: u,
                                    strategy: s,
                                    middleware: M
                                };
                                V.current && (e.platform = V.current), is(_.current, B.current, e).then(function(e) {
                                    var t = ib(iy({}, e), {
                                        isPositioned: !1 !== W.current
                                    });
                                    q.current && !iw(F.current, t) && (F.current = t, id.flushSync(function() {
                                        S(t)
                                    }))
                                })
                            }
                        }, [M, u, s, V, W]), iv(function() {
                            !1 === x && F.current.isPositioned && (F.current.isPositioned = !1, S(function(e) {
                                return ib(iy({}, e), {
                                    isPositioned: !1
                                })
                            }))
                        }, [x]), q = th.useRef(!1), iv(function() {
                            return q.current = !0,
                                function() {
                                    q.current = !1
                                }
                        }, []), iv(function() {
                            if (z && (_.current = z), U && (B.current = U), z && U) {
                                if (G.current) return G.current(z, U, Q);
                                Q()
                            }
                        }, [z, U, Q, G, Y]), K = th.useMemo(function() {
                            return {
                                reference: _,
                                floating: B,
                                setReference: k,
                                setFloating: R
                            }
                        }, [k, R]), H = th.useMemo(function() {
                            return {
                                reference: z,
                                floating: U
                            }
                        }, [z, U]), X = th.useMemo(function() {
                            var e = {
                                position: s,
                                left: 0,
                                top: 0
                            };
                            if (!H.floating) return e;
                            var t = ij(H.floating, O.x),
                                r = ij(H.floating, O.y);
                            return v ? iy(ib(iy({}, e), {
                                transform: "translate(" + t + "px, " + r + "px)"
                            }), ix(H.floating) >= 1.5 && {
                                willChange: "transform"
                            }) : {
                                position: s,
                                left: t,
                                top: r
                            }
                        }, [s, v, H.floating, O.x, O.y]), th.useMemo(function() {
                            return ib(iy({}, O), {
                                update: Q,
                                refs: K,
                                elements: H,
                                floatingStyles: X
                            })
                        }, [O, Q, K, H, X])),
                        eB = e_.refs,
                        eF = e_.floatingStyles,
                        eY = e_.placement,
                        eG = e_.isPositioned,
                        eV = e_.middlewareData,
                        eW = iJ(od(eY), 2),
                        eQ = eW[0],
                        eq = eW[1],
                        eK = iQ(ej);
                    rQ(function() {
                        eG && (null == eK || eK())
                    }, [eG, eK]);
                    var eH = null == (J = eV.arrow) ? void 0 : J.x,
                        eX = null == (ee = eV.arrow) ? void 0 : ee.y,
                        eZ = (null == (et = eV.arrow) ? void 0 : et.centerOffset) !== 0,
                        e$ = iJ(th.useState(), 2),
                        eJ = e$[0],
                        e0 = e$[1];
                    return rQ(function() {
                        eM && e0(window.getComputedStyle(eM).zIndex)
                    }, [eM]), (0, T.jsx)("div", {
                        ref: eB.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: iX(iZ(iX({}, eF), iH({
                            transform: eG ? eF.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: eJ
                        }, "--radix-popper-transform-origin", [null == (er = eV.transformOrigin) ? void 0 : er.x, null == (en = eV.transformOrigin) ? void 0 : en.y].join(" "))), (null == (ei = eV.hide) ? void 0 : ei.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, T.jsx)(on, {
                            scope: eo,
                            placedSide: eQ,
                            onArrowChange: eD,
                            arrowX: eH,
                            arrowY: eX,
                            shouldHideArrow: eZ,
                            children: (0, T.jsx)(iG.div, iZ(iX({
                                "data-side": eQ,
                                "data-align": eq
                            }, eO), {
                                ref: eN,
                                style: iZ(iX({}, eO.style), {
                                    animation: eG ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            oo.displayName = ot;
            var oa = "PopperArrow",
                ol = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                ou = th.forwardRef(function(e, t) {
                    var r, n = e.__scopePopper,
                        i = i$(e, ["__scopePopper"]),
                        o = oi(oa, n),
                        a = ol[o.placedSide];
                    return (0, T.jsx)("span", {
                        ref: o.onArrowChange,
                        style: (iH(r = {
                            position: "absolute",
                            left: o.arrowX,
                            top: o.arrowY
                        }, a, 0), iH(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [o.placedSide]), iH(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [o.placedSide]), iH(r, "visibility", o.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, T.jsx)(iV, iZ(iX({}, i), {
                            ref: t,
                            style: iZ(iX({}, i.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function oc(e) {
                return null !== e
            }
            ou.displayName = oa;
            var os = function(e) {
                return {
                    name: "transformOrigin",
                    options: e,
                    fn: function(t) {
                        var r, n, i, o, a, l = t.placement,
                            u = t.rects,
                            c = t.middlewareData,
                            s = (null == (i = c.arrow) ? void 0 : i.centerOffset) !== 0,
                            d = s ? 0 : e.arrowWidth,
                            f = s ? 0 : e.arrowHeight,
                            p = iJ(od(l), 2),
                            m = p[0],
                            y = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [p[1]],
                            b = (null != (r = null == (o = c.arrow) ? void 0 : o.x) ? r : 0) + d / 2,
                            h = (null != (n = null == (a = c.arrow) ? void 0 : a.y) ? n : 0) + f / 2,
                            g = "",
                            v = "";
                        return "bottom" === m ? (g = s ? y : "".concat(b, "px"), v = "".concat(-f, "px")) : "top" === m ? (g = s ? y : "".concat(b, "px"), v = "".concat(u.floating.height + f, "px")) : "right" === m ? (g = "".concat(-f, "px"), v = s ? y : "".concat(h, "px")) : "left" === m && (g = "".concat(u.floating.width + f, "px"), v = s ? y : "".concat(h, "px")), {
                            data: {
                                x: g,
                                y: v
                            }
                        }
                    }
                }
            };

            function od(e) {
                var t = iJ(e.split("-"), 2),
                    r = t[0],
                    n = t[1];
                return [r, void 0 === n ? "center" : n]
            }

            function of(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var op = th.forwardRef(function(e, t) {
                var r, n, i, o, a, l = e.container,
                    u = function(e, t) {
                        if (null == e) return {};
                        var r, n, i, o = {};
                        if ("u" > typeof Reflect && Reflect.ownKeys) {
                            for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }
                        if (o = function(e, t) {
                                if (null == e) return {};
                                var r, n, i = {},
                                    o = Object.getOwnPropertyNames(e);
                                for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                return i
                            }(e, t), Object.getOwnPropertySymbols)
                            for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                        return o
                    }(e, ["container"]),
                    c = function(e) {
                        if (Array.isArray(e)) return e
                    }(r = th.useState(!1)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var i = [],
                                o = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    o || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return i
                        }
                    }(r) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return of(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return of(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = c[0],
                    d = c[1];
                rQ(function() {
                    return d(!0)
                }, []);
                var f = l || s && (null == (a = globalThis) || null == (o = a.document) ? void 0 : o.body);
                return f ? ip().createPortal((0, T.jsx)(iG.div, (n = function(e) {
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
                }({}, u), i = i = {
                    ref: t
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(i)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(i)).forEach(function(e) {
                    Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(i, e))
                }), n)), f) : null
            });

            function om(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oy(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return om(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return om(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            op.displayName = "Portal";
            var ob = function(e) {
                var t, r, n, i, o, a, l, u, c, s, d, f, p, m, y, b, h, g = e.present,
                    v = e.children,
                    w = (t = g, o = (i = oy(th.useState(), 2))[0], a = i[1], l = th.useRef({}), u = th.useRef(t), c = th.useRef("none"), d = (s = oy((r = t ? "mounted" : "unmounted", n = {
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
                    }, th.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], f = s[1], th.useEffect(function() {
                        var e = oh(l.current);
                        c.current = "mounted" === d ? e : "none"
                    }, [d]), rQ(function() {
                        var e = l.current,
                            r = u.current;
                        if (r !== t) {
                            var n = c.current,
                                i = oh(e);
                            t ? f("MOUNT") : "none" === i || (null == e ? void 0 : e.display) === "none" ? f("UNMOUNT") : r && n !== i ? f("ANIMATION_OUT") : f("UNMOUNT"), u.current = t
                        }
                    }, [t, f]), rQ(function() {
                        if (o) {
                            var e, t, r = null != (e = o.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = oh(l.current).includes(e.animationName);
                                    if (e.target === o && n && (f("ANIMATION_END"), !u.current)) {
                                        var i = o.style.animationFillMode;
                                        o.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === o.style.animationFillMode && (o.style.animationFillMode = i)
                                        })
                                    }
                                },
                                i = function(e) {
                                    e.target === o && (c.current = oh(l.current))
                                };
                            return o.addEventListener("animationstart", i), o.addEventListener("animationcancel", n), o.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), o.removeEventListener("animationstart", i), o.removeEventListener("animationcancel", n), o.removeEventListener("animationend", n)
                                }
                        }
                        f("ANIMATION_END")
                    }, [o, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: th.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    x = "function" == typeof v ? v({
                        present: w.isPresent
                    }) : th.Children.only(v),
                    j = rU(w.ref, (h = (b = null == (m = Object.getOwnPropertyDescriptor((p = x).props, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning) ? p.ref : (h = (b = null == (y = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : y.get) && "isReactWarning" in b && b.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof v || w.isPresent ? th.cloneElement(x, {
                    ref: j
                }) : null
            };

            function oh(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function og(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ov(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return og(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return og(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ow(e) {
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
            ob.displayName = "Presence";
            var ox = th.forwardRef(function(e, t) {
                var r, n;
                return (0, T.jsx)(iG.span, (r = ow({}, e), n = n = {
                    ref: t,
                    style: ow({
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
                    }, e.style)
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(n)).forEach(function(e) {
                    Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                }), r))
            });

            function oj(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oO(e) {
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

            function oS(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function oI(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }

            function oM(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                }(e, t) || oN(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oP(e) {
                return function(e) {
                    if (Array.isArray(e)) return oj(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || oN(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oN(e, t) {
                if (e) {
                    if ("string" == typeof e) return oj(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oj(e, t)
                }
            }
            ox.displayName = "VisuallyHidden";
            var oT = oM(rG("Tooltip", [i3]), 2),
                oE = oT[0];
            oT[1];
            var oD = i3(),
                oA = "TooltipProvider",
                oL = "tooltip.open",
                oC = oM(oE(oA), 2),
                ok = oC[0],
                oR = oC[1],
                oz = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.delayDuration,
                        n = e.skipDelayDuration,
                        i = void 0 === n ? 300 : n,
                        o = e.disableHoverableContent,
                        a = e.children,
                        l = oM(th.useState(!0), 2),
                        u = l[0],
                        c = l[1],
                        s = th.useRef(!1),
                        d = th.useRef(0);
                    return th.useEffect(function() {
                        var e = d.current;
                        return function() {
                            return window.clearTimeout(e)
                        }
                    }, []), (0, T.jsx)(ok, {
                        scope: t,
                        isOpenDelayed: u,
                        delayDuration: void 0 === r ? 700 : r,
                        onOpen: th.useCallback(function() {
                            window.clearTimeout(d.current), c(!1)
                        }, []),
                        onClose: th.useCallback(function() {
                            window.clearTimeout(d.current), d.current = window.setTimeout(function() {
                                return c(!0)
                            }, i)
                        }, [i]),
                        isPointerInTransitRef: s,
                        onPointerInTransitChange: th.useCallback(function(e) {
                            s.current = e
                        }, []),
                        disableHoverableContent: void 0 !== o && o,
                        children: a
                    })
                };
            oz.displayName = oA;
            var oU = "Tooltip",
                o_ = oM(oE(oU), 2),
                oB = o_[0],
                oF = o_[1],
                oY = function(e) {
                    var t, r, n, i, o, a, l, u, c, s, d, f, p, m, y, b, h, g, v, w, x, j = e.__scopeTooltip,
                        O = e.children,
                        S = e.open,
                        I = e.defaultOpen,
                        M = e.onOpenChange,
                        P = e.disableHoverableContent,
                        N = e.delayDuration,
                        E = oR(oU, e.__scopeTooltip),
                        D = oD(j),
                        A = oM(th.useState(null), 2),
                        L = A[0],
                        C = A[1],
                        k = (s = (c = function(e) {
                            if (Array.isArray(e)) return e
                        }(u = th.useState(rK())) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(u) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return rq(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rq(e, 2)
                            }
                        }(u) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], d = c[1], rQ(function() {
                            d(function(e) {
                                return null != e ? e : String(rH++)
                            })
                        }, [void 0]), s ? "radix-".concat(s) : ""),
                        R = th.useRef(0),
                        z = null != P ? P : E.disableHoverableContent,
                        U = null != N ? N : E.delayDuration,
                        _ = th.useRef(!1),
                        B = oM((p = (f = {
                            prop: S,
                            defaultProp: void 0 !== I && I,
                            onChange: function(e) {
                                e ? (E.onOpen(), document.dispatchEvent(new CustomEvent(oL))) : E.onClose(), null == M || M(e)
                            }
                        }).prop, h = (b = ov((r = (t = {
                            defaultProp: f.defaultProp,
                            onChange: y = void 0 === (m = f.onChange) ? function() {} : m
                        }).defaultProp, n = t.onChange, o = ov(i = th.useState(r), 1)[0], a = th.useRef(o), l = iQ(n), th.useEffect(function() {
                            a.current !== o && (l(o), a.current = o)
                        }, [o, a, l]), i), 2))[0], g = b[1], w = (v = void 0 !== p) ? p : h, x = iQ(y), [w, th.useCallback(function(e) {
                            if (v) {
                                var t = "function" == typeof e ? e(p) : e;
                                t !== p && x(t)
                            } else g(e)
                        }, [v, p, g, x])]), 2),
                        F = B[0],
                        Y = void 0 !== F && F,
                        G = B[1],
                        V = th.useMemo(function() {
                            return Y ? _.current ? "delayed-open" : "instant-open" : "closed"
                        }, [Y]),
                        W = th.useCallback(function() {
                            window.clearTimeout(R.current), R.current = 0, _.current = !1, G(!0)
                        }, [G]),
                        Q = th.useCallback(function() {
                            window.clearTimeout(R.current), R.current = 0, G(!1)
                        }, [G]),
                        q = th.useCallback(function() {
                            window.clearTimeout(R.current), R.current = window.setTimeout(function() {
                                _.current = !0, G(!0), R.current = 0
                            }, U)
                        }, [U, G]);
                    return th.useEffect(function() {
                        return function() {
                            R.current && (window.clearTimeout(R.current), R.current = 0)
                        }
                    }, []), (0, T.jsx)(i9, oS(oO({}, D), {
                        children: (0, T.jsx)(oB, {
                            scope: j,
                            contentId: k,
                            open: Y,
                            stateAttribute: V,
                            trigger: L,
                            onTriggerChange: C,
                            onTriggerEnter: th.useCallback(function() {
                                E.isOpenDelayed ? q() : W()
                            }, [E.isOpenDelayed, q, W]),
                            onTriggerLeave: th.useCallback(function() {
                                z ? Q() : (window.clearTimeout(R.current), R.current = 0)
                            }, [Q, z]),
                            onOpen: W,
                            onClose: Q,
                            disableHoverableContent: z,
                            children: O
                        })
                    }))
                };
            oY.displayName = oU;
            var oG = "TooltipTrigger",
                oV = th.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = oI(e, ["__scopeTooltip"]),
                        i = oF(oG, r),
                        o = oR(oG, r),
                        a = oD(r),
                        l = rU(t, th.useRef(null), i.onTriggerChange),
                        u = th.useRef(!1),
                        c = th.useRef(!1),
                        s = th.useCallback(function() {
                            return u.current = !1
                        }, []);
                    return th.useEffect(function() {
                        return function() {
                            return document.removeEventListener("pointerup", s)
                        }
                    }, [s]), (0, T.jsx)(oe, oS(oO({
                        asChild: !0
                    }, a), {
                        children: (0, T.jsx)(iG.button, oS(oO({
                            "aria-describedby": i.open ? i.contentId : void 0,
                            "data-state": i.stateAttribute
                        }, n), {
                            ref: l,
                            onPointerMove: rC(e.onPointerMove, function(e) {
                                "touch" !== e.pointerType && (c.current || o.isPointerInTransitRef.current || (i.onTriggerEnter(), c.current = !0))
                            }),
                            onPointerLeave: rC(e.onPointerLeave, function() {
                                i.onTriggerLeave(), c.current = !1
                            }),
                            onPointerDown: rC(e.onPointerDown, function() {
                                u.current = !0, document.addEventListener("pointerup", s, {
                                    once: !0
                                })
                            }),
                            onFocus: rC(e.onFocus, function() {
                                u.current || i.onOpen()
                            }),
                            onBlur: rC(e.onBlur, i.onClose),
                            onClick: rC(e.onClick, i.onClose)
                        }))
                    }))
                });
            oV.displayName = oG;
            var oW = "TooltipPortal",
                oQ = oM(oE(oW, {
                    forceMount: void 0
                }), 2),
                oq = oQ[0],
                oK = oQ[1],
                oH = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.forceMount,
                        n = e.children,
                        i = e.container,
                        o = oF(oW, t);
                    return (0, T.jsx)(oq, {
                        scope: t,
                        forceMount: r,
                        children: (0, T.jsx)(ob, {
                            present: r || o.open,
                            children: (0, T.jsx)(op, {
                                asChild: !0,
                                container: i,
                                children: n
                            })
                        })
                    })
                };
            oH.displayName = oW;
            var oX = "TooltipContent",
                oZ = th.forwardRef(function(e, t) {
                    var r = oK(oX, e.__scopeTooltip),
                        n = e.forceMount,
                        i = void 0 === n ? r.forceMount : n,
                        o = e.side,
                        a = void 0 === o ? "top" : o,
                        l = oI(e, ["forceMount", "side"]),
                        u = oF(oX, e.__scopeTooltip);
                    return (0, T.jsx)(ob, {
                        present: i || u.open,
                        children: u.disableHoverableContent ? (0, T.jsx)(o2, oS(oO({
                            side: a
                        }, l), {
                            ref: t
                        })) : (0, T.jsx)(o$, oS(oO({
                            side: a
                        }, l), {
                            ref: t
                        }))
                    })
                }),
                o$ = th.forwardRef(function(e, t) {
                    var r = oF(oX, e.__scopeTooltip),
                        n = oR(oX, e.__scopeTooltip),
                        i = th.useRef(null),
                        o = rU(t, i),
                        a = oM(th.useState(null), 2),
                        l = a[0],
                        u = a[1],
                        c = r.trigger,
                        s = r.onClose,
                        d = i.current,
                        f = n.onPointerInTransitChange,
                        p = th.useCallback(function() {
                            u(null), f(!1)
                        }, [f]),
                        m = th.useCallback(function(e, t) {
                            var r, n, i, o, a, l, c = e.currentTarget,
                                s = {
                                    x: e.clientX,
                                    y: e.clientY
                                },
                                d = function(e, t) {
                                    var r = Math.abs(t.top - e.y),
                                        n = Math.abs(t.bottom - e.y),
                                        i = Math.abs(t.right - e.x),
                                        o = Math.abs(t.left - e.x);
                                    switch (Math.min(r, n, i, o)) {
                                        case o:
                                            return "left";
                                        case i:
                                            return "right";
                                        case r:
                                            return "top";
                                        case n:
                                            return "bottom";
                                        default:
                                            throw Error("unreachable")
                                    }
                                }(s, c.getBoundingClientRect()),
                                p = function(e, t) {
                                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 5,
                                        n = [];
                                    switch (t) {
                                        case "top":
                                            n.push({
                                                x: e.x - r,
                                                y: e.y + r
                                            }, {
                                                x: e.x + r,
                                                y: e.y + r
                                            });
                                            break;
                                        case "bottom":
                                            n.push({
                                                x: e.x - r,
                                                y: e.y - r
                                            }, {
                                                x: e.x + r,
                                                y: e.y - r
                                            });
                                            break;
                                        case "left":
                                            n.push({
                                                x: e.x + r,
                                                y: e.y - r
                                            }, {
                                                x: e.x + r,
                                                y: e.y + r
                                            });
                                            break;
                                        case "right":
                                            n.push({
                                                x: e.x - r,
                                                y: e.y - r
                                            }, {
                                                x: e.x - r,
                                                y: e.y + r
                                            })
                                    }
                                    return n
                                }(s, d),
                                m = (n = (r = t.getBoundingClientRect()).top, i = r.right, o = r.bottom, [{
                                    x: a = r.left,
                                    y: n
                                }, {
                                    x: i,
                                    y: n
                                }, {
                                    x: i,
                                    y: o
                                }, {
                                    x: a,
                                    y: o
                                }]);
                            u(((l = oP(p).concat(oP(m)).slice()).sort(function(e, t) {
                                return e.x < t.x ? -1 : e.x > t.x ? 1 : e.y < t.y ? -1 : 1 * !!(e.y > t.y)
                            }), function(e) {
                                if (e.length <= 1) return e.slice();
                                for (var t = [], r = 0; r < e.length; r++) {
                                    for (var n = e[r]; t.length >= 2;) {
                                        var i = t[t.length - 1],
                                            o = t[t.length - 2];
                                        if ((i.x - o.x) * (n.y - o.y) >= (i.y - o.y) * (n.x - o.x)) t.pop();
                                        else break
                                    }
                                    t.push(n)
                                }
                                t.pop();
                                for (var a = [], l = e.length - 1; l >= 0; l--) {
                                    for (var u = e[l]; a.length >= 2;) {
                                        var c = a[a.length - 1],
                                            s = a[a.length - 2];
                                        if ((c.x - s.x) * (u.y - s.y) >= (c.y - s.y) * (u.x - s.x)) a.pop();
                                        else break
                                    }
                                    a.push(u)
                                }
                                return (a.pop(), 1 === t.length && 1 === a.length && t[0].x === a[0].x && t[0].y === a[0].y) ? t : t.concat(a)
                            }(l))), f(!0)
                        }, [f]);
                    return th.useEffect(function() {
                        return function() {
                            return p()
                        }
                    }, [p]), th.useEffect(function() {
                        if (c && d) {
                            var e = function(e) {
                                    return m(e, d)
                                },
                                t = function(e) {
                                    return m(e, c)
                                };
                            return c.addEventListener("pointerleave", e), d.addEventListener("pointerleave", t),
                                function() {
                                    c.removeEventListener("pointerleave", e), d.removeEventListener("pointerleave", t)
                                }
                        }
                    }, [c, d, m, p]), th.useEffect(function() {
                        if (l) {
                            var e = function(e) {
                                var t = e.target,
                                    r = {
                                        x: e.clientX,
                                        y: e.clientY
                                    },
                                    n = (null == c ? void 0 : c.contains(t)) || (null == d ? void 0 : d.contains(t)),
                                    i = ! function(e, t) {
                                        for (var r = e.x, n = e.y, i = !1, o = 0, a = t.length - 1; o < t.length; a = o++) {
                                            var l = t[o].x,
                                                u = t[o].y,
                                                c = t[a].x,
                                                s = t[a].y;
                                            u > n != s > n && r < (c - l) * (n - u) / (s - u) + l && (i = !i)
                                        }
                                        return i
                                    }(r, l);
                                n ? p() : i && (p(), s())
                            };
                            return document.addEventListener("pointermove", e),
                                function() {
                                    return document.removeEventListener("pointermove", e)
                                }
                        }
                    }, [c, d, l, s, p]), (0, T.jsx)(o2, oS(oO({}, e), {
                        ref: o
                    }))
                }),
                oJ = oM(oE(oU, {
                    isInside: !1
                }), 2),
                o0 = oJ[0],
                o1 = oJ[1],
                o2 = th.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = e.children,
                        i = e["aria-label"],
                        o = e.onEscapeKeyDown,
                        a = e.onPointerDownOutside,
                        l = oI(e, ["__scopeTooltip", "children", "aria-label", "onEscapeKeyDown", "onPointerDownOutside"]),
                        u = oF(oX, r),
                        c = oD(r),
                        s = u.onClose;
                    return th.useEffect(function() {
                        return document.addEventListener(oL, s),
                            function() {
                                return document.removeEventListener(oL, s)
                            }
                    }, [s]), th.useEffect(function() {
                        if (u.trigger) {
                            var e = function(e) {
                                var t = e.target;
                                (null == t ? void 0 : t.contains(u.trigger)) && s()
                            };
                            return window.addEventListener("scroll", e, {
                                    capture: !0
                                }),
                                function() {
                                    return window.removeEventListener("scroll", e, {
                                        capture: !0
                                    })
                                }
                        }
                    }, [u.trigger, s]), (0, T.jsx)(rW.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !1,
                        onEscapeKeyDown: o,
                        onPointerDownOutside: a,
                        onFocusOutside: function(e) {
                            return e.preventDefault()
                        },
                        onDismiss: s,
                        children: (0, T.jsxs)(oo, oS(oO({
                            "data-state": u.stateAttribute
                        }, c, l), {
                            ref: t,
                            style: oO({}, l.style, {
                                "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                                "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                                "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                                "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                                "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                            }),
                            children: [(0, T.jsx)(iU, {
                                children: n
                            }), (0, T.jsx)(o0, {
                                scope: r,
                                isInside: !0,
                                children: (0, T.jsx)(ox, {
                                    id: u.contentId,
                                    role: "tooltip",
                                    children: i || n
                                })
                            })]
                        }))
                    })
                });
            oZ.displayName = oX;
            var o4 = "TooltipArrow",
                o3 = th.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = oI(e, ["__scopeTooltip"]),
                        i = oD(r);
                    return o1(o4, r).isInside ? null : (0, T.jsx)(ou, oS(oO({}, i, n), {
                        ref: t
                    }))
                });

            function o5(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function o6(e) {
                var t, r = e.position,
                    n = e.hasBeak,
                    i = e.title,
                    o = e.description,
                    a = e.ariaLabel,
                    l = e.delayDurationMs,
                    u = e.children,
                    c = e.open,
                    s = e.onOpenChange,
                    d = e.contentClassName,
                    f = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = r.split("-")) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var i = [],
                                o = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    o || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return i
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return o5(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return o5(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    p = f[0],
                    m = f[1],
                    y = null != a ? a : "string" == typeof i && null == o ? i : void 0;
                return th.createElement(oz, {
                    delayDuration: void 0 === l ? 500 : l
                }, th.createElement(oY, {
                    open: c,
                    onOpenChange: s
                }, u, th.createElement(oH, null, th.createElement(oZ, {
                    side: p,
                    align: m,
                    "aria-label": y,
                    className: tv("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", d),
                    sideOffset: 5
                }, (void 0 === n || n) && th.createElement(o3, {
                    asChild: !0
                }, th.createElement(rL, {
                    className: "content-[var(--inverse-surface-0)]"
                })), th.createElement("div", {
                    className: "flex flex-col text-truncate-split"
                }, th.createElement("div", {
                    className: "text-caption-medium content-inverse-default"
                }, i), o && th.createElement("div", {
                    className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
                }, o))))))
            }

            function o8(e) {
                var t = e.children,
                    r = e.asChild,
                    n = e.className;
                return th.createElement(oV, {
                    asChild: r,
                    className: n
                }, t)
            }
            o3.displayName = o4;
            var o9 = function(e) {
                    var t = e.title,
                        r = e.description,
                        n = e.position;
                    return tg().createElement(o6, {
                        position: void 0 === n ? "top-center" : n,
                        title: t,
                        description: r
                    }, tg().createElement(o8, {
                        asChild: !0
                    }, tg().createElement("span", {
                        role: "button",
                        tabIndex: 0,
                        "aria-label": t,
                        className: "flex items-center content-muted",
                        "data-testid": "label-tooltip-trigger"
                    }, tg().createElement(tI, {
                        name: "icon-regular-circle-i",
                        size: "Small"
                    }))))
                },
                o7 = {
                    Standard: "bg-none",
                    Contrast: "bg-shift-200",
                    Utility: "bg-none"
                },
                ae = {
                    Standard: "stroke-standard",
                    Contrast: "stroke-none",
                    Utility: "stroke-none"
                };

            function at(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ar(e) {
                if (Array.isArray(e)) return e
            }

            function an(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function ai() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ao(e, t) {
                if (e) {
                    if ("string" == typeof e) return at(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return at(e, t)
                }
            }
            var aa = {
                    XSmall: "padding-x-small",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-medium"
                },
                al = {
                    XSmall: "gap-x-xsmall",
                    Small: "gap-x-small",
                    Medium: "gap-x-small",
                    Large: "gap-x-small"
                },
                au = {
                    XSmall: "height-600",
                    Small: "height-800",
                    Medium: "height-1000",
                    Large: "height-1200"
                },
                ac = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                as = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                ad = {
                    XSmall: ["text-body-small", "placeholder:text-body-small"],
                    Small: ["text-body-small", "placeholder:text-body-small"],
                    Medium: ["text-body-medium", "placeholder:text-body-medium"],
                    Large: ["text-body-large", "placeholder:text-body-large"]
                },
                af = (0, th.forwardRef)(function(e, t) {
                    var r, n, i, o = ar(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || ao(r) || ai(),
                        a = o[0],
                        l = o.slice(1),
                        u = a.label,
                        c = a.labelTooltip,
                        s = a.leadingIconName,
                        d = a.trailingIconName,
                        f = a.leadingIconNode,
                        p = a.trailingIconNode,
                        m = a.hasError,
                        y = a.error,
                        b = a.helperText,
                        h = a.size,
                        g = a.variant,
                        v = void 0 === g ? "Standard" : g,
                        w = a.isRequired,
                        x = a.isDisabled,
                        j = a.className,
                        O = a.style,
                        S = a.inputContainerClassName,
                        I = a.inputContainerClassStyle,
                        M = a.id,
                        P = function(e, t) {
                            if (null == e) return {};
                            var r, n, i, o = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }
                            if (o = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, i = {},
                                        o = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                    return i
                                }(e, t), Object.getOwnPropertySymbols)
                                for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }(a, ["label", "labelTooltip", "leadingIconName", "trailingIconName", "leadingIconNode", "trailingIconNode", "hasError", "error", "helperText", "size", "variant", "isRequired", "isDisabled", "className", "style", "inputContainerClassName", "inputContainerClassStyle", "id"]),
                        N = (ar(l) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(l) || ao(l, 1) || ai())[0],
                        T = rA(),
                        E = M || T,
                        D = "".concat(E, "-description"),
                        A = null != h ? h : "Large",
                        L = m || !!y,
                        C = y || b,
                        k = (0, th.useMemo)(function() {
                            return s ? tg().createElement(tI, {
                                name: s,
                                size: A,
                                className: "content-emphasis",
                                "data-testid": "text-input-leading-icon"
                            }) : f
                        }, [s, f, A]),
                        R = (0, th.useMemo)(function() {
                            return d ? tg().createElement(tI, {
                                name: d,
                                size: A,
                                className: "content-emphasis",
                                "data-testid": "text-input-trailing-icon"
                            }) : p
                        }, [A, d, p]),
                        z = u ? tg().createElement("label", {
                            htmlFor: E,
                            className: tv(as[A], "content-emphasis")
                        }, u, w && tg().createElement(tg().Fragment, null, " ", tg().createElement("span", {
                            className: "content-default"
                        }, "*"))) : null;
                    return tg().createElement("div", {
                        "data-testid": "text-input-wrapper",
                        className: tv("flex width-full flex-col gap-small ".concat(j), an({}, tN, x)),
                        style: O
                    }, z && (c ? tg().createElement("div", {
                        className: "flex items-center gap-xsmall"
                    }, z, tg().createElement(o9, c)) : z), tg().createElement("div", {
                        "data-testid": "text-input-container",
                        className: tv("foundation-web-input flex items-center width-full", ae[v], o7[v], S, au[A], ac[A], aa[A], al[A], L ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                        style: I
                    }, k, tg().createElement("input", (n = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                an(e, t, r[t])
                            })
                        }
                        return e
                    }({
                        type: "text",
                        id: E,
                        ref: N,
                        className: tv("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", ad[A]),
                        style: {
                            appearance: "none"
                        },
                        "aria-invalid": L,
                        "aria-describedby": C ? D : void 0,
                        required: w
                    }, P), i = i = {
                        disabled: x
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(i)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(i)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(i, e))
                    }), n)), R), C && tg().createElement("span", {
                        id: D,
                        className: tv("text-caption-small", {
                            "content-system-alert": L,
                            "content-default": !L
                        })
                    }, C))
                });
            af.displayName = "TextInput";
            var ap = window.Roblox["core-scripts"].eventStream;

            function am(e) {
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
            var ay = ((a = {}).BuyRobuxPage = "buyRobuxPage", a.Flyout = "flyout", a.DirectUrl = "directUrl", a),
                ab = "plus_referral_dashboard_shown",
                ah = "plus_referral_copy_link_click",
                ag = "plus_referral_sheet_shown",
                av = "plus_referral_subscribe_click",
                aw = "plus_referral_sheet_dismissed",
                ax = "plus_referral_share_card_shown",
                aj = "plus_referral_share_card_invite_click",
                aO = "plusReferral",
                aS = window.Roblox["core-scripts"].environmentUrls,
                aI = r.n(aS);

            function aM(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function aP() {
                return null != M || (M = "".concat(aI().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), M
            }
            var aN = function() {};

            function aT(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aE(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var aD = function(e, t) {
                    return e << 3 | t
                },
                aA = aD(1, 2),
                aL = aD(2, 2),
                aC = aD(5, 2),
                ak = aD(6, 2),
                aR = aD(8, 2),
                az = aD(1, 2),
                aU = aD(2, 1),
                a_ = aD(3, 0),
                aB = aD(5, 2);
            aD(1, 2), aD(2, 1), aD(3, 0), aD(4, 2), aD(5, 2), aD(6, 0), aD(8, 2);
            var aF = aD(4, 0),
                aY = aD(6, 2),
                aG = aD(7, 2);
            aD(1, 0), aD(2, 2);
            var aV = aD(1, 2),
                aW = aD(2, 2),
                aQ = aD(1, 2);
            aD(1, 2), aD(2, 2), aD(1, 2);
            var aq = new TextEncoder,
                aK = function() {
                    var e;

                    function t() {
                        var e;
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        e = [], "buf" in this ? Object.defineProperty(this, "buf", {
                            value: e,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : this.buf = e
                    }
                    return e = [{
                            key: "writeVarint",
                            value: function(e) {
                                var t = (void 0 === e ? "undefined" : aE(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                                for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                                this.buf.push(Number(t))
                            }
                        }, {
                            key: "writeString",
                            value: function(e) {
                                var t = aq.encode(e);
                                this.writeVarint(t.length);
                                var r = !0,
                                    n = !1,
                                    i = void 0;
                                try {
                                    for (var o, a = t[Symbol.iterator](); !(r = (o = a.next()).done); r = !0) {
                                        var l = o.value;
                                        this.buf.push(l)
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
                        }, {
                            key: "writeBytes",
                            value: function(e) {
                                this.writeVarint(e.length);
                                var t = !0,
                                    r = !1,
                                    n = void 0;
                                try {
                                    for (var i, o = e[Symbol.iterator](); !(t = (i = o.next()).done); t = !0) {
                                        var a = i.value;
                                        this.buf.push(a)
                                    }
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
                        }, {
                            key: "writeDouble",
                            value: function(e) {
                                var t = new DataView(new ArrayBuffer(8));
                                t.setFloat64(0, e, !0);
                                for (var r = 0; r < 8; r += 1) this.buf.push(t.getUint8(r))
                            }
                        }, {
                            key: "toBytes",
                            value: function() {
                                return new Uint8Array(this.buf)
                            }
                        }],
                        function(e, t) {
                            for (var r = 0; r < t.length; r++) {
                                var n = t[r];
                                n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                            }
                        }(t.prototype, e), t
                }();

            function aH(e, t, r) {
                var n = new aK;
                return n.writeVarint(aD(1, 2)), n.writeString(e), n.writeVarint(t), r(n), n.toBytes()
            }

            function aX(e) {
                var t = new aK;
                if (t.writeVarint(az), t.writeString(e.name), t.writeVarint(aU), t.writeDouble(e.value), t.writeVarint(a_), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var r = function(e) {
                        var t = new aK,
                            r = !0,
                            n = !1,
                            i = void 0;
                        try {
                            for (var o, a = Object.entries(e)[Symbol.iterator](); !(r = (o = a.next()).done); r = !0) ! function() {
                                var e, r = (e = o.value, function(e) {
                                        if (Array.isArray(e)) return e
                                    }(e) || function(e) {
                                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                        if (null != n) {
                                            var i = [],
                                                o = !0,
                                                a = !1;
                                            try {
                                                for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                                            } catch (e) {
                                                a = !0, r = e
                                            } finally {
                                                try {
                                                    o || null == n.return || n.return()
                                                } finally {
                                                    if (a) throw r
                                                }
                                            }
                                            return i
                                        }
                                    }(e) || function(e) {
                                        if (e) {
                                            if ("string" == typeof e) return aT(e, 2);
                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aT(e, 2)
                                        }
                                    }(e) || function() {
                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                    }()),
                                    n = r[0],
                                    i = r[1];
                                if ("string" == typeof i) {
                                    var a = aH(n, aD(2, 2), function(e) {
                                        e.writeString(i)
                                    });
                                    t.writeVarint(aC), t.writeBytes(a)
                                } else if ("boolean" == typeof i) {
                                    var l = aH(n, aD(2, 0), function(e) {
                                        e.writeVarint(+!!i)
                                    });
                                    t.writeVarint(ak), t.writeBytes(l)
                                } else if ((void 0 === i ? "undefined" : aE(i)) === "bigint") {
                                    var u = aH(n, aD(2, 0), function(e) {
                                        e.writeVarint(i)
                                    });
                                    t.writeVarint(aL), t.writeBytes(u)
                                } else if ("number" == typeof i)
                                    if (Number.isFinite(i))
                                        if (Number.isInteger(i) && i >= -0x80000000 && i <= 0x7fffffff) {
                                            var c = aH(n, aD(2, 0), function(e) {
                                                e.writeVarint(i)
                                            });
                                            t.writeVarint(aA), t.writeBytes(c)
                                        } else if (Number.isInteger(i)) {
                                    var s = aH(n, aD(2, 0), function(e) {
                                        e.writeVarint(BigInt(i))
                                    });
                                    t.writeVarint(aL), t.writeBytes(s)
                                } else {
                                    var d = aH(n, aD(2, 1), function(e) {
                                        e.writeDouble(i)
                                    });
                                    t.writeVarint(aR), t.writeBytes(d)
                                } else {
                                    var f = aH(n, aD(2, 2), function(e) {
                                        e.writeString(String(i))
                                    });
                                    t.writeVarint(aC), t.writeBytes(f)
                                }
                            }()
                        } catch (e) {
                            n = !0, i = e
                        } finally {
                            try {
                                r || null == a.return || a.return()
                            } finally {
                                if (n) throw i
                            }
                        }
                        return t.toBytes()
                    }(e.attributes);
                    t.writeVarint(aB), t.writeBytes(r)
                }
                return t.toBytes()
            }

            function aZ(e, t, r) {
                var n = new aK;
                n.writeVarint(aF), n.writeVarint(r);
                var i = !0,
                    o = !1,
                    a = void 0;
                try {
                    for (var l, u = e[Symbol.iterator](); !(i = (l = u.next()).done); i = !0) {
                        var c = l.value;
                        n.writeVarint(aY), n.writeBytes(c)
                    }
                } catch (e) {
                    o = !0, a = e
                } finally {
                    try {
                        i || null == u.return || u.return()
                    } finally {
                        if (o) throw a
                    }
                }
                var s = !0,
                    d = !1,
                    f = void 0;
                try {
                    for (var p, m = t[Symbol.iterator](); !(s = (p = m.next()).done); s = !0) {
                        var y = p.value;
                        n.writeVarint(aG), n.writeBytes(y)
                    }
                } catch (e) {
                    d = !0, f = e
                } finally {
                    try {
                        s || null == m.return || m.return()
                    } finally {
                        if (d) throw f
                    }
                }
                return n.toBytes()
            }

            function a$(e) {
                var t = new aK;
                t.writeVarint(aV), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(aW), t.writeBytes(e);
                var r = t.toBytes(),
                    n = new aK;
                return n.writeVarint(aQ), n.writeBytes(r), n.toBytes()
            }
            var aJ = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function a0(e) {
                return aJ.test(e)
            }
            var a1 = [],
                a2 = !1,
                a4 = !1;

            function a3(e, t) {
                var r, n, i, o = e.map(function(e) {
                        return {
                            name: e.name,
                            value: e.value,
                            timestampMs: e.timestampMs,
                            attributes: e.attributes
                        }
                    }),
                    a = BigInt(Date.now());
                !0 === t || a4 || "u" > typeof document && "hidden" === document.visibilityState ? (r = a$(aZ(o.map(aX), [], a)).buffer, fetch("".concat(aP()).concat("/v1/events/single"), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: r,
                    credentials: "include",
                    keepalive: !0
                }).catch(aN)) : (n = a$(aZ(o.map(aX), [], a)), (i = function() {
                    var e, t, r, i, o, a, l, u, c, s, d, f, p;
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
                            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                            l = Object.defineProperty;
                        return l(a, "next", {
                            value: u(0)
                        }), l(a, "throw", {
                            value: u(1)
                        }), l(a, "return", {
                            value: u(2)
                        }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), a;

                        function u(l) {
                            return function(u) {
                                var c = [l, u];
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
                    }(this, function(m) {
                        switch (m.label) {
                            case 0:
                                if ("u" < typeof CompressionStream) return [2, {
                                    body: n.buffer,
                                    compressed: !1
                                }];
                                return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(n).catch(aN), t.close().catch(aN), r = [], [4, (i = e.readable.getReader()).read()];
                            case 1:
                                o = m.sent(), m.label = 2;
                            case 2:
                                if (o.done) return [3, 4];
                                return r.push(o.value), [4, i.read()];
                            case 3:
                                return o = m.sent(), [3, 2];
                            case 4:
                                a = new Uint8Array(r.reduce(function(e, t) {
                                    return e + t.length
                                }, 0)), l = 0, u = !0, c = !1, s = void 0;
                                try {
                                    for (d = r[Symbol.iterator](); !(u = (f = d.next()).done); u = !0) p = f.value, a.set(p, l), l += p.length
                                } catch (e) {
                                    c = !0, s = e
                                } finally {
                                    try {
                                        u || null == d.return || d.return()
                                    } finally {
                                        if (c) throw s
                                    }
                                }
                                return [2, {
                                    body: a.buffer,
                                    compressed: !0
                                }]
                        }
                    })
                }, function() {
                    var e = this,
                        t = arguments;
                    return new Promise(function(r, n) {
                        var o = i.apply(e, t);

                        function a(e) {
                            aM(o, r, n, a, l, "next", e)
                        }

                        function l(e) {
                            aM(o, r, n, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                })()).then(function(e) {
                    var t = e.body,
                        r = e.compressed,
                        n = {
                            "Content-Type": "application/x-protobuf"
                        };
                    return r && (n["Content-Encoding"] = "gzip"), fetch("".concat(aP()).concat("/v1/events/single"), {
                        method: "POST",
                        headers: n,
                        body: t,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(aN)
            }

            function a5() {
                var e = !0,
                    t = !1,
                    r = void 0;
                try {
                    for (var n, i = a1[Symbol.iterator](); !(e = (n = i.next()).done); e = !0) {
                        var o = n.value.splice(0);
                        0 !== o.length && a3(o, !0)
                    }
                } catch (e) {
                    t = !0, r = e
                } finally {
                    try {
                        e || null == i.return || i.return()
                    } finally {
                        if (t) throw r
                    }
                }
            }

            function a6(e, t) {
                var r, n, i, o = Math.max(1, null != (r = null == t ? void 0 : t.batchSize) ? r : 10),
                    a = null != (n = null == t ? void 0 : t.batchIntervalMs) ? n : 250;

                function l(e, r) {
                    (null == t ? void 0 : t.onError) ? t.onError(e, r): console.error(e, r)
                }
                if (!a0(e)) return l('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                        name: e
                    }),
                    function() {};
                var u = [];
                return a1.push(u), a2 || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                        "hidden" === document.visibilityState && a5()
                    }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                        a4 = !0, a5()
                    }), a2 = !0),
                    function(t, r, n) {
                        var c = "".concat(e, "_").concat(t);
                        if (! function(e, t) {
                                if (!a0(e)) return !1;
                                if (t) {
                                    var r = !0,
                                        n = !1,
                                        i = void 0;
                                    try {
                                        for (var o, a = Object.keys(t)[Symbol.iterator](); !(r = (o = a.next()).done); r = !0) {
                                            var l = o.value;
                                            if (!a0(l)) return !1
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
                                return !0
                            }(c, r)) return void l("@rbx/web-telemetry: invalid event name or attribute key", {
                            name: t,
                            attributes: r
                        });
                        var s = null != n ? n : 1;
                        if (!Number.isFinite(s)) return void l("@rbx/web-telemetry: value must be a finite number", {
                            name: t,
                            attributes: r
                        });
                        var d = r && Object.keys(r).length > 0 ? r : void 0;
                        u.push({
                            name: c,
                            attributes: d,
                            value: s,
                            timestampMs: BigInt(Date.now())
                        }), u.length >= o ? (void 0 !== i && (clearTimeout(i), i = void 0), a3(u.splice(0, o))) : void 0 === i && (i = setTimeout(function() {
                            for (i = void 0; u.length > 0;) a3(u.splice(0, o))
                        }, a))
                    }
            }
            var a8 = a6("SubscriptionsCommon"),
                a9 = function(e) {
                    (0, ap.sendEventWithTarget)(e.type, e.context, e.params)
                },
                a7 = function() {
                    try {
                        a9({
                            name: ab,
                            type: ab,
                            context: aO,
                            params: {}
                        })
                    } catch (e) {}
                },
                le = function() {
                    try {
                        a9({
                            name: ah,
                            type: ah,
                            context: aO,
                            params: {}
                        })
                    } catch (e) {}
                },
                lt = function(e, t, r, n, i) {
                    try {
                        var o, a, l, u, c;
                        a9((o = e, a = t, l = r, u = n, c = i, {
                            name: ag,
                            type: ag,
                            context: aO,
                            params: am({
                                face: o,
                                hasReferrerId: String(a)
                            }, l ? {
                                referrerId: l
                            } : {}, u ? {
                                referralCode: u
                            } : {}, c ? {
                                surface: c
                            } : {})
                        }))
                    } catch (e) {}
                },
                lr = function(e, t, r, n) {
                    try {
                        var i, o, a, l;
                        a9((i = e, o = t, a = r, l = n, {
                            name: av,
                            type: av,
                            context: aO,
                            params: am({
                                face: i
                            }, o ? {
                                referrerId: o
                            } : {}, a ? {
                                referralCode: a
                            } : {}, l ? {
                                surface: l
                            } : {})
                        }))
                    } catch (e) {}
                },
                ln = function(e, t, r, n) {
                    try {
                        var i, o, a, l;
                        a9((i = e, o = t, a = r, l = n, {
                            name: aw,
                            type: aw,
                            context: aO,
                            params: am({
                                face: i
                            }, o ? {
                                referrerId: o
                            } : {}, a ? {
                                referralCode: a
                            } : {}, l ? {
                                surface: l
                            } : {})
                        }))
                    } catch (e) {}
                },
                li = function() {
                    try {
                        a9({
                            name: ax,
                            type: ax,
                            context: aO,
                            params: {}
                        }), a8("ShareCardShown", void 0)
                    } catch (e) {}
                },
                lo = function() {
                    try {
                        a9({
                            name: aj,
                            type: aj,
                            context: aO,
                            params: {}
                        }), a8("ShareCardInviteClick", void 0)
                    } catch (e) {}
                };

            function la(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ll(e) {
                return function(e) {
                    if (Array.isArray(e)) return la(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return la(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return la(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var lu = "__FN_nvfToKPAOuiV__",
                lc = new RegExp("".concat(lu, "(\\d+)\\|")),
                ls = function(e, t, r, n) {
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
                            n = "".concat(lu).concat(r, "|"),
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
                                n = lc.exec(e);
                            if (!n) return [e];
                            n.index > 0 && r.push(e.slice(0, n.index));
                            var i = n[1] && o[n[1]];
                            if (!i) return console.warn("Unexpected malformed segment", t), [];
                            i.used = !0;
                            var a = e.indexOf(i.end);
                            if (-1 === a) return console.warn("Unexpected malformed segment", t), [];
                            var u = e.slice(n.index + n[0].length, a),
                                c = i.render(l(u));
                            Array.isArray(c) ? r.push.apply(r, ll(c)) : r.push(c);
                            var s = e.slice(a + i.end.length);
                            return s.length > 0 && r.push.apply(r, ll(l(s))), r
                        },
                        u = l(a).filter(function(e) {
                            return "" !== e
                        });
                    return Object.values(o).some(function(e) {
                        return !e.used
                    }) ? (console.warn("Unused segments found", t), []) : u.map(function(e, t) {
                        return (0, T.jsx)(th.Fragment, {
                            children: e
                        }, t)
                    })
                };

            function ld(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lf(e) {
                if (Array.isArray(e)) return e
            }

            function lp() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function lm(e) {
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

            function ly(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function lb(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }

            function lh(e, t) {
                if (e) {
                    if ("string" == typeof e) return ld(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ld(e, t)
                }
            }
            var lg = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                lv = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                lw = {
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
                lx = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                lj = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                lO = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                lS = {
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
                lI = {
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
                lM = (0, th.forwardRef)(function(e, t) {
                    var r, n, i = lf(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || lh(r) || lp(),
                        o = i[0],
                        a = i.slice(1),
                        l = o.className,
                        u = o.icon,
                        c = o.ariaLabel,
                        s = o.isDisabled,
                        d = void 0 !== s && s,
                        f = o.isCircular,
                        p = o.isSelected,
                        m = o.size,
                        y = void 0 === m ? "Large" : m,
                        b = o.variant,
                        h = void 0 === b ? "Emphasis" : b,
                        g = o.iconColor,
                        v = void 0 === g ? "Default" : g,
                        w = o.asChild,
                        x = o.children,
                        j = lb(o, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]),
                        O = (lf(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(a) || lh(a, 1) || lp())[0];
                    n = d ? lj[h] : void 0 !== p && p ? lO[h] : lx[h];
                    var S = tv("foundation-web-icon-button", d ? tN : [tM, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", lg[y], lw[y][void 0 !== f && f ? "circular" : "square"], n, l),
                        I = tg().createElement(tg().Fragment, null, tg().createElement(tP, null), tg().createElement("span", {
                            className: tv("icon", u, lv[y], d ? lI[v][h] : lS[v][h])
                        }));
                    if (w) {
                        j.as;
                        var M = lb(j, ["as"]),
                            P = tg().Children.only(x);
                        return tg().createElement(tG, ly(lm({
                            ref: O
                        }, M), {
                            className: S,
                            "aria-label": c,
                            "aria-disabled": d || void 0
                        }), tg().cloneElement(P, {}, I))
                    }
                    if ("a" === j.as) {
                        j.as;
                        var N = j.href,
                            T = lb(j, ["as", "href"]);
                        return tg().createElement("a", ly(lm({
                            ref: O
                        }, T), {
                            "aria-label": c,
                            "aria-disabled": d,
                            href: d ? void 0 : N,
                            className: S
                        }), I)
                    }
                    j.as;
                    var E = lb(j, ["as"]);
                    return tg().createElement("button", ly(lm({
                        ref: O,
                        type: "button"
                    }, E), {
                        "aria-label": c,
                        disabled: d,
                        className: S
                    }), I)
                });

            function lP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lN(e) {
                if (Array.isArray(e)) return e
            }

            function lT() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function lE(e) {
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

            function lD(e, t) {
                if (e) {
                    if ("string" == typeof e) return lP(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lP(e, t)
                }
            }
            var lA = (0, th.forwardRef)(function(e, t) {
                var r, n, i, o = lN(i = [e, t]) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(i) || lD(i) || lT(),
                    a = o[0],
                    l = o.slice(1),
                    u = a.className,
                    c = a.style,
                    s = a.orientation,
                    d = void 0 === s ? "horizontal" : s,
                    f = a.variant,
                    p = void 0 === f ? "Standard" : f,
                    m = function(e, t) {
                        if (null == e) return {};
                        var r, n, i, o = {};
                        if ("u" > typeof Reflect && Reflect.ownKeys) {
                            for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }
                        if (o = function(e, t) {
                                if (null == e) return {};
                                var r, n, i = {},
                                    o = Object.getOwnPropertyNames(e);
                                for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                return i
                            }(e, t), Object.getOwnPropertySymbols)
                            for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                        return o
                    }(a, ["className", "style", "orientation", "variant"]),
                    y = (lN(l) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var i = [],
                                o = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); o = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    o || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return i
                        }
                    }(l) || lD(l, 1) || lT())[0],
                    b = "vertical" === d,
                    h = {};
                return b || "Inset" !== p ? b || "InsetLeft" !== p ? b || "InsetRight" !== p || (h = {
                    marginRight: "var(--padding-xlarge)"
                }) : h = {
                    marginLeft: "var(--padding-xlarge)"
                } : h = {
                    marginLeft: "var(--padding-xlarge)",
                    marginRight: "var(--padding-xlarge)"
                }, tg().createElement("div", (r = lE({
                    ref: y
                }, m), n = n = {
                    role: "separator",
                    "data-orientation": d,
                    "aria-orientation": d,
                    style: lE({
                        borderRightWidth: 0,
                        borderBottomWidth: 0,
                        boxSizing: "border-box",
                        borderStyle: "solid"
                    }, b ? {
                        height: "100%",
                        width: 0,
                        borderLeftWidth: "var(--stroke-standard)",
                        borderTopWidth: 0
                    } : "Thick" === p ? {
                        height: "var(--size-250)",
                        borderTop: "var(--stroke-standard)",
                        borderLeftWidth: 0,
                        background: "var(--color-common-heavydivider, rgba(0, 0, 0, 0.50))"
                    } : {
                        height: 0,
                        borderTopWidth: "var(--stroke-standard)",
                        borderLeftWidth: 0
                    }, h, c),
                    className: tv("stroke-default self-stretch", u)
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(n)).forEach(function(e) {
                    Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                }), r))
            });

            function lL(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    i = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === i || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function lC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lk(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function lR(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        lk(e, t, r[t])
                    })
                }
                return e
            }

            function lz(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }

            function lU(e) {
                return function(e) {
                    if (Array.isArray(e)) return lC(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return lC(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lC(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function l_() {
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
                            return lR({}, e, n(t)["__scope".concat(i)])
                        }, {});
                        return th.useMemo(function() {
                            return lk({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return i.scopeName = n.scopeName, i
            }
            lA.displayName = "Divider";
            var lB = (null == (P = globalThis) ? void 0 : P.document) ? th.useLayoutEffect : function() {};

            function lF(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var lY = th[" useId ".trim().toString()] || function() {},
                lG = 0;

            function lV(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = th.useState(lY())) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var i = [],
                                o = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    o || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return i
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return lF(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lF(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    i = r[1];
                return lB(function() {
                    e || i(function(e) {
                        return null != e ? e : String(lG++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function lW(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lQ(e) {
                var t = th.useRef(e);
                return th.useEffect(function() {
                    t.current = e
                }), th.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), i = 0; i < r; i++) n[i] = arguments[i];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return lW(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return lW(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lW(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function lq(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lK(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return lq(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lq(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lH(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lX(e) {
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

            function lZ(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function l$(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }

            function lJ(e) {
                return function(e) {
                    if (Array.isArray(e)) return lH(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return lH(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lH(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function l0(e) {
                var t, r, n = (t = e, (r = th.forwardRef(function(e, t) {
                        var r = e.children,
                            n = l$(e, ["children"]);
                        if (th.isValidElement(r)) {
                            var i, o, a, l, u, c = (u = (l = null == (o = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (u = (l = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                                s = function(e, t) {
                                    var r = lX({}, t);
                                    for (var n in t) ! function(n) {
                                        var i = e[n],
                                            o = t[n];
                                        /^on[A-Z]/.test(n) ? i && o ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            o.apply(void 0, lJ(t)), i.apply(void 0, lJ(t))
                                        } : i && (r[n] = i) : "style" === n ? r[n] = lX({}, i, o) : "className" === n && (r[n] = [i, o].filter(Boolean).join(" "))
                                    }(n);
                                    return lX({}, e, r)
                                }(n, r.props);
                            return r.type !== th.Fragment && (s.ref = t ? tA(t, c) : c), th.cloneElement(r, s)
                        }
                        return th.Children.count(r) > 1 ? th.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    i = th.forwardRef(function(e, t) {
                        var r = e.children,
                            i = l$(e, ["children"]),
                            o = th.Children.toArray(r),
                            a = o.find(l2);
                        if (a) {
                            var l = a.props.children,
                                u = o.map(function(e) {
                                    return e !== a ? e : th.Children.count(l) > 1 ? th.Children.only(null) : th.isValidElement(l) ? l.props.children : null
                                });
                            return (0, T.jsx)(n, lZ(lX({}, i), {
                                ref: t,
                                children: th.isValidElement(l) ? th.cloneElement(l, void 0, u) : null
                            }))
                        }
                        return (0, T.jsx)(n, lZ(lX({}, i), {
                            ref: t,
                            children: r
                        }))
                    });
                return i.displayName = "".concat(e, ".Slot"), i
            }
            var l1 = Symbol("radix.slottable");

            function l2(e) {
                return th.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === l1
            }

            function l4(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function l3(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        l4(e, t, r[t])
                    })
                }
                return e
            }

            function l5(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }
            var l6 = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                var r = l0("Primitive.".concat(t)),
                    n = th.forwardRef(function(e, n) {
                        var i = e.asChild,
                            o = function(e, t) {
                                if (null == e) return {};
                                var r, n, i, o = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                    return o
                                }
                                if (o = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, i = {},
                                            o = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                        return i
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }(e, ["asChild"]),
                            a = i ? r : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, T.jsx)(a, l5(l3({}, o), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), l5(l3({}, e), l4({}, t, n))
            }, {});

            function l8(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function l9(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                }(e, t) || l7(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function l7(e, t) {
                if (e) {
                    if ("string" == typeof e) return l8(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return l8(e, t)
                }
            }
            var ue = "focusScope.autoFocusOnMount",
                ut = "focusScope.autoFocusOnUnmount",
                ur = {
                    bubbles: !1,
                    cancelable: !0
                },
                un = th.forwardRef(function(e, t) {
                    var r, n, i = e.loop,
                        o = void 0 !== i && i,
                        a = e.trapped,
                        l = void 0 !== a && a,
                        u = e.onMountAutoFocus,
                        c = e.onUnmountAutoFocus,
                        s = function(e, t) {
                            if (null == e) return {};
                            var r, n, i, o = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }
                            if (o = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, i = {},
                                        o = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                    return i
                                }(e, t), Object.getOwnPropertySymbols)
                                for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }(e, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        d = l9(th.useState(null), 2),
                        f = d[0],
                        p = d[1],
                        m = lQ(u),
                        y = lQ(c),
                        b = th.useRef(null),
                        h = tL(t, function(e) {
                            return p(e)
                        }),
                        g = th.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    th.useEffect(function() {
                        if (l) {
                            var e = function(e) {
                                    if (!g.paused && f) {
                                        var t = e.target;
                                        f.contains(t) ? b.current = t : ua(b.current, {
                                            select: !0
                                        })
                                    }
                                },
                                t = function(e) {
                                    if (!g.paused && f) {
                                        var t = e.relatedTarget;
                                        null !== t && (f.contains(t) || ua(b.current, {
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
                                        for (var i, o = e[Symbol.iterator](); !(t = (i = o.next()).done); t = !0) i.value.removedNodes.length > 0 && ua(f)
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
                    }, [l, f, g.paused]), th.useEffect(function() {
                        if (f) {
                            ul.add(g);
                            var e = document.activeElement;
                            if (!f.contains(e)) {
                                var t = new CustomEvent(ue, ur);
                                f.addEventListener(ue, m), f.dispatchEvent(t), t.defaultPrevented || (function(e) {
                                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                        r = t.select,
                                        n = void 0 !== r && r,
                                        i = document.activeElement,
                                        o = !0,
                                        a = !1,
                                        l = void 0;
                                    try {
                                        for (var u, c = e[Symbol.iterator](); !(o = (u = c.next()).done); o = !0) {
                                            var s = u.value;
                                            if (ua(s, {
                                                    select: n
                                                }), document.activeElement !== i) return
                                        }
                                    } catch (e) {
                                        a = !0, l = e
                                    } finally {
                                        try {
                                            o || null == c.return || c.return()
                                        } finally {
                                            if (a) throw l
                                        }
                                    }
                                }(ui(f).filter(function(e) {
                                    return "A" !== e.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === e && ua(f))
                            }
                            return function() {
                                f.removeEventListener(ue, m), setTimeout(function() {
                                    var t = new CustomEvent(ut, ur);
                                    f.addEventListener(ut, y), f.dispatchEvent(t), t.defaultPrevented || ua(null != e ? e : document.body, {
                                        select: !0
                                    }), f.removeEventListener(ut, y), ul.remove(g)
                                }, 0)
                            }
                        }
                    }, [f, m, y, g]);
                    var v = th.useCallback(function(e) {
                        if ((o || l) && !g.paused) {
                            var t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                                r = document.activeElement;
                            if (t && r) {
                                var n, i, a = e.currentTarget,
                                    u = l9([uo(i = ui(n = a), n), uo(i.reverse(), n)], 2),
                                    c = u[0],
                                    s = u[1];
                                c && s ? e.shiftKey || r !== s ? e.shiftKey && r === c && (e.preventDefault(), o && ua(s, {
                                    select: !0
                                })) : (e.preventDefault(), o && ua(c, {
                                    select: !0
                                })) : r === a && e.preventDefault()
                            }
                        }
                    }, [o, l, g.paused]);
                    return (0, T.jsx)(l6.div, (r = function(e) {
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
                    }, s), n = n = {
                        ref: h,
                        onKeyDown: v
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r))
                });

            function ui(e) {
                for (var t = [], r = document.createTreeWalker(e, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(e) {
                            var t = "INPUT" === e.tagName && "hidden" === e.type;
                            return e.disabled || e.hidden || t ? NodeFilter.FILTER_SKIP : e.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); r.nextNode();) t.push(r.currentNode);
                return t
            }

            function uo(e, t) {
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

            function ua(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = t.select;
                if (e && e.focus) {
                    var n, i, o, a = document.activeElement;
                    e.focus({
                        preventScroll: !0
                    }), e !== a && (i = n = e, null != (o = HTMLInputElement) && "u" > typeof Symbol && o[Symbol.hasInstance] ? !!o[Symbol.hasInstance](i) : i instanceof o) && "select" in n && void 0 !== r && r && e.select()
                }
            }
            un.displayName = "FocusScope";
            var ul = (t = [], {
                add: function(e) {
                    var r = t[0];
                    e !== r && (null == r || r.pause()), (t = uu(t, e)).unshift(e)
                },
                remove: function(e) {
                    var r;
                    null == (r = (t = uu(t, e))[0]) || r.resume()
                }
            });

            function uu(e, t) {
                var r = function(e) {
                        if (Array.isArray(e)) return l8(e)
                    }(e) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(e) || l7(e) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r.indexOf(t);
                return -1 !== n && r.splice(n, 1), r
            }

            function uc(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var us = th.forwardRef(function(e, t) {
                var r, n, i, o, a, l = e.container,
                    u = function(e, t) {
                        if (null == e) return {};
                        var r, n, i, o = {};
                        if ("u" > typeof Reflect && Reflect.ownKeys) {
                            for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }
                        if (o = function(e, t) {
                                if (null == e) return {};
                                var r, n, i = {},
                                    o = Object.getOwnPropertyNames(e);
                                for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                return i
                            }(e, t), Object.getOwnPropertySymbols)
                            for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                        return o
                    }(e, ["container"]),
                    c = function(e) {
                        if (Array.isArray(e)) return e
                    }(r = th.useState(!1)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var i = [],
                                o = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    o || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return i
                        }
                    }(r) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return uc(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return uc(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = c[0],
                    d = c[1];
                lB(function() {
                    return d(!0)
                }, []);
                var f = l || s && (null == (a = globalThis) || null == (o = a.document) ? void 0 : o.body);
                return f ? ip().createPortal((0, T.jsx)(l6.div, (n = function(e) {
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
                }({}, u), i = i = {
                    ref: t
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(i)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(i)).forEach(function(e) {
                    Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(i, e))
                }), n)), f) : null
            });

            function ud(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uf(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return ud(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ud(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            us.displayName = "Portal";
            var up = function(e) {
                var t, r, n, i, o, a, l, u, c, s, d, f, p, m, y, b, h, g = e.present,
                    v = e.children,
                    w = (t = g, o = (i = uf(th.useState(), 2))[0], a = i[1], l = th.useRef({}), u = th.useRef(t), c = th.useRef("none"), d = (s = uf((r = t ? "mounted" : "unmounted", n = {
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
                    }, th.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], f = s[1], th.useEffect(function() {
                        var e = um(l.current);
                        c.current = "mounted" === d ? e : "none"
                    }, [d]), lB(function() {
                        var e = l.current,
                            r = u.current;
                        if (r !== t) {
                            var n = c.current,
                                i = um(e);
                            t ? f("MOUNT") : "none" === i || (null == e ? void 0 : e.display) === "none" ? f("UNMOUNT") : r && n !== i ? f("ANIMATION_OUT") : f("UNMOUNT"), u.current = t
                        }
                    }, [t, f]), lB(function() {
                        if (o) {
                            var e, t, r = null != (e = o.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = um(l.current).includes(e.animationName);
                                    if (e.target === o && n && (f("ANIMATION_END"), !u.current)) {
                                        var i = o.style.animationFillMode;
                                        o.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === o.style.animationFillMode && (o.style.animationFillMode = i)
                                        })
                                    }
                                },
                                i = function(e) {
                                    e.target === o && (c.current = um(l.current))
                                };
                            return o.addEventListener("animationstart", i), o.addEventListener("animationcancel", n), o.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), o.removeEventListener("animationstart", i), o.removeEventListener("animationcancel", n), o.removeEventListener("animationend", n)
                                }
                        }
                        f("ANIMATION_END")
                    }, [o, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: th.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    x = "function" == typeof v ? v({
                        present: w.isPresent
                    }) : th.Children.only(v),
                    j = tL(w.ref, (h = (b = null == (m = Object.getOwnPropertyDescriptor((p = x).props, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning) ? p.ref : (h = (b = null == (y = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : y.get) && "isReactWarning" in b && b.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof v || w.isPresent ? th.cloneElement(x, {
                    ref: j
                }) : null
            };

            function um(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            up.displayName = "Presence";
            var uy = window.RadixUI["react-focus-guards"],
                ub = function() {
                    return (ub = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var i in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                        return e
                    }).apply(this, arguments)
                };

            function uh(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var i = 0, n = Object.getOwnPropertySymbols(e); i < n.length; i++) 0 > t.indexOf(n[i]) && Object.prototype.propertyIsEnumerable.call(e, n[i]) && (r[n[i]] = e[n[i]]);
                return r
            }
            var ug = "right-scroll-bar-position",
                uv = "width-before-scroll-bar";

            function uw(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var ux = "u" > typeof window ? th.useLayoutEffect : th.useEffect,
                uj = new WeakMap,
                uO = (void 0 === l && (l = {}), (void 0 === u && (u = function(e) {
                    return e
                }), c = [], s = !1, d = {
                    read: function() {
                        if (s) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return c.length ? c[c.length - 1] : null
                    },
                    useMedium: function(e) {
                        var t = u(e, s);
                        return c.push(t),
                            function() {
                                c = c.filter(function(e) {
                                    return e !== t
                                })
                            }
                    },
                    assignSyncMedium: function(e) {
                        for (s = !0; c.length;) {
                            var t = c;
                            c = [], t.forEach(e)
                        }
                        c = {
                            push: function(t) {
                                return e(t)
                            },
                            filter: function() {
                                return c
                            }
                        }
                    },
                    assignMedium: function(e) {
                        s = !0;
                        var t = [];
                        if (c.length) {
                            var r = c;
                            c = [], r.forEach(e), t = c
                        }
                        var n = function() {
                                var r = t;
                                t = [], r.forEach(e)
                            },
                            i = function() {
                                return Promise.resolve().then(n)
                            };
                        i(), c = {
                            push: function(e) {
                                t.push(e), i()
                            },
                            filter: function(e) {
                                return t = t.filter(e), c
                            }
                        }
                    }
                }).options = ub({
                    async: !0,
                    ssr: !1
                }, l), d),
                uS = function() {},
                uI = th.forwardRef(function(e, t) {
                    var r, n, i, o, a = th.useRef(null),
                        l = th.useState({
                            onScrollCapture: uS,
                            onWheelCapture: uS,
                            onTouchMoveCapture: uS
                        }),
                        u = l[0],
                        c = l[1],
                        s = e.forwardProps,
                        d = e.children,
                        f = e.className,
                        p = e.removeScrollBar,
                        m = e.enabled,
                        y = e.shards,
                        b = e.sideCar,
                        h = e.noRelative,
                        g = e.noIsolation,
                        v = e.inert,
                        w = e.allowPinchZoom,
                        x = e.as,
                        j = e.gapMode,
                        O = uh(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        S = (r = [a, t], n = function(e) {
                            return r.forEach(function(t) {
                                return uw(t, e)
                            })
                        }, (i = (0, th.useState)(function() {
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
                        })[0]).callback = n, o = i.facade, ux(function() {
                            var e = uj.get(o);
                            if (e) {
                                var t = new Set(e),
                                    n = new Set(r),
                                    i = o.current;
                                t.forEach(function(e) {
                                    n.has(e) || uw(e, null)
                                }), n.forEach(function(e) {
                                    t.has(e) || uw(e, i)
                                })
                            }
                            uj.set(o, r)
                        }, [r]), o),
                        I = ub(ub({}, O), u);
                    return th.createElement(th.Fragment, null, m && th.createElement(b, {
                        sideCar: uO,
                        removeScrollBar: p,
                        shards: y,
                        noRelative: h,
                        noIsolation: g,
                        inert: v,
                        setCallbacks: c,
                        allowPinchZoom: !!w,
                        lockRef: a,
                        gapMode: j
                    }), s ? th.cloneElement(th.Children.only(d), ub(ub({}, I), {
                        ref: S
                    })) : th.createElement(void 0 === x ? "div" : x, ub({}, I, {
                        className: f,
                        ref: S
                    }), d))
                });
            uI.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, uI.classNames = {
                fullWidth: uv,
                zeroRight: ug
            };
            var uM = function(e) {
                var t = e.sideCar,
                    r = uh(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var n = t.read();
                if (!n) throw Error("Sidecar medium not found");
                return th.createElement(n, ub({}, r))
            };
            uM.isSideCarExport = !0;
            var uP = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(n) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = N || r.nc;
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
                uN = function() {
                    var e = uP();
                    return function(t, r) {
                        th.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && r])
                    }
                },
                uT = function() {
                    var e = uN();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                uE = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                uD = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                uA = function(e) {
                    var t = window.getComputedStyle(document.body),
                        r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        n = t["padding" === e ? "paddingTop" : "marginTop"],
                        i = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [uD(r), uD(n), uD(i)]
                },
                uL = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return uE;
                    var t = uA(e),
                        r = document.documentElement.clientWidth,
                        n = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, n - r + t[2] - t[0])
                    }
                },
                uC = uT(),
                uk = "data-scroll-locked",
                uR = function(e, t, r, n) {
                    var i = e.left,
                        o = e.top,
                        a = e.right,
                        l = e.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(l, "px ").concat(n, ";\n  }\n  body[").concat(uk, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(i, "px;\n    padding-top: ").concat(o, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(ug, " {\n    right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(uv, " {\n    margin-right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(ug, " .").concat(ug, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(uv, " .").concat(uv, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(uk, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                uz = function() {
                    var e = parseInt(document.body.getAttribute(uk) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                uU = function() {
                    th.useEffect(function() {
                        return document.body.setAttribute(uk, (uz() + 1).toString()),
                            function() {
                                var e = uz() - 1;
                                e <= 0 ? document.body.removeAttribute(uk) : document.body.setAttribute(uk, e.toString())
                            }
                    }, [])
                },
                u_ = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        n = e.gapMode,
                        i = void 0 === n ? "margin" : n;
                    uU();
                    var o = th.useMemo(function() {
                        return uL(i)
                    }, [i]);
                    return th.createElement(uC, {
                        styles: uR(o, !t, i, r ? "" : "!important")
                    })
                },
                uB = !1;
            if ("u" > typeof window) try {
                var uF = Object.defineProperty({}, "passive", {
                    get: function() {
                        return uB = !0, !0
                    }
                });
                window.addEventListener("test", uF, uF), window.removeEventListener("test", uF, uF)
            } catch (e) {
                uB = !1
            }
            var uY = !!uB && {
                passive: !1
            };

            function uG(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var uV = function(e, t) {
                    if (!uG(e, Element)) return !1;
                    var r = window.getComputedStyle(e);
                    return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
                },
                uW = function(e, t) {
                    var r = t.ownerDocument,
                        n = t;
                    do {
                        if ("u" > typeof ShadowRoot && uG(n, ShadowRoot) && (n = n.host), uQ(e, n)) {
                            var i = uq(e, n);
                            if (i[1] > i[2]) return !0
                        }
                        n = n.parentNode
                    } while (n && n !== r.body);
                    return !1
                },
                uQ = function(e, t) {
                    return "v" === e ? uV(t, "overflowY") : uV(t, "overflowX")
                },
                uq = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                uK = function(e, t, r, n, i) {
                    var o, a = (o = window.getComputedStyle(t).direction, "h" === e && "rtl" === o ? -1 : 1),
                        l = a * n,
                        u = r.target,
                        c = t.contains(u),
                        s = !1,
                        d = l > 0,
                        f = 0,
                        p = 0;
                    do {
                        if (!u) break;
                        var m = uq(e, u),
                            y = m[0],
                            b = m[1] - m[2] - a * y;
                        (y || b) && uQ(e, u) && (f += b, p += y);
                        var h = u.parentNode;
                        u = h && h.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? h.host : h
                    } while (!c && u !== document.body || c && (t.contains(u) || t === u));
                    return d && (i && 1 > Math.abs(f) || !i && l > f) ? s = !0 : !d && (i && 1 > Math.abs(p) || !i && -l > p) && (s = !0), s
                },
                uH = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                uX = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                uZ = function(e) {
                    return e && "current" in e ? e.current : e
                },
                u$ = 0,
                uJ = [],
                u0 = (f = function(e) {
                    var t = th.useRef([]),
                        r = th.useRef([0, 0]),
                        n = th.useRef(),
                        i = th.useState(u$++)[0],
                        o = th.useState(uT)[0],
                        a = th.useRef(e);
                    th.useEffect(function() {
                        a.current = e
                    }, [e]), th.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(i));
                            var t = (function(e, t, r) {
                                if (r || 2 == arguments.length)
                                    for (var n, i = 0, o = t.length; i < o; i++) !n && i in t || (n || (n = Array.prototype.slice.call(t, 0, i)), n[i] = t[i]);
                                return e.concat(n || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(uZ), !0).filter(Boolean);
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
                    var l = th.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !a.current.allowPinchZoom;
                            var i, o = uH(e),
                                l = r.current,
                                u = "deltaX" in e ? e.deltaX : l[0] - o[0],
                                c = "deltaY" in e ? e.deltaY : l[1] - o[1],
                                s = e.target,
                                d = Math.abs(u) > Math.abs(c) ? "h" : "v";
                            if ("touches" in e && "h" === d && "range" === s.type) return !1;
                            var f = uW(d, s);
                            if (!f) return !0;
                            if (f ? i = d : (i = "v" === d ? "h" : "v", f = uW(d, s)), !f) return !1;
                            if (!n.current && "changedTouches" in e && (u || c) && (n.current = i), !i) return !0;
                            var p = n.current || i;
                            return uK(p, t, e, "h" === p ? u : c, !0)
                        }, []),
                        u = th.useCallback(function(e) {
                            if (uJ.length && uJ[uJ.length - 1] === o) {
                                var r = "deltaY" in e ? uX(e) : uH(e),
                                    n = t.current.filter(function(t) {
                                        var n;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                                    })[0];
                                if (n && n.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!n) {
                                    var i = (a.current.shards || []).map(uZ).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (i.length > 0 ? l(e, i[0]) : !a.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        c = th.useCallback(function(e, r, n, i) {
                            var o = {
                                name: e,
                                delta: r,
                                target: n,
                                should: i,
                                shadowParent: function(e) {
                                    for (var t, r, n = null; null !== e;) t = e, (null != (r = ShadowRoot) && "u" > typeof Symbol && r[Symbol.hasInstance] ? !!r[Symbol.hasInstance](t) : t instanceof r) && (n = e.host, e = e.host), e = e.parentNode;
                                    return n
                                }(n)
                            };
                            t.current.push(o), setTimeout(function() {
                                t.current = t.current.filter(function(e) {
                                    return e !== o
                                })
                            }, 1)
                        }, []),
                        s = th.useCallback(function(e) {
                            r.current = uH(e), n.current = void 0
                        }, []),
                        d = th.useCallback(function(t) {
                            c(t.type, uX(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        f = th.useCallback(function(t) {
                            c(t.type, uH(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    th.useEffect(function() {
                        return uJ.push(o), e.setCallbacks({
                                onScrollCapture: d,
                                onWheelCapture: d,
                                onTouchMoveCapture: f
                            }), document.addEventListener("wheel", u, uY), document.addEventListener("touchmove", u, uY), document.addEventListener("touchstart", s, uY),
                            function() {
                                uJ = uJ.filter(function(e) {
                                    return e !== o
                                }), document.removeEventListener("wheel", u, uY), document.removeEventListener("touchmove", u, uY), document.removeEventListener("touchstart", s, uY)
                            }
                    }, []);
                    var p = e.removeScrollBar,
                        m = e.inert;
                    return th.createElement(th.Fragment, null, m ? th.createElement(o, {
                        styles: "\n  .block-interactivity-".concat(i, " {pointer-events: none;}\n  .allow-interactivity-").concat(i, " {pointer-events: all;}\n")
                    }) : null, p ? th.createElement(u_, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, uO.useMedium(f), uM),
                u1 = th.forwardRef(function(e, t) {
                    return th.createElement(uI, ub({}, e, {
                        ref: t,
                        sideCar: u0
                    }))
                });
            u1.classNames = uI.classNames;
            var u2 = new WeakMap,
                u4 = new WeakMap,
                u3 = {},
                u5 = 0,
                u6 = function(e) {
                    return e && (e.host || u6(e.parentNode))
                },
                u8 = function(e, t, r, n) {
                    var i = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var r = u6(e);
                        return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    u3[r] || (u3[r] = new WeakMap);
                    var o = u3[r],
                        a = [],
                        l = new Set,
                        u = new Set(i),
                        c = function(e) {
                            !e || l.has(e) || (l.add(e), c(e.parentNode))
                        };
                    i.forEach(c);
                    var s = function(e) {
                        !e || u.has(e) || Array.prototype.forEach.call(e.children, function(e) {
                            if (l.has(e)) s(e);
                            else try {
                                var t = e.getAttribute(n),
                                    i = null !== t && "false" !== t,
                                    u = (u2.get(e) || 0) + 1,
                                    c = (o.get(e) || 0) + 1;
                                u2.set(e, u), o.set(e, c), a.push(e), 1 === u && i && u4.set(e, !0), 1 === c && e.setAttribute(r, "true"), i || e.setAttribute(n, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return s(t), l.clear(), u5++,
                        function() {
                            a.forEach(function(e) {
                                var t = u2.get(e) - 1,
                                    i = o.get(e) - 1;
                                u2.set(e, t), o.set(e, i), t || (u4.has(e) || e.removeAttribute(n), u4.delete(e)), i || e.removeAttribute(r)
                            }), --u5 || (u2 = new WeakMap, u2 = new WeakMap, u4 = new WeakMap, u3 = {})
                        }
                },
                u9 = function(e, t, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var n = Array.from(Array.isArray(e) ? e : [e]),
                        i = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return i ? (n.push.apply(n, Array.from(i.querySelectorAll("[aria-live], script"))), u8(n, i, r, "aria-hidden")) : function() {
                        return null
                    }
                };

            function u7(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ce(e) {
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

            function ct(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function cr(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }

            function cn(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return u7(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return u7(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ci = "Dialog",
                co = cn(function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        n = function() {
                            var t = r.map(function(e) {
                                return th.createContext(e)
                            });
                            return function(r) {
                                var n = (null == r ? void 0 : r[e]) || t;
                                return th.useMemo(function() {
                                    var t, i;
                                    return lk({}, "__scope".concat(e), (t = lR({}, r), i = null != (i = lk({}, e, n)) ? i : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(i)) : (function(e) {
                                        var t = Object.keys(e);
                                        if (Object.getOwnPropertySymbols) {
                                            var r = Object.getOwnPropertySymbols(e);
                                            t.push.apply(t, r)
                                        }
                                        return t
                                    })(Object(i)).forEach(function(e) {
                                        Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(i, e))
                                    }), t))
                                }, [r, n])
                            }
                        };
                    return n.scopeName = e, [function(t, n) {
                        var i = th.createContext(n),
                            o = r.length;
                        r = lU(r).concat([n]);
                        var a = function(t) {
                            var r, n = t.scope,
                                a = t.children,
                                l = lz(t, ["scope", "children"]),
                                u = (null == n || null == (r = n[e]) ? void 0 : r[o]) || i,
                                c = th.useMemo(function() {
                                    return l
                                }, Object.values(l));
                            return (0, T.jsx)(u.Provider, {
                                value: c,
                                children: a
                            })
                        };
                        return a.displayName = t + "Provider", [a, function(r, a) {
                            var l, u = (null == a || null == (l = a[e]) ? void 0 : l[o]) || i,
                                c = th.useContext(u);
                            if (c) return c;
                            if (void 0 !== n) return n;
                            throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                        }]
                    }, l_.apply(void 0, [n].concat(lU(t)))]
                }(ci), 2),
                ca = co[0];
            co[1];
            var cl = cn(ca(ci), 2),
                cu = cl[0],
                cc = cl[1],
                cs = function(e) {
                    var t, r, n, i, o, a, l, u, c, s, d, f, p, m, y, b, h, g = e.__scopeDialog,
                        v = e.children,
                        w = e.open,
                        x = e.defaultOpen,
                        j = e.onOpenChange,
                        O = e.modal,
                        S = th.useRef(null),
                        I = th.useRef(null),
                        M = cn((c = (u = {
                            prop: w,
                            defaultProp: x,
                            onChange: j
                        }).prop, p = (f = lK((r = (t = {
                            defaultProp: u.defaultProp,
                            onChange: d = void 0 === (s = u.onChange) ? function() {} : s
                        }).defaultProp, n = t.onChange, o = lK(i = th.useState(r), 1)[0], a = th.useRef(o), l = lQ(n), th.useEffect(function() {
                            a.current !== o && (l(o), a.current = o)
                        }, [o, a, l]), i), 2))[0], m = f[1], b = (y = void 0 !== c) ? c : p, h = lQ(d), [b, th.useCallback(function(e) {
                            if (y) {
                                var t = "function" == typeof e ? e(c) : e;
                                t !== c && h(t)
                            } else m(e)
                        }, [y, c, m, h])]), 2),
                        P = M[0],
                        N = M[1];
                    return (0, T.jsx)(cu, {
                        scope: g,
                        triggerRef: S,
                        contentRef: I,
                        contentId: lV(),
                        titleId: lV(),
                        descriptionId: lV(),
                        open: void 0 !== P && P,
                        onOpenChange: N,
                        onOpenToggle: th.useCallback(function() {
                            return N(function(e) {
                                return !e
                            })
                        }, [N]),
                        modal: void 0 === O || O,
                        children: v
                    })
                };
            cs.displayName = ci;
            var cd = "DialogTrigger";
            th.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = cr(e, ["__scopeDialog"]),
                    i = cc(cd, r),
                    o = tL(t, i.triggerRef);
                return (0, T.jsx)(l6.button, ct(ce({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": i.open,
                    "aria-controls": i.contentId,
                    "data-state": cD(i.open)
                }, n), {
                    ref: o,
                    onClick: lL(e.onClick, i.onOpenToggle)
                }))
            }).displayName = cd;
            var cf = "DialogPortal",
                cp = cn(ca(cf, {
                    forceMount: void 0
                }), 2),
                cm = cp[0],
                cy = cp[1],
                cb = function(e) {
                    var t = e.__scopeDialog,
                        r = e.forceMount,
                        n = e.children,
                        i = e.container,
                        o = cc(cf, t);
                    return (0, T.jsx)(cm, {
                        scope: t,
                        forceMount: r,
                        children: th.Children.map(n, function(e) {
                            return (0, T.jsx)(up, {
                                present: r || o.open,
                                children: (0, T.jsx)(us, {
                                    asChild: !0,
                                    container: i,
                                    children: e
                                })
                            })
                        })
                    })
                };
            cb.displayName = cf;
            var ch = "DialogOverlay",
                cg = th.forwardRef(function(e, t) {
                    var r = cy(ch, e.__scopeDialog),
                        n = e.forceMount,
                        i = void 0 === n ? r.forceMount : n,
                        o = cr(e, ["forceMount"]),
                        a = cc(ch, e.__scopeDialog);
                    return a.modal ? (0, T.jsx)(up, {
                        present: i || a.open,
                        children: (0, T.jsx)(cw, ct(ce({}, o), {
                            ref: t
                        }))
                    }) : null
                });
            cg.displayName = ch;
            var cv = l0("DialogOverlay.RemoveScroll"),
                cw = th.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = cr(e, ["__scopeDialog"]),
                        i = cc(ch, r);
                    return (0, T.jsx)(u1, {
                        as: cv,
                        allowPinchZoom: !0,
                        shards: [i.contentRef],
                        children: (0, T.jsx)(l6.div, ct(ce({
                            "data-state": cD(i.open)
                        }, n), {
                            ref: t,
                            style: ce({
                                pointerEvents: "auto"
                            }, n.style)
                        }))
                    })
                }),
                cx = "DialogContent",
                cj = th.forwardRef(function(e, t) {
                    var r = cy(cx, e.__scopeDialog),
                        n = e.forceMount,
                        i = void 0 === n ? r.forceMount : n,
                        o = cr(e, ["forceMount"]),
                        a = cc(cx, e.__scopeDialog);
                    return (0, T.jsx)(up, {
                        present: i || a.open,
                        children: a.modal ? (0, T.jsx)(cO, ct(ce({}, o), {
                            ref: t
                        })) : (0, T.jsx)(cS, ct(ce({}, o), {
                            ref: t
                        }))
                    })
                });
            cj.displayName = cx;
            var cO = th.forwardRef(function(e, t) {
                    var r = cc(cx, e.__scopeDialog),
                        n = th.useRef(null),
                        i = tL(t, r.contentRef, n);
                    return th.useEffect(function() {
                        var e = n.current;
                        if (e) return u9(e)
                    }, []), (0, T.jsx)(cI, ct(ce({}, e), {
                        ref: i,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: lL(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: lL(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                r = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || r) && e.preventDefault()
                        }),
                        onFocusOutside: lL(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                cS = th.forwardRef(function(e, t) {
                    var r = cc(cx, e.__scopeDialog),
                        n = th.useRef(!1),
                        i = th.useRef(!1);
                    return (0, T.jsx)(cI, ct(ce({}, e), {
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
                cI = th.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = e.trapFocus,
                        i = e.onOpenAutoFocus,
                        o = e.onCloseAutoFocus,
                        a = cr(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = cc(cx, r),
                        u = th.useRef(null),
                        c = tL(t, u);
                    return (0, uy.useFocusGuards)(), (0, T.jsxs)(T.Fragment, {
                        children: [(0, T.jsx)(un, {
                            asChild: !0,
                            loop: !0,
                            trapped: n,
                            onMountAutoFocus: i,
                            onUnmountAutoFocus: o,
                            children: (0, T.jsx)(rW.DismissableLayer, ct(ce({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": cD(l.open)
                            }, a), {
                                ref: c,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, T.jsxs)(T.Fragment, {
                            children: [(0, T.jsx)(ck, {
                                titleId: l.titleId
                            }), (0, T.jsx)(cR, {
                                contentRef: u,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                cM = "DialogTitle",
                cP = th.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = cr(e, ["__scopeDialog"]),
                        i = cc(cM, r);
                    return (0, T.jsx)(l6.h2, ct(ce({
                        id: i.titleId
                    }, n), {
                        ref: t
                    }))
                });
            cP.displayName = cM;
            var cN = "DialogDescription";
            th.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = cr(e, ["__scopeDialog"]),
                    i = cc(cN, r);
                return (0, T.jsx)(l6.p, ct(ce({
                    id: i.descriptionId
                }, n), {
                    ref: t
                }))
            }).displayName = cN;
            var cT = "DialogClose",
                cE = th.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = cr(e, ["__scopeDialog"]),
                        i = cc(cT, r);
                    return (0, T.jsx)(l6.button, ct(ce({
                        type: "button"
                    }, n), {
                        ref: t,
                        onClick: lL(e.onClick, function() {
                            return i.onOpenChange(!1)
                        })
                    }))
                });

            function cD(e) {
                return e ? "open" : "closed"
            }
            cE.displayName = cT;
            var cA = "DialogTitleWarning",
                cL = cn((p = {
                    contentName: cx,
                    titleName: cM,
                    docsSlug: "dialog"
                }, m = th.createContext(p), (y = function(e) {
                    var t = e.children,
                        r = lz(e, ["children"]),
                        n = th.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, T.jsx)(m.Provider, {
                        value: n,
                        children: t
                    })
                }).displayName = cA + "Provider", [y, function(e) {
                    var t = th.useContext(m);
                    if (t) return t;
                    if (void 0 !== p) return p;
                    throw Error("`".concat(e, "` must be used within `").concat(cA, "`"))
                }]), 2),
                cC = (cL[0], cL[1]),
                ck = function(e) {
                    var t = e.titleId,
                        r = cC(cA),
                        n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return th.useEffect(function() {
                        t && (document.getElementById(t) || console.error(n))
                    }, [n, t]), null
                },
                cR = function(e) {
                    var t = e.contentRef,
                        r = e.descriptionId,
                        n = cC("DialogDescriptionWarning"),
                        i = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
                    return th.useEffect(function() {
                        var e, n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        r && n && (document.getElementById(r) || console.warn(i))
                    }, [i, t, r]), null
                },
                cz = function(e) {
                    var t = e.type,
                        r = e.sideSheetSide,
                        n = e.isSideSheetFlush,
                        i = e.centerSheetSize,
                        o = e.children,
                        a = e.overlayClassName,
                        l = e.contentClassName,
                        u = e.onOpenAutoFocus,
                        c = e.onCloseAutoFocus,
                        s = e.onPointerDownOutside,
                        d = e.onEscapeKeyDown,
                        f = e.onInteractOutside;
                    return tg().createElement(cb, null, tg().createElement(cg, {
                        "data-testid": "fui-base-sheet-overlay",
                        "data-type": t,
                        "data-side": "sideSheet" === t ? void 0 === r ? "right" : r : void 0,
                        "data-flush": "sideSheet" === t ? void 0 !== n && n : void 0,
                        "data-size": "centerSheet" === t ? void 0 === i ? "Medium" : i : void 0,
                        className: tv("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", a)
                    }, tg().createElement(cj, {
                        "data-testid": "fui-base-sheet-content",
                        className: tv("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", l),
                        onOpenAutoFocus: u,
                        onCloseAutoFocus: c,
                        onPointerDownOutside: s,
                        onEscapeKeyDown: d,
                        onInteractOutside: f
                    }, o)))
                };

            function cU(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var c_ = function(e) {
                    return ("function" != typeof e.checkVisibility || e.checkVisibility()) && !("disabled" in e && e.disabled || "true" === e.getAttribute("aria-disabled"))
                },
                cB = function(e) {
                    cU(e, HTMLInputElement) && "function" == typeof e.select && e.select()
                },
                cF = function(e) {
                    var t = e.currentTarget;
                    if (t) {
                        var r = t.querySelectorAll("[data-autofocus-priority]");
                        if (0 !== r.length) {
                            var n = [];
                            r.forEach(function(e) {
                                var t = parseInt(e.getAttribute("data-autofocus-priority") || "", 10);
                                !Number.isNaN(t) && cU(e, HTMLElement) && n.push({
                                    element: e,
                                    priority: t
                                })
                            }), n.sort(function(e, t) {
                                return e.priority - t.priority
                            });
                            var i = n.find(function(e) {
                                return c_(e.element)
                            });
                            if (i) {
                                e.preventDefault();
                                var o = document.activeElement === i.element;
                                i.element.focus(), o || cB(i.element)
                            }
                        }
                    }
                };

            function cY(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cG(e) {
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

            function cV(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function cW(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }

            function cQ(e) {
                return function(e) {
                    if (Array.isArray(e)) return cY(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return cY(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return cY(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var cq = Symbol("radix.slottable");

            function cK(e) {
                return th.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === cq
            }

            function cH(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function cX(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        cH(e, t, r[t])
                    })
                }
                return e
            }

            function cZ(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }
            var c$ = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r, n, i, o, a, l = (r = i = "Primitive.".concat(t), (n = th.forwardRef(function(e, t) {
                        var r = e.children,
                            n = cW(e, ["children"]);
                        if (th.isValidElement(r)) {
                            var i, o, a, l, u, c = (u = (l = null == (o = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (u = (l = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                                s = function(e, t) {
                                    var r = cG({}, t);
                                    for (var n in t) ! function(n) {
                                        var i = e[n],
                                            o = t[n];
                                        /^on[A-Z]/.test(n) ? i && o ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = o.apply(void 0, cQ(t));
                                            return i.apply(void 0, cQ(t)), n
                                        } : i && (r[n] = i) : "style" === n ? r[n] = cG({}, i, o) : "className" === n && (r[n] = [i, o].filter(Boolean).join(" "))
                                    }(n);
                                    return cG({}, e, r)
                                }(n, r.props);
                            return r.type !== th.Fragment && (s.ref = t ? tA(t, c) : c), th.cloneElement(r, s)
                        }
                        return th.Children.count(r) > 1 ? th.Children.only(null) : null
                    })).displayName = "".concat(r, ".SlotClone"), o = n, (a = th.forwardRef(function(e, t) {
                        var r = e.children,
                            n = cW(e, ["children"]),
                            i = th.Children.toArray(r),
                            a = i.find(cK);
                        if (a) {
                            var l = a.props.children,
                                u = i.map(function(e) {
                                    return e !== a ? e : th.Children.count(l) > 1 ? th.Children.only(null) : th.isValidElement(l) ? l.props.children : null
                                });
                            return (0, T.jsx)(o, cV(cG({}, n), {
                                ref: t,
                                children: th.isValidElement(l) ? th.cloneElement(l, void 0, u) : null
                            }))
                        }
                        return (0, T.jsx)(o, cV(cG({}, n), {
                            ref: t,
                            children: r
                        }))
                    })).displayName = "".concat(i, ".Slot"), a),
                    u = th.forwardRef(function(e, r) {
                        var n = e.asChild,
                            i = function(e, t) {
                                if (null == e) return {};
                                var r, n, i, o = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                    return o
                                }
                                if (o = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, i = {},
                                            o = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                        return i
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }(e, ["asChild"]),
                            o = n ? l : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, T.jsx)(o, cZ(cX({}, i), {
                            ref: r
                        }))
                    });
                return u.displayName = "Primitive.".concat(t), cZ(cX({}, e), cH({}, t, u))
            }, {});

            function cJ(e) {
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
            var c0 = Object.freeze({
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
                c1 = th.forwardRef(function(e, t) {
                    var r, n;
                    return (0, T.jsx)(c$.span, (r = cJ({}, e), n = n = {
                        ref: t,
                        style: cJ({}, c0, e.style)
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r))
                });

            function c2(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            c1.displayName = "VisuallyHidden", r(977);
            var c4 = "u" > typeof window ? th.useLayoutEffect : th.useEffect,
                c3 = "u" < typeof window;

            function c5(e) {
                var t, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = r.defaultValue,
                    i = void 0 !== n && n,
                    o = r.initializeWithValue,
                    a = void 0 === o || o,
                    l = function(e) {
                        return c3 ? i : window.matchMedia(e).matches
                    },
                    u = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = (0, th.useState)(function() {
                        return a ? l(e) : i
                    })) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var i = [],
                                o = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    o || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return i
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return c2(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return c2(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    c = u[0],
                    s = u[1];

                function d() {
                    s(l(e))
                }
                return c4(function() {
                    var t = window.matchMedia(e);
                    return d(), t.addListener ? t.addListener(d) : t.addEventListener("change", d),
                        function() {
                            t.removeListener ? t.removeListener(d) : t.removeEventListener("change", d)
                        }
                }, [e]), c
            }

            function c6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function c8(e) {
                if (Array.isArray(e)) return e
            }

            function c9() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function c7(e) {
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

            function se(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }

            function st(e, t) {
                if (e) {
                    if ("string" == typeof e) return c6(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return c6(e, t)
                }
            }
            var sr = (0, th.createContext)(null),
                sn = function() {
                    var e = (0, th.useContext)(sr);
                    if (!e) throw Error("Sheet components must be used within a Sheet");
                    return e
                },
                si = "padding-x-xlarge",
                so = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.defaultOpen,
                        i = e.children;
                    return tg().createElement(cs, {
                        open: t,
                        onOpenChange: r,
                        defaultOpen: n,
                        modal: !0
                    }, i)
                },
                sa = function(e) {
                    var t, r = e.children,
                        n = e.centerSheetSize,
                        i = void 0 === n ? "Medium" : n,
                        o = e.largeScreenVariant,
                        a = void 0 === o ? "center" : o,
                        l = e.closeLabel,
                        u = e.className,
                        c = e.mobilePortraitClassName,
                        s = e.mobileLandscapeClassName,
                        d = e.largeScreenClassName,
                        f = e.onOpenAutoFocus,
                        p = e.onCloseAutoFocus,
                        m = e.onPointerDownOutside,
                        y = e.onEscapeKeyDown,
                        b = e.onInteractOutside,
                        h = c5("(orientation: portrait) and (max-width: 600px)"),
                        g = c5("(orientation: landscape) and (max-height: 600px)");
                    t = h ? "bottomSheet" : g || "side" === a ? "sideSheet" : "centerSheet";
                    var v = (0, th.useMemo)(function() {
                            return {
                                centerSheetSize: i,
                                largeScreenVariant: a,
                                closeLabel: l,
                                isPortraitMobile: h,
                                isLandscapeMobile: g,
                                type: t
                            }
                        }, [i, a, l, h, g, t]),
                        w = tv(u, h && c, g && s, !h && !g && d);
                    return tg().createElement(sr.Provider, {
                        value: v
                    }, tg().createElement(cz, {
                        type: t,
                        sideSheetSide: "right",
                        isSideSheetFlush: g,
                        centerSheetSize: i,
                        contentClassName: w,
                        onOpenAutoFocus: null != f ? f : cF,
                        onCloseAutoFocus: p,
                        onPointerDownOutside: m,
                        onEscapeKeyDown: y,
                        onInteractOutside: b
                    }, r))
                },
                sl = (0, th.forwardRef)(function(e, t) {
                    var r, n = c8(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || st(r) || c9(),
                        i = n[0],
                        o = n.slice(1),
                        a = i.children,
                        l = i.className,
                        u = i.hasPaddingX,
                        c = se(i, ["children", "className", "hasPaddingX"]),
                        s = (c8(o) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(o) || st(o, 1) || c9())[0],
                        d = sn().type;
                    return tg().createElement("div", c7({
                        ref: s,
                        className: tv("scroll-y", (void 0 === u || u) && si, "sideSheet" === d ? "grow-1" : "", l)
                    }, c), a)
                });
            sl.displayName = "SheetBody";
            var su = function(e) {
                    var t = e.className,
                        r = e.children,
                        n = e.navigation,
                        i = e.utilities,
                        o = e.visuallyHideTitleText,
                        a = sn().closeLabel,
                        l = tg().createElement(cP, {
                            className: "text-heading-small margin-none"
                        }, r);
                    return tg().createElement("div", {
                        className: tv(t, n ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
                    }, tg().createElement("div", {
                        className: tv("flex items-center", n && "gap-xsmall")
                    }, n, o ? tg().createElement(c1, null, l) : l), tg().createElement("div", {
                        className: tv("flex items-center", i && "gap-xxsmall")
                    }, i, tg().createElement("div", {
                        className: "fui-sheet-close-affordance-container"
                    }, tg().createElement(cE, {
                        asChild: !0
                    }, tg().createElement(lM, {
                        variant: "Utility",
                        size: "Medium",
                        icon: "icon-regular-x",
                        ariaLabel: a || "",
                        "data-autofocus-priority": "1000"
                    })))))
                },
                sc = function(e) {
                    var t = e.children,
                        r = e.className,
                        n = se(e, ["children", "className"]);
                    return tg().createElement(tg().Fragment, null, tg().createElement(lA, null), tg().createElement("div", c7({
                        className: tv(si, "margin-y-small shrink-0", r)
                    }, n), t))
                },
                ss = function(e) {
                    var t = e.iconName,
                        r = e.label;
                    return (0, T.jsxs)("div", {
                        className: "gap-x-medium align-items-center flex flex-row",
                        children: [(0, T.jsx)(tI, {
                            name: t,
                            size: "Large"
                        }), (0, T.jsx)("span", {
                            className: "[font-size:var(--font-size-350)]",
                            children: r
                        })]
                    })
                },
                sd = function(e) {
                    var t = e.featureConfig,
                        r = e.currencySubscriptionBenefit,
                        n = (0, E.useTranslation)(),
                        i = n.translate,
                        o = n.intl,
                        a = (0, th.useMemo)(function() {
                            var e;
                            return null == (e = t.virtualTransactionDiscounts) ? void 0 : e.find(function(e) {
                                return 0 === e.periodIndex
                            })
                        }, [t]),
                        l = (0, th.useMemo)(function() {
                            var e;
                            return null == (e = t.virtualTransactionDiscounts) ? void 0 : e.filter(function(e) {
                                return e.periodIndex > 0
                            }).reduce(function(e, t) {
                                return null === e || t.periodIndex < e.periodIndex ? t : e
                            }, null)
                        }, [t]);
                    return (0, T.jsxs)("div", {
                        className: "gap-y-xlarge flex flex-col",
                        children: [a && (l ? (0, T.jsx)(ss, {
                            iconName: "icon-regular-tag",
                            label: i("Description.Benefit.DiscountV2")
                        }) : (0, T.jsx)(ss, {
                            iconName: "icon-regular-tag",
                            label: i("Description.Benefit.DiscountBase", {
                                discountPercent: o.n(.01 * a.discountPercent, {
                                    style: "percent"
                                })
                            })
                        })), (0, T.jsx)(ss, {
                            iconName: "icon-regular-paint-brush",
                            label: i("Description.Benefit.Customize")
                        }), (0, T.jsx)(ss, {
                            iconName: "icon-regular-controller",
                            label: i("Label.BlackbirdPSDiscount")
                        }), r && r.entitledAmountMicrosPerGrantingPeriod > 0 && (0, T.jsx)(ss, {
                            iconName: "icon-regular-robux",
                            label: i("Description.Benefit.RobuxStipend", {
                                amount: o.n(Math.round(r.entitledAmountMicrosPerGrantingPeriod / 1e6)),
                                periodType: r.grantingPeriodType
                            })
                        }), t.isRobuxTransferEnabled && (0, T.jsx)(ss, {
                            iconName: "icon-regular-robux",
                            label: i("Description.Benefit.RobuxTransfers")
                        }), t.isTradingEnabled && (0, T.jsx)(ss, {
                            iconName: "icon-regular-hand-two-arrows-horizontal",
                            label: i("Description.Benefit.TradeResellItems")
                        }), t.isUgcPublishingEnabled && (0, T.jsx)(ss, {
                            iconName: "icon-regular-arrow-up-from-landscape-rectangle",
                            label: i("Description.Benefit.PublishItems")
                        })]
                    })
                },
                sf = window.Roblox,
                sp = sf.EnvironmentUrls.apiGatewayUrl,
                sm = new tu(new eK({
                    robloxSiteDomain: sf.EnvironmentUrls.domain,
                    basePath: "".concat(sp, "/subscriptions"),
                    credentials: "include"
                }));

            function sy(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }
            var sb = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        t = e.referrerId,
                        r = e.enabled,
                        n = Number.parseInt(null != t ? t : "", 10),
                        i = Number.isFinite(n) && n > 0,
                        o = (void 0 === r || r) && i,
                        a = (0, C.useQuery)({
                            queryKey: ["plus-referrals", "create", n],
                            enabled: o,
                            staleTime: 1 / 0,
                            queryFn: function() {
                                var e;
                                return (e = function() {
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
                                            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                            l = Object.defineProperty;
                                        return l(a, "next", {
                                            value: u(0)
                                        }), l(a, "throw", {
                                            value: u(1)
                                        }), l(a, "return", {
                                            value: u(2)
                                        }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                                            value: function() {
                                                return this
                                            }
                                        }), a;

                                        function u(l) {
                                            return function(u) {
                                                var c = [l, u];
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
                                    }(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                if (!i) return [2, void 0];
                                                return [4, sm.subscriptionsV2CreateSubscriptionReferral({
                                                    referrerId: n
                                                })];
                                            case 1:
                                                return [2, e.sent().referralId]
                                        }
                                    })
                                }, function() {
                                    var t = this,
                                        r = arguments;
                                    return new Promise(function(n, i) {
                                        var o = e.apply(t, r);

                                        function a(e) {
                                            sy(o, n, i, a, l, "next", e)
                                        }

                                        function l(e) {
                                            sy(o, n, i, a, l, "throw", e)
                                        }
                                        a(void 0)
                                    })
                                })()
                            }
                        }),
                        l = a.data,
                        u = a.isLoading;
                    return {
                        referralId: l,
                        isLoading: o && u
                    }
                },
                sh = function(e, t) {
                    var r = (0, E.useTranslation)().intl;
                    return (0, th.useMemo)(function() {
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
                sg = function(e) {
                    var t, r, n;
                    return Math.floor((null != (t = null == (n = e.productTypeDetails.robloxSubscriptionProductDetails) || null == (r = n.featureConfig.currencySubscriptionConfig) ? void 0 : r.entitledAmountMicros) ? t : 0) / 1e6)
                };

            function sv(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }
            var sw = function() {
                var e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    r = t.enabled,
                    n = void 0 === r || r,
                    i = (0, C.useQuery)({
                        queryKey: ["plus-referrals", "subscribe-product"],
                        enabled: n,
                        staleTime: 1 / 0,
                        queryFn: function() {
                            var e;
                            return (e = function() {
                                var e;
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
                                        a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                        l = Object.defineProperty;
                                    return l(a, "next", {
                                        value: u(0)
                                    }), l(a, "throw", {
                                        value: u(1)
                                    }), l(a, "return", {
                                        value: u(2)
                                    }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                                        value: function() {
                                            return this
                                        }
                                    }), a;

                                    function u(l) {
                                        return function(u) {
                                            var c = [l, u];
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
                                }(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            return [4, sm.subscriptionsV2ListAvailableSubscriptionProducts({
                                                productType: tt,
                                                includePurchased: !0,
                                                includeBundles: !0,
                                                skipEligibilityCheck: !0
                                            })];
                                        case 1:
                                            return [2, null != (e = t.sent().products.toSorted(function(e, t) {
                                                return sg(e) - sg(t)
                                            }).at(0)) ? e : null]
                                    }
                                })
                            }, function() {
                                var t = this,
                                    r = arguments;
                                return new Promise(function(n, i) {
                                    var o = e.apply(t, r);

                                    function a(e) {
                                        sv(o, n, i, a, l, "next", e)
                                    }

                                    function l(e) {
                                        sv(o, n, i, a, l, "throw", e)
                                    }
                                    a(void 0)
                                })
                            })()
                        }
                    }),
                    o = i.data,
                    a = i.isLoading;
                return {
                    subscribeButtonProps: (0, th.useMemo)(function() {
                        var e = (0, td.getDeviceMeta)();
                        if (null != o && null !== e) return {
                            productId: o.productKey.id,
                            productType: o.productKey.type,
                            deviceMeta: e
                        }
                    }, [o]),
                    subscribePrice: null == o ? void 0 : o.localizedPrice,
                    subscribePeriodType: null == o ? void 0 : o.periodType,
                    subscribeFeatureConfig: null == o || null == (e = o.productTypeDetails.robloxSubscriptionProductDetails) ? void 0 : e.featureConfig,
                    subscribeEligibleOffers: null == o ? void 0 : o.eligibleOffers,
                    isLoading: n && a
                }
            };

            function sx(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }
            var sj = new Map([
                    ["Invalid", "Invalid"],
                    ["Eligible", "Eligible"],
                    ["Ineligible", "Ineligible"],
                    [0, "Invalid"],
                    [1, "Eligible"],
                    [2, "Ineligible"]
                ]),
                sO = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        t = e.referrerId,
                        r = e.enabled,
                        n = Number.parseInt(null != t ? t : "", 10),
                        i = Number.isFinite(n) && n > 0,
                        o = (void 0 === r || r) && i,
                        a = (0, C.useQuery)({
                            queryKey: ["plus-referrals", "eligibility", n],
                            enabled: o,
                            queryFn: function() {
                                var e;
                                return (e = function() {
                                    var e;
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
                                            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                            l = Object.defineProperty;
                                        return l(a, "next", {
                                            value: u(0)
                                        }), l(a, "throw", {
                                            value: u(1)
                                        }), l(a, "return", {
                                            value: u(2)
                                        }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                                            value: function() {
                                                return this
                                            }
                                        }), a;

                                        function u(l) {
                                            return function(u) {
                                                var c = [l, u];
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
                                    }(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                if (!i) return [2, void 0];
                                                return [4, sm.subscriptionsV2CheckSubscriptionReferralEligibility({
                                                    referrerId: n
                                                })];
                                            case 1:
                                                return e = t.sent().eligibility, [2, sj.get(e)]
                                        }
                                    })
                                }, function() {
                                    var t = this,
                                        r = arguments;
                                    return new Promise(function(n, i) {
                                        var o = e.apply(t, r);

                                        function a(e) {
                                            sx(o, n, i, a, l, "next", e)
                                        }

                                        function l(e) {
                                            sx(o, n, i, a, l, "throw", e)
                                        }
                                        a(void 0)
                                    })
                                })()
                            }
                        }),
                        l = a.data,
                        u = a.isLoading;
                    return {
                        eligibility: l,
                        isLoading: o && u
                    }
                },
                sS = window.Roblox["core-scripts"].dataStore,
                sI = r.n(sS),
                sM = function(e) {
                    var t = Number.parseInt(null != e ? e : "", 10),
                        r = Number.isFinite(t) && t > 0,
                        n = (0, C.useQuery)({
                            queryKey: ["plus-referrals", "referrer", t],
                            enabled: r,
                            retry: !1,
                            queryFn: function() {
                                return sI().userDataStore.getUser(t)
                            }
                        }),
                        i = n.data,
                        o = n.isLoading;
                    return {
                        handle: i ? "@".concat(i.name) : void 0,
                        isLoading: r && o
                    }
                };

            function sP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var sN = function(e) {
                var t, r = e.productType,
                    n = e.productId,
                    i = e.deviceMeta,
                    o = e.variant,
                    a = e.size,
                    l = e.className,
                    u = e.isDisabled,
                    c = void 0 !== u && u,
                    s = e.redirectUrl,
                    d = e.referrerId,
                    f = e.paymentSessionId,
                    p = e.onSubscribeClick,
                    m = e.onMobilePurchaseInitiated,
                    y = e.isLoading,
                    b = e.children,
                    h = e.trackSubscriptionButtonClick,
                    g = e.loadingStateDisabled,
                    v = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = (0, th.useState)(!1)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var i = [],
                                o = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    o || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return i
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return sP(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sP(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    w = v[0],
                    x = v[1],
                    j = i.isAndroidApp || i.isIosApp,
                    O = r === tt ? "RobloxPlus" : r,
                    S = (0, th.useMemo)(function() {
                        var e = new URL(j ? "/mobile-app-upgrades/buy" : "/upgrades/paymentmethods", window.location.origin);
                        return e.searchParams.append("ctx", "subscription"), e.searchParams.append("type", O), e.searchParams.append("id", n), f && e.searchParams.append("paymentSessionId", f), d && e.searchParams.append("referrerId", d), !j && s && e.searchParams.append("redirectUrl", s), e.toString()
                    }, [j, O, n, f, d, s]),
                    I = (0, th.useCallback)(function() {
                        if (!c) {
                            if (null == h || h(), s && function(e) {
                                    try {
                                        var t = JSON.stringify({
                                            url: e,
                                            ts: Date.now()
                                        });
                                        sessionStorage.setItem(tb, t)
                                    } catch (e) {}
                                }(s), null == p || p(), j) {
                                null == m || m();
                                return
                            }
                            x(!0)
                        }
                    }, [c, h, s, p, j, m]);
                return (0, T.jsx)(t4, {
                    as: "a",
                    className: l,
                    href: S,
                    isDisabled: c,
                    isLoading: void 0 !== g && g ? void 0 : null != y ? y : w,
                    size: a,
                    variant: void 0 === o ? "Emphasis" : o,
                    onClick: I,
                    children: b
                })
            };

            function sT(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sE(e) {
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

            function sD(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }
            var sA = ["Feature.RobloxSubscription"],
                sL = "margin-x-auto width-full max-width-[200px] medium:max-width-[320px]",
                sC = "margin-bottom-[-8px]",
                sk = {
                    currencyCode: "USD",
                    units: 0,
                    nanos: 0
                },
                sR = {
                    invalid: {
                        key: "Description.ReferralInvalid",
                        fallback: "This referral link is no longer valid. You can still join Roblox Plus without the referral reward."
                    },
                    ineligible: {
                        key: "Description.ReferralIneligible",
                        fallback: "This referral reward is not available on your account. You can still join Roblox Plus."
                    }
                },
                sz = function(e, t) {
                    var r = new URLSearchParams({
                        ctx: "plus_referral",
                        referralCode: e
                    });
                    return t && r.set("referrerId", t), "/plus?".concat(r.toString())
                },
                sU = function(e) {
                    var t = e.face,
                        r = e.open,
                        n = e.onOpenChange,
                        i = e.referralCode,
                        o = e.referrerUserId,
                        a = e.surface,
                        l = e.subscribeButtonProps,
                        u = e.subscribePrice,
                        c = e.subscribePeriodType,
                        s = e.featureConfig,
                        d = (0, E.useTranslation)(),
                        f = d.translate,
                        p = d.intl,
                        m = "pitch" === t,
                        y = p.n(100),
                        b = sh(null != u ? u : sk),
                        h = sM(m ? o : void 0),
                        g = h.handle,
                        v = h.isLoading,
                        w = f("Heading.ReferralRecipientJoin", void 0, "Join Plus, get"),
                        x = f("Action.ReferralJoinPlus", void 0, "Join Roblox Plus"),
                        j = f("Action.Subscribe", void 0, "Subscribe"),
                        O = (0, th.useMemo)(function() {
                            var e, t, r = void 0 !== i ? sz(i, o) : void 0;
                            return sD(sE({}, l), {
                                redirectUrl: null != (e = l.redirectUrl) ? e : r,
                                referrerId: null != (t = l.referrerId) ? t : o
                            })
                        }, [i, o, l]),
                        S = [{
                            opening: "linkStart",
                            closing: "linkEnd",
                            render: function(e) {
                                return (0, T.jsx)("a", {
                                    className: "content-link underline",
                                    href: tm,
                                    rel: "noopener noreferrer",
                                    target: "_blank",
                                    children: e
                                })
                            }
                        }],
                        I = (0, th.useRef)(!1);
                    (0, th.useEffect)(function() {
                        r && (I.current = !1)
                    }, [r]);
                    var M = (0, th.useCallback)(function() {
                            I.current = !0, lr(t, o, i, a), a8("ReferralSubscribeClick", sE({
                                face: t
                            }, a ? {
                                surface: a
                            } : {}))
                        }, [t, o, i, a]),
                        P = (0, th.useCallback)(function(e) {
                            e || I.current || (ln(t, o, i, a), a8("ReferralDismissed", sE({
                                face: t
                            }, a ? {
                                surface: a
                            } : {}))), n(e)
                        }, [t, n, o, i, a]);
                    return (0, T.jsx)(so, {
                        open: r,
                        onOpenChange: P,
                        children: (0, T.jsxs)(sa, {
                            centerSheetSize: "Medium",
                            className: m ? "[&>[role=separator]]:[display:none]" : void 0,
                            closeLabel: f("Action.Close"),
                            largeScreenVariant: "center",
                            children: [(0, T.jsx)(su, {
                                visuallyHideTitleText: !0,
                                children: m ? "".concat(w, " ").concat(y) : x
                            }), "pitch" === t ? (0, T.jsxs)(sl, {
                                className: "gap-y-medium padding-top-small padding-bottom-small medium:padding-top-medium medium:padding-bottom-medium flex flex-col",
                                children: [(0, T.jsx)("img", {
                                    alt: "",
                                    className: "".concat(sL, " ").concat(sC, " dark:hidden"),
                                    src: "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMjAiIGhlaWdodD0iMTgwIiBmaWxsPSJub25lIiB2aWV3Qm94PSIwIDAgMzIwIDE4MCI+PHBhdGggZmlsbD0iIzFiMjU0YiIgZmlsbC1vcGFjaXR5PSIuMTYiIGQ9Ik0yNTYuNDg2IDM2LjkwNWE0IDQgMCAwIDEgMi42MzEgNC44NGwtMjMuODExIDg4Ljg2Ni0uMDU5LjE5OGE0IDQgMCAwIDEtNC42NCAyLjY3OWwtLjItLjA0OS02NS4xMzMtMTcuNDUyLS40NDgtMS42NzMgNjUuOTY5IDE3LjY3NmEyLjUgMi41IDAgMCAwIDMuMDYyLTEuNzY3bDIzLjgxMS04OC44NjZhMi41IDIuNSAwIDAgMC0xLjc2OC0zLjA2MmwtODguODY1LTIzLjgxYTIuNSAyLjUgMCAwIDAtMy4wNjIgMS43NjdMMTUxLjI2MiA2My42OWwtLjc3Ni0yLjg5OCAxMi4wMzgtNDQuOTI4YTQgNCAwIDAgMSA0Ljg5OS0yLjgyOWw4OC44NjUgMjMuODEyeiIvPjxwYXRoIGZpbGw9IiMyMDIyMjciIGQ9Ik0yMDIuMjMzIDQyLjc4YTkuODYgOS44NiAwIDAgMSA5LjMyMiAyLjQ5OGwxNi4wNzQgMTUuNzM5YzIuNDQ4IDIuMzk3IDMuNDIxIDUuODc2IDIuNTUgOS4xMjVsLTUuNzE2IDIxLjMzMi0uMDg2LjMwMmMtLjk0NiAzLjEwMy0zLjQ2OSA1LjUtNi42ODUgNi4zMjVsLTIxLjc5IDUuNTkzLS4zMTIuMDc1YTkuODYgOS44NiAwIDAgMS05LjAwOS0yLjU3M2wtMTYuMDc0LTE1LjczOGMtMi4zNzItMi4zMjMtMy4zNTktNS42Ni0yLjYyNy04LjgybC4wNzctLjMwNUwxNzMuNjcyIDU1Yy44NDQtMy4xNDggMy4yOTMtNS42MTggNi40NjMtNi41NDNsLjMwOS0uMDg0em02LjE3MyA1LjcxNGE1LjM2IDUuMzYgMCAwIDAtNS4wNTQtMS4zNTRsLTIxLjc4OSA1LjU5MmMtMS43ODIuNDU3LTMuMTAzIDEuNzktMy41NDQgMy40MzRsLTUuNzE2IDIxLjMzMWMtLjQ0IDEuNjQ0LjAzNyAzLjQ2IDEuMzUyIDQuNzQ2bDE2LjA3NCAxNS43MzhhNS4zNiA1LjM2IDAgMCAwIDUuMDU0IDEuMzU0bDIxLjc5LTUuNTkyYzEuNzgyLS40NTcgMy4xMDMtMS43OSAzLjU0NC0zLjQzNGw1LjcxNS0yMS4zMzJjLjQ0MS0xLjY0NC0uMDM3LTMuNDU4LTEuMzUyLTQuNzQ2em0tNi4yNzcgNS4yODhhNC4xNiA0LjE2IDAgMCAxIDQuMDE1IDEuMDc2bDExLjMwNCAxMS4zMDNhNC4xNiA0LjE2IDAgMCAxIDEuMDc1IDQuMDE0bC00LjEzNyAxNS40NDFhNC4xNiA0LjE2IDAgMCAxLTIuOTM5IDIuOTRsLTE1LjQ0MSA0LjEzNmE0LjE2IDQuMTYgMCAwIDEtNC4wMTQtMS4wNzZsLTExLjMwNC0xMS4zMDNhNC4xNiA0LjE2IDAgMCAxLTEuMDc1LTQuMDE0bDQuMTM3LTE1LjQ0MWE0LjE2IDQuMTYgMCAwIDEgMi45MzktMi45NHptLTcuMjUyIDkuMDE1YTIuMjUgMi4yNSAwIDAgMC0yLjc1NSAxLjU5MWwtMy40OTUgMTMuMDRhMi4yNSAyLjI1IDAgMCAwIDEuNTkxIDIuNzU2bDEzLjA0IDMuNDk0YTIuMjUgMi4yNSAwIDAgMCAyLjc1Ni0xLjU5MWwzLjQ5NC0xMy4wNGEyLjI1IDIuMjUgMCAwIDAtMS41OTEtMi43NTZ6Ii8+PHBhdGggZmlsbD0iIzFiMjU0YiIgZmlsbC1vcGFjaXR5PSIuMTYiIGQ9Im0xNjYuOTg1IDEzNy44MDMuMzg4IDEuNDQ5LTg4Ljg2NSAyMy44MTEtLjM4OC0xLjQ0OXptMS43NjgtMy4wNjItMjMuODExLTg4Ljg2NWEyLjUgMi41IDAgMCAwLTMuMDYyLTEuNzY4TDUzLjAxNSA2Ny45MmEyLjUgMi41IDAgMCAwLTEuNzY4IDMuMDYxbDIzLjgxMSA4OC44NjZhMi41IDIuNSAwIDAgMCAzLjA2MiAxLjc2N2wuMzg4IDEuNDQ5LS4yLjA0OWE0IDQgMCAwIDEtNC42NC0yLjY3OWwtLjA1OS0uMTk4TDQ5Ljc5OCA3MS4zN2E0IDQgMCAwIDEgMi44MjgtNC45bDg4Ljg2Ni0yMy44MS4yLS4wNWE0IDQgMCAwIDEgNC42OTkgMi44NzhsMjMuODExIDg4Ljg2NS4wNDkuMmE0IDQgMCAwIDEtMi42OCA0LjY0MWwtLjE5OC4wNTgtLjM4OC0xLjQ0OWEyLjUgMi41IDAgMCAwIDEuNzY4LTMuMDYyIi8+PHBhdGggZmlsbD0iIzIwMjIyNyIgZD0iTTk3LjUxMyA3NC45MDJhOS44NiA5Ljg2IDAgMCAxIDkuMzIxLTIuNDk4bDIxLjc5IDUuNTkzYzMuMzE5Ljg1MiA1LjkwMSAzLjM3OCA2Ljc3MSA2LjYyOGw1LjcxNiAyMS4zMzEuMDc3LjMwNWMuNzMyIDMuMTYxLS4yNTUgNi40OTgtMi42MjcgOC44MmwtMTYuMDc0IDE1LjczOS0uMjMzLjIyMWE5Ljg2IDkuODYgMCAwIDEtOS4wODkgMi4yNzdsLTcuMzg5LTEuODk3YTMgMyAwIDAgMS0yLjE1Mi0yLjEzbC03LjUwNy0yOC4wMTYtMS4wMDMtMy43NGE0IDQgMCAwIDEgMi44MjgtNC45bDE3LjM4Ny00LjY2YTQgNCAwIDAgMSA0Ljg5OCAyLjgyOGw0LjA3NyAxNS4yMTNhNCA0IDAgMCAxLTIuODI5IDQuODk5bC04LjY5MyAyLjMzYTEuNzUgMS43NSAwIDAgMS0uOTA2LTMuMzgxbDguNjk0LTIuMzNhLjUuNSAwIDAgMCAuMzUzLS42MTJsLTQuMDc2LTE1LjIxM2EuNS41IDAgMCAwLS42MTMtLjM1NGwtMTcuMzg2IDQuNjZhLjUuNSAwIDAgMC0uMzUzLjYxM2w4LjQzNCAzMS40NzYgNy4xMDYgMS44MjRhNi4zNiA2LjM2IDAgMCAwIDYuMDA0LTEuNjA4bDE2LjA3My0xNS43MzljMS41NjctMS41MzQgMi4xNTQtMy43MTggMS42MTgtNS43MTlsLTUuNzE1LTIxLjMzMWMtLjUzNy0yLjAwMS0yLjEzNy0zLjYtNC4yNjEtNC4xNDRsLTIxLjc5LTUuNTkzYTYuMzYgNi4zNiAwIDAgMC02LjAwMyAxLjYwOEw4My44ODcgOTMuMTQxYy0xLjU2NiAxLjUzNC0yLjE1NCAzLjcxOC0xLjYxOCA1LjcxOWw1LjcxNiAyMS4zMzFjLjUzNiAyLjAwMSAyLjEzNyAzLjU5OSA0LjI2IDQuMTQ0bDMuMTMxLjgwM2ExLjc1IDEuNzUgMCAwIDEtLjg3IDMuMzlsLTMuMTMtLjgwM2MtMy4yMTYtLjgyNi01Ljc0LTMuMjIyLTYuNjg2LTYuMzI1bC0uMDg2LS4zMDMtNS43MTUtMjEuMzMxYy0uODQ0LTMuMTQ4LjA0Mi02LjUxMiAyLjMyNS04Ljg5OGwuMjI1LS4yMjh6Ii8+PC9zdmc+"
                                }), (0, T.jsx)("img", {
                                    alt: "",
                                    className: "".concat(sL, " ").concat(sC, " hidden dark:block"),
                                    src: "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMjAiIGhlaWdodD0iMTgwIiBmaWxsPSJub25lIiB2aWV3Qm94PSIwIDAgMzIwIDE4MCI+PHBhdGggZmlsbD0iI2QwZDlmYiIgZmlsbC1vcGFjaXR5PSIuMTYiIGQ9Ik0yNTYuNDg2IDM2LjkwNWE0IDQgMCAwIDEgMi42MzEgNC44NGwtMjMuODExIDg4Ljg2Ni0uMDU5LjE5OGE0IDQgMCAwIDEtNC42NCAyLjY3OWwtLjItLjA0OS02NS4xMzMtMTcuNDUyLS40NDgtMS42NzMgNjUuOTY5IDE3LjY3NmEyLjUgMi41IDAgMCAwIDMuMDYyLTEuNzY3bDIzLjgxMS04OC44NjZhMi41IDIuNSAwIDAgMC0xLjc2OC0zLjA2MmwtODguODY1LTIzLjgxYTIuNSAyLjUgMCAwIDAtMy4wNjIgMS43NjdMMTUxLjI2MiA2My42OWwtLjc3Ni0yLjg5OCAxMi4wMzgtNDQuOTI4YTQgNCAwIDAgMSA0Ljg5OS0yLjgyOWw4OC44NjUgMjMuODEyeiIvPjxwYXRoIGZpbGw9IiNmN2Y3ZjgiIGQ9Ik0yMDIuMjMzIDQyLjc4YTkuODYgOS44NiAwIDAgMSA5LjMyMiAyLjQ5OGwxNi4wNzQgMTUuNzM5YzIuNDQ4IDIuMzk3IDMuNDIxIDUuODc2IDIuNTUgOS4xMjVsLTUuNzE2IDIxLjMzMi0uMDg2LjMwMmMtLjk0NiAzLjEwMy0zLjQ2OSA1LjUtNi42ODUgNi4zMjVsLTIxLjc5IDUuNTkzLS4zMTIuMDc1YTkuODYgOS44NiAwIDAgMS05LjAwOS0yLjU3M2wtMTYuMDc0LTE1LjczOGMtMi4zNzItMi4zMjMtMy4zNTktNS42Ni0yLjYyNy04LjgybC4wNzctLjMwNUwxNzMuNjcyIDU1Yy44NDQtMy4xNDggMy4yOTMtNS42MTggNi40NjMtNi41NDNsLjMwOS0uMDg0em02LjUyMyA1LjM1NmE1Ljg2IDUuODYgMCAwIDAtNS41MjgtMS40ODJsLTIxLjc5IDUuNTkzYy0xLjk1My41MDItMy40MTQgMS45NjctMy45MDIgMy43OWwtNS43MTYgMjEuMzNjLS40ODggMS44MjMuMDQ0IDMuODIzIDEuNDg1IDUuMjMzbDE2LjA3NSAxNS43NGE1Ljg2IDUuODYgMCAwIDAgNS41MjcgMS40OGwyMS43OTEtNS41OTJjMS45NTMtLjUwMiAzLjQxMy0xLjk2NyAzLjkwMi0zLjc5bDUuNzE1LTIxLjMzMWMuNDg5LTEuODIzLS4wNDMtMy44MjItMS40ODQtNS4yMzN6bS02LjYyNyA1LjY0NmE0LjE2IDQuMTYgMCAwIDEgNC4wMTUgMS4wNzZsMTEuMzA0IDExLjMwM2E0LjE2IDQuMTYgMCAwIDEgMS4wNzUgNC4wMTRsLTQuMTM3IDE1LjQ0MWE0LjE2IDQuMTYgMCAwIDEtMi45MzkgMi45NGwtMTUuNDQxIDQuMTM2YTQuMTYgNC4xNiAwIDAgMS00LjAxNC0xLjA3NmwtMTEuMzA0LTExLjMwM2E0LjE2IDQuMTYgMCAwIDEtMS4wNzUtNC4wMTRsNC4xMzctMTUuNDQxYTQuMTYgNC4xNiAwIDAgMSAyLjkzOS0yLjk0em0tNy4yNTIgOS4wMTVhMi4yNSAyLjI1IDAgMCAwLTIuNzU1IDEuNTkxbC0zLjQ5NSAxMy4wNGEyLjI1IDIuMjUgMCAwIDAgMS41OTEgMi43NTZsMTMuMDQgMy40OTRhMi4yNSAyLjI1IDAgMCAwIDIuNzU2LTEuNTkxbDMuNDk0LTEzLjA0YTIuMjUgMi4yNSAwIDAgMC0xLjU5MS0yLjc1NnoiLz48cGF0aCBmaWxsPSIjZDBkOWZiIiBmaWxsLW9wYWNpdHk9Ii4xNiIgZD0ibTE2Ni45ODUgMTM3LjgwMy4zODggMS40NDktODguODY1IDIzLjgxMS0uMzg4LTEuNDQ5em0xLjc2OC0zLjA2Mi0yMy44MTEtODguODY1YTIuNSAyLjUgMCAwIDAtMy4wNjItMS43NjhMNTMuMDE1IDY3LjkyYTIuNSAyLjUgMCAwIDAtMS43NjggMy4wNjFsMjMuODExIDg4Ljg2NmEyLjUgMi41IDAgMCAwIDMuMDYyIDEuNzY3bC4zODggMS40NDktLjIuMDQ5YTQgNCAwIDAgMS00LjY0LTIuNjc5bC0uMDU5LS4xOThMNDkuNzk4IDcxLjM3YTQgNCAwIDAgMSAyLjgyOC00LjlsODguODY2LTIzLjgxLjItLjA1YTQgNCAwIDAgMSA0LjY5OSAyLjg3OGwyMy44MTEgODguODY1LjA0OS4yYTQgNCAwIDAgMS0yLjY4IDQuNjQxbC0uMTk4LjA1OC0uMzg4LTEuNDQ5YTIuNSAyLjUgMCAwIDAgMS43NjgtMy4wNjIiLz48cGF0aCBmaWxsPSIjZjdmN2Y4IiBkPSJNOTcuNDA1IDc0LjQ5OEE5Ljg2IDkuODYgMCAwIDEgMTA2LjcyNiA3MmwyMS43OSA1LjU5M2MzLjMxOS44NTIgNS45MDEgMy4zNzggNi43NzEgNi42MjhsNS43MTYgMjEuMzMxLjA3Ny4zMDVjLjczMiAzLjE2MS0uMjU1IDYuNDk4LTIuNjI3IDguODJsLTE2LjA3NCAxNS43MzktLjIzMy4yMjFhOS44NiA5Ljg2IDAgMCAxLTkuMDg5IDIuMjc3bC03LjUzMS0xLjkzNGEyLjI1IDIuMjUgMCAwIDEtMS42MTQtMS41OTdsLTcuNjU3LTI4LjU3OC0uMDA1LjAwMS0xLjAwMi0zLjc0YTMuNzUgMy43NSAwIDAgMSAyLjY1MS00LjU5NGwxNy4zODYtNC42NmEzLjc1IDMuNzUgMCAwIDEgNC41OTMgMi42NTJsNC4wNzYgMTUuMjEzYTMuNzUgMy43NSAwIDAgMS0yLjY1MSA0LjU5M2wtOC42OTMgMi4zMjlhMS41IDEuNSAwIDAgMS0uNzc3LTIuODk4bDguNjkzLTIuMzI5YS43NS43NSAwIDAgMCAuNTMxLS45MTlMMTE2Ljk4IDkxLjI0YS43NS43NSAwIDAgMC0uOTE4LS41M2wtMTcuMzg2IDQuNjZhLjc1Ljc1IDAgMCAwLS41My45MTlsOC41NDUgMzEuODkzIDcuMTEyIDEuODI2YTYuODYgNi44NiAwIDAgMCA2LjQ3Ny0xLjczNWwxNi4wNzQtMTUuNzM5YzEuNjkzLTEuNjU3IDIuMzM1LTQuMDI2IDEuNzUxLTYuMjA1bC01LjcxNS0yMS4zMzJjLS41ODQtMi4xNzktMi4zMjUtMy45MS00LjYyLTQuNDk5bC0yMS43OS01LjU5M2E2Ljg2IDYuODYgMCAwIDAtNi40NzYgMS43MzZMODMuNDMgOTIuMzc5Yy0xLjY5MyAxLjY1OC0yLjMzNSA0LjAyNy0xLjc1MiA2LjIwNmw1LjcxNiAyMS4zMzJjLjU4NCAyLjE3OSAyLjMyNSAzLjkwOSA0LjYyIDQuNDk4bDIuNDA0LjYxN2ExLjUgMS41IDAgMCAxLS43NDUgMi45MDZsLTIuNDA1LS42MTdjLTMuMjE2LS44MjYtNS43NC0zLjIyMi02LjY4NS02LjMyNmwtLjA4Ny0uMzAyLTUuNzE1LTIxLjMzMWMtLjg0NC0zLjE0OC4wNDItNi41MTIgMi4zMjUtOC44OTlsLjIyNS0uMjI3eiIvPjwvc3ZnPg=="
                                }), (0, T.jsxs)("div", {
                                    className: "gap-y-medium text-align-x-left flex flex-col items-start",
                                    children: [(0, T.jsxs)("div", {
                                        className: "text-heading-small medium:text-heading-medium content-emphasis margin-none gap-x-xsmall flex flex-wrap items-center justify-start",
                                        style: {
                                            fontFamily: '"Builder Extended", "Builder Sans", sans-serif'
                                        },
                                        children: [w, (0, T.jsxs)("span", {
                                            className: "gap-x-xsmall inline-flex items-center",
                                            children: [(0, T.jsx)(tI, {
                                                name: "icon-regular-robux",
                                                size: "Large"
                                            }), y]
                                        })]
                                    }), v ? (0, T.jsx)("div", {
                                        className: "bg-shift-100 radius-medium height-[40px] width-full"
                                    }) : g ? (0, T.jsx)("p", {
                                        className: "text-body-small medium:text-body-medium content-default margin-none",
                                        children: f("Description.ReferralRecipientInvitedBy", {
                                            displayName: g,
                                            amount: y
                                        }, "".concat(g, " invited you to join Plus. You'll both get ").concat(y, " Robux when you join."))
                                    }) : null]
                                }), u && (0, T.jsx)("p", {
                                    className: "text-title-medium content-emphasis margin-none",
                                    children: f("Action.PricePerMonth", {
                                        price: b,
                                        periodType: null != c ? c : e3
                                    })
                                }), s && (0, T.jsx)(sd, {
                                    featureConfig: sD(sE({}, s), {
                                        isTradingEnabled: !1,
                                        isUgcPublishingEnabled: !1
                                    }),
                                    periodType: null != c ? c : e3
                                })]
                            }) : (0, T.jsxs)(sl, {
                                className: "gap-y-large padding-top-large padding-bottom-medium medium:padding-top-xlarge medium:padding-bottom-large flex flex-col items-center text-center",
                                children: [(0, T.jsx)(tI, {
                                    className: "content-emphasis !size-1800 medium:!size-2200",
                                    name: "icon-regular-triangle-exclamation",
                                    size: "XLarge"
                                }), (0, T.jsx)("p", {
                                    className: "text-body-small medium:text-body-medium content-emphasis margin-none",
                                    children: f(sR[t].key, void 0, sR[t].fallback)
                                })]
                            }), m ? (0, T.jsx)(sc, {
                                children: (0, T.jsxs)("div", {
                                    className: "gap-y-medium width-full flex flex-col",
                                    children: [(0, T.jsx)(sN, sD(sE({}, O), {
                                        className: "width-full",
                                        size: "Large",
                                        trackSubscriptionButtonClick: M,
                                        variant: "Emphasis",
                                        children: j
                                    })), (0, T.jsx)("span", {
                                        className: "text-caption-medium content-muted",
                                        children: ls(f, "Description.SubscriptionLegal", S)
                                    })]
                                })
                            }) : (0, T.jsxs)(sc, {
                                className: "gap-y-small flex flex-col",
                                children: [(0, T.jsx)(sN, sD(sE({}, l), {
                                    className: "width-full",
                                    size: "Large",
                                    trackSubscriptionButtonClick: M,
                                    variant: "Emphasis",
                                    children: x
                                })), (0, T.jsx)(t4, {
                                    className: "width-full",
                                    size: "Large",
                                    variant: "Standard",
                                    onClick: function() {
                                        P(!1)
                                    },
                                    children: f("Action.Cancel", void 0, "Cancel")
                                })]
                            })]
                        })
                    })
                },
                s_ = function(e) {
                    var t = e.face,
                        r = e.hasReferrerId,
                        n = e.referrerId,
                        i = e.referralCode,
                        o = e.surface,
                        a = e.open,
                        l = (0, th.useRef)(!1);
                    return (0, th.useEffect)(function() {
                        !l.current && a && (l.current = !0, a8("PlusReferralSheetShown", sE({
                            face: t,
                            hasReferrerId: String(r)
                        }, o ? {
                            surface: o
                        } : {})), lt(t, r, n, i, o))
                    }, [t, r, n, i, o, a]), null
                },
                sB = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.invite,
                        i = e.surface,
                        o = e.subscribeButtonProps,
                        a = e.subscribePrice,
                        l = e.subscribePeriodType,
                        u = e.subscribeFeatureConfig,
                        c = e.subscribeEligibleOffers,
                        s = void 0 !== n && tp(),
                        d = sO({
                            referrerId: null == n ? void 0 : n.referrerId,
                            enabled: s
                        }),
                        f = d.eligibility,
                        p = d.isLoading,
                        m = sw({
                            enabled: void 0 === o || void 0 === a || void 0 === u || void 0 === c
                        }),
                        y = m.subscribeButtonProps,
                        b = m.subscribePrice,
                        h = m.subscribePeriodType,
                        g = m.subscribeFeatureConfig,
                        v = m.isLoading,
                        w = null != o ? o : y;
                    if (sb({
                            referrerId: null == n ? void 0 : n.referrerId,
                            enabled: s && void 0 !== n.code && "Eligible" === f
                        }), p) return null;
                    var x = s && "Eligible" === f ? "pitch" : "Ineligible" === f ? "ineligible" : "invalid";
                    return "pitch" === x && v || void 0 === w ? null : (0, T.jsxs)(tg().Fragment, {
                        children: [(0, T.jsx)(s_, {
                            face: x,
                            hasReferrerId: (null == n ? void 0 : n.referrerId) !== void 0,
                            open: t,
                            referralCode: null == n ? void 0 : n.code,
                            referrerId: null == n ? void 0 : n.referrerId,
                            surface: i
                        }), (0, T.jsx)(E.TranslationProvider, {
                            config: function(e) {
                                if (Array.isArray(e)) return sT(e)
                            }(sA) || function(e) {
                                if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                            }(sA) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return sT(e, void 0);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sT(e, void 0)
                                }
                            }(sA) || function() {
                                throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            children: (0, T.jsx)(sU, {
                                face: x,
                                featureConfig: null != u ? u : g,
                                open: t,
                                referralCode: null == n ? void 0 : n.code,
                                referrerUserId: null == n ? void 0 : n.referrerId,
                                subscribeButtonProps: w,
                                subscribePeriodType: void 0 !== a ? l : h,
                                subscribePrice: null != a ? a : b,
                                surface: i,
                                onOpenChange: r
                            })
                        })]
                    })
                },
                sF = function(e, t) {
                    return "https://apis.".concat(e, "/").concat(t)
                };

            function sY(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var sG = function(e) {
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
                    var n = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = e.split(".").reverse()) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 3 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return sY(e, 3);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sY(e, 3)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
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
                sV = sG(window.location.hostname),
                sW = new tu(new eK({
                    robloxSiteDomain: sV.rootDomain,
                    basePath: sF(sV.rootDomain, "subscriptions"),
                    credentials: "include"
                })),
                sQ = function(e) {
                    var t = e.enabled,
                        r = (0, rE.userId)(),
                        n = (0, C.useQuery)({
                            queryKey: ["referral-share-link", r],
                            queryFn: function() {
                                return sW.subscriptionsV2CreateSubscriptionReferralLink()
                            },
                            enabled: t && null !== r
                        }),
                        i = n.data,
                        o = n.isFetching,
                        a = n.error;
                    return {
                        shareUrl: null == i ? void 0 : i.deepLinkUrl,
                        isLoading: o,
                        error: null != a ? a : void 0
                    }
                },
                sq = ((b = {}).LIST_AVAILABLE_PRODUCTS_FAILED = "ListAvailableProductsFailed", b.LIST_AVAILABLE_PRODUCTS_EMPTY = "ListAvailableProductsEmpty", b.LIST_SUBSCRIPTIONS_FAILED = "ListSubscriptionsFailed", b.GET_USER_BENEFITS_FAILED = "GetUserBenefitsFailed", b.GUAC_APP_POLICY_FAILED = "GuacAppPolicyFailed", b.MEMBERSHIP_POLLING_TIMEOUT = "MembershipPollingTimeout", b.PURCHASE_VIEW_SHOWN = "PurchaseViewShown", b.PURCHASE_VIEW_OPEN_SHEET_CLICK = "PurchaseViewOpenSheetClick", b.BUNDLE_PICKER_SHEET_OPENED = "BundlePickerSheetOpened", b.BUNDLE_PICKER_TIER_SELECTED = "BundlePickerTierSelected", b.BUNDLE_PICKER_SUBSCRIBE_CLICK = "BundlePickerSubscribeClick", b.BUNDLE_PICKER_ROW_MISSING_ROBUX_ALLOWANCE = "BundlePickerRowMissingRobuxAllowance", b.BUNDLE_PICKER_ROW_MISSING_STRIKETHROUGH_PRICE = "BundlePickerRowMissingStrikethroughPrice", b.MISSING_FEATURE_CONFIG = "MissingFeatureConfig", b.UNSUPPORTED_PRODUCT_SKIPPED = "UnsupportedProductSkipped", b.REFERRAL_LANDING_DETECTED = "ReferralLandingDetected", b.REFERRAL_COPY_LINK_CLICK = "ReferralCopyLinkClick", b.SHARE_CARD_SHOWN = "ShareCardShown", b.SHARE_CARD_INVITE_CLICK = "ShareCardInviteClick", b),
                sK = a6("RobloxSubscription");

            function sH(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sX(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                }(e, t) || sZ(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sZ(e, t) {
                if (e) {
                    if ("string" == typeof e) return sH(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sH(e, t)
                }
            }
            var s$ = ["Feature.RobloxSubscription"],
                sJ = "margin-x-auto width-full max-width-[200px] medium:max-width-[320px]",
                s0 = "margin-bottom-[-32px]",
                s1 = [{
                    opening: "linkStart",
                    closing: "linkEnd",
                    render: function(e) {
                        return (0, T.jsx)("a", {
                            className: "underline",
                            href: "https://en.help.roblox.com/hc/en-us/articles/52737229124628",
                            rel: "noopener noreferrer",
                            target: "_blank",
                            children: e
                        })
                    }
                }],
                s2 = "padding-x-xlarge margin-x-auto width-full medium:max-width-[600px] large:max-width-[792px] xlarge:max-width-[840px]",
                s4 = {
                    2: "medium:[grid-template-columns:repeat(2,minmax(0,1fr))]",
                    3: "medium:[grid-template-columns:repeat(3,minmax(0,1fr))]"
                },
                s3 = function(e) {
                    var t, r = e.robuxEarned,
                        n = e.referralCount,
                        i = e.pendingRobux,
                        o = (0, E.useTranslation)(),
                        a = o.translate,
                        l = o.intl,
                        u = function(e) {
                            return void 0 === e ? "—" : l.n(e)
                        },
                        c = [{
                            key: "successful-referrals",
                            label: a("Label.SuccessfulReferrals", void 0, "Successful referrals"),
                            value: u(n)
                        }, {
                            key: "robux-earned",
                            hasRobuxIcon: !0,
                            label: a("Label.RobuxEarned", void 0, "Robux earned"),
                            value: u(r)
                        }];
                    return void 0 !== i && i > 0 && c.push({
                        key: "pending-robux",
                        hasRobuxIcon: !0,
                        label: a("Label.PendingRobux", void 0, "Pending Robux"),
                        value: u(i)
                    }), (0, T.jsxs)("div", {
                        className: "width-full gap-y-medium flex flex-col",
                        children: [(0, T.jsx)("h2", {
                            className: "text-heading-small content-emphasis margin-none",
                            children: a("Heading.ReferralHistory", void 0, "Referral history")
                        }), (0, T.jsx)("div", {
                            className: "".concat("[grid-template-columns:repeat(2,minmax(0,1fr))]", " ").concat(null != (t = s4[c.length]) ? t : "", " width-full gap-medium grid"),
                            "data-testid": "plus-referral-stats-cards",
                            children: c.map(function(e) {
                                var t = e.key,
                                    r = e.label,
                                    n = e.value,
                                    i = e.hasRobuxIcon;
                                return (0, T.jsxs)("div", {
                                    className: "padding-medium gap-xsmall bg-shift-100 radius-medium min-width-0 flex flex-col",
                                    children: [(0, T.jsx)("span", {
                                        className: "text-title-medium content-muted",
                                        children: r
                                    }), (0, T.jsxs)("span", {
                                        className: "text-heading-small content-emphasis gap-x-xsmall flex items-center",
                                        children: [i ? (0, T.jsx)(tI, {
                                            name: "icon-regular-robux",
                                            size: "Small"
                                        }) : null, n]
                                    })]
                                }, t)
                            })
                        }), (0, T.jsx)("span", {
                            className: "text-caption-medium content-muted",
                            children: a("Description.SavingsDataDelay")
                        })]
                    })
                },
                s5 = function(e) {
                    var t = e.label,
                        r = e.amount,
                        n = e.description;
                    return (0, T.jsxs)("div", {
                        className: "flex flex-col",
                        children: [(0, T.jsx)("span", {
                            className: "text-title-large large:text-heading-small content-emphasis",
                            children: t
                        }), (0, T.jsx)(ri, {
                            className: "padding-x-none",
                            description: n,
                            divider: "None",
                            isContained: !0,
                            leading: (0, T.jsx)("span", {
                                className: "bg-shift-200 radius-circle size-1000 large:size-1200 flex items-center justify-center",
                                children: (0, T.jsx)(tI, {
                                    className: "large:!size-600",
                                    name: "icon-regular-robux",
                                    size: "Large"
                                })
                            }),
                            size: "Medium",
                            title: r
                        })]
                    })
                },
                s6 = function(e) {
                    var t = e.shareUrl,
                        r = e.robloxPlusUserBenefits,
                        n = (0, E.useTranslation)(),
                        i = n.translate,
                        o = n.intl,
                        a = sQ({
                            enabled: void 0 === t
                        }),
                        l = a.shareUrl,
                        u = a.isLoading,
                        c = a.error,
                        s = null != t ? t : l,
                        d = sX((0, th.useState)(!1), 2),
                        f = d[0],
                        p = d[1],
                        m = (0, th.useRef)(),
                        y = (0, th.useRef)(!1);
                    (0, th.useEffect)(function() {
                        y.current || (y.current = !0, a7())
                    }, []), (0, th.useEffect)(function() {
                        return function() {
                            window.clearTimeout(m.current)
                        }
                    }, []), (0, th.useEffect)(function() {
                        var e, t = document.getElementById("footer-container"),
                            r = document.querySelector(".container-main"),
                            n = null == (e = document.getElementById("roblox-subscription-container")) ? void 0 : e.parentElement,
                            i = null == t ? void 0 : t.style.display,
                            o = document.body.style.marginBottom,
                            a = null == r ? void 0 : r.style.paddingBottom,
                            l = null == r ? void 0 : r.style.minHeight,
                            u = null == n ? void 0 : n.style.marginBottom;
                        return t && (t.style.display = "none"), document.body.style.marginBottom = "0px", r && (r.style.paddingBottom = "0px", r.style.minHeight = "0px"), n && (n.style.marginBottom = "0px"),
                            function() {
                                t && (t.style.display = null != i ? i : ""), document.body.style.marginBottom = o, r && (r.style.paddingBottom = null != a ? a : "", r.style.minHeight = null != l ? l : ""), n && (n.style.marginBottom = null != u ? u : "")
                            }
                    }, []);
                    var b = (0, th.useCallback)(function() {
                            s && (le(), sK(sq.REFERRAL_COPY_LINK_CLICK), navigator.clipboard.writeText(s).then(function() {
                                p(!0), window.clearTimeout(m.current), m.current = window.setTimeout(function() {
                                    p(!1)
                                }, 2e3)
                            }).catch(function() {}))
                        }, [s]),
                        h = o.n(100),
                        g = i("Label.ReferralRewardRobux", {
                            amount: h
                        }, "".concat(h, " Robux")),
                        v = i("Heading.ReferralShare", void 0, "Share Plus, get");
                    return (0, T.jsxs)("main", {
                        className: "bg-surface-0 flex flex-col",
                        children: [(0, T.jsxs)("div", {
                            className: "".concat(s2, " gap-y-large medium:gap-y-xxlarge margin-top-[48px] padding-bottom-large flex flex-col"),
                            children: [(0, T.jsx)("img", {
                                alt: "",
                                className: "".concat(sJ, " ").concat(s0, " dark:hidden"),
                                src: "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMjAiIGhlaWdodD0iMTgwIiBmaWxsPSJub25lIiB2aWV3Qm94PSIwIDAgMzIwIDE4MCI+PHBhdGggZmlsbD0iIzFiMjU0YiIgZmlsbC1vcGFjaXR5PSIuMTYiIGQ9Ik0yNTYuNDg2IDM2LjkwNWE0IDQgMCAwIDEgMi42MzEgNC44NGwtMjMuODExIDg4Ljg2Ni0uMDU5LjE5OGE0IDQgMCAwIDEtNC42NCAyLjY3OWwtLjItLjA0OS02NS4xMzMtMTcuNDUyLS40NDgtMS42NzMgNjUuOTY5IDE3LjY3NmEyLjUgMi41IDAgMCAwIDMuMDYyLTEuNzY3bDIzLjgxMS04OC44NjZhMi41IDIuNSAwIDAgMC0xLjc2OC0zLjA2MmwtODguODY1LTIzLjgxYTIuNSAyLjUgMCAwIDAtMy4wNjIgMS43NjdMMTUxLjI2MiA2My42OWwtLjc3Ni0yLjg5OCAxMi4wMzgtNDQuOTI4YTQgNCAwIDAgMSA0Ljg5OS0yLjgyOWw4OC44NjUgMjMuODEyeiIvPjxwYXRoIGZpbGw9IiMyMDIyMjciIGQ9Ik0yMDIuMjMzIDQyLjc4YTkuODYgOS44NiAwIDAgMSA5LjMyMiAyLjQ5OGwxNi4wNzQgMTUuNzM5YzIuNDQ4IDIuMzk3IDMuNDIxIDUuODc2IDIuNTUgOS4xMjVsLTUuNzE2IDIxLjMzMi0uMDg2LjMwMmMtLjk0NiAzLjEwMy0zLjQ2OSA1LjUtNi42ODUgNi4zMjVsLTIxLjc5IDUuNTkzLS4zMTIuMDc1YTkuODYgOS44NiAwIDAgMS05LjAwOS0yLjU3M2wtNS40NTEtNS4zMzdhMyAzIDAgMCAxLS43OTktMi45Mmw3LjUwNy0yOC4wMTYgMS4wMDItMy43NDJhNCA0IDAgMCAxIDQuODk5LTIuODI4bDE3LjM4NyA0LjY1N2E0IDQgMCAwIDEgMi44MjggNC44OTlsLTQuMDc2IDE1LjIxM2E0IDQgMCAwIDEtNC44OTkgMi44MjlsLTguNjkzLTIuMzNhMS43NSAxLjc1IDAgMCAxIC45MDUtMy4zOGw4LjY5NCAyLjMyOWEuNS41IDAgMCAwIC42MTItLjM1NGw0LjA3Ny0xNS4yMTNhLjUuNSAwIDAgMC0uMzU0LS42MTJsLTE3LjM4Ny00LjY1N2EuNS41IDAgMCAwLS42MTMuMzUzbC04LjQzMyAzMS40NzYgNS4yNDIgNS4xMzNhNi4zNiA2LjM2IDAgMCAwIDYuMDAzIDEuNjA5bDIxLjc5LTUuNTkzYzIuMTI0LS41NDYgMy43MjQtMi4xNDQgNC4yNjEtNC4xNDRsNS43MTUtMjEuMzMyYy41MzYtMi0uMDUxLTQuMTg1LTEuNjE4LTUuNzE5TDIwOS4xMDcgNDcuNzhhNi4zNiA2LjM2IDAgMCAwLTYuMDA0LTEuNjA5bC0yMS43ODkgNS41OTNjLTIuMTI0LjU0NS0zLjcyNSAyLjE0My00LjI2MSA0LjE0NGwtNS43MTYgMjEuMzMyYy0uNTM2IDIgLjA1MiA0LjE4NSAxLjYxOCA1LjcxOWwyLjMxIDIuMjZjLjQ1MS40NDIuNjI5IDEuMDkzLjQ2NiAxLjcwNC0uMzQ3IDEuMjkzLTEuOTU4IDEuNzM0LTIuOTE0Ljc5N2wtMi4zMS0yLjI2MWMtMi4zNzItMi4zMjMtMy4zNTktNS42Ni0yLjYyNy04LjgybC4wNzctLjMwNUwxNzMuNjcyIDU1Yy44NDQtMy4xNDggMy4yOTMtNS42MTcgNi40NjMtNi41NDNsLjMwOS0uMDg0eiIvPjxwYXRoIGZpbGw9IiMxYjI1NGIiIGZpbGwtb3BhY2l0eT0iLjE2IiBkPSJtMTY2Ljk4NSAxMzcuODAzLjM4OCAxLjQ0OS04OC44NjUgMjMuODExLS4zODgtMS40NDl6bTEuNzY4LTMuMDYyLTIzLjgxMS04OC44NjVhMi41IDIuNSAwIDAgMC0zLjA2Mi0xLjc2OEw1My4wMTUgNjcuOTJhMi41IDIuNSAwIDAgMC0xLjc2OCAzLjA2MWwyMy44MTEgODguODY2YTIuNSAyLjUgMCAwIDAgMy4wNjIgMS43NjdsLjM4OCAxLjQ0OS0uMi4wNDlhNCA0IDAgMCAxLTQuNjQtMi42NzlsLS4wNTktLjE5OEw0OS43OTggNzEuMzdhNCA0IDAgMCAxIDIuODI4LTQuOWw4OC44NjYtMjMuODEuMi0uMDVhNCA0IDAgMCAxIDQuNjk5IDIuODc4bDIzLjgxMSA4OC44NjUuMDQ5LjJhNCA0IDAgMCAxLTIuNjggNC42NDFsLS4xOTguMDU4LS4zODgtMS40NDlhMi41IDIuNSAwIDAgMCAxLjc2OC0zLjA2MiIvPjxwYXRoIGZpbGw9IiMyMDIyMjciIGQ9Ik0xMjAuOTU1IDcwLjI0NmM1LjA1NC0zLjg4MiAxMi4zMjEuMDM1IDExLjg2MSA2LjM5MmwtMi45OTIgNDEuMzkzLS4wNDcuNDUyYy0uNTk0IDQuNDgtNS4wNzQgNy4zODQtOS40MDUgNi4wOTdsLS40MzMtLjE0My01LjUxMy0yLjAwNS02LjA5MyA5LjY0Yy0uODIxIDEuMzAxLTIuMjQ3IDEuODEzLTMuNTAzIDEuNjgyLTEuMjYtLjEzMS0yLjU5NS0uOTUtMy4wMTMtMi41MTFMOTcuODM5IDExNi40bC0xMi40NDMtNC41MjVjLTUuMzkyLTEuOTYtNi41Ni05LjAyMy0yLjE4OC0xMi42M2wuMjEyLS4xNjh6bS0xNS43NzYgNjAuMDIzcS4wMDYuMDAxLjAxMy4wMDNhLjI1LjI1IDAgMCAwIC4xMjQtLjAxNy4xMi4xMiAwIDAgMCAuMDU4LS4wNTJoLjAwMWw1LjY4NC04Ljk5NS05LjIwNS0zLjM0OHptMjQuMTQ2LTUzLjg4NGMuMjQyLTMuMzQ3LTMuNTgzLTUuNDAzLTYuMjM4LTMuMzYzbC0zNy41MzQgMjguODNjLTIuNDMgMS44NjctMS44NDMgNS42ODUgMS4wMzkgNi43MzRsMTIuMDEgNC4zNjcgMTAuOTYzLTE2LjAxYTEuNzUgMS43NSAwIDAgMSAyLjg4NyAxLjk3OWwtMTAuNDUzIDE1LjI2NiAxOS4xMzYgNi45NTljMi40MjEuODggNS4wMTItLjc5NyA1LjE5OC0zLjM2OXoiLz48L3N2Zz4="
                            }), (0, T.jsx)("img", {
                                alt: "",
                                className: "".concat(sJ, " ").concat(s0, " hidden dark:block"),
                                src: "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMjAiIGhlaWdodD0iMTgwIiBmaWxsPSJub25lIiB2aWV3Qm94PSIwIDAgMzIwIDE4MCI+PHBhdGggZmlsbD0iI2QwZDlmYiIgZmlsbC1vcGFjaXR5PSIuMTYiIGQ9Ik0yNTYuNDg2IDM2LjkwNWE0IDQgMCAwIDEgMi42MzEgNC44NGwtMjMuODExIDg4Ljg2Ni0uMDU5LjE5OGE0IDQgMCAwIDEtNC42NCAyLjY3OWwtLjItLjA0OS02NS4xMzMtMTcuNDUyLS40NDgtMS42NzMgNjUuOTY5IDE3LjY3NmEyLjUgMi41IDAgMCAwIDMuMDYyLTEuNzY3bDIzLjgxMS04OC44NjZhMi41IDIuNSAwIDAgMC0xLjc2OC0zLjA2MmwtODguODY1LTIzLjgxYTIuNSAyLjUgMCAwIDAtMy4wNjIgMS43NjdMMTUxLjI2MiA2My42OWwtLjc3Ni0yLjg5OCAxMi4wMzgtNDQuOTI4YTQgNCAwIDAgMSA0Ljg5OS0yLjgyOWw4OC44NjUgMjMuODEyeiIvPjxwYXRoIGZpbGw9IiNmN2Y3ZjgiIGQ9Ik0yMDIuMjMzIDQyLjc4YTkuODYgOS44NiAwIDAgMSA5LjMyMiAyLjQ5OGwxNi4wNzQgMTUuNzM5YzIuNDQ4IDIuMzk3IDMuNDIxIDUuODc2IDIuNTUgOS4xMjVsLTUuNzE2IDIxLjMzMi0uMDg2LjMwMmMtLjk0NiAzLjEwMy0zLjQ2OSA1LjUtNi42ODUgNi4zMjVsLTIxLjc5IDUuNTkzLS4zMTIuMDc1YTkuODYgOS44NiAwIDAgMS05LjAwOS0yLjU3M2wtNS40NTEtNS4zMzdhMyAzIDAgMCAxLS43OTktMi45Mmw3LjUwNy0yOC4wMTYgMS4wMDItMy43NDJhNCA0IDAgMCAxIDQuODk5LTIuODI4bDE3LjM4NyA0LjY1N2E0IDQgMCAwIDEgMi44MjggNC44OTlsLTQuMDc2IDE1LjIxM2E0IDQgMCAwIDEtNC44OTkgMi44MjlsLTguNjkzLTIuMzNhMS43NSAxLjc1IDAgMCAxIC45MDUtMy4zOGw4LjY5NCAyLjMyOWEuNS41IDAgMCAwIC42MTItLjM1NGw0LjA3Ny0xNS4yMTNhLjUuNSAwIDAgMC0uMzU0LS42MTJsLTE3LjM4Ny00LjY1N2EuNS41IDAgMCAwLS42MTMuMzUzbC04LjQzMyAzMS40NzYgNS4yNDIgNS4xMzNhNi4zNiA2LjM2IDAgMCAwIDYuMDAzIDEuNjA5bDIxLjc5LTUuNTkzYzIuMTI0LS41NDYgMy43MjQtMi4xNDQgNC4yNjEtNC4xNDRsNS43MTUtMjEuMzMyYy41MzYtMi0uMDUxLTQuMTg1LTEuNjE4LTUuNzE5TDIwOS4xMDcgNDcuNzhhNi4zNiA2LjM2IDAgMCAwLTYuMDA0LTEuNjA5bC0yMS43ODkgNS41OTNjLTIuMTI0LjU0NS0zLjcyNSAyLjE0My00LjI2MSA0LjE0NGwtNS43MTYgMjEuMzMyYy0uNTM2IDIgLjA1MiA0LjE4NSAxLjYxOCA1LjcxOWwyLjMxIDIuMjZjLjQ1MS40NDIuNjI5IDEuMDkzLjQ2NiAxLjcwNC0uMzQ3IDEuMjkzLTEuOTU4IDEuNzM0LTIuOTE0Ljc5N2wtMi4zMS0yLjI2MWMtMi4zNzItMi4zMjMtMy4zNTktNS42Ni0yLjYyNy04LjgybC4wNzctLjMwNUwxNzMuNjcyIDU1Yy44NDQtMy4xNDggMy4yOTMtNS42MTcgNi40NjMtNi41NDNsLjMwOS0uMDg0eiIvPjxwYXRoIGZpbGw9IiNkMGQ5ZmIiIGZpbGwtb3BhY2l0eT0iLjE2IiBkPSJtMTY2Ljk4NSAxMzcuODAzLjM4OCAxLjQ0OS04OC44NjUgMjMuODExLS4zODgtMS40NDl6bTEuNzY4LTMuMDYyLTIzLjgxMS04OC44NjVhMi41IDIuNSAwIDAgMC0zLjA2Mi0xLjc2OEw1My4wMTUgNjcuOTJhMi41IDIuNSAwIDAgMC0xLjc2OCAzLjA2MWwyMy44MTEgODguODY2YTIuNSAyLjUgMCAwIDAgMy4wNjIgMS43NjdsLjM4OCAxLjQ0OS0uMi4wNDlhNCA0IDAgMCAxLTQuNjQtMi42NzlsLS4wNTktLjE5OEw0OS43OTggNzEuMzdhNCA0IDAgMCAxIDIuODI4LTQuOWw4OC44NjYtMjMuODEuMi0uMDVhNCA0IDAgMCAxIDQuNjk5IDIuODc4bDIzLjgxMSA4OC44NjUuMDQ5LjJhNCA0IDAgMCAxLTIuNjggNC42NDFsLS4xOTguMDU4LS4zODgtMS40NDlhMi41IDIuNSAwIDAgMCAxLjc2OC0zLjA2MiIvPjxwYXRoIGZpbGw9IiNmN2Y3ZjgiIGQ9Ik0xMjAuOTU1IDcwLjI0NWM1LjA1My0zLjg4MSAxMi4zMjEuMDM1IDExLjg2MSA2LjM5MmwtMi45OTIgNDEuMzkzLS4wNDcuNDUzYy0uNTk0IDQuNDgtNS4wNzQgNy4zODQtOS40MDUgNi4wOTdsLS40MzMtLjE0My01Ljc1NC0yLjA5My02LjA2MyA5LjU5NWMtLjc2NSAxLjIxLTIuMDkyIDEuNjg4LTMuMjY2IDEuNTY2LTEuMTc4LS4xMjItMi40MTEtLjg4NC0yLjc5OC0yLjMyN2wtMy45MzItMTQuNjczLTEyLjczLTQuNjNjLTUuMzkyLTEuOTYxLTYuNTYxLTkuMDIzLTIuMTg4LTEyLjYzbC4yMTItLjE2OXptLTE1Ljk5OSA2MC4xNTdjLjAwOS4wMzQuMDIuMDQ3LjAzNy4wNmEuMzYuMzYgMCAwIDAgLjE3My4wNTkuNDMuNDMgMCAwIDAgLjQxOS0uMTg1bDUuNzE0LTkuMDQyLTkuNzMyLTMuNTM5em0yNC44NjctNTMuOThjLjI3My0zLjc3OC00LjA0My02LjEtNy4wNDEtMy43OTdsLTM3LjUzNSAyOC44M2MtMi43NDMgMi4xMDctMi4wNzggNi40MTggMS4xNzQgNy42MDFsMTIuMTMyIDQuNDExIDExLjIxNy0xNi4zODJhMS41IDEuNSAwIDAgMSAyLjQ3NiAxLjY5NGwtMTAuNzgyIDE1Ljc0NiAxOS41IDcuMDkzYzIuNzMzLjk5MyA1LjY1OC0uOTAxIDUuODY4LTMuODA0eiIvPjwvc3ZnPg=="
                            }), (0, T.jsxs)("div", {
                                className: "gap-y-none flex flex-col",
                                children: [(0, T.jsxs)("h1", {
                                    className: "text-heading-medium medium:text-heading-large large:text-display-small content-emphasis margin-none gap-x-small wrap flex items-center",
                                    style: {
                                        fontFamily: '"Builder Extended", "Builder Sans", sans-serif'
                                    },
                                    children: [v, (0, T.jsxs)("span", {
                                        className: "gap-x-xsmall flex items-center",
                                        children: [(0, T.jsx)(tI, {
                                            name: "icon-regular-robux",
                                            size: "XLarge"
                                        }), h]
                                    })]
                                }), (0, T.jsx)("p", {
                                    className: "text-body-medium medium:text-body-large content-default margin-none",
                                    children: i("Description.ReferralShare", {
                                        amount: h
                                    }, "Invite someone to Plus and you both get ".concat(h, " Robux when they join."))
                                })]
                            }), (0, T.jsxs)("div", {
                                className: "gap-y-medium flex flex-col",
                                children: [(0, T.jsx)(s5, {
                                    amount: g,
                                    description: i("Description.ReferralReferrerReward", void 0, "When anyone joins Plus with your link."),
                                    label: i("Label.ReferralYouGet", void 0, "You get")
                                }), (0, T.jsx)(s5, {
                                    amount: g,
                                    description: i("Description.ReferralRecipientReward", void 0, "Offer valid for new Plus subscribers only."),
                                    label: i("Label.ReferralTheyGet", void 0, "Your referrals get")
                                })]
                            }), (0, T.jsx)(s3, {
                                pendingRobux: null == r ? void 0 : r.pendingRobuxEarnedFromReferrals,
                                referralCount: null == r ? void 0 : r.referralsCount,
                                robuxEarned: null == r ? void 0 : r.robuxEarnedFromReferrals
                            })]
                        }), (0, T.jsx)("div", {
                            className: "padding-y-medium shrink-0",
                            children: (0, T.jsxs)("div", {
                                className: "".concat(s2, " gap-y-small flex flex-col"),
                                children: [(0, T.jsxs)("div", {
                                    className: "gap-x-small flex items-start",
                                    children: [(0, T.jsx)("div", {
                                        className: "grow-1 min-width-0",
                                        children: (0, T.jsx)(af, {
                                            "aria-label": i("Description.ReferralShareLink", void 0, "Referral link"),
                                            error: c ? i("Message.ReferralLinkError", void 0, "We could not create your link. Please try again later.") : void 0,
                                            hasError: !!c,
                                            isDisabled: !0,
                                            readOnly: !0,
                                            size: "Large",
                                            value: c ? "" : null != s ? s : i("Label.Loading", void 0, "Loading")
                                        })
                                    }), (0, T.jsx)(t4, {
                                        className: "width-[200px] shrink-0",
                                        isDisabled: !s,
                                        isLoading: u,
                                        size: "Large",
                                        variant: "Emphasis",
                                        onClick: b,
                                        children: f ? i("Label.ReferralLinkCopied", void 0, "Link copied") : i("Action.CopyReferralLink", void 0, "Copy link")
                                    })]
                                }), (0, T.jsx)("span", {
                                    className: "text-caption-medium content-muted",
                                    children: ls(i, "Description.ReferralTerms", s1)
                                })]
                            })
                        })]
                    })
                },
                s8 = function(e) {
                    var t = e.onClose,
                        r = e.robloxPlusUserBenefits,
                        n = e.subscribeButtonProps,
                        i = sX((0, th.useState)("loading"), 2),
                        o = i[0],
                        a = i[1],
                        l = sX((0, th.useState)(), 2),
                        u = l[0],
                        c = l[1],
                        s = (0, th.useRef)(t);
                    return (s.current = t, (0, th.useEffect)(function() {
                        if (!(0, rE.isAuthenticated)()) return void s.current();
                        var e = !0;
                        return sW.subscriptionsV2CreateSubscriptionReferralLink().then(function(t) {
                                e && (c(t.deepLinkUrl), a("ready"))
                            }).catch(function() {
                                e && a("invalid")
                            }),
                            function() {
                                e = !1
                            }
                    }, []), "loading" === o) ? null : (0, T.jsx)(E.TranslationProvider, {
                        config: function(e) {
                            if (Array.isArray(e)) return sH(e)
                        }(s$) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(s$) || sZ(s$) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        children: "ready" === o ? (0, T.jsx)(s6, {
                            robloxPlusUserBenefits: r,
                            shareUrl: u
                        }) : (0, T.jsx)(sB, {
                            open: !0,
                            subscribeButtonProps: n,
                            onOpenChange: function(e) {
                                e || t()
                            }
                        })
                    })
                },
                s9 = window.CoreRobloxUtilities,
                s7 = window.Roblox["core-scripts"].localStorage.localStorage,
                de = r.n(s7),
                dt = window.CoreUtilities,
                dr = window.Roblox["core-scripts"].paymentsFlow,
                dn = r.n(dr);

            function di(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function da(e) {
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

            function dl(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function du(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return di(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return di(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function dc(e, t) {
                var r = t.publish,
                    n = t.captureException,
                    i = t.featureName;

                function o(e, t, r) {
                    if (null != r) {
                        var o, a = (null != (o = Error) && "u" > typeof Symbol && o[Symbol.hasInstance] ? !!o[Symbol.hasInstance](r) : r instanceof o) ? r.name || "Error" : "UnknownError",
                            l = i ? "".concat(i, "_").concat(e) : e;
                        return null == n || n(r, {
                            error_counter: l
                        }), dl(da({}, t), {
                            errorType: a
                        })
                    }
                    return t
                }
                return {
                    trackCounter: function() {
                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        var i = du(t, 2);
                        r(i[0], i[1])
                    },
                    trackError: function() {
                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        var i = du(t, 3),
                            a = i[0],
                            l = i[1],
                            u = i[2],
                            c = o(a, dl(da({}, null != l ? l : {}), {
                                severity: "error"
                            }), u);
                        r(a, c)
                    },
                    trackCriticalError: function() {
                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        var i = du(t, 3),
                            a = i[0],
                            l = i[1],
                            u = i[2],
                            c = o(a, dl(da({}, null != l ? l : {}), {
                                severity: "critical"
                            }), u);
                        r(a, c)
                    }
                }
            }
            var ds = function(e, t) {
                var r;
                null == (r = window.Sentry) || r.captureException(e, t ? {
                    tags: t
                } : void 0)
            };

            function dd(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function df(e) {
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

            function dp(e) {
                return (void 0 === e ? "undefined" : e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) == "object" && "config" in e
            }
            var dm = {
                    featureName: "PaymentsPackage",
                    team: "Economy > Payments & Fraud",
                    features: {
                        PriceTag: {
                            counters: [{
                                name: "PriceTag_ArabicLocaleTriggered"
                            }],
                            criticalErrors: [{
                                name: "PriceTag_NumberFormatLocaleException"
                            }, {
                                name: "PriceTag_DataNotValid",
                                dimensions: ["currencyCode"]
                            }]
                        },
                        RobuxBalance: {
                            counters: [{
                                name: "RobuxBalance_UpdatedOnRefetch"
                            }],
                            apiCalls: ["GetRobuxBalance"]
                        },
                        PaymentSession: {
                            apiCalls: ["CreatePaymentSession", "GetPaymentSession", "GetPaymentSessionByCheckoutSessionId"]
                        },
                        Metadata: {
                            apiCalls: ["GetMetadata"]
                        },
                        PersonalizedBonusItem: {
                            apiCalls: ["CreateOrGetBonusSessionByPaymentSessionId", "GetDisplayableBonusForProduct", "GetBonusSessionByCheckoutSessionId", "GetThumbnails", "HandleGameJoinEvent"]
                        }
                    }
                },
                dy = a6(dm.featureName),
                db = dc(dm, {
                    publish: dy,
                    captureException: ds
                });
            db.trackCounter, db.trackError, db.trackCriticalError;
            var dh = function(e) {
                var t;
                return (t = function() {
                    var t, r, n, i, o, a, l, u;
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
                            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                            l = Object.defineProperty;
                        return l(a, "next", {
                            value: u(0)
                        }), l(a, "throw", {
                            value: u(1)
                        }), l(a, "return", {
                            value: u(2)
                        }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), a;

                        function u(l) {
                            return function(u) {
                                var c = [l, u];
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
                    }(this, function(c) {
                        switch (c.label) {
                            case 0:
                                t = e.eventCounterProps.call, dy(r = "".concat(t, "_API"), {
                                    statusCode: "Throughput"
                                }), c.label = 1;
                            case 1:
                                return c.trys.push([1, 3, , 4]), [4, "GET" === e.method ? dt.httpService.get(df({
                                    url: e.url,
                                    fullError: !0
                                }, e.config), null == (n = e.config) ? void 0 : n.params) : dt.httpService.post(df({
                                    url: e.url,
                                    fullError: !0
                                }, e.config), e.data)];
                            case 2:
                                return o = (i = c.sent()).data, a = i.headers, dy(r, {
                                    statusCode: "200"
                                }), [2, {
                                    data: o,
                                    headers: a
                                }];
                            case 3:
                                throw u = function(e) {
                                        if (dp(e)) {
                                            var t, r, n;
                                            return null != (t = null != (r = e.code) ? r : null == e || null == (n = e.response) ? void 0 : n.status.toString()) ? t : "UnknownAxiosError"
                                        }
                                        return "UnknownError"
                                    }(l = c.sent()), dy(r, {
                                        statusCode: u
                                    }),
                                    function(e) {
                                        if (!dp(e)) return !0;
                                        var t, r = null == (t = e.response) ? void 0 : t.status;
                                        return void 0 === r || r >= 500
                                    }(l) && ds(l, {
                                        call: t,
                                        statusCode: u
                                    }), l;
                            case 4:
                                return [2]
                        }
                    })
                }, function() {
                    var e = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var o = t.apply(e, r);

                        function a(e) {
                            dd(o, n, i, a, l, "next", e)
                        }

                        function l(e) {
                            dd(o, n, i, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                })()
            };

            function dg(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function dv(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var o = e.apply(t, r);

                        function a(e) {
                            dg(o, n, i, a, l, "next", e)
                        }

                        function l(e) {
                            dg(o, n, i, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function dw(e, t) {
                var r, n, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(a, "next", {
                    value: u(0)
                }), l(a, "throw", {
                    value: u(1)
                }), l(a, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function u(l) {
                    return function(u) {
                        var c = [l, u];
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

            function dx(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function dj(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function dO(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return dx(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return dx(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }(h = {
                publish: dy,
                captureException: ds,
                featureName: dm.featureName
            }).publish, h.captureException, h.featureName, th.Component;
            var dS = "paymentSession-".concat((null === sf.CurrentUser || void 0 === sf.CurrentUser ? void 0 : sf.CurrentUser.userId) || "loggedout");

            function dI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var dM = function(e) {
                    var t = new URLSearchParams(e),
                        r = t.get("referralCode"),
                        n = t.get("referrerId");
                    return r ? function(e) {
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
                        kind: "invite",
                        code: r
                    }, n ? {
                        referrerId: n
                    } : {}) : t.get("referralStatus") ? {
                        kind: "invalid"
                    } : n ? {
                        kind: "invite",
                        referrerId: n
                    } : {
                        kind: "none"
                    }
                },
                dP = function(e) {
                    var t, r = e.subscribeButtonProps,
                        n = e.subscribePrice,
                        i = e.subscribePeriodType,
                        o = e.subscribeFeatureConfig,
                        a = e.subscribeEligibleOffers,
                        l = (0, th.useMemo)(function() {
                            return dM(window.location.search)
                        }, []),
                        u = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, th.useState)("none" !== l.kind)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return dI(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return dI(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        c = u[0],
                        s = u[1];
                    return "none" === l.kind ? null : (0, T.jsx)(sB, {
                        invite: "invite" === l.kind ? l : void 0,
                        open: c,
                        subscribeButtonProps: r,
                        subscribeEligibleOffers: a,
                        subscribeFeatureConfig: o,
                        subscribePeriodType: i,
                        subscribePrice: n,
                        surface: ay.DirectUrl,
                        onOpenChange: s
                    })
                },
                dN = function(e) {
                    var t = e.title,
                        r = e.body,
                        n = e.equipText,
                        i = e.onEquip,
                        o = e.onItemDetailsClick,
                        a = null != o;
                    return (0, T.jsxs)("div", {
                        "aria-label": a ? t : void 0,
                        className: "bg-shift-200 radius-medium padding-medium gap-medium width-full flex items-center ".concat(a ? "hover:bg-surface-100 cursor-pointer" : ""),
                        role: a ? "button" : void 0,
                        tabIndex: a ? 0 : void 0,
                        onClick: o,
                        onKeyDown: a ? function(e) {
                            e.target === e.currentTarget && ("Enter" === e.key || " " === e.key) && (e.preventDefault(), null == o || o())
                        } : void 0,
                        children: [(0, T.jsx)("div", {
                            className: "radius-medium size-[50px] shrink-0 overflow-hidden",
                            children: (0, T.jsx)("img", {
                                alt: t,
                                className: "size-full object-cover",
                                src: "https://images.rbxcdn.com/edf7aeadb32b5c26.png"
                            })
                        }), (0, T.jsxs)("div", {
                            className: "min-width-0 grow-1 shrink-1 flex basis-0 flex-col justify-center",
                            children: [(0, T.jsx)("span", {
                                className: "text-title-medium content-emphasis",
                                children: t
                            }), (0, T.jsx)("span", {
                                className: "text-body-medium content-default",
                                children: r
                            })]
                        }), null != n && null != i && (0, T.jsx)(t4, {
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
                dT = function(e) {
                    var t = e.size,
                        r = e.variant,
                        n = (0, (0, E.useTranslation)().translate)("Label.Blackbird");
                    return "compact" === (void 0 === r ? "default" : r) ? (0, T.jsxs)("div", {
                        className: "gap-x-xxsmall flex items-center",
                        children: [(0, T.jsx)(tI, {
                            className: "relative",
                            name: "icon-regular-roblox-plus",
                            size: "Large",
                            style: {
                                top: -1
                            }
                        }), (0, T.jsx)("span", {
                            className: "text-label-large content-emphasis text-no-wrap",
                            children: n
                        })]
                    }) : (0, T.jsxs)("div", {
                        className: "gap-x-small flex items-center",
                        children: [(0, T.jsx)(tI, {
                            className: "!size-1000 relative",
                            name: "icon-regular-roblox-plus",
                            style: {
                                top: -4
                            }
                        }), "large" === (void 0 === t ? "large" : t) ? (0, T.jsx)("h1", {
                            className: "font-builder-extended text-display-small text-no-wrap",
                            children: n
                        }) : (0, T.jsx)("h2", {
                            className: "text-heading-large",
                            children: n
                        })]
                    })
                },
                dE = window.Roblox["core-scripts"].format.string,
                dD = function(e) {
                    var t, r = e.eligibleOffers,
                        n = e.price,
                        i = e.periodType,
                        o = (0, E.useTranslation)().translate,
                        a = sh(n),
                        l = o("Description.BillingInfo", {
                            price: "<span class='text-heading-medium'>".concat((0, dE.escapeHtml)(a), "</span>"),
                            periodType: i
                        }),
                        u = o("Description.BillingInfoWithFreeTrialOffer", {
                            boldTagStart: "<b>",
                            boldTagEnd: "</b>",
                            trialPeriod: 1,
                            trialPeriodType: i,
                            price: (0, dE.escapeHtml)(a),
                            periodType: i
                        }),
                        c = null != (t = null == r ? void 0 : r.some(function(e) {
                            return "FreeTrial" === e.offerType
                        })) && t;
                    return (0, T.jsx)("span", {
                        dangerouslySetInnerHTML: {
                            __html: c ? u : l
                        },
                        className: "text-body-large"
                    })
                };

            function dA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function dL(e) {
                if (Array.isArray(e)) return e
            }

            function dC() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function dk(e, t) {
                if (e) {
                    if ("string" == typeof e) return dA(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return dA(e, t)
                }
            }
            var dR = {
                    Neutral: "bg-shift-200",
                    Standard: "bg-shift-200",
                    Contrast: "bg-system-contrast",
                    Emphasis: "bg-system-emphasis",
                    Success: "bg-[rgb(from_var(--color-system-success)_r_g_b_/_0.2)]",
                    Warning: "bg-[rgb(from_var(--color-system-warning)_r_g_b_/_0.2)]",
                    Alert: "bg-[rgb(from_var(--color-system-alert)_r_g_b_/_0.2)]",
                    OverMedia: "bg-over-media-0"
                },
                dz = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-emphasis",
                    Warning: "content-emphasis",
                    Alert: "content-emphasis",
                    OverMedia: "content-emphasis"
                },
                dU = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-system-success",
                    Warning: "content-system-warning",
                    Alert: "content-system-alert",
                    OverMedia: "content-emphasis"
                },
                d_ = {
                    Neutral: "stroke-none",
                    Standard: "stroke-none",
                    Contrast: "stroke-none",
                    Emphasis: "stroke-none",
                    Success: "stroke-none",
                    Warning: "stroke-none",
                    Alert: "stroke-none",
                    OverMedia: "stroke-none"
                },
                dB = {
                    Small: "height-600",
                    XSmall: "height-400"
                },
                dF = {
                    Small: "padding-x-small",
                    XSmall: "padding-x-xsmall"
                },
                dY = {
                    Small: "width-600",
                    XSmall: "width-400"
                },
                dG = {
                    Small: "text-label-small",
                    XSmall: "text-caption-small"
                },
                dV = {
                    Small: "padding-y-xsmall",
                    XSmall: "padding-y-none"
                },
                dW = {
                    Small: "XSmall",
                    XSmall: "XSmall"
                },
                dQ = {
                    Pill: "radius-circle",
                    Box: "radius-small"
                },
                dq = tg().forwardRef(function(e, t) {
                    var r, n, i, o = dL(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || dk(r) || dC(),
                        a = o[0],
                        l = o.slice(1),
                        u = a.className,
                        c = a.label,
                        s = a.variant,
                        d = void 0 === s ? "Standard" : s,
                        f = a.icon,
                        p = a.iconPosition,
                        m = void 0 === p ? "Leading" : p,
                        y = a.size,
                        b = void 0 === y ? "Small" : y,
                        h = a.shape,
                        g = function(e, t) {
                            if (null == e) return {};
                            var r, n, i, o = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }
                            if (o = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, i = {},
                                        o = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                    return i
                                }(e, t), Object.getOwnPropertySymbols)
                                for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }(a, ["className", "label", "variant", "icon", "iconPosition", "size", "shape"]),
                        v = (dL(l) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(l) || dk(l, 1) || dC())[0],
                        w = f && !c,
                        x = "padding-x-xxsmall";
                    f && (x = "Leading" === m ? "padding-right-xxsmall" : "padding-left-xxsmall");
                    var j = f && tg().createElement(tI, {
                        name: f,
                        size: dW[b],
                        className: dU[d]
                    });
                    return tg().createElement("div", (n = function(e) {
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
                        ref: v
                    }, g), i = i = {
                        className: tv("foundation-web-badge flex items-center select-none gap-[var(--size-150)]", dQ[void 0 === h ? "Pill" : h], dB[b], w ? [dY[b], "justify-center"] : ["width-[fit-content]", dF[b]], dR[d], dz[d], d_[d], u)
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(i)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(i)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(i, e))
                    }), n), "Leading" === m && j, c && tg().createElement("span", {
                        className: tv("text-no-wrap text-truncate-split", dG[b], dV[b], x, dz[d])
                    }, c), "Trailing" === m && j)
                });
            dq.displayName = "Badge";
            var dK = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600"
                },
                dH = {
                    XSmall: "size-150",
                    Small: "size-200",
                    Medium: "size-250"
                },
                dX = {
                    XSmall: "size-1200",
                    Small: "size-1400",
                    Medium: "size-1600"
                },
                dZ = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium"
                },
                d$ = {
                    XSmall: void 0,
                    Small: "padding-top-xxsmall",
                    Medium: "padding-y-xxsmall"
                },
                dJ = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium"
                },
                d0 = {
                    XSmall: "padding-medium",
                    Small: "padding-large",
                    Medium: "padding-xlarge"
                },
                d1 = {
                    XSmall: "Small",
                    Small: "Medium",
                    Medium: "Large"
                },
                d2 = (0, th.forwardRef)(function(e, t) {
                    var r = e.layout,
                        n = e.size,
                        i = e.type,
                        o = e.isDisabled,
                        a = e.label,
                        l = e.description,
                        u = e.media,
                        c = e.icon,
                        s = e.metadata,
                        d = e.isSelected,
                        f = e.onSelect,
                        p = e.hideSelectedIndicator,
                        m = void 0 !== p && p,
                        y = (0, th.useMemo)(function() {
                            return a && tg().createElement("div", {
                                className: tv(dZ[n], d$[n], "content-emphasis text-align-x-start", "clip [display:-webkit-box] [-webkit-line-clamp:3] [-webkit-box-orient:vertical]")
                            }, a)
                        }, [a, n]),
                        b = (0, th.useMemo)(function() {
                            return s && tg().createElement("div", {
                                className: tv("text-caption-small content-default text-align-x-start", "text-truncate-split text-no-wrap width-full")
                            }, s)
                        }, [s]),
                        h = (0, th.useMemo)(function() {
                            return l && tg().createElement("div", {
                                className: tv(dJ[n], "content-default text-align-x-start")
                            }, l)
                        }, [l, n]),
                        g = (0, th.useMemo)(function() {
                            return c && tg().createElement(tI, {
                                name: c,
                                size: d1[n]
                            })
                        }, [c, n]),
                        v = (0, th.useMemo)(function() {
                            switch (i) {
                                case "Checkmark":
                                    return d && tg().createElement(tI, {
                                        name: "icon-filled-check",
                                        size: d1[n]
                                    });
                                case "Checkbox":
                                    return tg().createElement("div", {
                                        className: tv(dK[n], "flex items-center justify-center radius-small padding-none content-default", d ? "stroke-none" : "stroke-standard stroke-emphasis", d ? "bg-system-contrast" : "bg-none")
                                    }, d && tg().createElement("div", {
                                        className: tv(dK[n], "content-inverse-emphasis icon icon-filled-check")
                                    }));
                                case "Radio":
                                    return tg().createElement("div", {
                                        className: tv(dK[n], "radius-circle flex items-center justify-center stroke-emphasis stroke-standard", d ? "bg-system-contrast" : "bg-none")
                                    }, d && tg().createElement("div", {
                                        className: tv("radius-circle bg-inverse-action-sub-emphasis", dH[n])
                                    }));
                                default:
                                    return console.error("Invalid OptionSelector type ".concat(i)), null
                            }
                        }, [i, n, d]),
                        w = (0, th.useMemo)(function() {
                            return u && tg().createElement("div", {
                                className: tv(dX[n], "flex items-center justify-center clip shrink-0")
                            }, u)
                        }, [u, n]),
                        x = (0, th.useMemo)(function() {
                            var e = !m && tg().createElement("div", {
                                className: dK[n]
                            }, v);
                            switch (r) {
                                case "Horizontal":
                                    return tg().createElement("div", {
                                        className: "flex gap-large"
                                    }, w, tg().createElement("div", {
                                        className: "flex flex-col gap-xsmall fill clip"
                                    }, tg().createElement("div", {
                                        className: "flex gap-small items-start"
                                    }, tg().createElement("div", {
                                        className: "flex flex-col items-start fill clip"
                                    }, tg().createElement("div", {
                                        className: "flex gap-small items-center width-full"
                                    }, g, y), b), e), h));
                                case "Vertical":
                                    return tg().createElement("div", {
                                        className: "flex flex-col gap-xsmall"
                                    }, tg().createElement("div", {
                                        className: "flex gap-small"
                                    }, tg().createElement("div", {
                                        className: "flex flex-col gap-medium fill min-width-0"
                                    }, w, tg().createElement("div", {
                                        className: "flex flex-col gap-xsmall"
                                    }, g, y, b)), e), h);
                                default:
                                    return console.error("Invalid OptionSelector layout ".concat(r)), null
                            }
                        }, [r, w, g, y, h, v, n, b, m]);
                    return tg().createElement("button", {
                        type: "button",
                        className: tv(tM, "focus:outline-focus bg-none width-full radius-medium stroke-standard", d ? "stroke-system-contrast" : "stroke-contrast-alpha", d0[n], o && "opacity-[0.5]", !o && "cursor-pointer"),
                        disabled: o,
                        ref: t,
                        onClick: function() {
                            return f()
                        }
                    }, !o && tg().createElement(tP, null), x)
                });
            d2.displayName = "OptionSelector";
            var d4 = function(e, t) {
                    switch (e) {
                        case 1:
                            return t("Label.BillingPeriodMonthly");
                        case 3:
                            return t("Label.BillingPeriodThreeMonths");
                        case 6:
                            return t("Label.BillingPeriodSixMonths");
                        case 12:
                            return t("Label.BillingPeriodYearly");
                        default:
                            var r, n;
                            return t((n = null != (r = rp[e3]) ? r : rp.Month, 1 === e ? n.singular : n.plural), {
                                periodCount: e
                            })
                    }
                },
                d3 = function(e) {
                    var t, r = e.option,
                        n = e.isSelected,
                        i = e.isBestValue,
                        o = e.onSelect,
                        a = (0, E.useTranslation)(),
                        l = a.translate,
                        u = a.intl,
                        c = function(e) {
                            var t = e.amount,
                                r = e.currencyCode;
                            return u.n(t, {
                                style: "currency",
                                currency: r
                            })
                        },
                        s = ry(r),
                        d = c({
                            amount: r.price.amount / r.months,
                            currencyCode: r.price.currencyCode
                        });
                    r.months > 1 && (t = void 0 === s ? l("Action.PricePerMonth", {
                        price: d,
                        periodType: e3
                    }) : l("Label.BillingPeriodSavings", {
                        pricePerMonth: d,
                        savingsPercent: u.n(s / 100, {
                            style: "percent"
                        })
                    }));
                    var f = (0, T.jsxs)("div", {
                        className: "width-full min-height-1000 gap-small flex flex-row items-center justify-between",
                        children: [(0, T.jsxs)("div", {
                            className: "min-width-0 flex flex-col items-start",
                            children: [(0, T.jsxs)("div", {
                                className: "gap-xsmall flex flex-row items-center",
                                children: [(0, T.jsx)("span", {
                                    className: "text-title-medium content-emphasis",
                                    children: d4(r.months, l)
                                }), i && (0, T.jsx)(dq, {
                                    label: l("Label.BestValue"),
                                    size: "XSmall",
                                    variant: "Neutral"
                                })]
                            }), t && (0, T.jsx)("span", {
                                className: "text-body-medium content-default",
                                children: t
                            })]
                        }), (0, T.jsxs)("div", {
                            className: "gap-small flex shrink-0 flex-row items-center",
                            children: [void 0 !== s && r.strikethroughPrice && (0, T.jsx)("span", {
                                className: "text-label-medium line-through [color:var(--color-extended-gray-600)]",
                                children: c(r.strikethroughPrice)
                            }), (0, T.jsx)("span", {
                                className: "text-label-medium content-emphasis",
                                children: c(r.price)
                            })]
                        })]
                    });
                    return (0, T.jsx)("div", {
                        "data-testid": "billing-period-option-".concat(r.productId),
                        children: (0, T.jsx)(d2, {
                            hideSelectedIndicator: !0,
                            isSelected: n,
                            label: void 0,
                            layout: "Horizontal",
                            metadata: f,
                            size: "XSmall",
                            type: "Checkmark",
                            onSelect: o
                        })
                    })
                },
                d5 = {
                    featureName: "SubscriptionsCommon",
                    team: "Economy > Payments & Fraud > Subscriptions",
                    features: {
                        billingPeriodSheet: {
                            counters: [{
                                name: "BillingPeriodSheetShown",
                                dimensions: ["viewName", "termMonths"]
                            }, {
                                name: "BillingPeriodOptionSelected",
                                dimensions: ["viewName", "months"]
                            }, {
                                name: "BillingPeriodSubscribeClick",
                                dimensions: ["viewName", "months", "isFreeTrial"]
                            }, {
                                name: "BillingPeriodSheetDismissed",
                                dimensions: ["viewName", "months"]
                            }]
                        }
                    }
                },
                d6 = dc(d5, {
                    publish: a6(d5.featureName)
                }).trackCounter;

            function d8(e) {
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

            function d9(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }
            var d7 = dn().ENUM_PURCHASE_EVENT_TYPE,
                fe = dn().ENUM_VIEW_MESSAGE,
                ft = function(e, t, r, n) {
                    var i = e.analyticsContext,
                        o = e.paymentSessionId;
                    dn().sendUserPurchaseFlowEvent(i.triggeringContext, !1, i.viewName, t, r, o ? d9(d8({}, n), {
                        paymentSessionId: o
                    }) : n)
                },
                fr = function(e) {
                    return {
                        productId: e.productId,
                        months: String(e.months)
                    }
                },
                fn = function(e, t) {
                    var r = t.map(function(e) {
                        return e.months
                    }).sort(function(e, t) {
                        return e - t
                    }).join(",");
                    ft(e, d7.VIEW_SHOWN, fe.ROBLOX_PLUS_BILLING_PERIOD_SHEET_OPENED, {
                        termMonths: r
                    }), d6("BillingPeriodSheetShown", {
                        viewName: e.analyticsContext.viewName,
                        termMonths: r
                    })
                },
                fi = function(e, t) {
                    ft(e, d7.USER_INPUT, fe.ROBLOX_PLUS_BILLING_PERIOD_SELECTED, fr(t)), d6("BillingPeriodOptionSelected", {
                        viewName: e.analyticsContext.viewName,
                        months: String(t.months)
                    })
                },
                fo = function(e, t) {
                    var r = void 0 !== t.freeTrialEndDate;
                    ft(e, d7.USER_INPUT, r ? fe.ROBLOX_PLUS_FREE_TRIAL : fe.ROBLOX_PLUS_SUBSCRIBE, d9(d8({}, fr(t)), {
                        isFreeTrial: String(r)
                    })), d6("BillingPeriodSubscribeClick", {
                        viewName: e.analyticsContext.viewName,
                        months: String(t.months),
                        isFreeTrial: String(r)
                    })
                },
                fa = function(e, t) {
                    ft(e, d7.USER_INPUT, fe.ROBLOX_PLUS_BILLING_PERIOD_SHEET_DISMISSED, fr(t)), d6("BillingPeriodSheetDismissed", {
                        viewName: e.analyticsContext.viewName,
                        months: String(t.months)
                    })
                };

            function fl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var fu = [{
                    opening: "linkStart",
                    closing: "linkEnd",
                    render: function(e) {
                        return (0, T.jsx)("a", {
                            className: "underline",
                            href: tm,
                            rel: "noopener noreferrer",
                            target: "_blank",
                            children: e
                        })
                    }
                }],
                fc = function(e) {
                    var t, r, n = e.isOpen,
                        i = e.onOpenChange,
                        o = e.options,
                        a = e.analyticsContext,
                        l = e.deviceMeta,
                        u = e.paymentSessionId,
                        c = e.referrerId,
                        s = e.isDisabled,
                        d = e.onOptionSelect,
                        f = e.onSubscribeClick,
                        p = e.onMobilePurchaseInitiated,
                        m = (0, E.useTranslation)().translate,
                        y = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, th.useState)()) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return fl(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return fl(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        b = y[0],
                        h = y[1],
                        g = (0, th.useRef)(!1),
                        v = (0, th.useMemo)(function() {
                            var e;
                            return o.forEach(function(t) {
                                var r = ry(t);
                                void 0 !== r && (!e || r > e.savings || r === e.savings && t.months > e.months) && (e = {
                                    productId: t.productId,
                                    savings: r,
                                    months: t.months
                                })
                            }), null == e ? void 0 : e.productId
                        }, [o]);
                    (0, th.useEffect)(function() {
                        if (!n) {
                            g.current = !1;
                            return
                        }!g.current && 0 !== o.length && u && (g.current = !0, fn({
                            analyticsContext: a,
                            paymentSessionId: u
                        }, o))
                    }, [a, n, o, u]);
                    var w = null != (r = o.find(function(e) {
                        return e.productId === b
                    })) ? r : o[0];
                    if (!w) return null;
                    var x = {
                            analyticsContext: a,
                            paymentSessionId: u
                        },
                        j = w.freeTrialEndDate,
                        O = void 0 === j ? ls(m, "Description.SubscriptionLegalBillingCycle", fu) : ls(m, "Description.SubscriptionFreeTrialLegal", fu, {
                            date: j.toLocaleDateString(void 0, {
                                year: "numeric",
                                month: "long",
                                day: "numeric"
                            })
                        });
                    return (0, T.jsx)(so, {
                        open: n,
                        onOpenChange: function(e) {
                            e || fa(x, w), i(e)
                        },
                        children: (0, T.jsxs)(sa, {
                            centerSheetSize: "Medium",
                            closeLabel: m("Action.Close"),
                            largeScreenVariant: "center",
                            children: [(0, T.jsx)(su, {
                                children: m("Heading.ChooseBillingPeriod")
                            }), (0, T.jsxs)(sl, {
                                className: "gap-y-xxlarge padding-bottom-medium flex flex-col",
                                "data-testid": "billing-period-sheet-body",
                                children: [(0, T.jsx)("p", {
                                    className: "text-body-medium content-default",
                                    children: m("Description.ChooseBillingPeriod")
                                }), (0, T.jsx)("div", {
                                    className: "gap-y-medium flex flex-col",
                                    children: o.map(function(e) {
                                        return (0, T.jsx)(d3, {
                                            isBestValue: e.productId === v,
                                            isSelected: e.productId === w.productId,
                                            option: e,
                                            onSelect: function() {
                                                e.productId !== w.productId && fi(x, e), h(e.productId), null == d || d(e)
                                            }
                                        }, e.productId)
                                    })
                                })]
                            }), (0, T.jsx)(sc, {
                                children: (0, T.jsxs)("div", {
                                    className: "gap-y-medium flex flex-col",
                                    children: [(0, T.jsx)(sN, {
                                        className: "width-full",
                                        deviceMeta: l,
                                        isDisabled: void 0 !== s && s,
                                        paymentSessionId: u,
                                        productId: w.productId,
                                        productType: w.productType,
                                        referrerId: c,
                                        size: "Medium",
                                        trackSubscriptionButtonClick: function() {
                                            fo(x, w), null == f || f(w)
                                        },
                                        onMobilePurchaseInitiated: p,
                                        children: m(void 0 === j ? "Action.Subscribe" : "Action.TryItForFree")
                                    }), (0, T.jsx)("p", {
                                        className: "text-body-small content-default text-align-x-left",
                                        "data-testid": "billing-period-legal-footer",
                                        children: O
                                    })]
                                })
                            })]
                        })
                    })
                },
                fs = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                fd = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                ff = function(e) {
                    var t = e.variant,
                        r = e.size,
                        n = e.isCircular,
                        i = e.className,
                        o = function(e, t) {
                            if (null == e) return {};
                            var r, n, i, o = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }
                            if (o = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, i = {},
                                        o = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                    return i
                                }(e, t), Object.getOwnPropertySymbols)
                                for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }(e, ["variant", "size", "isCircular", "className"]);
                    return tg().createElement("button", function(e) {
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
                        className: tv("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", tM, fd[t], fs[r], n && "radius-circle", i)
                    }, o), tg().createElement(tP, null), tg().createElement(tI, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function fp(e) {
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

            function fm(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }
            var fy = (0, th.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                fb = function() {
                    var e = (0, th.useContext)(fy);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                fh = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                fg = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                fv = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                fw = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.children,
                        i = e.size,
                        o = e.type,
                        a = void 0 === o ? "Default" : o,
                        l = e.isModal,
                        u = e.hasCloseAffordance,
                        c = e.closeLabel,
                        s = e.hasMarginTop,
                        d = void 0 === s || s,
                        f = e.hasMarginBottom,
                        p = void 0 === f || f,
                        m = e.hasDescription,
                        y = void 0 !== m && m,
                        b = e.experimentalDisablePointerEventsStylingOnBody,
                        h = void 0 !== b && b,
                        g = (0, th.useMemo)(function() {
                            return {
                                size: i,
                                isModal: l,
                                type: a,
                                hasCloseAffordance: u,
                                closeLabel: c,
                                hasMarginTop: d,
                                hasMarginBottom: p,
                                hasDescription: y
                            }
                        }, [i, l, a, u, c, d, p, y]);
                    return (0, th.useEffect)(function() {
                        h && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [h, t]), tg().createElement(fy.Provider, {
                        value: g
                    }, tg().createElement(cs, {
                        open: t,
                        onOpenChange: r
                    }, n))
                };
            fw.displayName = "Dialog";
            var fx = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.style,
                    i = e.overlayClassName,
                    o = e.overlayStyle,
                    a = e.onOpenAutoFocus,
                    l = fm(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    u = fb(),
                    c = u.size,
                    s = u.isModal,
                    d = u.hasCloseAffordance,
                    f = u.closeLabel,
                    p = u.hasDescription,
                    m = tv("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", s && "bg-common-backdrop", i),
                    y = tv("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return tg().createElement(cb, null, tg().createElement(cg, {
                    className: m,
                    style: o
                }, tg().createElement(cj, fp({
                    className: y,
                    "data-size": c,
                    style: n,
                    onOpenAutoFocus: a
                }, !p && {
                    "aria-describedby": void 0
                }, l), d && tg().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, tg().createElement(cE, {
                    asChild: !0
                }, tg().createElement(ff, {
                    variant: "OverMedia",
                    size: c,
                    isCircular: !0,
                    "aria-label": f
                }))), t)))
            };
            fx.displayName = "DialogContent";
            var fj = function(e) {
                var t = e.children,
                    r = e.className,
                    n = fm(e, ["children", "className"]),
                    i = fb(),
                    o = i.size,
                    a = i.hasMarginTop,
                    l = i.hasMarginBottom,
                    u = tv(fh[o], a && fg[o], l && fv[o], r);
                return tg().createElement("div", fp({
                    className: u
                }, n), t)
            };
            fj.displayName = "DialogBody";
            var fO = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.hidden,
                    i = fm(e, ["children", "className", "hidden"]),
                    o = tg().createElement(cP, fp({
                        className: r
                    }, i), t);
                return n ? tg().createElement(c1, null, o) : o
            };
            fO.displayName = "DialogTitle";
            var fS = function(e) {
                var t = e.children,
                    r = e.className,
                    n = fm(e, ["children", "className"]),
                    i = fb().size,
                    o = tv(fh[i], fv[i], r);
                return tg().createElement("div", fp({
                    className: o
                }, n), t)
            };
            fS.displayName = "DialogFooter";
            var fI = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.title,
                        i = e.body,
                        o = (0, E.useTranslation)().translate;
                    return (0, T.jsx)(fw, {
                        closeLabel: o("Action.Close"),
                        hasCloseAffordance: !0,
                        isModal: !0,
                        open: t,
                        size: "Small",
                        type: "Default",
                        onOpenChange: r,
                        children: (0, T.jsxs)(fx, {
                            className: "stroke-standard stroke-default flex flex-col items-start",
                            style: {
                                width: "100%",
                                maxWidth: 320
                            },
                            children: [(0, T.jsxs)(fj, {
                                className: "width-full gap-small padding-top-medium padding-x-xlarge padding-bottom-large flex flex-col items-start",
                                children: [(0, T.jsx)(fO, {
                                    className: "margin-none text-heading-small content-emphasis text-align-x-start",
                                    children: n
                                }), (0, T.jsx)("p", {
                                    className: "margin-none text-body-medium content-default text-align-x-start whitespace-pre-line",
                                    children: i
                                })]
                            }), (0, T.jsx)(fS, {
                                className: "width-full",
                                children: (0, T.jsx)(t4, {
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
                },
                fM = r(611),
                fP = r.n(fM);

            function fN() {}
            var fT = (0, th.createContext)({
                itemCount: 0,
                currentPage: -1,
                canNext: !1,
                canPrev: !1,
                allVisible: !0,
                goTo: fN,
                next: fN,
                prev: fN,
                registerItem: function() {
                    return fN
                }
            });

            function fE(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function fD(e, t) {
                if (e) {
                    if ("string" == typeof e) return fE(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return fE(e, t)
                }
            }
            var fA = (0, th.createContext)(null),
                fL = 0,
                fC = {
                    position: "absolute",
                    top: "50%",
                    left: 0,
                    transform: "translateY(-50%)",
                    zIndex: 10
                },
                fk = {
                    position: "absolute",
                    top: "50%",
                    right: 0,
                    transform: "translateY(-50%)",
                    zIndex: 10
                },
                fR = {
                    borderRadius: "9999px",
                    border: "none",
                    padding: 0,
                    cursor: "pointer",
                    transition: "opacity var(--time-100) var(--ease-linear)"
                };

            function fz(e, t) {
                return "Page ".concat(String(e + 1), " of ").concat(String(t))
            }
            var fU = Object.assign(function(e) {
                    var t, r, n, i = e.children,
                        o = e.className,
                        a = e.ariaLabel,
                        l = (0, th.useRef)(null),
                        u = (0, th.useRef)(new Map),
                        c = (0, th.useRef)(null),
                        s = (function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, th.useState)(0)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(t) || fD(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[1],
                        d = (0, th.useCallback)(function() {
                            s(function(e) {
                                return e + 1
                            })
                        }, []),
                        f = [],
                        p = 0;
                    u.current.forEach(function(e) {
                        e.isVisible && f.push(p), p += 1
                    });
                    var m = u.current.size,
                        y = f.length,
                        b = null != (r = f[0]) ? r : -1,
                        h = null != (n = f.at(-1)) ? n : -1,
                        g = b > 0,
                        v = h >= 0 && h < m - 1,
                        w = m > 0 && y === m,
                        x = (0, th.useCallback)(function(e) {
                            var t, r = (function(e) {
                                if (Array.isArray(e)) return fE(e)
                            }(t = u.current.values()) || function(e) {
                                if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                            }(t) || fD(t) || function() {
                                throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }())[e];
                            null != r && null != l.current && l.current.scrollTo({
                                left: r.element.offsetLeft - l.current.offsetLeft,
                                behavior: "smooth"
                            })
                        }, []),
                        j = (0, th.useCallback)(function() {
                            x(h >= 0 ? Math.min(m - 1, h + 1) : 0)
                        }, [x, m, h]),
                        O = (0, th.useCallback)(function() {
                            b <= 0 ? x(0) : x(Math.max(0, b - Math.max(1, y)))
                        }, [b, x, y]),
                        S = (0, th.useCallback)(function(e, t) {
                            var r;
                            return u.current.set(e, {
                                    element: t,
                                    isVisible: !1
                                }), null == (r = c.current) || r.observe(t), d(),
                                function() {
                                    var r;
                                    null == (r = c.current) || r.unobserve(t), u.current.delete(e), d()
                                }
                        }, [d]);
                    (0, th.useEffect)(function() {
                        var e = l.current;
                        if (null != e && "u" > typeof IntersectionObserver) {
                            var t = new IntersectionObserver(function(e) {
                                var t = [];
                                e.forEach(function(e) {
                                    var r = e.target,
                                        n = e.intersectionRatio;
                                    u.current.forEach(function(e, i) {
                                        if (e.element === r) {
                                            var o = n >= .6;
                                            e.isVisible !== o && (u.current.set(i, {
                                                element: e.element,
                                                isVisible: o
                                            }), t.push(!0))
                                        }
                                    })
                                }), t.length > 0 && d()
                            }, {
                                root: e,
                                threshold: [0, .6, 1]
                            });
                            return c.current = t, u.current.forEach(function(e) {
                                    t.observe(e.element)
                                }),
                                function() {
                                    t.disconnect(), c.current = null
                                }
                        }
                    }, [d]);
                    var I = (0, th.useMemo)(function() {
                        return {
                            itemCount: m,
                            currentPage: b,
                            canPrev: g,
                            canNext: v,
                            allVisible: w,
                            goTo: x,
                            next: j,
                            prev: O,
                            registerItem: S
                        }
                    }, [w, v, g, b, x, m, j, O, S]);
                    return (0, T.jsx)(fT.Provider, {
                        value: I,
                        children: (0, T.jsx)(fA.Provider, {
                            value: l,
                            children: (0, T.jsx)("div", {
                                "aria-label": a,
                                className: fP()("relative min-width-0 clip-x", o),
                                "data-testid": "carousel-root",
                                role: null != a ? "region" : void 0,
                                children: i
                            })
                        })
                    })
                }, {
                    Track: function(e) {
                        var t, r, n = e.className,
                            i = e.children,
                            o = e.gap,
                            a = function(e, t) {
                                if (null == e) return {};
                                var r, n, i, o = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                    return o
                                }
                                if (o = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, i = {},
                                            o = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                        return i
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }(e, ["className", "children", "gap"]),
                            l = (0, th.useContext)(fA),
                            u = (0, th.useCallback)(function(e) {
                                null != l && (l.current = e)
                            }, [l]);
                        return (0, T.jsx)("div", (t = function(e) {
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
                            ref: u,
                            className: fP()("flex flex-row min-width-0 width-full scroll-x", "large" === (void 0 === o ? "medium" : o) ? "gap-large" : "gap-medium", n),
                            "data-testid": "carousel-track",
                            style: {
                                scrollSnapType: "x mandatory",
                                scrollBehavior: "smooth",
                                scrollbarWidth: "none"
                            }
                        }, a), r = r = {
                            children: i
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(r)) : (function(e) {
                            var t = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                t.push.apply(t, r)
                            }
                            return t
                        })(Object(r)).forEach(function(e) {
                            Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(r, e))
                        }), t))
                    },
                    Item: function(e) {
                        var t, r, n = e.className,
                            i = e.children,
                            o = function(e, t) {
                                if (null == e) return {};
                                var r, n, i, o = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                    return o
                                }
                                if (o = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, i = {},
                                            o = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                        return i
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }(e, ["className", "children"]),
                            a = (0, th.useContext)(fT).registerItem,
                            l = (0, th.useRef)(null),
                            u = (0, th.useRef)("");
                        return "" === u.current && (fL += 1, u.current = "carousel-item-".concat(String(fL))), (0, th.useEffect)(function() {
                            var e = l.current;
                            if (null != e) return a(u.current, e)
                        }, [a]), (0, T.jsx)("div", (t = function(e) {
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
                            ref: l,
                            className: fP()("carousel-item shrink-0", n),
                            style: {
                                scrollSnapAlign: "start"
                            }
                        }, o), r = r = {
                            children: i
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(r)) : (function(e) {
                            var t = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                t.push.apply(t, r)
                            }
                            return t
                        })(Object(r)).forEach(function(e) {
                            Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(r, e))
                        }), t))
                    },
                    PrevButton: function(e) {
                        var t = e.ariaLabel,
                            r = e.className,
                            n = (0, th.useContext)(fT),
                            i = n.canPrev,
                            o = n.prev;
                        return i ? (0, T.jsx)(lM, {
                            ariaLabel: t,
                            className: fP()(r),
                            "data-testid": "carousel-prev-button",
                            icon: "icon-filled-chevron-large-left",
                            isCircular: !0,
                            onClick: o,
                            size: "Medium",
                            style: fC,
                            variant: "OverMedia"
                        }) : null
                    },
                    NextButton: function(e) {
                        var t = e.ariaLabel,
                            r = e.className,
                            n = (0, th.useContext)(fT),
                            i = n.canNext,
                            o = n.next;
                        return i ? (0, T.jsx)(lM, {
                            ariaLabel: t,
                            className: fP()(r),
                            "data-testid": "carousel-next-button",
                            icon: "icon-filled-chevron-large-right",
                            isCircular: !0,
                            onClick: o,
                            size: "Medium",
                            style: fk,
                            variant: "OverMedia"
                        }) : null
                    },
                    Indicator: function(e) {
                        var t = e.className,
                            r = e.formatDotLabel,
                            n = void 0 === r ? fz : r,
                            i = (0, th.useContext)(fT),
                            o = i.itemCount,
                            a = i.currentPage,
                            l = i.allVisible,
                            u = i.goTo;
                        return o <= 1 || l ? null : (0, T.jsx)("div", {
                            className: fP()("flex flex-row items-center justify-center gap-small", t),
                            "data-testid": "carousel-indicator",
                            role: "tablist",
                            children: Array.from({
                                length: o
                            }, function(e, t) {
                                var r, i, l = t === a;
                                return (0, T.jsx)("button", {
                                    "aria-label": n(t, o),
                                    "aria-selected": l,
                                    className: "content-emphasis size-[8px]",
                                    "data-testid": "carousel-indicator-dot-".concat(String(t)),
                                    onClick: function() {
                                        u(t)
                                    },
                                    role: "tab",
                                    style: (r = function(e) {
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
                                    }({}, fR), i = i = {
                                        opacity: l ? 1 : .22
                                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(i)) : (function(e) {
                                        var t = Object.keys(e);
                                        if (Object.getOwnPropertySymbols) {
                                            var r = Object.getOwnPropertySymbols(e);
                                            t.push.apply(t, r)
                                        }
                                        return t
                                    })(Object(i)).forEach(function(e) {
                                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(i, e))
                                    }), r),
                                    type: "button"
                                }, t)
                            })
                        })
                    }
                }),
                f_ = function(e, t) {
                    var r = (0, E.useTranslation)().intl;
                    return (0, th.useMemo)(function() {
                        if (e) return r.n(rm(e), function(e) {
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
                fB = function(e) {
                    var t = e.icon,
                        r = e.text;
                    return (0, T.jsxs)("div", {
                        className: "gap-x-medium flex flex-row items-center",
                        children: [(0, T.jsx)(tI, {
                            name: t,
                            size: "Medium"
                        }), (0, T.jsx)("span", {
                            className: "text-body-medium content-default",
                            children: r
                        })]
                    })
                },
                fF = function(e) {
                    var t, r, n = e.product,
                        i = e.buttonProps,
                        o = e.trackSubscribeClick,
                        a = (0, E.useTranslation)(),
                        l = a.translate,
                        u = a.intl,
                        c = rh(n),
                        s = f_(n.localizedPrice),
                        d = f_(n.localizedStrikethroughPrice);
                    return (0, T.jsxs)("div", {
                        className: "bg-surface-100 padding-medium radius-large gap-y-small height-full flex flex-col",
                        "data-testid": "plus-bundle-card-".concat(n.productKey.id),
                        children: [(0, T.jsxs)("div", {
                            className: "gap-x-large flex flex-row items-center justify-between",
                            children: [(0, T.jsx)("span", {
                                className: "text-label-large content-emphasis text-truncate-end",
                                children: l("Label.PlusBundleName", {
                                    robuxAmount: String(c)
                                })
                            }), (0, T.jsxs)("div", {
                                className: "gap-x-small flex flex-row items-center",
                                children: [d && (0, T.jsx)("span", {
                                    className: "text-title-medium text-no-wrap line-through [color:var(--color-extended-gray-600)]",
                                    children: d
                                }), (0, T.jsx)("span", {
                                    className: "text-title-medium content-emphasis text-no-wrap",
                                    children: s
                                })]
                            })]
                        }), (0, T.jsxs)("div", {
                            className: "gap-y-large flex flex-col",
                            children: [(0, T.jsxs)("div", {
                                className: "gap-y-small padding-top-small flex flex-col",
                                children: [(0, T.jsx)(fB, {
                                    icon: "icon-regular-roblox-plus",
                                    text: l("Description.Benefit.AllPlus.V2")
                                }), (0, T.jsx)(fB, {
                                    icon: "icon-regular-robux",
                                    text: l("Description.Benefit.RobuxAllowance", {
                                        amount: u.n(c)
                                    })
                                }), d && (0, T.jsx)(fB, {
                                    icon: "icon-regular-pig",
                                    text: l("Description.Benefit.BetterValue.V2", {
                                        oldAmount: d
                                    })
                                })]
                            }), (0, T.jsx)(sN, (t = function(e) {
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
                            }({}, i), r = r = {
                                className: "width-full",
                                productId: n.productKey.id,
                                productType: n.productKey.type,
                                size: "Medium",
                                trackSubscriptionButtonClick: function() {
                                    o(n)
                                },
                                variant: "Standard",
                                children: rw(n) ? l("Action.TryItForFree") : l("Label.PricePerMonth", {
                                    price: s
                                })
                            }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(r)) : (function(e) {
                                var t = Object.keys(e);
                                if (Object.getOwnPropertySymbols) {
                                    var r = Object.getOwnPropertySymbols(e);
                                    t.push.apply(t, r)
                                }
                                return t
                            })(Object(r)).forEach(function(e) {
                                Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(r, e))
                            }), t))]
                        })]
                    })
                },
                fY = function(e) {
                    var t = e.bundles,
                        r = e.buttonProps,
                        n = e.trackSubscribeClick,
                        i = (0, E.useTranslation)().translate,
                        o = i("Heading.GetRobuxEveryMonth"),
                        a = "dark" === (0, E.useTheme)() ? "light-theme" : "dark-theme";
                    return (0, T.jsxs)("div", {
                        className: "gap-y-large flex flex-col",
                        "data-testid": "plus-bundle-cards",
                        children: [(0, T.jsxs)("div", {
                            className: "gap-y-xxsmall flex flex-col",
                            children: [(0, T.jsx)("span", {
                                className: "text-heading-small",
                                children: o
                            }), (0, T.jsx)("span", {
                                className: "text-body-medium content-default",
                                children: i("Description.GetRobuxEveryMonth")
                            })]
                        }), (0, T.jsxs)(fU, {
                            ariaLabel: o,
                            className: "margin-x-[calc(var(--padding-xxlarge)*-1)] large:margin-x-none self-stretch",
                            children: [(0, T.jsx)("div", {
                                className: a,
                                children: (0, T.jsx)(fU.PrevButton, {
                                    ariaLabel: "Previous bundle",
                                    className: "medium:flex hidden"
                                })
                            }), (0, T.jsx)(fU.Track, {
                                className: "padding-x-xxlarge large:padding-x-none large:[scroll-padding-inline:0] [scroll-padding-inline:var(--padding-xxlarge)]",
                                gap: "large",
                                children: t.map(function(e) {
                                    return (0, T.jsx)(fU.Item, {
                                        className: "width-[313px] medium:width-[240px] flex flex-col",
                                        children: (0, T.jsx)(fF, {
                                            buttonProps: r,
                                            product: e,
                                            trackSubscribeClick: n
                                        })
                                    }, e.productKey.id)
                                })
                            }), (0, T.jsx)("div", {
                                className: a,
                                children: (0, T.jsx)(fU.NextButton, {
                                    ariaLabel: "Next bundle",
                                    className: "medium:flex hidden"
                                })
                            }), (0, T.jsx)(fU.Indicator, {
                                className: "padding-top-medium medium:hidden"
                            })]
                        })]
                    })
                },
                fG = window.Roblox["core-scripts"].deepLink,
                fV = {
                    itemId: 0x4b45c0ee905a,
                    itemType: fG.ItemType.Asset
                },
                fW = function(e) {
                    var t = e.itemId,
                        r = e.itemType;
                    return "roblox://navigation/item_details?itemId=".concat(t, "&itemType=").concat(r)
                },
                fQ = function(e) {
                    return (0, fG.navigateToDeepLink)(fW(e))
                };

            function fq(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function fK(e) {
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

            function fH(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function fX(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return fq(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return fq(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var fZ = {
                    enabled: !1,
                    arrivedGiftDate: new Date(2026, 7, 14)
                },
                f$ = function(e) {
                    var t, r, n, i = e.deviceMeta,
                        o = e.robloxSubscriptionProducts,
                        a = e.isEntrypointDisabled,
                        l = e.onMobilePurchaseInitiated,
                        u = (0, E.useTranslation)().translate,
                        c = (null != (t = function() {
                            var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                            return function() {
                                var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0],
                                    t = dO((0, th.useState)(e ? void 0 : de().getLocalStorage(dS)), 2),
                                    r = t[0],
                                    n = t[1],
                                    i = dO((0, th.useState)(!1), 2),
                                    o = i[0],
                                    a = i[1],
                                    l = (0, th.useCallback)(function(e) {
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
                                                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                                    l = Object.defineProperty;
                                                return l(a, "next", {
                                                    value: u(0)
                                                }), l(a, "throw", {
                                                    value: u(1)
                                                }), l(a, "return", {
                                                    value: u(2)
                                                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                                                    value: function() {
                                                        return this
                                                    }
                                                }), a;

                                                function u(l) {
                                                    return function(u) {
                                                        var c = [l, u];
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
                                                        return [4, dv(function() {
                                                            return dw(this, function(t) {
                                                                return [2, dh({
                                                                    method: "GET",
                                                                    url: "".concat(aS.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions/").concat(e),
                                                                    config: {
                                                                        withCredentials: !0
                                                                    },
                                                                    eventCounterProps: {
                                                                        call: "GetPaymentSession"
                                                                    }
                                                                }).then(function(e) {
                                                                    return e.data
                                                                }).catch(function() {})]
                                                            })
                                                        })()];
                                                    case 1:
                                                        return r = i.sent(), [3, 4];
                                                    case 2:
                                                        return [4, dv(function() {
                                                            return dw(this, function(e) {
                                                                return [2, dh({
                                                                    method: "POST",
                                                                    url: "".concat(aS.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions"),
                                                                    data: {
                                                                        paymentFlowId: dn().getPaymentFlowUuid()
                                                                    },
                                                                    config: {
                                                                        withCredentials: !0
                                                                    },
                                                                    eventCounterProps: {
                                                                        call: "CreatePaymentSession"
                                                                    }
                                                                }).then(function(e) {
                                                                    return e.data
                                                                }).catch(function() {})]
                                                            })
                                                        })()];
                                                    case 3:
                                                        r = i.sent(), i.label = 4;
                                                    case 4:
                                                        if (!(t = r)) return [2];
                                                        return de().setLocalStorage(dS, t.paymentSession), n(t.paymentSession), [2]
                                                }
                                            })
                                        }, function() {
                                            var e = this,
                                                r = arguments;
                                            return new Promise(function(n, i) {
                                                var o = t.apply(e, r);

                                                function a(e) {
                                                    dj(o, n, i, a, l, "next", e)
                                                }

                                                function l(e) {
                                                    dj(o, n, i, a, l, "throw", e)
                                                }
                                                a(void 0)
                                            })
                                        })()
                                    }, []);
                                return (0, th.useEffect)(function() {
                                    if (r) {
                                        new Date(r.expiresAt) < new Date && (a(!0), l());
                                        return
                                    }
                                    var e, t = null == (e = dt.urlService.getQueryParam("paymentSessionId")) ? void 0 : e.toString();
                                    t || a(!0), l(t)
                                }, [l, r]), (0, th.useMemo)(function() {
                                    return {
                                        paymentSession: r,
                                        wasCreatedByCurrentClient: o
                                    }
                                }, [r, o])
                            }(e).paymentSession
                        }()) ? t : {}).id,
                        s = (0, th.useMemo)(function() {
                            return dM(window.location.search)
                        }, []),
                        d = "invite" === s.kind ? s.referrerId : void 0,
                        f = o[0],
                        p = fX((0, th.useState)(!1), 2),
                        m = p[0],
                        y = p[1],
                        b = (0, th.useMemo)(function() {
                            return fZ.arrivedGiftDate.toLocaleDateString(void 0, {
                                day: "2-digit",
                                month: "short",
                                year: "numeric"
                            })
                        }, []);
                    if (!f) throw Error("PurchaseView requires at least one subscription product");
                    var h = (0, th.useMemo)(function() {
                            var e, t, r;
                            return e = o.filter(function(e) {
                                return 0 === rh(e) && void 0 !== rg(e)
                            }), t = o.filter(function(e) {
                                return rh(e) > 0 && 1 === rg(e)
                            }), r = o.filter(function(r) {
                                return !e.includes(r) && !t.includes(r)
                            }), {
                                plusTerms: e,
                                bundles: t,
                                unsupported: r
                            }
                        }, [o]),
                        g = h.plusTerms,
                        v = h.bundles,
                        w = h.unsupported,
                        x = (0, th.useMemo)(function() {
                            return g.map(rx)
                        }, [g]),
                        j = v.length > 0,
                        O = x.length > 1,
                        S = f.productKey,
                        I = S.id,
                        M = S.type,
                        P = (0, th.useMemo)(function() {
                            return f.eligibleOffers.find(function(e) {
                                return "FreeTrial" === e.offerType
                            })
                        }, [f.eligibleOffers]),
                        N = null != P,
                        D = (0, th.useMemo)(function() {
                            var e, t = null == P || null == (e = P.freeTrialOffer) ? void 0 : e.estimatedTrialEndDate;
                            return t ? new Date(t).toLocaleDateString(void 0, {
                                year: "numeric",
                                month: "long",
                                day: "numeric"
                            }) : ""
                        }, [P]),
                        A = (0, th.useMemo)(function() {
                            return [{
                                opening: "linkStart",
                                closing: "linkEnd",
                                render: function(e) {
                                    return (0, T.jsx)("a", {
                                        className: "content-link underline",
                                        href: tm,
                                        rel: "noopener noreferrer",
                                        target: "_blank",
                                        children: e
                                    })
                                }
                            }]
                        }, []),
                        L = a ? u("Description.EntrypointDisabled") : ls(u, N ? "Description.SubscriptionFreeTrialLegal" : "Description.SubscriptionLegal", A, N ? {
                            date: D
                        } : void 0),
                        C = (0, th.useRef)(!1);
                    (0, th.useEffect)(function() {
                        if (!C.current && c) {
                            C.current = !0;
                            var e = N ? s9.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : s9.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                            s9.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(s9.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, s9.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, s9.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, e, c ? {
                                paymentSessionId: c
                            } : {}), sK(sq.PURCHASE_VIEW_SHOWN, {
                                variant: j ? "multi" : "single",
                                tierCount: String(v.length + 1),
                                opensBillingPeriodSheet: String(O),
                                isFreeTrial: String(N),
                                referralLanding: s.kind
                            })
                        }
                    }, [c, N, j, v.length, O, s.kind]), (0, th.useEffect)(function() {
                        w.forEach(function(e) {
                            sK(sq.UNSUPPORTED_PRODUCT_SKIPPED, {
                                productId: e.productKey.id
                            })
                        })
                    }, [w]);
                    var k = (0, th.useRef)(!1);
                    (0, th.useEffect)(function() {
                        k.current || "none" === s.kind || (k.current = !0, sK(sq.REFERRAL_LANDING_DETECTED, {
                            kind: s.kind,
                            hasReferrerId: String(void 0 !== d)
                        }))
                    }, [s.kind, d]);
                    var R = i.isAndroidApp || i.isIosApp,
                        z = fX((0, th.useState)(null), 2),
                        U = z[0],
                        _ = z[1],
                        B = (0, th.useCallback)(function(e) {
                            var t = rw(e) ? s9.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : s9.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                            s9.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(s9.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, s9.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, s9.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, t, fK({
                                product_id: e.productKey.id
                            }, c ? {
                                paymentSessionId: c
                            } : {}))
                        }, [c]),
                        F = (0, th.useCallback)(function(e) {
                            B(e), sK(sq.BUNDLE_PICKER_SUBSCRIBE_CLICK, {
                                productId: e.productKey.id,
                                isFreeTrial: String(rw(e))
                            })
                        }, [B]),
                        Y = (0, th.useMemo)(function() {
                            return {
                                triggeringContext: s9.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE,
                                viewName: s9.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING
                            }
                        }, []),
                        G = u(N ? "Action.TryItForFree" : "Action.Subscribe"),
                        V = {
                            deviceMeta: i,
                            isDisabled: a,
                            paymentSessionId: c,
                            referrerId: d,
                            onSubscribeClick: R ? l : void 0
                        },
                        W = fH(fK({}, V), {
                            productId: I,
                            productType: M,
                            trackSubscriptionButtonClick: function() {
                                B(f)
                            }
                        }),
                        Q = fH(fK({}, W), {
                            trackSubscriptionButtonClick: void 0
                        }),
                        q = function() {
                            a || (sK(sq.PURCHASE_VIEW_OPEN_SHEET_CLICK), y(!0))
                        },
                        K = function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "Large";
                            return (0, T.jsx)(t4, {
                                className: e,
                                "data-testid": "purchase-open-sheet-button",
                                isDisabled: a,
                                size: t,
                                variant: "Emphasis",
                                onClick: q,
                                children: G
                            })
                        },
                        H = ls(u, "Label.PlusLandingPage.Subtitle.V3", [{
                            opening: "boldStart",
                            closing: "boldEnd",
                            render: function(e) {
                                return (0, T.jsx)("span", {
                                    className: "text-heading-small",
                                    children: e
                                })
                            }
                        }], {
                            price: f_(f.localizedPrice),
                            periodType: f.periodType
                        }),
                        X = (0, T.jsxs)("div", {
                            "aria-label": u("Action.Subscribe"),
                            className: "bottom-dock padding-t-medium bg-surface-100 large:hidden width-full gap-y-medium flex flex-col",
                            "data-testid": "purchase-subscribe-dock",
                            role: "region",
                            children: [(0, T.jsx)(rd, {}), (0, T.jsxs)("div", {
                                className: "width-full gap-y-medium padding-b-[env(safe-area-inset-bottom\\,0px)] padding-x-xxlarge flex flex-col items-stretch",
                                children: [O ? K("min-width-0 width-full") : (0, T.jsx)(sN, fH(fK({}, W), {
                                    className: "min-width-0 width-full",
                                    size: "Medium",
                                    children: G
                                })), (0, T.jsx)("p", {
                                    className: "text-caption-small content-muted margin-bottom-[24px] large:margin-bottom-none padding-x-xsmall text-align-x-start",
                                    children: L
                                })]
                            })]
                        });
                    return (0, T.jsxs)(th.Fragment, {
                        children: [(0, T.jsx)(rs, {}), (0, T.jsx)("div", {
                            className: "width-full min-width-0 large:items-center flex flex-col items-start",
                            children: (0, T.jsxs)("div", {
                                className: "margin-top-[48px] width-full min-width-0 content-emphasis large:max-width-[792px] large:self-auto large:padding-x-xlarge gap-y-xxlarge flex flex-col self-stretch",
                                children: [fZ.enabled && (0, T.jsx)("div", {
                                    className: "width-full min-width-0 padding-x-xxlarge large:padding-x-none",
                                    children: (0, T.jsx)(dN, {
                                        body: u("Description.BannerBodyArrivedPurchase", {
                                            date: b
                                        }),
                                        title: u("Description.BannerTitleArrivedPurchase"),
                                        onItemDetailsClick: function() {
                                            fQ(fV).catch(function() {})
                                        }
                                    })
                                }), (0, T.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge text-align-x-start large:gap-y-[24px] large:items-center large:padding-x-none large:text-align-x-center flex flex-col items-start",
                                    children: [(0, T.jsxs)("div", {
                                        className: "gap-y-xsmall large:items-center flex flex-col items-start",
                                        children: [(0, T.jsx)(dT, {
                                            variant: "compact"
                                        }), (0, T.jsxs)("h1", {
                                            className: "font-builder-extended text-display-small large:![font-size:var(--font-size-1000)] content-emphasis ![font-size:var(--font-size-800)]",
                                            children: [(0, T.jsx)("span", {
                                                className: "large:inline block",
                                                children: u("Title.PurchasePromoHeadlinePart1")
                                            }), (0, T.jsx)("span", {
                                                className: "large:inline hidden",
                                                children: "\xa0"
                                            }), (0, T.jsx)("span", {
                                                className: "large:inline block",
                                                children: u("Title.PurchasePromoHeadlinePart2")
                                            })]
                                        })]
                                    }), (0, T.jsxs)("div", {
                                        className: "gap-y-xsmall width-full min-width-0 large:text-align-x-center flex flex-col",
                                        children: [j ? (0, T.jsx)("span", {
                                            className: "text-body-large content-emphasis",
                                            children: H
                                        }) : (0, T.jsx)(dD, {
                                            eligibleOffers: f.eligibleOffers,
                                            periodType: f.periodType,
                                            price: f.localizedPrice
                                        }), (0, T.jsx)("div", {
                                            className: "width-full gap-y-medium padding-t-none large:margin-x-auto large:margin-top-[24px] large:flex large:max-width-[min(440px,100%)] large:width-full large:flex-col large:items-center hidden items-start",
                                            children: (0, T.jsx)("div", {
                                                className: "width-full gap-x-small flex shrink-0 flex-row items-start justify-center",
                                                children: O ? K("width-full large:width-[230px] shrink-0", "Medium") : (0, T.jsx)(sN, fH(fK({}, W), {
                                                    className: "width-full large:width-[230px] shrink-0",
                                                    size: "Medium",
                                                    children: G
                                                }))
                                            })
                                        })]
                                    })]
                                }), (0, T.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge large:padding-x-none flex flex-col",
                                    children: [(0, T.jsxs)("div", {
                                        className: "width-full gap-y-large flex flex-col",
                                        children: [(0, T.jsx)("span", {
                                            className: "text-heading-small",
                                            children: u("Title.Benefits", {
                                                productShort: u("Label.BlackbirdShort")
                                            })
                                        }), (0, T.jsx)(ru, {
                                            featureConfig: rb(f),
                                            periodType: f.periodType,
                                            onTileClick: function(e, t) {
                                                _({
                                                    primary: e,
                                                    secondary: t
                                                })
                                            }
                                        })]
                                    }), j && (0, T.jsx)(fY, {
                                        bundles: v,
                                        buttonProps: V,
                                        trackSubscribeClick: F
                                    }), (0, T.jsx)("p", {
                                        className: "text-caption-small content-muted padding-x-xsmall text-align-x-start large:block large:padding-x-none hidden",
                                        "data-testid": "purchase-legal-footer",
                                        children: L
                                    })]
                                })]
                            })
                        }), X, (0, T.jsx)(fI, {
                            body: null != (r = null == U ? void 0 : U.secondary) ? r : "",
                            open: null != U,
                            title: null != (n = null == U ? void 0 : U.primary) ? n : "",
                            onOpenChange: function(e) {
                                e || _(null)
                            }
                        }), O && (0, T.jsx)(fc, {
                            analyticsContext: Y,
                            deviceMeta: i,
                            isDisabled: a,
                            isOpen: m,
                            options: x,
                            paymentSessionId: c,
                            referrerId: d,
                            onMobilePurchaseInitiated: l,
                            onOpenChange: y
                        }), (0, T.jsx)(dP, {
                            subscribeButtonProps: Q,
                            subscribeEligibleOffers: f.eligibleOffers,
                            subscribeFeatureConfig: rb(f),
                            subscribePeriodType: f.periodType,
                            subscribePrice: f.localizedPrice
                        })]
                    })
                };

            function fJ(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }
            var f0 = new Map([
                    ["Invalid", "Invalid"],
                    ["Eligible", "Eligible"],
                    ["Ineligible", "Ineligible"],
                    [0, "Invalid"],
                    [1, "Eligible"],
                    [2, "Ineligible"]
                ]),
                f1 = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        t = e.enabled,
                        r = (void 0 === t || t) && tp(),
                        n = (0, C.useQuery)({
                            queryKey: ["plus-referrals", "sender-eligibility"],
                            enabled: r,
                            queryFn: function() {
                                var e;
                                return (e = function() {
                                    var e;
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
                                            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                            l = Object.defineProperty;
                                        return l(a, "next", {
                                            value: u(0)
                                        }), l(a, "throw", {
                                            value: u(1)
                                        }), l(a, "return", {
                                            value: u(2)
                                        }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                                            value: function() {
                                                return this
                                            }
                                        }), a;

                                        function u(l) {
                                            return function(u) {
                                                var c = [l, u];
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
                                    }(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, sm.subscriptionsV2CheckSubscriptionReferralEligibility({})];
                                            case 1:
                                                return e = t.sent().eligibility, [2, f0.get(e)]
                                        }
                                    })
                                }, function() {
                                    var t = this,
                                        r = arguments;
                                    return new Promise(function(n, i) {
                                        var o = e.apply(t, r);

                                        function a(e) {
                                            fJ(o, n, i, a, l, "next", e)
                                        }

                                        function l(e) {
                                            fJ(o, n, i, a, l, "throw", e)
                                        }
                                        a(void 0)
                                    })
                                })()
                            }
                        }),
                        i = n.data,
                        o = n.isLoading;
                    return {
                        eligibility: i,
                        isLoading: r && o
                    }
                },
                f2 = function(e) {
                    var t = e.title,
                        r = e.body;
                    return (0, T.jsxs)("div", {
                        className: "bg-shift-200 radius-medium padding-medium gap-medium width-full flex items-center",
                        children: [(0, T.jsx)("div", {
                            className: "radius-medium size-[50px] shrink-0 flex items-center justify-center",
                            children: (0, T.jsx)(tI, {
                                className: "!size-900",
                                name: "icon-regular-roblox-plus"
                            })
                        }), (0, T.jsxs)("div", {
                            className: "min-width-0 grow-1 shrink-1 flex basis-0 flex-col justify-center",
                            children: [(0, T.jsx)("span", {
                                className: "text-title-medium content-emphasis",
                                children: t
                            }), (0, T.jsx)("span", {
                                className: "text-body-medium content-default",
                                children: r
                            })]
                        })]
                    })
                };

            function f4(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var f3 = function(e, t) {
                return (f3 = Object.setPrototypeOf || f4({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function f5(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function r() {
                    this.constructor = e
                }
                f3(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
            }

            function f6(e, t, r, n) {
                return new(r || (r = Promise))(function(i, o) {
                    function a(e) {
                        try {
                            u(n.next(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function l(e) {
                        try {
                            u(n.throw(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function u(e) {
                        var t;
                        e.done ? i(e.value) : (f4(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, l)
                    }
                    u((n = n.apply(e, t || [])).next())
                })
            }

            function f8(e, t) {
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
                    return function(u) {
                        var c = [l, u];
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

            function f9(e) {
                var t;
                return null == (t = e) ? t : {
                    periodIndex: t.periodIndex,
                    discountPercent: t.discountPercent
                }
            }
            var f7 = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return f5(t, e), t.prototype.robloxPlusGetRobloxPlusUserBenefitsRaw = function(e, t) {
                        return f6(this, void 0, void 0, function() {
                            var r, n;
                            return f8(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                            path: "/v1/roblox-plus/benefits",
                                            schemaPath: "/v1/roblox-plus/benefits",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eW(i.sent(), function(e) {
                                            return null == e ? e : {
                                                robuxSavedWithPlus: e.robuxSavedWithPlus,
                                                itemsBoughtWithPlusDiscount: e.itemsBoughtWithPlusDiscount,
                                                robuxSentToFriends: e.robuxSentToFriends,
                                                privateServersCreatedForFree: e.privateServersCreatedForFree,
                                                referralsCount: e.referralsCount,
                                                robuxEarnedFromReferrals: e.robuxEarnedFromReferrals,
                                                pendingRobuxEarnedFromReferrals: e.pendingRobuxEarnedFromReferrals
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.robloxPlusGetRobloxPlusUserBenefits = function() {
                        return f6(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), f8(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.robloxPlusGetRobloxPlusUserBenefitsRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t
                }(eB),
                pe = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return f5(t, e), t.prototype.robloxSubscriptionMetadataGetRobloxSubscriptionMetadataRaw = function(e, t) {
                        return f6(this, void 0, void 0, function() {
                            var r, n;
                            return f8(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return r = {}, n = {}, void 0 !== e.robloxUniverseId && null !== e.robloxUniverseId && (n["Roblox-Universe-Id"] = String(e.robloxUniverseId)), void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                            path: "/v1/metadata",
                                            schemaPath: "/v1/metadata",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eW(i.sent(), function(e) {
                                            var t, r;
                                            return null == e ? e : {
                                                unifiedPurchaseFlowMetadata: null == (t = e.unifiedPurchaseFlowMetadata) ? t : {
                                                    isUserEligibleForUnifiedPurchaseFlow: t.isUserEligibleForUnifiedPurchaseFlow,
                                                    expiresInSeconds: t.expiresInSeconds
                                                },
                                                robloxSubscriptionExperimentMetadata: null == (r = e.robloxSubscriptionExperimentMetadata) ? r : {
                                                    subscriptionsVariant: eV(r, "subscriptionsVariant") ? r.subscriptionsVariant : void 0
                                                }
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.robloxSubscriptionMetadataGetRobloxSubscriptionMetadata = function() {
                        return f6(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), f8(this, function(r) {
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
                }(eB),
                pt = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return f5(t, e), t.prototype.robloxSubscriptionProductsGetRobloxSubscriptionProductRaw = function(e, t) {
                        return f6(this, void 0, void 0, function() {
                            var r, n;
                            return f8(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.robloxSubscriptionProductId || void 0 === e.robloxSubscriptionProductId) throw new eG("robloxSubscriptionProductId", "Required parameter requestParameters.robloxSubscriptionProductId was null or undefined when calling robloxSubscriptionProductsGetRobloxSubscriptionProduct.");
                                        return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                            path: "/v1/products/{robloxSubscriptionProductId}".replace("{".concat("robloxSubscriptionProductId", "}"), encodeURIComponent(String(e.robloxSubscriptionProductId))),
                                            schemaPath: "/v1/products/{robloxSubscriptionProductId}",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eW(i.sent(), function(e) {
                                            var t, r, n, i, o, a;
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
                                                        virtualTransactionDiscounts: null === n.virtualTransactionDiscounts ? null : n.virtualTransactionDiscounts.map(f9),
                                                        isRobuxTransferEnabled: n.isRobuxTransferEnabled,
                                                        isTradingEnabled: n.isTradingEnabled,
                                                        isUgcPublishingEnabled: n.isUgcPublishingEnabled,
                                                        privateServerDiscounts: null === n.privateServerDiscounts ? null : n.privateServerDiscounts.map(f9),
                                                        currencySubscriptionConfig: null == (i = n.currencySubscriptionConfig) ? i : {
                                                            currencyType: i.currencyType,
                                                            entitledAmountMicros: i.entitledAmountMicros
                                                        },
                                                        coreContentPublishingConfig: null == (o = n.coreContentPublishingConfig) ? o : {
                                                            minimumPeriodIndex: o.minimumPeriodIndex
                                                        },
                                                        isAppThemesEnabled: n.isAppThemesEnabled,
                                                        isProfileFrameEnabled: n.isProfileFrameEnabled,
                                                        isAiBackgroundEnabled: n.isAiBackgroundEnabled,
                                                        robuxTransferConfig: null == (a = n.robuxTransferConfig) ? a : {
                                                            isElevatedLimitEnabled: a.isElevatedLimitEnabled
                                                        }
                                                    }
                                                }
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.robloxSubscriptionProductsGetRobloxSubscriptionProduct = function(e, t) {
                        return f6(this, void 0, void 0, function() {
                            return f8(this, function(r) {
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
                }(eB),
                pr = function(e, t) {
                    return new Date(Date.UTC(e, t + 1, 0)).getUTCDate()
                },
                pn = function(e, t) {
                    var r = e.getUTCFullYear(),
                        n = e.getUTCMonth(),
                        i = e.getUTCDate(),
                        o = n + t,
                        a = r + Math.floor(o / 12),
                        l = (o % 12 + 12) % 12,
                        u = Math.min(i, pr(a, l));
                    return new Date(Date.UTC(a, l, u, e.getUTCHours(), e.getUTCMinutes(), e.getUTCSeconds(), e.getUTCMilliseconds()))
                },
                pi = function(e, t) {
                    var r = e.getUTCFullYear() + t,
                        n = e.getUTCMonth(),
                        i = Math.min(e.getUTCDate(), pr(r, n));
                    return new Date(Date.UTC(r, n, i, e.getUTCHours(), e.getUTCMinutes(), e.getUTCSeconds(), e.getUTCMilliseconds()))
                },
                po = function(e, t, r) {
                    var n = new Date(e);
                    switch (r) {
                        case "Week":
                            return n.setUTCDate(n.getUTCDate() + 7 * t), n;
                        case "Month":
                            return pn(n, t);
                        case "Year":
                            return pi(n, t);
                        default:
                            throw Error("Unsupported period type: ".concat(r))
                    }
                },
                pa = function(e, t, r, n) {
                    for (var i = 0; i < 1e3 && !(n < po(e, i + 1, t).getTime());) i += 1;
                    return r && r < n && i > 0 && (i -= 1), i
                },
                pl = function(e) {
                    var t = e.currentDiscountPercent,
                        r = e.nextDiscount,
                        n = e.activationTimestampMs,
                        i = e.isCancelled,
                        o = e.periodType,
                        a = (0, E.useTranslation)(),
                        l = a.translate,
                        u = a.intl,
                        c = (0, th.useMemo)(function() {
                            if (!r) return null;
                            var e = Date.now(),
                                t = po(n, r.periodIndex, o).getTime();
                            return {
                                discountPercent: r.discountPercent,
                                targetDateDaysUntil: Math.max(0, Math.ceil((t - e) / 864e5)),
                                targetDateProgressPercent: Math.min(Math.max(0, (e - n) / (t - n) * 100), 100)
                            }
                        }, [r, n, o]);
                    if (null === c && 0 === t) return null;
                    var s = null === c,
                        d = null !== c && c.targetDateDaysUntil <= 15,
                        f = function(e) {
                            return (0, T.jsxs)("div", {
                                className: "margin-right-[-16px] relative flex size-[60px] shrink-0 items-center justify-center",
                                children: [(0, T.jsx)("div", {
                                    "aria-hidden": !0,
                                    className: "stroke-emphasis stroke-standard absolute inset-[0] rounded-[2.4px] [transform:rotate(-15deg)]"
                                }), e]
                            })
                        };
                    return (0, T.jsxs)("div", {
                        className: "radius-medium padding-large bg-shift-200 width-full gap-x-small flex items-center justify-between [overflow:clip]",
                        children: [(0, T.jsxs)("div", {
                            className: "gap-y-small min-width-0 flex flex-col items-start justify-center",
                            children: [(0, T.jsx)("span", {
                                className: "text-title-medium content-default",
                                children: i ? l(s ? "Description.Benefit.DiscountStaySubscribedToKeep" : "Description.Benefit.DiscountStaySubscribedToGet") : s ? l("Description.Benefit.DiscountMaxReached") : l("Description.Benefit.DiscountCurrent", {
                                    discountPercent: u.n(.01 * t, {
                                        style: "percent"
                                    })
                                })
                            }), (0, T.jsx)("span", {
                                className: "text-heading-large content-emphasis",
                                children: s ? l(i ? "Description.Benefit.DiscountAllPurchases" : "Description.Benefit.DiscountUnlocked", {
                                    discountPercent: u.n(.01 * t, {
                                        style: "percent"
                                    })
                                }) : l("Description.Benefit.DiscountOffInDays", {
                                    discountPercent: u.n(.01 * c.discountPercent, {
                                        style: "percent"
                                    }),
                                    dayCount: c.targetDateDaysUntil
                                })
                            })]
                        }), (0, T.jsx)("div", {
                            className: "shrink-0",
                            children: s ? f((0, T.jsx)(tI, {
                                name: "icon-regular-circle-check",
                                size: "XLarge"
                            })) : d && !i ? (0, T.jsx)(rN, {
                                ariaLabel: l("Label.Progress"),
                                className: "[--fui-future-alpha-color-system-progress:var(--color-content-emphasis)]",
                                size: "Large",
                                value: c.targetDateProgressPercent,
                                variant: "Determinate"
                            }) : f((0, T.jsx)(tI, {
                                name: "icon-regular-calendar",
                                size: "XLarge"
                            }))
                        })]
                    })
                };

            function pu(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function pc(e) {
                if (Array.isArray(e)) return e
            }

            function ps() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function pd(e, t) {
                return pc(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                }(e, t) || pf(e, t) || ps()
            }

            function pf(e, t) {
                if (e) {
                    if ("string" == typeof e) return pu(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return pu(e, t)
                }
            }
            var pp = function(e) {
                    var t = e.scrollLeft,
                        r = e.scrollWidth,
                        n = e.clientWidth,
                        i = Math.abs(t),
                        o = r - n;
                    return o <= 1 ? "Middle" : i <= 1 ? "Start" : i >= o - 1 ? "End" : "Middle"
                },
                pm = (0, th.forwardRef)(function(e, t) {
                    var r, n, i, o = pc(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || pf(r) || ps(),
                        a = o[0],
                        l = o.slice(1),
                        u = a.children,
                        c = a.hasMargin,
                        s = a.discretePosition,
                        d = void 0 !== s && s,
                        f = a.className,
                        p = a.previousButtonAriaLabel,
                        m = a.nextButtonAriaLabel,
                        y = a["aria-label"],
                        b = function(e, t) {
                            if (null == e) return {};
                            var r, n, i, o = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }
                            if (o = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, i = {},
                                        o = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                    return i
                                }(e, t), Object.getOwnPropertySymbols)
                                for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }(a, ["children", "hasMargin", "discretePosition", "className", "previousButtonAriaLabel", "nextButtonAriaLabel", "aria-label"]),
                        h = pd(l, 1)[0],
                        g = (0, th.useRef)(null),
                        v = pd((0, th.useState)("Start"), 2),
                        w = v[0],
                        x = v[1],
                        j = pd((0, th.useState)(!1), 2),
                        O = j[0],
                        S = j[1],
                        I = (0, th.useCallback)(function() {
                            var e = g.current;
                            e && (x(pp(e)), S(!!e && e.scrollWidth - e.clientWidth > 1))
                        }, []);
                    (0, th.useEffect)(function() {
                        I();
                        var e = g.current;
                        if (e) {
                            var t = function() {
                                return I()
                            };
                            e.addEventListener("scroll", t, {
                                passive: !0
                            });
                            var r = null;
                            return "u" > typeof ResizeObserver && ((r = new ResizeObserver(function() {
                                    return I()
                                })).observe(e), Array.from(e.children).forEach(function(e) {
                                    return null == r ? void 0 : r.observe(e)
                                })),
                                function() {
                                    e.removeEventListener("scroll", t), null == r || r.disconnect()
                                }
                        }
                    }, [I, u]);
                    var M = (0, th.useCallback)(function() {
                            var e = g.current;
                            return e ? d ? e.clientWidth : Math.max(1, Math.round(.75 * e.clientWidth)) : 0
                        }, [d]),
                        P = (0, th.useCallback)(function() {
                            var e = g.current;
                            e && e.scrollBy({
                                left: -M(),
                                behavior: "smooth"
                            })
                        }, [M]),
                        N = (0, th.useCallback)(function() {
                            var e = g.current;
                            e && e.scrollBy({
                                left: M(),
                                behavior: "smooth"
                            })
                        }, [M]);
                    (0, th.useImperativeHandle)(h, function() {
                        return {
                            scrollPrevious: P,
                            scrollNext: N,
                            scrollContainer: g.current
                        }
                    }, [P, N]);
                    var T = O && "Start" !== w,
                        E = O && "End" !== w;
                    return tg().createElement("div", (n = function(e) {
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
                    }({}, b), i = i = {
                        className: tv("foundation-web-collection-carousel relative", f),
                        "data-position": w.toLowerCase(),
                        "data-has-margin": void 0 === c || c,
                        "data-discrete-position": d,
                        role: "region",
                        "aria-label": void 0 === y ? "Carousel" : y,
                        "aria-roledescription": "carousel"
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(i)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(i)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(i, e))
                    }), n), tg().createElement("div", {
                        ref: g,
                        "data-testid": "collection-carousel-scroll",
                        className: "foundation-web-collection-carousel-scroll flex flex-row gap-medium"
                    }, tg().Children.map(u, function(e, t) {
                        return tg().createElement("div", {
                            className: "foundation-web-collection-carousel-item shrink-0",
                            key: t
                        }, e)
                    })), tg().createElement("div", {
                        "data-testid": "collection-carousel-nav-previous",
                        className: "foundation-web-collection-carousel-nav foundation-web-collection-carousel-nav-previous absolute",
                        "data-visible": T,
                        "aria-hidden": !T
                    }, tg().createElement(lM, {
                        icon: "icon-regular-chevron-small-left",
                        ariaLabel: void 0 === p ? "Previous" : p,
                        variant: "OverMedia",
                        size: "Medium",
                        isCircular: !0,
                        tabIndex: T ? 0 : -1,
                        onClick: P,
                        isDisabled: !T
                    })), tg().createElement("div", {
                        "data-testid": "collection-carousel-nav-next",
                        className: "foundation-web-collection-carousel-nav foundation-web-collection-carousel-nav-next absolute",
                        "data-visible": E,
                        "aria-hidden": !E
                    }, tg().createElement(lM, {
                        icon: "icon-regular-chevron-small-right",
                        ariaLabel: void 0 === m ? "Next" : m,
                        variant: "OverMedia",
                        size: "Medium",
                        isCircular: !0,
                        tabIndex: E ? 0 : -1,
                        onClick: N,
                        isDisabled: !E
                    })))
                });
            pm.displayName = "CollectionCarousel";
            var py = function(e) {
                var t = e.children,
                    r = (0, (0, E.useTranslation)().translate)("Heading.InteractWithPlus", void 0, "Get more out of Plus");
                return (0, T.jsxs)("div", {
                    className: "gap-y-large flex flex-col",
                    children: [(0, T.jsx)("span", {
                        className: "text-heading-small content-emphasis",
                        children: r
                    }), (0, T.jsx)(pm, {
                        "aria-label": r,
                        hasMargin: !1,
                        children: t
                    })]
                })
            };

            function pb(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var ph = function(e) {
                    var t, r = e.robloxSubscriptionProduct,
                        n = (0, E.useTranslation)().translate,
                        i = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, th.useState)(!1)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return pb(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return pb(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        o = i[0],
                        a = i[1],
                        l = (0, th.useCallback)(function() {
                            a(!0)
                        }, []),
                        u = (0, th.useMemo)(function() {
                            var e = new URL("/my/account#!/subscriptions", window.location.origin);
                            return e.searchParams.append("id", r.productKey.id), e.searchParams.append("type", r.productKey.type), e.toString()
                        }, [r.productKey.id, r.productKey.type]);
                    return (0, T.jsx)(t4, {
                        as: "a",
                        href: u,
                        isLoading: o,
                        variant: "Standard",
                        onClick: l,
                        children: n("Action.Manage")
                    })
                },
                pg = function(e) {
                    var t = e.onOpenDashboard,
                        r = (0, E.useTranslation)(),
                        n = r.translate,
                        i = r.intl.n(100),
                        o = (0, th.useRef)(!1);
                    return (0, th.useEffect)(function() {
                        o.current || (o.current = !0, li(), sK(sq.SHARE_CARD_SHOWN))
                    }, []), (0, T.jsxs)("div", {
                        className: "radius-medium bg-shift-100 padding-large gap-y-small height-full min-height-[160px] ".concat("width-[235px]", " flex flex-col items-start"),
                        children: [(0, T.jsx)("span", {
                            className: "text-title-large content-emphasis",
                            children: n("Heading.ReferralCard", {
                                amount: i
                            }, "Share Plus, get 100 Robux")
                        }), (0, T.jsx)("p", {
                            className: "text-body-medium content-default margin-none grow-1",
                            children: n("Description.ReferralShare", {
                                amount: i
                            }, "Invite someone to Plus and you both get 100 Robux when they join.")
                        }), (0, T.jsx)(t4, {
                            size: "Small",
                            variant: "Standard",
                            onClick: function() {
                                lo(), sK(sq.SHARE_CARD_INVITE_CLICK), t()
                            },
                            children: n("Action.ReferralInvite", void 0, "Invite")
                        })]
                    })
                },
                pv = function(e) {
                    var t = e.title,
                        r = e.value;
                    return (0, T.jsxs)("div", {
                        className: "radius-medium bg-shift-200 padding-large gap-y-small min-width-0 grow-1 flex basis-0 flex-col",
                        children: [(0, T.jsx)("span", {
                            className: "text-title-medium content-default",
                            children: t
                        }), (0, T.jsx)("span", {
                            className: "text-heading-large content-emphasis",
                            children: r
                        })]
                    })
                },
                pw = function(e) {
                    var t = e.currentDiscountPercent,
                        r = e.savedRobux,
                        n = e.itemsBoughtWithDiscountCount,
                        i = e.privateServersCreatedCount,
                        o = e.robuxSentToFriendsCount,
                        a = (0, E.useTranslation)(),
                        l = a.translate,
                        u = a.intl;
                    return (0, T.jsxs)("div", {
                        className: "gap-y-large flex flex-col",
                        children: [(0, T.jsxs)("div", {
                            className: "gap-x-xsmall text-heading-small content-emphasis wrap flex items-center",
                            children: [(0, T.jsx)("span", {
                                children: l("Heading.SavingsYouveSaved")
                            }), (0, T.jsx)(tI, {
                                name: "icon-regular-robux",
                                size: "Medium"
                            }), (0, T.jsx)("span", {
                                children: void 0 === r ? "—" : u.n(r)
                            }), (0, T.jsx)("span", {
                                children: l("Heading.SavingsWithPlus")
                            })]
                        }), (0, T.jsxs)("div", {
                            className: "gap-y-small flex flex-col",
                            children: [(0, T.jsxs)("div", {
                                className: "gap-x-small flex",
                                children: [(0, T.jsx)(pv, {
                                    title: l("Label.Savings.InGameItems"),
                                    value: l("Label.Savings.PercentOff", {
                                        discountPercent: u.n(.01 * t, {
                                            style: "percent"
                                        })
                                    })
                                }), (0, T.jsx)(pv, {
                                    title: l("Label.Savings.ItemsBought"),
                                    value: void 0 === n ? "—" : u.n(n)
                                })]
                            }), (0, T.jsxs)("div", {
                                className: "gap-x-small flex",
                                children: [(0, T.jsx)(pv, {
                                    title: l("Label.Savings.PrivateServers"),
                                    value: void 0 === i ? "—" : u.n(i)
                                }), (0, T.jsx)(pv, {
                                    title: l("Label.Savings.RobuxSent"),
                                    value: (0, T.jsxs)("span", {
                                        className: "gap-x-xsmall flex items-center",
                                        children: [(0, T.jsx)(tI, {
                                            name: "icon-regular-robux",
                                            size: "Medium"
                                        }), void 0 === o ? "—" : u.n(o)]
                                    })
                                })]
                            }), (0, T.jsx)("span", {
                                className: "text-caption-medium content-muted",
                                children: l("Description.SavingsDataDelay")
                            })]
                        })]
                    })
                },
                px = function(e) {
                    var t = e.activationTimestampMs,
                        r = e.expirationTimestampMs,
                        n = e.nextRenewalTimestampMs,
                        i = e.hasFreeTrial,
                        o = (0, E.useTranslation)(),
                        a = o.translate,
                        l = o.intl,
                        u = (0, th.useMemo)(function() {
                            return l.getDateTimeFormatter()
                        }, [l]),
                        c = null === n || 0 === n;
                    return (0, T.jsxs)("div", {
                        className: "gap-x-small flex items-center",
                        children: [(0, T.jsx)("span", {
                            className: "text-body-medium content-emphasis",
                            children: c ? a("Description.ActiveUntil", {
                                date: u.getCustomDateTime(r, {
                                    month: "long",
                                    day: "numeric",
                                    year: "numeric"
                                })
                            }) : a("Description.SubscribedSince", {
                                date: u.getCustomDateTime(t, {
                                    month: "long",
                                    day: "numeric",
                                    year: "numeric"
                                })
                            })
                        }), c ? (0, T.jsx)(dq, {
                            label: a("Label.Status.AutoRenewOff"),
                            variant: "Warning"
                        }) : i ? (0, T.jsx)(dq, {
                            label: a("Label.Status.Freetrial"),
                            variant: "Standard"
                        }) : (0, T.jsx)(dq, {
                            label: a("Label.Status.Active"),
                            variant: "Standard"
                        })]
                    })
                },
                pj = function(e) {
                    var t = e.featureConfig,
                        r = (0, E.useTranslation)().translate;
                    return (0, T.jsxs)("div", {
                        className: "gap-y-medium flex flex-col",
                        children: [(0, T.jsx)("span", {
                            className: "text-heading-medium",
                            children: r("Label.ExploreMoreBenefits")
                        }), (0, T.jsxs)("div", {
                            className: "foundation-web-list-item-container",
                            children: [t.isTradingEnabled && (0, T.jsx)(ri, {
                                description: r("Description.Benefit.TradeResellItemsSubtitle"),
                                divider: "None",
                                isContained: !0,
                                leading: (0, T.jsx)(tI, {
                                    name: "icon-regular-hand-two-arrows-horizontal",
                                    size: "Medium"
                                }),
                                size: "Medium",
                                title: r("Description.Benefit.TradeResellItems"),
                                trailing: (0, T.jsx)(tI, {
                                    name: "icon-regular-chevron-small-right"
                                }),
                                onSelect: function() {
                                    window.location.href = "https://help.roblox.com/hc/articles/203313310-Trading-System"
                                }
                            }), t.isUgcPublishingEnabled && (0, T.jsx)(ri, {
                                description: r("Description.Benefit.PublishItemsSubtitle"),
                                divider: "None",
                                isContained: !0,
                                leading: (0, T.jsx)(tI, {
                                    name: "icon-regular-arrow-up-from-landscape-rectangle",
                                    size: "Medium"
                                }),
                                size: "Medium",
                                title: r("Description.Benefit.PublishItems"),
                                trailing: (0, T.jsx)(tI, {
                                    name: "icon-regular-chevron-small-right"
                                }),
                                onSelect: function() {
                                    window.location.href = "https://help.roblox.com/hc/articles/203313180-Creating-and-Selling-Avatar-Items"
                                }
                            })]
                        })]
                    })
                };

            function pO(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var pS = function(e, t) {
                return (pS = Object.setPrototypeOf || pO({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function pI(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function r() {
                    this.constructor = e
                }
                pS(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
            }

            function pM(e, t, r, n) {
                return new(r || (r = Promise))(function(i, o) {
                    function a(e) {
                        try {
                            u(n.next(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function l(e) {
                        try {
                            u(n.throw(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function u(e) {
                        var t;
                        e.done ? i(e.value) : (pO(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, l)
                    }
                    u((n = n.apply(e, t || [])).next())
                })
            }

            function pP(e, t) {
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
                    return function(u) {
                        var c = [l, u];
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

            function pN(e) {
                var t;
                return null == (t = e) ? t : {
                    name: eV(t, "name") ? t.name : void 0,
                    displayName: eV(t, "displayName") ? t.displayName : void 0,
                    filter: eV(t, "filter") ? t.filter : void 0,
                    id: eV(t, "id") ? t.id : void 0,
                    type: eV(t, "type") ? t.type : void 0,
                    categoryType: eV(t, "categoryType") ? t.categoryType : void 0
                }
            }

            function pT(e) {
                var t;
                return null == (t = e) ? t : {
                    name: eV(t, "name") ? t.name : void 0,
                    displayName: eV(t, "displayName") ? t.displayName : void 0,
                    categoryType: eV(t, "categoryType") ? t.categoryType : void 0,
                    items: eV(t, "items") ? t.items.map(pN) : void 0
                }
            }
            "function" == typeof SuppressedError && SuppressedError;

            function pE(e, t) {
                return null == e ? e : {
                    categories: eV(e, "categories") ? e.categories.map(pT) : void 0
                }
            }

            function pD(e) {
                var t;
                return null == (t = e) ? t : {
                    userAssetId: eV(t, "userAssetId") ? t.userAssetId : void 0,
                    serialNumber: eV(t, "serialNumber") ? t.serialNumber : void 0,
                    assetId: eV(t, "assetId") ? t.assetId : void 0,
                    name: eV(t, "name") ? t.name : void 0,
                    recentAveragePrice: eV(t, "recentAveragePrice") ? t.recentAveragePrice : void 0,
                    originalPrice: eV(t, "originalPrice") ? t.originalPrice : void 0,
                    assetStock: eV(t, "assetStock") ? t.assetStock : void 0,
                    buildersClubMembershipType: eV(t, "buildersClubMembershipType") ? t.buildersClubMembershipType : void 0,
                    isOnHold: eV(t, "isOnHold") ? t.isOnHold : void 0
                }
            }

            function pA(e) {
                var t;
                return null == (t = e) ? t : {
                    id: eV(t, "id") ? t.id : void 0,
                    name: eV(t, "name") ? t.name : void 0,
                    type: eV(t, "type") ? t.type : void 0,
                    instanceId: eV(t, "instanceId") ? t.instanceId : void 0
                }
            }

            function pL(e) {
                var t, r;
                return null == (t = e) ? t : {
                    universeId: eV(t, "universeId") ? t.universeId : void 0,
                    placeId: eV(t, "placeId") ? t.placeId : void 0,
                    name: eV(t, "name") ? t.name : void 0,
                    creator: eV(t, "creator") ? null == (r = t.creator) ? r : {
                        id: eV(r, "id") ? r.id : void 0,
                        name: eV(r, "name") ? r.name : void 0,
                        type: eV(r, "type") ? r.type : void 0
                    } : void 0,
                    priceInRobux: eV(t, "priceInRobux") ? t.priceInRobux : void 0
                }
            }(function(e) {
                function t() {
                    return null !== e && e.apply(this, arguments) || this
                }
                pI(t, e), t.prototype.v1PackagesPackageIdAssetsGetRaw = function(e, t) {
                    return pM(this, void 0, void 0, function() {
                        var r, n;
                        return pP(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    if (null === e.packageID || void 0 === e.packageID) throw new eG("packageID", "Required parameter requestParameters.packageID was null or undefined when calling v1PackagesPackageIdAssetsGet.");
                                    return r = {}, n = {}, [4, this.request({
                                        path: "/v1/packages/{packageId}/assets".replace("{".concat("packageID", "}"), encodeURIComponent(String(e.packageID))),
                                        schemaPath: "/v1/packages/{packageId}/assets",
                                        method: "GET",
                                        headers: n,
                                        query: r
                                    }, t)];
                                case 1:
                                    return [2, new eW(i.sent(), function(e) {
                                        return null == e ? e : {
                                            assetIds: eV(e, "assetIds") ? e.assetIds : void 0
                                        }
                                    })]
                            }
                        })
                    })
                }, t.prototype.v1PackagesPackageIdAssetsGet = function(e, t) {
                    return pM(this, void 0, void 0, function() {
                        return pP(this, function(r) {
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
            })(eB),
            function(e) {
                function t() {
                    return null !== e && e.apply(this, arguments) || this
                }
                pI(t, e), t.prototype.v1CollectionsItemsItemTypeItemTargetIdDeleteRaw = function(e, t) {
                    return pM(this, void 0, void 0, function() {
                        var r, n;
                        return pP(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    if (null === e.itemType || void 0 === e.itemType) throw new eG("itemType", "Required parameter requestParameters.itemType was null or undefined when calling v1CollectionsItemsItemTypeItemTargetIdDelete.");
                                    if (null === e.itemTargetId || void 0 === e.itemTargetId) throw new eG("itemTargetId", "Required parameter requestParameters.itemTargetId was null or undefined when calling v1CollectionsItemsItemTypeItemTargetIdDelete.");
                                    return r = {}, n = {}, [4, this.request({
                                        path: "/v1/collections/items/{itemType}/{itemTargetId}".replace("{".concat("itemType", "}"), encodeURIComponent(String(e.itemType))).replace("{".concat("itemTargetId", "}"), encodeURIComponent(String(e.itemTargetId))),
                                        schemaPath: "/v1/collections/items/{itemType}/{itemTargetId}",
                                        method: "DELETE",
                                        headers: n,
                                        query: r
                                    }, t)];
                                case 1:
                                    return [2, new eW(i.sent())]
                            }
                        })
                    })
                }, t.prototype.v1CollectionsItemsItemTypeItemTargetIdDelete = function(e, t) {
                    return pM(this, void 0, void 0, function() {
                        return pP(this, function(r) {
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
                    return pM(this, void 0, void 0, function() {
                        var r, n;
                        return pP(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    if (null === e.itemType || void 0 === e.itemType) throw new eG("itemType", "Required parameter requestParameters.itemType was null or undefined when calling v1CollectionsItemsItemTypeItemTargetIdPost.");
                                    if (null === e.itemTargetId || void 0 === e.itemTargetId) throw new eG("itemTargetId", "Required parameter requestParameters.itemTargetId was null or undefined when calling v1CollectionsItemsItemTypeItemTargetIdPost.");
                                    return r = {}, n = {}, [4, this.request({
                                        path: "/v1/collections/items/{itemType}/{itemTargetId}".replace("{".concat("itemType", "}"), encodeURIComponent(String(e.itemType))).replace("{".concat("itemTargetId", "}"), encodeURIComponent(String(e.itemTargetId))),
                                        schemaPath: "/v1/collections/items/{itemType}/{itemTargetId}",
                                        method: "POST",
                                        headers: n,
                                        query: r
                                    }, t)];
                                case 1:
                                    return [2, new eW(i.sent())]
                            }
                        })
                    })
                }, t.prototype.v1CollectionsItemsItemTypeItemTargetIdPost = function(e, t) {
                    return pM(this, void 0, void 0, function() {
                        return pP(this, function(r) {
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
            }(eB);
            var pC = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return pI(t, e), t.prototype.v1UsersUserIdAssetsCollectiblesGetRaw = function(e, t) {
                        return pM(this, void 0, void 0, function() {
                            var r, n;
                            return pP(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new eG("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdAssetsCollectiblesGet.");
                                        return r = {}, void 0 !== e.assetType && (r.assetType = e.assetType), void 0 !== e.limit && (r.limit = e.limit), void 0 !== e.cursor && (r.cursor = e.cursor), void 0 !== e.sortOrder && (r.sortOrder = e.sortOrder), n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/assets/collectibles".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                            schemaPath: "/v1/users/{userId}/assets/collectibles",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eW(i.sent(), function(e) {
                                            return null == e ? e : {
                                                previousPageCursor: eV(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                                nextPageCursor: eV(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                                data: eV(e, "data") ? e.data.map(pD) : void 0
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdAssetsCollectiblesGet = function(e, t) {
                        return pM(this, void 0, void 0, function() {
                            return pP(this, function(r) {
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
                        return pM(this, void 0, void 0, function() {
                            var r, n;
                            return pP(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new eG("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdCanViewInventoryGet.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/can-view-inventory".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                            schemaPath: "/v1/users/{userId}/can-view-inventory",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eW(i.sent(), function(e) {
                                            return null == e ? e : {
                                                canView: eV(e, "canView") ? e.canView : void 0
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdCanViewInventoryGet = function(e, t) {
                        return pM(this, void 0, void 0, function() {
                            return pP(this, function(r) {
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
                        return pM(this, void 0, void 0, function() {
                            var r, n;
                            return pP(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new eG("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdCategoriesFavoritesGet.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/categories/favorites".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                            schemaPath: "/v1/users/{userId}/categories/favorites",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eW(i.sent(), function(e) {
                                            return pE(e)
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdCategoriesFavoritesGet = function(e, t) {
                        return pM(this, void 0, void 0, function() {
                            return pP(this, function(r) {
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
                        return pM(this, void 0, void 0, function() {
                            var r, n;
                            return pP(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new eG("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdCategoriesGet.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/categories".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                            schemaPath: "/v1/users/{userId}/categories",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eW(i.sent(), function(e) {
                                            return pE(e)
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdCategoriesGet = function(e, t) {
                        return pM(this, void 0, void 0, function() {
                            return pP(this, function(r) {
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
                        return pM(this, void 0, void 0, function() {
                            var r, n;
                            return pP(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new eG("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdGet.");
                                        if (null === e.itemType || void 0 === e.itemType) throw new eG("itemType", "Required parameter requestParameters.itemType was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdGet.");
                                        if (null === e.itemTargetId || void 0 === e.itemTargetId) throw new eG("itemTargetId", "Required parameter requestParameters.itemTargetId was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdGet.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/items/{itemType}/{itemTargetId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("itemType", "}"), encodeURIComponent(String(e.itemType))).replace("{".concat("itemTargetId", "}"), encodeURIComponent(String(e.itemTargetId))),
                                            schemaPath: "/v1/users/{userId}/items/{itemType}/{itemTargetId}",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eW(i.sent(), function(e) {
                                            return null == e ? e : {
                                                previousPageCursor: eV(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                                nextPageCursor: eV(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                                data: eV(e, "data") ? e.data.map(pA) : void 0
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdItemsItemTypeItemTargetIdGet = function(e, t) {
                        return pM(this, void 0, void 0, function() {
                            return pP(this, function(r) {
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
                        return pM(this, void 0, void 0, function() {
                            var r, n, i;
                            return pP(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new eG("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet.");
                                        if (null === e.itemType || void 0 === e.itemType) throw new eG("itemType", "Required parameter requestParameters.itemType was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet.");
                                        if (null === e.itemTargetId || void 0 === e.itemTargetId) throw new eG("itemTargetId", "Required parameter requestParameters.itemTargetId was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/items/{itemType}/{itemTargetId}/is-owned".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("itemType", "}"), encodeURIComponent(String(e.itemType))).replace("{".concat("itemTargetId", "}"), encodeURIComponent(String(e.itemTargetId))),
                                            schemaPath: "/v1/users/{userId}/items/{itemType}/{itemTargetId}/is-owned",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return i = o.sent(), this.isJsonMime(i.headers.get("content-type")) ? [2, new eW(i)] : [2, new eq(i)]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet = function(e, t) {
                        return pM(this, void 0, void 0, function() {
                            return pP(this, function(r) {
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
                }(eB),
                pk = eB;

            function pR() {
                return null !== pk && pk.apply(this, arguments) || this
            }
            pI(pR, pk), pR.prototype.v1UsersUserIdPlacesInventoryGetRaw = function(e, t) {
                return pM(this, void 0, void 0, function() {
                    var r, n;
                    return pP(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new eG("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdPlacesInventoryGet.");
                                if (null === e.placesTab || void 0 === e.placesTab) throw new eG("placesTab", "Required parameter requestParameters.placesTab was null or undefined when calling v1UsersUserIdPlacesInventoryGet.");
                                if (null === e.itemsPerPage || void 0 === e.itemsPerPage) throw new eG("itemsPerPage", "Required parameter requestParameters.itemsPerPage was null or undefined when calling v1UsersUserIdPlacesInventoryGet.");
                                if (null === e.cursor || void 0 === e.cursor) throw new eG("cursor", "Required parameter requestParameters.cursor was null or undefined when calling v1UsersUserIdPlacesInventoryGet.");
                                return r = {}, void 0 !== e.placesTab && (r.placesTab = e.placesTab), void 0 !== e.itemsPerPage && (r.itemsPerPage = e.itemsPerPage), void 0 !== e.cursor && (r.cursor = e.cursor), n = {}, [4, this.request({
                                    path: "/v1/users/{userId}/places/inventory".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/places/inventory",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return [2, new eW(i.sent(), function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: eV(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: eV(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: eV(e, "data") ? e.data.map(pL) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, pR.prototype.v1UsersUserIdPlacesInventoryGet = function(e, t) {
                return pM(this, void 0, void 0, function() {
                    return pP(this, function(r) {
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
            var pz = sG(window.location.hostname),
                pU = new pC(new eK({
                    robloxSiteDomain: pz.rootDomain,
                    basePath: (g = pz.rootDomain, "https://".concat("inventory", ".").concat(g)),
                    credentials: "include"
                })),
                p_ = function(e) {
                    if (e === fG.ItemType.Asset) return 0;
                    throw Error("Unsupported gift item type: ".concat(e))
                },
                pB = function() {
                    var e = !(arguments.length > 0) || void 0 === arguments[0] || arguments[0],
                        t = (0, rE.userId)();
                    return (0, C.useQuery)({
                        queryKey: ["owns-gift-item", t, fV.itemId, fV.itemType],
                        queryFn: function() {
                            if (null == t) throw Error("Cannot check gift item ownership without a user id");
                            return pU.v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet({
                                userId: t,
                                itemType: p_(fV.itemType),
                                itemTargetId: fV.itemId
                            })
                        },
                        enabled: e && null != t
                    })
                },
                pF = function(e) {
                    var t, r, n = e.robloxSubscriptionProduct,
                        i = e.robloxSubscriptionMembership,
                        o = e.robloxPlusUserBenefits,
                        a = e.isFaeFreeTrial,
                        l = e.onOpenReferrals,
                        u = (0, E.useTranslation)().translate,
                        c = f1().eligibility,
                        s = null == o ? void 0 : o.robuxSavedWithPlus,
                        d = null == o ? void 0 : o.itemsBoughtWithPlusDiscount,
                        f = null == o ? void 0 : o.privateServersCreatedForFree,
                        p = null == o ? void 0 : o.robuxSentToFriends,
                        m = (0, th.useMemo)(function() {
                            return i.activeOffers.some(function(e) {
                                return "FreeTrial" === e.offerType
                            })
                        }, [i.activeOffers]),
                        y = (0, th.useMemo)(function() {
                            return pa(i.activationTimestampMs, i.periodType, i.nextRenewalTimestampMs, Date.now())
                        }, [i.activationTimestampMs, i.nextRenewalTimestampMs, i.periodType]),
                        b = (0, th.useMemo)(function() {
                            var e, t, r, o, a, l, u, c, s, d, f;
                            return t = rb(n), r = null == (e = i.productTypeMembershipDetails.robloxSubscriptionMembershipDetails) ? void 0 : e.features.virtualTransactionDiscountTierId, d = t.virtualTransactionDiscounts, f = null != (o = null == (l = r ? null != (u = null != (c = null == d ? void 0 : d.find(function(e) {
                                return e.tierId === r
                            })) ? c : null == d ? void 0 : d.toSorted(function(e, t) {
                                return t.periodIndex - e.periodIndex
                            })[0]) ? u : null : null != (s = null == d ? void 0 : d.filter(function(e) {
                                return e.periodIndex <= y
                            }).toSorted(function(e, t) {
                                return t.periodIndex - e.periodIndex
                            })[0]) ? s : null) ? void 0 : l.periodIndex) ? o : y, {
                                current: l,
                                next: null != (a = null == d ? void 0 : d.filter(function(e) {
                                    return e.periodIndex > f
                                }).toSorted(function(e, t) {
                                    return e.periodIndex - t.periodIndex
                                })[0]) ? a : null
                            }
                        }, [n, i.productTypeMembershipDetails, y]),
                        h = null != (t = null == (r = b.current) ? void 0 : r.discountPercent) ? t : 0,
                        g = pB(!1).data;
                    return (0, T.jsx)("div", {
                        className: "flex flex-col items-center",
                        children: (0, T.jsxs)("div", {
                            className: "margin-top-[48px] padding-x-xlarge content-emphasis gap-y-xxlarge width-full large:max-width-[792px] flex flex-col",
                            children: [!1, a && (0, T.jsx)(f2, {
                                body: u("Subtext.FreeTrialBanner", {
                                    date: new Date(i.expirationTimestampMs).toLocaleDateString(void 0, {
                                        day: "2-digit",
                                        month: "short",
                                        year: "numeric"
                                    })
                                }),
                                title: u("Header.FreeTrialBannerTitle")
                            }), (0, T.jsxs)("div", {
                                className: "gap-y-small large:items-center flex flex-col",
                                children: [(0, T.jsx)(dT, {}), (0, T.jsx)(px, {
                                    activationTimestampMs: i.activationTimestampMs,
                                    expirationTimestampMs: i.expirationTimestampMs,
                                    hasFreeTrial: m,
                                    nextRenewalTimestampMs: i.nextRenewalTimestampMs
                                }), (0, T.jsx)(pl, {
                                    activationTimestampMs: i.activationTimestampMs,
                                    currentDiscountPercent: h,
                                    isCancelled: null === i.nextRenewalTimestampMs || 0 === i.nextRenewalTimestampMs,
                                    nextDiscount: b.next,
                                    periodType: i.periodType
                                })]
                            }), (0, T.jsxs)("div", {
                                className: "flex flex-col gap-y-[32px]",
                                children: [tp() && "Eligible" === c ? (0, T.jsx)(py, {
                                    children: (0, T.jsx)(pg, {
                                        onOpenDashboard: l
                                    })
                                }) : null, (0, T.jsx)(pw, {
                                    currentDiscountPercent: h,
                                    itemsBoughtWithDiscountCount: d,
                                    privateServersCreatedCount: f,
                                    robuxSentToFriendsCount: p,
                                    savedRobux: s
                                }), (0, T.jsx)(pj, {
                                    featureConfig: rb(n)
                                }), (0, T.jsx)(rc, {
                                    children: (0, T.jsx)("div", {
                                        className: "gap-y-medium flex flex-col",
                                        children: (0, T.jsx)(ph, {
                                            robloxSubscriptionProduct: n
                                        })
                                    })
                                })]
                            })]
                        })
                    })
                };

            function pY(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var pG = function(e) {
                    var t, r, n, i = e.deviceMeta,
                        o = e.robloxSubscriptionProduct,
                        a = e.onDismiss,
                        l = (0, E.useTranslation)().translate,
                        u = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, th.useState)(null)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return pY(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return pY(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        c = u[0],
                        s = u[1];
                    (0, th.useEffect)(function() {
                        window.scrollTo({
                            top: 0,
                            behavior: "smooth"
                        })
                    }, []);
                    var d = !i.isInApp && (0, T.jsxs)("div", {
                        "aria-label": l("Action.OK"),
                        className: "bottom-dock padding-t-medium bg-surface-100 large:hidden width-full gap-y-medium flex flex-col",
                        "data-testid": "welcome-dismiss-dock",
                        role: "region",
                        children: [(0, T.jsx)(rd, {}), (0, T.jsx)("div", {
                            className: "width-full gap-y-medium padding-bottom-[env(safe-area-inset-bottom\\,0px)] padding-x-xxlarge flex flex-col items-stretch",
                            children: (0, T.jsx)(t4, {
                                className: "min-width-0 width-full margin-bottom-[24px] large:margin-bottom-none",
                                size: "Large",
                                variant: "Emphasis",
                                onClick: a,
                                children: l("Action.OK")
                            })
                        })]
                    });
                    return (0, T.jsxs)(th.Fragment, {
                        children: [(0, T.jsx)(rs, {}), (0, T.jsx)("div", {
                            className: "width-full min-width-0 large:items-center flex flex-col items-start",
                            children: (0, T.jsxs)("div", {
                                className: "margin-top-[48px] width-full min-width-0 content-emphasis large:max-width-[792px] large:gap-y-[60px] large:self-auto large:padding-x-xlarge flex flex-col gap-y-[var(--size-1200)] self-stretch",
                                children: [(0, T.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge text-align-x-start large:gap-y-[24px] large:items-center large:padding-x-none large:text-align-x-center flex flex-col items-start",
                                    children: [(0, T.jsxs)("div", {
                                        className: "gap-y-xsmall large:items-center flex flex-col items-start",
                                        children: [(0, T.jsx)(tI, {
                                            className: "!size-1800 margin-bottom-medium",
                                            name: "icon-regular-roblox-plus"
                                        }), (0, T.jsx)("h1", {
                                            className: "text-heading-large",
                                            children: l("Title.Welcome", {
                                                productShort: l("Label.BlackbirdShort")
                                            })
                                        }), (0, T.jsx)("p", {
                                            className: "text-body-large content-default",
                                            children: l("Description.Welcome", {
                                                product: l("Label.Blackbird")
                                            })
                                        })]
                                    }), !i.isInApp && (0, T.jsx)("div", {
                                        className: "width-full gap-y-medium padding-t-none large:margin-x-auto large:margin-top-[12px] large:flex large:max-width-[min(440px,100%)] large:width-full large:flex-col large:items-center hidden items-start",
                                        "data-testid": "welcome-dismiss-inline",
                                        children: (0, T.jsx)("div", {
                                            className: "width-full gap-x-small flex shrink-0 flex-row items-start justify-center",
                                            children: (0, T.jsx)(t4, {
                                                className: "width-full large:width-[230px] shrink-0",
                                                size: "Medium",
                                                variant: "Emphasis",
                                                onClick: a,
                                                children: l("Action.OK")
                                            })
                                        })
                                    })]
                                }), (0, T.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge large:padding-x-none flex flex-col",
                                    children: [(0, T.jsx)("span", {
                                        className: "text-heading-small",
                                        children: l("Title.BenefitsUnlocked")
                                    }), (0, T.jsx)(ru, {
                                        featureConfig: rb(o),
                                        includeReferralBenefit: !0,
                                        overrideIconName: "icon-filled-check",
                                        periodType: o.periodType,
                                        onTileClick: function(e, t) {
                                            s({
                                                primary: e,
                                                secondary: t
                                            })
                                        }
                                    })]
                                })]
                            })
                        }), d, (0, T.jsx)(fI, {
                            body: null != (r = null == c ? void 0 : c.secondary) ? r : "",
                            open: null != c,
                            title: null != (n = null == c ? void 0 : c.primary) ? n : "",
                            onOpenChange: function(e) {
                                e || s(null)
                            }
                        })]
                    })
                },
                pV = sG(window.location.hostname),
                pW = new eU({
                    robloxSiteDomain: pV.rootDomain,
                    basePath: sF(pV.rootDomain, "roblox-subscriptions"),
                    credentials: "include"
                });
            new pe(pW);
            var pQ = new f7(pW);
            new pt(pW);
            var pq = function(e, t) {
                var r = (0, th.useRef)();
                return t(e) && (r.current = e), r.current
            };

            function pK(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function pH(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function pX(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var o = e.apply(t, r);

                        function a(e) {
                            pH(o, n, i, a, l, "next", e)
                        }

                        function l(e) {
                            pH(o, n, i, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function pZ(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return pK(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return pK(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function p$(e, t) {
                var r, n, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(a, "next", {
                    value: u(0)
                }), l(a, "throw", {
                    value: u(1)
                }), l(a, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function u(l) {
                    return function(u) {
                        var c = [l, u];
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
            var pJ = function() {
                    var e, t, r = (0, th.useMemo)(function() {
                            return (0, td.getDeviceMeta)()
                        }, []),
                        n = pZ((0, th.useState)(function() {
                            return new URLSearchParams(window.location.search).has("welcome")
                        }), 2),
                        i = n[0],
                        o = n[1],
                        a = pZ((0, th.useState)(function() {
                            return new URLSearchParams(window.location.search).has("faeFreeTrialConfirmation")
                        }), 2),
                        l = a[0],
                        u = a[1],
                        c = pZ((0, th.useState)(function() {
                            return tp() && new URLSearchParams(window.location.search).has(ty)
                        }), 2),
                        s = c[0],
                        d = c[1],
                        f = (0, th.useRef)(!1),
                        p = pZ((0, th.useState)(i || l), 2),
                        m = p[0],
                        y = p[1],
                        b = (0, C.useQuery)({
                            queryKey: ["get-roblox-subscription-membership"],
                            queryFn: function() {
                                return pX(function() {
                                    var e;
                                    return p$(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, sW.subscriptionsV2ListSubscriptions({
                                                    productType: tt,
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
                            refetchInterval: !!m && 3e3
                        }),
                        h = pq(b.data, function() {
                            return void 0 !== b.data
                        }),
                        g = null == h ? void 0 : h.productKey.id,
                        v = (0, C.useQuery)({
                            queryKey: ["check-fae-free-trial", g],
                            queryFn: function() {
                                return pX(function() {
                                    var e, t;
                                    return p$(this, function(r) {
                                        switch (r.label) {
                                            case 0:
                                                if (!g) return [2, !1];
                                                return [4, sW.subscriptionsV2ListAvailableSubscriptionProducts({
                                                    productType: tt,
                                                    includePurchased: !0,
                                                    grantType: "FaeFreeTrial"
                                                })];
                                            case 1:
                                                if (void 0 === (t = null == (e = r.sent().products.find(function(e) {
                                                        return e.periodType === e4
                                                    })) ? void 0 : e.productKey.id) || t !== g) throw Error("FAE trial product not found yet");
                                                return [2, !0]
                                        }
                                    })
                                })()
                            },
                            enabled: !!h,
                            retry: function(e) {
                                return e < 3
                            },
                            retryDelay: 100
                        }),
                        w = (0, C.useQuery)({
                            queryKey: ["list-roblox-subscription-available-products"],
                            queryFn: function() {
                                return pX(function() {
                                    var e;
                                    return p$(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, sW.subscriptionsV2ListAvailableSubscriptionProducts({
                                                    productType: tt,
                                                    includePurchased: !0,
                                                    includeBundles: !0,
                                                    includeExtendedTermProducts: !0,
                                                    skipEligibilityCheck: !0
                                                })];
                                            case 1:
                                                if (0 === (e = t.sent().products).length) return [2, null];
                                                return [2, e.toSorted(function(e, t) {
                                                    var r, n;
                                                    return rh(e) - rh(t) || (null != (r = rg(e)) ? r : Number.MAX_SAFE_INTEGER) - (null != (n = rg(t)) ? n : Number.MAX_SAFE_INTEGER)
                                                })]
                                        }
                                    })
                                })()
                            },
                            enabled: null === b.data,
                            retry: 3,
                            retryDelay: 100
                        }),
                        x = pq(w.data, function() {
                            return void 0 !== w.data
                        }),
                        j = pq(null != (e = null == (t = b.data) ? void 0 : t.productInfo) ? e : null == x ? void 0 : x[0], function() {
                            var e;
                            return (null == (e = b.data) ? void 0 : e.productInfo) !== void 0 || void 0 !== x
                        }),
                        O = (0, C.useQuery)({
                            queryKey: ["get-roblox-plus-user-benefits"],
                            queryFn: function() {
                                return pQ.robloxPlusGetRobloxPlusUserBenefits()
                            },
                            enabled: !!h,
                            retry: 3
                        }),
                        S = (0, C.useQuery)({
                            queryKey: ["guac/app-policy/disable-blackbird-entrypoints"],
                            queryFn: function() {
                                return pX(function() {
                                    return p$(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return e.trys.push([0, 2, , 3]), [4, (0, ts.callBehaviour)("app-policy")];
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
                        I = pq(S.data, function() {
                            return void 0 !== S.data
                        }),
                        M = (0, th.useCallback)(function() {
                            var e = new URL(window.location.href);
                            e.searchParams.set("welcome", ""), window.history.replaceState(null, "", e.toString()), o(!0)
                        }, []),
                        P = (0, th.useCallback)(function() {
                            var e = function() {
                                try {
                                    var e = sessionStorage.getItem(tb);
                                    if (!e) return null;
                                    sessionStorage.removeItem(tb);
                                    var t = JSON.parse(e);
                                    if ((void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) != "object" || null === t || !("url" in t) || !("ts" in t)) return null;
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
                        N = (0, th.useCallback)(function() {
                            var e = new URL(window.location.href);
                            e.searchParams.delete("faeFreeTrialConfirmation"), window.history.replaceState(null, "", e.toString()), u(!1)
                        }, []),
                        E = (0, th.useCallback)(function() {
                            var e = new URL(window.location.href);
                            e.searchParams.set(ty, ""), window.history.replaceState(null, "", e.toString()), f.current = !0, d(!0)
                        }, []),
                        D = (0, th.useCallback)(function() {
                            if (!f.current) {
                                window.location.href = (0, tc.getAbsoluteUrl)("/home");
                                return
                            }
                            var e = new URL(window.location.href);
                            e.searchParams.delete(ty), window.history.replaceState(null, "", e.toString()), d(!1)
                        }, []);
                    (0, th.useEffect)(function() {
                        if (m) {
                            var e = setTimeout(function() {
                                y(!1)
                            }, 6e4);
                            return function() {
                                clearTimeout(e)
                            }
                        }
                    }, [m]), (0, th.useEffect)(function() {
                        m && b.data && (y(!1), l || M())
                    }, [M, l, m, b.data]);
                    var A = (0, th.useCallback)(function() {
                        y(!0)
                    }, []);
                    if (w.error || null === w.data || b.error && !m || S.error || !r) return (0, T.jsx)(t3, {});
                    if (void 0 === j || void 0 === h || void 0 === I) return (0, T.jsx)(rT, {});
                    var L = null !== h;
                    if (l) return L ? v.isLoading ? (0, T.jsx)(rT, {}) : v.data ? (0, T.jsx)(rj, {
                        robloxSubscriptionProduct: j,
                        onDismiss: N
                    }) : (0, T.jsx)(t3, {}) : m ? (0, T.jsx)(rT, {}) : (0, T.jsx)(t3, {});
                    if (i)
                        if (L) return (0, T.jsx)(pG, {
                            deviceMeta: r,
                            robloxSubscriptionMembership: h,
                            robloxSubscriptionProduct: j,
                            onDismiss: P
                        });
                        else if (m) return (0, T.jsx)(rT, {});
                    else return (0, T.jsx)(t3, {});
                    return s ? (0, T.jsx)(s8, {
                        robloxPlusUserBenefits: O.data,
                        subscribeButtonProps: {
                            productId: j.productKey.id,
                            productType: j.productKey.type,
                            deviceMeta: r,
                            isDisabled: I
                        },
                        onClose: D
                    }) : L ? (0, T.jsx)(pF, {
                        isFaeFreeTrial: !0 === v.data,
                        robloxPlusUserBenefits: O.data,
                        robloxSubscriptionMembership: h,
                        robloxSubscriptionProduct: j,
                        onOpenReferrals: E
                    }) : x ? (0, T.jsx)(f$, {
                        deviceMeta: r,
                        isEntrypointDisabled: I,
                        robloxSubscriptionProducts: x,
                        onMobilePurchaseInitiated: A
                    }) : (0, T.jsx)(rT, {})
                },
                p0 = function(e) {
                    var t = e.children;
                    return (0, T.jsx)("div", {
                        className: "clip-x margin-bottom-[160px] min-height-[400px] padding-top-[16px] large:margin-bottom-[120px] relative",
                        children: t
                    })
                },
                p1 = function() {
                    return (0, T.jsx)(C.QueryClientProvider, {
                        client: E.queryClient,
                        children: (0, T.jsx)(p0, {
                            children: (0, T.jsx)(pJ, {})
                        })
                    })
                };
            A()(function() {
                (0, E.renderWithErrorBoundary)((0, T.jsx)(E.TranslationProvider, {
                    config: L.P,
                    children: (0, T.jsx)(p1, {})
                }), document.getElementById("roblox-subscription-container"), void 0, (0, T.jsx)(p0, {
                    children: (0, T.jsx)(t3, {})
                }))
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("RobloxSubscription");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/robloxSubscription-61fa875fbca5d90a.js.map