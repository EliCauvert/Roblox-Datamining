;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "aa44d9c2-68fc-d788-4e70-c5b478899afc")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 721281, t => {
    "use strict";
    t.s(["_", 0, function(t, n, r) {
        return n in t ? Object.defineProperty(t, n, {
            value: r,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : t[n] = r, t
    }])
}, 975380, (t, n, r) => {
    var i = {
            156: function(t) {
                var n, r, i, o = t.exports = {};

                function a() {
                    throw Error("setTimeout has not been defined")
                }

                function u() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    n = "function" == typeof setTimeout ? setTimeout : a
                } catch (t) {
                    n = a
                }
                try {
                    r = "function" == typeof clearTimeout ? clearTimeout : u
                } catch (t) {
                    r = u
                }

                function s(t) {
                    if (n === setTimeout) return setTimeout(t, 0);
                    if ((n === a || !n) && setTimeout) return n = setTimeout, setTimeout(t, 0);
                    try {
                        return n(t, 0)
                    } catch (r) {
                        try {
                            return n.call(null, t, 0)
                        } catch (r) {
                            return n.call(this, t, 0)
                        }
                    }
                }
                var l = [],
                    c = !1,
                    d = -1;

                function f() {
                    c && i && (c = !1, i.length ? l = i.concat(l) : d = -1, l.length && p())
                }

                function p() {
                    if (!c) {
                        var t = s(f);
                        c = !0;
                        for (var n = l.length; n;) {
                            for (i = l, l = []; ++d < n;) i && i[d].run();
                            d = -1, n = l.length
                        }
                        i = null, c = !1,
                            function(t) {
                                if (r === clearTimeout) return clearTimeout(t);
                                if ((r === u || !r) && clearTimeout) return r = clearTimeout, clearTimeout(t);
                                try {
                                    r(t)
                                } catch (n) {
                                    try {
                                        return r.call(null, t)
                                    } catch (n) {
                                        return r.call(this, t)
                                    }
                                }
                            }(t)
                    }
                }

                function h(t, n) {
                    this.fun = t, this.array = n
                }

                function m() {}
                o.nextTick = function(t) {
                    var n = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var r = 1; r < arguments.length; r++) n[r - 1] = arguments[r];
                    l.push(new h(t, n)), 1 !== l.length || c || s(p)
                }, h.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, o.title = "browser", o.browser = !0, o.env = {}, o.argv = [], o.version = "", o.versions = {}, o.on = m, o.addListener = m, o.once = m, o.off = m, o.removeListener = m, o.removeAllListeners = m, o.emit = m, o.prependListener = m, o.prependOnceListener = m, o.listeners = function(t) {
                    return []
                }, o.binding = function(t) {
                    throw Error("process.binding is not supported")
                }, o.cwd = function() {
                    return "/"
                }, o.chdir = function(t) {
                    throw Error("process.chdir is not supported")
                }, o.umask = function() {
                    return 0
                }
            }
        },
        o = {};

    function a(t) {
        var n = o[t];
        if (void 0 !== n) return n.exports;
        var r = o[t] = {
                exports: {}
            },
            u = !0;
        try {
            i[t](r, r.exports, a), u = !1
        } finally {
            u && delete o[t]
        }
        return r.exports
    }
    a.ab = "/ROOT/node_modules/.pnpm/next@16.3.0_@babel+core@7.29.0_supports-color@8.1.1__@opentelemetry+api@1.9.1_@playwrig_2bf1aa2500abc393a8e8c0b283d26d6e/node_modules/next/dist/compiled/process/", n.exports = a(156)
}, 92794, (t, n, r) => {
    "use strict";
    var i, o;
    n.exports = (null == (i = t.g.process) ? void 0 : i.env) && "object" == typeof(null == (o = t.g.process) ? void 0 : o.env) ? t.g.process : t.r(975380)
}, 302233, (t, n, r) => {
    "use strict";
    var i = Symbol.for("react.transitional.element");

    function o(t, n, r) {
        var o = null;
        if (void 0 !== r && (o = "" + r), void 0 !== n.key && (o = "" + n.key), "key" in n)
            for (var a in r = {}, n) "key" !== a && (r[a] = n[a]);
        else r = n;
        return {
            $$typeof: i,
            type: t,
            key: o,
            ref: void 0 !== (n = r.ref) ? n : null,
            props: r
        }
    }
    r.Fragment = Symbol.for("react.fragment"), r.jsx = o, r.jsxs = o
}, 221628, (t, n, r) => {
    "use strict";
    n.exports = t.r(302233)
}, 71316, (t, n, r) => {
    "use strict";
    var i = t.i(92794),
        o = Symbol.for("react.transitional.element"),
        a = Symbol.for("react.portal"),
        u = Symbol.for("react.fragment"),
        s = Symbol.for("react.strict_mode"),
        l = Symbol.for("react.profiler"),
        c = Symbol.for("react.consumer"),
        d = Symbol.for("react.context"),
        f = Symbol.for("react.forward_ref"),
        p = Symbol.for("react.suspense"),
        h = Symbol.for("react.memo"),
        m = Symbol.for("react.lazy"),
        v = Symbol.for("react.activity"),
        y = Symbol.iterator,
        g = {
            isMounted: function() {
                return !1
            },
            enqueueForceUpdate: function() {},
            enqueueReplaceState: function() {},
            enqueueSetState: function() {}
        },
        _ = Object.assign,
        b = {};

    function F(t, n, r) {
        this.props = t, this.context = n, this.refs = b, this.updater = r || g
    }

    function w() {}

    function z(t, n, r) {
        this.props = t, this.context = n, this.refs = b, this.updater = r || g
    }
    F.prototype.isReactComponent = {}, F.prototype.setState = function(t, n) {
        if ("object" != typeof t && "function" != typeof t && null != t) throw Error("takes an object of state variables to update or a function which returns an object of state variables.");
        this.updater.enqueueSetState(this, t, n, "setState")
    }, F.prototype.forceUpdate = function(t) {
        this.updater.enqueueForceUpdate(this, t, "forceUpdate")
    }, w.prototype = F.prototype;
    var k = z.prototype = new w;
    k.constructor = z, _(k, F.prototype), k.isPureReactComponent = !0;
    var O = Array.isArray;

    function A() {}
    var E = {
            H: null,
            A: null,
            T: null,
            S: null
        },
        S = Object.prototype.hasOwnProperty;

    function T(t, n, r) {
        var i = r.ref;
        return {
            $$typeof: o,
            type: t,
            key: n,
            ref: void 0 !== i ? i : null,
            props: r
        }
    }

    function x(t) {
        return "object" == typeof t && null !== t && t.$$typeof === o
    }
    var P = /\/+/g;

    function j(t, n) {
        var r, i;
        return "object" == typeof t && null !== t && null != t.key ? (r = "" + t.key, i = {
            "=": "=0",
            ":": "=2"
        }, "$" + r.replace(/[=:]/g, function(t) {
            return i[t]
        })) : n.toString(36)
    }

    function C(t, n, r) {
        if (null == t) return t;
        var i = [],
            u = 0;
        return ! function t(n, r, i, u, s) {
            var l, c, d, f = typeof n;
            ("undefined" === f || "boolean" === f) && (n = null);
            var p = !1;
            if (null === n) p = !0;
            else switch (f) {
                case "bigint":
                case "string":
                case "number":
                    p = !0;
                    break;
                case "object":
                    switch (n.$$typeof) {
                        case o:
                        case a:
                            p = !0;
                            break;
                        case m:
                            return t((p = n._init)(n._payload), r, i, u, s)
                    }
            }
            if (p) return s = s(n), p = "" === u ? "." + j(n, 0) : u, O(s) ? (i = "", null != p && (i = p.replace(P, "$&/") + "/"), t(s, r, i, "", function(t) {
                return t
            })) : null != s && (x(s) && (l = s, c = i + (null == s.key || n && n.key === s.key ? "" : ("" + s.key).replace(P, "$&/") + "/") + p, s = T(l.type, c, l.props)), r.push(s)), 1;
            p = 0;
            var h = "" === u ? "." : u + ":";
            if (O(n))
                for (var v = 0; v < n.length; v++) f = h + j(u = n[v], v), p += t(u, r, i, f, s);
            else if ("function" == typeof(v = null === (d = n) || "object" != typeof d ? null : "function" == typeof(d = y && d[y] || d["@@iterator"]) ? d : null))
                for (n = v.call(n), v = 0; !(u = n.next()).done;) f = h + j(u = u.value, v++), p += t(u, r, i, f, s);
            else if ("object" === f) {
                if ("function" == typeof n.then) return t(function(t) {
                    switch (t.status) {
                        case "fulfilled":
                            return t.value;
                        case "rejected":
                            throw t.reason;
                        default:
                            switch ("string" == typeof t.status ? t.then(A, A) : (t.status = "pending", t.then(function(n) {
                                    "pending" === t.status && (t.status = "fulfilled", t.value = n)
                                }, function(n) {
                                    "pending" === t.status && (t.status = "rejected", t.reason = n)
                                })), t.status) {
                                case "fulfilled":
                                    return t.value;
                                case "rejected":
                                    throw t.reason
                            }
                    }
                    throw t
                }(n), r, i, u, s);
                throw Error("Objects are not valid as a React child (found: " + ("[object Object]" === (r = String(n)) ? "object with keys {" + Object.keys(n).join(", ") + "}" : r) + "). If you meant to render a collection of children, use an array instead.")
            }
            return p
        }(t, i, "", "", function(t) {
            return n.call(r, t, u++)
        }), i
    }

    function I(t) {
        if (-1 === t._status) {
            var n = t._result;
            (n = n()).then(function(n) {
                (0 === t._status || -1 === t._status) && (t._status = 1, t._result = n)
            }, function(n) {
                (0 === t._status || -1 === t._status) && (t._status = 2, t._result = n)
            }), -1 === t._status && (t._status = 0, t._result = n)
        }
        if (1 === t._status) return t._result.default;
        throw t._result
    }
    var $ = "function" == typeof reportError ? reportError : function(t) {
        if ("object" == typeof window && "function" == typeof window.ErrorEvent) {
            var n = new window.ErrorEvent("error", {
                bubbles: !0,
                cancelable: !0,
                message: "object" == typeof t && null !== t && "string" == typeof t.message ? String(t.message) : String(t),
                error: t
            });
            if (!window.dispatchEvent(n)) return
        } else if ("object" == typeof i.default && "function" == typeof i.default.emit) return void i.default.emit("uncaughtException", t);
        console.error(t)
    };
    r.Activity = v, r.Children = {
        map: C,
        forEach: function(t, n, r) {
            C(t, function() {
                n.apply(this, arguments)
            }, r)
        },
        count: function(t) {
            var n = 0;
            return C(t, function() {
                n++
            }), n
        },
        toArray: function(t) {
            return C(t, function(t) {
                return t
            }) || []
        },
        only: function(t) {
            if (!x(t)) throw Error("React.Children.only expected to receive a single React element child.");
            return t
        }
    }, r.Component = F, r.Fragment = u, r.Profiler = l, r.PureComponent = z, r.StrictMode = s, r.Suspense = p, r.__CLIENT_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE = E, r.__COMPILER_RUNTIME = {
        __proto__: null,
        c: function(t) {
            return E.H.useMemoCache(t)
        }
    }, r.cache = function(t) {
        return function() {
            return t.apply(null, arguments)
        }
    }, r.cacheSignal = function() {
        return null
    }, r.cloneElement = function(t, n, r) {
        if (null == t) throw Error("The argument must be a React element, but you passed " + t + ".");
        var i = _({}, t.props),
            o = t.key;
        if (null != n)
            for (a in void 0 !== n.key && (o = "" + n.key), n) S.call(n, a) && "key" !== a && "__self" !== a && "__source" !== a && ("ref" !== a || void 0 !== n.ref) && (i[a] = n[a]);
        var a = arguments.length - 2;
        if (1 === a) i.children = r;
        else if (1 < a) {
            for (var u = Array(a), s = 0; s < a; s++) u[s] = arguments[s + 2];
            i.children = u
        }
        return T(t.type, o, i)
    }, r.createContext = function(t) {
        return (t = {
            $$typeof: d,
            _currentValue: t,
            _currentValue2: t,
            _threadCount: 0,
            Provider: null,
            Consumer: null
        }).Provider = t, t.Consumer = {
            $$typeof: c,
            _context: t
        }, t
    }, r.createElement = function(t, n, r) {
        var i, o = {},
            a = null;
        if (null != n)
            for (i in void 0 !== n.key && (a = "" + n.key), n) S.call(n, i) && "key" !== i && "__self" !== i && "__source" !== i && (o[i] = n[i]);
        var u = arguments.length - 2;
        if (1 === u) o.children = r;
        else if (1 < u) {
            for (var s = Array(u), l = 0; l < u; l++) s[l] = arguments[l + 2];
            o.children = s
        }
        if (t && t.defaultProps)
            for (i in u = t.defaultProps) void 0 === o[i] && (o[i] = u[i]);
        return T(t, a, o)
    }, r.createRef = function() {
        return {
            current: null
        }
    }, r.forwardRef = function(t) {
        return {
            $$typeof: f,
            render: t
        }
    }, r.isValidElement = x, r.lazy = function(t) {
        return {
            $$typeof: m,
            _payload: {
                _status: -1,
                _result: t
            },
            _init: I
        }
    }, r.memo = function(t, n) {
        return {
            $$typeof: h,
            type: t,
            compare: void 0 === n ? null : n
        }
    }, r.startTransition = function(t) {
        var n = E.T,
            r = {};
        E.T = r;
        try {
            var i = t(),
                o = E.S;
            null !== o && o(r, i), "object" == typeof i && null !== i && "function" == typeof i.then && i.then(A, $)
        } catch (t) {
            $(t)
        } finally {
            null !== n && null !== r.types && (n.types = r.types), E.T = n
        }
    }, r.unstable_useCacheRefresh = function() {
        return E.H.useCacheRefresh()
    }, r.use = function(t) {
        return E.H.use(t)
    }, r.useActionState = function(t, n, r) {
        return E.H.useActionState(t, n, r)
    }, r.useCallback = function(t, n) {
        return E.H.useCallback(t, n)
    }, r.useContext = function(t) {
        return E.H.useContext(t)
    }, r.useDebugValue = function() {}, r.useDeferredValue = function(t, n) {
        return E.H.useDeferredValue(t, n)
    }, r.useEffect = function(t, n) {
        return E.H.useEffect(t, n)
    }, r.useEffectEvent = function(t) {
        return E.H.useEffectEvent(t)
    }, r.useId = function() {
        return E.H.useId()
    }, r.useImperativeHandle = function(t, n, r) {
        return E.H.useImperativeHandle(t, n, r)
    }, r.useInsertionEffect = function(t, n) {
        return E.H.useInsertionEffect(t, n)
    }, r.useLayoutEffect = function(t, n) {
        return E.H.useLayoutEffect(t, n)
    }, r.useMemo = function(t, n) {
        return E.H.useMemo(t, n)
    }, r.useOptimistic = function(t, n) {
        return E.H.useOptimistic(t, n)
    }, r.useReducer = function(t, n, r) {
        return E.H.useReducer(t, n, r)
    }, r.useRef = function(t) {
        return E.H.useRef(t)
    }, r.useState = function(t) {
        return E.H.useState(t)
    }, r.useSyncExternalStore = function(t, n, r) {
        return E.H.useSyncExternalStore(t, n, r)
    }, r.useTransition = function() {
        return E.H.useTransition()
    }, r.version = "19.2.6"
}, 416340, (t, n, r) => {
    "use strict";
    n.exports = t.r(71316)
}, 79187, t => {
    "use strict";
    let n, r, i, o, a, u, s, l, c, d;
    var f, p, h, m, v, y, g = t.i(721281),
        _ = t.i(416340),
        b = ((m = b || {}).English = "en-US", m.Spanish = "es-ES", m.French = "fr-FR", m.German = "de-DE", m.Italian = "it-IT", m.BrazilPortuguese = "pt-BR", m.Korean = "ko-KR", m.SimplifiedChinese = "zh-CN", m.SimplifiedChineseJV = "zh-CJV", m.TraditionalChinese = "zh-TW", m.Japanese = "ja-JP", m.Russian = "ru-RU", m.Indonesian = "id-ID", m.Polish = "pl-PL", m.Vietnamese = "vi-VN", m.Turkish = "tr-TR", m.Arabic = "ar-001", m.Thai = "th-TH", m.Hindi = "hi-IN", m),
        F = ((p = F || {}).English = "en_us", p.Spanish = "es_es", p.French = "fr_fr", p.German = "de_de", p.Italian = "it_it", p.BrazilPortuguese = "pt_br", p.Korean = "ko_kr", p.SimplifiedChinese = "zh_cn", p.SimplifiedChineseJV = "zh_cjv", p.TraditionalChinese = "zh_tw", p.Japanese = "ja_jp", p.Russian = "ru_ru", p.Indonesian = "id_id", p.Polish = "pl_pl", p.Vietnamese = "vi_vn", p.Turkish = "tr_tr", p.Arabic = "ar_001", p.Thai = "th_th", p.Hindi = "hi_in", p),
        w = ((h = w || {}).English = "English", h.Spanish = "Español", h.French = "Français", h.German = "Deutsch", h.Italian = "Italiano", h.BrazilPortuguese = "Português (Brasil)", h.Korean = "한국어", h.SimplifiedChinese = "中文(简体)", h.SimplifiedChineseJV = "中文(简体)", h.TraditionalChinese = "中文(繁體)", h.Japanese = "日本語", h.Russian = "Русский", h.Indonesian = "Bahasa Indonesia", h.Polish = "Polski", h.Vietnamese = "Tiếng Việt", h.Turkish = "Türkçe", h.Arabic = "العربية", h.Thai = "ภาษาไทย", h.Hindi = "हिन्दी", h);
    let z = (0, _.createContext)(void 0);
    z.displayName = " Localization";
    let k = (0, _.createContext)({
        provider: null
    });
    k.displayName = "TranslationProvider";
    let O = (0, _.createContext)({
        resources: null,
        ready: !1
    });

    function A(t, n) {
        return Array.isArray(n) ? n.reduce((n, r, i) => (n[r] = t[i], n), {}) : {
            "": t.reduce((t, n) => Object.assign(t, n), {})
        }
    }
    O.displayName = "Translation";
    class E {
        loadTranslationResources(t, n) {
            return Promise.all(t.map(async t => {
                try {
                    return await this.loadTranslationResource(t, n)
                } catch (r) {
                    return console.warn("Failed to retrieve namespace ".concat(t, " for locale ").concat(n)), {}
                }
            }))
        }
        getTranslationResources(t, n) {
            return t.every(t => void 0 !== this.tryGetTranslationResourceFromCache(t, n)) ? t.map(t => {
                var r;
                return null != (r = this.tryGetTranslationResourceFromCache(t, n)) ? r : {}
            }) : null
        }
        async loadTranslationResource(t, n) {
            let r = this.tryGetTranslationResourceFromCache(t, n);
            if (r) return r;
            let i = "".concat(n, "-").concat(t);
            if (Object.hasOwn(this.translationResourceRequestCache, i)) return this.translationResourceRequestCache[i];
            let o = {};
            try {
                let r = this.fetchTranslationResourceWithFallback(t, n);
                this.translationResourceRequestCache[i] = r, o = await r, null == this.translationResourceCache[n] && (this.translationResourceCache[n] = {}), this.translationResourceCache[n][t] = o
            } catch (r) {
                console.warn("Failed to retrieve translation resources of ".concat(t, " for ").concat(n))
            } finally {
                delete this.translationResourceRequestCache[i]
            }
            return o
        }
        tryGetTranslationResourceFromCache(t, n) {
            var r;
            return null == (r = this.translationResourceCache[n]) ? void 0 : r[t]
        }
        async fetchTranslationResourceWithFallback(t, n) {
            let r = {};
            try {
                r = await this.fetchTranslationResource(t, n)
            } catch (r) {
                console.warn("Failed to retrieve translation resources of ".concat(t, " for ").concat(n))
            }
            if (n !== this.fallbackLocale && (Object.values(r).some(t => null == t) || 0 === Object.keys(r).length)) try {
                let n = await this.loadTranslationResource(t, this.fallbackLocale);
                return Object.keys({
                    ...n,
                    ...r
                }).reduce((t, i) => {
                    var o;
                    return Object.assign(t, {
                        [i]: null != (o = r[i]) ? o : n[i]
                    }), t
                }, {})
            } catch (t) {}
            return r
        }
        constructor(t, n = t.locale) {
            (0, g._)(this, "defaultLocaleInfo", void 0), (0, g._)(this, "fallbackLocale", void 0), (0, g._)(this, "translationResourceCache", void 0), (0, g._)(this, "translationResourceRequestCache", void 0), this.defaultLocaleInfo = t, this.fallbackLocale = n, this.translationResourceCache = {}, this.translationResourceRequestCache = {}
        }
    }

    function S(t) {
        let n = Object.values(t).filter(t => "number" == typeof t);
        return Object.entries(t).filter(t => {
            let [r, i] = t;
            return -1 === n.indexOf(+r)
        }).map(t => {
            let [n, r] = t;
            return r
        })
    }

    function T(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "|";
        return t.map(t => q(t)).join(n)
    }

    function x(t, n) {
        return "bigint" == typeof n ? n.toString() : n
    }
    class P {
        get value() {
            let t = this._getter;
            return void 0 !== t && (this._value = t(), this._getter = void 0), this._value
        }
        constructor(t) {
            this._getter = t, this._value = void 0
        }
    }

    function j(t) {
        let n = +!!t.startsWith("^"),
            r = t.endsWith("$") ? t.length - 1 : t.length;
        return t.slice(n, r)
    }

    function C(t, n, r) {
        Object.defineProperty(t, n, {
            value: r,
            writable: !0,
            enumerable: !0,
            configurable: !0
        })
    }

    function I(t) {
        let n = Object.getOwnPropertyDescriptor(t, "shape");
        return (null == n ? void 0 : n.get) ? n.get.raw : null == n ? void 0 : n.value
    }

    function $(t) {
        var n;
        return null != (n = I(t._zod.def)) ? n : t._zod.def.shape
    }

    function R(t, n, r) {
        Object.defineProperty(t, n, {
            get() {
                let t = r();
                return C(this, n, t), t
            },
            enumerable: !0,
            configurable: !0
        })
    }

    function Z(t, n, r) {
        n in t ? C(t, n, r) : t[n] = r
    }

    function D(t, n, r, i) {
        let o = $(n);
        for (let a of r) {
            let r = Object.getOwnPropertyDescriptor(o, a);
            r.enumerable && (r.get ? R(t, a, () => {
                let t = n._zod.def.shape[a];
                return i ? i(t, a) : t
            }) : Z(t, a, i ? i(r.value, a) : r.value))
        }
    }

    function N() {
        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
        let i = {};
        for (let t of n) Object.assign(i, Object.getOwnPropertyDescriptors(t));
        return Object.defineProperties({}, i)
    }
    let L = "captureStackTrace" in Error ? Error.captureStackTrace : function() {
        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r]
    };

    function B(t) {
        return "object" == typeof t && null !== t && !Array.isArray(t)
    }
    let J = new P(() => {
        var t, n;
        if (e_.jitless || "u" > typeof navigator && (null == (n = navigator) || null == (t = n.userAgent) ? void 0 : t.includes("Cloudflare"))) return !1;
        try {
            return Function(""), !0
        } catch (t) {
            return !1
        }
    });

    function U(t) {
        if (!1 === B(t)) return !1;
        let n = t.constructor;
        if (void 0 === n || "function" != typeof n) return !0;
        let r = n.prototype;
        return !1 !== B(r) && !1 !== Object.prototype.hasOwnProperty.call(r, "isPrototypeOf")
    }

    function M(t) {
        return U(t) ? {
            ...t
        } : Array.isArray(t) ? [...t] : t instanceof Map ? new Map(t) : t instanceof Set ? new Set(t) : t
    }
    let V = new Set(["string", "number", "symbol"]);

    function H(t) {
        return t.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
    }

    function K(t, n, r) {
        let i = new t._zod.constr(null != n ? n : t._zod.def);
        return (!n || (null == r ? void 0 : r.parent)) && (i._zod.parent = t), i
    }

    function W(t) {
        if (!t) return {};
        if ("string" == typeof t) return {
            error: () => t
        };
        if ((null == t ? void 0 : t.message) !== void 0) {
            if ((null == t ? void 0 : t.error) !== void 0) throw Error("Cannot specify both `message` and `error` params");
            t.error = t.message
        }
        return (delete t.message, "string" == typeof t.error) ? {
            ...t,
            error: () => t.error
        } : t
    }

    function q(t) {
        return "bigint" == typeof t ? t.toString() + "n" : "string" == typeof t ? '"'.concat(t, '"') : "".concat(t)
    }
    let G = {
            safeint: [Number.MIN_SAFE_INTEGER, Number.MAX_SAFE_INTEGER],
            int32: [-0x80000000, 0x7fffffff],
            uint32: [0, 0xffffffff],
            float32: [-34028234663852886e22, 34028234663852886e22],
            float64: [-Number.MAX_VALUE, Number.MAX_VALUE]
        },
        X = {
            int64: [BigInt("-9223372036854775808"), BigInt("9223372036854775807")],
            uint64: [BigInt(0), BigInt("18446744073709551615")]
        };

    function Y(t, n) {
        let r = $(t),
            i = [];
        for (let t of Reflect.ownKeys(n)) {
            var o;
            if (!(null == (o = Object.getOwnPropertyDescriptor(r, t)) ? void 0 : o.enumerable)) throw Error('Unrecognized key: "'.concat(String(t), '"'));
            n[t] && i.push(t)
        }
        return i
    }

    function Q(t, n) {
        let r = {};
        for (let i of (D(r, t, Reflect.ownKeys($(t))), Reflect.ownKeys(n))) {
            let t = Object.getOwnPropertyDescriptor(n, i);
            t.enumerable && (t.get ? R(r, i, () => n[i]) : Z(r, i, t.value))
        }
        return r
    }

    function ee(t, n, r) {
        let i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : "partial",
            o = n._zod.def.checks;
        if (o && o.length > 0) throw Error(".".concat(i, "() cannot be used on object schemas containing refinements"));
        let a = r ? new Set(Y(n, r)) : void 0,
            u = {};
        return D(u, n, Reflect.ownKeys($(n)), t && ((n, r) => a && !a.has(r) ? n : new t({
            type: "optional",
            innerType: n
        }))), K(n, N(n._zod.def, {
            shape: u,
            checks: []
        }))
    }

    function et(t) {
        var n;
        let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
        if (!0 === t.aborted) return !0;
        for (let i = r; i < t.issues.length; i++)
            if ((null == (n = t.issues[i]) ? void 0 : n.continue) !== !0) return !0;
        return !1
    }

    function en(t, n) {
        return n.map(n => (null != n.path || (n.path = []), n.path.unshift(t), n))
    }

    function er(t) {
        return "string" == typeof t ? t : null == t ? void 0 : t.message
    }

    function ei(t, n, r) {
        var i;
        for (let o = n; o < t.length; o++) null != (i = t[o]).schema || (i.schema = r)
    }

    function eo(t, n, r) {
        var i, o, a, u, s, l, c, d, f, p, h, m, v, y, g;
        let _ = null == (c = t.inst) || null == (l = c._zod) ? void 0 : l.traits;
        (null == _ ? void 0 : _.has("$ZodType")) && (_.has("$ZodCheck") && null != t.schema || (t.schema = t.inst));
        let b = t.schema !== t.inst ? null == (f = t.schema) || null == (d = f._zod.def) ? void 0 : d.error : void 0,
            F = t.message ? t.message : null != (i = null != (o = null != (a = null != (u = null != (s = er(null == (m = t.inst) || null == (h = m._zod.def) || null == (p = h.error) ? void 0 : p.call(h, t))) ? s : er(null == b ? void 0 : b(t))) ? u : er(null == n || null == (v = n.error) ? void 0 : v.call(n, t))) ? a : er(null == (y = r.customError) ? void 0 : y.call(r, t))) ? o : er(null == (g = r.localeError) ? void 0 : g.call(r, t))) ? i : "Invalid input",
            w = {};
        for (let n of Object.keys(t)) "inst" !== n && "schema" !== n && "continue" !== n && "input" !== n && "__proto__" !== n && (w[n] = t[n]);
        return null != w.path || (w.path = []), w.message = F, (null == n ? void 0 : n.reportInput) && (w.input = t.input), w
    }
    let ea = /[\uD800-\uDBFF]/;

    function eu(t) {
        let n = t.length;
        if (!ea.test(t)) return n;
        let r = n;
        for (let i = 0; i < n - 1; i++)(64512 & t.charCodeAt(i)) == 55296 && (64512 & t.charCodeAt(i + 1)) == 56320 && (r--, i++);
        return r
    }

    function es(t) {
        return Array.isArray(t) ? "array" : "string" == typeof t ? "string" : "unknown"
    }

    function el() {
        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
        let [i, o, a] = n;
        return "string" == typeof i ? {
            message: i,
            code: "custom",
            input: o,
            inst: a
        } : {
            ...i
        }
    }

    function ec(t, n, r) {
        let i = !(arguments.length > 3) || void 0 === arguments[3] || arguments[3];
        return Object.defineProperty(t, n, {
            configurable: !0,
            writable: !0,
            enumerable: i,
            value: r
        }), r
    }
    let ed = !1,
        ef = {
            configurable: !0,
            get() {
                ed = !0
            }
        };

    function ep(t, r, i) {
        let o = Object.getPrototypeOf(t._zod);
        if (r in o && n !== t._zod) {
            n = void 0;
            return
        }
        n = t._zod, Object.defineProperty(o, r, {
            configurable: !0,
            get() {
                Object.defineProperty(this, r, ef);
                let t = ed;
                ed = !1;
                try {
                    let n = i(this);
                    return ed ? delete this[r] : Object.defineProperty(this, r, {
                        configurable: !0,
                        writable: !0,
                        value: n
                    }), ed = ed || t, n
                } catch (n) {
                    throw delete this[r], ed = ed || t, n
                }
            },
            set(t) {
                Object.defineProperty(this, r, {
                    configurable: !0,
                    writable: !0,
                    value: t
                })
            }
        })
    }
    let eh = {
            value: void 0,
            enumerable: !1
        },
        em = "captureStackTrace" in Error ? Error : null;

    function ev(t, n, r, i) {
        var o;

        function a(t) {
            this.def = t, this.constr = d, this.traits = new Set
        }
        a.prototype = {};
        let u = r && new WeakSet;

        function s(i, o) {
            if (i._zod) {
                if (i._zod.traits.has(t)) return
            } else {
                eh.value = new a(o);
                try {
                    Object.defineProperty(i, "_zod", eh)
                } finally {
                    eh.value = void 0
                }
            }
            if (i._zod.traits.add(t), n(i, o), u) {
                let t = Object.getPrototypeOf(i),
                    n = i._zod.constr.prototype,
                    o = t;
                for (; o && o !== n;) o = Object.getPrototypeOf(o);
                let a = null != o ? o : t;
                if (!u.has(a))
                    for (let t in u.add(a), r) {
                        let n = Object.getOwnPropertyDescriptor(r, t);
                        n.get ? Object.defineProperty(a, t, {
                            ...n,
                            enumerable: !1
                        }) : function(t, n, r) {
                            Object.defineProperty(t, n, {
                                configurable: !0,
                                get() {
                                    return this == null ? r : ec(this, n, r.bind(this))
                                },
                                set(t) {
                                    ec(this, n, t)
                                }
                            })
                        }(a, t, n.value)
                    }
            }
            let s = d.prototype;
            for (let t in s) Object.prototype.hasOwnProperty.call(s, t) && (t in i || (i[t] = s[t].bind(i)))
        }
        let l = null != (o = null == i ? void 0 : i.Parent) ? o : Object;
        class c extends l {}

        function d(t) {
            var n;
            let r = (null == i ? void 0 : i.Parent) ? function(t) {
                let n = em;
                if (n) {
                    let r = n.stackTraceLimit;
                    if ("number" == typeof r) {
                        try {
                            n.stackTraceLimit = 0
                        } catch (n) {
                            return em = null, new t
                        }
                        try {
                            return new t
                        } finally {
                            n.stackTraceLimit = r
                        }
                    }
                }
                return new t
            }(c) : this;
            s(r, t);
            let o = r._zod.deferred;
            if (o) {
                for (let t of o) t();
                r._zod.deferred = void 0
            }
            let a = null == (n = globalThis.__zod_globalConfig) ? void 0 : n.postProcessor;
            return a && a(r), r
        }
        return Object.defineProperty(c, "name", {
            value: t
        }), Object.defineProperty(d, "init", {
            value: s
        }), Object.defineProperty(d, Symbol.hasInstance, {
            value: n => {
                var r, o;
                return !!(null == i ? void 0 : i.Parent) && n instanceof i.Parent || (null == n || null == (o = n._zod) || null == (r = o.traits) ? void 0 : r.has(t))
            }
        }), Object.defineProperty(d, "name", {
            value: t
        }), d
    }
    class ey extends Error {
        constructor() {
            super("Encountered Promise during synchronous parse. Use .parseAsync() instead.")
        }
    }
    class eg extends Error {
        constructor(t) {
            super("Encountered unidirectional transform during encode: ".concat(t)), this.name = "ZodEncodeError"
        }
    }
    null != (v = globalThis).__zod_globalConfig || (v.__zod_globalConfig = {});
    let e_ = globalThis.__zod_globalConfig;

    function eb(t) {
        return t && Object.assign(e_, t), e_
    }
    let eF = {
            get: function() {
                let t = this._zod;
                return null != t.message || (t.message = JSON.stringify(t.def, x, 2)), t.message
            },
            set: function(t) {
                this._zod.message = t
            },
            enumerable: !0,
            configurable: !0
        },
        ew = {
            value: void 0,
            enumerable: !1
        },
        ez = new WeakSet([Object.prototype, Error.prototype]),
        ek = ev("$ZodError", (t, n) => {
            t.name = "$ZodError", ew.value = n, Object.defineProperty(t, "issues", ew), ew.value = void 0, Object.defineProperty(t, "message", eF);
            let r = Object.getPrototypeOf(t);
            ez.has(r) || (ez.add(r), Object.defineProperty(r, "toString", {
                configurable: !0,
                enumerable: !1,
                get() {
                    let t = () => this.message;
                    return Object.defineProperty(this, "toString", {
                        value: t,
                        configurable: !0,
                        writable: !0
                    }), t
                },
                set(t) {
                    Object.defineProperty(this, "toString", {
                        value: t,
                        configurable: !0,
                        writable: !0
                    })
                }
            }))
        });

    function eO(t, n) {
        var r;
        return {
            callee: null != (r = null == n ? void 0 : n.callee) ? r : t,
            Err: null == n ? void 0 : n.Err
        }
    }
    let eA = t => {
            let n = (r, i, o, a) => {
                let u = o ? {
                        ...o,
                        async: !1
                    } : {
                        async: !1
                    },
                    s = r._zod.run({
                        value: i,
                        issues: []
                    }, u);
                if (s instanceof Promise) throw new ey;
                if (s.issues.length) {
                    var l, c;
                    let r = new(null != (l = null == a ? void 0 : a.Err) ? l : t)(s.issues.map(t => eo(t, u, eb())));
                    throw L(r, null != (c = null == a ? void 0 : a.callee) ? c : n), r
                }
                return s.value
            };
            return n
        },
        eE = t => {
            let n = async (r, i, o, a) => {
                let u = o ? {
                        ...o,
                        async: !0
                    } : {
                        async: !0
                    },
                    s = r._zod.run({
                        value: i,
                        issues: []
                    }, u);
                if (s instanceof Promise && (s = await s), s.issues.length) {
                    var l, c;
                    let r = new(null != (l = null == a ? void 0 : a.Err) ? l : t)(s.issues.map(t => eo(t, u, eb())));
                    throw L(r, null != (c = null == a ? void 0 : a.callee) ? c : n), r
                }
                return s.value
            };
            return n
        },
        eS = t => (n, r, i) => {
            let o = i ? {
                    ...i,
                    async: !1
                } : {
                    async: !1
                },
                a = n._zod.run({
                    value: r,
                    issues: []
                }, o);
            if (a instanceof Promise) throw new ey;
            return a.issues.length ? eT(t, a.issues, o) : {
                success: !0,
                data: a.value
            }
        };

    function eT(t, n, r) {
        let i;
        return {
            success: !1,
            get error() {
                return i || (i = new t(n.map(t => eo(t, r, eb()))), n = void 0, r = void 0), i
            },
            set error(e) {
                i = e, n = void 0, r = void 0
            }
        }
    }
    let ex = t => async (n, r, i) => {
        let o = i ? {
                ...i,
                async: !0
            } : {
                async: !0
            },
            a = n._zod.run({
                value: r,
                issues: []
            }, o);
        return a instanceof Promise && (a = await a), a.issues.length ? eT(t, a.issues, o) : {
            success: !0,
            data: a.value
        }
    }, eP = Symbol.for("zod.compile.invalid"), ej = Symbol.for("zod.compile.fallback"), eC = async (t, n, r) => {
        let i = r ? {
                ...r,
                async: !0,
                abortEarly: !0
            } : {
                async: !0,
                abortEarly: !0
            },
            o = t._zod.run({
                value: n,
                issues: []
            }, i);
        return o instanceof Promise && (o = await o), 0 === o.issues.length
    }, eI = /^[cC][0-9a-z]{6,}$/, e$ = /^[0-9a-z]+$/, eR = /^[0-7][0-9A-HJKMNP-TV-Za-hjkmnp-tv-z]{25}$/, eZ = /^[0-9a-vA-V]{20}$/, eD = /^[A-Za-z0-9]{27}$/, eN = /^[a-zA-Z0-9_-]{21}$/, eL = /^P(?:(\d+W)|(?!.*W)(?=\d|T\d)(\d+Y)?(\d+M)?(\d+D)?(T(?=\d)(\d+H)?(\d+M)?(\d+([.,]\d+)?S)?)?)$/, eB = /^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})$/, eJ = t => t ? RegExp("^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-".concat(t, "[0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12})$")) : /^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-8][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}|00000000-0000-0000-0000-000000000000|ffffffff-ffff-ffff-ffff-ffffffffffff)$/, eU = /^(?:[A-Za-z0-9_'+\-]+\.)*[A-Za-z0-9_'+\-]*[A-Za-z0-9_+-]@(?:[A-Za-z0-9][A-Za-z0-9\-]*\.)+[A-Za-z]{2,}$/, eM = /^(?:(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])$/, eV = /^(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))$/, eH = /^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\/([0-9]|[1-2][0-9]|3[0-2])$/, eK = /^(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))\/(12[0-8]|1[01][0-9]|[1-9]?[0-9])$/, eW = /^https?$/, eq = /^\+[1-9]\d{6,14}$/, eG = "(?:(?:\\d\\d[2468][048]|\\d\\d[13579][26]|\\d\\d0[48]|[02468][048]00|[13579][26]00)-02-29|\\d{4}-(?:(?:0[13578]|1[02])-(?:0[1-9]|[12]\\d|3[01])|(?:0[469]|11)-(?:0[1-9]|[12]\\d|30)|(?:02)-(?:0[1-9]|1\\d|2[0-8])))", eX = RegExp("^".concat(eG, "$"));

    function eY(t) {
        let n = "(?:[01]\\d|2[0-3]):[0-5]\\d";
        return "number" == typeof t.precision ? -1 === t.precision ? "".concat(n) : 0 === t.precision ? "".concat(n, ":[0-5]\\d") : "".concat(n, ":[0-5]\\d\\.\\d{").concat(t.precision, "}") : t.seconds ? "".concat(n, ":[0-5]\\d(?:\\.\\d+)?") : "".concat(n, "(?::[0-5]\\d(?:\\.\\d+)?)?")
    }
    let eQ = /^[\s\S]{0,}$/,
        e0 = /^-?\d+$/,
        e1 = /^-?\d+(?:\.\d+)?$/,
        e2 = /^[^A-Z]*$/,
        e6 = /^[^a-z]*$/,
        e9 = ev("$ZodCheck", (t, n) => {
            var r;
            null != t._zod || (t._zod = {}), t._zod.def = n, null != (r = t._zod).onattach || (r.onattach = [])
        }),
        e4 = t => {
            let n = t.value;
            return null != n && void 0 !== n.length
        },
        e3 = ev("$ZodCheckMaxLength", (t, n) => {
            var r;
            e9.init(t, n), null != (r = t._zod.def).when || (r.when = e4), t._zod.check = r => {
                let i = r.value,
                    o = i.length;
                if (("string" == typeof i && o > n.maximum ? eu(i) : o) <= n.maximum) return;
                let a = es(i);
                r.issues.push({
                    origin: a,
                    code: "too_big",
                    maximum: n.maximum,
                    inclusive: !0,
                    input: i,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        e5 = ev("$ZodCheckMinLength", (t, n) => {
            var r;
            e9.init(t, n), null != (r = t._zod.def).when || (r.when = e4), t._zod.check = r => {
                let i = r.value,
                    o = i.length;
                if (("string" == typeof i && o >= n.minimum && o < 2 * n.minimum ? eu(i) : o) >= n.minimum) return;
                let a = es(i);
                r.issues.push({
                    origin: a,
                    code: "too_small",
                    minimum: n.minimum,
                    inclusive: !0,
                    input: i,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        e7 = ev("$ZodCheckLengthEquals", (t, n) => {
            var r;
            e9.init(t, n), null != (r = t._zod.def).when || (r.when = e4), t._zod.check = r => {
                let i = r.value,
                    o = i.length,
                    a = "string" == typeof i && o >= n.length && o <= 2 * n.length ? eu(i) : o;
                if (a === n.length) return;
                let u = es(i),
                    s = a > n.length;
                r.issues.push({
                    origin: u,
                    ...s ? {
                        code: "too_big",
                        maximum: n.length
                    } : {
                        code: "too_small",
                        minimum: n.length
                    },
                    inclusive: !0,
                    exact: !0,
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        e8 = ev("$ZodCheckStringFormat", (t, n) => {
            var r, i;
            e9.init(t, n), n.pattern ? null != (r = t._zod).check || (r.check = r => {
                n.pattern.lastIndex = 0, n.pattern.test(r.value) || r.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: n.format,
                    input: r.value,
                    ...n.pattern ? {
                        pattern: n.pattern.toString()
                    } : {},
                    inst: t,
                    continue: !n.abort
                })
            }) : null != (i = t._zod).check || (i.check = () => {})
        }),
        te = ev("$ZodCheckRegex", (t, n) => {
            e8.init(t, n), t._zod.check = r => {
                n.pattern.lastIndex = 0, n.pattern.test(r.value) || r.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: "regex",
                    input: r.value,
                    pattern: n.pattern.toString(),
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        tt = ev("$ZodCheckLowerCase", (t, n) => {
            null != n.pattern || (n.pattern = e2), e8.init(t, n)
        }),
        tn = ev("$ZodCheckUpperCase", (t, n) => {
            null != n.pattern || (n.pattern = e6), e8.init(t, n)
        }),
        tr = ev("$ZodCheckIncludes", (t, n) => {
            e9.init(t, n);
            let r = H(n.includes),
                i = new RegExp("number" == typeof n.position ? "^.{".concat(n.position, ",}").concat(r) : r);
            n.pattern = i, t._zod.check = r => {
                r.value.includes(n.includes, n.position) || r.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: "includes",
                    includes: n.includes,
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        ti = ev("$ZodCheckStartsWith", (t, n) => {
            e9.init(t, n);
            let r = RegExp("^".concat(H(n.prefix), ".*"));
            null != n.pattern || (n.pattern = r), t._zod.check = r => {
                r.value.startsWith(n.prefix) || r.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: "starts_with",
                    prefix: n.prefix,
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        to = ev("$ZodCheckEndsWith", (t, n) => {
            e9.init(t, n);
            let r = RegExp(".*".concat(H(n.suffix), "$"));
            null != n.pattern || (n.pattern = r), t._zod.check = r => {
                r.value.endsWith(n.suffix) || r.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: "ends_with",
                    suffix: n.suffix,
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        ta = ev("$ZodCheckOverwrite", (t, n) => {
            e9.init(t, n), t._zod.check = t => {
                t.value = n.tx(t.value)
            }
        });
    class tu {
        indented(t) {
            this.indent += 1;
            try {
                t(this)
            } finally {
                this.indent -= 1
            }
        }
        write(t) {
            if ("function" == typeof t) {
                t(this, {
                    execution: "sync"
                }), t(this, {
                    execution: "async"
                });
                return
            }
            let n = t.split("\n").filter(t => t),
                r = Math.min(...n.map(t => t.length - t.trimStart().length));
            for (let t of n.map(t => t.slice(r)).map(t => " ".repeat(2 * this.indent) + t)) this.content.push(t)
        }
        compile() {
            var t;
            let n = Function,
                r = null != (t = null === this || void 0 === this ? void 0 : this.content) ? t : [""];
            return new n(...Object.keys(this.closed), "return function (".concat(this.args.join(", "), ") {\n").concat(r.join("\n"), "\n};"))(...Object.values(this.closed))
        }
        constructor(t = [], n = {}) {
            this.content = [], this.indent = 0, this.args = t, this.closed = n
        }
    }
    let ts = {
            major: 4,
            minor: 6,
            patch: 5
        },
        tl = ev("$ZodType", (t, n) => {
            var r, i;
            null != t || (t = {}), t._zod.def = n, t._zod.bag = t._zod.bag || {}, t._zod.version = ts;
            let o = t._zod.def.checks,
                a = t._zod.traits.has("$ZodCheck") ? [t, ...null != o ? o : []] : (null == o ? void 0 : o.length) ? [...o] : [];
            for (let n of a)
                for (let r of n._zod.onattach) r(t);
            if (0 === a.length) null != (i = t._zod).deferred || (i.deferred = []), null == (r = t._zod.deferred) || r.push(() => {
                t._zod.run = t._zod.parse
            });
            else {
                let n = (n, r, i) => {
                        let o;
                        if (n.memo) return n;
                        let a = et(n);
                        for (let u of r) {
                            if (u._zod.def.when) {
                                if (function(t) {
                                        var n;
                                        let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
                                        if (!0 === t.aborted) return !0;
                                        for (let i = r; i < t.issues.length; i++)
                                            if ((null == (n = t.issues[i]) ? void 0 : n.continue) === !1) return !0;
                                        return !1
                                    }(n) || !u._zod.def.when(n)) continue
                            } else if (a) continue;
                            let r = n.issues.length,
                                s = u._zod.check(n);
                            if (s instanceof Promise && (null == i ? void 0 : i.async) === !1) throw new ey;
                            if (o || s instanceof Promise) o = (null != o ? o : Promise.resolve()).then(async () => {
                                await s, n.issues.length !== r && (ei(n.issues, r, t), a || (a = et(n, r)))
                            });
                            else {
                                if (n.issues.length === r) continue;
                                ei(n.issues, r, t), a || (a = et(n, r))
                            }
                        }
                        return o ? o.then(() => n) : n
                    },
                    r = (r, i, o) => {
                        if (et(r)) return r.aborted = !0, r;
                        let u = n(i, a, o);
                        if (u instanceof Promise) {
                            if (!1 === o.async) throw new ey;
                            return u.then(n => t._zod.parse(n, o))
                        }
                        return t._zod.parse(u, o)
                    };
                t._zod.run = (i, o) => {
                    if (o.skipChecks) return t._zod.parse(i, o);
                    if ("backward" === o.direction) {
                        let n = t._zod.parse({
                            value: i.value,
                            issues: []
                        }, {
                            ...o,
                            skipChecks: !0
                        });
                        return n instanceof Promise ? n.then(t => r(t, i, o)) : r(n, i, o)
                    }
                    let u = t._zod.parse(i, o);
                    if (u instanceof Promise) {
                        if (!1 === o.async) throw new ey;
                        return u.then(t => n(t, a, o))
                    }
                    return n(u, a, o)
                }
            }
        }, {
            get "~standard"() {
                return ec(this, "~standard", tf(this), !1)
            },
            set "~standard"(value) {
                ec(this, "~standard", value)
            }
        }),
        tc = (t, n) => t.issues.length ? {
            issues: t.issues.map(t => eo(t, n, eb()))
        } : {
            value: t.value
        };
    async function td(t, n) {
        let r = {
            async: !0
        };
        return tc(await t._zod.run({
            value: n,
            issues: []
        }, r), r)
    }

    function tf(t) {
        return {
            validate: n => {
                let r = {
                    async: !1
                };
                try {
                    let i = t._zod.run({
                        value: n,
                        issues: []
                    }, r);
                    if (!(i instanceof Promise)) return tc(i, r)
                } catch (t) {}
                return td(t, n)
            },
            vendor: "zod",
            version: 1
        }
    }
    let tp = ev("$ZodString", (t, n) => {
            var r;
            tl.init(t, n), t._zod.pattern = null != (r = n.pattern) ? r : eQ, t._zod.parse = (r, i) => {
                if (n.coerce) try {
                    r.value = String(r.value)
                } catch (t) {}
                return "string" == typeof r.value || r.issues.push({
                    expected: "string",
                    code: "invalid_type",
                    input: r.value,
                    inst: t
                }), r
            }
        }),
        th = ev("$ZodStringFormat", (t, n) => {
            e8.init(t, n), tp.init(t, n)
        }),
        tm = ev("$ZodGUID", (t, n) => {
            null != n.pattern || (n.pattern = eB), th.init(t, n)
        }),
        tv = ev("$ZodUUID", (t, n) => {
            if (n.version) {
                let t = {
                    v1: 1,
                    v2: 2,
                    v3: 3,
                    v4: 4,
                    v5: 5,
                    v6: 6,
                    v7: 7,
                    v8: 8
                } [n.version];
                if (void 0 === t) throw Error('Invalid UUID version: "'.concat(n.version, '"'));
                null != n.pattern || (n.pattern = eJ(t))
            } else null != n.pattern || (n.pattern = eJ());
            th.init(t, n)
        }),
        ty = ev("$ZodEmail", (t, n) => {
            null != n.pattern || (n.pattern = eU), th.init(t, n)
        });

    function tg(t) {
        try {
            if ("u" > typeof URL && "function" == typeof URL.canParse) return URL.canParse(t);
            return new URL(t), !0
        } catch (t) {
            return !1
        }
    }
    let t_ = /[\t\n\r]/g;

    function tb(t) {
        return t.replace(t_, "")
    }
    let tF = ev("$ZodURL", (t, n) => {
            th.init(t, n), t._zod.check = r => {
                try {
                    var i, o;
                    let a = r.value.trim(),
                        u = "normalize" in n || "hostname" in n || "protocol" in n ? function(t, n) {
                            var r, i;
                            if (!n.normalize && (null == (r = n.protocol) ? void 0 : r.source) === eW.source && !/^https?:\/\//i.test(t)) return 1;
                            try {
                                if ("u" > typeof URL) {
                                    let n = URL;
                                    if ("function" == typeof n.parse) return null != (i = n.parse(t)) ? i : 2
                                }
                                return new URL(t)
                            } catch (t) {
                                return 2
                            }
                        }(a, n) : tg(a) || 2;
                    if (1 === u) return void r.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid URL format",
                        input: r.value,
                        inst: t,
                        continue: !n.abort
                    });
                    if (2 === u) return void r.issues.push({
                        code: "invalid_format",
                        format: "url",
                        input: r.value,
                        inst: t,
                        continue: !n.abort
                    });
                    if (!0 === u) {
                        r.value = tb(a);
                        return
                    }
                    n.hostname && ((i = n.hostname).lastIndex = 0, !i.test(u.hostname)) && r.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid hostname",
                        pattern: n.hostname.source,
                        input: r.value,
                        inst: t,
                        continue: !n.abort
                    }), n.protocol && ((o = n.protocol).lastIndex = 0, !o.test(u.protocol.endsWith(":") ? u.protocol.slice(0, -1) : u.protocol)) && r.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid protocol",
                        pattern: n.protocol.source,
                        input: r.value,
                        inst: t,
                        continue: !n.abort
                    }), r.value = n.normalize ? u.href : tb(a);
                    return
                } catch (i) {
                    r.issues.push({
                        code: "invalid_format",
                        format: "url",
                        input: r.value,
                        inst: t,
                        continue: !n.abort
                    })
                }
            }
        }),
        tw = ev("$ZodEmoji", (t, n) => {
            null != n.pattern || (n.pattern = RegExp("^(?=[\\s\\S]*[\\u00A9\\u00AE\\u203C\\u2049\\u2122\\u2139\\u2194-\\u2199\\u21A9-\\u21AA\\u231A-\\u231B\\u2328\\u23CF\\u23E9-\\u23F3\\u23F8-\\u23FA\\u24C2\\u25AA-\\u25AB\\u25B6\\u25C0\\u25FB-\\u25FE\\u2600-\\u2604\\u260E\\u2611\\u2614-\\u2615\\u2618\\u261D\\u2620\\u2622-\\u2623\\u2626\\u262A\\u262E-\\u262F\\u2638-\\u263A\\u2640\\u2642\\u2648-\\u2653\\u265F-\\u2660\\u2663\\u2665-\\u2666\\u2668\\u267B\\u267E-\\u267F\\u2692-\\u2697\\u2699\\u269B-\\u269C\\u26A0-\\u26A1\\u26A7\\u26AA-\\u26AB\\u26B0-\\u26B1\\u26BD-\\u26BE\\u26C4-\\u26C5\\u26C8\\u26CE-\\u26CF\\u26D1\\u26D3-\\u26D4\\u26E9-\\u26EA\\u26F0-\\u26F5\\u26F7-\\u26FA\\u26FD\\u2702\\u2705\\u2708-\\u270D\\u270F\\u2712\\u2714\\u2716\\u271D\\u2721\\u2728\\u2733-\\u2734\\u2744\\u2747\\u274C\\u274E\\u2753-\\u2755\\u2757\\u2763-\\u2764\\u2795-\\u2797\\u27A1\\u27B0\\u27BF\\u2934-\\u2935\\u2B05-\\u2B07\\u2B1B-\\u2B1C\\u2B50\\u2B55\\u3030\\u303D\\u3297\\u3299\\u{1F004}\\u{1F02C}-\\u{1F02F}\\u{1F094}-\\u{1F09F}\\u{1F0AF}-\\u{1F0B0}\\u{1F0C0}\\u{1F0CF}-\\u{1F0D0}\\u{1F0F6}-\\u{1F0FF}\\u{1F170}-\\u{1F171}\\u{1F17E}-\\u{1F17F}\\u{1F18E}\\u{1F191}-\\u{1F19A}\\u{1F1AE}-\\u{1F1E5}\\u{1F201}-\\u{1F20F}\\u{1F21A}\\u{1F22F}\\u{1F232}-\\u{1F23A}\\u{1F23C}-\\u{1F23F}\\u{1F249}-\\u{1F25F}\\u{1F266}-\\u{1F321}\\u{1F324}-\\u{1F393}\\u{1F396}-\\u{1F397}\\u{1F399}-\\u{1F39B}\\u{1F39E}-\\u{1F3F0}\\u{1F3F3}-\\u{1F3F5}\\u{1F3F7}-\\u{1F3FA}\\u{1F400}-\\u{1F4FD}\\u{1F4FF}-\\u{1F53D}\\u{1F549}-\\u{1F54E}\\u{1F550}-\\u{1F567}\\u{1F56F}-\\u{1F570}\\u{1F573}-\\u{1F57A}\\u{1F587}\\u{1F58A}-\\u{1F58D}\\u{1F590}\\u{1F595}-\\u{1F596}\\u{1F5A4}-\\u{1F5A5}\\u{1F5A8}\\u{1F5B1}-\\u{1F5B2}\\u{1F5BC}\\u{1F5C2}-\\u{1F5C4}\\u{1F5D1}-\\u{1F5D3}\\u{1F5DC}-\\u{1F5DE}\\u{1F5E1}\\u{1F5E3}\\u{1F5E8}\\u{1F5EF}\\u{1F5F3}\\u{1F5FA}-\\u{1F64F}\\u{1F680}-\\u{1F6C5}\\u{1F6CB}-\\u{1F6D2}\\u{1F6D5}-\\u{1F6E5}\\u{1F6E9}\\u{1F6EB}-\\u{1F6F0}\\u{1F6F3}-\\u{1F6FF}\\u{1F7DA}-\\u{1F7FF}\\u{1F80C}-\\u{1F80F}\\u{1F848}-\\u{1F84F}\\u{1F85A}-\\u{1F85F}\\u{1F888}-\\u{1F88F}\\u{1F8AE}-\\u{1F8AF}\\u{1F8BC}-\\u{1F8BF}\\u{1F8C2}-\\u{1F8CF}\\u{1F8D9}-\\u{1F8FF}\\u{1F90C}-\\u{1F93A}\\u{1F93C}-\\u{1F945}\\u{1F947}-\\u{1F9FF}\\u{1FA58}-\\u{1FA5F}\\u{1FA6E}-\\u{1FAFF}\\u{1FC00}-\\u{1FFFD}\\u{1F1E6}-\\u{1F1FF}\\u20E3])[\\u00A9\\u00AE\\u203C\\u2049\\u2122\\u2139\\u2194-\\u2199\\u21A9-\\u21AA\\u231A-\\u231B\\u2328\\u23CF\\u23E9-\\u23F3\\u23F8-\\u23FA\\u24C2\\u25AA-\\u25AB\\u25B6\\u25C0\\u25FB-\\u25FE\\u2600-\\u2604\\u260E\\u2611\\u2614-\\u2615\\u2618\\u261D\\u2620\\u2622-\\u2623\\u2626\\u262A\\u262E-\\u262F\\u2638-\\u263A\\u2640\\u2642\\u2648-\\u2653\\u265F-\\u2660\\u2663\\u2665-\\u2666\\u2668\\u267B\\u267E-\\u267F\\u2692-\\u2697\\u2699\\u269B-\\u269C\\u26A0-\\u26A1\\u26A7\\u26AA-\\u26AB\\u26B0-\\u26B1\\u26BD-\\u26BE\\u26C4-\\u26C5\\u26C8\\u26CE-\\u26CF\\u26D1\\u26D3-\\u26D4\\u26E9-\\u26EA\\u26F0-\\u26F5\\u26F7-\\u26FA\\u26FD\\u2702\\u2705\\u2708-\\u270D\\u270F\\u2712\\u2714\\u2716\\u271D\\u2721\\u2728\\u2733-\\u2734\\u2744\\u2747\\u274C\\u274E\\u2753-\\u2755\\u2757\\u2763-\\u2764\\u2795-\\u2797\\u27A1\\u27B0\\u27BF\\u2934-\\u2935\\u2B05-\\u2B07\\u2B1B-\\u2B1C\\u2B50\\u2B55\\u3030\\u303D\\u3297\\u3299\\u{1F004}\\u{1F02C}-\\u{1F02F}\\u{1F094}-\\u{1F09F}\\u{1F0AF}-\\u{1F0B0}\\u{1F0C0}\\u{1F0CF}-\\u{1F0D0}\\u{1F0F6}-\\u{1F0FF}\\u{1F170}-\\u{1F171}\\u{1F17E}-\\u{1F17F}\\u{1F18E}\\u{1F191}-\\u{1F19A}\\u{1F1AE}-\\u{1F1E5}\\u{1F201}-\\u{1F20F}\\u{1F21A}\\u{1F22F}\\u{1F232}-\\u{1F23A}\\u{1F23C}-\\u{1F23F}\\u{1F249}-\\u{1F25F}\\u{1F266}-\\u{1F321}\\u{1F324}-\\u{1F393}\\u{1F396}-\\u{1F397}\\u{1F399}-\\u{1F39B}\\u{1F39E}-\\u{1F3F0}\\u{1F3F3}-\\u{1F3F5}\\u{1F3F7}-\\u{1F3FA}\\u{1F400}-\\u{1F4FD}\\u{1F4FF}-\\u{1F53D}\\u{1F549}-\\u{1F54E}\\u{1F550}-\\u{1F567}\\u{1F56F}-\\u{1F570}\\u{1F573}-\\u{1F57A}\\u{1F587}\\u{1F58A}-\\u{1F58D}\\u{1F590}\\u{1F595}-\\u{1F596}\\u{1F5A4}-\\u{1F5A5}\\u{1F5A8}\\u{1F5B1}-\\u{1F5B2}\\u{1F5BC}\\u{1F5C2}-\\u{1F5C4}\\u{1F5D1}-\\u{1F5D3}\\u{1F5DC}-\\u{1F5DE}\\u{1F5E1}\\u{1F5E3}\\u{1F5E8}\\u{1F5EF}\\u{1F5F3}\\u{1F5FA}-\\u{1F64F}\\u{1F680}-\\u{1F6C5}\\u{1F6CB}-\\u{1F6D2}\\u{1F6D5}-\\u{1F6E5}\\u{1F6E9}\\u{1F6EB}-\\u{1F6F0}\\u{1F6F3}-\\u{1F6FF}\\u{1F7DA}-\\u{1F7FF}\\u{1F80C}-\\u{1F80F}\\u{1F848}-\\u{1F84F}\\u{1F85A}-\\u{1F85F}\\u{1F888}-\\u{1F88F}\\u{1F8AE}-\\u{1F8AF}\\u{1F8BC}-\\u{1F8BF}\\u{1F8C2}-\\u{1F8CF}\\u{1F8D9}-\\u{1F8FF}\\u{1F90C}-\\u{1F93A}\\u{1F93C}-\\u{1F945}\\u{1F947}-\\u{1F9FF}\\u{1FA58}-\\u{1FA5F}\\u{1FA6E}-\\u{1FAFF}\\u{1FC00}-\\u{1FFFD}\\u0023\\u002A\\u0030-\\u0039\\u200D\\u20E3\\uFE0F\\u{1F1E6}-\\u{1F1FF}\\u{1F3FB}-\\u{1F3FF}\\u{1F9B0}-\\u{1F9B3}\\u{E0020}-\\u{E007F}]+$", "u")), th.init(t, n)
        }),
        tz = ev("$ZodNanoID", (t, n) => {
            var r;
            if (void 0 !== n.length && (!Number.isInteger(n.length) || n.length < 1)) throw Error("Invalid nanoid length: ".concat(n.length));
            null != n.pattern || (n.pattern = void 0 === n.length ? eN : (r = n.length, RegExp("^[a-zA-Z0-9_-]{".concat(r, "}$")))), th.init(t, n)
        }),
        tk = ev("$ZodCUID", (t, n) => {
            null != n.pattern || (n.pattern = eI), th.init(t, n)
        }),
        tO = ev("$ZodCUID2", (t, n) => {
            null != n.pattern || (n.pattern = e$), th.init(t, n)
        }),
        tA = ev("$ZodULID", (t, n) => {
            null != n.pattern || (n.pattern = eR), th.init(t, n)
        }),
        tE = ev("$ZodXID", (t, n) => {
            null != n.pattern || (n.pattern = eZ), th.init(t, n)
        }),
        tS = ev("$ZodKSUID", (t, n) => {
            null != n.pattern || (n.pattern = eD), th.init(t, n)
        }),
        tT = ev("$ZodISODateTime", (t, n) => {
            let r, i, o;
            null != n.pattern || (r = ["Z"], n.offset && r.push("([+-](?:[01]\\d|2[0-3]):[0-5]\\d)"), i = "".concat(eY({
                precision: n.precision,
                seconds: !0
            }), "(?:").concat(r.join("|"), ")"), o = n.local ? "".concat(i, "|").concat(eY({
                precision: n.precision
            })) : i, n.pattern = RegExp("^".concat(eG, "T(?:").concat(o, ")$"))), th.init(t, n)
        }),
        tx = ev("$ZodISODate", (t, n) => {
            null != n.pattern || (n.pattern = eX), th.init(t, n)
        }),
        tP = ev("$ZodISOTime", (t, n) => {
            null != n.pattern || (n.pattern = RegExp("^".concat(eY(n), "$"))), th.init(t, n)
        }),
        tj = ev("$ZodISODuration", (t, n) => {
            null != n.pattern || (n.pattern = eL), th.init(t, n)
        }),
        tC = ev("$ZodIPv4", (t, n) => {
            null != n.pattern || (n.pattern = eM), th.init(t, n)
        }),
        tI = /^[0-9a-fA-F:.]+$/;

    function t$(t) {
        return !!tI.test(t) && tg("http://[".concat(t, "]"))
    }
    let tR = ev("$ZodIPv6", (t, n) => {
            null != n.pattern || (n.pattern = eV), th.init(t, n), t._zod.check = r => {
                t$(r.value) || r.issues.push({
                    code: "invalid_format",
                    format: "ipv6",
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        tZ = ev("$ZodCIDRv4", (t, n) => {
            null != n.pattern || (n.pattern = eH), th.init(t, n)
        }),
        tD = ev("$ZodCIDRv6", (t, n) => {
            null != n.pattern || (n.pattern = eK), th.init(t, n), t._zod.check = r => {
                ! function(t) {
                    let n = t.split("/");
                    if (2 !== n.length) return !1;
                    let [r, i] = n;
                    if (!i) return !1;
                    let o = Number(i);
                    return "".concat(o) === i && !(o < 0) && !(o > 128) && t$(r)
                }(r.value) && r.issues.push({
                    code: "invalid_format",
                    format: "cidrv6",
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        });

    function tN(t) {
        if ("" === t) return !0;
        if (/\s/.test(t) || t.length % 4 != 0) return !1;
        try {
            return atob(t), !0
        } catch (t) {
            return !1
        }
    }
    let tL = /^[0-9a-zA-Z+/]*={0,2}$/,
        tB = ev("$ZodBase64", (t, n) => {
            null != n.pattern || (n.pattern = tL), th.init(t, n), t._zod.check = r => {
                tN(r.value) || r.issues.push({
                    code: "invalid_format",
                    format: "base64",
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        tJ = /^[A-Za-z0-9_-]*$/,
        tU = ev("$ZodBase64URL", (t, n) => {
            null != n.pattern || (n.pattern = tJ), th.init(t, n), t._zod.check = r => {
                ! function(t) {
                    if (!tJ.test(t)) return !1;
                    let n = t.replace(/[-_]/g, t => "-" === t ? "+" : "/");
                    return tN(n.padEnd(4 * Math.ceil(n.length / 4), "="))
                }(r.value) && r.issues.push({
                    code: "invalid_format",
                    format: "base64url",
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        tM = ev("$ZodE164", (t, n) => {
            null != n.pattern || (n.pattern = eq), th.init(t, n)
        }),
        tV = ev("$ZodJWT", (t, n) => {
            th.init(t, n), t._zod.check = r => {
                ! function(t) {
                    let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null;
                    try {
                        let r = t.split(".");
                        if (3 !== r.length) return !1;
                        let [i] = r;
                        if (!i) return !1;
                        let o = JSON.parse(atob(i));
                        if ("typ" in o && (null == o ? void 0 : o.typ) !== "JWT" || !o.alg || n && (!("alg" in o) || o.alg !== n)) return !1;
                        return !0
                    } catch (t) {
                        return !1
                    }
                }(r.value, n.alg) && r.issues.push({
                    code: "invalid_format",
                    format: "jwt",
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        tH = ev("$ZodUnknown", (t, n) => {
            tl.init(t, n), t._zod.parse = t => t
        }),
        tK = ev("$ZodNever", (t, n) => {
            tl.init(t, n), t._zod.parse = (n, r) => (n.issues.push({
                expected: "never",
                code: "invalid_type",
                input: n.value,
                inst: t
            }), n)
        });

    function tW(t, n, r) {
        t.issues.length && n.issues.push(...en(r, t.issues)), n.value[r] = t.value
    }
    let tq = ev("$ZodArray", (t, n) => {
        tl.init(t, n);
        let r = e_.memoizer;
        null == r || r.attach(t), t._zod.parse = (i, o) => {
            let a = i.value;
            if (!Array.isArray(a)) return i.issues.push({
                expected: "array",
                code: "invalid_type",
                input: a,
                inst: t
            }), i;
            i.value = r ? r.alloc(t, i, Array(a.length), o) : Array(a.length);
            let u = [],
                s = null == o ? void 0 : o.abortEarly;
            for (let t = 0; t < a.length; t++) {
                let r = a[t],
                    l = n.element._zod.run({
                        value: r,
                        issues: []
                    }, o);
                if (l instanceof Promise) u.push(l.then(n => tW(n, i, t)));
                else if (tW(l, i, t), s && 0 !== l.issues.length && et(l)) break
            }
            return u.length ? Promise.all(u).then(() => i) : i
        }
    });

    function tG(t, n, r, i, o, a) {
        let u = r in i,
            s = "optional" === a;
        if (u || !s || "optional" !== o) {
            if (t.issues.length) {
                if (void 0 !== o && s && !u) return;
                n.issues.push(...en(r, t.issues))
            }
            if (!u && void 0 === o) {
                t.issues.length || n.issues.push({
                    code: "invalid_type",
                    expected: "nonoptional",
                    input: void 0,
                    path: [r]
                });
                return
            }
            void 0 === t.value ? (u || "defaulted" === o && !s) && (n.value[r] = void 0) : n.value[r] = t.value
        }
    }
    let tX = [];

    function tY(t) {
        var n, r, i, o, a;
        let u = Object.keys(t.shape),
            s = Object.getOwnPropertySymbols(t.shape),
            l = s.length ? s : tX,
            c = l.length ? [...u, ...l] : u;
        for (let a of c)
            if (!(null == (o = t.shape) || null == (i = o[a]) || null == (r = i._zod) || null == (n = r.traits) ? void 0 : n.has("$ZodType"))) throw Error('Invalid element at key "'.concat(String(a), '": expected a Zod schema'));
        let d = Object.keys(a = t.shape).filter(t => void 0 !== a[t]._zod.optin && "optional" === a[t]._zod.optout);
        return {
            ...t,
            allKeys: c,
            symbolKeys: l,
            keySet: new Set(u),
            numKeys: u.length,
            optionalKeys: new Set(d)
        }
    }

    function tQ(t, n, r, i, o, a, u) {
        let s = [],
            l = o.keySet,
            c = o.catchall._zod,
            d = c.def.type,
            f = c.optin,
            p = c.optout,
            h = 0;
        for (let o in n) {
            if (u && r.issues.length !== h) {
                if (et(r, h)) break;
                h = r.issues.length
            }
            if (l.has(o)) continue;
            if ("__proto__" === o) {
                "never" === d && s.push(o);
                continue
            }
            if ("never" === d) {
                s.push(o);
                continue
            }
            let a = c.run({
                value: n[o],
                issues: []
            }, i);
            a instanceof Promise ? t.push(a.then(t => tG(t, r, o, n, f, p))) : tG(a, r, o, n, f, p)
        }
        return (s.length && r.issues.push({
            code: "unrecognized_keys",
            keys: s,
            input: n,
            inst: a,
            continue: !0
        }), t.length) ? Promise.all(t).then(() => r) : r
    }
    let t0 = ev("$ZodObject", (t, n) => {
            var r;
            let i;
            tl.init(t, n);
            let o = Object.getOwnPropertyDescriptor(n, "shape"),
                a = (null == o ? void 0 : o.get) ? o.get.raw : null != (r = n.shape) ? r : {};
            if (a) {
                let t = () => {
                    let r = {
                        ...a
                    };
                    return Object.defineProperty(n, "shape", {
                        value: r
                    }), t.raw = r, r
                };
                t.raw = a, Object.defineProperty(n, "shape", {
                    get: t
                })
            }
            let u = new P(() => tY(n));
            ep(t, "propValues", t => {
                let n = t.def.shape,
                    r = {};
                for (let t in n) {
                    let i = n[t]._zod;
                    if (i.values) {
                        for (let n of (Object.prototype.hasOwnProperty.call(r, t) || C(r, t, new Set), i.values)) r[t].add(n);
                        void 0 !== i.optin && r[t].add(void 0)
                    }
                }
                return r
            });
            let s = n.catchall,
                l = e_.memoizer;
            null == l || l.attach(t), t._zod.parse = (n, r) => {
                null != i || (i = u.value);
                let o = n.value;
                if (!B(o)) return n.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: o,
                    inst: t
                }), n;
                n.value = l ? l.alloc(t, n, {}, r) : {};
                let a = [],
                    c = i.shape,
                    d = null == r ? void 0 : r.abortEarly,
                    f = n.issues.length;
                for (let t of i.allKeys) {
                    if (d && n.issues.length !== f) {
                        if (et(n, f)) break;
                        f = n.issues.length
                    }
                    if ("__proto__" === t) continue;
                    let i = c[t],
                        u = i._zod.optin,
                        s = i._zod.optout,
                        l = i._zod.run({
                            value: o[t],
                            issues: []
                        }, r);
                    l instanceof Promise ? a.push(l.then(r => tG(r, n, t, o, u, s))) : tG(l, n, t, o, u, s)
                }
                return s ? tQ(a, o, n, r, u.value, t, !0 === d) : a.length ? Promise.all(a).then(() => n) : n
            }
        }),
        t1 = ev("$ZodObjectJIT", (t, n) => {
            let r, i;
            t0.init(t, n);
            let o = t._zod.parse,
                a = new P(() => tY(n)),
                u = e_.memoizer,
                s = !e_.jitless,
                l = s && J.value,
                c = n.catchall;
            t._zod.parse = (d, f) => {
                null != i || (i = a.value);
                let p = d.value;
                return B(p) ? s && l && (null == f ? void 0 : f.async) === !1 && !0 !== f.jitless ? (r || (r = (n => {
                    let r = a.value,
                        i = r.symbolKeys,
                        o = new tu(["payload", "ctx"], {
                            shape: n,
                            inst: t,
                            memo: u,
                            syms: i
                        }),
                        s = t => "shape[".concat(t, "]._zod.run({ value: input[").concat(t, "], issues: [] }, ctx)"),
                        l = (t, n) => "\n          let ".concat(t, "_ab = false;\n          for (let i = 0; i < ").concat(t, ".issues.length; i++) {\n            const iss = ").concat(t, ".issues[i];\n            iss.path = iss.path ? [").concat(n, ", ...iss.path] : [").concat(n, "];\n            payload.issues.push(iss);\n            if (iss.continue !== true) ").concat(t, "_ab = true;\n          }\n          if (").concat(t, "_ab && ctx && ctx.abortEarly) {\n            payload.value = newResult;\n            return payload;\n          }");
                    o.write("const input = payload.value;");
                    let c = Object.create(null),
                        d = 0;
                    for (let t of r.allKeys) c[t] = "key_".concat(d++);
                    for (let t of (o.write(u ? "const newResult = memo.alloc(inst, payload, {}, ctx);" : "const newResult = {};"), r.allKeys)) {
                        var f, p;
                        if ("__proto__" === t) continue;
                        let r = c[t],
                            a = "symbol" == typeof t ? "syms[".concat(i.indexOf(t), "]") : JSON.stringify(t),
                            u = "".concat(a, " in input"),
                            d = n[t],
                            h = null == d || null == (f = d._zod) ? void 0 : f.optin,
                            m = void 0 !== h,
                            v = (null == d || null == (p = d._zod) ? void 0 : p.optout) === "optional";
                        if (o.write("const ".concat(r, " = ").concat(s(a), ";")), m && v) {
                            let t = "optional" === h ? "".concat(r, "_present") : "".concat(r, ".value !== undefined || ").concat(r, "_present");
                            o.write("\n        const ".concat(r, "_present = ").concat(u, ";\n        if (!").concat(r, ".issues.length || ").concat(r, "_present) {\n          if (").concat(r, ".issues.length) {").concat(l(r, a), "\n          }\n\n          if (").concat(t, ") {\n            newResult[").concat(a, "] = ").concat(r, ".value;\n          }\n        }\n\n      "))
                        } else m ? (o.write("\n        if (".concat(r, ".issues.length) {").concat(l(r, a), "\n        }\n      ")), "defaulted" === h ? o.write("newResult[".concat(a, "] = ").concat(r, ".value;")) : o.write("\n        if (".concat(r, ".value !== undefined || ").concat(u, ") {\n          newResult[").concat(a, "] = ").concat(r, ".value;\n        }\n      "))) : o.write("\n        const ".concat(r, "_present = ").concat(u, ";\n        if (").concat(r, ".issues.length) {").concat(l(r, a), "\n        }\n        if (!").concat(r, "_present && !").concat(r, '.issues.length) {\n          payload.issues.push({\n            code: "invalid_type",\n            expected: "nonoptional",\n            input: undefined,\n            path: [').concat(a, "]\n          });\n          if (ctx && ctx.abortEarly) {\n            payload.value = newResult;\n            return payload;\n          }\n        }\n\n        if (").concat(r, "_present) {\n          newResult[").concat(a, "] = ").concat(r, ".value;\n        }\n\n      "))
                    }
                    return o.write("payload.value = newResult;"), o.write("return payload;"), o.compile()
                })(n.shape)), d = r(d, f), c) ? tQ([], p, d, f, i, t, (null == f ? void 0 : f.abortEarly) === !0) : d : o(d, f) : (d.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: p,
                    inst: t
                }), d)
            }
        });

    function t2(t, n, r, i) {
        for (let r of t)
            if (0 === r.issues.length) return n.value = r.value, n;
        let o = t.filter(t => !et(t));
        return 1 === o.length ? (n.value = o[0].value, o[0]) : (n.issues.push({
            code: "invalid_union",
            input: n.value,
            inst: r,
            errors: t.map(t => t.issues.map(t => eo(t, i, eb())))
        }), n)
    }
    let t6 = ev("$ZodUnion", (t, n) => {
            tl.init(t, n), ep(t, "optin", t => t.def.options.some(t => "defaulted" === t._zod.optin) ? "defaulted" : t.def.options.some(t => void 0 !== t._zod.optin) ? "optional" : void 0), ep(t, "optout", t => t.def.options.some(t => "optional" === t._zod.optout) ? "optional" : void 0), ep(t, "values", t => {
                if (t.def.options.every(t => t._zod.values)) return new Set(t.def.options.flatMap(t => Array.from(t._zod.values)))
            }), ep(t, "pattern", t => {
                if (t.def.options.every(t => t._zod.pattern)) {
                    let n = t.def.options.map(t => t._zod.pattern);
                    return RegExp("^(".concat(n.map(t => j(t.source)).join("|"), ")$"))
                }
            });
            let r = 1 === n.options.length ? n.options[0]._zod.run : null;
            t._zod.parse = (i, o) => {
                if (r) return r(i, o);
                let a = !1,
                    u = [];
                for (let t of n.options) {
                    let n = t._zod.run({
                        value: i.value,
                        issues: []
                    }, o);
                    if (n instanceof Promise) u.push(n), a = !0;
                    else {
                        if (0 === n.issues.length) return n;
                        u.push(n)
                    }
                }
                return a ? Promise.all(u).then(n => t2(n, i, t, o)) : t2(u, i, t, o)
            }
        }),
        t9 = ev("$ZodIntersection", (t, n) => {
            tl.init(t, n), t._zod.parse = (t, r) => {
                let i = t.value,
                    o = n.left._zod.run({
                        value: i,
                        issues: []
                    }, r),
                    a = n.right._zod.run({
                        value: i,
                        issues: []
                    }, r);
                return o instanceof Promise || a instanceof Promise ? Promise.all([o, a]).then(n => {
                    let [r, i] = n;
                    return t4(t, r, i)
                }) : t4(t, o, a)
            }
        });

    function t4(t, n, r) {
        let i, o = new Map,
            a = new Map,
            u = (t, n) => {
                var r, u;
                let s;
                if ("unrecognized_keys" !== t.code || (null == (r = t.path) ? void 0 : r.length))
                    if ("invalid_key" !== t.code || "record" !== t.origin || (null == (u = t.path) ? void 0 : u.length) !== 1) return !1;
                    else {
                        let n = String(t.path[0]);
                        a.has(n) || a.set(n, t), s = [n]
                    }
                else null != i || (i = t), s = t.keys;
                for (let t of s) o.has(t) || o.set(t, {}), o.get(t)[n] = !0;
                return !0
            };
        for (let r of n.issues) u(r, "l") || t.issues.push(r);
        for (let n of r.issues) u(n, "r") || t.issues.push(n);
        let s = [...o].filter(t => {
            let [, n] = t;
            return n.l && n.r
        }).map(t => {
            let [n] = t;
            return n
        });
        if (s.length) {
            let n = i ? s.filter(t => i.keys.includes(t)) : [];
            for (let r of (n.length && t.issues.push({
                    ...i,
                    keys: n
                }), s)) !n.includes(r) && a.has(r) && t.issues.push(a.get(r))
        }
        let l = function t(n, r) {
            if (n === r || n instanceof Date && r instanceof Date && +n == +r) return {
                valid: !0,
                data: n
            };
            if (U(n) && U(r)) {
                let i = Object.keys(r),
                    o = Object.keys(n).filter(t => -1 !== i.indexOf(t)),
                    a = {
                        ...n,
                        ...r
                    };
                for (let i of (Object.prototype.hasOwnProperty.call(a, "__proto__") && delete a.__proto__, o)) {
                    if ("__proto__" === i) continue;
                    let o = t(n[i], r[i]);
                    if (!o.valid) return {
                        valid: !1,
                        mergeErrorPath: [i, ...o.mergeErrorPath]
                    };
                    a[i] = o.data
                }
                return {
                    valid: !0,
                    data: a
                }
            }
            if (Array.isArray(n) && Array.isArray(r)) {
                if (n.length !== r.length) return {
                    valid: !1,
                    mergeErrorPath: []
                };
                let i = [];
                for (let o = 0; o < n.length; o++) {
                    let a = t(n[o], r[o]);
                    if (!a.valid) return {
                        valid: !1,
                        mergeErrorPath: [o, ...a.mergeErrorPath]
                    };
                    i.push(a.data)
                }
                return {
                    valid: !0,
                    data: i
                }
            }
            return {
                valid: !1,
                mergeErrorPath: []
            }
        }(n.value, r.value);
        if (!l.valid) {
            if (et(t)) return t;
            throw Error("Unmergable intersection. Error path: ".concat(JSON.stringify(l.mergeErrorPath)))
        }
        return t.value = l.data, t
    }
    let t3 = ev("$ZodRecord", (t, n) => {
            tl.init(t, n);
            let r = e_.memoizer;
            null == r || r.attach(t), t._zod.parse = (i, o) => {
                let a = i.value;
                if (!U(a)) return i.issues.push({
                    expected: "record",
                    code: "invalid_type",
                    input: a,
                    inst: t
                }), i;
                let u = [],
                    s = n.keyType._zod.values;
                if (s && !n.partial) {
                    let l;
                    i.value = r ? r.alloc(t, i, {}, o) : {};
                    let c = new Set;
                    for (let r of s)
                        if ("string" == typeof r || "number" == typeof r || "symbol" == typeof r) {
                            if (c.add("number" == typeof r ? r.toString() : r), "__proto__" === r) continue;
                            let s = n.keyType._zod.run({
                                value: r,
                                issues: []
                            }, o);
                            if (s instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                            if (s.issues.length) {
                                i.issues.push({
                                    code: "invalid_key",
                                    origin: "record",
                                    issues: s.issues.map(t => eo(t, o, eb())),
                                    input: r,
                                    path: [r],
                                    inst: t
                                });
                                continue
                            }
                            let l = s.value;
                            if ("__proto__" === l) continue;
                            let d = n.valueType._zod.run({
                                value: a[r],
                                issues: []
                            }, o);
                            d instanceof Promise ? u.push(d.then(t => {
                                t.issues.length && i.issues.push(...en(r, t.issues)), i.value[l] = t.value
                            })) : (d.issues.length && i.issues.push(...en(r, d.issues)), i.value[l] = d.value)
                        } for (let t in a)
                        if (!c.has(t))
                            if ("loose" === n.mode) {
                                if ("__proto__" === t) continue;
                                i.value[t] = a[t]
                            } else(l = null != l ? l : []).push(t);
                    l && l.length > 0 && i.issues.push({
                        code: "unrecognized_keys",
                        input: a,
                        inst: t,
                        keys: l,
                        continue: !0
                    })
                } else {
                    let l;
                    for (let c of (i.value = r ? r.alloc(t, i, {}, o) : {}, Reflect.ownKeys(a))) {
                        if ("__proto__" === c || !Object.prototype.propertyIsEnumerable.call(a, c)) continue;
                        let r = n.keyType._zod.run({
                            value: c,
                            issues: []
                        }, o);
                        if (r instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                        if ("string" == typeof c && e1.test(c) && r.issues.length) {
                            let t = n.keyType._zod.run({
                                value: Number(c),
                                issues: []
                            }, o);
                            if (t instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                            0 === t.issues.length && (r = t)
                        }
                        if (r.issues.length) {
                            "loose" === n.mode ? i.value[c] = a[c] : s ? (l = null != l ? l : []).push(c) : i.issues.push({
                                code: "invalid_key",
                                origin: "record",
                                issues: r.issues.map(t => eo(t, o, eb())),
                                input: c,
                                path: [c],
                                inst: t
                            });
                            continue
                        }
                        let d = r.value;
                        if ("__proto__" === d) continue;
                        let f = n.valueType._zod.run({
                            value: a[c],
                            issues: []
                        }, o);
                        f instanceof Promise ? u.push(f.then(t => {
                            t.issues.length && i.issues.push(...en(c, t.issues)), i.value[d] = t.value
                        })) : (f.issues.length && i.issues.push(...en(c, f.issues)), i.value[d] = f.value)
                    }
                    l && l.length > 0 && i.issues.push({
                        code: "unrecognized_keys",
                        input: a,
                        inst: t,
                        keys: l,
                        continue: !0
                    })
                }
                return u.length ? Promise.all(u).then(() => i) : i
            }
        }),
        t5 = ev("$ZodEnum", (t, n) => {
            tl.init(t, n);
            let r = S(n.entries),
                i = new Set(r);
            t._zod.values = i, ep(t, "pattern", t => {
                let n = S(t.def.entries).filter(t => V.has(typeof t));
                return new RegExp(n.length ? "^(".concat(n.map(t => H(t.toString())).join("|"), ")$") : "^[^\\s\\S]$")
            }), t._zod.parse = (n, o) => {
                let a = n.value;
                return i.has(a) || n.issues.push({
                    code: "invalid_value",
                    values: r,
                    input: a,
                    inst: t
                }), n
            }
        }),
        t7 = ev("$ZodTransform", (t, n) => {
            var r;
            tl.init(t, n), t._zod.optin = "optional", null == (r = e_.memoizer) || r.guard(t), t._zod.parse = (r, i) => {
                if ("backward" === i.direction) throw new eg(t.constructor.name);
                let o = n.transform(r.value, r);
                if (i.async) return (o instanceof Promise ? o : Promise.resolve(o)).then(t => (r.value = t, r));
                if (o instanceof Promise) throw new ey;
                return r.value = o, r
            }
        });

    function t8(t, n) {
        return t.value = n.issues.length ? void 0 : n.value, t
    }
    let ne = ev("$ZodOptional", (t, n) => {
            tl.init(t, n), ep(t, "optin", t => "defaulted" === t.def.innerType._zod.optin ? "defaulted" : "optional"), t._zod.optout = "optional", ep(t, "values", t => {
                let n = t.def.innerType._zod.values;
                return n ? new Set([...n, void 0]) : void 0
            }), ep(t, "pattern", t => {
                let n = t.def.innerType._zod.pattern;
                return n ? RegExp("^(".concat(j(n.source), ")?$")) : void 0
            }), t._zod.parse = (t, r) => {
                if (void 0 === t.value) {
                    if ("defaulted" !== n.innerType._zod.optin) return t;
                    let i = n.innerType._zod.run({
                        value: t.value,
                        issues: []
                    }, r);
                    return i instanceof Promise ? i.then(n => t8(t, n)) : t8(t, i)
                }
                return n.innerType._zod.run(t, r)
            }
        }),
        nt = ev("$ZodExactOptional", (t, n) => {
            ne.init(t, n), ep(t, "values", t => t.def.innerType._zod.values), ep(t, "pattern", t => t.def.innerType._zod.pattern), t._zod.parse = (t, r) => n.innerType._zod.run(t, r)
        }),
        nn = ev("$ZodNullable", (t, n) => {
            tl.init(t, n), ep(t, "optin", t => t.def.innerType._zod.optin), ep(t, "optout", t => t.def.innerType._zod.optout), ep(t, "pattern", t => {
                let n = t.def.innerType._zod.pattern;
                return n ? RegExp("^(".concat(j(n.source), "|null)$")) : void 0
            }), ep(t, "values", t => t.def.innerType._zod.values ? new Set([...t.def.innerType._zod.values, null]) : void 0), t._zod.parse = (t, r) => null === t.value ? t : n.innerType._zod.run(t, r)
        }),
        nr = ev("$ZodDefault", (t, n) => {
            tl.init(t, n), t._zod.optin = "defaulted", ep(t, "values", t => t.def.innerType._zod.values), t._zod.parse = (t, r) => {
                if ("backward" === r.direction) return n.innerType._zod.run(t, r);
                if (void 0 === t.value) return t.value = n.defaultValue, t;
                let i = n.innerType._zod.run(t, r);
                return i instanceof Promise ? i.then(t => ni(t, n)) : ni(i, n)
            }
        });

    function ni(t, n) {
        return void 0 === t.value && (t.value = n.defaultValue), t
    }
    let no = ev("$ZodPrefault", (t, n) => {
            tl.init(t, n), t._zod.optin = "defaulted", ep(t, "values", t => t.def.innerType._zod.values), t._zod.parse = (t, r) => ("backward" === r.direction || void 0 === t.value && (t.value = n.defaultValue), n.innerType._zod.run(t, r))
        }),
        na = ev("$ZodNonOptional", (t, n) => {
            tl.init(t, n), ep(t, "values", t => {
                let n = t.def.innerType._zod.values;
                return n ? new Set([...n].filter(t => void 0 !== t)) : void 0
            }), t._zod.parse = (r, i) => {
                let o = n.innerType._zod.run(r, i);
                return o instanceof Promise ? o.then(n => nu(n, t)) : nu(o, t)
            }
        });

    function nu(t, n) {
        return t.issues.length || void 0 !== t.value || t.issues.push({
            code: "invalid_type",
            expected: "nonoptional",
            input: t.value,
            inst: n
        }), t
    }

    function ns(t, n, r, i) {
        return n.issues.length ? t.value = r.catchValue({
            ...n,
            value: t.value,
            error: {
                issues: n.issues.map(t => eo(t, i, eb()))
            },
            input: t.value
        }) : (t.value = n.value, n.memo && (t.memo = !0)), t
    }
    let nl = ev("$ZodCatch", (t, n) => {
            tl.init(t, n), ep(t, "optin", t => "defaulted" === t.def.innerType._zod.optin ? "defaulted" : "optional"), ep(t, "optout", t => t.def.innerType._zod.optout), ep(t, "values", t => t.def.innerType._zod.values), t._zod.parse = (t, r) => {
                if ("backward" === r.direction) return n.innerType._zod.run(t, r);
                let i = n.innerType._zod.run({
                    value: t.value,
                    issues: []
                }, r);
                return i instanceof Promise ? i.then(i => ns(t, i, n, r)) : ns(t, i, n, r)
            }
        }),
        nc = ev("$ZodPipe", (t, n) => {
            tl.init(t, n), ep(t, "values", t => t.def.in._zod.values), ep(t, "optin", t => t.def.in._zod.optin), ep(t, "optout", t => t.def.out._zod.optout), ep(t, "propValues", t => t.def.in._zod.propValues), t._zod.parse = (t, r) => {
                if ("backward" === r.direction) {
                    let i = n.out._zod.run(t, r);
                    return i instanceof Promise ? i.then(t => nd(t, n.in, r)) : nd(i, n.in, r)
                }
                let i = n.in._zod.run(t, r);
                return i instanceof Promise ? i.then(t => nd(t, n.out, r)) : nd(i, n.out, r)
            }
        });

    function nd(t, n, r) {
        return t.issues.some(t => "unrecognized_keys" !== t.code) ? (t.aborted = !0, t) : n._zod.run({
            value: t.value,
            issues: t.issues
        }, r)
    }
    let nf = ev("$ZodReadonly", (t, n) => {
        tl.init(t, n), ep(t, "propValues", t => t.def.innerType._zod.propValues), ep(t, "values", t => t.def.innerType._zod.values), ep(t, "optin", t => {
            var n, r;
            return null == (r = t.def.innerType) || null == (n = r._zod) ? void 0 : n.optin
        }), ep(t, "optout", t => {
            var n, r;
            return null == (r = t.def.innerType) || null == (n = r._zod) ? void 0 : n.optout
        }), t._zod.parse = (t, r) => {
            if ("backward" === r.direction) return n.innerType._zod.run(t, r);
            let i = n.innerType._zod.run(t, r);
            return i instanceof Promise ? i.then(np) : np(i)
        }
    });

    function np(t) {
        return t.memo || (t.value = Object.freeze(t.value)), t
    }
    let nh = ev("$ZodCustom", (t, n) => {
        e9.init(t, n), tl.init(t, n), t._zod.parse = (t, n) => t, t._zod.check = r => {
            let i = r.value,
                o = n.fn(i);
            if (o instanceof Promise) return o.then(n => nm(n, r, i, t));
            nm(o, r, i, t)
        }
    });

    function nm(t, n, r, i) {
        if (!t) {
            var o;
            let t = {
                code: "custom",
                input: r,
                inst: i,
                path: [...null != (o = i._zod.def.path) ? o : []],
                continue: !i._zod.def.abort
            };
            i._zod.def.params && (t.params = i._zod.def.params), n.issues.push(el(t))
        }
    }
    class nv extends Error {
        constructor() {
            super("Cannot parse a reference cycle that closes through a transform"), this.name = "ZodCyclicError"
        }
    }
    let ny = "~memo",
        ng = [];

    function n_(t) {
        return null !== t && "object" == typeof t
    }

    function nb(t) {
        return t.map(t => t.path ? {
            ...t,
            path: t.path.slice()
        } : {
            ...t
        })
    }
    let nF = new WeakMap,
        nw = [],
        nz = {
            alloc(t, n, i) {
                let o = r;
                if (!o) return i;
                r = void 0;
                let a = {
                    value: i,
                    issues: null
                };
                return o.set(n.value, a), nw.push(a), i
            },
            guard(t) {
                var n;
                null != (n = t._zod).deferred || (n.deferred = []), t._zod.deferred.push(() => {
                    let n = t._zod.parse,
                        r = (t, r) => {
                            var i, o;
                            let a;
                            if ("backward" !== r.direction && (o = t.value, void 0 !== (a = null == (i = r[ny]) ? void 0 : i.backEdges) && n_(o) && a.has(o))) throw new nv;
                            return n(t, r)
                        };
                    t._zod.parse = r, t._zod.run === n && (t._zod.run = r)
                })
            },
            attach(t) {
                var n;
                let i, o, a, u = !1;
                null != (n = t._zod).deferred || (n.deferred = []), t._zod.deferred.push(() => {
                    let n = t._zod.parse,
                        s = (l, c) => {
                            var d;
                            let f;
                            if (void 0 === i) {
                                let r = function t(n, r, i) {
                                    var o, a;
                                    let u = nF.get(n);
                                    if (void 0 !== u) return 2 * !!u;
                                    if (r.has(n)) return 2;
                                    r.add(n);
                                    let s = 0,
                                        l = n => {
                                            if (2 !== s && (null == n ? void 0 : n._zod)) {
                                                let i = t(n, r);
                                                i > s && (s = i)
                                            }
                                        },
                                        c = t => {
                                            t > s && (s = t)
                                        },
                                        d = n._zod.def;
                                    switch (d.type) {
                                        case "object": {
                                            let n = I(d);
                                            c(n ? (n => {
                                                let i = 0;
                                                for (let a of Reflect.ownKeys(n)) {
                                                    var o;
                                                    let u = Object.getOwnPropertyDescriptor(n, a);
                                                    if (!u.enumerable) continue;
                                                    let s = u.get ? 1 : (null == (o = u.value) ? void 0 : o._zod) ? t(u.value, r) : 0;
                                                    s > i && (i = s)
                                                }
                                                return i
                                            })(n) : 1), l(d.catchall);
                                            break
                                        }
                                        case "array":
                                            l(d.element);
                                            break;
                                        case "tuple":
                                            for (let t of d.items) l(t);
                                            l(d.rest);
                                            break;
                                        case "record":
                                        case "map":
                                            l(d.keyType), l(d.valueType);
                                            break;
                                        case "set":
                                            l(d.valueType);
                                            break;
                                        case "union":
                                            for (let t of d.options) l(t);
                                            break;
                                        case "intersection":
                                            l(d.left), l(d.right);
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
                                            l(d.innerType);
                                            break;
                                        case "pipe":
                                            l(d.in), l(d.out);
                                            break;
                                        case "function":
                                            l(d.input), l(d.output);
                                            break;
                                        case "lazy": {
                                            let n = null != (a = d._cachedInner) ? a : void 0;
                                            c(n ? t(n, r) : 1);
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
                                            for (let t in d) {
                                                let n = Object.getOwnPropertyDescriptor(d, t);
                                                if (!n || n.get) continue;
                                                let r = n.value;
                                                if (r && "object" == typeof r) {
                                                    if (r._zod) l(r);
                                                    else if (Array.isArray(r))
                                                        for (let t of r) l(t)
                                                }
                                            }
                                    }
                                    return r.delete(n), 1 !== (o = s) && nF.set(n, 2 === o), o
                                }(t, new Set);
                                if (0 === r) return t._zod.parse = n, t._zod.run === s && (t._zod.run = n), n(l, c);
                                2 === r || u ? i = !0 : u = !0
                            }
                            let p = l.value;
                            if (!n_(p)) return n(l, c);
                            let h = c[ny];
                            if (h || (h = {
                                    buckets: new WeakMap,
                                    backEdges: void 0
                                }, c[ny] = h), o === c) f = a;
                            else {
                                let n;
                                (n = (d = h).buckets.get(t)) || (n = new WeakMap, d.buckets.set(t, n)), f = n, o = c, a = f
                            }
                            let m = f.get(p);
                            if (m) return l.value = m.value, m.issues ? m.issues.length && l.issues.push(...nb(m.issues)) : (l.memo = !0, null != h.backEdges || (h.backEdges = new WeakSet), h.backEdges.add(m.value)), l;
                            r = f;
                            let v = nw.length,
                                y = n(l, c);
                            r = void 0;
                            let g = nw.length > v ? nw.pop() : void 0;
                            return y instanceof Promise ? y.then(t => (g && (g.issues = t.issues.length ? nb(t.issues) : ng), t)) : (g && (g.issues = y.issues.length ? nb(y.issues) : ng), y)
                        };
                    t._zod.parse = s, t._zod.run === n && (t._zod.run = s)
                })
            }
        };
    null != (y = globalThis).__zod_globalRegistry || (y.__zod_globalRegistry = new class {
        add(t) {
            for (var n = arguments.length, r = Array(n > 1 ? n - 1 : 0), i = 1; i < n; i++) r[i - 1] = arguments[i];
            let o = r[0];
            return this._map.set(t, o), o && "object" == typeof o && "id" in o && this._idmap.set(o.id, t), this
        }
        clear() {
            return this._map = new WeakMap, this._idmap = new Map, this
        }
        remove(t) {
            let n = this._map.get(t);
            return n && "object" == typeof n && "id" in n && this._idmap.delete(n.id), this._map.delete(t), this
        }
        get(t) {
            let n = t._zod.parent;
            if (n) {
                var r;
                let i = {
                    ...null != (r = this.get(n)) ? r : {}
                };
                delete i.id;
                let o = {
                    ...i,
                    ...this._map.get(t)
                };
                return Object.keys(o).length ? o : void 0
            }
            return this._map.get(t)
        }
        has(t) {
            return this._map.has(t)
        }
        constructor() {
            this._map = new WeakMap, this._idmap = new Map
        }
    });
    let nk = globalThis.__zod_globalRegistry;

    function nO(t, n) {
        return new e3({
            check: "max_length",
            ...W(n),
            maximum: t
        })
    }

    function nA(t, n) {
        return new e5({
            check: "min_length",
            ...W(n),
            minimum: t
        })
    }

    function nE(t, n) {
        return new e7({
            check: "length_equals",
            ...W(n),
            length: t
        })
    }

    function nS(t) {
        return new ta({
            check: "overwrite",
            tx: t
        })
    }

    function nT(t) {
        for (var n = arguments.length, r = Array(n > 1 ? n - 1 : 0), i = 1; i < n; i++) r[i - 1] = arguments[i];
        for (let n of r)
            for (let r of Reflect.ownKeys(n)) Object.prototype.propertyIsEnumerable.call(n, r) && C(t, r, n[r]);
        return t
    }

    function nx(t) {
        var n, r, i, o, a, u, s, l, c;
        let d = null != (n = null == t ? void 0 : t.target) ? n : "draft-2020-12";
        return "draft-4" === d && (d = "draft-04"), "draft-7" === d && (d = "draft-07"), {
            processors: null != (r = t.processors) ? r : {},
            metadataRegistry: null != (i = null == t ? void 0 : t.metadata) ? i : nk,
            target: d,
            unrepresentable: null != (o = null == t ? void 0 : t.unrepresentable) ? o : "throw",
            override: null != (a = null == t ? void 0 : t.override) ? a : () => {},
            io: null != (u = null == t ? void 0 : t.io) ? u : "output",
            counter: 0,
            seen: new Map,
            sharedDefsExtractedFor: void 0,
            sharedEmitDoneFor: void 0,
            cycles: null != (s = null == t ? void 0 : t.cycles) ? s : "ref",
            reused: null != (l = null == t ? void 0 : t.reused) ? l : "inline",
            intersections: [],
            deferred: [],
            external: null != (c = null == t ? void 0 : t.external) ? c : void 0
        }
    }

    function nP(t, n, r, i, o) {
        let a = "function" == typeof n.unrepresentable ? n.unrepresentable({
            zodSchema: t,
            path: i.path,
            message: o
        }) : n.unrepresentable;
        if ("any" === a) return !1;
        if (void 0 === a || "throw" === a) throw Error(o);
        return Object.assign(r, a), !0
    }

    function nj(t, n) {
        var r, i, o;
        let a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {
                path: [],
                schemaPath: []
            },
            u = t._zod.def,
            s = n.seen.get(t);
        if (s) return s.count++, a.schemaPath.includes(t) && (s.cycle = a.path), s.schema;
        let l = {
            schema: {},
            count: 1,
            cycle: void 0,
            path: a.path
        };
        n.seen.set(t, l), n.sharedDefsExtractedFor = void 0, n.sharedEmitDoneFor = void 0;
        let c = null == (r = (i = t._zod).toJSONSchema) ? void 0 : r.call(i);
        if (c) l.schema = c;
        else {
            let r = {
                ...a,
                schemaPath: [...a.schemaPath, t],
                path: a.path
            };
            if (t._zod.processJSONSchema) t._zod.processJSONSchema(n, l.schema, r);
            else {
                let i = l.schema,
                    o = n.processors[u.type];
                if (!o) throw Error("[toJSONSchema]: Non-representable type encountered: ".concat(u.type));
                o(t, n, i, r)
            }
            let i = t._zod.parent;
            i && (l.ref || (l.ref = i), nj(i, n, r), n.seen.get(i).isParent = !0)
        }
        let d = n.metadataRegistry.get(t);
        return d && nT(l.schema, d), "input" === n.io && function t(n, r) {
            let i = null != r ? r : {
                seen: new Set
            };
            if (i.seen.has(n)) return !1;
            i.seen.add(n);
            let o = n._zod.def;
            if ("transform" === o.type) return !0;
            if ("array" === o.type) return t(o.element, i);
            if ("set" === o.type) return t(o.valueType, i);
            if ("lazy" === o.type) return t(o.getter(), i);
            if ("promise" === o.type || "optional" === o.type || "nonoptional" === o.type || "nullable" === o.type || "readonly" === o.type || "default" === o.type || "prefault" === o.type || "catch" === o.type) return t(o.innerType, i);
            if ("intersection" === o.type) return t(o.left, i) || t(o.right, i);
            if ("record" === o.type || "map" === o.type) return t(o.keyType, i) || t(o.valueType, i);
            if ("pipe" === o.type) return !!n._zod.traits.has("$ZodCodec") || t(o.in, i) || t(o.out, i);
            if ("object" === o.type) {
                for (let n in o.shape)
                    if (t(o.shape[n], i)) return !0;
                return !1
            }
            if ("union" === o.type) {
                for (let n of o.options)
                    if (t(n, i)) return !0;
                return !1
            }
            if ("tuple" === o.type) {
                for (let n of o.items)
                    if (t(n, i)) return !0;
                if (o.rest && t(o.rest, i)) return !0
            }
            return !1
        }(t) && (delete l.schema.examples, delete l.schema.default), "input" === n.io && "_prefault" in l.schema && (null != (o = l.schema).default || (o.default = l.schema._prefault)), delete l.schema._prefault, n.seen.get(t).schema
    }

    function nC(t) {
        return t.replace(/~/g, "~0").replace(/\//g, "~1")
    }

    function nI(t, n) {
        var r, i, o, a;
        let u = t.seen.get(n);
        if (!u) throw Error("Unprocessed schema. This is a bug in Zod.");
        if (t.external && t.sharedDefsExtractedFor === t.external) return;
        let s = new Map;
        for (let n of t.seen.entries()) {
            let i = null == (r = t.metadataRegistry.get(n[0])) ? void 0 : r.id;
            if (i) {
                let t = s.get(i);
                if (t && t !== n[0]) throw Error('Duplicate schema id "'.concat(i, '" detected during JSON Schema conversion. Two different schemas cannot share the same id when converted together.'));
                s.set(i, n[0])
            }
        }
        let l = n => {
            if (n[1].schema.$ref) return;
            let r = n[1],
                {
                    ref: i,
                    defId: o
                } = (n => {
                    var r, i, o, a, s;
                    let l = "draft-2020-12" === t.target ? "$defs" : "definitions";
                    if (t.external) {
                        let r = null == (s = t.external.registry.get(n[0])) ? void 0 : s.id,
                            u = null != (i = t.external.uri) ? i : t => t;
                        if (r) return {
                            ref: u(r)
                        };
                        let c = null != (o = null != (a = n[1].defId) ? a : n[1].schema.id) ? o : "schema".concat(t.counter++);
                        return n[1].defId = c, {
                            defId: c,
                            ref: "".concat(u("__shared"), "#/").concat(l, "/").concat(nC(c))
                        }
                    }
                    let c = "#/".concat(l, "/");
                    if (n[1] === u && !n[1].schema.id) return {
                        ref: "#"
                    };
                    let d = null != (r = n[1].schema.id) ? r : "__schema".concat(t.counter++);
                    return {
                        defId: d,
                        ref: c + nC(d)
                    }
                })(n);
            r.def = {
                ...r.schema
            }, o && (r.defId = o);
            let a = r.schema;
            for (let t in a) delete a[t];
            a.$ref = i
        };
        if ("throw" === t.cycles)
            for (let n of t.seen.entries()) {
                let t = n[1];
                if (t.cycle) throw Error("Cycle detected: #/".concat(null == (i = t.cycle) ? void 0 : i.join("/"), '/<root>\n\nSet the `cycles` parameter to `"ref"` to resolve cyclical schemas with defs.'))
            }
        for (let r of t.seen.entries()) {
            let i = r[1];
            if (n === r[0]) {
                l(r);
                continue
            }
            if (t.external) {
                let i = null == (a = t.external.registry.get(r[0])) ? void 0 : a.id;
                if (n !== r[0] && i) {
                    l(r);
                    continue
                }
            }
            if ((null == (o = t.metadataRegistry.get(r[0])) ? void 0 : o.id) || i.cycle) {
                l(r);
                continue
            }
            i.count > 1 && "ref" === t.reused && l(r)
        }
        t.external && (t.sharedDefsExtractedFor = t.external)
    }
    let n$ = new Set(["type", "properties", "required", "additionalProperties"]),
        nR = ["oneOf", "anyOf"];

    function nZ(t) {
        let n = t.additionalProperties;
        return void 0 === n || !1 === n || "object" != typeof n || null === n ? null : Object.keys(n).length ? n : null
    }

    function nD(t) {
        let n = [];
        for (let r of t) {
            if ("object" != typeof r || "object" !== r.type) return null;
            for (let t in r)
                if (!n$.has(t)) return null;
            n.push(r)
        }
        let r = {},
            i = new Set;
        for (let t of n) {
            var o, a, u, s;
            for (let i in t.properties) {
                if (Object.prototype.hasOwnProperty.call(r, i)) continue;
                let t = [];
                for (let r of n) {
                    let n = null != (u = null == (s = r.properties) ? void 0 : s[i]) ? u : nZ(r);
                    null != n && (t.some(t => JSON.stringify(t) === JSON.stringify(n)) || t.push(n))
                }
                C(r, i, 1 === t.length ? t[0] : null != (a = nD(t)) ? a : {
                    allOf: t
                })
            }
            for (let n of null != (o = t.required) ? o : []) i.add(n)
        }
        let l = {
            type: "object",
            properties: r
        };
        if (i.size && (l.required = [...i]), n.every(t => !1 === t.additionalProperties)) l.additionalProperties = !1;
        else {
            let t = [];
            for (let r of n) {
                let n = nZ(r);
                n && !t.some(t => JSON.stringify(t) === JSON.stringify(n)) && t.push(n)
            }
            1 === t.length ? l.additionalProperties = t[0] : t.length > 1 && (l.additionalProperties = {
                allOf: t
            })
        }
        return l
    }

    function nN(t, n) {
        var r, i, o, a, u, s, l, c;
        let d = t.seen.get(n);
        if (!d) throw Error("Unprocessed schema. This is a bug in Zod.");
        let f = n => {
            var r, i, o;
            let a = t.seen.get(n);
            if (null === a.ref) return;
            let u = null != (r = a.def) ? r : a.schema,
                s = {
                    ...u
                },
                l = a.ref;
            if (a.ref = null, l) {
                f(l);
                let r = t.seen.get(l),
                    i = r.schema;
                if (i.$ref && ("draft-07" === t.target || "draft-04" === t.target || "openapi-3.0" === t.target) ? (u.allOf = null != (o = u.allOf) ? o : [], u.allOf.push(i)) : nT(u, i), nT(u, s), n._zod.parent === l)
                    for (let t in u) "$ref" !== t && "allOf" !== t && (t in s || delete u[t]);
                if (i.$ref && r.def)
                    for (let t in u) "$ref" !== t && "allOf" !== t && t in r.def && JSON.stringify(u[t]) === JSON.stringify(r.def[t]) && delete u[t]
            }
            let c = n._zod.parent;
            if (c && c !== l) {
                f(c);
                let n = t.seen.get(c);
                if ((null == n ? void 0 : n.schema.$ref) && (u.$ref = n.schema.$ref, n.def))
                    for (let t in u) "$ref" !== t && "allOf" !== t && t in n.def && JSON.stringify(u[t]) === JSON.stringify(n.def[t]) && delete u[t]
            }
            t.override({
                zodSchema: n,
                jsonSchema: u,
                path: null != (i = a.path) ? i : []
            })
        };
        if (!t.external || t.sharedEmitDoneFor !== t.external) {
            for (let n of [...t.seen.entries()].reverse()) f(n[0]);
            if ("openapi-3.0" !== t.target)
                for (let n of t.seen.entries()) ! function t(n) {
                    let r = n.anyOf;
                    if (!Array.isArray(r) || 0 === r.length || void 0 !== n.type) return;
                    let i = [];
                    for (let n of r) {
                        if (!n || "object" != typeof n) return;
                        t(n);
                        let r = Object.keys(n);
                        if (1 !== r.length || "type" !== r[0]) return;
                        let o = n.type;
                        for (let t of Array.isArray(o) ? o : [o]) {
                            if ("string" != typeof t) return;
                            i.includes(t) || i.push(t)
                        }
                    }
                    delete n.anyOf, n.type = 1 === i.length ? i[0] : i
                }(null != (s = n[1].def) ? s : n[1].schema);
            for (let n of t.deferred) n();
            if (t.intersections.length) {
                let n = new Map;
                for (let r of t.seen.values())
                    for (let t of [r.schema, r.def]) {
                        let r = null == t ? void 0 : t.allOf;
                        if (!Array.isArray(r)) continue;
                        let i = n.get(r);
                        i ? i.push(t) : n.set(r, [t])
                    }
                for (let r of t.intersections)
                    for (let t of null != (l = n.get(r)) ? l : []) ! function(t) {
                        let n = t.allOf;
                        if (!Array.isArray(n) || n.length < 2) return;
                        for (let n of n$)
                            if (n in t) return;
                        let r = n.filter(t => nR.some(n => Array.isArray(t[n]))),
                            i = null;
                        if (r.length) {
                            let t = r[0],
                                o = nR.find(n => Array.isArray(t[n]));
                            if (1 !== Object.keys(t).length) return;
                            let a = n.filter(n => n !== t),
                                u = t[o].map(t => nD([...a, t]));
                            if (u.some(t => !t)) return;
                            i = {
                                [o]: u
                            }
                        } else i = nD(n);
                        i && (delete t.allOf, nT(t, i))
                    }(t)
            }
        }
        let p = {};
        if ("draft-2020-12" === t.target ? p.$schema = "https://json-schema.org/draft/2020-12/schema" : "draft-07" === t.target ? p.$schema = "http://json-schema.org/draft-07/schema#" : "draft-04" === t.target ? p.$schema = "http://json-schema.org/draft-04/schema#" : t.target, null == (o = t.external) ? void 0 : o.uri) {
            let r = null == (c = t.external.registry.get(n)) ? void 0 : c.id;
            if (!r) throw Error("Schema is missing an `id` property");
            p.$id = t.external.uri(r)
        }
        nT(p, d.defId ? d.schema : null != (r = d.def) ? r : d.schema);
        let h = null == (a = t.metadataRegistry.get(n)) ? void 0 : a.id;
        void 0 !== h && p.id === h && delete p.id;
        let m = null != (i = null == (u = t.external) ? void 0 : u.defs) ? i : {};
        if (!t.external || t.sharedEmitDoneFor !== t.external)
            for (let n of t.seen.entries()) {
                let t = n[1];
                t.def && t.defId && (t.def.id === t.defId && delete t.def.id, C(m, t.defId, t.def))
            }
        t.external && (t.sharedEmitDoneFor = t.external), t.external || Object.keys(m).length > 0 && ("draft-2020-12" === t.target ? p.$defs = m : p.definitions = m);
        try {
            let r = JSON.parse(JSON.stringify(p));
            return Object.defineProperty(r, "~standard", {
                value: {
                    ...n["~standard"],
                    jsonSchema: {
                        input: nL(n, "input", t.processors),
                        output: nL(n, "output", t.processors)
                    }
                },
                enumerable: !1,
                writable: !1
            }), r
        } catch (t) {
            throw Error("Error converting schema to JSON.")
        }
    }
    let nL = function(t, n) {
            let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
            return i => {
                let {
                    libraryOptions: o,
                    target: a
                } = null != i ? i : {}, u = nx({
                    ...null != o ? o : {},
                    target: a,
                    io: n,
                    processors: r
                });
                return nj(t, u), nI(u, t), nN(u, t)
            }
        },
        nB = (t, n, r) => {
            (void 0 === t[n] || r > t[n]) && (t[n] = r)
        },
        nJ = (t, n, r) => {
            (void 0 === t[n] || r < t[n]) && (t[n] = r)
        },
        nU = (t, n) => {
            nB(t, "minimum", n), nJ(t, "maximum", n)
        },
        nM = (t, n) => {
            null != t.multipleOf || (t.multipleOf = []), t.multipleOf.includes(n) || t.multipleOf.push(n)
        },
        nV = (t, n) => {
            null != t.patterns || (t.patterns = new Set), t.patterns.add(n)
        },
        nH = (t, n) => {
            t.mime = t.mime ? t.mime.filter(t => n.includes(t)) : [...n]
        },
        nK = (t, n) => {
            t.format = n, n.includes("int") && (t.isInt = !0)
        },
        nW = (t, n) => nB(t, "minimum", n.minimum),
        nq = (t, n) => nJ(t, "maximum", n.maximum),
        nG = t => (n, r) => {
            nK(n, r.format);
            let [i, o] = t[r.format];
            nB(n, "minimum", i), nJ(n, "maximum", o)
        },
        nX = {
            greater_than: (t, n) => nB(t, n.inclusive ? "minimum" : "exclusiveMinimum", n.value),
            less_than: (t, n) => nJ(t, n.inclusive ? "maximum" : "exclusiveMaximum", n.value),
            multiple_of: (t, n) => nM(t, n.value),
            number_format: nG(G),
            bigint_format: nG(X),
            min_length: nW,
            max_length: nq,
            length_equals: (t, n) => nU(t, n.length),
            min_size: nW,
            max_size: nq,
            size_equals: (t, n) => nU(t, n.size),
            string_format: (t, n) => {
                nK(t, n.format), n.pattern && nV(t, n.pattern), ("base64" === n.format || "base64url" === n.format) && (t.contentEncoding = n.format), (n.local || -1 === n.precision) && (t.laxFormat = !0)
            },
            mime_type: (t, n) => nH(t, n.mime)
        };

    function nY(t) {
        var n, r, i, o;
        let a = {},
            u = t._zod.def;
        for (let i of t._zod.traits.has("$ZodCheck") ? [t, ...null != (n = u.checks) ? n : []] : null != (r = u.checks) ? r : []) null == (o = nX[i._zod.def.check]) || o.call(nX, a, i._zod.def);
        let s = t._zod.bag;
        for (let t of (void 0 !== s.minimum && nB(a, "minimum", s.minimum), void 0 !== s.exclusiveMinimum && nB(a, "exclusiveMinimum", s.exclusiveMinimum), void 0 !== s.maximum && nJ(a, "maximum", s.maximum), void 0 !== s.exclusiveMaximum && nJ(a, "exclusiveMaximum", s.exclusiveMaximum), void 0 !== s.multipleOf && nM(a, s.multipleOf), void 0 !== s.format && (null != a.format || (a.format = s.format), s.format.includes("int") && (a.isInt = !0)), s.mime && nH(a, s.mime), null != (i = s.patterns) ? i : [])) nV(a, t);
        return a
    }
    let nQ = {
            guid: "uuid",
            url: "uri",
            datetime: "date-time",
            json_string: "json-string",
            regex: ""
        },
        n0 = new Map([
            [tL, /^$|^(?:[0-9a-zA-Z+/]{4})*(?:(?:[0-9a-zA-Z+/]{2}==)|(?:[0-9a-zA-Z+/]{3}=))?$/],
            [tJ, /^(?:[A-Za-z0-9_-]{4})*(?:[A-Za-z0-9_-]{2,3})?$/]
        ]),
        n1 = t => {
            var n;
            return null != (n = n0.get(t)) ? n : t
        };

    function n2(t) {
        let n = t._zod.def;
        return "pipe" === n.type && n.in._zod.traits.has("$ZodTransform") ? n2(n.out) : "catch" === n.type ? n2(n.innerType) : t._zod.optin
    }
    let n6 = new WeakMap,
        n9 = Symbol();

    function n4(t, n, r, i, o) {
        let a = !1,
            u = JSON.stringify(t, (t, n) => "bigint" != typeof n ? n : (a = !0, null));
        return a ? (nP(n, r, i, o, "BigInt defaults cannot be represented in JSON Schema"), n9) : JSON.parse(u)
    }
    let n3 = (t, n, r, i) => {
            let o = t._zod.def;
            nj(o.innerType, n, i), n.seen.get(t).ref = o.innerType
        },
        n5 = new WeakSet([Object.prototype, Error.prototype]);

    function n7(t, n, r) {
        Object.defineProperty(t, n, {
            configurable: !0,
            enumerable: !1,
            get() {
                let t = r(this);
                return Object.defineProperty(this, n, {
                    value: t,
                    configurable: !0,
                    writable: !0
                }), t
            },
            set(t) {
                Object.defineProperty(this, n, {
                    value: t,
                    configurable: !0,
                    writable: !0
                })
            }
        })
    }
    let n8 = ev("ZodError", (t, n) => {
            ek.init(t, n), t.name = "ZodError";
            let r = Object.getPrototypeOf(t);
            n5.has(r) || (n5.add(r), n7(r, "format", t => n => (function(t) {
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : t => t.message,
                    r = {
                        _errors: []
                    },
                    i = function(t) {
                        let o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [];
                        for (let a of t.issues)
                            if ("invalid_union" === a.code && a.errors.length) a.errors.map(t => i({
                                issues: t
                            }, [...o, ...a.path]));
                            else if ("invalid_key" === a.code) i({
                            issues: a.issues
                        }, [...o, ...a.path]);
                        else if ("invalid_element" === a.code) i({
                            issues: a.issues
                        }, [...o, ...a.path]);
                        else {
                            let t = [...o, ...a.path];
                            if (0 === t.length) r._errors.push(n(a));
                            else {
                                let i = r,
                                    o = 0;
                                for (; o < t.length;) {
                                    let r = t[o],
                                        u = o === t.length - 1;
                                    if ("_errors" === r) {
                                        u && i._errors.push(n(a)), o++;
                                        continue
                                    }
                                    Object.prototype.hasOwnProperty.call(i, r) || Object.defineProperty(i, r, {
                                        value: {
                                            _errors: []
                                        },
                                        enumerable: !0,
                                        writable: !0,
                                        configurable: !0
                                    });
                                    let s = i[r];
                                    u && s._errors.push(n(a)), i = s, o++
                                }
                            }
                        }
                    };
                return i(t), r
            })(t, n)), n7(r, "flatten", t => n => (function(t) {
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : t => t.message,
                    r = {},
                    i = [];
                for (let u of t.issues)
                    if (u.path.length > 0) {
                        var o, a;
                        (o = u.path[0], a = () => [], !Object.prototype.hasOwnProperty.call(r, o) && ("__proto__" === o ? Object.defineProperty(r, o, {
                            value: a(),
                            writable: !0,
                            enumerable: !0,
                            configurable: !0
                        }) : r[o] = a()), r[o]).push(n(u))
                    } else i.push(n(u));
                return {
                    formErrors: i,
                    fieldErrors: r
                }
            })(t, n)), n7(r, "addIssue", t => n => {
                t.issues.push(n), t.message = JSON.stringify(t.issues, x, 2)
            }), n7(r, "addIssues", t => n => {
                t.issues.push(...n), t.message = JSON.stringify(t.issues, x, 2)
            }), Object.defineProperty(r, "isEmpty", {
                configurable: !0,
                enumerable: !1,
                get() {
                    return 0 === this.issues.length
                }
            }))
        }, void 0, {
            Parent: Error
        }),
        re = eA(n8),
        rt = eE(n8),
        rn = eS(n8),
        rr = ex(n8),
        ri = (i = eA(n8), o = (t, n, r, a) => i(t, n, r ? {
            ...r,
            direction: "backward"
        } : {
            direction: "backward"
        }, eO(o, a))),
        ro = (a = eA(n8), u = (t, n, r, i) => a(t, n, r, eO(u, i))),
        ra = (s = eE(n8), l = async (t, n, r, i) => {
            let o = r ? {
                ...r,
                direction: "backward"
            } : {
                direction: "backward"
            };
            return await s(t, n, o, eO(l, i))
        }),
        ru = (c = eE(n8), d = async (t, n, r, i) => await c(t, n, r, eO(d, i))),
        rs = async (t, n, r) => {
            let i = r ? {
                ...r,
                direction: "backward"
            } : {
                direction: "backward"
            };
            return ex(n8)(t, n, i)
        }, rl = async (t, n, r) => ex(n8)(t, n, r);

    function rc() {
        e_.memoizer || eb({
            memoizer: nz
        })
    }
    let rd = ev("ZodType", (t, n) => (e_.localeError || eb({
            localeError: (() => {
                let t = {
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
                    n = {
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
                    r = {
                        nan: "NaN"
                    };

                function i(t, n) {
                    var i;
                    return "number" !== t || "number" != typeof n || Number.isFinite(n) ? null != (i = r[t]) ? i : t : String(n)
                }
                return r => {
                    var o, a, u, s, l, c;
                    switch (r.code) {
                        case "invalid_type": {
                            let t = i(r.expected),
                                n = i(function(t) {
                                    let n = typeof t;
                                    switch (n) {
                                        case "number":
                                            return Number.isNaN(t) ? "nan" : "number";
                                        case "object":
                                            if (null === t) return "null";
                                            if (Array.isArray(t)) return "array";
                                            if (t && Object.getPrototypeOf(t) !== Object.prototype && "constructor" in t && t.constructor) return t.constructor.name
                                    }
                                    return n
                                }(r.input), r.input);
                            return "Invalid input: expected ".concat(t, ", received ").concat(n)
                        }
                        case "invalid_value":
                            if (1 === r.values.length) return "Invalid input: expected ".concat(q(r.values[0]));
                            return "Invalid option: expected one of ".concat(T(r.values, "|"));
                        case "too_big": {
                            let n = r.exact ? "exactly " : r.inclusive ? "<=" : "<",
                                i = null != (o = t[r.origin]) ? o : null;
                            if (i) return "Too big: expected ".concat(null != (a = r.origin) ? a : "value", " to have ").concat(n).concat(r.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "elements");
                            return "Too big: expected ".concat(null != (s = r.origin) ? s : "value", " to be ").concat(n).concat(r.maximum.toString())
                        }
                        case "too_small": {
                            let n = r.exact ? "exactly " : r.inclusive ? ">=" : ">",
                                i = null != (l = t[r.origin]) ? l : null;
                            if (i) return "Too small: expected ".concat(r.origin, " to have ").concat(n).concat(r.minimum.toString(), " ").concat(i.unit);
                            return "Too small: expected ".concat(r.origin, " to be ").concat(n).concat(r.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === r.format) return 'Invalid string: must start with "'.concat(r.prefix, '"');
                            if ("ends_with" === r.format) return 'Invalid string: must end with "'.concat(r.suffix, '"');
                            if ("includes" === r.format) return 'Invalid string: must include "'.concat(r.includes, '"');
                            if ("regex" === r.format) return "Invalid string: must match pattern ".concat(r.pattern);
                            return "Invalid ".concat(null != (c = n[r.format]) ? c : r.format);
                        case "not_multiple_of":
                            return "Invalid number: must be a multiple of ".concat(r.divisor);
                        case "unrecognized_keys":
                            return "Unrecognized key".concat(r.keys.length > 1 ? "s" : "", ": ").concat(T(r.keys, ", "));
                        case "invalid_key":
                            return "Invalid key in ".concat(r.origin);
                        case "invalid_union":
                            if (r.options && Array.isArray(r.options) && r.options.length > 0) {
                                let t = r.options.map(t => "'".concat(t, "'")).join(" | ");
                                return "Invalid discriminator value. Expected ".concat(t)
                            }
                            if (!1 === r.inclusive) return "Invalid input: more than one option matched";
                            return "Invalid input";
                        case "invalid_element":
                            return "Invalid value in ".concat(r.origin);
                        default:
                            return "Invalid input"
                    }
                }
            })()
        }), tl.init(t, n), t.def = n, t.type = n.type, t), {
            check() {
                for (var t, n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
                let o = this.def;
                return this.clone(N(o, {
                    checks: [...null != (t = o.checks) ? t : [], ...r.map(t => "function" == typeof t ? {
                        _zod: {
                            check: t,
                            def: {
                                check: "custom"
                            },
                            onattach: []
                        }
                    } : t)]
                }), {
                    parent: !0
                })
            },
            with() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(...n)
            },
            clone(t, n) {
                return K(this, t, n)
            },
            brand() {
                return this
            },
            register(t, n) {
                return t.add(this, n), this
            },
            refine(t, n) {
                return this.check(function(t) {
                    let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    return new r8({
                        type: "custom",
                        check: "custom",
                        fn: t,
                        ...W(n)
                    })
                }(t, n))
            },
            superRefine(t, n) {
                var r;
                let i, o;
                return this.check((r = n => (n.addIssue = t => {
                    "string" == typeof t ? n.issues.push(el(t, n.value, i._zod.def)) : (t.fatal && (t.continue = !1), null != t.code || (t.code = "custom"), "input" in t || (t.input = n.value), null != t.inst || (t.inst = i), null != t.continue || (t.continue = !i._zod.def.abort), n.issues.push(el(t)))
                }, t(n.value, n)), (o = new e9({
                    check: "custom",
                    ...W(n)
                }))._zod.check = r, i = o))
            },
            overwrite(t) {
                return this.check(nS(t))
            },
            optional() {
                return rY(this)
            },
            exactOptional() {
                return new rQ({
                    type: "optional",
                    innerType: this
                })
            },
            nullable() {
                return r1(this)
            },
            nullish() {
                return rY(r1(this))
            },
            nonoptional(t) {
                return new r9({
                    type: "nonoptional",
                    innerType: this,
                    ...W(t)
                })
            },
            array() {
                return new rU({
                    type: "array",
                    element: this,
                    ...W(void 0)
                })
            },
            or(t) {
                return new rV({
                    type: "union",
                    options: [this, t],
                    ...W(void 0)
                })
            },
            and(t) {
                return new rH({
                    type: "intersection",
                    left: this,
                    right: t
                })
            },
            transform(t) {
                return r5(this, new rG({
                    type: "transform",
                    transform: t
                }))
            },
            default (t) {
                return new r2({
                    type: "default",
                    innerType: this,
                    get defaultValue() {
                        return "function" == typeof t ? t() : M(t)
                    }
                })
            },
            prefault(t) {
                return new r6({
                    type: "prefault",
                    innerType: this,
                    get defaultValue() {
                        return "function" == typeof t ? t() : M(t)
                    }
                })
            },
            catch (t) {
                let n;
                return new r4({
                    type: "catch",
                    innerType: this,
                    catchValue: "function" == typeof t ? t : ((n = () => t)["~constantCatch"] = !0, n)
                })
            },
            pipe(t) {
                return r5(this, t)
            },
            readonly() {
                return new r7({
                    type: "readonly",
                    innerType: this
                })
            },
            describe(t) {
                let n = this.clone();
                return nk.add(n, {
                    description: t
                }), n
            },
            meta() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                if (0 === n.length) return nk.get(this);
                let i = this.clone();
                return nk.add(i, n[0]), i
            },
            isOptional() {
                return this.safeParse(void 0).success
            },
            isNullable() {
                return this.safeParse(null).success
            },
            apply(t) {
                for (var n = arguments.length, r = Array(n > 1 ? n - 1 : 0), i = 1; i < n; i++) r[i - 1] = arguments[i];
                return 0 === r.length ? t(this) : t(this, ...r)
            },
            get "~standard"() {
                return ec(this, "~standard", {
                    ...tf(this),
                    jsonSchema: {
                        input: nL(this, "input"),
                        output: nL(this, "output")
                    }
                }, !1)
            },
            set "~standard"(value) {
                ec(this, "~standard", value)
            },
            parse: function t(n, r) {
                return re(this, n, r, {
                    callee: t
                })
            },
            parseAsync: async function t(n, r) {
                return await rt(this, n, r, {
                    callee: t
                })
            },
            safeParse(t, n) {
                return rn(this, t, n)
            },
            async safeParseAsync(t, n) {
                return rr(this, t, n)
            },
            get spa() {
                return null === this || void 0 === this ? void 0 : this.safeParseAsync
            },
            set spa(value) {
                ec(this, "spa", value)
            },
            validate(t, n) {
                let r = this._zod.bag.validator;
                if (void 0 !== r) {
                    if (r(t) !== eP) return !0;
                    if (!0 === r.definite && void 0 === n) return !1
                }
                return function(t, n, r) {
                    let i, o = r ? {
                            ...r,
                            async: !1,
                            abortEarly: !0
                        } : {
                            async: !1,
                            abortEarly: !0
                        },
                        a = t._zod.bag.fallbackRun;
                    if (a ? (o[ej] = !0, i = a({
                            value: n,
                            issues: []
                        }, o)) : i = t._zod.run({
                            value: n,
                            issues: []
                        }, o), i instanceof Promise) throw new ey;
                    return 0 === i.issues.length
                }(this, t, n)
            },
            validateAsync(t, n) {
                return eC(this, t, n)
            },
            encode: function t(n, r) {
                return ri(this, n, r, {
                    callee: t
                })
            },
            decode: function t(n, r) {
                return ro(this, n, r, {
                    callee: t
                })
            },
            encodeAsync: async function t(n, r) {
                return await ra(this, n, r, {
                    callee: t
                })
            },
            decodeAsync: async function t(n, r) {
                return await ru(this, n, r, {
                    callee: t
                })
            },
            safeEncode(t, n) {
                let r;
                return r = n ? {
                    ...n,
                    direction: "backward"
                } : {
                    direction: "backward"
                }, eS(n8)(this, t, r)
            },
            safeDecode(t, n) {
                return eS(n8)(this, t, n)
            },
            async safeEncodeAsync(t, n) {
                return rs(this, t, n)
            },
            async safeDecodeAsync(t, n) {
                return rl(this, t, n)
            },
            toJSONSchema(t) {
                return (function(t) {
                    let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    return r => {
                        let i = nx({
                            ...r,
                            processors: n
                        });
                        return nj(t, i), nI(i, t), nN(i, t)
                    }
                })(this, {})(t)
            },
            get description() {
                var rf;
                return null == (rf = nk.get(this)) ? void 0 : rf.description
            },
            get _def() {
                return this._zod.def
            }
        }),
        rp = ev("_ZodString", (t, n) => {
            tp.init(t, n), rd.init(t, n), t._zod.processJSONSchema = (n, r, i) => ((t, n, r) => {
                var i;
                r.type = "string";
                let {
                    minimum: o,
                    maximum: a,
                    format: u,
                    patterns: s,
                    contentEncoding: l,
                    laxFormat: c
                } = nY(t);
                if ("number" == typeof o && (r.minLength = o), "number" == typeof a && (r.maxLength = a), u && (r.format = null != (i = nQ[u]) ? i : u, "" === r.format && delete r.format, ("time" === u || c) && delete r.format), l && (r.contentEncoding = l), s && s.size > 0) {
                    let t = [...s].map(n1);
                    1 === t.length ? r.pattern = t[0].source : t.length > 1 && (r.allOf = [...t.map(t => ({
                        ..."draft-07" === n.target || "draft-04" === n.target || "openapi-3.0" === n.target ? {
                            type: "string"
                        } : {},
                        pattern: t.source
                    }))])
                }
            })(t, n, r)
        }, function(t, n) {
            for (let r in t) {
                let i = t[r];
                Object.defineProperty(n, r, {
                    configurable: !0,
                    enumerable: !0,
                    get() {
                        return ec(this, r, i(this))
                    },
                    set(t) {
                        ec(this, r, t)
                    }
                })
            }
            return n
        }({
            format: t => {
                var n;
                return null != (n = nY(t).format) ? n : null
            },
            minLength: t => {
                var n;
                return null != (n = nY(t).minimum) ? n : null
            },
            maxLength: t => {
                var n;
                return null != (n = nY(t).maximum) ? n : null
            }
        }, {
            regex() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(function(t, n) {
                    return new te({
                        check: "string_format",
                        format: "regex",
                        ...W(n),
                        pattern: t
                    })
                }(...n))
            },
            includes() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(function(t, n) {
                    return new tr({
                        check: "string_format",
                        format: "includes",
                        ...W(n),
                        includes: t
                    })
                }(...n))
            },
            startsWith() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(function(t, n) {
                    return new ti({
                        check: "string_format",
                        format: "starts_with",
                        ...W(n),
                        prefix: t
                    })
                }(...n))
            },
            endsWith() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(function(t, n) {
                    return new to({
                        check: "string_format",
                        format: "ends_with",
                        ...W(n),
                        suffix: t
                    })
                }(...n))
            },
            min() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(nA(...n))
            },
            max() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(nO(...n))
            },
            length() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(nE(...n))
            },
            nonempty() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(nA(1, ...n))
            },
            lowercase(t) {
                return this.check(new tt({
                    check: "string_format",
                    format: "lowercase",
                    ...W(t)
                }))
            },
            uppercase(t) {
                return this.check(new tn({
                    check: "string_format",
                    format: "uppercase",
                    ...W(t)
                }))
            },
            trim() {
                return this.check(nS(t => t.trim()))
            },
            normalize() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(function(t) {
                    return nS(n => n.normalize(t))
                }(...n))
            },
            toLowerCase() {
                return this.check(nS(t => t.toLowerCase()))
            },
            toUpperCase() {
                return this.check(nS(t => t.toUpperCase()))
            },
            slugify() {
                return this.check(nS(t => t.toLowerCase().trim().replace(/[^\w\s-]/g, "").replace(/[\s_-]+/g, "-").replace(/^-+|-+$/g, "")))
            }
        })),
        rh = ev("ZodString", (t, n) => {
            tp.init(t, n), rp.init(t, n)
        }, {
            email(t) {
                return this.check(new rF({
                    type: "string",
                    format: "email",
                    check: "string_format",
                    abort: !1,
                    ...W(t)
                }))
            },
            url(t) {
                return this.check(new rk({
                    type: "string",
                    format: "url",
                    check: "string_format",
                    abort: !1,
                    ...W(t)
                }))
            },
            jwt(t) {
                return this.check(new rN({
                    type: "string",
                    format: "jwt",
                    check: "string_format",
                    abort: !1,
                    ...W(t)
                }))
            },
            emoji(t) {
                return this.check(new rO({
                    type: "string",
                    format: "emoji",
                    check: "string_format",
                    abort: !1,
                    ...W(t)
                }))
            },
            guid(t) {
                return this.check(new rw({
                    type: "string",
                    format: "guid",
                    check: "string_format",
                    abort: !1,
                    ...W(t)
                }))
            },
            uuid(t) {
                return this.check(new rz({
                    type: "string",
                    format: "uuid",
                    check: "string_format",
                    abort: !1,
                    ...W(t)
                }))
            },
            uuidv4(t) {
                return this.check(new rz({
                    type: "string",
                    format: "uuid",
                    check: "string_format",
                    abort: !1,
                    version: "v4",
                    ...W(t)
                }))
            },
            uuidv6(t) {
                return this.check(new rz({
                    type: "string",
                    format: "uuid",
                    check: "string_format",
                    abort: !1,
                    version: "v6",
                    ...W(t)
                }))
            },
            uuidv7(t) {
                return this.check(new rz({
                    type: "string",
                    format: "uuid",
                    check: "string_format",
                    abort: !1,
                    version: "v7",
                    ...W(t)
                }))
            },
            nanoid(t) {
                return this.check(new rA({
                    type: "string",
                    format: "nanoid",
                    check: "string_format",
                    abort: !1,
                    ...W(t)
                }))
            },
            cuid(t) {
                return this.check(new rE({
                    type: "string",
                    format: "cuid",
                    check: "string_format",
                    abort: !1,
                    ...W(t)
                }))
            },
            cuid2(t) {
                return this.check(new rS({
                    type: "string",
                    format: "cuid2",
                    check: "string_format",
                    abort: !1,
                    ...W(t)
                }))
            },
            ulid(t) {
                return this.check(new rT({
                    type: "string",
                    format: "ulid",
                    check: "string_format",
                    abort: !1,
                    ...W(t)
                }))
            },
            base64(t) {
                return this.check(new rR({
                    type: "string",
                    format: "base64",
                    check: "string_format",
                    abort: !1,
                    ...W(t)
                }))
            },
            base64url(t) {
                return this.check(new rZ({
                    type: "string",
                    format: "base64url",
                    check: "string_format",
                    abort: !1,
                    ...W(t)
                }))
            },
            xid(t) {
                return this.check(new rx({
                    type: "string",
                    format: "xid",
                    check: "string_format",
                    abort: !1,
                    ...W(t)
                }))
            },
            ksuid(t) {
                return this.check(new rP({
                    type: "string",
                    format: "ksuid",
                    check: "string_format",
                    abort: !1,
                    ...W(t)
                }))
            },
            ipv4(t) {
                return this.check(new rj({
                    type: "string",
                    format: "ipv4",
                    check: "string_format",
                    abort: !1,
                    ...W(t)
                }))
            },
            ipv6(t) {
                return this.check(new rC({
                    type: "string",
                    format: "ipv6",
                    check: "string_format",
                    abort: !1,
                    ...W(t)
                }))
            },
            cidrv4(t) {
                return this.check(new rI({
                    type: "string",
                    format: "cidrv4",
                    check: "string_format",
                    abort: !1,
                    ...W(t)
                }))
            },
            cidrv6(t) {
                return this.check(new r$({
                    type: "string",
                    format: "cidrv6",
                    check: "string_format",
                    abort: !1,
                    ...W(t)
                }))
            },
            e164(t) {
                return this.check(new rD({
                    type: "string",
                    format: "e164",
                    check: "string_format",
                    abort: !1,
                    ...W(t)
                }))
            },
            datetime(t) {
                return this.check(new ry({
                    type: "string",
                    format: "datetime",
                    check: "string_format",
                    offset: !1,
                    local: !1,
                    precision: null,
                    ...W(t)
                }))
            },
            date(t) {
                return this.check(new rg({
                    type: "string",
                    format: "date",
                    check: "string_format",
                    ...W(t)
                }))
            },
            time(t) {
                return this.check(new r_({
                    type: "string",
                    format: "time",
                    check: "string_format",
                    precision: null,
                    ...W(t)
                }))
            },
            duration(t) {
                return this.check(new rb({
                    type: "string",
                    format: "duration",
                    check: "string_format",
                    ...W(t)
                }))
            }
        });

    function rm(t) {
        var n;
        return new rh(((n = {
            type: "string",
            ...W(t)
        }).checks && (n.checks = [...n.checks]), n))
    }
    let rv = ev("ZodStringFormat", (t, n) => {
            th.init(t, n), rp.init(t, n)
        }),
        ry = ev("ZodISODateTime", (t, n) => {
            tT.init(t, n), rv.init(t, n)
        }),
        rg = ev("ZodISODate", (t, n) => {
            tx.init(t, n), rv.init(t, n)
        }),
        r_ = ev("ZodISOTime", (t, n) => {
            tP.init(t, n), rv.init(t, n)
        }),
        rb = ev("ZodISODuration", (t, n) => {
            tj.init(t, n), rv.init(t, n)
        }),
        rF = ev("ZodEmail", (t, n) => {
            ty.init(t, n), rv.init(t, n)
        }),
        rw = ev("ZodGUID", (t, n) => {
            tm.init(t, n), rv.init(t, n)
        }),
        rz = ev("ZodUUID", (t, n) => {
            tv.init(t, n), rv.init(t, n)
        }),
        rk = ev("ZodURL", (t, n) => {
            tF.init(t, n), rv.init(t, n)
        }),
        rO = ev("ZodEmoji", (t, n) => {
            tw.init(t, n), rv.init(t, n)
        }),
        rA = ev("ZodNanoID", (t, n) => {
            tz.init(t, n), rv.init(t, n)
        }),
        rE = ev("ZodCUID", (t, n) => {
            tk.init(t, n), rv.init(t, n)
        }),
        rS = ev("ZodCUID2", (t, n) => {
            tO.init(t, n), rv.init(t, n)
        }),
        rT = ev("ZodULID", (t, n) => {
            tA.init(t, n), rv.init(t, n)
        }),
        rx = ev("ZodXID", (t, n) => {
            tE.init(t, n), rv.init(t, n)
        }),
        rP = ev("ZodKSUID", (t, n) => {
            tS.init(t, n), rv.init(t, n)
        }),
        rj = ev("ZodIPv4", (t, n) => {
            tC.init(t, n), rv.init(t, n)
        }),
        rC = ev("ZodIPv6", (t, n) => {
            tR.init(t, n), rv.init(t, n)
        }),
        rI = ev("ZodCIDRv4", (t, n) => {
            tZ.init(t, n), rv.init(t, n)
        }),
        r$ = ev("ZodCIDRv6", (t, n) => {
            tD.init(t, n), rv.init(t, n)
        }),
        rR = ev("ZodBase64", (t, n) => {
            tB.init(t, n), rv.init(t, n)
        }),
        rZ = ev("ZodBase64URL", (t, n) => {
            tU.init(t, n), rv.init(t, n)
        }),
        rD = ev("ZodE164", (t, n) => {
            tM.init(t, n), rv.init(t, n)
        }),
        rN = ev("ZodJWT", (t, n) => {
            tV.init(t, n), rv.init(t, n)
        }),
        rL = ev("ZodUnknown", (t, n) => {
            tH.init(t, n), rd.init(t, n), t._zod.processJSONSchema = (t, n, r) => void 0
        });

    function rB() {
        return new rL({
            type: "unknown"
        })
    }
    let rJ = ev("ZodNever", (t, n) => {
            tK.init(t, n), rd.init(t, n), t._zod.processJSONSchema = (t, n, r) => {
                n.not = {}
            }
        }),
        rU = ev("ZodArray", (t, n) => {
            rc(), tq.init(t, n), rd.init(t, n), t._zod.processJSONSchema = (n, r, i) => ((t, n, r, i) => {
                let o = t._zod.def,
                    {
                        minimum: a,
                        maximum: u
                    } = nY(t);
                "number" == typeof a && (r.minItems = a), "number" == typeof u && (r.maxItems = u), r.type = "array", r.items = nj(o.element, n, {
                    ...i,
                    path: [...i.path, "items"]
                })
            })(t, n, r, i), t.element = n.element
        }, {
            min(t, n) {
                return this.check(nA(t, n))
            },
            nonempty(t) {
                return this.check(nA(1, t))
            },
            max(t, n) {
                return this.check(nO(t, n))
            },
            length(t, n) {
                return this.check(nE(t, n))
            },
            unwrap() {
                return this.element
            }
        }),
        rM = ev("ZodObject", (t, n) => {
            var r;
            let i, o;
            rc(), t1.init(t, n), rd.init(t, n), t._zod.processJSONSchema = (n, r, i) => ((t, n, r, i) => {
                var o;
                let a = t._zod.def,
                    u = a.shape;
                if (Object.getOwnPropertySymbols(u).length && nP(t, n, r, i, "Symbol keys cannot be represented in JSON Schema")) return;
                for (let t in r.type = "object", r.properties = {}, u) C(r.properties, t, nj(u[t], n, {
                    ...i,
                    path: [...i.path, "properties", t]
                }));
                let s = [];
                for (let t of Object.keys(u)) {
                    let r = a.shape[t];
                    ("input" === n.io ? void 0 === n2(r) : void 0 === r._zod.optout) && s.push(t)
                }
                s.length > 0 && (r.required = s), (null == (o = a.catchall) ? void 0 : o._zod.def.type) === "never" ? r.additionalProperties = !1 : a.catchall ? a.catchall && (r.additionalProperties = nj(a.catchall, n, {
                    ...i,
                    path: [...i.path, "additionalProperties"]
                })) : "output" === n.io && (r.additionalProperties = !1)
            })(t, n, r, i), (o = (r = "shape") in(i = Object.getPrototypeOf(t)) ? void 0 : i) && Object.defineProperty(o, r, {
                configurable: !0,
                get() {
                    let t = {
                        configurable: !0,
                        writable: !0,
                        enumerable: !1,
                        value: void 0
                    };
                    return Object.defineProperty(this, r, t), t.value = this._zod.def.shape, Object.defineProperty(this, r, t), t.value
                },
                set(t) {
                    Object.defineProperty(this, r, {
                        configurable: !0,
                        writable: !0,
                        enumerable: !1,
                        value: t
                    })
                }
            })
        }, {
            keyof() {
                var t;
                return new rq({
                    type: "enum",
                    entries: Array.isArray(t = Object.keys(this._zod.def.shape)) ? Object.fromEntries(t.map(t => [t, t])) : t,
                    ...W(void 0)
                })
            },
            catchall(t) {
                return this.clone(N(this._zod.def, {
                    catchall: t
                }))
            },
            passthrough() {
                return this.clone(N(this._zod.def, {
                    catchall: rB()
                }))
            },
            loose() {
                return this.clone(N(this._zod.def, {
                    catchall: rB()
                }))
            },
            strict() {
                return this.clone(N(this._zod.def, {
                    catchall: new rJ({
                        type: "never",
                        ...W(void 0)
                    })
                }))
            },
            strip() {
                return this.clone(N(this._zod.def, {
                    catchall: void 0
                }))
            },
            extend(t) {
                if (!U(t)) throw Error("Invalid input to extend: expected a plain object");
                let n = this._zod.def.checks;
                if (n && n.length > 0) {
                    let n = $(this);
                    for (let r of Reflect.ownKeys(t))
                        if (void 0 !== Object.getOwnPropertyDescriptor(n, r)) throw Error("Cannot overwrite keys on object schemas containing refinements. Use `.safeExtend()` instead.")
                }
                return K(this, N(this._zod.def, {
                    shape: Q(this, t)
                }))
            },
            safeExtend(t) {
                if (!U(t)) throw Error("Invalid input to safeExtend: expected a plain object");
                return K(this, N(this._zod.def, {
                    shape: Q(this, t)
                }))
            },
            merge(t) {
                var n, r, i;
                if (!(null == t || null == (r = t._zod) ? void 0 : r.def)) throw Error("Invalid input to merge: expected an object schema. To merge a plain shape, use `.extend()`.");
                if (null == (i = this._zod.def.checks) ? void 0 : i.length) throw Error(".merge() cannot be used on object schemas containing refinements. Use .safeExtend() instead.");
                let o = {};
                return D(o, this, Reflect.ownKeys($(this))), D(o, t, Reflect.ownKeys($(t))), K(this, N(this._zod.def, {
                    shape: o,
                    get catchall() {
                        return t._zod.def.catchall
                    },
                    checks: null != (n = t._zod.def.checks) ? n : []
                }))
            },
            pick(t) {
                return function(t, n) {
                    let r = t._zod.def,
                        i = r.checks;
                    if (i && i.length > 0) throw Error(".pick() cannot be used on object schemas containing refinements");
                    let o = {};
                    return D(o, t, Y(t, n)), K(t, N(r, {
                        shape: o,
                        checks: []
                    }))
                }(this, t)
            },
            omit(t) {
                return function(t, n) {
                    let r = t._zod.def,
                        i = r.checks;
                    if (i && i.length > 0) throw Error(".omit() cannot be used on object schemas containing refinements");
                    let o = new Set(Y(t, n)),
                        a = {};
                    return D(a, t, Reflect.ownKeys($(t)).filter(t => !o.has(t))), K(t, N(r, {
                        shape: a,
                        checks: []
                    }))
                }(this, t)
            },
            partial() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return ee(rX, this, n[0])
            },
            exactPartial() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return ee(rQ, this, n[0], "exactPartial")
            },
            required() {
                let t, n;
                for (var r, i = arguments.length, o = Array(i), a = 0; a < i; a++) o[a] = arguments[a];
                return t = (r = o[0]) ? new Set(Y(this, r)) : void 0, D(n = {}, this, Reflect.ownKeys($(this)), (n, r) => t && !t.has(r) ? n : new r9({
                    type: "nonoptional",
                    innerType: n
                })), K(this, N(this._zod.def, {
                    shape: n
                }))
            }
        }),
        rV = ev("ZodUnion", (t, n) => {
            t6.init(t, n), rd.init(t, n), t._zod.processJSONSchema = (n, r, i) => {
                let o, a, u;
                return a = !1 === (o = t._zod.def).inclusive, u = o.options.map((t, r) => nj(t, n, {
                    ...i,
                    path: [...i.path, a ? "oneOf" : "anyOf", r]
                })), void(a ? r.oneOf = u : r.anyOf = u)
            }, t.options = n.options
        }),
        rH = ev("ZodIntersection", (t, n) => {
            t9.init(t, n), rd.init(t, n), t._zod.processJSONSchema = (n, r, i) => {
                let o, a, u, s, l;
                return a = nj((o = t._zod.def).left, n, {
                    ...i,
                    path: [...i.path, "allOf", 0]
                }), u = nj(o.right, n, {
                    ...i,
                    path: [...i.path, "allOf", 1]
                }), void(r.allOf = l = [...(s = t => "allOf" in t && 1 === Object.keys(t).length)(a) ? a.allOf : [a], ...s(u) ? u.allOf : [u]], n.intersections.push(l))
            }
        }),
        rK = ev("ZodRecord", (t, n) => {
            rc(), t3.init(t, n), rd.init(t, n), t._zod.processJSONSchema = (n, r, i) => ((t, n, r, i) => {
                let o = t._zod.def;
                r.type = "object";
                let a = o.keyType,
                    u = nY(a).patterns;
                if ("loose" === o.mode && u && u.size > 0) {
                    let t = nj(o.valueType, n, {
                        ...i,
                        path: [...i.path, "patternProperties", "*"]
                    });
                    for (let n of (r.patternProperties = {}, u)) C(r.patternProperties, n1(n).source, t)
                } else {
                    if ("draft-07" === n.target || "draft-2020-12" === n.target) {
                        r.propertyNames = nj(o.keyType, n, {
                            ...i,
                            path: [...i.path, "propertyNames"]
                        });
                        let a = n6.get(n);
                        a || (a = [], n6.set(n, a), n.deferred.push(() => (function(t) {
                            var n, r, i;
                            let o = new Map;
                            for (let n of t.seen.values()) n.def && !o.has(n.schema) && o.set(n.schema, n);
                            let a = new Map;
                            for (let u of null != (n = n6.get(t)) ? n : []) {
                                let n = t.seen.get(u),
                                    s = null == (i = null != (r = null == n ? void 0 : n.def) ? r : null == n ? void 0 : n.schema) ? void 0 : i.propertyNames;
                                if (!s || !0 === s || a.has(s)) continue;
                                let l = function t(n, r, i) {
                                    var o, a;
                                    if (r.$ref) {
                                        if (i.has(r)) return r;
                                        i.add(r);
                                        let o = null == (a = n.get(r)) ? void 0 : a.def;
                                        if (!o) return r;
                                        let u = t(n, o, i);
                                        return u === o ? r : u
                                    }
                                    for (let o of ["anyOf", "oneOf"]) {
                                        let a = r[o];
                                        if (!Array.isArray(a)) continue;
                                        let u = a.map(r => t(n, r, i));
                                        u.some((t, n) => t !== a[n]) && (r = {
                                            ...r,
                                            [o]: u
                                        })
                                    }
                                    let u = Array.isArray(r.type) ? r.type : [r.type],
                                        s = !u.includes("string") && u.some(t => "number" === t || "integer" === t),
                                        l = null != (o = r.enum) ? o : void 0 !== r.const ? [r.const] : void 0;
                                    if (!s && !(null == l ? void 0 : l.some(t => "number" == typeof t))) return r;
                                    let {
                                        minimum: c,
                                        maximum: d,
                                        exclusiveMinimum: f,
                                        exclusiveMaximum: p,
                                        multipleOf: h,
                                        format: m,
                                        id: v,
                                        ...y
                                    } = r;
                                    return y.enum ? y.enum = y.enum.map(t => "number" == typeof t ? String(t) : t) : "number" == typeof y.const && (y.const = String(y.const)), s && (y.type = "string", l || (y.pattern = (u.includes("number") ? e1 : e0).source)), y
                                }(o, s, new Set);
                                l !== s && a.set(s, l)
                            }
                            if (a.size)
                                for (let n of t.seen.values())
                                    for (let t of [n.schema, n.def]) {
                                        let n = t && a.get(t.propertyNames);
                                        n && (t.propertyNames = n)
                                    }
                        })(n))), a.push(t)
                    }
                    r.additionalProperties = nj(o.valueType, n, {
                        ...i,
                        path: [...i.path, "additionalProperties"]
                    })
                }
                let s = a._zod.values,
                    l = "input" === n.io && void 0 !== n2(o.valueType);
                if (s && !o.partial && !l) {
                    let t = [...s].filter(t => "string" == typeof t || "number" == typeof t);
                    t.length > 0 && (r.required = t.map(String))
                }
            })(t, n, r, i), t.keyType = n.keyType, t.valueType = n.valueType
        });

    function rW(t, n, r) {
        return new rK(n && n._zod ? {
            type: "record",
            keyType: t,
            valueType: n,
            ...W(r)
        } : {
            type: "record",
            keyType: rm(),
            valueType: t,
            ...W(n)
        })
    }
    let rq = ev("ZodEnum", (t, n) => {
            t5.init(t, n), rd.init(t, n), t._zod.processJSONSchema = (n, r, i) => ((t, n) => {
                let r = S(t._zod.def.entries);
                if (0 === r.length) {
                    n.not = {};
                    return
                }
                r.every(t => "number" == typeof t) && (n.type = "number"), r.every(t => "string" == typeof t) && (n.type = "string"), n.enum = r
            })(t, r), t.enum = n.entries, t.options = [...t._zod.values];
            let r = new Set(Object.keys(n.entries));
            t.extract = (t, i) => {
                let o = {};
                for (let i of t)
                    if (r.has(i)) o[i] = n.entries[i];
                    else throw Error("Key ".concat(i, " not found in enum"));
                return new rq({
                    ...n,
                    checks: [],
                    ...W(i),
                    entries: o
                })
            }, t.exclude = (t, i) => {
                let o = {
                    ...n.entries
                };
                for (let n of t)
                    if (r.has(n)) delete o[n];
                    else throw Error("Key ".concat(n, " not found in enum"));
                return new rq({
                    ...n,
                    checks: [],
                    ...W(i),
                    entries: o
                })
            }
        }),
        rG = ev("ZodTransform", (t, n) => {
            rc(), t7.init(t, n), rd.init(t, n), t._zod.processJSONSchema = (n, r, i) => {
                nP(t, n, r, i, "Transforms cannot be represented in JSON Schema")
            }, t._zod.parse = (r, i) => {
                if ("backward" === i.direction) throw new eg(t.constructor.name);
                r.addIssue = i => {
                    "string" == typeof i ? r.issues.push(el(i, r.value, n)) : (i.fatal && (i.continue = !1), null != i.code || (i.code = "custom"), "input" in i || (i.input = r.value), null != i.inst || (i.inst = t), r.issues.push(el(i)))
                };
                let o = n.transform(r.value, r);
                return o instanceof Promise ? o.then(t => (r.value = t, r)) : (r.value = o, r)
            }
        }),
        rX = ev("ZodOptional", (t, n) => {
            ne.init(t, n), rd.init(t, n), t._zod.processJSONSchema = (n, r, i) => n3(t, n, r, i), t.unwrap = () => t._zod.def.innerType
        });

    function rY(t) {
        return new rX({
            type: "optional",
            innerType: t
        })
    }
    let rQ = ev("ZodExactOptional", (t, n) => {
            nt.init(t, n), rd.init(t, n), t._zod.processJSONSchema = (n, r, i) => n3(t, n, r, i), t.unwrap = () => t._zod.def.innerType
        }),
        r0 = ev("ZodNullable", (t, n) => {
            nn.init(t, n), rd.init(t, n), t._zod.processJSONSchema = (n, r, i) => {
                let o, a, u;
                return a = nj((o = t._zod.def).innerType, n, i), u = n.seen.get(t), void("openapi-3.0" === n.target ? (u.ref = o.innerType, r.nullable = !0) : r.anyOf = [a, {
                    type: "null"
                }])
            }, t.unwrap = () => t._zod.def.innerType
        });

    function r1(t) {
        return new r0({
            type: "nullable",
            innerType: t
        })
    }
    let r2 = ev("ZodDefault", (t, n) => {
            nr.init(t, n), rd.init(t, n), t._zod.processJSONSchema = (n, r, i) => {
                let o, a;
                return nj((o = t._zod.def).innerType, n, i), n.seen.get(t).ref = o.innerType, void((a = n4(o.defaultValue, t, n, r, i)) !== n9 && (r.default = a))
            }, t.unwrap = () => t._zod.def.innerType, t.removeDefault = t.unwrap
        }),
        r6 = ev("ZodPrefault", (t, n) => {
            no.init(t, n), rd.init(t, n), t._zod.processJSONSchema = (n, r, i) => ((t, n, r, i) => {
                let o = t._zod.def;
                if (nj(o.innerType, n, i), n.seen.get(t).ref = o.innerType, "input" !== n.io) return;
                let a = n4(o.defaultValue, t, n, r, i);
                a !== n9 && (r._prefault = a)
            })(t, n, r, i), t.unwrap = () => t._zod.def.innerType
        }),
        r9 = ev("ZodNonOptional", (t, n) => {
            na.init(t, n), rd.init(t, n), t._zod.processJSONSchema = (n, r, i) => {
                let o;
                nj((o = t._zod.def).innerType, n, i), n.seen.get(t).ref = o.innerType
            }, t.unwrap = () => t._zod.def.innerType
        }),
        r4 = ev("ZodCatch", (t, n) => {
            nl.init(t, n), rd.init(t, n), t._zod.processJSONSchema = (n, r, i) => ((t, n, r, i) => {
                let o, a = t._zod.def;
                nj(a.innerType, n, i), n.seen.get(t).ref = a.innerType;
                try {
                    o = a.catchValue(void 0)
                } catch (o) {
                    nP(t, n, r, i, "Dynamic catch values are not supported in JSON Schema");
                    return
                }
                r.default = o
            })(t, n, r, i), t.unwrap = () => t._zod.def.innerType, t.removeCatch = t.unwrap
        }),
        r3 = ev("ZodPipe", (t, n) => {
            nc.init(t, n), rd.init(t, n), t._zod.processJSONSchema = (n, r, i) => {
                let o, a, u;
                return a = (o = t._zod.def).in._zod.traits.has("$ZodTransform"), void(nj(u = "input" === n.io ? a ? o.out : o.in : o.out, n, i), n.seen.get(t).ref = u)
            }, t.in = n.in, t.out = n.out
        });

    function r5(t, n) {
        return new r3({
            type: "pipe",
            in: t,
            out: n
        })
    }
    let r7 = ev("ZodReadonly", (t, n) => {
            nf.init(t, n), rd.init(t, n), t._zod.processJSONSchema = (n, r, i) => {
                let o;
                nj((o = t._zod.def).innerType, n, i), n.seen.get(t).ref = o.innerType, r.readOnly = !0
            }, t.unwrap = () => t._zod.def.innerType
        }),
        r8 = ev("ZodCustom", (t, n) => {
            nh.init(t, n), rd.init(t, n), t._zod.processJSONSchema = (n, r, i) => {
                nP(t, n, r, i, "Custom types cannot be represented in JSON Schema")
            }
        }),
        ie = {
            [b.English]: F.English,
            [b.Spanish]: F.Spanish,
            [b.French]: F.French,
            [b.German]: F.German,
            [b.Italian]: F.Italian,
            [b.BrazilPortuguese]: F.BrazilPortuguese,
            [b.Korean]: F.Korean,
            [b.SimplifiedChinese]: F.SimplifiedChinese,
            [b.SimplifiedChineseJV]: F.SimplifiedChineseJV,
            [b.TraditionalChinese]: F.TraditionalChinese,
            [b.Japanese]: F.Japanese,
            [b.Russian]: F.Russian,
            [b.Indonesian]: F.Indonesian,
            [b.Polish]: F.Polish,
            [b.Vietnamese]: F.Vietnamese,
            [b.Turkish]: F.Turkish,
            [b.Arabic]: F.Arabic,
            [b.Thai]: F.Thai,
            [b.Hindi]: F.Hindi
        },
        it = (F.English, b.English, F.Spanish, b.Spanish, F.French, b.French, F.German, b.German, F.Italian, b.Italian, F.BrazilPortuguese, b.BrazilPortuguese, F.Korean, b.Korean, F.SimplifiedChinese, b.SimplifiedChinese, F.SimplifiedChineseJV, b.SimplifiedChineseJV, F.TraditionalChinese, b.TraditionalChinese, F.Japanese, b.Japanese, F.Russian, b.Russian, F.Indonesian, b.Indonesian, F.Polish, b.Polish, F.Vietnamese, b.Vietnamese, F.Turkish, b.Turkish, F.Arabic, b.Arabic, F.Thai, b.Thai, F.Hindi, b.Hindi, {
            [b.English]: w.English,
            [b.Spanish]: w.Spanish,
            [b.French]: w.French,
            [b.German]: w.German,
            [b.Italian]: w.Italian,
            [b.BrazilPortuguese]: w.BrazilPortuguese,
            [b.Korean]: w.Korean,
            [b.SimplifiedChinese]: w.SimplifiedChinese,
            [b.SimplifiedChineseJV]: w.SimplifiedChineseJV,
            [b.TraditionalChinese]: w.TraditionalChinese,
            [b.Japanese]: w.Japanese,
            [b.Russian]: w.Russian,
            [b.Indonesian]: w.Indonesian,
            [b.Polish]: w.Polish,
            [b.Vietnamese]: w.Vietnamese,
            [b.Turkish]: w.Turkish,
            [b.Arabic]: w.Arabic,
            [b.Thai]: w.Thai,
            [b.Hindi]: w.Hindi
        }),
        ir = (F.English, w.English, F.Spanish, w.Spanish, F.French, w.French, F.German, w.German, F.Italian, w.Italian, F.BrazilPortuguese, w.BrazilPortuguese, F.Korean, w.Korean, F.SimplifiedChinese, w.SimplifiedChinese, F.SimplifiedChineseJV, w.SimplifiedChineseJV, F.TraditionalChinese, w.TraditionalChinese, F.Japanese, w.Japanese, F.Russian, w.Russian, F.Indonesian, w.Indonesian, F.Polish, w.Polish, F.Vietnamese, w.Vietnamese, F.Turkish, w.Turkish, F.Arabic, w.Arabic, F.Thai, w.Thai, F.Hindi, w.Hindi, /^(\w+)_(\w+)$/),
        ii = /^(\w+)-(\w+)$/,
        io = rW(rm(), new rM({
            type: "object",
            shape: (f = {
                localizedString: rm()
            }, f),
            ...W(void 0)
        }).nullable().catch(null)),
        ia = rW(rm(), rm().nullable().catch(null)),
        iu = /{(.+?)}/,
        is = /{(.+?)}/g,
        il = /({.+?})/g,
        ic = t => void 0 !== t ? Object.entries(t).reduce((t, n) => {
            let [r, i] = n;
            return "string" == typeof i ? Object.assign(t.stringArgs, {
                [r]: i
            }) : Object.assign(t.htmlArgs, {
                [r]: i
            }), t
        }, {
            stringArgs: {},
            htmlArgs: {}
        }) : {};

    function id(t, n) {
        return void 0 !== n && 0 !== Object.keys(n).length ? t.replace(is, (t, r) => {
            var i;
            return null != (i = n[r]) ? i : "{".concat(r, "}")
        }) : t
    }

    function ip(t, n, r, i, o, a) {
        let u, s = t.split(il);
        if (1 === s.length) return t;
        if (s = s.filter(t => !!t), void 0 !== a && 0 !== Object.keys(a).length) {
            let t = s.reduce((t, n, r) => {
                if ("string" != typeof n) return t;
                let i = iu.exec(n);
                if (i) {
                    let n = i[1];
                    if (Object.hasOwn(a, n)) {
                        let i = t[n];
                        if (!i) return Object.assign(t, {
                            [n]: [r]
                        });
                        i.push(r)
                    }
                }
                return t
            }, {});
            Object.entries(a).forEach(n => {
                let [r, i] = n;
                if (Object.hasOwn(t, r))
                    for (let n of t[r]) s[n] = i
            })
        }
        if (!Array.isArray(o) || 0 === o.length) return (0, _.createElement)(_.Fragment, null, ...s);
        let l = o.reduce((t, n) => {
                let {
                    opening: r,
                    closing: i,
                    content: o
                } = n;
                return Object.assign(t, {
                    ["{".concat(r, "}")]: {
                        match: "{".concat(i, "}"),
                        content: o
                    }
                })
            }, {}),
            c = [],
            d = [],
            f = [];
        for (; u = s.shift();)
            if ("string" == typeof u && iu.test(u))
                if (Object.hasOwn(l, u)) d.push(u), f.push(u);
                else {
                    let t = d.pop();
                    if (void 0 !== t) {
                        let {
                            match: o,
                            content: a
                        } = l[t];
                        if (u === o) {
                            let o, u = [];
                            for (; o = f.pop();)
                                if (o !== t) u.unshift(o);
                                else {
                                    let t = null;
                                    t = a(u.every(t => "string" == typeof t) ? u : (0, _.createElement)(_.Fragment, null, ...u)), 0 === f.length ? c.push(t) : f.push(t);
                                    break
                                } if (void 0 === o) {
                                console.warn("[From context - ".concat(r, "] Unexpected condition encountered inside translateHTML for key ").concat(n, " of locale ").concat(i, "!"));
                                break
                            }
                        } else {
                            console.warn("[From context - ".concat(r, "] Unmatched closing tag ").concat(u, " encountered inside translateHTML for key ").concat(n, " of locale ").concat(i, "!"));
                            break
                        }
                    } else {
                        console.warn("[From context - ".concat(r, "] Unexpected condition encountered inside translateHTML for key ").concat(n, " of locale ").concat(i, "!"));
                        break
                    }
                }
        else 0 === f.length ? c.push(u) : f.push(u);
        return (0, _.createElement)(_.Fragment, null, ...c)
    }

    function ih() {
        let t = (0, _.useContext)(z),
            {
                key: n = "Unknown",
                resources: r,
                ready: i
            } = (0, _.useContext)(O),
            o = (0, _.useCallback)((i, o) => {
                if (void 0 === t) return console.warn("Localization context is missing, useTranslation cannot work outside of the LocalizationProvider"), "";
                let {
                    localeInfo: a
                } = t;
                if (null !== r) {
                    let t;
                    for (let n of Object.values(r)) Object.hasOwn(n, i) && (t = n[i]);
                    if (void 0 !== t) {
                        if (null != t) return id(t, o);
                        console.warn("[From context - ".concat(n, "] The translation of key '").concat(i, "' for locale '").concat(a.locale, "' does not exist!"))
                    } else console.warn("[From context - ".concat(n, "] The translation key '").concat(i, "' doesn't exist for locale '").concat(a.locale, "'!"))
                }
                return ""
            }, [t, n, r]),
            a = (0, _.useCallback)((i, o, a) => {
                if (void 0 === t) return console.warn("Localization context is missing, useTranslation cannot work outside of the LocalizationProvider"), "";
                let {
                    localeInfo: u
                } = t;
                if (null !== r) {
                    let t = r[i];
                    if (void 0 !== t && Object.hasOwn(t, o)) {
                        let r = t[o];
                        if (null != r) return id(r, a);
                        console.warn("[From context - ".concat(n, "] The translation of key '").concat(i, "::").concat(o, "' for locale '").concat(u.locale, "' does not exist!"))
                    } else console.warn("[From context - ".concat(n, "] The translation key '").concat(i, "::").concat(o, "' doesn't exist for locale '").concat(u.locale, "'!"))
                }
                return ""
            }, [t, n, r]),
            u = (0, _.useCallback)((r, i, a) => {
                if (void 0 === t) return console.warn("Localization context is missing, useTranslation cannot work outside of the LocalizationProvider"), "";
                let {
                    localeInfo: u
                } = t;
                if (void 0 === i && void 0 === a) return o(r);
                let {
                    stringArgs: s,
                    htmlArgs: l
                } = ic(a), c = o(r, s);
                return c ? ip(c, r, n, u.locale, i, l) : c
            }, [t, n, o]),
            s = (0, _.useCallback)((r, i, o, u) => {
                if (void 0 === t) return console.warn("Localization context is missing, useTranslation cannot work outside of the LocalizationProvider"), "";
                let {
                    localeInfo: s
                } = t;
                if (void 0 === o && void 0 === u) return a(r, i);
                let {
                    stringArgs: l,
                    htmlArgs: c
                } = ic(u), d = a(r, i, l);
                return d ? ip(d, i, n, s.locale, o, c) : d
            }, [t, n, a]);
        return (0, _.useMemo)(() => ({
            ready: i,
            translate: o,
            translateWithNamespace: a,
            translateHTML: u,
            translateWithNamespaceHTML: s
        }), [i, o, a, u, s])
    }
    let im = t => {
        let {
            namespace: n,
            translationKey: r,
            args: i,
            fallback: o = null
        } = t, {
            translateWithNamespace: a,
            ready: u
        } = ih();
        return u && a(n, r, i) || o
    };
    t.s(["CdnTranslationResourceProvider", 0, class extends E {
        loadRuntimeLocaleInfo() {
            var t, n;
            return null != (t = null == (n = this.runtimeLocaleInfoLoader) ? void 0 : n.call(this)) ? t : Promise.resolve(this.defaultLocaleInfo)
        }
        async fetchTranslationResource(t, n) {
            let r = n.replace(ii, (t, n, r) => "".concat(n.toLowerCase(), "_").concat(r.toLowerCase())),
                i = "https://translations-cdn.".concat(this.cdnDomain, "/").concat(this.consumerId, "/latest/").concat(r, "/").concat(t, ".json"),
                o = Object.fromEntries(Object.entries(io.parse(await fetch(i).then(t => t.json()))).map(t => {
                    var n;
                    let [r, i] = t;
                    return [r, null != (n = null == i ? void 0 : i.localizedString) ? n : null]
                }));
            if (!this.useLocalOverrides) return o;
            let a = await this.loadLocalOverrides(t, n);
            return {
                ...o,
                ...a
            }
        }
        async loadLocalOverrides(t, n) {
            try {
                let r = await fetch("".concat(this.localOverridesPath, "/").concat(n, "/").concat(t, ".json"));
                if (!r.ok) return {};
                return ia.parse(await r.json())
            } catch (t) {
                return {}
            }
        }
        constructor(t, {
            cdnDomain: n = "roblox.com",
            consumerId: r = 10,
            fallbackLocale: i,
            localOverridesPath: o = "/locales",
            useLocalOverrides: a = !1
        } = {}) {
            super(t, i), (0, g._)(this, "cdnDomain", void 0), (0, g._)(this, "consumerId", void 0), (0, g._)(this, "runtimeLocaleInfoLoader", void 0), (0, g._)(this, "localOverridesPath", void 0), (0, g._)(this, "useLocalOverrides", void 0), this.cdnDomain = n, this.consumerId = r, this.localOverridesPath = o, this.useLocalOverrides = a
        }
    }, "Locale", 0, b, "LocalizationProvider", 0, t => {
        let {
            provider: n,
            children: r
        } = t, [i, o] = (0, _.useState)(!1), [a, u] = (0, _.useState)(n.defaultLocaleInfo), s = (0, _.useMemo)(() => ({
            ready: i,
            localeInfo: a,
            setLocaleInfo: u
        }), [i, a]), l = (0, _.useMemo)(() => ({
            provider: n
        }), [n]);
        return (0, _.useEffect)(() => {
            !async function() {
                try {
                    let {
                        locale: t,
                        nativeName: r
                    } = await n.loadRuntimeLocaleInfo();
                    u({
                        locale: t,
                        nativeName: r
                    })
                } catch (t) {
                    console.warn("Failed to load runtime locale info, fallback to default locale info")
                } finally {
                    o(!0)
                }
            }()
        }, [n]), _.default.createElement(z.Provider, {
            value: s
        }, _.default.createElement(k.Provider, {
            value: l
        }, r))
    }, "NativeName", 0, w, "Translate", 0, function(t) {
        let {
            namespace: n,
            translationKey: r,
            args: i,
            fallback: o
        } = t, {
            provider: a
        } = (0, _.useContext)(k), u = (0, _.useContext)(z), [s, l] = (0, _.useState)(null);
        (0, _.useEffect)(() => {
            if (null === a || !(null == u ? void 0 : u.ready)) return;
            let {
                localeInfo: {
                    locale: t
                }
            } = u;
            a.loadTranslationResources([n], t).then(t => {
                l(A(t, [n]))
            })
        }, [u, a, n]);
        let c = (0, _.useMemo)(() => ({
            key: "Translate-".concat(n),
            resources: s,
            ready: null !== s
        }), [n, s]);
        return null === a ? _.default.createElement(im, {
            namespace: n,
            translationKey: r,
            args: i,
            fallback: o
        }) : _.default.createElement(O.Provider, {
            value: c
        }, _.default.createElement(im, {
            namespace: n,
            translationKey: r,
            args: i,
            fallback: o
        }))
    }, "toLocaleCode", 0, t => t.replace(ir, (t, n, r) => "".concat(n.toLowerCase(), "-").concat(r.toUpperCase())), "toLocaleNativeName", 0, t => it[t], "toRobloxLocale", 0, t => ie[t], "useLocalization", 0, function() {
        let t = (0, _.useContext)(z),
            n = (0, _.useMemo)(() => {
                if (void 0 !== t) {
                    let {
                        localeInfo: {
                            locale: n,
                            nativeName: r
                        },
                        setLocaleInfo: i
                    } = t;
                    return {
                        locale: n,
                        nativeName: r,
                        setLocaleInfo: i
                    }
                }
                return {
                    locale: null,
                    nativeName: null,
                    setLocaleInfo: t => {}
                }
            }, [t]);
        return void 0 === t && console.warn("Localization context is missing, useLocalization cannot work outside of the LocalizationProvider"), n
    }, "useTranslation", 0, ih, "useTranslationWithNamespace", 0, function(t) {
        let {
            ready: n,
            translateWithNamespace: r,
            translateWithNamespaceHTML: i
        } = ih(), o = (0, _.useCallback)((n, i) => r(t, n, i), [t, r]), a = (0, _.useCallback)((n, r, o) => i(t, n, r, o), [t, i]);
        return (0, _.useMemo)(() => ({
            ready: n,
            translate: o,
            translateHTML: a
        }), [n, o, a])
    }, "withTranslation", 0, function(t, n) {
        var r, i;
        let o = null != (r = null != (i = t.displayName) ? i : t.name) ? r : "Component",
            a = r => {
                let i = (0, _.useContext)(z),
                    {
                        provider: a
                    } = (0, _.useContext)(k),
                    [u, s] = (0, _.useState)(() => {
                        let t = null;
                        if ((null == i ? void 0 : i.ready) && null !== a) {
                            let {
                                localeInfo: {
                                    locale: r
                                }
                            } = i, o = a.getTranslationResources(n, r);
                            null !== o && (t = A(o, n))
                        } else void 0 === i && console.warn("Localization context is missing, withTranslation cannot work outside of the LocalizationProvider"), null === a && console.warn("TranslationResourceProvider context is missing, withTranslation cannot work outside of the TranslationResourceProvider");
                        return t
                    }),
                    l = (0, _.useMemo)(() => ({
                        key: o,
                        resources: u,
                        ready: null !== u
                    }), [u]);
                return (0, _.useEffect)(() => {
                    if ((null == i ? void 0 : i.ready) && null !== a) {
                        let {
                            localeInfo: {
                                locale: t
                            }
                        } = i;
                        a.loadTranslationResources(n, t).then(t => {
                            s(A(t, n))
                        })
                    }
                }, [i, a]), _.default.createElement(O.Provider, {
                    value: l
                }, _.default.createElement(t, r))
            };
        return a.displayName = "WithTranslation(".concat(o, ")"), a
    }])
}]);

//# debugId=aa44d9c2-68fc-d788-4e70-c5b478899afc
//# sourceMappingURL=27icrf3ntijiv.js.map