! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "05b4db0559eb53d1bdbef7f795bf7363c1ed326b"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "4011b6be-c3b1-48dd-839d-a969cb587848", e._sentryDebugIdIdentifier = "sentry-dbid-4011b6be-c3b1-48dd-839d-a969cb587848")
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

                function y(e, t) {
                    this.fun = e, this.array = t
                }

                function m() {}

                function b() {}
                a.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var r = 1; r < arguments.length; r++) t[r - 1] = arguments[r];
                    s.push(new y(e, t)), 1 !== s.length || f || c(h)
                }, y.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, a.title = "browser", a.browser = !0, a.env = {}, a.argv = [], a.version = "", a.versions = {}, a.on = m, a.addListener = m, a.once = m, a.off = m, a.removeListener = m, a.removeAllListeners = m, a.emit = m, a.prependListener = m, a.prependOnceListener = m, a.listeners = function(e) {
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
                    S = "browser",
                    E = "browser",
                    A = [],
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
                        features: O,
                        kill: b,
                        dlopen: b,
                        uptime: b,
                        memoryUsage: b,
                        uvCounters: b,
                        platform: w,
                        arch: S,
                        execPath: E,
                        execArgv: A
                    };
                t.addListener = i.exports.addListener, t.arch = S, t.argv = i.exports.argv, t.binding = g, t.browser = v, t.chdir = i.exports.chdir, t.cwd = i.exports.cwd, t.default = P, t.dlopen = b, t.emit = i.exports.emit, t.emitWarning = b, t.env = i.exports.env, t.execArgv = A, t.execPath = E, t.exit = b, t.features = O, t.kill = b, t.listeners = i.exports.listeners, t.memoryUsage = b, t.nextTick = i.exports.nextTick, t.off = i.exports.off, t.on = i.exports.on, t.once = i.exports.once, t.pid = 1, t.platform = w, t.prependListener = i.exports.prependListener, t.prependOnceListener = i.exports.prependOnceListener, t.removeAllListeners = i.exports.removeAllListeners, t.removeListener = i.exports.removeListener, t.title = i.exports.title, t.umask = i.exports.umask, t.uptime = b, t.uvCounters = b, t.version = i.exports.version, t.versions = i.exports.versions, e.exports = P
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
            var e, t, n, o, i, a, l, u, c, s, f, p, d, h, y, m, b, v, g, O, w, S, E, A, P, j, x, T, _, I, C, R, N, D, M, L = {};
            r.r(L), r.d(L, {
                changeForCurrentUser: function() {
                    return fC
                },
                resetSendPrompted: function() {
                    return fR
                },
                validate: function() {
                    return fN
                }
            });
            var k = {};
            r.r(k), r.d(k, {
                getAllForCurrentUser: function() {
                    return fM
                },
                updateForCurrentUser: function() {
                    return fL
                }
            });
            var U = window.ReactJSX,
                B = window.React,
                H = r.n(B),
                F = window.ReactDOM,
                V = r.n(F),
                W = globalThis.window,
                G = globalThis.document,
                Y = void 0 === W ? void 0 : W,
                K = void 0 === G ? void 0 : G,
                z = window.Roblox["core-scripts"].meta.device,
                X = window.Roblox["core-scripts"].util.ready,
                $ = r.n(X);

            function Z(e, t) {
                var r = t && t.cache ? t.cache : et,
                    n = t && t.serializer ? t.serializer : Q;
                return (t && t.strategy ? t.strategy : function(e, t) {
                    var r, n, o = 1 === e.length ? q : J;
                    return r = t.cache.create(), n = t.serializer, o.bind(this, e, r, n)
                })(e, {
                    cache: r,
                    serializer: n
                })
            }

            function q(e, t, r, n) {
                var o = null == n || "number" == typeof n || "boolean" == typeof n ? n : r(n),
                    i = t.get(o);
                return void 0 === i && (i = e.call(this, n), t.set(o, i)), i
            }

            function J(e, t, r) {
                var n = Array.prototype.slice.call(arguments, 3),
                    o = r(n),
                    i = t.get(o);
                return void 0 === i && (i = e.apply(this, n), t.set(o, i)), i
            }
            var Q = function() {
                    return JSON.stringify(arguments)
                },
                ee = function() {
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
                et = {
                    create: function() {
                        return new ee
                    }
                },
                er = {
                    variadic: function(e, t) {
                        var r, n;
                        return r = t.cache.create(), n = t.serializer, J.bind(this, e, r, n)
                    },
                    monadic: function(e, t) {
                        var r, n;
                        return r = t.cache.create(), n = t.serializer, q.bind(this, e, r, n)
                    }
                };

            function en(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eo(e, t, r) {
                return (eo = eu() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && ea(o, r.prototype), o
                }).apply(null, arguments)
            }

            function ei(e) {
                return (ei = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function ea(e, t) {
                return (ea = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function el(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (el = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return eo(e, arguments, ei(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), ea(r, e)
                })(e)
            }

            function eu() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (eu = function() {
                    return !!e
                })()
            }
            var ec = function(e) {
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function t(e, r) {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        var n, o, i, a = e;
                        return r && (a += ": " + r), n = t, o = [a], n = ei(n), (i = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, eu() ? Reflect.construct(n, o || [], ei(this).constructor) : n.apply(this, o))).code = e, r && (i.originalMessage = r), i
                    }
                    return t.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: t,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && ea(t, e), t
                }(el(Error)),
                es = ((t = es || {}).MISSING_MESSAGE = "MISSING_MESSAGE", t.MISSING_FORMAT = "MISSING_FORMAT", t.ENVIRONMENT_FALLBACK = "ENVIRONMENT_FALLBACK", t.INSUFFICIENT_PATH = "INSUFFICIENT_PATH", t.INVALID_MESSAGE = "INVALID_MESSAGE", t.INVALID_KEY = "INVALID_KEY", t.FORMATTING_ERROR = "FORMATTING_ERROR", t);

            function ef(e, t) {
                return Z(e, {
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
                    strategy: er.variadic
                })
            }

            function ep(e, t) {
                return ef(function() {
                    for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                    return eo(e, function(e) {
                        if (Array.isArray(e)) return en(e)
                    }(r) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(r) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return en(e, void 0);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return en(e, void 0)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())
                }, t)
            }

            function ed(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eh(e) {
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

            function ey(e, t) {
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
            var em = /(?:[Eec]{1,6}|G{1,5}|[Qq]{1,5}|(?:[yYur]+|U{1,5})|[ML]{1,5}|d{1,2}|D{1,3}|F{1}|[abB]{1,5}|[hkHK]{1,2}|w{1,2}|W{1}|m{1,2}|s{1,2}|[zZOvVxX]{1,4})(?=([^']*'[^']*')*[^']*$)/g,
                eb = /[\t-\r \x85\u200E\u200F\u2028\u2029]/i,
                ev = /^\.(?:(0+)(\*)?|(#+)|(0+)(#+))$/g,
                eg = /^(@+)?(\+|#+)?[rs]?$/g,
                eO = /(\*)(0+)|(#+)(0+)|(0+)/g,
                ew = /^(0+)$/;

            function eS(e) {
                var t = {};
                return "r" === e[e.length - 1] ? t.roundingPriority = "morePrecision" : "s" === e[e.length - 1] && (t.roundingPriority = "lessPrecision"), e.replace(eg, function(e, r, n) {
                    return "string" != typeof n ? (t.minimumSignificantDigits = r.length, t.maximumSignificantDigits = r.length) : "+" === n ? t.minimumSignificantDigits = r.length : "#" === r[0] ? t.maximumSignificantDigits = r.length : (t.minimumSignificantDigits = r.length, t.maximumSignificantDigits = r.length + ("string" == typeof n ? n.length : 0)), ""
                }), t
            }

            function eE(e) {
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

            function eA(e) {
                var t = eE(e);
                return t || {}
            }

            function eP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ej(e) {
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

            function ex(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function eT(e, t) {
                if (e) {
                    if ("string" == typeof e) return eP(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eP(e, t)
                }
            }
            var e_ = ((n = {})[n.EXPECT_ARGUMENT_CLOSING_BRACE = 1] = "EXPECT_ARGUMENT_CLOSING_BRACE", n[n.EMPTY_ARGUMENT = 2] = "EMPTY_ARGUMENT", n[n.MALFORMED_ARGUMENT = 3] = "MALFORMED_ARGUMENT", n[n.EXPECT_ARGUMENT_TYPE = 4] = "EXPECT_ARGUMENT_TYPE", n[n.INVALID_ARGUMENT_TYPE = 5] = "INVALID_ARGUMENT_TYPE", n[n.EXPECT_ARGUMENT_STYLE = 6] = "EXPECT_ARGUMENT_STYLE", n[n.INVALID_NUMBER_SKELETON = 7] = "INVALID_NUMBER_SKELETON", n[n.INVALID_DATE_TIME_SKELETON = 8] = "INVALID_DATE_TIME_SKELETON", n[n.EXPECT_NUMBER_SKELETON = 9] = "EXPECT_NUMBER_SKELETON", n[n.EXPECT_DATE_TIME_SKELETON = 10] = "EXPECT_DATE_TIME_SKELETON", n[n.UNCLOSED_QUOTE_IN_ARGUMENT_STYLE = 11] = "UNCLOSED_QUOTE_IN_ARGUMENT_STYLE", n[n.EXPECT_SELECT_ARGUMENT_OPTIONS = 12] = "EXPECT_SELECT_ARGUMENT_OPTIONS", n[n.EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE = 13] = "EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE", n[n.INVALID_PLURAL_ARGUMENT_OFFSET_VALUE = 14] = "INVALID_PLURAL_ARGUMENT_OFFSET_VALUE", n[n.EXPECT_SELECT_ARGUMENT_SELECTOR = 15] = "EXPECT_SELECT_ARGUMENT_SELECTOR", n[n.EXPECT_PLURAL_ARGUMENT_SELECTOR = 16] = "EXPECT_PLURAL_ARGUMENT_SELECTOR", n[n.EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT = 17] = "EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT", n[n.EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT = 18] = "EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT", n[n.INVALID_PLURAL_ARGUMENT_SELECTOR = 19] = "INVALID_PLURAL_ARGUMENT_SELECTOR", n[n.DUPLICATE_PLURAL_ARGUMENT_SELECTOR = 20] = "DUPLICATE_PLURAL_ARGUMENT_SELECTOR", n[n.DUPLICATE_SELECT_ARGUMENT_SELECTOR = 21] = "DUPLICATE_SELECT_ARGUMENT_SELECTOR", n[n.MISSING_OTHER_CLAUSE = 22] = "MISSING_OTHER_CLAUSE", n[n.INVALID_TAG = 23] = "INVALID_TAG", n[n.INVALID_TAG_NAME = 25] = "INVALID_TAG_NAME", n[n.UNMATCHED_CLOSING_TAG = 26] = "UNMATCHED_CLOSING_TAG", n[n.UNCLOSED_TAG = 27] = "UNCLOSED_TAG", n);

            function eI(e) {
                return !!(e && (void 0 === e ? "undefined" : ex(e)) === "object" && 0 === e.type)
            }

            function eC(e) {
                return !!(e && (void 0 === e ? "undefined" : ex(e)) === "object" && 1 === e.type)
            }
            var eR = /[ \xA0\u1680\u2000-\u200A\u202F\u205F\u3000]/,
                eN = {
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
                eD = new RegExp("^".concat(eR.source, "*")),
                eM = new RegExp("".concat(eR.source, "*$"));

            function eL(e, t) {
                return {
                    start: e,
                    end: t
                }
            }
            var ek = !!Object.fromEntries,
                eU = !!String.prototype.trimStart,
                eB = !!String.prototype.trimEnd,
                eH = ek ? Object.fromEntries : function(e) {
                    var t = {},
                        r = !0,
                        n = !1,
                        o = void 0;
                    try {
                        for (var i, a = e[Symbol.iterator](); !(r = (i = a.next()).done); r = !0) {
                            var l, u = (l = i.value, function(e) {
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
                                }(l) || eT(l, 2) || function() {
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
                            r || null == a.return || a.return()
                        } finally {
                            if (n) throw o
                        }
                    }
                    return t
                },
                eF = eU ? function(e) {
                    return e.trimStart()
                } : function(e) {
                    return e.replace(eD, "")
                },
                eV = eB ? function(e) {
                    return e.trimEnd()
                } : function(e) {
                    return e.replace(eM, "")
                },
                eW = RegExp("([^\\u0009-\\u000D\\u0020\\u0085\\u00A0\\u1680\\u2000-\\u200A\\u2028-\\u2029\\u202F\\u205F\\u3000\\u0021-\\u002F\\u003A-\\u0040\\u005B-\\u005E\\u0060\\u007B-\\u007E\\u00A1-\\u00A7\\u00A9\\u00AB-\\u00AC\\u00AE\\u00B0-\\u00B1\\u00B6\\u00BB\\u00BF\\u00D7\\u00F7\\u2010-\\u2027\\u2030-\\u203E\\u2041-\\u2053\\u2055-\\u205E\\u2190-\\u245F\\u2500-\\u2775\\u2794-\\u2BFF\\u2E00-\\u2E7F\\u3001-\\u3003\\u3008-\\u3020\\u3030\\uFD3E-\\uFD3F\\uFE45-\\uFE46]*)", "yu"),
                eG = function() {
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
                                                    location: eL(r, this.clonePosition())
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
                                            location: eL(a, this.clonePosition())
                                        })
                                    } else if (60 !== o || this.ignoreTag || 47 !== this.peek())
                                        if (60 === o && !this.ignoreTag && eY(this.peek() || 0)) {
                                            var l = this.parseTag(e, t);
                                            if (l.err) return l;
                                            n.push(l.val)
                                        } else {
                                            var u = this.parseLiteral(e, t);
                                            if (u.err) return u;
                                            n.push(u.val)
                                        }
                                    else if (!r) return this.error(26, eL(this.clonePosition(), this.clonePosition()));
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
                                        location: eL(r, this.clonePosition())
                                    },
                                    err: null
                                };
                                if (!this.bumpIf(">")) return this.error(23, eL(r, this.clonePosition()));
                                var o = this.parseMessage(e + 1, t, !0);
                                if (o.err) return o;
                                var i = o.val,
                                    a = this.clonePosition();
                                if (!this.bumpIf("</")) return this.error(27, eL(r, this.clonePosition()));
                                if (this.isEOF() || !eY(this.char())) return this.error(23, eL(a, this.clonePosition()));
                                var l = this.clonePosition();
                                return n !== this.parseTagName() ? this.error(26, eL(l, this.clonePosition())) : (this.bumpSpace(), this.bumpIf(">")) ? {
                                    val: {
                                        type: 8,
                                        value: n,
                                        children: i,
                                        location: eL(r, this.clonePosition())
                                    },
                                    err: null
                                } : this.error(23, eL(a, this.clonePosition()))
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
                                        location: eL(r, this.clonePosition())
                                    },
                                    err: null
                                }
                            }
                        }, {
                            key: "tryParseLeftAngleBracket",
                            value: function() {
                                var e;
                                return this.isEOF() || 60 !== this.char() || !this.ignoreTag && (eY(e = this.peek() || 0) || 47 === e) ? null : (this.bump(), "<")
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
                                    if (Array.isArray(e)) return eP(e)
                                }(r) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(r) || eT(r) || function() {
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
                                if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, eL(r, this.clonePosition()));
                                if (125 === this.char()) return this.bump(), this.error(2, eL(r, this.clonePosition()));
                                var n = this.parseIdentifierIfPossible().value;
                                if (!n) return this.error(3, eL(r, this.clonePosition()));
                                if (this.bumpSpace(), this.isEOF()) return this.error(1, eL(r, this.clonePosition()));
                                switch (this.char()) {
                                    case 125:
                                        return this.bump(), {
                                            val: {
                                                type: 1,
                                                value: n,
                                                location: eL(r, this.clonePosition())
                                            },
                                            err: null
                                        };
                                    case 44:
                                        if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, eL(r, this.clonePosition()));
                                        return this.parseArgumentOptions(e, t, n, r);
                                    default:
                                        return this.error(3, eL(r, this.clonePosition()))
                                }
                            }
                        }, {
                            key: "parseIdentifierIfPossible",
                            value: function() {
                                var e, t, r = this.clonePosition(),
                                    n = this.offset(),
                                    o = (e = this.message, eW.lastIndex = n, null != (t = eW.exec(e)[1]) ? t : ""),
                                    i = n + o.length;
                                return this.bumpTo(i), {
                                    value: o,
                                    location: eL(r, this.clonePosition())
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
                                        return this.error(4, eL(o, a));
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
                                            var f = eV(s.val);
                                            if (0 === f.length) return this.error(6, eL(this.clonePosition(), this.clonePosition()));
                                            u = {
                                                style: f,
                                                styleLocation: eL(c, this.clonePosition())
                                            }
                                        }
                                        var p = this.tryParseArgumentClose(n);
                                        if (p.err) return p;
                                        var d = eL(n, this.clonePosition());
                                        if (u && u.style.startsWith("::")) {
                                            var h = eF(u.style.slice(2));
                                            if ("number" === i) {
                                                var y = this.parseNumberSkeletonFromString(h, u.styleLocation);
                                                if (y.err) return y;
                                                return {
                                                    val: {
                                                        type: 2,
                                                        value: r,
                                                        location: d,
                                                        style: y.val
                                                    },
                                                    err: null
                                                }
                                            }
                                            if (0 === h.length) return this.error(10, d);
                                            var m, b = h;
                                            return this.locale && (b = function(e, t) {
                                                for (var r = "", n = 0; n < e.length; n++) {
                                                    var o = e.charAt(n);
                                                    if ("j" === o) {
                                                        for (var i = 0; n + 1 < e.length && e.charAt(n + 1) === o;) i++, n++;
                                                        var a = 1 + (1 & i),
                                                            l = i < 2 ? 1 : 3 + (i >> 1),
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
                                                                return "root" !== n && (t = e.maximize().region), (eN[t || ""] || eN[n || ""] || eN["".concat(n, "-001")] || eN["001"])[0]
                                                            }(t);
                                                        for (("H" == u || "k" == u) && (l = 0); l-- > 0;) r += "a";
                                                        for (; a-- > 0;) r = u + r
                                                    } else "J" === o ? r += "H" : r += o
                                                }
                                                return r
                                            }(h, this.locale)), {
                                                val: {
                                                    type: "date" === i ? 3 : 4,
                                                    value: r,
                                                    location: d,
                                                    style: {
                                                        type: 1,
                                                        pattern: b,
                                                        location: u.styleLocation,
                                                        parsedOptions: this.shouldParseSkeletons ? (m = {}, b.replace(em, function(e) {
                                                            var t = e.length;
                                                            switch (e[0]) {
                                                                case "G":
                                                                    m.era = 4 === t ? "long" : 5 === t ? "narrow" : "short";
                                                                    break;
                                                                case "y":
                                                                    m.year = 2 === t ? "2-digit" : "numeric";
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
                                                                    m.month = ["numeric", "2-digit", "short", "long", "narrow"][t - 1];
                                                                    break;
                                                                case "w":
                                                                case "W":
                                                                    throw RangeError("`w/W` (week) patterns are not supported");
                                                                case "d":
                                                                    m.day = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "D":
                                                                case "F":
                                                                case "g":
                                                                    throw RangeError("`D/F/g` (day) patterns are not supported, use `d` instead");
                                                                case "E":
                                                                    m.weekday = 4 === t ? "long" : 5 === t ? "narrow" : "short";
                                                                    break;
                                                                case "e":
                                                                    if (t < 4) throw RangeError("`e..eee` (weekday) patterns are not supported");
                                                                    m.weekday = ["short", "long", "narrow", "short"][t - 4];
                                                                    break;
                                                                case "c":
                                                                    if (t < 4) throw RangeError("`c..ccc` (weekday) patterns are not supported");
                                                                    m.weekday = ["short", "long", "narrow", "short"][t - 4];
                                                                    break;
                                                                case "a":
                                                                    m.hour12 = !0;
                                                                    break;
                                                                case "b":
                                                                case "B":
                                                                    throw RangeError("`b/B` (period) patterns are not supported, use `a` instead");
                                                                case "h":
                                                                    m.hourCycle = "h12", m.hour = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "H":
                                                                    m.hourCycle = "h23", m.hour = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "K":
                                                                    m.hourCycle = "h11", m.hour = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "k":
                                                                    m.hourCycle = "h24", m.hour = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "j":
                                                                case "J":
                                                                case "C":
                                                                    throw RangeError("`j/J/C` (hour) patterns are not supported, use `h/H/K/k` instead");
                                                                case "m":
                                                                    m.minute = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "s":
                                                                    m.second = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "S":
                                                                case "A":
                                                                    throw RangeError("`S/A` (second) patterns are not supported, use `s` instead");
                                                                case "z":
                                                                    m.timeZoneName = t < 4 ? "short" : "long";
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
                                                        }), m) : {}
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
                                                style: null != (l = null == u ? void 0 : u.style) ? l : null
                                            }, err: null
                                        };
                                    case "plural":
                                    case "selectordinal":
                                    case "select":
                                        var v = this.clonePosition();
                                        if (this.bumpSpace(), !this.bumpIf(",")) return this.error(12, eL(v, ej({}, v)));
                                        this.bumpSpace();
                                        var g = this.parseIdentifierIfPossible(),
                                            O = 0;
                                        if ("select" !== i && "offset" === g.value) {
                                            if (!this.bumpIf(":")) return this.error(13, eL(this.clonePosition(), this.clonePosition()));
                                            this.bumpSpace();
                                            var w = this.tryParseDecimalInteger(13, 14);
                                            if (w.err) return w;
                                            this.bumpSpace(), g = this.parseIdentifierIfPossible(), O = w.val
                                        }
                                        var S = this.tryParsePluralOrSelectOptions(e, i, t, g);
                                        if (S.err) return S;
                                        var E = this.tryParseArgumentClose(n);
                                        if (E.err) return E;
                                        var A = eL(n, this.clonePosition());
                                        if ("select" === i) return {
                                            val: {
                                                type: 5,
                                                value: r,
                                                options: eH(S.val),
                                                location: A
                                            },
                                            err: null
                                        };
                                        return {
                                            val: {
                                                type: 6,
                                                value: r,
                                                options: eH(S.val),
                                                offset: O,
                                                pluralType: "plural" === i ? "cardinal" : "ordinal",
                                                location: A
                                            }, err: null
                                        };
                                    default:
                                        return this.error(5, eL(o, a))
                                }
                            }
                        }, {
                            key: "tryParseArgumentClose",
                            value: function(e) {
                                return this.isEOF() || 125 !== this.char() ? this.error(1, eL(e, this.clonePosition())) : (this.bump(), {
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
                                        if (!this.bumpUntil("'")) return this.error(11, eL(r, this.clonePosition()));
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
                                        var t = e.split(eb).filter(function(e) {
                                                return e.length > 0
                                            }),
                                            r = [],
                                            n = !0,
                                            o = !1,
                                            i = void 0;
                                        try {
                                            for (var a, l = t[Symbol.iterator](); !(n = (a = l.next()).done); n = !0) {
                                                var u = a.value.split("/");
                                                if (0 === u.length) throw Error("Invalid number skeleton");
                                                var c = function(e) {
                                                        if (Array.isArray(e)) return e
                                                    }(u) || function(e) {
                                                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                                    }(u) || function(e) {
                                                        if (e) {
                                                            if ("string" == typeof e) return ed(e, void 0);
                                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ed(e, void 0)
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
                                                    for (var y, m = f[Symbol.iterator](); !(p = (y = m.next()).done); p = !0) {
                                                        var b = y.value;
                                                        if (0 === b.length) throw Error("Invalid number skeleton")
                                                    }
                                                } catch (e) {
                                                    d = !0, h = e
                                                } finally {
                                                    try {
                                                        p || null == m.return || m.return()
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
                                                            t = eh(ey(eh({}, t), {
                                                                notation: "scientific"
                                                            }), l.options.reduce(function(e, t) {
                                                                return eh({}, e, eA(t))
                                                            }, {}));
                                                            continue;
                                                        case "engineering":
                                                            t = eh(ey(eh({}, t), {
                                                                notation: "engineering"
                                                            }), l.options.reduce(function(e, t) {
                                                                return eh({}, e, eA(t))
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
                                                            l.options[0].replace(eO, function(e, r, n, o, i, a) {
                                                                if (r) t.minimumIntegerDigits = n.length;
                                                                else if (o && i) throw Error("We currently do not support maximum integer digits");
                                                                else if (a) throw Error("We currently do not support exact integer digits");
                                                                return ""
                                                            });
                                                            continue
                                                    }
                                                    if (ew.test(l.stem)) {
                                                        t.minimumIntegerDigits = l.stem.length;
                                                        continue
                                                    }
                                                    if (ev.test(l.stem)) {
                                                        if (l.options.length > 1) throw RangeError("Fraction-precision stems only accept a single optional option");
                                                        l.stem.replace(ev, function(e, r, n, o, i, a) {
                                                            return "*" === n ? t.minimumFractionDigits = r.length : o && "#" === o[0] ? t.maximumFractionDigits = o.length : i && a ? (t.minimumFractionDigits = i.length, t.maximumFractionDigits = i.length + a.length) : (t.minimumFractionDigits = r.length, t.maximumFractionDigits = r.length), ""
                                                        });
                                                        var u = l.options[0];
                                                        "w" === u ? t = ey(eh({}, t), {
                                                            trailingZeroDisplay: "stripIfInteger"
                                                        }) : u && (t = eh({}, t, eS(u)));
                                                        continue
                                                    }
                                                    if (eg.test(l.stem)) {
                                                        t = eh({}, t, eS(l.stem));
                                                        continue
                                                    }
                                                    var c = eE(l.stem);
                                                    c && (t = eh({}, t, c));
                                                    var s = function(e) {
                                                        var t;
                                                        if ("E" === e[0] && "E" === e[1] ? (t = {
                                                                notation: "engineering"
                                                            }, e = e.slice(2)) : "E" === e[0] && (t = {
                                                                notation: "scientific"
                                                            }, e = e.slice(1)), t) {
                                                            var r = e.slice(0, 2);
                                                            if ("+!" === r ? (t.signDisplay = "always", e = e.slice(2)) : "+?" === r && (t.signDisplay = "exceptZero", e = e.slice(2)), !ew.test(e)) throw Error("Malformed concise eng/scientific notation");
                                                            t.minimumIntegerDigits = e.length
                                                        }
                                                        return t
                                                    }(l.stem);
                                                    s && (t = eh({}, t, s))
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
                                for (var o = !1, i = [], a = new Set, l = n.value, u = n.location;;) {
                                    if (0 === l.length) {
                                        var c, s = this.clonePosition();
                                        if ("select" !== t && this.bumpIf("=")) {
                                            var f = this.tryParseDecimalInteger(16, 19);
                                            if (f.err) return f;
                                            u = eL(s, this.clonePosition()), l = this.message.slice(s.offset, this.offset())
                                        } else break
                                    }
                                    if (a.has(l)) return this.error("select" === t ? 21 : 20, u);
                                    "other" === l && (o = !0), this.bumpSpace();
                                    var p = this.clonePosition();
                                    if (!this.bumpIf("{")) return this.error("select" === t ? 17 : 18, eL(this.clonePosition(), this.clonePosition()));
                                    var d = this.parseMessage(e + 1, t, r);
                                    if (d.err) return d;
                                    var h = this.tryParseArgumentClose(p);
                                    if (h.err) return h;
                                    i.push([l, {
                                        value: d.val,
                                        location: eL(p, this.clonePosition())
                                    }]), a.add(l), this.bumpSpace(), l = (c = this.parseIdentifierIfPossible()).value, u = c.location
                                }
                                return 0 === i.length ? this.error("select" === t ? 15 : 16, eL(this.clonePosition(), this.clonePosition())) : this.requiresOtherClause && !o ? this.error(22, eL(this.clonePosition(), this.clonePosition())) : {
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
                                var l = eL(n, this.clonePosition());
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

            function eY(e) {
                return e >= 97 && e <= 122 || e >= 65 && e <= 90
            }

            function eK(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ez(e, t, r) {
                return t = eQ(t),
                    function(e, t) {
                        if (t && ("object" === e6(t) || "function" == typeof t)) return t;
                        if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                        return e
                    }(e, e5() ? Reflect.construct(t, r || [], eQ(e).constructor) : t.apply(e, r))
            }

            function eX(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function e$(e, t, r) {
                return (e$ = e5() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && e2(o, r.prototype), o
                }).apply(null, arguments)
            }

            function eZ(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function eq(e, t, r) {
                return t && eZ(e.prototype, t), r && eZ(e, r), e
            }

            function eJ() {
                return (eJ = Object.assign || function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var r = arguments[t];
                        for (var n in r) Object.prototype.hasOwnProperty.call(r, n) && (e[n] = r[n])
                    }
                    return e
                }).apply(this, arguments)
            }

            function eQ(e) {
                return (eQ = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function e0(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && e2(e, t)
            }

            function e1(e) {
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

            function e2(e, t) {
                return (e2 = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function e3(e) {
                return function(e) {
                    if (Array.isArray(e)) return eK(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return eK(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return eK(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function e6(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function e8(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (e8 = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return e$(e, arguments, eQ(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), e2(r, e)
                })(e)
            }

            function e5() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (e5 = function() {
                    return !!e
                })()
            }
            var e4 = function(e) {
                    function t(e, r, n) {
                        var o;
                        return eX(this, t), (o = ez(this, t, [e])).code = r, o.originalMessage = n, o
                    }
                    return e0(t, e), eq(t, [{
                        key: "toString",
                        value: function() {
                            return "[formatjs Error: ".concat(this.code, "] ").concat(this.message)
                        }
                    }]), t
                }(e8(Error)),
                e7 = function(e) {
                    function t(e, r, n, o) {
                        return eX(this, t), ez(this, t, ['Invalid values for "'.concat(e, '": "').concat(r, '". Options are "').concat(Object.keys(n).join('", "'), '"'), "INVALID_VALUE", o])
                    }
                    return e0(t, e), t
                }(e4),
                e9 = function(e) {
                    function t(e, r, n) {
                        return eX(this, t), ez(this, t, ['Value for "'.concat(e, '" must be of type ').concat(r), "INVALID_VALUE", n])
                    }
                    return e0(t, e), t
                }(e4),
                te = function(e) {
                    function t(e, r) {
                        return eX(this, t), ez(this, t, ['The intl string context variable "'.concat(e, '" was not provided to the string "').concat(r, '"'), "MISSING_VALUE", r])
                    }
                    return e0(t, e), t
                }(e4);

            function tt(e) {
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
            var tr = ((T = function() {
                function e(t) {
                    var r, n = this,
                        o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e.defaultLocale,
                        i = arguments.length > 2 ? arguments[2] : void 0,
                        a = arguments.length > 3 ? arguments[3] : void 0;
                    if (eX(this, e), this.formatterCache = {
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
                                            "number" == typeof a && u.push({
                                                type: 0,
                                                value: n.getNumberFormat(r).format(a)
                                            });
                                            continue
                                        }
                                        var y = h.value;
                                        if (!(i && y in i)) throw new te(y, l);
                                        var m = i[y];
                                        if (1 === h.type) {
                                            m && "string" != typeof m && "number" != typeof m && (void 0 === m ? "undefined" : e6(m)) !== "bigint" || (m = "string" == typeof m || "number" == typeof m || (void 0 === m ? "undefined" : e6(m)) === "bigint" ? String(m) : ""), u.push({
                                                type: +("string" != typeof m),
                                                value: m
                                            });
                                            continue
                                        }
                                        if (3 === h.type) {
                                            var b = "string" == typeof h.style ? o.date[h.style] : eC(h.style) ? h.style.parsedOptions : void 0;
                                            u.push({
                                                type: 0,
                                                value: n.getDateTimeFormat(r, b).format(m)
                                            });
                                            continue
                                        }
                                        if (4 === h.type) {
                                            var v = "string" == typeof h.style ? o.time[h.style] : eC(h.style) ? h.style.parsedOptions : o.time.medium;
                                            u.push({
                                                type: 0,
                                                value: n.getDateTimeFormat(r, v).format(m)
                                            });
                                            continue
                                        }
                                        if (2 === h.type) {
                                            var g = "string" == typeof h.style ? o.number[h.style] : eI(h.style) ? h.style.parsedOptions : void 0;
                                            if (g && g.scale) {
                                                var O = g.scale || 1;
                                                if ((void 0 === m ? "undefined" : e6(m)) === "bigint") {
                                                    if (!Number.isInteger(O)) throw TypeError("Cannot apply fractional scale ".concat(O, " to bigint value. Scale must be an integer when formatting bigint."));
                                                    m *= BigInt(O)
                                                } else m *= O
                                            }
                                            u.push({
                                                type: 0,
                                                value: n.getNumberFormat(r, g).format(m)
                                            });
                                            continue
                                        }
                                        if (8 === h.type) {
                                            var w = h.children,
                                                S = h.value,
                                                E = i[S];
                                            if ("function" != typeof E) throw new e9(S, "function", l);
                                            var A = E(e(w, r, n, o, i, a).map(function(e) {
                                                return e.value
                                            }));
                                            Array.isArray(A) || (A = [A]), u.push.apply(u, e3(A.map(function(e) {
                                                return {
                                                    type: +("string" != typeof e),
                                                    value: e
                                                }
                                            })))
                                        }
                                        if (5 === h.type) {
                                            var P = m,
                                                j = (Object.prototype.hasOwnProperty.call(h.options, P) ? h.options[P] : void 0) || h.options.other;
                                            if (!j) throw new e7(h.value, m, Object.keys(h.options), l);
                                            u.push.apply(u, e3(e(j.value, r, n, o, i)));
                                            continue
                                        }
                                        if (6 === h.type) {
                                            var x = "=".concat(m),
                                                T = Object.prototype.hasOwnProperty.call(h.options, x) ? h.options[x] : void 0;
                                            if (!T) {
                                                if (!Intl.PluralRules) throw new e4('Intl.PluralRules is not available in this environment.\nTry polyfilling it using "@formatjs/intl-pluralrules"\n', "MISSING_INTL_API", l);
                                                var _ = (void 0 === m ? "undefined" : e6(m)) === "bigint" ? Number(m) : m,
                                                    I = n.getPluralRules(r, {
                                                        type: h.pluralType
                                                    }).select(_ - (h.offset || 0));
                                                T = (Object.prototype.hasOwnProperty.call(h.options, I) ? h.options[I] : void 0) || h.options.other
                                            }
                                            if (!T) throw new e7(h.value, m, Object.keys(h.options), l);
                                            var C = (void 0 === m ? "undefined" : e6(m)) === "bigint" ? Number(m) : m;
                                            u.push.apply(u, e3(e(T.value, r, n, o, i, C - (h.offset || 0))));
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
                        var l, u, c = a || {},
                            s = (function(e) {
                                if (null == e) throw TypeError("Cannot destructure " + e)
                            }(c), eJ({}, c));
                        this.ast = e.__parse(t, (l = e1({}, s), u = u = {
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
                    this.formats = (r = e.formats, i ? Object.keys(r).reduce(function(e, t) {
                        var n, o;
                        return e[t] = (n = r[t], (o = i[t]) ? e1({}, n, o, Object.keys(n).reduce(function(e, t) {
                            return e[t] = e1({}, n[t], o[t]), e
                        }, {})) : n), e
                    }, e1({}, r)) : r), this.formatters = a && a.formatters || function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                            number: {},
                            dateTime: {},
                            pluralRules: {}
                        };
                        return {
                            getNumberFormat: Z(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return e$(Intl.NumberFormat, e3(t))
                            }, {
                                cache: tt(e.number),
                                strategy: er.variadic
                            }),
                            getDateTimeFormat: Z(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return e$(Intl.DateTimeFormat, e3(t))
                            }, {
                                cache: tt(e.dateTime),
                                strategy: er.variadic
                            }),
                            getPluralRules: Z(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return e$(Intl.PluralRules, e3(t))
                            }, {
                                cache: tt(e.pluralRules),
                                strategy: er.variadic
                            })
                        }
                    }(this.formatterCache)
                }
                return eq(e, null, [{
                    key: "defaultLocale",
                    get: function() {
                        return e.memoizedDefaultLocale || (e.memoizedDefaultLocale = new Intl.NumberFormat().resolvedOptions().locale), e.memoizedDefaultLocale
                    }
                }]), e
            }()).memoizedDefaultLocale = null, T.resolveLocale = function(e) {
                if (void 0 !== Intl.Locale) {
                    var t = Intl.NumberFormat.supportedLocalesOf(e);
                    return new Intl.Locale(t.length > 0 ? t[0] : "string" == typeof e ? e : e[0])
                }
            }, T.__parse = function(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = new eG(e, t = ej({
                        shouldParseSkeletons: !0,
                        requiresOtherClause: !0
                    }, t)).parse();
                if (r.err) {
                    var n = SyntaxError(e_[r.err.kind]);
                    throw n.location = r.err.location, n.originalMessage = r.err.message, n
                }
                return (null == t ? void 0 : t.captureLocation) || function e(t) {
                    t.forEach(function(t) {
                        if (delete t.location, 5 === t.type || 6 === t.type)
                            for (var r in t.options) delete t.options[r].location, e(t.options[r].value);
                        else 2 === t.type && eI(t.style) || (3 === t.type || 4 === t.type) && eC(t.style) ? delete t.style.location : 8 === t.type && e(t.children)
                    })
                }(r.val), r.val
            }, T.formats = {
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
            }, T);

            function tn(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function to(e) {
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

            function ti(e, t) {
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

            function ta(e, t) {
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
                        if ("string" == typeof e) return tn(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tn(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tl() {
                for (var e, t, r, n, o, i = arguments.length, a = Array(i), l = 0; l < i; l++) a[l] = arguments[l];
                var u = ta(a, 4),
                    c = (u[0], u[1]),
                    s = u[2],
                    f = u[3];
                if (Array.isArray(c)) throw new ec(es.INVALID_MESSAGE, void 0);
                if ("object" == (void 0 === c ? "undefined" : c && "u" > typeof Symbol && c.constructor === Symbol ? "symbol" : typeof c)) throw new ec(es.INSUFFICIENT_PATH, void 0);
                if ("string" == typeof c) {
                    var p = s || /'[{}<#|']/.test(c) ? void 0 : c;
                    if (p) return p
                }
                var d = f.cache,
                    h = f.formats,
                    y = f.formatters,
                    m = f.globalFormats,
                    b = f.locale,
                    v = f.timeZone;
                y.getMessageFormat || (y.getMessageFormat = ef(function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return new tr(t[0], t[1], t[2], to({
                        formatters: y
                    }, t[3]))
                }, d.message));
                try {
                    o = y.getMessageFormat(c, b, (e = tr.formats.date, t = tr.formats.time, r = to({}, null == m ? void 0 : m.dateTime, null == h ? void 0 : h.dateTime), n = {
                        date: to({}, e, r),
                        time: to({}, t, r),
                        number: to({}, null == m ? void 0 : m.number, null == h ? void 0 : h.number)
                    }, v && ["date", "time"].forEach(function(e) {
                        var t = n[e],
                            r = !0,
                            o = !1,
                            i = void 0;
                        try {
                            for (var a, l = Object.entries(t)[Symbol.iterator](); !(r = (a = l.next()).done); r = !0) {
                                var u = ta(a.value, 2),
                                    c = u[0],
                                    s = u[1];
                                t[c] = to({
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
                        formatters: ti(to({}, y), {
                            getDateTimeFormat: function(e, t) {
                                var r;
                                return y.getDateTimeFormat(e, ti(to({}, t), {
                                    timeZone: null != (r = null == t ? void 0 : t.timeZone) ? r : v
                                }))
                            }
                        })
                    })
                } catch (e) {
                    throw new ec(es.INVALID_MESSAGE, void 0)
                }
                var g = o.format(s);
                return (0, B.isValidElement)(g) || Array.isArray(g) || "string" == typeof g ? g : String(g)
            }

            function tu(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function tc(e) {
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

            function ts(e, t) {
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

            function tf() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return t.filter(Boolean).join(".")
            }

            function tp(e) {
                return tf(e.namespace, e.key)
            }

            function td(e) {
                console.error(e)
            }

            function th(e, t, r, n) {
                var o = tf(n, r);
                if (!t) throw Error(o);
                var i = t;
                return r.split(".").forEach(function(t) {
                    var r = i[t];
                    if (null == t || null == r) throw Error(o + " (".concat(e, ")"));
                    i = r
                }), i
            }
            tl.raw = !0;
            var ty = (0, B.createContext)(void 0);

            function tm(e) {
                var t = e.children,
                    r = e.formats,
                    n = e.getMessageFallback,
                    o = e.locale,
                    i = e.messages,
                    a = e.now,
                    l = e.onError,
                    u = e.timeZone,
                    c = (0, B.useContext)(ty),
                    s = (0, B.useMemo)(function() {
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
                    f = (0, B.useMemo)(function() {
                        return (null == c ? void 0 : c.formatters) || {
                            getDateTimeFormat: ep(Intl.DateTimeFormat, s.dateTime),
                            getNumberFormat: ep(Intl.NumberFormat, s.number),
                            getPluralRules: ep(Intl.PluralRules, s.pluralRules),
                            getRelativeTimeFormat: ep(Intl.RelativeTimeFormat, s.relativeTime),
                            getListFormat: ep(Intl.ListFormat, s.list),
                            getDisplayNames: ep(Intl.DisplayNames, s.displayNames)
                        }
                    }, [s, null == c ? void 0 : c.formatters]),
                    p = (0, B.useMemo)(function() {
                        var e, t, p, d, h, y, m;
                        return y = function(e) {
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
                            messages: void 0 === i ? null == c ? void 0 : c.messages : i,
                            now: a || (null == c ? void 0 : c.now),
                            onError: l || (null == c ? void 0 : c.onError),
                            timeZone: u || (null == c ? void 0 : c.timeZone)
                        }).formats, p = e.getMessageFallback, d = e.messages, h = e.onError, ts(tc({}, function(e, t) {
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
                            onError: h || td,
                            getMessageFallback: p || tp
                        }))), m = m = {
                            formatters: f,
                            cache: s
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(y, Object.getOwnPropertyDescriptors(m)) : (function(e) {
                            var t = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                t.push.apply(t, r)
                            }
                            return t
                        })(Object(m)).forEach(function(e) {
                            Object.defineProperty(y, e, Object.getOwnPropertyDescriptor(m, e))
                        }), y
                    }, [s, r, f, n, o, i, a, l, c, u]);
                return (0, U.jsx)(ty.Provider, {
                    value: p,
                    children: t
                })
            }

            function tb() {
                var e = (0, B.useContext)(ty);
                if (!e) throw Error(void 0);
                return e
            }
            var tv = !1,
                tg = "u" < typeof window,
                tO = window.Roblox["core-lib"].index;

            function tw(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tS(e) {
                return function(e) {
                    if (Array.isArray(e)) return tw(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tw(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tw(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            tS(["ar-001", "de-de", "en-us", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn", "zh-cn", "zh-tw"]).concat(tS(["bg-bg", "bn-bd", "bs-ba", "cs-cz", "da-dk", "el-gr", "en-gb", "es-mx", "et-ee", "fi-fi", "fil-ph", "fr-ca", "hr-hr", "hu-hu", "ka-ge", "kk-kz", "km-kh", "lt-lt", "lv-lv", "ms-my", "my-mm", "nb-no", "pt-pt", "ro-ro", "ru-ru", "si-lk", "sk-sk", "sl-sl", "sq-al", "sr-rs", "sv-se", "uk-ua"]));
            var tE = tS(["ar_001", "de_de", "en_us", "es_es", "fr_fr", "hi_in", "id_id", "it_it", "ja_jp", "ko_kr", "nl_nl", "pl_pl", "pt_br", "th_th", "tr_tr", "vi_vn", "zh_cn", "zh_tw"]).concat(tS(["bg_bg", "bn_bd", "bs_ba", "cs_cz", "da_dk", "el_gr", "en_gb", "es_mx", "et_ee", "fi_fi", "fil_ph", "fr_ca", "hr_hr", "hu_hu", "ka_ge", "kk_kz", "km_kh", "lt_lt", "lv_lv", "ms_my", "my_mm", "nb_no", "pt_pt", "ro_ro", "ru_ru", "si_lk", "sk_sk", "sl_sl", "sq_al", "sr_rs", "sv_se", "uk_ua"])),
                tA = tS(["ar-001", "de-DE", "en-US", "es-ES", "fr-FR", "hi-IN", "id-ID", "it-IT", "ja-JP", "ko-KR", "nl-NL", "pl-PL", "pt-BR", "th-TH", "tr-TR", "vi-VN", "zh-CN", "zh-TW"]).concat(tS(["bg-BG", "bn-BD", "bs-BA", "cs-CZ", "da-DK", "el-GR", "en-GB", "es-MX", "et-EE", "fi-FI", "fil-PH", "fr-CA", "hr-HR", "hu-HU", "ka-GE", "kk-KZ", "km-KH", "lt-LT", "lv-LV", "ms-MY", "my-MM", "nb-NO", "pt-PT", "ro-RO", "ru-RU", "si-LK", "sk-SK", "sl-SL", "sq-AL", "sr-RS", "sv-SE", "uk-UA"]));
            tS(["ar", "de", "es", "fr", "hi", "id", "it", "ja", "ko", "nl", "pl", "pt", "th", "tr", "vi"]).concat(tS(["ar-001", "de-de", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn"]));
            var tP = function(e) {
                return e.replaceAll(".", ":")
            };

            function tj(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var tx = function() {
                    if ("u" < typeof window) return {};
                    var e = window.Roblox;
                    return null != e ? e : {}
                },
                tT = function(e) {
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
                                    if ("string" == typeof e) return tj(e, 2);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tj(e, 2)
                                }
                            }(e) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            r = t[0],
                            n = t[1];
                        return null == n ? [] : [
                            [tP(r), n]
                        ]
                    }))
                },
                t_ = function(e) {
                    var t = tx(),
                        r = t.Lang,
                        n = t.LangDynamic,
                        o = t.LangDynamicDefault;
                    return Object.fromEntries(e.map(function(e) {
                        return [tP(e), function(e) {
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
                        }({}, tT(null == o ? void 0 : o[e]), tT(null == r ? void 0 : r[e]), tT(null == n ? void 0 : n[e]))]
                    }))
                },
                tI = function(e) {
                    var t, r, n = e.namespaces,
                        o = e.locale,
                        i = e.children,
                        a = n.join(","),
                        l = (0, B.useMemo)(function() {
                            return t_(n)
                        }, [a]);
                    return (0, U.jsx)(tm, {
                        locale: null != o ? o : null != (t = null != (r = function() {
                            if (!("u" < typeof document)) {
                                var e = document.documentElement.lang;
                                if (e) return (0, tO.arrayIncludes)(tA, e) ? e.toLowerCase() : void 0
                            }
                        }()) ? r : function() {
                            if ("u" < typeof document) return;
                            var e, t = document.querySelector('meta[name="locale-data"]');
                            if (null != (e = HTMLMetaElement) && "u" > typeof Symbol && e[Symbol.hasInstance] ? e[Symbol.hasInstance](t) : t instanceof e) {
                                var r = t.dataset.languageCode;
                                if (r && (0, tO.arrayIncludes)(tE, r)) return r.replace("_", "-")
                            }
                        }()) ? t : "en-us",
                        messages: l,
                        children: i
                    })
                },
                tC = function(e) {
                    if (!e.trim()) return null;
                    try {
                        return BigInt(e)
                    } catch (e) {
                        return null
                    }
                },
                tR = function(e) {
                    return e > 0 && e <= Number.MAX_SAFE_INTEGER ? e.toString() : null
                },
                tN = function(e) {
                    var t = tC(e);
                    return null == t ? null : tR(t)
                },
                tD = "blackbird",
                tM = function(e) {
                    var t, r, n, o, i = null != (t = e.userid) ? t : e.user,
                        a = null == i ? void 0 : null != (r = tN(i)) ? r : void 0;
                    if ("string" == typeof a) return {
                        isAuthenticated: !0,
                        id: a,
                        userName: null != (n = e.name) ? n : e.userName,
                        displayName: null != (o = e.displayname) ? o : e.userDisplayName,
                        isPremiumUser: "true" === e.ispremiumuser || "true" === e.userIsPremium,
                        membership: e.membership === tD || e.userMembership === tD ? tD : void 0,
                        isVerified: "true" === e.hasverifiedbadge || "true" === e.userHasVerifiedBadge,
                        isUnder13: "true" === e.isunder13 || "AgeUnder13" === e.userAgeBracket
                    }
                },
                tL = window.Roblox["core-scripts"].environmentUrls,
                tk = r.n(tL),
                tU = null != (_ = tk().apiGatewayUrl) ? _ : "URL_NOT_FOUND",
                tB = "".concat(tU, "/account-security-service"),
                tH = ((o = {})[o.UNKNOWN = 1] = "UNKNOWN", o[o.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", o[o.PROMPT_ASSIGNMENT_WAS_NOT_UPDATED = 3] = "PROMPT_ASSIGNMENT_WAS_NOT_UPDATED", o[o.UNKNOWN_PROMPT_TYPE = 4] = "UNKNOWN_PROMPT_TYPE", o),
                tF = ((i = {}).TEXT_ONLY_BANNER = "DISPLAY_TYPE_TEXT_ONLY_BANNER", i),
                tV = ((a = {}).GLOBAL = "PAGE_RESTRICTION_GLOBAL", a.HOME_PAGE_ONLY = "PAGE_RESTRICTION_HOME_PAGE", a),
                tW = ((l = {}).CHANGE_PASSWORD__SUSPECTED_COMPROMISE = "PROMPT_TYPE_CHANGE_PASSWORD__SUSPECTED_COMPROMISE", l.CHANGE_PASSWORD__BREACHED_CREDENTIAL = "PROMPT_TYPE_CHANGE_PASSWORD__BREACHED_CREDENTIAL", l.AUTHENTICATOR_UPSELL = "PROMPT_TYPE_AUTHENTICATOR_UPSELL", l.ACCOUNT_RESTORES_POLICY_UPDATE = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE", l.ACCOUNT_RESTORES_POLICY_UPDATE_V2 = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE_V2", l.ACCOUNT_RESTORES_POLICY_UPDATE_V3 = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE_V3", l.ACCOUNT_RESTORES_POLICY_UPSELL = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPSELL", l.BROADER_AUTHENTICATOR_UPSELL = "PROMPT_TYPE_BROADER_AUTHENTICATOR_UPSELL", l.EMAIL_2SV_UPSELL = "PROMPT_TYPE_EMAIL_2SV_UPSELL", l),
                tG = {
                    withCredentials: !0,
                    url: "".concat(tB, "/v1/prompt-assignments"),
                    timeout: 1e4
                },
                tY = ((u = {}).DISMISS_PROMPT = "DISMISS_PROMPT", u.DISABLE_PROMPT = "DISABLE_PROMPT", u),
                tK = {
                    withCredentials: !0,
                    url: "".concat(tB, "/v1/prompt-assignments"),
                    timeout: 1e4
                },
                tz = function() {
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
                tX = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                t$ = function(e) {
                    var t = e.className;
                    return H().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: tz("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                };

            function tZ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tq(e) {
                if (Array.isArray(e)) return e
            }

            function tJ() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function tQ(e, t) {
                if (e) {
                    if ("string" == typeof e) return tZ(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tZ(e, t)
                }
            }
            var t0 = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                t1 = H().forwardRef(function(e, t) {
                    var r, n = tq(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || tQ(r) || tJ(),
                        o = n[0],
                        i = n.slice(1),
                        a = o.name,
                        l = o.size,
                        u = o.className,
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
                        s = (tq(i) || function(e) {
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
                        }(i) || tQ(i, 1) || tJ())[0];
                    return H().createElement("span", function(e) {
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
                        className: tz("grow-0 shrink-0 basis-auto icon", a, t0[void 0 === l ? "Medium" : l], u)
                    }, c))
                });
            t1.displayName = "Icon";
            var t2 = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                t3 = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                t6 = function(e) {
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
                    return H().createElement("button", function(e) {
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
                        className: tz("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", tX, t3[t], t2[r], n && "radius-circle", o)
                    }, i), H().createElement(t$, null), H().createElement(t1, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function t8(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function t5(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function t4(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function t7() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = t4(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : t4(t[e], null)
                        }
                    }
                }
            }

            function t9() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return B.useCallback(t7.apply(void 0, function(e) {
                    if (Array.isArray(e)) return t5(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return t5(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return t5(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function re(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rt(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function rr(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        rt(e, t, r[t])
                    })
                }
                return e
            }

            function rn(e, t) {
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

            function ro(e) {
                return function(e) {
                    if (Array.isArray(e)) return re(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return re(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return re(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ri() {
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
                            return rr({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return B.useMemo(function() {
                            return rt({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }
            var ra = (null == (I = globalThis) ? void 0 : I.document) ? B.useLayoutEffect : function() {};

            function rl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var ru = B[" useId ".trim().toString()] || function() {},
                rc = 0;

            function rs(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = B.useState(ru())) || function(e) {
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
                            if ("string" == typeof e) return rl(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rl(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    o = r[1];
                return ra(function() {
                    e || o(function(e) {
                        return null != e ? e : String(rc++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function rf(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rp(e) {
                var t = B.useRef(e);
                return B.useEffect(function() {
                    t.current = e
                }), B.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return rf(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return rf(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rf(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function rd(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rh(e, t) {
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
                        if ("string" == typeof e) return rd(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rd(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ry = window.RadixUI["react-dismissable-layer"],
                rm = window.RadixUI["react-focus-scope"];

            function rb(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rv(e) {
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

            function rg(e, t) {
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

            function rO(e, t) {
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

            function rw(e) {
                return function(e) {
                    if (Array.isArray(e)) return rb(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return rb(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rb(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rS(e) {
                var t, r, n = (t = e, (r = B.forwardRef(function(e, t) {
                        var r = e.children,
                            n = rO(e, ["children"]);
                        if (B.isValidElement(r)) {
                            var o, i, a, l, u, c = (u = (l = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = rv({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            i = t[n];
                                        /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            i.apply(void 0, rw(t)), o.apply(void 0, rw(t))
                                        } : o && (r[n] = o) : "style" === n ? r[n] = rv({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                    }(n);
                                    return rv({}, e, r)
                                }(n, r.props);
                            return r.type !== B.Fragment && (s.ref = t ? t7(t, c) : c), B.cloneElement(r, s)
                        }
                        return B.Children.count(r) > 1 ? B.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = B.forwardRef(function(e, t) {
                        var r = e.children,
                            o = rO(e, ["children"]),
                            i = B.Children.toArray(r),
                            a = i.find(rA);
                        if (a) {
                            var l = a.props.children,
                                u = i.map(function(e) {
                                    return e !== a ? e : B.Children.count(l) > 1 ? B.Children.only(null) : B.isValidElement(l) ? l.props.children : null
                                });
                            return (0, U.jsx)(n, rg(rv({}, o), {
                                ref: t,
                                children: B.isValidElement(l) ? B.cloneElement(l, void 0, u) : null
                            }))
                        }
                        return (0, U.jsx)(n, rg(rv({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            var rE = Symbol("radix.slottable");

            function rA(e) {
                return B.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === rE
            }

            function rP(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function rj(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        rP(e, t, r[t])
                    })
                }
                return e
            }

            function rx(e, t) {
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
            var rT = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                var r = rS("Primitive.".concat(t)),
                    n = B.forwardRef(function(e, n) {
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
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, U.jsx)(a, rx(rj({}, i), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), rx(rj({}, e), rP({}, t, n))
            }, {});

            function r_(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var rI = B.forwardRef(function(e, t) {
                var r, n, o, i, a, l = e.container,
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
                    }(e, ["container"]),
                    c = function(e) {
                        if (Array.isArray(e)) return e
                    }(r = B.useState(!1)) || function(e) {
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
                            if ("string" == typeof e) return r_(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return r_(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = c[0],
                    f = c[1];
                ra(function() {
                    return f(!0)
                }, []);
                var p = l || s && (null == (a = globalThis) || null == (i = a.document) ? void 0 : i.body);
                return p ? V().createPortal((0, U.jsx)(rT.div, (n = function(e) {
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
                }({}, u), o = o = {
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

            function rC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rR(e, t) {
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
                        if ("string" == typeof e) return rC(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rC(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            rI.displayName = "Portal";
            var rN = function(e) {
                var t, r, n, o, i, a, l, u, c, s, f, p, d, h, y, m, b, v = e.present,
                    g = e.children,
                    O = (t = v, i = (o = rR(B.useState(), 2))[0], a = o[1], l = B.useRef({}), u = B.useRef(t), c = B.useRef("none"), f = (s = rR((r = t ? "mounted" : "unmounted", n = {
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
                    }, B.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], p = s[1], B.useEffect(function() {
                        var e = rD(l.current);
                        c.current = "mounted" === f ? e : "none"
                    }, [f]), ra(function() {
                        var e = l.current,
                            r = u.current;
                        if (r !== t) {
                            var n = c.current,
                                o = rD(e);
                            t ? p("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? p("UNMOUNT") : r && n !== o ? p("ANIMATION_OUT") : p("UNMOUNT"), u.current = t
                        }
                    }, [t, p]), ra(function() {
                        if (i) {
                            var e, t, r = null != (e = i.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = rD(l.current).includes(e.animationName);
                                    if (e.target === i && n && (p("ANIMATION_END"), !u.current)) {
                                        var o = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === i && (c.current = rD(l.current))
                                };
                            return i.addEventListener("animationstart", o), i.addEventListener("animationcancel", n), i.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), i.removeEventListener("animationstart", o), i.removeEventListener("animationcancel", n), i.removeEventListener("animationend", n)
                                }
                        }
                        p("ANIMATION_END")
                    }, [i, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: B.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    w = "function" == typeof g ? g({
                        present: O.isPresent
                    }) : B.Children.only(g),
                    S = t9(O.ref, (b = (m = null == (h = Object.getOwnPropertyDescriptor((d = w).props, "ref")) ? void 0 : h.get) && "isReactWarning" in m && m.isReactWarning) ? d.ref : (b = (m = null == (y = Object.getOwnPropertyDescriptor(d, "ref")) ? void 0 : y.get) && "isReactWarning" in m && m.isReactWarning) ? d.props.ref : d.props.ref || d.ref);
                return "function" == typeof g || O.isPresent ? B.cloneElement(w, {
                    ref: S
                }) : null
            };

            function rD(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            rN.displayName = "Presence";
            var rM = window.RadixUI["react-focus-guards"],
                rL = function() {
                    return (rL = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }).apply(this, arguments)
                };

            function rk(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var o = 0, n = Object.getOwnPropertySymbols(e); o < n.length; o++) 0 > t.indexOf(n[o]) && Object.prototype.propertyIsEnumerable.call(e, n[o]) && (r[n[o]] = e[n[o]]);
                return r
            }
            var rU = "right-scroll-bar-position",
                rB = "width-before-scroll-bar";

            function rH(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var rF = "u" > typeof window ? B.useLayoutEffect : B.useEffect,
                rV = new WeakMap,
                rW = (void 0 === c && (c = {}), (void 0 === s && (s = function(e) {
                    return e
                }), f = [], p = !1, d = {
                    read: function() {
                        if (p) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return f.length ? f[f.length - 1] : null
                    },
                    useMedium: function(e) {
                        var t = s(e, p);
                        return f.push(t),
                            function() {
                                f = f.filter(function(e) {
                                    return e !== t
                                })
                            }
                    },
                    assignSyncMedium: function(e) {
                        for (p = !0; f.length;) {
                            var t = f;
                            f = [], t.forEach(e)
                        }
                        f = {
                            push: function(t) {
                                return e(t)
                            },
                            filter: function() {
                                return f
                            }
                        }
                    },
                    assignMedium: function(e) {
                        p = !0;
                        var t = [];
                        if (f.length) {
                            var r = f;
                            f = [], r.forEach(e), t = f
                        }
                        var n = function() {
                                var r = t;
                                t = [], r.forEach(e)
                            },
                            o = function() {
                                return Promise.resolve().then(n)
                            };
                        o(), f = {
                            push: function(e) {
                                t.push(e), o()
                            },
                            filter: function(e) {
                                return t = t.filter(e), f
                            }
                        }
                    }
                }).options = rL({
                    async: !0,
                    ssr: !1
                }, c), d),
                rG = function() {},
                rY = B.forwardRef(function(e, t) {
                    var r, n, o, i, a = B.useRef(null),
                        l = B.useState({
                            onScrollCapture: rG,
                            onWheelCapture: rG,
                            onTouchMoveCapture: rG
                        }),
                        u = l[0],
                        c = l[1],
                        s = e.forwardProps,
                        f = e.children,
                        p = e.className,
                        d = e.removeScrollBar,
                        h = e.enabled,
                        y = e.shards,
                        m = e.sideCar,
                        b = e.noRelative,
                        v = e.noIsolation,
                        g = e.inert,
                        O = e.allowPinchZoom,
                        w = e.as,
                        S = e.gapMode,
                        E = rk(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        A = (r = [a, t], n = function(e) {
                            return r.forEach(function(t) {
                                return rH(t, e)
                            })
                        }, (o = (0, B.useState)(function() {
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
                        })[0]).callback = n, i = o.facade, rF(function() {
                            var e = rV.get(i);
                            if (e) {
                                var t = new Set(e),
                                    n = new Set(r),
                                    o = i.current;
                                t.forEach(function(e) {
                                    n.has(e) || rH(e, null)
                                }), n.forEach(function(e) {
                                    t.has(e) || rH(e, o)
                                })
                            }
                            rV.set(i, r)
                        }, [r]), i),
                        P = rL(rL({}, E), u);
                    return B.createElement(B.Fragment, null, h && B.createElement(m, {
                        sideCar: rW,
                        removeScrollBar: d,
                        shards: y,
                        noRelative: b,
                        noIsolation: v,
                        inert: g,
                        setCallbacks: c,
                        allowPinchZoom: !!O,
                        lockRef: a,
                        gapMode: S
                    }), s ? B.cloneElement(B.Children.only(f), rL(rL({}, P), {
                        ref: A
                    })) : B.createElement(void 0 === w ? "div" : w, rL({}, P, {
                        className: p,
                        ref: A
                    }), f))
                });
            rY.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, rY.classNames = {
                fullWidth: rB,
                zeroRight: rU
            };
            var rK = function(e) {
                var t = e.sideCar,
                    r = rk(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var n = t.read();
                if (!n) throw Error("Sidecar medium not found");
                return B.createElement(n, rL({}, r))
            };
            rK.isSideCarExport = !0;
            var rz = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(n) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = C || r.nc;
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
                rX = function() {
                    var e = rz();
                    return function(t, r) {
                        B.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && r])
                    }
                },
                r$ = function() {
                    var e = rX();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                rZ = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                rq = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                rJ = function(e) {
                    var t = window.getComputedStyle(document.body),
                        r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        n = t["padding" === e ? "paddingTop" : "marginTop"],
                        o = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [rq(r), rq(n), rq(o)]
                },
                rQ = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return rZ;
                    var t = rJ(e),
                        r = document.documentElement.clientWidth,
                        n = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, n - r + t[2] - t[0])
                    }
                },
                r0 = r$(),
                r1 = "data-scroll-locked",
                r2 = function(e, t, r, n) {
                    var o = e.left,
                        i = e.top,
                        a = e.right,
                        l = e.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(l, "px ").concat(n, ";\n  }\n  body[").concat(r1, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(rU, " {\n    right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(rB, " {\n    margin-right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(rU, " .").concat(rU, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(rB, " .").concat(rB, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(r1, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                r3 = function() {
                    var e = parseInt(document.body.getAttribute(r1) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                r6 = function() {
                    B.useEffect(function() {
                        return document.body.setAttribute(r1, (r3() + 1).toString()),
                            function() {
                                var e = r3() - 1;
                                e <= 0 ? document.body.removeAttribute(r1) : document.body.setAttribute(r1, e.toString())
                            }
                    }, [])
                },
                r8 = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        n = e.gapMode,
                        o = void 0 === n ? "margin" : n;
                    r6();
                    var i = B.useMemo(function() {
                        return rQ(o)
                    }, [o]);
                    return B.createElement(r0, {
                        styles: r2(i, !t, o, r ? "" : "!important")
                    })
                },
                r5 = !1;
            if ("u" > typeof window) try {
                var r4 = Object.defineProperty({}, "passive", {
                    get: function() {
                        return r5 = !0, !0
                    }
                });
                window.addEventListener("test", r4, r4), window.removeEventListener("test", r4, r4)
            } catch (e) {
                r5 = !1
            }
            var r7 = !!r5 && {
                passive: !1
            };

            function r9(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var ne = function(e, t) {
                    if (!r9(e, Element)) return !1;
                    var r = window.getComputedStyle(e);
                    return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
                },
                nt = function(e, t) {
                    var r = t.ownerDocument,
                        n = t;
                    do {
                        if ("u" > typeof ShadowRoot && r9(n, ShadowRoot) && (n = n.host), nr(e, n)) {
                            var o = nn(e, n);
                            if (o[1] > o[2]) return !0
                        }
                        n = n.parentNode
                    } while (n && n !== r.body);
                    return !1
                },
                nr = function(e, t) {
                    return "v" === e ? ne(t, "overflowY") : ne(t, "overflowX")
                },
                nn = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                no = function(e, t, r, n, o) {
                    var i, a = (i = window.getComputedStyle(t).direction, "h" === e && "rtl" === i ? -1 : 1),
                        l = a * n,
                        u = r.target,
                        c = t.contains(u),
                        s = !1,
                        f = l > 0,
                        p = 0,
                        d = 0;
                    do {
                        if (!u) break;
                        var h = nn(e, u),
                            y = h[0],
                            m = h[1] - h[2] - a * y;
                        (y || m) && nr(e, u) && (p += m, d += y);
                        var b = u.parentNode;
                        u = b && b.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? b.host : b
                    } while (!c && u !== document.body || c && (t.contains(u) || t === u));
                    return f && (o && 1 > Math.abs(p) || !o && l > p) ? s = !0 : !f && (o && 1 > Math.abs(d) || !o && -l > d) && (s = !0), s
                },
                ni = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                na = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                nl = function(e) {
                    return e && "current" in e ? e.current : e
                },
                nu = 0,
                nc = [],
                ns = (h = function(e) {
                    var t = B.useRef([]),
                        r = B.useRef([0, 0]),
                        n = B.useRef(),
                        o = B.useState(nu++)[0],
                        i = B.useState(r$)[0],
                        a = B.useRef(e);
                    B.useEffect(function() {
                        a.current = e
                    }, [e]), B.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(o));
                            var t = (function(e, t, r) {
                                if (r || 2 == arguments.length)
                                    for (var n, o = 0, i = t.length; o < i; o++) !n && o in t || (n || (n = Array.prototype.slice.call(t, 0, o)), n[o] = t[o]);
                                return e.concat(n || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(nl), !0).filter(Boolean);
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
                    var l = B.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !a.current.allowPinchZoom;
                            var o, i = ni(e),
                                l = r.current,
                                u = "deltaX" in e ? e.deltaX : l[0] - i[0],
                                c = "deltaY" in e ? e.deltaY : l[1] - i[1],
                                s = e.target,
                                f = Math.abs(u) > Math.abs(c) ? "h" : "v";
                            if ("touches" in e && "h" === f && "range" === s.type) return !1;
                            var p = nt(f, s);
                            if (!p) return !0;
                            if (p ? o = f : (o = "v" === f ? "h" : "v", p = nt(f, s)), !p) return !1;
                            if (!n.current && "changedTouches" in e && (u || c) && (n.current = o), !o) return !0;
                            var d = n.current || o;
                            return no(d, t, e, "h" === d ? u : c, !0)
                        }, []),
                        u = B.useCallback(function(e) {
                            if (nc.length && nc[nc.length - 1] === i) {
                                var r = "deltaY" in e ? na(e) : ni(e),
                                    n = t.current.filter(function(t) {
                                        var n;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                                    })[0];
                                if (n && n.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!n) {
                                    var o = (a.current.shards || []).map(nl).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (o.length > 0 ? l(e, o[0]) : !a.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        c = B.useCallback(function(e, r, n, o) {
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
                        s = B.useCallback(function(e) {
                            r.current = ni(e), n.current = void 0
                        }, []),
                        f = B.useCallback(function(t) {
                            c(t.type, na(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        p = B.useCallback(function(t) {
                            c(t.type, ni(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    B.useEffect(function() {
                        return nc.push(i), e.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: p
                            }), document.addEventListener("wheel", u, r7), document.addEventListener("touchmove", u, r7), document.addEventListener("touchstart", s, r7),
                            function() {
                                nc = nc.filter(function(e) {
                                    return e !== i
                                }), document.removeEventListener("wheel", u, r7), document.removeEventListener("touchmove", u, r7), document.removeEventListener("touchstart", s, r7)
                            }
                    }, []);
                    var d = e.removeScrollBar,
                        h = e.inert;
                    return B.createElement(B.Fragment, null, h ? B.createElement(i, {
                        styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
                    }) : null, d ? B.createElement(r8, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, rW.useMedium(h), rK),
                nf = B.forwardRef(function(e, t) {
                    return B.createElement(rY, rL({}, e, {
                        ref: t,
                        sideCar: ns
                    }))
                });
            nf.classNames = rY.classNames;
            var np = new WeakMap,
                nd = new WeakMap,
                nh = {},
                ny = 0,
                nm = function(e) {
                    return e && (e.host || nm(e.parentNode))
                },
                nb = function(e, t, r, n) {
                    var o = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var r = nm(e);
                        return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    nh[r] || (nh[r] = new WeakMap);
                    var i = nh[r],
                        a = [],
                        l = new Set,
                        u = new Set(o),
                        c = function(e) {
                            !e || l.has(e) || (l.add(e), c(e.parentNode))
                        };
                    o.forEach(c);
                    var s = function(e) {
                        !e || u.has(e) || Array.prototype.forEach.call(e.children, function(e) {
                            if (l.has(e)) s(e);
                            else try {
                                var t = e.getAttribute(n),
                                    o = null !== t && "false" !== t,
                                    u = (np.get(e) || 0) + 1,
                                    c = (i.get(e) || 0) + 1;
                                np.set(e, u), i.set(e, c), a.push(e), 1 === u && o && nd.set(e, !0), 1 === c && e.setAttribute(r, "true"), o || e.setAttribute(n, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return s(t), l.clear(), ny++,
                        function() {
                            a.forEach(function(e) {
                                var t = np.get(e) - 1,
                                    o = i.get(e) - 1;
                                np.set(e, t), i.set(e, o), t || (nd.has(e) || e.removeAttribute(n), nd.delete(e)), o || e.removeAttribute(r)
                            }), --ny || (np = new WeakMap, np = new WeakMap, nd = new WeakMap, nh = {})
                        }
                },
                nv = function(e, t, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var n = Array.from(Array.isArray(e) ? e : [e]),
                        o = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return o ? (n.push.apply(n, Array.from(o.querySelectorAll("[aria-live], script"))), nb(n, o, r, "aria-hidden")) : function() {
                        return null
                    }
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

            function nS(e, t) {
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

            function nE(e, t) {
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
            var nA = "Dialog",
                nP = nE(function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        n = function() {
                            var t = r.map(function(e) {
                                return B.createContext(e)
                            });
                            return function(r) {
                                var n = (null == r ? void 0 : r[e]) || t;
                                return B.useMemo(function() {
                                    var t, o;
                                    return rt({}, "__scope".concat(e), (t = rr({}, r), o = null != (o = rt({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
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
                        var o = B.createContext(n),
                            i = r.length;
                        r = ro(r).concat([n]);
                        var a = function(t) {
                            var r, n = t.scope,
                                a = t.children,
                                l = rn(t, ["scope", "children"]),
                                u = (null == n || null == (r = n[e]) ? void 0 : r[i]) || o,
                                c = B.useMemo(function() {
                                    return l
                                }, Object.values(l));
                            return (0, U.jsx)(u.Provider, {
                                value: c,
                                children: a
                            })
                        };
                        return a.displayName = t + "Provider", [a, function(r, a) {
                            var l, u = (null == a || null == (l = a[e]) ? void 0 : l[i]) || o,
                                c = B.useContext(u);
                            if (c) return c;
                            if (void 0 !== n) return n;
                            throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                        }]
                    }, ri.apply(void 0, [n].concat(ro(t)))]
                }(nA), 2),
                nj = nP[0];
            nP[1];
            var nx = nE(nj(nA), 2),
                nT = nx[0],
                n_ = nx[1],
                nI = function(e) {
                    var t, r, n, o, i, a, l, u, c, s, f, p, d, h, y, m, b, v = e.__scopeDialog,
                        g = e.children,
                        O = e.open,
                        w = e.defaultOpen,
                        S = e.onOpenChange,
                        E = e.modal,
                        A = B.useRef(null),
                        P = B.useRef(null),
                        j = nE((c = (u = {
                            prop: O,
                            defaultProp: w,
                            onChange: S
                        }).prop, d = (p = rh((r = (t = {
                            defaultProp: u.defaultProp,
                            onChange: f = void 0 === (s = u.onChange) ? function() {} : s
                        }).defaultProp, n = t.onChange, i = rh(o = B.useState(r), 1)[0], a = B.useRef(i), l = rp(n), B.useEffect(function() {
                            a.current !== i && (l(i), a.current = i)
                        }, [i, a, l]), o), 2))[0], h = p[1], m = (y = void 0 !== c) ? c : d, b = rp(f), [m, B.useCallback(function(e) {
                            if (y) {
                                var t = "function" == typeof e ? e(c) : e;
                                t !== c && b(t)
                            } else h(e)
                        }, [y, c, h, b])]), 2),
                        x = j[0],
                        T = j[1];
                    return (0, U.jsx)(nT, {
                        scope: v,
                        triggerRef: A,
                        contentRef: P,
                        contentId: rs(),
                        titleId: rs(),
                        descriptionId: rs(),
                        open: void 0 !== x && x,
                        onOpenChange: T,
                        onOpenToggle: B.useCallback(function() {
                            return T(function(e) {
                                return !e
                            })
                        }, [T]),
                        modal: void 0 === E || E,
                        children: g
                    })
                };
            nI.displayName = nA;
            var nC = "DialogTrigger";
            B.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = nS(e, ["__scopeDialog"]),
                    o = n_(nC, r),
                    i = t9(t, o.triggerRef);
                return (0, U.jsx)(rT.button, nw(nO({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": o.open,
                    "aria-controls": o.contentId,
                    "data-state": nq(o.open)
                }, n), {
                    ref: i,
                    onClick: t8(e.onClick, o.onOpenToggle)
                }))
            }).displayName = nC;
            var nR = "DialogPortal",
                nN = nE(nj(nR, {
                    forceMount: void 0
                }), 2),
                nD = nN[0],
                nM = nN[1],
                nL = function(e) {
                    var t = e.__scopeDialog,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        i = n_(nR, t);
                    return (0, U.jsx)(nD, {
                        scope: t,
                        forceMount: r,
                        children: B.Children.map(n, function(e) {
                            return (0, U.jsx)(rN, {
                                present: r || i.open,
                                children: (0, U.jsx)(rI, {
                                    asChild: !0,
                                    container: o,
                                    children: e
                                })
                            })
                        })
                    })
                };
            nL.displayName = nR;
            var nk = "DialogOverlay",
                nU = B.forwardRef(function(e, t) {
                    var r = nM(nk, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        i = nS(e, ["forceMount"]),
                        a = n_(nk, e.__scopeDialog);
                    return a.modal ? (0, U.jsx)(rN, {
                        present: o || a.open,
                        children: (0, U.jsx)(nH, nw(nO({}, i), {
                            ref: t
                        }))
                    }) : null
                });
            nU.displayName = nk;
            var nB = rS("DialogOverlay.RemoveScroll"),
                nH = B.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = nS(e, ["__scopeDialog"]),
                        o = n_(nk, r);
                    return (0, U.jsx)(nf, {
                        as: nB,
                        allowPinchZoom: !0,
                        shards: [o.contentRef],
                        children: (0, U.jsx)(rT.div, nw(nO({
                            "data-state": nq(o.open)
                        }, n), {
                            ref: t,
                            style: nO({
                                pointerEvents: "auto"
                            }, n.style)
                        }))
                    })
                }),
                nF = "DialogContent",
                nV = B.forwardRef(function(e, t) {
                    var r = nM(nF, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        i = nS(e, ["forceMount"]),
                        a = n_(nF, e.__scopeDialog);
                    return (0, U.jsx)(rN, {
                        present: o || a.open,
                        children: a.modal ? (0, U.jsx)(nW, nw(nO({}, i), {
                            ref: t
                        })) : (0, U.jsx)(nG, nw(nO({}, i), {
                            ref: t
                        }))
                    })
                });
            nV.displayName = nF;
            var nW = B.forwardRef(function(e, t) {
                    var r = n_(nF, e.__scopeDialog),
                        n = B.useRef(null),
                        o = t9(t, r.contentRef, n);
                    return B.useEffect(function() {
                        var e = n.current;
                        if (e) return nv(e)
                    }, []), (0, U.jsx)(nY, nw(nO({}, e), {
                        ref: o,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: t8(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: t8(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                r = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || r) && e.preventDefault()
                        }),
                        onFocusOutside: t8(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                nG = B.forwardRef(function(e, t) {
                    var r = n_(nF, e.__scopeDialog),
                        n = B.useRef(!1),
                        o = B.useRef(!1);
                    return (0, U.jsx)(nY, nw(nO({}, e), {
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
                nY = B.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        i = e.onCloseAutoFocus,
                        a = nS(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = n_(nF, r),
                        u = B.useRef(null),
                        c = t9(t, u);
                    return (0, rM.useFocusGuards)(), (0, U.jsxs)(U.Fragment, {
                        children: [(0, U.jsx)(rm.FocusScope, {
                            asChild: !0,
                            loop: !0,
                            trapped: n,
                            onMountAutoFocus: o,
                            onUnmountAutoFocus: i,
                            children: (0, U.jsx)(ry.DismissableLayer, nw(nO({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": nq(l.open)
                            }, a), {
                                ref: c,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, U.jsxs)(U.Fragment, {
                            children: [(0, U.jsx)(n1, {
                                titleId: l.titleId
                            }), (0, U.jsx)(n2, {
                                contentRef: u,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                nK = "DialogTitle",
                nz = B.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = nS(e, ["__scopeDialog"]),
                        o = n_(nK, r);
                    return (0, U.jsx)(rT.h2, nw(nO({
                        id: o.titleId
                    }, n), {
                        ref: t
                    }))
                });
            nz.displayName = nK;
            var nX = "DialogDescription";
            B.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = nS(e, ["__scopeDialog"]),
                    o = n_(nX, r);
                return (0, U.jsx)(rT.p, nw(nO({
                    id: o.descriptionId
                }, n), {
                    ref: t
                }))
            }).displayName = nX;
            var n$ = "DialogClose",
                nZ = B.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = nS(e, ["__scopeDialog"]),
                        o = n_(n$, r);
                    return (0, U.jsx)(rT.button, nw(nO({
                        type: "button"
                    }, n), {
                        ref: t,
                        onClick: t8(e.onClick, function() {
                            return o.onOpenChange(!1)
                        })
                    }))
                });

            function nq(e) {
                return e ? "open" : "closed"
            }
            nZ.displayName = n$;
            var nJ = "DialogTitleWarning",
                nQ = nE((y = {
                    contentName: nF,
                    titleName: nK,
                    docsSlug: "dialog"
                }, m = B.createContext(y), (b = function(e) {
                    var t = e.children,
                        r = rn(e, ["children"]),
                        n = B.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, U.jsx)(m.Provider, {
                        value: n,
                        children: t
                    })
                }).displayName = nJ + "Provider", [b, function(e) {
                    var t = B.useContext(m);
                    if (t) return t;
                    if (void 0 !== y) return y;
                    throw Error("`".concat(e, "` must be used within `").concat(nJ, "`"))
                }]), 2),
                n0 = (nQ[0], nQ[1]),
                n1 = function(e) {
                    var t = e.titleId,
                        r = n0(nJ),
                        n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return B.useEffect(function() {
                        t && (document.getElementById(t) || console.error(n))
                    }, [n, t]), null
                },
                n2 = function(e) {
                    var t = e.contentRef,
                        r = e.descriptionId,
                        n = n0("DialogDescriptionWarning"),
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
                    return B.useEffect(function() {
                        var e, n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        r && n && (document.getElementById(r) || console.warn(o))
                    }, [o, t, r]), null
                };

            function n3(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function n6(e) {
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

            function n8(e, t) {
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

            function n4(e) {
                return function(e) {
                    if (Array.isArray(e)) return n3(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return n3(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return n3(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var n7 = Symbol("radix.slottable");

            function n9(e) {
                return B.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === n7
            }

            function oe(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function ot(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        oe(e, t, r[t])
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
            var on = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r, n, o, i, a, l = (r = o = "Primitive.".concat(t), (n = B.forwardRef(function(e, t) {
                        var r = e.children,
                            n = n5(e, ["children"]);
                        if (B.isValidElement(r)) {
                            var o, i, a, l, u, c = (u = (l = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = n6({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            i = t[n];
                                        /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = i.apply(void 0, n4(t));
                                            return o.apply(void 0, n4(t)), n
                                        } : o && (r[n] = o) : "style" === n ? r[n] = n6({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                    }(n);
                                    return n6({}, e, r)
                                }(n, r.props);
                            return r.type !== B.Fragment && (s.ref = t ? t7(t, c) : c), B.cloneElement(r, s)
                        }
                        return B.Children.count(r) > 1 ? B.Children.only(null) : null
                    })).displayName = "".concat(r, ".SlotClone"), i = n, (a = B.forwardRef(function(e, t) {
                        var r = e.children,
                            n = n5(e, ["children"]),
                            o = B.Children.toArray(r),
                            a = o.find(n9);
                        if (a) {
                            var l = a.props.children,
                                u = o.map(function(e) {
                                    return e !== a ? e : B.Children.count(l) > 1 ? B.Children.only(null) : B.isValidElement(l) ? l.props.children : null
                                });
                            return (0, U.jsx)(i, n8(n6({}, n), {
                                ref: t,
                                children: B.isValidElement(l) ? B.cloneElement(l, void 0, u) : null
                            }))
                        }
                        return (0, U.jsx)(i, n8(n6({}, n), {
                            ref: t,
                            children: r
                        }))
                    })).displayName = "".concat(o, ".Slot"), a),
                    u = B.forwardRef(function(e, r) {
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
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, U.jsx)(i, or(ot({}, o), {
                            ref: r
                        }))
                    });
                return u.displayName = "Primitive.".concat(t), or(ot({}, e), oe({}, t, u))
            }, {});

            function oo(e) {
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
            var oi = Object.freeze({
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
                oa = B.forwardRef(function(e, t) {
                    var r, n;
                    return (0, U.jsx)(on.span, (r = oo({}, e), n = n = {
                        ref: t,
                        style: oo({}, oi, e.style)
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

            function ol(e) {
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
            oa.displayName = "VisuallyHidden";
            var oc = (0, B.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                os = function() {
                    var e = (0, B.useContext)(oc);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                of = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                op = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                od = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                oh = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.children,
                        o = e.size,
                        i = e.type,
                        a = void 0 === i ? "Default" : i,
                        l = e.isModal,
                        u = e.hasCloseAffordance,
                        c = e.closeLabel,
                        s = e.hasMarginTop,
                        f = void 0 === s || s,
                        p = e.hasMarginBottom,
                        d = void 0 === p || p,
                        h = e.hasDescription,
                        y = void 0 !== h && h,
                        m = e.experimentalDisablePointerEventsStylingOnBody,
                        b = void 0 !== m && m,
                        v = (0, B.useMemo)(function() {
                            return {
                                size: o,
                                isModal: l,
                                type: a,
                                hasCloseAffordance: u,
                                closeLabel: c,
                                hasMarginTop: f,
                                hasMarginBottom: d,
                                hasDescription: y
                            }
                        }, [o, l, a, u, c, f, d, y]);
                    return (0, B.useEffect)(function() {
                        b && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [b, t]), H().createElement(oc.Provider, {
                        value: v
                    }, H().createElement(nI, {
                        open: t,
                        onOpenChange: r
                    }, n))
                };
            oh.displayName = "Dialog";
            var oy = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.style,
                    o = e.overlayClassName,
                    i = e.overlayStyle,
                    a = e.onOpenAutoFocus,
                    l = ou(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    u = os(),
                    c = u.size,
                    s = u.isModal,
                    f = u.hasCloseAffordance,
                    p = u.closeLabel,
                    d = u.hasDescription,
                    h = tz("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", s && "bg-common-backdrop", o),
                    y = tz("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return H().createElement(nL, null, H().createElement(nU, {
                    className: h,
                    style: i
                }, H().createElement(nV, ol({
                    className: y,
                    "data-size": c,
                    style: n,
                    onOpenAutoFocus: a
                }, !d && {
                    "aria-describedby": void 0
                }, l), f && H().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, H().createElement(nZ, {
                    asChild: !0
                }, H().createElement(t6, {
                    variant: "OverMedia",
                    size: c,
                    isCircular: !0,
                    "aria-label": p
                }))), t)))
            };
            oy.displayName = "DialogContent";
            var om = function(e) {
                var t = e.children,
                    r = e.className,
                    n = ou(e, ["children", "className"]),
                    o = os(),
                    i = o.size,
                    a = o.hasMarginTop,
                    l = o.hasMarginBottom,
                    u = tz(of [i], a && op[i], l && od[i], r);
                return H().createElement("div", ol({
                    className: u
                }, n), t)
            };
            om.displayName = "DialogBody";
            var ob = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.hidden,
                    o = ou(e, ["children", "className", "hidden"]),
                    i = H().createElement(nz, ol({
                        className: r
                    }, o), t);
                return n ? H().createElement(oa, null, i) : i
            };
            ob.displayName = "DialogTitle";
            var ov = function(e) {
                var t = e.children,
                    r = e.className,
                    n = ou(e, ["children", "className"]),
                    o = os().size,
                    i = tz(of [o], od[o], r);
                return H().createElement("div", ol({
                    className: i
                }, n), t)
            };
            ov.displayName = "DialogFooter";
            var og = function(e) {
                    return e.preventDefault()
                },
                oO = function(e) {
                    var t, r, n = e.open,
                        o = e.onClose,
                        i = e.isKeyboardDismissible,
                        a = e.isBackdropDismissible,
                        l = void 0 !== a && a,
                        u = e.hiddenTitle,
                        c = e.className,
                        s = e.children;
                    return (0, U.jsx)(oh, {
                        open: n,
                        onOpenChange: function(e) {
                            e || o()
                        },
                        size: "Medium",
                        isModal: !0,
                        hasMarginTop: !1,
                        hasMarginBottom: !1,
                        hasCloseAffordance: !1,
                        experimentalDisablePointerEventsStylingOnBody: !0,
                        children: (0, U.jsxs)(oy, (t = function(e) {
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
                            className: "challenge-dialog challenge-text-base".concat(c ? " ".concat(c) : ""),
                            "data-testid": "challenge-dialog"
                        }, {
                            onPointerDownOutside: l ? void 0 : og,
                            onInteractOutside: l ? void 0 : og,
                            onEscapeKeyDown: void 0 === i || i ? void 0 : og
                        }), r = r = {
                            children: [void 0 !== u && (0, U.jsx)(ob, {
                                hidden: !0,
                                children: u
                            }), s]
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
                ow = "opacity-[0.5]",
                oS = function(e) {
                    var t = e.width,
                        r = e.height;
                    return H().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, H().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function oE(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oA(e) {
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

            function oP(e, t) {
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

            function oj(e, t) {
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

            function ox(e) {
                return function(e) {
                    if (Array.isArray(e)) return oE(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return oE(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oE(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oT(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var o_ = Symbol.for("react.lazy"),
                oI = B[" use ".trim().toString()];

            function oC(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : oT(e)) === "object" && "$$typeof" in e && e.$$typeof === o_ && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : oT(t)) === "object" && null !== t && "then" in t
            }
            var oR = ((e = B.forwardRef(function(e, t) {
                    var r = e.children,
                        n = oj(e, ["children"]);
                    if (oC(r) && "function" == typeof oI && (r = oI(r._payload)), B.isValidElement(r)) {
                        var o, i, a, l, u, c = (u = (l = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                            s = function(e, t) {
                                var r = oA({}, t);
                                for (var n in t) ! function(n) {
                                    var o = e[n],
                                        i = t[n];
                                    /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = i.apply(void 0, ox(t));
                                        return o.apply(void 0, ox(t)), n
                                    } : o && (r[n] = o) : "style" === n ? r[n] = oA({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                }(n);
                                return oA({}, e, r)
                            }(n, r.props);
                        return r.type !== B.Fragment && (s.ref = t ? t7(t, c) : c), B.cloneElement(r, s)
                    }
                    return B.Children.count(r) > 1 ? B.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), v = e, (g = B.forwardRef(function(e, t) {
                    var r = e.children,
                        n = oj(e, ["children"]);
                    oC(r) && "function" == typeof oI && (r = oI(r._payload));
                    var o = B.Children.toArray(r),
                        i = o.find(oD);
                    if (i) {
                        var a = i.props.children,
                            l = o.map(function(e) {
                                return e !== i ? e : B.Children.count(a) > 1 ? B.Children.only(null) : B.isValidElement(a) ? a.props.children : null
                            });
                        return (0, U.jsx)(v, oP(oA({}, n), {
                            ref: t,
                            children: B.isValidElement(a) ? B.cloneElement(a, void 0, l) : null
                        }))
                    }
                    return (0, U.jsx)(v, oP(oA({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), g),
                oN = Symbol("radix.slottable");

            function oD(e) {
                return B.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === oN
            }

            function oM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oL(e) {
                if (Array.isArray(e)) return e
            }

            function ok() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function oU(e) {
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

            function oB(e, t) {
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

            function oH(e, t) {
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

            function oF(e, t) {
                if (e) {
                    if ("string" == typeof e) return oM(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oM(e, t)
                }
            }
            var oV = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                oW = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                oG = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                oY = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                oK = (0, B.forwardRef)(function(e, t) {
                    var r, n = oL(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || oF(r) || ok(),
                        o = n[0],
                        i = n.slice(1),
                        a = o.children,
                        l = o.className,
                        u = o.style,
                        c = o.isDisabled,
                        s = void 0 !== c && c,
                        f = o.isLoading,
                        p = void 0 !== f && f,
                        d = o.icon,
                        h = o.size,
                        y = void 0 === h ? "Large" : h,
                        m = o.variant,
                        b = void 0 === m ? "Emphasis" : m,
                        v = o.asChild,
                        g = oH(o, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        O = (oL(i) || function(e) {
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
                        }(i) || oF(i, 1) || ok())[0],
                        w = tz("foundation-web-button", s ? ow : [tX, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", oW[y], s ? oY[b] : oG[b], l),
                        S = oU({
                            textDecoration: "none"
                        }, u),
                        E = function(e) {
                            return H().createElement(H().Fragment, null, H().createElement(t$, null), p && H().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, H().createElement(oS, {
                                width: oV[y],
                                height: oV[y]
                            })), H().createElement("span", {
                                className: tz("flex items-center min-width-0", "Large" === y || "Medium" === y ? "gap-small" : "gap-xsmall", p && "invisible")
                            }, d && H().createElement(t1, {
                                name: d,
                                size: y
                            }), H().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (v) {
                        g.as;
                        var A = oH(g, ["as"]),
                            P = H().Children.only(a);
                        return H().createElement(oR, oB(oU({
                            ref: O
                        }, A), {
                            className: w,
                            style: S,
                            "aria-disabled": s || void 0
                        }), H().cloneElement(P, {}, E(P.props.children)))
                    }
                    if ("a" === g.as) {
                        g.as;
                        var j = g.href,
                            x = oH(g, ["as", "href"]);
                        return H().createElement("a", oB(oU({
                            ref: O
                        }, x), {
                            "aria-disabled": s,
                            href: s ? void 0 : j,
                            className: w,
                            style: S
                        }), E(a))
                    }
                    g.as;
                    var T = oH(g, ["as"]);
                    return H().createElement("button", oB(oU({
                        ref: O,
                        type: "button"
                    }, T), {
                        disabled: s,
                        className: w,
                        style: S
                    }), E(a))
                });

            function oz(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oX(e) {
                if (Array.isArray(e)) return e
            }

            function o$() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function oZ(e, t) {
                if (e) {
                    if ("string" == typeof e) return oz(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oz(e, t)
                }
            }
            var oq = {
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
                oJ = H().forwardRef(function(e, t) {
                    var r, n = oX(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || oZ(r) || o$(),
                        o = n[0],
                        i = n.slice(1),
                        a = o.className,
                        l = o.size,
                        u = void 0 === l ? "Large" : l,
                        c = o.variant,
                        s = o.value,
                        f = o.showValue,
                        p = void 0 !== f && f,
                        d = o.ariaLabel,
                        h = function(e, t) {
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
                        y = (oX(i) || function(e) {
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
                        }(i) || oZ(i, 1) || o$())[0],
                        m = oq[u],
                        b = m.dimension,
                        v = m.strokeWidth,
                        g = m.textClass,
                        O = m.valueContainerSize,
                        w = (b - v) / 2,
                        S = 2 * Math.PI * w,
                        E = b / 2,
                        A = Math.min(100, Math.max(0, void 0 === s ? 0 : s)),
                        P = p && void 0 !== O ? O : b,
                        j = "Determinate" === (void 0 === c ? "Determinate" : c);
                    return H().createElement("div", function(e) {
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
                        className: tz("foundation-web-progress-circle inline-flex items-center justify-center", a),
                        role: "progressbar",
                        "aria-label": d,
                        "aria-valuemin": j ? 0 : void 0,
                        "aria-valuemax": j ? 100 : void 0,
                        "aria-valuenow": j ? A : void 0,
                        style: {
                            width: P,
                            height: P
                        }
                    }, h), H().createElement("svg", {
                        width: b,
                        height: b,
                        viewBox: "0 0 ".concat(b, " ").concat(b),
                        className: "relative"
                    }, H().createElement("circle", {
                        cx: E,
                        cy: E,
                        r: w,
                        fill: "none",
                        strokeWidth: v,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), H().createElement("circle", {
                        cx: E,
                        cy: E,
                        r: w,
                        fill: "none",
                        strokeWidth: v,
                        strokeDasharray: j ? S : "".concat(.75 * S, " ").concat(.25 * S),
                        strokeDashoffset: j ? S * (1 - A / 100) : 0,
                        strokeLinecap: "round",
                        className: tz(!j && "foundation-web-progress-circle-indeterminate"),
                        style: j ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), j && p && "Large" === u && H().createElement("div", {
                        className: tz("absolute content-emphasis flex items-center justify-center", g),
                        "aria-hidden": "true"
                    }, H().createElement("span", null, Math.round(A)), H().createElement("span", null, "%")))
                });
            oJ.displayName = "ProgressCircle";
            var oQ = "Account Security Prompt:",
                o0 = "account-security-prompt-container",
                o1 = "authpopup",
                o2 = "emailhighlight",
                o3 = "/my/account#!/security?src=",
                o6 = "https://en.help.roblox.com/hc/articles/212459863-Add-2-Step-Verification-to-Your-Account",
                o8 = "modalStateViewed";

            function o5(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var o4 = "__FN_nvfToKPAOuiV__",
                o7 = "__FN_END_nvfToKPAOuiV__",
                o9 = new RegExp("".concat(o4, "(\\d+)\\|")),
                ie = new RegExp("".concat(o7, "(\\d+)\\|")),
                it = function(e, t, r) {
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
                            i = "".concat(o4).concat(r, "|"),
                            a = "".concat(o7).concat(r, "|");
                        n[e.opening] = i, n[e.closing] = a, o[r] = {
                            start: i,
                            end: a,
                            render: e.render
                        }
                    });
                    var i = function(e) {
                            var t = [],
                                r = o9.exec(e),
                                n = ie.exec(e);
                            if (n && (!r || n.index < r.index)) return null;
                            if (!r) return [e];
                            r.index > 0 && t.push(e.slice(0, r.index));
                            var a = null == r[1] ? void 0 : o[r[1]];
                            if (null == a) return null;
                            var l = e.indexOf(a.end);
                            if (l < r.index + r[0].length) return null;
                            var u = i(e.slice(r.index + r[0].length, l));
                            if (null == u) return null;
                            t.push(a.render(u));
                            var c = e.slice(l + a.end.length);
                            if (c.length > 0) {
                                var s = i(c);
                                if (null == s) return null;
                                t.push.apply(t, function(e) {
                                    if (Array.isArray(e)) return o5(e)
                                }(s) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(s) || function(e) {
                                    if (e) {
                                        if ("string" == typeof e) return o5(e, void 0);
                                        var t = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return o5(e, void 0)
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
                        return (0, U.jsx)(B.Fragment, {
                            children: e
                        }, t)
                    })
                };

            function ir(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function io(e) {
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

            function ii(e, t) {
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
                        if ("string" == typeof e) return ir(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ir(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function il(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function iu() {
                return null != R || (R = "".concat(tk().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), R
            }
            var ic = function() {};

            function is(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ip(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var id = function(e, t) {
                    return e << 3 | t
                },
                ih = id(1, 2),
                iy = id(2, 2),
                im = id(5, 2),
                ib = id(6, 2),
                iv = id(8, 2),
                ig = id(1, 2),
                iO = id(2, 1),
                iw = id(3, 0),
                iS = id(5, 2);
            id(1, 2), id(2, 1), id(3, 0), id(4, 2), id(5, 2), id(6, 0), id(8, 2);
            var iE = id(4, 0),
                iA = id(6, 2),
                iP = id(7, 2);
            id(1, 0), id(2, 2);
            var ij = id(1, 2),
                ix = id(2, 2),
                iT = id(1, 2);
            id(1, 2), id(2, 2), id(1, 2);
            var i_ = new TextEncoder,
                iI = function() {
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
                                var t = (void 0 === e ? "undefined" : ip(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                                for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                                this.buf.push(Number(t))
                            }
                        }, {
                            key: "writeString",
                            value: function(e) {
                                var t = i_.encode(e);
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

            function iC(e, t, r) {
                var n = new iI;
                return n.writeVarint(id(1, 2)), n.writeString(e), n.writeVarint(t), r(n), n.toBytes()
            }

            function iR(e) {
                var t = new iI;
                if (t.writeVarint(ig), t.writeString(e.name), t.writeVarint(iO), t.writeDouble(e.value), t.writeVarint(iw), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var r = function(e) {
                        var t = new iI,
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
                                            if ("string" == typeof e) return is(e, 2);
                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return is(e, 2)
                                        }
                                    }(e) || function() {
                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                    }()),
                                    n = r[0],
                                    o = r[1];
                                if ("string" == typeof o) {
                                    var a = iC(n, id(2, 2), function(e) {
                                        e.writeString(o)
                                    });
                                    t.writeVarint(im), t.writeBytes(a)
                                } else if ("boolean" == typeof o) {
                                    var l = iC(n, id(2, 0), function(e) {
                                        e.writeVarint(+!!o)
                                    });
                                    t.writeVarint(ib), t.writeBytes(l)
                                } else if ((void 0 === o ? "undefined" : ip(o)) === "bigint") {
                                    var u = iC(n, id(2, 0), function(e) {
                                        e.writeVarint(o)
                                    });
                                    t.writeVarint(iy), t.writeBytes(u)
                                } else if ("number" == typeof o)
                                    if (Number.isFinite(o))
                                        if (Number.isInteger(o) && o >= -0x80000000 && o <= 0x7fffffff) {
                                            var c = iC(n, id(2, 0), function(e) {
                                                e.writeVarint(o)
                                            });
                                            t.writeVarint(ih), t.writeBytes(c)
                                        } else if (Number.isInteger(o)) {
                                    var s = iC(n, id(2, 0), function(e) {
                                        e.writeVarint(BigInt(o))
                                    });
                                    t.writeVarint(iy), t.writeBytes(s)
                                } else {
                                    var f = iC(n, id(2, 1), function(e) {
                                        e.writeDouble(o)
                                    });
                                    t.writeVarint(iv), t.writeBytes(f)
                                } else {
                                    var p = iC(n, id(2, 2), function(e) {
                                        e.writeString(String(o))
                                    });
                                    t.writeVarint(im), t.writeBytes(p)
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
                    t.writeVarint(iS), t.writeBytes(r)
                }
                return t.toBytes()
            }

            function iN(e, t, r) {
                var n = new iI;
                n.writeVarint(iE), n.writeVarint(r);
                var o = !0,
                    i = !1,
                    a = void 0;
                try {
                    for (var l, u = e[Symbol.iterator](); !(o = (l = u.next()).done); o = !0) {
                        var c = l.value;
                        n.writeVarint(iA), n.writeBytes(c)
                    }
                } catch (e) {
                    i = !0, a = e
                } finally {
                    try {
                        o || null == u.return || u.return()
                    } finally {
                        if (i) throw a
                    }
                }
                var s = !0,
                    f = !1,
                    p = void 0;
                try {
                    for (var d, h = t[Symbol.iterator](); !(s = (d = h.next()).done); s = !0) {
                        var y = d.value;
                        n.writeVarint(iP), n.writeBytes(y)
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

            function iD(e) {
                var t = new iI;
                t.writeVarint(ij), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(ix), t.writeBytes(e);
                var r = t.toBytes(),
                    n = new iI;
                return n.writeVarint(iT), n.writeBytes(r), n.toBytes()
            }
            var iM = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function iL(e) {
                return iM.test(e)
            }
            var ik = [],
                iU = !1,
                iB = !1;

            function iH(e, t) {
                var r, n, o, i = e.map(function(e) {
                        return {
                            name: e.name,
                            value: e.value,
                            timestampMs: e.timestampMs,
                            attributes: e.attributes
                        }
                    }),
                    a = BigInt(Date.now());
                !0 === t || iB || "u" > typeof document && "hidden" === document.visibilityState ? (r = iD(iN(i.map(iR), [], a)).buffer, fetch("".concat(iu()).concat("/v1/events/single"), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: r,
                    credentials: "include",
                    keepalive: !0
                }).catch(ic)) : (n = iD(iN(i.map(iR), [], a)), (o = function() {
                    var e, t, r, o, i, a, l, u, c, s, f, p, d;
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
                    }(this, function(h) {
                        switch (h.label) {
                            case 0:
                                if ("u" < typeof CompressionStream) return [2, {
                                    body: n.buffer,
                                    compressed: !1
                                }];
                                return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(n).catch(ic), t.close().catch(ic), r = [], [4, (o = e.readable.getReader()).read()];
                            case 1:
                                i = h.sent(), h.label = 2;
                            case 2:
                                if (i.done) return [3, 4];
                                return r.push(i.value), [4, o.read()];
                            case 3:
                                return i = h.sent(), [3, 2];
                            case 4:
                                a = new Uint8Array(r.reduce(function(e, t) {
                                    return e + t.length
                                }, 0)), l = 0, u = !0, c = !1, s = void 0;
                                try {
                                    for (f = r[Symbol.iterator](); !(u = (p = f.next()).done); u = !0) d = p.value, a.set(d, l), l += d.length
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
                            il(i, r, n, a, l, "next", e)
                        }

                        function l(e) {
                            il(i, r, n, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                })()).then(function(e) {
                    var t = e.body,
                        r = e.compressed,
                        n = {
                            "Content-Type": "application/x-protobuf"
                        };
                    return r && (n["Content-Encoding"] = "gzip"), fetch("".concat(iu()).concat("/v1/events/single"), {
                        method: "POST",
                        headers: n,
                        body: t,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(ic)
            }

            function iF() {
                var e = !0,
                    t = !1,
                    r = void 0;
                try {
                    for (var n, o = ik[Symbol.iterator](); !(e = (n = o.next()).done); e = !0) {
                        var i = n.value.splice(0);
                        0 !== i.length && iH(i, !0)
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

            function iV(e, t) {
                var r, n, o, i = Math.max(1, null != (r = null == t ? void 0 : t.batchSize) ? r : 10),
                    a = null != (n = null == t ? void 0 : t.batchIntervalMs) ? n : 250;

                function l(e, r) {
                    (null == t ? void 0 : t.onError) ? t.onError(e, r): console.error(e, r)
                }
                if (!iL(e)) return l('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                        name: e
                    }),
                    function() {};
                var u = [];
                return ik.push(u), iU || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                        "hidden" === document.visibilityState && iF()
                    }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                        iB = !0, iF()
                    }), iU = !0),
                    function(t, r, n) {
                        var c = "".concat(e, "_").concat(t);
                        if (! function(e, t) {
                                if (!iL(e)) return !1;
                                if (t) {
                                    var r = !0,
                                        n = !1,
                                        o = void 0;
                                    try {
                                        for (var i, a = Object.keys(t)[Symbol.iterator](); !(r = (i = a.next()).done); r = !0) {
                                            var l = i.value;
                                            if (!iL(l)) return !1
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
                        }), u.length >= i ? (void 0 !== o && (clearTimeout(o), o = void 0), iH(u.splice(0, i))) : void 0 === o && (o = setTimeout(function() {
                            for (o = void 0; u.length > 0;) iH(u.splice(0, i))
                        }, a))
                    }
            }
            var iW = "WwwCommon",
                iG = function(e) {
                    var t = e.publish,
                        r = e.captureException,
                        n = e.featureName;

                    function o(e, t, o) {
                        if (null != o) {
                            var i, a = (null != (i = Error) && "u" > typeof Symbol && i[Symbol.hasInstance] ? !!i[Symbol.hasInstance](o) : o instanceof i) ? o.name || "Error" : "UnknownError",
                                l = n ? "".concat(n, "_").concat(e) : e;
                            return null == r || r(o, {
                                error_counter: l
                            }), ii(io({}, t), {
                                errorType: a
                            })
                        }
                        return t
                    }
                    return {
                        trackCounter: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var o = ia(r, 2);
                            t(o[0], o[1])
                        },
                        trackError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var i = ia(r, 3),
                                a = i[0],
                                l = i[1],
                                u = i[2],
                                c = o(a, ii(io({}, null != l ? l : {}), {
                                    severity: "error"
                                }), u);
                            t(a, c)
                        },
                        trackCriticalError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var i = ia(r, 3),
                                a = i[0],
                                l = i[1],
                                u = i[2],
                                c = o(a, ii(io({}, null != l ? l : {}), {
                                    severity: "critical"
                                }), u);
                            t(a, c)
                        }
                    }
                }({
                    publish: iV(iW)
                });
            iG.trackCounter;
            var iY = iG.trackError;
            iG.trackCriticalError;
            var iK = function() {
                    if ("u" > typeof document) {
                        var e = document.querySelector('meta[name="page-meta"]');
                        return null == e ? void 0 : e.dataset.internalPageName
                    }
                },
                iz = function(e) {
                    return "string" == typeof e && e.length > 0
                },
                iX = function(e, t, r) {
                    var n;
                    "u" > typeof window && iY(e, {
                        key: r,
                        namespace: t,
                        internalPageName: null != (n = iK()) ? n : "unknown"
                    })
                },
                i$ = function(e) {
                    var t, r, n, o, i, a, l, u, c, s, f, p, d, h = (t = tP(e), r = {
                        "!": tb().messages
                    }, n = t ? "!.".concat(t) : "!", i = (o = tb()).cache, a = o.formats, l = o.formatters, u = o.getMessageFallback, c = o.locale, s = o.onError, f = o.timeZone, p = r["!"], d = "!" === n ? void 0 : n.slice(2), f || tv || !tg || (tv = !0, s(new ec(es.ENVIRONMENT_FALLBACK, void 0))), (0, B.useMemo)(function() {
                        var e, t;
                        return t = function(e, t, r) {
                                try {
                                    if (!t) throw Error(void 0);
                                    var n = r ? th(e, t, r) : t;
                                    if (!n) throw Error(r);
                                    return n
                                } catch (e) {
                                    return new ec(es.MISSING_MESSAGE, e.message)
                                }
                            }((e = {
                                cache: i,
                                formatters: l,
                                getMessageFallback: u,
                                messages: p,
                                namespace: d,
                                onError: s,
                                formats: a,
                                locale: c,
                                timeZone: f
                            }).locale, e.messages, e.namespace),
                            function(e) {
                                var t = e.cache,
                                    r = e.formats,
                                    n = e.formatters,
                                    o = e.getMessageFallback,
                                    i = void 0 === o ? tp : o,
                                    a = e.locale,
                                    l = e.messagesOrError,
                                    u = e.namespace,
                                    c = e.onError,
                                    s = e.timeZone,
                                    f = tu(l, ec);

                                function p(e, t, r, n) {
                                    var o = new ec(t, r);
                                    return c(o), null != n ? n : i({
                                        error: o,
                                        key: e,
                                        namespace: u
                                    })
                                }

                                function d(e, o, d, h) {
                                    var y, m, b;
                                    if (f) {
                                        if (!h) return c(l), i({
                                            error: l,
                                            key: e,
                                            namespace: u
                                        });
                                        y = h
                                    } else try {
                                        y = th(a, l, e, u)
                                    } catch (t) {
                                        if (!h) return p(e, es.MISSING_MESSAGE, t.message, h);
                                        y = h
                                    }
                                    try {
                                        var v, g = tf(u, e);
                                        return tl(g, y, o ? (v = {}, Object.keys(o).forEach(function(e) {
                                            var t, r = 0,
                                                n = o[e];
                                            t = "function" == typeof n ? function(t) {
                                                var o = n(t);
                                                return (0, B.isValidElement)(o) ? (0, B.cloneElement)(o, {
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
                                        return tu(t, ec) ? (m = t.code, b = t.originalMessage) : (m = es.FORMATTING_ERROR, b = t.message), p(e, m, b, h)
                                    }
                                }

                                function h(e, t, r, n) {
                                    var o = d(e, t, r, n);
                                    return "string" != typeof o ? p(e, es.INVALID_MESSAGE, void 0) : o
                                }
                                return h.rich = d, h.markup = function(e, t, r, n) {
                                    return d(e, t, r, n)
                                }, h.raw = function(e) {
                                    if (f) return c(l), i({
                                        error: l,
                                        key: e,
                                        namespace: u
                                    });
                                    try {
                                        return th(a, l, e, u)
                                    } catch (t) {
                                        return p(e, es.MISSING_MESSAGE, t.message)
                                    }
                                }, h.has = function(e) {
                                    if (f) return !1;
                                    try {
                                        return th(a, l, e, u), !0
                                    } catch (e) {
                                        return !1
                                    }
                                }, h
                            }(ts(tc({}, e), {
                                messagesOrError: t
                            }))
                    }, [i, l, u, p, d, s, a, c, f]));
                    return (0, B.useMemo)(function() {
                        return Object.assign(function(t, r, n) {
                            var o = tP(t);
                            return void 0 === n || h.has(o) ? h(o, r) : (iX("TranslationKeyNotFound", e, o), n)
                        }, {
                            rich: function(e, t) {
                                return h.rich(tP(e), t)
                            },
                            has: function(e) {
                                return iz(e) && h.has(tP(e))
                            },
                            dynamic: function(t, r) {
                                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "";
                                if (!iz(t)) return iX("TranslationKeyNotFound", e, String(t)), n;
                                var o = tP(t),
                                    i = h.has(o);
                                return i || iX("TranslationKeyNotFound", e, o), i ? h(o, r) : n
                            },
                            html: function(t, r, n) {
                                if (!iz(t)) return iX("TranslationKeyNotFound", e, String(t)), null;
                                var o = tP(t);
                                if (!h.has(o)) return iX("TranslationKeyNotFound", e, o), null;
                                var i = it(function(e) {
                                    return h(o, e)
                                }, r, n);
                                return null == i && iX("TranslationMalformed", e, o), i
                            }
                        })
                    }, [h, e])
                },
                iZ = "Feature.AccountSecurityPrompt",
                iq = [iZ, "CommonUI.Controls"],
                iJ = null != (N = tk().authApi) ? N : "URL_NOT_FOUND",
                iQ = ((O = {})[O.FLOODED = 2] = "FLOODED", O[O.INVALID_PASSWORD = 7] = "INVALID_PASSWORD", O[O.INVALID_CURRENT_PASSWORD = 8] = "INVALID_CURRENT_PASSWORD", O[O.PASSWORD_LOW_COMPLEXITY = 17] = "PASSWORD_LOW_COMPLEXITY", O[O.PASSWORD_TOO_SIMILAR_TO_USERNAME = 18] = "PASSWORD_TOO_SIMILAR_TO_USERNAME", O),
                i0 = {
                    withCredentials: !0,
                    url: "".concat(iJ, "/v2/user/passwords/change"),
                    timeout: 1e4
                },
                i1 = ((w = {})[w.USER_DOES_NOT_HAVE_EMAIL = 22] = "USER_DOES_NOT_HAVE_EMAIL", w),
                i2 = {
                    withCredentials: !0,
                    url: "".concat(iJ, "/v2/passwords/reset/send-prompted"),
                    timeout: 1e4
                },
                i3 = ((S = {})[S.VALID_PASSWORD = 0] = "VALID_PASSWORD", S[S.WEAK_PASSWORD = 1] = "WEAK_PASSWORD", S[S.SHORT_PASSWORD = 2] = "SHORT_PASSWORD", S[S.PASSWORD_SAME_AS_USERNAME = 3] = "PASSWORD_SAME_AS_USERNAME", S[S.FORBIDDEN_PASSWORD = 4] = "FORBIDDEN_PASSWORD", S[S.DUMB_STRINGS = 5] = "DUMB_STRINGS", S[S.PASSWORD_LOW_COMPLEXITY = 6] = "PASSWORD_LOW_COMPLEXITY", S[S.PASSWORD_TOO_SIMILAR_TO_USERNAME = 7] = "PASSWORD_TOO_SIMILAR_TO_USERNAME", S),
                i6 = {
                    withCredentials: !0,
                    url: "".concat(iJ, "/v2/passwords/validate"),
                    timeout: 1e4
                },
                i8 = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "linkStart",
                        r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "linkEnd";
                    return {
                        opening: t,
                        closing: r,
                        render: function(t) {
                            return (0, U.jsx)("a", {
                                href: e,
                                className: "text-link",
                                target: "_blank",
                                rel: "noreferrer",
                                children: t
                            })
                        }
                    }
                },
                i5 = function(e, t) {
                    switch (t) {
                        case iQ.FLOODED:
                            return e.Message.Error.Passwords.Flooded;
                        case iQ.INVALID_PASSWORD:
                            return e.Message.Error.Passwords.InvalidPassword;
                        case iQ.INVALID_CURRENT_PASSWORD:
                            return e.Message.Error.Passwords.InvalidCurrentPassword;
                        case iQ.PASSWORD_LOW_COMPLEXITY:
                            return e.Response.PasswordLowComplexity;
                        case iQ.PASSWORD_TOO_SIMILAR_TO_USERNAME:
                            return e.Response.PasswordTooSimilarToUsername;
                        default:
                            return e.Message.Error.Passwords.Default
                    }
                },
                i4 = function(e, t) {
                    switch (t) {
                        case i3.VALID_PASSWORD:
                            return null;
                        case i3.WEAK_PASSWORD:
                            return e.Message.Error.PasswordValidation.WeakPassword;
                        case i3.SHORT_PASSWORD:
                            return e.Message.Error.PasswordValidation.ShortPassword;
                        case i3.PASSWORD_SAME_AS_USERNAME:
                            return e.Message.Error.PasswordValidation.PasswordSameAsUsername;
                        case i3.FORBIDDEN_PASSWORD:
                            return e.Message.Error.PasswordValidation.ForbiddenPassword;
                        case i3.DUMB_STRINGS:
                            return e.Message.Error.PasswordValidation.DumbStrings;
                        case i3.PASSWORD_LOW_COMPLEXITY:
                            return e.Response.PasswordLowComplexity;
                        case i3.PASSWORD_TOO_SIMILAR_TO_USERNAME:
                            return e.Response.PasswordTooSimilarToUsername;
                        default:
                            return e.Message.Error.PasswordValidation.Default
                    }
                },
                i7 = ((E = i7 || {}).NONE = "NONE", E.CHANGE_PASSWORD_INTRO = "CHANGE_PASSWORD_INTRO", E.CHANGE_PASSWORD_FORM = "CHANGE_PASSWORD_FORM", E.CHANGE_PASSWORD_CONFIRMATION = "CHANGE_PASSWORD_CONFIRMATION", E.CHANGE_PASSWORD_DISMISS_CONFIRMATION = "CHANGE_PASSWORD_DISMISS_CONFIRMATION", E.AUTHENTICATOR_UPSELL_OPENING = "AUTHENTICATOR_UPSELL_OPENING", E.AUTHENTICATOR_UPSELL_DOWNLOAD_APPS = "AUTHENTICATOR_UPSELL_DOWNLOAD_APPS", E.ACCOUNT_RESTORE_POLICY_UPSELL = "ACCOUNT_RESTORE_POLICY_UPSELL", E.EMAIL_2SV_UPSELL = "EMAIL_2SV_UPSELL", E);

            function i9(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ae(e) {
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

            function at(e, t) {
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

            function ar(e, t) {
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
                        if ("string" == typeof e) return i9(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return i9(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var an = r(773),
                ao = "AccountSecurity",
                ai = {
                    challenge: {
                        counters: [{
                            name: "ChallengeShown",
                            dimensions: ["host", "challengeType"]
                        }, {
                            name: "ChallengeCompleted",
                            dimensions: ["host", "challengeType"]
                        }, {
                            name: "ChallengeAbandoned",
                            dimensions: ["host", "challengeType"]
                        }, {
                            name: "ChallengeInvalidated",
                            dimensions: ["host", "challengeType"]
                        }],
                        errors: [{
                            name: "ChallengeParseFailed",
                            dimensions: ["host"]
                        }],
                        criticalErrors: [{
                            name: "ChallengeRenderFailed",
                            dimensions: ["host", "challengeType"]
                        }],
                        flows: [{
                            id: "account_security_challenge",
                            title: "Challenges (outcome vs shown)",
                            steps: [{
                                counter: "ChallengeShown",
                                role: "start",
                                title: "Shown",
                                dimensions: ["challengeType"]
                            }, {
                                counter: "ChallengeCompleted",
                                role: "success",
                                title: "Completed",
                                dimensions: ["challengeType"]
                            }, {
                                counter: "ChallengeAbandoned",
                                role: "drop",
                                title: "Abandoned",
                                dimensions: ["challengeType"]
                            }, {
                                counter: "ChallengeInvalidated",
                                role: "error",
                                title: "Invalidated",
                                dimensions: ["challengeType"]
                            }]
                        }]
                    },
                    prompt: {
                        counters: [{
                            name: "PromptShown",
                            dimensions: ["host", "promptType"]
                        }, {
                            name: "PromptModalViewed",
                            dimensions: ["host", "promptType", "state"]
                        }, {
                            name: "PromptUpdated",
                            dimensions: ["host", "promptType", "action"]
                        }],
                        errors: [{
                            name: "PromptAssignmentsFetchFailed",
                            dimensions: ["host"]
                        }, {
                            name: "PromptUpdateFailed",
                            dimensions: ["host", "promptType", "action"]
                        }]
                    }
                },
                aa = "true" === an.env.NEXT_PUBLIC_IS_NEXTJS ? "nextjs" : "dotnet",
                al = function(e) {
                    var t = e.publish,
                        r = e.captureException,
                        n = e.featureName;

                    function o(e, t, o) {
                        if (null != o) {
                            var i, a = (null != (i = Error) && "u" > typeof Symbol && i[Symbol.hasInstance] ? !!i[Symbol.hasInstance](o) : o instanceof i) ? o.name || "Error" : "UnknownError",
                                l = n ? "".concat(n, "_").concat(e) : e;
                            return null == r || r(o, {
                                error_counter: l
                            }), at(ae({}, t), {
                                errorType: a
                            })
                        }
                        return t
                    }
                    return {
                        trackCounter: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var o = ar(r, 2);
                            t(o[0], o[1])
                        },
                        trackError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var i = ar(r, 3),
                                a = i[0],
                                l = i[1],
                                u = i[2],
                                c = o(a, at(ae({}, null != l ? l : {}), {
                                    severity: "error"
                                }), u);
                            t(a, c)
                        },
                        trackCriticalError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var i = ar(r, 3),
                                a = i[0],
                                l = i[1],
                                u = i[2],
                                c = o(a, at(ae({}, null != l ? l : {}), {
                                    severity: "critical"
                                }), u);
                            t(a, c)
                        }
                    }
                }({
                    publish: iV(ao),
                    featureName: ao
                }),
                au = al.trackCounter,
                ac = al.trackError;
            al.trackCriticalError;
            var as = function(e) {
                    au("PromptShown", {
                        host: aa,
                        promptType: e
                    })
                },
                af = function(e, t) {
                    au("PromptModalViewed", {
                        host: aa,
                        promptType: e,
                        state: t
                    })
                },
                ap = function(e, t) {
                    au("PromptUpdated", {
                        host: aa,
                        promptType: e,
                        action: t
                    })
                },
                ad = function(e, t) {
                    ac("PromptUpdateFailed", {
                        host: aa,
                        promptType: e,
                        action: t
                    })
                },
                ah = function() {
                    ac("PromptAssignmentsFetchFailed", {
                        host: aa
                    })
                },
                ay = function(e, t, r, n) {
                    r !== n && (e.sendModalStateViewedEvent(r), r !== i7.NONE && af(t, r))
                },
                am = ((A = {})[A.DISMISS_TEMPORARY = 0] = "DISMISS_TEMPORARY", A[A.DISMISS_FOREVER = 1] = "DISMISS_FOREVER", A[A.SET_FLOW_COMPLETE = 2] = "SET_FLOW_COMPLETE", A[A.SET_MODAL_STATE = 3] = "SET_MODAL_STATE", A[A.SET_EMAIL_ADDRESS = 4] = "SET_EMAIL_ADDRESS", A),
                ab = function(e, t) {
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
                        case am.DISMISS_TEMPORARY:
                        case am.DISMISS_FOREVER:
                            return r.isFlowComplete = !0, r;
                        case am.SET_MODAL_STATE:
                            return r.lastModalState = e.modalState, r.modalState = t.modalState, r.modalState === i7.CHANGE_PASSWORD_CONFIRMATION && (r.isFlowComplete = !0), r;
                        case am.SET_EMAIL_ADDRESS:
                            return r.emailAddress = t.emailAddress, r;
                        default:
                            return e
                    }
                };

            function av(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ag(e, t) {
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
                        if ("string" == typeof e) return av(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return av(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var aO = (0, B.createContext)(null),
                aw = function(e) {
                    var t = e.promptAssignment,
                        r = e.username,
                        n = e.isUserUnder13,
                        o = e.eventService,
                        i = e.requestService,
                        a = e.children,
                        l = i$(iZ),
                        u = i7.NONE,
                        c = t.promptType === tW.BROADER_AUTHENTICATOR_UPSELL && !0 !== t.isGeneric && !t.metadata.showBanner,
                        s = t.promptType === tW.EMAIL_2SV_UPSELL && !0 !== t.isGeneric && !t.metadata.showBanner;
                    t.promptType === tW.AUTHENTICATOR_UPSELL || c ? u = i7.AUTHENTICATOR_UPSELL_OPENING : t.promptType === tW.ACCOUNT_RESTORES_POLICY_UPSELL ? u = i7.ACCOUNT_RESTORE_POLICY_UPSELL : t.promptType === tW.EMAIL_2SV_UPSELL && s && (u = i7.EMAIL_2SV_UPSELL);
                    var f = ag((0, B.useState)(function() {
                            return {
                                Action: {
                                    AbortDismissForeverAddEmail: l("Action.AbortDismissForeverAddEmail"),
                                    AbortDismissForeverChangePassword: l("Action.AbortDismissForeverChangePassword"),
                                    AccountRestoreOpenSettings: l("Action.OpenSettings"),
                                    AuthenticatorUpsellSetupAuthenticatorButtonMessage: l("Label.AuthenticatorUpsellSetupAuthenticatorButtonMessage"),
                                    AuthenticatorUpsellNextButtonMessage: l("Action.AuthenticatorUpsellNextButtonMessage"),
                                    ChangeEmail: l("Action.ChangeEmail"),
                                    ConfirmDismissForeverAddEmail: l("Action.ConfirmDismissForeverAddEmail"),
                                    ConfirmDismissForeverChangePassword: l("Action.ConfirmDismissForeverChangePassword"),
                                    ContinueAddEmail: l("Action.ContinueAddEmail"),
                                    ContinueChangePassword: l("Action.ContinueChangePassword"),
                                    DismissForever: l("Action.DismissForever"),
                                    RemindMeLater: l("Action.RemindMeLater"),
                                    ResendPasswordResetEmail: l("Action.ResendPasswordResetEmail"),
                                    SecureAccount: l("Action.SecureAccount"),
                                    SetUpAuthenticatorInBanner: l("Action.SetUpAuthenticatorInBanner"),
                                    SetUpAuthenticatorAccountRestoresPolicyUpsell: l("Action.SetUpAuthenticatorAccountRestoresPolicyUpsell"),
                                    SetUpEmail2SV: l("Action.SetUpEmail2SV"),
                                    SubmitChangePassword: l("Action.SubmitChangePassword")
                                },
                                Message: {
                                    Error: {
                                        Email: {
                                            FeatureDisabled: l("Message.Error.Email.FeatureDisabled"),
                                            TooManyAccountsOnEmail: l("Message.Error.Email.TooManyAccountsOnEmail"),
                                            TooManyAttemptsToUpdateEmail: l("Message.Error.Email.TooManyAttemptsToUpdateEmail"),
                                            InvalidEmailAddress: l("Message.Error.Email.InvalidEmailAddress"),
                                            Default: l("Message.Error.Email.Default")
                                        },
                                        Input: {
                                            InvalidEmail: l("Message.Error.Input.InvalidEmail"),
                                            PasswordsDoNotMatch: l("Message.Error.Input.PasswordsDoNotMatch")
                                        },
                                        Passwords: {
                                            Flooded: l("Message.Error.Password.Flooded"),
                                            InvalidPassword: l("Message.Error.Password.InvalidPassword"),
                                            InvalidCurrentPassword: l("Message.Error.Password.InvalidCurrentPassword"),
                                            Default: l("Message.Error.Password.Default")
                                        },
                                        PasswordReset: {
                                            UserDoesNotHaveEmail: l("Message.Error.PasswordReset.UserDoesNotHaveEmail"),
                                            Default: l("Message.Error.PasswordReset.Default")
                                        },
                                        PasswordValidation: {
                                            WeakPassword: l("Message.Error.PasswordValidation.WeakPassword"),
                                            ShortPassword: l("Message.Error.PasswordValidation.ShortPassword"),
                                            PasswordSameAsUsername: l("Message.Error.PasswordValidation.PasswordSameAsUsername"),
                                            ForbiddenPassword: l("Message.Error.PasswordValidation.ForbiddenPassword"),
                                            DumbStrings: l("Message.Error.PasswordValidation.DumbStrings"),
                                            Default: l("Message.Error.PasswordValidation.Default")
                                        },
                                        PromptAssignments: {
                                            Default: l("Message.Error.PromptAssignments.Default")
                                        }
                                    }
                                },
                                Description: {
                                    AccountRestoresPolicyUpdateV3: function(e) {
                                        return l.html("Description.AccountRestoresPolicyUpdateV3", [i8(e)])
                                    },
                                    AccountRestoresPolicyUpsellMessageBody: function(e) {
                                        return l.html("Description.AccountRestoresPolicyUpsellMessageBody", [i8(e, "linkStartSettings", "linkEndSettings")])
                                    },
                                    AccountRestoresPolicyWithDate: function(e) {
                                        return l("Description.AccountRestoresPolicyWithDate", {
                                            date: e
                                        })
                                    },
                                    AddYourEmail: l(n ? "Description.AddYourEmailUnder13" : "Description.AddYourEmail"),
                                    AreYouSureDismissForeverAddEmail: l(n ? "Description.AreYouSureDismissForeverAddEmailUnder13" : "Description.AreYouSureDismissForeverAddEmail"),
                                    AreYouSureDismissForeverChangePassword: l("Description.AreYouSureDismissForeverChangePassword"),
                                    AuthenticatorSetupPrompt: function(e) {
                                        return l.html("Description.AuthenticatorSetupPrompt", [i8(e)])
                                    },
                                    AuthenticatorSetupPromptNew: function(e) {
                                        return l.html("Description.AuthenticatorSetupPromptNew", [i8(e)])
                                    },
                                    ChangeYourPassword: l("Description.ChangeYourPassword"),
                                    ChangeYourPasswordImmediately: l("Description.ChangeYourPasswordImmediately"),
                                    ChangeYourPasswordSuccess: l("Description.ChangeYourPasswordSuccess"),
                                    Email2SVUpsellMessageBody: function(e) {
                                        return l.html("Description.Email2SVUpsellMessageBody", [i8(e)])
                                    },
                                    GenericTextOnlyBanner: function(e) {
                                        return l.dynamic(e)
                                    },
                                    LearnMoreHere: function(e) {
                                        return l.html("Description.LearnMoreHere", [i8(e)])
                                    },
                                    NoChangeForceReset: function(e) {
                                        return l(e <= 1 ? "Description.NoChangeForceResetSingular" : "Description.NoChangeForceReset", {
                                            days: e,
                                            boldStart: "\x02",
                                            boldEnd: "\x03"
                                        }).replace("1", e < 1 ? "< 1" : "1").split(new RegExp("(".concat("\x02", "[^").concat("\x03", "]*").concat("\x03", ")"))).map(function(e, t) {
                                            return e.startsWith("\x02") ? (0, U.jsx)("b", {
                                                children: e.slice(1, -1)
                                            }, t) : e
                                        })
                                    },
                                    ReceiveSecurityCodesMessage: l("Description.ReceiveSecurityCodesMessage"),
                                    UnusualActivity: l("Description.UnusualActivity")
                                },
                                Header: {
                                    AccountRestoresPolicyUpdate: l("Header.AccountRestoresPolicyUpdate"),
                                    AccountRestoresPolicyUpdateV3: l("Header.AccountRestoresPolicyUpdateV3"),
                                    AccountRestoresPolicyUpsell: l("Header.AccountRestoresPolicyUpsell"),
                                    AddYourEmail: l(n ? "Header.AddYourEmailUnder13" : "Header.AddYourEmail"),
                                    AreYouSure: l("Header.AreYouSure"),
                                    AuthenticatorUpsellDownloadAuthenticator: l("Header.AuthenticatorUpsellDownloadAuthenticator"),
                                    AuthenticatorUpsellWelcomeMessage: l("Header.AuthenticatorUpsellWelcomeMessage"),
                                    BoostYourAccountSecurity: l("Header.BoostYourAccountSecurity"),
                                    ChangeYourPassword: l("Header.ChangeYourPassword"),
                                    CheckYourEmail: l(n ? "Header.CheckYourEmailUnder13" : "Header.CheckYourEmail"),
                                    CreateAStrongPassword: l("Header.CreateAStrongPassword"),
                                    GenericTextOnlyBanner: function(e) {
                                        return l.dynamic(e)
                                    },
                                    Email2SVUpsell: l("Header.Email2SVUpsell"),
                                    KeepYourAccountSafeLong: l("Header.KeepYourAccountSafeLong"),
                                    Success: l("Header.Success"),
                                    UnusualActivityDetected: l("Header.UnusualActivityDetected"),
                                    YourPasswordMightBeStolen: l("Header.YourPasswordMightBeStolen")
                                },
                                Label: {
                                    AtLeastCharacters: function(e) {
                                        return l("Label.AtLeastCharacters", {
                                            count: e
                                        })
                                    },
                                    AuthenticatorUpsellBadActorHeadline: l("Label.AuthenticatorUpsellBadActorHeadline"),
                                    AuthenticatorUpsellBadActorMessage: l("Label.AuthenticatorUpsellBadActorMessage"),
                                    AuthenticatorUpsellDownloadInstruction: l("Label.AuthenticatorUpsellDownloadInstruction"),
                                    AuthenticatorUpsellGoogleOption: l("Label.AuthenticatorUpsellGoogleOption"),
                                    AuthenticatorUpsellMicrosoftOption: l("Label.AuthenticatorUpsellMicrosoftOption"),
                                    AuthenticatorUpsellProtectRobuxHeadline: l("Label.AuthenticatorUpsellProtectRobuxHeadline"),
                                    AuthenticatorUpsellProtectRobuxMessage: l("Label.AuthenticatorUpsellProtectRobuxMessage"),
                                    AuthenticatorUpsellTwilioOption: l("Label.AuthenticatorUpsellTwilioOption"),
                                    AuthenticatorUpsellTwoFactorHeadline: l("Label.AuthenticatorUpsellTwoFactorHeadline"),
                                    AuthenticatorUpsellTwoFactorMessage: l("Label.AuthenticatorUpsellTwoFactorMessage"),
                                    ConfirmNewPassword: l("Label.ConfirmNewPassword"),
                                    CurrentPassword: l("Label.CurrentPassword"),
                                    IForgotMyPassword: l("Label.IForgotMyPassword"),
                                    MinutesSeconds: function(e, t) {
                                        return l("Label.MinutesSeconds", {
                                            minutes: e,
                                            seconds: t
                                        })
                                    },
                                    NewPassword: l("Label.NewPassword"),
                                    TimeRemaining: l("Label.TimeRemaining"),
                                    UseAUniquePassword: l("Label.UseAUniquePassword"),
                                    YourEmail: l(n ? "Label.YourEmailUnder13" : "Label.YourEmail")
                                },
                                Response: {
                                    PasswordLowComplexity: l("Response.PasswordLowComplexity"),
                                    PasswordTooSimilarToUsername: l("Response.PasswordTooSimilarToUsername")
                                }
                            }
                        }), 1)[0],
                        p = ag((0, B.useState)(function() {
                            return {
                                promptAssignment: t,
                                username: r,
                                resources: f,
                                requestService: i,
                                isFlowComplete: !1,
                                modalState: u,
                                lastModalState: null,
                                emailAddress: ""
                            }
                        }), 1)[0],
                        d = ag((0, B.useReducer)(ab, p), 2),
                        h = d[0],
                        y = d[1];
                    return (0, B.useEffect)(function() {
                        return ay(o, t.promptType, h.modalState, h.lastModalState)
                    }, [o, t.promptType, h.modalState, h.lastModalState]), (0, U.jsx)(aO.Provider, {
                        value: {
                            state: h,
                            dispatch: y
                        },
                        children: a
                    })
                },
                aS = function() {
                    var e = (0, B.useContext)(aO);
                    if (null === e) throw Error("AccountSecurityPromptContext was not provided in the current scope");
                    return e
                },
                aE = function(e) {
                    var t = parseInt(e, 10);
                    return Number.isNaN(t) || !Number.isSafeInteger(t) ? 14 : Math.floor(Math.max(0, t - Date.now()) / 864e5)
                };

            function aA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aP(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function aj(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            aP(i, n, o, a, l, "next", e)
                        }

                        function l(e) {
                            aP(i, n, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
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
            var aT = function() {
                    var e, t, r, n = aS(),
                        o = n.state,
                        i = o.promptAssignment,
                        a = o.resources,
                        l = o.requestService,
                        u = n.dispatch,
                        c = function(e) {
                            if (Array.isArray(e)) return e
                        }(e = (0, B.useState)(!1)) || function(e) {
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
                                if ("string" == typeof e) return aA(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aA(e, 2)
                            }
                        }(e) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        s = c[0],
                        f = c[1],
                        p = function() {
                            return aj(function() {
                                var e;
                                return ax(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            return f(!0), [4, l.promptAssignments.updateForCurrentUser(tY.DISABLE_PROMPT, i.promptType)];
                                        case 1:
                                            return (e = t.sent()).isError && (f(!1), console.warn(oQ, "Disabling prompt failed with error", e.error && tH[e.error])), u({
                                                type: am.DISMISS_FOREVER
                                            }), [2]
                                    }
                                })
                            })()
                        },
                        d = function() {
                            return aj(function() {
                                var e;
                                return ax(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            return f(!0), [4, l.promptAssignments.updateForCurrentUser(tY.DISMISS_PROMPT, i.promptType)];
                                        case 1:
                                            return (e = t.sent()).isError && (f(!1), console.warn(oQ, "Dismissing prompt failed with error", e.error && tH[e.error])), u({
                                                type: am.DISMISS_TEMPORARY
                                            }), [2]
                                    }
                                })
                            })()
                        },
                        h = [tW.BROADER_AUTHENTICATOR_UPSELL.toString(), tW.ACCOUNT_RESTORES_POLICY_UPDATE_V3.toString(), tW.EMAIL_2SV_UPSELL.toString()].includes(i.promptType.toString()),
                        y = !h,
                        m = tW.ACCOUNT_RESTORES_POLICY_UPDATE_V3 !== i.promptType,
                        b = tW.CHANGE_PASSWORD__SUSPECTED_COMPROMISE === i.promptType,
                        v = [tW.CHANGE_PASSWORD__SUSPECTED_COMPROMISE.toString(), tW.ACCOUNT_RESTORES_POLICY_UPDATE.toString(), tW.ACCOUNT_RESTORES_POLICY_UPDATE_V2.toString(), tW.ACCOUNT_RESTORES_POLICY_UPDATE_V3.toString(), tW.BROADER_AUTHENTICATOR_UPSELL.toString(), tW.EMAIL_2SV_UPSELL.toString()].includes(i.promptType.toString());
                    i.isGeneric && (y = i.metadata.showAlertIcon, m = !1, b = !1, v = i.metadata.showXButtonForDisable);
                    var g = a.Action.SubmitChangePassword;
                    if (i.promptType === tW.ACCOUNT_RESTORES_POLICY_UPDATE || i.promptType === tW.ACCOUNT_RESTORES_POLICY_UPDATE_V2 ? g = a.Action.AccountRestoreOpenSettings : i.promptType === tW.BROADER_AUTHENTICATOR_UPSELL ? g = a.Action.SetUpAuthenticatorInBanner : i.promptType === tW.EMAIL_2SV_UPSELL && (g = a.Action.SetUpEmail2SV), i.isGeneric) t = i.metadata.displayType === tF.TEXT_ONLY_BANNER ? a.Description.GenericTextOnlyBanner(i.metadata.headerResource) : "";
                    else switch (i.promptType) {
                        case tW.CHANGE_PASSWORD__SUSPECTED_COMPROMISE:
                            t = a.Header.UnusualActivityDetected;
                            break;
                        case tW.CHANGE_PASSWORD__BREACHED_CREDENTIAL:
                            t = a.Header.YourPasswordMightBeStolen;
                            break;
                        case tW.ACCOUNT_RESTORES_POLICY_UPDATE:
                            t = a.Header.AccountRestoresPolicyUpdate;
                            break;
                        case tW.ACCOUNT_RESTORES_POLICY_UPDATE_V2:
                            t = a.Header.KeepYourAccountSafeLong;
                            break;
                        case tW.ACCOUNT_RESTORES_POLICY_UPDATE_V3:
                            t = a.Header.AccountRestoresPolicyUpdateV3;
                            break;
                        case tW.BROADER_AUTHENTICATOR_UPSELL:
                            t = a.Header.BoostYourAccountSecurity;
                            break;
                        case tW.EMAIL_2SV_UPSELL:
                            t = a.Header.Email2SVUpsell;
                            break;
                        default:
                            t = ""
                    }
                    if (i.isGeneric) r = i.metadata.displayType === tF.TEXT_ONLY_BANNER ? a.Header.GenericTextOnlyBanner(i.metadata.bodyResource) : "";
                    else switch (i.promptType) {
                        case tW.ACCOUNT_RESTORES_POLICY_UPDATE:
                            var O = new Date(i.metadata.accountRestoresPolicyEffectiveTimestamp).toLocaleDateString(void 0, {
                                year: "numeric",
                                month: "short",
                                day: "numeric"
                            });
                            r = (0, U.jsxs)(H().Fragment, {
                                children: [a.Description.AccountRestoresPolicyWithDate(O), " ", a.Description.AuthenticatorSetupPrompt(o6)]
                            });
                            break;
                        case tW.ACCOUNT_RESTORES_POLICY_UPDATE_V2:
                            r = a.Description.AuthenticatorSetupPromptNew(o6);
                            break;
                        case tW.ACCOUNT_RESTORES_POLICY_UPDATE_V3:
                            r = a.Description.AccountRestoresPolicyUpdateV3(o3);
                            break;
                        case tW.CHANGE_PASSWORD__SUSPECTED_COMPROMISE:
                            r = "".concat(a.Description.UnusualActivity, " ").concat(a.Description.ChangeYourPassword);
                            break;
                        case tW.CHANGE_PASSWORD__BREACHED_CREDENTIAL:
                            r = (0, U.jsxs)(H().Fragment, {
                                children: [a.Description.ChangeYourPasswordImmediately, " ", a.Description.NoChangeForceReset(aE(i.metadata.forceResetTimestamp)), " ", a.Description.LearnMoreHere("https://en.help.roblox.com/hc/articles/4416940180500-Why-am-I-seeing-a-banner-asking-me-to-change-my-password-")]
                            });
                            break;
                        case tW.BROADER_AUTHENTICATOR_UPSELL:
                            r = a.Description.ReceiveSecurityCodesMessage;
                            break;
                        case tW.EMAIL_2SV_UPSELL:
                            r = a.Description.Email2SVUpsellMessageBody(o3);
                            break;
                        default:
                            r = ""
                    }
                    return "" === t || "" === r || null == r ? (0, U.jsx)(H().Fragment, {}) : (0, U.jsx)("div", {
                        className: "security-banner-wrapper",
                        children: (0, U.jsxs)("div", {
                            className: "security-banner",
                            "data-testid": "account-security-banner",
                            children: [(0, U.jsxs)("div", {
                                className: "banner-start",
                                children: [y && (0, U.jsx)("div", {
                                    className: "banner-icon",
                                    children: (0, U.jsx)(t1, {
                                        name: "icon-regular-triangle-exclamation",
                                        className: "banner-warning-icon"
                                    })
                                }), h && (0, U.jsx)("div", {
                                    className: "banner-icon-lock"
                                }), (0, U.jsxs)("div", {
                                    className: "banner-content",
                                    children: [(0, U.jsx)("h2", {
                                        className: "banner-header padding-bottom-xsmall text-heading-small max-[767px]:text-title-large",
                                        children: t
                                    }), (0, U.jsx)("div", {
                                        className: "banner-description text-body-large max-[767px]:text-body-small",
                                        children: r
                                    })]
                                }), v && (0, U.jsx)("button", {
                                    type: "button",
                                    className: "banner-close flex bg-none stroke-none padding-none",
                                    "aria-label": a.Action.RemindMeLater,
                                    onClick: d,
                                    children: (0, U.jsx)(t1, {
                                        name: "icon-regular-x",
                                        size: "XLarge"
                                    })
                                })]
                            }), (0, U.jsxs)("div", {
                                className: "banner-buttons",
                                children: [b && (0, U.jsx)("span", {
                                    className: "banner-button",
                                    children: (0, U.jsx)(oK, {
                                        variant: "Standard",
                                        size: "Medium",
                                        className: "!text-label-large max-[991px]:!height-800 max-[767px]:!height-700",
                                        "data-testid": "banner-secondary",
                                        "aria-label": a.Action.DismissForever,
                                        onClick: function() {
                                            u({
                                                type: am.SET_MODAL_STATE,
                                                modalState: i7.CHANGE_PASSWORD_DISMISS_CONFIRMATION
                                            })
                                        },
                                        isDisabled: s,
                                        children: a.Action.DismissForever
                                    })
                                }), m && (0, U.jsx)("span", {
                                    className: "banner-button banner-button-last",
                                    children: (0, U.jsx)(oK, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "!text-label-large !bg-[var(--color-content-emphasis)] !content-[var(--color-surface-0)] max-[991px]:!height-800 max-[767px]:!height-700",
                                        "data-testid": "banner-primary",
                                        "aria-label": g,
                                        onClick: function() {
                                            return aj(function() {
                                                return ax(this, function(e) {
                                                    switch (e.label) {
                                                        case 0:
                                                            if (i.promptType !== tW.ACCOUNT_RESTORES_POLICY_UPDATE && i.promptType !== tW.ACCOUNT_RESTORES_POLICY_UPDATE_V2) return [3, 2];
                                                            return [4, p()];
                                                        case 1:
                                                            return e.sent(), null == Y || Y.open(o3 + o1, "_self"), [3, 3];
                                                        case 2:
                                                            i.promptType === tW.BROADER_AUTHENTICATOR_UPSELL ? u({
                                                                type: am.SET_MODAL_STATE,
                                                                modalState: i7.AUTHENTICATOR_UPSELL_OPENING
                                                            }) : i.promptType === tW.EMAIL_2SV_UPSELL ? null == Y || Y.open(o3 + o2, "_self") : u({
                                                                type: am.SET_MODAL_STATE,
                                                                modalState: i7.CHANGE_PASSWORD_INTRO
                                                            }), e.label = 3;
                                                        case 3:
                                                            return [2]
                                                    }
                                                })
                                            })()
                                        },
                                        isDisabled: s,
                                        children: g
                                    })
                                }), v && (0, U.jsx)(B.Fragment, {
                                    children: s ? (0, U.jsx)(oJ, {
                                        variant: "Indeterminate",
                                        size: "Small",
                                        ariaLabel: a.Action.RemindMeLater,
                                        className: "banner-close banner-close-progress"
                                    }) : (0, U.jsx)("button", {
                                        type: "button",
                                        className: "banner-close flex bg-none stroke-none padding-none",
                                        "data-testid": "banner-close",
                                        "aria-label": a.Action.RemindMeLater,
                                        onClick: function() {
                                            return aj(function() {
                                                return ax(this, function(e) {
                                                    switch (e.label) {
                                                        case 0:
                                                            if (!(i.promptType === tW.ACCOUNT_RESTORES_POLICY_UPDATE || i.promptType === tW.ACCOUNT_RESTORES_POLICY_UPDATE_V2 || i.promptType === tW.ACCOUNT_RESTORES_POLICY_UPDATE_V3 || i.isGeneric && i.metadata.displayType === tF.TEXT_ONLY_BANNER)) return [3, 2];
                                                            return [4, p()];
                                                        case 1:
                                                            return e.sent(), [3, 4];
                                                        case 2:
                                                            return [4, d()];
                                                        case 3:
                                                            e.sent(), e.label = 4;
                                                        case 4:
                                                            return [2]
                                                    }
                                                })
                                            })()
                                        },
                                        children: (0, U.jsx)(t1, {
                                            name: "icon-regular-x",
                                            size: "XLarge"
                                        })
                                    })
                                })]
                            })]
                        })
                    })
                },
                a_ = function(e) {
                    var t = e.positiveButton,
                        r = e.negativeButton,
                        n = e.children;
                    return (0, U.jsxs)(ov, {
                        className: "challenge-dialog-footer flex flex-col gap-large",
                        "data-testid": "challenge-dialog-footer",
                        children: [(0, U.jsxs)("div", {
                            className: "flex gap-small width-full",
                            children: [null !== r && (0, U.jsx)(oK, {
                                variant: "Standard",
                                size: "Medium",
                                className: "grow-1 basis-0 min-width-0 !text-label-large max-[767px]:!height-800",
                                "aria-label": r.label,
                                isDisabled: !r.enabled,
                                onClick: r.action,
                                children: r.content
                            }), (0, U.jsx)(oK, {
                                variant: "Emphasis",
                                size: "Medium",
                                className: "grow-1 basis-0 min-width-0 !text-label-large !bg-[var(--color-content-emphasis)] !content-[var(--color-surface-0)] max-[767px]:!height-800",
                                "aria-label": t.label,
                                isDisabled: !t.enabled,
                                onClick: t.action,
                                children: t.content
                            })]
                        }), n]
                    })
                };

            function aI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aC(e) {
                if (Array.isArray(e)) return e
            }

            function aR() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
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

            function aD(e, t) {
                if (e) {
                    if ("string" == typeof e) return aI(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aI(e, t)
                }
            }
            var aM = (0, B.forwardRef)(function(e, t) {
                var r, n, o, i = aC(o = [e, t]) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(o) || aD(o) || aR(),
                    a = i[0],
                    l = i.slice(1),
                    u = a.className,
                    c = a.style,
                    s = a.orientation,
                    f = void 0 === s ? "horizontal" : s,
                    p = a.variant,
                    d = void 0 === p ? "Standard" : p,
                    h = function(e, t) {
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
                    y = (aC(l) || function(e) {
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
                    }(l) || aD(l, 1) || aR())[0],
                    m = "vertical" === f,
                    b = {};
                return m || "Inset" !== d ? m || "InsetLeft" !== d ? m || "InsetRight" !== d || (b = {
                    marginRight: "var(--padding-xlarge)"
                }) : b = {
                    marginLeft: "var(--padding-xlarge)"
                } : b = {
                    marginLeft: "var(--padding-xlarge)",
                    marginRight: "var(--padding-xlarge)"
                }, H().createElement("div", (r = aN({
                    ref: y
                }, h), n = n = {
                    role: "separator",
                    "data-orientation": f,
                    "aria-orientation": f,
                    style: aN({
                        borderRightWidth: 0,
                        borderBottomWidth: 0,
                        boxSizing: "border-box",
                        borderStyle: "solid"
                    }, m ? {
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
                    }, b, c),
                    className: tz("stroke-default self-stretch", u)
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
            aM.displayName = "Divider";
            var aL = ((P = {}).BACK = "BACK", P.CLOSE = "CLOSE", P.HIDDEN = "HIDDEN", P),
                ak = function(e) {
                    var t = e.headerText,
                        r = e.buttonType,
                        n = e.buttonAction,
                        o = e.buttonEnabled,
                        i = e.headerInfo,
                        a = e.buttonAriaLabel,
                        l = i$("CommonUI.Controls");
                    return (0, U.jsxs)(H().Fragment, {
                        children: [(0, U.jsxs)("div", {
                            "data-testid": "challenge-dialog-header",
                            className: "grid [grid-template-columns:minmax(0,1fr)_auto_minmax(0,1fr)] items-center gap-large padding-x-small",
                            children: ["HIDDEN" === r ? (0, U.jsx)("div", {}) : (0, U.jsx)("button", {
                                type: "button",
                                className: "justify-self-start bg-none stroke-none padding-none",
                                onClick: n,
                                disabled: !o,
                                "aria-label": null != a ? a : l("Action.Close"),
                                "data-testid": "challenge-dialog-header-button",
                                children: (0, U.jsx)(t1, {
                                    name: "BACK" === r ? "icon-regular-chevron-large-left" : "icon-regular-x",
                                    size: "XLarge"
                                })
                            }), (0, U.jsx)(ob, {
                                className: "challenge-dialog-title text-heading-small text-align-x-center text-truncate-end text-no-wrap min-width-0",
                                children: t
                            }), (0, U.jsx)("div", {
                                className: "justify-self-end",
                                children: i
                            })]
                        }), (0, U.jsx)(aM, {
                            className: "challenge-dialog-divider"
                        })]
                    })
                };

            function aU(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aB(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function aH(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            aB(i, n, o, a, l, "next", e)
                        }

                        function l(e) {
                            aB(i, n, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function aF(e, t) {
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
                        if ("string" == typeof e) return aU(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aU(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function aV(e, t) {
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
            var aW = function(e) {
                var t = e.closeModal,
                    r = aS().state,
                    n = r.resources,
                    o = r.requestService,
                    i = r.promptAssignment,
                    a = aF((0, B.useState)(null), 2),
                    l = a[0],
                    u = a[1],
                    c = aF((0, B.useState)(!1), 2),
                    s = c[0],
                    f = c[1],
                    p = function() {
                        return aH(function() {
                            var e;
                            return aV(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return [4, o.promptAssignments.updateForCurrentUser(tY.DISMISS_PROMPT, i.promptType)];
                                    case 1:
                                        return (e = t.sent()).isError && console.warn(oQ, "Dismissing Account Restores Policy Upsell prompt failed with error", e.error && tH[e.error]), [2]
                                }
                            })
                        })()
                    },
                    d = {
                        content: s ? (0, U.jsx)(oJ, {
                            variant: "Indeterminate",
                            size: "Small",
                            ariaLabel: n.Action.SetUpAuthenticatorAccountRestoresPolicyUpsell
                        }) : n.Action.SetUpAuthenticatorAccountRestoresPolicyUpsell,
                        label: n.Action.SetUpAuthenticatorAccountRestoresPolicyUpsell,
                        enabled: !s,
                        action: function() {
                            return aH(function() {
                                return aV(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return u(null), f(!0), [4, p()];
                                        case 1:
                                            return e.sent(), null == Y || Y.open(o3 + o1, "_self"), [2]
                                    }
                                })
                            })()
                        }
                    };
                return (0, U.jsxs)(H().Fragment, {
                    children: [(0, U.jsx)(ak, {
                        headerText: n.Header.AccountRestoresPolicyUpsell,
                        buttonType: aL.CLOSE,
                        buttonAction: function() {
                            return aH(function() {
                                return aV(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return t(), [4, p()];
                                        case 1:
                                            return e.sent(), [2]
                                    }
                                })
                            })()
                        },
                        buttonEnabled: !0,
                        headerInfo: null
                    }), (0, U.jsxs)(om, {
                        children: [(0, U.jsx)("div", {
                            className: "modal-lock-icon"
                        }), (0, U.jsx)("p", {
                            className: "modal-margin-bottom-sm",
                            children: n.Description.AccountRestoresPolicyUpsellMessageBody(o3)
                        }), (0, U.jsx)("p", {
                            className: "text-caption-small content-system-alert xsmall",
                            children: l
                        })]
                    }), (0, U.jsx)(a_, {
                        positiveButton: d,
                        negativeButton: null
                    })]
                })
            };

            function aG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aY(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function aK(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            aY(i, n, o, a, l, "next", e)
                        }

                        function l(e) {
                            aY(i, n, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function az(e, t) {
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
                        if ("string" == typeof e) return aG(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aG(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function aX(e, t) {
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
            var a$ = function(e) {
                var t = e.closeModal,
                    r = aS().state,
                    n = r.resources,
                    o = r.requestService,
                    i = r.promptAssignment,
                    a = az((0, B.useState)(null), 2),
                    l = a[0],
                    u = a[1],
                    c = az((0, B.useState)(!1), 2),
                    s = c[0],
                    f = c[1],
                    p = function() {
                        return aK(function() {
                            var e;
                            return aX(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return [4, o.promptAssignments.updateForCurrentUser(tY.DISMISS_PROMPT, i.promptType)];
                                    case 1:
                                        return (e = t.sent()).isError && console.warn(oQ, "Dismissing Authenticator Upsell prompt failed with error", e.error && tH[e.error]), [2]
                                }
                            })
                        })()
                    },
                    d = {
                        content: s ? (0, U.jsx)(oJ, {
                            variant: "Indeterminate",
                            size: "Small",
                            ariaLabel: n.Action.AuthenticatorUpsellNextButtonMessage
                        }) : n.Action.AuthenticatorUpsellNextButtonMessage,
                        label: n.Action.AuthenticatorUpsellNextButtonMessage,
                        enabled: !s,
                        action: function() {
                            return aK(function() {
                                return aX(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return u(null), f(!0), [4, p()];
                                        case 1:
                                            return e.sent(), null == Y || Y.open(o3 + o1, "_self"), [2]
                                    }
                                })
                            })()
                        }
                    };
                return (0, U.jsxs)(H().Fragment, {
                    children: [(0, U.jsx)(ak, {
                        headerText: n.Header.AuthenticatorUpsellDownloadAuthenticator,
                        buttonType: aL.CLOSE,
                        buttonAction: function() {
                            return aK(function() {
                                return aX(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return t(), [4, p()];
                                        case 1:
                                            return e.sent(), [2]
                                    }
                                })
                            })()
                        },
                        buttonEnabled: !s,
                        headerInfo: null
                    }), (0, U.jsxs)(om, {
                        children: [(0, U.jsx)("div", {
                            children: (0, U.jsx)("p", {
                                children: n.Label.AuthenticatorUpsellDownloadInstruction
                            })
                        }), (0, U.jsx)("div", {
                            className: "authenticator-upsell-download-grid",
                            children: (0, U.jsxs)("div", {
                                className: "grid-container",
                                children: [(0, U.jsx)("div", {
                                    className: "grid-item",
                                    children: (0, U.jsx)("div", {
                                        className: "modal-checkmark-icon"
                                    })
                                }), (0, U.jsx)("div", {
                                    className: "grid-item",
                                    children: (0, U.jsx)("div", {
                                        children: n.Label.AuthenticatorUpsellMicrosoftOption
                                    })
                                }), (0, U.jsx)("div", {
                                    className: "grid-item",
                                    children: (0, U.jsx)("div", {
                                        className: "modal-checkmark-icon"
                                    })
                                }), (0, U.jsx)("div", {
                                    className: "grid-item",
                                    children: (0, U.jsx)("div", {
                                        children: n.Label.AuthenticatorUpsellGoogleOption
                                    })
                                }), (0, U.jsx)("div", {
                                    className: "grid-item",
                                    children: (0, U.jsx)("div", {
                                        className: "modal-checkmark-icon"
                                    })
                                }), (0, U.jsx)("div", {
                                    className: "grid-item",
                                    children: (0, U.jsx)("div", {
                                        children: n.Label.AuthenticatorUpsellTwilioOption
                                    })
                                })]
                            })
                        }), (0, U.jsx)("p", {
                            className: "text-caption-small content-system-alert xsmall",
                            children: l
                        })]
                    }), (0, U.jsx)(a_, {
                        positiveButton: d,
                        negativeButton: null
                    })]
                })
            };

            function aZ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aq(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function aJ(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            aq(i, n, o, a, l, "next", e)
                        }

                        function l(e) {
                            aq(i, n, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function aQ(e, t) {
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
                        if ("string" == typeof e) return aZ(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aZ(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function a0(e, t) {
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
            var a1 = function(e) {
                    var t = e.closeModal,
                        r = aS(),
                        n = r.state,
                        o = n.resources,
                        i = n.requestService,
                        a = n.promptAssignment,
                        l = r.dispatch,
                        u = aQ((0, B.useState)(null), 2),
                        c = u[0],
                        s = u[1],
                        f = aQ((0, B.useState)(!1), 2),
                        p = f[0],
                        d = f[1],
                        h = {
                            content: p ? (0, U.jsx)(oJ, {
                                variant: "Indeterminate",
                                size: "Small",
                                ariaLabel: o.Action.AuthenticatorUpsellSetupAuthenticatorButtonMessage
                            }) : o.Action.AuthenticatorUpsellSetupAuthenticatorButtonMessage,
                            label: o.Action.AuthenticatorUpsellSetupAuthenticatorButtonMessage,
                            enabled: !p,
                            action: function() {
                                s(null), d(!0), l({
                                    type: am.SET_MODAL_STATE,
                                    modalState: i7.AUTHENTICATOR_UPSELL_DOWNLOAD_APPS
                                })
                            }
                        };
                    return (0, U.jsxs)(H().Fragment, {
                        children: [(0, U.jsx)(ak, {
                            headerText: o.Header.AuthenticatorUpsellWelcomeMessage,
                            buttonType: aL.CLOSE,
                            buttonAction: function() {
                                return aJ(function() {
                                    return a0(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return t(), [4, aJ(function() {
                                                    var e;
                                                    return a0(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, i.promptAssignments.updateForCurrentUser(tY.DISMISS_PROMPT, a.promptType)];
                                                            case 1:
                                                                return (e = t.sent()).isError && console.warn(oQ, "Dismissing Authenticator Upsell prompt failed with error", e.error && tH[e.error]), [2]
                                                        }
                                                    })
                                                })()];
                                            case 1:
                                                return e.sent(), [2]
                                        }
                                    })
                                })()
                            },
                            buttonEnabled: !p,
                            headerInfo: null
                        }), (0, U.jsxs)(om, {
                            children: [(0, U.jsx)("div", {
                                className: "authenticator-upsell-intro-grid",
                                children: (0, U.jsxs)("div", {
                                    className: "grid-container",
                                    children: [(0, U.jsx)("div", {
                                        className: "grid-item",
                                        children: (0, U.jsx)("div", {
                                            className: "modal-two-factors-icon"
                                        })
                                    }), (0, U.jsxs)("div", {
                                        className: "grid-item",
                                        children: [(0, U.jsx)("b", {
                                            children: o.Label.AuthenticatorUpsellTwoFactorHeadline
                                        }), (0, U.jsx)("div", {
                                            children: o.Label.AuthenticatorUpsellTwoFactorMessage
                                        })]
                                    }), (0, U.jsx)("div", {
                                        className: "grid-item",
                                        children: (0, U.jsx)("div", {
                                            className: "modal-protect-icon"
                                        })
                                    }), (0, U.jsxs)("div", {
                                        className: "grid-item",
                                        children: [(0, U.jsx)("b", {
                                            children: o.Label.AuthenticatorUpsellProtectRobuxHeadline
                                        }), (0, U.jsx)("div", {
                                            children: o.Label.AuthenticatorUpsellProtectRobuxMessage
                                        })]
                                    }), (0, U.jsx)("div", {
                                        className: "grid-item",
                                        children: (0, U.jsx)("div", {
                                            className: "modal-keep-bad-icon"
                                        })
                                    }), (0, U.jsxs)("div", {
                                        className: "grid-item",
                                        children: [(0, U.jsx)("b", {
                                            children: o.Label.AuthenticatorUpsellBadActorHeadline
                                        }), (0, U.jsx)("div", {
                                            children: o.Label.AuthenticatorUpsellBadActorMessage
                                        })]
                                    })]
                                })
                            }), (0, U.jsx)("p", {
                                className: "text-caption-small content-system-alert xsmall",
                                children: c
                            })]
                        }), (0, U.jsx)(a_, {
                            positiveButton: h,
                            negativeButton: null
                        })]
                    })
                },
                a2 = function(e) {
                    var t = e.closeModal,
                        r = aS().state.resources;
                    return (0, U.jsxs)(H().Fragment, {
                        children: [(0, U.jsx)(ak, {
                            headerText: r.Header.Success,
                            buttonType: aL.CLOSE,
                            buttonAction: t,
                            buttonEnabled: !0,
                            headerInfo: null
                        }), (0, U.jsxs)(om, {
                            children: [(0, U.jsx)("div", {
                                className: "modal-lock-icon"
                            }), (0, U.jsx)("p", {
                                className: "modal-margin-bottom-large",
                                children: r.Description.ChangeYourPasswordSuccess
                            })]
                        })]
                    })
                },
                a3 = 0,
                a6 = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        t = (0, B.useRef)();
                    return t.current || (a3 += 1, t.current = "".concat(e).concat(a3)), t.current
                };

            function a8(e) {
                var t = e.className;
                return H().createElement("svg", {
                    xmlns: "http://www.w3.org/2000/svg",
                    width: "13",
                    height: "6",
                    viewBox: "0 0 13 6",
                    fill: "none",
                    className: tz("block", t),
                    style: {
                        marginTop: -1
                    }
                }, H().createElement("path", {
                    d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
                    fill: "currentColor"
                }))
            }

            function a5(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function a4(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function a7(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function a9() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = a7(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : a7(t[e], null)
                        }
                    }
                }
            }

            function le() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return B.useCallback(a9.apply(void 0, function(e) {
                    if (Array.isArray(e)) return a4(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return a4(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return a4(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function lt(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lr(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function ln(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        lr(e, t, r[t])
                    })
                }
                return e
            }

            function lo(e) {
                return function(e) {
                    if (Array.isArray(e)) return lt(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return lt(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lt(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function li(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    n = function() {
                        var t = r.map(function(e) {
                            return B.createContext(e)
                        });
                        return function(r) {
                            var n = (null == r ? void 0 : r[e]) || t;
                            return B.useMemo(function() {
                                var t, o;
                                return lr({}, "__scope".concat(e), (t = ln({}, r), o = null != (o = lr({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
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
                    var o = B.createContext(n),
                        i = r.length;
                    r = lo(r).concat([n]);
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
                            u = (null == n || null == (r = n[e]) ? void 0 : r[i]) || o,
                            c = B.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, U.jsx)(u.Provider, {
                            value: c,
                            children: a
                        })
                    };
                    return a.displayName = t + "Provider", [a, function(r, a) {
                        var l, u = (null == a || null == (l = a[e]) ? void 0 : l[i]) || o,
                            c = B.useContext(u);
                        if (c) return c;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, la.apply(void 0, [n].concat(lo(t)))]
            }

            function la() {
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
                            return ln({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return B.useMemo(function() {
                            return lr({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }
            var ll = (null == (D = globalThis) ? void 0 : D.document) ? B.useLayoutEffect : function() {};

            function lu(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var lc = B["useId".toString()] || function() {},
                ls = 0,
                lf = ["top", "right", "bottom", "left"],
                lp = Math.min,
                ld = Math.max,
                lh = Math.round,
                ly = Math.floor,
                lm = function(e) {
                    return {
                        x: e,
                        y: e
                    }
                },
                lb = {
                    left: "right",
                    right: "left",
                    bottom: "top",
                    top: "bottom"
                },
                lv = {
                    start: "end",
                    end: "start"
                };

            function lg(e, t) {
                return "function" == typeof e ? e(t) : e
            }

            function lO(e) {
                return e.split("-")[0]
            }

            function lw(e) {
                return e.split("-")[1]
            }

            function lS(e) {
                return "x" === e ? "y" : "x"
            }

            function lE(e) {
                return "y" === e ? "height" : "width"
            }
            var lA = new Set(["top", "bottom"]);

            function lP(e) {
                return lA.has(lO(e)) ? "y" : "x"
            }

            function lj(e) {
                return e.replace(/start|end/g, function(e) {
                    return lv[e]
                })
            }
            var lx = ["left", "right"],
                lT = ["right", "left"],
                l_ = ["top", "bottom"],
                lI = ["bottom", "top"];

            function lC(e) {
                return e.replace(/left|right|bottom|top/g, function(e) {
                    return lb[e]
                })
            }

            function lR(e) {
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

            function lN(e) {
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

            function lD(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lM(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function lL(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            lM(i, n, o, a, l, "next", e)
                        }

                        function l(e) {
                            lM(i, n, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function lk(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function lU(e) {
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

            function lB(e, t) {
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

            function lH(e, t) {
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

            function lF(e) {
                return function(e) {
                    if (Array.isArray(e)) return lD(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return lD(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lD(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lV(e, t) {
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

            function lW(e, t, r) {
                var n, o = e.reference,
                    i = e.floating,
                    a = lP(t),
                    l = lS(lP(t)),
                    u = lE(l),
                    c = lO(t),
                    s = "y" === a,
                    f = o.x + o.width / 2 - i.width / 2,
                    p = o.y + o.height / 2 - i.height / 2,
                    d = o[u] / 2 - i[u] / 2;
                switch (c) {
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
                switch (lw(t)) {
                    case "start":
                        n[l] -= d * (r && s ? -1 : 1);
                        break;
                    case "end":
                        n[l] += d * (r && s ? -1 : 1)
                }
                return n
            }

            function lG(e, t) {
                return lL(function() {
                    var r, n, o, i, a, l, u, c, s, f, p, d, h, y, m, b, v, g, O, w, S, E, A, P, j, x, T, _, I, C, R;
                    return lV(this, function(N) {
                        switch (N.label) {
                            case 0:
                                return void 0 === t && (t = {}), n = e.x, o = e.y, i = e.platform, a = e.rects, l = e.elements, u = e.strategy, f = void 0 === (s = (c = lg(t, e)).boundary) ? "clippingAncestors" : s, d = void 0 === (p = c.rootBoundary) ? "viewport" : p, y = void 0 === (h = c.elementContext) ? "floating" : h, b = void 0 !== (m = c.altBoundary) && m, g = lR(void 0 === (v = c.padding) ? 0 : v), O = "floating" === y ? "reference" : "floating", w = l[b ? O : y], E = i.getClippingRect, A = {}, [4, null == i.isElement ? void 0 : i.isElement(w)];
                            case 1:
                                if (!(null == (r = N.sent()) || r)) return [3, 2];
                                return P = w, [3, 5];
                            case 2:
                                if (j = w.contextElement) return [3, 4];
                                return [4, null == i.getDocumentElement ? void 0 : i.getDocumentElement(l.floating)];
                            case 3:
                                j = N.sent(), N.label = 4;
                            case 4:
                                P = j, N.label = 5;
                            case 5:
                                return [4, E.apply(i, [(A.element = P, A.boundary = f, A.rootBoundary = d, A.strategy = u, A)])];
                            case 6:
                                return S = lN.apply(void 0, [N.sent()]), x = "floating" === y ? {
                                    x: n,
                                    y: o,
                                    width: a.floating.width,
                                    height: a.floating.height
                                } : a.reference, [4, null == i.getOffsetParent ? void 0 : i.getOffsetParent(l.floating)];
                            case 7:
                                return T = N.sent(), [4, null == i.isElement ? void 0 : i.isElement(T)];
                            case 8:
                                if (!N.sent()) return [3, 10];
                                return [4, null == i.getScale ? void 0 : i.getScale(T)];
                            case 9:
                                return I = N.sent() || {
                                    x: 1,
                                    y: 1
                                }, [3, 11];
                            case 10:
                                I = {
                                    x: 1,
                                    y: 1
                                }, N.label = 11;
                            case 11:
                                if (_ = I, !i.convertOffsetParentRelativeRectToViewportRelativeRect) return [3, 13];
                                return [4, i.convertOffsetParentRelativeRectToViewportRelativeRect({
                                    elements: l,
                                    rect: x,
                                    offsetParent: T,
                                    strategy: u
                                })];
                            case 12:
                                return R = N.sent(), [3, 14];
                            case 13:
                                R = x, N.label = 14;
                            case 14:
                                return C = lN.apply(void 0, [R]), [2, {
                                    top: (S.top - C.top + g.top) / _.y,
                                    bottom: (C.bottom - S.bottom + g.bottom) / _.y,
                                    left: (S.left - C.left + g.left) / _.x,
                                    right: (C.right - S.right + g.right) / _.x
                                }]
                        }
                    })
                })()
            }

            function lY(e, t) {
                return {
                    top: e.top - t.height,
                    right: e.right - t.width,
                    bottom: e.bottom - t.height,
                    left: e.left - t.width
                }
            }

            function lK(e) {
                return lf.some(function(t) {
                    return e[t] >= 0
                })
            }
            var lz = new Set(["left", "top"]);

            function lX(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function l$() {
                return "u" > typeof window
            }

            function lZ(e) {
                return lQ(e) ? (e.nodeName || "").toLowerCase() : "#document"
            }

            function lq(e) {
                var t;
                return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
            }

            function lJ(e) {
                var t;
                return null == (t = (lQ(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
            }

            function lQ(e) {
                return !!l$() && (lX(e, Node) || lX(e, lq(e).Node))
            }

            function l0(e) {
                return !!l$() && (lX(e, Element) || lX(e, lq(e).Element))
            }

            function l1(e) {
                return !!l$() && (lX(e, HTMLElement) || lX(e, lq(e).HTMLElement))
            }

            function l2(e) {
                return !(!l$() || "u" < typeof ShadowRoot) && (lX(e, ShadowRoot) || lX(e, lq(e).ShadowRoot))
            }
            var l3 = new Set(["inline", "contents"]);

            function l6(e) {
                var t = ui(e),
                    r = t.overflow,
                    n = t.overflowX,
                    o = t.overflowY,
                    i = t.display;
                return /auto|scroll|overlay|hidden|clip/.test(r + o + n) && !l3.has(i)
            }
            var l8 = new Set(["table", "td", "th"]),
                l5 = [":popover-open", ":modal"];

            function l4(e) {
                return l5.some(function(t) {
                    try {
                        return e.matches(t)
                    } catch (e) {
                        return !1
                    }
                })
            }
            var l7 = ["transform", "translate", "scale", "rotate", "perspective"],
                l9 = ["transform", "translate", "scale", "rotate", "perspective", "filter"],
                ue = ["paint", "layout", "strict", "content"];

            function ut(e) {
                var t = ur(),
                    r = l0(e) ? ui(e) : e;
                return l7.some(function(e) {
                    return !!r[e] && "none" !== r[e]
                }) || !!r.containerType && "normal" !== r.containerType || !t && !!r.backdropFilter && "none" !== r.backdropFilter || !t && !!r.filter && "none" !== r.filter || l9.some(function(e) {
                    return (r.willChange || "").includes(e)
                }) || ue.some(function(e) {
                    return (r.contain || "").includes(e)
                })
            }

            function ur() {
                return !("u" < typeof CSS) && !!CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")
            }
            var un = new Set(["html", "body", "#document"]);

            function uo(e) {
                return un.has(lZ(e))
            }

            function ui(e) {
                return lq(e).getComputedStyle(e)
            }

            function ua(e) {
                return l0(e) ? {
                    scrollLeft: e.scrollLeft,
                    scrollTop: e.scrollTop
                } : {
                    scrollLeft: e.scrollX,
                    scrollTop: e.scrollY
                }
            }

            function ul(e) {
                if ("html" === lZ(e)) return e;
                var t = e.assignedSlot || e.parentNode || l2(e) && e.host || lJ(e);
                return l2(t) ? t.host : t
            }

            function uu(e, t, r) {
                void 0 === t && (t = []), void 0 === r && (r = !0);
                var n, o = function e(t) {
                        var r = ul(t);
                        return uo(r) ? t.ownerDocument ? t.ownerDocument.body : t.body : l1(r) && l6(r) ? r : e(r)
                    }(e),
                    i = o === (null == (n = e.ownerDocument) ? void 0 : n.body),
                    a = lq(o);
                if (i) {
                    var l = uc(a);
                    return t.concat(a, a.visualViewport || [], l6(o) ? o : [], l && r ? uu(l) : [])
                }
                return t.concat(o, uu(o, [], r))
            }

            function uc(e) {
                return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
            }

            function us(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uf(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function up(e) {
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

            function ud(e, t) {
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

            function uh(e) {
                return function(e) {
                    if (Array.isArray(e)) return us(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || uy(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function uy(e, t) {
                if (e) {
                    if ("string" == typeof e) return us(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return us(e, t)
                }
            }

            function um(e) {
                var t = ui(e),
                    r = parseFloat(t.width) || 0,
                    n = parseFloat(t.height) || 0,
                    o = l1(e),
                    i = o ? e.offsetWidth : r,
                    a = o ? e.offsetHeight : n,
                    l = lh(r) !== i || lh(n) !== a;
                return l && (r = i, n = a), {
                    width: r,
                    height: n,
                    $: l
                }
            }

            function ub(e) {
                return l0(e) ? e : e.contextElement
            }

            function uv(e) {
                var t = ub(e);
                if (!l1(t)) return lm(1);
                var r = t.getBoundingClientRect(),
                    n = um(t),
                    o = n.width,
                    i = n.height,
                    a = n.$,
                    l = (a ? lh(r.width) : r.width) / o,
                    u = (a ? lh(r.height) : r.height) / i;
                return l && Number.isFinite(l) || (l = 1), u && Number.isFinite(u) || (u = 1), {
                    x: l,
                    y: u
                }
            }
            var ug = lm(0);

            function uO(e) {
                var t = lq(e);
                return ur() && t.visualViewport ? {
                    x: t.visualViewport.offsetLeft,
                    y: t.visualViewport.offsetTop
                } : ug
            }

            function uw(e, t, r, n) {
                void 0 === t && (t = !1), void 0 === r && (r = !1);
                var o, i = e.getBoundingClientRect(),
                    a = ub(e),
                    l = lm(1);
                t && (n ? l0(n) && (l = uv(n)) : l = uv(e));
                var u = (void 0 === (o = r) && (o = !1), n && (!o || n === lq(a)) && o) ? uO(a) : lm(0),
                    c = (i.left + u.x) / l.x,
                    s = (i.top + u.y) / l.y,
                    f = i.width / l.x,
                    p = i.height / l.y;
                if (a)
                    for (var d = lq(a), h = n && l0(n) ? lq(n) : n, y = d, m = uc(y); m && n && h !== y;) {
                        var b = uv(m),
                            v = m.getBoundingClientRect(),
                            g = ui(m),
                            O = v.left + (m.clientLeft + parseFloat(g.paddingLeft)) * b.x,
                            w = v.top + (m.clientTop + parseFloat(g.paddingTop)) * b.y;
                        c *= b.x, s *= b.y, f *= b.x, p *= b.y, c += O, s += w, m = uc(y = lq(m))
                    }
                return lN({
                    width: f,
                    height: p,
                    x: c,
                    y: s
                })
            }

            function uS(e, t) {
                var r = ua(e).scrollLeft;
                return t ? t.left + r : uw(lJ(e)).left + r
            }

            function uE(e, t) {
                var r = e.getBoundingClientRect();
                return {
                    x: r.left + t.scrollLeft - uS(e, r),
                    y: r.top + t.scrollTop
                }
            }
            var uA = new Set(["absolute", "fixed"]);

            function uP(e, t, r) {
                if ("viewport" === t) n = function(e, t) {
                    var r = lq(e),
                        n = lJ(e),
                        o = r.visualViewport,
                        i = n.clientWidth,
                        a = n.clientHeight,
                        l = 0,
                        u = 0;
                    if (o) {
                        i = o.width, a = o.height;
                        var c = ur();
                        (!c || c && "fixed" === t) && (l = o.offsetLeft, u = o.offsetTop)
                    }
                    var s = uS(n);
                    if (s <= 0) {
                        var f = n.ownerDocument,
                            p = f.body,
                            d = getComputedStyle(p),
                            h = "CSS1Compat" === f.compatMode && parseFloat(d.marginLeft) + parseFloat(d.marginRight) || 0,
                            y = Math.abs(n.clientWidth - p.clientWidth - h);
                        y <= 25 && (i -= y)
                    } else s <= 25 && (i += s);
                    return {
                        width: i,
                        height: a,
                        x: l,
                        y: u
                    }
                }(e, r);
                else if ("document" === t) o = lJ(e), i = lJ(o), a = ua(o), l = o.ownerDocument.body, u = ld(i.scrollWidth, i.clientWidth, l.scrollWidth, l.clientWidth), c = ld(i.scrollHeight, i.clientHeight, l.scrollHeight, l.clientHeight), s = -a.scrollLeft + uS(o), f = -a.scrollTop, "rtl" === ui(l).direction && (s += ld(i.clientWidth, l.clientWidth) - u), n = {
                    width: u,
                    height: c,
                    x: s,
                    y: f
                };
                else if (l0(t)) d = (p = uw(t, !0, "fixed" === r)).top + t.clientTop, h = p.left + t.clientLeft, y = l1(t) ? uv(t) : lm(1), n = {
                    width: t.clientWidth * y.x,
                    height: t.clientHeight * y.y,
                    x: h * y.x,
                    y: d * y.y
                };
                else {
                    var n, o, i, a, l, u, c, s, f, p, d, h, y, m = uO(e);
                    n = {
                        x: t.x - m.x,
                        y: t.y - m.y,
                        width: t.width,
                        height: t.height
                    }
                }
                return lN(n)
            }

            function uj(e, t, r) {
                var n = l1(t),
                    o = lJ(t),
                    i = "fixed" === r,
                    a = uw(e, !0, i, t),
                    l = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    u = lm(0);
                if (n || !n && !i)
                    if (("body" !== lZ(t) || l6(o)) && (l = ua(t)), n) {
                        var c = uw(t, !0, i, t);
                        u.x = c.x + t.clientLeft, u.y = c.y + t.clientTop
                    } else o && (u.x = uS(o));
                i && !n && o && (u.x = uS(o));
                var s = !o || n || i ? lm(0) : uE(o, l);
                return {
                    x: a.left + l.scrollLeft - u.x - s.x,
                    y: a.top + l.scrollTop - u.y - s.y,
                    width: a.width,
                    height: a.height
                }
            }

            function ux(e) {
                return "static" === ui(e).position
            }

            function uT(e, t) {
                if (!l1(e) || "fixed" === ui(e).position) return null;
                if (t) return t(e);
                var r = e.offsetParent;
                return lJ(e) === r && (r = r.ownerDocument.body), r
            }

            function u_(e, t) {
                var r, n = lq(e);
                if (l4(e)) return n;
                if (!l1(e)) {
                    for (var o = ul(e); o && !uo(o);) {
                        if (l0(o) && !ux(o)) return o;
                        o = ul(o)
                    }
                    return n
                }
                for (var i = uT(e, t); i && (r = i, l8.has(lZ(r))) && ux(i);) i = uT(i, t);
                return i && uo(i) && ux(i) && !ut(i) ? n : i || function(e) {
                    for (var t = ul(e); l1(t) && !uo(t);) {
                        if (ut(t)) return t;
                        if (l4(t)) break;
                        t = ul(t)
                    }
                    return null
                }(e) || n
            }
            var uI = {
                convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
                    var t = e.elements,
                        r = e.rect,
                        n = e.offsetParent,
                        o = "fixed" === e.strategy,
                        i = lJ(n),
                        a = !!t && l4(t.floating);
                    if (n === i || a && o) return r;
                    var l = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        u = lm(1),
                        c = lm(0),
                        s = l1(n);
                    if ((s || !s && !o) && (("body" !== lZ(n) || l6(i)) && (l = ua(n)), l1(n))) {
                        var f = uw(n);
                        u = uv(n), c.x = f.x + n.clientLeft, c.y = f.y + n.clientTop
                    }
                    var p = !i || s || o ? lm(0) : uE(i, l);
                    return {
                        width: r.width * u.x,
                        height: r.height * u.y,
                        x: r.x * u.x - l.scrollLeft * u.x + c.x + p.x,
                        y: r.y * u.y - l.scrollTop * u.y + c.y + p.y
                    }
                },
                getDocumentElement: lJ,
                getClippingRect: function(e) {
                    var t = e.element,
                        r = e.boundary,
                        n = e.rootBoundary,
                        o = e.strategy,
                        i = uh("clippingAncestors" === r ? l4(t) ? [] : function(e, t) {
                            var r = t.get(e);
                            if (r) return r;
                            for (var n = uu(e, [], !1).filter(function(e) {
                                    return l0(e) && "body" !== lZ(e)
                                }), o = null, i = "fixed" === ui(e).position, a = i ? ul(e) : e; l0(a) && !uo(a);) {
                                var l = ui(a),
                                    u = ut(a);
                                u || "fixed" !== l.position || (o = null), (i ? !u && !o : !u && "static" === l.position && !!o && uA.has(o.position) || l6(a) && !u && function e(t, r) {
                                    var n = ul(t);
                                    return !(n === r || !l0(n) || uo(n)) && ("fixed" === ui(n).position || e(n, r))
                                }(e, a)) ? n = n.filter(function(e) {
                                    return e !== a
                                }) : o = l, a = ul(a)
                            }
                            return t.set(e, n), n
                        }(t, this._c) : [].concat(r)).concat([n]),
                        a = i[0],
                        l = i.reduce(function(e, r) {
                            var n = uP(t, r, o);
                            return e.top = ld(n.top, e.top), e.right = lp(n.right, e.right), e.bottom = lp(n.bottom, e.bottom), e.left = ld(n.left, e.left), e
                        }, uP(t, a, o));
                    return {
                        width: l.right - l.left,
                        height: l.bottom - l.top,
                        x: l.left,
                        y: l.top
                    }
                },
                getOffsetParent: u_,
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
                        }(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    return t = this.getOffsetParent || u_, [4, (0, this.getDimensions)(e.floating)];
                                case 1:
                                    return r = i.sent(), n = {}, o = [e.reference], [4, t(e.floating)];
                                case 2:
                                    return [2, (n.reference = uj.apply(void 0, o.concat([i.sent(), e.strategy])), n.floating = {
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
                                uf(i, n, o, a, l, "next", e)
                            }

                            function l(e) {
                                uf(i, n, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    }).call(this)
                },
                getClientRects: function(e) {
                    return Array.from(e.getClientRects())
                },
                getDimensions: function(e) {
                    var t = um(e);
                    return {
                        width: t.width,
                        height: t.height
                    }
                },
                getScale: uv,
                isElement: l0,
                isRTL: function(e) {
                    return "rtl" === ui(e).direction
                }
            };

            function uC(e, t) {
                return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
            }

            function uR(e, t, r, n) {
                void 0 === n && (n = {});
                var o, i = n.ancestorScroll,
                    a = void 0 === i || i,
                    l = n.ancestorResize,
                    u = void 0 === l || l,
                    c = n.elementResize,
                    s = void 0 === c ? "function" == typeof ResizeObserver : c,
                    f = n.layoutShift,
                    p = void 0 === f ? "function" == typeof IntersectionObserver : f,
                    d = n.animationFrame,
                    h = void 0 !== d && d,
                    y = ub(e),
                    m = a || u ? uh(y ? uu(y) : []).concat(uh(uu(t))) : [];
                m.forEach(function(e) {
                    a && e.addEventListener("scroll", r, {
                        passive: !0
                    }), u && e.addEventListener("resize", r)
                });
                var b = y && p ? function(e, t) {
                        var r, n = null,
                            o = lJ(e);

                        function i() {
                            var e;
                            clearTimeout(r), null == (e = n) || e.disconnect(), n = null
                        }
                        return ! function a(l, u) {
                            void 0 === l && (l = !1), void 0 === u && (u = 1), i();
                            var c = e.getBoundingClientRect(),
                                s = c.left,
                                f = c.top,
                                p = c.width,
                                d = c.height;
                            if (l || t(), p && d) {
                                var h = {
                                        rootMargin: -ly(f) + "px " + -ly(o.clientWidth - (s + p)) + "px " + -ly(o.clientHeight - (f + d)) + "px " + -ly(s) + "px",
                                        threshold: ld(0, lp(1, u)) || 1
                                    },
                                    y = !0;
                                try {
                                    n = new IntersectionObserver(m, ud(up({}, h), {
                                        root: o.ownerDocument
                                    }))
                                } catch (e) {
                                    n = new IntersectionObserver(m, h)
                                }
                                n.observe(e)
                            }

                            function m(t) {
                                var n = t[0].intersectionRatio;
                                if (n !== u) {
                                    if (!y) return a();
                                    n ? a(!1, n) : r = setTimeout(function() {
                                        a(!1, 1e-7)
                                    }, 1e3)
                                }
                                1 !== n || uC(c, e.getBoundingClientRect()) || a(), y = !1
                            }
                        }(!0), i
                    }(y, r) : null,
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
                    }(e) || uy(e, 1) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())[0];
                    n && n.target === y && g && (g.unobserve(t), cancelAnimationFrame(v), v = requestAnimationFrame(function() {
                        var e;
                        null == (e = g) || e.observe(t)
                    })), r()
                }), y && !h && g.observe(y), g.observe(t));
                var O = h ? uw(e) : null;
                return h && function t() {
                        var n = uw(e);
                        O && !uC(O, n) && r(), O = n, o = requestAnimationFrame(t)
                    }(), r(),
                    function() {
                        var e;
                        m.forEach(function(e) {
                            a && e.removeEventListener("scroll", r), u && e.removeEventListener("resize", r)
                        }), null == b || b(), null == (e = g) || e.disconnect(), g = null, h && cancelAnimationFrame(o)
                    }
            }
            var uN = function(e) {
                    return {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            return lL(function() {
                                var r, n, o, i, a, l, u, c, s, f, p, d, h, y, m, b, v, g, O, w, S, E, A, P, j, x, T, _, I, C, R, N, D, M, L, k, U;
                                return lV(this, function(B) {
                                    switch (B.label) {
                                        case 0:
                                            if (r = t.x, n = t.y, o = t.placement, i = t.rects, a = t.platform, l = t.elements, u = t.middlewareData, s = (c = lg(e, t) || {}).element, p = void 0 === (f = c.padding) ? 0 : f, null == s) return [2, {}];
                                            return d = lR(p), h = {
                                                x: r,
                                                y: n
                                            }, m = lE(y = lS(lP(o))), [4, a.getDimensions(s)];
                                        case 1:
                                            return b = B.sent(), g = (v = "y" === y) ? "top" : "left", O = v ? "bottom" : "right", w = v ? "clientHeight" : "clientWidth", S = i.reference[m] + i.reference[y] - h[y] - i.floating[m], E = h[y] - i.reference[y], [4, null == a.getOffsetParent ? void 0 : a.getOffsetParent(s)];
                                        case 2:
                                            if (j = !(P = (A = B.sent()) ? A[w] : 0)) return [3, 4];
                                            return [4, null == a.isElement ? void 0 : a.isElement(A)];
                                        case 3:
                                            j = !B.sent(), B.label = 4;
                                        case 4:
                                            return j && (P = l.floating[w] || i.floating[m]), x = S / 2 - E / 2, T = P / 2 - b[m] / 2 - 1, _ = lp(d[g], T), I = lp(d[O], T), C = _, R = P - b[m] - I, D = ld(C, lp(N = P / 2 - b[m] / 2 + x, R)), L = (M = !u.arrow && null != lw(o) && N !== D && i.reference[m] / 2 - (N < C ? _ : I) - b[m] / 2 < 0) ? N < C ? N - C : N - R : 0, [2, (lk(U = {}, y, h[y] + L), lk(U, "data", lU((lk(k = {}, y, D), lk(k, "centerOffset", N - D - L), k), M && {
                                                alignmentOffset: L
                                            })), lk(U, "reset", M), U)]
                                    }
                                })
                            })()
                        }
                    }
                },
                uD = function(e, t, r) {
                    var n, o = new Map,
                        i = up({
                            platform: uI
                        }, r),
                        a = ud(up({}, i.platform), {
                            _c: o
                        });
                    return n = ud(up({}, i), {
                        platform: a
                    }), lL(function() {
                        var r, o, i, a, l, u, c, s, f, p, d, h, y, m, b, v, g, O, w, S, E, A, P, j, x, T;
                        return lV(this, function(_) {
                            switch (_.label) {
                                case 0:
                                    return o = void 0 === (r = n.placement) ? "bottom" : r, a = void 0 === (i = n.strategy) ? "absolute" : i, u = void 0 === (l = n.middleware) ? [] : l, c = n.platform, s = u.filter(Boolean), [4, null == c.isRTL ? void 0 : c.isRTL(t)];
                                case 1:
                                    return f = _.sent(), [4, c.getElementRects({
                                        reference: e,
                                        floating: t,
                                        strategy: a
                                    })];
                                case 2:
                                    h = (d = lW(p = _.sent(), o, f)).x, y = d.y, m = o, b = {}, v = 0, g = 0, _.label = 3;
                                case 3:
                                    if (!(g < s.length)) return [3, 11];
                                    return w = (O = s[g]).name, [4, (0, O.fn)({
                                        x: h,
                                        y: y,
                                        initialPlacement: o,
                                        placement: m,
                                        strategy: a,
                                        middlewareData: b,
                                        rects: p,
                                        platform: c,
                                        elements: {
                                            reference: e,
                                            floating: t
                                        }
                                    })];
                                case 4:
                                    var I;
                                    if (E = (S = _.sent()).x, A = S.y, P = S.data, j = S.reset, h = null != E ? E : h, y = null != A ? A : y, b = lB(lU({}, b), lk({}, w, lU({}, b[w], P))), !(j && v <= 50)) return [3, 10];
                                    if (v++, (void 0 === j ? "undefined" : (I = j) && "u" > typeof Symbol && I.constructor === Symbol ? "symbol" : typeof I) != "object") return [3, 9];
                                    if (j.placement && (m = j.placement), !j.rects) return [3, 8];
                                    if (!0 !== j.rects) return [3, 6];
                                    return [4, c.getElementRects({
                                        reference: e,
                                        floating: t,
                                        strategy: a
                                    })];
                                case 5:
                                    return x = _.sent(), [3, 7];
                                case 6:
                                    x = j.rects, _.label = 7;
                                case 7:
                                    p = x, _.label = 8;
                                case 8:
                                    h = (T = lW(p, m, f)).x, y = T.y, _.label = 9;
                                case 9:
                                    g = -1, _.label = 10;
                                case 10:
                                    return g++, [3, 3];
                                case 11:
                                    return [2, {
                                        x: h,
                                        y: y,
                                        placement: m,
                                        strategy: a,
                                        middlewareData: b
                                    }]
                            }
                        })
                    })()
                };

            function uM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uL(e) {
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

            function uU(e, t) {
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
                        if ("string" == typeof e) return uM(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uM(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function uB(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var uH = "u" > typeof document ? B.useLayoutEffect : function() {};

            function uF(e, t) {
                if (e === t) return !0;
                if ((void 0 === e ? "undefined" : uB(e)) !== (void 0 === t ? "undefined" : uB(t))) return !1;
                if ("function" == typeof e && e.toString() === t.toString()) return !0;
                if (e && t && (void 0 === e ? "undefined" : uB(e)) === "object") {
                    if (Array.isArray(e)) {
                        if ((r = e.length) !== t.length) return !1;
                        for (n = r; 0 != n--;)
                            if (!uF(e[n], t[n])) return !1;
                        return !0
                    }
                    if ((r = (o = Object.keys(e)).length) !== Object.keys(t).length) return !1;
                    for (n = r; 0 != n--;)
                        if (!({}).hasOwnProperty.call(t, o[n])) return !1;
                    for (n = r; 0 != n--;) {
                        var r, n, o, i = o[n];
                        if (("_owner" !== i || !e.$$typeof) && !uF(e[i], t[i])) return !1
                    }
                    return !0
                }
                return e != e && t != t
            }

            function uV(e) {
                return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
            }

            function uW(e, t) {
                var r = uV(e);
                return Math.round(t * r) / r
            }

            function uG(e) {
                var t = B.useRef(e);
                return uH(function() {
                    t.current = e
                }), t
            }
            var uY = function(e, t) {
                    var r;
                    return uk(uL({}, (void 0 === (r = e) && (r = 0), {
                        name: "offset",
                        options: r,
                        fn: function(e) {
                            return lL(function() {
                                var t, n, o, i, a, l, u;
                                return lV(this, function(c) {
                                    switch (c.label) {
                                        case 0:
                                            var s;
                                            return o = e.x, i = e.y, a = e.placement, l = e.middlewareData, [4, (s = r, lL(function() {
                                                var t, r, n, o, i, a, l, u, c, f, p, d, h, y;
                                                return lV(this, function(m) {
                                                    switch (m.label) {
                                                        case 0:
                                                            return t = e.placement, r = e.platform, n = e.elements, [4, null == r.isRTL ? void 0 : r.isRTL(n.floating)];
                                                        case 1:
                                                            return o = m.sent(), i = lO(t), a = lw(t), l = "y" === lP(t), u = lz.has(i) ? -1 : 1, c = o && l ? -1 : 1, d = (p = "number" == typeof(f = lg(s, e)) ? {
                                                                mainAxis: f,
                                                                crossAxis: 0,
                                                                alignmentAxis: null
                                                            } : {
                                                                mainAxis: f.mainAxis || 0,
                                                                crossAxis: f.crossAxis || 0,
                                                                alignmentAxis: f.alignmentAxis
                                                            }).mainAxis, h = p.crossAxis, y = p.alignmentAxis, a && "number" == typeof y && (h = "end" === a ? -1 * y : y), [2, l ? {
                                                                x: h * c,
                                                                y: d * u
                                                            } : {
                                                                x: d * u,
                                                                y: h * c
                                                            }]
                                                    }
                                                })
                                            })())];
                                        case 1:
                                            if (u = c.sent(), a === (null == (t = l.offset) ? void 0 : t.placement) && null != (n = l.arrow) && n.alignmentOffset) return [2, {}];
                                            return [2, {
                                                x: o + u.x,
                                                y: i + u.y,
                                                data: lB(lU({}, u), {
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
                uK = function(e, t) {
                    var r;
                    return uk(uL({}, (void 0 === (r = e) && (r = {}), {
                        name: "shift",
                        options: r,
                        fn: function(e) {
                            return lL(function() {
                                var t, n, o, i, a, l, u, c, s, f, p, d, h, y, m, b, v, g, O, w, S, E, A, P, j, x, T, _;
                                return lV(this, function(I) {
                                    switch (I.label) {
                                        case 0:
                                            return t = e.x, n = e.y, o = e.placement, l = void 0 === (a = (i = lg(r, e)).mainAxis) || a, c = void 0 !== (u = i.crossAxis) && u, f = void 0 === (s = i.limiter) ? {
                                                fn: function(e) {
                                                    return {
                                                        x: e.x,
                                                        y: e.y
                                                    }
                                                }
                                            } : s, p = lH(i, ["mainAxis", "crossAxis", "limiter"]), d = {
                                                x: t,
                                                y: n
                                            }, [4, lG(e, p)];
                                        case 1:
                                            return h = I.sent(), b = d[m = lS(y = lP(lO(o)))], v = d[y], l && (g = "y" === m ? "top" : "left", O = "y" === m ? "bottom" : "right", w = b + h[g], S = b - h[O], b = ld(w, lp(b, S))), c && (E = "y" === y ? "top" : "left", A = "y" === y ? "bottom" : "right", P = v + h[E], j = v - h[A], v = ld(P, lp(v, j))), T = f.fn(lB(lU({}, e), (lk(x = {}, m, b), lk(x, y, v), x))), [2, lB(lU({}, T), {
                                                data: {
                                                    x: T.x - t,
                                                    y: T.y - n,
                                                    enabled: (lk(_ = {}, m, l), lk(_, y, c), _)
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
                uz = function(e, t) {
                    var r;
                    return uk(uL({}, (void 0 === (r = e) && (r = {}), {
                        options: r,
                        fn: function(e) {
                            var t, n = e.x,
                                o = e.y,
                                i = e.placement,
                                a = e.rects,
                                l = e.middlewareData,
                                u = lg(r, e),
                                c = u.offset,
                                s = u.mainAxis,
                                f = u.crossAxis,
                                p = {
                                    x: n,
                                    y: o
                                },
                                d = lP(i),
                                h = lS(d),
                                y = p[h],
                                m = p[d],
                                b = lg(void 0 === c ? 0 : c, e),
                                v = "number" == typeof b ? {
                                    mainAxis: b,
                                    crossAxis: 0
                                } : lU({
                                    mainAxis: 0,
                                    crossAxis: 0
                                }, b);
                            if (void 0 === s || s) {
                                var g = "y" === h ? "height" : "width",
                                    O = a.reference[h] - a.floating[g] + v.mainAxis,
                                    w = a.reference[h] + a.reference[g] - v.mainAxis;
                                y < O ? y = O : y > w && (y = w)
                            }
                            if (void 0 === f || f) {
                                var S, E, A = "y" === h ? "width" : "height",
                                    P = lz.has(lO(i)),
                                    j = a.reference[d] - a.floating[A] + (P && (null == (S = l.offset) ? void 0 : S[d]) || 0) + (P ? 0 : v.crossAxis),
                                    x = a.reference[d] + a.reference[A] + (P ? 0 : (null == (E = l.offset) ? void 0 : E[d]) || 0) - (P ? v.crossAxis : 0);
                                m < j ? m = j : m > x && (m = x)
                            }
                            return lk(t = {}, h, y), lk(t, d, m), t
                        }
                    })), {
                        options: [e, t]
                    })
                },
                uX = function(e, t) {
                    var r;
                    return uk(uL({}, (void 0 === (r = e) && (r = {}), {
                        name: "flip",
                        options: r,
                        fn: function(e) {
                            return lL(function() {
                                var t, n, o, i, a, l, u, c, s, f, p, d, h, y, m, b, v, g, O, w, S, E, A, P, j, x, T, _, I, C, R, N, D, M, L, k, U, B, H, F;
                                return lV(this, function(V) {
                                    var W, G, Y, K, z, X, $, Z, q, J, Q, ee, et, er, en;
                                    switch (V.label) {
                                        case 0:
                                            if (o = e.placement, i = e.middlewareData, a = e.rects, l = e.initialPlacement, u = e.platform, c = e.elements, p = void 0 === (f = (s = lg(r, e)).mainAxis) || f, h = void 0 === (d = s.crossAxis) || d, y = s.fallbackPlacements, b = void 0 === (m = s.fallbackStrategy) ? "bestFit" : m, g = void 0 === (v = s.fallbackAxisSideDirection) ? "none" : v, w = void 0 === (O = s.flipAlignment) || O, S = lH(s, ["mainAxis", "crossAxis", "fallbackPlacements", "fallbackStrategy", "fallbackAxisSideDirection", "flipAlignment"]), null != (t = i.arrow) && t.alignmentOffset) return [2, {}];
                                            return E = lO(o), A = lP(l), P = lO(l) === l, [4, null == u.isRTL ? void 0 : u.isRTL(c.floating)];
                                        case 1:
                                            return j = V.sent(), x = y || (P || !w ? [lC(l)] : (G = lC(W = l), [lj(W), G, lj(G)])), T = "none" !== g, !y && T && (_ = x).push.apply(_, lF((Y = l, K = w, z = g, X = j, $ = lw(Y), Z = function(e, t, r) {
                                                switch (e) {
                                                    case "top":
                                                    case "bottom":
                                                        if (r) return t ? lT : lx;
                                                        return t ? lx : lT;
                                                    case "left":
                                                    case "right":
                                                        return t ? l_ : lI;
                                                    default:
                                                        return []
                                                }
                                            }(lO(Y), "start" === z, X), $ && (Z = Z.map(function(e) {
                                                return e + "-" + $
                                            }), K && (Z = Z.concat(Z.map(lj)))), Z))), I = [l].concat(lF(x)), [4, lG(e, S)];
                                        case 2:
                                            if (C = V.sent(), R = [], N = (null == (n = i.flip) ? void 0 : n.overflows) || [], p && R.push(C[E]), h && (q = o, J = a, void 0 === (Q = j) && (Q = !1), ee = lw(q), er = lE(et = lS(lP(q))), en = "x" === et ? ee === (Q ? "end" : "start") ? "right" : "left" : "start" === ee ? "bottom" : "top", J.reference[er] > J.floating[er] && (en = lC(en)), D = [en, lC(en)], R.push(C[D[0]], C[D[1]])), N = lF(N).concat([{
                                                    placement: o,
                                                    overflows: R
                                                }]), !R.every(function(e) {
                                                    return e <= 0
                                                })) {
                                                if ((U = I[k = ((null == (M = i.flip) ? void 0 : M.index) || 0) + 1]) && ("alignment" !== h || A === lP(U) || N.every(function(e) {
                                                        return lP(e.placement) !== A || e.overflows[0] > 0
                                                    }))) return [2, {
                                                    data: {
                                                        index: k,
                                                        overflows: N
                                                    },
                                                    reset: {
                                                        placement: U
                                                    }
                                                }];
                                                if (!(B = null == (L = N.filter(function(e) {
                                                        return e.overflows[0] <= 0
                                                    }).sort(function(e, t) {
                                                        return e.overflows[1] - t.overflows[1]
                                                    })[0]) ? void 0 : L.placement)) switch (b) {
                                                    case "bestFit":
                                                        (F = null == (H = N.filter(function(e) {
                                                            if (T) {
                                                                var t = lP(e.placement);
                                                                return t === A || "y" === t
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
                                                        })[0]) ? void 0 : H[0]) && (B = F);
                                                        break;
                                                    case "initialPlacement":
                                                        B = l
                                                }
                                                if (o !== B) return [2, {
                                                    reset: {
                                                        placement: B
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
                u$ = function(e, t) {
                    var r;
                    return uk(uL({}, (void 0 === (r = e) && (r = {}), {
                        name: "size",
                        options: r,
                        fn: function(e) {
                            return lL(function() {
                                var t, n, o, i, a, l, u, c, s, f, p, d, h, y, m, b, v, g, O, w, S, E, A, P, j, x, T, _, I, C;
                                return lV(this, function(R) {
                                    switch (R.label) {
                                        case 0:
                                            return o = e.placement, i = e.rects, a = e.platform, l = e.elements, s = void 0 === (c = (u = lg(r, e)).apply) ? function() {} : c, [4, lG(e, lH(u, ["apply"]))];
                                        case 1:
                                            if (f = R.sent(), p = lO(o), d = lw(o), h = "y" === lP(o), m = (y = i.floating).width, b = y.height, "top" !== p && "bottom" !== p) return [3, 3];
                                            return v = p, [4, null == a.isRTL ? void 0 : a.isRTL(l.floating)];
                                        case 2:
                                            return g = d === (R.sent() ? "start" : "end") ? "left" : "right", [3, 4];
                                        case 3:
                                            g = p, v = "end" === d ? "top" : "bottom", R.label = 4;
                                        case 4:
                                            return O = b - f.top - f.bottom, w = m - f.left - f.right, S = lp(b - f[v], O), E = lp(m - f[g], w), A = !e.middlewareData.shift, P = S, j = E, null != (t = e.middlewareData.shift) && t.enabled.x && (j = w), null != (n = e.middlewareData.shift) && n.enabled.y && (P = O), A && !d && (x = ld(f.left, 0), T = ld(f.right, 0), _ = ld(f.top, 0), I = ld(f.bottom, 0), h ? j = m - 2 * (0 !== x || 0 !== T ? x + T : ld(f.left, f.right)) : P = b - 2 * (0 !== _ || 0 !== I ? _ + I : ld(f.top, f.bottom))), [4, s(lB(lU({}, e), {
                                                availableWidth: j,
                                                availableHeight: P
                                            }))];
                                        case 5:
                                            return R.sent(), [4, a.getDimensions(l.floating)];
                                        case 6:
                                            if (C = R.sent(), m !== C.width || b !== C.height) return [2, {
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
                uZ = function(e, t) {
                    var r;
                    return uk(uL({}, (void 0 === (r = e) && (r = {}), {
                        name: "hide",
                        options: r,
                        fn: function(e) {
                            return lL(function() {
                                var t, n, o, i, a, l, u;
                                return lV(this, function(c) {
                                    switch (c.label) {
                                        case 0:
                                            switch (t = e.rects, i = void 0 === (o = (n = lg(r, e)).strategy) ? "referenceHidden" : o, a = lH(n, ["strategy"]), i) {
                                                case "referenceHidden":
                                                    return [3, 1];
                                                case "escaped":
                                                    return [3, 3]
                                            }
                                            return [3, 5];
                                        case 1:
                                            return [4, lG(e, lB(lU({}, a), {
                                                elementContext: "reference"
                                            }))];
                                        case 2:
                                            return [2, {
                                                data: {
                                                    referenceHiddenOffsets: l = lY(c.sent(), t.reference),
                                                    referenceHidden: lK(l)
                                                }
                                            }];
                                        case 3:
                                            return [4, lG(e, lB(lU({}, a), {
                                                altBoundary: !0
                                            }))];
                                        case 4:
                                            return [2, {
                                                data: {
                                                    escapedOffsets: u = lY(c.sent(), t.floating),
                                                    escaped: lK(u)
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
                uq = function(e, t) {
                    return uk(uL({}, {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            var r = "function" == typeof e ? e(t) : e,
                                n = r.element,
                                o = r.padding;
                            return n && ({}).hasOwnProperty.call(n, "current") ? null != n.current ? uN({
                                element: n.current,
                                padding: o
                            }).fn(t) : {} : n ? uN({
                                element: n,
                                padding: o
                            }).fn(t) : {}
                        }
                    }), {
                        options: [e, t]
                    })
                };

            function uJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uQ(e) {
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

            function u0(e, t) {
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

            function u1(e, t) {
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

            function u2(e) {
                return function(e) {
                    if (Array.isArray(e)) return uJ(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return uJ(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return uJ(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var u3 = B.forwardRef(function(e, t) {
                var r = e.children,
                    n = u1(e, ["children"]),
                    o = B.Children.toArray(r),
                    i = o.find(u5);
                if (i) {
                    var a = i.props.children,
                        l = o.map(function(e) {
                            return e !== i ? e : B.Children.count(a) > 1 ? B.Children.only(null) : B.isValidElement(a) ? a.props.children : null
                        });
                    return (0, U.jsx)(u6, u0(uQ({}, n), {
                        ref: t,
                        children: B.isValidElement(a) ? B.cloneElement(a, void 0, l) : null
                    }))
                }
                return (0, U.jsx)(u6, u0(uQ({}, n), {
                    ref: t,
                    children: r
                }))
            });
            u3.displayName = "Slot";
            var u6 = B.forwardRef(function(e, t) {
                var r = e.children,
                    n = u1(e, ["children"]);
                if (B.isValidElement(r)) {
                    var o, i, a, l, u, c = (u = (l = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref;
                    return B.cloneElement(r, u0(uQ({}, function(e, t) {
                        var r = uQ({}, t);
                        for (var n in t) ! function(n) {
                            var o = e[n],
                                i = t[n];
                            /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                i.apply(void 0, u2(t)), o.apply(void 0, u2(t))
                            } : o && (r[n] = o) : "style" === n ? r[n] = uQ({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                        }(n);
                        return uQ({}, e, r)
                    }(n, r.props)), {
                        ref: t ? a9(t, c) : c
                    }))
                }
                return B.Children.count(r) > 1 ? B.Children.only(null) : null
            });
            u6.displayName = "SlotClone";
            var u8 = function(e) {
                var t = e.children;
                return (0, U.jsx)(U.Fragment, {
                    children: t
                })
            };

            function u5(e) {
                return B.isValidElement(e) && e.type === u8
            }

            function u4(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function u7(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        u4(e, t, r[t])
                    })
                }
                return e
            }

            function u9(e, t) {
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
            var ce = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                    var r = B.forwardRef(function(e, r) {
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
                            i = n ? u3 : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, U.jsx)(i, u9(u7({}, o), {
                            ref: r
                        }))
                    });
                    return r.displayName = "Primitive.".concat(t), u9(u7({}, e), u4({}, t, r))
                }, {}),
                ct = B.forwardRef(function(e, t) {
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
                    return (0, U.jsx)(ce.svg, (r = function(e) {
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
                        children: e.asChild ? o : (0, U.jsx)("polygon", {
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

            function cr(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cn(e) {
                var t = B.useRef(e);
                return B.useEffect(function() {
                    t.current = e
                }), B.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return cr(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return cr(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return cr(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function co(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ci(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ca(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function cl(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        ca(e, t, r[t])
                    })
                }
                return e
            }

            function cu(e, t) {
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

            function cc(e, t) {
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

            function cs(e, t) {
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
                }(e, t) || cf(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function cf(e, t) {
                if (e) {
                    if ("string" == typeof e) return ci(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ci(e, t)
                }
            }
            ct.displayName = "Arrow";
            var cp = "Popper",
                cd = cs(li(cp), 2),
                ch = cd[0],
                cy = cd[1],
                cm = cs(ch(cp), 2),
                cb = cm[0],
                cv = cm[1],
                cg = function(e) {
                    var t = e.__scopePopper,
                        r = e.children,
                        n = cs(B.useState(null), 2),
                        o = n[0],
                        i = n[1];
                    return (0, U.jsx)(cb, {
                        scope: t,
                        anchor: o,
                        onAnchorChange: i,
                        children: r
                    })
                };
            cg.displayName = cp;
            var cO = "PopperAnchor",
                cw = B.forwardRef(function(e, t) {
                    var r = e.__scopePopper,
                        n = e.virtualRef,
                        o = cc(e, ["__scopePopper", "virtualRef"]),
                        i = cv(cO, r),
                        a = B.useRef(null),
                        l = le(t, a);
                    return B.useEffect(function() {
                        i.onAnchorChange((null == n ? void 0 : n.current) || a.current)
                    }), n ? null : (0, U.jsx)(ce.div, cu(cl({}, o), {
                        ref: l
                    }))
                });
            cw.displayName = cO;
            var cS = "PopperContent",
                cE = cs(ch(cS), 2),
                cA = cE[0],
                cP = cE[1],
                cj = B.forwardRef(function(e, t) {
                    var r, n, o, i, a, l, u, c, s, f, p, d, h, y, m, b, v, g, O, w, S, E, A, P, j, x, T, _, I, C, R, N, D, M, L, k, H, V, W, G, Y, K, z, X, $, Z, q, J, Q, ee, et, er, en, eo, ei, ea, el = e.__scopePopper,
                        eu = e.side,
                        ec = e.sideOffset,
                        es = e.align,
                        ef = void 0 === es ? "center" : es,
                        ep = e.alignOffset,
                        ed = e.arrowPadding,
                        eh = e.avoidCollisions,
                        ey = void 0 === eh || eh,
                        em = e.collisionBoundary,
                        eb = void 0 === em ? [] : em,
                        ev = e.collisionPadding,
                        eg = void 0 === ev ? 0 : ev,
                        eO = e.sticky,
                        ew = e.hideWhenDetached,
                        eS = e.updatePositionStrategy,
                        eE = void 0 === eS ? "optimized" : eS,
                        eA = e.onPlaced,
                        eP = cc(e, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        ej = cv(cS, el),
                        ex = cs(B.useState(null), 2),
                        eT = ex[0],
                        e_ = ex[1],
                        eI = le(t, function(e) {
                            return e_(e)
                        }),
                        eC = cs(B.useState(null), 2),
                        eR = eC[0],
                        eN = eC[1],
                        eD = (o = (n = function(e) {
                            if (Array.isArray(e)) return e
                        }(r = B.useState(void 0)) || function(e) {
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
                                if ("string" == typeof e) return co(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return co(e, 2)
                            }
                        }(r) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], i = n[1], ll(function() {
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
                        eM = null != (Q = null == eD ? void 0 : eD.width) ? Q : 0,
                        eL = null != (ee = null == eD ? void 0 : eD.height) ? ee : 0,
                        ek = "number" == typeof eg ? eg : cl({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, eg),
                        eU = Array.isArray(eb) ? eb : [eb],
                        eB = eU.length > 0,
                        eH = {
                            padding: ek,
                            boundary: eU.filter(cI),
                            altBoundary: eB
                        },
                        eF = (u = void 0 === (l = (a = {
                            strategy: "fixed",
                            placement: (void 0 === eu ? "bottom" : eu) + ("center" !== ef ? "-" + ef : ""),
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return uR.apply(void 0, ((function(e) {
                                    if (Array.isArray(e)) return ci(e)
                                })(t) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(t) || cf(t) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()).concat([{
                                    animationFrame: "always" === eE
                                }]))
                            },
                            elements: {
                                reference: ej.anchor
                            },
                            middleware: [uY({
                                mainAxis: (void 0 === ec ? 0 : ec) + eL,
                                alignmentAxis: void 0 === ep ? 0 : ep
                            }), ey && uK(cl({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === eO ? "partial" : eO) ? uz() : void 0
                            }, eH)), ey && uX(cl({}, eH)), u$(cu(cl({}, eH), {
                                apply: function(e) {
                                    var t = e.elements,
                                        r = e.rects,
                                        n = e.availableWidth,
                                        o = e.availableHeight,
                                        i = r.reference,
                                        a = i.width,
                                        l = i.height,
                                        u = t.floating.style;
                                    u.setProperty("--radix-popper-available-width", "".concat(n, "px")), u.setProperty("--radix-popper-available-height", "".concat(o, "px")), u.setProperty("--radix-popper-anchor-width", "".concat(a, "px")), u.setProperty("--radix-popper-anchor-height", "".concat(l, "px"))
                                }
                            })), eR && uq({
                                element: eR,
                                padding: void 0 === ed ? 0 : ed
                            }), cC({
                                arrowWidth: eM,
                                arrowHeight: eL
                            }), void 0 !== ew && ew && uZ(cl({
                                strategy: "referenceHidden"
                            }, eH))]
                        }).placement) ? "bottom" : l, s = void 0 === (c = a.strategy) ? "absolute" : c, p = void 0 === (f = a.middleware) ? [] : f, d = a.platform, m = (y = void 0 === (h = a.elements) ? {} : h).reference, b = y.floating, g = void 0 === (v = a.transform) || v, O = a.whileElementsMounted, w = a.open, E = (S = uU(B.useState({
                            x: 0,
                            y: 0,
                            strategy: s,
                            placement: u,
                            middlewareData: {},
                            isPositioned: !1
                        }), 2))[0], A = S[1], j = (P = uU(B.useState(p), 2))[0], x = P[1], uF(j, p) || x(p), _ = (T = uU(B.useState(null), 2))[0], I = T[1], R = (C = uU(B.useState(null), 2))[0], N = C[1], D = B.useCallback(function(e) {
                            e !== H.current && (H.current = e, I(e))
                        }, []), M = B.useCallback(function(e) {
                            e !== V.current && (V.current = e, N(e))
                        }, []), L = m || _, k = b || R, H = B.useRef(null), V = B.useRef(null), W = B.useRef(E), G = null != O, Y = uG(O), K = uG(d), z = uG(w), X = B.useCallback(function() {
                            if (H.current && V.current) {
                                var e = {
                                    placement: u,
                                    strategy: s,
                                    middleware: j
                                };
                                K.current && (e.platform = K.current), uD(H.current, V.current, e).then(function(e) {
                                    var t = uk(uL({}, e), {
                                        isPositioned: !1 !== z.current
                                    });
                                    $.current && !uF(W.current, t) && (W.current = t, F.flushSync(function() {
                                        A(t)
                                    }))
                                })
                            }
                        }, [j, u, s, K, z]), uH(function() {
                            !1 === w && W.current.isPositioned && (W.current.isPositioned = !1, A(function(e) {
                                return uk(uL({}, e), {
                                    isPositioned: !1
                                })
                            }))
                        }, [w]), $ = B.useRef(!1), uH(function() {
                            return $.current = !0,
                                function() {
                                    $.current = !1
                                }
                        }, []), uH(function() {
                            if (L && (H.current = L), k && (V.current = k), L && k) {
                                if (Y.current) return Y.current(L, k, X);
                                X()
                            }
                        }, [L, k, X, Y, G]), Z = B.useMemo(function() {
                            return {
                                reference: H,
                                floating: V,
                                setReference: D,
                                setFloating: M
                            }
                        }, [D, M]), q = B.useMemo(function() {
                            return {
                                reference: L,
                                floating: k
                            }
                        }, [L, k]), J = B.useMemo(function() {
                            var e = {
                                position: s,
                                left: 0,
                                top: 0
                            };
                            if (!q.floating) return e;
                            var t = uW(q.floating, E.x),
                                r = uW(q.floating, E.y);
                            return g ? uL(uk(uL({}, e), {
                                transform: "translate(" + t + "px, " + r + "px)"
                            }), uV(q.floating) >= 1.5 && {
                                willChange: "transform"
                            }) : {
                                position: s,
                                left: t,
                                top: r
                            }
                        }, [s, g, q.floating, E.x, E.y]), B.useMemo(function() {
                            return uk(uL({}, E), {
                                update: X,
                                refs: Z,
                                elements: q,
                                floatingStyles: J
                            })
                        }, [E, X, Z, q, J])),
                        eV = eF.refs,
                        eW = eF.floatingStyles,
                        eG = eF.placement,
                        eY = eF.isPositioned,
                        eK = eF.middlewareData,
                        ez = cs(cR(eG), 2),
                        eX = ez[0],
                        e$ = ez[1],
                        eZ = cn(eA);
                    ll(function() {
                        eY && (null == eZ || eZ())
                    }, [eY, eZ]);
                    var eq = null == (et = eK.arrow) ? void 0 : et.x,
                        eJ = null == (er = eK.arrow) ? void 0 : er.y,
                        eQ = (null == (en = eK.arrow) ? void 0 : en.centerOffset) !== 0,
                        e0 = cs(B.useState(), 2),
                        e1 = e0[0],
                        e2 = e0[1];
                    return ll(function() {
                        eT && e2(window.getComputedStyle(eT).zIndex)
                    }, [eT]), (0, U.jsx)("div", {
                        ref: eV.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: cl(cu(cl({}, eW), ca({
                            transform: eY ? eW.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: e1
                        }, "--radix-popper-transform-origin", [null == (eo = eK.transformOrigin) ? void 0 : eo.x, null == (ei = eK.transformOrigin) ? void 0 : ei.y].join(" "))), (null == (ea = eK.hide) ? void 0 : ea.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, U.jsx)(cA, {
                            scope: el,
                            placedSide: eX,
                            onArrowChange: eN,
                            arrowX: eq,
                            arrowY: eJ,
                            shouldHideArrow: eQ,
                            children: (0, U.jsx)(ce.div, cu(cl({
                                "data-side": eX,
                                "data-align": e$
                            }, eP), {
                                ref: eI,
                                style: cu(cl({}, eP.style), {
                                    animation: eY ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            cj.displayName = cS;
            var cx = "PopperArrow",
                cT = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                c_ = B.forwardRef(function(e, t) {
                    var r, n = e.__scopePopper,
                        o = cc(e, ["__scopePopper"]),
                        i = cP(cx, n),
                        a = cT[i.placedSide];
                    return (0, U.jsx)("span", {
                        ref: i.onArrowChange,
                        style: (ca(r = {
                            position: "absolute",
                            left: i.arrowX,
                            top: i.arrowY
                        }, a, 0), ca(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [i.placedSide]), ca(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [i.placedSide]), ca(r, "visibility", i.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, U.jsx)(ct, cu(cl({}, o), {
                            ref: t,
                            style: cu(cl({}, o.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function cI(e) {
                return null !== e
            }
            c_.displayName = cx;
            var cC = function(e) {
                return {
                    name: "transformOrigin",
                    options: e,
                    fn: function(t) {
                        var r, n, o, i, a, l = t.placement,
                            u = t.rects,
                            c = t.middlewareData,
                            s = (null == (o = c.arrow) ? void 0 : o.centerOffset) !== 0,
                            f = s ? 0 : e.arrowWidth,
                            p = s ? 0 : e.arrowHeight,
                            d = cs(cR(l), 2),
                            h = d[0],
                            y = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [d[1]],
                            m = (null != (r = null == (i = c.arrow) ? void 0 : i.x) ? r : 0) + f / 2,
                            b = (null != (n = null == (a = c.arrow) ? void 0 : a.y) ? n : 0) + p / 2,
                            v = "",
                            g = "";
                        return "bottom" === h ? (v = s ? y : "".concat(m, "px"), g = "".concat(-p, "px")) : "top" === h ? (v = s ? y : "".concat(m, "px"), g = "".concat(u.floating.height + p, "px")) : "right" === h ? (v = "".concat(-p, "px"), g = s ? y : "".concat(b, "px")) : "left" === h && (v = "".concat(u.floating.width + p, "px"), g = s ? y : "".concat(b, "px")), {
                            data: {
                                x: v,
                                y: g
                            }
                        }
                    }
                }
            };

            function cR(e) {
                var t = cs(e.split("-"), 2),
                    r = t[0],
                    n = t[1];
                return [r, void 0 === n ? "center" : n]
            }

            function cN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var cD = B.forwardRef(function(e, t) {
                var r, n, o, i, a, l = e.container,
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
                    }(e, ["container"]),
                    c = function(e) {
                        if (Array.isArray(e)) return e
                    }(r = B.useState(!1)) || function(e) {
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
                            if ("string" == typeof e) return cN(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return cN(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = c[0],
                    f = c[1];
                ll(function() {
                    return f(!0)
                }, []);
                var p = l || s && (null == (a = globalThis) || null == (i = a.document) ? void 0 : i.body);
                return p ? V().createPortal((0, U.jsx)(ce.div, (n = function(e) {
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
                }({}, u), o = o = {
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

            function cM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cL(e, t) {
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
                        if ("string" == typeof e) return cM(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cM(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            cD.displayName = "Portal";
            var ck = function(e) {
                var t, r, n, o, i, a, l, u, c, s, f, p, d, h, y, m, b, v = e.present,
                    g = e.children,
                    O = (t = v, i = (o = cL(B.useState(), 2))[0], a = o[1], l = B.useRef({}), u = B.useRef(t), c = B.useRef("none"), f = (s = cL((r = t ? "mounted" : "unmounted", n = {
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
                    }, B.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], p = s[1], B.useEffect(function() {
                        var e = cU(l.current);
                        c.current = "mounted" === f ? e : "none"
                    }, [f]), ll(function() {
                        var e = l.current,
                            r = u.current;
                        if (r !== t) {
                            var n = c.current,
                                o = cU(e);
                            t ? p("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? p("UNMOUNT") : r && n !== o ? p("ANIMATION_OUT") : p("UNMOUNT"), u.current = t
                        }
                    }, [t, p]), ll(function() {
                        if (i) {
                            var e, t, r = null != (e = i.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = cU(l.current).includes(e.animationName);
                                    if (e.target === i && n && (p("ANIMATION_END"), !u.current)) {
                                        var o = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === i && (c.current = cU(l.current))
                                };
                            return i.addEventListener("animationstart", o), i.addEventListener("animationcancel", n), i.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), i.removeEventListener("animationstart", o), i.removeEventListener("animationcancel", n), i.removeEventListener("animationend", n)
                                }
                        }
                        p("ANIMATION_END")
                    }, [i, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: B.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    w = "function" == typeof g ? g({
                        present: O.isPresent
                    }) : B.Children.only(g),
                    S = le(O.ref, (b = (m = null == (h = Object.getOwnPropertyDescriptor((d = w).props, "ref")) ? void 0 : h.get) && "isReactWarning" in m && m.isReactWarning) ? d.ref : (b = (m = null == (y = Object.getOwnPropertyDescriptor(d, "ref")) ? void 0 : y.get) && "isReactWarning" in m && m.isReactWarning) ? d.props.ref : d.props.ref || d.ref);
                return "function" == typeof g || O.isPresent ? B.cloneElement(w, {
                    ref: S
                }) : null
            };

            function cU(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function cB(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cH(e, t) {
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
                        if ("string" == typeof e) return cB(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cB(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function cF(e) {
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
            ck.displayName = "Presence";
            var cV = B.forwardRef(function(e, t) {
                var r, n;
                return (0, U.jsx)(ce.span, (r = cF({}, e), n = n = {
                    ref: t,
                    style: cF({
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

            function cW(e, t) {
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

            function cY(e, t) {
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

            function cK(e, t) {
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

            function cz(e, t) {
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
                }(e, t) || c$(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function cX(e) {
                return function(e) {
                    if (Array.isArray(e)) return cW(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || c$(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function c$(e, t) {
                if (e) {
                    if ("string" == typeof e) return cW(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cW(e, t)
                }
            }
            cV.displayName = "VisuallyHidden";
            var cZ = cz(li("Tooltip", [cy]), 2),
                cq = cZ[0];
            cZ[1];
            var cJ = cy(),
                cQ = "TooltipProvider",
                c0 = "tooltip.open",
                c1 = cz(cq(cQ), 2),
                c2 = c1[0],
                c3 = c1[1],
                c6 = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.delayDuration,
                        n = e.skipDelayDuration,
                        o = void 0 === n ? 300 : n,
                        i = e.disableHoverableContent,
                        a = e.children,
                        l = cz(B.useState(!0), 2),
                        u = l[0],
                        c = l[1],
                        s = B.useRef(!1),
                        f = B.useRef(0);
                    return B.useEffect(function() {
                        var e = f.current;
                        return function() {
                            return window.clearTimeout(e)
                        }
                    }, []), (0, U.jsx)(c2, {
                        scope: t,
                        isOpenDelayed: u,
                        delayDuration: void 0 === r ? 700 : r,
                        onOpen: B.useCallback(function() {
                            window.clearTimeout(f.current), c(!1)
                        }, []),
                        onClose: B.useCallback(function() {
                            window.clearTimeout(f.current), f.current = window.setTimeout(function() {
                                return c(!0)
                            }, o)
                        }, [o]),
                        isPointerInTransitRef: s,
                        onPointerInTransitChange: B.useCallback(function(e) {
                            s.current = e
                        }, []),
                        disableHoverableContent: void 0 !== i && i,
                        children: a
                    })
                };
            c6.displayName = cQ;
            var c8 = "Tooltip",
                c5 = cz(cq(c8), 2),
                c4 = c5[0],
                c7 = c5[1],
                c9 = function(e) {
                    var t, r, n, o, i, a, l, u, c, s, f, p, d, h, y, m, b, v, g, O, w, S = e.__scopeTooltip,
                        E = e.children,
                        A = e.open,
                        P = e.defaultOpen,
                        j = e.onOpenChange,
                        x = e.disableHoverableContent,
                        T = e.delayDuration,
                        _ = c3(c8, e.__scopeTooltip),
                        I = cJ(S),
                        C = cz(B.useState(null), 2),
                        R = C[0],
                        N = C[1],
                        D = (s = (c = function(e) {
                            if (Array.isArray(e)) return e
                        }(u = B.useState(lc())) || function(e) {
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
                        }(u) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return lu(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lu(e, 2)
                            }
                        }(u) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], f = c[1], ll(function() {
                            f(function(e) {
                                return null != e ? e : String(ls++)
                            })
                        }, [void 0]), s ? "radix-".concat(s) : ""),
                        M = B.useRef(0),
                        L = null != x ? x : _.disableHoverableContent,
                        k = null != T ? T : _.delayDuration,
                        H = B.useRef(!1),
                        F = cz((d = (p = {
                            prop: A,
                            defaultProp: void 0 !== P && P,
                            onChange: function(e) {
                                e ? (_.onOpen(), document.dispatchEvent(new CustomEvent(c0))) : _.onClose(), null == j || j(e)
                            }
                        }).prop, b = (m = cH((r = (t = {
                            defaultProp: p.defaultProp,
                            onChange: y = void 0 === (h = p.onChange) ? function() {} : h
                        }).defaultProp, n = t.onChange, i = cH(o = B.useState(r), 1)[0], a = B.useRef(i), l = cn(n), B.useEffect(function() {
                            a.current !== i && (l(i), a.current = i)
                        }, [i, a, l]), o), 2))[0], v = m[1], O = (g = void 0 !== d) ? d : b, w = cn(y), [O, B.useCallback(function(e) {
                            if (g) {
                                var t = "function" == typeof e ? e(d) : e;
                                t !== d && w(t)
                            } else v(e)
                        }, [g, d, v, w])]), 2),
                        V = F[0],
                        W = void 0 !== V && V,
                        G = F[1],
                        Y = B.useMemo(function() {
                            return W ? H.current ? "delayed-open" : "instant-open" : "closed"
                        }, [W]),
                        K = B.useCallback(function() {
                            window.clearTimeout(M.current), M.current = 0, H.current = !1, G(!0)
                        }, [G]),
                        z = B.useCallback(function() {
                            window.clearTimeout(M.current), M.current = 0, G(!1)
                        }, [G]),
                        X = B.useCallback(function() {
                            window.clearTimeout(M.current), M.current = window.setTimeout(function() {
                                H.current = !0, G(!0), M.current = 0
                            }, k)
                        }, [k, G]);
                    return B.useEffect(function() {
                        return function() {
                            M.current && (window.clearTimeout(M.current), M.current = 0)
                        }
                    }, []), (0, U.jsx)(cg, cY(cG({}, I), {
                        children: (0, U.jsx)(c4, {
                            scope: S,
                            contentId: D,
                            open: W,
                            stateAttribute: Y,
                            trigger: R,
                            onTriggerChange: N,
                            onTriggerEnter: B.useCallback(function() {
                                _.isOpenDelayed ? X() : K()
                            }, [_.isOpenDelayed, X, K]),
                            onTriggerLeave: B.useCallback(function() {
                                L ? z() : (window.clearTimeout(M.current), M.current = 0)
                            }, [z, L]),
                            onOpen: K,
                            onClose: z,
                            disableHoverableContent: L,
                            children: E
                        })
                    }))
                };
            c9.displayName = c8;
            var se = "TooltipTrigger",
                st = B.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = cK(e, ["__scopeTooltip"]),
                        o = c7(se, r),
                        i = c3(se, r),
                        a = cJ(r),
                        l = le(t, B.useRef(null), o.onTriggerChange),
                        u = B.useRef(!1),
                        c = B.useRef(!1),
                        s = B.useCallback(function() {
                            return u.current = !1
                        }, []);
                    return B.useEffect(function() {
                        return function() {
                            return document.removeEventListener("pointerup", s)
                        }
                    }, [s]), (0, U.jsx)(cw, cY(cG({
                        asChild: !0
                    }, a), {
                        children: (0, U.jsx)(ce.button, cY(cG({
                            "aria-describedby": o.open ? o.contentId : void 0,
                            "data-state": o.stateAttribute
                        }, n), {
                            ref: l,
                            onPointerMove: a5(e.onPointerMove, function(e) {
                                "touch" !== e.pointerType && (c.current || i.isPointerInTransitRef.current || (o.onTriggerEnter(), c.current = !0))
                            }),
                            onPointerLeave: a5(e.onPointerLeave, function() {
                                o.onTriggerLeave(), c.current = !1
                            }),
                            onPointerDown: a5(e.onPointerDown, function() {
                                u.current = !0, document.addEventListener("pointerup", s, {
                                    once: !0
                                })
                            }),
                            onFocus: a5(e.onFocus, function() {
                                u.current || o.onOpen()
                            }),
                            onBlur: a5(e.onBlur, o.onClose),
                            onClick: a5(e.onClick, o.onClose)
                        }))
                    }))
                });
            st.displayName = se;
            var sr = "TooltipPortal",
                sn = cz(cq(sr, {
                    forceMount: void 0
                }), 2),
                so = sn[0],
                si = sn[1],
                sa = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        i = c7(sr, t);
                    return (0, U.jsx)(so, {
                        scope: t,
                        forceMount: r,
                        children: (0, U.jsx)(ck, {
                            present: r || i.open,
                            children: (0, U.jsx)(cD, {
                                asChild: !0,
                                container: o,
                                children: n
                            })
                        })
                    })
                };
            sa.displayName = sr;
            var sl = "TooltipContent",
                su = B.forwardRef(function(e, t) {
                    var r = si(sl, e.__scopeTooltip),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        i = e.side,
                        a = void 0 === i ? "top" : i,
                        l = cK(e, ["forceMount", "side"]),
                        u = c7(sl, e.__scopeTooltip);
                    return (0, U.jsx)(ck, {
                        present: o || u.open,
                        children: u.disableHoverableContent ? (0, U.jsx)(sd, cY(cG({
                            side: a
                        }, l), {
                            ref: t
                        })) : (0, U.jsx)(sc, cY(cG({
                            side: a
                        }, l), {
                            ref: t
                        }))
                    })
                }),
                sc = B.forwardRef(function(e, t) {
                    var r = c7(sl, e.__scopeTooltip),
                        n = c3(sl, e.__scopeTooltip),
                        o = B.useRef(null),
                        i = le(t, o),
                        a = cz(B.useState(null), 2),
                        l = a[0],
                        u = a[1],
                        c = r.trigger,
                        s = r.onClose,
                        f = o.current,
                        p = n.onPointerInTransitChange,
                        d = B.useCallback(function() {
                            u(null), p(!1)
                        }, [p]),
                        h = B.useCallback(function(e, t) {
                            var r, n, o, i, a, l, c = e.currentTarget,
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
                                }(s, c.getBoundingClientRect()),
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
                                h = (n = (r = t.getBoundingClientRect()).top, o = r.right, i = r.bottom, [{
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
                            u(((l = cX(d).concat(cX(h)).slice()).sort(function(e, t) {
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
                                    for (var u = e[l]; a.length >= 2;) {
                                        var c = a[a.length - 1],
                                            s = a[a.length - 2];
                                        if ((c.x - s.x) * (u.y - s.y) >= (c.y - s.y) * (u.x - s.x)) a.pop();
                                        else break
                                    }
                                    a.push(u)
                                }
                                return (a.pop(), 1 === t.length && 1 === a.length && t[0].x === a[0].x && t[0].y === a[0].y) ? t : t.concat(a)
                            }(l))), p(!0)
                        }, [p]);
                    return B.useEffect(function() {
                        return function() {
                            return d()
                        }
                    }, [d]), B.useEffect(function() {
                        if (c && f) {
                            var e = function(e) {
                                    return h(e, f)
                                },
                                t = function(e) {
                                    return h(e, c)
                                };
                            return c.addEventListener("pointerleave", e), f.addEventListener("pointerleave", t),
                                function() {
                                    c.removeEventListener("pointerleave", e), f.removeEventListener("pointerleave", t)
                                }
                        }
                    }, [c, f, h, d]), B.useEffect(function() {
                        if (l) {
                            var e = function(e) {
                                var t = e.target,
                                    r = {
                                        x: e.clientX,
                                        y: e.clientY
                                    },
                                    n = (null == c ? void 0 : c.contains(t)) || (null == f ? void 0 : f.contains(t)),
                                    o = ! function(e, t) {
                                        for (var r = e.x, n = e.y, o = !1, i = 0, a = t.length - 1; i < t.length; a = i++) {
                                            var l = t[i].x,
                                                u = t[i].y,
                                                c = t[a].x,
                                                s = t[a].y;
                                            u > n != s > n && r < (c - l) * (n - u) / (s - u) + l && (o = !o)
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
                    }, [c, f, l, s, d]), (0, U.jsx)(sd, cY(cG({}, e), {
                        ref: i
                    }))
                }),
                ss = cz(cq(c8, {
                    isInside: !1
                }), 2),
                sf = ss[0],
                sp = ss[1],
                sd = B.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = e.children,
                        o = e["aria-label"],
                        i = e.onEscapeKeyDown,
                        a = e.onPointerDownOutside,
                        l = cK(e, ["__scopeTooltip", "children", "aria-label", "onEscapeKeyDown", "onPointerDownOutside"]),
                        u = c7(sl, r),
                        c = cJ(r),
                        s = u.onClose;
                    return B.useEffect(function() {
                        return document.addEventListener(c0, s),
                            function() {
                                return document.removeEventListener(c0, s)
                            }
                    }, [s]), B.useEffect(function() {
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
                    }, [u.trigger, s]), (0, U.jsx)(ry.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !1,
                        onEscapeKeyDown: i,
                        onPointerDownOutside: a,
                        onFocusOutside: function(e) {
                            return e.preventDefault()
                        },
                        onDismiss: s,
                        children: (0, U.jsxs)(cj, cY(cG({
                            "data-state": u.stateAttribute
                        }, c, l), {
                            ref: t,
                            style: cG({}, l.style, {
                                "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                                "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                                "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                                "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                                "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                            }),
                            children: [(0, U.jsx)(u8, {
                                children: n
                            }), (0, U.jsx)(sf, {
                                scope: r,
                                isInside: !0,
                                children: (0, U.jsx)(cV, {
                                    id: u.contentId,
                                    role: "tooltip",
                                    children: o || n
                                })
                            })]
                        }))
                    })
                });
            su.displayName = sl;
            var sh = "TooltipArrow",
                sy = B.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = cK(e, ["__scopeTooltip"]),
                        o = cJ(r);
                    return sp(sh, r).isInside ? null : (0, U.jsx)(c_, cY(cG({}, o, n), {
                        ref: t
                    }))
                });

            function sm(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sb(e) {
                var t, r = e.position,
                    n = e.hasBeak,
                    o = e.title,
                    i = e.description,
                    a = e.ariaLabel,
                    l = e.delayDurationMs,
                    u = e.children,
                    c = e.open,
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
                            if ("string" == typeof e) return sm(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sm(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    d = p[0],
                    h = p[1],
                    y = null != a ? a : "string" == typeof o && null == i ? o : void 0;
                return B.createElement(c6, {
                    delayDuration: void 0 === l ? 500 : l
                }, B.createElement(c9, {
                    open: c,
                    onOpenChange: s
                }, u, B.createElement(sa, null, B.createElement(su, {
                    side: d,
                    align: h,
                    "aria-label": y,
                    className: tz("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", f),
                    sideOffset: 5
                }, (void 0 === n || n) && B.createElement(sy, {
                    asChild: !0
                }, B.createElement(a8, {
                    className: "content-[var(--inverse-surface-0)]"
                })), B.createElement("div", {
                    className: "flex flex-col text-truncate-split"
                }, B.createElement("div", {
                    className: "text-caption-medium content-inverse-default"
                }, o), i && B.createElement("div", {
                    className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
                }, i))))))
            }

            function sv(e) {
                var t = e.children,
                    r = e.asChild,
                    n = e.className;
                return B.createElement(st, {
                    asChild: r,
                    className: n
                }, t)
            }
            sy.displayName = sh;
            var sg = function(e) {
                    var t = e.title,
                        r = e.description,
                        n = e.position;
                    return H().createElement(sb, {
                        position: void 0 === n ? "top-center" : n,
                        title: t,
                        description: r
                    }, H().createElement(sv, {
                        asChild: !0
                    }, H().createElement("span", {
                        role: "button",
                        tabIndex: 0,
                        "aria-label": t,
                        className: "flex items-center content-muted",
                        "data-testid": "label-tooltip-trigger"
                    }, H().createElement(t1, {
                        name: "icon-regular-circle-i",
                        size: "Small"
                    }))))
                },
                sO = {
                    Standard: "bg-none",
                    Contrast: "bg-shift-200",
                    Utility: "bg-none"
                },
                sw = {
                    Standard: "stroke-standard",
                    Contrast: "stroke-none",
                    Utility: "stroke-none"
                };

            function sS(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sE(e) {
                if (Array.isArray(e)) return e
            }

            function sA(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function sP() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function sj(e, t) {
                if (e) {
                    if ("string" == typeof e) return sS(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sS(e, t)
                }
            }
            var sx = {
                    XSmall: "padding-x-small",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-medium"
                },
                sT = {
                    XSmall: "gap-x-xsmall",
                    Small: "gap-x-small",
                    Medium: "gap-x-small",
                    Large: "gap-x-small"
                },
                s_ = {
                    XSmall: "height-600",
                    Small: "height-800",
                    Medium: "height-1000",
                    Large: "height-1200"
                },
                sI = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                sC = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                sR = {
                    XSmall: ["text-body-small", "placeholder:text-body-small"],
                    Small: ["text-body-small", "placeholder:text-body-small"],
                    Medium: ["text-body-medium", "placeholder:text-body-medium"],
                    Large: ["text-body-large", "placeholder:text-body-large"]
                },
                sN = (0, B.forwardRef)(function(e, t) {
                    var r, n, o, i = sE(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || sj(r) || sP(),
                        a = i[0],
                        l = i.slice(1),
                        u = a.label,
                        c = a.labelTooltip,
                        s = a.leadingIconName,
                        f = a.trailingIconName,
                        p = a.leadingIconNode,
                        d = a.trailingIconNode,
                        h = a.hasError,
                        y = a.error,
                        m = a.helperText,
                        b = a.size,
                        v = a.variant,
                        g = void 0 === v ? "Standard" : v,
                        O = a.isRequired,
                        w = a.isDisabled,
                        S = a.className,
                        E = a.style,
                        A = a.inputContainerClassName,
                        P = a.inputContainerClassStyle,
                        j = a.id,
                        x = function(e, t) {
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
                        T = (sE(l) || function(e) {
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
                        }(l) || sj(l, 1) || sP())[0],
                        _ = a6(),
                        I = j || _,
                        C = "".concat(I, "-description"),
                        R = null != b ? b : "Large",
                        N = h || !!y,
                        D = y || m,
                        M = (0, B.useMemo)(function() {
                            return s ? H().createElement(t1, {
                                name: s,
                                size: R,
                                className: "content-emphasis",
                                "data-testid": "text-input-leading-icon"
                            }) : p
                        }, [s, p, R]),
                        L = (0, B.useMemo)(function() {
                            return f ? H().createElement(t1, {
                                name: f,
                                size: R,
                                className: "content-emphasis",
                                "data-testid": "text-input-trailing-icon"
                            }) : d
                        }, [R, f, d]),
                        k = u ? H().createElement("label", {
                            htmlFor: I,
                            className: tz(sC[R], "content-emphasis")
                        }, u, O && H().createElement(H().Fragment, null, " ", H().createElement("span", {
                            className: "content-default"
                        }, "*"))) : null;
                    return H().createElement("div", {
                        "data-testid": "text-input-wrapper",
                        className: tz("flex width-full flex-col gap-small ".concat(S), sA({}, ow, w)),
                        style: E
                    }, k && (c ? H().createElement("div", {
                        className: "flex items-center gap-xsmall"
                    }, k, H().createElement(sg, c)) : k), H().createElement("div", {
                        "data-testid": "text-input-container",
                        className: tz("foundation-web-input flex items-center width-full", sw[g], sO[g], A, s_[R], sI[R], sx[R], sT[R], N ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                        style: P
                    }, M, H().createElement("input", (n = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                sA(e, t, r[t])
                            })
                        }
                        return e
                    }({
                        type: "text",
                        id: I,
                        ref: T,
                        className: tz("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", sR[R]),
                        style: {
                            appearance: "none"
                        },
                        "aria-invalid": N,
                        "aria-describedby": D ? C : void 0,
                        required: O
                    }, x), o = o = {
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
                    }), n)), L), D && H().createElement("span", {
                        id: C,
                        className: tz("text-caption-small", {
                            "content-system-alert": N,
                            "content-default": !N
                        })
                    }, D))
                });

            function sD(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function sM(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            sD(i, n, o, a, l, "next", e)
                        }

                        function l(e) {
                            sD(i, n, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function sL(e, t) {
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
            sN.displayName = "TextInput";
            var sk = function() {
                    return Promise.resolve(null)
                },
                sU = function(e, t) {
                    return function(r) {
                        return sM(function() {
                            return sL(this, function(n) {
                                return r === t ? [2, Promise.resolve(null)] : [2, Promise.resolve(e)]
                            })
                        })()
                    }
                },
                sB = function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return function(e) {
                        return sM(function() {
                            var r, n;
                            return sL(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        r = 0, o.label = 1;
                                    case 1:
                                        if (!(r < t.length)) return [3, 4];
                                        return [4, t[r](e)];
                                    case 2:
                                        if (null !== (n = o.sent())) return [2, n];
                                        o.label = 3;
                                    case 3:
                                        return r += 1, [3, 1];
                                    case 4:
                                        return [2, null]
                                }
                            })
                        })()
                    }
                };

            function sH(e) {
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
            var sF = function(e) {
                var t, r, n, o = e.id,
                    i = e.inputType,
                    a = e.placeholder,
                    l = e.disabled,
                    u = e.value,
                    c = e.error,
                    s = e.canSubmit,
                    f = e.validate,
                    p = e.setValue,
                    d = e.setError,
                    h = e.handleSubmit,
                    y = e.onChange,
                    m = e.inputMode,
                    b = e.autoComplete,
                    v = e.maxLength,
                    g = e.validCharactersRegEx,
                    O = e.concealInput,
                    w = e.autoFocus,
                    S = e.label,
                    E = e.bottomLabel,
                    A = e.className,
                    P = e.showFeedback,
                    j = l || "" === u || null === c ? null : c,
                    x = void 0 !== P && P && !l && "" !== u ? null === c ? "icon-regular-check" : "icon-regular-x" : void 0,
                    T = {
                        id: o,
                        "data-testid": "challenge-input-control",
                        size: "Medium",
                        label: S,
                        type: i,
                        inputMode: m,
                        autoComplete: b,
                        maxLength: v,
                        placeholder: a,
                        "aria-label": void 0 === S ? a : void 0,
                        value: u,
                        isDisabled: l,
                        hasError: null !== j,
                        helperText: null != (n = null != j ? j : E) ? n : "\xa0",
                        className: ["[&_input::placeholder]:text-body-large [&_input]:text-body-large", O && u.length > 0 ? "challenge-input-concealed" : "", null != A ? A : ""].join(" "),
                        onChange: function(e) {
                            return sM(function() {
                                var t;
                                return sL(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            return t = e.currentTarget.value, void 0 === g || g.test(t) || (t = u), void 0 !== y && y(t), p(t), [4, f(t)];
                                        case 1:
                                            return d.apply(void 0, [r.sent()]), [2]
                                    }
                                })
                            })()
                        },
                        onKeyDown: function(e) {
                            "Enter" === e.key && s && (e.preventDefault(), e.stopPropagation(), h())
                        },
                        autoFocus: w
                    };
                return void 0 === x ? (0, U.jsx)(sN, sH({}, T)) : (0, U.jsx)(sN, (t = sH({}, T), r = r = {
                    trailingIconName: x
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
            };

            function sV(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var sW = function(e, t, r, n) {
                return function(o) {
                    var i;
                    return (i = function() {
                        var i;
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
                        }(this, function(a) {
                            switch (a.label) {
                                case 0:
                                    return [4, e.password.validate(r, o)];
                                case 1:
                                    if ((i = a.sent()).isError) return [2, n];
                                    return [2, i4(t, i.value)]
                            }
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(r, n) {
                            var o = i.apply(e, t);

                            function a(e) {
                                sV(o, r, n, a, l, "next", e)
                            }

                            function l(e) {
                                sV(o, r, n, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                }
            };

            function sG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sY(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function sK(e, t) {
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
                        if ("string" == typeof e) return sG(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sG(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var sz = "!gap-xsmall [&_label]:text-label-small",
                sX = function() {
                    var e = aS(),
                        t = e.state,
                        r = t.username,
                        n = t.resources,
                        o = t.requestService,
                        i = e.dispatch,
                        a = sK((0, B.useState)(""), 2),
                        l = a[0],
                        u = a[1],
                        c = sK((0, B.useState)(null), 2),
                        s = c[0],
                        f = c[1],
                        p = sK((0, B.useState)(""), 2),
                        d = p[0],
                        h = p[1],
                        y = sK((0, B.useState)(null), 2),
                        m = y[0],
                        b = y[1],
                        v = sK((0, B.useState)(""), 2),
                        g = v[0],
                        O = v[1],
                        w = sK((0, B.useState)(null), 2),
                        S = w[0],
                        E = w[1],
                        A = sK((0, B.useState)(null), 2),
                        P = A[0],
                        j = A[1],
                        x = sK((0, B.useState)(!1), 2),
                        T = x[0],
                        _ = x[1],
                        I = sK((0, B.useState)(!1), 2),
                        C = I[0],
                        R = I[1],
                        N = function() {
                            return j(null)
                        },
                        D = function() {
                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                            return function(e) {
                                t.forEach(function(t) {
                                    return t(e)
                                })
                            }
                        },
                        M = function() {
                            var e;
                            return (e = function() {
                                var e;
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
                                }(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            return j(null), R(!0), [4, o.password.changeForCurrentUser(l, d)];
                                        case 1:
                                            if ((e = t.sent()).isError) return R(!1), e.error === iQ.INVALID_CURRENT_PASSWORD ? _(!0) : _(!1), j(i5(n, e.error)), [2];
                                            return i({
                                                type: am.SET_MODAL_STATE,
                                                modalState: i7.CHANGE_PASSWORD_CONFIRMATION
                                            }), [2]
                                    }
                                })
                            }, function() {
                                var t = this,
                                    r = arguments;
                                return new Promise(function(n, o) {
                                    var i = e.apply(t, r);

                                    function a(e) {
                                        sY(i, n, o, a, l, "next", e)
                                    }

                                    function l(e) {
                                        sY(i, n, o, a, l, "throw", e)
                                    }
                                    a(void 0)
                                })
                            })()
                        },
                        L = "" !== l && null === s && "" !== d && null === m && "" !== g && null === S,
                        k = {
                            content: C ? (0, U.jsx)(oJ, {
                                variant: "Indeterminate",
                                size: "Small",
                                ariaLabel: n.Action.SubmitChangePassword
                            }) : n.Action.SubmitChangePassword,
                            label: n.Action.SubmitChangePassword,
                            enabled: !C && L,
                            action: M
                        },
                        F = (0, U.jsx)("a", {
                            href: "https://en.help.roblox.com/hc/articles/203313070-I-Forgot-My-Password",
                            className: "bottom-label-link xsmall",
                            target: "_blank",
                            rel: "noreferrer",
                            children: n.Label.IForgotMyPassword
                        }),
                        V = (0, U.jsxs)("span", {
                            className: "flex items-center",
                            children: [(0, U.jsx)(t1, {
                                name: "icon-filled-shield-check",
                                size: "XSmall"
                            }), (0, U.jsx)("span", {
                                className: "bottom-label-text-with-start-margin text-label xsmall",
                                children: n.Label.UseAUniquePassword
                            })]
                        });
                    return (0, U.jsxs)(H().Fragment, {
                        children: [(0, U.jsx)(ak, {
                            headerText: n.Header.CreateAStrongPassword,
                            buttonType: aL.BACK,
                            buttonAction: function() {
                                return i({
                                    type: am.SET_MODAL_STATE,
                                    modalState: i7.CHANGE_PASSWORD_INTRO
                                })
                            },
                            buttonEnabled: !C,
                            headerInfo: null
                        }), (0, U.jsxs)(om, {
                            className: "account-security-prompt-form flex flex-col gap-large max-[542px]:gap-small",
                            children: [(0, U.jsx)(sF, {
                                showFeedback: !0,
                                className: sz,
                                id: "inputCurrentPassword",
                                label: n.Label.CurrentPassword,
                                bottomLabel: F,
                                inputType: "password",
                                autoComplete: "current-password",
                                placeholder: "",
                                disabled: C,
                                value: l,
                                setValue: u,
                                error: s || T && P || null,
                                setError: f,
                                validate: sk,
                                canSubmit: L,
                                handleSubmit: M,
                                onChange: N
                            }), (0, U.jsx)(sF, {
                                showFeedback: !0,
                                className: sz,
                                id: "inputNewPassword",
                                label: n.Label.NewPassword,
                                bottomLabel: V,
                                inputType: "password",
                                autoComplete: "new-password",
                                placeholder: n.Label.AtLeastCharacters(8),
                                disabled: C,
                                value: d,
                                setValue: h,
                                error: m,
                                setError: D(function() {
                                    return E(null)
                                }, b),
                                validate: sB(sW(o, n, r, n.Message.Error.PasswordValidation.Default), "" !== g ? sU(n.Message.Error.Input.PasswordsDoNotMatch, g) : sk),
                                canSubmit: L,
                                handleSubmit: M,
                                onChange: N
                            }), (0, U.jsx)(sF, {
                                showFeedback: !0,
                                className: sz,
                                id: "inputNewPasswordAgain",
                                label: n.Label.ConfirmNewPassword,
                                inputType: "password",
                                autoComplete: "new-password",
                                placeholder: "",
                                disabled: C,
                                value: g,
                                setValue: O,
                                error: S || !T && P || null,
                                setError: D(function() {
                                    return b(null)
                                }, E),
                                validate: sB(sU(n.Message.Error.Input.PasswordsDoNotMatch, d), sW(o, n, r, n.Message.Error.PasswordValidation.Default)),
                                canSubmit: L,
                                handleSubmit: M,
                                onChange: N
                            })]
                        }), (0, U.jsx)(a_, {
                            positiveButton: k,
                            negativeButton: null
                        })]
                    })
                };

            function s$(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sZ(e, t) {
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
                        if ("string" == typeof e) return s$(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return s$(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var sq = function(e) {
                var t = e.closeModal,
                    r = aS(),
                    n = r.state,
                    o = n.promptAssignment,
                    i = n.resources,
                    a = (n.requestService, r.dispatch),
                    l = sZ((0, B.useState)(null), 2),
                    u = l[0],
                    c = l[1],
                    s = sZ((0, B.useState)(!1), 2),
                    f = s[0],
                    p = s[1],
                    d = "An unexpected issue occurred while displaying this text.";
                o.isGeneric || (d = o.promptType !== tW.CHANGE_PASSWORD__BREACHED_CREDENTIAL ? "".concat(i.Description.UnusualActivity, " ").concat(i.Description.ChangeYourPassword) : (0, U.jsxs)(H().Fragment, {
                    children: [i.Description.ChangeYourPasswordImmediately, " ", i.Description.NoChangeForceReset(aE(o.metadata.forceResetTimestamp))]
                }));
                var h = {
                    content: f ? (0, U.jsx)(oJ, {
                        variant: "Indeterminate",
                        size: "Small",
                        ariaLabel: i.Action.ContinueChangePassword
                    }) : i.Action.ContinueChangePassword,
                    label: i.Action.ContinueChangePassword,
                    enabled: !f,
                    action: function() {
                        c(null), p(!0), a({
                            type: am.SET_MODAL_STATE,
                            modalState: i7.CHANGE_PASSWORD_FORM
                        })
                    }
                };
                return (0, U.jsxs)(H().Fragment, {
                    children: [(0, U.jsx)(ak, {
                        headerText: i.Header.ChangeYourPassword,
                        buttonType: aL.CLOSE,
                        buttonAction: t,
                        buttonEnabled: !f,
                        headerInfo: null
                    }), (0, U.jsxs)(om, {
                        children: [(0, U.jsx)("div", {
                            className: "modal-lock-icon"
                        }), (0, U.jsx)("p", {
                            className: "modal-margin-bottom",
                            children: d
                        }), (0, U.jsx)("p", {
                            className: "text-caption-small content-system-alert xsmall",
                            children: u
                        })]
                    }), (0, U.jsx)(a_, {
                        positiveButton: h,
                        negativeButton: null
                    })]
                })
            };

            function sJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sQ(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var s0 = function(e) {
                var t, r = e.closeModal,
                    n = aS(),
                    o = n.state,
                    i = o.promptAssignment,
                    a = o.resources,
                    l = o.requestService,
                    u = n.dispatch,
                    c = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = (0, B.useState)(!1)) || function(e) {
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
                            if ("string" == typeof e) return sJ(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sJ(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = c[0],
                    f = c[1],
                    p = a.Description.AreYouSureDismissForeverChangePassword,
                    d = a.Action.ConfirmDismissForeverChangePassword,
                    h = a.Action.AbortDismissForeverChangePassword,
                    y = {
                        content: s ? (0, U.jsx)(oJ, {
                            variant: "Indeterminate",
                            size: "Small",
                            ariaLabel: d
                        }) : d,
                        label: d,
                        enabled: !s,
                        action: function() {
                            var e;
                            return (e = function() {
                                var e;
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
                                }(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            return f(!0), [4, l.promptAssignments.updateForCurrentUser(tY.DISABLE_PROMPT, i.promptType)];
                                        case 1:
                                            if ((e = t.sent()).isError) return f(!1), console.warn(oQ, "Disabling prompt failed with error", e.error && tH[e.error]), [2];
                                            return u({
                                                type: am.DISMISS_FOREVER
                                            }), r(), [2]
                                    }
                                })
                            }, function() {
                                var t = this,
                                    r = arguments;
                                return new Promise(function(n, o) {
                                    var i = e.apply(t, r);

                                    function a(e) {
                                        sQ(i, n, o, a, l, "next", e)
                                    }

                                    function l(e) {
                                        sQ(i, n, o, a, l, "throw", e)
                                    }
                                    a(void 0)
                                })
                            })()
                        }
                    };
                return (0, U.jsxs)(H().Fragment, {
                    children: [(0, U.jsx)(ak, {
                        headerText: a.Header.AreYouSure,
                        buttonType: aL.HIDDEN,
                        buttonAction: r,
                        buttonEnabled: !0,
                        headerInfo: null
                    }), (0, U.jsxs)(om, {
                        children: [(0, U.jsx)("div", {
                            className: "modal-lock-icon"
                        }), (0, U.jsx)("p", {
                            children: p
                        })]
                    }), (0, U.jsx)(a_, {
                        positiveButton: {
                            content: h,
                            label: h,
                            enabled: !s,
                            action: function() {
                                u({
                                    type: am.SET_MODAL_STATE,
                                    modalState: i7.CHANGE_PASSWORD_INTRO
                                })
                            }
                        },
                        negativeButton: y
                    })]
                })
            };

            function s1(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function s2(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function s3(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            s2(i, n, o, a, l, "next", e)
                        }

                        function l(e) {
                            s2(i, n, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function s6(e, t) {
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
                        if ("string" == typeof e) return s1(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return s1(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function s8(e, t) {
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
            var s5 = function(e) {
                    var t = e.closeModal,
                        r = aS().state,
                        n = r.resources,
                        o = r.requestService,
                        i = r.promptAssignment,
                        a = s6((0, B.useState)(null), 2),
                        l = a[0],
                        u = a[1],
                        c = s6((0, B.useState)(!1), 2),
                        s = c[0],
                        f = c[1],
                        p = function() {
                            return s3(function() {
                                var e;
                                return s8(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            return [4, o.promptAssignments.updateForCurrentUser(tY.DISMISS_PROMPT, i.promptType)];
                                        case 1:
                                            return (e = t.sent()).isError && console.warn(oQ, "Dismissing Account Restores Policy Upsell prompt failed with error", e.error && tH[e.error]), [2]
                                    }
                                })
                            })()
                        },
                        d = {
                            content: s ? (0, U.jsx)(oJ, {
                                variant: "Indeterminate",
                                size: "Small",
                                ariaLabel: n.Action.SetUpEmail2SV
                            }) : n.Action.SetUpEmail2SV,
                            label: n.Action.SetUpEmail2SV,
                            enabled: !s,
                            action: function() {
                                return s3(function() {
                                    return s8(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return u(null), f(!0), [4, p()];
                                            case 1:
                                                return e.sent(), null == Y || Y.open(o3 + o2, "_self"), [2]
                                        }
                                    })
                                })()
                            }
                        };
                    return (0, U.jsxs)(H().Fragment, {
                        children: [(0, U.jsx)(ak, {
                            headerText: n.Header.Email2SVUpsell,
                            buttonType: aL.CLOSE,
                            buttonAction: function() {
                                return s3(function() {
                                    return s8(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return t(), [4, p()];
                                            case 1:
                                                return e.sent(), [2]
                                        }
                                    })
                                })()
                            },
                            buttonEnabled: !0,
                            headerInfo: null
                        }), (0, U.jsxs)(om, {
                            children: [(0, U.jsx)("div", {
                                className: "modal-lock-icon"
                            }), (0, U.jsx)("p", {
                                className: "modal-margin-bottom-sm",
                                children: n.Description.Email2SVUpsellMessageBody(o3)
                            }), (0, U.jsx)("p", {
                                className: "text-caption-small content-system-alert xsmall",
                                children: l
                            })]
                        }), (0, U.jsx)(a_, {
                            positiveButton: d,
                            negativeButton: null
                        })]
                    })
                },
                s4 = function(e) {
                    switch (e) {
                        case i7.CHANGE_PASSWORD_INTRO:
                            return {
                                innerFragment: sq, canClickBackdropToClose: !0
                            };
                        case i7.CHANGE_PASSWORD_FORM:
                            return {
                                innerFragment: sX, canClickBackdropToClose: !1
                            };
                        case i7.CHANGE_PASSWORD_CONFIRMATION:
                            return {
                                innerFragment: a2, canClickBackdropToClose: !0
                            };
                        case i7.CHANGE_PASSWORD_DISMISS_CONFIRMATION:
                            return {
                                innerFragment: s0, canClickBackdropToClose: !1
                            };
                        case i7.AUTHENTICATOR_UPSELL_OPENING:
                            return {
                                innerFragment: a1, canClickBackdropToClose: !1
                            };
                        case i7.AUTHENTICATOR_UPSELL_DOWNLOAD_APPS:
                            return {
                                innerFragment: a$, canClickBackdropToClose: !1
                            };
                        case i7.ACCOUNT_RESTORE_POLICY_UPSELL:
                            return {
                                innerFragment: aW, canClickBackdropToClose: !1
                            };
                        case i7.EMAIL_2SV_UPSELL:
                            return {
                                innerFragment: s5, canClickBackdropToClose: !1
                            };
                        default:
                            return null
                    }
                },
                s7 = function() {
                    var e = aS(),
                        t = e.state,
                        r = t.isFlowComplete,
                        n = t.modalState,
                        o = t.promptAssignment,
                        i = e.dispatch,
                        a = function() {
                            return i({
                                type: am.SET_MODAL_STATE,
                                modalState: i7.NONE
                            })
                        },
                        l = s4(n),
                        u = o.promptType === tW.AUTHENTICATOR_UPSELL || o.promptType === tW.ACCOUNT_RESTORES_POLICY_UPSELL || o.promptType === tW.BROADER_AUTHENTICATOR_UPSELL && !0 !== o.isGeneric && !o.metadata.showBanner || o.promptType === tW.EMAIL_2SV_UPSELL && !0 !== o.isGeneric && !o.metadata.showBanner;
                    return (0, U.jsxs)(H().Fragment, {
                        children: [!r && !u && (0, U.jsx)(aT, {}), l && (0, U.jsx)(oO, {
                            open: !0,
                            onClose: a,
                            isBackdropDismissible: l.canClickBackdropToClose,
                            className: "account-security-prompt-dialog content-default",
                            children: (0, U.jsx)(l.innerFragment, {
                                closeModal: a
                            })
                        })]
                    })
                },
                s9 = function(e) {
                    var t = e.promptAssignment,
                        r = e.username,
                        n = e.isUserUnder13,
                        o = e.eventService,
                        i = e.requestService;
                    return (0, U.jsx)(aw, {
                        promptAssignment: t,
                        username: r,
                        isUserUnder13: n,
                        eventService: o,
                        requestService: i,
                        children: (0, U.jsx)(s7, {})
                    })
                },
                fe = function(e, t) {
                    var r;
                    return t.includes(o1) || t.includes(".com/my/account") ? null : null != (r = e.find(function(e) {
                        return e.promptType !== tW.BROADER_AUTHENTICATOR_UPSELL && e.promptType !== tW.EMAIL_2SV_UPSELL || !1 !== e.isGeneric || e.metadata.pageRestriction !== tV.HOME_PAGE_ONLY || !!t.includes(".com/home")
                    })) ? r : null
                },
                ft = window.Roblox["core-scripts"].eventStream,
                fr = function() {
                    var e;

                    function t(e) {
                        var r, n;
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        n = void 0, (r = "promptType") in this ? Object.defineProperty(this, r, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : this[r] = n, this.promptType = e
                    }
                    return e = [{
                            key: "sendModalStateViewedEvent",
                            value: function(e) {
                                (0, ft.sendEventWithTarget)("accountSecurityPromptEvent", o8, {
                                    promptType: this.promptType,
                                    state: e
                                }, ft.targetTypes.WWW)
                            }
                        }],
                        function(e, t) {
                            for (var r = 0; r < t.length; r++) {
                                var n = t[r];
                                n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                            }
                        }(t.prototype, e), t
                }();

            function fn(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var fo = function(e) {
                    var t, r = e.href,
                        n = e.username,
                        o = e.isUserUnder13,
                        i = e.requestService,
                        a = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, B.useState)(null)) || function(e) {
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
                                if ("string" == typeof e) return fn(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return fn(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        l = a[0],
                        u = a[1];
                    (0, B.useEffect)(function() {
                        var e = !1;
                        return i.promptAssignments.getAllForCurrentUser().then(function(t) {
                                if (!e) {
                                    if (t.isError) return void console.warn(oQ, "Retrieving prompt assignments failed with error", t.error && tH[t.error]);
                                    if (0 === t.value.length) return void console.log(oQ, "No assignments were retrieved");
                                    var n = fe(t.value, r);
                                    null != n && as(n.promptType), u(n)
                                }
                            }),
                            function() {
                                e = !0
                            }
                    }, [i, r]);
                    var c = (0, B.useMemo)(function() {
                        return l && new fr(l.promptType)
                    }, [l]);
                    return null == l || null == c ? null : (0, U.jsx)(s9, {
                        promptAssignment: l,
                        username: n,
                        isUserUnder13: o,
                        eventService: c,
                        requestService: i
                    })
                },
                fi = window.Roblox["core-scripts"].http.http,
                fa = window.Roblox["core-lib"].http.index,
                fl = window.Roblox["core-lib"].url.index;

            function fu(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function fc(e, t, r) {
                return (fc = fy() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && fd(o, r.prototype), o
                }).apply(null, arguments)
            }

            function fs(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function ff(e) {
                return (ff = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function fp(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function fd(e, t) {
                return (fd = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function fh(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (fh = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return fc(e, arguments, ff(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), fd(r, e)
                })(e)
            }

            function fy() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (fy = function() {
                    return !!e
                })()
            }
            var fm = function(e) {
                    return "string" == typeof e || "number" == typeof e || "boolean" == typeof e ? String(e) : JSON.stringify(e)
                },
                fb = function(e, t) {
                    var r = fl.Url.parse(new URL(e.url, window.location.origin).href).getOrThrow();
                    return t ? r.withSearchParams(Object.entries(t).flatMap(function(e) {
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
                                    if ("string" == typeof e) return fu(e, 2);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return fu(e, 2)
                                }
                            }(e) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            r = t[0],
                            n = t[1];
                        return null == n ? [] : Array.isArray(n) ? n.map(function(e) {
                            return ["".concat(r, "[]"), fm(e)]
                        }) : [
                            [r, fm(n)]
                        ]
                    })) : r
                },
                fv = function(e) {
                    return function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                fs(e, t, r[t])
                            })
                        }
                        return e
                    }({
                        includeBodyOnError: !0
                    }, e.withCredentials ? {
                        credentials: "include"
                    } : {}, e.headers ? {
                        headers: e.headers
                    } : {})
                },
                fg = function(e) {
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function t(e, r, n) {
                        var o, i, a;
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        return i = t, a = ["Request failed with status ".concat(e), n], i = ff(i), fs(o = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, fy() ? Reflect.construct(i, a || [], ff(this).constructor) : i.apply(this, a)), "status", void 0), fs(o, "data", void 0), o.status = e, o.data = r, o
                    }
                    return t.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: t,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && fd(t, e), t
                }(fh(Error)),
                fO = function(e) {
                    if (fp(e, fa.HttpError)) {
                        var t = e.response,
                            r = t.status,
                            n = t.body,
                            o = n;
                        if ("string" == typeof n) try {
                            o = JSON.parse(n)
                        } catch (e) {
                            o = n
                        }
                        return new fg(r, o, {
                            cause: e
                        })
                    }
                    return fp(e, Error) ? e : Error(String(e), {
                        cause: e
                    })
                },
                fw = "true" === r(773).env.NEXT_PUBLIC_IS_NEXTJS ? {
                    get: function(e, t) {
                        return Promise.resolve().then(function() {
                            return fa.getUntyped(fb(e, t), fv(e)).getOrThrow()
                        }).catch(function(e) {
                            throw fO(e)
                        })
                    },
                    post: function(e, t) {
                        var r = null != t ? t : {};
                        return Promise.resolve().then(function() {
                            return fa.postUntyped(fb(e), r, fv(e)).getOrThrow()
                        }).catch(function(e) {
                            throw fO(e)
                        })
                    }
                } : {
                    get: function(e, t) {
                        return fi.get(e, t).then(function(e) {
                            return e.data
                        })
                    },
                    post: function(e, t) {
                        return fi.post(e, t).then(function(e) {
                            return e.data
                        })
                    }
                },
                fS = function(e) {
                    return {
                        isError: !1,
                        value: e
                    }
                },
                fE = function(e, t) {
                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null;
                    return {
                        isError: !0,
                        error: e,
                        errorRaw: t,
                        errorStatusCode: r
                    }
                };

            function fA(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function fP(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var fj = function(e) {
                    var t, r = [];
                    if (!e || (void 0 === e ? "undefined" : fP(e)) !== "object") return [];
                    var n = e.errors;
                    return (null != (t = Array) && "u" > typeof Symbol && t[Symbol.hasInstance] ? t[Symbol.hasInstance](n) : n instanceof t) ? (n.forEach(function(e) {
                        if (e && (void 0 === e ? "undefined" : fP(e)) === "object") {
                            var t = e.code;
                            "number" == typeof t && r.push(t)
                        }
                    }), r) : []
                },
                fx = function(e, t) {
                    return null == e ? null : Object.values(e).includes(t) ? t : null
                },
                fT = function(e) {
                    if ((void 0 === e ? "undefined" : fP(e)) !== "object" || null === e) return null;
                    var t = e.status || null;
                    return "number" != typeof t ? null : t
                },
                f_ = function(e, t, r) {
                    var n;
                    return (n = function() {
                        var n, o, i, a;
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
                        }(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    return l.trys.push([0, 2, , 3]), [4, e];
                                case 1:
                                    if (n = l.sent(), void 0 !== r) return [2, fS(r(n))];
                                    return [2, fS(n)];
                                case 2:
                                    var u;
                                    return i = (void 0 === (u = o = l.sent()) ? "undefined" : fP(u)) !== "object" ? null : fj(u.data)[0] || null, a = fT(o), [2, fE(fx(t, i), o, a)];
                                case 3:
                                    return [2]
                            }
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(r, o) {
                            var i = n.apply(e, t);

                            function a(e) {
                                fA(i, r, o, a, l, "next", e)
                            }

                            function l(e) {
                                fA(i, r, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                };

            function fI(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var fC = function(e, t) {
                    return f_(fw.post(i0, {
                        currentPassword: e,
                        newPassword: t
                    }), iQ)
                },
                fR = function() {
                    return f_(fw.post(i2), i1)
                },
                fN = function(e, t) {
                    var r;
                    return (r = function() {
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
                        }(this, function(r) {
                            return [2, f_(fw.post(i6, {
                                username: e,
                                password: t
                            }), null).then(function(e) {
                                var t, r;
                                return t = e, r = function(e) {
                                    return fx(i3, e.code)
                                }, t.isError ? t : fS(r(t.value))
                            })]
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(n, o) {
                            var i = r.apply(e, t);

                            function a(e) {
                                fI(i, n, o, a, l, "next", e)
                            }

                            function l(e) {
                                fI(i, n, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                };

            function fD(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var fM = function() {
                    var e;
                    return (e = function() {
                        var e;
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
                        }(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return [4, f_(fw.get(tG, {
                                        shouldReturnMetadata: !0
                                    }), tH)];
                                case 1:
                                    var r, n;
                                    if ((e = t.sent()).isError) return [2, e];
                                    return r = function(e) {
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
                                    }({}, e), n = n = {
                                        value: e.value.filter(function(e) {
                                            return e.isGeneric ? Object.values(tF).includes(e.metadata.displayType) : Object.values(tW).includes(e.promptType)
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
                                    }), [2, e = r]
                            }
                        })
                    }, function() {
                        var t = this,
                            r = arguments;
                        return new Promise(function(n, o) {
                            var i = e.apply(t, r);

                            function a(e) {
                                fD(i, n, o, a, l, "next", e)
                            }

                            function l(e) {
                                fD(i, n, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                fL = function(e, t) {
                    return f_(fw.post(tK, {
                        action: e,
                        promptType: t
                    }), tH)
                };

            function fk(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function fU(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            fk(i, n, o, a, l, "next", e)
                        }

                        function l(e) {
                            fk(i, n, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function fB(e, t) {
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
            var fH = {
                    password: L,
                    promptAssignments: (j = function(e) {
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
                    }({}, k), x = x = {
                        getAllForCurrentUser: function() {
                            return fU(function() {
                                var e;
                                return fB(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            return [4, fM()];
                                        case 1:
                                            return (e = t.sent()).isError && ah(), [2, e]
                                    }
                                })
                            })()
                        },
                        updateForCurrentUser: function(e, t) {
                            return fU(function() {
                                var r;
                                return fB(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            return [4, fL(e, t)];
                                        case 1:
                                            return (r = n.sent()).isError ? ad(t, e) : ap(t, e), [2, r]
                                    }
                                })
                            })()
                        }
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(j, Object.getOwnPropertyDescriptors(x)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(x)).forEach(function(e) {
                        Object.defineProperty(j, e, Object.getOwnPropertyDescriptor(x, e))
                    }), j)
                },
                fF = function(e) {
                    var t, r, n = null == K ? void 0 : K.getElementById(o0);
                    null != n && (0, F.render)((0, U.jsx)(tI, {
                        namespaces: iq,
                        children: (0, U.jsx)(fo, {
                            href: null != (t = null == Y ? void 0 : Y.location.href) ? t : "",
                            username: null != (r = e.userName) ? r : "",
                            isUserUnder13: e.isUnder13,
                            requestService: fH
                        })
                    }), n)
                },
                fV = function() {
                    if ("u" > typeof document) {
                        var e, t;
                        return tM(null != (e = null == (t = document.querySelector('meta[name="user-data"]')) ? void 0 : t.dataset) ? e : document.documentElement.dataset)
                    }
                }();
            null != fV && (null == (M = (0, z.getDeviceMeta)()) ? void 0 : M.appType) === "unknown" && ((null == Y ? void 0 : Y.Roblox) != null && Object.assign(Y.Roblox, {
                AccountSecurityPrompt: {
                    render: function(e, t, r) {
                        var n = null == K ? void 0 : K.getElementById(o0);
                        if (null != n) {
                            (0, F.unmountComponentAtNode)(n);
                            var o = new fr(e.promptType);
                            (0, F.render)((0, U.jsx)(tI, {
                                namespaces: iq,
                                children: (0, U.jsx)(s9, {
                                    promptAssignment: e,
                                    username: t,
                                    isUserUnder13: r,
                                    eventService: o,
                                    requestService: fH
                                })
                            }), n)
                        }
                    },
                    PromptType: tW
                }
            }), $()(function() {
                return fF(fV)
            }))
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "AccountSecurityPrompt");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/accountSecurityPrompt-6c090d00c8f06200.js.map