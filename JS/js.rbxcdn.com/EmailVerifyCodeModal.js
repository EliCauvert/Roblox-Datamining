! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "62c39fcf215d9774c9f83370f901d4543c1d2972"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "73e601a1-372e-41c0-b389-8fecdf1584b8", e._sentryDebugIdIdentifier = "sentry-dbid-73e601a1-372e-41c0-b389-8fecdf1584b8")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e = {
            773: function(e, t) {
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
                    f && o && (f = !1, o.length ? s = o.concat(s) : p = -1, s.length && y())
                }

                function y() {
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

                function h(e, t) {
                    this.fun = e, this.array = t
                }

                function b() {}

                function m() {}
                a.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var r = 1; r < arguments.length; r++) t[r - 1] = arguments[r];
                    s.push(new h(e, t)), 1 !== s.length || f || u(y)
                }, h.prototype.run = function() {
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
                var v = i.exports.browser,
                    g = i.exports.binding,
                    O = {},
                    w = "browser",
                    E = "browser",
                    j = "browser",
                    S = [],
                    P = {
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
                        emitWarning: m,
                        prependListener: i.exports.prependListener,
                        prependOnceListener: i.exports.prependOnceListener,
                        listeners: i.exports.listeners,
                        binding: g,
                        cwd: i.exports.cwd,
                        chdir: i.exports.chdir,
                        umask: i.exports.umask,
                        exit: m,
                        pid: 1,
                        features: O,
                        kill: m,
                        dlopen: m,
                        uptime: m,
                        memoryUsage: m,
                        uvCounters: m,
                        platform: w,
                        arch: E,
                        execPath: j,
                        execArgv: S
                    };
                t.addListener = i.exports.addListener, t.arch = E, t.argv = i.exports.argv, t.binding = g, t.browser = v, t.chdir = i.exports.chdir, t.cwd = i.exports.cwd, t.default = P, t.dlopen = m, t.emit = i.exports.emit, t.emitWarning = m, t.env = i.exports.env, t.execArgv = S, t.execPath = j, t.exit = m, t.features = O, t.kill = m, t.listeners = i.exports.listeners, t.memoryUsage = m, t.nextTick = i.exports.nextTick, t.off = i.exports.off, t.on = i.exports.on, t.once = i.exports.once, t.pid = 1, t.platform = w, t.prependListener = i.exports.prependListener, t.prependOnceListener = i.exports.prependOnceListener, t.removeAllListeners = i.exports.removeAllListeners, t.removeListener = i.exports.removeListener, t.title = i.exports.title, t.umask = i.exports.umask, t.uptime = m, t.uvCounters = m, t.version = i.exports.version, t.versions = i.exports.versions, e.exports = P
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
        }, r.o = function(e, t) {
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
            var e, t, n, o, i, a, l, c, u, s, f, p, d, y, h, b, m, v, g, O, w = window.ReactJSX,
                E = window.Roblox,
                j = r.n(E),
                S = window.React,
                P = r.n(S),
                x = window.ReactDOM,
                A = r.n(x);

            function T(e, t) {
                var r = t && t.cache ? t.cache : _,
                    n = t && t.serializer ? t.serializer : N;
                return (t && t.strategy ? t.strategy : function(e, t) {
                    var r, n, o = 1 === e.length ? C : I;
                    return r = t.cache.create(), n = t.serializer, o.bind(this, e, r, n)
                })(e, {
                    cache: r,
                    serializer: n
                })
            }

            function C(e, t, r, n) {
                var o = null == n || "number" == typeof n || "boolean" == typeof n ? n : r(n),
                    i = t.get(o);
                return void 0 === i && (i = e.call(this, n), t.set(o, i)), i
            }

            function I(e, t, r) {
                var n = Array.prototype.slice.call(arguments, 3),
                    o = r(n),
                    i = t.get(o);
                return void 0 === i && (i = e.apply(this, n), t.set(o, i)), i
            }
            var N = function() {
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
                _ = {
                    create: function() {
                        return new R
                    }
                },
                D = {
                    variadic: function(e, t) {
                        var r, n;
                        return r = t.cache.create(), n = t.serializer, I.bind(this, e, r, n)
                    },
                    monadic: function(e, t) {
                        var r, n;
                        return r = t.cache.create(), n = t.serializer, C.bind(this, e, r, n)
                    }
                };

            function k(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function M(e, t, r) {
                return (M = F() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && L(o, r.prototype), o
                }).apply(null, arguments)
            }

            function B(e) {
                return (B = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function L(e, t) {
                return (L = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function H(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (H = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return M(e, arguments, B(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), L(r, e)
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
            var U = function(e) {
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function t(e, r) {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        var n, o, i, a = e;
                        return r && (a += ": " + r), n = t, o = [a], n = B(n), (i = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, F() ? Reflect.construct(n, o || [], B(this).constructor) : n.apply(this, o))).code = e, r && (i.originalMessage = r), i
                    }
                    return t.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: t,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && L(t, e), t
                }(H(Error)),
                G = ((t = G || {}).MISSING_MESSAGE = "MISSING_MESSAGE", t.MISSING_FORMAT = "MISSING_FORMAT", t.ENVIRONMENT_FALLBACK = "ENVIRONMENT_FALLBACK", t.INSUFFICIENT_PATH = "INSUFFICIENT_PATH", t.INVALID_MESSAGE = "INVALID_MESSAGE", t.INVALID_KEY = "INVALID_KEY", t.FORMATTING_ERROR = "FORMATTING_ERROR", t);

            function V(e, t) {
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

            function K(e, t) {
                return V(function() {
                    for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                    return M(e, function(e) {
                        if (Array.isArray(e)) return k(e)
                    }(r) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(r) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return k(e, void 0);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return k(e, void 0)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())
                }, t)
            }

            function W(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function z(e) {
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

            function X(e, t) {
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
            var $ = /(?:[Eec]{1,6}|G{1,5}|[Qq]{1,5}|(?:[yYur]+|U{1,5})|[ML]{1,5}|d{1,2}|D{1,3}|F{1}|[abB]{1,5}|[hkHK]{1,2}|w{1,2}|W{1}|m{1,2}|s{1,2}|[zZOvVxX]{1,4})(?=([^']*'[^']*')*[^']*$)/g,
                Z = /[\t-\r \x85\u200E\u200F\u2028\u2029]/i,
                Y = /^\.(?:(0+)(\*)?|(#+)|(0+)(#+))$/g,
                q = /^(@+)?(\+|#+)?[rs]?$/g,
                J = /(\*)(0+)|(#+)(0+)|(0+)/g,
                Q = /^(0+)$/;

            function ee(e) {
                var t = {};
                return "r" === e[e.length - 1] ? t.roundingPriority = "morePrecision" : "s" === e[e.length - 1] && (t.roundingPriority = "lessPrecision"), e.replace(q, function(e, r, n) {
                    return "string" != typeof n ? (t.minimumSignificantDigits = r.length, t.maximumSignificantDigits = r.length) : "+" === n ? t.minimumSignificantDigits = r.length : "#" === r[0] ? t.maximumSignificantDigits = r.length : (t.minimumSignificantDigits = r.length, t.maximumSignificantDigits = r.length + ("string" == typeof n ? n.length : 0)), ""
                }), t
            }

            function et(e) {
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

            function er(e) {
                var t = et(e);
                return t || {}
            }

            function en(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eo(e) {
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

            function ei(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function ea(e, t) {
                if (e) {
                    if ("string" == typeof e) return en(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return en(e, t)
                }
            }
            var el = ((n = {})[n.EXPECT_ARGUMENT_CLOSING_BRACE = 1] = "EXPECT_ARGUMENT_CLOSING_BRACE", n[n.EMPTY_ARGUMENT = 2] = "EMPTY_ARGUMENT", n[n.MALFORMED_ARGUMENT = 3] = "MALFORMED_ARGUMENT", n[n.EXPECT_ARGUMENT_TYPE = 4] = "EXPECT_ARGUMENT_TYPE", n[n.INVALID_ARGUMENT_TYPE = 5] = "INVALID_ARGUMENT_TYPE", n[n.EXPECT_ARGUMENT_STYLE = 6] = "EXPECT_ARGUMENT_STYLE", n[n.INVALID_NUMBER_SKELETON = 7] = "INVALID_NUMBER_SKELETON", n[n.INVALID_DATE_TIME_SKELETON = 8] = "INVALID_DATE_TIME_SKELETON", n[n.EXPECT_NUMBER_SKELETON = 9] = "EXPECT_NUMBER_SKELETON", n[n.EXPECT_DATE_TIME_SKELETON = 10] = "EXPECT_DATE_TIME_SKELETON", n[n.UNCLOSED_QUOTE_IN_ARGUMENT_STYLE = 11] = "UNCLOSED_QUOTE_IN_ARGUMENT_STYLE", n[n.EXPECT_SELECT_ARGUMENT_OPTIONS = 12] = "EXPECT_SELECT_ARGUMENT_OPTIONS", n[n.EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE = 13] = "EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE", n[n.INVALID_PLURAL_ARGUMENT_OFFSET_VALUE = 14] = "INVALID_PLURAL_ARGUMENT_OFFSET_VALUE", n[n.EXPECT_SELECT_ARGUMENT_SELECTOR = 15] = "EXPECT_SELECT_ARGUMENT_SELECTOR", n[n.EXPECT_PLURAL_ARGUMENT_SELECTOR = 16] = "EXPECT_PLURAL_ARGUMENT_SELECTOR", n[n.EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT = 17] = "EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT", n[n.EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT = 18] = "EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT", n[n.INVALID_PLURAL_ARGUMENT_SELECTOR = 19] = "INVALID_PLURAL_ARGUMENT_SELECTOR", n[n.DUPLICATE_PLURAL_ARGUMENT_SELECTOR = 20] = "DUPLICATE_PLURAL_ARGUMENT_SELECTOR", n[n.DUPLICATE_SELECT_ARGUMENT_SELECTOR = 21] = "DUPLICATE_SELECT_ARGUMENT_SELECTOR", n[n.MISSING_OTHER_CLAUSE = 22] = "MISSING_OTHER_CLAUSE", n[n.INVALID_TAG = 23] = "INVALID_TAG", n[n.INVALID_TAG_NAME = 25] = "INVALID_TAG_NAME", n[n.UNMATCHED_CLOSING_TAG = 26] = "UNMATCHED_CLOSING_TAG", n[n.UNCLOSED_TAG = 27] = "UNCLOSED_TAG", n);

            function ec(e) {
                return !!(e && (void 0 === e ? "undefined" : ei(e)) === "object" && 0 === e.type)
            }

            function eu(e) {
                return !!(e && (void 0 === e ? "undefined" : ei(e)) === "object" && 1 === e.type)
            }
            var es = /[ \xA0\u1680\u2000-\u200A\u202F\u205F\u3000]/,
                ef = {
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
                ep = new RegExp("^".concat(es.source, "*")),
                ed = new RegExp("".concat(es.source, "*$"));

            function ey(e, t) {
                return {
                    start: e,
                    end: t
                }
            }
            var eh = !!Object.fromEntries,
                eb = !!String.prototype.trimStart,
                em = !!String.prototype.trimEnd,
                ev = eh ? Object.fromEntries : function(e) {
                    var t = {},
                        r = !0,
                        n = !1,
                        o = void 0;
                    try {
                        for (var i, a = e[Symbol.iterator](); !(r = (i = a.next()).done); r = !0) {
                            var l, c = (l = i.value, function(e) {
                                    if (Array.isArray(e)) return e
                                }(l) || function(e) {
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
                                }(l) || ea(l, 2) || function() {
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
                            r || null == a.return || a.return()
                        } finally {
                            if (n) throw o
                        }
                    }
                    return t
                },
                eg = eb ? function(e) {
                    return e.trimStart()
                } : function(e) {
                    return e.replace(ep, "")
                },
                eO = em ? function(e) {
                    return e.trimEnd()
                } : function(e) {
                    return e.replace(ed, "")
                },
                ew = RegExp("([^\\u0009-\\u000D\\u0020\\u0085\\u00A0\\u1680\\u2000-\\u200A\\u2028-\\u2029\\u202F\\u205F\\u3000\\u0021-\\u002F\\u003A-\\u0040\\u005B-\\u005E\\u0060\\u007B-\\u007E\\u00A1-\\u00A7\\u00A9\\u00AB-\\u00AC\\u00AE\\u00B0-\\u00B1\\u00B6\\u00BB\\u00BF\\u00D7\\u00F7\\u2010-\\u2027\\u2030-\\u203E\\u2041-\\u2053\\u2055-\\u205E\\u2190-\\u245F\\u2500-\\u2775\\u2794-\\u2BFF\\u2E00-\\u2E7F\\u3001-\\u3003\\u3008-\\u3020\\u3030\\uFD3E-\\uFD3F\\uFE45-\\uFE46]*)", "yu"),
                eE = function() {
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
                                                    var i = e.charCodeAt(n + 1);
                                                    n += i >= 56320 && i <= 57343 ? 2 : 1
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
                                        var i = this.parseArgument(e, r);
                                        if (i.err) return i;
                                        n.push(i.val)
                                    } else if (125 === o && e > 0) break;
                                    else if (35 === o && ("plural" === t || "selectordinal" === t)) {
                                        var a = this.clonePosition();
                                        this.bump(), n.push({
                                            type: 7,
                                            location: ey(a, this.clonePosition())
                                        })
                                    } else if (60 !== o || this.ignoreTag || 47 !== this.peek())
                                        if (60 === o && !this.ignoreTag && ej(this.peek() || 0)) {
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
                                var i = o.val,
                                    a = this.clonePosition();
                                if (!this.bumpIf("</")) return this.error(27, ey(r, this.clonePosition()));
                                if (this.isEOF() || !ej(this.char())) return this.error(23, ey(a, this.clonePosition()));
                                var l = this.clonePosition();
                                return n !== this.parseTagName() ? this.error(26, ey(l, this.clonePosition())) : (this.bumpSpace(), this.bumpIf(">")) ? {
                                    val: {
                                        type: 8,
                                        value: n,
                                        children: i,
                                        location: ey(r, this.clonePosition())
                                    },
                                    err: null
                                } : this.error(23, ey(a, this.clonePosition()))
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
                                    var i = this.tryParseUnquoted(e, t);
                                    if (i) {
                                        n += i;
                                        continue
                                    }
                                    var a = this.tryParseLeftAngleBracket();
                                    if (a) {
                                        n += a;
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
                                return this.isEOF() || 60 !== this.char() || !this.ignoreTag && (ej(e = this.peek() || 0) || 47 === e) ? null : (this.bump(), "<")
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
                                    if (Array.isArray(e)) return en(e)
                                }(r) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(r) || ea(r) || function() {
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
                                    o = (e = this.message, ew.lastIndex = n, null != (t = ew.exec(e)[1]) ? t : ""),
                                    i = n + o.length;
                                return this.bumpTo(i), {
                                    value: o,
                                    location: ey(r, this.clonePosition())
                                }
                            }
                        }, {
                            key: "parseArgumentOptions",
                            value: function(e, t, r, n) {
                                var o = this.clonePosition(),
                                    i = this.parseIdentifierIfPossible().value,
                                    a = this.clonePosition();
                                switch (i) {
                                    case "":
                                        return this.error(4, ey(o, a));
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
                                            var f = eO(s.val);
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
                                            var y = eg(c.style.slice(2));
                                            if ("number" === i) {
                                                var h = this.parseNumberSkeletonFromString(y, c.styleLocation);
                                                if (h.err) return h;
                                                return {
                                                    val: {
                                                        type: 2,
                                                        value: r,
                                                        location: d,
                                                        style: h.val
                                                    },
                                                    err: null
                                                }
                                            }
                                            if (0 === y.length) return this.error(10, d);
                                            var b, m = y;
                                            return this.locale && (m = function(e, t) {
                                                for (var r = "", n = 0; n < e.length; n++) {
                                                    var o = e.charAt(n);
                                                    if ("j" === o) {
                                                        for (var i = 0; n + 1 < e.length && e.charAt(n + 1) === o;) i++, n++;
                                                        var a = 1 + (1 & i),
                                                            l = i < 2 ? 1 : 3 + (i >> 1),
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
                                                                return "root" !== n && (t = e.maximize().region), (ef[t || ""] || ef[n || ""] || ef["".concat(n, "-001")] || ef["001"])[0]
                                                            }(t);
                                                        for (("H" == c || "k" == c) && (l = 0); l-- > 0;) r += "a";
                                                        for (; a-- > 0;) r = c + r
                                                    } else "J" === o ? r += "H" : r += o
                                                }
                                                return r
                                            }(y, this.locale)), {
                                                val: {
                                                    type: "date" === i ? 3 : 4,
                                                    value: r,
                                                    location: d,
                                                    style: {
                                                        type: 1,
                                                        pattern: m,
                                                        location: c.styleLocation,
                                                        parsedOptions: this.shouldParseSkeletons ? (b = {}, m.replace($, function(e) {
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
                                                type: "number" === i ? 2 : "date" === i ? 3 : 4,
                                                value: r,
                                                location: d,
                                                style: null != (l = null == c ? void 0 : c.style) ? l : null
                                            }, err: null
                                        };
                                    case "plural":
                                    case "selectordinal":
                                    case "select":
                                        var v = this.clonePosition();
                                        if (this.bumpSpace(), !this.bumpIf(",")) return this.error(12, ey(v, eo({}, v)));
                                        this.bumpSpace();
                                        var g = this.parseIdentifierIfPossible(),
                                            O = 0;
                                        if ("select" !== i && "offset" === g.value) {
                                            if (!this.bumpIf(":")) return this.error(13, ey(this.clonePosition(), this.clonePosition()));
                                            this.bumpSpace();
                                            var w = this.tryParseDecimalInteger(13, 14);
                                            if (w.err) return w;
                                            this.bumpSpace(), g = this.parseIdentifierIfPossible(), O = w.val
                                        }
                                        var E = this.tryParsePluralOrSelectOptions(e, i, t, g);
                                        if (E.err) return E;
                                        var j = this.tryParseArgumentClose(n);
                                        if (j.err) return j;
                                        var S = ey(n, this.clonePosition());
                                        if ("select" === i) return {
                                            val: {
                                                type: 5,
                                                value: r,
                                                options: ev(E.val),
                                                location: S
                                            },
                                            err: null
                                        };
                                        return {
                                            val: {
                                                type: 6,
                                                value: r,
                                                options: ev(E.val),
                                                offset: O,
                                                pluralType: "plural" === i ? "cardinal" : "ordinal",
                                                location: S
                                            }, err: null
                                        };
                                    default:
                                        return this.error(5, ey(o, a))
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
                                        var t = e.split(Z).filter(function(e) {
                                                return e.length > 0
                                            }),
                                            r = [],
                                            n = !0,
                                            o = !1,
                                            i = void 0;
                                        try {
                                            for (var a, l = t[Symbol.iterator](); !(n = (a = l.next()).done); n = !0) {
                                                var c = a.value.split("/");
                                                if (0 === c.length) throw Error("Invalid number skeleton");
                                                var u = function(e) {
                                                        if (Array.isArray(e)) return e
                                                    }(c) || function(e) {
                                                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                                    }(c) || function(e) {
                                                        if (e) {
                                                            if ("string" == typeof e) return W(e, void 0);
                                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return W(e, void 0)
                                                        }
                                                    }(c) || function() {
                                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                                    }(),
                                                    s = u[0],
                                                    f = u.slice(1),
                                                    p = !0,
                                                    d = !1,
                                                    y = void 0;
                                                try {
                                                    for (var h, b = f[Symbol.iterator](); !(p = (h = b.next()).done); p = !0) {
                                                        var m = h.value;
                                                        if (0 === m.length) throw Error("Invalid number skeleton")
                                                    }
                                                } catch (e) {
                                                    d = !0, y = e
                                                } finally {
                                                    try {
                                                        p || null == b.return || b.return()
                                                    } finally {
                                                        if (d) throw y
                                                    }
                                                }
                                                r.push({
                                                    stem: s,
                                                    options: f
                                                })
                                            }
                                        } catch (e) {
                                            o = !0, i = e
                                        } finally {
                                            try {
                                                n || null == l.return || l.return()
                                            } finally {
                                                if (o) throw i
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
                                                for (var i, a = e[Symbol.iterator](); !(r = (i = a.next()).done); r = !0) {
                                                    var l = i.value;
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
                                                            t = z(X(z({}, t), {
                                                                notation: "scientific"
                                                            }), l.options.reduce(function(e, t) {
                                                                return z({}, e, er(t))
                                                            }, {}));
                                                            continue;
                                                        case "engineering":
                                                            t = z(X(z({}, t), {
                                                                notation: "engineering"
                                                            }), l.options.reduce(function(e, t) {
                                                                return z({}, e, er(t))
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
                                                            l.options[0].replace(J, function(e, r, n, o, i, a) {
                                                                if (r) t.minimumIntegerDigits = n.length;
                                                                else if (o && i) throw Error("We currently do not support maximum integer digits");
                                                                else if (a) throw Error("We currently do not support exact integer digits");
                                                                return ""
                                                            });
                                                            continue
                                                    }
                                                    if (Q.test(l.stem)) {
                                                        t.minimumIntegerDigits = l.stem.length;
                                                        continue
                                                    }
                                                    if (Y.test(l.stem)) {
                                                        if (l.options.length > 1) throw RangeError("Fraction-precision stems only accept a single optional option");
                                                        l.stem.replace(Y, function(e, r, n, o, i, a) {
                                                            return "*" === n ? t.minimumFractionDigits = r.length : o && "#" === o[0] ? t.maximumFractionDigits = o.length : i && a ? (t.minimumFractionDigits = i.length, t.maximumFractionDigits = i.length + a.length) : (t.minimumFractionDigits = r.length, t.maximumFractionDigits = r.length), ""
                                                        });
                                                        var c = l.options[0];
                                                        "w" === c ? t = X(z({}, t), {
                                                            trailingZeroDisplay: "stripIfInteger"
                                                        }) : c && (t = z({}, t, ee(c)));
                                                        continue
                                                    }
                                                    if (q.test(l.stem)) {
                                                        t = z({}, t, ee(l.stem));
                                                        continue
                                                    }
                                                    var u = et(l.stem);
                                                    u && (t = z({}, t, u));
                                                    var s = function(e) {
                                                        var t;
                                                        if ("E" === e[0] && "E" === e[1] ? (t = {
                                                                notation: "engineering"
                                                            }, e = e.slice(2)) : "E" === e[0] && (t = {
                                                                notation: "scientific"
                                                            }, e = e.slice(1)), t) {
                                                            var r = e.slice(0, 2);
                                                            if ("+!" === r ? (t.signDisplay = "always", e = e.slice(2)) : "+?" === r && (t.signDisplay = "exceptZero", e = e.slice(2)), !Q.test(e)) throw Error("Malformed concise eng/scientific notation");
                                                            t.minimumIntegerDigits = e.length
                                                        }
                                                        return t
                                                    }(l.stem);
                                                    s && (t = z({}, t, s))
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
                                            return t
                                        }(r) : {}
                                    },
                                    err: null
                                }
                            }
                        }, {
                            key: "tryParsePluralOrSelectOptions",
                            value: function(e, t, r, n) {
                                for (var o = !1, i = [], a = new Set, l = n.value, c = n.location;;) {
                                    if (0 === l.length) {
                                        var u, s = this.clonePosition();
                                        if ("select" !== t && this.bumpIf("=")) {
                                            var f = this.tryParseDecimalInteger(16, 19);
                                            if (f.err) return f;
                                            c = ey(s, this.clonePosition()), l = this.message.slice(s.offset, this.offset())
                                        } else break
                                    }
                                    if (a.has(l)) return this.error("select" === t ? 21 : 20, c);
                                    "other" === l && (o = !0), this.bumpSpace();
                                    var p = this.clonePosition();
                                    if (!this.bumpIf("{")) return this.error("select" === t ? 17 : 18, ey(this.clonePosition(), this.clonePosition()));
                                    var d = this.parseMessage(e + 1, t, r);
                                    if (d.err) return d;
                                    var y = this.tryParseArgumentClose(p);
                                    if (y.err) return y;
                                    i.push([l, {
                                        value: d.val,
                                        location: ey(p, this.clonePosition())
                                    }]), a.add(l), this.bumpSpace(), l = (u = this.parseIdentifierIfPossible()).value, c = u.location
                                }
                                return 0 === i.length ? this.error("select" === t ? 15 : 16, ey(this.clonePosition(), this.clonePosition())) : this.requiresOtherClause && !o ? this.error(22, ey(this.clonePosition(), this.clonePosition())) : {
                                    val: i,
                                    err: null
                                }
                            }
                        }, {
                            key: "tryParseDecimalInteger",
                            value: function(e, t) {
                                var r = 1,
                                    n = this.clonePosition();
                                this.bumpIf("+") || this.bumpIf("-") && (r = -1);
                                for (var o = !1, i = 0; !this.isEOF();) {
                                    var a = this.char();
                                    if (a >= 48 && a <= 57) o = !0, i = 10 * i + (a - 48), this.bump();
                                    else break
                                }
                                var l = ey(n, this.clonePosition());
                                return o ? Number.isSafeInteger(i *= r) ? {
                                    val: i,
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

            function ej(e) {
                return e >= 97 && e <= 122 || e >= 65 && e <= 90
            }

            function eS(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eP(e, t, r) {
                return t = eN(t),
                    function(e, t) {
                        if (t && ("object" === eM(t) || "function" == typeof t)) return t;
                        if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                        return e
                    }(e, eL() ? Reflect.construct(t, r || [], eN(e).constructor) : t.apply(e, r))
            }

            function ex(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function eA(e, t, r) {
                return (eA = eL() ? Reflect.construct : function(e, t, r) {
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

            function eI() {
                return (eI = Object.assign || function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var r = arguments[t];
                        for (var n in r) Object.prototype.hasOwnProperty.call(r, n) && (e[n] = r[n])
                    }
                    return e
                }).apply(this, arguments)
            }

            function eN(e) {
                return (eN = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
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

            function e_(e) {
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

            function ek(e) {
                return function(e) {
                    if (Array.isArray(e)) return eS(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return eS(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return eS(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eM(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function eB(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (eB = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return eA(e, arguments, eN(this).constructor)
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

            function eL() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (eL = function() {
                    return !!e
                })()
            }
            var eH = function(e) {
                    function t(e, r, n) {
                        var o;
                        return ex(this, t), (o = eP(this, t, [e])).code = r, o.originalMessage = n, o
                    }
                    return eR(t, e), eC(t, [{
                        key: "toString",
                        value: function() {
                            return "[formatjs Error: ".concat(this.code, "] ").concat(this.message)
                        }
                    }]), t
                }(eB(Error)),
                eF = function(e) {
                    function t(e, r, n, o) {
                        return ex(this, t), eP(this, t, ['Invalid values for "'.concat(e, '": "').concat(r, '". Options are "').concat(Object.keys(n).join('", "'), '"'), "INVALID_VALUE", o])
                    }
                    return eR(t, e), t
                }(eH),
                eU = function(e) {
                    function t(e, r, n) {
                        return ex(this, t), eP(this, t, ['Value for "'.concat(e, '" must be of type ').concat(r), "INVALID_VALUE", n])
                    }
                    return eR(t, e), t
                }(eH),
                eG = function(e) {
                    function t(e, r) {
                        return ex(this, t), eP(this, t, ['The intl string context variable "'.concat(e, '" was not provided to the string "').concat(r, '"'), "MISSING_VALUE", r])
                    }
                    return eR(t, e), t
                }(eH);

            function eV(e) {
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
            var eK = ((b = function() {
                function e(t) {
                    var r, n = this,
                        o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e.defaultLocale,
                        i = arguments.length > 2 ? arguments[2] : void 0,
                        a = arguments.length > 3 ? arguments[3] : void 0;
                    if (ex(this, e), this.formatterCache = {
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
                            return function e(t, r, n, o, i, a, l) {
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
                                        var y = p.value;
                                        if (0 === y.type) {
                                            c.push({
                                                type: 0,
                                                value: y.value
                                            });
                                            continue
                                        }
                                        if (7 === y.type) {
                                            "number" == typeof a && c.push({
                                                type: 0,
                                                value: n.getNumberFormat(r).format(a)
                                            });
                                            continue
                                        }
                                        var h = y.value;
                                        if (!(i && h in i)) throw new eG(h, l);
                                        var b = i[h];
                                        if (1 === y.type) {
                                            b && "string" != typeof b && "number" != typeof b && (void 0 === b ? "undefined" : eM(b)) !== "bigint" || (b = "string" == typeof b || "number" == typeof b || (void 0 === b ? "undefined" : eM(b)) === "bigint" ? String(b) : ""), c.push({
                                                type: +("string" != typeof b),
                                                value: b
                                            });
                                            continue
                                        }
                                        if (3 === y.type) {
                                            var m = "string" == typeof y.style ? o.date[y.style] : eu(y.style) ? y.style.parsedOptions : void 0;
                                            c.push({
                                                type: 0,
                                                value: n.getDateTimeFormat(r, m).format(b)
                                            });
                                            continue
                                        }
                                        if (4 === y.type) {
                                            var v = "string" == typeof y.style ? o.time[y.style] : eu(y.style) ? y.style.parsedOptions : o.time.medium;
                                            c.push({
                                                type: 0,
                                                value: n.getDateTimeFormat(r, v).format(b)
                                            });
                                            continue
                                        }
                                        if (2 === y.type) {
                                            var g = "string" == typeof y.style ? o.number[y.style] : ec(y.style) ? y.style.parsedOptions : void 0;
                                            if (g && g.scale) {
                                                var O = g.scale || 1;
                                                if ((void 0 === b ? "undefined" : eM(b)) === "bigint") {
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
                                        if (8 === y.type) {
                                            var w = y.children,
                                                E = y.value,
                                                j = i[E];
                                            if ("function" != typeof j) throw new eU(E, "function", l);
                                            var S = j(e(w, r, n, o, i, a).map(function(e) {
                                                return e.value
                                            }));
                                            Array.isArray(S) || (S = [S]), c.push.apply(c, ek(S.map(function(e) {
                                                return {
                                                    type: +("string" != typeof e),
                                                    value: e
                                                }
                                            })))
                                        }
                                        if (5 === y.type) {
                                            var P = b,
                                                x = (Object.prototype.hasOwnProperty.call(y.options, P) ? y.options[P] : void 0) || y.options.other;
                                            if (!x) throw new eF(y.value, b, Object.keys(y.options), l);
                                            c.push.apply(c, ek(e(x.value, r, n, o, i)));
                                            continue
                                        }
                                        if (6 === y.type) {
                                            var A = "=".concat(b),
                                                T = Object.prototype.hasOwnProperty.call(y.options, A) ? y.options[A] : void 0;
                                            if (!T) {
                                                if (!Intl.PluralRules) throw new eH('Intl.PluralRules is not available in this environment.\nTry polyfilling it using "@formatjs/intl-pluralrules"\n', "MISSING_INTL_API", l);
                                                var C = (void 0 === b ? "undefined" : eM(b)) === "bigint" ? Number(b) : b,
                                                    I = n.getPluralRules(r, {
                                                        type: y.pluralType
                                                    }).select(C - (y.offset || 0));
                                                T = (Object.prototype.hasOwnProperty.call(y.options, I) ? y.options[I] : void 0) || y.options.other
                                            }
                                            if (!T) throw new eF(y.value, b, Object.keys(y.options), l);
                                            var N = (void 0 === b ? "undefined" : eM(b)) === "bigint" ? Number(b) : b;
                                            c.push.apply(c, ek(e(T.value, r, n, o, i, N - (y.offset || 0))));
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
                        var l, c, u = a || {},
                            s = (function(e) {
                                if (null == e) throw TypeError("Cannot destructure " + e)
                            }(u), eI({}, u));
                        this.ast = e.__parse(t, (l = e_({}, s), c = c = {
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
                    this.formats = (r = e.formats, i ? Object.keys(r).reduce(function(e, t) {
                        var n, o;
                        return e[t] = (n = r[t], (o = i[t]) ? e_({}, n, o, Object.keys(n).reduce(function(e, t) {
                            return e[t] = e_({}, n[t], o[t]), e
                        }, {})) : n), e
                    }, e_({}, r)) : r), this.formatters = a && a.formatters || function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                            number: {},
                            dateTime: {},
                            pluralRules: {}
                        };
                        return {
                            getNumberFormat: T(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return eA(Intl.NumberFormat, ek(t))
                            }, {
                                cache: eV(e.number),
                                strategy: D.variadic
                            }),
                            getDateTimeFormat: T(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return eA(Intl.DateTimeFormat, ek(t))
                            }, {
                                cache: eV(e.dateTime),
                                strategy: D.variadic
                            }),
                            getPluralRules: T(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return eA(Intl.PluralRules, ek(t))
                            }, {
                                cache: eV(e.pluralRules),
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
            }()).memoizedDefaultLocale = null, b.resolveLocale = function(e) {
                if (void 0 !== Intl.Locale) {
                    var t = Intl.NumberFormat.supportedLocalesOf(e);
                    return new Intl.Locale(t.length > 0 ? t[0] : "string" == typeof e ? e : e[0])
                }
            }, b.__parse = function(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = new eE(e, t = eo({
                        shouldParseSkeletons: !0,
                        requiresOtherClause: !0
                    }, t)).parse();
                if (r.err) {
                    var n = SyntaxError(el[r.err.kind]);
                    throw n.location = r.err.location, n.originalMessage = r.err.message, n
                }
                return (null == t ? void 0 : t.captureLocation) || function e(t) {
                    t.forEach(function(t) {
                        if (delete t.location, 5 === t.type || 6 === t.type)
                            for (var r in t.options) delete t.options[r].location, e(t.options[r].value);
                        else 2 === t.type && ec(t.style) || (3 === t.type || 4 === t.type) && eu(t.style) ? delete t.style.location : 8 === t.type && e(t.children)
                    })
                }(r.val), r.val
            }, b.formats = {
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
            }, b);

            function eW(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ez(e) {
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

            function eX(e, t) {
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

            function e$(e, t) {
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
                        if ("string" == typeof e) return eW(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eW(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eZ() {
                for (var e, t, r, n, o, i = arguments.length, a = Array(i), l = 0; l < i; l++) a[l] = arguments[l];
                var c = e$(a, 4),
                    u = (c[0], c[1]),
                    s = c[2],
                    f = c[3];
                if (Array.isArray(u)) throw new U(G.INVALID_MESSAGE, void 0);
                if ("object" == (void 0 === u ? "undefined" : u && "u" > typeof Symbol && u.constructor === Symbol ? "symbol" : typeof u)) throw new U(G.INSUFFICIENT_PATH, void 0);
                if ("string" == typeof u) {
                    var p = s || /'[{}<#|']/.test(u) ? void 0 : u;
                    if (p) return p
                }
                var d = f.cache,
                    y = f.formats,
                    h = f.formatters,
                    b = f.globalFormats,
                    m = f.locale,
                    v = f.timeZone;
                h.getMessageFormat || (h.getMessageFormat = V(function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return new eK(t[0], t[1], t[2], ez({
                        formatters: h
                    }, t[3]))
                }, d.message));
                try {
                    o = h.getMessageFormat(u, m, (e = eK.formats.date, t = eK.formats.time, r = ez({}, null == b ? void 0 : b.dateTime, null == y ? void 0 : y.dateTime), n = {
                        date: ez({}, e, r),
                        time: ez({}, t, r),
                        number: ez({}, null == b ? void 0 : b.number, null == y ? void 0 : y.number)
                    }, v && ["date", "time"].forEach(function(e) {
                        var t = n[e],
                            r = !0,
                            o = !1,
                            i = void 0;
                        try {
                            for (var a, l = Object.entries(t)[Symbol.iterator](); !(r = (a = l.next()).done); r = !0) {
                                var c = e$(a.value, 2),
                                    u = c[0],
                                    s = c[1];
                                t[u] = ez({
                                    timeZone: v
                                }, s)
                            }
                        } catch (e) {
                            o = !0, i = e
                        } finally {
                            try {
                                r || null == l.return || l.return()
                            } finally {
                                if (o) throw i
                            }
                        }
                    }), n), {
                        formatters: eX(ez({}, h), {
                            getDateTimeFormat: function(e, t) {
                                var r;
                                return h.getDateTimeFormat(e, eX(ez({}, t), {
                                    timeZone: null != (r = null == t ? void 0 : t.timeZone) ? r : v
                                }))
                            }
                        })
                    })
                } catch (e) {
                    throw new U(G.INVALID_MESSAGE, void 0)
                }
                var g = o.format(s);
                return (0, S.isValidElement)(g) || Array.isArray(g) || "string" == typeof g ? g : String(g)
            }

            function eY(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function eq(e) {
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

            function eJ(e, t) {
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

            function eQ() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return t.filter(Boolean).join(".")
            }

            function e0(e) {
                return eQ(e.namespace, e.key)
            }

            function e1(e) {
                console.error(e)
            }

            function e2(e, t, r, n) {
                var o = eQ(n, r);
                if (!t) throw Error(o);
                var i = t;
                return r.split(".").forEach(function(t) {
                    var r = i[t];
                    if (null == t || null == r) throw Error(o + " (".concat(e, ")"));
                    i = r
                }), i
            }
            eZ.raw = !0;
            var e3 = (0, S.createContext)(void 0);

            function e8(e) {
                var t = e.children,
                    r = e.formats,
                    n = e.getMessageFallback,
                    o = e.locale,
                    i = e.messages,
                    a = e.now,
                    l = e.onError,
                    c = e.timeZone,
                    u = (0, S.useContext)(e3),
                    s = (0, S.useMemo)(function() {
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
                    f = (0, S.useMemo)(function() {
                        return (null == u ? void 0 : u.formatters) || {
                            getDateTimeFormat: K(Intl.DateTimeFormat, s.dateTime),
                            getNumberFormat: K(Intl.NumberFormat, s.number),
                            getPluralRules: K(Intl.PluralRules, s.pluralRules),
                            getRelativeTimeFormat: K(Intl.RelativeTimeFormat, s.relativeTime),
                            getListFormat: K(Intl.ListFormat, s.list),
                            getDisplayNames: K(Intl.DisplayNames, s.displayNames)
                        }
                    }, [s, null == u ? void 0 : u.formatters]),
                    p = (0, S.useMemo)(function() {
                        var e, t, p, d, y, h, b;
                        return h = function(e) {
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
                            messages: void 0 === i ? null == u ? void 0 : u.messages : i,
                            now: a || (null == u ? void 0 : u.now),
                            onError: l || (null == u ? void 0 : u.onError),
                            timeZone: c || (null == u ? void 0 : u.timeZone)
                        }).formats, p = e.getMessageFallback, d = e.messages, y = e.onError, eJ(eq({}, function(e, t) {
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
                        }(e, ["formats", "getMessageFallback", "messages", "onError"])), {
                            formats: t || void 0,
                            messages: d || void 0,
                            onError: y || e1,
                            getMessageFallback: p || e0
                        }))), b = b = {
                            formatters: f,
                            cache: s
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(h, Object.getOwnPropertyDescriptors(b)) : (function(e) {
                            var t = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                t.push.apply(t, r)
                            }
                            return t
                        })(Object(b)).forEach(function(e) {
                            Object.defineProperty(h, e, Object.getOwnPropertyDescriptor(b, e))
                        }), h
                    }, [s, r, f, n, o, i, a, l, u, c]);
                return (0, w.jsx)(e3.Provider, {
                    value: p,
                    children: t
                })
            }

            function e5() {
                var e = (0, S.useContext)(e3);
                if (!e) throw Error(void 0);
                return e
            }
            var e6 = !1,
                e4 = "u" < typeof window,
                e7 = window.Roblox["core-lib"].index;

            function e9(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function te(e) {
                return function(e) {
                    if (Array.isArray(e)) return e9(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return e9(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return e9(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            te(["ar-001", "de-de", "en-us", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn", "zh-cn", "zh-tw"]).concat(te(["bg-bg", "bn-bd", "bs-ba", "cs-cz", "da-dk", "el-gr", "en-gb", "es-mx", "et-ee", "fi-fi", "fil-ph", "fr-ca", "hr-hr", "hu-hu", "ka-ge", "kk-kz", "km-kh", "lt-lt", "lv-lv", "ms-my", "my-mm", "nb-no", "nl-nl", "pt-pt", "ro-ro", "ru-ru", "si-lk", "sk-sk", "sl-sl", "sq-al", "sr-rs", "sv-se", "uk-ua"]));
            var tt = te(["ar_001", "de_de", "en_us", "es_es", "fr_fr", "hi_in", "id_id", "it_it", "ja_jp", "ko_kr", "pl_pl", "pt_br", "th_th", "tr_tr", "vi_vn", "zh_cn", "zh_tw"]).concat(te(["bg_bg", "bn_bd", "bs_ba", "cs_cz", "da_dk", "el_gr", "en_gb", "es_mx", "et_ee", "fi_fi", "fil_ph", "fr_ca", "hr_hr", "hu_hu", "ka_ge", "kk_kz", "km_kh", "lt_lt", "lv_lv", "ms_my", "my_mm", "nb_no", "nl_nl", "pt_pt", "ro_ro", "ru_ru", "si_lk", "sk_sk", "sl_sl", "sq_al", "sr_rs", "sv_se", "uk_ua"])),
                tr = te(["ar-001", "de-DE", "en-US", "es-ES", "fr-FR", "hi-IN", "id-ID", "it-IT", "ja-JP", "ko-KR", "pl-PL", "pt-BR", "th-TH", "tr-TR", "vi-VN", "zh-CN", "zh-TW"]).concat(te(["bg-BG", "bn-BD", "bs-BA", "cs-CZ", "da-DK", "el-GR", "en-GB", "es-MX", "et-EE", "fi-FI", "fil-PH", "fr-CA", "hr-HR", "hu-HU", "ka-GE", "kk-KZ", "km-KH", "lt-LT", "lv-LV", "ms-MY", "my-MM", "nb-NO", "nl-NL", "pt-PT", "ro-RO", "ru-RU", "si-LK", "sk-SK", "sl-SL", "sq-AL", "sr-RS", "sv-SE", "uk-UA"]));
            te(["ar", "de", "es", "fr", "hi", "id", "it", "ja", "ko", "pl", "pt", "th", "tr", "vi"]).concat(te(["ar-001", "de-de", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn"]));
            var tn = function(e) {
                return e.replaceAll(".", ":")
            };

            function to(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var ti = function() {
                    if ("u" < typeof window) return {};
                    var e = window.Roblox;
                    return null != e ? e : {}
                },
                ta = function(e) {
                    return Object.fromEntries(Object.entries(null != e ? e : {}).flatMap(function(e) {
                        var t = function(e) {
                                if (Array.isArray(e)) return e
                            }(e) || function(e) {
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
                            }(e) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return to(e, 2);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return to(e, 2)
                                }
                            }(e) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            r = t[0],
                            n = t[1];
                        return null == n ? [] : [
                            [tn(r), n]
                        ]
                    }))
                },
                tl = function(e) {
                    var t = ti(),
                        r = t.Lang,
                        n = t.LangDynamic,
                        o = t.LangDynamicDefault;
                    return Object.fromEntries(e.map(function(e) {
                        return [tn(e), function(e) {
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
                        }({}, ta(null == o ? void 0 : o[e]), ta(null == r ? void 0 : r[e]), ta(null == n ? void 0 : n[e]))]
                    }))
                },
                tc = function(e) {
                    var t, r, n = e.namespaces,
                        o = e.locale,
                        i = e.children,
                        a = n.join(","),
                        l = (0, S.useMemo)(function() {
                            return tl(n)
                        }, [a]);
                    return (0, w.jsx)(e8, {
                        locale: null != o ? o : null != (t = null != (r = function() {
                            if (!("u" < typeof document)) {
                                var e = document.documentElement.lang;
                                if (e) return (0, e7.arrayIncludes)(tr, e) ? e.toLowerCase() : void 0
                            }
                        }()) ? r : function() {
                            if ("u" < typeof document) return;
                            var e, t = document.querySelector('meta[name="locale-data"]');
                            if (null != (e = HTMLMetaElement) && "u" > typeof Symbol && e[Symbol.hasInstance] ? e[Symbol.hasInstance](t) : t instanceof e) {
                                var r = t.dataset.languageCode;
                                if (r && (0, e7.arrayIncludes)(tt, r)) return r.replace("_", "-")
                            }
                        }()) ? t : "en-us",
                        messages: l,
                        children: i
                    })
                },
                tu = function() {
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
                },
                ts = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                tf = function(e) {
                    var t = e.className;
                    return P().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: tu("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                };

            function tp(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function td(e) {
                if (Array.isArray(e)) return e
            }

            function ty() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function th(e, t) {
                if (e) {
                    if ("string" == typeof e) return tp(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tp(e, t)
                }
            }
            var tb = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                tm = P().forwardRef(function(e, t) {
                    var r, n = td(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || th(r) || ty(),
                        o = n[0],
                        i = n.slice(1),
                        a = o.name,
                        l = o.size,
                        c = o.className,
                        u = (o.children, function(e, t) {
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
                        s = (td(i) || function(e) {
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
                        }(i) || th(i, 1) || ty())[0];
                    return P().createElement("span", function(e) {
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
                        className: tu("grow-0 shrink-0 basis-auto icon", a, tb[void 0 === l ? "Medium" : l], c)
                    }, u))
                });
            tm.displayName = "Icon";
            var tv = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                tg = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                tO = function(e) {
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
                    return P().createElement("button", function(e) {
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
                        className: tu("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", ts, tg[t], tv[r], n && "radius-circle", o)
                    }, i), P().createElement(tf, null), P().createElement(tm, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function tw(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function tE(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tj(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function tS() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = tj(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : tj(t[e], null)
                        }
                    }
                }
            }

            function tP() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return S.useCallback(tS.apply(void 0, function(e) {
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

            function tx(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tA(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function tT(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        tA(e, t, r[t])
                    })
                }
                return e
            }

            function tC(e, t) {
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

            function tN() {
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
                            return tT({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return S.useMemo(function() {
                            return tA({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }
            var tR = (null == (m = globalThis) ? void 0 : m.document) ? S.useLayoutEffect : function() {};

            function t_(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var tD = S[" useId ".trim().toString()] || function() {},
                tk = 0;

            function tM(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = S.useState(tD())) || function(e) {
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
                            if ("string" == typeof e) return t_(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return t_(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    o = r[1];
                return tR(function() {
                    e || o(function(e) {
                        return null != e ? e : String(tk++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function tB(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tL(e) {
                var t = S.useRef(e);
                return S.useEffect(function() {
                    t.current = e
                }), S.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return tB(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return tB(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tB(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function tH(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tF(e, t) {
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
                        if ("string" == typeof e) return tH(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tH(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tU = window.RadixUI["react-dismissable-layer"],
                tG = window.RadixUI["react-focus-scope"];

            function tV(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tK(e) {
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

            function tW(e, t) {
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

            function tX(e) {
                return function(e) {
                    if (Array.isArray(e)) return tV(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tV(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tV(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function t$(e) {
                var t, r, n = (t = e, (r = S.forwardRef(function(e, t) {
                        var r = e.children,
                            n = tz(e, ["children"]);
                        if (S.isValidElement(r)) {
                            var o, i, a, l, c, u = (c = (l = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = tK({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            i = t[n];
                                        /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            i.apply(void 0, tX(t)), o.apply(void 0, tX(t))
                                        } : o && (r[n] = o) : "style" === n ? r[n] = tK({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                    }(n);
                                    return tK({}, e, r)
                                }(n, r.props);
                            return r.type !== S.Fragment && (s.ref = t ? tS(t, u) : u), S.cloneElement(r, s)
                        }
                        return S.Children.count(r) > 1 ? S.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = S.forwardRef(function(e, t) {
                        var r = e.children,
                            o = tz(e, ["children"]),
                            i = S.Children.toArray(r),
                            a = i.find(tY);
                        if (a) {
                            var l = a.props.children,
                                c = i.map(function(e) {
                                    return e !== a ? e : S.Children.count(l) > 1 ? S.Children.only(null) : S.isValidElement(l) ? l.props.children : null
                                });
                            return (0, w.jsx)(n, tW(tK({}, o), {
                                ref: t,
                                children: S.isValidElement(l) ? S.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, w.jsx)(n, tW(tK({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            var tZ = Symbol("radix.slottable");

            function tY(e) {
                return S.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === tZ
            }

            function tq(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function tJ(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        tq(e, t, r[t])
                    })
                }
                return e
            }

            function tQ(e, t) {
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
            var t0 = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                var r = t$("Primitive.".concat(t)),
                    n = S.forwardRef(function(e, n) {
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
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, w.jsx)(a, tQ(tJ({}, i), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), tQ(tJ({}, e), tq({}, t, n))
            }, {});

            function t1(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var t2 = S.forwardRef(function(e, t) {
                var r, n, o, i, a, l = e.container,
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
                    }(e, ["container"]),
                    u = function(e) {
                        if (Array.isArray(e)) return e
                    }(r = S.useState(!1)) || function(e) {
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
                            if ("string" == typeof e) return t1(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return t1(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = u[0],
                    f = u[1];
                tR(function() {
                    return f(!0)
                }, []);
                var p = l || s && (null == (a = globalThis) || null == (i = a.document) ? void 0 : i.body);
                return p ? A().createPortal((0, w.jsx)(t0.div, (n = function(e) {
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
                }({}, c), o = o = {
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
                }), n)), p) : null
            });

            function t3(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function t8(e, t) {
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
                        if ("string" == typeof e) return t3(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return t3(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            t2.displayName = "Portal";
            var t5 = function(e) {
                var t, r, n, o, i, a, l, c, u, s, f, p, d, y, h, b, m, v = e.present,
                    g = e.children,
                    O = (t = v, i = (o = t8(S.useState(), 2))[0], a = o[1], l = S.useRef({}), c = S.useRef(t), u = S.useRef("none"), f = (s = t8((r = t ? "mounted" : "unmounted", n = {
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
                    }, S.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], p = s[1], S.useEffect(function() {
                        var e = t6(l.current);
                        u.current = "mounted" === f ? e : "none"
                    }, [f]), tR(function() {
                        var e = l.current,
                            r = c.current;
                        if (r !== t) {
                            var n = u.current,
                                o = t6(e);
                            t ? p("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? p("UNMOUNT") : r && n !== o ? p("ANIMATION_OUT") : p("UNMOUNT"), c.current = t
                        }
                    }, [t, p]), tR(function() {
                        if (i) {
                            var e, t, r = null != (e = i.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = t6(l.current).includes(e.animationName);
                                    if (e.target === i && n && (p("ANIMATION_END"), !c.current)) {
                                        var o = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === i && (u.current = t6(l.current))
                                };
                            return i.addEventListener("animationstart", o), i.addEventListener("animationcancel", n), i.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), i.removeEventListener("animationstart", o), i.removeEventListener("animationcancel", n), i.removeEventListener("animationend", n)
                                }
                        }
                        p("ANIMATION_END")
                    }, [i, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: S.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    w = "function" == typeof g ? g({
                        present: O.isPresent
                    }) : S.Children.only(g),
                    E = tP(O.ref, (m = (b = null == (y = Object.getOwnPropertyDescriptor((d = w).props, "ref")) ? void 0 : y.get) && "isReactWarning" in b && b.isReactWarning) ? d.ref : (m = (b = null == (h = Object.getOwnPropertyDescriptor(d, "ref")) ? void 0 : h.get) && "isReactWarning" in b && b.isReactWarning) ? d.props.ref : d.props.ref || d.ref);
                return "function" == typeof g || O.isPresent ? S.cloneElement(w, {
                    ref: E
                }) : null
            };

            function t6(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            t5.displayName = "Presence";
            var t4 = window.RadixUI["react-focus-guards"],
                t7 = function() {
                    return (t7 = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }).apply(this, arguments)
                };

            function t9(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var o = 0, n = Object.getOwnPropertySymbols(e); o < n.length; o++) 0 > t.indexOf(n[o]) && Object.prototype.propertyIsEnumerable.call(e, n[o]) && (r[n[o]] = e[n[o]]);
                return r
            }
            var re = "right-scroll-bar-position",
                rt = "width-before-scroll-bar";

            function rr(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var rn = "u" > typeof window ? S.useLayoutEffect : S.useEffect,
                ro = new WeakMap,
                ri = (void 0 === o && (o = {}), (void 0 === i && (i = function(e) {
                    return e
                }), a = [], l = !1, c = {
                    read: function() {
                        if (l) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return a.length ? a[a.length - 1] : null
                    },
                    useMedium: function(e) {
                        var t = i(e, l);
                        return a.push(t),
                            function() {
                                a = a.filter(function(e) {
                                    return e !== t
                                })
                            }
                    },
                    assignSyncMedium: function(e) {
                        for (l = !0; a.length;) {
                            var t = a;
                            a = [], t.forEach(e)
                        }
                        a = {
                            push: function(t) {
                                return e(t)
                            },
                            filter: function() {
                                return a
                            }
                        }
                    },
                    assignMedium: function(e) {
                        l = !0;
                        var t = [];
                        if (a.length) {
                            var r = a;
                            a = [], r.forEach(e), t = a
                        }
                        var n = function() {
                                var r = t;
                                t = [], r.forEach(e)
                            },
                            o = function() {
                                return Promise.resolve().then(n)
                            };
                        o(), a = {
                            push: function(e) {
                                t.push(e), o()
                            },
                            filter: function(e) {
                                return t = t.filter(e), a
                            }
                        }
                    }
                }).options = t7({
                    async: !0,
                    ssr: !1
                }, o), c),
                ra = function() {},
                rl = S.forwardRef(function(e, t) {
                    var r, n, o, i, a = S.useRef(null),
                        l = S.useState({
                            onScrollCapture: ra,
                            onWheelCapture: ra,
                            onTouchMoveCapture: ra
                        }),
                        c = l[0],
                        u = l[1],
                        s = e.forwardProps,
                        f = e.children,
                        p = e.className,
                        d = e.removeScrollBar,
                        y = e.enabled,
                        h = e.shards,
                        b = e.sideCar,
                        m = e.noRelative,
                        v = e.noIsolation,
                        g = e.inert,
                        O = e.allowPinchZoom,
                        w = e.as,
                        E = e.gapMode,
                        j = t9(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        P = (r = [a, t], n = function(e) {
                            return r.forEach(function(t) {
                                return rr(t, e)
                            })
                        }, (o = (0, S.useState)(function() {
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
                        })[0]).callback = n, i = o.facade, rn(function() {
                            var e = ro.get(i);
                            if (e) {
                                var t = new Set(e),
                                    n = new Set(r),
                                    o = i.current;
                                t.forEach(function(e) {
                                    n.has(e) || rr(e, null)
                                }), n.forEach(function(e) {
                                    t.has(e) || rr(e, o)
                                })
                            }
                            ro.set(i, r)
                        }, [r]), i),
                        x = t7(t7({}, j), c);
                    return S.createElement(S.Fragment, null, y && S.createElement(b, {
                        sideCar: ri,
                        removeScrollBar: d,
                        shards: h,
                        noRelative: m,
                        noIsolation: v,
                        inert: g,
                        setCallbacks: u,
                        allowPinchZoom: !!O,
                        lockRef: a,
                        gapMode: E
                    }), s ? S.cloneElement(S.Children.only(f), t7(t7({}, x), {
                        ref: P
                    })) : S.createElement(void 0 === w ? "div" : w, t7({}, x, {
                        className: p,
                        ref: P
                    }), f))
                });
            rl.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, rl.classNames = {
                fullWidth: rt,
                zeroRight: re
            };
            var rc = function(e) {
                var t = e.sideCar,
                    r = t9(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var n = t.read();
                if (!n) throw Error("Sidecar medium not found");
                return S.createElement(n, t7({}, r))
            };
            rc.isSideCarExport = !0;
            var ru = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(n) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = v || r.nc;
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
                rs = function() {
                    var e = ru();
                    return function(t, r) {
                        S.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && r])
                    }
                },
                rf = function() {
                    var e = rs();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                rp = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                rd = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                ry = function(e) {
                    var t = window.getComputedStyle(document.body),
                        r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        n = t["padding" === e ? "paddingTop" : "marginTop"],
                        o = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [rd(r), rd(n), rd(o)]
                },
                rh = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return rp;
                    var t = ry(e),
                        r = document.documentElement.clientWidth,
                        n = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, n - r + t[2] - t[0])
                    }
                },
                rb = rf(),
                rm = "data-scroll-locked",
                rv = function(e, t, r, n) {
                    var o = e.left,
                        i = e.top,
                        a = e.right,
                        l = e.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(l, "px ").concat(n, ";\n  }\n  body[").concat(rm, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(re, " {\n    right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(rt, " {\n    margin-right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(re, " .").concat(re, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(rt, " .").concat(rt, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(rm, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                rg = function() {
                    var e = parseInt(document.body.getAttribute(rm) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                rO = function() {
                    S.useEffect(function() {
                        return document.body.setAttribute(rm, (rg() + 1).toString()),
                            function() {
                                var e = rg() - 1;
                                e <= 0 ? document.body.removeAttribute(rm) : document.body.setAttribute(rm, e.toString())
                            }
                    }, [])
                },
                rw = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        n = e.gapMode,
                        o = void 0 === n ? "margin" : n;
                    rO();
                    var i = S.useMemo(function() {
                        return rh(o)
                    }, [o]);
                    return S.createElement(rb, {
                        styles: rv(i, !t, o, r ? "" : "!important")
                    })
                },
                rE = !1;
            if ("u" > typeof window) try {
                var rj = Object.defineProperty({}, "passive", {
                    get: function() {
                        return rE = !0, !0
                    }
                });
                window.addEventListener("test", rj, rj), window.removeEventListener("test", rj, rj)
            } catch (e) {
                rE = !1
            }
            var rS = !!rE && {
                passive: !1
            };

            function rP(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var rx = function(e, t) {
                    if (!rP(e, Element)) return !1;
                    var r = window.getComputedStyle(e);
                    return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
                },
                rA = function(e, t) {
                    var r = t.ownerDocument,
                        n = t;
                    do {
                        if ("u" > typeof ShadowRoot && rP(n, ShadowRoot) && (n = n.host), rT(e, n)) {
                            var o = rC(e, n);
                            if (o[1] > o[2]) return !0
                        }
                        n = n.parentNode
                    } while (n && n !== r.body);
                    return !1
                },
                rT = function(e, t) {
                    return "v" === e ? rx(t, "overflowY") : rx(t, "overflowX")
                },
                rC = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                rI = function(e, t, r, n, o) {
                    var i, a = (i = window.getComputedStyle(t).direction, "h" === e && "rtl" === i ? -1 : 1),
                        l = a * n,
                        c = r.target,
                        u = t.contains(c),
                        s = !1,
                        f = l > 0,
                        p = 0,
                        d = 0;
                    do {
                        if (!c) break;
                        var y = rC(e, c),
                            h = y[0],
                            b = y[1] - y[2] - a * h;
                        (h || b) && rT(e, c) && (p += b, d += h);
                        var m = c.parentNode;
                        c = m && m.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? m.host : m
                    } while (!u && c !== document.body || u && (t.contains(c) || t === c));
                    return f && (o && 1 > Math.abs(p) || !o && l > p) ? s = !0 : !f && (o && 1 > Math.abs(d) || !o && -l > d) && (s = !0), s
                },
                rN = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                rR = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                r_ = function(e) {
                    return e && "current" in e ? e.current : e
                },
                rD = 0,
                rk = [],
                rM = (u = function(e) {
                    var t = S.useRef([]),
                        r = S.useRef([0, 0]),
                        n = S.useRef(),
                        o = S.useState(rD++)[0],
                        i = S.useState(rf)[0],
                        a = S.useRef(e);
                    S.useEffect(function() {
                        a.current = e
                    }, [e]), S.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(o));
                            var t = (function(e, t, r) {
                                if (r || 2 == arguments.length)
                                    for (var n, o = 0, i = t.length; o < i; o++) !n && o in t || (n || (n = Array.prototype.slice.call(t, 0, o)), n[o] = t[o]);
                                return e.concat(n || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(r_), !0).filter(Boolean);
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
                    var l = S.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !a.current.allowPinchZoom;
                            var o, i = rN(e),
                                l = r.current,
                                c = "deltaX" in e ? e.deltaX : l[0] - i[0],
                                u = "deltaY" in e ? e.deltaY : l[1] - i[1],
                                s = e.target,
                                f = Math.abs(c) > Math.abs(u) ? "h" : "v";
                            if ("touches" in e && "h" === f && "range" === s.type) return !1;
                            var p = rA(f, s);
                            if (!p) return !0;
                            if (p ? o = f : (o = "v" === f ? "h" : "v", p = rA(f, s)), !p) return !1;
                            if (!n.current && "changedTouches" in e && (c || u) && (n.current = o), !o) return !0;
                            var d = n.current || o;
                            return rI(d, t, e, "h" === d ? c : u, !0)
                        }, []),
                        c = S.useCallback(function(e) {
                            if (rk.length && rk[rk.length - 1] === i) {
                                var r = "deltaY" in e ? rR(e) : rN(e),
                                    n = t.current.filter(function(t) {
                                        var n;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                                    })[0];
                                if (n && n.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!n) {
                                    var o = (a.current.shards || []).map(r_).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (o.length > 0 ? l(e, o[0]) : !a.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        u = S.useCallback(function(e, r, n, o) {
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
                        s = S.useCallback(function(e) {
                            r.current = rN(e), n.current = void 0
                        }, []),
                        f = S.useCallback(function(t) {
                            u(t.type, rR(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        p = S.useCallback(function(t) {
                            u(t.type, rN(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    S.useEffect(function() {
                        return rk.push(i), e.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: p
                            }), document.addEventListener("wheel", c, rS), document.addEventListener("touchmove", c, rS), document.addEventListener("touchstart", s, rS),
                            function() {
                                rk = rk.filter(function(e) {
                                    return e !== i
                                }), document.removeEventListener("wheel", c, rS), document.removeEventListener("touchmove", c, rS), document.removeEventListener("touchstart", s, rS)
                            }
                    }, []);
                    var d = e.removeScrollBar,
                        y = e.inert;
                    return S.createElement(S.Fragment, null, y ? S.createElement(i, {
                        styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
                    }) : null, d ? S.createElement(rw, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, ri.useMedium(u), rc),
                rB = S.forwardRef(function(e, t) {
                    return S.createElement(rl, t7({}, e, {
                        ref: t,
                        sideCar: rM
                    }))
                });
            rB.classNames = rl.classNames;
            var rL = new WeakMap,
                rH = new WeakMap,
                rF = {},
                rU = 0,
                rG = function(e) {
                    return e && (e.host || rG(e.parentNode))
                },
                rV = function(e, t, r, n) {
                    var o = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var r = rG(e);
                        return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    rF[r] || (rF[r] = new WeakMap);
                    var i = rF[r],
                        a = [],
                        l = new Set,
                        c = new Set(o),
                        u = function(e) {
                            !e || l.has(e) || (l.add(e), u(e.parentNode))
                        };
                    o.forEach(u);
                    var s = function(e) {
                        !e || c.has(e) || Array.prototype.forEach.call(e.children, function(e) {
                            if (l.has(e)) s(e);
                            else try {
                                var t = e.getAttribute(n),
                                    o = null !== t && "false" !== t,
                                    c = (rL.get(e) || 0) + 1,
                                    u = (i.get(e) || 0) + 1;
                                rL.set(e, c), i.set(e, u), a.push(e), 1 === c && o && rH.set(e, !0), 1 === u && e.setAttribute(r, "true"), o || e.setAttribute(n, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return s(t), l.clear(), rU++,
                        function() {
                            a.forEach(function(e) {
                                var t = rL.get(e) - 1,
                                    o = i.get(e) - 1;
                                rL.set(e, t), i.set(e, o), t || (rH.has(e) || e.removeAttribute(n), rH.delete(e)), o || e.removeAttribute(r)
                            }), --rU || (rL = new WeakMap, rL = new WeakMap, rH = new WeakMap, rF = {})
                        }
                },
                rK = function(e, t, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var n = Array.from(Array.isArray(e) ? e : [e]),
                        o = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return o ? (n.push.apply(n, Array.from(o.querySelectorAll("[aria-live], script"))), rV(n, o, r, "aria-hidden")) : function() {
                        return null
                    }
                };

            function rW(e, t) {
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

            function rX(e, t) {
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

            function r$(e, t) {
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
                        if ("string" == typeof e) return rW(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rW(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rY = "Dialog",
                rq = rZ(function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        n = function() {
                            var t = r.map(function(e) {
                                return S.createContext(e)
                            });
                            return function(r) {
                                var n = (null == r ? void 0 : r[e]) || t;
                                return S.useMemo(function() {
                                    var t, o;
                                    return tA({}, "__scope".concat(e), (t = tT({}, r), o = null != (o = tA({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
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
                        var o = S.createContext(n),
                            i = r.length;
                        r = tI(r).concat([n]);
                        var a = function(t) {
                            var r, n = t.scope,
                                a = t.children,
                                l = tC(t, ["scope", "children"]),
                                c = (null == n || null == (r = n[e]) ? void 0 : r[i]) || o,
                                u = S.useMemo(function() {
                                    return l
                                }, Object.values(l));
                            return (0, w.jsx)(c.Provider, {
                                value: u,
                                children: a
                            })
                        };
                        return a.displayName = t + "Provider", [a, function(r, a) {
                            var l, c = (null == a || null == (l = a[e]) ? void 0 : l[i]) || o,
                                u = S.useContext(c);
                            if (u) return u;
                            if (void 0 !== n) return n;
                            throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                        }]
                    }, tN.apply(void 0, [n].concat(tI(t)))]
                }(rY), 2),
                rJ = rq[0];
            rq[1];
            var rQ = rZ(rJ(rY), 2),
                r0 = rQ[0],
                r1 = rQ[1],
                r2 = function(e) {
                    var t, r, n, o, i, a, l, c, u, s, f, p, d, y, h, b, m, v = e.__scopeDialog,
                        g = e.children,
                        O = e.open,
                        E = e.defaultOpen,
                        j = e.onOpenChange,
                        P = e.modal,
                        x = S.useRef(null),
                        A = S.useRef(null),
                        T = rZ((u = (c = {
                            prop: O,
                            defaultProp: E,
                            onChange: j
                        }).prop, d = (p = tF((r = (t = {
                            defaultProp: c.defaultProp,
                            onChange: f = void 0 === (s = c.onChange) ? function() {} : s
                        }).defaultProp, n = t.onChange, i = tF(o = S.useState(r), 1)[0], a = S.useRef(i), l = tL(n), S.useEffect(function() {
                            a.current !== i && (l(i), a.current = i)
                        }, [i, a, l]), o), 2))[0], y = p[1], b = (h = void 0 !== u) ? u : d, m = tL(f), [b, S.useCallback(function(e) {
                            if (h) {
                                var t = "function" == typeof e ? e(u) : e;
                                t !== u && m(t)
                            } else y(e)
                        }, [h, u, y, m])]), 2),
                        C = T[0],
                        I = T[1];
                    return (0, w.jsx)(r0, {
                        scope: v,
                        triggerRef: x,
                        contentRef: A,
                        contentId: tM(),
                        titleId: tM(),
                        descriptionId: tM(),
                        open: void 0 !== C && C,
                        onOpenChange: I,
                        onOpenToggle: S.useCallback(function() {
                            return I(function(e) {
                                return !e
                            })
                        }, [I]),
                        modal: void 0 === P || P,
                        children: g
                    })
                };
            r2.displayName = rY;
            var r3 = "DialogTrigger";
            S.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = r$(e, ["__scopeDialog"]),
                    o = r1(r3, r),
                    i = tP(t, o.triggerRef);
                return (0, w.jsx)(t0.button, rX(rz({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": o.open,
                    "aria-controls": o.contentId,
                    "data-state": nd(o.open)
                }, n), {
                    ref: i,
                    onClick: tw(e.onClick, o.onOpenToggle)
                }))
            }).displayName = r3;
            var r8 = "DialogPortal",
                r5 = rZ(rJ(r8, {
                    forceMount: void 0
                }), 2),
                r6 = r5[0],
                r4 = r5[1],
                r7 = function(e) {
                    var t = e.__scopeDialog,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        i = r1(r8, t);
                    return (0, w.jsx)(r6, {
                        scope: t,
                        forceMount: r,
                        children: S.Children.map(n, function(e) {
                            return (0, w.jsx)(t5, {
                                present: r || i.open,
                                children: (0, w.jsx)(t2, {
                                    asChild: !0,
                                    container: o,
                                    children: e
                                })
                            })
                        })
                    })
                };
            r7.displayName = r8;
            var r9 = "DialogOverlay",
                ne = S.forwardRef(function(e, t) {
                    var r = r4(r9, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        i = r$(e, ["forceMount"]),
                        a = r1(r9, e.__scopeDialog);
                    return a.modal ? (0, w.jsx)(t5, {
                        present: o || a.open,
                        children: (0, w.jsx)(nr, rX(rz({}, i), {
                            ref: t
                        }))
                    }) : null
                });
            ne.displayName = r9;
            var nt = t$("DialogOverlay.RemoveScroll"),
                nr = S.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = r$(e, ["__scopeDialog"]),
                        o = r1(r9, r);
                    return (0, w.jsx)(rB, {
                        as: nt,
                        allowPinchZoom: !0,
                        shards: [o.contentRef],
                        children: (0, w.jsx)(t0.div, rX(rz({
                            "data-state": nd(o.open)
                        }, n), {
                            ref: t,
                            style: rz({
                                pointerEvents: "auto"
                            }, n.style)
                        }))
                    })
                }),
                nn = "DialogContent",
                no = S.forwardRef(function(e, t) {
                    var r = r4(nn, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        i = r$(e, ["forceMount"]),
                        a = r1(nn, e.__scopeDialog);
                    return (0, w.jsx)(t5, {
                        present: o || a.open,
                        children: a.modal ? (0, w.jsx)(ni, rX(rz({}, i), {
                            ref: t
                        })) : (0, w.jsx)(na, rX(rz({}, i), {
                            ref: t
                        }))
                    })
                });
            no.displayName = nn;
            var ni = S.forwardRef(function(e, t) {
                    var r = r1(nn, e.__scopeDialog),
                        n = S.useRef(null),
                        o = tP(t, r.contentRef, n);
                    return S.useEffect(function() {
                        var e = n.current;
                        if (e) return rK(e)
                    }, []), (0, w.jsx)(nl, rX(rz({}, e), {
                        ref: o,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: tw(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: tw(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                r = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || r) && e.preventDefault()
                        }),
                        onFocusOutside: tw(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                na = S.forwardRef(function(e, t) {
                    var r = r1(nn, e.__scopeDialog),
                        n = S.useRef(!1),
                        o = S.useRef(!1);
                    return (0, w.jsx)(nl, rX(rz({}, e), {
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
                nl = S.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        i = e.onCloseAutoFocus,
                        a = r$(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = r1(nn, r),
                        c = S.useRef(null),
                        u = tP(t, c);
                    return (0, t4.useFocusGuards)(), (0, w.jsxs)(w.Fragment, {
                        children: [(0, w.jsx)(tG.FocusScope, {
                            asChild: !0,
                            loop: !0,
                            trapped: n,
                            onMountAutoFocus: o,
                            onUnmountAutoFocus: i,
                            children: (0, w.jsx)(tU.DismissableLayer, rX(rz({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": nd(l.open)
                            }, a), {
                                ref: u,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, w.jsxs)(w.Fragment, {
                            children: [(0, w.jsx)(nm, {
                                titleId: l.titleId
                            }), (0, w.jsx)(nv, {
                                contentRef: c,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                nc = "DialogTitle",
                nu = S.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = r$(e, ["__scopeDialog"]),
                        o = r1(nc, r);
                    return (0, w.jsx)(t0.h2, rX(rz({
                        id: o.titleId
                    }, n), {
                        ref: t
                    }))
                });
            nu.displayName = nc;
            var ns = "DialogDescription";
            S.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = r$(e, ["__scopeDialog"]),
                    o = r1(ns, r);
                return (0, w.jsx)(t0.p, rX(rz({
                    id: o.descriptionId
                }, n), {
                    ref: t
                }))
            }).displayName = ns;
            var nf = "DialogClose",
                np = S.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = r$(e, ["__scopeDialog"]),
                        o = r1(nf, r);
                    return (0, w.jsx)(t0.button, rX(rz({
                        type: "button"
                    }, n), {
                        ref: t,
                        onClick: tw(e.onClick, function() {
                            return o.onOpenChange(!1)
                        })
                    }))
                });

            function nd(e) {
                return e ? "open" : "closed"
            }
            np.displayName = nf;
            var ny = "DialogTitleWarning",
                nh = rZ((s = {
                    contentName: nn,
                    titleName: nc,
                    docsSlug: "dialog"
                }, f = S.createContext(s), (p = function(e) {
                    var t = e.children,
                        r = tC(e, ["children"]),
                        n = S.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, w.jsx)(f.Provider, {
                        value: n,
                        children: t
                    })
                }).displayName = ny + "Provider", [p, function(e) {
                    var t = S.useContext(f);
                    if (t) return t;
                    if (void 0 !== s) return s;
                    throw Error("`".concat(e, "` must be used within `").concat(ny, "`"))
                }]), 2),
                nb = (nh[0], nh[1]),
                nm = function(e) {
                    var t = e.titleId,
                        r = nb(ny),
                        n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return S.useEffect(function() {
                        t && (document.getElementById(t) || console.error(n))
                    }, [n, t]), null
                },
                nv = function(e) {
                    var t = e.contentRef,
                        r = e.descriptionId,
                        n = nb("DialogDescriptionWarning"),
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
                    return S.useEffect(function() {
                        var e, n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        r && n && (document.getElementById(r) || console.warn(o))
                    }, [o, t, r]), null
                };

            function ng(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nO(e) {
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

            function nw(e, t) {
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

            function nE(e, t) {
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

            function nj(e) {
                return function(e) {
                    if (Array.isArray(e)) return ng(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return ng(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ng(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var nS = Symbol("radix.slottable");

            function nP(e) {
                return S.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === nS
            }

            function nx(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function nA(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        nx(e, t, r[t])
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
            var nC = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r, n, o, i, a, l = (r = o = "Primitive.".concat(t), (n = S.forwardRef(function(e, t) {
                        var r = e.children,
                            n = nE(e, ["children"]);
                        if (S.isValidElement(r)) {
                            var o, i, a, l, c, u = (c = (l = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = nO({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            i = t[n];
                                        /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = i.apply(void 0, nj(t));
                                            return o.apply(void 0, nj(t)), n
                                        } : o && (r[n] = o) : "style" === n ? r[n] = nO({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                    }(n);
                                    return nO({}, e, r)
                                }(n, r.props);
                            return r.type !== S.Fragment && (s.ref = t ? tS(t, u) : u), S.cloneElement(r, s)
                        }
                        return S.Children.count(r) > 1 ? S.Children.only(null) : null
                    })).displayName = "".concat(r, ".SlotClone"), i = n, (a = S.forwardRef(function(e, t) {
                        var r = e.children,
                            n = nE(e, ["children"]),
                            o = S.Children.toArray(r),
                            a = o.find(nP);
                        if (a) {
                            var l = a.props.children,
                                c = o.map(function(e) {
                                    return e !== a ? e : S.Children.count(l) > 1 ? S.Children.only(null) : S.isValidElement(l) ? l.props.children : null
                                });
                            return (0, w.jsx)(i, nw(nO({}, n), {
                                ref: t,
                                children: S.isValidElement(l) ? S.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, w.jsx)(i, nw(nO({}, n), {
                            ref: t,
                            children: r
                        }))
                    })).displayName = "".concat(o, ".Slot"), a),
                    c = S.forwardRef(function(e, r) {
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
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, w.jsx)(i, nT(nA({}, o), {
                            ref: r
                        }))
                    });
                return c.displayName = "Primitive.".concat(t), nT(nA({}, e), nx({}, t, c))
            }, {});

            function nI(e) {
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
            var nN = Object.freeze({
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
                nR = S.forwardRef(function(e, t) {
                    var r, n;
                    return (0, w.jsx)(nC.span, (r = nI({}, e), n = n = {
                        ref: t,
                        style: nI({}, nN, e.style)
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

            function n_(e) {
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

            function nD(e, t) {
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
            nR.displayName = "VisuallyHidden";
            var nk = (0, S.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                nM = function() {
                    var e = (0, S.useContext)(nk);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                nB = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                nL = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                nH = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                nF = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.children,
                        o = e.size,
                        i = e.type,
                        a = void 0 === i ? "Default" : i,
                        l = e.isModal,
                        c = e.hasCloseAffordance,
                        u = e.closeLabel,
                        s = e.hasMarginTop,
                        f = void 0 === s || s,
                        p = e.hasMarginBottom,
                        d = void 0 === p || p,
                        y = e.hasDescription,
                        h = void 0 !== y && y,
                        b = e.experimentalDisablePointerEventsStylingOnBody,
                        m = void 0 !== b && b,
                        v = (0, S.useMemo)(function() {
                            return {
                                size: o,
                                isModal: l,
                                type: a,
                                hasCloseAffordance: c,
                                closeLabel: u,
                                hasMarginTop: f,
                                hasMarginBottom: d,
                                hasDescription: h
                            }
                        }, [o, l, a, c, u, f, d, h]);
                    return (0, S.useEffect)(function() {
                        m && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [m, t]), P().createElement(nk.Provider, {
                        value: v
                    }, P().createElement(r2, {
                        open: t,
                        onOpenChange: r
                    }, n))
                };
            nF.displayName = "Dialog";
            var nU = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.style,
                    o = e.overlayClassName,
                    i = e.overlayStyle,
                    a = e.onOpenAutoFocus,
                    l = nD(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    c = nM(),
                    u = c.size,
                    s = c.isModal,
                    f = c.hasCloseAffordance,
                    p = c.closeLabel,
                    d = c.hasDescription,
                    y = tu("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", s && "bg-common-backdrop", o),
                    h = tu("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return P().createElement(r7, null, P().createElement(ne, {
                    className: y,
                    style: i
                }, P().createElement(no, n_({
                    className: h,
                    "data-size": u,
                    style: n,
                    onOpenAutoFocus: a
                }, !d && {
                    "aria-describedby": void 0
                }, l), f && P().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, P().createElement(np, {
                    asChild: !0
                }, P().createElement(tO, {
                    variant: "OverMedia",
                    size: u,
                    isCircular: !0,
                    "aria-label": p
                }))), t)))
            };
            nU.displayName = "DialogContent";
            var nG = function(e) {
                var t = e.children,
                    r = e.className,
                    n = nD(e, ["children", "className"]),
                    o = nM(),
                    i = o.size,
                    a = o.hasMarginTop,
                    l = o.hasMarginBottom,
                    c = tu(nB[i], a && nL[i], l && nH[i], r);
                return P().createElement("div", n_({
                    className: c
                }, n), t)
            };
            nG.displayName = "DialogBody";
            var nV = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.hidden,
                    o = nD(e, ["children", "className", "hidden"]),
                    i = P().createElement(nu, n_({
                        className: r
                    }, o), t);
                return n ? P().createElement(nR, null, i) : i
            };
            nV.displayName = "DialogTitle";
            var nK = function(e, t) {
                var r = (0, S.useState)(e),
                    n = r[0],
                    o = r[1];
                return (0, S.useEffect)(function() {
                    var r = setTimeout(function() {
                        o(e)
                    }, t);
                    return function() {
                        clearTimeout(r)
                    }
                }, [e, t]), n
            };

            function nW(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var nz = "__FN_nvfToKPAOuiV__",
                nX = "__FN_END_nvfToKPAOuiV__",
                n$ = new RegExp("".concat(nz, "(\\d+)\\|")),
                nZ = new RegExp("".concat(nX, "(\\d+)\\|")),
                nY = function(e, t, r) {
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
                            i = "".concat(nz).concat(r, "|"),
                            a = "".concat(nX).concat(r, "|");
                        n[e.opening] = i, n[e.closing] = a, o[r] = {
                            start: i,
                            end: a,
                            render: e.render
                        }
                    });
                    var i = function(e) {
                            var t = [],
                                r = n$.exec(e),
                                n = nZ.exec(e);
                            if (n && (!r || n.index < r.index)) return null;
                            if (!r) return [e];
                            r.index > 0 && t.push(e.slice(0, r.index));
                            var a = null == r[1] ? void 0 : o[r[1]];
                            if (null == a) return null;
                            var l = e.indexOf(a.end);
                            if (l < r.index + r[0].length) return null;
                            var c = i(e.slice(r.index + r[0].length, l));
                            if (null == c) return null;
                            t.push(a.render(c));
                            var u = e.slice(l + a.end.length);
                            if (u.length > 0) {
                                var s = i(u);
                                if (null == s) return null;
                                t.push.apply(t, function(e) {
                                    if (Array.isArray(e)) return nW(e)
                                }(s) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(s) || function(e) {
                                    if (e) {
                                        if ("string" == typeof e) return nW(e, void 0);
                                        var t = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nW(e, void 0)
                                    }
                                }(s) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }())
                            }
                            return t
                        },
                        a = i(e(n));
                    return null == a ? null : a.filter(function(e) {
                        return "" !== e
                    }).map(function(e, t) {
                        return (0, w.jsx)(S.Fragment, {
                            children: e
                        }, t)
                    })
                };

            function nq(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nJ(e) {
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

            function nQ(e, t) {
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

            function n0(e, t) {
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
                        if ("string" == typeof e) return nq(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nq(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var n1 = window.Roblox["core-scripts"].environmentUrls,
                n2 = r.n(n1);

            function n3(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function n8() {
                return null != g || (g = "".concat(n2().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), g
            }
            var n5 = function() {};

            function n6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function n4(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var n7 = function(e, t) {
                    return e << 3 | t
                },
                n9 = n7(1, 2),
                oe = n7(2, 2),
                ot = n7(5, 2),
                or = n7(6, 2),
                on = n7(8, 2),
                oo = n7(1, 2),
                oi = n7(2, 1),
                oa = n7(3, 0),
                ol = n7(5, 2);
            n7(1, 2), n7(2, 1), n7(3, 0), n7(4, 2), n7(5, 2), n7(6, 0), n7(8, 2);
            var oc = n7(4, 0),
                ou = n7(6, 2),
                os = n7(7, 2);
            n7(1, 0), n7(2, 2);
            var of = n7(1, 2), op = n7(2, 2), od = n7(1, 2);
            n7(1, 2), n7(2, 2), n7(1, 2);
            var oy = new TextEncoder,
                oh = function() {
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
                                var t = (void 0 === e ? "undefined" : n4(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                                for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                                this.buf.push(Number(t))
                            }
                        }, {
                            key: "writeString",
                            value: function(e) {
                                var t = oy.encode(e);
                                this.writeVarint(t.length);
                                var r = !0,
                                    n = !1,
                                    o = void 0;
                                try {
                                    for (var i, a = t[Symbol.iterator](); !(r = (i = a.next()).done); r = !0) {
                                        var l = i.value;
                                        this.buf.push(l)
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
                        }, {
                            key: "writeBytes",
                            value: function(e) {
                                this.writeVarint(e.length);
                                var t = !0,
                                    r = !1,
                                    n = void 0;
                                try {
                                    for (var o, i = e[Symbol.iterator](); !(t = (o = i.next()).done); t = !0) {
                                        var a = o.value;
                                        this.buf.push(a)
                                    }
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

            function ob(e, t, r) {
                var n = new oh;
                return n.writeVarint(n7(1, 2)), n.writeString(e), n.writeVarint(t), r(n), n.toBytes()
            }

            function om(e) {
                var t = new oh;
                if (t.writeVarint(oo), t.writeString(e.name), t.writeVarint(oi), t.writeDouble(e.value), t.writeVarint(oa), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var r = function(e) {
                        var t = new oh,
                            r = !0,
                            n = !1,
                            o = void 0;
                        try {
                            for (var i, a = Object.entries(e)[Symbol.iterator](); !(r = (i = a.next()).done); r = !0) ! function() {
                                var e, r = (e = i.value, function(e) {
                                        if (Array.isArray(e)) return e
                                    }(e) || function(e) {
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
                                    }(e) || function(e) {
                                        if (e) {
                                            if ("string" == typeof e) return n6(e, 2);
                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return n6(e, 2)
                                        }
                                    }(e) || function() {
                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                    }()),
                                    n = r[0],
                                    o = r[1];
                                if ("string" == typeof o) {
                                    var a = ob(n, n7(2, 2), function(e) {
                                        e.writeString(o)
                                    });
                                    t.writeVarint(ot), t.writeBytes(a)
                                } else if ("boolean" == typeof o) {
                                    var l = ob(n, n7(2, 0), function(e) {
                                        e.writeVarint(+!!o)
                                    });
                                    t.writeVarint(or), t.writeBytes(l)
                                } else if ((void 0 === o ? "undefined" : n4(o)) === "bigint") {
                                    var c = ob(n, n7(2, 0), function(e) {
                                        e.writeVarint(o)
                                    });
                                    t.writeVarint(oe), t.writeBytes(c)
                                } else if ("number" == typeof o)
                                    if (Number.isFinite(o))
                                        if (Number.isInteger(o) && o >= -0x80000000 && o <= 0x7fffffff) {
                                            var u = ob(n, n7(2, 0), function(e) {
                                                e.writeVarint(o)
                                            });
                                            t.writeVarint(n9), t.writeBytes(u)
                                        } else if (Number.isInteger(o)) {
                                    var s = ob(n, n7(2, 0), function(e) {
                                        e.writeVarint(BigInt(o))
                                    });
                                    t.writeVarint(oe), t.writeBytes(s)
                                } else {
                                    var f = ob(n, n7(2, 1), function(e) {
                                        e.writeDouble(o)
                                    });
                                    t.writeVarint(on), t.writeBytes(f)
                                } else {
                                    var p = ob(n, n7(2, 2), function(e) {
                                        e.writeString(String(o))
                                    });
                                    t.writeVarint(ot), t.writeBytes(p)
                                }
                            }()
                        } catch (e) {
                            n = !0, o = e
                        } finally {
                            try {
                                r || null == a.return || a.return()
                            } finally {
                                if (n) throw o
                            }
                        }
                        return t.toBytes()
                    }(e.attributes);
                    t.writeVarint(ol), t.writeBytes(r)
                }
                return t.toBytes()
            }

            function ov(e, t, r) {
                var n = new oh;
                n.writeVarint(oc), n.writeVarint(r);
                var o = !0,
                    i = !1,
                    a = void 0;
                try {
                    for (var l, c = e[Symbol.iterator](); !(o = (l = c.next()).done); o = !0) {
                        var u = l.value;
                        n.writeVarint(ou), n.writeBytes(u)
                    }
                } catch (e) {
                    i = !0, a = e
                } finally {
                    try {
                        o || null == c.return || c.return()
                    } finally {
                        if (i) throw a
                    }
                }
                var s = !0,
                    f = !1,
                    p = void 0;
                try {
                    for (var d, y = t[Symbol.iterator](); !(s = (d = y.next()).done); s = !0) {
                        var h = d.value;
                        n.writeVarint(os), n.writeBytes(h)
                    }
                } catch (e) {
                    f = !0, p = e
                } finally {
                    try {
                        s || null == y.return || y.return()
                    } finally {
                        if (f) throw p
                    }
                }
                return n.toBytes()
            }

            function og(e) {
                var t = new oh;
                t.writeVarint(of), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(op), t.writeBytes(e);
                var r = t.toBytes(),
                    n = new oh;
                return n.writeVarint(od), n.writeBytes(r), n.toBytes()
            }
            var oO = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function ow(e) {
                return oO.test(e)
            }
            var oE = [],
                oj = !1,
                oS = !1;

            function oP(e, t) {
                var r, n, o, i = e.map(function(e) {
                        return {
                            name: e.name,
                            value: e.value,
                            timestampMs: e.timestampMs,
                            attributes: e.attributes
                        }
                    }),
                    a = BigInt(Date.now());
                !0 === t || oS || "u" > typeof document && "hidden" === document.visibilityState ? (r = og(ov(i.map(om), [], a)).buffer, fetch("".concat(n8()).concat("/v1/events/single"), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: r,
                    credentials: "include",
                    keepalive: !0
                }).catch(n5)) : (n = og(ov(i.map(om), [], a)), (o = function() {
                    var e, t, r, o, i, a, l, c, u, s, f, p, d;
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
                            value: c(0)
                        }), l(a, "throw", {
                            value: c(1)
                        }), l(a, "return", {
                            value: c(2)
                        }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), a;

                        function c(l) {
                            return function(c) {
                                var u = [l, c];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                    if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                    switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            o = u;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: u[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, n = u[1], u = [0];
                                            continue;
                                        case 7:
                                            u = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                i.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && i.label < o[1]) {
                                                i.label = o[1], o = u;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(u);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    u = t.call(e, i)
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
                    }(this, function(y) {
                        switch (y.label) {
                            case 0:
                                if ("u" < typeof CompressionStream) return [2, {
                                    body: n.buffer,
                                    compressed: !1
                                }];
                                return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(n).catch(n5), t.close().catch(n5), r = [], [4, (o = e.readable.getReader()).read()];
                            case 1:
                                i = y.sent(), y.label = 2;
                            case 2:
                                if (i.done) return [3, 4];
                                return r.push(i.value), [4, o.read()];
                            case 3:
                                return i = y.sent(), [3, 2];
                            case 4:
                                a = new Uint8Array(r.reduce(function(e, t) {
                                    return e + t.length
                                }, 0)), l = 0, c = !0, u = !1, s = void 0;
                                try {
                                    for (f = r[Symbol.iterator](); !(c = (p = f.next()).done); c = !0) d = p.value, a.set(d, l), l += d.length
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
                                    body: a.buffer,
                                    compressed: !0
                                }]
                        }
                    })
                }, function() {
                    var e = this,
                        t = arguments;
                    return new Promise(function(r, n) {
                        var i = o.apply(e, t);

                        function a(e) {
                            n3(i, r, n, a, l, "next", e)
                        }

                        function l(e) {
                            n3(i, r, n, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                })()).then(function(e) {
                    var t = e.body,
                        r = e.compressed,
                        n = {
                            "Content-Type": "application/x-protobuf"
                        };
                    return r && (n["Content-Encoding"] = "gzip"), fetch("".concat(n8()).concat("/v1/events/single"), {
                        method: "POST",
                        headers: n,
                        body: t,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(n5)
            }

            function ox() {
                var e = !0,
                    t = !1,
                    r = void 0;
                try {
                    for (var n, o = oE[Symbol.iterator](); !(e = (n = o.next()).done); e = !0) {
                        var i = n.value.splice(0);
                        0 !== i.length && oP(i, !0)
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
            var oA = "WwwCommon",
                oT = function(e) {
                    var t = e.publish,
                        r = e.captureException,
                        n = e.featureName;

                    function o(e, t, o) {
                        if (null != o) {
                            var i, a = (null != (i = Error) && "u" > typeof Symbol && i[Symbol.hasInstance] ? !!i[Symbol.hasInstance](o) : o instanceof i) ? o.name || "Error" : "UnknownError",
                                l = n ? "".concat(n, "_").concat(e) : e;
                            return null == r || r(o, {
                                error_counter: l
                            }), nQ(nJ({}, t), {
                                errorType: a
                            })
                        }
                        return t
                    }
                    return {
                        trackCounter: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var o = n0(r, 2);
                            t(o[0], o[1])
                        },
                        trackError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var i = n0(r, 3),
                                a = i[0],
                                l = i[1],
                                c = i[2],
                                u = o(a, nQ(nJ({}, null != l ? l : {}), {
                                    severity: "error"
                                }), c);
                            t(a, u)
                        },
                        trackCriticalError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var i = n0(r, 3),
                                a = i[0],
                                l = i[1],
                                c = i[2],
                                u = o(a, nQ(nJ({}, null != l ? l : {}), {
                                    severity: "critical"
                                }), c);
                            t(a, u)
                        }
                    }
                }({
                    publish: function(e) {
                        var t, r = Math.max(1, 10),
                            n = 250;

                        function o(e, t) {
                            console.error(e, t)
                        }
                        if (!ow(e)) return o('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                                name: e
                            }),
                            function() {};
                        var i = [];
                        return oE.push(i), oj || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                                "hidden" === document.visibilityState && ox()
                            }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                                oS = !0, ox()
                            }), oj = !0),
                            function(a, l, c) {
                                var u = "".concat(e, "_").concat(a);
                                if (! function(e, t) {
                                        if (!ow(e)) return !1;
                                        if (t) {
                                            var r = !0,
                                                n = !1,
                                                o = void 0;
                                            try {
                                                for (var i, a = Object.keys(t)[Symbol.iterator](); !(r = (i = a.next()).done); r = !0) {
                                                    var l = i.value;
                                                    if (!ow(l)) return !1
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
                                        return !0
                                    }(u, l)) return void o("@rbx/web-telemetry: invalid event name or attribute key", {
                                    name: a,
                                    attributes: l
                                });
                                var s = null != c ? c : 1;
                                if (!Number.isFinite(s)) return void o("@rbx/web-telemetry: value must be a finite number", {
                                    name: a,
                                    attributes: l
                                });
                                var f = l && Object.keys(l).length > 0 ? l : void 0;
                                i.push({
                                    name: u,
                                    attributes: f,
                                    value: s,
                                    timestampMs: BigInt(Date.now())
                                }), i.length >= r ? (void 0 !== t && (clearTimeout(t), t = void 0), oP(i.splice(0, r))) : void 0 === t && (t = setTimeout(function() {
                                    for (t = void 0; i.length > 0;) oP(i.splice(0, r))
                                }, n))
                            }
                    }(oA)
                });
            oT.trackCounter;
            var oC = oT.trackError;
            oT.trackCriticalError;
            var oI = function() {
                    if ("u" > typeof document) {
                        var e = document.querySelector('meta[name="page-meta"]');
                        return null == e ? void 0 : e.dataset.internalPageName
                    }
                },
                oN = function(e) {
                    return "string" == typeof e && e.length > 0
                },
                oR = function(e, t, r) {
                    var n;
                    "u" > typeof window && oC(e, {
                        key: r,
                        namespace: t,
                        internalPageName: null != (n = oI()) ? n : "unknown"
                    })
                },
                o_ = function(e) {
                    var t, r, n, o, i, a, l, c, u, s, f, p, d, y = (t = tn(e), r = {
                        "!": e5().messages
                    }, n = t ? "!.".concat(t) : "!", i = (o = e5()).cache, a = o.formats, l = o.formatters, c = o.getMessageFallback, u = o.locale, s = o.onError, f = o.timeZone, p = r["!"], d = "!" === n ? void 0 : n.slice(2), f || e6 || !e4 || (e6 = !0, s(new U(G.ENVIRONMENT_FALLBACK, void 0))), (0, S.useMemo)(function() {
                        var e, t;
                        return t = function(e, t, r) {
                                try {
                                    if (!t) throw Error(void 0);
                                    var n = r ? e2(e, t, r) : t;
                                    if (!n) throw Error(r);
                                    return n
                                } catch (e) {
                                    return new U(G.MISSING_MESSAGE, e.message)
                                }
                            }((e = {
                                cache: i,
                                formatters: l,
                                getMessageFallback: c,
                                messages: p,
                                namespace: d,
                                onError: s,
                                formats: a,
                                locale: u,
                                timeZone: f
                            }).locale, e.messages, e.namespace),
                            function(e) {
                                var t = e.cache,
                                    r = e.formats,
                                    n = e.formatters,
                                    o = e.getMessageFallback,
                                    i = void 0 === o ? e0 : o,
                                    a = e.locale,
                                    l = e.messagesOrError,
                                    c = e.namespace,
                                    u = e.onError,
                                    s = e.timeZone,
                                    f = eY(l, U);

                                function p(e, t, r, n) {
                                    var o = new U(t, r);
                                    return u(o), null != n ? n : i({
                                        error: o,
                                        key: e,
                                        namespace: c
                                    })
                                }

                                function d(e, o, d, y) {
                                    var h, b, m;
                                    if (f) {
                                        if (!y) return u(l), i({
                                            error: l,
                                            key: e,
                                            namespace: c
                                        });
                                        h = y
                                    } else try {
                                        h = e2(a, l, e, c)
                                    } catch (t) {
                                        if (!y) return p(e, G.MISSING_MESSAGE, t.message, y);
                                        h = y
                                    }
                                    try {
                                        var v, g = eQ(c, e);
                                        return eZ(g, h, o ? (v = {}, Object.keys(o).forEach(function(e) {
                                            var t, r = 0,
                                                n = o[e];
                                            t = "function" == typeof n ? function(t) {
                                                var o = n(t);
                                                return (0, S.isValidElement)(o) ? (0, S.cloneElement)(o, {
                                                    key: e + r++
                                                }) : o
                                            } : n, v[e] = t
                                        }), v) : o, {
                                            cache: t,
                                            formatters: n,
                                            globalFormats: r,
                                            formats: d,
                                            locale: a,
                                            timeZone: s
                                        })
                                    } catch (t) {
                                        return eY(t, U) ? (b = t.code, m = t.originalMessage) : (b = G.FORMATTING_ERROR, m = t.message), p(e, b, m, y)
                                    }
                                }

                                function y(e, t, r, n) {
                                    var o = d(e, t, r, n);
                                    return "string" != typeof o ? p(e, G.INVALID_MESSAGE, void 0) : o
                                }
                                return y.rich = d, y.markup = function(e, t, r, n) {
                                    return d(e, t, r, n)
                                }, y.raw = function(e) {
                                    if (f) return u(l), i({
                                        error: l,
                                        key: e,
                                        namespace: c
                                    });
                                    try {
                                        return e2(a, l, e, c)
                                    } catch (t) {
                                        return p(e, G.MISSING_MESSAGE, t.message)
                                    }
                                }, y.has = function(e) {
                                    if (f) return !1;
                                    try {
                                        return e2(a, l, e, c), !0
                                    } catch (e) {
                                        return !1
                                    }
                                }, y
                            }(eJ(eq({}, e), {
                                messagesOrError: t
                            }))
                    }, [i, l, c, p, d, s, a, u, f]));
                    return (0, S.useMemo)(function() {
                        return Object.assign(function(t, r, n) {
                            var o = tn(t);
                            return void 0 === n || y.has(o) ? y(o, r) : (oR("TranslationKeyNotFound", e, o), n)
                        }, {
                            rich: function(e, t) {
                                return y.rich(tn(e), t)
                            },
                            has: function(e) {
                                return oN(e) && y.has(tn(e))
                            },
                            dynamic: function(t, r) {
                                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "";
                                if (!oN(t)) return oR("TranslationKeyNotFound", e, String(t)), n;
                                var o = tn(t),
                                    i = y.has(o);
                                return i || oR("TranslationKeyNotFound", e, o), i ? y(o, r) : n
                            },
                            html: function(t, r, n) {
                                if (!oN(t)) return oR("TranslationKeyNotFound", e, String(t)), null;
                                var o = tn(t);
                                if (!y.has(o)) return oR("TranslationKeyNotFound", e, o), null;
                                var i = nY(function(e) {
                                    return y(o, e)
                                }, r, n);
                                return null == i && oR("TranslationMalformed", e, o), i
                            }
                        })
                    }, [y, e])
                },
                oD = "authFormInteraction",
                ok = "authButtonClick",
                oM = "authMsgShown",
                oB = "authPageload",
                oL = "sendOTP",
                oH = "sendOtp",
                oF = "enterOTP",
                oU = "enterOtp",
                oG = "validateOTP",
                oV = "shown",
                oK = "dismissed",
                oW = "email",
                oz = "code",
                oX = "OTPcode",
                o$ = "errorMessage",
                oZ = "resendErrorMessage",
                oY = "checked",
                oq = "unchecked",
                oJ = "cancel",
                oQ = "sendCode",
                o0 = "resendCode",
                o1 = "login",
                o2 = "signup",
                o3 = "continue",
                o8 = "changeEmail",
                o5 = "pc_checkbox",
                o6 = "enterEmail",
                o4 = "enterCode",
                o7 = "Label.Email",
                o9 = "Label.SixDigitCode",
                ie = "Response.TooManyAttemptsPleaseWait",
                it = "email";

            function ir(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var io = ((d = {})[d.SET_ENTER_EMAIL_PAGE = 0] = "SET_ENTER_EMAIL_PAGE", d[d.SET_ENTER_CODE_PAGE = 1] = "SET_ENTER_CODE_PAGE", d[d.SET_EMAIL = 2] = "SET_EMAIL", d[d.SET_SESSION_TOKEN = 3] = "SET_SESSION_TOKEN", d[d.SET_OTP_CODE = 4] = "SET_OTP_CODE", d[d.SET_LEGAL_CHECK = 5] = "SET_LEGAL_CHECK", d[d.SET_CODE_VALID = 6] = "SET_CODE_VALID", d[d.SET_LOADING = 7] = "SET_LOADING", d[d.SET_CHECKBOX_AND_CONTINUE_BUTTON_STATE = 8] = "SET_CHECKBOX_AND_CONTINUE_BUTTON_STATE", d[d.SET_ERROR = 9] = "SET_ERROR", d[d.CLOSE_MODAL = 10] = "CLOSE_MODAL", d),
                ii = {
                    emailVerifyCodeModalPage: o6,
                    email: "",
                    sessionToken: "",
                    code: "",
                    isChecked: !1,
                    isCheckboxEnabled: !1,
                    isLoading: !1,
                    isCodeValid: !1,
                    isContinueButtonEnabled: !1,
                    errorMessage: "",
                    isModalOpen: !0
                },
                ia = (0, S.createContext)(null),
                il = function(e, t) {
                    var r = function(e) {
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
                    }({}, e);
                    switch (t.type) {
                        case 0:
                            return r.emailVerifyCodeModalPage = o6, r;
                        case 1:
                            return r.emailVerifyCodeModalPage = o4, r;
                        case 2:
                            return r.email = t.email, r;
                        case 3:
                            return r.sessionToken = t.sessionToken, r;
                        case 4:
                            return r.code = t.code, r;
                        case 5:
                            return r.isChecked = t.isChecked, r;
                        case 6:
                            return r.isCodeValid = t.isCodeValid, r;
                        case 7:
                            return r.isLoading = t.isLoading, r;
                        case 8:
                            return r.isContinueButtonEnabled = t.isContinueButtonEnabled, r.isCheckboxEnabled = t.isCheckboxEnabled, r;
                        case 9:
                            return r.errorMessage = t.errorMessage, r;
                        case 10:
                            return r.isModalOpen = !1, r;
                        default:
                            return e
                    }
                },
                ic = function(e) {
                    var t, r = e.children,
                        n = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, S.useReducer)(il, ii)) || function(e) {
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
                                if ("string" == typeof e) return ir(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ir(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        o = n[0],
                        i = n[1];
                    return (0, w.jsx)(ia.Provider, {
                        value: {
                            state: o,
                            dispatch: i
                        },
                        children: r
                    })
                },
                iu = function() {
                    var e = (0, S.useContext)(ia);
                    if (null === e) throw Error("EmailVerifyCodeModalContext was not provided in the current scope");
                    return e
                },
                is = "opacity-[0.5]",
                ip = 0,
                id = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        t = (0, S.useRef)();
                    return t.current || (ip += 1, t.current = "".concat(e).concat(ip)), t.current
                };

            function iy(e) {
                var t = e.className;
                return P().createElement("svg", {
                    xmlns: "http://www.w3.org/2000/svg",
                    width: "13",
                    height: "6",
                    viewBox: "0 0 13 6",
                    fill: "none",
                    className: tu("block", t),
                    style: {
                        marginTop: -1
                    }
                }, P().createElement("path", {
                    d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
                    fill: "currentColor"
                }))
            }

            function ih(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function ib(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function im(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function iv() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = im(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : im(t[e], null)
                        }
                    }
                }
            }

            function ig() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return S.useCallback(iv.apply(void 0, function(e) {
                    if (Array.isArray(e)) return ib(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return ib(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ib(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function iO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iw(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function iE(e) {
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

            function ij(e) {
                return function(e) {
                    if (Array.isArray(e)) return iO(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return iO(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iO(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function iS(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    n = function() {
                        var t = r.map(function(e) {
                            return S.createContext(e)
                        });
                        return function(r) {
                            var n = (null == r ? void 0 : r[e]) || t;
                            return S.useMemo(function() {
                                var t, o;
                                return iw({}, "__scope".concat(e), (t = iE({}, r), o = null != (o = iw({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
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
                    var o = S.createContext(n),
                        i = r.length;
                    r = ij(r).concat([n]);
                    var a = function(t) {
                        var r, n = t.scope,
                            a = t.children,
                            l = function(e, t) {
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
                            }(t, ["scope", "children"]),
                            c = (null == n || null == (r = n[e]) ? void 0 : r[i]) || o,
                            u = S.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, w.jsx)(c.Provider, {
                            value: u,
                            children: a
                        })
                    };
                    return a.displayName = t + "Provider", [a, function(r, a) {
                        var l, c = (null == a || null == (l = a[e]) ? void 0 : l[i]) || o,
                            u = S.useContext(c);
                        if (u) return u;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, iP.apply(void 0, [n].concat(ij(t)))]
            }

            function iP() {
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
                            return iE({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return S.useMemo(function() {
                            return iw({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }
            var ix = (null == (O = globalThis) ? void 0 : O.document) ? S.useLayoutEffect : function() {};

            function iA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var iT = S["useId".toString()] || function() {},
                iC = 0,
                iI = ["top", "right", "bottom", "left"],
                iN = Math.min,
                iR = Math.max,
                i_ = Math.round,
                iD = Math.floor,
                ik = function(e) {
                    return {
                        x: e,
                        y: e
                    }
                },
                iM = {
                    left: "right",
                    right: "left",
                    bottom: "top",
                    top: "bottom"
                },
                iB = {
                    start: "end",
                    end: "start"
                };

            function iL(e, t) {
                return "function" == typeof e ? e(t) : e
            }

            function iH(e) {
                return e.split("-")[0]
            }

            function iF(e) {
                return e.split("-")[1]
            }

            function iU(e) {
                return "x" === e ? "y" : "x"
            }

            function iG(e) {
                return "y" === e ? "height" : "width"
            }
            var iV = new Set(["top", "bottom"]);

            function iK(e) {
                return iV.has(iH(e)) ? "y" : "x"
            }

            function iW(e) {
                return e.replace(/start|end/g, function(e) {
                    return iB[e]
                })
            }
            var iz = ["left", "right"],
                iX = ["right", "left"],
                i$ = ["top", "bottom"],
                iZ = ["bottom", "top"];

            function iY(e) {
                return e.replace(/left|right|bottom|top/g, function(e) {
                    return iM[e]
                })
            }

            function iq(e) {
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

            function iJ(e) {
                var t = e.x,
                    r = e.y,
                    n = e.width,
                    o = e.height;
                return {
                    width: n,
                    height: o,
                    top: r,
                    left: t,
                    right: t + n,
                    bottom: r + o,
                    x: t,
                    y: r
                }
            }

            function iQ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function i0(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function i1(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            i0(i, n, o, a, l, "next", e)
                        }

                        function l(e) {
                            i0(i, n, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function i2(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function i3(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        i2(e, t, r[t])
                    })
                }
                return e
            }

            function i8(e, t) {
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

            function i5(e, t) {
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

            function i6(e) {
                return function(e) {
                    if (Array.isArray(e)) return iQ(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return iQ(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iQ(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function i4(e, t) {
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
                    value: c(0)
                }), l(a, "throw", {
                    value: c(1)
                }), l(a, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function c(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < o[1]) {
                                        i.label = o[1], o = u;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(u);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = t.call(e, i)
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

            function i7(e, t, r) {
                var n, o = e.reference,
                    i = e.floating,
                    a = iK(t),
                    l = iU(iK(t)),
                    c = iG(l),
                    u = iH(t),
                    s = "y" === a,
                    f = o.x + o.width / 2 - i.width / 2,
                    p = o.y + o.height / 2 - i.height / 2,
                    d = o[c] / 2 - i[c] / 2;
                switch (u) {
                    case "top":
                        n = {
                            x: f,
                            y: o.y - i.height
                        };
                        break;
                    case "bottom":
                        n = {
                            x: f,
                            y: o.y + o.height
                        };
                        break;
                    case "right":
                        n = {
                            x: o.x + o.width,
                            y: p
                        };
                        break;
                    case "left":
                        n = {
                            x: o.x - i.width,
                            y: p
                        };
                        break;
                    default:
                        n = {
                            x: o.x,
                            y: o.y
                        }
                }
                switch (iF(t)) {
                    case "start":
                        n[l] -= d * (r && s ? -1 : 1);
                        break;
                    case "end":
                        n[l] += d * (r && s ? -1 : 1)
                }
                return n
            }

            function i9(e, t) {
                return i1(function() {
                    var r, n, o, i, a, l, c, u, s, f, p, d, y, h, b, m, v, g, O, w, E, j, S, P, x, A, T, C, I, N, R;
                    return i4(this, function(_) {
                        switch (_.label) {
                            case 0:
                                return void 0 === t && (t = {}), n = e.x, o = e.y, i = e.platform, a = e.rects, l = e.elements, c = e.strategy, f = void 0 === (s = (u = iL(t, e)).boundary) ? "clippingAncestors" : s, d = void 0 === (p = u.rootBoundary) ? "viewport" : p, h = void 0 === (y = u.elementContext) ? "floating" : y, m = void 0 !== (b = u.altBoundary) && b, g = iq(void 0 === (v = u.padding) ? 0 : v), O = "floating" === h ? "reference" : "floating", w = l[m ? O : h], j = i.getClippingRect, S = {}, [4, null == i.isElement ? void 0 : i.isElement(w)];
                            case 1:
                                if (!(null == (r = _.sent()) || r)) return [3, 2];
                                return P = w, [3, 5];
                            case 2:
                                if (x = w.contextElement) return [3, 4];
                                return [4, null == i.getDocumentElement ? void 0 : i.getDocumentElement(l.floating)];
                            case 3:
                                x = _.sent(), _.label = 4;
                            case 4:
                                P = x, _.label = 5;
                            case 5:
                                return [4, j.apply(i, [(S.element = P, S.boundary = f, S.rootBoundary = d, S.strategy = c, S)])];
                            case 6:
                                return E = iJ.apply(void 0, [_.sent()]), A = "floating" === h ? {
                                    x: n,
                                    y: o,
                                    width: a.floating.width,
                                    height: a.floating.height
                                } : a.reference, [4, null == i.getOffsetParent ? void 0 : i.getOffsetParent(l.floating)];
                            case 7:
                                return T = _.sent(), [4, null == i.isElement ? void 0 : i.isElement(T)];
                            case 8:
                                if (!_.sent()) return [3, 10];
                                return [4, null == i.getScale ? void 0 : i.getScale(T)];
                            case 9:
                                return I = _.sent() || {
                                    x: 1,
                                    y: 1
                                }, [3, 11];
                            case 10:
                                I = {
                                    x: 1,
                                    y: 1
                                }, _.label = 11;
                            case 11:
                                if (C = I, !i.convertOffsetParentRelativeRectToViewportRelativeRect) return [3, 13];
                                return [4, i.convertOffsetParentRelativeRectToViewportRelativeRect({
                                    elements: l,
                                    rect: A,
                                    offsetParent: T,
                                    strategy: c
                                })];
                            case 12:
                                return R = _.sent(), [3, 14];
                            case 13:
                                R = A, _.label = 14;
                            case 14:
                                return N = iJ.apply(void 0, [R]), [2, {
                                    top: (E.top - N.top + g.top) / C.y,
                                    bottom: (N.bottom - E.bottom + g.bottom) / C.y,
                                    left: (E.left - N.left + g.left) / C.x,
                                    right: (N.right - E.right + g.right) / C.x
                                }]
                        }
                    })
                })()
            }

            function ae(e, t) {
                return {
                    top: e.top - t.height,
                    right: e.right - t.width,
                    bottom: e.bottom - t.height,
                    left: e.left - t.width
                }
            }

            function at(e) {
                return iI.some(function(t) {
                    return e[t] >= 0
                })
            }
            var ar = new Set(["left", "top"]);

            function an(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function ao() {
                return "u" > typeof window
            }

            function ai(e) {
                return ac(e) ? (e.nodeName || "").toLowerCase() : "#document"
            }

            function aa(e) {
                var t;
                return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
            }

            function al(e) {
                var t;
                return null == (t = (ac(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
            }

            function ac(e) {
                return !!ao() && (an(e, Node) || an(e, aa(e).Node))
            }

            function au(e) {
                return !!ao() && (an(e, Element) || an(e, aa(e).Element))
            }

            function as(e) {
                return !!ao() && (an(e, HTMLElement) || an(e, aa(e).HTMLElement))
            }

            function af(e) {
                return !(!ao() || "u" < typeof ShadowRoot) && (an(e, ShadowRoot) || an(e, aa(e).ShadowRoot))
            }
            var ap = new Set(["inline", "contents"]);

            function ad(e) {
                var t = aS(e),
                    r = t.overflow,
                    n = t.overflowX,
                    o = t.overflowY,
                    i = t.display;
                return /auto|scroll|overlay|hidden|clip/.test(r + o + n) && !ap.has(i)
            }
            var ay = new Set(["table", "td", "th"]),
                ah = [":popover-open", ":modal"];

            function ab(e) {
                return ah.some(function(t) {
                    try {
                        return e.matches(t)
                    } catch (e) {
                        return !1
                    }
                })
            }
            var am = ["transform", "translate", "scale", "rotate", "perspective"],
                av = ["transform", "translate", "scale", "rotate", "perspective", "filter"],
                ag = ["paint", "layout", "strict", "content"];

            function aO(e) {
                var t = aw(),
                    r = au(e) ? aS(e) : e;
                return am.some(function(e) {
                    return !!r[e] && "none" !== r[e]
                }) || !!r.containerType && "normal" !== r.containerType || !t && !!r.backdropFilter && "none" !== r.backdropFilter || !t && !!r.filter && "none" !== r.filter || av.some(function(e) {
                    return (r.willChange || "").includes(e)
                }) || ag.some(function(e) {
                    return (r.contain || "").includes(e)
                })
            }

            function aw() {
                return !("u" < typeof CSS) && !!CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")
            }
            var aE = new Set(["html", "body", "#document"]);

            function aj(e) {
                return aE.has(ai(e))
            }

            function aS(e) {
                return aa(e).getComputedStyle(e)
            }

            function aP(e) {
                return au(e) ? {
                    scrollLeft: e.scrollLeft,
                    scrollTop: e.scrollTop
                } : {
                    scrollLeft: e.scrollX,
                    scrollTop: e.scrollY
                }
            }

            function ax(e) {
                if ("html" === ai(e)) return e;
                var t = e.assignedSlot || e.parentNode || af(e) && e.host || al(e);
                return af(t) ? t.host : t
            }

            function aA(e, t, r) {
                void 0 === t && (t = []), void 0 === r && (r = !0);
                var n, o = function e(t) {
                        var r = ax(t);
                        return aj(r) ? t.ownerDocument ? t.ownerDocument.body : t.body : as(r) && ad(r) ? r : e(r)
                    }(e),
                    i = o === (null == (n = e.ownerDocument) ? void 0 : n.body),
                    a = aa(o);
                if (i) {
                    var l = aT(a);
                    return t.concat(a, a.visualViewport || [], ad(o) ? o : [], l && r ? aA(l) : [])
                }
                return t.concat(o, aA(o, [], r))
            }

            function aT(e) {
                return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
            }

            function aC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aI(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function aN(e) {
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

            function aR(e, t) {
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

            function a_(e) {
                return function(e) {
                    if (Array.isArray(e)) return aC(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || aD(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function aD(e, t) {
                if (e) {
                    if ("string" == typeof e) return aC(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aC(e, t)
                }
            }

            function ak(e) {
                var t = aS(e),
                    r = parseFloat(t.width) || 0,
                    n = parseFloat(t.height) || 0,
                    o = as(e),
                    i = o ? e.offsetWidth : r,
                    a = o ? e.offsetHeight : n,
                    l = i_(r) !== i || i_(n) !== a;
                return l && (r = i, n = a), {
                    width: r,
                    height: n,
                    $: l
                }
            }

            function aM(e) {
                return au(e) ? e : e.contextElement
            }

            function aB(e) {
                var t = aM(e);
                if (!as(t)) return ik(1);
                var r = t.getBoundingClientRect(),
                    n = ak(t),
                    o = n.width,
                    i = n.height,
                    a = n.$,
                    l = (a ? i_(r.width) : r.width) / o,
                    c = (a ? i_(r.height) : r.height) / i;
                return l && Number.isFinite(l) || (l = 1), c && Number.isFinite(c) || (c = 1), {
                    x: l,
                    y: c
                }
            }
            var aL = ik(0);

            function aH(e) {
                var t = aa(e);
                return aw() && t.visualViewport ? {
                    x: t.visualViewport.offsetLeft,
                    y: t.visualViewport.offsetTop
                } : aL
            }

            function aF(e, t, r, n) {
                void 0 === t && (t = !1), void 0 === r && (r = !1);
                var o, i = e.getBoundingClientRect(),
                    a = aM(e),
                    l = ik(1);
                t && (n ? au(n) && (l = aB(n)) : l = aB(e));
                var c = (void 0 === (o = r) && (o = !1), n && (!o || n === aa(a)) && o) ? aH(a) : ik(0),
                    u = (i.left + c.x) / l.x,
                    s = (i.top + c.y) / l.y,
                    f = i.width / l.x,
                    p = i.height / l.y;
                if (a)
                    for (var d = aa(a), y = n && au(n) ? aa(n) : n, h = d, b = aT(h); b && n && y !== h;) {
                        var m = aB(b),
                            v = b.getBoundingClientRect(),
                            g = aS(b),
                            O = v.left + (b.clientLeft + parseFloat(g.paddingLeft)) * m.x,
                            w = v.top + (b.clientTop + parseFloat(g.paddingTop)) * m.y;
                        u *= m.x, s *= m.y, f *= m.x, p *= m.y, u += O, s += w, b = aT(h = aa(b))
                    }
                return iJ({
                    width: f,
                    height: p,
                    x: u,
                    y: s
                })
            }

            function aU(e, t) {
                var r = aP(e).scrollLeft;
                return t ? t.left + r : aF(al(e)).left + r
            }

            function aG(e, t) {
                var r = e.getBoundingClientRect();
                return {
                    x: r.left + t.scrollLeft - aU(e, r),
                    y: r.top + t.scrollTop
                }
            }
            var aV = new Set(["absolute", "fixed"]);

            function aK(e, t, r) {
                if ("viewport" === t) n = function(e, t) {
                    var r = aa(e),
                        n = al(e),
                        o = r.visualViewport,
                        i = n.clientWidth,
                        a = n.clientHeight,
                        l = 0,
                        c = 0;
                    if (o) {
                        i = o.width, a = o.height;
                        var u = aw();
                        (!u || u && "fixed" === t) && (l = o.offsetLeft, c = o.offsetTop)
                    }
                    var s = aU(n);
                    if (s <= 0) {
                        var f = n.ownerDocument,
                            p = f.body,
                            d = getComputedStyle(p),
                            y = "CSS1Compat" === f.compatMode && parseFloat(d.marginLeft) + parseFloat(d.marginRight) || 0,
                            h = Math.abs(n.clientWidth - p.clientWidth - y);
                        h <= 25 && (i -= h)
                    } else s <= 25 && (i += s);
                    return {
                        width: i,
                        height: a,
                        x: l,
                        y: c
                    }
                }(e, r);
                else if ("document" === t) o = al(e), i = al(o), a = aP(o), l = o.ownerDocument.body, c = iR(i.scrollWidth, i.clientWidth, l.scrollWidth, l.clientWidth), u = iR(i.scrollHeight, i.clientHeight, l.scrollHeight, l.clientHeight), s = -a.scrollLeft + aU(o), f = -a.scrollTop, "rtl" === aS(l).direction && (s += iR(i.clientWidth, l.clientWidth) - c), n = {
                    width: c,
                    height: u,
                    x: s,
                    y: f
                };
                else if (au(t)) d = (p = aF(t, !0, "fixed" === r)).top + t.clientTop, y = p.left + t.clientLeft, h = as(t) ? aB(t) : ik(1), n = {
                    width: t.clientWidth * h.x,
                    height: t.clientHeight * h.y,
                    x: y * h.x,
                    y: d * h.y
                };
                else {
                    var n, o, i, a, l, c, u, s, f, p, d, y, h, b = aH(e);
                    n = {
                        x: t.x - b.x,
                        y: t.y - b.y,
                        width: t.width,
                        height: t.height
                    }
                }
                return iJ(n)
            }

            function aW(e, t, r) {
                var n = as(t),
                    o = al(t),
                    i = "fixed" === r,
                    a = aF(e, !0, i, t),
                    l = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    c = ik(0);
                if (n || !n && !i)
                    if (("body" !== ai(t) || ad(o)) && (l = aP(t)), n) {
                        var u = aF(t, !0, i, t);
                        c.x = u.x + t.clientLeft, c.y = u.y + t.clientTop
                    } else o && (c.x = aU(o));
                i && !n && o && (c.x = aU(o));
                var s = !o || n || i ? ik(0) : aG(o, l);
                return {
                    x: a.left + l.scrollLeft - c.x - s.x,
                    y: a.top + l.scrollTop - c.y - s.y,
                    width: a.width,
                    height: a.height
                }
            }

            function az(e) {
                return "static" === aS(e).position
            }

            function aX(e, t) {
                if (!as(e) || "fixed" === aS(e).position) return null;
                if (t) return t(e);
                var r = e.offsetParent;
                return al(e) === r && (r = r.ownerDocument.body), r
            }

            function a$(e, t) {
                var r, n = aa(e);
                if (ab(e)) return n;
                if (!as(e)) {
                    for (var o = ax(e); o && !aj(o);) {
                        if (au(o) && !az(o)) return o;
                        o = ax(o)
                    }
                    return n
                }
                for (var i = aX(e, t); i && (r = i, ay.has(ai(r))) && az(i);) i = aX(i, t);
                return i && aj(i) && az(i) && !aO(i) ? n : i || function(e) {
                    for (var t = ax(e); as(t) && !aj(t);) {
                        if (aO(t)) return t;
                        if (ab(t)) break;
                        t = ax(t)
                    }
                    return null
                }(e) || n
            }
            var aZ = {
                convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
                    var t = e.elements,
                        r = e.rect,
                        n = e.offsetParent,
                        o = "fixed" === e.strategy,
                        i = al(n),
                        a = !!t && ab(t.floating);
                    if (n === i || a && o) return r;
                    var l = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        c = ik(1),
                        u = ik(0),
                        s = as(n);
                    if ((s || !s && !o) && (("body" !== ai(n) || ad(i)) && (l = aP(n)), as(n))) {
                        var f = aF(n);
                        c = aB(n), u.x = f.x + n.clientLeft, u.y = f.y + n.clientTop
                    }
                    var p = !i || s || o ? ik(0) : aG(i, l);
                    return {
                        width: r.width * c.x,
                        height: r.height * c.y,
                        x: r.x * c.x - l.scrollLeft * c.x + u.x + p.x,
                        y: r.y * c.y - l.scrollTop * c.y + u.y + p.y
                    }
                },
                getDocumentElement: al,
                getClippingRect: function(e) {
                    var t = e.element,
                        r = e.boundary,
                        n = e.rootBoundary,
                        o = e.strategy,
                        i = a_("clippingAncestors" === r ? ab(t) ? [] : function(e, t) {
                            var r = t.get(e);
                            if (r) return r;
                            for (var n = aA(e, [], !1).filter(function(e) {
                                    return au(e) && "body" !== ai(e)
                                }), o = null, i = "fixed" === aS(e).position, a = i ? ax(e) : e; au(a) && !aj(a);) {
                                var l = aS(a),
                                    c = aO(a);
                                c || "fixed" !== l.position || (o = null), (i ? !c && !o : !c && "static" === l.position && !!o && aV.has(o.position) || ad(a) && !c && function e(t, r) {
                                    var n = ax(t);
                                    return !(n === r || !au(n) || aj(n)) && ("fixed" === aS(n).position || e(n, r))
                                }(e, a)) ? n = n.filter(function(e) {
                                    return e !== a
                                }) : o = l, a = ax(a)
                            }
                            return t.set(e, n), n
                        }(t, this._c) : [].concat(r)).concat([n]),
                        a = i[0],
                        l = i.reduce(function(e, r) {
                            var n = aK(t, r, o);
                            return e.top = iR(n.top, e.top), e.right = iN(n.right, e.right), e.bottom = iN(n.bottom, e.bottom), e.left = iR(n.left, e.left), e
                        }, aK(t, a, o));
                    return {
                        width: l.right - l.left,
                        height: l.bottom - l.top,
                        x: l.left,
                        y: l.top
                    }
                },
                getOffsetParent: a$,
                getElementRects: function(e) {
                    var t;
                    return (t = function() {
                        var t, r, n, o;
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
                                value: c(0)
                            }), l(a, "throw", {
                                value: c(1)
                            }), l(a, "return", {
                                value: c(2)
                            }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), a;

                            function c(l) {
                                return function(c) {
                                    var u = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, n = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    i.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && i.label < o[1]) {
                                                    i.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(u);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, i)
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
                        }(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    return t = this.getOffsetParent || a$, [4, (0, this.getDimensions)(e.floating)];
                                case 1:
                                    return r = i.sent(), n = {}, o = [e.reference], [4, t(e.floating)];
                                case 2:
                                    return [2, (n.reference = aW.apply(void 0, o.concat([i.sent(), e.strategy])), n.floating = {
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
                        return new Promise(function(n, o) {
                            var i = t.apply(e, r);

                            function a(e) {
                                aI(i, n, o, a, l, "next", e)
                            }

                            function l(e) {
                                aI(i, n, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    }).call(this)
                },
                getClientRects: function(e) {
                    return Array.from(e.getClientRects())
                },
                getDimensions: function(e) {
                    var t = ak(e);
                    return {
                        width: t.width,
                        height: t.height
                    }
                },
                getScale: aB,
                isElement: au,
                isRTL: function(e) {
                    return "rtl" === aS(e).direction
                }
            };

            function aY(e, t) {
                return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
            }

            function aq(e, t, r, n) {
                void 0 === n && (n = {});
                var o, i = n.ancestorScroll,
                    a = void 0 === i || i,
                    l = n.ancestorResize,
                    c = void 0 === l || l,
                    u = n.elementResize,
                    s = void 0 === u ? "function" == typeof ResizeObserver : u,
                    f = n.layoutShift,
                    p = void 0 === f ? "function" == typeof IntersectionObserver : f,
                    d = n.animationFrame,
                    y = void 0 !== d && d,
                    h = aM(e),
                    b = a || c ? a_(h ? aA(h) : []).concat(a_(aA(t))) : [];
                b.forEach(function(e) {
                    a && e.addEventListener("scroll", r, {
                        passive: !0
                    }), c && e.addEventListener("resize", r)
                });
                var m = h && p ? function(e, t) {
                        var r, n = null,
                            o = al(e);

                        function i() {
                            var e;
                            clearTimeout(r), null == (e = n) || e.disconnect(), n = null
                        }
                        return ! function a(l, c) {
                            void 0 === l && (l = !1), void 0 === c && (c = 1), i();
                            var u = e.getBoundingClientRect(),
                                s = u.left,
                                f = u.top,
                                p = u.width,
                                d = u.height;
                            if (l || t(), p && d) {
                                var y = {
                                        rootMargin: -iD(f) + "px " + -iD(o.clientWidth - (s + p)) + "px " + -iD(o.clientHeight - (f + d)) + "px " + -iD(s) + "px",
                                        threshold: iR(0, iN(1, c)) || 1
                                    },
                                    h = !0;
                                try {
                                    n = new IntersectionObserver(b, aR(aN({}, y), {
                                        root: o.ownerDocument
                                    }))
                                } catch (e) {
                                    n = new IntersectionObserver(b, y)
                                }
                                n.observe(e)
                            }

                            function b(t) {
                                var n = t[0].intersectionRatio;
                                if (n !== c) {
                                    if (!h) return a();
                                    n ? a(!1, n) : r = setTimeout(function() {
                                        a(!1, 1e-7)
                                    }, 1e3)
                                }
                                1 !== n || aY(u, e.getBoundingClientRect()) || a(), h = !1
                            }
                        }(!0), i
                    }(h, r) : null,
                    v = -1,
                    g = null;
                s && (g = new ResizeObserver(function(e) {
                    var n = (function(e) {
                        if (Array.isArray(e)) return e
                    }(e) || function(e) {
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
                    }(e) || aD(e, 1) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())[0];
                    n && n.target === h && g && (g.unobserve(t), cancelAnimationFrame(v), v = requestAnimationFrame(function() {
                        var e;
                        null == (e = g) || e.observe(t)
                    })), r()
                }), h && !y && g.observe(h), g.observe(t));
                var O = y ? aF(e) : null;
                return y && function t() {
                        var n = aF(e);
                        O && !aY(O, n) && r(), O = n, o = requestAnimationFrame(t)
                    }(), r(),
                    function() {
                        var e;
                        b.forEach(function(e) {
                            a && e.removeEventListener("scroll", r), c && e.removeEventListener("resize", r)
                        }), null == m || m(), null == (e = g) || e.disconnect(), g = null, y && cancelAnimationFrame(o)
                    }
            }
            var aJ = function(e) {
                    return {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            return i1(function() {
                                var r, n, o, i, a, l, c, u, s, f, p, d, y, h, b, m, v, g, O, w, E, j, S, P, x, A, T, C, I, N, R, _, D, k, M, B, L;
                                return i4(this, function(H) {
                                    switch (H.label) {
                                        case 0:
                                            if (r = t.x, n = t.y, o = t.placement, i = t.rects, a = t.platform, l = t.elements, c = t.middlewareData, s = (u = iL(e, t) || {}).element, p = void 0 === (f = u.padding) ? 0 : f, null == s) return [2, {}];
                                            return d = iq(p), y = {
                                                x: r,
                                                y: n
                                            }, b = iG(h = iU(iK(o))), [4, a.getDimensions(s)];
                                        case 1:
                                            return m = H.sent(), g = (v = "y" === h) ? "top" : "left", O = v ? "bottom" : "right", w = v ? "clientHeight" : "clientWidth", E = i.reference[b] + i.reference[h] - y[h] - i.floating[b], j = y[h] - i.reference[h], [4, null == a.getOffsetParent ? void 0 : a.getOffsetParent(s)];
                                        case 2:
                                            if (x = !(P = (S = H.sent()) ? S[w] : 0)) return [3, 4];
                                            return [4, null == a.isElement ? void 0 : a.isElement(S)];
                                        case 3:
                                            x = !H.sent(), H.label = 4;
                                        case 4:
                                            return x && (P = l.floating[w] || i.floating[b]), A = E / 2 - j / 2, T = P / 2 - m[b] / 2 - 1, C = iN(d[g], T), I = iN(d[O], T), N = C, R = P - m[b] - I, D = iR(N, iN(_ = P / 2 - m[b] / 2 + A, R)), M = (k = !c.arrow && null != iF(o) && _ !== D && i.reference[b] / 2 - (_ < N ? C : I) - m[b] / 2 < 0) ? _ < N ? _ - N : _ - R : 0, [2, (i2(L = {}, h, y[h] + M), i2(L, "data", i3((i2(B = {}, h, D), i2(B, "centerOffset", _ - D - M), B), k && {
                                                alignmentOffset: M
                                            })), i2(L, "reset", k), L)]
                                    }
                                })
                            })()
                        }
                    }
                },
                aQ = function(e, t, r) {
                    var n, o = new Map,
                        i = aN({
                            platform: aZ
                        }, r),
                        a = aR(aN({}, i.platform), {
                            _c: o
                        });
                    return n = aR(aN({}, i), {
                        platform: a
                    }), i1(function() {
                        var r, o, i, a, l, c, u, s, f, p, d, y, h, b, m, v, g, O, w, E, j, S, P, x, A, T;
                        return i4(this, function(C) {
                            switch (C.label) {
                                case 0:
                                    return o = void 0 === (r = n.placement) ? "bottom" : r, a = void 0 === (i = n.strategy) ? "absolute" : i, c = void 0 === (l = n.middleware) ? [] : l, u = n.platform, s = c.filter(Boolean), [4, null == u.isRTL ? void 0 : u.isRTL(t)];
                                case 1:
                                    return f = C.sent(), [4, u.getElementRects({
                                        reference: e,
                                        floating: t,
                                        strategy: a
                                    })];
                                case 2:
                                    y = (d = i7(p = C.sent(), o, f)).x, h = d.y, b = o, m = {}, v = 0, g = 0, C.label = 3;
                                case 3:
                                    if (!(g < s.length)) return [3, 11];
                                    return w = (O = s[g]).name, [4, (0, O.fn)({
                                        x: y,
                                        y: h,
                                        initialPlacement: o,
                                        placement: b,
                                        strategy: a,
                                        middlewareData: m,
                                        rects: p,
                                        platform: u,
                                        elements: {
                                            reference: e,
                                            floating: t
                                        }
                                    })];
                                case 4:
                                    var I;
                                    if (j = (E = C.sent()).x, S = E.y, P = E.data, x = E.reset, y = null != j ? j : y, h = null != S ? S : h, m = i8(i3({}, m), i2({}, w, i3({}, m[w], P))), !(x && v <= 50)) return [3, 10];
                                    if (v++, (void 0 === x ? "undefined" : (I = x) && "u" > typeof Symbol && I.constructor === Symbol ? "symbol" : typeof I) != "object") return [3, 9];
                                    if (x.placement && (b = x.placement), !x.rects) return [3, 8];
                                    if (!0 !== x.rects) return [3, 6];
                                    return [4, u.getElementRects({
                                        reference: e,
                                        floating: t,
                                        strategy: a
                                    })];
                                case 5:
                                    return A = C.sent(), [3, 7];
                                case 6:
                                    A = x.rects, C.label = 7;
                                case 7:
                                    p = A, C.label = 8;
                                case 8:
                                    y = (T = i7(p, b, f)).x, h = T.y, C.label = 9;
                                case 9:
                                    g = -1, C.label = 10;
                                case 10:
                                    return g++, [3, 3];
                                case 11:
                                    return [2, {
                                        x: y,
                                        y: h,
                                        placement: b,
                                        strategy: a,
                                        middlewareData: m
                                    }]
                            }
                        })
                    })()
                };

            function a0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function a1(e) {
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

            function a2(e, t) {
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

            function a3(e, t) {
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
                        if ("string" == typeof e) return a0(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return a0(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function a8(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var a5 = "u" > typeof document ? S.useLayoutEffect : function() {};

            function a6(e, t) {
                if (e === t) return !0;
                if ((void 0 === e ? "undefined" : a8(e)) !== (void 0 === t ? "undefined" : a8(t))) return !1;
                if ("function" == typeof e && e.toString() === t.toString()) return !0;
                if (e && t && (void 0 === e ? "undefined" : a8(e)) === "object") {
                    if (Array.isArray(e)) {
                        if ((r = e.length) !== t.length) return !1;
                        for (n = r; 0 != n--;)
                            if (!a6(e[n], t[n])) return !1;
                        return !0
                    }
                    if ((r = (o = Object.keys(e)).length) !== Object.keys(t).length) return !1;
                    for (n = r; 0 != n--;)
                        if (!({}).hasOwnProperty.call(t, o[n])) return !1;
                    for (n = r; 0 != n--;) {
                        var r, n, o, i = o[n];
                        if (("_owner" !== i || !e.$$typeof) && !a6(e[i], t[i])) return !1
                    }
                    return !0
                }
                return e != e && t != t
            }

            function a4(e) {
                return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
            }

            function a7(e, t) {
                var r = a4(e);
                return Math.round(t * r) / r
            }

            function a9(e) {
                var t = S.useRef(e);
                return a5(function() {
                    t.current = e
                }), t
            }
            var le = function(e, t) {
                    var r;
                    return a2(a1({}, (void 0 === (r = e) && (r = 0), {
                        name: "offset",
                        options: r,
                        fn: function(e) {
                            return i1(function() {
                                var t, n, o, i, a, l, c;
                                return i4(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            var s;
                                            return o = e.x, i = e.y, a = e.placement, l = e.middlewareData, [4, (s = r, i1(function() {
                                                var t, r, n, o, i, a, l, c, u, f, p, d, y, h;
                                                return i4(this, function(b) {
                                                    switch (b.label) {
                                                        case 0:
                                                            return t = e.placement, r = e.platform, n = e.elements, [4, null == r.isRTL ? void 0 : r.isRTL(n.floating)];
                                                        case 1:
                                                            return o = b.sent(), i = iH(t), a = iF(t), l = "y" === iK(t), c = ar.has(i) ? -1 : 1, u = o && l ? -1 : 1, d = (p = "number" == typeof(f = iL(s, e)) ? {
                                                                mainAxis: f,
                                                                crossAxis: 0,
                                                                alignmentAxis: null
                                                            } : {
                                                                mainAxis: f.mainAxis || 0,
                                                                crossAxis: f.crossAxis || 0,
                                                                alignmentAxis: f.alignmentAxis
                                                            }).mainAxis, y = p.crossAxis, h = p.alignmentAxis, a && "number" == typeof h && (y = "end" === a ? -1 * h : h), [2, l ? {
                                                                x: y * u,
                                                                y: d * c
                                                            } : {
                                                                x: d * c,
                                                                y: y * u
                                                            }]
                                                    }
                                                })
                                            })())];
                                        case 1:
                                            if (c = u.sent(), a === (null == (t = l.offset) ? void 0 : t.placement) && null != (n = l.arrow) && n.alignmentOffset) return [2, {}];
                                            return [2, {
                                                x: o + c.x,
                                                y: i + c.y,
                                                data: i8(i3({}, c), {
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
                lt = function(e, t) {
                    var r;
                    return a2(a1({}, (void 0 === (r = e) && (r = {}), {
                        name: "shift",
                        options: r,
                        fn: function(e) {
                            return i1(function() {
                                var t, n, o, i, a, l, c, u, s, f, p, d, y, h, b, m, v, g, O, w, E, j, S, P, x, A, T, C;
                                return i4(this, function(I) {
                                    switch (I.label) {
                                        case 0:
                                            return t = e.x, n = e.y, o = e.placement, l = void 0 === (a = (i = iL(r, e)).mainAxis) || a, u = void 0 !== (c = i.crossAxis) && c, f = void 0 === (s = i.limiter) ? {
                                                fn: function(e) {
                                                    return {
                                                        x: e.x,
                                                        y: e.y
                                                    }
                                                }
                                            } : s, p = i5(i, ["mainAxis", "crossAxis", "limiter"]), d = {
                                                x: t,
                                                y: n
                                            }, [4, i9(e, p)];
                                        case 1:
                                            return y = I.sent(), m = d[b = iU(h = iK(iH(o)))], v = d[h], l && (g = "y" === b ? "top" : "left", O = "y" === b ? "bottom" : "right", w = m + y[g], E = m - y[O], m = iR(w, iN(m, E))), u && (j = "y" === h ? "top" : "left", S = "y" === h ? "bottom" : "right", P = v + y[j], x = v - y[S], v = iR(P, iN(v, x))), T = f.fn(i8(i3({}, e), (i2(A = {}, b, m), i2(A, h, v), A))), [2, i8(i3({}, T), {
                                                data: {
                                                    x: T.x - t,
                                                    y: T.y - n,
                                                    enabled: (i2(C = {}, b, l), i2(C, h, u), C)
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
                lr = function(e, t) {
                    var r;
                    return a2(a1({}, (void 0 === (r = e) && (r = {}), {
                        options: r,
                        fn: function(e) {
                            var t, n = e.x,
                                o = e.y,
                                i = e.placement,
                                a = e.rects,
                                l = e.middlewareData,
                                c = iL(r, e),
                                u = c.offset,
                                s = c.mainAxis,
                                f = c.crossAxis,
                                p = {
                                    x: n,
                                    y: o
                                },
                                d = iK(i),
                                y = iU(d),
                                h = p[y],
                                b = p[d],
                                m = iL(void 0 === u ? 0 : u, e),
                                v = "number" == typeof m ? {
                                    mainAxis: m,
                                    crossAxis: 0
                                } : i3({
                                    mainAxis: 0,
                                    crossAxis: 0
                                }, m);
                            if (void 0 === s || s) {
                                var g = "y" === y ? "height" : "width",
                                    O = a.reference[y] - a.floating[g] + v.mainAxis,
                                    w = a.reference[y] + a.reference[g] - v.mainAxis;
                                h < O ? h = O : h > w && (h = w)
                            }
                            if (void 0 === f || f) {
                                var E, j, S = "y" === y ? "width" : "height",
                                    P = ar.has(iH(i)),
                                    x = a.reference[d] - a.floating[S] + (P && (null == (E = l.offset) ? void 0 : E[d]) || 0) + (P ? 0 : v.crossAxis),
                                    A = a.reference[d] + a.reference[S] + (P ? 0 : (null == (j = l.offset) ? void 0 : j[d]) || 0) - (P ? v.crossAxis : 0);
                                b < x ? b = x : b > A && (b = A)
                            }
                            return i2(t = {}, y, h), i2(t, d, b), t
                        }
                    })), {
                        options: [e, t]
                    })
                },
                ln = function(e, t) {
                    var r;
                    return a2(a1({}, (void 0 === (r = e) && (r = {}), {
                        name: "flip",
                        options: r,
                        fn: function(e) {
                            return i1(function() {
                                var t, n, o, i, a, l, c, u, s, f, p, d, y, h, b, m, v, g, O, w, E, j, S, P, x, A, T, C, I, N, R, _, D, k, M, B, L, H, F, U;
                                return i4(this, function(G) {
                                    var V, K, W, z, X, $, Z, Y, q, J, Q, ee, et, er, en;
                                    switch (G.label) {
                                        case 0:
                                            if (o = e.placement, i = e.middlewareData, a = e.rects, l = e.initialPlacement, c = e.platform, u = e.elements, p = void 0 === (f = (s = iL(r, e)).mainAxis) || f, y = void 0 === (d = s.crossAxis) || d, h = s.fallbackPlacements, m = void 0 === (b = s.fallbackStrategy) ? "bestFit" : b, g = void 0 === (v = s.fallbackAxisSideDirection) ? "none" : v, w = void 0 === (O = s.flipAlignment) || O, E = i5(s, ["mainAxis", "crossAxis", "fallbackPlacements", "fallbackStrategy", "fallbackAxisSideDirection", "flipAlignment"]), null != (t = i.arrow) && t.alignmentOffset) return [2, {}];
                                            return j = iH(o), S = iK(l), P = iH(l) === l, [4, null == c.isRTL ? void 0 : c.isRTL(u.floating)];
                                        case 1:
                                            return x = G.sent(), A = h || (P || !w ? [iY(l)] : (K = iY(V = l), [iW(V), K, iW(K)])), T = "none" !== g, !h && T && (C = A).push.apply(C, i6((W = l, z = w, X = g, $ = x, Z = iF(W), Y = function(e, t, r) {
                                                switch (e) {
                                                    case "top":
                                                    case "bottom":
                                                        if (r) return t ? iX : iz;
                                                        return t ? iz : iX;
                                                    case "left":
                                                    case "right":
                                                        return t ? i$ : iZ;
                                                    default:
                                                        return []
                                                }
                                            }(iH(W), "start" === X, $), Z && (Y = Y.map(function(e) {
                                                return e + "-" + Z
                                            }), z && (Y = Y.concat(Y.map(iW)))), Y))), I = [l].concat(i6(A)), [4, i9(e, E)];
                                        case 2:
                                            if (N = G.sent(), R = [], _ = (null == (n = i.flip) ? void 0 : n.overflows) || [], p && R.push(N[j]), y && (q = o, J = a, void 0 === (Q = x) && (Q = !1), ee = iF(q), er = iG(et = iU(iK(q))), en = "x" === et ? ee === (Q ? "end" : "start") ? "right" : "left" : "start" === ee ? "bottom" : "top", J.reference[er] > J.floating[er] && (en = iY(en)), D = [en, iY(en)], R.push(N[D[0]], N[D[1]])), _ = i6(_).concat([{
                                                    placement: o,
                                                    overflows: R
                                                }]), !R.every(function(e) {
                                                    return e <= 0
                                                })) {
                                                if ((L = I[B = ((null == (k = i.flip) ? void 0 : k.index) || 0) + 1]) && ("alignment" !== y || S === iK(L) || _.every(function(e) {
                                                        return iK(e.placement) !== S || e.overflows[0] > 0
                                                    }))) return [2, {
                                                    data: {
                                                        index: B,
                                                        overflows: _
                                                    },
                                                    reset: {
                                                        placement: L
                                                    }
                                                }];
                                                if (!(H = null == (M = _.filter(function(e) {
                                                        return e.overflows[0] <= 0
                                                    }).sort(function(e, t) {
                                                        return e.overflows[1] - t.overflows[1]
                                                    })[0]) ? void 0 : M.placement)) switch (m) {
                                                    case "bestFit":
                                                        (U = null == (F = _.filter(function(e) {
                                                            if (T) {
                                                                var t = iK(e.placement);
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
                                                        })[0]) ? void 0 : F[0]) && (H = U);
                                                        break;
                                                    case "initialPlacement":
                                                        H = l
                                                }
                                                if (o !== H) return [2, {
                                                    reset: {
                                                        placement: H
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
                lo = function(e, t) {
                    var r;
                    return a2(a1({}, (void 0 === (r = e) && (r = {}), {
                        name: "size",
                        options: r,
                        fn: function(e) {
                            return i1(function() {
                                var t, n, o, i, a, l, c, u, s, f, p, d, y, h, b, m, v, g, O, w, E, j, S, P, x, A, T, C, I, N;
                                return i4(this, function(R) {
                                    switch (R.label) {
                                        case 0:
                                            return o = e.placement, i = e.rects, a = e.platform, l = e.elements, s = void 0 === (u = (c = iL(r, e)).apply) ? function() {} : u, [4, i9(e, i5(c, ["apply"]))];
                                        case 1:
                                            if (f = R.sent(), p = iH(o), d = iF(o), y = "y" === iK(o), b = (h = i.floating).width, m = h.height, "top" !== p && "bottom" !== p) return [3, 3];
                                            return v = p, [4, null == a.isRTL ? void 0 : a.isRTL(l.floating)];
                                        case 2:
                                            return g = d === (R.sent() ? "start" : "end") ? "left" : "right", [3, 4];
                                        case 3:
                                            g = p, v = "end" === d ? "top" : "bottom", R.label = 4;
                                        case 4:
                                            return O = m - f.top - f.bottom, w = b - f.left - f.right, E = iN(m - f[v], O), j = iN(b - f[g], w), S = !e.middlewareData.shift, P = E, x = j, null != (t = e.middlewareData.shift) && t.enabled.x && (x = w), null != (n = e.middlewareData.shift) && n.enabled.y && (P = O), S && !d && (A = iR(f.left, 0), T = iR(f.right, 0), C = iR(f.top, 0), I = iR(f.bottom, 0), y ? x = b - 2 * (0 !== A || 0 !== T ? A + T : iR(f.left, f.right)) : P = m - 2 * (0 !== C || 0 !== I ? C + I : iR(f.top, f.bottom))), [4, s(i8(i3({}, e), {
                                                availableWidth: x,
                                                availableHeight: P
                                            }))];
                                        case 5:
                                            return R.sent(), [4, a.getDimensions(l.floating)];
                                        case 6:
                                            if (N = R.sent(), b !== N.width || m !== N.height) return [2, {
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
                li = function(e, t) {
                    var r;
                    return a2(a1({}, (void 0 === (r = e) && (r = {}), {
                        name: "hide",
                        options: r,
                        fn: function(e) {
                            return i1(function() {
                                var t, n, o, i, a, l, c;
                                return i4(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            switch (t = e.rects, i = void 0 === (o = (n = iL(r, e)).strategy) ? "referenceHidden" : o, a = i5(n, ["strategy"]), i) {
                                                case "referenceHidden":
                                                    return [3, 1];
                                                case "escaped":
                                                    return [3, 3]
                                            }
                                            return [3, 5];
                                        case 1:
                                            return [4, i9(e, i8(i3({}, a), {
                                                elementContext: "reference"
                                            }))];
                                        case 2:
                                            return [2, {
                                                data: {
                                                    referenceHiddenOffsets: l = ae(u.sent(), t.reference),
                                                    referenceHidden: at(l)
                                                }
                                            }];
                                        case 3:
                                            return [4, i9(e, i8(i3({}, a), {
                                                altBoundary: !0
                                            }))];
                                        case 4:
                                            return [2, {
                                                data: {
                                                    escapedOffsets: c = ae(u.sent(), t.floating),
                                                    escaped: at(c)
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
                la = function(e, t) {
                    return a2(a1({}, {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            var r = "function" == typeof e ? e(t) : e,
                                n = r.element,
                                o = r.padding;
                            return n && ({}).hasOwnProperty.call(n, "current") ? null != n.current ? aJ({
                                element: n.current,
                                padding: o
                            }).fn(t) : {} : n ? aJ({
                                element: n,
                                padding: o
                            }).fn(t) : {}
                        }
                    }), {
                        options: [e, t]
                    })
                };

            function ll(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lc(e) {
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

            function lu(e, t) {
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

            function ls(e, t) {
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

            function lf(e) {
                return function(e) {
                    if (Array.isArray(e)) return ll(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return ll(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ll(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var lp = S.forwardRef(function(e, t) {
                var r = e.children,
                    n = ls(e, ["children"]),
                    o = S.Children.toArray(r),
                    i = o.find(lh);
                if (i) {
                    var a = i.props.children,
                        l = o.map(function(e) {
                            return e !== i ? e : S.Children.count(a) > 1 ? S.Children.only(null) : S.isValidElement(a) ? a.props.children : null
                        });
                    return (0, w.jsx)(ld, lu(lc({}, n), {
                        ref: t,
                        children: S.isValidElement(a) ? S.cloneElement(a, void 0, l) : null
                    }))
                }
                return (0, w.jsx)(ld, lu(lc({}, n), {
                    ref: t,
                    children: r
                }))
            });
            lp.displayName = "Slot";
            var ld = S.forwardRef(function(e, t) {
                var r = e.children,
                    n = ls(e, ["children"]);
                if (S.isValidElement(r)) {
                    var o, i, a, l, c, u = (c = (l = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref;
                    return S.cloneElement(r, lu(lc({}, function(e, t) {
                        var r = lc({}, t);
                        for (var n in t) ! function(n) {
                            var o = e[n],
                                i = t[n];
                            /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                i.apply(void 0, lf(t)), o.apply(void 0, lf(t))
                            } : o && (r[n] = o) : "style" === n ? r[n] = lc({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                        }(n);
                        return lc({}, e, r)
                    }(n, r.props)), {
                        ref: t ? iv(t, u) : u
                    }))
                }
                return S.Children.count(r) > 1 ? S.Children.only(null) : null
            });
            ld.displayName = "SlotClone";
            var ly = function(e) {
                var t = e.children;
                return (0, w.jsx)(w.Fragment, {
                    children: t
                })
            };

            function lh(e) {
                return S.isValidElement(e) && e.type === ly
            }

            function lb(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function lm(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        lb(e, t, r[t])
                    })
                }
                return e
            }

            function lv(e, t) {
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
            var lg = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                    var r = S.forwardRef(function(e, r) {
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
                            i = n ? lp : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, w.jsx)(i, lv(lm({}, o), {
                            ref: r
                        }))
                    });
                    return r.displayName = "Primitive.".concat(t), lv(lm({}, e), lb({}, t, r))
                }, {}),
                lO = S.forwardRef(function(e, t) {
                    var r, n, o = e.children,
                        i = e.width,
                        a = e.height,
                        l = function(e, t) {
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
                        }(e, ["children", "width", "height"]);
                    return (0, w.jsx)(lg.svg, (r = function(e) {
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
                        width: void 0 === i ? 10 : i,
                        height: void 0 === a ? 5 : a,
                        viewBox: "0 0 30 10",
                        preserveAspectRatio: "none",
                        children: e.asChild ? o : (0, w.jsx)("polygon", {
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

            function lw(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lE(e) {
                var t = S.useRef(e);
                return S.useEffect(function() {
                    t.current = e
                }), S.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return lw(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return lw(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lw(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function lj(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lS(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lP(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function lx(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        lP(e, t, r[t])
                    })
                }
                return e
            }

            function lA(e, t) {
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

            function lT(e, t) {
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

            function lC(e, t) {
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
                }(e, t) || lI(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lI(e, t) {
                if (e) {
                    if ("string" == typeof e) return lS(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lS(e, t)
                }
            }
            lO.displayName = "Arrow";
            var lN = "Popper",
                lR = lC(iS(lN), 2),
                l_ = lR[0],
                lD = lR[1],
                lk = lC(l_(lN), 2),
                lM = lk[0],
                lB = lk[1],
                lL = function(e) {
                    var t = e.__scopePopper,
                        r = e.children,
                        n = lC(S.useState(null), 2),
                        o = n[0],
                        i = n[1];
                    return (0, w.jsx)(lM, {
                        scope: t,
                        anchor: o,
                        onAnchorChange: i,
                        children: r
                    })
                };
            lL.displayName = lN;
            var lH = "PopperAnchor",
                lF = S.forwardRef(function(e, t) {
                    var r = e.__scopePopper,
                        n = e.virtualRef,
                        o = lT(e, ["__scopePopper", "virtualRef"]),
                        i = lB(lH, r),
                        a = S.useRef(null),
                        l = ig(t, a);
                    return S.useEffect(function() {
                        i.onAnchorChange((null == n ? void 0 : n.current) || a.current)
                    }), n ? null : (0, w.jsx)(lg.div, lA(lx({}, o), {
                        ref: l
                    }))
                });
            lF.displayName = lH;
            var lU = "PopperContent",
                lG = lC(l_(lU), 2),
                lV = lG[0],
                lK = lG[1],
                lW = S.forwardRef(function(e, t) {
                    var r, n, o, i, a, l, c, u, s, f, p, d, y, h, b, m, v, g, O, E, j, P, A, T, C, I, N, R, _, D, k, M, B, L, H, F, U, G, V, K, W, z, X, $, Z, Y, q, J, Q, ee, et, er, en, eo, ei, ea, el = e.__scopePopper,
                        ec = e.side,
                        eu = e.sideOffset,
                        es = e.align,
                        ef = void 0 === es ? "center" : es,
                        ep = e.alignOffset,
                        ed = e.arrowPadding,
                        ey = e.avoidCollisions,
                        eh = void 0 === ey || ey,
                        eb = e.collisionBoundary,
                        em = void 0 === eb ? [] : eb,
                        ev = e.collisionPadding,
                        eg = void 0 === ev ? 0 : ev,
                        eO = e.sticky,
                        ew = e.hideWhenDetached,
                        eE = e.updatePositionStrategy,
                        ej = void 0 === eE ? "optimized" : eE,
                        eS = e.onPlaced,
                        eP = lT(e, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        ex = lB(lU, el),
                        eA = lC(S.useState(null), 2),
                        eT = eA[0],
                        eC = eA[1],
                        eI = ig(t, function(e) {
                            return eC(e)
                        }),
                        eN = lC(S.useState(null), 2),
                        eR = eN[0],
                        e_ = eN[1],
                        eD = (o = (n = function(e) {
                            if (Array.isArray(e)) return e
                        }(r = S.useState(void 0)) || function(e) {
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
                                if ("string" == typeof e) return lj(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lj(e, 2)
                            }
                        }(r) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], i = n[1], ix(function() {
                            if (eR) {
                                i({
                                    width: eR.offsetWidth,
                                    height: eR.offsetHeight
                                });
                                var e = new ResizeObserver(function(e) {
                                    if (Array.isArray(e) && e.length) {
                                        var t, r, n = e[0];
                                        if ("borderBoxSize" in n) {
                                            var o = n.borderBoxSize,
                                                a = Array.isArray(o) ? o[0] : o;
                                            t = a.inlineSize, r = a.blockSize
                                        } else t = eR.offsetWidth, r = eR.offsetHeight;
                                        i({
                                            width: t,
                                            height: r
                                        })
                                    }
                                });
                                return e.observe(eR, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return e.unobserve(eR)
                                    }
                            }
                            i(void 0)
                        }, [eR]), o),
                        ek = null != (Q = null == eD ? void 0 : eD.width) ? Q : 0,
                        eM = null != (ee = null == eD ? void 0 : eD.height) ? ee : 0,
                        eB = "number" == typeof eg ? eg : lx({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, eg),
                        eL = Array.isArray(em) ? em : [em],
                        eH = eL.length > 0,
                        eF = {
                            padding: eB,
                            boundary: eL.filter(lZ),
                            altBoundary: eH
                        },
                        eU = (c = void 0 === (l = (a = {
                            strategy: "fixed",
                            placement: (void 0 === ec ? "bottom" : ec) + ("center" !== ef ? "-" + ef : ""),
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return aq.apply(void 0, ((function(e) {
                                    if (Array.isArray(e)) return lS(e)
                                })(t) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(t) || lI(t) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()).concat([{
                                    animationFrame: "always" === ej
                                }]))
                            },
                            elements: {
                                reference: ex.anchor
                            },
                            middleware: [le({
                                mainAxis: (void 0 === eu ? 0 : eu) + eM,
                                alignmentAxis: void 0 === ep ? 0 : ep
                            }), eh && lt(lx({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === eO ? "partial" : eO) ? lr() : void 0
                            }, eF)), eh && ln(lx({}, eF)), lo(lA(lx({}, eF), {
                                apply: function(e) {
                                    var t = e.elements,
                                        r = e.rects,
                                        n = e.availableWidth,
                                        o = e.availableHeight,
                                        i = r.reference,
                                        a = i.width,
                                        l = i.height,
                                        c = t.floating.style;
                                    c.setProperty("--radix-popper-available-width", "".concat(n, "px")), c.setProperty("--radix-popper-available-height", "".concat(o, "px")), c.setProperty("--radix-popper-anchor-width", "".concat(a, "px")), c.setProperty("--radix-popper-anchor-height", "".concat(l, "px"))
                                }
                            })), eR && la({
                                element: eR,
                                padding: void 0 === ed ? 0 : ed
                            }), lY({
                                arrowWidth: ek,
                                arrowHeight: eM
                            }), void 0 !== ew && ew && li(lx({
                                strategy: "referenceHidden"
                            }, eF))]
                        }).placement) ? "bottom" : l, s = void 0 === (u = a.strategy) ? "absolute" : u, p = void 0 === (f = a.middleware) ? [] : f, d = a.platform, b = (h = void 0 === (y = a.elements) ? {} : y).reference, m = h.floating, g = void 0 === (v = a.transform) || v, O = a.whileElementsMounted, E = a.open, P = (j = a3(S.useState({
                            x: 0,
                            y: 0,
                            strategy: s,
                            placement: c,
                            middlewareData: {},
                            isPositioned: !1
                        }), 2))[0], A = j[1], C = (T = a3(S.useState(p), 2))[0], I = T[1], a6(C, p) || I(p), R = (N = a3(S.useState(null), 2))[0], _ = N[1], k = (D = a3(S.useState(null), 2))[0], M = D[1], B = S.useCallback(function(e) {
                            e !== U.current && (U.current = e, _(e))
                        }, []), L = S.useCallback(function(e) {
                            e !== G.current && (G.current = e, M(e))
                        }, []), H = b || R, F = m || k, U = S.useRef(null), G = S.useRef(null), V = S.useRef(P), K = null != O, W = a9(O), z = a9(d), X = a9(E), $ = S.useCallback(function() {
                            if (U.current && G.current) {
                                var e = {
                                    placement: c,
                                    strategy: s,
                                    middleware: C
                                };
                                z.current && (e.platform = z.current), aQ(U.current, G.current, e).then(function(e) {
                                    var t = a2(a1({}, e), {
                                        isPositioned: !1 !== X.current
                                    });
                                    Z.current && !a6(V.current, t) && (V.current = t, x.flushSync(function() {
                                        A(t)
                                    }))
                                })
                            }
                        }, [C, c, s, z, X]), a5(function() {
                            !1 === E && V.current.isPositioned && (V.current.isPositioned = !1, A(function(e) {
                                return a2(a1({}, e), {
                                    isPositioned: !1
                                })
                            }))
                        }, [E]), Z = S.useRef(!1), a5(function() {
                            return Z.current = !0,
                                function() {
                                    Z.current = !1
                                }
                        }, []), a5(function() {
                            if (H && (U.current = H), F && (G.current = F), H && F) {
                                if (W.current) return W.current(H, F, $);
                                $()
                            }
                        }, [H, F, $, W, K]), Y = S.useMemo(function() {
                            return {
                                reference: U,
                                floating: G,
                                setReference: B,
                                setFloating: L
                            }
                        }, [B, L]), q = S.useMemo(function() {
                            return {
                                reference: H,
                                floating: F
                            }
                        }, [H, F]), J = S.useMemo(function() {
                            var e = {
                                position: s,
                                left: 0,
                                top: 0
                            };
                            if (!q.floating) return e;
                            var t = a7(q.floating, P.x),
                                r = a7(q.floating, P.y);
                            return g ? a1(a2(a1({}, e), {
                                transform: "translate(" + t + "px, " + r + "px)"
                            }), a4(q.floating) >= 1.5 && {
                                willChange: "transform"
                            }) : {
                                position: s,
                                left: t,
                                top: r
                            }
                        }, [s, g, q.floating, P.x, P.y]), S.useMemo(function() {
                            return a2(a1({}, P), {
                                update: $,
                                refs: Y,
                                elements: q,
                                floatingStyles: J
                            })
                        }, [P, $, Y, q, J])),
                        eG = eU.refs,
                        eV = eU.floatingStyles,
                        eK = eU.placement,
                        eW = eU.isPositioned,
                        ez = eU.middlewareData,
                        eX = lC(lq(eK), 2),
                        e$ = eX[0],
                        eZ = eX[1],
                        eY = lE(eS);
                    ix(function() {
                        eW && (null == eY || eY())
                    }, [eW, eY]);
                    var eq = null == (et = ez.arrow) ? void 0 : et.x,
                        eJ = null == (er = ez.arrow) ? void 0 : er.y,
                        eQ = (null == (en = ez.arrow) ? void 0 : en.centerOffset) !== 0,
                        e0 = lC(S.useState(), 2),
                        e1 = e0[0],
                        e2 = e0[1];
                    return ix(function() {
                        eT && e2(window.getComputedStyle(eT).zIndex)
                    }, [eT]), (0, w.jsx)("div", {
                        ref: eG.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: lx(lA(lx({}, eV), lP({
                            transform: eW ? eV.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: e1
                        }, "--radix-popper-transform-origin", [null == (eo = ez.transformOrigin) ? void 0 : eo.x, null == (ei = ez.transformOrigin) ? void 0 : ei.y].join(" "))), (null == (ea = ez.hide) ? void 0 : ea.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, w.jsx)(lV, {
                            scope: el,
                            placedSide: e$,
                            onArrowChange: e_,
                            arrowX: eq,
                            arrowY: eJ,
                            shouldHideArrow: eQ,
                            children: (0, w.jsx)(lg.div, lA(lx({
                                "data-side": e$,
                                "data-align": eZ
                            }, eP), {
                                ref: eI,
                                style: lA(lx({}, eP.style), {
                                    animation: eW ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            lW.displayName = lU;
            var lz = "PopperArrow",
                lX = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                l$ = S.forwardRef(function(e, t) {
                    var r, n = e.__scopePopper,
                        o = lT(e, ["__scopePopper"]),
                        i = lK(lz, n),
                        a = lX[i.placedSide];
                    return (0, w.jsx)("span", {
                        ref: i.onArrowChange,
                        style: (lP(r = {
                            position: "absolute",
                            left: i.arrowX,
                            top: i.arrowY
                        }, a, 0), lP(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [i.placedSide]), lP(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [i.placedSide]), lP(r, "visibility", i.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, w.jsx)(lO, lA(lx({}, o), {
                            ref: t,
                            style: lA(lx({}, o.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function lZ(e) {
                return null !== e
            }
            l$.displayName = lz;
            var lY = function(e) {
                return {
                    name: "transformOrigin",
                    options: e,
                    fn: function(t) {
                        var r, n, o, i, a, l = t.placement,
                            c = t.rects,
                            u = t.middlewareData,
                            s = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0,
                            f = s ? 0 : e.arrowWidth,
                            p = s ? 0 : e.arrowHeight,
                            d = lC(lq(l), 2),
                            y = d[0],
                            h = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [d[1]],
                            b = (null != (r = null == (i = u.arrow) ? void 0 : i.x) ? r : 0) + f / 2,
                            m = (null != (n = null == (a = u.arrow) ? void 0 : a.y) ? n : 0) + p / 2,
                            v = "",
                            g = "";
                        return "bottom" === y ? (v = s ? h : "".concat(b, "px"), g = "".concat(-p, "px")) : "top" === y ? (v = s ? h : "".concat(b, "px"), g = "".concat(c.floating.height + p, "px")) : "right" === y ? (v = "".concat(-p, "px"), g = s ? h : "".concat(m, "px")) : "left" === y && (v = "".concat(c.floating.width + p, "px"), g = s ? h : "".concat(m, "px")), {
                            data: {
                                x: v,
                                y: g
                            }
                        }
                    }
                }
            };

            function lq(e) {
                var t = lC(e.split("-"), 2),
                    r = t[0],
                    n = t[1];
                return [r, void 0 === n ? "center" : n]
            }

            function lJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var lQ = S.forwardRef(function(e, t) {
                var r, n, o, i, a, l = e.container,
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
                    }(e, ["container"]),
                    u = function(e) {
                        if (Array.isArray(e)) return e
                    }(r = S.useState(!1)) || function(e) {
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
                            if ("string" == typeof e) return lJ(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lJ(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = u[0],
                    f = u[1];
                ix(function() {
                    return f(!0)
                }, []);
                var p = l || s && (null == (a = globalThis) || null == (i = a.document) ? void 0 : i.body);
                return p ? A().createPortal((0, w.jsx)(lg.div, (n = function(e) {
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
                }({}, c), o = o = {
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
                }), n)), p) : null
            });

            function l0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function l1(e, t) {
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
                        if ("string" == typeof e) return l0(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return l0(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            lQ.displayName = "Portal";
            var l2 = function(e) {
                var t, r, n, o, i, a, l, c, u, s, f, p, d, y, h, b, m, v = e.present,
                    g = e.children,
                    O = (t = v, i = (o = l1(S.useState(), 2))[0], a = o[1], l = S.useRef({}), c = S.useRef(t), u = S.useRef("none"), f = (s = l1((r = t ? "mounted" : "unmounted", n = {
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
                    }, S.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], p = s[1], S.useEffect(function() {
                        var e = l3(l.current);
                        u.current = "mounted" === f ? e : "none"
                    }, [f]), ix(function() {
                        var e = l.current,
                            r = c.current;
                        if (r !== t) {
                            var n = u.current,
                                o = l3(e);
                            t ? p("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? p("UNMOUNT") : r && n !== o ? p("ANIMATION_OUT") : p("UNMOUNT"), c.current = t
                        }
                    }, [t, p]), ix(function() {
                        if (i) {
                            var e, t, r = null != (e = i.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = l3(l.current).includes(e.animationName);
                                    if (e.target === i && n && (p("ANIMATION_END"), !c.current)) {
                                        var o = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === i && (u.current = l3(l.current))
                                };
                            return i.addEventListener("animationstart", o), i.addEventListener("animationcancel", n), i.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), i.removeEventListener("animationstart", o), i.removeEventListener("animationcancel", n), i.removeEventListener("animationend", n)
                                }
                        }
                        p("ANIMATION_END")
                    }, [i, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: S.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    w = "function" == typeof g ? g({
                        present: O.isPresent
                    }) : S.Children.only(g),
                    E = ig(O.ref, (m = (b = null == (y = Object.getOwnPropertyDescriptor((d = w).props, "ref")) ? void 0 : y.get) && "isReactWarning" in b && b.isReactWarning) ? d.ref : (m = (b = null == (h = Object.getOwnPropertyDescriptor(d, "ref")) ? void 0 : h.get) && "isReactWarning" in b && b.isReactWarning) ? d.props.ref : d.props.ref || d.ref);
                return "function" == typeof g || O.isPresent ? S.cloneElement(w, {
                    ref: E
                }) : null
            };

            function l3(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function l8(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function l5(e, t) {
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
                        if ("string" == typeof e) return l8(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return l8(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function l6(e) {
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
            l2.displayName = "Presence";
            var l4 = S.forwardRef(function(e, t) {
                var r, n;
                return (0, w.jsx)(lg.span, (r = l6({}, e), n = n = {
                    ref: t,
                    style: l6({
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

            function l7(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function l9(e) {
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

            function ce(e, t) {
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

            function ct(e, t) {
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

            function cr(e, t) {
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
                }(e, t) || co(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function cn(e) {
                return function(e) {
                    if (Array.isArray(e)) return l7(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || co(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function co(e, t) {
                if (e) {
                    if ("string" == typeof e) return l7(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return l7(e, t)
                }
            }
            l4.displayName = "VisuallyHidden";
            var ci = cr(iS("Tooltip", [lD]), 2),
                ca = ci[0];
            ci[1];
            var cl = lD(),
                cc = "TooltipProvider",
                cu = "tooltip.open",
                cs = cr(ca(cc), 2),
                cf = cs[0],
                cp = cs[1],
                cd = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.delayDuration,
                        n = e.skipDelayDuration,
                        o = void 0 === n ? 300 : n,
                        i = e.disableHoverableContent,
                        a = e.children,
                        l = cr(S.useState(!0), 2),
                        c = l[0],
                        u = l[1],
                        s = S.useRef(!1),
                        f = S.useRef(0);
                    return S.useEffect(function() {
                        var e = f.current;
                        return function() {
                            return window.clearTimeout(e)
                        }
                    }, []), (0, w.jsx)(cf, {
                        scope: t,
                        isOpenDelayed: c,
                        delayDuration: void 0 === r ? 700 : r,
                        onOpen: S.useCallback(function() {
                            window.clearTimeout(f.current), u(!1)
                        }, []),
                        onClose: S.useCallback(function() {
                            window.clearTimeout(f.current), f.current = window.setTimeout(function() {
                                return u(!0)
                            }, o)
                        }, [o]),
                        isPointerInTransitRef: s,
                        onPointerInTransitChange: S.useCallback(function(e) {
                            s.current = e
                        }, []),
                        disableHoverableContent: void 0 !== i && i,
                        children: a
                    })
                };
            cd.displayName = cc;
            var cy = "Tooltip",
                ch = cr(ca(cy), 2),
                cb = ch[0],
                cm = ch[1],
                cv = function(e) {
                    var t, r, n, o, i, a, l, c, u, s, f, p, d, y, h, b, m, v, g, O, E, j = e.__scopeTooltip,
                        P = e.children,
                        x = e.open,
                        A = e.defaultOpen,
                        T = e.onOpenChange,
                        C = e.disableHoverableContent,
                        I = e.delayDuration,
                        N = cp(cy, e.__scopeTooltip),
                        R = cl(j),
                        _ = cr(S.useState(null), 2),
                        D = _[0],
                        k = _[1],
                        M = (s = (u = function(e) {
                            if (Array.isArray(e)) return e
                        }(c = S.useState(iT())) || function(e) {
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
                        }(c) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return iA(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iA(e, 2)
                            }
                        }(c) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], f = u[1], ix(function() {
                            f(function(e) {
                                return null != e ? e : String(iC++)
                            })
                        }, [void 0]), s ? "radix-".concat(s) : ""),
                        B = S.useRef(0),
                        L = null != C ? C : N.disableHoverableContent,
                        H = null != I ? I : N.delayDuration,
                        F = S.useRef(!1),
                        U = cr((d = (p = {
                            prop: x,
                            defaultProp: void 0 !== A && A,
                            onChange: function(e) {
                                e ? (N.onOpen(), document.dispatchEvent(new CustomEvent(cu))) : N.onClose(), null == T || T(e)
                            }
                        }).prop, m = (b = l5((r = (t = {
                            defaultProp: p.defaultProp,
                            onChange: h = void 0 === (y = p.onChange) ? function() {} : y
                        }).defaultProp, n = t.onChange, i = l5(o = S.useState(r), 1)[0], a = S.useRef(i), l = lE(n), S.useEffect(function() {
                            a.current !== i && (l(i), a.current = i)
                        }, [i, a, l]), o), 2))[0], v = b[1], O = (g = void 0 !== d) ? d : m, E = lE(h), [O, S.useCallback(function(e) {
                            if (g) {
                                var t = "function" == typeof e ? e(d) : e;
                                t !== d && E(t)
                            } else v(e)
                        }, [g, d, v, E])]), 2),
                        G = U[0],
                        V = void 0 !== G && G,
                        K = U[1],
                        W = S.useMemo(function() {
                            return V ? F.current ? "delayed-open" : "instant-open" : "closed"
                        }, [V]),
                        z = S.useCallback(function() {
                            window.clearTimeout(B.current), B.current = 0, F.current = !1, K(!0)
                        }, [K]),
                        X = S.useCallback(function() {
                            window.clearTimeout(B.current), B.current = 0, K(!1)
                        }, [K]),
                        $ = S.useCallback(function() {
                            window.clearTimeout(B.current), B.current = window.setTimeout(function() {
                                F.current = !0, K(!0), B.current = 0
                            }, H)
                        }, [H, K]);
                    return S.useEffect(function() {
                        return function() {
                            B.current && (window.clearTimeout(B.current), B.current = 0)
                        }
                    }, []), (0, w.jsx)(lL, ce(l9({}, R), {
                        children: (0, w.jsx)(cb, {
                            scope: j,
                            contentId: M,
                            open: V,
                            stateAttribute: W,
                            trigger: D,
                            onTriggerChange: k,
                            onTriggerEnter: S.useCallback(function() {
                                N.isOpenDelayed ? $() : z()
                            }, [N.isOpenDelayed, $, z]),
                            onTriggerLeave: S.useCallback(function() {
                                L ? X() : (window.clearTimeout(B.current), B.current = 0)
                            }, [X, L]),
                            onOpen: z,
                            onClose: X,
                            disableHoverableContent: L,
                            children: P
                        })
                    }))
                };
            cv.displayName = cy;
            var cg = "TooltipTrigger",
                cO = S.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = ct(e, ["__scopeTooltip"]),
                        o = cm(cg, r),
                        i = cp(cg, r),
                        a = cl(r),
                        l = ig(t, S.useRef(null), o.onTriggerChange),
                        c = S.useRef(!1),
                        u = S.useRef(!1),
                        s = S.useCallback(function() {
                            return c.current = !1
                        }, []);
                    return S.useEffect(function() {
                        return function() {
                            return document.removeEventListener("pointerup", s)
                        }
                    }, [s]), (0, w.jsx)(lF, ce(l9({
                        asChild: !0
                    }, a), {
                        children: (0, w.jsx)(lg.button, ce(l9({
                            "aria-describedby": o.open ? o.contentId : void 0,
                            "data-state": o.stateAttribute
                        }, n), {
                            ref: l,
                            onPointerMove: ih(e.onPointerMove, function(e) {
                                "touch" !== e.pointerType && (u.current || i.isPointerInTransitRef.current || (o.onTriggerEnter(), u.current = !0))
                            }),
                            onPointerLeave: ih(e.onPointerLeave, function() {
                                o.onTriggerLeave(), u.current = !1
                            }),
                            onPointerDown: ih(e.onPointerDown, function() {
                                c.current = !0, document.addEventListener("pointerup", s, {
                                    once: !0
                                })
                            }),
                            onFocus: ih(e.onFocus, function() {
                                c.current || o.onOpen()
                            }),
                            onBlur: ih(e.onBlur, o.onClose),
                            onClick: ih(e.onClick, o.onClose)
                        }))
                    }))
                });
            cO.displayName = cg;
            var cw = "TooltipPortal",
                cE = cr(ca(cw, {
                    forceMount: void 0
                }), 2),
                cj = cE[0],
                cS = cE[1],
                cP = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        i = cm(cw, t);
                    return (0, w.jsx)(cj, {
                        scope: t,
                        forceMount: r,
                        children: (0, w.jsx)(l2, {
                            present: r || i.open,
                            children: (0, w.jsx)(lQ, {
                                asChild: !0,
                                container: o,
                                children: n
                            })
                        })
                    })
                };
            cP.displayName = cw;
            var cx = "TooltipContent",
                cA = S.forwardRef(function(e, t) {
                    var r = cS(cx, e.__scopeTooltip),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        i = e.side,
                        a = void 0 === i ? "top" : i,
                        l = ct(e, ["forceMount", "side"]),
                        c = cm(cx, e.__scopeTooltip);
                    return (0, w.jsx)(l2, {
                        present: o || c.open,
                        children: c.disableHoverableContent ? (0, w.jsx)(cR, ce(l9({
                            side: a
                        }, l), {
                            ref: t
                        })) : (0, w.jsx)(cT, ce(l9({
                            side: a
                        }, l), {
                            ref: t
                        }))
                    })
                }),
                cT = S.forwardRef(function(e, t) {
                    var r = cm(cx, e.__scopeTooltip),
                        n = cp(cx, e.__scopeTooltip),
                        o = S.useRef(null),
                        i = ig(t, o),
                        a = cr(S.useState(null), 2),
                        l = a[0],
                        c = a[1],
                        u = r.trigger,
                        s = r.onClose,
                        f = o.current,
                        p = n.onPointerInTransitChange,
                        d = S.useCallback(function() {
                            c(null), p(!1)
                        }, [p]),
                        y = S.useCallback(function(e, t) {
                            var r, n, o, i, a, l, u = e.currentTarget,
                                s = {
                                    x: e.clientX,
                                    y: e.clientY
                                },
                                f = function(e, t) {
                                    var r = Math.abs(t.top - e.y),
                                        n = Math.abs(t.bottom - e.y),
                                        o = Math.abs(t.right - e.x),
                                        i = Math.abs(t.left - e.x);
                                    switch (Math.min(r, n, o, i)) {
                                        case i:
                                            return "left";
                                        case o:
                                            return "right";
                                        case r:
                                            return "top";
                                        case n:
                                            return "bottom";
                                        default:
                                            throw Error("unreachable")
                                    }
                                }(s, u.getBoundingClientRect()),
                                d = function(e, t) {
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
                                }(s, f),
                                y = (n = (r = t.getBoundingClientRect()).top, o = r.right, i = r.bottom, [{
                                    x: a = r.left,
                                    y: n
                                }, {
                                    x: o,
                                    y: n
                                }, {
                                    x: o,
                                    y: i
                                }, {
                                    x: a,
                                    y: i
                                }]);
                            c(((l = cn(d).concat(cn(y)).slice()).sort(function(e, t) {
                                return e.x < t.x ? -1 : e.x > t.x ? 1 : e.y < t.y ? -1 : 1 * !!(e.y > t.y)
                            }), function(e) {
                                if (e.length <= 1) return e.slice();
                                for (var t = [], r = 0; r < e.length; r++) {
                                    for (var n = e[r]; t.length >= 2;) {
                                        var o = t[t.length - 1],
                                            i = t[t.length - 2];
                                        if ((o.x - i.x) * (n.y - i.y) >= (o.y - i.y) * (n.x - i.x)) t.pop();
                                        else break
                                    }
                                    t.push(n)
                                }
                                t.pop();
                                for (var a = [], l = e.length - 1; l >= 0; l--) {
                                    for (var c = e[l]; a.length >= 2;) {
                                        var u = a[a.length - 1],
                                            s = a[a.length - 2];
                                        if ((u.x - s.x) * (c.y - s.y) >= (u.y - s.y) * (c.x - s.x)) a.pop();
                                        else break
                                    }
                                    a.push(c)
                                }
                                return (a.pop(), 1 === t.length && 1 === a.length && t[0].x === a[0].x && t[0].y === a[0].y) ? t : t.concat(a)
                            }(l))), p(!0)
                        }, [p]);
                    return S.useEffect(function() {
                        return function() {
                            return d()
                        }
                    }, [d]), S.useEffect(function() {
                        if (u && f) {
                            var e = function(e) {
                                    return y(e, f)
                                },
                                t = function(e) {
                                    return y(e, u)
                                };
                            return u.addEventListener("pointerleave", e), f.addEventListener("pointerleave", t),
                                function() {
                                    u.removeEventListener("pointerleave", e), f.removeEventListener("pointerleave", t)
                                }
                        }
                    }, [u, f, y, d]), S.useEffect(function() {
                        if (l) {
                            var e = function(e) {
                                var t = e.target,
                                    r = {
                                        x: e.clientX,
                                        y: e.clientY
                                    },
                                    n = (null == u ? void 0 : u.contains(t)) || (null == f ? void 0 : f.contains(t)),
                                    o = ! function(e, t) {
                                        for (var r = e.x, n = e.y, o = !1, i = 0, a = t.length - 1; i < t.length; a = i++) {
                                            var l = t[i].x,
                                                c = t[i].y,
                                                u = t[a].x,
                                                s = t[a].y;
                                            c > n != s > n && r < (u - l) * (n - c) / (s - c) + l && (o = !o)
                                        }
                                        return o
                                    }(r, l);
                                n ? d() : o && (d(), s())
                            };
                            return document.addEventListener("pointermove", e),
                                function() {
                                    return document.removeEventListener("pointermove", e)
                                }
                        }
                    }, [u, f, l, s, d]), (0, w.jsx)(cR, ce(l9({}, e), {
                        ref: i
                    }))
                }),
                cC = cr(ca(cy, {
                    isInside: !1
                }), 2),
                cI = cC[0],
                cN = cC[1],
                cR = S.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = e.children,
                        o = e["aria-label"],
                        i = e.onEscapeKeyDown,
                        a = e.onPointerDownOutside,
                        l = ct(e, ["__scopeTooltip", "children", "aria-label", "onEscapeKeyDown", "onPointerDownOutside"]),
                        c = cm(cx, r),
                        u = cl(r),
                        s = c.onClose;
                    return S.useEffect(function() {
                        return document.addEventListener(cu, s),
                            function() {
                                return document.removeEventListener(cu, s)
                            }
                    }, [s]), S.useEffect(function() {
                        if (c.trigger) {
                            var e = function(e) {
                                var t = e.target;
                                (null == t ? void 0 : t.contains(c.trigger)) && s()
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
                    }, [c.trigger, s]), (0, w.jsx)(tU.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !1,
                        onEscapeKeyDown: i,
                        onPointerDownOutside: a,
                        onFocusOutside: function(e) {
                            return e.preventDefault()
                        },
                        onDismiss: s,
                        children: (0, w.jsxs)(lW, ce(l9({
                            "data-state": c.stateAttribute
                        }, u, l), {
                            ref: t,
                            style: l9({}, l.style, {
                                "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                                "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                                "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                                "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                                "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                            }),
                            children: [(0, w.jsx)(ly, {
                                children: n
                            }), (0, w.jsx)(cI, {
                                scope: r,
                                isInside: !0,
                                children: (0, w.jsx)(l4, {
                                    id: c.contentId,
                                    role: "tooltip",
                                    children: o || n
                                })
                            })]
                        }))
                    })
                });
            cA.displayName = cx;
            var c_ = "TooltipArrow",
                cD = S.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = ct(e, ["__scopeTooltip"]),
                        o = cl(r);
                    return cN(c_, r).isInside ? null : (0, w.jsx)(l$, ce(l9({}, o, n), {
                        ref: t
                    }))
                });

            function ck(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cM(e) {
                var t, r = e.position,
                    n = e.hasBeak,
                    o = e.title,
                    i = e.description,
                    a = e.ariaLabel,
                    l = e.delayDurationMs,
                    c = e.children,
                    u = e.open,
                    s = e.onOpenChange,
                    f = e.contentClassName,
                    p = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = r.split("-")) || function(e) {
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
                            if ("string" == typeof e) return ck(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ck(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    d = p[0],
                    y = p[1],
                    h = null != a ? a : "string" == typeof o && null == i ? o : void 0;
                return S.createElement(cd, {
                    delayDuration: void 0 === l ? 500 : l
                }, S.createElement(cv, {
                    open: u,
                    onOpenChange: s
                }, c, S.createElement(cP, null, S.createElement(cA, {
                    side: d,
                    align: y,
                    "aria-label": h,
                    className: tu("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", f),
                    sideOffset: 5
                }, (void 0 === n || n) && S.createElement(cD, {
                    asChild: !0
                }, S.createElement(iy, {
                    className: "content-[var(--inverse-surface-0)]"
                })), S.createElement("div", {
                    className: "flex flex-col text-truncate-split"
                }, S.createElement("div", {
                    className: "text-caption-medium content-inverse-default"
                }, o), i && S.createElement("div", {
                    className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
                }, i))))))
            }

            function cB(e) {
                var t = e.children,
                    r = e.asChild,
                    n = e.className;
                return S.createElement(cO, {
                    asChild: r,
                    className: n
                }, t)
            }
            cD.displayName = c_;
            var cL = function(e) {
                    var t = e.title,
                        r = e.description,
                        n = e.position;
                    return P().createElement(cM, {
                        position: void 0 === n ? "top-center" : n,
                        title: t,
                        description: r
                    }, P().createElement(cB, {
                        asChild: !0
                    }, P().createElement("span", {
                        role: "button",
                        tabIndex: 0,
                        "aria-label": t,
                        className: "flex items-center content-muted",
                        "data-testid": "label-tooltip-trigger"
                    }, P().createElement(tm, {
                        name: "icon-regular-circle-i",
                        size: "Small"
                    }))))
                },
                cH = {
                    Standard: "bg-none",
                    Contrast: "bg-shift-200",
                    Utility: "bg-none"
                },
                cF = {
                    Standard: "stroke-standard",
                    Contrast: "stroke-none",
                    Utility: "stroke-none"
                };

            function cU(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cG(e) {
                if (Array.isArray(e)) return e
            }

            function cV(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function cK() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function cW(e, t) {
                if (e) {
                    if ("string" == typeof e) return cU(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cU(e, t)
                }
            }
            var cz = {
                    XSmall: "padding-x-small",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-medium"
                },
                cX = {
                    XSmall: "gap-x-xsmall",
                    Small: "gap-x-small",
                    Medium: "gap-x-small",
                    Large: "gap-x-small"
                },
                c$ = {
                    XSmall: "height-600",
                    Small: "height-800",
                    Medium: "height-1000",
                    Large: "height-1200"
                },
                cZ = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                cY = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                cq = {
                    XSmall: ["text-body-small", "placeholder:text-body-small"],
                    Small: ["text-body-small", "placeholder:text-body-small"],
                    Medium: ["text-body-medium", "placeholder:text-body-medium"],
                    Large: ["text-body-large", "placeholder:text-body-large"]
                },
                cJ = (0, S.forwardRef)(function(e, t) {
                    var r, n, o, i = cG(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || cW(r) || cK(),
                        a = i[0],
                        l = i.slice(1),
                        c = a.label,
                        u = a.labelTooltip,
                        s = a.leadingIconName,
                        f = a.trailingIconName,
                        p = a.leadingIconNode,
                        d = a.trailingIconNode,
                        y = a.hasError,
                        h = a.error,
                        b = a.helperText,
                        m = a.size,
                        v = a.variant,
                        g = void 0 === v ? "Standard" : v,
                        O = a.isRequired,
                        w = a.isDisabled,
                        E = a.className,
                        j = a.style,
                        x = a.inputContainerClassName,
                        A = a.inputContainerClassStyle,
                        T = a.id,
                        C = function(e, t) {
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
                        }(a, ["label", "labelTooltip", "leadingIconName", "trailingIconName", "leadingIconNode", "trailingIconNode", "hasError", "error", "helperText", "size", "variant", "isRequired", "isDisabled", "className", "style", "inputContainerClassName", "inputContainerClassStyle", "id"]),
                        I = (cG(l) || function(e) {
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
                        }(l) || cW(l, 1) || cK())[0],
                        N = id(),
                        R = T || N,
                        _ = "".concat(R, "-description"),
                        D = null != m ? m : "Large",
                        k = y || !!h,
                        M = h || b,
                        B = (0, S.useMemo)(function() {
                            return s ? P().createElement(tm, {
                                name: s,
                                size: D,
                                className: "content-emphasis",
                                "data-testid": "text-input-leading-icon"
                            }) : p
                        }, [s, p, D]),
                        L = (0, S.useMemo)(function() {
                            return f ? P().createElement(tm, {
                                name: f,
                                size: D,
                                className: "content-emphasis",
                                "data-testid": "text-input-trailing-icon"
                            }) : d
                        }, [D, f, d]),
                        H = c ? P().createElement("label", {
                            htmlFor: R,
                            className: tu(cY[D], "content-emphasis")
                        }, c, O && P().createElement(P().Fragment, null, " ", P().createElement("span", {
                            className: "content-default"
                        }, "*"))) : null;
                    return P().createElement("div", {
                        "data-testid": "text-input-wrapper",
                        className: tu("flex width-full flex-col gap-small ".concat(E), cV({}, is, w)),
                        style: j
                    }, H && (u ? P().createElement("div", {
                        className: "flex items-center gap-xsmall"
                    }, H, P().createElement(cL, u)) : H), P().createElement("div", {
                        "data-testid": "text-input-container",
                        className: tu("foundation-web-input flex items-center width-full", cF[g], cH[g], x, c$[D], cZ[D], cz[D], cX[D], k ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                        style: A
                    }, B, P().createElement("input", (n = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                cV(e, t, r[t])
                            })
                        }
                        return e
                    }({
                        type: "text",
                        id: R,
                        ref: I,
                        className: tu("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", cq[D]),
                        style: {
                            appearance: "none"
                        },
                        "aria-invalid": k,
                        "aria-describedby": M ? _ : void 0,
                        required: O
                    }, C), o = o = {
                        disabled: w
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(o)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                    }), n)), L), M && P().createElement("span", {
                        id: _,
                        className: tu("text-caption-small", {
                            "content-system-alert": k,
                            "content-default": !k
                        })
                    }, M))
                });
            cJ.displayName = "TextInput";
            var cQ = function(e) {
                var t = e.width,
                    r = e.height;
                return P().createElement("svg", {
                    className: "foundation-web-loading-spinner",
                    width: t,
                    height: r,
                    viewBox: "0 0 20 20",
                    fill: "none",
                    xmlns: "http://www.w3.org/2000/svg"
                }, P().createElement("path", {
                    fillRule: "evenodd",
                    clipRule: "evenodd",
                    fill: "currentColor",
                    d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                }))
            };

            function c0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function c1(e) {
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

            function c2(e, t) {
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

            function c3(e, t) {
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

            function c8(e) {
                return function(e) {
                    if (Array.isArray(e)) return c0(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return c0(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return c0(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function c5(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var c6 = Symbol.for("react.lazy"),
                c4 = S[" use ".trim().toString()];

            function c7(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : c5(e)) === "object" && "$$typeof" in e && e.$$typeof === c6 && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : c5(t)) === "object" && null !== t && "then" in t
            }
            var c9 = ((e = S.forwardRef(function(e, t) {
                    var r = e.children,
                        n = c3(e, ["children"]);
                    if (c7(r) && "function" == typeof c4 && (r = c4(r._payload)), S.isValidElement(r)) {
                        var o, i, a, l, c, u = (c = (l = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                            s = function(e, t) {
                                var r = c1({}, t);
                                for (var n in t) ! function(n) {
                                    var o = e[n],
                                        i = t[n];
                                    /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = i.apply(void 0, c8(t));
                                        return o.apply(void 0, c8(t)), n
                                    } : o && (r[n] = o) : "style" === n ? r[n] = c1({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                }(n);
                                return c1({}, e, r)
                            }(n, r.props);
                        return r.type !== S.Fragment && (s.ref = t ? tS(t, u) : u), S.cloneElement(r, s)
                    }
                    return S.Children.count(r) > 1 ? S.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), y = e, (h = S.forwardRef(function(e, t) {
                    var r = e.children,
                        n = c3(e, ["children"]);
                    c7(r) && "function" == typeof c4 && (r = c4(r._payload));
                    var o = S.Children.toArray(r),
                        i = o.find(ut);
                    if (i) {
                        var a = i.props.children,
                            l = o.map(function(e) {
                                return e !== i ? e : S.Children.count(a) > 1 ? S.Children.only(null) : S.isValidElement(a) ? a.props.children : null
                            });
                        return (0, w.jsx)(y, c2(c1({}, n), {
                            ref: t,
                            children: S.isValidElement(a) ? S.cloneElement(a, void 0, l) : null
                        }))
                    }
                    return (0, w.jsx)(y, c2(c1({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), h),
                ue = Symbol("radix.slottable");

            function ut(e) {
                return S.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === ue
            }

            function ur(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function un(e) {
                if (Array.isArray(e)) return e
            }

            function uo() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ui(e) {
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

            function ua(e, t) {
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

            function ul(e, t) {
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

            function uc(e, t) {
                if (e) {
                    if ("string" == typeof e) return ur(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ur(e, t)
                }
            }
            var uu = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                us = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                uf = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                up = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                ud = (0, S.forwardRef)(function(e, t) {
                    var r, n = un(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || uc(r) || uo(),
                        o = n[0],
                        i = n.slice(1),
                        a = o.children,
                        l = o.className,
                        c = o.style,
                        u = o.isDisabled,
                        s = void 0 !== u && u,
                        f = o.isLoading,
                        p = void 0 !== f && f,
                        d = o.icon,
                        y = o.size,
                        h = void 0 === y ? "Large" : y,
                        b = o.variant,
                        m = void 0 === b ? "Emphasis" : b,
                        v = o.asChild,
                        g = ul(o, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        O = (un(i) || function(e) {
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
                        }(i) || uc(i, 1) || uo())[0],
                        w = tu("foundation-web-button", s ? is : [ts, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", us[h], s ? up[m] : uf[m], l),
                        E = ui({
                            textDecoration: "none"
                        }, c),
                        j = function(e) {
                            return P().createElement(P().Fragment, null, P().createElement(tf, null), p && P().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, P().createElement(cQ, {
                                width: uu[h],
                                height: uu[h]
                            })), P().createElement("span", {
                                className: tu("flex items-center min-width-0", "Large" === h || "Medium" === h ? "gap-small" : "gap-xsmall", p && "invisible")
                            }, d && P().createElement(tm, {
                                name: d,
                                size: h
                            }), P().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (v) {
                        g.as;
                        var S = ul(g, ["as"]),
                            x = P().Children.only(a);
                        return P().createElement(c9, ua(ui({
                            ref: O
                        }, S), {
                            className: w,
                            style: E,
                            "aria-disabled": s || void 0
                        }), P().cloneElement(x, {}, j(x.props.children)))
                    }
                    if ("a" === g.as) {
                        g.as;
                        var A = g.href,
                            T = ul(g, ["as", "href"]);
                        return P().createElement("a", ua(ui({
                            ref: O
                        }, T), {
                            "aria-disabled": s,
                            href: s ? void 0 : A,
                            className: w,
                            style: E
                        }), j(a))
                    }
                    g.as;
                    var C = ul(g, ["as"]);
                    return P().createElement("button", ua(ui({
                        ref: O,
                        type: "button"
                    }, C), {
                        disabled: s,
                        className: w,
                        style: E
                    }), j(a))
                }),
                uy = function(e) {
                    return RegExp("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$").test(e)
                },
                uh = window.Roblox["core-scripts"].eventStream;

            function ub(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var um = function(e) {
                    var t = e.ctx,
                        r = e.field,
                        n = e.origin,
                        o = e.entered,
                        i = e.state,
                        a = {};
                    a.field = r, o && (a.entered = o), i && (a.state = i), n && (a.origin = n), (0, uh.sendEventWithTarget)(oD, t, a)
                },
                uv = function(e) {
                    var t;
                    return (ub(t = {}, oG, oU), ub(t, oF, oU), ub(t, oL, oH), t)[e] || e
                },
                ug = function(e) {
                    var t = e.ctx,
                        r = e.field,
                        n = e.btn,
                        o = e.aType,
                        i = e.errorCode,
                        a = e.origin,
                        l = {};
                    l.field = r, n && (l.btn = n), o && (l.aType = o), i && (l.errorCode = i), a && (l.origin = a), (0, uh.sendEventWithTarget)(uh.eventTypes.formInteraction, t, l)
                },
                uO = function(e) {
                    ug({
                        ctx: oL,
                        field: oW,
                        origin: e
                    }), um({
                        ctx: oH,
                        field: oW,
                        origin: e
                    })
                },
                uw = function(e) {
                    ug({
                        ctx: oF,
                        field: oX,
                        origin: e
                    }), um({
                        ctx: oU,
                        field: oz,
                        origin: e
                    })
                },
                uE = function(e, t, r) {
                    ug({
                        ctx: e,
                        field: o$,
                        aType: oV,
                        errorCode: t,
                        origin: r
                    }), (0, uh.sendEventWithTarget)(oM, uv(e), {
                        field: e === oF ? oZ : o$,
                        errorCode: t,
                        origin: r
                    })
                },
                uj = function(e, t, r) {
                    (0, uh.sendEventWithTarget)(uh.eventTypes.buttonClick, e, {
                        btn: t,
                        origin: r
                    }), (0, uh.sendEventWithTarget)(ok, uv(e), {
                        btn: t,
                        origin: r
                    })
                },
                uS = function(e, t, r, n) {
                    (0, uh.sendEventWithTarget)(uh.eventTypes.buttonClick, e, {
                        btn: t,
                        field: r ? oY : oq,
                        origin: n
                    })
                },
                uP = function(e, t, r) {
                    (0, uh.sendEventWithTarget)(uh.eventTypes.modalAction, e, {
                        aType: t,
                        origin: r
                    })
                },
                ux = function(e, t) {
                    (0, uh.sendEventWithTarget)(oB, uv(e), {
                        origin: t
                    })
                };

            function uA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uT(e) {
                if (Array.isArray(e)) return e
            }

            function uC() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function uI(e) {
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

            function uN(e, t) {
                if (e) {
                    if ("string" == typeof e) return uA(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uA(e, t)
                }
            }
            var uR = (0, S.forwardRef)(function(e, t) {
                var r, n, o, i = uT(o = [e, t]) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(o) || uN(o) || uC(),
                    a = i[0],
                    l = i.slice(1),
                    c = a.className,
                    u = a.style,
                    s = a.orientation,
                    f = void 0 === s ? "horizontal" : s,
                    p = a.variant,
                    d = void 0 === p ? "Standard" : p,
                    y = function(e, t) {
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
                    h = (uT(l) || function(e) {
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
                    }(l) || uN(l, 1) || uC())[0],
                    b = "vertical" === f,
                    m = {};
                return b || "Inset" !== d ? b || "InsetLeft" !== d ? b || "InsetRight" !== d || (m = {
                    marginRight: "var(--padding-xlarge)"
                }) : m = {
                    marginLeft: "var(--padding-xlarge)"
                } : m = {
                    marginLeft: "var(--padding-xlarge)",
                    marginRight: "var(--padding-xlarge)"
                }, P().createElement("div", (r = uI({
                    ref: h
                }, y), n = n = {
                    role: "separator",
                    "data-orientation": f,
                    "aria-orientation": f,
                    style: uI({
                        borderRightWidth: 0,
                        borderBottomWidth: 0,
                        boxSizing: "border-box",
                        borderStyle: "solid"
                    }, b ? {
                        height: "100%",
                        width: 0,
                        borderLeftWidth: "var(--stroke-standard)",
                        borderTopWidth: 0
                    } : "Thick" === d ? {
                        height: "var(--size-250)",
                        borderTop: "var(--stroke-standard)",
                        borderLeftWidth: 0,
                        background: "var(--color-common-heavydivider, rgba(0, 0, 0, 0.50))"
                    } : {
                        height: 0,
                        borderTopWidth: "var(--stroke-standard)",
                        borderLeftWidth: 0
                    }, m, u),
                    className: tu("stroke-default self-stretch", c)
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
            uR.displayName = "Divider";
            var u_ = function(e) {
                var t = e.titleText,
                    r = e.onClose,
                    n = e.className,
                    o = e.closeClassName,
                    i = e.titleClassName,
                    a = o_("CommonUI.Controls");
                return (0, w.jsxs)(P().Fragment, {
                    children: [(0, w.jsxs)("div", {
                        className: "".concat(void 0 === n ? "" : n, " grid [grid-template-columns:minmax(var(--size-600),1fr)_minmax(0,auto)_minmax(var(--size-600),1fr)] items-center gap-small padding-x-large padding-y-small"),
                        children: [(0, w.jsx)("button", {
                            type: "button",
                            className: "".concat(void 0 === o ? "" : o, " justify-self-start flex bg-none stroke-none padding-none"),
                            "aria-label": a("Action.Close"),
                            onClick: r,
                            children: (0, w.jsx)(tm, {
                                name: "icon-regular-x",
                                size: "Large"
                            })
                        }), (0, w.jsx)(nV, {
                            className: "".concat(void 0 === i ? "text-title-large medium:text-heading-small" : i, " text-align-x-center"),
                            children: t
                        }), (0, w.jsx)("div", {})]
                    }), (0, w.jsx)(uR, {})]
                })
            };

            function uD(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uk(e, t) {
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
                        if ("string" == typeof e) return uD(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uD(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var uM = function(e) {
                var t = e.origin,
                    r = e.titleText,
                    n = e.descriptionText,
                    o = e.onSendCode,
                    i = e.errorMessage,
                    a = e.onClose,
                    l = o_("Authentication.Login"),
                    c = iu(),
                    u = c.state.email,
                    s = c.dispatch,
                    f = uk((0, S.useState)(!0), 2),
                    p = f[0],
                    d = f[1],
                    y = uk((0, S.useState)(!1), 2),
                    h = y[0],
                    b = y[1],
                    m = oL,
                    v = nK(u, 200),
                    g = function(e) {
                        s({
                            type: io.SET_EMAIL,
                            email: e
                        })
                    },
                    O = function() {
                        b(!0), uj(m, oQ, t), o()
                    };
                return (0, S.useEffect)(function() {
                    p && u.length > 0 && (d(!1), uO(t)), !uy(v) && v.length > 0 ? s({
                        type: io.SET_ERROR,
                        errorMessage: l("Response.InvalidEmail")
                    }) : s({
                        type: io.SET_ERROR,
                        errorMessage: ""
                    })
                }, [v]), (0, S.useEffect)(function() {
                    i && b(!1)
                }, [i]), (0, S.useEffect)(function() {
                    uP(m, oV, t), ux(m, t)
                }, []), (0, w.jsxs)(S.Fragment, {
                    children: [(0, w.jsx)(u_, {
                        className: "email-verify-code-header",
                        closeClassName: "email-verify-code-close",
                        titleText: r,
                        onClose: function() {
                            uj(m, oJ, t), uP(m, oK, t), a()
                        }
                    }), (0, w.jsxs)(nG, {
                        className: "email-verify-code-body padding-top-medium",
                        children: [(0, w.jsx)("p", {
                            className: "email-verify-code-help-text text-body-small medium:text-body-large",
                            children: n
                        }), (0, w.jsx)(cJ, {
                            "aria-label": l(o7),
                            placeholder: l(o7),
                            onChange: function(e) {
                                return g(e.target.value)
                            },
                            type: "email",
                            autoFocus: !0,
                            size: "Medium",
                            autoComplete: "email",
                            maxLength: 320,
                            onKeyPress: function(e) {
                                "Enter" === e.key && uy(u) && !h && O()
                            },
                            value: u,
                            hasError: "" !== i
                        }), (0, w.jsx)("div", {
                            className: "email-verify-code-error-text text-body-small content-system-alert",
                            children: i
                        }), (0, w.jsx)(ud, {
                            className: "email-verify-code-button width-full !text-label-large",
                            variant: "Standard",
                            size: "Small",
                            isDisabled: h || !uy(u),
                            onClick: O,
                            children: l("Action.SendCode")
                        })]
                    })]
                })
            };

            function uB(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uL(e) {
                if (Array.isArray(e)) return e
            }

            function uH() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function uF(e) {
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

            function uU(e, t) {
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

            function uG(e, t) {
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

            function uV(e, t) {
                if (e) {
                    if ("string" == typeof e) return uB(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uB(e, t)
                }
            }
            var uK = new Set(["_self", "_parent", "_top"]),
                uW = {
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                uz = {
                    Standard: "content-emphasis",
                    Emphasis: "content-emphasis",
                    Inverse: "content-inverse-default"
                },
                uX = (0, S.forwardRef)(function(e, t) {
                    var r, n, o, i, a = uL(o = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(o) || uV(o) || uH(),
                        l = a[0],
                        c = a.slice(1),
                        u = l.children,
                        s = l.className,
                        f = l.size,
                        p = l.color,
                        d = l.variant,
                        y = l.underline,
                        h = void 0 === y ? "hover" : y,
                        b = l.isExternal,
                        m = l.asChild,
                        v = uG(l, ["children", "className", "size", "color", "variant", "underline", "isExternal", "asChild"]),
                        g = (uL(c) || function(e) {
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
                        }(c) || uV(c, 1) || uH())[0],
                        O = (r = null != (i = v.as) ? i : "a", n = "button" === v.as ? void 0 : v.target, void 0 !== b ? b : "button" !== r && void 0 !== n && !uK.has(n)),
                        w = tu("foundation-web-link", "button" === v.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === (void 0 === d ? "Standalone" : d) || O) && "inline-flex items-center gap-xsmall", void 0 !== f && uW[f], uz[void 0 === p ? "Emphasis" : p], "always" === h ? "underline" : "no-underline", "hover" === h && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", s),
                        E = O ? P().createElement("span", {
                            "aria-hidden": !0,
                            "data-testid": "foundation-web-icon",
                            className: tu("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
                        }) : null;
                    if (m) {
                        v.as;
                        var j = uG(v, ["as"]),
                            S = P().Children.only(u);
                        return P().isValidElement(S) ? P().createElement(c9, uU(uF({
                            ref: g
                        }, j), {
                            className: w
                        }), P().cloneElement(S, {}, P().createElement(P().Fragment, null, S.props.children, E))) : null
                    }
                    if ("button" === v.as) {
                        v.as;
                        var x = v.type,
                            A = uG(v, ["as", "type"]);
                        return P().createElement("button", uU(uF({
                            ref: g,
                            type: null != x ? x : "button"
                        }, A), {
                            className: w
                        }), u, E)
                    }
                    v.as;
                    var T = uG(v, ["as"]);
                    return P().createElement("a", uU(uF({
                        ref: g
                    }, T), {
                        className: w
                    }), u, E)
                });
            uX.displayName = "Link";
            var u$ = function(e) {
                var t = e.id,
                    r = e.legalText,
                    n = e.isChecked,
                    o = e.disabled,
                    i = e.onCheckBoxChanged;
                return (0, w.jsx)("div", {
                    className: "legal-text-container",
                    children: (0, w.jsxs)("div", {
                        className: "terms-agreement terms-agreement-checkbox",
                        children: [(0, w.jsx)("input", {
                            id: t,
                            className: "checkbox",
                            type: "checkbox",
                            checked: void 0 !== n && n,
                            onChange: i,
                            disabled: void 0 !== o && o
                        }), (0, w.jsx)("label", {
                            htmlFor: t,
                            dangerouslySetInnerHTML: {
                                __html: r
                            }
                        })]
                    })
                })
            };

            function uZ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uY(e, t) {
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
                        if ("string" == typeof e) return uZ(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uZ(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var uq = function(e) {
                    var t = e.origin,
                        r = e.titleText,
                        n = e.descriptionText,
                        o = e.legalCheckboxLabel,
                        i = e.code,
                        a = e.codeLength,
                        l = e.isCheckboxEnabled,
                        c = e.isContinueButtonEnabled,
                        u = e.onContinueButtonPressed,
                        s = e.onResendCode,
                        f = e.onClose,
                        p = e.isChangeEmailEnabled,
                        d = o_("Authentication.OneTimePasscode"),
                        y = iu(),
                        h = y.state,
                        b = h.email,
                        m = h.isChecked,
                        v = h.isLoading,
                        g = h.errorMessage,
                        O = y.dispatch,
                        E = uY((0, S.useState)(!0), 2),
                        j = E[0],
                        P = E[1],
                        x = uY((0, S.useState)(0), 2),
                        A = x[0],
                        T = x[1],
                        C = uY((0, S.useState)(!0), 2),
                        I = C[0],
                        N = C[1],
                        R = nK(i, 200),
                        _ = oF,
                        D = function() {
                            if (P(!1), 0 === A) var e = setInterval(function() {
                                T(function(t) {
                                    return 1 === t && (clearInterval(e), P(!0)), t - 1
                                })
                            }, 1e3);
                            T(30)
                        },
                        k = function() {
                            uj(_, o0, t), s(), D()
                        },
                        M = function(e) {
                            O({
                                type: io.SET_ERROR,
                                errorMessage: ""
                            });
                            var t = e.replace(/\D/g, "");
                            O({
                                type: io.SET_OTP_CODE,
                                code: t
                            })
                        },
                        B = function(e) {
                            O({
                                type: io.SET_LEGAL_CHECK,
                                isChecked: e.target.checked
                            }), uS(_, o5, e.target.checked, t)
                        };
                    (0, S.useEffect)(function() {
                        I && i.length > 0 && (N(!1), uw(t))
                    }, [R]);
                    var L = (0, w.jsx)("div", {
                        className: "email-verify-code-help-text text-body-small medium:text-body-large",
                        dangerouslySetInnerHTML: {
                            __html: "<p className='email-verify-code-help-text'>".concat(d("Description.EnterCodeHelpV3", {
                                email: "<b>".concat(b, "</b>")
                            }), "</p>")
                        }
                    });
                    return (0, S.useEffect)(function() {
                        uP(_, oV, t), ux(_, t), D()
                    }, []), (0, w.jsxs)(S.Fragment, {
                        children: [(0, w.jsx)(u_, {
                            className: "email-verify-code-header",
                            closeClassName: "email-verify-code-close",
                            titleText: r,
                            onClose: function() {
                                uj(_, oJ, t), uP(_, oK, t), f()
                            }
                        }), (0, w.jsxs)(nG, {
                            className: "email-verify-code-body padding-top-medium",
                            children: [p ? (0, w.jsxs)(S.Fragment, {
                                children: [L, (0, w.jsx)("div", {
                                    className: "email-verify-code-email-display",
                                    children: (0, w.jsx)("button", {
                                        className: "email-verify-code-change-email-link text-link",
                                        type: "button",
                                        onClick: function() {
                                            O({
                                                type: io.SET_ENTER_EMAIL_PAGE
                                            }), uj(_, o8, t)
                                        },
                                        children: d("Action.ChangeEmail")
                                    })
                                })]
                            }) : (0, w.jsx)("p", {
                                className: "email-verify-code-help-text text-body-small medium:text-body-large",
                                children: n
                            }), (0, w.jsx)(cJ, {
                                "aria-label": d(o9),
                                placeholder: d(o9),
                                onChange: function(e) {
                                    return M(e.target.value)
                                },
                                type: "text",
                                inputMode: "numeric",
                                maxLength: a,
                                autoFocus: !0,
                                size: "Medium",
                                value: i,
                                isDisabled: v,
                                hasError: "" !== g
                            }), (0, w.jsx)("div", {
                                className: "email-verify-code-error-text text-body-small content-system-alert",
                                children: g
                            }), (0, w.jsx)(function() {
                                return o ? (0, w.jsx)("div", {
                                    className: "legal-checkbox-container",
                                    children: (0, w.jsx)(u$, {
                                        id: "parent-consent",
                                        legalText: o,
                                        isChecked: m,
                                        disabled: !l,
                                        onCheckBoxChanged: B
                                    })
                                }) : null
                            }, {}), (0, w.jsx)(function() {
                                return o ? (0, w.jsx)(ud, {
                                    className: "email-verify-code-button width-full !text-label-large",
                                    variant: "Emphasis",
                                    size: "Small",
                                    onClick: u,
                                    isDisabled: !c,
                                    children: d("Action.Continue")
                                }) : null
                            }, {}), (0, w.jsx)(function() {
                                return (0, w.jsx)(ud, {
                                    className: "email-verify-code-button width-full !text-label-large",
                                    variant: "Standard",
                                    size: "Small",
                                    onClick: k,
                                    isDisabled: !j,
                                    isLoading: v,
                                    children: j ? d("Action.Resend") : "".concat(d("Label.CodeSent"), " (").concat(A, ")")
                                })
                            }, {}), (0, w.jsx)(function() {
                                return o ? null : (0, w.jsx)("div", {
                                    className: "email-verify-code-help-link text-align-x-center",
                                    children: (0, w.jsx)(uX, {
                                        size: "Small",
                                        href: "https://en.help.roblox.com/hc/articles/11014749736980",
                                        target: "_blank",
                                        rel: "noreferrer",
                                        children: d("Action.DidntReceiveCode")
                                    })
                                })
                            }, {})]
                        })]
                    })
                },
                uJ = window.Roblox["core-scripts"].http.http,
                uQ = window.Roblox["core-lib"].http.index,
                u0 = window.Roblox["core-lib"].url.index;

            function u1(e, t, r) {
                return (u1 = u4() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && u5(o, r.prototype), o
                }).apply(null, arguments)
            }

            function u2(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function u3(e) {
                return (u3 = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function u8(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function u5(e, t) {
                return (u5 = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function u6(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (u6 = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return u1(e, arguments, u3(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), u5(r, e)
                })(e)
            }

            function u4() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (u4 = function() {
                    return !!e
                })()
            }
            var u7 = function(e) {
                    return function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                u2(e, t, r[t])
                            })
                        }
                        return e
                    }({
                        includeBodyOnError: !0
                    }, e.withCredentials ? {
                        credentials: "include"
                    } : {})
                },
                u9 = function(e) {
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function t(e, r, n) {
                        var o, i, a;
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        return i = t, a = ["Request failed with status ".concat(e), n], i = u3(i), u2(o = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, u4() ? Reflect.construct(i, a || [], u3(this).constructor) : i.apply(this, a)), "status", void 0), u2(o, "data", void 0), o.status = e, o.data = r, o
                    }
                    return t.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: t,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && u5(t, e), t
                }(u6(Error)),
                se = function(e) {
                    if (u8(e, uQ.HttpError)) {
                        var t = e.response,
                            r = t.status,
                            n = t.body,
                            o = n;
                        if ("string" == typeof n) try {
                            o = JSON.parse(n)
                        } catch (e) {
                            o = n
                        }
                        return new u9(r, o, {
                            cause: e
                        })
                    }
                    return u8(e, Error) ? e : Error(String(e), {
                        cause: e
                    })
                },
                st = "true" === r(773).env.NEXT_PUBLIC_IS_NEXTJS ? {
                    get: function(e) {
                        return Promise.resolve().then(function() {
                            return uQ.getUntyped(u0.Url.parse(e.url).getOrThrow(), u7(e)).getOrThrow()
                        }).catch(function(e) {
                            throw se(e)
                        })
                    },
                    post: function(e, t) {
                        var r = null != t ? t : {};
                        return Promise.resolve().then(function() {
                            return uQ.postUntyped(u0.Url.parse(e.url).getOrThrow(), r, u7(e)).getOrThrow()
                        }).catch(function(e) {
                            throw se(e)
                        })
                    }
                } : {
                    get: function(e) {
                        return uJ.get(e).then(function(e) {
                            return e.data
                        })
                    },
                    post: function(e, t) {
                        return uJ.post(e, t).then(function(e) {
                            return e.data
                        })
                    }
                },
                sr = function(e) {
                    return "".concat(n1.EnvironmentUrls.apiGatewayUrl, "/otp-service/v1/").concat(e)
                },
                sn = function(e) {
                    var t = sr("sendCode");
                    return st.post({
                        url: t,
                        withCredentials: !0
                    }, e)
                },
                so = function(e) {
                    var t = sr("resendCode");
                    return st.post({
                        url: t,
                        withCredentials: !0
                    }, e)
                },
                si = function(e) {
                    var t = sr("validateCode");
                    return st.post({
                        url: t,
                        withCredentials: !0
                    }, e)
                };

            function sa(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function sl(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            sa(i, n, o, a, l, "next", e)
                        }

                        function l(e) {
                            sa(i, n, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function sc(e, t) {
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
                    value: c(0)
                }), l(a, "throw", {
                    value: c(1)
                }), l(a, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function c(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < o[1]) {
                                        i.label = o[1], o = u;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(u);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = t.call(e, i)
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
            var su = function(e) {
                    return e.preventDefault()
                },
                ss = function(e) {
                    e.containerId;
                    var t, r, n = e.codeLength,
                        o = e.onEmailCodeEntered,
                        i = e.onComplete,
                        a = e.onModalAbandoned,
                        l = e.enterEmailTitle,
                        c = e.enterEmailDescription,
                        u = e.enterCodeTitle,
                        s = e.enterCodeDescription,
                        f = e.legalCheckboxLabel,
                        p = e.origin,
                        d = e.isChangeEmailEnabled,
                        y = e.renderInWebview,
                        h = o_("Authentication.Login"),
                        b = iu(),
                        m = b.state,
                        v = m.emailVerifyCodeModalPage,
                        g = m.email,
                        O = m.sessionToken,
                        E = m.code,
                        j = m.isChecked,
                        P = m.isCheckboxEnabled,
                        x = m.isLoading,
                        A = m.isCodeValid,
                        T = m.errorMessage,
                        C = m.isModalOpen,
                        I = m.isContinueButtonEnabled,
                        N = b.dispatch,
                        R = nK(E, 200);
                    (0, S.useEffect)(function() {
                        o && !f && R.length === n ? (M(), N({
                            type: io.SET_LOADING,
                            isLoading: !0
                        }), uj(oF, o1, p)) : f && N({
                            type: io.SET_CHECKBOX_AND_CONTINUE_BUTTON_STATE,
                            isContinueButtonEnabled: R.length === n && j,
                            isCheckboxEnabled: R.length === n
                        })
                    }, [R, j]), (0, S.useEffect)(function() {
                        f && i && A ? (N({
                            type: io.CLOSE_MODAL
                        }), uP(oF, oK, p), uj(oF, o2, p), i({
                            otpSessionToken: O,
                            otpContactType: it
                        })) : A && o && (N({
                            type: io.CLOSE_MODAL
                        }), o(O, R))
                    }, [A]), (0, S.useEffect)(function() {
                        var e = function(e) {
                            if (e.detail) {
                                if (e.detail.shouldCloseModal) return void _();
                                N({
                                    type: io.SET_ERROR,
                                    errorMessage: e.detail.errorMessage
                                })
                            }
                            N({
                                type: io.SET_OTP_CODE,
                                code: ""
                            }), N({
                                type: io.SET_LOADING,
                                isLoading: !1
                            })
                        };
                        return window.addEventListener("onEnterEmailVerifyCodeError", e),
                            function() {
                                window.removeEventListener("onEnterEmailVerifyCodeError", e)
                            }
                    }, []), (0, S.useEffect)(function() {
                        window.addEventListener("closeEmailVerifyCodeModal", _)
                    }, []);
                    var _ = function() {
                            a(), N({
                                type: io.CLOSE_MODAL
                            })
                        },
                        D = function(e, t) {
                            var r = e.data,
                                n = e.status;
                            if (N({
                                    type: io.SET_LOADING,
                                    isLoading: !1
                                }), 6 === r) {
                                N({
                                    type: io.SET_ERROR,
                                    errorMessage: h(ie)
                                }), uE(t, String(r), p);
                                return
                            }
                            if (8 === r) {
                                N({
                                    type: io.SET_ERROR,
                                    errorMessage: h("Response.ErrorUseCorporateNetwork")
                                }), uE(t, String(r), p);
                                return
                            }
                            if (2 === r) {
                                N({
                                    type: io.SET_ERROR,
                                    errorMessage: h("Response.IncorrectOtpCode")
                                }), uE(t, String(r), p);
                                return
                            }
                            if (429 === n) {
                                N({
                                    type: io.SET_ERROR,
                                    errorMessage: h(ie)
                                }), uE(t, String(n), p);
                                return
                            }
                            if (3 === r) {
                                uE(t, String(r), p), k();
                                return
                            }
                            uE(t, String(r), p), N({
                                type: io.SET_ERROR,
                                errorMessage: h("Response.UnknownError")
                            })
                        },
                        k = function() {
                            return sl(function() {
                                var e, t;
                                return sc(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            return r.trys.push([0, 2, , 3]), [4, sn({
                                                origin: p,
                                                contactType: it,
                                                contactValue: g
                                            })];
                                        case 1:
                                            return t = r.sent(), N({
                                                type: io.SET_SESSION_TOKEN,
                                                sessionToken: null != (e = null == t ? void 0 : t.otpSessionToken) ? e : ""
                                            }), N({
                                                type: io.SET_ERROR,
                                                errorMessage: ""
                                            }), N({
                                                type: io.SET_ENTER_CODE_PAGE
                                            }), [3, 3];
                                        case 2:
                                            return D(r.sent(), oL), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        M = function() {
                            return sl(function() {
                                return sc(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return e.trys.push([0, 2, , 3]), [4, si({
                                                passCode: R,
                                                otpSessionToken: O,
                                                contactType: it,
                                                origin: p
                                            })];
                                        case 1:
                                            return e.sent(), N({
                                                type: io.SET_CODE_VALID,
                                                isCodeValid: !0
                                            }), [3, 3];
                                        case 2:
                                            return D(e.sent(), oG), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            })()
                        };
                    return (0, w.jsx)(nF, {
                        open: C,
                        onOpenChange: function(e) {
                            e || _()
                        },
                        size: "Large",
                        isModal: !0,
                        hasMarginTop: !1,
                        hasCloseAffordance: !1,
                        experimentalDisablePointerEventsStylingOnBody: !0,
                        children: (0, w.jsxs)(nU, (t = function(e) {
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
                            className: "email-verify-code-dialog".concat(y ? " email-verify-code-webview" : ""),
                            overlayClassName: y ? "email-verify-code-webview-overlay" : void 0
                        }, {
                            onPointerDownOutside: su,
                            onInteractOutside: su
                        }), r = r = {
                            children: [v === o6 && (0, w.jsx)(uM, {
                                origin: p,
                                titleText: l,
                                descriptionText: c,
                                onSendCode: k,
                                errorMessage: T,
                                onClose: _
                            }), v === o4 && O && (0, w.jsx)(uq, {
                                origin: p,
                                titleText: u,
                                descriptionText: s,
                                legalCheckboxLabel: f,
                                code: E,
                                codeLength: n,
                                onContinueButtonPressed: function() {
                                    I && (uj(oF, o3, p), M())
                                },
                                onResendCode: function() {
                                    return sl(function() {
                                        var e, t;
                                        return sc(this, function(r) {
                                            switch (r.label) {
                                                case 0:
                                                    return r.trys.push([0, 2, , 3]), [4, so({
                                                        contactType: it,
                                                        origin: p,
                                                        otpSessionToken: O
                                                    })];
                                                case 1:
                                                    return t = r.sent(), N({
                                                        type: io.SET_SESSION_TOKEN,
                                                        sessionToken: null != (e = null == t ? void 0 : t.otpSessionToken) ? e : ""
                                                    }), N({
                                                        type: io.SET_ERROR,
                                                        errorMessage: ""
                                                    }), [3, 3];
                                                case 2:
                                                    return D(r.sent(), oF), [3, 3];
                                                case 3:
                                                    return [2]
                                            }
                                        })
                                    })()
                                },
                                isLoading: x,
                                isContinueButtonEnabled: I,
                                isCheckboxEnabled: P,
                                isChecked: j,
                                errorMessage: T,
                                onClose: _,
                                isChangeEmailEnabled: void 0 !== d && d
                            })]
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
                    })
                },
                sf = ["Authentication.Login", "Authentication.OneTimePasscode", "CommonUI.Controls"];
            Object.assign(j(), {
                EmailVerifyCodeModalService: {
                    renderEmailVerifyCodeModal: function(e) {
                        var t = e.containerId,
                            r = e.codeLength,
                            n = e.onEmailCodeEntered,
                            o = e.onComplete,
                            i = e.onModalAbandoned,
                            a = e.enterEmailTitle,
                            l = e.enterEmailDescription,
                            c = e.enterCodeTitle,
                            u = e.enterCodeDescription,
                            s = e.legalCheckboxLabel,
                            f = e.origin,
                            p = e.translate,
                            d = e.isChangeEmailEnabled,
                            y = e.renderInWebview,
                            h = document.getElementById(t);
                        return null != h && ((0, x.unmountComponentAtNode)(h), (0, x.render)((0, w.jsx)(tc, {
                            namespaces: sf,
                            children: (0, w.jsx)(ic, {
                                children: (0, w.jsx)(ss, {
                                    containerId: t,
                                    codeLength: r,
                                    onEmailCodeEntered: n,
                                    onModalAbandoned: i,
                                    legalCheckboxLabel: s,
                                    onComplete: o,
                                    enterEmailTitle: a,
                                    enterEmailDescription: l,
                                    enterCodeTitle: c,
                                    enterCodeDescription: u,
                                    origin: f,
                                    translate: p,
                                    isChangeEmailEnabled: d,
                                    renderInWebview: y
                                })
                            })
                        }), h), !0)
                    }
                }
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "EmailVerifyCodeModal");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/emailVerifyCodeModal-bb2e252a964524bf.js.map