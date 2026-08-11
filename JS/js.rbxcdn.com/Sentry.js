! function() {
    try {
        var e = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "e0eea33fb453a2e958bbdebd4644c9309e77f4d9"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "d2581191-079c-4668-8341-c4fbdcc2b688", e._sentryDebugIdIdentifier = "sentry-dbid-d2581191-079c-4668-8341-c4fbdcc2b688")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e = {
            794: function(e, t, n) {
                function r() {
                    return "undefined" != typeof __SENTRY_BROWSER_BUNDLE__ && !!__SENTRY_BROWSER_BUNDLE__
                }

                function a() {
                    return "npm"
                }
                n.d(t, {
                    Z: function() {
                        return r
                    },
                    e: function() {
                        return a
                    }
                })
            },
            61: function(e, t, n) {
                n.d(t, {
                    w: function() {
                        return o
                    }
                });
                var r = n(794);
                e = n.hmd(e);
                var a = n(964);

                function o() {
                    return !(0, r.Z)() && "[object process]" === Object.prototype.toString.call(void 0 !== a ? a : 0)
                }
            },
            964: function(e, t) {
                Object.defineProperty(t, "__esModule", {
                    value: !0
                });
                var n, r, a, o = {
                        exports: {}
                    },
                    i = o.exports = {};

                function u() {
                    throw Error("setTimeout has not been defined")
                }

                function c() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    n = "function" == typeof setTimeout ? setTimeout : u
                } catch (e) {
                    n = u
                }
                try {
                    r = "function" == typeof clearTimeout ? clearTimeout : c
                } catch (e) {
                    r = c
                }

                function l(e) {
                    if (n === setTimeout) return setTimeout(e, 0);
                    if ((n === u || !n) && setTimeout) return n = setTimeout, setTimeout(e, 0);
                    try {
                        return n(e, 0)
                    } catch (t) {
                        try {
                            return n.call(null, e, 0)
                        } catch (t) {
                            return n.call(this, e, 0)
                        }
                    }
                }
                var s = [],
                    f = !1,
                    d = -1;

                function p() {
                    f && a && (f = !1, a.length ? s = a.concat(s) : d = -1, s.length && m())
                }

                function m() {
                    if (!f) {
                        var e = l(p);
                        f = !0;
                        for (var t = s.length; t;) {
                            for (a = s, s = []; ++d < t;) a && a[d].run();
                            d = -1, t = s.length
                        }
                        a = null, f = !1,
                            function(e) {
                                if (r === clearTimeout) return clearTimeout(e);
                                if ((r === c || !r) && clearTimeout) return r = clearTimeout, clearTimeout(e);
                                try {
                                    r(e)
                                } catch (t) {
                                    try {
                                        return r.call(null, e)
                                    } catch (t) {
                                        return r.call(this, e)
                                    }
                                }
                            }(e)
                    }
                }

                function y(e, t) {
                    this.fun = e, this.array = t
                }

                function v() {}

                function b() {}
                i.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var n = 1; n < arguments.length; n++) t[n - 1] = arguments[n];
                    s.push(new y(e, t)), 1 !== s.length || f || l(m)
                }, y.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, i.title = "browser", i.browser = !0, i.env = {}, i.argv = [], i.version = "", i.versions = {}, i.on = v, i.addListener = v, i.once = v, i.off = v, i.removeListener = v, i.removeAllListeners = v, i.emit = v, i.prependListener = v, i.prependOnceListener = v, i.listeners = function(e) {
                    return []
                }, i.binding = function(e) {
                    throw Error("process.binding is not supported")
                }, i.cwd = function() {
                    return "/"
                }, i.chdir = function(e) {
                    throw Error("process.chdir is not supported")
                }, i.umask = function() {
                    return 0
                };
                var h = o.exports.browser,
                    g = o.exports.binding,
                    S = {},
                    _ = "browser",
                    E = "browser",
                    O = "browser",
                    w = [],
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
                        emitWarning: b,
                        prependListener: o.exports.prependListener,
                        prependOnceListener: o.exports.prependOnceListener,
                        listeners: o.exports.listeners,
                        binding: g,
                        cwd: o.exports.cwd,
                        chdir: o.exports.chdir,
                        umask: o.exports.umask,
                        exit: b,
                        pid: 1,
                        features: S,
                        kill: b,
                        dlopen: b,
                        uptime: b,
                        memoryUsage: b,
                        uvCounters: b,
                        platform: _,
                        arch: E,
                        execPath: O,
                        execArgv: w
                    };
                t.addListener = o.exports.addListener, t.arch = E, t.argv = o.exports.argv, t.binding = g, t.browser = h, t.chdir = o.exports.chdir, t.cwd = o.exports.cwd, t.default = I, t.dlopen = b, t.emit = o.exports.emit, t.emitWarning = b, t.env = o.exports.env, t.execArgv = w, t.execPath = O, t.exit = b, t.features = S, t.kill = b, t.listeners = o.exports.listeners, t.memoryUsage = b, t.nextTick = o.exports.nextTick, t.off = o.exports.off, t.on = o.exports.on, t.once = o.exports.once, t.pid = 1, t.platform = _, t.prependListener = o.exports.prependListener, t.prependOnceListener = o.exports.prependOnceListener, t.removeAllListeners = o.exports.removeAllListeners, t.removeListener = o.exports.removeListener, t.title = o.exports.title, t.umask = o.exports.umask, t.uptime = b, t.uvCounters = b, t.version = o.exports.version, t.versions = o.exports.versions, t = e.exports = I
            }
        },
        t = {};

    function n(r) {
        var a = t[r];
        if (void 0 !== a) return a.exports;
        var o = t[r] = {
            id: r,
            loaded: !1,
            exports: {}
        };
        return e[r](o, o.exports, n), o.loaded = !0, o.exports
    }
    n.n = function(e) {
            var t = e && e.__esModule ? function() {
                return e.default
            } : function() {
                return e
            };
            return n.d(t, {
                a: t
            }), t
        }, n.d = function(e, t) {
            for (var r in t) n.o(t, r) && !n.o(e, r) && Object.defineProperty(e, r, {
                enumerable: !0,
                get: t[r]
            })
        }, n.hmd = function(e) {
            return (e = Object.create(e)).children || (e.children = []), Object.defineProperty(e, "exports", {
                enumerable: !0,
                set: function() {
                    throw Error("ES Modules may not assign module.exports or exports.*, Use ESM export syntax, instead: " + e.id)
                }
            }), e
        }, n.g = function() {
            if ("object" == typeof globalThis) return globalThis;
            try {
                return this || Function("return this")()
            } catch (e) {
                if ("object" == typeof window) return window
            }
        }(), n.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, n.rv = function() {
            return "1.5.7"
        }, n.ruid = "bundler=rspack@1.5.7",
        function() {
            var e, t, r, a, o, i, u, c, l, s, f, d, p, m, y, v, b, h, g, S, _, E, O, w, I, A, T, N, k, j, x, R, P, V, Z, C, D, F, L, X, Y, W, B, G, U, M, J, K, z, H, Q, q, $, ee, et, en, er, ea, eo, ei, eu, ec, el, es, ef, ed, ep, em, ey, ev, eb, eh, eg, eS, e_, eE, eO, ew, eI, eA, eT, eN = "10.38.0",
                ek = globalThis;

            function ej() {
                return ex(ek), ek
            }

            function ex(e) {
                var t = e.__SENTRY__ = e.__SENTRY__ || {};
                return t.version = t.version || eN, t[eN] = t[eN] || {}
            }

            function eR(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : ek,
                    r = n.__SENTRY__ = n.__SENTRY__ || {},
                    a = r[eN] = r[eN] || {};
                return a[e] || (a[e] = t())
            }
            var eP = "undefined" == typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;

            function eV(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var eZ = Object.prototype.toString;

            function eC(e) {
                switch (eZ.call(e)) {
                    case "[object Error]":
                    case "[object Exception]":
                    case "[object DOMException]":
                    case "[object WebAssembly.Exception]":
                        return !0;
                    default:
                        return eM(e, Error)
                }
            }

            function eD(e, t) {
                return eZ.call(e) === "[object ".concat(t, "]")
            }

            function eF(e) {
                return eD(e, "ErrorEvent")
            }

            function eL(e) {
                return eD(e, "DOMError")
            }

            function eX(e) {
                return eD(e, "String")
            }

            function eY(e) {
                return (void 0 === e ? "undefined" : eV(e)) === "object" && null !== e && "__sentry_template_string__" in e && "__sentry_template_values__" in e
            }

            function eW(e) {
                return null === e || eY(e) || (void 0 === e ? "undefined" : eV(e)) !== "object" && "function" != typeof e
            }

            function eB(e) {
                return eD(e, "Object")
            }

            function eG(e) {
                return "undefined" != typeof Event && eM(e, Event)
            }

            function eU(e) {
                return !!((null == e ? void 0 : e.then) && "function" == typeof e.then)
            }

            function eM(e, t) {
                try {
                    return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
                } catch (e) {
                    return !1
                }
            }

            function eJ(e) {
                return !!((void 0 === e ? "undefined" : eV(e)) === "object" && null !== e && (e.__isVue || e._isVue || e.__v_isVNode))
            }

            function eK(e) {
                return "undefined" != typeof Request && eM(e, Request)
            }

            function ez(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function eH(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                if (!e) return "<unknown>";
                try {
                    for (var n, r = e, a = [], o = 0, i = 0, u = Array.isArray(t) ? t : t.keyAttrs, c = !Array.isArray(t) && t.maxStringLength || 80; r && o++ < 5 && (n = function(e, t) {
                            var n = [];
                            if (!(null == e ? void 0 : e.tagName)) return "";
                            if (ek.HTMLElement && ez(e, HTMLElement) && e.dataset) {
                                if (e.dataset.sentryComponent) return e.dataset.sentryComponent;
                                if (e.dataset.sentryElement) return e.dataset.sentryElement
                            }
                            n.push(e.tagName.toLowerCase());
                            var r = (null == t ? void 0 : t.length) ? t.filter(function(t) {
                                return e.getAttribute(t)
                            }).map(function(t) {
                                return [t, e.getAttribute(t)]
                            }) : null;
                            if (null == r ? void 0 : r.length) r.forEach(function(e) {
                                n.push("[".concat(e[0], '="').concat(e[1], '"]'))
                            });
                            else {
                                e.id && n.push("#".concat(e.id));
                                var a = e.className;
                                if (a && eX(a)) {
                                    var o = a.split(/\s+/),
                                        i = !0,
                                        u = !1,
                                        c = void 0;
                                    try {
                                        for (var l, s = o[Symbol.iterator](); !(i = (l = s.next()).done); i = !0) {
                                            var f = l.value;
                                            n.push(".".concat(f))
                                        }
                                    } catch (e) {
                                        u = !0, c = e
                                    } finally {
                                        try {
                                            i || null == s.return || s.return()
                                        } finally {
                                            if (u) throw c
                                        }
                                    }
                                }
                            }
                            var d = !0,
                                p = !1,
                                m = void 0;
                            try {
                                for (var y, v = ["aria-label", "type", "name", "title", "alt"][Symbol.iterator](); !(d = (y = v.next()).done); d = !0) {
                                    var b = y.value,
                                        h = e.getAttribute(b);
                                    h && n.push("[".concat(b, '="').concat(h, '"]'))
                                }
                            } catch (e) {
                                p = !0, m = e
                            } finally {
                                try {
                                    d || null == v.return || v.return()
                                } finally {
                                    if (p) throw m
                                }
                            }
                            return n.join("")
                        }(r, u), "html" !== n && (!(o > 1) || !(i + 3 * a.length + n.length >= c)));) a.push(n), i += n.length, r = r.parentNode;
                    return a.reverse().join(" > ")
                } catch (e) {
                    return "<unknown>"
                }
            }

            function eQ() {
                try {
                    return ek.document.location.href
                } catch (e) {
                    return ""
                }
            }

            function eq(e) {
                if (!ek.HTMLElement) return null;
                for (var t = e, n = 0; n < 5 && t; n++) {
                    if (ez(t, HTMLElement)) {
                        if (t.dataset.sentryComponent) return t.dataset.sentryComponent;
                        if (t.dataset.sentryElement) return t.dataset.sentryElement
                    }
                    t = t.parentNode
                }
                return null
            }

            function e$(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function e0(e) {
                return function(e) {
                    if (Array.isArray(e)) return e$(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return e$(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return e$(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var e1 = ["debug", "info", "warn", "error", "log", "assert", "trace"],
                e2 = {};

            function e3(e) {
                if (!("console" in ek)) return e();
                var t = ek.console,
                    n = {},
                    r = Object.keys(e2);
                r.forEach(function(e) {
                    var r = e2[e];
                    n[e] = t[e], t[e] = r
                });
                try {
                    return e()
                } finally {
                    r.forEach(function(e) {
                        t[e] = n[e]
                    })
                }
            }

            function e5() {
                return e4().enabled
            }

            function e9(e) {
                for (var t = arguments.length, n = Array(t > 1 ? t - 1 : 0), r = 1; r < t; r++) n[r - 1] = arguments[r];
                eP && e5() && e3(function() {
                    var t;
                    (t = ek.console)[e].apply(t, ["".concat("Sentry Logger ", "[").concat(e, "]:")].concat(e0(n)))
                })
            }

            function e4() {
                return eP ? eR("loggerSettings", function() {
                    return {
                        enabled: !1
                    }
                }) : {
                    enabled: !1
                }
            }
            var e8 = {
                enable: function() {
                    e4().enabled = !0
                },
                disable: function() {
                    e4().enabled = !1
                },
                isEnabled: e5,
                log: function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    e9.apply(void 0, ["log"].concat(e0(t)))
                },
                warn: function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    e9.apply(void 0, ["warn"].concat(e0(t)))
                },
                error: function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    e9.apply(void 0, ["error"].concat(e0(t)))
                }
            };

            function e6(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function e7(e, t, n) {
                if (t in e) {
                    var r = e[t];
                    if ("function" == typeof r) {
                        var a = n(r);
                        "function" == typeof a && tt(a, r);
                        try {
                            e[t] = a
                        } catch (n) {
                            eP && e8.log('Failed to replace method "'.concat(t, '" in object'), e)
                        }
                    }
                }
            }

            function te(e, t, n) {
                try {
                    Object.defineProperty(e, t, {
                        value: n,
                        writable: !0,
                        configurable: !0
                    })
                } catch (n) {
                    eP && e8.log('Failed to add non-enumerable property "'.concat(t, '" to object'), e)
                }
            }

            function tt(e, t) {
                try {
                    var n = t.prototype || {};
                    e.prototype = t.prototype = n, te(e, "__sentry_original__", t)
                } catch (e) {}
            }

            function tn(e) {
                return e.__sentry_original__
            }

            function tr(e) {
                if (eC(e)) return e6({
                    message: e.message,
                    name: e.name,
                    stack: e.stack
                }, to(e));
                if (!eG(e)) return e;
                var t = e6({
                    type: e.type,
                    target: ta(e.target),
                    currentTarget: ta(e.currentTarget)
                }, to(e));
                return "undefined" != typeof CustomEvent && eM(e, CustomEvent) && (t.detail = e.detail), t
            }

            function ta(e) {
                try {
                    return "undefined" != typeof Element && eM(e, Element) ? eH(e) : Object.prototype.toString.call(e)
                } catch (e) {
                    return "<unknown>"
                }
            }

            function to(e) {
                if ((void 0 === e ? "undefined" : e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) != "object" || null === e) return {};
                var t = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && (t[n] = e[n]);
                return t
            }

            function ti(e) {
                if (void 0 !== Z) return Z ? Z(e) : e();
                var t = Symbol.for("__SENTRY_SAFE_RANDOM_ID_WRAPPER__");
                return t in ek && "function" == typeof ek[t] ? (Z = ek[t])(e) : (Z = null, e())
            }

            function tu() {
                return ti(function() {
                    return Math.random()
                })
            }

            function tc() {
                return ti(function() {
                    return Date.now()
                })
            }

            function tl(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function ts() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : ek.crypto || ek.msCrypto;
                try {
                    if (null == e ? void 0 : e.randomUUID) return ti(function() {
                        return e.randomUUID()
                    }).replace(/-/g, "")
                } catch (e) {}
                return C || (C = "10000000100040008000100000000000"), C.replace(/[018]/g, function(e) {
                    return (e ^ (15 & 16 * tu()) >> e / 4).toString(16)
                })
            }

            function tf(e) {
                var t, n;
                return null == (n = e.exception) || null == (t = n.values) ? void 0 : t[0]
            }

            function td(e) {
                var t = e.message,
                    n = e.event_id;
                if (t) return t;
                var r = tf(e);
                return r ? r.type && r.value ? "".concat(r.type, ": ").concat(r.value) : r.type || r.value || n || "<unknown>" : n || "<unknown>"
            }

            function tp(e, t, n) {
                var r = e.exception = e.exception || {},
                    a = r.values = r.values || [],
                    o = a[0] = a[0] || {};
                o.value || (o.value = t || ""), o.type || (o.type = n || "Error")
            }

            function tm(e, t) {
                var n = tf(e);
                if (n) {
                    var r = n.mechanism;
                    if (n.mechanism = tl({}, {
                            type: "generic",
                            handled: !0
                        }, r, t), t && "data" in t) {
                        var a = tl({}, null == r ? void 0 : r.data, t.data);
                        n.mechanism.data = a
                    }
                }
            }

            function ty(e) {
                if (function(e) {
                        try {
                            return e.__sentry_captured__
                        } catch (e) {}
                    }(e)) return !0;
                try {
                    te(e, "__sentry_captured__", !0)
                } catch (e) {}
                return !1
            }

            function tv() {
                return tc() / 1e3
            }

            function tb() {
                return (null != D ? D : D = function() {
                    var e = ek.performance;
                    if (!(null == e ? void 0 : e.now) || !e.timeOrigin) return tv;
                    var t = e.timeOrigin;
                    return function() {
                        return (t + ti(function() {
                            return e.now()
                        })) / 1e3
                    }
                }())()
            }
            var th = null;

            function tg() {
                return null === th && (th = function() {
                    var e, t = ek.performance;
                    if (null == t ? void 0 : t.now) {
                        var n = ti(function() {
                                return t.now()
                            }),
                            r = tc(),
                            a = t.timeOrigin;
                        if ("number" == typeof a && 3e5 > Math.abs(a + n - r)) return a;
                        var o = null == (e = t.timing) ? void 0 : e.navigationStart;
                        return "number" == typeof o && 3e5 > Math.abs(o + n - r) ? o : r - n
                    }
                }()), th
            }

            function tS(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                if (t.user && (!e.ipAddress && t.user.ip_address && (e.ipAddress = t.user.ip_address), e.did || t.did || (e.did = t.user.id || t.user.email || t.user.username)), e.timestamp = t.timestamp || tb(), t.abnormal_mechanism && (e.abnormal_mechanism = t.abnormal_mechanism), t.ignoreDuration && (e.ignoreDuration = t.ignoreDuration), t.sid && (e.sid = 32 === t.sid.length ? t.sid : ts()), void 0 !== t.init && (e.init = t.init), !e.did && t.did && (e.did = "".concat(t.did)), "number" == typeof t.started && (e.started = t.started), e.ignoreDuration) e.duration = void 0;
                else if ("number" == typeof t.duration) e.duration = t.duration;
                else {
                    var n = e.timestamp - e.started;
                    e.duration = n >= 0 ? n : 0
                }
                t.release && (e.release = t.release), t.environment && (e.environment = t.environment), !e.ipAddress && t.ipAddress && (e.ipAddress = t.ipAddress), !e.userAgent && t.userAgent && (e.userAgent = t.userAgent), "number" == typeof t.errors && (e.errors = t.errors), t.status && (e.status = t.status)
            }

            function t_(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 2;
                if (!t || (void 0 === t ? "undefined" : t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) != "object" || n <= 0) return t;
                if (e && 0 === Object.keys(t).length) return e;
                var r = function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = null != arguments[t] ? arguments[t] : {},
                            r = Object.keys(n);
                        "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                            return Object.getOwnPropertyDescriptor(n, e).enumerable
                        }))), r.forEach(function(t) {
                            var r;
                            r = n[t], t in e ? Object.defineProperty(e, t, {
                                value: r,
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : e[t] = r
                        })
                    }
                    return e
                }({}, e);
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (r[a] = t_(r[a], t[a], n - 1));
                return r
            }

            function tE() {
                return ts().substring(16)
            }
            var tO = "_sentrySpan";

            function tw(e, t) {
                t ? te(e, tO, t) : delete e[tO]
            }

            function tI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function tA(e) {
                return function(e) {
                    if (Array.isArray(e)) return tI(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tI(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return tI(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tT = /\(error: (.*)\)/,
                tN = /captureMessage|captureException/;

            function tk() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                var r = t.sort(function(e, t) {
                    return e[0] - t[0]
                }).map(function(e) {
                    return e[1]
                });
                return function(e) {
                    for (var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0, n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 0, a = [], o = e.split("\n"), i = t; i < o.length; i++) {
                        var u = o[i];
                        u.length > 1024 && (u = u.slice(0, 1024));
                        var c = tT.test(u) ? u.replace(tT, "$1") : u;
                        if (!c.match(/\S*Error: /)) {
                            var l = !0,
                                s = !1,
                                f = void 0;
                            try {
                                for (var d, p = r[Symbol.iterator](); !(l = (d = p.next()).done); l = !0) {
                                    var m = (0, d.value)(c);
                                    if (m) {
                                        a.push(m);
                                        break
                                    }
                                }
                            } catch (e) {
                                s = !0, f = e
                            } finally {
                                try {
                                    l || null == p.return || p.return()
                                } finally {
                                    if (s) throw f
                                }
                            }
                            if (a.length >= 50 + n) break
                        }
                    }
                    var y = a.slice(n);
                    if (!y.length) return [];
                    var v = Array.from(y);
                    return /sentryWrapped/.test(tj(v).function || "") && v.pop(), v.reverse(), tN.test(tj(v).function || "") && (v.pop(), tN.test(tj(v).function || "") && v.pop()), v.slice(0, 50).map(function(e) {
                        var t, n;
                        return t = function(e) {
                            for (var t = 1; t < arguments.length; t++) {
                                var n = null != arguments[t] ? arguments[t] : {},
                                    r = Object.keys(n);
                                "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                    return Object.getOwnPropertyDescriptor(n, e).enumerable
                                }))), r.forEach(function(t) {
                                    var r;
                                    r = n[t], t in e ? Object.defineProperty(e, t, {
                                        value: r,
                                        enumerable: !0,
                                        configurable: !0,
                                        writable: !0
                                    }) : e[t] = r
                                })
                            }
                            return e
                        }({}, e), n = n = {
                            filename: e.filename || tj(v).filename,
                            function: e.function || "?"
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(e, t) {
                            var n = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                n.push.apply(n, r)
                            }
                            return n
                        })(Object(n)).forEach(function(e) {
                            Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(n, e))
                        }), t
                    })
                }
            }

            function tj(e) {
                return e[e.length - 1] || {}
            }
            var tx = "<anonymous>";

            function tR(e) {
                try {
                    if (!e || "function" != typeof e) return tx;
                    return e.name || tx
                } catch (e) {
                    return tx
                }
            }

            function tP(e) {
                var t = e.exception;
                if (t) {
                    var n = [];
                    try {
                        return t.values.forEach(function(e) {
                            e.stacktrace.frames && n.push.apply(n, tA(e.stacktrace.frames))
                        }), n
                    } catch (e) {}
                }
            }

            function tV(e) {
                return "__v_isVNode" in e && e.__v_isVNode ? "[VueVNode]" : "[VueViewModel]"
            }

            function tZ(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
                return "string" != typeof e || 0 === t || e.length <= t ? e : "".concat(e.slice(0, t), "...")
            }

            function tC(e, t) {
                if (!Array.isArray(e)) return "";
                for (var n = [], r = 0; r < e.length; r++) {
                    var a = e[r];
                    try {
                        eJ(a) ? n.push(tV(a)) : n.push(String(a))
                    } catch (e) {
                        n.push("[value cannot be serialized]")
                    }
                }
                return n.join(t)
            }

            function tD(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
                return !!eX(e) && (eD(t, "RegExp") ? t.test(e) : !!eX(t) && (n ? e === t : e.includes(t)))
            }

            function tF(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
                return t.some(function(t) {
                    return tD(e, t, n)
                })
            }

            function tL(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function tX(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function tY(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        tX(e, t, n[t])
                    })
                }
                return e
            }

            function tW(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function tB(e) {
                return function(e) {
                    if (Array.isArray(e)) return tL(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tL(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return tL(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tG = function() {
                    var e;

                    function t() {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        this._notifyingListeners = !1, this._scopeListeners = [], this._eventProcessors = [], this._breadcrumbs = [], this._attachments = [], this._user = {}, this._tags = {}, this._attributes = {}, this._extra = {}, this._contexts = {}, this._sdkProcessingMetadata = {}, this._propagationContext = {
                            traceId: ts(),
                            sampleRand: tu()
                        }
                    }
                    return e = [{
                            key: "clone",
                            value: function() {
                                var e = new t;
                                return e._breadcrumbs = tB(this._breadcrumbs), e._tags = tY({}, this._tags), e._attributes = tY({}, this._attributes), e._extra = tY({}, this._extra), e._contexts = tY({}, this._contexts), this._contexts.flags && (e._contexts.flags = {
                                    values: tB(this._contexts.flags.values)
                                }), e._user = this._user, e._level = this._level, e._session = this._session, e._transactionName = this._transactionName, e._fingerprint = this._fingerprint, e._eventProcessors = tB(this._eventProcessors), e._attachments = tB(this._attachments), e._sdkProcessingMetadata = tY({}, this._sdkProcessingMetadata), e._propagationContext = tY({}, this._propagationContext), e._client = this._client, e._lastEventId = this._lastEventId, e._conversationId = this._conversationId, tw(e, this[tO]), e
                            }
                        }, {
                            key: "setClient",
                            value: function(e) {
                                this._client = e
                            }
                        }, {
                            key: "setLastEventId",
                            value: function(e) {
                                this._lastEventId = e
                            }
                        }, {
                            key: "getClient",
                            value: function() {
                                return this._client
                            }
                        }, {
                            key: "lastEventId",
                            value: function() {
                                return this._lastEventId
                            }
                        }, {
                            key: "addScopeListener",
                            value: function(e) {
                                this._scopeListeners.push(e)
                            }
                        }, {
                            key: "addEventProcessor",
                            value: function(e) {
                                return this._eventProcessors.push(e), this
                            }
                        }, {
                            key: "setUser",
                            value: function(e) {
                                return this._user = e || {
                                    email: void 0,
                                    id: void 0,
                                    ip_address: void 0,
                                    username: void 0
                                }, this._session && tS(this._session, {
                                    user: e
                                }), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "getUser",
                            value: function() {
                                return this._user
                            }
                        }, {
                            key: "setConversationId",
                            value: function(e) {
                                return this._conversationId = e || void 0, this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setTags",
                            value: function(e) {
                                return this._tags = tY({}, this._tags, e), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setTag",
                            value: function(e, t) {
                                return this.setTags(tX({}, e, t))
                            }
                        }, {
                            key: "setAttributes",
                            value: function(e) {
                                return this._attributes = tY({}, this._attributes, e), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setAttribute",
                            value: function(e, t) {
                                return this.setAttributes(tX({}, e, t))
                            }
                        }, {
                            key: "removeAttribute",
                            value: function(e) {
                                return e in this._attributes && (delete this._attributes[e], this._notifyScopeListeners()), this
                            }
                        }, {
                            key: "setExtras",
                            value: function(e) {
                                return this._extra = tY({}, this._extra, e), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setExtra",
                            value: function(e, t) {
                                return this._extra = tW(tY({}, this._extra), tX({}, e, t)), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setFingerprint",
                            value: function(e) {
                                return this._fingerprint = e, this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setLevel",
                            value: function(e) {
                                return this._level = e, this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setTransactionName",
                            value: function(e) {
                                return this._transactionName = e, this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setContext",
                            value: function(e, t) {
                                return null === t ? delete this._contexts[e] : this._contexts[e] = t, this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setSession",
                            value: function(e) {
                                return e ? this._session = e : delete this._session, this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "getSession",
                            value: function() {
                                return this._session
                            }
                        }, {
                            key: "update",
                            value: function(e) {
                                if (!e) return this;
                                var n = "function" == typeof e ? e(this) : e,
                                    r = ((null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](n) : n instanceof t) ? n.getScopeData() : eB(n) ? e : void 0) || {},
                                    a = r.tags,
                                    o = r.attributes,
                                    i = r.extra,
                                    u = r.user,
                                    c = r.contexts,
                                    l = r.level,
                                    s = r.fingerprint,
                                    f = void 0 === s ? [] : s,
                                    d = r.propagationContext,
                                    p = r.conversationId;
                                return this._tags = tY({}, this._tags, a), this._attributes = tY({}, this._attributes, o), this._extra = tY({}, this._extra, i), this._contexts = tY({}, this._contexts, c), u && Object.keys(u).length && (this._user = u), l && (this._level = l), f.length && (this._fingerprint = f), d && (this._propagationContext = d), p && (this._conversationId = p), this
                            }
                        }, {
                            key: "clear",
                            value: function() {
                                return this._breadcrumbs = [], this._tags = {}, this._attributes = {}, this._extra = {}, this._user = {}, this._contexts = {}, this._level = void 0, this._transactionName = void 0, this._fingerprint = void 0, this._session = void 0, this._conversationId = void 0, tw(this, void 0), this._attachments = [], this.setPropagationContext({
                                    traceId: ts(),
                                    sampleRand: tu()
                                }), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "addBreadcrumb",
                            value: function(e, t) {
                                var n, r = "number" == typeof t ? t : 100;
                                if (r <= 0) return this;
                                var a = tW(tY({
                                    timestamp: tv()
                                }, e), {
                                    message: e.message ? tZ(e.message, 2048) : e.message
                                });
                                return this._breadcrumbs.push(a), this._breadcrumbs.length > r && (this._breadcrumbs = this._breadcrumbs.slice(-r), null == (n = this._client) || n.recordDroppedEvent("buffer_overflow", "log_item")), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "getLastBreadcrumb",
                            value: function() {
                                return this._breadcrumbs[this._breadcrumbs.length - 1]
                            }
                        }, {
                            key: "clearBreadcrumbs",
                            value: function() {
                                return this._breadcrumbs = [], this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "addAttachment",
                            value: function(e) {
                                return this._attachments.push(e), this
                            }
                        }, {
                            key: "clearAttachments",
                            value: function() {
                                return this._attachments = [], this
                            }
                        }, {
                            key: "getScopeData",
                            value: function() {
                                return {
                                    breadcrumbs: this._breadcrumbs,
                                    attachments: this._attachments,
                                    contexts: this._contexts,
                                    tags: this._tags,
                                    attributes: this._attributes,
                                    extra: this._extra,
                                    user: this._user,
                                    level: this._level,
                                    fingerprint: this._fingerprint || [],
                                    eventProcessors: this._eventProcessors,
                                    propagationContext: this._propagationContext,
                                    sdkProcessingMetadata: this._sdkProcessingMetadata,
                                    transactionName: this._transactionName,
                                    span: this[tO],
                                    conversationId: this._conversationId
                                }
                            }
                        }, {
                            key: "setSDKProcessingMetadata",
                            value: function(e) {
                                return this._sdkProcessingMetadata = t_(this._sdkProcessingMetadata, e, 2), this
                            }
                        }, {
                            key: "setPropagationContext",
                            value: function(e) {
                                return this._propagationContext = e, this
                            }
                        }, {
                            key: "getPropagationContext",
                            value: function() {
                                return this._propagationContext
                            }
                        }, {
                            key: "captureException",
                            value: function(e, t) {
                                var n = (null == t ? void 0 : t.event_id) || ts();
                                if (!this._client) return eP && e8.warn("No client configured on scope - will not capture exception!"), n;
                                var r = Error("Sentry syntheticException");
                                return this._client.captureException(e, tW(tY({
                                    originalException: e,
                                    syntheticException: r
                                }, t), {
                                    event_id: n
                                }), this), n
                            }
                        }, {
                            key: "captureMessage",
                            value: function(e, t, n) {
                                var r, a = (null == n ? void 0 : n.event_id) || ts();
                                if (!this._client) return eP && e8.warn("No client configured on scope - will not capture message!"), a;
                                var o = null != (r = null == n ? void 0 : n.syntheticException) ? r : Error(e);
                                return this._client.captureMessage(e, t, tW(tY({
                                    originalException: e,
                                    syntheticException: o
                                }, n), {
                                    event_id: a
                                }), this), a
                            }
                        }, {
                            key: "captureEvent",
                            value: function(e, t) {
                                var n = (null == t ? void 0 : t.event_id) || ts();
                                return this._client ? this._client.captureEvent(e, tW(tY({}, t), {
                                    event_id: n
                                }), this) : eP && e8.warn("No client configured on scope - will not capture event!"), n
                            }
                        }, {
                            key: "_notifyScopeListeners",
                            value: function() {
                                var e = this;
                                this._notifyingListeners || (this._notifyingListeners = !0, this._scopeListeners.forEach(function(t) {
                                    t(e)
                                }), this._notifyingListeners = !1)
                            }
                        }],
                        function(e, t) {
                            for (var n = 0; n < t.length; n++) {
                                var r = t[n];
                                r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                            }
                        }(t.prototype, e), t
                }(),
                tU = function() {
                    var e;

                    function t(e, n) {
                        var r, a;
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        r = e || new tG, a = n || new tG, this._stack = [{
                            scope: r
                        }], this._isolationScope = a
                    }
                    return e = [{
                            key: "withScope",
                            value: function(e) {
                                var t, n = this,
                                    r = this._pushScope();
                                try {
                                    t = e(r)
                                } catch (e) {
                                    throw this._popScope(), e
                                }
                                return eU(t) ? t.then(function(e) {
                                    return n._popScope(), e
                                }, function(e) {
                                    throw n._popScope(), e
                                }) : (this._popScope(), t)
                            }
                        }, {
                            key: "getClient",
                            value: function() {
                                return this.getStackTop().client
                            }
                        }, {
                            key: "getScope",
                            value: function() {
                                return this.getStackTop().scope
                            }
                        }, {
                            key: "getIsolationScope",
                            value: function() {
                                return this._isolationScope
                            }
                        }, {
                            key: "getStackTop",
                            value: function() {
                                return this._stack[this._stack.length - 1]
                            }
                        }, {
                            key: "_pushScope",
                            value: function() {
                                var e = this.getScope().clone();
                                return this._stack.push({
                                    client: this.getClient(),
                                    scope: e
                                }), e
                            }
                        }, {
                            key: "_popScope",
                            value: function() {
                                return !(this._stack.length <= 1) && !!this._stack.pop()
                            }
                        }],
                        function(e, t) {
                            for (var n = 0; n < t.length; n++) {
                                var r = t[n];
                                r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                            }
                        }(t.prototype, e), t
                }();

            function tM() {
                var e = ex(ej());
                return e.stack = e.stack || new tU(eR("defaultCurrentScope", function() {
                    return new tG
                }), eR("defaultIsolationScope", function() {
                    return new tG
                }))
            }

            function tJ(e) {
                return tM().withScope(e)
            }

            function tK(e, t) {
                var n = tM();
                return n.withScope(function() {
                    return n.getStackTop().scope = e, t(e)
                })
            }

            function tz(e) {
                return tM().withScope(function() {
                    return e(tM().getIsolationScope())
                })
            }

            function tH(e) {
                var t = ex(e);
                return t.acs ? t.acs : {
                    withIsolationScope: tz,
                    withScope: tJ,
                    withSetScope: tK,
                    withSetIsolationScope: function(e, t) {
                        return tz(t)
                    },
                    getCurrentScope: function() {
                        return tM().getScope()
                    },
                    getIsolationScope: function() {
                        return tM().getIsolationScope()
                    }
                }
            }

            function tQ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function tq() {
                return tH(ej()).getCurrentScope()
            }

            function t$() {
                return tH(ej()).getIsolationScope()
            }

            function t0() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                var r = tH(ej());
                if (2 === t.length) {
                    var a = function(e) {
                            if (Array.isArray(e)) return e
                        }(t) || function(e, t) {
                            var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != a) {
                                var o = [],
                                    i = !0,
                                    u = !1;
                                try {
                                    for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                                } catch (e) {
                                    u = !0, r = e
                                } finally {
                                    try {
                                        i || null == a.return || a.return()
                                    } finally {
                                        if (u) throw r
                                    }
                                }
                                return o
                            }
                        }(t, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return tQ(e, 2);
                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return tQ(e, t)
                            }
                        }(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        o = a[0],
                        i = a[1];
                    return o ? r.withSetScope(o, i) : r.withScope(i)
                }
                return r.withScope(t[0])
            }

            function t1() {
                return tq().getClient()
            }
            var t2 = "sentry.source",
                t3 = "sentry.sample_rate",
                t5 = "sentry.previous_trace_sample_rate",
                t9 = "sentry.op",
                t4 = "sentry.origin",
                t8 = "sentry.idle_span_finish_reason",
                t6 = "sentry.measurement_unit",
                t7 = "sentry.measurement_value",
                ne = "sentry.custom_span_name",
                nt = "sentry.profile_id",
                nn = "sentry.exclusive_time";

            function nr(e) {
                if ("boolean" == typeof __SENTRY_TRACING__ && !__SENTRY_TRACING__) return !1;
                var t, n = e || (null == (t = t1()) ? void 0 : t.getOptions());
                return !!n && (null != n.tracesSampleRate || !!n.tracesSampler)
            }

            function na(e) {
                if ("boolean" == typeof e) return Number(e);
                var t = "string" == typeof e ? parseFloat(e) : e;
                if (!("number" != typeof t || isNaN(t)) && !(t < 0) && !(t > 1)) return t
            }

            function no(e, t) {
                e.setAttribute("http.response.status_code", t);
                var n = function(e) {
                    if (e < 400 && e >= 100) return {
                        code: 1
                    };
                    if (e >= 400 && e < 500) switch (e) {
                        case 401:
                            return {
                                code: 2, message: "unauthenticated"
                            };
                        case 403:
                            return {
                                code: 2, message: "permission_denied"
                            };
                        case 404:
                            return {
                                code: 2, message: "not_found"
                            };
                        case 409:
                            return {
                                code: 2, message: "already_exists"
                            };
                        case 413:
                            return {
                                code: 2, message: "failed_precondition"
                            };
                        case 429:
                            return {
                                code: 2, message: "resource_exhausted"
                            };
                        case 499:
                            return {
                                code: 2, message: "cancelled"
                            };
                        default:
                            return {
                                code: 2, message: "invalid_argument"
                            }
                    }
                    if (e >= 500 && e < 600) switch (e) {
                        case 501:
                            return {
                                code: 2, message: "unimplemented"
                            };
                        case 503:
                            return {
                                code: 2, message: "unavailable"
                            };
                        case 504:
                            return {
                                code: 2, message: "deadline_exceeded"
                            }
                    }
                    return {
                        code: 2,
                        message: "internal_error"
                    }
                }(t);
                "unknown_error" !== n.message && e.setStatus(n)
            }
            var ni = "_sentryScope",
                nu = "_sentryIsolationScope";

            function nc(e) {
                return {
                    scope: e[ni],
                    isolationScope: function(e) {
                        if (e) {
                            if ((void 0 === e ? "undefined" : e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) == "object" && "deref" in e && "function" == typeof e.deref) try {
                                return e.deref()
                            } catch (e) {
                                return
                            }
                            return e
                        }
                    }(e[nu])
                }
            }

            function nl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ns(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return nl(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return nl(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var nf = "sentry-",
                nd = /^sentry-/;

            function np(e) {
                var t = function(e) {
                    if (e && (eX(e) || Array.isArray(e))) return Array.isArray(e) ? e.reduce(function(e, t) {
                        return Object.entries(nm(t)).forEach(function(t) {
                            var n = ns(t, 2),
                                r = n[0],
                                a = n[1];
                            e[r] = a
                        }), e
                    }, {}) : nm(e)
                }(e);
                if (t) {
                    var n = Object.entries(t).reduce(function(e, t) {
                        var n = ns(t, 2),
                            r = n[0],
                            a = n[1];
                        return r.match(nd) && (e[r.slice(nf.length)] = a), e
                    }, {});
                    return Object.keys(n).length > 0 ? n : void 0
                }
            }

            function nm(e) {
                return e.split(",").map(function(e) {
                    var t = e.indexOf("=");
                    return -1 === t ? [] : [e.slice(0, t), e.slice(t + 1)].map(function(e) {
                        try {
                            return decodeURIComponent(e.trim())
                        } catch (e) {
                            return
                        }
                    })
                }).reduce(function(e, t) {
                    var n = ns(t, 2),
                        r = n[0],
                        a = n[1];
                    return r && a && (e[r] = a), e
                }, {})
            }
            var ny = RegExp("^[ \\t]*([0-9a-f]{32})?-?([0-9a-f]{16})?-?([01])?[ \\t]*$");

            function nv() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : ts(),
                    t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : tE(),
                    n = arguments.length > 2 ? arguments[2] : void 0,
                    r = "";
                return void 0 !== n && (r = n ? "-1" : "-0"), "".concat(e, "-").concat(t).concat(r)
            }

            function nb() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : ts(),
                    t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : tE(),
                    n = arguments.length > 2 ? arguments[2] : void 0;
                return "00-".concat(e, "-").concat(t, "-").concat(n ? "01" : "00")
            }
            var nh = !1;

            function ng(e) {
                return e && e.length > 0 ? e.map(function(e) {
                    var t = e.context;
                    return function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({
                        span_id: t.spanId,
                        trace_id: t.traceId,
                        sampled: 1 === t.traceFlags,
                        attributes: e.attributes
                    }, function(e, t) {
                        if (null == e) return {};
                        var n, r, a = function(e, t) {
                            if (null == e) return {};
                            var n, r, a = {},
                                o = Object.keys(e);
                            for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                            return a
                        }(e, t);
                        if (Object.getOwnPropertySymbols) {
                            var o = Object.getOwnPropertySymbols(e);
                            for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                        }
                        return a
                    }(e.context, ["spanId", "traceId", "traceFlags"]))
                }) : void 0
            }

            function nS(e) {
                var t;
                return "number" == typeof e ? n_(e) : Array.isArray(e) ? e[0] + e[1] / 1e9 : (null != (t = Date) && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t) ? n_(e.getTime()) : tb()
            }

            function n_(e) {
                return e > 0x2540be3ff ? e / 1e3 : e
            }

            function nE(e) {
                if ("function" == typeof e.getSpanJSON) return e.getSpanJSON();
                var t = e.spanContext(),
                    n = t.spanId,
                    r = t.traceId;
                if ((a = e).attributes && a.startTime && a.name && a.endTime && a.status) {
                    var a, o, i = e.attributes,
                        u = e.startTime,
                        c = e.name,
                        l = e.endTime,
                        s = e.status,
                        f = e.links;
                    return {
                        span_id: n,
                        trace_id: r,
                        data: i,
                        description: c,
                        parent_span_id: "parentSpanId" in e ? e.parentSpanId : "parentSpanContext" in e ? null == (o = e.parentSpanContext) ? void 0 : o.spanId : void 0,
                        start_timestamp: nS(u),
                        timestamp: nS(l) || void 0,
                        status: nw(s),
                        op: i[t9],
                        origin: i[t4],
                        links: ng(f)
                    }
                }
                return {
                    span_id: n,
                    trace_id: r,
                    start_timestamp: 0,
                    data: {}
                }
            }

            function nO(e) {
                return 1 === e.spanContext().traceFlags
            }

            function nw(e) {
                if (e && 0 !== e.code) return 1 === e.code ? "ok" : e.message || "internal_error"
            }
            var nI = "_sentryChildSpans",
                nA = "_sentryRootSpan";

            function nT(e, t) {
                var n = e[nA] || e;
                te(t, nA, n), e[nI] ? e[nI].add(t) : te(e, nI, new Set([t]))
            }

            function nN(e) {
                var t = new Set;
                return ! function e(n) {
                    if (!t.has(n) && nO(n)) {
                        t.add(n);
                        var r = n[nI] ? Array.from(n[nI]) : [],
                            a = !0,
                            o = !1,
                            i = void 0;
                        try {
                            for (var u, c = r[Symbol.iterator](); !(a = (u = c.next()).done); a = !0) {
                                var l = u.value;
                                e(l)
                            }
                        } catch (e) {
                            o = !0, i = e
                        } finally {
                            try {
                                a || null == c.return || c.return()
                            } finally {
                                if (o) throw i
                            }
                        }
                    }
                }(e), Array.from(t)
            }

            function nk(e) {
                return e[nA] || e
            }

            function nj() {
                var e = tH(ej());
                return e.getActiveSpan ? e.getActiveSpan() : tq()[tO]
            }

            function nx() {
                nh || (e3(function() {
                    console.warn("[Sentry] Returning null from `beforeSendSpan` is disallowed. To drop certain spans, configure the respective integrations directly or use `ignoreSpans`.")
                }), nh = !0)
            }
            var nR = "production";

            function nP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var nV = /^o(\d+)\./,
                nZ = /^(?:(\w+):)\/\/(?:(\w+)(?::(\w+)?)?@)((?:\[[:.%\w]+\]|[\w.-]+))(?::(\d+))?\/(.+)/;

            function nC(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                    n = e.host,
                    r = e.path,
                    a = e.pass,
                    o = e.port,
                    i = e.projectId,
                    u = e.protocol,
                    c = e.publicKey;
                return "".concat(u, "://").concat(c).concat(t && a ? ":".concat(a) : "") + "@".concat(n).concat(o ? ":".concat(o) : "", "/").concat(r ? "".concat(r, "/") : r).concat(i)
            }

            function nD(e) {
                return {
                    protocol: e.protocol,
                    publicKey: e.publicKey || "",
                    pass: e.pass || "",
                    host: e.host,
                    port: e.port || "",
                    path: e.path || "",
                    projectId: e.projectId
                }
            }
            var nF = "_frozenDsc";

            function nL(e, t) {
                var n, r, a, o, i, u = t.getOptions(),
                    c = (t.getDsn() || {}).publicKey,
                    l = {
                        environment: u.environment || nR,
                        release: u.release,
                        public_key: c,
                        trace_id: e,
                        org_id: (o = (n = t).getOptions(), i = (n.getDsn() || {}).host, o.orgId ? a = String(o.orgId) : i && (a = null == (r = i.match(nV)) ? void 0 : r[1]), a)
                    };
                return t.emit("createDsc", l), l
            }

            function nX(e, t) {
                var n = t.getPropagationContext();
                return n.dsc || nL(n.traceId, e)
            }

            function nY(e) {
                var t, n, r, a, o = t1();
                if (!o) return {};
                var i = nk(e),
                    u = nE(i),
                    c = u.data,
                    l = i.spanContext().traceState,
                    s = null != (n = null != (t = null == l ? void 0 : l.get("sentry.sample_rate")) ? t : c[t3]) ? n : c[t5];

                function f(e) {
                    return ("number" == typeof s || "string" == typeof s) && (e.sample_rate = "".concat(s)), e
                }
                var d = i[nF];
                if (d) return f(d);
                var p = null == l ? void 0 : l.get("sentry.dsc"),
                    m = p && np(p);
                if (m) return f(m);
                var y = nL(e.spanContext().traceId, o),
                    v = c[t2],
                    b = u.description;
                return "url" !== v && b && (y.transaction = b), nr() && (y.sampled = String(nO(i)), y.sample_rand = null != (a = null == l ? void 0 : l.get("sentry.sample_rand")) ? a : null == (r = nc(i).scope) ? void 0 : r.getPropagationContext().sampleRand.toString()), f(y), o.emit("createDsc", y, i), y
            }
            var nW = function() {
                var e;

                function t() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                    if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                    this._traceId = e.traceId || ts(), this._spanId = e.spanId || tE()
                }
                return e = [{
                        key: "spanContext",
                        value: function() {
                            return {
                                spanId: this._spanId,
                                traceId: this._traceId,
                                traceFlags: 0
                            }
                        }
                    }, {
                        key: "end",
                        value: function(e) {}
                    }, {
                        key: "setAttribute",
                        value: function(e, t) {
                            return this
                        }
                    }, {
                        key: "setAttributes",
                        value: function(e) {
                            return this
                        }
                    }, {
                        key: "setStatus",
                        value: function(e) {
                            return this
                        }
                    }, {
                        key: "updateName",
                        value: function(e) {
                            return this
                        }
                    }, {
                        key: "isRecording",
                        value: function() {
                            return !1
                        }
                    }, {
                        key: "addEvent",
                        value: function(e, t, n) {
                            return this
                        }
                    }, {
                        key: "addLink",
                        value: function(e) {
                            return this
                        }
                    }, {
                        key: "addLinks",
                        value: function(e) {
                            return this
                        }
                    }, {
                        key: "recordException",
                        value: function(e, t) {}
                    }],
                    function(e, t) {
                        for (var n = 0; n < t.length; n++) {
                            var r = t[n];
                            r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                        }
                    }(t.prototype, e), t
            }();

            function nB(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function nG(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function nU(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 100,
                    r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : Infinity;
                try {
                    return function e(t, r) {
                        var a, o = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : Infinity,
                            i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : Infinity,
                            u = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : (a = new WeakSet, [function(e) {
                                return !!a.has(e) || (a.add(e), !1)
                            }, function(e) {
                                a.delete(e)
                            }]),
                            c = function(e) {
                                if (Array.isArray(e)) return e
                            }(u) || function(e, t) {
                                var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != a) {
                                    var o = [],
                                        i = !0,
                                        u = !1;
                                    try {
                                        for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                                    } catch (e) {
                                        u = !0, r = e
                                    } finally {
                                        try {
                                            i || null == a.return || a.return()
                                        } finally {
                                            if (u) throw r
                                        }
                                    }
                                    return o
                                }
                            }(u, 2) || function(e, t) {
                                if (e) {
                                    if ("string" == typeof e) return nB(e, 2);
                                    var n = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return nB(e, t)
                                }
                            }(u, 2) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            l = c[0],
                            s = c[1];
                        if (null == r || ["boolean", "string"].includes(void 0 === r ? "undefined" : nG(r)) || "number" == typeof r && Number.isFinite(r)) return r;
                        var f = function(e, t) {
                            try {
                                if ("domain" === e && t && (void 0 === t ? "undefined" : nG(t)) === "object" && t._events) return "[Domain]";
                                if ("domainEmitter" === e) return "[DomainEmitter]";
                                if (void 0 !== n.g && t === n.g) return "[Global]";
                                if ("undefined" != typeof window && t === window) return "[Window]";
                                if ("undefined" != typeof document && t === document) return "[Document]";
                                if (eJ(t)) return tV(t);
                                if (eB(t) && "nativeEvent" in t && "preventDefault" in t && "stopPropagation" in t) return "[SyntheticEvent]";
                                if ("number" == typeof t && !Number.isFinite(t)) return "[".concat(t, "]");
                                if ("function" == typeof t) return "[Function: ".concat(tR(t), "]");
                                if ((void 0 === t ? "undefined" : nG(t)) === "symbol") return "[".concat(String(t), "]");
                                if ((void 0 === t ? "undefined" : nG(t)) === "bigint") return "[BigInt: ".concat(String(t), "]");
                                var r, a, o = (r = t, a = Object.getPrototypeOf(r), (null == a ? void 0 : a.constructor) ? a.constructor.name : "null prototype");
                                if (/^HTML(\w*)Element$/.test(o)) return "[HTMLElement: ".concat(o, "]");
                                return "[object ".concat(o, "]")
                            } catch (e) {
                                return "**non-serializable** (".concat(e, ")")
                            }
                        }(t, r);
                        if (!f.startsWith("[object ")) return f;
                        if (r.__sentry_skip_normalization__) return r;
                        var d = "number" == typeof r.__sentry_override_normalization_depth__ ? r.__sentry_override_normalization_depth__ : o;
                        if (0 === d) return f.replace("object ", "");
                        if (l(r)) return "[Circular ~]";
                        if (r && "function" == typeof r.toJSON) try {
                            var p = r.toJSON();
                            return e("", p, d - 1, i, u)
                        } catch (e) {}
                        var m = Array.isArray(r) ? [] : {},
                            y = 0,
                            v = tr(r);
                        for (var b in v)
                            if (Object.prototype.hasOwnProperty.call(v, b)) {
                                if (y >= i) {
                                    m[b] = "[MaxProperties ~]";
                                    break
                                }
                                var h = v[b];
                                m[b] = e(b, h, d - 1, i, u), y++
                            } return s(r), m
                    }("", e, t, r)
                } catch (e) {
                    return {
                        ERROR: "**non-serializable** (".concat(e, ")")
                    }
                }
            }

            function nM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function nJ(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || nK(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nK(e, t) {
                if (e) {
                    if ("string" == typeof e) return nM(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return nM(e, t)
                }
            }

            function nz(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [];
                return [e, t]
            }

            function nH(e, t) {
                var n = e[1],
                    r = !0,
                    a = !1,
                    o = void 0;
                try {
                    for (var i, u = n[Symbol.iterator](); !(r = (i = u.next()).done); r = !0) {
                        var c = i.value,
                            l = c[0].type;
                        if (t(c, l)) return !0
                    }
                } catch (e) {
                    a = !0, o = e
                } finally {
                    try {
                        r || null == u.return || u.return()
                    } finally {
                        if (a) throw o
                    }
                }
                return !1
            }

            function nQ(e, t) {
                return nH(e, function(e, n) {
                    return t.includes(n)
                })
            }

            function nq(e) {
                var t = ex(ek);
                return t.encodePolyfill ? t.encodePolyfill(e) : new TextEncoder().encode(e)
            }

            function n$(e) {
                var t = nJ(e, 2),
                    n = t[0],
                    r = t[1],
                    a = JSON.stringify(n);

                function o(e) {
                    "string" == typeof a ? a = "string" == typeof e ? a + e : [nq(a), e] : a.push("string" == typeof e ? nq(e) : e)
                }
                var i = !0,
                    u = !1,
                    c = void 0;
                try {
                    for (var l, s = r[Symbol.iterator](); !(i = (l = s.next()).done); i = !0) {
                        var f, d = l.value,
                            p = nJ(d, 2),
                            m = p[0],
                            y = p[1];
                        if (o("\n".concat(JSON.stringify(m), "\n")), "string" == typeof y || (f = Uint8Array, null != f && "undefined" != typeof Symbol && f[Symbol.hasInstance] ? !!f[Symbol.hasInstance](y) : y instanceof f)) o(y);
                        else {
                            var v = void 0;
                            try {
                                v = JSON.stringify(y)
                            } catch (e) {
                                v = JSON.stringify(nU(y))
                            }
                            o(v)
                        }
                    }
                } catch (e) {
                    u = !0, c = e
                } finally {
                    try {
                        i || null == s.return || s.return()
                    } finally {
                        if (u) throw c
                    }
                }
                return "string" == typeof a ? a : function(e) {
                    var t = new Uint8Array(e.reduce(function(e, t) {
                            return e + t.length
                        }, 0)),
                        n = 0,
                        r = !0,
                        a = !1,
                        o = void 0;
                    try {
                        for (var i, u = e[Symbol.iterator](); !(r = (i = u.next()).done); r = !0) {
                            var c = i.value;
                            t.set(c, n), n += c.length
                        }
                    } catch (e) {
                        a = !0, o = e
                    } finally {
                        try {
                            r || null == u.return || u.return()
                        } finally {
                            if (a) throw o
                        }
                    }
                    return t
                }(a)
            }
            var n0 = {
                session: "session",
                sessions: "session",
                attachment: "attachment",
                transaction: "transaction",
                event: "error",
                client_report: "internal",
                user_report: "default",
                profile: "profile",
                profile_chunk: "profile",
                replay_event: "replay",
                replay_recording: "replay",
                check_in: "monitor",
                feedback: "feedback",
                span: "span",
                raw_security: "security",
                log: "log_item",
                metric: "metric",
                trace_metric: "metric"
            };

            function n1(e) {
                if (null == e ? void 0 : e.sdk) {
                    var t = e.sdk;
                    return {
                        name: t.name,
                        version: t.version
                    }
                }
            }

            function n2(e) {
                e8.log("Ignoring span ".concat(e.op, " - ").concat(e.description, " because it matches `ignoreSpans`."))
            }

            function n3(e, t) {
                if (!(null == t ? void 0 : t.length) || !e.description) return !1;
                var n = !0,
                    r = !1,
                    a = void 0;
                try {
                    for (var o, i = t[Symbol.iterator](); !(n = (o = i.next()).done); n = !0) {
                        var u = o.value;
                        if (function(e) {
                                var t;
                                return "string" == typeof e || (null != (t = RegExp) && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t)
                            }(u)) {
                            if (tD(e.description, u)) return eP && n2(e), !0;
                            continue
                        }
                        if (u.name || u.op) {
                            var c = !u.name || tD(e.description, u.name),
                                l = !u.op || e.op && tD(e.op, u.op);
                            if (c && l) return eP && n2(e), !0
                        }
                    }
                } catch (e) {
                    r = !0, a = e
                } finally {
                    try {
                        n || null == i.return || i.return()
                    } finally {
                        if (r) throw a
                    }
                }
                return !1
            }

            function n5(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function n9(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function n4(e) {
                return function(e) {
                    if (Array.isArray(e)) return n5(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return n5(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return n5(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function n8(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function n6(e) {
                if (e && 0 !== e.length) {
                    var t = {};
                    return e.forEach(function(e) {
                        var n = e.attributes || {},
                            r = n[t6],
                            a = n[t7];
                        "string" == typeof r && "number" == typeof a && (t[e.name] = {
                            value: a,
                            unit: r
                        })
                    }), t
                }
            }

            function n7(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function re(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function rt(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function rn(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        re(e, t, n[t])
                    })
                }
                return e
            }
            var rr = function() {
                var e;

                function t() {
                    var e, n = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                    if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                    this._traceId = n.traceId || ts(), this._spanId = n.spanId || tE(), this._startTime = n.startTimestamp || tb(), this._links = n.links, this._attributes = {}, this.setAttributes(rn((re(e = {}, t4, "manual"), re(e, t9, n.op), e), n.attributes)), this._name = n.name, n.parentSpanId && (this._parentSpanId = n.parentSpanId), "sampled" in n && (this._sampled = n.sampled), n.endTimestamp && (this._endTime = n.endTimestamp), this._events = [], this._isStandaloneSpan = n.isStandalone, this._endTime && this._onSpanEnded()
                }
                return e = [{
                        key: "addLink",
                        value: function(e) {
                            return this._links ? this._links.push(e) : this._links = [e], this
                        }
                    }, {
                        key: "addLinks",
                        value: function(e) {
                            if (this._links) {
                                var t;
                                (t = this._links).push.apply(t, function(e) {
                                    if (Array.isArray(e)) return n7(e)
                                }(e) || function(e) {
                                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(e) || function(e, t) {
                                    if (e) {
                                        if ("string" == typeof e) return n7(e, void 0);
                                        var n = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return n7(e, t)
                                    }
                                }(e) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }())
                            } else this._links = e;
                            return this
                        }
                    }, {
                        key: "recordException",
                        value: function(e, t) {}
                    }, {
                        key: "spanContext",
                        value: function() {
                            return {
                                spanId: this._spanId,
                                traceId: this._traceId,
                                traceFlags: +!!this._sampled
                            }
                        }
                    }, {
                        key: "setAttribute",
                        value: function(e, t) {
                            return void 0 === t ? delete this._attributes[e] : this._attributes[e] = t, this
                        }
                    }, {
                        key: "setAttributes",
                        value: function(e) {
                            var t = this;
                            return Object.keys(e).forEach(function(n) {
                                return t.setAttribute(n, e[n])
                            }), this
                        }
                    }, {
                        key: "updateStartTime",
                        value: function(e) {
                            this._startTime = nS(e)
                        }
                    }, {
                        key: "setStatus",
                        value: function(e) {
                            return this._status = e, this
                        }
                    }, {
                        key: "updateName",
                        value: function(e) {
                            return this._name = e, this.setAttribute(t2, "custom"), this
                        }
                    }, {
                        key: "end",
                        value: function(e) {
                            this._endTime || (this._endTime = nS(e), function(e) {
                                if (eP) {
                                    var t = nE(e),
                                        n = t.description,
                                        r = t.op,
                                        a = e.spanContext().spanId,
                                        o = nk(e) === e,
                                        i = '[Tracing] Finishing "'.concat(void 0 === r ? "< unknown op >" : r, '" ').concat(o ? "root " : "", 'span "').concat(void 0 === n ? "< unknown name >" : n, '" with ID ').concat(a);
                                    e8.log(i)
                                }
                            }(this), this._onSpanEnded())
                        }
                    }, {
                        key: "getSpanJSON",
                        value: function() {
                            return {
                                data: this._attributes,
                                description: this._name,
                                op: this._attributes[t9],
                                parent_span_id: this._parentSpanId,
                                span_id: this._spanId,
                                start_timestamp: this._startTime,
                                status: nw(this._status),
                                timestamp: this._endTime,
                                trace_id: this._traceId,
                                origin: this._attributes[t4],
                                profile_id: this._attributes[nt],
                                exclusive_time: this._attributes[nn],
                                measurements: n6(this._events),
                                is_segment: this._isStandaloneSpan && nk(this) === this || void 0,
                                segment_id: this._isStandaloneSpan ? nk(this).spanContext().spanId : void 0,
                                links: ng(this._links)
                            }
                        }
                    }, {
                        key: "isRecording",
                        value: function() {
                            return !this._endTime && !!this._sampled
                        }
                    }, {
                        key: "addEvent",
                        value: function(e, t, n) {
                            eP && e8.log("[Tracing] Adding an event to span:", e);
                            var r = ra(t) ? t : n || tb(),
                                a = ra(t) ? {} : t || {},
                                o = {
                                    name: e,
                                    time: nS(r),
                                    attributes: a
                                };
                            return this._events.push(o), this
                        }
                    }, {
                        key: "isStandaloneSpan",
                        value: function() {
                            return !!this._isStandaloneSpan
                        }
                    }, {
                        key: "_onSpanEnded",
                        value: function() {
                            var e = t1();
                            if (e && e.emit("spanEnd", this), this._isStandaloneSpan || this === nk(this)) {
                                if (this._isStandaloneSpan) return void(this._sampled ? function(e) {
                                    var t = t1();
                                    if (t) {
                                        var n = e[1];
                                        if (!n || 0 === n.length) return t.recordDroppedEvent("before_send", "span");
                                        t.sendEnvelope(e)
                                    }
                                }(function(e, t) {
                                    var n = nY(e[0]),
                                        r = null == t ? void 0 : t.getDsn(),
                                        a = null == t ? void 0 : t.getOptions().tunnel,
                                        o = n9({
                                            sent_at: new Date().toISOString()
                                        }, !!n.trace_id && !!n.public_key && {
                                            trace: n
                                        }, !!a && r && {
                                            dsn: nC(r)
                                        }),
                                        i = (null == t ? void 0 : t.getOptions()) || {},
                                        u = i.beforeSendSpan,
                                        c = i.ignoreSpans,
                                        l = (null == c ? void 0 : c.length) ? e.filter(function(e) {
                                            return !n3(nE(e), c)
                                        }) : e,
                                        s = e.length - l.length;
                                    s && (null == t || t.recordDroppedEvent("before_send", "span", s));
                                    var f = u ? function(e) {
                                            var t = nE(e),
                                                n = u(t);
                                            return n || (nx(), t)
                                        } : nE,
                                        d = [],
                                        p = !0,
                                        m = !1,
                                        y = void 0;
                                    try {
                                        for (var v, b = l[Symbol.iterator](); !(p = (v = b.next()).done); p = !0) {
                                            var h = v.value,
                                                g = f(h);
                                            g && d.push([{
                                                type: "span"
                                            }, g])
                                        }
                                    } catch (e) {
                                        m = !0, y = e
                                    } finally {
                                        try {
                                            p || null == b.return || b.return()
                                        } finally {
                                            if (m) throw y
                                        }
                                    }
                                    return nz(o, d)
                                }([this], e)) : (eP && e8.log("[Tracing] Discarding standalone span because its trace was not chosen to be sampled."), e && e.recordDroppedEvent("sample_rate", "span")));
                                var t = this._convertSpanToTransaction();
                                t && (nc(this).scope || tq()).captureEvent(t)
                            }
                        }
                    }, {
                        key: "_convertSpanToTransaction",
                        value: function() {
                            var e, t = this;
                            if (ro(nE(this))) {
                                this._name || (eP && e8.warn("Transaction has no name, falling back to `<unlabeled transaction>`."), this._name = "<unlabeled transaction>");
                                var n = nc(this),
                                    r = n.scope,
                                    a = n.isolationScope,
                                    o = null == r || null == (e = r.getScopeData().sdkProcessingMetadata) ? void 0 : e.normalizedRequest;
                                if (!0 === this._sampled) {
                                    var i, u, c, l, s, f, d = nN(this).filter(function(e) {
                                            var n;
                                            return e !== t && !(rt(n = e, rr) && n.isStandaloneSpan())
                                        }).map(function(e) {
                                            return nE(e)
                                        }).filter(ro),
                                        p = this._attributes[t2];
                                    delete this._attributes[ne], d.forEach(function(e) {
                                        delete e.data[ne]
                                    });
                                    var m = rn({
                                            contexts: {
                                                trace: (u = (i = this.spanContext()).spanId, c = i.traceId, s = (l = nE(this)).data, f = l.op, {
                                                    parent_span_id: l.parent_span_id,
                                                    span_id: u,
                                                    trace_id: c,
                                                    data: s,
                                                    op: f,
                                                    status: l.status,
                                                    origin: l.origin,
                                                    links: l.links
                                                })
                                            },
                                            spans: d.length > 1e3 ? d.sort(function(e, t) {
                                                return e.start_timestamp - t.start_timestamp
                                            }).slice(0, 1e3) : d,
                                            start_timestamp: this._startTime,
                                            timestamp: this._endTime,
                                            transaction: this._name,
                                            type: "transaction",
                                            sdkProcessingMetadata: {
                                                capturedSpanScope: r,
                                                capturedSpanIsolationScope: a,
                                                dynamicSamplingContext: nY(this)
                                            },
                                            request: o
                                        }, p && {
                                            transaction_info: {
                                                source: p
                                            }
                                        }),
                                        y = n6(this._events);
                                    return y && Object.keys(y).length && (eP && e8.log("[Measurements] Adding measurements to transaction event", JSON.stringify(y, void 0, 2)), m.measurements = y), m
                                }
                            }
                        }
                    }],
                    function(e, t) {
                        for (var n = 0; n < t.length; n++) {
                            var r = t[n];
                            r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                        }
                    }(t.prototype, e), t
            }();

            function ra(e) {
                return e && "number" == typeof e || rt(e, Date) || Array.isArray(e)
            }

            function ro(e) {
                return !!e.start_timestamp && !!e.timestamp && !!e.span_id && !!e.trace_id
            }

            function ri(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ru(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function rc(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        ru(e, t, n[t])
                    })
                }
                return e
            }

            function rl(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }
            var rs = "__SENTRY_SUPPRESS_TRACING__";

            function rf(e, t) {
                var n = tH(ej());
                if (n.startSpan) return n.startSpan(e, t);
                var r = ry(e),
                    a = e.forceTransaction,
                    o = e.parentSpan,
                    i = e.scope;
                return t0(null == i ? void 0 : i.clone(), function() {
                    var n;
                    return (void 0 !== (n = o) ? function(e) {
                        return rp(n, e)
                    } : function(e) {
                        return e()
                    })(function() {
                        var n = tq(),
                            i = rb(n, o),
                            u = e.onlyIfParent && !i ? new nW : rm({
                                parentSpan: i,
                                spanArguments: r,
                                forceTransaction: a,
                                scope: n
                            });
                        return tw(n, u),
                            function(e, t) {
                                var n, r, a, o, i, u = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : function() {},
                                    c = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : function() {};
                                try {
                                    i = e()
                                } catch (e) {
                                    throw t(e), u(), e
                                }
                                return n = i, r = t, a = u, o = c, eU(n) ? n.then(function(e) {
                                    return a(), o(e), e
                                }, function(e) {
                                    throw r(e), a(), e
                                }) : (a(), o(n), n)
                            }(function() {
                                return t(u)
                            }, function() {
                                var e = nE(u).status;
                                u.isRecording() && (!e || "ok" === e) && u.setStatus({
                                    code: 2,
                                    message: "internal_error"
                                })
                            }, function() {
                                u.end()
                            })
                    })
                })
            }

            function rd(e) {
                var t = tH(ej());
                if (t.startInactiveSpan) return t.startInactiveSpan(e);
                var n = ry(e),
                    r = e.forceTransaction,
                    a = e.parentSpan;
                return (e.scope ? function(t) {
                    return t0(e.scope, t)
                } : void 0 !== a ? function(e) {
                    return rp(a, e)
                } : function(e) {
                    return e()
                })(function() {
                    var t = tq(),
                        o = rb(t, a);
                    return e.onlyIfParent && !o ? new nW : rm({
                        parentSpan: o,
                        spanArguments: n,
                        forceTransaction: r,
                        scope: t
                    })
                })
            }

            function rp(e, t) {
                var n = tH(ej());
                return n.withActiveSpan ? n.withActiveSpan(e, t) : t0(function(n) {
                    return tw(n, e || void 0), t(n)
                })
            }

            function rm(e) {
                var t, n, r, a, o, i, u, c, l, s, f, d = e.parentSpan,
                    p = e.spanArguments,
                    m = e.forceTransaction,
                    y = e.scope;
                if (!nr()) {
                    var v = new nW;
                    if (m || !d) {
                        var b = rc({
                            sampled: "false",
                            sample_rate: "0",
                            transaction: p.name
                        }, nY(v));
                        te(v, nF, b)
                    }
                    return v
                }
                var h = t$();
                if (d && !m) {
                    t = d, n = y, r = p, o = (a = t.spanContext()).spanId, i = a.traceId, c = (u = !n.getScopeData().sdkProcessingMetadata[rs] && nO(t)) ? new rr(rl(rc({}, r), {
                        parentSpanId: o,
                        traceId: i,
                        sampled: u
                    })) : new nW({
                        traceId: i
                    }), nT(t, c), (l = t1()) && (l.emit("spanStart", c), r.endTimestamp && l.emit("spanEnd", c)), nT(d, f = c)
                } else if (d) {
                    var g = nY(d),
                        S = d.spanContext(),
                        _ = S.traceId,
                        E = S.spanId,
                        O = nO(d);
                    te(f = rv(rc({
                        traceId: _,
                        parentSpanId: E
                    }, p), y, O), nF, g)
                } else {
                    var w = rc({}, h.getPropagationContext(), y.getPropagationContext()),
                        I = w.traceId,
                        A = w.dsc,
                        T = w.parentSpanId,
                        N = w.sampled;
                    f = rv(rc({
                        traceId: I,
                        parentSpanId: T
                    }, p), y, N), A && te(f, nF, A)
                }
                return ! function(e) {
                    if (eP) {
                        var t = nE(e),
                            n = t.description,
                            r = t.op,
                            a = t.parent_span_id,
                            o = e.spanContext().spanId,
                            i = nO(e),
                            u = nk(e),
                            c = u === e,
                            l = "[Tracing] Starting ".concat(i ? "sampled" : "unsampled", " ").concat(c ? "root " : "", "span"),
                            s = ["op: ".concat(void 0 === r ? "< unknown op >" : r), "name: ".concat(void 0 === n ? "< unknown name >" : n), "ID: ".concat(o)];
                        if (a && s.push("parent ID: ".concat(a)), !c) {
                            var f = nE(u),
                                d = f.op,
                                p = f.description;
                            s.push("root ID: ".concat(u.spanContext().spanId)), d && s.push("root op: ".concat(d)), p && s.push("root description: ".concat(p))
                        }
                        e8.log("".concat(l, "\n  ").concat(s.join("\n  ")))
                    }
                }(f), (s = f) && (te(s, nu, function(e) {
                    try {
                        var t = ek.WeakRef;
                        if ("function" == typeof t) return new t(e)
                    } catch (e) {}
                    return e
                }(h)), te(s, ni, y)), f
            }

            function ry(e) {
                var t = rc({
                    isStandalone: (e.experimental || {}).standalone
                }, e);
                if (e.startTime) {
                    var n = rc({}, t);
                    return n.startTimestamp = nS(e.startTime), delete n.startTime, n
                }
                return t
            }

            function rv(e, t, n) {
                var r, a, o, i, u = t1(),
                    c = (null == u ? void 0 : u.getOptions()) || {},
                    l = e.name,
                    s = void 0 === l ? "" : l,
                    f = {
                        spanAttributes: rc({}, e.attributes),
                        spanName: s,
                        parentSampled: n
                    };
                null == u || u.emit("beforeSampling", f, {
                    decision: !1
                });
                var d = null != (o = f.parentSampled) ? o : n,
                    p = f.spanAttributes,
                    m = t.getPropagationContext(),
                    y = (r = t.getScopeData().sdkProcessingMetadata[rs] ? [!1] : function(e, t, n) {
                        if (!nr(e)) return [!1];
                        var r, a, o, i, u = void 0;
                        "function" == typeof e.tracesSampler ? (i = e.tracesSampler((r = function(e) {
                            for (var t = 1; t < arguments.length; t++) {
                                var n = null != arguments[t] ? arguments[t] : {},
                                    r = Object.keys(n);
                                "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                    return Object.getOwnPropertyDescriptor(n, e).enumerable
                                }))), r.forEach(function(t) {
                                    var r;
                                    r = n[t], t in e ? Object.defineProperty(e, t, {
                                        value: r,
                                        enumerable: !0,
                                        configurable: !0,
                                        writable: !0
                                    }) : e[t] = r
                                })
                            }
                            return e
                        }({}, t), a = a = {
                            inheritOrSampleWith: function(e) {
                                return "number" == typeof t.parentSampleRate ? t.parentSampleRate : "boolean" == typeof t.parentSampled ? Number(t.parentSampled) : e
                            }
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(a)) : (function(e, t) {
                            var n = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                n.push.apply(n, r)
                            }
                            return n
                        })(Object(a)).forEach(function(e) {
                            Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(a, e))
                        }), r)), u = !0) : void 0 !== t.parentSampled ? i = t.parentSampled : void 0 !== e.tracesSampleRate && (i = e.tracesSampleRate, u = !0);
                        var c = na(i);
                        if (void 0 === c) return eP && e8.warn("[Tracing] Discarding root span because of invalid sample rate. Sample rate must be a boolean or a number between 0 and 1. Got ".concat(JSON.stringify(i), " of type ").concat(JSON.stringify(void 0 === i ? "undefined" : (o = i) && "undefined" != typeof Symbol && o.constructor === Symbol ? "symbol" : typeof o), ".")), [!1];
                        if (!c) return eP && e8.log("[Tracing] Discarding transaction because ".concat("function" == typeof e.tracesSampler ? "tracesSampler returned 0 or false" : "a negative sampling decision was inherited or tracesSampleRate is set to 0")), [!1, c, u];
                        var l = n < c;
                        return !l && eP && e8.log("[Tracing] Discarding transaction because it's not included in the random sample (sampling rate = ".concat(Number(i), ")")), [l, c, u]
                    }(c, {
                        name: s,
                        parentSampled: d,
                        attributes: p,
                        parentSampleRate: na(null == (a = m.dsc) ? void 0 : a.sample_rate)
                    }, m.sampleRand), function(e) {
                        if (Array.isArray(e)) return e
                    }(r) || function(e, t) {
                        var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != a) {
                            var o = [],
                                i = !0,
                                u = !1;
                            try {
                                for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                            } catch (e) {
                                u = !0, r = e
                            } finally {
                                try {
                                    i || null == a.return || a.return()
                                } finally {
                                    if (u) throw r
                                }
                            }
                            return o
                        }
                    }(r, 3) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return ri(e, 3);
                            var n = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ri(e, t)
                        }
                    }(r, 3) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    v = y[0],
                    b = y[1],
                    h = y[2],
                    g = new rr(rl(rc({}, e), {
                        attributes: rc((ru(i = {}, t2, "custom"), ru(i, t3, void 0 !== b && h ? b : void 0), i), p),
                        sampled: v
                    }));
                return !v && u && (eP && e8.log("[Tracing] Discarding root span because its trace was not chosen to be sampled."), u.recordDroppedEvent("sample_rate", "transaction")), u && u.emit("spanStart", g), g
            }

            function rb(e, t) {
                if (t) return t;
                if (null !== t) {
                    var n = e[tO];
                    if (n) {
                        var r = t1();
                        return (r ? r.getOptions() : {}).parentSpanIsAlwaysRootSpan ? nk(n) : n
                    }
                }
            }

            function rh(e) {
                return new rS(function(t) {
                    t(e)
                })
            }

            function rg(e) {
                return new rS(function(t, n) {
                    n(e)
                })
            }
            var rS = function() {
                var e;

                function t(e) {
                    if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                    this._state = 0, this._handlers = [], this._runExecutor(e)
                }
                return e = [{
                        key: "then",
                        value: function(e, n) {
                            var r = this;
                            return new t(function(t, a) {
                                r._handlers.push([!1, function(n) {
                                    if (e) try {
                                        t(e(n))
                                    } catch (e) {
                                        a(e)
                                    } else t(n)
                                }, function(e) {
                                    if (n) try {
                                        t(n(e))
                                    } catch (e) {
                                        a(e)
                                    } else a(e)
                                }]), r._executeHandlers()
                            })
                        }
                    }, {
                        key: "catch",
                        value: function(e) {
                            return this.then(function(e) {
                                return e
                            }, e)
                        }
                    }, {
                        key: "finally",
                        value: function(e) {
                            var n = this;
                            return new t(function(t, r) {
                                var a, o;
                                return n.then(function(t) {
                                    o = !1, a = t, e && e()
                                }, function(t) {
                                    o = !0, a = t, e && e()
                                }).then(function() {
                                    o ? r(a) : t(a)
                                })
                            })
                        }
                    }, {
                        key: "_executeHandlers",
                        value: function() {
                            var e = this;
                            if (0 !== this._state) {
                                var t = this._handlers.slice();
                                this._handlers = [], t.forEach(function(t) {
                                    t[0] || (1 === e._state && t[1](e._value), 2 === e._state && t[2](e._value), t[0] = !0)
                                })
                            }
                        }
                    }, {
                        key: "_runExecutor",
                        value: function(e) {
                            var t = this,
                                n = function(e, n) {
                                    if (0 === t._state) {
                                        if (eU(n)) return void n.then(r, a);
                                        t._state = e, t._value = n, t._executeHandlers()
                                    }
                                },
                                r = function(e) {
                                    n(1, e)
                                },
                                a = function(e) {
                                    n(2, e)
                                };
                            try {
                                e(r, a)
                            } catch (e) {
                                a(e)
                            }
                        }
                    }],
                    function(e, t) {
                        for (var n = 0; n < t.length; n++) {
                            var r = t[n];
                            r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                        }
                    }(t.prototype, e), t
            }();

            function r_(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function rE(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function rO(e) {
                return function(e) {
                    if (Array.isArray(e)) return r_(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return r_(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return r_(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rw(e, t) {
                var n = t.extra,
                    r = t.tags,
                    a = t.attributes,
                    o = t.user,
                    i = t.contexts,
                    u = t.level,
                    c = t.sdkProcessingMetadata,
                    l = t.breadcrumbs,
                    s = t.fingerprint,
                    f = t.eventProcessors,
                    d = t.attachments,
                    p = t.propagationContext,
                    m = t.transactionName,
                    y = t.span;
                rI(e, "extra", n), rI(e, "tags", r), rI(e, "attributes", a), rI(e, "user", o), rI(e, "contexts", i), e.sdkProcessingMetadata = t_(e.sdkProcessingMetadata, c, 2), u && (e.level = u), m && (e.transactionName = m), y && (e.span = y), l.length && (e.breadcrumbs = rO(e.breadcrumbs).concat(rO(l))), s.length && (e.fingerprint = rO(e.fingerprint).concat(rO(s))), f.length && (e.eventProcessors = rO(e.eventProcessors).concat(rO(f))), d.length && (e.attachments = rO(e.attachments).concat(rO(d))), e.propagationContext = rE({}, e.propagationContext, p)
            }

            function rI(e, t, n) {
                e[t] = t_(e[t], n, 1)
            }

            function rA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function rT(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function rN(e) {
                return function(e) {
                    if (Array.isArray(e)) return rA(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || rk(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rk(e, t) {
                if (e) {
                    if ("string" == typeof e) return rA(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return rA(e, t)
                }
            }
            var rj = ["user", "level", "extra", "contexts", "tags", "fingerprint", "propagationContext"];

            function rx(e, t, n, r, a, o, i) {
                try {
                    var u = e[o](i),
                        c = u.value
                } catch (e) {
                    n(e);
                    return
                }
                u.done ? t(c) : Promise.resolve(c).then(r, a)
            }

            function rR(e, t) {
                return tq().captureException(e, function(e) {
                    if (e) return function(e) {
                        return (null != tG && "undefined" != typeof Symbol && tG[Symbol.hasInstance] ? !!tG[Symbol.hasInstance](e) : e instanceof tG) || "function" == typeof e
                    }(e) || Object.keys(e).some(function(e) {
                        return rj.includes(e)
                    }) ? {
                        captureContext: e
                    } : e
                }(t))
            }

            function rP(e, t) {
                return tq().captureEvent(e, t)
            }

            function rV(e, t) {
                t$().setTag(e, t)
            }

            function rZ(e) {
                var t, n, r, a = t$(),
                    o = tq(),
                    i = (ek.navigator || {}).userAgent,
                    u = (t = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({
                        user: o.getUser() || a.getUser()
                    }, i && {
                        userAgent: i
                    }, e), n = tb(), r = {
                        sid: ts(),
                        init: !0,
                        timestamp: n,
                        started: n,
                        duration: 0,
                        status: "ok",
                        errors: 0,
                        ignoreDuration: !1,
                        toJSON: function() {
                            var e;
                            return e = r, {
                                sid: "".concat(e.sid),
                                init: e.init,
                                started: new Date(1e3 * e.started).toISOString(),
                                timestamp: new Date(1e3 * e.timestamp).toISOString(),
                                status: e.status,
                                errors: e.errors,
                                did: "number" == typeof e.did || "string" == typeof e.did ? "".concat(e.did) : void 0,
                                duration: e.duration,
                                abnormal_mechanism: e.abnormal_mechanism,
                                attrs: {
                                    release: e.release,
                                    environment: e.environment,
                                    ip_address: e.ipAddress,
                                    user_agent: e.userAgent
                                }
                            }
                        }
                    }, t && tS(r, t), r),
                    c = a.getSession();
                return (null == c ? void 0 : c.status) === "ok" && tS(c, {
                    status: "exited"
                }), rC(), a.setSession(u), u
            }

            function rC() {
                var e, t = t$(),
                    n = tq().getSession() || t.getSession();
                n && (e = {}, "ok" === n.status && (e = {
                    status: "exited"
                }), tS(n, e)), rD(), t.setSession()
            }

            function rD() {
                var e = t$(),
                    t = t1(),
                    n = e.getSession();
                n && t && t.captureSession(n)
            }

            function rF() {
                var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                e ? rC() : rD()
            }

            function rL(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function rX(e) {
                return function(e) {
                    if (Array.isArray(e)) return rL(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rL(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return rL(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rY = [];

            function rW(e, t) {
                var n = !0,
                    r = !1,
                    a = void 0;
                try {
                    for (var o, i = t[Symbol.iterator](); !(n = (o = i.next()).done); n = !0) {
                        var u = o.value;
                        (null == u ? void 0 : u.afterAllSetup) && u.afterAllSetup(e)
                    }
                } catch (e) {
                    r = !0, a = e
                } finally {
                    try {
                        n || null == i.return || i.return()
                    } finally {
                        if (r) throw a
                    }
                }
            }

            function rB(e, t, n) {
                if (n[t.name]) {
                    eP && e8.log("Integration skipped because it was already installed: ".concat(t.name));
                    return
                }
                if (n[t.name] = t, rY.includes(t.name) || "function" != typeof t.setupOnce || (t.setupOnce(), rY.push(t.name)), t.setup && "function" == typeof t.setup && t.setup(e), "function" == typeof t.preprocessEvent) {
                    var r = t.preprocessEvent.bind(t);
                    e.on("preprocessEvent", function(t, n) {
                        return r(t, n, e)
                    })
                }
                if ("function" == typeof t.processEvent) {
                    var a = t.processEvent.bind(t),
                        o = Object.assign(function(t, n) {
                            return a(t, n, e)
                        }, {
                            id: t.name
                        });
                    e.addEventProcessor(o)
                }
                eP && e8.log("Integration installed: ".concat(t.name))
            }

            function rG(e) {
                var t = [];
                e.message && t.push(e.message);
                try {
                    var n = e.exception.values[e.exception.values.length - 1];
                    (null == n ? void 0 : n.value) && (t.push(n.value), n.type && t.push("".concat(n.type, ": ").concat(n.value)))
                } catch (e) {}
                return t
            }

            function rU(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function rM(e) {
                return function(e) {
                    if (Array.isArray(e)) return rU(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rU(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return rU(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rJ = [/^Script error\.?$/, /^Javascript error: Script error\.? on line 0$/, /^ResizeObserver loop completed with undelivered notifications.$/, /^Cannot redefine property: googletag$/, /^Can't find variable: gmo$/, /^undefined is not an object \(evaluating 'a\.[A-Z]'\)$/, 'can\'t redefine non-configurable property "solana"', "vv().getRestrictions is not a function. (In 'vv().getRestrictions(1,a)', 'vv().getRestrictions' is undefined)", "Can't find variable: _AutofillCallbackHandler", /^Non-Error promise rejection captured with value: Object Not Found Matching Id:\d+, MethodName:simulateEvent, ParamCount:\d+$/, /^Java exception was raised during method invocation$/],
                rK = function() {
                    var e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                    return {
                        name: "EventFilters",
                        setup: function(n) {
                            e = rH(t, n.getOptions())
                        },
                        processEvent: function(n, r, a) {
                            return e || (e = rH(t, a.getOptions())), ! function(e, t) {
                                if (e.type) {
                                    if ("transaction" === e.type && function(e, t) {
                                            if (!(null == t ? void 0 : t.length)) return !1;
                                            var n = e.transaction;
                                            return !!n && tF(n, t)
                                        }(e, t.ignoreTransactions)) return eP && e8.warn("Event dropped due to being matched by `ignoreTransactions` option.\nEvent: ".concat(td(e))), !0
                                } else {
                                    var n, r, a, o, i;
                                    if (n = e, (null == (r = t.ignoreErrors) ? void 0 : r.length) && rG(n).some(function(e) {
                                            return tF(e, r)
                                        })) return eP && e8.warn("Event dropped due to being matched by `ignoreErrors` option.\nEvent: ".concat(td(e))), !0;
                                    if ((null == (i = (a = e).exception) || null == (o = i.values) ? void 0 : o.length) && !a.message && !a.exception.values.some(function(e) {
                                            return e.stacktrace || e.type && "Error" !== e.type || e.value
                                        })) return eP && e8.warn("Event dropped due to not having an error message, error type or stacktrace.\nEvent: ".concat(td(e))), !0;
                                    if (function(e, t) {
                                            if (!(null == t ? void 0 : t.length)) return !1;
                                            var n = rQ(e);
                                            return !!n && tF(n, t)
                                        }(e, t.denyUrls)) return eP && e8.warn("Event dropped due to being matched by `denyUrls` option.\nEvent: ".concat(td(e), ".\nUrl: ").concat(rQ(e))), !0;
                                    if (! function(e, t) {
                                            if (!(null == t ? void 0 : t.length)) return !0;
                                            var n = rQ(e);
                                            return !n || tF(n, t)
                                        }(e, t.allowUrls)) return eP && e8.warn("Event dropped due to not being matched by `allowUrls` option.\nEvent: ".concat(td(e), ".\nUrl: ").concat(rQ(e))), !0
                                }
                                return !1
                            }(n, e) ? n : null
                        }
                    }
                },
                rz = function() {
                    var e, t, n = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                    return e = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({}, rK(n)), t = t = {
                        name: "InboundFilters"
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                        var n = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            n.push.apply(n, r)
                        }
                        return n
                    })(Object(t)).forEach(function(n) {
                        Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                    }), e
                };

            function rH() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                return {
                    allowUrls: rM(e.allowUrls || []).concat(rM(t.allowUrls || [])),
                    denyUrls: rM(e.denyUrls || []).concat(rM(t.denyUrls || [])),
                    ignoreErrors: rM(e.ignoreErrors || []).concat(rM(t.ignoreErrors || []), rM(e.disableErrorDefaults ? [] : rJ)),
                    ignoreTransactions: rM(e.ignoreTransactions || []).concat(rM(t.ignoreTransactions || []))
                }
            }

            function rQ(e) {
                try {
                    var t, n, r, a = rM(null != (r = null == (t = e.exception) ? void 0 : t.values) ? r : []).reverse().find(function(e) {
                            var t, n, r;
                            return (null == (t = e.mechanism) ? void 0 : t.parent_id) === void 0 && (null == (r = e.stacktrace) || null == (n = r.frames) ? void 0 : n.length)
                        }),
                        o = null == a || null == (n = a.stacktrace) ? void 0 : n.frames;
                    return o ? function() {
                        for (var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [], t = e.length - 1; t >= 0; t--) {
                            var n = e[t];
                            if (n && "<anonymous>" !== n.filename && "[native code]" !== n.filename) return n.filename || null
                        }
                        return null
                    }(o) : null
                } catch (t) {
                    return eP && e8.error("Cannot extract url for event ".concat(td(e))), null
                }
            }
            var rq = new WeakMap,
                r$ = function() {
                    var e;
                    return {
                        name: "Dedupe",
                        processEvent: function(t) {
                            if (t.type) return t;
                            try {
                                var n, r, a, o, i, u, c, l, s, f;
                                if (n = t, (r = e) && (a = n, o = r, i = a.message, u = o.message, (i || u) && (!i || u) && (i || !u) && i === u && r1(a, o) && r0(a, o) && 1 || (c = n, l = r, s = r2(l), f = r2(c), s && f && s.type === f.type && s.value === f.value && r1(c, l) && r0(c, l)))) return eP && e8.warn("Event dropped due to being a duplicate of previously captured event."), null
                            } catch (e) {}
                            return e = t
                        }
                    }
                };

            function r0(e, t) {
                var n = tP(e),
                    r = tP(t);
                if (!n && !r) return !0;
                if (n && !r || !n && r || r.length !== n.length) return !1;
                for (var a = 0; a < r.length; a++) {
                    var o = r[a],
                        i = n[a];
                    if (o.filename !== i.filename || o.lineno !== i.lineno || o.colno !== i.colno || o.function !== i.function) return !1
                }
                return !0
            }

            function r1(e, t) {
                var n = e.fingerprint,
                    r = t.fingerprint;
                if (!n && !r) return !0;
                if (n && !r || !n && r) return !1;
                try {
                    return n.join("") === r.join("")
                } catch (e) {
                    return !1
                }
            }

            function r2(e) {
                var t, n;
                return null == (n = e.exception) || null == (t = n.values) ? void 0 : t[0]
            }
            var r3 = n(794);

            function r5(e, t) {
                var n, r, a = null != (r = null != t ? t : (n = e, r9().get(n))) ? r : [];
                if (0 !== a.length) {
                    var o, i, u, c, l = e.getOptions(),
                        s = (o = l._metadata, i = l.tunnel, u = e.getDsn(), c = {}, (null == o ? void 0 : o.sdk) && (c.sdk = {
                            name: o.sdk.name,
                            version: o.sdk.version
                        }), i && u && (c.dsn = nC(u)), nz(c, [
                            [{
                                type: "log",
                                item_count: a.length,
                                content_type: "application/vnd.sentry.items.log+json"
                            }, {
                                items: a
                            }]
                        ]));
                    r9().set(e, []), e.emit("flushLogs"), e.sendEnvelope(s)
                }
            }

            function r9() {
                return eR("clientToLogBufferMap", function() {
                    return new WeakMap
                })
            }

            function r4(e, t) {
                var n, r, a = null != (r = null != t ? t : (n = e, r8().get(n))) ? r : [];
                if (0 !== a.length) {
                    var o, i, u, c, l = e.getOptions(),
                        s = (o = l._metadata, i = l.tunnel, u = e.getDsn(), c = {}, (null == o ? void 0 : o.sdk) && (c.sdk = {
                            name: o.sdk.name,
                            version: o.sdk.version
                        }), i && u && (c.dsn = nC(u)), nz(c, [
                            [{
                                type: "trace_metric",
                                item_count: a.length,
                                content_type: "application/vnd.sentry.items.trace-metric+json"
                            }, {
                                items: a
                            }]
                        ]));
                    r8().set(e, []), e.emit("flushMetrics"), e.sendEnvelope(s)
                }
            }

            function r8() {
                return eR("clientToMetricBufferMap", function() {
                    return new WeakMap
                })
            }

            function r6(e) {
                if ("aggregates" in e) {
                    var t, n, r;
                    (null == (t = e.attrs) ? void 0 : t.ip_address) === void 0 && (n = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({}, e.attrs), r = r = {
                        ip_address: "{{auto}}"
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(r)) : (function(e, t) {
                        var n = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            n.push.apply(n, r)
                        }
                        return n
                    })(Object(r)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(r, e))
                    }), e.attrs = n)
                } else void 0 === e.ipAddress && (e.ipAddress = "{{auto}}")
            }
            var r7 = Symbol.for("SentryBufferFullError");

            function ae() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 100,
                    t = new Set;
                return {
                    get $() {
                        return Array.from(t)
                    },
                    add: function(n) {
                        if (!(t.size < e)) return rg(r7);
                        var r = n();
                        return t.add(r), r.then(function() {
                            t.delete(r)
                        }, function() {
                            t.delete(r)
                        }), r
                    },
                    drain: function(e) {
                        if (!t.size) return rh(!0);
                        var n = Promise.allSettled(Array.from(t)).then(function() {
                            return !0
                        });
                        return e ? Promise.race([n, new Promise(function(t) {
                            return setTimeout(function() {
                                return t(!1)
                            }, e)
                        })]) : n
                    }
                }
            }

            function at(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function an(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : tc(),
                    n = parseInt("".concat(e), 10);
                if (!isNaN(n)) return 1e3 * n;
                var r = Date.parse("".concat(e));
                return isNaN(r) ? 6e4 : r - t
            }

            function ar(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function aa(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ao(e, t, n, r, a, o, i) {
                try {
                    var u = e[o](i),
                        c = u.value
                } catch (e) {
                    n(e);
                    return
                }
                u.done ? t(c) : Promise.resolve(c).then(r, a)
            }

            function ai(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var o = e.apply(t, n);

                        function i(e) {
                            ao(o, r, a, i, u, "next", e)
                        }

                        function u(e) {
                            ao(o, r, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function au(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function ac(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        au(e, t, n[t])
                    })
                }
                return e
            }

            function al(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function as(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || ap(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function af(e) {
                return function(e) {
                    if (Array.isArray(e)) return aa(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || ap(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ad(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function ap(e, t) {
                if (e) {
                    if ("string" == typeof e) return aa(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return aa(e, t)
                }
            }

            function am(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = u(0), i.throw = u(1), i.return = u(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function u(u) {
                    return function(c) {
                        var l = [u, c];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, l[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & l[0] ? r.return : l[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, l[1])).done) return a;
                            switch (r = 0, a && (l = [2 & l[0], a.value]), l[0]) {
                                case 0:
                                case 1:
                                    a = l;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: l[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, r = l[1], l = [0];
                                    continue;
                                case 7:
                                    l = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === l[0] && (!a || l[1] > a[0] && l[1] < a[3])) {
                                        o.label = l[1];
                                        break
                                    }
                                    if (6 === l[0] && o.label < a[1]) {
                                        o.label = a[1], a = l;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(l);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            l = t.call(e, o)
                        } catch (e) {
                            l = [6, e], r = 0
                        } finally {
                            n = a = 0
                        }
                        if (5 & l[0]) throw l[1];
                        return {
                            value: l[0] ? l[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ay = "Not capturing exception because it's already been captured.",
                av = "Discarded session because of missing or non-string release",
                ab = Symbol.for("SentryInternalError"),
                ah = Symbol.for("SentryDoNotSendEventError");

            function ag(e) {
                return au({
                    message: e
                }, ab, !0)
            }

            function aS(e) {
                return au({
                    message: e
                }, ah, !0)
            }

            function a_(e) {
                return !!e && (void 0 === e ? "undefined" : ad(e)) === "object" && ab in e
            }

            function aE(e) {
                return !!e && (void 0 === e ? "undefined" : ad(e)) === "object" && ah in e
            }

            function aO(e, t, n, r, a) {
                var o, i = 0,
                    u = !1;
                e.on(n, function() {
                    i = 0, clearTimeout(o), u = !1
                }), e.on(t, function(t) {
                    (i += r(t)) >= 8e5 ? a(e) : u || (u = !0, o = setTimeout(function() {
                        a(e)
                    }, 5e3))
                }), e.on("flush", function() {
                    a(e)
                })
            }
            var aw = function() {
                var e;

                function t(e) {
                    if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                    if (this._options = e, this._integrations = {}, this._numProcessing = 0, this._outcomes = {}, this._hooks = {}, this._eventProcessors = [], this._promiseBuffer = ae(null != (f = null == (c = e.transportOptions) ? void 0 : c.bufferSize) ? f : 64), e.dsn ? this._dsn = function(e) {
                            var t = "string" == typeof e ? function(e) {
                                var t, n = nZ.exec(e);
                                if (!n) return void e3(function() {
                                    console.error("Invalid Sentry Dsn: ".concat(e))
                                });
                                var r = (t = n.slice(1), function(e) {
                                        if (Array.isArray(e)) return e
                                    }(t) || function(e, t) {
                                        var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                        if (null != a) {
                                            var o = [],
                                                i = !0,
                                                u = !1;
                                            try {
                                                for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                                            } catch (e) {
                                                u = !0, r = e
                                            } finally {
                                                try {
                                                    i || null == a.return || a.return()
                                                } finally {
                                                    if (u) throw r
                                                }
                                            }
                                            return o
                                        }
                                    }(t, 6) || function(e, t) {
                                        if (e) {
                                            if ("string" == typeof e) return nP(e, 6);
                                            var n = Object.prototype.toString.call(e).slice(8, -1);
                                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return nP(e, t)
                                        }
                                    }(t, 6) || function() {
                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                    }()),
                                    a = r[0],
                                    o = r[1],
                                    i = r[2],
                                    u = r[3],
                                    c = r[4],
                                    l = r[5],
                                    s = "",
                                    f = void 0 === l ? "" : l,
                                    d = f.split("/");
                                if (d.length > 1 && (s = d.slice(0, -1).join("/"), f = d.pop()), f) {
                                    var p = f.match(/^\d+/);
                                    p && (f = p[0])
                                }
                                return nD({
                                    host: void 0 === u ? "" : u,
                                    pass: void 0 === i ? "" : i,
                                    path: s,
                                    projectId: f,
                                    port: void 0 === c ? "" : c,
                                    protocol: a,
                                    publicKey: o
                                })
                            }(e) : nD(e);
                            if (t && function(e) {
                                    if (!eP) return !0;
                                    var t = e.port,
                                        n = e.projectId,
                                        r = e.protocol;
                                    return !["protocol", "publicKey", "host", "projectId"].find(function(t) {
                                        return !e[t] && (e8.error("Invalid Sentry Dsn: ".concat(t, " missing")), !0)
                                    }) && (n.match(/^\d+$/) ? "http" !== r && "https" !== r ? (e8.error("Invalid Sentry Dsn: Invalid protocol ".concat(r)), !1) : !(t && isNaN(parseInt(t, 10))) || (e8.error("Invalid Sentry Dsn: Invalid port ".concat(t)), !1) : (e8.error("Invalid Sentry Dsn: Invalid projectId ".concat(n)), !1))
                                }(t)) return t
                        }(e.dsn) : eP && e8.warn("No DSN provided, client will not send events."), this._dsn) {
                        var n, r, a, o, i, u, c, l, s, f, d, p, m, y = (n = this._dsn, r = e.tunnel, a = e._metadata ? e._metadata.sdk : void 0, r || "".concat("".concat((o = n.protocol ? "".concat(n.protocol, ":") : "", i = n.port ? ":".concat(n.port) : "", "".concat(o, "//").concat(n.host).concat(i).concat(n.path ? "/".concat(n.path) : "", "/api/"))).concat(n.projectId, "/envelope/"), "?").concat((u = {
                            sentry_version: "7"
                        }, n.publicKey && (u.sentry_key = n.publicKey), a && (u.sentry_client = "".concat(a.name, "/").concat(a.version)), new URLSearchParams(u).toString())));
                        this._transport = e.transport(al(ac({
                            tunnel: this._options.tunnel,
                            recordDroppedEvent: this.recordDroppedEvent.bind(this)
                        }, e.transportOptions), {
                            url: y
                        }))
                    }
                    this._options.enableLogs = null != (d = this._options.enableLogs) ? d : null == (l = this._options._experiments) ? void 0 : l.enableLogs, this._options.enableLogs && aO(this, "afterCaptureLog", "flushLogs", ak, r5), (null == (m = null != (p = this._options.enableMetrics) ? p : null == (s = this._options._experiments) ? void 0 : s.enableMetrics) || m) && aO(this, "afterCaptureMetric", "flushMetrics", aN, r4)
                }
                return e = [{
                        key: "captureException",
                        value: function(e, t, n) {
                            var r = this,
                                a = ts();
                            if (ty(e)) return eP && e8.log(ay), a;
                            var o = ac({
                                event_id: a
                            }, t);
                            return this._process(function() {
                                return r.eventFromException(e, o).then(function(e) {
                                    return r._captureEvent(e, o, n)
                                }).then(function(e) {
                                    return e
                                })
                            }, "error"), o.event_id
                        }
                    }, {
                        key: "captureMessage",
                        value: function(e, t, n, r) {
                            var a = this,
                                o = ac({
                                    event_id: ts()
                                }, n),
                                i = eY(e) ? e : String(e),
                                u = eW(e),
                                c = u ? this.eventFromMessage(i, t, o) : this.eventFromException(e, o);
                            return this._process(function() {
                                return c.then(function(e) {
                                    return a._captureEvent(e, o, r)
                                })
                            }, u ? "unknown" : "error"), o.event_id
                        }
                    }, {
                        key: "captureEvent",
                        value: function(e, t, n) {
                            var r = this,
                                a = ts();
                            if ((null == t ? void 0 : t.originalException) && ty(t.originalException)) return eP && e8.log(ay), a;
                            var o = ac({
                                    event_id: a
                                }, t),
                                i = e.sdkProcessingMetadata || {},
                                u = i.capturedSpanScope,
                                c = i.capturedSpanIsolationScope,
                                l = aI(e.type);
                            return this._process(function() {
                                return r._captureEvent(e, o, u || n, c)
                            }, l), o.event_id
                        }
                    }, {
                        key: "captureSession",
                        value: function(e) {
                            this.sendSession(e), tS(e, {
                                init: !1
                            })
                        }
                    }, {
                        key: "getDsn",
                        value: function() {
                            return this._dsn
                        }
                    }, {
                        key: "getOptions",
                        value: function() {
                            return this._options
                        }
                    }, {
                        key: "getSdkMetadata",
                        value: function() {
                            return this._options._metadata
                        }
                    }, {
                        key: "getTransport",
                        value: function() {
                            return this._transport
                        }
                    }, {
                        key: "flush",
                        value: function(e) {
                            return ai(function() {
                                var t, n, r;
                                return am(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            if (!(t = this._transport)) return [2, !0];
                                            return this.emit("flush"), [4, this._isClientDoneProcessing(e)];
                                        case 1:
                                            return n = a.sent(), [4, t.flush(e)];
                                        case 2:
                                            return r = a.sent(), [2, n && r]
                                    }
                                })
                            }).call(this)
                        }
                    }, {
                        key: "close",
                        value: function(e) {
                            return ai(function() {
                                var t;
                                return am(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            return [4, this.flush(e)];
                                        case 1:
                                            return t = n.sent(), this.getOptions().enabled = !1, this.emit("close"), [2, t]
                                    }
                                })
                            }).call(this)
                        }
                    }, {
                        key: "getEventProcessors",
                        value: function() {
                            return this._eventProcessors
                        }
                    }, {
                        key: "addEventProcessor",
                        value: function(e) {
                            this._eventProcessors.push(e)
                        }
                    }, {
                        key: "init",
                        value: function() {
                            (this._isEnabled() || this._options.integrations.some(function(e) {
                                return e.name.startsWith("Spotlight")
                            })) && this._setupIntegrations()
                        }
                    }, {
                        key: "getIntegrationByName",
                        value: function(e) {
                            return this._integrations[e]
                        }
                    }, {
                        key: "addIntegration",
                        value: function(e) {
                            var t = this._integrations[e.name];
                            rB(this, e, this._integrations), t || rW(this, [e])
                        }
                    }, {
                        key: "sendEvent",
                        value: function(e) {
                            var t = this,
                                n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                            this.emit("beforeSendEvent", e, n);
                            var r = (u = this._dsn, c = this._options._metadata, l = this._options.tunnel, s = n1(c), f = e.type && "replay_event" !== e.type ? e.type : "event", ! function(e, t) {
                                    if (t) {
                                        var n, r, a, o, i, u, c = e.sdk || {};
                                        n = n9({}, c), r = r = {
                                            name: c.name || t.name,
                                            version: c.version || t.version,
                                            integrations: n4((null == (a = e.sdk) ? void 0 : a.integrations) || []).concat(n4(t.integrations || [])),
                                            packages: n4((null == (o = e.sdk) ? void 0 : o.packages) || []).concat(n4(t.packages || [])),
                                            settings: (null == (i = e.sdk) ? void 0 : i.settings) || t.settings ? n9({}, null == (u = e.sdk) ? void 0 : u.settings, t.settings) : void 0
                                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(r)) : (function(e, t) {
                                            var n = Object.keys(e);
                                            if (Object.getOwnPropertySymbols) {
                                                var r = Object.getOwnPropertySymbols(e);
                                                n.push.apply(n, r)
                                            }
                                            return n
                                        })(Object(r)).forEach(function(e) {
                                            Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(r, e))
                                        }), e.sdk = n
                                    }
                                }(e, null == c ? void 0 : c.sdk), p = null == (d = e.sdkProcessingMetadata) ? void 0 : d.dynamicSamplingContext, m = function(e) {
                                    for (var t = 1; t < arguments.length; t++) {
                                        var n = null != arguments[t] ? arguments[t] : {},
                                            r = Object.keys(n);
                                        "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                            return Object.getOwnPropertyDescriptor(n, e).enumerable
                                        }))), r.forEach(function(t) {
                                            var r;
                                            r = n[t], t in e ? Object.defineProperty(e, t, {
                                                value: r,
                                                enumerable: !0,
                                                configurable: !0,
                                                writable: !0
                                            }) : e[t] = r
                                        })
                                    }
                                    return e
                                }({
                                    event_id: e.event_id,
                                    sent_at: new Date().toISOString()
                                }, s && {
                                    sdk: s
                                }, !!l && u && {
                                    dsn: nC(u)
                                }, p && {
                                    trace: p
                                }), delete e.sdkProcessingMetadata, nz(m, [
                                    [{
                                        type: f
                                    }, e]
                                ])),
                                a = !0,
                                o = !1,
                                i = void 0;
                            try {
                                for (var u, c, l, s, f, d, p, m, y, v = (n.attachments || [])[Symbol.iterator](); !(a = (y = v.next()).done); a = !0) {
                                    var b = y.value;
                                    r = function(e, t) {
                                        var n, r = nJ(e, 2);
                                        return [r[0], ((function(e) {
                                            if (Array.isArray(e)) return nM(e)
                                        })(n = r[1]) || function(e) {
                                            if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                        }(n) || nK(n) || function() {
                                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                        }()).concat([t])]
                                    }(r, function(e) {
                                        var t = "string" == typeof e.data ? nq(e.data) : e.data;
                                        return [{
                                            type: "attachment",
                                            length: t.length,
                                            filename: e.filename,
                                            content_type: e.contentType,
                                            attachment_type: e.attachmentType
                                        }, t]
                                    }(b))
                                }
                            } catch (e) {
                                o = !0, i = e
                            } finally {
                                try {
                                    a || null == v.return || v.return()
                                } finally {
                                    if (o) throw i
                                }
                            }
                            this.sendEnvelope(r).then(function(n) {
                                return t.emit("afterSendEvent", e, n)
                            })
                        }
                    }, {
                        key: "sendSession",
                        value: function(e) {
                            var t, n, r, a, o = this._options,
                                i = o.release,
                                u = o.environment,
                                c = void 0 === u ? nR : u;
                            if ("aggregates" in e) {
                                var l = e.attrs || {};
                                if (!l.release && !i) {
                                    eP && e8.warn(av);
                                    return
                                }
                                l.release = l.release || i, l.environment = l.environment || c, e.attrs = l
                            } else {
                                if (!e.release && !i) {
                                    eP && e8.warn(av);
                                    return
                                }
                                e.release = e.release || i, e.environment = e.environment || c
                            }
                            this.emit("beforeSendSession", e);
                            var s = (t = this._dsn, n = this._options._metadata, r = this._options.tunnel, a = n1(n), nz(n9({
                                sent_at: new Date().toISOString()
                            }, a && {
                                sdk: a
                            }, !!r && t && {
                                dsn: nC(t)
                            }), ["aggregates" in e ? [{
                                type: "sessions"
                            }, e] : [{
                                type: "session"
                            }, e.toJSON()]]));
                            this.sendEnvelope(s)
                        }
                    }, {
                        key: "recordDroppedEvent",
                        value: function(e, t) {
                            var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 1;
                            if (this._options.sendClientReports) {
                                var r = "".concat(e, ":").concat(t);
                                eP && e8.log('Recording outcome: "'.concat(r, '"').concat(n > 1 ? " (".concat(n, " times)") : "")), this._outcomes[r] = (this._outcomes[r] || 0) + n
                            }
                        }
                    }, {
                        key: "on",
                        value: function(e, t) {
                            var n = this._hooks[e] = this._hooks[e] || new Set,
                                r = function() {
                                    for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                                    return t.apply(void 0, af(n))
                                };
                            return n.add(r),
                                function() {
                                    n.delete(r)
                                }
                        }
                    }, {
                        key: "emit",
                        value: function(e) {
                            for (var t = arguments.length, n = Array(t > 1 ? t - 1 : 0), r = 1; r < t; r++) n[r - 1] = arguments[r];
                            var a = this._hooks[e];
                            a && a.forEach(function(e) {
                                return e.apply(void 0, af(n))
                            })
                        }
                    }, {
                        key: "sendEnvelope",
                        value: function(e) {
                            return ai(function() {
                                var t;
                                return am(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            if (this.emit("beforeEnvelope", e), !(this._isEnabled() && this._transport)) return [3, 4];
                                            n.label = 1;
                                        case 1:
                                            return n.trys.push([1, 3, , 4]), [4, this._transport.send(e)];
                                        case 2:
                                            return [2, n.sent()];
                                        case 3:
                                            return t = n.sent(), eP && e8.error("Error while sending envelope:", t), [2, {}];
                                        case 4:
                                            return eP && e8.error("Transport disabled"), [2, {}]
                                    }
                                })
                            }).call(this)
                        }
                    }, {
                        key: "_setupIntegrations",
                        value: function() {
                            var e, t, n = this._options.integrations;
                            this._integrations = (e = this, t = {}, n.forEach(function(n) {
                                n && rB(e, n, t)
                            }), t), rW(this, n)
                        }
                    }, {
                        key: "_updateSessionFromEvent",
                        value: function(e, t) {
                            var n = "fatal" === t.level,
                                r = !1,
                                a = null == (l = t.exception) ? void 0 : l.values;
                            if (a) {
                                r = !0, n = !1;
                                var o = !0,
                                    i = !1,
                                    u = void 0;
                                try {
                                    for (var c, l, s, f = a[Symbol.iterator](); !(o = (s = f.next()).done); o = !0)
                                        if ((null == (c = s.value.mechanism) ? void 0 : c.handled) === !1) {
                                            n = !0;
                                            break
                                        }
                                } catch (e) {
                                    i = !0, u = e
                                } finally {
                                    try {
                                        o || null == f.return || f.return()
                                    } finally {
                                        if (i) throw u
                                    }
                                }
                            }
                            var d = "ok" === e.status;
                            (d && 0 === e.errors || d && n) && (tS(e, al(ac({}, n && {
                                status: "crashed"
                            }), {
                                errors: e.errors || Number(r || n)
                            })), this.captureSession(e))
                        }
                    }, {
                        key: "_isClientDoneProcessing",
                        value: function(e) {
                            return ai(function() {
                                var t;
                                return am(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            t = 0, n.label = 1;
                                        case 1:
                                            if (!(!e || t < e)) return [3, 3];
                                            return [4, new Promise(function(e) {
                                                return setTimeout(e, 1)
                                            })];
                                        case 2:
                                            if (n.sent(), !this._numProcessing) return [2, !0];
                                            return t++, [3, 1];
                                        case 3:
                                            return [2, !1]
                                    }
                                })
                            }).call(this)
                        }
                    }, {
                        key: "_isEnabled",
                        value: function() {
                            return !1 !== this.getOptions().enabled && void 0 !== this._transport
                        }
                    }, {
                        key: "_prepareEvent",
                        value: function(e, t, n, r) {
                            var a, o, i, u, c, l, s, f, d, p, m, y, v, b, h, g, S, _, E, O, w, I, A, T, N, k, j, x, R, P, V, Z, C, D, W, B, G, U, M, J, K, z, H, Q, q, $, ee, et = this,
                                en = this.getOptions(),
                                er = Object.keys(this._integrations);
                            return !t.integrations && (null == er ? void 0 : er.length) && (t.integrations = er), this.emit("preprocessEvent", e, t), e.type || r.setLastEventId(e.event_id || t.event_id), (Z = void 0 === (V = en.normalizeDepth) ? 3 : V, D = void 0 === (C = en.normalizeMaxBreadth) ? 1e3 : C, W = rT({}, e), B = B = {
                                event_id: e.event_id || t.event_id || ts(),
                                timestamp: e.timestamp || tv()
                            }, Object.getOwnPropertyDescriptors ? Object.defineProperties(W, Object.getOwnPropertyDescriptors(B)) : (function(e, t) {
                                var n = Object.keys(e);
                                if (Object.getOwnPropertySymbols) {
                                    var r = Object.getOwnPropertySymbols(e);
                                    n.push.apply(n, r)
                                }
                                return n
                            })(Object(B)).forEach(function(e) {
                                Object.defineProperty(W, e, Object.getOwnPropertyDescriptor(B, e))
                            }), G = W, U = t.integrations || en.integrations.map(function(e) {
                                return e.name
                            }), a = G, c = (o = en).environment, l = o.release, s = o.dist, f = o.maxValueLength, a.environment = a.environment || c || nR, !a.release && l && (a.release = l), !a.dist && s && (a.dist = s), (null == (d = a.request) ? void 0 : d.url) && f && (d.url = tZ(d.url, f)), f && (null == (u = a.exception) || null == (i = u.values) || i.forEach(function(e) {
                                e.value && (e.value = tZ(e.value, f))
                            })), p = G, (m = U).length > 0 && (p.sdk = p.sdk || {}, p.sdk.integrations = rN(p.sdk.integrations || []).concat(rN(m))), this && this.emit("applyFrameMetadata", e), void 0 === e.type && (y = G, h = function(e) {
                                var t = ek._sentryDebugIds,
                                    n = ek._debugIds;
                                if (!t && !n) return {};
                                var r = t ? Object.keys(t) : [],
                                    a = n ? Object.keys(n) : [];
                                if (Y && r.length === L && a.length === X) return Y;
                                L = r.length, X = a.length, Y = {}, F || (F = {});
                                var o = function(t, n) {
                                    var r = !0,
                                        a = !1,
                                        o = void 0;
                                    try {
                                        for (var i, u = t[Symbol.iterator](); !(r = (i = u.next()).done); r = !0) {
                                            var c = i.value,
                                                l = n[c],
                                                s = null == F ? void 0 : F[c];
                                            if (s && Y && l) Y[s[0]] = l, F && (F[c] = [s[0], l]);
                                            else if (l)
                                                for (var f = e(c), d = f.length - 1; d >= 0; d--) {
                                                    var p = f[d],
                                                        m = null == p ? void 0 : p.filename;
                                                    if (m && Y && F) {
                                                        Y[m] = l, F[c] = [m, l];
                                                        break
                                                    }
                                                }
                                        }
                                    } catch (e) {
                                        a = !0, o = e
                                    } finally {
                                        try {
                                            r || null == u.return || u.return()
                                        } finally {
                                            if (a) throw o
                                        }
                                    }
                                };
                                return t && o(r, t), n && o(a, n), Y
                            }(en.stackParser), null == (b = y.exception) || null == (v = b.values) || v.forEach(function(e) {
                                var t, n;
                                null == (n = e.stacktrace) || null == (t = n.frames) || t.forEach(function(e) {
                                    e.filename && (e.debug_id = h[e.filename])
                                })
                            })), M = function(e, t) {
                                if (!t) return e;
                                var n = e ? e.clone() : new tG;
                                return n.update(t), n
                            }(n, t.captureContext), t.mechanism && tm(G, t.mechanism), J = this ? this.getEventProcessors() : [], K = eR("globalScope", function() {
                                return new tG
                            }).getScopeData(), r && rw(K, r.getScopeData()), M && rw(K, M.getScopeData()), z = K, (H = rN(t.attachments || []).concat(rN(z.attachments))).length && (t.attachments = H), Q = z.fingerprint, q = z.span, $ = z.breadcrumbs, ee = z.sdkProcessingMetadata, g = G, _ = (S = z).extra, E = S.tags, O = S.user, w = S.contexts, I = S.level, A = S.transactionName, Object.keys(_).length && (g.extra = rE({}, _, g.extra)), Object.keys(E).length && (g.tags = rE({}, E, g.tags)), Object.keys(O).length && (g.user = rE({}, O, g.user)), Object.keys(w).length && (g.contexts = rE({}, w, g.contexts)), I && (g.level = I), A && "transaction" !== g.type && (g.transaction = A), q && function(e, t) {
                                e.contexts = rE({
                                    trace: (r = (n = t.spanContext()).spanId, a = n.traceId, i = (o = n.isRemote) ? r : nE(t).parent_span_id, u = nc(t).scope, {
                                        parent_span_id: i,
                                        span_id: o ? (null == u ? void 0 : u.getPropagationContext().propagationSpanId) || tE() : r,
                                        trace_id: a
                                    })
                                }, e.contexts), e.sdkProcessingMetadata = rE({
                                    dynamicSamplingContext: nY(t)
                                }, e.sdkProcessingMetadata);
                                var n, r, a, o, i, u, c = nE(nk(t)).description;
                                c && !e.transaction && "transaction" === e.type && (e.transaction = c)
                            }(G, q), T = G, N = Q, T.fingerprint = T.fingerprint ? Array.isArray(T.fingerprint) ? T.fingerprint : [T.fingerprint] : [], N && (T.fingerprint = T.fingerprint.concat(N)), T.fingerprint.length || delete T.fingerprint, k = G, j = $, x = rO(k.breadcrumbs || []).concat(rO(j)), k.breadcrumbs = x.length ? x : void 0, R = G, P = ee, R.sdkProcessingMetadata = rE({}, R.sdkProcessingMetadata, P), (function(e, t, n) {
                                var r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : 0;
                                try {
                                    var a = function e(t, n, r, a) {
                                        var o = r[a];
                                        if (!t || !o) return t;
                                        var i = o(function(e) {
                                            for (var t = 1; t < arguments.length; t++) {
                                                var n = null != arguments[t] ? arguments[t] : {},
                                                    r = Object.keys(n);
                                                "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                                    return Object.getOwnPropertyDescriptor(n, e).enumerable
                                                }))), r.forEach(function(t) {
                                                    var r;
                                                    r = n[t], t in e ? Object.defineProperty(e, t, {
                                                        value: r,
                                                        enumerable: !0,
                                                        configurable: !0,
                                                        writable: !0
                                                    }) : e[t] = r
                                                })
                                            }
                                            return e
                                        }({}, t), n);
                                        return (eP && null === i && e8.log('Event processor "'.concat(o.id || "?", '" dropped event')), eU(i)) ? i.then(function(t) {
                                            return e(t, n, r, a + 1)
                                        }) : e(i, n, r, a + 1)
                                    }(t, n, e, r);
                                    return eU(a) ? a : rh(a)
                                } catch (e) {
                                    return rg(e)
                                }
                            })(rN(J).concat(rN(z.eventProcessors)), G, t).then(function(e) {
                                return (e && function(e) {
                                    var t, n, r = {};
                                    if (null == (n = e.exception) || null == (t = n.values) || t.forEach(function(e) {
                                            var t, n;
                                            null == (n = e.stacktrace) || null == (t = n.frames) || t.forEach(function(e) {
                                                e.debug_id && (e.abs_path ? r[e.abs_path] = e.debug_id : e.filename && (r[e.filename] = e.debug_id), delete e.debug_id)
                                            })
                                        }), 0 !== Object.keys(r).length) {
                                        e.debug_meta = e.debug_meta || {}, e.debug_meta.images = e.debug_meta.images || [];
                                        var a = e.debug_meta.images;
                                        Object.entries(r).forEach(function(e) {
                                            var t = function(e) {
                                                    if (Array.isArray(e)) return e
                                                }(e) || function(e, t) {
                                                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                                    if (null != a) {
                                                        var o = [],
                                                            i = !0,
                                                            u = !1;
                                                        try {
                                                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                                                        } catch (e) {
                                                            u = !0, r = e
                                                        } finally {
                                                            try {
                                                                i || null == a.return || a.return()
                                                            } finally {
                                                                if (u) throw r
                                                            }
                                                        }
                                                        return o
                                                    }
                                                }(e, 2) || rk(e, 2) || function() {
                                                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                                }(),
                                                n = t[0],
                                                r = t[1];
                                            a.push({
                                                type: "sourcemap",
                                                code_file: n,
                                                debug_id: r
                                            })
                                        })
                                    }
                                }(e), "number" == typeof Z && Z > 0) ? function(e, t, n) {
                                    if (!e) return null;
                                    var r, a, o = rT({}, e, e.breadcrumbs && {
                                        breadcrumbs: e.breadcrumbs.map(function(e) {
                                            return rT({}, e, e.data && {
                                                data: nU(e.data, t, n)
                                            })
                                        })
                                    }, e.user && {
                                        user: nU(e.user, t, n)
                                    }, e.contexts && {
                                        contexts: nU(e.contexts, t, n)
                                    }, e.extra && {
                                        extra: nU(e.extra, t, n)
                                    });
                                    return (null == (r = e.contexts) ? void 0 : r.trace) && o.contexts && (o.contexts.trace = e.contexts.trace, e.contexts.trace.data && (o.contexts.trace.data = nU(e.contexts.trace.data, t, n))), e.spans && (o.spans = e.spans.map(function(e) {
                                        return rT({}, e, e.data && {
                                            data: nU(e.data, t, n)
                                        })
                                    })), (null == (a = e.contexts) ? void 0 : a.flags) && o.contexts && (o.contexts.flags = nU(e.contexts.flags, 3, n)), o
                                }(e, Z, D) : e
                            })).then(function(e) {
                                var r, a, o, i;
                                return null === e ? e : (et.emit("postprocessEvent", e, t), e.contexts = ac({
                                    trace: (a = (r = n.getPropagationContext()).traceId, o = r.parentSpanId, i = {
                                        trace_id: a,
                                        span_id: r.propagationSpanId || tE()
                                    }, o && (i.parent_span_id = o), i)
                                }, e.contexts), e.sdkProcessingMetadata = ac({
                                    dynamicSamplingContext: nX(et, n)
                                }, e.sdkProcessingMetadata), e)
                            })
                        }
                    }, {
                        key: "_captureEvent",
                        value: function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : tq(),
                                r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : t$();
                            return eP && aA(e) && e8.log("Captured error event `".concat(rG(e)[0] || "<unknown>", "`")), this._processEvent(e, t, n, r).then(function(e) {
                                return e.event_id
                            }, function(e) {
                                eP && (aE(e) ? e8.log(e.message) : a_(e) ? e8.warn(e.message) : e8.warn(e))
                            })
                        }
                    }, {
                        key: "_processEvent",
                        value: function(e, t, n, r) {
                            var a = this,
                                o = this.getOptions(),
                                i = o.sampleRate,
                                u = aT(e),
                                c = aA(e),
                                l = e.type || "error",
                                s = "before send for type `".concat(l, "`"),
                                f = void 0 === i ? void 0 : na(i);
                            if (c && "number" == typeof f && tu() > f) return this.recordDroppedEvent("sample_rate", "error"), rg(aS("Discarding event because it's not included in the random sample (sampling rate = ".concat(i, ")")));
                            var d = aI(e.type);
                            return this._prepareEvent(e, t, n, r).then(function(e) {
                                if (null === e) throw a.recordDroppedEvent("event_processor", d), aS("An event processor returned `null`, will not send event.");
                                return t.data && !0 === t.data.__sentry__ ? e : function(e, t) {
                                    var n = "".concat(t, " must return `null` or a valid event.");
                                    if (eU(e)) return e.then(function(e) {
                                        if (!eB(e) && null !== e) throw ag(n);
                                        return e
                                    }, function(e) {
                                        throw ag("".concat(t, " rejected with ").concat(e))
                                    });
                                    if (!eB(e) && null !== e) throw ag(n);
                                    return e
                                }(function(e, t, n, r) {
                                    var a = t.beforeSend,
                                        o = t.beforeSendTransaction,
                                        i = t.beforeSendSpan,
                                        u = t.ignoreSpans,
                                        c = n;
                                    if (aA(c) && a) return a(c, r);
                                    if (aT(c)) {
                                        if (i || u) {
                                            var l = (y = (m = null != (d = null == (f = (s = c).contexts) ? void 0 : f.trace) ? d : {}).trace_id, v = m.parent_span_id, b = m.span_id, h = m.status, g = m.origin, S = m.data, _ = m.op, {
                                                data: null != S ? S : {},
                                                description: s.transaction,
                                                op: _,
                                                parent_span_id: v,
                                                span_id: null != b ? b : "",
                                                start_timestamp: null != (p = s.start_timestamp) ? p : 0,
                                                status: h,
                                                timestamp: s.timestamp,
                                                trace_id: null != y ? y : "",
                                                origin: g,
                                                profile_id: null == S ? void 0 : S[nt],
                                                exclusive_time: null == S ? void 0 : S[nn],
                                                measurements: s.measurements,
                                                is_segment: !0
                                            });
                                            if ((null == u ? void 0 : u.length) && n3(l, u)) return null;
                                            if (i) {
                                                var s, f, d, p, m, y, v, b, h, g, S, _, E = i(l);
                                                E ? c = t_(n, {
                                                    type: "transaction",
                                                    timestamp: E.timestamp,
                                                    start_timestamp: E.start_timestamp,
                                                    transaction: E.description,
                                                    contexts: {
                                                        trace: {
                                                            trace_id: E.trace_id,
                                                            span_id: E.span_id,
                                                            parent_span_id: E.parent_span_id,
                                                            op: E.op,
                                                            status: E.status,
                                                            origin: E.origin,
                                                            data: function(e) {
                                                                for (var t = 1; t < arguments.length; t++) {
                                                                    var n = null != arguments[t] ? arguments[t] : {},
                                                                        r = Object.keys(n);
                                                                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                                                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                                                                    }))), r.forEach(function(t) {
                                                                        ar(e, t, n[t])
                                                                    })
                                                                }
                                                                return e
                                                            }({}, E.data, E.profile_id && ar({}, nt, E.profile_id), E.exclusive_time && ar({}, nn, E.exclusive_time))
                                                        }
                                                    },
                                                    measurements: E.measurements
                                                }) : nx()
                                            }
                                            if (c.spans) {
                                                var O = [],
                                                    w = c.spans,
                                                    I = !0,
                                                    A = !1,
                                                    T = void 0;
                                                try {
                                                    for (var N, k = w[Symbol.iterator](); !(I = (N = k.next()).done); I = !0) {
                                                        var j = N.value;
                                                        if ((null == u ? void 0 : u.length) && n3(j, u)) {
                                                            ! function(e, t) {
                                                                var n = t.parent_span_id,
                                                                    r = t.span_id;
                                                                if (n) {
                                                                    var a = !0,
                                                                        o = !1,
                                                                        i = void 0;
                                                                    try {
                                                                        for (var u, c = e[Symbol.iterator](); !(a = (u = c.next()).done); a = !0) {
                                                                            var l = u.value;
                                                                            l.parent_span_id === r && (l.parent_span_id = n)
                                                                        }
                                                                    } catch (e) {
                                                                        o = !0, i = e
                                                                    } finally {
                                                                        try {
                                                                            a || null == c.return || c.return()
                                                                        } finally {
                                                                            if (o) throw i
                                                                        }
                                                                    }
                                                                }
                                                            }(w, j);
                                                            continue
                                                        }
                                                        if (i) {
                                                            var x = i(j);
                                                            x ? O.push(x) : (nx(), O.push(j))
                                                        } else O.push(j)
                                                    }
                                                } catch (e) {
                                                    A = !0, T = e
                                                } finally {
                                                    try {
                                                        I || null == k.return || k.return()
                                                    } finally {
                                                        if (A) throw T
                                                    }
                                                }
                                                var R = c.spans.length - O.length;
                                                R && e.recordDroppedEvent("before_send", "span", R), c.spans = O
                                            }
                                        }
                                        if (o) {
                                            if (c.spans) {
                                                var P = c.spans.length;
                                                c.sdkProcessingMetadata = al(ac({}, n.sdkProcessingMetadata), {
                                                    spanCountBeforeProcessing: P
                                                })
                                            }
                                            return o(c, r)
                                        }
                                    }
                                    return c
                                }(a, o, e, t), s)
                            }).then(function(o) {
                                if (null === o) {
                                    if (a.recordDroppedEvent("before_send", d), u) {
                                        var i = 1 + (e.spans || []).length;
                                        a.recordDroppedEvent("before_send", "span", i)
                                    }
                                    throw aS("".concat(s, " returned `null`, will not send event."))
                                }
                                var l = n.getSession() || r.getSession();
                                if (c && l && a._updateSessionFromEvent(l, o), u) {
                                    var f, p = ((null == (f = o.sdkProcessingMetadata) ? void 0 : f.spanCountBeforeProcessing) || 0) - (o.spans ? o.spans.length : 0);
                                    p > 0 && a.recordDroppedEvent("before_send", "span", p)
                                }
                                var m = o.transaction_info;
                                return u && m && o.transaction !== e.transaction && (o.transaction_info = al(ac({}, m), {
                                    source: "custom"
                                })), a.sendEvent(o, t), o
                            }).then(null, function(e) {
                                if (aE(e) || a_(e)) throw e;
                                throw a.captureException(e, {
                                    mechanism: {
                                        handled: !1,
                                        type: "internal"
                                    },
                                    data: {
                                        __sentry__: !0
                                    },
                                    originalException: e
                                }), ag("Event processing pipeline threw an error, original event will not be sent. Details have been sent as a new event.\nReason: ".concat(e))
                            })
                        }
                    }, {
                        key: "_process",
                        value: function(e, t) {
                            var n = this;
                            this._numProcessing++, this._promiseBuffer.add(e).then(function(e) {
                                return n._numProcessing--, e
                            }, function(e) {
                                return n._numProcessing--, e === r7 && n.recordDroppedEvent("queue_overflow", t), e
                            })
                        }
                    }, {
                        key: "_clearOutcomes",
                        value: function() {
                            var e = this._outcomes;
                            return this._outcomes = {}, Object.entries(e).map(function(e) {
                                var t = as(e, 2),
                                    n = t[0],
                                    r = t[1],
                                    a = as(n.split(":"), 2);
                                return {
                                    reason: a[0],
                                    category: a[1],
                                    quantity: r
                                }
                            })
                        }
                    }, {
                        key: "_flushOutcomes",
                        value: function() {
                            eP && e8.log("Flushing outcomes...");
                            var e, t = this._clearOutcomes();
                            if (0 === t.length) {
                                eP && e8.log("No outcomes to send");
                                return
                            }
                            if (!this._dsn) {
                                eP && e8.log("No dsn provided, will not send outcomes");
                                return
                            }
                            eP && e8.log("Sending outcomes:", t);
                            var n = nz((e = this._options.tunnel && nC(this._dsn)) ? {
                                dsn: e
                            } : {}, [
                                [{
                                    type: "client_report"
                                }, {
                                    timestamp: tv(),
                                    discarded_events: t
                                }]
                            ]);
                            this.sendEnvelope(n)
                        }
                    }],
                    function(e, t) {
                        for (var n = 0; n < t.length; n++) {
                            var r = t[n];
                            r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                        }
                    }(t.prototype, e), t
            }();

            function aI(e) {
                return "replay_event" === e ? "replay" : e || "error"
            }

            function aA(e) {
                return void 0 === e.type
            }

            function aT(e) {
                return "transaction" === e.type
            }

            function aN(e) {
                var t = 0;
                return e.name && (t += 2 * e.name.length), (t += 8) + aj(e.attributes)
            }

            function ak(e) {
                var t = 0;
                return e.message && (t += 2 * e.message.length), t + aj(e.attributes)
            }

            function aj(e) {
                if (!e) return 0;
                var t = 0;
                return Object.values(e).forEach(function(e) {
                    Array.isArray(e) ? t += e.length * ax(e[0]) : eW(e) ? t += ax(e) : t += 100
                }), t
            }

            function ax(e) {
                return "string" == typeof e ? 2 * e.length : "number" == typeof e ? 8 : 4 * ("boolean" == typeof e)
            }

            function aR(e) {
                return eC(e) && "__sentry_fetch_url_host__" in e && "string" == typeof e.__sentry_fetch_url_host__ ? "".concat(e.message, " (").concat(e.__sentry_fetch_url_host__, ")") : e.message
            }

            function aP(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function aV(e, t) {
                var n, r, a, o, i = aC(e, t),
                    u = {
                        type: !(r = null == (n = t) ? void 0 : n.name) && aF(n) ? n.message && Array.isArray(n.message) && 2 == n.message.length ? n.message[0] : "WebAssembly.Exception" : r,
                        value: (o = null == (a = t) ? void 0 : a.message, aF(a) ? Array.isArray(a.message) && 2 == a.message.length ? a.message[1] : "wasm exception" : o ? o.error && "string" == typeof o.error.message ? aR(o.error) : aR(a) : "No error message")
                    };
                return i.length && (u.stacktrace = {
                    frames: i
                }), void 0 === u.type && "" === u.value && (u.value = "Unrecoverable error caught"), u
            }

            function aZ(e, t) {
                return {
                    exception: {
                        values: [aV(e, t)]
                    }
                }
            }

            function aC(e, t) {
                var n, r, a = t.stacktrace || t.stack || "",
                    o = (n = t) && aD.test(n.message) ? 1 : 0,
                    i = "number" == typeof(r = t).framesToPop ? r.framesToPop : 0;
                try {
                    return e(a, o, i)
                } catch (e) {}
                return []
            }
            var aD = /Minified React error #\d+;/i;

            function aF(e) {
                return "undefined" != typeof WebAssembly && void 0 !== WebAssembly.Exception && aP(e, WebAssembly.Exception)
            }

            function aL(e, t, n, r, a) {
                var o;
                if (eF(t) && t.error) return aZ(e, t.error);
                if (eL(t) || eD(t, "DOMException")) {
                    if ("stack" in t) o = aZ(e, t);
                    else {
                        var i, u, c = t.name || (eL(t) ? "DOMError" : "DOMException"),
                            l = t.message ? "".concat(c, ": ").concat(t.message) : c;
                        tp(o = aX(e, l, n, r), l)
                    }
                    return "code" in t && (o.tags = (i = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({}, o.tags), u = u = {
                        "DOMException.code": "".concat(t.code)
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(i, Object.getOwnPropertyDescriptors(u)) : (function(e, t) {
                        var n = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            n.push.apply(n, r)
                        }
                        return n
                    })(Object(u)).forEach(function(e) {
                        Object.defineProperty(i, e, Object.getOwnPropertyDescriptor(u, e))
                    }), i)), o
                }
                return eC(t) ? aZ(e, t) : (eB(t) || eG(t) ? tm(o = function(e, t, n, r) {
                    var a = t1(),
                        o = null == a ? void 0 : a.getOptions().normalizeDepth,
                        i = function(e) {
                            for (var t in e)
                                if (Object.prototype.hasOwnProperty.call(e, t)) {
                                    var n = e[t];
                                    if (aP(n, Error)) return n
                                }
                        }(t),
                        u = {
                            __serialized__: function e(t) {
                                var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 3,
                                    r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 102400,
                                    a = nU(t, n);
                                return ~-encodeURI(JSON.stringify(a)).split(/%..|./).length > r ? e(t, n - 1, r) : a
                            }(t, o)
                        };
                    if (i) return {
                        exception: {
                            values: [aV(e, i)]
                        },
                        extra: u
                    };
                    var c = {
                        exception: {
                            values: [{
                                type: eG(t) ? t.constructor.name : r ? "UnhandledRejection" : "Error",
                                value: function(e, t) {
                                    var n, r = t.isUnhandledRejection,
                                        a = ((n = Object.keys(tr(e))).sort(), n[0] ? n.join(", ") : "[object has no keys]"),
                                        o = r ? "promise rejection" : "exception";
                                    if (eF(e)) return "Event `ErrorEvent` captured as ".concat(o, " with message `").concat(e.message, "`");
                                    if (eG(e)) {
                                        var i = function(e) {
                                            try {
                                                var t = Object.getPrototypeOf(e);
                                                return t ? t.constructor.name : void 0
                                            } catch (e) {}
                                        }(e);
                                        return "Event `".concat(i, "` (type=").concat(e.type, ") captured as ").concat(o)
                                    }
                                    return "Object captured as ".concat(o, " with keys: ").concat(a)
                                }(t, {
                                    isUnhandledRejection: r
                                })
                            }]
                        },
                        extra: u
                    };
                    if (n) {
                        var l = aC(e, n);
                        l.length && (c.exception.values[0].stacktrace = {
                            frames: l
                        })
                    }
                    return c
                }(e, t, n, a), {
                    synthetic: !0
                }) : (tp(o = aX(e, t, n, r), "".concat(t), void 0), tm(o, {
                    synthetic: !0
                })), o)
            }

            function aX(e, t, n, r) {
                var a = {};
                if (r && n) {
                    var o = aC(e, n);
                    o.length && (a.exception = {
                        values: [{
                            value: t,
                            stacktrace: {
                                frames: o
                            }
                        }]
                    }), tm(a, {
                        synthetic: !0
                    })
                }
                return eY(t) ? a.logentry = {
                    message: t.__sentry_template_string__,
                    params: t.__sentry_template_values__
                } : a.message = t, a
            }

            function aY(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }
            var aW = 0;

            function aB(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                if ("function" != typeof e) return e;
                try {
                    var n = e.__sentry_wrapped__;
                    if (n)
                        if ("function" == typeof n) return n;
                        else return e;
                    if (tn(e)) return e
                } catch (t) {
                    return e
                }
                var r = function() {
                    for (var n = arguments.length, r = Array(n), a = 0; a < n; a++) r[a] = arguments[a];
                    try {
                        var o = r.map(function(e) {
                            return aB(e, t)
                        });
                        return e.apply(this, o)
                    } catch (e) {
                        throw aW++, setTimeout(function() {
                            aW--
                        }), t0(function(n) {
                            n.addEventProcessor(function(e) {
                                var n, a;
                                return t.mechanism && (tp(e, void 0, void 0), tm(e, t.mechanism)), n = aY({}, e.extra), a = a = {
                                    arguments: r
                                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(a)) : (function(e, t) {
                                    var n = Object.keys(e);
                                    if (Object.getOwnPropertySymbols) {
                                        var r = Object.getOwnPropertySymbols(e);
                                        n.push.apply(n, r)
                                    }
                                    return n
                                })(Object(a)).forEach(function(e) {
                                    Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(a, e))
                                }), e.extra = n, e
                            }), rR(e)
                        }), e
                    }
                };
                try {
                    for (var a in e) Object.prototype.hasOwnProperty.call(e, a) && (r[a] = e[a])
                } catch (e) {}
                tt(r, e), te(e, "__sentry_wrapped__", r);
                try {
                    Object.getOwnPropertyDescriptor(r, "name").configurable && Object.defineProperty(r, "name", {
                        get: function() {
                            return e.name
                        }
                    })
                } catch (e) {}
                return r
            }

            function aG() {
                var e = eQ(),
                    t = (ek.document || {}).referrer,
                    n = (ek.navigator || {}).userAgent;
                return {
                    url: e,
                    headers: aY({}, t && {
                        Referer: t
                    }, n && {
                        "User-Agent": n
                    })
                }
            }

            function aU(e, t, n) {
                return (aU = "undefined" != typeof Reflect && Reflect.get ? Reflect.get : function(e, t, n) {
                    var r = function(e, t) {
                        for (; !Object.prototype.hasOwnProperty.call(e, t) && null !== (e = aM(e)););
                        return e
                    }(e, t);
                    if (r) {
                        var a = Object.getOwnPropertyDescriptor(r, t);
                        return a.get ? a.get.call(n || e) : a.value
                    }
                })(e, t, n || e)
            }

            function aM(e) {
                return (aM = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function aJ(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function aK(e, t) {
                return (aK = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function az() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (az = function() {
                    return !!e
                })()
            }
            var aH = function(e) {
                    var t;
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function n(e) {
                        if (!(this instanceof n)) throw TypeError("Cannot call a class as a function");
                        var t, r, a, o, i, u, c, l = (a = e, aJ({
                            release: "string" == typeof __SENTRY_RELEASE__ ? __SENTRY_RELEASE__ : null == (o = ek.SENTRY_RELEASE) ? void 0 : o.id,
                            sendClientReports: !0,
                            parentSpanIsAlwaysRootSpan: !0
                        }, a));
                        ! function(e, t) {
                            var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : [t],
                                r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : "npm",
                                a = e._metadata || {};
                            a.sdk || (a.sdk = {
                                name: "sentry.javascript.".concat(t),
                                packages: n.map(function(e) {
                                    return {
                                        name: "".concat(r, ":@sentry/").concat(e),
                                        version: eN
                                    }
                                }),
                                version: eN
                            }), e._metadata = a
                        }(l, "browser", ["browser"], ek.SENTRY_SDK_SOURCE || (0, r3.e)()), (null == (u = l._metadata) ? void 0 : u.sdk) && (l._metadata.sdk.settings = aJ({
                            infer_ip: l.sendDefaultPii ? "auto" : "never"
                        }, l._metadata.sdk.settings)), t = n, r = [l], t = aM(t);
                        var s = (i = function(e, t) {
                                var n;
                                if (t && ("object" == ((n = t) && "undefined" != typeof Symbol && n.constructor === Symbol ? "symbol" : typeof n) || "function" == typeof t)) return t;
                                if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                                return e
                            }(this, az() ? Reflect.construct(t, r || [], aM(this).constructor) : t.apply(this, r)))._options,
                            f = s.sendDefaultPii,
                            d = s.sendClientReports,
                            p = s.enableLogs,
                            m = s._experiments,
                            y = s.enableMetrics,
                            v = null == (c = null != y ? y : null == m ? void 0 : m.enableMetrics) || c;
                        return ek.document && (d || p || v) && ek.document.addEventListener("visibilitychange", function() {
                            "hidden" === ek.document.visibilityState && (d && i._flushOutcomes(), p && r5(i), v && r4(i))
                        }), f && i.on("beforeSendSession", r6), i
                    }
                    return n.prototype = Object.create(e && e.prototype, {
                            constructor: {
                                value: n,
                                writable: !0,
                                configurable: !0
                            }
                        }), e && aK(n, e), t = [{
                            key: "eventFromException",
                            value: function(e, t) {
                                var n, r, a;
                                return n = this._options.stackParser, r = this._options.attachStacktrace, tm(a = aL(n, e, (null == t ? void 0 : t.syntheticException) || void 0, r)), a.level = "error", (null == t ? void 0 : t.event_id) && (a.event_id = t.event_id), rh(a)
                            }
                        }, {
                            key: "eventFromMessage",
                            value: function(e) {
                                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "info",
                                    n = arguments.length > 2 ? arguments[2] : void 0;
                                return function(e, t) {
                                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "info",
                                        r = arguments.length > 3 ? arguments[3] : void 0,
                                        a = arguments.length > 4 ? arguments[4] : void 0,
                                        o = aX(e, t, (null == r ? void 0 : r.syntheticException) || void 0, a);
                                    return o.level = n, (null == r ? void 0 : r.event_id) && (o.event_id = r.event_id), rh(o)
                                }(this._options.stackParser, e, t, n, this._options.attachStacktrace)
                            }
                        }, {
                            key: "_prepareEvent",
                            value: function(e, t, r, a) {
                                return e.platform = e.platform || "javascript", aU(aM(n.prototype), "_prepareEvent", this).call(this, e, t, r, a)
                            }
                        }],
                        function(e, t) {
                            for (var n = 0; n < t.length; n++) {
                                var r = t[n];
                                r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                            }
                        }(n.prototype, t), n
                }(aw),
                aQ = {},
                aq = {};

            function a$(e, t) {
                aQ[e] = aQ[e] || [], aQ[e].push(t)
            }

            function a0(e, t) {
                if (!aq[e]) {
                    aq[e] = !0;
                    try {
                        t()
                    } catch (t) {
                        eP && e8.error("Error while instrumenting ".concat(e), t)
                    }
                }
            }

            function a1(e, t) {
                var n = e && aQ[e];
                if (n) {
                    var r = !0,
                        a = !1,
                        o = void 0;
                    try {
                        for (var i, u = n[Symbol.iterator](); !(r = (i = u.next()).done); r = !0) {
                            var c = i.value;
                            try {
                                c(t)
                            } catch (t) {
                                eP && e8.error("Error while triggering instrumentation handler.\nType: ".concat(e, "\nName: ").concat(tR(c), "\nError:"), t)
                            }
                        }
                    } catch (e) {
                        a = !0, o = e
                    } finally {
                        try {
                            r || null == u.return || u.return()
                        } finally {
                            if (a) throw o
                        }
                    }
                }
            }

            function a2() {
                "console" in ek && e1.forEach(function(e) {
                    e in ek.console && e7(ek.console, e, function(t) {
                        return e2[e] = t,
                            function() {
                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                a1("console", {
                                    args: n,
                                    level: e
                                });
                                var a = e2[e];
                                null == a || a.apply(ek.console, n)
                            }
                    })
                })
            }

            function a3(e) {
                return e && /^function\s+\w+\(\)\s+\{\s+\[native code\]\s+\}$/.test(e.toString())
            }

            function a5(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function a9(e, t, n, r, a, o, i) {
                try {
                    var u = e[o](i),
                        c = u.value
                } catch (e) {
                    n(e);
                    return
                }
                u.done ? t(c) : Promise.resolve(c).then(r, a)
            }

            function a4(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var o = e.apply(t, n);

                        function i(e) {
                            a9(o, r, a, i, u, "next", e)
                        }

                        function u(e) {
                            a9(o, r, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function a8(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function a6(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function a7(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return a5(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return a5(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oe(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function ot(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = u(0), i.throw = u(1), i.return = u(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function u(u) {
                    return function(c) {
                        var l = [u, c];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, l[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & l[0] ? r.return : l[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, l[1])).done) return a;
                            switch (r = 0, a && (l = [2 & l[0], a.value]), l[0]) {
                                case 0:
                                case 1:
                                    a = l;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: l[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, r = l[1], l = [0];
                                    continue;
                                case 7:
                                    l = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === l[0] && (!a || l[1] > a[0] && l[1] < a[3])) {
                                        o.label = l[1];
                                        break
                                    }
                                    if (6 === l[0] && o.label < a[1]) {
                                        o.label = a[1], a = l;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(l);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            l = t.call(e, o)
                        } catch (e) {
                            l = [6, e], r = 0
                        } finally {
                            n = a = 0
                        }
                        if (5 & l[0]) throw l[1];
                        return {
                            value: l[0] ? l[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function on(e, t) {
                var n = "fetch";
                a$(n, e), a0(n, function() {
                    return or(void 0, t)
                })
            }

            function or(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                (!t || function() {
                    if ("string" == typeof EdgeRuntime) return !0;
                    if (! function() {
                            if (!("fetch" in ek)) return !1;
                            try {
                                return new Headers, new Request("data:,"), new Response, !0
                            } catch (e) {
                                return !1
                            }
                        }()) return !1;
                    if (a3(ek.fetch)) return !0;
                    var e = !1,
                        t = ek.document;
                    if (t && "function" == typeof t.createElement) try {
                        var n, r = t.createElement("iframe");
                        r.hidden = !0, t.head.appendChild(r), (null == (n = r.contentWindow) ? void 0 : n.fetch) && (e = a3(r.contentWindow.fetch)), t.head.removeChild(r)
                    } catch (e) {
                        eP && e8.warn("Could not create sandbox iframe for pure fetch check, bailing to window.fetch: ", e)
                    }
                    return e
                }()) && e7(ek, "fetch", function(t) {
                    return function() {
                        for (var n = arguments.length, r = Array(n), a = 0; a < n; a++) r[a] = arguments[a];
                        var o = Error(),
                            i = function(e) {
                                if (0 === e.length) return {
                                    method: "GET",
                                    url: ""
                                };
                                if (2 === e.length) {
                                    var t = a7(e, 2),
                                        n = t[0],
                                        r = t[1];
                                    return {
                                        url: oi(n),
                                        method: oo(r, "method") ? String(r.method).toUpperCase() : eK(n) && oo(n, "method") ? String(n.method).toUpperCase() : "GET"
                                    }
                                }
                                var a = e[0];
                                return {
                                    url: oi(a),
                                    method: oo(a, "method") ? String(a.method).toUpperCase() : "GET"
                                }
                            }(r),
                            u = {
                                args: r,
                                fetchData: {
                                    method: i.method,
                                    url: i.url
                                },
                                startTimestamp: 1e3 * tb(),
                                virtualError: o,
                                headers: function(e) {
                                    var t = a7(e, 2),
                                        n = t[0],
                                        r = t[1];
                                    try {
                                        if ((void 0 === r ? "undefined" : oe(r)) === "object" && null !== r && "headers" in r && r.headers) return new Headers(r.headers);
                                        if (eK(n)) return new Headers(n.headers)
                                    } catch (e) {}
                                }(r)
                            };
                        return e || a1("fetch", a8({}, u)), t.apply(ek, r).then(function(t) {
                            return a4(function() {
                                return ot(this, function(n) {
                                    return e ? e(t) : a1("fetch", a6(a8({}, u), {
                                        endTimestamp: 1e3 * tb(),
                                        response: t
                                    })), [2, t]
                                })
                            })()
                        }, function(e) {
                            a1("fetch", a6(a8({}, u), {
                                endTimestamp: 1e3 * tb(),
                                error: e
                            })), eC(e) && void 0 === e.stack && (e.stack = o.stack, te(e, "framesToPop", 1));
                            var t, n, r = t1(),
                                a = null != (n = null == r ? void 0 : r.getOptions().enhanceFetchErrorMessages) ? n : "always";
                            if (!1 !== a && (null != (t = TypeError) && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t) && ("Failed to fetch" === e.message || "Load failed" === e.message || "NetworkError when attempting to fetch resource." === e.message)) try {
                                var i = new URL(u.fetchData.url).host;
                                "always" === a ? e.message = "".concat(e.message, " (").concat(i, ")") : te(e, "__sentry_fetch_url_host__", i)
                            } catch (e) {}
                            throw e
                        })
                    }
                })
            }

            function oa(e) {
                var t, n, r;
                try {
                    t = e.clone()
                } catch (e) {
                    return
                }
                n = t, r = function() {
                    a1("fetch-body-resolved", {
                        endTimestamp: 1e3 * tb(),
                        response: e
                    })
                }, a4(function() {
                    var e, t, a, o, i, u;
                    return ot(this, function(c) {
                        switch (c.label) {
                            case 0:
                                if (!(null == n ? void 0 : n.body)) return [3, 8];
                                t = (e = n.body).getReader(), a = setTimeout(function() {
                                    e.cancel().then(null, function() {})
                                }, 9e4), o = !0, c.label = 1;
                            case 1:
                                if (!o) return [3, 7];
                                i = void 0, c.label = 2;
                            case 2:
                                return c.trys.push([2, 4, 5, 6]), i = setTimeout(function() {
                                    e.cancel().then(null, function() {})
                                }, 5e3), [4, t.read()];
                            case 3:
                                return u = c.sent().done, clearTimeout(i), u && (r(), o = !1), [3, 6];
                            case 4:
                                return c.sent(), o = !1, [3, 6];
                            case 5:
                                return clearTimeout(i), [7];
                            case 6:
                                return [3, 1];
                            case 7:
                                clearTimeout(a), t.releaseLock(), e.cancel().then(null, function() {}), c.label = 8;
                            case 8:
                                return [2]
                        }
                    })
                })()
            }

            function oo(e, t) {
                return !!e && (void 0 === e ? "undefined" : oe(e)) === "object" && !!e[t]
            }

            function oi(e) {
                return "string" == typeof e ? e : e ? oo(e, "url") ? e.url : e.toString ? e.toString() : "" : ""
            }

            function ou(e, t) {
                var n = t1(),
                    r = t$();
                if (n) {
                    var a = n.getOptions(),
                        o = a.beforeBreadcrumb,
                        i = void 0 === o ? null : o,
                        u = a.maxBreadcrumbs,
                        c = void 0 === u ? 100 : u;
                    if (!(c <= 0)) {
                        var l = function(e) {
                                for (var t = 1; t < arguments.length; t++) {
                                    var n = null != arguments[t] ? arguments[t] : {},
                                        r = Object.keys(n);
                                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                                    }))), r.forEach(function(t) {
                                        var r;
                                        r = n[t], t in e ? Object.defineProperty(e, t, {
                                            value: r,
                                            enumerable: !0,
                                            configurable: !0,
                                            writable: !0
                                        }) : e[t] = r
                                    })
                                }
                                return e
                            }({
                                timestamp: tv()
                            }, e),
                            s = i ? e3(function() {
                                return i(l, t)
                            }) : l;
                        null !== s && (n.emit && n.emit("beforeAddBreadcrumb", s, t), r.addBreadcrumb(s, c))
                    }
                }
            }

            function oc(e) {
                if (void 0 !== e) return e >= 400 && e < 500 ? "warning" : e >= 500 ? "error" : void 0
            }

            function ol(e) {
                return "isRelative" in e
            }

            function os(e, t) {
                var n = 0 >= e.indexOf("://") && 0 !== e.indexOf("//"),
                    r = null != t ? t : n ? "thismessage:/" : void 0;
                try {
                    if ("canParse" in URL && !URL.canParse(e, r)) return;
                    var a = new URL(e, r);
                    if (n) return {
                        isRelative: n,
                        pathname: a.pathname,
                        search: a.search,
                        hash: a.hash
                    };
                    return a
                } catch (e) {}
            }

            function of(e) {
                if (!e) return {};
                var t = e.match(/^(([^:/?#]+):)?(\/\/([^/?#]*))?([^?#]*)(\?([^#]*))?(#(.*))?$/);
                if (!t) return {};
                var n = t[6] || "",
                    r = t[8] || "";
                return {
                    host: t[4],
                    path: t[5],
                    protocol: t[2],
                    search: n,
                    hash: r,
                    relative: t[5] + n + r
                }
            }

            function od(e) {
                var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1];
                if (e.startsWith("data:")) {
                    var n = e.match(/^data:([^;,]+)/),
                        r = n ? n[1] : "text/plain",
                        a = e.includes(";base64,"),
                        o = e.indexOf(","),
                        i = "";
                    if (t && -1 !== o) {
                        var u = e.slice(o + 1);
                        i = u.length > 10 ? "".concat(u.slice(0, 10), "... [truncated]") : u
                    }
                    return "data:".concat(r).concat(a ? ",base64" : "").concat(i ? ",".concat(i) : "")
                }
                return e
            }

            function op() {
                if (ek.document) {
                    var e = a1.bind(null, "dom"),
                        t = om(e, !0);
                    ek.document.addEventListener("click", t, !1), ek.document.addEventListener("keypress", t, !1), ["EventTarget", "Node"].forEach(function(t) {
                        var n, r, a = null == (n = ek[t]) ? void 0 : n.prototype;
                        (null == a || null == (r = a.hasOwnProperty) ? void 0 : r.call(a, "addEventListener")) && (e7(a, "addEventListener", function(t) {
                            return function(n, r, a) {
                                if ("click" === n || "keypress" == n) try {
                                    var o = this.__sentry_instrumentation_handlers__ = this.__sentry_instrumentation_handlers__ || {},
                                        i = o[n] = o[n] || {
                                            refCount: 0
                                        };
                                    if (!i.handler) {
                                        var u = om(e);
                                        i.handler = u, t.call(this, n, u, a)
                                    }
                                    i.refCount++
                                } catch (e) {}
                                return t.call(this, n, r, a)
                            }
                        }), e7(a, "removeEventListener", function(e) {
                            return function(t, n, r) {
                                if ("click" === t || "keypress" == t) try {
                                    var a = this.__sentry_instrumentation_handlers__ || {},
                                        o = a[t];
                                    o && (o.refCount--, o.refCount <= 0 && (e.call(this, t, o.handler, r), o.handler = void 0, delete a[t]), 0 === Object.keys(a).length && delete this.__sentry_instrumentation_handlers__)
                                } catch (e) {}
                                return e.call(this, t, n, r)
                            }
                        }))
                    })
                }
            }

            function om(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                return function(n) {
                    if (n && !n._sentryCaptured) {
                        var r, a = function(e) {
                            try {
                                return e.target
                            } catch (e) {
                                return null
                            }
                        }(n);
                        if (r = n.type, "keypress" !== r || null != a && a.tagName && ("INPUT" === a.tagName || "TEXTAREA" === a.tagName || a.isContentEditable || 0)) {
                            te(n, "_sentryCaptured", !0), a && !a._sentryId && te(a, "_sentryId", ts());
                            var o = "keypress" === n.type ? "input" : n.type;
                            ! function(e) {
                                if (e.type !== G) return !1;
                                try {
                                    if (!e.target || e.target._sentryId !== U) return !1
                                } catch (e) {}
                                return !0
                            }(n) && (e({
                                event: n,
                                name: o,
                                global: t
                            }), G = n.type, U = a ? a._sentryId : void 0), clearTimeout(B), B = ek.setTimeout(function() {
                                U = void 0, G = void 0
                            }, 1e3)
                        }
                    }
                }
            }

            function oy(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var ov = "__sentry_xhr_v3__";

            function ob(e) {
                a$("xhr", e), a0("xhr", oh)
            }

            function oh() {
                if (ek.XMLHttpRequest) {
                    var e = XMLHttpRequest.prototype;
                    e.open = new Proxy(e.open, {
                        apply: function(e, t, n) {
                            var r = Error(),
                                a = 1e3 * tb(),
                                o = eX(n[0]) ? n[0].toUpperCase() : void 0,
                                i = function(e) {
                                    if (eX(e)) return e;
                                    try {
                                        return e.toString()
                                    } catch (e) {}
                                }(n[1]);
                            if (!o || !i) return e.apply(t, n);
                            t[ov] = {
                                method: o,
                                url: i,
                                request_headers: {}
                            }, "POST" === o && i.match(/sentry_key/) && (t.__sentry_own_request__ = !0);
                            var u = function() {
                                var e = t[ov];
                                if (e && 4 === t.readyState) {
                                    try {
                                        e.status_code = t.status
                                    } catch (e) {}
                                    a1("xhr", {
                                        endTimestamp: 1e3 * tb(),
                                        startTimestamp: a,
                                        xhr: t,
                                        virtualError: r
                                    })
                                }
                            };
                            return "onreadystatechange" in t && "function" == typeof t.onreadystatechange ? t.onreadystatechange = new Proxy(t.onreadystatechange, {
                                apply: function(e, t, n) {
                                    return u(), e.apply(t, n)
                                }
                            }) : t.addEventListener("readystatechange", u), t.setRequestHeader = new Proxy(t.setRequestHeader, {
                                apply: function(e, t, n) {
                                    var r = function(e) {
                                            if (Array.isArray(e)) return e
                                        }(n) || function(e, t) {
                                            var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                            if (null != a) {
                                                var o = [],
                                                    i = !0,
                                                    u = !1;
                                                try {
                                                    for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                                                } catch (e) {
                                                    u = !0, r = e
                                                } finally {
                                                    try {
                                                        i || null == a.return || a.return()
                                                    } finally {
                                                        if (u) throw r
                                                    }
                                                }
                                                return o
                                            }
                                        }(n, 2) || function(e, t) {
                                            if (e) {
                                                if ("string" == typeof e) return oy(e, 2);
                                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return oy(e, t)
                                            }
                                        }(n, 2) || function() {
                                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                        }(),
                                        a = r[0],
                                        o = r[1],
                                        i = t[ov];
                                    return i && eX(a) && eX(o) && (i.request_headers[a.toLowerCase()] = o), e.apply(t, n)
                                }
                            }), e.apply(t, n)
                        }
                    }), e.send = new Proxy(e.send, {
                        apply: function(e, t, n) {
                            var r = t[ov];
                            return r && (void 0 !== n[0] && (r.body = n[0]), a1("xhr", {
                                startTimestamp: 1e3 * tb(),
                                xhr: t
                            })), e.apply(t, n)
                        }
                    })
                }
            }

            function og(e) {
                var t = "history";
                a$(t, e), a0(t, oS)
            }

            function oS() {
                function e(e) {
                    return function() {
                        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                        var a = n.length > 2 ? n[2] : void 0;
                        if (a) {
                            var o = M,
                                i = function(e) {
                                    try {
                                        return new URL(e, ek.location.origin).toString()
                                    } catch (t) {
                                        return e
                                    }
                                }(String(a));
                            if (M = i, o === i) return e.apply(this, n);
                            a1("history", {
                                from: o,
                                to: i
                            })
                        }
                        return e.apply(this, n)
                    }
                }
                ek.addEventListener("popstate", function() {
                    var e = ek.location.href,
                        t = M;
                    M = e, t !== e && a1("history", {
                        from: t,
                        to: e
                    })
                }), "history" in ek && ek.history && (e7(ek.history, "pushState", e), e7(ek.history, "replaceState", e))
            }
            var o_ = "undefined" == typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;

            function oE(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function oO(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var ow = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        t = oE({
                            console: !0,
                            dom: !0,
                            fetch: !0,
                            history: !0,
                            sentry: !0,
                            xhr: !0
                        }, e);
                    return {
                        name: "Breadcrumbs",
                        setup: function(e) {
                            var n, r, a, o, i, u, c;
                            t.console && (n = e, a$("console", function(e) {
                                if (t1() === n) {
                                    var t, r = {
                                        category: "console",
                                        data: {
                                            arguments: e.args,
                                            logger: "console"
                                        },
                                        level: "warn" === (t = e.level) ? "warning" : ["fatal", "error", "warning", "log", "info", "debug"].includes(t) ? t : "log",
                                        message: tC(e.args, " ")
                                    };
                                    if ("assert" === e.level)
                                        if (!1 !== e.args[0]) return;
                                        else r.message = "Assertion failed: ".concat(tC(e.args.slice(1), " ") || "console.assert"), r.data.arguments = e.args.slice(1);
                                    ou(r, {
                                        input: e.args,
                                        level: e.level
                                    })
                                }
                            }), a0("console", a2)), t.dom && (a$("dom", (r = e, a = t.dom, function(e) {
                                if (t1() === r) {
                                    var t, n, o = (void 0 === a ? "undefined" : oO(a)) === "object" ? a.serializeAttribute : void 0,
                                        i = (void 0 === a ? "undefined" : oO(a)) === "object" && "number" == typeof a.maxStringLength ? a.maxStringLength : void 0;
                                    i && i > 1024 && (o_ && e8.warn("`dom.maxStringLength` cannot exceed ".concat(1024, ", but a value of ").concat(i, " was configured. Sentry will use ").concat(1024, " instead.")), i = 1024), "string" == typeof o && (o = [o]);
                                    try {
                                        var u, c = e.event,
                                            l = (u = c) && u.target ? c.target : c;
                                        t = eH(l, {
                                            keyAttrs: o,
                                            maxStringLength: i
                                        }), n = eq(l)
                                    } catch (e) {
                                        t = "<unknown>"
                                    }
                                    if (0 !== t.length) {
                                        var s = {
                                            category: "ui.".concat(e.name),
                                            message: t
                                        };
                                        n && (s.data = {
                                            "ui.component_name": n
                                        }), ou(s, {
                                            event: e.event,
                                            name: e.name,
                                            global: e.global
                                        })
                                    }
                                }
                            })), a0("dom", op)), t.xhr && ob((o = e, function(e) {
                                if (t1() === o) {
                                    var t = e.startTimestamp,
                                        n = e.endTimestamp,
                                        r = e.xhr[ov];
                                    if (t && n && r) {
                                        var a = r.method,
                                            i = r.url,
                                            u = r.status_code,
                                            c = r.body,
                                            l = {
                                                xhr: e.xhr,
                                                input: c,
                                                startTimestamp: t,
                                                endTimestamp: n
                                            },
                                            s = {
                                                category: "xhr",
                                                data: {
                                                    method: a,
                                                    url: i,
                                                    status_code: u
                                                },
                                                type: "http",
                                                level: oc(u)
                                            };
                                        o.emit("beforeOutgoingRequestBreadcrumb", s, l), ou(s, l)
                                    }
                                }
                            })), t.fetch && on((i = e, function(e) {
                                if (t1() === i) {
                                    var t = e.startTimestamp,
                                        n = e.endTimestamp;
                                    if (n && (!e.fetchData.url.match(/sentry_key/) || "POST" !== e.fetchData.method))
                                        if (e.fetchData.method, e.fetchData.url, e.error) {
                                            var r = e.fetchData,
                                                a = {
                                                    data: e.error,
                                                    input: e.args,
                                                    startTimestamp: t,
                                                    endTimestamp: n
                                                },
                                                o = {
                                                    category: "fetch",
                                                    data: r,
                                                    level: "error",
                                                    type: "http"
                                                };
                                            i.emit("beforeOutgoingRequestBreadcrumb", o, a), ou(o, a)
                                        } else {
                                            var u, c, l = e.response,
                                                s = (u = oE({}, e.fetchData), c = c = {
                                                    status_code: null == l ? void 0 : l.status
                                                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(u, Object.getOwnPropertyDescriptors(c)) : (function(e, t) {
                                                    var n = Object.keys(e);
                                                    if (Object.getOwnPropertySymbols) {
                                                        var r = Object.getOwnPropertySymbols(e);
                                                        n.push.apply(n, r)
                                                    }
                                                    return n
                                                })(Object(c)).forEach(function(e) {
                                                    Object.defineProperty(u, e, Object.getOwnPropertyDescriptor(c, e))
                                                }), u);
                                            e.fetchData.request_body_size, e.fetchData.response_body_size, null == l || l.status;
                                            var f = {
                                                    input: e.args,
                                                    response: l,
                                                    startTimestamp: t,
                                                    endTimestamp: n
                                                },
                                                d = {
                                                    category: "fetch",
                                                    data: s,
                                                    type: "http",
                                                    level: oc(s.status_code)
                                                };
                                            i.emit("beforeOutgoingRequestBreadcrumb", d, f), ou(d, f)
                                        }
                                }
                            })), t.history && og((u = e, function(e) {
                                if (t1() === u) {
                                    var t = e.from,
                                        n = e.to,
                                        r = of(ek.location.href),
                                        a = t ? of(t) : void 0,
                                        o = of(n);
                                    (null == a ? void 0 : a.path) || (a = r), r.protocol === o.protocol && r.host === o.host && (n = o.relative), r.protocol === a.protocol && r.host === a.host && (t = a.relative), ou({
                                        category: "navigation",
                                        data: {
                                            from: t,
                                            to: n
                                        }
                                    })
                                }
                            })), t.sentry && e.on("beforeSendEvent", (c = e, function(e) {
                                t1() === c && ou({
                                    category: "sentry.".concat("transaction" === e.type ? "transaction" : "event"),
                                    event_id: e.event_id,
                                    level: e.level,
                                    message: td(e)
                                }, {
                                    event: e
                                })
                            }))
                        }
                    }
                },
                oI = ["EventTarget", "Window", "Node", "ApplicationCache", "AudioTrackList", "BroadcastChannel", "ChannelMergerNode", "CryptoOperation", "EventSource", "FileReader", "HTMLUnknownElement", "IDBDatabase", "IDBRequest", "IDBTransaction", "KeyOperation", "MediaController", "MessagePort", "ModalWindow", "Notification", "SVGElementInstance", "Screen", "SharedWorker", "TextTrack", "TextTrackCue", "TextTrackList", "WebSocket", "WebSocketWorker", "Worker", "XMLHttpRequest", "XMLHttpRequestEventTarget", "XMLHttpRequestUpload"],
                oA = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        t = function(e) {
                            for (var t = 1; t < arguments.length; t++) {
                                var n = null != arguments[t] ? arguments[t] : {},
                                    r = Object.keys(n);
                                "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                    return Object.getOwnPropertyDescriptor(n, e).enumerable
                                }))), r.forEach(function(t) {
                                    var r;
                                    r = n[t], t in e ? Object.defineProperty(e, t, {
                                        value: r,
                                        enumerable: !0,
                                        configurable: !0,
                                        writable: !0
                                    }) : e[t] = r
                                })
                            }
                            return e
                        }({
                            XMLHttpRequest: !0,
                            eventTarget: !0,
                            requestAnimationFrame: !0,
                            setInterval: !0,
                            setTimeout: !0,
                            unregisterOriginalCallbacks: !1
                        }, e);
                    return {
                        name: "BrowserApiErrors",
                        setupOnce: function() {
                            t.setTimeout && e7(ek, "setTimeout", oT), t.setInterval && e7(ek, "setInterval", oT), t.requestAnimationFrame && e7(ek, "requestAnimationFrame", oN), t.XMLHttpRequest && "XMLHttpRequest" in ek && e7(XMLHttpRequest.prototype, "send", ok);
                            var e = t.eventTarget;
                            e && (Array.isArray(e) ? e : oI).forEach(function(e) {
                                var n, r, a, o, i;
                                return n = e, r = t, void((null == (i = null == (a = ek[n]) ? void 0 : a.prototype) || null == (o = i.hasOwnProperty) ? void 0 : o.call(i, "addEventListener")) && (e7(i, "addEventListener", function(e) {
                                    return function(t, a, o) {
                                        try {
                                            var i;
                                            i = a, "function" == typeof i.handleEvent && (a.handleEvent = aB(a.handleEvent, {
                                                mechanism: {
                                                    data: {
                                                        handler: tR(a),
                                                        target: n
                                                    },
                                                    handled: !1,
                                                    type: "auto.browser.browserapierrors.handleEvent"
                                                }
                                            }))
                                        } catch (e) {}
                                        return r.unregisterOriginalCallbacks && function(e, t, n) {
                                            e && (void 0 === e ? "undefined" : e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) == "object" && "removeEventListener" in e && "function" == typeof e.removeEventListener && e.removeEventListener(t, n)
                                        }(this, t, a), e.apply(this, [t, aB(a, {
                                            mechanism: {
                                                data: {
                                                    handler: tR(a),
                                                    target: n
                                                },
                                                handled: !1,
                                                type: "auto.browser.browserapierrors.addEventListener"
                                            }
                                        }), o])
                                    }
                                }), e7(i, "removeEventListener", function(e) {
                                    return function(t, n, r) {
                                        try {
                                            var a = n.__sentry_wrapped__;
                                            a && e.call(this, t, a, r)
                                        } catch (e) {}
                                        return e.call(this, t, n, r)
                                    }
                                })))
                            })
                        }
                    }
                };

            function oT(e) {
                return function() {
                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                    var a = n[0];
                    return n[0] = aB(a, {
                        mechanism: {
                            handled: !1,
                            type: "auto.browser.browserapierrors.".concat(tR(e))
                        }
                    }), e.apply(this, n)
                }
            }

            function oN(e) {
                return function(t) {
                    return e.apply(this, [aB(t, {
                        mechanism: {
                            data: {
                                handler: tR(e)
                            },
                            handled: !1,
                            type: "auto.browser.browserapierrors.requestAnimationFrame"
                        }
                    })])
                }
            }

            function ok(e) {
                return function() {
                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                    var a = this;
                    return ["onload", "onerror", "onprogress", "onreadystatechange"].forEach(function(e) {
                        e in a && "function" == typeof a[e] && e7(a, e, function(t) {
                            var n = {
                                    mechanism: {
                                        data: {
                                            handler: tR(t)
                                        },
                                        handled: !1,
                                        type: "auto.browser.browserapierrors.xhr.".concat(e)
                                    }
                                },
                                r = tn(t);
                            return r && (n.mechanism.data.handler = tR(r)), aB(t, n)
                        })
                    }), e.apply(this, n)
                }
            }
            var oj = null;

            function ox(e) {
                var t = "error";
                a$(t, e), a0(t, oR)
            }

            function oR() {
                oj = ek.onerror, ek.onerror = function(e, t, n, r, a) {
                    return a1("error", {
                        column: r,
                        error: a,
                        line: n,
                        msg: e,
                        url: t
                    }), !!oj && oj.apply(this, arguments)
                }, ek.onerror.__SENTRY_INSTRUMENTED__ = !0
            }
            var oP = null;

            function oV(e) {
                var t = "unhandledrejection";
                a$(t, e), a0(t, oZ)
            }

            function oZ() {
                oP = ek.onunhandledrejection, ek.onunhandledrejection = function(e) {
                    return a1("unhandledrejection", e), !oP || oP.apply(this, arguments)
                }, ek.onunhandledrejection.__SENTRY_INSTRUMENTED__ = !0
            }
            var oC = function() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    t = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({
                        onerror: !0,
                        onunhandledrejection: !0
                    }, e);
                return {
                    name: "GlobalHandlers",
                    setupOnce: function() {
                        Error.stackTraceLimit = 50
                    },
                    setup: function(e) {
                        var n, r;
                        t.onerror && (n = e, ox(function(e) {
                            var t = oF(),
                                r = t.stackParser,
                                a = t.attachStacktrace;
                            if (!(t1() !== n || aW > 0)) {
                                var o, i, u, c, l, s, f, d, p, m, y, v = e.msg,
                                    b = e.url,
                                    h = e.line,
                                    g = e.column,
                                    S = e.error,
                                    _ = (o = aL(r, S || v, void 0, a, !1), i = b, u = h, c = g, m = (p = (d = (f = (s = o.exception = o.exception || {}).values = s.values || [])[0] = f[0] || {}).stacktrace = d.stacktrace || {}).frames = p.frames || [], y = null != (l = function(e) {
                                        if (eX(e) && 0 !== e.length) return e.startsWith("data:") ? "<".concat(od(e, !1), ">") : e
                                    }(i)) ? l : eQ(), 0 === m.length && m.push({
                                        colno: c,
                                        filename: y,
                                        function: "?",
                                        in_app: !0,
                                        lineno: u
                                    }), o);
                                _.level = "error", rP(_, {
                                    originalException: S,
                                    mechanism: {
                                        handled: !1,
                                        type: "auto.browser.global_handlers.onerror"
                                    }
                                })
                            }
                        }), oD("onerror")), t.onunhandledrejection && (r = e, oV(function(e) {
                            var t = oF(),
                                n = t.stackParser,
                                a = t.attachStacktrace;
                            if (!(t1() !== r || aW > 0)) {
                                var o, i = function(e) {
                                        if (eW(e)) return e;
                                        try {
                                            if ("reason" in e) return e.reason;
                                            if ("detail" in e && "reason" in e.detail) return e.detail.reason
                                        } catch (e) {}
                                        return e
                                    }(e),
                                    u = eW(i) ? (o = i, {
                                        exception: {
                                            values: [{
                                                type: "UnhandledRejection",
                                                value: "Non-Error promise rejection captured with value: ".concat(String(o))
                                            }]
                                        }
                                    }) : aL(n, i, void 0, a, !0);
                                u.level = "error", rP(u, {
                                    originalException: i,
                                    mechanism: {
                                        handled: !1,
                                        type: "auto.browser.global_handlers.onunhandledrejection"
                                    }
                                })
                            }
                        }), oD("onunhandledrejection"))
                    }
                }
            };

            function oD(e) {
                o_ && e8.log("Global Handler attached: ".concat(e))
            }

            function oF() {
                var e = t1();
                return (null == e ? void 0 : e.getOptions()) || {
                    stackParser: function() {
                        return []
                    },
                    attachStacktrace: !1
                }
            }

            function oL(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function oX(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function oY(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function oW(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function oB(e) {
                return function(e) {
                    if (Array.isArray(e)) return oX(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return oX(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return oX(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oG(e) {
                return Array.isArray(e.errors)
            }

            function oU(e, t, n) {
                e.mechanism = oW(oY({
                    handled: !0,
                    type: "auto.core.linked_errors"
                }, oG(n) && {
                    is_exception_group: !0
                }, e.mechanism), {
                    exception_id: t
                })
            }

            function oM(e, t, n, r) {
                e.mechanism = oW(oY({
                    handled: !0
                }, e.mechanism), {
                    type: "chained",
                    source: t,
                    exception_id: n,
                    parent_id: r
                })
            }
            var oJ = function() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    t = e.limit || 5,
                    n = e.key || "cause";
                return {
                    name: "LinkedErrors",
                    preprocessEvent: function(e, r, a) {
                        var o = a.getOptions().stackParser;
                        if ((null == (i = e.exception) ? void 0 : i.values) && r && eM(r.originalException, Error)) {
                            var i, u = e.exception.values.length > 0 ? e.exception.values[e.exception.values.length - 1] : void 0;
                            u && (e.exception.values = function e(t, n, r, a, o, i, u, c) {
                                if (i.length >= r + 1) return i;
                                var l = oB(i);
                                if (eM(a[o], Error)) {
                                    oU(u, c, a);
                                    var s = t(n, a[o]),
                                        f = l.length;
                                    oM(s, o, f, c), l = e(t, n, r, a[o], o, [s].concat(oB(l)), s, f)
                                }
                                return oG(a) && a.errors.forEach(function(i, s) {
                                    if (eM(i, Error)) {
                                        oU(u, c, a);
                                        var f = t(n, i),
                                            d = l.length;
                                        oM(f, "errors[".concat(s, "]"), d, c), l = e(t, n, r, i, o, [f].concat(oB(l)), f, d)
                                    }
                                }), l
                            }(aV, o, t, r.originalException, n, e.exception.values, u, 0))
                        }
                    }
                }
            };

            function oK(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function oz(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || oH(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oH(e, t) {
                if (e) {
                    if ("string" == typeof e) return oK(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return oK(e, t)
                }
            }

            function oQ(e, t, n, r) {
                var a = {
                    filename: e,
                    function: "<anonymous>" === t ? "?" : t,
                    in_app: !0
                };
                return void 0 !== n && (a.lineno = n), void 0 !== r && (a.colno = r), a
            }
            var oq = /^\s*at (\S+?)(?::(\d+))(?::(\d+))\s*$/i,
                o$ = /^\s*at (?:(.+?\)(?: \[.+\])?|.*?) ?\((?:address at )?)?(?:async )?((?:<anonymous>|[-a-z]+:|.*bundle|\/)?.*?)(?::(\d+))?(?::(\d+))?\)?\s*$/i,
                o0 = /\((\S*)(?::(\d+))(?::(\d+))\)/,
                o1 = /at (.+?) ?\(data:(.+?),/,
                o2 = [30, function(e) {
                    var t = e.match(o1);
                    if (t) return {
                        filename: "<data:".concat(t[2], ">"),
                        function: t[1]
                    };
                    var n = oq.exec(e);
                    if (n) {
                        var r = oz(n, 4);
                        return oQ(r[1], "?", +r[2], +r[3])
                    }
                    var a = o$.exec(e);
                    if (a) {
                        if (a[2] && 0 === a[2].indexOf("eval")) {
                            var o = o0.exec(a[2]);
                            o && (a[2] = o[1], a[3] = o[2], a[4] = o[3])
                        }
                        var i = oz(o8(a[1] || "?", a[2]), 2),
                            u = i[0];
                        return oQ(i[1], u, a[3] ? +a[3] : void 0, a[4] ? +a[4] : void 0)
                    }
                }],
                o3 = /^\s*(.*?)(?:\((.*?)\))?(?:^|@)?((?:[-a-z]+)?:\/.*?|\[native code\]|[^@]*(?:bundle|\d+\.js)|\/[\w\-. /=]+)(?::(\d+))?(?::(\d+))?\s*$/i,
                o5 = /(\S+) line (\d+)(?: > eval line \d+)* > eval/i,
                o9 = [50, function(e) {
                    var t = o3.exec(e);
                    if (t) {
                        if (t[3] && t[3].indexOf(" > eval") > -1) {
                            var n, r = o5.exec(t[3]);
                            r && (t[1] = t[1] || "eval", t[3] = r[1], t[4] = r[2], t[5] = "")
                        }
                        var a = t[3],
                            o = t[1] || "?";
                        return o = (n = oz(o8(o, a), 2))[0], oQ(a = n[1], o, t[4] ? +t[4] : void 0, t[5] ? +t[5] : void 0)
                    }
                }],
                o4 = tk.apply(void 0, function(e) {
                    if (Array.isArray(e)) return oK(e)
                }(t = [o2, o9]) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || oH(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()),
                o8 = function(e, t) {
                    var n = -1 !== e.indexOf("safari-extension"),
                        r = -1 !== e.indexOf("safari-web-extension");
                    return n || r ? [-1 !== e.indexOf("@") ? e.split("@")[0] : "?", n ? "safari-extension:".concat(t) : "safari-web-extension:".concat(t)] : [e, t]
                },
                o6 = "undefined" == typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__,
                o7 = {};

            function ie(e, t, n, r, a, o, i) {
                try {
                    var u = e[o](i),
                        c = u.value
                } catch (e) {
                    n(e);
                    return
                }
                u.done ? t(c) : Promise.resolve(c).then(r, a)
            }

            function it(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : function(e) {
                        var t = o7[e];
                        if (t) return t;
                        var n = ek[e];
                        if (a3(n)) return o7[e] = n.bind(ek);
                        var r = ek.document;
                        if (r && "function" == typeof r.createElement) try {
                            var a = r.createElement("iframe");
                            a.hidden = !0, r.head.appendChild(a);
                            var o = a.contentWindow;
                            (null == o ? void 0 : o[e]) && (n = o[e]), r.head.removeChild(a)
                        } catch (t) {
                            o6 && e8.warn("Could not create sandbox iframe for ".concat(e, " check, bailing to window.").concat(e, ": "), t)
                        }
                        return n ? o7[e] = n.bind(ek) : n
                    }("fetch"),
                    n = 0,
                    r = 0;
                return function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : ae(e.bufferSize || 64),
                        r = {};
                    return {
                        send: function(a) {
                            var o = [];
                            if (nH(a, function(t, n) {
                                    var a = n0[n];
                                    ! function(e, t) {
                                        var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : tc();
                                        return (e[t] || e.all || 0) > n
                                    }(r, a) ? o.push(t): e.recordDroppedEvent("ratelimit_backoff", a)
                                }), 0 === o.length) return Promise.resolve({});
                            var i = nz(a[0], o),
                                u = function(t) {
                                    if (nQ(i, ["client_report"])) {
                                        eP && e8.warn("Dropping client report. Will not send outcomes (reason: ".concat(t, ")."));
                                        return
                                    }
                                    nH(i, function(n, r) {
                                        e.recordDroppedEvent(t, n0[r])
                                    })
                                };
                            return n.add(function() {
                                return t({
                                    body: n$(i)
                                }).then(function(e) {
                                    return void 0 !== e.statusCode && (e.statusCode < 200 || e.statusCode >= 300) && eP && e8.warn("Sentry responded with status code ".concat(e.statusCode, " to sent event.")), r = function(e, t) {
                                        var n = t.statusCode,
                                            r = t.headers,
                                            a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : tc(),
                                            o = function(e) {
                                                for (var t = 1; t < arguments.length; t++) {
                                                    var n = null != arguments[t] ? arguments[t] : {},
                                                        r = Object.keys(n);
                                                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                                                    }))), r.forEach(function(t) {
                                                        var r;
                                                        r = n[t], t in e ? Object.defineProperty(e, t, {
                                                            value: r,
                                                            enumerable: !0,
                                                            configurable: !0,
                                                            writable: !0
                                                        }) : e[t] = r
                                                    })
                                                }
                                                return e
                                            }({}, e),
                                            i = null == r ? void 0 : r["x-sentry-rate-limits"],
                                            u = null == r ? void 0 : r["retry-after"];
                                        if (i) {
                                            var c = !0,
                                                l = !1,
                                                s = void 0;
                                            try {
                                                for (var f, d = i.trim().split(",")[Symbol.iterator](); !(c = (f = d.next()).done); c = !0) {
                                                    var p = (E = f.value.split(":", 5), function(e) {
                                                            if (Array.isArray(e)) return e
                                                        }(E) || function(e, t) {
                                                            var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                                            if (null != a) {
                                                                var o = [],
                                                                    i = !0,
                                                                    u = !1;
                                                                try {
                                                                    for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                                                                } catch (e) {
                                                                    u = !0, r = e
                                                                } finally {
                                                                    try {
                                                                        i || null == a.return || a.return()
                                                                    } finally {
                                                                        if (u) throw r
                                                                    }
                                                                }
                                                                return o
                                                            }
                                                        }(E, 5) || function(e, t) {
                                                            if (e) {
                                                                if ("string" == typeof e) return at(e, 5);
                                                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return at(e, t)
                                                            }
                                                        }(E, 5) || function() {
                                                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                                        }()),
                                                        m = p[0],
                                                        y = p[1],
                                                        v = p[4],
                                                        b = parseInt(m, 10),
                                                        h = (isNaN(b) ? 60 : b) * 1e3;
                                                    if (y) {
                                                        var g = !0,
                                                            S = !1,
                                                            _ = void 0;
                                                        try {
                                                            for (var E, O, w = y.split(";")[Symbol.iterator](); !(g = (O = w.next()).done); g = !0) {
                                                                var I = O.value;
                                                                "metric_bucket" === I ? (!v || v.split(";").includes("custom")) && (o[I] = a + h) : o[I] = a + h
                                                            }
                                                        } catch (e) {
                                                            S = !0, _ = e
                                                        } finally {
                                                            try {
                                                                g || null == w.return || w.return()
                                                            } finally {
                                                                if (S) throw _
                                                            }
                                                        }
                                                    } else o.all = a + h
                                                }
                                            } catch (e) {
                                                l = !0, s = e
                                            } finally {
                                                try {
                                                    c || null == d.return || d.return()
                                                } finally {
                                                    if (l) throw s
                                                }
                                            }
                                        } else u ? o.all = a + an(u, a) : 429 === n && (o.all = a + 6e4);
                                        return o
                                    }(r, e), e
                                }, function(e) {
                                    throw u("network_error"), eP && e8.error("Encountered error running transport request:", e), e
                                })
                            }).then(function(e) {
                                return e
                            }, function(e) {
                                if (e === r7) return eP && e8.error("Skipped sending event because buffer is full."), u("queue_overflow"), Promise.resolve({});
                                throw e
                            })
                        },
                        flush: function(e) {
                            return n.drain(e)
                        }
                    }
                }(e, function(a) {
                    var o;
                    return (o = function() {
                        var o, i, u, c;
                        return function(e, t) {
                            var n, r, a, o = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & a[0]) throw a[1];
                                        return a[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return i.next = u(0), i.throw = u(1), i.return = u(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                                return this
                            }), i;

                            function u(u) {
                                return function(c) {
                                    var l = [u, c];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; i && (i = 0, l[0] && (o = 0)), o;) try {
                                        if (n = 1, r && (a = 2 & l[0] ? r.return : l[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, l[1])).done) return a;
                                        switch (r = 0, a && (l = [2 & l[0], a.value]), l[0]) {
                                            case 0:
                                            case 1:
                                                a = l;
                                                break;
                                            case 4:
                                                return o.label++, {
                                                    value: l[1],
                                                    done: !1
                                                };
                                            case 5:
                                                o.label++, r = l[1], l = [0];
                                                continue;
                                            case 7:
                                                l = o.ops.pop(), o.trys.pop();
                                                continue;
                                            default:
                                                if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                                    o = 0;
                                                    continue
                                                }
                                                if (3 === l[0] && (!a || l[1] > a[0] && l[1] < a[3])) {
                                                    o.label = l[1];
                                                    break
                                                }
                                                if (6 === l[0] && o.label < a[1]) {
                                                    o.label = a[1], a = l;
                                                    break
                                                }
                                                if (a && o.label < a[2]) {
                                                    o.label = a[2], o.ops.push(l);
                                                    break
                                                }
                                                a[2] && o.ops.pop(), o.trys.pop();
                                                continue
                                        }
                                        l = t.call(e, o)
                                    } catch (e) {
                                        l = [6, e], r = 0
                                    } finally {
                                        n = a = 0
                                    }
                                    if (5 & l[0]) throw l[1];
                                    return {
                                        value: l[0] ? l[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    o = a.body.length, n += o, r++, i = function(e) {
                                        for (var t = 1; t < arguments.length; t++) {
                                            var n = null != arguments[t] ? arguments[t] : {},
                                                r = Object.keys(n);
                                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                                            }))), r.forEach(function(t) {
                                                var r;
                                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                                    value: r,
                                                    enumerable: !0,
                                                    configurable: !0,
                                                    writable: !0
                                                }) : e[t] = r
                                            })
                                        }
                                        return e
                                    }({
                                        body: a.body,
                                        method: "POST",
                                        referrerPolicy: "strict-origin",
                                        headers: e.headers,
                                        keepalive: n <= 6e4 && r < 15
                                    }, e.fetchOptions), l.label = 1;
                                case 1:
                                    return l.trys.push([1, 3, 4, 5]), [4, t(e.url, i)];
                                case 2:
                                    return [2, {
                                        statusCode: (u = l.sent()).status,
                                        headers: {
                                            "x-sentry-rate-limits": u.headers.get("X-Sentry-Rate-Limits"),
                                            "retry-after": u.headers.get("Retry-After")
                                        }
                                    }];
                                case 3:
                                    throw c = l.sent(), o7.fetch = void 0, c;
                                case 4:
                                    return n -= o, r--, [7];
                                case 5:
                                    return [2]
                            }
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(n, r) {
                            var a = o.apply(e, t);

                            function i(e) {
                                ie(a, n, r, i, u, "next", e)
                            }

                            function u(e) {
                                ie(a, n, r, i, u, "throw", e)
                            }
                            i(void 0)
                        })
                    })()
                }, ae(e.bufferSize || 40))
            }

            function ir(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ia(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function io(e) {
                if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
            }

            function ii(e) {
                return function(e) {
                    if (Array.isArray(e)) return ir(e)
                }(e) || io(e) || iu(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function iu(e, t) {
                if (e) {
                    if ("string" == typeof e) return ir(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ir(e, t)
                }
            }
            var ic = {
                idleTimeout: 1e3,
                finalTimeout: 3e4,
                childSpanTimeout: 15e3
            };

            function il(e) {
                var t, n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    a = new Map,
                    o = !1,
                    i = "externalFinish",
                    u = !r.disableAutoFinish,
                    c = [],
                    l = r.idleTimeout,
                    s = void 0 === l ? ic.idleTimeout : l,
                    f = r.finalTimeout,
                    d = void 0 === f ? ic.finalTimeout : f,
                    p = r.childSpanTimeout,
                    m = void 0 === p ? ic.childSpanTimeout : p,
                    y = r.beforeSpanEnd,
                    v = r.trimIdleSpanEndTimestamp,
                    b = void 0 === v || v,
                    h = t1();
                if (!h || !nr()) {
                    var g = new nW,
                        S = function(e) {
                            for (var t = 1; t < arguments.length; t++) {
                                var n = null != arguments[t] ? arguments[t] : {},
                                    r = Object.keys(n);
                                "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                    return Object.getOwnPropertyDescriptor(n, e).enumerable
                                }))), r.forEach(function(t) {
                                    var r;
                                    r = n[t], t in e ? Object.defineProperty(e, t, {
                                        value: r,
                                        enumerable: !0,
                                        configurable: !0,
                                        writable: !0
                                    }) : e[t] = r
                                })
                            }
                            return e
                        }({
                            sample_rate: "0",
                            sampled: "false"
                        }, nY(g));
                    return te(g, nF, S), g
                }
                var _ = tq(),
                    E = nj(),
                    O = (t = rd(e), tw(tq(), t), eP && e8.log("[Tracing] Started span is an idle span"), t);

                function w() {
                    n && (clearTimeout(n), n = void 0)
                }

                function I(e) {
                    w(), n = setTimeout(function() {
                        !o && 0 === a.size && u && (i = "idleTimeout", O.end(e))
                    }, s)
                }

                function A(e) {
                    n = setTimeout(function() {
                        !o && u && (i = "heartbeatFailed", O.end(e))
                    }, m)
                }

                function T(e) {
                    o = !0, a.clear(), c.forEach(function(e) {
                        return e()
                    }), tw(_, E);
                    var t = nE(O);
                    if (t.start_timestamp) {
                        t.data[t8] || O.setAttribute(t8, i);
                        var n = t.status;
                        n && "unknown" !== n || O.setStatus({
                            code: 1
                        }), e8.log('[Tracing] Idle span "'.concat(t.op, '" finished'));
                        var r = nN(O).filter(function(e) {
                                return e !== O
                            }),
                            u = 0;
                        r.forEach(function(t) {
                            t.isRecording() && (t.setStatus({
                                code: 2,
                                message: "cancelled"
                            }), t.end(e), eP && e8.log("[Tracing] Cancelling span since span ended early", JSON.stringify(t, void 0, 2)));
                            var n = nE(t),
                                r = n.timestamp,
                                a = n.start_timestamp,
                                o = void 0 === a ? 0 : a,
                                i = o <= e,
                                c = (void 0 === r ? 0 : r) - o <= (d + s) / 1e3;
                            if (eP) {
                                var l = JSON.stringify(t, void 0, 2);
                                i ? c || e8.log("[Tracing] Discarding span since it finished after idle span final timeout", l) : e8.log("[Tracing] Discarding span since it happened after idle span was finished", l)
                            }(!c || !i) && (O[nI] && O[nI].delete(t), u++)
                        }), u > 0 && O.setAttribute("sentry.idle_span_discarded_spans", u)
                    }
                }
                return O.end = new Proxy(O.end, {
                    apply: function(e, t, n) {
                        if (y && y(O), !ia(t, nW)) {
                            var r = function(e) {
                                    if (Array.isArray(e)) return e
                                }(n) || io(n) || iu(n) || function() {
                                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }(),
                                a = r[0],
                                o = r.slice(1),
                                i = nS(a || tb()),
                                u = nN(O).filter(function(e) {
                                    return e !== O
                                }),
                                c = nE(O);
                            if (!u.length || !b) return T(i), Reflect.apply(e, t, [i].concat(ii(o)));
                            var l = h.getOptions().ignoreSpans,
                                s = null == u ? void 0 : u.reduce(function(e, t) {
                                    var n = nE(t);
                                    return !n.timestamp || l && n3(n, l) ? e : e ? Math.max(e, n.timestamp) : n.timestamp
                                }, void 0),
                                f = c.start_timestamp,
                                p = Math.min(f ? f + d / 1e3 : 1 / 0, Math.max(f || -1 / 0, Math.min(i, s || 1 / 0)));
                            return T(p), Reflect.apply(e, t, [p].concat(ii(o)))
                        }
                    }
                }), c.push(h.on("spanStart", function(e) {
                    if (!(o || e === O || nE(e).timestamp || ia(e, rr) && e.isStandaloneSpan())) {
                        var t;
                        nN(O).includes(e) && (t = e.spanContext().spanId, w(), a.set(t, !0), A(tb() + m / 1e3))
                    }
                })), c.push(h.on("spanEnd", function(e) {
                    if (!o) {
                        var t;
                        t = e.spanContext().spanId, a.has(t) && a.delete(t), 0 === a.size && I(tb() + s / 1e3)
                    }
                })), c.push(h.on("idleSpanEnableAutoFinish", function(e) {
                    e === O && (u = !0, I(), a.size && A())
                })), r.disableAutoFinish || I(), setTimeout(function() {
                    o || (O.setStatus({
                        code: 2,
                        message: "deadline_exceeded"
                    }), i = "finalTimeout", O.end())
                }, d), O
            }
            var is = !1,
                id = function(e, t, n, r) {
                    var a, o;
                    return function(i) {
                        if (t.value >= 0 && (i || r) && ((o = t.value - (null != a ? a : 0)) || void 0 === a)) {
                            var u;
                            a = t.value, t.delta = o, u = t.value, t.rating = u > n[1] ? "poor" : u > n[0] ? "needs-improvement" : "good", e(t)
                        }
                    }
                },
                ip = function() {
                    var e, t, n = !(arguments.length > 0) || void 0 === arguments[0] || arguments[0],
                        r = null == (t = ek.performance) || null == (e = t.getEntriesByType) ? void 0 : e.call(t, "navigation")[0];
                    if (!n || r && r.responseStart > 0 && r.responseStart < performance.now()) return r
                },
                im = function() {
                    var e, t = ip();
                    return null != (e = null == t ? void 0 : t.activationStart) ? e : 0
                };

            function iy(e, t, n) {
                ek.document && ek.addEventListener(e, t, n)
            }

            function iv(e, t, n) {
                ek.document && ek.removeEventListener(e, t, n)
            }
            var ib = -1,
                ih = new Set,
                ig = function() {
                    var e, t;
                    return (null == (e = ek.document) ? void 0 : e.visibilityState) !== "hidden" || (null == (t = ek.document) ? void 0 : t.prerendering) ? 1 / 0 : 0
                },
                iS = function(e) {
                    var t;
                    if (("pagehide" === e.type || (null == (t = ek.document) ? void 0 : t.visibilityState) === "hidden") && ib > -1) {
                        if ("visibilitychange" === e.type || "pagehide" === e.type) {
                            var n = !0,
                                r = !1,
                                a = void 0;
                            try {
                                for (var o, i = ih[Symbol.iterator](); !(n = (o = i.next()).done); n = !0)(0, o.value)()
                            } catch (e) {
                                r = !0, a = e
                            } finally {
                                try {
                                    n || null == i.return || i.return()
                                } finally {
                                    if (r) throw a
                                }
                            }
                        }
                        isFinite(ib) || (ib = "visibilitychange" === e.type ? e.timeStamp : 0, iv("prerenderingchange", iS, !0))
                    }
                },
                i_ = function() {
                    if (ek.document && ib < 0) {
                        var e, t = im(),
                            n = ek.document.prerendering || null == (e = globalThis.performance.getEntriesByType("visibility-state").filter(function(e) {
                                return "hidden" === e.name && e.startTime > t
                            })[0]) ? void 0 : e.startTime;
                        ib = null != n ? n : ig(), iy("visibilitychange", iS, !0), iy("pagehide", iS, !0), iy("prerenderingchange", iS, !0)
                    }
                    return {
                        get firstHiddenTime() {
                            return ib
                        },
                        onHidden: function(e) {
                            ih.add(e)
                        }
                    }
                },
                iE = function(e) {
                    var t, n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : -1,
                        a = ip(),
                        o = "navigate";
                    return a && ((null == (t = ek.document) ? void 0 : t.prerendering) || im() > 0 ? o = "prerender" : (null == (n = ek.document) ? void 0 : n.wasDiscarded) ? o = "restore" : a.type && (o = a.type.replace(/_/g, "-"))), {
                        name: e,
                        value: r,
                        rating: "good",
                        delta: 0,
                        entries: [],
                        id: "v5-".concat(Date.now(), "-").concat(Math.floor(Math.random() * (9e12 - 1)) + 1e12),
                        navigationType: o
                    }
                },
                iO = new WeakMap;

            function iw(e, t) {
                try {
                    return iO.get(e) || iO.set(e, new t), iO.get(e)
                } catch (e) {
                    return new t
                }
            }
            var iI = function() {
                    var e;

                    function t() {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        t.prototype.__init.call(this), t.prototype.__init2.call(this)
                    }
                    return e = [{
                            key: "__init",
                            value: function() {
                                this._sessionValue = 0
                            }
                        }, {
                            key: "__init2",
                            value: function() {
                                this._sessionEntries = []
                            }
                        }, {
                            key: "_processEntry",
                            value: function(e) {
                                if (!e.hadRecentInput) {
                                    var t, n = this._sessionEntries[0],
                                        r = this._sessionEntries[this._sessionEntries.length - 1];
                                    this._sessionValue && n && r && e.startTime - r.startTime < 1e3 && e.startTime - n.startTime < 5e3 ? (this._sessionValue += e.value, this._sessionEntries.push(e)) : (this._sessionValue = e.value, this._sessionEntries = [e]), null == (t = this._onAfterProcessingUnexpectedShift) || t.call(this, e)
                                }
                            }
                        }],
                        function(e, t) {
                            for (var n = 0; n < t.length; n++) {
                                var r = t[n];
                                r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                            }
                        }(t.prototype, e), t
                }(),
                iA = function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
                    try {
                        if (PerformanceObserver.supportedEntryTypes.includes(e)) {
                            var r = new PerformanceObserver(function(e) {
                                Promise.resolve().then(function() {
                                    t(e.getEntries())
                                })
                            });
                            return r.observe(function(e) {
                                for (var t = 1; t < arguments.length; t++) {
                                    var n = null != arguments[t] ? arguments[t] : {},
                                        r = Object.keys(n);
                                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                                    }))), r.forEach(function(t) {
                                        var r;
                                        r = n[t], t in e ? Object.defineProperty(e, t, {
                                            value: r,
                                            enumerable: !0,
                                            configurable: !0,
                                            writable: !0
                                        }) : e[t] = r
                                    })
                                }
                                return e
                            }({
                                type: e,
                                buffered: !0
                            }, n)), r
                        }
                    } catch (e) {}
                },
                iT = function(e) {
                    var t = !1;
                    return function() {
                        t || (e(), t = !0)
                    }
                },
                iN = function(e) {
                    var t;
                    (null == (t = ek.document) ? void 0 : t.prerendering) ? addEventListener("prerenderingchange", function() {
                        return e()
                    }, !0): e()
                },
                ik = [1800, 3e3],
                ij = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    iN(function() {
                        var n, r = i_(),
                            a = iE("FCP"),
                            o = iA("paint", function(e) {
                                var t = !0,
                                    i = !1,
                                    u = void 0;
                                try {
                                    for (var c, l = e[Symbol.iterator](); !(t = (c = l.next()).done); t = !0) {
                                        var s = c.value;
                                        "first-contentful-paint" === s.name && (o.disconnect(), s.startTime < r.firstHiddenTime && (a.value = Math.max(s.startTime - im(), 0), a.entries.push(s), n(!0)))
                                    }
                                } catch (e) {
                                    i = !0, u = e
                                } finally {
                                    try {
                                        t || null == l.return || l.return()
                                    } finally {
                                        if (i) throw u
                                    }
                                }
                            });
                        o && (n = id(e, a, ik, t.reportAllChanges))
                    })
                },
                ix = [.1, .25],
                iR = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    ij(iT(function() {
                        var n, r, a = iE("CLS", 0),
                            o = i_(),
                            i = iw(t, iI),
                            u = function(e) {
                                var t = !0,
                                    r = !1,
                                    o = void 0;
                                try {
                                    for (var u, c = e[Symbol.iterator](); !(t = (u = c.next()).done); t = !0) {
                                        var l = u.value;
                                        i._processEntry(l)
                                    }
                                } catch (e) {
                                    r = !0, o = e
                                } finally {
                                    try {
                                        t || null == c.return || c.return()
                                    } finally {
                                        if (r) throw o
                                    }
                                }
                                i._sessionValue > a.value && (a.value = i._sessionValue, a.entries = i._sessionEntries, n())
                            },
                            c = iA("layout-shift", u);
                        c && (n = id(e, a, ix, t.reportAllChanges), o.onHidden(function() {
                            u(c.takeRecords()), n(!0)
                        }), null == ek || null == (r = ek.setTimeout) || r.call(ek, n))
                    }))
                },
                iP = 0,
                iV = 1 / 0,
                iZ = 0,
                iC = function(e) {
                    e.forEach(function(e) {
                        e.interactionId && (iV = Math.min(iV, e.interactionId), iP = (iZ = Math.max(iZ, e.interactionId)) ? (iZ - iV) / 7 + 1 : 0)
                    })
                },
                iD = function() {
                    return J ? iP : performance.interactionCount || 0
                },
                iF = function() {
                    "interactionCount" in performance || J || (J = iA("event", iC, {
                        type: "event",
                        buffered: !0,
                        durationThreshold: 0
                    }))
                },
                iL = 0,
                iX = function() {
                    var e;

                    function t() {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        t.prototype.__init.call(this), t.prototype.__init2.call(this)
                    }
                    return e = [{
                            key: "__init",
                            value: function() {
                                this._longestInteractionList = []
                            }
                        }, {
                            key: "__init2",
                            value: function() {
                                this._longestInteractionMap = new Map
                            }
                        }, {
                            key: "_resetInteractions",
                            value: function() {
                                iL = iD(), this._longestInteractionList.length = 0, this._longestInteractionMap.clear()
                            }
                        }, {
                            key: "_estimateP98LongestInteraction",
                            value: function() {
                                var e = Math.min(this._longestInteractionList.length - 1, Math.floor((iD() - iL) / 50));
                                return this._longestInteractionList[e]
                            }
                        }, {
                            key: "_processEntry",
                            value: function(e) {
                                if (null == (u = this._onBeforeProcessingEntry) || u.call(this, e), e.interactionId || "first-input" === e.entryType) {
                                    var t = this._longestInteractionList.at(-1),
                                        n = this._longestInteractionMap.get(e.interactionId);
                                    if (n || this._longestInteractionList.length < 10 || e.duration > t._latency) {
                                        if (n ? e.duration > n._latency ? (n.entries = [e], n._latency = e.duration) : e.duration === n._latency && e.startTime === n.entries[0].startTime && n.entries.push(e) : (n = {
                                                id: e.interactionId,
                                                entries: [e],
                                                _latency: e.duration
                                            }, this._longestInteractionMap.set(n.id, n), this._longestInteractionList.push(n)), this._longestInteractionList.sort(function(e, t) {
                                                return t._latency - e._latency
                                            }), this._longestInteractionList.length > 10) {
                                            var r = this._longestInteractionList.splice(10),
                                                a = !0,
                                                o = !1,
                                                i = void 0;
                                            try {
                                                for (var u, c, l, s = r[Symbol.iterator](); !(a = (l = s.next()).done); a = !0) {
                                                    var f = l.value;
                                                    this._longestInteractionMap.delete(f.id)
                                                }
                                            } catch (e) {
                                                o = !0, i = e
                                            } finally {
                                                try {
                                                    a || null == s.return || s.return()
                                                } finally {
                                                    if (o) throw i
                                                }
                                            }
                                        }
                                        null == (c = this._onAfterProcessingINPCandidate) || c.call(this, n)
                                    }
                                }
                            }
                        }],
                        function(e, t) {
                            for (var n = 0; n < t.length; n++) {
                                var r = t[n];
                                r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                            }
                        }(t.prototype, e), t
                }(),
                iY = function(e) {
                    var t, n = ek.requestIdleCallback || ek.setTimeout;
                    (null == (t = ek.document) ? void 0 : t.visibilityState) === "hidden" ? e(): (iy("visibilitychange", e = iT(e), {
                        once: !0,
                        capture: !0
                    }), iy("pagehide", e, {
                        once: !0,
                        capture: !0
                    }), n(function() {
                        e(), iv("visibilitychange", e, {
                            capture: !0
                        }), iv("pagehide", e, {
                            capture: !0
                        })
                    }))
                },
                iW = [200, 500],
                iB = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    if (globalThis.PerformanceEventTiming && "interactionId" in PerformanceEventTiming.prototype) {
                        var n = i_();
                        iN(function() {
                            iF();
                            var r, a, o = iE("INP"),
                                i = iw(t, iX),
                                u = function(e) {
                                    iY(function() {
                                        var t = !0,
                                            n = !1,
                                            a = void 0;
                                        try {
                                            for (var u, c = e[Symbol.iterator](); !(t = (u = c.next()).done); t = !0) {
                                                var l = u.value;
                                                i._processEntry(l)
                                            }
                                        } catch (e) {
                                            n = !0, a = e
                                        } finally {
                                            try {
                                                t || null == c.return || c.return()
                                            } finally {
                                                if (n) throw a
                                            }
                                        }
                                        var s = i._estimateP98LongestInteraction();
                                        s && s._latency !== o.value && (o.value = s._latency, o.entries = s.entries, r())
                                    })
                                },
                                c = iA("event", u, {
                                    durationThreshold: null != (a = t.durationThreshold) ? a : 40
                                });
                            r = id(e, o, iW, t.reportAllChanges), c && (c.observe({
                                type: "first-input",
                                buffered: !0
                            }), n.onHidden(function() {
                                u(c.takeRecords()), r(!0)
                            }))
                        })
                    }
                },
                iG = function() {
                    var e;

                    function t() {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function")
                    }
                    return e = [{
                            key: "_processEntry",
                            value: function(e) {
                                var t;
                                null == (t = this._onBeforeProcessingEntry) || t.call(this, e)
                            }
                        }],
                        function(e, t) {
                            for (var n = 0; n < t.length; n++) {
                                var r = t[n];
                                r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                            }
                        }(t.prototype, e), t
                }(),
                iU = [2500, 4e3],
                iM = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    iN(function() {
                        var n, r = i_(),
                            a = iE("LCP"),
                            o = iw(t, iG),
                            i = function(e) {
                                t.reportAllChanges || (e = e.slice(-1));
                                var i = !0,
                                    u = !1,
                                    c = void 0;
                                try {
                                    for (var l, s = e[Symbol.iterator](); !(i = (l = s.next()).done); i = !0) {
                                        var f = l.value;
                                        o._processEntry(f), f.startTime < r.firstHiddenTime && (a.value = Math.max(f.startTime - im(), 0), a.entries = [f], n())
                                    }
                                } catch (e) {
                                    u = !0, c = e
                                } finally {
                                    try {
                                        i || null == s.return || s.return()
                                    } finally {
                                        if (u) throw c
                                    }
                                }
                            },
                            u = iA("largest-contentful-paint", i);
                        if (u) {
                            n = id(e, a, iU, t.reportAllChanges);
                            for (var c = iT(function() {
                                    i(u.takeRecords()), u.disconnect(), n(!0)
                                }), l = function(e) {
                                    e.isTrusted && (iY(c), iv(e.type, l, {
                                        capture: !0
                                    }))
                                }, s = 0, f = ["keydown", "click", "visibilitychange"]; s < f.length; s++) iy(f[s], l, {
                                capture: !0
                            })
                        }
                    })
                },
                iJ = [800, 1800],
                iK = function(e) {
                    var t, n;
                    (null == (t = ek.document) ? void 0 : t.prerendering) ? iN(function() {
                        return iK(e)
                    }): (null == (n = ek.document) ? void 0 : n.readyState) !== "complete" ? addEventListener("load", function() {
                        return iK(e)
                    }, !0) : setTimeout(e)
                },
                iz = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        n = iE("TTFB"),
                        r = id(e, n, iJ, t.reportAllChanges);
                    iK(function() {
                        var e = ip();
                        e && (n.value = Math.max(e.responseStart - im(), 0), n.entries = [e], r(!0))
                    })
                },
                iH = {},
                iQ = {};

            function iq(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                return i4("cls", e, i2, K, t)
            }

            function i$(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                return i4("lcp", e, i3, z, t)
            }

            function i0(e, t) {
                var n, r;
                return i8(e, t), iQ[e] || (r = {}, "event" === (n = e) && (r.durationThreshold = 0), iA(n, function(e) {
                    i1(n, {
                        entries: e
                    })
                }, r), iQ[e] = !0), i6(e, t)
            }

            function i1(e, t) {
                var n = iH[e];
                if (null == n ? void 0 : n.length) {
                    var r = !0,
                        a = !1,
                        o = void 0;
                    try {
                        for (var i, u = n[Symbol.iterator](); !(r = (i = u.next()).done); r = !0) {
                            var c = i.value;
                            try {
                                c(t)
                            } catch (t) {
                                o6 && e8.error("Error while triggering instrumentation handler.\nType: ".concat(e, "\nName: ").concat(tR(c), "\nError:"), t)
                            }
                        }
                    } catch (e) {
                        a = !0, o = e
                    } finally {
                        try {
                            r || null == u.return || u.return()
                        } finally {
                            if (a) throw o
                        }
                    }
                }
            }

            function i2() {
                return iR(function(e) {
                    i1("cls", {
                        metric: e
                    }), K = e
                }, {
                    reportAllChanges: !0
                })
            }

            function i3() {
                return iM(function(e) {
                    i1("lcp", {
                        metric: e
                    }), z = e
                }, {
                    reportAllChanges: !0
                })
            }

            function i5() {
                return iz(function(e) {
                    i1("ttfb", {
                        metric: e
                    }), H = e
                })
            }

            function i9() {
                return iB(function(e) {
                    i1("inp", {
                        metric: e
                    }), Q = e
                })
            }

            function i4(e, t, n, r) {
                var a, o = arguments.length > 4 && void 0 !== arguments[4] && arguments[4];
                return i8(e, t), iQ[e] || (a = n(), iQ[e] = !0), r && t({
                    metric: r
                }), i6(e, t, o ? a : void 0)
            }

            function i8(e, t) {
                iH[e] = iH[e] || [], iH[e].push(t)
            }

            function i6(e, t, n) {
                return function() {
                    n && n();
                    var r = iH[e];
                    if (r) {
                        var a = r.indexOf(t); - 1 !== a && r.splice(a, 1)
                    }
                }
            }
            var i7 = function(e) {
                var t = function(t) {
                    var n;
                    ("pagehide" === t.type || (null == (n = ek.document) ? void 0 : n.visibilityState) === "hidden") && e(t)
                };
                iy("visibilitychange", t, {
                    capture: !0,
                    once: !0
                }), iy("pagehide", t, {
                    capture: !0,
                    once: !0
                })
            };

            function ue(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ut() {
                return (ut = Object.assign || function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = arguments[t];
                        for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (e[r] = n[r])
                    }
                    return e
                }).apply(this, arguments)
            }

            function un(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function ur(e) {
                return "number" == typeof e && isFinite(e)
            }

            function ua(e, t, n, r) {
                var a = ut({}, function(e) {
                        if (null == e) throw TypeError("Cannot destructure " + e);
                        return e
                    }(r)),
                    o = nE(e).start_timestamp;
                return o && o > t && "function" == typeof e.updateStartTime && e.updateStartTime(t), rp(e, function() {
                    var e = rd(un({
                        startTime: t
                    }, a));
                    return e && e.end(n), e
                })
            }

            function uo(e) {
                var t, n, r = t1();
                if (r) {
                    var a = e.name,
                        o = e.transaction,
                        i = e.attributes,
                        u = e.startTime,
                        c = r.getOptions(),
                        l = c.release,
                        s = c.environment,
                        f = c.sendDefaultPii,
                        d = r.getIntegrationByName("Replay"),
                        p = null == d ? void 0 : d.getReplayId(),
                        m = tq(),
                        y = m.getUser(),
                        v = void 0 !== y ? y.email || y.id || y.ip_address : void 0;
                    try {
                        n = m.getScopeData().contexts.profile.profile_id
                    } catch (e) {}
                    return rd({
                        name: a,
                        attributes: un({
                            release: l,
                            environment: s,
                            user: v || void 0,
                            profile_id: n || void 0,
                            replay_id: p || void 0,
                            transaction: o,
                            "user_agent.original": null == (t = ek.navigator) ? void 0 : t.userAgent,
                            "client.address": f ? "{{auto}}" : void 0
                        }, i),
                        startTime: u,
                        experimental: {
                            standalone: !0
                        }
                    })
                }
            }

            function ui() {
                return ek.addEventListener && ek.performance
            }

            function uu(e) {
                return e / 1e3
            }

            function uc(e) {
                try {
                    return PerformanceObserver.supportedEntryTypes.includes(e)
                } catch (e) {
                    return !1
                }
            }

            function ul(e, t) {
                var n, r = !1;

                function a(e) {
                    !r && n && t(e, n), r = !0
                }
                i7(function() {
                    a("pagehide")
                });
                var o = e.on("beforeStartNavigationSpan", function(e, t) {
                        (null == t ? void 0 : t.isRedirect) || (a("navigation"), o(), i())
                    }),
                    i = e.on("afterStartPageLoadSpan", function(e) {
                        n = e.spanContext().spanId, i()
                    })
            }

            function us(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function uf(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function ud(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function up(e) {
                return e ? ((tg() || performance.timeOrigin) + e) / 1e3 : e
            }

            function um(e) {
                var t, n, r, a = {};
                if (void 0 != e.nextHopProtocol) {
                    var o = function(e) {
                            var t = "unknown",
                                n = "unknown",
                                r = "",
                                a = !0,
                                o = !1,
                                i = void 0;
                            try {
                                for (var u, c = e[Symbol.iterator](); !(a = (u = c.next()).done); a = !0) {
                                    var l, s, f = u.value;
                                    if ("/" === f) {
                                        l = e.split("/"), t = (s = function(e) {
                                            if (Array.isArray(e)) return e
                                        }(l) || function(e, t) {
                                            var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                            if (null != a) {
                                                var o = [],
                                                    i = !0,
                                                    u = !1;
                                                try {
                                                    for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                                                } catch (e) {
                                                    u = !0, r = e
                                                } finally {
                                                    try {
                                                        i || null == a.return || a.return()
                                                    } finally {
                                                        if (u) throw r
                                                    }
                                                }
                                                return o
                                            }
                                        }(l, 2) || function(e, t) {
                                            if (e) {
                                                if ("string" == typeof e) return ue(e, 2);
                                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ue(e, t)
                                            }
                                        }(l, 2) || function() {
                                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                        }())[0], n = s[1];
                                        break
                                    }
                                    if (!isNaN(Number(f))) {
                                        t = "h" === r ? "http" : r, n = e.split(r)[1];
                                        break
                                    }
                                    r += f
                                }
                            } catch (e) {
                                o = !0, i = e
                            } finally {
                                try {
                                    a || null == c.return || c.return()
                                } finally {
                                    if (o) throw i
                                }
                            }
                            return r === e && (t = r), {
                                name: t,
                                version: n
                            }
                        }(e.nextHopProtocol),
                        i = o.name,
                        u = o.version;
                    a["network.protocol.version"] = u, a["network.protocol.name"] = i
                }
                if (!(tg() || (null == (r = ui()) ? void 0 : r.timeOrigin))) return a;
                return Object.fromEntries(Object.entries((t = function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = null != arguments[t] ? arguments[t] : {},
                            r = Object.keys(n);
                        "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                            return Object.getOwnPropertyDescriptor(n, e).enumerable
                        }))), r.forEach(function(t) {
                            var r;
                            r = n[t], t in e ? Object.defineProperty(e, t, {
                                value: r,
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : e[t] = r
                        })
                    }
                    return e
                }({}, a), n = n = {
                    "http.request.redirect_start": up(e.redirectStart),
                    "http.request.redirect_end": up(e.redirectEnd),
                    "http.request.worker_start": up(e.workerStart),
                    "http.request.fetch_start": up(e.fetchStart),
                    "http.request.domain_lookup_start": up(e.domainLookupStart),
                    "http.request.domain_lookup_end": up(e.domainLookupEnd),
                    "http.request.connect_start": up(e.connectStart),
                    "http.request.secure_connection_start": up(e.secureConnectionStart),
                    "http.request.connection_end": up(e.connectEnd),
                    "http.request.request_start": up(e.requestStart),
                    "http.request.response_start": up(e.responseStart),
                    "http.request.response_end": up(e.responseEnd),
                    "http.request.time_to_first_byte": null != e.responseStart ? e.responseStart / 1e3 : void 0
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(n)).forEach(function(e) {
                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(n, e))
                }), t)).filter(function(e) {
                    return null != (function(e) {
                        if (Array.isArray(e)) return e
                    }(e) || function(e, t) {
                        var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != a) {
                            var o = [],
                                i = !0,
                                u = !1;
                            try {
                                for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                            } catch (e) {
                                u = !0, r = e
                            } finally {
                                try {
                                    i || null == a.return || a.return()
                                } finally {
                                    if (u) throw r
                                }
                            }
                            return o
                        }
                    }(e, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return ud(e, 2);
                            var n = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ud(e, t)
                        }
                    }(e, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())[1]
                }))
            }

            function uy(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function uv(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function ub(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        uv(e, t, n[t])
                    })
                }
                return e
            }

            function uh(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return uy(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return uy(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ug = 0,
                uS = {};

            function u_(e, t, n, r) {
                var a, o = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : n,
                    i = t["secureConnection" === (a = n) ? "connectEnd" : "fetch" === a ? "domainLookupStart" : "".concat(a, "End")],
                    u = t["".concat(n, "Start")];
                u && i && ua(e, r + uu(u), r + uu(i), {
                    op: "browser.".concat(o),
                    name: t.name,
                    attributes: ub(uv({}, t4, "auto.ui.browser.metrics"), "redirect" === n && null != t.redirectCount ? {
                        "http.redirect_count": t.redirectCount
                    } : {})
                })
            }
            var uE = n(61);

            function uO(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            var uw = [],
                uI = new Map,
                uA = new Map,
                uT = {
                    click: "click",
                    pointerdown: "click",
                    pointerup: "click",
                    mousedown: "click",
                    mouseup: "click",
                    touchstart: "click",
                    touchend: "click",
                    mouseover: "hover",
                    mouseout: "hover",
                    mouseenter: "hover",
                    mouseleave: "hover",
                    pointerover: "hover",
                    pointerout: "hover",
                    pointerenter: "hover",
                    pointerleave: "hover",
                    dragstart: "drag",
                    dragend: "drag",
                    drag: "drag",
                    dragenter: "drag",
                    dragleave: "drag",
                    dragover: "drag",
                    drop: "drag",
                    keydown: "press",
                    keyup: "press",
                    keypress: "press",
                    input: "press"
                },
                uN = function(e) {
                    var t, n, r = e.metric;
                    if (void 0 != r.value) {
                        var a = uu(r.value);
                        if (!(a > 60)) {
                            var o = r.entries.find(function(e) {
                                return e.duration === r.value && uT[e.name]
                            });
                            if (o) {
                                var i = o.interactionId,
                                    u = uT[o.name],
                                    c = uu(tg() + o.startTime),
                                    l = nj(),
                                    s = l ? nk(l) : void 0,
                                    f = null != i ? uI.get(i) : void 0,
                                    d = (null == f ? void 0 : f.span) || s,
                                    p = d ? nE(d).description : tq().getScopeData().transactionName,
                                    m = uo({
                                        name: (null == f ? void 0 : f.elementName) || eH(o.target),
                                        transaction: p,
                                        attributes: (uO(t = {}, t4, "auto.http.browser.inp"), uO(t, t9, "ui.interaction.".concat(u)), uO(t, nn, o.duration), t),
                                        startTime: c
                                    });
                                m && (m.addEvent("inp", (uO(n = {}, t6, "millisecond"), uO(n, t7, r.value), n)), m.end(c + a))
                            }
                        }
                    }
                };

            function uk(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function uj(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            var ux = function(e) {
                var t = e.entries,
                    n = nj(),
                    r = n ? nk(n) : void 0,
                    a = r ? nE(r).description : tq().getScopeData().transactionName;
                t.forEach(function(e) {
                    var t, n, r;
                    if (e.identifier) {
                        var o, i = e.name,
                            u = e.renderTime,
                            c = e.loadTime,
                            l = (o = c ? [uu(c), "load-time"] : u ? [uu(u), "render-time"] : [tb(), "entry-emission"], function(e) {
                                if (Array.isArray(e)) return e
                            }(o) || function(e, t) {
                                var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != a) {
                                    var o = [],
                                        i = !0,
                                        u = !1;
                                    try {
                                        for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                                    } catch (e) {
                                        u = !0, r = e
                                    } finally {
                                        try {
                                            i || null == a.return || a.return()
                                        } finally {
                                            if (u) throw r
                                        }
                                    }
                                    return o
                                }
                            }(o, 2) || function(e, t) {
                                if (e) {
                                    if ("string" == typeof e) return uk(e, 2);
                                    var n = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return uk(e, t)
                                }
                            }(o, 2) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()),
                            s = l[0],
                            f = l[1],
                            d = "image-paint" === i ? uu(Math.max(0, (null != u ? u : 0) - (null != c ? c : 0))) : 0,
                            p = (uj(r = {}, t4, "auto.ui.browser.elementtiming"), uj(r, t9, "ui.elementtiming"), uj(r, t2, "component"), uj(r, "sentry.span_start_time_source", f), uj(r, "sentry.transaction_name", a), uj(r, "element.id", e.id), uj(r, "element.type", (null == (n = e.element) || null == (t = n.tagName) ? void 0 : t.toLowerCase()) || "unknown"), uj(r, "element.size", e.naturalWidth && e.naturalHeight ? "".concat(e.naturalWidth, "x").concat(e.naturalHeight) : void 0), uj(r, "element.render_time", u), uj(r, "element.load_time", c), uj(r, "element.url", e.url || void 0), uj(r, "element.identifier", e.identifier), uj(r, "element.paint_type", i), r);
                        rf({
                            name: "element[".concat(e.identifier, "]"),
                            attributes: p,
                            startTime: s,
                            onlyIfParent: !0
                        }, function(e) {
                            e.end(s + d)
                        })
                    }
                })
            };

            function uR(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function uP(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        uR(e, t, n[t])
                    })
                }
                return e
            }

            function uV(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }
            var uZ = "sentry_previous_trace";

            function uC(e) {
                return 1 === e.traceFlags
            }

            function uD() {
                var e, t, n, r, a, o, i, u, c, l = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    s = l.client || t1();
                if (!((null == (i = t1()) ? void 0 : i.getOptions().enabled) !== !1 && (null == i ? void 0 : i.getTransport())) || !s) return {};
                var f = tH(ej());
                if (f.getTraceData) return f.getTraceData(l);
                var d = l.scope || tq(),
                    p = l.span || nj(),
                    m = p ? nv((u = p.spanContext()).traceId, u.spanId, nO(p)) : (t = (e = d.getPropagationContext()).traceId, n = e.sampled, nv(t, e.propagationSpanId, n)),
                    y = function(e) {
                        if (e) {
                            var t = Object.entries(e).reduce(function(e, t) {
                                var n = ns(t, 2),
                                    r = n[0],
                                    a = n[1];
                                return a && (e["".concat(nf).concat(r)] = a), e
                            }, {});
                            return 0 !== Object.keys(t).length ? Object.entries(t).reduce(function(e, t, n) {
                                var r = ns(t, 2),
                                    a = r[0],
                                    o = r[1],
                                    i = "".concat(encodeURIComponent(a), "=").concat(encodeURIComponent(o)),
                                    u = 0 === n ? i : "".concat(e, ",").concat(i);
                                return u.length > 8192 ? (eP && e8.warn("Not adding key: ".concat(a, " with val: ").concat(o, " to baggage header due to exceeding baggage size limits.")), e) : u
                            }, "") : void 0
                        }
                    }(p ? nY(p) : nX(s, d));
                if (!ny.test(m)) return e8.warn("Invalid sentry-trace data. Cannot generate trace data"), {};
                var v = {
                    "sentry-trace": m,
                    baggage: y
                };
                return l.propagateTraceparent && (v.traceparent = p ? nb((c = p.spanContext()).traceId, c.spanId, nO(p)) : (a = (r = d.getPropagationContext()).traceId, o = r.sampled, nb(a, r.propagationSpanId, o))), v
            }

            function uF(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function uL(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function uX(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        uL(e, t, n[t])
                    })
                }
                return e
            }

            function uY(e) {
                return function(e) {
                    if (Array.isArray(e)) return uF(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return uF(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return uF(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function uW(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function uB(e) {
                return e.split(",").some(function(e) {
                    return e.trim().startsWith(nf)
                })
            }

            function uG(e, t, n, r) {
                var a, o = (uL(a = {
                    url: od(e),
                    type: "fetch",
                    "http.method": n
                }, t4, r), uL(a, t9, "http.client"), a);
                return t && (ol(t) || (o["http.url"] = od(t.href), o["server.address"] = t.host), t.search && (o["http.query"] = t.search), t.hash && (o["http.fragment"] = t.hash)), o
            }

            function uU(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function uM(e) {
                try {
                    return new URL(e, ek.location.origin).href
                } catch (e) {
                    return
                }
            }

            function uJ(e) {
                try {
                    return new Headers(e)
                } catch (e) {
                    return
                }
            }

            function uK(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function uz(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        uK(e, t, n[t])
                    })
                }
                return e
            }
            Symbol.for("sentry__originalRequestBody");
            var uH = new WeakMap,
                uQ = new Map,
                uq = {
                    traceFetch: !0,
                    traceXHR: !0,
                    enableHTTPTimings: !0,
                    trackFetchStreamPerformance: !1
                };

            function u$(e) {
                var t = nE(e).data.url;
                if (t && "string" == typeof t) var n = i0("resource", function(r) {
                    r.entries.forEach(function(r) {
                        "resource" === r.entryType && "initiatorType" in r && "string" == typeof r.nextHopProtocol && ("fetch" === r.initiatorType || "xmlhttprequest" === r.initiatorType) && r.name.endsWith(t) && (e.setAttributes(um(r)), setTimeout(n))
                    })
                })
            }

            function u0(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function u1(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        u0(e, t, n[t])
                    })
                }
                return e
            }

            function u2(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }
            var u3 = u1(u2(u1({}, ic), {
                instrumentNavigation: !0,
                instrumentPageLoad: !0,
                markBackgroundSpan: !0,
                enableLongTask: !0,
                enableLongAnimationFrame: !0,
                enableInp: !0,
                enableElementTiming: !0,
                ignoreResourceSpans: [],
                ignorePerformanceApiSpans: [],
                detectRedirects: !0,
                linkPreviousTrace: "in-memory",
                consistentTraceSampling: !1,
                enableReportPageLoaded: !1,
                _experiments: {}
            }), uq);

            function u5(e) {
                var t = ek.document,
                    n = null == t ? void 0 : t.querySelector("meta[name=".concat(e, "]"));
                return (null == n ? void 0 : n.getAttribute("content")) || void 0
            }
            var u9 = "_sentry_idleSpan";

            function u4(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function u8(e, t, n, r, a, o, i) {
                try {
                    var u = e[o](i),
                        c = u.value
                } catch (e) {
                    n(e);
                    return
                }
                u.done ? t(c) : Promise.resolve(c).then(r, a)
            }

            function u6(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var o = e.apply(t, n);

                        function i(e) {
                            u8(o, r, a, i, u, "next", e)
                        }

                        function u(e) {
                            u8(o, r, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function u7(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = u(0), i.throw = u(1), i.return = u(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function u(u) {
                    return function(c) {
                        var l = [u, c];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, l[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & l[0] ? r.return : l[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, l[1])).done) return a;
                            switch (r = 0, a && (l = [2 & l[0], a.value]), l[0]) {
                                case 0:
                                case 1:
                                    a = l;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: l[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, r = l[1], l = [0];
                                    continue;
                                case 7:
                                    l = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === l[0] && (!a || l[1] > a[0] && l[1] < a[3])) {
                                        o.label = l[1];
                                        break
                                    }
                                    if (6 === l[0] && o.label < a[1]) {
                                        o.label = a[1], a = l;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(l);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            l = t.call(e, o)
                        } catch (e) {
                            l = [6, e], r = 0
                        } finally {
                            n = a = 0
                        }
                        if (5 & l[0]) throw l[1];
                        return {
                            value: l[0] ? l[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function ce(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ct(e, t, n, r, a, o, i) {
                try {
                    var u = e[o](i),
                        c = u.value
                } catch (e) {
                    n(e);
                    return
                }
                u.done ? t(c) : Promise.resolve(c).then(r, a)
            }

            function cn(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var o = e.apply(t, n);

                        function i(e) {
                            ct(o, r, a, i, u, "next", e)
                        }

                        function u(e) {
                            ct(o, r, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function cr(e) {
                return function(e) {
                    if (Array.isArray(e)) return ce(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ce(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ce(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ca(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = u(0), i.throw = u(1), i.return = u(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function u(u) {
                    return function(c) {
                        var l = [u, c];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, l[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & l[0] ? r.return : l[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, l[1])).done) return a;
                            switch (r = 0, a && (l = [2 & l[0], a.value]), l[0]) {
                                case 0:
                                case 1:
                                    a = l;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: l[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, r = l[1], l = [0];
                                    continue;
                                case 7:
                                    l = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === l[0] && (!a || l[1] > a[0] && l[1] < a[3])) {
                                        o.label = l[1];
                                        break
                                    }
                                    if (6 === l[0] && o.label < a[1]) {
                                        o.label = a[1], a = l;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(l);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            l = t.call(e, o)
                        } catch (e) {
                            l = [6, e], r = 0
                        } finally {
                            n = a = 0
                        }
                        if (5 & l[0]) throw l[1];
                        return {
                            value: l[0] ? l[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function co(e) {
                return new Promise(function(t, n) {
                    e.oncomplete = e.onsuccess = function() {
                        return t(e.result)
                    }, e.onabort = e.onerror = function() {
                        return n(e.error)
                    }
                })
            }

            function ci(e) {
                return co(e.getAllKeys())
            }

            function cu(e) {
                var t;

                function n() {
                    var n, r, a, o;
                    return void 0 == t && (n = e.dbName || "sentry-offline", r = e.storeName || "queue", (a = indexedDB.open(n)).onupgradeneeded = function() {
                        return a.result.createObjectStore(r)
                    }, o = co(a), t = function(e) {
                        return o.then(function(t) {
                            return e(t.transaction(r, "readwrite").objectStore(r))
                        })
                    }), t
                }
                return {
                    push: function(t) {
                        return cn(function() {
                            var r;
                            return ca(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        return a.trys.push([0, 3, , 4]), [4, n$(t)];
                                    case 1:
                                        var o, i;
                                        return r = a.sent(), [4, (o = n(), i = e.maxQueueSize || 30, o(function(e) {
                                            return ci(e).then(function(t) {
                                                var n;
                                                if (!(t.length >= i)) return e.put(r, (n = Math).max.apply(n, cr(t).concat([0])) + 1), co(e.transaction)
                                            })
                                        }))];
                                    case 2:
                                    case 3:
                                        return a.sent(), [3, 4];
                                    case 4:
                                        return [2]
                                }
                            })
                        })()
                    },
                    unshift: function(t) {
                        return cn(function() {
                            var r;
                            return ca(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        return a.trys.push([0, 3, , 4]), [4, n$(t)];
                                    case 1:
                                        var o, i;
                                        return r = a.sent(), [4, (o = n(), i = e.maxQueueSize || 30, o(function(e) {
                                            return ci(e).then(function(t) {
                                                var n;
                                                if (!(t.length >= i)) return e.put(r, (n = Math).min.apply(n, cr(t).concat([0])) - 1), co(e.transaction)
                                            })
                                        }))];
                                    case 2:
                                    case 3:
                                        return a.sent(), [3, 4];
                                    case 4:
                                        return [2]
                                }
                            })
                        })()
                    },
                    shift: function() {
                        return cn(function() {
                            var e;
                            return ca(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return t.trys.push([0, 2, , 3]), [4, n()(function(e) {
                                            return ci(e).then(function(t) {
                                                var n = t[0];
                                                if (null != n) return co(e.get(n)).then(function(t) {
                                                    return e.delete(n), co(e.transaction).then(function() {
                                                        return t
                                                    })
                                                })
                                            })
                                        })];
                                    case 1:
                                        if (e = t.sent()) return [2, function(e) {
                                            var t = "string" == typeof e ? nq(e) : e;

                                            function n(e) {
                                                var n = t.subarray(0, e);
                                                return t = t.subarray(e + 1), n
                                            }

                                            function r() {
                                                var e, r, a = t.indexOf(10);
                                                return a < 0 && (a = t.length), JSON.parse((e = n(a), (r = ex(ek)).decodePolyfill ? r.decodePolyfill(e) : new TextDecoder().decode(e)))
                                            }
                                            for (var a = r(), o = []; t.length;) {
                                                var i = r(),
                                                    u = "number" == typeof i.length ? i.length : void 0;
                                                o.push([i, u ? n(u) : r()])
                                            }
                                            return [a, o]
                                        }(e)];
                                        return [3, 3];
                                    case 2:
                                        return t.sent(), [3, 3];
                                    case 3:
                                        return [2, void 0]
                                }
                            })
                        })()
                    }
                }
            }
            var cc = window.HeaderScripts,
                cl = /^\/[a-z]{2}(?:-[a-z]{2})\//i,
                cs = /^\/home\/?$/i,
                cf = /^\/users\/[^/]+\/profile/i,
                cd = /^\/users\/[^/]+\/friends/i,
                cp = /^\/communities\/[^/]+\/[^/]+/i,
                cm = /^\/mobile-app-upgrades\/.*/i,
                cy = /^\/upgrades\/.*/i,
                cv = /^\/login-redirect(?:\/[^?]*)?(?:\?.*)?$/i,
                cb = /^\/(?:[^/]+\/)?download$/i,
                ch = /^\/spotlight\/.*/i,
                cg = function(e) {
                    return e < 0 ? 0 : e > 1 ? 1 : e
                },
                cS = [],
                c_ = ["css.rbxcdn.com", "static.rbxcdn.com", "js.rbxcdn.com", "tr.rbxcdn.com", "metrics.roblox.com", "images.rbxcdn.com"],
                cE = [".woff2", ".woff"];

            function cO(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function cw(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }
            var cI = new Set(["resource.link", "resource.script", "resource.css", "resource.img", "resource.iframe"]);

            function cA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function cT(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return cA(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return cA(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function cN(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function ck(e) {
                return null == e || Number.isNaN(e) ? String(Math.trunc(1e6 * performance.timeOrigin + 1e6 * performance.now())) : String(Math.trunc(1e9 * e))
            }

            function cj(e) {
                var t = [],
                    n = !0,
                    r = !1,
                    a = void 0;
                try {
                    for (var o, i = e[Symbol.iterator](); !(n = (o = i.next()).done); n = !0) {
                        var u = o.value,
                            c = !0,
                            l = !1,
                            s = void 0;
                        try {
                            for (var f, d = (null == u || (void 0 === u ? "undefined" : cN(u)) !== "object" ? [] : Object.entries(u))[Symbol.iterator](); !(c = (f = d.next()).done); c = !0) {
                                var p = cT(f.value, 2),
                                    m = p[0],
                                    y = p[1];
                                null != y && t.push({
                                    key: m,
                                    value: function e(t) {
                                        switch (void 0 === t ? "undefined" : cN(t)) {
                                            case "string":
                                                return {
                                                    stringValue: t
                                                };
                                            case "boolean":
                                                return {
                                                    boolValue: t
                                                };
                                            case "number":
                                                return Number.isInteger(t) ? {
                                                    intValue: String(t)
                                                } : {
                                                    doubleValue: t
                                                };
                                            case "object":
                                                if (null === t) return {
                                                    stringValue: "null"
                                                };
                                                if (Array.isArray(t)) return {
                                                    arrayValue: {
                                                        values: t.map(e)
                                                    }
                                                };
                                                return {
                                                    kvlistValue: {
                                                        values: Object.entries(t).map(function(t) {
                                                            var n = cT(t, 2);
                                                            return {
                                                                key: n[0],
                                                                value: e(n[1])
                                                            }
                                                        })
                                                    }
                                                };
                                            case "bigint":
                                                return {
                                                    intValue: String(t)
                                                };
                                            case "symbol":
                                            default:
                                                return {
                                                    stringValue: String(t)
                                                };
                                            case "undefined":
                                                return {
                                                    stringValue: "undefined"
                                                };
                                            case "function":
                                                return {
                                                    stringValue: "[Function]"
                                                }
                                        }
                                    }(y)
                                })
                            }
                        } catch (e) {
                            l = !0, s = e
                        } finally {
                            try {
                                c || null == d.return || d.return()
                            } finally {
                                if (l) throw s
                            }
                        }
                    }
                } catch (e) {
                    r = !0, a = e
                } finally {
                    try {
                        n || null == i.return || i.return()
                    } finally {
                        if (r) throw a
                    }
                }
                return t
            }

            function cx(e) {
                if (!e) return {
                    code: 0
                };
                var t = e.toLowerCase();
                return "ok" === t ? {
                    code: 1
                } : ["cancelled", "unknown_error", "invalid_argument", "deadline_exceeded", "not_found", "already_exists", "permission_denied", "resource_exhausted", "failed_precondition", "aborted", "out_of_range", "unimplemented", "internal_error", "unavailable", "data_loss", "unauthenticated"].includes(t) ? {
                    code: 2,
                    message: e
                } : {
                    code: 0
                }
            }

            function cR(e) {
                if (!e) return 1;
                var t = e.toLowerCase();
                return t.includes("http") || t.includes("fetch") || t.includes("xhr") || t.includes("db") || t.includes("query") || t.includes("sql") ? 3 : t.includes("server") || t.includes("request") ? 2 : t.includes("publish") || t.includes("send") || t.includes("produce") ? 4 : t.includes("consume") || t.includes("receive") || t.includes("process") ? 5 : 1
            }

            function cP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var cV = "sitetest3",
                cZ = "https://otel-collector-otlp-http-sitetest3.simulpong.com/v1/traces",
                cC = window.Roblox["core-scripts"].environmentUrls,
                cD = n.n(cC);

            function cF(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function cL(e, t) {
                for (var n = 0; n < t.length; n++) {
                    var r = t[n];
                    r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                }
            }

            function cX(e, t, n) {
                return t && cL(e.prototype, t), n && cL(e, n), e
            }

            function cY(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function cW(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        cY(e, t, n[t])
                    })
                }
                return e
            }
            var cB = -1,
                cG = function() {
                    return cB
                },
                cU = function(e) {
                    addEventListener("pageshow", function(t) {
                        t.persisted && (cB = t.timeStamp, e(t))
                    }, !0)
                },
                cM = function(e, t, n, r) {
                    var a, o;
                    return function(i) {
                        var u;
                        t.value >= 0 && (i || r) && ((o = t.value - (null != a ? a : 0)) || void 0 === a) && (a = t.value, t.delta = o, u = t.value, t.rating = u > n[1] ? "poor" : u > n[0] ? "needs-improvement" : "good", e(t))
                    }
                },
                cJ = function(e) {
                    requestAnimationFrame(function() {
                        return requestAnimationFrame(e)
                    })
                },
                cK = function() {
                    var e = performance.getEntriesByType("navigation")[0];
                    if (e && e.responseStart > 0 && e.responseStart < performance.now()) return e
                },
                cz = function() {
                    var e, t;
                    return null != (t = null == (e = cK()) ? void 0 : e.activationStart) ? t : 0
                },
                cH = -1,
                cQ = new Set,
                cq = function() {
                    return "hidden" !== document.visibilityState || document.prerendering ? 1 / 0 : 0
                },
                c$ = function(e) {
                    if ("hidden" === document.visibilityState) {
                        var t = !0,
                            n = !1,
                            r = void 0;
                        if ("visibilitychange" === e.type) try {
                            for (var a, o = cQ[Symbol.iterator](); !(t = (a = o.next()).done); t = !0)(0, a.value)()
                        } catch (e) {
                            n = !0, r = e
                        } finally {
                            try {
                                t || null == o.return || o.return()
                            } finally {
                                if (n) throw r
                            }
                        }
                        isFinite(cH) || (cH = "visibilitychange" === e.type ? e.timeStamp : 0, removeEventListener("prerenderingchange", c$, !0))
                    }
                },
                c0 = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                    if (e && (cH = 1 / 0), cH < 0) {
                        var t, n = cz(),
                            r = document.prerendering || null == (t = globalThis.performance.getEntriesByType("visibility-state").find(function(e) {
                                return "hidden" === e.name && e.startTime >= n
                            })) ? void 0 : t.startTime;
                        cH = null != r ? r : cq(), addEventListener("visibilitychange", c$, !0), addEventListener("prerenderingchange", c$, !0), cU(function() {
                            setTimeout(function() {
                                cH = cq()
                            })
                        })
                    }
                    return {
                        get firstHiddenTime() {
                            return cH
                        },
                        onHidden: function(e) {
                            cQ.add(e)
                        }
                    }
                },
                c1 = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : -1,
                        n = arguments.length > 2 ? arguments[2] : void 0,
                        r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : 0,
                        a = arguments.length > 4 ? arguments[4] : void 0,
                        o = arguments.length > 5 ? arguments[5] : void 0,
                        i = arguments.length > 6 ? arguments[6] : void 0,
                        u = cK(),
                        c = (null == u ? void 0 : u.navigationId) || 0,
                        l = "navigate";
                    return n ? l = n : cG() >= 0 ? l = "back-forward-cache" : u && (document.prerendering || cz() > 0 ? l = "prerender" : document.wasDiscarded ? l = "restore" : u.type && (l = u.type.replace(/_/g, "-"))), {
                        name: e,
                        value: t,
                        rating: "good",
                        delta: 0,
                        entries: [],
                        id: "v6-".concat(Date.now(), "-").concat(Math.floor(0x82f79cd8fff * Math.random()) + 1e12),
                        navigationType: l,
                        navigationId: r || c,
                        navigationInteractionId: a,
                        navigationURL: o || (null == u ? void 0 : u.name),
                        navigationStartTime: i || 0
                    }
                },
                c2 = new WeakMap;

            function c3(e, t) {
                var n = c2.get(t);
                return n || (n = new WeakMap, c2.set(t, n)), n.get(e) || n.set(e, new t), n.get(e)
            }
            var c5 = function() {
                    function e() {
                        cF(this, e), cY(this, "t", void 0), cY(this, "i", 0), cY(this, "o", [])
                    }
                    return cX(e, [{
                        key: "h",
                        value: function(e) {
                            if (!e.hadRecentInput) {
                                var t, n = this.o[0],
                                    r = this.o.at(-1);
                                this.i && n && r && e.startTime - r.startTime < 1e3 && e.startTime - n.startTime < 5e3 ? (this.i += e.value, this.o.push(e)) : (this.i = e.value, this.o = [e]), null == (t = this.t) || t.call(this, e)
                            }
                        }
                    }]), e
                }(),
                c9 = function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
                    try {
                        var r = e.filter(function(e) {
                            return PerformanceObserver.supportedEntryTypes.includes(e)
                        });
                        if (r.length > 0) {
                            var a = new PerformanceObserver(function(e) {
                                    queueMicrotask(function() {
                                        var n = e.getEntries();
                                        r.length > 1 && n.sort(function(e, t) {
                                            return e.startTime + e.duration - (t.startTime + t.duration)
                                        }), t(n)
                                    })
                                }),
                                o = !0,
                                i = !1,
                                u = void 0;
                            try {
                                for (var c, l = r[Symbol.iterator](); !(o = (c = l.next()).done); o = !0) {
                                    var s = c.value;
                                    a.observe(cW({
                                        type: s,
                                        buffered: !0
                                    }, n))
                                }
                            } catch (e) {
                                i = !0, u = e
                            } finally {
                                try {
                                    o || null == l.return || l.return()
                                } finally {
                                    if (i) throw u
                                }
                            }
                            return a
                        }
                    } catch (e) {}
                },
                c4 = function(e) {
                    var t, n, r;
                    return (null == (t = globalThis.PerformanceObserver) ? void 0 : t.supportedEntryTypes.includes("soft-navigation")) && "function" == typeof(null == (r = globalThis.PerformanceSoftNavigation) || null == (n = r.prototype) ? void 0 : n.getLargestInteractionContentfulPaint) && e && e.reportSoftNavs
                },
                c8 = function(e, t) {
                    if (e.set(t.navigationId, t), e.size > 2) {
                        var n = e.keys().next().value;
                        void 0 !== n && e.delete(n)
                    }
                },
                c6 = function(e) {
                    var t = !1;
                    return function() {
                        t || (e(), t = !0)
                    }
                },
                c7 = function e() {
                    cF(this, e), cY(this, "l", void 0)
                },
                le = function(e) {
                    document.prerendering ? addEventListener("prerenderingchange", e, !0) : e()
                },
                lt = [1800, 3e3],
                ln = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        n = c4(t);
                    le(function() {
                        var r, a = c3(t, c7),
                            o = c0(),
                            i = c1("FCP"),
                            u = c9(["paint"], function(e) {
                                var t = !0,
                                    n = !1,
                                    a = void 0;
                                try {
                                    for (var c, l = e[Symbol.iterator](); !(t = (c = l.next()).done); t = !0) {
                                        var s = c.value;
                                        "first-contentful-paint" === s.name && (u.disconnect(), s.startTime < o.firstHiddenTime && (i.value = Math.max(s.startTime - cz(), 0), i.entries.push(s), i.navigationId = s.navigationId || i.navigationId, r(!0)))
                                    }
                                } catch (e) {
                                    n = !0, a = e
                                } finally {
                                    try {
                                        t || null == l.return || l.return()
                                    } finally {
                                        if (n) throw a
                                    }
                                }
                            });
                        u && (r = cM(e, i, lt, t.reportAllChanges), cU(function(n) {
                            r = cM(e, i = c1("FCP", -1, "back-forward-cache", i.navigationId, i.navigationInteractionId, i.navigationURL, cG()), lt, t.reportAllChanges), cJ(function() {
                                i.value = performance.now() - n.timeStamp, r(!0)
                            })
                        })), n && c9(["soft-navigation"], function(n) {
                            n.forEach(function(n) {
                                a.l && n.navigationId && c8(a.l, n), (r = cM(e, i = c1("FCP", Math.max((n.presentationTime || n.paintTime || 0) - n.startTime, 0), "soft-navigation", n.navigationId, n.interactionId, n.name, n.startTime), lt, t.reportAllChanges))(!0)
                            })
                        }, t)
                    })
                },
                lr = [.1, .25],
                la = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        n = c0();
                    ln(c6(function() {
                        var r, a = c1("CLS", 0),
                            o = c3(t, c5),
                            i = function(n, i, u, c, l) {
                                a = c1("CLS", 0, n, i, u, c, l), o.i = 0, r = cM(e, a, lr, t.reportAllChanges)
                            },
                            u = function() {
                                var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                                o.i > a.value && (a.value = o.i, a.entries = o.o), r(e)
                            },
                            c = function(e) {
                                u(!0), i("soft-navigation", e.navigationId, e.interactionId, e.name, e.startTime)
                            },
                            l = function(e) {
                                var t = !0,
                                    n = !1,
                                    r = void 0;
                                try {
                                    for (var a, i = e[Symbol.iterator](); !(t = (a = i.next()).done); t = !0) {
                                        var l = a.value;
                                        "soft-navigation" !== l.entryType ? o.h(l) : c(l)
                                    }
                                } catch (e) {
                                    n = !0, r = e
                                } finally {
                                    try {
                                        t || null == i.return || i.return()
                                    } finally {
                                        if (n) throw r
                                    }
                                }
                                u()
                            },
                            s = ["layout-shift"];
                        c4(t) && s.push("soft-navigation");
                        var f = c9(s, l);
                        f && (r = cM(e, a, lr, t.reportAllChanges), n.onHidden(function() {
                            l(f.takeRecords()), r(!0)
                        }), cU(function() {
                            i("back-forward-cache", a.navigationId, a.navigationInteractionId, a.navigationURL, cG()), cJ(r)
                        }), setTimeout(r))
                    }))
                },
                lo = 0,
                li = 1 / 0,
                lu = 0,
                lc = function(e) {
                    var t = !0,
                        n = !1,
                        r = void 0;
                    try {
                        for (var a, o = e[Symbol.iterator](); !(t = (a = o.next()).done); t = !0) {
                            var i = a.value;
                            i.interactionId && (li = Math.min(li, i.interactionId), lo = (lu = Math.max(lu, i.interactionId)) ? (lu - li) / 7 + 1 : 0)
                        }
                    } catch (e) {
                        n = !0, r = e
                    } finally {
                        try {
                            t || null == o.return || o.return()
                        } finally {
                            if (n) throw r
                        }
                    }
                },
                ll = function() {
                    var e;
                    return ee ? lo : null != (e = performance.interactionCount) ? e : 0
                },
                ls = function() {
                    "interactionCount" in performance || ee || (ee = c9(["event"], lc, {
                        durationThreshold: 0
                    }))
                },
                lf = 0,
                ld = function() {
                    function e() {
                        cF(this, e), cY(this, "u", []), cY(this, "v", new Map), cY(this, "m", void 0), cY(this, "p", void 0)
                    }
                    return cX(e, [{
                        key: "T",
                        value: function() {
                            lf = ll(), this.u.length = 0, this.v.clear()
                        }
                    }, {
                        key: "M",
                        value: function(e) {
                            var t = ll() - lf,
                                n = Math.min(this.u.length - 1, Math.floor(t / 50));
                            return t && -1 === n && ("soft-navigation" === e || "back-forward-cache" === e) ? {
                                _: 8,
                                id: -1,
                                entries: []
                            } : this.u[n]
                        }
                    }, {
                        key: "h",
                        value: function(e) {
                            if (null == (u = this.m) || u.call(this, e), e.interactionId || "first-input" === e.entryType) {
                                var t = this.u.at(-1),
                                    n = this.v.get(e.interactionId);
                                if (n || this.u.length < 10 || e.duration > t._) {
                                    if (n ? e.duration > n._ ? (n.entries = [e], n._ = e.duration) : e.duration === n._ && e.startTime === n.entries[0].startTime && n.entries.push(e) : (n = {
                                            id: e.interactionId,
                                            entries: [e],
                                            _: e.duration
                                        }, this.v.set(n.id, n), this.u.push(n)), this.u.sort(function(e, t) {
                                            return t._ - e._
                                        }), this.u.length > 10) {
                                        var r = this.u.splice(10),
                                            a = !0,
                                            o = !1,
                                            i = void 0;
                                        try {
                                            for (var u, c, l, s = r[Symbol.iterator](); !(a = (l = s.next()).done); a = !0) {
                                                var f = l.value;
                                                this.v.delete(f.id)
                                            }
                                        } catch (e) {
                                            o = !0, i = e
                                        } finally {
                                            try {
                                                a || null == s.return || s.return()
                                            } finally {
                                                if (o) throw i
                                            }
                                        }
                                    }
                                    null == (c = this.p) || c.call(this, n)
                                }
                            }
                        }
                    }]), e
                }(),
                lp = function(e) {
                    var t = 1e3 * ("requestIdleCallback" in globalThis),
                        n = globalThis.requestIdleCallback || setTimeout,
                        r = globalThis.cancelIdleCallback || clearTimeout;
                    if ("hidden" === document.visibilityState) e();
                    else {
                        var a = c6(e),
                            o = -1,
                            i = function() {
                                r(o), a()
                            };
                        addEventListener("visibilitychange", i, {
                            once: !0,
                            capture: !0
                        }), o = n(function() {
                            removeEventListener("visibilitychange", i, {
                                capture: !0
                            }), a()
                        }, {
                            timeout: t
                        })
                    }
                },
                lm = [200, 500],
                ly = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    if (globalThis.PerformanceEventTiming && "interactionId" in PerformanceEventTiming.prototype) {
                        var n = c0();
                        le(function() {
                            ls();
                            var r, a, o, i, u = c1("INP"),
                                c = c3(t, ld),
                                l = function(n, r, a, o, l) {
                                    c.T(), i = cM(e, u = c1("INP", -1, n, r, a, o, l), lm, t.reportAllChanges)
                                },
                                s = function() {
                                    var e = c.M(u.navigationType);
                                    e && e._ !== u.value && (u.value = e._, u.entries = e.entries, i())
                                },
                                f = function(e) {
                                    s(), i(!0), l("soft-navigation", e.navigationId, e.interactionId, e.name, e.startTime)
                                },
                                d = function(e) {
                                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                                    lp(function() {
                                        var n = !0,
                                            r = !1,
                                            a = void 0;
                                        try {
                                            for (var o, u = e[Symbol.iterator](); !(n = (o = u.next()).done); n = !0) {
                                                var l = o.value;
                                                "soft-navigation" !== l.entryType ? c.h(l) : f(l)
                                            }
                                        } catch (e) {
                                            r = !0, a = e
                                        } finally {
                                            try {
                                                n || null == u.return || u.return()
                                            } finally {
                                                if (r) throw a
                                            }
                                        }
                                        s(), t && i(!0)
                                    })
                                },
                                p = ["event", "first-input"];
                            c4(t) && p.push("soft-navigation");
                            var m = c9(p, d, (r = cW({}, t), a = a = {
                                durationThreshold: null != (o = t.durationThreshold) ? o : 40
                            }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(a)) : (function(e, t) {
                                var n = Object.keys(e);
                                if (Object.getOwnPropertySymbols) {
                                    var r = Object.getOwnPropertySymbols(e);
                                    n.push.apply(n, r)
                                }
                                return n
                            })(Object(a)).forEach(function(e) {
                                Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(a, e))
                            }), r));
                            i = cM(e, u, lm, t.reportAllChanges), m && (n.onHidden(function() {
                                d(m.takeRecords(), !0)
                            }), cU(function() {
                                l("back-forward-cache", u.navigationId, u.navigationInteractionId, u.navigationURL, cG())
                            }))
                        })
                    }
                },
                lv = function() {
                    function e() {
                        cF(this, e), cY(this, "m", void 0), cY(this, "l", void 0)
                    }
                    return cX(e, [{
                        key: "h",
                        value: function(e) {
                            var t;
                            null == (t = this.m) || t.call(this, e)
                        }
                    }]), e
                }(),
                lb = [2500, 4e3],
                lh = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        n = !1,
                        r = c4(t);
                    le(function() {
                        var a, o = c0(),
                            i = c1("LCP"),
                            u = c3(t, lv),
                            c = function(r, u, c, l, s) {
                                a = cM(e, i = c1("LCP", -1, r, u, c, l, s), lb, t.reportAllChanges), n = !1, "soft-navigation" === r && (o = c0(!0))
                            },
                            l = function(e) {
                                u.l && e.navigationId && c8(u.l, e), n || a(!0), c("soft-navigation", e.navigationId, e.interactionId, e.name, e.startTime);
                                var t, r = null == (t = e.getLargestInteractionContentfulPaint) ? void 0 : t.call(e);
                                r && s([r])
                            },
                            s = function(e) {
                                t.reportAllChanges || r || (e = e.slice(-1));
                                var n = !0,
                                    c = !1,
                                    s = void 0;
                                try {
                                    for (var f, d = e[Symbol.iterator](); !(n = (f = d.next()).done); n = !0) {
                                        var p = f.value;
                                        if (p) {
                                            if ("soft-navigation" === p.entryType) {
                                                l(p);
                                                continue
                                            }
                                            var m, y = 0,
                                                v = [],
                                                b = p.startTime;
                                            if ("largest-contentful-paint" === p.entryType) y = Math.max(p.startTime - cz(), 0), u.h(p), v = [p];
                                            else if ("interaction-contentful-paint" === p.entryType) {
                                                if (!i.navigationId || "interactionId" in p && p.interactionId != i.navigationInteractionId) continue;
                                                b = (null == (m = p.largestContentfulPaint) ? void 0 : m.renderTime) || 0, y = Math.max(b - p.startTime, 0), p.largestContentfulPaint && (u.h(p.largestContentfulPaint), v = [p.largestContentfulPaint])
                                            }
                                            b < o.firstHiddenTime && (i.value = y, i.entries = v, a())
                                        }
                                    }
                                } catch (e) {
                                    c = !0, s = e
                                } finally {
                                    try {
                                        n || null == d.return || d.return()
                                    } finally {
                                        if (c) throw s
                                    }
                                }
                            },
                            f = ["largest-contentful-paint"];
                        r && f.push("interaction-contentful-paint", "soft-navigation");
                        var d = c9(f, s);
                        if (d) {
                            a = cM(e, i, lb, t.reportAllChanges);
                            var p = ["keydown", "click", "visibilitychange"],
                                m = function(e) {
                                    if (e.isTrusted && !n) {
                                        var t = i.id;
                                        lp(function() {
                                            if (!n) {
                                                if (!r) {
                                                    d.disconnect();
                                                    var e = !0,
                                                        o = !1,
                                                        u = void 0;
                                                    try {
                                                        for (var c, l = p[Symbol.iterator](); !(e = (c = l.next()).done); e = !0) {
                                                            var s = c.value;
                                                            removeEventListener(s, m, {
                                                                capture: !0
                                                            })
                                                        }
                                                    } catch (e) {
                                                        o = !0, u = e
                                                    } finally {
                                                        try {
                                                            e || null == l.return || l.return()
                                                        } finally {
                                                            if (o) throw u
                                                        }
                                                    }
                                                }
                                                t === i.id && (n = !0, a(!0))
                                            }
                                        })
                                    }
                                },
                                y = !0,
                                v = !1,
                                b = void 0;
                            try {
                                for (var h, g = p[Symbol.iterator](); !(y = (h = g.next()).done); y = !0) {
                                    var S = h.value;
                                    addEventListener(S, m, {
                                        capture: !0
                                    })
                                }
                            } catch (e) {
                                v = !0, b = e
                            } finally {
                                try {
                                    y || null == g.return || g.return()
                                } finally {
                                    if (v) throw b
                                }
                            }
                            cU(function(r) {
                                c("back-forward-cache", i.navigationId, i.navigationInteractionId, i.navigationURL, cG()), a = cM(e, i, lb, t.reportAllChanges), cJ(function() {
                                    i.value = performance.now() - r.timeStamp, n = !0, a(!0)
                                })
                            })
                        }
                    })
                },
                lg = [800, 1800],
                lS = function(e) {
                    document.prerendering ? le(function() {
                        return lS(e)
                    }) : "complete" !== document.readyState ? addEventListener("load", function() {
                        return lS(e)
                    }, !0) : setTimeout(e)
                },
                l_ = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        n = c4(t),
                        r = c1("TTFB"),
                        a = cM(e, r, lg, t.reportAllChanges);
                    lS(function() {
                        var o = cK();
                        if (o) {
                            var i = o.responseStart;
                            r.value = Math.max(i - cz(), 0), r.entries = [o], a(!0), cU(function() {
                                (a = cM(e, r = c1("TTFB", 0, "back-forward-cache", r.navigationId, r.navigationInteractionId, r.navigationURL, cG()), lg, t.reportAllChanges))(!0)
                            }), n && c9(["soft-navigation"], function(n) {
                                n.forEach(function(n) {
                                    n.navigationId && ((r = c1("TTFB", 0, "soft-navigation", n.navigationId, n.interactionId, n.name, n.startTime)).entries = [n], (a = cM(e, r, lg, t.reportAllChanges))(!0))
                                })
                            }, t)
                        }
                    })
                },
                lE = function(e) {
                    try {
                        return BigInt(e)
                    } catch (e) {
                        return null
                    }
                },
                lO = function(e) {
                    if (!e.trim()) return null;
                    try {
                        return BigInt(e)
                    } catch (e) {
                        return null
                    }
                };

            function lw(e) {
                for (var t = !1, n = [], r = 0; r < e.length; r++) {
                    var a = e.charAt(r);
                    switch (a) {
                        case "_":
                            t = !0;
                            break;
                        case "0":
                        case "1":
                        case "2":
                        case "3":
                        case "4":
                        case "5":
                        case "6":
                        case "7":
                        case "8":
                        case "9":
                            n.push(a), t = !1;
                            break;
                        default:
                            t && (t = !1, a = a.toUpperCase()), n.push(a)
                    }
                }
                return n.join("")
            }
            var lI = new Set(["constructor", "toString", "toJSON", "valueOf"]);

            function lA(e) {
                return lI.has(e) ? e + "$" : e
            }

            function lT() {
                for (var e = 0, t = 0, n = 0; n < 28; n += 7) {
                    var r = this.buf[this.pos++];
                    if (e |= (127 & r) << n, (128 & r) == 0) return this.assertBounds(), [e, t]
                }
                var a = this.buf[this.pos++];
                if (e |= (15 & a) << 28, t = (112 & a) >> 4, (128 & a) == 0) return this.assertBounds(), [e, t];
                for (var o = 3; o <= 31; o += 7) {
                    var i = this.buf[this.pos++];
                    if (t |= (127 & i) << o, (128 & i) == 0) return this.assertBounds(), [e, t]
                }
                throw Error("invalid varint")
            }

            function lN(e, t, n) {
                for (var r = 0; r < 28; r += 7) {
                    var a = e >>> r,
                        o = a >>> 7 != 0 || 0 != t,
                        i = (o ? 128 | a : a) & 255;
                    if (n.push(i), !o) return
                }
                var u = e >>> 28 & 15 | (7 & t) << 4,
                    c = t >> 3 != 0;
                if (n.push((c ? 128 | u : u) & 255), c) {
                    for (var l = 3; l < 31; l += 7) {
                        var s = t >>> l,
                            f = s >>> 7 != 0,
                            d = (f ? 128 | s : s) & 255;
                        if (n.push(d), !f) return
                    }
                    n.push(t >>> 31 & 1)
                }
            }

            function lk(e) {
                var t = "-" === e[0];
                t && (e = e.slice(1));
                var n = 0,
                    r = 0;

                function a(t, a) {
                    var o = Number(e.slice(t, a));
                    r *= 1e6, (n = 1e6 * n + o) >= 0x100000000 && (r += n / 0x100000000 | 0, n %= 0x100000000)
                }
                return a(-24, -18), a(-18, -12), a(-12, -6), a(-6), t ? lR(n, r) : lx(n, r)
            }

            function lj(e, t) {
                if (e = (n = {
                        lo: e >>> 0,
                        hi: t >>> 0
                    }).lo, (t = n.hi) <= 2097151) return String(0x100000000 * t + e);
                var n, r = 0xffffff & e,
                    a = (e >>> 24 | t << 8) & 0xffffff,
                    o = t >> 16 & 65535,
                    i = r + 6777216 * a + 6710656 * o,
                    u = a + 8147497 * o,
                    c = 2 * o;
                return i >= 1e7 && (u += Math.floor(i / 1e7), i %= 1e7), u >= 1e7 && (c += Math.floor(u / 1e7), u %= 1e7), c.toString() + lP(u) + lP(i)
            }

            function lx(e, t) {
                return {
                    lo: 0 | e,
                    hi: 0 | t
                }
            }

            function lR(e, t) {
                return t = ~t, e ? e = ~e + 1 : t += 1, lx(e, t)
            }
            var lP = function(e) {
                var t = String(e);
                return "0000000".slice(t.length) + t
            };

            function lV(e, t) {
                if (e >= 0) {
                    for (; e > 127;) t.push(127 & e | 128), e >>>= 7;
                    t.push(e)
                } else {
                    for (var n = 0; n < 9; n++) t.push(127 & e | 128), e >>= 7;
                    t.push(1)
                }
            }

            function lZ() {
                var e = this.buf[this.pos++],
                    t = 127 & e;
                if ((128 & e) == 0 || (t |= (127 & (e = this.buf[this.pos++])) << 7, (128 & e) == 0) || (t |= (127 & (e = this.buf[this.pos++])) << 14, (128 & e) == 0) || (t |= (127 & (e = this.buf[this.pos++])) << 21, (128 & e) == 0)) return this.assertBounds(), t;
                t |= (15 & (e = this.buf[this.pos++])) << 28;
                for (var n = 5;
                    (128 & e) != 0 && n < 10; n++) e = this.buf[this.pos++];
                if ((128 & e) != 0) throw Error("invalid varint");
                return this.assertBounds(), t >>> 0
            }
            var lC = n(964);

            function lD(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var lF = function() {
                var e = new DataView(new ArrayBuffer(8));
                if ("function" == typeof BigInt && "function" == typeof e.getBigInt64 && "function" == typeof e.getBigUint64 && "function" == typeof e.setBigInt64 && "function" == typeof e.setBigUint64 && (globalThis.Deno || globalThis.Bun || (void 0 === lC ? "undefined" : lD(lC)) != "object" || "object" != lD(lC.env) || "1" !== lC.env.BUF_BIGINT_DISABLE)) {
                    var t = BigInt("-9223372036854775808"),
                        n = BigInt("9223372036854775807"),
                        r = BigInt("0"),
                        a = BigInt("18446744073709551615");
                    return {
                        zero: BigInt(0),
                        supported: !0,
                        parse: function(e) {
                            var r = (void 0 === e ? "undefined" : lD(e)) == "bigint" ? e : BigInt(e);
                            if (r > n || r < t) throw Error("invalid int64: ".concat(e));
                            return r
                        },
                        uParse: function(e) {
                            var t = (void 0 === e ? "undefined" : lD(e)) == "bigint" ? e : BigInt(e);
                            if (t > a || t < r) throw Error("invalid uint64: ".concat(e));
                            return t
                        },
                        enc: function(t) {
                            return e.setBigInt64(0, this.parse(t), !0), {
                                lo: e.getInt32(0, !0),
                                hi: e.getInt32(4, !0)
                            }
                        },
                        uEnc: function(t) {
                            return e.setBigInt64(0, this.uParse(t), !0), {
                                lo: e.getInt32(0, !0),
                                hi: e.getInt32(4, !0)
                            }
                        },
                        dec: function(t, n) {
                            return e.setInt32(0, t, !0), e.setInt32(4, n, !0), e.getBigInt64(0, !0)
                        },
                        uDec: function(t, n) {
                            return e.setInt32(0, t, !0), e.setInt32(4, n, !0), e.getBigUint64(0, !0)
                        }
                    }
                }
                return {
                    zero: "0",
                    supported: !1,
                    parse: function(e) {
                        return "string" != typeof e && (e = e.toString()), lL(e), e
                    },
                    uParse: function(e) {
                        return "string" != typeof e && (e = e.toString()), lX(e), e
                    },
                    enc: function(e) {
                        return "string" != typeof e && (e = e.toString()), lL(e), lk(e)
                    },
                    uEnc: function(e) {
                        return "string" != typeof e && (e = e.toString()), lX(e), lk(e)
                    },
                    dec: function(e, t) {
                        var n, r, a;
                        return (r = 0x80000000 & (n = lx(e, t)).hi) && (n = lR(n.lo, n.hi)), a = lj(n.lo, n.hi), r ? "-" + a : a
                    },
                    uDec: function(e, t) {
                        return lj(e, t)
                    }
                }
            }();

            function lL(e) {
                if (!/^-?[0-9]+$/.test(e)) throw Error("invalid int64: " + e)
            }

            function lX(e) {
                if (!/^[0-9]+$/.test(e)) throw Error("invalid uint64: " + e)
            }

            function lY(e, t) {
                switch (e) {
                    case er.STRING:
                        return "";
                    case er.BOOL:
                        return !1;
                    case er.DOUBLE:
                    case er.FLOAT:
                        return 0;
                    case er.INT64:
                    case er.UINT64:
                    case er.SFIXED64:
                    case er.FIXED64:
                    case er.SINT64:
                        return t ? "0" : lF.zero;
                    case er.BYTES:
                        return new Uint8Array(0);
                    default:
                        return 0
                }
            }(r = er || (er = {}))[r.DOUBLE = 1] = "DOUBLE", r[r.FLOAT = 2] = "FLOAT", r[r.INT64 = 3] = "INT64", r[r.UINT64 = 4] = "UINT64", r[r.INT32 = 5] = "INT32", r[r.FIXED64 = 6] = "FIXED64", r[r.FIXED32 = 7] = "FIXED32", r[r.BOOL = 8] = "BOOL", r[r.STRING = 9] = "STRING", r[r.BYTES = 12] = "BYTES", r[r.UINT32 = 13] = "UINT32", r[r.SFIXED32 = 15] = "SFIXED32", r[r.SFIXED64 = 16] = "SFIXED64", r[r.SINT32 = 17] = "SINT32", r[r.SINT64 = 18] = "SINT64";
            var lW = Symbol.for("reflect unsafe local");

            function lB(e, t) {
                var n = e[t.localName].case;
                return void 0 === n ? n : t.fields.find(function(e) {
                    return e.localName === n
                })
            }

            function lG(e, t) {
                return Object.prototype.hasOwnProperty.call(e, t) && void 0 !== e[t]
            }

            function lU(e, t) {
                if (t.oneof) {
                    var n = e[t.oneof.localName];
                    return n.case === t.localName ? n.value : void 0
                }
                return e[t.localName]
            }

            function lM(e, t, n) {
                t.oneof ? e[t.oneof.localName] = {
                    case: t.localName,
                    value: n
                } : e[t.localName] = n
            }

            function lJ(e) {
                var t = !0,
                    n = !1,
                    r = void 0;
                try {
                    for (var a, o = e.field[Symbol.iterator](); !(t = (a = o.next()).done); t = !0) {
                        var i = a.value;
                        lG(i, "jsonName") || (i.jsonName = lw(i.name))
                    }
                } catch (e) {
                    n = !0, r = e
                } finally {
                    try {
                        t || null == o.return || o.return()
                    } finally {
                        if (n) throw r
                    }
                }
                e.nestedType.forEach(lJ)
            }

            function lK(e) {
                var t = "function" == typeof Symbol && Symbol.iterator,
                    n = t && e[t],
                    r = 0;
                if (n) return n.call(e);
                if (e && "number" == typeof e.length) return {
                    next: function() {
                        return e && r >= e.length && (e = void 0), {
                            value: e && e[r++],
                            done: !e
                        }
                    }
                };
                throw TypeError(t ? "Object is not iterable." : "Symbol.iterator is not defined.")
            }

            function lz(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function lH(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function lQ(e) {
                return function(e) {
                    if (Array.isArray(e)) return lz(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return lz(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return lz(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lq() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                var r = (u = new Map, c = new Map, l = new Map, f = {}, lH(s = {
                    kind: "registry",
                    types: u,
                    extendees: c
                }, Symbol.iterator, function() {
                    return u.values()
                }), f.files = f.files || {}, f.files.get = function() {
                    return l.values()
                }, lH(s, "addFile", function(e, t, n) {
                    if (l.set(e.proto.name, e), !t) {
                        var r = !0,
                            a = !1,
                            o = void 0;
                        try {
                            for (var i, u = (function e(t) {
                                    var n, r, a, o, i, u, c, l, s, f, d, p, m;
                                    return function(e, t) {
                                        var n, r, a, o = {
                                                label: 0,
                                                sent: function() {
                                                    if (1 & a[0]) throw a[1];
                                                    return a[1]
                                                },
                                                trys: [],
                                                ops: []
                                            },
                                            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                        return i.next = u(0), i.throw = u(1), i.return = u(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                                            return this
                                        }), i;

                                        function u(u) {
                                            return function(c) {
                                                var l = [u, c];
                                                if (n) throw TypeError("Generator is already executing.");
                                                for (; i && (i = 0, l[0] && (o = 0)), o;) try {
                                                    if (n = 1, r && (a = 2 & l[0] ? r.return : l[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, l[1])).done) return a;
                                                    switch (r = 0, a && (l = [2 & l[0], a.value]), l[0]) {
                                                        case 0:
                                                        case 1:
                                                            a = l;
                                                            break;
                                                        case 4:
                                                            return o.label++, {
                                                                value: l[1],
                                                                done: !1
                                                            };
                                                        case 5:
                                                            o.label++, r = l[1], l = [0];
                                                            continue;
                                                        case 7:
                                                            l = o.ops.pop(), o.trys.pop();
                                                            continue;
                                                        default:
                                                            if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                                                o = 0;
                                                                continue
                                                            }
                                                            if (3 === l[0] && (!a || l[1] > a[0] && l[1] < a[3])) {
                                                                o.label = l[1];
                                                                break
                                                            }
                                                            if (6 === l[0] && o.label < a[1]) {
                                                                o.label = a[1], a = l;
                                                                break
                                                            }
                                                            if (a && o.label < a[2]) {
                                                                o.label = a[2], o.ops.push(l);
                                                                break
                                                            }
                                                            a[2] && o.ops.pop(), o.trys.pop();
                                                            continue
                                                    }
                                                    l = t.call(e, o)
                                                } catch (e) {
                                                    l = [6, e], r = 0
                                                } finally {
                                                    n = a = 0
                                                }
                                                if (5 & l[0]) throw l[1];
                                                return {
                                                    value: l[0] ? l[1] : void 0,
                                                    done: !0
                                                }
                                            }
                                        }
                                    }(this, function(y) {
                                        switch (y.label) {
                                            case 0:
                                                switch (t.kind) {
                                                    case "file":
                                                        return [3, 1];
                                                    case "message":
                                                        return [3, 14]
                                                }
                                                return [3, 26];
                                            case 1:
                                                n = !0, r = !1, a = void 0, y.label = 2;
                                            case 2:
                                                y.trys.push([2, 8, 9, 10]), o = t.messages[Symbol.iterator](), y.label = 3;
                                            case 3:
                                                if (n = (i = o.next()).done) return [3, 7];
                                                return [4, u = i.value];
                                            case 4:
                                                return y.sent(), [5, lK(e(u))];
                                            case 5:
                                                y.sent(), y.label = 6;
                                            case 6:
                                                return n = !0, [3, 3];
                                            case 7:
                                                return [3, 10];
                                            case 8:
                                                return c = y.sent(), r = !0, a = c, [3, 10];
                                            case 9:
                                                try {
                                                    n || null == o.return || o.return()
                                                } finally {
                                                    if (r) throw a
                                                }
                                                return [7];
                                            case 10:
                                                return [5, lK(t.enums)];
                                            case 11:
                                                return y.sent(), [5, lK(t.services)];
                                            case 12:
                                                return y.sent(), [5, lK(t.extensions)];
                                            case 13:
                                                return y.sent(), [3, 26];
                                            case 14:
                                                l = !0, s = !1, f = void 0, y.label = 15;
                                            case 15:
                                                y.trys.push([15, 21, 22, 23]), d = t.nestedMessages[Symbol.iterator](), y.label = 16;
                                            case 16:
                                                if (l = (p = d.next()).done) return [3, 20];
                                                return [4, m = p.value];
                                            case 17:
                                                return y.sent(), [5, lK(e(m))];
                                            case 18:
                                                y.sent(), y.label = 19;
                                            case 19:
                                                return l = !0, [3, 16];
                                            case 20:
                                                return [3, 23];
                                            case 21:
                                                return c = y.sent(), s = !0, f = c, [3, 23];
                                            case 22:
                                                try {
                                                    l || null == d.return || d.return()
                                                } finally {
                                                    if (s) throw f
                                                }
                                                return [7];
                                            case 23:
                                                return [5, lK(t.nestedEnums)];
                                            case 24:
                                                return y.sent(), [5, lK(t.nestedExtensions)];
                                            case 25:
                                                return y.sent(), [3, 26];
                                            case 26:
                                                return [2]
                                        }
                                    })
                                })(e)[Symbol.iterator](); !(r = (i = u.next()).done); r = !0) {
                                var c = i.value;
                                this.add(c)
                            }
                        } catch (e) {
                            a = !0, o = e
                        } finally {
                            try {
                                r || null == u.return || u.return()
                            } finally {
                                if (a) throw o
                            }
                        }
                    }
                    if (n) {
                        var s = !0,
                            f = !1,
                            d = void 0;
                        try {
                            for (var p, m = e.dependencies[Symbol.iterator](); !(s = (p = m.next()).done); s = !0) {
                                var y = p.value;
                                this.addFile(y, t, n)
                            }
                        } catch (e) {
                            f = !0, d = e
                        } finally {
                            try {
                                s || null == m.return || m.return()
                            } finally {
                                if (f) throw d
                            }
                        }
                    }
                }), lH(s, "add", function(e) {
                    if ("extension" == e.kind) {
                        var t = c.get(e.extendee.typeName);
                        t || c.set(e.extendee.typeName, t = new Map), t.set(e.number, e)
                    }
                    u.set(e.typeName, e)
                }), lH(s, "get", function(e) {
                    return u.get(e)
                }), lH(s, "getFile", function(e) {
                    return l.get(e)
                }), lH(s, "getMessage", function(e) {
                    var t = u.get(e);
                    return (null == t ? void 0 : t.kind) == "message" ? t : void 0
                }), lH(s, "getEnum", function(e) {
                    var t = u.get(e);
                    return (null == t ? void 0 : t.kind) == "enum" ? t : void 0
                }), lH(s, "getExtension", function(e) {
                    var t = u.get(e);
                    return (null == t ? void 0 : t.kind) == "extension" ? t : void 0
                }), lH(s, "getExtensionFor", function(e, t) {
                    var n;
                    return null == (n = c.get(e.typeName)) ? void 0 : n.get(t)
                }), lH(s, "getService", function(e) {
                    var t = u.get(e);
                    return (null == t ? void 0 : t.kind) == "service" ? t : void 0
                }), function(e, t) {
                    for (var n in t) {
                        var r = t[n];
                        r.configurable = r.enumerable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, n, r)
                    }
                    if (Object.getOwnPropertySymbols)
                        for (var a = Object.getOwnPropertySymbols(t), o = 0; o < a.length; o++) {
                            var i = a[o],
                                r = t[i];
                            r.configurable = r.enumerable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, i, r)
                        }
                }(s, f), s);
                if (!t.length) return r;
                if ("$typeName" in t[0] && "google.protobuf.FileDescriptorSet" == t[0].$typeName) {
                    var a = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var u, c, l, s, f, d, p = t[0].file[Symbol.iterator](); !(a = (d = p.next()).done); a = !0) {
                            var m = d.value;
                            l0(m, r)
                        }
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            a || null == p.return || p.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return r
                }
                if ("$typeName" in t[0]) {
                    var y = t[0],
                        v = t[1],
                        b = new Set,
                        h = !0,
                        g = !1,
                        S = void 0;
                    try {
                        for (var _, E = [y].concat(lQ(function e(t) {
                                var n = [],
                                    a = !0,
                                    o = !1,
                                    i = void 0;
                                try {
                                    for (var u, c = t.dependency[Symbol.iterator](); !(a = (u = c.next()).done); a = !0) {
                                        var l = u.value;
                                        if (void 0 == r.getFile(l) && !b.has(l)) {
                                            var s = v(l);
                                            if (!s) throw Error("Unable to resolve ".concat(l, ", imported by ").concat(t.name));
                                            "kind" in s ? r.addFile(s, !1, !0) : (b.add(s.name), n.push(s))
                                        }
                                    }
                                } catch (e) {
                                    o = !0, i = e
                                } finally {
                                    try {
                                        a || null == c.return || c.return()
                                    } finally {
                                        if (o) throw i
                                    }
                                }
                                return n.concat.apply(n, lQ(n.map(e)))
                            }(y))).reverse()[Symbol.iterator](); !(h = (_ = E.next()).done); h = !0) {
                            var O = _.value;
                            l0(O, r)
                        }
                    } catch (e) {
                        g = !0, S = e
                    } finally {
                        try {
                            h || null == E.return || E.return()
                        } finally {
                            if (g) throw S
                        }
                    }
                } else {
                    var w = !0,
                        I = !1,
                        A = void 0;
                    try {
                        for (var T, N = t[Symbol.iterator](); !(w = (T = N.next()).done); w = !0) {
                            var k = T.value,
                                j = !0,
                                x = !1,
                                R = void 0;
                            try {
                                for (var P, V = k.files[Symbol.iterator](); !(j = (P = V.next()).done); j = !0) {
                                    var Z = P.value;
                                    r.addFile(Z)
                                }
                            } catch (e) {
                                x = !0, R = e
                            } finally {
                                try {
                                    j || null == V.return || V.return()
                                } finally {
                                    if (x) throw R
                                }
                            }
                        }
                    } catch (e) {
                        I = !0, A = e
                    } finally {
                        try {
                            w || null == N.return || N.return()
                        } finally {
                            if (I) throw A
                        }
                    }
                }
                return r
            }
            var l$ = {
                998: {
                    fieldPresence: 1,
                    enumType: 2,
                    repeatedFieldEncoding: 2,
                    utf8Validation: 3,
                    messageEncoding: 1,
                    jsonFormat: 2,
                    enforceNamingStyle: 2,
                    defaultSymbolVisibility: 1
                },
                999: {
                    fieldPresence: 2,
                    enumType: 1,
                    repeatedFieldEncoding: 1,
                    utf8Validation: 2,
                    messageEncoding: 1,
                    jsonFormat: 1,
                    enforceNamingStyle: 2,
                    defaultSymbolVisibility: 1
                },
                1e3: {
                    fieldPresence: 1,
                    enumType: 1,
                    repeatedFieldEncoding: 1,
                    utf8Validation: 2,
                    messageEncoding: 1,
                    jsonFormat: 1,
                    enforceNamingStyle: 2,
                    defaultSymbolVisibility: 1
                },
                1001: {
                    fieldPresence: 1,
                    enumType: 1,
                    repeatedFieldEncoding: 1,
                    utf8Validation: 2,
                    messageEncoding: 1,
                    jsonFormat: 1,
                    enforceNamingStyle: 1,
                    defaultSymbolVisibility: 2
                }
            };

            function l0(e, t) {
                var n = {
                        kind: "file",
                        proto: e,
                        deprecated: null != (f = null == (s = e.options) ? void 0 : s.deprecated) && f,
                        edition: function(e) {
                            switch (e.syntax) {
                                case "":
                                case "proto2":
                                    return 998;
                                case "proto3":
                                    return 999;
                                case "editions":
                                    if (9999 === e.edition) return 1001;
                                    if (e.edition in l$) return e.edition;
                                    throw Error("".concat(e.name, ": unsupported edition"));
                                default:
                                    throw Error("".concat(e.name, ': unsupported syntax "').concat(e.syntax, '"'))
                            }
                        }(e),
                        name: e.name.replace(/\.proto$/, ""),
                        dependencies: (c = e, l = t, c.dependency.map(function(e) {
                            var t = l.getFile(e);
                            if (!t) throw Error("Cannot find ".concat(e, ", imported by ").concat(c.name));
                            return t
                        })),
                        enums: [],
                        messages: [],
                        extensions: [],
                        services: [],
                        toString: function() {
                            return "file ".concat(e.name)
                        }
                    },
                    r = new Map,
                    a = {
                        get: function(e) {
                            return r.get(e)
                        },
                        add: function(e) {
                            var t;
                            l7((null == (t = e.proto.options) ? void 0 : t.mapEntry) === !0), r.set(e.typeName, e)
                        }
                    },
                    o = !0,
                    i = !1,
                    u = void 0;
                try {
                    for (var c, l, s, f, d, p = e.enumType[Symbol.iterator](); !(o = (d = p.next()).done); o = !0) {
                        var m = d.value;
                        l3(m, n, void 0, t)
                    }
                } catch (e) {
                    i = !0, u = e
                } finally {
                    try {
                        o || null == p.return || p.return()
                    } finally {
                        if (i) throw u
                    }
                }
                var y = !0,
                    v = !1,
                    b = void 0;
                try {
                    for (var h, g = e.messageType[Symbol.iterator](); !(y = (h = g.next()).done); y = !0) {
                        var S = h.value;
                        ! function e(t, n, r, a, o) {
                            var i = {
                                kind: "message",
                                proto: t,
                                deprecated: null != (f = null == (s = t.options) ? void 0 : s.deprecated) && f,
                                file: n,
                                parent: r,
                                name: t.name,
                                typeName: l9(t, r, n),
                                fields: [],
                                field: {},
                                oneofs: [],
                                members: [],
                                nestedEnums: [],
                                nestedMessages: [],
                                nestedExtensions: [],
                                toString: function() {
                                    return "message ".concat(this.typeName)
                                }
                            };
                            (null == (d = t.options) ? void 0 : d.mapEntry) === !0 ? o.add(i) : ((null != (p = null == r ? void 0 : r.nestedMessages) ? p : n.messages).push(i), a.add(i));
                            var u = !0,
                                c = !1,
                                l = void 0;
                            try {
                                for (var s, f, d, p, m, y = t.enumType[Symbol.iterator](); !(u = (m = y.next()).done); u = !0) {
                                    var v = m.value;
                                    l3(v, n, i, a)
                                }
                            } catch (e) {
                                c = !0, l = e
                            } finally {
                                try {
                                    u || null == y.return || y.return()
                                } finally {
                                    if (c) throw l
                                }
                            }
                            var b = !0,
                                h = !1,
                                g = void 0;
                            try {
                                for (var S, _ = t.nestedType[Symbol.iterator](); !(b = (S = _.next()).done); b = !0) {
                                    var E = S.value;
                                    e(E, n, i, a, o)
                                }
                            } catch (e) {
                                h = !0, g = e
                            } finally {
                                try {
                                    b || null == _.return || _.return()
                                } finally {
                                    if (h) throw g
                                }
                            }
                        }(S, n, void 0, t, a)
                    }
                } catch (e) {
                    v = !0, b = e
                } finally {
                    try {
                        y || null == g.return || g.return()
                    } finally {
                        if (v) throw b
                    }
                }
                var _ = !0,
                    E = !1,
                    O = void 0;
                try {
                    for (var w, I = e.service[Symbol.iterator](); !(_ = (w = I.next()).done); _ = !0) {
                        var A = w.value;
                        ! function(e, t, n) {
                            var r = {
                                kind: "service",
                                proto: e,
                                deprecated: null != (c = null == (u = e.options) ? void 0 : u.deprecated) && c,
                                file: t,
                                name: e.name,
                                typeName: l9(e, void 0, t),
                                methods: [],
                                method: {},
                                toString: function() {
                                    return "service ".concat(this.typeName)
                                }
                            };
                            t.services.push(r), n.add(r);
                            var a = !0,
                                o = !1,
                                i = void 0;
                            try {
                                for (var u, c, l, s = e.method[Symbol.iterator](); !(a = (l = s.next()).done); a = !0) {
                                    var f = l.value,
                                        d = function(e, t, n) {
                                            var r, a, o, i, u = e.clientStreaming && e.serverStreaming ? "bidi_streaming" : e.clientStreaming ? "client_streaming" : e.serverStreaming ? "server_streaming" : "unary",
                                                c = n.getMessage(l4(e.inputType)),
                                                l = n.getMessage(l4(e.outputType));
                                            l7(c, "invalid MethodDescriptorProto: input_type ".concat(e.inputType, " not found")), l7(l, "invalid MethodDescriptorProto: output_type ".concat(e.inputType, " not found"));
                                            var s = e.name;
                                            return {
                                                kind: "rpc",
                                                proto: e,
                                                deprecated: null != (a = null == (r = e.options) ? void 0 : r.deprecated) && a,
                                                parent: t,
                                                name: s,
                                                localName: lA(s.length ? lA(s[0].toLowerCase() + s.substring(1)) : s),
                                                methodKind: u,
                                                input: c,
                                                output: l,
                                                idempotency: null != (i = null == (o = e.options) ? void 0 : o.idempotencyLevel) ? i : 0,
                                                toString: function() {
                                                    return "rpc ".concat(t.typeName, ".").concat(s)
                                                }
                                            }
                                        }(f, r, n);
                                    r.methods.push(d), r.method[d.localName] = d
                                }
                            } catch (e) {
                                o = !0, i = e
                            } finally {
                                try {
                                    a || null == s.return || s.return()
                                } finally {
                                    if (o) throw i
                                }
                            }
                        }(A, n, t)
                    }
                } catch (e) {
                    E = !0, O = e
                } finally {
                    try {
                        _ || null == I.return || I.return()
                    } finally {
                        if (E) throw O
                    }
                }
                l1(n, t);
                var T = !0,
                    N = !1,
                    k = void 0;
                try {
                    for (var j, x = r.values()[Symbol.iterator](); !(T = (j = x.next()).done); T = !0) {
                        var R = j.value;
                        l2(R, t, a)
                    }
                } catch (e) {
                    N = !0, k = e
                } finally {
                    try {
                        T || null == x.return || x.return()
                    } finally {
                        if (N) throw k
                    }
                }
                var P = !0,
                    V = !1,
                    Z = void 0;
                try {
                    for (var C, D = n.messages[Symbol.iterator](); !(P = (C = D.next()).done); P = !0) {
                        var F = C.value;
                        l2(F, t, a), l1(F, t)
                    }
                } catch (e) {
                    V = !0, Z = e
                } finally {
                    try {
                        P || null == D.return || D.return()
                    } finally {
                        if (V) throw Z
                    }
                }
                t.addFile(n, !0)
            }

            function l1(e, t) {
                switch (e.kind) {
                    case "file":
                        var n = !0,
                            r = !1,
                            a = void 0;
                        try {
                            for (var o, i = e.proto.extension[Symbol.iterator](); !(n = (o = i.next()).done); n = !0) {
                                var u = o.value,
                                    c = l5(u, e, t);
                                e.extensions.push(c), t.add(c)
                            }
                        } catch (e) {
                            r = !0, a = e
                        } finally {
                            try {
                                n || null == i.return || i.return()
                            } finally {
                                if (r) throw a
                            }
                        }
                        break;
                    case "message":
                        var l = !0,
                            s = !1,
                            f = void 0;
                        try {
                            for (var d, p = e.proto.extension[Symbol.iterator](); !(l = (d = p.next()).done); l = !0) {
                                var m = d.value,
                                    y = l5(m, e, t);
                                e.nestedExtensions.push(y), t.add(y)
                            }
                        } catch (e) {
                            s = !0, f = e
                        } finally {
                            try {
                                l || null == p.return || p.return()
                            } finally {
                                if (s) throw f
                            }
                        }
                        var v = !0,
                            b = !1,
                            h = void 0;
                        try {
                            for (var g, S = e.nestedMessages[Symbol.iterator](); !(v = (g = S.next()).done); v = !0) {
                                var _ = g.value;
                                l1(_, t)
                            }
                        } catch (e) {
                            b = !0, h = e
                        } finally {
                            try {
                                v || null == S.return || S.return()
                            } finally {
                                if (b) throw h
                            }
                        }
                }
            }

            function l2(e, t, n) {
                var r = e.proto.oneofDecl.map(function(t) {
                        var n, r;
                        return {
                            kind: "oneof",
                            proto: n = t,
                            deprecated: !1,
                            parent: r = e,
                            fields: [],
                            name: n.name,
                            localName: lA(lw(n.name)),
                            toString: function() {
                                return "oneof ".concat(r.typeName, ".").concat(this.name)
                            }
                        }
                    }),
                    a = new Set,
                    o = !0,
                    i = !1,
                    u = void 0;
                try {
                    for (var c, l = e.proto.field[Symbol.iterator](); !(o = (c = l.next()).done); o = !0) {
                        var s = c.value,
                            f = function(e, t) {
                                if (lG(e, "oneofIndex") && !e.proto3Optional) {
                                    var n = t[e.oneofIndex];
                                    return l7(n, "invalid FieldDescriptorProto: oneof #".concat(e.oneofIndex, " for field #").concat(e.number, " not found")), n
                                }
                            }(s, r),
                            d = l5(s, e, t, f, n);
                        e.fields.push(d), e.field[d.localName] = d, void 0 === f ? e.members.push(d) : (f.fields.push(d), a.has(f) || (a.add(f), e.members.push(f)))
                    }
                } catch (e) {
                    i = !0, u = e
                } finally {
                    try {
                        o || null == l.return || l.return()
                    } finally {
                        if (i) throw u
                    }
                }
                var p = !0,
                    m = !1,
                    y = void 0;
                try {
                    for (var v, b = r.filter(function(e) {
                            return a.has(e)
                        })[Symbol.iterator](); !(p = (v = b.next()).done); p = !0) {
                        var h = v.value;
                        e.oneofs.push(h)
                    }
                } catch (e) {
                    m = !0, y = e
                } finally {
                    try {
                        p || null == b.return || b.return()
                    } finally {
                        if (m) throw y
                    }
                }
                var g = !0,
                    S = !1,
                    _ = void 0;
                try {
                    for (var E, O = e.nestedMessages[Symbol.iterator](); !(g = (E = O.next()).done); g = !0) {
                        var w = E.value;
                        l2(w, t, n)
                    }
                } catch (e) {
                    S = !0, _ = e
                } finally {
                    try {
                        g || null == O.return || O.return()
                    } finally {
                        if (S) throw _
                    }
                }
            }

            function l3(e, t, n, r) {
                var a = function(e, t) {
                        var n = ((i = e).substring(0, 1) + i.substring(1).replace(/[A-Z]/g, function(e) {
                                return "_" + e
                            })).toLowerCase() + "_",
                            r = !0,
                            a = !1,
                            o = void 0;
                        try {
                            for (var i, u, c = t[Symbol.iterator](); !(r = (u = c.next()).done); r = !0) {
                                var l = u.value;
                                if (!l.name.toLowerCase().startsWith(n)) return;
                                var s = l.name.substring(n.length);
                                if (0 == s.length || /^\d/.test(s)) return
                            }
                        } catch (e) {
                            a = !0, o = e
                        } finally {
                            try {
                                r || null == c.return || c.return()
                            } finally {
                                if (a) throw o
                            }
                        }
                        return n
                    }(e.name, e.value),
                    o = {
                        kind: "enum",
                        proto: e,
                        deprecated: null != (d = null == (f = e.options) ? void 0 : f.deprecated) && d,
                        file: t,
                        parent: n,
                        open: !0,
                        name: e.name,
                        typeName: l9(e, n, t),
                        value: {},
                        values: [],
                        sharedPrefix: a,
                        toString: function() {
                            return "enum ".concat(this.typeName)
                        }
                    };
                o.open = 1 == l6("enumType", {
                    proto: (l = o).proto,
                    parent: null != (s = l.parent) ? s : l.file
                }), r.add(o);
                var i = !0,
                    u = !1,
                    c = void 0;
                try {
                    for (var l, s, f, d, p, m, y, v, b = e.value[Symbol.iterator](); !(i = (v = b.next()).done); i = !0) ! function() {
                        var e = v.value,
                            t = e.name;
                        o.values.push(o.value[e.number] = {
                            kind: "enum_value",
                            proto: e,
                            deprecated: null != (m = null == (p = e.options) ? void 0 : p.deprecated) && m,
                            parent: o,
                            name: t,
                            localName: lA(void 0 == a ? t : t.substring(a.length)),
                            number: e.number,
                            toString: function() {
                                return "enum value ".concat(o.typeName, ".").concat(t)
                            }
                        })
                    }()
                } catch (e) {
                    u = !0, c = e
                } finally {
                    try {
                        i || null == b.return || b.return()
                    } finally {
                        if (u) throw c
                    }
                }(null != (y = null == n ? void 0 : n.nestedEnums) ? y : t.enums).push(o)
            }

            function l5(e, t, n, r, a) {
                var o, i, u, c = void 0 === a,
                    l = {
                        kind: "field",
                        proto: e,
                        deprecated: null != (i = null == (o = e.options) ? void 0 : o.deprecated) && i,
                        name: e.name,
                        number: e.number,
                        scalar: void 0,
                        message: void 0,
                        enum: void 0,
                        presence: function(e, t, n, r) {
                            if (2 == e.label) return 3;
                            if (3 == e.label) return 2;
                            if (t || e.proto3Optional || n) return 1;
                            var a = l6("fieldPresence", {
                                proto: e,
                                parent: r
                            });
                            return 2 == a && (11 == e.type || 10 == e.type) ? 1 : a
                        }(e, r, c, t),
                        utf8Validation: 2 == l6("utf8Validation", {
                            proto: e,
                            parent: t
                        }),
                        listKind: void 0,
                        mapKind: void 0,
                        mapKey: void 0,
                        delimitedEncoding: void 0,
                        packed: void 0,
                        longAsString: !1,
                        getDefaultValue: void 0
                    };
                if (c) {
                    var s = "file" == t.kind ? t : t.file,
                        f = "file" == t.kind ? void 0 : t,
                        d = l9(e, f, s);
                    l.kind = "extension", l.file = s, l.parent = f, l.oneof = void 0, l.typeName = d, l.jsonName = "[".concat(d, "]"), l.toString = function() {
                        return "extension ".concat(d)
                    };
                    var p = n.getMessage(l4(e.extendee));
                    l7(p, "invalid FieldDescriptorProto: extendee ".concat(e.extendee, " not found")), l.extendee = p
                } else l7("message" == t.kind), l.parent = t, l.oneof = r, l.localName = r ? lw(e.name) : lA(lw(e.name)), l.jsonName = e.jsonName, l.toString = function() {
                    return "field ".concat(t.typeName, ".").concat(e.name)
                };
                var m = e.label,
                    y = e.type,
                    v = null == (u = e.options) ? void 0 : u.jstype;
                if (3 === m) {
                    var b = 11 == y ? null == a ? void 0 : a.get(l4(e.typeName)) : void 0;
                    if (b) {
                        l.fieldKind = "map";
                        var h, g, S, _ = (g = (h = b).fields.find(function(e) {
                                return 1 === e.number
                            }), S = h.fields.find(function(e) {
                                return 2 === e.number
                            }), l7(g && "scalar" == g.fieldKind && g.scalar != er.BYTES && g.scalar != er.FLOAT && g.scalar != er.DOUBLE && S && "list" != S.fieldKind && "map" != S.fieldKind), {
                                key: g,
                                value: S
                            }),
                            E = _.key,
                            O = _.value;
                        return l.mapKey = E.scalar, l.mapKind = O.fieldKind, l.message = O.message, l.delimitedEncoding = !1, l.enum = O.enum, l.scalar = O.scalar, l
                    }
                    switch (l.fieldKind = "list", y) {
                        case 11:
                        case 10:
                            l.listKind = "message", l.message = n.getMessage(l4(e.typeName)), l7(l.message), l.delimitedEncoding = l8(e, t);
                            break;
                        case 14:
                            l.listKind = "enum", l.enum = n.getEnum(l4(e.typeName)), l7(l.enum);
                            break;
                        default:
                            l.listKind = "scalar", l.scalar = y, l.longAsString = 1 == v
                    }
                    return l.packed = function(e, t) {
                        if (3 != e.label) return !1;
                        switch (e.type) {
                            case 9:
                            case 12:
                            case 10:
                            case 11:
                                return !1
                        }
                        var n = e.options;
                        return n && lG(n, "packed") ? n.packed : 1 == l6("repeatedFieldEncoding", {
                            proto: e,
                            parent: t
                        })
                    }(e, t), l
                }
                switch (y) {
                    case 11:
                    case 10:
                        l.fieldKind = "message", l.message = n.getMessage(l4(e.typeName)), l7(l.message, "invalid FieldDescriptorProto: type_name ".concat(e.typeName, " not found")), l.delimitedEncoding = l8(e, t), l.getDefaultValue = function() {};
                        break;
                    case 14:
                        var w = n.getEnum(l4(e.typeName));
                        l7(void 0 !== w, "invalid FieldDescriptorProto: type_name ".concat(e.typeName, " not found")), l.fieldKind = "enum", l.enum = n.getEnum(l4(e.typeName)), l.getDefaultValue = function() {
                            return lG(e, "defaultValue") ? function(e, t) {
                                var n = e.values.find(function(e) {
                                    return e.name === t
                                });
                                if (!n) throw Error("cannot parse ".concat(e, " default value: ").concat(t));
                                return n.number
                            }(w, e.defaultValue) : void 0
                        };
                        break;
                    default:
                        l.fieldKind = "scalar", l.scalar = y, l.longAsString = 1 == v, l.getDefaultValue = function() {
                            return lG(e, "defaultValue") ? function(e, t) {
                                switch (e) {
                                    case er.STRING:
                                        return t;
                                    case er.BYTES:
                                        var n = function(e) {
                                            for (var t = [], n = {
                                                    tail: e,
                                                    c: "",
                                                    next: function() {
                                                        return 0 != this.tail.length && (this.c = this.tail[0], this.tail = this.tail.substring(1), !0)
                                                    },
                                                    take: function(e) {
                                                        if (this.tail.length >= e) {
                                                            var t = this.tail.substring(0, e);
                                                            return this.tail = this.tail.substring(e), t
                                                        }
                                                        return !1
                                                    }
                                                }; n.next();)
                                                if ("\\" === n.c) {
                                                    if (n.next()) switch (n.c) {
                                                        case "\\":
                                                            t.push(n.c.charCodeAt(0));
                                                            break;
                                                        case "b":
                                                            t.push(8);
                                                            break;
                                                        case "f":
                                                            t.push(12);
                                                            break;
                                                        case "n":
                                                            t.push(10);
                                                            break;
                                                        case "r":
                                                            t.push(13);
                                                            break;
                                                        case "t":
                                                            t.push(9);
                                                            break;
                                                        case "v":
                                                            t.push(11);
                                                            break;
                                                        case "0":
                                                        case "1":
                                                        case "2":
                                                        case "3":
                                                        case "4":
                                                        case "5":
                                                        case "6":
                                                        case "7":
                                                            var r = n.c,
                                                                a = n.take(2);
                                                            if (!1 === a) return !1;
                                                            var o = parseInt(r + a, 8);
                                                            if (Number.isNaN(o)) return !1;
                                                            t.push(o);
                                                            break;
                                                        case "x":
                                                            var i = n.c,
                                                                u = n.take(2);
                                                            if (!1 === u) return !1;
                                                            var c = parseInt(i + u, 16);
                                                            if (Number.isNaN(c)) return !1;
                                                            t.push(c);
                                                            break;
                                                        case "u":
                                                            var l = n.c,
                                                                s = n.take(4);
                                                            if (!1 === s) return !1;
                                                            var f = parseInt(l + s, 16);
                                                            if (Number.isNaN(f)) return !1;
                                                            var d = new Uint8Array(4);
                                                            new DataView(d.buffer).setInt32(0, f, !0), t.push(d[0], d[1], d[2], d[3]);
                                                            break;
                                                        case "U":
                                                            var p = n.c,
                                                                m = n.take(8);
                                                            if (!1 === m) return !1;
                                                            var y = lF.uEnc(p + m),
                                                                v = new Uint8Array(8),
                                                                b = new DataView(v.buffer);
                                                            b.setInt32(0, y.lo, !0), b.setInt32(4, y.hi, !0), t.push(v[0], v[1], v[2], v[3], v[4], v[5], v[6], v[7])
                                                    }
                                                } else t.push(n.c.charCodeAt(0));
                                            return new Uint8Array(t)
                                        }(t);
                                        if (!1 === n) throw Error("cannot parse ".concat(er[e], " default value: ").concat(t));
                                        return n;
                                    case er.INT64:
                                    case er.SFIXED64:
                                    case er.SINT64:
                                        return lF.parse(t);
                                    case er.UINT64:
                                    case er.FIXED64:
                                        return lF.uParse(t);
                                    case er.DOUBLE:
                                    case er.FLOAT:
                                        switch (t) {
                                            case "inf":
                                                return 1 / 0;
                                            case "-inf":
                                                return -1 / 0;
                                            case "nan":
                                                return NaN;
                                            default:
                                                return parseFloat(t)
                                        }
                                    case er.BOOL:
                                        return "true" === t;
                                    case er.INT32:
                                    case er.UINT32:
                                    case er.SINT32:
                                    case er.FIXED32:
                                    case er.SFIXED32:
                                        return parseInt(t, 10)
                                }
                            }(y, e.defaultValue) : void 0
                        }
                }
                return l
            }

            function l9(e, t, n) {
                return t ? "".concat(t.typeName, ".").concat(e.name) : n.proto.package.length > 0 ? "".concat(n.proto.package, ".").concat(e.name) : "".concat(e.name)
            }

            function l4(e) {
                return e.startsWith(".") ? e.substring(1) : e
            }

            function l8(e, t) {
                return 10 == e.type || 2 == l6("messageEncoding", {
                    proto: e,
                    parent: t
                })
            }

            function l6(e, t) {
                var n, r, a = null == (n = t.proto.options) ? void 0 : n.features;
                if (a) {
                    var o = a[e];
                    if (0 != o) return o
                }
                if ("kind" in t) {
                    if ("message" == t.kind) return l6(e, null != (r = t.parent) ? r : t.file);
                    var i = l$[t.edition];
                    if (!i) throw Error("feature default for edition ".concat(t.edition, " not found"));
                    return i[e]
                }
                return l6(e, t.parent)
            }

            function l7(e, t) {
                if (!e) throw Error(t)
            }

            function se(e) {
                var t, n, r, a, o, i, u, c;
                return Object.assign(Object.create({
                    visibility: 0
                }), {
                    $typeName: "google.protobuf.DescriptorProto",
                    name: e.name,
                    field: null != (n = null == (t = e.field) ? void 0 : t.map(st)) ? n : [],
                    extension: [],
                    nestedType: null != (a = null == (r = e.nestedType) ? void 0 : r.map(se)) ? a : [],
                    enumType: null != (i = null == (o = e.enumType) ? void 0 : o.map(sn)) ? i : [],
                    extensionRange: null != (c = null == (u = e.extensionRange) ? void 0 : u.map(function(e) {
                        return Object.assign({
                            $typeName: "google.protobuf.DescriptorProto.ExtensionRange"
                        }, e)
                    })) ? c : [],
                    oneofDecl: [],
                    reservedRange: [],
                    reservedName: []
                })
            }

            function st(e) {
                var t, n, r, a;
                return Object.assign(Object.create({
                    label: 1,
                    typeName: "",
                    extendee: "",
                    defaultValue: "",
                    oneofIndex: 0,
                    jsonName: "",
                    proto3Optional: !1
                }), Object.assign(Object.assign({
                    $typeName: "google.protobuf.FieldDescriptorProto"
                }, e), {
                    options: e.options ? (t = e.options, Object.assign(Object.create({
                        ctype: 0,
                        packed: !1,
                        jstype: 0,
                        lazy: !1,
                        unverifiedLazy: !1,
                        deprecated: !1,
                        weak: !1,
                        debugRedact: !1,
                        retention: 0
                    }), Object.assign(Object.assign({
                        $typeName: "google.protobuf.FieldOptions"
                    }, t), {
                        targets: null != (n = t.targets) ? n : [],
                        editionDefaults: null != (a = null == (r = t.editionDefaults) ? void 0 : r.map(function(e) {
                            return Object.assign({
                                $typeName: "google.protobuf.FieldOptions.EditionDefault"
                            }, e)
                        })) ? a : [],
                        uninterpretedOption: []
                    }))) : void 0
                }))
            }

            function sn(e) {
                return Object.assign(Object.create({
                    visibility: 0
                }), {
                    $typeName: "google.protobuf.EnumDescriptorProto",
                    name: e.name,
                    reservedName: [],
                    reservedRange: [],
                    value: e.value.map(function(e) {
                        return Object.assign({
                            $typeName: "google.protobuf.EnumValueDescriptorProto"
                        }, e)
                    })
                })
            }

            function sr(e, t) {
                for (var n = arguments.length, r = Array(n > 2 ? n - 2 : 0), a = 2; a < n; a++) r[a - 2] = arguments[a];
                return r.reduce(function(e, t) {
                    return e.nestedMessages[t]
                }, e.messages[t])
            }
            var sa = ((e = {
                    name: "google/protobuf/descriptor.proto",
                    package: "google.protobuf",
                    messageType: [{
                        name: "FileDescriptorSet",
                        field: [{
                            name: "file",
                            number: 1,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.FileDescriptorProto"
                        }],
                        extensionRange: [{
                            start: 536e6,
                            end: 0x1ff2b601
                        }]
                    }, {
                        name: "FileDescriptorProto",
                        field: [{
                            name: "name",
                            number: 1,
                            type: 9,
                            label: 1
                        }, {
                            name: "package",
                            number: 2,
                            type: 9,
                            label: 1
                        }, {
                            name: "dependency",
                            number: 3,
                            type: 9,
                            label: 3
                        }, {
                            name: "public_dependency",
                            number: 10,
                            type: 5,
                            label: 3
                        }, {
                            name: "weak_dependency",
                            number: 11,
                            type: 5,
                            label: 3
                        }, {
                            name: "option_dependency",
                            number: 15,
                            type: 9,
                            label: 3
                        }, {
                            name: "message_type",
                            number: 4,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.DescriptorProto"
                        }, {
                            name: "enum_type",
                            number: 5,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.EnumDescriptorProto"
                        }, {
                            name: "service",
                            number: 6,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.ServiceDescriptorProto"
                        }, {
                            name: "extension",
                            number: 7,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.FieldDescriptorProto"
                        }, {
                            name: "options",
                            number: 8,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FileOptions"
                        }, {
                            name: "source_code_info",
                            number: 9,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.SourceCodeInfo"
                        }, {
                            name: "syntax",
                            number: 12,
                            type: 9,
                            label: 1
                        }, {
                            name: "edition",
                            number: 14,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.Edition"
                        }]
                    }, {
                        name: "DescriptorProto",
                        field: [{
                            name: "name",
                            number: 1,
                            type: 9,
                            label: 1
                        }, {
                            name: "field",
                            number: 2,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.FieldDescriptorProto"
                        }, {
                            name: "extension",
                            number: 6,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.FieldDescriptorProto"
                        }, {
                            name: "nested_type",
                            number: 3,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.DescriptorProto"
                        }, {
                            name: "enum_type",
                            number: 4,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.EnumDescriptorProto"
                        }, {
                            name: "extension_range",
                            number: 5,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.DescriptorProto.ExtensionRange"
                        }, {
                            name: "oneof_decl",
                            number: 8,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.OneofDescriptorProto"
                        }, {
                            name: "options",
                            number: 7,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.MessageOptions"
                        }, {
                            name: "reserved_range",
                            number: 9,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.DescriptorProto.ReservedRange"
                        }, {
                            name: "reserved_name",
                            number: 10,
                            type: 9,
                            label: 3
                        }, {
                            name: "visibility",
                            number: 11,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.SymbolVisibility"
                        }],
                        nestedType: [{
                            name: "ExtensionRange",
                            field: [{
                                name: "start",
                                number: 1,
                                type: 5,
                                label: 1
                            }, {
                                name: "end",
                                number: 2,
                                type: 5,
                                label: 1
                            }, {
                                name: "options",
                                number: 3,
                                type: 11,
                                label: 1,
                                typeName: ".google.protobuf.ExtensionRangeOptions"
                            }]
                        }, {
                            name: "ReservedRange",
                            field: [{
                                name: "start",
                                number: 1,
                                type: 5,
                                label: 1
                            }, {
                                name: "end",
                                number: 2,
                                type: 5,
                                label: 1
                            }]
                        }]
                    }, {
                        name: "ExtensionRangeOptions",
                        field: [{
                            name: "uninterpreted_option",
                            number: 999,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.UninterpretedOption"
                        }, {
                            name: "declaration",
                            number: 2,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.ExtensionRangeOptions.Declaration",
                            options: {
                                retention: 2
                            }
                        }, {
                            name: "features",
                            number: 50,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet"
                        }, {
                            name: "verification",
                            number: 3,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.ExtensionRangeOptions.VerificationState",
                            defaultValue: "UNVERIFIED",
                            options: {
                                retention: 2
                            }
                        }],
                        nestedType: [{
                            name: "Declaration",
                            field: [{
                                name: "number",
                                number: 1,
                                type: 5,
                                label: 1
                            }, {
                                name: "full_name",
                                number: 2,
                                type: 9,
                                label: 1
                            }, {
                                name: "type",
                                number: 3,
                                type: 9,
                                label: 1
                            }, {
                                name: "reserved",
                                number: 5,
                                type: 8,
                                label: 1
                            }, {
                                name: "repeated",
                                number: 6,
                                type: 8,
                                label: 1
                            }]
                        }],
                        enumType: [{
                            name: "VerificationState",
                            value: [{
                                name: "DECLARATION",
                                number: 0
                            }, {
                                name: "UNVERIFIED",
                                number: 1
                            }]
                        }],
                        extensionRange: [{
                            start: 1e3,
                            end: 0x20000000
                        }]
                    }, {
                        name: "FieldDescriptorProto",
                        field: [{
                            name: "name",
                            number: 1,
                            type: 9,
                            label: 1
                        }, {
                            name: "number",
                            number: 3,
                            type: 5,
                            label: 1
                        }, {
                            name: "label",
                            number: 4,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FieldDescriptorProto.Label"
                        }, {
                            name: "type",
                            number: 5,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FieldDescriptorProto.Type"
                        }, {
                            name: "type_name",
                            number: 6,
                            type: 9,
                            label: 1
                        }, {
                            name: "extendee",
                            number: 2,
                            type: 9,
                            label: 1
                        }, {
                            name: "default_value",
                            number: 7,
                            type: 9,
                            label: 1
                        }, {
                            name: "oneof_index",
                            number: 9,
                            type: 5,
                            label: 1
                        }, {
                            name: "json_name",
                            number: 10,
                            type: 9,
                            label: 1
                        }, {
                            name: "options",
                            number: 8,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FieldOptions"
                        }, {
                            name: "proto3_optional",
                            number: 17,
                            type: 8,
                            label: 1
                        }],
                        enumType: [{
                            name: "Type",
                            value: [{
                                name: "TYPE_DOUBLE",
                                number: 1
                            }, {
                                name: "TYPE_FLOAT",
                                number: 2
                            }, {
                                name: "TYPE_INT64",
                                number: 3
                            }, {
                                name: "TYPE_UINT64",
                                number: 4
                            }, {
                                name: "TYPE_INT32",
                                number: 5
                            }, {
                                name: "TYPE_FIXED64",
                                number: 6
                            }, {
                                name: "TYPE_FIXED32",
                                number: 7
                            }, {
                                name: "TYPE_BOOL",
                                number: 8
                            }, {
                                name: "TYPE_STRING",
                                number: 9
                            }, {
                                name: "TYPE_GROUP",
                                number: 10
                            }, {
                                name: "TYPE_MESSAGE",
                                number: 11
                            }, {
                                name: "TYPE_BYTES",
                                number: 12
                            }, {
                                name: "TYPE_UINT32",
                                number: 13
                            }, {
                                name: "TYPE_ENUM",
                                number: 14
                            }, {
                                name: "TYPE_SFIXED32",
                                number: 15
                            }, {
                                name: "TYPE_SFIXED64",
                                number: 16
                            }, {
                                name: "TYPE_SINT32",
                                number: 17
                            }, {
                                name: "TYPE_SINT64",
                                number: 18
                            }]
                        }, {
                            name: "Label",
                            value: [{
                                name: "LABEL_OPTIONAL",
                                number: 1
                            }, {
                                name: "LABEL_REPEATED",
                                number: 3
                            }, {
                                name: "LABEL_REQUIRED",
                                number: 2
                            }]
                        }]
                    }, {
                        name: "OneofDescriptorProto",
                        field: [{
                            name: "name",
                            number: 1,
                            type: 9,
                            label: 1
                        }, {
                            name: "options",
                            number: 2,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.OneofOptions"
                        }]
                    }, {
                        name: "EnumDescriptorProto",
                        field: [{
                            name: "name",
                            number: 1,
                            type: 9,
                            label: 1
                        }, {
                            name: "value",
                            number: 2,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.EnumValueDescriptorProto"
                        }, {
                            name: "options",
                            number: 3,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.EnumOptions"
                        }, {
                            name: "reserved_range",
                            number: 4,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.EnumDescriptorProto.EnumReservedRange"
                        }, {
                            name: "reserved_name",
                            number: 5,
                            type: 9,
                            label: 3
                        }, {
                            name: "visibility",
                            number: 6,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.SymbolVisibility"
                        }],
                        nestedType: [{
                            name: "EnumReservedRange",
                            field: [{
                                name: "start",
                                number: 1,
                                type: 5,
                                label: 1
                            }, {
                                name: "end",
                                number: 2,
                                type: 5,
                                label: 1
                            }]
                        }]
                    }, {
                        name: "EnumValueDescriptorProto",
                        field: [{
                            name: "name",
                            number: 1,
                            type: 9,
                            label: 1
                        }, {
                            name: "number",
                            number: 2,
                            type: 5,
                            label: 1
                        }, {
                            name: "options",
                            number: 3,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.EnumValueOptions"
                        }]
                    }, {
                        name: "ServiceDescriptorProto",
                        field: [{
                            name: "name",
                            number: 1,
                            type: 9,
                            label: 1
                        }, {
                            name: "method",
                            number: 2,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.MethodDescriptorProto"
                        }, {
                            name: "options",
                            number: 3,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.ServiceOptions"
                        }]
                    }, {
                        name: "MethodDescriptorProto",
                        field: [{
                            name: "name",
                            number: 1,
                            type: 9,
                            label: 1
                        }, {
                            name: "input_type",
                            number: 2,
                            type: 9,
                            label: 1
                        }, {
                            name: "output_type",
                            number: 3,
                            type: 9,
                            label: 1
                        }, {
                            name: "options",
                            number: 4,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.MethodOptions"
                        }, {
                            name: "client_streaming",
                            number: 5,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "server_streaming",
                            number: 6,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }]
                    }, {
                        name: "FileOptions",
                        field: [{
                            name: "java_package",
                            number: 1,
                            type: 9,
                            label: 1
                        }, {
                            name: "java_outer_classname",
                            number: 8,
                            type: 9,
                            label: 1
                        }, {
                            name: "java_multiple_files",
                            number: 10,
                            type: 8,
                            label: 1,
                            defaultValue: "false",
                            options: {}
                        }, {
                            name: "java_generate_equals_and_hash",
                            number: 20,
                            type: 8,
                            label: 1,
                            options: {
                                deprecated: !0
                            }
                        }, {
                            name: "java_string_check_utf8",
                            number: 27,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "optimize_for",
                            number: 9,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FileOptions.OptimizeMode",
                            defaultValue: "SPEED"
                        }, {
                            name: "go_package",
                            number: 11,
                            type: 9,
                            label: 1
                        }, {
                            name: "cc_generic_services",
                            number: 16,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "java_generic_services",
                            number: 17,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "py_generic_services",
                            number: 18,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "deprecated",
                            number: 23,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "cc_enable_arenas",
                            number: 31,
                            type: 8,
                            label: 1,
                            defaultValue: "true"
                        }, {
                            name: "objc_class_prefix",
                            number: 36,
                            type: 9,
                            label: 1
                        }, {
                            name: "csharp_namespace",
                            number: 37,
                            type: 9,
                            label: 1
                        }, {
                            name: "swift_prefix",
                            number: 39,
                            type: 9,
                            label: 1
                        }, {
                            name: "php_class_prefix",
                            number: 40,
                            type: 9,
                            label: 1
                        }, {
                            name: "php_namespace",
                            number: 41,
                            type: 9,
                            label: 1
                        }, {
                            name: "php_metadata_namespace",
                            number: 44,
                            type: 9,
                            label: 1
                        }, {
                            name: "ruby_package",
                            number: 45,
                            type: 9,
                            label: 1
                        }, {
                            name: "features",
                            number: 50,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet"
                        }, {
                            name: "uninterpreted_option",
                            number: 999,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.UninterpretedOption"
                        }],
                        enumType: [{
                            name: "OptimizeMode",
                            value: [{
                                name: "SPEED",
                                number: 1
                            }, {
                                name: "CODE_SIZE",
                                number: 2
                            }, {
                                name: "LITE_RUNTIME",
                                number: 3
                            }]
                        }],
                        extensionRange: [{
                            start: 1e3,
                            end: 0x20000000
                        }]
                    }, {
                        name: "MessageOptions",
                        field: [{
                            name: "message_set_wire_format",
                            number: 1,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "no_standard_descriptor_accessor",
                            number: 2,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "deprecated",
                            number: 3,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "map_entry",
                            number: 7,
                            type: 8,
                            label: 1
                        }, {
                            name: "deprecated_legacy_json_field_conflicts",
                            number: 11,
                            type: 8,
                            label: 1,
                            options: {
                                deprecated: !0
                            }
                        }, {
                            name: "features",
                            number: 12,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet"
                        }, {
                            name: "uninterpreted_option",
                            number: 999,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.UninterpretedOption"
                        }],
                        extensionRange: [{
                            start: 1e3,
                            end: 0x20000000
                        }]
                    }, {
                        name: "FieldOptions",
                        field: [{
                            name: "ctype",
                            number: 1,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FieldOptions.CType",
                            defaultValue: "STRING"
                        }, {
                            name: "packed",
                            number: 2,
                            type: 8,
                            label: 1
                        }, {
                            name: "jstype",
                            number: 6,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FieldOptions.JSType",
                            defaultValue: "JS_NORMAL"
                        }, {
                            name: "lazy",
                            number: 5,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "unverified_lazy",
                            number: 15,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "deprecated",
                            number: 3,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "weak",
                            number: 10,
                            type: 8,
                            label: 1,
                            defaultValue: "false",
                            options: {
                                deprecated: !0
                            }
                        }, {
                            name: "debug_redact",
                            number: 16,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "retention",
                            number: 17,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FieldOptions.OptionRetention"
                        }, {
                            name: "targets",
                            number: 19,
                            type: 14,
                            label: 3,
                            typeName: ".google.protobuf.FieldOptions.OptionTargetType"
                        }, {
                            name: "edition_defaults",
                            number: 20,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.FieldOptions.EditionDefault"
                        }, {
                            name: "features",
                            number: 21,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet"
                        }, {
                            name: "feature_support",
                            number: 22,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FieldOptions.FeatureSupport"
                        }, {
                            name: "uninterpreted_option",
                            number: 999,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.UninterpretedOption"
                        }],
                        nestedType: [{
                            name: "EditionDefault",
                            field: [{
                                name: "edition",
                                number: 3,
                                type: 14,
                                label: 1,
                                typeName: ".google.protobuf.Edition"
                            }, {
                                name: "value",
                                number: 2,
                                type: 9,
                                label: 1
                            }]
                        }, {
                            name: "FeatureSupport",
                            field: [{
                                name: "edition_introduced",
                                number: 1,
                                type: 14,
                                label: 1,
                                typeName: ".google.protobuf.Edition"
                            }, {
                                name: "edition_deprecated",
                                number: 2,
                                type: 14,
                                label: 1,
                                typeName: ".google.protobuf.Edition"
                            }, {
                                name: "deprecation_warning",
                                number: 3,
                                type: 9,
                                label: 1
                            }, {
                                name: "edition_removed",
                                number: 4,
                                type: 14,
                                label: 1,
                                typeName: ".google.protobuf.Edition"
                            }, {
                                name: "removal_error",
                                number: 5,
                                type: 9,
                                label: 1
                            }]
                        }],
                        enumType: [{
                            name: "CType",
                            value: [{
                                name: "STRING",
                                number: 0
                            }, {
                                name: "CORD",
                                number: 1
                            }, {
                                name: "STRING_PIECE",
                                number: 2
                            }]
                        }, {
                            name: "JSType",
                            value: [{
                                name: "JS_NORMAL",
                                number: 0
                            }, {
                                name: "JS_STRING",
                                number: 1
                            }, {
                                name: "JS_NUMBER",
                                number: 2
                            }]
                        }, {
                            name: "OptionRetention",
                            value: [{
                                name: "RETENTION_UNKNOWN",
                                number: 0
                            }, {
                                name: "RETENTION_RUNTIME",
                                number: 1
                            }, {
                                name: "RETENTION_SOURCE",
                                number: 2
                            }]
                        }, {
                            name: "OptionTargetType",
                            value: [{
                                name: "TARGET_TYPE_UNKNOWN",
                                number: 0
                            }, {
                                name: "TARGET_TYPE_FILE",
                                number: 1
                            }, {
                                name: "TARGET_TYPE_EXTENSION_RANGE",
                                number: 2
                            }, {
                                name: "TARGET_TYPE_MESSAGE",
                                number: 3
                            }, {
                                name: "TARGET_TYPE_FIELD",
                                number: 4
                            }, {
                                name: "TARGET_TYPE_ONEOF",
                                number: 5
                            }, {
                                name: "TARGET_TYPE_ENUM",
                                number: 6
                            }, {
                                name: "TARGET_TYPE_ENUM_ENTRY",
                                number: 7
                            }, {
                                name: "TARGET_TYPE_SERVICE",
                                number: 8
                            }, {
                                name: "TARGET_TYPE_METHOD",
                                number: 9
                            }]
                        }],
                        extensionRange: [{
                            start: 1e3,
                            end: 0x20000000
                        }]
                    }, {
                        name: "OneofOptions",
                        field: [{
                            name: "features",
                            number: 1,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet"
                        }, {
                            name: "uninterpreted_option",
                            number: 999,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.UninterpretedOption"
                        }],
                        extensionRange: [{
                            start: 1e3,
                            end: 0x20000000
                        }]
                    }, {
                        name: "EnumOptions",
                        field: [{
                            name: "allow_alias",
                            number: 2,
                            type: 8,
                            label: 1
                        }, {
                            name: "deprecated",
                            number: 3,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "deprecated_legacy_json_field_conflicts",
                            number: 6,
                            type: 8,
                            label: 1,
                            options: {
                                deprecated: !0
                            }
                        }, {
                            name: "features",
                            number: 7,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet"
                        }, {
                            name: "uninterpreted_option",
                            number: 999,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.UninterpretedOption"
                        }],
                        extensionRange: [{
                            start: 1e3,
                            end: 0x20000000
                        }]
                    }, {
                        name: "EnumValueOptions",
                        field: [{
                            name: "deprecated",
                            number: 1,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "features",
                            number: 2,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet"
                        }, {
                            name: "debug_redact",
                            number: 3,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "feature_support",
                            number: 4,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FieldOptions.FeatureSupport"
                        }, {
                            name: "uninterpreted_option",
                            number: 999,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.UninterpretedOption"
                        }],
                        extensionRange: [{
                            start: 1e3,
                            end: 0x20000000
                        }]
                    }, {
                        name: "ServiceOptions",
                        field: [{
                            name: "features",
                            number: 34,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet"
                        }, {
                            name: "deprecated",
                            number: 33,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "uninterpreted_option",
                            number: 999,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.UninterpretedOption"
                        }],
                        extensionRange: [{
                            start: 1e3,
                            end: 0x20000000
                        }]
                    }, {
                        name: "MethodOptions",
                        field: [{
                            name: "deprecated",
                            number: 33,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "idempotency_level",
                            number: 34,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.MethodOptions.IdempotencyLevel",
                            defaultValue: "IDEMPOTENCY_UNKNOWN"
                        }, {
                            name: "features",
                            number: 35,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet"
                        }, {
                            name: "uninterpreted_option",
                            number: 999,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.UninterpretedOption"
                        }],
                        enumType: [{
                            name: "IdempotencyLevel",
                            value: [{
                                name: "IDEMPOTENCY_UNKNOWN",
                                number: 0
                            }, {
                                name: "NO_SIDE_EFFECTS",
                                number: 1
                            }, {
                                name: "IDEMPOTENT",
                                number: 2
                            }]
                        }],
                        extensionRange: [{
                            start: 1e3,
                            end: 0x20000000
                        }]
                    }, {
                        name: "UninterpretedOption",
                        field: [{
                            name: "name",
                            number: 2,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.UninterpretedOption.NamePart"
                        }, {
                            name: "identifier_value",
                            number: 3,
                            type: 9,
                            label: 1
                        }, {
                            name: "positive_int_value",
                            number: 4,
                            type: 4,
                            label: 1
                        }, {
                            name: "negative_int_value",
                            number: 5,
                            type: 3,
                            label: 1
                        }, {
                            name: "double_value",
                            number: 6,
                            type: 1,
                            label: 1
                        }, {
                            name: "string_value",
                            number: 7,
                            type: 12,
                            label: 1
                        }, {
                            name: "aggregate_value",
                            number: 8,
                            type: 9,
                            label: 1
                        }],
                        nestedType: [{
                            name: "NamePart",
                            field: [{
                                name: "name_part",
                                number: 1,
                                type: 9,
                                label: 2
                            }, {
                                name: "is_extension",
                                number: 2,
                                type: 8,
                                label: 2
                            }]
                        }]
                    }, {
                        name: "FeatureSet",
                        field: [{
                            name: "field_presence",
                            number: 1,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet.FieldPresence",
                            options: {
                                retention: 1,
                                targets: [4, 1],
                                editionDefaults: [{
                                    value: "EXPLICIT",
                                    edition: 900
                                }, {
                                    value: "IMPLICIT",
                                    edition: 999
                                }, {
                                    value: "EXPLICIT",
                                    edition: 1e3
                                }]
                            }
                        }, {
                            name: "enum_type",
                            number: 2,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet.EnumType",
                            options: {
                                retention: 1,
                                targets: [6, 1],
                                editionDefaults: [{
                                    value: "CLOSED",
                                    edition: 900
                                }, {
                                    value: "OPEN",
                                    edition: 999
                                }]
                            }
                        }, {
                            name: "repeated_field_encoding",
                            number: 3,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet.RepeatedFieldEncoding",
                            options: {
                                retention: 1,
                                targets: [4, 1],
                                editionDefaults: [{
                                    value: "EXPANDED",
                                    edition: 900
                                }, {
                                    value: "PACKED",
                                    edition: 999
                                }]
                            }
                        }, {
                            name: "utf8_validation",
                            number: 4,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet.Utf8Validation",
                            options: {
                                retention: 1,
                                targets: [4, 1],
                                editionDefaults: [{
                                    value: "NONE",
                                    edition: 900
                                }, {
                                    value: "VERIFY",
                                    edition: 999
                                }]
                            }
                        }, {
                            name: "message_encoding",
                            number: 5,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet.MessageEncoding",
                            options: {
                                retention: 1,
                                targets: [4, 1],
                                editionDefaults: [{
                                    value: "LENGTH_PREFIXED",
                                    edition: 900
                                }]
                            }
                        }, {
                            name: "json_format",
                            number: 6,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet.JsonFormat",
                            options: {
                                retention: 1,
                                targets: [3, 6, 1],
                                editionDefaults: [{
                                    value: "LEGACY_BEST_EFFORT",
                                    edition: 900
                                }, {
                                    value: "ALLOW",
                                    edition: 999
                                }]
                            }
                        }, {
                            name: "enforce_naming_style",
                            number: 7,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet.EnforceNamingStyle",
                            options: {
                                retention: 2,
                                targets: [1, 2, 3, 4, 5, 6, 7, 8, 9],
                                editionDefaults: [{
                                    value: "STYLE_LEGACY",
                                    edition: 900
                                }, {
                                    value: "STYLE2024",
                                    edition: 1001
                                }]
                            }
                        }, {
                            name: "default_symbol_visibility",
                            number: 8,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet.VisibilityFeature.DefaultSymbolVisibility",
                            options: {
                                retention: 2,
                                targets: [1],
                                editionDefaults: [{
                                    value: "EXPORT_ALL",
                                    edition: 900
                                }, {
                                    value: "EXPORT_TOP_LEVEL",
                                    edition: 1001
                                }]
                            }
                        }],
                        nestedType: [{
                            name: "VisibilityFeature",
                            enumType: [{
                                name: "DefaultSymbolVisibility",
                                value: [{
                                    name: "DEFAULT_SYMBOL_VISIBILITY_UNKNOWN",
                                    number: 0
                                }, {
                                    name: "EXPORT_ALL",
                                    number: 1
                                }, {
                                    name: "EXPORT_TOP_LEVEL",
                                    number: 2
                                }, {
                                    name: "LOCAL_ALL",
                                    number: 3
                                }, {
                                    name: "STRICT",
                                    number: 4
                                }]
                            }]
                        }],
                        enumType: [{
                            name: "FieldPresence",
                            value: [{
                                name: "FIELD_PRESENCE_UNKNOWN",
                                number: 0
                            }, {
                                name: "EXPLICIT",
                                number: 1
                            }, {
                                name: "IMPLICIT",
                                number: 2
                            }, {
                                name: "LEGACY_REQUIRED",
                                number: 3
                            }]
                        }, {
                            name: "EnumType",
                            value: [{
                                name: "ENUM_TYPE_UNKNOWN",
                                number: 0
                            }, {
                                name: "OPEN",
                                number: 1
                            }, {
                                name: "CLOSED",
                                number: 2
                            }]
                        }, {
                            name: "RepeatedFieldEncoding",
                            value: [{
                                name: "REPEATED_FIELD_ENCODING_UNKNOWN",
                                number: 0
                            }, {
                                name: "PACKED",
                                number: 1
                            }, {
                                name: "EXPANDED",
                                number: 2
                            }]
                        }, {
                            name: "Utf8Validation",
                            value: [{
                                name: "UTF8_VALIDATION_UNKNOWN",
                                number: 0
                            }, {
                                name: "VERIFY",
                                number: 2
                            }, {
                                name: "NONE",
                                number: 3
                            }]
                        }, {
                            name: "MessageEncoding",
                            value: [{
                                name: "MESSAGE_ENCODING_UNKNOWN",
                                number: 0
                            }, {
                                name: "LENGTH_PREFIXED",
                                number: 1
                            }, {
                                name: "DELIMITED",
                                number: 2
                            }]
                        }, {
                            name: "JsonFormat",
                            value: [{
                                name: "JSON_FORMAT_UNKNOWN",
                                number: 0
                            }, {
                                name: "ALLOW",
                                number: 1
                            }, {
                                name: "LEGACY_BEST_EFFORT",
                                number: 2
                            }]
                        }, {
                            name: "EnforceNamingStyle",
                            value: [{
                                name: "ENFORCE_NAMING_STYLE_UNKNOWN",
                                number: 0
                            }, {
                                name: "STYLE2024",
                                number: 1
                            }, {
                                name: "STYLE_LEGACY",
                                number: 2
                            }]
                        }],
                        extensionRange: [{
                            start: 1e3,
                            end: 9995
                        }, {
                            start: 9995,
                            end: 1e4
                        }, {
                            start: 1e4,
                            end: 10001
                        }]
                    }, {
                        name: "FeatureSetDefaults",
                        field: [{
                            name: "defaults",
                            number: 1,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.FeatureSetDefaults.FeatureSetEditionDefault"
                        }, {
                            name: "minimum_edition",
                            number: 4,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.Edition"
                        }, {
                            name: "maximum_edition",
                            number: 5,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.Edition"
                        }],
                        nestedType: [{
                            name: "FeatureSetEditionDefault",
                            field: [{
                                name: "edition",
                                number: 3,
                                type: 14,
                                label: 1,
                                typeName: ".google.protobuf.Edition"
                            }, {
                                name: "overridable_features",
                                number: 4,
                                type: 11,
                                label: 1,
                                typeName: ".google.protobuf.FeatureSet"
                            }, {
                                name: "fixed_features",
                                number: 5,
                                type: 11,
                                label: 1,
                                typeName: ".google.protobuf.FeatureSet"
                            }]
                        }]
                    }, {
                        name: "SourceCodeInfo",
                        field: [{
                            name: "location",
                            number: 1,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.SourceCodeInfo.Location"
                        }],
                        nestedType: [{
                            name: "Location",
                            field: [{
                                name: "path",
                                number: 1,
                                type: 5,
                                label: 3,
                                options: {
                                    packed: !0
                                }
                            }, {
                                name: "span",
                                number: 2,
                                type: 5,
                                label: 3,
                                options: {
                                    packed: !0
                                }
                            }, {
                                name: "leading_comments",
                                number: 3,
                                type: 9,
                                label: 1
                            }, {
                                name: "trailing_comments",
                                number: 4,
                                type: 9,
                                label: 1
                            }, {
                                name: "leading_detached_comments",
                                number: 6,
                                type: 9,
                                label: 3
                            }]
                        }],
                        extensionRange: [{
                            start: 536e6,
                            end: 0x1ff2b601
                        }]
                    }, {
                        name: "GeneratedCodeInfo",
                        field: [{
                            name: "annotation",
                            number: 1,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.GeneratedCodeInfo.Annotation"
                        }],
                        nestedType: [{
                            name: "Annotation",
                            field: [{
                                name: "path",
                                number: 1,
                                type: 5,
                                label: 3,
                                options: {
                                    packed: !0
                                }
                            }, {
                                name: "source_file",
                                number: 2,
                                type: 9,
                                label: 1
                            }, {
                                name: "begin",
                                number: 3,
                                type: 5,
                                label: 1
                            }, {
                                name: "end",
                                number: 4,
                                type: 5,
                                label: 1
                            }, {
                                name: "semantic",
                                number: 5,
                                type: 14,
                                label: 1,
                                typeName: ".google.protobuf.GeneratedCodeInfo.Annotation.Semantic"
                            }],
                            enumType: [{
                                name: "Semantic",
                                value: [{
                                    name: "NONE",
                                    number: 0
                                }, {
                                    name: "SET",
                                    number: 1
                                }, {
                                    name: "ALIAS",
                                    number: 2
                                }]
                            }]
                        }]
                    }],
                    enumType: [{
                        name: "Edition",
                        value: [{
                            name: "EDITION_UNKNOWN",
                            number: 0
                        }, {
                            name: "EDITION_LEGACY",
                            number: 900
                        }, {
                            name: "EDITION_PROTO2",
                            number: 998
                        }, {
                            name: "EDITION_PROTO3",
                            number: 999
                        }, {
                            name: "EDITION_2023",
                            number: 1e3
                        }, {
                            name: "EDITION_2024",
                            number: 1001
                        }, {
                            name: "EDITION_UNSTABLE",
                            number: 9999
                        }, {
                            name: "EDITION_1_TEST_ONLY",
                            number: 1
                        }, {
                            name: "EDITION_2_TEST_ONLY",
                            number: 2
                        }, {
                            name: "EDITION_99997_TEST_ONLY",
                            number: 99997
                        }, {
                            name: "EDITION_99998_TEST_ONLY",
                            number: 99998
                        }, {
                            name: "EDITION_99999_TEST_ONLY",
                            number: 99999
                        }, {
                            name: "EDITION_MAX",
                            number: 0x7fffffff
                        }]
                    }, {
                        name: "SymbolVisibility",
                        value: [{
                            name: "VISIBILITY_UNSET",
                            number: 0
                        }, {
                            name: "VISIBILITY_LOCAL",
                            number: 1
                        }, {
                            name: "VISIBILITY_EXPORT",
                            number: 2
                        }]
                    }]
                }, a = Object.assign(Object.create({
                    syntax: "",
                    edition: 0
                }), Object.assign(Object.assign({
                    $typeName: "google.protobuf.FileDescriptorProto",
                    dependency: [],
                    publicDependency: [],
                    weakDependency: [],
                    optionDependency: [],
                    service: [],
                    extension: []
                }, e), {
                    messageType: e.messageType.map(se),
                    enumType: e.enumType.map(sn)
                }))).messageType.forEach(lJ), lq(a, function() {}).getFile(a.name)),
                so = sr(sa, 1);

            function si(e, t) {
                return !!(null !== e && (void 0 === e ? "undefined" : e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) == "object" && "$typeName" in e && "string" == typeof e.$typeName) && (void 0 === t || t.typeName === e.$typeName)
            }

            function su(e, t, n) {
                return (su = sf() ? Reflect.construct : function(e, t, n) {
                    var r = [null];
                    r.push.apply(r, t);
                    var a = new(Function.bind.apply(e, r));
                    return n && sl(a, n.prototype), a
                }).apply(null, arguments)
            }

            function sc(e) {
                return (sc = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function sl(e, t) {
                return (sl = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function ss(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (ss = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, n)
                    }

                    function n() {
                        return su(e, arguments, sc(this).constructor)
                    }
                    return n.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: n,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), sl(n, e)
                })(e)
            }

            function sf() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (sf = function() {
                    return !!e
                })()
            }(o = ea || (ea = {}))[o.DECLARATION = 0] = "DECLARATION", o[o.UNVERIFIED = 1] = "UNVERIFIED", (i = eo || (eo = {}))[i.DOUBLE = 1] = "DOUBLE", i[i.FLOAT = 2] = "FLOAT", i[i.INT64 = 3] = "INT64", i[i.UINT64 = 4] = "UINT64", i[i.INT32 = 5] = "INT32", i[i.FIXED64 = 6] = "FIXED64", i[i.FIXED32 = 7] = "FIXED32", i[i.BOOL = 8] = "BOOL", i[i.STRING = 9] = "STRING", i[i.GROUP = 10] = "GROUP", i[i.MESSAGE = 11] = "MESSAGE", i[i.BYTES = 12] = "BYTES", i[i.UINT32 = 13] = "UINT32", i[i.ENUM = 14] = "ENUM", i[i.SFIXED32 = 15] = "SFIXED32", i[i.SFIXED64 = 16] = "SFIXED64", i[i.SINT32 = 17] = "SINT32", i[i.SINT64 = 18] = "SINT64", (u = ei || (ei = {}))[u.OPTIONAL = 1] = "OPTIONAL", u[u.REPEATED = 3] = "REPEATED", u[u.REQUIRED = 2] = "REQUIRED", (c = eu || (eu = {}))[c.SPEED = 1] = "SPEED", c[c.CODE_SIZE = 2] = "CODE_SIZE", c[c.LITE_RUNTIME = 3] = "LITE_RUNTIME", (l = ec || (ec = {}))[l.STRING = 0] = "STRING", l[l.CORD = 1] = "CORD", l[l.STRING_PIECE = 2] = "STRING_PIECE", (s = el || (el = {}))[s.JS_NORMAL = 0] = "JS_NORMAL", s[s.JS_STRING = 1] = "JS_STRING", s[s.JS_NUMBER = 2] = "JS_NUMBER", (f = es || (es = {}))[f.RETENTION_UNKNOWN = 0] = "RETENTION_UNKNOWN", f[f.RETENTION_RUNTIME = 1] = "RETENTION_RUNTIME", f[f.RETENTION_SOURCE = 2] = "RETENTION_SOURCE", (d = ef || (ef = {}))[d.TARGET_TYPE_UNKNOWN = 0] = "TARGET_TYPE_UNKNOWN", d[d.TARGET_TYPE_FILE = 1] = "TARGET_TYPE_FILE", d[d.TARGET_TYPE_EXTENSION_RANGE = 2] = "TARGET_TYPE_EXTENSION_RANGE", d[d.TARGET_TYPE_MESSAGE = 3] = "TARGET_TYPE_MESSAGE", d[d.TARGET_TYPE_FIELD = 4] = "TARGET_TYPE_FIELD", d[d.TARGET_TYPE_ONEOF = 5] = "TARGET_TYPE_ONEOF", d[d.TARGET_TYPE_ENUM = 6] = "TARGET_TYPE_ENUM", d[d.TARGET_TYPE_ENUM_ENTRY = 7] = "TARGET_TYPE_ENUM_ENTRY", d[d.TARGET_TYPE_SERVICE = 8] = "TARGET_TYPE_SERVICE", d[d.TARGET_TYPE_METHOD = 9] = "TARGET_TYPE_METHOD", (p = ed || (ed = {}))[p.IDEMPOTENCY_UNKNOWN = 0] = "IDEMPOTENCY_UNKNOWN", p[p.NO_SIDE_EFFECTS = 1] = "NO_SIDE_EFFECTS", p[p.IDEMPOTENT = 2] = "IDEMPOTENT", (m = ep || (ep = {}))[m.DEFAULT_SYMBOL_VISIBILITY_UNKNOWN = 0] = "DEFAULT_SYMBOL_VISIBILITY_UNKNOWN", m[m.EXPORT_ALL = 1] = "EXPORT_ALL", m[m.EXPORT_TOP_LEVEL = 2] = "EXPORT_TOP_LEVEL", m[m.LOCAL_ALL = 3] = "LOCAL_ALL", m[m.STRICT = 4] = "STRICT", (y = em || (em = {}))[y.FIELD_PRESENCE_UNKNOWN = 0] = "FIELD_PRESENCE_UNKNOWN", y[y.EXPLICIT = 1] = "EXPLICIT", y[y.IMPLICIT = 2] = "IMPLICIT", y[y.LEGACY_REQUIRED = 3] = "LEGACY_REQUIRED", (v = ey || (ey = {}))[v.ENUM_TYPE_UNKNOWN = 0] = "ENUM_TYPE_UNKNOWN", v[v.OPEN = 1] = "OPEN", v[v.CLOSED = 2] = "CLOSED", (b = ev || (ev = {}))[b.REPEATED_FIELD_ENCODING_UNKNOWN = 0] = "REPEATED_FIELD_ENCODING_UNKNOWN", b[b.PACKED = 1] = "PACKED", b[b.EXPANDED = 2] = "EXPANDED", (h = eb || (eb = {}))[h.UTF8_VALIDATION_UNKNOWN = 0] = "UTF8_VALIDATION_UNKNOWN", h[h.VERIFY = 2] = "VERIFY", h[h.NONE = 3] = "NONE", (g = eh || (eh = {}))[g.MESSAGE_ENCODING_UNKNOWN = 0] = "MESSAGE_ENCODING_UNKNOWN", g[g.LENGTH_PREFIXED = 1] = "LENGTH_PREFIXED", g[g.DELIMITED = 2] = "DELIMITED", (S = eg || (eg = {}))[S.JSON_FORMAT_UNKNOWN = 0] = "JSON_FORMAT_UNKNOWN", S[S.ALLOW = 1] = "ALLOW", S[S.LEGACY_BEST_EFFORT = 2] = "LEGACY_BEST_EFFORT", (_ = eS || (eS = {}))[_.ENFORCE_NAMING_STYLE_UNKNOWN = 0] = "ENFORCE_NAMING_STYLE_UNKNOWN", _[_.STYLE2024 = 1] = "STYLE2024", _[_.STYLE_LEGACY = 2] = "STYLE_LEGACY", (E = e_ || (e_ = {}))[E.NONE = 0] = "NONE", E[E.SET = 1] = "SET", E[E.ALIAS = 2] = "ALIAS", (O = eE || (eE = {}))[O.EDITION_UNKNOWN = 0] = "EDITION_UNKNOWN", O[O.EDITION_LEGACY = 900] = "EDITION_LEGACY", O[O.EDITION_PROTO2 = 998] = "EDITION_PROTO2", O[O.EDITION_PROTO3 = 999] = "EDITION_PROTO3", O[O.EDITION_2023 = 1e3] = "EDITION_2023", O[O.EDITION_2024 = 1001] = "EDITION_2024", O[O.EDITION_UNSTABLE = 9999] = "EDITION_UNSTABLE", O[O.EDITION_1_TEST_ONLY = 1] = "EDITION_1_TEST_ONLY", O[O.EDITION_2_TEST_ONLY = 2] = "EDITION_2_TEST_ONLY", O[O.EDITION_99997_TEST_ONLY = 99997] = "EDITION_99997_TEST_ONLY", O[O.EDITION_99998_TEST_ONLY = 99998] = "EDITION_99998_TEST_ONLY", O[O.EDITION_99999_TEST_ONLY = 99999] = "EDITION_99999_TEST_ONLY", O[O.EDITION_MAX = 0x7fffffff] = "EDITION_MAX", (w = eO || (eO = {}))[w.VISIBILITY_UNSET = 0] = "VISIBILITY_UNSET", w[w.VISIBILITY_LOCAL = 1] = "VISIBILITY_LOCAL", w[w.VISIBILITY_EXPORT = 2] = "VISIBILITY_EXPORT";
            var sd = function(e) {
                if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                function t(e, n) {
                    var r, a, o, i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "FieldValueInvalidError";
                    if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                    return r = t, a = [n], r = sc(r), (o = function(e, t) {
                        var n;
                        if (t && ("object" == ((n = t) && "undefined" != typeof Symbol && n.constructor === Symbol ? "symbol" : typeof n) || "function" == typeof t)) return t;
                        if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                        return e
                    }(this, sf() ? Reflect.construct(r, a || [], sc(this).constructor) : r.apply(this, a))).name = i, o.field = function() {
                        return e
                    }, o
                }
                return t.prototype = Object.create(e && e.prototype, {
                    constructor: {
                        value: t,
                        writable: !0,
                        configurable: !0
                    }
                }), e && sl(t, e), t
            }(ss(Error));

            function sp(e) {
                return null !== e && (void 0 === e ? "undefined" : e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) == "object" && !Array.isArray(e)
            }

            function sm(e, t) {
                var n, r, a, o;
                if (sp(e) && lW in e && "add" in e && "field" in e && "function" == typeof e.field) {
                    if (void 0 !== t) {
                        var i = e.field();
                        return t.listKind == i.listKind && t.scalar === i.scalar && (null == (n = t.message) ? void 0 : n.typeName) === (null == (r = i.message) ? void 0 : r.typeName) && (null == (a = t.enum) ? void 0 : a.typeName) === (null == (o = i.enum) ? void 0 : o.typeName)
                    }
                    return !0
                }
                return !1
            }

            function sy(e, t) {
                var n, r, a, o;
                if (sp(e) && lW in e && "has" in e && "field" in e && "function" == typeof e.field) {
                    if (void 0 !== t) {
                        var i = e.field();
                        return t.mapKey === i.mapKey && t.mapKind == i.mapKind && t.scalar === i.scalar && (null == (n = t.message) ? void 0 : n.typeName) === (null == (r = i.message) ? void 0 : r.typeName) && (null == (a = t.enum) ? void 0 : a.typeName) === (null == (o = i.enum) ? void 0 : o.typeName)
                    }
                    return !0
                }
                return !1
            }

            function sv(e, t) {
                return sp(e) && lW in e && "desc" in e && sp(e.desc) && "message" === e.desc.kind && (void 0 === t || e.desc.typeName == t.typeName)
            }
            var sb = Symbol.for("@bufbuild/protobuf/text-encoding");

            function sh() {
                if (void 0 == globalThis[sb]) {
                    var e, t = new globalThis.TextEncoder,
                        n = new globalThis.TextDecoder;
                    globalThis[sb] = {
                        encodeUtf8: function(e) {
                            return t.encode(e)
                        },
                        decodeUtf8: function(t, r) {
                            return r ? (void 0 === e && (e = new globalThis.TextDecoder("utf-8", {
                                fatal: !0
                            })), e.decode(t)) : n.decode(t)
                        },
                        checkUtf8: function(e) {
                            try {
                                return encodeURIComponent(e), !0
                            } catch (e) {
                                return !1
                            }
                        }
                    }
                }
                return globalThis[sb]
            }

            function sg(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function sS(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function s_(e, t) {
                for (var n = 0; n < t.length; n++) {
                    var r = t[n];
                    r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                }
            }

            function sE(e, t, n) {
                return t && s_(e.prototype, t), n && s_(e, n), e
            }

            function sO(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || sA(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sw(e) {
                return function(e) {
                    if (Array.isArray(e)) return sg(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || sA(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sI(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function sA(e, t) {
                if (e) {
                    if ("string" == typeof e) return sg(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return sg(e, t)
                }
            }(I = ew || (ew = {}))[I.Varint = 0] = "Varint", I[I.Bit64 = 1] = "Bit64", I[I.LengthDelimited = 2] = "LengthDelimited", I[I.StartGroup = 3] = "StartGroup", I[I.EndGroup = 4] = "EndGroup", I[I.Bit32 = 5] = "Bit32";
            var sT = function() {
                    function e() {
                        var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : sh().encodeUtf8;
                        sS(this, e), this.encodeUtf8 = t, this.stack = [], this.chunks = [], this.buf = []
                    }
                    return sE(e, [{
                        key: "finish",
                        value: function() {
                            this.buf.length && (this.chunks.push(new Uint8Array(this.buf)), this.buf = []);
                            for (var e = 0, t = 0; t < this.chunks.length; t++) e += this.chunks[t].length;
                            for (var n = new Uint8Array(e), r = 0, a = 0; a < this.chunks.length; a++) n.set(this.chunks[a], r), r += this.chunks[a].length;
                            return this.chunks = [], n
                        }
                    }, {
                        key: "fork",
                        value: function() {
                            return this.stack.push({
                                chunks: this.chunks,
                                buf: this.buf
                            }), this.chunks = [], this.buf = [], this
                        }
                    }, {
                        key: "join",
                        value: function() {
                            var e = this.finish(),
                                t = this.stack.pop();
                            if (!t) throw Error("invalid state, fork stack empty");
                            return this.chunks = t.chunks, this.buf = t.buf, this.uint32(e.byteLength), this.raw(e)
                        }
                    }, {
                        key: "tag",
                        value: function(e, t) {
                            return this.uint32((e << 3 | t) >>> 0)
                        }
                    }, {
                        key: "raw",
                        value: function(e) {
                            return this.buf.length && (this.chunks.push(new Uint8Array(this.buf)), this.buf = []), this.chunks.push(e), this
                        }
                    }, {
                        key: "uint32",
                        value: function(e) {
                            for (sj(e); e > 127;) this.buf.push(127 & e | 128), e >>>= 7;
                            return this.buf.push(e), this
                        }
                    }, {
                        key: "int32",
                        value: function(e) {
                            return sk(e), lV(e, this.buf), this
                        }
                    }, {
                        key: "bool",
                        value: function(e) {
                            return this.buf.push(+!!e), this
                        }
                    }, {
                        key: "bytes",
                        value: function(e) {
                            return this.uint32(e.byteLength), this.raw(e)
                        }
                    }, {
                        key: "string",
                        value: function(e) {
                            var t = this.encodeUtf8(e);
                            return this.uint32(t.byteLength), this.raw(t)
                        }
                    }, {
                        key: "float",
                        value: function(e) {
                            var t = e;
                            if ("string" == typeof t) {
                                var n = t;
                                if (Number.isNaN(t = Number(t)) && "NaN" !== n) throw Error("invalid float32: " + n)
                            } else if ("number" != typeof t) throw Error("invalid float32: " + (void 0 === t ? "undefined" : sI(t)));
                            if (Number.isFinite(t) && (t > 34028234663852886e22 || t < -34028234663852886e22)) throw Error("invalid float32: " + t);
                            var r = new Uint8Array(4);
                            return new DataView(r.buffer).setFloat32(0, e, !0), this.raw(r)
                        }
                    }, {
                        key: "double",
                        value: function(e) {
                            var t = new Uint8Array(8);
                            return new DataView(t.buffer).setFloat64(0, e, !0), this.raw(t)
                        }
                    }, {
                        key: "fixed32",
                        value: function(e) {
                            sj(e);
                            var t = new Uint8Array(4);
                            return new DataView(t.buffer).setUint32(0, e, !0), this.raw(t)
                        }
                    }, {
                        key: "sfixed32",
                        value: function(e) {
                            sk(e);
                            var t = new Uint8Array(4);
                            return new DataView(t.buffer).setInt32(0, e, !0), this.raw(t)
                        }
                    }, {
                        key: "sint32",
                        value: function(e) {
                            return sk(e), lV(e = (e << 1 ^ e >> 31) >>> 0, this.buf), this
                        }
                    }, {
                        key: "sfixed64",
                        value: function(e) {
                            var t = new Uint8Array(8),
                                n = new DataView(t.buffer),
                                r = lF.enc(e);
                            return n.setInt32(0, r.lo, !0), n.setInt32(4, r.hi, !0), this.raw(t)
                        }
                    }, {
                        key: "fixed64",
                        value: function(e) {
                            var t = new Uint8Array(8),
                                n = new DataView(t.buffer),
                                r = lF.uEnc(e);
                            return n.setInt32(0, r.lo, !0), n.setInt32(4, r.hi, !0), this.raw(t)
                        }
                    }, {
                        key: "int64",
                        value: function(e) {
                            var t = lF.enc(e);
                            return lN(t.lo, t.hi, this.buf), this
                        }
                    }, {
                        key: "sint64",
                        value: function(e) {
                            var t = lF.enc(e),
                                n = t.hi >> 31;
                            return lN(t.lo << 1 ^ n, (t.hi << 1 | t.lo >>> 31) ^ n, this.buf), this
                        }
                    }, {
                        key: "uint64",
                        value: function(e) {
                            var t = lF.uEnc(e);
                            return lN(t.lo, t.hi, this.buf), this
                        }
                    }]), e
                }(),
                sN = function() {
                    function e(t) {
                        var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : sh().decodeUtf8;
                        sS(this, e), this.decodeUtf8 = n, this.varint64 = lT, this.uint32 = lZ, this.buf = t, this.len = t.length, this.pos = 0, this.view = new DataView(t.buffer, t.byteOffset, t.byteLength)
                    }
                    return sE(e, [{
                        key: "tag",
                        value: function() {
                            var e = this.pos,
                                t = this.uint32(),
                                n = this.pos - e;
                            if (n > 5 || 5 == n && this.buf[this.pos - 1] > 15) throw Error("illegal tag: varint overflows uint32");
                            var r = t >>> 3,
                                a = 7 & t;
                            if (r <= 0 || a > 5) throw Error("illegal tag: field no " + r + " wire type " + a);
                            return [r, a]
                        }
                    }, {
                        key: "skip",
                        value: function(e, t) {
                            var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 100,
                                r = this.pos;
                            switch (e) {
                                case ew.Varint:
                                    for (; 128 & this.buf[this.pos++];);
                                    break;
                                case ew.Bit64:
                                    this.pos += 4;
                                case ew.Bit32:
                                    this.pos += 4;
                                    break;
                                case ew.LengthDelimited:
                                    var a = this.uint32();
                                    this.pos += a;
                                    break;
                                case ew.StartGroup:
                                    if (n <= 0) throw Error("maximum recursion depth reached");
                                    for (;;) {
                                        var o = sO(this.tag(), 2),
                                            i = o[0],
                                            u = o[1];
                                        if (u === ew.EndGroup) {
                                            if (void 0 !== t && i !== t) throw Error("invalid end group tag");
                                            break
                                        }
                                        this.skip(u, i, n - 1)
                                    }
                                    break;
                                default:
                                    throw Error("cant skip wire type " + e)
                            }
                            return this.assertBounds(), this.buf.subarray(r, this.pos)
                        }
                    }, {
                        key: "assertBounds",
                        value: function() {
                            if (this.pos > this.len) throw RangeError("premature EOF")
                        }
                    }, {
                        key: "int32",
                        value: function() {
                            return 0 | this.uint32()
                        }
                    }, {
                        key: "sint32",
                        value: function() {
                            var e = this.uint32();
                            return e >>> 1 ^ -(1 & e)
                        }
                    }, {
                        key: "int64",
                        value: function() {
                            return lF.dec.apply(lF, sw(this.varint64()))
                        }
                    }, {
                        key: "uint64",
                        value: function() {
                            return lF.uDec.apply(lF, sw(this.varint64()))
                        }
                    }, {
                        key: "sint64",
                        value: function() {
                            var e = sO(this.varint64(), 2),
                                t = e[0],
                                n = e[1],
                                r = -(1 & t);
                            return t = (t >>> 1 | (1 & n) << 31) ^ r, n = n >>> 1 ^ r, lF.dec(t, n)
                        }
                    }, {
                        key: "bool",
                        value: function() {
                            var e = sO(this.varint64(), 2),
                                t = e[0],
                                n = e[1];
                            return 0 !== t || 0 !== n
                        }
                    }, {
                        key: "fixed32",
                        value: function() {
                            return this.view.getUint32((this.pos += 4) - 4, !0)
                        }
                    }, {
                        key: "sfixed32",
                        value: function() {
                            return this.view.getInt32((this.pos += 4) - 4, !0)
                        }
                    }, {
                        key: "fixed64",
                        value: function() {
                            return lF.uDec(this.sfixed32(), this.sfixed32())
                        }
                    }, {
                        key: "sfixed64",
                        value: function() {
                            return lF.dec(this.sfixed32(), this.sfixed32())
                        }
                    }, {
                        key: "float",
                        value: function() {
                            return this.view.getFloat32((this.pos += 4) - 4, !0)
                        }
                    }, {
                        key: "double",
                        value: function() {
                            return this.view.getFloat64((this.pos += 8) - 8, !0)
                        }
                    }, {
                        key: "bytes",
                        value: function() {
                            var e = this.uint32(),
                                t = this.pos;
                            return this.pos += e, this.assertBounds(), this.buf.subarray(t, t + e)
                        }
                    }, {
                        key: "string",
                        value: function(e) {
                            return this.decodeUtf8(this.bytes(), e)
                        }
                    }]), e
                }();

            function sk(e) {
                if ("string" == typeof e) e = Number(e);
                else if ("number" != typeof e) throw Error("invalid int32: " + (void 0 === e ? "undefined" : sI(e)));
                if (!Number.isInteger(e) || e > 0x7fffffff || e < -0x80000000) throw Error("invalid int32: " + e)
            }

            function sj(e) {
                if ("string" == typeof e) e = Number(e);
                else if ("number" != typeof e) throw Error("invalid uint32: " + (void 0 === e ? "undefined" : sI(e)));
                if (!Number.isInteger(e) || e > 0xffffffff || e < 0) throw Error("invalid uint32: " + e)
            }

            function sx(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function sR(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function sP(e, t, n) {
                var r = sV(e, n);
                if (!0 !== r) return new sd(e, "list item #".concat(t + 1, ": ").concat(sC(e, n, r)))
            }

            function sV(e, t) {
                return void 0 !== e.scalar ? sZ(t, e.scalar) : void 0 !== e.enum ? e.enum.open ? sZ(t, er.INT32) : e.enum.values.some(function(e) {
                    return e.number === t
                }) : sv(t, e.message)
            }

            function sZ(e, t) {
                switch (t) {
                    case er.DOUBLE:
                        return "number" == typeof e;
                    case er.FLOAT:
                        if ("number" != typeof e) return !1;
                        if (Number.isNaN(e) || !Number.isFinite(e)) return !0;
                        if (e > 34028234663852886e22 || e < -34028234663852886e22) return "".concat(e.toFixed(), " out of range");
                        return !0;
                    case er.INT32:
                    case er.SFIXED32:
                    case er.SINT32:
                        if ("number" != typeof e || !Number.isInteger(e)) return !1;
                        if (e > 0x7fffffff || e < -0x80000000) return "".concat(e.toFixed(), " out of range");
                        return !0;
                    case er.FIXED32:
                    case er.UINT32:
                        if ("number" != typeof e || !Number.isInteger(e)) return !1;
                        if (e > 0xffffffff || e < 0) return "".concat(e.toFixed(), " out of range");
                        return !0;
                    case er.BOOL:
                        return "boolean" == typeof e;
                    case er.STRING:
                        if ("string" != typeof e) return !1;
                        return sh().checkUtf8(e) || "invalid UTF8";
                    case er.BYTES:
                        return sx(e, Uint8Array);
                    case er.INT64:
                    case er.SFIXED64:
                    case er.SINT64:
                        if ((void 0 === e ? "undefined" : sR(e)) == "bigint" || "number" == typeof e || "string" == typeof e && e.length > 0) try {
                            return lF.parse(e), !0
                        } catch (t) {
                            return "".concat(e, " out of range")
                        }
                        return !1;
                    case er.FIXED64:
                    case er.UINT64:
                        if ((void 0 === e ? "undefined" : sR(e)) == "bigint" || "number" == typeof e || "string" == typeof e && e.length > 0) try {
                            return lF.uParse(e), !0
                        } catch (t) {
                            return "".concat(e, " out of range")
                        }
                        return !1
                }
            }

            function sC(e, t, n) {
                return (n = "string" == typeof n ? ": ".concat(n) : ", got ".concat(sD(t)), void 0 !== e.scalar) ? "expected ".concat(function(e) {
                    switch (e) {
                        case er.STRING:
                            return "string";
                        case er.BOOL:
                            return "boolean";
                        case er.INT64:
                        case er.SINT64:
                        case er.SFIXED64:
                            return "bigint (int64)";
                        case er.UINT64:
                        case er.FIXED64:
                            return "bigint (uint64)";
                        case er.BYTES:
                            return "Uint8Array";
                        case er.DOUBLE:
                            return "number (float64)";
                        case er.FLOAT:
                            return "number (float32)";
                        case er.FIXED32:
                        case er.UINT32:
                            return "number (uint32)";
                        case er.INT32:
                        case er.SFIXED32:
                        case er.SINT32:
                            return "number (int32)"
                    }
                }(e.scalar)) + n : void 0 !== e.enum ? "expected ".concat(e.enum.toString()) + n : "expected ".concat(sF(e.message)) + n
            }

            function sD(e) {
                switch (void 0 === e ? "undefined" : sR(e)) {
                    case "object":
                        if (null === e) return "null";
                        if (sx(e, Uint8Array)) return "Uint8Array(".concat(e.length, ")");
                        if (Array.isArray(e)) return "Array(".concat(e.length, ")");
                        if (sm(e)) return sL(e.field());
                        if (sy(e)) return sX(e.field());
                        if (sv(e)) return sF(e.desc);
                        if (si(e)) return "message ".concat(e.$typeName);
                        return "object";
                    case "string":
                        return e.length > 30 ? "string" : '"'.concat(e.split('"').join('\\"'), '"');
                    case "boolean":
                    case "number":
                        return String(e);
                    case "bigint":
                        return String(e) + "n";
                    default:
                        return void 0 === e ? "undefined" : sR(e)
                }
            }

            function sF(e) {
                return "ReflectMessage (".concat(e.typeName, ")")
            }

            function sL(e) {
                switch (e.listKind) {
                    case "message":
                        return "ReflectList (".concat(e.message.toString(), ")");
                    case "enum":
                        return "ReflectList (".concat(e.enum.toString(), ")");
                    case "scalar":
                        return "ReflectList (".concat(er[e.scalar], ")")
                }
            }

            function sX(e) {
                switch (e.mapKind) {
                    case "message":
                        return "ReflectMap (".concat(er[e.mapKey], ", ").concat(e.message.toString(), ")");
                    case "enum":
                        return "ReflectMap (".concat(er[e.mapKey], ", ").concat(e.enum.toString(), ")");
                    case "scalar":
                        return "ReflectMap (".concat(er[e.mapKey], ", ").concat(er[e.scalar], ")")
                }
            }

            function sY(e) {
                var t = e.fields[0];
                return sW(e.typeName) && void 0 !== t && "scalar" == t.fieldKind && "value" == t.name && 1 == t.number
            }

            function sW(e) {
                return e.startsWith("google.protobuf.") && ["DoubleValue", "FloatValue", "Int64Value", "UInt64Value", "Int32Value", "UInt32Value", "BoolValue", "StringValue", "BytesValue"].includes(e.substring(16))
            }

            function sB(e, t) {
                if (si(t, e)) return t;
                var n = function(e) {
                    var t;
                    if (function(e) {
                            switch (e.file.edition) {
                                case 999:
                                    return !1;
                                case 998:
                                    return !0;
                                default:
                                    return e.fields.some(function(e) {
                                        return 2 != e.presence && "message" != e.fieldKind && !e.oneof
                                    })
                            }
                        }(e)) {
                        var n = sz.get(e);
                        if (n) i = n.prototype, u = n.members;
                        else {
                            i = {}, u = new Set;
                            var r = !0,
                                a = !1,
                                o = void 0;
                            try {
                                for (var i, u, c, l = e.members[Symbol.iterator](); !(r = (c = l.next()).done); r = !0) {
                                    var s = c.value;
                                    "oneof" != s.kind && ("scalar" == s.fieldKind || "enum" == s.fieldKind) && 2 != s.presence && (u.add(s), i[s.localName] = sH(s))
                                }
                            } catch (e) {
                                a = !0, o = e
                            } finally {
                                try {
                                    r || null == l.return || l.return()
                                } finally {
                                    if (a) throw o
                                }
                            }
                            sz.set(e, {
                                prototype: i,
                                members: u
                            })
                        }(t = Object.create(i)).$typeName = e.typeName;
                        var f = !0,
                            d = !1,
                            p = void 0;
                        try {
                            for (var m, y = e.members[Symbol.iterator](); !(f = (m = y.next()).done); f = !0) {
                                var v = m.value;
                                if (!u.has(v)) {
                                    if ("field" == v.kind && ("message" == v.fieldKind || ("scalar" == v.fieldKind || "enum" == v.fieldKind) && 2 != v.presence)) continue;
                                    t[v.localName] = sH(v)
                                }
                            }
                        } catch (e) {
                            d = !0, p = e
                        } finally {
                            try {
                                f || null == y.return || y.return()
                            } finally {
                                if (d) throw p
                            }
                        }
                    } else {
                        t = {
                            $typeName: e.typeName
                        };
                        var b = !0,
                            h = !1,
                            g = void 0;
                        try {
                            for (var S, _ = e.members[Symbol.iterator](); !(b = (S = _.next()).done); b = !0) {
                                var E = S.value;
                                ("oneof" == E.kind || 2 == E.presence) && (t[E.localName] = sH(E))
                            }
                        } catch (e) {
                            h = !0, g = e
                        } finally {
                            try {
                                b || null == _.return || _.return()
                            } finally {
                                if (h) throw g
                            }
                        }
                    }
                    return t
                }(e);
                return void 0 !== t && function(e, t, n) {
                    var r = !0,
                        a = !1,
                        o = void 0;
                    try {
                        for (var i, u = e.members[Symbol.iterator](); !(r = (i = u.next()).done); r = !0) {
                            var c = i.value,
                                l = n[c.localName];
                            if (null != l) {
                                var s = void 0;
                                if ("oneof" == c.kind) {
                                    var f = lB(n, c);
                                    if (!f) continue;
                                    s = f, l = lU(n, f)
                                } else s = c;
                                switch (s.fieldKind) {
                                    case "message":
                                        l = sU(s, l);
                                        break;
                                    case "scalar":
                                        l = sG(s, l);
                                        break;
                                    case "list":
                                        l = function(e, t) {
                                            if (Array.isArray(t)) {
                                                if (e.scalar == er.BYTES) return t.map(sM);
                                                if ("message" == e.listKind) return t.map(function(t) {
                                                    return sU(e, t)
                                                })
                                            }
                                            return t
                                        }(s, l);
                                        break;
                                    case "map":
                                        l = function(e, t) {
                                            if (sp(t)) {
                                                if (e.scalar == er.BYTES) return sJ(t, sM);
                                                if ("message" == e.mapKind) return sJ(t, function(t) {
                                                    return sU(e, t)
                                                })
                                            }
                                            return t
                                        }(s, l)
                                }
                                lM(t, s, l)
                            }
                        }
                    } catch (e) {
                        a = !0, o = e
                    } finally {
                        try {
                            r || null == u.return || u.return()
                        } finally {
                            if (a) throw o
                        }
                    }
                }(e, n, t), n
            }

            function sG(e, t) {
                return e.scalar == er.BYTES ? sM(t) : t
            }

            function sU(e, t) {
                if ("message" == e.fieldKind && !e.oneof && sY(e.message)) return sG(e.message.fields[0], t);
                if (sp(t)) {
                    if ("google.protobuf.Struct" == e.message.typeName && "google.protobuf.Value" !== e.parent.typeName) return t;
                    if (!si(t, e.message)) return sB(e.message, t)
                }
                return t
            }

            function sM(e) {
                return Array.isArray(e) ? new Uint8Array(e) : e
            }

            function sJ(e, t) {
                var n = {},
                    r = !0,
                    a = !1,
                    o = void 0;
                try {
                    for (var i, u = Object.entries(e)[Symbol.iterator](); !(r = (i = u.next()).done); r = !0) {
                        var c = i.value;
                        n[c[0]] = t(c[1])
                    }
                } catch (e) {
                    a = !0, o = e
                } finally {
                    try {
                        r || null == u.return || u.return()
                    } finally {
                        if (a) throw o
                    }
                }
                return n
            }
            var sK = Symbol(),
                sz = new WeakMap;

            function sH(e) {
                if ("oneof" == e.kind) return {
                    case: void 0
                };
                if ("list" == e.fieldKind) return [];
                if ("map" == e.fieldKind) return {};
                if ("message" == e.fieldKind) return sK;
                var t = e.getDefaultValue();
                return void 0 !== t ? "scalar" == e.fieldKind && e.longAsString ? t.toString() : t : "scalar" == e.fieldKind ? lY(e.scalar, e.longAsString) : e.enum.values[0].number
            }

            function sQ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function sq(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function s$(e, t) {
                for (var n = 0; n < t.length; n++) {
                    var r = t[n];
                    r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                }
            }

            function s0(e, t, n) {
                return t && s$(e.prototype, t), n && s$(e, n), e
            }

            function s1(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sQ(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return sQ(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function s2(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = u(0), i.throw = u(1), i.return = u(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function u(u) {
                    return function(c) {
                        var l = [u, c];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, l[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & l[0] ? r.return : l[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, l[1])).done) return a;
                            switch (r = 0, a && (l = [2 & l[0], a.value]), l[0]) {
                                case 0:
                                case 1:
                                    a = l;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: l[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, r = l[1], l = [0];
                                    continue;
                                case 7:
                                    l = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === l[0] && (!a || l[1] > a[0] && l[1] < a[3])) {
                                        o.label = l[1];
                                        break
                                    }
                                    if (6 === l[0] && o.label < a[1]) {
                                        o.label = a[1], a = l;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(l);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            l = t.call(e, o)
                        } catch (e) {
                            l = [6, e], r = 0
                        } finally {
                            n = a = 0
                        }
                        if (5 & l[0]) throw l[1];
                        return {
                            value: l[0] ? l[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function s3(e, t) {
                var n = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
                return new s9(e, t, n)
            }
            var s5 = new WeakMap,
                s9 = function() {
                    function e(t, n) {
                        var r = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
                        sq(this, e), this.lists = new Map, this.maps = new Map, this.check = r, this.desc = t, this.message = this[lW] = null != n ? n : sB(t), this.fields = t.fields, this.oneofs = t.oneofs, this.members = t.members
                    }
                    return s0(e, [{
                        key: "sortedFields",
                        get: function() {
                            var e = s5.get(this.desc);
                            if (e) return e;
                            var t = this.desc.fields.concat().sort(function(e, t) {
                                return e.number - t.number
                            });
                            return s5.set(this.desc, t), t
                        }
                    }, {
                        key: "findNumber",
                        value: function(e) {
                            return this._fieldsByNumber || (this._fieldsByNumber = new Map(this.desc.fields.map(function(e) {
                                return [e.number, e]
                            }))), this._fieldsByNumber.get(e)
                        }
                    }, {
                        key: "oneofCase",
                        value: function(e) {
                            return s4(this.message, e), lB(this.message, e)
                        }
                    }, {
                        key: "isSet",
                        value: function(e) {
                            s4(this.message, e);
                            var t = this.message,
                                n = e.localName;
                            if (e.oneof) return t[e.oneof.localName].case === n;
                            if (2 != e.presence) return void 0 !== t[n] && Object.prototype.hasOwnProperty.call(t, n);
                            switch (e.fieldKind) {
                                case "list":
                                    return t[n].length > 0;
                                case "map":
                                    return Object.keys(t[n]).length > 0;
                                case "scalar":
                                    return ! function(e, t) {
                                        switch (e) {
                                            case er.BOOL:
                                                return !1 === t;
                                            case er.STRING:
                                                return "" === t;
                                            case er.BYTES:
                                                var n;
                                                return (null != (n = Uint8Array) && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n) && !t.byteLength;
                                            case er.DOUBLE:
                                            case er.FLOAT:
                                                return Object.is(t, 0);
                                            default:
                                                return 0 == t
                                        }
                                    }(e.scalar, t[n]);
                                case "enum":
                                    return t[n] !== e.enum.values[0].number
                            }
                            throw Error("message field with implicit presence")
                        }
                    }, {
                        key: "clear",
                        value: function(e) {
                            s4(this.message, e);
                            var t = this.message,
                                n = e.localName;
                            if (e.oneof) {
                                var r = e.oneof.localName;
                                t[r].case === n && (t[r] = {
                                    case: void 0
                                })
                            } else if (2 != e.presence) delete t[n];
                            else switch (e.fieldKind) {
                                case "map":
                                    t[n] = {};
                                    break;
                                case "list":
                                    t[n] = [];
                                    break;
                                case "enum":
                                    t[n] = e.enum.values[0].number;
                                    break;
                                case "scalar":
                                    t[n] = lY(e.scalar, e.longAsString)
                            }
                        }
                    }, {
                        key: "get",
                        value: function(e) {
                            s4(this.message, e);
                            var t = lU(this.message, e);
                            switch (e.fieldKind) {
                                case "list":
                                    var n = this.lists.get(e);
                                    return n && n[lW] === t || this.lists.set(e, n = new s8(e, t, this.check)), n;
                                case "map":
                                    var r = this.maps.get(e);
                                    return r && r[lW] === t || this.maps.set(e, r = new s6(e, t, this.check)), r;
                                case "message":
                                    return fe(e, t, this.check);
                                case "scalar":
                                    return void 0 === t ? lY(e.scalar, !1) : fi(e, t);
                                case "enum":
                                    return null != t ? t : e.enum.values[0].number
                            }
                        }
                    }, {
                        key: "set",
                        value: function(e, t) {
                            if (s4(this.message, e), this.check) {
                                var n, r = function(e, t) {
                                    var n, r = "list" == e.fieldKind ? sm(t, e) : "map" == e.fieldKind ? sy(t, e) : sV(e, t);
                                    if (!0 !== r) {
                                        switch (e.fieldKind) {
                                            case "list":
                                                n = "expected ".concat(sL(e), ", got ").concat(sD(t));
                                                break;
                                            case "map":
                                                n = "expected ".concat(sX(e), ", got ").concat(sD(t));
                                                break;
                                            default:
                                                n = sC(e, t, r)
                                        }
                                        return new sd(e, n)
                                    }
                                }(e, t);
                                if (r) throw r
                            }
                            n = "message" == e.fieldKind ? s7(e, t) : sy(t) || sm(t) ? t[lW] : fu(e, t), lM(this.message, e, n)
                        }
                    }, {
                        key: "getUnknown",
                        value: function() {
                            return this.message.$unknown
                        }
                    }, {
                        key: "setUnknown",
                        value: function(e) {
                            this.message.$unknown = e
                        }
                    }]), e
                }();

            function s4(e, t) {
                if (t.parent.typeName !== e.$typeName) throw new sd(t, "cannot use ".concat(t.toString(), " with message ").concat(e.$typeName), "ForeignFieldError")
            }
            var s8 = function() {
                    function e(t, n, r) {
                        sq(this, e), this._field = t, this._arr = this[lW] = n, this.check = r
                    }
                    return s0(e, [{
                        key: "field",
                        value: function() {
                            return this._field
                        }
                    }, {
                        key: "size",
                        get: function() {
                            return this._arr.length
                        }
                    }, {
                        key: "get",
                        value: function(e) {
                            var t = this._arr[e];
                            return void 0 === t ? void 0 : fn(this._field, t, this.check)
                        }
                    }, {
                        key: "set",
                        value: function(e, t) {
                            if (e < 0 || e >= this._arr.length) throw new sd(this._field, "list item #".concat(e + 1, ": out of range"));
                            if (this.check) {
                                var n = sP(this._field, e, t);
                                if (n) throw n
                            }
                            this._arr[e] = ft(this._field, t)
                        }
                    }, {
                        key: "add",
                        value: function(e) {
                            if (this.check) {
                                var t = sP(this._field, this._arr.length, e);
                                if (t) throw t
                            }
                            this._arr.push(ft(this._field, e))
                        }
                    }, {
                        key: "clear",
                        value: function() {
                            this._arr.splice(0, this._arr.length)
                        }
                    }, {
                        key: Symbol.iterator,
                        value: function() {
                            return this.values()
                        }
                    }, {
                        key: "keys",
                        value: function() {
                            return this._arr.keys()
                        }
                    }, {
                        key: "values",
                        value: function() {
                            var e, t, n, r, a, o, i;
                            return s2(this, function(u) {
                                switch (u.label) {
                                    case 0:
                                        e = !0, t = !1, n = void 0, u.label = 1;
                                    case 1:
                                        u.trys.push([1, 6, 7, 8]), r = this._arr[Symbol.iterator](), u.label = 2;
                                    case 2:
                                        if (e = (a = r.next()).done) return [3, 5];
                                        return o = a.value, [4, fn(this._field, o, this.check)];
                                    case 3:
                                        u.sent(), u.label = 4;
                                    case 4:
                                        return e = !0, [3, 2];
                                    case 5:
                                        return [3, 8];
                                    case 6:
                                        return i = u.sent(), t = !0, n = i, [3, 8];
                                    case 7:
                                        try {
                                            e || null == r.return || r.return()
                                        } finally {
                                            if (t) throw n
                                        }
                                        return [7];
                                    case 8:
                                        return [2]
                                }
                            })
                        }
                    }, {
                        key: "entries",
                        value: function() {
                            var e;
                            return s2(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        e = 0, t.label = 1;
                                    case 1:
                                        if (!(e < this._arr.length)) return [3, 4];
                                        return [4, [e, fn(this._field, this._arr[e], this.check)]];
                                    case 2:
                                        t.sent(), t.label = 3;
                                    case 3:
                                        return e++, [3, 1];
                                    case 4:
                                        return [2]
                                }
                            })
                        }
                    }]), e
                }(),
                s6 = function() {
                    function e(t, n) {
                        var r = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
                        sq(this, e), this.obj = this[lW] = null != n ? n : {}, this.check = r, this._field = t
                    }
                    return s0(e, [{
                        key: "field",
                        value: function() {
                            return this._field
                        }
                    }, {
                        key: "set",
                        value: function(e, t) {
                            if (this.check) {
                                var n, r, a = function(e, t, n) {
                                    var r = sZ(t, e.mapKey);
                                    if (!0 !== r) return new sd(e, "invalid map key: ".concat(sC({
                                        scalar: e.mapKey
                                    }, t, r)));
                                    var a = sV(e, n);
                                    if (!0 !== a) return new sd(e, "map entry ".concat(sD(t), ": ").concat(sC(e, n, a)))
                                }(this._field, e, t);
                                if (a) throw a
                            }
                            return this.obj[fa(e)] = (n = this._field, r = t, "message" == n.mapKind ? s7(n, r) : fu(n, r)), this
                        }
                    }, {
                        key: "delete",
                        value: function(e) {
                            var t = fa(e),
                                n = Object.prototype.hasOwnProperty.call(this.obj, t);
                            return n && delete this.obj[t], n
                        }
                    }, {
                        key: "clear",
                        value: function() {
                            var e = !0,
                                t = !1,
                                n = void 0;
                            try {
                                for (var r, a = Object.keys(this.obj)[Symbol.iterator](); !(e = (r = a.next()).done); e = !0) {
                                    var o = r.value;
                                    delete this.obj[o]
                                }
                            } catch (e) {
                                t = !0, n = e
                            } finally {
                                try {
                                    e || null == a.return || a.return()
                                } finally {
                                    if (t) throw n
                                }
                            }
                        }
                    }, {
                        key: "get",
                        value: function(e) {
                            var t = this.obj[fa(e)];
                            return void 0 !== t && (t = fr(this._field, t, this.check)), t
                        }
                    }, {
                        key: "has",
                        value: function(e) {
                            return Object.prototype.hasOwnProperty.call(this.obj, fa(e))
                        }
                    }, {
                        key: "keys",
                        value: function() {
                            var e, t, n, r, a, o;
                            return s2(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        e = !0, t = !1, n = void 0, i.label = 1;
                                    case 1:
                                        i.trys.push([1, 6, 7, 8]), r = Object.keys(this.obj)[Symbol.iterator](), i.label = 2;
                                    case 2:
                                        if (e = (a = r.next()).done) return [3, 5];
                                        return [4, fo(a.value, this._field.mapKey)];
                                    case 3:
                                        i.sent(), i.label = 4;
                                    case 4:
                                        return e = !0, [3, 2];
                                    case 5:
                                        return [3, 8];
                                    case 6:
                                        return o = i.sent(), t = !0, n = o, [3, 8];
                                    case 7:
                                        try {
                                            e || null == r.return || r.return()
                                        } finally {
                                            if (t) throw n
                                        }
                                        return [7];
                                    case 8:
                                        return [2]
                                }
                            })
                        }
                    }, {
                        key: "entries",
                        value: function() {
                            var e, t, n, r, a, o, i;
                            return s2(this, function(u) {
                                switch (u.label) {
                                    case 0:
                                        e = !0, t = !1, n = void 0, u.label = 1;
                                    case 1:
                                        u.trys.push([1, 6, 7, 8]), r = Object.entries(this.obj)[Symbol.iterator](), u.label = 2;
                                    case 2:
                                        if (e = (a = r.next()).done) return [3, 5];
                                        return [4, [fo((o = a.value)[0], this._field.mapKey), fr(this._field, o[1], this.check)]];
                                    case 3:
                                        u.sent(), u.label = 4;
                                    case 4:
                                        return e = !0, [3, 2];
                                    case 5:
                                        return [3, 8];
                                    case 6:
                                        return i = u.sent(), t = !0, n = i, [3, 8];
                                    case 7:
                                        try {
                                            e || null == r.return || r.return()
                                        } finally {
                                            if (t) throw n
                                        }
                                        return [7];
                                    case 8:
                                        return [2]
                                }
                            })
                        }
                    }, {
                        key: Symbol.iterator,
                        value: function() {
                            return this.entries()
                        }
                    }, {
                        key: "size",
                        get: function() {
                            return Object.keys(this.obj).length
                        }
                    }, {
                        key: "values",
                        value: function() {
                            var e, t, n, r, a, o, i;
                            return s2(this, function(u) {
                                switch (u.label) {
                                    case 0:
                                        e = !0, t = !1, n = void 0, u.label = 1;
                                    case 1:
                                        u.trys.push([1, 6, 7, 8]), r = Object.values(this.obj)[Symbol.iterator](), u.label = 2;
                                    case 2:
                                        if (e = (a = r.next()).done) return [3, 5];
                                        return o = a.value, [4, fr(this._field, o, this.check)];
                                    case 3:
                                        u.sent(), u.label = 4;
                                    case 4:
                                        return e = !0, [3, 2];
                                    case 5:
                                        return [3, 8];
                                    case 6:
                                        return i = u.sent(), t = !0, n = i, [3, 8];
                                    case 7:
                                        try {
                                            e || null == r.return || r.return()
                                        } finally {
                                            if (t) throw n
                                        }
                                        return [7];
                                    case 8:
                                        return [2]
                                }
                            })
                        }
                    }, {
                        key: "forEach",
                        value: function(e, t) {
                            var n = !0,
                                r = !1,
                                a = void 0;
                            try {
                                for (var o, i = this.entries()[Symbol.iterator](); !(n = (o = i.next()).done); n = !0) {
                                    var u = o.value;
                                    e.call(t, u[1], u[0], this)
                                }
                            } catch (e) {
                                r = !0, a = e
                            } finally {
                                try {
                                    n || null == i.return || i.return()
                                } finally {
                                    if (r) throw a
                                }
                            }
                        }
                    }]), e
                }();

            function s7(e, t) {
                return sv(t) ? sW(t.message.$typeName) && !e.oneof && "message" == e.fieldKind ? t.message.value : "google.protobuf.Struct" == t.desc.typeName && "google.protobuf.Value" != e.parent.typeName ? function e(t) {
                    var n = {},
                        r = !0,
                        a = !1,
                        o = void 0;
                    try {
                        for (var i, u = Object.entries(t.fields)[Symbol.iterator](); !(r = (i = u.next()).done); r = !0) {
                            var c = s1(i.value, 2),
                                l = c[0],
                                s = c[1];
                            n[l] = function t(n) {
                                switch (n.kind.case) {
                                    case "structValue":
                                        return e(n.kind.value);
                                    case "listValue":
                                        return n.kind.value.values.map(t);
                                    case "nullValue":
                                    case void 0:
                                        return null;
                                    default:
                                        return n.kind.value
                                }
                            }(s)
                        }
                    } catch (e) {
                        a = !0, o = e
                    } finally {
                        try {
                            r || null == u.return || u.return()
                        } finally {
                            if (a) throw o
                        }
                    }
                    return n
                }(t.message) : t.message : t
            }

            function fe(e, t, n) {
                return void 0 !== t && (sY(e.message) && !e.oneof && "message" == e.fieldKind ? t = {
                    $typeName: e.message.typeName,
                    value: fi(e.message.fields[0], t)
                } : "google.protobuf.Struct" == e.message.typeName && "google.protobuf.Value" != e.parent.typeName && sp(t) && (t = function e(t) {
                    var n = {
                        $typeName: "google.protobuf.Struct",
                        fields: {}
                    };
                    if (sp(t)) {
                        var r = !0,
                            a = !1,
                            o = void 0;
                        try {
                            for (var i, u = Object.entries(t)[Symbol.iterator](); !(r = (i = u.next()).done); r = !0) {
                                var c = s1(i.value, 2),
                                    l = c[0],
                                    s = c[1];
                                n.fields[l] = function t(n) {
                                    var r = {
                                        $typeName: "google.protobuf.Value",
                                        kind: {
                                            case: void 0
                                        }
                                    };
                                    switch (void 0 === n ? "undefined" : n && "undefined" != typeof Symbol && n.constructor === Symbol ? "symbol" : typeof n) {
                                        case "number":
                                            r.kind = {
                                                case: "numberValue",
                                                value: n
                                            };
                                            break;
                                        case "string":
                                            r.kind = {
                                                case: "stringValue",
                                                value: n
                                            };
                                            break;
                                        case "boolean":
                                            r.kind = {
                                                case: "boolValue",
                                                value: n
                                            };
                                            break;
                                        case "object":
                                            if (null === n) r.kind = {
                                                case: "nullValue",
                                                value: 0
                                            };
                                            else if (Array.isArray(n)) {
                                                var a = {
                                                    $typeName: "google.protobuf.ListValue",
                                                    values: []
                                                };
                                                if (Array.isArray(n)) {
                                                    var o = !0,
                                                        i = !1,
                                                        u = void 0;
                                                    try {
                                                        for (var c, l = n[Symbol.iterator](); !(o = (c = l.next()).done); o = !0) {
                                                            var s = c.value;
                                                            a.values.push(t(s))
                                                        }
                                                    } catch (e) {
                                                        i = !0, u = e
                                                    } finally {
                                                        try {
                                                            o || null == l.return || l.return()
                                                        } finally {
                                                            if (i) throw u
                                                        }
                                                    }
                                                }
                                                r.kind = {
                                                    case: "listValue",
                                                    value: a
                                                }
                                            } else r.kind = {
                                                case: "structValue",
                                                value: e(n)
                                            }
                                    }
                                    return r
                                }(s)
                            }
                        } catch (e) {
                            a = !0, o = e
                        } finally {
                            try {
                                r || null == u.return || u.return()
                            } finally {
                                if (a) throw o
                            }
                        }
                    }
                    return n
                }(t))), new s9(e.message, t, n)
            }

            function ft(e, t) {
                return "message" == e.listKind ? s7(e, t) : fu(e, t)
            }

            function fn(e, t, n) {
                return "message" == e.listKind ? fe(e, t, n) : fi(e, t)
            }

            function fr(e, t, n) {
                return "message" == e.mapKind ? fe(e, t, n) : t
            }

            function fa(e) {
                return "string" == typeof e || "number" == typeof e ? e : String(e)
            }

            function fo(e, t) {
                switch (t) {
                    case er.STRING:
                        break;
                    case er.INT32:
                    case er.FIXED32:
                    case er.UINT32:
                    case er.SFIXED32:
                    case er.SINT32:
                        var n = Number.parseInt(e);
                        if (Number.isFinite(n)) return n;
                        break;
                    case er.BOOL:
                        switch (e) {
                            case "true":
                                return !0;
                            case "false":
                                return !1
                        }
                        break;
                    case er.UINT64:
                    case er.FIXED64:
                        try {
                            return lF.uParse(e)
                        } catch (e) {}
                        break;
                    default:
                        try {
                            return lF.parse(e)
                        } catch (e) {}
                }
                return e
            }

            function fi(e, t) {
                switch (e.scalar) {
                    case er.INT64:
                    case er.SFIXED64:
                    case er.SINT64:
                        "longAsString" in e && e.longAsString && "string" == typeof t && (t = lF.parse(t));
                        break;
                    case er.FIXED64:
                    case er.UINT64:
                        "longAsString" in e && e.longAsString && "string" == typeof t && (t = lF.uParse(t))
                }
                return t
            }

            function fu(e, t) {
                switch (e.scalar) {
                    case er.INT64:
                    case er.SFIXED64:
                    case er.SINT64:
                        "longAsString" in e && e.longAsString ? t = String(t) : ("string" == typeof t || "number" == typeof t) && (t = lF.parse(t));
                        break;
                    case er.FIXED64:
                    case er.UINT64:
                        "longAsString" in e && e.longAsString ? t = String(t) : ("string" == typeof t || "number" == typeof t) && (t = lF.uParse(t))
                }
                return t
            }

            function fc(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function fl(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return fc(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return fc(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function fs(e, t, n, r, a) {
                if (++n.depth > n.recursionLimit) throw Error("cannot decode ".concat(e.desc, " from binary: maximum recursion depth of ").concat(n.recursionLimit, " reached"));
                for (var o = r ? t.len : t.pos + a, i = null != (u = e.getUnknown()) ? u : []; t.pos < o && (c = (s = fl(t.tag(), 2))[0], l = s[1], !r || l != ew.EndGroup);) {
                    var u, c, l, s, f = e.findNumber(c);
                    if (!f) {
                        var d = n.recursionLimit - n.depth,
                            p = t.skip(l, c, d);
                        n.readUnknownFields && i.push({
                            no: c,
                            wireType: l,
                            data: p
                        });
                        continue
                    }! function(e, t, n, r, a) {
                        var o;
                        switch (n.fieldKind) {
                            case "scalar":
                                e.set(n, fd(t, n.scalar, n.utf8Validation));
                                break;
                            case "enum":
                                var i = fd(t, er.INT32);
                                if (n.enum.open) e.set(n, i);
                                else if (n.enum.values.some(function(e) {
                                        return e.number === i
                                    })) e.set(n, i);
                                else if (a.readUnknownFields) {
                                    var u = [];
                                    lV(i, u);
                                    var c = null != (o = e.getUnknown()) ? o : [];
                                    c.push({
                                        no: n.number,
                                        wireType: r,
                                        data: new Uint8Array(u)
                                    }), e.setUnknown(c)
                                }
                                break;
                            case "message":
                                e.set(n, ff(t, a, n, e.get(n)));
                                break;
                            case "list":
                                ! function(e, t, n, r) {
                                    var a, o = n.field();
                                    if ("message" === o.listKind) return n.add(ff(e, r, o));
                                    var i = null != (a = o.scalar) ? a : er.INT32;
                                    if (t != ew.LengthDelimited || i == er.STRING || i == er.BYTES) return n.add(fd(e, i, o.utf8Validation));
                                    for (var u = e.uint32() + e.pos; e.pos < u;) n.add(fd(e, i, o.utf8Validation))
                                }(t, r, e.get(n), a);
                                break;
                            case "map":
                                ! function(e, t, n) {
                                    for (var r, a, o = t.field(), i = e.uint32(), u = e.pos + i; e.pos < u;) switch (fl(e.tag(), 1)[0]) {
                                        case 1:
                                            r = fd(e, o.mapKey, o.utf8Validation);
                                            break;
                                        case 2:
                                            switch (o.mapKind) {
                                                case "scalar":
                                                    a = fd(e, o.scalar, o.utf8Validation);
                                                    break;
                                                case "enum":
                                                    a = e.int32();
                                                    break;
                                                case "message":
                                                    a = ff(e, n, o)
                                            }
                                    }
                                    if (void 0 === r && (r = lY(o.mapKey, !1)), void 0 === a) switch (o.mapKind) {
                                        case "scalar":
                                            a = lY(o.scalar, !1);
                                            break;
                                        case "enum":
                                            a = o.enum.values[0].number;
                                            break;
                                        case "message":
                                            a = s3(o.message, void 0, !1)
                                    }
                                    t.set(r, a)
                                }(t, e.get(n), a)
                        }
                    }(e, t, f, l, n)
                }
                if (r && (l != ew.EndGroup || c !== a)) throw Error("invalid end group tag");
                i.length > 0 && e.setUnknown(i), n.depth--
            }

            function ff(e, t, n, r) {
                var a = n.delimitedEncoding,
                    o = null != r ? r : s3(n.message, void 0, !1);
                return fs(o, e, t, a, a ? n.number : e.uint32()), o
            }

            function fd(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
                switch (t) {
                    case er.STRING:
                        return e.string(n);
                    case er.BOOL:
                        return e.bool();
                    case er.DOUBLE:
                        return e.double();
                    case er.FLOAT:
                        return e.float();
                    case er.INT32:
                        return e.int32();
                    case er.INT64:
                        return e.int64();
                    case er.UINT64:
                        return e.uint64();
                    case er.FIXED64:
                        return e.fixed64();
                    case er.BYTES:
                        return e.bytes();
                    case er.FIXED32:
                        return e.fixed32();
                    case er.SFIXED32:
                        return e.sfixed32();
                    case er.SFIXED64:
                        return e.sfixed64();
                    case er.SINT64:
                        return e.sint64();
                    case er.UINT32:
                        return e.uint32();
                    case er.SINT32:
                        return e.sint32()
                }
            }

            function fp(e, t) {
                var n, r, a, o, i = (n = so, r = function(e) {
                    var t = function() {
                            if (!en) {
                                en = [];
                                for (var e = (et || (et = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".split("")).slice(0, -2).concat("-", "_"), et), t = 0; t < e.length; t++) en[e[t].charCodeAt(0)] = t;
                                en[45] = e.indexOf("+"), en[95] = e.indexOf("/")
                            }
                            return en
                        }(),
                        n = 3 * e.length / 4;
                    "=" == e[e.length - 2] ? n -= 2 : "=" == e[e.length - 1] && (n -= 1);
                    for (var r, a = new Uint8Array(n), o = 0, i = 0, u = 0, c = 0; c < e.length; c++) {
                        if (void 0 === (r = t[e.charCodeAt(c)])) switch (e[c]) {
                            case "=":
                                i = 0;
                            case "\n":
                            case "\r":
                            case "	":
                            case " ":
                                continue;
                            default:
                                throw Error("invalid base64 string")
                        }
                        switch (i) {
                            case 0:
                                u = r, i = 1;
                                break;
                            case 1:
                                a[o++] = u << 2 | (48 & r) >> 4, u = r, i = 2;
                                break;
                            case 2:
                                a[o++] = (15 & u) << 4 | (60 & r) >> 2, u = r, i = 3;
                                break;
                            case 3:
                                a[o++] = (3 & u) << 6 | r, i = 0
                        }
                    }
                    if (1 == i) throw Error("invalid base64 string");
                    return a.subarray(0, o)
                }(e), fs(a = s3(n, void 0, !1), new sN(r), Object.assign(Object.assign({
                    readUnknownFields: !0,
                    recursionLimit: 100
                }, void 0), {
                    depth: 0
                }), !1, r.byteLength), a.message);
                return i.messageType.forEach(lJ), i.dependency = null != (o = null == t ? void 0 : t.map(function(e) {
                    return e.proto.name
                })) ? o : [], lq(i, function(e) {
                    return null == t ? void 0 : t.find(function(t) {
                        return t.proto.name === e
                    })
                }).getFile(i.name)
            }
            var fm = fp("Ch9ldmVudC9ldmVudF9maWVsZF9vcHRpb25zLnByb3RvEgVldmVudCIlCgtKc29uT3B0aW9ucxIWCg5wYXJhbWV0ZXJfbmFtZRgBIAEoCSI6CgxGcm9zdE9wdGlvbnMSFAoMaXNfdHRsX2ZpZWxkGAEgASgIEhQKDGlzX3RpbWVzdGFtcBgCIAEoCCIjCgtTaW5rT3B0aW9ucxIUCgxpc19rZXlfZmllbGQYASABKAgiKQoQRXZlbnRNZXRhT3B0aW9ucxIVCg1pc19ldmVudF90aW1lGAEgASgIIskFCg5BdWdtZW50T3B0aW9ucxIcChRkZXJpdmVfdXNlcl9rZXlfZnJvbRgBIAEoCRIhChhhZGRfYWNjb3VudF9jb3VudHJ5X2NvZGUY7wcgASgIEhgKD2FkZF9hZ2VfYnJhY2tldBjrByABKAgSIAoXYWRkX2FwcGxpY2FibGVfcG9saWNpZXMY8QcgASgIEh0KFGFkZF9hcHBsaWNhdGlvbl9uYW1lGPcHIAEoCBIcChNhZGRfYXV0aF9zZXNzaW9uX2lkGPgHIAEoCBIiChlhZGRfYXV0aGVudGljYXRlZF91c2VyX2lkGOwHIAEoCBIjChphZGRfYXV0aGVudGljYXRlZF91c2VyX2tleRj1ByABKAgSHwoWYWRkX2Jyb3dzZXJfdHJhY2tlcl9pZBjqByABKAgSJQocYWRkX2Vudmlyb25tZW50X2FiYnJldmlhdGlvbhjwByABKAgSGQoQYWRkX2V2ZW50X3RhcmdldBjRDyABKAgSFwoOYWRkX2V2ZW50X3R5cGUY0g8gASgIEh0KFGFkZF9odHRwX2ZpbmdlcnByaW50GPkHIAEoCBIaChFhZGRfcGxhdGZvcm1fdHlwZRjpByABKAgSHQoUYWRkX3BsYXRmb3JtX3R5cGVfaWQY/AcgASgIEhAKB2FkZF9yY2MY9gcgASgIEiEKGGFkZF9yZXF1ZXN0X2NvdW50cnlfY29kZRjuByABKAgSFwoOYWRkX3JlcXVlc3RfaXAY7QcgASgIEiEKGGFkZF90ZW5jZW50X2FjY2Vzc190b2tlbhjzByABKAgSHAoTYWRkX3RlbmNlbnRfb3Blbl9pZBjyByABKAgSHAoTYWRkX3Rsc19maW5nZXJwcmludBj6ByABKAgSFwoOYWRkX3VzZXJfYWdlbnQY9AcgASgIEhgKD2FkZF91c2VyX29yaWdpbhj7ByABKAgiSgoKUElJT3B0aW9ucxISCgppc191c2VyX2lkGAEgASgIEhMKC2lzX3VzZXJfa2V5GAMgASgIEhMKC3BvbGljeV90YWdzGAIgAygJIkYKFENvbXBhdGliaWxpdHlPcHRpb25zEhcKD2lzX2V2ZW50X3RhcmdldBgBIAEoCBIVCg1pc19ldmVudF90eXBlGAIgASgIIk4KGkZyb3N0RmVhdHVyZUxvZ2dpbmdPcHRpb25zEhcKD3JlZ2lzdGVyZWRfbmFtZRgBIAEoCRIXCg9mZWF0dXJlX3NlcnZpY2UYAiABKAkiSAoaRnJvc3RGZWF0dXJlU2VydmljZU9wdGlvbnMSFAoMZmVhdHVyZV92aWV3GAEgASgJEhQKDGZlYXR1cmVfbmFtZRgCIAEoCTpMCgRtZXRhEh0uZ29vZ2xlLnByb3RvYnVmLkZpZWxkT3B0aW9ucxjhpxIgASgLMhcuZXZlbnQuRXZlbnRNZXRhT3B0aW9uc1IEbWV0YTpQCgdhdWdtZW50Eh0uZ29vZ2xlLnByb3RvYnVmLkZpZWxkT3B0aW9ucxjipxIgASgLMhUuZXZlbnQuQXVnbWVudE9wdGlvbnNSB2F1Z21lbnQ6RAoDcGlpEh0uZ29vZ2xlLnByb3RvYnVmLkZpZWxkT3B0aW9ucxjjpxIgASgLMhEuZXZlbnQuUElJT3B0aW9uc1IDcGlpOkcKBGpzb24SHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGOSnEiABKAsyEi5ldmVudC5Kc29uT3B0aW9uc1IEanNvbjpHCgRzaW5rEh0uZ29vZ2xlLnByb3RvYnVmLkZpZWxkT3B0aW9ucxjlpxIgASgLMhIuZXZlbnQuU2lua09wdGlvbnNSBHNpbms6SgoFZnJvc3QSHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGOanEiABKAsyEy5ldmVudC5Gcm9zdE9wdGlvbnNSBWZyb3N0OmIKDWNvbXBhdGliaWxpdHkSHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGOenEiABKAsyGy5ldmVudC5Db21wYXRpYmlsaXR5T3B0aW9uc1INY29tcGF0aWJpbGl0eTp2ChVmcm9zdF9mZWF0dXJlX2xvZ2dpbmcSHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGOinEiABKAsyIS5ldmVudC5Gcm9zdEZlYXR1cmVMb2dnaW5nT3B0aW9uc1ITZnJvc3RGZWF0dXJlTG9nZ2luZzp2ChVmcm9zdF9mZWF0dXJlX3NlcnZpY2USHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGOmnEiABKAsyIS5ldmVudC5Gcm9zdEZlYXR1cmVTZXJ2aWNlT3B0aW9uc1ITZnJvc3RGZWF0dXJlU2VydmljZUI9Wi5naXRodWIucmJ4LmNvbS9yb2Jsb3gvc2NoZW1hLXByb3RvZ2VuL2dvL2V2ZW50ogIKTk9UX0lOX1VTRWIGcHJvdG8z", [sa]),
                fy = fp("ChtldmVudC91c2VyX2V2ZW50X2Jhc2UucHJvdG8SBWV2ZW50It4HCg1Vc2VyRXZlbnRCYXNlEiUKB3VzZXJfaWQYASABKANCD5K+kgED4D4Bmr6SAQIIAUgAiAEBEiYKCHVzZXJfa2V5GAIgASgJQg+SvpIBA6g/AZq+kgECGAFIAYgBARIgCgljbGllbnRfaXAYAyABKAlCCJK+kgED6D4BSAKIAQESIQoKdXNlcl9hZ2VudBgEIAEoCUIIkr6SAQOgPwFIA4gBARInChBwbGF0Zm9ybV90eXBlX2lkGAUgASgDQgiSvpIBA+A/AUgEiAEBEikKEmJyb3dzZXJfdHJhY2tlcl9pZBgGIAEoA0IIkr6SAQPQPgFIBYgBARIoChFpc190cnVzdGVkX3NvdXJjZRgHIAEoCEIIkr6SAQOwPwFIBogBARIiCgt1c2VyX29yaWdpbhgIIAEoCUIIkr6SAQPYPwFIB4gBARIdCgZ0YXJnZXQYCSABKAlCCJK+kgEDiH0BSAiIAQESIQoKZXZlbnRfdHlwZRgKIAEoCUIIkr6SAQOQfQFICYgBARIfCghhcHBfbmFtZRgLIAEoCUIIkr6SAQO4PwFICogBARIxChtpbmdlc3Rpb25fdGltZV9taWxsaXNlY29uZHMYDCABKANCB4q+kgECCAFIC4gBARJEChFldmVudF9zdHJlYW1fdGFncxgNIAMoCzIpLmV2ZW50LlVzZXJFdmVudEJhc2UuRXZlbnRTdHJlYW1UYWdzRW50cnkSJgoPYXV0aF9zZXNzaW9uX2lkGA4gASgJQgiSvpIBA8A/AUgMiAEBEicKEGh0dHBfZmluZ2VycHJpbnQYDyABKAlCCJK+kgEDyD8BSA2IAQESJgoPdGxzX2ZpbmdlcnByaW50GBAgASgJQgiSvpIBA9A/AUgOiAEBGjYKFEV2ZW50U3RyZWFtVGFnc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoCToCOAFCCgoIX3VzZXJfaWRCCwoJX3VzZXJfa2V5QgwKCl9jbGllbnRfaXBCDQoLX3VzZXJfYWdlbnRCEwoRX3BsYXRmb3JtX3R5cGVfaWRCFQoTX2Jyb3dzZXJfdHJhY2tlcl9pZEIUChJfaXNfdHJ1c3RlZF9zb3VyY2VCDgoMX3VzZXJfb3JpZ2luQgkKB190YXJnZXRCDQoLX2V2ZW50X3R5cGVCCwoJX2FwcF9uYW1lQh4KHF9pbmdlc3Rpb25fdGltZV9taWxsaXNlY29uZHNCEgoQX2F1dGhfc2Vzc2lvbl9pZEITChFfaHR0cF9maW5nZXJwcmludEISChBfdGxzX2ZpbmdlcnByaW50QjBaLmdpdGh1Yi5yYnguY29tL3JvYmxveC9zY2hlbWEtcHJvdG9nZW4vZ28vZXZlbnRiBnByb3RvMw", [fm]),
                fv = fp("CjFldmVudHN0cmVhbS9jb3JlL2hpdmVfdGFibGVfbWVzc2FnZV9vcHRpb25zLnByb3RvEhBldmVudHN0cmVhbS5jb3JlIuoBChBIaXZlVGFibGVPcHRpb25zEg4KBnNjaGVtYRgBIAEoCRIMCgRuYW1lGAIgASgJEjEKBHR5cGUYAyABKA4yHy5ldmVudHN0cmVhbS5jb3JlLkhpdmVUYWJsZVR5cGVCAhgBEhcKD3BhcnRpdGlvbl9vcmRlchgEIAEoCRIpCiFyZXRlbnRpb25fb2Zfd2FybV9zdG9yYWdlX2luX2RheXMYBSABKAMSKQohcmV0ZW50aW9uX29mX2NvbGRfc3RvcmFnZV9pbl9kYXlzGAYgASgDEhYKDmRhdGFfbGFrZV9uYW1lGAcgASgJIo4CCgxLYWZrYU9wdGlvbnMSFgoObnVtX3BhcnRpdGlvbnMYASABKAUSHgoWbnVtX3BhcnRpdGlvbnNfc3RhZ2luZxgCIAEoBRIcChRwYXJ0aXRpb25fa2V5X2ZpZWxkcxgDIAMoCRIfChdvbWl0X3NjaGVtYV9yZWdpc3RyeV9pZBgEIAEoCBIyCgtjb21wcmVzc2lvbhgFIAEoDjIdLmV2ZW50c3RyZWFtLmNvcmUuQ29tcHJlc3Npb24SFgoOcWFhc19uYW1lc3BhY2UYBiABKAkSHQoVYWxsb3dfdW5zYWZlX2RlbGl2ZXJ5GAcgASgIEhwKFGFsbG93ZWRfaW5fdHJheV9tb2RlGAggASgIInsKEURhdGFWb2x1bWVPcHRpb25zEiQKHGV4cGVjdGVkX3BlYWtfZXZlbnRzX3Blcl9zZWMYASABKAMSKwojZXhwZWN0ZWRfbWF4X3NpemVfb2ZfZXZlbnRfaW5fYnl0ZXMYAiABKAMSEwoLc2FtcGxlX3JhdGUYAyABKAIisQIKEERhdGFNb2RlbE9wdGlvbnMSLQoJZGF0YV90aWVyGAEgASgOMhouZXZlbnRzdHJlYW0uY29yZS5EYXRhVGllchISCgZvd25lcnMYAiADKAlCAhgBEhgKDG9uY2FsbF90ZWFtcxgDIAMoCUICGAESGgoScHJvZHVjZXJfYXBwX25hbWVzGAQgAygJEhoKEmNvbnN1bWVyX2FwcF9uYW1lcxgFIAMoCRIcChRhZ2dyZWdhdGVfZGltZW5zaW9ucxgGIAMoCRImCgVvd25lchgHIAEoCzIXLmV2ZW50c3RyZWFtLmNvcmUuT3duZXISFgoOc2xhY2tfY2hhbm5lbHMYCCADKAkSGgoScGFnZXJkdXR5X3NlcnZpY2VzGAkgAygJEg4KBmVtYWlscxgKIAMoCSKvBAoLRXZlbnRTY2hlbWESEwoLc2NoZW1hX25hbWUYASABKAkSMAoLZXZlbnRfdHlwZXMYAiADKAsyGy5ldmVudHN0cmVhbS5jb3JlLkV2ZW50VHlwZRIzCg1lYWFzX2VudGl0aWVzGAcgAygLMhwuZXZlbnRzdHJlYW0uY29yZS5FYWFzRW50aXR5EjgKD2RhdGFiYXNlX3RhYmxlcxgIIAMoCzIfLmV2ZW50c3RyZWFtLmNvcmUuRGF0YWJhc2VUYWJsZRJHChBzaW5rX2Rlc3RpbmF0aW9uGAMgASgOMi0uZXZlbnRzdHJlYW0uY29yZS5FdmVudFNjaGVtYS5TaW5rRGVzdGluYXRpb24SMQoJZGF0YV90aWVyGAQgASgOMhouZXZlbnRzdHJlYW0uY29yZS5EYXRhVGllckICGAESEQoFb3duZXIYBSABKAlCAhgBEhMKC2thZmthX3RvcGljGAYgASgJIsUBCg9TaW5rRGVzdGluYXRpb24SCAoETk9ORRAAEhUKDUZJUkVIT1NFX09OTFkQARoCCAESEgoKS0FGS0FfT05MWRACGgIIARIaChJGSVJFSE9TRV9BTkRfS0FGS0EQAxoCCAESIwobRklSRUhPU0VfQU5EX0tBRktBX0FORF9RQUFTEAQaAggBEhYKDktBRktBX0FORF9RQUFTEAUaAggBEg0KCVFBQVNfT05MWRAGEhUKEUZJUkVIT1NFX0FORF9RQUFTEAcisQIKCUV2ZW50VHlwZRIOCgZ0YXJnZXQYASABKAkSDAoEbmFtZRgCIAEoCRJLChBmaWVsZFJlZ2V4RmlsdGVyGAMgAygLMjEuZXZlbnRzdHJlYW0uY29yZS5FdmVudFR5cGUuRmllbGRSZWdleEZpbHRlckVudHJ5EkAKDWNvbXBhdGliaWxpdHkYBCABKA4yKS5ldmVudHN0cmVhbS5jb3JlLkV2ZW50VHlwZS5Db21wYXRpYmlsaXR5GjcKFUZpZWxkUmVnZXhGaWx0ZXJFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAk6AjgBIj4KDUNvbXBhdGliaWxpdHkSCwoHREVGQVVMVBAAEiAKHERVQUxfV1JJVEVfVE9fRVZFTlRTX1BBUlFVRVQQASI8CgpFYWFzRW50aXR5EhgKEGZ1bGxfZW50aXR5X25hbWUYASABKAkSFAoMZW50aXR5X2dyb3VwGAIgASgJIlEKDURhdGFiYXNlVGFibGUSFQoNZGF0YWJhc2VfbmFtZRgBIAEoCRISCgp0YWJsZV9uYW1lGAIgASgJEhUKDWRhdGFiYXNlX3R5cGUYAyABKAkiXAoFT3duZXISCwoDb3JnGAEgASgJEgwKBHRlYW0YAiABKAkSEAoDcG9kGAMgASgJSACIAQESEwoGcm9zX2lkGAQgASgDSAGIAQFCBgoEX3BvZEIJCgdfcm9zX2lkIqQBCgtBdXRoT3B0aW9ucxI+CgxhdXRoX21ldGhvZHMYASADKA4yKC5ldmVudHN0cmVhbS5jb3JlLkF1dGhPcHRpb25zLkF1dGhNZXRob2QiVQoKQXV0aE1ldGhvZBILCgdOT19BVVRIEAASDAoISU5URVJOQUwQARIHCgNSQ0MQAhIWChJBVVRIRU5USUNBVEVEX1VTRVIQAxILCgdBUElfS0VZEAQinAIKC0dkcHJPcHRpb25zEjkKA3BpaRgBIAEoDjInLmV2ZW50c3RyZWFtLmNvcmUuR2Rwck9wdGlvbnMuUGlpTWV0aG9kSACIAQESIQoUY2RjX2FyY2hpdmVyX2VuYWJsZWQYAiABKAhIAYgBASKNAQoJUGlpTWV0aG9kEhEKDVNFVF9VU0VSX0tFWVMQABIQCgxTRVRfVVNFUl9JRFMQARI4CjRCUkVBS19HRFBSX0NPTVBMSUFOQ0VfQU5EX1NFVF9CT1RIX1VTRVJfSURTX0FORF9LRVlTEAISIQodU0VUX05FSVRIRVJfVVNFUl9LRVlTX05PUl9JRFMQA0IGCgRfcGlpQhcKFV9jZGNfYXJjaGl2ZXJfZW5hYmxlZCpACg1IaXZlVGFibGVUeXBlEgsKB1VOS05PV04QABIOCgpXV1dfTEVHQUNZEAESEgoORVZFTlRTVFJFQU1fVjEQAiojCgtDb21wcmVzc2lvbhIICgROT05FEAASCgoGU05BUFBZEAEqVwoIRGF0YVRpZXISEAoMVElFUl9ERUZBVUxUEAASDQoJVElFUl9aRVJPEAESDAoIVElFUl9PTkUQAhIMCghUSUVSX1RXTxADEg4KClRJRVJfVEhSRUUQBDpbCgV0YWJsZRIfLmdvb2dsZS5wcm90b2J1Zi5NZXNzYWdlT3B0aW9ucxjJrxIgASgLMiIuZXZlbnRzdHJlYW0uY29yZS5IaXZlVGFibGVPcHRpb25zUgV0YWJsZTpXCgVrYWZrYRIfLmdvb2dsZS5wcm90b2J1Zi5NZXNzYWdlT3B0aW9ucxjKrxIgASgLMh4uZXZlbnRzdHJlYW0uY29yZS5LYWZrYU9wdGlvbnNSBWthZmthOmcKC2RhdGFfdm9sdW1lEh8uZ29vZ2xlLnByb3RvYnVmLk1lc3NhZ2VPcHRpb25zGMuvEiABKAsyIy5ldmVudHN0cmVhbS5jb3JlLkRhdGFWb2x1bWVPcHRpb25zUgpkYXRhVm9sdW1lOmQKCmRhdGFfbW9kZWwSHy5nb29nbGUucHJvdG9idWYuTWVzc2FnZU9wdGlvbnMYzK8SIAEoCzIiLmV2ZW50c3RyZWFtLmNvcmUuRGF0YU1vZGVsT3B0aW9uc1IJZGF0YU1vZGVsOmcKDnNjaGVtYV9tYXBwaW5nEh8uZ29vZ2xlLnByb3RvYnVmLk1lc3NhZ2VPcHRpb25zGM2vEiABKAsyHS5ldmVudHN0cmVhbS5jb3JlLkV2ZW50U2NoZW1hUg1zY2hlbWFNYXBwaW5nOlQKBGF1dGgSHy5nb29nbGUucHJvdG9idWYuTWVzc2FnZU9wdGlvbnMYzq8SIAEoCzIdLmV2ZW50c3RyZWFtLmNvcmUuQXV0aE9wdGlvbnNSBGF1dGg6VAoEZ2RwchIfLmdvb2dsZS5wcm90b2J1Zi5NZXNzYWdlT3B0aW9ucxjPrxIgASgLMh0uZXZlbnRzdHJlYW0uY29yZS5HZHByT3B0aW9uc1IEZ2RwckI7WjlnaXRodWIucmJ4LmNvbS9yb2Jsb3gvc2NoZW1hLXByb3RvZ2VuL2dvL2V2ZW50c3RyZWFtL2NvcmViBnByb3RvMw", [sa]),
                fb = sr(fp("CiBldmVudHN0cmVhbS93ZWIvd2ViX3ZpdGFscy5wcm90bxIXZXZlbnRzdHJlYW0uZXZlbnRpbmdlc3Qi4gQKCVdlYlZpdGFscxInCg9sb2NhbF90aW1lc3RhbXAYASABKAlCCaK+kgEECgJsdEgAiAEBEi0KD3VzZXJfZXZlbnRfYmFzZRgCIAEoCzIULmV2ZW50LlVzZXJFdmVudEJhc2USHgoEcGFnZRgDIAEoCUILor6SAQYKBHBhZ2VIAYgBARIcCgN1cmwYBCABKAlCCqK+kgEFCgN1cmxIAogBARIfCgZsY3BfbXMYBSABKAFCCqK+kgEFCgNsY3BIA4gBARIfCgZmY3BfbXMYBiABKAFCCqK+kgEFCgNmY3BIBIgBARIhCgd0dGZiX21zGAcgASgBQguivpIBBgoEdHRmYkgFiAEBEhwKA2NscxgIIAEoAUIKor6SAQUKA2Nsc0gGiAEBEh8KBmlucF9tcxgJIAEoAUIKor6SAQUKA2lucEgHiAEBOsAByvySASMKDGluZ2VzdF9wcm90bxIKd2ViX3ZpdGFscyIHZHMsaG91ctr8kgEGCIgnEIAE4vySAUYiA3d3dzopCgRVc2VyEg1Db25zdW1lciBBcHBzGg9XZWIgYW5kIEJhY2tlbmQguRNCCyNjcC1iYWNrZW5kSgdQSDNQS01Y6vySATYKIGV2ZW50c3RyZWFtL3dlYi93ZWJfdml0YWxzLnByb3RvEhAKA3d3dxIJd2ViVml0YWxzGAf6/JIBAggBQhIKEF9sb2NhbF90aW1lc3RhbXBCBwoFX3BhZ2VCBgoEX3VybEIJCgdfbGNwX21zQgkKB19mY3BfbXNCCgoIX3R0ZmJfbXNCBgoEX2Nsc0IJCgdfaW5wX21zQjpaOGdpdGh1Yi5yYnguY29tL3JvYmxveC9zY2hlbWEtcHJvdG9nZW4vZ28vZXZlbnRzdHJlYW0vd2ViYgZwcm90bzM", [fm, fy, fv]), 0);

            function fh(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var fg = {
                writeUnknownFields: !0
            };

            function fS(e, t, n) {
                return f_(new sT, n ? Object.assign(Object.assign({}, fg), n) : fg, s3(e, t)).finish()
            }

            function f_(e, t, n) {
                var r = !0,
                    a = !1,
                    o = void 0;
                try {
                    for (var i, u, c = n.sortedFields[Symbol.iterator](); !(r = (u = c.next()).done); r = !0) {
                        var l = u.value;
                        if (!n.isSet(l)) {
                            if (3 == l.presence) throw Error("cannot encode ".concat(l, " to binary: required field not set"));
                            continue
                        }! function(e, t, n, r) {
                            var a;
                            switch (r.fieldKind) {
                                case "scalar":
                                case "enum":
                                    fE(e, n.desc.typeName, r.name, null != (a = r.scalar) ? a : er.INT32, r.number, n.get(r));
                                    break;
                                case "list":
                                    ! function(e, t, n, r) {
                                        if ("message" == n.listKind) {
                                            var a = !0,
                                                o = !1,
                                                i = void 0;
                                            try {
                                                for (var u, c, l = r[Symbol.iterator](); !(a = (c = l.next()).done); a = !0) {
                                                    var s = c.value;
                                                    fO(e, t, n, s)
                                                }
                                            } catch (e) {
                                                o = !0, i = e
                                            } finally {
                                                try {
                                                    a || null == l.return || l.return()
                                                } finally {
                                                    if (o) throw i
                                                }
                                            }
                                            return
                                        }
                                        var f = null != (u = n.scalar) ? u : er.INT32;
                                        if (n.packed) {
                                            if (!r.size) return;
                                            e.tag(n.number, ew.LengthDelimited).fork();
                                            var d = !0,
                                                p = !1,
                                                m = void 0;
                                            try {
                                                for (var y, v = r[Symbol.iterator](); !(d = (y = v.next()).done); d = !0) {
                                                    var b = y.value;
                                                    fw(e, n.parent.typeName, n.name, f, b)
                                                }
                                            } catch (e) {
                                                p = !0, m = e
                                            } finally {
                                                try {
                                                    d || null == v.return || v.return()
                                                } finally {
                                                    if (p) throw m
                                                }
                                            }
                                            e.join();
                                            return
                                        }
                                        var h = !0,
                                            g = !1,
                                            S = void 0;
                                        try {
                                            for (var _, E = r[Symbol.iterator](); !(h = (_ = E.next()).done); h = !0) {
                                                var O = _.value;
                                                fE(e, n.parent.typeName, n.name, f, n.number, O)
                                            }
                                        } catch (e) {
                                            g = !0, S = e
                                        } finally {
                                            try {
                                                h || null == E.return || E.return()
                                            } finally {
                                                if (g) throw S
                                            }
                                        }
                                    }(e, t, r, n.get(r));
                                    break;
                                case "message":
                                    fO(e, t, r, n.get(r));
                                    break;
                                case "map":
                                    var o = !0,
                                        i = !1,
                                        u = void 0;
                                    try {
                                        for (var c, l = n.get(r)[Symbol.iterator](); !(o = (c = l.next()).done); o = !0) {
                                            var s, f = (s = c.value, function(e) {
                                                    if (Array.isArray(e)) return e
                                                }(s) || function(e, t) {
                                                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                                    if (null != a) {
                                                        var o = [],
                                                            i = !0,
                                                            u = !1;
                                                        try {
                                                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                                                        } catch (e) {
                                                            u = !0, r = e
                                                        } finally {
                                                            try {
                                                                i || null == a.return || a.return()
                                                            } finally {
                                                                if (u) throw r
                                                            }
                                                        }
                                                        return o
                                                    }
                                                }(s, 2) || function(e, t) {
                                                    if (e) {
                                                        if ("string" == typeof e) return fh(e, 2);
                                                        var n = Object.prototype.toString.call(e).slice(8, -1);
                                                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return fh(e, t)
                                                    }
                                                }(s, 2) || function() {
                                                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                                }()),
                                                d = f[0],
                                                p = f[1];
                                            ! function(e, t, n, r, a) {
                                                var o;
                                                switch (e.tag(n.number, ew.LengthDelimited).fork(), fE(e, n.parent.typeName, n.name, n.mapKey, 1, r), n.mapKind) {
                                                    case "scalar":
                                                    case "enum":
                                                        fE(e, n.parent.typeName, n.name, null != (o = n.scalar) ? o : er.INT32, 2, a);
                                                        break;
                                                    case "message":
                                                        f_(e.tag(2, ew.LengthDelimited).fork(), t, a).join()
                                                }
                                                e.join()
                                            }(e, t, r, d, p)
                                        }
                                    } catch (e) {
                                        i = !0, u = e
                                    } finally {
                                        try {
                                            o || null == l.return || l.return()
                                        } finally {
                                            if (i) throw u
                                        }
                                    }
                            }
                        }(e, t, n, l)
                    }
                } catch (e) {
                    a = !0, o = e
                } finally {
                    try {
                        r || null == c.return || c.return()
                    } finally {
                        if (a) throw o
                    }
                }
                if (t.writeUnknownFields) {
                    var s = !0,
                        f = !1,
                        d = void 0;
                    try {
                        for (var p, m = (null != (i = n.getUnknown()) ? i : [])[Symbol.iterator](); !(s = (p = m.next()).done); s = !0) {
                            var y = p.value,
                                v = y.no,
                                b = y.wireType,
                                h = y.data;
                            e.tag(v, b).raw(h)
                        }
                    } catch (e) {
                        f = !0, d = e
                    } finally {
                        try {
                            s || null == m.return || m.return()
                        } finally {
                            if (f) throw d
                        }
                    }
                }
                return e
            }

            function fE(e, t, n, r, a, o) {
                fw(e.tag(a, function(e) {
                    switch (e) {
                        case er.BYTES:
                        case er.STRING:
                            return ew.LengthDelimited;
                        case er.DOUBLE:
                        case er.FIXED64:
                        case er.SFIXED64:
                            return ew.Bit64;
                        case er.FIXED32:
                        case er.SFIXED32:
                        case er.FLOAT:
                            return ew.Bit32;
                        default:
                            return ew.Varint
                    }
                }(r)), t, n, r, o)
            }

            function fO(e, t, n, r) {
                n.delimitedEncoding ? f_(e.tag(n.number, ew.StartGroup), t, r).tag(n.number, ew.EndGroup) : f_(e.tag(n.number, ew.LengthDelimited).fork(), t, r).join()
            }

            function fw(e, t, n, r, a) {
                try {
                    switch (r) {
                        case er.STRING:
                            e.string(a);
                            break;
                        case er.BOOL:
                            e.bool(a);
                            break;
                        case er.DOUBLE:
                            e.double(a);
                            break;
                        case er.FLOAT:
                            e.float(a);
                            break;
                        case er.INT32:
                            e.int32(a);
                            break;
                        case er.INT64:
                            e.int64(a);
                            break;
                        case er.UINT64:
                            e.uint64(a);
                            break;
                        case er.FIXED64:
                            e.fixed64(a);
                            break;
                        case er.BYTES:
                            e.bytes(a);
                            break;
                        case er.FIXED32:
                            e.fixed32(a);
                            break;
                        case er.SFIXED32:
                            e.sfixed32(a);
                            break;
                        case er.SFIXED64:
                            e.sfixed64(a);
                            break;
                        case er.SINT64:
                            e.sint64(a);
                            break;
                        case er.UINT32:
                            e.uint32(a);
                            break;
                        case er.SINT32:
                            e.sint32(a)
                    }
                } catch (e) {
                    var o;
                    if (null != (o = Error) && "undefined" != typeof Symbol && o[Symbol.hasInstance] ? !!o[Symbol.hasInstance](e) : e instanceof o) throw Error("cannot encode field ".concat(t, ".").concat(n, " to binary: ").concat(e.message));
                    throw e
                }
            }
            var fI = Uint8Array,
                fA = Uint16Array,
                fT = Int32Array,
                fN = new fI([0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 0, 0, 0, 0]),
                fk = new fI([0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 0, 0]),
                fj = new fI([16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15]),
                fx = function(e, t) {
                    for (var n = new fA(31), r = 0; r < 31; ++r) n[r] = t += 1 << e[r - 1];
                    for (var a = new fT(n[30]), r = 1; r < 30; ++r)
                        for (var o = n[r]; o < n[r + 1]; ++o) a[o] = o - n[r] << 5 | r;
                    return {
                        b: n,
                        r: a
                    }
                },
                fR = fx(fN, 2),
                fP = fR.b,
                fV = fR.r;
            fP[28] = 258, fV[258] = 28;
            for (var fZ = fx(fk, 0), fC = (fZ.b, fZ.r), fD = new fA(32768), fF = 0; fF < 32768; ++fF) {
                var fL = (43690 & fF) >> 1 | (21845 & fF) << 1;
                fL = (61680 & (fL = (52428 & fL) >> 2 | (13107 & fL) << 2)) >> 4 | (3855 & fL) << 4, fD[fF] = ((65280 & fL) >> 8 | (255 & fL) << 8) >> 1
            }
            for (var fX = function(e, t, n) {
                    for (var r, a = e.length, o = 0, i = new fA(t); o < a; ++o) e[o] && ++i[e[o] - 1];
                    var u = new fA(t);
                    for (o = 1; o < t; ++o) u[o] = u[o - 1] + i[o - 1] << 1;
                    if (n) {
                        r = new fA(1 << t);
                        var c = 15 - t;
                        for (o = 0; o < a; ++o)
                            if (e[o])
                                for (var l = o << 4 | e[o], s = t - e[o], f = u[e[o] - 1]++ << s, d = f | (1 << s) - 1; f <= d; ++f) r[fD[f] >> c] = l
                    } else
                        for (o = 0, r = new fA(a); o < a; ++o) e[o] && (r[o] = fD[u[e[o] - 1]++] >> 15 - e[o]);
                    return r
                }, fY = new fI(288), fF = 0; fF < 144; ++fF) fY[fF] = 8;
            for (var fF = 144; fF < 256; ++fF) fY[fF] = 9;
            for (var fF = 256; fF < 280; ++fF) fY[fF] = 7;
            for (var fF = 280; fF < 288; ++fF) fY[fF] = 8;
            for (var fW = new fI(32), fF = 0; fF < 32; ++fF) fW[fF] = 5;
            var fB = fX(fY, 9, 0),
                fG = fX(fW, 5, 0),
                fU = function(e) {
                    return (e + 7) / 8 | 0
                },
                fM = function(e, t, n) {
                    n <<= 7 & t;
                    var r = t / 8 | 0;
                    e[r] |= n, e[r + 1] |= n >> 8
                },
                fJ = function(e, t, n) {
                    n <<= 7 & t;
                    var r = t / 8 | 0;
                    e[r] |= n, e[r + 1] |= n >> 8, e[r + 2] |= n >> 16
                },
                fK = function(e, t) {
                    for (var n = [], r = 0; r < e.length; ++r) e[r] && n.push({
                        s: r,
                        f: e[r]
                    });
                    var a = n.length,
                        o = n.slice();
                    if (!a) return {
                        t: f1,
                        l: 0
                    };
                    if (1 == a) {
                        var i = new fI(n[0].s + 1);
                        return i[n[0].s] = 1, {
                            t: i,
                            l: 1
                        }
                    }
                    n.sort(function(e, t) {
                        return e.f - t.f
                    }), n.push({
                        s: -1,
                        f: 25001
                    });
                    var u = n[0],
                        c = n[1],
                        l = 0,
                        s = 1,
                        f = 2;
                    for (n[0] = {
                            s: -1,
                            f: u.f + c.f,
                            l: u,
                            r: c
                        }; s != a - 1;) u = n[n[l].f < n[f].f ? l++ : f++], c = n[l != s && n[l].f < n[f].f ? l++ : f++], n[s++] = {
                        s: -1,
                        f: u.f + c.f,
                        l: u,
                        r: c
                    };
                    for (var d = o[0].s, r = 1; r < a; ++r) o[r].s > d && (d = o[r].s);
                    var p = new fA(d + 1),
                        m = fz(n[s - 1], p, 0);
                    if (m > t) {
                        var r = 0,
                            y = 0,
                            v = m - t,
                            b = 1 << v;
                        for (o.sort(function(e, t) {
                                return p[t.s] - p[e.s] || e.f - t.f
                            }); r < a; ++r) {
                            var h = o[r].s;
                            if (p[h] > t) y += b - (1 << m - p[h]), p[h] = t;
                            else break
                        }
                        for (y >>= v; y > 0;) {
                            var g = o[r].s;
                            p[g] < t ? y -= 1 << t - p[g]++ - 1 : ++r
                        }
                        for (; r >= 0 && y; --r) {
                            var S = o[r].s;
                            p[S] == t && (--p[S], ++y)
                        }
                        m = t
                    }
                    return {
                        t: new fI(p),
                        l: m
                    }
                },
                fz = function(e, t, n) {
                    return -1 == e.s ? Math.max(fz(e.l, t, n + 1), fz(e.r, t, n + 1)) : t[e.s] = n
                },
                fH = function(e) {
                    for (var t = e.length; t && !e[--t];);
                    for (var n = new fA(++t), r = 0, a = e[0], o = 1, i = function(e) {
                            n[r++] = e
                        }, u = 1; u <= t; ++u)
                        if (e[u] == a && u != t) ++o;
                        else {
                            if (!a && o > 2) {
                                for (; o > 138; o -= 138) i(32754);
                                o > 2 && (i(o > 10 ? o - 11 << 5 | 28690 : o - 3 << 5 | 12305), o = 0)
                            } else if (o > 3) {
                                for (i(a), --o; o > 6; o -= 6) i(8304);
                                o > 2 && (i(o - 3 << 5 | 8208), o = 0)
                            }
                            for (; o--;) i(a);
                            o = 1, a = e[u]
                        } return {
                        c: n.subarray(0, r),
                        n: t
                    }
                },
                fQ = function(e, t) {
                    for (var n = 0, r = 0; r < t.length; ++r) n += e[r] * t[r];
                    return n
                },
                fq = function(e, t, n) {
                    var r = n.length,
                        a = fU(t + 2);
                    e[a] = 255 & r, e[a + 1] = r >> 8, e[a + 2] = 255 ^ e[a], e[a + 3] = 255 ^ e[a + 1];
                    for (var o = 0; o < r; ++o) e[a + o + 4] = n[o];
                    return (a + 4 + r) * 8
                },
                f$ = function(e, t, n, r, a, o, i, u, c, l, s) {
                    fM(t, s++, n), ++a[256];
                    for (var f, d, p, m, y = fK(a, 15), v = y.t, b = y.l, h = fK(o, 15), g = h.t, S = h.l, _ = fH(v), E = _.c, O = _.n, w = fH(g), I = w.c, A = w.n, T = new fA(19), N = 0; N < E.length; ++N) ++T[31 & E[N]];
                    for (var N = 0; N < I.length; ++N) ++T[31 & I[N]];
                    for (var k = fK(T, 7), j = k.t, x = k.l, R = 19; R > 4 && !j[fj[R - 1]]; --R);
                    var P = l + 5 << 3,
                        V = fQ(a, fY) + fQ(o, fW) + i,
                        Z = fQ(a, v) + fQ(o, g) + i + 14 + 3 * R + fQ(T, j) + 2 * T[16] + 3 * T[17] + 7 * T[18];
                    if (c >= 0 && P <= V && P <= Z) return fq(t, s, e.subarray(c, c + l));
                    if (fM(t, s, 1 + (Z < V)), s += 2, Z < V) {
                        f = fX(v, b, 0), d = v, p = fX(g, S, 0), m = g;
                        var C = fX(j, x, 0);
                        fM(t, s, O - 257), fM(t, s + 5, A - 1), fM(t, s + 10, R - 4), s += 14;
                        for (var N = 0; N < R; ++N) fM(t, s + 3 * N, j[fj[N]]);
                        s += 3 * R;
                        for (var D = [E, I], F = 0; F < 2; ++F)
                            for (var L = D[F], N = 0; N < L.length; ++N) {
                                var X = 31 & L[N];
                                fM(t, s, C[X]), s += j[X], X > 15 && (fM(t, s, L[N] >> 5 & 127), s += L[N] >> 12)
                            }
                    } else f = fB, d = fY, p = fG, m = fW;
                    for (var N = 0; N < u; ++N) {
                        var Y = r[N];
                        if (Y > 255) {
                            var X = Y >> 18 & 31;
                            fJ(t, s, f[X + 257]), s += d[X + 257], X > 7 && (fM(t, s, Y >> 23 & 31), s += fN[X]);
                            var W = 31 & Y;
                            fJ(t, s, p[W]), s += m[W], W > 3 && (fJ(t, s, Y >> 5 & 8191), s += fk[W])
                        } else fJ(t, s, f[Y]), s += d[Y]
                    }
                    return fJ(t, s, f[256]), s + d[256]
                },
                f0 = new fT([65540, 131080, 131088, 131104, 262176, 1048704, 1048832, 2114560, 2117632]),
                f1 = new fI(0),
                f2 = function(e, t, n, r, a, o) {
                    var i, u, c = o.z || e.length,
                        l = new fI(r + c + 5 * (1 + Math.ceil(c / 7e3)) + a),
                        s = l.subarray(r, l.length - a),
                        f = o.l,
                        d = 7 & (o.r || 0);
                    if (t) {
                        d && (s[0] = o.r >> 3);
                        for (var p = f0[t - 1], m = p >> 13, y = 8191 & p, v = (1 << n) - 1, b = o.p || new fA(32768), h = o.h || new fA(v + 1), g = Math.ceil(n / 3), S = 2 * g, _ = function(t) {
                                return (e[t] ^ e[t + 1] << g ^ e[t + 2] << S) & v
                            }, E = new fT(25e3), O = new fA(288), w = new fA(32), I = 0, A = 0, T = o.i || 0, N = 0, k = o.w || 0, j = 0; T + 2 < c; ++T) {
                            var x = _(T),
                                R = 32767 & T,
                                P = h[x];
                            if (b[R] = P, h[x] = R, k <= T) {
                                var V = c - T;
                                if ((I > 7e3 || N > 24576) && (V > 423 || !f)) {
                                    d = f$(e, s, 0, E, O, w, A, N, j, T - j, d), N = I = A = 0, j = T;
                                    for (var Z = 0; Z < 286; ++Z) O[Z] = 0;
                                    for (var Z = 0; Z < 30; ++Z) w[Z] = 0
                                }
                                var C = 2,
                                    D = 0,
                                    F = y,
                                    L = R - P & 32767;
                                if (V > 2 && x == _(T - L))
                                    for (var X = Math.min(m, V) - 1, Y = Math.min(32767, T), W = Math.min(258, V); L <= Y && --F && R != P;) {
                                        if (e[T + C] == e[T + C - L]) {
                                            for (var B = 0; B < W && e[T + B] == e[T + B - L]; ++B);
                                            if (B > C) {
                                                if (C = B, D = L, B > X) break;
                                                for (var G = Math.min(L, B - 2), U = 0, Z = 0; Z < G; ++Z) {
                                                    var M = T - L + Z & 32767,
                                                        J = b[M],
                                                        K = M - J & 32767;
                                                    K > U && (U = K, P = M)
                                                }
                                            }
                                        }
                                        P = b[R = P], L += R - P & 32767
                                    }
                                if (D) {
                                    E[N++] = 0x10000000 | fV[C] << 18 | fC[D];
                                    var z = 31 & fV[C],
                                        H = 31 & fC[D];
                                    A += fN[z] + fk[H], ++O[257 + z], ++w[H], k = T + C, ++I
                                } else E[N++] = e[T], ++O[e[T]]
                            }
                        }
                        for (T = Math.max(T, k); T < c; ++T) E[N++] = e[T], ++O[e[T]];
                        d = f$(e, s, f, E, O, w, A, N, j, T - j, d), f || (o.r = 7 & d | s[d / 8 | 0] << 3, d -= 7, o.h = h, o.p = b, o.i = T, o.w = k)
                    } else {
                        for (var T = o.w || 0; T < c + f; T += 65535) {
                            var Q = T + 65535;
                            Q >= c && (s[d / 8 | 0] = f, Q = c), d = fq(s, d + 1, e.subarray(T, Q))
                        }
                        o.i = c
                    }
                    return i = 0, u = r + fU(d) + a, (null == i || i < 0) && (i = 0), (null == u || u > l.length) && (u = l.length), new fI(l.subarray(i, u))
                },
                f3 = function() {
                    for (var e = new Int32Array(256), t = 0; t < 256; ++t) {
                        for (var n = t, r = 9; --r;) n = (1 & n && -0x12477ce0) ^ n >>> 1;
                        e[t] = n
                    }
                    return e
                }(),
                f5 = function() {
                    var e = -1;
                    return {
                        p: function(t) {
                            for (var n = e, r = 0; r < t.length; ++r) n = f3[255 & n ^ t[r]] ^ n >>> 8;
                            e = n
                        },
                        d: function() {
                            return ~e
                        }
                    }
                },
                f9 = function(e, t, n, r, a) {
                    if (!a && (a = {
                            l: 1
                        }, t.dictionary)) {
                        var o = t.dictionary.subarray(-32768),
                            i = new fI(o.length + e.length);
                        i.set(o), i.set(e, o.length), e = i, a.w = o.length
                    }
                    return f2(e, null == t.level ? 6 : t.level, null == t.mem ? a.l ? Math.ceil(1.5 * Math.max(8, Math.min(13, Math.log(e.length)))) : 20 : 12 + t.mem, n, r, a)
                },
                f4 = function(e, t, n) {
                    for (; n; ++t) e[t] = n, n >>>= 8
                },
                f8 = function(e, t) {
                    var n = t.filename;
                    if (e[0] = 31, e[1] = 139, e[2] = 8, e[8] = t.level < 2 ? 4 : 2 * (9 == t.level), e[9] = 3, 0 != t.mtime && f4(e, 4, Math.floor(new Date(t.mtime || Date.now()) / 1e3)), n) {
                        e[3] = 8;
                        for (var r = 0; r <= n.length; ++r) e[r + 10] = n.charCodeAt(r)
                    }
                };

            function f6(e, t) {
                t || (t = {});
                var n, r = f5(),
                    a = e.length;
                r.p(e);
                var o = f9(e, t, 10 + ((n = t).filename ? n.filename.length + 1 : 0), 8),
                    i = o.length;
                return f8(o, t), f4(o, i - 8, r.d()), f4(o, i - 4, a), o
            }
            var f7 = "undefined" != typeof TextDecoder && new TextDecoder;
            try {
                f7.decode(f1, {
                    stream: !0
                })
            } catch (e) {}
            "function" == typeof queueMicrotask && queueMicrotask;
            var de = fp("ChVnb29nbGUvYXBpL2h0dHAucHJvdG8SCmdvb2dsZS5hcGkiVAoESHR0cBIjCgVydWxlcxgBIAMoCzIULmdvb2dsZS5hcGkuSHR0cFJ1bGUSJwofZnVsbHlfZGVjb2RlX3Jlc2VydmVkX2V4cGFuc2lvbhgCIAEoCCKBAgoISHR0cFJ1bGUSEAoIc2VsZWN0b3IYASABKAkSDQoDZ2V0GAIgASgJSAASDQoDcHV0GAMgASgJSAASDgoEcG9zdBgEIAEoCUgAEhAKBmRlbGV0ZRgFIAEoCUgAEg8KBXBhdGNoGAYgASgJSAASLwoGY3VzdG9tGAggASgLMh0uZ29vZ2xlLmFwaS5DdXN0b21IdHRwUGF0dGVybkgAEgwKBGJvZHkYByABKAkSFQoNcmVzcG9uc2VfYm9keRgMIAEoCRIxChNhZGRpdGlvbmFsX2JpbmRpbmdzGAsgAygLMhQuZ29vZ2xlLmFwaS5IdHRwUnVsZUIJCgdwYXR0ZXJuIi8KEUN1c3RvbUh0dHBQYXR0ZXJuEgwKBGtpbmQYASABKAkSDAoEcGF0aBgCIAEoCUJqCg5jb20uZ29vZ2xlLmFwaUIJSHR0cFByb3RvUAFaQWdvb2dsZS5nb2xhbmcub3JnL2dlbnByb3RvL2dvb2dsZWFwaXMvYXBpL2Fubm90YXRpb25zO2Fubm90YXRpb25z+AEBogIER0FQSWIGcHJvdG8z"),
                dt = fp("Chxnb29nbGUvYXBpL2Fubm90YXRpb25zLnByb3RvEgpnb29nbGUuYXBpOksKBGh0dHASHi5nb29nbGUucHJvdG9idWYuTWV0aG9kT3B0aW9ucxiwyrwiIAEoCzIULmdvb2dsZS5hcGkuSHR0cFJ1bGVSBGh0dHBCbgoOY29tLmdvb2dsZS5hcGlCEEFubm90YXRpb25zUHJvdG9QAVpBZ29vZ2xlLmdvbGFuZy5vcmcvZ2VucHJvdG8vZ29vZ2xlYXBpcy9hcGkvYW5ub3RhdGlvbnM7YW5ub3RhdGlvbnOiAgRHQVBJYgZwcm90bzM", [de, sa]),
                dn = fp("Cllyb2Jsb3gvZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QvZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QvdjEvZXhwZXJpZW5jZV9zaWduYWxzX2luZ2VzdC5wcm90bxI5cm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxIoIBCgVFdmVudBIOCgZzb3VyY2UYASABKAkSDwoHcGF5bG9hZBgCIAEoDBJYCgpyb2Jsb3hfY3R4GAMgASgLMkQucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlJvYmxveEN0eCKfAQoJUm9ibG94Q3R4EmIKB2hlYWRlcnMYASADKAsyUS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuUm9ibG94Q3R4LkhlYWRlcnNFbnRyeRouCgxIZWFkZXJzRW50cnkSCwoDa2V5GAEgASgJEg0KBXZhbHVlGAIgASgJOgI4ASJLCgZTb3VyY2USDAoEbmFtZRgBIAEoCRITCgtrYWZrYV90b3BpYxgCIAEoCRIPCgdibG9ja2VkGAMgASgIEg0KBW5vdGVzGAQgASgJIl0KB1NvdXJjZXMSUgoHc291cmNlcxgBIAMoCzJBLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5Tb3VyY2UiGwoIUmVzcG9uc2USDwoHbWVzc2FnZRgCIAEoCULPAQo9Y29tLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MUIcRXhwZXJpZW5jZVNpZ25hbHNJbmdlc3RQcm90b1ABWjJleHBlcmllbmNlc2lnbmFsc2luZ2VzdC9leHBlcmllbmNlc2lnbmFsc2luZ2VzdC92MaoCOVJvYmxveC5FeHBlcmllbmNlU2lnbmFsc0luZ2VzdC5FeHBlcmllbmNlU2lnbmFsc0luZ2VzdC5WMWIGcHJvdG8z"),
                dr = fp("Ch1yb2Jsb3gvcHJvdG9idWYvb3B0aW9ucy5wcm90bxIPcm9ibG94LnByb3RvYnVmIoQBChZTZXJ2aWNlQ29udHJhY3RPcHRpb25zEg8KB3B1Ymxpc2gYASABKAgSIwobY3NoYXJwX2dlbmVyYXRlX3NlcnZlcl9zdHViGAIgASgIEjQKLGludDY0X2lkX3dyYXBwZXJfZW50aXR5X2lkX2NzaGFycF9jb252ZXJzaW9uGAMgASgJOnQKEXNlcnZpY2VfY29udHJhY3RzEhwuZ29vZ2xlLnByb3RvYnVmLkZpbGVPcHRpb25zGNCGAyABKAsyJy5yb2Jsb3gucHJvdG9idWYuU2VydmljZUNvbnRyYWN0T3B0aW9uc1IQc2VydmljZUNvbnRyYWN0czo9CglzZW5zaXRpdmUSHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGNGGAyABKAhSCXNlbnNpdGl2ZTpACglzcWxfdmFsdWUSIS5nb29nbGUucHJvdG9idWYuRW51bVZhbHVlT3B0aW9ucxji1AMgASgJUghzcWxWYWx1ZUIRWg9yb2Jsb3gvcHJvdG9idWZiBnByb3RvMw", [sa]),
                da = fp("Cl1yb2Jsb3gvZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QvZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QvdjEvZXhwZXJpZW5jZV9zaWduYWxzX2luZ2VzdF9hcGkucHJvdG8SOXJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MSJkChBTZW5kQmF0Y2hSZXF1ZXN0ElAKBmV2ZW50cxgBIAMoCzJALnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5FdmVudCITChFTZW5kQmF0Y2hSZXNwb25zZSKZAgoZU2VuZE9wdGltaXplZEJhdGNoUmVxdWVzdBJyCgtzdWJfYmF0Y2hlcxgBIAMoCzJdLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5TZW5kT3B0aW1pemVkQmF0Y2hSZXF1ZXN0LlN1YkJhdGNoGocBCghTdWJCYXRjaBIOCgZzb3VyY2UYASABKAkSEAoIcGF5bG9hZHMYAiADKAwSWQoLcm9ibG94X2N0eHMYAyADKAsyRC5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuUm9ibG94Q3R4IhwKGlNlbmRPcHRpbWl6ZWRCYXRjaFJlc3BvbnNlIpYBChdTZW5kVW5pZm9ybUJhdGNoUmVxdWVzdBIOCgZzb3VyY2UYASABKAkSEAoIcGF5bG9hZHMYAiADKAwSWQoLcm9ibG94X2N0eHMYAyADKAsyRC5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuUm9ibG94Q3R4IhoKGFNlbmRVbmlmb3JtQmF0Y2hSZXNwb25zZSJjChBTZW5kRXZlbnRSZXF1ZXN0Ek8KBWV2ZW50GAEgASgLMkAucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLkV2ZW50IhMKEVNlbmRFdmVudFJlc3BvbnNlIhQKEkxpc3RTb3VyY2VzUmVxdWVzdCJpChNMaXN0U291cmNlc1Jlc3BvbnNlElIKB3NvdXJjZXMYASADKAsyQS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU291cmNlIiAKEEdldFNvdXJjZVJlcXVlc3QSDAoEbmFtZRgBIAEoCSJmChFHZXRTb3VyY2VSZXNwb25zZRJRCgZzb3VyY2UYASABKAsyQS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU291cmNlImgKE0NyZWF0ZVNvdXJjZVJlcXVlc3QSUQoGc291cmNlGAEgASgLMkEucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlNvdXJjZSJpChRDcmVhdGVTb3VyY2VSZXNwb25zZRJRCgZzb3VyY2UYASABKAsyQS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU291cmNlIo0BChNVcGRhdGVTb3VyY2VSZXF1ZXN0EgwKBG5hbWUYASABKAkSGAoLa2Fma2FfdG9waWMYAiABKAlIAIgBARIUCgdibG9ja2VkGAMgASgISAGIAQESEgoFbm90ZXMYBCABKAlIAogBAUIOCgxfa2Fma2FfdG9waWNCCgoIX2Jsb2NrZWRCCAoGX25vdGVzImkKFFVwZGF0ZVNvdXJjZVJlc3BvbnNlElEKBnNvdXJjZRgBIAEoCzJBLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5Tb3VyY2UiIwoTRGVsZXRlU291cmNlUmVxdWVzdBIMCgRuYW1lGAEgASgJIicKFERlbGV0ZVNvdXJjZVJlc3BvbnNlEg8KB2RlbGV0ZWQYASABKAgiIgoSVG91Y2hTb3VyY2VSZXF1ZXN0EgwKBG5hbWUYASABKAkiaAoTVG91Y2hTb3VyY2VSZXNwb25zZRJRCgZzb3VyY2UYASABKAsyQS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU291cmNlMqgQChpFeHBlcmllbmNlU2lnbmFsc0luZ2VzdEFQSRK9AQoJU2VuZEJhdGNoEksucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlNlbmRCYXRjaFJlcXVlc3QaTC5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU2VuZEJhdGNoUmVzcG9uc2UiFYLT5JMCDyIKL3YxL2V2ZW50czoBKhLiAQoSU2VuZE9wdGltaXplZEJhdGNoElQucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlNlbmRPcHRpbWl6ZWRCYXRjaFJlcXVlc3QaVS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU2VuZE9wdGltaXplZEJhdGNoUmVzcG9uc2UiH4LT5JMCGSIUL3YxL2V2ZW50cy9vcHRpbWl6ZWQ6ASoS2gEKEFNlbmRVbmlmb3JtQmF0Y2gSUi5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU2VuZFVuaWZvcm1CYXRjaFJlcXVlc3QaUy5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU2VuZFVuaWZvcm1CYXRjaFJlc3BvbnNlIh2C0+STAhciEi92MS9ldmVudHMvdW5pZm9ybToBKhLEAQoJU2VuZEV2ZW50Eksucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlNlbmRFdmVudFJlcXVlc3QaTC5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU2VuZEV2ZW50UmVzcG9uc2UiHILT5JMCFiIRL3YxL2V2ZW50cy9zaW5nbGU6ASoSwQEKC0xpc3RTb3VyY2VzEk0ucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLkxpc3RTb3VyY2VzUmVxdWVzdBpOLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5MaXN0U291cmNlc1Jlc3BvbnNlIhOC0+STAg0SCy92MS9zb3VyY2VzEsIBCglHZXRTb3VyY2USSy5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuR2V0U291cmNlUmVxdWVzdBpMLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5HZXRTb3VyY2VSZXNwb25zZSIagtPkkwIUEhIvdjEvc291cmNlcy97bmFtZX0SxwEKDENyZWF0ZVNvdXJjZRJOLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5DcmVhdGVTb3VyY2VSZXF1ZXN0Gk8ucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLkNyZWF0ZVNvdXJjZVJlc3BvbnNlIhaC0+STAhAiCy92MS9zb3VyY2VzOgEqEs4BCgxVcGRhdGVTb3VyY2USTi5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuVXBkYXRlU291cmNlUmVxdWVzdBpPLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5VcGRhdGVTb3VyY2VSZXNwb25zZSIdgtPkkwIXMhIvdjEvc291cmNlcy97bmFtZX06ASoSywEKDERlbGV0ZVNvdXJjZRJOLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5EZWxldGVTb3VyY2VSZXF1ZXN0Gk8ucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLkRlbGV0ZVNvdXJjZVJlc3BvbnNlIhqC0+STAhQqEi92MS9zb3VyY2VzL3tuYW1lfRLOAQoLVG91Y2hTb3VyY2USTS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuVG91Y2hTb3VyY2VSZXF1ZXN0Gk4ucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlRvdWNoU291cmNlUmVzcG9uc2UiIILT5JMCGiIYL3YxL3NvdXJjZXMve25hbWV9L3RvdWNoQtgBCj1jb20ucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxQh9FeHBlcmllbmNlU2lnbmFsc0luZ2VzdEFwaVByb3RvUAFaMmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0L2V4cGVyaWVuY2VzaWduYWxzaW5nZXN0L3YxqgI5Um9ibG94LkV4cGVyaWVuY2VTaWduYWxzSW5nZXN0LkV4cGVyaWVuY2VTaWduYWxzSW5nZXN0LlYxgrUYAggBYgZwcm90bzM", [dt, dn, dr]),
                di = sr(da, 2),
                du = sr(da, 2, 0),
                dc = sr(da, 6);

            function dl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ds(e, t, n, r, a, o, i) {
                try {
                    var u = e[o](i),
                        c = u.value
                } catch (e) {
                    n(e);
                    return
                }
                u.done ? t(c) : Promise.resolve(c).then(r, a)
            }

            function df(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var o = e.apply(t, n);

                        function i(e) {
                            ds(o, r, a, i, u, "next", e)
                        }

                        function u(e) {
                            ds(o, r, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function dd(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = u(0), i.throw = u(1), i.return = u(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function u(u) {
                    return function(c) {
                        var l = [u, c];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, l[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & l[0] ? r.return : l[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, l[1])).done) return a;
                            switch (r = 0, a && (l = [2 & l[0], a.value]), l[0]) {
                                case 0:
                                case 1:
                                    a = l;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: l[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, r = l[1], l = [0];
                                    continue;
                                case 7:
                                    l = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === l[0] && (!a || l[1] > a[0] && l[1] < a[3])) {
                                        o.label = l[1];
                                        break
                                    }
                                    if (6 === l[0] && o.label < a[1]) {
                                        o.label = a[1], a = l;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(l);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            l = t.call(e, o)
                        } catch (e) {
                            l = [6, e], r = 0
                        } finally {
                            n = a = 0
                        }
                        if (5 & l[0]) throw l[1];
                        return {
                            value: l[0] ? l[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var dp = function() {
                var e;

                function t() {
                    var e, n, r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        a = r.baseUrl;
                    if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                    n = void 0, (e = "baseUrl") in this ? Object.defineProperty(this, e, {
                        value: n,
                        enumerable: !0,
                        configurable: !0,
                        writable: !0
                    }) : this[e] = n, this.baseUrl = (void 0 === a ? "https://apis.roblox.com" : a).replace(/\/$/, "") + "/experience-signals-ingest/public"
                }
                return e = [{
                        key: "sendEvent",
                        value: function(e, t) {
                            return df(function() {
                                var n, r, a;
                                return dd(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            return o.trys.push([0, 2, , 3]), n = fS(e, sB(e, t), {
                                                writeUnknownFields: !1
                                            }), r = sB(dc, {
                                                event: {
                                                    source: e.typeName,
                                                    payload: n
                                                }
                                            }), [4, fetch("".concat(this.baseUrl, "/v1/events/single"), {
                                                method: "POST",
                                                headers: {
                                                    "Content-Type": "application/x-protobuf",
                                                    "Content-Encoding": "gzip"
                                                },
                                                body: f6(fS(dc, r, {
                                                    writeUnknownFields: !1
                                                })),
                                                credentials: "include",
                                                keepalive: !0
                                            })];
                                        case 1:
                                            if (!(a = o.sent()).ok) throw Error("status ".concat(a.status));
                                            return [3, 3];
                                        case 2:
                                            return console.error("EventStream failed to send event:", o.sent()), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            }).call(this)
                        }
                    }, {
                        key: "sendBatch",
                        value: function(e) {
                            return df(function() {
                                var t, n, r, a, o, i, u, c, l, s, f;
                                return dd(this, function(d) {
                                    switch (d.label) {
                                        case 0:
                                            d.trys.push([0, 2, , 3]), t = new Map, n = !0, r = !1, a = void 0;
                                            try {
                                                for (o = e[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) c = (u = i.value).schema.typeName, t.has(c) || t.set(c, []), t.get(c).push(u)
                                            } catch (e) {
                                                r = !0, a = e
                                            } finally {
                                                try {
                                                    n || null == o.return || o.return()
                                                } finally {
                                                    if (r) throw a
                                                }
                                            }
                                            return l = Array.from(t.entries()).map(function(e) {
                                                var t = function(e) {
                                                        if (Array.isArray(e)) return e
                                                    }(e) || function(e, t) {
                                                        var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                                        if (null != a) {
                                                            var o = [],
                                                                i = !0,
                                                                u = !1;
                                                            try {
                                                                for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                                                            } catch (e) {
                                                                u = !0, r = e
                                                            } finally {
                                                                try {
                                                                    i || null == a.return || a.return()
                                                                } finally {
                                                                    if (u) throw r
                                                                }
                                                            }
                                                            return o
                                                        }
                                                    }(e, 2) || function(e, t) {
                                                        if (e) {
                                                            if ("string" == typeof e) return dl(e, 2);
                                                            var n = Object.prototype.toString.call(e).slice(8, -1);
                                                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return dl(e, t)
                                                        }
                                                    }(e, 2) || function() {
                                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                                    }(),
                                                    n = t[0],
                                                    r = t[1].map(function(e) {
                                                        var t = e.schema;
                                                        return fS(t, sB(t, e.msg), {
                                                            writeUnknownFields: !1
                                                        })
                                                    });
                                                return sB(du, {
                                                    source: n,
                                                    payloads: r
                                                })
                                            }), s = sB(di, {
                                                subBatches: l
                                            }), [4, fetch("".concat(this.baseUrl, "/v1/events/optimized"), {
                                                method: "POST",
                                                headers: {
                                                    "Content-Type": "application/x-protobuf",
                                                    "Content-Encoding": "gzip"
                                                },
                                                body: f6(fS(di, s, {
                                                    writeUnknownFields: !1
                                                })),
                                                credentials: "include",
                                                keepalive: !0
                                            })];
                                        case 1:
                                            if (!(f = d.sent()).ok) throw Error("status ".concat(f.status));
                                            return [3, 3];
                                        case 2:
                                            return console.error("EventStream failed to send batch events:", d.sent()), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            }).call(this)
                        }
                    }],
                    function(e, t) {
                        for (var n = 0; n < t.length; n++) {
                            var r = t[n];
                            r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                        }
                    }(t.prototype, e), t
            }();

            function dm(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            "undefined" != typeof window && (window.Sentry = {
                startSpan: rf,
                getActiveSpan: nj,
                flush: function(e) {
                    var t;
                    return (t = function() {
                        var t;
                        return function(e, t) {
                            var n, r, a, o = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & a[0]) throw a[1];
                                        return a[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return i.next = u(0), i.throw = u(1), i.return = u(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                                return this
                            }), i;

                            function u(u) {
                                return function(c) {
                                    var l = [u, c];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; i && (i = 0, l[0] && (o = 0)), o;) try {
                                        if (n = 1, r && (a = 2 & l[0] ? r.return : l[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, l[1])).done) return a;
                                        switch (r = 0, a && (l = [2 & l[0], a.value]), l[0]) {
                                            case 0:
                                            case 1:
                                                a = l;
                                                break;
                                            case 4:
                                                return o.label++, {
                                                    value: l[1],
                                                    done: !1
                                                };
                                            case 5:
                                                o.label++, r = l[1], l = [0];
                                                continue;
                                            case 7:
                                                l = o.ops.pop(), o.trys.pop();
                                                continue;
                                            default:
                                                if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                                    o = 0;
                                                    continue
                                                }
                                                if (3 === l[0] && (!a || l[1] > a[0] && l[1] < a[3])) {
                                                    o.label = l[1];
                                                    break
                                                }
                                                if (6 === l[0] && o.label < a[1]) {
                                                    o.label = a[1], a = l;
                                                    break
                                                }
                                                if (a && o.label < a[2]) {
                                                    o.label = a[2], o.ops.push(l);
                                                    break
                                                }
                                                a[2] && o.ops.pop(), o.trys.pop();
                                                continue
                                        }
                                        l = t.call(e, o)
                                    } catch (e) {
                                        l = [6, e], r = 0
                                    } finally {
                                        n = a = 0
                                    }
                                    if (5 & l[0]) throw l[1];
                                    return {
                                        value: l[0] ? l[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(n) {
                            return (t = t1()) ? [2, t.flush(e)] : (eP && e8.warn("Cannot flush events. No client defined."), [2, Promise.resolve(!1)])
                        })
                    }, function() {
                        var e = this,
                            n = arguments;
                        return new Promise(function(r, a) {
                            var o = t.apply(e, n);

                            function i(e) {
                                rx(o, r, a, i, u, "next", e)
                            }

                            function u(e) {
                                rx(o, r, a, i, u, "throw", e)
                            }
                            i(void 0)
                        })
                    })()
                },
                captureException: rR
            });
            var dy = document.querySelector('meta[name="sentry-meta"]'),
                dv = document.querySelector('meta[name="environment-meta"]'),
                db = null != (eT = null == dy ? void 0 : dy.dataset) ? eT : {},
                dh = db.dsn,
                dg = db.envName,
                dS = db.sampleRate,
                d_ = db.tracesSampleRate,
                dE = (N = (T = function(e, t) {
                    var n = null == t ? void 0 : t.domain;
                    if (null != n) {
                        var r, a = (r = n.split("."), function(e) {
                                if (Array.isArray(e)) return e
                            }(r) || function(e, t) {
                                var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != a) {
                                    var o = [],
                                        i = !0,
                                        u = !1;
                                    try {
                                        for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                                    } catch (e) {
                                        u = !0, r = e
                                    } finally {
                                        try {
                                            i || null == a.return || a.return()
                                        } finally {
                                            if (u) throw r
                                        }
                                    }
                                    return o
                                }
                            }(r, 1) || function(e, t) {
                                if (e) {
                                    if ("string" == typeof e) return cP(e, 1);
                                    var n = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return cP(e, t)
                                }
                            }(r, 1) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }())[0],
                            o = null == a ? void 0 : a.trim().toLowerCase();
                        return {
                            production: (null == t ? void 0 : t.isTestingSite) === "false",
                            domainName: null != o && o.length > 0 ? o : cV
                        }
                    }
                    if ("localhost" === e) return {
                        production: !1,
                        domainName: cV
                    };
                    var i = e.toLowerCase().split("."),
                        u = i.slice(-2).join("."),
                        c = i.find(function(e) {
                            return e.startsWith("sitetest")
                        });
                    return "roblox.com" === u || "simulprod.com" === u || "rblx.org" === u ? {
                        production: !0,
                        domainName: "roblox"
                    } : null != c ? {
                        production: !1,
                        domainName: c
                    } : {
                        production: !1,
                        domainName: cV
                    }
                }(window.location.hostname, null == dv ? void 0 : dv.dataset)).production, k = T.domainName, N ? "https://tracing.roblox.com/v1/traces" : null != (A = ({
                    sitetest1: "https://otel-collector-otlp-http-sitetest1-snc3.simulpong.com/v1/traces",
                    sitetest2: "https://otel-collector-otlp-http-sitetest2-snc2.simulpong.com/v1/traces",
                    sitetest3: cZ
                })[k.toLowerCase()]) ? A : cZ),
                dO = null == dS ? .001 : parseFloat(dS),
                dw = null == d_ ? 0 : parseFloat(d_),
                dI = 0 === dw,
                dA = Math.min(dw, 5e-4),
                dT = cc.authenticatedUser,
                dN = function() {
                    return document.querySelector('meta[name="page-meta"]')
                };
            ! function() {
                var e, t, n, r, a, o = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    i = !o.skipBrowserExtensionCheck && !! function() {
                        if (void 0 === ek.window || ek.nw) return !1;
                        var e, t = ek.chrome || ek.browser;
                        if (!(null == t || null == (e = t.runtime) ? void 0 : e.id)) return !1;
                        var n = eQ();
                        return !(ek === ek.top && ["chrome-extension", "moz-extension", "ms-browser-extension", "safari-web-extension"].some(function(e) {
                            return n.startsWith("".concat(e, "://"))
                        }))
                    }() && (o_ && e3(function() {
                        console.error("[Sentry] You cannot use Sentry.init() in a browser extension, see: https://docs.sentry.io/platforms/javascript/best-practices/browser-extensions/")
                    }), !0),
                    u = null == o.defaultIntegrations ? [rz(), {
                        name: "FunctionToString",
                        setupOnce: function() {
                            W = Function.prototype.toString;
                            try {
                                Function.prototype.toString = function() {
                                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                    var r = tn(this),
                                        a = rq.has(t1()) && void 0 !== r ? r : this;
                                    return W.apply(a, t)
                                }
                            } catch (e) {}
                        },
                        setup: function(e) {
                            rq.set(e, !0)
                        }
                    }, {
                        name: "ConversationId",
                        setup: function(e) {
                            e.on("spanStart", function(e) {
                                var t = tq().getScopeData(),
                                    n = t$().getScopeData(),
                                    r = t.conversationId || n.conversationId;
                                r && e.setAttribute("gen_ai.conversation.id", r)
                            })
                        }
                    }, oA(), ow(), oC(), oJ(), r$(), {
                        name: "HttpContext",
                        preprocessEvent: function(e) {
                            if (ek.navigator || ek.location || ek.document) {
                                var t, n, r, a = aG(),
                                    o = oL({}, a.headers, null == (r = e.request) ? void 0 : r.headers);
                                t = oL({}, a, e.request), n = n = {
                                    headers: o
                                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(e, t) {
                                    var n = Object.keys(e);
                                    if (Object.getOwnPropertySymbols) {
                                        var r = Object.getOwnPropertySymbols(e);
                                        n.push.apply(n, r)
                                    }
                                    return n
                                })(Object(n)).forEach(function(e) {
                                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(n, e))
                                }), e.request = t
                            }
                        }
                    }, {
                        name: "BrowserSession",
                        setupOnce: function() {
                            if (void 0 === ek.document) {
                                o_ && e8.warn("Using the `browserSessionIntegration` in non-browser environments is not supported.");
                                return
                            }
                            rZ({
                                ignoreDuration: !0
                            }), rF(), og(function(e) {
                                var t = e.from,
                                    n = e.to;
                                void 0 !== t && t !== n && (rZ({
                                    ignoreDuration: !0
                                }), rF())
                            })
                        }
                    }] : o.defaultIntegrations,
                    c = (n = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({}, o), r = r = {
                        enabled: !i && o.enabled,
                        stackParser: Array.isArray(t = o.stackParser || o4) ? tk.apply(void 0, tA(t)) : t,
                        integrations: function(e) {
                            var t, n, r = e.defaultIntegrations || [],
                                a = e.integrations;
                            if (r.forEach(function(e) {
                                    e.isDefaultInstance = !0
                                }), Array.isArray(a)) n = rX(r).concat(rX(a));
                            else if ("function" == typeof a) {
                                var o = a(r);
                                n = Array.isArray(o) ? o : [o]
                            } else n = r;
                            return t = {}, n.forEach(function(e) {
                                var n = e.name,
                                    r = t[n];
                                r && !r.isDefaultInstance && e.isDefaultInstance || (t[n] = e)
                            }), Object.values(t)
                        }({
                            integrations: o.integrations,
                            defaultIntegrations: u
                        }),
                        transport: o.transport || it
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(r)) : (function(e, t) {
                        var n = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            n.push.apply(n, r)
                        }
                        return n
                    })(Object(r)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(r, e))
                    }), n);
                !0 === c.debug && (eP ? e8.enable() : e3(function() {
                    console.warn("[Sentry] Cannot initialize SDK with `debug` option using a non-debug bundle.")
                })), tq().update(c.initialScope), e = a = new aH(c), tq().setClient(e), a.init()
            }({
                dsn: null != dh ? dh : "https://24df60727c94bd0aa14ab1269d104a21@o293668.ingest.us.sentry.io/4509158985826304",
                integrations: [function() {
                    var e, t, n, r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        a = function(t, r) {
                            var a = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2],
                                u = "pageload" === r.op,
                                c = r.name,
                                l = v ? v(r) : r,
                                s = l.attributes || {};
                            if (c !== l.name && (s[t2] = "custom", l.attributes = s), !a) {
                                var f = tv();
                                rd(u2(u1({}, l), {
                                    startTime: f
                                })).end(f);
                                return
                            }
                            o.name = l.name, o.source = s[t2];
                            var d = il(l, {
                                idleTimeout: b,
                                finalTimeout: h,
                                childSpanTimeout: g,
                                disableAutoFinish: u,
                                beforeSpanEnd: function(r) {
                                    null == e || e(),
                                        function(e, t) {
                                            var n = ui(),
                                                r = tg();
                                            if ((null == n ? void 0 : n.getEntries) && r) {
                                                var a, o, i = uu(r),
                                                    u = n.getEntries(),
                                                    c = nE(e),
                                                    l = c.op,
                                                    s = c.start_timestamp;
                                                u.slice(ug).forEach(function(n) {
                                                        var r, a, o, u, c, f, d, p, m, y = uu(n.startTime),
                                                            v = uu(Math.max(0, n.duration));
                                                        if ("navigation" !== l || !s || !(i + y < s)) switch (n.entryType) {
                                                            case "navigation":
                                                                r = e, a = n, o = i, ["unloadEvent", "redirect", "domContentLoadedEvent", "loadEvent", "connect"].forEach(function(e) {
                                                                    u_(r, a, e, o)
                                                                }), u_(r, a, "secureConnection", o, "TLS/SSL"), u_(r, a, "fetch", o, "cache"), u_(r, a, "domainLookup", o, "DNS"), u = r, c = a, d = (f = o) + uu(c.requestStart), p = f + uu(c.responseEnd), m = f + uu(c.responseStart), c.responseEnd && (ua(u, d, p, {
                                                                    op: "browser.request",
                                                                    name: c.name,
                                                                    attributes: uv({}, t4, "auto.ui.browser.metrics")
                                                                }), ua(u, m, p, {
                                                                    op: "browser.response",
                                                                    name: c.name,
                                                                    attributes: uv({}, t4, "auto.ui.browser.metrics")
                                                                }));
                                                                break;
                                                            case "mark":
                                                            case "paint":
                                                            case "measure":
                                                                ! function(e, t, n, r, a, o) {
                                                                    if (! function(e) {
                                                                            if ((null == e ? void 0 : e.entryType) === "measure") try {
                                                                                return "Components ⚛" === e.detail.devtools.track
                                                                            } catch (e) {
                                                                                return
                                                                            }
                                                                        }(t) && !(["mark", "measure"].includes(t.entryType) && tF(t.name, o))) {
                                                                        var i = ip(!1),
                                                                            u = a + Math.max(n, uu(i ? i.requestStart : 0)),
                                                                            c = a + n,
                                                                            l = c + r,
                                                                            s = uv({}, t4, "auto.resource.browser.metrics");
                                                                        u !== c && (s["sentry.browser.measure_happened_before_request"] = !0, s["sentry.browser.measure_start_time"] = u),
                                                                            function(e, t) {
                                                                                try {
                                                                                    var n = t.detail;
                                                                                    if (!n) return;
                                                                                    if ((void 0 === n ? "undefined" : n && "undefined" != typeof Symbol && n.constructor === Symbol ? "symbol" : typeof n) == "object") {
                                                                                        var r = !0,
                                                                                            a = !1,
                                                                                            o = void 0;
                                                                                        try {
                                                                                            for (var i, u = Object.entries(n)[Symbol.iterator](); !(r = (i = u.next()).done); r = !0) {
                                                                                                var c = uh(i.value, 2),
                                                                                                    l = c[0],
                                                                                                    s = c[1];
                                                                                                if (s && eW(s)) e["sentry.browser.measure.detail.".concat(l)] = s;
                                                                                                else if (void 0 !== s) try {
                                                                                                    e["sentry.browser.measure.detail.".concat(l)] = JSON.stringify(s)
                                                                                                } catch (e) {}
                                                                                            }
                                                                                        } catch (e) {
                                                                                            a = !0, o = e
                                                                                        } finally {
                                                                                            try {
                                                                                                r || null == u.return || u.return()
                                                                                            } finally {
                                                                                                if (a) throw o
                                                                                            }
                                                                                        }
                                                                                        return
                                                                                    }
                                                                                    if (eW(n)) {
                                                                                        e["sentry.browser.measure.detail"] = n;
                                                                                        return
                                                                                    }
                                                                                    try {
                                                                                        e["sentry.browser.measure.detail"] = JSON.stringify(n)
                                                                                    } catch (e) {}
                                                                                } catch (e) {}
                                                                            }(s, t), u <= l && ua(e, u, l, {
                                                                                name: t.name,
                                                                                op: t.entryType,
                                                                                attributes: s
                                                                            })
                                                                    }
                                                                }(e, n, y, v, i, t.ignorePerformanceApiSpans);
                                                                var b = i_(),
                                                                    h = n.startTime < b.firstHiddenTime;
                                                                "first-paint" === n.name && h && (uS.fp = {
                                                                    value: n.startTime,
                                                                    unit: "millisecond"
                                                                }), "first-contentful-paint" === n.name && h && (uS.fcp = {
                                                                    value: n.startTime,
                                                                    unit: "millisecond"
                                                                });
                                                                break;
                                                            case "resource":
                                                                ! function(e, t, n, r, a, o, i) {
                                                                    if ("xmlhttprequest" !== t.initiatorType && "fetch" !== t.initiatorType) {
                                                                        var u = t.initiatorType ? "resource.".concat(t.initiatorType) : "resource.other";
                                                                        if (null == i || !i.includes(u)) {
                                                                            var c, l, s = uv({}, t4, "auto.resource.browser.metrics"),
                                                                                f = of(n);
                                                                            f.protocol && (s["url.scheme"] = f.protocol.split(":").pop()), f.host && (s["server.address"] = f.host), s["url.same_origin"] = n.includes(ek.location.origin), c = t, l = s, [
                                                                                ["responseStatus", "http.response.status_code"],
                                                                                ["transferSize", "http.response_transfer_size"],
                                                                                ["encodedBodySize", "http.response_content_length"],
                                                                                ["decodedBodySize", "http.decoded_response_content_length"],
                                                                                ["renderBlockingStatus", "resource.render_blocking_status"],
                                                                                ["deliveryType", "http.response_delivery_type"]
                                                                            ].forEach(function(e) {
                                                                                var t = uh(e, 2),
                                                                                    n = t[0],
                                                                                    r = t[1],
                                                                                    a = c[n];
                                                                                null != a && ("number" == typeof a && a < 0x7fffffff || "string" == typeof a) && (l[r] = a)
                                                                            });
                                                                            var d = ub({}, s, um(t)),
                                                                                p = o + r;
                                                                            ua(e, p, p + a, {
                                                                                name: n.replace(ek.location.origin, ""),
                                                                                op: u,
                                                                                attributes: d
                                                                            })
                                                                        }
                                                                    }
                                                                }(e, n, n.name, y, v, i, t.ignoreResourceSpans)
                                                        }
                                                    }), ug = Math.max(u.length - 1, 0),
                                                    function(e) {
                                                        var t = ek.navigator;
                                                        if (t) {
                                                            var n = t.connection;
                                                            n && (n.effectiveType && e.setAttribute("effectiveConnectionType", n.effectiveType), n.type && e.setAttribute("connectionType", n.type), ur(n.rtt) && (uS["connection.rtt"] = {
                                                                value: n.rtt,
                                                                unit: "millisecond"
                                                            })), ur(t.deviceMemory) && e.setAttribute("deviceMemory", "".concat(t.deviceMemory, " GB")), ur(t.hardwareConcurrency) && e.setAttribute("hardwareConcurrency", String(t.hardwareConcurrency))
                                                        }
                                                    }(e), "pageload" === l && (function(e) {
                                                        var t = ip(!1);
                                                        if (t) {
                                                            var n = t.responseStart,
                                                                r = t.requestStart;
                                                            r <= n && (e["ttfb.requestTime"] = {
                                                                value: n - r,
                                                                unit: "millisecond"
                                                            })
                                                        }
                                                    }(uS), t.recordClsOnPageloadSpan || delete uS.cls, t.recordLcpOnPageloadSpan || delete uS.lcp, Object.entries(uS).forEach(function(e) {
                                                        var t = uh(e, 2),
                                                            n = t[0],
                                                            r = t[1];
                                                        ! function(e, t, n) {
                                                            var r, a = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : nj(),
                                                                o = a && nk(a);
                                                            o && (eP && e8.log("[Measurement] Setting measurement on root span: ".concat(e, " = ").concat(t, " ").concat(n)), o.addEvent(e, (n8(r = {}, t7, t), n8(r, t6, n), r)))
                                                        }(n, r.value, r.unit)
                                                    }), e.setAttribute("performance.timeOrigin", i), e.setAttribute("performance.activationStart", im()), a = e, o = t, q && o.recordLcpOnPageloadSpan && (q.element && a.setAttribute("lcp.element", eH(q.element)), q.id && a.setAttribute("lcp.id", q.id), q.url && a.setAttribute("lcp.url", q.url.trim().slice(0, 200)), null != q.loadTime && a.setAttribute("lcp.loadTime", q.loadTime), null != q.renderTime && a.setAttribute("lcp.renderTime", q.renderTime), a.setAttribute("lcp.size", q.size)), (null == $ ? void 0 : $.sources) && o.recordClsOnPageloadSpan && $.sources.forEach(function(e, t) {
                                                        return a.setAttribute("cls.source.".concat(t + 1), eH(e.node))
                                                    })), q = void 0, $ = void 0, uS = {}
                                            }
                                        }(r, {
                                            recordClsOnPageloadSpan: !m,
                                            recordLcpOnPageloadSpan: !y,
                                            ignoreResourceSpans: A,
                                            ignorePerformanceApiSpans: T
                                        }), te(t, u9, void 0);
                                    var a = tq(),
                                        o = a.getPropagationContext();
                                    a.setPropagationContext(u2(u1({}, o), {
                                        traceId: d.spanContext().traceId,
                                        sampled: nO(d),
                                        dsc: nY(r)
                                    })), u && (n = void 0)
                                },
                                trimIdleSpanEndTimestamp: !P
                            });

                            function p() {
                                i && ["interactive", "complete"].includes(i.readyState) && t.emit("idleSpanEnableAutoFinish", d)
                            }
                            u && P && (n = d), te(t, u9, d), u && !P && i && (i.addEventListener("readystatechange", function() {
                                p()
                            }), p())
                        },
                        o = {
                            name: void 0,
                            source: void 0
                        },
                        i = ek.document,
                        u = u1({}, u3, r),
                        c = u.enableInp,
                        l = u.enableElementTiming,
                        s = u.enableLongTask,
                        f = u.enableLongAnimationFrame,
                        d = u._experiments,
                        p = d.enableInteractions,
                        m = d.enableStandaloneClsSpans,
                        y = d.enableStandaloneLcpSpans,
                        v = u.beforeStartSpan,
                        b = u.idleTimeout,
                        h = u.finalTimeout,
                        g = u.childSpanTimeout,
                        S = u.markBackgroundSpan,
                        _ = u.traceFetch,
                        E = u.traceXHR,
                        O = u.trackFetchStreamPerformance,
                        w = u.shouldCreateSpanForRequest,
                        I = u.enableHTTPTimings,
                        A = u.ignoreResourceSpans,
                        T = u.ignorePerformanceApiSpans,
                        N = u.instrumentPageLoad,
                        k = u.instrumentNavigation,
                        j = u.detectRedirects,
                        x = u.linkPreviousTrace,
                        R = u.consistentTraceSampling,
                        P = u.enableReportPageLoaded,
                        V = u.onRequestSpanStart,
                        Z = u.onRequestSpanEnd;
                    return {
                        name: "BrowserTracing",
                        setup: function(r) {
                            function o() {
                                var e = nj(),
                                    t = e && nk(e);
                                if (t) {
                                    var n = "internal_error";
                                    eP && e8.log("[Tracing] Root span: ".concat(n, " -> Global error occurred")), t.setStatus({
                                        code: 2,
                                        message: n
                                    })
                                }
                            }
                            if (is || (o.tag = "sentry_tracingErrorCallback", is = !0, ox(o), oV(o)), e = function(e) {
                                    var t = e.recordClsStandaloneSpans,
                                        n = e.recordLcpStandaloneSpans,
                                        r = e.client,
                                        a = ui();
                                    if (a && tg()) {
                                        a.mark && ek.performance.mark("sentry-tracing-init");
                                        var o = n ? function(e) {
                                                var t, n = 0;
                                                if (uc("largest-contentful-paint")) {
                                                    var r = i$(function(e) {
                                                        var r = e.metric,
                                                            a = r.entries[r.entries.length - 1];
                                                        a && (n = r.value, t = a)
                                                    }, !0);
                                                    ul(e, function(e, a) {
                                                        var o, i, u, c, l, s, f, d, p, m, y;
                                                        o = n, i = t, u = a, c = e, o6 && e8.log("Sending LCP span (".concat(o, ")")), f = uu((tg() || 0) + ((null == i ? void 0 : i.startTime) || 0)), d = tq().getScopeData().transactionName, p = i ? eH(i.element) : "Largest contentful paint", m = (uf(l = {}, t4, "auto.http.browser.lcp"), uf(l, t9, "ui.webvital.lcp"), uf(l, nn, 0), uf(l, "sentry.pageload.span_id", u), uf(l, "sentry.report_event", c), l), i && (i.element && (m["lcp.element"] = eH(i.element)), i.id && (m["lcp.id"] = i.id), i.url && (m["lcp.url"] = i.url), null != i.loadTime && (m["lcp.loadTime"] = i.loadTime), null != i.renderTime && (m["lcp.renderTime"] = i.renderTime), null != i.size && (m["lcp.size"] = i.size)), (y = uo({
                                                            name: p,
                                                            transaction: d,
                                                            attributes: m,
                                                            startTime: f
                                                        })) && (y.addEvent("lcp", (uf(s = {}, t6, "millisecond"), uf(s, t7, o), s)), y.end(f)), r()
                                                    })
                                                }
                                            }(r) : i$(function(e) {
                                                var t = e.metric,
                                                    n = t.entries[t.entries.length - 1];
                                                n && (uS.lcp = {
                                                    value: t.value,
                                                    unit: "millisecond"
                                                }, q = n)
                                            }, !0),
                                            i = i4("ttfb", function(e) {
                                                var t = e.metric;
                                                t.entries[t.entries.length - 1] && (uS.ttfb = {
                                                    value: t.value,
                                                    unit: "millisecond"
                                                })
                                            }, i5, H),
                                            u = t ? function(e) {
                                                var t, n = 0;
                                                if (uc("layout-shift")) {
                                                    var r = iq(function(e) {
                                                        var r = e.metric,
                                                            a = r.entries[r.entries.length - 1];
                                                        a && (n = r.value, t = a)
                                                    }, !0);
                                                    ul(e, function(e, a) {
                                                        var o, i, u, c, l, s, f, d, p, m, y, v;
                                                        o = n, i = t, u = a, c = e, o6 && e8.log("Sending CLS span (".concat(o, ")")), d = i ? uu((tg() || 0) + i.startTime) : tb(), p = tq().getScopeData().transactionName, m = i ? eH(null == (l = i.sources[0]) ? void 0 : l.node) : "Layout shift", y = (us(s = {}, t4, "auto.http.browser.cls"), us(s, t9, "ui.webvital.cls"), us(s, nn, 0), us(s, "sentry.pageload.span_id", u), us(s, "sentry.report_event", c), s), (null == i ? void 0 : i.sources) && i.sources.forEach(function(e, t) {
                                                            y["cls.source.".concat(t + 1)] = eH(e.node)
                                                        }), (v = uo({
                                                            name: m,
                                                            transaction: p,
                                                            attributes: y,
                                                            startTime: d
                                                        })) && (v.addEvent("cls", (us(f = {}, t6, ""), us(f, t7, o), f)), v.end(d)), r()
                                                    })
                                                }
                                            }(r) : iq(function(e) {
                                                var t = e.metric,
                                                    n = t.entries[t.entries.length - 1];
                                                n && (uS.cls = {
                                                    value: t.value,
                                                    unit: ""
                                                }, $ = n)
                                            }, !0);
                                        return function() {
                                            null == o || o(), i(), null == u || u()
                                        }
                                    }
                                    return function() {}
                                }({
                                    recordClsStandaloneSpans: m || !1,
                                    recordLcpStandaloneSpans: y || !1,
                                    client: r
                                }), c && function() {
                                    if (ui() && tg()) void i4("inp", uN, i9, Q)
                                }(), l && ui() && tg() && i0("element", ux), f && ek.PerformanceObserver && PerformanceObserver.supportedEntryTypes && PerformanceObserver.supportedEntryTypes.includes("long-animation-frame") ? new PerformanceObserver(function(e) {
                                    var t = nj();
                                    if (t) {
                                        var n = !0,
                                            r = !1,
                                            a = void 0;
                                        try {
                                            for (var o, i = e.getEntries()[Symbol.iterator](); !(n = (o = i.next()).done); n = !0) {
                                                var u = o.value;
                                                if (u.scripts[0]) {
                                                    var c = uu(tg() + u.startTime),
                                                        l = nE(t),
                                                        s = l.start_timestamp,
                                                        f = l.op;
                                                    if ("navigation" !== f || !s || !(c < s)) {
                                                        var d = uu(u.duration),
                                                            p = uv({}, t4, "auto.ui.browser.metrics"),
                                                            m = u.scripts[0],
                                                            y = m.invoker,
                                                            v = m.invokerType,
                                                            b = m.sourceURL,
                                                            h = m.sourceFunctionName,
                                                            g = m.sourceCharPosition;
                                                        p["browser.script.invoker"] = y, p["browser.script.invoker_type"] = v, b && (p["code.filepath"] = b), h && (p["code.function"] = h), -1 !== g && (p["browser.script.source_char_position"] = g), ua(t, c, c + d, {
                                                            name: "Main UI thread blocked",
                                                            op: "ui.long-animation-frame",
                                                            attributes: p
                                                        })
                                                    }
                                                }
                                            }
                                        } catch (e) {
                                            r = !0, a = e
                                        } finally {
                                            try {
                                                n || null == i.return || i.return()
                                            } finally {
                                                if (r) throw a
                                            }
                                        }
                                    }
                                }).observe({
                                    type: "long-animation-frame",
                                    buffered: !0
                                }) : s && i0("longtask", function(e) {
                                    var t = e.entries,
                                        n = nj();
                                    if (n) {
                                        var r = nE(n),
                                            a = r.op,
                                            o = r.start_timestamp,
                                            i = !0,
                                            u = !1,
                                            c = void 0;
                                        try {
                                            for (var l, s = t[Symbol.iterator](); !(i = (l = s.next()).done); i = !0) {
                                                var f = l.value,
                                                    d = uu(tg() + f.startTime),
                                                    p = uu(f.duration);
                                                "navigation" === a && o && d < o || ua(n, d, d + p, {
                                                    name: "Main UI thread blocked",
                                                    op: "ui.long-task",
                                                    attributes: uv({}, t4, "auto.ui.browser.metrics")
                                                })
                                            }
                                        } catch (e) {
                                            u = !0, c = e
                                        } finally {
                                            try {
                                                i || null == s.return || s.return()
                                            } finally {
                                                if (u) throw c
                                            }
                                        }
                                    }
                                }), p && i0("event", function(e) {
                                    var t = e.entries,
                                        n = nj();
                                    if (n) {
                                        var r = !0,
                                            a = !1,
                                            o = void 0;
                                        try {
                                            for (var i, u = t[Symbol.iterator](); !(r = (i = u.next()).done); r = !0) {
                                                var c = i.value;
                                                if ("click" === c.name) {
                                                    var l = uu(tg() + c.startTime),
                                                        s = uu(c.duration),
                                                        f = {
                                                            name: eH(c.target),
                                                            op: "ui.interaction.".concat(c.name),
                                                            startTime: l,
                                                            attributes: uv({}, t4, "auto.ui.browser.metrics")
                                                        },
                                                        d = eq(c.target);
                                                    d && (f.attributes["ui.component_name"] = d), ua(n, l, l + s, f)
                                                }
                                            }
                                        } catch (e) {
                                            a = !0, o = e
                                        } finally {
                                            try {
                                                r || null == u.return || u.return()
                                            } finally {
                                                if (a) throw o
                                            }
                                        }
                                    }
                                }), j && i) {
                                var u = function() {
                                    t = tb()
                                };
                                addEventListener("click", u, {
                                    capture: !0
                                }), addEventListener("keydown", u, {
                                    capture: !0,
                                    passive: !0
                                })
                            }

                            function d() {
                                var e = r[u9];
                                e && !nE(e).timestamp && (o_ && e8.log("[Tracing] Finishing current active span with op: ".concat(nE(e).op)), e.setAttribute(t8, "cancelled"), e.end())
                            }
                            r.on("startNavigationSpan", function(e, n) {
                                if (t1() === r) {
                                    if (null == n ? void 0 : n.isRedirect) {
                                        o_ && e8.warn("[Tracing] Detected redirect, navigation span will not be the root span, but a child span."), a(r, u1({
                                            op: "navigation.redirect"
                                        }, e), !1);
                                        return
                                    }
                                    t = void 0, d(), t$().setPropagationContext({
                                        traceId: ts(),
                                        sampleRand: Math.random(),
                                        propagationSpanId: nr() ? void 0 : tE()
                                    });
                                    var o = tq();
                                    o.setPropagationContext({
                                        traceId: ts(),
                                        sampleRand: Math.random(),
                                        propagationSpanId: nr() ? void 0 : tE()
                                    }), o.setSDKProcessingMetadata({
                                        normalizedRequest: void 0
                                    }), a(r, u2(u1({
                                        op: "navigation"
                                    }, e), {
                                        parentSpan: null,
                                        forceTransaction: !0
                                    }))
                                }
                            }), r.on("startPageLoadSpan", function(e) {
                                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                                if (t1() === r) {
                                    d();
                                    var n = function(e, t) {
                                            var n = function(e) {
                                                    if (e) {
                                                        var t, n = e.match(ny);
                                                        if (n) return "1" === n[3] ? t = !0 : "0" === n[3] && (t = !1), {
                                                            traceId: n[1],
                                                            parentSampled: t,
                                                            parentSpanId: n[2]
                                                        }
                                                    }
                                                }(e),
                                                r = np(t);
                                            if (!(null == n ? void 0 : n.traceId)) return {
                                                traceId: ts(),
                                                sampleRand: tu()
                                            };
                                            var a = function(e, t) {
                                                var n = na(null == t ? void 0 : t.sample_rand);
                                                if (void 0 !== n) return n;
                                                var r = na(null == t ? void 0 : t.sample_rate);
                                                return r && (null == e ? void 0 : e.parentSampled) !== void 0 ? e.parentSampled ? tu() * r : r + tu() * (1 - r) : tu()
                                            }(n, r);
                                            return r && (r.sample_rand = a.toString()), {
                                                traceId: n.traceId,
                                                parentSpanId: n.parentSpanId,
                                                sampled: n.parentSampled,
                                                dsc: r || {},
                                                sampleRand: a
                                            }
                                        }(t.sentryTrace || u5("sentry-trace"), t.baggage || u5("baggage")),
                                        o = tq();
                                    o.setPropagationContext(n), nr() || (o.getPropagationContext().propagationSpanId = tE()), o.setSDKProcessingMetadata({
                                        normalizedRequest: aG()
                                    }), a(r, u1({
                                        op: "pageload"
                                    }, e))
                                }
                            }), r.on("endPageloadSpan", function() {
                                P && n && (n.setAttribute(t8, "reportPageLoaded"), n.end())
                            })
                        },
                        afterAllSetup: function(e) {
                            var n, r, a, i, u, l, s = eQ();
                            if ("off" !== x && (v = (y = {
                                    linkPreviousTrace: x,
                                    consistentTraceSampling: R
                                }).linkPreviousTrace, A = y.consistentTraceSampling, P = (T = "session-storage" === v) ? function() {
                                    try {
                                        var e, t = null == (e = ek.sessionStorage) ? void 0 : e.getItem(uZ);
                                        return JSON.parse(t)
                                    } catch (e) {
                                        return
                                    }
                                }() : void 0, e.on("spanStart", function(e) {
                                    if (nk(e) === e) {
                                        var t = tq().getPropagationContext();
                                        P = function(e, t, n) {
                                            var r = nE(t),
                                                a = {
                                                    spanContext: t.spanContext(),
                                                    startTimestamp: r.start_timestamp,
                                                    sampleRate: function() {
                                                        try {
                                                            var e, t, a;
                                                            return null != (a = Number(null == (e = n.dsc) ? void 0 : e.sample_rate)) ? a : Number(null == (t = r.data) ? void 0 : t[t3])
                                                        } catch (e) {
                                                            return 0
                                                        }
                                                    }(),
                                                    sampleRand: n.sampleRand
                                                };
                                            if (!e) return a;
                                            var o = e.spanContext;
                                            return o.traceId === r.trace_id ? e : (Date.now() / 1e3 - e.startTimestamp <= 3600 && (o_ && e8.log("Adding previous_trace `".concat(JSON.stringify(o), "` link to span `").concat(JSON.stringify(uP({
                                                op: r.op
                                            }, t.spanContext())), "`")), t.addLink({
                                                context: o,
                                                attributes: uR({}, "sentry.link.type", "previous_trace")
                                            }), t.setAttribute("sentry.previous_trace", "".concat(o.traceId, "-").concat(o.spanId, "-").concat(+!!uC(o)))), a)
                                        }(P, e, t), T && function(e) {
                                            try {
                                                ek.sessionStorage.setItem(uZ, JSON.stringify(e))
                                            } catch (e) {
                                                o_ && e8.warn("Could not store previous trace in sessionStorage", e)
                                            }
                                        }(P)
                                    }
                                }), C = !0, A && e.on("beforeSampling", function(e) {
                                    if (P) {
                                        var t = tq(),
                                            n = t.getPropagationContext();
                                        if (C && n.parentSpanId) {
                                            C = !1;
                                            return
                                        }
                                        t.setPropagationContext(uV(uP({}, n), {
                                            dsc: uV(uP({}, n.dsc), {
                                                sample_rate: String(P.sampleRate),
                                                sampled: String(uC(P.spanContext))
                                            }),
                                            sampleRand: P.sampleRand
                                        })), e.parentSampled = uC(P.spanContext), e.parentSampleRate = P.sampleRate, e.spanAttributes = uV(uP({}, e.spanAttributes), uR({}, t5, P.sampleRate))
                                    }
                                })), ek.location) {
                                if (N) {
                                    var f, d, m, y, v, A, T, P, C, D, F = tg();
                                    f = e, d = {
                                        name: ek.location.pathname,
                                        startTime: F ? F / 1e3 : void 0,
                                        attributes: (u0(D = {}, t2, "url"), u0(D, t4, "auto.pageload.browser"), D)
                                    }, f.emit("startPageLoadSpan", d, void 0), tq().setTransactionName(d.name), (m = f[u9]) && f.emit("afterStartPageLoadSpan", m)
                                }
                                k && og(function(n) {
                                    var r, a, o, i, u, c, l, f, d, p, m, y = n.to;
                                    if (void 0 === n.from && (null == s ? void 0 : s.indexOf(y)) !== -1) {
                                        s = void 0;
                                        return
                                    }
                                    s = void 0;
                                    var v = os(y),
                                        b = e[u9],
                                        h = b && j && (r = b, a = t, o = nE(r), !((i = tv()) - o.start_timestamp > 1.5) && (!a || !(i - a <= 1.5)));
                                    u = e, c = {
                                        name: (null == v ? void 0 : v.pathname) || ek.location.pathname,
                                        attributes: (u0(m = {}, t2, "url"), u0(m, t4, "auto.navigation.browser"), m)
                                    }, f = (l = {
                                        url: y,
                                        isRedirect: h
                                    }).url, d = l.isRedirect, u.emit("beforeStartNavigationSpan", c, {
                                        isRedirect: d
                                    }), u.emit("startNavigationSpan", c, {
                                        isRedirect: d
                                    }), (p = tq()).setTransactionName(c.name), f && !d && p.setSDKProcessingMetadata({
                                        normalizedRequest: u2(u1({}, aG()), {
                                            url: f
                                        })
                                    }), u[u9]
                                })
                            }
                            S && (ek.document ? ek.document.addEventListener("visibilitychange", function() {
                                    var e = nj();
                                    if (e) {
                                        var t = nk(e);
                                        if (ek.document.hidden && t) {
                                            var n = "cancelled",
                                                r = nE(t),
                                                a = r.op,
                                                o = r.status;
                                            o_ && e8.log("[Tracing] Transaction: ".concat(n, " -> since tab moved to the background, op: ").concat(a)), o || t.setStatus({
                                                code: 2,
                                                message: n
                                            }), t.setAttribute("sentry.cancellation_reason", "document.hidden"), t.end()
                                        }
                                    }
                                }) : o_ && e8.warn("[Tracing] Could not set up background tab detection due to lack of global document")), p && (n = e, r = b, a = h, i = g, u = o, ek.document && addEventListener("click", function() {
                                    var e = "ui.action.click",
                                        t = n[u9];
                                    if (t && ["navigation", "pageload"].includes(nE(t).op)) {
                                        o_ && e8.warn("[Tracing] Did not create ".concat(e, " span because a pageload or navigation span is in progress."));
                                        return
                                    }
                                    if (l && (l.setAttribute(t8, "interactionInterrupted"), l.end(), l = void 0), !u.name) {
                                        o_ && e8.warn("[Tracing] Did not create ".concat(e, " transaction because _latestRouteName is missing."));
                                        return
                                    }
                                    l = il({
                                        name: u.name,
                                        op: e,
                                        attributes: u0({}, t2, u.source || "url")
                                    }, {
                                        idleTimeout: r,
                                        finalTimeout: a,
                                        childSpanTimeout: i
                                    })
                                }, {
                                    capture: !0
                                })), c && function() {
                                    var e, t = Object.keys(uT);

                                    function n(e) {
                                        var t = e.target;
                                        if (t) {
                                            var n = eH(t),
                                                r = Math.round(e.timeStamp);
                                            if (uA.set(r, n), uA.size > 50) {
                                                var a = uA.keys().next().value;
                                                void 0 !== a && uA.delete(a)
                                            }
                                        }
                                    }
                                    "undefined" == typeof window || (0, uE.w)() && (null == (e = ek.process) ? void 0 : e.type) !== "renderer" || t.forEach(function(e) {
                                        ek.addEventListener(e, n, {
                                            capture: !0,
                                            passive: !0
                                        })
                                    });
                                    var r = function(e) {
                                        var t = e.entries,
                                            n = nj(),
                                            r = n && nk(n);
                                        t.forEach(function(e) {
                                            if ("duration" in e) {
                                                var t = e.interactionId;
                                                if (null != t && !uI.has(t)) {
                                                    var n = e.target ? eH(e.target) : function(e) {
                                                        var t = Math.round(e.startTime),
                                                            n = uA.get(t);
                                                        if (!n)
                                                            for (var r = -5; r <= 5; r++) {
                                                                var a = uA.get(t + r);
                                                                if (a) {
                                                                    n = a;
                                                                    break
                                                                }
                                                            }
                                                        return n || "<unknown>"
                                                    }(e);
                                                    if (uw.length > 10) {
                                                        var a = uw.shift();
                                                        uI.delete(a)
                                                    }
                                                    uw.push(t), uI.set(t, {
                                                        span: r,
                                                        elementName: n
                                                    })
                                                }
                                            }
                                        })
                                    };
                                    i0("event", r), i0("first-input", r)
                                }(),
                                function(e, t) {
                                    var n = uz({}, uq, t),
                                        r = n.traceFetch,
                                        a = n.traceXHR,
                                        o = n.trackFetchStreamPerformance,
                                        i = n.shouldCreateSpanForRequest,
                                        u = n.enableHTTPTimings,
                                        c = n.tracePropagationTargets,
                                        l = n.onRequestSpanStart,
                                        s = n.onRequestSpanEnd,
                                        f = "function" == typeof i ? i : function(e) {
                                            return !0
                                        },
                                        d = function(e) {
                                            return function(e, t) {
                                                var n = eQ();
                                                if (n) {
                                                    try {
                                                        r = new URL(e, n), a = new URL(n).origin
                                                    } catch (e) {
                                                        return !1
                                                    }
                                                    var r, a, o = r.origin === a;
                                                    return t ? tF(r.toString(), t) || o && tF(r.pathname, t) : o
                                                }
                                                var i = !!e.match(/^\/(?!\/)/);
                                                return t ? tF(e, t) : i
                                            }(e, c)
                                        },
                                        p = {},
                                        m = e.getOptions().propagateTraceparent;
                                    r && (e.addEventProcessor(function(e) {
                                        return "transaction" === e.type && e.spans && e.spans.forEach(function(e) {
                                            if ("http.client" === e.op) {
                                                var t = uQ.get(e.span_id);
                                                t && (e.timestamp = t / 1e3, uQ.delete(e.span_id))
                                            }
                                        }), e
                                    }), o && (a$("fetch-body-resolved", function(e) {
                                        if (e.response) {
                                            var t = uH.get(e.response);
                                            t && e.endTimestamp && uQ.set(t, e.endTimestamp)
                                        }
                                    }), a0("fetch-body-resolved", function() {
                                        return or(oa)
                                    })), on(function(e) {
                                        var t = function(e, t, n, r, a) {
                                            if (e.fetchData) {
                                                var o = e.fetchData,
                                                    i = o.method,
                                                    u = o.url,
                                                    c = nr() && t(u);
                                                if (e.endTimestamp && c) {
                                                    var l, s, f, d, p, m = e.fetchData.__span;
                                                    if (!m) return;
                                                    var y = r[m];
                                                    y && (function(e, t) {
                                                        if (t.response) {
                                                            no(e, t.response.status);
                                                            var n, r, a = null == (r = t.response) || null == (n = r.headers) ? void 0 : n.get("content-length");
                                                            if (a) {
                                                                var o = parseInt(a);
                                                                o > 0 && e.setAttribute("http.response_content_length", o)
                                                            }
                                                        } else t.error && e.setStatus({
                                                            code: 2,
                                                            message: "internal_error"
                                                        });
                                                        e.end()
                                                    }(y, e), l = y, s = e, null == (p = (void 0 === (f = a) ? "undefined" : uW(f)) === "object" && null !== f ? f.onRequestSpanEnd : void 0) || p(l, {
                                                        headers: null == (d = s.response) ? void 0 : d.headers,
                                                        error: s.error
                                                    }), delete r[m]);
                                                    return
                                                }
                                                var v = (void 0 === a ? "undefined" : uW(a)) === "object" ? a : {
                                                        spanOrigin: a
                                                    },
                                                    b = v.spanOrigin,
                                                    h = v.propagateTraceparent,
                                                    g = !!nj(),
                                                    S = c && g ? rd(function(e, t, n) {
                                                        if (e.startsWith("data:")) {
                                                            var r = od(e);
                                                            return {
                                                                name: "".concat(t, " ").concat(r),
                                                                attributes: uG(e, void 0, t, n)
                                                            }
                                                        }
                                                        var a = os(e),
                                                            o = a ? function(e) {
                                                                if (ol(e)) return e.pathname;
                                                                var t = new URL(e);
                                                                return t.search = "", t.hash = "", ["80", "443"].includes(t.port) && (t.port = ""), t.password && (t.password = "%filtered%"), t.username && (t.username = "%filtered%"), t.toString()
                                                            }(a) : e;
                                                        return {
                                                            name: "".concat(t, " ").concat(o),
                                                            attributes: uG(e, a, t, n)
                                                        }
                                                    }(u, i, void 0 === b ? "auto.http.browser" : b)) : new nW;
                                                if (e.fetchData.__span = S.spanContext().spanId, r[S.spanContext().spanId] = S, n(e.fetchData.url)) {
                                                    var _ = e.args[0],
                                                        E = uX({}, e.args[1] || {}),
                                                        O = function(e, t, n, r) {
                                                            var a = uD({
                                                                    span: n,
                                                                    propagateTraceparent: r
                                                                }),
                                                                o = a["sentry-trace"],
                                                                i = a.baggage,
                                                                u = a.traceparent;
                                                            if (o) {
                                                                var c = t.headers || (eK(e) ? e.headers : void 0);
                                                                if (!c) return uX({}, a);
                                                                if (p = c, "undefined" != typeof Headers && eM(p, Headers)) {
                                                                    var l = new Headers(c);
                                                                    if (l.get("sentry-trace") || l.set("sentry-trace", o), r && u && !l.get("traceparent") && l.set("traceparent", u), i) {
                                                                        var s = l.get("baggage");
                                                                        s ? uB(s) || l.set("baggage", "".concat(s, ",").concat(i)) : l.set("baggage", i)
                                                                    }
                                                                    return l
                                                                }
                                                                if (Array.isArray(c)) {
                                                                    var f = uY(c);
                                                                    c.find(function(e) {
                                                                        return "sentry-trace" === e[0]
                                                                    }) || f.push(["sentry-trace", o]), r && u && !c.find(function(e) {
                                                                        return "traceparent" === e[0]
                                                                    }) && f.push(["traceparent", u]);
                                                                    var d = c.find(function(e) {
                                                                        return "baggage" === e[0] && uB(e[1])
                                                                    });
                                                                    return i && !d && f.push(["baggage", i]), f
                                                                } else {
                                                                    var p, m, y, v = "sentry-trace" in c ? c["sentry-trace"] : void 0,
                                                                        b = "traceparent" in c ? c.traceparent : void 0,
                                                                        h = "baggage" in c ? c.baggage : void 0,
                                                                        g = h ? Array.isArray(h) ? uY(h) : [h] : [],
                                                                        S = h && (Array.isArray(h) ? h.find(function(e) {
                                                                            return uB(e)
                                                                        }) : uB(h));
                                                                    i && !S && g.push(i);
                                                                    var _ = (m = uX({}, c), y = y = {
                                                                        "sentry-trace": null != v ? v : o,
                                                                        baggage: g.length > 0 ? g.join(",") : void 0
                                                                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(m, Object.getOwnPropertyDescriptors(y)) : (function(e, t) {
                                                                        var n = Object.keys(e);
                                                                        if (Object.getOwnPropertySymbols) {
                                                                            var r = Object.getOwnPropertySymbols(e);
                                                                            n.push.apply(n, r)
                                                                        }
                                                                        return n
                                                                    })(Object(y)).forEach(function(e) {
                                                                        Object.defineProperty(m, e, Object.getOwnPropertyDescriptor(y, e))
                                                                    }), m);
                                                                    return r && u && !b && (_.traceparent = u), _
                                                                }
                                                            }
                                                        }(_, E, nr() && g ? S : void 0, void 0 !== h && h);
                                                    O && (e.args[1] = E, E.headers = O)
                                                }
                                                var w = t1();
                                                if (w) {
                                                    var I = {
                                                        input: e.args,
                                                        response: e.response,
                                                        startTimestamp: e.startTimestamp,
                                                        endTimestamp: e.endTimestamp
                                                    };
                                                    w.emit("beforeOutgoingRequestSpan", S, I)
                                                }
                                                return S
                                            }
                                        }(e, f, d, p, {
                                            propagateTraceparent: m,
                                            onRequestSpanEnd: s
                                        });
                                        if (e.response && e.fetchData.__span && uH.set(e.response, e.fetchData.__span), t) {
                                            var n = uM(e.fetchData.url),
                                                r = n ? of(n).host : void 0;
                                            t.setAttributes({
                                                "http.url": n ? od(n) : void 0,
                                                "server.address": r
                                            }), u && u$(t), null == l || l(t, {
                                                headers: e.headers
                                            })
                                        }
                                    })), a && ob(function(e) {
                                        var t, n = function(e, t, n, r, a, o) {
                                            var i, u = e.xhr,
                                                c = null == u ? void 0 : u[ov];
                                            if (u && !u.__sentry_own_request__ && c) {
                                                var l, s, f, d, p, m, y = c.url,
                                                    v = c.method,
                                                    b = nr() && t(y);
                                                if (e.endTimestamp && b) {
                                                    var h = u.__sentry_xhr_span_id__;
                                                    if (!h) return;
                                                    var g = r[h];
                                                    g && void 0 !== c.status_code && (no(g, c.status_code), g.end(), null == o || o(g, {
                                                        headers: uJ(function(e) {
                                                            var t;
                                                            try {
                                                                t = e.getAllResponseHeaders()
                                                            } catch (t) {
                                                                return o6 && e8.error(t, "Failed to get xhr response headers", e), {}
                                                            }
                                                            return t ? t.split("\r\n").reduce(function(e, t) {
                                                                var n, r = (n = t.split(": "), function(e) {
                                                                        if (Array.isArray(e)) return e
                                                                    }(n) || function(e, t) {
                                                                        var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                                                        if (null != a) {
                                                                            var o = [],
                                                                                i = !0,
                                                                                u = !1;
                                                                            try {
                                                                                for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                                                                            } catch (e) {
                                                                                u = !0, r = e
                                                                            } finally {
                                                                                try {
                                                                                    i || null == a.return || a.return()
                                                                                } finally {
                                                                                    if (u) throw r
                                                                                }
                                                                            }
                                                                            return o
                                                                        }
                                                                    }(n, 2) || function(e, t) {
                                                                        if (e) {
                                                                            if ("string" == typeof e) return uU(e, 2);
                                                                            var n = Object.prototype.toString.call(e).slice(8, -1);
                                                                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                                                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return uU(e, t)
                                                                        }
                                                                    }(n, 2) || function() {
                                                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                                                    }()),
                                                                    a = r[0],
                                                                    o = r[1];
                                                                return o && (e[a.toLowerCase()] = o), e
                                                            }, {}) : {}
                                                        }(u)),
                                                        error: e.error
                                                    }), delete r[h]);
                                                    return
                                                }
                                                var S = uM(y),
                                                    _ = S ? of(S) : of(y),
                                                    E = od(y.split(/[?#]/, 1)[0]),
                                                    O = !!nj(),
                                                    w = b && O ? rd({
                                                        name: "".concat(v, " ").concat(E),
                                                        attributes: uz((uK(i = {
                                                            url: od(y),
                                                            type: "xhr",
                                                            "http.method": v,
                                                            "http.url": S ? od(S) : void 0,
                                                            "server.address": null == _ ? void 0 : _.host
                                                        }, t4, "auto.http.browser"), uK(i, t9, "http.client"), i), (null == _ ? void 0 : _.search) && {
                                                            "http.query": null == _ ? void 0 : _.search
                                                        }, (null == _ ? void 0 : _.hash) && {
                                                            "http.fragment": null == _ ? void 0 : _.hash
                                                        })
                                                    }) : new nW;
                                                u.__sentry_xhr_span_id__ = w.spanContext().spanId, r[u.__sentry_xhr_span_id__] = w, n(y) && (l = u, s = nr() && O ? w : void 0, d = (f = uD({
                                                    span: s,
                                                    propagateTraceparent: a
                                                }))["sentry-trace"], p = f.baggage, m = f.traceparent, d && function(e, t, n, r) {
                                                    var a, o = null == (a = e.__sentry_xhr_v3__) ? void 0 : a.request_headers;
                                                    if ((null == o || !o["sentry-trace"]) && e.setRequestHeader) try {
                                                        if (e.setRequestHeader("sentry-trace", t), !r || (null == o ? void 0 : o.traceparent) || e.setRequestHeader("traceparent", r), n) {
                                                            var i = null == o ? void 0 : o.baggage;
                                                            i && i.split(",").some(function(e) {
                                                                return e.trim().startsWith("sentry-")
                                                            }) || e.setRequestHeader("baggage", n)
                                                        }
                                                    } catch (e) {}
                                                }(l, d, p, m));
                                                var I = t1();
                                                return I && I.emit("beforeOutgoingRequestSpan", w, e), w
                                            }
                                        }(e, f, d, p, m, s);
                                        n && (u && u$(n), null == l || l(n, {
                                            headers: uJ(null == (t = e.xhr.__sentry_xhr_v3__) ? void 0 : t.request_headers)
                                        }))
                                    })
                                }(e, {
                                    traceFetch: _,
                                    traceXHR: E,
                                    trackFetchStreamPerformance: O,
                                    tracePropagationTargets: e.getOptions().tracePropagationTargets,
                                    shouldCreateSpanForRequest: w,
                                    enableHTTPTimings: I,
                                    onRequestSpanStart: V,
                                    onRequestSpanEnd: Z
                                })
                        }
                    }
                }({
                    detectRedirects: !0
                })],
                environment: null != dg ? dg : "staging",
                tracesSampleRate: dA,
                tracesSampler: dI ? void 0 : (j = cg(dA), function(e) {
                    if (void 0 !== e.parentSampled) return +!!e.parentSampled;
                    var t, n = (e.name || ("undefined" != typeof window ? window.location.pathname : "") || "").toLowerCase().replace(cl, "/");
                    return cs.test(n) && (t = cg(.1 * j)), cf.test(n) && (t = cg(.2 * j)), cd.test(n) && (t = cg(.2 * j)), cp.test(n) && (t = cg(.2 * j)), cm.test(n) && (t = .005), cy.test(n) && (t = .005), cv.test(n) && (t = 1), cb.test(n) && (t = 1), ch.test(n) && (t = .1), null != t ? t : j
                }),
                sampleRate: (R = dO < 0 ? 0 : dO > 1 ? 1 : dO, P = window.location.pathname.replace(/^\/[a-z]{2}(?:-[a-z]{2})\//i, "/"), void 0 !== (V = null == (x = Object.values({
                    PaymentTeamPagesRegex: {
                        pattern: /^\/(?:upgrades|redeem)(?:\/|$)/i,
                        sampleRate: 1
                    },
                    SpotlightPageRegex: {
                        pattern: /^\/spotlight\/.*/i,
                        sampleRate: 1
                    }
                }).find(function(e) {
                    return e.pattern.test(P)
                })) ? void 0 : x.sampleRate) ? V : R),
                replaysOnErrorSampleRate: dO,
                beforeSendTransaction: function(e) {
                    return ! function(e, t) {
                            try {
                                var n = function(e) {
                                    var t = null != (E = null == (y = e.contexts) ? void 0 : y.trace) ? E : {},
                                        n = null == (v = e.contexts) ? void 0 : v.otel,
                                        r = t.trace_id,
                                        a = t.span_id,
                                        o = t.parent_span_id;
                                    if (!r) return null;
                                    var i = (null == n ? void 0 : n.resource) ? cj([n.resource]) : cj([{
                                            "service.name": "web"
                                        }, e.environment ? {
                                            "deployment.environment": e.environment
                                        } : void 0, {
                                            "telemetry.sdk.name": "@sentry/browser"
                                        }, e.release ? {
                                            "telemetry.sdk.version": e.release
                                        } : void 0]),
                                        u = [],
                                        c = null == (h = e.contexts) || null == (b = h.trace) ? void 0 : b.op,
                                        l = null == (S = e.contexts) || null == (g = S.trace) ? void 0 : g.status,
                                        s = (null == n ? void 0 : n.attributes) ? cj([n.attributes]) : cj([e.tags, {
                                            "sentry.transaction": e.transaction
                                        }, {
                                            "sentry.op": c
                                        }, c ? {
                                            op: c
                                        } : void 0, e.platform ? {
                                            platform: e.platform
                                        } : void 0, e.release ? {
                                            release: e.release
                                        } : void 0, "boolean" == typeof t.sampled ? {
                                            sampled: t.sampled
                                        } : void 0]);
                                    u.push({
                                        traceId: r,
                                        spanId: null != a ? a : "0000000000000000",
                                        parentSpanId: o,
                                        name: null != (O = e.transaction) ? O : "unknown",
                                        kind: cR(c),
                                        startTimeUnixNano: ck(e.start_timestamp),
                                        endTimeUnixNano: ck(e.timestamp),
                                        attributes: s,
                                        status: cx(l)
                                    });
                                    var f = Array.isArray(e.spans) ? e.spans : [],
                                        d = !0,
                                        p = !1,
                                        m = void 0;
                                    try {
                                        for (var y, v, b, h, g, S, _, E, O, w, I = f[Symbol.iterator](); !(d = (w = I.next()).done); d = !0) {
                                            var A, T, N, k, j = w.value,
                                                x = null != (T = null != (A = j.description) ? A : j.op) ? T : "unknown",
                                                R = j.op,
                                                P = j.status,
                                                V = cj([j.data, j.tags, R ? {
                                                    op: R
                                                } : void 0, {
                                                    "sentry.op": R
                                                }]),
                                                Z = {
                                                    traceId: r,
                                                    spanId: null != (N = j.span_id) ? N : "0000000000000000",
                                                    parentSpanId: null != (k = j.parent_span_id) ? k : a,
                                                    name: x,
                                                    kind: cR(R),
                                                    startTimeUnixNano: ck(j.start_timestamp),
                                                    endTimeUnixNano: ck(j.timestamp),
                                                    attributes: V,
                                                    status: cx(P)
                                                };
                                            u.push(Z)
                                        }
                                    } catch (e) {
                                        p = !0, m = e
                                    } finally {
                                        try {
                                            d || null == I.return || I.return()
                                        } finally {
                                            if (p) throw m
                                        }
                                    }
                                    return {
                                        resourceSpans: [{
                                            resource: {
                                                attributes: i
                                            },
                                            scopeSpans: [{
                                                scope: {
                                                    name: "@sentry/browser",
                                                    version: null == (_ = e.sdk) ? void 0 : _.version
                                                },
                                                spans: u
                                            }]
                                        }]
                                    }
                                }(t);
                                if (null == n) return;
                                fetch(e, {
                                    method: "POST",
                                    body: JSON.stringify(n),
                                    headers: {
                                        "content-type": "application/json"
                                    }
                                }).then(function(e) {
                                    e.ok || console.error("[OTEL DEBUG] Failed to send:", e.status, e.statusText)
                                }, function(e) {
                                    console.error("[OTEL DEBUG] Fetch error:", e)
                                }).catch(function(e) {
                                    console.error("[OTEL DEBUG] Catch error:", e)
                                })
                            } catch (e) {
                                console.error("[OTEL DEBUG] sendToOtel error:", e)
                            }
                        }(dE, e),
                        function(e) {
                            if (!e.spans) return e;
                            var t, n, r = e.spans.filter(function(e) {
                                var t;
                                if ("http.client" === e.op || (null == (t = e.op) ? void 0 : t.startsWith("resource."))) {
                                    var n, r = null != (n = e.description) ? n : e.data.url;
                                    if ("string" == typeof r) return !(! function(e) {
                                        if (!e.includes("css.rbxcdn.com")) return !1;
                                        try {
                                            var t = new URL(e).pathname.toLowerCase();
                                            return cE.some(function(e) {
                                                return t.endsWith(e)
                                            })
                                        } catch (t) {
                                            return /\.woff2?(?:[?#]|$)/i.test(e)
                                        }
                                    }(r) && c_.some(function(e) {
                                        return r.includes(e)
                                    }))
                                }
                                return !0
                            });
                            return t = function(e) {
                                for (var t = 1; t < arguments.length; t++) {
                                    var n = null != arguments[t] ? arguments[t] : {},
                                        r = Object.keys(n);
                                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                                    }))), r.forEach(function(t) {
                                        var r;
                                        r = n[t], t in e ? Object.defineProperty(e, t, {
                                            value: r,
                                            enumerable: !0,
                                            configurable: !0,
                                            writable: !0
                                        }) : e[t] = r
                                    })
                                }
                                return e
                            }({}, e), n = n = {
                                spans: r
                            }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(e, t) {
                                var n = Object.keys(e);
                                if (Object.getOwnPropertySymbols) {
                                    var r = Object.getOwnPropertySymbols(e);
                                    n.push.apply(n, r)
                                }
                                return n
                            })(Object(n)).forEach(function(e) {
                                Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(n, e))
                            }), t
                        }(function(e) {
                            if (!e.spans) return e;
                            var t = e.spans.filter(function(e) {
                                return null == e.op || !cI.has(e.op)
                            });
                            return cw(cO({}, e), {
                                spans: t
                            })
                        }(function(e) {
                            if (!e.spans) return e;
                            var t = e.spans.filter(function(e) {
                                if ("http.client" !== e.op) return !0;
                                var t, n, r = "string" == typeof(n = null != (t = e.description) ? t : e.data.url) ? n : void 0;
                                return null == r || cS.some(function(e) {
                                    return e.test(r)
                                })
                            });
                            return cw(cO({}, e), {
                                spans: t
                            })
                        }(e)))
                },
                transport: function() {
                    var e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : it;
                    return e = function(e) {
                            function t() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                eP && e8.log.apply(e8, ["[Offline]:"].concat(function(e) {
                                    if (Array.isArray(e)) return u4(e)
                                }(t) || function(e) {
                                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(t) || function(e, t) {
                                    if (e) {
                                        if ("string" == typeof e) return u4(e, void 0);
                                        var n = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return u4(e, t)
                                    }
                                }(t) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()))
                            }
                            return function(n) {
                                var r, a = function(e) {
                                        r && clearTimeout(r), "number" != typeof(r = setTimeout(function() {
                                            return u6(function() {
                                                var e;
                                                return u7(this, function(n) {
                                                    switch (n.label) {
                                                        case 0:
                                                            return r = void 0, [4, c.shift()];
                                                        case 1:
                                                            return (e = n.sent()) && (t("Attempting to send previously queued event"), e[0].sent_at = new Date().toISOString(), i(e, !0).catch(function(e) {
                                                                t("Failed to retry sending", e)
                                                            })), [2]
                                                    }
                                                })
                                            })()
                                        }, e)) && r.unref && r.unref()
                                    },
                                    o = function() {
                                        r || (a(l), l = Math.min(2 * l, 36e5))
                                    },
                                    i = function(e) {
                                        var r = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                                        return u6(function() {
                                            var i, s, f, d, p, m;
                                            return u7(this, function(y) {
                                                switch (y.label) {
                                                    case 0:
                                                        if (!(!r && nQ(e, ["replay_event", "replay_recording"]))) return [3, 2];
                                                        return [4, c.push(e)];
                                                    case 1:
                                                        return y.sent(), a(100), [2, {}];
                                                    case 2:
                                                        if (y.trys.push([2, 6, , 14]), !(i = n.shouldSend)) return [3, 4];
                                                        return [4, n.shouldSend(e)];
                                                    case 3:
                                                        i = !1 === y.sent(), y.label = 4;
                                                    case 4:
                                                        if (i) throw Error("Envelope not sent because `shouldSend` callback returned false");
                                                        return [4, u.send(e)];
                                                    case 5:
                                                        if (s = y.sent(), f = 100, s) {
                                                            if (null == (d = s.headers) ? void 0 : d["retry-after"]) f = an(s.headers["retry-after"]);
                                                            else if (null == (p = s.headers) ? void 0 : p["x-sentry-rate-limits"]) f = 6e4;
                                                            else if ((s.statusCode || 0) >= 400) return [2, s]
                                                        }
                                                        return a(f), l = 5e3, [2, s];
                                                    case 6:
                                                        var v, b;
                                                        return [4, (v = m = y.sent(), b = l, !nQ(e, ["client_report"]) && (!n.shouldStore || n.shouldStore(e, v, b)))];
                                                    case 7:
                                                        if (!y.sent()) return [3, 12];
                                                        if (!r) return [3, 9];
                                                        return [4, c.unshift(e)];
                                                    case 8:
                                                        return y.sent(), [3, 11];
                                                    case 9:
                                                        return [4, c.push(e)];
                                                    case 10:
                                                        y.sent(), y.label = 11;
                                                    case 11:
                                                        return o(), t("Error sending. Event queued.", m), [2, {}];
                                                    case 12:
                                                        throw m;
                                                    case 13:
                                                        return [3, 14];
                                                    case 14:
                                                        return [2]
                                                }
                                            })
                                        })()
                                    },
                                    u = e(n);
                                if (!n.createStore) throw Error("No `createStore` function was provided");
                                var c = n.createStore(n),
                                    l = 5e3;
                                return n.flushAtStartup && o(), {
                                    send: i,
                                    flush: function(e) {
                                        return void 0 === e && (l = 5e3, a(100)), u.flush(e)
                                    }
                                }
                            }
                        }(t),
                        function(t) {
                            var n, r, a = e((n = function(e) {
                                for (var t = 1; t < arguments.length; t++) {
                                    var n = null != arguments[t] ? arguments[t] : {},
                                        r = Object.keys(n);
                                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                                    }))), r.forEach(function(t) {
                                        var r;
                                        r = n[t], t in e ? Object.defineProperty(e, t, {
                                            value: r,
                                            enumerable: !0,
                                            configurable: !0,
                                            writable: !0
                                        }) : e[t] = r
                                    })
                                }
                                return e
                            }({}, t), r = r = {
                                createStore: cu
                            }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(r)) : (function(e, t) {
                                var n = Object.keys(e);
                                if (Object.getOwnPropertySymbols) {
                                    var r = Object.getOwnPropertySymbols(e);
                                    n.push.apply(n, r)
                                }
                                return n
                            })(Object(r)).forEach(function(e) {
                                Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(r, e))
                            }), n));
                            return ek.addEventListener("online", function(e) {
                                return cn(function() {
                                    return ca(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return [4, a.flush()];
                                            case 1:
                                                return e.sent(), [2]
                                        }
                                    })
                                })()
                            }), a
                        }
                }(it)
            }),
            function(e, t, n) {
                if ("undefined" != typeof window) {
                    var r = {},
                        a = function(e) {
                            return function(t) {
                                r[e] = {
                                    value: t.value
                                }
                            }
                        };
                    lh(a("lcp")), ln(a("fcp")), l_(a("ttfb")), la(a("cls")), ly(a("inp"));
                    var o = !1,
                        i = function() {
                            if (!o) {
                                o = !0;
                                var a = function(e) {
                                    if (null == e.ttfb && 0 !== Object.keys(e).length && "undefined" != typeof performance) {
                                        var t = (n = performance.getEntriesByType("navigation"), function(e) {
                                            if (Array.isArray(e)) return e
                                        }(n) || function(e, t) {
                                            var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                            if (null != a) {
                                                var o = [],
                                                    i = !0,
                                                    u = !1;
                                                try {
                                                    for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                                                } catch (e) {
                                                    u = !0, r = e
                                                } finally {
                                                    try {
                                                        i || null == a.return || a.return()
                                                    } finally {
                                                        if (u) throw r
                                                    }
                                                }
                                                return o
                                            }
                                        }(n, 1) || function(e, t) {
                                            if (e) {
                                                if ("string" == typeof e) return dm(e, 1);
                                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return dm(e, t)
                                            }
                                        }(n, 1) || function() {
                                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                        }())[0];
                                        if (t && t.responseStart > 0) {
                                            var n, r, a = null != (r = t.activationStart) ? r : 0;
                                            return {
                                                value: Math.max(t.responseStart - a, 0)
                                            }
                                        }
                                    }
                                }(r);
                                a && (r.ttfb = a),
                                    function(e, t, n, r) {
                                        if (t) {
                                            var a, o, i, u, c, l = null == (a = t.lcp) ? void 0 : a.value,
                                                s = null == (o = t.fcp) ? void 0 : o.value,
                                                f = null == (i = t.ttfb) ? void 0 : i.value,
                                                d = null == (u = t.cls) ? void 0 : u.value,
                                                p = null == (c = t.inp) ? void 0 : c.value;
                                            if ([l, s, f, d, p].some(function(e) {
                                                    return "number" == typeof e
                                                })) try {
                                                ((null == eI || eA !== e) && (eI = new dp({
                                                    baseUrl: e
                                                }), eA = e), eI).sendEvent(fb, {
                                                    localTimestamp: new Date().toISOString(),
                                                    userEventBase: {
                                                        userId: function(e) {
                                                            var t;
                                                            if (null != e) return (void 0 === e ? "undefined" : e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) == "bigint" ? e : null != (t = "number" == typeof e ? lE(e) : lO(e)) ? t : void 0
                                                        }(n)
                                                    },
                                                    page: r,
                                                    url: "undefined" == typeof window ? void 0 : window.location.href,
                                                    lcpMs: l,
                                                    fcpMs: s,
                                                    ttfbMs: f,
                                                    cls: d,
                                                    inpMs: p
                                                }).catch(function() {})
                                            } catch (e) {
                                                console.error("[PERF] Failed to send web vitals:", e)
                                            }
                                        }
                                    }(e, r, t(), n())
                            }
                        };
                    document.addEventListener("visibilitychange", function() {
                        "hidden" === document.visibilityState && i()
                    }), window.addEventListener("pagehide", i)
                }
            }(cD().apiGatewayUrl, function() {
                return null == dT ? void 0 : dT.id
            }, function() {
                var e;
                return null == (e = dN()) ? void 0 : e.dataset.internalPageName
            }), document.addEventListener("DOMContentLoaded", function() {
                e = {
                    id: null != (n = null == dT || null == (t = dT.id) ? void 0 : t.toString()) ? n : "-1",
                    username: null != (r = null == dT ? void 0 : dT.name) ? r : "unknown"
                }, t$().setUser(e);
                var e, t, n, r, a = dN();
                (null == a ? void 0 : a.dataset.internalPageName) && rV("internal-page-name", a.dataset.internalPageName);
                var o = new MutationObserver(function(e) {
                    e.forEach(function(e) {
                        var t, n;
                        if ("attributes" === e.type && "data-internal-page-name" === e.attributeName && (t = e.target, null != (n = HTMLMetaElement) && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n)) {
                            var r = e.target.dataset.internalPageName;
                            r && rV("internal-page-name", r)
                        }
                    })
                });
                a && o.observe(a, {
                    attributes: !0,
                    attributeFilter: ["data-internal-page-name"]
                })
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Sentry");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/sentry-39a1527ee2cb15b0.js.map