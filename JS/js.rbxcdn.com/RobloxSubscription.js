! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "6ccc07fd02c1f10281f931f3e39d5988237759bb"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "43c6ba14-cdb2-4bf9-901b-c59ea10af6b4", e._sentryDebugIdIdentifier = "sentry-dbid-43c6ba14-cdb2-4bf9-901b-c59ea10af6b4")
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
                    m = Math.max,
                    y = Math.min,
                    b = function() {
                        return f.Date.now()
                    };

                function g(e) {
                    var t = void 0 === e ? "undefined" : n(e);
                    return !!e && ("object" == t || "function" == t)
                }

                function h(e) {
                    if ("number" == typeof e) return e;
                    if ((void 0 === (t = e) ? "undefined" : n(t)) == "symbol" || t && (void 0 === t ? "undefined" : n(t)) == "object" && "[object Symbol]" == p.call(t)) return i;
                    if (g(e)) {
                        var t, r = "function" == typeof e.valueOf ? e.valueOf() : e;
                        e = g(r) ? r + "" : r
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
                    return t = h(t) || 0, g(r) && (s = !!r.leading, o = (d = "maxWait" in r) ? m(h(r.maxWait) || 0, t) : o, f = "trailing" in r ? !!r.trailing : f), j.cancel = function() {
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

                function g() {}
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
                var h = o.exports.browser,
                    v = o.exports.binding,
                    w = {},
                    x = "browser",
                    j = "browser",
                    O = "browser",
                    S = [],
                    I = {
                        nextTick: o.exports.nextTick,
                        title: o.exports.title,
                        browser: h,
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
                        emitWarning: g,
                        prependListener: o.exports.prependListener,
                        prependOnceListener: o.exports.prependOnceListener,
                        listeners: o.exports.listeners,
                        binding: v,
                        cwd: o.exports.cwd,
                        chdir: o.exports.chdir,
                        umask: o.exports.umask,
                        exit: g,
                        pid: 1,
                        features: w,
                        kill: g,
                        dlopen: g,
                        uptime: g,
                        memoryUsage: g,
                        uvCounters: g,
                        platform: x,
                        arch: j,
                        execPath: O,
                        execArgv: S
                    };
                t.addListener = o.exports.addListener, t.arch = j, t.argv = o.exports.argv, t.binding = v, t.browser = h, t.chdir = o.exports.chdir, t.cwd = o.exports.cwd, t.default = I, t.dlopen = g, t.emit = o.exports.emit, t.emitWarning = g, t.env = o.exports.env, t.execArgv = S, t.execPath = O, t.exit = g, t.features = w, t.kill = g, t.listeners = o.exports.listeners, t.memoryUsage = g, t.nextTick = o.exports.nextTick, t.off = o.exports.off, t.on = o.exports.on, t.once = o.exports.once, t.pid = 1, t.platform = x, t.prependListener = o.exports.prependListener, t.prependOnceListener = o.exports.prependOnceListener, t.removeAllListeners = o.exports.removeAllListeners, t.removeListener = o.exports.removeListener, t.title = o.exports.title, t.umask = o.exports.umask, t.uptime = g, t.uvCounters = g, t.version = o.exports.version, t.versions = o.exports.versions, e.exports = I
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
            var e, t, n, i, o, a, l, u, c, s, d, f, p, m, y, b, g, h, v, w, x, j, O = window.ReactJSX,
                S = window.Roblox["core-scripts"].react,
                I = window.Roblox["core-scripts"].util.ready,
                M = r.n(I),
                N = JSON.parse('{"P":["Feature.RobloxSubscription"]}'),
                P = window.TanstackQuery;

            function E(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var T = function(e, t) {
                return (T = Object.setPrototypeOf || E({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function D(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function r() {
                    this.constructor = e
                }
                T(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
            }
            var A = function() {
                return (A = Object.assign || function(e) {
                    for (var t, r = 1, n = arguments.length; r < n; r++)
                        for (var i in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                    return e
                }).apply(this, arguments)
            };

            function L(e, t, r, n) {
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
                        e.done ? i(e.value) : (E(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, l)
                    }
                    u((n = n.apply(e, t || [])).next())
                })
            }

            function C(e, t) {
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

            function R(e, t, r) {
                if (r || 2 == arguments.length)
                    for (var n, i = 0, o = t.length; i < o; i++) !n && i in t || (n || (n = Array.prototype.slice.call(t, 0, i)), n[i] = t[i]);
                return e.concat(n || Array.prototype.slice.call(t))
            }
            "function" == typeof SuppressedError && SuppressedError;
            var k = {
                    envName: ""
                },
                U = !1,
                z = function() {
                    try {
                        if ("u" < typeof window) return A({}, k);
                        var e = localStorage.getItem("Roblox.MrRouterConfig");
                        if (null == e) return A({}, k);
                        var t = JSON.parse(e);
                        if ("object" != (void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) || null === t) return A({}, k);
                        var r = A(A({}, k), "envName" in t && "string" == typeof t.envName && {
                            envName: t.envName
                        });
                        return r.envName && !U && (U = !0, console.warn('[MrRouter] Routing to non-production environment: "'.concat(r.envName, '"'))), r
                    } catch (e) {
                        return A({}, k)
                    }
                },
                _ = "mrrouter-env",
                B = "tracestate",
                Y = "traceparent",
                F = function(e) {
                    var t = e.indexOf("=");
                    return (-1 === t ? e : e.slice(0, t)).trim()
                },
                G = function(e, t) {
                    var r = "".concat(_, "=").concat(encodeURIComponent(t)),
                        n = null == e ? void 0 : e.trim(),
                        i = n ? n.split(",") : [],
                        o = i.findIndex(function(e) {
                            return F(e) === _
                        });
                    if (-1 === o) return R(R([], i.map(function(e) {
                        return e.trim()
                    }), !0), [r], !1).join(",");
                    var a = i.filter(function(e) {
                        return F(e) !== _
                    }).map(function(e) {
                        return e.trim()
                    });
                    return a.splice(o, 0, r), a.join(",")
                },
                W = function(e) {
                    var t = new Uint8Array(e);
                    return crypto.getRandomValues(t), Array.from(t, function(e) {
                        return e.toString(16).padStart(2, "0")
                    }).join("")
                },
                Q = "u" > typeof crypto && "function" == typeof crypto.randomUUID,
                V = function() {
                    return Q ? crypto.randomUUID().replaceAll("-", "").slice(0, 32) : W(16)
                },
                q = function() {
                    return Q ? crypto.randomUUID().replaceAll("-", "").slice(0, 16) : W(8)
                },
                K = function(e) {
                    var t = z().envName;
                    if (t.length > 0 && (e[B] = G(e[B], t), !e[Y])) {
                        var r = V(),
                            n = q();
                        e[Y] = "00-".concat(r, "-").concat(n, "-01")
                    }
                };

            function H(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            r(773);
            var X, Z = function(e) {
                    return e.replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/\d+/, "/number")
                },
                $ = function(e, t) {
                    return !1 === t.ok && !1 === [401, 403, 404].includes(t.status) && e(Error("Network error"), {
                        tags: {
                            apiUrl: Z(t.url),
                            apiStatus: null == t ? void 0 : t.status,
                            cors: !1
                        }
                    }), t
                },
                J = function(e, t) {
                    e(Error("Network error"), {
                        tags: {
                            apiUrl: Z(t),
                            cors: !0
                        }
                    })
                },
                ee = function() {
                    function e(e) {
                        this.captureException = e
                    }
                    return e.prototype.post = function(e) {
                        return L(this, void 0, void 0, function() {
                            return C(this, function(t) {
                                return [2, $(this.captureException, e.response)]
                            })
                        })
                    }, e.prototype.onError = function(e) {
                        return L(this, void 0, void 0, function() {
                            return C(this, function(t) {
                                return J(this.captureException, e.url), [2]
                            })
                        })
                    }, e
                }(),
                et = function(e) {
                    if (document) {
                        var t, r, n = document.getElementById("hba-frame");
                        return null === n && ((t = document.createElement("iframe")).id = "hba-frame", t.style.cssText = "position: fixed; top: 0; left: 0; width: 0%; height: 0%; z-index: -1", t.src = "https://www.".concat(e, "/hba/iframe"), r = t, n = (null == document ? void 0 : document.body) ? document.body.appendChild(r) : null), n
                    }
                    return null
                },
                er = function() {
                    var e = window.location.hostname.split(".").slice(0, -2).join(".");
                    return e.includes("create") ? "creator_hub" : e.includes("advertise") ? "ads_manager" : "creator_hub"
                },
                en = function(e, t) {
                    try {
                        fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                            method: "POST",
                            body: JSON.stringify({
                                name: "load_time_hba_frame",
                                value: t,
                                labelValues: {
                                    origin_site: er()
                                }
                            })
                        })
                    } catch (e) {}
                },
                ei = function(e, t) {
                    try {
                        fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                            method: "POST",
                            body: JSON.stringify({
                                name: "response_time_hba_frame",
                                value: t,
                                labelValues: {
                                    origin_site: er()
                                }
                            })
                        })
                    } catch (e) {}
                },
                eo = function(e, t, r) {
                    return void 0 === r && (r = 1500), new Promise(function(n, i) {
                        var o, a, l = performance.now(),
                            u = window.setTimeout(function() {
                                en(e, performance.now() - l),
                                    function(e) {
                                        try {
                                            fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                                method: "POST",
                                                body: JSON.stringify({
                                                    name: "event_hba_frame",
                                                    value: 1,
                                                    labelValues: {
                                                        event_type: "FrameLoadTimedOut",
                                                        origin_site: er()
                                                    }
                                                })
                                            })
                                        } catch (e) {}
                                    }(e), i(Error("Promise timed out after ".concat(r, " ms")))
                            }, r),
                            c = o = function(t) {
                                var r = t.data;
                                t.origin === "https://www.".concat(e) && "dataFromHbaFrame" === r.msg && "loaded" === r.data.type && (window.removeEventListener("message", o, !1), window.clearTimeout(u), en(e, performance.now() - l), n())
                            };
                        window.addEventListener("message", c, !1), null == (a = t.contentWindow) || a.postMessage({
                            msg: "checkLoadedRequest"
                        }, "https://www.".concat(e))
                    })
                },
                ea = function(e, t, r, n, i, o, a) {
                    var l;
                    if (void 0 === a && (a = 100), window) {
                        var u, c = performance.now(),
                            s = window.setTimeout(function() {
                                ei(r, performance.now() - c),
                                    function(e) {
                                        try {
                                            fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                                method: "POST",
                                                body: JSON.stringify({
                                                    name: "event_hba_frame",
                                                    value: 1,
                                                    labelValues: {
                                                        event_type: "FrameResponseTimedOut",
                                                        origin_site: er()
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
                                        window.clearTimeout(s), window.removeEventListener("message", u, !1), ei(r, performance.now() - c);
                                        var d = n.data.batHeader;
                                        e({
                                            url: a,
                                            init: A(A({}, l), {
                                                headers: A(A({}, l.headers), {
                                                    "x-bound-auth-token": d["x-bound-auth-token"]
                                                })
                                            })
                                        })
                                    } else window.clearTimeout(s), window.removeEventListener("message", u, !1), ei(r, performance.now() - c), e({
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
                el = function() {
                    return crypto.randomUUID()
                },
                eu = function() {
                    function e(e, t, r) {
                        void 0 === t && (t = 1500), void 0 === r && (r = 100), this.robloxSiteDomain = e, this.hbaFrameAlreadyLoaded = !1, this.hbaFrameLoadFailed = !1, this.hbaFrame = null, this.loadTimeOut = t, this.dataTimeOut = r
                    }
                    return e.prototype.getOrCreateHbaFrame = function() {
                        return et(this.robloxSiteDomain)
                    }, e.prototype.pre = function(e) {
                        var t = this;
                        return new Promise(function(r, n) {
                            var i = e.url,
                                o = e.init;
                            if (t.hbaFrame = t.getOrCreateHbaFrame(), null !== t.hbaFrame) {
                                var a = el();
                                t.hbaFrameAlreadyLoaded ? ea(r, 0, t.robloxSiteDomain, t.hbaFrame, e, a, t.dataTimeOut) : t.hbaFrameLoadFailed ? r({
                                    url: i,
                                    init: o
                                }) : eo(t.robloxSiteDomain, t.hbaFrame, t.loadTimeOut).then(function() {
                                    t.hbaFrame ? (t.hbaFrameAlreadyLoaded = !0, ea(r, 0, t.robloxSiteDomain, t.hbaFrame, e, a, t.dataTimeOut)) : r({
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
            var ec = function(e) {
                    function t(t) {
                        var r = e.call(this, "challenge error for challenge kind ".concat(t.kind)) || this;
                        return r.parameters = t, r
                    }
                    return D(t, e), t.prototype.match = function(e) {
                        return this.parameters.kind === e.parameters.kind && JSON.stringify(this.parameters.data) === JSON.stringify(e.parameters.data)
                    }, t.prototype.matchAbandoned = function(e) {
                        return this.match(e) && e.parameters.kind === X.ABANDONED
                    }, t
                }(Error),
                es = "rblx-challenge-id",
                ed = "rblx-challenge-type",
                ef = "rblx-challenge-metadata",
                ep = function(e, t) {
                    return 403 === e.status && e.headers.has(es) && e.headers.has(ed) && e.headers.has(ef) && "iframe" === t
                },
                em = function(e) {
                    var t, r, n, i, o, a, l, u, c, s = e.url,
                        d = e.request,
                        f = e.response,
                        p = e.robloxSiteDomain,
                        m = (o = new URLSearchParams([
                            ["challenge-type", "generic"],
                            ["dark-mode", "true"],
                            ["barista-mode", "true"],
                            ["generic-challenge-type", null != (t = f.headers.get(ed)) ? t : ""],
                            ["generic-challenge-id", null != (r = f.headers.get(es)) ? r : ""],
                            ["challenge-metadata-json", null != (n = f.headers.get(ef)) ? n : ""],
                            ["origin", null != (i = window.location.hostname.split(".").slice(0, -2).join(".")) ? i : ""]
                        ]), a = new URL("https://www.".concat(p, "/challenge/cdn/hybrid?").concat(o.toString())), (l = document.createElement("iframe")).id = "challenge-frame", l.allowFullscreen = !0, l.setAttribute("allowtransparency", "true"), l.setAttribute("allow", "publickey-credentials-get;publickey-credentials-create"), l.style.cssText = "position: fixed; top: 0; left: 0; width: 100%; height: 100%; visibility: hidden; color-scheme: normal; border: none; z-index: 2147483647;", l.src = a.toString(), l.onload = function() {
                            l.style.visibility = "visible"
                        }, u = l, document && document.body ? document.body.appendChild(u) : null);
                    return new Promise(function(e, t) {
                        window && m && (c = function(r) {
                            var n, i, o, a, l, u, c, p, m, y, b;
                            if (r.data && r.data.genericChallengeResponse) switch (r.data.genericChallengeResponse.type) {
                                case "challengeAbandoned":
                                    t(new ec({
                                        kind: X.ABANDONED,
                                        data: {
                                            challengeType: null != (n = f.headers.get(ed)) ? n : ""
                                        }
                                    }));
                                    break;
                                case "challengeDisplayed":
                                    break;
                                case "challengeCompleted":
                                    (c = r.data.genericChallengeResponse.data).challengeType && c.metadata ? e((p = c.metadata, fetch(s, A(A({}, d), {
                                        headers: A(A({}, d.headers), ((m = {})[es] = null != (y = f.headers.get(es)) ? y : "", m[ef] = btoa(JSON.stringify(p)), m[ed] = null != (b = f.headers.get(ed)) ? b : "", m))
                                    })))) : t(new ec({
                                        kind: X.UNKNOWN,
                                        data: {
                                            challengeType: null != (i = f.headers.get(ed)) ? i : ""
                                        }
                                    }));
                                    break;
                                case "challengeInvalidated":
                                    t((c = r.data.genericChallengeResponse.data) && c.challengeType && c.metadata ? new ec({
                                        kind: X.INVALIDATED,
                                        data: c
                                    }) : new ec({
                                        kind: X.INVALIDATED,
                                        data: {
                                            challengeType: null != (o = f.headers.get(ed)) ? o : ""
                                        }
                                    }));
                                    break;
                                case "challengeParsed":
                                    !1 === (c = r.data.genericChallengeResponse.data).parsed && t(new ec({
                                        kind: X.UNKNOWN,
                                        data: {
                                            challengeType: null != (a = f.headers.get(ed)) ? a : ""
                                        }
                                    }));
                                    break;
                                case "challengeInitialized":
                                    !1 === (c = r.data.genericChallengeResponse.data).initialized && t(new ec({
                                        kind: X.UNKNOWN,
                                        data: {
                                            challengeType: null != (l = f.headers.get(ed)) ? l : ""
                                        }
                                    }));
                                    break;
                                case "challengePageLoaded":
                                    !1 === (c = r.data.genericChallengeResponse.data).pageLoaded && t(new ec({
                                        kind: X.LOADFAILED,
                                        data: {
                                            challengeType: null != (u = f.headers.get(ed)) ? u : ""
                                        }
                                    }))
                            }
                        }, window.addEventListener("message", c, !1))
                    }).finally(function() {
                        null == m || m.remove(), c && window.removeEventListener("message", c, !1)
                    })
                },
                ey = function() {
                    function e(e, t) {
                        void 0 === t && (t = "iframe"), this.robloxSiteDomain = e, this.genericChallengeMiddlewareType = t
                    }
                    return e.prototype.post = function(e) {
                        var t = e.url,
                            r = e.init,
                            n = e.response;
                        return ep(n, this.genericChallengeMiddlewareType) ? em({
                            url: t,
                            request: r,
                            response: n,
                            robloxSiteDomain: this.robloxSiteDomain
                        }) : Promise.resolve(n)
                    }, e
                }(),
                eb = function(e) {
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
                eg = function() {
                    function e(e) {
                        this.unifiedLogger = e
                    }
                    return e.prototype.post = function(e) {
                        return this.unifiedLogger.logApiVitalsEvent(eb({
                            elapsedTime: e.elapsedTime,
                            url: e.url,
                            status: e.response.status,
                            schemaPath: e.schemaPath
                        })), Promise.resolve(e.response)
                    }, e
                }(),
                eh = "x-csrf-token",
                ev = ["POST", "PATCH", "DELETE", "PUT"],
                ew = function() {
                    var e, t = "";
                    try {
                        "u" > typeof window && (t = null != (e = localStorage.getItem(eh)) ? e : "")
                    } catch (e) {
                        console.warn("Error reading localStorage key “".concat(eh, "”:"), e)
                    }
                    return t
                },
                ex = ew(),
                ej = function(e) {
                    try {
                        ex = e, "u" > typeof window && localStorage.setItem(eh, e)
                    } catch (e) {
                        console.warn("Error setting localStorage key “".concat(eh, "”:"), e)
                    }
                },
                eO = function() {
                    function e() {
                        this.currentToken = ew()
                    }
                    return e.prototype.pre = function(e) {
                        var t, r = e.url,
                            n = e.init,
                            i = this.currentToken;
                        return n.headers && "object" == ((t = n.headers) && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) && eh in n.headers && (i = n.headers[eh]) && (this.currentToken = i, ej(i)), n.method && ev.includes(n.method) ? Promise.resolve({
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
                            o = i.headers.get(eh);
                        return 403 === i.status && i.headers.has(eh) && null !== o ? (this.currentToken = o, ej(o), t(r, this.prepareRequestInit(n))) : Promise.resolve(i)
                    }, e.prototype.prepareRequestInit = function(e) {
                        var t;
                        return A(A({}, e), {
                            headers: A(A({}, e.headers), ((t = {})[eh] = this.currentToken, t))
                        })
                    }, e
                }(),
                eS = [],
                eI = function(e) {
                    eS = eS.filter(function(t) {
                        return t !== e
                    })
                },
                eM = function(e) {
                    var t = e.url;
                    503 === e.status && eS.forEach(function(e) {
                        return e(t)
                    })
                },
                eN = function() {
                    function e() {}
                    return e.prototype.subscribe = function(e) {
                        return eS.push(e),
                            function() {
                                return eI(e)
                            }
                    }, e.prototype.unsubscribe = function(e) {
                        return eI(e)
                    }, e.prototype.post = function(e) {
                        var t = e.response;
                        return eM(t), Promise.resolve(t)
                    }, e
                }(),
                eP = function() {
                    function e() {}
                    return e.prototype.pre = function(e) {
                        var t = e.url,
                            r = e.init;
                        if (!z().envName) return Promise.resolve({
                            url: t,
                            init: r
                        });
                        var n = A({}, r.headers);
                        return K(n), Promise.resolve({
                            url: t,
                            init: A(A({}, r), {
                                headers: n
                            })
                        })
                    }, e
                }(),
                eE = new eO,
                eT = new eN,
                eD = [function(e) {
                    return e.captureException ? new ee(e.captureException) : void 0
                }, function(e) {
                    return e.robloxSiteDomain && e.enableBoundAuthToken ? new eu(e.robloxSiteDomain, e.boundAuthTokenLoadTimeout, e.boundAuthTokenDataTimeout) : void 0
                }, function(e) {
                    return e.robloxSiteDomain ? new ey(e.robloxSiteDomain, e.genericChallengeMiddlewareType) : void 0
                }, function(e) {
                    return e.unifiedLogger ? new eg(e.unifiedLogger) : void 0
                }, function() {
                    return eE
                }, function() {
                    return eT
                }, function(e) {
                    return e.enableMrRouter ? new eP : void 0
                }],
                eA = function() {
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
                                return L(e, void 0, void 0, function() {
                                    return C(this, function(e) {
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
                eL = new eA,
                eC = function() {
                    function e(e) {
                        void 0 === e && (e = eL);
                        var t = this;
                        this.configuration = e, this.fetchApi = function(e, r, n) {
                            return L(t, void 0, void 0, function() {
                                var t, i, o, a, l, u, c, s, d, f, p, m, y, b = this;
                                return C(this, function(g) {
                                    switch (g.label) {
                                        case 0:
                                            t = function(e, t) {
                                                return b.fetchApi(e, t, n)
                                            }, i = {
                                                url: e,
                                                init: r
                                            }, o = 0, a = this.middleware, g.label = 1;
                                        case 1:
                                            return o < a.length ? (y = a[o]).pre ? [4, y.pre(A({
                                                fetch: t
                                            }, i))] : [3, 3] : [3, 4];
                                        case 2:
                                            i = g.sent() || i, g.label = 3;
                                        case 3:
                                            return o++, [3, 1];
                                        case 4:
                                            l = void 0, u = performance.now(), g.label = 5;
                                        case 5:
                                            return g.trys.push([5, 7, , 12]), [4, (this.configuration.fetchApi || fetch)(i.url, i.init)];
                                        case 6:
                                            return l = g.sent(), c = performance.now(), [3, 12];
                                        case 7:
                                            s = g.sent(), c = performance.now(), d = 0, f = this.middleware, g.label = 8;
                                        case 8:
                                            return d < f.length ? (y = f[d]).onError ? [4, y.onError({
                                                fetch: t,
                                                url: i.url,
                                                init: i.init,
                                                error: s,
                                                response: l ? l.clone() : void 0
                                            })] : [3, 10] : [3, 11];
                                        case 9:
                                            l = g.sent() || l, g.label = 10;
                                        case 10:
                                            return d++, [3, 8];
                                        case 11:
                                            if (void 0 === l) throw H(s, Error) ? new ek(s, "The request failed and the interceptors did not return an alternative response") : s;
                                            return [3, 12];
                                        case 12:
                                            p = 0, m = this.middleware, g.label = 13;
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
                                            l = g.sent() || l, g.label = 15;
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
                        return L(this, void 0, void 0, function() {
                            var r, n, i, o;
                            return C(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        return [4, this.createFetchParams(e, t)];
                                    case 1:
                                        return n = (r = a.sent()).url, i = r.init, [4, this.fetchApi(n, i, e.schemaPath)];
                                    case 2:
                                        if ((o = a.sent()) && o.status >= 200 && o.status < 300) return [2, o];
                                        throw new eR(o, "Response from ".concat(o.url, " returned an error code ").concat(o.status))
                                }
                            })
                        })
                    }, e.prototype.createFetchParams = function(e, t) {
                        return L(this, void 0, void 0, function() {
                            var r, n, i, o, a, l, u, c = this;
                            return C(this, function(s) {
                                var d, f;
                                switch (s.label) {
                                    case 0:
                                        return r = this.configuration.basePath + e.path, void 0 !== e.query && 0 !== Object.keys(e.query).length && (r += "?" + this.configuration.queryParamsStringify(e.query)), Object.keys(n = Object.assign({}, this.configuration.headers, e.headers)).forEach(function(e) {
                                            return void 0 === n[e] ? delete n[e] : {}
                                        }), i = "function" == typeof t ? t : function() {
                                            return L(c, void 0, void 0, function() {
                                                return C(this, function(e) {
                                                    return [2, t]
                                                })
                                            })
                                        }, o = {
                                            method: e.method,
                                            headers: n,
                                            body: e.body,
                                            credentials: this.configuration.credentials
                                        }, l = [A({}, o)], [4, i({
                                            init: o,
                                            context: e
                                        })];
                                    case 1:
                                        return a = A.apply(void 0, l.concat([s.sent()])), u = A(A({}, a), {
                                            body: (d = a.body, "u" > typeof FormData && H(d, FormData) || H(a.body, URLSearchParams) || (f = a.body, "u" > typeof Blob && H(f, Blob)) ? a.body : JSON.stringify(a.body))
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
                eR = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.response = t, n.name = "ResponseError", n
                    }
                    return D(t, e), t
                }(Error),
                ek = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.cause = t, n.name = "FetchError", n
                    }
                    return D(t, e), t
                }(Error),
                eU = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.field = t, n.name = "RequiredError", n
                    }
                    return D(t, e), t
                }(Error);

            function ez(e, t) {
                return null != e[t]
            }
            var e_ = function() {
                    function e(e, t) {
                        void 0 === t && (t = function(e) {
                            return e
                        }), this.raw = e, this.transformer = t
                    }
                    return e.prototype.value = function() {
                        return L(this, void 0, void 0, function() {
                            var e;
                            return C(this, function(t) {
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
                    return L(this, void 0, void 0, function() {
                        return C(this, function(e) {
                            return [2, void 0]
                        })
                    })
                }, (function(e) {
                    this.raw = e
                }).prototype.value = function() {
                    return L(this, void 0, void 0, function() {
                        return C(this, function(e) {
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
                        return L(this, void 0, void 0, function() {
                            return C(this, function(e) {
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
                eY = function(e) {
                    function t(t) {
                        void 0 === t && (t = {});
                        var r, n = A({}, t),
                            i = n.middleware || [];
                        return i.unshift.apply(i, (r = t, eD.map(function(e) {
                            return e(r)
                        }).filter(function(e) {
                            return e
                        }))), n.middleware = i, e.call(this, n) || this
                    }
                    return D(t, e), t
                }(eA);

            function eF(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var eG = function(e, t) {
                return (eG = Object.setPrototypeOf || eF({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function eW(e, t, r, n) {
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
                        e.done ? i(e.value) : (eF(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, l)
                    }
                    u((n = n.apply(e, t || [])).next())
                })
            }

            function eQ(e, t) {
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

            function eV(e) {
                return e
            }
            "function" == typeof SuppressedError && SuppressedError;
            var eq = "Month";

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
                    offerType: ez(t, "offerType") ? t.offerType : void 0,
                    freeTrialOffer: ez(t, "freeTrialOffer") ? null == (r = t.freeTrialOffer) ? r : {
                        periodType: r.periodType,
                        duration: r.duration,
                        estimatedTrialEndDate: ez(r, "estimatedTrialEndDate") ? null === r.estimatedTrialEndDate ? null : new Date(r.estimatedTrialEndDate) : void 0
                    } : void 0
                }
            }
            var eZ = "Blackbird";

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

            function e0(e) {
                var t, r, n, i, o, a, l, u, c;
                return null == (t = e) ? t : {
                    productKey: e$(t.productKey),
                    periodType: t.periodType,
                    periodCount: t.periodCount,
                    localizedPrice: eK(t.localizedPrice),
                    localizedPriceDisplayString: t.localizedPriceDisplayString,
                    localizedStrikethroughPrice: eK(t.localizedStrikethroughPrice),
                    localizedStrikethroughPriceDisplayString: t.localizedStrikethroughPriceDisplayString,
                    productTypeDetails: null == (r = t.productTypeDetails) ? r : {
                        currencySubscriptionProductDetails: ez(r, "currencySubscriptionProductDetails") ? null == (n = r.currencySubscriptionProductDetails) ? n : {
                            currencyType: n.currencyType,
                            entitledAmountMicros: n.entitledAmountMicros
                        } : void 0,
                        developerSubscriptionProductDetails: ez(r, "developerSubscriptionProductDetails") ? null == (i = r.developerSubscriptionProductDetails) ? i : {
                            universeId: i.universeId,
                            imageAssetId: i.imageAssetId,
                            localizedName: i.localizedName,
                            localizedDescription: i.localizedDescription
                        } : void 0,
                        robloxSubscriptionProductDetails: ez(r, "robloxSubscriptionProductDetails") ? null == (o = r.robloxSubscriptionProductDetails) ? o : {
                            featureConfig: null == (a = o.featureConfig) ? a : {
                                virtualTransactionDiscounts: null === a.virtualTransactionDiscounts ? null : a.virtualTransactionDiscounts.map(eJ),
                                isRobuxTransferEnabled: a.isRobuxTransferEnabled,
                                isTradingEnabled: a.isTradingEnabled,
                                isUgcPublishingEnabled: a.isUgcPublishingEnabled,
                                privateServerDiscounts: null === a.privateServerDiscounts ? null : a.privateServerDiscounts.map(eJ),
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
                                }
                            }
                        } : void 0
                    },
                    eligibleOffers: t.eligibleOffers.map(eX)
                }
            }

            function e1(e) {
                var t;
                return null == (t = e) ? t : {
                    referralId: t.referralId,
                    senderUserId: t.senderUserId,
                    status: t.status,
                    createdTimestampMs: t.createdTimestampMs
                }
            }

            function e4(e) {
                var t, r, n, i, o, a, l;
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
                        robloxSubscriptionMembershipDetails: ez(i, "robloxSubscriptionMembershipDetails") ? null == (o = i.robloxSubscriptionMembershipDetails) ? o : {
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
                    productInfo: e0(t.productInfo)
                }
            }
            var e2 = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return function(e, t) {
                        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                        function r() {
                            this.constructor = e
                        }
                        eG(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
                    }(t, e), t.prototype.subscriptionsV2CheckSubscriptionReferralEligibilityRaw = function(e, t) {
                        return eW(this, void 0, void 0, function() {
                            var r, n;
                            return eQ(this, function(i) {
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
                                        return [2, new e_(i.sent(), function(e) {
                                            return null == e ? e : {
                                                eligibility: e.eligibility
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2CheckSubscriptionReferralEligibility = function() {
                        return eW(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eQ(this, function(r) {
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
                        return eW(this, void 0, void 0, function() {
                            var r, n;
                            return eQ(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eU("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2ClaimSubscriptionProduct.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eU("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2ClaimSubscriptionProduct.");
                                        return r = {}, void 0 !== e.grantType && (r.grantType = e.grantType), n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/claim".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/claim",
                                            method: "POST",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new e_(i.sent())]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ClaimSubscriptionProduct = function(e, t) {
                        return eW(this, void 0, void 0, function() {
                            return eQ(this, function(r) {
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
                        return eW(this, void 0, void 0, function() {
                            var r, n;
                            return eQ(this, function(i) {
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
                                        return [2, new e_(i.sent(), function(e) {
                                            return null == e ? e : {
                                                referralId: e.referralId
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2CreateSubscriptionReferral = function() {
                        return eW(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eQ(this, function(r) {
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
                        return eW(this, void 0, void 0, function() {
                            var t, r;
                            return eQ(this, function(n) {
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
                                        return [2, new e_(n.sent(), function(e) {
                                            return null == e ? e : {
                                                deepLinkUrl: e.deepLinkUrl
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2CreateSubscriptionReferralLink = function(e) {
                        return eW(this, void 0, void 0, function() {
                            return eQ(this, function(t) {
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
                        return eW(this, void 0, void 0, function() {
                            var r, n;
                            return eQ(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eU("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eU("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        return r = {}, n = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new e_(i.sent(), function(e) {
                                            return null == e ? e : {
                                                displayPrice: eK(e.displayPrice)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductDisplayPrice = function(e, t) {
                        return eW(this, void 0, void 0, function() {
                            return eQ(this, function(r) {
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
                        return eW(this, void 0, void 0, function() {
                            var r, n;
                            return eQ(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eU("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eU("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/payment-metadata".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/payment-metadata",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new e_(i.sent(), function(e) {
                                            return null == e ? e : {
                                                paymentMethods: e.paymentMethods.map(eV),
                                                paymentProviders: e.paymentProviders.map(eH)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductPaymentMetadata = function(e, t) {
                        return eW(this, void 0, void 0, function() {
                            return eQ(this, function(r) {
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
                        return eW(this, void 0, void 0, function() {
                            var r, n;
                            return eQ(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eU("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eU("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new e_(i.sent(), function(e) {
                                            return null == e ? e : {
                                                subscriptionProductInfo: e0(e.subscriptionProductInfo)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetSubscriptionProductInfo = function(e, t) {
                        return eW(this, void 0, void 0, function() {
                            return eQ(this, function(r) {
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
                        return eW(this, void 0, void 0, function() {
                            var r, n;
                            return eQ(this, function(i) {
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
                                        return [2, new e_(i.sent(), function(e) {
                                            return null == e ? e : {
                                                productKeys: e.productKeys.map(e$),
                                                products: e.products.map(e0)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListAvailableSubscriptionProducts = function() {
                        return eW(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eQ(this, function(r) {
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
                        return eW(this, void 0, void 0, function() {
                            var r, n;
                            return eQ(this, function(i) {
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
                                        return [2, new e_(i.sent(), function(e) {
                                            return null == e ? e : {
                                                referrals: e.referrals.map(e1),
                                                nextCursor: e.nextCursor,
                                                hasMore: e.hasMore
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListSubscriptionReferrals = function() {
                        return eW(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eQ(this, function(r) {
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
                        return eW(this, void 0, void 0, function() {
                            var r, n;
                            return eQ(this, function(i) {
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
                                        return [2, new e_(i.sent(), function(e) {
                                            return null == e ? e : {
                                                subscriptions: e.subscriptions.map(e4),
                                                hasMore: e.hasMore,
                                                cursor: e.cursor
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListSubscriptions = function() {
                        return eW(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eQ(this, function(r) {
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
                        return eW(this, void 0, void 0, function() {
                            var r, n;
                            return eQ(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eU("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eU("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
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
                                        return [2, new e_(i.sent(), function(e) {
                                            var t, r, n, i, o, a;
                                            return null == e ? e : {
                                                paymentProvider: eH(e.paymentProvider),
                                                providerPurchasePayload: null == (t = e.providerPurchasePayload) ? t : {
                                                    stripePurchasePayload: ez(t, "stripePurchasePayload") ? null == (r = t.stripePurchasePayload) ? r : {
                                                        checkoutUrl: r.checkoutUrl
                                                    } : void 0,
                                                    appleAppStorePurchasePayload: ez(t, "appleAppStorePurchasePayload") ? null == (n = t.appleAppStorePurchasePayload) ? n : {
                                                        appAccountToken: n.appAccountToken,
                                                        partnerBillingJwtToken: n.partnerBillingJwtToken,
                                                        partnerBillingGenericProductId: n.partnerBillingGenericProductId
                                                    } : void 0,
                                                    googlePlayStorePurchasePayload: ez(t, "googlePlayStorePurchasePayload") ? null == (i = t.googlePlayStorePurchasePayload) ? i : {
                                                        providerProductId: i.providerProductId,
                                                        providerProductType: i.providerProductType,
                                                        chargeRequestId: i.chargeRequestId,
                                                        offerId: ez(i, "offerId") ? i.offerId : void 0
                                                    } : void 0,
                                                    creditBalancePurchasePayload: ez(t, "creditBalancePurchasePayload") ? null == (o = t.creditBalancePurchasePayload) ? o : {
                                                        checkoutUrl: o.checkoutUrl,
                                                        checkoutToken: ez(o, "checkoutToken") ? o.checkoutToken : void 0,
                                                        robloxManagedTax: ez(o, "robloxManagedTax") ? o.robloxManagedTax : void 0,
                                                        requiresBillingAddress: ez(o, "requiresBillingAddress") ? o.requiresBillingAddress : void 0,
                                                        chargeRequestId: ez(o, "chargeRequestId") ? o.chargeRequestId : void 0,
                                                        baseAmount: ez(o, "baseAmount") ? o.baseAmount : void 0,
                                                        taxAmount: ez(o, "taxAmount") ? o.taxAmount : void 0,
                                                        totalAmount: ez(o, "totalAmount") ? o.totalAmount : void 0,
                                                        currencyCode: ez(o, "currencyCode") ? o.currencyCode : void 0
                                                    } : void 0,
                                                    braintreePurchasePayload: ez(t, "braintreePurchasePayload") ? null == (a = t.braintreePurchasePayload) ? a : {
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
                        return eW(this, void 0, void 0, function() {
                            return eQ(this, function(r) {
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
                }(eC),
                e3 = window.Roblox["core-scripts"].endpoints,
                e5 = window.Roblox["core-scripts"].guac,
                e6 = window.Roblox["core-scripts"].meta.device,
                e8 = function() {
                    var e, t = document.querySelector('meta[name="subscription-referral-data"]');
                    return null != (e = null == t ? void 0 : t.dataset) ? e : null
                },
                e9 = function() {
                    var e;
                    return (null == (e = e8()) ? void 0 : e.isEnabled) === "true"
                },
                e7 = "https://www.roblox.com/info/terms",
                te = "referrals",
                tt = "roblox_subscription_redirect_url",
                tr = window.React,
                tn = r.n(tr),
                ti = function() {
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

            function to(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ta(e) {
                if (Array.isArray(e)) return e
            }

            function tl() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function tu(e, t) {
                if (e) {
                    if ("string" == typeof e) return to(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return to(e, t)
                }
            }
            var tc = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                ts = tn().forwardRef(function(e, t) {
                    var r, n = ta(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || tu(r) || tl(),
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
                        s = (ta(o) || function(e) {
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
                        }(o) || tu(o, 1) || tl())[0];
                    return tn().createElement("span", function(e) {
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
                        className: ti("grow-0 shrink-0 basis-auto icon", a, tc[void 0 === l ? "Medium" : l], u)
                    }, c))
                });
            ts.displayName = "Icon";
            var td = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                tf = function(e) {
                    var t = e.className;
                    return tn().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: ti("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                tp = "opacity-[0.5]",
                tm = function(e) {
                    var t = e.width,
                        r = e.height;
                    return tn().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, tn().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function ty(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tb(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function tg() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = tb(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : tb(t[e], null)
                        }
                    }
                }
            }

            function th() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return tr.useCallback(tg.apply(void 0, function(e) {
                    if (Array.isArray(e)) return ty(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return ty(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ty(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function tv(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tw(e) {
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

            function tj(e, t) {
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

            function tO(e) {
                return function(e) {
                    if (Array.isArray(e)) return tv(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tv(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tv(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tS(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var tI = Symbol.for("react.lazy"),
                tM = tr[" use ".trim().toString()];

            function tN(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : tS(e)) === "object" && "$$typeof" in e && e.$$typeof === tI && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : tS(t)) === "object" && null !== t && "then" in t
            }
            var tP = ((e = tr.forwardRef(function(e, t) {
                    var r = e.children,
                        n = tj(e, ["children"]);
                    if (tN(r) && "function" == typeof tM && (r = tM(r._payload)), tr.isValidElement(r)) {
                        var i, o, a, l, u, c = (u = (l = null == (o = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (u = (l = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                            s = function(e, t) {
                                var r = tw({}, t);
                                for (var n in t) ! function(n) {
                                    var i = e[n],
                                        o = t[n];
                                    /^on[A-Z]/.test(n) ? i && o ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = o.apply(void 0, tO(t));
                                        return i.apply(void 0, tO(t)), n
                                    } : i && (r[n] = i) : "style" === n ? r[n] = tw({}, i, o) : "className" === n && (r[n] = [i, o].filter(Boolean).join(" "))
                                }(n);
                                return tw({}, e, r)
                            }(n, r.props);
                        return r.type !== tr.Fragment && (s.ref = t ? tg(t, c) : c), tr.cloneElement(r, s)
                    }
                    return tr.Children.count(r) > 1 ? tr.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), i = e, (o = tr.forwardRef(function(e, t) {
                    var r = e.children,
                        n = tj(e, ["children"]);
                    tN(r) && "function" == typeof tM && (r = tM(r._payload));
                    var o = tr.Children.toArray(r),
                        a = o.find(tT);
                    if (a) {
                        var l = a.props.children,
                            u = o.map(function(e) {
                                return e !== a ? e : tr.Children.count(l) > 1 ? tr.Children.only(null) : tr.isValidElement(l) ? l.props.children : null
                            });
                        return (0, O.jsx)(i, tx(tw({}, n), {
                            ref: t,
                            children: tr.isValidElement(l) ? tr.cloneElement(l, void 0, u) : null
                        }))
                    }
                    return (0, O.jsx)(i, tx(tw({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), o),
                tE = Symbol("radix.slottable");

            function tT(e) {
                return tr.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === tE
            }

            function tD(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tA(e) {
                if (Array.isArray(e)) return e
            }

            function tL() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function tC(e) {
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

            function tk(e, t) {
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

            function tU(e, t) {
                if (e) {
                    if ("string" == typeof e) return tD(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tD(e, t)
                }
            }
            var tz = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                t_ = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                tB = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                tY = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                tF = (0, tr.forwardRef)(function(e, t) {
                    var r, n = tA(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || tU(r) || tL(),
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
                        g = void 0 === b ? "Emphasis" : b,
                        h = i.asChild,
                        v = tk(i, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        w = (tA(o) || function(e) {
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
                        }(o) || tU(o, 1) || tL())[0],
                        x = ti("foundation-web-button", s ? tp : [td, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", t_[y], s ? tY[g] : tB[g], l),
                        j = tC({
                            textDecoration: "none"
                        }, u),
                        O = function(e) {
                            return tn().createElement(tn().Fragment, null, tn().createElement(tf, null), f && tn().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, tn().createElement(tm, {
                                width: tz[y],
                                height: tz[y]
                            })), tn().createElement("span", {
                                className: ti("flex items-center min-width-0", "Large" === y || "Medium" === y ? "gap-small" : "gap-xsmall", f && "invisible")
                            }, p && tn().createElement(ts, {
                                name: p,
                                size: y
                            }), tn().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (h) {
                        v.as;
                        var S = tk(v, ["as"]),
                            I = tn().Children.only(a);
                        return tn().createElement(tP, tR(tC({
                            ref: w
                        }, S), {
                            className: x,
                            style: j,
                            "aria-disabled": s || void 0
                        }), tn().cloneElement(I, {}, O(I.props.children)))
                    }
                    if ("a" === v.as) {
                        v.as;
                        var M = v.href,
                            N = tk(v, ["as", "href"]);
                        return tn().createElement("a", tR(tC({
                            ref: w
                        }, N), {
                            "aria-disabled": s,
                            href: s ? void 0 : M,
                            className: x,
                            style: j
                        }), O(a))
                    }
                    v.as;
                    var P = tk(v, ["as"]);
                    return tn().createElement("button", tR(tC({
                        ref: w,
                        type: "button"
                    }, P), {
                        disabled: s,
                        className: x,
                        style: j
                    }), O(a))
                }),
                tG = function() {
                    var e = (0, S.useTranslation)().translate,
                        t = (0, tr.useCallback)(function() {
                            window.history.back()
                        }, []);
                    return (0, O.jsxs)("div", {
                        className: "height-[210px] gap-y-small margin-top-[240px] flex flex-col items-center",
                        children: [(0, O.jsx)(ts, {
                            className: "content-muted !size-1400",
                            name: "icon-regular-triangle-exclamation"
                        }), (0, O.jsx)("p", {
                            className: "text-heading-small",
                            children: e("Message.Error.Generic")
                        }), (0, O.jsxs)("div", {
                            className: "gap-x-medium padding-top-medium flex",
                            children: [(0, O.jsx)(tF, {
                                className: "min-width-[96px]",
                                size: "Small",
                                variant: "SoftEmphasis",
                                onClick: t,
                                children: e("Action.Back")
                            }), (0, O.jsx)(tF, {
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

            function tW(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tQ(e) {
                if (Array.isArray(e)) return e
            }

            function tV() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function tq(e) {
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

            function tK(e, t) {
                if (e) {
                    if ("string" == typeof e) return tW(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tW(e, t)
                }
            }
            var tH = (0, tr.createContext)(null),
                tX = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-medium"
                },
                tZ = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                t$ = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                tJ = (0, tr.forwardRef)(function(e, t) {
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
                    var g = null != n ? n : "Large",
                        h = void 0 !== m,
                        v = h ? "button" : "div",
                        w = !!b && c,
                        x = "Top" === o ? "justify-start" : "justify-center";
                    w && (x = "justify-start");
                    var j = tn().createElement(v, tq({
                            className: ti("bg-none width-full flex gap-medium stroke-none foundation-web-list-item padding-y-none", r ? "padding-x-medium" : "padding-x-xlarge", "Full" === i && "foundation-web-list-item-bottom-divider", h && "relative clip group/interactable focus-visible:outline-focus disabled:outline-none", h && "cursor-pointer", y)
                        }, h && {
                            onClick: function() {
                                return m()
                            }
                        }), h && tn().createElement(tf, null), f && tn().createElement("div", {
                            className: ti("flex flex-col padding-y-large", x)
                        }, f), tn().createElement("div", {
                            className: "flex fill clip-x padding-y-large gap-x-medium relative "
                        }, tn().createElement("div", {
                            className: ti("flex flex-col fill clip-x justify-center", w && "gap-xsmall")
                        }, a && tn().createElement("div", {
                            className: ti("content-emphasis text-align-x-start", void 0 === l || l ? tZ[g] : t$[g])
                        }, a), b && u && tn().createElement("div", {
                            className: ti("content-default text-align-x-start", tX[g], !c && "text-truncate-split text-no-wrap")
                        }, u), !b && s && tn().createElement("div", {
                            className: ti("content-default text-align-x-start text-truncate-split text-no-wrap", tX[g])
                        }, s), !b && d && tn().createElement("div", {
                            className: ti("content-default text-align-x-start padding-top-xsmall", tX[g])
                        }, d)), p && tn().createElement("div", {
                            className: ti("flex flex-col", x)
                        }, p), "Inset" === i && tn().createElement("div", {
                            className: "foundation-web-list-item-inset-divider"
                        }))),
                        O = (0, tr.useMemo)(function() {
                            return {
                                size: g
                            }
                        }, [g]);
                    return tn().createElement("li", {
                        ref: t,
                        style: {
                            listStyle: "none"
                        }
                    }, tn().createElement(tH.Provider, {
                        value: O
                    }, j))
                });
            tJ.displayName = "ListItem";
            var t0 = (0, tr.forwardRef)(function(e, t) {
                var r, n = tQ(r = [e, t]) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(r) || tK(r) || tV(),
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
                    s = (tQ(o) || function(e) {
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
                    }(o) || tK(o, 1) || tV())[0];
                return tn().createElement(void 0 === u ? "ul" : u, tq({
                    ref: s,
                    className: ti("foundation-web-list", l)
                }, c), a)
            });
            t0.displayName = "List";
            var t1 = "height-full min-width-0 grow-1 gap-x-large radius-medium !bg-surface-100 stroke-standard stroke-default padding-medium box-border flex items-center",
                t4 = function(e) {
                    var t = e.expandedPrimary,
                        r = e.expandedSecondary,
                        n = e.iconName,
                        i = e.onTileClick,
                        o = e.primary,
                        a = e.secondary,
                        l = (0, O.jsxs)(tr.Fragment, {
                            children: [(0, O.jsx)("div", {
                                className: "flex shrink-0 items-center justify-center",
                                children: (0, O.jsx)(ts, {
                                    name: n,
                                    size: "Large"
                                })
                            }), (0, O.jsxs)("div", {
                                className: "min-width-0 grow-1 gap-xsmall flex flex-col justify-center",
                                children: [(0, O.jsx)("div", {
                                    className: "text-title-medium content-emphasis text-align-x-start",
                                    children: o
                                }), (0, O.jsx)("div", {
                                    className: "text-body-medium content-default text-align-x-start",
                                    children: a
                                })]
                            })]
                        });
                    return (0, O.jsx)("li", {
                        className: "min-width-0 height-full flex list-none flex-col [list-style:none]",
                        children: null != i ? (0, O.jsx)("button", {
                            "aria-label": o,
                            className: "".concat(t1, " width-full text-align-x-start cursor-pointer font-[inherit]"),
                            type: "button",
                            onClick: function() {
                                i(t, r)
                            },
                            children: l
                        }) : (0, O.jsx)("div", {
                            className: t1,
                            children: l
                        })
                    })
                },
                t2 = function(e) {
                    var t = e.featureConfig,
                        r = e.overrideIconName,
                        n = e.onTileClick,
                        i = e.includeReferralBenefit,
                        o = (0, S.useTranslation)(),
                        a = o.translate,
                        l = o.intl,
                        u = (0, tr.useMemo)(function() {
                            var e;
                            return null == (e = t.virtualTransactionDiscounts) ? void 0 : e.find(function(e) {
                                return 0 === e.periodIndex
                            })
                        }, [t]),
                        c = (0, tr.useMemo)(function() {
                            var e;
                            return null == (e = t.virtualTransactionDiscounts) ? void 0 : e.filter(function(e) {
                                return e.periodIndex > 0
                            }).reduce(function(e, t) {
                                return null === e || t.periodIndex < e.periodIndex ? t : e
                            }, null)
                        }, [t]),
                        s = (0, tr.useMemo)(function() {
                            var e;
                            return null == (e = t.privateServerDiscounts) ? void 0 : e.find(function(e) {
                                return 0 === e.periodIndex
                            })
                        }, [t]);
                    return (0, O.jsxs)(t0, {
                        className: "width-full large:[grid-template-columns:repeat(2,minmax(0,1fr))] grid gap-x-[12px] gap-y-[12px] [grid-template-columns:minmax(0,1fr)]",
                        children: [u && (0, O.jsx)(t4, {
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
                        }), t.isAiBackgroundEnabled && (0, O.jsx)(t4, {
                            expandedPrimary: a("Description.Benefit.AvatarBackground"),
                            expandedSecondary: a("Description.Benefit.AvatarBackgroundSubtitle"),
                            iconName: null != r ? r : "icon-regular-image",
                            primary: a("Description.Benefit.AvatarBackground"),
                            secondary: a("Description.Benefit.AvatarBackgroundSubtitle"),
                            onTileClick: n
                        }), t.isAppThemesEnabled && (0, O.jsx)(t4, {
                            expandedPrimary: a("Description.Benefit.AppThemes"),
                            expandedSecondary: a("Description.Benefit.AppThemesSubtitle"),
                            iconName: null != r ? r : "icon-regular-paint-brush",
                            primary: a("Description.Benefit.AppThemes"),
                            secondary: a("Description.Benefit.AppThemesSubtitle"),
                            onTileClick: n
                        }), t.isProfileFrameEnabled && (0, O.jsx)(t4, {
                            expandedPrimary: a("Description.Benefit.ProfileFrames"),
                            expandedSecondary: a("Description.Benefit.ProfileFramesSubtitle"),
                            iconName: null != r ? r : "icon-regular-frame-expanded",
                            primary: a("Description.Benefit.ProfileFrames"),
                            secondary: a("Description.Benefit.ProfileFramesSubtitle"),
                            onTileClick: n
                        }), s && (0, O.jsx)(t4, {
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
                        }), t.isRobuxTransferEnabled && (0, O.jsx)(t4, {
                            expandedPrimary: a("Description.Benefit.RobuxTransfersExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.RobuxTransfersExpandedBody"),
                            iconName: null != r ? r : "icon-regular-robux",
                            primary: a("Description.Benefit.RobuxTransfers"),
                            secondary: a("Description.Benefit.RobuxTransfersSubtitle"),
                            onTileClick: n
                        }), t.isTradingEnabled && (0, O.jsx)(t4, {
                            expandedPrimary: a("Description.Benefit.TradeResellItemsExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.TradeResellItemsExpandedBody"),
                            iconName: null != r ? r : "icon-regular-hand-two-arrows-horizontal",
                            primary: a("Description.Benefit.TradeResellItems"),
                            secondary: a("Description.Benefit.TradeResellItemsSubtitle"),
                            onTileClick: n
                        }), t.isUgcPublishingEnabled && (0, O.jsx)(t4, {
                            expandedPrimary: a("Description.Benefit.PublishItemsExpandedTitle"),
                            expandedSecondary: a("Description.Benefit.PublishItemsExpandedBody"),
                            iconName: null != r ? r : "icon-regular-arrow-up-from-landscape-rectangle",
                            primary: a("Description.Benefit.PublishItems"),
                            secondary: a("Description.Benefit.PublishItemsSubtitle"),
                            onTileClick: n
                        }), void 0 !== i && i && e9() && (0, O.jsx)(t4, {
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
                t3 = function(e) {
                    var t = e.children;
                    return (0, O.jsx)("div", {
                        children: t
                    })
                },
                t5 = function() {
                    return (0, O.jsx)("div", {
                        className: "backdrop-texture width-full height-[210px] pointer-events-none absolute"
                    })
                },
                t6 = function() {
                    return (0, O.jsx)("div", {
                        className: "stroke-default stroke-standard self-stretch"
                    })
                };

            function t8(e) {
                var t = e.productTypeDetails.robloxSubscriptionProductDetails;
                if (!(null == t ? void 0 : t.featureConfig)) throw Error("featureConfig is missing on robloxSubscriptionProductDetails");
                return t.featureConfig
            }

            function t9(e) {
                var t, r = e.productTypeDetails.robloxSubscriptionProductDetails,
                    n = null == r ? void 0 : r.featureConfig.currencySubscriptionConfig;
                return Math.floor((null != (t = null == n ? void 0 : n.entitledAmountMicros) ? t : 0) / 1e6)
            }

            function t7(e) {
                return e.eligibleOffers.find(function(e) {
                    return "FreeTrial" === e.offerType
                })
            }
            var re = function(e) {
                var t = e.robloxSubscriptionProduct,
                    r = e.onDismiss,
                    n = (0, S.useTranslation)().translate,
                    i = (0, O.jsx)(tF, {
                        className: "width-full",
                        size: "Large",
                        variant: "Emphasis",
                        onClick: r,
                        children: n("Action.OK")
                    }),
                    o = (0, O.jsxs)("p", {
                        className: "text-body-small content-muted text-center",
                        children: [n("Description.FeatureAccessDisclaimer"), " ", (0, O.jsx)("a", {
                            className: "text-link",
                            href: "https://help.roblox.com/hc/articles/39143693116052-Understanding-Age-Checks-on-Roblox",
                            children: n("Action.ViewDetails")
                        })]
                    });
                return (0, O.jsxs)(tr.Fragment, {
                    children: [(0, O.jsx)(t5, {}), (0, O.jsx)("div", {
                        className: "flex flex-col items-center",
                        children: (0, O.jsxs)("div", {
                            className: "padding-x-xlarge content-emphasis gap-y-xxlarge width-full large:max-width-[730px] flex flex-col",
                            children: [(0, O.jsxs)("div", {
                                className: "gap-y-small large:items-center flex flex-col items-start",
                                children: [(0, O.jsxs)("div", {
                                    className: "gap-x-small flex items-center",
                                    children: [(0, O.jsx)(ts, {
                                        className: "!size-600",
                                        name: "icon-regular-roblox-plus"
                                    }), (0, O.jsx)("h1", {
                                        className: "text-heading-medium",
                                        children: n("Title.FreeTrialConfirmation")
                                    })]
                                }), (0, O.jsx)("p", {
                                    className: "text-body-large content-default",
                                    children: n("Description.FreeTrialConfirmation")
                                })]
                            }), (0, O.jsx)(t2, {
                                featureConfig: t8(t),
                                periodType: t.periodType
                            }), (0, O.jsx)(t3, {
                                children: (0, O.jsxs)("div", {
                                    className: "large:flex large:flex-col large:items-center width-full gap-y-medium hidden",
                                    "data-testid": "free-trial-action-inline",
                                    children: [i, o]
                                })
                            })]
                        })
                    }), (0, O.jsxs)("div", {
                        "aria-label": n("Action.OK"),
                        className: "bottom-dock padding-t-medium bg-surface-100 large:!hidden width-full gap-y-medium flex flex-col",
                        "data-testid": "free-trial-action-dock",
                        role: "region",
                        children: [(0, O.jsx)(t6, {}), (0, O.jsxs)("div", {
                            className: "width-full gap-y-medium padding-b-[env(safe-area-inset-bottom\\,0px)] padding-x-xxlarge flex flex-col items-stretch",
                            children: [i, o]
                        })]
                    })]
                })
            };

            function rt(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rr(e) {
                if (Array.isArray(e)) return e
            }

            function rn() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ri(e, t) {
                if (e) {
                    if ("string" == typeof e) return rt(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rt(e, t)
                }
            }
            var ro = {
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
                ra = tn().forwardRef(function(e, t) {
                    var r, n = rr(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || ri(r) || rn(),
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
                        y = (rr(o) || function(e) {
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
                        }(o) || ri(o, 1) || rn())[0],
                        b = ro[u],
                        g = b.dimension,
                        h = b.strokeWidth,
                        v = b.textClass,
                        w = b.valueContainerSize,
                        x = (g - h) / 2,
                        j = 2 * Math.PI * x,
                        O = g / 2,
                        S = Math.min(100, Math.max(0, void 0 === s ? 0 : s)),
                        I = f && void 0 !== w ? w : g,
                        M = "Determinate" === (void 0 === c ? "Determinate" : c);
                    return tn().createElement("div", function(e) {
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
                        className: ti("foundation-web-progress-circle inline-flex items-center justify-center", a),
                        role: "progressbar",
                        "aria-label": p,
                        "aria-valuemin": M ? 0 : void 0,
                        "aria-valuemax": M ? 100 : void 0,
                        "aria-valuenow": M ? S : void 0,
                        style: {
                            width: I,
                            height: I
                        }
                    }, m), tn().createElement("svg", {
                        width: g,
                        height: g,
                        viewBox: "0 0 ".concat(g, " ").concat(g),
                        className: "relative"
                    }, tn().createElement("circle", {
                        cx: O,
                        cy: O,
                        r: x,
                        fill: "none",
                        strokeWidth: h,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), tn().createElement("circle", {
                        cx: O,
                        cy: O,
                        r: x,
                        fill: "none",
                        strokeWidth: h,
                        strokeDasharray: M ? j : "".concat(.75 * j, " ").concat(.25 * j),
                        strokeDashoffset: M ? j * (1 - S / 100) : 0,
                        strokeLinecap: "round",
                        className: ti(!M && "foundation-web-progress-circle-indeterminate"),
                        style: M ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), M && f && "Large" === u && tn().createElement("div", {
                        className: ti("absolute content-emphasis flex items-center justify-center", v),
                        "aria-hidden": "true"
                    }, tn().createElement("span", null, Math.round(S)), tn().createElement("span", null, "%")))
                });
            ra.displayName = "ProgressCircle";
            var rl = function() {
                    var e = (0, S.useTranslation)().translate;
                    return (0, O.jsx)("div", {
                        className: "margin-top-[240px] flex flex-col items-center",
                        children: (0, O.jsx)(ra, {
                            ariaLabel: e("Label.Loading"),
                            size: "Medium",
                            variant: "Indeterminate"
                        })
                    })
                },
                ru = window.Roblox["core-scripts"].meta.user,
                rc = 0,
                rs = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        t = (0, tr.useRef)();
                    return t.current || (rc += 1, t.current = "".concat(e).concat(rc)), t.current
                };

            function rd(e) {
                var t = e.className;
                return tn().createElement("svg", {
                    xmlns: "http://www.w3.org/2000/svg",
                    width: "13",
                    height: "6",
                    viewBox: "0 0 13 6",
                    fill: "none",
                    className: ti("block", t),
                    style: {
                        marginTop: -1
                    }
                }, tn().createElement("path", {
                    d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
                    fill: "currentColor"
                }))
            }

            function rf(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    i = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === i || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function rp(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rm(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function ry() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = rm(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : rm(t[e], null)
                        }
                    }
                }
            }

            function rb() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return tr.useCallback(ry.apply(void 0, function(e) {
                    if (Array.isArray(e)) return rp(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return rp(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rp(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function rg(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rh(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function rv(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        rh(e, t, r[t])
                    })
                }
                return e
            }

            function rw(e) {
                return function(e) {
                    if (Array.isArray(e)) return rg(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return rg(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rg(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rx(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    n = function() {
                        var t = r.map(function(e) {
                            return tr.createContext(e)
                        });
                        return function(r) {
                            var n = (null == r ? void 0 : r[e]) || t;
                            return tr.useMemo(function() {
                                var t, i;
                                return rh({}, "__scope".concat(e), (t = rv({}, r), i = null != (i = rh({}, e, n)) ? i : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(i)) : (function(e) {
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
                    var i = tr.createContext(n),
                        o = r.length;
                    r = rw(r).concat([n]);
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
                            c = tr.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, O.jsx)(u.Provider, {
                            value: c,
                            children: a
                        })
                    };
                    return a.displayName = t + "Provider", [a, function(r, a) {
                        var l, u = (null == a || null == (l = a[e]) ? void 0 : l[o]) || i,
                            c = tr.useContext(u);
                        if (c) return c;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, rj.apply(void 0, [n].concat(rw(t)))]
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
                            return rv({}, e, n(t)["__scope".concat(i)])
                        }, {});
                        return tr.useMemo(function() {
                            return rh({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return i.scopeName = n.scopeName, i
            }
            var rO = window.RadixUI["react-dismissable-layer"],
                rS = (null == (w = globalThis) ? void 0 : w.document) ? tr.useLayoutEffect : function() {};

            function rI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var rM = tr["useId".toString()] || function() {},
                rN = 0,
                rP = ["top", "right", "bottom", "left"],
                rE = Math.min,
                rT = Math.max,
                rD = Math.round,
                rA = Math.floor,
                rL = function(e) {
                    return {
                        x: e,
                        y: e
                    }
                },
                rC = {
                    left: "right",
                    right: "left",
                    bottom: "top",
                    top: "bottom"
                },
                rR = {
                    start: "end",
                    end: "start"
                };

            function rk(e, t) {
                return "function" == typeof e ? e(t) : e
            }

            function rU(e) {
                return e.split("-")[0]
            }

            function rz(e) {
                return e.split("-")[1]
            }

            function r_(e) {
                return "x" === e ? "y" : "x"
            }

            function rB(e) {
                return "y" === e ? "height" : "width"
            }
            var rY = new Set(["top", "bottom"]);

            function rF(e) {
                return rY.has(rU(e)) ? "y" : "x"
            }

            function rG(e) {
                return e.replace(/start|end/g, function(e) {
                    return rR[e]
                })
            }
            var rW = ["left", "right"],
                rQ = ["right", "left"],
                rV = ["top", "bottom"],
                rq = ["bottom", "top"];

            function rK(e) {
                return e.replace(/left|right|bottom|top/g, function(e) {
                    return rC[e]
                })
            }

            function rH(e) {
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

            function rX(e) {
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

            function rZ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function r$(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function rJ(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var o = e.apply(t, r);

                        function a(e) {
                            r$(o, n, i, a, l, "next", e)
                        }

                        function l(e) {
                            r$(o, n, i, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function r0(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function r1(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        r0(e, t, r[t])
                    })
                }
                return e
            }

            function r4(e, t) {
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

            function r2(e, t) {
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

            function r3(e) {
                return function(e) {
                    if (Array.isArray(e)) return rZ(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return rZ(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rZ(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function r5(e, t) {
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

            function r6(e, t, r) {
                var n, i = e.reference,
                    o = e.floating,
                    a = rF(t),
                    l = r_(rF(t)),
                    u = rB(l),
                    c = rU(t),
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
                switch (rz(t)) {
                    case "start":
                        n[l] -= p * (r && s ? -1 : 1);
                        break;
                    case "end":
                        n[l] += p * (r && s ? -1 : 1)
                }
                return n
            }

            function r8(e, t) {
                return rJ(function() {
                    var r, n, i, o, a, l, u, c, s, d, f, p, m, y, b, g, h, v, w, x, j, O, S, I, M, N, P, E, T, D, A;
                    return r5(this, function(L) {
                        switch (L.label) {
                            case 0:
                                return void 0 === t && (t = {}), n = e.x, i = e.y, o = e.platform, a = e.rects, l = e.elements, u = e.strategy, d = void 0 === (s = (c = rk(t, e)).boundary) ? "clippingAncestors" : s, p = void 0 === (f = c.rootBoundary) ? "viewport" : f, y = void 0 === (m = c.elementContext) ? "floating" : m, g = void 0 !== (b = c.altBoundary) && b, v = rH(void 0 === (h = c.padding) ? 0 : h), w = "floating" === y ? "reference" : "floating", x = l[g ? w : y], O = o.getClippingRect, S = {}, [4, null == o.isElement ? void 0 : o.isElement(x)];
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
                                return j = rX.apply(void 0, [L.sent()]), N = "floating" === y ? {
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
                                return D = rX.apply(void 0, [A]), [2, {
                                    top: (j.top - D.top + v.top) / E.y,
                                    bottom: (D.bottom - j.bottom + v.bottom) / E.y,
                                    left: (j.left - D.left + v.left) / E.x,
                                    right: (D.right - j.right + v.right) / E.x
                                }]
                        }
                    })
                })()
            }

            function r9(e, t) {
                return {
                    top: e.top - t.height,
                    right: e.right - t.width,
                    bottom: e.bottom - t.height,
                    left: e.left - t.width
                }
            }

            function r7(e) {
                return rP.some(function(t) {
                    return e[t] >= 0
                })
            }
            var ne = new Set(["left", "top"]);

            function nt(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function nr() {
                return "u" > typeof window
            }

            function nn(e) {
                return na(e) ? (e.nodeName || "").toLowerCase() : "#document"
            }

            function ni(e) {
                var t;
                return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
            }

            function no(e) {
                var t;
                return null == (t = (na(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
            }

            function na(e) {
                return !!nr() && (nt(e, Node) || nt(e, ni(e).Node))
            }

            function nl(e) {
                return !!nr() && (nt(e, Element) || nt(e, ni(e).Element))
            }

            function nu(e) {
                return !!nr() && (nt(e, HTMLElement) || nt(e, ni(e).HTMLElement))
            }

            function nc(e) {
                return !(!nr() || "u" < typeof ShadowRoot) && (nt(e, ShadowRoot) || nt(e, ni(e).ShadowRoot))
            }
            var ns = new Set(["inline", "contents"]);

            function nd(e) {
                var t = nj(e),
                    r = t.overflow,
                    n = t.overflowX,
                    i = t.overflowY,
                    o = t.display;
                return /auto|scroll|overlay|hidden|clip/.test(r + i + n) && !ns.has(o)
            }
            var nf = new Set(["table", "td", "th"]),
                np = [":popover-open", ":modal"];

            function nm(e) {
                return np.some(function(t) {
                    try {
                        return e.matches(t)
                    } catch (e) {
                        return !1
                    }
                })
            }
            var ny = ["transform", "translate", "scale", "rotate", "perspective"],
                nb = ["transform", "translate", "scale", "rotate", "perspective", "filter"],
                ng = ["paint", "layout", "strict", "content"];

            function nh(e) {
                var t = nv(),
                    r = nl(e) ? nj(e) : e;
                return ny.some(function(e) {
                    return !!r[e] && "none" !== r[e]
                }) || !!r.containerType && "normal" !== r.containerType || !t && !!r.backdropFilter && "none" !== r.backdropFilter || !t && !!r.filter && "none" !== r.filter || nb.some(function(e) {
                    return (r.willChange || "").includes(e)
                }) || ng.some(function(e) {
                    return (r.contain || "").includes(e)
                })
            }

            function nv() {
                return !("u" < typeof CSS) && !!CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")
            }
            var nw = new Set(["html", "body", "#document"]);

            function nx(e) {
                return nw.has(nn(e))
            }

            function nj(e) {
                return ni(e).getComputedStyle(e)
            }

            function nO(e) {
                return nl(e) ? {
                    scrollLeft: e.scrollLeft,
                    scrollTop: e.scrollTop
                } : {
                    scrollLeft: e.scrollX,
                    scrollTop: e.scrollY
                }
            }

            function nS(e) {
                if ("html" === nn(e)) return e;
                var t = e.assignedSlot || e.parentNode || nc(e) && e.host || no(e);
                return nc(t) ? t.host : t
            }

            function nI(e, t, r) {
                void 0 === t && (t = []), void 0 === r && (r = !0);
                var n, i = function e(t) {
                        var r = nS(t);
                        return nx(r) ? t.ownerDocument ? t.ownerDocument.body : t.body : nu(r) && nd(r) ? r : e(r)
                    }(e),
                    o = i === (null == (n = e.ownerDocument) ? void 0 : n.body),
                    a = ni(i);
                if (o) {
                    var l = nM(a);
                    return t.concat(a, a.visualViewport || [], nd(i) ? i : [], l && r ? nI(l) : [])
                }
                return t.concat(i, nI(i, [], r))
            }

            function nM(e) {
                return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
            }

            function nN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nP(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function nE(e) {
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

            function nT(e, t) {
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

            function nD(e) {
                return function(e) {
                    if (Array.isArray(e)) return nN(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || nA(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nA(e, t) {
                if (e) {
                    if ("string" == typeof e) return nN(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nN(e, t)
                }
            }

            function nL(e) {
                var t = nj(e),
                    r = parseFloat(t.width) || 0,
                    n = parseFloat(t.height) || 0,
                    i = nu(e),
                    o = i ? e.offsetWidth : r,
                    a = i ? e.offsetHeight : n,
                    l = rD(r) !== o || rD(n) !== a;
                return l && (r = o, n = a), {
                    width: r,
                    height: n,
                    $: l
                }
            }

            function nC(e) {
                return nl(e) ? e : e.contextElement
            }

            function nR(e) {
                var t = nC(e);
                if (!nu(t)) return rL(1);
                var r = t.getBoundingClientRect(),
                    n = nL(t),
                    i = n.width,
                    o = n.height,
                    a = n.$,
                    l = (a ? rD(r.width) : r.width) / i,
                    u = (a ? rD(r.height) : r.height) / o;
                return l && Number.isFinite(l) || (l = 1), u && Number.isFinite(u) || (u = 1), {
                    x: l,
                    y: u
                }
            }
            var nk = rL(0);

            function nU(e) {
                var t = ni(e);
                return nv() && t.visualViewport ? {
                    x: t.visualViewport.offsetLeft,
                    y: t.visualViewport.offsetTop
                } : nk
            }

            function nz(e, t, r, n) {
                void 0 === t && (t = !1), void 0 === r && (r = !1);
                var i, o = e.getBoundingClientRect(),
                    a = nC(e),
                    l = rL(1);
                t && (n ? nl(n) && (l = nR(n)) : l = nR(e));
                var u = (void 0 === (i = r) && (i = !1), n && (!i || n === ni(a)) && i) ? nU(a) : rL(0),
                    c = (o.left + u.x) / l.x,
                    s = (o.top + u.y) / l.y,
                    d = o.width / l.x,
                    f = o.height / l.y;
                if (a)
                    for (var p = ni(a), m = n && nl(n) ? ni(n) : n, y = p, b = nM(y); b && n && m !== y;) {
                        var g = nR(b),
                            h = b.getBoundingClientRect(),
                            v = nj(b),
                            w = h.left + (b.clientLeft + parseFloat(v.paddingLeft)) * g.x,
                            x = h.top + (b.clientTop + parseFloat(v.paddingTop)) * g.y;
                        c *= g.x, s *= g.y, d *= g.x, f *= g.y, c += w, s += x, b = nM(y = ni(b))
                    }
                return rX({
                    width: d,
                    height: f,
                    x: c,
                    y: s
                })
            }

            function n_(e, t) {
                var r = nO(e).scrollLeft;
                return t ? t.left + r : nz(no(e)).left + r
            }

            function nB(e, t) {
                var r = e.getBoundingClientRect();
                return {
                    x: r.left + t.scrollLeft - n_(e, r),
                    y: r.top + t.scrollTop
                }
            }
            var nY = new Set(["absolute", "fixed"]);

            function nF(e, t, r) {
                if ("viewport" === t) n = function(e, t) {
                    var r = ni(e),
                        n = no(e),
                        i = r.visualViewport,
                        o = n.clientWidth,
                        a = n.clientHeight,
                        l = 0,
                        u = 0;
                    if (i) {
                        o = i.width, a = i.height;
                        var c = nv();
                        (!c || c && "fixed" === t) && (l = i.offsetLeft, u = i.offsetTop)
                    }
                    var s = n_(n);
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
                else if ("document" === t) i = no(e), o = no(i), a = nO(i), l = i.ownerDocument.body, u = rT(o.scrollWidth, o.clientWidth, l.scrollWidth, l.clientWidth), c = rT(o.scrollHeight, o.clientHeight, l.scrollHeight, l.clientHeight), s = -a.scrollLeft + n_(i), d = -a.scrollTop, "rtl" === nj(l).direction && (s += rT(o.clientWidth, l.clientWidth) - u), n = {
                    width: u,
                    height: c,
                    x: s,
                    y: d
                };
                else if (nl(t)) p = (f = nz(t, !0, "fixed" === r)).top + t.clientTop, m = f.left + t.clientLeft, y = nu(t) ? nR(t) : rL(1), n = {
                    width: t.clientWidth * y.x,
                    height: t.clientHeight * y.y,
                    x: m * y.x,
                    y: p * y.y
                };
                else {
                    var n, i, o, a, l, u, c, s, d, f, p, m, y, b = nU(e);
                    n = {
                        x: t.x - b.x,
                        y: t.y - b.y,
                        width: t.width,
                        height: t.height
                    }
                }
                return rX(n)
            }

            function nG(e, t, r) {
                var n = nu(t),
                    i = no(t),
                    o = "fixed" === r,
                    a = nz(e, !0, o, t),
                    l = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    u = rL(0);
                if (n || !n && !o)
                    if (("body" !== nn(t) || nd(i)) && (l = nO(t)), n) {
                        var c = nz(t, !0, o, t);
                        u.x = c.x + t.clientLeft, u.y = c.y + t.clientTop
                    } else i && (u.x = n_(i));
                o && !n && i && (u.x = n_(i));
                var s = !i || n || o ? rL(0) : nB(i, l);
                return {
                    x: a.left + l.scrollLeft - u.x - s.x,
                    y: a.top + l.scrollTop - u.y - s.y,
                    width: a.width,
                    height: a.height
                }
            }

            function nW(e) {
                return "static" === nj(e).position
            }

            function nQ(e, t) {
                if (!nu(e) || "fixed" === nj(e).position) return null;
                if (t) return t(e);
                var r = e.offsetParent;
                return no(e) === r && (r = r.ownerDocument.body), r
            }

            function nV(e, t) {
                var r, n = ni(e);
                if (nm(e)) return n;
                if (!nu(e)) {
                    for (var i = nS(e); i && !nx(i);) {
                        if (nl(i) && !nW(i)) return i;
                        i = nS(i)
                    }
                    return n
                }
                for (var o = nQ(e, t); o && (r = o, nf.has(nn(r))) && nW(o);) o = nQ(o, t);
                return o && nx(o) && nW(o) && !nh(o) ? n : o || function(e) {
                    for (var t = nS(e); nu(t) && !nx(t);) {
                        if (nh(t)) return t;
                        if (nm(t)) break;
                        t = nS(t)
                    }
                    return null
                }(e) || n
            }
            var nq = {
                convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
                    var t = e.elements,
                        r = e.rect,
                        n = e.offsetParent,
                        i = "fixed" === e.strategy,
                        o = no(n),
                        a = !!t && nm(t.floating);
                    if (n === o || a && i) return r;
                    var l = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        u = rL(1),
                        c = rL(0),
                        s = nu(n);
                    if ((s || !s && !i) && (("body" !== nn(n) || nd(o)) && (l = nO(n)), nu(n))) {
                        var d = nz(n);
                        u = nR(n), c.x = d.x + n.clientLeft, c.y = d.y + n.clientTop
                    }
                    var f = !o || s || i ? rL(0) : nB(o, l);
                    return {
                        width: r.width * u.x,
                        height: r.height * u.y,
                        x: r.x * u.x - l.scrollLeft * u.x + c.x + f.x,
                        y: r.y * u.y - l.scrollTop * u.y + c.y + f.y
                    }
                },
                getDocumentElement: no,
                getClippingRect: function(e) {
                    var t = e.element,
                        r = e.boundary,
                        n = e.rootBoundary,
                        i = e.strategy,
                        o = nD("clippingAncestors" === r ? nm(t) ? [] : function(e, t) {
                            var r = t.get(e);
                            if (r) return r;
                            for (var n = nI(e, [], !1).filter(function(e) {
                                    return nl(e) && "body" !== nn(e)
                                }), i = null, o = "fixed" === nj(e).position, a = o ? nS(e) : e; nl(a) && !nx(a);) {
                                var l = nj(a),
                                    u = nh(a);
                                u || "fixed" !== l.position || (i = null), (o ? !u && !i : !u && "static" === l.position && !!i && nY.has(i.position) || nd(a) && !u && function e(t, r) {
                                    var n = nS(t);
                                    return !(n === r || !nl(n) || nx(n)) && ("fixed" === nj(n).position || e(n, r))
                                }(e, a)) ? n = n.filter(function(e) {
                                    return e !== a
                                }) : i = l, a = nS(a)
                            }
                            return t.set(e, n), n
                        }(t, this._c) : [].concat(r)).concat([n]),
                        a = o[0],
                        l = o.reduce(function(e, r) {
                            var n = nF(t, r, i);
                            return e.top = rT(n.top, e.top), e.right = rE(n.right, e.right), e.bottom = rE(n.bottom, e.bottom), e.left = rT(n.left, e.left), e
                        }, nF(t, a, i));
                    return {
                        width: l.right - l.left,
                        height: l.bottom - l.top,
                        x: l.left,
                        y: l.top
                    }
                },
                getOffsetParent: nV,
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
                                    return t = this.getOffsetParent || nV, [4, (0, this.getDimensions)(e.floating)];
                                case 1:
                                    return r = o.sent(), n = {}, i = [e.reference], [4, t(e.floating)];
                                case 2:
                                    return [2, (n.reference = nG.apply(void 0, i.concat([o.sent(), e.strategy])), n.floating = {
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
                                nP(o, n, i, a, l, "next", e)
                            }

                            function l(e) {
                                nP(o, n, i, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    }).call(this)
                },
                getClientRects: function(e) {
                    return Array.from(e.getClientRects())
                },
                getDimensions: function(e) {
                    var t = nL(e);
                    return {
                        width: t.width,
                        height: t.height
                    }
                },
                getScale: nR,
                isElement: nl,
                isRTL: function(e) {
                    return "rtl" === nj(e).direction
                }
            };

            function nK(e, t) {
                return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
            }

            function nH(e, t, r, n) {
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
                    y = nC(e),
                    b = a || u ? nD(y ? nI(y) : []).concat(nD(nI(t))) : [];
                b.forEach(function(e) {
                    a && e.addEventListener("scroll", r, {
                        passive: !0
                    }), u && e.addEventListener("resize", r)
                });
                var g = y && f ? function(e, t) {
                        var r, n = null,
                            i = no(e);

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
                                        rootMargin: -rA(d) + "px " + -rA(i.clientWidth - (s + f)) + "px " + -rA(i.clientHeight - (d + p)) + "px " + -rA(s) + "px",
                                        threshold: rT(0, rE(1, u)) || 1
                                    },
                                    y = !0;
                                try {
                                    n = new IntersectionObserver(b, nT(nE({}, m), {
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
                                1 !== n || nK(c, e.getBoundingClientRect()) || a(), y = !1
                            }
                        }(!0), o
                    }(y, r) : null,
                    h = -1,
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
                    }(e) || nA(e, 1) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())[0];
                    n && n.target === y && v && (v.unobserve(t), cancelAnimationFrame(h), h = requestAnimationFrame(function() {
                        var e;
                        null == (e = v) || e.observe(t)
                    })), r()
                }), y && !m && v.observe(y), v.observe(t));
                var w = m ? nz(e) : null;
                return m && function t() {
                        var n = nz(e);
                        w && !nK(w, n) && r(), w = n, i = requestAnimationFrame(t)
                    }(), r(),
                    function() {
                        var e;
                        b.forEach(function(e) {
                            a && e.removeEventListener("scroll", r), u && e.removeEventListener("resize", r)
                        }), null == g || g(), null == (e = v) || e.disconnect(), v = null, m && cancelAnimationFrame(i)
                    }
            }
            var nX = function(e) {
                    return {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            return rJ(function() {
                                var r, n, i, o, a, l, u, c, s, d, f, p, m, y, b, g, h, v, w, x, j, O, S, I, M, N, P, E, T, D, A, L, C, R, k, U, z;
                                return r5(this, function(_) {
                                    switch (_.label) {
                                        case 0:
                                            if (r = t.x, n = t.y, i = t.placement, o = t.rects, a = t.platform, l = t.elements, u = t.middlewareData, s = (c = rk(e, t) || {}).element, f = void 0 === (d = c.padding) ? 0 : d, null == s) return [2, {}];
                                            return p = rH(f), m = {
                                                x: r,
                                                y: n
                                            }, b = rB(y = r_(rF(i))), [4, a.getDimensions(s)];
                                        case 1:
                                            return g = _.sent(), v = (h = "y" === y) ? "top" : "left", w = h ? "bottom" : "right", x = h ? "clientHeight" : "clientWidth", j = o.reference[b] + o.reference[y] - m[y] - o.floating[b], O = m[y] - o.reference[y], [4, null == a.getOffsetParent ? void 0 : a.getOffsetParent(s)];
                                        case 2:
                                            if (M = !(I = (S = _.sent()) ? S[x] : 0)) return [3, 4];
                                            return [4, null == a.isElement ? void 0 : a.isElement(S)];
                                        case 3:
                                            M = !_.sent(), _.label = 4;
                                        case 4:
                                            return M && (I = l.floating[x] || o.floating[b]), N = j / 2 - O / 2, P = I / 2 - g[b] / 2 - 1, E = rE(p[v], P), T = rE(p[w], P), D = E, A = I - g[b] - T, C = rT(D, rE(L = I / 2 - g[b] / 2 + N, A)), k = (R = !u.arrow && null != rz(i) && L !== C && o.reference[b] / 2 - (L < D ? E : T) - g[b] / 2 < 0) ? L < D ? L - D : L - A : 0, [2, (r0(z = {}, y, m[y] + k), r0(z, "data", r1((r0(U = {}, y, C), r0(U, "centerOffset", L - C - k), U), R && {
                                                alignmentOffset: k
                                            })), r0(z, "reset", R), z)]
                                    }
                                })
                            })()
                        }
                    }
                },
                nZ = function(e, t, r) {
                    var n, i = new Map,
                        o = nE({
                            platform: nq
                        }, r),
                        a = nT(nE({}, o.platform), {
                            _c: i
                        });
                    return n = nT(nE({}, o), {
                        platform: a
                    }), rJ(function() {
                        var r, i, o, a, l, u, c, s, d, f, p, m, y, b, g, h, v, w, x, j, O, S, I, M, N, P;
                        return r5(this, function(E) {
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
                                    m = (p = r6(f = E.sent(), i, d)).x, y = p.y, b = i, g = {}, h = 0, v = 0, E.label = 3;
                                case 3:
                                    if (!(v < s.length)) return [3, 11];
                                    return x = (w = s[v]).name, [4, (0, w.fn)({
                                        x: m,
                                        y: y,
                                        initialPlacement: i,
                                        placement: b,
                                        strategy: a,
                                        middlewareData: g,
                                        rects: f,
                                        platform: c,
                                        elements: {
                                            reference: e,
                                            floating: t
                                        }
                                    })];
                                case 4:
                                    var T;
                                    if (O = (j = E.sent()).x, S = j.y, I = j.data, M = j.reset, m = null != O ? O : m, y = null != S ? S : y, g = r4(r1({}, g), r0({}, x, r1({}, g[x], I))), !(M && h <= 50)) return [3, 10];
                                    if (h++, (void 0 === M ? "undefined" : (T = M) && "u" > typeof Symbol && T.constructor === Symbol ? "symbol" : typeof T) != "object") return [3, 9];
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
                                    m = (P = r6(f, b, d)).x, y = P.y, E.label = 9;
                                case 9:
                                    v = -1, E.label = 10;
                                case 10:
                                    return v++, [3, 3];
                                case 11:
                                    return [2, {
                                        x: m,
                                        y: y,
                                        placement: b,
                                        strategy: a,
                                        middlewareData: g
                                    }]
                            }
                        })
                    })()
                },
                n$ = window.ReactDOM,
                nJ = r.n(n$);

            function n0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function n1(e) {
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

            function n2(e, t) {
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
                        if ("string" == typeof e) return n0(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return n0(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function n3(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var n5 = "u" > typeof document ? tr.useLayoutEffect : function() {};

            function n6(e, t) {
                if (e === t) return !0;
                if ((void 0 === e ? "undefined" : n3(e)) !== (void 0 === t ? "undefined" : n3(t))) return !1;
                if ("function" == typeof e && e.toString() === t.toString()) return !0;
                if (e && t && (void 0 === e ? "undefined" : n3(e)) === "object") {
                    if (Array.isArray(e)) {
                        if ((r = e.length) !== t.length) return !1;
                        for (n = r; 0 != n--;)
                            if (!n6(e[n], t[n])) return !1;
                        return !0
                    }
                    if ((r = (i = Object.keys(e)).length) !== Object.keys(t).length) return !1;
                    for (n = r; 0 != n--;)
                        if (!({}).hasOwnProperty.call(t, i[n])) return !1;
                    for (n = r; 0 != n--;) {
                        var r, n, i, o = i[n];
                        if (("_owner" !== o || !e.$$typeof) && !n6(e[o], t[o])) return !1
                    }
                    return !0
                }
                return e != e && t != t
            }

            function n8(e) {
                return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
            }

            function n9(e, t) {
                var r = n8(e);
                return Math.round(t * r) / r
            }

            function n7(e) {
                var t = tr.useRef(e);
                return n5(function() {
                    t.current = e
                }), t
            }
            var ie = function(e, t) {
                    var r;
                    return n4(n1({}, (void 0 === (r = e) && (r = 0), {
                        name: "offset",
                        options: r,
                        fn: function(e) {
                            return rJ(function() {
                                var t, n, i, o, a, l, u;
                                return r5(this, function(c) {
                                    switch (c.label) {
                                        case 0:
                                            var s;
                                            return i = e.x, o = e.y, a = e.placement, l = e.middlewareData, [4, (s = r, rJ(function() {
                                                var t, r, n, i, o, a, l, u, c, d, f, p, m, y;
                                                return r5(this, function(b) {
                                                    switch (b.label) {
                                                        case 0:
                                                            return t = e.placement, r = e.platform, n = e.elements, [4, null == r.isRTL ? void 0 : r.isRTL(n.floating)];
                                                        case 1:
                                                            return i = b.sent(), o = rU(t), a = rz(t), l = "y" === rF(t), u = ne.has(o) ? -1 : 1, c = i && l ? -1 : 1, p = (f = "number" == typeof(d = rk(s, e)) ? {
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
                                                data: r4(r1({}, u), {
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
                it = function(e, t) {
                    var r;
                    return n4(n1({}, (void 0 === (r = e) && (r = {}), {
                        name: "shift",
                        options: r,
                        fn: function(e) {
                            return rJ(function() {
                                var t, n, i, o, a, l, u, c, s, d, f, p, m, y, b, g, h, v, w, x, j, O, S, I, M, N, P, E;
                                return r5(this, function(T) {
                                    switch (T.label) {
                                        case 0:
                                            return t = e.x, n = e.y, i = e.placement, l = void 0 === (a = (o = rk(r, e)).mainAxis) || a, c = void 0 !== (u = o.crossAxis) && u, d = void 0 === (s = o.limiter) ? {
                                                fn: function(e) {
                                                    return {
                                                        x: e.x,
                                                        y: e.y
                                                    }
                                                }
                                            } : s, f = r2(o, ["mainAxis", "crossAxis", "limiter"]), p = {
                                                x: t,
                                                y: n
                                            }, [4, r8(e, f)];
                                        case 1:
                                            return m = T.sent(), g = p[b = r_(y = rF(rU(i)))], h = p[y], l && (v = "y" === b ? "top" : "left", w = "y" === b ? "bottom" : "right", x = g + m[v], j = g - m[w], g = rT(x, rE(g, j))), c && (O = "y" === y ? "top" : "left", S = "y" === y ? "bottom" : "right", I = h + m[O], M = h - m[S], h = rT(I, rE(h, M))), P = d.fn(r4(r1({}, e), (r0(N = {}, b, g), r0(N, y, h), N))), [2, r4(r1({}, P), {
                                                data: {
                                                    x: P.x - t,
                                                    y: P.y - n,
                                                    enabled: (r0(E = {}, b, l), r0(E, y, c), E)
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
                ir = function(e, t) {
                    var r;
                    return n4(n1({}, (void 0 === (r = e) && (r = {}), {
                        options: r,
                        fn: function(e) {
                            var t, n = e.x,
                                i = e.y,
                                o = e.placement,
                                a = e.rects,
                                l = e.middlewareData,
                                u = rk(r, e),
                                c = u.offset,
                                s = u.mainAxis,
                                d = u.crossAxis,
                                f = {
                                    x: n,
                                    y: i
                                },
                                p = rF(o),
                                m = r_(p),
                                y = f[m],
                                b = f[p],
                                g = rk(void 0 === c ? 0 : c, e),
                                h = "number" == typeof g ? {
                                    mainAxis: g,
                                    crossAxis: 0
                                } : r1({
                                    mainAxis: 0,
                                    crossAxis: 0
                                }, g);
                            if (void 0 === s || s) {
                                var v = "y" === m ? "height" : "width",
                                    w = a.reference[m] - a.floating[v] + h.mainAxis,
                                    x = a.reference[m] + a.reference[v] - h.mainAxis;
                                y < w ? y = w : y > x && (y = x)
                            }
                            if (void 0 === d || d) {
                                var j, O, S = "y" === m ? "width" : "height",
                                    I = ne.has(rU(o)),
                                    M = a.reference[p] - a.floating[S] + (I && (null == (j = l.offset) ? void 0 : j[p]) || 0) + (I ? 0 : h.crossAxis),
                                    N = a.reference[p] + a.reference[S] + (I ? 0 : (null == (O = l.offset) ? void 0 : O[p]) || 0) - (I ? h.crossAxis : 0);
                                b < M ? b = M : b > N && (b = N)
                            }
                            return r0(t = {}, m, y), r0(t, p, b), t
                        }
                    })), {
                        options: [e, t]
                    })
                },
                ii = function(e, t) {
                    var r;
                    return n4(n1({}, (void 0 === (r = e) && (r = {}), {
                        name: "flip",
                        options: r,
                        fn: function(e) {
                            return rJ(function() {
                                var t, n, i, o, a, l, u, c, s, d, f, p, m, y, b, g, h, v, w, x, j, O, S, I, M, N, P, E, T, D, A, L, C, R, k, U, z, _, B, Y;
                                return r5(this, function(F) {
                                    var G, W, Q, V, q, K, H, X, Z, $, J, ee, et, er, en;
                                    switch (F.label) {
                                        case 0:
                                            if (i = e.placement, o = e.middlewareData, a = e.rects, l = e.initialPlacement, u = e.platform, c = e.elements, f = void 0 === (d = (s = rk(r, e)).mainAxis) || d, m = void 0 === (p = s.crossAxis) || p, y = s.fallbackPlacements, g = void 0 === (b = s.fallbackStrategy) ? "bestFit" : b, v = void 0 === (h = s.fallbackAxisSideDirection) ? "none" : h, x = void 0 === (w = s.flipAlignment) || w, j = r2(s, ["mainAxis", "crossAxis", "fallbackPlacements", "fallbackStrategy", "fallbackAxisSideDirection", "flipAlignment"]), null != (t = o.arrow) && t.alignmentOffset) return [2, {}];
                                            return O = rU(i), S = rF(l), I = rU(l) === l, [4, null == u.isRTL ? void 0 : u.isRTL(c.floating)];
                                        case 1:
                                            return M = F.sent(), N = y || (I || !x ? [rK(l)] : (W = rK(G = l), [rG(G), W, rG(W)])), P = "none" !== v, !y && P && (E = N).push.apply(E, r3((Q = l, V = x, q = v, K = M, H = rz(Q), X = function(e, t, r) {
                                                switch (e) {
                                                    case "top":
                                                    case "bottom":
                                                        if (r) return t ? rQ : rW;
                                                        return t ? rW : rQ;
                                                    case "left":
                                                    case "right":
                                                        return t ? rV : rq;
                                                    default:
                                                        return []
                                                }
                                            }(rU(Q), "start" === q, K), H && (X = X.map(function(e) {
                                                return e + "-" + H
                                            }), V && (X = X.concat(X.map(rG)))), X))), T = [l].concat(r3(N)), [4, r8(e, j)];
                                        case 2:
                                            if (D = F.sent(), A = [], L = (null == (n = o.flip) ? void 0 : n.overflows) || [], f && A.push(D[O]), m && (Z = i, $ = a, void 0 === (J = M) && (J = !1), ee = rz(Z), er = rB(et = r_(rF(Z))), en = "x" === et ? ee === (J ? "end" : "start") ? "right" : "left" : "start" === ee ? "bottom" : "top", $.reference[er] > $.floating[er] && (en = rK(en)), C = [en, rK(en)], A.push(D[C[0]], D[C[1]])), L = r3(L).concat([{
                                                    placement: i,
                                                    overflows: A
                                                }]), !A.every(function(e) {
                                                    return e <= 0
                                                })) {
                                                if ((z = T[U = ((null == (R = o.flip) ? void 0 : R.index) || 0) + 1]) && ("alignment" !== m || S === rF(z) || L.every(function(e) {
                                                        return rF(e.placement) !== S || e.overflows[0] > 0
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
                                                    })[0]) ? void 0 : k.placement)) switch (g) {
                                                    case "bestFit":
                                                        (Y = null == (B = L.filter(function(e) {
                                                            if (P) {
                                                                var t = rF(e.placement);
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
                io = function(e, t) {
                    var r;
                    return n4(n1({}, (void 0 === (r = e) && (r = {}), {
                        name: "size",
                        options: r,
                        fn: function(e) {
                            return rJ(function() {
                                var t, n, i, o, a, l, u, c, s, d, f, p, m, y, b, g, h, v, w, x, j, O, S, I, M, N, P, E, T, D;
                                return r5(this, function(A) {
                                    switch (A.label) {
                                        case 0:
                                            return i = e.placement, o = e.rects, a = e.platform, l = e.elements, s = void 0 === (c = (u = rk(r, e)).apply) ? function() {} : c, [4, r8(e, r2(u, ["apply"]))];
                                        case 1:
                                            if (d = A.sent(), f = rU(i), p = rz(i), m = "y" === rF(i), b = (y = o.floating).width, g = y.height, "top" !== f && "bottom" !== f) return [3, 3];
                                            return h = f, [4, null == a.isRTL ? void 0 : a.isRTL(l.floating)];
                                        case 2:
                                            return v = p === (A.sent() ? "start" : "end") ? "left" : "right", [3, 4];
                                        case 3:
                                            v = f, h = "end" === p ? "top" : "bottom", A.label = 4;
                                        case 4:
                                            return w = g - d.top - d.bottom, x = b - d.left - d.right, j = rE(g - d[h], w), O = rE(b - d[v], x), S = !e.middlewareData.shift, I = j, M = O, null != (t = e.middlewareData.shift) && t.enabled.x && (M = x), null != (n = e.middlewareData.shift) && n.enabled.y && (I = w), S && !p && (N = rT(d.left, 0), P = rT(d.right, 0), E = rT(d.top, 0), T = rT(d.bottom, 0), m ? M = b - 2 * (0 !== N || 0 !== P ? N + P : rT(d.left, d.right)) : I = g - 2 * (0 !== E || 0 !== T ? E + T : rT(d.top, d.bottom))), [4, s(r4(r1({}, e), {
                                                availableWidth: M,
                                                availableHeight: I
                                            }))];
                                        case 5:
                                            return A.sent(), [4, a.getDimensions(l.floating)];
                                        case 6:
                                            if (D = A.sent(), b !== D.width || g !== D.height) return [2, {
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
                ia = function(e, t) {
                    var r;
                    return n4(n1({}, (void 0 === (r = e) && (r = {}), {
                        name: "hide",
                        options: r,
                        fn: function(e) {
                            return rJ(function() {
                                var t, n, i, o, a, l, u;
                                return r5(this, function(c) {
                                    switch (c.label) {
                                        case 0:
                                            switch (t = e.rects, o = void 0 === (i = (n = rk(r, e)).strategy) ? "referenceHidden" : i, a = r2(n, ["strategy"]), o) {
                                                case "referenceHidden":
                                                    return [3, 1];
                                                case "escaped":
                                                    return [3, 3]
                                            }
                                            return [3, 5];
                                        case 1:
                                            return [4, r8(e, r4(r1({}, a), {
                                                elementContext: "reference"
                                            }))];
                                        case 2:
                                            return [2, {
                                                data: {
                                                    referenceHiddenOffsets: l = r9(c.sent(), t.reference),
                                                    referenceHidden: r7(l)
                                                }
                                            }];
                                        case 3:
                                            return [4, r8(e, r4(r1({}, a), {
                                                altBoundary: !0
                                            }))];
                                        case 4:
                                            return [2, {
                                                data: {
                                                    escapedOffsets: u = r9(c.sent(), t.floating),
                                                    escaped: r7(u)
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
                il = function(e, t) {
                    return n4(n1({}, {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            var r = "function" == typeof e ? e(t) : e,
                                n = r.element,
                                i = r.padding;
                            return n && ({}).hasOwnProperty.call(n, "current") ? null != n.current ? nX({
                                element: n.current,
                                padding: i
                            }).fn(t) : {} : n ? nX({
                                element: n,
                                padding: i
                            }).fn(t) : {}
                        }
                    }), {
                        options: [e, t]
                    })
                };

            function iu(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ic(e) {
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

            function is(e, t) {
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

            function id(e, t) {
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

            function ip(e) {
                return function(e) {
                    if (Array.isArray(e)) return iu(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return iu(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iu(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var im = tr.forwardRef(function(e, t) {
                var r = e.children,
                    n = id(e, ["children"]),
                    i = tr.Children.toArray(r),
                    o = i.find(ig);
                if (o) {
                    var a = o.props.children,
                        l = i.map(function(e) {
                            return e !== o ? e : tr.Children.count(a) > 1 ? tr.Children.only(null) : tr.isValidElement(a) ? a.props.children : null
                        });
                    return (0, O.jsx)(iy, is(ic({}, n), {
                        ref: t,
                        children: tr.isValidElement(a) ? tr.cloneElement(a, void 0, l) : null
                    }))
                }
                return (0, O.jsx)(iy, is(ic({}, n), {
                    ref: t,
                    children: r
                }))
            });
            im.displayName = "Slot";
            var iy = tr.forwardRef(function(e, t) {
                var r = e.children,
                    n = id(e, ["children"]);
                if (tr.isValidElement(r)) {
                    var i, o, a, l, u, c = (u = (l = null == (o = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (u = (l = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref;
                    return tr.cloneElement(r, is(ic({}, function(e, t) {
                        var r = ic({}, t);
                        for (var n in t) ! function(n) {
                            var i = e[n],
                                o = t[n];
                            /^on[A-Z]/.test(n) ? i && o ? r[n] = function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                o.apply(void 0, ip(t)), i.apply(void 0, ip(t))
                            } : i && (r[n] = i) : "style" === n ? r[n] = ic({}, i, o) : "className" === n && (r[n] = [i, o].filter(Boolean).join(" "))
                        }(n);
                        return ic({}, e, r)
                    }(n, r.props)), {
                        ref: t ? ry(t, c) : c
                    }))
                }
                return tr.Children.count(r) > 1 ? tr.Children.only(null) : null
            });
            iy.displayName = "SlotClone";
            var ib = function(e) {
                var t = e.children;
                return (0, O.jsx)(O.Fragment, {
                    children: t
                })
            };

            function ig(e) {
                return tr.isValidElement(e) && e.type === ib
            }

            function ih(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function iv(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        ih(e, t, r[t])
                    })
                }
                return e
            }

            function iw(e, t) {
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
            var ix = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                    var r = tr.forwardRef(function(e, r) {
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
                            o = n ? im : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, O.jsx)(o, iw(iv({}, i), {
                            ref: r
                        }))
                    });
                    return r.displayName = "Primitive.".concat(t), iw(iv({}, e), ih({}, t, r))
                }, {}),
                ij = tr.forwardRef(function(e, t) {
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
                    return (0, O.jsx)(ix.svg, (r = function(e) {
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
                        children: e.asChild ? i : (0, O.jsx)("polygon", {
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

            function iO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iS(e) {
                var t = tr.useRef(e);
                return tr.useEffect(function() {
                    t.current = e
                }), tr.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), i = 0; i < r; i++) n[i] = arguments[i];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return iO(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return iO(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iO(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function iI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iN(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function iP(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        iN(e, t, r[t])
                    })
                }
                return e
            }

            function iE(e, t) {
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

            function iT(e, t) {
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

            function iD(e, t) {
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
                }(e, t) || iA(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function iA(e, t) {
                if (e) {
                    if ("string" == typeof e) return iM(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iM(e, t)
                }
            }
            ij.displayName = "Arrow";
            var iL = "Popper",
                iC = iD(rx(iL), 2),
                iR = iC[0],
                ik = iC[1],
                iU = iD(iR(iL), 2),
                iz = iU[0],
                i_ = iU[1],
                iB = function(e) {
                    var t = e.__scopePopper,
                        r = e.children,
                        n = iD(tr.useState(null), 2),
                        i = n[0],
                        o = n[1];
                    return (0, O.jsx)(iz, {
                        scope: t,
                        anchor: i,
                        onAnchorChange: o,
                        children: r
                    })
                };
            iB.displayName = iL;
            var iY = "PopperAnchor",
                iF = tr.forwardRef(function(e, t) {
                    var r = e.__scopePopper,
                        n = e.virtualRef,
                        i = iT(e, ["__scopePopper", "virtualRef"]),
                        o = i_(iY, r),
                        a = tr.useRef(null),
                        l = rb(t, a);
                    return tr.useEffect(function() {
                        o.onAnchorChange((null == n ? void 0 : n.current) || a.current)
                    }), n ? null : (0, O.jsx)(ix.div, iE(iP({}, i), {
                        ref: l
                    }))
                });
            iF.displayName = iY;
            var iG = "PopperContent",
                iW = iD(iR(iG), 2),
                iQ = iW[0],
                iV = iW[1],
                iq = tr.forwardRef(function(e, t) {
                    var r, n, i, o, a, l, u, c, s, d, f, p, m, y, b, g, h, v, w, x, j, S, I, M, N, P, E, T, D, A, L, C, R, k, U, z, _, B, Y, F, G, W, Q, V, q, K, H, X, Z, $, J, ee, et, er, en, ei, eo = e.__scopePopper,
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
                        eg = void 0 === eb ? 0 : eb,
                        eh = e.sticky,
                        ev = e.hideWhenDetached,
                        ew = e.updatePositionStrategy,
                        ex = void 0 === ew ? "optimized" : ew,
                        ej = e.onPlaced,
                        eO = iT(e, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        eS = i_(iG, eo),
                        eI = iD(tr.useState(null), 2),
                        eM = eI[0],
                        eN = eI[1],
                        eP = rb(t, function(e) {
                            return eN(e)
                        }),
                        eE = iD(tr.useState(null), 2),
                        eT = eE[0],
                        eD = eE[1],
                        eA = (i = (n = function(e) {
                            if (Array.isArray(e)) return e
                        }(r = tr.useState(void 0)) || function(e) {
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
                                if ("string" == typeof e) return iI(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iI(e, 2)
                            }
                        }(r) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], o = n[1], rS(function() {
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
                        eR = "number" == typeof eg ? eg : iP({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, eg),
                        ek = Array.isArray(ey) ? ey : [ey],
                        eU = ek.length > 0,
                        ez = {
                            padding: eR,
                            boundary: ek.filter(iZ),
                            altBoundary: eU
                        },
                        e_ = (u = void 0 === (l = (a = {
                            strategy: "fixed",
                            placement: (void 0 === ea ? "bottom" : ea) + ("center" !== ec ? "-" + ec : ""),
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return nH.apply(void 0, ((function(e) {
                                    if (Array.isArray(e)) return iM(e)
                                })(t) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(t) || iA(t) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()).concat([{
                                    animationFrame: "always" === ex
                                }]))
                            },
                            elements: {
                                reference: eS.anchor
                            },
                            middleware: [ie({
                                mainAxis: (void 0 === el ? 0 : el) + eC,
                                alignmentAxis: void 0 === es ? 0 : es
                            }), ep && it(iP({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === eh ? "partial" : eh) ? ir() : void 0
                            }, ez)), ep && ii(iP({}, ez)), io(iE(iP({}, ez), {
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
                            })), eT && il({
                                element: eT,
                                padding: void 0 === ed ? 0 : ed
                            }), i$({
                                arrowWidth: eL,
                                arrowHeight: eC
                            }), void 0 !== ev && ev && ia(iP({
                                strategy: "referenceHidden"
                            }, ez))]
                        }).placement) ? "bottom" : l, s = void 0 === (c = a.strategy) ? "absolute" : c, f = void 0 === (d = a.middleware) ? [] : d, p = a.platform, b = (y = void 0 === (m = a.elements) ? {} : m).reference, g = y.floating, v = void 0 === (h = a.transform) || h, w = a.whileElementsMounted, x = a.open, S = (j = n2(tr.useState({
                            x: 0,
                            y: 0,
                            strategy: s,
                            placement: u,
                            middlewareData: {},
                            isPositioned: !1
                        }), 2))[0], I = j[1], N = (M = n2(tr.useState(f), 2))[0], P = M[1], n6(N, f) || P(f), T = (E = n2(tr.useState(null), 2))[0], D = E[1], L = (A = n2(tr.useState(null), 2))[0], C = A[1], R = tr.useCallback(function(e) {
                            e !== _.current && (_.current = e, D(e))
                        }, []), k = tr.useCallback(function(e) {
                            e !== B.current && (B.current = e, C(e))
                        }, []), U = b || T, z = g || L, _ = tr.useRef(null), B = tr.useRef(null), Y = tr.useRef(S), F = null != w, G = n7(w), W = n7(p), Q = n7(x), V = tr.useCallback(function() {
                            if (_.current && B.current) {
                                var e = {
                                    placement: u,
                                    strategy: s,
                                    middleware: N
                                };
                                W.current && (e.platform = W.current), nZ(_.current, B.current, e).then(function(e) {
                                    var t = n4(n1({}, e), {
                                        isPositioned: !1 !== Q.current
                                    });
                                    q.current && !n6(Y.current, t) && (Y.current = t, n$.flushSync(function() {
                                        I(t)
                                    }))
                                })
                            }
                        }, [N, u, s, W, Q]), n5(function() {
                            !1 === x && Y.current.isPositioned && (Y.current.isPositioned = !1, I(function(e) {
                                return n4(n1({}, e), {
                                    isPositioned: !1
                                })
                            }))
                        }, [x]), q = tr.useRef(!1), n5(function() {
                            return q.current = !0,
                                function() {
                                    q.current = !1
                                }
                        }, []), n5(function() {
                            if (U && (_.current = U), z && (B.current = z), U && z) {
                                if (G.current) return G.current(U, z, V);
                                V()
                            }
                        }, [U, z, V, G, F]), K = tr.useMemo(function() {
                            return {
                                reference: _,
                                floating: B,
                                setReference: R,
                                setFloating: k
                            }
                        }, [R, k]), H = tr.useMemo(function() {
                            return {
                                reference: U,
                                floating: z
                            }
                        }, [U, z]), X = tr.useMemo(function() {
                            var e = {
                                position: s,
                                left: 0,
                                top: 0
                            };
                            if (!H.floating) return e;
                            var t = n9(H.floating, S.x),
                                r = n9(H.floating, S.y);
                            return v ? n1(n4(n1({}, e), {
                                transform: "translate(" + t + "px, " + r + "px)"
                            }), n8(H.floating) >= 1.5 && {
                                willChange: "transform"
                            }) : {
                                position: s,
                                left: t,
                                top: r
                            }
                        }, [s, v, H.floating, S.x, S.y]), tr.useMemo(function() {
                            return n4(n1({}, S), {
                                update: V,
                                refs: K,
                                elements: H,
                                floatingStyles: X
                            })
                        }, [S, V, K, H, X])),
                        eB = e_.refs,
                        eY = e_.floatingStyles,
                        eF = e_.placement,
                        eG = e_.isPositioned,
                        eW = e_.middlewareData,
                        eQ = iD(iJ(eF), 2),
                        eV = eQ[0],
                        eq = eQ[1],
                        eK = iS(ej);
                    rS(function() {
                        eG && (null == eK || eK())
                    }, [eG, eK]);
                    var eH = null == (J = eW.arrow) ? void 0 : J.x,
                        eX = null == (ee = eW.arrow) ? void 0 : ee.y,
                        eZ = (null == (et = eW.arrow) ? void 0 : et.centerOffset) !== 0,
                        e$ = iD(tr.useState(), 2),
                        eJ = e$[0],
                        e0 = e$[1];
                    return rS(function() {
                        eM && e0(window.getComputedStyle(eM).zIndex)
                    }, [eM]), (0, O.jsx)("div", {
                        ref: eB.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: iP(iE(iP({}, eY), iN({
                            transform: eG ? eY.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: eJ
                        }, "--radix-popper-transform-origin", [null == (er = eW.transformOrigin) ? void 0 : er.x, null == (en = eW.transformOrigin) ? void 0 : en.y].join(" "))), (null == (ei = eW.hide) ? void 0 : ei.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, O.jsx)(iQ, {
                            scope: eo,
                            placedSide: eV,
                            onArrowChange: eD,
                            arrowX: eH,
                            arrowY: eX,
                            shouldHideArrow: eZ,
                            children: (0, O.jsx)(ix.div, iE(iP({
                                "data-side": eV,
                                "data-align": eq
                            }, eO), {
                                ref: eP,
                                style: iE(iP({}, eO.style), {
                                    animation: eG ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            iq.displayName = iG;
            var iK = "PopperArrow",
                iH = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                iX = tr.forwardRef(function(e, t) {
                    var r, n = e.__scopePopper,
                        i = iT(e, ["__scopePopper"]),
                        o = iV(iK, n),
                        a = iH[o.placedSide];
                    return (0, O.jsx)("span", {
                        ref: o.onArrowChange,
                        style: (iN(r = {
                            position: "absolute",
                            left: o.arrowX,
                            top: o.arrowY
                        }, a, 0), iN(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [o.placedSide]), iN(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [o.placedSide]), iN(r, "visibility", o.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, O.jsx)(ij, iE(iP({}, i), {
                            ref: t,
                            style: iE(iP({}, i.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function iZ(e) {
                return null !== e
            }
            iX.displayName = iK;
            var i$ = function(e) {
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
                            p = iD(iJ(l), 2),
                            m = p[0],
                            y = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [p[1]],
                            b = (null != (r = null == (o = c.arrow) ? void 0 : o.x) ? r : 0) + d / 2,
                            g = (null != (n = null == (a = c.arrow) ? void 0 : a.y) ? n : 0) + f / 2,
                            h = "",
                            v = "";
                        return "bottom" === m ? (h = s ? y : "".concat(b, "px"), v = "".concat(-f, "px")) : "top" === m ? (h = s ? y : "".concat(b, "px"), v = "".concat(u.floating.height + f, "px")) : "right" === m ? (h = "".concat(-f, "px"), v = s ? y : "".concat(g, "px")) : "left" === m && (h = "".concat(u.floating.width + f, "px"), v = s ? y : "".concat(g, "px")), {
                            data: {
                                x: h,
                                y: v
                            }
                        }
                    }
                }
            };

            function iJ(e) {
                var t = iD(e.split("-"), 2),
                    r = t[0],
                    n = t[1];
                return [r, void 0 === n ? "center" : n]
            }

            function i0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var i1 = tr.forwardRef(function(e, t) {
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
                    }(r = tr.useState(!1)) || function(e) {
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
                            if ("string" == typeof e) return i0(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return i0(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = c[0],
                    d = c[1];
                rS(function() {
                    return d(!0)
                }, []);
                var f = l || s && (null == (a = globalThis) || null == (o = a.document) ? void 0 : o.body);
                return f ? nJ().createPortal((0, O.jsx)(ix.div, (n = function(e) {
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

            function i4(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function i2(e, t) {
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
                        if ("string" == typeof e) return i4(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return i4(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            i1.displayName = "Portal";
            var i3 = function(e) {
                var t, r, n, i, o, a, l, u, c, s, d, f, p, m, y, b, g, h = e.present,
                    v = e.children,
                    w = (t = h, o = (i = i2(tr.useState(), 2))[0], a = i[1], l = tr.useRef({}), u = tr.useRef(t), c = tr.useRef("none"), d = (s = i2((r = t ? "mounted" : "unmounted", n = {
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
                    }, tr.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], f = s[1], tr.useEffect(function() {
                        var e = i5(l.current);
                        c.current = "mounted" === d ? e : "none"
                    }, [d]), rS(function() {
                        var e = l.current,
                            r = u.current;
                        if (r !== t) {
                            var n = c.current,
                                i = i5(e);
                            t ? f("MOUNT") : "none" === i || (null == e ? void 0 : e.display) === "none" ? f("UNMOUNT") : r && n !== i ? f("ANIMATION_OUT") : f("UNMOUNT"), u.current = t
                        }
                    }, [t, f]), rS(function() {
                        if (o) {
                            var e, t, r = null != (e = o.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = i5(l.current).includes(e.animationName);
                                    if (e.target === o && n && (f("ANIMATION_END"), !u.current)) {
                                        var i = o.style.animationFillMode;
                                        o.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === o.style.animationFillMode && (o.style.animationFillMode = i)
                                        })
                                    }
                                },
                                i = function(e) {
                                    e.target === o && (c.current = i5(l.current))
                                };
                            return o.addEventListener("animationstart", i), o.addEventListener("animationcancel", n), o.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), o.removeEventListener("animationstart", i), o.removeEventListener("animationcancel", n), o.removeEventListener("animationend", n)
                                }
                        }
                        f("ANIMATION_END")
                    }, [o, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: tr.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    x = "function" == typeof v ? v({
                        present: w.isPresent
                    }) : tr.Children.only(v),
                    j = rb(w.ref, (g = (b = null == (m = Object.getOwnPropertyDescriptor((p = x).props, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning) ? p.ref : (g = (b = null == (y = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : y.get) && "isReactWarning" in b && b.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof v || w.isPresent ? tr.cloneElement(x, {
                    ref: j
                }) : null
            };

            function i5(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function i6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function i8(e, t) {
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
                        if ("string" == typeof e) return i6(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return i6(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function i9(e) {
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
            i3.displayName = "Presence";
            var i7 = tr.forwardRef(function(e, t) {
                var r, n;
                return (0, O.jsx)(ix.span, (r = i9({}, e), n = n = {
                    ref: t,
                    style: i9({
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

            function oe(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ot(e) {
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

            function or(e, t) {
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

            function on(e, t) {
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

            function oi(e, t) {
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
                }(e, t) || oa(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oo(e) {
                return function(e) {
                    if (Array.isArray(e)) return oe(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || oa(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oa(e, t) {
                if (e) {
                    if ("string" == typeof e) return oe(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oe(e, t)
                }
            }
            i7.displayName = "VisuallyHidden";
            var ol = oi(rx("Tooltip", [ik]), 2),
                ou = ol[0];
            ol[1];
            var oc = ik(),
                os = "TooltipProvider",
                od = "tooltip.open",
                of = oi(ou(os), 2),
                op = of [0],
                om = of [1],
                oy = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.delayDuration,
                        n = e.skipDelayDuration,
                        i = void 0 === n ? 300 : n,
                        o = e.disableHoverableContent,
                        a = e.children,
                        l = oi(tr.useState(!0), 2),
                        u = l[0],
                        c = l[1],
                        s = tr.useRef(!1),
                        d = tr.useRef(0);
                    return tr.useEffect(function() {
                        var e = d.current;
                        return function() {
                            return window.clearTimeout(e)
                        }
                    }, []), (0, O.jsx)(op, {
                        scope: t,
                        isOpenDelayed: u,
                        delayDuration: void 0 === r ? 700 : r,
                        onOpen: tr.useCallback(function() {
                            window.clearTimeout(d.current), c(!1)
                        }, []),
                        onClose: tr.useCallback(function() {
                            window.clearTimeout(d.current), d.current = window.setTimeout(function() {
                                return c(!0)
                            }, i)
                        }, [i]),
                        isPointerInTransitRef: s,
                        onPointerInTransitChange: tr.useCallback(function(e) {
                            s.current = e
                        }, []),
                        disableHoverableContent: void 0 !== o && o,
                        children: a
                    })
                };
            oy.displayName = os;
            var ob = "Tooltip",
                og = oi(ou(ob), 2),
                oh = og[0],
                ov = og[1],
                ow = function(e) {
                    var t, r, n, i, o, a, l, u, c, s, d, f, p, m, y, b, g, h, v, w, x, j = e.__scopeTooltip,
                        S = e.children,
                        I = e.open,
                        M = e.defaultOpen,
                        N = e.onOpenChange,
                        P = e.disableHoverableContent,
                        E = e.delayDuration,
                        T = om(ob, e.__scopeTooltip),
                        D = oc(j),
                        A = oi(tr.useState(null), 2),
                        L = A[0],
                        C = A[1],
                        R = (s = (c = function(e) {
                            if (Array.isArray(e)) return e
                        }(u = tr.useState(rM())) || function(e) {
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
                                if ("string" == typeof e) return rI(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rI(e, 2)
                            }
                        }(u) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], d = c[1], rS(function() {
                            d(function(e) {
                                return null != e ? e : String(rN++)
                            })
                        }, [void 0]), s ? "radix-".concat(s) : ""),
                        k = tr.useRef(0),
                        U = null != P ? P : T.disableHoverableContent,
                        z = null != E ? E : T.delayDuration,
                        _ = tr.useRef(!1),
                        B = oi((p = (f = {
                            prop: I,
                            defaultProp: void 0 !== M && M,
                            onChange: function(e) {
                                e ? (T.onOpen(), document.dispatchEvent(new CustomEvent(od))) : T.onClose(), null == N || N(e)
                            }
                        }).prop, g = (b = i8((r = (t = {
                            defaultProp: f.defaultProp,
                            onChange: y = void 0 === (m = f.onChange) ? function() {} : m
                        }).defaultProp, n = t.onChange, o = i8(i = tr.useState(r), 1)[0], a = tr.useRef(o), l = iS(n), tr.useEffect(function() {
                            a.current !== o && (l(o), a.current = o)
                        }, [o, a, l]), i), 2))[0], h = b[1], w = (v = void 0 !== p) ? p : g, x = iS(y), [w, tr.useCallback(function(e) {
                            if (v) {
                                var t = "function" == typeof e ? e(p) : e;
                                t !== p && x(t)
                            } else h(e)
                        }, [v, p, h, x])]), 2),
                        Y = B[0],
                        F = void 0 !== Y && Y,
                        G = B[1],
                        W = tr.useMemo(function() {
                            return F ? _.current ? "delayed-open" : "instant-open" : "closed"
                        }, [F]),
                        Q = tr.useCallback(function() {
                            window.clearTimeout(k.current), k.current = 0, _.current = !1, G(!0)
                        }, [G]),
                        V = tr.useCallback(function() {
                            window.clearTimeout(k.current), k.current = 0, G(!1)
                        }, [G]),
                        q = tr.useCallback(function() {
                            window.clearTimeout(k.current), k.current = window.setTimeout(function() {
                                _.current = !0, G(!0), k.current = 0
                            }, z)
                        }, [z, G]);
                    return tr.useEffect(function() {
                        return function() {
                            k.current && (window.clearTimeout(k.current), k.current = 0)
                        }
                    }, []), (0, O.jsx)(iB, or(ot({}, D), {
                        children: (0, O.jsx)(oh, {
                            scope: j,
                            contentId: R,
                            open: F,
                            stateAttribute: W,
                            trigger: L,
                            onTriggerChange: C,
                            onTriggerEnter: tr.useCallback(function() {
                                T.isOpenDelayed ? q() : Q()
                            }, [T.isOpenDelayed, q, Q]),
                            onTriggerLeave: tr.useCallback(function() {
                                U ? V() : (window.clearTimeout(k.current), k.current = 0)
                            }, [V, U]),
                            onOpen: Q,
                            onClose: V,
                            disableHoverableContent: U,
                            children: S
                        })
                    }))
                };
            ow.displayName = ob;
            var ox = "TooltipTrigger",
                oj = tr.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = on(e, ["__scopeTooltip"]),
                        i = ov(ox, r),
                        o = om(ox, r),
                        a = oc(r),
                        l = rb(t, tr.useRef(null), i.onTriggerChange),
                        u = tr.useRef(!1),
                        c = tr.useRef(!1),
                        s = tr.useCallback(function() {
                            return u.current = !1
                        }, []);
                    return tr.useEffect(function() {
                        return function() {
                            return document.removeEventListener("pointerup", s)
                        }
                    }, [s]), (0, O.jsx)(iF, or(ot({
                        asChild: !0
                    }, a), {
                        children: (0, O.jsx)(ix.button, or(ot({
                            "aria-describedby": i.open ? i.contentId : void 0,
                            "data-state": i.stateAttribute
                        }, n), {
                            ref: l,
                            onPointerMove: rf(e.onPointerMove, function(e) {
                                "touch" !== e.pointerType && (c.current || o.isPointerInTransitRef.current || (i.onTriggerEnter(), c.current = !0))
                            }),
                            onPointerLeave: rf(e.onPointerLeave, function() {
                                i.onTriggerLeave(), c.current = !1
                            }),
                            onPointerDown: rf(e.onPointerDown, function() {
                                u.current = !0, document.addEventListener("pointerup", s, {
                                    once: !0
                                })
                            }),
                            onFocus: rf(e.onFocus, function() {
                                u.current || i.onOpen()
                            }),
                            onBlur: rf(e.onBlur, i.onClose),
                            onClick: rf(e.onClick, i.onClose)
                        }))
                    }))
                });
            oj.displayName = ox;
            var oO = "TooltipPortal",
                oS = oi(ou(oO, {
                    forceMount: void 0
                }), 2),
                oI = oS[0],
                oM = oS[1],
                oN = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.forceMount,
                        n = e.children,
                        i = e.container,
                        o = ov(oO, t);
                    return (0, O.jsx)(oI, {
                        scope: t,
                        forceMount: r,
                        children: (0, O.jsx)(i3, {
                            present: r || o.open,
                            children: (0, O.jsx)(i1, {
                                asChild: !0,
                                container: i,
                                children: n
                            })
                        })
                    })
                };
            oN.displayName = oO;
            var oP = "TooltipContent",
                oE = tr.forwardRef(function(e, t) {
                    var r = oM(oP, e.__scopeTooltip),
                        n = e.forceMount,
                        i = void 0 === n ? r.forceMount : n,
                        o = e.side,
                        a = void 0 === o ? "top" : o,
                        l = on(e, ["forceMount", "side"]),
                        u = ov(oP, e.__scopeTooltip);
                    return (0, O.jsx)(i3, {
                        present: i || u.open,
                        children: u.disableHoverableContent ? (0, O.jsx)(oC, or(ot({
                            side: a
                        }, l), {
                            ref: t
                        })) : (0, O.jsx)(oT, or(ot({
                            side: a
                        }, l), {
                            ref: t
                        }))
                    })
                }),
                oT = tr.forwardRef(function(e, t) {
                    var r = ov(oP, e.__scopeTooltip),
                        n = om(oP, e.__scopeTooltip),
                        i = tr.useRef(null),
                        o = rb(t, i),
                        a = oi(tr.useState(null), 2),
                        l = a[0],
                        u = a[1],
                        c = r.trigger,
                        s = r.onClose,
                        d = i.current,
                        f = n.onPointerInTransitChange,
                        p = tr.useCallback(function() {
                            u(null), f(!1)
                        }, [f]),
                        m = tr.useCallback(function(e, t) {
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
                            u(((l = oo(p).concat(oo(m)).slice()).sort(function(e, t) {
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
                    return tr.useEffect(function() {
                        return function() {
                            return p()
                        }
                    }, [p]), tr.useEffect(function() {
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
                    }, [c, d, m, p]), tr.useEffect(function() {
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
                    }, [c, d, l, s, p]), (0, O.jsx)(oC, or(ot({}, e), {
                        ref: o
                    }))
                }),
                oD = oi(ou(ob, {
                    isInside: !1
                }), 2),
                oA = oD[0],
                oL = oD[1],
                oC = tr.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = e.children,
                        i = e["aria-label"],
                        o = e.onEscapeKeyDown,
                        a = e.onPointerDownOutside,
                        l = on(e, ["__scopeTooltip", "children", "aria-label", "onEscapeKeyDown", "onPointerDownOutside"]),
                        u = ov(oP, r),
                        c = oc(r),
                        s = u.onClose;
                    return tr.useEffect(function() {
                        return document.addEventListener(od, s),
                            function() {
                                return document.removeEventListener(od, s)
                            }
                    }, [s]), tr.useEffect(function() {
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
                    }, [u.trigger, s]), (0, O.jsx)(rO.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !1,
                        onEscapeKeyDown: o,
                        onPointerDownOutside: a,
                        onFocusOutside: function(e) {
                            return e.preventDefault()
                        },
                        onDismiss: s,
                        children: (0, O.jsxs)(iq, or(ot({
                            "data-state": u.stateAttribute
                        }, c, l), {
                            ref: t,
                            style: ot({}, l.style, {
                                "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                                "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                                "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                                "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                                "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                            }),
                            children: [(0, O.jsx)(ib, {
                                children: n
                            }), (0, O.jsx)(oA, {
                                scope: r,
                                isInside: !0,
                                children: (0, O.jsx)(i7, {
                                    id: u.contentId,
                                    role: "tooltip",
                                    children: i || n
                                })
                            })]
                        }))
                    })
                });
            oE.displayName = oP;
            var oR = "TooltipArrow",
                ok = tr.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = on(e, ["__scopeTooltip"]),
                        i = oc(r);
                    return oL(oR, r).isInside ? null : (0, O.jsx)(iX, or(ot({}, i, n), {
                        ref: t
                    }))
                });

            function oU(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oz(e) {
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
                            if ("string" == typeof e) return oU(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oU(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    p = f[0],
                    m = f[1],
                    y = null != a ? a : "string" == typeof i && null == o ? i : void 0;
                return tr.createElement(oy, {
                    delayDuration: void 0 === l ? 500 : l
                }, tr.createElement(ow, {
                    open: c,
                    onOpenChange: s
                }, u, tr.createElement(oN, null, tr.createElement(oE, {
                    side: p,
                    align: m,
                    "aria-label": y,
                    className: ti("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", d),
                    sideOffset: 5
                }, (void 0 === n || n) && tr.createElement(ok, {
                    asChild: !0
                }, tr.createElement(rd, {
                    className: "content-[var(--inverse-surface-0)]"
                })), tr.createElement("div", {
                    className: "flex flex-col text-truncate-split"
                }, tr.createElement("div", {
                    className: "text-caption-medium content-inverse-default"
                }, i), o && tr.createElement("div", {
                    className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
                }, o))))))
            }

            function o_(e) {
                var t = e.children,
                    r = e.asChild,
                    n = e.className;
                return tr.createElement(oj, {
                    asChild: r,
                    className: n
                }, t)
            }
            ok.displayName = oR;
            var oB = function(e) {
                    var t = e.title,
                        r = e.description,
                        n = e.position;
                    return tn().createElement(oz, {
                        position: void 0 === n ? "top-center" : n,
                        title: t,
                        description: r
                    }, tn().createElement(o_, {
                        asChild: !0
                    }, tn().createElement("span", {
                        role: "button",
                        tabIndex: 0,
                        "aria-label": t,
                        className: "flex items-center content-muted",
                        "data-testid": "label-tooltip-trigger"
                    }, tn().createElement(ts, {
                        name: "icon-regular-circle-i",
                        size: "Small"
                    }))))
                },
                oY = {
                    Standard: "bg-none",
                    Contrast: "bg-shift-200",
                    Utility: "bg-none"
                },
                oF = {
                    Standard: "stroke-standard",
                    Contrast: "stroke-none",
                    Utility: "stroke-none"
                };

            function oG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oW(e) {
                if (Array.isArray(e)) return e
            }

            function oQ(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function oV() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function oq(e, t) {
                if (e) {
                    if ("string" == typeof e) return oG(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oG(e, t)
                }
            }
            var oK = {
                    XSmall: "padding-x-small",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-medium"
                },
                oH = {
                    XSmall: "gap-x-xsmall",
                    Small: "gap-x-small",
                    Medium: "gap-x-small",
                    Large: "gap-x-small"
                },
                oX = {
                    XSmall: "height-600",
                    Small: "height-800",
                    Medium: "height-1000",
                    Large: "height-1200"
                },
                oZ = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                o$ = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                oJ = {
                    XSmall: ["text-body-small", "placeholder:text-body-small"],
                    Small: ["text-body-small", "placeholder:text-body-small"],
                    Medium: ["text-body-medium", "placeholder:text-body-medium"],
                    Large: ["text-body-large", "placeholder:text-body-large"]
                },
                o0 = (0, tr.forwardRef)(function(e, t) {
                    var r, n, i, o = oW(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || oq(r) || oV(),
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
                        g = a.size,
                        h = a.variant,
                        v = void 0 === h ? "Standard" : h,
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
                        P = (oW(l) || function(e) {
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
                        }(l) || oq(l, 1) || oV())[0],
                        E = rs(),
                        T = M || E,
                        D = "".concat(T, "-description"),
                        A = null != g ? g : "Large",
                        L = m || !!y,
                        C = y || b,
                        R = (0, tr.useMemo)(function() {
                            return s ? tn().createElement(ts, {
                                name: s,
                                size: A,
                                className: "content-emphasis",
                                "data-testid": "text-input-leading-icon"
                            }) : f
                        }, [s, f, A]),
                        k = (0, tr.useMemo)(function() {
                            return d ? tn().createElement(ts, {
                                name: d,
                                size: A,
                                className: "content-emphasis",
                                "data-testid": "text-input-trailing-icon"
                            }) : p
                        }, [A, d, p]),
                        U = u ? tn().createElement("label", {
                            htmlFor: T,
                            className: ti(o$[A], "content-emphasis")
                        }, u, w && tn().createElement(tn().Fragment, null, " ", tn().createElement("span", {
                            className: "content-default"
                        }, "*"))) : null;
                    return tn().createElement("div", {
                        "data-testid": "text-input-wrapper",
                        className: ti("flex width-full flex-col gap-small ".concat(j), oQ({}, tp, x)),
                        style: O
                    }, U && (c ? tn().createElement("div", {
                        className: "flex items-center gap-xsmall"
                    }, U, tn().createElement(oB, c)) : U), tn().createElement("div", {
                        "data-testid": "text-input-container",
                        className: ti("foundation-web-input flex items-center width-full", oF[v], oY[v], S, oX[A], oZ[A], oK[A], oH[A], L ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                        style: I
                    }, R, tn().createElement("input", (n = function(e) {
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
                    }({
                        type: "text",
                        id: T,
                        ref: P,
                        className: ti("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", oJ[A]),
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
                    }), n)), k), C && tn().createElement("span", {
                        id: D,
                        className: ti("text-caption-small", {
                            "content-system-alert": L,
                            "content-default": !L
                        })
                    }, C))
                });

            function o1(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function o4(e) {
                return function(e) {
                    if (Array.isArray(e)) return o1(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return o1(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return o1(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            o0.displayName = "TextInput";
            var o2 = "__FN_nvfToKPAOuiV__",
                o3 = new RegExp("".concat(o2, "(\\d+)\\|")),
                o5 = function(e, t, r, n) {
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
                            n = "".concat(o2).concat(r, "|"),
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
                                n = o3.exec(e);
                            if (!n) return [e];
                            n.index > 0 && r.push(e.slice(0, n.index));
                            var i = n[1] && o[n[1]];
                            if (!i) return console.warn("Unexpected malformed segment", t), [];
                            i.used = !0;
                            var a = e.indexOf(i.end);
                            if (-1 === a) return console.warn("Unexpected malformed segment", t), [];
                            var u = e.slice(n.index + n[0].length, a),
                                c = i.render(l(u));
                            Array.isArray(c) ? r.push.apply(r, o4(c)) : r.push(c);
                            var s = e.slice(a + i.end.length);
                            return s.length > 0 && r.push.apply(r, o4(l(s))), r
                        },
                        u = l(a).filter(function(e) {
                            return "" !== e
                        });
                    return Object.values(o).some(function(e) {
                        return !e.used
                    }) ? (console.warn("Unused segments found", t), []) : u.map(function(e, t) {
                        return (0, O.jsx)(tr.Fragment, {
                            children: e
                        }, t)
                    })
                };

            function o6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function o8(e) {
                if (Array.isArray(e)) return e
            }

            function o9() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function o7(e) {
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

            function ae(e, t) {
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

            function at(e, t) {
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

            function ar(e, t) {
                if (e) {
                    if ("string" == typeof e) return o6(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return o6(e, t)
                }
            }
            var an = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                ai = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                ao = {
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
                aa = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                al = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                au = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                ac = {
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
                as = {
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
                ad = (0, tr.forwardRef)(function(e, t) {
                    var r, n, i = o8(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || ar(r) || o9(),
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
                        g = void 0 === b ? "Emphasis" : b,
                        h = o.iconColor,
                        v = void 0 === h ? "Default" : h,
                        w = o.asChild,
                        x = o.children,
                        j = at(o, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]),
                        O = (o8(a) || function(e) {
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
                        }(a) || ar(a, 1) || o9())[0];
                    n = d ? al[g] : void 0 !== p && p ? au[g] : aa[g];
                    var S = ti("foundation-web-icon-button", d ? tp : [td, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", an[y], ao[y][void 0 !== f && f ? "circular" : "square"], n, l),
                        I = tn().createElement(tn().Fragment, null, tn().createElement(tf, null), tn().createElement("span", {
                            className: ti("icon", u, ai[y], d ? as[v][g] : ac[v][g])
                        }));
                    if (w) {
                        j.as;
                        var M = at(j, ["as"]),
                            N = tn().Children.only(x);
                        return tn().createElement(tP, ae(o7({
                            ref: O
                        }, M), {
                            className: S,
                            "aria-label": c,
                            "aria-disabled": d || void 0
                        }), tn().cloneElement(N, {}, I))
                    }
                    if ("a" === j.as) {
                        j.as;
                        var P = j.href,
                            E = at(j, ["as", "href"]);
                        return tn().createElement("a", ae(o7({
                            ref: O
                        }, E), {
                            "aria-label": c,
                            "aria-disabled": d,
                            href: d ? void 0 : P,
                            className: S
                        }), I)
                    }
                    j.as;
                    var T = at(j, ["as"]);
                    return tn().createElement("button", ae(o7({
                        ref: O,
                        type: "button"
                    }, T), {
                        "aria-label": c,
                        disabled: d,
                        className: S
                    }), I)
                });

            function af(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ap(e) {
                if (Array.isArray(e)) return e
            }

            function am() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ay(e) {
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

            function ab(e, t) {
                if (e) {
                    if ("string" == typeof e) return af(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return af(e, t)
                }
            }
            var ag = (0, tr.forwardRef)(function(e, t) {
                var r, n, i, o = ap(i = [e, t]) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(i) || ab(i) || am(),
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
                    y = (ap(l) || function(e) {
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
                    }(l) || ab(l, 1) || am())[0],
                    b = "vertical" === d,
                    g = {};
                return b || "Inset" !== p ? b || "InsetLeft" !== p ? b || "InsetRight" !== p || (g = {
                    marginRight: "var(--padding-xlarge)"
                }) : g = {
                    marginLeft: "var(--padding-xlarge)"
                } : g = {
                    marginLeft: "var(--padding-xlarge)",
                    marginRight: "var(--padding-xlarge)"
                }, tn().createElement("div", (r = ay({
                    ref: y
                }, m), n = n = {
                    role: "separator",
                    "data-orientation": d,
                    "aria-orientation": d,
                    style: ay({
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
                    }, g, c),
                    className: ti("stroke-default self-stretch", u)
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

            function ah(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    i = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === i || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function av(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aw(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function ax(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        aw(e, t, r[t])
                    })
                }
                return e
            }

            function aj(e, t) {
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

            function aO(e) {
                return function(e) {
                    if (Array.isArray(e)) return av(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return av(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return av(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function aS() {
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
                            return ax({}, e, n(t)["__scope".concat(i)])
                        }, {});
                        return tr.useMemo(function() {
                            return aw({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return i.scopeName = n.scopeName, i
            }
            ag.displayName = "Divider";
            var aI = (null == (x = globalThis) ? void 0 : x.document) ? tr.useLayoutEffect : function() {};

            function aM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var aN = tr[" useId ".trim().toString()] || function() {},
                aP = 0;

            function aE(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = tr.useState(aN())) || function(e) {
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
                            if ("string" == typeof e) return aM(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aM(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    i = r[1];
                return aI(function() {
                    e || i(function(e) {
                        return null != e ? e : String(aP++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function aT(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aD(e) {
                var t = tr.useRef(e);
                return tr.useEffect(function() {
                    t.current = e
                }), tr.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), i = 0; i < r; i++) n[i] = arguments[i];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return aT(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return aT(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aT(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function aA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aL(e, t) {
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
                        if ("string" == typeof e) return aA(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aA(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function aC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aR(e) {
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

            function ak(e, t) {
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

            function aU(e, t) {
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

            function az(e) {
                return function(e) {
                    if (Array.isArray(e)) return aC(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return aC(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aC(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function a_(e) {
                var t, r, n = (t = e, (r = tr.forwardRef(function(e, t) {
                        var r = e.children,
                            n = aU(e, ["children"]);
                        if (tr.isValidElement(r)) {
                            var i, o, a, l, u, c = (u = (l = null == (o = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (u = (l = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                                s = function(e, t) {
                                    var r = aR({}, t);
                                    for (var n in t) ! function(n) {
                                        var i = e[n],
                                            o = t[n];
                                        /^on[A-Z]/.test(n) ? i && o ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            o.apply(void 0, az(t)), i.apply(void 0, az(t))
                                        } : i && (r[n] = i) : "style" === n ? r[n] = aR({}, i, o) : "className" === n && (r[n] = [i, o].filter(Boolean).join(" "))
                                    }(n);
                                    return aR({}, e, r)
                                }(n, r.props);
                            return r.type !== tr.Fragment && (s.ref = t ? tg(t, c) : c), tr.cloneElement(r, s)
                        }
                        return tr.Children.count(r) > 1 ? tr.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    i = tr.forwardRef(function(e, t) {
                        var r = e.children,
                            i = aU(e, ["children"]),
                            o = tr.Children.toArray(r),
                            a = o.find(aY);
                        if (a) {
                            var l = a.props.children,
                                u = o.map(function(e) {
                                    return e !== a ? e : tr.Children.count(l) > 1 ? tr.Children.only(null) : tr.isValidElement(l) ? l.props.children : null
                                });
                            return (0, O.jsx)(n, ak(aR({}, i), {
                                ref: t,
                                children: tr.isValidElement(l) ? tr.cloneElement(l, void 0, u) : null
                            }))
                        }
                        return (0, O.jsx)(n, ak(aR({}, i), {
                            ref: t,
                            children: r
                        }))
                    });
                return i.displayName = "".concat(e, ".Slot"), i
            }
            var aB = Symbol("radix.slottable");

            function aY(e) {
                return tr.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === aB
            }

            function aF(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function aG(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        aF(e, t, r[t])
                    })
                }
                return e
            }

            function aW(e, t) {
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
            var aQ = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                var r = a_("Primitive.".concat(t)),
                    n = tr.forwardRef(function(e, n) {
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
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, O.jsx)(a, aW(aG({}, o), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), aW(aG({}, e), aF({}, t, n))
            }, {});

            function aV(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aq(e, t) {
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
                }(e, t) || aK(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function aK(e, t) {
                if (e) {
                    if ("string" == typeof e) return aV(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aV(e, t)
                }
            }
            var aH = "focusScope.autoFocusOnMount",
                aX = "focusScope.autoFocusOnUnmount",
                aZ = {
                    bubbles: !1,
                    cancelable: !0
                },
                a$ = tr.forwardRef(function(e, t) {
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
                        d = aq(tr.useState(null), 2),
                        f = d[0],
                        p = d[1],
                        m = aD(u),
                        y = aD(c),
                        b = tr.useRef(null),
                        g = th(t, function(e) {
                            return p(e)
                        }),
                        h = tr.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    tr.useEffect(function() {
                        if (l) {
                            var e = function(e) {
                                    if (!h.paused && f) {
                                        var t = e.target;
                                        f.contains(t) ? b.current = t : a1(b.current, {
                                            select: !0
                                        })
                                    }
                                },
                                t = function(e) {
                                    if (!h.paused && f) {
                                        var t = e.relatedTarget;
                                        null !== t && (f.contains(t) || a1(b.current, {
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
                                        for (var i, o = e[Symbol.iterator](); !(t = (i = o.next()).done); t = !0) i.value.removedNodes.length > 0 && a1(f)
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
                    }, [l, f, h.paused]), tr.useEffect(function() {
                        if (f) {
                            a4.add(h);
                            var e = document.activeElement;
                            if (!f.contains(e)) {
                                var t = new CustomEvent(aH, aZ);
                                f.addEventListener(aH, m), f.dispatchEvent(t), t.defaultPrevented || (function(e) {
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
                                            if (a1(s, {
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
                                }(aJ(f).filter(function(e) {
                                    return "A" !== e.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === e && a1(f))
                            }
                            return function() {
                                f.removeEventListener(aH, m), setTimeout(function() {
                                    var t = new CustomEvent(aX, aZ);
                                    f.addEventListener(aX, y), f.dispatchEvent(t), t.defaultPrevented || a1(null != e ? e : document.body, {
                                        select: !0
                                    }), f.removeEventListener(aX, y), a4.remove(h)
                                }, 0)
                            }
                        }
                    }, [f, m, y, h]);
                    var v = tr.useCallback(function(e) {
                        if ((o || l) && !h.paused) {
                            var t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                                r = document.activeElement;
                            if (t && r) {
                                var n, i, a = e.currentTarget,
                                    u = aq([a0(i = aJ(n = a), n), a0(i.reverse(), n)], 2),
                                    c = u[0],
                                    s = u[1];
                                c && s ? e.shiftKey || r !== s ? e.shiftKey && r === c && (e.preventDefault(), o && a1(s, {
                                    select: !0
                                })) : (e.preventDefault(), o && a1(c, {
                                    select: !0
                                })) : r === a && e.preventDefault()
                            }
                        }
                    }, [o, l, h.paused]);
                    return (0, O.jsx)(aQ.div, (r = function(e) {
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
                        ref: g,
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

            function aJ(e) {
                for (var t = [], r = document.createTreeWalker(e, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(e) {
                            var t = "INPUT" === e.tagName && "hidden" === e.type;
                            return e.disabled || e.hidden || t ? NodeFilter.FILTER_SKIP : e.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); r.nextNode();) t.push(r.currentNode);
                return t
            }

            function a0(e, t) {
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

            function a1(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = t.select;
                if (e && e.focus) {
                    var n, i, o, a = document.activeElement;
                    e.focus({
                        preventScroll: !0
                    }), e !== a && (i = n = e, null != (o = HTMLInputElement) && "u" > typeof Symbol && o[Symbol.hasInstance] ? !!o[Symbol.hasInstance](i) : i instanceof o) && "select" in n && void 0 !== r && r && e.select()
                }
            }
            a$.displayName = "FocusScope";
            var a4 = (t = [], {
                add: function(e) {
                    var r = t[0];
                    e !== r && (null == r || r.pause()), (t = a2(t, e)).unshift(e)
                },
                remove: function(e) {
                    var r;
                    null == (r = (t = a2(t, e))[0]) || r.resume()
                }
            });

            function a2(e, t) {
                var r = function(e) {
                        if (Array.isArray(e)) return aV(e)
                    }(e) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(e) || aK(e) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r.indexOf(t);
                return -1 !== n && r.splice(n, 1), r
            }

            function a3(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var a5 = tr.forwardRef(function(e, t) {
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
                    }(r = tr.useState(!1)) || function(e) {
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
                            if ("string" == typeof e) return a3(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return a3(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = c[0],
                    d = c[1];
                aI(function() {
                    return d(!0)
                }, []);
                var f = l || s && (null == (a = globalThis) || null == (o = a.document) ? void 0 : o.body);
                return f ? nJ().createPortal((0, O.jsx)(aQ.div, (n = function(e) {
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

            function a6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function a8(e, t) {
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
                        if ("string" == typeof e) return a6(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return a6(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            a5.displayName = "Portal";
            var a9 = function(e) {
                var t, r, n, i, o, a, l, u, c, s, d, f, p, m, y, b, g, h = e.present,
                    v = e.children,
                    w = (t = h, o = (i = a8(tr.useState(), 2))[0], a = i[1], l = tr.useRef({}), u = tr.useRef(t), c = tr.useRef("none"), d = (s = a8((r = t ? "mounted" : "unmounted", n = {
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
                    }, tr.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], f = s[1], tr.useEffect(function() {
                        var e = a7(l.current);
                        c.current = "mounted" === d ? e : "none"
                    }, [d]), aI(function() {
                        var e = l.current,
                            r = u.current;
                        if (r !== t) {
                            var n = c.current,
                                i = a7(e);
                            t ? f("MOUNT") : "none" === i || (null == e ? void 0 : e.display) === "none" ? f("UNMOUNT") : r && n !== i ? f("ANIMATION_OUT") : f("UNMOUNT"), u.current = t
                        }
                    }, [t, f]), aI(function() {
                        if (o) {
                            var e, t, r = null != (e = o.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = a7(l.current).includes(e.animationName);
                                    if (e.target === o && n && (f("ANIMATION_END"), !u.current)) {
                                        var i = o.style.animationFillMode;
                                        o.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === o.style.animationFillMode && (o.style.animationFillMode = i)
                                        })
                                    }
                                },
                                i = function(e) {
                                    e.target === o && (c.current = a7(l.current))
                                };
                            return o.addEventListener("animationstart", i), o.addEventListener("animationcancel", n), o.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), o.removeEventListener("animationstart", i), o.removeEventListener("animationcancel", n), o.removeEventListener("animationend", n)
                                }
                        }
                        f("ANIMATION_END")
                    }, [o, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: tr.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    x = "function" == typeof v ? v({
                        present: w.isPresent
                    }) : tr.Children.only(v),
                    j = th(w.ref, (g = (b = null == (m = Object.getOwnPropertyDescriptor((p = x).props, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning) ? p.ref : (g = (b = null == (y = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : y.get) && "isReactWarning" in b && b.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof v || w.isPresent ? tr.cloneElement(x, {
                    ref: j
                }) : null
            };

            function a7(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            a9.displayName = "Presence";
            var le = window.RadixUI["react-focus-guards"],
                lt = function() {
                    return (lt = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var i in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                        return e
                    }).apply(this, arguments)
                };

            function lr(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var i = 0, n = Object.getOwnPropertySymbols(e); i < n.length; i++) 0 > t.indexOf(n[i]) && Object.prototype.propertyIsEnumerable.call(e, n[i]) && (r[n[i]] = e[n[i]]);
                return r
            }
            var ln = "right-scroll-bar-position",
                li = "width-before-scroll-bar";

            function lo(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var la = "u" > typeof window ? tr.useLayoutEffect : tr.useEffect,
                ll = new WeakMap,
                lu = (void 0 === a && (a = {}), (void 0 === l && (l = function(e) {
                    return e
                }), u = [], c = !1, s = {
                    read: function() {
                        if (c) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return u.length ? u[u.length - 1] : null
                    },
                    useMedium: function(e) {
                        var t = l(e, c);
                        return u.push(t),
                            function() {
                                u = u.filter(function(e) {
                                    return e !== t
                                })
                            }
                    },
                    assignSyncMedium: function(e) {
                        for (c = !0; u.length;) {
                            var t = u;
                            u = [], t.forEach(e)
                        }
                        u = {
                            push: function(t) {
                                return e(t)
                            },
                            filter: function() {
                                return u
                            }
                        }
                    },
                    assignMedium: function(e) {
                        c = !0;
                        var t = [];
                        if (u.length) {
                            var r = u;
                            u = [], r.forEach(e), t = u
                        }
                        var n = function() {
                                var r = t;
                                t = [], r.forEach(e)
                            },
                            i = function() {
                                return Promise.resolve().then(n)
                            };
                        i(), u = {
                            push: function(e) {
                                t.push(e), i()
                            },
                            filter: function(e) {
                                return t = t.filter(e), u
                            }
                        }
                    }
                }).options = lt({
                    async: !0,
                    ssr: !1
                }, a), s),
                lc = function() {},
                ls = tr.forwardRef(function(e, t) {
                    var r, n, i, o, a = tr.useRef(null),
                        l = tr.useState({
                            onScrollCapture: lc,
                            onWheelCapture: lc,
                            onTouchMoveCapture: lc
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
                        g = e.noRelative,
                        h = e.noIsolation,
                        v = e.inert,
                        w = e.allowPinchZoom,
                        x = e.as,
                        j = e.gapMode,
                        O = lr(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        S = (r = [a, t], n = function(e) {
                            return r.forEach(function(t) {
                                return lo(t, e)
                            })
                        }, (i = (0, tr.useState)(function() {
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
                        })[0]).callback = n, o = i.facade, la(function() {
                            var e = ll.get(o);
                            if (e) {
                                var t = new Set(e),
                                    n = new Set(r),
                                    i = o.current;
                                t.forEach(function(e) {
                                    n.has(e) || lo(e, null)
                                }), n.forEach(function(e) {
                                    t.has(e) || lo(e, i)
                                })
                            }
                            ll.set(o, r)
                        }, [r]), o),
                        I = lt(lt({}, O), u);
                    return tr.createElement(tr.Fragment, null, m && tr.createElement(b, {
                        sideCar: lu,
                        removeScrollBar: p,
                        shards: y,
                        noRelative: g,
                        noIsolation: h,
                        inert: v,
                        setCallbacks: c,
                        allowPinchZoom: !!w,
                        lockRef: a,
                        gapMode: j
                    }), s ? tr.cloneElement(tr.Children.only(d), lt(lt({}, I), {
                        ref: S
                    })) : tr.createElement(void 0 === x ? "div" : x, lt({}, I, {
                        className: f,
                        ref: S
                    }), d))
                });
            ls.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, ls.classNames = {
                fullWidth: li,
                zeroRight: ln
            };
            var ld = function(e) {
                var t = e.sideCar,
                    r = lr(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var n = t.read();
                if (!n) throw Error("Sidecar medium not found");
                return tr.createElement(n, lt({}, r))
            };
            ld.isSideCarExport = !0;
            var lf = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(n) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = j || r.nc;
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
                lp = function() {
                    var e = lf();
                    return function(t, r) {
                        tr.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && r])
                    }
                },
                lm = function() {
                    var e = lp();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                ly = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                lb = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                lg = function(e) {
                    var t = window.getComputedStyle(document.body),
                        r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        n = t["padding" === e ? "paddingTop" : "marginTop"],
                        i = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [lb(r), lb(n), lb(i)]
                },
                lh = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return ly;
                    var t = lg(e),
                        r = document.documentElement.clientWidth,
                        n = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, n - r + t[2] - t[0])
                    }
                },
                lv = lm(),
                lw = "data-scroll-locked",
                lx = function(e, t, r, n) {
                    var i = e.left,
                        o = e.top,
                        a = e.right,
                        l = e.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(l, "px ").concat(n, ";\n  }\n  body[").concat(lw, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(i, "px;\n    padding-top: ").concat(o, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(ln, " {\n    right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(li, " {\n    margin-right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(ln, " .").concat(ln, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(li, " .").concat(li, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(lw, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                lj = function() {
                    var e = parseInt(document.body.getAttribute(lw) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                lO = function() {
                    tr.useEffect(function() {
                        return document.body.setAttribute(lw, (lj() + 1).toString()),
                            function() {
                                var e = lj() - 1;
                                e <= 0 ? document.body.removeAttribute(lw) : document.body.setAttribute(lw, e.toString())
                            }
                    }, [])
                },
                lS = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        n = e.gapMode,
                        i = void 0 === n ? "margin" : n;
                    lO();
                    var o = tr.useMemo(function() {
                        return lh(i)
                    }, [i]);
                    return tr.createElement(lv, {
                        styles: lx(o, !t, i, r ? "" : "!important")
                    })
                },
                lI = !1;
            if ("u" > typeof window) try {
                var lM = Object.defineProperty({}, "passive", {
                    get: function() {
                        return lI = !0, !0
                    }
                });
                window.addEventListener("test", lM, lM), window.removeEventListener("test", lM, lM)
            } catch (e) {
                lI = !1
            }
            var lN = !!lI && {
                passive: !1
            };

            function lP(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var lE = function(e, t) {
                    if (!lP(e, Element)) return !1;
                    var r = window.getComputedStyle(e);
                    return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
                },
                lT = function(e, t) {
                    var r = t.ownerDocument,
                        n = t;
                    do {
                        if ("u" > typeof ShadowRoot && lP(n, ShadowRoot) && (n = n.host), lD(e, n)) {
                            var i = lA(e, n);
                            if (i[1] > i[2]) return !0
                        }
                        n = n.parentNode
                    } while (n && n !== r.body);
                    return !1
                },
                lD = function(e, t) {
                    return "v" === e ? lE(t, "overflowY") : lE(t, "overflowX")
                },
                lA = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                lL = function(e, t, r, n, i) {
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
                        var m = lA(e, u),
                            y = m[0],
                            b = m[1] - m[2] - a * y;
                        (y || b) && lD(e, u) && (f += b, p += y);
                        var g = u.parentNode;
                        u = g && g.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? g.host : g
                    } while (!c && u !== document.body || c && (t.contains(u) || t === u));
                    return d && (i && 1 > Math.abs(f) || !i && l > f) ? s = !0 : !d && (i && 1 > Math.abs(p) || !i && -l > p) && (s = !0), s
                },
                lC = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                lR = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                lk = function(e) {
                    return e && "current" in e ? e.current : e
                },
                lU = 0,
                lz = [],
                l_ = (d = function(e) {
                    var t = tr.useRef([]),
                        r = tr.useRef([0, 0]),
                        n = tr.useRef(),
                        i = tr.useState(lU++)[0],
                        o = tr.useState(lm)[0],
                        a = tr.useRef(e);
                    tr.useEffect(function() {
                        a.current = e
                    }, [e]), tr.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(i));
                            var t = (function(e, t, r) {
                                if (r || 2 == arguments.length)
                                    for (var n, i = 0, o = t.length; i < o; i++) !n && i in t || (n || (n = Array.prototype.slice.call(t, 0, i)), n[i] = t[i]);
                                return e.concat(n || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(lk), !0).filter(Boolean);
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
                    var l = tr.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !a.current.allowPinchZoom;
                            var i, o = lC(e),
                                l = r.current,
                                u = "deltaX" in e ? e.deltaX : l[0] - o[0],
                                c = "deltaY" in e ? e.deltaY : l[1] - o[1],
                                s = e.target,
                                d = Math.abs(u) > Math.abs(c) ? "h" : "v";
                            if ("touches" in e && "h" === d && "range" === s.type) return !1;
                            var f = lT(d, s);
                            if (!f) return !0;
                            if (f ? i = d : (i = "v" === d ? "h" : "v", f = lT(d, s)), !f) return !1;
                            if (!n.current && "changedTouches" in e && (u || c) && (n.current = i), !i) return !0;
                            var p = n.current || i;
                            return lL(p, t, e, "h" === p ? u : c, !0)
                        }, []),
                        u = tr.useCallback(function(e) {
                            if (lz.length && lz[lz.length - 1] === o) {
                                var r = "deltaY" in e ? lR(e) : lC(e),
                                    n = t.current.filter(function(t) {
                                        var n;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                                    })[0];
                                if (n && n.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!n) {
                                    var i = (a.current.shards || []).map(lk).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (i.length > 0 ? l(e, i[0]) : !a.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        c = tr.useCallback(function(e, r, n, i) {
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
                        s = tr.useCallback(function(e) {
                            r.current = lC(e), n.current = void 0
                        }, []),
                        d = tr.useCallback(function(t) {
                            c(t.type, lR(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        f = tr.useCallback(function(t) {
                            c(t.type, lC(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    tr.useEffect(function() {
                        return lz.push(o), e.setCallbacks({
                                onScrollCapture: d,
                                onWheelCapture: d,
                                onTouchMoveCapture: f
                            }), document.addEventListener("wheel", u, lN), document.addEventListener("touchmove", u, lN), document.addEventListener("touchstart", s, lN),
                            function() {
                                lz = lz.filter(function(e) {
                                    return e !== o
                                }), document.removeEventListener("wheel", u, lN), document.removeEventListener("touchmove", u, lN), document.removeEventListener("touchstart", s, lN)
                            }
                    }, []);
                    var p = e.removeScrollBar,
                        m = e.inert;
                    return tr.createElement(tr.Fragment, null, m ? tr.createElement(o, {
                        styles: "\n  .block-interactivity-".concat(i, " {pointer-events: none;}\n  .allow-interactivity-").concat(i, " {pointer-events: all;}\n")
                    }) : null, p ? tr.createElement(lS, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, lu.useMedium(d), ld),
                lB = tr.forwardRef(function(e, t) {
                    return tr.createElement(ls, lt({}, e, {
                        ref: t,
                        sideCar: l_
                    }))
                });
            lB.classNames = ls.classNames;
            var lY = new WeakMap,
                lF = new WeakMap,
                lG = {},
                lW = 0,
                lQ = function(e) {
                    return e && (e.host || lQ(e.parentNode))
                },
                lV = function(e, t, r, n) {
                    var i = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var r = lQ(e);
                        return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    lG[r] || (lG[r] = new WeakMap);
                    var o = lG[r],
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
                                    u = (lY.get(e) || 0) + 1,
                                    c = (o.get(e) || 0) + 1;
                                lY.set(e, u), o.set(e, c), a.push(e), 1 === u && i && lF.set(e, !0), 1 === c && e.setAttribute(r, "true"), i || e.setAttribute(n, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return s(t), l.clear(), lW++,
                        function() {
                            a.forEach(function(e) {
                                var t = lY.get(e) - 1,
                                    i = o.get(e) - 1;
                                lY.set(e, t), o.set(e, i), t || (lF.has(e) || e.removeAttribute(n), lF.delete(e)), i || e.removeAttribute(r)
                            }), --lW || (lY = new WeakMap, lY = new WeakMap, lF = new WeakMap, lG = {})
                        }
                },
                lq = function(e, t, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var n = Array.from(Array.isArray(e) ? e : [e]),
                        i = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return i ? (n.push.apply(n, Array.from(i.querySelectorAll("[aria-live], script"))), lV(n, i, r, "aria-hidden")) : function() {
                        return null
                    }
                };

            function lK(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lH(e) {
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

            function lX(e, t) {
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

            function lZ(e, t) {
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

            function l$(e, t) {
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
                        if ("string" == typeof e) return lK(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lK(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var lJ = "Dialog",
                l0 = l$(function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        n = function() {
                            var t = r.map(function(e) {
                                return tr.createContext(e)
                            });
                            return function(r) {
                                var n = (null == r ? void 0 : r[e]) || t;
                                return tr.useMemo(function() {
                                    var t, i;
                                    return aw({}, "__scope".concat(e), (t = ax({}, r), i = null != (i = aw({}, e, n)) ? i : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(i)) : (function(e) {
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
                        var i = tr.createContext(n),
                            o = r.length;
                        r = aO(r).concat([n]);
                        var a = function(t) {
                            var r, n = t.scope,
                                a = t.children,
                                l = aj(t, ["scope", "children"]),
                                u = (null == n || null == (r = n[e]) ? void 0 : r[o]) || i,
                                c = tr.useMemo(function() {
                                    return l
                                }, Object.values(l));
                            return (0, O.jsx)(u.Provider, {
                                value: c,
                                children: a
                            })
                        };
                        return a.displayName = t + "Provider", [a, function(r, a) {
                            var l, u = (null == a || null == (l = a[e]) ? void 0 : l[o]) || i,
                                c = tr.useContext(u);
                            if (c) return c;
                            if (void 0 !== n) return n;
                            throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                        }]
                    }, aS.apply(void 0, [n].concat(aO(t)))]
                }(lJ), 2),
                l1 = l0[0];
            l0[1];
            var l4 = l$(l1(lJ), 2),
                l2 = l4[0],
                l3 = l4[1],
                l5 = function(e) {
                    var t, r, n, i, o, a, l, u, c, s, d, f, p, m, y, b, g, h = e.__scopeDialog,
                        v = e.children,
                        w = e.open,
                        x = e.defaultOpen,
                        j = e.onOpenChange,
                        S = e.modal,
                        I = tr.useRef(null),
                        M = tr.useRef(null),
                        N = l$((c = (u = {
                            prop: w,
                            defaultProp: x,
                            onChange: j
                        }).prop, p = (f = aL((r = (t = {
                            defaultProp: u.defaultProp,
                            onChange: d = void 0 === (s = u.onChange) ? function() {} : s
                        }).defaultProp, n = t.onChange, o = aL(i = tr.useState(r), 1)[0], a = tr.useRef(o), l = aD(n), tr.useEffect(function() {
                            a.current !== o && (l(o), a.current = o)
                        }, [o, a, l]), i), 2))[0], m = f[1], b = (y = void 0 !== c) ? c : p, g = aD(d), [b, tr.useCallback(function(e) {
                            if (y) {
                                var t = "function" == typeof e ? e(c) : e;
                                t !== c && g(t)
                            } else m(e)
                        }, [y, c, m, g])]), 2),
                        P = N[0],
                        E = N[1];
                    return (0, O.jsx)(l2, {
                        scope: h,
                        triggerRef: I,
                        contentRef: M,
                        contentId: aE(),
                        titleId: aE(),
                        descriptionId: aE(),
                        open: void 0 !== P && P,
                        onOpenChange: E,
                        onOpenToggle: tr.useCallback(function() {
                            return E(function(e) {
                                return !e
                            })
                        }, [E]),
                        modal: void 0 === S || S,
                        children: v
                    })
                };
            l5.displayName = lJ;
            var l6 = "DialogTrigger";
            tr.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = lZ(e, ["__scopeDialog"]),
                    i = l3(l6, r),
                    o = th(t, i.triggerRef);
                return (0, O.jsx)(aQ.button, lX(lH({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": i.open,
                    "aria-controls": i.contentId,
                    "data-state": ub(i.open)
                }, n), {
                    ref: o,
                    onClick: ah(e.onClick, i.onOpenToggle)
                }))
            }).displayName = l6;
            var l8 = "DialogPortal",
                l9 = l$(l1(l8, {
                    forceMount: void 0
                }), 2),
                l7 = l9[0],
                ue = l9[1],
                ut = function(e) {
                    var t = e.__scopeDialog,
                        r = e.forceMount,
                        n = e.children,
                        i = e.container,
                        o = l3(l8, t);
                    return (0, O.jsx)(l7, {
                        scope: t,
                        forceMount: r,
                        children: tr.Children.map(n, function(e) {
                            return (0, O.jsx)(a9, {
                                present: r || o.open,
                                children: (0, O.jsx)(a5, {
                                    asChild: !0,
                                    container: i,
                                    children: e
                                })
                            })
                        })
                    })
                };
            ut.displayName = l8;
            var ur = "DialogOverlay",
                un = tr.forwardRef(function(e, t) {
                    var r = ue(ur, e.__scopeDialog),
                        n = e.forceMount,
                        i = void 0 === n ? r.forceMount : n,
                        o = lZ(e, ["forceMount"]),
                        a = l3(ur, e.__scopeDialog);
                    return a.modal ? (0, O.jsx)(a9, {
                        present: i || a.open,
                        children: (0, O.jsx)(uo, lX(lH({}, o), {
                            ref: t
                        }))
                    }) : null
                });
            un.displayName = ur;
            var ui = a_("DialogOverlay.RemoveScroll"),
                uo = tr.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = lZ(e, ["__scopeDialog"]),
                        i = l3(ur, r);
                    return (0, O.jsx)(lB, {
                        as: ui,
                        allowPinchZoom: !0,
                        shards: [i.contentRef],
                        children: (0, O.jsx)(aQ.div, lX(lH({
                            "data-state": ub(i.open)
                        }, n), {
                            ref: t,
                            style: lH({
                                pointerEvents: "auto"
                            }, n.style)
                        }))
                    })
                }),
                ua = "DialogContent",
                ul = tr.forwardRef(function(e, t) {
                    var r = ue(ua, e.__scopeDialog),
                        n = e.forceMount,
                        i = void 0 === n ? r.forceMount : n,
                        o = lZ(e, ["forceMount"]),
                        a = l3(ua, e.__scopeDialog);
                    return (0, O.jsx)(a9, {
                        present: i || a.open,
                        children: a.modal ? (0, O.jsx)(uu, lX(lH({}, o), {
                            ref: t
                        })) : (0, O.jsx)(uc, lX(lH({}, o), {
                            ref: t
                        }))
                    })
                });
            ul.displayName = ua;
            var uu = tr.forwardRef(function(e, t) {
                    var r = l3(ua, e.__scopeDialog),
                        n = tr.useRef(null),
                        i = th(t, r.contentRef, n);
                    return tr.useEffect(function() {
                        var e = n.current;
                        if (e) return lq(e)
                    }, []), (0, O.jsx)(us, lX(lH({}, e), {
                        ref: i,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: ah(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: ah(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                r = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || r) && e.preventDefault()
                        }),
                        onFocusOutside: ah(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                uc = tr.forwardRef(function(e, t) {
                    var r = l3(ua, e.__scopeDialog),
                        n = tr.useRef(!1),
                        i = tr.useRef(!1);
                    return (0, O.jsx)(us, lX(lH({}, e), {
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
                us = tr.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = e.trapFocus,
                        i = e.onOpenAutoFocus,
                        o = e.onCloseAutoFocus,
                        a = lZ(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = l3(ua, r),
                        u = tr.useRef(null),
                        c = th(t, u);
                    return (0, le.useFocusGuards)(), (0, O.jsxs)(O.Fragment, {
                        children: [(0, O.jsx)(a$, {
                            asChild: !0,
                            loop: !0,
                            trapped: n,
                            onMountAutoFocus: i,
                            onUnmountAutoFocus: o,
                            children: (0, O.jsx)(rO.DismissableLayer, lX(lH({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": ub(l.open)
                            }, a), {
                                ref: c,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, O.jsxs)(O.Fragment, {
                            children: [(0, O.jsx)(uw, {
                                titleId: l.titleId
                            }), (0, O.jsx)(ux, {
                                contentRef: u,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                ud = "DialogTitle",
                uf = tr.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = lZ(e, ["__scopeDialog"]),
                        i = l3(ud, r);
                    return (0, O.jsx)(aQ.h2, lX(lH({
                        id: i.titleId
                    }, n), {
                        ref: t
                    }))
                });
            uf.displayName = ud;
            var up = "DialogDescription";
            tr.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = lZ(e, ["__scopeDialog"]),
                    i = l3(up, r);
                return (0, O.jsx)(aQ.p, lX(lH({
                    id: i.descriptionId
                }, n), {
                    ref: t
                }))
            }).displayName = up;
            var um = "DialogClose",
                uy = tr.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = lZ(e, ["__scopeDialog"]),
                        i = l3(um, r);
                    return (0, O.jsx)(aQ.button, lX(lH({
                        type: "button"
                    }, n), {
                        ref: t,
                        onClick: ah(e.onClick, function() {
                            return i.onOpenChange(!1)
                        })
                    }))
                });

            function ub(e) {
                return e ? "open" : "closed"
            }
            uy.displayName = um;
            var ug = "DialogTitleWarning",
                uh = l$((f = {
                    contentName: ua,
                    titleName: ud,
                    docsSlug: "dialog"
                }, p = tr.createContext(f), (m = function(e) {
                    var t = e.children,
                        r = aj(e, ["children"]),
                        n = tr.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, O.jsx)(p.Provider, {
                        value: n,
                        children: t
                    })
                }).displayName = ug + "Provider", [m, function(e) {
                    var t = tr.useContext(p);
                    if (t) return t;
                    if (void 0 !== f) return f;
                    throw Error("`".concat(e, "` must be used within `").concat(ug, "`"))
                }]), 2),
                uv = (uh[0], uh[1]),
                uw = function(e) {
                    var t = e.titleId,
                        r = uv(ug),
                        n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return tr.useEffect(function() {
                        t && (document.getElementById(t) || console.error(n))
                    }, [n, t]), null
                },
                ux = function(e) {
                    var t = e.contentRef,
                        r = e.descriptionId,
                        n = uv("DialogDescriptionWarning"),
                        i = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
                    return tr.useEffect(function() {
                        var e, n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        r && n && (document.getElementById(r) || console.warn(i))
                    }, [i, t, r]), null
                },
                uj = function(e) {
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
                    return tn().createElement(ut, null, tn().createElement(un, {
                        "data-testid": "fui-base-sheet-overlay",
                        "data-type": t,
                        "data-side": "sideSheet" === t ? void 0 === r ? "right" : r : void 0,
                        "data-flush": "sideSheet" === t ? void 0 !== n && n : void 0,
                        "data-size": "centerSheet" === t ? void 0 === i ? "Medium" : i : void 0,
                        className: ti("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", a)
                    }, tn().createElement(ul, {
                        "data-testid": "fui-base-sheet-content",
                        className: ti("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", l),
                        onOpenAutoFocus: u,
                        onCloseAutoFocus: c,
                        onPointerDownOutside: s,
                        onEscapeKeyDown: d,
                        onInteractOutside: f
                    }, o)))
                };

            function uO(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var uS = function(e) {
                    return ("function" != typeof e.checkVisibility || e.checkVisibility()) && !("disabled" in e && e.disabled || "true" === e.getAttribute("aria-disabled"))
                },
                uI = function(e) {
                    uO(e, HTMLInputElement) && "function" == typeof e.select && e.select()
                },
                uM = function(e) {
                    var t = e.currentTarget;
                    if (t) {
                        var r = t.querySelectorAll("[data-autofocus-priority]");
                        if (0 !== r.length) {
                            var n = [];
                            r.forEach(function(e) {
                                var t = parseInt(e.getAttribute("data-autofocus-priority") || "", 10);
                                !Number.isNaN(t) && uO(e, HTMLElement) && n.push({
                                    element: e,
                                    priority: t
                                })
                            }), n.sort(function(e, t) {
                                return e.priority - t.priority
                            });
                            var i = n.find(function(e) {
                                return uS(e.element)
                            });
                            if (i) {
                                e.preventDefault();
                                var o = document.activeElement === i.element;
                                i.element.focus(), o || uI(i.element)
                            }
                        }
                    }
                };

            function uN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uP(e) {
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

            function uE(e, t) {
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

            function uT(e, t) {
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

            function uD(e) {
                return function(e) {
                    if (Array.isArray(e)) return uN(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return uN(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return uN(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var uA = Symbol("radix.slottable");

            function uL(e) {
                return tr.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === uA
            }

            function uC(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function uR(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        uC(e, t, r[t])
                    })
                }
                return e
            }

            function uk(e, t) {
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
            var uU = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r, n, i, o, a, l = (r = i = "Primitive.".concat(t), (n = tr.forwardRef(function(e, t) {
                        var r = e.children,
                            n = uT(e, ["children"]);
                        if (tr.isValidElement(r)) {
                            var i, o, a, l, u, c = (u = (l = null == (o = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (u = (l = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                                s = function(e, t) {
                                    var r = uP({}, t);
                                    for (var n in t) ! function(n) {
                                        var i = e[n],
                                            o = t[n];
                                        /^on[A-Z]/.test(n) ? i && o ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = o.apply(void 0, uD(t));
                                            return i.apply(void 0, uD(t)), n
                                        } : i && (r[n] = i) : "style" === n ? r[n] = uP({}, i, o) : "className" === n && (r[n] = [i, o].filter(Boolean).join(" "))
                                    }(n);
                                    return uP({}, e, r)
                                }(n, r.props);
                            return r.type !== tr.Fragment && (s.ref = t ? tg(t, c) : c), tr.cloneElement(r, s)
                        }
                        return tr.Children.count(r) > 1 ? tr.Children.only(null) : null
                    })).displayName = "".concat(r, ".SlotClone"), o = n, (a = tr.forwardRef(function(e, t) {
                        var r = e.children,
                            n = uT(e, ["children"]),
                            i = tr.Children.toArray(r),
                            a = i.find(uL);
                        if (a) {
                            var l = a.props.children,
                                u = i.map(function(e) {
                                    return e !== a ? e : tr.Children.count(l) > 1 ? tr.Children.only(null) : tr.isValidElement(l) ? l.props.children : null
                                });
                            return (0, O.jsx)(o, uE(uP({}, n), {
                                ref: t,
                                children: tr.isValidElement(l) ? tr.cloneElement(l, void 0, u) : null
                            }))
                        }
                        return (0, O.jsx)(o, uE(uP({}, n), {
                            ref: t,
                            children: r
                        }))
                    })).displayName = "".concat(i, ".Slot"), a),
                    u = tr.forwardRef(function(e, r) {
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
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, O.jsx)(o, uk(uR({}, i), {
                            ref: r
                        }))
                    });
                return u.displayName = "Primitive.".concat(t), uk(uR({}, e), uC({}, t, u))
            }, {});

            function uz(e) {
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
            var u_ = Object.freeze({
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
                uB = tr.forwardRef(function(e, t) {
                    var r, n;
                    return (0, O.jsx)(uU.span, (r = uz({}, e), n = n = {
                        ref: t,
                        style: uz({}, u_, e.style)
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

            function uY(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            uB.displayName = "VisuallyHidden", r(977);
            var uF = "u" > typeof window ? tr.useLayoutEffect : tr.useEffect,
                uG = "u" < typeof window;

            function uW(e) {
                var t, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = r.defaultValue,
                    i = void 0 !== n && n,
                    o = r.initializeWithValue,
                    a = void 0 === o || o,
                    l = function(e) {
                        return uG ? i : window.matchMedia(e).matches
                    },
                    u = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = (0, tr.useState)(function() {
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
                            if ("string" == typeof e) return uY(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return uY(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    c = u[0],
                    s = u[1];

                function d() {
                    s(l(e))
                }
                return uF(function() {
                    var t = window.matchMedia(e);
                    return d(), t.addListener ? t.addListener(d) : t.addEventListener("change", d),
                        function() {
                            t.removeListener ? t.removeListener(d) : t.removeEventListener("change", d)
                        }
                }, [e]), c
            }

            function uQ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uV(e) {
                if (Array.isArray(e)) return e
            }

            function uq() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function uK(e) {
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

            function uH(e, t) {
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

            function uX(e, t) {
                if (e) {
                    if ("string" == typeof e) return uQ(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uQ(e, t)
                }
            }
            var uZ = (0, tr.createContext)(null),
                u$ = function() {
                    var e = (0, tr.useContext)(uZ);
                    if (!e) throw Error("Sheet components must be used within a Sheet");
                    return e
                },
                uJ = "padding-x-xlarge",
                u0 = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.defaultOpen,
                        i = e.children;
                    return tn().createElement(l5, {
                        open: t,
                        onOpenChange: r,
                        defaultOpen: n,
                        modal: !0
                    }, i)
                },
                u1 = function(e) {
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
                        g = uW("(orientation: portrait) and (max-width: 600px)"),
                        h = uW("(orientation: landscape) and (max-height: 600px)");
                    t = g ? "bottomSheet" : h || "side" === a ? "sideSheet" : "centerSheet";
                    var v = (0, tr.useMemo)(function() {
                            return {
                                centerSheetSize: i,
                                largeScreenVariant: a,
                                closeLabel: l,
                                isPortraitMobile: g,
                                isLandscapeMobile: h,
                                type: t
                            }
                        }, [i, a, l, g, h, t]),
                        w = ti(u, g && c, h && s, !g && !h && d);
                    return tn().createElement(uZ.Provider, {
                        value: v
                    }, tn().createElement(uj, {
                        type: t,
                        sideSheetSide: "right",
                        isSideSheetFlush: h,
                        centerSheetSize: i,
                        contentClassName: w,
                        onOpenAutoFocus: null != f ? f : uM,
                        onCloseAutoFocus: p,
                        onPointerDownOutside: m,
                        onEscapeKeyDown: y,
                        onInteractOutside: b
                    }, r))
                },
                u4 = (0, tr.forwardRef)(function(e, t) {
                    var r, n = uV(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || uX(r) || uq(),
                        i = n[0],
                        o = n.slice(1),
                        a = i.children,
                        l = i.className,
                        u = i.hasPaddingX,
                        c = uH(i, ["children", "className", "hasPaddingX"]),
                        s = (uV(o) || function(e) {
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
                        }(o) || uX(o, 1) || uq())[0],
                        d = u$().type;
                    return tn().createElement("div", uK({
                        ref: s,
                        className: ti("scroll-y", (void 0 === u || u) && uJ, "sideSheet" === d ? "grow-1" : "", l)
                    }, c), a)
                });
            u4.displayName = "SheetBody";
            var u2 = function(e) {
                    var t = e.className,
                        r = e.children,
                        n = e.navigation,
                        i = e.utilities,
                        o = e.visuallyHideTitleText,
                        a = u$().closeLabel,
                        l = tn().createElement(uf, {
                            className: "text-heading-small margin-none"
                        }, r);
                    return tn().createElement("div", {
                        className: ti(t, n ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
                    }, tn().createElement("div", {
                        className: ti("flex items-center", n && "gap-xsmall")
                    }, n, o ? tn().createElement(uB, null, l) : l), tn().createElement("div", {
                        className: ti("flex items-center", i && "gap-xxsmall")
                    }, i, tn().createElement("div", {
                        className: "fui-sheet-close-affordance-container"
                    }, tn().createElement(uy, {
                        asChild: !0
                    }, tn().createElement(ad, {
                        variant: "Utility",
                        size: "Medium",
                        icon: "icon-regular-x",
                        ariaLabel: a || "",
                        "data-autofocus-priority": "1000"
                    })))))
                },
                u3 = function(e) {
                    var t = e.children,
                        r = e.className,
                        n = uH(e, ["children", "className"]);
                    return tn().createElement(tn().Fragment, null, tn().createElement(ag, null), tn().createElement("div", uK({
                        className: ti(uJ, "margin-y-small shrink-0", r)
                    }, n), t))
                },
                u5 = function(e) {
                    var t = e.iconName,
                        r = e.label;
                    return (0, O.jsxs)("div", {
                        className: "gap-x-medium align-items-center flex flex-row",
                        children: [(0, O.jsx)(ts, {
                            name: t,
                            size: "Large"
                        }), (0, O.jsx)("span", {
                            className: "[font-size:var(--font-size-350)]",
                            children: r
                        })]
                    })
                },
                u6 = function(e) {
                    var t = e.featureConfig,
                        r = e.currencySubscriptionBenefit,
                        n = (0, S.useTranslation)(),
                        i = n.translate,
                        o = n.intl,
                        a = (0, tr.useMemo)(function() {
                            var e;
                            return null == (e = t.virtualTransactionDiscounts) ? void 0 : e.find(function(e) {
                                return 0 === e.periodIndex
                            })
                        }, [t]),
                        l = (0, tr.useMemo)(function() {
                            var e;
                            return null == (e = t.virtualTransactionDiscounts) ? void 0 : e.filter(function(e) {
                                return e.periodIndex > 0
                            }).reduce(function(e, t) {
                                return null === e || t.periodIndex < e.periodIndex ? t : e
                            }, null)
                        }, [t]);
                    return (0, O.jsxs)("div", {
                        className: "gap-y-xlarge flex flex-col",
                        children: [a && (l ? (0, O.jsx)(u5, {
                            iconName: "icon-regular-tag",
                            label: i("Description.Benefit.DiscountV2")
                        }) : (0, O.jsx)(u5, {
                            iconName: "icon-regular-tag",
                            label: i("Description.Benefit.DiscountBase", {
                                discountPercent: o.n(.01 * a.discountPercent, {
                                    style: "percent"
                                })
                            })
                        })), (0, O.jsx)(u5, {
                            iconName: "icon-regular-paint-brush",
                            label: i("Description.Benefit.Customize")
                        }), (0, O.jsx)(u5, {
                            iconName: "icon-regular-controller",
                            label: i("Label.BlackbirdPSDiscount")
                        }), r && r.entitledAmountMicrosPerGrantingPeriod > 0 && (0, O.jsx)(u5, {
                            iconName: "icon-regular-robux",
                            label: i("Description.Benefit.RobuxStipend", {
                                amount: o.n(Math.round(r.entitledAmountMicrosPerGrantingPeriod / 1e6)),
                                periodType: r.grantingPeriodType
                            })
                        }), t.isRobuxTransferEnabled && (0, O.jsx)(u5, {
                            iconName: "icon-regular-robux",
                            label: i("Description.Benefit.RobuxTransfers")
                        }), t.isTradingEnabled && (0, O.jsx)(u5, {
                            iconName: "icon-regular-hand-two-arrows-horizontal",
                            label: i("Description.Benefit.TradeResellItems")
                        }), t.isUgcPublishingEnabled && (0, O.jsx)(u5, {
                            iconName: "icon-regular-arrow-up-from-landscape-rectangle",
                            label: i("Description.Benefit.PublishItems")
                        })]
                    })
                },
                u8 = window.Roblox,
                u9 = u8.EnvironmentUrls.apiGatewayUrl,
                u7 = new e2(new eY({
                    robloxSiteDomain: u8.EnvironmentUrls.domain,
                    basePath: "".concat(u9, "/subscriptions"),
                    credentials: "include"
                }));

            function ce(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }
            var ct = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        t = e.referrerId,
                        r = e.enabled,
                        n = Number.parseInt(null != t ? t : "", 10),
                        i = Number.isFinite(n) && n > 0,
                        o = (void 0 === r || r) && i,
                        a = (0, P.useQuery)({
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
                                                return [4, u7.subscriptionsV2CreateSubscriptionReferral({
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
                                            ce(o, n, i, a, l, "next", e)
                                        }

                                        function l(e) {
                                            ce(o, n, i, a, l, "throw", e)
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
                cr = function(e, t) {
                    var r = (0, S.useTranslation)().intl;
                    return (0, tr.useMemo)(function() {
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

            function cn(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }
            var ci = function(e) {
                    var t, r, n;
                    return Math.floor((null != (t = null == (n = e.productTypeDetails.robloxSubscriptionProductDetails) || null == (r = n.featureConfig.currencySubscriptionConfig) ? void 0 : r.entitledAmountMicros) ? t : 0) / 1e6)
                },
                co = function() {
                    var e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        r = t.enabled,
                        n = void 0 === r || r,
                        i = (0, P.useQuery)({
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
                                                return [4, u7.subscriptionsV2ListAvailableSubscriptionProducts({
                                                    productType: eZ,
                                                    includePurchased: !0,
                                                    includeBundles: !0,
                                                    skipEligibilityCheck: !0
                                                })];
                                            case 1:
                                                return [2, null != (e = t.sent().products.toSorted(function(e, t) {
                                                    return ci(e) - ci(t)
                                                }).at(0)) ? e : null]
                                        }
                                    })
                                }, function() {
                                    var t = this,
                                        r = arguments;
                                    return new Promise(function(n, i) {
                                        var o = e.apply(t, r);

                                        function a(e) {
                                            cn(o, n, i, a, l, "next", e)
                                        }

                                        function l(e) {
                                            cn(o, n, i, a, l, "throw", e)
                                        }
                                        a(void 0)
                                    })
                                })()
                            }
                        }),
                        o = i.data,
                        a = i.isLoading;
                    return {
                        subscribeButtonProps: (0, tr.useMemo)(function() {
                            var e = (0, e6.getDeviceMeta)();
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

            function ca(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }
            var cl = new Map([
                    ["Invalid", "Invalid"],
                    ["Eligible", "Eligible"],
                    ["Ineligible", "Ineligible"],
                    [0, "Invalid"],
                    [1, "Eligible"],
                    [2, "Ineligible"]
                ]),
                cu = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        t = e.referrerId,
                        r = e.enabled,
                        n = Number.parseInt(null != t ? t : "", 10),
                        i = Number.isFinite(n) && n > 0,
                        o = (void 0 === r || r) && i,
                        a = (0, P.useQuery)({
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
                                                return [4, u7.subscriptionsV2CheckSubscriptionReferralEligibility({
                                                    referrerId: n
                                                })];
                                            case 1:
                                                return e = t.sent().eligibility, [2, cl.get(e)]
                                        }
                                    })
                                }, function() {
                                    var t = this,
                                        r = arguments;
                                    return new Promise(function(n, i) {
                                        var o = e.apply(t, r);

                                        function a(e) {
                                            ca(o, n, i, a, l, "next", e)
                                        }

                                        function l(e) {
                                            ca(o, n, i, a, l, "throw", e)
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
                cc = window.Roblox["core-scripts"].dataStore,
                cs = r.n(cc),
                cd = function(e) {
                    var t = Number.parseInt(null != e ? e : "", 10),
                        r = Number.isFinite(t) && t > 0,
                        n = (0, P.useQuery)({
                            queryKey: ["plus-referrals", "referrer", t],
                            enabled: r,
                            retry: !1,
                            queryFn: function() {
                                return cs().userDataStore.getUser(t)
                            }
                        }),
                        i = n.data,
                        o = n.isLoading;
                    return {
                        handle: i ? "@".concat(i.name) : void 0,
                        isLoading: r && o
                    }
                };

            function cf(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var cp = function(e) {
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
                    g = e.trackSubscriptionButtonClick,
                    h = e.loadingStateDisabled,
                    v = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = (0, tr.useState)(!1)) || function(e) {
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
                            if ("string" == typeof e) return cf(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return cf(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    w = v[0],
                    x = v[1],
                    j = i.isAndroidApp || i.isIosApp,
                    S = r === eZ ? "RobloxPlus" : r,
                    I = (0, tr.useMemo)(function() {
                        var e = new URL(j ? "/mobile-app-upgrades/buy" : "/upgrades/paymentmethods", window.location.origin);
                        return e.searchParams.append("ctx", "subscription"), e.searchParams.append("type", S), e.searchParams.append("id", n), f && e.searchParams.append("paymentSessionId", f), d && e.searchParams.append("referrerId", d), !j && s && e.searchParams.append("redirectUrl", s), e.toString()
                    }, [j, S, n, f, d, s]),
                    M = (0, tr.useCallback)(function() {
                        if (!c) {
                            if (null == g || g(), s && function(e) {
                                    try {
                                        var t = JSON.stringify({
                                            url: e,
                                            ts: Date.now()
                                        });
                                        sessionStorage.setItem(tt, t)
                                    } catch (e) {}
                                }(s), null == p || p(), j) {
                                null == m || m();
                                return
                            }
                            x(!0)
                        }
                    }, [c, g, s, p, j, m]);
                return (0, O.jsx)(tF, {
                    as: "a",
                    className: l,
                    href: I,
                    isDisabled: c,
                    isLoading: void 0 !== h && h ? void 0 : null != y ? y : w,
                    size: a,
                    variant: void 0 === o ? "Emphasis" : o,
                    onClick: M,
                    children: b
                })
            };

            function cm(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cy(e) {
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

            function cb(e, t) {
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
            var cg = ["Feature.RobloxSubscription"],
                ch = "margin-x-auto width-full max-width-[320px]",
                cv = "margin-bottom-[-8px]",
                cw = {
                    currencyCode: "USD",
                    units: 0,
                    nanos: 0
                },
                cx = {
                    invalid: {
                        key: "Description.ReferralInvalid",
                        fallback: "This referral link is no longer valid. You can still join Roblox Plus without the referral reward."
                    },
                    ineligible: {
                        key: "Description.ReferralIneligible",
                        fallback: "This referral reward is not available on your account. You can still join Roblox Plus."
                    }
                },
                cj = function(e, t) {
                    var r = new URLSearchParams({
                        ctx: "plus_referral",
                        referralCode: e
                    });
                    return t && r.set("referrerId", t), "/plus?".concat(r.toString())
                },
                cO = function(e) {
                    var t = e.face,
                        r = e.open,
                        n = e.onOpenChange,
                        i = e.referralCode,
                        o = e.referrerUserId,
                        a = e.subscribeButtonProps,
                        l = e.subscribePrice,
                        u = e.subscribePeriodType,
                        c = e.featureConfig,
                        s = (0, S.useTranslation)(),
                        d = s.translate,
                        f = s.intl,
                        p = "pitch" === t,
                        m = f.n(100),
                        y = cr(null != l ? l : cw),
                        b = cd(p ? o : void 0),
                        g = b.handle,
                        h = b.isLoading,
                        v = d("Heading.ReferralRecipientJoin", void 0, "Join Plus, get"),
                        w = d("Action.ReferralJoinPlus", void 0, "Join Roblox Plus"),
                        x = d("Action.Subscribe", void 0, "Subscribe"),
                        j = (0, tr.useMemo)(function() {
                            var e, t, r = void 0 !== i ? cj(i, o) : void 0;
                            return cb(cy({}, a), {
                                redirectUrl: null != (e = a.redirectUrl) ? e : r,
                                referrerId: null != (t = a.referrerId) ? t : o
                            })
                        }, [i, o, a]),
                        I = [{
                            opening: "linkStart",
                            closing: "linkEnd",
                            render: function(e) {
                                return (0, O.jsx)("a", {
                                    className: "content-link underline",
                                    href: e7,
                                    rel: "noopener noreferrer",
                                    target: "_blank",
                                    children: e
                                })
                            }
                        }];
                    return (0, O.jsx)(u0, {
                        open: r,
                        onOpenChange: n,
                        children: (0, O.jsxs)(u1, {
                            centerSheetSize: "Medium",
                            className: p ? "[&>[role=separator]]:[display:none]" : void 0,
                            closeLabel: d("Action.Close"),
                            largeScreenVariant: "center",
                            children: [(0, O.jsx)(u2, {
                                visuallyHideTitleText: !0,
                                children: p ? "".concat(v, " ").concat(m) : w
                            }), "pitch" === t ? (0, O.jsxs)(u4, {
                                className: "gap-y-large padding-top-small padding-bottom-small medium:padding-top-medium medium:padding-bottom-medium flex flex-col",
                                children: [(0, O.jsx)("img", {
                                    alt: "",
                                    className: "".concat(ch, " ").concat(cv, " dark:hidden"),
                                    src: "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMjAiIGhlaWdodD0iMTgwIiBmaWxsPSJub25lIiB2aWV3Qm94PSIwIDAgMzIwIDE4MCI+PHBhdGggZmlsbD0iIzFiMjU0YiIgZmlsbC1vcGFjaXR5PSIuMTYiIGQ9Ik0yNTYuNDg2IDM2LjkwNWE0IDQgMCAwIDEgMi42MzEgNC44NGwtMjMuODExIDg4Ljg2Ni0uMDU5LjE5OGE0IDQgMCAwIDEtNC42NCAyLjY3OWwtLjItLjA0OS02NS4xMzMtMTcuNDUyLS40NDgtMS42NzMgNjUuOTY5IDE3LjY3NmEyLjUgMi41IDAgMCAwIDMuMDYyLTEuNzY3bDIzLjgxMS04OC44NjZhMi41IDIuNSAwIDAgMC0xLjc2OC0zLjA2MmwtODguODY1LTIzLjgxYTIuNSAyLjUgMCAwIDAtMy4wNjIgMS43NjdMMTUxLjI2MiA2My42OWwtLjc3Ni0yLjg5OCAxMi4wMzgtNDQuOTI4YTQgNCAwIDAgMSA0Ljg5OS0yLjgyOWw4OC44NjUgMjMuODEyeiIvPjxwYXRoIGZpbGw9IiMyMDIyMjciIGQ9Ik0yMDIuMjMzIDQyLjc4YTkuODYgOS44NiAwIDAgMSA5LjMyMiAyLjQ5OGwxNi4wNzQgMTUuNzM5YzIuNDQ4IDIuMzk3IDMuNDIxIDUuODc2IDIuNTUgOS4xMjVsLTUuNzE2IDIxLjMzMi0uMDg2LjMwMmMtLjk0NiAzLjEwMy0zLjQ2OSA1LjUtNi42ODUgNi4zMjVsLTIxLjc5IDUuNTkzLS4zMTIuMDc1YTkuODYgOS44NiAwIDAgMS05LjAwOS0yLjU3M2wtMTYuMDc0LTE1LjczOGMtMi4zNzItMi4zMjMtMy4zNTktNS42Ni0yLjYyNy04LjgybC4wNzctLjMwNUwxNzMuNjcyIDU1Yy44NDQtMy4xNDggMy4yOTMtNS42MTggNi40NjMtNi41NDNsLjMwOS0uMDg0em02LjE3MyA1LjcxNGE1LjM2IDUuMzYgMCAwIDAtNS4wNTQtMS4zNTRsLTIxLjc4OSA1LjU5MmMtMS43ODIuNDU3LTMuMTAzIDEuNzktMy41NDQgMy40MzRsLTUuNzE2IDIxLjMzMWMtLjQ0IDEuNjQ0LjAzNyAzLjQ2IDEuMzUyIDQuNzQ2bDE2LjA3NCAxNS43MzhhNS4zNiA1LjM2IDAgMCAwIDUuMDU0IDEuMzU0bDIxLjc5LTUuNTkyYzEuNzgyLS40NTcgMy4xMDMtMS43OSAzLjU0NC0zLjQzNGw1LjcxNS0yMS4zMzJjLjQ0MS0xLjY0NC0uMDM3LTMuNDU4LTEuMzUyLTQuNzQ2em0tNi4yNzcgNS4yODhhNC4xNiA0LjE2IDAgMCAxIDQuMDE1IDEuMDc2bDExLjMwNCAxMS4zMDNhNC4xNiA0LjE2IDAgMCAxIDEuMDc1IDQuMDE0bC00LjEzNyAxNS40NDFhNC4xNiA0LjE2IDAgMCAxLTIuOTM5IDIuOTRsLTE1LjQ0MSA0LjEzNmE0LjE2IDQuMTYgMCAwIDEtNC4wMTQtMS4wNzZsLTExLjMwNC0xMS4zMDNhNC4xNiA0LjE2IDAgMCAxLTEuMDc1LTQuMDE0bDQuMTM3LTE1LjQ0MWE0LjE2IDQuMTYgMCAwIDEgMi45MzktMi45NHptLTcuMjUyIDkuMDE1YTIuMjUgMi4yNSAwIDAgMC0yLjc1NSAxLjU5MWwtMy40OTUgMTMuMDRhMi4yNSAyLjI1IDAgMCAwIDEuNTkxIDIuNzU2bDEzLjA0IDMuNDk0YTIuMjUgMi4yNSAwIDAgMCAyLjc1Ni0xLjU5MWwzLjQ5NC0xMy4wNGEyLjI1IDIuMjUgMCAwIDAtMS41OTEtMi43NTZ6Ii8+PHBhdGggZmlsbD0iIzFiMjU0YiIgZmlsbC1vcGFjaXR5PSIuMTYiIGQ9Im0xNjYuOTg1IDEzNy44MDMuMzg4IDEuNDQ5LTg4Ljg2NSAyMy44MTEtLjM4OC0xLjQ0OXptMS43NjgtMy4wNjItMjMuODExLTg4Ljg2NWEyLjUgMi41IDAgMCAwLTMuMDYyLTEuNzY4TDUzLjAxNSA2Ny45MmEyLjUgMi41IDAgMCAwLTEuNzY4IDMuMDYxbDIzLjgxMSA4OC44NjZhMi41IDIuNSAwIDAgMCAzLjA2MiAxLjc2N2wuMzg4IDEuNDQ5LS4yLjA0OWE0IDQgMCAwIDEtNC42NC0yLjY3OWwtLjA1OS0uMTk4TDQ5Ljc5OCA3MS4zN2E0IDQgMCAwIDEgMi44MjgtNC45bDg4Ljg2Ni0yMy44MS4yLS4wNWE0IDQgMCAwIDEgNC42OTkgMi44NzhsMjMuODExIDg4Ljg2NS4wNDkuMmE0IDQgMCAwIDEtMi42OCA0LjY0MWwtLjE5OC4wNTgtLjM4OC0xLjQ0OWEyLjUgMi41IDAgMCAwIDEuNzY4LTMuMDYyIi8+PHBhdGggZmlsbD0iIzIwMjIyNyIgZD0iTTk3LjUxMyA3NC45MDJhOS44NiA5Ljg2IDAgMCAxIDkuMzIxLTIuNDk4bDIxLjc5IDUuNTkzYzMuMzE5Ljg1MiA1LjkwMSAzLjM3OCA2Ljc3MSA2LjYyOGw1LjcxNiAyMS4zMzEuMDc3LjMwNWMuNzMyIDMuMTYxLS4yNTUgNi40OTgtMi42MjcgOC44MmwtMTYuMDc0IDE1LjczOS0uMjMzLjIyMWE5Ljg2IDkuODYgMCAwIDEtOS4wODkgMi4yNzdsLTcuMzg5LTEuODk3YTMgMyAwIDAgMS0yLjE1Mi0yLjEzbC03LjUwNy0yOC4wMTYtMS4wMDMtMy43NGE0IDQgMCAwIDEgMi44MjgtNC45bDE3LjM4Ny00LjY2YTQgNCAwIDAgMSA0Ljg5OCAyLjgyOGw0LjA3NyAxNS4yMTNhNCA0IDAgMCAxLTIuODI5IDQuODk5bC04LjY5MyAyLjMzYTEuNzUgMS43NSAwIDAgMS0uOTA2LTMuMzgxbDguNjk0LTIuMzNhLjUuNSAwIDAgMCAuMzUzLS42MTJsLTQuMDc2LTE1LjIxM2EuNS41IDAgMCAwLS42MTMtLjM1NGwtMTcuMzg2IDQuNjZhLjUuNSAwIDAgMC0uMzUzLjYxM2w4LjQzNCAzMS40NzYgNy4xMDYgMS44MjRhNi4zNiA2LjM2IDAgMCAwIDYuMDA0LTEuNjA4bDE2LjA3My0xNS43MzljMS41NjctMS41MzQgMi4xNTQtMy43MTggMS42MTgtNS43MTlsLTUuNzE1LTIxLjMzMWMtLjUzNy0yLjAwMS0yLjEzNy0zLjYtNC4yNjEtNC4xNDRsLTIxLjc5LTUuNTkzYTYuMzYgNi4zNiAwIDAgMC02LjAwMyAxLjYwOEw4My44ODcgOTMuMTQxYy0xLjU2NiAxLjUzNC0yLjE1NCAzLjcxOC0xLjYxOCA1LjcxOWw1LjcxNiAyMS4zMzFjLjUzNiAyLjAwMSAyLjEzNyAzLjU5OSA0LjI2IDQuMTQ0bDMuMTMxLjgwM2ExLjc1IDEuNzUgMCAwIDEtLjg3IDMuMzlsLTMuMTMtLjgwM2MtMy4yMTYtLjgyNi01Ljc0LTMuMjIyLTYuNjg2LTYuMzI1bC0uMDg2LS4zMDMtNS43MTUtMjEuMzMxYy0uODQ0LTMuMTQ4LjA0Mi02LjUxMiAyLjMyNS04Ljg5OGwuMjI1LS4yMjh6Ii8+PC9zdmc+"
                                }), (0, O.jsx)("img", {
                                    alt: "",
                                    className: "".concat(ch, " ").concat(cv, " hidden dark:block"),
                                    src: "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMjAiIGhlaWdodD0iMTgwIiBmaWxsPSJub25lIiB2aWV3Qm94PSIwIDAgMzIwIDE4MCI+PHBhdGggZmlsbD0iI2QwZDlmYiIgZmlsbC1vcGFjaXR5PSIuMTYiIGQ9Ik0yNTYuNDg2IDM2LjkwNWE0IDQgMCAwIDEgMi42MzEgNC44NGwtMjMuODExIDg4Ljg2Ni0uMDU5LjE5OGE0IDQgMCAwIDEtNC42NCAyLjY3OWwtLjItLjA0OS02NS4xMzMtMTcuNDUyLS40NDgtMS42NzMgNjUuOTY5IDE3LjY3NmEyLjUgMi41IDAgMCAwIDMuMDYyLTEuNzY3bDIzLjgxMS04OC44NjZhMi41IDIuNSAwIDAgMC0xLjc2OC0zLjA2MmwtODguODY1LTIzLjgxYTIuNSAyLjUgMCAwIDAtMy4wNjIgMS43NjdMMTUxLjI2MiA2My42OWwtLjc3Ni0yLjg5OCAxMi4wMzgtNDQuOTI4YTQgNCAwIDAgMSA0Ljg5OS0yLjgyOWw4OC44NjUgMjMuODEyeiIvPjxwYXRoIGZpbGw9IiNmN2Y3ZjgiIGQ9Ik0yMDIuMjMzIDQyLjc4YTkuODYgOS44NiAwIDAgMSA5LjMyMiAyLjQ5OGwxNi4wNzQgMTUuNzM5YzIuNDQ4IDIuMzk3IDMuNDIxIDUuODc2IDIuNTUgOS4xMjVsLTUuNzE2IDIxLjMzMi0uMDg2LjMwMmMtLjk0NiAzLjEwMy0zLjQ2OSA1LjUtNi42ODUgNi4zMjVsLTIxLjc5IDUuNTkzLS4zMTIuMDc1YTkuODYgOS44NiAwIDAgMS05LjAwOS0yLjU3M2wtMTYuMDc0LTE1LjczOGMtMi4zNzItMi4zMjMtMy4zNTktNS42Ni0yLjYyNy04LjgybC4wNzctLjMwNUwxNzMuNjcyIDU1Yy44NDQtMy4xNDggMy4yOTMtNS42MTggNi40NjMtNi41NDNsLjMwOS0uMDg0em02LjUyMyA1LjM1NmE1Ljg2IDUuODYgMCAwIDAtNS41MjgtMS40ODJsLTIxLjc5IDUuNTkzYy0xLjk1My41MDItMy40MTQgMS45NjctMy45MDIgMy43OWwtNS43MTYgMjEuMzNjLS40ODggMS44MjMuMDQ0IDMuODIzIDEuNDg1IDUuMjMzbDE2LjA3NSAxNS43NGE1Ljg2IDUuODYgMCAwIDAgNS41MjcgMS40OGwyMS43OTEtNS41OTJjMS45NTMtLjUwMiAzLjQxMy0xLjk2NyAzLjkwMi0zLjc5bDUuNzE1LTIxLjMzMWMuNDg5LTEuODIzLS4wNDMtMy44MjItMS40ODQtNS4yMzN6bS02LjYyNyA1LjY0NmE0LjE2IDQuMTYgMCAwIDEgNC4wMTUgMS4wNzZsMTEuMzA0IDExLjMwM2E0LjE2IDQuMTYgMCAwIDEgMS4wNzUgNC4wMTRsLTQuMTM3IDE1LjQ0MWE0LjE2IDQuMTYgMCAwIDEtMi45MzkgMi45NGwtMTUuNDQxIDQuMTM2YTQuMTYgNC4xNiAwIDAgMS00LjAxNC0xLjA3NmwtMTEuMzA0LTExLjMwM2E0LjE2IDQuMTYgMCAwIDEtMS4wNzUtNC4wMTRsNC4xMzctMTUuNDQxYTQuMTYgNC4xNiAwIDAgMSAyLjkzOS0yLjk0em0tNy4yNTIgOS4wMTVhMi4yNSAyLjI1IDAgMCAwLTIuNzU1IDEuNTkxbC0zLjQ5NSAxMy4wNGEyLjI1IDIuMjUgMCAwIDAgMS41OTEgMi43NTZsMTMuMDQgMy40OTRhMi4yNSAyLjI1IDAgMCAwIDIuNzU2LTEuNTkxbDMuNDk0LTEzLjA0YTIuMjUgMi4yNSAwIDAgMC0xLjU5MS0yLjc1NnoiLz48cGF0aCBmaWxsPSIjZDBkOWZiIiBmaWxsLW9wYWNpdHk9Ii4xNiIgZD0ibTE2Ni45ODUgMTM3LjgwMy4zODggMS40NDktODguODY1IDIzLjgxMS0uMzg4LTEuNDQ5em0xLjc2OC0zLjA2Mi0yMy44MTEtODguODY1YTIuNSAyLjUgMCAwIDAtMy4wNjItMS43NjhMNTMuMDE1IDY3LjkyYTIuNSAyLjUgMCAwIDAtMS43NjggMy4wNjFsMjMuODExIDg4Ljg2NmEyLjUgMi41IDAgMCAwIDMuMDYyIDEuNzY3bC4zODggMS40NDktLjIuMDQ5YTQgNCAwIDAgMS00LjY0LTIuNjc5bC0uMDU5LS4xOThMNDkuNzk4IDcxLjM3YTQgNCAwIDAgMSAyLjgyOC00LjlsODguODY2LTIzLjgxLjItLjA1YTQgNCAwIDAgMSA0LjY5OSAyLjg3OGwyMy44MTEgODguODY1LjA0OS4yYTQgNCAwIDAgMS0yLjY4IDQuNjQxbC0uMTk4LjA1OC0uMzg4LTEuNDQ5YTIuNSAyLjUgMCAwIDAgMS43NjgtMy4wNjIiLz48cGF0aCBmaWxsPSIjZjdmN2Y4IiBkPSJNOTcuNDA1IDc0LjQ5OEE5Ljg2IDkuODYgMCAwIDEgMTA2LjcyNiA3MmwyMS43OSA1LjU5M2MzLjMxOS44NTIgNS45MDEgMy4zNzggNi43NzEgNi42MjhsNS43MTYgMjEuMzMxLjA3Ny4zMDVjLjczMiAzLjE2MS0uMjU1IDYuNDk4LTIuNjI3IDguODJsLTE2LjA3NCAxNS43MzktLjIzMy4yMjFhOS44NiA5Ljg2IDAgMCAxLTkuMDg5IDIuMjc3bC03LjUzMS0xLjkzNGEyLjI1IDIuMjUgMCAwIDEtMS42MTQtMS41OTdsLTcuNjU3LTI4LjU3OC0uMDA1LjAwMS0xLjAwMi0zLjc0YTMuNzUgMy43NSAwIDAgMSAyLjY1MS00LjU5NGwxNy4zODYtNC42NmEzLjc1IDMuNzUgMCAwIDEgNC41OTMgMi42NTJsNC4wNzYgMTUuMjEzYTMuNzUgMy43NSAwIDAgMS0yLjY1MSA0LjU5M2wtOC42OTMgMi4zMjlhMS41IDEuNSAwIDAgMS0uNzc3LTIuODk4bDguNjkzLTIuMzI5YS43NS43NSAwIDAgMCAuNTMxLS45MTlMMTE2Ljk4IDkxLjI0YS43NS43NSAwIDAgMC0uOTE4LS41M2wtMTcuMzg2IDQuNjZhLjc1Ljc1IDAgMCAwLS41My45MTlsOC41NDUgMzEuODkzIDcuMTEyIDEuODI2YTYuODYgNi44NiAwIDAgMCA2LjQ3Ny0xLjczNWwxNi4wNzQtMTUuNzM5YzEuNjkzLTEuNjU3IDIuMzM1LTQuMDI2IDEuNzUxLTYuMjA1bC01LjcxNS0yMS4zMzJjLS41ODQtMi4xNzktMi4zMjUtMy45MS00LjYyLTQuNDk5bC0yMS43OS01LjU5M2E2Ljg2IDYuODYgMCAwIDAtNi40NzYgMS43MzZMODMuNDMgOTIuMzc5Yy0xLjY5MyAxLjY1OC0yLjMzNSA0LjAyNy0xLjc1MiA2LjIwNmw1LjcxNiAyMS4zMzJjLjU4NCAyLjE3OSAyLjMyNSAzLjkwOSA0LjYyIDQuNDk4bDIuNDA0LjYxN2ExLjUgMS41IDAgMCAxLS43NDUgMi45MDZsLTIuNDA1LS42MTdjLTMuMjE2LS44MjYtNS43NC0zLjIyMi02LjY4NS02LjMyNmwtLjA4Ny0uMzAyLTUuNzE1LTIxLjMzMWMtLjg0NC0zLjE0OC4wNDItNi41MTIgMi4zMjUtOC44OTlsLjIyNS0uMjI3eiIvPjwvc3ZnPg=="
                                }), (0, O.jsxs)("div", {
                                    className: "gap-y-medium text-align-x-left flex flex-col items-start",
                                    children: [(0, O.jsxs)("div", {
                                        className: "text-heading-small medium:text-heading-medium content-emphasis margin-none gap-x-xsmall flex flex-wrap items-center justify-start",
                                        style: {
                                            fontFamily: '"Builder Extended", "Builder Sans", sans-serif'
                                        },
                                        children: [v, (0, O.jsxs)("span", {
                                            className: "gap-x-xsmall inline-flex items-center",
                                            children: [(0, O.jsx)(ts, {
                                                name: "icon-regular-robux",
                                                size: "Large"
                                            }), m]
                                        })]
                                    }), h ? (0, O.jsx)("div", {
                                        className: "bg-shift-100 radius-medium height-[40px] width-full"
                                    }) : g ? (0, O.jsx)("p", {
                                        className: "text-body-small medium:text-body-medium content-default margin-none",
                                        children: d("Description.ReferralRecipientInvitedBy", {
                                            displayName: g,
                                            amount: m
                                        }, "".concat(g, " invited you to join Plus. You'll both get ").concat(m, " Robux when you join."))
                                    }) : null]
                                }), l && (0, O.jsx)("p", {
                                    className: "text-title-medium content-emphasis margin-none",
                                    children: d("Action.PricePerMonth", {
                                        price: y,
                                        periodType: null != u ? u : eq
                                    })
                                }), c && (0, O.jsx)(u6, {
                                    featureConfig: cb(cy({}, c), {
                                        isTradingEnabled: !1,
                                        isUgcPublishingEnabled: !1
                                    }),
                                    periodType: null != u ? u : eq
                                })]
                            }) : (0, O.jsxs)(u4, {
                                className: "gap-y-large padding-top-large padding-bottom-medium medium:padding-top-xlarge medium:padding-bottom-large flex flex-col items-center text-center",
                                children: [(0, O.jsx)(ts, {
                                    className: "content-emphasis !size-1800 medium:!size-2200",
                                    name: "icon-regular-triangle-exclamation",
                                    size: "XLarge"
                                }), (0, O.jsx)("p", {
                                    className: "text-body-small medium:text-body-medium content-emphasis margin-none",
                                    children: d(cx[t].key, void 0, cx[t].fallback)
                                })]
                            }), p ? (0, O.jsx)(u3, {
                                children: (0, O.jsxs)("div", {
                                    className: "gap-y-medium width-full flex flex-col",
                                    children: [(0, O.jsx)(cp, cb(cy({}, j), {
                                        className: "width-full",
                                        size: "Large",
                                        variant: "Emphasis",
                                        children: x
                                    })), (0, O.jsx)("span", {
                                        className: "text-caption-medium content-muted",
                                        children: o5(d, "Description.SubscriptionLegal", I)
                                    })]
                                })
                            }) : (0, O.jsxs)(u3, {
                                className: "gap-y-small flex flex-col",
                                children: [(0, O.jsx)(cp, cb(cy({}, a), {
                                    className: "width-full",
                                    size: "Large",
                                    variant: "Emphasis",
                                    children: w
                                })), (0, O.jsx)(tF, {
                                    className: "width-full",
                                    size: "Large",
                                    variant: "Standard",
                                    onClick: function() {
                                        n(!1)
                                    },
                                    children: d("Action.Cancel", void 0, "Cancel")
                                })]
                            })]
                        })
                    })
                },
                cS = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.invite,
                        i = e.subscribeButtonProps,
                        o = e.subscribePrice,
                        a = e.subscribePeriodType,
                        l = e.subscribeFeatureConfig,
                        u = e.subscribeEligibleOffers,
                        c = void 0 !== n && e9(),
                        s = cu({
                            referrerId: null == n ? void 0 : n.referrerId,
                            enabled: c
                        }),
                        d = s.eligibility,
                        f = s.isLoading,
                        p = co({
                            enabled: void 0 === i || void 0 === o || void 0 === l || void 0 === u
                        }),
                        m = p.subscribeButtonProps,
                        y = p.subscribePrice,
                        b = p.subscribePeriodType,
                        g = p.subscribeFeatureConfig,
                        h = p.isLoading,
                        v = null != i ? i : m;
                    if (ct({
                            referrerId: null == n ? void 0 : n.referrerId,
                            enabled: c && void 0 !== n.code && "Eligible" === d
                        }), f) return null;
                    var w = c && "Eligible" === d ? "pitch" : "Ineligible" === d ? "ineligible" : "invalid";
                    return "pitch" === w && h || void 0 === v ? null : (0, O.jsx)(S.TranslationProvider, {
                        config: function(e) {
                            if (Array.isArray(e)) return cm(e)
                        }(cg) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(cg) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return cm(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return cm(e, void 0)
                            }
                        }(cg) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        children: (0, O.jsx)(cO, {
                            face: w,
                            featureConfig: null != l ? l : g,
                            open: t,
                            referralCode: null == n ? void 0 : n.code,
                            referrerUserId: null == n ? void 0 : n.referrerId,
                            subscribeButtonProps: v,
                            subscribePeriodType: void 0 !== o ? a : b,
                            subscribePrice: null != o ? o : y,
                            onOpenChange: r
                        })
                    })
                },
                cI = function(e, t) {
                    return "https://apis.".concat(e, "/").concat(t)
                };

            function cM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var cN = function(e) {
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
                                if ("string" == typeof e) return cM(e, 3);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return cM(e, 3)
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
                cP = cN(window.location.hostname),
                cE = new e2(new eY({
                    robloxSiteDomain: cP.rootDomain,
                    basePath: cI(cP.rootDomain, "subscriptions"),
                    credentials: "include"
                })),
                cT = function(e) {
                    var t = e.enabled,
                        r = (0, ru.userId)(),
                        n = (0, P.useQuery)({
                            queryKey: ["referral-share-link", r],
                            queryFn: function() {
                                return cE.subscriptionsV2CreateSubscriptionReferralLink()
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
                };

            function cD(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cA(e, t) {
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
                }(e, t) || cL(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function cL(e, t) {
                if (e) {
                    if ("string" == typeof e) return cD(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cD(e, t)
                }
            }
            var cC = ["Feature.RobloxSubscription"],
                cR = "margin-x-auto width-full max-width-[320px]",
                ck = "margin-bottom-[-32px]",
                cU = [{
                    opening: "linkStart",
                    closing: "linkEnd",
                    render: function(e) {
                        return (0, O.jsx)("a", {
                            className: "underline",
                            href: "https://en.help.roblox.com/hc/en-us/articles/52737229124628",
                            rel: "noopener noreferrer",
                            target: "_blank",
                            children: e
                        })
                    }
                }],
                cz = "padding-x-xlarge margin-x-auto width-full medium:max-width-[600px] large:max-width-[730px] xlarge:max-width-[840px]",
                c_ = {
                    2: "medium:[grid-template-columns:repeat(2,minmax(0,1fr))]",
                    3: "medium:[grid-template-columns:repeat(3,minmax(0,1fr))]"
                },
                cB = function(e) {
                    var t, r = e.robuxEarned,
                        n = e.referralCount,
                        i = e.pendingRobux,
                        o = (0, S.useTranslation)(),
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
                    }), (0, O.jsxs)("div", {
                        className: "width-full gap-y-medium flex flex-col",
                        children: [(0, O.jsx)("h2", {
                            className: "text-heading-small content-emphasis margin-none",
                            children: a("Heading.ReferralHistory", void 0, "Referral history")
                        }), (0, O.jsx)("div", {
                            className: "".concat("[grid-template-columns:repeat(2,minmax(0,1fr))]", " ").concat(null != (t = c_[c.length]) ? t : "", " width-full gap-medium grid"),
                            "data-testid": "plus-referral-stats-cards",
                            children: c.map(function(e) {
                                var t = e.key,
                                    r = e.label,
                                    n = e.value,
                                    i = e.hasRobuxIcon;
                                return (0, O.jsxs)("div", {
                                    className: "padding-medium gap-xsmall bg-shift-100 radius-medium min-width-0 flex flex-col",
                                    children: [(0, O.jsx)("span", {
                                        className: "text-title-medium content-muted",
                                        children: r
                                    }), (0, O.jsxs)("span", {
                                        className: "text-heading-small content-emphasis gap-x-xsmall flex items-center",
                                        children: [i ? (0, O.jsx)(ts, {
                                            name: "icon-regular-robux",
                                            size: "Small"
                                        }) : null, n]
                                    })]
                                }, t)
                            })
                        }), (0, O.jsx)("span", {
                            className: "text-caption-medium content-muted",
                            children: a("Description.SavingsDataDelay")
                        })]
                    })
                },
                cY = function(e) {
                    var t = e.label,
                        r = e.amount,
                        n = e.description;
                    return (0, O.jsxs)("div", {
                        className: "flex flex-col",
                        children: [(0, O.jsx)("span", {
                            className: "text-title-large large:text-heading-small content-emphasis",
                            children: t
                        }), (0, O.jsx)(tJ, {
                            className: "padding-x-none",
                            description: n,
                            divider: "None",
                            isContained: !0,
                            leading: (0, O.jsx)("span", {
                                className: "bg-shift-200 radius-circle size-1000 large:size-1200 flex items-center justify-center",
                                children: (0, O.jsx)(ts, {
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
                cF = function(e) {
                    var t = e.shareUrl,
                        r = e.robloxPlusUserBenefits,
                        n = (0, S.useTranslation)(),
                        i = n.translate,
                        o = n.intl,
                        a = cT({
                            enabled: void 0 === t
                        }),
                        l = a.shareUrl,
                        u = a.isLoading,
                        c = a.error,
                        s = null != t ? t : l,
                        d = cA((0, tr.useState)(!1), 2),
                        f = d[0],
                        p = d[1],
                        m = (0, tr.useRef)();
                    (0, tr.useEffect)(function() {
                        return function() {
                            window.clearTimeout(m.current)
                        }
                    }, []), (0, tr.useEffect)(function() {
                        var e = document.getElementById("footer-container"),
                            t = document.querySelector(".container-main"),
                            r = null == e ? void 0 : e.style.display,
                            n = document.body.style.marginBottom,
                            i = null == t ? void 0 : t.style.paddingBottom,
                            o = null == t ? void 0 : t.style.minHeight;
                        return e && (e.style.display = "none"), document.body.style.marginBottom = "0px", t && (t.style.paddingBottom = "0px", t.style.minHeight = "0px"),
                            function() {
                                e && (e.style.display = null != r ? r : ""), document.body.style.marginBottom = n, t && (t.style.paddingBottom = null != i ? i : "", t.style.minHeight = null != o ? o : "")
                            }
                    }, []);
                    var y = (0, tr.useCallback)(function() {
                            s && navigator.clipboard.writeText(s).then(function() {
                                p(!0), window.clearTimeout(m.current), m.current = window.setTimeout(function() {
                                    p(!1)
                                }, 2e3)
                            }).catch(function() {})
                        }, [s]),
                        b = o.n(100),
                        g = i("Label.ReferralRewardRobux", {
                            amount: b
                        }, "".concat(b, " Robux")),
                        h = i("Heading.ReferralShare", void 0, "Share Plus, get");
                    return (0, O.jsxs)("main", {
                        className: "".concat("margin-bottom-[-160px] large:margin-bottom-[-120px]", " bg-surface-0 flex flex-col"),
                        children: [(0, O.jsxs)("div", {
                            className: "".concat(cz, " gap-y-large medium:gap-y-xxlarge margin-top-[48px] padding-bottom-large flex flex-col"),
                            children: [(0, O.jsx)("img", {
                                alt: "",
                                className: "".concat(cR, " ").concat(ck, " dark:hidden"),
                                src: "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMjAiIGhlaWdodD0iMTgwIiBmaWxsPSJub25lIiB2aWV3Qm94PSIwIDAgMzIwIDE4MCI+PHBhdGggZmlsbD0iIzFiMjU0YiIgZmlsbC1vcGFjaXR5PSIuMTYiIGQ9Ik0yNTYuNDg2IDM2LjkwNWE0IDQgMCAwIDEgMi42MzEgNC44NGwtMjMuODExIDg4Ljg2Ni0uMDU5LjE5OGE0IDQgMCAwIDEtNC42NCAyLjY3OWwtLjItLjA0OS02NS4xMzMtMTcuNDUyLS40NDgtMS42NzMgNjUuOTY5IDE3LjY3NmEyLjUgMi41IDAgMCAwIDMuMDYyLTEuNzY3bDIzLjgxMS04OC44NjZhMi41IDIuNSAwIDAgMC0xLjc2OC0zLjA2MmwtODguODY1LTIzLjgxYTIuNSAyLjUgMCAwIDAtMy4wNjIgMS43NjdMMTUxLjI2MiA2My42OWwtLjc3Ni0yLjg5OCAxMi4wMzgtNDQuOTI4YTQgNCAwIDAgMSA0Ljg5OS0yLjgyOWw4OC44NjUgMjMuODEyeiIvPjxwYXRoIGZpbGw9IiMyMDIyMjciIGQ9Ik0yMDIuMjMzIDQyLjc4YTkuODYgOS44NiAwIDAgMSA5LjMyMiAyLjQ5OGwxNi4wNzQgMTUuNzM5YzIuNDQ4IDIuMzk3IDMuNDIxIDUuODc2IDIuNTUgOS4xMjVsLTUuNzE2IDIxLjMzMi0uMDg2LjMwMmMtLjk0NiAzLjEwMy0zLjQ2OSA1LjUtNi42ODUgNi4zMjVsLTIxLjc5IDUuNTkzLS4zMTIuMDc1YTkuODYgOS44NiAwIDAgMS05LjAwOS0yLjU3M2wtNS40NTEtNS4zMzdhMyAzIDAgMCAxLS43OTktMi45Mmw3LjUwNy0yOC4wMTYgMS4wMDItMy43NDJhNCA0IDAgMCAxIDQuODk5LTIuODI4bDE3LjM4NyA0LjY1N2E0IDQgMCAwIDEgMi44MjggNC44OTlsLTQuMDc2IDE1LjIxM2E0IDQgMCAwIDEtNC44OTkgMi44MjlsLTguNjkzLTIuMzNhMS43NSAxLjc1IDAgMCAxIC45MDUtMy4zOGw4LjY5NCAyLjMyOWEuNS41IDAgMCAwIC42MTItLjM1NGw0LjA3Ny0xNS4yMTNhLjUuNSAwIDAgMC0uMzU0LS42MTJsLTE3LjM4Ny00LjY1N2EuNS41IDAgMCAwLS42MTMuMzUzbC04LjQzMyAzMS40NzYgNS4yNDIgNS4xMzNhNi4zNiA2LjM2IDAgMCAwIDYuMDAzIDEuNjA5bDIxLjc5LTUuNTkzYzIuMTI0LS41NDYgMy43MjQtMi4xNDQgNC4yNjEtNC4xNDRsNS43MTUtMjEuMzMyYy41MzYtMi0uMDUxLTQuMTg1LTEuNjE4LTUuNzE5TDIwOS4xMDcgNDcuNzhhNi4zNiA2LjM2IDAgMCAwLTYuMDA0LTEuNjA5bC0yMS43ODkgNS41OTNjLTIuMTI0LjU0NS0zLjcyNSAyLjE0My00LjI2MSA0LjE0NGwtNS43MTYgMjEuMzMyYy0uNTM2IDIgLjA1MiA0LjE4NSAxLjYxOCA1LjcxOWwyLjMxIDIuMjZjLjQ1MS40NDIuNjI5IDEuMDkzLjQ2NiAxLjcwNC0uMzQ3IDEuMjkzLTEuOTU4IDEuNzM0LTIuOTE0Ljc5N2wtMi4zMS0yLjI2MWMtMi4zNzItMi4zMjMtMy4zNTktNS42Ni0yLjYyNy04LjgybC4wNzctLjMwNUwxNzMuNjcyIDU1Yy44NDQtMy4xNDggMy4yOTMtNS42MTcgNi40NjMtNi41NDNsLjMwOS0uMDg0eiIvPjxwYXRoIGZpbGw9IiMxYjI1NGIiIGZpbGwtb3BhY2l0eT0iLjE2IiBkPSJtMTY2Ljk4NSAxMzcuODAzLjM4OCAxLjQ0OS04OC44NjUgMjMuODExLS4zODgtMS40NDl6bTEuNzY4LTMuMDYyLTIzLjgxMS04OC44NjVhMi41IDIuNSAwIDAgMC0zLjA2Mi0xLjc2OEw1My4wMTUgNjcuOTJhMi41IDIuNSAwIDAgMC0xLjc2OCAzLjA2MWwyMy44MTEgODguODY2YTIuNSAyLjUgMCAwIDAgMy4wNjIgMS43NjdsLjM4OCAxLjQ0OS0uMi4wNDlhNCA0IDAgMCAxLTQuNjQtMi42NzlsLS4wNTktLjE5OEw0OS43OTggNzEuMzdhNCA0IDAgMCAxIDIuODI4LTQuOWw4OC44NjYtMjMuODEuMi0uMDVhNCA0IDAgMCAxIDQuNjk5IDIuODc4bDIzLjgxMSA4OC44NjUuMDQ5LjJhNCA0IDAgMCAxLTIuNjggNC42NDFsLS4xOTguMDU4LS4zODgtMS40NDlhMi41IDIuNSAwIDAgMCAxLjc2OC0zLjA2MiIvPjxwYXRoIGZpbGw9IiMyMDIyMjciIGQ9Ik0xMjAuOTU1IDcwLjI0NmM1LjA1NC0zLjg4MiAxMi4zMjEuMDM1IDExLjg2MSA2LjM5MmwtMi45OTIgNDEuMzkzLS4wNDcuNDUyYy0uNTk0IDQuNDgtNS4wNzQgNy4zODQtOS40MDUgNi4wOTdsLS40MzMtLjE0My01LjUxMy0yLjAwNS02LjA5MyA5LjY0Yy0uODIxIDEuMzAxLTIuMjQ3IDEuODEzLTMuNTAzIDEuNjgyLTEuMjYtLjEzMS0yLjU5NS0uOTUtMy4wMTMtMi41MTFMOTcuODM5IDExNi40bC0xMi40NDMtNC41MjVjLTUuMzkyLTEuOTYtNi41Ni05LjAyMy0yLjE4OC0xMi42M2wuMjEyLS4xNjh6bS0xNS43NzYgNjAuMDIzcS4wMDYuMDAxLjAxMy4wMDNhLjI1LjI1IDAgMCAwIC4xMjQtLjAxNy4xMi4xMiAwIDAgMCAuMDU4LS4wNTJoLjAwMWw1LjY4NC04Ljk5NS05LjIwNS0zLjM0OHptMjQuMTQ2LTUzLjg4NGMuMjQyLTMuMzQ3LTMuNTgzLTUuNDAzLTYuMjM4LTMuMzYzbC0zNy41MzQgMjguODNjLTIuNDMgMS44NjctMS44NDMgNS42ODUgMS4wMzkgNi43MzRsMTIuMDEgNC4zNjcgMTAuOTYzLTE2LjAxYTEuNzUgMS43NSAwIDAgMSAyLjg4NyAxLjk3OWwtMTAuNDUzIDE1LjI2NiAxOS4xMzYgNi45NTljMi40MjEuODggNS4wMTItLjc5NyA1LjE5OC0zLjM2OXoiLz48L3N2Zz4="
                            }), (0, O.jsx)("img", {
                                alt: "",
                                className: "".concat(cR, " ").concat(ck, " hidden dark:block"),
                                src: "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMjAiIGhlaWdodD0iMTgwIiBmaWxsPSJub25lIiB2aWV3Qm94PSIwIDAgMzIwIDE4MCI+PHBhdGggZmlsbD0iI2QwZDlmYiIgZmlsbC1vcGFjaXR5PSIuMTYiIGQ9Ik0yNTYuNDg2IDM2LjkwNWE0IDQgMCAwIDEgMi42MzEgNC44NGwtMjMuODExIDg4Ljg2Ni0uMDU5LjE5OGE0IDQgMCAwIDEtNC42NCAyLjY3OWwtLjItLjA0OS02NS4xMzMtMTcuNDUyLS40NDgtMS42NzMgNjUuOTY5IDE3LjY3NmEyLjUgMi41IDAgMCAwIDMuMDYyLTEuNzY3bDIzLjgxMS04OC44NjZhMi41IDIuNSAwIDAgMC0xLjc2OC0zLjA2MmwtODguODY1LTIzLjgxYTIuNSAyLjUgMCAwIDAtMy4wNjIgMS43NjdMMTUxLjI2MiA2My42OWwtLjc3Ni0yLjg5OCAxMi4wMzgtNDQuOTI4YTQgNCAwIDAgMSA0Ljg5OS0yLjgyOWw4OC44NjUgMjMuODEyeiIvPjxwYXRoIGZpbGw9IiNmN2Y3ZjgiIGQ9Ik0yMDIuMjMzIDQyLjc4YTkuODYgOS44NiAwIDAgMSA5LjMyMiAyLjQ5OGwxNi4wNzQgMTUuNzM5YzIuNDQ4IDIuMzk3IDMuNDIxIDUuODc2IDIuNTUgOS4xMjVsLTUuNzE2IDIxLjMzMi0uMDg2LjMwMmMtLjk0NiAzLjEwMy0zLjQ2OSA1LjUtNi42ODUgNi4zMjVsLTIxLjc5IDUuNTkzLS4zMTIuMDc1YTkuODYgOS44NiAwIDAgMS05LjAwOS0yLjU3M2wtNS40NTEtNS4zMzdhMyAzIDAgMCAxLS43OTktMi45Mmw3LjUwNy0yOC4wMTYgMS4wMDItMy43NDJhNCA0IDAgMCAxIDQuODk5LTIuODI4bDE3LjM4NyA0LjY1N2E0IDQgMCAwIDEgMi44MjggNC44OTlsLTQuMDc2IDE1LjIxM2E0IDQgMCAwIDEtNC44OTkgMi44MjlsLTguNjkzLTIuMzNhMS43NSAxLjc1IDAgMCAxIC45MDUtMy4zOGw4LjY5NCAyLjMyOWEuNS41IDAgMCAwIC42MTItLjM1NGw0LjA3Ny0xNS4yMTNhLjUuNSAwIDAgMC0uMzU0LS42MTJsLTE3LjM4Ny00LjY1N2EuNS41IDAgMCAwLS42MTMuMzUzbC04LjQzMyAzMS40NzYgNS4yNDIgNS4xMzNhNi4zNiA2LjM2IDAgMCAwIDYuMDAzIDEuNjA5bDIxLjc5LTUuNTkzYzIuMTI0LS41NDYgMy43MjQtMi4xNDQgNC4yNjEtNC4xNDRsNS43MTUtMjEuMzMyYy41MzYtMi0uMDUxLTQuMTg1LTEuNjE4LTUuNzE5TDIwOS4xMDcgNDcuNzhhNi4zNiA2LjM2IDAgMCAwLTYuMDA0LTEuNjA5bC0yMS43ODkgNS41OTNjLTIuMTI0LjU0NS0zLjcyNSAyLjE0My00LjI2MSA0LjE0NGwtNS43MTYgMjEuMzMyYy0uNTM2IDIgLjA1MiA0LjE4NSAxLjYxOCA1LjcxOWwyLjMxIDIuMjZjLjQ1MS40NDIuNjI5IDEuMDkzLjQ2NiAxLjcwNC0uMzQ3IDEuMjkzLTEuOTU4IDEuNzM0LTIuOTE0Ljc5N2wtMi4zMS0yLjI2MWMtMi4zNzItMi4zMjMtMy4zNTktNS42Ni0yLjYyNy04LjgybC4wNzctLjMwNUwxNzMuNjcyIDU1Yy44NDQtMy4xNDggMy4yOTMtNS42MTcgNi40NjMtNi41NDNsLjMwOS0uMDg0eiIvPjxwYXRoIGZpbGw9IiNkMGQ5ZmIiIGZpbGwtb3BhY2l0eT0iLjE2IiBkPSJtMTY2Ljk4NSAxMzcuODAzLjM4OCAxLjQ0OS04OC44NjUgMjMuODExLS4zODgtMS40NDl6bTEuNzY4LTMuMDYyLTIzLjgxMS04OC44NjVhMi41IDIuNSAwIDAgMC0zLjA2Mi0xLjc2OEw1My4wMTUgNjcuOTJhMi41IDIuNSAwIDAgMC0xLjc2OCAzLjA2MWwyMy44MTEgODguODY2YTIuNSAyLjUgMCAwIDAgMy4wNjIgMS43NjdsLjM4OCAxLjQ0OS0uMi4wNDlhNCA0IDAgMCAxLTQuNjQtMi42NzlsLS4wNTktLjE5OEw0OS43OTggNzEuMzdhNCA0IDAgMCAxIDIuODI4LTQuOWw4OC44NjYtMjMuODEuMi0uMDVhNCA0IDAgMCAxIDQuNjk5IDIuODc4bDIzLjgxMSA4OC44NjUuMDQ5LjJhNCA0IDAgMCAxLTIuNjggNC42NDFsLS4xOTguMDU4LS4zODgtMS40NDlhMi41IDIuNSAwIDAgMCAxLjc2OC0zLjA2MiIvPjxwYXRoIGZpbGw9IiNmN2Y3ZjgiIGQ9Ik0xMjAuOTU1IDcwLjI0NWM1LjA1My0zLjg4MSAxMi4zMjEuMDM1IDExLjg2MSA2LjM5MmwtMi45OTIgNDEuMzkzLS4wNDcuNDUzYy0uNTk0IDQuNDgtNS4wNzQgNy4zODQtOS40MDUgNi4wOTdsLS40MzMtLjE0My01Ljc1NC0yLjA5My02LjA2MyA5LjU5NWMtLjc2NSAxLjIxLTIuMDkyIDEuNjg4LTMuMjY2IDEuNTY2LTEuMTc4LS4xMjItMi40MTEtLjg4NC0yLjc5OC0yLjMyN2wtMy45MzItMTQuNjczLTEyLjczLTQuNjNjLTUuMzkyLTEuOTYxLTYuNTYxLTkuMDIzLTIuMTg4LTEyLjYzbC4yMTItLjE2OXptLTE1Ljk5OSA2MC4xNTdjLjAwOS4wMzQuMDIuMDQ3LjAzNy4wNmEuMzYuMzYgMCAwIDAgLjE3My4wNTkuNDMuNDMgMCAwIDAgLjQxOS0uMTg1bDUuNzE0LTkuMDQyLTkuNzMyLTMuNTM5em0yNC44NjctNTMuOThjLjI3My0zLjc3OC00LjA0My02LjEtNy4wNDEtMy43OTdsLTM3LjUzNSAyOC44M2MtMi43NDMgMi4xMDctMi4wNzggNi40MTggMS4xNzQgNy42MDFsMTIuMTMyIDQuNDExIDExLjIxNy0xNi4zODJhMS41IDEuNSAwIDAgMSAyLjQ3NiAxLjY5NGwtMTAuNzgyIDE1Ljc0NiAxOS41IDcuMDkzYzIuNzMzLjk5MyA1LjY1OC0uOTAxIDUuODY4LTMuODA0eiIvPjwvc3ZnPg=="
                            }), (0, O.jsxs)("div", {
                                className: "gap-y-none flex flex-col",
                                children: [(0, O.jsxs)("h1", {
                                    className: "text-heading-medium medium:text-heading-large large:text-display-small content-emphasis margin-none gap-x-small wrap flex items-center",
                                    style: {
                                        fontFamily: '"Builder Extended", "Builder Sans", sans-serif'
                                    },
                                    children: [h, (0, O.jsxs)("span", {
                                        className: "gap-x-xsmall flex items-center",
                                        children: [(0, O.jsx)(ts, {
                                            name: "icon-regular-robux",
                                            size: "XLarge"
                                        }), b]
                                    })]
                                }), (0, O.jsx)("p", {
                                    className: "text-body-medium medium:text-body-large content-default margin-none",
                                    children: i("Description.ReferralShare", {
                                        amount: b
                                    }, "Invite someone to Plus and you both get ".concat(b, " Robux when they join."))
                                })]
                            }), (0, O.jsxs)("div", {
                                className: "gap-y-medium flex flex-col",
                                children: [(0, O.jsx)(cY, {
                                    amount: g,
                                    description: i("Description.ReferralReferrerReward", void 0, "When anyone joins Plus with your link."),
                                    label: i("Label.ReferralYouGet", void 0, "You get")
                                }), (0, O.jsx)(cY, {
                                    amount: g,
                                    description: i("Description.ReferralRecipientReward", void 0, "Offer valid for new Plus subscribers only."),
                                    label: i("Label.ReferralTheyGet", void 0, "Your referrals get")
                                })]
                            }), (0, O.jsx)(cB, {
                                pendingRobux: null == r ? void 0 : r.pendingRobuxEarnedFromReferrals,
                                referralCount: null == r ? void 0 : r.referralsCount,
                                robuxEarned: null == r ? void 0 : r.robuxEarnedFromReferrals
                            })]
                        }), (0, O.jsx)("div", {
                            className: "padding-y-medium shrink-0",
                            children: (0, O.jsxs)("div", {
                                className: "".concat(cz, " gap-y-small flex flex-col"),
                                children: [(0, O.jsxs)("div", {
                                    className: "gap-x-small flex items-start",
                                    children: [(0, O.jsx)("div", {
                                        className: "grow-1 min-width-0",
                                        children: (0, O.jsx)(o0, {
                                            "aria-label": i("Description.ReferralShareLink", void 0, "Referral link"),
                                            error: c ? i("Message.ReferralLinkError", void 0, "We could not create your link. Please try again later.") : void 0,
                                            hasError: !!c,
                                            isDisabled: !0,
                                            readOnly: !0,
                                            size: "Large",
                                            value: c ? "" : null != s ? s : i("Label.Loading", void 0, "Loading")
                                        })
                                    }), (0, O.jsx)(tF, {
                                        className: "width-[200px] shrink-0",
                                        isDisabled: !s,
                                        isLoading: u,
                                        size: "Large",
                                        variant: "Emphasis",
                                        onClick: y,
                                        children: f ? i("Label.ReferralLinkCopied", void 0, "Link copied") : i("Action.CopyReferralLink", void 0, "Copy link")
                                    })]
                                }), (0, O.jsx)("span", {
                                    className: "text-caption-medium content-muted",
                                    children: o5(i, "Description.ReferralTerms", cU)
                                })]
                            })
                        })]
                    })
                },
                cG = function(e) {
                    var t = e.onClose,
                        r = e.robloxPlusUserBenefits,
                        n = e.subscribeButtonProps,
                        i = cA((0, tr.useState)("loading"), 2),
                        o = i[0],
                        a = i[1],
                        l = cA((0, tr.useState)(), 2),
                        u = l[0],
                        c = l[1],
                        s = (0, tr.useRef)(t);
                    return (s.current = t, (0, tr.useEffect)(function() {
                        if (!(0, ru.isAuthenticated)()) return void s.current();
                        var e = !0;
                        return cE.subscriptionsV2CreateSubscriptionReferralLink().then(function(t) {
                                e && (c(t.deepLinkUrl), a("ready"))
                            }).catch(function() {
                                e && a("invalid")
                            }),
                            function() {
                                e = !1
                            }
                    }, []), "loading" === o) ? null : (0, O.jsx)(S.TranslationProvider, {
                        config: function(e) {
                            if (Array.isArray(e)) return cD(e)
                        }(cC) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(cC) || cL(cC) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        children: "ready" === o ? (0, O.jsx)(cF, {
                            robloxPlusUserBenefits: r,
                            shareUrl: u
                        }) : (0, O.jsx)(cS, {
                            open: !0,
                            subscribeButtonProps: n,
                            onOpenChange: function(e) {
                                e || t()
                            }
                        })
                    })
                },
                cW = window.CoreRobloxUtilities,
                cQ = window.Roblox["core-scripts"].localStorage.localStorage,
                cV = r.n(cQ),
                cq = window.CoreUtilities,
                cK = window.Roblox["core-scripts"].paymentsFlow,
                cH = r.n(cK),
                cX = window.EventTracker;

            function cZ(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function c$(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var cJ = ((y = {}).GET = "GET", y.POST = "POST", y),
                c0 = ((b = {}).PAYMENT = "Payment", b.ROBUX = "Robux", b.ROBUX_GIFTING = "RobuxGifting", b.ROBUX_REDESIGN = "RobuxRedesign", b),
                c1 = ((g = {}).VERIFY_PHONE_VERIFICATION_SESSION = "VerifyPhoneVerificationSession", g.LANDING_PAGE_METADATA = "GetLandingPageMetadata", g.GET_USER_NAME = "GetUserName", g.PREPARE_PAYMENT = "PreparePayment", g.GET_METADATA = "GetMetadata", g.GET_PRODUCTS = "GetProducts", g.GET_PAYMENT_METHODS_INFO = "GetPaymentMethodsInfo", g.GET_PURCHASE_WARNING = "GetPurchaseWarning", g.GET_USER_PURCHASE_ELIGIBILITY = "GetUserPurchaseEligibility", g.CREATE_PAYMENT_SESSION = "CreatePaymentSession", g.GET_PAYMENT_SESSION = "GetPaymentSession", g.GET_PAYMENT_SESSION_BY_CHECKOUT_SESSION_ID = "GetPaymentSessionByCheckoutSessionId", g.CREATE_BONUS_SESSION = "CreateBonusSession", g.GET_BONUS_SESSION_BY_CHECKOUT_SESSION_ID = "GetBonusSessionByCheckoutSessionId", g.GET_DISPLAYABLE_BONUS_FOR_PRODUCT = "GetDisplayableBonusForProduct", g.GET_THUMBNAILS = "GetThumbnails", g.HANDLE_GAME_PASS_JOIN_EVENT = "HandleGamePassJoinEvent", g.GET_ROBUX_BALANCE = "GetRobuxBalance", g.GET_AUTH_TICKET = "GetAuthTicket", g.GET_CLIENT_ASSERTION = "GetClientAssertion", g),
                c4 = function(e, t, r) {
                    return new Promise(function(n) {
                        (0, cX.fireEvent)("API_COUNTER_".concat(e, "_").concat(t, "_").concat(r || "Throughput")), n()
                    })
                },
                c2 = function(e, t, r) {
                    return new Promise(function(n) {
                        (0, cX.fireEvent)("ERROR_COUNTER_".concat(e, "_").concat(t, "_").concat(r || "UnknownAxiosError")), n()
                    })
                };

            function c3(e, t, r, n, i) {
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
                                o = r.feature, a = r.call, c4(o, a), f.label = 1;
                            case 1:
                                return f.trys.push([1, 3, , 4]), [4, "GET" === e ? cq.httpService.get(t, n) : cq.httpService.post(t, n)];
                            case 2:
                                return u = (l = f.sent()).data, c = l.headers, c4(o, a, 200), [2, (null == i ? void 0 : i(u, c)) || u];
                            case 3:
                                var p, m, y;
                                return (void 0 === (p = s = f.sent()) ? "undefined" : c$(p)) === "object" && "status" in p ? c2(o, a, s.status) : (void 0 === s ? "undefined" : c$(s)) === "object" && "config" in s ? c2(o, a, null == (d = s.response) ? void 0 : d.status) : (console.error(s), m = o, y = a, new Promise(function(e) {
                                    (0, cX.fireEvent)("ERROR_COUNTER_".concat(m, "_").concat(y, "_NonAxiosError")), e()
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
                            cZ(i, r, n, a, l, "next", e)
                        }

                        function l(e) {
                            cZ(i, r, n, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }).apply(this, arguments)
            }

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

            function c6(e) {
                return function() {
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
                }
            }

            function c8(e, t) {
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

            function c9(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

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

            function se(e, t) {
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
                        if ("string" == typeof e) return c9(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return c9(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var st = "paymentSession-".concat((null === u8.CurrentUser || void 0 === u8.CurrentUser ? void 0 : u8.CurrentUser.userId) || "loggedout");

            function sr(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var sn = function(e) {
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
                si = function(e) {
                    var t, r = e.subscribeButtonProps,
                        n = e.subscribePrice,
                        i = e.subscribePeriodType,
                        o = e.subscribeFeatureConfig,
                        a = e.subscribeEligibleOffers,
                        l = (0, tr.useMemo)(function() {
                            return sn(window.location.search)
                        }, []),
                        u = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, tr.useState)("none" !== l.kind)) || function(e) {
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
                                if ("string" == typeof e) return sr(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sr(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        c = u[0],
                        s = u[1];
                    return "none" === l.kind ? null : (0, O.jsx)(cS, {
                        invite: "invite" === l.kind ? l : void 0,
                        open: c,
                        subscribeButtonProps: r,
                        subscribeEligibleOffers: a,
                        subscribeFeatureConfig: o,
                        subscribePeriodType: i,
                        subscribePrice: n,
                        onOpenChange: s
                    })
                },
                so = function(e) {
                    var t = e.title,
                        r = e.body,
                        n = e.equipText,
                        i = e.onEquip,
                        o = e.onItemDetailsClick,
                        a = null != o;
                    return (0, O.jsxs)("div", {
                        "aria-label": a ? t : void 0,
                        className: "bg-shift-200 radius-medium padding-medium gap-medium width-full flex items-center ".concat(a ? "hover:bg-surface-100 cursor-pointer" : ""),
                        role: a ? "button" : void 0,
                        tabIndex: a ? 0 : void 0,
                        onClick: o,
                        onKeyDown: a ? function(e) {
                            e.target === e.currentTarget && ("Enter" === e.key || " " === e.key) && (e.preventDefault(), null == o || o())
                        } : void 0,
                        children: [(0, O.jsx)("div", {
                            className: "radius-medium size-[50px] shrink-0 overflow-hidden",
                            children: (0, O.jsx)("img", {
                                alt: t,
                                className: "size-full object-cover",
                                src: "https://images.rbxcdn.com/edf7aeadb32b5c26.png"
                            })
                        }), (0, O.jsxs)("div", {
                            className: "min-width-0 grow-1 shrink-1 flex basis-0 flex-col justify-center",
                            children: [(0, O.jsx)("span", {
                                className: "text-title-medium content-emphasis",
                                children: t
                            }), (0, O.jsx)("span", {
                                className: "text-body-medium content-default",
                                children: r
                            })]
                        }), null != n && null != i && (0, O.jsx)(tF, {
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
                sa = function(e) {
                    var t = e.size,
                        r = e.variant,
                        n = (0, (0, S.useTranslation)().translate)("Label.Blackbird");
                    return "compact" === (void 0 === r ? "default" : r) ? (0, O.jsxs)("div", {
                        className: "gap-x-xxsmall flex items-center",
                        children: [(0, O.jsx)(ts, {
                            className: "relative",
                            name: "icon-regular-roblox-plus",
                            size: "Large",
                            style: {
                                top: -1
                            }
                        }), (0, O.jsx)("span", {
                            className: "text-label-large content-emphasis text-no-wrap",
                            children: n
                        })]
                    }) : (0, O.jsxs)("div", {
                        className: "gap-x-small flex items-center",
                        children: [(0, O.jsx)(ts, {
                            className: "!size-1000 relative",
                            name: "icon-regular-roblox-plus",
                            style: {
                                top: -4
                            }
                        }), "large" === (void 0 === t ? "large" : t) ? (0, O.jsx)("h1", {
                            className: "font-builder-extended text-display-small text-no-wrap",
                            children: n
                        }) : (0, O.jsx)("h2", {
                            className: "text-heading-large",
                            children: n
                        })]
                    })
                },
                sl = window.Roblox["core-scripts"].format.string,
                su = function(e) {
                    var t, r = e.eligibleOffers,
                        n = e.price,
                        i = e.periodType,
                        o = (0, S.useTranslation)().translate,
                        a = cr(n),
                        l = o("Description.BillingInfo", {
                            price: "<span class='text-heading-medium'>".concat((0, sl.escapeHtml)(a), "</span>"),
                            periodType: i
                        }),
                        u = o("Description.BillingInfoWithFreeTrialOffer", {
                            boldTagStart: "<b>",
                            boldTagEnd: "</b>",
                            trialPeriod: 1,
                            trialPeriodType: i,
                            price: (0, sl.escapeHtml)(a),
                            periodType: i
                        }),
                        c = null != (t = null == r ? void 0 : r.some(function(e) {
                            return "FreeTrial" === e.offerType
                        })) && t;
                    return (0, O.jsx)("span", {
                        dangerouslySetInnerHTML: {
                            __html: c ? u : l
                        },
                        className: "text-body-large"
                    })
                },
                sc = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                ss = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                sd = function(e) {
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
                    return tn().createElement("button", function(e) {
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
                        className: ti("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", td, ss[t], sc[r], n && "radius-circle", i)
                    }, o), tn().createElement(tf, null), tn().createElement(ts, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function sf(e) {
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

            function sp(e, t) {
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
            var sm = (0, tr.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                sy = function() {
                    var e = (0, tr.useContext)(sm);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                sb = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                sg = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                sh = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                sv = function(e) {
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
                        g = void 0 !== b && b,
                        h = (0, tr.useMemo)(function() {
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
                    return (0, tr.useEffect)(function() {
                        g && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [g, t]), tn().createElement(sm.Provider, {
                        value: h
                    }, tn().createElement(l5, {
                        open: t,
                        onOpenChange: r
                    }, n))
                };
            sv.displayName = "Dialog";
            var sw = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.style,
                    i = e.overlayClassName,
                    o = e.overlayStyle,
                    a = e.onOpenAutoFocus,
                    l = sp(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    u = sy(),
                    c = u.size,
                    s = u.isModal,
                    d = u.hasCloseAffordance,
                    f = u.closeLabel,
                    p = u.hasDescription,
                    m = ti("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", s && "bg-common-backdrop", i),
                    y = ti("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return tn().createElement(ut, null, tn().createElement(un, {
                    className: m,
                    style: o
                }, tn().createElement(ul, sf({
                    className: y,
                    "data-size": c,
                    style: n,
                    onOpenAutoFocus: a
                }, !p && {
                    "aria-describedby": void 0
                }, l), d && tn().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, tn().createElement(uy, {
                    asChild: !0
                }, tn().createElement(sd, {
                    variant: "OverMedia",
                    size: c,
                    isCircular: !0,
                    "aria-label": f
                }))), t)))
            };
            sw.displayName = "DialogContent";
            var sx = function(e) {
                var t = e.children,
                    r = e.className,
                    n = sp(e, ["children", "className"]),
                    i = sy(),
                    o = i.size,
                    a = i.hasMarginTop,
                    l = i.hasMarginBottom,
                    u = ti(sb[o], a && sg[o], l && sh[o], r);
                return tn().createElement("div", sf({
                    className: u
                }, n), t)
            };
            sx.displayName = "DialogBody";
            var sj = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.hidden,
                    i = sp(e, ["children", "className", "hidden"]),
                    o = tn().createElement(uf, sf({
                        className: r
                    }, i), t);
                return n ? tn().createElement(uB, null, o) : o
            };
            sj.displayName = "DialogTitle";
            var sO = function(e) {
                var t = e.children,
                    r = e.className,
                    n = sp(e, ["children", "className"]),
                    i = sy().size,
                    o = ti(sb[i], sh[i], r);
                return tn().createElement("div", sf({
                    className: o
                }, n), t)
            };
            sO.displayName = "DialogFooter";
            var sS = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.title,
                        i = e.body,
                        o = (0, S.useTranslation)().translate;
                    return (0, O.jsx)(sv, {
                        closeLabel: o("Action.Close"),
                        hasCloseAffordance: !0,
                        isModal: !0,
                        open: t,
                        size: "Small",
                        type: "Default",
                        onOpenChange: r,
                        children: (0, O.jsxs)(sw, {
                            className: "stroke-standard stroke-default flex flex-col items-start",
                            style: {
                                width: "100%",
                                maxWidth: 320
                            },
                            children: [(0, O.jsxs)(sx, {
                                className: "width-full gap-small padding-top-medium padding-x-xlarge padding-bottom-large flex flex-col items-start",
                                children: [(0, O.jsx)(sj, {
                                    className: "margin-none text-heading-small content-emphasis text-align-x-start",
                                    children: n
                                }), (0, O.jsx)("p", {
                                    className: "margin-none text-body-medium content-default text-align-x-start whitespace-pre-line",
                                    children: i
                                })]
                            }), (0, O.jsx)(sO, {
                                className: "width-full",
                                children: (0, O.jsx)(tF, {
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
                sI = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600"
                },
                sM = {
                    XSmall: "size-150",
                    Small: "size-200",
                    Medium: "size-250"
                },
                sN = {
                    XSmall: "size-1200",
                    Small: "size-1400",
                    Medium: "size-1600"
                },
                sP = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium"
                },
                sE = {
                    XSmall: void 0,
                    Small: "padding-top-xxsmall",
                    Medium: "padding-y-xxsmall"
                },
                sT = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium"
                },
                sD = {
                    XSmall: "padding-medium",
                    Small: "padding-large",
                    Medium: "padding-xlarge"
                },
                sA = {
                    XSmall: "Small",
                    Small: "Medium",
                    Medium: "Large"
                },
                sL = (0, tr.forwardRef)(function(e, t) {
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
                        y = (0, tr.useMemo)(function() {
                            return a && tn().createElement("div", {
                                className: ti(sP[n], sE[n], "content-emphasis text-align-x-start", "clip [display:-webkit-box] [-webkit-line-clamp:3] [-webkit-box-orient:vertical]")
                            }, a)
                        }, [a, n]),
                        b = (0, tr.useMemo)(function() {
                            return s && tn().createElement("div", {
                                className: ti("text-caption-small content-default text-align-x-start", "text-truncate-split text-no-wrap width-full")
                            }, s)
                        }, [s]),
                        g = (0, tr.useMemo)(function() {
                            return l && tn().createElement("div", {
                                className: ti(sT[n], "content-default text-align-x-start")
                            }, l)
                        }, [l, n]),
                        h = (0, tr.useMemo)(function() {
                            return c && tn().createElement(ts, {
                                name: c,
                                size: sA[n]
                            })
                        }, [c, n]),
                        v = (0, tr.useMemo)(function() {
                            switch (i) {
                                case "Checkmark":
                                    return d && tn().createElement(ts, {
                                        name: "icon-filled-check",
                                        size: sA[n]
                                    });
                                case "Checkbox":
                                    return tn().createElement("div", {
                                        className: ti(sI[n], "flex items-center justify-center radius-small padding-none content-default", d ? "stroke-none" : "stroke-standard stroke-emphasis", d ? "bg-system-contrast" : "bg-none")
                                    }, d && tn().createElement("div", {
                                        className: ti(sI[n], "content-inverse-emphasis icon icon-filled-check")
                                    }));
                                case "Radio":
                                    return tn().createElement("div", {
                                        className: ti(sI[n], "radius-circle flex items-center justify-center stroke-emphasis stroke-standard", d ? "bg-system-contrast" : "bg-none")
                                    }, d && tn().createElement("div", {
                                        className: ti("radius-circle bg-inverse-action-sub-emphasis", sM[n])
                                    }));
                                default:
                                    return console.error("Invalid OptionSelector type ".concat(i)), null
                            }
                        }, [i, n, d]),
                        w = (0, tr.useMemo)(function() {
                            return u && tn().createElement("div", {
                                className: ti(sN[n], "flex items-center justify-center clip shrink-0")
                            }, u)
                        }, [u, n]),
                        x = (0, tr.useMemo)(function() {
                            var e = !m && tn().createElement("div", {
                                className: sI[n]
                            }, v);
                            switch (r) {
                                case "Horizontal":
                                    return tn().createElement("div", {
                                        className: "flex gap-large"
                                    }, w, tn().createElement("div", {
                                        className: "flex flex-col gap-xsmall fill clip"
                                    }, tn().createElement("div", {
                                        className: "flex gap-small items-start"
                                    }, tn().createElement("div", {
                                        className: "flex flex-col items-start fill clip"
                                    }, tn().createElement("div", {
                                        className: "flex gap-small items-center width-full"
                                    }, h, y), b), e), g));
                                case "Vertical":
                                    return tn().createElement("div", {
                                        className: "flex flex-col gap-xsmall"
                                    }, tn().createElement("div", {
                                        className: "flex gap-small"
                                    }, tn().createElement("div", {
                                        className: "flex flex-col gap-medium fill min-width-0"
                                    }, w, tn().createElement("div", {
                                        className: "flex flex-col gap-xsmall"
                                    }, h, y, b)), e), g);
                                default:
                                    return console.error("Invalid OptionSelector layout ".concat(r)), null
                            }
                        }, [r, w, h, y, g, v, n, b, m]);
                    return tn().createElement("button", {
                        type: "button",
                        className: ti(td, "focus:outline-focus bg-none width-full radius-medium stroke-standard", d ? "stroke-system-contrast" : "stroke-contrast-alpha", sD[n], o && "opacity-[0.5]", !o && "cursor-pointer"),
                        disabled: o,
                        ref: t,
                        onClick: function() {
                            return f()
                        }
                    }, !o && tn().createElement(tf, null), x)
                });
            sL.displayName = "OptionSelector";
            var sC = ((h = {}).LIST_AVAILABLE_PRODUCTS_FAILED = "ListAvailableProductsFailed", h.LIST_AVAILABLE_PRODUCTS_EMPTY = "ListAvailableProductsEmpty", h.LIST_SUBSCRIPTIONS_FAILED = "ListSubscriptionsFailed", h.GET_USER_BENEFITS_FAILED = "GetUserBenefitsFailed", h.GUAC_APP_POLICY_FAILED = "GuacAppPolicyFailed", h.MEMBERSHIP_POLLING_TIMEOUT = "MembershipPollingTimeout", h.PURCHASE_VIEW_SHOWN = "PurchaseViewShown", h.PURCHASE_VIEW_OPEN_SHEET_CLICK = "PurchaseViewOpenSheetClick", h.BUNDLE_PICKER_SHEET_OPENED = "BundlePickerSheetOpened", h.BUNDLE_PICKER_TIER_SELECTED = "BundlePickerTierSelected", h.BUNDLE_PICKER_SUBSCRIBE_CLICK = "BundlePickerSubscribeClick", h.BUNDLE_PICKER_ROW_MISSING_ROBUX_ALLOWANCE = "BundlePickerRowMissingRobuxAllowance", h.BUNDLE_PICKER_ROW_MISSING_STRIKETHROUGH_PRICE = "BundlePickerRowMissingStrikethroughPrice", h.MISSING_FEATURE_CONFIG = "MissingFeatureConfig", h),
                sR = (0, window.Roblox["web-telemetry"].fire.createFireTelemetryCounter)("RobloxSubscription"),
                sk = function(e) {
                    var t = e.product,
                        r = e.isBundle,
                        n = (0, S.useTranslation)(),
                        i = n.translate,
                        o = n.intl,
                        a = t9(t);
                    (0, tr.useEffect)(function() {
                        r && 0 === a && sR(sC.BUNDLE_PICKER_ROW_MISSING_ROBUX_ALLOWANCE, {
                            productId: t.productKey.id
                        }), r && !t.localizedStrikethroughPriceDisplayString && sR(sC.BUNDLE_PICKER_ROW_MISSING_STRIKETHROUGH_PRICE, {
                            productId: t.productKey.id,
                            currencyCode: t.localizedPrice.currencyCode
                        })
                    }, [r, t.localizedPrice.currencyCode, t.localizedStrikethroughPriceDisplayString, t.productKey.id, a]);
                    var l = o.n(a),
                        u = a > 0 ? "".concat(i("Label.BlackbirdShort"), " ").concat(a) : i("Label.Blackbird"),
                        c = t.localizedPriceDisplayString,
                        s = t.localizedStrikethroughPriceDisplayString;
                    return (0, O.jsxs)("div", {
                        className: "width-full min-height-700 flex flex-col items-stretch justify-center",
                        children: [(0, O.jsxs)("div", {
                            className: "width-full flex flex-row items-center justify-between",
                            children: [(0, O.jsx)("span", {
                                className: "text-title-medium content-emphasis",
                                children: u
                            }), (0, O.jsxs)("div", {
                                className: "gap-small flex flex-row items-center justify-end",
                                children: [s && (0, O.jsx)("span", {
                                    className: "text-body-medium strike-through",
                                    style: {
                                        color: "#6a6f81"
                                    },
                                    children: s
                                }), (0, O.jsx)("span", {
                                    className: "text-body-medium content-emphasis text-strikethrough",
                                    children: c
                                })]
                            })]
                        }), a > 0 && (0, O.jsx)("div", {
                            className: "width-full gap-xsmall flex flex-row items-center justify-start",
                            children: (0, O.jsx)("span", {
                                className: "text-body-medium content-default flex flex-row items-center",
                                children: o5(i, "Plus.LandingPage.BottomSheet.Benefit", [{
                                    opening: "amountStart",
                                    closing: "amountEnd",
                                    render: function(e) {
                                        return (0, O.jsxs)("span", {
                                            className: "padding-left-xxsmall gap-x-xxsmall flex flex-row items-center",
                                            children: [(0, O.jsx)(ts, {
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
                sU = function(e) {
                    var t = e.product,
                        r = e.isSelected,
                        n = e.onSelect,
                        i = e.isBundle;
                    return (0, O.jsx)("div", {
                        "data-testid": "bundle-picker-tier-".concat(t.productKey.id),
                        children: (0, O.jsx)(sL, {
                            hideSelectedIndicator: !0,
                            isSelected: r,
                            label: void 0,
                            layout: "Horizontal",
                            metadata: (0, O.jsx)(sk, {
                                isBundle: i,
                                product: t
                            }),
                            size: "XSmall",
                            type: "Checkmark",
                            onSelect: n
                        })
                    })
                };

            function sz(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var s_ = function(e) {
                    var t, r, n, i, o, a, l = e.isOpen,
                        u = e.onOpenChange,
                        c = e.products,
                        s = e.deviceMeta,
                        d = e.isEntrypointDisabled,
                        f = e.onMobilePurchaseInitiated,
                        p = e.paymentSessionId,
                        m = e.referrerId,
                        y = (0, S.useTranslation)().translate,
                        b = null == (a = c[0]) ? void 0 : a.productKey.id,
                        g = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, tr.useState)(b)) || function(e) {
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
                                if ("string" == typeof e) return sz(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sz(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        h = g[0],
                        v = g[1];
                    (0, tr.useEffect)(function() {
                        h && c.some(function(e) {
                            return e.productKey.id === h
                        }) || v(b)
                    }, [b, c, h]);
                    var w = (0, tr.useMemo)(function() {
                            var e;
                            return null != (e = c.find(function(e) {
                                return e.productKey.id === h
                            })) ? e : c[0]
                        }, [c, h]),
                        x = !!w && void 0 !== t7(w),
                        j = (0, tr.useRef)(!1);
                    (0, tr.useEffect)(function() {
                        if (!l) {
                            j.current = !1;
                            return
                        }!j.current && p && (j.current = !0, cH().sendUserPurchaseFlowEvent(cH().ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, cH().ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, cH().ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, cH().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_BUNDLE_SHEET_OPENED, p ? {
                            paymentSessionId: p
                        } : {}), sR(sC.BUNDLE_PICKER_SHEET_OPENED, {
                            tierCount: String(c.length),
                            defaultProductId: null != b ? b : ""
                        }))
                    }, [l, p, c.length, b]);
                    var I = (0, tr.useCallback)(function(e) {
                            v(e), cH().sendUserPurchaseFlowEvent(cH().ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, cH().ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, cH().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, cH().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_BUNDLE_TIER_SELECTED, function(e) {
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
                            } : {})), sR(sC.BUNDLE_PICKER_TIER_SELECTED, {
                                productId: e
                            })
                        }, [p]),
                        M = (0, tr.useCallback)(function() {
                            var e = x ? cH().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : cH().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                            cH().sendUserPurchaseFlowEvent(cH().ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, cH().ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, cH().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, e, p ? {
                                paymentSessionId: p
                            } : {}), sR(sC.BUNDLE_PICKER_SUBSCRIBE_CLICK, {
                                productId: null != h ? h : "",
                                isFreeTrial: String(x)
                            })
                        }, [x, h, p]);
                    if (!w) return null;
                    var N = [{
                            opening: "linkStart",
                            closing: "linkEnd",
                            render: function(e) {
                                return (0, O.jsx)("a", {
                                    className: "content-link underline",
                                    href: e7,
                                    rel: "noopener noreferrer",
                                    target: "_blank",
                                    children: e
                                })
                            }
                        }],
                        P = (i = null == (n = t7(w)) || null == (r = n.freeTrialOffer) ? void 0 : r.estimatedTrialEndDate) ? new Date(i).toLocaleDateString(void 0, {
                            year: "numeric",
                            month: "long",
                            day: "numeric"
                        }) : "",
                        E = d ? y("Description.EntrypointDisabled") : o5(y, x ? "Description.SubscriptionFreeTrialLegal" : "Description.SubscriptionLegal", N, x ? {
                            date: P
                        } : void 0),
                        T = s.isAndroidApp || s.isIosApp,
                        D = x ? y("Action.TryItForFree") : y("Action.PricePerMonth", {
                            price: null != (o = w.localizedPriceDisplayString) ? o : "",
                            periodType: w.periodType
                        });
                    return (0, O.jsx)(u0, {
                        open: l,
                        onOpenChange: u,
                        children: (0, O.jsxs)(u1, {
                            centerSheetSize: "Medium",
                            closeLabel: y("Action.Close"),
                            largeScreenVariant: "center",
                            children: [(0, O.jsx)(u2, {
                                children: y("Label.PickAPlan")
                            }), (0, O.jsx)(u4, {
                                className: "gap-y-medium padding-y-medium flex flex-col",
                                "data-testid": "bundle-picker-sheet-body",
                                children: c.map(function(e, t) {
                                    return (0, O.jsx)(sU, {
                                        isBundle: 0 !== t,
                                        isSelected: w.productKey.id === e.productKey.id,
                                        product: e,
                                        onSelect: function() {
                                            I(e.productKey.id)
                                        }
                                    }, e.productKey.id)
                                })
                            }), (0, O.jsx)(u3, {
                                children: (0, O.jsxs)("div", {
                                    className: "gap-y-small flex flex-col",
                                    children: [(0, O.jsx)(cp, {
                                        className: "width-full",
                                        deviceMeta: s,
                                        isDisabled: d,
                                        paymentSessionId: p,
                                        productId: null != h ? h : "",
                                        productType: w.productKey.type,
                                        referrerId: m,
                                        size: "Medium",
                                        trackSubscriptionButtonClick: M,
                                        onSubscribeClick: T ? f : void 0,
                                        children: D
                                    }), (0, O.jsx)("p", {
                                        className: "text-caption-small content-muted text-align-x-left",
                                        "data-testid": "bundle-picker-legal-footer",
                                        children: E
                                    })]
                                })
                            })]
                        })
                    })
                },
                sB = window.Roblox["core-scripts"].deepLink,
                sY = {
                    itemId: 0x4b45c0ee905a,
                    itemType: sB.ItemType.Asset
                },
                sF = function(e) {
                    var t = e.itemId,
                        r = e.itemType;
                    return "roblox://navigation/item_details?itemId=".concat(t, "&itemType=").concat(r)
                },
                sG = function(e) {
                    return (0, sB.navigateToDeepLink)(sF(e))
                };

            function sW(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sQ(e) {
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

            function sV(e, t) {
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

            function sq(e, t) {
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
                        if ("string" == typeof e) return sW(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sW(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var sK = {
                    enabled: !1,
                    arrivedGiftDate: new Date(2026, 7, 14)
                },
                sH = function(e) {
                    var t, r, n, i, o = e.deviceMeta,
                        a = e.robloxSubscriptionProducts,
                        l = e.isEntrypointDisabled,
                        u = e.onMobilePurchaseInitiated,
                        c = (0, S.useTranslation)().translate,
                        s = (null != (t = function() {
                            var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                            return function() {
                                var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0],
                                    t = se((0, tr.useState)(e ? void 0 : cV().getLocalStorage(st)), 2),
                                    r = t[0],
                                    n = t[1],
                                    i = se((0, tr.useState)(!1), 2),
                                    o = i[0],
                                    a = i[1],
                                    l = (0, tr.useCallback)(function(e) {
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
                                                        return [4, c6(function() {
                                                            return c8(this, function(t) {
                                                                return [2, c3(cJ.GET, {
                                                                    withCredentials: !0,
                                                                    url: "".concat(u8.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions/").concat(e)
                                                                }, {
                                                                    feature: c0.PAYMENT,
                                                                    call: c1.GET_PAYMENT_SESSION
                                                                })]
                                                            })
                                                        })()];
                                                    case 1:
                                                        return r = i.sent(), [3, 4];
                                                    case 2:
                                                        return [4, c6(function() {
                                                            return c8(this, function(e) {
                                                                return [2, c3(cJ.POST, {
                                                                    withCredentials: !0,
                                                                    url: "".concat(u8.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions")
                                                                }, {
                                                                    feature: c0.PAYMENT,
                                                                    call: c1.CREATE_PAYMENT_SESSION
                                                                }, {
                                                                    paymentFlowId: cH().getPaymentFlowUuid()
                                                                })]
                                                            })
                                                        })()];
                                                    case 3:
                                                        r = i.sent(), i.label = 4;
                                                    case 4:
                                                        if (!(t = r)) return [2];
                                                        return cV().setLocalStorage(st, t.paymentSession), n(t.paymentSession), [2]
                                                }
                                            })
                                        }, function() {
                                            var e = this,
                                                r = arguments;
                                            return new Promise(function(n, i) {
                                                var o = t.apply(e, r);

                                                function a(e) {
                                                    c7(o, n, i, a, l, "next", e)
                                                }

                                                function l(e) {
                                                    c7(o, n, i, a, l, "throw", e)
                                                }
                                                a(void 0)
                                            })
                                        })()
                                    }, []);
                                return (0, tr.useEffect)(function() {
                                    if (r) {
                                        new Date(r.expiresAt) < new Date && (a(!0), l());
                                        return
                                    }
                                    var e, t = null == (e = cq.urlService.getQueryParam("paymentSessionId")) ? void 0 : e.toString();
                                    t || a(!0), l(t)
                                }, [l, r]), (0, tr.useMemo)(function() {
                                    return {
                                        paymentSession: r,
                                        wasCreatedByCurrentClient: o
                                    }
                                }, [r, o])
                            }(e).paymentSession
                        }()) ? t : {}).id,
                        d = (0, tr.useMemo)(function() {
                            return sn(window.location.search)
                        }, []),
                        f = "invite" === d.kind ? d.referrerId : void 0,
                        p = a[0],
                        m = a.length > 1,
                        y = sq((0, tr.useState)(!1), 2),
                        b = y[0],
                        g = y[1],
                        h = (0, tr.useMemo)(function() {
                            return sK.arrivedGiftDate.toLocaleDateString(void 0, {
                                day: "2-digit",
                                month: "short",
                                year: "numeric"
                            })
                        }, []);
                    if (!p) throw Error("PurchaseView requires at least one subscription product");
                    var v = p.productKey,
                        w = v.id,
                        x = v.type,
                        j = (0, tr.useMemo)(function() {
                            return p.eligibleOffers.find(function(e) {
                                return "FreeTrial" === e.offerType
                            })
                        }, [p.eligibleOffers]),
                        I = null != j,
                        M = (0, tr.useMemo)(function() {
                            var e, t = null == j || null == (e = j.freeTrialOffer) ? void 0 : e.estimatedTrialEndDate;
                            return t ? new Date(t).toLocaleDateString(void 0, {
                                year: "numeric",
                                month: "long",
                                day: "numeric"
                            }) : ""
                        }, [j]),
                        N = (0, tr.useMemo)(function() {
                            return [{
                                opening: "linkStart",
                                closing: "linkEnd",
                                render: function(e) {
                                    return (0, O.jsx)("a", {
                                        className: "content-link underline",
                                        href: e7,
                                        rel: "noopener noreferrer",
                                        target: "_blank",
                                        children: e
                                    })
                                }
                            }]
                        }, []),
                        P = l ? c("Description.EntrypointDisabled") : o5(c, I ? "Description.SubscriptionFreeTrialLegal" : "Description.SubscriptionLegal", N, I ? {
                            date: M
                        } : void 0),
                        E = (0, tr.useRef)(!1);
                    (0, tr.useEffect)(function() {
                        if (!E.current && s) {
                            E.current = !0;
                            var e = I ? cW.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : cW.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                            cW.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(cW.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, cW.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, cW.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, e, s ? {
                                paymentSessionId: s
                            } : {}), sR(sC.PURCHASE_VIEW_SHOWN, {
                                variant: m ? "multi" : "single",
                                tierCount: String(a.length),
                                isFreeTrial: String(I)
                            })
                        }
                    }, [s, I, m, a.length]);
                    var T = o.isAndroidApp || o.isIosApp,
                        D = sq((0, tr.useState)(null), 2),
                        A = D[0],
                        L = D[1],
                        C = (0, tr.useCallback)(function() {
                            var e = I ? cW.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : cW.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                            cW.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(cW.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, cW.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, cW.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, e, s ? {
                                paymentSessionId: s
                            } : {})
                        }, [I, s]),
                        R = c(I ? "Action.TryItForFree" : "Action.Subscribe"),
                        k = {
                            productId: w,
                            productType: x,
                            deviceMeta: o,
                            isDisabled: l,
                            paymentSessionId: s,
                            referrerId: f,
                            trackSubscriptionButtonClick: C,
                            onSubscribeClick: T ? u : void 0
                        },
                        U = sV(sQ({}, k), {
                            trackSubscriptionButtonClick: void 0
                        }),
                        z = function() {
                            l || (sR(sC.PURCHASE_VIEW_OPEN_SHEET_CLICK), g(!0))
                        },
                        _ = function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "Large";
                            return (0, O.jsx)(tF, {
                                className: e,
                                "data-testid": "purchase-open-sheet-button",
                                isDisabled: l,
                                size: t,
                                variant: "Emphasis",
                                onClick: z,
                                children: R
                            })
                        },
                        B = o5(c, "Label.PlusLandingPage.Subtitle.V3", [{
                            opening: "boldStart",
                            closing: "boldEnd",
                            render: function(e) {
                                return (0, O.jsx)("span", {
                                    className: "text-heading-small",
                                    children: e
                                })
                            }
                        }], {
                            price: null != (r = p.localizedPriceDisplayString) ? r : "",
                            periodType: p.periodType
                        }),
                        Y = (0, O.jsxs)("div", {
                            "aria-label": c("Action.Subscribe"),
                            className: "bottom-dock padding-t-medium bg-surface-100 large:hidden width-full gap-y-medium flex flex-col",
                            "data-testid": "purchase-subscribe-dock",
                            role: "region",
                            children: [(0, O.jsx)(t6, {}), (0, O.jsxs)("div", {
                                className: "width-full gap-y-medium padding-b-[env(safe-area-inset-bottom\\,0px)] padding-x-xxlarge flex flex-col items-stretch",
                                children: [m ? _("min-width-0 width-full") : (0, O.jsx)(cp, sV(sQ({}, k), {
                                    className: "min-width-0 width-full",
                                    size: "Medium",
                                    children: R
                                })), (0, O.jsx)("p", {
                                    className: "text-caption-small content-muted margin-bottom-[24px] large:margin-bottom-none padding-x-xsmall text-align-x-start",
                                    children: P
                                })]
                            })]
                        });
                    return (0, O.jsxs)(tr.Fragment, {
                        children: [(0, O.jsx)(t5, {}), (0, O.jsx)("div", {
                            className: "width-full min-width-0 large:items-center flex flex-col items-start",
                            children: (0, O.jsxs)("div", {
                                className: "margin-top-[48px] width-full min-width-0 content-emphasis large:max-width-[730px] large:gap-y-[32px] large:self-auto large:padding-x-xlarge flex flex-col gap-y-[32px] self-stretch",
                                children: [sK.enabled && (0, O.jsx)("div", {
                                    className: "width-full min-width-0 padding-x-xxlarge large:padding-x-none",
                                    children: (0, O.jsx)(so, {
                                        body: c("Description.BannerBodyArrivedPurchase", {
                                            date: h
                                        }),
                                        title: c("Description.BannerTitleArrivedPurchase"),
                                        onItemDetailsClick: function() {
                                            sG(sY).catch(function() {})
                                        }
                                    })
                                }), (0, O.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge text-align-x-start large:gap-y-[24px] large:items-center large:padding-x-none large:text-align-x-center flex flex-col items-start",
                                    children: [(0, O.jsxs)("div", {
                                        className: "gap-y-xsmall large:items-center flex flex-col items-start",
                                        children: [(0, O.jsx)(sa, {
                                            variant: "compact"
                                        }), (0, O.jsxs)("h1", {
                                            className: "font-builder-extended text-display-small large:![font-size:var(--font-size-1000)] content-emphasis ![font-size:var(--font-size-800)]",
                                            children: [(0, O.jsx)("span", {
                                                className: "large:inline block",
                                                children: c("Title.PurchasePromoHeadlinePart1")
                                            }), (0, O.jsx)("span", {
                                                className: "large:inline hidden",
                                                children: "\xa0"
                                            }), (0, O.jsx)("span", {
                                                className: "large:inline block",
                                                children: c("Title.PurchasePromoHeadlinePart2")
                                            })]
                                        })]
                                    }), (0, O.jsxs)("div", {
                                        className: "gap-y-xsmall width-full min-width-0 large:text-align-x-center flex flex-col",
                                        children: [m ? (0, O.jsx)("span", {
                                            className: "text-body-large content-emphasis",
                                            children: B
                                        }) : (0, O.jsx)(su, {
                                            eligibleOffers: p.eligibleOffers,
                                            periodType: p.periodType,
                                            price: p.localizedPrice
                                        }), (0, O.jsx)("div", {
                                            className: "width-full gap-y-medium padding-t-none large:margin-x-auto large:margin-top-[24px] large:flex large:max-width-[min(440px,100%)] large:width-full large:flex-col large:items-center hidden items-start",
                                            children: (0, O.jsx)("div", {
                                                className: "width-full gap-x-small flex shrink-0 flex-row items-start justify-center",
                                                children: m ? _("width-full large:width-[230px] shrink-0", "Medium") : (0, O.jsx)(cp, sV(sQ({}, k), {
                                                    className: "width-full large:width-[230px] shrink-0",
                                                    size: "Medium",
                                                    children: R
                                                }))
                                            })
                                        })]
                                    })]
                                }), (0, O.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge large:padding-x-none flex flex-col",
                                    children: [(0, O.jsx)("span", {
                                        className: "text-heading-small",
                                        children: c("Title.Benefits", {
                                            productShort: c("Label.BlackbirdShort")
                                        })
                                    }), (0, O.jsx)("div", {
                                        className: "width-full padding-b-xlarge large:padding-b-none",
                                        children: (0, O.jsx)(t2, {
                                            featureConfig: t8(p),
                                            periodType: p.periodType,
                                            onTileClick: function(e, t) {
                                                L({
                                                    primary: e,
                                                    secondary: t
                                                })
                                            }
                                        })
                                    }), (0, O.jsx)("p", {
                                        className: "text-caption-small content-muted padding-x-xsmall text-align-x-start large:block large:padding-x-none hidden",
                                        "data-testid": "purchase-legal-footer",
                                        children: P
                                    })]
                                })]
                            })
                        }), Y, (0, O.jsx)(sS, {
                            body: null != (n = null == A ? void 0 : A.secondary) ? n : "",
                            open: null != A,
                            title: null != (i = null == A ? void 0 : A.primary) ? i : "",
                            onOpenChange: function(e) {
                                e || L(null)
                            }
                        }), m && (0, O.jsx)(s_, {
                            deviceMeta: o,
                            isEntrypointDisabled: l,
                            isOpen: b,
                            paymentSessionId: s,
                            products: a,
                            referrerId: f,
                            onMobilePurchaseInitiated: u,
                            onOpenChange: g
                        }), (0, O.jsx)(si, {
                            subscribeButtonProps: U,
                            subscribeEligibleOffers: p.eligibleOffers,
                            subscribeFeatureConfig: t8(p),
                            subscribePeriodType: p.periodType,
                            subscribePrice: p.localizedPrice
                        })]
                    })
                };

            function sX(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }
            var sZ = new Map([
                    ["Invalid", "Invalid"],
                    ["Eligible", "Eligible"],
                    ["Ineligible", "Ineligible"],
                    [0, "Invalid"],
                    [1, "Eligible"],
                    [2, "Ineligible"]
                ]),
                s$ = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        t = e.enabled,
                        r = (void 0 === t || t) && e9(),
                        n = (0, P.useQuery)({
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
                                                return [4, u7.subscriptionsV2CheckSubscriptionReferralEligibility({})];
                                            case 1:
                                                return e = t.sent().eligibility, [2, sZ.get(e)]
                                        }
                                    })
                                }, function() {
                                    var t = this,
                                        r = arguments;
                                    return new Promise(function(n, i) {
                                        var o = e.apply(t, r);

                                        function a(e) {
                                            sX(o, n, i, a, l, "next", e)
                                        }

                                        function l(e) {
                                            sX(o, n, i, a, l, "throw", e)
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
                sJ = function(e) {
                    var t = e.title,
                        r = e.body;
                    return (0, O.jsxs)("div", {
                        className: "bg-shift-200 radius-medium padding-medium gap-medium width-full flex items-center",
                        children: [(0, O.jsx)("div", {
                            className: "radius-medium size-[50px] shrink-0 flex items-center justify-center",
                            children: (0, O.jsx)(ts, {
                                className: "!size-900",
                                name: "icon-regular-roblox-plus"
                            })
                        }), (0, O.jsxs)("div", {
                            className: "min-width-0 grow-1 shrink-1 flex basis-0 flex-col justify-center",
                            children: [(0, O.jsx)("span", {
                                className: "text-title-medium content-emphasis",
                                children: t
                            }), (0, O.jsx)("span", {
                                className: "text-body-medium content-default",
                                children: r
                            })]
                        })]
                    })
                };

            function s0(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var s1 = function(e, t) {
                return (s1 = Object.setPrototypeOf || s0({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function s4(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function r() {
                    this.constructor = e
                }
                s1(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
            }

            function s2(e, t, r, n) {
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
                        e.done ? i(e.value) : (s0(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, l)
                    }
                    u((n = n.apply(e, t || [])).next())
                })
            }

            function s3(e, t) {
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

            function s5(e) {
                var t;
                return null == (t = e) ? t : {
                    periodIndex: t.periodIndex,
                    discountPercent: t.discountPercent
                }
            }
            var s6 = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return s4(t, e), t.prototype.robloxPlusGetRobloxPlusUserBenefitsRaw = function(e, t) {
                        return s2(this, void 0, void 0, function() {
                            var r, n;
                            return s3(this, function(i) {
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
                                        return [2, new e_(i.sent(), function(e) {
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
                        return s2(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), s3(this, function(r) {
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
                }(eC),
                s8 = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return s4(t, e), t.prototype.robloxSubscriptionMetadataGetRobloxSubscriptionMetadataRaw = function(e, t) {
                        return s2(this, void 0, void 0, function() {
                            var r, n;
                            return s3(this, function(i) {
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
                                        return [2, new e_(i.sent(), function(e) {
                                            var t, r;
                                            return null == e ? e : {
                                                unifiedPurchaseFlowMetadata: null == (t = e.unifiedPurchaseFlowMetadata) ? t : {
                                                    isUserEligibleForUnifiedPurchaseFlow: t.isUserEligibleForUnifiedPurchaseFlow,
                                                    expiresInSeconds: t.expiresInSeconds
                                                },
                                                robloxSubscriptionExperimentMetadata: null == (r = e.robloxSubscriptionExperimentMetadata) ? r : {
                                                    subscriptionsVariant: ez(r, "subscriptionsVariant") ? r.subscriptionsVariant : void 0
                                                }
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.robloxSubscriptionMetadataGetRobloxSubscriptionMetadata = function() {
                        return s2(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), s3(this, function(r) {
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
                }(eC),
                s9 = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return s4(t, e), t.prototype.robloxSubscriptionProductsGetRobloxSubscriptionProductRaw = function(e, t) {
                        return s2(this, void 0, void 0, function() {
                            var r, n;
                            return s3(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.robloxSubscriptionProductId || void 0 === e.robloxSubscriptionProductId) throw new eU("robloxSubscriptionProductId", "Required parameter requestParameters.robloxSubscriptionProductId was null or undefined when calling robloxSubscriptionProductsGetRobloxSubscriptionProduct.");
                                        return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                            path: "/v1/products/{robloxSubscriptionProductId}".replace("{".concat("robloxSubscriptionProductId", "}"), encodeURIComponent(String(e.robloxSubscriptionProductId))),
                                            schemaPath: "/v1/products/{robloxSubscriptionProductId}",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new e_(i.sent(), function(e) {
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
                                                        virtualTransactionDiscounts: null === n.virtualTransactionDiscounts ? null : n.virtualTransactionDiscounts.map(s5),
                                                        isRobuxTransferEnabled: n.isRobuxTransferEnabled,
                                                        isTradingEnabled: n.isTradingEnabled,
                                                        isUgcPublishingEnabled: n.isUgcPublishingEnabled,
                                                        privateServerDiscounts: null === n.privateServerDiscounts ? null : n.privateServerDiscounts.map(s5),
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
                        return s2(this, void 0, void 0, function() {
                            return s3(this, function(r) {
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
                }(eC),
                s7 = function(e, t) {
                    return new Date(Date.UTC(e, t + 1, 0)).getUTCDate()
                },
                de = function(e, t) {
                    var r = e.getUTCFullYear(),
                        n = e.getUTCMonth(),
                        i = e.getUTCDate(),
                        o = n + t,
                        a = r + Math.floor(o / 12),
                        l = (o % 12 + 12) % 12,
                        u = Math.min(i, s7(a, l));
                    return new Date(Date.UTC(a, l, u, e.getUTCHours(), e.getUTCMinutes(), e.getUTCSeconds(), e.getUTCMilliseconds()))
                },
                dt = function(e, t) {
                    var r = e.getUTCFullYear() + t,
                        n = e.getUTCMonth(),
                        i = Math.min(e.getUTCDate(), s7(r, n));
                    return new Date(Date.UTC(r, n, i, e.getUTCHours(), e.getUTCMinutes(), e.getUTCSeconds(), e.getUTCMilliseconds()))
                },
                dr = function(e, t, r) {
                    var n = new Date(e);
                    switch (r) {
                        case "Week":
                            return n.setUTCDate(n.getUTCDate() + 7 * t), n;
                        case "Month":
                            return de(n, t);
                        case "Year":
                            return dt(n, t);
                        default:
                            throw Error("Unsupported period type: ".concat(r))
                    }
                },
                dn = function(e, t, r, n) {
                    for (var i = 0; i < 1e3 && !(n < dr(e, i + 1, t).getTime());) i += 1;
                    return r && r < n && i > 0 && (i -= 1), i
                },
                di = function(e) {
                    var t = e.currentDiscountPercent,
                        r = e.nextDiscount,
                        n = e.activationTimestampMs,
                        i = e.isCancelled,
                        o = e.periodType,
                        a = (0, S.useTranslation)(),
                        l = a.translate,
                        u = a.intl,
                        c = (0, tr.useMemo)(function() {
                            if (!r) return null;
                            var e = Date.now(),
                                t = dr(n, r.periodIndex, o).getTime();
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
                            return (0, O.jsxs)("div", {
                                className: "margin-right-[-16px] relative flex size-[60px] shrink-0 items-center justify-center",
                                children: [(0, O.jsx)("div", {
                                    "aria-hidden": !0,
                                    className: "stroke-emphasis stroke-standard absolute inset-[0] rounded-[2.4px] [transform:rotate(-15deg)]"
                                }), e]
                            })
                        };
                    return (0, O.jsxs)("div", {
                        className: "radius-medium padding-large bg-shift-200 width-full gap-x-small flex items-center justify-between [overflow:clip]",
                        children: [(0, O.jsxs)("div", {
                            className: "gap-y-small min-width-0 flex flex-col items-start justify-center",
                            children: [(0, O.jsx)("span", {
                                className: "text-title-medium content-default",
                                children: i ? l(s ? "Description.Benefit.DiscountStaySubscribedToKeep" : "Description.Benefit.DiscountStaySubscribedToGet") : s ? l("Description.Benefit.DiscountMaxReached") : l("Description.Benefit.DiscountCurrent", {
                                    discountPercent: u.n(.01 * t, {
                                        style: "percent"
                                    })
                                })
                            }), (0, O.jsx)("span", {
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
                        }), (0, O.jsx)("div", {
                            className: "shrink-0",
                            children: s ? f((0, O.jsx)(ts, {
                                name: "icon-regular-circle-check",
                                size: "XLarge"
                            })) : d && !i ? (0, O.jsx)(ra, {
                                ariaLabel: l("Label.Progress"),
                                className: "[--fui-future-alpha-color-system-progress:var(--color-content-emphasis)]",
                                size: "Large",
                                value: c.targetDateProgressPercent,
                                variant: "Determinate"
                            }) : f((0, O.jsx)(ts, {
                                name: "icon-regular-calendar",
                                size: "XLarge"
                            }))
                        })]
                    })
                };

            function da(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function dl(e) {
                if (Array.isArray(e)) return e
            }

            function du() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function dc(e, t) {
                return dl(e) || function(e, t) {
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
                }(e, t) || ds(e, t) || du()
            }

            function ds(e, t) {
                if (e) {
                    if ("string" == typeof e) return da(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return da(e, t)
                }
            }
            var dd = function(e) {
                    var t = e.scrollLeft,
                        r = e.scrollWidth,
                        n = e.clientWidth,
                        i = Math.abs(t),
                        o = r - n;
                    return o <= 1 ? "Middle" : i <= 1 ? "Start" : i >= o - 1 ? "End" : "Middle"
                },
                df = (0, tr.forwardRef)(function(e, t) {
                    var r, n, i, o = dl(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || ds(r) || du(),
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
                        g = dc(l, 1)[0],
                        h = (0, tr.useRef)(null),
                        v = dc((0, tr.useState)("Start"), 2),
                        w = v[0],
                        x = v[1],
                        j = dc((0, tr.useState)(!1), 2),
                        O = j[0],
                        S = j[1],
                        I = (0, tr.useCallback)(function() {
                            var e = h.current;
                            e && (x(dd(e)), S(!!e && e.scrollWidth - e.clientWidth > 1))
                        }, []);
                    (0, tr.useEffect)(function() {
                        I();
                        var e = h.current;
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
                    var M = (0, tr.useCallback)(function() {
                            var e = h.current;
                            return e ? d ? e.clientWidth : Math.max(1, Math.round(.75 * e.clientWidth)) : 0
                        }, [d]),
                        N = (0, tr.useCallback)(function() {
                            var e = h.current;
                            e && e.scrollBy({
                                left: -M(),
                                behavior: "smooth"
                            })
                        }, [M]),
                        P = (0, tr.useCallback)(function() {
                            var e = h.current;
                            e && e.scrollBy({
                                left: M(),
                                behavior: "smooth"
                            })
                        }, [M]);
                    (0, tr.useImperativeHandle)(g, function() {
                        return {
                            scrollPrevious: N,
                            scrollNext: P,
                            scrollContainer: h.current
                        }
                    }, [N, P]);
                    var E = O && "Start" !== w,
                        T = O && "End" !== w;
                    return tn().createElement("div", (n = function(e) {
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
                        className: ti("foundation-web-collection-carousel relative", f),
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
                    }), n), tn().createElement("div", {
                        ref: h,
                        "data-testid": "collection-carousel-scroll",
                        className: "foundation-web-collection-carousel-scroll flex flex-row gap-medium"
                    }, tn().Children.map(u, function(e, t) {
                        return tn().createElement("div", {
                            className: "foundation-web-collection-carousel-item shrink-0",
                            key: t
                        }, e)
                    })), tn().createElement("div", {
                        "data-testid": "collection-carousel-nav-previous",
                        className: "foundation-web-collection-carousel-nav foundation-web-collection-carousel-nav-previous absolute",
                        "data-visible": E,
                        "aria-hidden": !E
                    }, tn().createElement(ad, {
                        icon: "icon-regular-chevron-small-left",
                        ariaLabel: void 0 === p ? "Previous" : p,
                        variant: "OverMedia",
                        size: "Medium",
                        isCircular: !0,
                        tabIndex: E ? 0 : -1,
                        onClick: N,
                        isDisabled: !E
                    })), tn().createElement("div", {
                        "data-testid": "collection-carousel-nav-next",
                        className: "foundation-web-collection-carousel-nav foundation-web-collection-carousel-nav-next absolute",
                        "data-visible": T,
                        "aria-hidden": !T
                    }, tn().createElement(ad, {
                        icon: "icon-regular-chevron-small-right",
                        ariaLabel: void 0 === m ? "Next" : m,
                        variant: "OverMedia",
                        size: "Medium",
                        isCircular: !0,
                        tabIndex: T ? 0 : -1,
                        onClick: P,
                        isDisabled: !T
                    })))
                });
            df.displayName = "CollectionCarousel";
            var dp = function(e) {
                var t = e.children,
                    r = (0, (0, S.useTranslation)().translate)("Heading.InteractWithPlus", void 0, "Get more out of Plus");
                return (0, O.jsxs)("div", {
                    className: "gap-y-large flex flex-col",
                    children: [(0, O.jsx)("span", {
                        className: "text-heading-small content-emphasis",
                        children: r
                    }), (0, O.jsx)(df, {
                        "aria-label": r,
                        hasMargin: !1,
                        children: t
                    })]
                })
            };

            function dm(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var dy = function(e) {
                    var t, r = e.robloxSubscriptionProduct,
                        n = (0, S.useTranslation)().translate,
                        i = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, tr.useState)(!1)) || function(e) {
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
                                if ("string" == typeof e) return dm(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return dm(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        o = i[0],
                        a = i[1],
                        l = (0, tr.useCallback)(function() {
                            a(!0)
                        }, []),
                        u = (0, tr.useMemo)(function() {
                            var e = new URL("/my/account#!/subscriptions", window.location.origin);
                            return e.searchParams.append("id", r.productKey.id), e.searchParams.append("type", r.productKey.type), e.toString()
                        }, [r.productKey.id, r.productKey.type]);
                    return (0, O.jsx)(tF, {
                        as: "a",
                        href: u,
                        isLoading: o,
                        variant: "Standard",
                        onClick: l,
                        children: n("Action.Manage")
                    })
                },
                db = function(e) {
                    var t = e.onOpenDashboard,
                        r = (0, S.useTranslation)(),
                        n = r.translate,
                        i = r.intl.n(100);
                    return (0, O.jsxs)("div", {
                        className: "radius-medium bg-shift-100 padding-large gap-y-small height-full min-height-[160px] ".concat("width-[235px]", " flex flex-col items-start"),
                        children: [(0, O.jsx)("span", {
                            className: "text-title-large content-emphasis",
                            children: n("Heading.ReferralCard", {
                                amount: i
                            }, "Share Plus, get 100 Robux")
                        }), (0, O.jsx)("p", {
                            className: "text-body-medium content-default margin-none grow-1",
                            children: n("Description.ReferralShare", {
                                amount: i
                            }, "Invite someone to Plus and you both get 100 Robux when they join.")
                        }), (0, O.jsx)(tF, {
                            size: "Small",
                            variant: "Standard",
                            onClick: t,
                            children: n("Action.ReferralInvite", void 0, "Invite")
                        })]
                    })
                },
                dg = function(e) {
                    var t = e.title,
                        r = e.value;
                    return (0, O.jsxs)("div", {
                        className: "radius-medium bg-shift-200 padding-large gap-y-small min-width-0 grow-1 flex basis-0 flex-col",
                        children: [(0, O.jsx)("span", {
                            className: "text-title-medium content-default",
                            children: t
                        }), (0, O.jsx)("span", {
                            className: "text-heading-large content-emphasis",
                            children: r
                        })]
                    })
                },
                dh = function(e) {
                    var t = e.currentDiscountPercent,
                        r = e.savedRobux,
                        n = e.itemsBoughtWithDiscountCount,
                        i = e.privateServersCreatedCount,
                        o = e.robuxSentToFriendsCount,
                        a = (0, S.useTranslation)(),
                        l = a.translate,
                        u = a.intl;
                    return (0, O.jsxs)("div", {
                        className: "gap-y-large flex flex-col",
                        children: [(0, O.jsxs)("div", {
                            className: "gap-x-xsmall text-heading-small content-emphasis wrap flex items-center",
                            children: [(0, O.jsx)("span", {
                                children: l("Heading.SavingsYouveSaved")
                            }), (0, O.jsx)(ts, {
                                name: "icon-regular-robux",
                                size: "Medium"
                            }), (0, O.jsx)("span", {
                                children: void 0 === r ? "—" : u.n(r)
                            }), (0, O.jsx)("span", {
                                children: l("Heading.SavingsWithPlus")
                            })]
                        }), (0, O.jsxs)("div", {
                            className: "gap-y-small flex flex-col",
                            children: [(0, O.jsxs)("div", {
                                className: "gap-x-small flex",
                                children: [(0, O.jsx)(dg, {
                                    title: l("Label.Savings.InGameItems"),
                                    value: l("Label.Savings.PercentOff", {
                                        discountPercent: u.n(.01 * t, {
                                            style: "percent"
                                        })
                                    })
                                }), (0, O.jsx)(dg, {
                                    title: l("Label.Savings.ItemsBought"),
                                    value: void 0 === n ? "—" : u.n(n)
                                })]
                            }), (0, O.jsxs)("div", {
                                className: "gap-x-small flex",
                                children: [(0, O.jsx)(dg, {
                                    title: l("Label.Savings.PrivateServers"),
                                    value: void 0 === i ? "—" : u.n(i)
                                }), (0, O.jsx)(dg, {
                                    title: l("Label.Savings.RobuxSent"),
                                    value: (0, O.jsxs)("span", {
                                        className: "gap-x-xsmall flex items-center",
                                        children: [(0, O.jsx)(ts, {
                                            name: "icon-regular-robux",
                                            size: "Medium"
                                        }), void 0 === o ? "—" : u.n(o)]
                                    })
                                })]
                            }), (0, O.jsx)("span", {
                                className: "text-caption-medium content-muted",
                                children: l("Description.SavingsDataDelay")
                            })]
                        })]
                    })
                };

            function dv(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function dw(e) {
                if (Array.isArray(e)) return e
            }

            function dx() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function dj(e, t) {
                if (e) {
                    if ("string" == typeof e) return dv(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return dv(e, t)
                }
            }
            var dO = {
                    Neutral: "bg-shift-200",
                    Standard: "bg-shift-200",
                    Contrast: "bg-system-contrast",
                    Emphasis: "bg-system-emphasis",
                    Success: "bg-[rgb(from_var(--color-system-success)_r_g_b_/_0.2)]",
                    Warning: "bg-[rgb(from_var(--color-system-warning)_r_g_b_/_0.2)]",
                    Alert: "bg-[rgb(from_var(--color-system-alert)_r_g_b_/_0.2)]",
                    OverMedia: "bg-over-media-0"
                },
                dS = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-emphasis",
                    Warning: "content-emphasis",
                    Alert: "content-emphasis",
                    OverMedia: "content-emphasis"
                },
                dI = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-system-success",
                    Warning: "content-system-warning",
                    Alert: "content-system-alert",
                    OverMedia: "content-emphasis"
                },
                dM = {
                    Neutral: "stroke-none",
                    Standard: "stroke-none",
                    Contrast: "stroke-none",
                    Emphasis: "stroke-none",
                    Success: "stroke-none",
                    Warning: "stroke-none",
                    Alert: "stroke-none",
                    OverMedia: "stroke-none"
                },
                dN = {
                    Small: "height-600",
                    XSmall: "height-400"
                },
                dP = {
                    Small: "padding-x-small",
                    XSmall: "padding-x-xsmall"
                },
                dE = {
                    Small: "width-600",
                    XSmall: "width-400"
                },
                dT = {
                    Small: "text-label-small",
                    XSmall: "text-caption-small"
                },
                dD = {
                    Small: "padding-y-xsmall",
                    XSmall: "padding-y-none"
                },
                dA = {
                    Small: "XSmall",
                    XSmall: "XSmall"
                },
                dL = {
                    Pill: "radius-circle",
                    Box: "radius-small"
                },
                dC = tn().forwardRef(function(e, t) {
                    var r, n, i, o = dw(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || dj(r) || dx(),
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
                        g = a.shape,
                        h = function(e, t) {
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
                        v = (dw(l) || function(e) {
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
                        }(l) || dj(l, 1) || dx())[0],
                        w = f && !c,
                        x = "padding-x-xxsmall";
                    f && (x = "Leading" === m ? "padding-right-xxsmall" : "padding-left-xxsmall");
                    var j = f && tn().createElement(ts, {
                        name: f,
                        size: dA[b],
                        className: dI[d]
                    });
                    return tn().createElement("div", (n = function(e) {
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
                    }, h), i = i = {
                        className: ti("foundation-web-badge flex items-center select-none gap-[var(--size-150)]", dL[void 0 === g ? "Pill" : g], dN[b], w ? [dE[b], "justify-center"] : ["width-[fit-content]", dP[b]], dO[d], dS[d], dM[d], u)
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(i)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(i)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(i, e))
                    }), n), "Leading" === m && j, c && tn().createElement("span", {
                        className: ti("text-no-wrap text-truncate-split", dT[b], dD[b], x, dS[d])
                    }, c), "Trailing" === m && j)
                });
            dC.displayName = "Badge";
            var dR = function(e) {
                    var t = e.activationTimestampMs,
                        r = e.expirationTimestampMs,
                        n = e.nextRenewalTimestampMs,
                        i = e.hasFreeTrial,
                        o = (0, S.useTranslation)(),
                        a = o.translate,
                        l = o.intl,
                        u = (0, tr.useMemo)(function() {
                            return l.getDateTimeFormatter()
                        }, [l]),
                        c = null === n || 0 === n;
                    return (0, O.jsxs)("div", {
                        className: "gap-x-small flex items-center",
                        children: [(0, O.jsx)("span", {
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
                        }), c ? (0, O.jsx)(dC, {
                            label: a("Label.Status.AutoRenewOff"),
                            variant: "Warning"
                        }) : i ? (0, O.jsx)(dC, {
                            label: a("Label.Status.Freetrial"),
                            variant: "Standard"
                        }) : (0, O.jsx)(dC, {
                            label: a("Label.Status.Active"),
                            variant: "Standard"
                        })]
                    })
                },
                dk = function(e) {
                    var t = e.featureConfig,
                        r = (0, S.useTranslation)().translate;
                    return (0, O.jsxs)("div", {
                        className: "gap-y-medium flex flex-col",
                        children: [(0, O.jsx)("span", {
                            className: "text-heading-medium",
                            children: r("Label.ExploreMoreBenefits")
                        }), (0, O.jsxs)("div", {
                            className: "foundation-web-list-item-container",
                            children: [t.isTradingEnabled && (0, O.jsx)(tJ, {
                                description: r("Description.Benefit.TradeResellItemsSubtitle"),
                                divider: "None",
                                isContained: !0,
                                leading: (0, O.jsx)(ts, {
                                    name: "icon-regular-hand-two-arrows-horizontal",
                                    size: "Medium"
                                }),
                                size: "Medium",
                                title: r("Description.Benefit.TradeResellItems"),
                                trailing: (0, O.jsx)(ts, {
                                    name: "icon-regular-chevron-small-right"
                                }),
                                onSelect: function() {
                                    window.location.href = "https://help.roblox.com/hc/articles/203313310-Trading-System"
                                }
                            }), t.isUgcPublishingEnabled && (0, O.jsx)(tJ, {
                                description: r("Description.Benefit.PublishItemsSubtitle"),
                                divider: "None",
                                isContained: !0,
                                leading: (0, O.jsx)(ts, {
                                    name: "icon-regular-arrow-up-from-landscape-rectangle",
                                    size: "Medium"
                                }),
                                size: "Medium",
                                title: r("Description.Benefit.PublishItems"),
                                trailing: (0, O.jsx)(ts, {
                                    name: "icon-regular-chevron-small-right"
                                }),
                                onSelect: function() {
                                    window.location.href = "https://help.roblox.com/hc/articles/203313180-Creating-and-Selling-Avatar-Items"
                                }
                            })]
                        })]
                    })
                };

            function dU(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var dz = function(e, t) {
                return (dz = Object.setPrototypeOf || dU({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function d_(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function r() {
                    this.constructor = e
                }
                dz(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
            }

            function dB(e, t, r, n) {
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
                        e.done ? i(e.value) : (dU(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, l)
                    }
                    u((n = n.apply(e, t || [])).next())
                })
            }

            function dY(e, t) {
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

            function dF(e) {
                var t;
                return null == (t = e) ? t : {
                    name: ez(t, "name") ? t.name : void 0,
                    displayName: ez(t, "displayName") ? t.displayName : void 0,
                    filter: ez(t, "filter") ? t.filter : void 0,
                    id: ez(t, "id") ? t.id : void 0,
                    type: ez(t, "type") ? t.type : void 0,
                    categoryType: ez(t, "categoryType") ? t.categoryType : void 0
                }
            }

            function dG(e) {
                var t;
                return null == (t = e) ? t : {
                    name: ez(t, "name") ? t.name : void 0,
                    displayName: ez(t, "displayName") ? t.displayName : void 0,
                    categoryType: ez(t, "categoryType") ? t.categoryType : void 0,
                    items: ez(t, "items") ? t.items.map(dF) : void 0
                }
            }
            "function" == typeof SuppressedError && SuppressedError;

            function dW(e, t) {
                return null == e ? e : {
                    categories: ez(e, "categories") ? e.categories.map(dG) : void 0
                }
            }

            function dQ(e) {
                var t;
                return null == (t = e) ? t : {
                    userAssetId: ez(t, "userAssetId") ? t.userAssetId : void 0,
                    serialNumber: ez(t, "serialNumber") ? t.serialNumber : void 0,
                    assetId: ez(t, "assetId") ? t.assetId : void 0,
                    name: ez(t, "name") ? t.name : void 0,
                    recentAveragePrice: ez(t, "recentAveragePrice") ? t.recentAveragePrice : void 0,
                    originalPrice: ez(t, "originalPrice") ? t.originalPrice : void 0,
                    assetStock: ez(t, "assetStock") ? t.assetStock : void 0,
                    buildersClubMembershipType: ez(t, "buildersClubMembershipType") ? t.buildersClubMembershipType : void 0,
                    isOnHold: ez(t, "isOnHold") ? t.isOnHold : void 0
                }
            }

            function dV(e) {
                var t;
                return null == (t = e) ? t : {
                    id: ez(t, "id") ? t.id : void 0,
                    name: ez(t, "name") ? t.name : void 0,
                    type: ez(t, "type") ? t.type : void 0,
                    instanceId: ez(t, "instanceId") ? t.instanceId : void 0
                }
            }

            function dq(e) {
                var t, r;
                return null == (t = e) ? t : {
                    universeId: ez(t, "universeId") ? t.universeId : void 0,
                    placeId: ez(t, "placeId") ? t.placeId : void 0,
                    name: ez(t, "name") ? t.name : void 0,
                    creator: ez(t, "creator") ? null == (r = t.creator) ? r : {
                        id: ez(r, "id") ? r.id : void 0,
                        name: ez(r, "name") ? r.name : void 0,
                        type: ez(r, "type") ? r.type : void 0
                    } : void 0,
                    priceInRobux: ez(t, "priceInRobux") ? t.priceInRobux : void 0
                }
            }(function(e) {
                function t() {
                    return null !== e && e.apply(this, arguments) || this
                }
                d_(t, e), t.prototype.v1PackagesPackageIdAssetsGetRaw = function(e, t) {
                    return dB(this, void 0, void 0, function() {
                        var r, n;
                        return dY(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    if (null === e.packageID || void 0 === e.packageID) throw new eU("packageID", "Required parameter requestParameters.packageID was null or undefined when calling v1PackagesPackageIdAssetsGet.");
                                    return r = {}, n = {}, [4, this.request({
                                        path: "/v1/packages/{packageId}/assets".replace("{".concat("packageID", "}"), encodeURIComponent(String(e.packageID))),
                                        schemaPath: "/v1/packages/{packageId}/assets",
                                        method: "GET",
                                        headers: n,
                                        query: r
                                    }, t)];
                                case 1:
                                    return [2, new e_(i.sent(), function(e) {
                                        return null == e ? e : {
                                            assetIds: ez(e, "assetIds") ? e.assetIds : void 0
                                        }
                                    })]
                            }
                        })
                    })
                }, t.prototype.v1PackagesPackageIdAssetsGet = function(e, t) {
                    return dB(this, void 0, void 0, function() {
                        return dY(this, function(r) {
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
            })(eC),
            function(e) {
                function t() {
                    return null !== e && e.apply(this, arguments) || this
                }
                d_(t, e), t.prototype.v1CollectionsItemsItemTypeItemTargetIdDeleteRaw = function(e, t) {
                    return dB(this, void 0, void 0, function() {
                        var r, n;
                        return dY(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    if (null === e.itemType || void 0 === e.itemType) throw new eU("itemType", "Required parameter requestParameters.itemType was null or undefined when calling v1CollectionsItemsItemTypeItemTargetIdDelete.");
                                    if (null === e.itemTargetId || void 0 === e.itemTargetId) throw new eU("itemTargetId", "Required parameter requestParameters.itemTargetId was null or undefined when calling v1CollectionsItemsItemTypeItemTargetIdDelete.");
                                    return r = {}, n = {}, [4, this.request({
                                        path: "/v1/collections/items/{itemType}/{itemTargetId}".replace("{".concat("itemType", "}"), encodeURIComponent(String(e.itemType))).replace("{".concat("itemTargetId", "}"), encodeURIComponent(String(e.itemTargetId))),
                                        schemaPath: "/v1/collections/items/{itemType}/{itemTargetId}",
                                        method: "DELETE",
                                        headers: n,
                                        query: r
                                    }, t)];
                                case 1:
                                    return [2, new e_(i.sent())]
                            }
                        })
                    })
                }, t.prototype.v1CollectionsItemsItemTypeItemTargetIdDelete = function(e, t) {
                    return dB(this, void 0, void 0, function() {
                        return dY(this, function(r) {
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
                    return dB(this, void 0, void 0, function() {
                        var r, n;
                        return dY(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    if (null === e.itemType || void 0 === e.itemType) throw new eU("itemType", "Required parameter requestParameters.itemType was null or undefined when calling v1CollectionsItemsItemTypeItemTargetIdPost.");
                                    if (null === e.itemTargetId || void 0 === e.itemTargetId) throw new eU("itemTargetId", "Required parameter requestParameters.itemTargetId was null or undefined when calling v1CollectionsItemsItemTypeItemTargetIdPost.");
                                    return r = {}, n = {}, [4, this.request({
                                        path: "/v1/collections/items/{itemType}/{itemTargetId}".replace("{".concat("itemType", "}"), encodeURIComponent(String(e.itemType))).replace("{".concat("itemTargetId", "}"), encodeURIComponent(String(e.itemTargetId))),
                                        schemaPath: "/v1/collections/items/{itemType}/{itemTargetId}",
                                        method: "POST",
                                        headers: n,
                                        query: r
                                    }, t)];
                                case 1:
                                    return [2, new e_(i.sent())]
                            }
                        })
                    })
                }, t.prototype.v1CollectionsItemsItemTypeItemTargetIdPost = function(e, t) {
                    return dB(this, void 0, void 0, function() {
                        return dY(this, function(r) {
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
            }(eC);
            var dK = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return d_(t, e), t.prototype.v1UsersUserIdAssetsCollectiblesGetRaw = function(e, t) {
                        return dB(this, void 0, void 0, function() {
                            var r, n;
                            return dY(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new eU("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdAssetsCollectiblesGet.");
                                        return r = {}, void 0 !== e.assetType && (r.assetType = e.assetType), void 0 !== e.limit && (r.limit = e.limit), void 0 !== e.cursor && (r.cursor = e.cursor), void 0 !== e.sortOrder && (r.sortOrder = e.sortOrder), n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/assets/collectibles".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                            schemaPath: "/v1/users/{userId}/assets/collectibles",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new e_(i.sent(), function(e) {
                                            return null == e ? e : {
                                                previousPageCursor: ez(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                                nextPageCursor: ez(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                                data: ez(e, "data") ? e.data.map(dQ) : void 0
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdAssetsCollectiblesGet = function(e, t) {
                        return dB(this, void 0, void 0, function() {
                            return dY(this, function(r) {
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
                        return dB(this, void 0, void 0, function() {
                            var r, n;
                            return dY(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new eU("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdCanViewInventoryGet.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/can-view-inventory".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                            schemaPath: "/v1/users/{userId}/can-view-inventory",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new e_(i.sent(), function(e) {
                                            return null == e ? e : {
                                                canView: ez(e, "canView") ? e.canView : void 0
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdCanViewInventoryGet = function(e, t) {
                        return dB(this, void 0, void 0, function() {
                            return dY(this, function(r) {
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
                        return dB(this, void 0, void 0, function() {
                            var r, n;
                            return dY(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new eU("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdCategoriesFavoritesGet.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/categories/favorites".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                            schemaPath: "/v1/users/{userId}/categories/favorites",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new e_(i.sent(), function(e) {
                                            return dW(e)
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdCategoriesFavoritesGet = function(e, t) {
                        return dB(this, void 0, void 0, function() {
                            return dY(this, function(r) {
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
                        return dB(this, void 0, void 0, function() {
                            var r, n;
                            return dY(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new eU("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdCategoriesGet.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/categories".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                            schemaPath: "/v1/users/{userId}/categories",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new e_(i.sent(), function(e) {
                                            return dW(e)
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdCategoriesGet = function(e, t) {
                        return dB(this, void 0, void 0, function() {
                            return dY(this, function(r) {
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
                        return dB(this, void 0, void 0, function() {
                            var r, n;
                            return dY(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new eU("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdGet.");
                                        if (null === e.itemType || void 0 === e.itemType) throw new eU("itemType", "Required parameter requestParameters.itemType was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdGet.");
                                        if (null === e.itemTargetId || void 0 === e.itemTargetId) throw new eU("itemTargetId", "Required parameter requestParameters.itemTargetId was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdGet.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/items/{itemType}/{itemTargetId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("itemType", "}"), encodeURIComponent(String(e.itemType))).replace("{".concat("itemTargetId", "}"), encodeURIComponent(String(e.itemTargetId))),
                                            schemaPath: "/v1/users/{userId}/items/{itemType}/{itemTargetId}",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new e_(i.sent(), function(e) {
                                            return null == e ? e : {
                                                previousPageCursor: ez(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                                nextPageCursor: ez(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                                data: ez(e, "data") ? e.data.map(dV) : void 0
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdItemsItemTypeItemTargetIdGet = function(e, t) {
                        return dB(this, void 0, void 0, function() {
                            return dY(this, function(r) {
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
                        return dB(this, void 0, void 0, function() {
                            var r, n, i;
                            return dY(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        if (null === e.userId || void 0 === e.userId) throw new eU("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet.");
                                        if (null === e.itemType || void 0 === e.itemType) throw new eU("itemType", "Required parameter requestParameters.itemType was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet.");
                                        if (null === e.itemTargetId || void 0 === e.itemTargetId) throw new eU("itemTargetId", "Required parameter requestParameters.itemTargetId was null or undefined when calling v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v1/users/{userId}/items/{itemType}/{itemTargetId}/is-owned".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("itemType", "}"), encodeURIComponent(String(e.itemType))).replace("{".concat("itemTargetId", "}"), encodeURIComponent(String(e.itemTargetId))),
                                            schemaPath: "/v1/users/{userId}/items/{itemType}/{itemTargetId}/is-owned",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return i = o.sent(), this.isJsonMime(i.headers.get("content-type")) ? [2, new e_(i)] : [2, new eB(i)]
                                }
                            })
                        })
                    }, t.prototype.v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet = function(e, t) {
                        return dB(this, void 0, void 0, function() {
                            return dY(this, function(r) {
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
                }(eC),
                dH = eC;

            function dX() {
                return null !== dH && dH.apply(this, arguments) || this
            }
            d_(dX, dH), dX.prototype.v1UsersUserIdPlacesInventoryGetRaw = function(e, t) {
                return dB(this, void 0, void 0, function() {
                    var r, n;
                    return dY(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new eU("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdPlacesInventoryGet.");
                                if (null === e.placesTab || void 0 === e.placesTab) throw new eU("placesTab", "Required parameter requestParameters.placesTab was null or undefined when calling v1UsersUserIdPlacesInventoryGet.");
                                if (null === e.itemsPerPage || void 0 === e.itemsPerPage) throw new eU("itemsPerPage", "Required parameter requestParameters.itemsPerPage was null or undefined when calling v1UsersUserIdPlacesInventoryGet.");
                                if (null === e.cursor || void 0 === e.cursor) throw new eU("cursor", "Required parameter requestParameters.cursor was null or undefined when calling v1UsersUserIdPlacesInventoryGet.");
                                return r = {}, void 0 !== e.placesTab && (r.placesTab = e.placesTab), void 0 !== e.itemsPerPage && (r.itemsPerPage = e.itemsPerPage), void 0 !== e.cursor && (r.cursor = e.cursor), n = {}, [4, this.request({
                                    path: "/v1/users/{userId}/places/inventory".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/places/inventory",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return [2, new e_(i.sent(), function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: ez(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: ez(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: ez(e, "data") ? e.data.map(dq) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, dX.prototype.v1UsersUserIdPlacesInventoryGet = function(e, t) {
                return dB(this, void 0, void 0, function() {
                    return dY(this, function(r) {
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
            var dZ = cN(window.location.hostname),
                d$ = new dK(new eY({
                    robloxSiteDomain: dZ.rootDomain,
                    basePath: (v = dZ.rootDomain, "https://".concat("inventory", ".").concat(v)),
                    credentials: "include"
                })),
                dJ = function(e) {
                    if (e === sB.ItemType.Asset) return 0;
                    throw Error("Unsupported gift item type: ".concat(e))
                },
                d0 = function() {
                    var e = !(arguments.length > 0) || void 0 === arguments[0] || arguments[0],
                        t = (0, ru.userId)();
                    return (0, P.useQuery)({
                        queryKey: ["owns-gift-item", t, sY.itemId, sY.itemType],
                        queryFn: function() {
                            if (null == t) throw Error("Cannot check gift item ownership without a user id");
                            return d$.v1UsersUserIdItemsItemTypeItemTargetIdIsOwnedGet({
                                userId: t,
                                itemType: dJ(sY.itemType),
                                itemTargetId: sY.itemId
                            })
                        },
                        enabled: e && null != t
                    })
                },
                d1 = function(e) {
                    var t, r, n = e.robloxSubscriptionProduct,
                        i = e.robloxSubscriptionMembership,
                        o = e.robloxPlusUserBenefits,
                        a = e.isFaeFreeTrial,
                        l = e.onOpenReferrals,
                        u = (0, S.useTranslation)().translate,
                        c = s$().eligibility,
                        s = null == o ? void 0 : o.robuxSavedWithPlus,
                        d = null == o ? void 0 : o.itemsBoughtWithPlusDiscount,
                        f = null == o ? void 0 : o.privateServersCreatedForFree,
                        p = null == o ? void 0 : o.robuxSentToFriends,
                        m = (0, tr.useMemo)(function() {
                            return i.activeOffers.some(function(e) {
                                return "FreeTrial" === e.offerType
                            })
                        }, [i.activeOffers]),
                        y = (0, tr.useMemo)(function() {
                            return dn(i.activationTimestampMs, i.periodType, i.nextRenewalTimestampMs, Date.now())
                        }, [i.activationTimestampMs, i.nextRenewalTimestampMs, i.periodType]),
                        b = (0, tr.useMemo)(function() {
                            var e, t, r, o, a, l, u, c, s, d, f;
                            return t = t8(n), r = null == (e = i.productTypeMembershipDetails.robloxSubscriptionMembershipDetails) ? void 0 : e.features.virtualTransactionDiscountTierId, d = t.virtualTransactionDiscounts, f = null != (o = null == (l = r ? null != (u = null != (c = null == d ? void 0 : d.find(function(e) {
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
                        g = null != (t = null == (r = b.current) ? void 0 : r.discountPercent) ? t : 0,
                        h = d0(!1).data;
                    return (0, O.jsx)("div", {
                        className: "flex flex-col items-center",
                        children: (0, O.jsxs)("div", {
                            className: "margin-top-[48px] padding-x-xlarge content-emphasis gap-y-xxlarge width-full large:max-width-[730px] flex flex-col",
                            children: [!1, a && (0, O.jsx)(sJ, {
                                body: u("Subtext.FreeTrialBanner", {
                                    date: new Date(i.expirationTimestampMs).toLocaleDateString(void 0, {
                                        day: "2-digit",
                                        month: "short",
                                        year: "numeric"
                                    })
                                }),
                                title: u("Header.FreeTrialBannerTitle")
                            }), (0, O.jsxs)("div", {
                                className: "gap-y-small large:items-center flex flex-col",
                                children: [(0, O.jsx)(sa, {}), (0, O.jsx)(dR, {
                                    activationTimestampMs: i.activationTimestampMs,
                                    expirationTimestampMs: i.expirationTimestampMs,
                                    hasFreeTrial: m,
                                    nextRenewalTimestampMs: i.nextRenewalTimestampMs
                                }), (0, O.jsx)(di, {
                                    activationTimestampMs: i.activationTimestampMs,
                                    currentDiscountPercent: g,
                                    isCancelled: null === i.nextRenewalTimestampMs || 0 === i.nextRenewalTimestampMs,
                                    nextDiscount: b.next,
                                    periodType: i.periodType
                                })]
                            }), (0, O.jsxs)("div", {
                                className: "flex flex-col gap-y-[32px]",
                                children: [e9() && "Eligible" === c ? (0, O.jsx)(dp, {
                                    children: (0, O.jsx)(db, {
                                        onOpenDashboard: l
                                    })
                                }) : null, (0, O.jsx)(dh, {
                                    currentDiscountPercent: g,
                                    itemsBoughtWithDiscountCount: d,
                                    privateServersCreatedCount: f,
                                    robuxSentToFriendsCount: p,
                                    savedRobux: s
                                }), (0, O.jsx)(dk, {
                                    featureConfig: t8(n)
                                }), (0, O.jsx)(t3, {
                                    children: (0, O.jsx)("div", {
                                        className: "gap-y-medium flex flex-col",
                                        children: (0, O.jsx)(dy, {
                                            robloxSubscriptionProduct: n
                                        })
                                    })
                                })]
                            })]
                        })
                    })
                };

            function d4(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var d2 = function(e) {
                    var t, r, n, i = e.deviceMeta,
                        o = e.robloxSubscriptionProduct,
                        a = e.onDismiss,
                        l = (0, S.useTranslation)().translate,
                        u = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, tr.useState)(null)) || function(e) {
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
                                if ("string" == typeof e) return d4(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return d4(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        c = u[0],
                        s = u[1];
                    (0, tr.useEffect)(function() {
                        window.scrollTo({
                            top: 0,
                            behavior: "smooth"
                        })
                    }, []);
                    var d = !i.isInApp && (0, O.jsxs)("div", {
                        "aria-label": l("Action.OK"),
                        className: "bottom-dock padding-t-medium bg-surface-100 large:hidden width-full gap-y-medium flex flex-col",
                        "data-testid": "welcome-dismiss-dock",
                        role: "region",
                        children: [(0, O.jsx)(t6, {}), (0, O.jsx)("div", {
                            className: "width-full gap-y-medium padding-bottom-[env(safe-area-inset-bottom\\,0px)] padding-x-xxlarge flex flex-col items-stretch",
                            children: (0, O.jsx)(tF, {
                                className: "min-width-0 width-full margin-bottom-[24px] large:margin-bottom-none",
                                size: "Large",
                                variant: "Emphasis",
                                onClick: a,
                                children: l("Action.OK")
                            })
                        })]
                    });
                    return (0, O.jsxs)(tr.Fragment, {
                        children: [(0, O.jsx)(t5, {}), (0, O.jsx)("div", {
                            className: "width-full min-width-0 large:items-center flex flex-col items-start",
                            children: (0, O.jsxs)("div", {
                                className: "margin-top-[48px] width-full min-width-0 content-emphasis large:max-width-[730px] large:gap-y-[60px] large:self-auto large:padding-x-xlarge flex flex-col gap-y-[var(--size-1200)] self-stretch",
                                children: [(0, O.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge text-align-x-start large:gap-y-[24px] large:items-center large:padding-x-none large:text-align-x-center flex flex-col items-start",
                                    children: [(0, O.jsxs)("div", {
                                        className: "gap-y-xsmall large:items-center flex flex-col items-start",
                                        children: [(0, O.jsx)(ts, {
                                            className: "!size-1800 margin-bottom-medium",
                                            name: "icon-regular-roblox-plus"
                                        }), (0, O.jsx)("h1", {
                                            className: "text-heading-large",
                                            children: l("Title.Welcome", {
                                                productShort: l("Label.BlackbirdShort")
                                            })
                                        }), (0, O.jsx)("p", {
                                            className: "text-body-large content-default",
                                            children: l("Description.Welcome", {
                                                product: l("Label.Blackbird")
                                            })
                                        })]
                                    }), !i.isInApp && (0, O.jsx)("div", {
                                        className: "width-full gap-y-medium padding-t-none large:margin-x-auto large:margin-top-[12px] large:flex large:max-width-[min(440px,100%)] large:width-full large:flex-col large:items-center hidden items-start",
                                        "data-testid": "welcome-dismiss-inline",
                                        children: (0, O.jsx)("div", {
                                            className: "width-full gap-x-small flex shrink-0 flex-row items-start justify-center",
                                            children: (0, O.jsx)(tF, {
                                                className: "width-full large:width-[230px] shrink-0",
                                                size: "Medium",
                                                variant: "Emphasis",
                                                onClick: a,
                                                children: l("Action.OK")
                                            })
                                        })
                                    })]
                                }), (0, O.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge large:padding-x-none flex flex-col",
                                    children: [(0, O.jsx)("span", {
                                        className: "text-heading-small",
                                        children: l("Title.BenefitsUnlocked")
                                    }), (0, O.jsx)(t2, {
                                        featureConfig: t8(o),
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
                        }), d, (0, O.jsx)(sS, {
                            body: null != (r = null == c ? void 0 : c.secondary) ? r : "",
                            open: null != c,
                            title: null != (n = null == c ? void 0 : c.primary) ? n : "",
                            onOpenChange: function(e) {
                                e || s(null)
                            }
                        })]
                    })
                },
                d3 = cN(window.location.hostname),
                d5 = new eA({
                    robloxSiteDomain: d3.rootDomain,
                    basePath: cI(d3.rootDomain, "roblox-subscriptions"),
                    credentials: "include"
                });
            new s8(d5);
            var d6 = new s6(d5);
            new s9(d5);
            var d8 = function(e, t) {
                var r = (0, tr.useRef)();
                return t(e) && (r.current = e), r.current
            };

            function d9(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function d7(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function fe(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var o = e.apply(t, r);

                        function a(e) {
                            d7(o, n, i, a, l, "next", e)
                        }

                        function l(e) {
                            d7(o, n, i, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function ft(e, t) {
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
                        if ("string" == typeof e) return d9(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return d9(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function fr(e, t) {
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
            var fn = function() {
                    var e, t, r = (0, tr.useMemo)(function() {
                            return (0, e6.getDeviceMeta)()
                        }, []),
                        n = ft((0, tr.useState)(function() {
                            return new URLSearchParams(window.location.search).has("welcome")
                        }), 2),
                        i = n[0],
                        o = n[1],
                        a = ft((0, tr.useState)(function() {
                            return new URLSearchParams(window.location.search).has("faeFreeTrialConfirmation")
                        }), 2),
                        l = a[0],
                        u = a[1],
                        c = ft((0, tr.useState)(function() {
                            return e9() && new URLSearchParams(window.location.search).has(te)
                        }), 2),
                        s = c[0],
                        d = c[1],
                        f = (0, tr.useRef)(!1),
                        p = ft((0, tr.useState)(i || l), 2),
                        m = p[0],
                        y = p[1],
                        b = (0, P.useQuery)({
                            queryKey: ["get-roblox-subscription-membership"],
                            queryFn: function() {
                                return fe(function() {
                                    var e;
                                    return fr(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, cE.subscriptionsV2ListSubscriptions({
                                                    productType: eZ,
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
                        g = d8(b.data, function() {
                            return void 0 !== b.data
                        }),
                        h = null == g ? void 0 : g.productKey.id,
                        v = (0, P.useQuery)({
                            queryKey: ["check-fae-free-trial", h],
                            queryFn: function() {
                                return fe(function() {
                                    var e, t;
                                    return fr(this, function(r) {
                                        switch (r.label) {
                                            case 0:
                                                if (!h) return [2, !1];
                                                return [4, cE.subscriptionsV2ListAvailableSubscriptionProducts({
                                                    productType: eZ,
                                                    includePurchased: !0,
                                                    grantType: "FaeFreeTrial"
                                                })];
                                            case 1:
                                                if (void 0 === (t = null == (e = r.sent().products.find(function(e) {
                                                        return "Week" === e.periodType
                                                    })) ? void 0 : e.productKey.id) || t !== h) throw Error("FAE trial product not found yet");
                                                return [2, !0]
                                        }
                                    })
                                })()
                            },
                            enabled: !!g,
                            retry: function(e) {
                                return e < 3
                            },
                            retryDelay: 100
                        }),
                        w = (0, P.useQuery)({
                            queryKey: ["list-roblox-subscription-available-products"],
                            queryFn: function() {
                                return fe(function() {
                                    var e;
                                    return fr(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, cE.subscriptionsV2ListAvailableSubscriptionProducts({
                                                    productType: eZ,
                                                    includePurchased: !0,
                                                    includeBundles: !0,
                                                    skipEligibilityCheck: !0
                                                })];
                                            case 1:
                                                if (0 === (e = t.sent().products).length) return [2, null];
                                                return [2, e.toSorted(function(e, t) {
                                                    return t9(e) - t9(t)
                                                })]
                                        }
                                    })
                                })()
                            },
                            enabled: null === b.data,
                            retry: 3,
                            retryDelay: 100
                        }),
                        x = d8(w.data, function() {
                            return void 0 !== w.data
                        }),
                        j = d8(null != (e = null == (t = b.data) ? void 0 : t.productInfo) ? e : null == x ? void 0 : x[0], function() {
                            var e;
                            return (null == (e = b.data) ? void 0 : e.productInfo) !== void 0 || void 0 !== x
                        }),
                        S = (0, P.useQuery)({
                            queryKey: ["get-roblox-plus-user-benefits"],
                            queryFn: function() {
                                return d6.robloxPlusGetRobloxPlusUserBenefits()
                            },
                            enabled: !!g,
                            retry: 3
                        }),
                        I = (0, P.useQuery)({
                            queryKey: ["guac/app-policy/disable-blackbird-entrypoints"],
                            queryFn: function() {
                                return fe(function() {
                                    return fr(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return e.trys.push([0, 2, , 3]), [4, (0, e5.callBehaviour)("app-policy")];
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
                        M = d8(I.data, function() {
                            return void 0 !== I.data
                        }),
                        N = (0, tr.useCallback)(function() {
                            var e = new URL(window.location.href);
                            e.searchParams.set("welcome", ""), window.history.replaceState(null, "", e.toString()), o(!0)
                        }, []),
                        E = (0, tr.useCallback)(function() {
                            var e = function() {
                                try {
                                    var e = sessionStorage.getItem(tt);
                                    if (!e) return null;
                                    sessionStorage.removeItem(tt);
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
                        T = (0, tr.useCallback)(function() {
                            var e = new URL(window.location.href);
                            e.searchParams.delete("faeFreeTrialConfirmation"), window.history.replaceState(null, "", e.toString()), u(!1)
                        }, []),
                        D = (0, tr.useCallback)(function() {
                            var e = new URL(window.location.href);
                            e.searchParams.set(te, ""), window.history.replaceState(null, "", e.toString()), f.current = !0, d(!0)
                        }, []),
                        A = (0, tr.useCallback)(function() {
                            if (!f.current) {
                                window.location.href = (0, e3.getAbsoluteUrl)("/home");
                                return
                            }
                            var e = new URL(window.location.href);
                            e.searchParams.delete(te), window.history.replaceState(null, "", e.toString()), d(!1)
                        }, []);
                    (0, tr.useEffect)(function() {
                        if (m) {
                            var e = setTimeout(function() {
                                y(!1)
                            }, 6e4);
                            return function() {
                                clearTimeout(e)
                            }
                        }
                    }, [m]), (0, tr.useEffect)(function() {
                        m && b.data && (y(!1), l || N())
                    }, [N, l, m, b.data]);
                    var L = (0, tr.useCallback)(function() {
                        y(!0)
                    }, []);
                    if (w.error || null === w.data || b.error && !m || I.error || !r) return (0, O.jsx)(tG, {});
                    if (void 0 === j || void 0 === g || void 0 === M) return (0, O.jsx)(rl, {});
                    var C = null !== g;
                    if (l) return C ? v.isLoading ? (0, O.jsx)(rl, {}) : v.data ? (0, O.jsx)(re, {
                        robloxSubscriptionProduct: j,
                        onDismiss: T
                    }) : (0, O.jsx)(tG, {}) : m ? (0, O.jsx)(rl, {}) : (0, O.jsx)(tG, {});
                    if (i)
                        if (C) return (0, O.jsx)(d2, {
                            deviceMeta: r,
                            robloxSubscriptionMembership: g,
                            robloxSubscriptionProduct: j,
                            onDismiss: E
                        });
                        else if (m) return (0, O.jsx)(rl, {});
                    else return (0, O.jsx)(tG, {});
                    return s ? (0, O.jsx)(cG, {
                        robloxPlusUserBenefits: S.data,
                        subscribeButtonProps: {
                            productId: j.productKey.id,
                            productType: j.productKey.type,
                            deviceMeta: r,
                            isDisabled: M
                        },
                        onClose: A
                    }) : C ? (0, O.jsx)(d1, {
                        isFaeFreeTrial: !0 === v.data,
                        robloxPlusUserBenefits: S.data,
                        robloxSubscriptionMembership: g,
                        robloxSubscriptionProduct: j,
                        onOpenReferrals: D
                    }) : x ? (0, O.jsx)(sH, {
                        deviceMeta: r,
                        isEntrypointDisabled: M,
                        robloxSubscriptionProducts: x,
                        onMobilePurchaseInitiated: L
                    }) : (0, O.jsx)(rl, {})
                },
                fi = function(e) {
                    var t = e.children;
                    return (0, O.jsx)("div", {
                        className: "clip-x margin-bottom-[160px] min-height-[400px] padding-top-[16px] large:margin-bottom-[120px] relative",
                        children: t
                    })
                },
                fo = function() {
                    return (0, O.jsx)(P.QueryClientProvider, {
                        client: S.queryClient,
                        children: (0, O.jsx)(fi, {
                            children: (0, O.jsx)(fn, {})
                        })
                    })
                };
            M()(function() {
                (0, S.renderWithErrorBoundary)((0, O.jsx)(S.TranslationProvider, {
                    config: N.P,
                    children: (0, O.jsx)(fo, {})
                }), document.getElementById("roblox-subscription-container"), void 0, (0, O.jsx)(fi, {
                    children: (0, O.jsx)(tG, {})
                }))
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("RobloxSubscription");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/robloxSubscription-aa385ffc8f16a357.js.map