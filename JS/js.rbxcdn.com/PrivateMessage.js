! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "2373f12bfa5170988e5d311e2654b655aa7d9424"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "c588b091-18df-446e-b311-ffdafdbafb67", e._sentryDebugIdIdentifier = "sentry-dbid-c588b091-18df-446e-b311-ffdafdbafb67")
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
                        for (var e = "", a = 0; a < arguments.length; a++) {
                            var i = arguments[a];
                            i && (e = o(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : t(e)) !== "object") return "";
                                if (Array.isArray(e)) return n.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var a = "";
                                for (var i in e) r.call(e, i) && e[i] && (a = o(a, i));
                                return a
                            }(i)))
                        }
                        return e
                    }

                    function o(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (n.default = n, e.exports = n) : "function" == typeof define && "object" === t(define.amd) && define.amd ? define("classnames", [], function() {
                        return n
                    }) : window.classNames = n
                }()
            },
            773: function(e, t) {
                "use strict";
                Object.defineProperty(t, "__esModule", {
                    value: !0
                });
                var r, n, o, a = {
                        exports: {}
                    },
                    i = a.exports = {};

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
                    f = !1,
                    p = -1;

                function d() {
                    f && o && (f = !1, o.length ? s = o.concat(s) : p = -1, s.length && h())
                }

                function h() {
                    if (!f) {
                        var e = c(d);
                        f = !0;
                        for (var t = s.length; t;) {
                            for (o = s, s = []; ++p < t;) o && o[p].run();
                            p = -1, t = s.length
                        }
                        o = null, f = !1,
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

                function y() {}
                i.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var r = 1; r < arguments.length; r++) t[r - 1] = arguments[r];
                    s.push(new m(e, t)), 1 !== s.length || f || c(h)
                }, m.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, i.title = "browser", i.browser = !0, i.env = {}, i.argv = [], i.version = "", i.versions = {}, i.on = b, i.addListener = b, i.once = b, i.off = b, i.removeListener = b, i.removeAllListeners = b, i.emit = b, i.prependListener = b, i.prependOnceListener = b, i.listeners = function(e) {
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
                var g = a.exports.browser,
                    v = a.exports.binding,
                    O = {},
                    w = "browser",
                    j = "browser",
                    S = "browser",
                    E = [],
                    x = {
                        nextTick: a.exports.nextTick,
                        title: a.exports.title,
                        browser: g,
                        env: a.exports.env,
                        argv: a.exports.argv,
                        version: a.exports.version,
                        versions: a.exports.versions,
                        on: a.exports.on,
                        addListener: a.exports.addListener,
                        once: a.exports.once,
                        off: a.exports.off,
                        removeListener: a.exports.removeListener,
                        removeAllListeners: a.exports.removeAllListeners,
                        emit: a.exports.emit,
                        emitWarning: y,
                        prependListener: a.exports.prependListener,
                        prependOnceListener: a.exports.prependOnceListener,
                        listeners: a.exports.listeners,
                        binding: v,
                        cwd: a.exports.cwd,
                        chdir: a.exports.chdir,
                        umask: a.exports.umask,
                        exit: y,
                        pid: 1,
                        features: O,
                        kill: y,
                        dlopen: y,
                        uptime: y,
                        memoryUsage: y,
                        uvCounters: y,
                        platform: w,
                        arch: j,
                        execPath: S,
                        execArgv: E
                    };
                t.addListener = a.exports.addListener, t.arch = j, t.argv = a.exports.argv, t.binding = v, t.browser = g, t.chdir = a.exports.chdir, t.cwd = a.exports.cwd, t.default = x, t.dlopen = y, t.emit = a.exports.emit, t.emitWarning = y, t.env = a.exports.env, t.execArgv = E, t.execPath = S, t.exit = y, t.features = O, t.kill = y, t.listeners = a.exports.listeners, t.memoryUsage = y, t.nextTick = a.exports.nextTick, t.off = a.exports.off, t.on = a.exports.on, t.once = a.exports.once, t.pid = 1, t.platform = w, t.prependListener = a.exports.prependListener, t.prependOnceListener = a.exports.prependOnceListener, t.removeAllListeners = a.exports.removeAllListeners, t.removeListener = a.exports.removeListener, t.title = a.exports.title, t.umask = a.exports.umask, t.uptime = y, t.uvCounters = y, t.version = a.exports.version, t.versions = a.exports.versions, e.exports = x
            }
        },
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
        }, r.ruid = "bundler=rspack@1.7.12",
        function() {
            "use strict";
            var e, t, n, o, a, i, l, u, c, s, f, p, d, h, m, b, y, g, v, O, w, j, S, E, x = window.ReactJSX,
                P = window.Roblox["core-scripts"].util.ready,
                A = r.n(P),
                I = window.Roblox["core-scripts"].react,
                k = window.React,
                N = r.n(k);

            function T(e, t) {
                var r = t && t.cache ? t.cache : B,
                    n = t && t.serializer ? t.serializer : _;
                return (t && t.strategy ? t.strategy : function(e, t) {
                    var r, n, o = 1 === e.length ? C : M;
                    return r = t.cache.create(), n = t.serializer, o.bind(this, e, r, n)
                })(e, {
                    cache: r,
                    serializer: n
                })
            }

            function C(e, t, r, n) {
                var o = null == n || "number" == typeof n || "boolean" == typeof n ? n : r(n),
                    a = t.get(o);
                return void 0 === a && (a = e.call(this, n), t.set(o, a)), a
            }

            function M(e, t, r) {
                var n = Array.prototype.slice.call(arguments, 3),
                    o = r(n),
                    a = t.get(o);
                return void 0 === a && (a = e.apply(this, n), t.set(o, a)), a
            }
            var _ = function() {
                    return JSON.stringify(arguments)
                },
                R = function() {
                    var e;

                    function t() {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        this.cache = Object.create(null)
                    }
                    return e = [{
                            key: "get",
                            value: function(e) {
                                return this.cache[e]
                            }
                        }, {
                            key: "set",
                            value: function(e, t) {
                                this.cache[e] = t
                            }
                        }],
                        function(e, t) {
                            for (var r = 0; r < t.length; r++) {
                                var n = t[r];
                                n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                            }
                        }(t.prototype, e), t
                }(),
                B = {
                    create: function() {
                        return new R
                    }
                },
                D = {
                    variadic: function(e, t) {
                        var r, n;
                        return r = t.cache.create(), n = t.serializer, M.bind(this, e, r, n)
                    },
                    monadic: function(e, t) {
                        var r, n;
                        return r = t.cache.create(), n = t.serializer, C.bind(this, e, r, n)
                    }
                };

            function H(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function L(e, t, r) {
                return (L = G() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && U(o, r.prototype), o
                }).apply(null, arguments)
            }

            function F(e) {
                return (F = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function U(e, t) {
                return (U = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function z(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (z = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return L(e, arguments, F(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), U(r, e)
                })(e)
            }

            function G() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (G = function() {
                    return !!e
                })()
            }
            var V = function(e) {
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function t(e, r) {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        var n, o, a, i = e;
                        return r && (i += ": " + r), n = t, o = [i], n = F(n), (a = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, G() ? Reflect.construct(n, o || [], F(this).constructor) : n.apply(this, o))).code = e, r && (a.originalMessage = r), a
                    }
                    return t.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: t,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && U(t, e), t
                }(z(Error)),
                K = ((t = K || {}).MISSING_MESSAGE = "MISSING_MESSAGE", t.MISSING_FORMAT = "MISSING_FORMAT", t.ENVIRONMENT_FALLBACK = "ENVIRONMENT_FALLBACK", t.INSUFFICIENT_PATH = "INSUFFICIENT_PATH", t.INVALID_MESSAGE = "INVALID_MESSAGE", t.INVALID_KEY = "INVALID_KEY", t.FORMATTING_ERROR = "FORMATTING_ERROR", t);

            function X(e, t) {
                return T(e, {
                    cache: {
                        create: function() {
                            return {
                                get: function(e) {
                                    return t[e]
                                },
                                set: function(e, r) {
                                    t[e] = r
                                }
                            }
                        }
                    },
                    strategy: D.variadic
                })
            }

            function W(e, t) {
                return X(function() {
                    for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                    return L(e, function(e) {
                        if (Array.isArray(e)) return H(e)
                    }(r) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(r) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return H(e, void 0);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return H(e, void 0)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())
                }, t)
            }

            function Z(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function $(e) {
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

            function Y(e, t) {
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
            var q = /(?:[Eec]{1,6}|G{1,5}|[Qq]{1,5}|(?:[yYur]+|U{1,5})|[ML]{1,5}|d{1,2}|D{1,3}|F{1}|[abB]{1,5}|[hkHK]{1,2}|w{1,2}|W{1}|m{1,2}|s{1,2}|[zZOvVxX]{1,4})(?=([^']*'[^']*')*[^']*$)/g,
                J = /[\t-\r \x85\u200E\u200F\u2028\u2029]/i,
                Q = /^\.(?:(0+)(\*)?|(#+)|(0+)(#+))$/g,
                ee = /^(@+)?(\+|#+)?[rs]?$/g,
                et = /(\*)(0+)|(#+)(0+)|(0+)/g,
                er = /^(0+)$/;

            function en(e) {
                var t = {};
                return "r" === e[e.length - 1] ? t.roundingPriority = "morePrecision" : "s" === e[e.length - 1] && (t.roundingPriority = "lessPrecision"), e.replace(ee, function(e, r, n) {
                    return "string" != typeof n ? (t.minimumSignificantDigits = r.length, t.maximumSignificantDigits = r.length) : "+" === n ? t.minimumSignificantDigits = r.length : "#" === r[0] ? t.maximumSignificantDigits = r.length : (t.minimumSignificantDigits = r.length, t.maximumSignificantDigits = r.length + ("string" == typeof n ? n.length : 0)), ""
                }), t
            }

            function eo(e) {
                switch (e) {
                    case "sign-auto":
                        return {
                            signDisplay: "auto"
                        };
                    case "sign-accounting":
                    case "()":
                        return {
                            currencySign: "accounting"
                        };
                    case "sign-always":
                    case "+!":
                        return {
                            signDisplay: "always"
                        };
                    case "sign-accounting-always":
                    case "()!":
                        return {
                            signDisplay: "always", currencySign: "accounting"
                        };
                    case "sign-except-zero":
                    case "+?":
                        return {
                            signDisplay: "exceptZero"
                        };
                    case "sign-accounting-except-zero":
                    case "()?":
                        return {
                            signDisplay: "exceptZero", currencySign: "accounting"
                        };
                    case "sign-never":
                    case "+_":
                        return {
                            signDisplay: "never"
                        }
                }
            }

            function ea(e) {
                var t = eo(e);
                return t || {}
            }

            function ei(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function el(e) {
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

            function eu(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function ec(e, t) {
                if (e) {
                    if ("string" == typeof e) return ei(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ei(e, t)
                }
            }
            var es = ((n = {})[n.EXPECT_ARGUMENT_CLOSING_BRACE = 1] = "EXPECT_ARGUMENT_CLOSING_BRACE", n[n.EMPTY_ARGUMENT = 2] = "EMPTY_ARGUMENT", n[n.MALFORMED_ARGUMENT = 3] = "MALFORMED_ARGUMENT", n[n.EXPECT_ARGUMENT_TYPE = 4] = "EXPECT_ARGUMENT_TYPE", n[n.INVALID_ARGUMENT_TYPE = 5] = "INVALID_ARGUMENT_TYPE", n[n.EXPECT_ARGUMENT_STYLE = 6] = "EXPECT_ARGUMENT_STYLE", n[n.INVALID_NUMBER_SKELETON = 7] = "INVALID_NUMBER_SKELETON", n[n.INVALID_DATE_TIME_SKELETON = 8] = "INVALID_DATE_TIME_SKELETON", n[n.EXPECT_NUMBER_SKELETON = 9] = "EXPECT_NUMBER_SKELETON", n[n.EXPECT_DATE_TIME_SKELETON = 10] = "EXPECT_DATE_TIME_SKELETON", n[n.UNCLOSED_QUOTE_IN_ARGUMENT_STYLE = 11] = "UNCLOSED_QUOTE_IN_ARGUMENT_STYLE", n[n.EXPECT_SELECT_ARGUMENT_OPTIONS = 12] = "EXPECT_SELECT_ARGUMENT_OPTIONS", n[n.EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE = 13] = "EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE", n[n.INVALID_PLURAL_ARGUMENT_OFFSET_VALUE = 14] = "INVALID_PLURAL_ARGUMENT_OFFSET_VALUE", n[n.EXPECT_SELECT_ARGUMENT_SELECTOR = 15] = "EXPECT_SELECT_ARGUMENT_SELECTOR", n[n.EXPECT_PLURAL_ARGUMENT_SELECTOR = 16] = "EXPECT_PLURAL_ARGUMENT_SELECTOR", n[n.EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT = 17] = "EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT", n[n.EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT = 18] = "EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT", n[n.INVALID_PLURAL_ARGUMENT_SELECTOR = 19] = "INVALID_PLURAL_ARGUMENT_SELECTOR", n[n.DUPLICATE_PLURAL_ARGUMENT_SELECTOR = 20] = "DUPLICATE_PLURAL_ARGUMENT_SELECTOR", n[n.DUPLICATE_SELECT_ARGUMENT_SELECTOR = 21] = "DUPLICATE_SELECT_ARGUMENT_SELECTOR", n[n.MISSING_OTHER_CLAUSE = 22] = "MISSING_OTHER_CLAUSE", n[n.INVALID_TAG = 23] = "INVALID_TAG", n[n.INVALID_TAG_NAME = 25] = "INVALID_TAG_NAME", n[n.UNMATCHED_CLOSING_TAG = 26] = "UNMATCHED_CLOSING_TAG", n[n.UNCLOSED_TAG = 27] = "UNCLOSED_TAG", n);

            function ef(e) {
                return !!(e && (void 0 === e ? "undefined" : eu(e)) === "object" && 0 === e.type)
            }

            function ep(e) {
                return !!(e && (void 0 === e ? "undefined" : eu(e)) === "object" && 1 === e.type)
            }
            var ed = /[ \xA0\u1680\u2000-\u200A\u202F\u205F\u3000]/,
                eh = {
                    "001": ["H", "h"],
                    419: ["h", "H", "hB", "hb"],
                    AC: ["H", "h", "hb", "hB"],
                    AD: ["H", "hB"],
                    AE: ["h", "hB", "hb", "H"],
                    AF: ["H", "hb", "hB", "h"],
                    AG: ["h", "hb", "H", "hB"],
                    AI: ["H", "h", "hb", "hB"],
                    AL: ["h", "H", "hB"],
                    AM: ["H", "hB"],
                    AO: ["H", "hB"],
                    AR: ["h", "H", "hB", "hb"],
                    AS: ["h", "H"],
                    AT: ["H", "hB"],
                    AU: ["h", "hb", "H", "hB"],
                    AW: ["H", "hB"],
                    AX: ["H"],
                    AZ: ["H", "hB", "h"],
                    BA: ["H", "hB", "h"],
                    BB: ["h", "hb", "H", "hB"],
                    BD: ["h", "hB", "H"],
                    BE: ["H", "hB"],
                    BF: ["H", "hB"],
                    BG: ["H", "hB", "h"],
                    BH: ["h", "hB", "hb", "H"],
                    BI: ["H", "h"],
                    BJ: ["H", "hB"],
                    BL: ["H", "hB"],
                    BM: ["h", "hb", "H", "hB"],
                    BN: ["hb", "hB", "h", "H"],
                    BO: ["h", "H", "hB", "hb"],
                    BQ: ["H"],
                    BR: ["H", "hB"],
                    BS: ["h", "hb", "H", "hB"],
                    BT: ["h", "H"],
                    BW: ["H", "h", "hb", "hB"],
                    BY: ["H", "h"],
                    BZ: ["H", "h", "hb", "hB"],
                    CA: ["h", "hb", "H", "hB"],
                    CC: ["H", "h", "hb", "hB"],
                    CD: ["hB", "H"],
                    CF: ["H", "h", "hB"],
                    CG: ["H", "hB"],
                    CH: ["H", "hB", "h"],
                    CI: ["H", "hB"],
                    CK: ["H", "h", "hb", "hB"],
                    CL: ["h", "H", "hB", "hb"],
                    CM: ["H", "h", "hB"],
                    CN: ["H", "hB", "hb", "h"],
                    CO: ["h", "H", "hB", "hb"],
                    CP: ["H"],
                    CR: ["h", "H", "hB", "hb"],
                    CU: ["h", "H", "hB", "hb"],
                    CV: ["H", "hB"],
                    CW: ["H", "hB"],
                    CX: ["H", "h", "hb", "hB"],
                    CY: ["h", "H", "hb", "hB"],
                    CZ: ["H"],
                    DE: ["H", "hB"],
                    DG: ["H", "h", "hb", "hB"],
                    DJ: ["h", "H"],
                    DK: ["H"],
                    DM: ["h", "hb", "H", "hB"],
                    DO: ["h", "H", "hB", "hb"],
                    DZ: ["h", "hB", "hb", "H"],
                    EA: ["H", "h", "hB", "hb"],
                    EC: ["h", "H", "hB", "hb"],
                    EE: ["H", "hB"],
                    EG: ["h", "hB", "hb", "H"],
                    EH: ["h", "hB", "hb", "H"],
                    ER: ["h", "H"],
                    ES: ["H", "hB", "h", "hb"],
                    ET: ["hB", "hb", "h", "H"],
                    FI: ["H"],
                    FJ: ["h", "hb", "H", "hB"],
                    FK: ["H", "h", "hb", "hB"],
                    FM: ["h", "hb", "H", "hB"],
                    FO: ["H", "h"],
                    FR: ["H", "hB"],
                    GA: ["H", "hB"],
                    GB: ["H", "h", "hb", "hB"],
                    GD: ["h", "hb", "H", "hB"],
                    GE: ["H", "hB", "h"],
                    GF: ["H", "hB"],
                    GG: ["H", "h", "hb", "hB"],
                    GH: ["h", "H"],
                    GI: ["H", "h", "hb", "hB"],
                    GL: ["H", "h"],
                    GM: ["h", "hb", "H", "hB"],
                    GN: ["H", "hB"],
                    GP: ["H", "hB"],
                    GQ: ["H", "hB", "h", "hb"],
                    GR: ["h", "H", "hb", "hB"],
                    GS: ["H", "h", "hb", "hB"],
                    GT: ["h", "H", "hB", "hb"],
                    GU: ["h", "hb", "H", "hB"],
                    GW: ["H", "hB"],
                    GY: ["h", "hb", "H", "hB"],
                    HK: ["h", "hB", "hb", "H"],
                    HN: ["h", "H", "hB", "hb"],
                    HR: ["H", "hB"],
                    HU: ["H", "h"],
                    IC: ["H", "h", "hB", "hb"],
                    ID: ["H"],
                    IE: ["H", "h", "hb", "hB"],
                    IL: ["H", "hB"],
                    IM: ["H", "h", "hb", "hB"],
                    IN: ["h", "H"],
                    IO: ["H", "h", "hb", "hB"],
                    IQ: ["h", "hB", "hb", "H"],
                    IR: ["hB", "H"],
                    IS: ["H"],
                    IT: ["H", "hB"],
                    JE: ["H", "h", "hb", "hB"],
                    JM: ["h", "hb", "H", "hB"],
                    JO: ["h", "hB", "hb", "H"],
                    JP: ["H", "K", "h"],
                    KE: ["hB", "hb", "H", "h"],
                    KG: ["H", "h", "hB", "hb"],
                    KH: ["hB", "h", "H", "hb"],
                    KI: ["h", "hb", "H", "hB"],
                    KM: ["H", "h", "hB", "hb"],
                    KN: ["h", "hb", "H", "hB"],
                    KP: ["h", "H", "hB", "hb"],
                    KR: ["h", "H", "hB", "hb"],
                    KW: ["h", "hB", "hb", "H"],
                    KY: ["h", "hb", "H", "hB"],
                    KZ: ["H", "hB"],
                    LA: ["H", "hb", "hB", "h"],
                    LB: ["h", "hB", "hb", "H"],
                    LC: ["h", "hb", "H", "hB"],
                    LI: ["H", "hB", "h"],
                    LK: ["H", "h", "hB", "hb"],
                    LR: ["h", "hb", "H", "hB"],
                    LS: ["h", "H"],
                    LT: ["H", "h", "hb", "hB"],
                    LU: ["H", "h", "hB"],
                    LV: ["H", "hB", "hb", "h"],
                    LY: ["h", "hB", "hb", "H"],
                    MA: ["H", "h", "hB", "hb"],
                    MC: ["H", "hB"],
                    MD: ["H", "hB"],
                    ME: ["H", "hB", "h"],
                    MF: ["H", "hB"],
                    MG: ["H", "h"],
                    MH: ["h", "hb", "H", "hB"],
                    MK: ["H", "h", "hb", "hB"],
                    ML: ["H"],
                    MM: ["hB", "hb", "H", "h"],
                    MN: ["H", "h", "hb", "hB"],
                    MO: ["h", "hB", "hb", "H"],
                    MP: ["h", "hb", "H", "hB"],
                    MQ: ["H", "hB"],
                    MR: ["h", "hB", "hb", "H"],
                    MS: ["H", "h", "hb", "hB"],
                    MT: ["H", "h"],
                    MU: ["H", "h"],
                    MV: ["H", "h"],
                    MW: ["h", "hb", "H", "hB"],
                    MX: ["h", "H", "hB", "hb"],
                    MY: ["hb", "hB", "h", "H"],
                    MZ: ["H", "hB"],
                    NA: ["h", "H", "hB", "hb"],
                    NC: ["H", "hB"],
                    NE: ["H"],
                    NF: ["H", "h", "hb", "hB"],
                    NG: ["H", "h", "hb", "hB"],
                    NI: ["h", "H", "hB", "hb"],
                    NL: ["H", "hB"],
                    NO: ["H", "h"],
                    NP: ["H", "h", "hB"],
                    NR: ["H", "h", "hb", "hB"],
                    NU: ["H", "h", "hb", "hB"],
                    NZ: ["h", "hb", "H", "hB"],
                    OM: ["h", "hB", "hb", "H"],
                    PA: ["h", "H", "hB", "hb"],
                    PE: ["h", "H", "hB", "hb"],
                    PF: ["H", "h", "hB"],
                    PG: ["h", "H"],
                    PH: ["h", "hB", "hb", "H"],
                    PK: ["h", "hB", "H"],
                    PL: ["H", "h"],
                    PM: ["H", "hB"],
                    PN: ["H", "h", "hb", "hB"],
                    PR: ["h", "H", "hB", "hb"],
                    PS: ["h", "hB", "hb", "H"],
                    PT: ["H", "hB"],
                    PW: ["h", "H"],
                    PY: ["h", "H", "hB", "hb"],
                    QA: ["h", "hB", "hb", "H"],
                    RE: ["H", "hB"],
                    RO: ["H", "hB"],
                    RS: ["H", "hB", "h"],
                    RU: ["H"],
                    RW: ["H", "h"],
                    SA: ["h", "hB", "hb", "H"],
                    SB: ["h", "hb", "H", "hB"],
                    SC: ["H", "h", "hB"],
                    SD: ["h", "hB", "hb", "H"],
                    SE: ["H"],
                    SG: ["h", "hb", "H", "hB"],
                    SH: ["H", "h", "hb", "hB"],
                    SI: ["H", "hB"],
                    SJ: ["H"],
                    SK: ["H"],
                    SL: ["h", "hb", "H", "hB"],
                    SM: ["H", "h", "hB"],
                    SN: ["H", "h", "hB"],
                    SO: ["h", "H"],
                    SR: ["H", "hB"],
                    SS: ["h", "hb", "H", "hB"],
                    ST: ["H", "hB"],
                    SV: ["h", "H", "hB", "hb"],
                    SX: ["H", "h", "hb", "hB"],
                    SY: ["h", "hB", "hb", "H"],
                    SZ: ["h", "hb", "H", "hB"],
                    TA: ["H", "h", "hb", "hB"],
                    TC: ["h", "hb", "H", "hB"],
                    TD: ["h", "H", "hB"],
                    TF: ["H", "h", "hB"],
                    TG: ["H", "hB"],
                    TH: ["H", "h"],
                    TJ: ["H", "h"],
                    TL: ["H", "hB", "hb", "h"],
                    TM: ["H", "h"],
                    TN: ["h", "hB", "hb", "H"],
                    TO: ["h", "H"],
                    TR: ["H", "hB"],
                    TT: ["h", "hb", "H", "hB"],
                    TW: ["hB", "hb", "h", "H"],
                    TZ: ["hB", "hb", "H", "h"],
                    UA: ["H", "hB", "h"],
                    UG: ["hB", "hb", "H", "h"],
                    UM: ["h", "hb", "H", "hB"],
                    US: ["h", "hb", "H", "hB"],
                    UY: ["h", "H", "hB", "hb"],
                    UZ: ["H", "hB", "h"],
                    VA: ["H", "h", "hB"],
                    VC: ["h", "hb", "H", "hB"],
                    VE: ["h", "H", "hB", "hb"],
                    VG: ["h", "hb", "H", "hB"],
                    VI: ["h", "hb", "H", "hB"],
                    VN: ["H", "h"],
                    VU: ["h", "H"],
                    WF: ["H", "hB"],
                    WS: ["h", "H"],
                    XK: ["H", "hB", "h"],
                    YE: ["h", "hB", "hb", "H"],
                    YT: ["H", "hB"],
                    ZA: ["H", "h", "hb", "hB"],
                    ZM: ["h", "hb", "H", "hB"],
                    ZW: ["H", "h"],
                    "af-ZA": ["H", "h", "hB", "hb"],
                    "ar-001": ["h", "hB", "hb", "H"],
                    "ca-ES": ["H", "h", "hB"],
                    "en-001": ["h", "hb", "H", "hB"],
                    "en-HK": ["h", "hb", "H", "hB"],
                    "en-IL": ["H", "h", "hb", "hB"],
                    "en-MY": ["h", "hb", "H", "hB"],
                    "es-BR": ["H", "h", "hB", "hb"],
                    "es-ES": ["H", "h", "hB", "hb"],
                    "es-GQ": ["H", "h", "hB", "hb"],
                    "fr-CA": ["H", "h", "hB"],
                    "gl-ES": ["H", "h", "hB"],
                    "gu-IN": ["hB", "hb", "h", "H"],
                    "hi-IN": ["hB", "h", "H"],
                    "it-CH": ["H", "h", "hB"],
                    "it-IT": ["H", "h", "hB"],
                    "kn-IN": ["hB", "h", "H"],
                    "ku-SY": ["H", "hB"],
                    "ml-IN": ["hB", "h", "H"],
                    "mr-IN": ["hB", "hb", "h", "H"],
                    "pa-IN": ["hB", "hb", "h", "H"],
                    "ta-IN": ["hB", "h", "hb", "H"],
                    "te-IN": ["hB", "h", "H"],
                    "zu-ZA": ["H", "hB", "hb", "h"]
                },
                em = new RegExp("^".concat(ed.source, "*")),
                eb = new RegExp("".concat(ed.source, "*$"));

            function ey(e, t) {
                return {
                    start: e,
                    end: t
                }
            }
            var eg = !!Object.fromEntries,
                ev = !!String.prototype.trimStart,
                eO = !!String.prototype.trimEnd,
                ew = eg ? Object.fromEntries : function(e) {
                    var t = {},
                        r = !0,
                        n = !1,
                        o = void 0;
                    try {
                        for (var a, i = e[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
                            var l, u = (l = a.value, function(e) {
                                    if (Array.isArray(e)) return e
                                }(l) || function(e) {
                                    var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                    if (null != n) {
                                        var o = [],
                                            a = !0,
                                            i = !1;
                                        try {
                                            for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                        } catch (e) {
                                            i = !0, r = e
                                        } finally {
                                            try {
                                                a || null == n.return || n.return()
                                            } finally {
                                                if (i) throw r
                                            }
                                        }
                                        return o
                                    }
                                }(l) || ec(l, 2) || function() {
                                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()),
                                c = u[0],
                                s = u[1];
                            t[c] = s
                        }
                    } catch (e) {
                        n = !0, o = e
                    } finally {
                        try {
                            r || null == i.return || i.return()
                        } finally {
                            if (n) throw o
                        }
                    }
                    return t
                },
                ej = ev ? function(e) {
                    return e.trimStart()
                } : function(e) {
                    return e.replace(em, "")
                },
                eS = eO ? function(e) {
                    return e.trimEnd()
                } : function(e) {
                    return e.replace(eb, "")
                },
                eE = RegExp("([^\\u0009-\\u000D\\u0020\\u0085\\u00A0\\u1680\\u2000-\\u200A\\u2028-\\u2029\\u202F\\u205F\\u3000\\u0021-\\u002F\\u003A-\\u0040\\u005B-\\u005E\\u0060\\u007B-\\u007E\\u00A1-\\u00A7\\u00A9\\u00AB-\\u00AC\\u00AE\\u00B0-\\u00B1\\u00B6\\u00BB\\u00BF\\u00D7\\u00F7\\u2010-\\u2027\\u2030-\\u203E\\u2041-\\u2053\\u2055-\\u205E\\u2190-\\u245F\\u2500-\\u2775\\u2794-\\u2BFF\\u2E00-\\u2E7F\\u3001-\\u3003\\u3008-\\u3020\\u3030\\uFD3E-\\uFD3F\\uFE45-\\uFE46]*)", "yu"),
                ex = function() {
                    var e;

                    function t(e) {
                        var r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        this.message = e, this.position = {
                            offset: 0,
                            line: 1,
                            column: 1
                        }, this.ignoreTag = !!r.ignoreTag, this.locale = r.locale, this.requiresOtherClause = !!r.requiresOtherClause, this.shouldParseSkeletons = !!r.shouldParseSkeletons
                    }
                    return e = [{
                            key: "parse",
                            value: function() {
                                if (0 !== this.offset()) throw Error("parser can only be used once");
                                if (this.message.length > 0) {
                                    var e = this.message.charCodeAt(0);
                                    if (35 !== e && 39 !== e && 60 !== e && 123 !== e && 125 !== e) {
                                        var t = function(e) {
                                            if (0 === e.length) return null;
                                            for (var t = 1, r = 1, n = 0; n < e.length;) {
                                                var o = e.charCodeAt(n);
                                                switch (o) {
                                                    case 35:
                                                    case 39:
                                                    case 60:
                                                    case 123:
                                                    case 125:
                                                        return null
                                                }
                                                if (10 === o) t++, r = 1, n++;
                                                else if (r++, o >= 55296 && o <= 56319 && n + 1 < e.length) {
                                                    var a = e.charCodeAt(n + 1);
                                                    n += a >= 56320 && a <= 57343 ? 2 : 1
                                                } else n++
                                            }
                                            return {
                                                offset: e.length,
                                                line: t,
                                                column: r
                                            }
                                        }(this.message);
                                        if (t) {
                                            var r = this.clonePosition();
                                            return this.position = t, {
                                                val: [{
                                                    type: 0,
                                                    value: this.message,
                                                    location: ey(r, this.clonePosition())
                                                }],
                                                err: null
                                            }
                                        }
                                    }
                                }
                                return this.parseMessage(0, "", !1)
                            }
                        }, {
                            key: "parseMessage",
                            value: function(e, t, r) {
                                for (var n = []; !this.isEOF();) {
                                    var o = this.char();
                                    if (123 === o) {
                                        var a = this.parseArgument(e, r);
                                        if (a.err) return a;
                                        n.push(a.val)
                                    } else if (125 === o && e > 0) break;
                                    else if (35 === o && ("plural" === t || "selectordinal" === t)) {
                                        var i = this.clonePosition();
                                        this.bump(), n.push({
                                            type: 7,
                                            location: ey(i, this.clonePosition())
                                        })
                                    } else if (60 !== o || this.ignoreTag || 47 !== this.peek())
                                        if (60 === o && !this.ignoreTag && eP(this.peek() || 0)) {
                                            var l = this.parseTag(e, t);
                                            if (l.err) return l;
                                            n.push(l.val)
                                        } else {
                                            var u = this.parseLiteral(e, t);
                                            if (u.err) return u;
                                            n.push(u.val)
                                        }
                                    else if (!r) return this.error(26, ey(this.clonePosition(), this.clonePosition()));
                                    else break
                                }
                                return {
                                    val: n,
                                    err: null
                                }
                            }
                        }, {
                            key: "parseTag",
                            value: function(e, t) {
                                var r = this.clonePosition();
                                this.bump();
                                var n = this.parseTagName();
                                if (this.bumpSpace(), this.bumpIf("/>")) return {
                                    val: {
                                        type: 0,
                                        value: "<".concat(n, "/>"),
                                        location: ey(r, this.clonePosition())
                                    },
                                    err: null
                                };
                                if (!this.bumpIf(">")) return this.error(23, ey(r, this.clonePosition()));
                                var o = this.parseMessage(e + 1, t, !0);
                                if (o.err) return o;
                                var a = o.val,
                                    i = this.clonePosition();
                                if (!this.bumpIf("</")) return this.error(27, ey(r, this.clonePosition()));
                                if (this.isEOF() || !eP(this.char())) return this.error(23, ey(i, this.clonePosition()));
                                var l = this.clonePosition();
                                return n !== this.parseTagName() ? this.error(26, ey(l, this.clonePosition())) : (this.bumpSpace(), this.bumpIf(">")) ? {
                                    val: {
                                        type: 8,
                                        value: n,
                                        children: a,
                                        location: ey(r, this.clonePosition())
                                    },
                                    err: null
                                } : this.error(23, ey(i, this.clonePosition()))
                            }
                        }, {
                            key: "parseTagName",
                            value: function() {
                                var e, t = this.offset();
                                for (this.bump(); !this.isEOF() && (45 === (e = this.char()) || 46 === e || e >= 48 && e <= 57 || 95 === e || e >= 97 && e <= 122 || e >= 65 && e <= 90 || 183 == e || e >= 192 && e <= 214 || e >= 216 && e <= 246 || e >= 248 && e <= 893 || e >= 895 && e <= 8191 || e >= 8204 && e <= 8205 || e >= 8255 && e <= 8256 || e >= 8304 && e <= 8591 || e >= 11264 && e <= 12271 || e >= 12289 && e <= 55295 || e >= 63744 && e <= 64975 || e >= 65008 && e <= 65533 || e >= 65536 && e <= 983039);) this.bump();
                                return this.message.slice(t, this.offset())
                            }
                        }, {
                            key: "parseLiteral",
                            value: function(e, t) {
                                for (var r = this.clonePosition(), n = "";;) {
                                    var o = this.tryParseQuote(t);
                                    if (o) {
                                        n += o;
                                        continue
                                    }
                                    var a = this.tryParseUnquoted(e, t);
                                    if (a) {
                                        n += a;
                                        continue
                                    }
                                    var i = this.tryParseLeftAngleBracket();
                                    if (i) {
                                        n += i;
                                        continue
                                    }
                                    break
                                }
                                return {
                                    val: {
                                        type: 0,
                                        value: n,
                                        location: ey(r, this.clonePosition())
                                    },
                                    err: null
                                }
                            }
                        }, {
                            key: "tryParseLeftAngleBracket",
                            value: function() {
                                var e;
                                return this.isEOF() || 60 !== this.char() || !this.ignoreTag && (eP(e = this.peek() || 0) || 47 === e) ? null : (this.bump(), "<")
                            }
                        }, {
                            key: "tryParseQuote",
                            value: function(e) {
                                if (this.isEOF() || 39 !== this.char()) return null;
                                switch (this.peek()) {
                                    case 39:
                                        return this.bump(), this.bump(), "'";
                                    case 123:
                                    case 60:
                                    case 62:
                                    case 125:
                                        break;
                                    case 35:
                                        if ("plural" === e || "selectordinal" === e) break;
                                        return null;
                                    default:
                                        return null
                                }
                                this.bump();
                                var t, r = [this.char()];
                                for (this.bump(); !this.isEOF();) {
                                    var n = this.char();
                                    if (39 === n)
                                        if (39 === this.peek()) r.push(39), this.bump();
                                        else {
                                            this.bump();
                                            break
                                        }
                                    else r.push(n);
                                    this.bump()
                                }
                                return (t = String).fromCodePoint.apply(t, function(e) {
                                    if (Array.isArray(e)) return ei(e)
                                }(r) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(r) || ec(r) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }())
                            }
                        }, {
                            key: "tryParseUnquoted",
                            value: function(e, t) {
                                if (this.isEOF()) return null;
                                var r = this.char();
                                return 60 === r || 123 === r || 35 === r && ("plural" === t || "selectordinal" === t) || 125 === r && e > 0 ? null : (this.bump(), String.fromCodePoint(r))
                            }
                        }, {
                            key: "parseArgument",
                            value: function(e, t) {
                                var r = this.clonePosition();
                                if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, ey(r, this.clonePosition()));
                                if (125 === this.char()) return this.bump(), this.error(2, ey(r, this.clonePosition()));
                                var n = this.parseIdentifierIfPossible().value;
                                if (!n) return this.error(3, ey(r, this.clonePosition()));
                                if (this.bumpSpace(), this.isEOF()) return this.error(1, ey(r, this.clonePosition()));
                                switch (this.char()) {
                                    case 125:
                                        return this.bump(), {
                                            val: {
                                                type: 1,
                                                value: n,
                                                location: ey(r, this.clonePosition())
                                            },
                                            err: null
                                        };
                                    case 44:
                                        if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, ey(r, this.clonePosition()));
                                        return this.parseArgumentOptions(e, t, n, r);
                                    default:
                                        return this.error(3, ey(r, this.clonePosition()))
                                }
                            }
                        }, {
                            key: "parseIdentifierIfPossible",
                            value: function() {
                                var e, t, r = this.clonePosition(),
                                    n = this.offset(),
                                    o = (e = this.message, eE.lastIndex = n, null != (t = eE.exec(e)[1]) ? t : ""),
                                    a = n + o.length;
                                return this.bumpTo(a), {
                                    value: o,
                                    location: ey(r, this.clonePosition())
                                }
                            }
                        }, {
                            key: "parseArgumentOptions",
                            value: function(e, t, r, n) {
                                var o = this.clonePosition(),
                                    a = this.parseIdentifierIfPossible().value,
                                    i = this.clonePosition();
                                switch (a) {
                                    case "":
                                        return this.error(4, ey(o, i));
                                    case "number":
                                    case "date":
                                    case "time":
                                        this.bumpSpace();
                                        var l, u = null;
                                        if (this.bumpIf(",")) {
                                            this.bumpSpace();
                                            var c = this.clonePosition(),
                                                s = this.parseSimpleArgStyleIfPossible();
                                            if (s.err) return s;
                                            var f = eS(s.val);
                                            if (0 === f.length) return this.error(6, ey(this.clonePosition(), this.clonePosition()));
                                            u = {
                                                style: f,
                                                styleLocation: ey(c, this.clonePosition())
                                            }
                                        }
                                        var p = this.tryParseArgumentClose(n);
                                        if (p.err) return p;
                                        var d = ey(n, this.clonePosition());
                                        if (u && u.style.startsWith("::")) {
                                            var h = ej(u.style.slice(2));
                                            if ("number" === a) {
                                                var m = this.parseNumberSkeletonFromString(h, u.styleLocation);
                                                if (m.err) return m;
                                                return {
                                                    val: {
                                                        type: 2,
                                                        value: r,
                                                        location: d,
                                                        style: m.val
                                                    },
                                                    err: null
                                                }
                                            }
                                            if (0 === h.length) return this.error(10, d);
                                            var b, y = h;
                                            return this.locale && (y = function(e, t) {
                                                for (var r = "", n = 0; n < e.length; n++) {
                                                    var o = e.charAt(n);
                                                    if ("j" === o) {
                                                        for (var a = 0; n + 1 < e.length && e.charAt(n + 1) === o;) a++, n++;
                                                        var i = 1 + (1 & a),
                                                            l = a < 2 ? 1 : 3 + (a >> 1),
                                                            u = function(e) {
                                                                var t, r = e.hourCycle;
                                                                if (void 0 === r && e.hourCycles && e.hourCycles.length && (r = e.hourCycles[0]), r) switch (r) {
                                                                    case "h24":
                                                                        return "k";
                                                                    case "h23":
                                                                        return "H";
                                                                    case "h12":
                                                                        return "h";
                                                                    case "h11":
                                                                        return "K";
                                                                    default:
                                                                        throw Error("Invalid hourCycle")
                                                                }
                                                                var n = e.language;
                                                                return "root" !== n && (t = e.maximize().region), (eh[t || ""] || eh[n || ""] || eh["".concat(n, "-001")] || eh["001"])[0]
                                                            }(t);
                                                        for (("H" == u || "k" == u) && (l = 0); l-- > 0;) r += "a";
                                                        for (; i-- > 0;) r = u + r
                                                    } else "J" === o ? r += "H" : r += o
                                                }
                                                return r
                                            }(h, this.locale)), {
                                                val: {
                                                    type: "date" === a ? 3 : 4,
                                                    value: r,
                                                    location: d,
                                                    style: {
                                                        type: 1,
                                                        pattern: y,
                                                        location: u.styleLocation,
                                                        parsedOptions: this.shouldParseSkeletons ? (b = {}, y.replace(q, function(e) {
                                                            var t = e.length;
                                                            switch (e[0]) {
                                                                case "G":
                                                                    b.era = 4 === t ? "long" : 5 === t ? "narrow" : "short";
                                                                    break;
                                                                case "y":
                                                                    b.year = 2 === t ? "2-digit" : "numeric";
                                                                    break;
                                                                case "Y":
                                                                case "u":
                                                                case "U":
                                                                case "r":
                                                                    throw RangeError("`Y/u/U/r` (year) patterns are not supported, use `y` instead");
                                                                case "q":
                                                                case "Q":
                                                                    throw RangeError("`q/Q` (quarter) patterns are not supported");
                                                                case "M":
                                                                case "L":
                                                                    b.month = ["numeric", "2-digit", "short", "long", "narrow"][t - 1];
                                                                    break;
                                                                case "w":
                                                                case "W":
                                                                    throw RangeError("`w/W` (week) patterns are not supported");
                                                                case "d":
                                                                    b.day = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "D":
                                                                case "F":
                                                                case "g":
                                                                    throw RangeError("`D/F/g` (day) patterns are not supported, use `d` instead");
                                                                case "E":
                                                                    b.weekday = 4 === t ? "long" : 5 === t ? "narrow" : "short";
                                                                    break;
                                                                case "e":
                                                                    if (t < 4) throw RangeError("`e..eee` (weekday) patterns are not supported");
                                                                    b.weekday = ["short", "long", "narrow", "short"][t - 4];
                                                                    break;
                                                                case "c":
                                                                    if (t < 4) throw RangeError("`c..ccc` (weekday) patterns are not supported");
                                                                    b.weekday = ["short", "long", "narrow", "short"][t - 4];
                                                                    break;
                                                                case "a":
                                                                    b.hour12 = !0;
                                                                    break;
                                                                case "b":
                                                                case "B":
                                                                    throw RangeError("`b/B` (period) patterns are not supported, use `a` instead");
                                                                case "h":
                                                                    b.hourCycle = "h12", b.hour = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "H":
                                                                    b.hourCycle = "h23", b.hour = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "K":
                                                                    b.hourCycle = "h11", b.hour = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "k":
                                                                    b.hourCycle = "h24", b.hour = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "j":
                                                                case "J":
                                                                case "C":
                                                                    throw RangeError("`j/J/C` (hour) patterns are not supported, use `h/H/K/k` instead");
                                                                case "m":
                                                                    b.minute = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "s":
                                                                    b.second = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "S":
                                                                case "A":
                                                                    throw RangeError("`S/A` (second) patterns are not supported, use `s` instead");
                                                                case "z":
                                                                    b.timeZoneName = t < 4 ? "short" : "long";
                                                                    break;
                                                                case "Z":
                                                                case "O":
                                                                case "v":
                                                                case "V":
                                                                case "X":
                                                                case "x":
                                                                    throw RangeError("`Z/O/v/V/X/x` (timeZone) patterns are not supported, use `z` instead")
                                                            }
                                                            return ""
                                                        }), b) : {}
                                                    }
                                                },
                                                err: null
                                            }
                                        }
                                        return {
                                            val: {
                                                type: "number" === a ? 2 : "date" === a ? 3 : 4,
                                                value: r,
                                                location: d,
                                                style: null != (l = null == u ? void 0 : u.style) ? l : null
                                            }, err: null
                                        };
                                    case "plural":
                                    case "selectordinal":
                                    case "select":
                                        var g = this.clonePosition();
                                        if (this.bumpSpace(), !this.bumpIf(",")) return this.error(12, ey(g, el({}, g)));
                                        this.bumpSpace();
                                        var v = this.parseIdentifierIfPossible(),
                                            O = 0;
                                        if ("select" !== a && "offset" === v.value) {
                                            if (!this.bumpIf(":")) return this.error(13, ey(this.clonePosition(), this.clonePosition()));
                                            this.bumpSpace();
                                            var w = this.tryParseDecimalInteger(13, 14);
                                            if (w.err) return w;
                                            this.bumpSpace(), v = this.parseIdentifierIfPossible(), O = w.val
                                        }
                                        var j = this.tryParsePluralOrSelectOptions(e, a, t, v);
                                        if (j.err) return j;
                                        var S = this.tryParseArgumentClose(n);
                                        if (S.err) return S;
                                        var E = ey(n, this.clonePosition());
                                        if ("select" === a) return {
                                            val: {
                                                type: 5,
                                                value: r,
                                                options: ew(j.val),
                                                location: E
                                            },
                                            err: null
                                        };
                                        return {
                                            val: {
                                                type: 6,
                                                value: r,
                                                options: ew(j.val),
                                                offset: O,
                                                pluralType: "plural" === a ? "cardinal" : "ordinal",
                                                location: E
                                            }, err: null
                                        };
                                    default:
                                        return this.error(5, ey(o, i))
                                }
                            }
                        }, {
                            key: "tryParseArgumentClose",
                            value: function(e) {
                                return this.isEOF() || 125 !== this.char() ? this.error(1, ey(e, this.clonePosition())) : (this.bump(), {
                                    val: !0,
                                    err: null
                                })
                            }
                        }, {
                            key: "parseSimpleArgStyleIfPossible",
                            value: function() {
                                for (var e = 0, t = this.clonePosition(); !this.isEOF();) switch (this.char()) {
                                    case 39:
                                        this.bump();
                                        var r = this.clonePosition();
                                        if (!this.bumpUntil("'")) return this.error(11, ey(r, this.clonePosition()));
                                        this.bump();
                                        break;
                                    case 123:
                                        e += 1, this.bump();
                                        break;
                                    case 125:
                                        if (!(e > 0)) return {
                                            val: this.message.slice(t.offset, this.offset()),
                                            err: null
                                        };
                                        e -= 1;
                                        break;
                                    default:
                                        this.bump()
                                }
                                return {
                                    val: this.message.slice(t.offset, this.offset()),
                                    err: null
                                }
                            }
                        }, {
                            key: "parseNumberSkeletonFromString",
                            value: function(e, t) {
                                var r = [];
                                try {
                                    r = function(e) {
                                        if (0 === e.length) throw Error("Number skeleton cannot be empty");
                                        var t = e.split(J).filter(function(e) {
                                                return e.length > 0
                                            }),
                                            r = [],
                                            n = !0,
                                            o = !1,
                                            a = void 0;
                                        try {
                                            for (var i, l = t[Symbol.iterator](); !(n = (i = l.next()).done); n = !0) {
                                                var u = i.value.split("/");
                                                if (0 === u.length) throw Error("Invalid number skeleton");
                                                var c = function(e) {
                                                        if (Array.isArray(e)) return e
                                                    }(u) || function(e) {
                                                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                                    }(u) || function(e) {
                                                        if (e) {
                                                            if ("string" == typeof e) return Z(e, void 0);
                                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return Z(e, void 0)
                                                        }
                                                    }(u) || function() {
                                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                                    }(),
                                                    s = c[0],
                                                    f = c.slice(1),
                                                    p = !0,
                                                    d = !1,
                                                    h = void 0;
                                                try {
                                                    for (var m, b = f[Symbol.iterator](); !(p = (m = b.next()).done); p = !0) {
                                                        var y = m.value;
                                                        if (0 === y.length) throw Error("Invalid number skeleton")
                                                    }
                                                } catch (e) {
                                                    d = !0, h = e
                                                } finally {
                                                    try {
                                                        p || null == b.return || b.return()
                                                    } finally {
                                                        if (d) throw h
                                                    }
                                                }
                                                r.push({
                                                    stem: s,
                                                    options: f
                                                })
                                            }
                                        } catch (e) {
                                            o = !0, a = e
                                        } finally {
                                            try {
                                                n || null == l.return || l.return()
                                            } finally {
                                                if (o) throw a
                                            }
                                        }
                                        return r
                                    }(e)
                                } catch (e) {
                                    return this.error(7, t)
                                }
                                return {
                                    val: {
                                        type: 0,
                                        tokens: r,
                                        location: t,
                                        parsedOptions: this.shouldParseSkeletons ? function(e) {
                                            var t = {},
                                                r = !0,
                                                n = !1,
                                                o = void 0;
                                            try {
                                                for (var a, i = e[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
                                                    var l = a.value;
                                                    switch (l.stem) {
                                                        case "percent":
                                                        case "%":
                                                            t.style = "percent";
                                                            continue;
                                                        case "%x100":
                                                            t.style = "percent", t.scale = 100;
                                                            continue;
                                                        case "currency":
                                                            t.style = "currency", t.currency = l.options[0];
                                                            continue;
                                                        case "group-off":
                                                        case ",_":
                                                            t.useGrouping = !1;
                                                            continue;
                                                        case "precision-integer":
                                                        case ".":
                                                            t.maximumFractionDigits = 0;
                                                            continue;
                                                        case "measure-unit":
                                                        case "unit":
                                                            t.style = "unit", t.unit = l.options[0].replace(/^(.*?)-/, "");
                                                            continue;
                                                        case "compact-short":
                                                        case "K":
                                                            t.notation = "compact", t.compactDisplay = "short";
                                                            continue;
                                                        case "compact-long":
                                                        case "KK":
                                                            t.notation = "compact", t.compactDisplay = "long";
                                                            continue;
                                                        case "scientific":
                                                            t = $(Y($({}, t), {
                                                                notation: "scientific"
                                                            }), l.options.reduce(function(e, t) {
                                                                return $({}, e, ea(t))
                                                            }, {}));
                                                            continue;
                                                        case "engineering":
                                                            t = $(Y($({}, t), {
                                                                notation: "engineering"
                                                            }), l.options.reduce(function(e, t) {
                                                                return $({}, e, ea(t))
                                                            }, {}));
                                                            continue;
                                                        case "notation-simple":
                                                            t.notation = "standard";
                                                            continue;
                                                        case "unit-width-narrow":
                                                            t.currencyDisplay = "narrowSymbol", t.unitDisplay = "narrow";
                                                            continue;
                                                        case "unit-width-short":
                                                            t.currencyDisplay = "code", t.unitDisplay = "short";
                                                            continue;
                                                        case "unit-width-full-name":
                                                            t.currencyDisplay = "name", t.unitDisplay = "long";
                                                            continue;
                                                        case "unit-width-iso-code":
                                                            t.currencyDisplay = "symbol";
                                                            continue;
                                                        case "scale":
                                                            t.scale = parseFloat(l.options[0]);
                                                            continue;
                                                        case "rounding-mode-floor":
                                                            t.roundingMode = "floor";
                                                            continue;
                                                        case "rounding-mode-ceiling":
                                                            t.roundingMode = "ceil";
                                                            continue;
                                                        case "rounding-mode-down":
                                                            t.roundingMode = "trunc";
                                                            continue;
                                                        case "rounding-mode-up":
                                                            t.roundingMode = "expand";
                                                            continue;
                                                        case "rounding-mode-half-even":
                                                            t.roundingMode = "halfEven";
                                                            continue;
                                                        case "rounding-mode-half-down":
                                                            t.roundingMode = "halfTrunc";
                                                            continue;
                                                        case "rounding-mode-half-up":
                                                            t.roundingMode = "halfExpand";
                                                            continue;
                                                        case "integer-width":
                                                            if (l.options.length > 1) throw RangeError("integer-width stems only accept a single optional option");
                                                            l.options[0].replace(et, function(e, r, n, o, a, i) {
                                                                if (r) t.minimumIntegerDigits = n.length;
                                                                else if (o && a) throw Error("We currently do not support maximum integer digits");
                                                                else if (i) throw Error("We currently do not support exact integer digits");
                                                                return ""
                                                            });
                                                            continue
                                                    }
                                                    if (er.test(l.stem)) {
                                                        t.minimumIntegerDigits = l.stem.length;
                                                        continue
                                                    }
                                                    if (Q.test(l.stem)) {
                                                        if (l.options.length > 1) throw RangeError("Fraction-precision stems only accept a single optional option");
                                                        l.stem.replace(Q, function(e, r, n, o, a, i) {
                                                            return "*" === n ? t.minimumFractionDigits = r.length : o && "#" === o[0] ? t.maximumFractionDigits = o.length : a && i ? (t.minimumFractionDigits = a.length, t.maximumFractionDigits = a.length + i.length) : (t.minimumFractionDigits = r.length, t.maximumFractionDigits = r.length), ""
                                                        });
                                                        var u = l.options[0];
                                                        "w" === u ? t = Y($({}, t), {
                                                            trailingZeroDisplay: "stripIfInteger"
                                                        }) : u && (t = $({}, t, en(u)));
                                                        continue
                                                    }
                                                    if (ee.test(l.stem)) {
                                                        t = $({}, t, en(l.stem));
                                                        continue
                                                    }
                                                    var c = eo(l.stem);
                                                    c && (t = $({}, t, c));
                                                    var s = function(e) {
                                                        var t;
                                                        if ("E" === e[0] && "E" === e[1] ? (t = {
                                                                notation: "engineering"
                                                            }, e = e.slice(2)) : "E" === e[0] && (t = {
                                                                notation: "scientific"
                                                            }, e = e.slice(1)), t) {
                                                            var r = e.slice(0, 2);
                                                            if ("+!" === r ? (t.signDisplay = "always", e = e.slice(2)) : "+?" === r && (t.signDisplay = "exceptZero", e = e.slice(2)), !er.test(e)) throw Error("Malformed concise eng/scientific notation");
                                                            t.minimumIntegerDigits = e.length
                                                        }
                                                        return t
                                                    }(l.stem);
                                                    s && (t = $({}, t, s))
                                                }
                                            } catch (e) {
                                                n = !0, o = e
                                            } finally {
                                                try {
                                                    r || null == i.return || i.return()
                                                } finally {
                                                    if (n) throw o
                                                }
                                            }
                                            return t
                                        }(r) : {}
                                    },
                                    err: null
                                }
                            }
                        }, {
                            key: "tryParsePluralOrSelectOptions",
                            value: function(e, t, r, n) {
                                for (var o = !1, a = [], i = new Set, l = n.value, u = n.location;;) {
                                    if (0 === l.length) {
                                        var c, s = this.clonePosition();
                                        if ("select" !== t && this.bumpIf("=")) {
                                            var f = this.tryParseDecimalInteger(16, 19);
                                            if (f.err) return f;
                                            u = ey(s, this.clonePosition()), l = this.message.slice(s.offset, this.offset())
                                        } else break
                                    }
                                    if (i.has(l)) return this.error("select" === t ? 21 : 20, u);
                                    "other" === l && (o = !0), this.bumpSpace();
                                    var p = this.clonePosition();
                                    if (!this.bumpIf("{")) return this.error("select" === t ? 17 : 18, ey(this.clonePosition(), this.clonePosition()));
                                    var d = this.parseMessage(e + 1, t, r);
                                    if (d.err) return d;
                                    var h = this.tryParseArgumentClose(p);
                                    if (h.err) return h;
                                    a.push([l, {
                                        value: d.val,
                                        location: ey(p, this.clonePosition())
                                    }]), i.add(l), this.bumpSpace(), l = (c = this.parseIdentifierIfPossible()).value, u = c.location
                                }
                                return 0 === a.length ? this.error("select" === t ? 15 : 16, ey(this.clonePosition(), this.clonePosition())) : this.requiresOtherClause && !o ? this.error(22, ey(this.clonePosition(), this.clonePosition())) : {
                                    val: a,
                                    err: null
                                }
                            }
                        }, {
                            key: "tryParseDecimalInteger",
                            value: function(e, t) {
                                var r = 1,
                                    n = this.clonePosition();
                                this.bumpIf("+") || this.bumpIf("-") && (r = -1);
                                for (var o = !1, a = 0; !this.isEOF();) {
                                    var i = this.char();
                                    if (i >= 48 && i <= 57) o = !0, a = 10 * a + (i - 48), this.bump();
                                    else break
                                }
                                var l = ey(n, this.clonePosition());
                                return o ? Number.isSafeInteger(a *= r) ? {
                                    val: a,
                                    err: null
                                } : this.error(t, l) : this.error(e, l)
                            }
                        }, {
                            key: "offset",
                            value: function() {
                                return this.position.offset
                            }
                        }, {
                            key: "isEOF",
                            value: function() {
                                return this.offset() === this.message.length
                            }
                        }, {
                            key: "clonePosition",
                            value: function() {
                                return {
                                    offset: this.position.offset,
                                    line: this.position.line,
                                    column: this.position.column
                                }
                            }
                        }, {
                            key: "char",
                            value: function() {
                                var e = this.position.offset;
                                if (e >= this.message.length) throw Error("out of bound");
                                var t = this.message.codePointAt(e);
                                if (void 0 === t) throw Error("Offset ".concat(e, " is at invalid UTF-16 code unit boundary"));
                                return t
                            }
                        }, {
                            key: "error",
                            value: function(e, t) {
                                return {
                                    val: null,
                                    err: {
                                        kind: e,
                                        message: this.message,
                                        location: t
                                    }
                                }
                            }
                        }, {
                            key: "bump",
                            value: function() {
                                if (!this.isEOF()) {
                                    var e = this.char();
                                    10 === e ? (this.position.line += 1, this.position.column = 1, this.position.offset += 1) : (this.position.column += 1, this.position.offset += e < 65536 ? 1 : 2)
                                }
                            }
                        }, {
                            key: "bumpIf",
                            value: function(e) {
                                if (this.message.startsWith(e, this.offset())) {
                                    for (var t = 0; t < e.length; t++) this.bump();
                                    return !0
                                }
                                return !1
                            }
                        }, {
                            key: "bumpUntil",
                            value: function(e) {
                                var t = this.offset(),
                                    r = this.message.indexOf(e, t);
                                return r >= 0 ? (this.bumpTo(r), !0) : (this.bumpTo(this.message.length), !1)
                            }
                        }, {
                            key: "bumpTo",
                            value: function(e) {
                                if (this.offset() > e) throw Error("targetOffset ".concat(e, " must be greater than or equal to the current offset ").concat(this.offset()));
                                for (e = Math.min(e, this.message.length);;) {
                                    var t = this.offset();
                                    if (t === e) break;
                                    if (t > e) throw Error("targetOffset ".concat(e, " is at invalid UTF-16 code unit boundary"));
                                    if (this.bump(), this.isEOF()) break
                                }
                            }
                        }, {
                            key: "bumpSpace",
                            value: function() {
                                for (var e; !this.isEOF() && ((e = this.char()) >= 9 && e <= 13 || 32 === e || 133 === e || e >= 8206 && e <= 8207 || 8232 === e || 8233 === e);) this.bump()
                            }
                        }, {
                            key: "peek",
                            value: function() {
                                if (this.isEOF()) return null;
                                var e, t = this.char(),
                                    r = this.offset();
                                return null != (e = this.message.charCodeAt(r + (t >= 65536 ? 2 : 1))) ? e : null
                            }
                        }],
                        function(e, t) {
                            for (var r = 0; r < t.length; r++) {
                                var n = t[r];
                                n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                            }
                        }(t.prototype, e), t
                }();

            function eP(e) {
                return e >= 97 && e <= 122 || e >= 65 && e <= 90
            }

            function eA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eI(e, t, r) {
                return t = e_(t),
                    function(e, t) {
                        if (t && ("object" === eL(t) || "function" == typeof t)) return t;
                        if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                        return e
                    }(e, eU() ? Reflect.construct(t, r || [], e_(e).constructor) : t.apply(e, r))
            }

            function ek(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function eN(e, t, r) {
                return (eN = eU() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && eD(o, r.prototype), o
                }).apply(null, arguments)
            }

            function eT(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function eC(e, t, r) {
                return t && eT(e.prototype, t), r && eT(e, r), e
            }

            function eM() {
                return (eM = Object.assign || function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var r = arguments[t];
                        for (var n in r) Object.prototype.hasOwnProperty.call(r, n) && (e[n] = r[n])
                    }
                    return e
                }).apply(this, arguments)
            }

            function e_(e) {
                return (e_ = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function eR(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && eD(e, t)
            }

            function eB(e) {
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

            function eD(e, t) {
                return (eD = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function eH(e) {
                return function(e) {
                    if (Array.isArray(e)) return eA(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return eA(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return eA(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eL(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function eF(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (eF = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return eN(e, arguments, e_(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), eD(r, e)
                })(e)
            }

            function eU() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (eU = function() {
                    return !!e
                })()
            }
            var ez = function(e) {
                    function t(e, r, n) {
                        var o;
                        return ek(this, t), (o = eI(this, t, [e])).code = r, o.originalMessage = n, o
                    }
                    return eR(t, e), eC(t, [{
                        key: "toString",
                        value: function() {
                            return "[formatjs Error: ".concat(this.code, "] ").concat(this.message)
                        }
                    }]), t
                }(eF(Error)),
                eG = function(e) {
                    function t(e, r, n, o) {
                        return ek(this, t), eI(this, t, ['Invalid values for "'.concat(e, '": "').concat(r, '". Options are "').concat(Object.keys(n).join('", "'), '"'), "INVALID_VALUE", o])
                    }
                    return eR(t, e), t
                }(ez),
                eV = function(e) {
                    function t(e, r, n) {
                        return ek(this, t), eI(this, t, ['Value for "'.concat(e, '" must be of type ').concat(r), "INVALID_VALUE", n])
                    }
                    return eR(t, e), t
                }(ez),
                eK = function(e) {
                    function t(e, r) {
                        return ek(this, t), eI(this, t, ['The intl string context variable "'.concat(e, '" was not provided to the string "').concat(r, '"'), "MISSING_VALUE", r])
                    }
                    return eR(t, e), t
                }(ez);

            function eX(e) {
                return {
                    create: function() {
                        return {
                            get: function(t) {
                                return e[t]
                            },
                            set: function(t, r) {
                                e[t] = r
                            }
                        }
                    }
                }
            }
            var eW = ((w = function() {
                function e(t) {
                    var r, n = this,
                        o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e.defaultLocale,
                        a = arguments.length > 2 ? arguments[2] : void 0,
                        i = arguments.length > 3 ? arguments[3] : void 0;
                    if (ek(this, e), this.formatterCache = {
                            number: {},
                            dateTime: {},
                            pluralRules: {}
                        }, this.format = function(e) {
                            var t = n.formatToParts(e);
                            if (1 === t.length) return t[0].value;
                            var r = t.reduce(function(e, t) {
                                return e.length && 0 === t.type && "string" == typeof e[e.length - 1] ? e[e.length - 1] += t.value : e.push(t.value), e
                            }, []);
                            return r.length <= 1 ? r[0] || "" : r
                        }, this.formatToParts = function(e) {
                            return function e(t, r, n, o, a, i, l) {
                                if (1 === t.length && 0 === t[0].type) return [{
                                    type: 0,
                                    value: t[0].value
                                }];
                                var u = [],
                                    c = !0,
                                    s = !1,
                                    f = void 0;
                                try {
                                    for (var p, d = t[Symbol.iterator](); !(c = (p = d.next()).done); c = !0) {
                                        var h = p.value;
                                        if (0 === h.type) {
                                            u.push({
                                                type: 0,
                                                value: h.value
                                            });
                                            continue
                                        }
                                        if (7 === h.type) {
                                            "number" == typeof i && u.push({
                                                type: 0,
                                                value: n.getNumberFormat(r).format(i)
                                            });
                                            continue
                                        }
                                        var m = h.value;
                                        if (!(a && m in a)) throw new eK(m, l);
                                        var b = a[m];
                                        if (1 === h.type) {
                                            b && "string" != typeof b && "number" != typeof b && (void 0 === b ? "undefined" : eL(b)) !== "bigint" || (b = "string" == typeof b || "number" == typeof b || (void 0 === b ? "undefined" : eL(b)) === "bigint" ? String(b) : ""), u.push({
                                                type: +("string" != typeof b),
                                                value: b
                                            });
                                            continue
                                        }
                                        if (3 === h.type) {
                                            var y = "string" == typeof h.style ? o.date[h.style] : ep(h.style) ? h.style.parsedOptions : void 0;
                                            u.push({
                                                type: 0,
                                                value: n.getDateTimeFormat(r, y).format(b)
                                            });
                                            continue
                                        }
                                        if (4 === h.type) {
                                            var g = "string" == typeof h.style ? o.time[h.style] : ep(h.style) ? h.style.parsedOptions : o.time.medium;
                                            u.push({
                                                type: 0,
                                                value: n.getDateTimeFormat(r, g).format(b)
                                            });
                                            continue
                                        }
                                        if (2 === h.type) {
                                            var v = "string" == typeof h.style ? o.number[h.style] : ef(h.style) ? h.style.parsedOptions : void 0;
                                            if (v && v.scale) {
                                                var O = v.scale || 1;
                                                if ((void 0 === b ? "undefined" : eL(b)) === "bigint") {
                                                    if (!Number.isInteger(O)) throw TypeError("Cannot apply fractional scale ".concat(O, " to bigint value. Scale must be an integer when formatting bigint."));
                                                    b *= BigInt(O)
                                                } else b *= O
                                            }
                                            u.push({
                                                type: 0,
                                                value: n.getNumberFormat(r, v).format(b)
                                            });
                                            continue
                                        }
                                        if (8 === h.type) {
                                            var w = h.children,
                                                j = h.value,
                                                S = a[j];
                                            if ("function" != typeof S) throw new eV(j, "function", l);
                                            var E = S(e(w, r, n, o, a, i).map(function(e) {
                                                return e.value
                                            }));
                                            Array.isArray(E) || (E = [E]), u.push.apply(u, eH(E.map(function(e) {
                                                return {
                                                    type: +("string" != typeof e),
                                                    value: e
                                                }
                                            })))
                                        }
                                        if (5 === h.type) {
                                            var x = b,
                                                P = (Object.prototype.hasOwnProperty.call(h.options, x) ? h.options[x] : void 0) || h.options.other;
                                            if (!P) throw new eG(h.value, b, Object.keys(h.options), l);
                                            u.push.apply(u, eH(e(P.value, r, n, o, a)));
                                            continue
                                        }
                                        if (6 === h.type) {
                                            var A = "=".concat(b),
                                                I = Object.prototype.hasOwnProperty.call(h.options, A) ? h.options[A] : void 0;
                                            if (!I) {
                                                if (!Intl.PluralRules) throw new ez('Intl.PluralRules is not available in this environment.\nTry polyfilling it using "@formatjs/intl-pluralrules"\n', "MISSING_INTL_API", l);
                                                var k = (void 0 === b ? "undefined" : eL(b)) === "bigint" ? Number(b) : b,
                                                    N = n.getPluralRules(r, {
                                                        type: h.pluralType
                                                    }).select(k - (h.offset || 0));
                                                I = (Object.prototype.hasOwnProperty.call(h.options, N) ? h.options[N] : void 0) || h.options.other
                                            }
                                            if (!I) throw new eG(h.value, b, Object.keys(h.options), l);
                                            var T = (void 0 === b ? "undefined" : eL(b)) === "bigint" ? Number(b) : b;
                                            u.push.apply(u, eH(e(I.value, r, n, o, a, T - (h.offset || 0))));
                                            continue
                                        }
                                    }
                                } catch (e) {
                                    s = !0, f = e
                                } finally {
                                    try {
                                        c || null == d.return || d.return()
                                    } finally {
                                        if (s) throw f
                                    }
                                }
                                return u.length < 2 ? u : u.reduce(function(e, t) {
                                    var r = e[e.length - 1];
                                    return r && 0 === r.type && 0 === t.type ? r.value += t.value : e.push(t), e
                                }, [])
                            }(n.ast, n.locales, n.formatters, n.formats, e, void 0, n.message)
                        }, this.resolvedOptions = function() {
                            var e;
                            return {
                                locale: (null == (e = n.resolvedLocale) ? void 0 : e.toString()) || Intl.NumberFormat.supportedLocalesOf(n.locales)[0]
                            }
                        }, this.getAst = function() {
                            return n.ast
                        }, this.locales = o, this.resolvedLocale = e.resolveLocale(o), "string" == typeof t) {
                        if (this.message = t, !e.__parse) throw TypeError("IntlMessageFormat.__parse must be set to process `message` of type `string`");
                        var l, u, c = i || {},
                            s = (function(e) {
                                if (null == e) throw TypeError("Cannot destructure " + e)
                            }(c), eM({}, c));
                        this.ast = e.__parse(t, (l = eB({}, s), u = u = {
                            locale: this.resolvedLocale
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(l, Object.getOwnPropertyDescriptors(u)) : (function(e) {
                            var t = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                t.push.apply(t, r)
                            }
                            return t
                        })(Object(u)).forEach(function(e) {
                            Object.defineProperty(l, e, Object.getOwnPropertyDescriptor(u, e))
                        }), l))
                    } else this.ast = t;
                    if (!Array.isArray(this.ast)) throw TypeError("A message must be provided as a String or AST.");
                    this.formats = (r = e.formats, a ? Object.keys(r).reduce(function(e, t) {
                        var n, o;
                        return e[t] = (n = r[t], (o = a[t]) ? eB({}, n, o, Object.keys(n).reduce(function(e, t) {
                            return e[t] = eB({}, n[t], o[t]), e
                        }, {})) : n), e
                    }, eB({}, r)) : r), this.formatters = i && i.formatters || function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                            number: {},
                            dateTime: {},
                            pluralRules: {}
                        };
                        return {
                            getNumberFormat: T(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return eN(Intl.NumberFormat, eH(t))
                            }, {
                                cache: eX(e.number),
                                strategy: D.variadic
                            }),
                            getDateTimeFormat: T(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return eN(Intl.DateTimeFormat, eH(t))
                            }, {
                                cache: eX(e.dateTime),
                                strategy: D.variadic
                            }),
                            getPluralRules: T(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return eN(Intl.PluralRules, eH(t))
                            }, {
                                cache: eX(e.pluralRules),
                                strategy: D.variadic
                            })
                        }
                    }(this.formatterCache)
                }
                return eC(e, null, [{
                    key: "defaultLocale",
                    get: function() {
                        return e.memoizedDefaultLocale || (e.memoizedDefaultLocale = new Intl.NumberFormat().resolvedOptions().locale), e.memoizedDefaultLocale
                    }
                }]), e
            }()).memoizedDefaultLocale = null, w.resolveLocale = function(e) {
                if (void 0 !== Intl.Locale) {
                    var t = Intl.NumberFormat.supportedLocalesOf(e);
                    return new Intl.Locale(t.length > 0 ? t[0] : "string" == typeof e ? e : e[0])
                }
            }, w.__parse = function(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = new ex(e, t = el({
                        shouldParseSkeletons: !0,
                        requiresOtherClause: !0
                    }, t)).parse();
                if (r.err) {
                    var n = SyntaxError(es[r.err.kind]);
                    throw n.location = r.err.location, n.originalMessage = r.err.message, n
                }
                return (null == t ? void 0 : t.captureLocation) || function e(t) {
                    t.forEach(function(t) {
                        if (delete t.location, 5 === t.type || 6 === t.type)
                            for (var r in t.options) delete t.options[r].location, e(t.options[r].value);
                        else 2 === t.type && ef(t.style) || (3 === t.type || 4 === t.type) && ep(t.style) ? delete t.style.location : 8 === t.type && e(t.children)
                    })
                }(r.val), r.val
            }, w.formats = {
                number: {
                    integer: {
                        maximumFractionDigits: 0
                    },
                    currency: {
                        style: "currency"
                    },
                    percent: {
                        style: "percent"
                    }
                },
                date: {
                    short: {
                        month: "numeric",
                        day: "numeric",
                        year: "2-digit"
                    },
                    medium: {
                        month: "short",
                        day: "numeric",
                        year: "numeric"
                    },
                    long: {
                        month: "long",
                        day: "numeric",
                        year: "numeric"
                    },
                    full: {
                        weekday: "long",
                        month: "long",
                        day: "numeric",
                        year: "numeric"
                    }
                },
                time: {
                    short: {
                        hour: "numeric",
                        minute: "numeric"
                    },
                    medium: {
                        hour: "numeric",
                        minute: "numeric",
                        second: "numeric"
                    },
                    long: {
                        hour: "numeric",
                        minute: "numeric",
                        second: "numeric",
                        timeZoneName: "short"
                    },
                    full: {
                        hour: "numeric",
                        minute: "numeric",
                        second: "numeric",
                        timeZoneName: "short"
                    }
                }
            }, w);

            function eZ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function e$(e) {
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

            function eY(e, t) {
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

            function eq(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return eZ(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eZ(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eJ() {
                for (var e, t, r, n, o, a = arguments.length, i = Array(a), l = 0; l < a; l++) i[l] = arguments[l];
                var u = eq(i, 4),
                    c = (u[0], u[1]),
                    s = u[2],
                    f = u[3];
                if (Array.isArray(c)) throw new V(K.INVALID_MESSAGE, void 0);
                if ("object" == (void 0 === c ? "undefined" : c && "u" > typeof Symbol && c.constructor === Symbol ? "symbol" : typeof c)) throw new V(K.INSUFFICIENT_PATH, void 0);
                if ("string" == typeof c) {
                    var p = s || /'[{}<#|']/.test(c) ? void 0 : c;
                    if (p) return p
                }
                var d = f.cache,
                    h = f.formats,
                    m = f.formatters,
                    b = f.globalFormats,
                    y = f.locale,
                    g = f.timeZone;
                m.getMessageFormat || (m.getMessageFormat = X(function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return new eW(t[0], t[1], t[2], e$({
                        formatters: m
                    }, t[3]))
                }, d.message));
                try {
                    o = m.getMessageFormat(c, y, (e = eW.formats.date, t = eW.formats.time, r = e$({}, null == b ? void 0 : b.dateTime, null == h ? void 0 : h.dateTime), n = {
                        date: e$({}, e, r),
                        time: e$({}, t, r),
                        number: e$({}, null == b ? void 0 : b.number, null == h ? void 0 : h.number)
                    }, g && ["date", "time"].forEach(function(e) {
                        var t = n[e],
                            r = !0,
                            o = !1,
                            a = void 0;
                        try {
                            for (var i, l = Object.entries(t)[Symbol.iterator](); !(r = (i = l.next()).done); r = !0) {
                                var u = eq(i.value, 2),
                                    c = u[0],
                                    s = u[1];
                                t[c] = e$({
                                    timeZone: g
                                }, s)
                            }
                        } catch (e) {
                            o = !0, a = e
                        } finally {
                            try {
                                r || null == l.return || l.return()
                            } finally {
                                if (o) throw a
                            }
                        }
                    }), n), {
                        formatters: eY(e$({}, m), {
                            getDateTimeFormat: function(e, t) {
                                var r;
                                return m.getDateTimeFormat(e, eY(e$({}, t), {
                                    timeZone: null != (r = null == t ? void 0 : t.timeZone) ? r : g
                                }))
                            }
                        })
                    })
                } catch (e) {
                    throw new V(K.INVALID_MESSAGE, void 0)
                }
                var v = o.format(s);
                return (0, k.isValidElement)(v) || Array.isArray(v) || "string" == typeof v ? v : String(v)
            }

            function eQ(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function e0(e) {
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

            function e1(e, t) {
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

            function e2() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return t.filter(Boolean).join(".")
            }

            function e3(e) {
                return e2(e.namespace, e.key)
            }

            function e8(e) {
                console.error(e)
            }

            function e5(e, t, r, n) {
                var o = e2(n, r);
                if (!t) throw Error(o);
                var a = t;
                return r.split(".").forEach(function(t) {
                    var r = a[t];
                    if (null == t || null == r) throw Error(o + " (".concat(e, ")"));
                    a = r
                }), a
            }
            eJ.raw = !0;
            var e4 = (0, k.createContext)(void 0);

            function e6(e) {
                var t = e.children,
                    r = e.formats,
                    n = e.getMessageFallback,
                    o = e.locale,
                    a = e.messages,
                    i = e.now,
                    l = e.onError,
                    u = e.timeZone,
                    c = (0, k.useContext)(e4),
                    s = (0, k.useMemo)(function() {
                        return (null == c ? void 0 : c.cache) || {
                            dateTime: {},
                            number: {},
                            message: {},
                            relativeTime: {},
                            pluralRules: {},
                            list: {},
                            displayNames: {}
                        }
                    }, [o, null == c ? void 0 : c.cache]),
                    f = (0, k.useMemo)(function() {
                        return (null == c ? void 0 : c.formatters) || {
                            getDateTimeFormat: W(Intl.DateTimeFormat, s.dateTime),
                            getNumberFormat: W(Intl.NumberFormat, s.number),
                            getPluralRules: W(Intl.PluralRules, s.pluralRules),
                            getRelativeTimeFormat: W(Intl.RelativeTimeFormat, s.relativeTime),
                            getListFormat: W(Intl.ListFormat, s.list),
                            getDisplayNames: W(Intl.DisplayNames, s.displayNames)
                        }
                    }, [s, null == c ? void 0 : c.formatters]),
                    p = (0, k.useMemo)(function() {
                        var e, t, p, d, h, m, b;
                        return m = function(e) {
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
                        }({}, (t = (e = {
                            locale: o,
                            formats: void 0 === r ? null == c ? void 0 : c.formats : r,
                            getMessageFallback: n || (null == c ? void 0 : c.getMessageFallback),
                            messages: void 0 === a ? null == c ? void 0 : c.messages : a,
                            now: i || (null == c ? void 0 : c.now),
                            onError: l || (null == c ? void 0 : c.onError),
                            timeZone: u || (null == c ? void 0 : c.timeZone)
                        }).formats, p = e.getMessageFallback, d = e.messages, h = e.onError, e1(e0({}, function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(e, ["formats", "getMessageFallback", "messages", "onError"])), {
                            formats: t || void 0,
                            messages: d || void 0,
                            onError: h || e8,
                            getMessageFallback: p || e3
                        }))), b = b = {
                            formatters: f,
                            cache: s
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(m, Object.getOwnPropertyDescriptors(b)) : (function(e) {
                            var t = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                t.push.apply(t, r)
                            }
                            return t
                        })(Object(b)).forEach(function(e) {
                            Object.defineProperty(m, e, Object.getOwnPropertyDescriptor(b, e))
                        }), m
                    }, [s, r, f, n, o, a, i, l, c, u]);
                return (0, x.jsx)(e4.Provider, {
                    value: p,
                    children: t
                })
            }

            function e7() {
                var e = (0, k.useContext)(e4);
                if (!e) throw Error(void 0);
                return e
            }
            var e9 = !1,
                te = "u" < typeof window,
                tt = window.Roblox["core-lib"].index;

            function tr(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tn(e) {
                return function(e) {
                    if (Array.isArray(e)) return tr(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tr(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tr(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            tn(["ar-001", "de-de", "en-us", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn", "zh-cn", "zh-tw"]).concat(tn(["bg-bg", "bn-bd", "bs-ba", "cs-cz", "da-dk", "el-gr", "en-gb", "es-mx", "et-ee", "fi-fi", "fil-ph", "fr-ca", "hr-hr", "hu-hu", "ka-ge", "kk-kz", "km-kh", "lt-lt", "lv-lv", "ms-my", "my-mm", "nb-no", "pt-pt", "ro-ro", "ru-ru", "si-lk", "sk-sk", "sl-sl", "sq-al", "sr-rs", "sv-se", "uk-ua"]));
            var to = tn(["ar_001", "de_de", "en_us", "es_es", "fr_fr", "hi_in", "id_id", "it_it", "ja_jp", "ko_kr", "nl_nl", "pl_pl", "pt_br", "th_th", "tr_tr", "vi_vn", "zh_cn", "zh_tw"]).concat(tn(["bg_bg", "bn_bd", "bs_ba", "cs_cz", "da_dk", "el_gr", "en_gb", "es_mx", "et_ee", "fi_fi", "fil_ph", "fr_ca", "hr_hr", "hu_hu", "ka_ge", "kk_kz", "km_kh", "lt_lt", "lv_lv", "ms_my", "my_mm", "nb_no", "pt_pt", "ro_ro", "ru_ru", "si_lk", "sk_sk", "sl_sl", "sq_al", "sr_rs", "sv_se", "uk_ua"])),
                ta = tn(["ar-001", "de-DE", "en-US", "es-ES", "fr-FR", "hi-IN", "id-ID", "it-IT", "ja-JP", "ko-KR", "nl-NL", "pl-PL", "pt-BR", "th-TH", "tr-TR", "vi-VN", "zh-CN", "zh-TW"]).concat(tn(["bg-BG", "bn-BD", "bs-BA", "cs-CZ", "da-DK", "el-GR", "en-GB", "es-MX", "et-EE", "fi-FI", "fil-PH", "fr-CA", "hr-HR", "hu-HU", "ka-GE", "kk-KZ", "km-KH", "lt-LT", "lv-LV", "ms-MY", "my-MM", "nb-NO", "pt-PT", "ro-RO", "ru-RU", "si-LK", "sk-SK", "sl-SL", "sq-AL", "sr-RS", "sv-SE", "uk-UA"]));
            tn(["ar", "de", "es", "fr", "hi", "id", "it", "ja", "ko", "nl", "pl", "pt", "th", "tr", "vi"]).concat(tn(["ar-001", "de-de", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn"]));
            var ti = function(e) {
                return e.replaceAll(".", ":")
            };

            function tl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var tu = function() {
                    if ("u" < typeof window) return {};
                    var e = window.Roblox;
                    return null != e ? e : {}
                },
                tc = function(e) {
                    return Object.fromEntries(Object.entries(null != e ? e : {}).flatMap(function(e) {
                        var t = function(e) {
                                if (Array.isArray(e)) return e
                            }(e) || function(e) {
                                var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != n) {
                                    var o = [],
                                        a = !0,
                                        i = !1;
                                    try {
                                        for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                    } catch (e) {
                                        i = !0, r = e
                                    } finally {
                                        try {
                                            a || null == n.return || n.return()
                                        } finally {
                                            if (i) throw r
                                        }
                                    }
                                    return o
                                }
                            }(e) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return tl(e, 2);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tl(e, 2)
                                }
                            }(e) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            r = t[0],
                            n = t[1];
                        return null == n ? [] : [
                            [ti(r), n]
                        ]
                    }))
                },
                ts = function(e) {
                    var t = tu(),
                        r = t.Lang,
                        n = t.LangDynamic,
                        o = t.LangDynamicDefault;
                    return Object.fromEntries(e.map(function(e) {
                        return [ti(e), function(e) {
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
                        }({}, tc(null == o ? void 0 : o[e]), tc(null == r ? void 0 : r[e]), tc(null == n ? void 0 : n[e]))]
                    }))
                },
                tf = function(e) {
                    var t, r, n = e.namespaces,
                        o = e.locale,
                        a = e.children,
                        i = n.join(","),
                        l = (0, k.useMemo)(function() {
                            return ts(n)
                        }, [i]);
                    return (0, x.jsx)(e6, {
                        locale: null != o ? o : null != (t = null != (r = function() {
                            if (!("u" < typeof document)) {
                                var e = document.documentElement.lang;
                                if (e) return (0, tt.arrayIncludes)(ta, e) ? e.toLowerCase() : void 0
                            }
                        }()) ? r : function() {
                            if ("u" < typeof document) return;
                            var e, t = document.querySelector('meta[name="locale-data"]');
                            if (null != (e = HTMLMetaElement) && "u" > typeof Symbol && e[Symbol.hasInstance] ? e[Symbol.hasInstance](t) : t instanceof e) {
                                var r = t.dataset.languageCode;
                                if (r && (0, tt.arrayIncludes)(to, r)) return r.replace("_", "-")
                            }
                        }()) ? t : "en-us",
                        messages: l,
                        children: a
                    })
                };

            function tp(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var td = "__FN_nvfToKPAOuiV__",
                th = "__FN_END_nvfToKPAOuiV__",
                tm = new RegExp("".concat(td, "(\\d+)\\|")),
                tb = new RegExp("".concat(th, "(\\d+)\\|")),
                ty = function(e, t, r) {
                    var n = function(e) {
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
                        }({}, r),
                        o = {};
                    t.forEach(function(e, t) {
                        var r = t.toString(),
                            a = "".concat(td).concat(r, "|"),
                            i = "".concat(th).concat(r, "|");
                        n[e.opening] = a, n[e.closing] = i, o[r] = {
                            start: a,
                            end: i,
                            render: e.render
                        }
                    });
                    var a = function(e) {
                            var t = [],
                                r = tm.exec(e),
                                n = tb.exec(e);
                            if (n && (!r || n.index < r.index)) return null;
                            if (!r) return [e];
                            r.index > 0 && t.push(e.slice(0, r.index));
                            var i = null == r[1] ? void 0 : o[r[1]];
                            if (null == i) return null;
                            var l = e.indexOf(i.end);
                            if (l < r.index + r[0].length) return null;
                            var u = a(e.slice(r.index + r[0].length, l));
                            if (null == u) return null;
                            t.push(i.render(u));
                            var c = e.slice(l + i.end.length);
                            if (c.length > 0) {
                                var s = a(c);
                                if (null == s) return null;
                                t.push.apply(t, function(e) {
                                    if (Array.isArray(e)) return tp(e)
                                }(s) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(s) || function(e) {
                                    if (e) {
                                        if ("string" == typeof e) return tp(e, void 0);
                                        var t = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tp(e, void 0)
                                    }
                                }(s) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }())
                            }
                            return t
                        },
                        i = a(e(n));
                    return null == i ? null : i.filter(function(e) {
                        return "" !== e
                    }).map(function(e, t) {
                        return (0, x.jsx)(k.Fragment, {
                            children: e
                        }, t)
                    })
                };

            function tg(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tv(e) {
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

            function tw(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tg(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tg(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tj = window.Roblox["core-scripts"].environmentUrls,
                tS = r.n(tj);

            function tE(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function tx() {
                return null != j || (j = "".concat(tS().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), j
            }
            var tP = function() {};

            function tA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tI(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var tk = function(e, t) {
                    return e << 3 | t
                },
                tN = tk(1, 2),
                tT = tk(2, 2),
                tC = tk(5, 2),
                tM = tk(6, 2),
                t_ = tk(8, 2),
                tR = tk(1, 2),
                tB = tk(2, 1),
                tD = tk(3, 0),
                tH = tk(5, 2);
            tk(1, 2), tk(2, 1), tk(3, 0), tk(4, 2), tk(5, 2), tk(6, 0), tk(8, 2);
            var tL = tk(4, 0),
                tF = tk(6, 2),
                tU = tk(7, 2);
            tk(1, 0), tk(2, 2);
            var tz = tk(1, 2),
                tG = tk(2, 2),
                tV = tk(1, 2);
            tk(1, 2), tk(2, 2), tk(1, 2);
            var tK = new TextEncoder,
                tX = function() {
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
                                var t = (void 0 === e ? "undefined" : tI(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                                for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                                this.buf.push(Number(t))
                            }
                        }, {
                            key: "writeString",
                            value: function(e) {
                                var t = tK.encode(e);
                                this.writeVarint(t.length);
                                var r = !0,
                                    n = !1,
                                    o = void 0;
                                try {
                                    for (var a, i = t[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
                                        var l = a.value;
                                        this.buf.push(l)
                                    }
                                } catch (e) {
                                    n = !0, o = e
                                } finally {
                                    try {
                                        r || null == i.return || i.return()
                                    } finally {
                                        if (n) throw o
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
                                    for (var o, a = e[Symbol.iterator](); !(t = (o = a.next()).done); t = !0) {
                                        var i = o.value;
                                        this.buf.push(i)
                                    }
                                } catch (e) {
                                    r = !0, n = e
                                } finally {
                                    try {
                                        t || null == a.return || a.return()
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

            function tW(e, t, r) {
                var n = new tX;
                return n.writeVarint(tk(1, 2)), n.writeString(e), n.writeVarint(t), r(n), n.toBytes()
            }

            function tZ(e) {
                var t = new tX;
                if (t.writeVarint(tR), t.writeString(e.name), t.writeVarint(tB), t.writeDouble(e.value), t.writeVarint(tD), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var r = function(e) {
                        var t = new tX,
                            r = !0,
                            n = !1,
                            o = void 0;
                        try {
                            for (var a, i = Object.entries(e)[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) ! function() {
                                var e, r = (e = a.value, function(e) {
                                        if (Array.isArray(e)) return e
                                    }(e) || function(e) {
                                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                        if (null != n) {
                                            var o = [],
                                                a = !0,
                                                i = !1;
                                            try {
                                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                            } catch (e) {
                                                i = !0, r = e
                                            } finally {
                                                try {
                                                    a || null == n.return || n.return()
                                                } finally {
                                                    if (i) throw r
                                                }
                                            }
                                            return o
                                        }
                                    }(e) || function(e) {
                                        if (e) {
                                            if ("string" == typeof e) return tA(e, 2);
                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tA(e, 2)
                                        }
                                    }(e) || function() {
                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                    }()),
                                    n = r[0],
                                    o = r[1];
                                if ("string" == typeof o) {
                                    var i = tW(n, tk(2, 2), function(e) {
                                        e.writeString(o)
                                    });
                                    t.writeVarint(tC), t.writeBytes(i)
                                } else if ("boolean" == typeof o) {
                                    var l = tW(n, tk(2, 0), function(e) {
                                        e.writeVarint(+!!o)
                                    });
                                    t.writeVarint(tM), t.writeBytes(l)
                                } else if ((void 0 === o ? "undefined" : tI(o)) === "bigint") {
                                    var u = tW(n, tk(2, 0), function(e) {
                                        e.writeVarint(o)
                                    });
                                    t.writeVarint(tT), t.writeBytes(u)
                                } else if ("number" == typeof o)
                                    if (Number.isFinite(o))
                                        if (Number.isInteger(o) && o >= -0x80000000 && o <= 0x7fffffff) {
                                            var c = tW(n, tk(2, 0), function(e) {
                                                e.writeVarint(o)
                                            });
                                            t.writeVarint(tN), t.writeBytes(c)
                                        } else if (Number.isInteger(o)) {
                                    var s = tW(n, tk(2, 0), function(e) {
                                        e.writeVarint(BigInt(o))
                                    });
                                    t.writeVarint(tT), t.writeBytes(s)
                                } else {
                                    var f = tW(n, tk(2, 1), function(e) {
                                        e.writeDouble(o)
                                    });
                                    t.writeVarint(t_), t.writeBytes(f)
                                } else {
                                    var p = tW(n, tk(2, 2), function(e) {
                                        e.writeString(String(o))
                                    });
                                    t.writeVarint(tC), t.writeBytes(p)
                                }
                            }()
                        } catch (e) {
                            n = !0, o = e
                        } finally {
                            try {
                                r || null == i.return || i.return()
                            } finally {
                                if (n) throw o
                            }
                        }
                        return t.toBytes()
                    }(e.attributes);
                    t.writeVarint(tH), t.writeBytes(r)
                }
                return t.toBytes()
            }

            function t$(e, t, r) {
                var n = new tX;
                n.writeVarint(tL), n.writeVarint(r);
                var o = !0,
                    a = !1,
                    i = void 0;
                try {
                    for (var l, u = e[Symbol.iterator](); !(o = (l = u.next()).done); o = !0) {
                        var c = l.value;
                        n.writeVarint(tF), n.writeBytes(c)
                    }
                } catch (e) {
                    a = !0, i = e
                } finally {
                    try {
                        o || null == u.return || u.return()
                    } finally {
                        if (a) throw i
                    }
                }
                var s = !0,
                    f = !1,
                    p = void 0;
                try {
                    for (var d, h = t[Symbol.iterator](); !(s = (d = h.next()).done); s = !0) {
                        var m = d.value;
                        n.writeVarint(tU), n.writeBytes(m)
                    }
                } catch (e) {
                    f = !0, p = e
                } finally {
                    try {
                        s || null == h.return || h.return()
                    } finally {
                        if (f) throw p
                    }
                }
                return n.toBytes()
            }

            function tY(e) {
                var t = new tX;
                t.writeVarint(tz), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(tG), t.writeBytes(e);
                var r = t.toBytes(),
                    n = new tX;
                return n.writeVarint(tV), n.writeBytes(r), n.toBytes()
            }
            var tq = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function tJ(e) {
                return tq.test(e)
            }
            var tQ = [],
                t0 = !1,
                t1 = !1;

            function t2(e, t) {
                var r, n, o, a = e.map(function(e) {
                        return {
                            name: e.name,
                            value: e.value,
                            timestampMs: e.timestampMs,
                            attributes: e.attributes
                        }
                    }),
                    i = BigInt(Date.now());
                !0 === t || t1 || "u" > typeof document && "hidden" === document.visibilityState ? (r = tY(t$(a.map(tZ), [], i)).buffer, fetch("".concat(tx()).concat("/v1/events/single"), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: r,
                    credentials: "include",
                    keepalive: !0
                }).catch(tP)) : (n = tY(t$(a.map(tZ), [], i)), (o = function() {
                    var e, t, r, o, a, i, l, u, c, s, f, p, d;
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
                            l = Object.defineProperty;
                        return l(i, "next", {
                            value: u(0)
                        }), l(i, "throw", {
                            value: u(1)
                        }), l(i, "return", {
                            value: u(2)
                        }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), i;

                        function u(l) {
                            return function(u) {
                                var c = [l, u];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                                    if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                                    switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                        case 0:
                                        case 1:
                                            o = c;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: c[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, n = c[1], c = [0];
                                            continue;
                                        case 7:
                                            c = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                a.label = c[1];
                                                break
                                            }
                                            if (6 === c[0] && a.label < o[1]) {
                                                a.label = o[1], o = c;
                                                break
                                            }
                                            if (o && a.label < o[2]) {
                                                a.label = o[2], a.ops.push(c);
                                                break
                                            }
                                            o[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    c = t.call(e, a)
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
                    }(this, function(h) {
                        switch (h.label) {
                            case 0:
                                if ("u" < typeof CompressionStream) return [2, {
                                    body: n.buffer,
                                    compressed: !1
                                }];
                                return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(n).catch(tP), t.close().catch(tP), r = [], [4, (o = e.readable.getReader()).read()];
                            case 1:
                                a = h.sent(), h.label = 2;
                            case 2:
                                if (a.done) return [3, 4];
                                return r.push(a.value), [4, o.read()];
                            case 3:
                                return a = h.sent(), [3, 2];
                            case 4:
                                i = new Uint8Array(r.reduce(function(e, t) {
                                    return e + t.length
                                }, 0)), l = 0, u = !0, c = !1, s = void 0;
                                try {
                                    for (f = r[Symbol.iterator](); !(u = (p = f.next()).done); u = !0) d = p.value, i.set(d, l), l += d.length
                                } catch (e) {
                                    c = !0, s = e
                                } finally {
                                    try {
                                        u || null == f.return || f.return()
                                    } finally {
                                        if (c) throw s
                                    }
                                }
                                return [2, {
                                    body: i.buffer,
                                    compressed: !0
                                }]
                        }
                    })
                }, function() {
                    var e = this,
                        t = arguments;
                    return new Promise(function(r, n) {
                        var a = o.apply(e, t);

                        function i(e) {
                            tE(a, r, n, i, l, "next", e)
                        }

                        function l(e) {
                            tE(a, r, n, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                })()).then(function(e) {
                    var t = e.body,
                        r = e.compressed,
                        n = {
                            "Content-Type": "application/x-protobuf"
                        };
                    return r && (n["Content-Encoding"] = "gzip"), fetch("".concat(tx()).concat("/v1/events/single"), {
                        method: "POST",
                        headers: n,
                        body: t,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(tP)
            }

            function t3() {
                var e = !0,
                    t = !1,
                    r = void 0;
                try {
                    for (var n, o = tQ[Symbol.iterator](); !(e = (n = o.next()).done); e = !0) {
                        var a = n.value.splice(0);
                        0 !== a.length && t2(a, !0)
                    }
                } catch (e) {
                    t = !0, r = e
                } finally {
                    try {
                        e || null == o.return || o.return()
                    } finally {
                        if (t) throw r
                    }
                }
            }

            function t8(e, t) {
                var r, n, o, a = Math.max(1, null != (r = null == t ? void 0 : t.batchSize) ? r : 10),
                    i = null != (n = null == t ? void 0 : t.batchIntervalMs) ? n : 250;

                function l(e, r) {
                    (null == t ? void 0 : t.onError) ? t.onError(e, r): console.error(e, r)
                }
                if (!tJ(e)) return l('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                        name: e
                    }),
                    function() {};
                var u = [];
                return tQ.push(u), t0 || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                        "hidden" === document.visibilityState && t3()
                    }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                        t1 = !0, t3()
                    }), t0 = !0),
                    function(t, r, n) {
                        var c = "".concat(e, "_").concat(t);
                        if (! function(e, t) {
                                if (!tJ(e)) return !1;
                                if (t) {
                                    var r = !0,
                                        n = !1,
                                        o = void 0;
                                    try {
                                        for (var a, i = Object.keys(t)[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
                                            var l = a.value;
                                            if (!tJ(l)) return !1
                                        }
                                    } catch (e) {
                                        n = !0, o = e
                                    } finally {
                                        try {
                                            r || null == i.return || i.return()
                                        } finally {
                                            if (n) throw o
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
                        var f = r && Object.keys(r).length > 0 ? r : void 0;
                        u.push({
                            name: c,
                            attributes: f,
                            value: s,
                            timestampMs: BigInt(Date.now())
                        }), u.length >= a ? (void 0 !== o && (clearTimeout(o), o = void 0), t2(u.splice(0, a))) : void 0 === o && (o = setTimeout(function() {
                            for (o = void 0; u.length > 0;) t2(u.splice(0, a))
                        }, i))
                    }
            }
            var t5 = "WwwCommon",
                t4 = function(e) {
                    var t = e.publish,
                        r = e.captureException,
                        n = e.featureName;

                    function o(e, t, o) {
                        if (null != o) {
                            var a, i = (null != (a = Error) && "u" > typeof Symbol && a[Symbol.hasInstance] ? !!a[Symbol.hasInstance](o) : o instanceof a) ? o.name || "Error" : "UnknownError",
                                l = n ? "".concat(n, "_").concat(e) : e;
                            return null == r || r(o, {
                                error_counter: l
                            }), tO(tv({}, t), {
                                errorType: i
                            })
                        }
                        return t
                    }
                    return {
                        trackCounter: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var o = tw(r, 2);
                            t(o[0], o[1])
                        },
                        trackError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var a = tw(r, 3),
                                i = a[0],
                                l = a[1],
                                u = a[2],
                                c = o(i, tO(tv({}, null != l ? l : {}), {
                                    severity: "error"
                                }), u);
                            t(i, c)
                        },
                        trackCriticalError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var a = tw(r, 3),
                                i = a[0],
                                l = a[1],
                                u = a[2],
                                c = o(i, tO(tv({}, null != l ? l : {}), {
                                    severity: "critical"
                                }), u);
                            t(i, c)
                        }
                    }
                }({
                    publish: t8(t5)
                });
            t4.trackCounter;
            var t6 = t4.trackError;
            t4.trackCriticalError;
            var t7 = function() {
                    if ("u" > typeof document) {
                        var e = document.querySelector('meta[name="page-meta"]');
                        return null == e ? void 0 : e.dataset.internalPageName
                    }
                },
                t9 = function(e) {
                    return "string" == typeof e && e.length > 0
                },
                re = function(e, t, r) {
                    var n;
                    "u" > typeof window && t6(e, {
                        key: r,
                        namespace: t,
                        internalPageName: null != (n = t7()) ? n : "unknown"
                    })
                },
                rt = function(e) {
                    var t, r, n, o, a, i, l, u, c, s, f, p, d, h = (t = ti(e), r = {
                        "!": e7().messages
                    }, n = t ? "!.".concat(t) : "!", a = (o = e7()).cache, i = o.formats, l = o.formatters, u = o.getMessageFallback, c = o.locale, s = o.onError, f = o.timeZone, p = r["!"], d = "!" === n ? void 0 : n.slice(2), f || e9 || !te || (e9 = !0, s(new V(K.ENVIRONMENT_FALLBACK, void 0))), (0, k.useMemo)(function() {
                        var e, t;
                        return t = function(e, t, r) {
                                try {
                                    if (!t) throw Error(void 0);
                                    var n = r ? e5(e, t, r) : t;
                                    if (!n) throw Error(r);
                                    return n
                                } catch (e) {
                                    return new V(K.MISSING_MESSAGE, e.message)
                                }
                            }((e = {
                                cache: a,
                                formatters: l,
                                getMessageFallback: u,
                                messages: p,
                                namespace: d,
                                onError: s,
                                formats: i,
                                locale: c,
                                timeZone: f
                            }).locale, e.messages, e.namespace),
                            function(e) {
                                var t = e.cache,
                                    r = e.formats,
                                    n = e.formatters,
                                    o = e.getMessageFallback,
                                    a = void 0 === o ? e3 : o,
                                    i = e.locale,
                                    l = e.messagesOrError,
                                    u = e.namespace,
                                    c = e.onError,
                                    s = e.timeZone,
                                    f = eQ(l, V);

                                function p(e, t, r, n) {
                                    var o = new V(t, r);
                                    return c(o), null != n ? n : a({
                                        error: o,
                                        key: e,
                                        namespace: u
                                    })
                                }

                                function d(e, o, d, h) {
                                    var m, b, y;
                                    if (f) {
                                        if (!h) return c(l), a({
                                            error: l,
                                            key: e,
                                            namespace: u
                                        });
                                        m = h
                                    } else try {
                                        m = e5(i, l, e, u)
                                    } catch (t) {
                                        if (!h) return p(e, K.MISSING_MESSAGE, t.message, h);
                                        m = h
                                    }
                                    try {
                                        var g, v = e2(u, e);
                                        return eJ(v, m, o ? (g = {}, Object.keys(o).forEach(function(e) {
                                            var t, r = 0,
                                                n = o[e];
                                            t = "function" == typeof n ? function(t) {
                                                var o = n(t);
                                                return (0, k.isValidElement)(o) ? (0, k.cloneElement)(o, {
                                                    key: e + r++
                                                }) : o
                                            } : n, g[e] = t
                                        }), g) : o, {
                                            cache: t,
                                            formatters: n,
                                            globalFormats: r,
                                            formats: d,
                                            locale: i,
                                            timeZone: s
                                        })
                                    } catch (t) {
                                        return eQ(t, V) ? (b = t.code, y = t.originalMessage) : (b = K.FORMATTING_ERROR, y = t.message), p(e, b, y, h)
                                    }
                                }

                                function h(e, t, r, n) {
                                    var o = d(e, t, r, n);
                                    return "string" != typeof o ? p(e, K.INVALID_MESSAGE, void 0) : o
                                }
                                return h.rich = d, h.markup = function(e, t, r, n) {
                                    return d(e, t, r, n)
                                }, h.raw = function(e) {
                                    if (f) return c(l), a({
                                        error: l,
                                        key: e,
                                        namespace: u
                                    });
                                    try {
                                        return e5(i, l, e, u)
                                    } catch (t) {
                                        return p(e, K.MISSING_MESSAGE, t.message)
                                    }
                                }, h.has = function(e) {
                                    if (f) return !1;
                                    try {
                                        return e5(i, l, e, u), !0
                                    } catch (e) {
                                        return !1
                                    }
                                }, h
                            }(e1(e0({}, e), {
                                messagesOrError: t
                            }))
                    }, [a, l, u, p, d, s, i, c, f]));
                    return (0, k.useMemo)(function() {
                        return Object.assign(function(t, r, n) {
                            var o = ti(t);
                            return void 0 === n || h.has(o) ? h(o, r) : (re("TranslationKeyNotFound", e, o), n)
                        }, {
                            rich: function(e, t) {
                                return h.rich(ti(e), t)
                            },
                            has: function(e) {
                                return t9(e) && h.has(ti(e))
                            },
                            dynamic: function(t, r) {
                                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "";
                                if (!t9(t)) return re("TranslationKeyNotFound", e, String(t)), n;
                                var o = ti(t),
                                    a = h.has(o);
                                return a || re("TranslationKeyNotFound", e, o), a ? h(o, r) : n
                            },
                            html: function(t, r, n) {
                                if (!t9(t)) return re("TranslationKeyNotFound", e, String(t)), null;
                                var o = ti(t);
                                if (!h.has(o)) return re("TranslationKeyNotFound", e, o), null;
                                var a = ty(function(e) {
                                    return h(o, e)
                                }, r, n);
                                return null == a && re("TranslationMalformed", e, o), a
                            }
                        })
                    }, [h, e])
                },
                rr = window.RobloxThumbnails;

            function rn() {
                for (var e, t, r = 0, n = "", o = arguments.length; r < o; r++)(e = arguments[r]) && (t = function e(t) {
                    var r, n, o = "";
                    if ("string" == typeof t || "number" == typeof t) o += t;
                    else if ("object" == (void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t))
                        if (Array.isArray(t)) {
                            var a = t.length;
                            for (r = 0; r < a; r++) t[r] && (n = e(t[r])) && (o && (o += " "), o += n)
                        } else
                            for (n in t) t[n] && (o && (o += " "), o += n);
                    return o
                }(e)) && (n && (n += " "), n += t);
                return n
            }

            function ro(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ra(e) {
                if (Array.isArray(e)) return e
            }

            function ri() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function rl(e, t) {
                if (e) {
                    if ("string" == typeof e) return ro(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ro(e, t)
                }
            }
            var ru = {
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
                rc = N().forwardRef(function(e, t) {
                    var r, n = ra(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || rl(r) || ri(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.className,
                        l = o.size,
                        u = void 0 === l ? "Large" : l,
                        c = o.variant,
                        s = o.value,
                        f = o.showValue,
                        p = void 0 !== f && f,
                        d = o.ariaLabel,
                        h = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(o, ["className", "size", "variant", "value", "showValue", "ariaLabel"]),
                        m = (ra(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(a) || rl(a, 1) || ri())[0],
                        b = ru[u],
                        y = b.dimension,
                        g = b.strokeWidth,
                        v = b.textClass,
                        O = b.valueContainerSize,
                        w = (y - g) / 2,
                        j = 2 * Math.PI * w,
                        S = y / 2,
                        E = Math.min(100, Math.max(0, void 0 === s ? 0 : s)),
                        x = p && void 0 !== O ? O : y,
                        P = "Determinate" === (void 0 === c ? "Determinate" : c);
                    return N().createElement("div", function(e) {
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
                        className: rn("foundation-web-progress-circle inline-flex items-center justify-center", i),
                        role: "progressbar",
                        "aria-label": d,
                        "aria-valuemin": P ? 0 : void 0,
                        "aria-valuemax": P ? 100 : void 0,
                        "aria-valuenow": P ? E : void 0,
                        style: {
                            width: x,
                            height: x
                        }
                    }, h), N().createElement("svg", {
                        width: y,
                        height: y,
                        viewBox: "0 0 ".concat(y, " ").concat(y),
                        className: "relative"
                    }, N().createElement("circle", {
                        cx: S,
                        cy: S,
                        r: w,
                        fill: "none",
                        strokeWidth: g,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), N().createElement("circle", {
                        cx: S,
                        cy: S,
                        r: w,
                        fill: "none",
                        strokeWidth: g,
                        strokeDasharray: P ? j : "".concat(.75 * j, " ").concat(.25 * j),
                        strokeDashoffset: P ? j * (1 - E / 100) : 0,
                        strokeLinecap: "round",
                        className: rn(!P && "foundation-web-progress-circle-indeterminate"),
                        style: P ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), P && p && "Large" === u && N().createElement("div", {
                        className: rn("absolute content-emphasis flex items-center justify-center", v),
                        "aria-hidden": "true"
                    }, N().createElement("span", null, Math.round(E)), N().createElement("span", null, "%")))
                });
            rc.displayName = "ProgressCircle";
            var rs = window.Roblox["core-scripts"].meta.device,
                rf = "inbox",
                rp = "sent",
                rd = "notifications",
                rh = "archive",
                rm = "list",
                rb = "detail",
                ry = "Roblox",
                rg = "Roblox.Messages.CountChanged",
                rv = window.Roblox["core-scripts"].eventStream,
                rO = window.Roblox["core-scripts"].intl.intl,
                rw = r.n(rO),
                rj = window.Roblox["core-scripts"].endpoints,
                rS = window.Roblox["core-scripts"].format.string,
                rE = new(rw())().getDateTimeFormatter(),
                rx = function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return t.find(function(e) {
                        return null != e
                    })
                },
                rP = function(e) {
                    var t, r, n, o = null != (t = rx(null == e ? void 0 : e.id, null == e ? void 0 : e.UserId, 1)) ? t : 1,
                        a = null != (r = rx(null == e ? void 0 : e.name, null == e ? void 0 : e.UserName, ry)) ? r : ry,
                        i = null != (n = rx(null == e ? void 0 : e.displayName, null == e ? void 0 : e.DisplayName, a)) ? n : a;
                    return {
                        id: o,
                        name: (0, rS.escapeHtml)(a),
                        displayName: i,
                        hasVerifiedBadge: !!rx(null == e ? void 0 : e.hasVerifiedBadge, null == e ? void 0 : e.HasVerifiedBadge, !1),
                        profileLink: (0, rj.getAbsoluteUrl)("/users/".concat(o, "/profile"))
                    }
                },
                rA = function(e) {
                    var t = (0, rj.getAbsoluteUrl)("/my/messages/");
                    return (0, rj.getAbsoluteUrl)("/AbuseReport/message?ID=".concat(e, "&RedirectUrl=").concat(t))
                },
                rI = function(e) {
                    var t, r, n, o, a = null != (t = rx(e.id, e.Id, 0)) ? t : 0;
                    return {
                        id: a,
                        sender: rP(rx(e.sender, e.Sender)),
                        recipient: rP(rx(e.recipient, e.Recipient)),
                        subject: null != (r = rx(e.subject, e.Subject, "")) ? r : "",
                        body: null != (n = rx(e.body, e.Body, "")) ? n : "",
                        created: null != (o = rx(e.created, e.Created, "")) ? o : "",
                        updated: rx(e.updated, e.Updated),
                        isRead: !!rx(e.isRead, e.IsRead, !1),
                        isSystemMessage: !!rx(e.isSystemMessage, e.IsSystemMessage, !1),
                        isReportAbuseDisplayed: !!rx(e.isReportAbuseDisplayed, e.IsReportAbuseDisplayed, !1),
                        abuseReportUrl: rA(a)
                    }
                },
                rk = function(e) {
                    var t, r;
                    return {
                        pageNumber: null != (t = rx(e.pageNumber, e.PageNumber, 0)) ? t : 0,
                        pageToken: null != (r = rx(e.pageToken, e.PageToken, "")) ? r : ""
                    }
                },
                rN = function(e) {
                    var t, r, n = rx(e.pageWindow, e.PageWindow);
                    return Array.isArray(n) && 0 !== n.length ? {
                        pageNumber: null != (r = rx(e.pageNumber, e.PageNumber, 1)) ? r : 1,
                        pageWindow: n.map(rk).filter(function(e) {
                            return e.pageNumber > 0 && e.pageToken.length > 0
                        }),
                        firstPageToken: null != (t = rx(e.firstPageToken, e.FirstPageToken)) && t.length > 0 ? t : null,
                        hasMore: !!rx(e.hasMore, e.HasMore, !1)
                    } : null
                },
                rT = function(e) {
                    var t, r, n, o, a = null != (t = rx(e.collection, e.Collection, [])) ? t : [];
                    return {
                        pageNumber: null != (r = rx(e.pageNumber, e.PageNumber, 0)) ? r : 0,
                        totalPages: null != (n = rx(e.totalPages, e.TotalPages, 1)) ? n : 1,
                        totalCollectionSize: null != (o = rx(e.totalCollectionSize, e.TotalCollectionSize, a.length)) ? o : a.length,
                        collection: a.map(rI),
                        cursorPagination: rN(e)
                    }
                },
                rC = function(e) {
                    var t = document.createElement("div");
                    return t.innerHTML = e, t.textContent || t.innerText || ""
                },
                rM = function(e) {
                    var t = 0,
                        r = "";
                    return e.replace(/(https?:\/\/[^\s<]+)/g, function(n, o, a) {
                        return r += (0, rS.escapeHtml)(e.slice(t, a)), r += '<a href="'.concat(n.replace(/[&"]/g, function(e) {
                            return "&" === e ? "&amp;" : "&quot;"
                        }), '" target="_blank" rel="noreferrer">').concat((0, rS.escapeHtml)(n), "</a>"), t = a + n.length, n
                    }), (r += (0, rS.escapeHtml)(e.slice(t))).replace(/\n/g, "<br />")
                },
                r_ = function(e) {
                    var t = new Date(e);
                    if (Number.isNaN(t.getTime())) return "";
                    var r = t.getFullYear() === new Date().getFullYear() ? rE.getCustomDateTime(t, {
                        month: "short",
                        day: "numeric"
                    }) : rE.getShortDate(t);
                    return "".concat(r, " | ").concat(rE.getCustomDateTime(t, {
                        hour: "numeric",
                        minute: "numeric"
                    }))
                },
                rR = function(e) {
                    var t = new Date(e);
                    return Number.isNaN(t.getTime()) ? "" : rE.getFullDate(t)
                },
                rB = function(e) {
                    document.dispatchEvent(new Event(e))
                },
                rD = window.Roblox["core-scripts"].meta.user,
                rH = window.Roblox["core-lib"].http.index;

            function rL(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var rF = function(e) {
                    return rL(e, rH.HttpError) ? e.response.status : null != e && (void 0 === e ? "undefined" : e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) == "object" && "status" in e ? "number" == typeof e.status ? e.status : void 0 : void 0
                },
                rU = function(e) {
                    if (null == e) return "network";
                    var t, r = rL(e, Error) ? e.cause : void 0,
                        n = null != (t = rF(e)) ? t : rF(r);
                    return null != n ? String(n) : rL(e, rH.AbortError) || rL(r, rH.AbortError) ? "aborted" : rL(e, rH.UnknownFetchError) || rL(r, rH.UnknownFetchError) ? "network" : "unknown"
                },
                rz = window.Roblox["core-scripts"].http.http,
                rG = window.Roblox["core-scripts"].guac,
                rV = window.Roblox["core-lib"].url.index;

            function rK(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rX(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function rW(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rK(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rK(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rZ = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                    return e.getOrThrow().then(function(e) {
                        return t && null == e ? {} : e
                    }, function(e) {
                        throw rX(e, rH.HttpError) ? Error("Request failed with status code ".concat(e.response.status), {
                            cause: e
                        }) : rX(e, Error) ? e : Error(String(e), {
                            cause: e
                        })
                    })
                },
                r$ = function(e) {
                    return function(e) {
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
                    }({}, e.withCredentials ? {
                        credentials: "include"
                    } : {}, e.retryable ? {
                        retry: rH.defaultBrowserRetryDelay
                    } : {}, e.noCache ? {
                        headers: {
                            "Cache-Control": "no-cache, no-store, must-revalidate",
                            Pragma: "no-cache"
                        }
                    } : {})
                },
                rY = function(e, t) {
                    var r = rV.Url.parse(e).getOrThrow();
                    if (!t) return r;
                    var n = Object.fromEntries(Object.entries(t).filter(function(e) {
                        return null != rW(e, 2)[1]
                    }).map(function(e) {
                        var t = rW(e, 2);
                        return [t[0], String(t[1])]
                    }));
                    return r.withSearchParams(n)
                },
                rq = "true" === r(773).env.NEXT_PUBLIC_IS_NEXTJS ? {
                    get: function(e, t) {
                        return rZ(rH.getUntyped(rY(e.url, t), r$(e)))
                    },
                    post: function(e, t) {
                        return rZ(rH.postUntyped(rY(e.url), null != t ? t : {}, r$(e)), !0)
                    },
                    getGuacBundle: function(e) {
                        var t = rV.Url.parse(tS().apiGatewayUrl).getOrThrow().withPath("/guac-v2/v1/bundles/".concat(e)).withSearchParams({
                            version: "1"
                        });
                        return rZ(rH.getUntyped(t, {
                            credentials: "include"
                        }))
                    }
                } : {
                    get: function(e, t) {
                        return rz.get(e, t).then(function(e) {
                            return e.data
                        })
                    },
                    post: function(e, t) {
                        return rz.post(e, t).then(function(e) {
                            return e.data
                        })
                    },
                    getGuacBundle: function(e) {
                        var t = new URLSearchParams;
                        return t.append("version", "1"), (0, rG.callBehaviour)(e, t)
                    }
                };

            function rJ(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function rQ(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            rJ(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            rJ(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function r0(e, t) {
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
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: u(0)
                }), l(i, "throw", {
                    value: u(1)
                }), l(i, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function u(l) {
                    return function(u) {
                        var c = [l, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < o[1]) {
                                        a.label = o[1], o = c;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(c);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
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
            var r1 = function(e) {
                    return "".concat(tS().privateMessagesApi).concat(e)
                },
                r2 = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                    return {
                        url: e,
                        noCache: t,
                        retryable: t,
                        withCredentials: !0
                    }
                },
                r3 = function(e, t) {
                    return e === rd ? rQ(function() {
                        return r0(this, function(e) {
                            switch (e.label) {
                                case 0:
                                    return [4, rq.get(r2(r1("/v1/announcements"), !0))];
                                case 1:
                                    return [2, rT(e.sent())]
                            }
                        })
                    })() : rQ(function() {
                        return r0(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    return [4, rq.get(r2(r1("/v1/messages"), !0), {
                                        pageNumber: t,
                                        pageSize: 20,
                                        messageTab: e
                                    })];
                                case 1:
                                    return [2, rT(r.sent())]
                            }
                        })
                    })()
                },
                r8 = function(e, t) {
                    return rq.post(r2(r1(t ? "/v1/messages/mark-read" : "/v1/messages/mark-unread")), {
                        messageIds: e
                    })
                },
                r5 = function(e) {
                    if (e.message) return Error(e.message);
                    var t, r, n = null == (r = e.errors) || null == (t = r[0]) ? void 0 : t.message;
                    return Error(null != n ? n : "Unknown error")
                },
                r4 = function(e) {
                    var t = e.subject,
                        r = e.body,
                        n = e.recipientId,
                        o = e.replyMessageId,
                        a = e.includePreviousMessage;
                    return rQ(function() {
                        var e, i;
                        return r0(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    return [4, rq.post(r2(r1("/v1/messages/send")), {
                                        userId: null != (e = (0, rD.userId)()) ? e : 0,
                                        subject: t,
                                        body: r,
                                        recipientId: n,
                                        replyMessageId: o,
                                        includePreviousMessage: a
                                    })];
                                case 1:
                                    if (!1 === (i = l.sent()).success) throw r5(i);
                                    return [2, i]
                            }
                        })
                    })()
                };

            function r6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function r7(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return r6(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return r6(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var r9 = [rf, rp, rd, rh],
                ne = function(e) {
                    var t = Array.isArray(e) ? e[0] : e;
                    if (null == t || "" === t || "string" != typeof t && "number" != typeof t) return null;
                    var r = Number.parseInt(String(t), 10);
                    return Number.isNaN(r) ? null : r
                },
                nt = function() {
                    var e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "u" < typeof window ? "" : window.location.hash,
                        r = r7((t.startsWith("#!") ? t.slice(2) : t.replace(/^#/, "")).split("?"), 2),
                        n = r[0],
                        o = r[1],
                        a = (void 0 === n ? "/inbox" : n).replace(/^\//, ""),
                        i = rV.UrlSearchParams.parse(void 0 === o ? "" : o),
                        l = null != (e = ne(i.get("page"))) ? e : 1,
                        u = i.get("pageToken"),
                        c = "string" == typeof u && u.length > 0 ? u : null;
                    return {
                        tab: r9.includes(a) ? a : rf,
                        page: l > 0 ? l : 1,
                        pageToken: c,
                        messageIdx: ne(i.get("messageIdx")),
                        conversationId: ne(i.get("conversationId"))
                    }
                },
                nr = function(e) {
                    var t = rV.UrlSearchParams.new(function(e) {
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
                    }({}, e.page > 1 ? {
                        page: String(e.page)
                    } : {}, null != e.pageToken && e.pageToken.length > 0 ? {
                        pageToken: e.pageToken
                    } : {}, null != e.messageIdx ? {
                        messageIdx: String(e.messageIdx)
                    } : {}, null != e.conversationId ? {
                        conversationId: String(e.conversationId)
                    } : {})).toString();
                    return "#!/".concat(e.tab).concat(t ? "?".concat(t) : "")
                },
                nn = function() {
                    var e = r7((0, k.useState)(function() {
                            return nt()
                        }), 2),
                        t = e[0],
                        r = e[1];
                    return (0, k.useEffect)(function() {
                        var e = function() {
                            r(nt())
                        };
                        return window.addEventListener("hashchange", e),
                            function() {
                                window.removeEventListener("hashchange", e)
                            }
                    }, []), {
                        route: t,
                        setRoute: (0, k.useCallback)(function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                n = t.replace,
                                o = nr(e);
                            if (window.location.hash === o) return void r(e);
                            if (void 0 !== n && n) {
                                window.history.replaceState(window.history.state, "", o), r(e);
                                return
                            }
                            window.location.hash = o
                        }, [])
                    }
                };

            function no(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function na(e) {
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

            function ni(e, t) {
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

            function nl(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return no(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return no(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var nu = r(773),
                nc = "PrivateMessage",
                ns = "true" === nu.env.NEXT_PUBLIC_IS_NEXTJS ? "nextjs" : "dotnet",
                nf = t8(nc),
                np = function(e) {
                    var t = e.publish,
                        r = e.captureException,
                        n = e.featureName;

                    function o(e, t, o) {
                        if (null != o) {
                            var a, i = (null != (a = Error) && "u" > typeof Symbol && a[Symbol.hasInstance] ? !!a[Symbol.hasInstance](o) : o instanceof a) ? o.name || "Error" : "UnknownError",
                                l = n ? "".concat(n, "_").concat(e) : e;
                            return null == r || r(o, {
                                error_counter: l
                            }), ni(na({}, t), {
                                errorType: i
                            })
                        }
                        return t
                    }
                    return {
                        trackCounter: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var o = nl(r, 2);
                            t(o[0], o[1])
                        },
                        trackError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var a = nl(r, 3),
                                i = a[0],
                                l = a[1],
                                u = a[2],
                                c = o(i, ni(na({}, null != l ? l : {}), {
                                    severity: "error"
                                }), u);
                            t(i, c)
                        },
                        trackCriticalError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var a = nl(r, 3),
                                i = a[0],
                                l = a[1],
                                u = a[2],
                                c = o(i, ni(na({}, null != l ? l : {}), {
                                    severity: "critical"
                                }), u);
                            t(i, c)
                        }
                    }
                }({
                    publish: function(e, t) {
                        var r, n;
                        nf(e, (r = function(e) {
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
                        }({}, t), n = n = {
                            host: ns
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
                    },
                    featureName: nc
                }),
                nd = np.trackCounter,
                nh = np.trackError,
                nm = np.trackCriticalError;

            function nb(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ny(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function ng(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            ny(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            ny(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function nv(e) {
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

            function nO(e, t) {
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

            function nw(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || nE(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nj(e) {
                return function(e) {
                    if (Array.isArray(e)) return nb(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || nE(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nS(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function nE(e, t) {
                if (e) {
                    if ("string" == typeof e) return nb(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nb(e, t)
                }
            }

            function nx(e, t) {
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
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: u(0)
                }), l(i, "throw", {
                    value: u(1)
                }), l(i, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function u(l) {
                    return function(u) {
                        var c = [l, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < o[1]) {
                                        a.label = o[1], o = c;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(c);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
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
            var nP = {
                    replyContent: "",
                    includePreviousMessage: !0,
                    isSending: !1
                },
                nA = function(e) {
                    return e && !e.isSystemMessage ? nO(nv({}, e), {
                        body: rM(e.body)
                    }) : e
                },
                nI = function(e, t) {
                    if (e && (void 0 === e ? "undefined" : nS(e)) === "object") {
                        if ("string" == typeof e.message) return e.message;
                        if (Array.isArray(e.errors)) {
                            var r = e.errors[0];
                            if (r && (void 0 === r ? "undefined" : nS(r)) === "object" && "message" in r) return String(r.message)
                        }
                    }
                    return t
                },
                nk = function(e, t) {
                    return !0 === e.enableCursorPagination && t.tab !== rd && (null != t.pageToken || t.page <= 1)
                },
                nN = function(e, t) {
                    var r;
                    return (null == e ? void 0 : e.cursorPagination) ? nv({
                        kind: "cursor"
                    }, e.cursorPagination) : {
                        kind: "offset",
                        currentPage: e ? e.pageNumber + 1 : t,
                        totalPages: null != (r = null == e ? void 0 : e.totalPages) ? r : 1
                    }
                },
                nT = function(e) {
                    return function(t) {
                        throw nh(e, {
                            statusCode: rU(t)
                        }, t), t
                    }
                },
                nC = function(e) {
                    var t = e.translate,
                        r = nn(),
                        n = r.route,
                        o = r.setRoute,
                        a = nw((0, k.useState)(function() {
                            return rq.getGuacBundle("private-messages-ui").catch(function(e) {
                                return nh("RulesLoadFailed", {
                                    statusCode: rU(e)
                                }, e), {}
                            })
                        }), 1)[0],
                        i = nw((0, k.useState)({}), 2),
                        l = i[0],
                        u = i[1],
                        c = nw((0, k.useState)(null), 2),
                        s = c[0],
                        f = c[1],
                        p = nw((0, k.useState)(null), 2),
                        d = p[0],
                        h = p[1],
                        m = nw((0, k.useState)(function() {
                            return new Set
                        }), 2),
                        b = m[0],
                        y = m[1],
                        g = nw((0, k.useState)(rm), 2),
                        v = g[0],
                        O = g[1],
                        w = nw((0, k.useState)(!0), 2),
                        j = w[0],
                        S = w[1],
                        E = nw((0, k.useState)(null), 2),
                        x = E[0],
                        P = E[1],
                        A = nw((0, k.useState)(null), 2),
                        I = A[0],
                        N = A[1],
                        T = nw((0, k.useState)(nP), 2),
                        C = T[0],
                        M = T[1],
                        _ = nw((0, k.useState)(0), 2),
                        R = _[0],
                        B = _[1],
                        D = (0, k.useRef)(!1),
                        H = (0, k.useRef)(n.tab),
                        L = (0, k.useMemo)(function() {
                            var e = [{
                                name: rf,
                                label: t("Label.Inbox")
                            }, {
                                name: rp,
                                label: t("Label.Sent")
                            }, {
                                name: rd,
                                label: t("Label.News"),
                                count: R
                            }, {
                                name: rh,
                                label: t("Label.Archive")
                            }];
                            return l.displayNewsTab ? e : e.filter(function(e) {
                                return e.name !== rd
                            })
                        }, [R, l.displayNewsTab, t]),
                        F = (0, k.useCallback)(function() {
                            return ng(function() {
                                var e, r, i, l, u;
                                return nx(this, function(c) {
                                    var s, p, d;
                                    switch (c.label) {
                                        case 0:
                                            S(!0), P(null), y(new Set), c.label = 1;
                                        case 1:
                                            if (c.trys.push([1, 12, 13, 14]), null == n.conversationId) return [3, 5];
                                            return [4, (s = n.conversationId, rQ(function() {
                                                return r0(this, function(e) {
                                                    switch (e.label) {
                                                        case 0:
                                                            return [4, rq.get(r2(r1("/v1/messages/".concat(s)), !0))];
                                                        case 1:
                                                            return [2, rI(e.sent())]
                                                    }
                                                })
                                            })())];
                                        case 2:
                                            if (e = c.sent(), f(null), h(nA(e)), M(nP), O(rb), e.isRead) return [3, 4];
                                            return [4, r8([e.id], !0).then(function() {
                                                rB(rg)
                                            }, function(e) {
                                                nh("MarkReadFailed", {
                                                    statusCode: rU(e)
                                                }, e)
                                            })];
                                        case 3:
                                            c.sent(), c.label = 4;
                                        case 4:
                                            return [3, 11];
                                        case 5:
                                            return [4, Promise.race([a, new Promise(function(e) {
                                                setTimeout(function() {
                                                    e({})
                                                }, 2e3)
                                            })])];
                                        case 6:
                                            if (!nk.apply(void 0, [c.sent(), n])) return [3, 8];
                                            return [4, (p = n.tab, d = n.pageToken, rQ(function() {
                                                return r0(this, function(e) {
                                                    switch (e.label) {
                                                        case 0:
                                                            return [4, rq.get(r2(r1("/v1/messages"), !0), function(e) {
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
                                                                pageSize: 20,
                                                                messageTab: p,
                                                                useCursor: !0
                                                            }, d ? {
                                                                pageToken: d
                                                            } : {}))];
                                                        case 1:
                                                            return [2, rT(e.sent())]
                                                    }
                                                })
                                            })())];
                                        case 7:
                                            return l = c.sent(), [3, 10];
                                        case 8:
                                            return [4, r3(n.tab, n.page - 1)];
                                        case 9:
                                            l = c.sent(), c.label = 10;
                                        case 10:
                                            f(i = l), O(null == n.messageIdx ? rm : rb), h(null == n.messageIdx ? null : nA(null != (r = i.collection[n.messageIdx]) ? r : null)), null != n.messageIdx && M(nP), rB(rg), c.label = 11;
                                        case 11:
                                            return [3, 14];
                                        case 12:
                                            if (u = c.sent(), null == n.conversationId && null != n.pageToken && "400" === rU(u)) return o(nO(nv({}, n), {
                                                page: 1,
                                                pageToken: null,
                                                messageIdx: null
                                            }), {
                                                replace: !0
                                            }), [2];
                                            return nm("LoadFailed", {
                                                host: ns,
                                                tab: n.tab,
                                                statusCode: rU(u)
                                            }, u), f(null), h(null), O(rm), P(nI(u, t("Message.UnknownError"))), [3, 14];
                                        case 13:
                                            return S(!1), [7];
                                        case 14:
                                            return [2]
                                    }
                                })
                            })()
                        }, [n, a, o, t]);
                    (0, k.useEffect)(function() {
                        nd("PageView", {
                            host: ns,
                            tab: H.current
                        }), a.then(u), rq.get(r2(r1("/v1/announcements/metadata"), !0)).then(function(e) {
                            var t;
                            B(null != (t = e.numOfAnnouncements) ? t : 0)
                        }).catch(function(e) {
                            nh("NewsCountLoadFailed", {
                                statusCode: rU(e)
                            }, e), B(0)
                        })
                    }, [a]), (0, k.useEffect)(function() {
                        if (D.current) {
                            D.current = !1;
                            return
                        }
                        F()
                    }, [F]);
                    var U = (0, k.useMemo)(function() {
                        return nN(s, n.page)
                    }, [s, n.page]);
                    return {
                        route: n,
                        rules: l,
                        tabs: L,
                        page: s,
                        pagination: U,
                        selectedMessage: d,
                        selectedMessageIds: b,
                        moduleState: v,
                        loading: j,
                        error: x,
                        feedback: I,
                        sendReplyState: C,
                        openTab: function(e) {
                            nd("OpenTab", {
                                tab: e
                            }), e === rd && (0, rv.sendEventWithTarget)("newsOpenContent", "click", {
                                property: R
                            }, rv.targetTypes.WWW), h(null), y(new Set), M(nP), o({
                                tab: e,
                                page: 1,
                                pageToken: null,
                                messageIdx: null,
                                conversationId: null
                            })
                        },
                        openMessage: function(e, t) {
                            return ng(function() {
                                return nx(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            if (nd("OpenMessage"), h(nA(e)), y(new Set([e.id])), M(nP), O(rb), D.current = !0, o(nO(nv({}, n), {
                                                    messageIdx: t,
                                                    conversationId: null
                                                })), e.isRead) return [3, 2];
                                            return f(function(t) {
                                                return null == t ? t : nO(nv({}, t), {
                                                    collection: t.collection.map(function(t) {
                                                        return t.id === e.id ? nO(nv({}, t), {
                                                            isRead: !0
                                                        }) : t
                                                    })
                                                })
                                            }), [4, r8([e.id], !0).catch(nT("MarkReadFailed"))];
                                        case 1:
                                            r.sent(), rB(rg), r.label = 2;
                                        case 2:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        backToList: function() {
                            h(null), y(new Set), M(nP), O(rm), D.current = !0, o(nO(nv({}, n), {
                                messageIdx: null,
                                conversationId: null
                            }))
                        },
                        toggleMessageSelection: function(e) {
                            y(function(t) {
                                var r = new Set(t);
                                return r.has(e) ? r.delete(e) : r.add(e), r
                            })
                        },
                        toggleSelectAll: function() {
                            y(function(e) {
                                return s && e.size !== s.collection.length ? new Set(s.collection.map(function(e) {
                                    return e.id
                                })) : new Set
                            })
                        },
                        markRead: function(e) {
                            return ng(function() {
                                var t;
                                return nx(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            if (0 === (t = nj(b)).length) return [2];
                                            return f(function(r) {
                                                return null == r ? r : nO(nv({}, r), {
                                                    collection: r.collection.map(function(r) {
                                                        return t.includes(r.id) ? nO(nv({}, r), {
                                                            isRead: e
                                                        }) : r
                                                    })
                                                })
                                            }), y(new Set), [4, r8(t, e).catch(nT("MarkReadFailed"))];
                                        case 1:
                                            return r.sent(), rB(rg), [2]
                                    }
                                })
                            })()
                        },
                        markArchive: function(e) {
                            return ng(function() {
                                var t, r;
                                return nx(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            if (0 === (t = b.size > 0 ? nj(b) : d ? [d.id] : []).length) return [2];
                                            return r = v === rb, [4, rq.post(r2(r1(e ? "/v1/messages/archive" : "/v1/messages/unarchive")), {
                                                messageIds: t
                                            }).catch(nT("ArchiveFailed"))];
                                        case 1:
                                            if (a.sent(), y(new Set), h(null), M(nP), O(rm), !r) return [3, 2];
                                            return o(nO(nv({}, n), {
                                                messageIdx: null,
                                                conversationId: null
                                            })), [3, 4];
                                        case 2:
                                            return [4, F()];
                                        case 3:
                                            a.sent(), a.label = 4;
                                        case 4:
                                            return rB(rg), [2]
                                    }
                                })
                            })()
                        },
                        changePage: function(e) {
                            var t = e.pageNumber,
                                r = e.pageToken;
                            M(nP), o({
                                tab: n.tab,
                                page: t,
                                pageToken: r,
                                messageIdx: null,
                                conversationId: null
                            })
                        },
                        updateReplyContent: function(e) {
                            M(function(t) {
                                return nO(nv({}, t), {
                                    replyContent: e
                                })
                            })
                        },
                        updateIncludePreviousMessage: function(e) {
                            M(function(t) {
                                return nO(nv({}, t), {
                                    includePreviousMessage: e
                                })
                            })
                        },
                        sendReply: function() {
                            return ng(function() {
                                return nx(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            if (!d || 0 === C.replyContent.length) return [2];
                                            M(function(e) {
                                                return nO(nv({}, e), {
                                                    isSending: !0
                                                })
                                            }), e.label = 1;
                                        case 1:
                                            return e.trys.push([1, 3, 4, 5]), [4, r4({
                                                subject: d.subject,
                                                body: C.replyContent,
                                                recipientId: d.sender.id,
                                                replyMessageId: d.id,
                                                includePreviousMessage: C.includePreviousMessage
                                            })];
                                        case 2:
                                            return e.sent(), N({
                                                type: "success",
                                                message: t("Message.SendSuccessfully")
                                            }), M(nP), rB("Roblox.Messages.MessageSent"), [3, 5];
                                        case 3:
                                            return N({
                                                type: "warning",
                                                message: nI(e.sent(), t("Message.UnknownError"))
                                            }), [3, 5];
                                        case 4:
                                            return M(function(e) {
                                                return nO(nv({}, e), {
                                                    isSending: !1
                                                })
                                            }), [7];
                                        case 5:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        dismissFeedback: function() {
                            N(null)
                        },
                        shouldShowSystemUser: function(e) {
                            return "sent" !== n.tab && 1 === e.sender.id
                        }
                    }
                };

            function nM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function n_(e) {
                if (Array.isArray(e)) return e
            }

            function nR() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function nB(e, t) {
                if (e) {
                    if ("string" == typeof e) return nM(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nM(e, t)
                }
            }
            var nD = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                nH = N().forwardRef(function(e, t) {
                    var r, n = n_(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || nB(r) || nR(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.name,
                        l = o.size,
                        u = o.className,
                        c = (o.children, function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(o, ["name", "size", "className", "children"])),
                        s = (n_(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(a) || nB(a, 1) || nR())[0];
                    return N().createElement("span", function(e) {
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
                        className: rn("grow-0 shrink-0 basis-auto icon", i, nD[void 0 === l ? "Medium" : l], u)
                    }, c))
                });
            nH.displayName = "Icon";
            var nL = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                nF = function(e) {
                    var t = e.className;
                    return N().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: rn("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                nU = "opacity-[0.5]",
                nz = function(e) {
                    var t = e.width,
                        r = e.height;
                    return N().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, N().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function nG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nV(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function nK() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = nV(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : nV(t[e], null)
                        }
                    }
                }
            }

            function nX() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return k.useCallback(nK.apply(void 0, function(e) {
                    if (Array.isArray(e)) return nG(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return nG(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nG(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function nW(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
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

            function nY(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function nq(e) {
                return function(e) {
                    if (Array.isArray(e)) return nW(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return nW(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nW(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nJ(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var nQ = Symbol.for("react.lazy"),
                n0 = k[" use ".trim().toString()];

            function n1(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : nJ(e)) === "object" && "$$typeof" in e && e.$$typeof === nQ && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : nJ(t)) === "object" && null !== t && "then" in t
            }
            var n2 = ((e = k.forwardRef(function(e, t) {
                    var r = e.children,
                        n = nY(e, ["children"]);
                    if (n1(r) && "function" == typeof n0 && (r = n0(r._payload)), k.isValidElement(r)) {
                        var o, a, i, l, u, c = (u = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                            s = function(e, t) {
                                var r = nZ({}, t);
                                for (var n in t) ! function(n) {
                                    var o = e[n],
                                        a = t[n];
                                    /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = a.apply(void 0, nq(t));
                                        return o.apply(void 0, nq(t)), n
                                    } : o && (r[n] = o) : "style" === n ? r[n] = nZ({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                }(n);
                                return nZ({}, e, r)
                            }(n, r.props);
                        return r.type !== k.Fragment && (s.ref = t ? nK(t, c) : c), k.cloneElement(r, s)
                    }
                    return k.Children.count(r) > 1 ? k.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), o = e, (a = k.forwardRef(function(e, t) {
                    var r = e.children,
                        n = nY(e, ["children"]);
                    n1(r) && "function" == typeof n0 && (r = n0(r._payload));
                    var a = k.Children.toArray(r),
                        i = a.find(n8);
                    if (i) {
                        var l = i.props.children,
                            u = a.map(function(e) {
                                return e !== i ? e : k.Children.count(l) > 1 ? k.Children.only(null) : k.isValidElement(l) ? l.props.children : null
                            });
                        return (0, x.jsx)(o, n$(nZ({}, n), {
                            ref: t,
                            children: k.isValidElement(l) ? k.cloneElement(l, void 0, u) : null
                        }))
                    }
                    return (0, x.jsx)(o, n$(nZ({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), a),
                n3 = Symbol("radix.slottable");

            function n8(e) {
                return k.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === n3
            }

            function n5(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function n4(e) {
                if (Array.isArray(e)) return e
            }

            function n6() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function n7(e) {
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

            function n9(e, t) {
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

            function oe(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function ot(e, t) {
                if (e) {
                    if ("string" == typeof e) return n5(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return n5(e, t)
                }
            }
            var or = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                on = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                oo = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                oa = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                oi = (0, k.forwardRef)(function(e, t) {
                    var r, n = n4(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || ot(r) || n6(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.children,
                        l = o.className,
                        u = o.style,
                        c = o.isDisabled,
                        s = void 0 !== c && c,
                        f = o.isLoading,
                        p = void 0 !== f && f,
                        d = o.icon,
                        h = o.size,
                        m = void 0 === h ? "Large" : h,
                        b = o.variant,
                        y = void 0 === b ? "Emphasis" : b,
                        g = o.asChild,
                        v = oe(o, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        O = (n4(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(a) || ot(a, 1) || n6())[0],
                        w = rn("foundation-web-button", s ? nU : [nL, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", on[m], s ? oa[y] : oo[y], l),
                        j = n7({
                            textDecoration: "none"
                        }, u),
                        S = function(e) {
                            return N().createElement(N().Fragment, null, N().createElement(nF, null), p && N().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, N().createElement(nz, {
                                width: or[m],
                                height: or[m]
                            })), N().createElement("span", {
                                className: rn("flex items-center min-width-0", "Large" === m || "Medium" === m ? "gap-small" : "gap-xsmall", p && "invisible")
                            }, d && N().createElement(nH, {
                                name: d,
                                size: m
                            }), N().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (g) {
                        v.as;
                        var E = oe(v, ["as"]),
                            x = N().Children.only(i);
                        return N().createElement(n2, n9(n7({
                            ref: O
                        }, E), {
                            className: w,
                            style: j,
                            "aria-disabled": s || void 0
                        }), N().cloneElement(x, {}, S(x.props.children)))
                    }
                    if ("a" === v.as) {
                        v.as;
                        var P = v.href,
                            A = oe(v, ["as", "href"]);
                        return N().createElement("a", n9(n7({
                            ref: O
                        }, A), {
                            "aria-disabled": s,
                            href: s ? void 0 : P,
                            className: w,
                            style: j
                        }), S(i))
                    }
                    v.as;
                    var I = oe(v, ["as"]);
                    return N().createElement("button", n9(n7({
                        ref: O,
                        type: "button"
                    }, I), {
                        disabled: s,
                        className: w,
                        style: j
                    }), S(i))
                }),
                ol = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                ou = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                oc = function(e) {
                    var t = e.variant,
                        r = e.size,
                        n = e.isCircular,
                        o = e.className,
                        a = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(e, ["variant", "size", "isCircular", "className"]);
                    return N().createElement("button", function(e) {
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
                        className: rn("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", nL, ou[t], ol[r], n && "radius-circle", o)
                    }, a), N().createElement(nF, null), N().createElement(nH, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function os(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function of(e) {
                if (Array.isArray(e)) return e
            }

            function op() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function od(e) {
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

            function oh(e, t) {
                return of(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || om(e, t) || op()
            }

            function om(e, t) {
                if (e) {
                    if ("string" == typeof e) return os(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return os(e, t)
                }
            }
            var ob = (0, k.forwardRef)(function(e, t) {
                    var r, n, o, a = of(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || om(r) || op(),
                        i = a[0],
                        l = a.slice(1),
                        u = i.title,
                        c = i.icon,
                        s = i.actionLabel,
                        f = i.onAction,
                        p = i.actions,
                        d = i.onClose,
                        h = i.closeIconAriaLabel,
                        m = i.shouldAutoDismiss,
                        b = i.autoDismissDurationMs,
                        y = i.className,
                        g = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(i, ["title", "icon", "actionLabel", "onAction", "actions", "onClose", "closeIconAriaLabel", "shouldAutoDismiss", "autoDismissDurationMs", "className"]),
                        v = oh(l, 1)[0],
                        O = oh((0, k.useState)("enter"), 2),
                        w = O[0],
                        j = O[1],
                        S = (0, k.useRef)(void 0),
                        E = (0, k.useRef)(void 0),
                        x = (0, k.useRef)(void 0),
                        P = (0, k.useRef)(null),
                        A = null != p ? p : s && f && N().createElement(oi, {
                            size: "Small",
                            variant: "Utility",
                            className: "content-inverse-emphasis",
                            onClick: f,
                            ref: P
                        }, s),
                        I = !!A,
                        T = u.length > 80,
                        C = null == m || m,
                        M = 4e3;
                    I && (M = T ? 1e4 : 7e3);
                    var _ = null != b ? b : M,
                        R = (0, k.useCallback)(function() {
                            "exit" !== w && (j("exit"), void 0 !== E.current && (window.clearTimeout(E.current), E.current = void 0), x.current = window.setTimeout(function() {
                                null == d || d()
                            }, 150))
                        }, [d, w]);
                    (0, k.useEffect)(function() {
                        return S.current = window.requestAnimationFrame(function() {
                                j("idle")
                            }),
                            function() {
                                void 0 !== S.current && window.cancelAnimationFrame(S.current)
                            }
                    }, []), (0, k.useEffect)(function() {
                        void 0 !== E.current && (window.clearTimeout(E.current), E.current = void 0), C && "exit" !== w && (E.current = window.setTimeout(function() {
                            R()
                        }, _))
                    }, [_, C, w, R]), (0, k.useEffect)(function() {
                        var e;
                        I && (null == (e = P.current) || e.focus())
                    }, [I]), (0, k.useEffect)(function() {
                        return function() {
                            void 0 !== E.current && window.clearTimeout(E.current), void 0 !== x.current && window.clearTimeout(x.current), void 0 !== S.current && window.cancelAnimationFrame(S.current)
                        }
                    }, []);
                    var B = {
                            position: "fixed",
                            left: "50%",
                            bottom: "max(var(--padding-xxlarge, 32px), env(safe-area-inset-bottom))",
                            transform: "translate(-50%, ".concat("idle" === w ? "0" : "120%", ")"),
                            zIndex: "var(--foundation-portal-zindex, 9999)"
                        },
                        D = g.style ? od({}, B, g.style) : B;
                    return N().createElement("div", od({
                        ref: v,
                        role: "status",
                        "aria-live": "polite",
                        className: rn("flex items-center gap-xxlarge radius-medium shadow-transient-low bg-inverse-surface-0 padding-x-medium padding-y-medium stroke-standard shrink-0", "max-width-[480px] min-height-[48px]", "min-width-[min(100%-max(2_*_var(--margin-small),env(safe-area-inset-left)+env(safe-area-inset-right)),393px)]", "foundation-web-portal-zindex pointer-events-auto", "exit" === w ? "ease-standard-in" : "ease-standard-out", y),
                        style: (n = od({}, D), o = o = {
                            transitionDuration: "".concat("exit" === w ? 150 : 200, "ms"),
                            transitionProperty: "transform"
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                            var t = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                t.push.apply(t, r)
                            }
                            return t
                        })(Object(o)).forEach(function(e) {
                            Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                        }), n)
                    }, g), N().createElement("div", {
                        className: "flex items-center gap-medium grow-1 basis-0 min-h-[40px]"
                    }, c && N().createElement(nH, {
                        name: c,
                        size: "Small",
                        className: "shrink-0 content-inverse-emphasis"
                    }), N().createElement("div", {
                        className: "grow-1 basis-0 text-caption-large content-inverse-emphasis text-truncate-end"
                    }, u)), N().createElement("div", {
                        className: "flex items-center justify-end gap-small shrink-0"
                    }, A, d && N().createElement(oc, {
                        variant: "Utility",
                        size: "Small",
                        isCircular: !0,
                        className: "content-inverse-emphasis",
                        "aria-label": void 0 === h ? "Dismiss snackbar" : h,
                        onClick: R
                    })))
                }),
                oy = function(e) {
                    var t = e.feedback,
                        r = e.onClose;
                    return t ? (0, x.jsx)(ob, {
                        title: t.message,
                        onClose: r,
                        shouldAutoDismiss: !0
                    }) : null
                },
                og = 0,
                ov = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        t = (0, k.useRef)();
                    return t.current || (og += 1, t.current = "".concat(e).concat(og)), t.current
                };

            function oO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ow(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function oj(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        ow(e, t, r[t])
                    })
                }
                return e
            }

            function oS(e) {
                return function(e) {
                    if (Array.isArray(e)) return oO(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return oO(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oO(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oE(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    n = function() {
                        var t = r.map(function(e) {
                            return k.createContext(e)
                        });
                        return function(r) {
                            var n = (null == r ? void 0 : r[e]) || t;
                            return k.useMemo(function() {
                                var t, o;
                                return ow({}, "__scope".concat(e), (t = oj({}, r), o = null != (o = ow({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
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
                    var o = k.createContext(n),
                        a = r.length;
                    r = oS(r).concat([n]);
                    var i = function(t) {
                        var r, n = t.scope,
                            i = t.children,
                            l = function(e, t) {
                                if (null == e) return {};
                                var r, n, o, a = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                    return a
                                }
                                if (a = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, o = {},
                                            a = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                        return o
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }(t, ["scope", "children"]),
                            u = (null == n || null == (r = n[e]) ? void 0 : r[a]) || o,
                            c = k.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, x.jsx)(u.Provider, {
                            value: c,
                            children: i
                        })
                    };
                    return i.displayName = t + "Provider", [i, function(r, i) {
                        var l, u = (null == i || null == (l = i[e]) ? void 0 : l[a]) || o,
                            c = k.useContext(u);
                        if (c) return c;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, ox.apply(void 0, [n].concat(oS(t)))]
            }

            function ox() {
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
                            return oj({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return k.useMemo(function() {
                            return ow({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }

            function oP(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }
            "u" > typeof window && window.document && window.document.createElement;
            var oA = (null == (S = globalThis) ? void 0 : S.document) ? k.useLayoutEffect : function() {};

            function oI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ok(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return oI(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oI(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var oN = k[" useInsertionEffect ".trim().toString()] || oA;

            function oT(e) {
                var t, r, n, o, a, i, l, u, c = e.prop,
                    s = e.defaultProp,
                    f = e.onChange,
                    p = e.caller,
                    d = ok((r = (t = {
                        defaultProp: s,
                        onChange: void 0 === f ? function() {} : f
                    }).defaultProp, n = t.onChange, a = (o = ok(k.useState(r), 2))[0], i = o[1], l = k.useRef(a), u = k.useRef(n), oN(function() {
                        u.current = n
                    }, [n]), k.useEffect(function() {
                        if (l.current !== a) {
                            var e;
                            null == (e = u.current) || e.call(u, a), l.current = a
                        }
                    }, [a, l]), [a, i, u]), 3),
                    h = d[0],
                    m = d[1],
                    b = d[2],
                    y = void 0 !== c,
                    g = y ? c : h,
                    v = k.useRef(void 0 !== c);
                return k.useEffect(function() {
                    var e = v.current;
                    if (e !== y) {
                        var t = y ? "controlled" : "uncontrolled";
                        console.warn("".concat(p, " is changing from ").concat(e ? "controlled" : "uncontrolled", " to ").concat(t, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                    }
                    v.current = y
                }, [y, p]), [g, k.useCallback(function(e) {
                    if (y) {
                        var t, r = "function" == typeof e ? e(c) : e;
                        r !== c && (null == (t = b.current) || t.call(b, r))
                    } else m(e)
                }, [y, c, m, b])]
            }

            function oC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function o_(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return oM(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oM(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            Symbol("RADIX:SYNC_STATE");
            var oR = function(e) {
                var t, r, n, o, a, i, l, u, c, s, f, p, d, h, m, b, y, g = e.present,
                    v = e.children,
                    O = (t = g, a = (o = o_(k.useState(), 2))[0], i = o[1], l = k.useRef(null), u = k.useRef(t), c = k.useRef("none"), f = (s = o_((r = t ? "mounted" : "unmounted", n = {
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
                    }, k.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], p = s[1], k.useEffect(function() {
                        var e = oB(l.current);
                        c.current = "mounted" === f ? e : "none"
                    }, [f]), oA(function() {
                        var e = l.current,
                            r = u.current;
                        if (r !== t) {
                            var n = c.current,
                                o = oB(e);
                            t ? p("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? p("UNMOUNT") : r && n !== o ? p("ANIMATION_OUT") : p("UNMOUNT"), u.current = t
                        }
                    }, [t, p]), oA(function() {
                        if (a) {
                            var e, t, r = null != (e = a.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = oB(l.current).includes(CSS.escape(e.animationName));
                                    if (e.target === a && n && (p("ANIMATION_END"), !u.current)) {
                                        var o = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === a && (c.current = oB(l.current))
                                };
                            return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", n), a.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", n), a.removeEventListener("animationend", n)
                                }
                        }
                        p("ANIMATION_END")
                    }, [a, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: k.useCallback(function(e) {
                            l.current = e ? getComputedStyle(e) : null, i(e)
                        }, [])
                    }),
                    w = "function" == typeof v ? v({
                        present: O.isPresent
                    }) : k.Children.only(v),
                    j = nX(O.ref, (y = (b = null == (h = Object.getOwnPropertyDescriptor((d = w).props, "ref")) ? void 0 : h.get) && "isReactWarning" in b && b.isReactWarning) ? d.ref : (y = (b = null == (m = Object.getOwnPropertyDescriptor(d, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning) ? d.props.ref : d.props.ref || d.ref);
                return "function" == typeof v || O.isPresent ? k.cloneElement(w, {
                    ref: j
                }) : null
            };

            function oB(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function oD(e, t) {
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

            function oL(e, t) {
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

            function oF(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function oU(e) {
                return function(e) {
                    if (Array.isArray(e)) return oD(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return oD(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oD(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oz(e) {
                var t, r, n = (t = e, (r = k.forwardRef(function(e, t) {
                        var r = e.children,
                            n = oF(e, ["children"]);
                        if (k.isValidElement(r)) {
                            var o, a, i, l, u, c = (u = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = oH({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            a = t[n];
                                        /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = a.apply(void 0, oU(t));
                                            return o.apply(void 0, oU(t)), n
                                        } : o && (r[n] = o) : "style" === n ? r[n] = oH({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                    }(n);
                                    return oH({}, e, r)
                                }(n, r.props);
                            return r.type !== k.Fragment && (s.ref = t ? nK(t, c) : c), k.cloneElement(r, s)
                        }
                        return k.Children.count(r) > 1 ? k.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = k.forwardRef(function(e, t) {
                        var r = e.children,
                            o = oF(e, ["children"]),
                            a = k.Children.toArray(r),
                            i = a.find(oV);
                        if (i) {
                            var l = i.props.children,
                                u = a.map(function(e) {
                                    return e !== i ? e : k.Children.count(l) > 1 ? k.Children.only(null) : k.isValidElement(l) ? l.props.children : null
                                });
                            return (0, x.jsx)(n, oL(oH({}, o), {
                                ref: t,
                                children: k.isValidElement(l) ? k.cloneElement(l, void 0, u) : null
                            }))
                        }
                        return (0, x.jsx)(n, oL(oH({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            oR.displayName = "Presence", window.ReactDOM;
            var oG = Symbol("radix.slottable");

            function oV(e) {
                return k.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === oG
            }

            function oK(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function oX(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        oK(e, t, r[t])
                    })
                }
                return e
            }

            function oW(e, t) {
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
            var oZ = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r = oz("Primitive.".concat(t)),
                    n = k.forwardRef(function(e, n) {
                        var o = e.asChild,
                            a = function(e, t) {
                                if (null == e) return {};
                                var r, n, o, a = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                    return a
                                }
                                if (a = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, o = {},
                                            a = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                        return o
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }(e, ["asChild"]),
                            i = o ? r : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, x.jsx)(i, oW(oX({}, a), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), oW(oX({}, e), oK({}, t, n))
            }, {});

            function o$(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oY(e) {
                if (Array.isArray(e)) return e
            }

            function oq() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function oJ(e) {
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

            function oQ(e, t) {
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

            function o0(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function o1(e, t) {
                return oY(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || o3(e, t) || oq()
            }

            function o2(e) {
                return oY(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || o3(e) || oq()
            }

            function o3(e, t) {
                if (e) {
                    if ("string" == typeof e) return o$(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return o$(e, t)
                }
            }
            var o8 = "Checkbox",
                o5 = o1(oE(o8), 2),
                o4 = o5[0];
            o5[1];
            var o6 = o1(o4(o8), 2),
                o7 = o6[0],
                o9 = o6[1];

            function ae(e) {
                var t = e.__scopeCheckbox,
                    r = e.checked,
                    n = e.children,
                    o = e.defaultChecked,
                    a = e.disabled,
                    i = e.form,
                    l = e.name,
                    u = e.onCheckedChange,
                    c = e.required,
                    s = e.value,
                    f = e.internal_do_not_use_render,
                    p = o1(oT({
                        prop: r,
                        defaultProp: null != o && o,
                        onChange: u,
                        caller: o8
                    }), 2),
                    d = p[0],
                    h = p[1],
                    m = o1(k.useState(null), 2),
                    b = m[0],
                    y = m[1],
                    g = o1(k.useState(null), 2),
                    v = g[0],
                    O = g[1],
                    w = k.useRef(!1),
                    j = !b || !!i || !!b.closest("form"),
                    S = {
                        checked: d,
                        disabled: a,
                        setChecked: h,
                        control: b,
                        setControl: y,
                        name: l,
                        form: i,
                        value: void 0 === s ? "on" : s,
                        hasConsumerStoppedPropagationRef: w,
                        required: c,
                        defaultChecked: !au(o) && o,
                        isFormControl: j,
                        bubbleInput: v,
                        setBubbleInput: O
                    };
                return (0, x.jsx)(o7, oQ(oJ({
                    scope: t
                }, S), {
                    children: "function" == typeof f ? f(S) : n
                }))
            }
            var at = "CheckboxTrigger",
                ar = k.forwardRef(function(e, t) {
                    var r = o2([e, t]),
                        n = r[0],
                        o = r.slice(1),
                        a = n.__scopeCheckbox,
                        i = n.onKeyDown,
                        l = n.onClick,
                        u = o0(n, ["__scopeCheckbox", "onKeyDown", "onClick"]),
                        c = o1(o, 1)[0],
                        s = o9(at, a),
                        f = s.control,
                        p = s.value,
                        d = s.disabled,
                        h = s.checked,
                        m = s.required,
                        b = s.setControl,
                        y = s.setChecked,
                        g = s.hasConsumerStoppedPropagationRef,
                        v = s.isFormControl,
                        O = s.bubbleInput,
                        w = nX(c, b),
                        j = k.useRef(h);
                    return k.useEffect(function() {
                        var e = null == f ? void 0 : f.form;
                        if (e) {
                            var t = function() {
                                return y(j.current)
                            };
                            return e.addEventListener("reset", t),
                                function() {
                                    return e.removeEventListener("reset", t)
                                }
                        }
                    }, [f, y]), (0, x.jsx)(oZ.button, oQ(oJ({
                        type: "button",
                        role: "checkbox",
                        "aria-checked": au(h) ? "mixed" : h,
                        "aria-required": m,
                        "data-state": ac(h),
                        "data-disabled": d ? "" : void 0,
                        disabled: d,
                        value: p
                    }, u), {
                        ref: w,
                        onKeyDown: oP(i, function(e) {
                            "Enter" === e.key && e.preventDefault()
                        }),
                        onClick: oP(l, function(e) {
                            y(function(e) {
                                return !!au(e) || !e
                            }), O && v && (g.current = e.isPropagationStopped(), g.current || e.stopPropagation())
                        })
                    }))
                });
            ar.displayName = at;
            var an = k.forwardRef(function(e, t) {
                var r = e.__scopeCheckbox,
                    n = e.name,
                    o = e.checked,
                    a = e.defaultChecked,
                    i = e.required,
                    l = e.disabled,
                    u = e.value,
                    c = e.onCheckedChange,
                    s = e.form,
                    f = o0(e, ["__scopeCheckbox", "name", "checked", "defaultChecked", "required", "disabled", "value", "onCheckedChange", "form"]);
                return (0, x.jsx)(ae, {
                    __scopeCheckbox: r,
                    checked: o,
                    defaultChecked: a,
                    disabled: l,
                    required: i,
                    onCheckedChange: c,
                    name: n,
                    form: s,
                    value: u,
                    internal_do_not_use_render: function(e) {
                        var n = e.isFormControl;
                        return (0, x.jsxs)(x.Fragment, {
                            children: [(0, x.jsx)(ar, oQ(oJ({}, f), {
                                ref: t,
                                __scopeCheckbox: r
                            })), n && (0, x.jsx)(al, {
                                __scopeCheckbox: r
                            })]
                        })
                    }
                })
            });
            an.displayName = o8;
            var ao = "CheckboxIndicator",
                aa = k.forwardRef(function(e, t) {
                    var r = e.__scopeCheckbox,
                        n = e.forceMount,
                        o = o0(e, ["__scopeCheckbox", "forceMount"]),
                        a = o9(ao, r);
                    return (0, x.jsx)(oR, {
                        present: n || au(a.checked) || !0 === a.checked,
                        children: (0, x.jsx)(oZ.span, oQ(oJ({
                            "data-state": ac(a.checked),
                            "data-disabled": a.disabled ? "" : void 0
                        }, o), {
                            ref: t,
                            style: oJ({
                                pointerEvents: "none"
                            }, e.style)
                        }))
                    })
                });
            aa.displayName = ao;
            var ai = "CheckboxBubbleInput",
                al = k.forwardRef(function(e, t) {
                    var r, n, o, a, i, l = o2([e, t]),
                        u = l[0],
                        c = l.slice(1),
                        s = u.__scopeCheckbox,
                        f = o0(u, ["__scopeCheckbox"]),
                        p = o1(c, 1)[0],
                        d = o9(ai, s),
                        h = d.control,
                        m = d.hasConsumerStoppedPropagationRef,
                        b = d.checked,
                        y = d.defaultChecked,
                        g = d.required,
                        v = d.disabled,
                        O = d.name,
                        w = d.value,
                        j = d.form,
                        S = d.bubbleInput,
                        E = nX(p, d.setBubbleInput),
                        P = (r = k.useRef({
                            value: b,
                            previous: b
                        }), k.useMemo(function() {
                            return r.current.value !== b && (r.current.previous = r.current.value, r.current.value = b), r.current.previous
                        }, [b])),
                        A = (a = (o = function(e) {
                            if (Array.isArray(e)) return e
                        }(n = k.useState(void 0)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return oC(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oC(e, 2)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], i = o[1], oA(function() {
                            if (h) {
                                i({
                                    width: h.offsetWidth,
                                    height: h.offsetHeight
                                });
                                var e = new ResizeObserver(function(e) {
                                    if (Array.isArray(e) && e.length) {
                                        var t, r, n = e[0];
                                        if ("borderBoxSize" in n) {
                                            var o = n.borderBoxSize,
                                                a = Array.isArray(o) ? o[0] : o;
                                            t = a.inlineSize, r = a.blockSize
                                        } else t = h.offsetWidth, r = h.offsetHeight;
                                        i({
                                            width: t,
                                            height: r
                                        })
                                    }
                                });
                                return e.observe(h, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return e.unobserve(h)
                                    }
                            }
                            i(void 0)
                        }, [h]), a);
                    k.useEffect(function() {
                        if (S) {
                            var e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                                t = !m.current;
                            if (P !== b && e) {
                                var r = new Event("click", {
                                    bubbles: t
                                });
                                S.indeterminate = au(b), e.call(S, !au(b) && b), S.dispatchEvent(r)
                            }
                        }
                    }, [S, P, b, m]);
                    var I = k.useRef(!au(b) && b);
                    return (0, x.jsx)(oZ.input, oQ(oJ({
                        type: "checkbox",
                        "aria-hidden": !0,
                        defaultChecked: null != y ? y : I.current,
                        required: g,
                        disabled: v,
                        name: O,
                        value: w,
                        form: j
                    }, f), {
                        tabIndex: -1,
                        ref: E,
                        style: oQ(oJ({}, f.style, A), {
                            position: "absolute",
                            pointerEvents: "none",
                            opacity: 0,
                            margin: 0,
                            transform: "translateX(-100%)"
                        })
                    }))
                });

            function au(e) {
                return "indeterminate" === e
            }

            function ac(e) {
                return au(e) ? "indeterminate" : e ? "checked" : "unchecked"
            }
            al.displayName = ai;
            var as = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-600"
                },
                af = {
                    XSmall: "",
                    Small: "",
                    Medium: "",
                    Large: "padding-y-xxsmall"
                },
                ap = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                ad = {
                    XSmall: "",
                    Small: "padding-top-xxsmall",
                    Medium: "padding-top-xxsmall",
                    Large: "padding-top-xxsmall"
                },
                ah = function(e) {
                    var t = e.label,
                        r = e.className,
                        n = e.isChecked,
                        o = e.isDisabled,
                        a = e.size,
                        i = e.hint,
                        l = e.placement,
                        u = e.onCheckedChange,
                        c = e.id,
                        s = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(e, ["label", "className", "isChecked", "isDisabled", "size", "hint", "placement", "onCheckedChange", "id"]),
                        f = ov(),
                        p = c || f,
                        d = t && N().createElement("label", {
                            htmlFor: p,
                            className: rn("flex flex-col grow-1 gap-xsmall", !o && "cursor-pointer")
                        }, N().createElement("span", {
                            className: rn(ap[a], ad[a], "content-emphasis")
                        }, t), i && N().createElement("span", {
                            className: "text-body-medium content-default"
                        }, i));
                    return N().createElement("div", {
                        className: rn("foundation-web-checkbox flex gap-medium", o && "opacity-[0.5]", !o && "cursor-pointer", r)
                    }, "End" === l && d, N().createElement("div", {
                        className: rn(af[a])
                    }, N().createElement(an, function(e) {
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
                        "data-slot": "checkbox",
                        className: rn(as[a], nL, !o && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
                        id: p,
                        checked: n,
                        disabled: o,
                        onCheckedChange: u,
                        "aria-label": t
                    }, s), N().createElement(nF, null), N().createElement(aa, {
                        "data-slot": "checkbox-indicator",
                        className: rn(as[a], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
                    }))), "Start" === l && d)
                },
                am = function(e) {
                    var t = e.className,
                        r = e.children;
                    return (0, x.jsx)("div", {
                        className: t,
                        onClick: function(e) {
                            e.stopPropagation()
                        },
                        children: r
                    })
                };

            function ab(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ay(e) {
                if (Array.isArray(e)) return e
            }

            function ag() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function av(e) {
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

            function aO(e, t) {
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

            function aw(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function aj(e, t) {
                if (e) {
                    if ("string" == typeof e) return ab(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ab(e, t)
                }
            }
            var aS = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                aE = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                ax = {
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
                aP = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                aA = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                aI = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                ak = {
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
                aN = {
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
                aT = (0, k.forwardRef)(function(e, t) {
                    var r, n, o = ay(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || aj(r) || ag(),
                        a = o[0],
                        i = o.slice(1),
                        l = a.className,
                        u = a.icon,
                        c = a.ariaLabel,
                        s = a.isDisabled,
                        f = void 0 !== s && s,
                        p = a.isCircular,
                        d = a.isSelected,
                        h = a.size,
                        m = void 0 === h ? "Large" : h,
                        b = a.variant,
                        y = void 0 === b ? "Emphasis" : b,
                        g = a.iconColor,
                        v = void 0 === g ? "Default" : g,
                        O = a.asChild,
                        w = a.children,
                        j = aw(a, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]),
                        S = (ay(i) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(i) || aj(i, 1) || ag())[0];
                    n = f ? aA[y] : void 0 !== d && d ? aI[y] : aP[y];
                    var E = rn("foundation-web-icon-button", f ? nU : [nL, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", aS[m], ax[m][void 0 !== p && p ? "circular" : "square"], n, l),
                        x = N().createElement(N().Fragment, null, N().createElement(nF, null), N().createElement("span", {
                            className: rn("icon", u, aE[m], f ? aN[v][y] : ak[v][y])
                        }));
                    if (O) {
                        j.as;
                        var P = aw(j, ["as"]),
                            A = N().Children.only(w);
                        return N().createElement(n2, aO(av({
                            ref: S
                        }, P), {
                            className: E,
                            "aria-label": c,
                            "aria-disabled": f || void 0
                        }), N().cloneElement(A, {}, x))
                    }
                    if ("a" === j.as) {
                        j.as;
                        var I = j.href,
                            k = aw(j, ["as", "href"]);
                        return N().createElement("a", aO(av({
                            ref: S
                        }, k), {
                            "aria-label": c,
                            "aria-disabled": f,
                            href: f ? void 0 : I,
                            className: E
                        }), x)
                    }
                    j.as;
                    var T = aw(j, ["as"]);
                    return N().createElement("button", aO(av({
                        ref: S,
                        type: "button"
                    }, T), {
                        "aria-label": c,
                        disabled: f,
                        className: E
                    }), x)
                }),
                aC = function(e) {
                    var t = e.icon,
                        r = e.ariaLabel,
                        n = e.target,
                        o = e.onChangePage;
                    return (0, x.jsx)(aT, {
                        icon: t,
                        variant: "Utility",
                        size: "Medium",
                        isDisabled: null == n,
                        ariaLabel: r,
                        onClick: function() {
                            null != n && o(n)
                        }
                    })
                },
                aM = function(e) {
                    var t = e.translate,
                        r = e.currentPage,
                        n = e.totalPages,
                        o = e.onChangePage;
                    if (n <= 1) return null;
                    var a = function(e) {
                            return {
                                pageNumber: e,
                                pageToken: null
                            }
                        },
                        i = r > 1,
                        l = r < n;
                    return (0, x.jsxs)("div", {
                        className: "flex items-center gap-xsmall justify-end",
                        children: [(0, x.jsx)(aC, {
                            icon: "icon-filled-chevron-large-left-to-line",
                            ariaLabel: t("Action.FirstPage"),
                            target: i ? a(1) : null,
                            onChangePage: o
                        }), (0, x.jsx)(aC, {
                            icon: "icon-filled-chevron-large-left",
                            ariaLabel: t("Action.Previous"),
                            target: i ? a(r - 1) : null,
                            onChangePage: o
                        }), (0, x.jsxs)("span", {
                            className: "text-body-large content-muted padding-x-small",
                            children: [r, " / ", n]
                        }), (0, x.jsx)(aC, {
                            icon: "icon-filled-chevron-large-right",
                            ariaLabel: t("Action.Next"),
                            target: l ? a(r + 1) : null,
                            onChangePage: o
                        }), (0, x.jsx)(aC, {
                            icon: "icon-filled-chevron-large-right-to-line",
                            ariaLabel: t("Action.LastPage"),
                            target: l ? a(n) : null,
                            onChangePage: o
                        })]
                    })
                },
                a_ = function(e) {
                    var t = e.translate,
                        r = e.pageNumber,
                        n = e.pageWindow,
                        o = e.firstPageToken,
                        a = e.hasMore,
                        i = e.onChangePage,
                        l = function(e) {
                            var t = n.find(function(t) {
                                return t.pageNumber === e
                            });
                            return t ? {
                                pageNumber: t.pageNumber,
                                pageToken: t.pageToken
                            } : null
                        },
                        u = r > 1 ? l(r - 1) : null,
                        c = a ? l(r + 1) : null;
                    return r <= 1 && null == c ? null : (0, x.jsxs)("div", {
                        className: "flex items-center gap-xsmall justify-end",
                        children: [(0, x.jsx)(aC, {
                            icon: "icon-filled-chevron-large-left-to-line",
                            ariaLabel: t("Action.FirstPage"),
                            target: r > 1 ? {
                                pageNumber: 1,
                                pageToken: o
                            } : null,
                            onChangePage: i
                        }), (0, x.jsx)(aC, {
                            icon: "icon-filled-chevron-large-left",
                            ariaLabel: t("Action.Previous"),
                            target: u,
                            onChangePage: i
                        }), n.map(function(e) {
                            var t = e.pageNumber === r;
                            return (0, x.jsx)(oi, {
                                variant: t ? "SoftEmphasis" : "Utility",
                                size: "Medium",
                                "aria-current": t ? "page" : void 0,
                                onClick: function() {
                                    t || i({
                                        pageNumber: e.pageNumber,
                                        pageToken: e.pageToken
                                    })
                                },
                                children: e.pageNumber
                            }, e.pageNumber)
                        }), (0, x.jsx)(aC, {
                            icon: "icon-filled-chevron-large-right",
                            ariaLabel: t("Action.Next"),
                            target: c,
                            onChangePage: i
                        })]
                    })
                },
                aR = function(e) {
                    var t = e.translate,
                        r = e.pagination,
                        n = e.onChangePage;
                    return "cursor" === r.kind ? (0, x.jsx)(a_, {
                        translate: t,
                        pageNumber: r.pageNumber,
                        pageWindow: r.pageWindow,
                        firstPageToken: r.firstPageToken,
                        hasMore: r.hasMore,
                        onChangePage: n
                    }) : (0, x.jsx)(aM, {
                        translate: t,
                        currentPage: r.currentPage,
                        totalPages: r.totalPages,
                        onChangePage: n
                    })
                },
                aB = function(e) {
                    var t = e.translate,
                        r = e.activeTab,
                        n = e.moduleState,
                        o = e.selectedCount,
                        a = e.totalCount,
                        i = e.pagination,
                        l = e.onToggleSelectAll,
                        u = e.onMarkArchive,
                        c = e.onMarkRead,
                        s = e.onBack,
                        f = e.onChangePage,
                        p = r === rf,
                        d = r === rh;
                    return r === rp || r === rd ? n === rm ? (0, x.jsx)("div", {
                        className: "flex justify-end margin-y-medium",
                        children: (0, x.jsx)(aR, {
                            translate: t,
                            pagination: i,
                            onChangePage: f
                        })
                    }) : (0, x.jsx)("div", {
                        className: "margin-y-medium",
                        children: (0, x.jsx)(oi, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: s,
                            children: t("Action.Back")
                        })
                    }) : n === rb ? (0, x.jsxs)("div", {
                        className: "flex items-center gap-small margin-y-medium",
                        children: [(0, x.jsx)(oi, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: s,
                            children: t("Action.Back")
                        }), p ? (0, x.jsx)(oi, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: function() {
                                u(!0)
                            },
                            children: t("Action.Archive")
                        }) : null, d ? (0, x.jsx)(oi, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: function() {
                                u(!1)
                            },
                            children: t("Action.MoveToInbox")
                        }) : null]
                    }) : (0, x.jsxs)("div", {
                        className: "flex items-center justify-between gap-medium margin-y-medium wrap",
                        children: [(0, x.jsxs)("div", {
                            className: "flex items-center gap-small wrap",
                            children: [(0, x.jsx)(am, {
                                className: "padding-left-large",
                                children: (0, x.jsx)(ah, {
                                    label: t("Label.All"),
                                    size: "Medium",
                                    placement: "Start",
                                    isChecked: a > 0 && o === a,
                                    onCheckedChange: l
                                })
                            }), (0, x.jsxs)("div", {
                                className: "private-message-action-buttons flex items-center gap-small wrap",
                                children: [p ? (0, x.jsx)(oi, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        u(!0)
                                    },
                                    children: t("Action.Archive")
                                }) : null, d ? (0, x.jsx)(oi, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        u(!1)
                                    },
                                    children: t("Action.MoveToInbox")
                                }) : null, (0, x.jsx)(oi, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        c(!0)
                                    },
                                    children: t("Action.MarkAsRead")
                                }), (0, x.jsx)(oi, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        c(!1)
                                    },
                                    children: t("Action.MarkAsUnread")
                                })]
                            })]
                        }), (0, x.jsx)(aR, {
                            translate: t,
                            pagination: i,
                            onChangePage: f
                        })]
                    })
                };

            function aD(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aH(e) {
                if (Array.isArray(e)) return e
            }

            function aL() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function aF(e, t) {
                if (e) {
                    if ("string" == typeof e) return aD(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aD(e, t)
                }
            }
            var aU = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                az = N().forwardRef(function(e, t) {
                    var r, n = aH(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || aF(r) || aL(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.name,
                        l = o.size,
                        u = o.className,
                        c = (o.children, function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(o, ["name", "size", "className", "children"])),
                        s = (aH(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(a) || aF(a, 1) || aL())[0];
                    return N().createElement("span", function(e) {
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
                        className: rn("grow-0 shrink-0 basis-auto icon", i, aU[void 0 === l ? "Medium" : l], u)
                    }, c))
                });
            az.displayName = "Icon";
            var aG = function(e) {
                    var t = e.titleText,
                        r = e.size,
                        n = void 0 === r ? "XSmall" : r,
                        o = e.className;
                    return (0, x.jsxs)("span", {
                        className: rn("relative inline-flex items-center justify-center", o),
                        role: "img",
                        "aria-label": t,
                        title: t,
                        children: [(0, x.jsx)(az, {
                            name: "icon-filled-verified-backplate",
                            className: "content-system-emphasis",
                            size: n
                        }), (0, x.jsx)(az, {
                            name: "icon-filled-verified-check",
                            className: "absolute content-[white]",
                            size: n
                        })]
                    })
                },
                aV = r(611),
                aK = r.n(aV),
                aX = function(e) {
                    return "string" == typeof e ? e : e.src
                },
                aW = function(e) {
                    var t = e.className;
                    return (0, x.jsxs)("span", {
                        "aria-hidden": "true",
                        className: aK()("flex items-center justify-center", t),
                        children: [(0, x.jsx)("img", {
                            alt: "",
                            src: aX("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1NiIgaGVpZ2h0PSI1NiIgZmlsbD0ibm9uZSIgdmlld0JveD0iMCAwIDU2IDU2Ij48cGF0aCBmaWxsPSIjMzkzYjNkIiBkPSJNMTEuNjc2IDAgMCA0NC4xNjYgNDMuNTc3IDU2bDExLjY3Ni00NC4xNjZ6bTIwLjQwOSAzNS44MjctMTIuMTc3LTMuMzA4IDMuMjY0LTEyLjM0MiAxMi4xODIgMy4zMDh6Ii8+PC9zdmc+"),
                            className: "dark:hidden",
                            style: {
                                width: "100%",
                                height: "100%"
                            }
                        }), (0, x.jsx)("img", {
                            alt: "",
                            src: aX("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1NiIgaGVpZ2h0PSI1NiIgZmlsbD0ibm9uZSIgdmlld0JveD0iMCAwIDU2IDU2Ij48cGF0aCBmaWxsPSIjZmZmIiBkPSJNMTEuNjc2IDAgMCA0NC4xNjYgNDMuNTc3IDU2bDExLjY3Ni00NC4xNjZ6bTIwLjQwOSAzNS44MjctMTIuMTc3LTMuMzA4IDMuMjY0LTEyLjM0MiAxMi4xODIgMy4zMDh6Ii8+PC9zdmc+"),
                            className: "hidden dark:block",
                            style: {
                                width: "100%",
                                height: "100%"
                            }
                        })]
                    })
                },
                aZ = function(e) {
                    var t = e.message,
                        r = e.activeTab,
                        n = e.renderThumbnail,
                        o = r === rp ? t.recipient : t.sender,
                        a = r !== rp && 1 === t.sender.id;
                    return (0, x.jsx)("a", {
                        href: o.profileLink,
                        className: "size-800 shrink-0 flex items-center justify-center",
                        children: a ? (0, x.jsx)(aW, {
                            className: "size-800"
                        }) : (0, x.jsx)("span", {
                            className: "radius-circle clip size-800",
                            children: n({
                                userId: o.id,
                                altName: o.displayName
                            })
                        })
                    })
                },
                a$ = function(e) {
                    var t = e.translate,
                        r = e.renderThumbnail,
                        n = e.formatDetailDate,
                        o = e.message,
                        a = e.activeTab;
                    if (!o) return null;
                    var i = a === rp ? o.recipient : o.sender;
                    return (0, x.jsxs)("div", {
                        className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large",
                        children: [(0, x.jsxs)("div", {
                            className: "flex justify-between gap-medium",
                            children: [(0, x.jsxs)("div", {
                                className: "min-width-0",
                                children: [(0, x.jsx)("h2", {
                                    className: "text-heading-medium content-emphasis margin-none text-wrap",
                                    children: o.subject
                                }), (0, x.jsxs)("div", {
                                    className: "flex gap-small margin-top-medium",
                                    children: [(0, x.jsx)(aZ, {
                                        message: o,
                                        activeTab: a,
                                        renderThumbnail: r
                                    }), (0, x.jsxs)("div", {
                                        className: "min-width-0 flex flex-col gap-y-small",
                                        children: [(0, x.jsxs)("a", {
                                            href: i.profileLink,
                                            className: "text-title-medium content-emphasis flex items-center gap-xsmall",
                                            children: [(0, x.jsx)("span", {
                                                children: i.displayName
                                            }), i.hasVerifiedBadge ? (0, x.jsx)(aG, {
                                                size: "Medium",
                                                titleText: t("Creator.VerifiedBadgeIconAccessibilityText")
                                            }) : null]
                                        }), (0, x.jsxs)("div", {
                                            className: "text-body-medium content-muted",
                                            children: ["@", i.name]
                                        }), (0, x.jsx)("div", {
                                            className: "text-caption-medium content-muted",
                                            children: n(o.created)
                                        })]
                                    })]
                                })]
                            }), o.isReportAbuseDisplayed ? (0, x.jsx)("a", {
                                href: o.abuseReportUrl,
                                className: "text-body-medium content-muted text-no-wrap abuse-report-modal",
                                children: t("Action.ReportAbuse")
                            }) : null]
                        }), (0, x.jsx)("div", {
                            className: "private-message-body text-body-large content-default margin-top-large",
                            dangerouslySetInnerHTML: {
                                __html: o.body
                            }
                        })]
                    })
                },
                aY = function(e) {
                    var t = e.translate,
                        r = e.message,
                        n = e.activeTab,
                        o = e.isUnread,
                        a = n === rp ? r.recipient : r.sender;
                    return (0, x.jsxs)("span", {
                        className: "flex items-center gap-xsmall text-truncate-end",
                        children: [(0, x.jsx)("span", {
                            className: aK()("text-truncate-end text-title-large", o ? "content-emphasis" : "content-muted"),
                            children: a.displayName
                        }), a.hasVerifiedBadge ? (0, x.jsx)(aG, {
                            size: "Medium",
                            titleText: t("Creator.VerifiedBadgeIconAccessibilityText")
                        }) : null, (0, x.jsxs)("span", {
                            className: "text-truncate-end text-body-medium content-muted",
                            children: ["@", a.name]
                        })]
                    })
                },
                aq = function(e) {
                    var t = e.message,
                        r = e.activeTab,
                        n = e.renderThumbnail,
                        o = e.onOpen,
                        a = r === rp ? t.recipient : t.sender,
                        i = r !== rp && 1 === t.sender.id;
                    return (0, x.jsx)("button", {
                        type: "button",
                        className: "private-message-row-avatar bg-none stroke-none padding-none width-full size-800 flex items-center justify-center",
                        onClick: o,
                        "aria-label": a.displayName,
                        children: i ? (0, x.jsx)(aW, {
                            className: "size-700"
                        }) : (0, x.jsx)("span", {
                            className: "radius-circle clip size-700",
                            children: n({
                                userId: a.id,
                                altName: a.displayName
                            })
                        })
                    })
                },
                aJ = function(e) {
                    var t = e.translate,
                        r = e.renderThumbnail,
                        n = e.formatListDate,
                        o = e.message,
                        a = e.index,
                        i = e.activeTab,
                        l = e.isSelected,
                        u = e.isSelectable,
                        c = e.onToggleSelection,
                        s = e.onOpen,
                        f = function() {
                            s(o, a)
                        },
                        p = !o.isRead && i !== rp;
                    return (0, x.jsxs)("div", {
                        className: aK()("private-message-row grid items-center gap-medium padding-large stroke-bottom stroke-muted transition-colors", p ? "bg-surface-200 hover:bg-surface-300" : "bg-surface-100 hover:bg-surface-300"),
                        children: [(0, x.jsx)(am, {
                            className: aK()(!u && "invisible"),
                            children: (0, x.jsx)(ah, {
                                "aria-label": o.subject,
                                size: "Medium",
                                placement: "Start",
                                isChecked: l,
                                onCheckedChange: function() {
                                    c(o.id)
                                }
                            })
                        }), (0, x.jsx)(aq, {
                            message: o,
                            activeTab: i,
                            renderThumbnail: r,
                            onOpen: f
                        }), (0, x.jsxs)("button", {
                            type: "button",
                            className: "bg-none stroke-none padding-none flex flex-col gap-y-small",
                            onClick: f,
                            "aria-label": o.subject,
                            children: [(0, x.jsxs)("div", {
                                className: "flex items-center justify-between gap-small text-no-wrap",
                                children: [(0, x.jsx)(aY, {
                                    translate: t,
                                    message: o,
                                    activeTab: i,
                                    isUnread: p
                                }), (0, x.jsx)("span", {
                                    className: "text-caption-medium content-muted",
                                    children: n(o.created)
                                })]
                            }), (0, x.jsx)("div", {
                                className: "flex text-no-wrap",
                                children: (0, x.jsxs)("span", {
                                    className: "text-truncate-end text-body-large content-muted",
                                    children: [(0, x.jsx)("span", {
                                        className: p ? "content-emphasis" : "content-muted",
                                        children: o.subject
                                    }), " - ", rC(o.body)]
                                })
                            })]
                        })]
                    })
                };

            function aQ(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var a0 = (aQ(E = {}, rf, "Label.NoMessagesInInbox"), aQ(E, rp, "Label.NoSentMessages"), aQ(E, rd, "Message.NoNews"), aQ(E, rh, "Label.NoMessagesInArchive"), E),
                a1 = function(e) {
                    var t, r = e.translate,
                        n = e.renderThumbnail,
                        o = e.formatListDate,
                        a = e.page,
                        i = e.activeTab,
                        l = e.selectedMessageIds,
                        u = e.onToggleSelection,
                        c = e.onOpenMessage,
                        s = null != (t = null == a ? void 0 : a.collection) ? t : [];
                    return 0 === s.length ? (0, x.jsx)("div", {
                        className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large text-body-medium content-muted text-center",
                        children: r(a0[i])
                    }) : (0, x.jsx)("div", {
                        className: "overflow-hidden radius-medium stroke-standard stroke-muted",
                        children: s.map(function(e, t) {
                            return (0, x.jsx)(aJ, {
                                translate: r,
                                renderThumbnail: n,
                                formatListDate: o,
                                message: e,
                                index: t,
                                activeTab: i,
                                isSelected: l.has(e.id),
                                isSelectable: i !== rp && i !== rd,
                                onToggleSelection: u,
                                onOpen: c
                            }, e.id)
                        })
                    })
                };

            function a2(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var a3 = function(e) {
                    var t, r = e.translate,
                        n = e.renderThumbnail,
                        o = e.formatListDate,
                        a = e.notification,
                        i = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, k.useState)(!1)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return a2(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return a2(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        l = i[0],
                        u = i[1],
                        c = 1 === a.sender.id;
                    return (0, x.jsx)("button", {
                        type: "button",
                        className: aK()("width-full stroke-none stroke-bottom stroke-muted padding-medium text-left transition-colors", l ? "bg-surface-200 hover:bg-surface-300" : "bg-surface-100 hover:bg-surface-300"),
                        onClick: function() {
                            u(function(e) {
                                return !e
                            })
                        },
                        "aria-expanded": l,
                        "aria-label": a.subject,
                        children: (0, x.jsxs)("div", {
                            className: "flex gap-small",
                            children: [(0, x.jsx)("span", {
                                className: "size-700 shrink-0 flex items-center justify-center",
                                children: c ? (0, x.jsx)(aW, {
                                    className: "size-700"
                                }) : (0, x.jsx)("span", {
                                    className: "radius-circle clip size-700",
                                    children: n({
                                        userId: a.sender.id,
                                        altName: a.sender.displayName
                                    })
                                })
                            }), (0, x.jsxs)("span", {
                                className: "min-width-0 fill flex flex-col gap-y-small",
                                children: [(0, x.jsxs)("span", {
                                    className: "flex justify-between gap-small",
                                    children: [(0, x.jsxs)("span", {
                                        className: "text-title-medium content-emphasis flex items-center gap-xsmall min-width-0",
                                        children: [(0, x.jsx)("span", {
                                            className: "text-truncate-end",
                                            children: a.sender.displayName
                                        }), a.sender.hasVerifiedBadge ? (0, x.jsx)(aG, {
                                            size: "Medium",
                                            titleText: r("Creator.VerifiedBadgeIconAccessibilityText")
                                        }) : null, (0, x.jsxs)("span", {
                                            className: "text-body-medium content-muted",
                                            children: ["@", a.sender.name]
                                        })]
                                    }), (0, x.jsx)("span", {
                                        className: "text-caption-medium content-muted text-no-wrap",
                                        children: o(a.created)
                                    })]
                                }), (0, x.jsx)("span", {
                                    className: "private-message-row-preview text-body-large content-default",
                                    children: a.subject
                                }), l ? (0, x.jsx)("span", {
                                    className: "private-message-body block text-body-medium content-default margin-top-medium",
                                    dangerouslySetInnerHTML: {
                                        __html: a.body
                                    }
                                }) : null]
                            })]
                        })
                    })
                },
                a8 = function(e) {
                    var t, r = e.translate,
                        n = e.renderThumbnail,
                        o = e.formatListDate,
                        a = e.page,
                        i = null != (t = null == a ? void 0 : a.collection) ? t : [];
                    return 0 === i.length ? (0, x.jsx)("div", {
                        className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large text-body-medium content-muted text-center",
                        children: r("Message.NoNews")
                    }) : (0, x.jsx)("div", {
                        className: "overflow-hidden radius-medium stroke-standard stroke-muted",
                        children: i.map(function(e) {
                            return (0, x.jsx)(a3, {
                                translate: r,
                                renderThumbnail: n,
                                formatListDate: o,
                                notification: e
                            }, e.id)
                        })
                    })
                };

            function a5(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function a4(e, t, r) {
                return (a4 = io() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && ie(o, r.prototype), o
                }).apply(null, arguments)
            }

            function a6(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function a7(e) {
                return (a7 = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function a9(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        a6(e, t, r[t])
                    })
                }
                return e
            }

            function ie(e, t) {
                return (ie = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function it(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return a5(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return a5(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ir(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (ir = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return a4(e, arguments, a7(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), ie(r, e)
                })(e)
            }

            function io() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (io = function() {
                    return !!e
                })()
            }

            function ia(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            ir(Map);
            var ii = k[" useId ".trim().toString()] || function() {},
                il = 0;

            function iu(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = k.useState(ii())) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return ia(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ia(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    o = r[1];
                return oA(function() {
                    e || o(function(e) {
                        return null != e ? e : String(il++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function ic(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var is = k.createContext(void 0);

            function ip(e) {
                var t = k.useContext(is);
                return e || t || "ltr"
            }

            function id(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ih(e) {
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

            function ib(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function iy(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || ig(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ig(e, t) {
                if (e) {
                    if ("string" == typeof e) return id(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return id(e, t)
                }
            }
            var iv = "rovingFocusGroup.onEntryFocus",
                iO = {
                    bubbles: !1,
                    cancelable: !0
                },
                iw = "RovingFocusGroup",
                ij = iy((u = (l = it(oE(i = iw + "CollectionProvider"), 2))[0], c = l[1], f = (s = it(u(i, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], p = s[1], (d = function(e) {
                    var t = e.scope,
                        r = e.children,
                        n = N().useRef(null),
                        o = N().useRef(new Map).current;
                    return (0, x.jsx)(f, {
                        scope: t,
                        itemMap: o,
                        collectionRef: n,
                        children: r
                    })
                }).displayName = i, m = oz(h = iw + "CollectionSlot"), (b = N().forwardRef(function(e, t) {
                    var r = e.scope,
                        n = e.children,
                        o = nX(t, p(h, r).collectionRef);
                    return (0, x.jsx)(m, {
                        ref: o,
                        children: n
                    })
                })).displayName = h, g = "data-radix-collection-item", v = oz(y = iw + "CollectionItemSlot"), (O = N().forwardRef(function(e, t) {
                    var r, n, o = e.scope,
                        a = e.children,
                        i = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(e, ["scope", "children"]),
                        l = N().useRef(null),
                        u = nX(t, l),
                        c = p(y, o);
                    return N().useEffect(function() {
                        return c.itemMap.set(l, a9({
                                ref: l
                            }, i)),
                            function() {
                                c.itemMap.delete(l)
                            }
                    }), (0, x.jsx)(v, (r = a9({}, a6({}, g, "")), n = n = {
                        ref: u,
                        children: a
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
                })).displayName = y, [{
                    Provider: d,
                    Slot: b,
                    ItemSlot: O
                }, function(e) {
                    var t = p(iw + "CollectionConsumer", e);
                    return N().useCallback(function() {
                        var e = t.collectionRef.current;
                        if (!e) return [];
                        var r = Array.from(e.querySelectorAll("[".concat(g, "]")));
                        return Array.from(t.itemMap.values()).sort(function(e, t) {
                            return r.indexOf(e.ref.current) - r.indexOf(t.ref.current)
                        })
                    }, [t.collectionRef, t.itemMap])
                }, c]), 3),
                iS = ij[0],
                iE = ij[1],
                ix = iy(oE(iw, [ij[2]]), 2),
                iP = ix[0],
                iA = ix[1],
                iI = iy(iP(iw), 2),
                ik = iI[0],
                iN = iI[1],
                iT = k.forwardRef(function(e, t) {
                    return (0, x.jsx)(iS.Provider, {
                        scope: e.__scopeRovingFocusGroup,
                        children: (0, x.jsx)(iS.Slot, {
                            scope: e.__scopeRovingFocusGroup,
                            children: (0, x.jsx)(iC, im(ih({}, e), {
                                ref: t
                            }))
                        })
                    })
                });
            iT.displayName = iw;
            var iC = k.forwardRef(function(e, t) {
                    var r, n = e.__scopeRovingFocusGroup,
                        o = e.orientation,
                        a = e.loop,
                        i = e.dir,
                        l = e.currentTabStopId,
                        u = e.defaultCurrentTabStopId,
                        c = e.onCurrentTabStopIdChange,
                        s = e.onEntryFocus,
                        f = e.preventScrollOnEntryFocus,
                        p = void 0 !== f && f,
                        d = ib(e, ["__scopeRovingFocusGroup", "orientation", "loop", "dir", "currentTabStopId", "defaultCurrentTabStopId", "onCurrentTabStopIdChange", "onEntryFocus", "preventScrollOnEntryFocus"]),
                        h = k.useRef(null),
                        m = nX(t, h),
                        b = ip(i),
                        y = iy(oT({
                            prop: l,
                            defaultProp: null != u ? u : null,
                            onChange: c,
                            caller: iw
                        }), 2),
                        g = y[0],
                        v = y[1],
                        O = iy(k.useState(!1), 2),
                        w = O[0],
                        j = O[1],
                        S = (r = k.useRef(s), k.useEffect(function() {
                            r.current = s
                        }), k.useMemo(function() {
                            return function() {
                                for (var e, t = arguments.length, n = Array(t), o = 0; o < t; o++) n[o] = arguments[o];
                                return null == (e = r.current) ? void 0 : e.call.apply(e, [r].concat(function(e) {
                                    if (Array.isArray(e)) return ic(e)
                                }(n) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(n) || function(e) {
                                    if (e) {
                                        if ("string" == typeof e) return ic(e, void 0);
                                        var t = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ic(e, void 0)
                                    }
                                }(n) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()))
                            }
                        }, [])),
                        E = iE(n),
                        P = k.useRef(!1),
                        A = iy(k.useState(0), 2),
                        I = A[0],
                        N = A[1];
                    return k.useEffect(function() {
                        var e = h.current;
                        if (e) return e.addEventListener(iv, S),
                            function() {
                                return e.removeEventListener(iv, S)
                            }
                    }, [S]), (0, x.jsx)(ik, {
                        scope: n,
                        orientation: o,
                        dir: b,
                        loop: void 0 !== a && a,
                        currentTabStopId: g,
                        onItemFocus: k.useCallback(function(e) {
                            return v(e)
                        }, [v]),
                        onItemShiftTab: k.useCallback(function() {
                            return j(!0)
                        }, []),
                        onFocusableItemAdd: k.useCallback(function() {
                            return N(function(e) {
                                return e + 1
                            })
                        }, []),
                        onFocusableItemRemove: k.useCallback(function() {
                            return N(function(e) {
                                return e - 1
                            })
                        }, []),
                        children: (0, x.jsx)(oZ.div, im(ih({
                            tabIndex: w || 0 === I ? -1 : 0,
                            "data-orientation": o
                        }, d), {
                            ref: m,
                            style: ih({
                                outline: "none"
                            }, e.style),
                            onMouseDown: oP(e.onMouseDown, function() {
                                P.current = !0
                            }),
                            onFocus: oP(e.onFocus, function(e) {
                                var t = !P.current;
                                if (e.target === e.currentTarget && t && !w) {
                                    var r = new CustomEvent(iv, iO);
                                    if (e.currentTarget.dispatchEvent(r), !r.defaultPrevented) {
                                        var n = E().filter(function(e) {
                                            return e.focusable
                                        });
                                        iB([n.find(function(e) {
                                            return e.active
                                        }), n.find(function(e) {
                                            return e.id === g
                                        })].concat(function(e) {
                                            if (Array.isArray(e)) return id(e)
                                        }(n) || function(e) {
                                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                        }(n) || ig(n) || function() {
                                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                        }()).filter(Boolean).map(function(e) {
                                            return e.ref.current
                                        }), p)
                                    }
                                }
                                P.current = !1
                            }),
                            onBlur: oP(e.onBlur, function() {
                                return j(!1)
                            })
                        }))
                    })
                }),
                iM = "RovingFocusGroupItem",
                i_ = k.forwardRef(function(e, t) {
                    var r = e.__scopeRovingFocusGroup,
                        n = e.focusable,
                        o = void 0 === n || n,
                        a = e.active,
                        i = e.tabStopId,
                        l = e.children,
                        u = ib(e, ["__scopeRovingFocusGroup", "focusable", "active", "tabStopId", "children"]),
                        c = iu(),
                        s = i || c,
                        f = iN(iM, r),
                        p = f.currentTabStopId === s,
                        d = iE(r),
                        h = f.onFocusableItemAdd,
                        m = f.onFocusableItemRemove,
                        b = f.currentTabStopId;
                    return k.useEffect(function() {
                        if (o) return h(),
                            function() {
                                return m()
                            }
                    }, [o, h, m]), (0, x.jsx)(iS.ItemSlot, {
                        scope: r,
                        id: s,
                        focusable: o,
                        active: void 0 !== a && a,
                        children: (0, x.jsx)(oZ.span, im(ih({
                            tabIndex: p ? 0 : -1,
                            "data-orientation": f.orientation
                        }, u), {
                            ref: t,
                            onMouseDown: oP(e.onMouseDown, function(e) {
                                o ? f.onItemFocus(s) : e.preventDefault()
                            }),
                            onFocus: oP(e.onFocus, function() {
                                return f.onItemFocus(s)
                            }),
                            onKeyDown: oP(e.onKeyDown, function(e) {
                                if ("Tab" === e.key && e.shiftKey) return void f.onItemShiftTab();
                                if (e.target === e.currentTarget) {
                                    var t = function(e, t, r) {
                                        var n, o = (n = e.key, "rtl" !== r ? n : "ArrowLeft" === n ? "ArrowRight" : "ArrowRight" === n ? "ArrowLeft" : n);
                                        if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(o)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(o))) return iR[o]
                                    }(e, f.orientation, f.dir);
                                    if (void 0 !== t) {
                                        if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                                        e.preventDefault();
                                        var r = d().filter(function(e) {
                                            return e.focusable
                                        }).map(function(e) {
                                            return e.ref.current
                                        });
                                        if ("last" === t) r.reverse();
                                        else if ("prev" === t || "next" === t) {
                                            "prev" === t && r.reverse();
                                            var n, o, a = r.indexOf(e.currentTarget);
                                            r = f.loop ? (n = r, o = a + 1, n.map(function(e, t) {
                                                return n[(o + t) % n.length]
                                            })) : r.slice(a + 1)
                                        }
                                        setTimeout(function() {
                                            return iB(r)
                                        })
                                    }
                                }
                            }),
                            children: "function" == typeof l ? l({
                                isCurrentTabStop: p,
                                hasTabStop: null != b
                            }) : l
                        }))
                    })
                });
            i_.displayName = iM;
            var iR = {
                ArrowLeft: "prev",
                ArrowUp: "prev",
                ArrowRight: "next",
                ArrowDown: "next",
                PageUp: "first",
                Home: "first",
                PageDown: "last",
                End: "last"
            };

            function iB(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                    r = document.activeElement,
                    n = !0,
                    o = !1,
                    a = void 0;
                try {
                    for (var i, l = e[Symbol.iterator](); !(n = (i = l.next()).done); n = !0) {
                        var u = i.value;
                        if (u === r || (u.focus({
                                preventScroll: t
                            }), document.activeElement !== r)) return
                    }
                } catch (e) {
                    o = !0, a = e
                } finally {
                    try {
                        n || null == l.return || l.return()
                    } finally {
                        if (o) throw a
                    }
                }
            }

            function iD(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iH(e) {
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

            function iF(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function iU(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return iD(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iD(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var iz = "Tabs",
                iG = iU(oE(iz, [iA]), 2),
                iV = iG[0];
            iG[1];
            var iK = iA(),
                iX = iU(iV(iz), 2),
                iW = iX[0],
                iZ = iX[1],
                i$ = k.forwardRef(function(e, t) {
                    var r = e.__scopeTabs,
                        n = e.value,
                        o = e.onValueChange,
                        a = e.defaultValue,
                        i = e.orientation,
                        l = void 0 === i ? "horizontal" : i,
                        u = e.dir,
                        c = e.activationMode,
                        s = iF(e, ["__scopeTabs", "value", "onValueChange", "defaultValue", "orientation", "dir", "activationMode"]),
                        f = ip(u),
                        p = iU(oT({
                            prop: n,
                            onChange: o,
                            defaultProp: null != a ? a : "",
                            caller: iz
                        }), 2),
                        d = p[0],
                        h = p[1];
                    return (0, x.jsx)(iW, {
                        scope: r,
                        baseId: iu(),
                        value: d,
                        onValueChange: h,
                        orientation: l,
                        dir: f,
                        activationMode: void 0 === c ? "automatic" : c,
                        children: (0, x.jsx)(oZ.div, iL(iH({
                            dir: f,
                            "data-orientation": l
                        }, s), {
                            ref: t
                        }))
                    })
                });
            i$.displayName = iz;
            var iY = "TabsList",
                iq = k.forwardRef(function(e, t) {
                    var r = e.__scopeTabs,
                        n = e.loop,
                        o = iF(e, ["__scopeTabs", "loop"]),
                        a = iZ(iY, r),
                        i = iK(r);
                    return (0, x.jsx)(iT, iL(iH({
                        asChild: !0
                    }, i), {
                        orientation: a.orientation,
                        dir: a.dir,
                        loop: void 0 === n || n,
                        children: (0, x.jsx)(oZ.div, iL(iH({
                            role: "tablist",
                            "aria-orientation": a.orientation
                        }, o), {
                            ref: t
                        }))
                    }))
                });
            iq.displayName = iY;
            var iJ = "TabsTrigger",
                iQ = k.forwardRef(function(e, t) {
                    var r = e.__scopeTabs,
                        n = e.value,
                        o = e.disabled,
                        a = void 0 !== o && o,
                        i = iF(e, ["__scopeTabs", "value", "disabled"]),
                        l = iZ(iJ, r),
                        u = iK(r),
                        c = i2(l.baseId, n),
                        s = i3(l.baseId, n),
                        f = n === l.value;
                    return (0, x.jsx)(i_, iL(iH({
                        asChild: !0
                    }, u), {
                        focusable: !a,
                        active: f,
                        children: (0, x.jsx)(oZ.button, iL(iH({
                            type: "button",
                            role: "tab",
                            "aria-selected": f,
                            "aria-controls": s,
                            "data-state": f ? "active" : "inactive",
                            "data-disabled": a ? "" : void 0,
                            disabled: a,
                            id: c
                        }, i), {
                            ref: t,
                            onMouseDown: oP(e.onMouseDown, function(e) {
                                a || 0 !== e.button || !1 !== e.ctrlKey ? e.preventDefault() : l.onValueChange(n)
                            }),
                            onKeyDown: oP(e.onKeyDown, function(e) {
                                [" ", "Enter"].includes(e.key) && l.onValueChange(n)
                            }),
                            onFocus: oP(e.onFocus, function() {
                                var e = "manual" !== l.activationMode;
                                f || a || !e || l.onValueChange(n)
                            })
                        }))
                    }))
                });
            iQ.displayName = iJ;
            var i0 = "TabsContent",
                i1 = k.forwardRef(function(e, t) {
                    var r = e.__scopeTabs,
                        n = e.value,
                        o = e.forceMount,
                        a = e.children,
                        i = iF(e, ["__scopeTabs", "value", "forceMount", "children"]),
                        l = iZ(i0, r),
                        u = i2(l.baseId, n),
                        c = i3(l.baseId, n),
                        s = n === l.value,
                        f = k.useRef(s);
                    return k.useEffect(function() {
                        var e = requestAnimationFrame(function() {
                            return f.current = !1
                        });
                        return function() {
                            return cancelAnimationFrame(e)
                        }
                    }, []), (0, x.jsx)(oR, {
                        present: o || s,
                        children: function(r) {
                            var n = r.present;
                            return (0, x.jsx)(oZ.div, iL(iH({
                                "data-state": s ? "active" : "inactive",
                                "data-orientation": l.orientation,
                                role: "tabpanel",
                                "aria-labelledby": u,
                                hidden: !n,
                                id: c,
                                tabIndex: 0
                            }, i), {
                                ref: t,
                                style: iL(iH({}, e.style), {
                                    animationDuration: f.current ? "0s" : void 0
                                }),
                                children: n && a
                            }))
                        }
                    })
                });

            function i2(e, t) {
                return "".concat(e, "-trigger-").concat(t)
            }

            function i3(e, t) {
                return "".concat(e, "-content-").concat(t)
            }

            function i8(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function i5(e) {
                if (Array.isArray(e)) return e
            }

            function i4() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function i6(e) {
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

            function i7(e, t) {
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

            function i9(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function le(e, t) {
                return i5(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || lr(e, t) || i4()
            }

            function lt(e) {
                return i5(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || lr(e) || i4()
            }

            function lr(e, t) {
                if (e) {
                    if ("string" == typeof e) return i8(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return i8(e, t)
                }
            }
            i1.displayName = i0;
            var ln = (0, k.createContext)({
                    size: "Medium",
                    variant: "Contained",
                    fitBehavior: "Fill"
                }),
                lo = {
                    XSmall: ["text-label-small", "height-700"],
                    Small: ["text-label-small", "height-800"],
                    Medium: ["text-label-medium", "height-1000"],
                    Large: ["text-label-medium", "height-1200"]
                },
                la = {
                    XSmall: "padding-x-small",
                    Small: "padding-x-small",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                li = {
                    XSmall: {
                        Inlined: "",
                        Contained: "padding-top-small"
                    },
                    Small: {
                        Inlined: "",
                        Contained: "padding-top-small"
                    },
                    Medium: {
                        Inlined: "padding-top-xsmall",
                        Contained: "padding-top-medium"
                    },
                    Large: {
                        Inlined: "padding-top-xsmall",
                        Contained: "padding-top-xlarge"
                    }
                },
                ll = {
                    XSmall: "padding-bottom-small",
                    Small: "padding-bottom-small",
                    Medium: "padding-bottom-medium",
                    Large: "padding-bottom-xlarge"
                },
                lu = (0, k.forwardRef)(function(e, t) {
                    var r = lt([e, t]),
                        n = r[0],
                        o = r.slice(1),
                        a = n.children,
                        i = n.className,
                        l = n.size,
                        u = n.variant,
                        c = n.fitBehavior,
                        s = i9(n, ["children", "className", "size", "variant", "fitBehavior"]),
                        f = le(o, 1)[0],
                        p = (0, k.useMemo)(function() {
                            return {
                                size: l || "Large",
                                variant: u || "Contained",
                                fitBehavior: c || "Fill"
                            }
                        }, [l, u, c]);
                    return N().createElement(ln.Provider, {
                        value: p
                    }, N().createElement(i$, i7(i6({
                        ref: f
                    }, s), {
                        className: rn("foundation-web-tabs", "flex flex-col", i)
                    }), a))
                }),
                lc = (0, k.forwardRef)(function(e, t) {
                    var r = lt([e, t]),
                        n = r[0],
                        o = r.slice(1),
                        a = n.children,
                        i = n.className,
                        l = i9(n, ["children", "className"]),
                        u = le(o, 1)[0],
                        c = (0, k.useContext)(ln).fitBehavior,
                        s = (0, k.useRef)(null),
                        f = le((0, k.useState)({
                            width: 0,
                            left: 0,
                            opacity: 0
                        }), 2),
                        p = f[0],
                        d = f[1],
                        h = N().useCallback(function(e) {
                            s.current = e, "function" == typeof u ? u(e) : u && "current" in u && (u.current = e)
                        }, [u]);
                    return (0, k.useEffect)(function() {
                        var e, t = function() {
                            var e = s.current;
                            if (e) {
                                var t = e.querySelector('[data-state="active"]');
                                if (t) {
                                    var r = e.getBoundingClientRect(),
                                        n = t.getBoundingClientRect();
                                    d({
                                        width: n.width,
                                        left: n.left - r.left,
                                        opacity: 1
                                    })
                                }
                            }
                        };
                        t();
                        var r = new MutationObserver(function() {
                                cancelAnimationFrame(e), e = requestAnimationFrame(t)
                            }),
                            n = "u" > typeof ResizeObserver ? new ResizeObserver(t) : null,
                            o = s.current;
                        return o && (r.observe(o, {
                                subtree: !0,
                                attributes: !0,
                                attributeFilter: ["data-state"]
                            }), null == n || n.observe(o)), window.addEventListener("resize", t),
                            function() {
                                cancelAnimationFrame(e), r.disconnect(), null == n || n.disconnect(), window.removeEventListener("resize", t)
                            }
                    }, [a]), N().createElement("div", {
                        className: rn("relative scroll-x", i),
                        style: {
                            scrollbarWidth: "none",
                            msOverflowStyle: "none"
                        }
                    }, N().createElement(iq, i7(i6({
                        ref: h
                    }, l), {
                        className: rn("flex items-stretch bg-none border-0 stroke-none")
                    }), a), "Fit" === c && N().createElement("div", {
                        "aria-hidden": "true",
                        className: "absolute bottom-[0px] left-[0px] right-[0px] height-[var(--stroke-thick)] bg-[var(--color-stroke-muted)] [z-index:0]"
                    }), N().createElement("div", {
                        className: "absolute bottom-[0px] bg-system-contrast transition-all duration-200 ease-standard-out",
                        style: {
                            height: "var(--stroke-thick)",
                            zIndex: 1,
                            width: "".concat(p.width, "px"),
                            left: "".concat(p.left, "px"),
                            opacity: p.opacity
                        }
                    }))
                }),
                ls = (0, k.forwardRef)(function(e, t) {
                    var r = lt([e, t]),
                        n = r[0],
                        o = r.slice(1),
                        a = n.children,
                        i = n.className,
                        l = n.isDisabled,
                        u = void 0 !== l && l,
                        c = i9(n, ["children", "className", "isDisabled"]),
                        s = le(o, 1)[0],
                        f = (0, k.useContext)(ln),
                        p = f.size,
                        d = f.variant,
                        h = f.fitBehavior;
                    return N().createElement(iQ, i7(i6({
                        ref: s
                    }, c), {
                        disabled: u,
                        style: {
                            borderBottom: "var(--stroke-thick) solid var(--color-stroke-muted)",
                            borderTop: "none",
                            borderLeft: "none",
                            borderRight: "none"
                        },
                        className: rn("relative flex items-center justify-center cursor-pointer bg-none shrink-0", nL, lo[p], "Fill" === h ? "grow-1 ".concat(la[p]) : "", li[p][d], ll[p], u && "opacity-[0.5]", i)
                    }), N().createElement(nF, null), N().createElement("div", {
                        className: "flex items-center justify-center height-600 relative"
                    }, a))
                }),
                lf = (0, k.forwardRef)(function(e, t) {
                    var r = lt([e, t]),
                        n = r[0],
                        o = r.slice(1),
                        a = n.children,
                        i = n.className,
                        l = i9(n, ["children", "className"]),
                        u = le(o, 1)[0];
                    return N().createElement(i1, i7(i6({
                        ref: u
                    }, l), {
                        className: rn("padding-top-large", "outline-none", i)
                    }), a)
                });

            function lp(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ld(e) {
                if (Array.isArray(e)) return e
            }

            function lh() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function lm(e, t) {
                if (e) {
                    if ("string" == typeof e) return lp(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lp(e, t)
                }
            }
            var lb = {
                    Neutral: "bg-shift-200",
                    Standard: "bg-shift-200",
                    Contrast: "bg-system-contrast",
                    Emphasis: "bg-system-emphasis",
                    Success: "bg-[rgb(from_var(--color-system-success)_r_g_b_/_0.2)]",
                    Warning: "bg-[rgb(from_var(--color-system-warning)_r_g_b_/_0.2)]",
                    Alert: "bg-[rgb(from_var(--color-system-alert)_r_g_b_/_0.2)]",
                    OverMediaLight: "bg-[var(--light-mode-over-media-0)]",
                    OverMedia: "bg-over-media-0"
                },
                ly = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-emphasis",
                    Warning: "content-emphasis",
                    Alert: "content-emphasis",
                    OverMediaLight: "content-[var(--light-mode-content-emphasis)]",
                    OverMedia: "content-emphasis"
                },
                lg = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-system-success",
                    Warning: "content-system-warning",
                    Alert: "content-system-alert",
                    OverMediaLight: "content-[var(--light-mode-content-emphasis)]",
                    OverMedia: "content-emphasis"
                },
                lv = {
                    Neutral: "stroke-none",
                    Standard: "stroke-none",
                    Contrast: "stroke-none",
                    Emphasis: "stroke-none",
                    Success: "stroke-none",
                    Warning: "stroke-none",
                    Alert: "stroke-none",
                    OverMediaLight: "stroke-none",
                    OverMedia: "stroke-none"
                },
                lO = {
                    Small: "height-600",
                    XSmall: "height-400"
                },
                lw = {
                    Small: "padding-x-small",
                    XSmall: "padding-x-xsmall"
                },
                lj = {
                    Small: "width-600",
                    XSmall: "width-400"
                },
                lS = {
                    Small: "text-label-small",
                    XSmall: "text-caption-small"
                },
                lE = {
                    Small: "padding-y-xsmall",
                    XSmall: "padding-y-none"
                },
                lx = {
                    Small: "XSmall",
                    XSmall: "XSmall"
                },
                lP = {
                    Pill: "radius-circle",
                    Box: "radius-small"
                },
                lA = N().forwardRef(function(e, t) {
                    var r, n, o, a = ld(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || lm(r) || lh(),
                        i = a[0],
                        l = a.slice(1),
                        u = i.className,
                        c = i.label,
                        s = i.variant,
                        f = void 0 === s ? "Standard" : s,
                        p = i.icon,
                        d = i.iconPosition,
                        h = void 0 === d ? "Leading" : d,
                        m = i.size,
                        b = void 0 === m ? "Small" : m,
                        y = i.shape,
                        g = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(i, ["className", "label", "variant", "icon", "iconPosition", "size", "shape"]),
                        v = (ld(l) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(l) || lm(l, 1) || lh())[0],
                        O = p && !c,
                        w = "padding-x-xxsmall";
                    p && (w = "Leading" === h ? "padding-right-xxsmall" : "padding-left-xxsmall");
                    var j = p && N().createElement(nH, {
                        name: p,
                        size: lx[b],
                        className: lg[f]
                    });
                    return N().createElement("div", (n = function(e) {
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
                    }, g), o = o = {
                        className: rn("foundation-web-badge flex items-center select-none gap-[var(--size-150)]", lP[void 0 === y ? "Pill" : y], lO[b], O ? [lj[b], "justify-center"] : ["width-[fit-content]", lw[b]], lb[f], ly[f], lv[f], u)
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(o)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                    }), n), "Leading" === h && j, c && N().createElement("span", {
                        className: rn("text-no-wrap text-truncate-split", lS[b], lE[b], w, ly[f])
                    }, c), "Trailing" === h && j)
                });
            lA.displayName = "Badge";
            var lI = function(e) {
                    var t = e.activeTab,
                        r = e.tabs,
                        n = e.onSelectTab,
                        o = e.children;
                    return (0, x.jsxs)(lu, {
                        value: t,
                        variant: "Contained",
                        size: "Large",
                        fitBehavior: "Fill",
                        onValueChange: function(e) {
                            var t = r.find(function(t) {
                                return t.name === e
                            });
                            t && n(t.name)
                        },
                        children: [(0, x.jsx)(lc, {
                            className: "radius-none overflow-hidden",
                            children: r.map(function(e) {
                                return (0, x.jsx)(ls, {
                                    value: e.name,
                                    children: (0, x.jsxs)("span", {
                                        className: "flex items-center justify-center gap-small",
                                        children: [(0, x.jsx)("span", {
                                            children: e.label
                                        }), e.count ? (0, x.jsx)(lA, {
                                            label: String(e.count),
                                            variant: "Contrast"
                                        }) : null]
                                    })
                                }, e.name)
                            })
                        }), (0, x.jsx)(lf, {
                            value: t,
                            style: {
                                paddingTop: 0
                            },
                            children: o
                        })]
                    })
                },
                lk = function(e) {
                    var t, r, n, o = e.translate,
                        a = e.renderThumbnail,
                        i = e.formatListDate,
                        l = e.formatDetailDate,
                        u = nC({
                            translate: o
                        }),
                        c = (null == (r = (0, rs.getDeviceMeta)()) ? void 0 : r.isInApp) === !0,
                        s = null != (t = null == (n = u.page) ? void 0 : n.collection.length) ? t : 0;
                    return (0, x.jsxs)("div", {
                        className: "private-message-page margin-x-auto padding-medium",
                        children: [c ? null : (0, x.jsx)("h1", {
                            className: "text-heading-large content-emphasis margin-top-none margin-bottom-medium",
                            children: o("Heading.Message")
                        }), (0, x.jsxs)(lI, {
                            activeTab: u.route.tab,
                            tabs: u.tabs,
                            onSelectTab: u.openTab,
                            children: [(0, x.jsx)(aB, {
                                translate: o,
                                activeTab: u.route.tab,
                                moduleState: u.moduleState,
                                selectedCount: u.selectedMessageIds.size,
                                totalCount: s,
                                pagination: u.pagination,
                                onToggleSelectAll: u.toggleSelectAll,
                                onMarkArchive: function(e) {
                                    u.markArchive(e)
                                },
                                onMarkRead: function(e) {
                                    u.markRead(e)
                                },
                                onBack: u.backToList,
                                onChangePage: u.changePage
                            }), u.loading ? (0, x.jsx)("div", {
                                className: "flex justify-center padding-xxlarge",
                                children: (0, x.jsx)(rc, {
                                    ariaLabel: o("Label.Loading"),
                                    variant: "Indeterminate",
                                    size: "Medium"
                                })
                            }) : null, !u.loading && u.error ? (0, x.jsx)("div", {
                                className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large text-body-large content-system-alert",
                                children: u.error
                            }) : null, u.loading || u.error || u.moduleState !== rm ? null : u.route.tab === rd ? (0, x.jsx)(a8, {
                                translate: o,
                                renderThumbnail: a,
                                formatListDate: i,
                                page: u.page
                            }) : (0, x.jsx)(a1, {
                                translate: o,
                                renderThumbnail: a,
                                formatListDate: i,
                                page: u.page,
                                activeTab: u.route.tab,
                                selectedMessageIds: u.selectedMessageIds,
                                onToggleSelection: u.toggleMessageSelection,
                                onOpenMessage: function(e, t) {
                                    u.openMessage(e, t)
                                }
                            }), u.loading || u.error || u.moduleState !== rb ? null : (0, x.jsx)(a$, {
                                translate: o,
                                renderThumbnail: a,
                                formatDetailDate: l,
                                message: u.selectedMessage,
                                activeTab: u.route.tab
                            })]
                        }), (0, x.jsx)(oy, {
                            feedback: u.feedback,
                            onClose: u.dismissFeedback
                        })]
                    })
                },
                lN = JSON.parse('{"P":["Feature.Messages","Feature.ProfileBadges"]}').P,
                lT = function(e) {
                    var t = e.userId,
                        r = e.altName;
                    return (0, x.jsx)(rr.Thumbnail2d, {
                        targetId: t,
                        type: rr.ThumbnailTypes.avatarHeadshot,
                        altName: r
                    })
                },
                lC = function() {
                    var e = rt("Feature.Messages"),
                        t = rt("Feature.ProfileBadges");
                    return (0, x.jsx)(lk, {
                        translate: function(r, n) {
                            return e.has(r) ? e(r, n) : t(r, n)
                        },
                        renderThumbnail: lT,
                        formatListDate: r_,
                        formatDetailDate: rR
                    })
                },
                lM = function() {
                    var e;
                    return null != (e = document.getElementById("private-message")) ? e : document.getElementById("private-message-web-app")
                };
            A()(function() {
                var e = lM();
                e && ("private-message-web-app" === e.id && e.classList.add("messages-container"), (0, I.renderWithErrorBoundary)((0, x.jsx)(tf, {
                    namespaces: lN,
                    children: (0, x.jsx)(lC, {})
                }), e))
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "PrivateMessage");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/privateMessage-f605f3d594fc4126.js.map