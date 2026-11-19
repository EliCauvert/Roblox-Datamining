! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "d1874a4ba39db3ec53b67feae6486d7a2d8fc69d"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "e6e17976-a998-4e01-b404-7bca60f415ec", e._sentryDebugIdIdentifier = "sentry-dbid-e6e17976-a998-4e01-b404-7bca60f415ec")
    } catch (e) {}
}(),
function() {
    var e = {
            844: function(e, t, n) {
                "use strict";

                function r(e) {
                    return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }
                n.r(t), n.d(t, {
                    _: function() {
                        return r
                    }
                })
            },
            611: function(e, t, n) {
                var r = n(844);
                !
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var t = {}.hasOwnProperty;

                    function n() {
                        for (var e = "", i = 0; i < arguments.length; i++) {
                            var o = arguments[i];
                            o && (e = a(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : r._(e)) !== "object") return "";
                                if (Array.isArray(e)) return n.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var i = "";
                                for (var o in e) t.call(e, o) && e[o] && (i = a(i, o));
                                return i
                            }(o)))
                        }
                        return e
                    }

                    function a(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (n.default = n, e.exports = n) : "function" == typeof define && "object" === r._(define.amd) && define.amd ? define("classnames", [], function() {
                        return n
                    }) : window.classNames = n
                }()
            },
            773: function(e, t) {
                "use strict";
                Object.defineProperty(t, "__esModule", {
                    value: !0
                });
                var n, r, a, i = {
                        exports: {}
                    },
                    o = i.exports = {};

                function s() {
                    throw Error("setTimeout has not been defined")
                }

                function l() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    n = "function" == typeof setTimeout ? setTimeout : s
                } catch (e) {
                    n = s
                }
                try {
                    r = "function" == typeof clearTimeout ? clearTimeout : l
                } catch (e) {
                    r = l
                }

                function u(e) {
                    if (n === setTimeout) return setTimeout(e, 0);
                    if ((n === s || !n) && setTimeout) return n = setTimeout, setTimeout(e, 0);
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
                var c = [],
                    d = !1,
                    h = -1;

                function f() {
                    d && a && (d = !1, a.length ? c = a.concat(c) : h = -1, c.length && m())
                }

                function m() {
                    if (!d) {
                        var e = u(f);
                        d = !0;
                        for (var t = c.length; t;) {
                            for (a = c, c = []; ++h < t;) a && a[h].run();
                            h = -1, t = c.length
                        }
                        a = null, d = !1,
                            function(e) {
                                if (r === clearTimeout) return clearTimeout(e);
                                if ((r === l || !r) && clearTimeout) return r = clearTimeout, clearTimeout(e);
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

                function p(e, t) {
                    this.fun = e, this.array = t
                }

                function v() {}

                function g() {}
                o.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var n = 1; n < arguments.length; n++) t[n - 1] = arguments[n];
                    c.push(new p(e, t)), 1 !== c.length || d || u(m)
                }, p.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, o.title = "browser", o.browser = !0, o.env = {}, o.argv = [], o.version = "", o.versions = {}, o.on = v, o.addListener = v, o.once = v, o.off = v, o.removeListener = v, o.removeAllListeners = v, o.emit = v, o.prependListener = v, o.prependOnceListener = v, o.listeners = function(e) {
                    return []
                }, o.binding = function(e) {
                    throw Error("process.binding is not supported")
                }, o.cwd = function() {
                    return "/"
                }, o.chdir = function(e) {
                    throw Error("process.chdir is not supported")
                }, o.umask = function() {
                    return 0
                };
                var b = i.exports.browser,
                    y = i.exports.binding,
                    w = {},
                    x = "browser",
                    E = "browser",
                    S = "browser",
                    N = [],
                    k = {
                        nextTick: i.exports.nextTick,
                        title: i.exports.title,
                        browser: b,
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
                        emitWarning: g,
                        prependListener: i.exports.prependListener,
                        prependOnceListener: i.exports.prependOnceListener,
                        listeners: i.exports.listeners,
                        binding: y,
                        cwd: i.exports.cwd,
                        chdir: i.exports.chdir,
                        umask: i.exports.umask,
                        exit: g,
                        pid: 1,
                        features: w,
                        kill: g,
                        dlopen: g,
                        uptime: g,
                        memoryUsage: g,
                        uvCounters: g,
                        platform: x,
                        arch: E,
                        execPath: S,
                        execArgv: N
                    };
                t.addListener = i.exports.addListener, t.arch = E, t.argv = i.exports.argv, t.binding = y, t.browser = b, t.chdir = i.exports.chdir, t.cwd = i.exports.cwd, t.default = k, t.dlopen = g, t.emit = i.exports.emit, t.emitWarning = g, t.env = i.exports.env, t.execArgv = N, t.execPath = S, t.exit = g, t.features = w, t.kill = g, t.listeners = i.exports.listeners, t.memoryUsage = g, t.nextTick = i.exports.nextTick, t.off = i.exports.off, t.on = i.exports.on, t.once = i.exports.once, t.pid = 1, t.platform = x, t.prependListener = i.exports.prependListener, t.prependOnceListener = i.exports.prependOnceListener, t.removeAllListeners = i.exports.removeAllListeners, t.removeListener = i.exports.removeListener, t.title = i.exports.title, t.umask = i.exports.umask, t.uptime = g, t.uvCounters = g, t.version = i.exports.version, t.versions = i.exports.versions, e.exports = k
            }
        },
        t = {};

    function n(r) {
        var a = t[r];
        if (void 0 !== a) return a.exports;
        var i = t[r] = {
            exports: {}
        };
        return e[r](i, i.exports, n), i.exports
    }
    n.m = e, n.n = function(e) {
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
        }, n.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, n.r = function(e) {
            "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(e, "__esModule", {
                value: !0
            })
        }, n.rv = function() {
            return "1.7.12"
        }, n.ruid = "bundler=rspack@1.7.12",
        function() {
            "use strict";
            var e, t, r, a, i, o, s, l, u, c, d, h, f, m, p, v, g, b, y, w, x, E, S, N, k = window.ReactJSX,
                T = window.Roblox["core-scripts"].util.ready,
                C = n.n(T),
                I = window.Roblox["core-scripts"].react;

            function M(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function A(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        M(e, t, n[t])
                    })
                }
                return e
            }

            function B(e) {
                if (Array.isArray(e)) return e
            }

            function _() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function P(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function H(e, t) {
                if (e) {
                    if ("string" == typeof e) return P(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return P(e, t)
                }
            }

            function L(e, t) {
                return B(e) || function(e, t) {
                    var n, r, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var i = [],
                            o = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(o = (n = a.next()).done) && (i.push(n.value), !t || i.length !== t); o = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                o || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || H(e, t) || _()
            }
            var R = window.React,
                j = n.n(R);

            function O(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, n)
                    }
                    return t
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function D(e) {
                return (D = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function F() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (F = function() {
                    return !!e
                })()
            }
            var U = n(844);

            function z(e, t, n) {
                t = D(t);
                var r = F() ? Reflect.construct(t, n || [], D(e).constructor) : t.apply(e, n);
                if (r && ("object" === (0, U._)(r) || "function" == typeof r)) return r;
                if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                return e
            }

            function V(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function G(e, t) {
                if (!V(e, t)) throw TypeError("Cannot call a class as a function")
            }

            function K(e, t) {
                return (K = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function X(e, t, n) {
                return (X = F() ? Reflect.construct : function(e, t, n) {
                    var r = [null];
                    r.push.apply(r, t);
                    var a = new(Function.bind.apply(e, r));
                    return n && K(a, n.prototype), a
                }).apply(null, arguments)
            }

            function W(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && K(e, t)
            }

            function Z(e) {
                if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
            }

            function Y(e) {
                return function(e) {
                    if (Array.isArray(e)) return P(e)
                }(e) || Z(e) || H(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function q(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (q = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, n)
                    }

                    function n() {
                        return X(e, arguments, D(this).constructor)
                    }
                    return n.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: n,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), K(n, e)
                })(e)
            }

            function J(e, t) {
                for (var n = 0; n < t.length; n++) {
                    var r = t[n];
                    r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                }
            }

            function Q(e, t, n) {
                return t && J(e.prototype, t), n && J(e, n), e
            }

            function $(e, t) {
                var n = t && t.cache ? t.cache : ea,
                    r = t && t.serializer ? t.serializer : en;
                return (t && t.strategy ? t.strategy : function(e, t) {
                    var n, r, a = 1 === e.length ? ee : et;
                    return n = t.cache.create(), r = t.serializer, a.bind(this, e, n, r)
                })(e, {
                    cache: n,
                    serializer: r
                })
            }

            function ee(e, t, n, r) {
                var a = null == r || "number" == typeof r || "boolean" == typeof r ? r : n(r),
                    i = t.get(a);
                return void 0 === i && (i = e.call(this, r), t.set(a, i)), i
            }

            function et(e, t, n) {
                var r = Array.prototype.slice.call(arguments, 3),
                    a = n(r),
                    i = t.get(a);
                return void 0 === i && (i = e.apply(this, r), t.set(a, i)), i
            }
            var en = function() {
                    return JSON.stringify(arguments)
                },
                er = function() {
                    function e() {
                        G(this, e), this.cache = Object.create(null)
                    }
                    return Q(e, [{
                        key: "get",
                        value: function(e) {
                            return this.cache[e]
                        }
                    }, {
                        key: "set",
                        value: function(e, t) {
                            this.cache[e] = t
                        }
                    }]), e
                }(),
                ea = {
                    create: function() {
                        return new er
                    }
                },
                ei = {
                    variadic: function(e, t) {
                        var n, r;
                        return n = t.cache.create(), r = t.serializer, et.bind(this, e, n, r)
                    },
                    monadic: function(e, t) {
                        var n, r;
                        return n = t.cache.create(), r = t.serializer, ee.bind(this, e, n, r)
                    }
                },
                eo = function(e) {
                    function t(e, n) {
                        G(this, t);
                        var r, a = e;
                        return n && (a += ": " + n), (r = z(this, t, [a])).code = e, n && (r.originalMessage = n), r
                    }
                    return W(t, e), t
                }(q(Error)),
                es = ((t = es || {}).MISSING_MESSAGE = "MISSING_MESSAGE", t.MISSING_FORMAT = "MISSING_FORMAT", t.ENVIRONMENT_FALLBACK = "ENVIRONMENT_FALLBACK", t.INSUFFICIENT_PATH = "INSUFFICIENT_PATH", t.INVALID_MESSAGE = "INVALID_MESSAGE", t.INVALID_KEY = "INVALID_KEY", t.FORMATTING_ERROR = "FORMATTING_ERROR", t);

            function el(e, t) {
                return $(e, {
                    cache: {
                        create: function() {
                            return {
                                get: function(e) {
                                    return t[e]
                                },
                                set: function(e, n) {
                                    t[e] = n
                                }
                            }
                        }
                    },
                    strategy: ei.variadic
                })
            }

            function eu(e, t) {
                return el(function() {
                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                    return X(e, Y(n))
                }, t)
            }

            function ec(e, t) {
                if (null == e) return {};
                var n, r, a, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (a = 0, n = Reflect.ownKeys(Object(e)); a < n.length; a++) r = n[a], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var n, r, a = {},
                            i = Object.getOwnPropertyNames(e);
                        for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                        return a
                    }(e, t), Object.getOwnPropertySymbols)
                    for (a = 0, n = Object.getOwnPropertySymbols(e); a < n.length; a++) r = n[a], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                return i
            }

            function ed() {
                return (ed = Object.assign || function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = arguments[t];
                        for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (e[r] = n[r])
                    }
                    return e
                }).apply(this, arguments)
            }

            function eh(e) {
                return B(e) || Z(e) || H(e) || _()
            }
            var ef = /(?:[Eec]{1,6}|G{1,5}|[Qq]{1,5}|(?:[yYur]+|U{1,5})|[ML]{1,5}|d{1,2}|D{1,3}|F{1}|[abB]{1,5}|[hkHK]{1,2}|w{1,2}|W{1}|m{1,2}|s{1,2}|[zZOvVxX]{1,4})(?=([^']*'[^']*')*[^']*$)/g,
                em = /[\t-\r \x85\u200E\u200F\u2028\u2029]/i,
                ep = /^\.(?:(0+)(\*)?|(#+)|(0+)(#+))$/g,
                ev = /^(@+)?(\+|#+)?[rs]?$/g,
                eg = /(\*)(0+)|(#+)(0+)|(0+)/g,
                eb = /^(0+)$/;

            function ey(e) {
                var t = {};
                return "r" === e[e.length - 1] ? t.roundingPriority = "morePrecision" : "s" === e[e.length - 1] && (t.roundingPriority = "lessPrecision"), e.replace(ev, function(e, n, r) {
                    return "string" != typeof r ? (t.minimumSignificantDigits = n.length, t.maximumSignificantDigits = n.length) : "+" === r ? t.minimumSignificantDigits = n.length : "#" === n[0] ? t.maximumSignificantDigits = n.length : (t.minimumSignificantDigits = n.length, t.maximumSignificantDigits = n.length + ("string" == typeof r ? r.length : 0)), ""
                }), t
            }

            function ew(e) {
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

            function ex(e) {
                var t = ew(e);
                return t || {}
            }
            var eE = ((r = {})[r.EXPECT_ARGUMENT_CLOSING_BRACE = 1] = "EXPECT_ARGUMENT_CLOSING_BRACE", r[r.EMPTY_ARGUMENT = 2] = "EMPTY_ARGUMENT", r[r.MALFORMED_ARGUMENT = 3] = "MALFORMED_ARGUMENT", r[r.EXPECT_ARGUMENT_TYPE = 4] = "EXPECT_ARGUMENT_TYPE", r[r.INVALID_ARGUMENT_TYPE = 5] = "INVALID_ARGUMENT_TYPE", r[r.EXPECT_ARGUMENT_STYLE = 6] = "EXPECT_ARGUMENT_STYLE", r[r.INVALID_NUMBER_SKELETON = 7] = "INVALID_NUMBER_SKELETON", r[r.INVALID_DATE_TIME_SKELETON = 8] = "INVALID_DATE_TIME_SKELETON", r[r.EXPECT_NUMBER_SKELETON = 9] = "EXPECT_NUMBER_SKELETON", r[r.EXPECT_DATE_TIME_SKELETON = 10] = "EXPECT_DATE_TIME_SKELETON", r[r.UNCLOSED_QUOTE_IN_ARGUMENT_STYLE = 11] = "UNCLOSED_QUOTE_IN_ARGUMENT_STYLE", r[r.EXPECT_SELECT_ARGUMENT_OPTIONS = 12] = "EXPECT_SELECT_ARGUMENT_OPTIONS", r[r.EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE = 13] = "EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE", r[r.INVALID_PLURAL_ARGUMENT_OFFSET_VALUE = 14] = "INVALID_PLURAL_ARGUMENT_OFFSET_VALUE", r[r.EXPECT_SELECT_ARGUMENT_SELECTOR = 15] = "EXPECT_SELECT_ARGUMENT_SELECTOR", r[r.EXPECT_PLURAL_ARGUMENT_SELECTOR = 16] = "EXPECT_PLURAL_ARGUMENT_SELECTOR", r[r.EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT = 17] = "EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT", r[r.EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT = 18] = "EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT", r[r.INVALID_PLURAL_ARGUMENT_SELECTOR = 19] = "INVALID_PLURAL_ARGUMENT_SELECTOR", r[r.DUPLICATE_PLURAL_ARGUMENT_SELECTOR = 20] = "DUPLICATE_PLURAL_ARGUMENT_SELECTOR", r[r.DUPLICATE_SELECT_ARGUMENT_SELECTOR = 21] = "DUPLICATE_SELECT_ARGUMENT_SELECTOR", r[r.MISSING_OTHER_CLAUSE = 22] = "MISSING_OTHER_CLAUSE", r[r.INVALID_TAG = 23] = "INVALID_TAG", r[r.INVALID_TAG_NAME = 25] = "INVALID_TAG_NAME", r[r.UNMATCHED_CLOSING_TAG = 26] = "UNMATCHED_CLOSING_TAG", r[r.UNCLOSED_TAG = 27] = "UNCLOSED_TAG", r);

            function eS(e) {
                return !!(e && (void 0 === e ? "undefined" : (0, U._)(e)) === "object" && 0 === e.type)
            }

            function eN(e) {
                return !!(e && (void 0 === e ? "undefined" : (0, U._)(e)) === "object" && 1 === e.type)
            }
            var ek = /[ \xA0\u1680\u2000-\u200A\u202F\u205F\u3000]/,
                eT = {
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
                eC = new RegExp("^".concat(ek.source, "*")),
                eI = new RegExp("".concat(ek.source, "*$"));

            function eM(e, t) {
                return {
                    start: e,
                    end: t
                }
            }
            var eA = !!Object.fromEntries,
                eB = !!String.prototype.trimStart,
                e_ = !!String.prototype.trimEnd,
                eP = eA ? Object.fromEntries : function(e) {
                    var t = {},
                        n = !0,
                        r = !1,
                        a = void 0;
                    try {
                        for (var i, o = e[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                            var s = L(i.value, 2),
                                l = s[0],
                                u = s[1];
                            t[l] = u
                        }
                    } catch (e) {
                        r = !0, a = e
                    } finally {
                        try {
                            n || null == o.return || o.return()
                        } finally {
                            if (r) throw a
                        }
                    }
                    return t
                },
                eH = eB ? function(e) {
                    return e.trimStart()
                } : function(e) {
                    return e.replace(eC, "")
                },
                eL = e_ ? function(e) {
                    return e.trimEnd()
                } : function(e) {
                    return e.replace(eI, "")
                },
                eR = RegExp("([^\\u0009-\\u000D\\u0020\\u0085\\u00A0\\u1680\\u2000-\\u200A\\u2028-\\u2029\\u202F\\u205F\\u3000\\u0021-\\u002F\\u003A-\\u0040\\u005B-\\u005E\\u0060\\u007B-\\u007E\\u00A1-\\u00A7\\u00A9\\u00AB-\\u00AC\\u00AE\\u00B0-\\u00B1\\u00B6\\u00BB\\u00BF\\u00D7\\u00F7\\u2010-\\u2027\\u2030-\\u203E\\u2041-\\u2053\\u2055-\\u205E\\u2190-\\u245F\\u2500-\\u2775\\u2794-\\u2BFF\\u2E00-\\u2E7F\\u3001-\\u3003\\u3008-\\u3020\\u3030\\uFD3E-\\uFD3F\\uFE45-\\uFE46]*)", "yu"),
                ej = function() {
                    function e(t) {
                        var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                        G(this, e), this.message = t, this.position = {
                            offset: 0,
                            line: 1,
                            column: 1
                        }, this.ignoreTag = !!n.ignoreTag, this.locale = n.locale, this.requiresOtherClause = !!n.requiresOtherClause, this.shouldParseSkeletons = !!n.shouldParseSkeletons
                    }
                    return Q(e, [{
                        key: "parse",
                        value: function() {
                            if (0 !== this.offset()) throw Error("parser can only be used once");
                            if (this.message.length > 0) {
                                var e = this.message.charCodeAt(0);
                                if (35 !== e && 39 !== e && 60 !== e && 123 !== e && 125 !== e) {
                                    var t = function(e) {
                                        if (0 === e.length) return null;
                                        for (var t = 1, n = 1, r = 0; r < e.length;) {
                                            var a = e.charCodeAt(r);
                                            switch (a) {
                                                case 35:
                                                case 39:
                                                case 60:
                                                case 123:
                                                case 125:
                                                    return null
                                            }
                                            if (10 === a) t++, n = 1, r++;
                                            else if (n++, a >= 55296 && a <= 56319 && r + 1 < e.length) {
                                                var i = e.charCodeAt(r + 1);
                                                r += i >= 56320 && i <= 57343 ? 2 : 1
                                            } else r++
                                        }
                                        return {
                                            offset: e.length,
                                            line: t,
                                            column: n
                                        }
                                    }(this.message);
                                    if (t) {
                                        var n = this.clonePosition();
                                        return this.position = t, {
                                            val: [{
                                                type: 0,
                                                value: this.message,
                                                location: eM(n, this.clonePosition())
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
                        value: function(e, t, n) {
                            for (var r = []; !this.isEOF();) {
                                var a = this.char();
                                if (123 === a) {
                                    var i = this.parseArgument(e, n);
                                    if (i.err) return i;
                                    r.push(i.val)
                                } else if (125 === a && e > 0) break;
                                else if (35 === a && ("plural" === t || "selectordinal" === t)) {
                                    var o = this.clonePosition();
                                    this.bump(), r.push({
                                        type: 7,
                                        location: eM(o, this.clonePosition())
                                    })
                                } else if (60 !== a || this.ignoreTag || 47 !== this.peek())
                                    if (60 === a && !this.ignoreTag && eO(this.peek() || 0)) {
                                        var s = this.parseTag(e, t);
                                        if (s.err) return s;
                                        r.push(s.val)
                                    } else {
                                        var l = this.parseLiteral(e, t);
                                        if (l.err) return l;
                                        r.push(l.val)
                                    }
                                else if (!n) return this.error(26, eM(this.clonePosition(), this.clonePosition()));
                                else break
                            }
                            return {
                                val: r,
                                err: null
                            }
                        }
                    }, {
                        key: "parseTag",
                        value: function(e, t) {
                            var n = this.clonePosition();
                            this.bump();
                            var r = this.parseTagName();
                            if (this.bumpSpace(), this.bumpIf("/>")) return {
                                val: {
                                    type: 0,
                                    value: "<".concat(r, "/>"),
                                    location: eM(n, this.clonePosition())
                                },
                                err: null
                            };
                            if (!this.bumpIf(">")) return this.error(23, eM(n, this.clonePosition()));
                            var a = this.parseMessage(e + 1, t, !0);
                            if (a.err) return a;
                            var i = a.val,
                                o = this.clonePosition();
                            if (!this.bumpIf("</")) return this.error(27, eM(n, this.clonePosition()));
                            if (this.isEOF() || !eO(this.char())) return this.error(23, eM(o, this.clonePosition()));
                            var s = this.clonePosition();
                            return r !== this.parseTagName() ? this.error(26, eM(s, this.clonePosition())) : (this.bumpSpace(), this.bumpIf(">")) ? {
                                val: {
                                    type: 8,
                                    value: r,
                                    children: i,
                                    location: eM(n, this.clonePosition())
                                },
                                err: null
                            } : this.error(23, eM(o, this.clonePosition()))
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
                            for (var n = this.clonePosition(), r = "";;) {
                                var a = this.tryParseQuote(t);
                                if (a) {
                                    r += a;
                                    continue
                                }
                                var i = this.tryParseUnquoted(e, t);
                                if (i) {
                                    r += i;
                                    continue
                                }
                                var o = this.tryParseLeftAngleBracket();
                                if (o) {
                                    r += o;
                                    continue
                                }
                                break
                            }
                            return {
                                val: {
                                    type: 0,
                                    value: r,
                                    location: eM(n, this.clonePosition())
                                },
                                err: null
                            }
                        }
                    }, {
                        key: "tryParseLeftAngleBracket",
                        value: function() {
                            var e;
                            return this.isEOF() || 60 !== this.char() || !this.ignoreTag && (eO(e = this.peek() || 0) || 47 === e) ? null : (this.bump(), "<")
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
                            var t, n = [this.char()];
                            for (this.bump(); !this.isEOF();) {
                                var r = this.char();
                                if (39 === r)
                                    if (39 === this.peek()) n.push(39), this.bump();
                                    else {
                                        this.bump();
                                        break
                                    }
                                else n.push(r);
                                this.bump()
                            }
                            return (t = String).fromCodePoint.apply(t, Y(n))
                        }
                    }, {
                        key: "tryParseUnquoted",
                        value: function(e, t) {
                            if (this.isEOF()) return null;
                            var n = this.char();
                            return 60 === n || 123 === n || 35 === n && ("plural" === t || "selectordinal" === t) || 125 === n && e > 0 ? null : (this.bump(), String.fromCodePoint(n))
                        }
                    }, {
                        key: "parseArgument",
                        value: function(e, t) {
                            var n = this.clonePosition();
                            if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, eM(n, this.clonePosition()));
                            if (125 === this.char()) return this.bump(), this.error(2, eM(n, this.clonePosition()));
                            var r = this.parseIdentifierIfPossible().value;
                            if (!r) return this.error(3, eM(n, this.clonePosition()));
                            if (this.bumpSpace(), this.isEOF()) return this.error(1, eM(n, this.clonePosition()));
                            switch (this.char()) {
                                case 125:
                                    return this.bump(), {
                                        val: {
                                            type: 1,
                                            value: r,
                                            location: eM(n, this.clonePosition())
                                        },
                                        err: null
                                    };
                                case 44:
                                    if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, eM(n, this.clonePosition()));
                                    return this.parseArgumentOptions(e, t, r, n);
                                default:
                                    return this.error(3, eM(n, this.clonePosition()))
                            }
                        }
                    }, {
                        key: "parseIdentifierIfPossible",
                        value: function() {
                            var e, t, n = this.clonePosition(),
                                r = this.offset(),
                                a = (e = this.message, eR.lastIndex = r, null != (t = eR.exec(e)[1]) ? t : ""),
                                i = r + a.length;
                            return this.bumpTo(i), {
                                value: a,
                                location: eM(n, this.clonePosition())
                            }
                        }
                    }, {
                        key: "parseArgumentOptions",
                        value: function(e, t, n, r) {
                            var a = this.clonePosition(),
                                i = this.parseIdentifierIfPossible().value,
                                o = this.clonePosition();
                            switch (i) {
                                case "":
                                    return this.error(4, eM(a, o));
                                case "number":
                                case "date":
                                case "time":
                                    this.bumpSpace();
                                    var s, l = null;
                                    if (this.bumpIf(",")) {
                                        this.bumpSpace();
                                        var u = this.clonePosition(),
                                            c = this.parseSimpleArgStyleIfPossible();
                                        if (c.err) return c;
                                        var d = eL(c.val);
                                        if (0 === d.length) return this.error(6, eM(this.clonePosition(), this.clonePosition()));
                                        l = {
                                            style: d,
                                            styleLocation: eM(u, this.clonePosition())
                                        }
                                    }
                                    var h = this.tryParseArgumentClose(r);
                                    if (h.err) return h;
                                    var f = eM(r, this.clonePosition());
                                    if (l && l.style.startsWith("::")) {
                                        var m = eH(l.style.slice(2));
                                        if ("number" === i) {
                                            var p = this.parseNumberSkeletonFromString(m, l.styleLocation);
                                            if (p.err) return p;
                                            return {
                                                val: {
                                                    type: 2,
                                                    value: n,
                                                    location: f,
                                                    style: p.val
                                                },
                                                err: null
                                            }
                                        }
                                        if (0 === m.length) return this.error(10, f);
                                        var v, g = m;
                                        return this.locale && (g = function(e, t) {
                                            for (var n = "", r = 0; r < e.length; r++) {
                                                var a = e.charAt(r);
                                                if ("j" === a) {
                                                    for (var i = 0; r + 1 < e.length && e.charAt(r + 1) === a;) i++, r++;
                                                    var o = 1 + (1 & i),
                                                        s = i < 2 ? 1 : 3 + (i >> 1),
                                                        l = function(e) {
                                                            var t, n = e.hourCycle;
                                                            if (void 0 === n && e.hourCycles && e.hourCycles.length && (n = e.hourCycles[0]), n) switch (n) {
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
                                                            var r = e.language;
                                                            return "root" !== r && (t = e.maximize().region), (eT[t || ""] || eT[r || ""] || eT["".concat(r, "-001")] || eT["001"])[0]
                                                        }(t);
                                                    for (("H" == l || "k" == l) && (s = 0); s-- > 0;) n += "a";
                                                    for (; o-- > 0;) n = l + n
                                                } else "J" === a ? n += "H" : n += a
                                            }
                                            return n
                                        }(m, this.locale)), {
                                            val: {
                                                type: "date" === i ? 3 : 4,
                                                value: n,
                                                location: f,
                                                style: {
                                                    type: 1,
                                                    pattern: g,
                                                    location: l.styleLocation,
                                                    parsedOptions: this.shouldParseSkeletons ? (v = {}, g.replace(ef, function(e) {
                                                        var t = e.length;
                                                        switch (e[0]) {
                                                            case "G":
                                                                v.era = 4 === t ? "long" : 5 === t ? "narrow" : "short";
                                                                break;
                                                            case "y":
                                                                v.year = 2 === t ? "2-digit" : "numeric";
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
                                                                v.month = ["numeric", "2-digit", "short", "long", "narrow"][t - 1];
                                                                break;
                                                            case "w":
                                                            case "W":
                                                                throw RangeError("`w/W` (week) patterns are not supported");
                                                            case "d":
                                                                v.day = ["numeric", "2-digit"][t - 1];
                                                                break;
                                                            case "D":
                                                            case "F":
                                                            case "g":
                                                                throw RangeError("`D/F/g` (day) patterns are not supported, use `d` instead");
                                                            case "E":
                                                                v.weekday = 4 === t ? "long" : 5 === t ? "narrow" : "short";
                                                                break;
                                                            case "e":
                                                                if (t < 4) throw RangeError("`e..eee` (weekday) patterns are not supported");
                                                                v.weekday = ["short", "long", "narrow", "short"][t - 4];
                                                                break;
                                                            case "c":
                                                                if (t < 4) throw RangeError("`c..ccc` (weekday) patterns are not supported");
                                                                v.weekday = ["short", "long", "narrow", "short"][t - 4];
                                                                break;
                                                            case "a":
                                                                v.hour12 = !0;
                                                                break;
                                                            case "b":
                                                            case "B":
                                                                throw RangeError("`b/B` (period) patterns are not supported, use `a` instead");
                                                            case "h":
                                                                v.hourCycle = "h12", v.hour = ["numeric", "2-digit"][t - 1];
                                                                break;
                                                            case "H":
                                                                v.hourCycle = "h23", v.hour = ["numeric", "2-digit"][t - 1];
                                                                break;
                                                            case "K":
                                                                v.hourCycle = "h11", v.hour = ["numeric", "2-digit"][t - 1];
                                                                break;
                                                            case "k":
                                                                v.hourCycle = "h24", v.hour = ["numeric", "2-digit"][t - 1];
                                                                break;
                                                            case "j":
                                                            case "J":
                                                            case "C":
                                                                throw RangeError("`j/J/C` (hour) patterns are not supported, use `h/H/K/k` instead");
                                                            case "m":
                                                                v.minute = ["numeric", "2-digit"][t - 1];
                                                                break;
                                                            case "s":
                                                                v.second = ["numeric", "2-digit"][t - 1];
                                                                break;
                                                            case "S":
                                                            case "A":
                                                                throw RangeError("`S/A` (second) patterns are not supported, use `s` instead");
                                                            case "z":
                                                                v.timeZoneName = t < 4 ? "short" : "long";
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
                                                    }), v) : {}
                                                }
                                            },
                                            err: null
                                        }
                                    }
                                    return {
                                        val: {
                                            type: "number" === i ? 2 : "date" === i ? 3 : 4,
                                            value: n,
                                            location: f,
                                            style: null != (s = null == l ? void 0 : l.style) ? s : null
                                        }, err: null
                                    };
                                case "plural":
                                case "selectordinal":
                                case "select":
                                    var b = this.clonePosition();
                                    if (this.bumpSpace(), !this.bumpIf(",")) return this.error(12, eM(b, A({}, b)));
                                    this.bumpSpace();
                                    var y = this.parseIdentifierIfPossible(),
                                        w = 0;
                                    if ("select" !== i && "offset" === y.value) {
                                        if (!this.bumpIf(":")) return this.error(13, eM(this.clonePosition(), this.clonePosition()));
                                        this.bumpSpace();
                                        var x = this.tryParseDecimalInteger(13, 14);
                                        if (x.err) return x;
                                        this.bumpSpace(), y = this.parseIdentifierIfPossible(), w = x.val
                                    }
                                    var E = this.tryParsePluralOrSelectOptions(e, i, t, y);
                                    if (E.err) return E;
                                    var S = this.tryParseArgumentClose(r);
                                    if (S.err) return S;
                                    var N = eM(r, this.clonePosition());
                                    if ("select" === i) return {
                                        val: {
                                            type: 5,
                                            value: n,
                                            options: eP(E.val),
                                            location: N
                                        },
                                        err: null
                                    };
                                    return {
                                        val: {
                                            type: 6,
                                            value: n,
                                            options: eP(E.val),
                                            offset: w,
                                            pluralType: "plural" === i ? "cardinal" : "ordinal",
                                            location: N
                                        }, err: null
                                    };
                                default:
                                    return this.error(5, eM(a, o))
                            }
                        }
                    }, {
                        key: "tryParseArgumentClose",
                        value: function(e) {
                            return this.isEOF() || 125 !== this.char() ? this.error(1, eM(e, this.clonePosition())) : (this.bump(), {
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
                                    var n = this.clonePosition();
                                    if (!this.bumpUntil("'")) return this.error(11, eM(n, this.clonePosition()));
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
                            var n = [];
                            try {
                                n = function(e) {
                                    if (0 === e.length) throw Error("Number skeleton cannot be empty");
                                    var t = e.split(em).filter(function(e) {
                                            return e.length > 0
                                        }),
                                        n = [],
                                        r = !0,
                                        a = !1,
                                        i = void 0;
                                    try {
                                        for (var o, s = t[Symbol.iterator](); !(r = (o = s.next()).done); r = !0) {
                                            var l = o.value.split("/");
                                            if (0 === l.length) throw Error("Invalid number skeleton");
                                            var u = eh(l),
                                                c = u[0],
                                                d = u.slice(1),
                                                h = !0,
                                                f = !1,
                                                m = void 0;
                                            try {
                                                for (var p, v = d[Symbol.iterator](); !(h = (p = v.next()).done); h = !0) {
                                                    var g = p.value;
                                                    if (0 === g.length) throw Error("Invalid number skeleton")
                                                }
                                            } catch (e) {
                                                f = !0, m = e
                                            } finally {
                                                try {
                                                    h || null == v.return || v.return()
                                                } finally {
                                                    if (f) throw m
                                                }
                                            }
                                            n.push({
                                                stem: c,
                                                options: d
                                            })
                                        }
                                    } catch (e) {
                                        a = !0, i = e
                                    } finally {
                                        try {
                                            r || null == s.return || s.return()
                                        } finally {
                                            if (a) throw i
                                        }
                                    }
                                    return n
                                }(e)
                            } catch (e) {
                                return this.error(7, t)
                            }
                            return {
                                val: {
                                    type: 0,
                                    tokens: n,
                                    location: t,
                                    parsedOptions: this.shouldParseSkeletons ? function(e) {
                                        var t = {},
                                            n = !0,
                                            r = !1,
                                            a = void 0;
                                        try {
                                            for (var i, o = e[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                                                var s = i.value;
                                                switch (s.stem) {
                                                    case "percent":
                                                    case "%":
                                                        t.style = "percent";
                                                        continue;
                                                    case "%x100":
                                                        t.style = "percent", t.scale = 100;
                                                        continue;
                                                    case "currency":
                                                        t.style = "currency", t.currency = s.options[0];
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
                                                        t.style = "unit", t.unit = s.options[0].replace(/^(.*?)-/, "");
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
                                                        t = A(O(A({}, t), {
                                                            notation: "scientific"
                                                        }), s.options.reduce(function(e, t) {
                                                            return A({}, e, ex(t))
                                                        }, {}));
                                                        continue;
                                                    case "engineering":
                                                        t = A(O(A({}, t), {
                                                            notation: "engineering"
                                                        }), s.options.reduce(function(e, t) {
                                                            return A({}, e, ex(t))
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
                                                        t.scale = parseFloat(s.options[0]);
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
                                                        if (s.options.length > 1) throw RangeError("integer-width stems only accept a single optional option");
                                                        s.options[0].replace(eg, function(e, n, r, a, i, o) {
                                                            if (n) t.minimumIntegerDigits = r.length;
                                                            else if (a && i) throw Error("We currently do not support maximum integer digits");
                                                            else if (o) throw Error("We currently do not support exact integer digits");
                                                            return ""
                                                        });
                                                        continue
                                                }
                                                if (eb.test(s.stem)) {
                                                    t.minimumIntegerDigits = s.stem.length;
                                                    continue
                                                }
                                                if (ep.test(s.stem)) {
                                                    if (s.options.length > 1) throw RangeError("Fraction-precision stems only accept a single optional option");
                                                    s.stem.replace(ep, function(e, n, r, a, i, o) {
                                                        return "*" === r ? t.minimumFractionDigits = n.length : a && "#" === a[0] ? t.maximumFractionDigits = a.length : i && o ? (t.minimumFractionDigits = i.length, t.maximumFractionDigits = i.length + o.length) : (t.minimumFractionDigits = n.length, t.maximumFractionDigits = n.length), ""
                                                    });
                                                    var l = s.options[0];
                                                    "w" === l ? t = O(A({}, t), {
                                                        trailingZeroDisplay: "stripIfInteger"
                                                    }) : l && (t = A({}, t, ey(l)));
                                                    continue
                                                }
                                                if (ev.test(s.stem)) {
                                                    t = A({}, t, ey(s.stem));
                                                    continue
                                                }
                                                var u = ew(s.stem);
                                                u && (t = A({}, t, u));
                                                var c = function(e) {
                                                    var t;
                                                    if ("E" === e[0] && "E" === e[1] ? (t = {
                                                            notation: "engineering"
                                                        }, e = e.slice(2)) : "E" === e[0] && (t = {
                                                            notation: "scientific"
                                                        }, e = e.slice(1)), t) {
                                                        var n = e.slice(0, 2);
                                                        if ("+!" === n ? (t.signDisplay = "always", e = e.slice(2)) : "+?" === n && (t.signDisplay = "exceptZero", e = e.slice(2)), !eb.test(e)) throw Error("Malformed concise eng/scientific notation");
                                                        t.minimumIntegerDigits = e.length
                                                    }
                                                    return t
                                                }(s.stem);
                                                c && (t = A({}, t, c))
                                            }
                                        } catch (e) {
                                            r = !0, a = e
                                        } finally {
                                            try {
                                                n || null == o.return || o.return()
                                            } finally {
                                                if (r) throw a
                                            }
                                        }
                                        return t
                                    }(n) : {}
                                },
                                err: null
                            }
                        }
                    }, {
                        key: "tryParsePluralOrSelectOptions",
                        value: function(e, t, n, r) {
                            for (var a = !1, i = [], o = new Set, s = r.value, l = r.location;;) {
                                if (0 === s.length) {
                                    var u, c = this.clonePosition();
                                    if ("select" !== t && this.bumpIf("=")) {
                                        var d = this.tryParseDecimalInteger(16, 19);
                                        if (d.err) return d;
                                        l = eM(c, this.clonePosition()), s = this.message.slice(c.offset, this.offset())
                                    } else break
                                }
                                if (o.has(s)) return this.error("select" === t ? 21 : 20, l);
                                "other" === s && (a = !0), this.bumpSpace();
                                var h = this.clonePosition();
                                if (!this.bumpIf("{")) return this.error("select" === t ? 17 : 18, eM(this.clonePosition(), this.clonePosition()));
                                var f = this.parseMessage(e + 1, t, n);
                                if (f.err) return f;
                                var m = this.tryParseArgumentClose(h);
                                if (m.err) return m;
                                i.push([s, {
                                    value: f.val,
                                    location: eM(h, this.clonePosition())
                                }]), o.add(s), this.bumpSpace(), s = (u = this.parseIdentifierIfPossible()).value, l = u.location
                            }
                            return 0 === i.length ? this.error("select" === t ? 15 : 16, eM(this.clonePosition(), this.clonePosition())) : this.requiresOtherClause && !a ? this.error(22, eM(this.clonePosition(), this.clonePosition())) : {
                                val: i,
                                err: null
                            }
                        }
                    }, {
                        key: "tryParseDecimalInteger",
                        value: function(e, t) {
                            var n = 1,
                                r = this.clonePosition();
                            this.bumpIf("+") || this.bumpIf("-") && (n = -1);
                            for (var a = !1, i = 0; !this.isEOF();) {
                                var o = this.char();
                                if (o >= 48 && o <= 57) a = !0, i = 10 * i + (o - 48), this.bump();
                                else break
                            }
                            var s = eM(r, this.clonePosition());
                            return a ? Number.isSafeInteger(i *= n) ? {
                                val: i,
                                err: null
                            } : this.error(t, s) : this.error(e, s)
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
                                n = this.message.indexOf(e, t);
                            return n >= 0 ? (this.bumpTo(n), !0) : (this.bumpTo(this.message.length), !1)
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
                                n = this.offset();
                            return null != (e = this.message.charCodeAt(n + (t >= 65536 ? 2 : 1))) ? e : null
                        }
                    }]), e
                }();

            function eO(e) {
                return e >= 97 && e <= 122 || e >= 65 && e <= 90
            }
            var eD = function(e) {
                    function t(e, n, r) {
                        var a;
                        return G(this, t), (a = z(this, t, [e])).code = n, a.originalMessage = r, a
                    }
                    return W(t, e), Q(t, [{
                        key: "toString",
                        value: function() {
                            return "[formatjs Error: ".concat(this.code, "] ").concat(this.message)
                        }
                    }]), t
                }(q(Error)),
                eF = function(e) {
                    function t(e, n, r, a) {
                        return G(this, t), z(this, t, ['Invalid values for "'.concat(e, '": "').concat(n, '". Options are "').concat(Object.keys(r).join('", "'), '"'), "INVALID_VALUE", a])
                    }
                    return W(t, e), t
                }(eD),
                eU = function(e) {
                    function t(e, n, r) {
                        return G(this, t), z(this, t, ['Value for "'.concat(e, '" must be of type ').concat(n), "INVALID_VALUE", r])
                    }
                    return W(t, e), t
                }(eD),
                ez = function(e) {
                    function t(e, n) {
                        return G(this, t), z(this, t, ['The intl string context variable "'.concat(e, '" was not provided to the string "').concat(n, '"'), "MISSING_VALUE", n])
                    }
                    return W(t, e), t
                }(eD);

            function eV(e) {
                return {
                    create: function() {
                        return {
                            get: function(t) {
                                return e[t]
                            },
                            set: function(t, n) {
                                e[t] = n
                            }
                        }
                    }
                }
            }
            var eG = ((x = function() {
                function e(t) {
                    var n, r = this,
                        a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e.defaultLocale,
                        i = arguments.length > 2 ? arguments[2] : void 0,
                        o = arguments.length > 3 ? arguments[3] : void 0;
                    if (G(this, e), this.formatterCache = {
                            number: {},
                            dateTime: {},
                            pluralRules: {}
                        }, this.format = function(e) {
                            var t = r.formatToParts(e);
                            if (1 === t.length) return t[0].value;
                            var n = t.reduce(function(e, t) {
                                return e.length && 0 === t.type && "string" == typeof e[e.length - 1] ? e[e.length - 1] += t.value : e.push(t.value), e
                            }, []);
                            return n.length <= 1 ? n[0] || "" : n
                        }, this.formatToParts = function(e) {
                            return function e(t, n, r, a, i, o, s) {
                                if (1 === t.length && 0 === t[0].type) return [{
                                    type: 0,
                                    value: t[0].value
                                }];
                                var l = [],
                                    u = !0,
                                    c = !1,
                                    d = void 0;
                                try {
                                    for (var h, f = t[Symbol.iterator](); !(u = (h = f.next()).done); u = !0) {
                                        var m = h.value;
                                        if (0 === m.type) {
                                            l.push({
                                                type: 0,
                                                value: m.value
                                            });
                                            continue
                                        }
                                        if (7 === m.type) {
                                            "number" == typeof o && l.push({
                                                type: 0,
                                                value: r.getNumberFormat(n).format(o)
                                            });
                                            continue
                                        }
                                        var p = m.value;
                                        if (!(i && p in i)) throw new ez(p, s);
                                        var v = i[p];
                                        if (1 === m.type) {
                                            v && "string" != typeof v && "number" != typeof v && (void 0 === v ? "undefined" : (0, U._)(v)) !== "bigint" || (v = "string" == typeof v || "number" == typeof v || (void 0 === v ? "undefined" : (0, U._)(v)) === "bigint" ? String(v) : ""), l.push({
                                                type: +("string" != typeof v),
                                                value: v
                                            });
                                            continue
                                        }
                                        if (3 === m.type) {
                                            var g = "string" == typeof m.style ? a.date[m.style] : eN(m.style) ? m.style.parsedOptions : void 0;
                                            l.push({
                                                type: 0,
                                                value: r.getDateTimeFormat(n, g).format(v)
                                            });
                                            continue
                                        }
                                        if (4 === m.type) {
                                            var b = "string" == typeof m.style ? a.time[m.style] : eN(m.style) ? m.style.parsedOptions : a.time.medium;
                                            l.push({
                                                type: 0,
                                                value: r.getDateTimeFormat(n, b).format(v)
                                            });
                                            continue
                                        }
                                        if (2 === m.type) {
                                            var y = "string" == typeof m.style ? a.number[m.style] : eS(m.style) ? m.style.parsedOptions : void 0;
                                            if (y && y.scale) {
                                                var w = y.scale || 1;
                                                if ((void 0 === v ? "undefined" : (0, U._)(v)) === "bigint") {
                                                    if (!Number.isInteger(w)) throw TypeError("Cannot apply fractional scale ".concat(w, " to bigint value. Scale must be an integer when formatting bigint."));
                                                    v *= BigInt(w)
                                                } else v *= w
                                            }
                                            l.push({
                                                type: 0,
                                                value: r.getNumberFormat(n, y).format(v)
                                            });
                                            continue
                                        }
                                        if (8 === m.type) {
                                            var x = m.children,
                                                E = m.value,
                                                S = i[E];
                                            if ("function" != typeof S) throw new eU(E, "function", s);
                                            var N = S(e(x, n, r, a, i, o).map(function(e) {
                                                return e.value
                                            }));
                                            Array.isArray(N) || (N = [N]), l.push.apply(l, Y(N.map(function(e) {
                                                return {
                                                    type: +("string" != typeof e),
                                                    value: e
                                                }
                                            })))
                                        }
                                        if (5 === m.type) {
                                            var k = v,
                                                T = (Object.prototype.hasOwnProperty.call(m.options, k) ? m.options[k] : void 0) || m.options.other;
                                            if (!T) throw new eF(m.value, v, Object.keys(m.options), s);
                                            l.push.apply(l, Y(e(T.value, n, r, a, i)));
                                            continue
                                        }
                                        if (6 === m.type) {
                                            var C = "=".concat(v),
                                                I = Object.prototype.hasOwnProperty.call(m.options, C) ? m.options[C] : void 0;
                                            if (!I) {
                                                if (!Intl.PluralRules) throw new eD('Intl.PluralRules is not available in this environment.\nTry polyfilling it using "@formatjs/intl-pluralrules"\n', "MISSING_INTL_API", s);
                                                var M = (void 0 === v ? "undefined" : (0, U._)(v)) === "bigint" ? Number(v) : v,
                                                    A = r.getPluralRules(n, {
                                                        type: m.pluralType
                                                    }).select(M - (m.offset || 0));
                                                I = (Object.prototype.hasOwnProperty.call(m.options, A) ? m.options[A] : void 0) || m.options.other
                                            }
                                            if (!I) throw new eF(m.value, v, Object.keys(m.options), s);
                                            var B = (void 0 === v ? "undefined" : (0, U._)(v)) === "bigint" ? Number(v) : v;
                                            l.push.apply(l, Y(e(I.value, n, r, a, i, B - (m.offset || 0))));
                                            continue
                                        }
                                    }
                                } catch (e) {
                                    c = !0, d = e
                                } finally {
                                    try {
                                        u || null == f.return || f.return()
                                    } finally {
                                        if (c) throw d
                                    }
                                }
                                return l.length < 2 ? l : l.reduce(function(e, t) {
                                    var n = e[e.length - 1];
                                    return n && 0 === n.type && 0 === t.type ? n.value += t.value : e.push(t), e
                                }, [])
                            }(r.ast, r.locales, r.formatters, r.formats, e, void 0, r.message)
                        }, this.resolvedOptions = function() {
                            var e;
                            return {
                                locale: (null == (e = r.resolvedLocale) ? void 0 : e.toString()) || Intl.NumberFormat.supportedLocalesOf(r.locales)[0]
                            }
                        }, this.getAst = function() {
                            return r.ast
                        }, this.locales = a, this.resolvedLocale = e.resolveLocale(a), "string" == typeof t) {
                        if (this.message = t, !e.__parse) throw TypeError("IntlMessageFormat.__parse must be set to process `message` of type `string`");
                        var s = o || {},
                            l = (function(e) {
                                if (null == e) throw TypeError("Cannot destructure " + e)
                            }(s), ed({}, s));
                        this.ast = e.__parse(t, O(A({}, l), {
                            locale: this.resolvedLocale
                        }))
                    } else this.ast = t;
                    if (!Array.isArray(this.ast)) throw TypeError("A message must be provided as a String or AST.");
                    this.formats = (n = e.formats, i ? Object.keys(n).reduce(function(e, t) {
                        var r, a;
                        return e[t] = (r = n[t], (a = i[t]) ? A({}, r, a, Object.keys(r).reduce(function(e, t) {
                            return e[t] = A({}, r[t], a[t]), e
                        }, {})) : r), e
                    }, A({}, n)) : n), this.formatters = o && o.formatters || function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                            number: {},
                            dateTime: {},
                            pluralRules: {}
                        };
                        return {
                            getNumberFormat: $(function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return X(Intl.NumberFormat, Y(t))
                            }, {
                                cache: eV(e.number),
                                strategy: ei.variadic
                            }),
                            getDateTimeFormat: $(function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return X(Intl.DateTimeFormat, Y(t))
                            }, {
                                cache: eV(e.dateTime),
                                strategy: ei.variadic
                            }),
                            getPluralRules: $(function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return X(Intl.PluralRules, Y(t))
                            }, {
                                cache: eV(e.pluralRules),
                                strategy: ei.variadic
                            })
                        }
                    }(this.formatterCache)
                }
                return Q(e, null, [{
                    key: "defaultLocale",
                    get: function() {
                        return e.memoizedDefaultLocale || (e.memoizedDefaultLocale = new Intl.NumberFormat().resolvedOptions().locale), e.memoizedDefaultLocale
                    }
                }]), e
            }()).memoizedDefaultLocale = null, x.resolveLocale = function(e) {
                if (void 0 !== Intl.Locale) {
                    var t = Intl.NumberFormat.supportedLocalesOf(e);
                    return new Intl.Locale(t.length > 0 ? t[0] : "string" == typeof e ? e : e[0])
                }
            }, x.__parse = function(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = new ej(e, t = A({
                        shouldParseSkeletons: !0,
                        requiresOtherClause: !0
                    }, t)).parse();
                if (n.err) {
                    var r = SyntaxError(eE[n.err.kind]);
                    throw r.location = n.err.location, r.originalMessage = n.err.message, r
                }
                return (null == t ? void 0 : t.captureLocation) || function e(t) {
                    t.forEach(function(t) {
                        if (delete t.location, 5 === t.type || 6 === t.type)
                            for (var n in t.options) delete t.options[n].location, e(t.options[n].value);
                        else 2 === t.type && eS(t.style) || (3 === t.type || 4 === t.type) && eN(t.style) ? delete t.style.location : 8 === t.type && e(t.children)
                    })
                }(n.val), n.val
            }, x.formats = {
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
            }, x);

            function eK() {
                for (var e, t, n, r, a, i = arguments.length, o = Array(i), s = 0; s < i; s++) o[s] = arguments[s];
                var l = L(o, 4),
                    u = (l[0], l[1]),
                    c = l[2],
                    d = l[3];
                if (Array.isArray(u)) throw new eo(es.INVALID_MESSAGE, void 0);
                if ("object" == (void 0 === u ? "undefined" : (0, U._)(u))) throw new eo(es.INSUFFICIENT_PATH, void 0);
                if ("string" == typeof u) {
                    var h = c || /'[{}<#|']/.test(u) ? void 0 : u;
                    if (h) return h
                }
                var f = d.cache,
                    m = d.formats,
                    p = d.formatters,
                    v = d.globalFormats,
                    g = d.locale,
                    b = d.timeZone;
                p.getMessageFormat || (p.getMessageFormat = el(function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return new eG(t[0], t[1], t[2], A({
                        formatters: p
                    }, t[3]))
                }, f.message));
                try {
                    a = p.getMessageFormat(u, g, (e = eG.formats.date, t = eG.formats.time, n = A({}, null == v ? void 0 : v.dateTime, null == m ? void 0 : m.dateTime), r = {
                        date: A({}, e, n),
                        time: A({}, t, n),
                        number: A({}, null == v ? void 0 : v.number, null == m ? void 0 : m.number)
                    }, b && ["date", "time"].forEach(function(e) {
                        var t = r[e],
                            n = !0,
                            a = !1,
                            i = void 0;
                        try {
                            for (var o, s = Object.entries(t)[Symbol.iterator](); !(n = (o = s.next()).done); n = !0) {
                                var l = L(o.value, 2),
                                    u = l[0],
                                    c = l[1];
                                t[u] = A({
                                    timeZone: b
                                }, c)
                            }
                        } catch (e) {
                            a = !0, i = e
                        } finally {
                            try {
                                n || null == s.return || s.return()
                            } finally {
                                if (a) throw i
                            }
                        }
                    }), r), {
                        formatters: O(A({}, p), {
                            getDateTimeFormat: function(e, t) {
                                var n;
                                return p.getDateTimeFormat(e, O(A({}, t), {
                                    timeZone: null != (n = null == t ? void 0 : t.timeZone) ? n : b
                                }))
                            }
                        })
                    })
                } catch (e) {
                    throw new eo(es.INVALID_MESSAGE, void 0)
                }
                var y = a.format(c);
                return (0, R.isValidElement)(y) || Array.isArray(y) || "string" == typeof y ? y : String(y)
            }

            function eX() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return t.filter(Boolean).join(".")
            }

            function eW(e) {
                return eX(e.namespace, e.key)
            }

            function eZ(e) {
                console.error(e)
            }

            function eY(e, t, n, r) {
                var a = eX(r, n);
                if (!t) throw Error(a);
                var i = t;
                return n.split(".").forEach(function(t) {
                    var n = i[t];
                    if (null == t || null == n) throw Error(a + " (".concat(e, ")"));
                    i = n
                }), i
            }
            eK.raw = !0;
            var eq = (0, R.createContext)(void 0);

            function eJ(e) {
                var t = e.children,
                    n = e.formats,
                    r = e.getMessageFallback,
                    a = e.locale,
                    i = e.messages,
                    o = e.now,
                    s = e.onError,
                    l = e.timeZone,
                    u = (0, R.useContext)(eq),
                    c = (0, R.useMemo)(function() {
                        return (null == u ? void 0 : u.cache) || {
                            dateTime: {},
                            number: {},
                            message: {},
                            relativeTime: {},
                            pluralRules: {},
                            list: {},
                            displayNames: {}
                        }
                    }, [a, null == u ? void 0 : u.cache]),
                    d = (0, R.useMemo)(function() {
                        return (null == u ? void 0 : u.formatters) || {
                            getDateTimeFormat: eu(Intl.DateTimeFormat, c.dateTime),
                            getNumberFormat: eu(Intl.NumberFormat, c.number),
                            getPluralRules: eu(Intl.PluralRules, c.pluralRules),
                            getRelativeTimeFormat: eu(Intl.RelativeTimeFormat, c.relativeTime),
                            getListFormat: eu(Intl.ListFormat, c.list),
                            getDisplayNames: eu(Intl.DisplayNames, c.displayNames)
                        }
                    }, [c, null == u ? void 0 : u.formatters]),
                    h = (0, R.useMemo)(function() {
                        var e, t, h, f, m;
                        return O(A({}, (t = (e = {
                            locale: a,
                            formats: void 0 === n ? null == u ? void 0 : u.formats : n,
                            getMessageFallback: r || (null == u ? void 0 : u.getMessageFallback),
                            messages: void 0 === i ? null == u ? void 0 : u.messages : i,
                            now: o || (null == u ? void 0 : u.now),
                            onError: s || (null == u ? void 0 : u.onError),
                            timeZone: l || (null == u ? void 0 : u.timeZone)
                        }).formats, h = e.getMessageFallback, f = e.messages, m = e.onError, O(A({}, ec(e, ["formats", "getMessageFallback", "messages", "onError"])), {
                            formats: t || void 0,
                            messages: f || void 0,
                            onError: m || eZ,
                            getMessageFallback: h || eW
                        }))), {
                            formatters: d,
                            cache: c
                        })
                    }, [c, n, d, r, a, i, o, s, u, l]);
                return (0, k.jsx)(eq.Provider, {
                    value: h,
                    children: t
                })
            }

            function eQ() {
                var e = (0, R.useContext)(eq);
                if (!e) throw Error(void 0);
                return e
            }
            var e$ = !1,
                e0 = "u" < typeof window,
                e1 = window.Roblox["core-lib"].index;
            Y(["ar-001", "de-de", "en-us", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn", "zh-cn", "zh-tw"]).concat(Y(["bg-bg", "bn-bd", "bs-ba", "cs-cz", "da-dk", "el-gr", "en-gb", "es-mx", "et-ee", "fi-fi", "fil-ph", "fr-ca", "hr-hr", "hu-hu", "ka-ge", "kk-kz", "km-kh", "lt-lt", "lv-lv", "ms-my", "my-mm", "nb-no", "pt-pt", "ro-ro", "ru-ru", "si-lk", "sk-sk", "sl-sl", "sq-al", "sr-rs", "sv-se", "uk-ua"]));
            var e2 = Y(["ar_001", "de_de", "en_us", "es_es", "fr_fr", "hi_in", "id_id", "it_it", "ja_jp", "ko_kr", "nl_nl", "pl_pl", "pt_br", "th_th", "tr_tr", "vi_vn", "zh_cn", "zh_tw"]).concat(Y(["bg_bg", "bn_bd", "bs_ba", "cs_cz", "da_dk", "el_gr", "en_gb", "es_mx", "et_ee", "fi_fi", "fil_ph", "fr_ca", "hr_hr", "hu_hu", "ka_ge", "kk_kz", "km_kh", "lt_lt", "lv_lv", "ms_my", "my_mm", "nb_no", "pt_pt", "ro_ro", "ru_ru", "si_lk", "sk_sk", "sl_sl", "sq_al", "sr_rs", "sv_se", "uk_ua"])),
                e3 = Y(["ar-001", "de-DE", "en-US", "es-ES", "fr-FR", "hi-IN", "id-ID", "it-IT", "ja-JP", "ko-KR", "nl-NL", "pl-PL", "pt-BR", "th-TH", "tr-TR", "vi-VN", "zh-CN", "zh-TW"]).concat(Y(["bg-BG", "bn-BD", "bs-BA", "cs-CZ", "da-DK", "el-GR", "en-GB", "es-MX", "et-EE", "fi-FI", "fil-PH", "fr-CA", "hr-HR", "hu-HU", "ka-GE", "kk-KZ", "km-KH", "lt-LT", "lv-LV", "ms-MY", "my-MM", "nb-NO", "pt-PT", "ro-RO", "ru-RU", "si-LK", "sk-SK", "sl-SL", "sq-AL", "sr-RS", "sv-SE", "uk-UA"]));
            Y(["ar", "de", "es", "fr", "hi", "id", "it", "ja", "ko", "nl", "pl", "pt", "th", "tr", "vi"]).concat(Y(["ar-001", "de-de", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn"]));
            var e5 = new Map([
                    ["zh_cjv", "zh_cn"]
                ]),
                e4 = function(e) {
                    return e.replaceAll(".", ":")
                },
                e6 = function() {
                    if ("u" < typeof window) return {};
                    var e = window.Roblox;
                    return null != e ? e : {}
                },
                e8 = function(e) {
                    return Object.fromEntries(Object.entries(null != e ? e : {}).flatMap(function(e) {
                        var t = L(e, 2),
                            n = t[0],
                            r = t[1];
                        return null == r ? [] : [
                            [e4(n), r]
                        ]
                    }))
                },
                e7 = function(e) {
                    var t = e6(),
                        n = t.Lang,
                        r = t.LangDynamic,
                        a = t.LangDynamicDefault;
                    return Object.fromEntries(e.map(function(e) {
                        return [e4(e), A({}, e8(null == a ? void 0 : a[e]), e8(null == n ? void 0 : n[e]), e8(null == r ? void 0 : r[e]))]
                    }))
                },
                e9 = function(e) {
                    var t, n, r = e.namespaces,
                        a = e.locale,
                        i = e.children,
                        o = r.join(","),
                        s = (0, R.useMemo)(function() {
                            return e7(r)
                        }, [o]);
                    return (0, k.jsx)(eJ, {
                        locale: null != a ? a : null != (t = null != (n = function() {
                            if (!("u" < typeof document)) {
                                var e = document.documentElement.lang;
                                if (e) return (0, e1.arrayIncludes)(e3, e) ? e.toLowerCase() : void 0
                            }
                        }()) ? n : function() {
                            if ("u" < typeof document) return;
                            var e, t = document.querySelector('meta[name="locale-data"]');
                            if (V(t, HTMLMetaElement)) {
                                var n = t.dataset.languageCode;
                                if (n) {
                                    var r = null != (e = e5.get(n)) ? e : n;
                                    if ((0, e1.arrayIncludes)(e2, r)) return r.replace("_", "-")
                                }
                            }
                        }()) ? t : "en-us",
                        messages: s,
                        children: i
                    })
                },
                te = "__FN_nvfToKPAOuiV__",
                tt = "__FN_END_nvfToKPAOuiV__",
                tn = new RegExp("".concat(te, "(\\d+)\\|")),
                tr = new RegExp("".concat(tt, "(\\d+)\\|")),
                ta = function(e, t, n) {
                    var r = A({}, n),
                        a = {};
                    t.forEach(function(e, t) {
                        var n = t.toString(),
                            i = "".concat(te).concat(n, "|"),
                            o = "".concat(tt).concat(n, "|");
                        r[e.opening] = i, r[e.closing] = o, a[n] = {
                            start: i,
                            end: o,
                            render: e.render
                        }
                    });
                    var i = function(e) {
                            var t = [],
                                n = tn.exec(e),
                                r = tr.exec(e);
                            if (r && (!n || r.index < n.index)) return null;
                            if (!n) return [e];
                            n.index > 0 && t.push(e.slice(0, n.index));
                            var o = null == n[1] ? void 0 : a[n[1]];
                            if (null == o) return null;
                            var s = e.indexOf(o.end);
                            if (s < n.index + n[0].length) return null;
                            var l = i(e.slice(n.index + n[0].length, s));
                            if (null == l) return null;
                            t.push(o.render(l));
                            var u = e.slice(s + o.end.length);
                            if (u.length > 0) {
                                var c = i(u);
                                if (null == c) return null;
                                t.push.apply(t, Y(c))
                            }
                            return t
                        },
                        o = i(e(r));
                    return null == o ? null : o.filter(function(e) {
                        return "" !== e
                    }).map(function(e, t) {
                        return (0, k.jsx)(R.Fragment, {
                            children: e
                        }, t)
                    })
                };

            function ti(e, t, n, r, a, i, o) {
                try {
                    var s = e[i](o),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function to(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var i = e.apply(t, n);

                        function o(e) {
                            ti(i, r, a, o, s, "next", e)
                        }

                        function s(e) {
                            ti(i, r, a, o, s, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function ts(e, t) {
                var n, r, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    s = Object.defineProperty;
                return s(o, "next", {
                    value: l(0)
                }), s(o, "throw", {
                    value: l(1)
                }), s(o, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && s(o, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), o;

                function l(s) {
                    return function(l) {
                        var u = [s, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, u[0] && (i = 0)), i;) try {
                            if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                            switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                case 0:
                                case 1:
                                    a = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, r = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < a[1]) {
                                        i.label = a[1], a = u;
                                        break
                                    }
                                    if (a && i.label < a[2]) {
                                        i.label = a[2], i.ops.push(u);
                                        break
                                    }
                                    a[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = t.call(e, i)
                        } catch (e) {
                            u = [6, e], r = 0
                        } finally {
                            n = a = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var tl = window.Roblox["core-scripts"].environmentUrls,
                tu = n.n(tl);

            function tc() {
                return null != E || (E = "".concat(tu().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), E
            }
            var td = function() {};

            function th(e, t) {
                fetch("".concat(tc()).concat(e), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: t,
                    credentials: "include",
                    keepalive: !0
                }).catch(td)
            }

            function tf(e, t) {
                to(function() {
                    var e, n, r, a, i, o, s, l, u, c, d, h, f;
                    return ts(this, function(m) {
                        switch (m.label) {
                            case 0:
                                if ("u" < typeof CompressionStream) return [2, {
                                    body: t.buffer,
                                    compressed: !1
                                }];
                                return (n = (e = new CompressionStream("gzip")).writable.getWriter()).write(t).catch(td), n.close().catch(td), r = [], [4, (a = e.readable.getReader()).read()];
                            case 1:
                                i = m.sent(), m.label = 2;
                            case 2:
                                if (i.done) return [3, 4];
                                return r.push(i.value), [4, a.read()];
                            case 3:
                                return i = m.sent(), [3, 2];
                            case 4:
                                o = new Uint8Array(r.reduce(function(e, t) {
                                    return e + t.length
                                }, 0)), s = 0, l = !0, u = !1, c = void 0;
                                try {
                                    for (d = r[Symbol.iterator](); !(l = (h = d.next()).done); l = !0) f = h.value, o.set(f, s), s += f.length
                                } catch (e) {
                                    u = !0, c = e
                                } finally {
                                    try {
                                        l || null == d.return || d.return()
                                    } finally {
                                        if (u) throw c
                                    }
                                }
                                return [2, {
                                    body: o.buffer,
                                    compressed: !0
                                }]
                        }
                    })
                })().then(function(t) {
                    var n = t.body,
                        r = t.compressed,
                        a = {
                            "Content-Type": "application/x-protobuf"
                        };
                    return r && (a["Content-Encoding"] = "gzip"), fetch("".concat(tc()).concat(e), {
                        method: "POST",
                        headers: a,
                        body: n,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(td)
            }
            var tm = function(e, t) {
                    return e << 3 | t
                },
                tp = tm(1, 2),
                tv = tm(2, 2),
                tg = tm(5, 2),
                tb = tm(6, 2),
                ty = tm(8, 2),
                tw = tm(1, 2),
                tx = tm(2, 1),
                tE = tm(3, 0),
                tS = tm(5, 2),
                tN = tm(1, 2),
                tk = tm(2, 1),
                tT = tm(3, 0),
                tC = tm(4, 2),
                tI = tm(5, 2),
                tM = tm(6, 0),
                tA = tm(8, 2),
                tB = tm(4, 0),
                t_ = tm(6, 2),
                tP = tm(7, 2),
                tH = tm(1, 0),
                tL = tm(2, 2),
                tR = tm(1, 2),
                tj = tm(2, 2),
                tO = tm(1, 2),
                tD = tm(1, 2),
                tF = tm(2, 2),
                tU = tm(1, 2),
                tz = "eventstream.enginetelemetry.EngineTelemetryBatchEvent",
                tV = new TextEncoder,
                tG = function() {
                    function e() {
                        G(this, e), M(this, "buf", [])
                    }
                    return Q(e, [{
                        key: "writeVarint",
                        value: function(e) {
                            var t = (void 0 === e ? "undefined" : (0, U._)(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                            for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                            this.buf.push(Number(t))
                        }
                    }, {
                        key: "writeString",
                        value: function(e) {
                            var t = tV.encode(e);
                            this.writeVarint(t.length);
                            var n = !0,
                                r = !1,
                                a = void 0;
                            try {
                                for (var i, o = t[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                                    var s = i.value;
                                    this.buf.push(s)
                                }
                            } catch (e) {
                                r = !0, a = e
                            } finally {
                                try {
                                    n || null == o.return || o.return()
                                } finally {
                                    if (r) throw a
                                }
                            }
                        }
                    }, {
                        key: "writeBytes",
                        value: function(e) {
                            this.writeVarint(e.length);
                            var t = !0,
                                n = !1,
                                r = void 0;
                            try {
                                for (var a, i = e[Symbol.iterator](); !(t = (a = i.next()).done); t = !0) {
                                    var o = a.value;
                                    this.buf.push(o)
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
                        }
                    }, {
                        key: "writeDouble",
                        value: function(e) {
                            var t = new DataView(new ArrayBuffer(8));
                            t.setFloat64(0, e, !0);
                            for (var n = 0; n < 8; n += 1) this.buf.push(t.getUint8(n))
                        }
                    }, {
                        key: "toBytes",
                        value: function() {
                            return new Uint8Array(this.buf)
                        }
                    }]), e
                }();

            function tK(e, t, n) {
                var r = new tG;
                return r.writeVarint(tm(1, 2)), r.writeString(e), r.writeVarint(t), n(r), r.toBytes()
            }

            function tX(e) {
                var t = new tG,
                    n = !0,
                    r = !1,
                    a = void 0;
                try {
                    for (var i, o = Object.entries(e)[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) ! function() {
                        var e = L(i.value, 2),
                            n = e[0],
                            r = e[1];
                        if ("string" == typeof r) {
                            var a = tK(n, tm(2, 2), function(e) {
                                e.writeString(r)
                            });
                            t.writeVarint(tg), t.writeBytes(a)
                        } else if ("boolean" == typeof r) {
                            var o = tK(n, tm(2, 0), function(e) {
                                e.writeVarint(+!!r)
                            });
                            t.writeVarint(tb), t.writeBytes(o)
                        } else if ((void 0 === r ? "undefined" : (0, U._)(r)) === "bigint") {
                            var s = tK(n, tm(2, 0), function(e) {
                                e.writeVarint(r)
                            });
                            t.writeVarint(tv), t.writeBytes(s)
                        } else if ("number" == typeof r)
                            if (Number.isFinite(r))
                                if (Number.isInteger(r) && r >= -0x80000000 && r <= 0x7fffffff) {
                                    var l = tK(n, tm(2, 0), function(e) {
                                        e.writeVarint(r)
                                    });
                                    t.writeVarint(tp), t.writeBytes(l)
                                } else if (Number.isInteger(r)) {
                            var u = tK(n, tm(2, 0), function(e) {
                                e.writeVarint(BigInt(r))
                            });
                            t.writeVarint(tv), t.writeBytes(u)
                        } else {
                            var c = tK(n, tm(2, 1), function(e) {
                                e.writeDouble(r)
                            });
                            t.writeVarint(ty), t.writeBytes(c)
                        } else {
                            var d = tK(n, tm(2, 2), function(e) {
                                e.writeString(String(r))
                            });
                            t.writeVarint(tg), t.writeBytes(d)
                        }
                    }()
                } catch (e) {
                    r = !0, a = e
                } finally {
                    try {
                        n || null == o.return || o.return()
                    } finally {
                        if (r) throw a
                    }
                }
                return t.toBytes()
            }

            function tW(e) {
                var t = new tG;
                if (t.writeVarint(tw), t.writeString(e.name), t.writeVarint(tx), t.writeDouble(e.value), t.writeVarint(tE), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var n = tX(e.attributes);
                    t.writeVarint(tS), t.writeBytes(n)
                }
                return t.toBytes()
            }

            function tZ(e) {
                var t = new tG;
                if (t.writeVarint(tN), t.writeString(e.name), t.writeVarint(tk), t.writeDouble(e.sum), t.writeVarint(tT), t.writeVarint(e.count), e.countsInBuckets.length > 0) {
                    var n = new tG,
                        r = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, s = e.countsInBuckets[Symbol.iterator](); !(r = (o = s.next()).done); r = !0) {
                            var l = o.value;
                            n.writeVarint(l)
                        }
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            r || null == s.return || s.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    var u = n.toBytes();
                    t.writeVarint(tC), t.writeBytes(u)
                }
                if (e.bucketIndices.length > 0) {
                    var c = new tG,
                        d = !0,
                        h = !1,
                        f = void 0;
                    try {
                        for (var m, p = e.bucketIndices[Symbol.iterator](); !(d = (m = p.next()).done); d = !0) {
                            var v = m.value;
                            c.writeVarint(v)
                        }
                    } catch (e) {
                        h = !0, f = e
                    } finally {
                        try {
                            d || null == p.return || p.return()
                        } finally {
                            if (h) throw f
                        }
                    }
                    var g = c.toBytes();
                    t.writeVarint(tI), t.writeBytes(g)
                }
                if (t.writeVarint(tM), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var b = tX(e.attributes);
                    t.writeVarint(tA), t.writeBytes(b)
                }
                return t.toBytes()
            }

            function tY(e, t, n) {
                var r = new tG;
                r.writeVarint(tB), r.writeVarint(n);
                var a = !0,
                    i = !1,
                    o = void 0;
                try {
                    for (var s, l = e[Symbol.iterator](); !(a = (s = l.next()).done); a = !0) {
                        var u = s.value;
                        r.writeVarint(t_), r.writeBytes(u)
                    }
                } catch (e) {
                    i = !0, o = e
                } finally {
                    try {
                        a || null == l.return || l.return()
                    } finally {
                        if (i) throw o
                    }
                }
                var c = !0,
                    d = !1,
                    h = void 0;
                try {
                    for (var f, m = t[Symbol.iterator](); !(c = (f = m.next()).done); c = !0) {
                        var p = f.value;
                        r.writeVarint(tP), r.writeBytes(p)
                    }
                } catch (e) {
                    d = !0, h = e
                } finally {
                    try {
                        c || null == m.return || m.return()
                    } finally {
                        if (d) throw h
                    }
                }
                return r.toBytes()
            }

            function tq(e, t, n, r, a) {
                var i = new tG;
                i.writeVarint(tH), i.writeVarint(r), i.writeVarint(tL), i.writeString(a), i.writeVarint(tB), i.writeVarint(n);
                var o = !0,
                    s = !1,
                    l = void 0;
                try {
                    for (var u, c = e[Symbol.iterator](); !(o = (u = c.next()).done); o = !0) {
                        var d = u.value;
                        i.writeVarint(t_), i.writeBytes(d)
                    }
                } catch (e) {
                    s = !0, l = e
                } finally {
                    try {
                        o || null == c.return || c.return()
                    } finally {
                        if (s) throw l
                    }
                }
                var h = !0,
                    f = !1,
                    m = void 0;
                try {
                    for (var p, v = t[Symbol.iterator](); !(h = (p = v.next()).done); h = !0) {
                        var g = p.value;
                        i.writeVarint(tP), i.writeBytes(g)
                    }
                } catch (e) {
                    f = !0, m = e
                } finally {
                    try {
                        h || null == v.return || v.return()
                    } finally {
                        if (f) throw m
                    }
                }
                return i.toBytes()
            }

            function tJ(e) {
                var t = new tG;
                t.writeVarint(tR), t.writeString(tz), t.writeVarint(tj), t.writeBytes(e);
                var n = t.toBytes(),
                    r = new tG;
                return r.writeVarint(tO), r.writeBytes(n), r.toBytes()
            }

            function tQ(e) {
                var t = new tG;
                t.writeVarint(tD), t.writeString(tz);
                var n = !0,
                    r = !1,
                    a = void 0;
                try {
                    for (var i, o = e[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                        var s = i.value;
                        t.writeVarint(tF), t.writeBytes(s)
                    }
                } catch (e) {
                    r = !0, a = e
                } finally {
                    try {
                        n || null == o.return || o.return()
                    } finally {
                        if (r) throw a
                    }
                }
                var l = t.toBytes(),
                    u = new tG;
                return u.writeVarint(tU), u.writeBytes(l), u.toBytes()
            }
            var t$ = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function t0(e) {
                return t$.test(e)
            }
            var t1 = [],
                t2 = !1,
                t3 = !1;

            function t5(e, t) {
                var n = e.map(function(e) {
                        return {
                            name: e.name,
                            value: e.value,
                            timestampMs: e.timestampMs,
                            attributes: e.attributes
                        }
                    }),
                    r = BigInt(Date.now());
                !0 === t || t3 || "u" > typeof document && "hidden" === document.visibilityState ? th("/v1/events/single", tJ(tY(n.map(tW), [], r)).buffer) : tf("/v1/events/single", tJ(tY(n.map(tW), [], r)))
            }

            function t4() {
                var e = !0,
                    t = !1,
                    n = void 0;
                try {
                    for (var r, a = t1[Symbol.iterator](); !(e = (r = a.next()).done); e = !0) {
                        var i = r.value.splice(0);
                        0 !== i.length && t5(i, !0)
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

            function t6(e, t) {
                var n, r, a, i = Math.max(1, null != (n = null == t ? void 0 : t.batchSize) ? n : 10),
                    o = null != (r = null == t ? void 0 : t.batchIntervalMs) ? r : 250;

                function s(e, n) {
                    (null == t ? void 0 : t.onError) ? t.onError(e, n): console.error(e, n)
                }
                if (!t0(e)) return s('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                        name: e
                    }),
                    function() {};
                var l = [];
                return t1.push(l), t2 || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                        "hidden" === document.visibilityState && t4()
                    }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                        t3 = !0, t4()
                    }), t2 = !0),
                    function(t, n, r) {
                        var u = "".concat(e, "_").concat(t);
                        if (! function(e, t) {
                                if (!t0(e)) return !1;
                                if (t) {
                                    var n = !0,
                                        r = !1,
                                        a = void 0;
                                    try {
                                        for (var i, o = Object.keys(t)[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                                            var s = i.value;
                                            if (!t0(s)) return !1
                                        }
                                    } catch (e) {
                                        r = !0, a = e
                                    } finally {
                                        try {
                                            n || null == o.return || o.return()
                                        } finally {
                                            if (r) throw a
                                        }
                                    }
                                }
                                return !0
                            }(u, n)) return void s("@rbx/web-telemetry: invalid event name or attribute key", {
                            name: t,
                            attributes: n
                        });
                        var c = null != r ? r : 1;
                        if (!Number.isFinite(c)) return void s("@rbx/web-telemetry: value must be a finite number", {
                            name: t,
                            attributes: n
                        });
                        var d = n && Object.keys(n).length > 0 ? n : void 0;
                        l.push({
                            name: u,
                            attributes: d,
                            value: c,
                            timestampMs: BigInt(Date.now())
                        }), l.length >= i ? (void 0 !== a && (clearTimeout(a), a = void 0), t5(l.splice(0, i))) : void 0 === a && (a = setTimeout(function() {
                            for (a = void 0; l.length > 0;) t5(l.splice(0, i))
                        }, o))
                    }
            }
            var t8 = "WwwCommon",
                t7 = function(e) {
                    var t = e.publish,
                        n = e.captureException,
                        r = e.featureName;

                    function a(e, t, a) {
                        if (null != a) {
                            var i = V(a, Error) ? a.name || "Error" : "UnknownError",
                                o = r ? "".concat(r, "_").concat(e) : e;
                            return null == n || n(a, {
                                error_counter: o
                            }), O(A({}, t), {
                                errorType: i
                            })
                        }
                        return t
                    }
                    return {
                        trackCounter: function() {
                            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            var a = L(n, 2);
                            t(a[0], a[1])
                        },
                        trackError: function() {
                            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            var i = L(n, 3),
                                o = i[0],
                                s = i[1],
                                l = i[2],
                                u = a(o, O(A({}, null != s ? s : {}), {
                                    severity: "error"
                                }), l);
                            t(o, u)
                        },
                        trackCriticalError: function() {
                            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            var i = L(n, 3),
                                o = i[0],
                                s = i[1],
                                l = i[2],
                                u = a(o, O(A({}, null != s ? s : {}), {
                                    severity: "critical"
                                }), l);
                            t(o, u)
                        }
                    }
                }({
                    publish: t6(t8)
                });
            t7.trackCounter;
            var t9 = t7.trackError;
            t7.trackCriticalError;
            var ne = function() {
                    if ("u" > typeof document) {
                        var e = document.querySelector('meta[name="page-meta"]');
                        return null == e ? void 0 : e.dataset.internalPageName
                    }
                },
                nt = function(e) {
                    return "string" == typeof e && e.length > 0
                },
                nn = function(e, t, n) {
                    var r;
                    "u" > typeof window && t9(e, {
                        key: n,
                        namespace: t,
                        internalPageName: null != (r = ne()) ? r : "unknown"
                    })
                },
                nr = function(e) {
                    var t, n, r, a, i, o, s, l, u, c, d, h, f, m = (t = e4(e), n = {
                        "!": eQ().messages
                    }, r = t ? "!.".concat(t) : "!", i = (a = eQ()).cache, o = a.formats, s = a.formatters, l = a.getMessageFallback, u = a.locale, c = a.onError, d = a.timeZone, h = n["!"], f = "!" === r ? void 0 : r.slice(2), d || e$ || !e0 || (e$ = !0, c(new eo(es.ENVIRONMENT_FALLBACK, void 0))), (0, R.useMemo)(function() {
                        var e, t;
                        return t = function(e, t, n) {
                                try {
                                    if (!t) throw Error(void 0);
                                    var r = n ? eY(e, t, n) : t;
                                    if (!r) throw Error(n);
                                    return r
                                } catch (e) {
                                    return new eo(es.MISSING_MESSAGE, e.message)
                                }
                            }((e = {
                                cache: i,
                                formatters: s,
                                getMessageFallback: l,
                                messages: h,
                                namespace: f,
                                onError: c,
                                formats: o,
                                locale: u,
                                timeZone: d
                            }).locale, e.messages, e.namespace),
                            function(e) {
                                var t = e.cache,
                                    n = e.formats,
                                    r = e.formatters,
                                    a = e.getMessageFallback,
                                    i = void 0 === a ? eW : a,
                                    o = e.locale,
                                    s = e.messagesOrError,
                                    l = e.namespace,
                                    u = e.onError,
                                    c = e.timeZone,
                                    d = V(s, eo);

                                function h(e, t, n, r) {
                                    var a = new eo(t, n);
                                    return u(a), null != r ? r : i({
                                        error: a,
                                        key: e,
                                        namespace: l
                                    })
                                }

                                function f(e, a, f, m) {
                                    var p, v, g;
                                    if (d) {
                                        if (!m) return u(s), i({
                                            error: s,
                                            key: e,
                                            namespace: l
                                        });
                                        p = m
                                    } else try {
                                        p = eY(o, s, e, l)
                                    } catch (t) {
                                        if (!m) return h(e, es.MISSING_MESSAGE, t.message, m);
                                        p = m
                                    }
                                    try {
                                        var b, y = eX(l, e);
                                        return eK(y, p, a ? (b = {}, Object.keys(a).forEach(function(e) {
                                            var t, n = 0,
                                                r = a[e];
                                            t = "function" == typeof r ? function(t) {
                                                var a = r(t);
                                                return (0, R.isValidElement)(a) ? (0, R.cloneElement)(a, {
                                                    key: e + n++
                                                }) : a
                                            } : r, b[e] = t
                                        }), b) : a, {
                                            cache: t,
                                            formatters: r,
                                            globalFormats: n,
                                            formats: f,
                                            locale: o,
                                            timeZone: c
                                        })
                                    } catch (t) {
                                        return V(t, eo) ? (v = t.code, g = t.originalMessage) : (v = es.FORMATTING_ERROR, g = t.message), h(e, v, g, m)
                                    }
                                }

                                function m(e, t, n, r) {
                                    var a = f(e, t, n, r);
                                    return "string" != typeof a ? h(e, es.INVALID_MESSAGE, void 0) : a
                                }
                                return m.rich = f, m.markup = function(e, t, n, r) {
                                    return f(e, t, n, r)
                                }, m.raw = function(e) {
                                    if (d) return u(s), i({
                                        error: s,
                                        key: e,
                                        namespace: l
                                    });
                                    try {
                                        return eY(o, s, e, l)
                                    } catch (t) {
                                        return h(e, es.MISSING_MESSAGE, t.message)
                                    }
                                }, m.has = function(e) {
                                    if (d) return !1;
                                    try {
                                        return eY(o, s, e, l), !0
                                    } catch (e) {
                                        return !1
                                    }
                                }, m
                            }(O(A({}, e), {
                                messagesOrError: t
                            }))
                    }, [i, s, l, h, f, c, o, u, d]));
                    return (0, R.useMemo)(function() {
                        return Object.assign(function(t, n, r) {
                            var a = e4(t);
                            return void 0 === r || m.has(a) ? m(a, n) : (nn("TranslationKeyNotFound", e, a), r)
                        }, {
                            rich: function(e, t) {
                                return m.rich(e4(e), t)
                            },
                            has: function(e) {
                                return nt(e) && m.has(e4(e))
                            },
                            dynamic: function(t, n) {
                                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "";
                                if (!nt(t)) return nn("TranslationKeyNotFound", e, String(t)), r;
                                var a = e4(t),
                                    i = m.has(a);
                                return i || nn("TranslationKeyNotFound", e, a), i ? m(a, n) : r
                            },
                            html: function(t, n, r) {
                                if (!nt(t)) return nn("TranslationKeyNotFound", e, String(t)), null;
                                var a = e4(t);
                                if (!m.has(a)) return nn("TranslationKeyNotFound", e, a), null;
                                var i = ta(function(e) {
                                    return m(a, e)
                                }, n, r);
                                return null == i && nn("TranslationMalformed", e, a), i
                            }
                        })
                    }, [m, e])
                },
                na = window.RobloxThumbnails;

            function ni() {
                for (var e, t, n = 0, r = "", a = arguments.length; n < a; n++)(e = arguments[n]) && (t = function e(t) {
                    var n, r, a = "";
                    if ("string" == typeof t || "number" == typeof t) a += t;
                    else if ("object" == (void 0 === t ? "undefined" : (0, U._)(t)))
                        if (Array.isArray(t)) {
                            var i = t.length;
                            for (n = 0; n < i; n++) t[n] && (r = e(t[n])) && (a && (a += " "), a += r)
                        } else
                            for (r in t) t[r] && (a && (a += " "), a += r);
                    return a
                }(e)) && (r && (r += " "), r += t);
                return r
            }
            var no = {
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
                ns = j().forwardRef(function(e, t) {
                    var n = eh([e, t]),
                        r = n[0],
                        a = n.slice(1),
                        i = r.className,
                        o = r.size,
                        s = void 0 === o ? "Large" : o,
                        l = r.variant,
                        u = r.value,
                        c = r.showValue,
                        d = void 0 !== c && c,
                        h = r.ariaLabel,
                        f = ec(r, ["className", "size", "variant", "value", "showValue", "ariaLabel"]),
                        m = L(a, 1)[0],
                        p = no[s],
                        v = p.dimension,
                        g = p.strokeWidth,
                        b = p.textClass,
                        y = p.valueContainerSize,
                        w = (v - g) / 2,
                        x = 2 * Math.PI * w,
                        E = v / 2,
                        S = Math.min(100, Math.max(0, void 0 === u ? 0 : u)),
                        N = d && void 0 !== y ? y : v,
                        k = "Determinate" === (void 0 === l ? "Determinate" : l);
                    return j().createElement("div", A({
                        ref: m,
                        className: ni("foundation-web-progress-circle inline-flex items-center justify-center", i),
                        role: "progressbar",
                        "aria-label": h,
                        "aria-valuemin": k ? 0 : void 0,
                        "aria-valuemax": k ? 100 : void 0,
                        "aria-valuenow": k ? S : void 0,
                        style: {
                            width: N,
                            height: N
                        }
                    }, f), j().createElement("svg", {
                        width: v,
                        height: v,
                        viewBox: "0 0 ".concat(v, " ").concat(v),
                        className: "relative"
                    }, j().createElement("circle", {
                        cx: E,
                        cy: E,
                        r: w,
                        fill: "none",
                        strokeWidth: g,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), j().createElement("circle", {
                        cx: E,
                        cy: E,
                        r: w,
                        fill: "none",
                        strokeWidth: g,
                        strokeDasharray: k ? x : "".concat(.75 * x, " ").concat(.25 * x),
                        strokeDashoffset: k ? x * (1 - S / 100) : 0,
                        strokeLinecap: "round",
                        className: ni(!k && "foundation-web-progress-circle-indeterminate"),
                        style: k ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), k && d && "Large" === s && j().createElement("div", {
                        className: ni("absolute content-emphasis flex items-center justify-center", b),
                        "aria-hidden": "true"
                    }, j().createElement("span", null, Math.round(S)), j().createElement("span", null, "%")))
                });
            ns.displayName = "ProgressCircle";
            var nl = window.Roblox["core-scripts"].meta.device,
                nu = "inbox",
                nc = "sent",
                nd = "notifications",
                nh = "archive",
                nf = "list",
                nm = "detail",
                np = "Roblox",
                nv = "Roblox.Messages.CountChanged",
                ng = window.Roblox["core-scripts"].eventStream,
                nb = window.Roblox["core-scripts"].intl.intl,
                ny = n.n(nb),
                nw = window.Roblox["core-scripts"].endpoints,
                nx = window.Roblox["core-scripts"].format.string,
                nE = /(https?:\/\/)/,
                nS = /(https?:\/\/)?(?:www\.)?([a-z0-9-]{2,}\.)*(((m|de|www|web|api|blog|wiki|corp|events|polls|bloxcon|developer|devforum|forum|status|create)\.roblox\.com|robloxlabs\.com)|(www\.shoproblox\.com)|(roblox\.status\.io)|(rblx\.co)|help\.roblox\.com(?![A-Za-z0-9/.]*\/attachments\/))(?!\/[A-Za-z0-9-+&@#/=~_|!:,.;]*%)((\/[A-Za-z0-9-+&@#/%?=~_|!:,.;]*)|(?=\s|\b))/gm,
                nN = [".roblox.com", ".robloxlabs.com"],
                nk = function(e) {
                    var t, n = null == (t = /^https?:\/\/([^/?#]*)/.exec(e)) ? void 0 : t[1];
                    return null == n || nN.some(function(e) {
                        return n.endsWith(e)
                    })
                },
                nT = function(e, t, n) {
                    var r = e.replace(/&amp;/g, "&"),
                        a = r.replace(/\.+$/g, "");
                    return nE.test(a) || (a = "https://".concat(a)), a = a.replace("http://", "https://"), {
                        offset: t,
                        length: e.length,
                        text: r,
                        href: a,
                        target: n ? void 0 : "_blank",
                        rel: nk(a) ? "noopener" : "noopener noreferrer"
                    }
                },
                nC = function(e, t) {
                    var n = "",
                        r = 0,
                        a = !0,
                        i = !1,
                        o = void 0;
                    try {
                        for (var s, l = Array.from(e.matchAll(nS), function(e) {
                                return nT(e[0], e.index, t)
                            })[Symbol.iterator](); !(a = (s = l.next()).done); a = !0) {
                            var u = s.value,
                                c = null == u.target ? "" : ' target="'.concat(u.target, '"');
                            n += "".concat(e.slice(r, u.offset), '<a class="').concat("text-link", '" href="').concat(u.href.replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/\u00a0/g, "&nbsp;"), '"').concat(c, ' rel="').concat(u.rel, '">').concat(u.text.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/\u00a0/g, "&nbsp;"), "</a>"), r = u.offset + u.length
                        }
                    } catch (e) {
                        i = !0, o = e
                    } finally {
                        try {
                            a || null == l.return || l.return()
                        } finally {
                            if (i) throw o
                        }
                    }
                    return n + e.slice(r)
                },
                nI = new(ny())().getDateTimeFormatter(),
                nM = function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return t.find(function(e) {
                        return null != e
                    })
                },
                nA = function(e) {
                    var t, n, r, a = null != (t = nM(null == e ? void 0 : e.id, null == e ? void 0 : e.UserId, 1)) ? t : 1,
                        i = null != (n = nM(null == e ? void 0 : e.name, null == e ? void 0 : e.UserName, np)) ? n : np,
                        o = null != (r = nM(null == e ? void 0 : e.displayName, null == e ? void 0 : e.DisplayName, i)) ? r : i;
                    return {
                        id: a,
                        name: (0, nx.escapeHtml)(i),
                        displayName: o,
                        hasVerifiedBadge: !!nM(null == e ? void 0 : e.hasVerifiedBadge, null == e ? void 0 : e.HasVerifiedBadge, !1),
                        profileLink: (0, nw.getAbsoluteUrl)("/users/".concat(a, "/profile"))
                    }
                },
                nB = function(e) {
                    var t = (0, nw.getAbsoluteUrl)("/my/messages/");
                    return (0, nw.getAbsoluteUrl)("/AbuseReport/message?ID=".concat(e, "&RedirectUrl=").concat(t))
                },
                n_ = function(e) {
                    var t, n, r, a, i = null != (t = nM(e.id, e.Id, 0)) ? t : 0;
                    return {
                        id: i,
                        sender: nA(nM(e.sender, e.Sender)),
                        recipient: nA(nM(e.recipient, e.Recipient)),
                        subject: null != (n = nM(e.subject, e.Subject, "")) ? n : "",
                        body: null != (r = nM(e.body, e.Body, "")) ? r : "",
                        created: null != (a = nM(e.created, e.Created, "")) ? a : "",
                        updated: nM(e.updated, e.Updated),
                        isRead: !!nM(e.isRead, e.IsRead, !1),
                        isSystemMessage: !!nM(e.isSystemMessage, e.IsSystemMessage, !1),
                        isReportAbuseDisplayed: !!nM(e.isReportAbuseDisplayed, e.IsReportAbuseDisplayed, !1),
                        abuseReportUrl: nB(i)
                    }
                },
                nP = function(e) {
                    var t, n;
                    return {
                        pageNumber: null != (t = nM(e.pageNumber, e.PageNumber, 0)) ? t : 0,
                        pageToken: null != (n = nM(e.pageToken, e.PageToken, "")) ? n : ""
                    }
                },
                nH = function(e) {
                    var t, n, r = nM(e.pageWindow, e.PageWindow);
                    return Array.isArray(r) && 0 !== r.length ? {
                        pageNumber: null != (n = nM(e.pageNumber, e.PageNumber, 1)) ? n : 1,
                        pageWindow: r.map(nP).filter(function(e) {
                            return e.pageNumber > 0 && e.pageToken.length > 0
                        }),
                        firstPageToken: null != (t = nM(e.firstPageToken, e.FirstPageToken)) && t.length > 0 ? t : null,
                        hasMore: !!nM(e.hasMore, e.HasMore, !1)
                    } : null
                },
                nL = function(e) {
                    var t, n, r, a, i = null != (t = nM(e.collection, e.Collection, [])) ? t : [];
                    return {
                        pageNumber: null != (n = nM(e.pageNumber, e.PageNumber, 0)) ? n : 0,
                        totalPages: null != (r = nM(e.totalPages, e.TotalPages, 1)) ? r : 1,
                        totalCollectionSize: null != (a = nM(e.totalCollectionSize, e.TotalCollectionSize, i.length)) ? a : i.length,
                        collection: i.map(n_),
                        cursorPagination: nH(e)
                    }
                },
                nR = function(e) {
                    var t = document.createElement("div");
                    return t.innerHTML = e, t.textContent || t.innerText || ""
                },
                nj = function(e) {
                    var t, n, r, a;
                    return (r = e, a = null != (t = null == (n = (0, nl.getDeviceMeta)()) ? void 0 : n.isPhone) && t, nC(r.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;").replace(/'/g, "&#39;"), a)).replace(/\n/g, "<br />")
                },
                nO = function(e) {
                    var t = new Date(e);
                    if (Number.isNaN(t.getTime())) return "";
                    var n = t.getFullYear() === new Date().getFullYear() ? nI.getCustomDateTime(t, {
                        month: "short",
                        day: "numeric"
                    }) : nI.getShortDate(t);
                    return "".concat(n, " | ").concat(nI.getCustomDateTime(t, {
                        hour: "numeric",
                        minute: "numeric"
                    }))
                },
                nD = function(e) {
                    var t = new Date(e);
                    return Number.isNaN(t.getTime()) ? "" : nI.getFullDate(t)
                },
                nF = function(e) {
                    document.dispatchEvent(new Event(e))
                },
                nU = window.Roblox["core-scripts"].meta.user,
                nz = window.Roblox["core-lib"].http.index,
                nV = function(e) {
                    return V(e, nz.HttpError) ? e.response.status : null != e && (void 0 === e ? "undefined" : (0, U._)(e)) === "object" && "status" in e && "number" == typeof e.status ? e.status : void 0
                },
                nG = function(e) {
                    if (null == e) return "network";
                    var t, n = V(e, Error) ? e.cause : void 0,
                        r = null != (t = nV(e)) ? t : nV(n);
                    return null != r ? String(r) : V(e, nz.AbortError) || V(n, nz.AbortError) ? "aborted" : V(e, nz.UnknownFetchError) || V(n, nz.UnknownFetchError) ? "network" : "unknown"
                },
                nK = window.Roblox["core-scripts"].http.http,
                nX = window.Roblox["core-scripts"].guac,
                nW = window.Roblox["core-lib"].url.index,
                nZ = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                    return e.getOrThrow().then(function(e) {
                        return t && null == e ? {} : e
                    }, function(e) {
                        throw V(e, nz.HttpError) ? Error("Request failed with status code ".concat(e.response.status), {
                            cause: e
                        }) : V(e, Error) ? e : Error(String(e), {
                            cause: e
                        })
                    })
                },
                nY = function(e) {
                    return A({}, e.withCredentials ? {
                        credentials: "include"
                    } : {}, e.retryable ? {
                        retry: nz.defaultBrowserRetryDelay
                    } : {}, e.noCache ? {
                        headers: {
                            "Cache-Control": "no-cache, no-store, must-revalidate",
                            Pragma: "no-cache"
                        }
                    } : {})
                },
                nq = function(e, t) {
                    var n = nW.Url.parse(e).getOrThrow();
                    if (!t) return n;
                    var r = Object.fromEntries(Object.entries(t).filter(function(e) {
                        return null != L(e, 2)[1]
                    }).map(function(e) {
                        var t = L(e, 2);
                        return [t[0], String(t[1])]
                    }));
                    return n.withSearchParams(r)
                },
                nJ = "true" === n(773).env.NEXT_PUBLIC_IS_NEXTJS ? {
                    get: function(e, t) {
                        return nZ(nz.getUntyped(nq(e.url, t), nY(e)))
                    },
                    post: function(e, t) {
                        return nZ(nz.postUntyped(nq(e.url), null != t ? t : {}, nY(e)), !0)
                    },
                    getGuacBundle: function(e) {
                        var t = nW.Url.parse(tu().apiGatewayUrl).getOrThrow().withPath("/guac-v2/v1/bundles/".concat(e)).withSearchParams({
                            version: "1"
                        });
                        return nZ(nz.getUntyped(t, {
                            credentials: "include"
                        }))
                    }
                } : {
                    get: function(e, t) {
                        return nK.get(e, t).then(function(e) {
                            return e.data
                        })
                    },
                    post: function(e, t) {
                        return nK.post(e, t).then(function(e) {
                            return e.data
                        })
                    },
                    getGuacBundle: function(e) {
                        var t = new URLSearchParams;
                        return t.append("version", "1"), (0, nX.callBehaviour)(e, t)
                    }
                },
                nQ = function(e) {
                    return "".concat(tu().privateMessagesApi).concat(e)
                },
                n$ = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                    return {
                        url: e,
                        noCache: t,
                        retryable: t,
                        withCredentials: !0
                    }
                },
                n0 = new Map,
                n1 = function(e) {
                    var t = JSON.stringify(e),
                        n = n0.get(t);
                    if (n) return n;
                    var r = nJ.get(n$(nQ("/v1/messages"), !0), e).then(nL).finally(function() {
                        n0.get(t) === r && n0.delete(t)
                    });
                    return n0.set(t, r), r
                },
                n2 = function() {
                    n0.clear()
                },
                n3 = function(e, t) {
                    return nJ.post(n$(nQ(t ? "/v1/messages/mark-read" : "/v1/messages/mark-unread")), {
                        messageIds: e
                    }).finally(n2)
                },
                n5 = function(e) {
                    if (e.message) return Error(e.message);
                    var t, n, r = null == (n = e.errors) || null == (t = n[0]) ? void 0 : t.message;
                    return Error(null != r ? r : "Unknown error")
                },
                n4 = function(e) {
                    var t = e.subject,
                        n = e.body,
                        r = e.recipientId,
                        a = e.replyMessageId,
                        i = e.includePreviousMessage;
                    return to(function() {
                        var e, o;
                        return ts(this, function(s) {
                            switch (s.label) {
                                case 0:
                                    return [4, nJ.post(n$(nQ("/v1/messages/send")), {
                                        userId: null != (e = (0, nU.userId)()) ? e : 0,
                                        subject: t,
                                        body: n,
                                        recipientId: r,
                                        replyMessageId: a,
                                        includePreviousMessage: i
                                    })];
                                case 1:
                                    if (!1 === (o = s.sent()).success) throw n5(o);
                                    return [2, o]
                            }
                        })
                    })()
                },
                n6 = [nu, nc, nd, nh],
                n8 = function(e) {
                    var t = Array.isArray(e) ? e[0] : e;
                    if (null == t || "" === t || "string" != typeof t && "number" != typeof t) return null;
                    var n = Number.parseInt(String(t), 10);
                    return Number.isNaN(n) ? null : n
                },
                n7 = function() {
                    var e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "u" < typeof window ? "" : window.location.hash,
                        n = L((t.startsWith("#!") ? t.slice(2) : t.replace(/^#/, "")).split("?"), 2),
                        r = n[0],
                        a = n[1],
                        i = (void 0 === r ? "/inbox" : r).replace(/^\//, ""),
                        o = nW.UrlSearchParams.parse(void 0 === a ? "" : a),
                        s = null != (e = n8(o.get("page"))) ? e : 1,
                        l = o.get("pageToken"),
                        u = "string" == typeof l && l.length > 0 ? l : null;
                    return {
                        tab: n6.includes(i) ? i : nu,
                        page: s > 0 ? s : 1,
                        pageToken: u,
                        messageIdx: n8(o.get("messageIdx")),
                        conversationId: n8(o.get("conversationId"))
                    }
                },
                n9 = function(e) {
                    var t = nW.UrlSearchParams.new(A({}, e.page > 1 ? {
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
                re = function() {
                    var e = L((0, R.useState)(function() {
                            return n7()
                        }), 2),
                        t = e[0],
                        n = e[1];
                    return (0, R.useEffect)(function() {
                        var e = function() {
                            n(n7())
                        };
                        return window.addEventListener("hashchange", e),
                            function() {
                                window.removeEventListener("hashchange", e)
                            }
                    }, []), {
                        route: t,
                        setRoute: (0, R.useCallback)(function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                r = t.replace,
                                a = n9(e);
                            if (window.location.hash === a) return void n(e);
                            if (void 0 !== r && r) {
                                window.history.replaceState(window.history.state, "", a), n(e);
                                return
                            }
                            window.location.hash = a
                        }, [])
                    }
                },
                rt = globalThis.window,
                rn = void 0 === rt ? void 0 : rt,
                rr = [],
                ra = !1,
                ri = !1;

            function ro() {
                var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0],
                    t = !0,
                    n = !1,
                    r = void 0;
                try {
                    for (var a, i = rr[Symbol.iterator](); !(t = (a = i.next()).done); t = !0)(0, a.value)(e)
                } catch (e) {
                    n = !0, r = e
                } finally {
                    try {
                        t || null == i.return || i.return()
                    } finally {
                        if (n) throw r
                    }
                }
            }
            var rs = n(773),
                rl = "PrivateMessage",
                ru = "true" === rs.env.NEXT_PUBLIC_IS_NEXTJS ? "nextjs" : "dotnet",
                rc = t6(rl),
                rd = function() {
                    var e, t = null == (e = (0, nl.getDeviceMeta)()) ? void 0 : e.appType.trim();
                    return null == t || "" === t ? "unknown" : t
                },
                rh = function(e) {
                    var t = e.publish,
                        n = e.captureException,
                        r = e.featureName;

                    function a(e, t, a) {
                        if (null != a) {
                            var i = V(a, Error) ? a.name || "Error" : "UnknownError",
                                o = r ? "".concat(r, "_").concat(e) : e;
                            return null == n || n(a, {
                                error_counter: o
                            }), O(A({}, t), {
                                errorType: i
                            })
                        }
                        return t
                    }
                    return {
                        trackCounter: function() {
                            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            var a = L(n, 2);
                            t(a[0], a[1])
                        },
                        trackError: function() {
                            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            var i = L(n, 3),
                                o = i[0],
                                s = i[1],
                                l = i[2],
                                u = a(o, O(A({}, null != s ? s : {}), {
                                    severity: "error"
                                }), l);
                            t(o, u)
                        },
                        trackCriticalError: function() {
                            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            var i = L(n, 3),
                                o = i[0],
                                s = i[1],
                                l = i[2],
                                u = a(o, O(A({}, null != s ? s : {}), {
                                    severity: "critical"
                                }), l);
                            t(o, u)
                        }
                    }
                }({
                    publish: function(e, t) {
                        rc(e, O(A({}, t), {
                            host: ru,
                            appType: rd()
                        }))
                    },
                    featureName: rl
                }),
                rf = rh.trackCounter,
                rm = rh.trackError,
                rp = rh.trackCriticalError,
                rv = function(e, t) {
                    var n, r, a = null != (n = t.flushIntervalMs) ? n : 5e3;

                    function i(e, n) {
                        t.onError ? t.onError(e, n) : console.error(e, n)
                    }
                    if (!t0(e)) return i('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                            name: e
                        }),
                        function() {};
                    var o = new Map;

                    function s() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                        if (0 !== o.size) {
                            var t = o;
                            o = new Map;
                            var n = BigInt(Date.now()),
                                r = Array.from(t.values(), function(e) {
                                    var t = function(e) {
                                            var t = [],
                                                n = [],
                                                r = !0,
                                                a = !1,
                                                i = void 0;
                                            try {
                                                for (var o, s = e[Symbol.iterator](); !(r = (o = s.next()).done); r = !0) {
                                                    var l = L(o.value, 2),
                                                        u = l[0],
                                                        c = l[1];
                                                    c > 0 && (t.push(u), n.push(BigInt(c)))
                                                }
                                            } catch (e) {
                                                a = !0, i = e
                                            } finally {
                                                try {
                                                    r || null == s.return || s.return()
                                                } finally {
                                                    if (a) throw i
                                                }
                                            }
                                            return {
                                                bucketIndices: t,
                                                countsInBuckets: n
                                            }
                                        }(e.bucketCounts),
                                        r = t.bucketIndices,
                                        a = t.countsInBuckets;
                                    return {
                                        name: e.name,
                                        sum: e.sum,
                                        count: BigInt(e.count),
                                        bucketIndices: r,
                                        countsInBuckets: a,
                                        timestampMs: n,
                                        attributes: e.attributes
                                    }
                                }),
                                a = BigInt(1),
                                i = "u" > typeof crypto && "function" == typeof crypto.randomUUID ? crypto.randomUUID() : "web-telemetry-".concat(Date.now(), "-").concat(Math.random().toString(16).slice(2));
                            e || ri || "u" > typeof document && "hidden" === document.visibilityState ? th("/v1/events/optimized", tQ([tq([], r.map(tZ), n, a, i)]).buffer) : tf("/v1/events/optimized", tQ([tq([], r.map(tZ), n, a, i)]))
                        }
                    }
                    return rr.push(s), ra || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                            "hidden" === document.visibilityState && ro()
                        }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                            ri = !0, ro()
                        }), ra = !0),
                        function(t, n, l) {
                            var u, c = "".concat(e, "_").concat(t);
                            if (! function(e, t) {
                                    if (!t0(e)) return !1;
                                    if (t) {
                                        var n = !0,
                                            r = !1,
                                            a = void 0;
                                        try {
                                            for (var i, o = Object.keys(t)[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                                                var s = i.value;
                                                if (!t0(s)) return !1
                                            }
                                        } catch (e) {
                                            r = !0, a = e
                                        } finally {
                                            try {
                                                n || null == o.return || o.return()
                                            } finally {
                                                if (r) throw a
                                            }
                                        }
                                    }
                                    return !0
                                }(c, n)) return void i("@rbx/web-telemetry: invalid event name or attribute key", {
                                name: t
                            });
                            var d = null != l ? l : 0;
                            if (!Number.isFinite(d)) return void i("@rbx/web-telemetry: value must be a finite number", {
                                name: t
                            });
                            var h = n && Object.keys(n).length > 0 ? n : void 0,
                                f = function(e, t) {
                                    if (!t || 0 === Object.keys(t).length) return e;
                                    var n = Object.keys(t).sort().map(function(e) {
                                        return "".concat(e, "=").concat(t[e])
                                    }).join("&");
                                    return "".concat(e, "|").concat(n)
                                }(c, h),
                                m = o.get(f);
                            m || (m = {
                                name: c,
                                attributes: h,
                                sum: 0,
                                count: 0,
                                bucketCounts: new Map
                            }, o.set(f, m)), m.sum += d, m.count += 1;
                            var p = function(e) {
                                if (e <= 0) return -1;
                                if (e < 1e-4) return 1;
                                if (e > 1e11) return 272;
                                var t = Math.log10(e),
                                    n = Math.floor((t - -4) * 18);
                                return 1e-9 > Math.abs((t - -4) * 18 - n) && n > 0 && (n -= 1), n + 2
                            }(d);
                            m.bucketCounts.set(p, (null != (u = m.bucketCounts.get(p)) ? u : 0) + 1),
                                function e() {
                                    void 0 === r && (r = setTimeout(function() {
                                        r = void 0, s(), o.size > 0 && e()
                                    }, a))
                                }()
                        }
                }(rl, {}),
                rg = function() {
                    var e = L(performance.getEntriesByType("navigation"), 1)[0];
                    return void 0 !== e && new URL(e.name).pathname === (null == rn ? void 0 : rn.location.pathname)
                },
                rb = !1,
                ry = function(e, t) {
                    !rb && rg() && (rb = !0, t && rv("ListLoadedMs", {
                        host: ru,
                        tab: e,
                        appType: rd()
                    }, performance.now()))
                },
                rw = {
                    replyContent: "",
                    includePreviousMessage: !0,
                    isSending: !1
                },
                rx = function(e) {
                    return e && !e.isSystemMessage ? O(A({}, e), {
                        body: nj(e.body)
                    }) : e
                },
                rE = function(e, t) {
                    if (e && (void 0 === e ? "undefined" : (0, U._)(e)) === "object") {
                        if ("string" == typeof e.message) return e.message;
                        if (Array.isArray(e.errors)) {
                            var n = e.errors[0];
                            if (n && (void 0 === n ? "undefined" : (0, U._)(n)) === "object" && "message" in n) return String(n.message)
                        }
                    }
                    return t
                },
                rS = function(e, t) {
                    return !0 === e.enableCursorPagination && t.tab !== nd && (null != t.pageToken || t.page <= 1)
                },
                rN = function(e, t) {
                    var n;
                    return (null == e ? void 0 : e.cursorPagination) ? A({
                        kind: "cursor"
                    }, e.cursorPagination) : {
                        kind: "offset",
                        currentPage: e ? e.pageNumber + 1 : t,
                        totalPages: null != (n = null == e ? void 0 : e.totalPages) ? n : 1
                    }
                },
                rk = function(e) {
                    return function(t) {
                        throw rm(e, {
                            statusCode: nG(t)
                        }, t), t
                    }
                },
                rT = function(e) {
                    var t = e.translate,
                        n = re(),
                        r = n.route,
                        a = n.setRoute,
                        i = L((0, R.useState)(function() {
                            return nJ.getGuacBundle("private-messages-ui").catch(function(e) {
                                return rm("RulesLoadFailed", {
                                    statusCode: nG(e)
                                }, e), {}
                            })
                        }), 1)[0],
                        o = L((0, R.useState)({}), 2),
                        s = o[0],
                        l = o[1],
                        u = L((0, R.useState)(null), 2),
                        c = u[0],
                        d = u[1],
                        h = L((0, R.useState)(null), 2),
                        f = h[0],
                        m = h[1],
                        p = L((0, R.useState)(function() {
                            return new Set
                        }), 2),
                        v = p[0],
                        g = p[1],
                        b = L((0, R.useState)(nf), 2),
                        y = b[0],
                        w = b[1],
                        x = L((0, R.useState)(!0), 2),
                        E = x[0],
                        S = x[1],
                        N = L((0, R.useState)(null), 2),
                        k = N[0],
                        T = N[1],
                        C = L((0, R.useState)(null), 2),
                        I = C[0],
                        M = C[1],
                        B = L((0, R.useState)(rw), 2),
                        _ = B[0],
                        P = B[1],
                        H = L((0, R.useState)(0), 2),
                        j = H[0],
                        D = H[1],
                        F = (0, R.useRef)(!1),
                        U = (0, R.useRef)(r.tab),
                        z = (0, R.useRef)(0),
                        V = (0, R.useRef)(!1),
                        G = (0, R.useMemo)(function() {
                            var e = [{
                                name: nu,
                                label: t("Label.Inbox")
                            }, {
                                name: nc,
                                label: t("Label.Sent")
                            }, {
                                name: nd,
                                label: t("Label.News"),
                                count: j
                            }, {
                                name: nh,
                                label: t("Label.Archive")
                            }];
                            return s.displayNewsTab ? e : e.filter(function(e) {
                                return e.name !== nd
                            })
                        }, [j, s.displayNewsTab, t]),
                        K = (0, R.useCallback)(function() {
                            return to(function() {
                                var e, n, o, s, l, u, c;
                                return ts(this, function(h) {
                                    var f, p, v, b;
                                    switch (h.label) {
                                        case 0:
                                            z.current += 1, e = z.current, n = function() {
                                                return e !== z.current
                                            }, S(!0), T(null), g(new Set), h.label = 1;
                                        case 1:
                                            if (h.trys.push([1, 12, 13, 14]), null == r.conversationId) return [3, 5];
                                            return [4, (f = r.conversationId, to(function() {
                                                return ts(this, function(e) {
                                                    switch (e.label) {
                                                        case 0:
                                                            return [4, nJ.get(n$(nQ("/v1/messages/".concat(f)), !0))];
                                                        case 1:
                                                            return [2, n_(e.sent())]
                                                    }
                                                })
                                            })())];
                                        case 2:
                                            if (o = h.sent(), n()) return [2];
                                            if (d(null), m(rx(o)), P(rw), w(nm), o.isRead) return [3, 4];
                                            return [4, n3([o.id], !0).then(function() {
                                                nF(nv)
                                            }, function(e) {
                                                rm("MarkReadFailed", {
                                                    statusCode: nG(e)
                                                }, e)
                                            })];
                                        case 3:
                                            h.sent(), h.label = 4;
                                        case 4:
                                            return [3, 11];
                                        case 5:
                                            return [4, Promise.race([i, new Promise(function(e) {
                                                setTimeout(function() {
                                                    e({})
                                                }, 2e3)
                                            })])];
                                        case 6:
                                            if (!rS.apply(void 0, [h.sent(), r])) return [3, 8];
                                            return [4, n1(A({
                                                pageSize: 20,
                                                messageTab: r.tab,
                                                useCursor: !0
                                            }, (p = r.pageToken) ? {
                                                pageToken: p
                                            } : {}))];
                                        case 7:
                                            return u = h.sent(), [3, 10];
                                        case 8:
                                            return [4, (v = r.tab, b = r.page - 1, v === nd ? to(function() {
                                                return ts(this, function(e) {
                                                    switch (e.label) {
                                                        case 0:
                                                            return [4, nJ.get(n$(nQ("/v1/announcements"), !0))];
                                                        case 1:
                                                            return [2, nL(e.sent())]
                                                    }
                                                })
                                            })() : n1({
                                                pageNumber: b,
                                                pageSize: 20,
                                                messageTab: v
                                            }))];
                                        case 9:
                                            u = h.sent(), h.label = 10;
                                        case 10:
                                            if (l = u, n()) return [2];
                                            d(l), w(null == r.messageIdx ? nf : nm), m(null == r.messageIdx ? null : rx(null != (s = l.collection[r.messageIdx]) ? s : null)), null != r.messageIdx && P(rw), nF(nv), h.label = 11;
                                        case 11:
                                            return [3, 14];
                                        case 12:
                                            if (c = h.sent(), n()) return [2];
                                            if (null == r.conversationId && null != r.pageToken && "400" === nG(c)) return a(O(A({}, r), {
                                                page: 1,
                                                pageToken: null,
                                                messageIdx: null
                                            }), {
                                                replace: !0
                                            }), [2];
                                            return rp("LoadFailed", {
                                                host: ru,
                                                tab: r.tab,
                                                statusCode: nG(c)
                                            }, c), d(null), m(null), w(nf), T(rE(c, t("Message.UnknownError"))), [3, 14];
                                        case 13:
                                            return n() || S(!1), [7];
                                        case 14:
                                            return [2]
                                    }
                                })
                            })()
                        }, [r, i, a, t]),
                        X = (0, R.useRef)(K);
                    (0, R.useEffect)(function() {
                        X.current = K
                    }, [K]);
                    var W = (0, R.useRef)(r);
                    (0, R.useEffect)(function() {
                        W.current = r
                    }, [r]), (0, R.useEffect)(function() {
                        rf("PageView", {
                            host: ru,
                            tab: U.current
                        }), i.then(l), nJ.get(n$(nQ("/v1/announcements/metadata"), !0)).then(function(e) {
                            var t;
                            D(null != (t = e.numOfAnnouncements) ? t : 0)
                        }).catch(function(e) {
                            rm("NewsCountLoadFailed", {
                                statusCode: nG(e)
                            }, e), D(0)
                        })
                    }, [i]), (0, R.useEffect)(function() {
                        E || V.current || (V.current = !0, ry(r.tab, null != c && y === nf))
                    }, [E, y, c, r.tab]), (0, R.useEffect)(function() {
                        if (F.current) {
                            F.current = !1;
                            return
                        }
                        K()
                    }, [K]);
                    var Z = (0, R.useMemo)(function() {
                        return rN(c, r.page)
                    }, [c, r.page]);
                    return {
                        route: r,
                        rules: s,
                        tabs: G,
                        page: c,
                        pagination: Z,
                        selectedMessage: f,
                        selectedMessageIds: v,
                        moduleState: y,
                        loading: E,
                        error: k,
                        feedback: I,
                        sendReplyState: _,
                        openTab: function(e) {
                            rf("OpenTab", {
                                tab: e
                            }), e === nd && (0, ng.sendEventWithTarget)("newsOpenContent", "click", {
                                property: j
                            }, ng.targetTypes.WWW), m(null), g(new Set), P(rw), a({
                                tab: e,
                                page: 1,
                                pageToken: null,
                                messageIdx: null,
                                conversationId: null
                            })
                        },
                        openMessage: function(e, t) {
                            return to(function() {
                                return ts(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            if (rf("OpenMessage"), m(rx(e)), g(new Set([e.id])), P(rw), w(nm), F.current = !0, a(O(A({}, r), {
                                                    messageIdx: t,
                                                    conversationId: null
                                                })), e.isRead) return [3, 2];
                                            return d(function(t) {
                                                return null == t ? t : O(A({}, t), {
                                                    collection: t.collection.map(function(t) {
                                                        return t.id === e.id ? O(A({}, t), {
                                                            isRead: !0
                                                        }) : t
                                                    })
                                                })
                                            }), [4, n3([e.id], !0).catch(rk("MarkReadFailed"))];
                                        case 1:
                                            n.sent(), nF(nv), n.label = 2;
                                        case 2:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        backToList: function() {
                            m(null), g(new Set), P(rw), w(nf), F.current = !0, a(O(A({}, r), {
                                messageIdx: null,
                                conversationId: null
                            }))
                        },
                        toggleMessageSelection: function(e) {
                            g(function(t) {
                                var n = new Set(t);
                                return n.has(e) ? n.delete(e) : n.add(e), n
                            })
                        },
                        toggleSelectAll: function() {
                            g(function(e) {
                                return c && e.size !== c.collection.length ? new Set(c.collection.map(function(e) {
                                    return e.id
                                })) : new Set
                            })
                        },
                        markRead: function(e) {
                            return to(function() {
                                var t;
                                return ts(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            if (0 === (t = Y(v)).length) return [2];
                                            return d(function(n) {
                                                return null == n ? n : O(A({}, n), {
                                                    collection: n.collection.map(function(n) {
                                                        return t.includes(n.id) ? O(A({}, n), {
                                                            isRead: e
                                                        }) : n
                                                    })
                                                })
                                            }), g(new Set), [4, n3(t, e).catch(rk("MarkReadFailed"))];
                                        case 1:
                                            return n.sent(), nF(nv), [2]
                                    }
                                })
                            })()
                        },
                        markArchive: function(e) {
                            return to(function() {
                                var t, n;
                                return ts(this, function(i) {
                                    switch (i.label) {
                                        case 0:
                                            if (0 === (t = v.size > 0 ? Y(v) : f ? [f.id] : []).length) return [2];
                                            return n = y === nm, [4, nJ.post(n$(nQ(e ? "/v1/messages/archive" : "/v1/messages/unarchive")), {
                                                messageIds: t
                                            }).finally(n2).catch(rk("ArchiveFailed"))];
                                        case 1:
                                            if (i.sent(), g(new Set), m(null), P(rw), w(nf), !n) return [3, 2];
                                            return a(O(A({}, r), {
                                                messageIdx: null,
                                                conversationId: null
                                            })), [3, 5];
                                        case 2:
                                            if (null == W.current.messageIdx) return [3, 3];
                                            return a(O(A({}, W.current), {
                                                messageIdx: null
                                            }), {
                                                replace: !0
                                            }), [3, 5];
                                        case 3:
                                            return [4, X.current()];
                                        case 4:
                                            i.sent(), i.label = 5;
                                        case 5:
                                            return nF(nv), [2]
                                    }
                                })
                            })()
                        },
                        changePage: function(e) {
                            var t = e.pageNumber,
                                n = e.pageToken;
                            P(rw), a({
                                tab: r.tab,
                                page: t,
                                pageToken: n,
                                messageIdx: null,
                                conversationId: null
                            })
                        },
                        updateReplyContent: function(e) {
                            P(function(t) {
                                return O(A({}, t), {
                                    replyContent: e
                                })
                            })
                        },
                        updateIncludePreviousMessage: function(e) {
                            P(function(t) {
                                return O(A({}, t), {
                                    includePreviousMessage: e
                                })
                            })
                        },
                        sendReply: function() {
                            return to(function() {
                                return ts(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            if (!f || 0 === _.replyContent.length) return [2];
                                            P(function(e) {
                                                return O(A({}, e), {
                                                    isSending: !0
                                                })
                                            }), e.label = 1;
                                        case 1:
                                            return e.trys.push([1, 3, 4, 5]), [4, n4({
                                                subject: f.subject,
                                                body: _.replyContent,
                                                recipientId: f.sender.id,
                                                replyMessageId: f.id,
                                                includePreviousMessage: _.includePreviousMessage
                                            })];
                                        case 2:
                                            return e.sent(), M({
                                                type: "success",
                                                message: t("Message.SendSuccessfully")
                                            }), P(rw), nF("Roblox.Messages.MessageSent"), [3, 5];
                                        case 3:
                                            return M({
                                                type: "warning",
                                                message: rE(e.sent(), t("Message.UnknownError"))
                                            }), [3, 5];
                                        case 4:
                                            return P(function(e) {
                                                return O(A({}, e), {
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
                            M(null)
                        },
                        shouldShowSystemUser: function(e) {
                            return "sent" !== r.tab && 1 === e.sender.id
                        }
                    }
                },
                rC = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                rI = j().forwardRef(function(e, t) {
                    var n = eh([e, t]),
                        r = n[0],
                        a = n.slice(1),
                        i = r.name,
                        o = r.size,
                        s = r.className,
                        l = (r.children, ec(r, ["name", "size", "className", "children"])),
                        u = L(a, 1)[0];
                    return j().createElement("span", A({
                        ref: u,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: ni("grow-0 shrink-0 basis-auto icon", i, rC[void 0 === o ? "Medium" : o], s)
                    }, l))
                });
            rI.displayName = "Icon";
            var rM = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                rA = function(e) {
                    var t = e.className;
                    return j().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: ni("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                rB = "opacity-[0.5]",
                r_ = function(e) {
                    var t = e.width,
                        n = e.height;
                    return j().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: n,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, j().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function rP(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function rH() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map(function(t) {
                            var r = rP(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        });
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : rP(t[e], null)
                        }
                    }
                }
            }

            function rL() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return R.useCallback(rH.apply(void 0, Y(t)), t)
            }
            var rR = Symbol.for("react.lazy"),
                rj = R[" use ".trim().toString()];

            function rO(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : (0, U._)(e)) === "object" && "$$typeof" in e && e.$$typeof === rR && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : (0, U._)(t)) === "object" && null !== t && "then" in t
            }
            var rD = ((e = R.forwardRef(function(e, t) {
                    var n = e.children,
                        r = ec(e, ["children"]);
                    if (rO(n) && "function" == typeof rj && (n = rj(n._payload)), R.isValidElement(n)) {
                        var a, i, o, s, l, u = (l = (s = null == (i = Object.getOwnPropertyDescriptor((a = n).props, "ref")) ? void 0 : i.get) && "isReactWarning" in s && s.isReactWarning) ? a.ref : (l = (s = null == (o = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : o.get) && "isReactWarning" in s && s.isReactWarning) ? a.props.ref : a.props.ref || a.ref,
                            c = function(e, t) {
                                var n = A({}, t);
                                for (var r in t) ! function(r) {
                                    var a = e[r],
                                        i = t[r];
                                    /^on[A-Z]/.test(r) ? a && i ? n[r] = function() {
                                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                        var r = i.apply(void 0, Y(t));
                                        return a.apply(void 0, Y(t)), r
                                    } : a && (n[r] = a) : "style" === r ? n[r] = A({}, a, i) : "className" === r && (n[r] = [a, i].filter(Boolean).join(" "))
                                }(r);
                                return A({}, e, n)
                            }(r, n.props);
                        return n.type !== R.Fragment && (c.ref = t ? rH(t, u) : u), R.cloneElement(n, c)
                    }
                    return R.Children.count(n) > 1 ? R.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), a = e, (i = R.forwardRef(function(e, t) {
                    var n = e.children,
                        r = ec(e, ["children"]);
                    rO(n) && "function" == typeof rj && (n = rj(n._payload));
                    var i = R.Children.toArray(n),
                        o = i.find(rU);
                    if (o) {
                        var s = o.props.children,
                            l = i.map(function(e) {
                                return e !== o ? e : R.Children.count(s) > 1 ? R.Children.only(null) : R.isValidElement(s) ? s.props.children : null
                            });
                        return (0, k.jsx)(a, O(A({}, r), {
                            ref: t,
                            children: R.isValidElement(s) ? R.cloneElement(s, void 0, l) : null
                        }))
                    }
                    return (0, k.jsx)(a, O(A({}, r), {
                        ref: t,
                        children: n
                    }))
                })).displayName = "".concat("Slot", ".Slot"), i),
                rF = Symbol("radix.slottable");

            function rU(e) {
                return R.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === rF
            }
            var rz = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                rV = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                rG = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                rK = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                rX = (0, R.forwardRef)(function(e, t) {
                    var n = eh([e, t]),
                        r = n[0],
                        a = n.slice(1),
                        i = r.children,
                        o = r.className,
                        s = r.style,
                        l = r.isDisabled,
                        u = void 0 !== l && l,
                        c = r.isLoading,
                        d = void 0 !== c && c,
                        h = r.icon,
                        f = r.size,
                        m = void 0 === f ? "Large" : f,
                        p = r.variant,
                        v = void 0 === p ? "Emphasis" : p,
                        g = r.asChild,
                        b = ec(r, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        y = L(a, 1)[0],
                        w = ni("foundation-web-button", u ? rB : [rM, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", rV[m], u ? rK[v] : rG[v], o),
                        x = A({
                            textDecoration: "none"
                        }, s),
                        E = function(e) {
                            return j().createElement(j().Fragment, null, j().createElement(rA, null), d && j().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, j().createElement(r_, {
                                width: rz[m],
                                height: rz[m]
                            })), j().createElement("span", {
                                className: ni("flex items-center min-width-0", "Large" === m || "Medium" === m ? "gap-small" : "gap-xsmall", d && "invisible")
                            }, h && j().createElement(rI, {
                                name: h,
                                size: m
                            }), j().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (g) {
                        b.as;
                        var S = ec(b, ["as"]),
                            N = j().Children.only(i);
                        return j().createElement(rD, O(A({
                            ref: y
                        }, S), {
                            className: w,
                            style: x,
                            "aria-disabled": u || void 0
                        }), j().cloneElement(N, {}, E(N.props.children)))
                    }
                    if ("a" === b.as) {
                        b.as;
                        var k = b.href,
                            T = ec(b, ["as", "href"]);
                        return j().createElement("a", O(A({
                            ref: y
                        }, T), {
                            "aria-disabled": u,
                            href: u ? void 0 : k,
                            className: w,
                            style: x
                        }), E(i))
                    }
                    b.as;
                    var C = ec(b, ["as"]);
                    return j().createElement("button", O(A({
                        ref: y,
                        type: "button"
                    }, C), {
                        disabled: u,
                        className: w,
                        style: x
                    }), E(i))
                }),
                rW = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                rZ = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                rY = function(e) {
                    var t = e.variant,
                        n = e.size,
                        r = e.isCircular,
                        a = e.className,
                        i = ec(e, ["variant", "size", "isCircular", "className"]);
                    return j().createElement("button", A({
                        type: "button",
                        className: ni("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", rM, rZ[t], rW[n], r && "radius-circle", a)
                    }, i), j().createElement(rA, null), j().createElement(rI, {
                        name: "icon-regular-x",
                        size: n
                    }))
                },
                rq = (0, R.forwardRef)(function(e, t) {
                    var n = eh([e, t]),
                        r = n[0],
                        a = n.slice(1),
                        i = r.title,
                        o = r.icon,
                        s = r.actionLabel,
                        l = r.onAction,
                        u = r.actions,
                        c = r.onClose,
                        d = r.closeIconAriaLabel,
                        h = r.shouldAutoDismiss,
                        f = r.autoDismissDurationMs,
                        m = r.className,
                        p = ec(r, ["title", "icon", "actionLabel", "onAction", "actions", "onClose", "closeIconAriaLabel", "shouldAutoDismiss", "autoDismissDurationMs", "className"]),
                        v = L(a, 1)[0],
                        g = L((0, R.useState)("enter"), 2),
                        b = g[0],
                        y = g[1],
                        w = (0, R.useRef)(void 0),
                        x = (0, R.useRef)(void 0),
                        E = (0, R.useRef)(void 0),
                        S = (0, R.useRef)(null),
                        N = null != u ? u : s && l && j().createElement(rX, {
                            size: "Small",
                            variant: "Utility",
                            className: "content-inverse-emphasis",
                            onClick: l,
                            ref: S
                        }, s),
                        k = !!N,
                        T = i.length > 80,
                        C = null == h || h,
                        I = 4e3;
                    k && (I = T ? 1e4 : 7e3);
                    var M = null != f ? f : I,
                        B = (0, R.useCallback)(function() {
                            "exit" !== b && (y("exit"), void 0 !== x.current && (window.clearTimeout(x.current), x.current = void 0), E.current = window.setTimeout(function() {
                                null == c || c()
                            }, 150))
                        }, [c, b]);
                    (0, R.useEffect)(function() {
                        return w.current = window.requestAnimationFrame(function() {
                                y("idle")
                            }),
                            function() {
                                void 0 !== w.current && window.cancelAnimationFrame(w.current)
                            }
                    }, []), (0, R.useEffect)(function() {
                        void 0 !== x.current && (window.clearTimeout(x.current), x.current = void 0), C && "exit" !== b && (x.current = window.setTimeout(function() {
                            B()
                        }, M))
                    }, [M, C, b, B]), (0, R.useEffect)(function() {
                        var e;
                        k && (null == (e = S.current) || e.focus())
                    }, [k]), (0, R.useEffect)(function() {
                        return function() {
                            void 0 !== x.current && window.clearTimeout(x.current), void 0 !== E.current && window.clearTimeout(E.current), void 0 !== w.current && window.cancelAnimationFrame(w.current)
                        }
                    }, []);
                    var _ = {
                            position: "fixed",
                            left: "50%",
                            bottom: "max(var(--padding-xxlarge, 32px), env(safe-area-inset-bottom))",
                            transform: "translate(-50%, ".concat("idle" === b ? "0" : "120%", ")"),
                            zIndex: "var(--foundation-portal-zindex, 9999)"
                        },
                        P = p.style ? A({}, _, p.style) : _;
                    return j().createElement("div", A({
                        ref: v,
                        role: "status",
                        "aria-live": "polite",
                        className: ni("flex items-center gap-xxlarge radius-medium shadow-transient-low bg-inverse-surface-0 padding-x-medium padding-y-medium stroke-standard shrink-0", "max-width-[480px] min-height-[48px]", "min-width-[min(100%-max(2_*_var(--margin-small),env(safe-area-inset-left)+env(safe-area-inset-right)),393px)]", "foundation-web-portal-zindex pointer-events-auto", "exit" === b ? "ease-standard-in" : "ease-standard-out", m),
                        style: O(A({}, P), {
                            transitionDuration: "".concat("exit" === b ? 150 : 200, "ms"),
                            transitionProperty: "transform"
                        })
                    }, p), j().createElement("div", {
                        className: "flex items-center gap-medium grow-1 basis-0 min-h-[40px]"
                    }, o && j().createElement(rI, {
                        name: o,
                        size: "Small",
                        className: "shrink-0 content-inverse-emphasis"
                    }), j().createElement("div", {
                        className: "grow-1 basis-0 text-caption-large content-inverse-emphasis text-truncate-end"
                    }, i)), j().createElement("div", {
                        className: "flex items-center justify-end gap-small shrink-0"
                    }, N, c && j().createElement(rY, {
                        variant: "Utility",
                        size: "Small",
                        isCircular: !0,
                        className: "content-inverse-emphasis",
                        "aria-label": void 0 === d ? "Dismiss snackbar" : d,
                        onClick: B
                    })))
                }),
                rJ = function(e) {
                    var t = e.feedback,
                        n = e.onClose;
                    return t ? (0, k.jsx)(rq, {
                        title: t.message,
                        onClose: n,
                        shouldAutoDismiss: !0
                    }) : null
                },
                rQ = 0,
                r$ = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        t = (0, R.useRef)();
                    return t.current || (rQ += 1, t.current = "".concat(e).concat(rQ)), t.current
                },
                r0 = (0, R.createContext)(null);

            function r1(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    n = [],
                    r = function() {
                        var t = n.map(function(e) {
                            return R.createContext(e)
                        });
                        return function(n) {
                            var r = (null == n ? void 0 : n[e]) || t;
                            return R.useMemo(function() {
                                return M({}, "__scope".concat(e), O(A({}, n), M({}, e, r)))
                            }, [n, r])
                        }
                    };
                return r.scopeName = e, [function(t, r) {
                    var a = R.createContext(r),
                        i = n.length;
                    n = Y(n).concat([r]);
                    var o = function(t) {
                        var n, r = t.scope,
                            o = t.children,
                            s = ec(t, ["scope", "children"]),
                            l = (null == r || null == (n = r[e]) ? void 0 : n[i]) || a,
                            u = R.useMemo(function() {
                                return s
                            }, Object.values(s));
                        return (0, k.jsx)(l.Provider, {
                            value: u,
                            children: o
                        })
                    };
                    return o.displayName = t + "Provider", [o, function(n, o) {
                        var s, l = (null == o || null == (s = o[e]) ? void 0 : s[i]) || a,
                            u = R.useContext(l);
                        if (u) return u;
                        if (void 0 !== r) return r;
                        throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
                    }]
                }, r2.apply(void 0, [r].concat(Y(t)))]
            }

            function r2() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                var r = t[0];
                if (1 === t.length) return r;
                var a = function() {
                    var e = t.map(function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    });
                    return function(t) {
                        var n = e.reduce(function(e, n) {
                            var r = n.useScope,
                                a = n.scopeName;
                            return A({}, e, r(t)["__scope".concat(a)])
                        }, {});
                        return R.useMemo(function() {
                            return M({}, "__scope".concat(r.scopeName), n)
                        }, [n])
                    }
                };
                return a.scopeName = r.scopeName, a
            }

            function r3(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    r = n.checkForDefaultPrevented,
                    a = void 0 === r || r;
                return function(n) {
                    if (null == e || e(n), !1 === a || !n.defaultPrevented) return null == t ? void 0 : t(n)
                }
            }(0, R.createContext)(null), (0, R.createContext)(null), "u" > typeof window && window.document && window.document.createElement;
            var r5 = (null == (S = globalThis) ? void 0 : S.document) ? R.useLayoutEffect : function() {},
                r4 = R[" useInsertionEffect ".trim().toString()] || r5;

            function r6(e) {
                var t, n, r, a, i, o, s, l, u = e.prop,
                    c = e.defaultProp,
                    d = e.onChange,
                    h = e.caller,
                    f = L((n = (t = {
                        defaultProp: c,
                        onChange: void 0 === d ? function() {} : d
                    }).defaultProp, r = t.onChange, i = (a = L(R.useState(n), 2))[0], o = a[1], s = R.useRef(i), l = R.useRef(r), r4(function() {
                        l.current = r
                    }, [r]), R.useEffect(function() {
                        if (s.current !== i) {
                            var e;
                            null == (e = l.current) || e.call(l, i), s.current = i
                        }
                    }, [i, s]), [i, o, l]), 3),
                    m = f[0],
                    p = f[1],
                    v = f[2],
                    g = void 0 !== u,
                    b = g ? u : m,
                    y = R.useRef(void 0 !== u);
                return R.useEffect(function() {
                    var e = y.current;
                    if (e !== g) {
                        var t = g ? "controlled" : "uncontrolled";
                        console.warn("".concat(h, " is changing from ").concat(e ? "controlled" : "uncontrolled", " to ").concat(t, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                    }
                    y.current = g
                }, [g, h]), [b, R.useCallback(function(e) {
                    if (g) {
                        var t, n = "function" == typeof e ? e(u) : e;
                        n !== u && (null == (t = v.current) || t.call(v, n))
                    } else p(e)
                }, [g, u, p, v])]
            }
            Symbol("RADIX:SYNC_STATE");
            var r8 = function(e) {
                var t, n, r, a, i, o, s, l, u, c, d, h, f, m, p, v, g, b = e.present,
                    y = e.children,
                    w = (t = b, i = (a = L(R.useState(), 2))[0], o = a[1], s = R.useRef(null), l = R.useRef(t), u = R.useRef("none"), d = (c = L((n = t ? "mounted" : "unmounted", r = {
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
                    }, R.useReducer(function(e, t) {
                        var n = r[e][t];
                        return null != n ? n : e
                    }, n)), 2))[0], h = c[1], R.useEffect(function() {
                        var e = r7(s.current);
                        u.current = "mounted" === d ? e : "none"
                    }, [d]), r5(function() {
                        var e = s.current,
                            n = l.current;
                        if (n !== t) {
                            var r = u.current,
                                a = r7(e);
                            t ? h("MOUNT") : "none" === a || (null == e ? void 0 : e.display) === "none" ? h("UNMOUNT") : n && r !== a ? h("ANIMATION_OUT") : h("UNMOUNT"), l.current = t
                        }
                    }, [t, h]), r5(function() {
                        if (i) {
                            var e, t, n = null != (e = i.ownerDocument.defaultView) ? e : window,
                                r = function(e) {
                                    var r = r7(s.current).includes(CSS.escape(e.animationName));
                                    if (e.target === i && r && (h("ANIMATION_END"), !l.current)) {
                                        var a = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", t = n.setTimeout(function() {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = a)
                                        })
                                    }
                                },
                                a = function(e) {
                                    e.target === i && (u.current = r7(s.current))
                                };
                            return i.addEventListener("animationstart", a), i.addEventListener("animationcancel", r), i.addEventListener("animationend", r),
                                function() {
                                    n.clearTimeout(t), i.removeEventListener("animationstart", a), i.removeEventListener("animationcancel", r), i.removeEventListener("animationend", r)
                                }
                        }
                        h("ANIMATION_END")
                    }, [i, h]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: R.useCallback(function(e) {
                            s.current = e ? getComputedStyle(e) : null, o(e)
                        }, [])
                    }),
                    x = "function" == typeof y ? y({
                        present: w.isPresent
                    }) : R.Children.only(y),
                    E = rL(w.ref, (g = (v = null == (m = Object.getOwnPropertyDescriptor((f = x).props, "ref")) ? void 0 : m.get) && "isReactWarning" in v && v.isReactWarning) ? f.ref : (g = (v = null == (p = Object.getOwnPropertyDescriptor(f, "ref")) ? void 0 : p.get) && "isReactWarning" in v && v.isReactWarning) ? f.props.ref : f.props.ref || f.ref);
                return "function" == typeof y || w.isPresent ? R.cloneElement(x, {
                    ref: E
                }) : null
            };

            function r7(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function r9(e) {
                var t, n, r = (t = e, (n = R.forwardRef(function(e, t) {
                        var n = e.children,
                            r = ec(e, ["children"]);
                        if (R.isValidElement(n)) {
                            var a, i, o, s, l, u = (l = (s = null == (i = Object.getOwnPropertyDescriptor((a = n).props, "ref")) ? void 0 : i.get) && "isReactWarning" in s && s.isReactWarning) ? a.ref : (l = (s = null == (o = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : o.get) && "isReactWarning" in s && s.isReactWarning) ? a.props.ref : a.props.ref || a.ref,
                                c = function(e, t) {
                                    var n = A({}, t);
                                    for (var r in t) ! function(r) {
                                        var a = e[r],
                                            i = t[r];
                                        /^on[A-Z]/.test(r) ? a && i ? n[r] = function() {
                                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                            var r = i.apply(void 0, Y(t));
                                            return a.apply(void 0, Y(t)), r
                                        } : a && (n[r] = a) : "style" === r ? n[r] = A({}, a, i) : "className" === r && (n[r] = [a, i].filter(Boolean).join(" "))
                                    }(r);
                                    return A({}, e, n)
                                }(r, n.props);
                            return n.type !== R.Fragment && (c.ref = t ? rH(t, u) : u), R.cloneElement(n, c)
                        }
                        return R.Children.count(n) > 1 ? R.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), n),
                    a = R.forwardRef(function(e, t) {
                        var n = e.children,
                            a = ec(e, ["children"]),
                            i = R.Children.toArray(n),
                            o = i.find(at);
                        if (o) {
                            var s = o.props.children,
                                l = i.map(function(e) {
                                    return e !== o ? e : R.Children.count(s) > 1 ? R.Children.only(null) : R.isValidElement(s) ? s.props.children : null
                                });
                            return (0, k.jsx)(r, O(A({}, a), {
                                ref: t,
                                children: R.isValidElement(s) ? R.cloneElement(s, void 0, l) : null
                            }))
                        }
                        return (0, k.jsx)(r, O(A({}, a), {
                            ref: t,
                            children: n
                        }))
                    });
                return a.displayName = "".concat(e, ".Slot"), a
            }
            r8.displayName = "Presence", window.ReactDOM;
            var ae = Symbol("radix.slottable");

            function at(e) {
                return R.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === ae
            }
            var an = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                    var n = r9("Primitive.".concat(t)),
                        r = R.forwardRef(function(e, r) {
                            var a = e.asChild,
                                i = ec(e, ["asChild"]),
                                o = a ? n : t;
                            return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, k.jsx)(o, O(A({}, i), {
                                ref: r
                            }))
                        });
                    return r.displayName = "Primitive.".concat(t), O(A({}, e), M({}, t, r))
                }, {}),
                ar = "Checkbox",
                aa = L(r1(ar), 2),
                ai = aa[0];
            aa[1];
            var ao = L(ai(ar), 2),
                as = ao[0],
                al = ao[1];

            function au(e) {
                var t = e.__scopeCheckbox,
                    n = e.checked,
                    r = e.children,
                    a = e.defaultChecked,
                    i = e.disabled,
                    o = e.form,
                    s = e.name,
                    l = e.onCheckedChange,
                    u = e.required,
                    c = e.value,
                    d = e.internal_do_not_use_render,
                    h = L(r6({
                        prop: n,
                        defaultProp: null != a && a,
                        onChange: l,
                        caller: ar
                    }), 2),
                    f = h[0],
                    m = h[1],
                    p = L(R.useState(null), 2),
                    v = p[0],
                    g = p[1],
                    b = L(R.useState(null), 2),
                    y = b[0],
                    w = b[1],
                    x = R.useRef(!1),
                    E = !v || !!o || !!v.closest("form"),
                    S = {
                        checked: f,
                        disabled: i,
                        setChecked: m,
                        control: v,
                        setControl: g,
                        name: s,
                        form: o,
                        value: void 0 === c ? "on" : c,
                        hasConsumerStoppedPropagationRef: x,
                        required: u,
                        defaultChecked: !ag(a) && a,
                        isFormControl: E,
                        bubbleInput: y,
                        setBubbleInput: w
                    };
                return (0, k.jsx)(as, O(A({
                    scope: t
                }, S), {
                    children: "function" == typeof d ? d(S) : r
                }))
            }
            var ac = "CheckboxTrigger",
                ad = R.forwardRef(function(e, t) {
                    var n = eh([e, t]),
                        r = n[0],
                        a = n.slice(1),
                        i = r.__scopeCheckbox,
                        o = r.onKeyDown,
                        s = r.onClick,
                        l = ec(r, ["__scopeCheckbox", "onKeyDown", "onClick"]),
                        u = L(a, 1)[0],
                        c = al(ac, i),
                        d = c.control,
                        h = c.value,
                        f = c.disabled,
                        m = c.checked,
                        p = c.required,
                        v = c.setControl,
                        g = c.setChecked,
                        b = c.hasConsumerStoppedPropagationRef,
                        y = c.isFormControl,
                        w = c.bubbleInput,
                        x = rL(u, v),
                        E = R.useRef(m);
                    return R.useEffect(function() {
                        var e = null == d ? void 0 : d.form;
                        if (e) {
                            var t = function() {
                                return g(E.current)
                            };
                            return e.addEventListener("reset", t),
                                function() {
                                    return e.removeEventListener("reset", t)
                                }
                        }
                    }, [d, g]), (0, k.jsx)(an.button, O(A({
                        type: "button",
                        role: "checkbox",
                        "aria-checked": ag(m) ? "mixed" : m,
                        "aria-required": p,
                        "data-state": ab(m),
                        "data-disabled": f ? "" : void 0,
                        disabled: f,
                        value: h
                    }, l), {
                        ref: x,
                        onKeyDown: r3(o, function(e) {
                            "Enter" === e.key && e.preventDefault()
                        }),
                        onClick: r3(s, function(e) {
                            g(function(e) {
                                return !!ag(e) || !e
                            }), w && y && (b.current = e.isPropagationStopped(), b.current || e.stopPropagation())
                        })
                    }))
                });
            ad.displayName = ac;
            var ah = R.forwardRef(function(e, t) {
                var n = e.__scopeCheckbox,
                    r = e.name,
                    a = e.checked,
                    i = e.defaultChecked,
                    o = e.required,
                    s = e.disabled,
                    l = e.value,
                    u = e.onCheckedChange,
                    c = e.form,
                    d = ec(e, ["__scopeCheckbox", "name", "checked", "defaultChecked", "required", "disabled", "value", "onCheckedChange", "form"]);
                return (0, k.jsx)(au, {
                    __scopeCheckbox: n,
                    checked: a,
                    defaultChecked: i,
                    disabled: s,
                    required: o,
                    onCheckedChange: u,
                    name: r,
                    form: c,
                    value: l,
                    internal_do_not_use_render: function(e) {
                        var r = e.isFormControl;
                        return (0, k.jsxs)(k.Fragment, {
                            children: [(0, k.jsx)(ad, O(A({}, d), {
                                ref: t,
                                __scopeCheckbox: n
                            })), r && (0, k.jsx)(av, {
                                __scopeCheckbox: n
                            })]
                        })
                    }
                })
            });
            ah.displayName = ar;
            var af = "CheckboxIndicator",
                am = R.forwardRef(function(e, t) {
                    var n = e.__scopeCheckbox,
                        r = e.forceMount,
                        a = ec(e, ["__scopeCheckbox", "forceMount"]),
                        i = al(af, n);
                    return (0, k.jsx)(r8, {
                        present: r || ag(i.checked) || !0 === i.checked,
                        children: (0, k.jsx)(an.span, O(A({
                            "data-state": ab(i.checked),
                            "data-disabled": i.disabled ? "" : void 0
                        }, a), {
                            ref: t,
                            style: A({
                                pointerEvents: "none"
                            }, e.style)
                        }))
                    })
                });
            am.displayName = af;
            var ap = "CheckboxBubbleInput",
                av = R.forwardRef(function(e, t) {
                    var n, r, a, i, o = eh([e, t]),
                        s = o[0],
                        l = o.slice(1),
                        u = s.__scopeCheckbox,
                        c = ec(s, ["__scopeCheckbox"]),
                        d = L(l, 1)[0],
                        h = al(ap, u),
                        f = h.control,
                        m = h.hasConsumerStoppedPropagationRef,
                        p = h.checked,
                        v = h.defaultChecked,
                        g = h.required,
                        b = h.disabled,
                        y = h.name,
                        w = h.value,
                        x = h.form,
                        E = h.bubbleInput,
                        S = rL(d, h.setBubbleInput),
                        N = (n = R.useRef({
                            value: p,
                            previous: p
                        }), R.useMemo(function() {
                            return n.current.value !== p && (n.current.previous = n.current.value, n.current.value = p), n.current.previous
                        }, [p])),
                        T = (a = (r = L(R.useState(void 0), 2))[0], i = r[1], r5(function() {
                            if (f) {
                                i({
                                    width: f.offsetWidth,
                                    height: f.offsetHeight
                                });
                                var e = new ResizeObserver(function(e) {
                                    if (Array.isArray(e) && e.length) {
                                        var t, n, r = e[0];
                                        if ("borderBoxSize" in r) {
                                            var a = r.borderBoxSize,
                                                o = Array.isArray(a) ? a[0] : a;
                                            t = o.inlineSize, n = o.blockSize
                                        } else t = f.offsetWidth, n = f.offsetHeight;
                                        i({
                                            width: t,
                                            height: n
                                        })
                                    }
                                });
                                return e.observe(f, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return e.unobserve(f)
                                    }
                            }
                            i(void 0)
                        }, [f]), a);
                    R.useEffect(function() {
                        if (E) {
                            var e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                                t = !m.current;
                            if (N !== p && e) {
                                var n = new Event("click", {
                                    bubbles: t
                                });
                                E.indeterminate = ag(p), e.call(E, !ag(p) && p), E.dispatchEvent(n)
                            }
                        }
                    }, [E, N, p, m]);
                    var C = R.useRef(!ag(p) && p);
                    return (0, k.jsx)(an.input, O(A({
                        type: "checkbox",
                        "aria-hidden": !0,
                        defaultChecked: null != v ? v : C.current,
                        required: g,
                        disabled: b,
                        name: y,
                        value: w,
                        form: x
                    }, c), {
                        tabIndex: -1,
                        ref: S,
                        style: O(A({}, c.style, T), {
                            position: "absolute",
                            pointerEvents: "none",
                            opacity: 0,
                            margin: 0,
                            transform: "translateX(-100%)"
                        })
                    }))
                });

            function ag(e) {
                return "indeterminate" === e
            }

            function ab(e) {
                return ag(e) ? "indeterminate" : e ? "checked" : "unchecked"
            }
            av.displayName = ap;
            var ay = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-600"
                },
                aw = {
                    XSmall: "",
                    Small: "",
                    Medium: "",
                    Large: "padding-y-xxsmall"
                },
                ax = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                aE = {
                    XSmall: "",
                    Small: "padding-top-xxsmall",
                    Medium: "padding-top-xxsmall",
                    Large: "padding-top-xxsmall"
                },
                aS = function(e) {
                    var t, n, r, a, i = e.label,
                        o = e.className,
                        s = e.isChecked,
                        l = e.isDisabled,
                        u = e.size,
                        c = e.hint,
                        d = e.placement,
                        h = e.onCheckedChange,
                        f = e.id,
                        m = e["aria-describedby"],
                        p = ec(e, ["label", "className", "isChecked", "isDisabled", "size", "hint", "placement", "onCheckedChange", "id", "aria-describedby"]),
                        v = (0, R.useContext)(r0),
                        g = null != (t = null != (n = null == v ? void 0 : v.size) ? n : u) ? t : "Medium",
                        b = null != (r = null != (a = null == v ? void 0 : v.placement) ? a : d) ? r : "Start",
                        y = l || (null == v ? void 0 : v.isDisabled),
                        w = r$(),
                        x = f || w,
                        E = v && i && c ? "".concat(x, "Hint") : void 0,
                        S = i && j().createElement("label", {
                            htmlFor: x,
                            className: ni("flex flex-col grow-1 gap-xsmall", !y && "cursor-pointer")
                        }, j().createElement("span", {
                            className: ni(ax[g], aE[g], "content-emphasis")
                        }, i), c && j().createElement("span", {
                            id: E,
                            className: ni(v ? ax[g] : "text-body-medium", "content-default")
                        }, c));
                    return j().createElement("div", {
                        className: ni("foundation-web-checkbox flex gap-medium", y && "opacity-[0.5]", !y && "cursor-pointer", o)
                    }, "End" === b && S, j().createElement("div", {
                        className: ni(aw[g])
                    }, j().createElement(ah, A({
                        "data-slot": "checkbox",
                        className: ni(ay[g], rM, !y && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
                        id: x,
                        checked: s,
                        disabled: y,
                        onCheckedChange: h,
                        "aria-label": i,
                        "aria-describedby": [m, E].filter(Boolean).join(" ") || void 0
                    }, p), j().createElement(rA, null), j().createElement(am, {
                        "data-slot": "checkbox-indicator",
                        className: ni(ay[g], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
                    }))), "Start" === b && S)
                },
                aN = function(e) {
                    var t = e.className,
                        n = e.children;
                    return (0, k.jsx)("div", {
                        className: t,
                        onClick: function(e) {
                            e.stopPropagation()
                        },
                        children: n
                    })
                },
                ak = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                aT = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                aC = {
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
                aI = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                aM = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                aA = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                aB = {
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
                a_ = {
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
                aP = (0, R.forwardRef)(function(e, t) {
                    var n, r = eh([e, t]),
                        a = r[0],
                        i = r.slice(1),
                        o = a.className,
                        s = a.icon,
                        l = a.ariaLabel,
                        u = a.isDisabled,
                        c = void 0 !== u && u,
                        d = a.isCircular,
                        h = a.isSelected,
                        f = a.size,
                        m = void 0 === f ? "Large" : f,
                        p = a.variant,
                        v = void 0 === p ? "Emphasis" : p,
                        g = a.iconColor,
                        b = void 0 === g ? "Default" : g,
                        y = a.asChild,
                        w = a.children,
                        x = ec(a, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]),
                        E = L(i, 1)[0];
                    n = c ? aM[v] : void 0 !== h && h ? aA[v] : aI[v];
                    var S = ni("foundation-web-icon-button", c ? rB : [rM, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", ak[m], aC[m][void 0 !== d && d ? "circular" : "square"], n, o),
                        N = j().createElement(j().Fragment, null, j().createElement(rA, null), j().createElement("span", {
                            className: ni("icon", s, aT[m], c ? a_[b][v] : aB[b][v])
                        }));
                    if (y) {
                        x.as;
                        var k = ec(x, ["as"]),
                            T = j().Children.only(w);
                        return j().createElement(rD, O(A({
                            ref: E
                        }, k), {
                            className: S,
                            "aria-label": l,
                            "aria-disabled": c || void 0
                        }), j().cloneElement(T, {}, N))
                    }
                    if ("a" === x.as) {
                        x.as;
                        var C = x.href,
                            I = ec(x, ["as", "href"]);
                        return j().createElement("a", O(A({
                            ref: E
                        }, I), {
                            "aria-label": l,
                            "aria-disabled": c,
                            href: c ? void 0 : C,
                            className: S
                        }), N)
                    }
                    x.as;
                    var M = ec(x, ["as"]);
                    return j().createElement("button", O(A({
                        ref: E,
                        type: "button"
                    }, M), {
                        "aria-label": l,
                        disabled: c,
                        className: S
                    }), N)
                }),
                aH = function(e) {
                    var t = e.icon,
                        n = e.ariaLabel,
                        r = e.target,
                        a = e.onChangePage;
                    return (0, k.jsx)(aP, {
                        icon: t,
                        variant: "Utility",
                        size: "Medium",
                        isDisabled: null == r,
                        ariaLabel: n,
                        onClick: function() {
                            null != r && a(r)
                        }
                    })
                },
                aL = function(e) {
                    var t = e.translate,
                        n = e.currentPage,
                        r = e.totalPages,
                        a = e.onChangePage;
                    if (r <= 1) return null;
                    var i = function(e) {
                            return {
                                pageNumber: e,
                                pageToken: null
                            }
                        },
                        o = n > 1,
                        s = n < r;
                    return (0, k.jsxs)("div", {
                        className: "flex items-center gap-xsmall justify-end",
                        children: [(0, k.jsx)(aH, {
                            icon: "icon-filled-chevron-large-left-to-line",
                            ariaLabel: t("Action.FirstPage"),
                            target: o ? i(1) : null,
                            onChangePage: a
                        }), (0, k.jsx)(aH, {
                            icon: "icon-filled-chevron-large-left",
                            ariaLabel: t("Action.Previous"),
                            target: o ? i(n - 1) : null,
                            onChangePage: a
                        }), (0, k.jsxs)("span", {
                            className: "text-body-large content-muted padding-x-small",
                            children: [n, " / ", r]
                        }), (0, k.jsx)(aH, {
                            icon: "icon-filled-chevron-large-right",
                            ariaLabel: t("Action.Next"),
                            target: s ? i(n + 1) : null,
                            onChangePage: a
                        }), (0, k.jsx)(aH, {
                            icon: "icon-filled-chevron-large-right-to-line",
                            ariaLabel: t("Action.LastPage"),
                            target: s ? i(r) : null,
                            onChangePage: a
                        })]
                    })
                },
                aR = function(e) {
                    var t = e.translate,
                        n = e.pageNumber,
                        r = e.pageWindow,
                        a = e.firstPageToken,
                        i = e.hasMore,
                        o = e.onChangePage,
                        s = function(e) {
                            var t = r.find(function(t) {
                                return t.pageNumber === e
                            });
                            return t ? {
                                pageNumber: t.pageNumber,
                                pageToken: t.pageToken
                            } : null
                        },
                        l = n > 1 ? s(n - 1) : null,
                        u = i ? s(n + 1) : null;
                    return n <= 1 && null == u ? null : (0, k.jsxs)("div", {
                        className: "flex items-center gap-xsmall justify-end",
                        children: [(0, k.jsx)(aH, {
                            icon: "icon-filled-chevron-large-left-to-line",
                            ariaLabel: t("Action.FirstPage"),
                            target: n > 1 ? {
                                pageNumber: 1,
                                pageToken: a
                            } : null,
                            onChangePage: o
                        }), (0, k.jsx)(aH, {
                            icon: "icon-filled-chevron-large-left",
                            ariaLabel: t("Action.Previous"),
                            target: l,
                            onChangePage: o
                        }), r.map(function(e) {
                            var t = e.pageNumber === n;
                            return (0, k.jsx)(rX, {
                                variant: t ? "SoftEmphasis" : "Utility",
                                size: "Medium",
                                "aria-current": t ? "page" : void 0,
                                onClick: function() {
                                    t || o({
                                        pageNumber: e.pageNumber,
                                        pageToken: e.pageToken
                                    })
                                },
                                children: e.pageNumber
                            }, e.pageNumber)
                        }), (0, k.jsx)(aH, {
                            icon: "icon-filled-chevron-large-right",
                            ariaLabel: t("Action.Next"),
                            target: u,
                            onChangePage: o
                        })]
                    })
                },
                aj = function(e) {
                    var t = e.translate,
                        n = e.pagination,
                        r = e.onChangePage;
                    return "cursor" === n.kind ? (0, k.jsx)(aR, {
                        translate: t,
                        pageNumber: n.pageNumber,
                        pageWindow: n.pageWindow,
                        firstPageToken: n.firstPageToken,
                        hasMore: n.hasMore,
                        onChangePage: r
                    }) : (0, k.jsx)(aL, {
                        translate: t,
                        currentPage: n.currentPage,
                        totalPages: n.totalPages,
                        onChangePage: r
                    })
                },
                aO = function(e) {
                    var t = e.translate,
                        n = e.activeTab,
                        r = e.moduleState,
                        a = e.selectedCount,
                        i = e.totalCount,
                        o = e.pagination,
                        s = e.onToggleSelectAll,
                        l = e.onMarkArchive,
                        u = e.onMarkRead,
                        c = e.onBack,
                        d = e.onChangePage,
                        h = n === nu,
                        f = n === nh;
                    return n === nc || n === nd ? r === nf ? (0, k.jsx)("div", {
                        className: "flex justify-end margin-y-medium",
                        children: (0, k.jsx)(aj, {
                            translate: t,
                            pagination: o,
                            onChangePage: d
                        })
                    }) : (0, k.jsx)("div", {
                        className: "margin-y-medium",
                        children: (0, k.jsx)(rX, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: c,
                            children: t("Action.Back")
                        })
                    }) : r === nm ? (0, k.jsxs)("div", {
                        className: "flex items-center gap-small margin-y-medium",
                        children: [(0, k.jsx)(rX, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: c,
                            children: t("Action.Back")
                        }), h ? (0, k.jsx)(rX, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: function() {
                                l(!0)
                            },
                            children: t("Action.Archive")
                        }) : null, f ? (0, k.jsx)(rX, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: function() {
                                l(!1)
                            },
                            children: t("Action.MoveToInbox")
                        }) : null]
                    }) : (0, k.jsxs)("div", {
                        className: "flex items-center justify-between gap-medium margin-y-medium wrap",
                        children: [(0, k.jsxs)("div", {
                            className: "flex items-center gap-small wrap",
                            children: [(0, k.jsx)(aN, {
                                className: "padding-left-large",
                                children: (0, k.jsx)(aS, {
                                    label: t("Label.All"),
                                    size: "Medium",
                                    placement: "Start",
                                    isChecked: i > 0 && a === i,
                                    onCheckedChange: s
                                })
                            }), (0, k.jsxs)("div", {
                                className: "private-message-action-buttons flex items-center gap-small wrap",
                                children: [h ? (0, k.jsx)(rX, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        l(!0)
                                    },
                                    children: t("Action.Archive")
                                }) : null, f ? (0, k.jsx)(rX, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        l(!1)
                                    },
                                    children: t("Action.MoveToInbox")
                                }) : null, (0, k.jsx)(rX, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        u(!0)
                                    },
                                    children: t("Action.MarkAsRead")
                                }), (0, k.jsx)(rX, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        u(!1)
                                    },
                                    children: t("Action.MarkAsUnread")
                                })]
                            })]
                        }), (0, k.jsx)(aj, {
                            translate: t,
                            pagination: o,
                            onChangePage: d
                        })]
                    })
                },
                aD = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                aF = j().forwardRef(function(e, t) {
                    var n = eh([e, t]),
                        r = n[0],
                        a = n.slice(1),
                        i = r.name,
                        o = r.size,
                        s = r.className,
                        l = (r.children, ec(r, ["name", "size", "className", "children"])),
                        u = L(a, 1)[0];
                    return j().createElement("span", A({
                        ref: u,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: ni("grow-0 shrink-0 basis-auto icon", i, aD[void 0 === o ? "Medium" : o], s)
                    }, l))
                });
            aF.displayName = "Icon";
            var aU = function(e) {
                    var t = e.titleText,
                        n = e.size,
                        r = void 0 === n ? "XSmall" : n,
                        a = e.className;
                    return (0, k.jsxs)("span", {
                        className: ni("relative inline-flex items-center justify-center", a),
                        role: "img",
                        "aria-label": t,
                        title: t,
                        children: [(0, k.jsx)(aF, {
                            name: "icon-filled-verified-backplate",
                            className: "content-system-emphasis",
                            size: r
                        }), (0, k.jsx)(aF, {
                            name: "icon-filled-verified-check",
                            className: "absolute content-[white]",
                            size: r
                        })]
                    })
                },
                az = n(611),
                aV = n.n(az),
                aG = function(e) {
                    return "string" == typeof e ? e : e.src
                },
                aK = function(e) {
                    var t = e.className;
                    return (0, k.jsxs)("span", {
                        "aria-hidden": "true",
                        className: aV()("flex items-center justify-center", t),
                        children: [(0, k.jsx)("img", {
                            alt: "",
                            src: aG("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1NiIgaGVpZ2h0PSI1NiIgZmlsbD0ibm9uZSIgdmlld0JveD0iMCAwIDU2IDU2Ij48cGF0aCBmaWxsPSIjMzkzYjNkIiBkPSJNMTEuNjc2IDAgMCA0NC4xNjYgNDMuNTc3IDU2bDExLjY3Ni00NC4xNjZ6bTIwLjQwOSAzNS44MjctMTIuMTc3LTMuMzA4IDMuMjY0LTEyLjM0MiAxMi4xODIgMy4zMDh6Ii8+PC9zdmc+"),
                            className: "dark:hidden",
                            style: {
                                width: "100%",
                                height: "100%"
                            }
                        }), (0, k.jsx)("img", {
                            alt: "",
                            src: aG("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1NiIgaGVpZ2h0PSI1NiIgZmlsbD0ibm9uZSIgdmlld0JveD0iMCAwIDU2IDU2Ij48cGF0aCBmaWxsPSIjZmZmIiBkPSJNMTEuNjc2IDAgMCA0NC4xNjYgNDMuNTc3IDU2bDExLjY3Ni00NC4xNjZ6bTIwLjQwOSAzNS44MjctMTIuMTc3LTMuMzA4IDMuMjY0LTEyLjM0MiAxMi4xODIgMy4zMDh6Ii8+PC9zdmc+"),
                            className: "hidden dark:block",
                            style: {
                                width: "100%",
                                height: "100%"
                            }
                        })]
                    })
                },
                aX = function(e) {
                    var t = e.message,
                        n = e.activeTab,
                        r = e.renderThumbnail,
                        a = n === nc ? t.recipient : t.sender,
                        i = n !== nc && 1 === t.sender.id;
                    return (0, k.jsx)("a", {
                        href: a.profileLink,
                        className: "size-800 shrink-0 flex items-center justify-center",
                        children: i ? (0, k.jsx)(aK, {
                            className: "size-800"
                        }) : (0, k.jsx)("span", {
                            className: "radius-circle clip size-800",
                            children: r({
                                userId: a.id,
                                altName: a.displayName
                            })
                        })
                    })
                },
                aW = function(e) {
                    var t = e.translate,
                        n = e.renderThumbnail,
                        r = e.formatDetailDate,
                        a = e.message,
                        i = e.activeTab;
                    if (!a) return null;
                    var o = i === nc ? a.recipient : a.sender;
                    return (0, k.jsxs)("div", {
                        className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large",
                        children: [(0, k.jsxs)("div", {
                            className: "flex justify-between gap-medium",
                            children: [(0, k.jsxs)("div", {
                                className: "min-width-0",
                                children: [(0, k.jsx)("h2", {
                                    className: "text-heading-medium content-emphasis margin-none text-wrap",
                                    children: a.subject
                                }), (0, k.jsxs)("div", {
                                    className: "flex gap-small margin-top-medium",
                                    children: [(0, k.jsx)(aX, {
                                        message: a,
                                        activeTab: i,
                                        renderThumbnail: n
                                    }), (0, k.jsxs)("div", {
                                        className: "min-width-0 flex flex-col gap-y-small",
                                        children: [(0, k.jsxs)("a", {
                                            href: o.profileLink,
                                            className: "text-title-medium content-emphasis flex items-center gap-xsmall",
                                            children: [(0, k.jsx)("span", {
                                                children: o.displayName
                                            }), o.hasVerifiedBadge ? (0, k.jsx)(aU, {
                                                size: "Medium",
                                                titleText: t("Creator.VerifiedBadgeIconAccessibilityText")
                                            }) : null]
                                        }), (0, k.jsxs)("div", {
                                            className: "text-body-medium content-muted",
                                            children: ["@", o.name]
                                        }), (0, k.jsx)("div", {
                                            className: "text-caption-medium content-muted",
                                            children: r(a.created)
                                        })]
                                    })]
                                })]
                            }), a.isReportAbuseDisplayed ? (0, k.jsx)("a", {
                                href: a.abuseReportUrl,
                                className: "text-body-medium content-muted text-no-wrap abuse-report-modal",
                                children: t("Action.ReportAbuse")
                            }) : null]
                        }), (0, k.jsx)("div", {
                            className: "private-message-body text-body-large content-default margin-top-large",
                            dangerouslySetInnerHTML: {
                                __html: a.body
                            }
                        })]
                    })
                },
                aZ = function(e) {
                    var t = e.translate,
                        n = e.message,
                        r = e.activeTab,
                        a = e.isUnread,
                        i = r === nc ? n.recipient : n.sender;
                    return (0, k.jsxs)("span", {
                        className: "flex items-center gap-xsmall text-truncate-end",
                        children: [(0, k.jsx)("span", {
                            className: aV()("text-truncate-end text-title-large", a ? "content-emphasis" : "content-muted"),
                            children: i.displayName
                        }), i.hasVerifiedBadge ? (0, k.jsx)(aU, {
                            size: "Medium",
                            titleText: t("Creator.VerifiedBadgeIconAccessibilityText")
                        }) : null, (0, k.jsxs)("span", {
                            className: "text-truncate-end text-body-medium content-muted",
                            children: ["@", i.name]
                        })]
                    })
                },
                aY = function(e) {
                    var t = e.message,
                        n = e.activeTab,
                        r = e.renderThumbnail,
                        a = e.onOpen,
                        i = n === nc ? t.recipient : t.sender,
                        o = n !== nc && 1 === t.sender.id;
                    return (0, k.jsx)("button", {
                        type: "button",
                        className: "private-message-row-avatar bg-none stroke-none padding-none width-full size-800 flex items-center justify-center",
                        onClick: a,
                        "aria-label": i.displayName,
                        children: o ? (0, k.jsx)(aK, {
                            className: "size-700"
                        }) : (0, k.jsx)("span", {
                            className: "radius-circle clip size-700",
                            children: r({
                                userId: i.id,
                                altName: i.displayName
                            })
                        })
                    })
                },
                aq = function(e) {
                    var t = e.translate,
                        n = e.renderThumbnail,
                        r = e.formatListDate,
                        a = e.message,
                        i = e.index,
                        o = e.activeTab,
                        s = e.isSelected,
                        l = e.isSelectable,
                        u = e.onToggleSelection,
                        c = e.onOpen,
                        d = function() {
                            c(a, i)
                        },
                        h = !a.isRead && o !== nc;
                    return (0, k.jsxs)("div", {
                        className: aV()("private-message-row grid items-center gap-medium padding-large stroke-bottom stroke-muted transition-colors", h ? "bg-surface-200 hover:bg-surface-300" : "bg-surface-100 hover:bg-surface-300"),
                        children: [(0, k.jsx)(aN, {
                            className: aV()(!l && "invisible"),
                            children: (0, k.jsx)(aS, {
                                "aria-label": a.subject,
                                size: "Medium",
                                placement: "Start",
                                isChecked: s,
                                onCheckedChange: function() {
                                    u(a.id)
                                }
                            })
                        }), (0, k.jsx)(aY, {
                            message: a,
                            activeTab: o,
                            renderThumbnail: n,
                            onOpen: d
                        }), (0, k.jsxs)("button", {
                            type: "button",
                            className: "bg-none stroke-none padding-none flex flex-col gap-y-small",
                            onClick: d,
                            "aria-label": a.subject,
                            children: [(0, k.jsxs)("div", {
                                className: "flex items-center justify-between gap-small text-no-wrap",
                                children: [(0, k.jsx)(aZ, {
                                    translate: t,
                                    message: a,
                                    activeTab: o,
                                    isUnread: h
                                }), (0, k.jsx)("span", {
                                    className: "text-caption-medium content-muted",
                                    children: r(a.created)
                                })]
                            }), (0, k.jsx)("div", {
                                className: "flex text-no-wrap",
                                children: (0, k.jsxs)("span", {
                                    className: "text-truncate-end text-body-large content-muted",
                                    children: [(0, k.jsx)("span", {
                                        className: h ? "content-emphasis" : "content-muted",
                                        children: a.subject
                                    }), " - ", nR(a.body)]
                                })
                            })]
                        })]
                    })
                },
                aJ = (M(N = {}, nu, "Label.NoMessagesInInbox"), M(N, nc, "Label.NoSentMessages"), M(N, nd, "Message.NoNews"), M(N, nh, "Label.NoMessagesInArchive"), N),
                aQ = function(e) {
                    var t, n = e.translate,
                        r = e.renderThumbnail,
                        a = e.formatListDate,
                        i = e.page,
                        o = e.activeTab,
                        s = e.selectedMessageIds,
                        l = e.onToggleSelection,
                        u = e.onOpenMessage,
                        c = null != (t = null == i ? void 0 : i.collection) ? t : [];
                    return 0 === c.length ? (0, k.jsx)("div", {
                        className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large text-body-medium content-muted text-center",
                        children: n(aJ[o])
                    }) : (0, k.jsx)("div", {
                        className: "overflow-hidden radius-medium stroke-standard stroke-muted",
                        children: c.map(function(e, t) {
                            return (0, k.jsx)(aq, {
                                translate: n,
                                renderThumbnail: r,
                                formatListDate: a,
                                message: e,
                                index: t,
                                activeTab: o,
                                isSelected: s.has(e.id),
                                isSelectable: o !== nc && o !== nd,
                                onToggleSelection: l,
                                onOpen: u
                            }, e.id)
                        })
                    })
                },
                a$ = function(e) {
                    var t = e.translate,
                        n = e.renderThumbnail,
                        r = e.formatListDate,
                        a = e.notification,
                        i = L((0, R.useState)(!1), 2),
                        o = i[0],
                        s = i[1],
                        l = 1 === a.sender.id;
                    return (0, k.jsx)("button", {
                        type: "button",
                        className: aV()("width-full stroke-none stroke-bottom stroke-muted padding-medium text-left transition-colors", o ? "bg-surface-200 hover:bg-surface-300" : "bg-surface-100 hover:bg-surface-300"),
                        onClick: function() {
                            s(function(e) {
                                return !e
                            })
                        },
                        "aria-expanded": o,
                        "aria-label": a.subject,
                        children: (0, k.jsxs)("div", {
                            className: "flex gap-small",
                            children: [(0, k.jsx)("span", {
                                className: "size-700 shrink-0 flex items-center justify-center",
                                children: l ? (0, k.jsx)(aK, {
                                    className: "size-700"
                                }) : (0, k.jsx)("span", {
                                    className: "radius-circle clip size-700",
                                    children: n({
                                        userId: a.sender.id,
                                        altName: a.sender.displayName
                                    })
                                })
                            }), (0, k.jsxs)("span", {
                                className: "min-width-0 fill flex flex-col gap-y-small",
                                children: [(0, k.jsxs)("span", {
                                    className: "flex justify-between gap-small",
                                    children: [(0, k.jsxs)("span", {
                                        className: "text-title-medium content-emphasis flex items-center gap-xsmall min-width-0",
                                        children: [(0, k.jsx)("span", {
                                            className: "text-truncate-end",
                                            children: a.sender.displayName
                                        }), a.sender.hasVerifiedBadge ? (0, k.jsx)(aU, {
                                            size: "Medium",
                                            titleText: t("Creator.VerifiedBadgeIconAccessibilityText")
                                        }) : null, (0, k.jsxs)("span", {
                                            className: "text-body-medium content-muted",
                                            children: ["@", a.sender.name]
                                        })]
                                    }), (0, k.jsx)("span", {
                                        className: "text-caption-medium content-muted text-no-wrap",
                                        children: r(a.created)
                                    })]
                                }), (0, k.jsx)("span", {
                                    className: "private-message-row-preview text-body-large content-default",
                                    children: a.subject
                                }), o ? (0, k.jsx)("span", {
                                    className: "private-message-body block text-body-medium content-default margin-top-medium",
                                    dangerouslySetInnerHTML: {
                                        __html: a.body
                                    }
                                }) : null]
                            })]
                        })
                    })
                },
                a0 = function(e) {
                    var t, n = e.translate,
                        r = e.renderThumbnail,
                        a = e.formatListDate,
                        i = e.page,
                        o = null != (t = null == i ? void 0 : i.collection) ? t : [];
                    return 0 === o.length ? (0, k.jsx)("div", {
                        className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large text-body-medium content-muted text-center",
                        children: n("Message.NoNews")
                    }) : (0, k.jsx)("div", {
                        className: "overflow-hidden radius-medium stroke-standard stroke-muted",
                        children: o.map(function(e) {
                            return (0, k.jsx)(a$, {
                                translate: n,
                                renderThumbnail: r,
                                formatListDate: a,
                                notification: e
                            }, e.id)
                        })
                    })
                };
            q(Map);
            var a1 = R[" useId ".trim().toString()] || function() {},
                a2 = 0;

            function a3(e) {
                var t = L(R.useState(a1()), 2),
                    n = t[0],
                    r = t[1];
                return r5(function() {
                    e || r(function(e) {
                        return null != e ? e : String(a2++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }
            var a5 = R.createContext(void 0);

            function a4(e) {
                var t = R.useContext(a5);
                return e || t || "ltr"
            }
            var a6 = "rovingFocusGroup.onEntryFocus",
                a8 = {
                    bubbles: !1,
                    cancelable: !0
                },
                a7 = "RovingFocusGroup",
                a9 = L((l = (s = L(r1(o = a7 + "CollectionProvider"), 2))[0], u = s[1], d = (c = L(l(o, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], h = c[1], (f = function(e) {
                    var t = e.scope,
                        n = e.children,
                        r = j().useRef(null),
                        a = j().useRef(new Map).current;
                    return (0, k.jsx)(d, {
                        scope: t,
                        itemMap: a,
                        collectionRef: r,
                        children: n
                    })
                }).displayName = o, p = r9(m = a7 + "CollectionSlot"), (v = j().forwardRef(function(e, t) {
                    var n = e.scope,
                        r = e.children,
                        a = rL(t, h(m, n).collectionRef);
                    return (0, k.jsx)(p, {
                        ref: a,
                        children: r
                    })
                })).displayName = m, b = "data-radix-collection-item", y = r9(g = a7 + "CollectionItemSlot"), (w = j().forwardRef(function(e, t) {
                    var n = e.scope,
                        r = e.children,
                        a = ec(e, ["scope", "children"]),
                        i = j().useRef(null),
                        o = rL(t, i),
                        s = h(g, n);
                    return j().useEffect(function() {
                        return s.itemMap.set(i, A({
                                ref: i
                            }, a)),
                            function() {
                                s.itemMap.delete(i)
                            }
                    }), (0, k.jsx)(y, O(A({}, M({}, b, "")), {
                        ref: o,
                        children: r
                    }))
                })).displayName = g, [{
                    Provider: f,
                    Slot: v,
                    ItemSlot: w
                }, function(e) {
                    var t = h(a7 + "CollectionConsumer", e);
                    return j().useCallback(function() {
                        var e = t.collectionRef.current;
                        if (!e) return [];
                        var n = Array.from(e.querySelectorAll("[".concat(b, "]")));
                        return Array.from(t.itemMap.values()).sort(function(e, t) {
                            return n.indexOf(e.ref.current) - n.indexOf(t.ref.current)
                        })
                    }, [t.collectionRef, t.itemMap])
                }, u]), 3),
                ie = a9[0],
                it = a9[1],
                ir = L(r1(a7, [a9[2]]), 2),
                ia = ir[0],
                ii = ir[1],
                io = L(ia(a7), 2),
                is = io[0],
                il = io[1],
                iu = R.forwardRef(function(e, t) {
                    return (0, k.jsx)(ie.Provider, {
                        scope: e.__scopeRovingFocusGroup,
                        children: (0, k.jsx)(ie.Slot, {
                            scope: e.__scopeRovingFocusGroup,
                            children: (0, k.jsx)(ic, O(A({}, e), {
                                ref: t
                            }))
                        })
                    })
                });
            iu.displayName = a7;
            var ic = R.forwardRef(function(e, t) {
                    var n, r = e.__scopeRovingFocusGroup,
                        a = e.orientation,
                        i = e.loop,
                        o = e.dir,
                        s = e.currentTabStopId,
                        l = e.defaultCurrentTabStopId,
                        u = e.onCurrentTabStopIdChange,
                        c = e.onEntryFocus,
                        d = e.preventScrollOnEntryFocus,
                        h = void 0 !== d && d,
                        f = ec(e, ["__scopeRovingFocusGroup", "orientation", "loop", "dir", "currentTabStopId", "defaultCurrentTabStopId", "onCurrentTabStopIdChange", "onEntryFocus", "preventScrollOnEntryFocus"]),
                        m = R.useRef(null),
                        p = rL(t, m),
                        v = a4(o),
                        g = L(r6({
                            prop: s,
                            defaultProp: null != l ? l : null,
                            onChange: u,
                            caller: a7
                        }), 2),
                        b = g[0],
                        y = g[1],
                        w = L(R.useState(!1), 2),
                        x = w[0],
                        E = w[1],
                        S = (n = R.useRef(c), R.useEffect(function() {
                            n.current = c
                        }), R.useMemo(function() {
                            return function() {
                                for (var e, t = arguments.length, r = Array(t), a = 0; a < t; a++) r[a] = arguments[a];
                                return null == (e = n.current) ? void 0 : e.call.apply(e, [n].concat(Y(r)))
                            }
                        }, [])),
                        N = it(r),
                        T = R.useRef(!1),
                        C = L(R.useState(0), 2),
                        I = C[0],
                        M = C[1];
                    return R.useEffect(function() {
                        var e = m.current;
                        if (e) return e.addEventListener(a6, S),
                            function() {
                                return e.removeEventListener(a6, S)
                            }
                    }, [S]), (0, k.jsx)(is, {
                        scope: r,
                        orientation: a,
                        dir: v,
                        loop: void 0 !== i && i,
                        currentTabStopId: b,
                        onItemFocus: R.useCallback(function(e) {
                            return y(e)
                        }, [y]),
                        onItemShiftTab: R.useCallback(function() {
                            return E(!0)
                        }, []),
                        onFocusableItemAdd: R.useCallback(function() {
                            return M(function(e) {
                                return e + 1
                            })
                        }, []),
                        onFocusableItemRemove: R.useCallback(function() {
                            return M(function(e) {
                                return e - 1
                            })
                        }, []),
                        children: (0, k.jsx)(an.div, O(A({
                            tabIndex: x || 0 === I ? -1 : 0,
                            "data-orientation": a
                        }, f), {
                            ref: p,
                            style: A({
                                outline: "none"
                            }, e.style),
                            onMouseDown: r3(e.onMouseDown, function() {
                                T.current = !0
                            }),
                            onFocus: r3(e.onFocus, function(e) {
                                var t = !T.current;
                                if (e.target === e.currentTarget && t && !x) {
                                    var n = new CustomEvent(a6, a8);
                                    if (e.currentTarget.dispatchEvent(n), !n.defaultPrevented) {
                                        var r = N().filter(function(e) {
                                            return e.focusable
                                        });
                                        ip([r.find(function(e) {
                                            return e.active
                                        }), r.find(function(e) {
                                            return e.id === b
                                        })].concat(Y(r)).filter(Boolean).map(function(e) {
                                            return e.ref.current
                                        }), h)
                                    }
                                }
                                T.current = !1
                            }),
                            onBlur: r3(e.onBlur, function() {
                                return E(!1)
                            })
                        }))
                    })
                }),
                id = "RovingFocusGroupItem",
                ih = R.forwardRef(function(e, t) {
                    var n = e.__scopeRovingFocusGroup,
                        r = e.focusable,
                        a = void 0 === r || r,
                        i = e.active,
                        o = e.tabStopId,
                        s = e.children,
                        l = ec(e, ["__scopeRovingFocusGroup", "focusable", "active", "tabStopId", "children"]),
                        u = a3(),
                        c = o || u,
                        d = il(id, n),
                        h = d.currentTabStopId === c,
                        f = it(n),
                        m = d.onFocusableItemAdd,
                        p = d.onFocusableItemRemove,
                        v = d.currentTabStopId;
                    return R.useEffect(function() {
                        if (a) return m(),
                            function() {
                                return p()
                            }
                    }, [a, m, p]), (0, k.jsx)(ie.ItemSlot, {
                        scope: n,
                        id: c,
                        focusable: a,
                        active: void 0 !== i && i,
                        children: (0, k.jsx)(an.span, O(A({
                            tabIndex: h ? 0 : -1,
                            "data-orientation": d.orientation
                        }, l), {
                            ref: t,
                            onMouseDown: r3(e.onMouseDown, function(e) {
                                a ? d.onItemFocus(c) : e.preventDefault()
                            }),
                            onFocus: r3(e.onFocus, function() {
                                return d.onItemFocus(c)
                            }),
                            onKeyDown: r3(e.onKeyDown, function(e) {
                                if ("Tab" === e.key && e.shiftKey) return void d.onItemShiftTab();
                                if (e.target === e.currentTarget) {
                                    var t = function(e, t, n) {
                                        var r, a = (r = e.key, "rtl" !== n ? r : "ArrowLeft" === r ? "ArrowRight" : "ArrowRight" === r ? "ArrowLeft" : r);
                                        if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(a)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(a))) return im[a]
                                    }(e, d.orientation, d.dir);
                                    if (void 0 !== t) {
                                        if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                                        e.preventDefault();
                                        var n = f().filter(function(e) {
                                            return e.focusable
                                        }).map(function(e) {
                                            return e.ref.current
                                        });
                                        if ("last" === t) n.reverse();
                                        else if ("prev" === t || "next" === t) {
                                            "prev" === t && n.reverse();
                                            var r, a, i = n.indexOf(e.currentTarget);
                                            n = d.loop ? (r = n, a = i + 1, r.map(function(e, t) {
                                                return r[(a + t) % r.length]
                                            })) : n.slice(i + 1)
                                        }
                                        setTimeout(function() {
                                            return ip(n)
                                        })
                                    }
                                }
                            }),
                            children: "function" == typeof s ? s({
                                isCurrentTabStop: h,
                                hasTabStop: null != v
                            }) : s
                        }))
                    })
                });
            ih.displayName = id;
            var im = {
                ArrowLeft: "prev",
                ArrowUp: "prev",
                ArrowRight: "next",
                ArrowDown: "next",
                PageUp: "first",
                Home: "first",
                PageDown: "last",
                End: "last"
            };

            function ip(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                    n = document.activeElement,
                    r = !0,
                    a = !1,
                    i = void 0;
                try {
                    for (var o, s = e[Symbol.iterator](); !(r = (o = s.next()).done); r = !0) {
                        var l = o.value;
                        if (l === n || (l.focus({
                                preventScroll: t
                            }), document.activeElement !== n)) return
                    }
                } catch (e) {
                    a = !0, i = e
                } finally {
                    try {
                        r || null == s.return || s.return()
                    } finally {
                        if (a) throw i
                    }
                }
            }
            var iv = "Tabs",
                ig = L(r1(iv, [ii]), 2),
                ib = ig[0];
            ig[1];
            var iy = ii(),
                iw = L(ib(iv), 2),
                ix = iw[0],
                iE = iw[1],
                iS = R.forwardRef(function(e, t) {
                    var n = e.__scopeTabs,
                        r = e.value,
                        a = e.onValueChange,
                        i = e.defaultValue,
                        o = e.orientation,
                        s = void 0 === o ? "horizontal" : o,
                        l = e.dir,
                        u = e.activationMode,
                        c = ec(e, ["__scopeTabs", "value", "onValueChange", "defaultValue", "orientation", "dir", "activationMode"]),
                        d = a4(l),
                        h = L(r6({
                            prop: r,
                            onChange: a,
                            defaultProp: null != i ? i : "",
                            caller: iv
                        }), 2),
                        f = h[0],
                        m = h[1];
                    return (0, k.jsx)(ix, {
                        scope: n,
                        baseId: a3(),
                        value: f,
                        onValueChange: m,
                        orientation: s,
                        dir: d,
                        activationMode: void 0 === u ? "automatic" : u,
                        children: (0, k.jsx)(an.div, O(A({
                            dir: d,
                            "data-orientation": s
                        }, c), {
                            ref: t
                        }))
                    })
                });
            iS.displayName = iv;
            var iN = "TabsList",
                ik = R.forwardRef(function(e, t) {
                    var n = e.__scopeTabs,
                        r = e.loop,
                        a = ec(e, ["__scopeTabs", "loop"]),
                        i = iE(iN, n),
                        o = iy(n);
                    return (0, k.jsx)(iu, O(A({
                        asChild: !0
                    }, o), {
                        orientation: i.orientation,
                        dir: i.dir,
                        loop: void 0 === r || r,
                        children: (0, k.jsx)(an.div, O(A({
                            role: "tablist",
                            "aria-orientation": i.orientation
                        }, a), {
                            ref: t
                        }))
                    }))
                });
            ik.displayName = iN;
            var iT = "TabsTrigger",
                iC = R.forwardRef(function(e, t) {
                    var n = e.__scopeTabs,
                        r = e.value,
                        a = e.disabled,
                        i = void 0 !== a && a,
                        o = ec(e, ["__scopeTabs", "value", "disabled"]),
                        s = iE(iT, n),
                        l = iy(n),
                        u = iA(s.baseId, r),
                        c = iB(s.baseId, r),
                        d = r === s.value;
                    return (0, k.jsx)(ih, O(A({
                        asChild: !0
                    }, l), {
                        focusable: !i,
                        active: d,
                        children: (0, k.jsx)(an.button, O(A({
                            type: "button",
                            role: "tab",
                            "aria-selected": d,
                            "aria-controls": c,
                            "data-state": d ? "active" : "inactive",
                            "data-disabled": i ? "" : void 0,
                            disabled: i,
                            id: u
                        }, o), {
                            ref: t,
                            onMouseDown: r3(e.onMouseDown, function(e) {
                                i || 0 !== e.button || !1 !== e.ctrlKey ? e.preventDefault() : s.onValueChange(r)
                            }),
                            onKeyDown: r3(e.onKeyDown, function(e) {
                                [" ", "Enter"].includes(e.key) && s.onValueChange(r)
                            }),
                            onFocus: r3(e.onFocus, function() {
                                var e = "manual" !== s.activationMode;
                                d || i || !e || s.onValueChange(r)
                            })
                        }))
                    }))
                });
            iC.displayName = iT;
            var iI = "TabsContent",
                iM = R.forwardRef(function(e, t) {
                    var n = e.__scopeTabs,
                        r = e.value,
                        a = e.forceMount,
                        i = e.children,
                        o = ec(e, ["__scopeTabs", "value", "forceMount", "children"]),
                        s = iE(iI, n),
                        l = iA(s.baseId, r),
                        u = iB(s.baseId, r),
                        c = r === s.value,
                        d = R.useRef(c);
                    return R.useEffect(function() {
                        var e = requestAnimationFrame(function() {
                            return d.current = !1
                        });
                        return function() {
                            return cancelAnimationFrame(e)
                        }
                    }, []), (0, k.jsx)(r8, {
                        present: a || c,
                        children: function(n) {
                            var r = n.present;
                            return (0, k.jsx)(an.div, O(A({
                                "data-state": c ? "active" : "inactive",
                                "data-orientation": s.orientation,
                                role: "tabpanel",
                                "aria-labelledby": l,
                                hidden: !r,
                                id: u,
                                tabIndex: 0
                            }, o), {
                                ref: t,
                                style: O(A({}, e.style), {
                                    animationDuration: d.current ? "0s" : void 0
                                }),
                                children: r && i
                            }))
                        }
                    })
                });

            function iA(e, t) {
                return "".concat(e, "-trigger-").concat(t)
            }

            function iB(e, t) {
                return "".concat(e, "-content-").concat(t)
            }
            iM.displayName = iI;
            var i_ = (0, R.createContext)({
                    size: "Medium",
                    variant: "Contained",
                    fitBehavior: "Fill"
                }),
                iP = {
                    XSmall: ["text-label-small", "height-700"],
                    Small: ["text-label-small", "height-800"],
                    Medium: ["text-label-medium", "height-1000"],
                    Large: ["text-label-medium", "height-1200"]
                },
                iH = {
                    XSmall: "padding-x-small",
                    Small: "padding-x-small",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                iL = {
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
                iR = {
                    XSmall: "padding-bottom-small",
                    Small: "padding-bottom-small",
                    Medium: "padding-bottom-medium",
                    Large: "padding-bottom-xlarge"
                },
                ij = (0, R.forwardRef)(function(e, t) {
                    var n = eh([e, t]),
                        r = n[0],
                        a = n.slice(1),
                        i = r.children,
                        o = r.className,
                        s = r.size,
                        l = r.variant,
                        u = r.fitBehavior,
                        c = ec(r, ["children", "className", "size", "variant", "fitBehavior"]),
                        d = L(a, 1)[0],
                        h = (0, R.useMemo)(function() {
                            return {
                                size: s || "Large",
                                variant: l || "Contained",
                                fitBehavior: u || "Fill"
                            }
                        }, [s, l, u]);
                    return j().createElement(i_.Provider, {
                        value: h
                    }, j().createElement(iS, O(A({
                        ref: d
                    }, c), {
                        className: ni("foundation-web-tabs", "flex flex-col", o)
                    }), i))
                }),
                iO = (0, R.forwardRef)(function(e, t) {
                    var n = eh([e, t]),
                        r = n[0],
                        a = n.slice(1),
                        i = r.children,
                        o = r.className,
                        s = ec(r, ["children", "className"]),
                        l = L(a, 1)[0],
                        u = (0, R.useContext)(i_).fitBehavior,
                        c = (0, R.useRef)(null),
                        d = L((0, R.useState)({
                            width: 0,
                            left: 0,
                            opacity: 0
                        }), 2),
                        h = d[0],
                        f = d[1],
                        m = j().useCallback(function(e) {
                            c.current = e, "function" == typeof l ? l(e) : l && "current" in l && (l.current = e)
                        }, [l]);
                    return (0, R.useEffect)(function() {
                        var e, t = function() {
                            var e = c.current;
                            if (e) {
                                var t = e.querySelector('[data-state="active"]');
                                if (t) {
                                    var n = e.getBoundingClientRect(),
                                        r = t.getBoundingClientRect();
                                    f({
                                        width: r.width,
                                        left: r.left - n.left,
                                        opacity: 1
                                    })
                                }
                            }
                        };
                        t();
                        var n = new MutationObserver(function() {
                                cancelAnimationFrame(e), e = requestAnimationFrame(t)
                            }),
                            r = "u" > typeof ResizeObserver ? new ResizeObserver(t) : null,
                            a = c.current;
                        return a && (n.observe(a, {
                                subtree: !0,
                                attributes: !0,
                                attributeFilter: ["data-state"]
                            }), null == r || r.observe(a)), window.addEventListener("resize", t),
                            function() {
                                cancelAnimationFrame(e), n.disconnect(), null == r || r.disconnect(), window.removeEventListener("resize", t)
                            }
                    }, [i]), j().createElement("div", {
                        className: ni("relative scroll-x", o),
                        style: {
                            scrollbarWidth: "none",
                            msOverflowStyle: "none"
                        }
                    }, j().createElement(ik, O(A({
                        ref: m
                    }, s), {
                        className: ni("flex items-stretch bg-none border-0 stroke-none")
                    }), i), "Fit" === u && j().createElement("div", {
                        "aria-hidden": "true",
                        className: "absolute bottom-[0px] left-[0px] right-[0px] height-[var(--stroke-thick)] bg-[var(--color-stroke-muted)] [z-index:0]"
                    }), j().createElement("div", {
                        className: "absolute bottom-[0px] bg-system-contrast transition-all duration-200 ease-standard-out",
                        style: {
                            height: "var(--stroke-thick)",
                            zIndex: 1,
                            width: "".concat(h.width, "px"),
                            left: "".concat(h.left, "px"),
                            opacity: h.opacity
                        }
                    }))
                }),
                iD = (0, R.forwardRef)(function(e, t) {
                    var n = eh([e, t]),
                        r = n[0],
                        a = n.slice(1),
                        i = r.children,
                        o = r.className,
                        s = r.isDisabled,
                        l = void 0 !== s && s,
                        u = ec(r, ["children", "className", "isDisabled"]),
                        c = L(a, 1)[0],
                        d = (0, R.useContext)(i_),
                        h = d.size,
                        f = d.variant,
                        m = d.fitBehavior;
                    return j().createElement(iC, O(A({
                        ref: c
                    }, u), {
                        disabled: l,
                        style: {
                            borderBottom: "var(--stroke-thick) solid var(--color-stroke-muted)",
                            borderTop: "none",
                            borderLeft: "none",
                            borderRight: "none"
                        },
                        className: ni("relative flex items-center justify-center cursor-pointer bg-none shrink-0", rM, iP[h], "Fill" === m ? "grow-1 ".concat(iH[h]) : "", iL[h][f], iR[h], l && "opacity-[0.5]", o)
                    }), j().createElement(rA, null), j().createElement("div", {
                        className: "flex items-center justify-center height-600 relative"
                    }, i))
                }),
                iF = (0, R.forwardRef)(function(e, t) {
                    var n = eh([e, t]),
                        r = n[0],
                        a = n.slice(1),
                        i = r.children,
                        o = r.className,
                        s = ec(r, ["children", "className"]),
                        l = L(a, 1)[0];
                    return j().createElement(iM, O(A({
                        ref: l
                    }, s), {
                        className: ni("padding-top-large", "outline-none", o)
                    }), i)
                }),
                iU = {
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
                iz = {
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
                iV = {
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
                iG = {
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
                iK = {
                    Small: "height-600",
                    XSmall: "height-400"
                },
                iX = {
                    Small: "padding-x-small",
                    XSmall: "padding-x-xsmall"
                },
                iW = {
                    Small: "width-600",
                    XSmall: "width-400"
                },
                iZ = {
                    Small: "text-label-small",
                    XSmall: "text-caption-small"
                },
                iY = {
                    Small: "padding-y-xsmall",
                    XSmall: "padding-y-none"
                },
                iq = {
                    Small: "XSmall",
                    XSmall: "XSmall"
                },
                iJ = {
                    Pill: "radius-circle",
                    Box: "radius-small"
                },
                iQ = j().forwardRef(function(e, t) {
                    var n = eh([e, t]),
                        r = n[0],
                        a = n.slice(1),
                        i = r.className,
                        o = r.label,
                        s = r.variant,
                        l = void 0 === s ? "Standard" : s,
                        u = r.icon,
                        c = r.iconPosition,
                        d = void 0 === c ? "Leading" : c,
                        h = r.size,
                        f = void 0 === h ? "Small" : h,
                        m = r.shape,
                        p = ec(r, ["className", "label", "variant", "icon", "iconPosition", "size", "shape"]),
                        v = L(a, 1)[0],
                        g = u && !o,
                        b = "padding-x-xxsmall";
                    u && (b = "Leading" === d ? "padding-right-xxsmall" : "padding-left-xxsmall");
                    var y = u && j().createElement(rI, {
                        name: u,
                        size: iq[f],
                        className: iV[l]
                    });
                    return j().createElement("div", O(A({
                        ref: v
                    }, p), {
                        className: ni("foundation-web-badge flex items-center select-none gap-[var(--size-150)]", iJ[void 0 === m ? "Pill" : m], iK[f], g ? [iW[f], "justify-center"] : ["width-[fit-content]", iX[f]], iU[l], iz[l], iG[l], i)
                    }), "Leading" === d && y, o && j().createElement("span", {
                        className: ni("text-no-wrap text-truncate-split", iZ[f], iY[f], b, iz[l])
                    }, o), "Trailing" === d && y)
                });
            iQ.displayName = "Badge";
            var i$ = function(e) {
                    var t = e.activeTab,
                        n = e.tabs,
                        r = e.onSelectTab,
                        a = e.children;
                    return (0, k.jsxs)(ij, {
                        value: t,
                        variant: "Contained",
                        size: "Large",
                        fitBehavior: "Fill",
                        onValueChange: function(e) {
                            var t = n.find(function(t) {
                                return t.name === e
                            });
                            t && r(t.name)
                        },
                        children: [(0, k.jsx)(iO, {
                            className: "radius-none overflow-hidden",
                            children: n.map(function(e) {
                                return (0, k.jsx)(iD, {
                                    value: e.name,
                                    children: (0, k.jsxs)("span", {
                                        className: "flex items-center justify-center gap-small",
                                        children: [(0, k.jsx)("span", {
                                            children: e.label
                                        }), e.count ? (0, k.jsx)(iQ, {
                                            label: String(e.count),
                                            variant: "Contrast"
                                        }) : null]
                                    })
                                }, e.name)
                            })
                        }), (0, k.jsx)(iF, {
                            value: t,
                            style: {
                                paddingTop: 0
                            },
                            children: a
                        })]
                    })
                },
                i0 = function(e) {
                    var t, n, r, a = e.translate,
                        i = e.renderThumbnail,
                        o = e.formatListDate,
                        s = e.formatDetailDate,
                        l = rT({
                            translate: a
                        }),
                        u = (null == (n = (0, nl.getDeviceMeta)()) ? void 0 : n.isInApp) === !0,
                        c = null != (t = null == (r = l.page) ? void 0 : r.collection.length) ? t : 0;
                    return (0, k.jsxs)("div", {
                        className: "private-message-page margin-x-auto padding-medium",
                        children: [u ? null : (0, k.jsx)("h1", {
                            className: "text-heading-large content-emphasis margin-top-none margin-bottom-medium",
                            children: a("Heading.Message")
                        }), (0, k.jsxs)(i$, {
                            activeTab: l.route.tab,
                            tabs: l.tabs,
                            onSelectTab: l.openTab,
                            children: [(0, k.jsx)(aO, {
                                translate: a,
                                activeTab: l.route.tab,
                                moduleState: l.moduleState,
                                selectedCount: l.selectedMessageIds.size,
                                totalCount: c,
                                pagination: l.pagination,
                                onToggleSelectAll: l.toggleSelectAll,
                                onMarkArchive: function(e) {
                                    l.markArchive(e)
                                },
                                onMarkRead: function(e) {
                                    l.markRead(e)
                                },
                                onBack: l.backToList,
                                onChangePage: l.changePage
                            }), l.loading ? (0, k.jsx)("div", {
                                className: "flex justify-center padding-xxlarge",
                                children: (0, k.jsx)(ns, {
                                    ariaLabel: a("Label.Loading"),
                                    variant: "Indeterminate",
                                    size: "Medium"
                                })
                            }) : null, !l.loading && l.error ? (0, k.jsx)("div", {
                                className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large text-body-large content-system-alert",
                                children: l.error
                            }) : null, l.loading || l.error || l.moduleState !== nf ? null : l.route.tab === nd ? (0, k.jsx)(a0, {
                                translate: a,
                                renderThumbnail: i,
                                formatListDate: o,
                                page: l.page
                            }) : (0, k.jsx)(aQ, {
                                translate: a,
                                renderThumbnail: i,
                                formatListDate: o,
                                page: l.page,
                                activeTab: l.route.tab,
                                selectedMessageIds: l.selectedMessageIds,
                                onToggleSelection: l.toggleMessageSelection,
                                onOpenMessage: function(e, t) {
                                    l.openMessage(e, t)
                                }
                            }), l.loading || l.error || l.moduleState !== nm ? null : (0, k.jsx)(aW, {
                                translate: a,
                                renderThumbnail: i,
                                formatDetailDate: s,
                                message: l.selectedMessage,
                                activeTab: l.route.tab
                            })]
                        }), (0, k.jsx)(rJ, {
                            feedback: l.feedback,
                            onClose: l.dismissFeedback
                        })]
                    })
                },
                i1 = JSON.parse('{"P":["Feature.Messages","Feature.ProfileBadges"]}').P,
                i2 = function(e) {
                    var t = e.userId,
                        n = e.altName;
                    return (0, k.jsx)(na.Thumbnail2d, {
                        targetId: t,
                        type: na.ThumbnailTypes.avatarHeadshot,
                        altName: n
                    })
                },
                i3 = function() {
                    var e = nr("Feature.Messages"),
                        t = nr("Feature.ProfileBadges");
                    return (0, k.jsx)(i0, {
                        translate: function(n, r) {
                            return e.has(n) ? e(n, r) : t(n, r)
                        },
                        renderThumbnail: i2,
                        formatListDate: nO,
                        formatDetailDate: nD
                    })
                },
                i5 = function() {
                    var e;
                    return null != (e = document.getElementById("private-message")) ? e : document.getElementById("private-message-web-app")
                };
            C()(function() {
                var e = i5();
                e && ("private-message-web-app" === e.id && e.classList.add("messages-container"), (0, I.renderWithErrorBoundary)((0, k.jsx)(e9, {
                    namespaces: i1,
                    children: (0, k.jsx)(i3, {})
                }), e))
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "PrivateMessage");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/privateMessage-b4d7645fd49df97d.js.map