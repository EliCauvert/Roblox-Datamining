! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "52744ed6cdf5ac98c9e62f441c2810aeb1e974da"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "cb888270-184e-42ae-9ffd-ddca2be2195f", e._sentryDebugIdIdentifier = "sentry-dbid-cb888270-184e-42ae-9ffd-ddca2be2195f")
    } catch (e) {}
}(),
function() {
    var e = {
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
                    y = Math.max,
                    m = Math.min,
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
                        l = setTimeout(w, (e = i - u, r = i - c, n = t - e, d ? m(n, o - r) : n))
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
                    return t = g(t) || 0, h(r) && (s = !!r.leading, o = (d = "maxWait" in r) ? y(g(r.maxWait) || 0, t) : o, f = "trailing" in r ? !!r.trailing : f), j.cancel = function() {
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
                    d && i && (d = !1, i.length ? s = i.concat(s) : f = -1, s.length && y())
                }

                function y() {
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

                function m(e, t) {
                    this.fun = e, this.array = t
                }

                function b() {}

                function h() {}
                a.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var r = 1; r < arguments.length; r++) t[r - 1] = arguments[r];
                    s.push(new m(e, t)), 1 !== s.length || d || c(y)
                }, m.prototype.run = function() {
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
            var e, t, n, i, o, a, l, u, c, s, d, f, p, y, m, b, h, g, v, w, x, j, O, S, I = window.ReactJSX,
                M = window.Roblox["core-scripts"].react,
                N = window.Roblox["core-scripts"].util.ready,
                P = r.n(N),
                E = JSON.parse('{"P":["Feature.RobloxSubscription"]}'),
                T = window.TanstackQuery;

            function D(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var A = function(e, t) {
                return (A = Object.setPrototypeOf || D({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function L(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function r() {
                    this.constructor = e
                }
                A(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
            }
            var C = function() {
                return (C = Object.assign || function(e) {
                    for (var t, r = 1, n = arguments.length; r < n; r++)
                        for (var i in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                    return e
                }).apply(this, arguments)
            };

            function R(e, t, r, n) {
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
                        e.done ? i(e.value) : (D(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, l)
                    }
                    u((n = n.apply(e, t || [])).next())
                })
            }

            function k(e, t) {
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

            function U(e, t, r) {
                if (r || 2 == arguments.length)
                    for (var n, i = 0, o = t.length; i < o; i++) !n && i in t || (n || (n = Array.prototype.slice.call(t, 0, i)), n[i] = t[i]);
                return e.concat(n || Array.prototype.slice.call(t))
            }
            "function" == typeof SuppressedError && SuppressedError;
            var z = {
                    envName: ""
                },
                _ = !1,
                B = function() {
                    try {
                        if ("u" < typeof window) return C({}, z);
                        var e = localStorage.getItem("Roblox.MrRouterConfig");
                        if (null == e) return C({}, z);
                        var t = JSON.parse(e);
                        if ("object" != (void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) || null === t) return C({}, z);
                        var r = C(C({}, z), "envName" in t && "string" == typeof t.envName && {
                            envName: t.envName
                        });
                        return r.envName && !_ && (_ = !0, console.warn('[MrRouter] Routing to non-production environment: "'.concat(r.envName, '"'))), r
                    } catch (e) {
                        return C({}, z)
                    }
                },
                Y = "mrrouter-env",
                F = "tracestate",
                G = "traceparent",
                W = function(e) {
                    var t = e.indexOf("=");
                    return (-1 === t ? e : e.slice(0, t)).trim()
                },
                V = function(e, t) {
                    var r = "".concat(Y, "=").concat(encodeURIComponent(t)),
                        n = null == e ? void 0 : e.trim(),
                        i = n ? n.split(",") : [],
                        o = i.findIndex(function(e) {
                            return W(e) === Y
                        });
                    if (-1 === o) return U(U([], i.map(function(e) {
                        return e.trim()
                    }), !0), [r], !1).join(",");
                    var a = i.filter(function(e) {
                        return W(e) !== Y
                    }).map(function(e) {
                        return e.trim()
                    });
                    return a.splice(o, 0, r), a.join(",")
                },
                Q = function(e) {
                    var t = new Uint8Array(e);
                    return crypto.getRandomValues(t), Array.from(t, function(e) {
                        return e.toString(16).padStart(2, "0")
                    }).join("")
                },
                q = "u" > typeof crypto && "function" == typeof crypto.randomUUID,
                K = function() {
                    return q ? crypto.randomUUID().replaceAll("-", "").slice(0, 32) : Q(16)
                },
                H = function() {
                    return q ? crypto.randomUUID().replaceAll("-", "").slice(0, 16) : Q(8)
                },
                X = function(e) {
                    var t = B().envName;
                    if (t.length > 0 && (e[F] = V(e[F], t), !e[G])) {
                        var r = K(),
                            n = H();
                        e[G] = "00-".concat(r, "-").concat(n, "-01")
                    }
                };

            function Z(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            r(773);
            var $, J = function(e) {
                    return e.replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/\d+/, "/number")
                },
                ee = function(e, t) {
                    return !1 === t.ok && !1 === [401, 403, 404].includes(t.status) && e(Error("Network error"), {
                        tags: {
                            apiUrl: J(t.url),
                            apiStatus: null == t ? void 0 : t.status,
                            cors: !1
                        }
                    }), t
                },
                et = function(e, t) {
                    e(Error("Network error"), {
                        tags: {
                            apiUrl: J(t),
                            cors: !0
                        }
                    })
                },
                er = function() {
                    function e(e) {
                        this.captureException = e
                    }
                    return e.prototype.post = function(e) {
                        return R(this, void 0, void 0, function() {
                            return k(this, function(t) {
                                return [2, ee(this.captureException, e.response)]
                            })
                        })
                    }, e.prototype.onError = function(e) {
                        return R(this, void 0, void 0, function() {
                            return k(this, function(t) {
                                return et(this.captureException, e.url), [2]
                            })
                        })
                    }, e
                }(),
                en = function(e) {
                    if (document) {
                        var t, r, n = document.getElementById("hba-frame");
                        return null === n && ((t = document.createElement("iframe")).id = "hba-frame", t.style.cssText = "position: fixed; top: 0; left: 0; width: 0%; height: 0%; z-index: -1", t.src = "https://www.".concat(e, "/hba/iframe"), r = t, n = (null == document ? void 0 : document.body) ? document.body.appendChild(r) : null), n
                    }
                    return null
                },
                ei = function() {
                    var e = window.location.hostname.split(".").slice(0, -2).join(".");
                    return e.includes("create") ? "creator_hub" : e.includes("advertise") ? "ads_manager" : "creator_hub"
                },
                eo = function(e, t) {
                    try {
                        fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                            method: "POST",
                            body: JSON.stringify({
                                name: "load_time_hba_frame",
                                value: t,
                                labelValues: {
                                    origin_site: ei()
                                }
                            })
                        })
                    } catch (e) {}
                },
                ea = function(e, t) {
                    try {
                        fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                            method: "POST",
                            body: JSON.stringify({
                                name: "response_time_hba_frame",
                                value: t,
                                labelValues: {
                                    origin_site: ei()
                                }
                            })
                        })
                    } catch (e) {}
                },
                el = function(e, t, r) {
                    return void 0 === r && (r = 1500), new Promise(function(n, i) {
                        var o, a, l = performance.now(),
                            u = window.setTimeout(function() {
                                eo(e, performance.now() - l),
                                    function(e) {
                                        try {
                                            fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                                method: "POST",
                                                body: JSON.stringify({
                                                    name: "event_hba_frame",
                                                    value: 1,
                                                    labelValues: {
                                                        event_type: "FrameLoadTimedOut",
                                                        origin_site: ei()
                                                    }
                                                })
                                            })
                                        } catch (e) {}
                                    }(e), i(Error("Promise timed out after ".concat(r, " ms")))
                            }, r),
                            c = o = function(t) {
                                var r = t.data;
                                t.origin === "https://www.".concat(e) && "dataFromHbaFrame" === r.msg && "loaded" === r.data.type && (window.removeEventListener("message", o, !1), window.clearTimeout(u), eo(e, performance.now() - l), n())
                            };
                        window.addEventListener("message", c, !1), null == (a = t.contentWindow) || a.postMessage({
                            msg: "checkLoadedRequest"
                        }, "https://www.".concat(e))
                    })
                },
                eu = function(e, t, r, n, i, o, a) {
                    var l;
                    if (void 0 === a && (a = 100), window) {
                        var u, c = performance.now(),
                            s = window.setTimeout(function() {
                                ea(r, performance.now() - c),
                                    function(e) {
                                        try {
                                            fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                                method: "POST",
                                                body: JSON.stringify({
                                                    name: "event_hba_frame",
                                                    value: 1,
                                                    labelValues: {
                                                        event_type: "FrameResponseTimedOut",
                                                        origin_site: ei()
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
                                        window.clearTimeout(s), window.removeEventListener("message", u, !1), ea(r, performance.now() - c);
                                        var d = n.data.batHeader;
                                        e({
                                            url: a,
                                            init: C(C({}, l), {
                                                headers: C(C({}, l.headers), {
                                                    "x-bound-auth-token": d["x-bound-auth-token"]
                                                })
                                            })
                                        })
                                    } else window.clearTimeout(s), window.removeEventListener("message", u, !1), ea(r, performance.now() - c), e({
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
                ec = function() {
                    return crypto.randomUUID()
                },
                es = function() {
                    function e(e, t, r) {
                        void 0 === t && (t = 1500), void 0 === r && (r = 100), this.robloxSiteDomain = e, this.hbaFrameAlreadyLoaded = !1, this.hbaFrameLoadFailed = !1, this.hbaFrame = null, this.loadTimeOut = t, this.dataTimeOut = r
                    }
                    return e.prototype.getOrCreateHbaFrame = function() {
                        return en(this.robloxSiteDomain)
                    }, e.prototype.pre = function(e) {
                        var t = this;
                        return new Promise(function(r, n) {
                            var i = e.url,
                                o = e.init;
                            if (t.hbaFrame = t.getOrCreateHbaFrame(), null !== t.hbaFrame) {
                                var a = ec();
                                t.hbaFrameAlreadyLoaded ? eu(r, 0, t.robloxSiteDomain, t.hbaFrame, e, a, t.dataTimeOut) : t.hbaFrameLoadFailed ? r({
                                    url: i,
                                    init: o
                                }) : el(t.robloxSiteDomain, t.hbaFrame, t.loadTimeOut).then(function() {
                                    t.hbaFrame ? (t.hbaFrameAlreadyLoaded = !0, eu(r, 0, t.robloxSiteDomain, t.hbaFrame, e, a, t.dataTimeOut)) : r({
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
            (n = $ || ($ = {})).UNKNOWN = "unknown", n.INVALIDATED = "invalidated", n.ABANDONED = "abandoned", n.LOADFAILED = "loadfailed";
            var ed = function(e) {
                    function t(t) {
                        var r = e.call(this, "challenge error for challenge kind ".concat(t.kind)) || this;
                        return r.parameters = t, r
                    }
                    return L(t, e), t.prototype.match = function(e) {
                        return this.parameters.kind === e.parameters.kind && JSON.stringify(this.parameters.data) === JSON.stringify(e.parameters.data)
                    }, t.prototype.matchAbandoned = function(e) {
                        return this.match(e) && e.parameters.kind === $.ABANDONED
                    }, t
                }(Error),
                ef = "rblx-challenge-id",
                ep = "rblx-challenge-type",
                ey = "rblx-challenge-metadata",
                em = function(e, t) {
                    return 403 === e.status && e.headers.has(ef) && e.headers.has(ep) && e.headers.has(ey) && "iframe" === t
                },
                eb = function(e) {
                    var t, r, n, i, o, a, l, u, c, s = e.url,
                        d = e.request,
                        f = e.response,
                        p = e.robloxSiteDomain,
                        y = (o = new URLSearchParams([
                            ["challenge-type", "generic"],
                            ["dark-mode", "true"],
                            ["barista-mode", "true"],
                            ["generic-challenge-type", null != (t = f.headers.get(ep)) ? t : ""],
                            ["generic-challenge-id", null != (r = f.headers.get(ef)) ? r : ""],
                            ["challenge-metadata-json", null != (n = f.headers.get(ey)) ? n : ""],
                            ["origin", null != (i = window.location.hostname.split(".").slice(0, -2).join(".")) ? i : ""]
                        ]), a = new URL("https://www.".concat(p, "/challenge/cdn/hybrid?").concat(o.toString())), (l = document.createElement("iframe")).id = "challenge-frame", l.allowFullscreen = !0, l.setAttribute("allowtransparency", "true"), l.setAttribute("allow", "publickey-credentials-get;publickey-credentials-create"), l.style.cssText = "position: fixed; top: 0; left: 0; width: 100%; height: 100%; visibility: hidden; color-scheme: normal; border: none; z-index: 2147483647;", l.src = a.toString(), l.onload = function() {
                            l.style.visibility = "visible"
                        }, u = l, document && document.body ? document.body.appendChild(u) : null);
                    return new Promise(function(e, t) {
                        window && y && (c = function(r) {
                            var n, i, o, a, l, u, c, p, y, m, b;
                            if (r.data && r.data.genericChallengeResponse) switch (r.data.genericChallengeResponse.type) {
                                case "challengeAbandoned":
                                    t(new ed({
                                        kind: $.ABANDONED,
                                        data: {
                                            challengeType: null != (n = f.headers.get(ep)) ? n : ""
                                        }
                                    }));
                                    break;
                                case "challengeDisplayed":
                                    break;
                                case "challengeCompleted":
                                    (c = r.data.genericChallengeResponse.data).challengeType && c.metadata ? e((p = c.metadata, fetch(s, C(C({}, d), {
                                        headers: C(C({}, d.headers), ((y = {})[ef] = null != (m = f.headers.get(ef)) ? m : "", y[ey] = btoa(JSON.stringify(p)), y[ep] = null != (b = f.headers.get(ep)) ? b : "", y))
                                    })))) : t(new ed({
                                        kind: $.UNKNOWN,
                                        data: {
                                            challengeType: null != (i = f.headers.get(ep)) ? i : ""
                                        }
                                    }));
                                    break;
                                case "challengeInvalidated":
                                    t((c = r.data.genericChallengeResponse.data) && c.challengeType && c.metadata ? new ed({
                                        kind: $.INVALIDATED,
                                        data: c
                                    }) : new ed({
                                        kind: $.INVALIDATED,
                                        data: {
                                            challengeType: null != (o = f.headers.get(ep)) ? o : ""
                                        }
                                    }));
                                    break;
                                case "challengeParsed":
                                    !1 === (c = r.data.genericChallengeResponse.data).parsed && t(new ed({
                                        kind: $.UNKNOWN,
                                        data: {
                                            challengeType: null != (a = f.headers.get(ep)) ? a : ""
                                        }
                                    }));
                                    break;
                                case "challengeInitialized":
                                    !1 === (c = r.data.genericChallengeResponse.data).initialized && t(new ed({
                                        kind: $.UNKNOWN,
                                        data: {
                                            challengeType: null != (l = f.headers.get(ep)) ? l : ""
                                        }
                                    }));
                                    break;
                                case "challengePageLoaded":
                                    !1 === (c = r.data.genericChallengeResponse.data).pageLoaded && t(new ed({
                                        kind: $.LOADFAILED,
                                        data: {
                                            challengeType: null != (u = f.headers.get(ep)) ? u : ""
                                        }
                                    }))
                            }
                        }, window.addEventListener("message", c, !1))
                    }).finally(function() {
                        null == y || y.remove(), c && window.removeEventListener("message", c, !1)
                    })
                },
                eh = function() {
                    function e(e, t) {
                        void 0 === t && (t = "iframe"), this.robloxSiteDomain = e, this.genericChallengeMiddlewareType = t
                    }
                    return e.prototype.post = function(e) {
                        var t = e.url,
                            r = e.init,
                            n = e.response;
                        return em(n, this.genericChallengeMiddlewareType) ? eb({
                            url: t,
                            request: r,
                            response: n,
                            robloxSiteDomain: this.robloxSiteDomain
                        }) : Promise.resolve(n)
                    }, e
                }(),
                eg = function(e) {
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
                ev = function() {
                    function e(e) {
                        this.unifiedLogger = e
                    }
                    return e.prototype.post = function(e) {
                        return this.unifiedLogger.logApiVitalsEvent(eg({
                            elapsedTime: e.elapsedTime,
                            url: e.url,
                            status: e.response.status,
                            schemaPath: e.schemaPath
                        })), Promise.resolve(e.response)
                    }, e
                }(),
                ew = "x-csrf-token",
                ex = ["POST", "PATCH", "DELETE", "PUT"],
                ej = function() {
                    var e, t = "";
                    try {
                        "u" > typeof window && (t = null != (e = localStorage.getItem(ew)) ? e : "")
                    } catch (e) {
                        console.warn("Error reading localStorage key “".concat(ew, "”:"), e)
                    }
                    return t
                },
                eO = ej(),
                eS = function(e) {
                    try {
                        eO = e, "u" > typeof window && localStorage.setItem(ew, e)
                    } catch (e) {
                        console.warn("Error setting localStorage key “".concat(ew, "”:"), e)
                    }
                },
                eI = function() {
                    function e() {
                        this.currentToken = ej()
                    }
                    return e.prototype.pre = function(e) {
                        var t, r = e.url,
                            n = e.init,
                            i = this.currentToken;
                        return n.headers && "object" == ((t = n.headers) && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) && ew in n.headers && (i = n.headers[ew]) && (this.currentToken = i, eS(i)), n.method && ex.includes(n.method) ? Promise.resolve({
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
                            o = i.headers.get(ew);
                        return 403 === i.status && i.headers.has(ew) && null !== o ? (this.currentToken = o, eS(o), t(r, this.prepareRequestInit(n))) : Promise.resolve(i)
                    }, e.prototype.prepareRequestInit = function(e) {
                        var t;
                        return C(C({}, e), {
                            headers: C(C({}, e.headers), ((t = {})[ew] = this.currentToken, t))
                        })
                    }, e
                }(),
                eM = [],
                eN = function(e) {
                    eM = eM.filter(function(t) {
                        return t !== e
                    })
                },
                eP = function(e) {
                    var t = e.url;
                    503 === e.status && eM.forEach(function(e) {
                        return e(t)
                    })
                },
                eE = function() {
                    function e() {}
                    return e.prototype.subscribe = function(e) {
                        return eM.push(e),
                            function() {
                                return eN(e)
                            }
                    }, e.prototype.unsubscribe = function(e) {
                        return eN(e)
                    }, e.prototype.post = function(e) {
                        var t = e.response;
                        return eP(t), Promise.resolve(t)
                    }, e
                }(),
                eT = function() {
                    function e() {}
                    return e.prototype.pre = function(e) {
                        var t = e.url,
                            r = e.init;
                        if (!B().envName) return Promise.resolve({
                            url: t,
                            init: r
                        });
                        var n = C({}, r.headers);
                        return X(n), Promise.resolve({
                            url: t,
                            init: C(C({}, r), {
                                headers: n
                            })
                        })
                    }, e
                }(),
                eD = new eI,
                eA = new eE,
                eL = [function(e) {
                    return e.captureException ? new er(e.captureException) : void 0
                }, function(e) {
                    return e.robloxSiteDomain && e.enableBoundAuthToken ? new es(e.robloxSiteDomain, e.boundAuthTokenLoadTimeout, e.boundAuthTokenDataTimeout) : void 0
                }, function(e) {
                    return e.robloxSiteDomain ? new eh(e.robloxSiteDomain, e.genericChallengeMiddlewareType) : void 0
                }, function(e) {
                    return e.unifiedLogger ? new ev(e.unifiedLogger) : void 0
                }, function() {
                    return eD
                }, function() {
                    return eA
                }, function(e) {
                    return e.enableMrRouter ? new eT : void 0
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
                                    return function t(r, n, i) {
                                        void 0 === i && (i = "");
                                        var o = i + (i.length ? "[".concat(r, "]") : r);
                                        if (Z(n, Array)) {
                                            var a = n.map(function(e) {
                                                return encodeURIComponent(String(e))
                                            }).join("&".concat(encodeURIComponent(o), "="));
                                            return "".concat(encodeURIComponent(o), "=").concat(a)
                                        }
                                        return Z(n, Set) ? t(r, Array.from(n), i) : Z(n, Date) ? "".concat(encodeURIComponent(o), "=").concat(encodeURIComponent(n.toISOString())) : Z(n, Object) ? e(n, o) : "".concat(encodeURIComponent(o), "=").concat(encodeURIComponent(String(n)))
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
                                return R(e, void 0, void 0, function() {
                                    return k(this, function(e) {
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
                eR = new eC,
                ek = function() {
                    function e(e) {
                        void 0 === e && (e = eR);
                        var t = this;
                        this.configuration = e, this.fetchApi = function(e, r, n) {
                            return R(t, void 0, void 0, function() {
                                var t, i, o, a, l, u, c, s, d, f, p, y, m, b = this;
                                return k(this, function(h) {
                                    switch (h.label) {
                                        case 0:
                                            t = function(e, t) {
                                                return b.fetchApi(e, t, n)
                                            }, i = {
                                                url: e,
                                                init: r
                                            }, o = 0, a = this.middleware, h.label = 1;
                                        case 1:
                                            return o < a.length ? (m = a[o]).pre ? [4, m.pre(C({
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
                                            return d < f.length ? (m = f[d]).onError ? [4, m.onError({
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
                                            if (void 0 === l) throw Z(s, Error) ? new ez(s, "The request failed and the interceptors did not return an alternative response") : s;
                                            return [3, 12];
                                        case 12:
                                            p = 0, y = this.middleware, h.label = 13;
                                        case 13:
                                            return p < y.length ? (m = y[p]).post ? [4, m.post({
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
                        return R(this, void 0, void 0, function() {
                            var r, n, i, o;
                            return k(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        return [4, this.createFetchParams(e, t)];
                                    case 1:
                                        return n = (r = a.sent()).url, i = r.init, [4, this.fetchApi(n, i, e.schemaPath)];
                                    case 2:
                                        if ((o = a.sent()) && o.status >= 200 && o.status < 300) return [2, o];
                                        throw new eU(o, "Response from ".concat(o.url, " returned an error code ").concat(o.status))
                                }
                            })
                        })
                    }, e.prototype.createFetchParams = function(e, t) {
                        return R(this, void 0, void 0, function() {
                            var r, n, i, o, a, l, u, c = this;
                            return k(this, function(s) {
                                var d, f;
                                switch (s.label) {
                                    case 0:
                                        return r = this.configuration.basePath + e.path, void 0 !== e.query && 0 !== Object.keys(e.query).length && (r += "?" + this.configuration.queryParamsStringify(e.query)), Object.keys(n = Object.assign({}, this.configuration.headers, e.headers)).forEach(function(e) {
                                            return void 0 === n[e] ? delete n[e] : {}
                                        }), i = "function" == typeof t ? t : function() {
                                            return R(c, void 0, void 0, function() {
                                                return k(this, function(e) {
                                                    return [2, t]
                                                })
                                            })
                                        }, o = {
                                            method: e.method,
                                            headers: n,
                                            body: e.body,
                                            credentials: this.configuration.credentials
                                        }, l = [C({}, o)], [4, i({
                                            init: o,
                                            context: e
                                        })];
                                    case 1:
                                        return a = C.apply(void 0, l.concat([s.sent()])), u = C(C({}, a), {
                                            body: (d = a.body, "u" > typeof FormData && Z(d, FormData) || Z(a.body, URLSearchParams) || (f = a.body, "u" > typeof Blob && Z(f, Blob)) ? a.body : JSON.stringify(a.body))
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
                eU = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.response = t, n.name = "ResponseError", n
                    }
                    return L(t, e), t
                }(Error),
                ez = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.cause = t, n.name = "FetchError", n
                    }
                    return L(t, e), t
                }(Error),
                e_ = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.field = t, n.name = "RequiredError", n
                    }
                    return L(t, e), t
                }(Error);

            function eB(e, t) {
                return null != e[t]
            }
            var eY = function() {
                    function e(e, t) {
                        void 0 === t && (t = function(e) {
                            return e
                        }), this.raw = e, this.transformer = t
                    }
                    return e.prototype.value = function() {
                        return R(this, void 0, void 0, function() {
                            var e;
                            return k(this, function(t) {
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
                eF = ((function(e) {
                    this.raw = e
                }).prototype.value = function() {
                    return R(this, void 0, void 0, function() {
                        return k(this, function(e) {
                            return [2, void 0]
                        })
                    })
                }, (function(e) {
                    this.raw = e
                }).prototype.value = function() {
                    return R(this, void 0, void 0, function() {
                        return k(this, function(e) {
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
                        return R(this, void 0, void 0, function() {
                            return k(this, function(e) {
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
                eG = function(e) {
                    function t(t) {
                        void 0 === t && (t = {});
                        var r, n = C({}, t),
                            i = n.middleware || [];
                        return i.unshift.apply(i, (r = t, eL.map(function(e) {
                            return e(r)
                        }).filter(function(e) {
                            return e
                        }))), n.middleware = i, e.call(this, n) || this
                    }
                    return L(t, e), t
                }(eC);

            function eW(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var eV = function(e, t) {
                return (eV = Object.setPrototypeOf || eW({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function eQ(e, t, r, n) {
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
                        e.done ? i(e.value) : (eW(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, l)
                    }
                    u((n = n.apply(e, t || [])).next())
                })
            }

            function eq(e, t) {
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

            function eK(e) {
                return e
            }
            "function" == typeof SuppressedError && SuppressedError;
            var eH = "Month";

            function eX(e, t) {
                return null == e ? e : {
                    currencyCode: e.currencyCode,
                    units: e.units,
                    nanos: e.nanos
                }
            }

            function eZ(e) {
                return e
            }

            function e$(e) {
                var t, r;
                return null == (t = e) ? t : {
                    offerType: eB(t, "offerType") ? t.offerType : void 0,
                    freeTrialOffer: eB(t, "freeTrialOffer") ? null == (r = t.freeTrialOffer) ? r : {
                        periodType: r.periodType,
                        duration: r.duration,
                        estimatedTrialEndDate: eB(r, "estimatedTrialEndDate") ? null === r.estimatedTrialEndDate ? null : new Date(r.estimatedTrialEndDate) : void 0
                    } : void 0
                }
            }
            var eJ = "Blackbird";

            function e0(e) {
                var t;
                return null == (t = e) ? t : {
                    type: t.type,
                    id: t.id
                }
            }

            function e1(e) {
                var t;
                return null == (t = e) ? t : {
                    tierId: t.tierId,
                    periodIndex: t.periodIndex,
                    discountPercent: t.discountPercent
                }
            }

            function e2(e) {
                var t, r, n, i, o, a, l, u, c;
                return null == (t = e) ? t : {
                    productKey: e0(t.productKey),
                    periodType: t.periodType,
                    periodCount: t.periodCount,
                    localizedPrice: eX(t.localizedPrice),
                    localizedPriceDisplayString: t.localizedPriceDisplayString,
                    localizedStrikethroughPrice: eX(t.localizedStrikethroughPrice),
                    localizedStrikethroughPriceDisplayString: t.localizedStrikethroughPriceDisplayString,
                    productTypeDetails: null == (r = t.productTypeDetails) ? r : {
                        currencySubscriptionProductDetails: eB(r, "currencySubscriptionProductDetails") ? null == (n = r.currencySubscriptionProductDetails) ? n : {
                            currencyType: n.currencyType,
                            entitledAmountMicros: n.entitledAmountMicros
                        } : void 0,
                        developerSubscriptionProductDetails: eB(r, "developerSubscriptionProductDetails") ? null == (i = r.developerSubscriptionProductDetails) ? i : {
                            universeId: i.universeId,
                            imageAssetId: i.imageAssetId,
                            localizedName: i.localizedName,
                            localizedDescription: i.localizedDescription
                        } : void 0,
                        robloxSubscriptionProductDetails: eB(r, "robloxSubscriptionProductDetails") ? null == (o = r.robloxSubscriptionProductDetails) ? o : {
                            featureConfig: null == (a = o.featureConfig) ? a : {
                                virtualTransactionDiscounts: null === a.virtualTransactionDiscounts ? null : a.virtualTransactionDiscounts.map(e1),
                                isRobuxTransferEnabled: a.isRobuxTransferEnabled,
                                isTradingEnabled: a.isTradingEnabled,
                                isUgcPublishingEnabled: a.isUgcPublishingEnabled,
                                privateServerDiscounts: null === a.privateServerDiscounts ? null : a.privateServerDiscounts.map(e1),
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
                    eligibleOffers: t.eligibleOffers.map(e$)
                }
            }

            function e4(e) {
                var t;
                return null == (t = e) ? t : {
                    referralId: t.referralId,
                    senderUserId: t.senderUserId,
                    status: t.status,
                    createdTimestampMs: t.createdTimestampMs
                }
            }

            function e3(e) {
                var t, r, n, i, o, a, l;
                return null == (t = e) ? t : {
                    productKey: e0(t.productKey),
                    periodType: t.periodType,
                    displayPrice: eX(t.displayPrice),
                    activationTimestampMs: t.activationTimestampMs,
                    expirationTimestampMs: t.expirationTimestampMs,
                    nextRenewalTimestampMs: t.nextRenewalTimestampMs,
                    paymentProvider: eZ(t.paymentProvider),
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
                    activeOffers: t.activeOffers.map(e$),
                    productTypeMembershipDetails: null == (i = t.productTypeMembershipDetails) ? i : {
                        robloxSubscriptionMembershipDetails: eB(i, "robloxSubscriptionMembershipDetails") ? null == (o = i.robloxSubscriptionMembershipDetails) ? o : {
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
                    productInfo: e2(t.productInfo)
                }
            }
            var e5 = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return function(e, t) {
                        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                        function r() {
                            this.constructor = e
                        }
                        eV(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
                    }(t, e), t.prototype.subscriptionsV2CheckSubscriptionReferralEligibilityRaw = function(e, t) {
                        return eQ(this, void 0, void 0, function() {
                            var r, n;
                            return eq(this, function(i) {
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
                                        return [2, new eY(i.sent(), function(e) {
                                            return null == e ? e : {
                                                eligibility: e.eligibility
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2CheckSubscriptionReferralEligibility = function() {
                        return eQ(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eq(this, function(r) {
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
                        return eQ(this, void 0, void 0, function() {
                            var r, n;
                            return eq(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new e_("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2ClaimSubscriptionProduct.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new e_("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2ClaimSubscriptionProduct.");
                                        return r = {}, void 0 !== e.grantType && (r.grantType = e.grantType), n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/claim".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/claim",
                                            method: "POST",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eY(i.sent())]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ClaimSubscriptionProduct = function(e, t) {
                        return eQ(this, void 0, void 0, function() {
                            return eq(this, function(r) {
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
                        return eQ(this, void 0, void 0, function() {
                            var r, n;
                            return eq(this, function(i) {
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
                                        return [2, new eY(i.sent(), function(e) {
                                            return null == e ? e : {
                                                referralId: e.referralId
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2CreateSubscriptionReferral = function() {
                        return eQ(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eq(this, function(r) {
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
                        return eQ(this, void 0, void 0, function() {
                            var t, r;
                            return eq(this, function(n) {
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
                                        return [2, new eY(n.sent(), function(e) {
                                            return null == e ? e : {
                                                deepLinkUrl: e.deepLinkUrl
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2CreateSubscriptionReferralLink = function(e) {
                        return eQ(this, void 0, void 0, function() {
                            return eq(this, function(t) {
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
                        return eQ(this, void 0, void 0, function() {
                            var r, n;
                            return eq(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new e_("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new e_("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        return r = {}, n = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eY(i.sent(), function(e) {
                                            return null == e ? e : {
                                                displayPrice: eX(e.displayPrice)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductDisplayPrice = function(e, t) {
                        return eQ(this, void 0, void 0, function() {
                            return eq(this, function(r) {
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
                        return eQ(this, void 0, void 0, function() {
                            var r, n;
                            return eq(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new e_("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new e_("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/payment-metadata".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/payment-metadata",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eY(i.sent(), function(e) {
                                            return null == e ? e : {
                                                paymentMethods: e.paymentMethods.map(eK),
                                                paymentProviders: e.paymentProviders.map(eZ)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductPaymentMetadata = function(e, t) {
                        return eQ(this, void 0, void 0, function() {
                            return eq(this, function(r) {
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
                        return eQ(this, void 0, void 0, function() {
                            var r, n;
                            return eq(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new e_("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new e_("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eY(i.sent(), function(e) {
                                            return null == e ? e : {
                                                subscriptionProductInfo: e2(e.subscriptionProductInfo)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetSubscriptionProductInfo = function(e, t) {
                        return eQ(this, void 0, void 0, function() {
                            return eq(this, function(r) {
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
                        return eQ(this, void 0, void 0, function() {
                            var r, n;
                            return eq(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return r = {}, void 0 !== e.productType && (r.ProductType = e.productType), void 0 !== e.includePurchased && (r.IncludePurchased = e.includePurchased), void 0 !== e.includeBundles && (r.IncludeBundles = e.includeBundles), void 0 !== e.purchasePlatform && (r.PurchasePlatform = e.purchasePlatform), void 0 !== e.skipEligibilityCheck && (r.SkipEligibilityCheck = e.skipEligibilityCheck), void 0 !== e.grantType && (r.GrantType = e.grantType), void 0 !== e.paymentProvider && (r.PaymentProvider = e.paymentProvider), void 0 !== e.includeExtendedTermProducts && (r.IncludeExtendedTermProducts = e.includeExtendedTermProducts), n = {}, [4, this.request({
                                            path: "/v2/products",
                                            schemaPath: "/v2/products",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eY(i.sent(), function(e) {
                                            return null == e ? e : {
                                                productKeys: e.productKeys.map(e0),
                                                products: e.products.map(e2)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListAvailableSubscriptionProducts = function() {
                        return eQ(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eq(this, function(r) {
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
                    }, t.prototype.subscriptionsV2ListSubscriptionReferralsRaw = function(e, t) {
                        return eQ(this, void 0, void 0, function() {
                            var r, n;
                            return eq(this, function(i) {
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
                                        return [2, new eY(i.sent(), function(e) {
                                            return null == e ? e : {
                                                referrals: e.referrals.map(e4),
                                                nextCursor: e.nextCursor,
                                                hasMore: e.hasMore
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListSubscriptionReferrals = function() {
                        return eQ(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eq(this, function(r) {
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
                        return eQ(this, void 0, void 0, function() {
                            var r, n;
                            return eq(this, function(i) {
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
                                        return [2, new eY(i.sent(), function(e) {
                                            return null == e ? e : {
                                                subscriptions: e.subscriptions.map(e3),
                                                hasMore: e.hasMore,
                                                cursor: e.cursor
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListSubscriptions = function() {
                        return eQ(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eq(this, function(r) {
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
                        return eQ(this, void 0, void 0, function() {
                            var r, n;
                            return eq(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new e_("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new e_("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
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
                                        return [2, new eY(i.sent(), function(e) {
                                            var t, r, n, i, o, a;
                                            return null == e ? e : {
                                                paymentProvider: eZ(e.paymentProvider),
                                                providerPurchasePayload: null == (t = e.providerPurchasePayload) ? t : {
                                                    stripePurchasePayload: eB(t, "stripePurchasePayload") ? null == (r = t.stripePurchasePayload) ? r : {
                                                        checkoutUrl: r.checkoutUrl
                                                    } : void 0,
                                                    appleAppStorePurchasePayload: eB(t, "appleAppStorePurchasePayload") ? null == (n = t.appleAppStorePurchasePayload) ? n : {
                                                        appAccountToken: n.appAccountToken,
                                                        partnerBillingJwtToken: n.partnerBillingJwtToken,
                                                        partnerBillingGenericProductId: n.partnerBillingGenericProductId
                                                    } : void 0,
                                                    googlePlayStorePurchasePayload: eB(t, "googlePlayStorePurchasePayload") ? null == (i = t.googlePlayStorePurchasePayload) ? i : {
                                                        providerProductId: i.providerProductId,
                                                        providerProductType: i.providerProductType,
                                                        chargeRequestId: i.chargeRequestId,
                                                        offerId: eB(i, "offerId") ? i.offerId : void 0
                                                    } : void 0,
                                                    creditBalancePurchasePayload: eB(t, "creditBalancePurchasePayload") ? null == (o = t.creditBalancePurchasePayload) ? o : {
                                                        checkoutUrl: o.checkoutUrl,
                                                        checkoutToken: eB(o, "checkoutToken") ? o.checkoutToken : void 0,
                                                        robloxManagedTax: eB(o, "robloxManagedTax") ? o.robloxManagedTax : void 0,
                                                        requiresBillingAddress: eB(o, "requiresBillingAddress") ? o.requiresBillingAddress : void 0,
                                                        chargeRequestId: eB(o, "chargeRequestId") ? o.chargeRequestId : void 0,
                                                        baseAmount: eB(o, "baseAmount") ? o.baseAmount : void 0,
                                                        taxAmount: eB(o, "taxAmount") ? o.taxAmount : void 0,
                                                        totalAmount: eB(o, "totalAmount") ? o.totalAmount : void 0,
                                                        currencyCode: eB(o, "currencyCode") ? o.currencyCode : void 0
                                                    } : void 0,
                                                    braintreePurchasePayload: eB(t, "braintreePurchasePayload") ? null == (a = t.braintreePurchasePayload) ? a : {
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
                        return eQ(this, void 0, void 0, function() {
                            return eq(this, function(r) {
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
                }(ek),
                e6 = window.Roblox["core-scripts"].endpoints,
                e8 = window.Roblox["core-scripts"].guac,
                e7 = window.Roblox["core-scripts"].meta.device,
                e9 = function() {
                    var e, t = document.querySelector('meta[name="subscription-referral-data"]');
                    return null != (e = null == t ? void 0 : t.dataset) ? e : null
                },
                te = function() {
                    var e;
                    return (null == (e = e9()) ? void 0 : e.isEnabled) === "true"
                },
                tt = "https://www.roblox.com/info/terms",
                tr = "referrals",
                tn = "roblox_subscription_redirect_url",
                ti = window.React,
                to = r.n(ti),
                ta = function() {
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

            function tl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tu(e) {
                if (Array.isArray(e)) return e
            }

            function tc() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ts(e, t) {
                if (e) {
                    if ("string" == typeof e) return tl(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tl(e, t)
                }
            }
            var td = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                tf = to().forwardRef(function(e, t) {
                    var r, n = tu(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || ts(r) || tc(),
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
                        s = (tu(o) || function(e) {
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
                        }(o) || ts(o, 1) || tc())[0];
                    return to().createElement("span", function(e) {
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
                        className: ta("grow-0 shrink-0 basis-auto icon", a, td[void 0 === l ? "Medium" : l], u)
                    }, c))
                });
            tf.displayName = "Icon";
            var tp = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                ty = function(e) {
                    var t = e.className;
                    return to().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: ta("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                tm = "opacity-[0.5]",
                tb = function(e) {
                    var t = e.width,
                        r = e.height;
                    return to().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, to().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function th(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tg(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function tv() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = tg(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : tg(t[e], null)
                        }
                    }
                }
            }

            function tw() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return ti.useCallback(tv.apply(void 0, function(e) {
                    if (Array.isArray(e)) return th(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return th(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return th(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function tx(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
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

            function tO(e, t) {
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

            function tS(e, t) {
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

            function tI(e) {
                return function(e) {
                    if (Array.isArray(e)) return tx(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tx(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tx(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tM(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var tN = Symbol.for("react.lazy"),
                tP = ti[" use ".trim().toString()];

            function tE(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : tM(e)) === "object" && "$$typeof" in e && e.$$typeof === tN && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : tM(t)) === "object" && null !== t && "then" in t
            }
            var tT = ((e = ti.forwardRef(function(e, t) {
                    var r = e.children,
                        n = tS(e, ["children"]);
                    if (tE(r) && "function" == typeof tP && (r = tP(r._payload)), ti.isValidElement(r)) {
                        var i, o, a, l, u, c = (u = (l = null == (o = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (u = (l = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                            s = function(e, t) {
                                var r = tj({}, t);
                                for (var n in t) ! function(n) {
                                    var i = e[n],
                                        o = t[n];
                                    /^on[A-Z]/.test(n) ? i && o ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = o.apply(void 0, tI(t));
                                        return i.apply(void 0, tI(t)), n
                                    } : i && (r[n] = i) : "style" === n ? r[n] = tj({}, i, o) : "className" === n && (r[n] = [i, o].filter(Boolean).join(" "))
                                }(n);
                                return tj({}, e, r)
                            }(n, r.props);
                        return r.type !== ti.Fragment && (s.ref = t ? tv(t, c) : c), ti.cloneElement(r, s)
                    }
                    return ti.Children.count(r) > 1 ? ti.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), i = e, (o = ti.forwardRef(function(e, t) {
                    var r = e.children,
                        n = tS(e, ["children"]);
                    tE(r) && "function" == typeof tP && (r = tP(r._payload));
                    var o = ti.Children.toArray(r),
                        a = o.find(tA);
                    if (a) {
                        var l = a.props.children,
                            u = o.map(function(e) {
                                return e !== a ? e : ti.Children.count(l) > 1 ? ti.Children.only(null) : ti.isValidElement(l) ? l.props.children : null
                            });
                        return (0, I.jsx)(i, tO(tj({}, n), {
                            ref: t,
                            children: ti.isValidElement(l) ? ti.cloneElement(l, void 0, u) : null
                        }))
                    }
                    return (0, I.jsx)(i, tO(tj({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), o),
                tD = Symbol("radix.slottable");

            function tA(e) {
                return ti.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === tD
            }

            function tL(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tC(e) {
                if (Array.isArray(e)) return e
            }

            function tR() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
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

            function tU(e, t) {
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

            function t_(e, t) {
                if (e) {
                    if ("string" == typeof e) return tL(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tL(e, t)
                }
            }
            var tB = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                tY = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                tF = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                tG = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                tW = (0, ti.forwardRef)(function(e, t) {
                    var r, n = tC(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || t_(r) || tR(),
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
                        y = i.size,
                        m = void 0 === y ? "Large" : y,
                        b = i.variant,
                        h = void 0 === b ? "Emphasis" : b,
                        g = i.asChild,
                        v = tz(i, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        w = (tC(o) || function(e) {
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
                        }(o) || t_(o, 1) || tR())[0],
                        x = ta("foundation-web-button", s ? tm : [tp, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", tY[m], s ? tG[h] : tF[h], l),
                        j = tk({
                            textDecoration: "none"
                        }, u),
                        O = function(e) {
                            return to().createElement(to().Fragment, null, to().createElement(ty, null), f && to().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, to().createElement(tb, {
                                width: tB[m],
                                height: tB[m]
                            })), to().createElement("span", {
                                className: ta("flex items-center min-width-0", "Large" === m || "Medium" === m ? "gap-small" : "gap-xsmall", f && "invisible")
                            }, p && to().createElement(tf, {
                                name: p,
                                size: m
                            }), to().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (g) {
                        v.as;
                        var S = tz(v, ["as"]),
                            I = to().Children.only(a);
                        return to().createElement(tT, tU(tk({
                            ref: w
                        }, S), {
                            className: x,
                            style: j,
                            "aria-disabled": s || void 0
                        }), to().cloneElement(I, {}, O(I.props.children)))
                    }
                    if ("a" === v.as) {
                        v.as;
                        var M = v.href,
                            N = tz(v, ["as", "href"]);
                        return to().createElement("a", tU(tk({
                            ref: w
                        }, N), {
                            "aria-disabled": s,
                            href: s ? void 0 : M,
                            className: x,
                            style: j
                        }), O(a))
                    }
                    v.as;
                    var P = tz(v, ["as"]);
                    return to().createElement("button", tU(tk({
                        ref: w,
                        type: "button"
                    }, P), {
                        disabled: s,
                        className: x,
                        style: j
                    }), O(a))
                }),
                tV = function() {
                    var e = (0, M.useTranslation)().translate,
                        t = (0, ti.useCallback)(function() {
                            window.history.back()
                        }, []);
                    return (0, I.jsxs)("div", {
                        className: "height-[210px] gap-y-small margin-top-[240px] flex flex-col items-center",
                        children: [(0, I.jsx)(tf, {
                            className: "content-muted !size-1400",
                            name: "icon-regular-triangle-exclamation"
                        }), (0, I.jsx)("p", {
                            className: "text-heading-small",
                            children: e("Message.Error.Generic")
                        }), (0, I.jsxs)("div", {
                            className: "gap-x-medium padding-top-medium flex",
                            children: [(0, I.jsx)(tW, {
                                className: "min-width-[96px]",
                                size: "Small",
                                variant: "SoftEmphasis",
                                onClick: t,
                                children: e("Action.Back")
                            }), (0, I.jsx)(tW, {
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
                if (e) {
                    if ("string" == typeof e) return tQ(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tQ(e, t)
                }
            }
            var tZ = (0, ti.createContext)(null),
                t$ = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-medium"
                },
                tJ = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                t0 = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                t1 = (0, ti.forwardRef)(function(e, t) {
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
                        y = e.onSelect,
                        m = e.className,
                        b = void 0 === s && void 0 === d && void 0 === o && void 0 === n;
                    if ((void 0 !== u || void 0 !== c) && !b) throw Error('ListItem: Cannot use deprecated "text" or "isMultiline" props with "metadata", "description", "alignment", or "size".');
                    var h = null != n ? n : "Large",
                        g = void 0 !== y,
                        v = g ? "button" : "div",
                        w = !!b && c,
                        x = "Top" === o ? "justify-start" : "justify-center";
                    w && (x = "justify-start");
                    var j = to().createElement(v, tH({
                            className: ta("bg-none width-full flex gap-medium stroke-none foundation-web-list-item padding-y-none", r ? "padding-x-medium" : "padding-x-xlarge", "Full" === i && "foundation-web-list-item-bottom-divider", g && "relative clip group/interactable focus-visible:outline-focus disabled:outline-none", g && "cursor-pointer", m)
                        }, g && {
                            onClick: function() {
                                return y()
                            }
                        }), g && to().createElement(ty, null), f && to().createElement("div", {
                            className: ta("flex flex-col padding-y-large", x)
                        }, f), to().createElement("div", {
                            className: "flex fill clip-x padding-y-large gap-x-medium relative "
                        }, to().createElement("div", {
                            className: ta("flex flex-col fill clip-x justify-center", w && "gap-xsmall")
                        }, a && to().createElement("div", {
                            className: ta("content-emphasis text-align-x-start", void 0 === l || l ? tJ[h] : t0[h])
                        }, a), b && u && to().createElement("div", {
                            className: ta("content-default text-align-x-start", t$[h], !c && "text-truncate-split text-no-wrap")
                        }, u), !b && s && to().createElement("div", {
                            className: ta("content-default text-align-x-start text-truncate-split text-no-wrap", t$[h])
                        }, s), !b && d && to().createElement("div", {
                            className: ta("content-default text-align-x-start padding-top-xsmall", t$[h])
                        }, d)), p && to().createElement("div", {
                            className: ta("flex flex-col", x)
                        }, p), "Inset" === i && to().createElement("div", {
                            className: "foundation-web-list-item-inset-divider"
                        }))),
                        O = (0, ti.useMemo)(function() {
                            return {
                                size: h
                            }
                        }, [h]);
                    return to().createElement("li", {
                        ref: t,
                        style: {
                            listStyle: "none"
                        }
                    }, to().createElement(tZ.Provider, {
                        value: O
                    }, j))
                });
            t1.displayName = "ListItem";
            var t2 = (0, ti.forwardRef)(function(e, t) {
                var r, n = tq(r = [e, t]) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(r) || tX(r) || tK(),
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
                    s = (tq(o) || function(e) {
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
                    }(o) || tX(o, 1) || tK())[0];
                return to().createElement(void 0 === u ? "ul" : u, tH({
                    ref: s,
                    className: ta("foundation-web-list", l)
                }, c), a)
            });
            t2.displayName = "List";
            var t4 = "height-full min-width-0 grow-1 gap-x-large radius-medium !bg-surface-100 stroke-standard stroke-default padding-medium box-border flex items-center",
                t3 = function(e) {
                    var t = e.expandedPrimary,
                        r = e.expandedSecondary,
                        n = e.iconName,
                        i = e.onTileClick,
                        o = e.primary,
                        a = e.secondary,
                        l = (0, I.jsxs)(ti.Fragment, {
                            children: [(0, I.jsx)("div", {
                                className: "flex shrink-0 items-center justify-center",
                                children: (0, I.jsx)(tf, {
                                    name: n,
                                    size: "Large"
                                })
                            }), (0, I.jsxs)("div", {
                                className: "min-width-0 grow-1 gap-xsmall flex flex-col justify-center",
                                children: [(0, I.jsx)("div", {
                                    className: "text-title-medium content-emphasis text-align-x-start",
                                    children: o
                                }), (0, I.jsx)("div", {
                                    className: "text-body-medium content-default text-align-x-start",
                                    children: a
                                })]
                            })]
                        });
                    return (0, I.jsx)("li", {
                        className: "min-width-0 height-full flex list-none flex-col [list-style:none]",
                        children: null != i ? (0, I.jsx)("button", {
                            "aria-label": o,
                            className: "".concat(t4, " width-full text-align-x-start cursor-pointer font-[inherit]"),
                            type: "button",
                            onClick: function() {
                                i(t, r)
                            },
                            children: l
                        }) : (0, I.jsx)("div", {
                            className: t4,
                            children: l
                        })
                    })
                },
                t5 = function(e) {
                    var t = e.featureConfig,
                        r = e.overrideIconName,
                        n = e.onTileClick,
                        i = e.includeReferralBenefit,
                        o = (0, M.useTranslation)(),
                        a = o.translate,
                        l = o.intl,
                        u = (0, ti.useMemo)(function() {
                            var e;
                            return null == (e = t.virtualTransactionDiscounts) ? void 0 : e.find(function(e) {
                                return 0 === e.periodIndex
                            })
                        }, [t]),
                        c = (0, ti.useMemo)(function() {
                            var e;
                            return null == (e = t.virtualTransactionDiscounts) ? void 0 : e.filter(function(e) {
                                return e.periodIndex > 0
                            }).reduce(function(e, t) {
                                return null === e || t.periodIndex < e.periodIndex ? t : e
                            }, null)
                        }, [t]),
                        s = (0, ti.useMemo)(function() {
                            var e;
                            return null == (e = t.privateServerDiscounts) ? void 0 : e.find(function(e) {
                                return 0 === e.periodIndex
                            })
                        }, [t]);
                    return (0, I.jsxs)(t2, {
                        className: "width-full large:[grid-template-columns:repeat(2,minmax(0,1fr))] grid gap-x-[12px] gap-y-[12px] [grid-template-columns:minmax(0,1fr)]",
                        children: [u && (0, I.jsx)(t3, {
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
                        }), t.isAiBackgroundEnabled && (0, I.jsx)(t3, {
                            expandedPrimary: a("Description.Benefit.AvatarBackground"),
                            expandedSecondary: a("Description.Benefit.AvatarBackgroundSubtitle"),
                            iconName: null != r ? r : "icon-regular-image",
                            primary: a("Description.Benefit.AvatarBackground"),
                            secondary: a("Description.Benefit.AvatarBackgroundSubtitle"),
                            onTileClick: n
                        }), t.isAppThemesEnabled && (0, I.jsx)(t3, {
                            expandedPrimary: a("Description.Benefit.AppThemes"),
                            expandedSecondary: a("Description.Benefit.AppThemesSubtitle"),
                            iconName: null != r ? r : "icon-regular-paint-brush",
                            primary: a("Description.Benefit.AppThemes"),
                            secondary: a("Description.Benefit.AppThemesSubtitle"),
                            onTileClick: n
                        }), t.isProfileFrameEnabled && (0, I.jsx)(t3, {
                            expandedPrimary: a("Description.Benefit.ProfileFrames"),
                            expandedSecondary: a("Description.Benefit.ProfileFramesSubtitle"),
                            iconName: null != r ? r : "icon-regular-frame-expanded",
                            primary: a("Description.Benefit.ProfileFrames"),
                            secondary: a("Description.Benefit.ProfileFramesSubtitle"),
                            onTileClick: n
                        }), s && (0, I.jsx)(t3, {
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
                        }), t.isRobuxTransferEnabled && (0, I.jsx)(t3, {
                            expandedPrimary: a("Description.Benefit.RobuxTransfersExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.RobuxTransfersExpandedBody"),
                            iconName: null != r ? r : "icon-regular-robux",
                            primary: a("Description.Benefit.RobuxTransfers"),
                            secondary: a("Description.Benefit.RobuxTransfersSubtitle"),
                            onTileClick: n
                        }), t.isTradingEnabled && (0, I.jsx)(t3, {
                            expandedPrimary: a("Description.Benefit.TradeResellItemsExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.TradeResellItemsExpandedBody"),
                            iconName: null != r ? r : "icon-regular-hand-two-arrows-horizontal",
                            primary: a("Description.Benefit.TradeResellItems"),
                            secondary: a("Description.Benefit.TradeResellItemsSubtitle"),
                            onTileClick: n
                        }), t.isUgcPublishingEnabled && (0, I.jsx)(t3, {
                            expandedPrimary: a("Description.Benefit.PublishItemsExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.PublishItemsExpandedBody"),
                            iconName: null != r ? r : "icon-regular-arrow-up-from-landscape-rectangle",
                            primary: a("Description.Benefit.PublishItems"),
                            secondary: a("Description.Benefit.PublishItemsSubtitle"),
                            onTileClick: n
                        }), void 0 !== i && i && te() && (0, I.jsx)(t3, {
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
                t6 = function(e) {
                    var t = e.children;
                    return (0, I.jsx)("div", {
                        children: t
                    })
                },
                t8 = function() {
                    return (0, I.jsx)("div", {
                        className: "backdrop-texture width-full height-[210px] pointer-events-none absolute"
                    })
                },
                t7 = function() {
                    return (0, I.jsx)("div", {
                        className: "stroke-default stroke-standard self-stretch"
                    })
                };

            function t9(e) {
                var t = e.productTypeDetails.robloxSubscriptionProductDetails;
                if (!(null == t ? void 0 : t.featureConfig)) throw Error("featureConfig is missing on robloxSubscriptionProductDetails");
                return t.featureConfig
            }

            function re(e) {
                var t, r = e.productTypeDetails.robloxSubscriptionProductDetails,
                    n = null == r ? void 0 : r.featureConfig.currencySubscriptionConfig;
                return Math.floor((null != (t = null == n ? void 0 : n.entitledAmountMicros) ? t : 0) / 1e6)
            }

            function rt(e) {
                return e.eligibleOffers.find(function(e) {
                    return "FreeTrial" === e.offerType
                })
            }
            var rr = function(e) {
                var t = e.robloxSubscriptionProduct,
                    r = e.onDismiss,
                    n = (0, M.useTranslation)().translate,
                    i = (0, I.jsx)(tW, {
                        className: "width-full",
                        size: "Large",
                        variant: "Emphasis",
                        onClick: r,
                        children: n("Action.OK")
                    }),
                    o = (0, I.jsxs)("p", {
                        className: "text-body-small content-muted text-center",
                        children: [n("Description.FeatureAccessDisclaimer"), " ", (0, I.jsx)("a", {
                            className: "text-link",
                            href: "https://help.roblox.com/hc/articles/39143693116052-Understanding-Age-Checks-on-Roblox",
                            children: n("Action.ViewDetails")
                        })]
                    });
                return (0, I.jsxs)(ti.Fragment, {
                    children: [(0, I.jsx)(t8, {}), (0, I.jsx)("div", {
                        className: "flex flex-col items-center",
                        children: (0, I.jsxs)("div", {
                            className: "padding-x-xlarge content-emphasis gap-y-xxlarge width-full large:max-width-[730px] flex flex-col",
                            children: [(0, I.jsxs)("div", {
                                className: "gap-y-small large:items-center flex flex-col items-start",
                                children: [(0, I.jsxs)("div", {
                                    className: "gap-x-small flex items-center",
                                    children: [(0, I.jsx)(tf, {
                                        className: "!size-600",
                                        name: "icon-regular-roblox-plus"
                                    }), (0, I.jsx)("h1", {
                                        className: "text-heading-medium",
                                        children: n("Title.FreeTrialConfirmation")
                                    })]
                                }), (0, I.jsx)("p", {
                                    className: "text-body-large content-default",
                                    children: n("Description.FreeTrialConfirmation")
                                })]
                            }), (0, I.jsx)(t5, {
                                featureConfig: t9(t),
                                periodType: t.periodType
                            }), (0, I.jsx)(t6, {
                                children: (0, I.jsxs)("div", {
                                    className: "large:flex large:flex-col large:items-center width-full gap-y-medium hidden",
                                    "data-testid": "free-trial-action-inline",
                                    children: [i, o]
                                })
                            })]
                        })
                    }), (0, I.jsxs)("div", {
                        "aria-label": n("Action.OK"),
                        className: "bottom-dock padding-t-medium bg-surface-100 large:!hidden width-full gap-y-medium flex flex-col",
                        "data-testid": "free-trial-action-dock",
                        role: "region",
                        children: [(0, I.jsx)(t7, {}), (0, I.jsxs)("div", {
                            className: "width-full gap-y-medium padding-b-[env(safe-area-inset-bottom\\,0px)] padding-x-xxlarge flex flex-col items-stretch",
                            children: [i, o]
                        })]
                    })]
                })
            };

            function rn(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ri(e) {
                if (Array.isArray(e)) return e
            }

            function ro() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ra(e, t) {
                if (e) {
                    if ("string" == typeof e) return rn(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rn(e, t)
                }
            }
            var rl = {
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
                ru = to().forwardRef(function(e, t) {
                    var r, n = ri(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || ra(r) || ro(),
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
                        y = function(e, t) {
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
                        m = (ri(o) || function(e) {
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
                        }(o) || ra(o, 1) || ro())[0],
                        b = rl[u],
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
                    return to().createElement("div", function(e) {
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
                        ref: m,
                        className: ta("foundation-web-progress-circle inline-flex items-center justify-center", a),
                        role: "progressbar",
                        "aria-label": p,
                        "aria-valuemin": M ? 0 : void 0,
                        "aria-valuemax": M ? 100 : void 0,
                        "aria-valuenow": M ? S : void 0,
                        style: {
                            width: I,
                            height: I
                        }
                    }, y), to().createElement("svg", {
                        width: h,
                        height: h,
                        viewBox: "0 0 ".concat(h, " ").concat(h),
                        className: "relative"
                    }, to().createElement("circle", {
                        cx: O,
                        cy: O,
                        r: x,
                        fill: "none",
                        strokeWidth: g,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), to().createElement("circle", {
                        cx: O,
                        cy: O,
                        r: x,
                        fill: "none",
                        strokeWidth: g,
                        strokeDasharray: M ? j : "".concat(.75 * j, " ").concat(.25 * j),
                        strokeDashoffset: M ? j * (1 - S / 100) : 0,
                        strokeLinecap: "round",
                        className: ta(!M && "foundation-web-progress-circle-indeterminate"),
                        style: M ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), M && f && "Large" === u && to().createElement("div", {
                        className: ta("absolute content-emphasis flex items-center justify-center", v),
                        "aria-hidden": "true"
                    }, to().createElement("span", null, Math.round(S)), to().createElement("span", null, "%")))
                });
            ru.displayName = "ProgressCircle";
            var rc = function() {
                    var e = (0, M.useTranslation)().translate;
                    return (0, I.jsx)("div", {
                        className: "margin-top-[240px] flex flex-col items-center",
                        children: (0, I.jsx)(ru, {
                            ariaLabel: e("Label.Loading"),
                            size: "Medium",
                            variant: "Indeterminate"
                        })
                    })
                },
                rs = window.Roblox["core-scripts"].meta.user,
                rd = 0,
                rf = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        t = (0, ti.useRef)();
                    return t.current || (rd += 1, t.current = "".concat(e).concat(rd)), t.current
                };

            function rp(e) {
                var t = e.className;
                return to().createElement("svg", {
                    xmlns: "http://www.w3.org/2000/svg",
                    width: "13",
                    height: "6",
                    viewBox: "0 0 13 6",
                    fill: "none",
                    className: ta("block", t),
                    style: {
                        marginTop: -1
                    }
                }, to().createElement("path", {
                    d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
                    fill: "currentColor"
                }))
            }

            function ry(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    i = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === i || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function rm(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rb(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function rh() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = rb(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : rb(t[e], null)
                        }
                    }
                }
            }

            function rg() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return ti.useCallback(rh.apply(void 0, function(e) {
                    if (Array.isArray(e)) return rm(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return rm(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rm(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function rv(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rw(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function rx(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        rw(e, t, r[t])
                    })
                }
                return e
            }

            function rj(e) {
                return function(e) {
                    if (Array.isArray(e)) return rv(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return rv(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rv(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rO(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    n = function() {
                        var t = r.map(function(e) {
                            return ti.createContext(e)
                        });
                        return function(r) {
                            var n = (null == r ? void 0 : r[e]) || t;
                            return ti.useMemo(function() {
                                var t, i;
                                return rw({}, "__scope".concat(e), (t = rx({}, r), i = null != (i = rw({}, e, n)) ? i : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(i)) : (function(e) {
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
                    var i = ti.createContext(n),
                        o = r.length;
                    r = rj(r).concat([n]);
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
                            c = ti.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, I.jsx)(u.Provider, {
                            value: c,
                            children: a
                        })
                    };
                    return a.displayName = t + "Provider", [a, function(r, a) {
                        var l, u = (null == a || null == (l = a[e]) ? void 0 : l[o]) || i,
                            c = ti.useContext(u);
                        if (c) return c;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, rS.apply(void 0, [n].concat(rj(t)))]
            }

            function rS() {
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
                            return rx({}, e, n(t)["__scope".concat(i)])
                        }, {});
                        return ti.useMemo(function() {
                            return rw({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return i.scopeName = n.scopeName, i
            }
            var rI = window.RadixUI["react-dismissable-layer"],
                rM = (null == (x = globalThis) ? void 0 : x.document) ? ti.useLayoutEffect : function() {};

            function rN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var rP = ti["useId".toString()] || function() {},
                rE = 0,
                rT = ["top", "right", "bottom", "left"],
                rD = Math.min,
                rA = Math.max,
                rL = Math.round,
                rC = Math.floor,
                rR = function(e) {
                    return {
                        x: e,
                        y: e
                    }
                },
                rk = {
                    left: "right",
                    right: "left",
                    bottom: "top",
                    top: "bottom"
                },
                rU = {
                    start: "end",
                    end: "start"
                };

            function rz(e, t) {
                return "function" == typeof e ? e(t) : e
            }

            function r_(e) {
                return e.split("-")[0]
            }

            function rB(e) {
                return e.split("-")[1]
            }

            function rY(e) {
                return "x" === e ? "y" : "x"
            }

            function rF(e) {
                return "y" === e ? "height" : "width"
            }
            var rG = new Set(["top", "bottom"]);

            function rW(e) {
                return rG.has(r_(e)) ? "y" : "x"
            }

            function rV(e) {
                return e.replace(/start|end/g, function(e) {
                    return rU[e]
                })
            }
            var rQ = ["left", "right"],
                rq = ["right", "left"],
                rK = ["top", "bottom"],
                rH = ["bottom", "top"];

            function rX(e) {
                return e.replace(/left|right|bottom|top/g, function(e) {
                    return rk[e]
                })
            }

            function rZ(e) {
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

            function r$(e) {
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

            function rJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function r0(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function r1(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var o = e.apply(t, r);

                        function a(e) {
                            r0(o, n, i, a, l, "next", e)
                        }

                        function l(e) {
                            r0(o, n, i, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function r2(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function r4(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        r2(e, t, r[t])
                    })
                }
                return e
            }

            function r3(e, t) {
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

            function r5(e, t) {
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

            function r6(e) {
                return function(e) {
                    if (Array.isArray(e)) return rJ(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return rJ(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rJ(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function r8(e, t) {
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

            function r7(e, t, r) {
                var n, i = e.reference,
                    o = e.floating,
                    a = rW(t),
                    l = rY(rW(t)),
                    u = rF(l),
                    c = r_(t),
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
                switch (rB(t)) {
                    case "start":
                        n[l] -= p * (r && s ? -1 : 1);
                        break;
                    case "end":
                        n[l] += p * (r && s ? -1 : 1)
                }
                return n
            }

            function r9(e, t) {
                return r1(function() {
                    var r, n, i, o, a, l, u, c, s, d, f, p, y, m, b, h, g, v, w, x, j, O, S, I, M, N, P, E, T, D, A;
                    return r8(this, function(L) {
                        switch (L.label) {
                            case 0:
                                return void 0 === t && (t = {}), n = e.x, i = e.y, o = e.platform, a = e.rects, l = e.elements, u = e.strategy, d = void 0 === (s = (c = rz(t, e)).boundary) ? "clippingAncestors" : s, p = void 0 === (f = c.rootBoundary) ? "viewport" : f, m = void 0 === (y = c.elementContext) ? "floating" : y, h = void 0 !== (b = c.altBoundary) && b, v = rZ(void 0 === (g = c.padding) ? 0 : g), w = "floating" === m ? "reference" : "floating", x = l[h ? w : m], O = o.getClippingRect, S = {}, [4, null == o.isElement ? void 0 : o.isElement(x)];
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
                                return j = r$.apply(void 0, [L.sent()]), N = "floating" === m ? {
                                    x: n,
                                    y: i,
                                    width: a.floating.width,
                                    height: a.floating.height
                                } : a.reference, [4, null == o.getOffsetParent ? void 0 : o.getOffsetParent(l.floating)];
                            case 7:
                                return P = L.sent(), [4, null == o.isElement ? void 0 : o.isElement(P)];
                            case 8:
                                if (!L.sent()) return [3, 10];
                                return [4, null == o.getScale ? void 0 : o.getScale(P)];
                            case 9:
                                return T = L.sent() || {
                                    x: 1,
                                    y: 1
                                }, [3, 11];
                            case 10:
                                T = {
                                    x: 1,
                                    y: 1
                                }, L.label = 11;
                            case 11:
                                if (E = T, !o.convertOffsetParentRelativeRectToViewportRelativeRect) return [3, 13];
                                return [4, o.convertOffsetParentRelativeRectToViewportRelativeRect({
                                    elements: l,
                                    rect: N,
                                    offsetParent: P,
                                    strategy: u
                                })];
                            case 12:
                                return A = L.sent(), [3, 14];
                            case 13:
                                A = N, L.label = 14;
                            case 14:
                                return D = r$.apply(void 0, [A]), [2, {
                                    top: (j.top - D.top + v.top) / E.y,
                                    bottom: (D.bottom - j.bottom + v.bottom) / E.y,
                                    left: (j.left - D.left + v.left) / E.x,
                                    right: (D.right - j.right + v.right) / E.x
                                }]
                        }
                    })
                })()
            }

            function ne(e, t) {
                return {
                    top: e.top - t.height,
                    right: e.right - t.width,
                    bottom: e.bottom - t.height,
                    left: e.left - t.width
                }
            }

            function nt(e) {
                return rT.some(function(t) {
                    return e[t] >= 0
                })
            }
            var nr = new Set(["left", "top"]);

            function nn(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function ni() {
                return "u" > typeof window
            }

            function no(e) {
                return nu(e) ? (e.nodeName || "").toLowerCase() : "#document"
            }

            function na(e) {
                var t;
                return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
            }

            function nl(e) {
                var t;
                return null == (t = (nu(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
            }

            function nu(e) {
                return !!ni() && (nn(e, Node) || nn(e, na(e).Node))
            }

            function nc(e) {
                return !!ni() && (nn(e, Element) || nn(e, na(e).Element))
            }

            function ns(e) {
                return !!ni() && (nn(e, HTMLElement) || nn(e, na(e).HTMLElement))
            }

            function nd(e) {
                return !(!ni() || "u" < typeof ShadowRoot) && (nn(e, ShadowRoot) || nn(e, na(e).ShadowRoot))
            }
            var nf = new Set(["inline", "contents"]);

            function np(e) {
                var t = nS(e),
                    r = t.overflow,
                    n = t.overflowX,
                    i = t.overflowY,
                    o = t.display;
                return /auto|scroll|overlay|hidden|clip/.test(r + i + n) && !nf.has(o)
            }
            var ny = new Set(["table", "td", "th"]),
                nm = [":popover-open", ":modal"];

            function nb(e) {
                return nm.some(function(t) {
                    try {
                        return e.matches(t)
                    } catch (e) {
                        return !1
                    }
                })
            }
            var nh = ["transform", "translate", "scale", "rotate", "perspective"],
                ng = ["transform", "translate", "scale", "rotate", "perspective", "filter"],
                nv = ["paint", "layout", "strict", "content"];

            function nw(e) {
                var t = nx(),
                    r = nc(e) ? nS(e) : e;
                return nh.some(function(e) {
                    return !!r[e] && "none" !== r[e]
                }) || !!r.containerType && "normal" !== r.containerType || !t && !!r.backdropFilter && "none" !== r.backdropFilter || !t && !!r.filter && "none" !== r.filter || ng.some(function(e) {
                    return (r.willChange || "").includes(e)
                }) || nv.some(function(e) {
                    return (r.contain || "").includes(e)
                })
            }

            function nx() {
                return !("u" < typeof CSS) && !!CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")
            }
            var nj = new Set(["html", "body", "#document"]);

            function nO(e) {
                return nj.has(no(e))
            }

            function nS(e) {
                return na(e).getComputedStyle(e)
            }

            function nI(e) {
                return nc(e) ? {
                    scrollLeft: e.scrollLeft,
                    scrollTop: e.scrollTop
                } : {
                    scrollLeft: e.scrollX,
                    scrollTop: e.scrollY
                }
            }

            function nM(e) {
                if ("html" === no(e)) return e;
                var t = e.assignedSlot || e.parentNode || nd(e) && e.host || nl(e);
                return nd(t) ? t.host : t
            }

            function nN(e, t, r) {
                void 0 === t && (t = []), void 0 === r && (r = !0);
                var n, i = function e(t) {
                        var r = nM(t);
                        return nO(r) ? t.ownerDocument ? t.ownerDocument.body : t.body : ns(r) && np(r) ? r : e(r)
                    }(e),
                    o = i === (null == (n = e.ownerDocument) ? void 0 : n.body),
                    a = na(i);
                if (o) {
                    var l = nP(a);
                    return t.concat(a, a.visualViewport || [], np(i) ? i : [], l && r ? nN(l) : [])
                }
                return t.concat(i, nN(i, [], r))
            }

            function nP(e) {
                return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
            }

            function nE(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nT(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function nD(e) {
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

            function nA(e, t) {
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

            function nL(e) {
                return function(e) {
                    if (Array.isArray(e)) return nE(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || nC(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nC(e, t) {
                if (e) {
                    if ("string" == typeof e) return nE(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nE(e, t)
                }
            }

            function nR(e) {
                var t = nS(e),
                    r = parseFloat(t.width) || 0,
                    n = parseFloat(t.height) || 0,
                    i = ns(e),
                    o = i ? e.offsetWidth : r,
                    a = i ? e.offsetHeight : n,
                    l = rL(r) !== o || rL(n) !== a;
                return l && (r = o, n = a), {
                    width: r,
                    height: n,
                    $: l
                }
            }

            function nk(e) {
                return nc(e) ? e : e.contextElement
            }

            function nU(e) {
                var t = nk(e);
                if (!ns(t)) return rR(1);
                var r = t.getBoundingClientRect(),
                    n = nR(t),
                    i = n.width,
                    o = n.height,
                    a = n.$,
                    l = (a ? rL(r.width) : r.width) / i,
                    u = (a ? rL(r.height) : r.height) / o;
                return l && Number.isFinite(l) || (l = 1), u && Number.isFinite(u) || (u = 1), {
                    x: l,
                    y: u
                }
            }
            var nz = rR(0);

            function n_(e) {
                var t = na(e);
                return nx() && t.visualViewport ? {
                    x: t.visualViewport.offsetLeft,
                    y: t.visualViewport.offsetTop
                } : nz
            }

            function nB(e, t, r, n) {
                void 0 === t && (t = !1), void 0 === r && (r = !1);
                var i, o = e.getBoundingClientRect(),
                    a = nk(e),
                    l = rR(1);
                t && (n ? nc(n) && (l = nU(n)) : l = nU(e));
                var u = (void 0 === (i = r) && (i = !1), n && (!i || n === na(a)) && i) ? n_(a) : rR(0),
                    c = (o.left + u.x) / l.x,
                    s = (o.top + u.y) / l.y,
                    d = o.width / l.x,
                    f = o.height / l.y;
                if (a)
                    for (var p = na(a), y = n && nc(n) ? na(n) : n, m = p, b = nP(m); b && n && y !== m;) {
                        var h = nU(b),
                            g = b.getBoundingClientRect(),
                            v = nS(b),
                            w = g.left + (b.clientLeft + parseFloat(v.paddingLeft)) * h.x,
                            x = g.top + (b.clientTop + parseFloat(v.paddingTop)) * h.y;
                        c *= h.x, s *= h.y, d *= h.x, f *= h.y, c += w, s += x, b = nP(m = na(b))
                    }
                return r$({
                    width: d,
                    height: f,
                    x: c,
                    y: s
                })
            }

            function nY(e, t) {
                var r = nI(e).scrollLeft;
                return t ? t.left + r : nB(nl(e)).left + r
            }

            function nF(e, t) {
                var r = e.getBoundingClientRect();
                return {
                    x: r.left + t.scrollLeft - nY(e, r),
                    y: r.top + t.scrollTop
                }
            }
            var nG = new Set(["absolute", "fixed"]);

            function nW(e, t, r) {
                if ("viewport" === t) n = function(e, t) {
                    var r = na(e),
                        n = nl(e),
                        i = r.visualViewport,
                        o = n.clientWidth,
                        a = n.clientHeight,
                        l = 0,
                        u = 0;
                    if (i) {
                        o = i.width, a = i.height;
                        var c = nx();
                        (!c || c && "fixed" === t) && (l = i.offsetLeft, u = i.offsetTop)
                    }
                    var s = nY(n);
                    if (s <= 0) {
                        var d = n.ownerDocument,
                            f = d.body,
                            p = getComputedStyle(f),
                            y = "CSS1Compat" === d.compatMode && parseFloat(p.marginLeft) + parseFloat(p.marginRight) || 0,
                            m = Math.abs(n.clientWidth - f.clientWidth - y);
                        m <= 25 && (o -= m)
                    } else s <= 25 && (o += s);
                    return {
                        width: o,
                        height: a,
                        x: l,
                        y: u
                    }
                }(e, r);
                else if ("document" === t) i = nl(e), o = nl(i), a = nI(i), l = i.ownerDocument.body, u = rA(o.scrollWidth, o.clientWidth, l.scrollWidth, l.clientWidth), c = rA(o.scrollHeight, o.clientHeight, l.scrollHeight, l.clientHeight), s = -a.scrollLeft + nY(i), d = -a.scrollTop, "rtl" === nS(l).direction && (s += rA(o.clientWidth, l.clientWidth) - u), n = {
                    width: u,
                    height: c,
                    x: s,
                    y: d
                };
                else if (nc(t)) p = (f = nB(t, !0, "fixed" === r)).top + t.clientTop, y = f.left + t.clientLeft, m = ns(t) ? nU(t) : rR(1), n = {
                    width: t.clientWidth * m.x,
                    height: t.clientHeight * m.y,
                    x: y * m.x,
                    y: p * m.y
                };
                else {
                    var n, i, o, a, l, u, c, s, d, f, p, y, m, b = n_(e);
                    n = {
                        x: t.x - b.x,
                        y: t.y - b.y,
                        width: t.width,
                        height: t.height
                    }
                }
                return r$(n)
            }

            function nV(e, t, r) {
                var n = ns(t),
                    i = nl(t),
                    o = "fixed" === r,
                    a = nB(e, !0, o, t),
                    l = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    u = rR(0);
                if (n || !n && !o)
                    if (("body" !== no(t) || np(i)) && (l = nI(t)), n) {
                        var c = nB(t, !0, o, t);
                        u.x = c.x + t.clientLeft, u.y = c.y + t.clientTop
                    } else i && (u.x = nY(i));
                o && !n && i && (u.x = nY(i));
                var s = !i || n || o ? rR(0) : nF(i, l);
                return {
                    x: a.left + l.scrollLeft - u.x - s.x,
                    y: a.top + l.scrollTop - u.y - s.y,
                    width: a.width,
                    height: a.height
                }
            }

            function nQ(e) {
                return "static" === nS(e).position
            }

            function nq(e, t) {
                if (!ns(e) || "fixed" === nS(e).position) return null;
                if (t) return t(e);
                var r = e.offsetParent;
                return nl(e) === r && (r = r.ownerDocument.body), r
            }

            function nK(e, t) {
                var r, n = na(e);
                if (nb(e)) return n;
                if (!ns(e)) {
                    for (var i = nM(e); i && !nO(i);) {
                        if (nc(i) && !nQ(i)) return i;
                        i = nM(i)
                    }
                    return n
                }
                for (var o = nq(e, t); o && (r = o, ny.has(no(r))) && nQ(o);) o = nq(o, t);
                return o && nO(o) && nQ(o) && !nw(o) ? n : o || function(e) {
                    for (var t = nM(e); ns(t) && !nO(t);) {
                        if (nw(t)) return t;
                        if (nb(t)) break;
                        t = nM(t)
                    }
                    return null
                }(e) || n
            }
            var nH = {
                convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
                    var t = e.elements,
                        r = e.rect,
                        n = e.offsetParent,
                        i = "fixed" === e.strategy,
                        o = nl(n),
                        a = !!t && nb(t.floating);
                    if (n === o || a && i) return r;
                    var l = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        u = rR(1),
                        c = rR(0),
                        s = ns(n);
                    if ((s || !s && !i) && (("body" !== no(n) || np(o)) && (l = nI(n)), ns(n))) {
                        var d = nB(n);
                        u = nU(n), c.x = d.x + n.clientLeft, c.y = d.y + n.clientTop
                    }
                    var f = !o || s || i ? rR(0) : nF(o, l);
                    return {
                        width: r.width * u.x,
                        height: r.height * u.y,
                        x: r.x * u.x - l.scrollLeft * u.x + c.x + f.x,
                        y: r.y * u.y - l.scrollTop * u.y + c.y + f.y
                    }
                },
                getDocumentElement: nl,
                getClippingRect: function(e) {
                    var t = e.element,
                        r = e.boundary,
                        n = e.rootBoundary,
                        i = e.strategy,
                        o = nL("clippingAncestors" === r ? nb(t) ? [] : function(e, t) {
                            var r = t.get(e);
                            if (r) return r;
                            for (var n = nN(e, [], !1).filter(function(e) {
                                    return nc(e) && "body" !== no(e)
                                }), i = null, o = "fixed" === nS(e).position, a = o ? nM(e) : e; nc(a) && !nO(a);) {
                                var l = nS(a),
                                    u = nw(a);
                                u || "fixed" !== l.position || (i = null), (o ? !u && !i : !u && "static" === l.position && !!i && nG.has(i.position) || np(a) && !u && function e(t, r) {
                                    var n = nM(t);
                                    return !(n === r || !nc(n) || nO(n)) && ("fixed" === nS(n).position || e(n, r))
                                }(e, a)) ? n = n.filter(function(e) {
                                    return e !== a
                                }) : i = l, a = nM(a)
                            }
                            return t.set(e, n), n
                        }(t, this._c) : [].concat(r)).concat([n]),
                        a = o[0],
                        l = o.reduce(function(e, r) {
                            var n = nW(t, r, i);
                            return e.top = rA(n.top, e.top), e.right = rD(n.right, e.right), e.bottom = rD(n.bottom, e.bottom), e.left = rA(n.left, e.left), e
                        }, nW(t, a, i));
                    return {
                        width: l.right - l.left,
                        height: l.bottom - l.top,
                        x: l.left,
                        y: l.top
                    }
                },
                getOffsetParent: nK,
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
                                    return t = this.getOffsetParent || nK, [4, (0, this.getDimensions)(e.floating)];
                                case 1:
                                    return r = o.sent(), n = {}, i = [e.reference], [4, t(e.floating)];
                                case 2:
                                    return [2, (n.reference = nV.apply(void 0, i.concat([o.sent(), e.strategy])), n.floating = {
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
                                nT(o, n, i, a, l, "next", e)
                            }

                            function l(e) {
                                nT(o, n, i, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    }).call(this)
                },
                getClientRects: function(e) {
                    return Array.from(e.getClientRects())
                },
                getDimensions: function(e) {
                    var t = nR(e);
                    return {
                        width: t.width,
                        height: t.height
                    }
                },
                getScale: nU,
                isElement: nc,
                isRTL: function(e) {
                    return "rtl" === nS(e).direction
                }
            };

            function nX(e, t) {
                return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
            }

            function nZ(e, t, r, n) {
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
                    y = void 0 !== p && p,
                    m = nk(e),
                    b = a || u ? nL(m ? nN(m) : []).concat(nL(nN(t))) : [];
                b.forEach(function(e) {
                    a && e.addEventListener("scroll", r, {
                        passive: !0
                    }), u && e.addEventListener("resize", r)
                });
                var h = m && f ? function(e, t) {
                        var r, n = null,
                            i = nl(e);

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
                                var y = {
                                        rootMargin: -rC(d) + "px " + -rC(i.clientWidth - (s + f)) + "px " + -rC(i.clientHeight - (d + p)) + "px " + -rC(s) + "px",
                                        threshold: rA(0, rD(1, u)) || 1
                                    },
                                    m = !0;
                                try {
                                    n = new IntersectionObserver(b, nA(nD({}, y), {
                                        root: i.ownerDocument
                                    }))
                                } catch (e) {
                                    n = new IntersectionObserver(b, y)
                                }
                                n.observe(e)
                            }

                            function b(t) {
                                var n = t[0].intersectionRatio;
                                if (n !== u) {
                                    if (!m) return a();
                                    n ? a(!1, n) : r = setTimeout(function() {
                                        a(!1, 1e-7)
                                    }, 1e3)
                                }
                                1 !== n || nX(c, e.getBoundingClientRect()) || a(), m = !1
                            }
                        }(!0), o
                    }(m, r) : null,
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
                    }(e) || nC(e, 1) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())[0];
                    n && n.target === m && v && (v.unobserve(t), cancelAnimationFrame(g), g = requestAnimationFrame(function() {
                        var e;
                        null == (e = v) || e.observe(t)
                    })), r()
                }), m && !y && v.observe(m), v.observe(t));
                var w = y ? nB(e) : null;
                return y && function t() {
                        var n = nB(e);
                        w && !nX(w, n) && r(), w = n, i = requestAnimationFrame(t)
                    }(), r(),
                    function() {
                        var e;
                        b.forEach(function(e) {
                            a && e.removeEventListener("scroll", r), u && e.removeEventListener("resize", r)
                        }), null == h || h(), null == (e = v) || e.disconnect(), v = null, y && cancelAnimationFrame(i)
                    }
            }
            var n$ = function(e) {
                    return {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            return r1(function() {
                                var r, n, i, o, a, l, u, c, s, d, f, p, y, m, b, h, g, v, w, x, j, O, S, I, M, N, P, E, T, D, A, L, C, R, k, U, z;
                                return r8(this, function(_) {
                                    switch (_.label) {
                                        case 0:
                                            if (r = t.x, n = t.y, i = t.placement, o = t.rects, a = t.platform, l = t.elements, u = t.middlewareData, s = (c = rz(e, t) || {}).element, f = void 0 === (d = c.padding) ? 0 : d, null == s) return [2, {}];
                                            return p = rZ(f), y = {
                                                x: r,
                                                y: n
                                            }, b = rF(m = rY(rW(i))), [4, a.getDimensions(s)];
                                        case 1:
                                            return h = _.sent(), v = (g = "y" === m) ? "top" : "left", w = g ? "bottom" : "right", x = g ? "clientHeight" : "clientWidth", j = o.reference[b] + o.reference[m] - y[m] - o.floating[b], O = y[m] - o.reference[m], [4, null == a.getOffsetParent ? void 0 : a.getOffsetParent(s)];
                                        case 2:
                                            if (M = !(I = (S = _.sent()) ? S[x] : 0)) return [3, 4];
                                            return [4, null == a.isElement ? void 0 : a.isElement(S)];
                                        case 3:
                                            M = !_.sent(), _.label = 4;
                                        case 4:
                                            return M && (I = l.floating[x] || o.floating[b]), N = j / 2 - O / 2, P = I / 2 - h[b] / 2 - 1, E = rD(p[v], P), T = rD(p[w], P), D = E, A = I - h[b] - T, C = rA(D, rD(L = I / 2 - h[b] / 2 + N, A)), k = (R = !u.arrow && null != rB(i) && L !== C && o.reference[b] / 2 - (L < D ? E : T) - h[b] / 2 < 0) ? L < D ? L - D : L - A : 0, [2, (r2(z = {}, m, y[m] + k), r2(z, "data", r4((r2(U = {}, m, C), r2(U, "centerOffset", L - C - k), U), R && {
                                                alignmentOffset: k
                                            })), r2(z, "reset", R), z)]
                                    }
                                })
                            })()
                        }
                    }
                },
                nJ = function(e, t, r) {
                    var n, i = new Map,
                        o = nD({
                            platform: nH
                        }, r),
                        a = nA(nD({}, o.platform), {
                            _c: i
                        });
                    return n = nA(nD({}, o), {
                        platform: a
                    }), r1(function() {
                        var r, i, o, a, l, u, c, s, d, f, p, y, m, b, h, g, v, w, x, j, O, S, I, M, N, P;
                        return r8(this, function(E) {
                            switch (E.label) {
                                case 0:
                                    return i = void 0 === (r = n.placement) ? "bottom" : r, a = void 0 === (o = n.strategy) ? "absolute" : o, u = void 0 === (l = n.middleware) ? [] : l, c = n.platform, s = u.filter(Boolean), [4, null == c.isRTL ? void 0 : c.isRTL(t)];
                                case 1:
                                    return d = E.sent(), [4, c.getElementRects({
                                        reference: e,
                                        floating: t,
                                        strategy: a
                                    })];
                                case 2:
                                    y = (p = r7(f = E.sent(), i, d)).x, m = p.y, b = i, h = {}, g = 0, v = 0, E.label = 3;
                                case 3:
                                    if (!(v < s.length)) return [3, 11];
                                    return x = (w = s[v]).name, [4, (0, w.fn)({
                                        x: y,
                                        y: m,
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
                                    var T;
                                    if (O = (j = E.sent()).x, S = j.y, I = j.data, M = j.reset, y = null != O ? O : y, m = null != S ? S : m, h = r3(r4({}, h), r2({}, x, r4({}, h[x], I))), !(M && g <= 50)) return [3, 10];
                                    if (g++, (void 0 === M ? "undefined" : (T = M) && "u" > typeof Symbol && T.constructor === Symbol ? "symbol" : typeof T) != "object") return [3, 9];
                                    if (M.placement && (b = M.placement), !M.rects) return [3, 8];
                                    if (!0 !== M.rects) return [3, 6];
                                    return [4, c.getElementRects({
                                        reference: e,
                                        floating: t,
                                        strategy: a
                                    })];
                                case 5:
                                    return N = E.sent(), [3, 7];
                                case 6:
                                    N = M.rects, E.label = 7;
                                case 7:
                                    f = N, E.label = 8;
                                case 8:
                                    y = (P = r7(f, b, d)).x, m = P.y, E.label = 9;
                                case 9:
                                    v = -1, E.label = 10;
                                case 10:
                                    return v++, [3, 3];
                                case 11:
                                    return [2, {
                                        x: y,
                                        y: m,
                                        placement: b,
                                        strategy: a,
                                        middlewareData: h
                                    }]
                            }
                        })
                    })()
                },
                n0 = window.ReactDOM,
                n1 = r.n(n0);

            function n2(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function n4(e) {
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

            function n3(e, t) {
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

            function n5(e, t) {
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
                        if ("string" == typeof e) return n2(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return n2(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function n6(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var n8 = "u" > typeof document ? ti.useLayoutEffect : function() {};

            function n7(e, t) {
                if (e === t) return !0;
                if ((void 0 === e ? "undefined" : n6(e)) !== (void 0 === t ? "undefined" : n6(t))) return !1;
                if ("function" == typeof e && e.toString() === t.toString()) return !0;
                if (e && t && (void 0 === e ? "undefined" : n6(e)) === "object") {
                    if (Array.isArray(e)) {
                        if ((r = e.length) !== t.length) return !1;
                        for (n = r; 0 != n--;)
                            if (!n7(e[n], t[n])) return !1;
                        return !0
                    }
                    if ((r = (i = Object.keys(e)).length) !== Object.keys(t).length) return !1;
                    for (n = r; 0 != n--;)
                        if (!({}).hasOwnProperty.call(t, i[n])) return !1;
                    for (n = r; 0 != n--;) {
                        var r, n, i, o = i[n];
                        if (("_owner" !== o || !e.$$typeof) && !n7(e[o], t[o])) return !1
                    }
                    return !0
                }
                return e != e && t != t
            }

            function n9(e) {
                return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
            }

            function ie(e, t) {
                var r = n9(e);
                return Math.round(t * r) / r
            }

            function it(e) {
                var t = ti.useRef(e);
                return n8(function() {
                    t.current = e
                }), t
            }
            var ir = function(e, t) {
                    var r;
                    return n3(n4({}, (void 0 === (r = e) && (r = 0), {
                        name: "offset",
                        options: r,
                        fn: function(e) {
                            return r1(function() {
                                var t, n, i, o, a, l, u;
                                return r8(this, function(c) {
                                    switch (c.label) {
                                        case 0:
                                            var s;
                                            return i = e.x, o = e.y, a = e.placement, l = e.middlewareData, [4, (s = r, r1(function() {
                                                var t, r, n, i, o, a, l, u, c, d, f, p, y, m;
                                                return r8(this, function(b) {
                                                    switch (b.label) {
                                                        case 0:
                                                            return t = e.placement, r = e.platform, n = e.elements, [4, null == r.isRTL ? void 0 : r.isRTL(n.floating)];
                                                        case 1:
                                                            return i = b.sent(), o = r_(t), a = rB(t), l = "y" === rW(t), u = nr.has(o) ? -1 : 1, c = i && l ? -1 : 1, p = (f = "number" == typeof(d = rz(s, e)) ? {
                                                                mainAxis: d,
                                                                crossAxis: 0,
                                                                alignmentAxis: null
                                                            } : {
                                                                mainAxis: d.mainAxis || 0,
                                                                crossAxis: d.crossAxis || 0,
                                                                alignmentAxis: d.alignmentAxis
                                                            }).mainAxis, y = f.crossAxis, m = f.alignmentAxis, a && "number" == typeof m && (y = "end" === a ? -1 * m : m), [2, l ? {
                                                                x: y * c,
                                                                y: p * u
                                                            } : {
                                                                x: p * u,
                                                                y: y * c
                                                            }]
                                                    }
                                                })
                                            })())];
                                        case 1:
                                            if (u = c.sent(), a === (null == (t = l.offset) ? void 0 : t.placement) && null != (n = l.arrow) && n.alignmentOffset) return [2, {}];
                                            return [2, {
                                                x: i + u.x,
                                                y: o + u.y,
                                                data: r3(r4({}, u), {
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
                ii = function(e, t) {
                    var r;
                    return n3(n4({}, (void 0 === (r = e) && (r = {}), {
                        name: "shift",
                        options: r,
                        fn: function(e) {
                            return r1(function() {
                                var t, n, i, o, a, l, u, c, s, d, f, p, y, m, b, h, g, v, w, x, j, O, S, I, M, N, P, E;
                                return r8(this, function(T) {
                                    switch (T.label) {
                                        case 0:
                                            return t = e.x, n = e.y, i = e.placement, l = void 0 === (a = (o = rz(r, e)).mainAxis) || a, c = void 0 !== (u = o.crossAxis) && u, d = void 0 === (s = o.limiter) ? {
                                                fn: function(e) {
                                                    return {
                                                        x: e.x,
                                                        y: e.y
                                                    }
                                                }
                                            } : s, f = r5(o, ["mainAxis", "crossAxis", "limiter"]), p = {
                                                x: t,
                                                y: n
                                            }, [4, r9(e, f)];
                                        case 1:
                                            return y = T.sent(), h = p[b = rY(m = rW(r_(i)))], g = p[m], l && (v = "y" === b ? "top" : "left", w = "y" === b ? "bottom" : "right", x = h + y[v], j = h - y[w], h = rA(x, rD(h, j))), c && (O = "y" === m ? "top" : "left", S = "y" === m ? "bottom" : "right", I = g + y[O], M = g - y[S], g = rA(I, rD(g, M))), P = d.fn(r3(r4({}, e), (r2(N = {}, b, h), r2(N, m, g), N))), [2, r3(r4({}, P), {
                                                data: {
                                                    x: P.x - t,
                                                    y: P.y - n,
                                                    enabled: (r2(E = {}, b, l), r2(E, m, c), E)
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
                io = function(e, t) {
                    var r;
                    return n3(n4({}, (void 0 === (r = e) && (r = {}), {
                        options: r,
                        fn: function(e) {
                            var t, n = e.x,
                                i = e.y,
                                o = e.placement,
                                a = e.rects,
                                l = e.middlewareData,
                                u = rz(r, e),
                                c = u.offset,
                                s = u.mainAxis,
                                d = u.crossAxis,
                                f = {
                                    x: n,
                                    y: i
                                },
                                p = rW(o),
                                y = rY(p),
                                m = f[y],
                                b = f[p],
                                h = rz(void 0 === c ? 0 : c, e),
                                g = "number" == typeof h ? {
                                    mainAxis: h,
                                    crossAxis: 0
                                } : r4({
                                    mainAxis: 0,
                                    crossAxis: 0
                                }, h);
                            if (void 0 === s || s) {
                                var v = "y" === y ? "height" : "width",
                                    w = a.reference[y] - a.floating[v] + g.mainAxis,
                                    x = a.reference[y] + a.reference[v] - g.mainAxis;
                                m < w ? m = w : m > x && (m = x)
                            }
                            if (void 0 === d || d) {
                                var j, O, S = "y" === y ? "width" : "height",
                                    I = nr.has(r_(o)),
                                    M = a.reference[p] - a.floating[S] + (I && (null == (j = l.offset) ? void 0 : j[p]) || 0) + (I ? 0 : g.crossAxis),
                                    N = a.reference[p] + a.reference[S] + (I ? 0 : (null == (O = l.offset) ? void 0 : O[p]) || 0) - (I ? g.crossAxis : 0);
                                b < M ? b = M : b > N && (b = N)
                            }
                            return r2(t = {}, y, m), r2(t, p, b), t
                        }
                    })), {
                        options: [e, t]
                    })
                },
                ia = function(e, t) {
                    var r;
                    return n3(n4({}, (void 0 === (r = e) && (r = {}), {
                        name: "flip",
                        options: r,
                        fn: function(e) {
                            return r1(function() {
                                var t, n, i, o, a, l, u, c, s, d, f, p, y, m, b, h, g, v, w, x, j, O, S, I, M, N, P, E, T, D, A, L, C, R, k, U, z, _, B, Y;
                                return r8(this, function(F) {
                                    var G, W, V, Q, q, K, H, X, Z, $, J, ee, et, er, en;
                                    switch (F.label) {
                                        case 0:
                                            if (i = e.placement, o = e.middlewareData, a = e.rects, l = e.initialPlacement, u = e.platform, c = e.elements, f = void 0 === (d = (s = rz(r, e)).mainAxis) || d, y = void 0 === (p = s.crossAxis) || p, m = s.fallbackPlacements, h = void 0 === (b = s.fallbackStrategy) ? "bestFit" : b, v = void 0 === (g = s.fallbackAxisSideDirection) ? "none" : g, x = void 0 === (w = s.flipAlignment) || w, j = r5(s, ["mainAxis", "crossAxis", "fallbackPlacements", "fallbackStrategy", "fallbackAxisSideDirection", "flipAlignment"]), null != (t = o.arrow) && t.alignmentOffset) return [2, {}];
                                            return O = r_(i), S = rW(l), I = r_(l) === l, [4, null == u.isRTL ? void 0 : u.isRTL(c.floating)];
                                        case 1:
                                            return M = F.sent(), N = m || (I || !x ? [rX(l)] : (W = rX(G = l), [rV(G), W, rV(W)])), P = "none" !== v, !m && P && (E = N).push.apply(E, r6((V = l, Q = x, q = v, K = M, H = rB(V), X = function(e, t, r) {
                                                switch (e) {
                                                    case "top":
                                                    case "bottom":
                                                        if (r) return t ? rq : rQ;
                                                        return t ? rQ : rq;
                                                    case "left":
                                                    case "right":
                                                        return t ? rK : rH;
                                                    default:
                                                        return []
                                                }
                                            }(r_(V), "start" === q, K), H && (X = X.map(function(e) {
                                                return e + "-" + H
                                            }), Q && (X = X.concat(X.map(rV)))), X))), T = [l].concat(r6(N)), [4, r9(e, j)];
                                        case 2:
                                            if (D = F.sent(), A = [], L = (null == (n = o.flip) ? void 0 : n.overflows) || [], f && A.push(D[O]), y && (Z = i, $ = a, void 0 === (J = M) && (J = !1), ee = rB(Z), er = rF(et = rY(rW(Z))), en = "x" === et ? ee === (J ? "end" : "start") ? "right" : "left" : "start" === ee ? "bottom" : "top", $.reference[er] > $.floating[er] && (en = rX(en)), C = [en, rX(en)], A.push(D[C[0]], D[C[1]])), L = r6(L).concat([{
                                                    placement: i,
                                                    overflows: A
                                                }]), !A.every(function(e) {
                                                    return e <= 0
                                                })) {
                                                if ((z = T[U = ((null == (R = o.flip) ? void 0 : R.index) || 0) + 1]) && ("alignment" !== y || S === rW(z) || L.every(function(e) {
                                                        return rW(e.placement) !== S || e.overflows[0] > 0
                                                    }))) return [2, {
                                                    data: {
                                                        index: U,
                                                        overflows: L
                                                    },
                                                    reset: {
                                                        placement: z
                                                    }
                                                }];
                                                if (!(_ = null == (k = L.filter(function(e) {
                                                        return e.overflows[0] <= 0
                                                    }).sort(function(e, t) {
                                                        return e.overflows[1] - t.overflows[1]
                                                    })[0]) ? void 0 : k.placement)) switch (h) {
                                                    case "bestFit":
                                                        (Y = null == (B = L.filter(function(e) {
                                                            if (P) {
                                                                var t = rW(e.placement);
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
                                                        })[0]) ? void 0 : B[0]) && (_ = Y);
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
                il = function(e, t) {
                    var r;
                    return n3(n4({}, (void 0 === (r = e) && (r = {}), {
                        name: "size",
                        options: r,
                        fn: function(e) {
                            return r1(function() {
                                var t, n, i, o, a, l, u, c, s, d, f, p, y, m, b, h, g, v, w, x, j, O, S, I, M, N, P, E, T, D;
                                return r8(this, function(A) {
                                    switch (A.label) {
                                        case 0:
                                            return i = e.placement, o = e.rects, a = e.platform, l = e.elements, s = void 0 === (c = (u = rz(r, e)).apply) ? function() {} : c, [4, r9(e, r5(u, ["apply"]))];
                                        case 1:
                                            if (d = A.sent(), f = r_(i), p = rB(i), y = "y" === rW(i), b = (m = o.floating).width, h = m.height, "top" !== f && "bottom" !== f) return [3, 3];
                                            return g = f, [4, null == a.isRTL ? void 0 : a.isRTL(l.floating)];
                                        case 2:
                                            return v = p === (A.sent() ? "start" : "end") ? "left" : "right", [3, 4];
                                        case 3:
                                            v = f, g = "end" === p ? "top" : "bottom", A.label = 4;
                                        case 4:
                                            return w = h - d.top - d.bottom, x = b - d.left - d.right, j = rD(h - d[g], w), O = rD(b - d[v], x), S = !e.middlewareData.shift, I = j, M = O, null != (t = e.middlewareData.shift) && t.enabled.x && (M = x), null != (n = e.middlewareData.shift) && n.enabled.y && (I = w), S && !p && (N = rA(d.left, 0), P = rA(d.right, 0), E = rA(d.top, 0), T = rA(d.bottom, 0), y ? M = b - 2 * (0 !== N || 0 !== P ? N + P : rA(d.left, d.right)) : I = h - 2 * (0 !== E || 0 !== T ? E + T : rA(d.top, d.bottom))), [4, s(r3(r4({}, e), {
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
                iu = function(e, t) {
                    var r;
                    return n3(n4({}, (void 0 === (r = e) && (r = {}), {
                        name: "hide",
                        options: r,
                        fn: function(e) {
                            return r1(function() {
                                var t, n, i, o, a, l, u;
                                return r8(this, function(c) {
                                    switch (c.label) {
                                        case 0:
                                            switch (t = e.rects, o = void 0 === (i = (n = rz(r, e)).strategy) ? "referenceHidden" : i, a = r5(n, ["strategy"]), o) {
                                                case "referenceHidden":
                                                    return [3, 1];
                                                case "escaped":
                                                    return [3, 3]
                                            }
                                            return [3, 5];
                                        case 1:
                                            return [4, r9(e, r3(r4({}, a), {
                                                elementContext: "reference"
                                            }))];
                                        case 2:
                                            return [2, {
                                                data: {
                                                    referenceHiddenOffsets: l = ne(c.sent(), t.reference),
                                                    referenceHidden: nt(l)
                                                }
                                            }];
                                        case 3:
                                            return [4, r9(e, r3(r4({}, a), {
                                                altBoundary: !0
                                            }))];
                                        case 4:
                                            return [2, {
                                                data: {
                                                    escapedOffsets: u = ne(c.sent(), t.floating),
                                                    escaped: nt(u)
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
                ic = function(e, t) {
                    return n3(n4({}, {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            var r = "function" == typeof e ? e(t) : e,
                                n = r.element,
                                i = r.padding;
                            return n && ({}).hasOwnProperty.call(n, "current") ? null != n.current ? n$({
                                element: n.current,
                                padding: i
                            }).fn(t) : {} : n ? n$({
                                element: n,
                                padding: i
                            }).fn(t) : {}
                        }
                    }), {
                        options: [e, t]
                    })
                };

            function is(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function id(e) {
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

            function ip(e, t) {
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

            function im(e) {
                return function(e) {
                    if (Array.isArray(e)) return is(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return is(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return is(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ib = ti.forwardRef(function(e, t) {
                var r = e.children,
                    n = iy(e, ["children"]),
                    i = ti.Children.toArray(r),
                    o = i.find(iv);
                if (o) {
                    var a = o.props.children,
                        l = i.map(function(e) {
                            return e !== o ? e : ti.Children.count(a) > 1 ? ti.Children.only(null) : ti.isValidElement(a) ? a.props.children : null
                        });
                    return (0, I.jsx)(ih, ip(id({}, n), {
                        ref: t,
                        children: ti.isValidElement(a) ? ti.cloneElement(a, void 0, l) : null
                    }))
                }
                return (0, I.jsx)(ih, ip(id({}, n), {
                    ref: t,
                    children: r
                }))
            });
            ib.displayName = "Slot";
            var ih = ti.forwardRef(function(e, t) {
                var r = e.children,
                    n = iy(e, ["children"]);
                if (ti.isValidElement(r)) {
                    var i, o, a, l, u, c = (u = (l = null == (o = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (u = (l = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref;
                    return ti.cloneElement(r, ip(id({}, function(e, t) {
                        var r = id({}, t);
                        for (var n in t) ! function(n) {
                            var i = e[n],
                                o = t[n];
                            /^on[A-Z]/.test(n) ? i && o ? r[n] = function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                o.apply(void 0, im(t)), i.apply(void 0, im(t))
                            } : i && (r[n] = i) : "style" === n ? r[n] = id({}, i, o) : "className" === n && (r[n] = [i, o].filter(Boolean).join(" "))
                        }(n);
                        return id({}, e, r)
                    }(n, r.props)), {
                        ref: t ? rh(t, c) : c
                    }))
                }
                return ti.Children.count(r) > 1 ? ti.Children.only(null) : null
            });
            ih.displayName = "SlotClone";
            var ig = function(e) {
                var t = e.children;
                return (0, I.jsx)(I.Fragment, {
                    children: t
                })
            };

            function iv(e) {
                return ti.isValidElement(e) && e.type === ig
            }

            function iw(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function ix(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        iw(e, t, r[t])
                    })
                }
                return e
            }

            function ij(e, t) {
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
            var iO = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                    var r = ti.forwardRef(function(e, r) {
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
                            o = n ? ib : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, I.jsx)(o, ij(ix({}, i), {
                            ref: r
                        }))
                    });
                    return r.displayName = "Primitive.".concat(t), ij(ix({}, e), iw({}, t, r))
                }, {}),
                iS = ti.forwardRef(function(e, t) {
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
                    return (0, I.jsx)(iO.svg, (r = function(e) {
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
                        children: e.asChild ? i : (0, I.jsx)("polygon", {
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

            function iI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iM(e) {
                var t = ti.useRef(e);
                return ti.useEffect(function() {
                    t.current = e
                }), ti.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), i = 0; i < r; i++) n[i] = arguments[i];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return iI(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return iI(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iI(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function iN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iE(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function iT(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        iE(e, t, r[t])
                    })
                }
                return e
            }

            function iD(e, t) {
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

            function iA(e, t) {
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

            function iL(e, t) {
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
                }(e, t) || iC(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function iC(e, t) {
                if (e) {
                    if ("string" == typeof e) return iP(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iP(e, t)
                }
            }
            iS.displayName = "Arrow";
            var iR = "Popper",
                ik = iL(rO(iR), 2),
                iU = ik[0],
                iz = ik[1],
                i_ = iL(iU(iR), 2),
                iB = i_[0],
                iY = i_[1],
                iF = function(e) {
                    var t = e.__scopePopper,
                        r = e.children,
                        n = iL(ti.useState(null), 2),
                        i = n[0],
                        o = n[1];
                    return (0, I.jsx)(iB, {
                        scope: t,
                        anchor: i,
                        onAnchorChange: o,
                        children: r
                    })
                };
            iF.displayName = iR;
            var iG = "PopperAnchor",
                iW = ti.forwardRef(function(e, t) {
                    var r = e.__scopePopper,
                        n = e.virtualRef,
                        i = iA(e, ["__scopePopper", "virtualRef"]),
                        o = iY(iG, r),
                        a = ti.useRef(null),
                        l = rg(t, a);
                    return ti.useEffect(function() {
                        o.onAnchorChange((null == n ? void 0 : n.current) || a.current)
                    }), n ? null : (0, I.jsx)(iO.div, iD(iT({}, i), {
                        ref: l
                    }))
                });
            iW.displayName = iG;
            var iV = "PopperContent",
                iQ = iL(iU(iV), 2),
                iq = iQ[0],
                iK = iQ[1],
                iH = ti.forwardRef(function(e, t) {
                    var r, n, i, o, a, l, u, c, s, d, f, p, y, m, b, h, g, v, w, x, j, O, S, M, N, P, E, T, D, A, L, C, R, k, U, z, _, B, Y, F, G, W, V, Q, q, K, H, X, Z, $, J, ee, et, er, en, ei, eo = e.__scopePopper,
                        ea = e.side,
                        el = e.sideOffset,
                        eu = e.align,
                        ec = void 0 === eu ? "center" : eu,
                        es = e.alignOffset,
                        ed = e.arrowPadding,
                        ef = e.avoidCollisions,
                        ep = void 0 === ef || ef,
                        ey = e.collisionBoundary,
                        em = void 0 === ey ? [] : ey,
                        eb = e.collisionPadding,
                        eh = void 0 === eb ? 0 : eb,
                        eg = e.sticky,
                        ev = e.hideWhenDetached,
                        ew = e.updatePositionStrategy,
                        ex = void 0 === ew ? "optimized" : ew,
                        ej = e.onPlaced,
                        eO = iA(e, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        eS = iY(iV, eo),
                        eI = iL(ti.useState(null), 2),
                        eM = eI[0],
                        eN = eI[1],
                        eP = rg(t, function(e) {
                            return eN(e)
                        }),
                        eE = iL(ti.useState(null), 2),
                        eT = eE[0],
                        eD = eE[1],
                        eA = (i = (n = function(e) {
                            if (Array.isArray(e)) return e
                        }(r = ti.useState(void 0)) || function(e) {
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
                                if ("string" == typeof e) return iN(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iN(e, 2)
                            }
                        }(r) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], o = n[1], rM(function() {
                            if (eT) {
                                o({
                                    width: eT.offsetWidth,
                                    height: eT.offsetHeight
                                });
                                var e = new ResizeObserver(function(e) {
                                    if (Array.isArray(e) && e.length) {
                                        var t, r, n = e[0];
                                        if ("borderBoxSize" in n) {
                                            var i = n.borderBoxSize,
                                                a = Array.isArray(i) ? i[0] : i;
                                            t = a.inlineSize, r = a.blockSize
                                        } else t = eT.offsetWidth, r = eT.offsetHeight;
                                        o({
                                            width: t,
                                            height: r
                                        })
                                    }
                                });
                                return e.observe(eT, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return e.unobserve(eT)
                                    }
                            }
                            o(void 0)
                        }, [eT]), i),
                        eL = null != (Z = null == eA ? void 0 : eA.width) ? Z : 0,
                        eC = null != ($ = null == eA ? void 0 : eA.height) ? $ : 0,
                        eR = "number" == typeof eh ? eh : iT({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, eh),
                        ek = Array.isArray(em) ? em : [em],
                        eU = ek.length > 0,
                        ez = {
                            padding: eR,
                            boundary: ek.filter(iJ),
                            altBoundary: eU
                        },
                        e_ = (u = void 0 === (l = (a = {
                            strategy: "fixed",
                            placement: (void 0 === ea ? "bottom" : ea) + ("center" !== ec ? "-" + ec : ""),
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return nZ.apply(void 0, ((function(e) {
                                    if (Array.isArray(e)) return iP(e)
                                })(t) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(t) || iC(t) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()).concat([{
                                    animationFrame: "always" === ex
                                }]))
                            },
                            elements: {
                                reference: eS.anchor
                            },
                            middleware: [ir({
                                mainAxis: (void 0 === el ? 0 : el) + eC,
                                alignmentAxis: void 0 === es ? 0 : es
                            }), ep && ii(iT({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === eg ? "partial" : eg) ? io() : void 0
                            }, ez)), ep && ia(iT({}, ez)), il(iD(iT({}, ez), {
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
                            })), eT && ic({
                                element: eT,
                                padding: void 0 === ed ? 0 : ed
                            }), i0({
                                arrowWidth: eL,
                                arrowHeight: eC
                            }), void 0 !== ev && ev && iu(iT({
                                strategy: "referenceHidden"
                            }, ez))]
                        }).placement) ? "bottom" : l, s = void 0 === (c = a.strategy) ? "absolute" : c, f = void 0 === (d = a.middleware) ? [] : d, p = a.platform, b = (m = void 0 === (y = a.elements) ? {} : y).reference, h = m.floating, v = void 0 === (g = a.transform) || g, w = a.whileElementsMounted, x = a.open, O = (j = n5(ti.useState({
                            x: 0,
                            y: 0,
                            strategy: s,
                            placement: u,
                            middlewareData: {},
                            isPositioned: !1
                        }), 2))[0], S = j[1], N = (M = n5(ti.useState(f), 2))[0], P = M[1], n7(N, f) || P(f), T = (E = n5(ti.useState(null), 2))[0], D = E[1], L = (A = n5(ti.useState(null), 2))[0], C = A[1], R = ti.useCallback(function(e) {
                            e !== _.current && (_.current = e, D(e))
                        }, []), k = ti.useCallback(function(e) {
                            e !== B.current && (B.current = e, C(e))
                        }, []), U = b || T, z = h || L, _ = ti.useRef(null), B = ti.useRef(null), Y = ti.useRef(O), F = null != w, G = it(w), W = it(p), V = it(x), Q = ti.useCallback(function() {
                            if (_.current && B.current) {
                                var e = {
                                    placement: u,
                                    strategy: s,
                                    middleware: N
                                };
                                W.current && (e.platform = W.current), nJ(_.current, B.current, e).then(function(e) {
                                    var t = n3(n4({}, e), {
                                        isPositioned: !1 !== V.current
                                    });
                                    q.current && !n7(Y.current, t) && (Y.current = t, n0.flushSync(function() {
                                        S(t)
                                    }))
                                })
                            }
                        }, [N, u, s, W, V]), n8(function() {
                            !1 === x && Y.current.isPositioned && (Y.current.isPositioned = !1, S(function(e) {
                                return n3(n4({}, e), {
                                    isPositioned: !1
                                })
                            }))
                        }, [x]), q = ti.useRef(!1), n8(function() {
                            return q.current = !0,
                                function() {
                                    q.current = !1
                                }
                        }, []), n8(function() {
                            if (U && (_.current = U), z && (B.current = z), U && z) {
                                if (G.current) return G.current(U, z, Q);
                                Q()
                            }
                        }, [U, z, Q, G, F]), K = ti.useMemo(function() {
                            return {
                                reference: _,
                                floating: B,
                                setReference: R,
                                setFloating: k
                            }
                        }, [R, k]), H = ti.useMemo(function() {
                            return {
                                reference: U,
                                floating: z
                            }
                        }, [U, z]), X = ti.useMemo(function() {
                            var e = {
                                position: s,
                                left: 0,
                                top: 0
                            };
                            if (!H.floating) return e;
                            var t = ie(H.floating, O.x),
                                r = ie(H.floating, O.y);
                            return v ? n4(n3(n4({}, e), {
                                transform: "translate(" + t + "px, " + r + "px)"
                            }), n9(H.floating) >= 1.5 && {
                                willChange: "transform"
                            }) : {
                                position: s,
                                left: t,
                                top: r
                            }
                        }, [s, v, H.floating, O.x, O.y]), ti.useMemo(function() {
                            return n3(n4({}, O), {
                                update: Q,
                                refs: K,
                                elements: H,
                                floatingStyles: X
                            })
                        }, [O, Q, K, H, X])),
                        eB = e_.refs,
                        eY = e_.floatingStyles,
                        eF = e_.placement,
                        eG = e_.isPositioned,
                        eW = e_.middlewareData,
                        eV = iL(i1(eF), 2),
                        eQ = eV[0],
                        eq = eV[1],
                        eK = iM(ej);
                    rM(function() {
                        eG && (null == eK || eK())
                    }, [eG, eK]);
                    var eH = null == (J = eW.arrow) ? void 0 : J.x,
                        eX = null == (ee = eW.arrow) ? void 0 : ee.y,
                        eZ = (null == (et = eW.arrow) ? void 0 : et.centerOffset) !== 0,
                        e$ = iL(ti.useState(), 2),
                        eJ = e$[0],
                        e0 = e$[1];
                    return rM(function() {
                        eM && e0(window.getComputedStyle(eM).zIndex)
                    }, [eM]), (0, I.jsx)("div", {
                        ref: eB.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: iT(iD(iT({}, eY), iE({
                            transform: eG ? eY.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: eJ
                        }, "--radix-popper-transform-origin", [null == (er = eW.transformOrigin) ? void 0 : er.x, null == (en = eW.transformOrigin) ? void 0 : en.y].join(" "))), (null == (ei = eW.hide) ? void 0 : ei.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, I.jsx)(iq, {
                            scope: eo,
                            placedSide: eQ,
                            onArrowChange: eD,
                            arrowX: eH,
                            arrowY: eX,
                            shouldHideArrow: eZ,
                            children: (0, I.jsx)(iO.div, iD(iT({
                                "data-side": eQ,
                                "data-align": eq
                            }, eO), {
                                ref: eP,
                                style: iD(iT({}, eO.style), {
                                    animation: eG ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            iH.displayName = iV;
            var iX = "PopperArrow",
                iZ = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                i$ = ti.forwardRef(function(e, t) {
                    var r, n = e.__scopePopper,
                        i = iA(e, ["__scopePopper"]),
                        o = iK(iX, n),
                        a = iZ[o.placedSide];
                    return (0, I.jsx)("span", {
                        ref: o.onArrowChange,
                        style: (iE(r = {
                            position: "absolute",
                            left: o.arrowX,
                            top: o.arrowY
                        }, a, 0), iE(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [o.placedSide]), iE(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [o.placedSide]), iE(r, "visibility", o.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, I.jsx)(iS, iD(iT({}, i), {
                            ref: t,
                            style: iD(iT({}, i.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function iJ(e) {
                return null !== e
            }
            i$.displayName = iX;
            var i0 = function(e) {
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
                            p = iL(i1(l), 2),
                            y = p[0],
                            m = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [p[1]],
                            b = (null != (r = null == (o = c.arrow) ? void 0 : o.x) ? r : 0) + d / 2,
                            h = (null != (n = null == (a = c.arrow) ? void 0 : a.y) ? n : 0) + f / 2,
                            g = "",
                            v = "";
                        return "bottom" === y ? (g = s ? m : "".concat(b, "px"), v = "".concat(-f, "px")) : "top" === y ? (g = s ? m : "".concat(b, "px"), v = "".concat(u.floating.height + f, "px")) : "right" === y ? (g = "".concat(-f, "px"), v = s ? m : "".concat(h, "px")) : "left" === y && (g = "".concat(u.floating.width + f, "px"), v = s ? m : "".concat(h, "px")), {
                            data: {
                                x: g,
                                y: v
                            }
                        }
                    }
                }
            };

            function i1(e) {
                var t = iL(e.split("-"), 2),
                    r = t[0],
                    n = t[1];
                return [r, void 0 === n ? "center" : n]
            }

            function i2(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var i4 = ti.forwardRef(function(e, t) {
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
                    }(r = ti.useState(!1)) || function(e) {
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
                            if ("string" == typeof e) return i2(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return i2(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = c[0],
                    d = c[1];
                rM(function() {
                    return d(!0)
                }, []);
                var f = l || s && (null == (a = globalThis) || null == (o = a.document) ? void 0 : o.body);
                return f ? n1().createPortal((0, I.jsx)(iO.div, (n = function(e) {
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

            function i3(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function i5(e, t) {
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
                        if ("string" == typeof e) return i3(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return i3(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            i4.displayName = "Portal";
            var i6 = function(e) {
                var t, r, n, i, o, a, l, u, c, s, d, f, p, y, m, b, h, g = e.present,
                    v = e.children,
                    w = (t = g, o = (i = i5(ti.useState(), 2))[0], a = i[1], l = ti.useRef({}), u = ti.useRef(t), c = ti.useRef("none"), d = (s = i5((r = t ? "mounted" : "unmounted", n = {
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
                    }, ti.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], f = s[1], ti.useEffect(function() {
                        var e = i8(l.current);
                        c.current = "mounted" === d ? e : "none"
                    }, [d]), rM(function() {
                        var e = l.current,
                            r = u.current;
                        if (r !== t) {
                            var n = c.current,
                                i = i8(e);
                            t ? f("MOUNT") : "none" === i || (null == e ? void 0 : e.display) === "none" ? f("UNMOUNT") : r && n !== i ? f("ANIMATION_OUT") : f("UNMOUNT"), u.current = t
                        }
                    }, [t, f]), rM(function() {
                        if (o) {
                            var e, t, r = null != (e = o.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = i8(l.current).includes(e.animationName);
                                    if (e.target === o && n && (f("ANIMATION_END"), !u.current)) {
                                        var i = o.style.animationFillMode;
                                        o.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === o.style.animationFillMode && (o.style.animationFillMode = i)
                                        })
                                    }
                                },
                                i = function(e) {
                                    e.target === o && (c.current = i8(l.current))
                                };
                            return o.addEventListener("animationstart", i), o.addEventListener("animationcancel", n), o.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), o.removeEventListener("animationstart", i), o.removeEventListener("animationcancel", n), o.removeEventListener("animationend", n)
                                }
                        }
                        f("ANIMATION_END")
                    }, [o, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: ti.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    x = "function" == typeof v ? v({
                        present: w.isPresent
                    }) : ti.Children.only(v),
                    j = rg(w.ref, (h = (b = null == (y = Object.getOwnPropertyDescriptor((p = x).props, "ref")) ? void 0 : y.get) && "isReactWarning" in b && b.isReactWarning) ? p.ref : (h = (b = null == (m = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof v || w.isPresent ? ti.cloneElement(x, {
                    ref: j
                }) : null
            };

            function i8(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function i7(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function i9(e, t) {
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
                        if ("string" == typeof e) return i7(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return i7(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oe(e) {
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
            i6.displayName = "Presence";
            var ot = ti.forwardRef(function(e, t) {
                var r, n;
                return (0, I.jsx)(iO.span, (r = oe({}, e), n = n = {
                    ref: t,
                    style: oe({
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

            function or(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function on(e) {
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

            function oi(e, t) {
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

            function oo(e, t) {
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

            function oa(e, t) {
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
                }(e, t) || ou(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ol(e) {
                return function(e) {
                    if (Array.isArray(e)) return or(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || ou(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ou(e, t) {
                if (e) {
                    if ("string" == typeof e) return or(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return or(e, t)
                }
            }
            ot.displayName = "VisuallyHidden";
            var oc = oa(rO("Tooltip", [iz]), 2),
                os = oc[0];
            oc[1];
            var od = iz(),
                of = "TooltipProvider",
                op = "tooltip.open",
                oy = oa(os(of), 2),
                om = oy[0],
                ob = oy[1],
                oh = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.delayDuration,
                        n = e.skipDelayDuration,
                        i = void 0 === n ? 300 : n,
                        o = e.disableHoverableContent,
                        a = e.children,
                        l = oa(ti.useState(!0), 2),
                        u = l[0],
                        c = l[1],
                        s = ti.useRef(!1),
                        d = ti.useRef(0);
                    return ti.useEffect(function() {
                        var e = d.current;
                        return function() {
                            return window.clearTimeout(e)
                        }
                    }, []), (0, I.jsx)(om, {
                        scope: t,
                        isOpenDelayed: u,
                        delayDuration: void 0 === r ? 700 : r,
                        onOpen: ti.useCallback(function() {
                            window.clearTimeout(d.current), c(!1)
                        }, []),
                        onClose: ti.useCallback(function() {
                            window.clearTimeout(d.current), d.current = window.setTimeout(function() {
                                return c(!0)
                            }, i)
                        }, [i]),
                        isPointerInTransitRef: s,
                        onPointerInTransitChange: ti.useCallback(function(e) {
                            s.current = e
                        }, []),
                        disableHoverableContent: void 0 !== o && o,
                        children: a
                    })
                };
            oh.displayName = of;
            var og = "Tooltip",
                ov = oa(os(og), 2),
                ow = ov[0],
                ox = ov[1],
                oj = function(e) {
                    var t, r, n, i, o, a, l, u, c, s, d, f, p, y, m, b, h, g, v, w, x, j = e.__scopeTooltip,
                        O = e.children,
                        S = e.open,
                        M = e.defaultOpen,
                        N = e.onOpenChange,
                        P = e.disableHoverableContent,
                        E = e.delayDuration,
                        T = ob(og, e.__scopeTooltip),
                        D = od(j),
                        A = oa(ti.useState(null), 2),
                        L = A[0],
                        C = A[1],
                        R = (s = (c = function(e) {
                            if (Array.isArray(e)) return e
                        }(u = ti.useState(rP())) || function(e) {
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
                                if ("string" == typeof e) return rN(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rN(e, 2)
                            }
                        }(u) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], d = c[1], rM(function() {
                            d(function(e) {
                                return null != e ? e : String(rE++)
                            })
                        }, [void 0]), s ? "radix-".concat(s) : ""),
                        k = ti.useRef(0),
                        U = null != P ? P : T.disableHoverableContent,
                        z = null != E ? E : T.delayDuration,
                        _ = ti.useRef(!1),
                        B = oa((p = (f = {
                            prop: S,
                            defaultProp: void 0 !== M && M,
                            onChange: function(e) {
                                e ? (T.onOpen(), document.dispatchEvent(new CustomEvent(op))) : T.onClose(), null == N || N(e)
                            }
                        }).prop, h = (b = i9((r = (t = {
                            defaultProp: f.defaultProp,
                            onChange: m = void 0 === (y = f.onChange) ? function() {} : y
                        }).defaultProp, n = t.onChange, o = i9(i = ti.useState(r), 1)[0], a = ti.useRef(o), l = iM(n), ti.useEffect(function() {
                            a.current !== o && (l(o), a.current = o)
                        }, [o, a, l]), i), 2))[0], g = b[1], w = (v = void 0 !== p) ? p : h, x = iM(m), [w, ti.useCallback(function(e) {
                            if (v) {
                                var t = "function" == typeof e ? e(p) : e;
                                t !== p && x(t)
                            } else g(e)
                        }, [v, p, g, x])]), 2),
                        Y = B[0],
                        F = void 0 !== Y && Y,
                        G = B[1],
                        W = ti.useMemo(function() {
                            return F ? _.current ? "delayed-open" : "instant-open" : "closed"
                        }, [F]),
                        V = ti.useCallback(function() {
                            window.clearTimeout(k.current), k.current = 0, _.current = !1, G(!0)
                        }, [G]),
                        Q = ti.useCallback(function() {
                            window.clearTimeout(k.current), k.current = 0, G(!1)
                        }, [G]),
                        q = ti.useCallback(function() {
                            window.clearTimeout(k.current), k.current = window.setTimeout(function() {
                                _.current = !0, G(!0), k.current = 0
                            }, z)
                        }, [z, G]);
                    return ti.useEffect(function() {
                        return function() {
                            k.current && (window.clearTimeout(k.current), k.current = 0)
                        }
                    }, []), (0, I.jsx)(iF, oi(on({}, D), {
                        children: (0, I.jsx)(ow, {
                            scope: j,
                            contentId: R,
                            open: F,
                            stateAttribute: W,
                            trigger: L,
                            onTriggerChange: C,
                            onTriggerEnter: ti.useCallback(function() {
                                T.isOpenDelayed ? q() : V()
                            }, [T.isOpenDelayed, q, V]),
                            onTriggerLeave: ti.useCallback(function() {
                                U ? Q() : (window.clearTimeout(k.current), k.current = 0)
                            }, [Q, U]),
                            onOpen: V,
                            onClose: Q,
                            disableHoverableContent: U,
                            children: O
                        })
                    }))
                };
            oj.displayName = og;
            var oO = "TooltipTrigger",
                oS = ti.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = oo(e, ["__scopeTooltip"]),
                        i = ox(oO, r),
                        o = ob(oO, r),
                        a = od(r),
                        l = rg(t, ti.useRef(null), i.onTriggerChange),
                        u = ti.useRef(!1),
                        c = ti.useRef(!1),
                        s = ti.useCallback(function() {
                            return u.current = !1
                        }, []);
                    return ti.useEffect(function() {
                        return function() {
                            return document.removeEventListener("pointerup", s)
                        }
                    }, [s]), (0, I.jsx)(iW, oi(on({
                        asChild: !0
                    }, a), {
                        children: (0, I.jsx)(iO.button, oi(on({
                            "aria-describedby": i.open ? i.contentId : void 0,
                            "data-state": i.stateAttribute
                        }, n), {
                            ref: l,
                            onPointerMove: ry(e.onPointerMove, function(e) {
                                "touch" !== e.pointerType && (c.current || o.isPointerInTransitRef.current || (i.onTriggerEnter(), c.current = !0))
                            }),
                            onPointerLeave: ry(e.onPointerLeave, function() {
                                i.onTriggerLeave(), c.current = !1
                            }),
                            onPointerDown: ry(e.onPointerDown, function() {
                                u.current = !0, document.addEventListener("pointerup", s, {
                                    once: !0
                                })
                            }),
                            onFocus: ry(e.onFocus, function() {
                                u.current || i.onOpen()
                            }),
                            onBlur: ry(e.onBlur, i.onClose),
                            onClick: ry(e.onClick, i.onClose)
                        }))
                    }))
                });
            oS.displayName = oO;
            var oI = "TooltipPortal",
                oM = oa(os(oI, {
                    forceMount: void 0
                }), 2),
                oN = oM[0],
                oP = oM[1],
                oE = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.forceMount,
                        n = e.children,
                        i = e.container,
                        o = ox(oI, t);
                    return (0, I.jsx)(oN, {
                        scope: t,
                        forceMount: r,
                        children: (0, I.jsx)(i6, {
                            present: r || o.open,
                            children: (0, I.jsx)(i4, {
                                asChild: !0,
                                container: i,
                                children: n
                            })
                        })
                    })
                };
            oE.displayName = oI;
            var oT = "TooltipContent",
                oD = ti.forwardRef(function(e, t) {
                    var r = oP(oT, e.__scopeTooltip),
                        n = e.forceMount,
                        i = void 0 === n ? r.forceMount : n,
                        o = e.side,
                        a = void 0 === o ? "top" : o,
                        l = oo(e, ["forceMount", "side"]),
                        u = ox(oT, e.__scopeTooltip);
                    return (0, I.jsx)(i6, {
                        present: i || u.open,
                        children: u.disableHoverableContent ? (0, I.jsx)(ok, oi(on({
                            side: a
                        }, l), {
                            ref: t
                        })) : (0, I.jsx)(oA, oi(on({
                            side: a
                        }, l), {
                            ref: t
                        }))
                    })
                }),
                oA = ti.forwardRef(function(e, t) {
                    var r = ox(oT, e.__scopeTooltip),
                        n = ob(oT, e.__scopeTooltip),
                        i = ti.useRef(null),
                        o = rg(t, i),
                        a = oa(ti.useState(null), 2),
                        l = a[0],
                        u = a[1],
                        c = r.trigger,
                        s = r.onClose,
                        d = i.current,
                        f = n.onPointerInTransitChange,
                        p = ti.useCallback(function() {
                            u(null), f(!1)
                        }, [f]),
                        y = ti.useCallback(function(e, t) {
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
                                y = (n = (r = t.getBoundingClientRect()).top, i = r.right, o = r.bottom, [{
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
                            u(((l = ol(p).concat(ol(y)).slice()).sort(function(e, t) {
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
                    return ti.useEffect(function() {
                        return function() {
                            return p()
                        }
                    }, [p]), ti.useEffect(function() {
                        if (c && d) {
                            var e = function(e) {
                                    return y(e, d)
                                },
                                t = function(e) {
                                    return y(e, c)
                                };
                            return c.addEventListener("pointerleave", e), d.addEventListener("pointerleave", t),
                                function() {
                                    c.removeEventListener("pointerleave", e), d.removeEventListener("pointerleave", t)
                                }
                        }
                    }, [c, d, y, p]), ti.useEffect(function() {
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
                    }, [c, d, l, s, p]), (0, I.jsx)(ok, oi(on({}, e), {
                        ref: o
                    }))
                }),
                oL = oa(os(og, {
                    isInside: !1
                }), 2),
                oC = oL[0],
                oR = oL[1],
                ok = ti.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = e.children,
                        i = e["aria-label"],
                        o = e.onEscapeKeyDown,
                        a = e.onPointerDownOutside,
                        l = oo(e, ["__scopeTooltip", "children", "aria-label", "onEscapeKeyDown", "onPointerDownOutside"]),
                        u = ox(oT, r),
                        c = od(r),
                        s = u.onClose;
                    return ti.useEffect(function() {
                        return document.addEventListener(op, s),
                            function() {
                                return document.removeEventListener(op, s)
                            }
                    }, [s]), ti.useEffect(function() {
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
                    }, [u.trigger, s]), (0, I.jsx)(rI.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !1,
                        onEscapeKeyDown: o,
                        onPointerDownOutside: a,
                        onFocusOutside: function(e) {
                            return e.preventDefault()
                        },
                        onDismiss: s,
                        children: (0, I.jsxs)(iH, oi(on({
                            "data-state": u.stateAttribute
                        }, c, l), {
                            ref: t,
                            style: on({}, l.style, {
                                "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                                "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                                "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                                "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                                "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                            }),
                            children: [(0, I.jsx)(ig, {
                                children: n
                            }), (0, I.jsx)(oC, {
                                scope: r,
                                isInside: !0,
                                children: (0, I.jsx)(ot, {
                                    id: u.contentId,
                                    role: "tooltip",
                                    children: i || n
                                })
                            })]
                        }))
                    })
                });
            oD.displayName = oT;
            var oU = "TooltipArrow",
                oz = ti.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = oo(e, ["__scopeTooltip"]),
                        i = od(r);
                    return oR(oU, r).isInside ? null : (0, I.jsx)(i$, oi(on({}, i, n), {
                        ref: t
                    }))
                });

            function o_(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oB(e) {
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
                            if ("string" == typeof e) return o_(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return o_(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    p = f[0],
                    y = f[1],
                    m = null != a ? a : "string" == typeof i && null == o ? i : void 0;
                return ti.createElement(oh, {
                    delayDuration: void 0 === l ? 500 : l
                }, ti.createElement(oj, {
                    open: c,
                    onOpenChange: s
                }, u, ti.createElement(oE, null, ti.createElement(oD, {
                    side: p,
                    align: y,
                    "aria-label": m,
                    className: ta("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", d),
                    sideOffset: 5
                }, (void 0 === n || n) && ti.createElement(oz, {
                    asChild: !0
                }, ti.createElement(rp, {
                    className: "content-[var(--inverse-surface-0)]"
                })), ti.createElement("div", {
                    className: "flex flex-col text-truncate-split"
                }, ti.createElement("div", {
                    className: "text-caption-medium content-inverse-default"
                }, i), o && ti.createElement("div", {
                    className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
                }, o))))))
            }

            function oY(e) {
                var t = e.children,
                    r = e.asChild,
                    n = e.className;
                return ti.createElement(oS, {
                    asChild: r,
                    className: n
                }, t)
            }
            oz.displayName = oU;
            var oF = function(e) {
                    var t = e.title,
                        r = e.description,
                        n = e.position;
                    return to().createElement(oB, {
                        position: void 0 === n ? "top-center" : n,
                        title: t,
                        description: r
                    }, to().createElement(oY, {
                        asChild: !0
                    }, to().createElement("span", {
                        role: "button",
                        tabIndex: 0,
                        "aria-label": t,
                        className: "flex items-center content-muted",
                        "data-testid": "label-tooltip-trigger"
                    }, to().createElement(tf, {
                        name: "icon-regular-circle-i",
                        size: "Small"
                    }))))
                },
                oG = {
                    Standard: "bg-none",
                    Contrast: "bg-shift-200",
                    Utility: "bg-none"
                },
                oW = {
                    Standard: "stroke-standard",
                    Contrast: "stroke-none",
                    Utility: "stroke-none"
                };

            function oV(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oQ(e) {
                if (Array.isArray(e)) return e
            }

            function oq(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function oK() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function oH(e, t) {
                if (e) {
                    if ("string" == typeof e) return oV(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oV(e, t)
                }
            }
            var oX = {
                    XSmall: "padding-x-small",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-medium"
                },
                oZ = {
                    XSmall: "gap-x-xsmall",
                    Small: "gap-x-small",
                    Medium: "gap-x-small",
                    Large: "gap-x-small"
                },
                o$ = {
                    XSmall: "height-600",
                    Small: "height-800",
                    Medium: "height-1000",
                    Large: "height-1200"
                },
                oJ = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                o0 = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                o1 = {
                    XSmall: ["text-body-small", "placeholder:text-body-small"],
                    Small: ["text-body-small", "placeholder:text-body-small"],
                    Medium: ["text-body-medium", "placeholder:text-body-medium"],
                    Large: ["text-body-large", "placeholder:text-body-large"]
                },
                o2 = (0, ti.forwardRef)(function(e, t) {
                    var r, n, i, o = oQ(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || oH(r) || oK(),
                        a = o[0],
                        l = o.slice(1),
                        u = a.label,
                        c = a.labelTooltip,
                        s = a.leadingIconName,
                        d = a.trailingIconName,
                        f = a.leadingIconNode,
                        p = a.trailingIconNode,
                        y = a.hasError,
                        m = a.error,
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
                        N = function(e, t) {
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
                        P = (oQ(l) || function(e) {
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
                        }(l) || oH(l, 1) || oK())[0],
                        E = rf(),
                        T = M || E,
                        D = "".concat(T, "-description"),
                        A = null != h ? h : "Large",
                        L = y || !!m,
                        C = m || b,
                        R = (0, ti.useMemo)(function() {
                            return s ? to().createElement(tf, {
                                name: s,
                                size: A,
                                className: "content-emphasis",
                                "data-testid": "text-input-leading-icon"
                            }) : f
                        }, [s, f, A]),
                        k = (0, ti.useMemo)(function() {
                            return d ? to().createElement(tf, {
                                name: d,
                                size: A,
                                className: "content-emphasis",
                                "data-testid": "text-input-trailing-icon"
                            }) : p
                        }, [A, d, p]),
                        U = u ? to().createElement("label", {
                            htmlFor: T,
                            className: ta(o0[A], "content-emphasis")
                        }, u, w && to().createElement(to().Fragment, null, " ", to().createElement("span", {
                            className: "content-default"
                        }, "*"))) : null;
                    return to().createElement("div", {
                        "data-testid": "text-input-wrapper",
                        className: ta("flex width-full flex-col gap-small ".concat(j), oq({}, tm, x)),
                        style: O
                    }, U && (c ? to().createElement("div", {
                        className: "flex items-center gap-xsmall"
                    }, U, to().createElement(oF, c)) : U), to().createElement("div", {
                        "data-testid": "text-input-container",
                        className: ta("foundation-web-input flex items-center width-full", oW[v], oG[v], S, o$[A], oJ[A], oX[A], oZ[A], L ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                        style: I
                    }, R, to().createElement("input", (n = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                oq(e, t, r[t])
                            })
                        }
                        return e
                    }({
                        type: "text",
                        id: T,
                        ref: P,
                        className: ta("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", o1[A]),
                        style: {
                            appearance: "none"
                        },
                        "aria-invalid": L,
                        "aria-describedby": C ? D : void 0,
                        required: w
                    }, N), i = i = {
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
                    }), n)), k), C && to().createElement("span", {
                        id: D,
                        className: ta("text-caption-small", {
                            "content-system-alert": L,
                            "content-default": !L
                        })
                    }, C))
                });
            o2.displayName = "TextInput";
            var o4 = window.Roblox["core-scripts"].eventStream;

            function o3(e) {
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
            var o5 = ((a = {}).BuyRobuxPage = "buyRobuxPage", a.Flyout = "flyout", a.DirectUrl = "directUrl", a),
                o6 = "plus_referral_dashboard_shown",
                o8 = "plus_referral_copy_link_click",
                o7 = "plus_referral_sheet_shown",
                o9 = "plus_referral_subscribe_click",
                ae = "plus_referral_sheet_dismissed",
                at = "plus_referral_share_card_shown",
                ar = "plus_referral_share_card_invite_click",
                an = "plusReferral",
                ai = window.Roblox["core-scripts"].environmentUrls,
                ao = r.n(ai);

            function aa(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function al() {
                return null != j || (j = "".concat(ao().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), j
            }
            var au = function() {};

            function ac(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function as(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var ad = function(e, t) {
                    return e << 3 | t
                },
                af = ad(1, 2),
                ap = ad(2, 2),
                ay = ad(5, 2),
                am = ad(6, 2),
                ab = ad(8, 2),
                ah = ad(1, 2),
                ag = ad(2, 1),
                av = ad(3, 0),
                aw = ad(5, 2);
            ad(1, 2), ad(2, 1), ad(3, 0), ad(4, 2), ad(5, 2), ad(6, 0), ad(8, 2);
            var ax = ad(4, 0),
                aj = ad(6, 2),
                aO = ad(7, 2);
            ad(1, 0), ad(2, 2);
            var aS = ad(1, 2),
                aI = ad(2, 2),
                aM = ad(1, 2);
            ad(1, 2), ad(2, 2), ad(1, 2);
            var aN = new TextEncoder,
                aP = function() {
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
                                var t = (void 0 === e ? "undefined" : as(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                                for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                                this.buf.push(Number(t))
                            }
                        }, {
                            key: "writeString",
                            value: function(e) {
                                var t = aN.encode(e);
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

            function aE(e, t, r) {
                var n = new aP;
                return n.writeVarint(ad(1, 2)), n.writeString(e), n.writeVarint(t), r(n), n.toBytes()
            }

            function aT(e) {
                var t = new aP;
                if (t.writeVarint(ah), t.writeString(e.name), t.writeVarint(ag), t.writeDouble(e.value), t.writeVarint(av), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var r = function(e) {
                        var t = new aP,
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
                                            if ("string" == typeof e) return ac(e, 2);
                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ac(e, 2)
                                        }
                                    }(e) || function() {
                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                    }()),
                                    n = r[0],
                                    i = r[1];
                                if ("string" == typeof i) {
                                    var a = aE(n, ad(2, 2), function(e) {
                                        e.writeString(i)
                                    });
                                    t.writeVarint(ay), t.writeBytes(a)
                                } else if ("boolean" == typeof i) {
                                    var l = aE(n, ad(2, 0), function(e) {
                                        e.writeVarint(+!!i)
                                    });
                                    t.writeVarint(am), t.writeBytes(l)
                                } else if ((void 0 === i ? "undefined" : as(i)) === "bigint") {
                                    var u = aE(n, ad(2, 0), function(e) {
                                        e.writeVarint(i)
                                    });
                                    t.writeVarint(ap), t.writeBytes(u)
                                } else if ("number" == typeof i)
                                    if (Number.isFinite(i))
                                        if (Number.isInteger(i) && i >= -0x80000000 && i <= 0x7fffffff) {
                                            var c = aE(n, ad(2, 0), function(e) {
                                                e.writeVarint(i)
                                            });
                                            t.writeVarint(af), t.writeBytes(c)
                                        } else if (Number.isInteger(i)) {
                                    var s = aE(n, ad(2, 0), function(e) {
                                        e.writeVarint(BigInt(i))
                                    });
                                    t.writeVarint(ap), t.writeBytes(s)
                                } else {
                                    var d = aE(n, ad(2, 1), function(e) {
                                        e.writeDouble(i)
                                    });
                                    t.writeVarint(ab), t.writeBytes(d)
                                } else {
                                    var f = aE(n, ad(2, 2), function(e) {
                                        e.writeString(String(i))
                                    });
                                    t.writeVarint(ay), t.writeBytes(f)
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
                    t.writeVarint(aw), t.writeBytes(r)
                }
                return t.toBytes()
            }

            function aD(e, t, r) {
                var n = new aP;
                n.writeVarint(ax), n.writeVarint(r);
                var i = !0,
                    o = !1,
                    a = void 0;
                try {
                    for (var l, u = e[Symbol.iterator](); !(i = (l = u.next()).done); i = !0) {
                        var c = l.value;
                        n.writeVarint(aj), n.writeBytes(c)
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
                    for (var p, y = t[Symbol.iterator](); !(s = (p = y.next()).done); s = !0) {
                        var m = p.value;
                        n.writeVarint(aO), n.writeBytes(m)
                    }
                } catch (e) {
                    d = !0, f = e
                } finally {
                    try {
                        s || null == y.return || y.return()
                    } finally {
                        if (d) throw f
                    }
                }
                return n.toBytes()
            }

            function aA(e) {
                var t = new aP;
                t.writeVarint(aS), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(aI), t.writeBytes(e);
                var r = t.toBytes(),
                    n = new aP;
                return n.writeVarint(aM), n.writeBytes(r), n.toBytes()
            }
            var aL = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function aC(e) {
                return aL.test(e)
            }
            var aR = [],
                ak = !1,
                aU = !1;

            function az(e, t) {
                var r, n, i, o = e.map(function(e) {
                        return {
                            name: e.name,
                            value: e.value,
                            timestampMs: e.timestampMs,
                            attributes: e.attributes
                        }
                    }),
                    a = BigInt(Date.now());
                !0 === t || aU || "u" > typeof document && "hidden" === document.visibilityState ? (r = aA(aD(o.map(aT), [], a)).buffer, fetch("".concat(al()).concat("/v1/events/single"), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: r,
                    credentials: "include",
                    keepalive: !0
                }).catch(au)) : (n = aA(aD(o.map(aT), [], a)), (i = function() {
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
                    }(this, function(y) {
                        switch (y.label) {
                            case 0:
                                if ("u" < typeof CompressionStream) return [2, {
                                    body: n.buffer,
                                    compressed: !1
                                }];
                                return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(n).catch(au), t.close().catch(au), r = [], [4, (i = e.readable.getReader()).read()];
                            case 1:
                                o = y.sent(), y.label = 2;
                            case 2:
                                if (o.done) return [3, 4];
                                return r.push(o.value), [4, i.read()];
                            case 3:
                                return o = y.sent(), [3, 2];
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
                            aa(o, r, n, a, l, "next", e)
                        }

                        function l(e) {
                            aa(o, r, n, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                })()).then(function(e) {
                    var t = e.body,
                        r = e.compressed,
                        n = {
                            "Content-Type": "application/x-protobuf"
                        };
                    return r && (n["Content-Encoding"] = "gzip"), fetch("".concat(al()).concat("/v1/events/single"), {
                        method: "POST",
                        headers: n,
                        body: t,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(au)
            }

            function a_() {
                var e = !0,
                    t = !1,
                    r = void 0;
                try {
                    for (var n, i = aR[Symbol.iterator](); !(e = (n = i.next()).done); e = !0) {
                        var o = n.value.splice(0);
                        0 !== o.length && az(o, !0)
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

            function aB(e, t) {
                var r, n, i, o = Math.max(1, null != (r = null == t ? void 0 : t.batchSize) ? r : 10),
                    a = null != (n = null == t ? void 0 : t.batchIntervalMs) ? n : 250;

                function l(e, r) {
                    (null == t ? void 0 : t.onError) ? t.onError(e, r): console.error(e, r)
                }
                if (!aC(e)) return l('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                        name: e
                    }),
                    function() {};
                var u = [];
                return aR.push(u), ak || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                        "hidden" === document.visibilityState && a_()
                    }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                        aU = !0, a_()
                    }), ak = !0),
                    function(t, r, n) {
                        var c = "".concat(e, "_").concat(t);
                        if (! function(e, t) {
                                if (!aC(e)) return !1;
                                if (t) {
                                    var r = !0,
                                        n = !1,
                                        i = void 0;
                                    try {
                                        for (var o, a = Object.keys(t)[Symbol.iterator](); !(r = (o = a.next()).done); r = !0) {
                                            var l = o.value;
                                            if (!aC(l)) return !1
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
                        }), u.length >= o ? (void 0 !== i && (clearTimeout(i), i = void 0), az(u.splice(0, o))) : void 0 === i && (i = setTimeout(function() {
                            for (i = void 0; u.length > 0;) az(u.splice(0, o))
                        }, a))
                    }
            }
            var aY = aB("SubscriptionsCommon"),
                aF = function(e) {
                    (0, o4.sendEventWithTarget)(e.type, e.context, e.params)
                },
                aG = function() {
                    try {
                        aF({
                            name: o6,
                            type: o6,
                            context: an,
                            params: {}
                        })
                    } catch (e) {}
                },
                aW = function() {
                    try {
                        aF({
                            name: o8,
                            type: o8,
                            context: an,
                            params: {}
                        })
                    } catch (e) {}
                },
                aV = function(e, t, r, n, i) {
                    try {
                        var o, a, l, u, c;
                        aF((o = e, a = t, l = r, u = n, c = i, {
                            name: o7,
                            type: o7,
                            context: an,
                            params: o3({
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
                aQ = function(e, t, r, n) {
                    try {
                        var i, o, a, l;
                        aF((i = e, o = t, a = r, l = n, {
                            name: o9,
                            type: o9,
                            context: an,
                            params: o3({
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
                aq = function(e, t, r, n) {
                    try {
                        var i, o, a, l;
                        aF((i = e, o = t, a = r, l = n, {
                            name: ae,
                            type: ae,
                            context: an,
                            params: o3({
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
                aK = function() {
                    try {
                        aF({
                            name: at,
                            type: at,
                            context: an,
                            params: {}
                        }), aY("ShareCardShown", void 0)
                    } catch (e) {}
                },
                aH = function() {
                    try {
                        aF({
                            name: ar,
                            type: ar,
                            context: an,
                            params: {}
                        }), aY("ShareCardInviteClick", void 0)
                    } catch (e) {}
                };

            function aX(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aZ(e) {
                return function(e) {
                    if (Array.isArray(e)) return aX(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return aX(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aX(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var a$ = "__FN_nvfToKPAOuiV__",
                aJ = new RegExp("".concat(a$, "(\\d+)\\|")),
                a0 = function(e, t, r, n) {
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
                            n = "".concat(a$).concat(r, "|"),
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
                                n = aJ.exec(e);
                            if (!n) return [e];
                            n.index > 0 && r.push(e.slice(0, n.index));
                            var i = n[1] && o[n[1]];
                            if (!i) return console.warn("Unexpected malformed segment", t), [];
                            i.used = !0;
                            var a = e.indexOf(i.end);
                            if (-1 === a) return console.warn("Unexpected malformed segment", t), [];
                            var u = e.slice(n.index + n[0].length, a),
                                c = i.render(l(u));
                            Array.isArray(c) ? r.push.apply(r, aZ(c)) : r.push(c);
                            var s = e.slice(a + i.end.length);
                            return s.length > 0 && r.push.apply(r, aZ(l(s))), r
                        },
                        u = l(a).filter(function(e) {
                            return "" !== e
                        });
                    return Object.values(o).some(function(e) {
                        return !e.used
                    }) ? (console.warn("Unused segments found", t), []) : u.map(function(e, t) {
                        return (0, I.jsx)(ti.Fragment, {
                            children: e
                        }, t)
                    })
                };

            function a1(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function a2(e) {
                if (Array.isArray(e)) return e
            }

            function a4() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function a3(e) {
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

            function a5(e, t) {
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

            function a6(e, t) {
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

            function a8(e, t) {
                if (e) {
                    if ("string" == typeof e) return a1(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return a1(e, t)
                }
            }
            var a7 = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                a9 = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                le = {
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
                lt = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                lr = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                ln = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                li = {
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
                lo = {
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
                la = (0, ti.forwardRef)(function(e, t) {
                    var r, n, i = a2(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || a8(r) || a4(),
                        o = i[0],
                        a = i.slice(1),
                        l = o.className,
                        u = o.icon,
                        c = o.ariaLabel,
                        s = o.isDisabled,
                        d = void 0 !== s && s,
                        f = o.isCircular,
                        p = o.isSelected,
                        y = o.size,
                        m = void 0 === y ? "Large" : y,
                        b = o.variant,
                        h = void 0 === b ? "Emphasis" : b,
                        g = o.iconColor,
                        v = void 0 === g ? "Default" : g,
                        w = o.asChild,
                        x = o.children,
                        j = a6(o, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]),
                        O = (a2(a) || function(e) {
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
                        }(a) || a8(a, 1) || a4())[0];
                    n = d ? lr[h] : void 0 !== p && p ? ln[h] : lt[h];
                    var S = ta("foundation-web-icon-button", d ? tm : [tp, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", a7[m], le[m][void 0 !== f && f ? "circular" : "square"], n, l),
                        I = to().createElement(to().Fragment, null, to().createElement(ty, null), to().createElement("span", {
                            className: ta("icon", u, a9[m], d ? lo[v][h] : li[v][h])
                        }));
                    if (w) {
                        j.as;
                        var M = a6(j, ["as"]),
                            N = to().Children.only(x);
                        return to().createElement(tT, a5(a3({
                            ref: O
                        }, M), {
                            className: S,
                            "aria-label": c,
                            "aria-disabled": d || void 0
                        }), to().cloneElement(N, {}, I))
                    }
                    if ("a" === j.as) {
                        j.as;
                        var P = j.href,
                            E = a6(j, ["as", "href"]);
                        return to().createElement("a", a5(a3({
                            ref: O
                        }, E), {
                            "aria-label": c,
                            "aria-disabled": d,
                            href: d ? void 0 : P,
                            className: S
                        }), I)
                    }
                    j.as;
                    var T = a6(j, ["as"]);
                    return to().createElement("button", a5(a3({
                        ref: O,
                        type: "button"
                    }, T), {
                        "aria-label": c,
                        disabled: d,
                        className: S
                    }), I)
                });

            function ll(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lu(e) {
                if (Array.isArray(e)) return e
            }

            function lc() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ls(e) {
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

            function ld(e, t) {
                if (e) {
                    if ("string" == typeof e) return ll(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ll(e, t)
                }
            }
            var lf = (0, ti.forwardRef)(function(e, t) {
                var r, n, i, o = lu(i = [e, t]) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(i) || ld(i) || lc(),
                    a = o[0],
                    l = o.slice(1),
                    u = a.className,
                    c = a.style,
                    s = a.orientation,
                    d = void 0 === s ? "horizontal" : s,
                    f = a.variant,
                    p = void 0 === f ? "Standard" : f,
                    y = function(e, t) {
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
                    m = (lu(l) || function(e) {
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
                    }(l) || ld(l, 1) || lc())[0],
                    b = "vertical" === d,
                    h = {};
                return b || "Inset" !== p ? b || "InsetLeft" !== p ? b || "InsetRight" !== p || (h = {
                    marginRight: "var(--padding-xlarge)"
                }) : h = {
                    marginLeft: "var(--padding-xlarge)"
                } : h = {
                    marginLeft: "var(--padding-xlarge)",
                    marginRight: "var(--padding-xlarge)"
                }, to().createElement("div", (r = ls({
                    ref: m
                }, y), n = n = {
                    role: "separator",
                    "data-orientation": d,
                    "aria-orientation": d,
                    style: ls({
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
                    className: ta("stroke-default self-stretch", u)
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

            function lp(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    i = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === i || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function ly(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lm(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function lb(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        lm(e, t, r[t])
                    })
                }
                return e
            }

            function lh(e, t) {
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

            function lg(e) {
                return function(e) {
                    if (Array.isArray(e)) return ly(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return ly(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ly(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lv() {
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
                            return lb({}, e, n(t)["__scope".concat(i)])
                        }, {});
                        return ti.useMemo(function() {
                            return lm({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return i.scopeName = n.scopeName, i
            }
            lf.displayName = "Divider";
            var lw = (null == (O = globalThis) ? void 0 : O.document) ? ti.useLayoutEffect : function() {};

            function lx(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var lj = ti[" useId ".trim().toString()] || function() {},
                lO = 0;

            function lS(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = ti.useState(lj())) || function(e) {
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
                            if ("string" == typeof e) return lx(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lx(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    i = r[1];
                return lw(function() {
                    e || i(function(e) {
                        return null != e ? e : String(lO++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function lI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lM(e) {
                var t = ti.useRef(e);
                return ti.useEffect(function() {
                    t.current = e
                }), ti.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), i = 0; i < r; i++) n[i] = arguments[i];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return lI(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return lI(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lI(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function lN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lP(e, t) {
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
                        if ("string" == typeof e) return lN(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lN(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lE(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lT(e) {
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

            function lA(e, t) {
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

            function lL(e) {
                return function(e) {
                    if (Array.isArray(e)) return lE(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return lE(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lE(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lC(e) {
                var t, r, n = (t = e, (r = ti.forwardRef(function(e, t) {
                        var r = e.children,
                            n = lA(e, ["children"]);
                        if (ti.isValidElement(r)) {
                            var i, o, a, l, u, c = (u = (l = null == (o = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (u = (l = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                                s = function(e, t) {
                                    var r = lT({}, t);
                                    for (var n in t) ! function(n) {
                                        var i = e[n],
                                            o = t[n];
                                        /^on[A-Z]/.test(n) ? i && o ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            o.apply(void 0, lL(t)), i.apply(void 0, lL(t))
                                        } : i && (r[n] = i) : "style" === n ? r[n] = lT({}, i, o) : "className" === n && (r[n] = [i, o].filter(Boolean).join(" "))
                                    }(n);
                                    return lT({}, e, r)
                                }(n, r.props);
                            return r.type !== ti.Fragment && (s.ref = t ? tv(t, c) : c), ti.cloneElement(r, s)
                        }
                        return ti.Children.count(r) > 1 ? ti.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    i = ti.forwardRef(function(e, t) {
                        var r = e.children,
                            i = lA(e, ["children"]),
                            o = ti.Children.toArray(r),
                            a = o.find(lk);
                        if (a) {
                            var l = a.props.children,
                                u = o.map(function(e) {
                                    return e !== a ? e : ti.Children.count(l) > 1 ? ti.Children.only(null) : ti.isValidElement(l) ? l.props.children : null
                                });
                            return (0, I.jsx)(n, lD(lT({}, i), {
                                ref: t,
                                children: ti.isValidElement(l) ? ti.cloneElement(l, void 0, u) : null
                            }))
                        }
                        return (0, I.jsx)(n, lD(lT({}, i), {
                            ref: t,
                            children: r
                        }))
                    });
                return i.displayName = "".concat(e, ".Slot"), i
            }
            var lR = Symbol("radix.slottable");

            function lk(e) {
                return ti.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === lR
            }

            function lU(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function lz(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        lU(e, t, r[t])
                    })
                }
                return e
            }

            function l_(e, t) {
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
            var lB = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                var r = lC("Primitive.".concat(t)),
                    n = ti.forwardRef(function(e, n) {
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
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, I.jsx)(a, l_(lz({}, o), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), l_(lz({}, e), lU({}, t, n))
            }, {});

            function lY(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lF(e, t) {
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
                }(e, t) || lG(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lG(e, t) {
                if (e) {
                    if ("string" == typeof e) return lY(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lY(e, t)
                }
            }
            var lW = "focusScope.autoFocusOnMount",
                lV = "focusScope.autoFocusOnUnmount",
                lQ = {
                    bubbles: !1,
                    cancelable: !0
                },
                lq = ti.forwardRef(function(e, t) {
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
                        d = lF(ti.useState(null), 2),
                        f = d[0],
                        p = d[1],
                        y = lM(u),
                        m = lM(c),
                        b = ti.useRef(null),
                        h = tw(t, function(e) {
                            return p(e)
                        }),
                        g = ti.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    ti.useEffect(function() {
                        if (l) {
                            var e = function(e) {
                                    if (!g.paused && f) {
                                        var t = e.target;
                                        f.contains(t) ? b.current = t : lX(b.current, {
                                            select: !0
                                        })
                                    }
                                },
                                t = function(e) {
                                    if (!g.paused && f) {
                                        var t = e.relatedTarget;
                                        null !== t && (f.contains(t) || lX(b.current, {
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
                                        for (var i, o = e[Symbol.iterator](); !(t = (i = o.next()).done); t = !0) i.value.removedNodes.length > 0 && lX(f)
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
                    }, [l, f, g.paused]), ti.useEffect(function() {
                        if (f) {
                            lZ.add(g);
                            var e = document.activeElement;
                            if (!f.contains(e)) {
                                var t = new CustomEvent(lW, lQ);
                                f.addEventListener(lW, y), f.dispatchEvent(t), t.defaultPrevented || (function(e) {
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
                                            if (lX(s, {
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
                                }(lK(f).filter(function(e) {
                                    return "A" !== e.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === e && lX(f))
                            }
                            return function() {
                                f.removeEventListener(lW, y), setTimeout(function() {
                                    var t = new CustomEvent(lV, lQ);
                                    f.addEventListener(lV, m), f.dispatchEvent(t), t.defaultPrevented || lX(null != e ? e : document.body, {
                                        select: !0
                                    }), f.removeEventListener(lV, m), lZ.remove(g)
                                }, 0)
                            }
                        }
                    }, [f, y, m, g]);
                    var v = ti.useCallback(function(e) {
                        if ((o || l) && !g.paused) {
                            var t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                                r = document.activeElement;
                            if (t && r) {
                                var n, i, a = e.currentTarget,
                                    u = lF([lH(i = lK(n = a), n), lH(i.reverse(), n)], 2),
                                    c = u[0],
                                    s = u[1];
                                c && s ? e.shiftKey || r !== s ? e.shiftKey && r === c && (e.preventDefault(), o && lX(s, {
                                    select: !0
                                })) : (e.preventDefault(), o && lX(c, {
                                    select: !0
                                })) : r === a && e.preventDefault()
                            }
                        }
                    }, [o, l, g.paused]);
                    return (0, I.jsx)(lB.div, (r = function(e) {
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

            function lK(e) {
                for (var t = [], r = document.createTreeWalker(e, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(e) {
                            var t = "INPUT" === e.tagName && "hidden" === e.type;
                            return e.disabled || e.hidden || t ? NodeFilter.FILTER_SKIP : e.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); r.nextNode();) t.push(r.currentNode);
                return t
            }

            function lH(e, t) {
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

            function lX(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = t.select;
                if (e && e.focus) {
                    var n, i, o, a = document.activeElement;
                    e.focus({
                        preventScroll: !0
                    }), e !== a && (i = n = e, null != (o = HTMLInputElement) && "u" > typeof Symbol && o[Symbol.hasInstance] ? !!o[Symbol.hasInstance](i) : i instanceof o) && "select" in n && void 0 !== r && r && e.select()
                }
            }
            lq.displayName = "FocusScope";
            var lZ = (t = [], {
                add: function(e) {
                    var r = t[0];
                    e !== r && (null == r || r.pause()), (t = l$(t, e)).unshift(e)
                },
                remove: function(e) {
                    var r;
                    null == (r = (t = l$(t, e))[0]) || r.resume()
                }
            });

            function l$(e, t) {
                var r = function(e) {
                        if (Array.isArray(e)) return lY(e)
                    }(e) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(e) || lG(e) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r.indexOf(t);
                return -1 !== n && r.splice(n, 1), r
            }

            function lJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var l0 = ti.forwardRef(function(e, t) {
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
                    }(r = ti.useState(!1)) || function(e) {
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
                            if ("string" == typeof e) return lJ(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lJ(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = c[0],
                    d = c[1];
                lw(function() {
                    return d(!0)
                }, []);
                var f = l || s && (null == (a = globalThis) || null == (o = a.document) ? void 0 : o.body);
                return f ? n1().createPortal((0, I.jsx)(lB.div, (n = function(e) {
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

            function l1(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function l2(e, t) {
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
                        if ("string" == typeof e) return l1(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return l1(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            l0.displayName = "Portal";
            var l4 = function(e) {
                var t, r, n, i, o, a, l, u, c, s, d, f, p, y, m, b, h, g = e.present,
                    v = e.children,
                    w = (t = g, o = (i = l2(ti.useState(), 2))[0], a = i[1], l = ti.useRef({}), u = ti.useRef(t), c = ti.useRef("none"), d = (s = l2((r = t ? "mounted" : "unmounted", n = {
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
                    }, ti.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], f = s[1], ti.useEffect(function() {
                        var e = l3(l.current);
                        c.current = "mounted" === d ? e : "none"
                    }, [d]), lw(function() {
                        var e = l.current,
                            r = u.current;
                        if (r !== t) {
                            var n = c.current,
                                i = l3(e);
                            t ? f("MOUNT") : "none" === i || (null == e ? void 0 : e.display) === "none" ? f("UNMOUNT") : r && n !== i ? f("ANIMATION_OUT") : f("UNMOUNT"), u.current = t
                        }
                    }, [t, f]), lw(function() {
                        if (o) {
                            var e, t, r = null != (e = o.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = l3(l.current).includes(e.animationName);
                                    if (e.target === o && n && (f("ANIMATION_END"), !u.current)) {
                                        var i = o.style.animationFillMode;
                                        o.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === o.style.animationFillMode && (o.style.animationFillMode = i)
                                        })
                                    }
                                },
                                i = function(e) {
                                    e.target === o && (c.current = l3(l.current))
                                };
                            return o.addEventListener("animationstart", i), o.addEventListener("animationcancel", n), o.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), o.removeEventListener("animationstart", i), o.removeEventListener("animationcancel", n), o.removeEventListener("animationend", n)
                                }
                        }
                        f("ANIMATION_END")
                    }, [o, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: ti.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    x = "function" == typeof v ? v({
                        present: w.isPresent
                    }) : ti.Children.only(v),
                    j = tw(w.ref, (h = (b = null == (y = Object.getOwnPropertyDescriptor((p = x).props, "ref")) ? void 0 : y.get) && "isReactWarning" in b && b.isReactWarning) ? p.ref : (h = (b = null == (m = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof v || w.isPresent ? ti.cloneElement(x, {
                    ref: j
                }) : null
            };

            function l3(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            l4.displayName = "Presence";
            var l5 = window.RadixUI["react-focus-guards"],
                l6 = function() {
                    return (l6 = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var i in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                        return e
                    }).apply(this, arguments)
                };

            function l8(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var i = 0, n = Object.getOwnPropertySymbols(e); i < n.length; i++) 0 > t.indexOf(n[i]) && Object.prototype.propertyIsEnumerable.call(e, n[i]) && (r[n[i]] = e[n[i]]);
                return r
            }
            var l7 = "right-scroll-bar-position",
                l9 = "width-before-scroll-bar";

            function ue(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var ut = "u" > typeof window ? ti.useLayoutEffect : ti.useEffect,
                ur = new WeakMap,
                un = (void 0 === l && (l = {}), (void 0 === u && (u = function(e) {
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
                }).options = l6({
                    async: !0,
                    ssr: !1
                }, l), d),
                ui = function() {},
                uo = ti.forwardRef(function(e, t) {
                    var r, n, i, o, a = ti.useRef(null),
                        l = ti.useState({
                            onScrollCapture: ui,
                            onWheelCapture: ui,
                            onTouchMoveCapture: ui
                        }),
                        u = l[0],
                        c = l[1],
                        s = e.forwardProps,
                        d = e.children,
                        f = e.className,
                        p = e.removeScrollBar,
                        y = e.enabled,
                        m = e.shards,
                        b = e.sideCar,
                        h = e.noRelative,
                        g = e.noIsolation,
                        v = e.inert,
                        w = e.allowPinchZoom,
                        x = e.as,
                        j = e.gapMode,
                        O = l8(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        S = (r = [a, t], n = function(e) {
                            return r.forEach(function(t) {
                                return ue(t, e)
                            })
                        }, (i = (0, ti.useState)(function() {
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
                        })[0]).callback = n, o = i.facade, ut(function() {
                            var e = ur.get(o);
                            if (e) {
                                var t = new Set(e),
                                    n = new Set(r),
                                    i = o.current;
                                t.forEach(function(e) {
                                    n.has(e) || ue(e, null)
                                }), n.forEach(function(e) {
                                    t.has(e) || ue(e, i)
                                })
                            }
                            ur.set(o, r)
                        }, [r]), o),
                        I = l6(l6({}, O), u);
                    return ti.createElement(ti.Fragment, null, y && ti.createElement(b, {
                        sideCar: un,
                        removeScrollBar: p,
                        shards: m,
                        noRelative: h,
                        noIsolation: g,
                        inert: v,
                        setCallbacks: c,
                        allowPinchZoom: !!w,
                        lockRef: a,
                        gapMode: j
                    }), s ? ti.cloneElement(ti.Children.only(d), l6(l6({}, I), {
                        ref: S
                    })) : ti.createElement(void 0 === x ? "div" : x, l6({}, I, {
                        className: f,
                        ref: S
                    }), d))
                });
            uo.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, uo.classNames = {
                fullWidth: l9,
                zeroRight: l7
            };
            var ua = function(e) {
                var t = e.sideCar,
                    r = l8(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var n = t.read();
                if (!n) throw Error("Sidecar medium not found");
                return ti.createElement(n, l6({}, r))
            };
            ua.isSideCarExport = !0;
            var ul = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(n) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = S || r.nc;
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
                uu = function() {
                    var e = ul();
                    return function(t, r) {
                        ti.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && r])
                    }
                },
                uc = function() {
                    var e = uu();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                us = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                ud = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                uf = function(e) {
                    var t = window.getComputedStyle(document.body),
                        r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        n = t["padding" === e ? "paddingTop" : "marginTop"],
                        i = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [ud(r), ud(n), ud(i)]
                },
                up = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return us;
                    var t = uf(e),
                        r = document.documentElement.clientWidth,
                        n = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, n - r + t[2] - t[0])
                    }
                },
                uy = uc(),
                um = "data-scroll-locked",
                ub = function(e, t, r, n) {
                    var i = e.left,
                        o = e.top,
                        a = e.right,
                        l = e.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(l, "px ").concat(n, ";\n  }\n  body[").concat(um, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(i, "px;\n    padding-top: ").concat(o, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(l7, " {\n    right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(l9, " {\n    margin-right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(l7, " .").concat(l7, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(l9, " .").concat(l9, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(um, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                uh = function() {
                    var e = parseInt(document.body.getAttribute(um) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                ug = function() {
                    ti.useEffect(function() {
                        return document.body.setAttribute(um, (uh() + 1).toString()),
                            function() {
                                var e = uh() - 1;
                                e <= 0 ? document.body.removeAttribute(um) : document.body.setAttribute(um, e.toString())
                            }
                    }, [])
                },
                uv = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        n = e.gapMode,
                        i = void 0 === n ? "margin" : n;
                    ug();
                    var o = ti.useMemo(function() {
                        return up(i)
                    }, [i]);
                    return ti.createElement(uy, {
                        styles: ub(o, !t, i, r ? "" : "!important")
                    })
                },
                uw = !1;
            if ("u" > typeof window) try {
                var ux = Object.defineProperty({}, "passive", {
                    get: function() {
                        return uw = !0, !0
                    }
                });
                window.addEventListener("test", ux, ux), window.removeEventListener("test", ux, ux)
            } catch (e) {
                uw = !1
            }
            var uj = !!uw && {
                passive: !1
            };

            function uO(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var uS = function(e, t) {
                    if (!uO(e, Element)) return !1;
                    var r = window.getComputedStyle(e);
                    return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
                },
                uI = function(e, t) {
                    var r = t.ownerDocument,
                        n = t;
                    do {
                        if ("u" > typeof ShadowRoot && uO(n, ShadowRoot) && (n = n.host), uM(e, n)) {
                            var i = uN(e, n);
                            if (i[1] > i[2]) return !0
                        }
                        n = n.parentNode
                    } while (n && n !== r.body);
                    return !1
                },
                uM = function(e, t) {
                    return "v" === e ? uS(t, "overflowY") : uS(t, "overflowX")
                },
                uN = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                uP = function(e, t, r, n, i) {
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
                        var y = uN(e, u),
                            m = y[0],
                            b = y[1] - y[2] - a * m;
                        (m || b) && uM(e, u) && (f += b, p += m);
                        var h = u.parentNode;
                        u = h && h.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? h.host : h
                    } while (!c && u !== document.body || c && (t.contains(u) || t === u));
                    return d && (i && 1 > Math.abs(f) || !i && l > f) ? s = !0 : !d && (i && 1 > Math.abs(p) || !i && -l > p) && (s = !0), s
                },
                uE = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                uT = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                uD = function(e) {
                    return e && "current" in e ? e.current : e
                },
                uA = 0,
                uL = [],
                uC = (f = function(e) {
                    var t = ti.useRef([]),
                        r = ti.useRef([0, 0]),
                        n = ti.useRef(),
                        i = ti.useState(uA++)[0],
                        o = ti.useState(uc)[0],
                        a = ti.useRef(e);
                    ti.useEffect(function() {
                        a.current = e
                    }, [e]), ti.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(i));
                            var t = (function(e, t, r) {
                                if (r || 2 == arguments.length)
                                    for (var n, i = 0, o = t.length; i < o; i++) !n && i in t || (n || (n = Array.prototype.slice.call(t, 0, i)), n[i] = t[i]);
                                return e.concat(n || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(uD), !0).filter(Boolean);
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
                    var l = ti.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !a.current.allowPinchZoom;
                            var i, o = uE(e),
                                l = r.current,
                                u = "deltaX" in e ? e.deltaX : l[0] - o[0],
                                c = "deltaY" in e ? e.deltaY : l[1] - o[1],
                                s = e.target,
                                d = Math.abs(u) > Math.abs(c) ? "h" : "v";
                            if ("touches" in e && "h" === d && "range" === s.type) return !1;
                            var f = uI(d, s);
                            if (!f) return !0;
                            if (f ? i = d : (i = "v" === d ? "h" : "v", f = uI(d, s)), !f) return !1;
                            if (!n.current && "changedTouches" in e && (u || c) && (n.current = i), !i) return !0;
                            var p = n.current || i;
                            return uP(p, t, e, "h" === p ? u : c, !0)
                        }, []),
                        u = ti.useCallback(function(e) {
                            if (uL.length && uL[uL.length - 1] === o) {
                                var r = "deltaY" in e ? uT(e) : uE(e),
                                    n = t.current.filter(function(t) {
                                        var n;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                                    })[0];
                                if (n && n.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!n) {
                                    var i = (a.current.shards || []).map(uD).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (i.length > 0 ? l(e, i[0]) : !a.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        c = ti.useCallback(function(e, r, n, i) {
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
                        s = ti.useCallback(function(e) {
                            r.current = uE(e), n.current = void 0
                        }, []),
                        d = ti.useCallback(function(t) {
                            c(t.type, uT(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        f = ti.useCallback(function(t) {
                            c(t.type, uE(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    ti.useEffect(function() {
                        return uL.push(o), e.setCallbacks({
                                onScrollCapture: d,
                                onWheelCapture: d,
                                onTouchMoveCapture: f
                            }), document.addEventListener("wheel", u, uj), document.addEventListener("touchmove", u, uj), document.addEventListener("touchstart", s, uj),
                            function() {
                                uL = uL.filter(function(e) {
                                    return e !== o
                                }), document.removeEventListener("wheel", u, uj), document.removeEventListener("touchmove", u, uj), document.removeEventListener("touchstart", s, uj)
                            }
                    }, []);
                    var p = e.removeScrollBar,
                        y = e.inert;
                    return ti.createElement(ti.Fragment, null, y ? ti.createElement(o, {
                        styles: "\n  .block-interactivity-".concat(i, " {pointer-events: none;}\n  .allow-interactivity-").concat(i, " {pointer-events: all;}\n")
                    }) : null, p ? ti.createElement(uv, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, un.useMedium(f), ua),
                uR = ti.forwardRef(function(e, t) {
                    return ti.createElement(uo, l6({}, e, {
                        ref: t,
                        sideCar: uC
                    }))
                });
            uR.classNames = uo.classNames;
            var uk = new WeakMap,
                uU = new WeakMap,
                uz = {},
                u_ = 0,
                uB = function(e) {
                    return e && (e.host || uB(e.parentNode))
                },
                uY = function(e, t, r, n) {
                    var i = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var r = uB(e);
                        return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    uz[r] || (uz[r] = new WeakMap);
                    var o = uz[r],
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
                                    u = (uk.get(e) || 0) + 1,
                                    c = (o.get(e) || 0) + 1;
                                uk.set(e, u), o.set(e, c), a.push(e), 1 === u && i && uU.set(e, !0), 1 === c && e.setAttribute(r, "true"), i || e.setAttribute(n, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return s(t), l.clear(), u_++,
                        function() {
                            a.forEach(function(e) {
                                var t = uk.get(e) - 1,
                                    i = o.get(e) - 1;
                                uk.set(e, t), o.set(e, i), t || (uU.has(e) || e.removeAttribute(n), uU.delete(e)), i || e.removeAttribute(r)
                            }), --u_ || (uk = new WeakMap, uk = new WeakMap, uU = new WeakMap, uz = {})
                        }
                },
                uF = function(e, t, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var n = Array.from(Array.isArray(e) ? e : [e]),
                        i = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return i ? (n.push.apply(n, Array.from(i.querySelectorAll("[aria-live], script"))), uY(n, i, r, "aria-hidden")) : function() {
                        return null
                    }
                };

            function uG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uW(e) {
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

            function uV(e, t) {
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

            function uQ(e, t) {
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

            function uq(e, t) {
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
                        if ("string" == typeof e) return uG(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uG(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var uK = "Dialog",
                uH = uq(function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        n = function() {
                            var t = r.map(function(e) {
                                return ti.createContext(e)
                            });
                            return function(r) {
                                var n = (null == r ? void 0 : r[e]) || t;
                                return ti.useMemo(function() {
                                    var t, i;
                                    return lm({}, "__scope".concat(e), (t = lb({}, r), i = null != (i = lm({}, e, n)) ? i : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(i)) : (function(e) {
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
                        var i = ti.createContext(n),
                            o = r.length;
                        r = lg(r).concat([n]);
                        var a = function(t) {
                            var r, n = t.scope,
                                a = t.children,
                                l = lh(t, ["scope", "children"]),
                                u = (null == n || null == (r = n[e]) ? void 0 : r[o]) || i,
                                c = ti.useMemo(function() {
                                    return l
                                }, Object.values(l));
                            return (0, I.jsx)(u.Provider, {
                                value: c,
                                children: a
                            })
                        };
                        return a.displayName = t + "Provider", [a, function(r, a) {
                            var l, u = (null == a || null == (l = a[e]) ? void 0 : l[o]) || i,
                                c = ti.useContext(u);
                            if (c) return c;
                            if (void 0 !== n) return n;
                            throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                        }]
                    }, lv.apply(void 0, [n].concat(lg(t)))]
                }(uK), 2),
                uX = uH[0];
            uH[1];
            var uZ = uq(uX(uK), 2),
                u$ = uZ[0],
                uJ = uZ[1],
                u0 = function(e) {
                    var t, r, n, i, o, a, l, u, c, s, d, f, p, y, m, b, h, g = e.__scopeDialog,
                        v = e.children,
                        w = e.open,
                        x = e.defaultOpen,
                        j = e.onOpenChange,
                        O = e.modal,
                        S = ti.useRef(null),
                        M = ti.useRef(null),
                        N = uq((c = (u = {
                            prop: w,
                            defaultProp: x,
                            onChange: j
                        }).prop, p = (f = lP((r = (t = {
                            defaultProp: u.defaultProp,
                            onChange: d = void 0 === (s = u.onChange) ? function() {} : s
                        }).defaultProp, n = t.onChange, o = lP(i = ti.useState(r), 1)[0], a = ti.useRef(o), l = lM(n), ti.useEffect(function() {
                            a.current !== o && (l(o), a.current = o)
                        }, [o, a, l]), i), 2))[0], y = f[1], b = (m = void 0 !== c) ? c : p, h = lM(d), [b, ti.useCallback(function(e) {
                            if (m) {
                                var t = "function" == typeof e ? e(c) : e;
                                t !== c && h(t)
                            } else y(e)
                        }, [m, c, y, h])]), 2),
                        P = N[0],
                        E = N[1];
                    return (0, I.jsx)(u$, {
                        scope: g,
                        triggerRef: S,
                        contentRef: M,
                        contentId: lS(),
                        titleId: lS(),
                        descriptionId: lS(),
                        open: void 0 !== P && P,
                        onOpenChange: E,
                        onOpenToggle: ti.useCallback(function() {
                            return E(function(e) {
                                return !e
                            })
                        }, [E]),
                        modal: void 0 === O || O,
                        children: v
                    })
                };
            u0.displayName = uK;
            var u1 = "DialogTrigger";
            ti.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = uQ(e, ["__scopeDialog"]),
                    i = uJ(u1, r),
                    o = tw(t, i.triggerRef);
                return (0, I.jsx)(lB.button, uV(uW({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": i.open,
                    "aria-controls": i.contentId,
                    "data-state": cd(i.open)
                }, n), {
                    ref: o,
                    onClick: lp(e.onClick, i.onOpenToggle)
                }))
            }).displayName = u1;
            var u2 = "DialogPortal",
                u4 = uq(uX(u2, {
                    forceMount: void 0
                }), 2),
                u3 = u4[0],
                u5 = u4[1],
                u6 = function(e) {
                    var t = e.__scopeDialog,
                        r = e.forceMount,
                        n = e.children,
                        i = e.container,
                        o = uJ(u2, t);
                    return (0, I.jsx)(u3, {
                        scope: t,
                        forceMount: r,
                        children: ti.Children.map(n, function(e) {
                            return (0, I.jsx)(l4, {
                                present: r || o.open,
                                children: (0, I.jsx)(l0, {
                                    asChild: !0,
                                    container: i,
                                    children: e
                                })
                            })
                        })
                    })
                };
            u6.displayName = u2;
            var u8 = "DialogOverlay",
                u7 = ti.forwardRef(function(e, t) {
                    var r = u5(u8, e.__scopeDialog),
                        n = e.forceMount,
                        i = void 0 === n ? r.forceMount : n,
                        o = uQ(e, ["forceMount"]),
                        a = uJ(u8, e.__scopeDialog);
                    return a.modal ? (0, I.jsx)(l4, {
                        present: i || a.open,
                        children: (0, I.jsx)(ce, uV(uW({}, o), {
                            ref: t
                        }))
                    }) : null
                });
            u7.displayName = u8;
            var u9 = lC("DialogOverlay.RemoveScroll"),
                ce = ti.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = uQ(e, ["__scopeDialog"]),
                        i = uJ(u8, r);
                    return (0, I.jsx)(uR, {
                        as: u9,
                        allowPinchZoom: !0,
                        shards: [i.contentRef],
                        children: (0, I.jsx)(lB.div, uV(uW({
                            "data-state": cd(i.open)
                        }, n), {
                            ref: t,
                            style: uW({
                                pointerEvents: "auto"
                            }, n.style)
                        }))
                    })
                }),
                ct = "DialogContent",
                cr = ti.forwardRef(function(e, t) {
                    var r = u5(ct, e.__scopeDialog),
                        n = e.forceMount,
                        i = void 0 === n ? r.forceMount : n,
                        o = uQ(e, ["forceMount"]),
                        a = uJ(ct, e.__scopeDialog);
                    return (0, I.jsx)(l4, {
                        present: i || a.open,
                        children: a.modal ? (0, I.jsx)(cn, uV(uW({}, o), {
                            ref: t
                        })) : (0, I.jsx)(ci, uV(uW({}, o), {
                            ref: t
                        }))
                    })
                });
            cr.displayName = ct;
            var cn = ti.forwardRef(function(e, t) {
                    var r = uJ(ct, e.__scopeDialog),
                        n = ti.useRef(null),
                        i = tw(t, r.contentRef, n);
                    return ti.useEffect(function() {
                        var e = n.current;
                        if (e) return uF(e)
                    }, []), (0, I.jsx)(co, uV(uW({}, e), {
                        ref: i,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: lp(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: lp(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                r = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || r) && e.preventDefault()
                        }),
                        onFocusOutside: lp(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                ci = ti.forwardRef(function(e, t) {
                    var r = uJ(ct, e.__scopeDialog),
                        n = ti.useRef(!1),
                        i = ti.useRef(!1);
                    return (0, I.jsx)(co, uV(uW({}, e), {
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
                co = ti.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = e.trapFocus,
                        i = e.onOpenAutoFocus,
                        o = e.onCloseAutoFocus,
                        a = uQ(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = uJ(ct, r),
                        u = ti.useRef(null),
                        c = tw(t, u);
                    return (0, l5.useFocusGuards)(), (0, I.jsxs)(I.Fragment, {
                        children: [(0, I.jsx)(lq, {
                            asChild: !0,
                            loop: !0,
                            trapped: n,
                            onMountAutoFocus: i,
                            onUnmountAutoFocus: o,
                            children: (0, I.jsx)(rI.DismissableLayer, uV(uW({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": cd(l.open)
                            }, a), {
                                ref: c,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, I.jsxs)(I.Fragment, {
                            children: [(0, I.jsx)(cm, {
                                titleId: l.titleId
                            }), (0, I.jsx)(cb, {
                                contentRef: u,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                ca = "DialogTitle",
                cl = ti.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = uQ(e, ["__scopeDialog"]),
                        i = uJ(ca, r);
                    return (0, I.jsx)(lB.h2, uV(uW({
                        id: i.titleId
                    }, n), {
                        ref: t
                    }))
                });
            cl.displayName = ca;
            var cu = "DialogDescription";
            ti.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = uQ(e, ["__scopeDialog"]),
                    i = uJ(cu, r);
                return (0, I.jsx)(lB.p, uV(uW({
                    id: i.descriptionId
                }, n), {
                    ref: t
                }))
            }).displayName = cu;
            var cc = "DialogClose",
                cs = ti.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = uQ(e, ["__scopeDialog"]),
                        i = uJ(cc, r);
                    return (0, I.jsx)(lB.button, uV(uW({
                        type: "button"
                    }, n), {
                        ref: t,
                        onClick: lp(e.onClick, function() {
                            return i.onOpenChange(!1)
                        })
                    }))
                });

            function cd(e) {
                return e ? "open" : "closed"
            }
            cs.displayName = cc;
            var cf = "DialogTitleWarning",
                cp = uq((p = {
                    contentName: ct,
                    titleName: ca,
                    docsSlug: "dialog"
                }, y = ti.createContext(p), (m = function(e) {
                    var t = e.children,
                        r = lh(e, ["children"]),
                        n = ti.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, I.jsx)(y.Provider, {
                        value: n,
                        children: t
                    })
                }).displayName = cf + "Provider", [m, function(e) {
                    var t = ti.useContext(y);
                    if (t) return t;
                    if (void 0 !== p) return p;
                    throw Error("`".concat(e, "` must be used within `").concat(cf, "`"))
                }]), 2),
                cy = (cp[0], cp[1]),
                cm = function(e) {
                    var t = e.titleId,
                        r = cy(cf),
                        n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return ti.useEffect(function() {
                        t && (document.getElementById(t) || console.error(n))
                    }, [n, t]), null
                },
                cb = function(e) {
                    var t = e.contentRef,
                        r = e.descriptionId,
                        n = cy("DialogDescriptionWarning"),
                        i = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
                    return ti.useEffect(function() {
                        var e, n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        r && n && (document.getElementById(r) || console.warn(i))
                    }, [i, t, r]), null
                },
                ch = function(e) {
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
                    return to().createElement(u6, null, to().createElement(u7, {
                        "data-testid": "fui-base-sheet-overlay",
                        "data-type": t,
                        "data-side": "sideSheet" === t ? void 0 === r ? "right" : r : void 0,
                        "data-flush": "sideSheet" === t ? void 0 !== n && n : void 0,
                        "data-size": "centerSheet" === t ? void 0 === i ? "Medium" : i : void 0,
                        className: ta("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", a)
                    }, to().createElement(cr, {
                        "data-testid": "fui-base-sheet-content",
                        className: ta("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", l),
                        onOpenAutoFocus: u,
                        onCloseAutoFocus: c,
                        onPointerDownOutside: s,
                        onEscapeKeyDown: d,
                        onInteractOutside: f
                    }, o)))
                };

            function cg(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var cv = function(e) {
                    return ("function" != typeof e.checkVisibility || e.checkVisibility()) && !("disabled" in e && e.disabled || "true" === e.getAttribute("aria-disabled"))
                },
                cw = function(e) {
                    cg(e, HTMLInputElement) && "function" == typeof e.select && e.select()
                },
                cx = function(e) {
                    var t = e.currentTarget;
                    if (t) {
                        var r = t.querySelectorAll("[data-autofocus-priority]");
                        if (0 !== r.length) {
                            var n = [];
                            r.forEach(function(e) {
                                var t = parseInt(e.getAttribute("data-autofocus-priority") || "", 10);
                                !Number.isNaN(t) && cg(e, HTMLElement) && n.push({
                                    element: e,
                                    priority: t
                                })
                            }), n.sort(function(e, t) {
                                return e.priority - t.priority
                            });
                            var i = n.find(function(e) {
                                return cv(e.element)
                            });
                            if (i) {
                                e.preventDefault();
                                var o = document.activeElement === i.element;
                                i.element.focus(), o || cw(i.element)
                            }
                        }
                    }
                };

            function cj(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cO(e) {
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

            function cS(e, t) {
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

            function cI(e, t) {
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

            function cM(e) {
                return function(e) {
                    if (Array.isArray(e)) return cj(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return cj(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return cj(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var cN = Symbol("radix.slottable");

            function cP(e) {
                return ti.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === cN
            }

            function cE(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function cT(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        cE(e, t, r[t])
                    })
                }
                return e
            }

            function cD(e, t) {
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
            var cA = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r, n, i, o, a, l = (r = i = "Primitive.".concat(t), (n = ti.forwardRef(function(e, t) {
                        var r = e.children,
                            n = cI(e, ["children"]);
                        if (ti.isValidElement(r)) {
                            var i, o, a, l, u, c = (u = (l = null == (o = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (u = (l = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                                s = function(e, t) {
                                    var r = cO({}, t);
                                    for (var n in t) ! function(n) {
                                        var i = e[n],
                                            o = t[n];
                                        /^on[A-Z]/.test(n) ? i && o ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = o.apply(void 0, cM(t));
                                            return i.apply(void 0, cM(t)), n
                                        } : i && (r[n] = i) : "style" === n ? r[n] = cO({}, i, o) : "className" === n && (r[n] = [i, o].filter(Boolean).join(" "))
                                    }(n);
                                    return cO({}, e, r)
                                }(n, r.props);
                            return r.type !== ti.Fragment && (s.ref = t ? tv(t, c) : c), ti.cloneElement(r, s)
                        }
                        return ti.Children.count(r) > 1 ? ti.Children.only(null) : null
                    })).displayName = "".concat(r, ".SlotClone"), o = n, (a = ti.forwardRef(function(e, t) {
                        var r = e.children,
                            n = cI(e, ["children"]),
                            i = ti.Children.toArray(r),
                            a = i.find(cP);
                        if (a) {
                            var l = a.props.children,
                                u = i.map(function(e) {
                                    return e !== a ? e : ti.Children.count(l) > 1 ? ti.Children.only(null) : ti.isValidElement(l) ? l.props.children : null
                                });
                            return (0, I.jsx)(o, cS(cO({}, n), {
                                ref: t,
                                children: ti.isValidElement(l) ? ti.cloneElement(l, void 0, u) : null
                            }))
                        }
                        return (0, I.jsx)(o, cS(cO({}, n), {
                            ref: t,
                            children: r
                        }))
                    })).displayName = "".concat(i, ".Slot"), a),
                    u = ti.forwardRef(function(e, r) {
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
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, I.jsx)(o, cD(cT({}, i), {
                            ref: r
                        }))
                    });
                return u.displayName = "Primitive.".concat(t), cD(cT({}, e), cE({}, t, u))
            }, {});

            function cL(e) {
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
            var cC = Object.freeze({
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
                cR = ti.forwardRef(function(e, t) {
                    var r, n;
                    return (0, I.jsx)(cA.span, (r = cL({}, e), n = n = {
                        ref: t,
                        style: cL({}, cC, e.style)
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

            function ck(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            cR.displayName = "VisuallyHidden", r(977);
            var cU = "u" > typeof window ? ti.useLayoutEffect : ti.useEffect,
                cz = "u" < typeof window;

            function c_(e) {
                var t, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = r.defaultValue,
                    i = void 0 !== n && n,
                    o = r.initializeWithValue,
                    a = void 0 === o || o,
                    l = function(e) {
                        return cz ? i : window.matchMedia(e).matches
                    },
                    u = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = (0, ti.useState)(function() {
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
                            if ("string" == typeof e) return ck(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ck(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    c = u[0],
                    s = u[1];

                function d() {
                    s(l(e))
                }
                return cU(function() {
                    var t = window.matchMedia(e);
                    return d(), t.addListener ? t.addListener(d) : t.addEventListener("change", d),
                        function() {
                            t.removeListener ? t.removeListener(d) : t.removeEventListener("change", d)
                        }
                }, [e]), c
            }

            function cB(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cY(e) {
                if (Array.isArray(e)) return e
            }

            function cF() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
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

            function cV(e, t) {
                if (e) {
                    if ("string" == typeof e) return cB(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cB(e, t)
                }
            }
            var cQ = (0, ti.createContext)(null),
                cq = function() {
                    var e = (0, ti.useContext)(cQ);
                    if (!e) throw Error("Sheet components must be used within a Sheet");
                    return e
                },
                cK = "padding-x-xlarge",
                cH = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.defaultOpen,
                        i = e.children;
                    return to().createElement(u0, {
                        open: t,
                        onOpenChange: r,
                        defaultOpen: n,
                        modal: !0
                    }, i)
                },
                cX = function(e) {
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
                        y = e.onPointerDownOutside,
                        m = e.onEscapeKeyDown,
                        b = e.onInteractOutside,
                        h = c_("(orientation: portrait) and (max-width: 600px)"),
                        g = c_("(orientation: landscape) and (max-height: 600px)");
                    t = h ? "bottomSheet" : g || "side" === a ? "sideSheet" : "centerSheet";
                    var v = (0, ti.useMemo)(function() {
                            return {
                                centerSheetSize: i,
                                largeScreenVariant: a,
                                closeLabel: l,
                                isPortraitMobile: h,
                                isLandscapeMobile: g,
                                type: t
                            }
                        }, [i, a, l, h, g, t]),
                        w = ta(u, h && c, g && s, !h && !g && d);
                    return to().createElement(cQ.Provider, {
                        value: v
                    }, to().createElement(ch, {
                        type: t,
                        sideSheetSide: "right",
                        isSideSheetFlush: g,
                        centerSheetSize: i,
                        contentClassName: w,
                        onOpenAutoFocus: null != f ? f : cx,
                        onCloseAutoFocus: p,
                        onPointerDownOutside: y,
                        onEscapeKeyDown: m,
                        onInteractOutside: b
                    }, r))
                },
                cZ = (0, ti.forwardRef)(function(e, t) {
                    var r, n = cY(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || cV(r) || cF(),
                        i = n[0],
                        o = n.slice(1),
                        a = i.children,
                        l = i.className,
                        u = i.hasPaddingX,
                        c = cW(i, ["children", "className", "hasPaddingX"]),
                        s = (cY(o) || function(e) {
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
                        }(o) || cV(o, 1) || cF())[0],
                        d = cq().type;
                    return to().createElement("div", cG({
                        ref: s,
                        className: ta("scroll-y", (void 0 === u || u) && cK, "sideSheet" === d ? "grow-1" : "", l)
                    }, c), a)
                });
            cZ.displayName = "SheetBody";
            var c$ = function(e) {
                    var t = e.className,
                        r = e.children,
                        n = e.navigation,
                        i = e.utilities,
                        o = e.visuallyHideTitleText,
                        a = cq().closeLabel,
                        l = to().createElement(cl, {
                            className: "text-heading-small margin-none"
                        }, r);
                    return to().createElement("div", {
                        className: ta(t, n ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
                    }, to().createElement("div", {
                        className: ta("flex items-center", n && "gap-xsmall")
                    }, n, o ? to().createElement(cR, null, l) : l), to().createElement("div", {
                        className: ta("flex items-center", i && "gap-xxsmall")
                    }, i, to().createElement("div", {
                        className: "fui-sheet-close-affordance-container"
                    }, to().createElement(cs, {
                        asChild: !0
                    }, to().createElement(la, {
                        variant: "Utility",
                        size: "Medium",
                        icon: "icon-regular-x",
                        ariaLabel: a || "",
                        "data-autofocus-priority": "1000"
                    })))))
                },
                cJ = function(e) {
                    var t = e.children,
                        r = e.className,
                        n = cW(e, ["children", "className"]);
                    return to().createElement(to().Fragment, null, to().createElement(lf, null), to().createElement("div", cG({
                        className: ta(cK, "margin-y-small shrink-0", r)
                    }, n), t))
                },
                c0 = function(e) {
                    var t = e.iconName,
                        r = e.label;
                    return (0, I.jsxs)("div", {
                        className: "gap-x-medium align-items-center flex flex-row",
                        children: [(0, I.jsx)(tf, {
                            name: t,
                            size: "Large"
                        }), (0, I.jsx)("span", {
                            className: "[font-size:var(--font-size-350)]",
                            children: r
                        })]
                    })
                },
                c1 = function(e) {
                    var t = e.featureConfig,
                        r = e.currencySubscriptionBenefit,
                        n = (0, M.useTranslation)(),
                        i = n.translate,
                        o = n.intl,
                        a = (0, ti.useMemo)(function() {
                            var e;
                            return null == (e = t.virtualTransactionDiscounts) ? void 0 : e.find(function(e) {
                                return 0 === e.periodIndex
                            })
                        }, [t]),
                        l = (0, ti.useMemo)(function() {
                            var e;
                            return null == (e = t.virtualTransactionDiscounts) ? void 0 : e.filter(function(e) {
                                return e.periodIndex > 0
                            }).reduce(function(e, t) {
                                return null === e || t.periodIndex < e.periodIndex ? t : e
                            }, null)
                        }, [t]);
                    return (0, I.jsxs)("div", {
                        className: "gap-y-xlarge flex flex-col",
                        children: [a && (l ? (0, I.jsx)(c0, {
                            iconName: "icon-regular-tag",
                            label: i("Description.Benefit.DiscountV2")
                        }) : (0, I.jsx)(c0, {
                            iconName: "icon-regular-tag",
                            label: i("Description.Benefit.DiscountBase", {
                                discountPercent: o.n(.01 * a.discountPercent, {
                                    style: "percent"
                                })
                            })
                        })), (0, I.jsx)(c0, {
                            iconName: "icon-regular-paint-brush",
                            label: i("Description.Benefit.Customize")
                        }), (0, I.jsx)(c0, {
                            iconName: "icon-regular-controller",
                            label: i("Label.BlackbirdPSDiscount")
                        }), r && r.entitledAmountMicrosPerGrantingPeriod > 0 && (0, I.jsx)(c0, {
                            iconName: "icon-regular-robux",
                            label: i("Description.Benefit.RobuxStipend", {
                                amount: o.n(Math.round(r.entitledAmountMicrosPerGrantingPeriod / 1e6)),
                                periodType: r.grantingPeriodType
                            })
                        }), t.isRobuxTransferEnabled && (0, I.jsx)(c0, {
                            iconName: "icon-regular-robux",
                            label: i("Description.Benefit.RobuxTransfers")
                        }), t.isTradingEnabled && (0, I.jsx)(c0, {
                            iconName: "icon-regular-hand-two-arrows-horizontal",
                            label: i("Description.Benefit.TradeResellItems")
                        }), t.isUgcPublishingEnabled && (0, I.jsx)(c0, {
                            iconName: "icon-regular-arrow-up-from-landscape-rectangle",
                            label: i("Description.Benefit.PublishItems")
                        })]
                    })
                },
                c2 = window.Roblox,
                c4 = c2.EnvironmentUrls.apiGatewayUrl,
                c3 = new e5(new eG({
                    robloxSiteDomain: c2.EnvironmentUrls.domain,
                    basePath: "".concat(c4, "/subscriptions"),
                    credentials: "include"
                }));

            function c5(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }
            var c6 = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        t = e.referrerId,
                        r = e.enabled,
                        n = Number.parseInt(null != t ? t : "", 10),
                        i = Number.isFinite(n) && n > 0,
                        o = (void 0 === r || r) && i,
                        a = (0, T.useQuery)({
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
                                                return [4, c3.subscriptionsV2CreateSubscriptionReferral({
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
                                            c5(o, n, i, a, l, "next", e)
                                        }

                                        function l(e) {
                                            c5(o, n, i, a, l, "throw", e)
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
                c8 = function(e, t) {
                    var r = (0, M.useTranslation)().intl;
                    return (0, ti.useMemo)(function() {
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
                };

            function c7(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }
            var c9 = function(e) {
                    var t, r, n;
                    return Math.floor((null != (t = null == (n = e.productTypeDetails.robloxSubscriptionProductDetails) || null == (r = n.featureConfig.currencySubscriptionConfig) ? void 0 : r.entitledAmountMicros) ? t : 0) / 1e6)
                },
                se = function() {
                    var e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        r = t.enabled,
                        n = void 0 === r || r,
                        i = (0, T.useQuery)({
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
                                                return [4, c3.subscriptionsV2ListAvailableSubscriptionProducts({
                                                    productType: eJ,
                                                    includePurchased: !0,
                                                    includeBundles: !0,
                                                    skipEligibilityCheck: !0
                                                })];
                                            case 1:
                                                return [2, null != (e = t.sent().products.toSorted(function(e, t) {
                                                    return c9(e) - c9(t)
                                                }).at(0)) ? e : null]
                                        }
                                    })
                                }, function() {
                                    var t = this,
                                        r = arguments;
                                    return new Promise(function(n, i) {
                                        var o = e.apply(t, r);

                                        function a(e) {
                                            c7(o, n, i, a, l, "next", e)
                                        }

                                        function l(e) {
                                            c7(o, n, i, a, l, "throw", e)
                                        }
                                        a(void 0)
                                    })
                                })()
                            }
                        }),
                        o = i.data,
                        a = i.isLoading;
                    return {
                        subscribeButtonProps: (0, ti.useMemo)(function() {
                            var e = (0, e7.getDeviceMeta)();
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

            function st(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }
            var sr = new Map([
                    ["Invalid", "Invalid"],
                    ["Eligible", "Eligible"],
                    ["Ineligible", "Ineligible"],
                    [0, "Invalid"],
                    [1, "Eligible"],
                    [2, "Ineligible"]
                ]),
                sn = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        t = e.referrerId,
                        r = e.enabled,
                        n = Number.parseInt(null != t ? t : "", 10),
                        i = Number.isFinite(n) && n > 0,
                        o = (void 0 === r || r) && i,
                        a = (0, T.useQuery)({
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
                                                return [4, c3.subscriptionsV2CheckSubscriptionReferralEligibility({
                                                    referrerId: n
                                                })];
                                            case 1:
                                                return e = t.sent().eligibility, [2, sr.get(e)]
                                        }
                                    })
                                }, function() {
                                    var t = this,
                                        r = arguments;
                                    return new Promise(function(n, i) {
                                        var o = e.apply(t, r);

                                        function a(e) {
                                            st(o, n, i, a, l, "next", e)
                                        }

                                        function l(e) {
                                            st(o, n, i, a, l, "throw", e)
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
                si = window.Roblox["core-scripts"].dataStore,
                so = r.n(si),
                sa = function(e) {
                    var t = Number.parseInt(null != e ? e : "", 10),
                        r = Number.isFinite(t) && t > 0,
                        n = (0, T.useQuery)({
                            queryKey: ["plus-referrals", "referrer", t],
                            enabled: r,
                            retry: !1,
                            queryFn: function() {
                                return so().userDataStore.getUser(t)
                            }
                        }),
                        i = n.data,
                        o = n.isLoading;
                    return {
                        handle: i ? "@".concat(i.name) : void 0,
                        isLoading: r && o
                    }
                };

            function sl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var su = function(e) {
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
                    y = e.onMobilePurchaseInitiated,
                    m = e.isLoading,
                    b = e.children,
                    h = e.trackSubscriptionButtonClick,
                    g = e.loadingStateDisabled,
                    v = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = (0, ti.useState)(!1)) || function(e) {
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
                            if ("string" == typeof e) return sl(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sl(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    w = v[0],
                    x = v[1],
                    j = i.isAndroidApp || i.isIosApp,
                    O = r === eJ ? "RobloxPlus" : r,
                    S = (0, ti.useMemo)(function() {
                        var e = new URL(j ? "/mobile-app-upgrades/buy" : "/upgrades/paymentmethods", window.location.origin);
                        return e.searchParams.append("ctx", "subscription"), e.searchParams.append("type", O), e.searchParams.append("id", n), f && e.searchParams.append("paymentSessionId", f), d && e.searchParams.append("referrerId", d), !j && s && e.searchParams.append("redirectUrl", s), e.toString()
                    }, [j, O, n, f, d, s]),
                    M = (0, ti.useCallback)(function() {
                        if (!c) {
                            if (null == h || h(), s && function(e) {
                                    try {
                                        var t = JSON.stringify({
                                            url: e,
                                            ts: Date.now()
                                        });
                                        sessionStorage.setItem(tn, t)
                                    } catch (e) {}
                                }(s), null == p || p(), j) {
                                null == y || y();
                                return
                            }
                            x(!0)
                        }
                    }, [c, h, s, p, j, y]);
                return (0, I.jsx)(tW, {
                    as: "a",
                    className: l,
                    href: S,
                    isDisabled: c,
                    isLoading: void 0 !== g && g ? void 0 : null != m ? m : w,
                    size: a,
                    variant: void 0 === o ? "Emphasis" : o,
                    onClick: M,
                    children: b
                })
            };

            function sc(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ss(e) {
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

            function sd(e, t) {
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
            var sf = ["Feature.RobloxSubscription"],
                sp = "margin-x-auto width-full max-width-[200px] medium:max-width-[320px]",
                sy = "margin-bottom-[-8px]",
                sm = {
                    currencyCode: "USD",
                    units: 0,
                    nanos: 0
                },
                sb = {
                    invalid: {
                        key: "Description.ReferralInvalid",
                        fallback: "This referral link is no longer valid. You can still join Roblox Plus without the referral reward."
                    },
                    ineligible: {
                        key: "Description.ReferralIneligible",
                        fallback: "This referral reward is not available on your account. You can still join Roblox Plus."
                    }
                },
                sh = function(e, t) {
                    var r = new URLSearchParams({
                        ctx: "plus_referral",
                        referralCode: e
                    });
                    return t && r.set("referrerId", t), "/plus?".concat(r.toString())
                },
                sg = function(e) {
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
                        d = (0, M.useTranslation)(),
                        f = d.translate,
                        p = d.intl,
                        y = "pitch" === t,
                        m = p.n(100),
                        b = c8(null != u ? u : sm),
                        h = sa(y ? o : void 0),
                        g = h.handle,
                        v = h.isLoading,
                        w = f("Heading.ReferralRecipientJoin", void 0, "Join Plus, get"),
                        x = f("Action.ReferralJoinPlus", void 0, "Join Roblox Plus"),
                        j = f("Action.Subscribe", void 0, "Subscribe"),
                        O = (0, ti.useMemo)(function() {
                            var e, t, r = void 0 !== i ? sh(i, o) : void 0;
                            return sd(ss({}, l), {
                                redirectUrl: null != (e = l.redirectUrl) ? e : r,
                                referrerId: null != (t = l.referrerId) ? t : o
                            })
                        }, [i, o, l]),
                        S = [{
                            opening: "linkStart",
                            closing: "linkEnd",
                            render: function(e) {
                                return (0, I.jsx)("a", {
                                    className: "content-link underline",
                                    href: tt,
                                    rel: "noopener noreferrer",
                                    target: "_blank",
                                    children: e
                                })
                            }
                        }],
                        N = (0, ti.useRef)(!1);
                    (0, ti.useEffect)(function() {
                        r && (N.current = !1)
                    }, [r]);
                    var P = (0, ti.useCallback)(function() {
                            N.current = !0, aQ(t, o, i, a), aY("ReferralSubscribeClick", ss({
                                face: t
                            }, a ? {
                                surface: a
                            } : {}))
                        }, [t, o, i, a]),
                        E = (0, ti.useCallback)(function(e) {
                            e || N.current || (aq(t, o, i, a), aY("ReferralDismissed", ss({
                                face: t
                            }, a ? {
                                surface: a
                            } : {}))), n(e)
                        }, [t, n, o, i, a]);
                    return (0, I.jsx)(cH, {
                        open: r,
                        onOpenChange: E,
                        children: (0, I.jsxs)(cX, {
                            centerSheetSize: "Medium",
                            className: y ? "[&>[role=separator]]:[display:none]" : void 0,
                            closeLabel: f("Action.Close"),
                            largeScreenVariant: "center",
                            children: [(0, I.jsx)(c$, {
                                visuallyHideTitleText: !0,
                                children: y ? "".concat(w, " ").concat(m) : x
                            }), "pitch" === t ? (0, I.jsxs)(cZ, {
                                className: "gap-y-medium padding-top-small padding-bottom-small medium:padding-top-medium medium:padding-bottom-medium flex flex-col",
                                children: [(0, I.jsx)("img", {
                                    alt: "",
                                    className: "".concat(sp, " ").concat(sy, " dark:hidden"),
                                    src: "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMjAiIGhlaWdodD0iMTgwIiBmaWxsPSJub25lIiB2aWV3Qm94PSIwIDAgMzIwIDE4MCI+PHBhdGggZmlsbD0iIzFiMjU0YiIgZmlsbC1vcGFjaXR5PSIuMTYiIGQ9Ik0yNTYuNDg2IDM2LjkwNWE0IDQgMCAwIDEgMi42MzEgNC44NGwtMjMuODExIDg4Ljg2Ni0uMDU5LjE5OGE0IDQgMCAwIDEtNC42NCAyLjY3OWwtLjItLjA0OS02NS4xMzMtMTcuNDUyLS40NDgtMS42NzMgNjUuOTY5IDE3LjY3NmEyLjUgMi41IDAgMCAwIDMuMDYyLTEuNzY3bDIzLjgxMS04OC44NjZhMi41IDIuNSAwIDAgMC0xLjc2OC0zLjA2MmwtODguODY1LTIzLjgxYTIuNSAyLjUgMCAwIDAtMy4wNjIgMS43NjdMMTUxLjI2MiA2My42OWwtLjc3Ni0yLjg5OCAxMi4wMzgtNDQuOTI4YTQgNCAwIDAgMSA0Ljg5OS0yLjgyOWw4OC44NjUgMjMuODEyeiIvPjxwYXRoIGZpbGw9IiMyMDIyMjciIGQ9Ik0yMDIuMjMzIDQyLjc4YTkuODYgOS44NiAwIDAgMSA5LjMyMiAyLjQ5OGwxNi4wNzQgMTUuNzM5YzIuNDQ4IDIuMzk3IDMuNDIxIDUuODc2IDIuNTUgOS4xMjVsLTUuNzE2IDIxLjMzMi0uMDg2LjMwMmMtLjk0NiAzLjEwMy0zLjQ2OSA1LjUtNi42ODUgNi4zMjVsLTIxLjc5IDUuNTkzLS4zMTIuMDc1YTkuODYgOS44NiAwIDAgMS05LjAwOS0yLjU3M2wtMTYuMDc0LTE1LjczOGMtMi4zNzItMi4zMjMtMy4zNTktNS42Ni0yLjYyNy04LjgybC4wNzctLjMwNUwxNzMuNjcyIDU1Yy44NDQtMy4xNDggMy4yOTMtNS42MTggNi40NjMtNi41NDNsLjMwOS0uMDg0em02LjE3MyA1LjcxNGE1LjM2IDUuMzYgMCAwIDAtNS4wNTQtMS4zNTRsLTIxLjc4OSA1LjU5MmMtMS43ODIuNDU3LTMuMTAzIDEuNzktMy41NDQgMy40MzRsLTUuNzE2IDIxLjMzMWMtLjQ0IDEuNjQ0LjAzNyAzLjQ2IDEuMzUyIDQuNzQ2bDE2LjA3NCAxNS43MzhhNS4zNiA1LjM2IDAgMCAwIDUuMDU0IDEuMzU0bDIxLjc5LTUuNTkyYzEuNzgyLS40NTcgMy4xMDMtMS43OSAzLjU0NC0zLjQzNGw1LjcxNS0yMS4zMzJjLjQ0MS0xLjY0NC0uMDM3LTMuNDU4LTEuMzUyLTQuNzQ2em0tNi4yNzcgNS4yODhhNC4xNiA0LjE2IDAgMCAxIDQuMDE1IDEuMDc2bDExLjMwNCAxMS4zMDNhNC4xNiA0LjE2IDAgMCAxIDEuMDc1IDQuMDE0bC00LjEzNyAxNS40NDFhNC4xNiA0LjE2IDAgMCAxLTIuOTM5IDIuOTRsLTE1LjQ0MSA0LjEzNmE0LjE2IDQuMTYgMCAwIDEtNC4wMTQtMS4wNzZsLTExLjMwNC0xMS4zMDNhNC4xNiA0LjE2IDAgMCAxLTEuMDc1LTQuMDE0bDQuMTM3LTE1LjQ0MWE0LjE2IDQuMTYgMCAwIDEgMi45MzktMi45NHptLTcuMjUyIDkuMDE1YTIuMjUgMi4yNSAwIDAgMC0yLjc1NSAxLjU5MWwtMy40OTUgMTMuMDRhMi4yNSAyLjI1IDAgMCAwIDEuNTkxIDIuNzU2bDEzLjA0IDMuNDk0YTIuMjUgMi4yNSAwIDAgMCAyLjc1Ni0xLjU5MWwzLjQ5NC0xMy4wNGEyLjI1IDIuMjUgMCAwIDAtMS41OTEtMi43NTZ6Ii8+PHBhdGggZmlsbD0iIzFiMjU0YiIgZmlsbC1vcGFjaXR5PSIuMTYiIGQ9Im0xNjYuOTg1IDEzNy44MDMuMzg4IDEuNDQ5LTg4Ljg2NSAyMy44MTEtLjM4OC0xLjQ0OXptMS43NjgtMy4wNjItMjMuODExLTg4Ljg2NWEyLjUgMi41IDAgMCAwLTMuMDYyLTEuNzY4TDUzLjAxNSA2Ny45MmEyLjUgMi41IDAgMCAwLTEuNzY4IDMuMDYxbDIzLjgxMSA4OC44NjZhMi41IDIuNSAwIDAgMCAzLjA2MiAxLjc2N2wuMzg4IDEuNDQ5LS4yLjA0OWE0IDQgMCAwIDEtNC42NC0yLjY3OWwtLjA1OS0uMTk4TDQ5Ljc5OCA3MS4zN2E0IDQgMCAwIDEgMi44MjgtNC45bDg4Ljg2Ni0yMy44MS4yLS4wNWE0IDQgMCAwIDEgNC42OTkgMi44NzhsMjMuODExIDg4Ljg2NS4wNDkuMmE0IDQgMCAwIDEtMi42OCA0LjY0MWwtLjE5OC4wNTgtLjM4OC0xLjQ0OWEyLjUgMi41IDAgMCAwIDEuNzY4LTMuMDYyIi8+PHBhdGggZmlsbD0iIzIwMjIyNyIgZD0iTTk3LjUxMyA3NC45MDJhOS44NiA5Ljg2IDAgMCAxIDkuMzIxLTIuNDk4bDIxLjc5IDUuNTkzYzMuMzE5Ljg1MiA1LjkwMSAzLjM3OCA2Ljc3MSA2LjYyOGw1LjcxNiAyMS4zMzEuMDc3LjMwNWMuNzMyIDMuMTYxLS4yNTUgNi40OTgtMi42MjcgOC44MmwtMTYuMDc0IDE1LjczOS0uMjMzLjIyMWE5Ljg2IDkuODYgMCAwIDEtOS4wODkgMi4yNzdsLTcuMzg5LTEuODk3YTMgMyAwIDAgMS0yLjE1Mi0yLjEzbC03LjUwNy0yOC4wMTYtMS4wMDMtMy43NGE0IDQgMCAwIDEgMi44MjgtNC45bDE3LjM4Ny00LjY2YTQgNCAwIDAgMSA0Ljg5OCAyLjgyOGw0LjA3NyAxNS4yMTNhNCA0IDAgMCAxLTIuODI5IDQuODk5bC04LjY5MyAyLjMzYTEuNzUgMS43NSAwIDAgMS0uOTA2LTMuMzgxbDguNjk0LTIuMzNhLjUuNSAwIDAgMCAuMzUzLS42MTJsLTQuMDc2LTE1LjIxM2EuNS41IDAgMCAwLS42MTMtLjM1NGwtMTcuMzg2IDQuNjZhLjUuNSAwIDAgMC0uMzUzLjYxM2w4LjQzNCAzMS40NzYgNy4xMDYgMS44MjRhNi4zNiA2LjM2IDAgMCAwIDYuMDA0LTEuNjA4bDE2LjA3My0xNS43MzljMS41NjctMS41MzQgMi4xNTQtMy43MTggMS42MTgtNS43MTlsLTUuNzE1LTIxLjMzMWMtLjUzNy0yLjAwMS0yLjEzNy0zLjYtNC4yNjEtNC4xNDRsLTIxLjc5LTUuNTkzYTYuMzYgNi4zNiAwIDAgMC02LjAwMyAxLjYwOEw4My44ODcgOTMuMTQxYy0xLjU2NiAxLjUzNC0yLjE1NCAzLjcxOC0xLjYxOCA1LjcxOWw1LjcxNiAyMS4zMzFjLjUzNiAyLjAwMSAyLjEzNyAzLjU5OSA0LjI2IDQuMTQ0bDMuMTMxLjgwM2ExLjc1IDEuNzUgMCAwIDEtLjg3IDMuMzlsLTMuMTMtLjgwM2MtMy4yMTYtLjgyNi01Ljc0LTMuMjIyLTYuNjg2LTYuMzI1bC0uMDg2LS4zMDMtNS43MTUtMjEuMzMxYy0uODQ0LTMuMTQ4LjA0Mi02LjUxMiAyLjMyNS04Ljg5OGwuMjI1LS4yMjh6Ii8+PC9zdmc+"
                                }), (0, I.jsx)("img", {
                                    alt: "",
                                    className: "".concat(sp, " ").concat(sy, " hidden dark:block"),
                                    src: "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMjAiIGhlaWdodD0iMTgwIiBmaWxsPSJub25lIiB2aWV3Qm94PSIwIDAgMzIwIDE4MCI+PHBhdGggZmlsbD0iI2QwZDlmYiIgZmlsbC1vcGFjaXR5PSIuMTYiIGQ9Ik0yNTYuNDg2IDM2LjkwNWE0IDQgMCAwIDEgMi42MzEgNC44NGwtMjMuODExIDg4Ljg2Ni0uMDU5LjE5OGE0IDQgMCAwIDEtNC42NCAyLjY3OWwtLjItLjA0OS02NS4xMzMtMTcuNDUyLS40NDgtMS42NzMgNjUuOTY5IDE3LjY3NmEyLjUgMi41IDAgMCAwIDMuMDYyLTEuNzY3bDIzLjgxMS04OC44NjZhMi41IDIuNSAwIDAgMC0xLjc2OC0zLjA2MmwtODguODY1LTIzLjgxYTIuNSAyLjUgMCAwIDAtMy4wNjIgMS43NjdMMTUxLjI2MiA2My42OWwtLjc3Ni0yLjg5OCAxMi4wMzgtNDQuOTI4YTQgNCAwIDAgMSA0Ljg5OS0yLjgyOWw4OC44NjUgMjMuODEyeiIvPjxwYXRoIGZpbGw9IiNmN2Y3ZjgiIGQ9Ik0yMDIuMjMzIDQyLjc4YTkuODYgOS44NiAwIDAgMSA5LjMyMiAyLjQ5OGwxNi4wNzQgMTUuNzM5YzIuNDQ4IDIuMzk3IDMuNDIxIDUuODc2IDIuNTUgOS4xMjVsLTUuNzE2IDIxLjMzMi0uMDg2LjMwMmMtLjk0NiAzLjEwMy0zLjQ2OSA1LjUtNi42ODUgNi4zMjVsLTIxLjc5IDUuNTkzLS4zMTIuMDc1YTkuODYgOS44NiAwIDAgMS05LjAwOS0yLjU3M2wtMTYuMDc0LTE1LjczOGMtMi4zNzItMi4zMjMtMy4zNTktNS42Ni0yLjYyNy04LjgybC4wNzctLjMwNUwxNzMuNjcyIDU1Yy44NDQtMy4xNDggMy4yOTMtNS42MTggNi40NjMtNi41NDNsLjMwOS0uMDg0em02LjUyMyA1LjM1NmE1Ljg2IDUuODYgMCAwIDAtNS41MjgtMS40ODJsLTIxLjc5IDUuNTkzYy0xLjk1My41MDItMy40MTQgMS45NjctMy45MDIgMy43OWwtNS43MTYgMjEuMzNjLS40ODggMS44MjMuMDQ0IDMuODIzIDEuNDg1IDUuMjMzbDE2LjA3NSAxNS43NGE1Ljg2IDUuODYgMCAwIDAgNS41MjcgMS40OGwyMS43OTEtNS41OTJjMS45NTMtLjUwMiAzLjQxMy0xLjk2NyAzLjkwMi0zLjc5bDUuNzE1LTIxLjMzMWMuNDg5LTEuODIzLS4wNDMtMy44MjItMS40ODQtNS4yMzN6bS02LjYyNyA1LjY0NmE0LjE2IDQuMTYgMCAwIDEgNC4wMTUgMS4wNzZsMTEuMzA0IDExLjMwM2E0LjE2IDQuMTYgMCAwIDEgMS4wNzUgNC4wMTRsLTQuMTM3IDE1LjQ0MWE0LjE2IDQuMTYgMCAwIDEtMi45MzkgMi45NGwtMTUuNDQxIDQuMTM2YTQuMTYgNC4xNiAwIDAgMS00LjAxNC0xLjA3NmwtMTEuMzA0LTExLjMwM2E0LjE2IDQuMTYgMCAwIDEtMS4wNzUtNC4wMTRsNC4xMzctMTUuNDQxYTQuMTYgNC4xNiAwIDAgMSAyLjkzOS0yLjk0em0tNy4yNTIgOS4wMTVhMi4yNSAyLjI1IDAgMCAwLTIuNzU1IDEuNTkxbC0zLjQ5NSAxMy4wNGEyLjI1IDIuMjUgMCAwIDAgMS41OTEgMi43NTZsMTMuMDQgMy40OTRhMi4yNSAyLjI1IDAgMCAwIDIuNzU2LTEuNTkxbDMuNDk0LTEzLjA0YTIuMjUgMi4yNSAwIDAgMC0xLjU5MS0yLjc1NnoiLz48cGF0aCBmaWxsPSIjZDBkOWZiIiBmaWxsLW9wYWNpdHk9Ii4xNiIgZD0ibTE2Ni45ODUgMTM3LjgwMy4zODggMS40NDktODguODY1IDIzLjgxMS0uMzg4LTEuNDQ5em0xLjc2OC0zLjA2Mi0yMy44MTEtODguODY1YTIuNSAyLjUgMCAwIDAtMy4wNjItMS43NjhMNTMuMDE1IDY3LjkyYTIuNSAyLjUgMCAwIDAtMS43NjggMy4wNjFsMjMuODExIDg4Ljg2NmEyLjUgMi41IDAgMCAwIDMuMDYyIDEuNzY3bC4zODggMS40NDktLjIuMDQ5YTQgNCAwIDAgMS00LjY0LTIuNjc5bC0uMDU5LS4xOThMNDkuNzk4IDcxLjM3YTQgNCAwIDAgMSAyLjgyOC00LjlsODguODY2LTIzLjgxLjItLjA1YTQgNCAwIDAgMSA0LjY5OSAyLjg3OGwyMy44MTEgODguODY1LjA0OS4yYTQgNCAwIDAgMS0yLjY4IDQuNjQxbC0uMTk4LjA1OC0uMzg4LTEuNDQ5YTIuNSAyLjUgMCAwIDAgMS43NjgtMy4wNjIiLz48cGF0aCBmaWxsPSIjZjdmN2Y4IiBkPSJNOTcuNDA1IDc0LjQ5OEE5Ljg2IDkuODYgMCAwIDEgMTA2LjcyNiA3MmwyMS43OSA1LjU5M2MzLjMxOS44NTIgNS45MDEgMy4zNzggNi43NzEgNi42MjhsNS43MTYgMjEuMzMxLjA3Ny4zMDVjLjczMiAzLjE2MS0uMjU1IDYuNDk4LTIuNjI3IDguODJsLTE2LjA3NCAxNS43MzktLjIzMy4yMjFhOS44NiA5Ljg2IDAgMCAxLTkuMDg5IDIuMjc3bC03LjUzMS0xLjkzNGEyLjI1IDIuMjUgMCAwIDEtMS42MTQtMS41OTdsLTcuNjU3LTI4LjU3OC0uMDA1LjAwMS0xLjAwMi0zLjc0YTMuNzUgMy43NSAwIDAgMSAyLjY1MS00LjU5NGwxNy4zODYtNC42NmEzLjc1IDMuNzUgMCAwIDEgNC41OTMgMi42NTJsNC4wNzYgMTUuMjEzYTMuNzUgMy43NSAwIDAgMS0yLjY1MSA0LjU5M2wtOC42OTMgMi4zMjlhMS41IDEuNSAwIDAgMS0uNzc3LTIuODk4bDguNjkzLTIuMzI5YS43NS43NSAwIDAgMCAuNTMxLS45MTlMMTE2Ljk4IDkxLjI0YS43NS43NSAwIDAgMC0uOTE4LS41M2wtMTcuMzg2IDQuNjZhLjc1Ljc1IDAgMCAwLS41My45MTlsOC41NDUgMzEuODkzIDcuMTEyIDEuODI2YTYuODYgNi44NiAwIDAgMCA2LjQ3Ny0xLjczNWwxNi4wNzQtMTUuNzM5YzEuNjkzLTEuNjU3IDIuMzM1LTQuMDI2IDEuNzUxLTYuMjA1bC01LjcxNS0yMS4zMzJjLS41ODQtMi4xNzktMi4zMjUtMy45MS00LjYyLTQuNDk5bC0yMS43OS01LjU5M2E2Ljg2IDYuODYgMCAwIDAtNi40NzYgMS43MzZMODMuNDMgOTIuMzc5Yy0xLjY5MyAxLjY1OC0yLjMzNSA0LjAyNy0xLjc1MiA2LjIwNmw1LjcxNiAyMS4zMzJjLjU4NCAyLjE3OSAyLjMyNSAzLjkwOSA0LjYyIDQuNDk4bDIuNDA0LjYxN2ExLjUgMS41IDAgMCAxLS43NDUgMi45MDZsLTIuNDA1LS42MTdjLTMuMjE2LS44MjYtNS43NC0zLjIyMi02LjY4NS02LjMyNmwtLjA4Ny0uMzAyLTUuNzE1LTIxLjMzMWMtLjg0NC0zLjE0OC4wNDItNi41MTIgMi4zMjUtOC44OTlsLjIyNS0uMjI3eiIvPjwvc3ZnPg=="
                                }), (0, I.jsxs)("div", {
                                    className: "gap-y-medium text-align-x-left flex flex-col items-start",
                                    children: [(0, I.jsxs)("div", {
                                        className: "text-heading-small medium:text-heading-medium content-emphasis margin-none gap-x-xsmall flex flex-wrap items-center justify-start",
                                        style: {
                                            fontFamily: '"Builder Extended", "Builder Sans", sans-serif'
                                        },
                                        children: [w, (0, I.jsxs)("span", {
                                            className: "gap-x-xsmall inline-flex items-center",
                                            children: [(0, I.jsx)(tf, {
                                                name: "icon-regular-robux",
                                                size: "Large"
                                            }), m]
                                        })]
                                    }), v ? (0, I.jsx)("div", {
                                        className: "bg-shift-100 radius-medium height-[40px] width-full"
                                    }) : g ? (0, I.jsx)("p", {
                                        className: "text-body-small medium:text-body-medium content-default margin-none",
                                        children: f("Description.ReferralRecipientInvitedBy", {
                                            displayName: g,
                                            amount: m
                                        }, "".concat(g, " invited you to join Plus. You'll both get ").concat(m, " Robux when you join."))
                                    }) : null]
                                }), u && (0, I.jsx)("p", {
                                    className: "text-title-medium content-emphasis margin-none",
                                    children: f("Action.PricePerMonth", {
                                        price: b,
                                        periodType: null != c ? c : eH
                                    })
                                }), s && (0, I.jsx)(c1, {
                                    featureConfig: sd(ss({}, s), {
                                        isTradingEnabled: !1,
                                        isUgcPublishingEnabled: !1
                                    }),
                                    periodType: null != c ? c : eH
                                })]
                            }) : (0, I.jsxs)(cZ, {
                                className: "gap-y-large padding-top-large padding-bottom-medium medium:padding-top-xlarge medium:padding-bottom-large flex flex-col items-center text-center",
                                children: [(0, I.jsx)(tf, {
                                    className: "content-emphasis !size-1800 medium:!size-2200",
                                    name: "icon-regular-triangle-exclamation",
                                    size: "XLarge"
                                }), (0, I.jsx)("p", {
                                    className: "text-body-small medium:text-body-medium content-emphasis margin-none",
                                    children: f(sb[t].key, void 0, sb[t].fallback)
                                })]
                            }), y ? (0, I.jsx)(cJ, {
                                children: (0, I.jsxs)("div", {
                                    className: "gap-y-medium width-full flex flex-col",
                                    children: [(0, I.jsx)(su, sd(ss({}, O), {
                                        className: "width-full",
                                        size: "Large",
                                        trackSubscriptionButtonClick: P,
                                        variant: "Emphasis",
                                        children: j
                                    })), (0, I.jsx)("span", {
                                        className: "text-caption-medium content-muted",
                                        children: a0(f, "Description.SubscriptionLegal", S)
                                    })]
                                })
                            }) : (0, I.jsxs)(cJ, {
                                className: "gap-y-small flex flex-col",
                                children: [(0, I.jsx)(su, sd(ss({}, l), {
                                    className: "width-full",
                                    size: "Large",
                                    trackSubscriptionButtonClick: P,
                                    variant: "Emphasis",
                                    children: x
                                })), (0, I.jsx)(tW, {
                                    className: "width-full",
                                    size: "Large",
                                    variant: "Standard",
                                    onClick: function() {
                                        E(!1)
                                    },
                                    children: f("Action.Cancel", void 0, "Cancel")
                                })]
                            })]
                        })
                    })
                },
                sv = function(e) {
                    var t = e.face,
                        r = e.hasReferrerId,
                        n = e.referrerId,
                        i = e.referralCode,
                        o = e.surface,
                        a = e.open,
                        l = (0, ti.useRef)(!1);
                    return (0, ti.useEffect)(function() {
                        !l.current && a && (l.current = !0, aY("PlusReferralSheetShown", ss({
                            face: t,
                            hasReferrerId: String(r)
                        }, o ? {
                            surface: o
                        } : {})), aV(t, r, n, i, o))
                    }, [t, r, n, i, o, a]), null
                },
                sw = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.invite,
                        i = e.surface,
                        o = e.subscribeButtonProps,
                        a = e.subscribePrice,
                        l = e.subscribePeriodType,
                        u = e.subscribeFeatureConfig,
                        c = e.subscribeEligibleOffers,
                        s = void 0 !== n && te(),
                        d = sn({
                            referrerId: null == n ? void 0 : n.referrerId,
                            enabled: s
                        }),
                        f = d.eligibility,
                        p = d.isLoading,
                        y = se({
                            enabled: void 0 === o || void 0 === a || void 0 === u || void 0 === c
                        }),
                        m = y.subscribeButtonProps,
                        b = y.subscribePrice,
                        h = y.subscribePeriodType,
                        g = y.subscribeFeatureConfig,
                        v = y.isLoading,
                        w = null != o ? o : m;
                    if (c6({
                            referrerId: null == n ? void 0 : n.referrerId,
                            enabled: s && void 0 !== n.code && "Eligible" === f
                        }), p) return null;
                    var x = s && "Eligible" === f ? "pitch" : "Ineligible" === f ? "ineligible" : "invalid";
                    return "pitch" === x && v || void 0 === w ? null : (0, I.jsxs)(to().Fragment, {
                        children: [(0, I.jsx)(sv, {
                            face: x,
                            hasReferrerId: (null == n ? void 0 : n.referrerId) !== void 0,
                            open: t,
                            referralCode: null == n ? void 0 : n.code,
                            referrerId: null == n ? void 0 : n.referrerId,
                            surface: i
                        }), (0, I.jsx)(M.TranslationProvider, {
                            config: function(e) {
                                if (Array.isArray(e)) return sc(e)
                            }(sf) || function(e) {
                                if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                            }(sf) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return sc(e, void 0);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sc(e, void 0)
                                }
                            }(sf) || function() {
                                throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            children: (0, I.jsx)(sg, {
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
                sx = function(e, t) {
                    return "https://apis.".concat(e, "/").concat(t)
                };

            function sj(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var sO = function(e) {
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
                                if ("string" == typeof e) return sj(e, 3);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sj(e, 3)
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
                sS = sO(window.location.hostname),
                sI = new e5(new eG({
                    robloxSiteDomain: sS.rootDomain,
                    basePath: sx(sS.rootDomain, "subscriptions"),
                    credentials: "include"
                })),
                sM = function(e) {
                    var t = e.enabled,
                        r = (0, rs.userId)(),
                        n = (0, T.useQuery)({
                            queryKey: ["referral-share-link", r],
                            queryFn: function() {
                                return sI.subscriptionsV2CreateSubscriptionReferralLink()
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
                sN = ((b = {}).LIST_AVAILABLE_PRODUCTS_FAILED = "ListAvailableProductsFailed", b.LIST_AVAILABLE_PRODUCTS_EMPTY = "ListAvailableProductsEmpty", b.LIST_SUBSCRIPTIONS_FAILED = "ListSubscriptionsFailed", b.GET_USER_BENEFITS_FAILED = "GetUserBenefitsFailed", b.GUAC_APP_POLICY_FAILED = "GuacAppPolicyFailed", b.MEMBERSHIP_POLLING_TIMEOUT = "MembershipPollingTimeout", b.PURCHASE_VIEW_SHOWN = "PurchaseViewShown", b.PURCHASE_VIEW_OPEN_SHEET_CLICK = "PurchaseViewOpenSheetClick", b.BUNDLE_PICKER_SHEET_OPENED = "BundlePickerSheetOpened", b.BUNDLE_PICKER_TIER_SELECTED = "BundlePickerTierSelected", b.BUNDLE_PICKER_SUBSCRIBE_CLICK = "BundlePickerSubscribeClick", b.BUNDLE_PICKER_ROW_MISSING_ROBUX_ALLOWANCE = "BundlePickerRowMissingRobuxAllowance", b.BUNDLE_PICKER_ROW_MISSING_STRIKETHROUGH_PRICE = "BundlePickerRowMissingStrikethroughPrice", b.MISSING_FEATURE_CONFIG = "MissingFeatureConfig", b.REFERRAL_LANDING_DETECTED = "ReferralLandingDetected", b.REFERRAL_COPY_LINK_CLICK = "ReferralCopyLinkClick", b.SHARE_CARD_SHOWN = "ShareCardShown", b.SHARE_CARD_INVITE_CLICK = "ShareCardInviteClick", b),
                sP = aB("RobloxSubscription");

            function sE(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sT(e, t) {
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
                }(e, t) || sD(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sD(e, t) {
                if (e) {
                    if ("string" == typeof e) return sE(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sE(e, t)
                }
            }
            var sA = ["Feature.RobloxSubscription"],
                sL = "margin-x-auto width-full max-width-[200px] medium:max-width-[320px]",
                sC = "margin-bottom-[-32px]",
                sR = [{
                    opening: "linkStart",
                    closing: "linkEnd",
                    render: function(e) {
                        return (0, I.jsx)("a", {
                            className: "underline",
                            href: "https://en.help.roblox.com/hc/en-us/articles/52737229124628",
                            rel: "noopener noreferrer",
                            target: "_blank",
                            children: e
                        })
                    }
                }],
                sk = "padding-x-xlarge margin-x-auto width-full medium:max-width-[600px] large:max-width-[730px] xlarge:max-width-[840px]",
                sU = {
                    2: "medium:[grid-template-columns:repeat(2,minmax(0,1fr))]",
                    3: "medium:[grid-template-columns:repeat(3,minmax(0,1fr))]"
                },
                sz = function(e) {
                    var t, r = e.robuxEarned,
                        n = e.referralCount,
                        i = e.pendingRobux,
                        o = (0, M.useTranslation)(),
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
                    }), (0, I.jsxs)("div", {
                        className: "width-full gap-y-medium flex flex-col",
                        children: [(0, I.jsx)("h2", {
                            className: "text-heading-small content-emphasis margin-none",
                            children: a("Heading.ReferralHistory", void 0, "Referral history")
                        }), (0, I.jsx)("div", {
                            className: "".concat("[grid-template-columns:repeat(2,minmax(0,1fr))]", " ").concat(null != (t = sU[c.length]) ? t : "", " width-full gap-medium grid"),
                            "data-testid": "plus-referral-stats-cards",
                            children: c.map(function(e) {
                                var t = e.key,
                                    r = e.label,
                                    n = e.value,
                                    i = e.hasRobuxIcon;
                                return (0, I.jsxs)("div", {
                                    className: "padding-medium gap-xsmall bg-shift-100 radius-medium min-width-0 flex flex-col",
                                    children: [(0, I.jsx)("span", {
                                        className: "text-title-medium content-muted",
                                        children: r
                                    }), (0, I.jsxs)("span", {
                                        className: "text-heading-small content-emphasis gap-x-xsmall flex items-center",
                                        children: [i ? (0, I.jsx)(tf, {
                                            name: "icon-regular-robux",
                                            size: "Small"
                                        }) : null, n]
                                    })]
                                }, t)
                            })
                        }), (0, I.jsx)("span", {
                            className: "text-caption-medium content-muted",
                            children: a("Description.SavingsDataDelay")
                        })]
                    })
                },
                s_ = function(e) {
                    var t = e.label,
                        r = e.amount,
                        n = e.description;
                    return (0, I.jsxs)("div", {
                        className: "flex flex-col",
                        children: [(0, I.jsx)("span", {
                            className: "text-title-large large:text-heading-small content-emphasis",
                            children: t
                        }), (0, I.jsx)(t1, {
                            className: "padding-x-none",
                            description: n,
                            divider: "None",
                            isContained: !0,
                            leading: (0, I.jsx)("span", {
                                className: "bg-shift-200 radius-circle size-1000 large:size-1200 flex items-center justify-center",
                                children: (0, I.jsx)(tf, {
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
                sB = function(e) {
                    var t = e.shareUrl,
                        r = e.robloxPlusUserBenefits,
                        n = (0, M.useTranslation)(),
                        i = n.translate,
                        o = n.intl,
                        a = sM({
                            enabled: void 0 === t
                        }),
                        l = a.shareUrl,
                        u = a.isLoading,
                        c = a.error,
                        s = null != t ? t : l,
                        d = sT((0, ti.useState)(!1), 2),
                        f = d[0],
                        p = d[1],
                        y = (0, ti.useRef)(),
                        m = (0, ti.useRef)(!1);
                    (0, ti.useEffect)(function() {
                        m.current || (m.current = !0, aG())
                    }, []), (0, ti.useEffect)(function() {
                        return function() {
                            window.clearTimeout(y.current)
                        }
                    }, []), (0, ti.useEffect)(function() {
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
                    var b = (0, ti.useCallback)(function() {
                            s && (aW(), sP(sN.REFERRAL_COPY_LINK_CLICK), navigator.clipboard.writeText(s).then(function() {
                                p(!0), window.clearTimeout(y.current), y.current = window.setTimeout(function() {
                                    p(!1)
                                }, 2e3)
                            }).catch(function() {}))
                        }, [s]),
                        h = o.n(100),
                        g = i("Label.ReferralRewardRobux", {
                            amount: h
                        }, "".concat(h, " Robux")),
                        v = i("Heading.ReferralShare", void 0, "Share Plus, get");
                    return (0, I.jsxs)("main", {
                        className: "bg-surface-0 flex flex-col",
                        children: [(0, I.jsxs)("div", {
                            className: "".concat(sk, " gap-y-large medium:gap-y-xxlarge margin-top-[48px] padding-bottom-large flex flex-col"),
                            children: [(0, I.jsx)("img", {
                                alt: "",
                                className: "".concat(sL, " ").concat(sC, " dark:hidden"),
                                src: "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMjAiIGhlaWdodD0iMTgwIiBmaWxsPSJub25lIiB2aWV3Qm94PSIwIDAgMzIwIDE4MCI+PHBhdGggZmlsbD0iIzFiMjU0YiIgZmlsbC1vcGFjaXR5PSIuMTYiIGQ9Ik0yNTYuNDg2IDM2LjkwNWE0IDQgMCAwIDEgMi42MzEgNC44NGwtMjMuODExIDg4Ljg2Ni0uMDU5LjE5OGE0IDQgMCAwIDEtNC42NCAyLjY3OWwtLjItLjA0OS02NS4xMzMtMTcuNDUyLS40NDgtMS42NzMgNjUuOTY5IDE3LjY3NmEyLjUgMi41IDAgMCAwIDMuMDYyLTEuNzY3bDIzLjgxMS04OC44NjZhMi41IDIuNSAwIDAgMC0xLjc2OC0zLjA2MmwtODguODY1LTIzLjgxYTIuNSAyLjUgMCAwIDAtMy4wNjIgMS43NjdMMTUxLjI2MiA2My42OWwtLjc3Ni0yLjg5OCAxMi4wMzgtNDQuOTI4YTQgNCAwIDAgMSA0Ljg5OS0yLjgyOWw4OC44NjUgMjMuODEyeiIvPjxwYXRoIGZpbGw9IiMyMDIyMjciIGQ9Ik0yMDIuMjMzIDQyLjc4YTkuODYgOS44NiAwIDAgMSA5LjMyMiAyLjQ5OGwxNi4wNzQgMTUuNzM5YzIuNDQ4IDIuMzk3IDMuNDIxIDUuODc2IDIuNTUgOS4xMjVsLTUuNzE2IDIxLjMzMi0uMDg2LjMwMmMtLjk0NiAzLjEwMy0zLjQ2OSA1LjUtNi42ODUgNi4zMjVsLTIxLjc5IDUuNTkzLS4zMTIuMDc1YTkuODYgOS44NiAwIDAgMS05LjAwOS0yLjU3M2wtNS40NTEtNS4zMzdhMyAzIDAgMCAxLS43OTktMi45Mmw3LjUwNy0yOC4wMTYgMS4wMDItMy43NDJhNCA0IDAgMCAxIDQuODk5LTIuODI4bDE3LjM4NyA0LjY1N2E0IDQgMCAwIDEgMi44MjggNC44OTlsLTQuMDc2IDE1LjIxM2E0IDQgMCAwIDEtNC44OTkgMi44MjlsLTguNjkzLTIuMzNhMS43NSAxLjc1IDAgMCAxIC45MDUtMy4zOGw4LjY5NCAyLjMyOWEuNS41IDAgMCAwIC42MTItLjM1NGw0LjA3Ny0xNS4yMTNhLjUuNSAwIDAgMC0uMzU0LS42MTJsLTE3LjM4Ny00LjY1N2EuNS41IDAgMCAwLS42MTMuMzUzbC04LjQzMyAzMS40NzYgNS4yNDIgNS4xMzNhNi4zNiA2LjM2IDAgMCAwIDYuMDAzIDEuNjA5bDIxLjc5LTUuNTkzYzIuMTI0LS41NDYgMy43MjQtMi4xNDQgNC4yNjEtNC4xNDRsNS43MTUtMjEuMzMyYy41MzYtMi0uMDUxLTQuMTg1LTEuNjE4LTUuNzE5TDIwOS4xMDcgNDcuNzhhNi4zNiA2LjM2IDAgMCAwLTYuMDA0LTEuNjA5bC0yMS43ODkgNS41OTNjLTIuMTI0LjU0NS0zLjcyNSAyLjE0My00LjI2MSA0LjE0NGwtNS43MTYgMjEuMzMyYy0uNTM2IDIgLjA1MiA0LjE4NSAxLjYxOCA1LjcxOWwyLjMxIDIuMjZjLjQ1MS40NDIuNjI5IDEuMDkzLjQ2NiAxLjcwNC0uMzQ3IDEuMjkzLTEuOTU4IDEuNzM0LTIuOTE0Ljc5N2wtMi4zMS0yLjI2MWMtMi4zNzItMi4zMjMtMy4zNTktNS42Ni0yLjYyNy04LjgybC4wNzctLjMwNUwxNzMuNjcyIDU1Yy44NDQtMy4xNDggMy4yOTMtNS42MTcgNi40NjMtNi41NDNsLjMwOS0uMDg0eiIvPjxwYXRoIGZpbGw9IiMxYjI1NGIiIGZpbGwtb3BhY2l0eT0iLjE2IiBkPSJtMTY2Ljk4NSAxMzcuODAzLjM4OCAxLjQ0OS04OC44NjUgMjMuODExLS4zODgtMS40NDl6bTEuNzY4LTMuMDYyLTIzLjgxMS04OC44NjVhMi41IDIuNSAwIDAgMC0zLjA2Mi0xLjc2OEw1My4wMTUgNjcuOTJhMi41IDIuNSAwIDAgMC0xLjc2OCAzLjA2MWwyMy44MTEgODguODY2YTIuNSAyLjUgMCAwIDAgMy4wNjIgMS43NjdsLjM4OCAxLjQ0OS0uMi4wNDlhNCA0IDAgMCAxLTQuNjQtMi42NzlsLS4wNTktLjE5OEw0OS43OTggNzEuMzdhNCA0IDAgMCAxIDIuODI4LTQuOWw4OC44NjYtMjMuODEuMi0uMDVhNCA0IDAgMCAxIDQuNjk5IDIuODc4bDIzLjgxMSA4OC44NjUuMDQ5LjJhNCA0IDAgMCAxLTIuNjggNC42NDFsLS4xOTguMDU4LS4zODgtMS40NDlhMi41IDIuNSAwIDAgMCAxLjc2OC0zLjA2MiIvPjxwYXRoIGZpbGw9IiMyMDIyMjciIGQ9Ik0xMjAuOTU1IDcwLjI0NmM1LjA1NC0zLjg4MiAxMi4zMjEuMDM1IDExLjg2MSA2LjM5MmwtMi45OTIgNDEuMzkzLS4wNDcuNDUyYy0uNTk0IDQuNDgtNS4wNzQgNy4zODQtOS40MDUgNi4wOTdsLS40MzMtLjE0My01LjUxMy0yLjAwNS02LjA5MyA5LjY0Yy0uODIxIDEuMzAxLTIuMjQ3IDEuODEzLTMuNTAzIDEuNjgyLTEuMjYtLjEzMS0yLjU5NS0uOTUtMy4wMTMtMi41MTFMOTcuODM5IDExNi40bC0xMi40NDMtNC41MjVjLTUuMzkyLTEuOTYtNi41Ni05LjAyMy0yLjE4OC0xMi42M2wuMjEyLS4xNjh6bS0xNS43NzYgNjAuMDIzcS4wMDYuMDAxLjAxMy4wMDNhLjI1LjI1IDAgMCAwIC4xMjQtLjAxNy4xMi4xMiAwIDAgMCAuMDU4LS4wNTJoLjAwMWw1LjY4NC04Ljk5NS05LjIwNS0zLjM0OHptMjQuMTQ2LTUzLjg4NGMuMjQyLTMuMzQ3LTMuNTgzLTUuNDAzLTYuMjM4LTMuMzYzbC0zNy41MzQgMjguODNjLTIuNDMgMS44NjctMS44NDMgNS42ODUgMS4wMzkgNi43MzRsMTIuMDEgNC4zNjcgMTAuOTYzLTE2LjAxYTEuNzUgMS43NSAwIDAgMSAyLjg4NyAxLjk3OWwtMTAuNDUzIDE1LjI2NiAxOS4xMzYgNi45NTljMi40MjEuODggNS4wMTItLjc5NyA1LjE5OC0zLjM2OXoiLz48L3N2Zz4="
                            }), (0, I.jsx)("img", {
                                alt: "",
                                className: "".concat(sL, " ").concat(sC, " hidden dark:block"),
                                src: "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMjAiIGhlaWdodD0iMTgwIiBmaWxsPSJub25lIiB2aWV3Qm94PSIwIDAgMzIwIDE4MCI+PHBhdGggZmlsbD0iI2QwZDlmYiIgZmlsbC1vcGFjaXR5PSIuMTYiIGQ9Ik0yNTYuNDg2IDM2LjkwNWE0IDQgMCAwIDEgMi42MzEgNC44NGwtMjMuODExIDg4Ljg2Ni0uMDU5LjE5OGE0IDQgMCAwIDEtNC42NCAyLjY3OWwtLjItLjA0OS02NS4xMzMtMTcuNDUyLS40NDgtMS42NzMgNjUuOTY5IDE3LjY3NmEyLjUgMi41IDAgMCAwIDMuMDYyLTEuNzY3bDIzLjgxMS04OC44NjZhMi41IDIuNSAwIDAgMC0xLjc2OC0zLjA2MmwtODguODY1LTIzLjgxYTIuNSAyLjUgMCAwIDAtMy4wNjIgMS43NjdMMTUxLjI2MiA2My42OWwtLjc3Ni0yLjg5OCAxMi4wMzgtNDQuOTI4YTQgNCAwIDAgMSA0Ljg5OS0yLjgyOWw4OC44NjUgMjMuODEyeiIvPjxwYXRoIGZpbGw9IiNmN2Y3ZjgiIGQ9Ik0yMDIuMjMzIDQyLjc4YTkuODYgOS44NiAwIDAgMSA5LjMyMiAyLjQ5OGwxNi4wNzQgMTUuNzM5YzIuNDQ4IDIuMzk3IDMuNDIxIDUuODc2IDIuNTUgOS4xMjVsLTUuNzE2IDIxLjMzMi0uMDg2LjMwMmMtLjk0NiAzLjEwMy0zLjQ2OSA1LjUtNi42ODUgNi4zMjVsLTIxLjc5IDUuNTkzLS4zMTIuMDc1YTkuODYgOS44NiAwIDAgMS05LjAwOS0yLjU3M2wtNS40NTEtNS4zMzdhMyAzIDAgMCAxLS43OTktMi45Mmw3LjUwNy0yOC4wMTYgMS4wMDItMy43NDJhNCA0IDAgMCAxIDQuODk5LTIuODI4bDE3LjM4NyA0LjY1N2E0IDQgMCAwIDEgMi44MjggNC44OTlsLTQuMDc2IDE1LjIxM2E0IDQgMCAwIDEtNC44OTkgMi44MjlsLTguNjkzLTIuMzNhMS43NSAxLjc1IDAgMCAxIC45MDUtMy4zOGw4LjY5NCAyLjMyOWEuNS41IDAgMCAwIC42MTItLjM1NGw0LjA3Ny0xNS4yMTNhLjUuNSAwIDAgMC0uMzU0LS42MTJsLTE3LjM4Ny00LjY1N2EuNS41IDAgMCAwLS42MTMuMzUzbC04LjQzMyAzMS40NzYgNS4yNDIgNS4xMzNhNi4zNiA2LjM2IDAgMCAwIDYuMDAzIDEuNjA5bDIxLjc5LTUuNTkzYzIuMTI0LS41NDYgMy43MjQtMi4xNDQgNC4yNjEtNC4xNDRsNS43MTUtMjEuMzMyYy41MzYtMi0uMDUxLTQuMTg1LTEuNjE4LTUuNzE5TDIwOS4xMDcgNDcuNzhhNi4zNiA2LjM2IDAgMCAwLTYuMDA0LTEuNjA5bC0yMS43ODkgNS41OTNjLTIuMTI0LjU0NS0zLjcyNSAyLjE0My00LjI2MSA0LjE0NGwtNS43MTYgMjEuMzMyYy0uNTM2IDIgLjA1MiA0LjE4NSAxLjYxOCA1LjcxOWwyLjMxIDIuMjZjLjQ1MS40NDIuNjI5IDEuMDkzLjQ2NiAxLjcwNC0uMzQ3IDEuMjkzLTEuOTU4IDEuNzM0LTIuOTE0Ljc5N2wtMi4zMS0yLjI2MWMtMi4zNzItMi4zMjMtMy4zNTktNS42Ni0yLjYyNy04LjgybC4wNzctLjMwNUwxNzMuNjcyIDU1Yy44NDQtMy4xNDggMy4yOTMtNS42MTcgNi40NjMtNi41NDNsLjMwOS0uMDg0eiIvPjxwYXRoIGZpbGw9IiNkMGQ5ZmIiIGZpbGwtb3BhY2l0eT0iLjE2IiBkPSJtMTY2Ljk4NSAxMzcuODAzLjM4OCAxLjQ0OS04OC44NjUgMjMuODExLS4zODgtMS40NDl6bTEuNzY4LTMuMDYyLTIzLjgxMS04OC44NjVhMi41IDIuNSAwIDAgMC0zLjA2Mi0xLjc2OEw1My4wMTUgNjcuOTJhMi41IDIuNSAwIDAgMC0xLjc2OCAzLjA2MWwyMy44MTEgODguODY2YTIuNSAyLjUgMCAwIDAgMy4wNjIgMS43NjdsLjM4OCAxLjQ0OS0uMi4wNDlhNCA0IDAgMCAxLTQuNjQtMi42NzlsLS4wNTktLjE5OEw0OS43OTggNzEuMzdhNCA0IDAgMCAxIDIuODI4LTQuOWw4OC44NjYtMjMuODEuMi0uMDVhNCA0IDAgMCAxIDQuNjk5IDIuODc4bDIzLjgxMSA4OC44NjUuMDQ5LjJhNCA0IDAgMCAxLTIuNjggNC42NDFsLS4xOTguMDU4LS4zODgtMS40NDlhMi41IDIuNSAwIDAgMCAxLjc2OC0zLjA2MiIvPjxwYXRoIGZpbGw9IiNmN2Y3ZjgiIGQ9Ik0xMjAuOTU1IDcwLjI0NWM1LjA1My0zLjg4MSAxMi4zMjEuMDM1IDExLjg2MSA2LjM5MmwtMi45OTIgNDEuMzkzLS4wNDcuNDUzYy0uNTk0IDQuNDgtNS4wNzQgNy4zODQtOS40MDUgNi4wOTdsLS40MzMtLjE0My01Ljc1NC0yLjA5My02LjA2MyA5LjU5NWMtLjc2NSAxLjIxLTIuMDkyIDEuNjg4LTMuMjY2IDEuNTY2LTEuMTc4LS4xMjItMi40MTEtLjg4NC0yLjc5OC0yLjMyN2wtMy45MzItMTQuNjczLTEyLjczLTQuNjNjLTUuMzkyLTEuOTYxLTYuNTYxLTkuMDIzLTIuMTg4LTEyLjYzbC4yMTItLjE2OXptLTE1Ljk5OSA2MC4xNTdjLjAwOS4wMzQuMDIuMDQ3LjAzNy4wNmEuMzYuMzYgMCAwIDAgLjE3My4wNTkuNDMuNDMgMCAwIDAgLjQxOS0uMTg1bDUuNzE0LTkuMDQyLTkuNzMyLTMuNTM5em0yNC44NjctNTMuOThjLjI3My0zLjc3OC00LjA0My02LjEtNy4wNDEtMy43OTdsLTM3LjUzNSAyOC44M2MtMi43NDMgMi4xMDctMi4wNzggNi40MTggMS4xNzQgNy42MDFsMTIuMTMyIDQuNDExIDExLjIxNy0xNi4zODJhMS41IDEuNSAwIDAgMSAyLjQ3NiAxLjY5NGwtMTAuNzgyIDE1Ljc0NiAxOS41IDcuMDkzYzIuNzMzLjk5MyA1LjY1OC0uOTAxIDUuODY4LTMuODA0eiIvPjwvc3ZnPg=="
                            }), (0, I.jsxs)("div", {
                                className: "gap-y-none flex flex-col",
                                children: [(0, I.jsxs)("h1", {
                                    className: "text-heading-medium medium:text-heading-large large:text-display-small content-emphasis margin-none gap-x-small wrap flex items-center",
                                    style: {
                                        fontFamily: '"Builder Extended", "Builder Sans", sans-serif'
                                    },
                                    children: [v, (0, I.jsxs)("span", {
                                        className: "gap-x-xsmall flex items-center",
                                        children: [(0, I.jsx)(tf, {
                                            name: "icon-regular-robux",
                                            size: "XLarge"
                                        }), h]
                                    })]
                                }), (0, I.jsx)("p", {
                                    className: "text-body-medium medium:text-body-large content-default margin-none",
                                    children: i("Description.ReferralShare", {
                                        amount: h
                                    }, "Invite someone to Plus and you both get ".concat(h, " Robux when they join."))
                                })]
                            }), (0, I.jsxs)("div", {
                                className: "gap-y-medium flex flex-col",
                                children: [(0, I.jsx)(s_, {
                                    amount: g,
                                    description: i("Description.ReferralReferrerReward", void 0, "When anyone joins Plus with your link."),
                                    label: i("Label.ReferralYouGet", void 0, "You get")
                                }), (0, I.jsx)(s_, {
                                    amount: g,
                                    description: i("Description.ReferralRecipientReward", void 0, "Offer valid for new Plus subscribers only."),
                                    label: i("Label.ReferralTheyGet", void 0, "Your referrals get")
                                })]
                            }), (0, I.jsx)(sz, {
                                pendingRobux: null == r ? void 0 : r.pendingRobuxEarnedFromReferrals,
                                referralCount: null == r ? void 0 : r.referralsCount,
                                robuxEarned: null == r ? void 0 : r.robuxEarnedFromReferrals
                            })]
                        }), (0, I.jsx)("div", {
                            className: "padding-y-medium shrink-0",
                            children: (0, I.jsxs)("div", {
                                className: "".concat(sk, " gap-y-small flex flex-col"),
                                children: [(0, I.jsxs)("div", {
                                    className: "gap-x-small flex items-start",
                                    children: [(0, I.jsx)("div", {
                                        className: "grow-1 min-width-0",
                                        children: (0, I.jsx)(o2, {
                                            "aria-label": i("Description.ReferralShareLink", void 0, "Referral link"),
                                            error: c ? i("Message.ReferralLinkError", void 0, "We could not create your link. Please try again later.") : void 0,
                                            hasError: !!c,
                                            isDisabled: !0,
                                            readOnly: !0,
                                            size: "Large",
                                            value: c ? "" : null != s ? s : i("Label.Loading", void 0, "Loading")
                                        })
                                    }), (0, I.jsx)(tW, {
                                        className: "width-[200px] shrink-0",
                                        isDisabled: !s,
                                        isLoading: u,
                                        size: "Large",
                                        variant: "Emphasis",
                                        onClick: b,
                                        children: f ? i("Label.ReferralLinkCopied", void 0, "Link copied") : i("Action.CopyReferralLink", void 0, "Copy link")
                                    })]
                                }), (0, I.jsx)("span", {
                                    className: "text-caption-medium content-muted",
                                    children: a0(i, "Description.ReferralTerms", sR)
                                })]
                            })
                        })]
                    })
                },
                sY = function(e) {
                    var t = e.onClose,
                        r = e.robloxPlusUserBenefits,
                        n = e.subscribeButtonProps,
                        i = sT((0, ti.useState)("loading"), 2),
                        o = i[0],
                        a = i[1],
                        l = sT((0, ti.useState)(), 2),
                        u = l[0],
                        c = l[1],
                        s = (0, ti.useRef)(t);
                    return (s.current = t, (0, ti.useEffect)(function() {
                        if (!(0, rs.isAuthenticated)()) return void s.current();
                        var e = !0;
                        return sI.subscriptionsV2CreateSubscriptionReferralLink().then(function(t) {
                                e && (c(t.deepLinkUrl), a("ready"))
                            }).catch(function() {
                                e && a("invalid")
                            }),
                            function() {
                                e = !1
                            }
                    }, []), "loading" === o) ? null : (0, I.jsx)(M.TranslationProvider, {
                        config: function(e) {
                            if (Array.isArray(e)) return sE(e)
                        }(sA) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(sA) || sD(sA) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        children: "ready" === o ? (0, I.jsx)(sB, {
                            robloxPlusUserBenefits: r,
                            shareUrl: u
                        }) : (0, I.jsx)(sw, {
                            open: !0,
                            subscribeButtonProps: n,
                            onOpenChange: function(e) {
                                e || t()
                            }
                        })
                    })
                },
                sF = window.CoreRobloxUtilities,
                sG = window.Roblox["core-scripts"].localStorage.localStorage,
                sW = r.n(sG),
                sV = window.CoreUtilities,
                sQ = window.Roblox["core-scripts"].paymentsFlow,
                sq = r.n(sQ),
                sK = window.EventTracker;

            function sH(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function sX(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var sZ = ((h = {}).GET = "GET", h.POST = "POST", h),
                s$ = ((g = {}).PAYMENT = "Payment", g.ROBUX = "Robux", g.ROBUX_GIFTING = "RobuxGifting", g.ROBUX_REDESIGN = "RobuxRedesign", g),
                sJ = ((v = {}).VERIFY_PHONE_VERIFICATION_SESSION = "VerifyPhoneVerificationSession", v.LANDING_PAGE_METADATA = "GetLandingPageMetadata", v.GET_USER_NAME = "GetUserName", v.PREPARE_PAYMENT = "PreparePayment", v.GET_METADATA = "GetMetadata", v.GET_PRODUCTS = "GetProducts", v.GET_PAYMENT_METHODS_INFO = "GetPaymentMethodsInfo", v.GET_PURCHASE_WARNING = "GetPurchaseWarning", v.GET_USER_PURCHASE_ELIGIBILITY = "GetUserPurchaseEligibility", v.CREATE_PAYMENT_SESSION = "CreatePaymentSession", v.GET_PAYMENT_SESSION = "GetPaymentSession", v.GET_PAYMENT_SESSION_BY_CHECKOUT_SESSION_ID = "GetPaymentSessionByCheckoutSessionId", v.CREATE_BONUS_SESSION = "CreateBonusSession", v.GET_BONUS_SESSION_BY_CHECKOUT_SESSION_ID = "GetBonusSessionByCheckoutSessionId", v.GET_DISPLAYABLE_BONUS_FOR_PRODUCT = "GetDisplayableBonusForProduct", v.GET_THUMBNAILS = "GetThumbnails", v.HANDLE_GAME_PASS_JOIN_EVENT = "HandleGamePassJoinEvent", v.GET_ROBUX_BALANCE = "GetRobuxBalance", v.GET_AUTH_TICKET = "GetAuthTicket", v.GET_CLIENT_ASSERTION = "GetClientAssertion", v),
                s0 = function(e, t, r) {
                    return new Promise(function(n) {
                        (0, sK.fireEvent)("API_COUNTER_".concat(e, "_").concat(t, "_").concat(r || "Throughput")), n()
                    })
                },
                s1 = function(e, t, r) {
                    return new Promise(function(n) {
                        (0, sK.fireEvent)("ERROR_COUNTER_".concat(e, "_").concat(t, "_").concat(r || "UnknownAxiosError")), n()
                    })
                };

            function s2(e, t, r, n, i) {
                var o;
                return (o = function(e, t, r, n, i) {
                    var o, a, l, u, c, s, d;
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
                    }(this, function(f) {
                        switch (f.label) {
                            case 0:
                                o = r.feature, a = r.call, s0(o, a), f.label = 1;
                            case 1:
                                return f.trys.push([1, 3, , 4]), [4, "GET" === e ? sV.httpService.get(t, n) : sV.httpService.post(t, n)];
                            case 2:
                                return u = (l = f.sent()).data, c = l.headers, s0(o, a, 200), [2, (null == i ? void 0 : i(u, c)) || u];
                            case 3:
                                var p, y, m;
                                return (void 0 === (p = s = f.sent()) ? "undefined" : sX(p)) === "object" && "status" in p ? s1(o, a, s.status) : (void 0 === s ? "undefined" : sX(s)) === "object" && "config" in s ? s1(o, a, null == (d = s.response) ? void 0 : d.status) : (console.error(s), y = o, m = a, new Promise(function(e) {
                                    (0, sK.fireEvent)("ERROR_COUNTER_".concat(y, "_").concat(m, "_NonAxiosError")), e()
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
                            sH(i, r, n, a, l, "next", e)
                        }

                        function l(e) {
                            sH(i, r, n, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }).apply(this, arguments)
            }

            function s4(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function s3(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var o = e.apply(t, r);

                        function a(e) {
                            s4(o, n, i, a, l, "next", e)
                        }

                        function l(e) {
                            s4(o, n, i, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function s5(e, t) {
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

            function s6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function s8(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function s7(e, t) {
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
                        if ("string" == typeof e) return s6(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return s6(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var s9 = "paymentSession-".concat((null === c2.CurrentUser || void 0 === c2.CurrentUser ? void 0 : c2.CurrentUser.userId) || "loggedout");

            function de(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var dt = function(e) {
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
                dr = function(e) {
                    var t, r = e.subscribeButtonProps,
                        n = e.subscribePrice,
                        i = e.subscribePeriodType,
                        o = e.subscribeFeatureConfig,
                        a = e.subscribeEligibleOffers,
                        l = (0, ti.useMemo)(function() {
                            return dt(window.location.search)
                        }, []),
                        u = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, ti.useState)("none" !== l.kind)) || function(e) {
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
                                if ("string" == typeof e) return de(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return de(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        c = u[0],
                        s = u[1];
                    return "none" === l.kind ? null : (0, I.jsx)(sw, {
                        invite: "invite" === l.kind ? l : void 0,
                        open: c,
                        subscribeButtonProps: r,
                        subscribeEligibleOffers: a,
                        subscribeFeatureConfig: o,
                        subscribePeriodType: i,
                        subscribePrice: n,
                        surface: o5.DirectUrl,
                        onOpenChange: s
                    })
                },
                dn = function(e) {
                    var t = e.title,
                        r = e.body,
                        n = e.equipText,
                        i = e.onEquip,
                        o = e.onItemDetailsClick,
                        a = null != o;
                    return (0, I.jsxs)("div", {
                        "aria-label": a ? t : void 0,
                        className: "bg-shift-200 radius-medium padding-medium gap-medium width-full flex items-center ".concat(a ? "hover:bg-surface-100 cursor-pointer" : ""),
                        role: a ? "button" : void 0,
                        tabIndex: a ? 0 : void 0,
                        onClick: o,
                        onKeyDown: a ? function(e) {
                            e.target === e.currentTarget && ("Enter" === e.key || " " === e.key) && (e.preventDefault(), null == o || o())
                        } : void 0,
                        children: [(0, I.jsx)("div", {
                            className: "radius-medium size-[50px] shrink-0 overflow-hidden",
                            children: (0, I.jsx)("img", {
                                alt: t,
                                className: "size-full object-cover",
                                src: "https://images.rbxcdn.com/edf7aeadb32b5c26.png"
                            })
                        }), (0, I.jsxs)("div", {
                            className: "min-width-0 grow-1 shrink-1 flex basis-0 flex-col justify-center",
                            children: [(0, I.jsx)("span", {
                                className: "text-title-medium content-emphasis",
                                children: t
                            }), (0, I.jsx)("span", {
                                className: "text-body-medium content-default",
                                children: r
                            })]
                        }), null != n && null != i && (0, I.jsx)(tW, {
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
                di = function(e) {
                    var t = e.size,
                        r = e.variant,
                        n = (0, (0, M.useTranslation)().translate)("Label.Blackbird");
                    return "compact" === (void 0 === r ? "default" : r) ? (0, I.jsxs)("div", {
                        className: "gap-x-xxsmall flex items-center",
                        children: [(0, I.jsx)(tf, {
                            className: "relative",
                            name: "icon-regular-roblox-plus",
                            size: "Large",
                            style: {
                                top: -1
                            }
                        }), (0, I.jsx)("span", {
                            className: "text-label-large content-emphasis text-no-wrap",
                            children: n
                        })]
                    }) : (0, I.jsxs)("div", {
                        className: "gap-x-small flex items-center",
                        children: [(0, I.jsx)(tf, {
                            className: "!size-1000 relative",
                            name: "icon-regular-roblox-plus",
                            style: {
                                top: -4
                            }
                        }), "large" === (void 0 === t ? "large" : t) ? (0, I.jsx)("h1", {
                            className: "font-builder-extended text-display-small text-no-wrap",
                            children: n
                        }) : (0, I.jsx)("h2", {
                            className: "text-heading-large",
                            children: n
                        })]
                    })
                },
                da = window.Roblox["core-scripts"].format.string,
                dl = function(e) {
                    var t, r = e.eligibleOffers,
                        n = e.price,
                        i = e.periodType,
                        o = (0, M.useTranslation)().translate,
                        a = c8(n),
                        l = o("Description.BillingInfo", {
                            price: "<span class='text-heading-medium'>".concat((0, da.escapeHtml)(a), "</span>"),
                            periodType: i
                        }),
                        u = o("Description.BillingInfoWithFreeTrialOffer", {
                            boldTagStart: "<b>",
                            boldTagEnd: "</b>",
                            trialPeriod: 1,
                            trialPeriodType: i,
                            price: (0, da.escapeHtml)(a),
                            periodType: i
                        }),
                        c = null != (t = null == r ? void 0 : r.some(function(e) {
                            return "FreeTrial" === e.offerType
                        })) && t;
                    return (0, I.jsx)("span", {
                        dangerouslySetInnerHTML: {
                            __html: c ? u : l
                        },
                        className: "text-body-large"
                    })
                },
                du = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                dc = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                ds = function(e) {
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
                    return to().createElement("button", function(e) {
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
                        className: ta("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", tp, dc[t], du[r], n && "radius-circle", i)
                    }, o), to().createElement(ty, null), to().createElement(tf, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function dd(e) {
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

            function df(e, t) {
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
            var dp = (0, ti.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                dy = function() {
                    var e = (0, ti.useContext)(dp);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                dm = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                db = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                dh = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                dg = function(e) {
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
                        y = e.hasDescription,
                        m = void 0 !== y && y,
                        b = e.experimentalDisablePointerEventsStylingOnBody,
                        h = void 0 !== b && b,
                        g = (0, ti.useMemo)(function() {
                            return {
                                size: i,
                                isModal: l,
                                type: a,
                                hasCloseAffordance: u,
                                closeLabel: c,
                                hasMarginTop: d,
                                hasMarginBottom: p,
                                hasDescription: m
                            }
                        }, [i, l, a, u, c, d, p, m]);
                    return (0, ti.useEffect)(function() {
                        h && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [h, t]), to().createElement(dp.Provider, {
                        value: g
                    }, to().createElement(u0, {
                        open: t,
                        onOpenChange: r
                    }, n))
                };
            dg.displayName = "Dialog";
            var dv = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.style,
                    i = e.overlayClassName,
                    o = e.overlayStyle,
                    a = e.onOpenAutoFocus,
                    l = df(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    u = dy(),
                    c = u.size,
                    s = u.isModal,
                    d = u.hasCloseAffordance,
                    f = u.closeLabel,
                    p = u.hasDescription,
                    y = ta("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", s && "bg-common-backdrop", i),
                    m = ta("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return to().createElement(u6, null, to().createElement(u7, {
                    className: y,
                    style: o
                }, to().createElement(cr, dd({
                    className: m,
                    "data-size": c,
                    style: n,
                    onOpenAutoFocus: a
                }, !p && {
                    "aria-describedby": void 0
                }, l), d && to().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, to().createElement(cs, {
                    asChild: !0
                }, to().createElement(ds, {
                    variant: "OverMedia",
                    size: c,
                    isCircular: !0,
                    "aria-label": f
                }))), t)))
            };
            dv.displayName = "DialogContent";
            var dw = function(e) {
                var t = e.children,
                    r = e.className,
                    n = df(e, ["children", "className"]),
                    i = dy(),
                    o = i.size,
                    a = i.hasMarginTop,
                    l = i.hasMarginBottom,
                    u = ta(dm[o], a && db[o], l && dh[o], r);
                return to().createElement("div", dd({
                    className: u
                }, n), t)
            };
            dw.displayName = "DialogBody";
            var dx = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.hidden,
                    i = df(e, ["children", "className", "hidden"]),
                    o = to().createElement(cl, dd({
                        className: r
                    }, i), t);
                return n ? to().createElement(cR, null, o) : o
            };
            dx.displayName = "DialogTitle";
            var dj = function(e) {
                var t = e.children,
                    r = e.className,
                    n = df(e, ["children", "className"]),
                    i = dy().size,
                    o = ta(dm[i], dh[i], r);
                return to().createElement("div", dd({
                    className: o
                }, n), t)
            };
            dj.displayName = "DialogFooter";
            var dO = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.title,
                        i = e.body,
                        o = (0, M.useTranslation)().translate;
                    return (0, I.jsx)(dg, {
                        closeLabel: o("Action.Close"),
                        hasCloseAffordance: !0,
                        isModal: !0,
                        open: t,
                        size: "Small",
                        type: "Default",
                        onOpenChange: r,
                        children: (0, I.jsxs)(dv, {
                            className: "stroke-standard stroke-default flex flex-col items-start",
                            style: {
                                width: "100%",
                                maxWidth: 320
                            },
                            children: [(0, I.jsxs)(dw, {
                                className: "width-full gap-small padding-top-medium padding-x-xlarge padding-bottom-large flex flex-col items-start",
                                children: [(0, I.jsx)(dx, {
                                    className: "margin-none text-heading-small content-emphasis text-align-x-start",
                                    children: n
                                }), (0, I.jsx)("p", {
                                    className: "margin-none text-body-medium content-default text-align-x-start whitespace-pre-line",
                                    children: i
                                })]
                            }), (0, I.jsx)(dj, {
                                className: "width-full",
                                children: (0, I.jsx)(tW, {
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
                dS = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600"
                },
                dI = {
                    XSmall: "size-150",
                    Small: "size-200",
                    Medium: "size-250"
                },
                dM = {
                    XSmall: "size-1200",
                    Small: "size-1400",
                    Medium: "size-1600"
                },
                dN = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium"
                },
                dP = {
                    XSmall: void 0,
                    Small: "padding-top-xxsmall",
                    Medium: "padding-y-xxsmall"
                },
                dE = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium"
                },
                dT = {
                    XSmall: "padding-medium",
                    Small: "padding-large",
                    Medium: "padding-xlarge"
                },
                dD = {
                    XSmall: "Small",
                    Small: "Medium",
                    Medium: "Large"
                },
                dA = (0, ti.forwardRef)(function(e, t) {
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
                        y = void 0 !== p && p,
                        m = (0, ti.useMemo)(function() {
                            return a && to().createElement("div", {
                                className: ta(dN[n], dP[n], "content-emphasis text-align-x-start", "clip [display:-webkit-box] [-webkit-line-clamp:3] [-webkit-box-orient:vertical]")
                            }, a)
                        }, [a, n]),
                        b = (0, ti.useMemo)(function() {
                            return s && to().createElement("div", {
                                className: ta("text-caption-small content-default text-align-x-start", "text-truncate-split text-no-wrap width-full")
                            }, s)
                        }, [s]),
                        h = (0, ti.useMemo)(function() {
                            return l && to().createElement("div", {
                                className: ta(dE[n], "content-default text-align-x-start")
                            }, l)
                        }, [l, n]),
                        g = (0, ti.useMemo)(function() {
                            return c && to().createElement(tf, {
                                name: c,
                                size: dD[n]
                            })
                        }, [c, n]),
                        v = (0, ti.useMemo)(function() {
                            switch (i) {
                                case "Checkmark":
                                    return d && to().createElement(tf, {
                                        name: "icon-filled-check",
                                        size: dD[n]
                                    });
                                case "Checkbox":
                                    return to().createElement("div", {
                                        className: ta(dS[n], "flex items-center justify-center radius-small padding-none content-default", d ? "stroke-none" : "stroke-standard stroke-emphasis", d ? "bg-system-contrast" : "bg-none")
                                    }, d && to().createElement("div", {
                                        className: ta(dS[n], "content-inverse-emphasis icon icon-filled-check")
                                    }));
                                case "Radio":
                                    return to().createElement("div", {
                                        className: ta(dS[n], "radius-circle flex items-center justify-center stroke-emphasis stroke-standard", d ? "bg-system-contrast" : "bg-none")
                                    }, d && to().createElement("div", {
                                        className: ta("radius-circle bg-inverse-action-sub-emphasis", dI[n])
                                    }));
                                default:
                                    return console.error("Invalid OptionSelector type ".concat(i)), null
                            }
                        }, [i, n, d]),
                        w = (0, ti.useMemo)(function() {
                            return u && to().createElement("div", {
                                className: ta(dM[n], "flex items-center justify-center clip shrink-0")
                            }, u)
                        }, [u, n]),
                        x = (0, ti.useMemo)(function() {
                            var e = !y && to().createElement("div", {
                                className: dS[n]
                            }, v);
                            switch (r) {
                                case "Horizontal":
                                    return to().createElement("div", {
                                        className: "flex gap-large"
                                    }, w, to().createElement("div", {
                                        className: "flex flex-col gap-xsmall fill clip"
                                    }, to().createElement("div", {
                                        className: "flex gap-small items-start"
                                    }, to().createElement("div", {
                                        className: "flex flex-col items-start fill clip"
                                    }, to().createElement("div", {
                                        className: "flex gap-small items-center width-full"
                                    }, g, m), b), e), h));
                                case "Vertical":
                                    return to().createElement("div", {
                                        className: "flex flex-col gap-xsmall"
                                    }, to().createElement("div", {
                                        className: "flex gap-small"
                                    }, to().createElement("div", {
                                        className: "flex flex-col gap-medium fill min-width-0"
                                    }, w, to().createElement("div", {
                                        className: "flex flex-col gap-xsmall"
                                    }, g, m, b)), e), h);
                                default:
                                    return console.error("Invalid OptionSelector layout ".concat(r)), null
                            }
                        }, [r, w, g, m, h, v, n, b, y]);
                    return to().createElement("button", {
                        type: "button",
                        className: ta(tp, "focus:outline-focus bg-none width-full radius-medium stroke-standard", d ? "stroke-system-contrast" : "stroke-contrast-alpha", dT[n], o && "opacity-[0.5]", !o && "cursor-pointer"),
                        disabled: o,
                        ref: t,
                        onClick: function() {
                            return f()
                        }
                    }, !o && to().createElement(ty, null), x)
                });
            dA.displayName = "OptionSelector";
            var dL = function(e) {
                    var t = e.product,
                        r = e.isBundle,
                        n = (0, M.useTranslation)(),
                        i = n.translate,
                        o = n.intl,
                        a = re(t);
                    (0, ti.useEffect)(function() {
                        r && 0 === a && sP(sN.BUNDLE_PICKER_ROW_MISSING_ROBUX_ALLOWANCE, {
                            productId: t.productKey.id
                        }), r && !t.localizedStrikethroughPriceDisplayString && sP(sN.BUNDLE_PICKER_ROW_MISSING_STRIKETHROUGH_PRICE, {
                            productId: t.productKey.id,
                            currencyCode: t.localizedPrice.currencyCode
                        })
                    }, [r, t.localizedPrice.currencyCode, t.localizedStrikethroughPriceDisplayString, t.productKey.id, a]);
                    var l = o.n(a),
                        u = a > 0 ? "".concat(i("Label.BlackbirdShort"), " ").concat(a) : i("Label.Blackbird"),
                        c = t.localizedPriceDisplayString,
                        s = t.localizedStrikethroughPriceDisplayString;
                    return (0, I.jsxs)("div", {
                        className: "width-full min-height-700 flex flex-col items-stretch justify-center",
                        children: [(0, I.jsxs)("div", {
                            className: "width-full flex flex-row items-center justify-between",
                            children: [(0, I.jsx)("span", {
                                className: "text-title-medium content-emphasis",
                                children: u
                            }), (0, I.jsxs)("div", {
                                className: "gap-small flex flex-row items-center justify-end",
                                children: [s && (0, I.jsx)("span", {
                                    className: "text-body-medium strike-through",
                                    style: {
                                        color: "#6a6f81"
                                    },
                                    children: s
                                }), (0, I.jsx)("span", {
                                    className: "text-body-medium content-emphasis text-strikethrough",
                                    children: c
                                })]
                            })]
                        }), a > 0 && (0, I.jsx)("div", {
                            className: "width-full gap-xsmall flex flex-row items-center justify-start",
                            children: (0, I.jsx)("span", {
                                className: "text-body-medium content-default flex flex-row items-center",
                                children: a0(i, "Plus.LandingPage.BottomSheet.Benefit", [{
                                    opening: "amountStart",
                                    closing: "amountEnd",
                                    render: function(e) {
                                        return (0, I.jsxs)("span", {
                                            className: "padding-left-xxsmall gap-x-xxsmall flex flex-row items-center",
                                            children: [(0, I.jsx)(tf, {
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
                dC = function(e) {
                    var t = e.product,
                        r = e.isSelected,
                        n = e.onSelect,
                        i = e.isBundle;
                    return (0, I.jsx)("div", {
                        "data-testid": "bundle-picker-tier-".concat(t.productKey.id),
                        children: (0, I.jsx)(dA, {
                            hideSelectedIndicator: !0,
                            isSelected: r,
                            label: void 0,
                            layout: "Horizontal",
                            metadata: (0, I.jsx)(dL, {
                                isBundle: i,
                                product: t
                            }),
                            size: "XSmall",
                            type: "Checkmark",
                            onSelect: n
                        })
                    })
                };

            function dR(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var dk = function(e) {
                    var t, r, n, i, o, a, l = e.isOpen,
                        u = e.onOpenChange,
                        c = e.products,
                        s = e.deviceMeta,
                        d = e.isEntrypointDisabled,
                        f = e.onMobilePurchaseInitiated,
                        p = e.paymentSessionId,
                        y = e.referrerId,
                        m = (0, M.useTranslation)().translate,
                        b = null == (a = c[0]) ? void 0 : a.productKey.id,
                        h = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, ti.useState)(b)) || function(e) {
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
                                if ("string" == typeof e) return dR(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return dR(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        g = h[0],
                        v = h[1];
                    (0, ti.useEffect)(function() {
                        g && c.some(function(e) {
                            return e.productKey.id === g
                        }) || v(b)
                    }, [b, c, g]);
                    var w = (0, ti.useMemo)(function() {
                            var e;
                            return null != (e = c.find(function(e) {
                                return e.productKey.id === g
                            })) ? e : c[0]
                        }, [c, g]),
                        x = !!w && void 0 !== rt(w),
                        j = (0, ti.useRef)(!1);
                    (0, ti.useEffect)(function() {
                        if (!l) {
                            j.current = !1;
                            return
                        }!j.current && p && (j.current = !0, sq().sendUserPurchaseFlowEvent(sq().ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, sq().ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, sq().ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, sq().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_BUNDLE_SHEET_OPENED, p ? {
                            paymentSessionId: p
                        } : {}), sP(sN.BUNDLE_PICKER_SHEET_OPENED, {
                            tierCount: String(c.length),
                            defaultProductId: null != b ? b : ""
                        }))
                    }, [l, p, c.length, b]);
                    var O = (0, ti.useCallback)(function(e) {
                            v(e), sq().sendUserPurchaseFlowEvent(sq().ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, sq().ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, sq().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, sq().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_BUNDLE_TIER_SELECTED, function(e) {
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
                            } : {})), sP(sN.BUNDLE_PICKER_TIER_SELECTED, {
                                productId: e
                            })
                        }, [p]),
                        S = (0, ti.useCallback)(function() {
                            var e = x ? sq().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : sq().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                            sq().sendUserPurchaseFlowEvent(sq().ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, sq().ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, sq().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, e, p ? {
                                paymentSessionId: p
                            } : {}), sP(sN.BUNDLE_PICKER_SUBSCRIBE_CLICK, {
                                productId: null != g ? g : "",
                                isFreeTrial: String(x)
                            })
                        }, [x, g, p]);
                    if (!w) return null;
                    var N = [{
                            opening: "linkStart",
                            closing: "linkEnd",
                            render: function(e) {
                                return (0, I.jsx)("a", {
                                    className: "content-link underline",
                                    href: tt,
                                    rel: "noopener noreferrer",
                                    target: "_blank",
                                    children: e
                                })
                            }
                        }],
                        P = (i = null == (n = rt(w)) || null == (r = n.freeTrialOffer) ? void 0 : r.estimatedTrialEndDate) ? new Date(i).toLocaleDateString(void 0, {
                            year: "numeric",
                            month: "long",
                            day: "numeric"
                        }) : "",
                        E = d ? m("Description.EntrypointDisabled") : a0(m, x ? "Description.SubscriptionFreeTrialLegal" : "Description.SubscriptionLegal", N, x ? {
                            date: P
                        } : void 0),
                        T = s.isAndroidApp || s.isIosApp,
                        D = x ? m("Action.TryItForFree") : m("Action.PricePerMonth", {
                            price: null != (o = w.localizedPriceDisplayString) ? o : "",
                            periodType: w.periodType
                        });
                    return (0, I.jsx)(cH, {
                        open: l,
                        onOpenChange: u,
                        children: (0, I.jsxs)(cX, {
                            centerSheetSize: "Medium",
                            closeLabel: m("Action.Close"),
                            largeScreenVariant: "center",
                            children: [(0, I.jsx)(c$, {
                                children: m("Label.PickAPlan")
                            }), (0, I.jsx)(cZ, {
                                className: "gap-y-medium padding-y-medium flex flex-col",
                                "data-testid": "bundle-picker-sheet-body",
                                children: c.map(function(e, t) {
                                    return (0, I.jsx)(dC, {
                                        isBundle: 0 !== t,
                                        isSelected: w.productKey.id === e.productKey.id,
                                        product: e,
                                        onSelect: function() {
                                            O(e.productKey.id)
                                        }
                                    }, e.productKey.id)
                                })
                            }), (0, I.jsx)(cJ, {
                                children: (0, I.jsxs)("div", {
                                    className: "gap-y-small flex flex-col",
                                    children: [(0, I.jsx)(su, {
                                        className: "width-full",
                                        deviceMeta: s,
                                        isDisabled: d,
                                        paymentSessionId: p,
                                        productId: null != g ? g : "",
                                        productType: w.productKey.type,
                                        referrerId: y,
                                        size: "Medium",
                                        trackSubscriptionButtonClick: S,
                                        onSubscribeClick: T ? f : void 0,
                                        children: D
                                    }), (0, I.jsx)("p", {
                                        className: "text-caption-small content-muted text-align-x-left",
                                        "data-testid": "bundle-picker-legal-footer",
                                        children: E
                                    })]
                                })
                            })]
                        })
                    })
                },
                dU = window.Roblox["core-scripts"].deepLink,
                dz = {
                    itemId: 0x4b45c0ee905a,
                    itemType: dU.ItemType.Asset
                },
                d_ = function(e) {
                    var t = e.itemId,
                        r = e.itemType;
                    return "roblox://navigation/item_details?itemId=".concat(t, "&itemType=").concat(r)
                },
                dB = function(e) {
                    return (0, dU.navigateToDeepLink)(d_(e))
                };

            function dY(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function dF(e) {
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

            function dG(e, t) {
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

            function dW(e, t) {
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
                        if ("string" == typeof e) return dY(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return dY(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var dV = {
                    enabled: !1,
                    arrivedGiftDate: new Date(2026, 7, 14)
                },
                dQ = function(e) {
                    var t, r, n, i, o = e.deviceMeta,
                        a = e.robloxSubscriptionProducts,
                        l = e.isEntrypointDisabled,
                        u = e.onMobilePurchaseInitiated,
                        c = (0, M.useTranslation)().translate,
                        s = (null != (t = function() {
                            var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                            return function() {
                                var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0],
                                    t = s7((0, ti.useState)(e ? void 0 : sW().getLocalStorage(s9)), 2),
                                    r = t[0],
                                    n = t[1],
                                    i = s7((0, ti.useState)(!1), 2),
                                    o = i[0],
                                    a = i[1],
                                    l = (0, ti.useCallback)(function(e) {
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
                                                        return [4, s3(function() {
                                                            return s5(this, function(t) {
                                                                return [2, s2(sZ.GET, {
                                                                    withCredentials: !0,
                                                                    url: "".concat(c2.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions/").concat(e)
                                                                }, {
                                                                    feature: s$.PAYMENT,
                                                                    call: sJ.GET_PAYMENT_SESSION
                                                                })]
                                                            })
                                                        })()];
                                                    case 1:
                                                        return r = i.sent(), [3, 4];
                                                    case 2:
                                                        return [4, s3(function() {
                                                            return s5(this, function(e) {
                                                                return [2, s2(sZ.POST, {
                                                                    withCredentials: !0,
                                                                    url: "".concat(c2.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions")
                                                                }, {
                                                                    feature: s$.PAYMENT,
                                                                    call: sJ.CREATE_PAYMENT_SESSION
                                                                }, {
                                                                    paymentFlowId: sq().getPaymentFlowUuid()
                                                                })]
                                                            })
                                                        })()];
                                                    case 3:
                                                        r = i.sent(), i.label = 4;
                                                    case 4:
                                                        if (!(t = r)) return [2];
                                                        return sW().setLocalStorage(s9, t.paymentSession), n(t.paymentSession), [2]
                                                }
                                            })
                                        }, function() {
                                            var e = this,
                                                r = arguments;
                                            return new Promise(function(n, i) {
                                                var o = t.apply(e, r);

                                                function a(e) {
                                                    s8(o, n, i, a, l, "next", e)
                                                }

                                                function l(e) {
                                                    s8(o, n, i, a, l, "throw", e)
                                                }
                                                a(void 0)
                                            })
                                        })()
                                    }, []);
                                return (0, ti.useEffect)(function() {
                                    if (r) {
                                        new Date(r.expiresAt) < new Date && (a(!0), l());
                                        return
                                    }
                                    var e, t = null == (e = sV.urlService.getQueryParam("paymentSessionId")) ? void 0 : e.toString();
                                    t || a(!0), l(t)
                                }, [l, r]), (0, ti.useMemo)(function() {
                                    return {
                                        paymentSession: r,
                                        wasCreatedByCurrentClient: o
                                    }
                                }, [r, o])
                            }(e).paymentSession
                        }()) ? t : {}).id,
                        d = (0, ti.useMemo)(function() {
                            return dt(window.location.search)
                        }, []),
                        f = "invite" === d.kind ? d.referrerId : void 0,
                        p = a[0],
                        y = a.length > 1,
                        m = dW((0, ti.useState)(!1), 2),
                        b = m[0],
                        h = m[1],
                        g = (0, ti.useMemo)(function() {
                            return dV.arrivedGiftDate.toLocaleDateString(void 0, {
                                day: "2-digit",
                                month: "short",
                                year: "numeric"
                            })
                        }, []);
                    if (!p) throw Error("PurchaseView requires at least one subscription product");
                    var v = p.productKey,
                        w = v.id,
                        x = v.type,
                        j = (0, ti.useMemo)(function() {
                            return p.eligibleOffers.find(function(e) {
                                return "FreeTrial" === e.offerType
                            })
                        }, [p.eligibleOffers]),
                        O = null != j,
                        S = (0, ti.useMemo)(function() {
                            var e, t = null == j || null == (e = j.freeTrialOffer) ? void 0 : e.estimatedTrialEndDate;
                            return t ? new Date(t).toLocaleDateString(void 0, {
                                year: "numeric",
                                month: "long",
                                day: "numeric"
                            }) : ""
                        }, [j]),
                        N = (0, ti.useMemo)(function() {
                            return [{
                                opening: "linkStart",
                                closing: "linkEnd",
                                render: function(e) {
                                    return (0, I.jsx)("a", {
                                        className: "content-link underline",
                                        href: tt,
                                        rel: "noopener noreferrer",
                                        target: "_blank",
                                        children: e
                                    })
                                }
                            }]
                        }, []),
                        P = l ? c("Description.EntrypointDisabled") : a0(c, O ? "Description.SubscriptionFreeTrialLegal" : "Description.SubscriptionLegal", N, O ? {
                            date: S
                        } : void 0),
                        E = (0, ti.useRef)(!1);
                    (0, ti.useEffect)(function() {
                        if (!E.current && s) {
                            E.current = !0;
                            var e = O ? sF.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : sF.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                            sF.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(sF.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, sF.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, sF.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, e, s ? {
                                paymentSessionId: s
                            } : {}), sP(sN.PURCHASE_VIEW_SHOWN, {
                                variant: y ? "multi" : "single",
                                tierCount: String(a.length),
                                isFreeTrial: String(O),
                                referralLanding: d.kind
                            })
                        }
                    }, [s, O, y, a.length, d.kind]);
                    var T = (0, ti.useRef)(!1);
                    (0, ti.useEffect)(function() {
                        T.current || "none" === d.kind || (T.current = !0, sP(sN.REFERRAL_LANDING_DETECTED, {
                            kind: d.kind,
                            hasReferrerId: String(void 0 !== f)
                        }))
                    }, [d.kind, f]);
                    var D = o.isAndroidApp || o.isIosApp,
                        A = dW((0, ti.useState)(null), 2),
                        L = A[0],
                        C = A[1],
                        R = (0, ti.useCallback)(function() {
                            var e = O ? sF.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : sF.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                            sF.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(sF.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, sF.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, sF.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, e, s ? {
                                paymentSessionId: s
                            } : {})
                        }, [O, s]),
                        k = c(O ? "Action.TryItForFree" : "Action.Subscribe"),
                        U = {
                            productId: w,
                            productType: x,
                            deviceMeta: o,
                            isDisabled: l,
                            paymentSessionId: s,
                            referrerId: f,
                            trackSubscriptionButtonClick: R,
                            onSubscribeClick: D ? u : void 0
                        },
                        z = dG(dF({}, U), {
                            trackSubscriptionButtonClick: void 0
                        }),
                        _ = function() {
                            l || (sP(sN.PURCHASE_VIEW_OPEN_SHEET_CLICK), h(!0))
                        },
                        B = function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "Large";
                            return (0, I.jsx)(tW, {
                                className: e,
                                "data-testid": "purchase-open-sheet-button",
                                isDisabled: l,
                                size: t,
                                variant: "Emphasis",
                                onClick: _,
                                children: k
                            })
                        },
                        Y = a0(c, "Label.PlusLandingPage.Subtitle.V3", [{
                            opening: "boldStart",
                            closing: "boldEnd",
                            render: function(e) {
                                return (0, I.jsx)("span", {
                                    className: "text-heading-small",
                                    children: e
                                })
                            }
                        }], {
                            price: null != (r = p.localizedPriceDisplayString) ? r : "",
                            periodType: p.periodType
                        }),
                        F = (0, I.jsxs)("div", {
                            "aria-label": c("Action.Subscribe"),
                            className: "bottom-dock padding-t-medium bg-surface-100 large:hidden width-full gap-y-medium flex flex-col",
                            "data-testid": "purchase-subscribe-dock",
                            role: "region",
                            children: [(0, I.jsx)(t7, {}), (0, I.jsxs)("div", {
                                className: "width-full gap-y-medium padding-b-[env(safe-area-inset-bottom\\,0px)] padding-x-xxlarge flex flex-col items-stretch",
                                children: [y ? B("min-width-0 width-full") : (0, I.jsx)(su, dG(dF({}, U), {
                                    className: "min-width-0 width-full",
                                    size: "Medium",
                                    children: k
                                })), (0, I.jsx)("p", {
                                    className: "text-caption-small content-muted margin-bottom-[24px] large:margin-bottom-none padding-x-xsmall text-align-x-start",
                                    children: P
                                })]
                            })]
                        });
                    return (0, I.jsxs)(ti.Fragment, {
                        children: [(0, I.jsx)(t8, {}), (0, I.jsx)("div", {
                            className: "width-full min-width-0 large:items-center flex flex-col items-start",
                            children: (0, I.jsxs)("div", {
                                className: "margin-top-[48px] width-full min-width-0 content-emphasis large:max-width-[730px] large:gap-y-[32px] large:self-auto large:padding-x-xlarge flex flex-col gap-y-[32px] self-stretch",
                                children: [dV.enabled && (0, I.jsx)("div", {
                                    className: "width-full min-width-0 padding-x-xxlarge large:padding-x-none",
                                    children: (0, I.jsx)(dn, {
                                        body: c("Description.BannerBodyArrivedPurchase", {
                                            date: g
                                        }),
                                        title: c("Description.BannerTitleArrivedPurchase"),
                                        onItemDetailsClick: function() {
                                            dB(dz).catch(function() {})
                                        }
                                    })
                                }), (0, I.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge text-align-x-start large:gap-y-[24px] large:items-center large:padding-x-none large:text-align-x-center flex flex-col items-start",
                                    children: [(0, I.jsxs)("div", {
                                        className: "gap-y-xsmall large:items-center flex flex-col items-start",
                                        children: [(0, I.jsx)(di, {
                                            variant: "compact"
                                        }), (0, I.jsxs)("h1", {
                                            className: "font-builder-extended text-display-small large:![font-size:var(--font-size-1000)] content-emphasis ![font-size:var(--font-size-800)]",
                                            children: [(0, I.jsx)("span", {
                                                className: "large:inline block",
                                                children: c("Title.PurchasePromoHeadlinePart1")
                                            }), (0, I.jsx)("span", {
                                                className: "large:inline hidden",
                                                children: "\xa0"
                                            }), (0, I.jsx)("span", {
                                                className: "large:inline block",
                                                children: c("Title.PurchasePromoHeadlinePart2")
                                            })]
                                        })]
                                    }), (0, I.jsxs)("div", {
                                        className: "gap-y-xsmall width-full min-width-0 large:text-align-x-center flex flex-col",
                                        children: [y ? (0, I.jsx)("span", {
                                            className: "text-body-large content-emphasis",
                                            children: Y
                                        }) : (0, I.jsx)(dl, {
                                            eligibleOffers: p.eligibleOffers,
                                            periodType: p.periodType,
                                            price: p.localizedPrice
                                        }), (0, I.jsx)("div", {
                                            className: "width-full gap-y-medium padding-t-none large:margin-x-auto large:margin-top-[24px] large:flex large:max-width-[min(440px,100%)] large:width-full large:flex-col large:items-center hidden items-start",
                                            children: (0, I.jsx)("div", {
                                                className: "width-full gap-x-small flex shrink-0 flex-row items-start justify-center",
                                                children: y ? B("width-full large:width-[230px] shrink-0", "Medium") : (0, I.jsx)(su, dG(dF({}, U), {
                                                    className: "width-full large:width-[230px] shrink-0",
                                                    size: "Medium",
                                                    children: k
                                                }))
                                            })
                                        })]
                                    })]
                                }), (0, I.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge large:padding-x-none flex flex-col",
                                    children: [(0, I.jsx)("span", {
                                        className: "text-heading-small",
                                        children: c("Title.Benefits", {
                                            productShort: c("Label.BlackbirdShort")
                                        })
                                    }), (0, I.jsx)("div", {
                                        className: "width-full padding-b-xlarge large:padding-b-none",
                                        children: (0, I.jsx)(t5, {
                                            featureConfig: t9(p),
                                            periodType: p.periodType,
                                            onTileClick: function(e, t) {
                                                C({
                                                    primary: e,
                                                    secondary: t
                                                })
                                            }
                                        })
                                    }), (0, I.jsx)("p", {
                                        className: "text-caption-small content-muted padding-x-xsmall text-align-x-start large:block large:padding-x-none hidden",
                                        "data-testid": "purchase-legal-footer",
                                        children: P
                                    })]
                                })]
                            })
                        }), F, (0, I.jsx)(dO, {
                            body: null != (n = null == L ? void 0 : L.secondary) ? n : "",
                            open: null != L,
                            title: null != (i = null == L ? void 0 : L.primary) ? i : "",
                            onOpenChange: function(e) {
                                e || C(null)
                            }
                        }), y && (0, I.jsx)(dk, {
                            deviceMeta: o,
                            isEntrypointDisabled: l,
                            isOpen: b,
                            paymentSessionId: s,
                            products: a,
                            referrerId: f,
                            onMobilePurchaseInitiated: u,
                            onOpenChange: h
                        }), (0, I.jsx)(dr, {
                            subscribeButtonProps: z,
                            subscribeEligibleOffers: p.eligibleOffers,
                            subscribeFeatureConfig: t9(p),
                            subscribePeriodType: p.periodType,
                            subscribePrice: p.localizedPrice
                        })]
                    })
                };

            function dq(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }
            var dK = new Map([
                    ["Invalid", "Invalid"],
                    ["Eligible", "Eligible"],
                    ["Ineligible", "Ineligible"],
                    [0, "Invalid"],
                    [1, "Eligible"],
                    [2, "Ineligible"]
                ]),
                dH = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        t = e.enabled,
                        r = (void 0 === t || t) && te(),
                        n = (0, T.useQuery)({
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
                                                return [4, c3.subscriptionsV2CheckSubscriptionReferralEligibility({})];
                                            case 1:
                                                return e = t.sent().eligibility, [2, dK.get(e)]
                                        }
                                    })
                                }, function() {
                                    var t = this,
                                        r = arguments;
                                    return new Promise(function(n, i) {
                                        var o = e.apply(t, r);

                                        function a(e) {
                                            dq(o, n, i, a, l, "next", e)
                                        }

                                        function l(e) {
                                            dq(o, n, i, a, l, "throw", e)
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
                dX = function(e) {
                    var t = e.title,
                        r = e.body;
                    return (0, I.jsxs)("div", {
                        className: "bg-shift-200 radius-medium padding-medium gap-medium width-full flex items-center",
                        children: [(0, I.jsx)("div", {
                            className: "radius-medium size-[50px] shrink-0 flex items-center justify-center",
                            children: (0, I.jsx)(tf, {
                                className: "!size-900",
                                name: "icon-regular-roblox-plus"
                            })
                        }), (0, I.jsxs)("div", {
                            className: "min-width-0 grow-1 shrink-1 flex basis-0 flex-col justify-center",
                            children: [(0, I.jsx)("span", {
                                className: "text-title-medium content-emphasis",
                                children: t
                            }), (0, I.jsx)("span", {
                                className: "text-body-medium content-default",
                                children: r
                            })]
                        })]
                    })
                };

            function dZ(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var d$ = function(e, t) {
                return (d$ = Object.setPrototypeOf || dZ({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function dJ(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function r() {
                    this.constructor = e
                }
                d$(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
            }

            function d0(e, t, r, n) {
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
                        e.done ? i(e.value) : (dZ(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, l)
                    }
                    u((n = n.apply(e, t || [])).next())
                })
            }

            function d1(e, t) {
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

            function d2(e) {
                var t;
                return null == (t = e) ? t : {
                    periodIndex: t.periodIndex,
                    discountPercent: t.discountPercent
                }
            }
            var d4 = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return dJ(t, e), t.prototype.robloxPlusGetRobloxPlusUserBenefitsRaw = function(e, t) {
                        return d0(this, void 0, void 0, function() {
                            var r, n;
                            return d1(this, function(i) {
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
                                        return [2, new eY(i.sent(), function(e) {
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
                        return d0(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), d1(this, function(r) {
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
                }(ek),
                d3 = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return dJ(t, e), t.prototype.robloxSubscriptionMetadataGetRobloxSubscriptionMetadataRaw = function(e, t) {
                        return d0(this, void 0, void 0, function() {
                            var r, n;
                            return d1(this, function(i) {
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
                                        return [2, new eY(i.sent(), function(e) {
                                            var t, r;
                                            return null == e ? e : {
                                                unifiedPurchaseFlowMetadata: null == (t = e.unifiedPurchaseFlowMetadata) ? t : {
                                                    isUserEligibleForUnifiedPurchaseFlow: t.isUserEligibleForUnifiedPurchaseFlow,
                                                    expiresInSeconds: t.expiresInSeconds
                                                },
                                                robloxSubscriptionExperimentMetadata: null == (r = e.robloxSubscriptionExperimentMetadata) ? r : {
                                                    subscriptionsVariant: eB(r, "subscriptionsVariant") ? r.subscriptionsVariant : void 0
                                                }
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.robloxSubscriptionMetadataGetRobloxSubscriptionMetadata = function() {
                        return d0(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), d1(this, function(r) {
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
                }(ek),
                d5 = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return dJ(t, e), t.prototype.robloxSubscriptionProductsGetRobloxSubscriptionProductRaw = function(e, t) {
                        return d0(this, void 0, void 0, function() {
                            var r, n;
                            return d1(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.robloxSubscriptionProductId || void 0 === e.robloxSubscriptionProductId) throw new e_("robloxSubscriptionProductId", "Required parameter requestParameters.robloxSubscriptionProductId was null or undefined when calling robloxSubscriptionProductsGetRobloxSubscriptionProduct.");
                                        return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                            path: "/v1/products/{robloxSubscriptionProductId}".replace("{".concat("robloxSubscriptionProductId", "}"), encodeURIComponent(String(e.robloxSubscriptionProductId))),
                                            schemaPath: "/v1/products/{robloxSubscriptionProductId}",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eY(i.sent(), function(e) {
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
                                                        virtualTransactionDiscounts: null === n.virtualTransactionDiscounts ? null : n.virtualTransactionDiscounts.map(d2),
                                                        isRobuxTransferEnabled: n.isRobuxTransferEnabled,
                                                        isTradingEnabled: n.isTradingEnabled,
                                                        isUgcPublishingEnabled: n.isUgcPublishingEnabled,
                                                        privateServerDiscounts: null === n.privateServerDiscounts ? null : n.privateServerDiscounts.map(d2),
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
                        return d0(this, void 0, void 0, function() {
                            return d1(this, function(r) {
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
                }(ek),
                d6 = function(e, t) {
                    return new Date(Date.UTC(e, t + 1, 0)).getUTCDate()
                },
                d8 = function(e, t) {
                    var r = e.getUTCFullYear(),
                        n = e.getUTCMonth(),
                        i = e.getUTCDate(),
                        o = n + t,
                        a = r + Math.floor(o / 12),
                        l = (o % 12 + 12) % 12,
                        u = Math.min(i, d6(a, l));
                    return new Date(Date.UTC(a, l, u, e.getUTCHours(), e.getUTCMinutes(), e.getUTCSeconds(), e.getUTCMilliseconds()))
                },
                d7 = function(e, t) {
                    var r = e.getUTCFullYear() + t,
                        n = e.getUTCMonth(),
                        i = Math.min(e.getUTCDate(), d6(r, n));
                    return new Date(Date.UTC(r, n, i, e.getUTCHours(), e.getUTCMinutes(), e.getUTCSeconds(), e.getUTCMilliseconds()))
                },
                d9 = function(e, t, r) {
                    var n = new Date(e);
                    switch (r) {
                        case "Week":
                            return n.setUTCDate(n.getUTCDate() + 7 * t), n;
                        case "Month":
                            return d8(n, t);
                        case "Year":
                            return d7(n, t);
                        default:
                            throw Error("Unsupported period type: ".concat(r))
                    }
                },
                fe = function(e, t, r, n) {
                    for (var i = 0; i < 1e3 && !(n < d9(e, i + 1, t).getTime());) i += 1;
                    return r && r < n && i > 0 && (i -= 1), i
                },
                ft = function(e) {
                    var t = e.currentDiscountPercent,
                        r = e.nextDiscount,
                        n = e.activationTimestampMs,
                        i = e.isCancelled,
                        o = e.periodType,
                        a = (0, M.useTranslation)(),
                        l = a.translate,
                        u = a.intl,
                        c = (0, ti.useMemo)(function() {
                            if (!r) return null;
                            var e = Date.now(),
                                t = d9(n, r.periodIndex, o).getTime();
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
                            return (0, I.jsxs)("div", {
                                className: "margin-right-[-16px] relative flex size-[60px] shrink-0 items-center justify-center",
                                children: [(0, I.jsx)("div", {
                                    "aria-hidden": !0,
                                    className: "stroke-emphasis stroke-standard absolute inset-[0] rounded-[2.4px] [transform:rotate(-15deg)]"
                                }), e]
                            })
                        };
                    return (0, I.jsxs)("div", {
                        className: "radius-medium padding-large bg-shift-200 width-full gap-x-small flex items-center justify-between [overflow:clip]",
                        children: [(0, I.jsxs)("div", {
                            className: "gap-y-small min-width-0 flex flex-col items-start justify-center",
                            children: [(0, I.jsx)("span", {
                                className: "text-title-medium content-default",
                                children: i ? l(s ? "Description.Benefit.DiscountStaySubscribedToKeep" : "Description.Benefit.DiscountStaySubscribedToGet") : s ? l("Description.Benefit.DiscountMaxReached") : l("Description.Benefit.DiscountCurrent", {
                                    discountPercent: u.n(.01 * t, {
                                        style: "percent"
                                    })
                                })
                            }), (0, I.jsx)("span", {
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
                        }), (0, I.jsx)("div", {
                            className: "shrink-0",
                            children: s ? f((0, I.jsx)(tf, {
                                name: "icon-regular-circle-check",
                                size: "XLarge"
                            })) : d && !i ? (0, I.jsx)(ru, {
                                ariaLabel: l("Label.Progress"),
                                className: "[--fui-future-alpha-color-system-progress:var(--color-content-emphasis)]",
                                size: "Large",
                                value: c.targetDateProgressPercent,
                                variant: "Determinate"
                            }) : f((0, I.jsx)(tf, {
                                name: "icon-regular-calendar",
                                size: "XLarge"
                            }))
                        })]
                    })
                };

            function fr(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function fn(e) {
                if (Array.isArray(e)) return e
            }

            function fi() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function fo(e, t) {
                return fn(e) || function(e, t) {
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
                }(e, t) || fa(e, t) || fi()
            }

            function fa(e, t) {
                if (e) {
                    if ("string" == typeof e) return fr(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return fr(e, t)
                }
            }
            var fl = function(e) {
                    var t = e.scrollLeft,
                        r = e.scrollWidth,
                        n = e.clientWidth,
                        i = Math.abs(t),
                        o = r - n;
                    return o <= 1 ? "Middle" : i <= 1 ? "Start" : i >= o - 1 ? "End" : "Middle"
                },
                fu = (0, ti.forwardRef)(function(e, t) {
                    var r, n, i, o = fn(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || fa(r) || fi(),
                        a = o[0],
                        l = o.slice(1),
                        u = a.children,
                        c = a.hasMargin,
                        s = a.discretePosition,
                        d = void 0 !== s && s,
                        f = a.className,
                        p = a.previousButtonAriaLabel,
                        y = a.nextButtonAriaLabel,
                        m = a["aria-label"],
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
                        h = fo(l, 1)[0],
                        g = (0, ti.useRef)(null),
                        v = fo((0, ti.useState)("Start"), 2),
                        w = v[0],
                        x = v[1],
                        j = fo((0, ti.useState)(!1), 2),
                        O = j[0],
                        S = j[1],
                        I = (0, ti.useCallback)(function() {
                            var e = g.current;
                            e && (x(fl(e)), S(!!e && e.scrollWidth - e.clientWidth > 1))
                        }, []);
                    (0, ti.useEffect)(function() {
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
                    var M = (0, ti.useCallback)(function() {
                            var e = g.current;
                            return e ? d ? e.clientWidth : Math.max(1, Math.round(.75 * e.clientWidth)) : 0
                        }, [d]),
                        N = (0, ti.useCallback)(function() {
                            var e = g.current;
                            e && e.scrollBy({
                                left: -M(),
                                behavior: "smooth"
                            })
                        }, [M]),
                        P = (0, ti.useCallback)(function() {
                            var e = g.current;
                            e && e.scrollBy({
                                left: M(),
                                behavior: "smooth"
                            })
                        }, [M]);
                    (0, ti.useImperativeHandle)(h, function() {
                        return {
                            scrollPrevious: N,
                            scrollNext: P,
                            scrollContainer: g.current
                        }
                    }, [N, P]);
                    var E = O && "Start" !== w,
                        T = O && "End" !== w;
                    return to().createElement("div", (n = function(e) {
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
                        className: ta("foundation-web-collection-carousel relative", f),
                        "data-position": w.toLowerCase(),
                        "data-has-margin": void 0 === c || c,
                        "data-discrete-position": d,
                        role: "region",
                        "aria-label": void 0 === m ? "Carousel" : m,
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
                    }), n), to().createElement("div", {
                        ref: g,
                        "data-testid": "collection-carousel-scroll",
                        className: "foundation-web-collection-carousel-scroll flex flex-row gap-medium"
                    }, to().Children.map(u, function(e, t) {
                        return to().createElement("div", {
                            className: "foundation-web-collection-carousel-item shrink-0",
                            key: t
                        }, e)
                    })), to().createElement("div", {
                        "data-testid": "collection-carousel-nav-previous",
                        className: "foundation-web-collection-carousel-nav foundation-web-collection-carousel-nav-previous absolute",
                        "data-visible": E,
                        "aria-hidden": !E
                    }, to().createElement(la, {
                        icon: "icon-regular-chevron-small-left",
                        ariaLabel: void 0 === p ? "Previous" : p,
                        variant: "OverMedia",
                        size: "Medium",
                        isCircular: !0,
                        tabIndex: E ? 0 : -1,
                        onClick: N,
                        isDisabled: !E
                    })), to().createElement("div", {
                        "data-testid": "collection-carousel-nav-next",
                        className: "foundation-web-collection-carousel-nav foundation-web-collection-carousel-nav-next absolute",
                        "data-visible": T,
                        "aria-hidden": !T
                    }, to().createElement(la, {
                        icon: "icon-regular-chevron-small-right",
                        ariaLabel: void 0 === y ? "Next" : y,
                        variant: "OverMedia",
                        size: "Medium",
                        isCircular: !0,
                        tabIndex: T ? 0 : -1,
                        onClick: P,
                        isDisabled: !T
                    })))
                });
            fu.displayName = "CollectionCarousel";
            var fc = function(e) {
                var t = e.children,
                    r = (0, (0, M.useTranslation)().translate)("Heading.InteractWithPlus", void 0, "Get more out of Plus");
                return (0, I.jsxs)("div", {
                    className: "gap-y-large flex flex-col",
                    children: [(0, I.jsx)("span", {
                        className: "text-heading-small content-emphasis",
                        children: r
                    }), (0, I.jsx)(fu, {
                        "aria-label": r,
                        hasMargin: !1,
                        children: t
                    })]
                })
            };

            function fs(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var fd = function(e) {
                    var t, r = e.robloxSubscriptionProduct,
                        n = (0, M.useTranslation)().translate,
                        i = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, ti.useState)(!1)) || function(e) {
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
                                if ("string" == typeof e) return fs(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return fs(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        o = i[0],
                        a = i[1],
                        l = (0, ti.useCallback)(function() {
                            a(!0)
                        }, []),
                        u = (0, ti.useMemo)(function() {
                            var e = new URL("/my/account#!/subscriptions", window.location.origin);
                            return e.searchParams.append("id", r.productKey.id), e.searchParams.append("type", r.productKey.type), e.toString()
                        }, [r.productKey.id, r.productKey.type]);
                    return (0, I.jsx)(tW, {
                        as: "a",
                        href: u,
                        isLoading: o,
                        variant: "Standard",
                        onClick: l,
                        children: n("Action.Manage")
                    })
                },
                ff = function(e) {
                    var t = e.onOpenDashboard,
                        r = (0, M.useTranslation)(),
                        n = r.translate,
                        i = r.intl.n(100),
                        o = (0, ti.useRef)(!1);
                    return (0, ti.useEffect)(function() {
                        o.current || (o.current = !0, aK(), sP(sN.SHARE_CARD_SHOWN))
                    }, []), (0, I.jsxs)("div", {
                        className: "radius-medium bg-shift-100 padding-large gap-y-small height-full min-height-[160px] ".concat("width-[235px]", " flex flex-col items-start"),
                        children: [(0, I.jsx)("span", {
                            className: "text-title-large content-emphasis",
                            children: n("Heading.ReferralCard", {
                                amount: i
                            }, "Share Plus, get 100 Robux")
                        }), (0, I.jsx)("p", {
                            className: "text-body-medium content-default margin-none grow-1",
                            children: n("Description.ReferralShare", {
                                amount: i
                            }, "Invite someone to Plus and you both get 100 Robux when they join.")
                        }), (0, I.jsx)(tW, {
                            size: "Small",
                            variant: "Standard",
                            onClick: function() {
                                aH(), sP(sN.SHARE_CARD_INVITE_CLICK), t()
                            },
                            children: n("Action.ReferralInvite", void 0, "Invite")
                        })]
                    })
                },
                fp = function(e) {
                    var t = e.title,
                        r = e.value;
                    return (0, I.jsxs)("div", {
                        className: "radius-medium bg-shift-200 padding-large gap-y-small min-width-0 grow-1 flex basis-0 flex-col",
                        children: [(0, I.jsx)("span", {
                            className: "text-title-medium content-default",
                            children: t
                        }), (0, I.jsx)("span", {
                            className: "text-heading-large content-emphasis",
                            children: r
                        })]
                    })
                },
                fy = function(e) {
                    var t = e.currentDiscountPercent,
                        r = e.savedRobux,
                        n = e.itemsBoughtWithDiscountCount,
                        i = e.privateServersCreatedCount,
                        o = e.robuxSentToFriendsCount,
                        a = (0, M.useTranslation)(),
                        l = a.translate,
                        u = a.intl;
                    return (0, I.jsxs)("div", {
                        className: "gap-y-large flex flex-col",
                        children: [(0, I.jsxs)("div", {
                            className: "gap-x-xsmall text-heading-small content-emphasis wrap flex items-center",
                            children: [(0, I.jsx)("span", {
                                children: l("Heading.SavingsYouveSaved")
                            }), (0, I.jsx)(tf, {
                                name: "icon-regular-robux",
                                size: "Medium"
                            }), (0, I.jsx)("span", {
                                children: void 0 === r ? "—" : u.n(r)
                            }), (0, I.jsx)("span", {
                                children: l("Heading.SavingsWithPlus")
                            })]
                        }), (0, I.jsxs)("div", {
                            className: "gap-y-small flex flex-col",
                            children: [(0, I.jsxs)("div", {
                                className: "gap-x-small flex",
                                children: [(0, I.jsx)(fp, {
                                    title: l("Label.Savings.InGameItems"),
                                    value: l("Label.Savings.PercentOff", {
                                        discountPercent: u.n(.01 * t, {
                                            style: "percent"
                                        })
                                    })
                                }), (0, I.jsx)(fp, {
                                    title: l("Label.Savings.ItemsBought"),
                                    value: void 0 === n ? "—" : u.n(n)
                                })]
                            }), (0, I.jsxs)("div", {
                                className: "gap-x-small flex",
                                children: [(0, I.jsx)(fp, {
                                    title: l("Label.Savings.PrivateServers"),
                                    value: void 0 === i ? "—" : u.n(i)
                                }), (0, I.jsx)(fp, {
                                    title: l("Label.Savings.RobuxSent"),
                                    value: (0, I.jsxs)("span", {
                                        className: "gap-x-xsmall flex items-center",
                                        children: [(0, I.jsx)(tf, {
                                            name: "icon-regular-robux",
                                            size: "Medium"
                                        }), void 0 === o ? "—" : u.n(o)]
                                    })
                                })]
                            }), (0, I.jsx)("span", {
                                className: "text-caption-medium content-muted",
                                children: l("Description.SavingsDataDelay")
                            })]
                        })]
                    })
                };

            function fm(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function fb(e) {
                if (Array.isArray(e)) return e
            }

            function fh() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function fg(e, t) {
                if (e) {
                    if ("string" == typeof e) return fm(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return fm(e, t)
                }
            }
            var fv = {
                    Neutral: "bg-shift-200",
                    Standard: "bg-shift-200",
                    Contrast: "bg-system-contrast",
                    Emphasis: "bg-system-emphasis",
                    Success: "bg-[rgb(from_var(--color-system-success)_r_g_b_/_0.2)]",
                    Warning: "bg-[rgb(from_var(--color-system-warning)_r_g_b_/_0.2)]",
                    Alert: "bg-[rgb(from_var(--color-system-alert)_r_g_b_/_0.2)]",
                    OverMedia: "bg-over-media-0"
                },
                fw = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-emphasis",
                    Warning: "content-emphasis",
                    Alert: "content-emphasis",
                    OverMedia: "content-emphasis"
                },
                fx = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-system-success",
                    Warning: "content-system-warning",
                    Alert: "content-system-alert",
                    OverMedia: "content-emphasis"
                },
                fj = {
                    Neutral: "stroke-none",
                    Standard: "stroke-none",
                    Contrast: "stroke-none",
                    Emphasis: "stroke-none",
                    Success: "stroke-none",
                    Warning: "stroke-none",
                    Alert: "stroke-none",
                    OverMedia: "stroke-none"
                },
                fO = {
                    Small: "height-600",
                    XSmall: "height-400"
                },
                fS = {
                    Small: "padding-x-small",
                    XSmall: "padding-x-xsmall"
                },
                fI = {
                    Small: "width-600",
                    XSmall: "width-400"
                },
                fM = {
                    Small: "text-label-small",
                    XSmall: "text-caption-small"
                },
                fN = {
                    Small: "padding-y-xsmall",
                    XSmall: "padding-y-none"
                },
                fP = {
                    Small: "XSmall",
                    XSmall: "XSmall"
                },
                fE = {
                    Pill: "radius-circle",
                    Box: "radius-small"
                },
                fT = to().forwardRef(function(e, t) {
                    var r, n, i, o = fb(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || fg(r) || fh(),
                        a = o[0],
                        l = o.slice(1),
                        u = a.className,
                        c = a.label,
                        s = a.variant,
                        d = void 0 === s ? "Standard" : s,
                        f = a.icon,
                        p = a.iconPosition,
                        y = void 0 === p ? "Leading" : p,
                        m = a.size,
                        b = void 0 === m ? "Small" : m,
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
                        v = (fb(l) || function(e) {
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
                        }(l) || fg(l, 1) || fh())[0],
                        w = f && !c,
                        x = "padding-x-xxsmall";
                    f && (x = "Leading" === y ? "padding-right-xxsmall" : "padding-left-xxsmall");
                    var j = f && to().createElement(tf, {
                        name: f,
                        size: fP[b],
                        className: fx[d]
                    });
                    return to().createElement("div", (n = function(e) {
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
                        className: ta("foundation-web-badge flex items-center select-none gap-[var(--size-150)]", fE[void 0 === h ? "Pill" : h], fO[b], w ? [fI[b], "justify-center"] : ["width-[fit-content]", fS[b]], fv[d], fw[d], fj[d], u)
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(i)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(i)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(i, e))
                    }), n), "Leading" === y && j, c && to().createElement("span", {
                        className: ta("text-no-wrap text-truncate-split", fM[b], fN[b], x, fw[d])
                    }, c), "Trailing" === y && j)
                });
            fT.displayName = "Badge";
            var fD = function(e) {
                    var t = e.activationTimestampMs,
                        r = e.expirationTimestampMs,
                        n = e.nextRenewalTimestampMs,
                        i = e.hasFreeTrial,
                        o = (0, M.useTranslation)(),
                        a = o.translate,
                        l = o.intl,
                        u = (0, ti.useMemo)(function() {
                            return l.getDateTimeFormatter()
                        }, [l]),
                        c = null === n || 0 === n;
                    return (0, I.jsxs)("div", {
                        className: "gap-x-small flex items-center",
                        children: [(0, I.jsx)("span", {
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
                        }), c ? (0, I.jsx)(fT, {
                            label: a("Label.Status.AutoRenewOff"),
                            variant: "Warning"
                        }) : i ? (0, I.jsx)(fT, {
                            label: a("Label.Status.Freetrial"),
                            variant: "Standard"
                        }) : (0, I.jsx)(fT, {
                            label: a("Label.Status.Active"),
                            variant: "Standard"
                        })]
                    })
                },
                fA = function(e) {
                    var t = e.featureConfig,
                        r = (0, M.useTranslation)().translate;
                    return (0, I.jsxs)("div", {
                        className: "gap-y-medium flex flex-col",
                        children: [(0, I.jsx)("span", {
                            className: "text-heading-medium",
                            children: r("Label.ExploreMoreBenefits")
                        }), (0, I.jsxs)("div", {
                            className: "foundation-web-list-item-container",
                            children: [t.isTradingEnabled && (0, I.jsx)(t1, {
                                description: r("Description.Benefit.TradeResellItemsSubtitle"),
                                divider: "None",
                                isContained: !0,
                                leading: (0, I.jsx)(tf, {
                                    name: "icon-regular-hand-two-arrows-horizontal",
                                    size: "Medium"
                                }),
                                size: "Medium",
                                title: r("Description.Benefit.TradeResellItems"),
                                trailing: (0, I.jsx)(tf, {
                                    name: "icon-regular-chevron-small-right"
                                }),
                                onSelect: function() {
                                    window.location.href = "https://help.roblox.com/hc/articles/203313310-Trading-System"
                                }
                            }), t.isUgcPublishingEnabled && (0, I.jsx)(t1, {
                                description: r("Description.Benefit.PublishItemsSubtitle"),
                                divider: "None",
                                isContained: !0,
                                leading: (0, I.jsx)(tf, {
                                    name: "icon-regular-arrow-up-from-landscape-rectangle",
                                    size: "Medium"
                                }),
                                size: "Medium",
                                title: r("Description.Benefit.PublishItems"),
                                trailing: (0, I.jsx)(tf, {
                                    name: "icon-regular-chevron-small-right"
                                }),
                                onSelect: function() {
                                    window.location.href = "https://help.roblox.com/hc/articles/203313180-Creating-and-Selling-Avatar-Items"
                                }
                            })]
                        })]
                    })
                };

            function fL(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var fC = function(e, t) {
                return (fC = Object.setPrototypeOf || fL({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function fR(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function r() {
                    this.constructor = e
                }
                fC(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
            }

            function fk(e, t, r, n) {
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
                        e.done ? i(e.value) : (fL(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, l)
                    }
                    u((n = n.apply(e, t || [])).next())
                })
            }

            function fU(e, t) {
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

            function fz(e) {
                var t;
                return null == (t = e) ? t : {
                    name: eB(t, "name") ? t.name : void 0,
                    displayName: eB(t, "displayName") ? t.displayName : void 0,
                    filter: eB(t, "filter") ? t.filter : void 0,
                    id: eB(t, "id") ? t.id : void 0,
                    type: eB(t, "type") ? t.type : void 0,
                    categoryType: eB(t, "categoryType") ? t.categoryType : void 0
                }
            }

            function f_(e) {
                var t;
                return null == (t = e) ? t : {
                    name: eB(t, "name") ? t.name : void 0,
                    displayName: eB(t, "displayName") ? t.displayName : void 0,
                    categoryType: eB(t, "categoryType") ? t.categoryType : void 0,
                    items: eB(t, "items") ? t.items.map(fz) : void 0
                }
            }
            "function" == typeof SuppressedError && SuppressedError;

            function fB(e, t) {
                return null == e ? e : {
                    categories: eB(e, "categories") ? e.categories.map(f_) : void 0
                }
            }

            function fY(e) {
                var t;
                return null == (t = e) ? t : {
                    userAssetId: eB(t, "userAssetId") ? t.userAssetId : void 0,
                    serialNumber: eB(t, "serialNumber") ? t.serialNumber : void 0,
                    assetId: eB(t, "assetId") ? t.assetId : void 0,
                    name: eB(t, "name") ? t.name : void 0,
                    recentAveragePrice: eB(t, "recentAveragePrice") ? t.recentAveragePrice : void 0,
                    originalPrice: eB(t, "originalPrice") ? t.originalPrice : void 0,
                    assetStock: eB(t, "assetStock") ? t.assetStock : void 0,
                    buildersClubMembershipType: eB(t, "buildersClubMembershipType") ? t.buildersClubMembershipType : void 0,
                    isOnHold: eB(t, "isOnHold") ? t.isOnHold : void 0
                }
            }

            function fF(e) {
                var t;
                return null == (t = e) ? t : {
                    id: eB(t, "id") ? t.id : void 0,
                    name: eB(t, "name") ? t.name : void 0,
                    type: eB(t, "type") ? t.type : void 0,
                    instanceId: eB(t, "instanceId") ? t.instanceId : void 0
                }
            }

            function fG(e) {
                var t, r;
                return null == (t = e) ? t : {
                    universeId: eB(t, "universeId") ? t.universeId : void 0,
                    placeId: eB(t, "placeId") ? t.placeId : void 0,
                    name: eB(t, "name") ? t.name : void 0,
                    creator: eB(t, "creator") ? null == (r = t.creator) ? r : {
                        id: eB(r, "id") ? r.id : void 0,
                        name: eB(r, "name") ? r.name : void 0,
                        type: eB(r, "type") ? r.type : void 0
                    } : void 0,
                    priceInRobux: eB(t, "priceInRobux") ? t.priceInRobux : void 0
                }
            }(function(e) {
                function t() {
                    return null !== e && e.apply(this, arguments) || this
                }
                fR(t, e), t.prototype.v1PackagesPackageIdAssetsGetRaw = function(e, t) {
                    return fk(this, void 0, void 0, function() {
                        var r, n;
                        return fU(this, function(i) {
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
                                    return [2, new eY(i.sent(), function(e) {
                                        return null == e ? e : {
                                            assetIds: eB(e, "assetIds") ? e.assetIds : void 0
                                        }
                                    })]
                            }
                        })
                    })
                }, t.prototype.v1PackagesPackageIdAssetsGet = function(e, t) {
                    return fk(this, void 0, void 0, function() {
                        return fU(this, function(r) {
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
            })(ek),
            function(e) {
                function t() {
                    return null !== e && e.apply(this, arguments) || this
                }
                fR(t, e), t.prototype.v1CollectionsItemsItemTypeItemTargetIdDeleteRaw = function(e, t) {
                    return fk(this, void 0, void 0, function() {
                        var r, n;
                        return fU(this, function(i) {
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
                                    return [2, new eY(i.sent())]
                            }
                        })
                    })
                }, t.prototype.v1CollectionsItemsItemTypeItemTargetIdDelete = function(e, t) {
                    return fk(this, void 0, void 0, function() {
                        return fU(this, function(r) {
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
                    return fk(this, void 0, void 0, function() {
                        var r, n;
                        return fU(this, function(i) {
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
                                    return [2, new eY(i.sent())]
                            }
                        })
                    })
                }, t.prototype.v1CollectionsItemsItemTypeItemTargetIdPost = function(e, t) {
                    return fk(this, void 0, void 0, function() {
                        return fU(this, function(r) {
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
            }(ek);
            var fW = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return fR(t, e), t.prototype.v1UsersUserIdAssetsCollectiblesGetRaw = function(e, t) {
                        return fk(this, void 0, void 0, function() {
                            var r, n;
                            return fU(this, function(i) {
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
                                        return [2, new eY(i.sent(), function(e) {
                                            return null == e ? e : {
                                                previousPageCursor: eB(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                                nextPageCursor: eB(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                                data: eB(e, "data") ? e.data.map(fY) : void 0
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdAssetsCollectiblesGet = function(e, t) {
                        return fk(this, void 0, void 0, function() {
                            return fU(this, function(r) {
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
                        return fk(this, void 0, void 0, function() {
                            var r, n;
                            return fU(this, function(i) {
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
                                        return [2, new eY(i.sent(), function(e) {
                                            return null == e ? e : {
                                                canView: eB(e, "canView") ? e.canView : void 0
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdCanViewInventoryGet = function(e, t) {
                        return fk(this, void 0, void 0, function() {
                            return fU(this, function(r) {
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
                        return fk(this, void 0, void 0, function() {
                            var r, n;
                            return fU(this, function(i) {
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
                                        return [2, new eY(i.sent(), function(e) {
                                            return fB(e)
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdCategoriesFavoritesGet = function(e, t) {
                        return fk(this, void 0, void 0, function() {
                            return fU(this, function(r) {
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
                        return fk(this, void 0, void 0, function() {
                            var r, n;
                            return fU(this, function(i) {
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
                                        return [2, new eY(i.sent(), function(e) {
                                            return fB(e)
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdCategoriesGet = function(e, t) {
                        return fk(this, void 0, void 0, function() {
                            return fU(this, function(r) {
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
                        return fk(this, void 0, void 0, function() {
                            var r, n;
                            return fU(this, function(i) {
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
                                        return [2, new eY(i.sent(), function(e) {
                                            return null == e ? e : {
                                                previousPageCursor: eB(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                                nextPageCursor: eB(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                                data: eB(e, "data") ? e.data.map(fF) : void 0
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdItemsItemTypeItemTargetIdGet = function(e, t) {
                        return fk(this, void 0, void 0, function() {
                            return fU(this, function(r) {
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
                        return fk(this, void 0, void 0, function() {
                            var r, n, i;
                            return fU(this, function(o) {
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
                                        return i = o.sent(), this.isJsonMime(i.headers.get("content-type")) ? [2, new eY(i)] : [2, new eF(i)]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet = function(e, t) {
                        return fk(this, void 0, void 0, function() {
                            return fU(this, function(r) {
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
                }(ek),
                fV = ek;

            function fQ() {
                return null !== fV && fV.apply(this, arguments) || this
            }
            fR(fQ, fV), fQ.prototype.v1UsersUserIdPlacesInventoryGetRaw = function(e, t) {
                return fk(this, void 0, void 0, function() {
                    var r, n;
                    return fU(this, function(i) {
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
                                return [2, new eY(i.sent(), function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: eB(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: eB(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: eB(e, "data") ? e.data.map(fG) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, fQ.prototype.v1UsersUserIdPlacesInventoryGet = function(e, t) {
                return fk(this, void 0, void 0, function() {
                    return fU(this, function(r) {
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
            var fq = sO(window.location.hostname),
                fK = new fW(new eG({
                    robloxSiteDomain: fq.rootDomain,
                    basePath: (w = fq.rootDomain, "https://".concat("inventory", ".").concat(w)),
                    credentials: "include"
                })),
                fH = function(e) {
                    if (e === dU.ItemType.Asset) return 0;
                    throw Error("Unsupported gift item type: ".concat(e))
                },
                fX = function() {
                    var e = !(arguments.length > 0) || void 0 === arguments[0] || arguments[0],
                        t = (0, rs.userId)();
                    return (0, T.useQuery)({
                        queryKey: ["owns-gift-item", t, dz.itemId, dz.itemType],
                        queryFn: function() {
                            if (null == t) throw Error("Cannot check gift item ownership without a user id");
                            return fK.v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet({
                                userId: t,
                                itemType: fH(dz.itemType),
                                itemTargetId: dz.itemId
                            })
                        },
                        enabled: e && null != t
                    })
                },
                fZ = function(e) {
                    var t, r, n = e.robloxSubscriptionProduct,
                        i = e.robloxSubscriptionMembership,
                        o = e.robloxPlusUserBenefits,
                        a = e.isFaeFreeTrial,
                        l = e.onOpenReferrals,
                        u = (0, M.useTranslation)().translate,
                        c = dH().eligibility,
                        s = null == o ? void 0 : o.robuxSavedWithPlus,
                        d = null == o ? void 0 : o.itemsBoughtWithPlusDiscount,
                        f = null == o ? void 0 : o.privateServersCreatedForFree,
                        p = null == o ? void 0 : o.robuxSentToFriends,
                        y = (0, ti.useMemo)(function() {
                            return i.activeOffers.some(function(e) {
                                return "FreeTrial" === e.offerType
                            })
                        }, [i.activeOffers]),
                        m = (0, ti.useMemo)(function() {
                            return fe(i.activationTimestampMs, i.periodType, i.nextRenewalTimestampMs, Date.now())
                        }, [i.activationTimestampMs, i.nextRenewalTimestampMs, i.periodType]),
                        b = (0, ti.useMemo)(function() {
                            var e, t, r, o, a, l, u, c, s, d, f;
                            return t = t9(n), r = null == (e = i.productTypeMembershipDetails.robloxSubscriptionMembershipDetails) ? void 0 : e.features.virtualTransactionDiscountTierId, d = t.virtualTransactionDiscounts, f = null != (o = null == (l = r ? null != (u = null != (c = null == d ? void 0 : d.find(function(e) {
                                return e.tierId === r
                            })) ? c : null == d ? void 0 : d.toSorted(function(e, t) {
                                return t.periodIndex - e.periodIndex
                            })[0]) ? u : null : null != (s = null == d ? void 0 : d.filter(function(e) {
                                return e.periodIndex <= m
                            }).toSorted(function(e, t) {
                                return t.periodIndex - e.periodIndex
                            })[0]) ? s : null) ? void 0 : l.periodIndex) ? o : m, {
                                current: l,
                                next: null != (a = null == d ? void 0 : d.filter(function(e) {
                                    return e.periodIndex > f
                                }).toSorted(function(e, t) {
                                    return e.periodIndex - t.periodIndex
                                })[0]) ? a : null
                            }
                        }, [n, i.productTypeMembershipDetails, m]),
                        h = null != (t = null == (r = b.current) ? void 0 : r.discountPercent) ? t : 0,
                        g = fX(!1).data;
                    return (0, I.jsx)("div", {
                        className: "flex flex-col items-center",
                        children: (0, I.jsxs)("div", {
                            className: "margin-top-[48px] padding-x-xlarge content-emphasis gap-y-xxlarge width-full large:max-width-[730px] flex flex-col",
                            children: [!1, a && (0, I.jsx)(dX, {
                                body: u("Subtext.FreeTrialBanner", {
                                    date: new Date(i.expirationTimestampMs).toLocaleDateString(void 0, {
                                        day: "2-digit",
                                        month: "short",
                                        year: "numeric"
                                    })
                                }),
                                title: u("Header.FreeTrialBannerTitle")
                            }), (0, I.jsxs)("div", {
                                className: "gap-y-small large:items-center flex flex-col",
                                children: [(0, I.jsx)(di, {}), (0, I.jsx)(fD, {
                                    activationTimestampMs: i.activationTimestampMs,
                                    expirationTimestampMs: i.expirationTimestampMs,
                                    hasFreeTrial: y,
                                    nextRenewalTimestampMs: i.nextRenewalTimestampMs
                                }), (0, I.jsx)(ft, {
                                    activationTimestampMs: i.activationTimestampMs,
                                    currentDiscountPercent: h,
                                    isCancelled: null === i.nextRenewalTimestampMs || 0 === i.nextRenewalTimestampMs,
                                    nextDiscount: b.next,
                                    periodType: i.periodType
                                })]
                            }), (0, I.jsxs)("div", {
                                className: "flex flex-col gap-y-[32px]",
                                children: [te() && "Eligible" === c ? (0, I.jsx)(fc, {
                                    children: (0, I.jsx)(ff, {
                                        onOpenDashboard: l
                                    })
                                }) : null, (0, I.jsx)(fy, {
                                    currentDiscountPercent: h,
                                    itemsBoughtWithDiscountCount: d,
                                    privateServersCreatedCount: f,
                                    robuxSentToFriendsCount: p,
                                    savedRobux: s
                                }), (0, I.jsx)(fA, {
                                    featureConfig: t9(n)
                                }), (0, I.jsx)(t6, {
                                    children: (0, I.jsx)("div", {
                                        className: "gap-y-medium flex flex-col",
                                        children: (0, I.jsx)(fd, {
                                            robloxSubscriptionProduct: n
                                        })
                                    })
                                })]
                            })]
                        })
                    })
                };

            function f$(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var fJ = function(e) {
                    var t, r, n, i = e.deviceMeta,
                        o = e.robloxSubscriptionProduct,
                        a = e.onDismiss,
                        l = (0, M.useTranslation)().translate,
                        u = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, ti.useState)(null)) || function(e) {
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
                                if ("string" == typeof e) return f$(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return f$(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        c = u[0],
                        s = u[1];
                    (0, ti.useEffect)(function() {
                        window.scrollTo({
                            top: 0,
                            behavior: "smooth"
                        })
                    }, []);
                    var d = !i.isInApp && (0, I.jsxs)("div", {
                        "aria-label": l("Action.OK"),
                        className: "bottom-dock padding-t-medium bg-surface-100 large:hidden width-full gap-y-medium flex flex-col",
                        "data-testid": "welcome-dismiss-dock",
                        role: "region",
                        children: [(0, I.jsx)(t7, {}), (0, I.jsx)("div", {
                            className: "width-full gap-y-medium padding-bottom-[env(safe-area-inset-bottom\\,0px)] padding-x-xxlarge flex flex-col items-stretch",
                            children: (0, I.jsx)(tW, {
                                className: "min-width-0 width-full margin-bottom-[24px] large:margin-bottom-none",
                                size: "Large",
                                variant: "Emphasis",
                                onClick: a,
                                children: l("Action.OK")
                            })
                        })]
                    });
                    return (0, I.jsxs)(ti.Fragment, {
                        children: [(0, I.jsx)(t8, {}), (0, I.jsx)("div", {
                            className: "width-full min-width-0 large:items-center flex flex-col items-start",
                            children: (0, I.jsxs)("div", {
                                className: "margin-top-[48px] width-full min-width-0 content-emphasis large:max-width-[730px] large:gap-y-[60px] large:self-auto large:padding-x-xlarge flex flex-col gap-y-[var(--size-1200)] self-stretch",
                                children: [(0, I.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge text-align-x-start large:gap-y-[24px] large:items-center large:padding-x-none large:text-align-x-center flex flex-col items-start",
                                    children: [(0, I.jsxs)("div", {
                                        className: "gap-y-xsmall large:items-center flex flex-col items-start",
                                        children: [(0, I.jsx)(tf, {
                                            className: "!size-1800 margin-bottom-medium",
                                            name: "icon-regular-roblox-plus"
                                        }), (0, I.jsx)("h1", {
                                            className: "text-heading-large",
                                            children: l("Title.Welcome", {
                                                productShort: l("Label.BlackbirdShort")
                                            })
                                        }), (0, I.jsx)("p", {
                                            className: "text-body-large content-default",
                                            children: l("Description.Welcome", {
                                                product: l("Label.Blackbird")
                                            })
                                        })]
                                    }), !i.isInApp && (0, I.jsx)("div", {
                                        className: "width-full gap-y-medium padding-t-none large:margin-x-auto large:margin-top-[12px] large:flex large:max-width-[min(440px,100%)] large:width-full large:flex-col large:items-center hidden items-start",
                                        "data-testid": "welcome-dismiss-inline",
                                        children: (0, I.jsx)("div", {
                                            className: "width-full gap-x-small flex shrink-0 flex-row items-start justify-center",
                                            children: (0, I.jsx)(tW, {
                                                className: "width-full large:width-[230px] shrink-0",
                                                size: "Medium",
                                                variant: "Emphasis",
                                                onClick: a,
                                                children: l("Action.OK")
                                            })
                                        })
                                    })]
                                }), (0, I.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge large:padding-x-none flex flex-col",
                                    children: [(0, I.jsx)("span", {
                                        className: "text-heading-small",
                                        children: l("Title.BenefitsUnlocked")
                                    }), (0, I.jsx)(t5, {
                                        featureConfig: t9(o),
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
                        }), d, (0, I.jsx)(dO, {
                            body: null != (r = null == c ? void 0 : c.secondary) ? r : "",
                            open: null != c,
                            title: null != (n = null == c ? void 0 : c.primary) ? n : "",
                            onOpenChange: function(e) {
                                e || s(null)
                            }
                        })]
                    })
                },
                f0 = sO(window.location.hostname),
                f1 = new eC({
                    robloxSiteDomain: f0.rootDomain,
                    basePath: sx(f0.rootDomain, "roblox-subscriptions"),
                    credentials: "include"
                });
            new d3(f1);
            var f2 = new d4(f1);
            new d5(f1);
            var f4 = function(e, t) {
                var r = (0, ti.useRef)();
                return t(e) && (r.current = e), r.current
            };

            function f3(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function f5(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function f6(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var o = e.apply(t, r);

                        function a(e) {
                            f5(o, n, i, a, l, "next", e)
                        }

                        function l(e) {
                            f5(o, n, i, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function f8(e, t) {
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
                        if ("string" == typeof e) return f3(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return f3(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function f7(e, t) {
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
            var f9 = function() {
                    var e, t, r = (0, ti.useMemo)(function() {
                            return (0, e7.getDeviceMeta)()
                        }, []),
                        n = f8((0, ti.useState)(function() {
                            return new URLSearchParams(window.location.search).has("welcome")
                        }), 2),
                        i = n[0],
                        o = n[1],
                        a = f8((0, ti.useState)(function() {
                            return new URLSearchParams(window.location.search).has("faeFreeTrialConfirmation")
                        }), 2),
                        l = a[0],
                        u = a[1],
                        c = f8((0, ti.useState)(function() {
                            return te() && new URLSearchParams(window.location.search).has(tr)
                        }), 2),
                        s = c[0],
                        d = c[1],
                        f = (0, ti.useRef)(!1),
                        p = f8((0, ti.useState)(i || l), 2),
                        y = p[0],
                        m = p[1],
                        b = (0, T.useQuery)({
                            queryKey: ["get-roblox-subscription-membership"],
                            queryFn: function() {
                                return f6(function() {
                                    var e;
                                    return f7(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, sI.subscriptionsV2ListSubscriptions({
                                                    productType: eJ,
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
                            refetchInterval: !!y && 3e3
                        }),
                        h = f4(b.data, function() {
                            return void 0 !== b.data
                        }),
                        g = null == h ? void 0 : h.productKey.id,
                        v = (0, T.useQuery)({
                            queryKey: ["check-fae-free-trial", g],
                            queryFn: function() {
                                return f6(function() {
                                    var e, t;
                                    return f7(this, function(r) {
                                        switch (r.label) {
                                            case 0:
                                                if (!g) return [2, !1];
                                                return [4, sI.subscriptionsV2ListAvailableSubscriptionProducts({
                                                    productType: eJ,
                                                    includePurchased: !0,
                                                    grantType: "FaeFreeTrial"
                                                })];
                                            case 1:
                                                if (void 0 === (t = null == (e = r.sent().products.find(function(e) {
                                                        return "Week" === e.periodType
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
                        w = (0, T.useQuery)({
                            queryKey: ["list-roblox-subscription-available-products"],
                            queryFn: function() {
                                return f6(function() {
                                    var e;
                                    return f7(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, sI.subscriptionsV2ListAvailableSubscriptionProducts({
                                                    productType: eJ,
                                                    includePurchased: !0,
                                                    includeBundles: !0,
                                                    skipEligibilityCheck: !0
                                                })];
                                            case 1:
                                                if (0 === (e = t.sent().products).length) return [2, null];
                                                return [2, e.toSorted(function(e, t) {
                                                    return re(e) - re(t)
                                                })]
                                        }
                                    })
                                })()
                            },
                            enabled: null === b.data,
                            retry: 3,
                            retryDelay: 100
                        }),
                        x = f4(w.data, function() {
                            return void 0 !== w.data
                        }),
                        j = f4(null != (e = null == (t = b.data) ? void 0 : t.productInfo) ? e : null == x ? void 0 : x[0], function() {
                            var e;
                            return (null == (e = b.data) ? void 0 : e.productInfo) !== void 0 || void 0 !== x
                        }),
                        O = (0, T.useQuery)({
                            queryKey: ["get-roblox-plus-user-benefits"],
                            queryFn: function() {
                                return f2.robloxPlusGetRobloxPlusUserBenefits()
                            },
                            enabled: !!h,
                            retry: 3
                        }),
                        S = (0, T.useQuery)({
                            queryKey: ["guac/app-policy/disable-blackbird-entrypoints"],
                            queryFn: function() {
                                return f6(function() {
                                    return f7(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return e.trys.push([0, 2, , 3]), [4, (0, e8.callBehaviour)("app-policy")];
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
                        M = f4(S.data, function() {
                            return void 0 !== S.data
                        }),
                        N = (0, ti.useCallback)(function() {
                            var e = new URL(window.location.href);
                            e.searchParams.set("welcome", ""), window.history.replaceState(null, "", e.toString()), o(!0)
                        }, []),
                        P = (0, ti.useCallback)(function() {
                            var e = function() {
                                try {
                                    var e = sessionStorage.getItem(tn);
                                    if (!e) return null;
                                    sessionStorage.removeItem(tn);
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
                        E = (0, ti.useCallback)(function() {
                            var e = new URL(window.location.href);
                            e.searchParams.delete("faeFreeTrialConfirmation"), window.history.replaceState(null, "", e.toString()), u(!1)
                        }, []),
                        D = (0, ti.useCallback)(function() {
                            var e = new URL(window.location.href);
                            e.searchParams.set(tr, ""), window.history.replaceState(null, "", e.toString()), f.current = !0, d(!0)
                        }, []),
                        A = (0, ti.useCallback)(function() {
                            if (!f.current) {
                                window.location.href = (0, e6.getAbsoluteUrl)("/home");
                                return
                            }
                            var e = new URL(window.location.href);
                            e.searchParams.delete(tr), window.history.replaceState(null, "", e.toString()), d(!1)
                        }, []);
                    (0, ti.useEffect)(function() {
                        if (y) {
                            var e = setTimeout(function() {
                                m(!1)
                            }, 6e4);
                            return function() {
                                clearTimeout(e)
                            }
                        }
                    }, [y]), (0, ti.useEffect)(function() {
                        y && b.data && (m(!1), l || N())
                    }, [N, l, y, b.data]);
                    var L = (0, ti.useCallback)(function() {
                        m(!0)
                    }, []);
                    if (w.error || null === w.data || b.error && !y || S.error || !r) return (0, I.jsx)(tV, {});
                    if (void 0 === j || void 0 === h || void 0 === M) return (0, I.jsx)(rc, {});
                    var C = null !== h;
                    if (l) return C ? v.isLoading ? (0, I.jsx)(rc, {}) : v.data ? (0, I.jsx)(rr, {
                        robloxSubscriptionProduct: j,
                        onDismiss: E
                    }) : (0, I.jsx)(tV, {}) : y ? (0, I.jsx)(rc, {}) : (0, I.jsx)(tV, {});
                    if (i)
                        if (C) return (0, I.jsx)(fJ, {
                            deviceMeta: r,
                            robloxSubscriptionMembership: h,
                            robloxSubscriptionProduct: j,
                            onDismiss: P
                        });
                        else if (y) return (0, I.jsx)(rc, {});
                    else return (0, I.jsx)(tV, {});
                    return s ? (0, I.jsx)(sY, {
                        robloxPlusUserBenefits: O.data,
                        subscribeButtonProps: {
                            productId: j.productKey.id,
                            productType: j.productKey.type,
                            deviceMeta: r,
                            isDisabled: M
                        },
                        onClose: A
                    }) : C ? (0, I.jsx)(fZ, {
                        isFaeFreeTrial: !0 === v.data,
                        robloxPlusUserBenefits: O.data,
                        robloxSubscriptionMembership: h,
                        robloxSubscriptionProduct: j,
                        onOpenReferrals: D
                    }) : x ? (0, I.jsx)(dQ, {
                        deviceMeta: r,
                        isEntrypointDisabled: M,
                        robloxSubscriptionProducts: x,
                        onMobilePurchaseInitiated: L
                    }) : (0, I.jsx)(rc, {})
                },
                pe = function(e) {
                    var t = e.children;
                    return (0, I.jsx)("div", {
                        className: "clip-x margin-bottom-[160px] min-height-[400px] padding-top-[16px] large:margin-bottom-[120px] relative",
                        children: t
                    })
                },
                pt = function() {
                    return (0, I.jsx)(T.QueryClientProvider, {
                        client: M.queryClient,
                        children: (0, I.jsx)(pe, {
                            children: (0, I.jsx)(f9, {})
                        })
                    })
                };
            P()(function() {
                (0, M.renderWithErrorBoundary)((0, I.jsx)(M.TranslationProvider, {
                    config: E.P,
                    children: (0, I.jsx)(pt, {})
                }), document.getElementById("roblox-subscription-container"), void 0, (0, I.jsx)(pe, {
                    children: (0, I.jsx)(tV, {})
                }))
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("RobloxSubscription");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/robloxSubscription-37d37f89cb885721.js.map