! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "5b42a8e48f021ad0f745f0922c47718c750d36c6"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "6ec14e9c-def8-46d9-a737-6bd9d4449ae0", e._sentryDebugIdIdentifier = "sentry-dbid-6ec14e9c-def8-46d9-a737-6bd9d4449ae0")
    } catch (e) {}
}(),
function() {
    var e = {
            977: function(e, t, r) {
                function n(e) {
                    return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }
                var o = 0 / 0,
                    i = /^\s+|\s+$/g,
                    a = /^[-+]0x[0-9a-f]+$/i,
                    l = /^0b[01]+$/i,
                    s = /^0o[0-7]+$/i,
                    c = parseInt,
                    u = (void 0 === r.g ? "undefined" : n(r.g)) == "object" && r.g && r.g.Object === Object && r.g,
                    d = ("u" < typeof self ? "undefined" : n(self)) == "object" && self && self.Object === Object && self,
                    f = u || d || Function("return this")(),
                    p = Object.prototype.toString,
                    m = Math.max,
                    y = Math.min,
                    h = function() {
                        return f.Date.now()
                    };

                function b(e) {
                    var t = void 0 === e ? "undefined" : n(e);
                    return !!e && ("object" == t || "function" == t)
                }

                function v(e) {
                    if ("number" == typeof e) return e;
                    if ((void 0 === (t = e) ? "undefined" : n(t)) == "symbol" || t && (void 0 === t ? "undefined" : n(t)) == "object" && "[object Symbol]" == p.call(t)) return o;
                    if (b(e)) {
                        var t, r = "function" == typeof e.valueOf ? e.valueOf() : e;
                        e = b(r) ? r + "" : r
                    }
                    if ("string" != typeof e) return 0 === e ? e : +e;
                    e = e.replace(i, "");
                    var u = l.test(e);
                    return u || s.test(e) ? c(e.slice(2), u ? 2 : 8) : a.test(e) ? o : +e
                }
                e.exports = function(e, t, r) {
                    var n, o, i, a, l, s, c = 0,
                        u = !1,
                        d = !1,
                        f = !0;
                    if ("function" != typeof e) throw TypeError("Expected a function");

                    function p(t) {
                        var r = n,
                            i = o;
                        return n = o = void 0, c = t, a = e.apply(i, r)
                    }

                    function g(e) {
                        var r = e - s,
                            n = e - c;
                        return void 0 === s || r >= t || r < 0 || d && n >= i
                    }

                    function w() {
                        var e, r, n, o = h();
                        if (g(o)) return x(o);
                        l = setTimeout(w, (e = o - s, r = o - c, n = t - e, d ? y(n, i - r) : n))
                    }

                    function x(e) {
                        return (l = void 0, f && n) ? p(e) : (n = o = void 0, a)
                    }

                    function S() {
                        var e, r = h(),
                            i = g(r);
                        if (n = arguments, o = this, s = r, i) {
                            if (void 0 === l) return c = e = s, l = setTimeout(w, t), u ? p(e) : a;
                            if (d) return l = setTimeout(w, t), p(s)
                        }
                        return void 0 === l && (l = setTimeout(w, t)), a
                    }
                    return t = v(t) || 0, b(r) && (u = !!r.leading, i = (d = "maxWait" in r) ? m(v(r.maxWait) || 0, t) : i, f = "trailing" in r ? !!r.trailing : f), S.cancel = function() {
                        void 0 !== l && clearTimeout(l), c = 0, n = s = o = l = void 0
                    }, S.flush = function() {
                        return void 0 === l ? a : x(h())
                    }, S
                }
            },
            773: function(e, t) {
                "use strict";
                Object.defineProperty(t, "__esModule", {
                    value: !0
                });
                var r, n, o, i = {
                        exports: {}
                    },
                    a = i.exports = {};

                function l() {
                    throw Error("setTimeout has not been defined")
                }

                function s() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    r = "function" == typeof setTimeout ? setTimeout : l
                } catch (e) {
                    r = l
                }
                try {
                    n = "function" == typeof clearTimeout ? clearTimeout : s
                } catch (e) {
                    n = s
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
                var u = [],
                    d = !1,
                    f = -1;

                function p() {
                    d && o && (d = !1, o.length ? u = o.concat(u) : f = -1, u.length && m())
                }

                function m() {
                    if (!d) {
                        var e = c(p);
                        d = !0;
                        for (var t = u.length; t;) {
                            for (o = u, u = []; ++f < t;) o && o[f].run();
                            f = -1, t = u.length
                        }
                        o = null, d = !1,
                            function(e) {
                                if (n === clearTimeout) return clearTimeout(e);
                                if ((n === s || !n) && clearTimeout) return n = clearTimeout, clearTimeout(e);
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

                function b() {}
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
                var v = i.exports.browser,
                    g = i.exports.binding,
                    w = {},
                    x = "browser",
                    S = "browser",
                    O = "browser",
                    P = [],
                    I = {
                        nextTick: i.exports.nextTick,
                        title: i.exports.title,
                        browser: v,
                        env: i.exports.env,
                        argv: i.exports.argv,
                        version: i.exports.version,
                        versions: i.exports.versions,
                        on: i.exports.on,
                        addListener: i.exports.addListener,
                        once: i.exports.once,
                        off: i.exports.off,
                        removeListener: i.exports.removeListener,
                        removeAllListeners: i.exports.removeAllListeners,
                        emit: i.exports.emit,
                        emitWarning: b,
                        prependListener: i.exports.prependListener,
                        prependOnceListener: i.exports.prependOnceListener,
                        listeners: i.exports.listeners,
                        binding: g,
                        cwd: i.exports.cwd,
                        chdir: i.exports.chdir,
                        umask: i.exports.umask,
                        exit: b,
                        pid: 1,
                        features: w,
                        kill: b,
                        dlopen: b,
                        uptime: b,
                        memoryUsage: b,
                        uvCounters: b,
                        platform: x,
                        arch: S,
                        execPath: O,
                        execArgv: P
                    };
                t.addListener = i.exports.addListener, t.arch = S, t.argv = i.exports.argv, t.binding = g, t.browser = v, t.chdir = i.exports.chdir, t.cwd = i.exports.cwd, t.default = I, t.dlopen = b, t.emit = i.exports.emit, t.emitWarning = b, t.env = i.exports.env, t.execArgv = P, t.execPath = O, t.exit = b, t.features = w, t.kill = b, t.listeners = i.exports.listeners, t.memoryUsage = b, t.nextTick = i.exports.nextTick, t.off = i.exports.off, t.on = i.exports.on, t.once = i.exports.once, t.pid = 1, t.platform = x, t.prependListener = i.exports.prependListener, t.prependOnceListener = i.exports.prependOnceListener, t.removeAllListeners = i.exports.removeAllListeners, t.removeListener = i.exports.removeListener, t.title = i.exports.title, t.umask = i.exports.umask, t.uptime = b, t.uvCounters = b, t.version = i.exports.version, t.versions = i.exports.versions, e.exports = I
            }
        },
        t = {};

    function r(n) {
        var o = t[n];
        if (void 0 !== o) return o.exports;
        var i = t[n] = {
            exports: {}
        };
        return e[n](i, i.exports, r), i.exports
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
            var e, t, n, o, i, a, l, s, c, u, d, f, p, m, y, h, b, v, g, w, x, S = window.ReactJSX,
                O = window.Roblox["core-scripts"].react,
                P = window.Roblox["core-scripts"].util.ready,
                I = r.n(P),
                j = JSON.parse('{"P":["Feature.RobloxSubscription"]}'),
                E = window.TanstackQuery;

            function T(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
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

            function A(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function r() {
                    this.constructor = e
                }
                N(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
            }
            var C = function() {
                return (C = Object.assign || function(e) {
                    for (var t, r = 1, n = arguments.length; r < n; r++)
                        for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                    return e
                }).apply(this, arguments)
            };

            function D(e, t, r, n) {
                return new(r || (r = Promise))(function(o, i) {
                    function a(e) {
                        try {
                            s(n.next(e))
                        } catch (e) {
                            i(e)
                        }
                    }

                    function l(e) {
                        try {
                            s(n.throw(e))
                        } catch (e) {
                            i(e)
                        }
                    }

                    function s(e) {
                        var t;
                        e.done ? o(e.value) : (T(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, l)
                    }
                    s((n = n.apply(e, t || [])).next())
                })
            }

            function R(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(s) {
                        var c = [l, s];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        i.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && i.label < o[1]) {
                                        i.label = o[1], o = c;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(c);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            c = t.call(e, i)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = o = 0
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
                    for (var n, o = 0, i = t.length; o < i; o++) !n && o in t || (n || (n = Array.prototype.slice.call(t, 0, o)), n[o] = t[o]);
                return e.concat(n || Array.prototype.slice.call(t))
            }
            "function" == typeof SuppressedError && SuppressedError;
            var _ = {
                    envName: ""
                },
                M = !1,
                U = function() {
                    try {
                        if ("u" < typeof window) return C({}, _);
                        var e = localStorage.getItem("Roblox.MrRouterConfig");
                        if (null == e) return C({}, _);
                        var t = JSON.parse(e);
                        if ("object" != (void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) || null === t) return C({}, _);
                        var r = C(C({}, _), "envName" in t && "string" == typeof t.envName && {
                            envName: t.envName
                        });
                        return r.envName && !M && (M = !0, console.warn('[MrRouter] Routing to non-production environment: "'.concat(r.envName, '"'))), r
                    } catch (e) {
                        return C({}, _)
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
                        o = n ? n.split(",") : [],
                        i = o.findIndex(function(e) {
                            return G(e) === L
                        });
                    if (-1 === i) return k(k([], o.map(function(e) {
                        return e.trim()
                    }), !0), [r], !1).join(",");
                    var a = o.filter(function(e) {
                        return G(e) !== L
                    }).map(function(e) {
                        return e.trim()
                    });
                    return a.splice(i, 0, r), a.join(",")
                },
                q = function(e) {
                    var t = new Uint8Array(e);
                    return crypto.getRandomValues(t), Array.from(t, function(e) {
                        return e.toString(16).padStart(2, "0")
                    }).join("")
                },
                K = "u" > typeof crypto && "function" == typeof crypto.randomUUID,
                V = function() {
                    return K ? crypto.randomUUID().replaceAll("-", "").slice(0, 32) : q(16)
                },
                W = function() {
                    return K ? crypto.randomUUID().replaceAll("-", "").slice(0, 16) : q(8)
                },
                H = function(e) {
                    var t = U().envName;
                    if (t.length > 0 && (e[B] = z(e[B], t), !e[F])) {
                        var r = V(),
                            n = W();
                        e[F] = "00-".concat(r, "-").concat(n, "-01")
                    }
                };

            function X(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            r(773);
            var $, Y = function(e) {
                    return e.replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/\d+/, "/number")
                },
                J = function(e, t) {
                    return !1 === t.ok && !1 === [401, 403, 404].includes(t.status) && e(Error("Network error"), {
                        tags: {
                            apiUrl: Y(t.url),
                            apiStatus: null == t ? void 0 : t.status,
                            cors: !1
                        }
                    }), t
                },
                Q = function(e, t) {
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
                        return D(this, void 0, void 0, function() {
                            return R(this, function(t) {
                                return [2, J(this.captureException, e.response)]
                            })
                        })
                    }, e.prototype.onError = function(e) {
                        return D(this, void 0, void 0, function() {
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
                eo = function(e, t, r) {
                    return void 0 === r && (r = 1500), new Promise(function(n, o) {
                        var i, a, l = performance.now(),
                            s = window.setTimeout(function() {
                                er(e, performance.now() - l),
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
                                    }(e), o(Error("Promise timed out after ".concat(r, " ms")))
                            }, r),
                            c = i = function(t) {
                                var r = t.data;
                                t.origin === "https://www.".concat(e) && "dataFromHbaFrame" === r.msg && "loaded" === r.data.type && (window.removeEventListener("message", i, !1), window.clearTimeout(s), er(e, performance.now() - l), n())
                            };
                        window.addEventListener("message", c, !1), null == (a = t.contentWindow) || a.postMessage({
                            msg: "checkLoadedRequest"
                        }, "https://www.".concat(e))
                    })
                },
                ei = function(e, t, r, n, o, i, a) {
                    var l;
                    if (void 0 === a && (a = 100), window) {
                        var s, c = performance.now(),
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
                                        url: o.url,
                                        init: o.init
                                    })
                            }, a),
                            d = s = function(t) {
                                var n = t.data,
                                    a = o.url,
                                    l = o.init;
                                if (t.origin === "https://www.".concat(r) && "dataFromHbaFrame" === n.msg && "batHeader" === n.data.type && (!n.data.identifier || n.data.identifier === i))
                                    if (!n.data.isError && n.data.batHeader) {
                                        window.clearTimeout(u), window.removeEventListener("message", s, !1), en(r, performance.now() - c);
                                        var d = n.data.batHeader;
                                        e({
                                            url: a,
                                            init: C(C({}, l), {
                                                headers: C(C({}, l.headers), {
                                                    "x-bound-auth-token": d["x-bound-auth-token"]
                                                })
                                            })
                                        })
                                    } else window.clearTimeout(u), window.removeEventListener("message", s, !1), en(r, performance.now() - c), e({
                                        url: a,
                                        init: l
                                    })
                            };
                        window.addEventListener("message", d, !1), null == (l = n.contentWindow) || l.postMessage({
                            msg: "signSubdomainRequest",
                            identifier: i,
                            serializedSubdomainRequestData: JSON.stringify({
                                url: o.url,
                                requestInit: o.init
                            })
                        }, "https://www.".concat(r))
                    }
                },
                ea = function() {
                    return crypto.randomUUID()
                },
                el = function() {
                    function e(e, t, r) {
                        void 0 === t && (t = 1500), void 0 === r && (r = 100), this.robloxSiteDomain = e, this.hbaFrameAlreadyLoaded = !1, this.hbaFrameLoadFailed = !1, this.hbaFrame = null, this.loadTimeOut = t, this.dataTimeOut = r
                    }
                    return e.prototype.getOrCreateHbaFrame = function() {
                        return ee(this.robloxSiteDomain)
                    }, e.prototype.pre = function(e) {
                        var t = this;
                        return new Promise(function(r, n) {
                            var o = e.url,
                                i = e.init;
                            if (t.hbaFrame = t.getOrCreateHbaFrame(), null !== t.hbaFrame) {
                                var a = ea();
                                t.hbaFrameAlreadyLoaded ? ei(r, 0, t.robloxSiteDomain, t.hbaFrame, e, a, t.dataTimeOut) : t.hbaFrameLoadFailed ? r({
                                    url: o,
                                    init: i
                                }) : eo(t.robloxSiteDomain, t.hbaFrame, t.loadTimeOut).then(function() {
                                    t.hbaFrame ? (t.hbaFrameAlreadyLoaded = !0, ei(r, 0, t.robloxSiteDomain, t.hbaFrame, e, a, t.dataTimeOut)) : r({
                                        url: o,
                                        init: i
                                    })
                                }).catch(function() {
                                    t.hbaFrameLoadFailed = !0, r({
                                        url: o,
                                        init: i
                                    })
                                })
                            } else r({
                                url: o,
                                init: i
                            })
                        })
                    }, e
                }();
            (n = $ || ($ = {})).UNKNOWN = "unknown", n.INVALIDATED = "invalidated", n.ABANDONED = "abandoned", n.LOADFAILED = "loadfailed";
            var es = function(e) {
                    function t(t) {
                        var r = e.call(this, "challenge error for challenge kind ".concat(t.kind)) || this;
                        return r.parameters = t, r
                    }
                    return A(t, e), t.prototype.match = function(e) {
                        return this.parameters.kind === e.parameters.kind && JSON.stringify(this.parameters.data) === JSON.stringify(e.parameters.data)
                    }, t.prototype.matchAbandoned = function(e) {
                        return this.match(e) && e.parameters.kind === $.ABANDONED
                    }, t
                }(Error),
                ec = "rblx-challenge-id",
                eu = "rblx-challenge-type",
                ed = "rblx-challenge-metadata",
                ef = function(e, t) {
                    return 403 === e.status && e.headers.has(ec) && e.headers.has(eu) && e.headers.has(ed) && "iframe" === t
                },
                ep = function(e) {
                    var t, r, n, o, i, a, l, s, c, u = e.url,
                        d = e.request,
                        f = e.response,
                        p = e.robloxSiteDomain,
                        m = (i = new URLSearchParams([
                            ["challenge-type", "generic"],
                            ["dark-mode", "true"],
                            ["barista-mode", "true"],
                            ["generic-challenge-type", null != (t = f.headers.get(eu)) ? t : ""],
                            ["generic-challenge-id", null != (r = f.headers.get(ec)) ? r : ""],
                            ["challenge-metadata-json", null != (n = f.headers.get(ed)) ? n : ""],
                            ["origin", null != (o = window.location.hostname.split(".").slice(0, -2).join(".")) ? o : ""]
                        ]), a = new URL("https://www.".concat(p, "/challenge/cdn/hybrid?").concat(i.toString())), (l = document.createElement("iframe")).id = "challenge-frame", l.allowFullscreen = !0, l.setAttribute("allowtransparency", "true"), l.setAttribute("allow", "publickey-credentials-get;publickey-credentials-create"), l.style.cssText = "position: fixed; top: 0; left: 0; width: 100%; height: 100%; visibility: hidden; color-scheme: normal; border: none; z-index: 2147483647;", l.src = a.toString(), l.onload = function() {
                            l.style.visibility = "visible"
                        }, s = l, document && document.body ? document.body.appendChild(s) : null);
                    return new Promise(function(e, t) {
                        window && m && (c = function(r) {
                            var n, o, i, a, l, s, c, p, m, y, h;
                            if (r.data && r.data.genericChallengeResponse) switch (r.data.genericChallengeResponse.type) {
                                case "challengeAbandoned":
                                    t(new es({
                                        kind: $.ABANDONED,
                                        data: {
                                            challengeType: null != (n = f.headers.get(eu)) ? n : ""
                                        }
                                    }));
                                    break;
                                case "challengeDisplayed":
                                    break;
                                case "challengeCompleted":
                                    (c = r.data.genericChallengeResponse.data).challengeType && c.metadata ? e((p = c.metadata, fetch(u, C(C({}, d), {
                                        headers: C(C({}, d.headers), ((m = {})[ec] = null != (y = f.headers.get(ec)) ? y : "", m[ed] = btoa(JSON.stringify(p)), m[eu] = null != (h = f.headers.get(eu)) ? h : "", m))
                                    })))) : t(new es({
                                        kind: $.UNKNOWN,
                                        data: {
                                            challengeType: null != (o = f.headers.get(eu)) ? o : ""
                                        }
                                    }));
                                    break;
                                case "challengeInvalidated":
                                    t((c = r.data.genericChallengeResponse.data) && c.challengeType && c.metadata ? new es({
                                        kind: $.INVALIDATED,
                                        data: c
                                    }) : new es({
                                        kind: $.INVALIDATED,
                                        data: {
                                            challengeType: null != (i = f.headers.get(eu)) ? i : ""
                                        }
                                    }));
                                    break;
                                case "challengeParsed":
                                    !1 === (c = r.data.genericChallengeResponse.data).parsed && t(new es({
                                        kind: $.UNKNOWN,
                                        data: {
                                            challengeType: null != (a = f.headers.get(eu)) ? a : ""
                                        }
                                    }));
                                    break;
                                case "challengeInitialized":
                                    !1 === (c = r.data.genericChallengeResponse.data).initialized && t(new es({
                                        kind: $.UNKNOWN,
                                        data: {
                                            challengeType: null != (l = f.headers.get(eu)) ? l : ""
                                        }
                                    }));
                                    break;
                                case "challengePageLoaded":
                                    !1 === (c = r.data.genericChallengeResponse.data).pageLoaded && t(new es({
                                        kind: $.LOADFAILED,
                                        data: {
                                            challengeType: null != (s = f.headers.get(eu)) ? s : ""
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
                        o = e.schemaPath;
                    return {
                        eventName: "apiVitals",
                        parameters: {
                            elapsedTime: String(t),
                            apiUrl: r,
                            statusCode: String(n),
                            schemaPath: o
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
                eb = "x-csrf-token",
                ev = ["POST", "PATCH", "DELETE", "PUT"],
                eg = function() {
                    var e, t = "";
                    try {
                        "u" > typeof window && (t = null != (e = localStorage.getItem(eb)) ? e : "")
                    } catch (e) {
                        console.warn("Error reading localStorage key “".concat(eb, "”:"), e)
                    }
                    return t
                },
                ew = eg(),
                ex = function(e) {
                    try {
                        ew = e, "u" > typeof window && localStorage.setItem(eb, e)
                    } catch (e) {
                        console.warn("Error setting localStorage key “".concat(eb, "”:"), e)
                    }
                },
                eS = function() {
                    function e() {
                        this.currentToken = eg()
                    }
                    return e.prototype.pre = function(e) {
                        var t, r = e.url,
                            n = e.init,
                            o = this.currentToken;
                        return n.headers && "object" == ((t = n.headers) && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) && eb in n.headers && (o = n.headers[eb]) && (this.currentToken = o, ex(o)), n.method && ev.includes(n.method) ? Promise.resolve({
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
                            o = e.response,
                            i = o.headers.get(eb);
                        return 403 === o.status && o.headers.has(eb) && null !== i ? (this.currentToken = i, ex(i), t(r, this.prepareRequestInit(n))) : Promise.resolve(o)
                    }, e.prototype.prepareRequestInit = function(e) {
                        var t;
                        return C(C({}, e), {
                            headers: C(C({}, e.headers), ((t = {})[eb] = this.currentToken, t))
                        })
                    }, e
                }(),
                eO = [],
                eP = function(e) {
                    eO = eO.filter(function(t) {
                        return t !== e
                    })
                },
                eI = function(e) {
                    var t = e.url;
                    503 === e.status && eO.forEach(function(e) {
                        return e(t)
                    })
                },
                ej = function() {
                    function e() {}
                    return e.prototype.subscribe = function(e) {
                        return eO.push(e),
                            function() {
                                return eP(e)
                            }
                    }, e.prototype.unsubscribe = function(e) {
                        return eP(e)
                    }, e.prototype.post = function(e) {
                        var t = e.response;
                        return eI(t), Promise.resolve(t)
                    }, e
                }(),
                eE = function() {
                    function e() {}
                    return e.prototype.pre = function(e) {
                        var t = e.url,
                            r = e.init;
                        if (!U().envName) return Promise.resolve({
                            url: t,
                            init: r
                        });
                        var n = C({}, r.headers);
                        return H(n), Promise.resolve({
                            url: t,
                            init: C(C({}, r), {
                                headers: n
                            })
                        })
                    }, e
                }(),
                eT = new eS,
                eN = new ej,
                eA = [function(e) {
                    return e.captureException ? new Z(e.captureException) : void 0
                }, function(e) {
                    return e.robloxSiteDomain && e.enableBoundAuthToken ? new el(e.robloxSiteDomain, e.boundAuthTokenLoadTimeout, e.boundAuthTokenDataTimeout) : void 0
                }, function(e) {
                    return e.robloxSiteDomain ? new em(e.robloxSiteDomain, e.genericChallengeMiddlewareType) : void 0
                }, function(e) {
                    return e.unifiedLogger ? new eh(e.unifiedLogger) : void 0
                }, function() {
                    return eT
                }, function() {
                    return eN
                }, function(e) {
                    return e.enableMrRouter ? new eE : void 0
                }],
                eC = function() {
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
                                    return function t(r, n, o) {
                                        void 0 === o && (o = "");
                                        var i = o + (o.length ? "[".concat(r, "]") : r);
                                        if (X(n, Array)) {
                                            var a = n.map(function(e) {
                                                return encodeURIComponent(String(e))
                                            }).join("&".concat(encodeURIComponent(i), "="));
                                            return "".concat(encodeURIComponent(i), "=").concat(a)
                                        }
                                        return X(n, Set) ? t(r, Array.from(n), o) : X(n, Date) ? "".concat(encodeURIComponent(i), "=").concat(encodeURIComponent(n.toISOString())) : X(n, Object) ? e(n, i) : "".concat(encodeURIComponent(i), "=").concat(encodeURIComponent(String(n)))
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
                                return D(e, void 0, void 0, function() {
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
                eD = new eC,
                eR = function() {
                    function e(e) {
                        void 0 === e && (e = eD);
                        var t = this;
                        this.configuration = e, this.fetchApi = function(e, r, n) {
                            return D(t, void 0, void 0, function() {
                                var t, o, i, a, l, s, c, u, d, f, p, m, y, h = this;
                                return R(this, function(b) {
                                    switch (b.label) {
                                        case 0:
                                            t = function(e, t) {
                                                return h.fetchApi(e, t, n)
                                            }, o = {
                                                url: e,
                                                init: r
                                            }, i = 0, a = this.middleware, b.label = 1;
                                        case 1:
                                            return i < a.length ? (y = a[i]).pre ? [4, y.pre(C({
                                                fetch: t
                                            }, o))] : [3, 3] : [3, 4];
                                        case 2:
                                            o = b.sent() || o, b.label = 3;
                                        case 3:
                                            return i++, [3, 1];
                                        case 4:
                                            l = void 0, s = performance.now(), b.label = 5;
                                        case 5:
                                            return b.trys.push([5, 7, , 12]), [4, (this.configuration.fetchApi || fetch)(o.url, o.init)];
                                        case 6:
                                            return l = b.sent(), c = performance.now(), [3, 12];
                                        case 7:
                                            u = b.sent(), c = performance.now(), d = 0, f = this.middleware, b.label = 8;
                                        case 8:
                                            return d < f.length ? (y = f[d]).onError ? [4, y.onError({
                                                fetch: t,
                                                url: o.url,
                                                init: o.init,
                                                error: u,
                                                response: l ? l.clone() : void 0
                                            })] : [3, 10] : [3, 11];
                                        case 9:
                                            l = b.sent() || l, b.label = 10;
                                        case 10:
                                            return d++, [3, 8];
                                        case 11:
                                            if (void 0 === l) throw X(u, Error) ? new e_(u, "The request failed and the interceptors did not return an alternative response") : u;
                                            return [3, 12];
                                        case 12:
                                            p = 0, m = this.middleware, b.label = 13;
                                        case 13:
                                            return p < m.length ? (y = m[p]).post ? [4, y.post({
                                                fetch: t,
                                                url: o.url,
                                                init: o.init,
                                                response: l.clone(),
                                                elapsedTime: c - s,
                                                schemaPath: n
                                            })] : [3, 15] : [3, 16];
                                        case 14:
                                            l = b.sent() || l, b.label = 15;
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
                        return D(this, void 0, void 0, function() {
                            var r, n, o, i;
                            return R(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        return [4, this.createFetchParams(e, t)];
                                    case 1:
                                        return n = (r = a.sent()).url, o = r.init, [4, this.fetchApi(n, o, e.schemaPath)];
                                    case 2:
                                        if ((i = a.sent()) && i.status >= 200 && i.status < 300) return [2, i];
                                        throw new ek(i, "Response from ".concat(i.url, " returned an error code ").concat(i.status))
                                }
                            })
                        })
                    }, e.prototype.createFetchParams = function(e, t) {
                        return D(this, void 0, void 0, function() {
                            var r, n, o, i, a, l, s, c = this;
                            return R(this, function(u) {
                                var d, f;
                                switch (u.label) {
                                    case 0:
                                        return r = this.configuration.basePath + e.path, void 0 !== e.query && 0 !== Object.keys(e.query).length && (r += "?" + this.configuration.queryParamsStringify(e.query)), Object.keys(n = Object.assign({}, this.configuration.headers, e.headers)).forEach(function(e) {
                                            return void 0 === n[e] ? delete n[e] : {}
                                        }), o = "function" == typeof t ? t : function() {
                                            return D(c, void 0, void 0, function() {
                                                return R(this, function(e) {
                                                    return [2, t]
                                                })
                                            })
                                        }, i = {
                                            method: e.method,
                                            headers: n,
                                            body: e.body,
                                            credentials: this.configuration.credentials
                                        }, l = [C({}, i)], [4, o({
                                            init: i,
                                            context: e
                                        })];
                                    case 1:
                                        return a = C.apply(void 0, l.concat([u.sent()])), s = C(C({}, a), {
                                            body: (d = a.body, "u" > typeof FormData && X(d, FormData) || X(a.body, URLSearchParams) || (f = a.body, "u" > typeof Blob && X(f, Blob)) ? a.body : JSON.stringify(a.body))
                                        }), [2, {
                                            url: r,
                                            init: s
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
                    return A(t, e), t
                }(Error),
                e_ = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.cause = t, n.name = "FetchError", n
                    }
                    return A(t, e), t
                }(Error),
                eM = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.field = t, n.name = "RequiredError", n
                    }
                    return A(t, e), t
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
                        return D(this, void 0, void 0, function() {
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
                    return D(this, void 0, void 0, function() {
                        return R(this, function(e) {
                            return [2, void 0]
                        })
                    })
                }, (function(e) {
                    this.raw = e
                }).prototype.value = function() {
                    return D(this, void 0, void 0, function() {
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
                        return D(this, void 0, void 0, function() {
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
                        var r, n = C({}, t),
                            o = n.middleware || [];
                        return o.unshift.apply(o, (r = t, eA.map(function(e) {
                            return e(r)
                        }).filter(function(e) {
                            return e
                        }))), n.middleware = o, e.call(this, n) || this
                    }
                    return A(t, e), t
                }(eC);

            function eG(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
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
                return new(r || (r = Promise))(function(o, i) {
                    function a(e) {
                        try {
                            s(n.next(e))
                        } catch (e) {
                            i(e)
                        }
                    }

                    function l(e) {
                        try {
                            s(n.throw(e))
                        } catch (e) {
                            i(e)
                        }
                    }

                    function s(e) {
                        var t;
                        e.done ? o(e.value) : (eG(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, l)
                    }
                    s((n = n.apply(e, t || [])).next())
                })
            }

            function eK(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(s) {
                        var c = [l, s];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        i.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && i.label < o[1]) {
                                        i.label = o[1], o = c;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(c);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            c = t.call(e, i)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function eV(e) {
                return e
            }
            "function" == typeof SuppressedError && SuppressedError;

            function eW(e, t) {
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
            var e$ = "Blackbird";

            function eY(e) {
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
                var t, r, n, o, i, a, l;
                return null == (t = e) ? t : {
                    productKey: eY(t.productKey),
                    periodType: t.periodType,
                    periodCount: t.periodCount,
                    localizedPrice: eW(t.localizedPrice),
                    localizedPriceDisplayString: t.localizedPriceDisplayString,
                    localizedStrikethroughPrice: eW(t.localizedStrikethroughPrice),
                    localizedStrikethroughPriceDisplayString: t.localizedStrikethroughPriceDisplayString,
                    productTypeDetails: null == (r = t.productTypeDetails) ? r : {
                        currencySubscriptionProductDetails: eU(r, "currencySubscriptionProductDetails") ? null == (n = r.currencySubscriptionProductDetails) ? n : {
                            currencyType: n.currencyType,
                            entitledAmountMicros: n.entitledAmountMicros
                        } : void 0,
                        developerSubscriptionProductDetails: eU(r, "developerSubscriptionProductDetails") ? null == (o = r.developerSubscriptionProductDetails) ? o : {
                            universeId: o.universeId,
                            imageAssetId: o.imageAssetId,
                            localizedName: o.localizedName,
                            localizedDescription: o.localizedDescription
                        } : void 0,
                        robloxSubscriptionProductDetails: eU(r, "robloxSubscriptionProductDetails") ? null == (i = r.robloxSubscriptionProductDetails) ? i : {
                            featureConfig: null == (a = i.featureConfig) ? a : {
                                virtualTransactionDiscounts: null === a.virtualTransactionDiscounts ? null : a.virtualTransactionDiscounts.map(eJ),
                                isRobuxTransferEnabled: a.isRobuxTransferEnabled,
                                isTradingEnabled: a.isTradingEnabled,
                                isUgcPublishingEnabled: a.isUgcPublishingEnabled,
                                privateServerDiscounts: null === a.privateServerDiscounts ? null : a.privateServerDiscounts.map(eJ),
                                currencySubscriptionConfig: null == (l = a.currencySubscriptionConfig) ? l : {
                                    currencyType: l.currencyType,
                                    entitledAmountMicros: l.entitledAmountMicros
                                }
                            }
                        } : void 0
                    },
                    eligibleOffers: t.eligibleOffers.map(eX)
                }
            }

            function eZ(e) {
                var t, r, n, o, i, a, l;
                return null == (t = e) ? t : {
                    productKey: eY(t.productKey),
                    periodType: t.periodType,
                    displayPrice: eW(t.displayPrice),
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
                    productTypeMembershipDetails: null == (o = t.productTypeMembershipDetails) ? o : {
                        robloxSubscriptionMembershipDetails: eU(o, "robloxSubscriptionMembershipDetails") ? null == (i = o.robloxSubscriptionMembershipDetails) ? i : {
                            features: null == (a = i.features) ? a : {
                                productType: a.productType,
                                virtualTransactionDiscountTierId: a.virtualTransactionDiscountTierId,
                                isRobuxTransferEnabled: a.isRobuxTransferEnabled,
                                isTradingEnabled: a.isTradingEnabled,
                                isUgcPublishingEnabled: a.isUgcPublishingEnabled,
                                privateServerDiscountTierId: a.privateServerDiscountTierId
                            },
                            currencySubscriptionBenefit: null == (l = i.currencySubscriptionBenefit) ? l : {
                                currencyType: l.currencyType,
                                entitledAmountMicrosPerGrantingPeriod: l.entitledAmountMicrosPerGrantingPeriod,
                                grantingPeriodType: l.grantingPeriodType
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
                            return eK(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eM("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eM("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        return r = {}, n = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(o.sent(), function(e) {
                                            return null == e ? e : {
                                                displayPrice: eW(e.displayPrice)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductDisplayPrice = function(e, t) {
                        return eq(this, void 0, void 0, function() {
                            return eK(this, function(r) {
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
                            return eK(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eM("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eM("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/payment-metadata".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(o.sent(), function(e) {
                                            return null == e ? e : {
                                                paymentMethods: e.paymentMethods.map(eV),
                                                paymentProviders: e.paymentProviders.map(eH)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductPaymentMetadata = function(e, t) {
                        return eq(this, void 0, void 0, function() {
                            return eK(this, function(r) {
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
                            return eK(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eM("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eM("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(o.sent(), function(e) {
                                            return null == e ? e : {
                                                subscriptionProductInfo: eQ(e.subscriptionProductInfo)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetSubscriptionProductInfo = function(e, t) {
                        return eq(this, void 0, void 0, function() {
                            return eK(this, function(r) {
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
                            return eK(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        return r = {}, void 0 !== e.productType && (r.ProductType = e.productType), void 0 !== e.includePurchased && (r.IncludePurchased = e.includePurchased), void 0 !== e.includeBundles && (r.IncludeBundles = e.includeBundles), void 0 !== e.purchasePlatform && (r.PurchasePlatform = e.purchasePlatform), void 0 !== e.skipEligibilityCheck && (r.SkipEligibilityCheck = e.skipEligibilityCheck), void 0 !== e.grantType && (r.GrantType = e.grantType), void 0 !== e.paymentProvider && (r.PaymentProvider = e.paymentProvider), n = {}, [4, this.request({
                                            path: "/v2/products",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(o.sent(), function(e) {
                                            return null == e ? e : {
                                                productKeys: e.productKeys.map(eY),
                                                products: e.products.map(eQ)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListAvailableSubscriptionProducts = function() {
                        return eq(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eK(this, function(r) {
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
                            return eK(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        return r = {}, void 0 !== e.productType && (r.ProductType = e.productType), void 0 !== e.expirationTimestampMsStart && (r.ExpirationTimestampMsStart = e.expirationTimestampMsStart), void 0 !== e.expirationTimestampMsEnd && (r.ExpirationTimestampMsEnd = e.expirationTimestampMsEnd), void 0 !== e.cursor && (r.Cursor = e.cursor), void 0 !== e.resultsPerPage && (r.ResultsPerPage = e.resultsPerPage), n = {}, [4, this.request({
                                            path: "/v2/user/subscriptions",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(o.sent(), function(e) {
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
                            return void 0 === e && (e = {}), eK(this, function(r) {
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
                            return eK(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eM("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eM("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
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
                                        return [2, new eL(o.sent(), function(e) {
                                            var t, r, n, o, i, a;
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
                                                    googlePlayStorePurchasePayload: eU(t, "googlePlayStorePurchasePayload") ? null == (o = t.googlePlayStorePurchasePayload) ? o : {
                                                        providerProductId: o.providerProductId,
                                                        providerProductType: o.providerProductType,
                                                        chargeRequestId: o.chargeRequestId,
                                                        offerId: eU(o, "offerId") ? o.offerId : void 0
                                                    } : void 0,
                                                    creditBalancePurchasePayload: eU(t, "creditBalancePurchasePayload") ? null == (i = t.creditBalancePurchasePayload) ? i : {
                                                        checkoutUrl: i.checkoutUrl
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
                            return eK(this, function(r) {
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
                e8 = r.n(e3),
                e6 = function() {
                    for (var e, t, r = 0, n = "", o = arguments.length; r < o; r++)(e = arguments[r]) && (t = function e(t) {
                        var r, n, o = "";
                        if ("string" == typeof t || "number" == typeof t) o += t;
                        else if ("object" == (void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t))
                            if (Array.isArray(t)) {
                                var i = t.length;
                                for (r = 0; r < i; r++) t[r] && (n = e(t[r])) && (o && (o += " "), o += n)
                            } else
                                for (n in t) t[n] && (o && (o += " "), o += n);
                        return o
                    }(e)) && (n && (n += " "), n += t);
                    return n
                };

            function e5(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function e7(e) {
                if (Array.isArray(e)) return e
            }

            function e9() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function te(e, t) {
                if (e) {
                    if ("string" == typeof e) return e5(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return e5(e, t)
                }
            }
            var tt = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                tr = e8().forwardRef(function(e, t) {
                    var r, n = e7(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || te(r) || e9(),
                        o = n[0],
                        i = n.slice(1),
                        a = o.name,
                        l = o.size,
                        s = o.className,
                        c = (o.children, function(e, t) {
                            if (null == e) return {};
                            var r, n, o, i = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                return i
                            }
                            if (i = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        i = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                            return i
                        }(o, ["name", "size", "className", "children"])),
                        u = (e7(i) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); i = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return o
                            }
                        }(i) || te(i, 1) || e9())[0];
                    return e8().createElement("span", function(e) {
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
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: e6("grow-0 shrink-0 basis-auto icon", a, tt[void 0 === l ? "Medium" : l], s)
                    }, c))
                });
            tr.displayName = "Icon";
            var tn = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                to = function(e) {
                    var t = e.className;
                    return e8().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: e6("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                ti = "opacity-[0.5]",
                ta = function(e) {
                    var t = e.width,
                        r = e.height;
                    return e8().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, e8().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function tl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ts(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function tc() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = ts(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : ts(t[e], null)
                        }
                    }
                }
            }

            function tu() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return e3.useCallback(tc.apply(void 0, function(e) {
                    if (Array.isArray(e)) return tl(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tl(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tl(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function td(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tf(e) {
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

            function tp(e, t) {
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

            function tm(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }

            function ty(e) {
                return function(e) {
                    if (Array.isArray(e)) return td(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return td(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return td(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function th(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var tb = Symbol.for("react.lazy"),
                tv = e3[" use ".trim().toString()];

            function tg(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : th(e)) === "object" && "$$typeof" in e && e.$$typeof === tb && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : th(t)) === "object" && null !== t && "then" in t
            }
            var tw = ((e = e3.forwardRef(function(e, t) {
                    var r = e.children,
                        n = tm(e, ["children"]);
                    if (tg(r) && "function" == typeof tv && (r = tv(r._payload)), e3.isValidElement(r)) {
                        var o, i, a, l, s, c = (s = (l = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (s = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                            u = function(e, t) {
                                var r = tf({}, t);
                                for (var n in t) ! function(n) {
                                    var o = e[n],
                                        i = t[n];
                                    /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = i.apply(void 0, ty(t));
                                        return o.apply(void 0, ty(t)), n
                                    } : o && (r[n] = o) : "style" === n ? r[n] = tf({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                }(n);
                                return tf({}, e, r)
                            }(n, r.props);
                        return r.type !== e3.Fragment && (u.ref = t ? tc(t, c) : c), e3.cloneElement(r, u)
                    }
                    return e3.Children.count(r) > 1 ? e3.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), o = e, (i = e3.forwardRef(function(e, t) {
                    var r = e.children,
                        n = tm(e, ["children"]);
                    tg(r) && "function" == typeof tv && (r = tv(r._payload));
                    var i = e3.Children.toArray(r),
                        a = i.find(tS);
                    if (a) {
                        var l = a.props.children,
                            s = i.map(function(e) {
                                return e !== a ? e : e3.Children.count(l) > 1 ? e3.Children.only(null) : e3.isValidElement(l) ? l.props.children : null
                            });
                        return (0, S.jsx)(o, tp(tf({}, n), {
                            ref: t,
                            children: e3.isValidElement(l) ? e3.cloneElement(l, void 0, s) : null
                        }))
                    }
                    return (0, S.jsx)(o, tp(tf({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), i),
                tx = Symbol("radix.slottable");

            function tS(e) {
                return e3.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === tx
            }

            function tO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tP(e) {
                if (Array.isArray(e)) return e
            }

            function tI() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

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

            function tE(e, t) {
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

            function tT(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }

            function tN(e, t) {
                if (e) {
                    if ("string" == typeof e) return tO(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tO(e, t)
                }
            }
            var tA = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                tC = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                tD = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                tR = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                tk = (0, e3.forwardRef)(function(e, t) {
                    var r, n = tP(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || tN(r) || tI(),
                        o = n[0],
                        i = n.slice(1),
                        a = o.children,
                        l = o.className,
                        s = o.style,
                        c = o.isDisabled,
                        u = void 0 !== c && c,
                        d = o.isLoading,
                        f = void 0 !== d && d,
                        p = o.icon,
                        m = o.size,
                        y = void 0 === m ? "Large" : m,
                        h = o.variant,
                        b = void 0 === h ? "Emphasis" : h,
                        v = o.asChild,
                        g = tT(o, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        w = (tP(i) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); i = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return o
                            }
                        }(i) || tN(i, 1) || tI())[0],
                        x = e6("foundation-web-button", u ? ti : [tn, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", tC[y], u ? tR[b] : tD[b], l),
                        S = tj({
                            textDecoration: "none"
                        }, s),
                        O = function(e) {
                            return e8().createElement(e8().Fragment, null, e8().createElement(to, null), f && e8().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, e8().createElement(ta, {
                                width: tA[y],
                                height: tA[y]
                            })), e8().createElement("span", {
                                className: e6("flex items-center min-width-0", "Large" === y || "Medium" === y ? "gap-small" : "gap-xsmall", f && "invisible")
                            }, p && e8().createElement(tr, {
                                name: p,
                                size: y
                            }), e8().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (v) {
                        g.as;
                        var P = tT(g, ["as"]),
                            I = e8().Children.only(a);
                        return e8().createElement(tw, tE(tj({
                            ref: w
                        }, P), {
                            className: x,
                            style: S,
                            "aria-disabled": u || void 0
                        }), e8().cloneElement(I, {}, O(I.props.children)))
                    }
                    if ("a" === g.as) {
                        g.as;
                        var j = g.href,
                            E = tT(g, ["as", "href"]);
                        return e8().createElement("a", tE(tj({
                            ref: w
                        }, E), {
                            "aria-disabled": u,
                            href: u ? void 0 : j,
                            className: x,
                            style: S
                        }), O(a))
                    }
                    g.as;
                    var T = tT(g, ["as"]);
                    return e8().createElement("button", tE(tj({
                        ref: w,
                        type: "button"
                    }, T), {
                        disabled: u,
                        className: x,
                        style: S
                    }), O(a))
                }),
                t_ = function() {
                    var e = (0, O.useTranslation)().translate,
                        t = (0, e3.useCallback)(function() {
                            window.history.back()
                        }, []);
                    return (0, S.jsxs)("div", {
                        className: "height-[210px] gap-y-small margin-top-[240px] flex flex-col items-center",
                        children: [(0, S.jsx)(tr, {
                            className: "content-muted !size-1400",
                            name: "icon-regular-triangle-exclamation"
                        }), (0, S.jsx)("p", {
                            className: "text-heading-small",
                            children: e("Message.Error.Generic")
                        }), (0, S.jsxs)("div", {
                            className: "gap-x-medium padding-top-medium flex",
                            children: [(0, S.jsx)(tk, {
                                className: "min-width-[96px]",
                                size: "Small",
                                variant: "SoftEmphasis",
                                onClick: t,
                                children: e("Action.Back")
                            }), (0, S.jsx)(tk, {
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

            function tM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tU(e) {
                if (Array.isArray(e)) return e
            }

            function tL() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function tB(e) {
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

            function tF(e, t) {
                if (e) {
                    if ("string" == typeof e) return tM(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tM(e, t)
                }
            }
            var tG = (0, e3.createContext)(null),
                tz = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-medium"
                },
                tq = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                tK = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                tV = (0, e3.forwardRef)(function(e, t) {
                    var r = e.isContained,
                        n = e.size,
                        o = e.divider,
                        i = e.alignment,
                        a = e.title,
                        l = e.isTitleBold,
                        s = e.text,
                        c = e.isMultiline,
                        u = e.metadata,
                        d = e.description,
                        f = e.leading,
                        p = e.trailing,
                        m = e.onSelect,
                        y = e.className,
                        h = void 0 === u && void 0 === d && void 0 === i && void 0 === n;
                    if ((void 0 !== s || void 0 !== c) && !h) throw Error('ListItem: Cannot use deprecated "text" or "isMultiline" props with "metadata", "description", "alignment", or "size".');
                    var b = null != n ? n : "Large",
                        v = void 0 !== m,
                        g = v ? "button" : "div",
                        w = !!h && c,
                        x = "Top" === i ? "justify-start" : "justify-center";
                    w && (x = "justify-start");
                    var S = e8().createElement(g, tB({
                            className: e6("bg-none width-full flex gap-medium stroke-none foundation-web-list-item padding-y-none", r ? "padding-x-medium" : "padding-x-xlarge", "Full" === o && "foundation-web-list-item-bottom-divider", v && "relative clip group/interactable focus-visible:outline-focus disabled:outline-none", v && "cursor-pointer", y)
                        }, v && {
                            onClick: function() {
                                return m()
                            }
                        }), v && e8().createElement(to, null), f && e8().createElement("div", {
                            className: e6("flex flex-col padding-y-large", x)
                        }, f), e8().createElement("div", {
                            className: "flex fill clip-x padding-y-large gap-x-medium relative "
                        }, e8().createElement("div", {
                            className: e6("flex flex-col fill clip-x justify-center", w && "gap-xsmall")
                        }, a && e8().createElement("div", {
                            className: e6("content-emphasis text-align-x-start", void 0 === l || l ? tq[b] : tK[b])
                        }, a), h && s && e8().createElement("div", {
                            className: e6("content-default text-align-x-start", tz[b], !c && "text-truncate-split text-no-wrap")
                        }, s), !h && u && e8().createElement("div", {
                            className: e6("content-default text-align-x-start text-truncate-split text-no-wrap", tz[b])
                        }, u), !h && d && e8().createElement("div", {
                            className: e6("content-default text-align-x-start padding-top-xsmall", tz[b])
                        }, d)), p && e8().createElement("div", {
                            className: e6("flex flex-col", x)
                        }, p), "Inset" === o && e8().createElement("div", {
                            className: "foundation-web-list-item-inset-divider"
                        }))),
                        O = (0, e3.useMemo)(function() {
                            return {
                                size: b
                            }
                        }, [b]);
                    return e8().createElement("li", {
                        ref: t,
                        style: {
                            listStyle: "none"
                        }
                    }, e8().createElement(tG.Provider, {
                        value: O
                    }, S))
                });
            tV.displayName = "ListItem";
            var tW = (0, e3.forwardRef)(function(e, t) {
                var r, n = tU(r = [e, t]) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(r) || tF(r) || tL(),
                    o = n[0],
                    i = n.slice(1),
                    a = o.children,
                    l = o.className,
                    s = o.as,
                    c = function(e, t) {
                        if (null == e) return {};
                        var r, n, o, i = {};
                        if ("u" > typeof Reflect && Reflect.ownKeys) {
                            for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                            return i
                        }
                        if (i = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = {},
                                    i = Object.getOwnPropertyNames(e);
                                for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                return o
                            }(e, t), Object.getOwnPropertySymbols)
                            for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                        return i
                    }(o, ["children", "className", "as"]),
                    u = (tU(i) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                i = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); i = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    i || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return o
                        }
                    }(i) || tF(i, 1) || tL())[0];
                return e8().createElement(void 0 === s ? "ul" : s, tB({
                    ref: u,
                    className: e6("foundation-web-list", l)
                }, c), a)
            });
            tW.displayName = "List";
            var tH = "height-full min-width-0 grow-1 gap-x-large radius-medium !bg-surface-100 stroke-standard stroke-default padding-medium box-border flex items-center",
                tX = function(e) {
                    var t = e.expandedPrimary,
                        r = e.expandedSecondary,
                        n = e.iconName,
                        o = e.onTileClick,
                        i = e.primary,
                        a = e.secondary,
                        l = (0, S.jsxs)(e3.Fragment, {
                            children: [(0, S.jsx)("div", {
                                className: "flex shrink-0 items-center justify-center",
                                children: (0, S.jsx)(tr, {
                                    name: n,
                                    size: "Large"
                                })
                            }), (0, S.jsxs)("div", {
                                className: "min-width-0 grow-1 gap-xsmall flex flex-col justify-center",
                                children: [(0, S.jsx)("div", {
                                    className: "text-title-medium content-emphasis text-align-x-start",
                                    children: i
                                }), (0, S.jsx)("div", {
                                    className: "text-body-medium content-default text-align-x-start",
                                    children: a
                                })]
                            })]
                        });
                    return (0, S.jsx)("li", {
                        className: "min-width-0 height-full flex list-none flex-col [list-style:none]",
                        children: null != o ? (0, S.jsx)("button", {
                            "aria-label": i,
                            className: "".concat(tH, " width-full text-align-x-start cursor-pointer font-[inherit]"),
                            type: "button",
                            onClick: function() {
                                o(t, r)
                            },
                            children: l
                        }) : (0, S.jsx)("div", {
                            className: tH,
                            children: l
                        })
                    })
                },
                t$ = function(e) {
                    var t = e.featureConfig,
                        r = e.periodType,
                        n = e.overrideIconName,
                        o = e.onTileClick,
                        i = (0, O.useTranslation)(),
                        a = i.translate,
                        l = i.intl,
                        s = (0, e3.useMemo)(function() {
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
                    return (0, S.jsxs)(tW, {
                        className: "width-full large:[grid-template-columns:repeat(2,minmax(0,1fr))] grid gap-x-[12px] gap-y-[12px] [grid-template-columns:minmax(0,1fr)]",
                        children: [s && (0, S.jsx)(tX, {
                            expandedPrimary: a("Description.Benefit.DiscountBaseExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.DiscountBaseExpandedBody"),
                            iconName: null != n ? n : "icon-regular-tag",
                            primary: a("Description.Benefit.DiscountBase", {
                                discountPercent: l.n(.01 * s.discountPercent, {
                                    style: "percent"
                                })
                            }),
                            secondary: a("Description.Benefit.DiscountBaseSubtitle"),
                            onTileClick: o
                        }), c && (0, S.jsx)(tX, {
                            expandedPrimary: a("Description.Benefit.DiscountNextExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.DiscountNextExpandedBody"),
                            iconName: null != n ? n : "icon-regular-tag-arrow-up",
                            primary: a("Description.Benefit.DiscountNext", {
                                productName: a("Label.Blackbird"),
                                discountPercent: l.n(.01 * c.discountPercent, {
                                    style: "percent"
                                }),
                                discountPeriodCount: l.n(c.periodIndex),
                                discountPeriodUnit: r
                            }),
                            secondary: a("Description.Benefit.DiscountNextSubtitle"),
                            onTileClick: o
                        }), u && (0, S.jsx)(tX, {
                            expandedPrimary: a("Description.Benefit.PrivateServersExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.PrivateServersExpandedBody"),
                            iconName: null != n ? n : "icon-regular-controller",
                            primary: a("Description.Benefit.PrivateServers", {
                                discountPercent: l.n(.01 * u.discountPercent, {
                                    style: "percent"
                                })
                            }),
                            secondary: a("Description.Benefit.PrivateServersSubtitle"),
                            onTileClick: o
                        }), t.isRobuxTransferEnabled && (0, S.jsx)(tX, {
                            expandedPrimary: a("Description.Benefit.RobuxTransfersExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.RobuxTransfersExpandedBody"),
                            iconName: null != n ? n : "icon-regular-robux",
                            primary: a("Description.Benefit.RobuxTransfers"),
                            secondary: a("Description.Benefit.RobuxTransfersSubtitle"),
                            onTileClick: o
                        }), t.isTradingEnabled && (0, S.jsx)(tX, {
                            expandedPrimary: a("Description.Benefit.TradeResellItemsExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.TradeResellItemsExpandedBody"),
                            iconName: null != n ? n : "icon-regular-hand-two-arrows-horizontal",
                            primary: a("Description.Benefit.TradeResellItems"),
                            secondary: a("Description.Benefit.TradeResellItemsSubtitle"),
                            onTileClick: o
                        }), t.isUgcPublishingEnabled && (0, S.jsx)(tX, {
                            expandedPrimary: a("Description.Benefit.PublishItemsExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.PublishItemsExpandedBody"),
                            iconName: null != n ? n : "icon-regular-arrow-up-from-landscape-rectangle",
                            primary: a("Description.Benefit.PublishItems"),
                            secondary: a("Description.Benefit.PublishItemsSubtitle"),
                            onTileClick: o
                        })]
                    })
                },
                tY = function(e) {
                    var t = e.children;
                    return (0, S.jsx)("div", {
                        children: t
                    })
                },
                tJ = function() {
                    return (0, S.jsx)("div", {
                        className: "backdrop-texture width-full height-[210px] pointer-events-none absolute"
                    })
                },
                tQ = function() {
                    return (0, S.jsx)("div", {
                        className: "stroke-default stroke-standard self-stretch"
                    })
                };

            function tZ(e) {
                var t = e.productTypeDetails.robloxSubscriptionProductDetails;
                if (!(null == t ? void 0 : t.featureConfig)) throw Error("featureConfig is missing on robloxSubscriptionProductDetails");
                return t.featureConfig
            }

            function t0(e) {
                var t, r = e.productTypeDetails.robloxSubscriptionProductDetails,
                    n = null == r ? void 0 : r.featureConfig.currencySubscriptionConfig;
                return Math.floor((null != (t = null == n ? void 0 : n.entitledAmountMicros) ? t : 0) / 1e6)
            }

            function t1(e) {
                return e.eligibleOffers.find(function(e) {
                    return "FreeTrial" === e.offerType
                })
            }
            var t2 = function(e) {
                var t = e.robloxSubscriptionProduct,
                    r = e.onDismiss,
                    n = (0, O.useTranslation)().translate,
                    o = (0, S.jsx)(tk, {
                        className: "width-full",
                        size: "Large",
                        variant: "Emphasis",
                        onClick: r,
                        children: n("Action.OK")
                    }),
                    i = (0, S.jsxs)("p", {
                        className: "text-body-small content-muted text-center",
                        children: [n("Description.FeatureAccessDisclaimer"), " ", (0, S.jsx)("a", {
                            className: "text-link",
                            href: "https://help.roblox.com/hc/articles/39143693116052-Understanding-Age-Checks-on-Roblox",
                            children: n("Action.ViewDetails")
                        })]
                    });
                return (0, S.jsxs)(e3.Fragment, {
                    children: [(0, S.jsx)(tJ, {}), (0, S.jsx)("div", {
                        className: "flex flex-col items-center",
                        children: (0, S.jsxs)("div", {
                            className: "padding-x-xlarge content-emphasis gap-y-xxlarge width-full large:max-width-[730px] flex flex-col",
                            children: [(0, S.jsxs)("div", {
                                className: "gap-y-small large:items-center flex flex-col items-start",
                                children: [(0, S.jsxs)("div", {
                                    className: "gap-x-small flex items-center",
                                    children: [(0, S.jsx)(tr, {
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
                            }), (0, S.jsx)(t$, {
                                featureConfig: tZ(t),
                                periodType: t.periodType
                            }), (0, S.jsx)(tY, {
                                children: (0, S.jsxs)("div", {
                                    className: "large:flex large:flex-col large:items-center width-full gap-y-medium hidden",
                                    "data-testid": "free-trial-action-inline",
                                    children: [o, i]
                                })
                            })]
                        })
                    }), (0, S.jsxs)("div", {
                        "aria-label": n("Action.OK"),
                        className: "bottom-dock padding-t-medium bg-surface-100 large:!hidden width-full gap-y-medium flex flex-col",
                        "data-testid": "free-trial-action-dock",
                        role: "region",
                        children: [(0, S.jsx)(tQ, {}), (0, S.jsxs)("div", {
                            className: "width-full gap-y-medium padding-b-[env(safe-area-inset-bottom\\,0px)] padding-x-xxlarge flex flex-col items-stretch",
                            children: [o, i]
                        })]
                    })]
                })
            };

            function t4(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function t3(e) {
                if (Array.isArray(e)) return e
            }

            function t8() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function t6(e, t) {
                if (e) {
                    if ("string" == typeof e) return t4(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return t4(e, t)
                }
            }
            var t5 = {
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
                t7 = e8().forwardRef(function(e, t) {
                    var r, n = t3(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || t6(r) || t8(),
                        o = n[0],
                        i = n.slice(1),
                        a = o.className,
                        l = o.size,
                        s = void 0 === l ? "Large" : l,
                        c = o.variant,
                        u = o.value,
                        d = o.showValue,
                        f = void 0 !== d && d,
                        p = o.ariaLabel,
                        m = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, i = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                return i
                            }
                            if (i = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        i = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                            return i
                        }(o, ["className", "size", "variant", "value", "showValue", "ariaLabel"]),
                        y = (t3(i) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); i = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return o
                            }
                        }(i) || t6(i, 1) || t8())[0],
                        h = t5[s],
                        b = h.dimension,
                        v = h.strokeWidth,
                        g = h.textClass,
                        w = h.valueContainerSize,
                        x = (b - v) / 2,
                        S = 2 * Math.PI * x,
                        O = b / 2,
                        P = Math.min(100, Math.max(0, void 0 === u ? 0 : u)),
                        I = f && void 0 !== w ? w : b,
                        j = "Determinate" === (void 0 === c ? "Determinate" : c);
                    return e8().createElement("div", function(e) {
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
                        className: e6("foundation-web-progress-circle inline-flex items-center justify-center", a),
                        role: "progressbar",
                        "aria-label": p,
                        "aria-valuemin": j ? 0 : void 0,
                        "aria-valuemax": j ? 100 : void 0,
                        "aria-valuenow": j ? P : void 0,
                        style: {
                            width: I,
                            height: I
                        }
                    }, m), e8().createElement("svg", {
                        width: b,
                        height: b,
                        viewBox: "0 0 ".concat(b, " ").concat(b),
                        className: "relative"
                    }, e8().createElement("circle", {
                        cx: O,
                        cy: O,
                        r: x,
                        fill: "none",
                        strokeWidth: v,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), e8().createElement("circle", {
                        cx: O,
                        cy: O,
                        r: x,
                        fill: "none",
                        strokeWidth: v,
                        strokeDasharray: j ? S : "".concat(.75 * S, " ").concat(.25 * S),
                        strokeDashoffset: j ? S * (1 - P / 100) : 0,
                        strokeLinecap: "round",
                        className: e6(!j && "foundation-web-progress-circle-indeterminate"),
                        style: j ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), j && f && "Large" === s && e8().createElement("div", {
                        className: e6("absolute content-emphasis flex items-center justify-center", g),
                        "aria-hidden": "true"
                    }, e8().createElement("span", null, Math.round(P)), e8().createElement("span", null, "%")))
                });
            t7.displayName = "ProgressCircle";
            var t9 = function() {
                    var e = (0, O.useTranslation)().translate;
                    return (0, S.jsx)("div", {
                        className: "margin-top-[240px] flex flex-col items-center",
                        children: (0, S.jsx)(t7, {
                            ariaLabel: e("Label.Loading"),
                            size: "Medium",
                            variant: "Indeterminate"
                        })
                    })
                },
                re = window.CoreRobloxUtilities,
                rt = window.Roblox,
                rr = window.Roblox["core-scripts"].localStorage.localStorage,
                rn = r.n(rr),
                ro = window.CoreUtilities,
                ri = window.Roblox["core-scripts"].paymentsFlow,
                ra = r.n(ri),
                rl = window.EventTracker;

            function rs(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        s = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(s) : Promise.resolve(s).then(n, o)
            }

            function rc(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var ru = ((a = {}).GET = "GET", a.POST = "POST", a),
                rd = ((l = {}).PAYMENT = "Payment", l.ROBUX = "Robux", l.ROBUX_GIFTING = "RobuxGifting", l.ROBUX_REDESIGN = "RobuxRedesign", l),
                rf = ((s = {}).VERIFY_PHONE_VERIFICATION_SESSION = "VerifyPhoneVerificationSession", s.LANDING_PAGE_METADATA = "GetLandingPageMetadata", s.GET_USER_NAME = "GetUserName", s.PREPARE_PAYMENT = "PreparePayment", s.GET_METADATA = "GetMetadata", s.GET_PRODUCTS = "GetProducts", s.GET_PAYMENT_METHODS_INFO = "GetPaymentMethodsInfo", s.GET_PURCHASE_WARNING = "GetPurchaseWarning", s.GET_USER_PURCHASE_ELIGIBILITY = "GetUserPurchaseEligibility", s.CREATE_PAYMENT_SESSION = "CreatePaymentSession", s.GET_PAYMENT_SESSION = "GetPaymentSession", s.GET_PAYMENT_SESSION_BY_CHECKOUT_SESSION_ID = "GetPaymentSessionByCheckoutSessionId", s.CREATE_BONUS_SESSION = "CreateBonusSession", s.GET_BONUS_SESSION_BY_CHECKOUT_SESSION_ID = "GetBonusSessionByCheckoutSessionId", s.GET_DISPLAYABLE_BONUS_FOR_PRODUCT = "GetDisplayableBonusForProduct", s.GET_THUMBNAILS = "GetThumbnails", s.HANDLE_GAME_PASS_JOIN_EVENT = "HandleGamePassJoinEvent", s.GET_ROBUX_BALANCE = "GetRobuxBalance", s.GET_AUTH_TICKET = "GetAuthTicket", s.GET_CLIENT_ASSERTION = "GetClientAssertion", s),
                rp = function(e, t, r) {
                    return new Promise(function(n) {
                        (0, rl.fireEvent)("API_COUNTER_".concat(e, "_").concat(t, "_").concat(r || "Throughput")), n()
                    })
                },
                rm = function(e, t, r) {
                    return new Promise(function(n) {
                        (0, rl.fireEvent)("ERROR_COUNTER_".concat(e, "_").concat(t, "_").concat(r || "UnknownAxiosError")), n()
                    })
                };

            function ry(e, t, r, n, o) {
                var i;
                return (i = function(e, t, r, n, o) {
                    var i, a, l, s, c, u, d;
                    return function(e, t) {
                        var r, n, o, i = {
                                label: 0,
                                sent: function() {
                                    if (1 & o[0]) throw o[1];
                                    return o[1]
                                },
                                trys: [],
                                ops: []
                            },
                            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                            l = Object.defineProperty;
                        return l(a, "next", {
                            value: s(0)
                        }), l(a, "throw", {
                            value: s(1)
                        }), l(a, "return", {
                            value: s(2)
                        }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), a;

                        function s(l) {
                            return function(s) {
                                var c = [l, s];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                                    if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                                    switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                        case 0:
                                        case 1:
                                            o = c;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: c[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, n = c[1], c = [0];
                                            continue;
                                        case 7:
                                            c = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                i.label = c[1];
                                                break
                                            }
                                            if (6 === c[0] && i.label < o[1]) {
                                                i.label = o[1], o = c;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(c);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    c = t.call(e, i)
                                } catch (e) {
                                    c = [6, e], n = 0
                                } finally {
                                    r = o = 0
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
                                i = r.feature, a = r.call, rp(i, a), f.label = 1;
                            case 1:
                                return f.trys.push([1, 3, , 4]), [4, "GET" === e ? ro.httpService.get(t, n) : ro.httpService.post(t, n)];
                            case 2:
                                return s = (l = f.sent()).data, c = l.headers, rp(i, a, 200), [2, (null == o ? void 0 : o(s, c)) || s];
                            case 3:
                                var p, m, y;
                                return (void 0 === (p = u = f.sent()) ? "undefined" : rc(p)) === "object" && "status" in p ? rm(i, a, u.status) : (void 0 === u ? "undefined" : rc(u)) === "object" && "config" in u ? rm(i, a, null == (d = u.response) ? void 0 : d.status) : (console.error(u), m = i, y = a, new Promise(function(e) {
                                    (0, rl.fireEvent)("ERROR_COUNTER_".concat(m, "_").concat(y, "_NonAxiosError")), e()
                                })), [2, void 0];
                            case 4:
                                return [2]
                        }
                    })
                }, function() {
                    var e = this,
                        t = arguments;
                    return new Promise(function(r, n) {
                        var o = i.apply(e, t);

                        function a(e) {
                            rs(o, r, n, a, l, "next", e)
                        }

                        function l(e) {
                            rs(o, r, n, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }).apply(this, arguments)
            }

            function rh(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        s = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(s) : Promise.resolve(s).then(n, o)
            }

            function rb(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            rh(i, n, o, a, l, "next", e)
                        }

                        function l(e) {
                            rh(i, n, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function rv(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(a, "next", {
                    value: s(0)
                }), l(a, "throw", {
                    value: s(1)
                }), l(a, "return", {
                    value: s(2)
                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function s(l) {
                    return function(s) {
                        var c = [l, s];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        i.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && i.label < o[1]) {
                                        i.label = o[1], o = c;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(c);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            c = t.call(e, i)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function rg(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rw(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        s = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(s) : Promise.resolve(s).then(n, o)
            }

            function rx(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rg(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rg(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rS = "paymentSession-".concat((null === rt.CurrentUser || void 0 === rt.CurrentUser ? void 0 : rt.CurrentUser.userId) || "loggedout");

            function rO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rP(e) {
                return function(e) {
                    if (Array.isArray(e)) return rO(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return rO(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rO(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rI = "__FN_nvfToKPAOuiV__",
                rj = new RegExp("".concat(rI, "(\\d+)\\|")),
                rE = function(e, t, r, n) {
                    var o = function(e) {
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
                        i = {};
                    null == r || r.forEach(function(e, t) {
                        var r = t.toString(),
                            n = "".concat(rI).concat(r, "|"),
                            a = "".concat("__FN_END_nvfToKPAOuiV__").concat(r, "|");
                        o[e.opening] = n, o[e.closing] = a, i[r] = {
                            start: n,
                            end: a,
                            render: e.render,
                            used: !1
                        }
                    });
                    var a = e(t, o),
                        l = function(e) {
                            var r = [],
                                n = rj.exec(e);
                            if (!n) return [e];
                            n.index > 0 && r.push(e.slice(0, n.index));
                            var o = n[1] && i[n[1]];
                            if (!o) return console.warn("Unexpected malformed segment", t), [];
                            o.used = !0;
                            var a = e.indexOf(o.end);
                            if (-1 === a) return console.warn("Unexpected malformed segment", t), [];
                            var s = e.slice(n.index + n[0].length, a),
                                c = o.render(l(s));
                            Array.isArray(c) ? r.push.apply(r, rP(c)) : r.push(c);
                            var u = e.slice(a + o.end.length);
                            return u.length > 0 && r.push.apply(r, rP(l(u))), r
                        },
                        s = l(a).filter(function(e) {
                            return "" !== e
                        });
                    return Object.values(i).some(function(e) {
                        return !e.used
                    }) ? (console.warn("Unused segments found", t), []) : s.map(function(e, t) {
                        return (0, S.jsx)(e3.Fragment, {
                            children: e
                        }, t)
                    })
                };

            function rT(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var rN = function(e) {
                    var t, r = e.productType,
                        n = e.productId,
                        o = e.deviceMeta,
                        i = e.variant,
                        a = e.size,
                        l = e.className,
                        s = e.isDisabled,
                        c = void 0 !== s && s,
                        u = e.redirectUrl,
                        d = e.paymentSessionId,
                        f = e.onSubscribeClick,
                        p = e.onMobilePurchaseInitiated,
                        m = e.isLoading,
                        y = e.children,
                        h = e.trackSubscriptionButtonClick,
                        b = e.loadingStateDisabled,
                        v = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, e3.useState)(!1)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return o
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return rT(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rT(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        g = v[0],
                        w = v[1],
                        x = o.isAndroidApp || o.isIosApp,
                        O = r === e$ ? "RobloxPlus" : r,
                        P = (0, e3.useMemo)(function() {
                            var e = new URL(x ? "/mobile-app-upgrades/buy" : "/upgrades/paymentmethods", window.location.origin);
                            return e.searchParams.append("ctx", "subscription"), e.searchParams.append("type", O), e.searchParams.append("id", n), d && e.searchParams.append("paymentSessionId", d), !x && u && e.searchParams.append("redirectUrl", u), e.toString()
                        }, [x, O, n, d, u]),
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
                                    }(u), null == f || f(), x) {
                                    null == p || p();
                                    return
                                }
                                w(!0)
                            }
                        }, [c, h, u, f, x, p]);
                    return (0, S.jsx)(tk, {
                        as: "a",
                        className: l,
                        href: P,
                        isDisabled: c,
                        isLoading: void 0 !== b && b ? void 0 : null != m ? m : g,
                        size: a,
                        variant: void 0 === i ? "Emphasis" : i,
                        onClick: I,
                        children: y
                    })
                },
                rA = function(e) {
                    var t = e.title,
                        r = e.body,
                        n = e.equipText,
                        o = e.onEquip,
                        i = e.onItemDetailsClick,
                        a = null != i;
                    return (0, S.jsxs)("div", {
                        "aria-label": a ? t : void 0,
                        className: "bg-shift-200 radius-medium padding-medium gap-medium width-full flex items-center ".concat(a ? "hover:bg-surface-100 cursor-pointer" : ""),
                        role: a ? "button" : void 0,
                        tabIndex: a ? 0 : void 0,
                        onClick: i,
                        onKeyDown: a ? function(e) {
                            e.target === e.currentTarget && ("Enter" === e.key || " " === e.key) && (e.preventDefault(), null == i || i())
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
                        }), null != n && null != o && (0, S.jsx)(tk, {
                            className: "shrink-0",
                            size: "Medium",
                            variant: "Standard",
                            onClick: function(e) {
                                e.stopPropagation(), null == o || o()
                            },
                            children: n
                        })]
                    })
                },
                rC = function(e) {
                    var t = e.size,
                        r = e.variant,
                        n = (0, (0, O.useTranslation)().translate)("Label.Blackbird");
                    return "compact" === (void 0 === r ? "default" : r) ? (0, S.jsxs)("div", {
                        className: "gap-x-xxsmall flex items-center",
                        children: [(0, S.jsx)(tr, {
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
                        children: [(0, S.jsx)(tr, {
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
                rD = window.Roblox["core-scripts"].format.string,
                rR = function(e, t) {
                    var r = (0, O.useTranslation)().intl;
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
                rk = function(e) {
                    var t, r = e.eligibleOffers,
                        n = e.price,
                        o = e.periodType,
                        i = (0, O.useTranslation)().translate,
                        a = rR(n),
                        l = i("Description.BillingInfo", {
                            price: "<span class='text-heading-medium'>".concat((0, rD.escapeHtml)(a), "</span>"),
                            periodType: o
                        }),
                        s = i("Description.BillingInfoWithFreeTrialOffer", {
                            boldTagStart: "<b>",
                            boldTagEnd: "</b>",
                            trialPeriod: 1,
                            trialPeriodType: o,
                            price: (0, rD.escapeHtml)(a),
                            periodType: o
                        }),
                        c = null != (t = null == r ? void 0 : r.some(function(e) {
                            return "FreeTrial" === e.offerType
                        })) && t;
                    return (0, S.jsx)("span", {
                        dangerouslySetInnerHTML: {
                            __html: c ? s : l
                        },
                        className: "text-body-large"
                    })
                },
                r_ = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                rM = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                rU = function(e) {
                    var t = e.variant,
                        r = e.size,
                        n = e.isCircular,
                        o = e.className,
                        i = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, i = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                return i
                            }
                            if (i = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        i = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                            return i
                        }(e, ["variant", "size", "isCircular", "className"]);
                    return e8().createElement("button", function(e) {
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
                        className: e6("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", tn, rM[t], r_[r], n && "radius-circle", o)
                    }, i), e8().createElement(to, null), e8().createElement(tr, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function rL(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function rB(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rF(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function rG(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        rF(e, t, r[t])
                    })
                }
                return e
            }

            function rz(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }

            function rq(e) {
                return function(e) {
                    if (Array.isArray(e)) return rB(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return rB(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rB(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rK() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                var n = t[0];
                if (1 === t.length) return n;
                var o = function() {
                    var e = t.map(function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    });
                    return function(t) {
                        var r = e.reduce(function(e, r) {
                            var n = r.useScope,
                                o = r.scopeName;
                            return rG({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return e3.useMemo(function() {
                            return rF({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }
            var rV = (null == (w = globalThis) ? void 0 : w.document) ? e3.useLayoutEffect : function() {};

            function rW(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var rH = e3[" useId ".trim().toString()] || function() {},
                rX = 0;

            function r$(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = e3.useState(rH())) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                i = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    i || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return o
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return rW(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rW(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    o = r[1];
                return rV(function() {
                    e || o(function(e) {
                        return null != e ? e : String(rX++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function rY(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rJ(e) {
                var t = e3.useRef(e);
                return e3.useEffect(function() {
                    t.current = e
                }), e3.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return rY(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return rY(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rY(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function rQ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rZ(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rQ(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rQ(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var r0 = window.RadixUI["react-dismissable-layer"],
                r1 = window.ReactDOM,
                r2 = r.n(r1);

            function r4(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function r3(e) {
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

            function r8(e, t) {
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

            function r6(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }

            function r5(e) {
                return function(e) {
                    if (Array.isArray(e)) return r4(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return r4(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return r4(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function r7(e) {
                var t, r, n = (t = e, (r = e3.forwardRef(function(e, t) {
                        var r = e.children,
                            n = r6(e, ["children"]);
                        if (e3.isValidElement(r)) {
                            var o, i, a, l, s, c = (s = (l = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (s = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                u = function(e, t) {
                                    var r = r3({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            i = t[n];
                                        /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            i.apply(void 0, r5(t)), o.apply(void 0, r5(t))
                                        } : o && (r[n] = o) : "style" === n ? r[n] = r3({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                    }(n);
                                    return r3({}, e, r)
                                }(n, r.props);
                            return r.type !== e3.Fragment && (u.ref = t ? tc(t, c) : c), e3.cloneElement(r, u)
                        }
                        return e3.Children.count(r) > 1 ? e3.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = e3.forwardRef(function(e, t) {
                        var r = e.children,
                            o = r6(e, ["children"]),
                            i = e3.Children.toArray(r),
                            a = i.find(ne);
                        if (a) {
                            var l = a.props.children,
                                s = i.map(function(e) {
                                    return e !== a ? e : e3.Children.count(l) > 1 ? e3.Children.only(null) : e3.isValidElement(l) ? l.props.children : null
                                });
                            return (0, S.jsx)(n, r8(r3({}, o), {
                                ref: t,
                                children: e3.isValidElement(l) ? e3.cloneElement(l, void 0, s) : null
                            }))
                        }
                        return (0, S.jsx)(n, r8(r3({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            var r9 = Symbol("radix.slottable");

            function ne(e) {
                return e3.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === r9
            }

            function nt(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function nr(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        nt(e, t, r[t])
                    })
                }
                return e
            }

            function nn(e, t) {
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
            var no = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                var r = r7("Primitive.".concat(t)),
                    n = e3.forwardRef(function(e, n) {
                        var o = e.asChild,
                            i = function(e, t) {
                                if (null == e) return {};
                                var r, n, o, i = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                    return i
                                }
                                if (i = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, o = {},
                                            i = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                        return o
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                return i
                            }(e, ["asChild"]),
                            a = o ? r : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, S.jsx)(a, nn(nr({}, i), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), nn(nr({}, e), nt({}, t, n))
            }, {});

            function ni(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function na(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || nl(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nl(e, t) {
                if (e) {
                    if ("string" == typeof e) return ni(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ni(e, t)
                }
            }
            var ns = "focusScope.autoFocusOnMount",
                nc = "focusScope.autoFocusOnUnmount",
                nu = {
                    bubbles: !1,
                    cancelable: !0
                },
                nd = e3.forwardRef(function(e, t) {
                    var r, n, o = e.loop,
                        i = void 0 !== o && o,
                        a = e.trapped,
                        l = void 0 !== a && a,
                        s = e.onMountAutoFocus,
                        c = e.onUnmountAutoFocus,
                        u = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, i = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                return i
                            }
                            if (i = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        i = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                            return i
                        }(e, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        d = na(e3.useState(null), 2),
                        f = d[0],
                        p = d[1],
                        m = rJ(s),
                        y = rJ(c),
                        h = e3.useRef(null),
                        b = tu(t, function(e) {
                            return p(e)
                        }),
                        v = e3.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    e3.useEffect(function() {
                        if (l) {
                            var e = function(e) {
                                    if (!v.paused && f) {
                                        var t = e.target;
                                        f.contains(t) ? h.current = t : nm(h.current, {
                                            select: !0
                                        })
                                    }
                                },
                                t = function(e) {
                                    if (!v.paused && f) {
                                        var t = e.relatedTarget;
                                        null !== t && (f.contains(t) || nm(h.current, {
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
                                        for (var o, i = e[Symbol.iterator](); !(t = (o = i.next()).done); t = !0) o.value.removedNodes.length > 0 && nm(f)
                                    } catch (e) {
                                        r = !0, n = e
                                    } finally {
                                        try {
                                            t || null == i.return || i.return()
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
                    }, [l, f, v.paused]), e3.useEffect(function() {
                        if (f) {
                            ny.add(v);
                            var e = document.activeElement;
                            if (!f.contains(e)) {
                                var t = new CustomEvent(ns, nu);
                                f.addEventListener(ns, m), f.dispatchEvent(t), t.defaultPrevented || (function(e) {
                                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                        r = t.select,
                                        n = void 0 !== r && r,
                                        o = document.activeElement,
                                        i = !0,
                                        a = !1,
                                        l = void 0;
                                    try {
                                        for (var s, c = e[Symbol.iterator](); !(i = (s = c.next()).done); i = !0) {
                                            var u = s.value;
                                            if (nm(u, {
                                                    select: n
                                                }), document.activeElement !== o) return
                                        }
                                    } catch (e) {
                                        a = !0, l = e
                                    } finally {
                                        try {
                                            i || null == c.return || c.return()
                                        } finally {
                                            if (a) throw l
                                        }
                                    }
                                }(nf(f).filter(function(e) {
                                    return "A" !== e.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === e && nm(f))
                            }
                            return function() {
                                f.removeEventListener(ns, m), setTimeout(function() {
                                    var t = new CustomEvent(nc, nu);
                                    f.addEventListener(nc, y), f.dispatchEvent(t), t.defaultPrevented || nm(null != e ? e : document.body, {
                                        select: !0
                                    }), f.removeEventListener(nc, y), ny.remove(v)
                                }, 0)
                            }
                        }
                    }, [f, m, y, v]);
                    var g = e3.useCallback(function(e) {
                        if ((i || l) && !v.paused) {
                            var t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                                r = document.activeElement;
                            if (t && r) {
                                var n, o, a = e.currentTarget,
                                    s = na([np(o = nf(n = a), n), np(o.reverse(), n)], 2),
                                    c = s[0],
                                    u = s[1];
                                c && u ? e.shiftKey || r !== u ? e.shiftKey && r === c && (e.preventDefault(), i && nm(u, {
                                    select: !0
                                })) : (e.preventDefault(), i && nm(c, {
                                    select: !0
                                })) : r === a && e.preventDefault()
                            }
                        }
                    }, [i, l, v.paused]);
                    return (0, S.jsx)(no.div, (r = function(e) {
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
                        ref: b,
                        onKeyDown: g
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

            function nf(e) {
                for (var t = [], r = document.createTreeWalker(e, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(e) {
                            var t = "INPUT" === e.tagName && "hidden" === e.type;
                            return e.disabled || e.hidden || t ? NodeFilter.FILTER_SKIP : e.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); r.nextNode();) t.push(r.currentNode);
                return t
            }

            function np(e, t) {
                var r = !0,
                    n = !1,
                    o = void 0;
                try {
                    for (var i, a = e[Symbol.iterator](); !(r = (i = a.next()).done); r = !0) {
                        var l = i.value;
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
                    n = !0, o = e
                } finally {
                    try {
                        r || null == a.return || a.return()
                    } finally {
                        if (n) throw o
                    }
                }
            }

            function nm(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = t.select;
                if (e && e.focus) {
                    var n, o, i, a = document.activeElement;
                    e.focus({
                        preventScroll: !0
                    }), e !== a && (o = n = e, null != (i = HTMLInputElement) && "u" > typeof Symbol && i[Symbol.hasInstance] ? !!i[Symbol.hasInstance](o) : o instanceof i) && "select" in n && void 0 !== r && r && e.select()
                }
            }
            nd.displayName = "FocusScope";
            var ny = (t = [], {
                add: function(e) {
                    var r = t[0];
                    e !== r && (null == r || r.pause()), (t = nh(t, e)).unshift(e)
                },
                remove: function(e) {
                    var r;
                    null == (r = (t = nh(t, e))[0]) || r.resume()
                }
            });

            function nh(e, t) {
                var r = function(e) {
                        if (Array.isArray(e)) return ni(e)
                    }(e) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(e) || nl(e) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r.indexOf(t);
                return -1 !== n && r.splice(n, 1), r
            }

            function nb(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var nv = e3.forwardRef(function(e, t) {
                var r, n, o, i, a, l = e.container,
                    s = function(e, t) {
                        if (null == e) return {};
                        var r, n, o, i = {};
                        if ("u" > typeof Reflect && Reflect.ownKeys) {
                            for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                            return i
                        }
                        if (i = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = {},
                                    i = Object.getOwnPropertyNames(e);
                                for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                return o
                            }(e, t), Object.getOwnPropertySymbols)
                            for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                        return i
                    }(e, ["container"]),
                    c = function(e) {
                        if (Array.isArray(e)) return e
                    }(r = e3.useState(!1)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                i = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    i || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return o
                        }
                    }(r) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return nb(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nb(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    u = c[0],
                    d = c[1];
                rV(function() {
                    return d(!0)
                }, []);
                var f = l || u && (null == (a = globalThis) || null == (i = a.document) ? void 0 : i.body);
                return f ? r2().createPortal((0, S.jsx)(no.div, (n = function(e) {
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
                }({}, s), o = o = {
                    ref: t
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(o)).forEach(function(e) {
                    Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                }), n)), f) : null
            });

            function ng(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nw(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ng(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ng(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            nv.displayName = "Portal";
            var nx = function(e) {
                var t, r, n, o, i, a, l, s, c, u, d, f, p, m, y, h, b, v = e.present,
                    g = e.children,
                    w = (t = v, i = (o = nw(e3.useState(), 2))[0], a = o[1], l = e3.useRef({}), s = e3.useRef(t), c = e3.useRef("none"), d = (u = nw((r = t ? "mounted" : "unmounted", n = {
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
                        var e = nS(l.current);
                        c.current = "mounted" === d ? e : "none"
                    }, [d]), rV(function() {
                        var e = l.current,
                            r = s.current;
                        if (r !== t) {
                            var n = c.current,
                                o = nS(e);
                            t ? f("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? f("UNMOUNT") : r && n !== o ? f("ANIMATION_OUT") : f("UNMOUNT"), s.current = t
                        }
                    }, [t, f]), rV(function() {
                        if (i) {
                            var e, t, r = null != (e = i.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = nS(l.current).includes(e.animationName);
                                    if (e.target === i && n && (f("ANIMATION_END"), !s.current)) {
                                        var o = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === i && (c.current = nS(l.current))
                                };
                            return i.addEventListener("animationstart", o), i.addEventListener("animationcancel", n), i.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), i.removeEventListener("animationstart", o), i.removeEventListener("animationcancel", n), i.removeEventListener("animationend", n)
                                }
                        }
                        f("ANIMATION_END")
                    }, [i, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: e3.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    x = "function" == typeof g ? g({
                        present: w.isPresent
                    }) : e3.Children.only(g),
                    S = tu(w.ref, (b = (h = null == (m = Object.getOwnPropertyDescriptor((p = x).props, "ref")) ? void 0 : m.get) && "isReactWarning" in h && h.isReactWarning) ? p.ref : (b = (h = null == (y = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : y.get) && "isReactWarning" in h && h.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof g || w.isPresent ? e3.cloneElement(x, {
                    ref: S
                }) : null
            };

            function nS(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            nx.displayName = "Presence";
            var nO = window.RadixUI["react-focus-guards"],
                nP = function() {
                    return (nP = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }).apply(this, arguments)
                };

            function nI(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var o = 0, n = Object.getOwnPropertySymbols(e); o < n.length; o++) 0 > t.indexOf(n[o]) && Object.prototype.propertyIsEnumerable.call(e, n[o]) && (r[n[o]] = e[n[o]]);
                return r
            }
            var nj = "right-scroll-bar-position",
                nE = "width-before-scroll-bar";

            function nT(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var nN = "u" > typeof window ? e3.useLayoutEffect : e3.useEffect,
                nA = new WeakMap,
                nC = (void 0 === c && (c = {}), (void 0 === u && (u = function(e) {
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
                            o = function() {
                                return Promise.resolve().then(n)
                            };
                        o(), d = {
                            push: function(e) {
                                t.push(e), o()
                            },
                            filter: function(e) {
                                return t = t.filter(e), d
                            }
                        }
                    }
                }).options = nP({
                    async: !0,
                    ssr: !1
                }, c), p),
                nD = function() {},
                nR = e3.forwardRef(function(e, t) {
                    var r, n, o, i, a = e3.useRef(null),
                        l = e3.useState({
                            onScrollCapture: nD,
                            onWheelCapture: nD,
                            onTouchMoveCapture: nD
                        }),
                        s = l[0],
                        c = l[1],
                        u = e.forwardProps,
                        d = e.children,
                        f = e.className,
                        p = e.removeScrollBar,
                        m = e.enabled,
                        y = e.shards,
                        h = e.sideCar,
                        b = e.noRelative,
                        v = e.noIsolation,
                        g = e.inert,
                        w = e.allowPinchZoom,
                        x = e.as,
                        S = e.gapMode,
                        O = nI(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        P = (r = [a, t], n = function(e) {
                            return r.forEach(function(t) {
                                return nT(t, e)
                            })
                        }, (o = (0, e3.useState)(function() {
                            return {
                                value: null,
                                callback: n,
                                facade: {
                                    get current() {
                                        return o.value
                                    },
                                    set current(value) {
                                        var e = o.value;
                                        e !== value && (o.value = value, o.callback(value, e))
                                    }
                                }
                            }
                        })[0]).callback = n, i = o.facade, nN(function() {
                            var e = nA.get(i);
                            if (e) {
                                var t = new Set(e),
                                    n = new Set(r),
                                    o = i.current;
                                t.forEach(function(e) {
                                    n.has(e) || nT(e, null)
                                }), n.forEach(function(e) {
                                    t.has(e) || nT(e, o)
                                })
                            }
                            nA.set(i, r)
                        }, [r]), i),
                        I = nP(nP({}, O), s);
                    return e3.createElement(e3.Fragment, null, m && e3.createElement(h, {
                        sideCar: nC,
                        removeScrollBar: p,
                        shards: y,
                        noRelative: b,
                        noIsolation: v,
                        inert: g,
                        setCallbacks: c,
                        allowPinchZoom: !!w,
                        lockRef: a,
                        gapMode: S
                    }), u ? e3.cloneElement(e3.Children.only(d), nP(nP({}, I), {
                        ref: P
                    })) : e3.createElement(void 0 === x ? "div" : x, nP({}, I, {
                        className: f,
                        ref: P
                    }), d))
                });
            nR.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, nR.classNames = {
                fullWidth: nE,
                zeroRight: nj
            };
            var nk = function(e) {
                var t = e.sideCar,
                    r = nI(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var n = t.read();
                if (!n) throw Error("Sidecar medium not found");
                return e3.createElement(n, nP({}, r))
            };
            nk.isSideCarExport = !0;
            var n_ = function() {
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
                                var o, i;
                                (o = t).styleSheet ? o.styleSheet.cssText = n : o.appendChild(document.createTextNode(n)), i = t, (document.head || document.getElementsByTagName("head")[0]).appendChild(i)
                            }
                            e++
                        },
                        remove: function() {
                            --e || !t || (t.parentNode && t.parentNode.removeChild(t), t = null)
                        }
                    }
                },
                nM = function() {
                    var e = n_();
                    return function(t, r) {
                        e3.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && r])
                    }
                },
                nU = function() {
                    var e = nM();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                nL = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                nB = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                nF = function(e) {
                    var t = window.getComputedStyle(document.body),
                        r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        n = t["padding" === e ? "paddingTop" : "marginTop"],
                        o = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [nB(r), nB(n), nB(o)]
                },
                nG = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return nL;
                    var t = nF(e),
                        r = document.documentElement.clientWidth,
                        n = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, n - r + t[2] - t[0])
                    }
                },
                nz = nU(),
                nq = "data-scroll-locked",
                nK = function(e, t, r, n) {
                    var o = e.left,
                        i = e.top,
                        a = e.right,
                        l = e.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(l, "px ").concat(n, ";\n  }\n  body[").concat(nq, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(nj, " {\n    right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(nE, " {\n    margin-right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(nj, " .").concat(nj, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(nE, " .").concat(nE, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(nq, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                nV = function() {
                    var e = parseInt(document.body.getAttribute(nq) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                nW = function() {
                    e3.useEffect(function() {
                        return document.body.setAttribute(nq, (nV() + 1).toString()),
                            function() {
                                var e = nV() - 1;
                                e <= 0 ? document.body.removeAttribute(nq) : document.body.setAttribute(nq, e.toString())
                            }
                    }, [])
                },
                nH = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        n = e.gapMode,
                        o = void 0 === n ? "margin" : n;
                    nW();
                    var i = e3.useMemo(function() {
                        return nG(o)
                    }, [o]);
                    return e3.createElement(nz, {
                        styles: nK(i, !t, o, r ? "" : "!important")
                    })
                },
                nX = !1;
            if ("u" > typeof window) try {
                var n$ = Object.defineProperty({}, "passive", {
                    get: function() {
                        return nX = !0, !0
                    }
                });
                window.addEventListener("test", n$, n$), window.removeEventListener("test", n$, n$)
            } catch (e) {
                nX = !1
            }
            var nY = !!nX && {
                passive: !1
            };

            function nJ(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var nQ = function(e, t) {
                    if (!nJ(e, Element)) return !1;
                    var r = window.getComputedStyle(e);
                    return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
                },
                nZ = function(e, t) {
                    var r = t.ownerDocument,
                        n = t;
                    do {
                        if ("u" > typeof ShadowRoot && nJ(n, ShadowRoot) && (n = n.host), n0(e, n)) {
                            var o = n1(e, n);
                            if (o[1] > o[2]) return !0
                        }
                        n = n.parentNode
                    } while (n && n !== r.body);
                    return !1
                },
                n0 = function(e, t) {
                    return "v" === e ? nQ(t, "overflowY") : nQ(t, "overflowX")
                },
                n1 = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                n2 = function(e, t, r, n, o) {
                    var i, a = (i = window.getComputedStyle(t).direction, "h" === e && "rtl" === i ? -1 : 1),
                        l = a * n,
                        s = r.target,
                        c = t.contains(s),
                        u = !1,
                        d = l > 0,
                        f = 0,
                        p = 0;
                    do {
                        if (!s) break;
                        var m = n1(e, s),
                            y = m[0],
                            h = m[1] - m[2] - a * y;
                        (y || h) && n0(e, s) && (f += h, p += y);
                        var b = s.parentNode;
                        s = b && b.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? b.host : b
                    } while (!c && s !== document.body || c && (t.contains(s) || t === s));
                    return d && (o && 1 > Math.abs(f) || !o && l > f) ? u = !0 : !d && (o && 1 > Math.abs(p) || !o && -l > p) && (u = !0), u
                },
                n4 = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                n3 = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                n8 = function(e) {
                    return e && "current" in e ? e.current : e
                },
                n6 = 0,
                n5 = [],
                n7 = (m = function(e) {
                    var t = e3.useRef([]),
                        r = e3.useRef([0, 0]),
                        n = e3.useRef(),
                        o = e3.useState(n6++)[0],
                        i = e3.useState(nU)[0],
                        a = e3.useRef(e);
                    e3.useEffect(function() {
                        a.current = e
                    }, [e]), e3.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(o));
                            var t = (function(e, t, r) {
                                if (r || 2 == arguments.length)
                                    for (var n, o = 0, i = t.length; o < i; o++) !n && o in t || (n || (n = Array.prototype.slice.call(t, 0, o)), n[o] = t[o]);
                                return e.concat(n || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(n8), !0).filter(Boolean);
                            return t.forEach(function(e) {
                                    return e.classList.add("allow-interactivity-".concat(o))
                                }),
                                function() {
                                    document.body.classList.remove("block-interactivity-".concat(o)), t.forEach(function(e) {
                                        return e.classList.remove("allow-interactivity-".concat(o))
                                    })
                                }
                        }
                    }, [e.inert, e.lockRef.current, e.shards]);
                    var l = e3.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !a.current.allowPinchZoom;
                            var o, i = n4(e),
                                l = r.current,
                                s = "deltaX" in e ? e.deltaX : l[0] - i[0],
                                c = "deltaY" in e ? e.deltaY : l[1] - i[1],
                                u = e.target,
                                d = Math.abs(s) > Math.abs(c) ? "h" : "v";
                            if ("touches" in e && "h" === d && "range" === u.type) return !1;
                            var f = nZ(d, u);
                            if (!f) return !0;
                            if (f ? o = d : (o = "v" === d ? "h" : "v", f = nZ(d, u)), !f) return !1;
                            if (!n.current && "changedTouches" in e && (s || c) && (n.current = o), !o) return !0;
                            var p = n.current || o;
                            return n2(p, t, e, "h" === p ? s : c, !0)
                        }, []),
                        s = e3.useCallback(function(e) {
                            if (n5.length && n5[n5.length - 1] === i) {
                                var r = "deltaY" in e ? n3(e) : n4(e),
                                    n = t.current.filter(function(t) {
                                        var n;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                                    })[0];
                                if (n && n.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!n) {
                                    var o = (a.current.shards || []).map(n8).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (o.length > 0 ? l(e, o[0]) : !a.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        c = e3.useCallback(function(e, r, n, o) {
                            var i = {
                                name: e,
                                delta: r,
                                target: n,
                                should: o,
                                shadowParent: function(e) {
                                    for (var t, r, n = null; null !== e;) t = e, (null != (r = ShadowRoot) && "u" > typeof Symbol && r[Symbol.hasInstance] ? !!r[Symbol.hasInstance](t) : t instanceof r) && (n = e.host, e = e.host), e = e.parentNode;
                                    return n
                                }(n)
                            };
                            t.current.push(i), setTimeout(function() {
                                t.current = t.current.filter(function(e) {
                                    return e !== i
                                })
                            }, 1)
                        }, []),
                        u = e3.useCallback(function(e) {
                            r.current = n4(e), n.current = void 0
                        }, []),
                        d = e3.useCallback(function(t) {
                            c(t.type, n3(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        f = e3.useCallback(function(t) {
                            c(t.type, n4(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    e3.useEffect(function() {
                        return n5.push(i), e.setCallbacks({
                                onScrollCapture: d,
                                onWheelCapture: d,
                                onTouchMoveCapture: f
                            }), document.addEventListener("wheel", s, nY), document.addEventListener("touchmove", s, nY), document.addEventListener("touchstart", u, nY),
                            function() {
                                n5 = n5.filter(function(e) {
                                    return e !== i
                                }), document.removeEventListener("wheel", s, nY), document.removeEventListener("touchmove", s, nY), document.removeEventListener("touchstart", u, nY)
                            }
                    }, []);
                    var p = e.removeScrollBar,
                        m = e.inert;
                    return e3.createElement(e3.Fragment, null, m ? e3.createElement(i, {
                        styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
                    }) : null, p ? e3.createElement(nH, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, nC.useMedium(m), nk),
                n9 = e3.forwardRef(function(e, t) {
                    return e3.createElement(nR, nP({}, e, {
                        ref: t,
                        sideCar: n7
                    }))
                });
            n9.classNames = nR.classNames;
            var oe = new WeakMap,
                ot = new WeakMap,
                or = {},
                on = 0,
                oo = function(e) {
                    return e && (e.host || oo(e.parentNode))
                },
                oi = function(e, t, r, n) {
                    var o = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var r = oo(e);
                        return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    or[r] || (or[r] = new WeakMap);
                    var i = or[r],
                        a = [],
                        l = new Set,
                        s = new Set(o),
                        c = function(e) {
                            !e || l.has(e) || (l.add(e), c(e.parentNode))
                        };
                    o.forEach(c);
                    var u = function(e) {
                        !e || s.has(e) || Array.prototype.forEach.call(e.children, function(e) {
                            if (l.has(e)) u(e);
                            else try {
                                var t = e.getAttribute(n),
                                    o = null !== t && "false" !== t,
                                    s = (oe.get(e) || 0) + 1,
                                    c = (i.get(e) || 0) + 1;
                                oe.set(e, s), i.set(e, c), a.push(e), 1 === s && o && ot.set(e, !0), 1 === c && e.setAttribute(r, "true"), o || e.setAttribute(n, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return u(t), l.clear(), on++,
                        function() {
                            a.forEach(function(e) {
                                var t = oe.get(e) - 1,
                                    o = i.get(e) - 1;
                                oe.set(e, t), i.set(e, o), t || (ot.has(e) || e.removeAttribute(n), ot.delete(e)), o || e.removeAttribute(r)
                            }), --on || (oe = new WeakMap, oe = new WeakMap, ot = new WeakMap, or = {})
                        }
                },
                oa = function(e, t, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var n = Array.from(Array.isArray(e) ? e : [e]),
                        o = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return o ? (n.push.apply(n, Array.from(o.querySelectorAll("[aria-live], script"))), oi(n, o, r, "aria-hidden")) : function() {
                        return null
                    }
                };

            function ol(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function os(e) {
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

            function oc(e, t) {
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

            function ou(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }

            function od(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ol(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ol(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var of = "Dialog", op = od(function(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    n = function() {
                        var t = r.map(function(e) {
                            return e3.createContext(e)
                        });
                        return function(r) {
                            var n = (null == r ? void 0 : r[e]) || t;
                            return e3.useMemo(function() {
                                var t, o;
                                return rF({}, "__scope".concat(e), (t = rG({}, r), o = null != (o = rF({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                                    var t = Object.keys(e);
                                    if (Object.getOwnPropertySymbols) {
                                        var r = Object.getOwnPropertySymbols(e);
                                        t.push.apply(t, r)
                                    }
                                    return t
                                })(Object(o)).forEach(function(e) {
                                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(o, e))
                                }), t))
                            }, [r, n])
                        }
                    };
                return n.scopeName = e, [function(t, n) {
                    var o = e3.createContext(n),
                        i = r.length;
                    r = rq(r).concat([n]);
                    var a = function(t) {
                        var r, n = t.scope,
                            a = t.children,
                            l = rz(t, ["scope", "children"]),
                            s = (null == n || null == (r = n[e]) ? void 0 : r[i]) || o,
                            c = e3.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, S.jsx)(s.Provider, {
                            value: c,
                            children: a
                        })
                    };
                    return a.displayName = t + "Provider", [a, function(r, a) {
                        var l, s = (null == a || null == (l = a[e]) ? void 0 : l[i]) || o,
                            c = e3.useContext(s);
                        if (c) return c;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, rK.apply(void 0, [n].concat(rq(t)))]
            }(of), 2), om = op[0];
            op[1];
            var oy = od(om(of), 2),
                oh = oy[0],
                ob = oy[1],
                ov = function(e) {
                    var t, r, n, o, i, a, l, s, c, u, d, f, p, m, y, h, b, v = e.__scopeDialog,
                        g = e.children,
                        w = e.open,
                        x = e.defaultOpen,
                        O = e.onOpenChange,
                        P = e.modal,
                        I = e3.useRef(null),
                        j = e3.useRef(null),
                        E = od((c = (s = {
                            prop: w,
                            defaultProp: x,
                            onChange: O
                        }).prop, p = (f = rZ((r = (t = {
                            defaultProp: s.defaultProp,
                            onChange: d = void 0 === (u = s.onChange) ? function() {} : u
                        }).defaultProp, n = t.onChange, i = rZ(o = e3.useState(r), 1)[0], a = e3.useRef(i), l = rJ(n), e3.useEffect(function() {
                            a.current !== i && (l(i), a.current = i)
                        }, [i, a, l]), o), 2))[0], m = f[1], h = (y = void 0 !== c) ? c : p, b = rJ(d), [h, e3.useCallback(function(e) {
                            if (y) {
                                var t = "function" == typeof e ? e(c) : e;
                                t !== c && b(t)
                            } else m(e)
                        }, [y, c, m, b])]), 2),
                        T = E[0],
                        N = E[1];
                    return (0, S.jsx)(oh, {
                        scope: v,
                        triggerRef: I,
                        contentRef: j,
                        contentId: r$(),
                        titleId: r$(),
                        descriptionId: r$(),
                        open: void 0 !== T && T,
                        onOpenChange: N,
                        onOpenToggle: e3.useCallback(function() {
                            return N(function(e) {
                                return !e
                            })
                        }, [N]),
                        modal: void 0 === P || P,
                        children: g
                    })
                };
            ov.displayName = of;
            var og = "DialogTrigger";
            e3.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = ou(e, ["__scopeDialog"]),
                    o = ob(og, r),
                    i = tu(t, o.triggerRef);
                return (0, S.jsx)(no.button, oc(os({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": o.open,
                    "aria-controls": o.contentId,
                    "data-state": oB(o.open)
                }, n), {
                    ref: i,
                    onClick: rL(e.onClick, o.onOpenToggle)
                }))
            }).displayName = og;
            var ow = "DialogPortal",
                ox = od(om(ow, {
                    forceMount: void 0
                }), 2),
                oS = ox[0],
                oO = ox[1],
                oP = function(e) {
                    var t = e.__scopeDialog,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        i = ob(ow, t);
                    return (0, S.jsx)(oS, {
                        scope: t,
                        forceMount: r,
                        children: e3.Children.map(n, function(e) {
                            return (0, S.jsx)(nx, {
                                present: r || i.open,
                                children: (0, S.jsx)(nv, {
                                    asChild: !0,
                                    container: o,
                                    children: e
                                })
                            })
                        })
                    })
                };
            oP.displayName = ow;
            var oI = "DialogOverlay",
                oj = e3.forwardRef(function(e, t) {
                    var r = oO(oI, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        i = ou(e, ["forceMount"]),
                        a = ob(oI, e.__scopeDialog);
                    return a.modal ? (0, S.jsx)(nx, {
                        present: o || a.open,
                        children: (0, S.jsx)(oT, oc(os({}, i), {
                            ref: t
                        }))
                    }) : null
                });
            oj.displayName = oI;
            var oE = r7("DialogOverlay.RemoveScroll"),
                oT = e3.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = ou(e, ["__scopeDialog"]),
                        o = ob(oI, r);
                    return (0, S.jsx)(n9, {
                        as: oE,
                        allowPinchZoom: !0,
                        shards: [o.contentRef],
                        children: (0, S.jsx)(no.div, oc(os({
                            "data-state": oB(o.open)
                        }, n), {
                            ref: t,
                            style: os({
                                pointerEvents: "auto"
                            }, n.style)
                        }))
                    })
                }),
                oN = "DialogContent",
                oA = e3.forwardRef(function(e, t) {
                    var r = oO(oN, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        i = ou(e, ["forceMount"]),
                        a = ob(oN, e.__scopeDialog);
                    return (0, S.jsx)(nx, {
                        present: o || a.open,
                        children: a.modal ? (0, S.jsx)(oC, oc(os({}, i), {
                            ref: t
                        })) : (0, S.jsx)(oD, oc(os({}, i), {
                            ref: t
                        }))
                    })
                });
            oA.displayName = oN;
            var oC = e3.forwardRef(function(e, t) {
                    var r = ob(oN, e.__scopeDialog),
                        n = e3.useRef(null),
                        o = tu(t, r.contentRef, n);
                    return e3.useEffect(function() {
                        var e = n.current;
                        if (e) return oa(e)
                    }, []), (0, S.jsx)(oR, oc(os({}, e), {
                        ref: o,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: rL(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: rL(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                r = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || r) && e.preventDefault()
                        }),
                        onFocusOutside: rL(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                oD = e3.forwardRef(function(e, t) {
                    var r = ob(oN, e.__scopeDialog),
                        n = e3.useRef(!1),
                        o = e3.useRef(!1);
                    return (0, S.jsx)(oR, oc(os({}, e), {
                        ref: t,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(t) {
                            var i, a;
                            null == (i = e.onCloseAutoFocus) || i.call(e, t), t.defaultPrevented || (n.current || null == (a = r.triggerRef.current) || a.focus(), t.preventDefault()), n.current = !1, o.current = !1
                        },
                        onInteractOutside: function(t) {
                            null == (i = e.onInteractOutside) || i.call(e, t), t.defaultPrevented || (n.current = !0, "pointerdown" === t.detail.originalEvent.type && (o.current = !0));
                            var i, a, l = t.target;
                            (null == (a = r.triggerRef.current) ? void 0 : a.contains(l)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && o.current && t.preventDefault()
                        }
                    }))
                }),
                oR = e3.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        i = e.onCloseAutoFocus,
                        a = ou(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = ob(oN, r),
                        s = e3.useRef(null),
                        c = tu(t, s);
                    return (0, nO.useFocusGuards)(), (0, S.jsxs)(S.Fragment, {
                        children: [(0, S.jsx)(nd, {
                            asChild: !0,
                            loop: !0,
                            trapped: n,
                            onMountAutoFocus: o,
                            onUnmountAutoFocus: i,
                            children: (0, S.jsx)(r0.DismissableLayer, oc(os({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": oB(l.open)
                            }, a), {
                                ref: c,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, S.jsxs)(S.Fragment, {
                            children: [(0, S.jsx)(oq, {
                                titleId: l.titleId
                            }), (0, S.jsx)(oK, {
                                contentRef: s,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                ok = "DialogTitle",
                o_ = e3.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = ou(e, ["__scopeDialog"]),
                        o = ob(ok, r);
                    return (0, S.jsx)(no.h2, oc(os({
                        id: o.titleId
                    }, n), {
                        ref: t
                    }))
                });
            o_.displayName = ok;
            var oM = "DialogDescription";
            e3.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = ou(e, ["__scopeDialog"]),
                    o = ob(oM, r);
                return (0, S.jsx)(no.p, oc(os({
                    id: o.descriptionId
                }, n), {
                    ref: t
                }))
            }).displayName = oM;
            var oU = "DialogClose",
                oL = e3.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = ou(e, ["__scopeDialog"]),
                        o = ob(oU, r);
                    return (0, S.jsx)(no.button, oc(os({
                        type: "button"
                    }, n), {
                        ref: t,
                        onClick: rL(e.onClick, function() {
                            return o.onOpenChange(!1)
                        })
                    }))
                });

            function oB(e) {
                return e ? "open" : "closed"
            }
            oL.displayName = oU;
            var oF = "DialogTitleWarning",
                oG = od((y = {
                    contentName: oN,
                    titleName: ok,
                    docsSlug: "dialog"
                }, h = e3.createContext(y), (b = function(e) {
                    var t = e.children,
                        r = rz(e, ["children"]),
                        n = e3.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, S.jsx)(h.Provider, {
                        value: n,
                        children: t
                    })
                }).displayName = oF + "Provider", [b, function(e) {
                    var t = e3.useContext(h);
                    if (t) return t;
                    if (void 0 !== y) return y;
                    throw Error("`".concat(e, "` must be used within `").concat(oF, "`"))
                }]), 2),
                oz = (oG[0], oG[1]),
                oq = function(e) {
                    var t = e.titleId,
                        r = oz(oF),
                        n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return e3.useEffect(function() {
                        t && (document.getElementById(t) || console.error(n))
                    }, [n, t]), null
                },
                oK = function(e) {
                    var t = e.contentRef,
                        r = e.descriptionId,
                        n = oz("DialogDescriptionWarning"),
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
                    return e3.useEffect(function() {
                        var e, n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        r && n && (document.getElementById(r) || console.warn(o))
                    }, [o, t, r]), null
                };

            function oV(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oW(e) {
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

            function oH(e, t) {
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

            function oX(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }

            function o$(e) {
                return function(e) {
                    if (Array.isArray(e)) return oV(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return oV(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oV(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var oY = Symbol("radix.slottable");

            function oJ(e) {
                return e3.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === oY
            }

            function oQ(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function oZ(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        oQ(e, t, r[t])
                    })
                }
                return e
            }

            function o0(e, t) {
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
            var o1 = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r, n, o, i, a, l = (r = o = "Primitive.".concat(t), (n = e3.forwardRef(function(e, t) {
                        var r = e.children,
                            n = oX(e, ["children"]);
                        if (e3.isValidElement(r)) {
                            var o, i, a, l, s, c = (s = (l = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (s = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                u = function(e, t) {
                                    var r = oW({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            i = t[n];
                                        /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = i.apply(void 0, o$(t));
                                            return o.apply(void 0, o$(t)), n
                                        } : o && (r[n] = o) : "style" === n ? r[n] = oW({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                    }(n);
                                    return oW({}, e, r)
                                }(n, r.props);
                            return r.type !== e3.Fragment && (u.ref = t ? tc(t, c) : c), e3.cloneElement(r, u)
                        }
                        return e3.Children.count(r) > 1 ? e3.Children.only(null) : null
                    })).displayName = "".concat(r, ".SlotClone"), i = n, (a = e3.forwardRef(function(e, t) {
                        var r = e.children,
                            n = oX(e, ["children"]),
                            o = e3.Children.toArray(r),
                            a = o.find(oJ);
                        if (a) {
                            var l = a.props.children,
                                s = o.map(function(e) {
                                    return e !== a ? e : e3.Children.count(l) > 1 ? e3.Children.only(null) : e3.isValidElement(l) ? l.props.children : null
                                });
                            return (0, S.jsx)(i, oH(oW({}, n), {
                                ref: t,
                                children: e3.isValidElement(l) ? e3.cloneElement(l, void 0, s) : null
                            }))
                        }
                        return (0, S.jsx)(i, oH(oW({}, n), {
                            ref: t,
                            children: r
                        }))
                    })).displayName = "".concat(o, ".Slot"), a),
                    s = e3.forwardRef(function(e, r) {
                        var n = e.asChild,
                            o = function(e, t) {
                                if (null == e) return {};
                                var r, n, o, i = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                    return i
                                }
                                if (i = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, o = {},
                                            i = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                        return o
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                return i
                            }(e, ["asChild"]),
                            i = n ? l : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, S.jsx)(i, o0(oZ({}, o), {
                            ref: r
                        }))
                    });
                return s.displayName = "Primitive.".concat(t), o0(oZ({}, e), oQ({}, t, s))
            }, {});

            function o2(e) {
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
            var o4 = Object.freeze({
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
                o3 = e3.forwardRef(function(e, t) {
                    var r, n;
                    return (0, S.jsx)(o1.span, (r = o2({}, e), n = n = {
                        ref: t,
                        style: o2({}, o4, e.style)
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

            function o8(e) {
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

            function o6(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }
            o3.displayName = "VisuallyHidden";
            var o5 = (0, e3.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                o7 = function() {
                    var e = (0, e3.useContext)(o5);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                o9 = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                ie = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                it = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                ir = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.children,
                        o = e.size,
                        i = e.type,
                        a = void 0 === i ? "Default" : i,
                        l = e.isModal,
                        s = e.hasCloseAffordance,
                        c = e.closeLabel,
                        u = e.hasMarginTop,
                        d = void 0 === u || u,
                        f = e.hasMarginBottom,
                        p = void 0 === f || f,
                        m = e.hasDescription,
                        y = void 0 !== m && m,
                        h = e.experimentalDisablePointerEventsStylingOnBody,
                        b = void 0 !== h && h,
                        v = (0, e3.useMemo)(function() {
                            return {
                                size: o,
                                isModal: l,
                                type: a,
                                hasCloseAffordance: s,
                                closeLabel: c,
                                hasMarginTop: d,
                                hasMarginBottom: p,
                                hasDescription: y
                            }
                        }, [o, l, a, s, c, d, p, y]);
                    return (0, e3.useEffect)(function() {
                        b && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [b, t]), e8().createElement(o5.Provider, {
                        value: v
                    }, e8().createElement(ov, {
                        open: t,
                        onOpenChange: r
                    }, n))
                };
            ir.displayName = "Dialog";
            var io = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.style,
                    o = e.overlayClassName,
                    i = e.overlayStyle,
                    a = e.onOpenAutoFocus,
                    l = o6(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    s = o7(),
                    c = s.size,
                    u = s.isModal,
                    d = s.hasCloseAffordance,
                    f = s.closeLabel,
                    p = s.hasDescription,
                    m = e6("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", u && "bg-common-backdrop", o),
                    y = e6("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return e8().createElement(oP, null, e8().createElement(oj, {
                    className: m,
                    style: i
                }, e8().createElement(oA, o8({
                    className: y,
                    "data-size": c,
                    style: n,
                    onOpenAutoFocus: a
                }, !p && {
                    "aria-describedby": void 0
                }, l), d && e8().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, e8().createElement(oL, {
                    asChild: !0
                }, e8().createElement(rU, {
                    variant: "OverMedia",
                    size: c,
                    isCircular: !0,
                    "aria-label": f
                }))), t)))
            };
            io.displayName = "DialogContent";
            var ii = function(e) {
                var t = e.children,
                    r = e.className,
                    n = o6(e, ["children", "className"]),
                    o = o7(),
                    i = o.size,
                    a = o.hasMarginTop,
                    l = o.hasMarginBottom,
                    s = e6(o9[i], a && ie[i], l && it[i], r);
                return e8().createElement("div", o8({
                    className: s
                }, n), t)
            };
            ii.displayName = "DialogBody";
            var ia = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.hidden,
                    o = o6(e, ["children", "className", "hidden"]),
                    i = e8().createElement(o_, o8({
                        className: r
                    }, o), t);
                return n ? e8().createElement(o3, null, i) : i
            };
            ia.displayName = "DialogTitle";
            var il = function(e) {
                var t = e.children,
                    r = e.className,
                    n = o6(e, ["children", "className"]),
                    o = o7().size,
                    i = e6(o9[o], it[o], r);
                return e8().createElement("div", o8({
                    className: i
                }, n), t)
            };
            il.displayName = "DialogFooter";
            var is = function(e) {
                var t = e.open,
                    r = e.onOpenChange,
                    n = e.title,
                    o = e.body,
                    i = (0, O.useTranslation)().translate;
                return (0, S.jsx)(ir, {
                    closeLabel: i("Action.Close"),
                    hasCloseAffordance: !0,
                    isModal: !0,
                    open: t,
                    size: "Small",
                    type: "Default",
                    onOpenChange: r,
                    children: (0, S.jsxs)(io, {
                        className: "stroke-standard stroke-default flex flex-col items-start",
                        style: {
                            width: "100%",
                            maxWidth: 320
                        },
                        children: [(0, S.jsxs)(ii, {
                            className: "width-full gap-small padding-top-medium padding-x-xlarge padding-bottom-large flex flex-col items-start",
                            children: [(0, S.jsx)(ia, {
                                className: "margin-none text-heading-small content-emphasis text-align-x-start",
                                children: n
                            }), (0, S.jsx)("p", {
                                className: "margin-none text-body-medium content-default text-align-x-start whitespace-pre-line",
                                children: o
                            })]
                        }), (0, S.jsx)(il, {
                            className: "width-full",
                            children: (0, S.jsx)(tk, {
                                className: "width-full",
                                size: "Medium",
                                variant: "Emphasis",
                                onClick: function() {
                                    r(!1)
                                },
                                children: i("Action.OK")
                            })
                        })]
                    })
                })
            };

            function ic(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iu(e) {
                if (Array.isArray(e)) return e
            }

            function id() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ip(e) {
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

            function im(e, t) {
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

            function iy(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }

            function ih(e, t) {
                if (e) {
                    if ("string" == typeof e) return ic(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ic(e, t)
                }
            }
            var ib = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                iv = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                ig = {
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
                iw = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                ix = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                iS = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                iO = {
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
                iP = {
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
                iI = (0, e3.forwardRef)(function(e, t) {
                    var r, n, o = iu(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || ih(r) || id(),
                        i = o[0],
                        a = o.slice(1),
                        l = i.className,
                        s = i.icon,
                        c = i.ariaLabel,
                        u = i.isDisabled,
                        d = void 0 !== u && u,
                        f = i.isCircular,
                        p = i.isSelected,
                        m = i.size,
                        y = void 0 === m ? "Large" : m,
                        h = i.variant,
                        b = void 0 === h ? "Emphasis" : h,
                        v = i.iconColor,
                        g = void 0 === v ? "Default" : v,
                        w = i.asChild,
                        x = i.children,
                        S = iy(i, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]),
                        O = (iu(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); i = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return o
                            }
                        }(a) || ih(a, 1) || id())[0];
                    n = d ? ix[b] : void 0 !== p && p ? iS[b] : iw[b];
                    var P = e6("foundation-web-icon-button", d ? ti : [tn, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", ib[y], ig[y][void 0 !== f && f ? "circular" : "square"], n, l),
                        I = e8().createElement(e8().Fragment, null, e8().createElement(to, null), e8().createElement("span", {
                            className: e6("icon", s, iv[y], d ? iP[g][b] : iO[g][b])
                        }));
                    if (w) {
                        S.as;
                        var j = iy(S, ["as"]),
                            E = e8().Children.only(x);
                        return e8().createElement(tw, im(ip({
                            ref: O
                        }, j), {
                            className: P,
                            "aria-label": c,
                            "aria-disabled": d || void 0
                        }), e8().cloneElement(E, {}, I))
                    }
                    if ("a" === S.as) {
                        S.as;
                        var T = S.href,
                            N = iy(S, ["as", "href"]);
                        return e8().createElement("a", im(ip({
                            ref: O
                        }, N), {
                            "aria-label": c,
                            "aria-disabled": d,
                            href: d ? void 0 : T,
                            className: P
                        }), I)
                    }
                    S.as;
                    var A = iy(S, ["as"]);
                    return e8().createElement("button", im(ip({
                        ref: O,
                        type: "button"
                    }, A), {
                        "aria-label": c,
                        disabled: d,
                        className: P
                    }), I)
                });

            function ij(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iE(e) {
                if (Array.isArray(e)) return e
            }

            function iT() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function iN(e) {
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

            function iA(e, t) {
                if (e) {
                    if ("string" == typeof e) return ij(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ij(e, t)
                }
            }
            var iC = (0, e3.forwardRef)(function(e, t) {
                var r, n, o, i = iE(o = [e, t]) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(o) || iA(o) || iT(),
                    a = i[0],
                    l = i.slice(1),
                    s = a.className,
                    c = a.style,
                    u = a.orientation,
                    d = void 0 === u ? "horizontal" : u,
                    f = a.variant,
                    p = void 0 === f ? "Standard" : f,
                    m = function(e, t) {
                        if (null == e) return {};
                        var r, n, o, i = {};
                        if ("u" > typeof Reflect && Reflect.ownKeys) {
                            for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                            return i
                        }
                        if (i = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = {},
                                    i = Object.getOwnPropertyNames(e);
                                for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                return o
                            }(e, t), Object.getOwnPropertySymbols)
                            for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                        return i
                    }(a, ["className", "style", "orientation", "variant"]),
                    y = (iE(l) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                i = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); i = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    i || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return o
                        }
                    }(l) || iA(l, 1) || iT())[0],
                    h = "vertical" === d,
                    b = {};
                return h || "Inset" !== p ? h || "InsetLeft" !== p ? h || "InsetRight" !== p || (b = {
                    marginRight: "var(--padding-xlarge)"
                }) : b = {
                    marginLeft: "var(--padding-xlarge)"
                } : b = {
                    marginLeft: "var(--padding-xlarge)",
                    marginRight: "var(--padding-xlarge)"
                }, e8().createElement("div", (r = iN({
                    ref: y
                }, m), n = n = {
                    role: "separator",
                    "data-orientation": d,
                    "aria-orientation": d,
                    style: iN({
                        borderRightWidth: 0,
                        borderBottomWidth: 0,
                        boxSizing: "border-box",
                        borderStyle: "solid"
                    }, h ? {
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
                    }, b, c),
                    className: e6("stroke-default self-stretch", s)
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
            iC.displayName = "Divider";
            var iD = function(e) {
                var t = e.type,
                    r = e.sideSheetSide,
                    n = e.isSideSheetFlush,
                    o = e.centerSheetSize,
                    i = e.children,
                    a = e.overlayClassName,
                    l = e.contentClassName,
                    s = e.onOpenAutoFocus,
                    c = e.onCloseAutoFocus,
                    u = e.onPointerDownOutside,
                    d = e.onEscapeKeyDown,
                    f = e.onInteractOutside;
                return e8().createElement(oP, null, e8().createElement(oj, {
                    "data-testid": "fui-base-sheet-overlay",
                    "data-type": t,
                    "data-side": "sideSheet" === t ? void 0 === r ? "right" : r : void 0,
                    "data-flush": "sideSheet" === t ? void 0 !== n && n : void 0,
                    "data-size": "centerSheet" === t ? void 0 === o ? "Medium" : o : void 0,
                    className: e6("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", a)
                }, e8().createElement(oA, {
                    "data-testid": "fui-base-sheet-content",
                    className: e6("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", l),
                    onOpenAutoFocus: s,
                    onCloseAutoFocus: c,
                    onPointerDownOutside: u,
                    onEscapeKeyDown: d,
                    onInteractOutside: f
                }, i)))
            };

            function iR(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var ik = function(e) {
                    return ("function" != typeof e.checkVisibility || e.checkVisibility()) && !("disabled" in e && e.disabled || "true" === e.getAttribute("aria-disabled"))
                },
                i_ = function(e) {
                    iR(e, HTMLInputElement) && "function" == typeof e.select && e.select()
                },
                iM = function(e) {
                    var t = e.currentTarget;
                    if (t) {
                        var r = t.querySelectorAll("[data-autofocus-priority]");
                        if (0 !== r.length) {
                            var n = [];
                            r.forEach(function(e) {
                                var t = parseInt(e.getAttribute("data-autofocus-priority") || "", 10);
                                !Number.isNaN(t) && iR(e, HTMLElement) && n.push({
                                    element: e,
                                    priority: t
                                })
                            }), n.sort(function(e, t) {
                                return e.priority - t.priority
                            });
                            var o = n.find(function(e) {
                                return ik(e.element)
                            });
                            if (o) {
                                e.preventDefault();
                                var i = document.activeElement === o.element;
                                o.element.focus(), i || i_(o.element)
                            }
                        }
                    }
                };

            function iU(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            r(977);
            var iL = "u" > typeof window ? e3.useLayoutEffect : e3.useEffect,
                iB = "u" < typeof window;

            function iF(e) {
                var t, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = r.defaultValue,
                    o = void 0 !== n && n,
                    i = r.initializeWithValue,
                    a = void 0 === i || i,
                    l = function(e) {
                        return iB ? o : window.matchMedia(e).matches
                    },
                    s = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = (0, e3.useState)(function() {
                        return a ? l(e) : o
                    })) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                i = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    i || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return o
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return iU(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iU(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    c = s[0],
                    u = s[1];

                function d() {
                    u(l(e))
                }
                return iL(function() {
                    var t = window.matchMedia(e);
                    return d(), t.addListener ? t.addListener(d) : t.addEventListener("change", d),
                        function() {
                            t.removeListener ? t.removeListener(d) : t.removeEventListener("change", d)
                        }
                }, [e]), c
            }

            function iG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iz(e) {
                if (Array.isArray(e)) return e
            }

            function iq() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function iK(e) {
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
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }

            function iW(e, t) {
                if (e) {
                    if ("string" == typeof e) return iG(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iG(e, t)
                }
            }
            var iH = (0, e3.createContext)(null),
                iX = function() {
                    var e = (0, e3.useContext)(iH);
                    if (!e) throw Error("Sheet components must be used within a Sheet");
                    return e
                },
                i$ = "padding-x-xlarge",
                iY = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.defaultOpen,
                        o = e.children;
                    return e8().createElement(ov, {
                        open: t,
                        onOpenChange: r,
                        defaultOpen: n,
                        modal: !0
                    }, o)
                },
                iJ = function(e) {
                    var t, r = e.children,
                        n = e.centerSheetSize,
                        o = void 0 === n ? "Medium" : n,
                        i = e.largeScreenVariant,
                        a = void 0 === i ? "center" : i,
                        l = e.closeLabel,
                        s = e.className,
                        c = e.mobilePortraitClassName,
                        u = e.mobileLandscapeClassName,
                        d = e.largeScreenClassName,
                        f = e.onOpenAutoFocus,
                        p = e.onCloseAutoFocus,
                        m = e.onPointerDownOutside,
                        y = e.onEscapeKeyDown,
                        h = e.onInteractOutside,
                        b = iF("(orientation: portrait) and (max-width: 600px)"),
                        v = iF("(orientation: landscape) and (max-height: 600px)");
                    t = b ? "bottomSheet" : v || "side" === a ? "sideSheet" : "centerSheet";
                    var g = (0, e3.useMemo)(function() {
                            return {
                                centerSheetSize: o,
                                largeScreenVariant: a,
                                closeLabel: l,
                                isPortraitMobile: b,
                                isLandscapeMobile: v,
                                type: t
                            }
                        }, [o, a, l, b, v, t]),
                        w = e6(s, b && c, v && u, !b && !v && d);
                    return e8().createElement(iH.Provider, {
                        value: g
                    }, e8().createElement(iD, {
                        type: t,
                        sideSheetSide: "right",
                        isSideSheetFlush: v,
                        centerSheetSize: o,
                        contentClassName: w,
                        onOpenAutoFocus: null != f ? f : iM,
                        onCloseAutoFocus: p,
                        onPointerDownOutside: m,
                        onEscapeKeyDown: y,
                        onInteractOutside: h
                    }, r))
                },
                iQ = (0, e3.forwardRef)(function(e, t) {
                    var r, n = iz(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || iW(r) || iq(),
                        o = n[0],
                        i = n.slice(1),
                        a = o.children,
                        l = o.className,
                        s = o.hasPaddingX,
                        c = iV(o, ["children", "className", "hasPaddingX"]),
                        u = (iz(i) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); i = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return o
                            }
                        }(i) || iW(i, 1) || iq())[0],
                        d = iX().type;
                    return e8().createElement("div", iK({
                        ref: u,
                        className: e6("scroll-y", (void 0 === s || s) && i$, "sideSheet" === d ? "grow-1" : "", l)
                    }, c), a)
                });
            iQ.displayName = "SheetBody";
            var iZ = function(e) {
                    var t = e.className,
                        r = e.children,
                        n = e.navigation,
                        o = e.utilities,
                        i = e.visuallyHideTitleText,
                        a = iX().closeLabel,
                        l = e8().createElement(o_, {
                            className: "text-heading-small margin-none"
                        }, r);
                    return e8().createElement("div", {
                        className: e6(t, n ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
                    }, e8().createElement("div", {
                        className: e6("flex items-center", n && "gap-xsmall")
                    }, n, i ? e8().createElement(o3, null, l) : l), e8().createElement("div", {
                        className: e6("flex items-center", o && "gap-xxsmall")
                    }, o, e8().createElement("div", {
                        className: "fui-sheet-close-affordance-container"
                    }, e8().createElement(oL, {
                        asChild: !0
                    }, e8().createElement(iI, {
                        variant: "Utility",
                        size: "Medium",
                        icon: "icon-regular-x",
                        ariaLabel: a || "",
                        "data-autofocus-priority": "1000"
                    })))))
                },
                i0 = function(e) {
                    var t = e.children,
                        r = e.className,
                        n = iV(e, ["children", "className"]);
                    return e8().createElement(e8().Fragment, null, e8().createElement(iC, null), e8().createElement("div", iK({
                        className: e6(i$, "margin-y-small shrink-0", r)
                    }, n), t))
                },
                i1 = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600"
                },
                i2 = {
                    XSmall: "size-150",
                    Small: "size-200",
                    Medium: "size-250"
                },
                i4 = {
                    XSmall: "size-1200",
                    Small: "size-1400",
                    Medium: "size-1600"
                },
                i3 = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium"
                },
                i8 = {
                    XSmall: void 0,
                    Small: "padding-top-xxsmall",
                    Medium: "padding-y-xxsmall"
                },
                i6 = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium"
                },
                i5 = {
                    XSmall: "padding-medium",
                    Small: "padding-large",
                    Medium: "padding-xlarge"
                },
                i7 = {
                    XSmall: "Small",
                    Small: "Medium",
                    Medium: "Large"
                },
                i9 = (0, e3.forwardRef)(function(e, t) {
                    var r = e.layout,
                        n = e.size,
                        o = e.type,
                        i = e.isDisabled,
                        a = e.label,
                        l = e.description,
                        s = e.media,
                        c = e.icon,
                        u = e.metadata,
                        d = e.isSelected,
                        f = e.onSelect,
                        p = e.hideSelectedIndicator,
                        m = void 0 !== p && p,
                        y = (0, e3.useMemo)(function() {
                            return a && e8().createElement("div", {
                                className: e6(i3[n], i8[n], "content-emphasis text-align-x-start", "clip [display:-webkit-box] [-webkit-line-clamp:3] [-webkit-box-orient:vertical]")
                            }, a)
                        }, [a, n]),
                        h = (0, e3.useMemo)(function() {
                            return u && e8().createElement("div", {
                                className: e6("text-caption-small content-default text-align-x-start", "text-truncate-split text-no-wrap width-full")
                            }, u)
                        }, [u]),
                        b = (0, e3.useMemo)(function() {
                            return l && e8().createElement("div", {
                                className: e6(i6[n], "content-default text-align-x-start")
                            }, l)
                        }, [l, n]),
                        v = (0, e3.useMemo)(function() {
                            return c && e8().createElement(tr, {
                                name: c,
                                size: i7[n]
                            })
                        }, [c, n]),
                        g = (0, e3.useMemo)(function() {
                            switch (o) {
                                case "Checkmark":
                                    return d && e8().createElement(tr, {
                                        name: "icon-filled-check",
                                        size: i7[n]
                                    });
                                case "Checkbox":
                                    return e8().createElement("div", {
                                        className: e6(i1[n], "flex items-center justify-center radius-small padding-none content-default", d ? "stroke-none" : "stroke-standard stroke-emphasis", d ? "bg-system-contrast" : "bg-none")
                                    }, d && e8().createElement("div", {
                                        className: e6(i1[n], "content-inverse-emphasis icon icon-filled-check")
                                    }));
                                case "Radio":
                                    return e8().createElement("div", {
                                        className: e6(i1[n], "radius-circle flex items-center justify-center stroke-emphasis stroke-standard", d ? "bg-system-contrast" : "bg-none")
                                    }, d && e8().createElement("div", {
                                        className: e6("radius-circle bg-inverse-action-sub-emphasis", i2[n])
                                    }));
                                default:
                                    return console.error("Invalid OptionSelector type ".concat(o)), null
                            }
                        }, [o, n, d]),
                        w = (0, e3.useMemo)(function() {
                            return s && e8().createElement("div", {
                                className: e6(i4[n], "flex items-center justify-center clip shrink-0")
                            }, s)
                        }, [s, n]),
                        x = (0, e3.useMemo)(function() {
                            var e = !m && e8().createElement("div", {
                                className: i1[n]
                            }, g);
                            switch (r) {
                                case "Horizontal":
                                    return e8().createElement("div", {
                                        className: "flex gap-large"
                                    }, w, e8().createElement("div", {
                                        className: "flex flex-col gap-xsmall fill clip"
                                    }, e8().createElement("div", {
                                        className: "flex gap-small items-start"
                                    }, e8().createElement("div", {
                                        className: "flex flex-col items-start fill clip"
                                    }, e8().createElement("div", {
                                        className: "flex gap-small items-center width-full"
                                    }, v, y), h), e), b));
                                case "Vertical":
                                    return e8().createElement("div", {
                                        className: "flex flex-col gap-xsmall"
                                    }, e8().createElement("div", {
                                        className: "flex gap-small"
                                    }, e8().createElement("div", {
                                        className: "flex flex-col gap-medium fill min-width-0"
                                    }, w, e8().createElement("div", {
                                        className: "flex flex-col gap-xsmall"
                                    }, v, y, h)), e), b);
                                default:
                                    return console.error("Invalid OptionSelector layout ".concat(r)), null
                            }
                        }, [r, w, v, y, b, g, n, h, m]);
                    return e8().createElement("button", {
                        type: "button",
                        className: e6(tn, "focus:outline-focus bg-none width-full radius-medium stroke-standard", d ? "stroke-system-contrast" : "stroke-contrast-alpha", i5[n], i && "opacity-[0.5]", !i && "cursor-pointer"),
                        disabled: i,
                        ref: t,
                        onClick: function() {
                            return f()
                        }
                    }, !i && e8().createElement(to, null), x)
                });
            i9.displayName = "OptionSelector";
            var ae = ((v = {}).LIST_AVAILABLE_PRODUCTS_FAILED = "ListAvailableProductsFailed", v.LIST_AVAILABLE_PRODUCTS_EMPTY = "ListAvailableProductsEmpty", v.LIST_SUBSCRIPTIONS_FAILED = "ListSubscriptionsFailed", v.GET_USER_BENEFITS_FAILED = "GetUserBenefitsFailed", v.GUAC_APP_POLICY_FAILED = "GuacAppPolicyFailed", v.MEMBERSHIP_POLLING_TIMEOUT = "MembershipPollingTimeout", v.PURCHASE_VIEW_SHOWN = "PurchaseViewShown", v.PURCHASE_VIEW_OPEN_SHEET_CLICK = "PurchaseViewOpenSheetClick", v.BUNDLE_PICKER_SHEET_OPENED = "BundlePickerSheetOpened", v.BUNDLE_PICKER_TIER_SELECTED = "BundlePickerTierSelected", v.BUNDLE_PICKER_SUBSCRIBE_CLICK = "BundlePickerSubscribeClick", v.BUNDLE_PICKER_ROW_MISSING_ROBUX_ALLOWANCE = "BundlePickerRowMissingRobuxAllowance", v.BUNDLE_PICKER_ROW_MISSING_STRIKETHROUGH_PRICE = "BundlePickerRowMissingStrikethroughPrice", v.MISSING_FEATURE_CONFIG = "MissingFeatureConfig", v),
                at = (0, window.Roblox["web-telemetry"].fire.createFireTelemetryCounter)("RobloxSubscription"),
                ar = function(e) {
                    var t = e.product,
                        r = e.isBundle,
                        n = (0, O.useTranslation)(),
                        o = n.translate,
                        i = n.intl,
                        a = t0(t);
                    (0, e3.useEffect)(function() {
                        r && 0 === a && at(ae.BUNDLE_PICKER_ROW_MISSING_ROBUX_ALLOWANCE, {
                            productId: t.productKey.id
                        }), r && !t.localizedStrikethroughPriceDisplayString && at(ae.BUNDLE_PICKER_ROW_MISSING_STRIKETHROUGH_PRICE, {
                            productId: t.productKey.id,
                            currencyCode: t.localizedPrice.currencyCode
                        })
                    }, [r, t.localizedPrice.currencyCode, t.localizedStrikethroughPriceDisplayString, t.productKey.id, a]);
                    var l = i.n(a),
                        s = a > 0 ? "".concat(o("Label.BlackbirdShort"), " ").concat(a) : o("Label.Blackbird"),
                        c = t.localizedPriceDisplayString,
                        u = t.localizedStrikethroughPriceDisplayString;
                    return (0, S.jsxs)("div", {
                        className: "width-full min-height-700 flex flex-col items-stretch justify-center",
                        children: [(0, S.jsxs)("div", {
                            className: "width-full flex flex-row items-center justify-between",
                            children: [(0, S.jsx)("span", {
                                className: "text-title-medium content-emphasis",
                                children: s
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
                                children: rE(o, "Plus.LandingPage.BottomSheet.Benefit", [{
                                    opening: "amountStart",
                                    closing: "amountEnd",
                                    render: function(e) {
                                        return (0, S.jsxs)("span", {
                                            className: "padding-left-xxsmall gap-x-xxsmall flex flex-row items-center",
                                            children: [(0, S.jsx)(tr, {
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
                an = function(e) {
                    var t = e.product,
                        r = e.isSelected,
                        n = e.onSelect,
                        o = e.isBundle;
                    return (0, S.jsx)("div", {
                        "data-testid": "bundle-picker-tier-".concat(t.productKey.id),
                        children: (0, S.jsx)(i9, {
                            hideSelectedIndicator: !0,
                            isSelected: r,
                            label: void 0,
                            layout: "Horizontal",
                            metadata: (0, S.jsx)(ar, {
                                isBundle: o,
                                product: t
                            }),
                            size: "XSmall",
                            type: "Checkmark",
                            onSelect: n
                        })
                    })
                };

            function ao(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var ai = function(e) {
                    var t, r, n, o, i, a, l = e.isOpen,
                        s = e.onOpenChange,
                        c = e.products,
                        u = e.deviceMeta,
                        d = e.isEntrypointDisabled,
                        f = e.onMobilePurchaseInitiated,
                        p = e.paymentSessionId,
                        m = (0, O.useTranslation)().translate,
                        y = null == (a = c[0]) ? void 0 : a.productKey.id,
                        h = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, e3.useState)(y)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return o
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return ao(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ao(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        b = h[0],
                        v = h[1];
                    (0, e3.useEffect)(function() {
                        b && c.some(function(e) {
                            return e.productKey.id === b
                        }) || v(y)
                    }, [y, c, b]);
                    var g = (0, e3.useMemo)(function() {
                            var e;
                            return null != (e = c.find(function(e) {
                                return e.productKey.id === b
                            })) ? e : c[0]
                        }, [c, b]),
                        w = !!g && void 0 !== t1(g),
                        x = (0, e3.useRef)(!1);
                    (0, e3.useEffect)(function() {
                        if (!l) {
                            x.current = !1;
                            return
                        }!x.current && p && (x.current = !0, ra().sendUserPurchaseFlowEvent(ra().ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, ra().ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, ra().ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, ra().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_BUNDLE_SHEET_OPENED, p ? {
                            paymentSessionId: p
                        } : {}), at(ae.BUNDLE_PICKER_SHEET_OPENED, {
                            tierCount: String(c.length),
                            defaultProductId: null != y ? y : ""
                        }))
                    }, [l, p, c.length, y]);
                    var P = (0, e3.useCallback)(function(e) {
                            v(e), ra().sendUserPurchaseFlowEvent(ra().ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, ra().ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, ra().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, ra().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_BUNDLE_TIER_SELECTED, function(e) {
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
                            } : {})), at(ae.BUNDLE_PICKER_TIER_SELECTED, {
                                productId: e
                            })
                        }, [p]),
                        I = (0, e3.useCallback)(function() {
                            var e = w ? ra().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : ra().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                            ra().sendUserPurchaseFlowEvent(ra().ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, ra().ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, ra().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, e, p ? {
                                paymentSessionId: p
                            } : {}), at(ae.BUNDLE_PICKER_SUBSCRIBE_CLICK, {
                                productId: null != b ? b : "",
                                isFreeTrial: String(w)
                            })
                        }, [w, b, p]);
                    if (!g) return null;
                    var j = [{
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
                        E = (o = null == (n = t1(g)) || null == (r = n.freeTrialOffer) ? void 0 : r.estimatedTrialEndDate) ? new Date(o).toLocaleDateString(void 0, {
                            year: "numeric",
                            month: "long",
                            day: "numeric"
                        }) : "",
                        T = d ? m("Description.EntrypointDisabled") : rE(m, w ? "Description.SubscriptionFreeTrialLegal" : "Description.SubscriptionLegal", j, w ? {
                            date: E
                        } : void 0),
                        N = u.isAndroidApp || u.isIosApp,
                        A = w ? m("Action.TryItForFree") : m("Action.PricePerMonth", {
                            price: null != (i = g.localizedPriceDisplayString) ? i : "",
                            periodType: g.periodType
                        });
                    return (0, S.jsx)(iY, {
                        open: l,
                        onOpenChange: s,
                        children: (0, S.jsxs)(iJ, {
                            centerSheetSize: "Medium",
                            closeLabel: m("Action.Close"),
                            largeScreenVariant: "center",
                            children: [(0, S.jsx)(iZ, {
                                children: m("Label.PickAPlan")
                            }), (0, S.jsx)(iQ, {
                                className: "gap-y-medium padding-y-medium flex flex-col",
                                "data-testid": "bundle-picker-sheet-body",
                                children: c.map(function(e, t) {
                                    return (0, S.jsx)(an, {
                                        isBundle: 0 !== t,
                                        isSelected: g.productKey.id === e.productKey.id,
                                        product: e,
                                        onSelect: function() {
                                            P(e.productKey.id)
                                        }
                                    }, e.productKey.id)
                                })
                            }), (0, S.jsx)(i0, {
                                children: (0, S.jsxs)("div", {
                                    className: "gap-y-small flex flex-col",
                                    children: [(0, S.jsx)(rN, {
                                        className: "width-full",
                                        deviceMeta: u,
                                        isDisabled: d,
                                        paymentSessionId: p,
                                        productId: null != b ? b : "",
                                        productType: g.productKey.type,
                                        size: "Medium",
                                        trackSubscriptionButtonClick: I,
                                        onSubscribeClick: N ? f : void 0,
                                        children: A
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
                aa = window.Roblox["core-scripts"].deepLink,
                al = {
                    itemId: 0x4b45c0ee905a,
                    itemType: aa.ItemType.Asset
                },
                as = function(e) {
                    var t = e.itemId,
                        r = e.itemType;
                    return "roblox://navigation/item_details?itemId=".concat(t, "&itemType=").concat(r)
                },
                ac = function(e) {
                    return (0, aa.navigateToDeepLink)(as(e))
                };

            function au(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ad(e) {
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

            function af(e, t) {
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

            function ap(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return au(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return au(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var am = {
                    enabled: !1,
                    arrivedGiftDate: new Date(2026, 7, 14)
                },
                ay = function(e) {
                    var t, r, n, o, i = e.deviceMeta,
                        a = e.robloxSubscriptionProducts,
                        l = e.isEntrypointDisabled,
                        s = e.onMobilePurchaseInitiated,
                        c = (0, O.useTranslation)().translate,
                        u = (null != (t = function() {
                            var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                            return function() {
                                var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0],
                                    t = rx((0, e3.useState)(e ? void 0 : rn().getLocalStorage(rS)), 2),
                                    r = t[0],
                                    n = t[1],
                                    o = rx((0, e3.useState)(!1), 2),
                                    i = o[0],
                                    a = o[1],
                                    l = (0, e3.useCallback)(function(e) {
                                        var t;
                                        return (t = function() {
                                            var t, r;
                                            return function(e, t) {
                                                var r, n, o, i = {
                                                        label: 0,
                                                        sent: function() {
                                                            if (1 & o[0]) throw o[1];
                                                            return o[1]
                                                        },
                                                        trys: [],
                                                        ops: []
                                                    },
                                                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                                    l = Object.defineProperty;
                                                return l(a, "next", {
                                                    value: s(0)
                                                }), l(a, "throw", {
                                                    value: s(1)
                                                }), l(a, "return", {
                                                    value: s(2)
                                                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                                                    value: function() {
                                                        return this
                                                    }
                                                }), a;

                                                function s(l) {
                                                    return function(s) {
                                                        var c = [l, s];
                                                        if (r) throw TypeError("Generator is already executing.");
                                                        for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                                                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                                                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                                                case 0:
                                                                case 1:
                                                                    o = c;
                                                                    break;
                                                                case 4:
                                                                    return i.label++, {
                                                                        value: c[1],
                                                                        done: !1
                                                                    };
                                                                case 5:
                                                                    i.label++, n = c[1], c = [0];
                                                                    continue;
                                                                case 7:
                                                                    c = i.ops.pop(), i.trys.pop();
                                                                    continue;
                                                                default:
                                                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                                        i = 0;
                                                                        continue
                                                                    }
                                                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                                        i.label = c[1];
                                                                        break
                                                                    }
                                                                    if (6 === c[0] && i.label < o[1]) {
                                                                        i.label = o[1], o = c;
                                                                        break
                                                                    }
                                                                    if (o && i.label < o[2]) {
                                                                        i.label = o[2], i.ops.push(c);
                                                                        break
                                                                    }
                                                                    o[2] && i.ops.pop(), i.trys.pop();
                                                                    continue
                                                            }
                                                            c = t.call(e, i)
                                                        } catch (e) {
                                                            c = [6, e], n = 0
                                                        } finally {
                                                            r = o = 0
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
                                                        if (!e) return [3, 2];
                                                        return [4, rb(function() {
                                                            return rv(this, function(t) {
                                                                return [2, ry(ru.GET, {
                                                                    withCredentials: !0,
                                                                    url: "".concat(rt.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions/").concat(e)
                                                                }, {
                                                                    feature: rd.PAYMENT,
                                                                    call: rf.GET_PAYMENT_SESSION
                                                                })]
                                                            })
                                                        })()];
                                                    case 1:
                                                        return r = o.sent(), [3, 4];
                                                    case 2:
                                                        return [4, rb(function() {
                                                            return rv(this, function(e) {
                                                                return [2, ry(ru.POST, {
                                                                    withCredentials: !0,
                                                                    url: "".concat(rt.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions")
                                                                }, {
                                                                    feature: rd.PAYMENT,
                                                                    call: rf.CREATE_PAYMENT_SESSION
                                                                }, {
                                                                    paymentFlowId: ra().getPaymentFlowUuid()
                                                                })]
                                                            })
                                                        })()];
                                                    case 3:
                                                        r = o.sent(), o.label = 4;
                                                    case 4:
                                                        if (!(t = r)) return [2];
                                                        return rn().setLocalStorage(rS, t.paymentSession), n(t.paymentSession), [2]
                                                }
                                            })
                                        }, function() {
                                            var e = this,
                                                r = arguments;
                                            return new Promise(function(n, o) {
                                                var i = t.apply(e, r);

                                                function a(e) {
                                                    rw(i, n, o, a, l, "next", e)
                                                }

                                                function l(e) {
                                                    rw(i, n, o, a, l, "throw", e)
                                                }
                                                a(void 0)
                                            })
                                        })()
                                    }, []);
                                return (0, e3.useEffect)(function() {
                                    if (r) {
                                        new Date(r.expiresAt) < new Date && (a(!0), l());
                                        return
                                    }
                                    var e, t = null == (e = ro.urlService.getQueryParam("paymentSessionId")) ? void 0 : e.toString();
                                    t || a(!0), l(t)
                                }, [l, r]), (0, e3.useMemo)(function() {
                                    return {
                                        paymentSession: r,
                                        wasCreatedByCurrentClient: i
                                    }
                                }, [r, i])
                            }(e).paymentSession
                        }()) ? t : {}).id,
                        d = a[0],
                        f = a.length > 1,
                        p = ap((0, e3.useState)(!1), 2),
                        m = p[0],
                        y = p[1],
                        h = (0, e3.useMemo)(function() {
                            return am.arrivedGiftDate.toLocaleDateString(void 0, {
                                day: "2-digit",
                                month: "short",
                                year: "numeric"
                            })
                        }, []);
                    if (!d) throw Error("PurchaseView requires at least one subscription product");
                    var b = d.productKey,
                        v = b.id,
                        g = b.type,
                        w = (0, e3.useMemo)(function() {
                            return d.eligibleOffers.find(function(e) {
                                return "FreeTrial" === e.offerType
                            })
                        }, [d.eligibleOffers]),
                        x = null != w,
                        P = (0, e3.useMemo)(function() {
                            var e, t = null == w || null == (e = w.freeTrialOffer) ? void 0 : e.estimatedTrialEndDate;
                            return t ? new Date(t).toLocaleDateString(void 0, {
                                year: "numeric",
                                month: "long",
                                day: "numeric"
                            }) : ""
                        }, [w]),
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
                        j = l ? c("Description.EntrypointDisabled") : rE(c, x ? "Description.SubscriptionFreeTrialLegal" : "Description.SubscriptionLegal", I, x ? {
                            date: P
                        } : void 0),
                        E = (0, e3.useRef)(!1);
                    (0, e3.useEffect)(function() {
                        if (!E.current && u) {
                            E.current = !0;
                            var e = x ? re.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : re.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                            re.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(re.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, re.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, re.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, e, u ? {
                                paymentSessionId: u
                            } : {}), at(ae.PURCHASE_VIEW_SHOWN, {
                                variant: f ? "multi" : "single",
                                tierCount: String(a.length),
                                isFreeTrial: String(x)
                            })
                        }
                    }, [u, x, f, a.length]);
                    var T = i.isAndroidApp || i.isIosApp,
                        N = ap((0, e3.useState)(null), 2),
                        A = N[0],
                        C = N[1],
                        D = (0, e3.useCallback)(function() {
                            var e = x ? re.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : re.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                            re.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(re.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, re.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, re.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, e, u ? {
                                paymentSessionId: u
                            } : {})
                        }, [x, u]),
                        R = c(x ? "Action.TryItForFree" : "Action.Subscribe"),
                        k = {
                            productId: v,
                            productType: g,
                            deviceMeta: i,
                            isDisabled: l,
                            paymentSessionId: u,
                            trackSubscriptionButtonClick: D,
                            onSubscribeClick: T ? s : void 0
                        },
                        _ = function() {
                            l || (at(ae.PURCHASE_VIEW_OPEN_SHEET_CLICK), y(!0))
                        },
                        M = function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "Large";
                            return (0, S.jsx)(tk, {
                                className: e,
                                "data-testid": "purchase-open-sheet-button",
                                isDisabled: l,
                                size: t,
                                variant: "Emphasis",
                                onClick: _,
                                children: R
                            })
                        },
                        U = rE(c, "Label.PlusLandingPage.Subtitle.V3", [{
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
                            children: [(0, S.jsx)(tQ, {}), (0, S.jsxs)("div", {
                                className: "width-full gap-y-medium padding-b-[env(safe-area-inset-bottom\\,0px)] padding-x-xxlarge flex flex-col items-stretch",
                                children: [f ? M("min-width-0 width-full") : (0, S.jsx)(rN, af(ad({}, k), {
                                    className: "min-width-0 width-full",
                                    size: "Medium",
                                    children: R
                                })), (0, S.jsx)("p", {
                                    className: "text-caption-small content-muted margin-bottom-[24px] large:margin-bottom-none padding-x-xsmall text-align-x-start",
                                    children: j
                                })]
                            })]
                        });
                    return (0, S.jsxs)(e3.Fragment, {
                        children: [(0, S.jsx)(tJ, {}), (0, S.jsx)("div", {
                            className: "width-full min-width-0 large:items-center flex flex-col items-start",
                            children: (0, S.jsxs)("div", {
                                className: "margin-top-[48px] width-full min-width-0 content-emphasis large:max-width-[730px] large:gap-y-[32px] large:self-auto large:padding-x-xlarge flex flex-col gap-y-[32px] self-stretch",
                                children: [am.enabled && (0, S.jsx)("div", {
                                    className: "width-full min-width-0 padding-x-xxlarge large:padding-x-none",
                                    children: (0, S.jsx)(rA, {
                                        body: c("Description.BannerBodyArrivedPurchase", {
                                            date: h
                                        }),
                                        title: c("Description.BannerTitleArrivedPurchase"),
                                        onItemDetailsClick: function() {
                                            ac(al).catch(function() {})
                                        }
                                    })
                                }), (0, S.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge text-align-x-start large:gap-y-[24px] large:items-center large:padding-x-none large:text-align-x-center flex flex-col items-start",
                                    children: [(0, S.jsxs)("div", {
                                        className: "gap-y-xsmall large:items-center flex flex-col items-start",
                                        children: [(0, S.jsx)(rC, {
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
                                        }) : (0, S.jsx)(rk, {
                                            eligibleOffers: d.eligibleOffers,
                                            periodType: d.periodType,
                                            price: d.localizedPrice
                                        }), (0, S.jsx)("div", {
                                            className: "width-full gap-y-medium padding-t-none large:margin-x-auto large:margin-top-[24px] large:flex large:max-width-[min(440px,100%)] large:width-full large:flex-col large:items-center hidden items-start",
                                            children: (0, S.jsx)("div", {
                                                className: "width-full gap-x-small flex shrink-0 flex-row items-start justify-center",
                                                children: f ? M("width-full large:width-[230px] shrink-0", "Medium") : (0, S.jsx)(rN, af(ad({}, k), {
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
                                        children: (0, S.jsx)(t$, {
                                            featureConfig: tZ(d),
                                            periodType: d.periodType,
                                            onTileClick: function(e, t) {
                                                C({
                                                    primary: e,
                                                    secondary: t
                                                })
                                            }
                                        })
                                    }), (0, S.jsx)("p", {
                                        className: "text-caption-small content-muted padding-x-xsmall text-align-x-start large:block large:padding-x-none hidden",
                                        "data-testid": "purchase-legal-footer",
                                        children: j
                                    })]
                                })]
                            })
                        }), L, (0, S.jsx)(is, {
                            body: null != (n = null == A ? void 0 : A.secondary) ? n : "",
                            open: null != A,
                            title: null != (o = null == A ? void 0 : A.primary) ? o : "",
                            onOpenChange: function(e) {
                                e || C(null)
                            }
                        }), f && (0, S.jsx)(ai, {
                            deviceMeta: i,
                            isEntrypointDisabled: l,
                            isOpen: m,
                            paymentSessionId: u,
                            products: a,
                            onMobilePurchaseInitiated: s,
                            onOpenChange: y
                        })]
                    })
                },
                ah = function(e) {
                    var t = e.title,
                        r = e.body;
                    return (0, S.jsxs)("div", {
                        className: "bg-shift-200 radius-medium padding-medium gap-medium width-full flex items-center",
                        children: [(0, S.jsx)("div", {
                            className: "radius-medium size-[50px] shrink-0 flex items-center justify-center",
                            children: (0, S.jsx)(tr, {
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

            function ab(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var av = function(e, t) {
                return (av = Object.setPrototypeOf || ab({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function ag(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function r() {
                    this.constructor = e
                }
                av(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
            }

            function aw(e, t, r, n) {
                return new(r || (r = Promise))(function(o, i) {
                    function a(e) {
                        try {
                            s(n.next(e))
                        } catch (e) {
                            i(e)
                        }
                    }

                    function l(e) {
                        try {
                            s(n.throw(e))
                        } catch (e) {
                            i(e)
                        }
                    }

                    function s(e) {
                        var t;
                        e.done ? o(e.value) : (ab(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, l)
                    }
                    s((n = n.apply(e, t || [])).next())
                })
            }

            function ax(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(s) {
                        var c = [l, s];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        i.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && i.label < o[1]) {
                                        i.label = o[1], o = c;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(c);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            c = t.call(e, i)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = o = 0
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

            function aS(e) {
                var t;
                return null == (t = e) ? t : {
                    periodIndex: t.periodIndex,
                    discountPercent: t.discountPercent
                }
            }
            var aO = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return ag(t, e), t.prototype.robloxPlusGetRobloxPlusUserBenefitsRaw = function(e) {
                        return aw(this, void 0, void 0, function() {
                            var t, r;
                            return ax(this, function(n) {
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
                        return aw(this, void 0, void 0, function() {
                            return ax(this, function(t) {
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
                aP = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return ag(t, e), t.prototype.robloxSubscriptionMetadataGetRobloxSubscriptionMetadataRaw = function(e, t) {
                        return aw(this, void 0, void 0, function() {
                            var r, n;
                            return ax(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        return r = {}, n = {}, void 0 !== e.robloxUniverseId && null !== e.robloxUniverseId && (n["Roblox-Universe-Id"] = String(e.robloxUniverseId)), [4, this.request({
                                            path: "/v1/metadata",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(o.sent(), function(e) {
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
                        return aw(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), ax(this, function(r) {
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
                aI = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return ag(t, e), t.prototype.robloxSubscriptionProductsGetRobloxSubscriptionProductRaw = function(e, t) {
                        return aw(this, void 0, void 0, function() {
                            var r, n;
                            return ax(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        if (null === e.robloxSubscriptionProductId || void 0 === e.robloxSubscriptionProductId) throw new eM("robloxSubscriptionProductId", "Required parameter requestParameters.robloxSubscriptionProductId was null or undefined when calling robloxSubscriptionProductsGetRobloxSubscriptionProduct.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/products/{robloxSubscriptionProductId}".replace("{".concat("robloxSubscriptionProductId", "}"), encodeURIComponent(String(e.robloxSubscriptionProductId))),
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(o.sent(), function(e) {
                                            var t, r, n, o;
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
                                                        virtualTransactionDiscounts: null === n.virtualTransactionDiscounts ? null : n.virtualTransactionDiscounts.map(aS),
                                                        isRobuxTransferEnabled: n.isRobuxTransferEnabled,
                                                        isTradingEnabled: n.isTradingEnabled,
                                                        isUgcPublishingEnabled: n.isUgcPublishingEnabled,
                                                        privateServerDiscounts: null === n.privateServerDiscounts ? null : n.privateServerDiscounts.map(aS),
                                                        currencySubscriptionConfig: null == (o = n.currencySubscriptionConfig) ? o : {
                                                            currencyType: o.currencyType,
                                                            entitledAmountMicros: o.entitledAmountMicros
                                                        }
                                                    }
                                                }
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.robloxSubscriptionProductsGetRobloxSubscriptionProduct = function(e, t) {
                        return aw(this, void 0, void 0, function() {
                            return ax(this, function(r) {
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
                aj = function(e, t) {
                    return new Date(Date.UTC(e, t + 1, 0)).getUTCDate()
                },
                aE = function(e, t) {
                    var r = e.getUTCFullYear(),
                        n = e.getUTCMonth(),
                        o = e.getUTCDate(),
                        i = n + t,
                        a = r + Math.floor(i / 12),
                        l = (i % 12 + 12) % 12,
                        s = Math.min(o, aj(a, l));
                    return new Date(Date.UTC(a, l, s, e.getUTCHours(), e.getUTCMinutes(), e.getUTCSeconds(), e.getUTCMilliseconds()))
                },
                aT = function(e, t) {
                    var r = e.getUTCFullYear() + t,
                        n = e.getUTCMonth(),
                        o = Math.min(e.getUTCDate(), aj(r, n));
                    return new Date(Date.UTC(r, n, o, e.getUTCHours(), e.getUTCMinutes(), e.getUTCSeconds(), e.getUTCMilliseconds()))
                },
                aN = function(e, t, r) {
                    var n = new Date(e);
                    switch (r) {
                        case "Week":
                            return n.setUTCDate(n.getUTCDate() + 7 * t), n;
                        case "Month":
                            return aE(n, t);
                        case "Year":
                            return aT(n, t);
                        default:
                            throw Error("Unsupported period type: ".concat(r))
                    }
                },
                aA = function(e, t, r, n) {
                    for (var o = 0; o < 1e3 && !(n < aN(e, o + 1, t).getTime());) o += 1;
                    return r && r < n && o > 0 && (o -= 1), o
                },
                aC = function(e) {
                    var t = e.currentDiscountPercent,
                        r = e.nextDiscount,
                        n = e.activationTimestampMs,
                        o = e.isCancelled,
                        i = e.periodType,
                        a = (0, O.useTranslation)(),
                        l = a.translate,
                        s = a.intl,
                        c = (0, e3.useMemo)(function() {
                            if (!r) return null;
                            var e = Date.now(),
                                t = aN(n, r.periodIndex, i).getTime();
                            return {
                                discountPercent: r.discountPercent,
                                targetDateDaysUntil: Math.max(0, Math.ceil((t - e) / 864e5)),
                                targetDateProgressPercent: Math.min(Math.max(0, (e - n) / (t - n) * 100), 100)
                            }
                        }, [r, n, i]);
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
                                children: o ? l(u ? "Description.Benefit.DiscountStaySubscribedToKeep" : "Description.Benefit.DiscountStaySubscribedToGet") : u ? l("Description.Benefit.DiscountMaxReached") : l("Description.Benefit.DiscountCurrent", {
                                    discountPercent: s.n(.01 * t, {
                                        style: "percent"
                                    })
                                })
                            }), (0, S.jsx)("span", {
                                className: "text-heading-large content-emphasis",
                                children: u ? l(o ? "Description.Benefit.DiscountAllPurchases" : "Description.Benefit.DiscountUnlocked", {
                                    discountPercent: s.n(.01 * t, {
                                        style: "percent"
                                    })
                                }) : l("Description.Benefit.DiscountOffInDays", {
                                    discountPercent: s.n(.01 * c.discountPercent, {
                                        style: "percent"
                                    }),
                                    dayCount: c.targetDateDaysUntil
                                })
                            })]
                        }), (0, S.jsx)("div", {
                            className: "shrink-0",
                            children: u ? f((0, S.jsx)(tr, {
                                name: "icon-regular-circle-check",
                                size: "XLarge"
                            })) : d && !o ? (0, S.jsx)(t7, {
                                ariaLabel: l("Label.Progress"),
                                className: "[--fui-future-alpha-color-system-progress:var(--color-content-emphasis)]",
                                size: "Large",
                                value: c.targetDateProgressPercent,
                                variant: "Determinate"
                            }) : f((0, S.jsx)(tr, {
                                name: "icon-regular-calendar",
                                size: "XLarge"
                            }))
                        })]
                    })
                };

            function aD(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var aR = function(e) {
                    var t, r = e.robloxSubscriptionProduct,
                        n = (0, O.useTranslation)().translate,
                        o = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, e3.useState)(!1)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return o
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return aD(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aD(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        i = o[0],
                        a = o[1],
                        l = (0, e3.useCallback)(function() {
                            a(!0)
                        }, []),
                        s = (0, e3.useMemo)(function() {
                            var e = new URL("/my/account#!/subscriptions", window.location.origin);
                            return e.searchParams.append("id", r.productKey.id), e.searchParams.append("type", r.productKey.type), e.toString()
                        }, [r.productKey.id, r.productKey.type]);
                    return (0, S.jsx)(tk, {
                        as: "a",
                        href: s,
                        isLoading: i,
                        variant: "Standard",
                        onClick: l,
                        children: n("Action.Manage")
                    })
                },
                ak = function(e) {
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
                a_ = function(e) {
                    var t = e.currentDiscountPercent,
                        r = e.savedRobux,
                        n = e.itemsBoughtWithDiscountCount,
                        o = e.privateServersCreatedCount,
                        i = e.robuxSentToFriendsCount,
                        a = (0, O.useTranslation)(),
                        l = a.translate,
                        s = a.intl;
                    return (0, S.jsxs)("div", {
                        className: "gap-y-large flex flex-col",
                        children: [(0, S.jsxs)("div", {
                            className: "gap-x-xsmall text-heading-small content-emphasis wrap flex items-center",
                            children: [(0, S.jsx)("span", {
                                children: l("Heading.SavingsYouveSaved")
                            }), (0, S.jsx)(tr, {
                                name: "icon-regular-robux",
                                size: "Medium"
                            }), (0, S.jsx)("span", {
                                children: void 0 === r ? "—" : s.n(r)
                            }), (0, S.jsx)("span", {
                                children: l("Heading.SavingsWithPlus")
                            })]
                        }), (0, S.jsxs)("div", {
                            className: "gap-y-small flex flex-col",
                            children: [(0, S.jsxs)("div", {
                                className: "gap-x-small flex",
                                children: [(0, S.jsx)(ak, {
                                    title: l("Label.Savings.InGameItems"),
                                    value: l("Label.Savings.PercentOff", {
                                        discountPercent: s.n(.01 * t, {
                                            style: "percent"
                                        })
                                    })
                                }), (0, S.jsx)(ak, {
                                    title: l("Label.Savings.ItemsBought"),
                                    value: void 0 === n ? "—" : s.n(n)
                                })]
                            }), (0, S.jsxs)("div", {
                                className: "gap-x-small flex",
                                children: [(0, S.jsx)(ak, {
                                    title: l("Label.Savings.PrivateServers"),
                                    value: void 0 === o ? "—" : s.n(o)
                                }), (0, S.jsx)(ak, {
                                    title: l("Label.Savings.RobuxSent"),
                                    value: (0, S.jsxs)("span", {
                                        className: "gap-x-xsmall flex items-center",
                                        children: [(0, S.jsx)(tr, {
                                            name: "icon-regular-robux",
                                            size: "Medium"
                                        }), void 0 === i ? "—" : s.n(i)]
                                    })
                                })]
                            }), (0, S.jsx)("span", {
                                className: "text-caption-medium content-muted",
                                children: l("Description.SavingsDataDelay")
                            })]
                        })]
                    })
                };

            function aM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aU(e) {
                if (Array.isArray(e)) return e
            }

            function aL() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function aB(e, t) {
                if (e) {
                    if ("string" == typeof e) return aM(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aM(e, t)
                }
            }
            var aF = {
                    Neutral: "bg-shift-200",
                    Standard: "bg-shift-200",
                    Contrast: "bg-system-contrast",
                    Emphasis: "bg-system-emphasis",
                    Success: "bg-[rgb(from_var(--color-system-success)_r_g_b_/_0.2)]",
                    Warning: "bg-[rgb(from_var(--color-system-warning)_r_g_b_/_0.2)]",
                    Alert: "bg-[rgb(from_var(--color-system-alert)_r_g_b_/_0.2)]",
                    OverMedia: "bg-over-media-0"
                },
                aG = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-emphasis",
                    Warning: "content-emphasis",
                    Alert: "content-emphasis",
                    OverMedia: "content-emphasis"
                },
                az = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-system-success",
                    Warning: "content-system-warning",
                    Alert: "content-system-alert",
                    OverMedia: "content-emphasis"
                },
                aq = {
                    Neutral: "stroke-none",
                    Standard: "stroke-none",
                    Contrast: "stroke-none",
                    Emphasis: "stroke-none",
                    Success: "stroke-none",
                    Warning: "stroke-none",
                    Alert: "stroke-none",
                    OverMedia: "stroke-none"
                },
                aK = {
                    Small: "height-600",
                    XSmall: "height-400"
                },
                aV = {
                    Small: "padding-x-small",
                    XSmall: "padding-x-xsmall"
                },
                aW = {
                    Small: "width-600",
                    XSmall: "width-400"
                },
                aH = {
                    Small: "text-label-small",
                    XSmall: "text-caption-small"
                },
                aX = {
                    Small: "padding-y-xsmall",
                    XSmall: "padding-y-none"
                },
                a$ = {
                    Small: "XSmall",
                    XSmall: "XSmall"
                },
                aY = {
                    Pill: "radius-circle",
                    Box: "radius-small"
                },
                aJ = e8().forwardRef(function(e, t) {
                    var r, n, o, i = aU(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || aB(r) || aL(),
                        a = i[0],
                        l = i.slice(1),
                        s = a.className,
                        c = a.label,
                        u = a.variant,
                        d = void 0 === u ? "Standard" : u,
                        f = a.icon,
                        p = a.iconPosition,
                        m = void 0 === p ? "Leading" : p,
                        y = a.size,
                        h = void 0 === y ? "Small" : y,
                        b = a.shape,
                        v = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, i = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                return i
                            }
                            if (i = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        i = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                            return i
                        }(a, ["className", "label", "variant", "icon", "iconPosition", "size", "shape"]),
                        g = (aU(l) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); i = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return o
                            }
                        }(l) || aB(l, 1) || aL())[0],
                        w = f && !c,
                        x = "padding-x-xxsmall";
                    f && (x = "Leading" === m ? "padding-right-xxsmall" : "padding-left-xxsmall");
                    var S = f && e8().createElement(tr, {
                        name: f,
                        size: a$[h],
                        className: az[d]
                    });
                    return e8().createElement("div", (n = function(e) {
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
                        ref: g
                    }, v), o = o = {
                        className: e6("foundation-web-badge flex items-center select-none gap-[var(--size-150)]", aY[void 0 === b ? "Pill" : b], aK[h], w ? [aW[h], "justify-center"] : ["width-[fit-content]", aV[h]], aF[d], aG[d], aq[d], s)
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(o)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                    }), n), "Leading" === m && S, c && e8().createElement("span", {
                        className: e6("text-no-wrap text-truncate-split", aH[h], aX[h], x, aG[d])
                    }, c), "Trailing" === m && S)
                });
            aJ.displayName = "Badge";
            var aQ = function(e) {
                    var t = e.activationTimestampMs,
                        r = e.expirationTimestampMs,
                        n = e.nextRenewalTimestampMs,
                        o = e.hasFreeTrial,
                        i = (0, O.useTranslation)(),
                        a = i.translate,
                        l = i.intl,
                        s = (0, e3.useMemo)(function() {
                            return l.getDateTimeFormatter()
                        }, [l]),
                        c = null === n || 0 === n;
                    return (0, S.jsxs)("div", {
                        className: "gap-x-small flex items-center",
                        children: [(0, S.jsx)("span", {
                            className: "text-body-medium content-emphasis",
                            children: c ? a("Description.ActiveUntil", {
                                date: s.getCustomDateTime(r, {
                                    month: "long",
                                    day: "numeric",
                                    year: "numeric"
                                })
                            }) : a("Description.SubscribedSince", {
                                date: s.getCustomDateTime(t, {
                                    month: "long",
                                    day: "numeric",
                                    year: "numeric"
                                })
                            })
                        }), c ? (0, S.jsx)(aJ, {
                            label: a("Label.Status.AutoRenewOff"),
                            variant: "Warning"
                        }) : o ? (0, S.jsx)(aJ, {
                            label: a("Label.Status.Freetrial"),
                            variant: "Standard"
                        }) : (0, S.jsx)(aJ, {
                            label: a("Label.Status.Active"),
                            variant: "Standard"
                        })]
                    })
                },
                aZ = function(e) {
                    var t = e.featureConfig,
                        r = (0, O.useTranslation)().translate;
                    return (0, S.jsxs)("div", {
                        className: "gap-y-medium flex flex-col",
                        children: [(0, S.jsx)("span", {
                            className: "text-heading-medium",
                            children: r("Label.ExploreMoreBenefits")
                        }), (0, S.jsxs)("div", {
                            className: "foundation-web-list-item-container",
                            children: [t.isTradingEnabled && (0, S.jsx)(tV, {
                                description: r("Description.Benefit.TradeResellItemsSubtitle"),
                                divider: "None",
                                isContained: !0,
                                leading: (0, S.jsx)(tr, {
                                    name: "icon-regular-hand-two-arrows-horizontal",
                                    size: "Medium"
                                }),
                                size: "Medium",
                                title: r("Description.Benefit.TradeResellItems"),
                                trailing: (0, S.jsx)(tr, {
                                    name: "icon-regular-chevron-small-right"
                                }),
                                onSelect: function() {
                                    window.location.href = "https://help.roblox.com/hc/articles/203313310-Trading-System"
                                }
                            }), t.isUgcPublishingEnabled && (0, S.jsx)(tV, {
                                description: r("Description.Benefit.PublishItemsSubtitle"),
                                divider: "None",
                                isContained: !0,
                                leading: (0, S.jsx)(tr, {
                                    name: "icon-regular-arrow-up-from-landscape-rectangle",
                                    size: "Medium"
                                }),
                                size: "Medium",
                                title: r("Description.Benefit.PublishItems"),
                                trailing: (0, S.jsx)(tr, {
                                    name: "icon-regular-chevron-small-right"
                                }),
                                onSelect: function() {
                                    window.location.href = "https://help.roblox.com/hc/articles/203313180-Creating-and-Selling-Avatar-Items"
                                }
                            })]
                        })]
                    })
                },
                a0 = window.Roblox["core-scripts"].meta.user;

            function a1(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var a2 = function(e, t) {
                return (a2 = Object.setPrototypeOf || a1({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function a4(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function r() {
                    this.constructor = e
                }
                a2(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
            }

            function a3(e, t, r, n) {
                return new(r || (r = Promise))(function(o, i) {
                    function a(e) {
                        try {
                            s(n.next(e))
                        } catch (e) {
                            i(e)
                        }
                    }

                    function l(e) {
                        try {
                            s(n.throw(e))
                        } catch (e) {
                            i(e)
                        }
                    }

                    function s(e) {
                        var t;
                        e.done ? o(e.value) : (a1(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, l)
                    }
                    s((n = n.apply(e, t || [])).next())
                })
            }

            function a8(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(s) {
                        var c = [l, s];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        i.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && i.label < o[1]) {
                                        i.label = o[1], o = c;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(c);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            c = t.call(e, i)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function a6(e) {
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

            function a5(e) {
                var t;
                return null == (t = e) ? t : {
                    name: eU(t, "name") ? t.name : void 0,
                    displayName: eU(t, "displayName") ? t.displayName : void 0,
                    categoryType: eU(t, "categoryType") ? t.categoryType : void 0,
                    items: eU(t, "items") ? t.items.map(a6) : void 0
                }
            }
            "function" == typeof SuppressedError && SuppressedError;

            function a7(e, t) {
                return null == e ? e : {
                    categories: eU(e, "categories") ? e.categories.map(a5) : void 0
                }
            }

            function a9(e) {
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

            function le(e) {
                var t;
                return null == (t = e) ? t : {
                    id: eU(t, "id") ? t.id : void 0,
                    name: eU(t, "name") ? t.name : void 0,
                    type: eU(t, "type") ? t.type : void 0,
                    instanceId: eU(t, "instanceId") ? t.instanceId : void 0
                }
            }

            function lt(e) {
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
                a4(t, e), t.prototype.v1PackagesPackageIdAssetsGetRaw = function(e, t) {
                    return a3(this, void 0, void 0, function() {
                        var r, n;
                        return a8(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    if (null === e.packageID || void 0 === e.packageID) throw new eM("packageID", "Required parameter requestParameters.packageID was null or undefined when calling v1PackagesPackageIdAssetsGet.");
                                    return r = {}, n = {}, [4, this.request({
                                        path: "/v1/packages/{packageId}/assets".replace("{".concat("packageID", "}"), encodeURIComponent(String(e.packageID))),
                                        schemaPath: "/v1/packages/{packageId}/assets",
                                        method: "GET",
                                        headers: n,
                                        query: r
                                    }, t)];
                                case 1:
                                    return [2, new eL(o.sent(), function(e) {
                                        return null == e ? e : {
                                            assetIds: eU(e, "assetIds") ? e.assetIds : void 0
                                        }
                                    })]
                            }
                        })
                    })
                }, t.prototype.v1PackagesPackageIdAssetsGet = function(e, t) {
                    return a3(this, void 0, void 0, function() {
                        return a8(this, function(r) {
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
                a4(t, e), t.prototype.v1CollectionsItemsItemTypeItemTargetIdDeleteRaw = function(e, t) {
                    return a3(this, void 0, void 0, function() {
                        var r, n;
                        return a8(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    if (null === e.itemType || void 0 === e.itemType) throw new eM("itemType", "Required parameter requestParameters.itemType was null or undefined when calling v1CollectionsItemsItemTypeItemTargetIdDelete.");
                                    if (null === e.itemTargetId || void 0 === e.itemTargetId) throw new eM("itemTargetId", "Required parameter requestParameters.itemTargetId was null or undefined when calling v1CollectionsItemsItemTypeItemTargetIdDelete.");
                                    return r = {}, n = {}, [4, this.request({
                                        path: "/v1/collections/items/{itemType}/{itemTargetId}".replace("{".concat("itemType", "}"), encodeURIComponent(String(e.itemType))).replace("{".concat("itemTargetId", "}"), encodeURIComponent(String(e.itemTargetId))),
                                        schemaPath: "/v1/collections/items/{itemType}/{itemTargetId}",
                                        method: "DELETE",
                                        headers: n,
                                        query: r
                                    }, t)];
                                case 1:
                                    return [2, new eL(o.sent())]
                            }
                        })
                    })
                }, t.prototype.v1CollectionsItemsItemTypeItemTargetIdDelete = function(e, t) {
                    return a3(this, void 0, void 0, function() {
                        return a8(this, function(r) {
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
                    return a3(this, void 0, void 0, function() {
                        var r, n;
                        return a8(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    if (null === e.itemType || void 0 === e.itemType) throw new eM("itemType", "Required parameter requestParameters.itemType was null or undefined when calling v1CollectionsItemsItemTypeItemTargetIdPost.");
                                    if (null === e.itemTargetId || void 0 === e.itemTargetId) throw new eM("itemTargetId", "Required parameter requestParameters.itemTargetId was null or undefined when calling v1CollectionsItemsItemTypeItemTargetIdPost.");
                                    return r = {}, n = {}, [4, this.request({
                                        path: "/v1/collections/items/{itemType}/{itemTargetId}".replace("{".concat("itemType", "}"), encodeURIComponent(String(e.itemType))).replace("{".concat("itemTargetId", "}"), encodeURIComponent(String(e.itemTargetId))),
                                        schemaPath: "/v1/collections/items/{itemType}/{itemTargetId}",
                                        method: "POST",
                                        headers: n,
                                        query: r
                                    }, t)];
                                case 1:
                                    return [2, new eL(o.sent())]
                            }
                        })
                    })
                }, t.prototype.v1CollectionsItemsItemTypeItemTargetIdPost = function(e, t) {
                    return a3(this, void 0, void 0, function() {
                        return a8(this, function(r) {
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
            var lr = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return a4(t, e), t.prototype.v1UsersUserIdAssetsCollectiblesGetRaw = function(e, t) {
                        return a3(this, void 0, void 0, function() {
                            var r, n;
                            return a8(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new eM("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdAssetsCollectiblesGet.");
                                        return r = {}, void 0 !== e.assetType && (r.assetType = e.assetType), void 0 !== e.limit && (r.limit = e.limit), void 0 !== e.cursor && (r.cursor = e.cursor), void 0 !== e.sortOrder && (r.sortOrder = e.sortOrder), n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/assets/collectibles".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                            schemaPath: "/v1/users/{userId}/assets/collectibles",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(o.sent(), function(e) {
                                            return null == e ? e : {
                                                previousPageCursor: eU(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                                nextPageCursor: eU(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                                data: eU(e, "data") ? e.data.map(a9) : void 0
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdAssetsCollectiblesGet = function(e, t) {
                        return a3(this, void 0, void 0, function() {
                            return a8(this, function(r) {
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
                        return a3(this, void 0, void 0, function() {
                            var r, n;
                            return a8(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new eM("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdCanViewInventoryGet.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/can-view-inventory".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                            schemaPath: "/v1/users/{userId}/can-view-inventory",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(o.sent(), function(e) {
                                            return null == e ? e : {
                                                canView: eU(e, "canView") ? e.canView : void 0
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdCanViewInventoryGet = function(e, t) {
                        return a3(this, void 0, void 0, function() {
                            return a8(this, function(r) {
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
                        return a3(this, void 0, void 0, function() {
                            var r, n;
                            return a8(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new eM("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdCategoriesFavoritesGet.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/categories/favorites".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                            schemaPath: "/v1/users/{userId}/categories/favorites",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(o.sent(), function(e) {
                                            return a7(e)
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdCategoriesFavoritesGet = function(e, t) {
                        return a3(this, void 0, void 0, function() {
                            return a8(this, function(r) {
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
                        return a3(this, void 0, void 0, function() {
                            var r, n;
                            return a8(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new eM("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdCategoriesGet.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/categories".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                            schemaPath: "/v1/users/{userId}/categories",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(o.sent(), function(e) {
                                            return a7(e)
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdCategoriesGet = function(e, t) {
                        return a3(this, void 0, void 0, function() {
                            return a8(this, function(r) {
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
                        return a3(this, void 0, void 0, function() {
                            var r, n;
                            return a8(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new eM("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdGet.");
                                        if (null === e.itemType || void 0 === e.itemType) throw new eM("itemType", "Required parameter requestParameters.itemType was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdGet.");
                                        if (null === e.itemTargetId || void 0 === e.itemTargetId) throw new eM("itemTargetId", "Required parameter requestParameters.itemTargetId was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdGet.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/items/{itemType}/{itemTargetId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("itemType", "}"), encodeURIComponent(String(e.itemType))).replace("{".concat("itemTargetId", "}"), encodeURIComponent(String(e.itemTargetId))),
                                            schemaPath: "/v1/users/{userId}/items/{itemType}/{itemTargetId}",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eL(o.sent(), function(e) {
                                            return null == e ? e : {
                                                previousPageCursor: eU(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                                nextPageCursor: eU(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                                data: eU(e, "data") ? e.data.map(le) : void 0
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdItemsItemTypeItemTargetIdGet = function(e, t) {
                        return a3(this, void 0, void 0, function() {
                            return a8(this, function(r) {
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
                        return a3(this, void 0, void 0, function() {
                            var r, n, o;
                            return a8(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new eM("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet.");
                                        if (null === e.itemType || void 0 === e.itemType) throw new eM("itemType", "Required parameter requestParameters.itemType was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet.");
                                        if (null === e.itemTargetId || void 0 === e.itemTargetId) throw new eM("itemTargetId", "Required parameter requestParameters.itemTargetId was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/items/{itemType}/{itemTargetId}/is-owned".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("itemType", "}"), encodeURIComponent(String(e.itemType))).replace("{".concat("itemTargetId", "}"), encodeURIComponent(String(e.itemTargetId))),
                                            schemaPath: "/v1/users/{userId}/items/{itemType}/{itemTargetId}/is-owned",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return o = i.sent(), this.isJsonMime(o.headers.get("content-type")) ? [2, new eL(o)] : [2, new eB(o)]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet = function(e, t) {
                        return a3(this, void 0, void 0, function() {
                            return a8(this, function(r) {
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
                ln = eR;

            function lo() {
                return null !== ln && ln.apply(this, arguments) || this
            }
            a4(lo, ln), lo.prototype.v1UsersUserIdPlacesInventoryGetRaw = function(e, t) {
                return a3(this, void 0, void 0, function() {
                    var r, n;
                    return a8(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new eM("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdPlacesInventoryGet.");
                                if (null === e.placesTab || void 0 === e.placesTab) throw new eM("placesTab", "Required parameter requestParameters.placesTab was null or undefined when calling v1UsersUserIdPlacesInventoryGet.");
                                if (null === e.itemsPerPage || void 0 === e.itemsPerPage) throw new eM("itemsPerPage", "Required parameter requestParameters.itemsPerPage was null or undefined when calling v1UsersUserIdPlacesInventoryGet.");
                                if (null === e.cursor || void 0 === e.cursor) throw new eM("cursor", "Required parameter requestParameters.cursor was null or undefined when calling v1UsersUserIdPlacesInventoryGet.");
                                return r = {}, void 0 !== e.placesTab && (r.placesTab = e.placesTab), void 0 !== e.itemsPerPage && (r.itemsPerPage = e.itemsPerPage), void 0 !== e.cursor && (r.cursor = e.cursor), n = {}, [4, this.request({
                                    path: "/v1/users/{userId}/places/inventory".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/places/inventory",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return [2, new eL(o.sent(), function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: eU(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: eU(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: eU(e, "data") ? e.data.map(lt) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, lo.prototype.v1UsersUserIdPlacesInventoryGet = function(e, t) {
                return a3(this, void 0, void 0, function() {
                    return a8(this, function(r) {
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
            var li = function(e, t) {
                return "https://apis.".concat(e, "/").concat(t)
            };

            function la(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var ll = function(e) {
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
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 3 !== o.length); i = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return o
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return la(e, 3);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return la(e, 3)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        o = n[0],
                        i = n[1],
                        a = n[2];
                    if (null != o && null != i) {
                        var l = "".concat(i, ".").concat(o);
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
                ls = ll(window.location.hostname),
                lc = new lr(new eF({
                    robloxSiteDomain: ls.rootDomain,
                    basePath: (g = ls.rootDomain, "https://".concat("inventory", ".").concat(g)),
                    credentials: "include"
                })),
                lu = function(e) {
                    if (e === aa.ItemType.Asset) return 0;
                    throw Error("Unsupported gift item type: ".concat(e))
                },
                ld = function() {
                    var e = (0, a0.userId)();
                    return (0, E.useQuery)({
                        queryKey: ["owns-gift-item", e, al.itemId, al.itemType],
                        queryFn: function() {
                            if (null == e) throw Error("Cannot check gift item ownership without a user id");
                            return lc.v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet({
                                userId: e,
                                itemType: lu(al.itemType),
                                itemTargetId: al.itemId
                            })
                        },
                        enabled: null != e
                    })
                },
                lf = function(e) {
                    var t, r, n = e.robloxSubscriptionProduct,
                        o = e.robloxSubscriptionMembership,
                        i = e.robloxPlusUserBenefits,
                        a = e.isFaeFreeTrial,
                        l = (0, O.useTranslation)().translate,
                        s = null == i ? void 0 : i.robuxSavedWithPlus,
                        c = null == i ? void 0 : i.itemsBoughtWithPlusDiscount,
                        u = null == i ? void 0 : i.privateServersCreatedForFree,
                        d = null == i ? void 0 : i.robuxSentToFriends,
                        f = (0, e3.useMemo)(function() {
                            return o.activeOffers.some(function(e) {
                                return "FreeTrial" === e.offerType
                            })
                        }, [o.activeOffers]),
                        p = (0, e3.useMemo)(function() {
                            return aA(o.activationTimestampMs, o.periodType, o.nextRenewalTimestampMs, Date.now())
                        }, [o.activationTimestampMs, o.nextRenewalTimestampMs, o.periodType]),
                        m = (0, e3.useMemo)(function() {
                            var e, t, r, i, a, l, s, c, u, d, f;
                            return t = tZ(n), r = null == (e = o.productTypeMembershipDetails.robloxSubscriptionMembershipDetails) ? void 0 : e.features.virtualTransactionDiscountTierId, d = t.virtualTransactionDiscounts, f = null != (i = null == (l = r ? null != (s = null != (c = null == d ? void 0 : d.find(function(e) {
                                return e.tierId === r
                            })) ? c : null == d ? void 0 : d.toSorted(function(e, t) {
                                return t.periodIndex - e.periodIndex
                            })[0]) ? s : null : null != (u = null == d ? void 0 : d.filter(function(e) {
                                return e.periodIndex <= p
                            }).toSorted(function(e, t) {
                                return t.periodIndex - e.periodIndex
                            })[0]) ? u : null) ? void 0 : l.periodIndex) ? i : p, {
                                current: l,
                                next: null != (a = null == d ? void 0 : d.filter(function(e) {
                                    return e.periodIndex > f
                                }).toSorted(function(e, t) {
                                    return e.periodIndex - t.periodIndex
                                })[0]) ? a : null
                            }
                        }, [n, o.productTypeMembershipDetails, p]),
                        y = null != (t = null == (r = m.current) ? void 0 : r.discountPercent) ? t : 0,
                        h = ld().data;
                    return (0, S.jsx)("div", {
                        className: "flex flex-col items-center",
                        children: (0, S.jsxs)("div", {
                            className: "margin-top-[48px] padding-x-xlarge content-emphasis gap-y-xxlarge width-full large:max-width-[730px] flex flex-col",
                            children: [!0 === h && (0, S.jsx)(rA, {
                                body: l("Description.BannerBodyUnboxed"),
                                equipText: l("Action.BannerEquip"),
                                title: l("Description.BannerTitleUnboxed"),
                                onEquip: function() {
                                    (0, aa.navigateToDeepLink)("roblox://navigation/avatar").catch(function() {})
                                },
                                onItemDetailsClick: function() {
                                    ac(al).catch(function() {})
                                }
                            }), a && (0, S.jsx)(ah, {
                                body: l("Subtext.FreeTrialBanner", {
                                    date: new Date(o.expirationTimestampMs).toLocaleDateString(void 0, {
                                        day: "2-digit",
                                        month: "short",
                                        year: "numeric"
                                    })
                                }),
                                title: l("Header.FreeTrialBannerTitle")
                            }), (0, S.jsxs)("div", {
                                className: "gap-y-small large:items-center flex flex-col",
                                children: [(0, S.jsx)(rC, {}), (0, S.jsx)(aQ, {
                                    activationTimestampMs: o.activationTimestampMs,
                                    expirationTimestampMs: o.expirationTimestampMs,
                                    hasFreeTrial: f,
                                    nextRenewalTimestampMs: o.nextRenewalTimestampMs
                                }), (0, S.jsx)(aC, {
                                    activationTimestampMs: o.activationTimestampMs,
                                    currentDiscountPercent: y,
                                    isCancelled: null === o.nextRenewalTimestampMs || 0 === o.nextRenewalTimestampMs,
                                    nextDiscount: m.next,
                                    periodType: o.periodType
                                })]
                            }), (0, S.jsxs)("div", {
                                className: "flex flex-col gap-y-[32px]",
                                children: [(0, S.jsx)(a_, {
                                    currentDiscountPercent: y,
                                    itemsBoughtWithDiscountCount: c,
                                    privateServersCreatedCount: u,
                                    robuxSentToFriendsCount: d,
                                    savedRobux: s
                                }), (0, S.jsx)(aZ, {
                                    featureConfig: tZ(n)
                                }), (0, S.jsx)(tY, {
                                    children: (0, S.jsx)("div", {
                                        className: "gap-y-medium flex flex-col",
                                        children: (0, S.jsx)(aR, {
                                            robloxSubscriptionProduct: n
                                        })
                                    })
                                })]
                            })]
                        })
                    })
                };

            function lp(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var lm = function(e) {
                    var t, r, n, o = e.deviceMeta,
                        i = e.robloxSubscriptionProduct,
                        a = e.onDismiss,
                        l = (0, O.useTranslation)().translate,
                        s = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, e3.useState)(null)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return o
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return lp(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lp(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        c = s[0],
                        u = s[1];
                    (0, e3.useEffect)(function() {
                        window.scrollTo({
                            top: 0,
                            behavior: "smooth"
                        })
                    }, []);
                    var d = !o.isInApp && (0, S.jsxs)("div", {
                        "aria-label": l("Action.OK"),
                        className: "bottom-dock padding-t-medium bg-surface-100 large:hidden width-full gap-y-medium flex flex-col",
                        "data-testid": "welcome-dismiss-dock",
                        role: "region",
                        children: [(0, S.jsx)(tQ, {}), (0, S.jsx)("div", {
                            className: "width-full gap-y-medium padding-bottom-[env(safe-area-inset-bottom\\,0px)] padding-x-xxlarge flex flex-col items-stretch",
                            children: (0, S.jsx)(tk, {
                                className: "min-width-0 width-full margin-bottom-[24px] large:margin-bottom-none",
                                size: "Large",
                                variant: "Emphasis",
                                onClick: a,
                                children: l("Action.OK")
                            })
                        })]
                    });
                    return (0, S.jsxs)(e3.Fragment, {
                        children: [(0, S.jsx)(tJ, {}), (0, S.jsx)("div", {
                            className: "width-full min-width-0 large:items-center flex flex-col items-start",
                            children: (0, S.jsxs)("div", {
                                className: "margin-top-[48px] width-full min-width-0 content-emphasis large:max-width-[730px] large:gap-y-[60px] large:self-auto large:padding-x-xlarge flex flex-col gap-y-[var(--size-1200)] self-stretch",
                                children: [(0, S.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge text-align-x-start large:gap-y-[24px] large:items-center large:padding-x-none large:text-align-x-center flex flex-col items-start",
                                    children: [(0, S.jsxs)("div", {
                                        className: "gap-y-xsmall large:items-center flex flex-col items-start",
                                        children: [(0, S.jsx)(tr, {
                                            className: "!size-1800 margin-bottom-medium",
                                            name: "icon-regular-roblox-plus"
                                        }), (0, S.jsx)("h1", {
                                            className: "text-heading-large",
                                            children: l("Title.Welcome", {
                                                productShort: l("Label.BlackbirdShort")
                                            })
                                        }), (0, S.jsx)("p", {
                                            className: "text-body-large content-default",
                                            children: l("Description.Welcome", {
                                                product: l("Label.Blackbird")
                                            })
                                        })]
                                    }), !o.isInApp && (0, S.jsx)("div", {
                                        className: "width-full gap-y-medium padding-t-none large:margin-x-auto large:margin-top-[12px] large:flex large:max-width-[min(440px,100%)] large:width-full large:flex-col large:items-center hidden items-start",
                                        "data-testid": "welcome-dismiss-inline",
                                        children: (0, S.jsx)("div", {
                                            className: "width-full gap-x-small flex shrink-0 flex-row items-start justify-center",
                                            children: (0, S.jsx)(tk, {
                                                className: "width-full large:width-[230px] shrink-0",
                                                size: "Medium",
                                                variant: "Emphasis",
                                                onClick: a,
                                                children: l("Action.OK")
                                            })
                                        })
                                    })]
                                }), (0, S.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge large:padding-x-none flex flex-col",
                                    children: [(0, S.jsx)("span", {
                                        className: "text-heading-small",
                                        children: l("Title.BenefitsUnlocked")
                                    }), (0, S.jsx)(t$, {
                                        featureConfig: tZ(i),
                                        overrideIconName: "icon-filled-check",
                                        periodType: i.periodType,
                                        onTileClick: function(e, t) {
                                            u({
                                                primary: e,
                                                secondary: t
                                            })
                                        }
                                    })]
                                })]
                            })
                        }), d, (0, S.jsx)(is, {
                            body: null != (r = null == c ? void 0 : c.secondary) ? r : "",
                            open: null != c,
                            title: null != (n = null == c ? void 0 : c.primary) ? n : "",
                            onOpenChange: function(e) {
                                e || u(null)
                            }
                        })]
                    })
                },
                ly = ll(window.location.hostname),
                lh = new eC({
                    robloxSiteDomain: ly.rootDomain,
                    basePath: li(ly.rootDomain, "roblox-subscriptions"),
                    credentials: "include"
                });
            new aP(lh);
            var lb = new aO(lh);
            new aI(lh);
            var lv = ll(window.location.hostname),
                lg = new e0(new eF({
                    robloxSiteDomain: lv.rootDomain,
                    basePath: li(lv.rootDomain, "subscriptions"),
                    credentials: "include"
                })),
                lw = function(e, t) {
                    var r = (0, e3.useRef)();
                    return t(e) && (r.current = e), r.current
                };

            function lx(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lS(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        s = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(s) : Promise.resolve(s).then(n, o)
            }

            function lO(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            lS(i, n, o, a, l, "next", e)
                        }

                        function l(e) {
                            lS(i, n, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function lP(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return lx(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lx(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lI(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(a, "next", {
                    value: s(0)
                }), l(a, "throw", {
                    value: s(1)
                }), l(a, "return", {
                    value: s(2)
                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function s(l) {
                    return function(s) {
                        var c = [l, s];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        i.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && i.label < o[1]) {
                                        i.label = o[1], o = c;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(c);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            c = t.call(e, i)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var lj = function() {
                    var e, t, r = (0, e3.useMemo)(function() {
                            return (0, e2.getDeviceMeta)()
                        }, []),
                        n = lP((0, e3.useState)(function() {
                            return new URLSearchParams(window.location.search).has("welcome")
                        }), 2),
                        o = n[0],
                        i = n[1],
                        a = lP((0, e3.useState)(function() {
                            return new URLSearchParams(window.location.search).has("faeFreeTrialConfirmation")
                        }), 2),
                        l = a[0],
                        s = a[1],
                        c = lP((0, e3.useState)(o || l), 2),
                        u = c[0],
                        d = c[1],
                        f = (0, E.useQuery)({
                            queryKey: ["get-roblox-subscription-membership"],
                            queryFn: function() {
                                return lO(function() {
                                    var e;
                                    return lI(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, lg.subscriptionsV2ListSubscriptions({
                                                    productType: e$,
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
                        p = lw(f.data, function() {
                            return void 0 !== f.data
                        }),
                        m = null == p ? void 0 : p.productKey.id,
                        y = (0, E.useQuery)({
                            queryKey: ["check-fae-free-trial", m],
                            queryFn: function() {
                                return lO(function() {
                                    var e, t;
                                    return lI(this, function(r) {
                                        switch (r.label) {
                                            case 0:
                                                if (!m) return [2, !1];
                                                return [4, lg.subscriptionsV2ListAvailableSubscriptionProducts({
                                                    productType: e$,
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
                        h = (0, E.useQuery)({
                            queryKey: ["list-roblox-subscription-available-products"],
                            queryFn: function() {
                                return lO(function() {
                                    var e;
                                    return lI(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, lg.subscriptionsV2ListAvailableSubscriptionProducts({
                                                    productType: e$,
                                                    includePurchased: !0,
                                                    includeBundles: !0,
                                                    skipEligibilityCheck: !0
                                                })];
                                            case 1:
                                                if (0 === (e = t.sent().products).length) return [2, null];
                                                return [2, e.toSorted(function(e, t) {
                                                    return t0(e) - t0(t)
                                                })]
                                        }
                                    })
                                })()
                            },
                            enabled: null === f.data,
                            retry: 3,
                            retryDelay: 100
                        }),
                        b = lw(h.data, function() {
                            return void 0 !== h.data
                        }),
                        v = lw(null != (e = null == (t = f.data) ? void 0 : t.productInfo) ? e : null == b ? void 0 : b[0], function() {
                            var e;
                            return (null == (e = f.data) ? void 0 : e.productInfo) !== void 0 || void 0 !== b
                        }),
                        g = (0, E.useQuery)({
                            queryKey: ["get-roblox-plus-user-benefits"],
                            queryFn: function() {
                                return lb.robloxPlusGetRobloxPlusUserBenefits()
                            },
                            enabled: !!p,
                            retry: 3
                        }),
                        w = (0, E.useQuery)({
                            queryKey: ["guac/app-policy/disable-blackbird-entrypoints"],
                            queryFn: function() {
                                return lO(function() {
                                    return lI(this, function(e) {
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
                        x = lw(w.data, function() {
                            return void 0 !== w.data
                        }),
                        O = (0, e3.useCallback)(function() {
                            var e = new URL(window.location.href);
                            e.searchParams.set("welcome", ""), window.history.replaceState(null, "", e.toString()), i(!0)
                        }, []),
                        P = (0, e3.useCallback)(function() {
                            var e = function() {
                                try {
                                    var e = sessionStorage.getItem(e4);
                                    if (!e) return null;
                                    sessionStorage.removeItem(e4);
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
                            t.searchParams.delete("welcome"), window.history.replaceState(null, "", t.toString()), i(!1)
                        }, []),
                        I = (0, e3.useCallback)(function() {
                            var e = new URL(window.location.href);
                            e.searchParams.delete("faeFreeTrialConfirmation"), window.history.replaceState(null, "", e.toString()), s(!1)
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
                        u && f.data && (d(!1), l || O())
                    }, [O, l, u, f.data]);
                    var j = (0, e3.useCallback)(function() {
                        d(!0)
                    }, []);
                    if (h.error || null === h.data || f.error && !u || w.error || !r) return (0, S.jsx)(t_, {});
                    if (void 0 === v || void 0 === p || void 0 === x) return (0, S.jsx)(t9, {});
                    var T = null !== p;
                    if (l) return T ? y.isLoading ? (0, S.jsx)(t9, {}) : y.data ? (0, S.jsx)(t2, {
                        robloxSubscriptionProduct: v,
                        onDismiss: I
                    }) : (0, S.jsx)(t_, {}) : u ? (0, S.jsx)(t9, {}) : (0, S.jsx)(t_, {});
                    if (o)
                        if (T) return (0, S.jsx)(lm, {
                            deviceMeta: r,
                            robloxSubscriptionMembership: p,
                            robloxSubscriptionProduct: v,
                            onDismiss: P
                        });
                        else if (u) return (0, S.jsx)(t9, {});
                    else return (0, S.jsx)(t_, {});
                    return T ? (0, S.jsx)(lf, {
                        isFaeFreeTrial: !0 === y.data,
                        robloxPlusUserBenefits: g.data,
                        robloxSubscriptionMembership: p,
                        robloxSubscriptionProduct: v
                    }) : b ? (0, S.jsx)(ay, {
                        deviceMeta: r,
                        isEntrypointDisabled: x,
                        robloxSubscriptionProducts: b,
                        onMobilePurchaseInitiated: j
                    }) : (0, S.jsx)(t9, {})
                },
                lE = function(e) {
                    var t = e.children;
                    return (0, S.jsx)("div", {
                        className: "clip-x margin-bottom-[160px] min-height-[400px] padding-top-[16px] large:margin-bottom-[120px] relative",
                        children: t
                    })
                },
                lT = function() {
                    return (0, S.jsx)(E.QueryClientProvider, {
                        client: O.queryClient,
                        children: (0, S.jsx)(lE, {
                            children: (0, S.jsx)(lj, {})
                        })
                    })
                };
            I()(function() {
                (0, O.renderWithErrorBoundary)((0, S.jsx)(O.TranslationProvider, {
                    config: j.P,
                    children: (0, S.jsx)(lT, {})
                }), document.getElementById("roblox-subscription-container"), void 0, (0, S.jsx)(lE, {
                    children: (0, S.jsx)(t_, {})
                }))
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("RobloxSubscription");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/robloxSubscription-be8db961bf3ee54d.js.map