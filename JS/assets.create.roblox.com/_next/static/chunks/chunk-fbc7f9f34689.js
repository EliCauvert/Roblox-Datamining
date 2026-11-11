;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "c73893f2-61b4-2f8f-b4d7-622a3daeb665")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 163021, (e, t, n) => {
    "use strict";
    var r, i;
    t.exports = (null == (r = e.g.process) ? void 0 : r.env) && "object" == typeof(null == (i = e.g.process) ? void 0 : i.env) ? e.g.process : e.r(633497)
}, 633497, (e, t, n) => {
    var r = {
            156: function(e) {
                var t, n, r, i = e.exports = {};

                function o() {
                    throw Error("setTimeout has not been defined")
                }

                function a() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    t = "function" == typeof setTimeout ? setTimeout : o
                } catch (e) {
                    t = o
                }
                try {
                    n = "function" == typeof clearTimeout ? clearTimeout : a
                } catch (e) {
                    n = a
                }

                function u(e) {
                    if (t === setTimeout) return setTimeout(e, 0);
                    if ((t === o || !t) && setTimeout) return t = setTimeout, setTimeout(e, 0);
                    try {
                        return t(e, 0)
                    } catch (n) {
                        try {
                            return t.call(null, e, 0)
                        } catch (n) {
                            return t.call(this, e, 0)
                        }
                    }
                }
                var s = [],
                    l = !1,
                    c = -1;

                function d() {
                    l && r && (l = !1, r.length ? s = r.concat(s) : c = -1, s.length && f())
                }

                function f() {
                    if (!l) {
                        var e = u(d);
                        l = !0;
                        for (var t = s.length; t;) {
                            for (r = s, s = []; ++c < t;) r && r[c].run();
                            c = -1, t = s.length
                        }
                        r = null, l = !1,
                            function(e) {
                                if (n === clearTimeout) return clearTimeout(e);
                                if ((n === a || !n) && clearTimeout) return n = clearTimeout, clearTimeout(e);
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

                function p(e, t) {
                    this.fun = e, this.array = t
                }

                function h() {}
                i.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var n = 1; n < arguments.length; n++) t[n - 1] = arguments[n];
                    s.push(new p(e, t)), 1 !== s.length || l || u(f)
                }, p.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, i.title = "browser", i.browser = !0, i.env = {}, i.argv = [], i.version = "", i.versions = {}, i.on = h, i.addListener = h, i.once = h, i.off = h, i.removeListener = h, i.removeAllListeners = h, i.emit = h, i.prependListener = h, i.prependOnceListener = h, i.listeners = function(e) {
                    return []
                }, i.binding = function(e) {
                    throw Error("process.binding is not supported")
                }, i.cwd = function() {
                    return "/"
                }, i.chdir = function(e) {
                    throw Error("process.chdir is not supported")
                }, i.umask = function() {
                    return 0
                }
            }
        },
        i = {};

    function o(e) {
        var t = i[e];
        if (void 0 !== t) return t.exports;
        var n = i[e] = {
                exports: {}
            },
            a = !0;
        try {
            r[e](n, n.exports, o), a = !1
        } finally {
            a && delete i[e]
        }
        return n.exports
    }
    o.ab = "/ROOT/links/@/next/16.4.5/0de1122c89b9724448b83052600528d4b1dce37d3127900fabdf5af34275552d/node_modules/next/dist/compiled/process/", t.exports = o(156)
}, 333793, (e, t, n) => {
    "use strict";
    var r = Symbol.for("react.transitional.element");

    function i(e, t, n) {
        var i = null;
        if (void 0 !== n && (i = "" + n), void 0 !== t.key && (i = "" + t.key), "key" in t)
            for (var o in n = {}, t) "key" !== o && (n[o] = t[o]);
        else n = t;
        return {
            $$typeof: r,
            type: e,
            key: i,
            ref: void 0 !== (t = n.ref) ? t : null,
            props: n
        }
    }
    n.Fragment = Symbol.for("react.fragment"), n.jsx = i, n.jsxs = i
}, 373133, (e, t, n) => {
    "use strict";
    var r = e.i(163021),
        i = Symbol.for("react.transitional.element"),
        o = Symbol.for("react.portal"),
        a = Symbol.for("react.fragment"),
        u = Symbol.for("react.strict_mode"),
        s = Symbol.for("react.profiler"),
        l = Symbol.for("react.consumer"),
        c = Symbol.for("react.context"),
        d = Symbol.for("react.forward_ref"),
        f = Symbol.for("react.suspense"),
        p = Symbol.for("react.memo"),
        h = Symbol.for("react.lazy"),
        m = Symbol.for("react.activity"),
        v = Symbol.iterator,
        y = {
            isMounted: function() {
                return !1
            },
            enqueueForceUpdate: function() {},
            enqueueReplaceState: function() {},
            enqueueSetState: function() {}
        },
        g = Object.assign,
        _ = {};

    function b(e, t, n) {
        this.props = e, this.context = t, this.refs = _, this.updater = n || y
    }

    function F() {}

    function w(e, t, n) {
        this.props = e, this.context = t, this.refs = _, this.updater = n || y
    }
    b.prototype.isReactComponent = {}, b.prototype.setState = function(e, t) {
        if ("object" != typeof e && "function" != typeof e && null != e) throw Error("takes an object of state variables to update or a function which returns an object of state variables.");
        this.updater.enqueueSetState(this, e, t, "setState")
    }, b.prototype.forceUpdate = function(e) {
        this.updater.enqueueForceUpdate(this, e, "forceUpdate")
    }, F.prototype = b.prototype;
    var z = w.prototype = new F;
    z.constructor = w, g(z, b.prototype), z.isPureReactComponent = !0;
    var k = Array.isArray;

    function O() {}
    var A = {
            H: null,
            A: null,
            T: null,
            S: null
        },
        E = Object.prototype.hasOwnProperty;

    function S(e, t, n) {
        var r = n.ref;
        return {
            $$typeof: i,
            type: e,
            key: t,
            ref: void 0 !== r ? r : null,
            props: n
        }
    }

    function T(e) {
        return "object" == typeof e && null !== e && e.$$typeof === i
    }
    var x = /\/+/g;

    function P(e, t) {
        var n, r;
        return "object" == typeof e && null !== e && null != e.key ? (n = "" + e.key, r = {
            "=": "=0",
            ":": "=2"
        }, "$" + n.replace(/[=:]/g, function(e) {
            return r[e]
        })) : t.toString(36)
    }

    function j(e, t, n) {
        if (null == e) return e;
        var r = [],
            a = 0;
        return ! function e(t, n, r, a, u) {
            var s, l, c, d = typeof t;
            ("undefined" === d || "boolean" === d) && (t = null);
            var f = !1;
            if (null === t) f = !0;
            else switch (d) {
                case "bigint":
                case "string":
                case "number":
                    f = !0;
                    break;
                case "object":
                    switch (t.$$typeof) {
                        case i:
                        case o:
                            f = !0;
                            break;
                        case h:
                            return e((f = t._init)(t._payload), n, r, a, u)
                    }
            }
            if (f) return u = u(t), f = "" === a ? "." + P(t, 0) : a, k(u) ? (r = "", null != f && (r = f.replace(x, "$&/") + "/"), e(u, n, r, "", function(e) {
                return e
            })) : null != u && (T(u) && (s = u, l = r + (null == u.key || t && t.key === u.key ? "" : ("" + u.key).replace(x, "$&/") + "/") + f, u = S(s.type, l, s.props)), n.push(u)), 1;
            f = 0;
            var p = "" === a ? "." : a + ":";
            if (k(t))
                for (var m = 0; m < t.length; m++) d = p + P(a = t[m], m), f += e(a, n, r, d, u);
            else if ("function" == typeof(m = null === (c = t) || "object" != typeof c ? null : "function" == typeof(c = v && c[v] || c["@@iterator"]) ? c : null))
                for (t = m.call(t), m = 0; !(a = t.next()).done;) d = p + P(a = a.value, m++), f += e(a, n, r, d, u);
            else if ("object" === d) {
                if ("function" == typeof t.then) return e(function(e) {
                    switch (e.status) {
                        case "fulfilled":
                            return e.value;
                        case "rejected":
                            throw e.reason;
                        default:
                            switch ("string" == typeof e.status ? e.then(O, O) : (e.status = "pending", e.then(function(t) {
                                    "pending" === e.status && (e.status = "fulfilled", e.value = t)
                                }, function(t) {
                                    "pending" === e.status && (e.status = "rejected", e.reason = t)
                                })), e.status) {
                                case "fulfilled":
                                    return e.value;
                                case "rejected":
                                    throw e.reason
                            }
                    }
                    throw e
                }(t), n, r, a, u);
                throw Error("Objects are not valid as a React child (found: " + ("[object Object]" === (n = String(t)) ? "object with keys {" + Object.keys(t).join(", ") + "}" : n) + "). If you meant to render a collection of children, use an array instead.")
            }
            return f
        }(e, r, "", "", function(e) {
            return t.call(n, e, a++)
        }), r
    }

    function C(e) {
        if (-1 === e._status) {
            var t = e._result;
            (t = t()).then(function(t) {
                (0 === e._status || -1 === e._status) && (e._status = 1, e._result = t)
            }, function(t) {
                (0 === e._status || -1 === e._status) && (e._status = 2, e._result = t)
            }), -1 === e._status && (e._status = 0, e._result = t)
        }
        if (1 === e._status) return e._result.default;
        throw e._result
    }
    var I = "function" == typeof reportError ? reportError : function(e) {
        if ("object" == typeof window && "function" == typeof window.ErrorEvent) {
            var t = new window.ErrorEvent("error", {
                bubbles: !0,
                cancelable: !0,
                message: "object" == typeof e && null !== e && "string" == typeof e.message ? String(e.message) : String(e),
                error: e
            });
            if (!window.dispatchEvent(t)) return
        } else if ("object" == typeof r.default && "function" == typeof r.default.emit) return void r.default.emit("uncaughtException", e);
        console.error(e)
    };
    n.Activity = m, n.Children = {
        map: j,
        forEach: function(e, t, n) {
            j(e, function() {
                t.apply(this, arguments)
            }, n)
        },
        count: function(e) {
            var t = 0;
            return j(e, function() {
                t++
            }), t
        },
        toArray: function(e) {
            return j(e, function(e) {
                return e
            }) || []
        },
        only: function(e) {
            if (!T(e)) throw Error("React.Children.only expected to receive a single React element child.");
            return e
        }
    }, n.Component = b, n.Fragment = a, n.Profiler = s, n.PureComponent = w, n.StrictMode = u, n.Suspense = f, n.__CLIENT_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE = A, n.__COMPILER_RUNTIME = {
        __proto__: null,
        c: function(e) {
            return A.H.useMemoCache(e)
        }
    }, n.cache = function(e) {
        return function() {
            return e.apply(null, arguments)
        }
    }, n.cacheSignal = function() {
        return null
    }, n.cloneElement = function(e, t, n) {
        if (null == e) throw Error("The argument must be a React element, but you passed " + e + ".");
        var r = g({}, e.props),
            i = e.key;
        if (null != t)
            for (o in void 0 !== t.key && (i = "" + t.key), t) E.call(t, o) && "key" !== o && "__self" !== o && "__source" !== o && ("ref" !== o || void 0 !== t.ref) && (r[o] = t[o]);
        var o = arguments.length - 2;
        if (1 === o) r.children = n;
        else if (1 < o) {
            for (var a = Array(o), u = 0; u < o; u++) a[u] = arguments[u + 2];
            r.children = a
        }
        return S(e.type, i, r)
    }, n.createContext = function(e) {
        return (e = {
            $$typeof: c,
            _currentValue: e,
            _currentValue2: e,
            _threadCount: 0,
            Provider: null,
            Consumer: null
        }).Provider = e, e.Consumer = {
            $$typeof: l,
            _context: e
        }, e
    }, n.createElement = function(e, t, n) {
        var r, i = {},
            o = null;
        if (null != t)
            for (r in void 0 !== t.key && (o = "" + t.key), t) E.call(t, r) && "key" !== r && "__self" !== r && "__source" !== r && (i[r] = t[r]);
        var a = arguments.length - 2;
        if (1 === a) i.children = n;
        else if (1 < a) {
            for (var u = Array(a), s = 0; s < a; s++) u[s] = arguments[s + 2];
            i.children = u
        }
        if (e && e.defaultProps)
            for (r in a = e.defaultProps) void 0 === i[r] && (i[r] = a[r]);
        return S(e, o, i)
    }, n.createRef = function() {
        return {
            current: null
        }
    }, n.forwardRef = function(e) {
        return {
            $$typeof: d,
            render: e
        }
    }, n.isValidElement = T, n.lazy = function(e) {
        return {
            $$typeof: h,
            _payload: {
                _status: -1,
                _result: e
            },
            _init: C
        }
    }, n.memo = function(e, t) {
        return {
            $$typeof: p,
            type: e,
            compare: void 0 === t ? null : t
        }
    }, n.startTransition = function(e) {
        var t = A.T,
            n = {};
        A.T = n;
        try {
            var r = e(),
                i = A.S;
            null !== i && i(n, r), "object" == typeof r && null !== r && "function" == typeof r.then && r.then(O, I)
        } catch (e) {
            I(e)
        } finally {
            null !== t && null !== n.types && (t.types = n.types), A.T = t
        }
    }, n.unstable_useCacheRefresh = function() {
        return A.H.useCacheRefresh()
    }, n.use = function(e) {
        return A.H.use(e)
    }, n.useActionState = function(e, t, n) {
        return A.H.useActionState(e, t, n)
    }, n.useCallback = function(e, t) {
        return A.H.useCallback(e, t)
    }, n.useContext = function(e) {
        return A.H.useContext(e)
    }, n.useDebugValue = function() {}, n.useDeferredValue = function(e, t) {
        return A.H.useDeferredValue(e, t)
    }, n.useEffect = function(e, t) {
        return A.H.useEffect(e, t)
    }, n.useEffectEvent = function(e) {
        return A.H.useEffectEvent(e)
    }, n.useId = function() {
        return A.H.useId()
    }, n.useImperativeHandle = function(e, t, n) {
        return A.H.useImperativeHandle(e, t, n)
    }, n.useInsertionEffect = function(e, t) {
        return A.H.useInsertionEffect(e, t)
    }, n.useLayoutEffect = function(e, t) {
        return A.H.useLayoutEffect(e, t)
    }, n.useMemo = function(e, t) {
        return A.H.useMemo(e, t)
    }, n.useOptimistic = function(e, t) {
        return A.H.useOptimistic(e, t)
    }, n.useReducer = function(e, t, n) {
        return A.H.useReducer(e, t, n)
    }, n.useRef = function(e) {
        return A.H.useRef(e)
    }, n.useState = function(e) {
        return A.H.useState(e)
    }, n.useSyncExternalStore = function(e, t, n) {
        return A.H.useSyncExternalStore(e, t, n)
    }, n.useTransition = function() {
        return A.H.useTransition()
    }, n.version = "19.2.6"
}, 643766, (e, t, n) => {
    "use strict";
    t.exports = e.r(373133)
}, 785517, (e, t, n) => {
    "use strict";
    t.exports = e.r(333793)
}, 805290, e => {
    "use strict";
    e.s(["_", 0, function(e, t, n) {
        return t in e ? Object.defineProperty(e, t, {
            value: n,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = n, e
    }])
}, 79187, e => {
    "use strict";
    let t, n, r, i, o, a, u, s, l, c;
    var d, f, p, h, m, v, y = e.i(805290),
        g = e.i(643766),
        _ = ((h = _ || {}).English = "en-US", h.Spanish = "es-ES", h.French = "fr-FR", h.German = "de-DE", h.Italian = "it-IT", h.BrazilPortuguese = "pt-BR", h.Korean = "ko-KR", h.SimplifiedChinese = "zh-CN", h.SimplifiedChineseJV = "zh-CJV", h.TraditionalChinese = "zh-TW", h.Japanese = "ja-JP", h.Russian = "ru-RU", h.Indonesian = "id-ID", h.Polish = "pl-PL", h.Vietnamese = "vi-VN", h.Turkish = "tr-TR", h.Arabic = "ar-001", h.Thai = "th-TH", h.Hindi = "hi-IN", h.Dutch = "nl-NL", h),
        b = ((f = b || {}).English = "en_us", f.Spanish = "es_es", f.French = "fr_fr", f.German = "de_de", f.Italian = "it_it", f.BrazilPortuguese = "pt_br", f.Korean = "ko_kr", f.SimplifiedChinese = "zh_cn", f.SimplifiedChineseJV = "zh_cjv", f.TraditionalChinese = "zh_tw", f.Japanese = "ja_jp", f.Russian = "ru_ru", f.Indonesian = "id_id", f.Polish = "pl_pl", f.Vietnamese = "vi_vn", f.Turkish = "tr_tr", f.Arabic = "ar_001", f.Thai = "th_th", f.Hindi = "hi_in", f.Dutch = "nl_nl", f),
        F = ((p = F || {}).English = "English", p.Spanish = "Español", p.French = "Français", p.German = "Deutsch", p.Italian = "Italiano", p.BrazilPortuguese = "Português (Brasil)", p.Korean = "한국어", p.SimplifiedChinese = "中文(简体)", p.SimplifiedChineseJV = "中文(简体)", p.TraditionalChinese = "中文(繁體)", p.Japanese = "日本語", p.Russian = "Русский", p.Indonesian = "Bahasa Indonesia", p.Polish = "Polski", p.Vietnamese = "Tiếng Việt", p.Turkish = "Türkçe", p.Arabic = "العربية", p.Thai = "ภาษาไทย", p.Hindi = "हिन्दी", p.Dutch = "Nederlands", p);
    let w = (0, g.createContext)(void 0);
    w.displayName = " Localization";
    let z = (0, g.createContext)({
        provider: null
    });
    z.displayName = "TranslationProvider";
    let k = (0, g.createContext)({
        resources: null,
        ready: !1
    });

    function O(e, t) {
        return Array.isArray(t) ? t.reduce((t, n, r) => (t[n] = e[r], t), {}) : {
            "": e.reduce((e, t) => Object.assign(e, t), {})
        }
    }
    k.displayName = "Translation";
    class A {
        loadTranslationResources(e, t) {
            return Promise.all(e.map(async e => {
                try {
                    return await this.loadTranslationResource(e, t)
                } catch (n) {
                    return console.warn("Failed to retrieve namespace ".concat(e, " for locale ").concat(t)), {}
                }
            }))
        }
        getTranslationResources(e, t) {
            return e.every(e => void 0 !== this.tryGetTranslationResourceFromCache(e, t)) ? e.map(e => {
                var n;
                return null != (n = this.tryGetTranslationResourceFromCache(e, t)) ? n : {}
            }) : null
        }
        async loadTranslationResource(e, t) {
            let n = this.tryGetTranslationResourceFromCache(e, t);
            if (n) return n;
            let r = "".concat(t, "-").concat(e);
            if (Object.hasOwn(this.translationResourceRequestCache, r)) return this.translationResourceRequestCache[r];
            let i = {};
            try {
                let n = this.fetchTranslationResourceWithFallback(e, t);
                this.translationResourceRequestCache[r] = n, i = await n, null == this.translationResourceCache[t] && (this.translationResourceCache[t] = {}), this.translationResourceCache[t][e] = i
            } catch (n) {
                console.warn("Failed to retrieve translation resources of ".concat(e, " for ").concat(t))
            } finally {
                delete this.translationResourceRequestCache[r]
            }
            return i
        }
        tryGetTranslationResourceFromCache(e, t) {
            var n;
            return null == (n = this.translationResourceCache[t]) ? void 0 : n[e]
        }
        async fetchTranslationResourceWithFallback(e, t) {
            let n = {};
            try {
                n = await this.fetchTranslationResource(e, t)
            } catch (n) {
                console.warn("Failed to retrieve translation resources of ".concat(e, " for ").concat(t))
            }
            if (t !== this.fallbackLocale && (Object.values(n).some(e => null == e) || 0 === Object.keys(n).length)) try {
                let t = await this.loadTranslationResource(e, this.fallbackLocale);
                return Object.keys({
                    ...t,
                    ...n
                }).reduce((e, r) => {
                    var i;
                    return Object.assign(e, {
                        [r]: null != (i = n[r]) ? i : t[r]
                    }), e
                }, {})
            } catch (e) {}
            return n
        }
        constructor(e, t = e.locale) {
            (0, y._)(this, "defaultLocaleInfo", void 0), (0, y._)(this, "fallbackLocale", void 0), (0, y._)(this, "translationResourceCache", void 0), (0, y._)(this, "translationResourceRequestCache", void 0), this.defaultLocaleInfo = e, this.fallbackLocale = t, this.translationResourceCache = {}, this.translationResourceRequestCache = {}
        }
    }

    function E(e) {
        let t = Object.values(e).filter(e => "number" == typeof e);
        return Object.entries(e).filter(e => {
            let [n, r] = e;
            return -1 === t.indexOf(+n)
        }).map(e => {
            let [t, n] = e;
            return n
        })
    }

    function S(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "|";
        return e.map(e => W(e)).join(t)
    }

    function T(e, t) {
        return "bigint" == typeof t ? t.toString() : t
    }
    class x {
        get value() {
            let e = this._getter;
            return void 0 !== e && (this._value = e(), this._getter = void 0), this._value
        }
        constructor(e) {
            this._getter = e, this._value = void 0
        }
    }

    function P(e) {
        let t = +!!e.startsWith("^"),
            n = e.endsWith("$") ? e.length - 1 : e.length;
        return e.slice(t, n)
    }

    function j(e, t, n) {
        Object.defineProperty(e, t, {
            value: n,
            writable: !0,
            enumerable: !0,
            configurable: !0
        })
    }

    function C(e) {
        let t = Object.getOwnPropertyDescriptor(e, "shape");
        return (null == t ? void 0 : t.get) ? t.get.raw : null == t ? void 0 : t.value
    }

    function I(e) {
        var t;
        return null != (t = C(e._zod.def)) ? t : e._zod.def.shape
    }

    function $(e, t, n) {
        Object.defineProperty(e, t, {
            get() {
                let e = n();
                return j(this, t, e), e
            },
            enumerable: !0,
            configurable: !0
        })
    }

    function R(e, t, n) {
        t in e ? j(e, t, n) : e[t] = n
    }

    function Z(e, t, n, r) {
        let i = I(t);
        for (let o of n) {
            let n = Object.getOwnPropertyDescriptor(i, o);
            n.enumerable && (n.get ? $(e, o, () => {
                let e = t._zod.def.shape[o];
                return r ? r(e, o) : e
            }) : R(e, o, r ? r(n.value, o) : n.value))
        }
    }

    function D() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        let r = {};
        for (let e of t) Object.assign(r, Object.getOwnPropertyDescriptors(e));
        return Object.defineProperties({}, r)
    }
    let N = "captureStackTrace" in Error ? Error.captureStackTrace : function() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n]
    };

    function L(e) {
        return "object" == typeof e && null !== e && !Array.isArray(e)
    }
    let B = new x(() => {
        var e, t;
        if (eg.jitless || "u" > typeof navigator && (null == (t = navigator) || null == (e = t.userAgent) ? void 0 : e.includes("Cloudflare"))) return !1;
        try {
            return Function(""), !0
        } catch (e) {
            return !1
        }
    });

    function J(e) {
        if (!1 === L(e)) return !1;
        let t = e.constructor;
        if (void 0 === t || "function" != typeof t) return !0;
        let n = t.prototype;
        return !1 !== L(n) && !1 !== Object.prototype.hasOwnProperty.call(n, "isPrototypeOf")
    }

    function U(e) {
        return J(e) ? {
            ...e
        } : Array.isArray(e) ? [...e] : e instanceof Map ? new Map(e) : e instanceof Set ? new Set(e) : e
    }
    let M = new Set(["string", "number", "symbol"]);

    function V(e) {
        return e.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
    }

    function H(e, t, n) {
        let r = new e._zod.constr(null != t ? t : e._zod.def);
        return (!t || (null == n ? void 0 : n.parent)) && (r._zod.parent = e), r
    }

    function K(e) {
        if (!e) return {};
        if ("string" == typeof e) return {
            error: () => e
        };
        if ((null == e ? void 0 : e.message) !== void 0) {
            if ((null == e ? void 0 : e.error) !== void 0) throw Error("Cannot specify both `message` and `error` params");
            e.error = e.message
        }
        return (delete e.message, "string" == typeof e.error) ? {
            ...e,
            error: () => e.error
        } : e
    }

    function W(e) {
        return "bigint" == typeof e ? e.toString() + "n" : "string" == typeof e ? '"'.concat(e, '"') : "".concat(e)
    }
    let q = {
            safeint: [Number.MIN_SAFE_INTEGER, Number.MAX_SAFE_INTEGER],
            int32: [-0x80000000, 0x7fffffff],
            uint32: [0, 0xffffffff],
            float32: [-34028234663852886e22, 34028234663852886e22],
            float64: [-Number.MAX_VALUE, Number.MAX_VALUE]
        },
        G = {
            int64: [BigInt("-9223372036854775808"), BigInt("9223372036854775807")],
            uint64: [BigInt(0), BigInt("18446744073709551615")]
        };

    function X(e, t) {
        let n = I(e),
            r = [];
        for (let e of Reflect.ownKeys(t)) {
            var i;
            if (!(null == (i = Object.getOwnPropertyDescriptor(n, e)) ? void 0 : i.enumerable)) throw Error('Unrecognized key: "'.concat(String(e), '"'));
            t[e] && r.push(e)
        }
        return r
    }

    function Y(e, t) {
        let n = {};
        for (let r of (Z(n, e, Reflect.ownKeys(I(e))), Reflect.ownKeys(t))) {
            let e = Object.getOwnPropertyDescriptor(t, r);
            e.enumerable && (e.get ? $(n, r, () => t[r]) : R(n, r, e.value))
        }
        return n
    }

    function Q(e, t, n) {
        let r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : "partial",
            i = t._zod.def.checks;
        if (i && i.length > 0) throw Error(".".concat(r, "() cannot be used on object schemas containing refinements"));
        let o = n ? new Set(X(t, n)) : void 0,
            a = {};
        return Z(a, t, Reflect.ownKeys(I(t)), e && ((t, n) => o && !o.has(n) ? t : new e({
            type: "optional",
            innerType: t
        }))), H(t, D(t._zod.def, {
            shape: a,
            checks: []
        }))
    }

    function ee(e) {
        var t;
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
        if (!0 === e.aborted) return !0;
        for (let r = n; r < e.issues.length; r++)
            if ((null == (t = e.issues[r]) ? void 0 : t.continue) !== !0) return !0;
        return !1
    }

    function et(e, t) {
        return t.map(t => (null != t.path || (t.path = []), t.path.unshift(e), t))
    }

    function en(e) {
        return "string" == typeof e ? e : null == e ? void 0 : e.message
    }

    function er(e, t, n) {
        var r;
        for (let i = t; i < e.length; i++) null != (r = e[i]).schema || (r.schema = n)
    }

    function ei(e, t, n) {
        var r, i, o, a, u, s, l, c, d, f, p, h, m, v, y;
        let g = null == (l = e.inst) || null == (s = l._zod) ? void 0 : s.traits;
        (null == g ? void 0 : g.has("$ZodType")) && (g.has("$ZodCheck") && null != e.schema || (e.schema = e.inst));
        let _ = e.schema !== e.inst ? null == (d = e.schema) || null == (c = d._zod.def) ? void 0 : c.error : void 0,
            b = e.message ? e.message : null != (r = null != (i = null != (o = null != (a = null != (u = en(null == (h = e.inst) || null == (p = h._zod.def) || null == (f = p.error) ? void 0 : f.call(p, e))) ? u : en(null == _ ? void 0 : _(e))) ? a : en(null == t || null == (m = t.error) ? void 0 : m.call(t, e))) ? o : en(null == (v = n.customError) ? void 0 : v.call(n, e))) ? i : en(null == (y = n.localeError) ? void 0 : y.call(n, e))) ? r : "Invalid input",
            F = {};
        for (let t of Object.keys(e)) "inst" !== t && "schema" !== t && "continue" !== t && "input" !== t && "__proto__" !== t && (F[t] = e[t]);
        return null != F.path || (F.path = []), F.message = b, (null == t ? void 0 : t.reportInput) && (F.input = e.input), F
    }
    let eo = /[\uD800-\uDBFF]/;

    function ea(e) {
        let t = e.length;
        if (!eo.test(e)) return t;
        let n = t;
        for (let r = 0; r < t - 1; r++)(64512 & e.charCodeAt(r)) == 55296 && (64512 & e.charCodeAt(r + 1)) == 56320 && (n--, r++);
        return n
    }

    function eu(e) {
        return Array.isArray(e) ? "array" : "string" == typeof e ? "string" : "unknown"
    }

    function es() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        let [r, i, o] = t;
        return "string" == typeof r ? {
            message: r,
            code: "custom",
            input: i,
            inst: o
        } : {
            ...r
        }
    }

    function el(e, t, n) {
        let r = !(arguments.length > 3) || void 0 === arguments[3] || arguments[3];
        return Object.defineProperty(e, t, {
            configurable: !0,
            writable: !0,
            enumerable: r,
            value: n
        }), n
    }
    let ec = !1,
        ed = {
            configurable: !0,
            get() {
                ec = !0
            }
        };

    function ef(e, n, r) {
        let i = Object.getPrototypeOf(e._zod);
        if (n in i && t !== e._zod) {
            t = void 0;
            return
        }
        t = e._zod, Object.defineProperty(i, n, {
            configurable: !0,
            get() {
                Object.defineProperty(this, n, ed);
                let e = ec;
                ec = !1;
                try {
                    let t = r(this);
                    return ec ? delete this[n] : Object.defineProperty(this, n, {
                        configurable: !0,
                        writable: !0,
                        value: t
                    }), ec = ec || e, t
                } catch (t) {
                    throw delete this[n], ec = ec || e, t
                }
            },
            set(e) {
                Object.defineProperty(this, n, {
                    configurable: !0,
                    writable: !0,
                    value: e
                })
            }
        })
    }
    let ep = {
            value: void 0,
            enumerable: !1
        },
        eh = "captureStackTrace" in Error ? Error : null;

    function em(e, t, n, r) {
        var i;

        function o(e) {
            this.def = e, this.constr = c, this.traits = new Set
        }
        o.prototype = {};
        let a = n && new WeakSet;

        function u(r, i) {
            if (r._zod) {
                if (r._zod.traits.has(e)) return
            } else {
                ep.value = new o(i);
                try {
                    Object.defineProperty(r, "_zod", ep)
                } finally {
                    ep.value = void 0
                }
            }
            if (r._zod.traits.add(e), t(r, i), a) {
                let e = Object.getPrototypeOf(r),
                    t = r._zod.constr.prototype,
                    i = e;
                for (; i && i !== t;) i = Object.getPrototypeOf(i);
                let o = null != i ? i : e;
                if (!a.has(o))
                    for (let e in a.add(o), n) {
                        let t = Object.getOwnPropertyDescriptor(n, e);
                        t.get ? Object.defineProperty(o, e, {
                            ...t,
                            enumerable: !1
                        }) : function(e, t, n) {
                            Object.defineProperty(e, t, {
                                configurable: !0,
                                get() {
                                    return this == null ? n : el(this, t, n.bind(this))
                                },
                                set(e) {
                                    el(this, t, e)
                                }
                            })
                        }(o, e, t.value)
                    }
            }
            let u = c.prototype;
            for (let e in u) Object.prototype.hasOwnProperty.call(u, e) && (e in r || (r[e] = u[e].bind(r)))
        }
        let s = null != (i = null == r ? void 0 : r.Parent) ? i : Object;
        class l extends s {}

        function c(e) {
            var t;
            let n = (null == r ? void 0 : r.Parent) ? function(e) {
                let t = eh;
                if (t) {
                    let n = t.stackTraceLimit;
                    if ("number" == typeof n) {
                        try {
                            t.stackTraceLimit = 0
                        } catch (t) {
                            return eh = null, new e
                        }
                        try {
                            return new e
                        } finally {
                            t.stackTraceLimit = n
                        }
                    }
                }
                return new e
            }(l) : this;
            u(n, e);
            let i = n._zod.deferred;
            if (i) {
                for (let e of i) e();
                n._zod.deferred = void 0
            }
            let o = null == (t = globalThis.__zod_globalConfig) ? void 0 : t.postProcessor;
            return o && o(n), n
        }
        return Object.defineProperty(l, "name", {
            value: e
        }), Object.defineProperty(c, "init", {
            value: u
        }), Object.defineProperty(c, Symbol.hasInstance, {
            value: t => {
                var n, i;
                return !!(null == r ? void 0 : r.Parent) && t instanceof r.Parent || (null == t || null == (i = t._zod) || null == (n = i.traits) ? void 0 : n.has(e))
            }
        }), Object.defineProperty(c, "name", {
            value: e
        }), c
    }
    class ev extends Error {
        constructor() {
            super("Encountered Promise during synchronous parse. Use .parseAsync() instead.")
        }
    }
    class ey extends Error {
        constructor(e) {
            super("Encountered unidirectional transform during encode: ".concat(e)), this.name = "ZodEncodeError"
        }
    }
    null != (m = globalThis).__zod_globalConfig || (m.__zod_globalConfig = {});
    let eg = globalThis.__zod_globalConfig;

    function e_(e) {
        return e && Object.assign(eg, e), eg
    }
    let eb = {
            get: function() {
                let e = this._zod;
                return null != e.message || (e.message = JSON.stringify(e.def, T, 2)), e.message
            },
            set: function(e) {
                this._zod.message = e
            },
            enumerable: !0,
            configurable: !0
        },
        eF = {
            value: void 0,
            enumerable: !1
        },
        ew = new WeakSet([Object.prototype, Error.prototype]),
        ez = em("$ZodError", (e, t) => {
            e.name = "$ZodError", eF.value = t, Object.defineProperty(e, "issues", eF), eF.value = void 0, Object.defineProperty(e, "message", eb);
            let n = Object.getPrototypeOf(e);
            ew.has(n) || (ew.add(n), Object.defineProperty(n, "toString", {
                configurable: !0,
                enumerable: !1,
                get() {
                    let e = () => this.message;
                    return Object.defineProperty(this, "toString", {
                        value: e,
                        configurable: !0,
                        writable: !0
                    }), e
                },
                set(e) {
                    Object.defineProperty(this, "toString", {
                        value: e,
                        configurable: !0,
                        writable: !0
                    })
                }
            }))
        });

    function ek(e, t) {
        var n;
        return {
            callee: null != (n = null == t ? void 0 : t.callee) ? n : e,
            Err: null == t ? void 0 : t.Err
        }
    }
    let eO = e => {
            let t = (n, r, i, o) => {
                let a = i ? {
                        ...i,
                        async: !1
                    } : {
                        async: !1
                    },
                    u = n._zod.run({
                        value: r,
                        issues: []
                    }, a);
                if (u instanceof Promise) throw new ev;
                if (u.issues.length) {
                    var s, l;
                    let n = new(null != (s = null == o ? void 0 : o.Err) ? s : e)(u.issues.map(e => ei(e, a, e_())));
                    throw N(n, null != (l = null == o ? void 0 : o.callee) ? l : t), n
                }
                return u.value
            };
            return t
        },
        eA = e => {
            let t = async (n, r, i, o) => {
                let a = i ? {
                        ...i,
                        async: !0
                    } : {
                        async: !0
                    },
                    u = n._zod.run({
                        value: r,
                        issues: []
                    }, a);
                if (u instanceof Promise && (u = await u), u.issues.length) {
                    var s, l;
                    let n = new(null != (s = null == o ? void 0 : o.Err) ? s : e)(u.issues.map(e => ei(e, a, e_())));
                    throw N(n, null != (l = null == o ? void 0 : o.callee) ? l : t), n
                }
                return u.value
            };
            return t
        },
        eE = e => (t, n, r) => {
            let i = r ? {
                    ...r,
                    async: !1
                } : {
                    async: !1
                },
                o = t._zod.run({
                    value: n,
                    issues: []
                }, i);
            if (o instanceof Promise) throw new ev;
            return o.issues.length ? eS(e, o.issues, i) : {
                success: !0,
                data: o.value
            }
        };

    function eS(e, t, n) {
        let r;
        return {
            success: !1,
            get error() {
                return r || (r = new e(t.map(e => ei(e, n, e_()))), t = void 0, n = void 0), r
            },
            set error(e) {
                r = e, t = void 0, n = void 0
            }
        }
    }
    let eT = e => async (t, n, r) => {
        let i = r ? {
                ...r,
                async: !0
            } : {
                async: !0
            },
            o = t._zod.run({
                value: n,
                issues: []
            }, i);
        return o instanceof Promise && (o = await o), o.issues.length ? eS(e, o.issues, i) : {
            success: !0,
            data: o.value
        }
    }, ex = Symbol.for("zod.compile.invalid"), eP = Symbol.for("zod.compile.fallback"), ej = async (e, t, n) => {
        let r = n ? {
                ...n,
                async: !0,
                abortEarly: !0
            } : {
                async: !0,
                abortEarly: !0
            },
            i = e._zod.run({
                value: t,
                issues: []
            }, r);
        return i instanceof Promise && (i = await i), 0 === i.issues.length
    }, eC = /^[cC][0-9a-z]{6,}$/, eI = /^[0-9a-z]+$/, e$ = /^[0-7][0-9A-HJKMNP-TV-Za-hjkmnp-tv-z]{25}$/, eR = /^[0-9a-vA-V]{20}$/, eZ = /^[A-Za-z0-9]{27}$/, eD = /^[a-zA-Z0-9_-]{21}$/, eN = /^P(?:(\d+W)|(?!.*W)(?=\d|T\d)(\d+Y)?(\d+M)?(\d+D)?(T(?=\d)(\d+H)?(\d+M)?(\d+([.,]\d+)?S)?)?)$/, eL = /^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})$/, eB = e => e ? RegExp("^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-".concat(e, "[0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12})$")) : /^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-8][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}|00000000-0000-0000-0000-000000000000|ffffffff-ffff-ffff-ffff-ffffffffffff)$/, eJ = /^(?:[A-Za-z0-9_'+\-]+\.)*[A-Za-z0-9_'+\-]*[A-Za-z0-9_+-]@(?:[A-Za-z0-9][A-Za-z0-9\-]*\.)+[A-Za-z]{2,}$/, eU = /^(?:(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])$/, eM = /^(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))$/, eV = /^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\/([0-9]|[1-2][0-9]|3[0-2])$/, eH = /^(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))\/(12[0-8]|1[01][0-9]|[1-9]?[0-9])$/, eK = /^https?$/, eW = /^\+[1-9]\d{6,14}$/, eq = "(?:(?:\\d\\d[2468][048]|\\d\\d[13579][26]|\\d\\d0[48]|[02468][048]00|[13579][26]00)-02-29|\\d{4}-(?:(?:0[13578]|1[02])-(?:0[1-9]|[12]\\d|3[01])|(?:0[469]|11)-(?:0[1-9]|[12]\\d|30)|(?:02)-(?:0[1-9]|1\\d|2[0-8])))", eG = RegExp("^".concat(eq, "$"));

    function eX(e) {
        let t = "(?:[01]\\d|2[0-3]):[0-5]\\d";
        return "number" == typeof e.precision ? -1 === e.precision ? "".concat(t) : 0 === e.precision ? "".concat(t, ":[0-5]\\d") : "".concat(t, ":[0-5]\\d\\.\\d{").concat(e.precision, "}") : e.seconds ? "".concat(t, ":[0-5]\\d(?:\\.\\d+)?") : "".concat(t, "(?::[0-5]\\d(?:\\.\\d+)?)?")
    }
    let eY = /^[\s\S]{0,}$/,
        eQ = /^-?\d+$/,
        e0 = /^-?\d+(?:\.\d+)?$/,
        e1 = /^[^A-Z]*$/,
        e2 = /^[^a-z]*$/,
        e6 = em("$ZodCheck", (e, t) => {
            var n;
            null != e._zod || (e._zod = {}), e._zod.def = t, null != (n = e._zod).onattach || (n.onattach = [])
        }),
        e9 = e => {
            let t = e.value;
            return null != t && void 0 !== t.length
        },
        e3 = em("$ZodCheckMaxLength", (e, t) => {
            var n;
            e6.init(e, t), null != (n = e._zod.def).when || (n.when = e9), e._zod.check = n => {
                let r = n.value,
                    i = r.length;
                if (("string" == typeof r && i > t.maximum ? ea(r) : i) <= t.maximum) return;
                let o = eu(r);
                n.issues.push({
                    origin: o,
                    code: "too_big",
                    maximum: t.maximum,
                    inclusive: !0,
                    input: r,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        e4 = em("$ZodCheckMinLength", (e, t) => {
            var n;
            e6.init(e, t), null != (n = e._zod.def).when || (n.when = e9), e._zod.check = n => {
                let r = n.value,
                    i = r.length;
                if (("string" == typeof r && i >= t.minimum && i < 2 * t.minimum ? ea(r) : i) >= t.minimum) return;
                let o = eu(r);
                n.issues.push({
                    origin: o,
                    code: "too_small",
                    minimum: t.minimum,
                    inclusive: !0,
                    input: r,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        e5 = em("$ZodCheckLengthEquals", (e, t) => {
            var n;
            e6.init(e, t), null != (n = e._zod.def).when || (n.when = e9), e._zod.check = n => {
                let r = n.value,
                    i = r.length,
                    o = "string" == typeof r && i >= t.length && i <= 2 * t.length ? ea(r) : i;
                if (o === t.length) return;
                let a = eu(r),
                    u = o > t.length;
                n.issues.push({
                    origin: a,
                    ...u ? {
                        code: "too_big",
                        maximum: t.length
                    } : {
                        code: "too_small",
                        minimum: t.length
                    },
                    inclusive: !0,
                    exact: !0,
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        e7 = em("$ZodCheckStringFormat", (e, t) => {
            var n, r;
            e6.init(e, t), t.pattern ? null != (n = e._zod).check || (n.check = n => {
                t.pattern.lastIndex = 0, t.pattern.test(n.value) || n.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: t.format,
                    input: n.value,
                    ...t.pattern ? {
                        pattern: t.pattern.toString()
                    } : {},
                    inst: e,
                    continue: !t.abort
                })
            }) : null != (r = e._zod).check || (r.check = () => {})
        }),
        e8 = em("$ZodCheckRegex", (e, t) => {
            e7.init(e, t), e._zod.check = n => {
                t.pattern.lastIndex = 0, t.pattern.test(n.value) || n.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: "regex",
                    input: n.value,
                    pattern: t.pattern.toString(),
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        te = em("$ZodCheckLowerCase", (e, t) => {
            null != t.pattern || (t.pattern = e1), e7.init(e, t)
        }),
        tt = em("$ZodCheckUpperCase", (e, t) => {
            null != t.pattern || (t.pattern = e2), e7.init(e, t)
        }),
        tn = em("$ZodCheckIncludes", (e, t) => {
            e6.init(e, t);
            let n = V(t.includes),
                r = new RegExp("number" == typeof t.position ? "^.{".concat(t.position, ",}").concat(n) : n);
            t.pattern = r, e._zod.check = n => {
                n.value.includes(t.includes, t.position) || n.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: "includes",
                    includes: t.includes,
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tr = em("$ZodCheckStartsWith", (e, t) => {
            e6.init(e, t);
            let n = RegExp("^".concat(V(t.prefix), ".*"));
            null != t.pattern || (t.pattern = n), e._zod.check = n => {
                n.value.startsWith(t.prefix) || n.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: "starts_with",
                    prefix: t.prefix,
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        ti = em("$ZodCheckEndsWith", (e, t) => {
            e6.init(e, t);
            let n = RegExp(".*".concat(V(t.suffix), "$"));
            null != t.pattern || (t.pattern = n), e._zod.check = n => {
                n.value.endsWith(t.suffix) || n.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: "ends_with",
                    suffix: t.suffix,
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        to = em("$ZodCheckOverwrite", (e, t) => {
            e6.init(e, t), e._zod.check = e => {
                e.value = t.tx(e.value)
            }
        });
    class ta {
        indented(e) {
            this.indent += 1;
            try {
                e(this)
            } finally {
                this.indent -= 1
            }
        }
        write(e) {
            if ("function" == typeof e) {
                e(this, {
                    execution: "sync"
                }), e(this, {
                    execution: "async"
                });
                return
            }
            let t = e.split("\n").filter(e => e),
                n = Math.min(...t.map(e => e.length - e.trimStart().length));
            for (let e of t.map(e => e.slice(n)).map(e => " ".repeat(2 * this.indent) + e)) this.content.push(e)
        }
        compile() {
            var e;
            let t = Function,
                n = null != (e = null === this || void 0 === this ? void 0 : this.content) ? e : [""];
            return new t(...Object.keys(this.closed), "return function (".concat(this.args.join(", "), ") {\n").concat(n.join("\n"), "\n};"))(...Object.values(this.closed))
        }
        constructor(e = [], t = {}) {
            this.content = [], this.indent = 0, this.args = e, this.closed = t
        }
    }
    let tu = {
            major: 4,
            minor: 6,
            patch: 5
        },
        ts = em("$ZodType", (e, t) => {
            var n, r;
            null != e || (e = {}), e._zod.def = t, e._zod.bag = e._zod.bag || {}, e._zod.version = tu;
            let i = e._zod.def.checks,
                o = e._zod.traits.has("$ZodCheck") ? [e, ...null != i ? i : []] : (null == i ? void 0 : i.length) ? [...i] : [];
            for (let t of o)
                for (let n of t._zod.onattach) n(e);
            if (0 === o.length) null != (r = e._zod).deferred || (r.deferred = []), null == (n = e._zod.deferred) || n.push(() => {
                e._zod.run = e._zod.parse
            });
            else {
                let t = (t, n, r) => {
                        let i;
                        if (t.memo) return t;
                        let o = ee(t);
                        for (let a of n) {
                            if (a._zod.def.when) {
                                if (function(e) {
                                        var t;
                                        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
                                        if (!0 === e.aborted) return !0;
                                        for (let r = n; r < e.issues.length; r++)
                                            if ((null == (t = e.issues[r]) ? void 0 : t.continue) === !1) return !0;
                                        return !1
                                    }(t) || !a._zod.def.when(t)) continue
                            } else if (o) continue;
                            let n = t.issues.length,
                                u = a._zod.check(t);
                            if (u instanceof Promise && (null == r ? void 0 : r.async) === !1) throw new ev;
                            if (i || u instanceof Promise) i = (null != i ? i : Promise.resolve()).then(async () => {
                                await u, t.issues.length !== n && (er(t.issues, n, e), o || (o = ee(t, n)))
                            });
                            else {
                                if (t.issues.length === n) continue;
                                er(t.issues, n, e), o || (o = ee(t, n))
                            }
                        }
                        return i ? i.then(() => t) : t
                    },
                    n = (n, r, i) => {
                        if (ee(n)) return n.aborted = !0, n;
                        let a = t(r, o, i);
                        if (a instanceof Promise) {
                            if (!1 === i.async) throw new ev;
                            return a.then(t => e._zod.parse(t, i))
                        }
                        return e._zod.parse(a, i)
                    };
                e._zod.run = (r, i) => {
                    if (i.skipChecks) return e._zod.parse(r, i);
                    if ("backward" === i.direction) {
                        let t = e._zod.parse({
                            value: r.value,
                            issues: []
                        }, {
                            ...i,
                            skipChecks: !0
                        });
                        return t instanceof Promise ? t.then(e => n(e, r, i)) : n(t, r, i)
                    }
                    let a = e._zod.parse(r, i);
                    if (a instanceof Promise) {
                        if (!1 === i.async) throw new ev;
                        return a.then(e => t(e, o, i))
                    }
                    return t(a, o, i)
                }
            }
        }, {
            get "~standard"() {
                return el(this, "~standard", td(this), !1)
            },
            set "~standard"(e) {
                el(this, "~standard", e)
            }
        }),
        tl = (e, t) => e.issues.length ? {
            issues: e.issues.map(e => ei(e, t, e_()))
        } : {
            value: e.value
        };
    async function tc(e, t) {
        let n = {
            async: !0
        };
        return tl(await e._zod.run({
            value: t,
            issues: []
        }, n), n)
    }

    function td(e) {
        return {
            validate: t => {
                let n = {
                    async: !1
                };
                try {
                    let r = e._zod.run({
                        value: t,
                        issues: []
                    }, n);
                    if (!(r instanceof Promise)) return tl(r, n)
                } catch (e) {}
                return tc(e, t)
            },
            vendor: "zod",
            version: 1
        }
    }
    let tf = em("$ZodString", (e, t) => {
            var n;
            ts.init(e, t), e._zod.pattern = null != (n = t.pattern) ? n : eY, e._zod.parse = (n, r) => {
                if (t.coerce) try {
                    n.value = String(n.value)
                } catch (e) {}
                return "string" == typeof n.value || n.issues.push({
                    expected: "string",
                    code: "invalid_type",
                    input: n.value,
                    inst: e
                }), n
            }
        }),
        tp = em("$ZodStringFormat", (e, t) => {
            e7.init(e, t), tf.init(e, t)
        }),
        th = em("$ZodGUID", (e, t) => {
            null != t.pattern || (t.pattern = eL), tp.init(e, t)
        }),
        tm = em("$ZodUUID", (e, t) => {
            if (t.version) {
                let e = {
                    v1: 1,
                    v2: 2,
                    v3: 3,
                    v4: 4,
                    v5: 5,
                    v6: 6,
                    v7: 7,
                    v8: 8
                } [t.version];
                if (void 0 === e) throw Error('Invalid UUID version: "'.concat(t.version, '"'));
                null != t.pattern || (t.pattern = eB(e))
            } else null != t.pattern || (t.pattern = eB());
            tp.init(e, t)
        }),
        tv = em("$ZodEmail", (e, t) => {
            null != t.pattern || (t.pattern = eJ), tp.init(e, t)
        });

    function ty(e) {
        try {
            if ("u" > typeof URL && "function" == typeof URL.canParse) return URL.canParse(e);
            return new URL(e), !0
        } catch (e) {
            return !1
        }
    }
    let tg = /[\t\n\r]/g;

    function t_(e) {
        return e.replace(tg, "")
    }
    let tb = em("$ZodURL", (e, t) => {
            tp.init(e, t), e._zod.check = n => {
                try {
                    var r, i;
                    let o = n.value.trim(),
                        a = "normalize" in t || "hostname" in t || "protocol" in t ? function(e, t) {
                            var n, r;
                            if (!t.normalize && (null == (n = t.protocol) ? void 0 : n.source) === eK.source && !/^https?:\/\//i.test(e)) return 1;
                            try {
                                if ("u" > typeof URL) {
                                    let t = URL;
                                    if ("function" == typeof t.parse) return null != (r = t.parse(e)) ? r : 2
                                }
                                return new URL(e)
                            } catch (e) {
                                return 2
                            }
                        }(o, t) : ty(o) || 2;
                    if (1 === a) return void n.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid URL format",
                        input: n.value,
                        inst: e,
                        continue: !t.abort
                    });
                    if (2 === a) return void n.issues.push({
                        code: "invalid_format",
                        format: "url",
                        input: n.value,
                        inst: e,
                        continue: !t.abort
                    });
                    if (!0 === a) {
                        n.value = t_(o);
                        return
                    }
                    t.hostname && ((r = t.hostname).lastIndex = 0, !r.test(a.hostname)) && n.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid hostname",
                        pattern: t.hostname.source,
                        input: n.value,
                        inst: e,
                        continue: !t.abort
                    }), t.protocol && ((i = t.protocol).lastIndex = 0, !i.test(a.protocol.endsWith(":") ? a.protocol.slice(0, -1) : a.protocol)) && n.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid protocol",
                        pattern: t.protocol.source,
                        input: n.value,
                        inst: e,
                        continue: !t.abort
                    }), n.value = t.normalize ? a.href : t_(o);
                    return
                } catch (r) {
                    n.issues.push({
                        code: "invalid_format",
                        format: "url",
                        input: n.value,
                        inst: e,
                        continue: !t.abort
                    })
                }
            }
        }),
        tF = em("$ZodEmoji", (e, t) => {
            null != t.pattern || (t.pattern = RegExp("^(?=[\\s\\S]*[\\u00A9\\u00AE\\u203C\\u2049\\u2122\\u2139\\u2194-\\u2199\\u21A9-\\u21AA\\u231A-\\u231B\\u2328\\u23CF\\u23E9-\\u23F3\\u23F8-\\u23FA\\u24C2\\u25AA-\\u25AB\\u25B6\\u25C0\\u25FB-\\u25FE\\u2600-\\u2604\\u260E\\u2611\\u2614-\\u2615\\u2618\\u261D\\u2620\\u2622-\\u2623\\u2626\\u262A\\u262E-\\u262F\\u2638-\\u263A\\u2640\\u2642\\u2648-\\u2653\\u265F-\\u2660\\u2663\\u2665-\\u2666\\u2668\\u267B\\u267E-\\u267F\\u2692-\\u2697\\u2699\\u269B-\\u269C\\u26A0-\\u26A1\\u26A7\\u26AA-\\u26AB\\u26B0-\\u26B1\\u26BD-\\u26BE\\u26C4-\\u26C5\\u26C8\\u26CE-\\u26CF\\u26D1\\u26D3-\\u26D4\\u26E9-\\u26EA\\u26F0-\\u26F5\\u26F7-\\u26FA\\u26FD\\u2702\\u2705\\u2708-\\u270D\\u270F\\u2712\\u2714\\u2716\\u271D\\u2721\\u2728\\u2733-\\u2734\\u2744\\u2747\\u274C\\u274E\\u2753-\\u2755\\u2757\\u2763-\\u2764\\u2795-\\u2797\\u27A1\\u27B0\\u27BF\\u2934-\\u2935\\u2B05-\\u2B07\\u2B1B-\\u2B1C\\u2B50\\u2B55\\u3030\\u303D\\u3297\\u3299\\u{1F004}\\u{1F02C}-\\u{1F02F}\\u{1F094}-\\u{1F09F}\\u{1F0AF}-\\u{1F0B0}\\u{1F0C0}\\u{1F0CF}-\\u{1F0D0}\\u{1F0F6}-\\u{1F0FF}\\u{1F170}-\\u{1F171}\\u{1F17E}-\\u{1F17F}\\u{1F18E}\\u{1F191}-\\u{1F19A}\\u{1F1AE}-\\u{1F1E5}\\u{1F201}-\\u{1F20F}\\u{1F21A}\\u{1F22F}\\u{1F232}-\\u{1F23A}\\u{1F23C}-\\u{1F23F}\\u{1F249}-\\u{1F25F}\\u{1F266}-\\u{1F321}\\u{1F324}-\\u{1F393}\\u{1F396}-\\u{1F397}\\u{1F399}-\\u{1F39B}\\u{1F39E}-\\u{1F3F0}\\u{1F3F3}-\\u{1F3F5}\\u{1F3F7}-\\u{1F3FA}\\u{1F400}-\\u{1F4FD}\\u{1F4FF}-\\u{1F53D}\\u{1F549}-\\u{1F54E}\\u{1F550}-\\u{1F567}\\u{1F56F}-\\u{1F570}\\u{1F573}-\\u{1F57A}\\u{1F587}\\u{1F58A}-\\u{1F58D}\\u{1F590}\\u{1F595}-\\u{1F596}\\u{1F5A4}-\\u{1F5A5}\\u{1F5A8}\\u{1F5B1}-\\u{1F5B2}\\u{1F5BC}\\u{1F5C2}-\\u{1F5C4}\\u{1F5D1}-\\u{1F5D3}\\u{1F5DC}-\\u{1F5DE}\\u{1F5E1}\\u{1F5E3}\\u{1F5E8}\\u{1F5EF}\\u{1F5F3}\\u{1F5FA}-\\u{1F64F}\\u{1F680}-\\u{1F6C5}\\u{1F6CB}-\\u{1F6D2}\\u{1F6D5}-\\u{1F6E5}\\u{1F6E9}\\u{1F6EB}-\\u{1F6F0}\\u{1F6F3}-\\u{1F6FF}\\u{1F7DA}-\\u{1F7FF}\\u{1F80C}-\\u{1F80F}\\u{1F848}-\\u{1F84F}\\u{1F85A}-\\u{1F85F}\\u{1F888}-\\u{1F88F}\\u{1F8AE}-\\u{1F8AF}\\u{1F8BC}-\\u{1F8BF}\\u{1F8C2}-\\u{1F8CF}\\u{1F8D9}-\\u{1F8FF}\\u{1F90C}-\\u{1F93A}\\u{1F93C}-\\u{1F945}\\u{1F947}-\\u{1F9FF}\\u{1FA58}-\\u{1FA5F}\\u{1FA6E}-\\u{1FAFF}\\u{1FC00}-\\u{1FFFD}\\u{1F1E6}-\\u{1F1FF}\\u20E3])[\\u00A9\\u00AE\\u203C\\u2049\\u2122\\u2139\\u2194-\\u2199\\u21A9-\\u21AA\\u231A-\\u231B\\u2328\\u23CF\\u23E9-\\u23F3\\u23F8-\\u23FA\\u24C2\\u25AA-\\u25AB\\u25B6\\u25C0\\u25FB-\\u25FE\\u2600-\\u2604\\u260E\\u2611\\u2614-\\u2615\\u2618\\u261D\\u2620\\u2622-\\u2623\\u2626\\u262A\\u262E-\\u262F\\u2638-\\u263A\\u2640\\u2642\\u2648-\\u2653\\u265F-\\u2660\\u2663\\u2665-\\u2666\\u2668\\u267B\\u267E-\\u267F\\u2692-\\u2697\\u2699\\u269B-\\u269C\\u26A0-\\u26A1\\u26A7\\u26AA-\\u26AB\\u26B0-\\u26B1\\u26BD-\\u26BE\\u26C4-\\u26C5\\u26C8\\u26CE-\\u26CF\\u26D1\\u26D3-\\u26D4\\u26E9-\\u26EA\\u26F0-\\u26F5\\u26F7-\\u26FA\\u26FD\\u2702\\u2705\\u2708-\\u270D\\u270F\\u2712\\u2714\\u2716\\u271D\\u2721\\u2728\\u2733-\\u2734\\u2744\\u2747\\u274C\\u274E\\u2753-\\u2755\\u2757\\u2763-\\u2764\\u2795-\\u2797\\u27A1\\u27B0\\u27BF\\u2934-\\u2935\\u2B05-\\u2B07\\u2B1B-\\u2B1C\\u2B50\\u2B55\\u3030\\u303D\\u3297\\u3299\\u{1F004}\\u{1F02C}-\\u{1F02F}\\u{1F094}-\\u{1F09F}\\u{1F0AF}-\\u{1F0B0}\\u{1F0C0}\\u{1F0CF}-\\u{1F0D0}\\u{1F0F6}-\\u{1F0FF}\\u{1F170}-\\u{1F171}\\u{1F17E}-\\u{1F17F}\\u{1F18E}\\u{1F191}-\\u{1F19A}\\u{1F1AE}-\\u{1F1E5}\\u{1F201}-\\u{1F20F}\\u{1F21A}\\u{1F22F}\\u{1F232}-\\u{1F23A}\\u{1F23C}-\\u{1F23F}\\u{1F249}-\\u{1F25F}\\u{1F266}-\\u{1F321}\\u{1F324}-\\u{1F393}\\u{1F396}-\\u{1F397}\\u{1F399}-\\u{1F39B}\\u{1F39E}-\\u{1F3F0}\\u{1F3F3}-\\u{1F3F5}\\u{1F3F7}-\\u{1F3FA}\\u{1F400}-\\u{1F4FD}\\u{1F4FF}-\\u{1F53D}\\u{1F549}-\\u{1F54E}\\u{1F550}-\\u{1F567}\\u{1F56F}-\\u{1F570}\\u{1F573}-\\u{1F57A}\\u{1F587}\\u{1F58A}-\\u{1F58D}\\u{1F590}\\u{1F595}-\\u{1F596}\\u{1F5A4}-\\u{1F5A5}\\u{1F5A8}\\u{1F5B1}-\\u{1F5B2}\\u{1F5BC}\\u{1F5C2}-\\u{1F5C4}\\u{1F5D1}-\\u{1F5D3}\\u{1F5DC}-\\u{1F5DE}\\u{1F5E1}\\u{1F5E3}\\u{1F5E8}\\u{1F5EF}\\u{1F5F3}\\u{1F5FA}-\\u{1F64F}\\u{1F680}-\\u{1F6C5}\\u{1F6CB}-\\u{1F6D2}\\u{1F6D5}-\\u{1F6E5}\\u{1F6E9}\\u{1F6EB}-\\u{1F6F0}\\u{1F6F3}-\\u{1F6FF}\\u{1F7DA}-\\u{1F7FF}\\u{1F80C}-\\u{1F80F}\\u{1F848}-\\u{1F84F}\\u{1F85A}-\\u{1F85F}\\u{1F888}-\\u{1F88F}\\u{1F8AE}-\\u{1F8AF}\\u{1F8BC}-\\u{1F8BF}\\u{1F8C2}-\\u{1F8CF}\\u{1F8D9}-\\u{1F8FF}\\u{1F90C}-\\u{1F93A}\\u{1F93C}-\\u{1F945}\\u{1F947}-\\u{1F9FF}\\u{1FA58}-\\u{1FA5F}\\u{1FA6E}-\\u{1FAFF}\\u{1FC00}-\\u{1FFFD}\\u0023\\u002A\\u0030-\\u0039\\u200D\\u20E3\\uFE0F\\u{1F1E6}-\\u{1F1FF}\\u{1F3FB}-\\u{1F3FF}\\u{1F9B0}-\\u{1F9B3}\\u{E0020}-\\u{E007F}]+$", "u")), tp.init(e, t)
        }),
        tw = em("$ZodNanoID", (e, t) => {
            var n;
            if (void 0 !== t.length && (!Number.isInteger(t.length) || t.length < 1)) throw Error("Invalid nanoid length: ".concat(t.length));
            null != t.pattern || (t.pattern = void 0 === t.length ? eD : (n = t.length, RegExp("^[a-zA-Z0-9_-]{".concat(n, "}$")))), tp.init(e, t)
        }),
        tz = em("$ZodCUID", (e, t) => {
            null != t.pattern || (t.pattern = eC), tp.init(e, t)
        }),
        tk = em("$ZodCUID2", (e, t) => {
            null != t.pattern || (t.pattern = eI), tp.init(e, t)
        }),
        tO = em("$ZodULID", (e, t) => {
            null != t.pattern || (t.pattern = e$), tp.init(e, t)
        }),
        tA = em("$ZodXID", (e, t) => {
            null != t.pattern || (t.pattern = eR), tp.init(e, t)
        }),
        tE = em("$ZodKSUID", (e, t) => {
            null != t.pattern || (t.pattern = eZ), tp.init(e, t)
        }),
        tS = em("$ZodISODateTime", (e, t) => {
            let n, r, i;
            null != t.pattern || (n = ["Z"], t.offset && n.push("([+-](?:[01]\\d|2[0-3]):[0-5]\\d)"), r = "".concat(eX({
                precision: t.precision,
                seconds: !0
            }), "(?:").concat(n.join("|"), ")"), i = t.local ? "".concat(r, "|").concat(eX({
                precision: t.precision
            })) : r, t.pattern = RegExp("^".concat(eq, "T(?:").concat(i, ")$"))), tp.init(e, t)
        }),
        tT = em("$ZodISODate", (e, t) => {
            null != t.pattern || (t.pattern = eG), tp.init(e, t)
        }),
        tx = em("$ZodISOTime", (e, t) => {
            null != t.pattern || (t.pattern = RegExp("^".concat(eX(t), "$"))), tp.init(e, t)
        }),
        tP = em("$ZodISODuration", (e, t) => {
            null != t.pattern || (t.pattern = eN), tp.init(e, t)
        }),
        tj = em("$ZodIPv4", (e, t) => {
            null != t.pattern || (t.pattern = eU), tp.init(e, t)
        }),
        tC = /^[0-9a-fA-F:.]+$/;

    function tI(e) {
        return !!tC.test(e) && ty("http://[".concat(e, "]"))
    }
    let t$ = em("$ZodIPv6", (e, t) => {
            null != t.pattern || (t.pattern = eM), tp.init(e, t), e._zod.check = n => {
                tI(n.value) || n.issues.push({
                    code: "invalid_format",
                    format: "ipv6",
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tR = em("$ZodCIDRv4", (e, t) => {
            null != t.pattern || (t.pattern = eV), tp.init(e, t)
        }),
        tZ = em("$ZodCIDRv6", (e, t) => {
            null != t.pattern || (t.pattern = eH), tp.init(e, t), e._zod.check = n => {
                ! function(e) {
                    let t = e.split("/");
                    if (2 !== t.length) return !1;
                    let [n, r] = t;
                    if (!r) return !1;
                    let i = Number(r);
                    return "".concat(i) === r && !(i < 0) && !(i > 128) && tI(n)
                }(n.value) && n.issues.push({
                    code: "invalid_format",
                    format: "cidrv6",
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        });

    function tD(e) {
        if ("" === e) return !0;
        if (/\s/.test(e) || e.length % 4 != 0) return !1;
        try {
            return atob(e), !0
        } catch (e) {
            return !1
        }
    }
    let tN = /^[0-9a-zA-Z+/]*={0,2}$/,
        tL = em("$ZodBase64", (e, t) => {
            null != t.pattern || (t.pattern = tN), tp.init(e, t), e._zod.check = n => {
                tD(n.value) || n.issues.push({
                    code: "invalid_format",
                    format: "base64",
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tB = /^[A-Za-z0-9_-]*$/,
        tJ = em("$ZodBase64URL", (e, t) => {
            null != t.pattern || (t.pattern = tB), tp.init(e, t), e._zod.check = n => {
                ! function(e) {
                    if (!tB.test(e)) return !1;
                    let t = e.replace(/[-_]/g, e => "-" === e ? "+" : "/");
                    return tD(t.padEnd(4 * Math.ceil(t.length / 4), "="))
                }(n.value) && n.issues.push({
                    code: "invalid_format",
                    format: "base64url",
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tU = em("$ZodE164", (e, t) => {
            null != t.pattern || (t.pattern = eW), tp.init(e, t)
        }),
        tM = em("$ZodJWT", (e, t) => {
            tp.init(e, t), e._zod.check = n => {
                ! function(e) {
                    let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null;
                    try {
                        let n = e.split(".");
                        if (3 !== n.length) return !1;
                        let [r] = n;
                        if (!r) return !1;
                        let i = JSON.parse(atob(r));
                        if ("typ" in i && (null == i ? void 0 : i.typ) !== "JWT" || !i.alg || t && (!("alg" in i) || i.alg !== t)) return !1;
                        return !0
                    } catch (e) {
                        return !1
                    }
                }(n.value, t.alg) && n.issues.push({
                    code: "invalid_format",
                    format: "jwt",
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tV = em("$ZodUnknown", (e, t) => {
            ts.init(e, t), e._zod.parse = e => e
        }),
        tH = em("$ZodNever", (e, t) => {
            ts.init(e, t), e._zod.parse = (t, n) => (t.issues.push({
                expected: "never",
                code: "invalid_type",
                input: t.value,
                inst: e
            }), t)
        });

    function tK(e, t, n) {
        e.issues.length && t.issues.push(...et(n, e.issues)), t.value[n] = e.value
    }
    let tW = em("$ZodArray", (e, t) => {
        ts.init(e, t);
        let n = eg.memoizer;
        null == n || n.attach(e), e._zod.parse = (r, i) => {
            let o = r.value;
            if (!Array.isArray(o)) return r.issues.push({
                expected: "array",
                code: "invalid_type",
                input: o,
                inst: e
            }), r;
            r.value = n ? n.alloc(e, r, Array(o.length), i) : Array(o.length);
            let a = [],
                u = null == i ? void 0 : i.abortEarly;
            for (let e = 0; e < o.length; e++) {
                let n = o[e],
                    s = t.element._zod.run({
                        value: n,
                        issues: []
                    }, i);
                if (s instanceof Promise) a.push(s.then(t => tK(t, r, e)));
                else if (tK(s, r, e), u && 0 !== s.issues.length && ee(s)) break
            }
            return a.length ? Promise.all(a).then(() => r) : r
        }
    });

    function tq(e, t, n, r, i, o) {
        let a = n in r,
            u = "optional" === o;
        if (a || !u || "optional" !== i) {
            if (e.issues.length) {
                if (void 0 !== i && u && !a) return;
                t.issues.push(...et(n, e.issues))
            }
            if (!a && void 0 === i) {
                e.issues.length || t.issues.push({
                    code: "invalid_type",
                    expected: "nonoptional",
                    input: void 0,
                    path: [n]
                });
                return
            }
            void 0 === e.value ? (a || "defaulted" === i && !u) && (t.value[n] = void 0) : t.value[n] = e.value
        }
    }
    let tG = [];

    function tX(e) {
        var t, n, r, i, o;
        let a = Object.keys(e.shape),
            u = Object.getOwnPropertySymbols(e.shape),
            s = u.length ? u : tG,
            l = s.length ? [...a, ...s] : a;
        for (let o of l)
            if (!(null == (i = e.shape) || null == (r = i[o]) || null == (n = r._zod) || null == (t = n.traits) ? void 0 : t.has("$ZodType"))) throw Error('Invalid element at key "'.concat(String(o), '": expected a Zod schema'));
        let c = Object.keys(o = e.shape).filter(e => void 0 !== o[e]._zod.optin && "optional" === o[e]._zod.optout);
        return {
            ...e,
            allKeys: l,
            symbolKeys: s,
            keySet: new Set(a),
            numKeys: a.length,
            optionalKeys: new Set(c)
        }
    }

    function tY(e, t, n, r, i, o, a) {
        let u = [],
            s = i.keySet,
            l = i.catchall._zod,
            c = l.def.type,
            d = l.optin,
            f = l.optout,
            p = 0;
        for (let i in t) {
            if (a && n.issues.length !== p) {
                if (ee(n, p)) break;
                p = n.issues.length
            }
            if (s.has(i)) continue;
            if ("__proto__" === i) {
                "never" === c && u.push(i);
                continue
            }
            if ("never" === c) {
                u.push(i);
                continue
            }
            let o = l.run({
                value: t[i],
                issues: []
            }, r);
            o instanceof Promise ? e.push(o.then(e => tq(e, n, i, t, d, f))) : tq(o, n, i, t, d, f)
        }
        return (u.length && n.issues.push({
            code: "unrecognized_keys",
            keys: u,
            input: t,
            inst: o,
            continue: !0
        }), e.length) ? Promise.all(e).then(() => n) : n
    }
    let tQ = em("$ZodObject", (e, t) => {
            var n;
            let r;
            ts.init(e, t);
            let i = Object.getOwnPropertyDescriptor(t, "shape"),
                o = (null == i ? void 0 : i.get) ? i.get.raw : null != (n = t.shape) ? n : {};
            if (o) {
                let e = () => {
                    let n = {
                        ...o
                    };
                    return Object.defineProperty(t, "shape", {
                        value: n
                    }), e.raw = n, n
                };
                e.raw = o, Object.defineProperty(t, "shape", {
                    get: e
                })
            }
            let a = new x(() => tX(t));
            ef(e, "propValues", e => {
                let t = e.def.shape,
                    n = {};
                for (let e in t) {
                    let r = t[e]._zod;
                    if (r.values) {
                        for (let t of (Object.prototype.hasOwnProperty.call(n, e) || j(n, e, new Set), r.values)) n[e].add(t);
                        void 0 !== r.optin && n[e].add(void 0)
                    }
                }
                return n
            });
            let u = t.catchall,
                s = eg.memoizer;
            null == s || s.attach(e), e._zod.parse = (t, n) => {
                null != r || (r = a.value);
                let i = t.value;
                if (!L(i)) return t.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: i,
                    inst: e
                }), t;
                t.value = s ? s.alloc(e, t, {}, n) : {};
                let o = [],
                    l = r.shape,
                    c = null == n ? void 0 : n.abortEarly,
                    d = t.issues.length;
                for (let e of r.allKeys) {
                    if (c && t.issues.length !== d) {
                        if (ee(t, d)) break;
                        d = t.issues.length
                    }
                    if ("__proto__" === e) continue;
                    let r = l[e],
                        a = r._zod.optin,
                        u = r._zod.optout,
                        s = r._zod.run({
                            value: i[e],
                            issues: []
                        }, n);
                    s instanceof Promise ? o.push(s.then(n => tq(n, t, e, i, a, u))) : tq(s, t, e, i, a, u)
                }
                return u ? tY(o, i, t, n, a.value, e, !0 === c) : o.length ? Promise.all(o).then(() => t) : t
            }
        }),
        t0 = em("$ZodObjectJIT", (e, t) => {
            let n, r;
            tQ.init(e, t);
            let i = e._zod.parse,
                o = new x(() => tX(t)),
                a = eg.memoizer,
                u = !eg.jitless,
                s = u && B.value,
                l = t.catchall;
            e._zod.parse = (c, d) => {
                null != r || (r = o.value);
                let f = c.value;
                return L(f) ? u && s && (null == d ? void 0 : d.async) === !1 && !0 !== d.jitless ? (n || (n = (t => {
                    let n = o.value,
                        r = n.symbolKeys,
                        i = new ta(["payload", "ctx"], {
                            shape: t,
                            inst: e,
                            memo: a,
                            syms: r
                        }),
                        u = e => "shape[".concat(e, "]._zod.run({ value: input[").concat(e, "], issues: [] }, ctx)"),
                        s = (e, t) => "\n          let ".concat(e, "_ab = false;\n          for (let i = 0; i < ").concat(e, ".issues.length; i++) {\n            const iss = ").concat(e, ".issues[i];\n            iss.path = iss.path ? [").concat(t, ", ...iss.path] : [").concat(t, "];\n            payload.issues.push(iss);\n            if (iss.continue !== true) ").concat(e, "_ab = true;\n          }\n          if (").concat(e, "_ab && ctx && ctx.abortEarly) {\n            payload.value = newResult;\n            return payload;\n          }");
                    i.write("const input = payload.value;");
                    let l = Object.create(null),
                        c = 0;
                    for (let e of n.allKeys) l[e] = "key_".concat(c++);
                    for (let e of (i.write(a ? "const newResult = memo.alloc(inst, payload, {}, ctx);" : "const newResult = {};"), n.allKeys)) {
                        var d, f;
                        if ("__proto__" === e) continue;
                        let n = l[e],
                            o = "symbol" == typeof e ? "syms[".concat(r.indexOf(e), "]") : JSON.stringify(e),
                            a = "".concat(o, " in input"),
                            c = t[e],
                            p = null == c || null == (d = c._zod) ? void 0 : d.optin,
                            h = void 0 !== p,
                            m = (null == c || null == (f = c._zod) ? void 0 : f.optout) === "optional";
                        if (i.write("const ".concat(n, " = ").concat(u(o), ";")), h && m) {
                            let e = "optional" === p ? "".concat(n, "_present") : "".concat(n, ".value !== undefined || ").concat(n, "_present");
                            i.write("\n        const ".concat(n, "_present = ").concat(a, ";\n        if (!").concat(n, ".issues.length || ").concat(n, "_present) {\n          if (").concat(n, ".issues.length) {").concat(s(n, o), "\n          }\n\n          if (").concat(e, ") {\n            newResult[").concat(o, "] = ").concat(n, ".value;\n          }\n        }\n\n      "))
                        } else h ? (i.write("\n        if (".concat(n, ".issues.length) {").concat(s(n, o), "\n        }\n      ")), "defaulted" === p ? i.write("newResult[".concat(o, "] = ").concat(n, ".value;")) : i.write("\n        if (".concat(n, ".value !== undefined || ").concat(a, ") {\n          newResult[").concat(o, "] = ").concat(n, ".value;\n        }\n      "))) : i.write("\n        const ".concat(n, "_present = ").concat(a, ";\n        if (").concat(n, ".issues.length) {").concat(s(n, o), "\n        }\n        if (!").concat(n, "_present && !").concat(n, '.issues.length) {\n          payload.issues.push({\n            code: "invalid_type",\n            expected: "nonoptional",\n            input: undefined,\n            path: [').concat(o, "]\n          });\n          if (ctx && ctx.abortEarly) {\n            payload.value = newResult;\n            return payload;\n          }\n        }\n\n        if (").concat(n, "_present) {\n          newResult[").concat(o, "] = ").concat(n, ".value;\n        }\n\n      "))
                    }
                    return i.write("payload.value = newResult;"), i.write("return payload;"), i.compile()
                })(t.shape)), c = n(c, d), l) ? tY([], f, c, d, r, e, (null == d ? void 0 : d.abortEarly) === !0) : c : i(c, d) : (c.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: f,
                    inst: e
                }), c)
            }
        });

    function t1(e, t, n, r) {
        for (let n of e)
            if (0 === n.issues.length) return t.value = n.value, t;
        let i = e.filter(e => !ee(e));
        return 1 === i.length ? (t.value = i[0].value, i[0]) : (t.issues.push({
            code: "invalid_union",
            input: t.value,
            inst: n,
            errors: e.map(e => e.issues.map(e => ei(e, r, e_())))
        }), t)
    }
    let t2 = em("$ZodUnion", (e, t) => {
            ts.init(e, t), ef(e, "optin", e => e.def.options.some(e => "defaulted" === e._zod.optin) ? "defaulted" : e.def.options.some(e => void 0 !== e._zod.optin) ? "optional" : void 0), ef(e, "optout", e => e.def.options.some(e => "optional" === e._zod.optout) ? "optional" : void 0), ef(e, "values", e => {
                if (e.def.options.every(e => e._zod.values)) return new Set(e.def.options.flatMap(e => Array.from(e._zod.values)))
            }), ef(e, "pattern", e => {
                if (e.def.options.every(e => e._zod.pattern)) {
                    let t = e.def.options.map(e => e._zod.pattern);
                    return RegExp("^(".concat(t.map(e => P(e.source)).join("|"), ")$"))
                }
            });
            let n = 1 === t.options.length ? t.options[0]._zod.run : null;
            e._zod.parse = (r, i) => {
                if (n) return n(r, i);
                let o = !1,
                    a = [];
                for (let e of t.options) {
                    let t = e._zod.run({
                        value: r.value,
                        issues: []
                    }, i);
                    if (t instanceof Promise) a.push(t), o = !0;
                    else {
                        if (0 === t.issues.length) return t;
                        a.push(t)
                    }
                }
                return o ? Promise.all(a).then(t => t1(t, r, e, i)) : t1(a, r, e, i)
            }
        }),
        t6 = em("$ZodIntersection", (e, t) => {
            ts.init(e, t), e._zod.parse = (e, n) => {
                let r = e.value,
                    i = t.left._zod.run({
                        value: r,
                        issues: []
                    }, n),
                    o = t.right._zod.run({
                        value: r,
                        issues: []
                    }, n);
                return i instanceof Promise || o instanceof Promise ? Promise.all([i, o]).then(t => {
                    let [n, r] = t;
                    return t9(e, n, r)
                }) : t9(e, i, o)
            }
        });

    function t9(e, t, n) {
        let r, i = new Map,
            o = new Map,
            a = (e, t) => {
                var n, a;
                let u;
                if ("unrecognized_keys" !== e.code || (null == (n = e.path) ? void 0 : n.length))
                    if ("invalid_key" !== e.code || "record" !== e.origin || (null == (a = e.path) ? void 0 : a.length) !== 1) return !1;
                    else {
                        let t = String(e.path[0]);
                        o.has(t) || o.set(t, e), u = [t]
                    }
                else null != r || (r = e), u = e.keys;
                for (let e of u) i.has(e) || i.set(e, {}), i.get(e)[t] = !0;
                return !0
            };
        for (let n of t.issues) a(n, "l") || e.issues.push(n);
        for (let t of n.issues) a(t, "r") || e.issues.push(t);
        let u = [...i].filter(e => {
            let [, t] = e;
            return t.l && t.r
        }).map(e => {
            let [t] = e;
            return t
        });
        if (u.length) {
            let t = r ? u.filter(e => r.keys.includes(e)) : [];
            for (let n of (t.length && e.issues.push({
                    ...r,
                    keys: t
                }), u)) !t.includes(n) && o.has(n) && e.issues.push(o.get(n))
        }
        let s = function e(t, n) {
            if (t === n || t instanceof Date && n instanceof Date && +t == +n) return {
                valid: !0,
                data: t
            };
            if (J(t) && J(n)) {
                let r = Object.keys(n),
                    i = Object.keys(t).filter(e => -1 !== r.indexOf(e)),
                    o = {
                        ...t,
                        ...n
                    };
                for (let r of (Object.prototype.hasOwnProperty.call(o, "__proto__") && delete o.__proto__, i)) {
                    if ("__proto__" === r) continue;
                    let i = e(t[r], n[r]);
                    if (!i.valid) return {
                        valid: !1,
                        mergeErrorPath: [r, ...i.mergeErrorPath]
                    };
                    o[r] = i.data
                }
                return {
                    valid: !0,
                    data: o
                }
            }
            if (Array.isArray(t) && Array.isArray(n)) {
                if (t.length !== n.length) return {
                    valid: !1,
                    mergeErrorPath: []
                };
                let r = [];
                for (let i = 0; i < t.length; i++) {
                    let o = e(t[i], n[i]);
                    if (!o.valid) return {
                        valid: !1,
                        mergeErrorPath: [i, ...o.mergeErrorPath]
                    };
                    r.push(o.data)
                }
                return {
                    valid: !0,
                    data: r
                }
            }
            return {
                valid: !1,
                mergeErrorPath: []
            }
        }(t.value, n.value);
        if (!s.valid) {
            if (ee(e)) return e;
            throw Error("Unmergable intersection. Error path: ".concat(JSON.stringify(s.mergeErrorPath)))
        }
        return e.value = s.data, e
    }
    let t3 = em("$ZodRecord", (e, t) => {
            ts.init(e, t);
            let n = eg.memoizer;
            null == n || n.attach(e), e._zod.parse = (r, i) => {
                let o = r.value;
                if (!J(o)) return r.issues.push({
                    expected: "record",
                    code: "invalid_type",
                    input: o,
                    inst: e
                }), r;
                let a = [],
                    u = t.keyType._zod.values;
                if (u && !t.partial) {
                    let s;
                    r.value = n ? n.alloc(e, r, {}, i) : {};
                    let l = new Set;
                    for (let n of u)
                        if ("string" == typeof n || "number" == typeof n || "symbol" == typeof n) {
                            if (l.add("number" == typeof n ? n.toString() : n), "__proto__" === n) continue;
                            let u = t.keyType._zod.run({
                                value: n,
                                issues: []
                            }, i);
                            if (u instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                            if (u.issues.length) {
                                r.issues.push({
                                    code: "invalid_key",
                                    origin: "record",
                                    issues: u.issues.map(e => ei(e, i, e_())),
                                    input: n,
                                    path: [n],
                                    inst: e
                                });
                                continue
                            }
                            let s = u.value;
                            if ("__proto__" === s) continue;
                            let c = t.valueType._zod.run({
                                value: o[n],
                                issues: []
                            }, i);
                            c instanceof Promise ? a.push(c.then(e => {
                                e.issues.length && r.issues.push(...et(n, e.issues)), r.value[s] = e.value
                            })) : (c.issues.length && r.issues.push(...et(n, c.issues)), r.value[s] = c.value)
                        } for (let e in o)
                        if (!l.has(e))
                            if ("loose" === t.mode) {
                                if ("__proto__" === e) continue;
                                r.value[e] = o[e]
                            } else(s = null != s ? s : []).push(e);
                    s && s.length > 0 && r.issues.push({
                        code: "unrecognized_keys",
                        input: o,
                        inst: e,
                        keys: s,
                        continue: !0
                    })
                } else {
                    let s;
                    for (let l of (r.value = n ? n.alloc(e, r, {}, i) : {}, Reflect.ownKeys(o))) {
                        if ("__proto__" === l || !Object.prototype.propertyIsEnumerable.call(o, l)) continue;
                        let n = t.keyType._zod.run({
                            value: l,
                            issues: []
                        }, i);
                        if (n instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                        if ("string" == typeof l && e0.test(l) && n.issues.length) {
                            let e = t.keyType._zod.run({
                                value: Number(l),
                                issues: []
                            }, i);
                            if (e instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                            0 === e.issues.length && (n = e)
                        }
                        if (n.issues.length) {
                            "loose" === t.mode ? r.value[l] = o[l] : u ? (s = null != s ? s : []).push(l) : r.issues.push({
                                code: "invalid_key",
                                origin: "record",
                                issues: n.issues.map(e => ei(e, i, e_())),
                                input: l,
                                path: [l],
                                inst: e
                            });
                            continue
                        }
                        let c = n.value;
                        if ("__proto__" === c) continue;
                        let d = t.valueType._zod.run({
                            value: o[l],
                            issues: []
                        }, i);
                        d instanceof Promise ? a.push(d.then(e => {
                            e.issues.length && r.issues.push(...et(l, e.issues)), r.value[c] = e.value
                        })) : (d.issues.length && r.issues.push(...et(l, d.issues)), r.value[c] = d.value)
                    }
                    s && s.length > 0 && r.issues.push({
                        code: "unrecognized_keys",
                        input: o,
                        inst: e,
                        keys: s,
                        continue: !0
                    })
                }
                return a.length ? Promise.all(a).then(() => r) : r
            }
        }),
        t4 = em("$ZodEnum", (e, t) => {
            ts.init(e, t);
            let n = E(t.entries),
                r = new Set(n);
            e._zod.values = r, ef(e, "pattern", e => {
                let t = E(e.def.entries).filter(e => M.has(typeof e));
                return new RegExp(t.length ? "^(".concat(t.map(e => V(e.toString())).join("|"), ")$") : "^[^\\s\\S]$")
            }), e._zod.parse = (t, i) => {
                let o = t.value;
                return r.has(o) || t.issues.push({
                    code: "invalid_value",
                    values: n,
                    input: o,
                    inst: e
                }), t
            }
        }),
        t5 = em("$ZodTransform", (e, t) => {
            var n;
            ts.init(e, t), e._zod.optin = "optional", null == (n = eg.memoizer) || n.guard(e), e._zod.parse = (n, r) => {
                if ("backward" === r.direction) throw new ey(e.constructor.name);
                let i = t.transform(n.value, n);
                if (r.async) return (i instanceof Promise ? i : Promise.resolve(i)).then(e => (n.value = e, n));
                if (i instanceof Promise) throw new ev;
                return n.value = i, n
            }
        });

    function t7(e, t) {
        return e.value = t.issues.length ? void 0 : t.value, e
    }
    let t8 = em("$ZodOptional", (e, t) => {
            ts.init(e, t), ef(e, "optin", e => "defaulted" === e.def.innerType._zod.optin ? "defaulted" : "optional"), e._zod.optout = "optional", ef(e, "values", e => {
                let t = e.def.innerType._zod.values;
                return t ? new Set([...t, void 0]) : void 0
            }), ef(e, "pattern", e => {
                let t = e.def.innerType._zod.pattern;
                return t ? RegExp("^(".concat(P(t.source), ")?$")) : void 0
            }), e._zod.parse = (e, n) => {
                if (void 0 === e.value) {
                    if ("defaulted" !== t.innerType._zod.optin) return e;
                    let r = t.innerType._zod.run({
                        value: e.value,
                        issues: []
                    }, n);
                    return r instanceof Promise ? r.then(t => t7(e, t)) : t7(e, r)
                }
                return t.innerType._zod.run(e, n)
            }
        }),
        ne = em("$ZodExactOptional", (e, t) => {
            t8.init(e, t), ef(e, "values", e => e.def.innerType._zod.values), ef(e, "pattern", e => e.def.innerType._zod.pattern), e._zod.parse = (e, n) => t.innerType._zod.run(e, n)
        }),
        nt = em("$ZodNullable", (e, t) => {
            ts.init(e, t), ef(e, "optin", e => e.def.innerType._zod.optin), ef(e, "optout", e => e.def.innerType._zod.optout), ef(e, "pattern", e => {
                let t = e.def.innerType._zod.pattern;
                return t ? RegExp("^(".concat(P(t.source), "|null)$")) : void 0
            }), ef(e, "values", e => e.def.innerType._zod.values ? new Set([...e.def.innerType._zod.values, null]) : void 0), e._zod.parse = (e, n) => null === e.value ? e : t.innerType._zod.run(e, n)
        }),
        nn = em("$ZodDefault", (e, t) => {
            ts.init(e, t), e._zod.optin = "defaulted", ef(e, "values", e => e.def.innerType._zod.values), e._zod.parse = (e, n) => {
                if ("backward" === n.direction) return t.innerType._zod.run(e, n);
                if (void 0 === e.value) return e.value = t.defaultValue, e;
                let r = t.innerType._zod.run(e, n);
                return r instanceof Promise ? r.then(e => nr(e, t)) : nr(r, t)
            }
        });

    function nr(e, t) {
        return void 0 === e.value && (e.value = t.defaultValue), e
    }
    let ni = em("$ZodPrefault", (e, t) => {
            ts.init(e, t), e._zod.optin = "defaulted", ef(e, "values", e => e.def.innerType._zod.values), e._zod.parse = (e, n) => ("backward" === n.direction || void 0 === e.value && (e.value = t.defaultValue), t.innerType._zod.run(e, n))
        }),
        no = em("$ZodNonOptional", (e, t) => {
            ts.init(e, t), ef(e, "values", e => {
                let t = e.def.innerType._zod.values;
                return t ? new Set([...t].filter(e => void 0 !== e)) : void 0
            }), e._zod.parse = (n, r) => {
                let i = t.innerType._zod.run(n, r);
                return i instanceof Promise ? i.then(t => na(t, e)) : na(i, e)
            }
        });

    function na(e, t) {
        return e.issues.length || void 0 !== e.value || e.issues.push({
            code: "invalid_type",
            expected: "nonoptional",
            input: e.value,
            inst: t
        }), e
    }

    function nu(e, t, n, r) {
        return t.issues.length ? e.value = n.catchValue({
            ...t,
            value: e.value,
            error: {
                issues: t.issues.map(e => ei(e, r, e_()))
            },
            input: e.value
        }) : (e.value = t.value, t.memo && (e.memo = !0)), e
    }
    let ns = em("$ZodCatch", (e, t) => {
            ts.init(e, t), ef(e, "optin", e => "defaulted" === e.def.innerType._zod.optin ? "defaulted" : "optional"), ef(e, "optout", e => e.def.innerType._zod.optout), ef(e, "values", e => e.def.innerType._zod.values), e._zod.parse = (e, n) => {
                if ("backward" === n.direction) return t.innerType._zod.run(e, n);
                let r = t.innerType._zod.run({
                    value: e.value,
                    issues: []
                }, n);
                return r instanceof Promise ? r.then(r => nu(e, r, t, n)) : nu(e, r, t, n)
            }
        }),
        nl = em("$ZodPipe", (e, t) => {
            ts.init(e, t), ef(e, "values", e => e.def.in._zod.values), ef(e, "optin", e => e.def.in._zod.optin), ef(e, "optout", e => e.def.out._zod.optout), ef(e, "propValues", e => e.def.in._zod.propValues), e._zod.parse = (e, n) => {
                if ("backward" === n.direction) {
                    let r = t.out._zod.run(e, n);
                    return r instanceof Promise ? r.then(e => nc(e, t.in, n)) : nc(r, t.in, n)
                }
                let r = t.in._zod.run(e, n);
                return r instanceof Promise ? r.then(e => nc(e, t.out, n)) : nc(r, t.out, n)
            }
        });

    function nc(e, t, n) {
        return e.issues.some(e => "unrecognized_keys" !== e.code) ? (e.aborted = !0, e) : t._zod.run({
            value: e.value,
            issues: e.issues
        }, n)
    }
    let nd = em("$ZodReadonly", (e, t) => {
        ts.init(e, t), ef(e, "propValues", e => e.def.innerType._zod.propValues), ef(e, "values", e => e.def.innerType._zod.values), ef(e, "optin", e => {
            var t, n;
            return null == (n = e.def.innerType) || null == (t = n._zod) ? void 0 : t.optin
        }), ef(e, "optout", e => {
            var t, n;
            return null == (n = e.def.innerType) || null == (t = n._zod) ? void 0 : t.optout
        }), e._zod.parse = (e, n) => {
            if ("backward" === n.direction) return t.innerType._zod.run(e, n);
            let r = t.innerType._zod.run(e, n);
            return r instanceof Promise ? r.then(nf) : nf(r)
        }
    });

    function nf(e) {
        return e.memo || (e.value = Object.freeze(e.value)), e
    }
    let np = em("$ZodCustom", (e, t) => {
        e6.init(e, t), ts.init(e, t), e._zod.parse = (e, t) => e, e._zod.check = n => {
            let r = n.value,
                i = t.fn(r);
            if (i instanceof Promise) return i.then(t => nh(t, n, r, e));
            nh(i, n, r, e)
        }
    });

    function nh(e, t, n, r) {
        if (!e) {
            var i;
            let e = {
                code: "custom",
                input: n,
                inst: r,
                path: [...null != (i = r._zod.def.path) ? i : []],
                continue: !r._zod.def.abort
            };
            r._zod.def.params && (e.params = r._zod.def.params), t.issues.push(es(e))
        }
    }
    class nm extends Error {
        constructor() {
            super("Cannot parse a reference cycle that closes through a transform"), this.name = "ZodCyclicError"
        }
    }
    let nv = "~memo",
        ny = [];

    function ng(e) {
        return null !== e && "object" == typeof e
    }

    function n_(e) {
        return e.map(e => e.path ? {
            ...e,
            path: e.path.slice()
        } : {
            ...e
        })
    }
    let nb = new WeakMap,
        nF = [],
        nw = {
            alloc(e, t, r) {
                let i = n;
                if (!i) return r;
                n = void 0;
                let o = {
                    value: r,
                    issues: null
                };
                return i.set(t.value, o), nF.push(o), r
            },
            guard(e) {
                var t;
                null != (t = e._zod).deferred || (t.deferred = []), e._zod.deferred.push(() => {
                    let t = e._zod.parse,
                        n = (e, n) => {
                            var r, i;
                            let o;
                            if ("backward" !== n.direction && (i = e.value, void 0 !== (o = null == (r = n[nv]) ? void 0 : r.backEdges) && ng(i) && o.has(i))) throw new nm;
                            return t(e, n)
                        };
                    e._zod.parse = n, e._zod.run === t && (e._zod.run = n)
                })
            },
            attach(e) {
                var t;
                let r, i, o, a = !1;
                null != (t = e._zod).deferred || (t.deferred = []), e._zod.deferred.push(() => {
                    let t = e._zod.parse,
                        u = (s, l) => {
                            var c;
                            let d;
                            if (void 0 === r) {
                                let n = function e(t, n, r) {
                                    var i, o;
                                    let a = nb.get(t);
                                    if (void 0 !== a) return 2 * !!a;
                                    if (n.has(t)) return 2;
                                    n.add(t);
                                    let u = 0,
                                        s = t => {
                                            if (2 !== u && (null == t ? void 0 : t._zod)) {
                                                let r = e(t, n);
                                                r > u && (u = r)
                                            }
                                        },
                                        l = e => {
                                            e > u && (u = e)
                                        },
                                        c = t._zod.def;
                                    switch (c.type) {
                                        case "object": {
                                            let t = C(c);
                                            l(t ? (t => {
                                                let r = 0;
                                                for (let o of Reflect.ownKeys(t)) {
                                                    var i;
                                                    let a = Object.getOwnPropertyDescriptor(t, o);
                                                    if (!a.enumerable) continue;
                                                    let u = a.get ? 1 : (null == (i = a.value) ? void 0 : i._zod) ? e(a.value, n) : 0;
                                                    u > r && (r = u)
                                                }
                                                return r
                                            })(t) : 1), s(c.catchall);
                                            break
                                        }
                                        case "array":
                                            s(c.element);
                                            break;
                                        case "tuple":
                                            for (let e of c.items) s(e);
                                            s(c.rest);
                                            break;
                                        case "record":
                                        case "map":
                                            s(c.keyType), s(c.valueType);
                                            break;
                                        case "set":
                                            s(c.valueType);
                                            break;
                                        case "union":
                                            for (let e of c.options) s(e);
                                            break;
                                        case "intersection":
                                            s(c.left), s(c.right);
                                            break;
                                        case "optional":
                                        case "nullable":
                                        case "default":
                                        case "prefault":
                                        case "catch":
                                        case "readonly":
                                        case "nonoptional":
                                        case "promise":
                                        case "success":
                                            s(c.innerType);
                                            break;
                                        case "pipe":
                                            s(c.in), s(c.out);
                                            break;
                                        case "function":
                                            s(c.input), s(c.output);
                                            break;
                                        case "lazy": {
                                            let t = null != (o = c._cachedInner) ? o : void 0;
                                            l(t ? e(t, n) : 1);
                                            break
                                        }
                                        case "template_literal":
                                        case "string":
                                        case "number":
                                        case "int":
                                        case "boolean":
                                        case "bigint":
                                        case "symbol":
                                        case "undefined":
                                        case "null":
                                        case "void":
                                        case "never":
                                        case "any":
                                        case "unknown":
                                        case "date":
                                        case "nan":
                                        case "enum":
                                        case "literal":
                                        case "file":
                                        case "transform":
                                        case "custom":
                                            break;
                                        default:
                                            for (let e in c) {
                                                let t = Object.getOwnPropertyDescriptor(c, e);
                                                if (!t || t.get) continue;
                                                let n = t.value;
                                                if (n && "object" == typeof n) {
                                                    if (n._zod) s(n);
                                                    else if (Array.isArray(n))
                                                        for (let e of n) s(e)
                                                }
                                            }
                                    }
                                    return n.delete(t), 1 !== (i = u) && nb.set(t, 2 === i), i
                                }(e, new Set);
                                if (0 === n) return e._zod.parse = t, e._zod.run === u && (e._zod.run = t), t(s, l);
                                2 === n || a ? r = !0 : a = !0
                            }
                            let f = s.value;
                            if (!ng(f)) return t(s, l);
                            let p = l[nv];
                            if (p || (p = {
                                    buckets: new WeakMap,
                                    backEdges: void 0
                                }, l[nv] = p), i === l) d = o;
                            else {
                                let t;
                                (t = (c = p).buckets.get(e)) || (t = new WeakMap, c.buckets.set(e, t)), d = t, i = l, o = d
                            }
                            let h = d.get(f);
                            if (h) return s.value = h.value, h.issues ? h.issues.length && s.issues.push(...n_(h.issues)) : (s.memo = !0, null != p.backEdges || (p.backEdges = new WeakSet), p.backEdges.add(h.value)), s;
                            n = d;
                            let m = nF.length,
                                v = t(s, l);
                            n = void 0;
                            let y = nF.length > m ? nF.pop() : void 0;
                            return v instanceof Promise ? v.then(e => (y && (y.issues = e.issues.length ? n_(e.issues) : ny), e)) : (y && (y.issues = v.issues.length ? n_(v.issues) : ny), v)
                        };
                    e._zod.parse = u, e._zod.run === t && (e._zod.run = u)
                })
            }
        };
    null != (v = globalThis).__zod_globalRegistry || (v.__zod_globalRegistry = new class {
        add(e) {
            for (var t = arguments.length, n = Array(t > 1 ? t - 1 : 0), r = 1; r < t; r++) n[r - 1] = arguments[r];
            let i = n[0];
            return this._map.set(e, i), i && "object" == typeof i && "id" in i && this._idmap.set(i.id, e), this
        }
        clear() {
            return this._map = new WeakMap, this._idmap = new Map, this
        }
        remove(e) {
            let t = this._map.get(e);
            return t && "object" == typeof t && "id" in t && this._idmap.delete(t.id), this._map.delete(e), this
        }
        get(e) {
            let t = e._zod.parent;
            if (t) {
                var n;
                let r = {
                    ...null != (n = this.get(t)) ? n : {}
                };
                delete r.id;
                let i = {
                    ...r,
                    ...this._map.get(e)
                };
                return Object.keys(i).length ? i : void 0
            }
            return this._map.get(e)
        }
        has(e) {
            return this._map.has(e)
        }
        constructor() {
            this._map = new WeakMap, this._idmap = new Map
        }
    });
    let nz = globalThis.__zod_globalRegistry;

    function nk(e, t) {
        return new e3({
            check: "max_length",
            ...K(t),
            maximum: e
        })
    }

    function nO(e, t) {
        return new e4({
            check: "min_length",
            ...K(t),
            minimum: e
        })
    }

    function nA(e, t) {
        return new e5({
            check: "length_equals",
            ...K(t),
            length: e
        })
    }

    function nE(e) {
        return new to({
            check: "overwrite",
            tx: e
        })
    }

    function nS(e) {
        for (var t = arguments.length, n = Array(t > 1 ? t - 1 : 0), r = 1; r < t; r++) n[r - 1] = arguments[r];
        for (let t of n)
            for (let n of Reflect.ownKeys(t)) Object.prototype.propertyIsEnumerable.call(t, n) && j(e, n, t[n]);
        return e
    }

    function nT(e) {
        var t, n, r, i, o, a, u, s, l;
        let c = null != (t = null == e ? void 0 : e.target) ? t : "draft-2020-12";
        return "draft-4" === c && (c = "draft-04"), "draft-7" === c && (c = "draft-07"), {
            processors: null != (n = e.processors) ? n : {},
            metadataRegistry: null != (r = null == e ? void 0 : e.metadata) ? r : nz,
            target: c,
            unrepresentable: null != (i = null == e ? void 0 : e.unrepresentable) ? i : "throw",
            override: null != (o = null == e ? void 0 : e.override) ? o : () => {},
            io: null != (a = null == e ? void 0 : e.io) ? a : "output",
            counter: 0,
            seen: new Map,
            sharedDefsExtractedFor: void 0,
            sharedEmitDoneFor: void 0,
            cycles: null != (u = null == e ? void 0 : e.cycles) ? u : "ref",
            reused: null != (s = null == e ? void 0 : e.reused) ? s : "inline",
            intersections: [],
            deferred: [],
            external: null != (l = null == e ? void 0 : e.external) ? l : void 0
        }
    }

    function nx(e, t, n, r, i) {
        let o = "function" == typeof t.unrepresentable ? t.unrepresentable({
            zodSchema: e,
            path: r.path,
            message: i
        }) : t.unrepresentable;
        if ("any" === o) return !1;
        if (void 0 === o || "throw" === o) throw Error(i);
        return Object.assign(n, o), !0
    }

    function nP(e, t) {
        var n, r, i;
        let o = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {
                path: [],
                schemaPath: []
            },
            a = e._zod.def,
            u = t.seen.get(e);
        if (u) return u.count++, o.schemaPath.includes(e) && (u.cycle = o.path), u.schema;
        let s = {
            schema: {},
            count: 1,
            cycle: void 0,
            path: o.path
        };
        t.seen.set(e, s), t.sharedDefsExtractedFor = void 0, t.sharedEmitDoneFor = void 0;
        let l = null == (n = (r = e._zod).toJSONSchema) ? void 0 : n.call(r);
        if (l) s.schema = l;
        else {
            let n = {
                ...o,
                schemaPath: [...o.schemaPath, e],
                path: o.path
            };
            if (e._zod.processJSONSchema) e._zod.processJSONSchema(t, s.schema, n);
            else {
                let r = s.schema,
                    i = t.processors[a.type];
                if (!i) throw Error("[toJSONSchema]: Non-representable type encountered: ".concat(a.type));
                i(e, t, r, n)
            }
            let r = e._zod.parent;
            r && (s.ref || (s.ref = r), nP(r, t, n), t.seen.get(r).isParent = !0)
        }
        let c = t.metadataRegistry.get(e);
        return c && nS(s.schema, c), "input" === t.io && function e(t, n) {
            let r = null != n ? n : {
                seen: new Set
            };
            if (r.seen.has(t)) return !1;
            r.seen.add(t);
            let i = t._zod.def;
            if ("transform" === i.type) return !0;
            if ("array" === i.type) return e(i.element, r);
            if ("set" === i.type) return e(i.valueType, r);
            if ("lazy" === i.type) return e(i.getter(), r);
            if ("promise" === i.type || "optional" === i.type || "nonoptional" === i.type || "nullable" === i.type || "readonly" === i.type || "default" === i.type || "prefault" === i.type || "catch" === i.type) return e(i.innerType, r);
            if ("intersection" === i.type) return e(i.left, r) || e(i.right, r);
            if ("record" === i.type || "map" === i.type) return e(i.keyType, r) || e(i.valueType, r);
            if ("pipe" === i.type) return !!t._zod.traits.has("$ZodCodec") || e(i.in, r) || e(i.out, r);
            if ("object" === i.type) {
                for (let t in i.shape)
                    if (e(i.shape[t], r)) return !0;
                return !1
            }
            if ("union" === i.type) {
                for (let t of i.options)
                    if (e(t, r)) return !0;
                return !1
            }
            if ("tuple" === i.type) {
                for (let t of i.items)
                    if (e(t, r)) return !0;
                if (i.rest && e(i.rest, r)) return !0
            }
            return !1
        }(e) && (delete s.schema.examples, delete s.schema.default), "input" === t.io && "_prefault" in s.schema && (null != (i = s.schema).default || (i.default = s.schema._prefault)), delete s.schema._prefault, t.seen.get(e).schema
    }

    function nj(e) {
        return e.replace(/~/g, "~0").replace(/\//g, "~1")
    }

    function nC(e, t) {
        var n, r, i, o;
        let a = e.seen.get(t);
        if (!a) throw Error("Unprocessed schema. This is a bug in Zod.");
        if (e.external && e.sharedDefsExtractedFor === e.external) return;
        let u = new Map;
        for (let t of e.seen.entries()) {
            let r = null == (n = e.metadataRegistry.get(t[0])) ? void 0 : n.id;
            if (r) {
                let e = u.get(r);
                if (e && e !== t[0]) throw Error('Duplicate schema id "'.concat(r, '" detected during JSON Schema conversion. Two different schemas cannot share the same id when converted together.'));
                u.set(r, t[0])
            }
        }
        let s = t => {
            if (t[1].schema.$ref) return;
            let n = t[1],
                {
                    ref: r,
                    defId: i
                } = (t => {
                    var n, r, i, o, u;
                    let s = "draft-2020-12" === e.target ? "$defs" : "definitions";
                    if (e.external) {
                        let n = null == (u = e.external.registry.get(t[0])) ? void 0 : u.id,
                            a = null != (r = e.external.uri) ? r : e => e;
                        if (n) return {
                            ref: a(n)
                        };
                        let l = null != (i = null != (o = t[1].defId) ? o : t[1].schema.id) ? i : "schema".concat(e.counter++);
                        return t[1].defId = l, {
                            defId: l,
                            ref: "".concat(a("__shared"), "#/").concat(s, "/").concat(nj(l))
                        }
                    }
                    let l = "#/".concat(s, "/");
                    if (t[1] === a && !t[1].schema.id) return {
                        ref: "#"
                    };
                    let c = null != (n = t[1].schema.id) ? n : "__schema".concat(e.counter++);
                    return {
                        defId: c,
                        ref: l + nj(c)
                    }
                })(t);
            n.def = {
                ...n.schema
            }, i && (n.defId = i);
            let o = n.schema;
            for (let e in o) delete o[e];
            o.$ref = r
        };
        if ("throw" === e.cycles)
            for (let t of e.seen.entries()) {
                let e = t[1];
                if (e.cycle) throw Error("Cycle detected: #/".concat(null == (r = e.cycle) ? void 0 : r.join("/"), '/<root>\n\nSet the `cycles` parameter to `"ref"` to resolve cyclical schemas with defs.'))
            }
        for (let n of e.seen.entries()) {
            let r = n[1];
            if (t === n[0]) {
                s(n);
                continue
            }
            if (e.external) {
                let r = null == (o = e.external.registry.get(n[0])) ? void 0 : o.id;
                if (t !== n[0] && r) {
                    s(n);
                    continue
                }
            }
            if ((null == (i = e.metadataRegistry.get(n[0])) ? void 0 : i.id) || r.cycle) {
                s(n);
                continue
            }
            r.count > 1 && "ref" === e.reused && s(n)
        }
        e.external && (e.sharedDefsExtractedFor = e.external)
    }
    let nI = new Set(["type", "properties", "required", "additionalProperties"]),
        n$ = ["oneOf", "anyOf"];

    function nR(e) {
        let t = e.additionalProperties;
        return void 0 === t || !1 === t || "object" != typeof t || null === t ? null : Object.keys(t).length ? t : null
    }

    function nZ(e) {
        let t = [];
        for (let n of e) {
            if ("object" != typeof n || "object" !== n.type) return null;
            for (let e in n)
                if (!nI.has(e)) return null;
            t.push(n)
        }
        let n = {},
            r = new Set;
        for (let e of t) {
            var i, o, a, u;
            for (let r in e.properties) {
                if (Object.prototype.hasOwnProperty.call(n, r)) continue;
                let e = [];
                for (let n of t) {
                    let t = null != (a = null == (u = n.properties) ? void 0 : u[r]) ? a : nR(n);
                    null != t && (e.some(e => JSON.stringify(e) === JSON.stringify(t)) || e.push(t))
                }
                j(n, r, 1 === e.length ? e[0] : null != (o = nZ(e)) ? o : {
                    allOf: e
                })
            }
            for (let t of null != (i = e.required) ? i : []) r.add(t)
        }
        let s = {
            type: "object",
            properties: n
        };
        if (r.size && (s.required = [...r]), t.every(e => !1 === e.additionalProperties)) s.additionalProperties = !1;
        else {
            let e = [];
            for (let n of t) {
                let t = nR(n);
                t && !e.some(e => JSON.stringify(e) === JSON.stringify(t)) && e.push(t)
            }
            1 === e.length ? s.additionalProperties = e[0] : e.length > 1 && (s.additionalProperties = {
                allOf: e
            })
        }
        return s
    }

    function nD(e, t) {
        var n, r, i, o, a, u, s, l;
        let c = e.seen.get(t);
        if (!c) throw Error("Unprocessed schema. This is a bug in Zod.");
        let d = t => {
            var n, r, i;
            let o = e.seen.get(t);
            if (null === o.ref) return;
            let a = null != (n = o.def) ? n : o.schema,
                u = {
                    ...a
                },
                s = o.ref;
            if (o.ref = null, s) {
                d(s);
                let n = e.seen.get(s),
                    r = n.schema;
                if (r.$ref && ("draft-07" === e.target || "draft-04" === e.target || "openapi-3.0" === e.target) ? (a.allOf = null != (i = a.allOf) ? i : [], a.allOf.push(r)) : nS(a, r), nS(a, u), t._zod.parent === s)
                    for (let e in a) "$ref" !== e && "allOf" !== e && (e in u || delete a[e]);
                if (r.$ref && n.def)
                    for (let e in a) "$ref" !== e && "allOf" !== e && e in n.def && JSON.stringify(a[e]) === JSON.stringify(n.def[e]) && delete a[e]
            }
            let l = t._zod.parent;
            if (l && l !== s) {
                d(l);
                let t = e.seen.get(l);
                if ((null == t ? void 0 : t.schema.$ref) && (a.$ref = t.schema.$ref, t.def))
                    for (let e in a) "$ref" !== e && "allOf" !== e && e in t.def && JSON.stringify(a[e]) === JSON.stringify(t.def[e]) && delete a[e]
            }
            e.override({
                zodSchema: t,
                jsonSchema: a,
                path: null != (r = o.path) ? r : []
            })
        };
        if (!e.external || e.sharedEmitDoneFor !== e.external) {
            for (let t of [...e.seen.entries()].reverse()) d(t[0]);
            if ("openapi-3.0" !== e.target)
                for (let t of e.seen.entries()) ! function e(t) {
                    let n = t.anyOf;
                    if (!Array.isArray(n) || 0 === n.length || void 0 !== t.type) return;
                    let r = [];
                    for (let t of n) {
                        if (!t || "object" != typeof t) return;
                        e(t);
                        let n = Object.keys(t);
                        if (1 !== n.length || "type" !== n[0]) return;
                        let i = t.type;
                        for (let e of Array.isArray(i) ? i : [i]) {
                            if ("string" != typeof e) return;
                            r.includes(e) || r.push(e)
                        }
                    }
                    delete t.anyOf, t.type = 1 === r.length ? r[0] : r
                }(null != (u = t[1].def) ? u : t[1].schema);
            for (let t of e.deferred) t();
            if (e.intersections.length) {
                let t = new Map;
                for (let n of e.seen.values())
                    for (let e of [n.schema, n.def]) {
                        let n = null == e ? void 0 : e.allOf;
                        if (!Array.isArray(n)) continue;
                        let r = t.get(n);
                        r ? r.push(e) : t.set(n, [e])
                    }
                for (let n of e.intersections)
                    for (let e of null != (s = t.get(n)) ? s : []) ! function(e) {
                        let t = e.allOf;
                        if (!Array.isArray(t) || t.length < 2) return;
                        for (let t of nI)
                            if (t in e) return;
                        let n = t.filter(e => n$.some(t => Array.isArray(e[t]))),
                            r = null;
                        if (n.length) {
                            let e = n[0],
                                i = n$.find(t => Array.isArray(e[t]));
                            if (1 !== Object.keys(e).length) return;
                            let o = t.filter(t => t !== e),
                                a = e[i].map(e => nZ([...o, e]));
                            if (a.some(e => !e)) return;
                            r = {
                                [i]: a
                            }
                        } else r = nZ(t);
                        r && (delete e.allOf, nS(e, r))
                    }(e)
            }
        }
        let f = {};
        if ("draft-2020-12" === e.target ? f.$schema = "https://json-schema.org/draft/2020-12/schema" : "draft-07" === e.target ? f.$schema = "http://json-schema.org/draft-07/schema#" : "draft-04" === e.target ? f.$schema = "http://json-schema.org/draft-04/schema#" : e.target, null == (i = e.external) ? void 0 : i.uri) {
            let n = null == (l = e.external.registry.get(t)) ? void 0 : l.id;
            if (!n) throw Error("Schema is missing an `id` property");
            f.$id = e.external.uri(n)
        }
        nS(f, c.defId ? c.schema : null != (n = c.def) ? n : c.schema);
        let p = null == (o = e.metadataRegistry.get(t)) ? void 0 : o.id;
        void 0 !== p && f.id === p && delete f.id;
        let h = null != (r = null == (a = e.external) ? void 0 : a.defs) ? r : {};
        if (!e.external || e.sharedEmitDoneFor !== e.external)
            for (let t of e.seen.entries()) {
                let e = t[1];
                e.def && e.defId && (e.def.id === e.defId && delete e.def.id, j(h, e.defId, e.def))
            }
        e.external && (e.sharedEmitDoneFor = e.external), e.external || Object.keys(h).length > 0 && ("draft-2020-12" === e.target ? f.$defs = h : f.definitions = h);
        try {
            let n = JSON.parse(JSON.stringify(f));
            return Object.defineProperty(n, "~standard", {
                value: {
                    ...t["~standard"],
                    jsonSchema: {
                        input: nN(t, "input", e.processors),
                        output: nN(t, "output", e.processors)
                    }
                },
                enumerable: !1,
                writable: !1
            }), n
        } catch (e) {
            throw Error("Error converting schema to JSON.")
        }
    }
    let nN = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
            return r => {
                let {
                    libraryOptions: i,
                    target: o
                } = null != r ? r : {}, a = nT({
                    ...null != i ? i : {},
                    target: o,
                    io: t,
                    processors: n
                });
                return nP(e, a), nC(a, e), nD(a, e)
            }
        },
        nL = (e, t, n) => {
            (void 0 === e[t] || n > e[t]) && (e[t] = n)
        },
        nB = (e, t, n) => {
            (void 0 === e[t] || n < e[t]) && (e[t] = n)
        },
        nJ = (e, t) => {
            nL(e, "minimum", t), nB(e, "maximum", t)
        },
        nU = (e, t) => {
            null != e.multipleOf || (e.multipleOf = []), e.multipleOf.includes(t) || e.multipleOf.push(t)
        },
        nM = (e, t) => {
            null != e.patterns || (e.patterns = new Set), e.patterns.add(t)
        },
        nV = (e, t) => {
            e.mime = e.mime ? e.mime.filter(e => t.includes(e)) : [...t]
        },
        nH = (e, t) => {
            e.format = t, t.includes("int") && (e.isInt = !0)
        },
        nK = (e, t) => nL(e, "minimum", t.minimum),
        nW = (e, t) => nB(e, "maximum", t.maximum),
        nq = e => (t, n) => {
            nH(t, n.format);
            let [r, i] = e[n.format];
            nL(t, "minimum", r), nB(t, "maximum", i)
        },
        nG = {
            greater_than: (e, t) => nL(e, t.inclusive ? "minimum" : "exclusiveMinimum", t.value),
            less_than: (e, t) => nB(e, t.inclusive ? "maximum" : "exclusiveMaximum", t.value),
            multiple_of: (e, t) => nU(e, t.value),
            number_format: nq(q),
            bigint_format: nq(G),
            min_length: nK,
            max_length: nW,
            length_equals: (e, t) => nJ(e, t.length),
            min_size: nK,
            max_size: nW,
            size_equals: (e, t) => nJ(e, t.size),
            string_format: (e, t) => {
                nH(e, t.format), t.pattern && nM(e, t.pattern), ("base64" === t.format || "base64url" === t.format) && (e.contentEncoding = t.format), (t.local || -1 === t.precision) && (e.laxFormat = !0)
            },
            mime_type: (e, t) => nV(e, t.mime)
        };

    function nX(e) {
        var t, n, r, i;
        let o = {},
            a = e._zod.def;
        for (let r of e._zod.traits.has("$ZodCheck") ? [e, ...null != (t = a.checks) ? t : []] : null != (n = a.checks) ? n : []) null == (i = nG[r._zod.def.check]) || i.call(nG, o, r._zod.def);
        let u = e._zod.bag;
        for (let e of (void 0 !== u.minimum && nL(o, "minimum", u.minimum), void 0 !== u.exclusiveMinimum && nL(o, "exclusiveMinimum", u.exclusiveMinimum), void 0 !== u.maximum && nB(o, "maximum", u.maximum), void 0 !== u.exclusiveMaximum && nB(o, "exclusiveMaximum", u.exclusiveMaximum), void 0 !== u.multipleOf && nU(o, u.multipleOf), void 0 !== u.format && (null != o.format || (o.format = u.format), u.format.includes("int") && (o.isInt = !0)), u.mime && nV(o, u.mime), null != (r = u.patterns) ? r : [])) nM(o, e);
        return o
    }
    let nY = {
            guid: "uuid",
            url: "uri",
            datetime: "date-time",
            json_string: "json-string",
            regex: ""
        },
        nQ = new Map([
            [tN, /^$|^(?:[0-9a-zA-Z+/]{4})*(?:(?:[0-9a-zA-Z+/]{2}==)|(?:[0-9a-zA-Z+/]{3}=))?$/],
            [tB, /^(?:[A-Za-z0-9_-]{4})*(?:[A-Za-z0-9_-]{2,3})?$/]
        ]),
        n0 = e => {
            var t;
            return null != (t = nQ.get(e)) ? t : e
        };

    function n1(e) {
        let t = e._zod.def;
        return "pipe" === t.type && t.in._zod.traits.has("$ZodTransform") ? n1(t.out) : "catch" === t.type ? n1(t.innerType) : e._zod.optin
    }
    let n2 = new WeakMap,
        n6 = Symbol();

    function n9(e, t, n, r, i) {
        let o = !1,
            a = JSON.stringify(e, (e, t) => "bigint" != typeof t ? t : (o = !0, null));
        return o ? (nx(t, n, r, i, "BigInt defaults cannot be represented in JSON Schema"), n6) : JSON.parse(a)
    }
    let n3 = (e, t, n, r) => {
            let i = e._zod.def;
            nP(i.innerType, t, r), t.seen.get(e).ref = i.innerType
        },
        n4 = new WeakSet([Object.prototype, Error.prototype]);

    function n5(e, t, n) {
        Object.defineProperty(e, t, {
            configurable: !0,
            enumerable: !1,
            get() {
                let e = n(this);
                return Object.defineProperty(this, t, {
                    value: e,
                    configurable: !0,
                    writable: !0
                }), e
            },
            set(e) {
                Object.defineProperty(this, t, {
                    value: e,
                    configurable: !0,
                    writable: !0
                })
            }
        })
    }
    let n7 = em("ZodError", (e, t) => {
            ez.init(e, t), e.name = "ZodError";
            let n = Object.getPrototypeOf(e);
            n4.has(n) || (n4.add(n), n5(n, "format", e => t => (function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e => e.message,
                    n = {
                        _errors: []
                    },
                    r = function(e) {
                        let i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [];
                        for (let o of e.issues)
                            if ("invalid_union" === o.code && o.errors.length) o.errors.map(e => r({
                                issues: e
                            }, [...i, ...o.path]));
                            else if ("invalid_key" === o.code) r({
                            issues: o.issues
                        }, [...i, ...o.path]);
                        else if ("invalid_element" === o.code) r({
                            issues: o.issues
                        }, [...i, ...o.path]);
                        else {
                            let e = [...i, ...o.path];
                            if (0 === e.length) n._errors.push(t(o));
                            else {
                                let r = n,
                                    i = 0;
                                for (; i < e.length;) {
                                    let n = e[i],
                                        a = i === e.length - 1;
                                    if ("_errors" === n) {
                                        a && r._errors.push(t(o)), i++;
                                        continue
                                    }
                                    Object.prototype.hasOwnProperty.call(r, n) || Object.defineProperty(r, n, {
                                        value: {
                                            _errors: []
                                        },
                                        enumerable: !0,
                                        writable: !0,
                                        configurable: !0
                                    });
                                    let u = r[n];
                                    a && u._errors.push(t(o)), r = u, i++
                                }
                            }
                        }
                    };
                return r(e), n
            })(e, t)), n5(n, "flatten", e => t => (function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e => e.message,
                    n = {},
                    r = [];
                for (let a of e.issues)
                    if (a.path.length > 0) {
                        var i, o;
                        (i = a.path[0], o = () => [], !Object.prototype.hasOwnProperty.call(n, i) && ("__proto__" === i ? Object.defineProperty(n, i, {
                            value: o(),
                            writable: !0,
                            enumerable: !0,
                            configurable: !0
                        }) : n[i] = o()), n[i]).push(t(a))
                    } else r.push(t(a));
                return {
                    formErrors: r,
                    fieldErrors: n
                }
            })(e, t)), n5(n, "addIssue", e => t => {
                e.issues.push(t), e.message = JSON.stringify(e.issues, T, 2)
            }), n5(n, "addIssues", e => t => {
                e.issues.push(...t), e.message = JSON.stringify(e.issues, T, 2)
            }), Object.defineProperty(n, "isEmpty", {
                configurable: !0,
                enumerable: !1,
                get() {
                    return 0 === this.issues.length
                }
            }))
        }, void 0, {
            Parent: Error
        }),
        n8 = eO(n7),
        re = eA(n7),
        rt = eE(n7),
        rn = eT(n7),
        rr = (r = eO(n7), i = (e, t, n, o) => r(e, t, n ? {
            ...n,
            direction: "backward"
        } : {
            direction: "backward"
        }, ek(i, o))),
        ri = (o = eO(n7), a = (e, t, n, r) => o(e, t, n, ek(a, r))),
        ro = (u = eA(n7), s = async (e, t, n, r) => {
            let i = n ? {
                ...n,
                direction: "backward"
            } : {
                direction: "backward"
            };
            return await u(e, t, i, ek(s, r))
        }),
        ra = (l = eA(n7), c = async (e, t, n, r) => await l(e, t, n, ek(c, r))),
        ru = async (e, t, n) => {
            let r = n ? {
                ...n,
                direction: "backward"
            } : {
                direction: "backward"
            };
            return eT(n7)(e, t, r)
        }, rs = async (e, t, n) => eT(n7)(e, t, n);

    function rl() {
        eg.memoizer || e_({
            memoizer: nw
        })
    }
    let rc = em("ZodType", (e, t) => (eg.localeError || e_({
            localeError: (() => {
                let e = {
                        string: {
                            unit: "characters",
                            verb: "to have"
                        },
                        file: {
                            unit: "bytes",
                            verb: "to have"
                        },
                        array: {
                            unit: "items",
                            verb: "to have"
                        },
                        set: {
                            unit: "items",
                            verb: "to have"
                        },
                        map: {
                            unit: "entries",
                            verb: "to have"
                        }
                    },
                    t = {
                        regex: "input",
                        email: "email address",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO datetime",
                        date: "ISO date",
                        time: "ISO time",
                        duration: "ISO duration",
                        ipv4: "IPv4 address",
                        ipv6: "IPv6 address",
                        mac: "MAC address",
                        cidrv4: "IPv4 range",
                        cidrv6: "IPv6 range",
                        base64: "base64-encoded string",
                        base64url: "base64url-encoded string",
                        json_string: "JSON string",
                        e164: "E.164 number",
                        currency_code: "currency code",
                        credit_card: "credit card number",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    n = {
                        nan: "NaN"
                    };

                function r(e, t) {
                    var r;
                    return "number" !== e || "number" != typeof t || Number.isFinite(t) ? null != (r = n[e]) ? r : e : String(t)
                }
                return n => {
                    var i, o, a, u, s, l;
                    switch (n.code) {
                        case "invalid_type": {
                            let e = r(n.expected),
                                t = r(function(e) {
                                    let t = typeof e;
                                    switch (t) {
                                        case "number":
                                            return Number.isNaN(e) ? "nan" : "number";
                                        case "object":
                                            if (null === e) return "null";
                                            if (Array.isArray(e)) return "array";
                                            if (e && Object.getPrototypeOf(e) !== Object.prototype && "constructor" in e && e.constructor) return e.constructor.name
                                    }
                                    return t
                                }(n.input), n.input);
                            return "Invalid input: expected ".concat(e, ", received ").concat(t)
                        }
                        case "invalid_value":
                            if (1 === n.values.length) return "Invalid input: expected ".concat(W(n.values[0]));
                            return "Invalid option: expected one of ".concat(S(n.values, "|"));
                        case "too_big": {
                            let t = n.exact ? "exactly " : n.inclusive ? "<=" : "<",
                                r = null != (i = e[n.origin]) ? i : null;
                            if (r) return "Too big: expected ".concat(null != (o = n.origin) ? o : "value", " to have ").concat(t).concat(n.maximum.toString(), " ").concat(null != (a = r.unit) ? a : "elements");
                            return "Too big: expected ".concat(null != (u = n.origin) ? u : "value", " to be ").concat(t).concat(n.maximum.toString())
                        }
                        case "too_small": {
                            let t = n.exact ? "exactly " : n.inclusive ? ">=" : ">",
                                r = null != (s = e[n.origin]) ? s : null;
                            if (r) return "Too small: expected ".concat(n.origin, " to have ").concat(t).concat(n.minimum.toString(), " ").concat(r.unit);
                            return "Too small: expected ".concat(n.origin, " to be ").concat(t).concat(n.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === n.format) return 'Invalid string: must start with "'.concat(n.prefix, '"');
                            if ("ends_with" === n.format) return 'Invalid string: must end with "'.concat(n.suffix, '"');
                            if ("includes" === n.format) return 'Invalid string: must include "'.concat(n.includes, '"');
                            if ("regex" === n.format) return "Invalid string: must match pattern ".concat(n.pattern);
                            return "Invalid ".concat(null != (l = t[n.format]) ? l : n.format);
                        case "not_multiple_of":
                            return "Invalid number: must be a multiple of ".concat(n.divisor);
                        case "unrecognized_keys":
                            return "Unrecognized key".concat(n.keys.length > 1 ? "s" : "", ": ").concat(S(n.keys, ", "));
                        case "invalid_key":
                            return "Invalid key in ".concat(n.origin);
                        case "invalid_union":
                            if (n.options && Array.isArray(n.options) && n.options.length > 0) {
                                let e = n.options.map(e => "'".concat(e, "'")).join(" | ");
                                return "Invalid discriminator value. Expected ".concat(e)
                            }
                            if (!1 === n.inclusive) return "Invalid input: more than one option matched";
                            return "Invalid input";
                        case "invalid_element":
                            return "Invalid value in ".concat(n.origin);
                        default:
                            return "Invalid input"
                    }
                }
            })()
        }), ts.init(e, t), e.def = t, e.type = t.type, e), {
            check() {
                for (var e, t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                let i = this.def;
                return this.clone(D(i, {
                    checks: [...null != (e = i.checks) ? e : [], ...n.map(e => "function" == typeof e ? {
                        _zod: {
                            check: e,
                            def: {
                                check: "custom"
                            },
                            onattach: []
                        }
                    } : e)]
                }), {
                    parent: !0
                })
            },
            with() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return this.check(...t)
            },
            clone(e, t) {
                return H(this, e, t)
            },
            brand() {
                return this
            },
            register(e, t) {
                return e.add(this, t), this
            },
            refine(e, t) {
                return this.check(function(e) {
                    let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    return new r5({
                        type: "custom",
                        check: "custom",
                        fn: e,
                        ...K(t)
                    })
                }(e, t))
            },
            superRefine(e, t) {
                var n;
                let r, i;
                return this.check((n = t => (t.addIssue = e => {
                    "string" == typeof e ? t.issues.push(es(e, t.value, r._zod.def)) : (e.fatal && (e.continue = !1), null != e.code || (e.code = "custom"), "input" in e || (e.input = t.value), null != e.inst || (e.inst = r), null != e.continue || (e.continue = !r._zod.def.abort), t.issues.push(es(e)))
                }, e(t.value, t)), (i = new e6({
                    check: "custom",
                    ...K(t)
                }))._zod.check = n, r = i))
            },
            overwrite(e) {
                return this.check(nE(e))
            },
            optional() {
                return rG(this)
            },
            exactOptional() {
                return new rX({
                    type: "optional",
                    innerType: this
                })
            },
            nullable() {
                return rQ(this)
            },
            nullish() {
                return rG(rQ(this))
            },
            nonoptional(e) {
                return new r2({
                    type: "nonoptional",
                    innerType: this,
                    ...K(e)
                })
            },
            array() {
                return new rB({
                    type: "array",
                    element: this,
                    ...K(void 0)
                })
            },
            or(e) {
                return new rU({
                    type: "union",
                    options: [this, e],
                    ...K(void 0)
                })
            },
            and(e) {
                return new rM({
                    type: "intersection",
                    left: this,
                    right: e
                })
            },
            transform(e) {
                return r3(this, new rW({
                    type: "transform",
                    transform: e
                }))
            },
            default (e) {
                return new r0({
                    type: "default",
                    innerType: this,
                    get defaultValue() {
                        return "function" == typeof e ? e() : U(e)
                    }
                })
            },
            prefault(e) {
                return new r1({
                    type: "prefault",
                    innerType: this,
                    get defaultValue() {
                        return "function" == typeof e ? e() : U(e)
                    }
                })
            },
            catch (e) {
                let t;
                return new r6({
                    type: "catch",
                    innerType: this,
                    catchValue: "function" == typeof e ? e : ((t = () => e)["~constantCatch"] = !0, t)
                })
            },
            pipe(e) {
                return r3(this, e)
            },
            readonly() {
                return new r4({
                    type: "readonly",
                    innerType: this
                })
            },
            describe(e) {
                let t = this.clone();
                return nz.add(t, {
                    description: e
                }), t
            },
            meta() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                if (0 === t.length) return nz.get(this);
                let r = this.clone();
                return nz.add(r, t[0]), r
            },
            isOptional() {
                return this.safeParse(void 0).success
            },
            isNullable() {
                return this.safeParse(null).success
            },
            apply(e) {
                for (var t = arguments.length, n = Array(t > 1 ? t - 1 : 0), r = 1; r < t; r++) n[r - 1] = arguments[r];
                return 0 === n.length ? e(this) : e(this, ...n)
            },
            get "~standard"() {
                return el(this, "~standard", {
                    ...td(this),
                    jsonSchema: {
                        input: nN(this, "input"),
                        output: nN(this, "output")
                    }
                }, !1)
            },
            set "~standard"(e) {
                el(this, "~standard", e)
            },
            parse: function e(t, n) {
                return n8(this, t, n, {
                    callee: e
                })
            },
            parseAsync: async function e(t, n) {
                return await re(this, t, n, {
                    callee: e
                })
            },
            safeParse(e, t) {
                return rt(this, e, t)
            },
            async safeParseAsync(e, t) {
                return rn(this, e, t)
            },
            get spa() {
                return null === this || void 0 === this ? void 0 : this.safeParseAsync
            },
            set spa(e) {
                el(this, "spa", e)
            },
            validate(e, t) {
                let n = this._zod.bag.validator;
                if (void 0 !== n) {
                    if (n(e) !== ex) return !0;
                    if (!0 === n.definite && void 0 === t) return !1
                }
                return function(e, t, n) {
                    let r, i = n ? {
                            ...n,
                            async: !1,
                            abortEarly: !0
                        } : {
                            async: !1,
                            abortEarly: !0
                        },
                        o = e._zod.bag.fallbackRun;
                    if (o ? (i[eP] = !0, r = o({
                            value: t,
                            issues: []
                        }, i)) : r = e._zod.run({
                            value: t,
                            issues: []
                        }, i), r instanceof Promise) throw new ev;
                    return 0 === r.issues.length
                }(this, e, t)
            },
            validateAsync(e, t) {
                return ej(this, e, t)
            },
            encode: function e(t, n) {
                return rr(this, t, n, {
                    callee: e
                })
            },
            decode: function e(t, n) {
                return ri(this, t, n, {
                    callee: e
                })
            },
            encodeAsync: async function e(t, n) {
                return await ro(this, t, n, {
                    callee: e
                })
            },
            decodeAsync: async function e(t, n) {
                return await ra(this, t, n, {
                    callee: e
                })
            },
            safeEncode(e, t) {
                let n;
                return n = t ? {
                    ...t,
                    direction: "backward"
                } : {
                    direction: "backward"
                }, eE(n7)(this, e, n)
            },
            safeDecode(e, t) {
                return eE(n7)(this, e, t)
            },
            async safeEncodeAsync(e, t) {
                return ru(this, e, t)
            },
            async safeDecodeAsync(e, t) {
                return rs(this, e, t)
            },
            toJSONSchema(e) {
                return (function(e) {
                    let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    return n => {
                        let r = nT({
                            ...n,
                            processors: t
                        });
                        return nP(e, r), nC(r, e), nD(r, e)
                    }
                })(this, {})(e)
            },
            get description() {
                var e;
                return null == (e = nz.get(this)) ? void 0 : e.description
            },
            get _def() {
                return this._zod.def
            }
        }),
        rd = em("_ZodString", (e, t) => {
            tf.init(e, t), rc.init(e, t), e._zod.processJSONSchema = (t, n, r) => ((e, t, n) => {
                var r;
                n.type = "string";
                let {
                    minimum: i,
                    maximum: o,
                    format: a,
                    patterns: u,
                    contentEncoding: s,
                    laxFormat: l
                } = nX(e);
                if ("number" == typeof i && (n.minLength = i), "number" == typeof o && (n.maxLength = o), a && (n.format = null != (r = nY[a]) ? r : a, "" === n.format && delete n.format, ("time" === a || l) && delete n.format), s && (n.contentEncoding = s), u && u.size > 0) {
                    let e = [...u].map(n0);
                    1 === e.length ? n.pattern = e[0].source : e.length > 1 && (n.allOf = [...e.map(e => ({
                        ..."draft-07" === t.target || "draft-04" === t.target || "openapi-3.0" === t.target ? {
                            type: "string"
                        } : {},
                        pattern: e.source
                    }))])
                }
            })(e, t, n)
        }, function(e, t) {
            for (let n in e) {
                let r = e[n];
                Object.defineProperty(t, n, {
                    configurable: !0,
                    enumerable: !0,
                    get() {
                        return el(this, n, r(this))
                    },
                    set(e) {
                        el(this, n, e)
                    }
                })
            }
            return t
        }({
            format: e => {
                var t;
                return null != (t = nX(e).format) ? t : null
            },
            minLength: e => {
                var t;
                return null != (t = nX(e).minimum) ? t : null
            },
            maxLength: e => {
                var t;
                return null != (t = nX(e).maximum) ? t : null
            }
        }, {
            regex() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return this.check(function(e, t) {
                    return new e8({
                        check: "string_format",
                        format: "regex",
                        ...K(t),
                        pattern: e
                    })
                }(...t))
            },
            includes() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return this.check(function(e, t) {
                    return new tn({
                        check: "string_format",
                        format: "includes",
                        ...K(t),
                        includes: e
                    })
                }(...t))
            },
            startsWith() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return this.check(function(e, t) {
                    return new tr({
                        check: "string_format",
                        format: "starts_with",
                        ...K(t),
                        prefix: e
                    })
                }(...t))
            },
            endsWith() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return this.check(function(e, t) {
                    return new ti({
                        check: "string_format",
                        format: "ends_with",
                        ...K(t),
                        suffix: e
                    })
                }(...t))
            },
            min() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return this.check(nO(...t))
            },
            max() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return this.check(nk(...t))
            },
            length() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return this.check(nA(...t))
            },
            nonempty() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return this.check(nO(1, ...t))
            },
            lowercase(e) {
                return this.check(new te({
                    check: "string_format",
                    format: "lowercase",
                    ...K(e)
                }))
            },
            uppercase(e) {
                return this.check(new tt({
                    check: "string_format",
                    format: "uppercase",
                    ...K(e)
                }))
            },
            trim() {
                return this.check(nE(e => e.trim()))
            },
            normalize() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return this.check(function(e) {
                    return nE(t => t.normalize(e))
                }(...t))
            },
            toLowerCase() {
                return this.check(nE(e => e.toLowerCase()))
            },
            toUpperCase() {
                return this.check(nE(e => e.toUpperCase()))
            },
            slugify() {
                return this.check(nE(e => e.toLowerCase().trim().replace(/[^\w\s-]/g, "").replace(/[\s_-]+/g, "-").replace(/^-+|-+$/g, "")))
            }
        })),
        rf = em("ZodString", (e, t) => {
            tf.init(e, t), rd.init(e, t)
        }, {
            email(e) {
                return this.check(new r_({
                    type: "string",
                    format: "email",
                    check: "string_format",
                    abort: !1,
                    ...K(e)
                }))
            },
            url(e) {
                return this.check(new rw({
                    type: "string",
                    format: "url",
                    check: "string_format",
                    abort: !1,
                    ...K(e)
                }))
            },
            jwt(e) {
                return this.check(new rZ({
                    type: "string",
                    format: "jwt",
                    check: "string_format",
                    abort: !1,
                    ...K(e)
                }))
            },
            emoji(e) {
                return this.check(new rz({
                    type: "string",
                    format: "emoji",
                    check: "string_format",
                    abort: !1,
                    ...K(e)
                }))
            },
            guid(e) {
                return this.check(new rb({
                    type: "string",
                    format: "guid",
                    check: "string_format",
                    abort: !1,
                    ...K(e)
                }))
            },
            uuid(e) {
                return this.check(new rF({
                    type: "string",
                    format: "uuid",
                    check: "string_format",
                    abort: !1,
                    ...K(e)
                }))
            },
            uuidv4(e) {
                return this.check(new rF({
                    type: "string",
                    format: "uuid",
                    check: "string_format",
                    abort: !1,
                    version: "v4",
                    ...K(e)
                }))
            },
            uuidv6(e) {
                return this.check(new rF({
                    type: "string",
                    format: "uuid",
                    check: "string_format",
                    abort: !1,
                    version: "v6",
                    ...K(e)
                }))
            },
            uuidv7(e) {
                return this.check(new rF({
                    type: "string",
                    format: "uuid",
                    check: "string_format",
                    abort: !1,
                    version: "v7",
                    ...K(e)
                }))
            },
            nanoid(e) {
                return this.check(new rk({
                    type: "string",
                    format: "nanoid",
                    check: "string_format",
                    abort: !1,
                    ...K(e)
                }))
            },
            cuid(e) {
                return this.check(new rO({
                    type: "string",
                    format: "cuid",
                    check: "string_format",
                    abort: !1,
                    ...K(e)
                }))
            },
            cuid2(e) {
                return this.check(new rA({
                    type: "string",
                    format: "cuid2",
                    check: "string_format",
                    abort: !1,
                    ...K(e)
                }))
            },
            ulid(e) {
                return this.check(new rE({
                    type: "string",
                    format: "ulid",
                    check: "string_format",
                    abort: !1,
                    ...K(e)
                }))
            },
            base64(e) {
                return this.check(new rI({
                    type: "string",
                    format: "base64",
                    check: "string_format",
                    abort: !1,
                    ...K(e)
                }))
            },
            base64url(e) {
                return this.check(new r$({
                    type: "string",
                    format: "base64url",
                    check: "string_format",
                    abort: !1,
                    ...K(e)
                }))
            },
            xid(e) {
                return this.check(new rS({
                    type: "string",
                    format: "xid",
                    check: "string_format",
                    abort: !1,
                    ...K(e)
                }))
            },
            ksuid(e) {
                return this.check(new rT({
                    type: "string",
                    format: "ksuid",
                    check: "string_format",
                    abort: !1,
                    ...K(e)
                }))
            },
            ipv4(e) {
                return this.check(new rx({
                    type: "string",
                    format: "ipv4",
                    check: "string_format",
                    abort: !1,
                    ...K(e)
                }))
            },
            ipv6(e) {
                return this.check(new rP({
                    type: "string",
                    format: "ipv6",
                    check: "string_format",
                    abort: !1,
                    ...K(e)
                }))
            },
            cidrv4(e) {
                return this.check(new rj({
                    type: "string",
                    format: "cidrv4",
                    check: "string_format",
                    abort: !1,
                    ...K(e)
                }))
            },
            cidrv6(e) {
                return this.check(new rC({
                    type: "string",
                    format: "cidrv6",
                    check: "string_format",
                    abort: !1,
                    ...K(e)
                }))
            },
            e164(e) {
                return this.check(new rR({
                    type: "string",
                    format: "e164",
                    check: "string_format",
                    abort: !1,
                    ...K(e)
                }))
            },
            datetime(e) {
                return this.check(new rm({
                    type: "string",
                    format: "datetime",
                    check: "string_format",
                    offset: !1,
                    local: !1,
                    precision: null,
                    ...K(e)
                }))
            },
            date(e) {
                return this.check(new rv({
                    type: "string",
                    format: "date",
                    check: "string_format",
                    ...K(e)
                }))
            },
            time(e) {
                return this.check(new ry({
                    type: "string",
                    format: "time",
                    check: "string_format",
                    precision: null,
                    ...K(e)
                }))
            },
            duration(e) {
                return this.check(new rg({
                    type: "string",
                    format: "duration",
                    check: "string_format",
                    ...K(e)
                }))
            }
        });

    function rp(e) {
        var t;
        return new rf(((t = {
            type: "string",
            ...K(e)
        }).checks && (t.checks = [...t.checks]), t))
    }
    let rh = em("ZodStringFormat", (e, t) => {
            tp.init(e, t), rd.init(e, t)
        }),
        rm = em("ZodISODateTime", (e, t) => {
            tS.init(e, t), rh.init(e, t)
        }),
        rv = em("ZodISODate", (e, t) => {
            tT.init(e, t), rh.init(e, t)
        }),
        ry = em("ZodISOTime", (e, t) => {
            tx.init(e, t), rh.init(e, t)
        }),
        rg = em("ZodISODuration", (e, t) => {
            tP.init(e, t), rh.init(e, t)
        }),
        r_ = em("ZodEmail", (e, t) => {
            tv.init(e, t), rh.init(e, t)
        }),
        rb = em("ZodGUID", (e, t) => {
            th.init(e, t), rh.init(e, t)
        }),
        rF = em("ZodUUID", (e, t) => {
            tm.init(e, t), rh.init(e, t)
        }),
        rw = em("ZodURL", (e, t) => {
            tb.init(e, t), rh.init(e, t)
        }),
        rz = em("ZodEmoji", (e, t) => {
            tF.init(e, t), rh.init(e, t)
        }),
        rk = em("ZodNanoID", (e, t) => {
            tw.init(e, t), rh.init(e, t)
        }),
        rO = em("ZodCUID", (e, t) => {
            tz.init(e, t), rh.init(e, t)
        }),
        rA = em("ZodCUID2", (e, t) => {
            tk.init(e, t), rh.init(e, t)
        }),
        rE = em("ZodULID", (e, t) => {
            tO.init(e, t), rh.init(e, t)
        }),
        rS = em("ZodXID", (e, t) => {
            tA.init(e, t), rh.init(e, t)
        }),
        rT = em("ZodKSUID", (e, t) => {
            tE.init(e, t), rh.init(e, t)
        }),
        rx = em("ZodIPv4", (e, t) => {
            tj.init(e, t), rh.init(e, t)
        }),
        rP = em("ZodIPv6", (e, t) => {
            t$.init(e, t), rh.init(e, t)
        }),
        rj = em("ZodCIDRv4", (e, t) => {
            tR.init(e, t), rh.init(e, t)
        }),
        rC = em("ZodCIDRv6", (e, t) => {
            tZ.init(e, t), rh.init(e, t)
        }),
        rI = em("ZodBase64", (e, t) => {
            tL.init(e, t), rh.init(e, t)
        }),
        r$ = em("ZodBase64URL", (e, t) => {
            tJ.init(e, t), rh.init(e, t)
        }),
        rR = em("ZodE164", (e, t) => {
            tU.init(e, t), rh.init(e, t)
        }),
        rZ = em("ZodJWT", (e, t) => {
            tM.init(e, t), rh.init(e, t)
        }),
        rD = em("ZodUnknown", (e, t) => {
            tV.init(e, t), rc.init(e, t), e._zod.processJSONSchema = (e, t, n) => void 0
        });

    function rN() {
        return new rD({
            type: "unknown"
        })
    }
    let rL = em("ZodNever", (e, t) => {
            tH.init(e, t), rc.init(e, t), e._zod.processJSONSchema = (e, t, n) => {
                t.not = {}
            }
        }),
        rB = em("ZodArray", (e, t) => {
            rl(), tW.init(e, t), rc.init(e, t), e._zod.processJSONSchema = (t, n, r) => ((e, t, n, r) => {
                let i = e._zod.def,
                    {
                        minimum: o,
                        maximum: a
                    } = nX(e);
                "number" == typeof o && (n.minItems = o), "number" == typeof a && (n.maxItems = a), n.type = "array", n.items = nP(i.element, t, {
                    ...r,
                    path: [...r.path, "items"]
                })
            })(e, t, n, r), e.element = t.element
        }, {
            min(e, t) {
                return this.check(nO(e, t))
            },
            nonempty(e) {
                return this.check(nO(1, e))
            },
            max(e, t) {
                return this.check(nk(e, t))
            },
            length(e, t) {
                return this.check(nA(e, t))
            },
            unwrap() {
                return this.element
            }
        }),
        rJ = em("ZodObject", (e, t) => {
            var n;
            let r, i;
            rl(), t0.init(e, t), rc.init(e, t), e._zod.processJSONSchema = (t, n, r) => ((e, t, n, r) => {
                var i;
                let o = e._zod.def,
                    a = o.shape;
                if (Object.getOwnPropertySymbols(a).length && nx(e, t, n, r, "Symbol keys cannot be represented in JSON Schema")) return;
                for (let e in n.type = "object", n.properties = {}, a) j(n.properties, e, nP(a[e], t, {
                    ...r,
                    path: [...r.path, "properties", e]
                }));
                let u = [];
                for (let e of Object.keys(a)) {
                    let n = o.shape[e];
                    ("input" === t.io ? void 0 === n1(n) : void 0 === n._zod.optout) && u.push(e)
                }
                u.length > 0 && (n.required = u), (null == (i = o.catchall) ? void 0 : i._zod.def.type) === "never" ? n.additionalProperties = !1 : o.catchall ? o.catchall && (n.additionalProperties = nP(o.catchall, t, {
                    ...r,
                    path: [...r.path, "additionalProperties"]
                })) : "output" === t.io && (n.additionalProperties = !1)
            })(e, t, n, r), (i = (n = "shape") in(r = Object.getPrototypeOf(e)) ? void 0 : r) && Object.defineProperty(i, n, {
                configurable: !0,
                get() {
                    let e = {
                        configurable: !0,
                        writable: !0,
                        enumerable: !1,
                        value: void 0
                    };
                    return Object.defineProperty(this, n, e), e.value = this._zod.def.shape, Object.defineProperty(this, n, e), e.value
                },
                set(e) {
                    Object.defineProperty(this, n, {
                        configurable: !0,
                        writable: !0,
                        enumerable: !1,
                        value: e
                    })
                }
            })
        }, {
            keyof() {
                var e;
                return new rK({
                    type: "enum",
                    entries: Array.isArray(e = Object.keys(this._zod.def.shape)) ? Object.fromEntries(e.map(e => [e, e])) : e,
                    ...K(void 0)
                })
            },
            catchall(e) {
                return this.clone(D(this._zod.def, {
                    catchall: e
                }))
            },
            passthrough() {
                return this.clone(D(this._zod.def, {
                    catchall: rN()
                }))
            },
            loose() {
                return this.clone(D(this._zod.def, {
                    catchall: rN()
                }))
            },
            strict() {
                return this.clone(D(this._zod.def, {
                    catchall: new rL({
                        type: "never",
                        ...K(void 0)
                    })
                }))
            },
            strip() {
                return this.clone(D(this._zod.def, {
                    catchall: void 0
                }))
            },
            extend(e) {
                if (!J(e)) throw Error("Invalid input to extend: expected a plain object");
                let t = this._zod.def.checks;
                if (t && t.length > 0) {
                    let t = I(this);
                    for (let n of Reflect.ownKeys(e))
                        if (void 0 !== Object.getOwnPropertyDescriptor(t, n)) throw Error("Cannot overwrite keys on object schemas containing refinements. Use `.safeExtend()` instead.")
                }
                return H(this, D(this._zod.def, {
                    shape: Y(this, e)
                }))
            },
            safeExtend(e) {
                if (!J(e)) throw Error("Invalid input to safeExtend: expected a plain object");
                return H(this, D(this._zod.def, {
                    shape: Y(this, e)
                }))
            },
            merge(e) {
                var t, n, r;
                if (!(null == e || null == (n = e._zod) ? void 0 : n.def)) throw Error("Invalid input to merge: expected an object schema. To merge a plain shape, use `.extend()`.");
                if (null == (r = this._zod.def.checks) ? void 0 : r.length) throw Error(".merge() cannot be used on object schemas containing refinements. Use .safeExtend() instead.");
                let i = {};
                return Z(i, this, Reflect.ownKeys(I(this))), Z(i, e, Reflect.ownKeys(I(e))), H(this, D(this._zod.def, {
                    shape: i,
                    get catchall() {
                        return e._zod.def.catchall
                    },
                    checks: null != (t = e._zod.def.checks) ? t : []
                }))
            },
            pick(e) {
                return function(e, t) {
                    let n = e._zod.def,
                        r = n.checks;
                    if (r && r.length > 0) throw Error(".pick() cannot be used on object schemas containing refinements");
                    let i = {};
                    return Z(i, e, X(e, t)), H(e, D(n, {
                        shape: i,
                        checks: []
                    }))
                }(this, e)
            },
            omit(e) {
                return function(e, t) {
                    let n = e._zod.def,
                        r = n.checks;
                    if (r && r.length > 0) throw Error(".omit() cannot be used on object schemas containing refinements");
                    let i = new Set(X(e, t)),
                        o = {};
                    return Z(o, e, Reflect.ownKeys(I(e)).filter(e => !i.has(e))), H(e, D(n, {
                        shape: o,
                        checks: []
                    }))
                }(this, e)
            },
            partial() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return Q(rq, this, t[0])
            },
            exactPartial() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return Q(rX, this, t[0], "exactPartial")
            },
            required() {
                let e, t;
                for (var n, r = arguments.length, i = Array(r), o = 0; o < r; o++) i[o] = arguments[o];
                return e = (n = i[0]) ? new Set(X(this, n)) : void 0, Z(t = {}, this, Reflect.ownKeys(I(this)), (t, n) => e && !e.has(n) ? t : new r2({
                    type: "nonoptional",
                    innerType: t
                })), H(this, D(this._zod.def, {
                    shape: t
                }))
            }
        }),
        rU = em("ZodUnion", (e, t) => {
            t2.init(e, t), rc.init(e, t), e._zod.processJSONSchema = (t, n, r) => {
                let i, o, a;
                return o = !1 === (i = e._zod.def).inclusive, a = i.options.map((e, n) => nP(e, t, {
                    ...r,
                    path: [...r.path, o ? "oneOf" : "anyOf", n]
                })), void(o ? n.oneOf = a : n.anyOf = a)
            }, e.options = t.options
        }),
        rM = em("ZodIntersection", (e, t) => {
            t6.init(e, t), rc.init(e, t), e._zod.processJSONSchema = (t, n, r) => {
                let i, o, a, u, s;
                return o = nP((i = e._zod.def).left, t, {
                    ...r,
                    path: [...r.path, "allOf", 0]
                }), a = nP(i.right, t, {
                    ...r,
                    path: [...r.path, "allOf", 1]
                }), void(n.allOf = s = [...(u = e => "allOf" in e && 1 === Object.keys(e).length)(o) ? o.allOf : [o], ...u(a) ? a.allOf : [a]], t.intersections.push(s))
            }
        }),
        rV = em("ZodRecord", (e, t) => {
            rl(), t3.init(e, t), rc.init(e, t), e._zod.processJSONSchema = (t, n, r) => ((e, t, n, r) => {
                let i = e._zod.def;
                n.type = "object";
                let o = i.keyType,
                    a = nX(o).patterns;
                if ("loose" === i.mode && a && a.size > 0) {
                    let e = nP(i.valueType, t, {
                        ...r,
                        path: [...r.path, "patternProperties", "*"]
                    });
                    for (let t of (n.patternProperties = {}, a)) j(n.patternProperties, n0(t).source, e)
                } else {
                    if ("draft-07" === t.target || "draft-2020-12" === t.target) {
                        n.propertyNames = nP(i.keyType, t, {
                            ...r,
                            path: [...r.path, "propertyNames"]
                        });
                        let o = n2.get(t);
                        o || (o = [], n2.set(t, o), t.deferred.push(() => (function(e) {
                            var t, n, r;
                            let i = new Map;
                            for (let t of e.seen.values()) t.def && !i.has(t.schema) && i.set(t.schema, t);
                            let o = new Map;
                            for (let a of null != (t = n2.get(e)) ? t : []) {
                                let t = e.seen.get(a),
                                    u = null == (r = null != (n = null == t ? void 0 : t.def) ? n : null == t ? void 0 : t.schema) ? void 0 : r.propertyNames;
                                if (!u || !0 === u || o.has(u)) continue;
                                let s = function e(t, n, r) {
                                    var i, o;
                                    if (n.$ref) {
                                        if (r.has(n)) return n;
                                        r.add(n);
                                        let i = null == (o = t.get(n)) ? void 0 : o.def;
                                        if (!i) return n;
                                        let a = e(t, i, r);
                                        return a === i ? n : a
                                    }
                                    for (let i of ["anyOf", "oneOf"]) {
                                        let o = n[i];
                                        if (!Array.isArray(o)) continue;
                                        let a = o.map(n => e(t, n, r));
                                        a.some((e, t) => e !== o[t]) && (n = {
                                            ...n,
                                            [i]: a
                                        })
                                    }
                                    let a = Array.isArray(n.type) ? n.type : [n.type],
                                        u = !a.includes("string") && a.some(e => "number" === e || "integer" === e),
                                        s = null != (i = n.enum) ? i : void 0 !== n.const ? [n.const] : void 0;
                                    if (!u && !(null == s ? void 0 : s.some(e => "number" == typeof e))) return n;
                                    let {
                                        minimum: l,
                                        maximum: c,
                                        exclusiveMinimum: d,
                                        exclusiveMaximum: f,
                                        multipleOf: p,
                                        format: h,
                                        id: m,
                                        ...v
                                    } = n;
                                    return v.enum ? v.enum = v.enum.map(e => "number" == typeof e ? String(e) : e) : "number" == typeof v.const && (v.const = String(v.const)), u && (v.type = "string", s || (v.pattern = (a.includes("number") ? e0 : eQ).source)), v
                                }(i, u, new Set);
                                s !== u && o.set(u, s)
                            }
                            if (o.size)
                                for (let t of e.seen.values())
                                    for (let e of [t.schema, t.def]) {
                                        let t = e && o.get(e.propertyNames);
                                        t && (e.propertyNames = t)
                                    }
                        })(t))), o.push(e)
                    }
                    n.additionalProperties = nP(i.valueType, t, {
                        ...r,
                        path: [...r.path, "additionalProperties"]
                    })
                }
                let u = o._zod.values,
                    s = "input" === t.io && void 0 !== n1(i.valueType);
                if (u && !i.partial && !s) {
                    let e = [...u].filter(e => "string" == typeof e || "number" == typeof e);
                    e.length > 0 && (n.required = e.map(String))
                }
            })(e, t, n, r), e.keyType = t.keyType, e.valueType = t.valueType
        });

    function rH(e, t, n) {
        return new rV(t && t._zod ? {
            type: "record",
            keyType: e,
            valueType: t,
            ...K(n)
        } : {
            type: "record",
            keyType: rp(),
            valueType: e,
            ...K(t)
        })
    }
    let rK = em("ZodEnum", (e, t) => {
            t4.init(e, t), rc.init(e, t), e._zod.processJSONSchema = (t, n, r) => ((e, t) => {
                let n = E(e._zod.def.entries);
                if (0 === n.length) {
                    t.not = {};
                    return
                }
                n.every(e => "number" == typeof e) && (t.type = "number"), n.every(e => "string" == typeof e) && (t.type = "string"), t.enum = n
            })(e, n), e.enum = t.entries, e.options = [...e._zod.values];
            let n = new Set(Object.keys(t.entries));
            e.extract = (e, r) => {
                let i = {};
                for (let r of e)
                    if (n.has(r)) i[r] = t.entries[r];
                    else throw Error("Key ".concat(r, " not found in enum"));
                return new rK({
                    ...t,
                    checks: [],
                    ...K(r),
                    entries: i
                })
            }, e.exclude = (e, r) => {
                let i = {
                    ...t.entries
                };
                for (let t of e)
                    if (n.has(t)) delete i[t];
                    else throw Error("Key ".concat(t, " not found in enum"));
                return new rK({
                    ...t,
                    checks: [],
                    ...K(r),
                    entries: i
                })
            }
        }),
        rW = em("ZodTransform", (e, t) => {
            rl(), t5.init(e, t), rc.init(e, t), e._zod.processJSONSchema = (t, n, r) => {
                nx(e, t, n, r, "Transforms cannot be represented in JSON Schema")
            }, e._zod.parse = (n, r) => {
                if ("backward" === r.direction) throw new ey(e.constructor.name);
                n.addIssue = r => {
                    "string" == typeof r ? n.issues.push(es(r, n.value, t)) : (r.fatal && (r.continue = !1), null != r.code || (r.code = "custom"), "input" in r || (r.input = n.value), null != r.inst || (r.inst = e), n.issues.push(es(r)))
                };
                let i = t.transform(n.value, n);
                return i instanceof Promise ? i.then(e => (n.value = e, n)) : (n.value = i, n)
            }
        }),
        rq = em("ZodOptional", (e, t) => {
            t8.init(e, t), rc.init(e, t), e._zod.processJSONSchema = (t, n, r) => n3(e, t, n, r), e.unwrap = () => e._zod.def.innerType
        });

    function rG(e) {
        return new rq({
            type: "optional",
            innerType: e
        })
    }
    let rX = em("ZodExactOptional", (e, t) => {
            ne.init(e, t), rc.init(e, t), e._zod.processJSONSchema = (t, n, r) => n3(e, t, n, r), e.unwrap = () => e._zod.def.innerType
        }),
        rY = em("ZodNullable", (e, t) => {
            nt.init(e, t), rc.init(e, t), e._zod.processJSONSchema = (t, n, r) => {
                let i, o, a;
                return o = nP((i = e._zod.def).innerType, t, r), a = t.seen.get(e), void("openapi-3.0" === t.target ? (a.ref = i.innerType, n.nullable = !0) : n.anyOf = [o, {
                    type: "null"
                }])
            }, e.unwrap = () => e._zod.def.innerType
        });

    function rQ(e) {
        return new rY({
            type: "nullable",
            innerType: e
        })
    }
    let r0 = em("ZodDefault", (e, t) => {
            nn.init(e, t), rc.init(e, t), e._zod.processJSONSchema = (t, n, r) => {
                let i, o;
                return nP((i = e._zod.def).innerType, t, r), t.seen.get(e).ref = i.innerType, void((o = n9(i.defaultValue, e, t, n, r)) !== n6 && (n.default = o))
            }, e.unwrap = () => e._zod.def.innerType, e.removeDefault = e.unwrap
        }),
        r1 = em("ZodPrefault", (e, t) => {
            ni.init(e, t), rc.init(e, t), e._zod.processJSONSchema = (t, n, r) => ((e, t, n, r) => {
                let i = e._zod.def;
                if (nP(i.innerType, t, r), t.seen.get(e).ref = i.innerType, "input" !== t.io) return;
                let o = n9(i.defaultValue, e, t, n, r);
                o !== n6 && (n._prefault = o)
            })(e, t, n, r), e.unwrap = () => e._zod.def.innerType
        }),
        r2 = em("ZodNonOptional", (e, t) => {
            no.init(e, t), rc.init(e, t), e._zod.processJSONSchema = (t, n, r) => {
                let i;
                nP((i = e._zod.def).innerType, t, r), t.seen.get(e).ref = i.innerType
            }, e.unwrap = () => e._zod.def.innerType
        }),
        r6 = em("ZodCatch", (e, t) => {
            ns.init(e, t), rc.init(e, t), e._zod.processJSONSchema = (t, n, r) => ((e, t, n, r) => {
                let i, o = e._zod.def;
                nP(o.innerType, t, r), t.seen.get(e).ref = o.innerType;
                try {
                    i = o.catchValue(void 0)
                } catch (i) {
                    nx(e, t, n, r, "Dynamic catch values are not supported in JSON Schema");
                    return
                }
                n.default = i
            })(e, t, n, r), e.unwrap = () => e._zod.def.innerType, e.removeCatch = e.unwrap
        }),
        r9 = em("ZodPipe", (e, t) => {
            nl.init(e, t), rc.init(e, t), e._zod.processJSONSchema = (t, n, r) => {
                let i, o, a;
                return o = (i = e._zod.def).in._zod.traits.has("$ZodTransform"), void(nP(a = "input" === t.io ? o ? i.out : i.in : i.out, t, r), t.seen.get(e).ref = a)
            }, e.in = t.in, e.out = t.out
        });

    function r3(e, t) {
        return new r9({
            type: "pipe",
            in: e,
            out: t
        })
    }
    let r4 = em("ZodReadonly", (e, t) => {
            nd.init(e, t), rc.init(e, t), e._zod.processJSONSchema = (t, n, r) => {
                let i;
                nP((i = e._zod.def).innerType, t, r), t.seen.get(e).ref = i.innerType, n.readOnly = !0
            }, e.unwrap = () => e._zod.def.innerType
        }),
        r5 = em("ZodCustom", (e, t) => {
            np.init(e, t), rc.init(e, t), e._zod.processJSONSchema = (t, n, r) => {
                nx(e, t, n, r, "Custom types cannot be represented in JSON Schema")
            }
        }),
        r7 = {
            [_.English]: b.English,
            [_.Spanish]: b.Spanish,
            [_.French]: b.French,
            [_.German]: b.German,
            [_.Italian]: b.Italian,
            [_.BrazilPortuguese]: b.BrazilPortuguese,
            [_.Korean]: b.Korean,
            [_.SimplifiedChinese]: b.SimplifiedChinese,
            [_.SimplifiedChineseJV]: b.SimplifiedChineseJV,
            [_.TraditionalChinese]: b.TraditionalChinese,
            [_.Japanese]: b.Japanese,
            [_.Russian]: b.Russian,
            [_.Indonesian]: b.Indonesian,
            [_.Polish]: b.Polish,
            [_.Vietnamese]: b.Vietnamese,
            [_.Turkish]: b.Turkish,
            [_.Arabic]: b.Arabic,
            [_.Thai]: b.Thai,
            [_.Hindi]: b.Hindi,
            [_.Dutch]: b.Dutch
        },
        r8 = (b.English, _.English, b.Spanish, _.Spanish, b.French, _.French, b.German, _.German, b.Italian, _.Italian, b.BrazilPortuguese, _.BrazilPortuguese, b.Korean, _.Korean, b.SimplifiedChinese, _.SimplifiedChinese, b.SimplifiedChineseJV, _.SimplifiedChineseJV, b.TraditionalChinese, _.TraditionalChinese, b.Japanese, _.Japanese, b.Russian, _.Russian, b.Indonesian, _.Indonesian, b.Polish, _.Polish, b.Vietnamese, _.Vietnamese, b.Turkish, _.Turkish, b.Arabic, _.Arabic, b.Thai, _.Thai, b.Hindi, _.Hindi, b.Dutch, _.Dutch, {
            [_.English]: F.English,
            [_.Spanish]: F.Spanish,
            [_.French]: F.French,
            [_.German]: F.German,
            [_.Italian]: F.Italian,
            [_.BrazilPortuguese]: F.BrazilPortuguese,
            [_.Korean]: F.Korean,
            [_.SimplifiedChinese]: F.SimplifiedChinese,
            [_.SimplifiedChineseJV]: F.SimplifiedChineseJV,
            [_.TraditionalChinese]: F.TraditionalChinese,
            [_.Japanese]: F.Japanese,
            [_.Russian]: F.Russian,
            [_.Indonesian]: F.Indonesian,
            [_.Polish]: F.Polish,
            [_.Vietnamese]: F.Vietnamese,
            [_.Turkish]: F.Turkish,
            [_.Arabic]: F.Arabic,
            [_.Thai]: F.Thai,
            [_.Hindi]: F.Hindi,
            [_.Dutch]: F.Dutch
        }),
        ie = (b.English, F.English, b.Spanish, F.Spanish, b.French, F.French, b.German, F.German, b.Italian, F.Italian, b.BrazilPortuguese, F.BrazilPortuguese, b.Korean, F.Korean, b.SimplifiedChinese, F.SimplifiedChinese, b.SimplifiedChineseJV, F.SimplifiedChineseJV, b.TraditionalChinese, F.TraditionalChinese, b.Japanese, F.Japanese, b.Russian, F.Russian, b.Indonesian, F.Indonesian, b.Polish, F.Polish, b.Vietnamese, F.Vietnamese, b.Turkish, F.Turkish, b.Arabic, F.Arabic, b.Thai, F.Thai, b.Hindi, F.Hindi, b.Dutch, F.Dutch, /^(\w+)_(\w+)$/),
        it = /^(\w+)-(\w+)$/,
        ir = rH(rp(), new rJ({
            type: "object",
            shape: (d = {
                localizedString: rp()
            }, d),
            ...K(void 0)
        }).nullable().catch(null)),
        ii = rH(rp(), rp().nullable().catch(null)),
        io = /{(.+?)}/,
        ia = /{(.+?)}/g,
        iu = /({.+?})/g;

    function is(e) {
        return (0, g.createElement)(g.Fragment, null, ...e.map(e => "string" == typeof e || "number" == typeof e ? (0, g.createElement)("span", {
            style: {
                display: "contents"
            }
        }, e) : e))
    }
    let il = e => void 0 !== e ? Object.entries(e).reduce((e, t) => {
        let [n, r] = t;
        return "string" == typeof r ? Object.assign(e.stringArgs, {
            [n]: r
        }) : Object.assign(e.htmlArgs, {
            [n]: r
        }), e
    }, {
        stringArgs: {},
        htmlArgs: {}
    }) : {};

    function ic(e, t) {
        return void 0 !== t && 0 !== Object.keys(t).length ? e.replace(ia, (e, n) => {
            var r;
            return null != (r = t[n]) ? r : "{".concat(n, "}")
        }) : e
    }

    function id(e, t, n, r, i, o) {
        let a, u = e.split(iu);
        if (1 === u.length) return e;
        if (u = u.filter(e => !!e), void 0 !== o && 0 !== Object.keys(o).length) {
            let e = u.reduce((e, t, n) => {
                if ("string" != typeof t) return e;
                let r = io.exec(t);
                if (r) {
                    let t = r[1];
                    if (Object.hasOwn(o, t)) {
                        let r = e[t];
                        if (!r) return Object.assign(e, {
                            [t]: [n]
                        });
                        r.push(n)
                    }
                }
                return e
            }, {});
            Object.entries(o).forEach(t => {
                let [n, r] = t;
                if (Object.hasOwn(e, n))
                    for (let t of e[n]) u[t] = r
            })
        }
        if (!Array.isArray(i) || 0 === i.length) return is(u);
        let s = i.reduce((e, t) => {
                let {
                    opening: n,
                    closing: r,
                    content: i
                } = t;
                return Object.assign(e, {
                    ["{".concat(n, "}")]: {
                        match: "{".concat(r, "}"),
                        content: i
                    }
                })
            }, {}),
            l = [],
            c = [],
            d = [];
        for (; a = u.shift();)
            if ("string" == typeof a && io.test(a))
                if (Object.hasOwn(s, a)) c.push(a), d.push(a);
                else {
                    let e = c.pop();
                    if (void 0 !== e) {
                        let {
                            match: i,
                            content: o
                        } = s[e];
                        if (a === i) {
                            let i, a = [];
                            for (; i = d.pop();)
                                if (i !== e) a.unshift(i);
                                else {
                                    let e = o(is(a));
                                    0 === d.length ? l.push(e) : d.push(e);
                                    break
                                } if (void 0 === i) {
                                console.warn("[From context - ".concat(n, "] Unexpected condition encountered inside translateHTML for key ").concat(t, " of locale ").concat(r, "!"));
                                break
                            }
                        } else {
                            console.warn("[From context - ".concat(n, "] Unmatched closing tag ").concat(a, " encountered inside translateHTML for key ").concat(t, " of locale ").concat(r, "!"));
                            break
                        }
                    } else {
                        console.warn("[From context - ".concat(n, "] Unexpected condition encountered inside translateHTML for key ").concat(t, " of locale ").concat(r, "!"));
                        break
                    }
                }
        else 0 === d.length ? l.push(a) : d.push(a);
        return is(l)
    }

    function ip() {
        let e = (0, g.useContext)(w),
            {
                key: t = "Unknown",
                resources: n,
                ready: r
            } = (0, g.useContext)(k),
            i = (0, g.useCallback)((r, i) => {
                if (void 0 === e) return console.warn("Localization context is missing, useTranslation cannot work outside of the LocalizationProvider"), "";
                let {
                    localeInfo: o
                } = e;
                if (null !== n) {
                    let e;
                    for (let t of Object.values(n)) Object.hasOwn(t, r) && (e = t[r]);
                    if (void 0 !== e) {
                        if (null != e) return ic(e, i);
                        console.warn("[From context - ".concat(t, "] The translation of key '").concat(r, "' for locale '").concat(o.locale, "' does not exist!"))
                    } else console.warn("[From context - ".concat(t, "] The translation key '").concat(r, "' doesn't exist for locale '").concat(o.locale, "'!"))
                }
                return ""
            }, [e, t, n]),
            o = (0, g.useCallback)((r, i, o) => {
                if (void 0 === e) return console.warn("Localization context is missing, useTranslation cannot work outside of the LocalizationProvider"), "";
                let {
                    localeInfo: a
                } = e;
                if (null !== n) {
                    let e = n[r];
                    if (void 0 !== e && Object.hasOwn(e, i)) {
                        let n = e[i];
                        if (null != n) return ic(n, o);
                        console.warn("[From context - ".concat(t, "] The translation of key '").concat(r, "::").concat(i, "' for locale '").concat(a.locale, "' does not exist!"))
                    } else console.warn("[From context - ".concat(t, "] The translation key '").concat(r, "::").concat(i, "' doesn't exist for locale '").concat(a.locale, "'!"))
                }
                return ""
            }, [e, t, n]),
            a = (0, g.useCallback)((n, r, o) => {
                if (void 0 === e) return console.warn("Localization context is missing, useTranslation cannot work outside of the LocalizationProvider"), "";
                let {
                    localeInfo: a
                } = e;
                if (void 0 === r && void 0 === o) return i(n);
                let {
                    stringArgs: u,
                    htmlArgs: s
                } = il(o), l = i(n, u);
                return l ? id(l, n, t, a.locale, r, s) : l
            }, [e, t, i]),
            u = (0, g.useCallback)((n, r, i, a) => {
                if (void 0 === e) return console.warn("Localization context is missing, useTranslation cannot work outside of the LocalizationProvider"), "";
                let {
                    localeInfo: u
                } = e;
                if (void 0 === i && void 0 === a) return o(n, r);
                let {
                    stringArgs: s,
                    htmlArgs: l
                } = il(a), c = o(n, r, s);
                return c ? id(c, r, t, u.locale, i, l) : c
            }, [e, t, o]);
        return (0, g.useMemo)(() => ({
            ready: r,
            translate: i,
            translateWithNamespace: o,
            translateHTML: a,
            translateWithNamespaceHTML: u
        }), [r, i, o, a, u])
    }
    let ih = e => {
        let {
            namespace: t,
            translationKey: n,
            args: r,
            fallback: i = null
        } = e, {
            translateWithNamespace: o,
            ready: a
        } = ip(), u = (a ? o(t, n, r) : "") || i;
        return "string" == typeof u || "number" == typeof u || "bigint" == typeof u ? "" === u ? null : g.default.createElement("span", null, u) : u
    };
    e.s(["d", 0, class extends A {
        loadRuntimeLocaleInfo() {
            var e, t;
            return null != (e = null == (t = this.runtimeLocaleInfoLoader) ? void 0 : t.call(this)) ? e : Promise.resolve(this.defaultLocaleInfo)
        }
        async fetchTranslationResource(e, t) {
            let n = t.replace(it, (e, t, n) => "".concat(t.toLowerCase(), "_").concat(n.toLowerCase())),
                r = "https://translations-cdn.".concat(this.cdnDomain, "/").concat(this.consumerId, "/latest/").concat(n, "/").concat(e, ".json"),
                i = Object.fromEntries(Object.entries(ir.parse(await fetch(r).then(e => e.json()))).map(e => {
                    var t;
                    let [n, r] = e;
                    return [n, null != (t = null == r ? void 0 : r.localizedString) ? t : null]
                }));
            if (!this.useLocalOverrides) return i;
            let o = await this.loadLocalOverrides(e, t);
            return {
                ...i,
                ...o
            }
        }
        async loadLocalOverrides(e, t) {
            try {
                let n = await fetch("".concat(this.localOverridesPath, "/").concat(t, "/").concat(e, ".json"));
                if (!n.ok) return {};
                return ii.parse(await n.json())
            } catch (e) {
                return {}
            }
        }
        constructor(e, {
            cdnDomain: t = "roblox.com",
            consumerId: n = 10,
            fallbackLocale: r,
            localOverridesPath: i = "/locales",
            useLocalOverrides: o = !1
        } = {}) {
            super(e, r), (0, y._)(this, "cdnDomain", void 0), (0, y._)(this, "consumerId", void 0), (0, y._)(this, "runtimeLocaleInfoLoader", void 0), (0, y._)(this, "localOverridesPath", void 0), (0, y._)(this, "useLocalOverrides", void 0), this.cdnDomain = t, this.consumerId = n, this.localOverridesPath = i, this.useLocalOverrides = o
        }
    }, "v", 0, _, "N", 0, e => {
        let {
            provider: t,
            children: n
        } = e, [r, i] = (0, g.useState)(!1), [o, a] = (0, g.useState)(t.defaultLocaleInfo), u = (0, g.useMemo)(() => ({
            ready: r,
            localeInfo: o,
            setLocaleInfo: a
        }), [r, o]), s = (0, g.useMemo)(() => ({
            provider: t
        }), [t]);
        return (0, g.useEffect)(() => {
            !async function() {
                try {
                    let {
                        locale: e,
                        nativeName: n
                    } = await t.loadRuntimeLocaleInfo();
                    a({
                        locale: e,
                        nativeName: n
                    })
                } catch (e) {
                    console.warn("Failed to load runtime locale info, fallback to default locale info")
                } finally {
                    i(!0)
                }
            }()
        }, [t]), g.default.createElement(w.Provider, {
            value: u
        }, g.default.createElement(z.Provider, {
            value: s
        }, n))
    }, "O", 0, F, "c", 0, function(e) {
        let {
            namespace: t,
            translationKey: n,
            args: r,
            fallback: i
        } = e, {
            provider: o
        } = (0, g.useContext)(z), a = (0, g.useContext)(w), [u, s] = (0, g.useState)(null);
        (0, g.useEffect)(() => {
            if (null === o || !(null == a ? void 0 : a.ready)) return;
            let {
                localeInfo: {
                    locale: e
                }
            } = a;
            o.loadTranslationResources([t], e).then(e => {
                s(O(e, [t]))
            })
        }, [a, o, t]);
        let l = (0, g.useMemo)(() => ({
            key: "Translate-".concat(t),
            resources: u,
            ready: null !== u
        }), [t, u]);
        return null === o ? g.default.createElement(ih, {
            namespace: t,
            translationKey: n,
            args: r,
            fallback: i
        }) : g.default.createElement(k.Provider, {
            value: l
        }, g.default.createElement(ih, {
            namespace: t,
            translationKey: n,
            args: r,
            fallback: i
        }))
    }, "a", 0, e => e.replace(ie, (e, t, n) => "".concat(t.toLowerCase(), "-").concat(n.toUpperCase())), "t", 0, e => r8[e], "f", 0, e => r7[e], "z", 0, function() {
        let e = (0, g.useContext)(w),
            t = (0, g.useMemo)(() => {
                if (void 0 !== e) {
                    let {
                        localeInfo: {
                            locale: t,
                            nativeName: n
                        },
                        setLocaleInfo: r
                    } = e;
                    return {
                        locale: t,
                        nativeName: n,
                        setLocaleInfo: r
                    }
                }
                return {
                    locale: null,
                    nativeName: null,
                    setLocaleInfo: e => {}
                }
            }, [e]);
        return void 0 === e && console.warn("Localization context is missing, useLocalization cannot work outside of the LocalizationProvider"), t
    }, "A", 0, ip, "I", 0, function(e) {
        let {
            ready: t,
            translateWithNamespace: n,
            translateWithNamespaceHTML: r
        } = ip(), i = (0, g.useCallback)((t, r) => n(e, t, r), [e, n]), o = (0, g.useCallback)((t, n, i) => r(e, t, n, i), [e, r]);
        return (0, g.useMemo)(() => ({
            ready: t,
            translate: i,
            translateHTML: o
        }), [t, i, o])
    }, "K", 0, function(e, t) {
        var n, r;
        let i = null != (n = null != (r = e.displayName) ? r : e.name) ? n : "Component",
            o = n => {
                let r = (0, g.useContext)(w),
                    {
                        provider: o
                    } = (0, g.useContext)(z),
                    [a, u] = (0, g.useState)(() => {
                        let e = null;
                        if ((null == r ? void 0 : r.ready) && null !== o) {
                            let {
                                localeInfo: {
                                    locale: n
                                }
                            } = r, i = o.getTranslationResources(t, n);
                            null !== i && (e = O(i, t))
                        } else void 0 === r && console.warn("Localization context is missing, withTranslation cannot work outside of the LocalizationProvider"), null === o && console.warn("TranslationResourceProvider context is missing, withTranslation cannot work outside of the TranslationResourceProvider");
                        return e
                    }),
                    s = (0, g.useMemo)(() => ({
                        key: i,
                        resources: a,
                        ready: null !== a
                    }), [a]);
                return (0, g.useEffect)(() => {
                    if ((null == r ? void 0 : r.ready) && null !== o) {
                        let {
                            localeInfo: {
                                locale: e
                            }
                        } = r;
                        o.loadTranslationResources(t, e).then(e => {
                            u(O(e, t))
                        })
                    }
                }, [r, o]), g.default.createElement(k.Provider, {
                    value: s
                }, g.default.createElement(e, n))
            };
        return o.displayName = "WithTranslation(".concat(i, ")"), o
    }])
}]);

//# debugId=c73893f2-61b4-2f8f-b4d7-622a3daeb665
//# sourceMappingURL=31zdzdbw40yc1.js.map