! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "3cfcaf39ee296c3041dac22e6cefeb3e0b540128"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "badc2420-255d-4e8c-964e-b1cefec40a45", e._sentryDebugIdIdentifier = "sentry-dbid-badc2420-255d-4e8c-964e-b1cefec40a45")
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

                function u(e) {
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
                        var e = u(d);
                        f = !0;
                        for (var t = s.length; t;) {
                            for (o = s, s = []; ++p < t;) o && o[p].run();
                            p = -1, t = s.length
                        }
                        o = null, f = !1,
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

                function m(e, t) {
                    this.fun = e, this.array = t
                }

                function b() {}

                function y() {}
                i.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var r = 1; r < arguments.length; r++) t[r - 1] = arguments[r];
                    s.push(new m(e, t)), 1 !== s.length || f || u(h)
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
                var v = a.exports.browser,
                    g = a.exports.binding,
                    O = {},
                    w = "browser",
                    j = "browser",
                    S = "browser",
                    E = [],
                    x = {
                        nextTick: a.exports.nextTick,
                        title: a.exports.title,
                        browser: v,
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
                        binding: g,
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
                t.addListener = a.exports.addListener, t.arch = j, t.argv = a.exports.argv, t.binding = g, t.browser = v, t.chdir = a.exports.chdir, t.cwd = a.exports.cwd, t.default = x, t.dlopen = y, t.emit = a.exports.emit, t.emitWarning = y, t.env = a.exports.env, t.execArgv = E, t.execPath = S, t.exit = y, t.features = O, t.kill = y, t.listeners = a.exports.listeners, t.memoryUsage = y, t.nextTick = a.exports.nextTick, t.off = a.exports.off, t.on = a.exports.on, t.once = a.exports.once, t.pid = 1, t.platform = w, t.prependListener = a.exports.prependListener, t.prependOnceListener = a.exports.prependOnceListener, t.removeAllListeners = a.exports.removeAllListeners, t.removeListener = a.exports.removeListener, t.title = a.exports.title, t.umask = a.exports.umask, t.uptime = y, t.uvCounters = y, t.version = a.exports.version, t.versions = a.exports.versions, e.exports = x
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
            var e, t, n, o, a, i, l, c, u, s, f, p, d, h, m, b, y, v, g, O, w, j, S, E, x = window.ReactJSX,
                P = window.Roblox["core-scripts"].util.ready,
                A = r.n(P),
                I = window.Roblox["core-scripts"].react,
                N = window.React,
                k = r.n(N);

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

            function ec(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function eu(e, t) {
                if (e) {
                    if ("string" == typeof e) return ei(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ei(e, t)
                }
            }
            var es = ((n = {})[n.EXPECT_ARGUMENT_CLOSING_BRACE = 1] = "EXPECT_ARGUMENT_CLOSING_BRACE", n[n.EMPTY_ARGUMENT = 2] = "EMPTY_ARGUMENT", n[n.MALFORMED_ARGUMENT = 3] = "MALFORMED_ARGUMENT", n[n.EXPECT_ARGUMENT_TYPE = 4] = "EXPECT_ARGUMENT_TYPE", n[n.INVALID_ARGUMENT_TYPE = 5] = "INVALID_ARGUMENT_TYPE", n[n.EXPECT_ARGUMENT_STYLE = 6] = "EXPECT_ARGUMENT_STYLE", n[n.INVALID_NUMBER_SKELETON = 7] = "INVALID_NUMBER_SKELETON", n[n.INVALID_DATE_TIME_SKELETON = 8] = "INVALID_DATE_TIME_SKELETON", n[n.EXPECT_NUMBER_SKELETON = 9] = "EXPECT_NUMBER_SKELETON", n[n.EXPECT_DATE_TIME_SKELETON = 10] = "EXPECT_DATE_TIME_SKELETON", n[n.UNCLOSED_QUOTE_IN_ARGUMENT_STYLE = 11] = "UNCLOSED_QUOTE_IN_ARGUMENT_STYLE", n[n.EXPECT_SELECT_ARGUMENT_OPTIONS = 12] = "EXPECT_SELECT_ARGUMENT_OPTIONS", n[n.EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE = 13] = "EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE", n[n.INVALID_PLURAL_ARGUMENT_OFFSET_VALUE = 14] = "INVALID_PLURAL_ARGUMENT_OFFSET_VALUE", n[n.EXPECT_SELECT_ARGUMENT_SELECTOR = 15] = "EXPECT_SELECT_ARGUMENT_SELECTOR", n[n.EXPECT_PLURAL_ARGUMENT_SELECTOR = 16] = "EXPECT_PLURAL_ARGUMENT_SELECTOR", n[n.EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT = 17] = "EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT", n[n.EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT = 18] = "EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT", n[n.INVALID_PLURAL_ARGUMENT_SELECTOR = 19] = "INVALID_PLURAL_ARGUMENT_SELECTOR", n[n.DUPLICATE_PLURAL_ARGUMENT_SELECTOR = 20] = "DUPLICATE_PLURAL_ARGUMENT_SELECTOR", n[n.DUPLICATE_SELECT_ARGUMENT_SELECTOR = 21] = "DUPLICATE_SELECT_ARGUMENT_SELECTOR", n[n.MISSING_OTHER_CLAUSE = 22] = "MISSING_OTHER_CLAUSE", n[n.INVALID_TAG = 23] = "INVALID_TAG", n[n.INVALID_TAG_NAME = 25] = "INVALID_TAG_NAME", n[n.UNMATCHED_CLOSING_TAG = 26] = "UNMATCHED_CLOSING_TAG", n[n.UNCLOSED_TAG = 27] = "UNCLOSED_TAG", n);

            function ef(e) {
                return !!(e && (void 0 === e ? "undefined" : ec(e)) === "object" && 0 === e.type)
            }

            function ep(e) {
                return !!(e && (void 0 === e ? "undefined" : ec(e)) === "object" && 1 === e.type)
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
            var ev = !!Object.fromEntries,
                eg = !!String.prototype.trimStart,
                eO = !!String.prototype.trimEnd,
                ew = ev ? Object.fromEntries : function(e) {
                    var t = {},
                        r = !0,
                        n = !1,
                        o = void 0;
                    try {
                        for (var a, i = e[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
                            var l, c = (l = a.value, function(e) {
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
                                }(l) || eu(l, 2) || function() {
                                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()),
                                u = c[0],
                                s = c[1];
                            t[u] = s
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
                ej = eg ? function(e) {
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
                                            var c = this.parseLiteral(e, t);
                                            if (c.err) return c;
                                            n.push(c.val)
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
                                }(r) || eu(r) || function() {
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
                                        var l, c = null;
                                        if (this.bumpIf(",")) {
                                            this.bumpSpace();
                                            var u = this.clonePosition(),
                                                s = this.parseSimpleArgStyleIfPossible();
                                            if (s.err) return s;
                                            var f = eS(s.val);
                                            if (0 === f.length) return this.error(6, ey(this.clonePosition(), this.clonePosition()));
                                            c = {
                                                style: f,
                                                styleLocation: ey(u, this.clonePosition())
                                            }
                                        }
                                        var p = this.tryParseArgumentClose(n);
                                        if (p.err) return p;
                                        var d = ey(n, this.clonePosition());
                                        if (c && c.style.startsWith("::")) {
                                            var h = ej(c.style.slice(2));
                                            if ("number" === a) {
                                                var m = this.parseNumberSkeletonFromString(h, c.styleLocation);
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
                                                            c = function(e) {
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
                                                        for (("H" == c || "k" == c) && (l = 0); l-- > 0;) r += "a";
                                                        for (; i-- > 0;) r = c + r
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
                                                        location: c.styleLocation,
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
                                                style: null != (l = null == c ? void 0 : c.style) ? l : null
                                            }, err: null
                                        };
                                    case "plural":
                                    case "selectordinal":
                                    case "select":
                                        var v = this.clonePosition();
                                        if (this.bumpSpace(), !this.bumpIf(",")) return this.error(12, ey(v, el({}, v)));
                                        this.bumpSpace();
                                        var g = this.parseIdentifierIfPossible(),
                                            O = 0;
                                        if ("select" !== a && "offset" === g.value) {
                                            if (!this.bumpIf(":")) return this.error(13, ey(this.clonePosition(), this.clonePosition()));
                                            this.bumpSpace();
                                            var w = this.tryParseDecimalInteger(13, 14);
                                            if (w.err) return w;
                                            this.bumpSpace(), g = this.parseIdentifierIfPossible(), O = w.val
                                        }
                                        var j = this.tryParsePluralOrSelectOptions(e, a, t, g);
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
                                                var c = i.value.split("/");
                                                if (0 === c.length) throw Error("Invalid number skeleton");
                                                var u = function(e) {
                                                        if (Array.isArray(e)) return e
                                                    }(c) || function(e) {
                                                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                                    }(c) || function(e) {
                                                        if (e) {
                                                            if ("string" == typeof e) return Z(e, void 0);
                                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return Z(e, void 0)
                                                        }
                                                    }(c) || function() {
                                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                                    }(),
                                                    s = u[0],
                                                    f = u.slice(1),
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
                                                        var c = l.options[0];
                                                        "w" === c ? t = Y($({}, t), {
                                                            trailingZeroDisplay: "stripIfInteger"
                                                        }) : c && (t = $({}, t, en(c)));
                                                        continue
                                                    }
                                                    if (ee.test(l.stem)) {
                                                        t = $({}, t, en(l.stem));
                                                        continue
                                                    }
                                                    var u = eo(l.stem);
                                                    u && (t = $({}, t, u));
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
                                for (var o = !1, a = [], i = new Set, l = n.value, c = n.location;;) {
                                    if (0 === l.length) {
                                        var u, s = this.clonePosition();
                                        if ("select" !== t && this.bumpIf("=")) {
                                            var f = this.tryParseDecimalInteger(16, 19);
                                            if (f.err) return f;
                                            c = ey(s, this.clonePosition()), l = this.message.slice(s.offset, this.offset())
                                        } else break
                                    }
                                    if (i.has(l)) return this.error("select" === t ? 21 : 20, c);
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
                                    }]), i.add(l), this.bumpSpace(), l = (u = this.parseIdentifierIfPossible()).value, c = u.location
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

            function eN(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function ek(e, t, r) {
                return (ek = eU() ? Reflect.construct : function(e, t, r) {
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
                        return ek(e, arguments, e_(this).constructor)
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
                        return eN(this, t), (o = eI(this, t, [e])).code = r, o.originalMessage = n, o
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
                        return eN(this, t), eI(this, t, ['Invalid values for "'.concat(e, '": "').concat(r, '". Options are "').concat(Object.keys(n).join('", "'), '"'), "INVALID_VALUE", o])
                    }
                    return eR(t, e), t
                }(ez),
                eV = function(e) {
                    function t(e, r, n) {
                        return eN(this, t), eI(this, t, ['Value for "'.concat(e, '" must be of type ').concat(r), "INVALID_VALUE", n])
                    }
                    return eR(t, e), t
                }(ez),
                eK = function(e) {
                    function t(e, r) {
                        return eN(this, t), eI(this, t, ['The intl string context variable "'.concat(e, '" was not provided to the string "').concat(r, '"'), "MISSING_VALUE", r])
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
                    if (eN(this, e), this.formatterCache = {
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
                                var c = [],
                                    u = !0,
                                    s = !1,
                                    f = void 0;
                                try {
                                    for (var p, d = t[Symbol.iterator](); !(u = (p = d.next()).done); u = !0) {
                                        var h = p.value;
                                        if (0 === h.type) {
                                            c.push({
                                                type: 0,
                                                value: h.value
                                            });
                                            continue
                                        }
                                        if (7 === h.type) {
                                            "number" == typeof i && c.push({
                                                type: 0,
                                                value: n.getNumberFormat(r).format(i)
                                            });
                                            continue
                                        }
                                        var m = h.value;
                                        if (!(a && m in a)) throw new eK(m, l);
                                        var b = a[m];
                                        if (1 === h.type) {
                                            b && "string" != typeof b && "number" != typeof b && (void 0 === b ? "undefined" : eL(b)) !== "bigint" || (b = "string" == typeof b || "number" == typeof b || (void 0 === b ? "undefined" : eL(b)) === "bigint" ? String(b) : ""), c.push({
                                                type: +("string" != typeof b),
                                                value: b
                                            });
                                            continue
                                        }
                                        if (3 === h.type) {
                                            var y = "string" == typeof h.style ? o.date[h.style] : ep(h.style) ? h.style.parsedOptions : void 0;
                                            c.push({
                                                type: 0,
                                                value: n.getDateTimeFormat(r, y).format(b)
                                            });
                                            continue
                                        }
                                        if (4 === h.type) {
                                            var v = "string" == typeof h.style ? o.time[h.style] : ep(h.style) ? h.style.parsedOptions : o.time.medium;
                                            c.push({
                                                type: 0,
                                                value: n.getDateTimeFormat(r, v).format(b)
                                            });
                                            continue
                                        }
                                        if (2 === h.type) {
                                            var g = "string" == typeof h.style ? o.number[h.style] : ef(h.style) ? h.style.parsedOptions : void 0;
                                            if (g && g.scale) {
                                                var O = g.scale || 1;
                                                if ((void 0 === b ? "undefined" : eL(b)) === "bigint") {
                                                    if (!Number.isInteger(O)) throw TypeError("Cannot apply fractional scale ".concat(O, " to bigint value. Scale must be an integer when formatting bigint."));
                                                    b *= BigInt(O)
                                                } else b *= O
                                            }
                                            c.push({
                                                type: 0,
                                                value: n.getNumberFormat(r, g).format(b)
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
                                            Array.isArray(E) || (E = [E]), c.push.apply(c, eH(E.map(function(e) {
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
                                            c.push.apply(c, eH(e(P.value, r, n, o, a)));
                                            continue
                                        }
                                        if (6 === h.type) {
                                            var A = "=".concat(b),
                                                I = Object.prototype.hasOwnProperty.call(h.options, A) ? h.options[A] : void 0;
                                            if (!I) {
                                                if (!Intl.PluralRules) throw new ez('Intl.PluralRules is not available in this environment.\nTry polyfilling it using "@formatjs/intl-pluralrules"\n', "MISSING_INTL_API", l);
                                                var N = (void 0 === b ? "undefined" : eL(b)) === "bigint" ? Number(b) : b,
                                                    k = n.getPluralRules(r, {
                                                        type: h.pluralType
                                                    }).select(N - (h.offset || 0));
                                                I = (Object.prototype.hasOwnProperty.call(h.options, k) ? h.options[k] : void 0) || h.options.other
                                            }
                                            if (!I) throw new eG(h.value, b, Object.keys(h.options), l);
                                            var T = (void 0 === b ? "undefined" : eL(b)) === "bigint" ? Number(b) : b;
                                            c.push.apply(c, eH(e(I.value, r, n, o, a, T - (h.offset || 0))));
                                            continue
                                        }
                                    }
                                } catch (e) {
                                    s = !0, f = e
                                } finally {
                                    try {
                                        u || null == d.return || d.return()
                                    } finally {
                                        if (s) throw f
                                    }
                                }
                                return c.length < 2 ? c : c.reduce(function(e, t) {
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
                        var l, c, u = i || {},
                            s = (function(e) {
                                if (null == e) throw TypeError("Cannot destructure " + e)
                            }(u), eM({}, u));
                        this.ast = e.__parse(t, (l = eB({}, s), c = c = {
                            locale: this.resolvedLocale
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(l, Object.getOwnPropertyDescriptors(c)) : (function(e) {
                            var t = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                t.push.apply(t, r)
                            }
                            return t
                        })(Object(c)).forEach(function(e) {
                            Object.defineProperty(l, e, Object.getOwnPropertyDescriptor(c, e))
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
                                return ek(Intl.NumberFormat, eH(t))
                            }, {
                                cache: eX(e.number),
                                strategy: D.variadic
                            }),
                            getDateTimeFormat: T(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return ek(Intl.DateTimeFormat, eH(t))
                            }, {
                                cache: eX(e.dateTime),
                                strategy: D.variadic
                            }),
                            getPluralRules: T(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return ek(Intl.PluralRules, eH(t))
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
                var c = eq(i, 4),
                    u = (c[0], c[1]),
                    s = c[2],
                    f = c[3];
                if (Array.isArray(u)) throw new V(K.INVALID_MESSAGE, void 0);
                if ("object" == (void 0 === u ? "undefined" : u && "u" > typeof Symbol && u.constructor === Symbol ? "symbol" : typeof u)) throw new V(K.INSUFFICIENT_PATH, void 0);
                if ("string" == typeof u) {
                    var p = s || /'[{}<#|']/.test(u) ? void 0 : u;
                    if (p) return p
                }
                var d = f.cache,
                    h = f.formats,
                    m = f.formatters,
                    b = f.globalFormats,
                    y = f.locale,
                    v = f.timeZone;
                m.getMessageFormat || (m.getMessageFormat = X(function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return new eW(t[0], t[1], t[2], e$({
                        formatters: m
                    }, t[3]))
                }, d.message));
                try {
                    o = m.getMessageFormat(u, y, (e = eW.formats.date, t = eW.formats.time, r = e$({}, null == b ? void 0 : b.dateTime, null == h ? void 0 : h.dateTime), n = {
                        date: e$({}, e, r),
                        time: e$({}, t, r),
                        number: e$({}, null == b ? void 0 : b.number, null == h ? void 0 : h.number)
                    }, v && ["date", "time"].forEach(function(e) {
                        var t = n[e],
                            r = !0,
                            o = !1,
                            a = void 0;
                        try {
                            for (var i, l = Object.entries(t)[Symbol.iterator](); !(r = (i = l.next()).done); r = !0) {
                                var c = eq(i.value, 2),
                                    u = c[0],
                                    s = c[1];
                                t[u] = e$({
                                    timeZone: v
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
                                    timeZone: null != (r = null == t ? void 0 : t.timeZone) ? r : v
                                }))
                            }
                        })
                    })
                } catch (e) {
                    throw new V(K.INVALID_MESSAGE, void 0)
                }
                var g = o.format(s);
                return (0, N.isValidElement)(g) || Array.isArray(g) || "string" == typeof g ? g : String(g)
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
            var e4 = (0, N.createContext)(void 0);

            function e6(e) {
                var t = e.children,
                    r = e.formats,
                    n = e.getMessageFallback,
                    o = e.locale,
                    a = e.messages,
                    i = e.now,
                    l = e.onError,
                    c = e.timeZone,
                    u = (0, N.useContext)(e4),
                    s = (0, N.useMemo)(function() {
                        return (null == u ? void 0 : u.cache) || {
                            dateTime: {},
                            number: {},
                            message: {},
                            relativeTime: {},
                            pluralRules: {},
                            list: {},
                            displayNames: {}
                        }
                    }, [o, null == u ? void 0 : u.cache]),
                    f = (0, N.useMemo)(function() {
                        return (null == u ? void 0 : u.formatters) || {
                            getDateTimeFormat: W(Intl.DateTimeFormat, s.dateTime),
                            getNumberFormat: W(Intl.NumberFormat, s.number),
                            getPluralRules: W(Intl.PluralRules, s.pluralRules),
                            getRelativeTimeFormat: W(Intl.RelativeTimeFormat, s.relativeTime),
                            getListFormat: W(Intl.ListFormat, s.list),
                            getDisplayNames: W(Intl.DisplayNames, s.displayNames)
                        }
                    }, [s, null == u ? void 0 : u.formatters]),
                    p = (0, N.useMemo)(function() {
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
                            formats: void 0 === r ? null == u ? void 0 : u.formats : r,
                            getMessageFallback: n || (null == u ? void 0 : u.getMessageFallback),
                            messages: void 0 === a ? null == u ? void 0 : u.messages : a,
                            now: i || (null == u ? void 0 : u.now),
                            onError: l || (null == u ? void 0 : u.onError),
                            timeZone: c || (null == u ? void 0 : u.timeZone)
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
                    }, [s, r, f, n, o, a, i, l, u, c]);
                return (0, x.jsx)(e4.Provider, {
                    value: p,
                    children: t
                })
            }

            function e7() {
                var e = (0, N.useContext)(e4);
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
            tn(["ar-001", "de-de", "en-us", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn", "zh-cn", "zh-tw"]).concat(tn(["bg-bg", "bn-bd", "bs-ba", "cs-cz", "da-dk", "el-gr", "en-gb", "es-mx", "et-ee", "fi-fi", "fil-ph", "fr-ca", "hr-hr", "hu-hu", "ka-ge", "kk-kz", "km-kh", "lt-lt", "lv-lv", "ms-my", "my-mm", "nb-no", "nl-nl", "pt-pt", "ro-ro", "ru-ru", "si-lk", "sk-sk", "sl-sl", "sq-al", "sr-rs", "sv-se", "uk-ua"]));
            var to = tn(["ar_001", "de_de", "en_us", "es_es", "fr_fr", "hi_in", "id_id", "it_it", "ja_jp", "ko_kr", "pl_pl", "pt_br", "th_th", "tr_tr", "vi_vn", "zh_cn", "zh_tw"]).concat(tn(["bg_bg", "bn_bd", "bs_ba", "cs_cz", "da_dk", "el_gr", "en_gb", "es_mx", "et_ee", "fi_fi", "fil_ph", "fr_ca", "hr_hr", "hu_hu", "ka_ge", "kk_kz", "km_kh", "lt_lt", "lv_lv", "ms_my", "my_mm", "nb_no", "nl_nl", "pt_pt", "ro_ro", "ru_ru", "si_lk", "sk_sk", "sl_sl", "sq_al", "sr_rs", "sv_se", "uk_ua"])),
                ta = tn(["ar-001", "de-DE", "en-US", "es-ES", "fr-FR", "hi-IN", "id-ID", "it-IT", "ja-JP", "ko-KR", "pl-PL", "pt-BR", "th-TH", "tr-TR", "vi-VN", "zh-CN", "zh-TW"]).concat(tn(["bg-BG", "bn-BD", "bs-BA", "cs-CZ", "da-DK", "el-GR", "en-GB", "es-MX", "et-EE", "fi-FI", "fil-PH", "fr-CA", "hr-HR", "hu-HU", "ka-GE", "kk-KZ", "km-KH", "lt-LT", "lv-LV", "ms-MY", "my-MM", "nb-NO", "nl-NL", "pt-PT", "ro-RO", "ru-RU", "si-LK", "sk-SK", "sl-SL", "sq-AL", "sr-RS", "sv-SE", "uk-UA"]));
            tn(["ar", "de", "es", "fr", "hi", "id", "it", "ja", "ko", "pl", "pt", "th", "tr", "vi"]).concat(tn(["ar-001", "de-de", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn"]));
            var ti = function(e) {
                return e.replaceAll(".", ":")
            };

            function tl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var tc = function() {
                    if ("u" < typeof window) return {};
                    var e = window.Roblox;
                    return null != e ? e : {}
                },
                tu = function(e) {
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
                    var t = tc(),
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
                        }({}, tu(null == o ? void 0 : o[e]), tu(null == r ? void 0 : r[e]), tu(null == n ? void 0 : n[e]))]
                    }))
                },
                tf = function(e) {
                    var t, r, n = e.namespaces,
                        o = e.locale,
                        a = e.children,
                        i = n.join(","),
                        l = (0, N.useMemo)(function() {
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
                th = new RegExp("".concat(td, "(\\d+)\\|")),
                tm = function(e, t, r) {
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
                            i = "".concat("__FN_END_nvfToKPAOuiV__").concat(r, "|");
                        n[e.opening] = a, n[e.closing] = i, o[r] = {
                            start: a,
                            end: i,
                            render: e.render,
                            used: !1
                        }
                    });
                    var a = function(e) {
                            var t = [],
                                r = th.exec(e);
                            if (!r) return [e];
                            r.index > 0 && t.push(e.slice(0, r.index));
                            var n = null == r[1] ? void 0 : o[r[1]];
                            if (null == n) return null;
                            n.used = !0;
                            var i = e.indexOf(n.end);
                            if (i < r.index + r[0].length) return null;
                            var l = a(e.slice(r.index + r[0].length, i));
                            if (null == l) return null;
                            t.push(n.render(l));
                            var c = e.slice(i + n.end.length);
                            if (c.length > 0) {
                                var u = a(c);
                                if (null == u) return null;
                                t.push.apply(t, function(e) {
                                    if (Array.isArray(e)) return tp(e)
                                }(u) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(u) || function(e) {
                                    if (e) {
                                        if ("string" == typeof e) return tp(e, void 0);
                                        var t = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tp(e, void 0)
                                    }
                                }(u) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }())
                            }
                            return t
                        },
                        i = a(e(n));
                    return null == i || Object.values(o).some(function(e) {
                        return !e.used
                    }) ? null : i.filter(function(e) {
                        return "" !== e
                    }).map(function(e, t) {
                        return (0, x.jsx)(N.Fragment, {
                            children: e
                        }, t)
                    })
                };

            function tb(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ty(e) {
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

            function tg(e, t) {
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
                        if ("string" == typeof e) return tb(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tb(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tO = window.Roblox["core-scripts"].environmentUrls,
                tw = r.n(tO);

            function tj(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function tS() {
                return null != j || (j = "".concat(tw().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), j
            }
            var tE = function() {};

            function tx(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tP(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var tA = function(e, t) {
                    return e << 3 | t
                },
                tI = tA(1, 2),
                tN = tA(2, 2),
                tk = tA(5, 2),
                tT = tA(6, 2),
                tC = tA(8, 2),
                tM = tA(1, 2),
                t_ = tA(2, 1),
                tR = tA(3, 0),
                tB = tA(5, 2);
            tA(1, 2), tA(2, 1), tA(3, 0), tA(4, 2), tA(5, 2), tA(6, 0), tA(8, 2);
            var tD = tA(4, 0),
                tH = tA(6, 2),
                tL = tA(7, 2);
            tA(1, 0), tA(2, 2);
            var tF = tA(1, 2),
                tU = tA(2, 2),
                tz = tA(1, 2);
            tA(1, 2), tA(2, 2), tA(1, 2);
            var tG = new TextEncoder,
                tV = function() {
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
                                var t = (void 0 === e ? "undefined" : tP(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                                for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                                this.buf.push(Number(t))
                            }
                        }, {
                            key: "writeString",
                            value: function(e) {
                                var t = tG.encode(e);
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

            function tK(e, t, r) {
                var n = new tV;
                return n.writeVarint(tA(1, 2)), n.writeString(e), n.writeVarint(t), r(n), n.toBytes()
            }

            function tX(e) {
                var t = new tV;
                if (t.writeVarint(tM), t.writeString(e.name), t.writeVarint(t_), t.writeDouble(e.value), t.writeVarint(tR), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var r = function(e) {
                        var t = new tV,
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
                                            if ("string" == typeof e) return tx(e, 2);
                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tx(e, 2)
                                        }
                                    }(e) || function() {
                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                    }()),
                                    n = r[0],
                                    o = r[1];
                                if ("string" == typeof o) {
                                    var i = tK(n, tA(2, 2), function(e) {
                                        e.writeString(o)
                                    });
                                    t.writeVarint(tk), t.writeBytes(i)
                                } else if ("boolean" == typeof o) {
                                    var l = tK(n, tA(2, 0), function(e) {
                                        e.writeVarint(+!!o)
                                    });
                                    t.writeVarint(tT), t.writeBytes(l)
                                } else if ((void 0 === o ? "undefined" : tP(o)) === "bigint") {
                                    var c = tK(n, tA(2, 0), function(e) {
                                        e.writeVarint(o)
                                    });
                                    t.writeVarint(tN), t.writeBytes(c)
                                } else if ("number" == typeof o)
                                    if (Number.isFinite(o))
                                        if (Number.isInteger(o) && o >= -0x80000000 && o <= 0x7fffffff) {
                                            var u = tK(n, tA(2, 0), function(e) {
                                                e.writeVarint(o)
                                            });
                                            t.writeVarint(tI), t.writeBytes(u)
                                        } else if (Number.isInteger(o)) {
                                    var s = tK(n, tA(2, 0), function(e) {
                                        e.writeVarint(BigInt(o))
                                    });
                                    t.writeVarint(tN), t.writeBytes(s)
                                } else {
                                    var f = tK(n, tA(2, 1), function(e) {
                                        e.writeDouble(o)
                                    });
                                    t.writeVarint(tC), t.writeBytes(f)
                                } else {
                                    var p = tK(n, tA(2, 2), function(e) {
                                        e.writeString(String(o))
                                    });
                                    t.writeVarint(tk), t.writeBytes(p)
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
                    t.writeVarint(tB), t.writeBytes(r)
                }
                return t.toBytes()
            }

            function tW(e, t, r) {
                var n = new tV;
                n.writeVarint(tD), n.writeVarint(r);
                var o = !0,
                    a = !1,
                    i = void 0;
                try {
                    for (var l, c = e[Symbol.iterator](); !(o = (l = c.next()).done); o = !0) {
                        var u = l.value;
                        n.writeVarint(tH), n.writeBytes(u)
                    }
                } catch (e) {
                    a = !0, i = e
                } finally {
                    try {
                        o || null == c.return || c.return()
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
                        n.writeVarint(tL), n.writeBytes(m)
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

            function tZ(e) {
                var t = new tV;
                t.writeVarint(tF), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(tU), t.writeBytes(e);
                var r = t.toBytes(),
                    n = new tV;
                return n.writeVarint(tz), n.writeBytes(r), n.toBytes()
            }
            var t$ = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function tY(e) {
                return t$.test(e)
            }
            var tq = [],
                tJ = !1,
                tQ = !1;

            function t0(e, t) {
                var r, n, o, a = e.map(function(e) {
                        return {
                            name: e.name,
                            value: e.value,
                            timestampMs: e.timestampMs,
                            attributes: e.attributes
                        }
                    }),
                    i = BigInt(Date.now());
                !0 === t || tQ || "u" > typeof document && "hidden" === document.visibilityState ? (r = tZ(tW(a.map(tX), [], i)).buffer, fetch("".concat(tS()).concat("/v1/events/single"), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: r,
                    credentials: "include",
                    keepalive: !0
                }).catch(tE)) : (n = tZ(tW(a.map(tX), [], i)), (o = function() {
                    var e, t, r, o, a, i, l, c, u, s, f, p, d;
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
                            value: c(0)
                        }), l(i, "throw", {
                            value: c(1)
                        }), l(i, "return", {
                            value: c(2)
                        }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), i;

                        function c(l) {
                            return function(c) {
                                var u = [l, c];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                                    if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                    switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            o = u;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: u[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, n = u[1], u = [0];
                                            continue;
                                        case 7:
                                            u = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                a.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && a.label < o[1]) {
                                                a.label = o[1], o = u;
                                                break
                                            }
                                            if (o && a.label < o[2]) {
                                                a.label = o[2], a.ops.push(u);
                                                break
                                            }
                                            o[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    u = t.call(e, a)
                                } catch (e) {
                                    u = [6, e], n = 0
                                } finally {
                                    r = o = 0
                                }
                                if (5 & u[0]) throw u[1];
                                return {
                                    value: u[0] ? u[1] : void 0,
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
                                return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(n).catch(tE), t.close().catch(tE), r = [], [4, (o = e.readable.getReader()).read()];
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
                                }, 0)), l = 0, c = !0, u = !1, s = void 0;
                                try {
                                    for (f = r[Symbol.iterator](); !(c = (p = f.next()).done); c = !0) d = p.value, i.set(d, l), l += d.length
                                } catch (e) {
                                    u = !0, s = e
                                } finally {
                                    try {
                                        c || null == f.return || f.return()
                                    } finally {
                                        if (u) throw s
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
                            tj(a, r, n, i, l, "next", e)
                        }

                        function l(e) {
                            tj(a, r, n, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                })()).then(function(e) {
                    var t = e.body,
                        r = e.compressed,
                        n = {
                            "Content-Type": "application/x-protobuf"
                        };
                    return r && (n["Content-Encoding"] = "gzip"), fetch("".concat(tS()).concat("/v1/events/single"), {
                        method: "POST",
                        headers: n,
                        body: t,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(tE)
            }

            function t1() {
                var e = !0,
                    t = !1,
                    r = void 0;
                try {
                    for (var n, o = tq[Symbol.iterator](); !(e = (n = o.next()).done); e = !0) {
                        var a = n.value.splice(0);
                        0 !== a.length && t0(a, !0)
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

            function t2(e, t) {
                var r, n, o, a = Math.max(1, null != (r = null == t ? void 0 : t.batchSize) ? r : 10),
                    i = null != (n = null == t ? void 0 : t.batchIntervalMs) ? n : 250;

                function l(e, r) {
                    (null == t ? void 0 : t.onError) ? t.onError(e, r): console.error(e, r)
                }
                if (!tY(e)) return l('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                        name: e
                    }),
                    function() {};
                var c = [];
                return tq.push(c), tJ || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                        "hidden" === document.visibilityState && t1()
                    }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                        tQ = !0, t1()
                    }), tJ = !0),
                    function(t, r, n) {
                        var u = "".concat(e, "_").concat(t);
                        if (! function(e, t) {
                                if (!tY(e)) return !1;
                                if (t) {
                                    var r = !0,
                                        n = !1,
                                        o = void 0;
                                    try {
                                        for (var a, i = Object.keys(t)[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
                                            var l = a.value;
                                            if (!tY(l)) return !1
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
                            }(u, r)) return void l("@rbx/web-telemetry: invalid event name or attribute key", {
                            name: t,
                            attributes: r
                        });
                        var s = null != n ? n : 1;
                        if (!Number.isFinite(s)) return void l("@rbx/web-telemetry: value must be a finite number", {
                            name: t,
                            attributes: r
                        });
                        var f = r && Object.keys(r).length > 0 ? r : void 0;
                        c.push({
                            name: u,
                            attributes: f,
                            value: s,
                            timestampMs: BigInt(Date.now())
                        }), c.length >= a ? (void 0 !== o && (clearTimeout(o), o = void 0), t0(c.splice(0, a))) : void 0 === o && (o = setTimeout(function() {
                            for (o = void 0; c.length > 0;) t0(c.splice(0, a))
                        }, i))
                    }
            }
            var t3 = "WwwCommon",
                t8 = function(e) {
                    var t = e.publish,
                        r = e.captureException,
                        n = e.featureName;

                    function o(e, t, o) {
                        if (null != o) {
                            var a, i = (null != (a = Error) && "u" > typeof Symbol && a[Symbol.hasInstance] ? !!a[Symbol.hasInstance](o) : o instanceof a) ? o.name || "Error" : "UnknownError",
                                l = n ? "".concat(n, "_").concat(e) : e;
                            return null == r || r(o, {
                                error_counter: l
                            }), tv(ty({}, t), {
                                errorType: i
                            })
                        }
                        return t
                    }
                    return {
                        trackCounter: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var o = tg(r, 2);
                            t(o[0], o[1])
                        },
                        trackError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var a = tg(r, 3),
                                i = a[0],
                                l = a[1],
                                c = a[2],
                                u = o(i, tv(ty({}, null != l ? l : {}), {
                                    severity: "error"
                                }), c);
                            t(i, u)
                        },
                        trackCriticalError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var a = tg(r, 3),
                                i = a[0],
                                l = a[1],
                                c = a[2],
                                u = o(i, tv(ty({}, null != l ? l : {}), {
                                    severity: "critical"
                                }), c);
                            t(i, u)
                        }
                    }
                }({
                    publish: t2(t3)
                });
            t8.trackCounter;
            var t5 = t8.trackError;
            t8.trackCriticalError;
            var t4 = function() {
                    if ("u" > typeof document) {
                        var e = document.querySelector('meta[name="page-meta"]');
                        return null == e ? void 0 : e.dataset.internalPageName
                    }
                },
                t6 = function(e, t, r) {
                    var n;
                    "u" > typeof window && t5(e, {
                        key: r,
                        namespace: t,
                        internalPageName: null != (n = t4()) ? n : "unknown"
                    })
                },
                t7 = function(e) {
                    var t, r, n, o, a, i, l, c, u, s, f, p, d, h = (t = ti(e), r = {
                        "!": e7().messages
                    }, n = t ? "!.".concat(t) : "!", a = (o = e7()).cache, i = o.formats, l = o.formatters, c = o.getMessageFallback, u = o.locale, s = o.onError, f = o.timeZone, p = r["!"], d = "!" === n ? void 0 : n.slice(2), f || e9 || !te || (e9 = !0, s(new V(K.ENVIRONMENT_FALLBACK, void 0))), (0, N.useMemo)(function() {
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
                                getMessageFallback: c,
                                messages: p,
                                namespace: d,
                                onError: s,
                                formats: i,
                                locale: u,
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
                                    c = e.namespace,
                                    u = e.onError,
                                    s = e.timeZone,
                                    f = eQ(l, V);

                                function p(e, t, r, n) {
                                    var o = new V(t, r);
                                    return u(o), null != n ? n : a({
                                        error: o,
                                        key: e,
                                        namespace: c
                                    })
                                }

                                function d(e, o, d, h) {
                                    var m, b, y;
                                    if (f) {
                                        if (!h) return u(l), a({
                                            error: l,
                                            key: e,
                                            namespace: c
                                        });
                                        m = h
                                    } else try {
                                        m = e5(i, l, e, c)
                                    } catch (t) {
                                        if (!h) return p(e, K.MISSING_MESSAGE, t.message, h);
                                        m = h
                                    }
                                    try {
                                        var v, g = e2(c, e);
                                        return eJ(g, m, o ? (v = {}, Object.keys(o).forEach(function(e) {
                                            var t, r = 0,
                                                n = o[e];
                                            t = "function" == typeof n ? function(t) {
                                                var o = n(t);
                                                return (0, N.isValidElement)(o) ? (0, N.cloneElement)(o, {
                                                    key: e + r++
                                                }) : o
                                            } : n, v[e] = t
                                        }), v) : o, {
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
                                    if (f) return u(l), a({
                                        error: l,
                                        key: e,
                                        namespace: c
                                    });
                                    try {
                                        return e5(i, l, e, c)
                                    } catch (t) {
                                        return p(e, K.MISSING_MESSAGE, t.message)
                                    }
                                }, h.has = function(e) {
                                    if (f) return !1;
                                    try {
                                        return e5(i, l, e, c), !0
                                    } catch (e) {
                                        return !1
                                    }
                                }, h
                            }(e1(e0({}, e), {
                                messagesOrError: t
                            }))
                    }, [a, l, c, p, d, s, i, u, f]));
                    return (0, N.useMemo)(function() {
                        return Object.assign(function(e, t) {
                            return h(ti(e), t)
                        }, {
                            rich: function(e, t) {
                                return h.rich(ti(e), t)
                            },
                            has: function(e) {
                                return h.has(ti(e))
                            },
                            dynamic: function(t, r) {
                                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "",
                                    o = ti(t),
                                    a = h.has(o);
                                return a || t6("TranslationKeyNotFound", e, o), a ? h(o, r) : n
                            },
                            html: function(t, r, n) {
                                var o = ti(t);
                                if (!h.has(o)) return t6("TranslationKeyNotFound", e, o), null;
                                var a = tm(function(e) {
                                    return h(o, e)
                                }, r, n);
                                return null == a && t6("TranslationMalformed", e, o), a
                            }
                        })
                    }, [h, e])
                },
                t9 = window.RobloxThumbnails;

            function re() {
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

            function ro(e, t) {
                if (e) {
                    if ("string" == typeof e) return rt(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rt(e, t)
                }
            }
            var ra = {
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
                ri = k().forwardRef(function(e, t) {
                    var r, n = rr(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || ro(r) || rn(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.className,
                        l = o.size,
                        c = void 0 === l ? "Large" : l,
                        u = o.variant,
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
                        m = (rr(a) || function(e) {
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
                        }(a) || ro(a, 1) || rn())[0],
                        b = ra[c],
                        y = b.dimension,
                        v = b.strokeWidth,
                        g = b.textClass,
                        O = b.valueContainerSize,
                        w = (y - v) / 2,
                        j = 2 * Math.PI * w,
                        S = y / 2,
                        E = Math.min(100, Math.max(0, void 0 === s ? 0 : s)),
                        x = p && void 0 !== O ? O : y,
                        P = "Determinate" === (void 0 === u ? "Determinate" : u);
                    return k().createElement("div", function(e) {
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
                        className: re("foundation-web-progress-circle inline-flex items-center justify-center", i),
                        role: "progressbar",
                        "aria-label": d,
                        "aria-valuemin": P ? 0 : void 0,
                        "aria-valuemax": P ? 100 : void 0,
                        "aria-valuenow": P ? E : void 0,
                        style: {
                            width: x,
                            height: x
                        }
                    }, h), k().createElement("svg", {
                        width: y,
                        height: y,
                        viewBox: "0 0 ".concat(y, " ").concat(y),
                        className: "relative"
                    }, k().createElement("circle", {
                        cx: S,
                        cy: S,
                        r: w,
                        fill: "none",
                        strokeWidth: v,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), k().createElement("circle", {
                        cx: S,
                        cy: S,
                        r: w,
                        fill: "none",
                        strokeWidth: v,
                        strokeDasharray: P ? j : "".concat(.75 * j, " ").concat(.25 * j),
                        strokeDashoffset: P ? j * (1 - E / 100) : 0,
                        strokeLinecap: "round",
                        className: re(!P && "foundation-web-progress-circle-indeterminate"),
                        style: P ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), P && p && "Large" === c && k().createElement("div", {
                        className: re("absolute content-emphasis flex items-center justify-center", g),
                        "aria-hidden": "true"
                    }, k().createElement("span", null, Math.round(E)), k().createElement("span", null, "%")))
                });
            ri.displayName = "ProgressCircle";
            var rl = window.Roblox["core-scripts"].meta.device,
                rc = "inbox",
                ru = "sent",
                rs = "notifications",
                rf = "archive",
                rp = "list",
                rd = "detail",
                rh = "Roblox",
                rm = "Roblox.Messages.CountChanged",
                rb = window.Roblox["core-scripts"].eventStream,
                ry = window.Roblox["core-scripts"].intl.intl,
                rv = r.n(ry),
                rg = window.Roblox["core-scripts"].endpoints,
                rO = window.Roblox["core-scripts"].format.string,
                rw = new(rv())().getDateTimeFormatter(),
                rj = function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return t.find(function(e) {
                        return null != e
                    })
                },
                rS = function(e) {
                    var t, r, n, o = null != (t = rj(null == e ? void 0 : e.id, null == e ? void 0 : e.UserId, 1)) ? t : 1,
                        a = null != (r = rj(null == e ? void 0 : e.name, null == e ? void 0 : e.UserName, rh)) ? r : rh,
                        i = null != (n = rj(null == e ? void 0 : e.displayName, null == e ? void 0 : e.DisplayName, a)) ? n : a;
                    return {
                        id: o,
                        name: (0, rO.escapeHtml)(a),
                        displayName: i,
                        hasVerifiedBadge: !!rj(null == e ? void 0 : e.hasVerifiedBadge, null == e ? void 0 : e.HasVerifiedBadge, !1),
                        profileLink: (0, rg.getAbsoluteUrl)("/users/".concat(o, "/profile"))
                    }
                },
                rE = function(e) {
                    var t = (0, rg.getAbsoluteUrl)("/my/messages/");
                    return (0, rg.getAbsoluteUrl)("/AbuseReport/message?ID=".concat(e, "&RedirectUrl=").concat(t))
                },
                rx = function(e) {
                    var t, r, n, o, a = null != (t = rj(e.id, e.Id, 0)) ? t : 0;
                    return {
                        id: a,
                        sender: rS(rj(e.sender, e.Sender)),
                        recipient: rS(rj(e.recipient, e.Recipient)),
                        subject: null != (r = rj(e.subject, e.Subject, "")) ? r : "",
                        body: null != (n = rj(e.body, e.Body, "")) ? n : "",
                        created: null != (o = rj(e.created, e.Created, "")) ? o : "",
                        updated: rj(e.updated, e.Updated),
                        isRead: !!rj(e.isRead, e.IsRead, !1),
                        isSystemMessage: !!rj(e.isSystemMessage, e.IsSystemMessage, !1),
                        isReportAbuseDisplayed: !!rj(e.isReportAbuseDisplayed, e.IsReportAbuseDisplayed, !1),
                        abuseReportUrl: rE(a)
                    }
                },
                rP = function(e) {
                    var t, r, n, o, a = null != (t = rj(e.collection, e.Collection, [])) ? t : [];
                    return {
                        pageNumber: null != (r = rj(e.pageNumber, e.PageNumber, 0)) ? r : 0,
                        totalPages: null != (n = rj(e.totalPages, e.TotalPages, 1)) ? n : 1,
                        totalCollectionSize: null != (o = rj(e.totalCollectionSize, e.TotalCollectionSize, a.length)) ? o : a.length,
                        collection: a.map(rx)
                    }
                },
                rA = function(e) {
                    var t = document.createElement("div");
                    return t.innerHTML = e, t.textContent || t.innerText || ""
                },
                rI = function(e) {
                    var t = 0,
                        r = "";
                    return e.replace(/(https?:\/\/[^\s<]+)/g, function(n, o, a) {
                        return r += (0, rO.escapeHtml)(e.slice(t, a)), r += '<a href="'.concat(n.replace(/[&"]/g, function(e) {
                            return "&" === e ? "&amp;" : "&quot;"
                        }), '" target="_blank" rel="noreferrer">').concat((0, rO.escapeHtml)(n), "</a>"), t = a + n.length, n
                    }), (r += (0, rO.escapeHtml)(e.slice(t))).replace(/\n/g, "<br />")
                },
                rN = function(e) {
                    var t = new Date(e);
                    if (Number.isNaN(t.getTime())) return "";
                    var r = t.getFullYear() === new Date().getFullYear() ? rw.getCustomDateTime(t, {
                        month: "short",
                        day: "numeric"
                    }) : rw.getShortDate(t);
                    return "".concat(r, " | ").concat(rw.getCustomDateTime(t, {
                        hour: "numeric",
                        minute: "numeric"
                    }))
                },
                rk = function(e) {
                    var t = new Date(e);
                    return Number.isNaN(t.getTime()) ? "" : rw.getFullDate(t)
                },
                rT = function(e) {
                    document.dispatchEvent(new Event(e))
                },
                rC = window.Roblox["core-scripts"].meta.user,
                rM = window.Roblox["core-scripts"].http.http,
                r_ = window.Roblox["core-scripts"].guac,
                rR = window.Roblox["core-lib"].http.index,
                rB = window.Roblox["core-lib"].url.index;

            function rD(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rH(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function rL(e, t) {
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
                        if ("string" == typeof e) return rD(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rD(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rF = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                    return e.getOrThrow().then(function(e) {
                        return t && null == e ? {} : e
                    }, function(e) {
                        throw rH(e, rR.HttpError) ? Error("Request failed with status code ".concat(e.response.status), {
                            cause: e
                        }) : rH(e, Error) ? e : Error(String(e), {
                            cause: e
                        })
                    })
                },
                rU = function(e) {
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
                        retry: rR.defaultBrowserRetryDelay
                    } : {}, e.noCache ? {
                        headers: {
                            "Cache-Control": "no-cache, no-store, must-revalidate",
                            Pragma: "no-cache"
                        }
                    } : {})
                },
                rz = function(e, t) {
                    var r = rB.Url.parse(e).getOrThrow();
                    if (!t) return r;
                    var n = Object.fromEntries(Object.entries(t).filter(function(e) {
                        return null != rL(e, 2)[1]
                    }).map(function(e) {
                        var t = rL(e, 2);
                        return [t[0], String(t[1])]
                    }));
                    return r.withSearchParams(n)
                },
                rG = "true" === r(773).env.NEXT_PUBLIC_IS_NEXTJS ? {
                    get: function(e, t) {
                        return rF(rR.getUntyped(rz(e.url, t), rU(e)))
                    },
                    post: function(e, t) {
                        return rF(rR.postUntyped(rz(e.url), null != t ? t : {}, rU(e)), !0)
                    },
                    getGuacBundle: function(e) {
                        var t = rB.Url.parse(tw().apiGatewayUrl).getOrThrow().withPath("/guac-v2/v1/bundles/".concat(e)).withSearchParams({
                            version: "1"
                        });
                        return rF(rR.getUntyped(t, {
                            credentials: "include"
                        }))
                    }
                } : {
                    get: function(e, t) {
                        return rM.get(e, t).then(function(e) {
                            return e.data
                        })
                    },
                    post: function(e, t) {
                        return rM.post(e, t).then(function(e) {
                            return e.data
                        })
                    },
                    getGuacBundle: function(e) {
                        var t = new URLSearchParams;
                        return t.append("version", "1"), (0, r_.callBehaviour)(e, t)
                    }
                };

            function rV(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function rK(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            rV(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            rV(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function rX(e, t) {
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
                    value: c(0)
                }), l(i, "throw", {
                    value: c(1)
                }), l(i, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function c(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        a.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && a.label < o[1]) {
                                        a.label = o[1], o = u;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(u);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            u = t.call(e, a)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var rW = function(e) {
                    return "".concat(tw().privateMessagesApi).concat(e)
                },
                rZ = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                    return {
                        url: e,
                        noCache: t,
                        retryable: t,
                        withCredentials: !0
                    }
                },
                r$ = function(e, t) {
                    return e === rs ? rK(function() {
                        return rX(this, function(e) {
                            switch (e.label) {
                                case 0:
                                    return [4, rG.get(rZ(rW("/v1/announcements"), !0))];
                                case 1:
                                    return [2, rP(e.sent())]
                            }
                        })
                    })() : rK(function() {
                        return rX(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    return [4, rG.get(rZ(rW("/v1/messages"), !0), {
                                        pageNumber: t,
                                        pageSize: 20,
                                        messageTab: e
                                    })];
                                case 1:
                                    return [2, rP(r.sent())]
                            }
                        })
                    })()
                },
                rY = function(e, t) {
                    return rG.post(rZ(rW(t ? "/v1/messages/mark-read" : "/v1/messages/mark-unread")), {
                        messageIds: e
                    })
                },
                rq = function(e) {
                    if (e.message) return Error(e.message);
                    var t, r, n = null == (r = e.errors) || null == (t = r[0]) ? void 0 : t.message;
                    return Error(null != n ? n : "Unknown error")
                },
                rJ = function(e) {
                    var t = e.subject,
                        r = e.body,
                        n = e.recipientId,
                        o = e.replyMessageId,
                        a = e.includePreviousMessage;
                    return rK(function() {
                        var e, i;
                        return rX(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    return [4, rG.post(rZ(rW("/v1/messages/send")), {
                                        userId: null != (e = (0, rC.userId)()) ? e : 0,
                                        subject: t,
                                        body: r,
                                        recipientId: n,
                                        replyMessageId: o,
                                        includePreviousMessage: a
                                    })];
                                case 1:
                                    if (!1 === (i = l.sent()).success) throw rq(i);
                                    return [2, i]
                            }
                        })
                    })()
                };

            function rQ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function r0(e, t) {
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
                        if ("string" == typeof e) return rQ(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rQ(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var r1 = [rc, ru, rs, rf],
                r2 = function(e) {
                    var t = Array.isArray(e) ? e[0] : e;
                    if (null == t || "" === t || "string" != typeof t && "number" != typeof t) return null;
                    var r = Number.parseInt(String(t), 10);
                    return Number.isNaN(r) ? null : r
                },
                r3 = function() {
                    var e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "u" < typeof window ? "" : window.location.hash,
                        r = r0((t.startsWith("#!") ? t.slice(2) : t.replace(/^#/, "")).split("?"), 2),
                        n = r[0],
                        o = r[1],
                        a = (void 0 === n ? "/inbox" : n).replace(/^\//, ""),
                        i = rB.UrlSearchParams.parse(void 0 === o ? "" : o),
                        l = null != (e = r2(i.get("page"))) ? e : 1;
                    return {
                        tab: r1.includes(a) ? a : rc,
                        page: l > 0 ? l : 1,
                        messageIdx: r2(i.get("messageIdx")),
                        conversationId: r2(i.get("conversationId"))
                    }
                },
                r8 = function(e) {
                    var t = rB.UrlSearchParams.new(function(e) {
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
                    } : {}, null != e.messageIdx ? {
                        messageIdx: String(e.messageIdx)
                    } : {}, null != e.conversationId ? {
                        conversationId: String(e.conversationId)
                    } : {})).toString();
                    return "#!/".concat(e.tab).concat(t ? "?".concat(t) : "")
                },
                r5 = function() {
                    var e = r0((0, N.useState)(function() {
                            return r3()
                        }), 2),
                        t = e[0],
                        r = e[1];
                    return (0, N.useEffect)(function() {
                        var e = function() {
                            r(r3())
                        };
                        return window.addEventListener("hashchange", e),
                            function() {
                                window.removeEventListener("hashchange", e)
                            }
                    }, []), {
                        route: t,
                        setRoute: (0, N.useCallback)(function(e) {
                            var t = r8(e);
                            window.location.hash === t ? r(e) : window.location.hash = t
                        }, [])
                    }
                };

            function r4(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function r6(e) {
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

            function r7(e, t) {
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

            function r9(e, t) {
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
                        if ("string" == typeof e) return r4(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return r4(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ne = r(773),
                nt = "PrivateMessage",
                nr = "true" === ne.env.NEXT_PUBLIC_IS_NEXTJS ? "nextjs" : "dotnet",
                nn = t2(nt),
                no = function(e) {
                    var t = e.publish,
                        r = e.captureException,
                        n = e.featureName;

                    function o(e, t, o) {
                        if (null != o) {
                            var a, i = (null != (a = Error) && "u" > typeof Symbol && a[Symbol.hasInstance] ? !!a[Symbol.hasInstance](o) : o instanceof a) ? o.name || "Error" : "UnknownError",
                                l = n ? "".concat(n, "_").concat(e) : e;
                            return null == r || r(o, {
                                error_counter: l
                            }), r7(r6({}, t), {
                                errorType: i
                            })
                        }
                        return t
                    }
                    return {
                        trackCounter: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var o = r9(r, 2);
                            t(o[0], o[1])
                        },
                        trackError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var a = r9(r, 3),
                                i = a[0],
                                l = a[1],
                                c = a[2],
                                u = o(i, r7(r6({}, null != l ? l : {}), {
                                    severity: "error"
                                }), c);
                            t(i, u)
                        },
                        trackCriticalError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var a = r9(r, 3),
                                i = a[0],
                                l = a[1],
                                c = a[2],
                                u = o(i, r7(r6({}, null != l ? l : {}), {
                                    severity: "critical"
                                }), c);
                            t(i, u)
                        }
                    }
                }({
                    publish: function(e, t) {
                        var r, n;
                        nn(e, (r = function(e) {
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
                            host: nr
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
                    featureName: nt
                }),
                na = no.trackCounter,
                ni = no.trackError,
                nl = no.trackCriticalError;

            function nc(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var nu = function(e) {
                    return nc(e, rR.HttpError) ? e.response.status : null != e && (void 0 === e ? "undefined" : e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) == "object" && "status" in e ? "number" == typeof e.status ? e.status : void 0 : void 0
                },
                ns = function(e) {
                    if (null == e) return "network";
                    var t, r = nc(e, Error) ? e.cause : void 0,
                        n = null != (t = nu(e)) ? t : nu(r);
                    return null != n ? String(n) : nc(e, rR.AbortError) || nc(r, rR.AbortError) ? "aborted" : nc(e, rR.UnknownFetchError) || nc(r, rR.UnknownFetchError) ? "network" : "unknown"
                };

            function nf(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function np(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function nd(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            np(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            np(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function nh(e) {
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

            function nb(e, t) {
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
                }(e, t) || ng(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ny(e) {
                return function(e) {
                    if (Array.isArray(e)) return nf(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || ng(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nv(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function ng(e, t) {
                if (e) {
                    if ("string" == typeof e) return nf(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nf(e, t)
                }
            }

            function nO(e, t) {
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
                    value: c(0)
                }), l(i, "throw", {
                    value: c(1)
                }), l(i, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function c(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        a.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && a.label < o[1]) {
                                        a.label = o[1], o = u;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(u);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            u = t.call(e, a)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var nw = {
                    replyContent: "",
                    includePreviousMessage: !0,
                    isSending: !1
                },
                nj = function(e) {
                    return e && !e.isSystemMessage ? nm(nh({}, e), {
                        body: rI(e.body)
                    }) : e
                },
                nS = function(e, t) {
                    if (e && (void 0 === e ? "undefined" : nv(e)) === "object") {
                        if ("string" == typeof e.message) return e.message;
                        if (Array.isArray(e.errors)) {
                            var r = e.errors[0];
                            if (r && (void 0 === r ? "undefined" : nv(r)) === "object" && "message" in r) return String(r.message)
                        }
                    }
                    return t
                },
                nE = function(e) {
                    return function(t) {
                        throw ni(e, {
                            statusCode: ns(t)
                        }, t), t
                    }
                },
                nx = function(e) {
                    var t = e.translate,
                        r = r5(),
                        n = r.route,
                        o = r.setRoute,
                        a = nb((0, N.useState)({}), 2),
                        i = a[0],
                        l = a[1],
                        c = nb((0, N.useState)(null), 2),
                        u = c[0],
                        s = c[1],
                        f = nb((0, N.useState)(null), 2),
                        p = f[0],
                        d = f[1],
                        h = nb((0, N.useState)(function() {
                            return new Set
                        }), 2),
                        m = h[0],
                        b = h[1],
                        y = nb((0, N.useState)(rp), 2),
                        v = y[0],
                        g = y[1],
                        O = nb((0, N.useState)(!0), 2),
                        w = O[0],
                        j = O[1],
                        S = nb((0, N.useState)(null), 2),
                        E = S[0],
                        x = S[1],
                        P = nb((0, N.useState)(null), 2),
                        A = P[0],
                        I = P[1],
                        k = nb((0, N.useState)(nw), 2),
                        T = k[0],
                        C = k[1],
                        M = nb((0, N.useState)(0), 2),
                        _ = M[0],
                        R = M[1],
                        B = (0, N.useRef)(!1),
                        D = (0, N.useRef)(n.tab),
                        H = (0, N.useMemo)(function() {
                            var e = [{
                                name: rc,
                                label: t("Label.Inbox")
                            }, {
                                name: ru,
                                label: t("Label.Sent")
                            }, {
                                name: rs,
                                label: t("Label.News"),
                                count: _
                            }, {
                                name: rf,
                                label: t("Label.Archive")
                            }];
                            return i.displayNewsTab ? e : e.filter(function(e) {
                                return e.name !== rs
                            })
                        }, [_, i.displayNewsTab, t]),
                        L = (0, N.useCallback)(function() {
                            return nd(function() {
                                var e, r, o, a;
                                return nO(this, function(i) {
                                    switch (i.label) {
                                        case 0:
                                            j(!0), x(null), b(new Set), i.label = 1;
                                        case 1:
                                            var l;
                                            if (i.trys.push([1, 8, 9, 10]), null == n.conversationId) return [3, 5];
                                            return [4, (l = n.conversationId, rK(function() {
                                                return rX(this, function(e) {
                                                    switch (e.label) {
                                                        case 0:
                                                            return [4, rG.get(rZ(rW("/v1/messages/".concat(l)), !0))];
                                                        case 1:
                                                            return [2, rx(e.sent())]
                                                    }
                                                })
                                            })())];
                                        case 2:
                                            if (e = i.sent(), s(null), d(nj(e)), C(nw), g(rd), e.isRead) return [3, 4];
                                            return [4, rY([e.id], !0).then(function() {
                                                rT(rm)
                                            }, function(e) {
                                                ni("MarkReadFailed", {
                                                    statusCode: ns(e)
                                                }, e)
                                            })];
                                        case 3:
                                            i.sent(), i.label = 4;
                                        case 4:
                                            return [3, 7];
                                        case 5:
                                            return [4, r$(n.tab, n.page - 1)];
                                        case 6:
                                            s(o = i.sent()), g(null == n.messageIdx ? rp : rd), d(null == n.messageIdx ? null : nj(null != (r = o.collection[n.messageIdx]) ? r : null)), null != n.messageIdx && C(nw), rT(rm), i.label = 7;
                                        case 7:
                                            return [3, 10];
                                        case 8:
                                            return a = i.sent(), nl("LoadFailed", {
                                                host: nr,
                                                tab: n.tab,
                                                statusCode: ns(a)
                                            }, a), s(null), d(null), g(rp), x(nS(a, t("Message.UnknownError"))), [3, 10];
                                        case 9:
                                            return j(!1), [7];
                                        case 10:
                                            return [2]
                                    }
                                })
                            })()
                        }, [n, t]);
                    return (0, N.useEffect)(function() {
                        na("PageView", {
                            host: nr,
                            tab: D.current
                        }), rG.getGuacBundle("private-messages-ui").then(l).catch(function(e) {
                            ni("RulesLoadFailed", {
                                statusCode: ns(e)
                            }, e), l({})
                        }), rG.get(rZ(rW("/v1/announcements/metadata"), !0)).then(function(e) {
                            var t;
                            R(null != (t = e.numOfAnnouncements) ? t : 0)
                        }).catch(function(e) {
                            ni("NewsCountLoadFailed", {
                                statusCode: ns(e)
                            }, e), R(0)
                        })
                    }, []), (0, N.useEffect)(function() {
                        if (B.current) {
                            B.current = !1;
                            return
                        }
                        L()
                    }, [L]), {
                        route: n,
                        rules: i,
                        tabs: H,
                        page: u,
                        selectedMessage: p,
                        selectedMessageIds: m,
                        moduleState: v,
                        loading: w,
                        error: E,
                        feedback: A,
                        sendReplyState: T,
                        openTab: function(e) {
                            na("OpenTab", {
                                tab: e
                            }), e === rs && (0, rb.sendEventWithTarget)("newsOpenContent", "click", {
                                property: _
                            }, rb.targetTypes.WWW), d(null), b(new Set), C(nw), o({
                                tab: e,
                                page: 1,
                                messageIdx: null,
                                conversationId: null
                            })
                        },
                        openMessage: function(e, t) {
                            return nd(function() {
                                return nO(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            if (na("OpenMessage"), d(nj(e)), b(new Set([e.id])), C(nw), g(rd), B.current = !0, o(nm(nh({}, n), {
                                                    messageIdx: t,
                                                    conversationId: null
                                                })), e.isRead) return [3, 2];
                                            return s(function(t) {
                                                return null == t ? t : nm(nh({}, t), {
                                                    collection: t.collection.map(function(t) {
                                                        return t.id === e.id ? nm(nh({}, t), {
                                                            isRead: !0
                                                        }) : t
                                                    })
                                                })
                                            }), [4, rY([e.id], !0).catch(nE("MarkReadFailed"))];
                                        case 1:
                                            r.sent(), rT(rm), r.label = 2;
                                        case 2:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        backToList: function() {
                            d(null), b(new Set), C(nw), g(rp), B.current = !0, o(nm(nh({}, n), {
                                messageIdx: null,
                                conversationId: null
                            }))
                        },
                        toggleMessageSelection: function(e) {
                            b(function(t) {
                                var r = new Set(t);
                                return r.has(e) ? r.delete(e) : r.add(e), r
                            })
                        },
                        toggleSelectAll: function() {
                            b(function(e) {
                                return u && e.size !== u.collection.length ? new Set(u.collection.map(function(e) {
                                    return e.id
                                })) : new Set
                            })
                        },
                        markRead: function(e) {
                            return nd(function() {
                                var t;
                                return nO(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            if (0 === (t = ny(m)).length) return [2];
                                            return s(function(r) {
                                                return null == r ? r : nm(nh({}, r), {
                                                    collection: r.collection.map(function(r) {
                                                        return t.includes(r.id) ? nm(nh({}, r), {
                                                            isRead: e
                                                        }) : r
                                                    })
                                                })
                                            }), b(new Set), [4, rY(t, e).catch(nE("MarkReadFailed"))];
                                        case 1:
                                            return r.sent(), rT(rm), [2]
                                    }
                                })
                            })()
                        },
                        markArchive: function(e) {
                            return nd(function() {
                                var t, r;
                                return nO(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            if (0 === (t = m.size > 0 ? ny(m) : p ? [p.id] : []).length) return [2];
                                            return r = v === rd, [4, rG.post(rZ(rW(e ? "/v1/messages/archive" : "/v1/messages/unarchive")), {
                                                messageIds: t
                                            }).catch(nE("ArchiveFailed"))];
                                        case 1:
                                            if (a.sent(), b(new Set), d(null), C(nw), g(rp), !r) return [3, 2];
                                            return o(nm(nh({}, n), {
                                                messageIdx: null,
                                                conversationId: null
                                            })), [3, 4];
                                        case 2:
                                            return [4, L()];
                                        case 3:
                                            a.sent(), a.label = 4;
                                        case 4:
                                            return rT(rm), [2]
                                    }
                                })
                            })()
                        },
                        changePage: function(e) {
                            C(nw), o({
                                tab: n.tab,
                                page: e,
                                messageIdx: null,
                                conversationId: null
                            })
                        },
                        updateReplyContent: function(e) {
                            C(function(t) {
                                return nm(nh({}, t), {
                                    replyContent: e
                                })
                            })
                        },
                        updateIncludePreviousMessage: function(e) {
                            C(function(t) {
                                return nm(nh({}, t), {
                                    includePreviousMessage: e
                                })
                            })
                        },
                        sendReply: function() {
                            return nd(function() {
                                return nO(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            if (!p || 0 === T.replyContent.length) return [2];
                                            C(function(e) {
                                                return nm(nh({}, e), {
                                                    isSending: !0
                                                })
                                            }), e.label = 1;
                                        case 1:
                                            return e.trys.push([1, 3, 4, 5]), [4, rJ({
                                                subject: p.subject,
                                                body: T.replyContent,
                                                recipientId: p.sender.id,
                                                replyMessageId: p.id,
                                                includePreviousMessage: T.includePreviousMessage
                                            })];
                                        case 2:
                                            return e.sent(), I({
                                                type: "success",
                                                message: t("Message.SendSuccessfully")
                                            }), C(nw), rT("Roblox.Messages.MessageSent"), [3, 5];
                                        case 3:
                                            return I({
                                                type: "warning",
                                                message: nS(e.sent(), t("Message.UnknownError"))
                                            }), [3, 5];
                                        case 4:
                                            return C(function(e) {
                                                return nm(nh({}, e), {
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
                            I(null)
                        },
                        shouldShowSystemUser: function(e) {
                            return "sent" !== n.tab && 1 === e.sender.id
                        }
                    }
                };

            function nP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nA(e) {
                if (Array.isArray(e)) return e
            }

            function nI() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function nN(e, t) {
                if (e) {
                    if ("string" == typeof e) return nP(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nP(e, t)
                }
            }
            var nk = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                nT = k().forwardRef(function(e, t) {
                    var r, n = nA(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || nN(r) || nI(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.name,
                        l = o.size,
                        c = o.className,
                        u = (o.children, function(e, t) {
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
                        s = (nA(a) || function(e) {
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
                        }(a) || nN(a, 1) || nI())[0];
                    return k().createElement("span", function(e) {
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
                        className: re("grow-0 shrink-0 basis-auto icon", i, nk[void 0 === l ? "Medium" : l], c)
                    }, u))
                });
            nT.displayName = "Icon";
            var nC = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                nM = function(e) {
                    var t = e.className;
                    return k().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: re("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                n_ = "opacity-[0.5]",
                nR = function(e) {
                    var t = e.width,
                        r = e.height;
                    return k().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, k().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function nB(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nD(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function nH() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = nD(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : nD(t[e], null)
                        }
                    }
                }
            }

            function nL() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return N.useCallback(nH.apply(void 0, function(e) {
                    if (Array.isArray(e)) return nB(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return nB(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nB(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function nF(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nU(e) {
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

            function nz(e, t) {
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

            function nG(e, t) {
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

            function nV(e) {
                return function(e) {
                    if (Array.isArray(e)) return nF(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return nF(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nF(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nK(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var nX = Symbol.for("react.lazy"),
                nW = N[" use ".trim().toString()];

            function nZ(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : nK(e)) === "object" && "$$typeof" in e && e.$$typeof === nX && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : nK(t)) === "object" && null !== t && "then" in t
            }
            var n$ = ((e = N.forwardRef(function(e, t) {
                    var r = e.children,
                        n = nG(e, ["children"]);
                    if (nZ(r) && "function" == typeof nW && (r = nW(r._payload)), N.isValidElement(r)) {
                        var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                            s = function(e, t) {
                                var r = nU({}, t);
                                for (var n in t) ! function(n) {
                                    var o = e[n],
                                        a = t[n];
                                    /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = a.apply(void 0, nV(t));
                                        return o.apply(void 0, nV(t)), n
                                    } : o && (r[n] = o) : "style" === n ? r[n] = nU({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                }(n);
                                return nU({}, e, r)
                            }(n, r.props);
                        return r.type !== N.Fragment && (s.ref = t ? nH(t, u) : u), N.cloneElement(r, s)
                    }
                    return N.Children.count(r) > 1 ? N.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), o = e, (a = N.forwardRef(function(e, t) {
                    var r = e.children,
                        n = nG(e, ["children"]);
                    nZ(r) && "function" == typeof nW && (r = nW(r._payload));
                    var a = N.Children.toArray(r),
                        i = a.find(nq);
                    if (i) {
                        var l = i.props.children,
                            c = a.map(function(e) {
                                return e !== i ? e : N.Children.count(l) > 1 ? N.Children.only(null) : N.isValidElement(l) ? l.props.children : null
                            });
                        return (0, x.jsx)(o, nz(nU({}, n), {
                            ref: t,
                            children: N.isValidElement(l) ? N.cloneElement(l, void 0, c) : null
                        }))
                    }
                    return (0, x.jsx)(o, nz(nU({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), a),
                nY = Symbol("radix.slottable");

            function nq(e) {
                return N.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === nY
            }

            function nJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nQ(e) {
                if (Array.isArray(e)) return e
            }

            function n0() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
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

            function n2(e, t) {
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

            function n3(e, t) {
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

            function n8(e, t) {
                if (e) {
                    if ("string" == typeof e) return nJ(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nJ(e, t)
                }
            }
            var n5 = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                n4 = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                n6 = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                n7 = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                n9 = (0, N.forwardRef)(function(e, t) {
                    var r, n = nQ(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || n8(r) || n0(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.children,
                        l = o.className,
                        c = o.style,
                        u = o.isDisabled,
                        s = void 0 !== u && u,
                        f = o.isLoading,
                        p = void 0 !== f && f,
                        d = o.icon,
                        h = o.size,
                        m = void 0 === h ? "Large" : h,
                        b = o.variant,
                        y = void 0 === b ? "Emphasis" : b,
                        v = o.asChild,
                        g = n3(o, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        O = (nQ(a) || function(e) {
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
                        }(a) || n8(a, 1) || n0())[0],
                        w = re("foundation-web-button", s ? n_ : [nC, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", n4[m], s ? n7[y] : n6[y], l),
                        j = n1({
                            textDecoration: "none"
                        }, c),
                        S = function(e) {
                            return k().createElement(k().Fragment, null, k().createElement(nM, null), p && k().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, k().createElement(nR, {
                                width: n5[m],
                                height: n5[m]
                            })), k().createElement("span", {
                                className: re("flex items-center min-width-0", "Large" === m || "Medium" === m ? "gap-small" : "gap-xsmall", p && "invisible")
                            }, d && k().createElement(nT, {
                                name: d,
                                size: m
                            }), k().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (v) {
                        g.as;
                        var E = n3(g, ["as"]),
                            x = k().Children.only(i);
                        return k().createElement(n$, n2(n1({
                            ref: O
                        }, E), {
                            className: w,
                            style: j,
                            "aria-disabled": s || void 0
                        }), k().cloneElement(x, {}, S(x.props.children)))
                    }
                    if ("a" === g.as) {
                        g.as;
                        var P = g.href,
                            A = n3(g, ["as", "href"]);
                        return k().createElement("a", n2(n1({
                            ref: O
                        }, A), {
                            "aria-disabled": s,
                            href: s ? void 0 : P,
                            className: w,
                            style: j
                        }), S(i))
                    }
                    g.as;
                    var I = n3(g, ["as"]);
                    return k().createElement("button", n2(n1({
                        ref: O,
                        type: "button"
                    }, I), {
                        disabled: s,
                        className: w,
                        style: j
                    }), S(i))
                }),
                oe = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                ot = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                or = function(e) {
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
                    return k().createElement("button", function(e) {
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
                        className: re("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", nC, ot[t], oe[r], n && "radius-circle", o)
                    }, a), k().createElement(nM, null), k().createElement(nT, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function on(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oo(e) {
                if (Array.isArray(e)) return e
            }

            function oa() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

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

            function ol(e, t) {
                return oo(e) || function(e, t) {
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
                }(e, t) || oc(e, t) || oa()
            }

            function oc(e, t) {
                if (e) {
                    if ("string" == typeof e) return on(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return on(e, t)
                }
            }
            var ou = (0, N.forwardRef)(function(e, t) {
                    var r, n, o, a = oo(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || oc(r) || oa(),
                        i = a[0],
                        l = a.slice(1),
                        c = i.title,
                        u = i.icon,
                        s = i.actionLabel,
                        f = i.onAction,
                        p = i.actions,
                        d = i.onClose,
                        h = i.closeIconAriaLabel,
                        m = i.shouldAutoDismiss,
                        b = i.autoDismissDurationMs,
                        y = i.className,
                        v = function(e, t) {
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
                        g = ol(l, 1)[0],
                        O = ol((0, N.useState)("enter"), 2),
                        w = O[0],
                        j = O[1],
                        S = (0, N.useRef)(void 0),
                        E = (0, N.useRef)(void 0),
                        x = (0, N.useRef)(void 0),
                        P = (0, N.useRef)(null),
                        A = null != p ? p : s && f && k().createElement(n9, {
                            size: "Small",
                            variant: "Utility",
                            className: "content-inverse-emphasis",
                            onClick: f,
                            ref: P
                        }, s),
                        I = !!A,
                        T = c.length > 80,
                        C = null == m || m,
                        M = 4e3;
                    I && (M = T ? 1e4 : 7e3);
                    var _ = null != b ? b : M,
                        R = (0, N.useCallback)(function() {
                            "exit" !== w && (j("exit"), void 0 !== E.current && (window.clearTimeout(E.current), E.current = void 0), x.current = window.setTimeout(function() {
                                null == d || d()
                            }, 150))
                        }, [d, w]);
                    (0, N.useEffect)(function() {
                        return S.current = window.requestAnimationFrame(function() {
                                j("idle")
                            }),
                            function() {
                                void 0 !== S.current && window.cancelAnimationFrame(S.current)
                            }
                    }, []), (0, N.useEffect)(function() {
                        void 0 !== E.current && (window.clearTimeout(E.current), E.current = void 0), C && "exit" !== w && (E.current = window.setTimeout(function() {
                            R()
                        }, _))
                    }, [_, C, w, R]), (0, N.useEffect)(function() {
                        var e;
                        I && (null == (e = P.current) || e.focus())
                    }, [I]), (0, N.useEffect)(function() {
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
                        D = v.style ? oi({}, B, v.style) : B;
                    return k().createElement("div", oi({
                        ref: g,
                        role: "status",
                        "aria-live": "polite",
                        className: re("flex items-center gap-xxlarge radius-medium shadow-transient-low bg-inverse-surface-0 padding-x-medium padding-y-medium stroke-standard shrink-0", "max-width-[480px] min-height-[48px]", "min-width-[min(100%-max(2_*_var(--margin-small),env(safe-area-inset-left)+env(safe-area-inset-right)),393px)]", "foundation-web-portal-zindex pointer-events-auto", "exit" === w ? "ease-standard-in" : "ease-standard-out", y),
                        style: (n = oi({}, D), o = o = {
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
                    }, v), k().createElement("div", {
                        className: "flex items-center gap-medium grow-1 basis-0 min-h-[40px]"
                    }, u && k().createElement(nT, {
                        name: u,
                        size: "Small",
                        className: "shrink-0 content-inverse-emphasis"
                    }), k().createElement("div", {
                        className: "grow-1 basis-0 text-caption-large content-inverse-emphasis text-truncate-end"
                    }, c)), k().createElement("div", {
                        className: "flex items-center justify-end gap-small shrink-0"
                    }, A, d && k().createElement(or, {
                        variant: "Utility",
                        size: "Small",
                        isCircular: !0,
                        className: "content-inverse-emphasis",
                        "aria-label": void 0 === h ? "Dismiss snackbar" : h,
                        onClick: R
                    })))
                }),
                os = function(e) {
                    var t = e.feedback,
                        r = e.onClose;
                    return t ? (0, x.jsx)(ou, {
                        title: t.message,
                        onClose: r,
                        shouldAutoDismiss: !0
                    }) : null
                },
                of = 0,
                op = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        t = (0, N.useRef)();
                    return t.current || (of += 1, t.current = "".concat(e).concat(of)), t.current
                };

            function od(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oh(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function om(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        oh(e, t, r[t])
                    })
                }
                return e
            }

            function ob(e) {
                return function(e) {
                    if (Array.isArray(e)) return od(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return od(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return od(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oy(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    n = function() {
                        var t = r.map(function(e) {
                            return N.createContext(e)
                        });
                        return function(r) {
                            var n = (null == r ? void 0 : r[e]) || t;
                            return N.useMemo(function() {
                                var t, o;
                                return oh({}, "__scope".concat(e), (t = om({}, r), o = null != (o = oh({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
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
                    var o = N.createContext(n),
                        a = r.length;
                    r = ob(r).concat([n]);
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
                            c = (null == n || null == (r = n[e]) ? void 0 : r[a]) || o,
                            u = N.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, x.jsx)(c.Provider, {
                            value: u,
                            children: i
                        })
                    };
                    return i.displayName = t + "Provider", [i, function(r, i) {
                        var l, c = (null == i || null == (l = i[e]) ? void 0 : l[a]) || o,
                            u = N.useContext(c);
                        if (u) return u;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, ov.apply(void 0, [n].concat(ob(t)))]
            }

            function ov() {
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
                            return om({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return N.useMemo(function() {
                            return oh({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }

            function og(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }
            "u" > typeof window && window.document && window.document.createElement;
            var oO = (null == (S = globalThis) ? void 0 : S.document) ? N.useLayoutEffect : function() {};

            function ow(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oj(e, t) {
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
                        if ("string" == typeof e) return ow(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ow(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var oS = N[" useInsertionEffect ".trim().toString()] || oO;

            function oE(e) {
                var t, r, n, o, a, i, l, c, u = e.prop,
                    s = e.defaultProp,
                    f = e.onChange,
                    p = e.caller,
                    d = oj((r = (t = {
                        defaultProp: s,
                        onChange: void 0 === f ? function() {} : f
                    }).defaultProp, n = t.onChange, a = (o = oj(N.useState(r), 2))[0], i = o[1], l = N.useRef(a), c = N.useRef(n), oS(function() {
                        c.current = n
                    }, [n]), N.useEffect(function() {
                        if (l.current !== a) {
                            var e;
                            null == (e = c.current) || e.call(c, a), l.current = a
                        }
                    }, [a, l]), [a, i, c]), 3),
                    h = d[0],
                    m = d[1],
                    b = d[2],
                    y = void 0 !== u,
                    v = y ? u : h,
                    g = N.useRef(void 0 !== u);
                return N.useEffect(function() {
                    var e = g.current;
                    if (e !== y) {
                        var t = y ? "controlled" : "uncontrolled";
                        console.warn("".concat(p, " is changing from ").concat(e ? "controlled" : "uncontrolled", " to ").concat(t, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                    }
                    g.current = y
                }, [y, p]), [v, N.useCallback(function(e) {
                    if (y) {
                        var t, r = "function" == typeof e ? e(u) : e;
                        r !== u && (null == (t = b.current) || t.call(b, r))
                    } else m(e)
                }, [y, u, m, b])]
            }

            function ox(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oA(e, t) {
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
                        if ("string" == typeof e) return oP(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oP(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            Symbol("RADIX:SYNC_STATE");
            var oI = function(e) {
                var t, r, n, o, a, i, l, c, u, s, f, p, d, h, m, b, y, v = e.present,
                    g = e.children,
                    O = (t = v, a = (o = oA(N.useState(), 2))[0], i = o[1], l = N.useRef(null), c = N.useRef(t), u = N.useRef("none"), f = (s = oA((r = t ? "mounted" : "unmounted", n = {
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
                    }, N.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], p = s[1], N.useEffect(function() {
                        var e = oN(l.current);
                        u.current = "mounted" === f ? e : "none"
                    }, [f]), oO(function() {
                        var e = l.current,
                            r = c.current;
                        if (r !== t) {
                            var n = u.current,
                                o = oN(e);
                            t ? p("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? p("UNMOUNT") : r && n !== o ? p("ANIMATION_OUT") : p("UNMOUNT"), c.current = t
                        }
                    }, [t, p]), oO(function() {
                        if (a) {
                            var e, t, r = null != (e = a.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = oN(l.current).includes(CSS.escape(e.animationName));
                                    if (e.target === a && n && (p("ANIMATION_END"), !c.current)) {
                                        var o = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === a && (u.current = oN(l.current))
                                };
                            return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", n), a.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", n), a.removeEventListener("animationend", n)
                                }
                        }
                        p("ANIMATION_END")
                    }, [a, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: N.useCallback(function(e) {
                            l.current = e ? getComputedStyle(e) : null, i(e)
                        }, [])
                    }),
                    w = "function" == typeof g ? g({
                        present: O.isPresent
                    }) : N.Children.only(g),
                    j = nL(O.ref, (y = (b = null == (h = Object.getOwnPropertyDescriptor((d = w).props, "ref")) ? void 0 : h.get) && "isReactWarning" in b && b.isReactWarning) ? d.ref : (y = (b = null == (m = Object.getOwnPropertyDescriptor(d, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning) ? d.props.ref : d.props.ref || d.ref);
                return "function" == typeof g || O.isPresent ? N.cloneElement(w, {
                    ref: j
                }) : null
            };

            function oN(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function ok(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oT(e) {
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

            function oC(e, t) {
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

            function oM(e, t) {
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

            function o_(e) {
                return function(e) {
                    if (Array.isArray(e)) return ok(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return ok(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ok(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oR(e) {
                var t, r, n = (t = e, (r = N.forwardRef(function(e, t) {
                        var r = e.children,
                            n = oM(e, ["children"]);
                        if (N.isValidElement(r)) {
                            var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = oT({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            a = t[n];
                                        /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = a.apply(void 0, o_(t));
                                            return o.apply(void 0, o_(t)), n
                                        } : o && (r[n] = o) : "style" === n ? r[n] = oT({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                    }(n);
                                    return oT({}, e, r)
                                }(n, r.props);
                            return r.type !== N.Fragment && (s.ref = t ? nH(t, u) : u), N.cloneElement(r, s)
                        }
                        return N.Children.count(r) > 1 ? N.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = N.forwardRef(function(e, t) {
                        var r = e.children,
                            o = oM(e, ["children"]),
                            a = N.Children.toArray(r),
                            i = a.find(oD);
                        if (i) {
                            var l = i.props.children,
                                c = a.map(function(e) {
                                    return e !== i ? e : N.Children.count(l) > 1 ? N.Children.only(null) : N.isValidElement(l) ? l.props.children : null
                                });
                            return (0, x.jsx)(n, oC(oT({}, o), {
                                ref: t,
                                children: N.isValidElement(l) ? N.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, x.jsx)(n, oC(oT({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            oI.displayName = "Presence", window.ReactDOM;
            var oB = Symbol("radix.slottable");

            function oD(e) {
                return N.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === oB
            }

            function oH(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function oL(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        oH(e, t, r[t])
                    })
                }
                return e
            }

            function oF(e, t) {
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
            var oU = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r = oR("Primitive.".concat(t)),
                    n = N.forwardRef(function(e, n) {
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
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, x.jsx)(i, oF(oL({}, a), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), oF(oL({}, e), oH({}, t, n))
            }, {});

            function oz(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oG(e) {
                if (Array.isArray(e)) return e
            }

            function oV() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function oK(e) {
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

            function oW(e, t) {
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

            function oZ(e, t) {
                return oG(e) || function(e, t) {
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
                }(e, t) || oY(e, t) || oV()
            }

            function o$(e) {
                return oG(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || oY(e) || oV()
            }

            function oY(e, t) {
                if (e) {
                    if ("string" == typeof e) return oz(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oz(e, t)
                }
            }
            var oq = "Checkbox",
                oJ = oZ(oy(oq), 2),
                oQ = oJ[0];
            oJ[1];
            var o0 = oZ(oQ(oq), 2),
                o1 = o0[0],
                o2 = o0[1];

            function o3(e) {
                var t = e.__scopeCheckbox,
                    r = e.checked,
                    n = e.children,
                    o = e.defaultChecked,
                    a = e.disabled,
                    i = e.form,
                    l = e.name,
                    c = e.onCheckedChange,
                    u = e.required,
                    s = e.value,
                    f = e.internal_do_not_use_render,
                    p = oZ(oE({
                        prop: r,
                        defaultProp: null != o && o,
                        onChange: c,
                        caller: oq
                    }), 2),
                    d = p[0],
                    h = p[1],
                    m = oZ(N.useState(null), 2),
                    b = m[0],
                    y = m[1],
                    v = oZ(N.useState(null), 2),
                    g = v[0],
                    O = v[1],
                    w = N.useRef(!1),
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
                        required: u,
                        defaultChecked: !at(o) && o,
                        isFormControl: j,
                        bubbleInput: g,
                        setBubbleInput: O
                    };
                return (0, x.jsx)(o1, oX(oK({
                    scope: t
                }, S), {
                    children: "function" == typeof f ? f(S) : n
                }))
            }
            var o8 = "CheckboxTrigger",
                o5 = N.forwardRef(function(e, t) {
                    var r = o$([e, t]),
                        n = r[0],
                        o = r.slice(1),
                        a = n.__scopeCheckbox,
                        i = n.onKeyDown,
                        l = n.onClick,
                        c = oW(n, ["__scopeCheckbox", "onKeyDown", "onClick"]),
                        u = oZ(o, 1)[0],
                        s = o2(o8, a),
                        f = s.control,
                        p = s.value,
                        d = s.disabled,
                        h = s.checked,
                        m = s.required,
                        b = s.setControl,
                        y = s.setChecked,
                        v = s.hasConsumerStoppedPropagationRef,
                        g = s.isFormControl,
                        O = s.bubbleInput,
                        w = nL(u, b),
                        j = N.useRef(h);
                    return N.useEffect(function() {
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
                    }, [f, y]), (0, x.jsx)(oU.button, oX(oK({
                        type: "button",
                        role: "checkbox",
                        "aria-checked": at(h) ? "mixed" : h,
                        "aria-required": m,
                        "data-state": ar(h),
                        "data-disabled": d ? "" : void 0,
                        disabled: d,
                        value: p
                    }, c), {
                        ref: w,
                        onKeyDown: og(i, function(e) {
                            "Enter" === e.key && e.preventDefault()
                        }),
                        onClick: og(l, function(e) {
                            y(function(e) {
                                return !!at(e) || !e
                            }), O && g && (v.current = e.isPropagationStopped(), v.current || e.stopPropagation())
                        })
                    }))
                });
            o5.displayName = o8;
            var o4 = N.forwardRef(function(e, t) {
                var r = e.__scopeCheckbox,
                    n = e.name,
                    o = e.checked,
                    a = e.defaultChecked,
                    i = e.required,
                    l = e.disabled,
                    c = e.value,
                    u = e.onCheckedChange,
                    s = e.form,
                    f = oW(e, ["__scopeCheckbox", "name", "checked", "defaultChecked", "required", "disabled", "value", "onCheckedChange", "form"]);
                return (0, x.jsx)(o3, {
                    __scopeCheckbox: r,
                    checked: o,
                    defaultChecked: a,
                    disabled: l,
                    required: i,
                    onCheckedChange: u,
                    name: n,
                    form: s,
                    value: c,
                    internal_do_not_use_render: function(e) {
                        var n = e.isFormControl;
                        return (0, x.jsxs)(x.Fragment, {
                            children: [(0, x.jsx)(o5, oX(oK({}, f), {
                                ref: t,
                                __scopeCheckbox: r
                            })), n && (0, x.jsx)(ae, {
                                __scopeCheckbox: r
                            })]
                        })
                    }
                })
            });
            o4.displayName = oq;
            var o6 = "CheckboxIndicator",
                o7 = N.forwardRef(function(e, t) {
                    var r = e.__scopeCheckbox,
                        n = e.forceMount,
                        o = oW(e, ["__scopeCheckbox", "forceMount"]),
                        a = o2(o6, r);
                    return (0, x.jsx)(oI, {
                        present: n || at(a.checked) || !0 === a.checked,
                        children: (0, x.jsx)(oU.span, oX(oK({
                            "data-state": ar(a.checked),
                            "data-disabled": a.disabled ? "" : void 0
                        }, o), {
                            ref: t,
                            style: oK({
                                pointerEvents: "none"
                            }, e.style)
                        }))
                    })
                });
            o7.displayName = o6;
            var o9 = "CheckboxBubbleInput",
                ae = N.forwardRef(function(e, t) {
                    var r, n, o, a, i, l = o$([e, t]),
                        c = l[0],
                        u = l.slice(1),
                        s = c.__scopeCheckbox,
                        f = oW(c, ["__scopeCheckbox"]),
                        p = oZ(u, 1)[0],
                        d = o2(o9, s),
                        h = d.control,
                        m = d.hasConsumerStoppedPropagationRef,
                        b = d.checked,
                        y = d.defaultChecked,
                        v = d.required,
                        g = d.disabled,
                        O = d.name,
                        w = d.value,
                        j = d.form,
                        S = d.bubbleInput,
                        E = nL(p, d.setBubbleInput),
                        P = (r = N.useRef({
                            value: b,
                            previous: b
                        }), N.useMemo(function() {
                            return r.current.value !== b && (r.current.previous = r.current.value, r.current.value = b), r.current.previous
                        }, [b])),
                        A = (a = (o = function(e) {
                            if (Array.isArray(e)) return e
                        }(n = N.useState(void 0)) || function(e) {
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
                                if ("string" == typeof e) return ox(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ox(e, 2)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], i = o[1], oO(function() {
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
                    N.useEffect(function() {
                        if (S) {
                            var e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                                t = !m.current;
                            if (P !== b && e) {
                                var r = new Event("click", {
                                    bubbles: t
                                });
                                S.indeterminate = at(b), e.call(S, !at(b) && b), S.dispatchEvent(r)
                            }
                        }
                    }, [S, P, b, m]);
                    var I = N.useRef(!at(b) && b);
                    return (0, x.jsx)(oU.input, oX(oK({
                        type: "checkbox",
                        "aria-hidden": !0,
                        defaultChecked: null != y ? y : I.current,
                        required: v,
                        disabled: g,
                        name: O,
                        value: w,
                        form: j
                    }, f), {
                        tabIndex: -1,
                        ref: E,
                        style: oX(oK({}, f.style, A), {
                            position: "absolute",
                            pointerEvents: "none",
                            opacity: 0,
                            margin: 0,
                            transform: "translateX(-100%)"
                        })
                    }))
                });

            function at(e) {
                return "indeterminate" === e
            }

            function ar(e) {
                return at(e) ? "indeterminate" : e ? "checked" : "unchecked"
            }
            ae.displayName = o9;
            var an = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-600"
                },
                ao = {
                    XSmall: "",
                    Small: "",
                    Medium: "",
                    Large: "padding-y-xxsmall"
                },
                aa = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                ai = {
                    XSmall: "",
                    Small: "padding-top-xxsmall",
                    Medium: "padding-top-xxsmall",
                    Large: "padding-top-xxsmall"
                },
                al = function(e) {
                    var t = e.label,
                        r = e.className,
                        n = e.isChecked,
                        o = e.isDisabled,
                        a = e.size,
                        i = e.hint,
                        l = e.placement,
                        c = e.onCheckedChange,
                        u = e.id,
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
                        f = op(),
                        p = u || f,
                        d = t && k().createElement("label", {
                            htmlFor: p,
                            className: re("flex flex-col grow-1 gap-xsmall", !o && "cursor-pointer")
                        }, k().createElement("span", {
                            className: re(aa[a], ai[a], "content-emphasis")
                        }, t), i && k().createElement("span", {
                            className: "text-body-medium content-default"
                        }, i));
                    return k().createElement("div", {
                        className: re("foundation-web-checkbox flex gap-medium", o && "opacity-[0.5]", !o && "cursor-pointer", r)
                    }, "End" === l && d, k().createElement("div", {
                        className: re(ao[a])
                    }, k().createElement(o4, function(e) {
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
                        className: re(an[a], nC, !o && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
                        id: p,
                        checked: n,
                        disabled: o,
                        onCheckedChange: c,
                        "aria-label": t
                    }, s), k().createElement(nM, null), k().createElement(o7, {
                        "data-slot": "checkbox-indicator",
                        className: re(an[a], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
                    }))), "Start" === l && d)
                },
                ac = function(e) {
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

            function au(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function as(e) {
                if (Array.isArray(e)) return e
            }

            function af() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ap(e) {
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

            function ad(e, t) {
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

            function ah(e, t) {
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

            function am(e, t) {
                if (e) {
                    if ("string" == typeof e) return au(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return au(e, t)
                }
            }
            var ab = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                ay = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                av = {
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
                ag = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                aO = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                aw = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                aj = {
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
                aS = {
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
                aE = (0, N.forwardRef)(function(e, t) {
                    var r, n, o = as(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || am(r) || af(),
                        a = o[0],
                        i = o.slice(1),
                        l = a.className,
                        c = a.icon,
                        u = a.ariaLabel,
                        s = a.isDisabled,
                        f = void 0 !== s && s,
                        p = a.isCircular,
                        d = a.isSelected,
                        h = a.size,
                        m = void 0 === h ? "Large" : h,
                        b = a.variant,
                        y = void 0 === b ? "Emphasis" : b,
                        v = a.iconColor,
                        g = void 0 === v ? "Default" : v,
                        O = a.asChild,
                        w = a.children,
                        j = ah(a, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]),
                        S = (as(i) || function(e) {
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
                        }(i) || am(i, 1) || af())[0];
                    n = f ? aO[y] : void 0 !== d && d ? aw[y] : ag[y];
                    var E = re("foundation-web-icon-button", f ? n_ : [nC, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", ab[m], av[m][void 0 !== p && p ? "circular" : "square"], n, l),
                        x = k().createElement(k().Fragment, null, k().createElement(nM, null), k().createElement("span", {
                            className: re("icon", c, ay[m], f ? aS[g][y] : aj[g][y])
                        }));
                    if (O) {
                        j.as;
                        var P = ah(j, ["as"]),
                            A = k().Children.only(w);
                        return k().createElement(n$, ad(ap({
                            ref: S
                        }, P), {
                            className: E,
                            "aria-label": u,
                            "aria-disabled": f || void 0
                        }), k().cloneElement(A, {}, x))
                    }
                    if ("a" === j.as) {
                        j.as;
                        var I = j.href,
                            N = ah(j, ["as", "href"]);
                        return k().createElement("a", ad(ap({
                            ref: S
                        }, N), {
                            "aria-label": u,
                            "aria-disabled": f,
                            href: f ? void 0 : I,
                            className: E
                        }), x)
                    }
                    j.as;
                    var T = ah(j, ["as"]);
                    return k().createElement("button", ad(ap({
                        ref: S,
                        type: "button"
                    }, T), {
                        "aria-label": u,
                        disabled: f,
                        className: E
                    }), x)
                }),
                ax = function(e) {
                    var t = e.translate,
                        r = e.currentPage,
                        n = e.totalPages,
                        o = e.onChangePage;
                    return n <= 1 ? null : (0, x.jsxs)("div", {
                        className: "flex items-center gap-xsmall justify-end",
                        children: [(0, x.jsx)(aE, {
                            icon: "icon-filled-chevron-large-left-to-line",
                            variant: "Utility",
                            size: "Medium",
                            isDisabled: r <= 1,
                            ariaLabel: t("Action.FirstPage"),
                            onClick: function() {
                                o(1)
                            }
                        }), (0, x.jsx)(aE, {
                            icon: "icon-filled-chevron-large-left",
                            variant: "Utility",
                            size: "Medium",
                            isDisabled: r <= 1,
                            ariaLabel: t("Action.Previous"),
                            onClick: function() {
                                o(r - 1)
                            }
                        }), (0, x.jsxs)("span", {
                            className: "text-body-large content-muted padding-x-small",
                            children: [r, " / ", n]
                        }), (0, x.jsx)(aE, {
                            icon: "icon-filled-chevron-large-right",
                            variant: "Utility",
                            size: "Medium",
                            isDisabled: r >= n,
                            ariaLabel: t("Action.Next"),
                            onClick: function() {
                                o(r + 1)
                            }
                        }), (0, x.jsx)(aE, {
                            icon: "icon-filled-chevron-large-right-to-line",
                            variant: "Utility",
                            size: "Medium",
                            isDisabled: r >= n,
                            ariaLabel: t("Action.LastPage"),
                            onClick: function() {
                                o(n)
                            }
                        })]
                    })
                },
                aP = function(e) {
                    var t = e.translate,
                        r = e.activeTab,
                        n = e.moduleState,
                        o = e.selectedCount,
                        a = e.totalCount,
                        i = e.currentPage,
                        l = e.totalPages,
                        c = e.onToggleSelectAll,
                        u = e.onMarkArchive,
                        s = e.onMarkRead,
                        f = e.onBack,
                        p = e.onChangePage,
                        d = r === rc,
                        h = r === rf;
                    return r === ru || r === rs ? n === rp ? (0, x.jsx)("div", {
                        className: "flex justify-end margin-y-medium",
                        children: (0, x.jsx)(ax, {
                            translate: t,
                            currentPage: i,
                            totalPages: l,
                            onChangePage: p
                        })
                    }) : (0, x.jsx)("div", {
                        className: "margin-y-medium",
                        children: (0, x.jsx)(n9, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: f,
                            children: t("Action.Back")
                        })
                    }) : n === rd ? (0, x.jsxs)("div", {
                        className: "flex items-center gap-small margin-y-medium",
                        children: [(0, x.jsx)(n9, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: f,
                            children: t("Action.Back")
                        }), d ? (0, x.jsx)(n9, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: function() {
                                u(!0)
                            },
                            children: t("Action.Archive")
                        }) : null, h ? (0, x.jsx)(n9, {
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
                            children: [(0, x.jsx)(ac, {
                                className: "padding-left-large",
                                children: (0, x.jsx)(al, {
                                    label: t("Label.All"),
                                    size: "Medium",
                                    placement: "Start",
                                    isChecked: a > 0 && o === a,
                                    onCheckedChange: c
                                })
                            }), (0, x.jsxs)("div", {
                                className: "private-message-action-buttons flex items-center gap-small wrap",
                                children: [d ? (0, x.jsx)(n9, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        u(!0)
                                    },
                                    children: t("Action.Archive")
                                }) : null, h ? (0, x.jsx)(n9, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        u(!1)
                                    },
                                    children: t("Action.MoveToInbox")
                                }) : null, (0, x.jsx)(n9, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        s(!0)
                                    },
                                    children: t("Action.MarkAsRead")
                                }), (0, x.jsx)(n9, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        s(!1)
                                    },
                                    children: t("Action.MarkAsUnread")
                                })]
                            })]
                        }), (0, x.jsx)(ax, {
                            translate: t,
                            currentPage: i,
                            totalPages: l,
                            onChangePage: p
                        })]
                    })
                };

            function aA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aI(e) {
                if (Array.isArray(e)) return e
            }

            function aN() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ak(e, t) {
                if (e) {
                    if ("string" == typeof e) return aA(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aA(e, t)
                }
            }
            var aT = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                aC = k().forwardRef(function(e, t) {
                    var r, n = aI(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || ak(r) || aN(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.name,
                        l = o.size,
                        c = o.className,
                        u = (o.children, function(e, t) {
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
                        s = (aI(a) || function(e) {
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
                        }(a) || ak(a, 1) || aN())[0];
                    return k().createElement("span", function(e) {
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
                        className: re("grow-0 shrink-0 basis-auto icon", i, aT[void 0 === l ? "Medium" : l], c)
                    }, u))
                });
            aC.displayName = "Icon";
            var aM = function(e) {
                    var t = e.titleText,
                        r = e.size,
                        n = void 0 === r ? "XSmall" : r,
                        o = e.className;
                    return (0, x.jsxs)("span", {
                        className: re("relative inline-flex items-center justify-center", o),
                        role: "img",
                        "aria-label": t,
                        title: t,
                        children: [(0, x.jsx)(aC, {
                            name: "icon-filled-verified-backplate",
                            className: "content-system-emphasis",
                            size: n
                        }), (0, x.jsx)(aC, {
                            name: "icon-filled-verified-check",
                            className: "absolute content-[white]",
                            size: n
                        })]
                    })
                },
                a_ = r(611),
                aR = r.n(a_),
                aB = function(e) {
                    return "string" == typeof e ? e : e.src
                },
                aD = function(e) {
                    var t = e.className;
                    return (0, x.jsxs)("span", {
                        "aria-hidden": "true",
                        className: aR()("flex items-center justify-center", t),
                        children: [(0, x.jsx)("img", {
                            alt: "",
                            src: aB("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1NiIgaGVpZ2h0PSI1NiIgZmlsbD0ibm9uZSIgdmlld0JveD0iMCAwIDU2IDU2Ij48cGF0aCBmaWxsPSIjMzkzYjNkIiBkPSJNMTEuNjc2IDAgMCA0NC4xNjYgNDMuNTc3IDU2bDExLjY3Ni00NC4xNjZ6bTIwLjQwOSAzNS44MjctMTIuMTc3LTMuMzA4IDMuMjY0LTEyLjM0MiAxMi4xODIgMy4zMDh6Ii8+PC9zdmc+"),
                            className: "dark:hidden",
                            style: {
                                width: "100%",
                                height: "100%"
                            }
                        }), (0, x.jsx)("img", {
                            alt: "",
                            src: aB("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1NiIgaGVpZ2h0PSI1NiIgZmlsbD0ibm9uZSIgdmlld0JveD0iMCAwIDU2IDU2Ij48cGF0aCBmaWxsPSIjZmZmIiBkPSJNMTEuNjc2IDAgMCA0NC4xNjYgNDMuNTc3IDU2bDExLjY3Ni00NC4xNjZ6bTIwLjQwOSAzNS44MjctMTIuMTc3LTMuMzA4IDMuMjY0LTEyLjM0MiAxMi4xODIgMy4zMDh6Ii8+PC9zdmc+"),
                            className: "hidden dark:block",
                            style: {
                                width: "100%",
                                height: "100%"
                            }
                        })]
                    })
                },
                aH = function(e) {
                    var t = e.message,
                        r = e.activeTab,
                        n = e.renderThumbnail,
                        o = r === ru ? t.recipient : t.sender,
                        a = r !== ru && 1 === t.sender.id;
                    return (0, x.jsx)("a", {
                        href: o.profileLink,
                        className: "size-800 shrink-0 flex items-center justify-center",
                        children: a ? (0, x.jsx)(aD, {
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
                aL = function(e) {
                    var t = e.translate,
                        r = e.renderThumbnail,
                        n = e.formatDetailDate,
                        o = e.message,
                        a = e.activeTab;
                    if (!o) return null;
                    var i = a === ru ? o.recipient : o.sender;
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
                                    children: [(0, x.jsx)(aH, {
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
                                            }), i.hasVerifiedBadge ? (0, x.jsx)(aM, {
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
                aF = function(e) {
                    var t = e.translate,
                        r = e.message,
                        n = e.activeTab,
                        o = e.isUnread,
                        a = n === ru ? r.recipient : r.sender;
                    return (0, x.jsxs)("span", {
                        className: "flex items-center gap-xsmall text-truncate-end",
                        children: [(0, x.jsx)("span", {
                            className: aR()("text-truncate-end text-title-large", o ? "content-emphasis" : "content-muted"),
                            children: a.displayName
                        }), a.hasVerifiedBadge ? (0, x.jsx)(aM, {
                            size: "Medium",
                            titleText: t("Creator.VerifiedBadgeIconAccessibilityText")
                        }) : null, (0, x.jsxs)("span", {
                            className: "text-truncate-end text-body-medium content-muted",
                            children: ["@", a.name]
                        })]
                    })
                },
                aU = function(e) {
                    var t = e.message,
                        r = e.activeTab,
                        n = e.renderThumbnail,
                        o = e.onOpen,
                        a = r === ru ? t.recipient : t.sender,
                        i = r !== ru && 1 === t.sender.id;
                    return (0, x.jsx)("button", {
                        type: "button",
                        className: "private-message-row-avatar bg-none stroke-none padding-none width-full size-800 flex items-center justify-center",
                        onClick: o,
                        "aria-label": a.displayName,
                        children: i ? (0, x.jsx)(aD, {
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
                az = function(e) {
                    var t = e.translate,
                        r = e.renderThumbnail,
                        n = e.formatListDate,
                        o = e.message,
                        a = e.index,
                        i = e.activeTab,
                        l = e.isSelected,
                        c = e.isSelectable,
                        u = e.onToggleSelection,
                        s = e.onOpen,
                        f = function() {
                            s(o, a)
                        },
                        p = !o.isRead && i !== ru;
                    return (0, x.jsxs)("div", {
                        className: aR()("private-message-row grid items-center gap-medium padding-large stroke-bottom stroke-muted transition-colors", p ? "bg-surface-200 hover:bg-surface-300" : "bg-surface-100 hover:bg-surface-300"),
                        children: [(0, x.jsx)(ac, {
                            className: aR()(!c && "invisible"),
                            children: (0, x.jsx)(al, {
                                "aria-label": o.subject,
                                size: "Medium",
                                placement: "Start",
                                isChecked: l,
                                onCheckedChange: function() {
                                    u(o.id)
                                }
                            })
                        }), (0, x.jsx)(aU, {
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
                                children: [(0, x.jsx)(aF, {
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
                                    }), " - ", rA(o.body)]
                                })
                            })]
                        })]
                    })
                };

            function aG(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var aV = (aG(E = {}, rc, "Label.NoMessagesInInbox"), aG(E, ru, "Label.NoSentMessages"), aG(E, rs, "Message.NoNews"), aG(E, rf, "Label.NoMessagesInArchive"), E),
                aK = function(e) {
                    var t, r = e.translate,
                        n = e.renderThumbnail,
                        o = e.formatListDate,
                        a = e.page,
                        i = e.activeTab,
                        l = e.selectedMessageIds,
                        c = e.onToggleSelection,
                        u = e.onOpenMessage,
                        s = null != (t = null == a ? void 0 : a.collection) ? t : [];
                    return 0 === s.length ? (0, x.jsx)("div", {
                        className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large text-body-medium content-muted text-center",
                        children: r(aV[i])
                    }) : (0, x.jsx)("div", {
                        className: "overflow-hidden radius-medium stroke-standard stroke-muted",
                        children: s.map(function(e, t) {
                            return (0, x.jsx)(az, {
                                translate: r,
                                renderThumbnail: n,
                                formatListDate: o,
                                message: e,
                                index: t,
                                activeTab: i,
                                isSelected: l.has(e.id),
                                isSelectable: i !== ru && i !== rs,
                                onToggleSelection: c,
                                onOpen: u
                            }, e.id)
                        })
                    })
                };

            function aX(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var aW = function(e) {
                    var t, r = e.translate,
                        n = e.renderThumbnail,
                        o = e.formatListDate,
                        a = e.notification,
                        i = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, N.useState)(!1)) || function(e) {
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
                                if ("string" == typeof e) return aX(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aX(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        l = i[0],
                        c = i[1],
                        u = 1 === a.sender.id;
                    return (0, x.jsx)("button", {
                        type: "button",
                        className: aR()("width-full stroke-none stroke-bottom stroke-muted padding-medium text-left transition-colors", l ? "bg-surface-200 hover:bg-surface-300" : "bg-surface-100 hover:bg-surface-300"),
                        onClick: function() {
                            c(function(e) {
                                return !e
                            })
                        },
                        "aria-expanded": l,
                        "aria-label": a.subject,
                        children: (0, x.jsxs)("div", {
                            className: "flex gap-small",
                            children: [(0, x.jsx)("span", {
                                className: "size-700 shrink-0 flex items-center justify-center",
                                children: u ? (0, x.jsx)(aD, {
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
                                        }), a.sender.hasVerifiedBadge ? (0, x.jsx)(aM, {
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
                aZ = function(e) {
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
                            return (0, x.jsx)(aW, {
                                translate: r,
                                renderThumbnail: n,
                                formatListDate: o,
                                notification: e
                            }, e.id)
                        })
                    })
                };

            function a$(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aY(e, t, r) {
                return (aY = a3() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && a0(o, r.prototype), o
                }).apply(null, arguments)
            }

            function aq(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function aJ(e) {
                return (aJ = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function aQ(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        aq(e, t, r[t])
                    })
                }
                return e
            }

            function a0(e, t) {
                return (a0 = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function a1(e, t) {
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
                        if ("string" == typeof e) return a$(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return a$(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function a2(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (a2 = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return aY(e, arguments, aJ(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), a0(r, e)
                })(e)
            }

            function a3() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (a3 = function() {
                    return !!e
                })()
            }

            function a8(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            a2(Map);
            var a5 = N[" useId ".trim().toString()] || function() {},
                a4 = 0;

            function a6(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = N.useState(a5())) || function(e) {
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
                            if ("string" == typeof e) return a8(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return a8(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    o = r[1];
                return oO(function() {
                    e || o(function(e) {
                        return null != e ? e : String(a4++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function a7(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var a9 = N.createContext(void 0);

            function ie(e) {
                var t = N.useContext(a9);
                return e || t || "ltr"
            }

            function it(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ir(e) {
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

            function io(e, t) {
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

            function ia(e, t) {
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

            function ii(e, t) {
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
                }(e, t) || il(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function il(e, t) {
                if (e) {
                    if ("string" == typeof e) return it(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return it(e, t)
                }
            }
            var ic = "rovingFocusGroup.onEntryFocus",
                iu = {
                    bubbles: !1,
                    cancelable: !0
                },
                is = "RovingFocusGroup",
                ip = ii((c = (l = a1(oy(i = is + "CollectionProvider"), 2))[0], u = l[1], f = (s = a1(c(i, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], p = s[1], (d = function(e) {
                    var t = e.scope,
                        r = e.children,
                        n = k().useRef(null),
                        o = k().useRef(new Map).current;
                    return (0, x.jsx)(f, {
                        scope: t,
                        itemMap: o,
                        collectionRef: n,
                        children: r
                    })
                }).displayName = i, m = oR(h = is + "CollectionSlot"), (b = k().forwardRef(function(e, t) {
                    var r = e.scope,
                        n = e.children,
                        o = nL(t, p(h, r).collectionRef);
                    return (0, x.jsx)(m, {
                        ref: o,
                        children: n
                    })
                })).displayName = h, v = "data-radix-collection-item", g = oR(y = is + "CollectionItemSlot"), (O = k().forwardRef(function(e, t) {
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
                        l = k().useRef(null),
                        c = nL(t, l),
                        u = p(y, o);
                    return k().useEffect(function() {
                        return u.itemMap.set(l, aQ({
                                ref: l
                            }, i)),
                            function() {
                                u.itemMap.delete(l)
                            }
                    }), (0, x.jsx)(g, (r = aQ({}, aq({}, v, "")), n = n = {
                        ref: c,
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
                    var t = p(is + "CollectionConsumer", e);
                    return k().useCallback(function() {
                        var e = t.collectionRef.current;
                        if (!e) return [];
                        var r = Array.from(e.querySelectorAll("[".concat(v, "]")));
                        return Array.from(t.itemMap.values()).sort(function(e, t) {
                            return r.indexOf(e.ref.current) - r.indexOf(t.ref.current)
                        })
                    }, [t.collectionRef, t.itemMap])
                }, u]), 3),
                id = ip[0],
                ih = ip[1],
                im = ii(oy(is, [ip[2]]), 2),
                ib = im[0],
                iy = im[1],
                iv = ii(ib(is), 2),
                ig = iv[0],
                iO = iv[1],
                iw = N.forwardRef(function(e, t) {
                    return (0, x.jsx)(id.Provider, {
                        scope: e.__scopeRovingFocusGroup,
                        children: (0, x.jsx)(id.Slot, {
                            scope: e.__scopeRovingFocusGroup,
                            children: (0, x.jsx)(ij, io(ir({}, e), {
                                ref: t
                            }))
                        })
                    })
                });
            iw.displayName = is;
            var ij = N.forwardRef(function(e, t) {
                    var r, n = e.__scopeRovingFocusGroup,
                        o = e.orientation,
                        a = e.loop,
                        i = e.dir,
                        l = e.currentTabStopId,
                        c = e.defaultCurrentTabStopId,
                        u = e.onCurrentTabStopIdChange,
                        s = e.onEntryFocus,
                        f = e.preventScrollOnEntryFocus,
                        p = void 0 !== f && f,
                        d = ia(e, ["__scopeRovingFocusGroup", "orientation", "loop", "dir", "currentTabStopId", "defaultCurrentTabStopId", "onCurrentTabStopIdChange", "onEntryFocus", "preventScrollOnEntryFocus"]),
                        h = N.useRef(null),
                        m = nL(t, h),
                        b = ie(i),
                        y = ii(oE({
                            prop: l,
                            defaultProp: null != c ? c : null,
                            onChange: u,
                            caller: is
                        }), 2),
                        v = y[0],
                        g = y[1],
                        O = ii(N.useState(!1), 2),
                        w = O[0],
                        j = O[1],
                        S = (r = N.useRef(s), N.useEffect(function() {
                            r.current = s
                        }), N.useMemo(function() {
                            return function() {
                                for (var e, t = arguments.length, n = Array(t), o = 0; o < t; o++) n[o] = arguments[o];
                                return null == (e = r.current) ? void 0 : e.call.apply(e, [r].concat(function(e) {
                                    if (Array.isArray(e)) return a7(e)
                                }(n) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(n) || function(e) {
                                    if (e) {
                                        if ("string" == typeof e) return a7(e, void 0);
                                        var t = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return a7(e, void 0)
                                    }
                                }(n) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()))
                            }
                        }, [])),
                        E = ih(n),
                        P = N.useRef(!1),
                        A = ii(N.useState(0), 2),
                        I = A[0],
                        k = A[1];
                    return N.useEffect(function() {
                        var e = h.current;
                        if (e) return e.addEventListener(ic, S),
                            function() {
                                return e.removeEventListener(ic, S)
                            }
                    }, [S]), (0, x.jsx)(ig, {
                        scope: n,
                        orientation: o,
                        dir: b,
                        loop: void 0 !== a && a,
                        currentTabStopId: v,
                        onItemFocus: N.useCallback(function(e) {
                            return g(e)
                        }, [g]),
                        onItemShiftTab: N.useCallback(function() {
                            return j(!0)
                        }, []),
                        onFocusableItemAdd: N.useCallback(function() {
                            return k(function(e) {
                                return e + 1
                            })
                        }, []),
                        onFocusableItemRemove: N.useCallback(function() {
                            return k(function(e) {
                                return e - 1
                            })
                        }, []),
                        children: (0, x.jsx)(oU.div, io(ir({
                            tabIndex: w || 0 === I ? -1 : 0,
                            "data-orientation": o
                        }, d), {
                            ref: m,
                            style: ir({
                                outline: "none"
                            }, e.style),
                            onMouseDown: og(e.onMouseDown, function() {
                                P.current = !0
                            }),
                            onFocus: og(e.onFocus, function(e) {
                                var t = !P.current;
                                if (e.target === e.currentTarget && t && !w) {
                                    var r = new CustomEvent(ic, iu);
                                    if (e.currentTarget.dispatchEvent(r), !r.defaultPrevented) {
                                        var n = E().filter(function(e) {
                                            return e.focusable
                                        });
                                        iP([n.find(function(e) {
                                            return e.active
                                        }), n.find(function(e) {
                                            return e.id === v
                                        })].concat(function(e) {
                                            if (Array.isArray(e)) return it(e)
                                        }(n) || function(e) {
                                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                        }(n) || il(n) || function() {
                                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                        }()).filter(Boolean).map(function(e) {
                                            return e.ref.current
                                        }), p)
                                    }
                                }
                                P.current = !1
                            }),
                            onBlur: og(e.onBlur, function() {
                                return j(!1)
                            })
                        }))
                    })
                }),
                iS = "RovingFocusGroupItem",
                iE = N.forwardRef(function(e, t) {
                    var r = e.__scopeRovingFocusGroup,
                        n = e.focusable,
                        o = void 0 === n || n,
                        a = e.active,
                        i = e.tabStopId,
                        l = e.children,
                        c = ia(e, ["__scopeRovingFocusGroup", "focusable", "active", "tabStopId", "children"]),
                        u = a6(),
                        s = i || u,
                        f = iO(iS, r),
                        p = f.currentTabStopId === s,
                        d = ih(r),
                        h = f.onFocusableItemAdd,
                        m = f.onFocusableItemRemove,
                        b = f.currentTabStopId;
                    return N.useEffect(function() {
                        if (o) return h(),
                            function() {
                                return m()
                            }
                    }, [o, h, m]), (0, x.jsx)(id.ItemSlot, {
                        scope: r,
                        id: s,
                        focusable: o,
                        active: void 0 !== a && a,
                        children: (0, x.jsx)(oU.span, io(ir({
                            tabIndex: p ? 0 : -1,
                            "data-orientation": f.orientation
                        }, c), {
                            ref: t,
                            onMouseDown: og(e.onMouseDown, function(e) {
                                o ? f.onItemFocus(s) : e.preventDefault()
                            }),
                            onFocus: og(e.onFocus, function() {
                                return f.onItemFocus(s)
                            }),
                            onKeyDown: og(e.onKeyDown, function(e) {
                                if ("Tab" === e.key && e.shiftKey) return void f.onItemShiftTab();
                                if (e.target === e.currentTarget) {
                                    var t = function(e, t, r) {
                                        var n, o = (n = e.key, "rtl" !== r ? n : "ArrowLeft" === n ? "ArrowRight" : "ArrowRight" === n ? "ArrowLeft" : n);
                                        if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(o)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(o))) return ix[o]
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
                                            return iP(r)
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
            iE.displayName = iS;
            var ix = {
                ArrowLeft: "prev",
                ArrowUp: "prev",
                ArrowRight: "next",
                ArrowDown: "next",
                PageUp: "first",
                Home: "first",
                PageDown: "last",
                End: "last"
            };

            function iP(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                    r = document.activeElement,
                    n = !0,
                    o = !1,
                    a = void 0;
                try {
                    for (var i, l = e[Symbol.iterator](); !(n = (i = l.next()).done); n = !0) {
                        var c = i.value;
                        if (c === r || (c.focus({
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

            function iA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iI(e) {
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

            function iN(e, t) {
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

            function ik(e, t) {
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

            function iT(e, t) {
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
                        if ("string" == typeof e) return iA(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iA(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var iC = "Tabs",
                iM = iT(oy(iC, [iy]), 2),
                i_ = iM[0];
            iM[1];
            var iR = iy(),
                iB = iT(i_(iC), 2),
                iD = iB[0],
                iH = iB[1],
                iL = N.forwardRef(function(e, t) {
                    var r = e.__scopeTabs,
                        n = e.value,
                        o = e.onValueChange,
                        a = e.defaultValue,
                        i = e.orientation,
                        l = void 0 === i ? "horizontal" : i,
                        c = e.dir,
                        u = e.activationMode,
                        s = ik(e, ["__scopeTabs", "value", "onValueChange", "defaultValue", "orientation", "dir", "activationMode"]),
                        f = ie(c),
                        p = iT(oE({
                            prop: n,
                            onChange: o,
                            defaultProp: null != a ? a : "",
                            caller: iC
                        }), 2),
                        d = p[0],
                        h = p[1];
                    return (0, x.jsx)(iD, {
                        scope: r,
                        baseId: a6(),
                        value: d,
                        onValueChange: h,
                        orientation: l,
                        dir: f,
                        activationMode: void 0 === u ? "automatic" : u,
                        children: (0, x.jsx)(oU.div, iN(iI({
                            dir: f,
                            "data-orientation": l
                        }, s), {
                            ref: t
                        }))
                    })
                });
            iL.displayName = iC;
            var iF = "TabsList",
                iU = N.forwardRef(function(e, t) {
                    var r = e.__scopeTabs,
                        n = e.loop,
                        o = ik(e, ["__scopeTabs", "loop"]),
                        a = iH(iF, r),
                        i = iR(r);
                    return (0, x.jsx)(iw, iN(iI({
                        asChild: !0
                    }, i), {
                        orientation: a.orientation,
                        dir: a.dir,
                        loop: void 0 === n || n,
                        children: (0, x.jsx)(oU.div, iN(iI({
                            role: "tablist",
                            "aria-orientation": a.orientation
                        }, o), {
                            ref: t
                        }))
                    }))
                });
            iU.displayName = iF;
            var iz = "TabsTrigger",
                iG = N.forwardRef(function(e, t) {
                    var r = e.__scopeTabs,
                        n = e.value,
                        o = e.disabled,
                        a = void 0 !== o && o,
                        i = ik(e, ["__scopeTabs", "value", "disabled"]),
                        l = iH(iz, r),
                        c = iR(r),
                        u = iX(l.baseId, n),
                        s = iW(l.baseId, n),
                        f = n === l.value;
                    return (0, x.jsx)(iE, iN(iI({
                        asChild: !0
                    }, c), {
                        focusable: !a,
                        active: f,
                        children: (0, x.jsx)(oU.button, iN(iI({
                            type: "button",
                            role: "tab",
                            "aria-selected": f,
                            "aria-controls": s,
                            "data-state": f ? "active" : "inactive",
                            "data-disabled": a ? "" : void 0,
                            disabled: a,
                            id: u
                        }, i), {
                            ref: t,
                            onMouseDown: og(e.onMouseDown, function(e) {
                                a || 0 !== e.button || !1 !== e.ctrlKey ? e.preventDefault() : l.onValueChange(n)
                            }),
                            onKeyDown: og(e.onKeyDown, function(e) {
                                [" ", "Enter"].includes(e.key) && l.onValueChange(n)
                            }),
                            onFocus: og(e.onFocus, function() {
                                var e = "manual" !== l.activationMode;
                                f || a || !e || l.onValueChange(n)
                            })
                        }))
                    }))
                });
            iG.displayName = iz;
            var iV = "TabsContent",
                iK = N.forwardRef(function(e, t) {
                    var r = e.__scopeTabs,
                        n = e.value,
                        o = e.forceMount,
                        a = e.children,
                        i = ik(e, ["__scopeTabs", "value", "forceMount", "children"]),
                        l = iH(iV, r),
                        c = iX(l.baseId, n),
                        u = iW(l.baseId, n),
                        s = n === l.value,
                        f = N.useRef(s);
                    return N.useEffect(function() {
                        var e = requestAnimationFrame(function() {
                            return f.current = !1
                        });
                        return function() {
                            return cancelAnimationFrame(e)
                        }
                    }, []), (0, x.jsx)(oI, {
                        present: o || s,
                        children: function(r) {
                            var n = r.present;
                            return (0, x.jsx)(oU.div, iN(iI({
                                "data-state": s ? "active" : "inactive",
                                "data-orientation": l.orientation,
                                role: "tabpanel",
                                "aria-labelledby": c,
                                hidden: !n,
                                id: u,
                                tabIndex: 0
                            }, i), {
                                ref: t,
                                style: iN(iI({}, e.style), {
                                    animationDuration: f.current ? "0s" : void 0
                                }),
                                children: n && a
                            }))
                        }
                    })
                });

            function iX(e, t) {
                return "".concat(e, "-trigger-").concat(t)
            }

            function iW(e, t) {
                return "".concat(e, "-content-").concat(t)
            }

            function iZ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function i$(e) {
                if (Array.isArray(e)) return e
            }

            function iY() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function iq(e) {
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

            function iJ(e, t) {
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

            function iQ(e, t) {
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

            function i0(e, t) {
                return i$(e) || function(e, t) {
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
                }(e, t) || i2(e, t) || iY()
            }

            function i1(e) {
                return i$(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || i2(e) || iY()
            }

            function i2(e, t) {
                if (e) {
                    if ("string" == typeof e) return iZ(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iZ(e, t)
                }
            }
            iK.displayName = iV;
            var i3 = (0, N.createContext)({
                    size: "Medium",
                    variant: "Contained",
                    fitBehavior: "Fill"
                }),
                i8 = {
                    XSmall: ["text-label-small", "height-700"],
                    Small: ["text-label-small", "height-800"],
                    Medium: ["text-label-medium", "height-1000"],
                    Large: ["text-label-medium", "height-1200"]
                },
                i5 = {
                    XSmall: "padding-x-small",
                    Small: "padding-x-small",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                i4 = {
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
                i6 = {
                    XSmall: "padding-bottom-small",
                    Small: "padding-bottom-small",
                    Medium: "padding-bottom-medium",
                    Large: "padding-bottom-xlarge"
                },
                i7 = (0, N.forwardRef)(function(e, t) {
                    var r = i1([e, t]),
                        n = r[0],
                        o = r.slice(1),
                        a = n.children,
                        i = n.className,
                        l = n.size,
                        c = n.variant,
                        u = n.fitBehavior,
                        s = iQ(n, ["children", "className", "size", "variant", "fitBehavior"]),
                        f = i0(o, 1)[0],
                        p = (0, N.useMemo)(function() {
                            return {
                                size: l || "Large",
                                variant: c || "Contained",
                                fitBehavior: u || "Fill"
                            }
                        }, [l, c, u]);
                    return k().createElement(i3.Provider, {
                        value: p
                    }, k().createElement(iL, iJ(iq({
                        ref: f
                    }, s), {
                        className: re("foundation-web-tabs", "flex flex-col", i)
                    }), a))
                }),
                i9 = (0, N.forwardRef)(function(e, t) {
                    var r = i1([e, t]),
                        n = r[0],
                        o = r.slice(1),
                        a = n.children,
                        i = n.className,
                        l = iQ(n, ["children", "className"]),
                        c = i0(o, 1)[0],
                        u = (0, N.useContext)(i3).fitBehavior,
                        s = (0, N.useRef)(null),
                        f = i0((0, N.useState)({
                            width: 0,
                            left: 0,
                            opacity: 0
                        }), 2),
                        p = f[0],
                        d = f[1],
                        h = k().useCallback(function(e) {
                            s.current = e, "function" == typeof c ? c(e) : c && "current" in c && (c.current = e)
                        }, [c]);
                    return (0, N.useEffect)(function() {
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
                    }, [a]), k().createElement("div", {
                        className: re("relative scroll-x", i),
                        style: {
                            scrollbarWidth: "none",
                            msOverflowStyle: "none"
                        }
                    }, k().createElement(iU, iJ(iq({
                        ref: h
                    }, l), {
                        className: re("flex items-stretch bg-none border-0 stroke-none")
                    }), a), "Fit" === u && k().createElement("div", {
                        "aria-hidden": "true",
                        className: "absolute bottom-[0px] left-[0px] right-[0px] height-[var(--stroke-thick)] bg-[var(--color-stroke-muted)] [z-index:0]"
                    }), k().createElement("div", {
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
                le = (0, N.forwardRef)(function(e, t) {
                    var r = i1([e, t]),
                        n = r[0],
                        o = r.slice(1),
                        a = n.children,
                        i = n.className,
                        l = n.isDisabled,
                        c = void 0 !== l && l,
                        u = iQ(n, ["children", "className", "isDisabled"]),
                        s = i0(o, 1)[0],
                        f = (0, N.useContext)(i3),
                        p = f.size,
                        d = f.variant,
                        h = f.fitBehavior;
                    return k().createElement(iG, iJ(iq({
                        ref: s
                    }, u), {
                        disabled: c,
                        style: {
                            borderBottom: "var(--stroke-thick) solid var(--color-stroke-muted)",
                            borderTop: "none",
                            borderLeft: "none",
                            borderRight: "none"
                        },
                        className: re("relative flex items-center justify-center cursor-pointer bg-none shrink-0", nC, i8[p], "Fill" === h ? "grow-1 ".concat(i5[p]) : "", i4[p][d], i6[p], c && "opacity-[0.5]", i)
                    }), k().createElement(nM, null), k().createElement("div", {
                        className: "flex items-center justify-center height-600 relative"
                    }, a))
                });

            function lt(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lr(e) {
                if (Array.isArray(e)) return e
            }

            function ln() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function lo(e, t) {
                if (e) {
                    if ("string" == typeof e) return lt(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lt(e, t)
                }
            }(0, N.forwardRef)(function(e, t) {
                var r = i1([e, t]),
                    n = r[0],
                    o = r.slice(1),
                    a = n.children,
                    i = n.className,
                    l = iQ(n, ["children", "className"]),
                    c = i0(o, 1)[0];
                return k().createElement(iK, iJ(iq({
                    ref: c
                }, l), {
                    className: re("padding-top-large", "outline-none", i)
                }), a)
            });
            var la = {
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
                li = {
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
                ll = {
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
                lc = {
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
                lu = {
                    Small: "height-600",
                    XSmall: "height-400"
                },
                ls = {
                    Small: "padding-x-small",
                    XSmall: "padding-x-xsmall"
                },
                lf = {
                    Small: "width-600",
                    XSmall: "width-400"
                },
                lp = {
                    Small: "text-label-small",
                    XSmall: "text-caption-small"
                },
                ld = {
                    Small: "padding-y-xsmall",
                    XSmall: "padding-y-none"
                },
                lh = {
                    Small: "XSmall",
                    XSmall: "XSmall"
                },
                lm = {
                    Pill: "radius-circle",
                    Box: "radius-small"
                },
                lb = k().forwardRef(function(e, t) {
                    var r, n, o, a = lr(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || lo(r) || ln(),
                        i = a[0],
                        l = a.slice(1),
                        c = i.className,
                        u = i.label,
                        s = i.variant,
                        f = void 0 === s ? "Standard" : s,
                        p = i.icon,
                        d = i.iconPosition,
                        h = void 0 === d ? "Leading" : d,
                        m = i.size,
                        b = void 0 === m ? "Small" : m,
                        y = i.shape,
                        v = function(e, t) {
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
                        g = (lr(l) || function(e) {
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
                        }(l) || lo(l, 1) || ln())[0],
                        O = p && !u,
                        w = "padding-x-xxsmall";
                    p && (w = "Leading" === h ? "padding-right-xxsmall" : "padding-left-xxsmall");
                    var j = p && k().createElement(nT, {
                        name: p,
                        size: lh[b],
                        className: ll[f]
                    });
                    return k().createElement("div", (n = function(e) {
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
                        className: re("foundation-web-badge flex items-center select-none gap-[var(--size-150)]", lm[void 0 === y ? "Pill" : y], lu[b], O ? [lf[b], "justify-center"] : ["width-[fit-content]", ls[b]], la[f], li[f], lc[f], c)
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(o)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                    }), n), "Leading" === h && j, u && k().createElement("span", {
                        className: re("text-no-wrap text-truncate-split", lp[b], ld[b], w, li[f])
                    }, u), "Trailing" === h && j)
                });
            lb.displayName = "Badge";
            var ly = function(e) {
                    var t = e.activeTab,
                        r = e.tabs,
                        n = e.onSelectTab;
                    return (0, x.jsx)(i7, {
                        value: t,
                        variant: "Contained",
                        size: "Large",
                        fitBehavior: "Fill",
                        className: "radius-none overflow-hidden",
                        onValueChange: function(e) {
                            var t = r.find(function(t) {
                                return t.name === e
                            });
                            t && n(t.name)
                        },
                        children: (0, x.jsx)(i9, {
                            children: r.map(function(e) {
                                return (0, x.jsx)(le, {
                                    value: e.name,
                                    children: (0, x.jsxs)("span", {
                                        className: "flex items-center justify-center gap-small",
                                        children: [(0, x.jsx)("span", {
                                            children: e.label
                                        }), e.count ? (0, x.jsx)(lb, {
                                            label: String(e.count),
                                            variant: "Contrast"
                                        }) : null]
                                    })
                                }, e.name)
                            })
                        })
                    })
                },
                lv = function(e) {
                    var t, r, n, o, a, i = e.translate,
                        l = e.renderThumbnail,
                        c = e.formatListDate,
                        u = e.formatDetailDate,
                        s = nx({
                            translate: i
                        }),
                        f = (null == (n = (0, rl.getDeviceMeta)()) ? void 0 : n.isInApp) === !0,
                        p = s.page ? s.page.pageNumber + 1 : s.route.page,
                        d = null != (t = null == (o = s.page) ? void 0 : o.totalPages) ? t : 1,
                        h = null != (r = null == (a = s.page) ? void 0 : a.collection.length) ? r : 0;
                    return (0, x.jsxs)("main", {
                        className: "private-message-page margin-x-auto padding-medium",
                        children: [f ? null : (0, x.jsx)("h1", {
                            className: "text-heading-large content-emphasis margin-top-none margin-bottom-medium",
                            children: i("Heading.Message")
                        }), (0, x.jsx)(ly, {
                            activeTab: s.route.tab,
                            tabs: s.tabs,
                            onSelectTab: s.openTab
                        }), (0, x.jsx)(aP, {
                            translate: i,
                            activeTab: s.route.tab,
                            moduleState: s.moduleState,
                            selectedCount: s.selectedMessageIds.size,
                            totalCount: h,
                            currentPage: p,
                            totalPages: d,
                            onToggleSelectAll: s.toggleSelectAll,
                            onMarkArchive: function(e) {
                                s.markArchive(e)
                            },
                            onMarkRead: function(e) {
                                s.markRead(e)
                            },
                            onBack: s.backToList,
                            onChangePage: s.changePage
                        }), s.loading ? (0, x.jsx)("div", {
                            className: "flex justify-center padding-xxlarge",
                            children: (0, x.jsx)(ri, {
                                ariaLabel: i("Label.Loading"),
                                variant: "Indeterminate",
                                size: "Medium"
                            })
                        }) : null, !s.loading && s.error ? (0, x.jsx)("div", {
                            className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large text-body-large content-system-alert",
                            children: s.error
                        }) : null, s.loading || s.error || s.moduleState !== rp ? null : s.route.tab === rs ? (0, x.jsx)(aZ, {
                            translate: i,
                            renderThumbnail: l,
                            formatListDate: c,
                            page: s.page
                        }) : (0, x.jsx)(aK, {
                            translate: i,
                            renderThumbnail: l,
                            formatListDate: c,
                            page: s.page,
                            activeTab: s.route.tab,
                            selectedMessageIds: s.selectedMessageIds,
                            onToggleSelection: s.toggleMessageSelection,
                            onOpenMessage: function(e, t) {
                                s.openMessage(e, t)
                            }
                        }), s.loading || s.error || s.moduleState !== rd ? null : (0, x.jsx)(aL, {
                            translate: i,
                            renderThumbnail: l,
                            formatDetailDate: u,
                            message: s.selectedMessage,
                            activeTab: s.route.tab
                        }), (0, x.jsx)(os, {
                            feedback: s.feedback,
                            onClose: s.dismissFeedback
                        })]
                    })
                },
                lg = JSON.parse('{"P":["Feature.Messages","Feature.ProfileBadges"]}').P,
                lO = function(e) {
                    var t = e.userId,
                        r = e.altName;
                    return (0, x.jsx)(t9.Thumbnail2d, {
                        targetId: t,
                        type: t9.ThumbnailTypes.avatarHeadshot,
                        altName: r
                    })
                },
                lw = function() {
                    var e = t7("Feature.Messages"),
                        t = t7("Feature.ProfileBadges");
                    return (0, x.jsx)(lv, {
                        translate: function(r, n) {
                            return e.has(r) ? e(r, n) : t(r, n)
                        },
                        renderThumbnail: lO,
                        formatListDate: rN,
                        formatDetailDate: rk
                    })
                },
                lj = function() {
                    var e;
                    return null != (e = document.getElementById("private-message")) ? e : document.getElementById("private-message-web-app")
                };
            A()(function() {
                var e = lj();
                e && ("private-message-web-app" === e.id && e.classList.add("messages-container"), (0, I.renderWithErrorBoundary)((0, x.jsx)(tf, {
                    namespaces: lg,
                    children: (0, x.jsx)(lw, {})
                }), e))
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("PrivateMessage");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/privateMessage-4b701f79f0a95a89.js.map