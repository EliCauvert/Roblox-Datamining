;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "1ab4c9a4-edd7-7378-cfb3-f1eae9447881")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 913826, 913785, 462534, 232360, 155281, 862359, 644520, 880002, 879376, 223280, 575177, 620331, 702800, e => {
    "use strict";
    let t, n;
    e.s(["BIGINT_FORMAT_RANGES", () => ei, "CONSTANT_CATCH", () => eJ, "Class", () => ej, "NUMBER_FORMAT_RANGES", () => er, "aborted", () => ev, "allowsEval", () => M, "assert", () => h, "assertEqual", () => m, "assertIs", () => p, "assertNever", () => g, "assertNotEqual", () => f, "assignProp", () => D, "attachSchema", () => e_, "base64ToUint8Array", () => eU, "base64urlToUint8Array", () => eD, "cached", () => w, "captureStackTrace", () => J, "cleanEnum", () => ez, "cleanRegex", () => x, "clone", () => Y, "cloneDef", () => E, "codePointLength", () => ew, "constantCatch", () => eB, "createTransparentProxy", () => ee, "defineLazy", () => U, "defineLazyInternal", () => eR, "derived", () => eC, "esc", () => R, "escapeRegex", () => H, "explicitlyAborted", () => ep, "extend", () => eu, "finalizeIssue", () => eb, "floatSafeRemainder", () => S, "getElementAtPath", () => C, "getEnumValues", () => _, "getLengthableOrigin", () => ek, "getParsedType", () => K, "getSizableOrigin", () => ey, "hexToUint8Array", () => eN, "hide", () => eE, "installLazyProp", () => eG, "isObject", () => B, "isPlainObject", () => F, "issue", () => eS, "joinValues", () => b, "jsonStringifyReplacer", () => y, "members", () => eZ, "merge", () => ed, "mergeDefs", () => T, "normalizeParams", () => Q, "nullish", () => k, "numKeys", () => q, "objectClone", () => A, "omit", () => ec, "optionalKeys", () => en, "own", () => eT, "parsedType", () => ex, "partial", () => em, "pick", () => ea, "prefixIssues", () => eg, "primitiveTypes", () => X, "promiseAllObject", () => $, "propertyKeyTypes", () => W, "randomString", () => L, "rawShape", () => P, "required", () => ef, "safeExtend", () => es, "shallowClone", () => V, "slugify", () => G, "stringifyPrimitive", () => et, "toZod", () => v, "uint8ArrayToBase64", () => eA, "uint8ArrayToBase64url", () => eP, "uint8ArrayToHex", () => eO, "unwrapMessage", () => eh], 462534), e.s(["$ZodAsyncError", () => u, "$ZodEncodeError", () => l, "$brand", () => c, "$constructor", () => o, "NEVER", () => r, "config", () => d, "globalConfig", () => s], 913785);
    let r = Object.freeze({
            status: "aborted"
        }),
        i = {
            value: void 0,
            enumerable: !1
        },
        a = "captureStackTrace" in Error ? Error : null;

    function o(e, t, n, r) {
        var o;

        function c(e) {
            this.def = e, this.constr = m, this.traits = new Set
        }
        c.prototype = {};
        let u = n && new WeakSet;

        function l(r, a) {
            if (r._zod) {
                if (r._zod.traits.has(e)) return
            } else {
                i.value = new c(a);
                try {
                    Object.defineProperty(r, "_zod", i)
                } finally {
                    i.value = void 0
                }
            }
            if (r._zod.traits.add(e), t(r, a), u) {
                let e = Object.getPrototypeOf(r),
                    t = r._zod.constr.prototype,
                    i = e;
                for (; i && i !== t;) i = Object.getPrototypeOf(i);
                let a = null != i ? i : e;
                u.has(a) || (u.add(a), eZ(a, n))
            }
            let o = m.prototype;
            for (let e in o) Object.prototype.hasOwnProperty.call(o, e) && (e in r || (r[e] = o[e].bind(r)))
        }
        let s = null != (o = null == r ? void 0 : r.Parent) ? o : Object;
        class d extends s {}

        function m(e) {
            var t;
            let n = (null == r ? void 0 : r.Parent) ? function(e) {
                let t = a;
                if (t) {
                    let n = t.stackTraceLimit;
                    if ("number" == typeof n) {
                        try {
                            t.stackTraceLimit = 0
                        } catch (t) {
                            return a = null, new e
                        }
                        try {
                            return new e
                        } finally {
                            t.stackTraceLimit = n
                        }
                    }
                }
                return new e
            }(d) : this;
            l(n, e);
            let i = n._zod.deferred;
            if (i) {
                for (let e of i) e();
                n._zod.deferred = void 0
            }
            let o = null == (t = globalThis.__zod_globalConfig) ? void 0 : t.postProcessor;
            return o && o(n), n
        }
        return Object.defineProperty(d, "name", {
            value: e
        }), Object.defineProperty(m, "init", {
            value: l
        }), Object.defineProperty(m, Symbol.hasInstance, {
            value: t => {
                var n, i;
                return null != r && !!r.Parent && t instanceof r.Parent || (null == t || null == (i = t._zod) || null == (n = i.traits) ? void 0 : n.has(e))
            }
        }), Object.defineProperty(m, "name", {
            value: e
        }), m
    }
    let c = Symbol("zod_brand");
    class u extends Error {
        constructor() {
            super("Encountered Promise during synchronous parse. Use .parseAsync() instead.")
        }
    }
    class l extends Error {
        constructor(e) {
            super("Encountered unidirectional transform during encode: ".concat(e)), this.name = "ZodEncodeError"
        }
    }
    null != (eM = globalThis).__zod_globalConfig || (eM.__zod_globalConfig = {});
    let s = globalThis.__zod_globalConfig;

    function d(e) {
        return e && Object.assign(s, e), s
    }

    function m(e) {
        return e
    }

    function f(e) {
        return e
    }

    function v() {
        return e => e
    }

    function p(e) {}

    function g(e) {
        throw Error("Unexpected value in exhaustive check")
    }

    function h(e) {}

    function _(e) {
        let t = Object.values(e).filter(e => "number" == typeof e);
        return Object.entries(e).filter(e => {
            let [n, r] = e;
            return -1 === t.indexOf(+n)
        }).map(e => {
            let [t, n] = e;
            return n
        })
    }

    function b(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "|";
        return e.map(e => et(e)).join(t)
    }

    function y(e, t) {
        return "bigint" == typeof t ? t.toString() : t
    }
    class I {
        get value() {
            let e = this._getter;
            return void 0 !== e && (this._value = e(), this._getter = void 0), this._value
        }
        constructor(e) {
            this._getter = e, this._value = void 0
        }
    }

    function w(e) {
        return new I(e)
    }

    function k(e) {
        return null == e
    }

    function x(e) {
        let t = +!!e.startsWith("^"),
            n = e.endsWith("$") ? e.length - 1 : e.length;
        return e.slice(t, n)
    }

    function S(e, t) {
        let n = e / t,
            r = Math.round(n),
            i = 4 * Number.EPSILON * Math.max(Math.abs(n), 1);
        return Math.abs(n - r) < i ? 0 : n - r
    }
    let z = Symbol("evaluating");

    function U(e, t, n) {
        let r;
        Object.defineProperty(e, t, {
            get() {
                if (r !== z) return void 0 === r && (r = z, r = n()), r
            },
            set(n) {
                Object.defineProperty(e, t, {
                    value: n
                })
            },
            configurable: !0
        })
    }

    function A(e) {
        return Object.create(Object.getPrototypeOf(e), Object.getOwnPropertyDescriptors(e))
    }

    function D(e, t, n) {
        Object.defineProperty(e, t, {
            value: n,
            writable: !0,
            enumerable: !0,
            configurable: !0
        })
    }

    function P(e) {
        let t = Object.getOwnPropertyDescriptor(e, "shape");
        return (null == t ? void 0 : t.get) ? t.get.raw : null == t ? void 0 : t.value
    }

    function N(e) {
        var t;
        return null != (t = P(e._zod.def)) ? t : e._zod.def.shape
    }

    function O(e, t, n) {
        Object.defineProperty(e, t, {
            get() {
                let e = n();
                return D(this, t, e), e
            },
            enumerable: !0,
            configurable: !0
        })
    }

    function j(e, t, n) {
        t in e ? D(e, t, n) : e[t] = n
    }

    function Z(e, t, n, r) {
        let i = N(t);
        for (let a of n) {
            let n = Object.getOwnPropertyDescriptor(i, a);
            n.enumerable && (n.get ? O(e, a, () => {
                let e = t._zod.def.shape[a];
                return r ? r(e, a) : e
            }) : j(e, a, r ? r(n.value, a) : n.value))
        }
    }

    function T() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        let r = {};
        for (let e of t) Object.assign(r, Object.getOwnPropertyDescriptors(e));
        return Object.defineProperties({}, r)
    }

    function E(e) {
        return T(e._zod.def)
    }

    function C(e, t) {
        return t ? t.reduce((e, t) => null == e ? void 0 : e[t], e) : e
    }

    function $(e) {
        let t = Object.keys(e);
        return Promise.all(t.map(t => e[t])).then(e => {
            let n = {};
            for (let r = 0; r < t.length; r++) n[t[r]] = e[r];
            return n
        })
    }

    function L() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 10,
            t = "abcdefghijklmnopqrstuvwxyz",
            n = "";
        for (let r = 0; r < e; r++) n += t[Math.floor(Math.random() * t.length)];
        return n
    }

    function R(e) {
        return JSON.stringify(e)
    }

    function G(e) {
        return e.toLowerCase().trim().replace(/[^\w\s-]/g, "").replace(/[\s_-]+/g, "-").replace(/^-+|-+$/g, "")
    }
    let J = "captureStackTrace" in Error ? Error.captureStackTrace : function() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n]
    };

    function B(e) {
        return "object" == typeof e && null !== e && !Array.isArray(e)
    }
    let M = w(() => {
        var e, t;
        if (s.jitless || "u" > typeof navigator && (null == (t = navigator) || null == (e = t.userAgent) ? void 0 : e.includes("Cloudflare"))) return !1;
        try {
            return Function(""), !0
        } catch (e) {
            return !1
        }
    });

    function F(e) {
        if (!1 === B(e)) return !1;
        let t = e.constructor;
        if (void 0 === t || "function" != typeof t) return !0;
        let n = t.prototype;
        return !1 !== B(n) && !1 !== Object.prototype.hasOwnProperty.call(n, "isPrototypeOf")
    }

    function V(e) {
        return F(e) ? {
            ...e
        } : Array.isArray(e) ? [...e] : e instanceof Map ? new Map(e) : e instanceof Set ? new Set(e) : e
    }

    function q(e) {
        let t = 0;
        for (let n in e) Object.prototype.hasOwnProperty.call(e, n) && t++;
        return t
    }
    let K = e => {
            let t = typeof e;
            switch (t) {
                case "undefined":
                    return "undefined";
                case "string":
                    return "string";
                case "number":
                    return Number.isNaN(e) ? "nan" : "number";
                case "boolean":
                    return "boolean";
                case "function":
                    return "function";
                case "bigint":
                    return "bigint";
                case "symbol":
                    return "symbol";
                case "object":
                    if (Array.isArray(e)) return "array";
                    if (null === e) return "null";
                    if (e.then && "function" == typeof e.then && e.catch && "function" == typeof e.catch) return "promise";
                    if ("u" > typeof Map && e instanceof Map) return "map";
                    if ("u" > typeof Set && e instanceof Set) return "set";
                    if ("u" > typeof Date && e instanceof Date) return "date";
                    if ("u" > typeof File && e instanceof File) return "file";
                    return "object";
                default:
                    throw Error("Unknown data type: ".concat(t))
            }
        },
        W = new Set(["string", "number", "symbol"]),
        X = new Set(["string", "number", "bigint", "boolean", "symbol", "undefined"]);

    function H(e) {
        return e.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
    }

    function Y(e, t, n) {
        let r = new e._zod.constr(null != t ? t : e._zod.def);
        return (!t || (null == n ? void 0 : n.parent)) && (r._zod.parent = e), r
    }

    function Q(e) {
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

    function ee(e) {
        let t;
        return new Proxy({}, {
            get: (n, r, i) => (null != t || (t = e()), Reflect.get(t, r, i)),
            set: (n, r, i, a) => (null != t || (t = e()), Reflect.set(t, r, i, a)),
            has: (n, r) => (null != t || (t = e()), Reflect.has(t, r)),
            deleteProperty: (n, r) => (null != t || (t = e()), Reflect.deleteProperty(t, r)),
            ownKeys: n => (null != t || (t = e()), Reflect.ownKeys(t)),
            getOwnPropertyDescriptor: (n, r) => (null != t || (t = e()), Reflect.getOwnPropertyDescriptor(t, r)),
            defineProperty: (n, r, i) => (null != t || (t = e()), Reflect.defineProperty(t, r, i))
        })
    }

    function et(e) {
        return "bigint" == typeof e ? e.toString() + "n" : "string" == typeof e ? '"'.concat(e, '"') : "".concat(e)
    }

    function en(e) {
        return Object.keys(e).filter(t => void 0 !== e[t]._zod.optin && "optional" === e[t]._zod.optout)
    }
    let er = {
            safeint: [Number.MIN_SAFE_INTEGER, Number.MAX_SAFE_INTEGER],
            int32: [-0x80000000, 0x7fffffff],
            uint32: [0, 0xffffffff],
            float32: [-34028234663852886e22, 34028234663852886e22],
            float64: [-Number.MAX_VALUE, Number.MAX_VALUE]
        },
        ei = {
            int64: [BigInt("-9223372036854775808"), BigInt("9223372036854775807")],
            uint64: [BigInt(0), BigInt("18446744073709551615")]
        };

    function ea(e, t) {
        let n = e._zod.def,
            r = n.checks;
        if (r && r.length > 0) throw Error(".pick() cannot be used on object schemas containing refinements");
        let i = {};
        return Z(i, e, eo(e, t)), Y(e, T(n, {
            shape: i,
            checks: []
        }))
    }

    function eo(e, t) {
        let n = N(e),
            r = [];
        for (let e of Reflect.ownKeys(t)) {
            var i;
            if (!(null == (i = Object.getOwnPropertyDescriptor(n, e)) ? void 0 : i.enumerable)) throw Error('Unrecognized key: "'.concat(String(e), '"'));
            t[e] && r.push(e)
        }
        return r
    }

    function ec(e, t) {
        let n = e._zod.def,
            r = n.checks;
        if (r && r.length > 0) throw Error(".omit() cannot be used on object schemas containing refinements");
        let i = new Set(eo(e, t)),
            a = {};
        return Z(a, e, Reflect.ownKeys(N(e)).filter(e => !i.has(e))), Y(e, T(n, {
            shape: a,
            checks: []
        }))
    }

    function eu(e, t) {
        if (!F(t)) throw Error("Invalid input to extend: expected a plain object");
        let n = e._zod.def.checks;
        if (n && n.length > 0) {
            let n = N(e);
            for (let e of Reflect.ownKeys(t))
                if (void 0 !== Object.getOwnPropertyDescriptor(n, e)) throw Error("Cannot overwrite keys on object schemas containing refinements. Use `.safeExtend()` instead.")
        }
        return Y(e, T(e._zod.def, {
            shape: el(e, t)
        }))
    }

    function el(e, t) {
        let n = {};
        Z(n, e, Reflect.ownKeys(N(e)));
        for (let e of Reflect.ownKeys(t)) {
            let r = Object.getOwnPropertyDescriptor(t, e);
            r.enumerable && (r.get ? O(n, e, () => t[e]) : j(n, e, r.value))
        }
        return n
    }

    function es(e, t) {
        if (!F(t)) throw Error("Invalid input to safeExtend: expected a plain object");
        return Y(e, T(e._zod.def, {
            shape: el(e, t)
        }))
    }

    function ed(e, t) {
        var n, r, i;
        if (!(null == t || null == (r = t._zod) ? void 0 : r.def)) throw Error("Invalid input to merge: expected an object schema. To merge a plain shape, use `.extend()`.");
        if (null == (i = e._zod.def.checks) ? void 0 : i.length) throw Error(".merge() cannot be used on object schemas containing refinements. Use .safeExtend() instead.");
        let a = {};
        Z(a, e, Reflect.ownKeys(N(e))), Z(a, t, Reflect.ownKeys(N(t)));
        let o = T(e._zod.def, {
            shape: a,
            get catchall() {
                return t._zod.def.catchall
            },
            checks: null != (n = t._zod.def.checks) ? n : []
        });
        return Y(e, o)
    }

    function em(e, t, n) {
        let r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : "partial",
            i = t._zod.def.checks;
        if (i && i.length > 0) throw Error(".".concat(r, "() cannot be used on object schemas containing refinements"));
        let a = n ? new Set(eo(t, n)) : void 0,
            o = {};
        return Z(o, t, Reflect.ownKeys(N(t)), e && ((t, n) => a && !a.has(n) ? t : new e({
            type: "optional",
            innerType: t
        }))), Y(t, T(t._zod.def, {
            shape: o,
            checks: []
        }))
    }

    function ef(e, t, n) {
        let r = n ? new Set(eo(t, n)) : void 0,
            i = {};
        return Z(i, t, Reflect.ownKeys(N(t)), (t, n) => r && !r.has(n) ? t : new e({
            type: "nonoptional",
            innerType: t
        })), Y(t, T(t._zod.def, {
            shape: i
        }))
    }

    function ev(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
        if (!0 === e.aborted) return !0;
        for (let r = t; r < e.issues.length; r++) {
            var n;
            if ((null == (n = e.issues[r]) ? void 0 : n.continue) !== !0) return !0
        }
        return !1
    }

    function ep(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
        if (!0 === e.aborted) return !0;
        for (let r = t; r < e.issues.length; r++) {
            var n;
            if ((null == (n = e.issues[r]) ? void 0 : n.continue) === !1) return !0
        }
        return !1
    }

    function eg(e, t) {
        return t.map(t => (null != t.path || (t.path = []), t.path.unshift(e), t))
    }

    function eh(e) {
        return "string" == typeof e ? e : null == e ? void 0 : e.message
    }

    function e_(e, t, n) {
        var r;
        for (let i = t; i < e.length; i++) null != (r = e[i]).schema || (r.schema = n)
    }

    function eb(e, t, n) {
        var r, i, a, o, c, u, l, s, d, m, f, v, p, g, h;
        let _ = null == (l = e.inst) || null == (u = l._zod) ? void 0 : u.traits;
        (null == _ ? void 0 : _.has("$ZodType")) && (_.has("$ZodCheck") && null != e.schema || (e.schema = e.inst));
        let b = e.schema !== e.inst ? null == (d = e.schema) || null == (s = d._zod.def) ? void 0 : s.error : void 0,
            y = e.message ? e.message : null != (r = null != (i = null != (a = null != (o = null != (c = eh(null == (v = e.inst) || null == (f = v._zod.def) || null == (m = f.error) ? void 0 : m.call(f, e))) ? c : eh(null == b ? void 0 : b(e))) ? o : eh(null == t || null == (p = t.error) ? void 0 : p.call(t, e))) ? a : eh(null == (g = n.customError) ? void 0 : g.call(n, e))) ? i : eh(null == (h = n.localeError) ? void 0 : h.call(n, e))) ? r : "Invalid input",
            I = {};
        for (let t of Object.keys(e)) "inst" !== t && "schema" !== t && "continue" !== t && "input" !== t && "__proto__" !== t && (I[t] = e[t]);
        return null != I.path || (I.path = []), I.message = y, (null == t ? void 0 : t.reportInput) && (I.input = e.input), I
    }

    function ey(e) {
        return e instanceof Set ? "set" : e instanceof Map ? "map" : e instanceof File ? "file" : "unknown"
    }
    let eI = /[\uD800-\uDBFF]/;

    function ew(e) {
        let t = e.length;
        if (!eI.test(e)) return t;
        let n = t;
        for (let r = 0; r < t - 1; r++)(64512 & e.charCodeAt(r)) == 55296 && (64512 & e.charCodeAt(r + 1)) == 56320 && (n--, r++);
        return n
    }

    function ek(e) {
        return Array.isArray(e) ? "array" : "string" == typeof e ? "string" : "unknown"
    }

    function ex(e) {
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
    }

    function eS() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        let [r, i, a] = t;
        return "string" == typeof r ? {
            message: r,
            code: "custom",
            input: i,
            inst: a
        } : {
            ...r
        }
    }

    function ez(e) {
        return Object.entries(e).filter(e => {
            let [t, n] = e;
            return Number.isNaN(Number.parseInt(t, 10))
        }).map(e => e[1])
    }

    function eU(e) {
        let t = atob(e),
            n = new Uint8Array(t.length);
        for (let e = 0; e < t.length; e++) n[e] = t.charCodeAt(e);
        return n
    }

    function eA(e) {
        let t = "";
        for (let n = 0; n < e.length; n++) t += String.fromCharCode(e[n]);
        return btoa(t)
    }

    function eD(e) {
        let t = e.replace(/-/g, "+").replace(/_/g, "/"),
            n = "=".repeat((4 - t.length % 4) % 4);
        return eU(t + n)
    }

    function eP(e) {
        return eA(e).replace(/\+/g, "-").replace(/\//g, "_").replace(/=/g, "")
    }

    function eN(e) {
        let t = e.replace(/^0x/, "");
        if (t.length % 2 != 0) throw Error("Invalid hex string length");
        let n = new Uint8Array(t.length / 2);
        for (let e = 0; e < t.length; e += 2) n[e / 2] = Number.parseInt(t.slice(e, e + 2), 16);
        return n
    }

    function eO(e) {
        return Array.from(e).map(e => e.toString(16).padStart(2, "0")).join("")
    }
    class ej {
        constructor(...e) {}
    }

    function eZ(e, t) {
        for (let n in t) {
            let r = Object.getOwnPropertyDescriptor(t, n);
            r.get ? Object.defineProperty(e, n, {
                ...r,
                enumerable: !1
            }) : function(e, t, n) {
                Object.defineProperty(e, t, {
                    configurable: !0,
                    get() {
                        return this == null ? n : eT(this, t, n.bind(this))
                    },
                    set(e) {
                        eT(this, t, e)
                    }
                })
            }(e, n, r.value)
        }
    }

    function eT(e, t, n) {
        let r = !(arguments.length > 3) || void 0 === arguments[3] || arguments[3];
        return Object.defineProperty(e, t, {
            configurable: !0,
            writable: !0,
            enumerable: r,
            value: n
        }), n
    }

    function eE(e, t, n) {
        return eT(e, t, n, !1)
    }

    function eC(e, t) {
        for (let n in e) {
            let r = e[n];
            Object.defineProperty(t, n, {
                configurable: !0,
                enumerable: !0,
                get() {
                    return eT(this, n, r(this))
                },
                set(e) {
                    eT(this, n, e)
                }
            })
        }
        return t
    }
    let e$ = !1,
        eL = {
            configurable: !0,
            get() {
                e$ = !0
            }
        };

    function eR(e, n, r) {
        let i = Object.getPrototypeOf(e._zod);
        if (n in i && t !== e._zod) {
            t = void 0;
            return
        }
        t = e._zod, Object.defineProperty(i, n, {
            configurable: !0,
            get() {
                Object.defineProperty(this, n, eL);
                let e = e$;
                e$ = !1;
                try {
                    let t = r(this);
                    return e$ ? delete this[n] : Object.defineProperty(this, n, {
                        configurable: !0,
                        writable: !0,
                        value: t
                    }), e$ = e$ || e, t
                } catch (t) {
                    throw delete this[n], e$ = e$ || e, t
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

    function eG(e, t, n, r) {
        let i, a = t in (i = Object.getPrototypeOf(e)) ? void 0 : i;
        a && Object.defineProperty(a, t, {
            configurable: !0,
            get() {
                let e = {
                    configurable: !0,
                    writable: !0,
                    enumerable: r,
                    value: void 0
                };
                return Object.defineProperty(this, t, e), e.value = n(this), Object.defineProperty(this, t, e), e.value
            },
            set(e) {
                Object.defineProperty(this, t, {
                    configurable: !0,
                    writable: !0,
                    enumerable: r,
                    value: e
                })
            }
        })
    }
    let eJ = "~constantCatch";

    function eB(e) {
        let t = () => e;
        return t[eJ] = !0, t
    }
    var eM, eF, eV = e.i(462534);
    let eq = /^[cC][0-9a-z]{6,}$/,
        eK = /^[0-9a-z]+$/,
        eW = /^[0-7][0-9A-HJKMNP-TV-Za-hjkmnp-tv-z]{25}$/,
        eX = /^[0-9a-vA-V]{20}$/,
        eH = /^[A-Za-z0-9]{27}$/,
        eY = /^[a-zA-Z0-9_-]{21}$/;

    function eQ(e) {
        return new RegExp("^[a-zA-Z0-9_-]{".concat(e, "}$"))
    }
    let e0 = /^P(?:(\d+W)|(?!.*W)(?=\d|T\d)(\d+Y)?(\d+M)?(\d+D)?(T(?=\d)(\d+H)?(\d+M)?(\d+([.,]\d+)?S)?)?)$/,
        e4 = /^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})$/,
        e1 = e => e ? new RegExp("^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-".concat(e, "[0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12})$")) : /^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-8][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}|00000000-0000-0000-0000-000000000000|ffffffff-ffff-ffff-ffff-ffffffffffff)$/,
        e6 = e1(4),
        e2 = e1(6),
        e5 = e1(7),
        e3 = /^(?:[A-Za-z0-9_'+\-]+\.)*[A-Za-z0-9_'+\-]*[A-Za-z0-9_+-]@(?:[A-Za-z0-9][A-Za-z0-9\-]*\.)+[A-Za-z]{2,}$/,
        e9 = /^[^\s@"]{1,64}@[^\s@]{1,255}$/u;

    function e8() {
        return RegExp("^(?=[\\s\\S]*[\\p{Extended_Pictographic}\\p{Regional_Indicator}\\u20E3])[\\p{Extended_Pictographic}\\p{Emoji_Component}]+$", "u")
    }
    let e7 = /^(?:(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])$/,
        te = /^(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))$/,
        tt = e => {
            let t = H(null != e ? e : ":");
            return new RegExp("^(?:[0-9A-F]{2}".concat(t, "){5}[0-9A-F]{2}$|^(?:[0-9a-f]{2}").concat(t, "){5}[0-9a-f]{2}$"))
        },
        tn = /^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\/([0-9]|[1-2][0-9]|3[0-2])$/,
        tr = /^(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))\/(12[0-8]|1[01][0-9]|[1-9]?[0-9])$/,
        ti = /^$|^(?:[0-9a-zA-Z+/]{4})*(?:(?:[0-9a-zA-Z+/]{2}==)|(?:[0-9a-zA-Z+/]{3}=))?$/,
        ta = /^(?:[A-Za-z0-9_-]{4})*(?:[A-Za-z0-9_-]{2,3})?$/,
        to = /^https?$/,
        tc = /^\+[1-9]\d{6,14}$/,
        tu = /^\d(?:[ -]?\d){11,18}$/,
        tl = /^[A-Z]{2}(?!00|01|99)\d{2}[A-Z0-9]{11,30}$/,
        ts = "(?:(?:\\d\\d[2468][048]|\\d\\d[13579][26]|\\d\\d0[48]|[02468][048]00|[13579][26]00)-02-29|\\d{4}-(?:(?:0[13578]|1[02])-(?:0[1-9]|[12]\\d|3[01])|(?:0[469]|11)-(?:0[1-9]|[12]\\d|30)|(?:02)-(?:0[1-9]|1\\d|2[0-8])))",
        td = new RegExp("^".concat(ts, "$"));

    function tm(e) {
        let t = "(?:[01]\\d|2[0-3]):[0-5]\\d";
        return "number" == typeof e.precision ? -1 === e.precision ? "".concat(t) : 0 === e.precision ? "".concat(t, ":[0-5]\\d") : "".concat(t, ":[0-5]\\d\\.\\d{").concat(e.precision, "}") : e.seconds ? "".concat(t, ":[0-5]\\d(?:\\.\\d+)?") : "".concat(t, "(?::[0-5]\\d(?:\\.\\d+)?)?")
    }

    function tf(e) {
        return new RegExp("^".concat(tm(e), "$"))
    }

    function tv(e) {
        let t = ["Z"];
        e.offset && t.push("([+-](?:[01]\\d|2[0-3]):[0-5]\\d)");
        let n = "".concat(tm({
                precision: e.precision,
                seconds: !0
            }), "(?:").concat(t.join("|"), ")"),
            r = e.local ? "".concat(n, "|").concat(tm({
                precision: e.precision
            })) : n;
        return new RegExp("^".concat(ts, "T(?:").concat(r, ")$"))
    }
    let tp = /^[\s\S]{0,}$/,
        tg = e => {
            var t, n;
            let r = e ? "[\\s\\S]{".concat(null != (t = null == e ? void 0 : e.minimum) ? t : 0, ",").concat(null != (n = null == e ? void 0 : e.maximum) ? n : "", "}") : "[\\s\\S]*";
            return new RegExp("^".concat(r, "$"))
        },
        th = /^-?\d+n?$/,
        t_ = /^-?\d+$/,
        tb = /^-?\d+(?:\.\d+)?$/,
        ty = /^(?:true|false)$/i,
        tI = /^null$/i,
        tw = /^undefined$/i,
        tk = /^[^A-Z]*$/,
        tx = /^[^a-z]*$/;

    function tS(e, t) {
        return new RegExp("^[A-Za-z0-9+/]{".concat(e, "}").concat(t, "$"))
    }

    function tz(e) {
        return new RegExp("^[A-Za-z0-9_-]{".concat(e, "}$"))
    }
    let tU = tS(22, "=="),
        tA = tz(22),
        tD = tS(27, "="),
        tP = tz(27),
        tN = tS(43, "="),
        tO = tz(43),
        tj = tS(64, ""),
        tZ = tz(64),
        tT = tS(86, "=="),
        tE = tz(86);
    e.s(["anyString", 0, tp, "base64", 0, ti, "base64url", 0, ta, "bigint", 0, th, "boolean", 0, ty, "browserEmail", 0, /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/, "cidrv4", 0, tn, "cidrv6", 0, tr, "creditCard", 0, tu, "cuid", 0, eq, "cuid2", 0, eK, "currencyCode", 0, /^(?:AED|AFN|ALL|AMD|AOA|ARS|AUD|AWG|AZN|BAM|BBD|BDT|BHD|BIF|BMD|BND|BOB|BOV|BRL|BSD|BTN|BWP|BYN|BZD|CAD|CDF|CHE|CHF|CHW|CLF|CLP|CNY|COP|COU|CRC|CUP|CVE|CZK|DJF|DKK|DOP|DZD|EGP|ERN|ETB|EUR|FJD|FKP|GBP|GEL|GHS|GIP|GMD|GNF|GTQ|GYD|HKD|HNL|HTG|HUF|IDR|ILS|INR|IQD|IRR|ISK|JMD|JOD|JPY|KES|KGS|KHR|KMF|KPW|KRW|KWD|KYD|KZT|LAK|LBP|LKR|LRD|LSL|LYD|MAD|MDL|MGA|MKD|MMK|MNT|MOP|MRU|MUR|MVR|MWK|MXN|MXV|MYR|MZN|NAD|NGN|NIO|NOK|NPR|NZD|OMR|PAB|PEN|PGK|PHP|PKR|PLN|PYG|QAR|RON|RSD|RUB|RWF|SAR|SBD|SCR|SDG|SEK|SGD|SHP|SLE|SOS|SRD|SSP|STN|SVC|SYP|SZL|THB|TJS|TMT|TND|TOP|TRY|TTD|TWD|TZS|UAH|UGX|USD|USN|UYI|UYU|UYW|UZS|VED|VES|VND|VUV|WST|XAD|XAF|XAG|XAU|XBA|XBB|XBC|XBD|XCD|XCG|XDR|XOF|XPD|XPF|XPT|XSU|XTS|XUA|XXX|YER|ZAR|ZMW|ZWG)$/, "date", 0, td, "datetime", 0, tv, "domain", 0, /^(?=.{1,253}$)([a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,63}$/, "duration", 0, e0, "e164", 0, tc, "email", 0, e3, "emoji", 0, e8, "extendedDuration", 0, /^[-+]?P(?!$)(?:(?:[-+]?\d+Y)|(?:[-+]?\d+[.,]\d+Y$))?(?:(?:[-+]?\d+M)|(?:[-+]?\d+[.,]\d+M$))?(?:(?:[-+]?\d+W)|(?:[-+]?\d+[.,]\d+W$))?(?:(?:[-+]?\d+D)|(?:[-+]?\d+[.,]\d+D$))?(?:T(?=[\d+-])(?:(?:[-+]?\d+H)|(?:[-+]?\d+[.,]\d+H$))?(?:(?:[-+]?\d+M)|(?:[-+]?\d+[.,]\d+M$))?(?:[-+]?\d+(?:[.,]\d+)?S)?)??$/, "guid", 0, e4, "hex", 0, /^[0-9a-fA-F]*$/, "hostname", 0, /^(?=.{1,253}\.?$)[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[-0-9a-zA-Z]{0,61}[0-9a-zA-Z])?)*\.?$/, "html5Email", 0, /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/, "httpProtocol", 0, to, "iban", 0, tl, "idnEmail", 0, e9, "integer", 0, t_, "ipv4", 0, e7, "ipv6", 0, te, "ksuid", 0, eH, "lowercase", 0, tk, "mac", 0, tt, "md5_base64", 0, tU, "md5_base64url", 0, tA, "md5_hex", 0, /^[0-9a-fA-F]{32}$/, "nanoid", 0, eY, "nanoidOfLength", 0, eQ, "null", 0, tI, "number", 0, tb, "rfc5322Email", 0, /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/, "sha1_base64", 0, tD, "sha1_base64url", 0, tP, "sha1_hex", 0, /^[0-9a-fA-F]{40}$/, "sha256_base64", 0, tN, "sha256_base64url", 0, tO, "sha256_hex", 0, /^[0-9a-fA-F]{64}$/, "sha384_base64", 0, tj, "sha384_base64url", 0, tZ, "sha384_hex", 0, /^[0-9a-fA-F]{96}$/, "sha512_base64", 0, tT, "sha512_base64url", 0, tE, "sha512_hex", 0, /^[0-9a-fA-F]{128}$/, "string", 0, tg, "time", 0, tf, "ulid", 0, eW, "undefined", 0, tw, "unicodeEmail", 0, e9, "uppercase", 0, tx, "uuid", 0, e1, "uuid4", 0, e6, "uuid6", 0, e2, "uuid7", 0, e5, "xid", 0, eX], 43496);
    var tC = e.i(43496);

    function t$(e, t, n, r) {
        let i = Math.abs(e),
            a = i % 10,
            o = i % 100;
        return o >= 11 && o <= 19 ? r : 1 === a ? t : a >= 2 && a <= 4 ? n : r
    }

    function tL() {
        return {
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
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
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

                function i(e, t) {
                    var n;
                    return "number" !== e || "number" != typeof t || Number.isFinite(t) ? null != (n = r[e]) ? n : e : String(t)
                }
                return e => {
                    var r, a, o, c;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = i(e.expected),
                                n = i(ex(e.input), e.input);
                            return "Invalid input: expected ".concat(t, ", received ").concat(n)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Invalid input: expected ".concat(et(e.values[0]));
                            return "Invalid option: expected one of ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.exact ? "exactly " : e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Too big: expected ".concat(null != (r = e.origin) ? r : "value", " to have ").concat(n).concat(e.maximum.toString(), " ").concat(null != (a = i.unit) ? a : "elements");
                            return "Too big: expected ".concat(null != (o = e.origin) ? o : "value", " to be ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.exact ? "exactly " : e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Too small: expected ".concat(e.origin, " to have ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Too small: expected ".concat(e.origin, " to be ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Invalid string: must start with "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Invalid string: must end with "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Invalid string: must include "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Invalid string: must match pattern ".concat(e.pattern);
                            return "Invalid ".concat(null != (c = n[e.format]) ? c : e.format);
                        case "not_multiple_of":
                            return "Invalid number: must be a multiple of ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Unrecognized key".concat(e.keys.length > 1 ? "s" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Invalid key in ".concat(e.origin);
                        case "invalid_union":
                            if (e.options && Array.isArray(e.options) && e.options.length > 0) {
                                let t = e.options.map(e => "'".concat(e, "'")).join(" | ");
                                return "Invalid discriminator value. Expected ".concat(t)
                            }
                            if (!1 === e.inclusive) return "Invalid input: more than one option matched";
                            return "Invalid input";
                        case "invalid_element":
                            return "Invalid value in ".concat(e.origin);
                        default:
                            return "Invalid input"
                    }
                }
            })()
        }
    }

    function tR(e, t, n) {
        return 1 === Math.abs(e) ? t : n
    }

    function tG(e) {
        if (!e) return "";
        let t = e[e.length - 1];
        return e + (["ա", "ե", "ը", "ի", "ո", "ու", "օ"].includes(t) ? "ն" : "ը")
    }

    function tJ() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "តួអក្សរ",
                        verb: "គួរមាន"
                    },
                    file: {
                        unit: "បៃ",
                        verb: "គួរមាន"
                    },
                    array: {
                        unit: "ធាតុ",
                        verb: "គួរមាន"
                    },
                    set: {
                        unit: "ធាតុ",
                        verb: "គួរមាន"
                    },
                    map: {
                        unit: "ធាតុ",
                        verb: "គួរមាន"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "ទិន្នន័យបញ្ចូល",
                        email: "អាសយដ្ឋានអ៊ីមែល",
                        url: "URL",
                        emoji: "សញ្ញាអារម្មណ៍",
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
                        datetime: "កាលបរិច្ឆេទ និងម៉ោង ISO",
                        date: "កាលបរិច្ឆេទ ISO",
                        time: "ម៉ោង ISO",
                        duration: "រយៈពេល ISO",
                        ipv4: "អាសយដ្ឋាន IPv4",
                        ipv6: "អាសយដ្ឋាន IPv6",
                        mac: "អាសយដ្ឋាន MAC",
                        cidrv4: "ដែនអាសយដ្ឋាន IPv4",
                        cidrv6: "ដែនអាសយដ្ឋាន IPv6",
                        base64: "ខ្សែអក្សរអ៊ិកូដ base64",
                        base64url: "ខ្សែអក្សរអ៊ិកូដ base64url",
                        json_string: "ខ្សែអក្សរ JSON",
                        e164: "លេខ E.164",
                        credit_card: "លេខប័ណ្ណឥណទាន",
                        currency_code: "កូដរូបិយប័ណ្ណ",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "ទិន្នន័យបញ្ចូល"
                    },
                    r = {
                        nan: "NaN",
                        number: "លេខ",
                        array: "អារេ (Array)",
                        null: "គ្មានតម្លៃ (null)"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "ទិន្នន័យបញ្ចូលមិនត្រឹមត្រូវ៖ ត្រូវការ instanceof ".concat(e.expected, " ប៉ុន្តែទទួលបាន ").concat(o);
                            return "ទិន្នន័យបញ្ចូលមិនត្រឹមត្រូវ៖ ត្រូវការ ".concat(t, " ប៉ុន្តែទទួលបាន ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "ទិន្នន័យបញ្ចូលមិនត្រឹមត្រូវ៖ ត្រូវការ ".concat(et(e.values[0]));
                            return "ជម្រើសមិនត្រឹមត្រូវ៖ ត្រូវជាមួយក្នុងចំណោម ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "ធំពេក៖ ត្រូវការ ".concat(null != (o = e.origin) ? o : "តម្លៃ", " ").concat(n, " ").concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "ធាតុ");
                            return "ធំពេក៖ ត្រូវការ ".concat(null != (u = e.origin) ? u : "តម្លៃ", " ").concat(n, " ").concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "តូចពេក៖ ត្រូវការ ".concat(e.origin, " ").concat(n, " ").concat(e.minimum.toString(), " ").concat(r.unit);
                            return "តូចពេក៖ ត្រូវការ ".concat(e.origin, " ").concat(n, " ").concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'ខ្សែអក្សរមិនត្រឹមត្រូវ៖ ត្រូវចាប់ផ្តើមដោយ "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'ខ្សែអក្សរមិនត្រឹមត្រូវ៖ ត្រូវបញ្ចប់ដោយ "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'ខ្សែអក្សរមិនត្រឹមត្រូវ៖ ត្រូវមាន "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "ខ្សែអក្សរមិនត្រឹមត្រូវ៖ ត្រូវតែផ្គូផ្គងនឹងទម្រង់ដែលបានកំណត់ ".concat(e.pattern);
                            return "មិនត្រឹមត្រូវ៖ ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "លេខមិនត្រឹមត្រូវ៖ ត្រូវតែជាពហុគុណនៃ ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "រកឃើញសោមិនស្គាល់៖ ".concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "សោមិនត្រឹមត្រូវនៅក្នុង ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "ទិន្នន័យមិនត្រឹមត្រូវ";
                        case "invalid_element":
                            return "ទិន្នន័យមិនត្រឹមត្រូវនៅក្នុង ".concat(e.origin)
                    }
                }
            })()
        }
    }
    let tB = e => e.charAt(0).toUpperCase() + e.slice(1);

    function tM(e) {
        let t = Math.abs(e),
            n = t % 10,
            r = t % 100;
        return r >= 11 && r <= 19 || 0 === n ? "many" : 1 === n ? "one" : "few"
    }

    function tF(e, t, n, r) {
        let i = Math.abs(e),
            a = i % 10,
            o = i % 100;
        return o >= 11 && o <= 19 ? r : 1 === a ? t : a >= 2 && a <= 4 ? n : r
    }

    function tV() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "символів",
                        verb: "матиме"
                    },
                    file: {
                        unit: "байтів",
                        verb: "матиме"
                    },
                    array: {
                        unit: "елементів",
                        verb: "матиме"
                    },
                    set: {
                        unit: "елементів",
                        verb: "матиме"
                    },
                    map: {
                        unit: "елементів",
                        verb: "матиме"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "вхідні дані",
                        email: "адреса електронної пошти",
                        url: "URL",
                        emoji: "емодзі",
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
                        datetime: "дата та час ISO",
                        date: "дата ISO",
                        time: "час ISO",
                        duration: "тривалість ISO",
                        ipv4: "адреса IPv4",
                        ipv6: "адреса IPv6",
                        mac: "адреса MAC",
                        cidrv4: "діапазон IPv4",
                        cidrv6: "діапазон IPv6",
                        base64: "рядок у кодуванні base64",
                        base64url: "рядок у кодуванні base64url",
                        json_string: "рядок JSON",
                        e164: "номер E.164",
                        credit_card: "номер кредитної картки",
                        currency_code: "код валюти",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "вхідні дані"
                    },
                    r = {
                        nan: "NaN",
                        number: "число",
                        array: "масив"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Неправильні вхідні дані: очікується instanceof ".concat(e.expected, ", отримано ").concat(o);
                            return "Неправильні вхідні дані: очікується ".concat(t, ", отримано ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Неправильні вхідні дані: очікується ".concat(et(e.values[0]));
                            return "Неправильна опція: очікується одне з ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Занадто велике: очікується, що ".concat(null != (o = e.origin) ? o : "значення", " ").concat(r.verb, " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "елементів");
                            return "Занадто велике: очікується, що ".concat(null != (u = e.origin) ? u : "значення", " буде ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Занадто мале: очікується, що ".concat(e.origin, " ").concat(r.verb, " ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Занадто мале: очікується, що ".concat(e.origin, " буде ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Неправильний рядок: повинен починатися з "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Неправильний рядок: повинен закінчуватися на "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Неправильний рядок: повинен містити "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Неправильний рядок: повинен відповідати шаблону ".concat(e.pattern);
                            return "Неправильний ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "Неправильне число: повинно бути кратним ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Нерозпізнаний ключ".concat(e.keys.length > 1 ? "і" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Неправильний ключ у ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Неправильні вхідні дані";
                        case "invalid_element":
                            return "Неправильне значення у ".concat(e.origin)
                    }
                }
            })()
        }
    }
    e.s(["ar", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "حرف",
                        verb: "أن يحوي"
                    },
                    file: {
                        unit: "بايت",
                        verb: "أن يحوي"
                    },
                    array: {
                        unit: "عنصر",
                        verb: "أن يحوي"
                    },
                    set: {
                        unit: "عنصر",
                        verb: "أن يحوي"
                    },
                    map: {
                        unit: "عنصر",
                        verb: "أن يحوي"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "مدخل",
                        email: "بريد إلكتروني",
                        url: "رابط",
                        emoji: "إيموجي",
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
                        datetime: "تاريخ ووقت بمعيار ISO",
                        date: "تاريخ بمعيار ISO",
                        time: "وقت بمعيار ISO",
                        duration: "مدة بمعيار ISO",
                        ipv4: "عنوان IPv4",
                        ipv6: "عنوان IPv6",
                        mac: "عنوان MAC",
                        cidrv4: "مدى عناوين بصيغة IPv4",
                        cidrv6: "مدى عناوين بصيغة IPv6",
                        base64: "نَص بترميز base64-encoded",
                        base64url: "نَص بترميز base64url-encoded",
                        json_string: "نَص على هيئة JSON",
                        e164: "رقم هاتف بمعيار E.164",
                        credit_card: "رقم بطاقة الائتمان",
                        currency_code: "رمز العملة",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "مدخل"
                    },
                    r = {
                        nan: "NaN"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "مدخلات غير مقبولة: يفترض إدخال instanceof ".concat(e.expected, "، ولكن تم إدخال ").concat(o);
                            return "مدخلات غير مقبولة: يفترض إدخال ".concat(t, "، ولكن تم إدخال ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "مدخلات غير مقبولة: يفترض إدخال ".concat(et(e.values[0]));
                            return "اختيار غير مقبول: يتوقع انتقاء أحد هذه الخيارات: ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return " أكبر من اللازم: يفترض أن تكون ".concat(null != (o = e.origin) ? o : "القيمة", " ").concat(n, " ").concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "عنصر");
                            return "أكبر من اللازم: يفترض أن تكون ".concat(null != (u = e.origin) ? u : "القيمة", " ").concat(n, " ").concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "أصغر من اللازم: يفترض لـ ".concat(e.origin, " أن يكون ").concat(n, " ").concat(e.minimum.toString(), " ").concat(r.unit);
                            return "أصغر من اللازم: يفترض لـ ".concat(e.origin, " أن يكون ").concat(n, " ").concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'نَص غير مقبول: يجب أن يبدأ بـ "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'نَص غير مقبول: يجب أن ينتهي بـ "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'نَص غير مقبول: يجب أن يتضمَّن "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "نَص غير مقبول: يجب أن يطابق النمط ".concat(e.pattern);
                            return "".concat(null != (l = n[e.format]) ? l : e.format, " غير مقبول");
                        case "not_multiple_of":
                            return "رقم غير مقبول: يجب أن يكون من مضاعفات ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "معرف".concat(e.keys.length > 1 ? "ات" : "", " غريب").concat(e.keys.length > 1 ? "ة" : "", ": ").concat(b(e.keys, "، "));
                        case "invalid_key":
                            return "معرف غير مقبول في ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "مدخل غير مقبول";
                        case "invalid_element":
                            return "مدخل غير مقبول في ".concat(e.origin)
                    }
                }
            })()
        }
    }, "az", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "simvol",
                        verb: "olmalıdır"
                    },
                    file: {
                        unit: "bayt",
                        verb: "olmalıdır"
                    },
                    array: {
                        unit: "element",
                        verb: "olmalıdır"
                    },
                    set: {
                        unit: "element",
                        verb: "olmalıdır"
                    },
                    map: {
                        unit: "element",
                        verb: "olmalıdır"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
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
                        credit_card: "kredit kartı nömrəsi",
                        currency_code: "valyuta kodu",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    r = {
                        nan: "NaN"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Yanlış dəyər: gözlənilən instanceof ".concat(e.expected, ", daxil olan ").concat(o);
                            return "Yanlış dəyər: gözlənilən ".concat(t, ", daxil olan ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Yanlış dəyər: gözlənilən ".concat(et(e.values[0]));
                            return "Yanlış seçim: aşağıdakılardan biri olmalıdır: ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Çox böyük: gözlənilən ".concat(null != (o = e.origin) ? o : "dəyər", " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "element");
                            return "Çox böyük: gözlənilən ".concat(null != (u = e.origin) ? u : "dəyər", " ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Çox kiçik: gözlənilən ".concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Çox kiçik: gözlənilən ".concat(e.origin, " ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Yanlış mətn: "'.concat(e.prefix, '" ilə başlamalıdır');
                            if ("ends_with" === e.format) return 'Yanlış mətn: "'.concat(e.suffix, '" ilə bitməlidir');
                            if ("includes" === e.format) return 'Yanlış mətn: "'.concat(e.includes, '" daxil olmalıdır');
                            if ("regex" === e.format) return "Yanlış mətn: ".concat(e.pattern, " şablonuna uyğun olmalıdır");
                            return "Yanlış ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "Yanlış ədəd: ".concat(e.divisor, " ilə bölünə bilən olmalıdır");
                        case "unrecognized_keys":
                            return "Tanınmayan açar".concat(e.keys.length > 1 ? "lar" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "".concat(e.origin, " daxilində yanlış açar");
                        case "invalid_union":
                        default:
                            return "Yanlış dəyər";
                        case "invalid_element":
                            return "".concat(e.origin, " daxilində yanlış dəyər")
                    }
                }
            })()
        }
    }, "be", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: {
                            one: "сімвал",
                            few: "сімвалы",
                            many: "сімвалаў"
                        },
                        verb: "мець"
                    },
                    array: {
                        unit: {
                            one: "элемент",
                            few: "элементы",
                            many: "элементаў"
                        },
                        verb: "мець"
                    },
                    set: {
                        unit: {
                            one: "элемент",
                            few: "элементы",
                            many: "элементаў"
                        },
                        verb: "мець"
                    },
                    map: {
                        unit: {
                            one: "элемент",
                            few: "элементы",
                            many: "элементаў"
                        },
                        verb: "мець"
                    },
                    file: {
                        unit: {
                            one: "байт",
                            few: "байты",
                            many: "байтаў"
                        },
                        verb: "мець"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "увод",
                        email: "email адрас",
                        url: "URL",
                        emoji: "эмодзі",
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
                        datetime: "ISO дата і час",
                        date: "ISO дата",
                        time: "ISO час",
                        duration: "ISO працягласць",
                        ipv4: "IPv4 адрас",
                        ipv6: "IPv6 адрас",
                        mac: "MAC адрас",
                        cidrv4: "IPv4 дыяпазон",
                        cidrv6: "IPv6 дыяпазон",
                        base64: "радок у фармаце base64",
                        base64url: "радок у фармаце base64url",
                        json_string: "JSON радок",
                        e164: "нумар E.164",
                        credit_card: "нумар крэдытнай карты",
                        currency_code: "код валюты",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "увод"
                    },
                    r = {
                        nan: "NaN",
                        number: "лік",
                        array: "масіў"
                    };
                return e => {
                    var i, a, o, c, u;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Няправільны ўвод: чакаўся instanceof ".concat(e.expected, ", атрымана ").concat(o);
                            return "Няправільны ўвод: чакаўся ".concat(t, ", атрымана ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Няправільны ўвод: чакалася ".concat(et(e.values[0]));
                            return "Няправільны варыянт: чакаўся адзін з ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) {
                                let t = t$(Number(e.maximum), r.unit.one, r.unit.few, r.unit.many);
                                return "Занадта вялікі: чакалася, што ".concat(null != (c = e.origin) ? c : "значэнне", " павінна ").concat(r.verb, " ").concat(n).concat(e.maximum.toString(), " ").concat(t)
                            }
                            return "Занадта вялікі: чакалася, што ".concat(null != (o = e.origin) ? o : "значэнне", " павінна быць ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) {
                                let t = t$(Number(e.minimum), r.unit.one, r.unit.few, r.unit.many);
                                return "Занадта малы: чакалася, што ".concat(e.origin, " павінна ").concat(r.verb, " ").concat(n).concat(e.minimum.toString(), " ").concat(t)
                            }
                            return "Занадта малы: чакалася, што ".concat(e.origin, " павінна быць ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Няправільны радок: павінен пачынацца з "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Няправільны радок: павінен заканчвацца на "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Няправільны радок: павінен змяшчаць "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Няправільны радок: павінен адпавядаць шаблону ".concat(e.pattern);
                            return "Няправільны ".concat(null != (u = n[e.format]) ? u : e.format);
                        case "not_multiple_of":
                            return "Няправільны лік: павінен быць кратным ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Нераспазнаны ".concat(e.keys.length > 1 ? "ключы" : "ключ", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Няправільны ключ у ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Няправільны ўвод";
                        case "invalid_element":
                            return "Няправільнае значэнне ў ".concat(e.origin)
                    }
                }
            })()
        }
    }, "bg", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "символа",
                        verb: "да съдържа"
                    },
                    file: {
                        unit: "байта",
                        verb: "да съдържа"
                    },
                    array: {
                        unit: "елемента",
                        verb: "да съдържа"
                    },
                    set: {
                        unit: "елемента",
                        verb: "да съдържа"
                    },
                    map: {
                        unit: "елемента",
                        verb: "да съдържа"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "вход",
                        email: "имейл адрес",
                        url: "URL",
                        emoji: "емоджи",
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
                        datetime: "ISO време",
                        date: "ISO дата",
                        time: "ISO време",
                        duration: "ISO продължителност",
                        ipv4: "IPv4 адрес",
                        ipv6: "IPv6 адрес",
                        mac: "MAC адрес",
                        cidrv4: "IPv4 диапазон",
                        cidrv6: "IPv6 диапазон",
                        base64: "base64-кодиран низ",
                        base64url: "base64url-кодиран низ",
                        json_string: "JSON низ",
                        e164: "E.164 номер",
                        credit_card: "номер на кредитна карта",
                        currency_code: "код на валута",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "вход"
                    },
                    r = {
                        nan: "NaN",
                        number: "число",
                        array: "масив"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Невалиден вход: очакван instanceof ".concat(e.expected, ", получен ").concat(o);
                            return "Невалиден вход: очакван ".concat(t, ", получен ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Невалиден вход: очакван ".concat(et(e.values[0]));
                            return "Невалидна опция: очаквано едно от ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Твърде голямо: очаква се ".concat(null != (o = e.origin) ? o : "стойност", " да съдържа ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "елемента");
                            return "Твърде голямо: очаква се ".concat(null != (u = e.origin) ? u : "стойност", " да бъде ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Твърде малко: очаква се ".concat(e.origin, " да съдържа ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Твърде малко: очаква се ".concat(e.origin, " да бъде ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format": {
                            if ("starts_with" === e.format) return 'Невалиден низ: трябва да започва с "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Невалиден низ: трябва да завършва с "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Невалиден низ: трябва да включва "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Невалиден низ: трябва да съвпада с ".concat(e.pattern);
                            let t = "Невалиден";
                            return "emoji" === e.format && (t = "Невалидно"), "datetime" === e.format && (t = "Невалидно"), "date" === e.format && (t = "Невалидна"), "time" === e.format && (t = "Невалидно"), "duration" === e.format && (t = "Невалидна"), "".concat(t, " ").concat(null != (l = n[e.format]) ? l : e.format)
                        }
                        case "not_multiple_of":
                            return "Невалидно число: трябва да бъде кратно на ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Неразпознат".concat(e.keys.length > 1 ? "и" : "", " ключ").concat(e.keys.length > 1 ? "ове" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Невалиден ключ в ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Невалиден вход";
                        case "invalid_element":
                            return "Невалидна стойност в ".concat(e.origin)
                    }
                }
            })()
        }
    }, "bn", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "অক্ষর",
                        verb: "থাকতে হবে"
                    },
                    file: {
                        unit: "বাইট",
                        verb: "থাকতে হবে"
                    },
                    array: {
                        unit: "আইটেম",
                        verb: "থাকতে হবে"
                    },
                    set: {
                        unit: "আইটেম",
                        verb: "থাকতে হবে"
                    },
                    map: {
                        unit: "এন্ট্রি",
                        verb: "থাকতে হবে"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "ইনপুট",
                        email: "ইমেইল ঠিকানা",
                        url: "URL",
                        emoji: "ইমোজি",
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
                        datetime: "ISO তারিখ ও সময়",
                        date: "ISO তারিখ",
                        time: "ISO সময়",
                        duration: "ISO সময়কাল",
                        ipv4: "IPv4 ঠিকানা",
                        ipv6: "IPv6 ঠিকানা",
                        mac: "MAC ঠিকানা",
                        cidrv4: "IPv4 রেঞ্জ",
                        cidrv6: "IPv6 রেঞ্জ",
                        base64: "base64-এনকোডেড স্ট্রিং",
                        base64url: "base64url-এনকোডেড স্ট্রিং",
                        json_string: "JSON স্ট্রিং",
                        e164: "E.164 নম্বর",
                        credit_card: "ক্রেডিট কার্ড নম্বর",
                        currency_code: "মুদ্রা কোড",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "ইনপুট"
                    },
                    r = {
                        nan: "NaN"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            return "অবৈধ ইনপুট: প্রত্যাশিত ".concat(t, ", প্রাপ্ত ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "অবৈধ ইনপুট: প্রত্যাশিত ".concat(et(e.values[0]));
                            return "অবৈধ অপশন: ".concat(b(e.values, " | "), " এর মধ্যে একটি প্রত্যাশিত");
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "অনেক বড়: ".concat(null != (o = e.origin) ? o : "মান", " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "এলিমেন্ট", " হতে হবে");
                            return "অনেক বড়: ".concat(null != (u = e.origin) ? u : "মান", " ").concat(n).concat(e.maximum.toString(), " হতে হবে")
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "অনেক ছোট: ".concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit, " হতে হবে");
                            return "অনেক ছোট: ".concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " হতে হবে")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'অবৈধ স্ট্রিং: "'.concat(e.prefix, '" দিয়ে শুরু হতে হবে');
                            if ("ends_with" === e.format) return 'অবৈধ স্ট্রিং: "'.concat(e.suffix, '" দিয়ে শেষ হতে হবে');
                            if ("includes" === e.format) return 'অবৈধ স্ট্রিং: "'.concat(e.includes, '" অন্তর্ভুক্ত থাকতে হবে');
                            if ("regex" === e.format) return "অবৈধ স্ট্রিং: ".concat(e.pattern, " প্যাটার্ন মিলতে হবে");
                            return "অবৈধ ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "অবৈধ নম্বর: ".concat(e.divisor, " এর গুণিতক হতে হবে");
                        case "unrecognized_keys":
                            return "অচেনা কী".concat(e.keys.length > 1 ? "গুলো" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "".concat(e.origin, " এ অবৈধ কী");
                        case "invalid_union":
                            if (e.options && Array.isArray(e.options) && e.options.length > 0) {
                                let t = e.options.map(e => "'".concat(e, "'")).join(" | ");
                                return "অবৈধ ডিসক্রিমিনেটর মান। প্রত্যাশিত ".concat(t)
                            }
                            return "অবৈধ ইনপুট";
                        case "invalid_element":
                            return "".concat(e.origin, " এ অবৈধ মান");
                        default:
                            return "অবৈধ ইনপুট"
                    }
                }
            })()
        }
    }, "ca", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "caràcters",
                        verb: "contenir"
                    },
                    file: {
                        unit: "bytes",
                        verb: "contenir"
                    },
                    array: {
                        unit: "elements",
                        verb: "contenir"
                    },
                    set: {
                        unit: "elements",
                        verb: "contenir"
                    },
                    map: {
                        unit: "elements",
                        verb: "contenir"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "entrada",
                        email: "adreça electrònica",
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
                        datetime: "data i hora ISO",
                        date: "data ISO",
                        time: "hora ISO",
                        duration: "durada ISO",
                        ipv4: "adreça IPv4",
                        ipv6: "adreça IPv6",
                        mac: "adreça MAC",
                        cidrv4: "rang IPv4",
                        cidrv6: "rang IPv6",
                        base64: "cadena codificada en base64",
                        base64url: "cadena codificada en base64url",
                        json_string: "cadena JSON",
                        e164: "número E.164",
                        credit_card: "número de targeta de crèdit",
                        currency_code: "codi de moneda",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "entrada"
                    },
                    r = {
                        nan: "NaN"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Tipus invàlid: s'esperava instanceof ".concat(e.expected, ", s'ha rebut ").concat(o);
                            return "Tipus invàlid: s'esperava ".concat(t, ", s'ha rebut ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Valor invàlid: s'esperava ".concat(et(e.values[0]));
                            return "Opció invàlida: s'esperava una de ".concat(b(e.values, " o "));
                        case "too_big": {
                            let n = e.inclusive ? "com a màxim" : "menys de",
                                r = t(e.origin);
                            if (r) return "Massa gran: s'esperava que ".concat(null != (o = e.origin) ? o : "el valor", " contingués ").concat(n, " ").concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "elements");
                            return "Massa gran: s'esperava que ".concat(null != (u = e.origin) ? u : "el valor", " fos ").concat(n, " ").concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? "com a mínim" : "més de",
                                r = t(e.origin);
                            if (r) return "Massa petit: s'esperava que ".concat(e.origin, " contingués ").concat(n, " ").concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Massa petit: s'esperava que ".concat(e.origin, " fos ").concat(n, " ").concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Format invàlid: ha de començar amb "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return "Format invàlid: ha d'acabar amb \"".concat(e.suffix, '"');
                            if ("includes" === e.format) return "Format invàlid: ha d'incloure \"".concat(e.includes, '"');
                            if ("regex" === e.format) return "Format invàlid: ha de coincidir amb el patró ".concat(e.pattern);
                            return "Format invàlid per a ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "Número invàlid: ha de ser múltiple de ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Clau".concat(e.keys.length > 1 ? "s" : "", " no reconeguda").concat(e.keys.length > 1 ? "s" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Clau invàlida a ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Entrada invàlida";
                        case "invalid_element":
                            return "Element invàlid a ".concat(e.origin)
                    }
                }
            })()
        }
    }, "ckb", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "پیت",
                        verb: "بێت"
                    },
                    file: {
                        unit: "بایت",
                        verb: "بێت"
                    },
                    array: {
                        unit: "دانە",
                        verb: "بێت"
                    },
                    set: {
                        unit: "دانە",
                        verb: "بێت"
                    },
                    map: {
                        unit: "دانە",
                        verb: "بێت"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "regex",
                        email: "ئیمەیڵ",
                        url: "بەستەر (URL)",
                        emoji: "ئیمۆجی",
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
                        datetime: "ڕێکەوت و کات",
                        date: "ڕێکەوت",
                        time: "کات",
                        duration: "ماوە",
                        ipv4: "ناونیشانی IPv4",
                        ipv6: "ناونیشانی IPv6",
                        mac: "ناونیشانی MAC",
                        cidrv4: "مەودای IPv4",
                        cidrv6: "مەودای IPv6",
                        base64: "دەقی base64",
                        base64url: "دەقی base64url",
                        json_string: "دەقی JSON",
                        e164: "ژمارەی E.164",
                        credit_card: "ژمارەی کارتی کرێدیت",
                        currency_code: "کۆدی دراو",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "تێکردە"
                    },
                    r = {
                        nan: "NaN",
                        string: "نووسین",
                        number: "ژمارە",
                        boolean: "boolean",
                        array: "array",
                        object: "object",
                        date: "ڕێکەوت",
                        integer: "ژمارە",
                        float: "ژمارە",
                        null: "null",
                        undefined: "undefined",
                        function: "function",
                        symbol: "symbol",
                        unknown: "unknown",
                        promise: "promise",
                        void: "void",
                        never: "never",
                        map: "map",
                        set: "set"
                    };
                return e => {
                    var i, a, o;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n,
                                c = ["ا", "و", "ۆ", "وو", "ە", "ی", "ێ"].some(e => o.endsWith(e)) ? "یە" : "ە",
                                u = /^[a-zA-Z]+$/.test(o);
                            if ("null" === n || "undefined" === n) return "داواکراوە";
                            return "چاوەڕوانکراوە ".concat(t, " بێت، بەڵام ").concat(o).concat(u ? "" : c)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "بەهاکە نادرووستە: چاوەڕوانکراوە ".concat(et(e.values[0]), " بێت");
                            return "هەڵبژاردەی نادروست: چاوەڕوانکراوە یەکێک بێت لە ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = t(e.origin);
                            if (n) return "پێویستە بە لایەنی زۆرەوە ".concat(e.maximum.toString(), " ").concat(n.unit, " ").concat(n.verb);
                            return "پێویستە بە لایەنی زۆرەوە ".concat(e.maximum.toString(), " بێت")
                        }
                        case "too_small": {
                            let n = t(e.origin);
                            if (n) return "پێویستە بە لایەنی کەمەوە ".concat(e.minimum.toString(), " ").concat(n.unit, " ").concat(n.verb);
                            return "پێویستە بە لایەنی کەمەوە ".concat(e.minimum.toString(), " بێت")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'دەقی نادروست: پێویستە دەستپێبکات بە "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'دەقی نادروست: پێویستە کۆتاییبێت بە "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'دەقی نادروست: پێویستە "'.concat(e.includes, '" لەخۆبگرێت');
                            if ("regex" === e.format) return "دەقی نادروست: پێویستە لەگەڵ پاتێرنی ".concat(e.pattern, " بگونجێت");
                            return "بەهای ".concat(null != (o = n[e.format]) ? o : e.format, " نادروستە");
                        case "not_multiple_of":
                            return "ژمارەی نادروست: دەبێت چەند هێندە بێت بۆ ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "کلیلی نەناسراو: ".concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "کلیلی نادروست لە ".concat(e.origin);
                        case "invalid_union":
                            if (e.options && Array.isArray(e.options) && e.options.length > 0) {
                                let t = e.options.map(e => "'".concat(e, "'")).join(" | ");
                                return "بەهای نەناسراو هەیە. بەهای چاوەڕوانکراو: ".concat(t)
                            }
                            return "یەکگرتنی نادروست";
                        case "invalid_element":
                            return "".concat(e.origin, " بەهاکە نادروستە");
                        default:
                            return "تێکردەی نادروست"
                    }
                }
            })()
        }
    }, "cs", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "znaků",
                        verb: "mít"
                    },
                    file: {
                        unit: "bajtů",
                        verb: "mít"
                    },
                    array: {
                        unit: "prvků",
                        verb: "mít"
                    },
                    set: {
                        unit: "prvků",
                        verb: "mít"
                    },
                    map: {
                        unit: "prvků",
                        verb: "mít"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "regulární výraz",
                        email: "e-mailová adresa",
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
                        datetime: "datum a čas ve formátu ISO",
                        date: "datum ve formátu ISO",
                        time: "čas ve formátu ISO",
                        duration: "doba trvání ISO",
                        ipv4: "IPv4 adresa",
                        ipv6: "IPv6 adresa",
                        mac: "MAC adresa",
                        cidrv4: "rozsah IPv4",
                        cidrv6: "rozsah IPv6",
                        base64: "řetězec zakódovaný ve formátu base64",
                        base64url: "řetězec zakódovaný ve formátu base64url",
                        json_string: "řetězec ve formátu JSON",
                        e164: "číslo E.164",
                        credit_card: "číslo kreditní karty",
                        currency_code: "kód měny",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "vstup"
                    },
                    r = {
                        nan: "NaN",
                        number: "číslo",
                        string: "řetězec",
                        function: "funkce",
                        array: "pole"
                    };
                return e => {
                    var i, a, o, c, u, l, s, d, m;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Neplatný vstup: očekáváno instanceof ".concat(e.expected, ", obdrženo ").concat(o);
                            return "Neplatný vstup: očekáváno ".concat(t, ", obdrženo ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Neplatný vstup: očekáváno ".concat(et(e.values[0]));
                            return "Neplatná možnost: očekávána jedna z hodnot ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Hodnota je příliš velká: ".concat(null != (c = e.origin) ? c : "hodnota", " musí mít ").concat(n).concat(e.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "prvků");
                            return "Hodnota je příliš velká: ".concat(null != (o = e.origin) ? o : "hodnota", " musí být ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Hodnota je příliš malá: ".concat(null != (s = e.origin) ? s : "hodnota", " musí mít ").concat(n).concat(e.minimum.toString(), " ").concat(null != (d = r.unit) ? d : "prvků");
                            return "Hodnota je příliš malá: ".concat(null != (l = e.origin) ? l : "hodnota", " musí být ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Neplatný řetězec: musí začínat na "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Neplatný řetězec: musí končit na "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Neplatný řetězec: musí obsahovat "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Neplatný řetězec: musí odpovídat vzoru ".concat(e.pattern);
                            return "Neplatný formát ".concat(null != (m = n[e.format]) ? m : e.format);
                        case "not_multiple_of":
                            return "Neplatné číslo: musí být násobkem ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Neznámé klíče: ".concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Neplatný klíč v ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Neplatný vstup";
                        case "invalid_element":
                            return "Neplatná hodnota v ".concat(e.origin)
                    }
                }
            })()
        }
    }, "da", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "tegn",
                        verb: "havde"
                    },
                    file: {
                        unit: "bytes",
                        verb: "havde"
                    },
                    array: {
                        unit: "elementer",
                        verb: "indeholdt"
                    },
                    set: {
                        unit: "elementer",
                        verb: "indeholdt"
                    },
                    map: {
                        unit: "elementer",
                        verb: "indeholdt"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "input",
                        email: "e-mailadresse",
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
                        datetime: "ISO dato- og klokkeslæt",
                        date: "ISO-dato",
                        time: "ISO-klokkeslæt",
                        duration: "ISO-varighed",
                        ipv4: "IPv4-adresse",
                        ipv6: "IPv6-adresse",
                        mac: "MAC-adresse",
                        cidrv4: "IPv4-spektrum",
                        cidrv6: "IPv6-spektrum",
                        base64: "base64-kodet streng",
                        base64url: "base64url-kodet streng",
                        json_string: "JSON-streng",
                        e164: "E.164-nummer",
                        credit_card: "kreditkortnummer",
                        currency_code: "valutakode",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    r = {
                        nan: "NaN",
                        string: "streng",
                        number: "tal",
                        boolean: "boolean",
                        array: "liste",
                        object: "objekt",
                        set: "sæt",
                        file: "fil"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Ugyldigt input: forventede instanceof ".concat(e.expected, ", fik ").concat(o);
                            return "Ugyldigt input: forventede ".concat(t, ", fik ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Ugyldig værdi: forventede ".concat(et(e.values[0]));
                            return "Ugyldigt valg: forventede en af følgende ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin),
                                a = null != (o = r[e.origin]) ? o : e.origin;
                            if (i) return "For stor: forventede ".concat(null != a ? a : "value", " ").concat(i.verb, " ").concat(n, " ").concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "elementer");
                            return "For stor: forventede ".concat(null != a ? a : "value", " havde ").concat(n, " ").concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin),
                                a = null != (u = r[e.origin]) ? u : e.origin;
                            if (i) return "For lille: forventede ".concat(a, " ").concat(i.verb, " ").concat(n, " ").concat(e.minimum.toString(), " ").concat(i.unit);
                            return "For lille: forventede ".concat(a, " havde ").concat(n, " ").concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Ugyldig streng: skal starte med "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Ugyldig streng: skal ende med "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Ugyldig streng: skal indeholde "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Ugyldig streng: skal matche mønsteret ".concat(e.pattern);
                            return "Ugyldig ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "Ugyldigt tal: skal være deleligt med ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "".concat(e.keys.length > 1 ? "Ukendte nøgler" : "Ukendt nøgle", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Ugyldig nøgle i ".concat(e.origin);
                        case "invalid_union":
                            return "Ugyldigt input: matcher ingen af de tilladte typer";
                        case "invalid_element":
                            return "Ugyldig værdi i ".concat(e.origin);
                        default:
                            return "Ugyldigt input"
                    }
                }
            })()
        }
    }, "de", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "Zeichen",
                        verb: "zu haben"
                    },
                    file: {
                        unit: "Bytes",
                        verb: "zu haben"
                    },
                    array: {
                        unit: "Elemente",
                        verb: "zu haben"
                    },
                    set: {
                        unit: "Elemente",
                        verb: "zu haben"
                    },
                    map: {
                        unit: "Elemente",
                        verb: "zu haben"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "Eingabe",
                        email: "E-Mail-Adresse",
                        url: "URL",
                        emoji: "Emoji",
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
                        datetime: "ISO-Datum und -Uhrzeit",
                        date: "ISO-Datum",
                        time: "ISO-Uhrzeit",
                        duration: "ISO-Dauer",
                        ipv4: "IPv4-Adresse",
                        ipv6: "IPv6-Adresse",
                        mac: "MAC-Adresse",
                        cidrv4: "IPv4-Bereich",
                        cidrv6: "IPv6-Bereich",
                        base64: "Base64-codierter String",
                        base64url: "Base64-URL-codierter String",
                        json_string: "JSON-String",
                        e164: "E.164-Nummer",
                        credit_card: "Kreditkartennummer",
                        currency_code: "Währungscode",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "Eingabe"
                    },
                    r = {
                        nan: "NaN",
                        number: "Zahl",
                        array: "Array"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Ungültige Eingabe: erwartet instanceof ".concat(e.expected, ", erhalten ").concat(o);
                            return "Ungültige Eingabe: erwartet ".concat(t, ", erhalten ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Ungültige Eingabe: erwartet ".concat(et(e.values[0]));
                            return "Ungültige Option: erwartet eine von ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Zu groß: erwartet, dass ".concat(null != (o = e.origin) ? o : "Wert", " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "Elemente", " hat");
                            return "Zu groß: erwartet, dass ".concat(null != (u = e.origin) ? u : "Wert", " ").concat(n).concat(e.maximum.toString(), " ist")
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Zu klein: erwartet, dass ".concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit, " hat");
                            return "Zu klein: erwartet, dass ".concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " ist")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Ungültiger String: muss mit "'.concat(e.prefix, '" beginnen');
                            if ("ends_with" === e.format) return 'Ungültiger String: muss mit "'.concat(e.suffix, '" enden');
                            if ("includes" === e.format) return 'Ungültiger String: muss "'.concat(e.includes, '" enthalten');
                            if ("regex" === e.format) return "Ungültiger String: muss dem Muster ".concat(e.pattern, " entsprechen");
                            return "Ungültig: ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "Ungültige Zahl: muss ein Vielfaches von ".concat(e.divisor, " sein");
                        case "unrecognized_keys":
                            return "".concat(e.keys.length > 1 ? "Unbekannte Schlüssel" : "Unbekannter Schlüssel", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Ungültiger Schlüssel in ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Ungültige Eingabe";
                        case "invalid_element":
                            return "Ungültiger Wert in ".concat(e.origin)
                    }
                }
            })()
        }
    }, "el", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "χαρακτήρες",
                        verb: "να έχει"
                    },
                    file: {
                        unit: "bytes",
                        verb: "να έχει"
                    },
                    array: {
                        unit: "στοιχεία",
                        verb: "να έχει"
                    },
                    set: {
                        unit: "στοιχεία",
                        verb: "να έχει"
                    },
                    map: {
                        unit: "καταχωρήσεις",
                        verb: "να έχει"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "είσοδος",
                        email: "διεύθυνση email",
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
                        datetime: "ISO ημερομηνία και ώρα",
                        date: "ISO ημερομηνία",
                        time: "ISO ώρα",
                        duration: "ISO διάρκεια",
                        ipv4: "διεύθυνση IPv4",
                        ipv6: "διεύθυνση IPv6",
                        mac: "διεύθυνση MAC",
                        cidrv4: "εύρος IPv4",
                        cidrv6: "εύρος IPv6",
                        base64: "συμβολοσειρά κωδικοποιημένη σε base64",
                        base64url: "συμβολοσειρά κωδικοποιημένη σε base64url",
                        json_string: "συμβολοσειρά JSON",
                        e164: "αριθμός E.164",
                        credit_card: "αριθμός πιστωτικής κάρτας",
                        currency_code: "κωδικός νομίσματος",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "είσοδος"
                    },
                    r = {
                        nan: "NaN"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if ("string" == typeof e.expected && /^[A-Z]/.test(e.expected)) return "Μη έγκυρη είσοδος: αναμενόταν instanceof ".concat(e.expected, ", λήφθηκε ").concat(o);
                            return "Μη έγκυρη είσοδος: αναμενόταν ".concat(t, ", λήφθηκε ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Μη έγκυρη είσοδος: αναμενόταν ".concat(et(e.values[0]));
                            return "Μη έγκυρη επιλογή: αναμενόταν ένα από ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Πολύ μεγάλο: αναμενόταν ".concat(null != (o = e.origin) ? o : "τιμή", " να έχει ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "στοιχεία");
                            return "Πολύ μεγάλο: αναμενόταν ".concat(null != (u = e.origin) ? u : "τιμή", " να είναι ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Πολύ μικρό: αναμενόταν ".concat(e.origin, " να έχει ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Πολύ μικρό: αναμενόταν ".concat(e.origin, " να είναι ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Μη έγκυρη συμβολοσειρά: πρέπει να ξεκινά με "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Μη έγκυρη συμβολοσειρά: πρέπει να τελειώνει με "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Μη έγκυρη συμβολοσειρά: πρέπει να περιέχει "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Μη έγκυρη συμβολοσειρά: πρέπει να ταιριάζει με το μοτίβο ".concat(e.pattern);
                            return "Μη έγκυρο: ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "Μη έγκυρος αριθμός: πρέπει να είναι πολλαπλάσιο του ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Άγνωστ".concat(e.keys.length > 1 ? "α" : "ο", " κλειδ").concat(e.keys.length > 1 ? "ιά" : "ί", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Μη έγκυρο κλειδί στο ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Μη έγκυρη είσοδος";
                        case "invalid_element":
                            return "Μη έγκυρη τιμή στο ".concat(e.origin)
                    }
                }
            })()
        }
    }, "en", 0, tL, "eo", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "karaktrojn",
                        verb: "havi"
                    },
                    file: {
                        unit: "bajtojn",
                        verb: "havi"
                    },
                    array: {
                        unit: "elementojn",
                        verb: "havi"
                    },
                    set: {
                        unit: "elementojn",
                        verb: "havi"
                    },
                    map: {
                        unit: "elementojn",
                        verb: "havi"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "enigo",
                        email: "retadreso",
                        url: "URL",
                        emoji: "emoĝio",
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
                        datetime: "ISO-datotempo",
                        date: "ISO-dato",
                        time: "ISO-tempo",
                        duration: "ISO-daŭro",
                        ipv4: "IPv4-adreso",
                        ipv6: "IPv6-adreso",
                        mac: "MAC-adreso",
                        cidrv4: "IPv4-rango",
                        cidrv6: "IPv6-rango",
                        base64: "64-ume kodita karaktraro",
                        base64url: "URL-64-ume kodita karaktraro",
                        json_string: "JSON-karaktraro",
                        e164: "E.164-nombro",
                        credit_card: "kreditkarta numero",
                        currency_code: "valuta kodo",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "enigo"
                    },
                    r = {
                        nan: "NaN",
                        number: "nombro",
                        array: "tabelo",
                        null: "senvalora"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Nevalida enigo: atendiĝis instanceof ".concat(e.expected, ", riceviĝis ").concat(o);
                            return "Nevalida enigo: atendiĝis ".concat(t, ", riceviĝis ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Nevalida enigo: atendiĝis ".concat(et(e.values[0]));
                            return "Nevalida opcio: atendiĝis unu el ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Tro granda: atendiĝis ke ".concat(null != (o = e.origin) ? o : "valoro", " havu ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "elementojn");
                            return "Tro granda: atendiĝis ke ".concat(null != (u = e.origin) ? u : "valoro", " havu ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Tro malgranda: atendiĝis ke ".concat(e.origin, " havu ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Tro malgranda: atendiĝis ke ".concat(e.origin, " estu ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Nevalida karaktraro: devas komenciĝi per "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Nevalida karaktraro: devas finiĝi per "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Nevalida karaktraro: devas inkluzivi "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Nevalida karaktraro: devas kongrui kun la modelo ".concat(e.pattern);
                            return "Nevalida ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "Nevalida nombro: devas esti oblo de ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Nekonata".concat(e.keys.length > 1 ? "j" : "", " ŝlosilo").concat(e.keys.length > 1 ? "j" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Nevalida ŝlosilo en ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Nevalida enigo";
                        case "invalid_element":
                            return "Nevalida valoro en ".concat(e.origin)
                    }
                }
            })()
        }
    }, "es", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "caracteres",
                        verb: "tener"
                    },
                    file: {
                        unit: "bytes",
                        verb: "tener"
                    },
                    array: {
                        unit: "elementos",
                        verb: "tener"
                    },
                    set: {
                        unit: "elementos",
                        verb: "tener"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "entrada",
                        email: "dirección de correo electrónico",
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
                        datetime: "fecha y hora ISO",
                        date: "fecha ISO",
                        time: "hora ISO",
                        duration: "duración ISO",
                        ipv4: "dirección IPv4",
                        ipv6: "dirección IPv6",
                        mac: "dirección MAC",
                        cidrv4: "rango IPv4",
                        cidrv6: "rango IPv6",
                        base64: "cadena codificada en base64",
                        base64url: "URL codificada en base64",
                        json_string: "cadena JSON",
                        e164: "número E.164",
                        credit_card: "número de tarjeta de crédito",
                        currency_code: "código de moneda",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "entrada"
                    },
                    r = {
                        nan: "NaN",
                        string: "texto",
                        number: "número",
                        boolean: "booleano",
                        array: "arreglo",
                        object: "objeto",
                        set: "conjunto",
                        file: "archivo",
                        date: "fecha",
                        bigint: "número grande",
                        symbol: "símbolo",
                        undefined: "indefinido",
                        null: "nulo",
                        function: "función",
                        map: "mapa",
                        record: "registro",
                        tuple: "tupla",
                        enum: "enumeración",
                        union: "unión",
                        literal: "literal",
                        promise: "promesa",
                        void: "vacío",
                        never: "nunca",
                        unknown: "desconocido",
                        any: "cualquiera"
                    };
                return e => {
                    var i, a, o, c, u, l, s, d;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Entrada inválida: se esperaba instanceof ".concat(e.expected, ", recibido ").concat(o);
                            return "Entrada inválida: se esperaba ".concat(t, ", recibido ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Entrada inválida: se esperaba ".concat(et(e.values[0]));
                            return "Opción inválida: se esperaba una de ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin),
                                a = null != (o = r[e.origin]) ? o : e.origin;
                            if (i) return "Demasiado grande: se esperaba que ".concat(null != a ? a : "valor", " tuviera ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "elementos");
                            return "Demasiado grande: se esperaba que ".concat(null != a ? a : "valor", " fuera ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin),
                                a = null != (u = r[e.origin]) ? u : e.origin;
                            if (i) return "Demasiado pequeño: se esperaba que ".concat(a, " tuviera ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "Demasiado pequeño: se esperaba que ".concat(a, " fuera ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Cadena inválida: debe comenzar con "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Cadena inválida: debe terminar en "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Cadena inválida: debe incluir "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Cadena inválida: debe coincidir con el patrón ".concat(e.pattern);
                            return "Inválido ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "Número inválido: debe ser múltiplo de ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Llave".concat(e.keys.length > 1 ? "s" : "", " desconocida").concat(e.keys.length > 1 ? "s" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Llave inválida en ".concat(null != (s = r[e.origin]) ? s : e.origin);
                        case "invalid_union":
                        default:
                            return "Entrada inválida";
                        case "invalid_element":
                            return "Valor inválido en ".concat(null != (d = r[e.origin]) ? d : e.origin)
                    }
                }
            })()
        }
    }, "fa", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "کاراکتر",
                        verb: "داشته باشد"
                    },
                    file: {
                        unit: "بایت",
                        verb: "داشته باشد"
                    },
                    array: {
                        unit: "آیتم",
                        verb: "داشته باشد"
                    },
                    set: {
                        unit: "آیتم",
                        verb: "داشته باشد"
                    },
                    map: {
                        unit: "آیتم",
                        verb: "داشته باشد"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "ورودی",
                        email: "آدرس ایمیل",
                        url: "URL",
                        emoji: "ایموجی",
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
                        datetime: "تاریخ و زمان ایزو",
                        date: "تاریخ ایزو",
                        time: "زمان ایزو",
                        duration: "مدت زمان ایزو",
                        ipv4: "IPv4 آدرس",
                        ipv6: "IPv6 آدرس",
                        mac: "MAC آدرس",
                        cidrv4: "IPv4 دامنه",
                        cidrv6: "IPv6 دامنه",
                        base64: "base64-encoded رشته",
                        base64url: "base64url-encoded رشته",
                        json_string: "JSON رشته",
                        e164: "E.164 عدد",
                        credit_card: "شماره کارت اعتباری",
                        currency_code: "کد ارز",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "ورودی"
                    },
                    r = {
                        nan: "NaN",
                        number: "عدد",
                        array: "آرایه"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "ورودی نامعتبر: می‌بایست instanceof ".concat(e.expected, " می‌بود، ").concat(o, " دریافت شد");
                            return "ورودی نامعتبر: می‌بایست ".concat(t, " می‌بود، ").concat(o, " دریافت شد")
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "ورودی نامعتبر: می‌بایست ".concat(et(e.values[0]), " می‌بود");
                            return "گزینه نامعتبر: می‌بایست یکی از ".concat(b(e.values, "|"), " می‌بود");
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "خیلی بزرگ: ".concat(null != (c = e.origin) ? c : "مقدار", " باید ").concat(n).concat(e.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "عنصر", " باشد");
                            return "خیلی بزرگ: ".concat(null != (o = e.origin) ? o : "مقدار", " باید ").concat(n).concat(e.maximum.toString(), " باشد")
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "خیلی کوچک: ".concat(e.origin, " باید ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit, " باشد");
                            return "خیلی کوچک: ".concat(e.origin, " باید ").concat(n).concat(e.minimum.toString(), " باشد")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'رشته نامعتبر: باید با "'.concat(e.prefix, '" شروع شود');
                            if ("ends_with" === e.format) return 'رشته نامعتبر: باید با "'.concat(e.suffix, '" تمام شود');
                            if ("includes" === e.format) return 'رشته نامعتبر: باید شامل "'.concat(e.includes, '" باشد');
                            if ("regex" === e.format) return "رشته نامعتبر: باید با الگوی ".concat(e.pattern, " مطابقت داشته باشد");
                            return "".concat(null != (l = n[e.format]) ? l : e.format, " نامعتبر");
                        case "not_multiple_of":
                            return "عدد نامعتبر: باید مضرب ".concat(e.divisor, " باشد");
                        case "unrecognized_keys":
                            return "کلید".concat(e.keys.length > 1 ? "های" : "", " ناشناس: ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "کلید ناشناس در ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "ورودی نامعتبر";
                        case "invalid_element":
                            return "مقدار نامعتبر در ".concat(e.origin)
                    }
                }
            })()
        }
    }, "fi", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "merkkiä",
                        subject: "merkkijonon"
                    },
                    file: {
                        unit: "tavua",
                        subject: "tiedoston"
                    },
                    array: {
                        unit: "alkiota",
                        subject: "listan"
                    },
                    set: {
                        unit: "alkiota",
                        subject: "joukon"
                    },
                    map: {
                        unit: "alkiota",
                        subject: "kuvauksen"
                    },
                    number: {
                        unit: "",
                        subject: "luvun"
                    },
                    bigint: {
                        unit: "",
                        subject: "suuren kokonaisluvun"
                    },
                    int: {
                        unit: "",
                        subject: "kokonaisluvun"
                    },
                    date: {
                        unit: "",
                        subject: "päivämäärän"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "säännöllinen lauseke",
                        email: "sähköpostiosoite",
                        url: "URL-osoite",
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
                        datetime: "ISO-aikaleima",
                        date: "ISO-päivämäärä",
                        time: "ISO-aika",
                        duration: "ISO-kesto",
                        ipv4: "IPv4-osoite",
                        ipv6: "IPv6-osoite",
                        mac: "MAC-osoite",
                        cidrv4: "IPv4-alue",
                        cidrv6: "IPv6-alue",
                        base64: "base64-koodattu merkkijono",
                        base64url: "base64url-koodattu merkkijono",
                        json_string: "JSON-merkkijono",
                        e164: "E.164-luku",
                        credit_card: "luottokortin numero",
                        currency_code: "valuuttakoodi",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "templaattimerkkijono"
                    },
                    r = {
                        nan: "NaN"
                    };
                return e => {
                    var i, a, o;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Virheellinen tyyppi: odotettiin instanceof ".concat(e.expected, ", oli ").concat(o);
                            return "Virheellinen tyyppi: odotettiin ".concat(t, ", oli ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Virheellinen syöte: täytyy olla ".concat(et(e.values[0]));
                            return "Virheellinen valinta: täytyy olla yksi seuraavista: ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Liian suuri: ".concat(r.subject, " täytyy olla ").concat(n).concat(e.maximum.toString(), " ").concat(r.unit).trim();
                            return "Liian suuri: arvon täytyy olla ".concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Liian pieni: ".concat(r.subject, " täytyy olla ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit).trim();
                            return "Liian pieni: arvon täytyy olla ".concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Virheellinen syöte: täytyy alkaa "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Virheellinen syöte: täytyy loppua "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Virheellinen syöte: täytyy sisältää "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Virheellinen syöte: täytyy vastata säännöllistä lauseketta ".concat(e.pattern);
                            return "Virheellinen ".concat(null != (o = n[e.format]) ? o : e.format);
                        case "not_multiple_of":
                            return "Virheellinen luku: täytyy olla luvun ".concat(e.divisor, " monikerta");
                        case "unrecognized_keys":
                            return "".concat(e.keys.length > 1 ? "Tuntemattomat avaimet" : "Tuntematon avain", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Virheellinen avain tietueessa";
                        case "invalid_union":
                            return "Virheellinen unioni";
                        case "invalid_element":
                            return "Virheellinen arvo joukossa";
                        default:
                            return "Virheellinen syöte"
                    }
                }
            })()
        }
    }, "fr", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "caractères",
                        verb: "avoir"
                    },
                    file: {
                        unit: "octets",
                        verb: "avoir"
                    },
                    array: {
                        unit: "éléments",
                        verb: "avoir"
                    },
                    set: {
                        unit: "éléments",
                        verb: "avoir"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "expression régulière",
                        email: "adresse e-mail",
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
                        datetime: "date et heure ISO",
                        date: "date ISO",
                        time: "heure ISO",
                        duration: "durée ISO",
                        ipv4: "adresse IPv4",
                        ipv6: "adresse IPv6",
                        mac: "adresse MAC",
                        cidrv4: "plage IPv4",
                        cidrv6: "plage IPv6",
                        base64: "chaîne de caractères encodée en base64",
                        base64url: "chaîne de caractères encodée en base64url",
                        json_string: "chaîne de caractères JSON",
                        e164: "numéro au format E.164",
                        credit_card: "numéro de carte de crédit",
                        currency_code: "code de devise",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "entrée"
                    },
                    r = {
                        string: "chaîne de caractères",
                        number: "nombre",
                        int: "entier",
                        boolean: "booléen",
                        bigint: "grand entier",
                        symbol: "symbole",
                        undefined: "indéfini",
                        null: "null",
                        never: "jamais",
                        void: "vide",
                        date: "date",
                        array: "tableau",
                        object: "objet",
                        tuple: "tuple",
                        record: "record",
                        map: "map",
                        set: "ensemble",
                        file: "fichier",
                        nonoptional: "non optionnel",
                        nan: "NaN",
                        function: "fonction"
                    };
                return e => {
                    var i, a, o, c, u, l, s, d;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Entrée invalide : instance de ".concat(e.expected, " attendu, ").concat(o, " reçu");
                            return "Entrée invalide : ".concat(t, " attendu, ").concat(o, " reçu")
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Entrée invalide : ".concat(et(e.values[0]), " attendu");
                            return "Option invalide : une valeur parmi ".concat(b(e.values, "|"), " attendue");
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Trop grand : ".concat(null != (o = r[e.origin]) ? o : "valeur", " doit ").concat(i.verb, " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "élément(s)");
                            return "Trop grand : ".concat(null != (u = r[e.origin]) ? u : "valeur", " doit être ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Trop petit : ".concat(null != (l = r[e.origin]) ? l : "valeur", " doit ").concat(i.verb, " ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "Trop petit : ".concat(null != (s = r[e.origin]) ? s : "valeur", " doit être ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Chaîne de caractères invalide : doit commencer par "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Chaîne de caractères invalide : doit se terminer par "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Chaîne de caractères invalide : doit inclure "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Chaîne de caractères invalide : doit correspondre au motif ".concat(e.pattern);
                            return "".concat(null != (d = n[e.format]) ? d : e.format, " invalide");
                        case "not_multiple_of":
                            return "Nombre invalide : doit être un multiple de ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Clé".concat(e.keys.length > 1 ? "s" : "", " non reconnue").concat(e.keys.length > 1 ? "s" : "", " : ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Clé invalide dans ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Entrée invalide";
                        case "invalid_element":
                            return "Valeur invalide dans ".concat(e.origin)
                    }
                }
            })()
        }
    }, "frCA", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "caractères",
                        verb: "avoir"
                    },
                    file: {
                        unit: "octets",
                        verb: "avoir"
                    },
                    array: {
                        unit: "éléments",
                        verb: "avoir"
                    },
                    set: {
                        unit: "éléments",
                        verb: "avoir"
                    },
                    map: {
                        unit: "éléments",
                        verb: "avoir"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "entrée",
                        email: "adresse courriel",
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
                        datetime: "date-heure ISO",
                        date: "date ISO",
                        time: "heure ISO",
                        duration: "durée ISO",
                        ipv4: "adresse IPv4",
                        ipv6: "adresse IPv6",
                        mac: "adresse MAC",
                        cidrv4: "plage IPv4",
                        cidrv6: "plage IPv6",
                        base64: "chaîne encodée en base64",
                        base64url: "chaîne encodée en base64url",
                        json_string: "chaîne JSON",
                        e164: "numéro E.164",
                        credit_card: "numéro de carte de crédit",
                        currency_code: "code de devise",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "entrée"
                    },
                    r = {
                        nan: "NaN"
                    };
                return e => {
                    var i, a, o, c, u;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Entrée invalide : attendu instanceof ".concat(e.expected, ", reçu ").concat(o);
                            return "Entrée invalide : attendu ".concat(t, ", reçu ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Entrée invalide : attendu ".concat(et(e.values[0]));
                            return "Option invalide : attendu l'une des valeurs suivantes ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "≤" : "<",
                                r = t(e.origin);
                            if (r) return "Trop grand : attendu que ".concat(null != (o = e.origin) ? o : "la valeur", " ait ").concat(n).concat(e.maximum.toString(), " ").concat(r.unit);
                            return "Trop grand : attendu que ".concat(null != (c = e.origin) ? c : "la valeur", " soit ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? "≥" : ">",
                                r = t(e.origin);
                            if (r) return "Trop petit : attendu que ".concat(e.origin, " ait ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Trop petit : attendu que ".concat(e.origin, " soit ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Chaîne invalide : doit commencer par "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Chaîne invalide : doit se terminer par "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Chaîne invalide : doit inclure "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Chaîne invalide : doit correspondre au motif ".concat(e.pattern);
                            return "".concat(null != (u = n[e.format]) ? u : e.format, " invalide");
                        case "not_multiple_of":
                            return "Nombre invalide : doit être un multiple de ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Clé".concat(e.keys.length > 1 ? "s" : "", " non reconnue").concat(e.keys.length > 1 ? "s" : "", " : ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Clé invalide dans ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Entrée invalide";
                        case "invalid_element":
                            return "Valeur invalide dans ".concat(e.origin)
                    }
                }
            })()
        }
    }, "gu", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "અક્ષર",
                        verb: "હોવા જોઈએ"
                    },
                    file: {
                        unit: "બાયટ",
                        verb: "હોવા જોઈએ"
                    },
                    array: {
                        unit: "આઇટમ",
                        verb: "હોવા જોઈએ"
                    },
                    set: {
                        unit: "આઇટમ",
                        verb: "હોવા જોઈએ"
                    },
                    map: {
                        unit: "એન્ટ્રી",
                        verb: "હોવા જોઈએ"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "ઇનપુટ",
                        email: "ઈમેઇલ એડ્રેસ",
                        url: "URL",
                        emoji: "ઇમોજી",
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
                        datetime: "ISO તારીખ અને સમય",
                        date: "ISO તારીખ",
                        time: "ISO સમય",
                        duration: "ISO અવધિ",
                        ipv4: "IPv4 એડ્રેસ",
                        ipv6: "IPv6 એડ્રેસ",
                        mac: "MAC એડ્રેસ",
                        cidrv4: "IPv4 શ્રેણી",
                        cidrv6: "IPv6 શ્રેણી",
                        base64: "base64-એન્કોડેડ સ્ટ્રિંગ",
                        base64url: "base64url-એન્કોડેડ સ્ટ્રિંગ",
                        json_string: "JSON સ્ટ્રિંગ",
                        e164: "E.164 નંબર",
                        credit_card: "ક્રેડિટ કાર્ડ નંબર",
                        currency_code: "ચલણ કોડ",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "ઇનપુટ"
                    },
                    r = {
                        nan: "NaN"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            return "અમાન્ય ઇનપુટ: અપેક્ષિત ".concat(t, ", પ્રાપ્ત ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "અમાન્ય ઇનપુટ: અપેક્ષિત ".concat(et(e.values[0]));
                            return "અમાન્ય વિકલ્પ: ".concat(b(e.values, " | "), " માધ્યમથી એક અપેક્ષિત");
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "ખૂબ મોટું: ".concat(null != (o = e.origin) ? o : "મૂલ્ય", " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "એલિમેન્ટ", " હોવા જોઈએ");
                            return "ખૂબ મોટું: ".concat(null != (u = e.origin) ? u : "મૂલ્ય", " ").concat(n).concat(e.maximum.toString(), " હોવું જોઈએ")
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "ખૂબ નાનું: ".concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit, " હોવા જોઈએ");
                            return "ખૂબ નાનું: ".concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " હોવું જોઈએ")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'અમાન્ય સ્ટ્રિંગ: "'.concat(e.prefix, '" થી શરૂ થવું જોઈએ');
                            if ("ends_with" === e.format) return 'અમાન્ય સ્ટ્રિંગ: "'.concat(e.suffix, '" પર સમાપ્ત થવું જોઈએ');
                            if ("includes" === e.format) return 'અમાન્ય સ્ટ્રિંગ: "'.concat(e.includes, '" શામેલ હોવું જોઈએ');
                            if ("regex" === e.format) return "અમાન્ય સ્ટ્રિંગ: પેટર્ન ".concat(e.pattern, " સાથે મેળ ખાવું જોઈએ");
                            return "અમાન્ય ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "અમાન્ય નંબર: ".concat(e.divisor, " નો ગુણાંક હોવો જોઈએ");
                        case "unrecognized_keys":
                            return "ઓળખી શકાતા નહીં તે કી".concat(e.keys.length > 1 ? "ઓ" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "".concat(e.origin, " માં અમાન્ય કી");
                        case "invalid_union":
                            if (e.options && Array.isArray(e.options) && e.options.length > 0) {
                                let t = e.options.map(e => "'".concat(e, "'")).join(" | ");
                                return "અમાન્ય ડિસ્ક્રિમિનેટર મૂલ્ય. અપેક્ષિત ".concat(t)
                            }
                            return "અમાન્ય ઇનપુટ";
                        case "invalid_element":
                            return "".concat(e.origin, " માં અમાન્ય મૂલ્ય");
                        default:
                            return "અમાન્ય ઇનપુટ"
                    }
                }
            })()
        }
    }, "he", 0, function() {
        let e, t, n, r, i, a, o, c, u;
        return {
            localeError: (e = {
                string: {
                    label: "מחרוזת",
                    gender: "f"
                },
                number: {
                    label: "מספר",
                    gender: "m"
                },
                boolean: {
                    label: "ערך בוליאני",
                    gender: "m"
                },
                bigint: {
                    label: "BigInt",
                    gender: "m"
                },
                date: {
                    label: "תאריך",
                    gender: "m"
                },
                array: {
                    label: "מערך",
                    gender: "m"
                },
                object: {
                    label: "אובייקט",
                    gender: "m"
                },
                null: {
                    label: "ערך ריק (null)",
                    gender: "m"
                },
                undefined: {
                    label: "ערך לא מוגדר (undefined)",
                    gender: "m"
                },
                symbol: {
                    label: "סימבול (Symbol)",
                    gender: "m"
                },
                function: {
                    label: "פונקציה",
                    gender: "f"
                },
                map: {
                    label: "מפה (Map)",
                    gender: "f"
                },
                set: {
                    label: "קבוצה (Set)",
                    gender: "f"
                },
                file: {
                    label: "קובץ",
                    gender: "m"
                },
                promise: {
                    label: "Promise",
                    gender: "m"
                },
                NaN: {
                    label: "NaN",
                    gender: "m"
                },
                unknown: {
                    label: "ערך לא ידוע",
                    gender: "m"
                },
                value: {
                    label: "ערך",
                    gender: "m"
                }
            }, t = {
                string: {
                    unit: "תווים",
                    shortLabel: "קצר",
                    longLabel: "ארוך"
                },
                file: {
                    unit: "בייטים",
                    shortLabel: "קטן",
                    longLabel: "גדול"
                },
                array: {
                    unit: "פריטים",
                    shortLabel: "קטן",
                    longLabel: "גדול"
                },
                set: {
                    unit: "פריטים",
                    shortLabel: "קטן",
                    longLabel: "גדול"
                },
                number: {
                    unit: "",
                    shortLabel: "קטן",
                    longLabel: "גדול"
                }
            }, n = t => t ? e[t] : void 0, r = t => {
                let r = n(t);
                return r ? r.label : null != t ? t : e.unknown.label
            }, i = e => "ה".concat(r(e)), a = e => {
                var t;
                let r = n(e);
                return "f" === (null != (t = null == r ? void 0 : r.gender) ? t : "m") ? "צריכה להיות" : "צריך להיות"
            }, o = e => {
                var n;
                return e && null != (n = t[e]) ? n : null
            }, c = {
                regex: {
                    label: "קלט",
                    gender: "m"
                },
                email: {
                    label: "כתובת אימייל",
                    gender: "f"
                },
                url: {
                    label: "כתובת רשת",
                    gender: "f"
                },
                emoji: {
                    label: "אימוג'י",
                    gender: "m"
                },
                uuid: {
                    label: "UUID",
                    gender: "m"
                },
                uuidv4: {
                    label: "UUIDv4",
                    gender: "m"
                },
                uuidv6: {
                    label: "UUIDv6",
                    gender: "m"
                },
                nanoid: {
                    label: "nanoid",
                    gender: "m"
                },
                guid: {
                    label: "GUID",
                    gender: "m"
                },
                cuid: {
                    label: "cuid",
                    gender: "m"
                },
                cuid2: {
                    label: "cuid2",
                    gender: "m"
                },
                ulid: {
                    label: "ULID",
                    gender: "m"
                },
                xid: {
                    label: "XID",
                    gender: "m"
                },
                ksuid: {
                    label: "KSUID",
                    gender: "m"
                },
                datetime: {
                    label: "תאריך וזמן ISO",
                    gender: "m"
                },
                date: {
                    label: "תאריך ISO",
                    gender: "m"
                },
                time: {
                    label: "זמן ISO",
                    gender: "m"
                },
                duration: {
                    label: "משך זמן ISO",
                    gender: "m"
                },
                ipv4: {
                    label: "כתובת IPv4",
                    gender: "f"
                },
                ipv6: {
                    label: "כתובת IPv6",
                    gender: "f"
                },
                mac: {
                    label: "כתובת MAC",
                    gender: "f"
                },
                cidrv4: {
                    label: "טווח IPv4",
                    gender: "m"
                },
                cidrv6: {
                    label: "טווח IPv6",
                    gender: "m"
                },
                base64: {
                    label: "מחרוזת בבסיס 64",
                    gender: "f"
                },
                base64url: {
                    label: "מחרוזת בבסיס 64 לכתובות רשת",
                    gender: "f"
                },
                json_string: {
                    label: "מחרוזת JSON",
                    gender: "f"
                },
                e164: {
                    label: "מספר E.164",
                    gender: "m"
                },
                credit_card: {
                    label: "מספר כרטיס אשראי",
                    gender: "m"
                },
                currency_code: {
                    label: "קוד מטבע",
                    gender: "m"
                },
                iban: {
                    label: "IBAN",
                    gender: "m"
                },
                jwt: {
                    label: "JWT",
                    gender: "m"
                },
                template_literal: {
                    label: "קלט",
                    gender: "m"
                },
                ends_with: {
                    label: "קלט",
                    gender: "m"
                },
                includes: {
                    label: "קלט",
                    gender: "m"
                },
                lowercase: {
                    label: "קלט",
                    gender: "m"
                },
                starts_with: {
                    label: "קלט",
                    gender: "m"
                },
                uppercase: {
                    label: "קלט",
                    gender: "m"
                }
            }, u = {
                nan: "NaN"
            }, t => {
                var n, l, s, d, m, f, v, p, g, h, _, y, I, w, k, x, S, z, U, A, D;
                switch (t.code) {
                    case "invalid_type": {
                        let i = t.expected,
                            a = null != (n = u[null != i ? i : ""]) ? n : r(i),
                            o = ex(t.input),
                            c = null != (l = null != (s = u[o]) ? s : null == (d = e[o]) ? void 0 : d.label) ? l : o;
                        if (/^[A-Z]/.test(t.expected)) return "קלט לא תקין: צריך להיות instanceof ".concat(t.expected, ", התקבל ").concat(c);
                        return "קלט לא תקין: צריך להיות ".concat(a, ", התקבל ").concat(c)
                    }
                    case "invalid_value": {
                        if (1 === t.values.length) return "ערך לא תקין: הערך חייב להיות ".concat(et(t.values[0]));
                        let e = t.values.map(e => et(e));
                        if (2 === t.values.length) return "ערך לא תקין: האפשרויות המתאימות הן ".concat(e[0], " או ").concat(e[1]);
                        let n = e[e.length - 1],
                            r = e.slice(0, -1).join(", ");
                        return "ערך לא תקין: האפשרויות המתאימות הן ".concat(r, " או ").concat(n)
                    }
                    case "too_big": {
                        let e = o(t.origin),
                            n = i(null != (m = t.origin) ? m : "value");
                        if ("string" === t.origin) return "".concat(null != (p = null == e ? void 0 : e.longLabel) ? p : "ארוך", " מדי: ").concat(n, " צריכה להכיל ").concat(t.maximum.toString(), " ").concat(null != (g = null == e ? void 0 : e.unit) ? g : "", " ").concat(t.inclusive ? "או פחות" : "לכל היותר").trim();
                        if ("number" === t.origin) {
                            let e = t.inclusive ? "קטן או שווה ל-".concat(t.maximum) : "קטן מ-".concat(t.maximum);
                            return "גדול מדי: ".concat(n, " צריך להיות ").concat(e)
                        }
                        if ("array" === t.origin || "set" === t.origin) {
                            let r = "set" === t.origin ? "צריכה" : "צריך",
                                i = t.inclusive ? "".concat(t.maximum, " ").concat(null != (h = null == e ? void 0 : e.unit) ? h : "", " או פחות") : "פחות מ-".concat(t.maximum, " ").concat(null != (_ = null == e ? void 0 : e.unit) ? _ : "");
                            return "גדול מדי: ".concat(n, " ").concat(r, " להכיל ").concat(i).trim()
                        }
                        let r = t.inclusive ? "<=" : "<",
                            c = a(null != (f = t.origin) ? f : "value");
                        if (null == e ? void 0 : e.unit) return "".concat(e.longLabel, " מדי: ").concat(n, " ").concat(c, " ").concat(r).concat(t.maximum.toString(), " ").concat(e.unit);
                        return "".concat(null != (v = null == e ? void 0 : e.longLabel) ? v : "גדול", " מדי: ").concat(n, " ").concat(c, " ").concat(r).concat(t.maximum.toString())
                    }
                    case "too_small": {
                        let e = o(t.origin),
                            n = i(null != (y = t.origin) ? y : "value");
                        if ("string" === t.origin) return "".concat(null != (k = null == e ? void 0 : e.shortLabel) ? k : "קצר", " מדי: ").concat(n, " צריכה להכיל ").concat(t.minimum.toString(), " ").concat(null != (x = null == e ? void 0 : e.unit) ? x : "", " ").concat(t.inclusive ? "או יותר" : "לפחות").trim();
                        if ("number" === t.origin) {
                            let e = t.inclusive ? "גדול או שווה ל-".concat(t.minimum) : "גדול מ-".concat(t.minimum);
                            return "קטן מדי: ".concat(n, " צריך להיות ").concat(e)
                        }
                        if ("array" === t.origin || "set" === t.origin) {
                            let r = "set" === t.origin ? "צריכה" : "צריך";
                            if (1 === t.minimum && t.inclusive) {
                                let e = (t.origin, "לפחות פריט אחד");
                                return "קטן מדי: ".concat(n, " ").concat(r, " להכיל ").concat(e)
                            }
                            let i = t.inclusive ? "".concat(t.minimum, " ").concat(null != (S = null == e ? void 0 : e.unit) ? S : "", " או יותר") : "יותר מ-".concat(t.minimum, " ").concat(null != (z = null == e ? void 0 : e.unit) ? z : "");
                            return "קטן מדי: ".concat(n, " ").concat(r, " להכיל ").concat(i).trim()
                        }
                        let r = t.inclusive ? ">=" : ">",
                            c = a(null != (I = t.origin) ? I : "value");
                        if (null == e ? void 0 : e.unit) return "".concat(e.shortLabel, " מדי: ").concat(n, " ").concat(c, " ").concat(r).concat(t.minimum.toString(), " ").concat(e.unit);
                        return "".concat(null != (w = null == e ? void 0 : e.shortLabel) ? w : "קטן", " מדי: ").concat(n, " ").concat(c, " ").concat(r).concat(t.minimum.toString())
                    }
                    case "invalid_format": {
                        if ("starts_with" === t.format) return 'המחרוזת חייבת להתחיל ב "'.concat(t.prefix, '"');
                        if ("ends_with" === t.format) return 'המחרוזת חייבת להסתיים ב "'.concat(t.suffix, '"');
                        if ("includes" === t.format) return 'המחרוזת חייבת לכלול "'.concat(t.includes, '"');
                        if ("regex" === t.format) return "המחרוזת חייבת להתאים לתבנית ".concat(t.pattern);
                        let e = c[t.format],
                            n = null != (U = null == e ? void 0 : e.label) ? U : t.format,
                            r = null != (A = null == e ? void 0 : e.gender) ? A : "m";
                        return "".concat(n, " לא ").concat("f" === r ? "תקינה" : "תקין")
                    }
                    case "not_multiple_of":
                        return "מספר לא תקין: חייב להיות מכפלה של ".concat(t.divisor);
                    case "unrecognized_keys":
                        return "מפתח".concat(t.keys.length > 1 ? "ות" : "", " לא מזוה").concat(t.keys.length > 1 ? "ים" : "ה", ": ").concat(b(t.keys, ", "));
                    case "invalid_key":
                        return "שדה לא תקין באובייקט";
                    case "invalid_union":
                    default:
                        return "קלט לא תקין";
                    case "invalid_element": {
                        let e = i(null != (D = t.origin) ? D : "array");
                        return "ערך לא תקין ב".concat(e)
                    }
                }
            })
        }
    }, "hi", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "अक्षर",
                        verb: "रखने के लिए"
                    },
                    file: {
                        unit: "बाइट्स",
                        verb: "रखने के लिए"
                    },
                    array: {
                        unit: "तत्व",
                        verb: "रखने के लिए"
                    },
                    set: {
                        unit: "तत्व",
                        verb: "रखने के लिए"
                    },
                    map: {
                        unit: "प्रविष्टियाँ",
                        verb: "रखने के लिए"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "इनपुट",
                        email: "ईमेल पता",
                        url: "URL",
                        emoji: "इमोजी",
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
                        datetime: "ISO तिथि और समय",
                        date: "ISO तिथि",
                        time: "ISO समय",
                        duration: "ISO अवधि",
                        ipv4: "IPv4 पता",
                        ipv6: "IPv6 पता",
                        mac: "MAC पता",
                        cidrv4: "IPv4 श्रेणी",
                        cidrv6: "IPv6 श्रेणी",
                        base64: "Base64-एन्कोडेड स्ट्रिंग",
                        base64url: "Base64URL-एन्कोडेड स्ट्रिंग",
                        json_string: "JSON स्ट्रिंग",
                        e164: "E.164 संख्या",
                        credit_card: "क्रेडिट कार्ड संख्या",
                        currency_code: "मुद्रा कोड",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "इनपुट"
                    },
                    r = {
                        nan: "NaN"
                    };
                return e => {
                    var i, a, o, c, u;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            return "अमान्य इनपुट: अपेक्षित ".concat(t, ", प्राप्त ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "अमान्य इनपुट: अपेक्षित ".concat(et(e.values[0]));
                            return "अमान्य विकल्प: अपेक्षित मानों में से एक ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "बहुत बड़ा: अपेक्षित था कि ".concat(null != (o = e.origin) ? o : "मान", " में ").concat(n).concat(e.maximum, " ").concat(r.unit, " हों");
                            return "बहुत बड़ा: अपेक्षित था कि ".concat(null != (c = e.origin) ? c : "मान", " ").concat(n).concat(e.maximum, " हो")
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "बहुत छोटा: अपेक्षित था कि ".concat(e.origin, " में ").concat(n).concat(e.minimum, " ").concat(r.unit, " हों");
                            return "बहुत छोटा: अपेक्षित था कि ".concat(e.origin, " ").concat(n).concat(e.minimum, " हो")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'अमान्य स्ट्रिंग: "'.concat(e.prefix, '" से शुरू होना चाहिए');
                            if ("ends_with" === e.format) return 'अमान्य स्ट्रिंग: "'.concat(e.suffix, '" पर समाप्त होना चाहिए');
                            if ("includes" === e.format) return 'अमान्य स्ट्रिंग: इसमें "'.concat(e.includes, '" शामिल होना चाहिए');
                            if ("regex" === e.format) return "अमान्य स्ट्रिंग: पैटर्न ".concat(e.pattern, " से मेल खाना चाहिए");
                            return "अमान्य ".concat(null != (u = n[e.format]) ? u : e.format);
                        case "not_multiple_of":
                            return "अमान्य संख्या: यह ".concat(e.divisor, " का गुणज होना चाहिए");
                        case "unrecognized_keys":
                            return "अपरिचित कुंजी".concat(e.keys.length > 1 ? "याँ" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "अमान्य कुंजी: ".concat(e.origin, " में");
                        case "invalid_union":
                            if (e.options && Array.isArray(e.options) && e.options.length > 0) {
                                let t = e.options.map(e => "'".concat(e, "'")).join(" | ");
                                return "अमान्य डिस्क्रिमिनेटर मान: अपेक्षित ".concat(t)
                            }
                            return "अमान्य इनपुट";
                        case "invalid_element":
                            return "अमान्य मान: ".concat(e.origin, " में");
                        default:
                            return "अमान्य इनपुट"
                    }
                }
            })()
        }
    }, "hr", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "znakova",
                        verb: "imati"
                    },
                    file: {
                        unit: "bajtova",
                        verb: "imati"
                    },
                    array: {
                        unit: "stavki",
                        verb: "imati"
                    },
                    set: {
                        unit: "stavki",
                        verb: "imati"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "unos",
                        email: "email adresa",
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
                        datetime: "ISO datum i vrijeme",
                        date: "ISO datum",
                        time: "ISO vrijeme",
                        duration: "ISO trajanje",
                        ipv4: "IPv4 adresa",
                        ipv6: "IPv6 adresa",
                        mac: "MAC adresa",
                        cidrv4: "IPv4 raspon",
                        cidrv6: "IPv6 raspon",
                        base64: "base64 kodirani tekst",
                        base64url: "base64url kodirani tekst",
                        json_string: "JSON tekst",
                        e164: "E.164 broj",
                        credit_card: "broj kreditne kartice",
                        currency_code: "kod valute",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "unos"
                    },
                    r = {
                        nan: "NaN",
                        string: "tekst",
                        number: "broj",
                        boolean: "boolean",
                        array: "niz",
                        object: "objekt",
                        set: "skup",
                        file: "datoteka",
                        date: "datum",
                        bigint: "bigint",
                        symbol: "simbol",
                        undefined: "undefined",
                        null: "null",
                        function: "funkcija",
                        map: "mapa"
                    };
                return e => {
                    var i, a, o, c, u, l, s, d;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Neispravan unos: očekuje se instanceof ".concat(e.expected, ", a primljeno je ").concat(o);
                            return "Neispravan unos: očekuje se ".concat(t, ", a primljeno je ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Neispravna vrijednost: očekivano ".concat(et(e.values[0]));
                            return "Neispravna opcija: očekivano jedno od ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin),
                                a = null != (o = r[e.origin]) ? o : e.origin;
                            if (i) return "Preveliko: očekivano da ".concat(null != a ? a : "vrijednost", " ima ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "elemenata");
                            return "Preveliko: očekivano da ".concat(null != a ? a : "vrijednost", " bude ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin),
                                a = null != (u = r[e.origin]) ? u : e.origin;
                            if (i) return "Premalo: očekivano da ".concat(a, " ima ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "Premalo: očekivano da ".concat(a, " bude ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Neispravan tekst: mora započinjati s "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Neispravan tekst: mora završavati s "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Neispravan tekst: mora sadržavati "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Neispravan tekst: mora odgovarati uzorku ".concat(e.pattern);
                            return "Neispravna ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "Neispravan broj: mora biti višekratnik od ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Neprepoznat".concat(e.keys.length > 1 ? "i ključevi" : " ključ", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Neispravan ključ u ".concat(null != (s = r[e.origin]) ? s : e.origin);
                        case "invalid_union":
                        default:
                            return "Neispravan unos";
                        case "invalid_element":
                            return "Neispravna vrijednost u ".concat(null != (d = r[e.origin]) ? d : e.origin)
                    }
                }
            })()
        }
    }, "hu", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "karakter",
                        verb: "legyen"
                    },
                    file: {
                        unit: "byte",
                        verb: "legyen"
                    },
                    array: {
                        unit: "elem",
                        verb: "legyen"
                    },
                    set: {
                        unit: "elem",
                        verb: "legyen"
                    },
                    map: {
                        unit: "elem",
                        verb: "legyen"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "bemenet",
                        email: "email cím",
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
                        datetime: "ISO időbélyeg",
                        date: "ISO dátum",
                        time: "ISO idő",
                        duration: "ISO időintervallum",
                        ipv4: "IPv4 cím",
                        ipv6: "IPv6 cím",
                        mac: "MAC cím",
                        cidrv4: "IPv4 tartomány",
                        cidrv6: "IPv6 tartomány",
                        base64: "base64-kódolt string",
                        base64url: "base64url-kódolt string",
                        json_string: "JSON string",
                        e164: "E.164 szám",
                        credit_card: "hitelkártyaszám",
                        currency_code: "pénznemkód",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "bemenet"
                    },
                    r = {
                        nan: "NaN",
                        number: "szám",
                        array: "tömb"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Érvénytelen bemenet: a várt érték instanceof ".concat(e.expected, ", a kapott érték ").concat(o);
                            return "Érvénytelen bemenet: a várt érték ".concat(t, ", a kapott érték ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Érvénytelen bemenet: a várt érték ".concat(et(e.values[0]));
                            return "Érvénytelen opció: valamelyik érték várt ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Túl nagy: ".concat(null != (o = e.origin) ? o : "érték", " mérete túl nagy ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "elem");
                            return "Túl nagy: a bemeneti érték ".concat(null != (u = e.origin) ? u : "érték", " túl nagy: ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Túl kicsi: a bemeneti érték ".concat(e.origin, " mérete túl kicsi ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Túl kicsi: a bemeneti érték ".concat(e.origin, " túl kicsi ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Érvénytelen string: "'.concat(e.prefix, '" értékkel kell kezdődnie');
                            if ("ends_with" === e.format) return 'Érvénytelen string: "'.concat(e.suffix, '" értékkel kell végződnie');
                            if ("includes" === e.format) return 'Érvénytelen string: "'.concat(e.includes, '" értéket kell tartalmaznia');
                            if ("regex" === e.format) return "Érvénytelen string: ".concat(e.pattern, " mintának kell megfelelnie");
                            return "Érvénytelen ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "Érvénytelen szám: ".concat(e.divisor, " többszörösének kell lennie");
                        case "unrecognized_keys":
                            return "Ismeretlen kulcs".concat(e.keys.length > 1 ? "s" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Érvénytelen kulcs ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Érvénytelen bemenet";
                        case "invalid_element":
                            return "Érvénytelen érték: ".concat(e.origin)
                    }
                }
            })()
        }
    }, "hy", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: {
                            one: "նշան",
                            many: "նշաններ"
                        },
                        verb: "ունենալ"
                    },
                    file: {
                        unit: {
                            one: "բայթ",
                            many: "բայթեր"
                        },
                        verb: "ունենալ"
                    },
                    array: {
                        unit: {
                            one: "տարր",
                            many: "տարրեր"
                        },
                        verb: "ունենալ"
                    },
                    set: {
                        unit: {
                            one: "տարր",
                            many: "տարրեր"
                        },
                        verb: "ունենալ"
                    },
                    map: {
                        unit: {
                            one: "տարր",
                            many: "տարրեր"
                        },
                        verb: "ունենալ"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "մուտք",
                        email: "էլ. հասցե",
                        url: "URL",
                        emoji: "էմոջի",
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
                        datetime: "ISO ամսաթիվ և ժամ",
                        date: "ISO ամսաթիվ",
                        time: "ISO ժամ",
                        duration: "ISO տևողություն",
                        ipv4: "IPv4 հասցե",
                        ipv6: "IPv6 հասցե",
                        mac: "MAC հասցե",
                        cidrv4: "IPv4 միջակայք",
                        cidrv6: "IPv6 միջակայք",
                        base64: "base64 ձևաչափով տող",
                        base64url: "base64url ձևաչափով տող",
                        json_string: "JSON տող",
                        e164: "E.164 համար",
                        credit_card: "կրեդիտ քարտի համար",
                        currency_code: "արժույթի կոդ",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "մուտք"
                    },
                    r = {
                        nan: "NaN",
                        number: "թիվ",
                        array: "զանգված"
                    };
                return e => {
                    var i, a, o, c, u;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Սխալ մուտքագրում․ սպասվում էր instanceof ".concat(e.expected, ", ստացվել է ").concat(o);
                            return "Սխալ մուտքագրում․ սպասվում էր ".concat(t, ", ստացվել է ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Սխալ մուտքագրում․ սպասվում էր ".concat(et(e.values[1]));
                            return "Սխալ տարբերակ․ սպասվում էր հետևյալներից մեկը՝ ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) {
                                let t = tR(Number(e.maximum), r.unit.one, r.unit.many);
                                return "Չափազանց մեծ արժեք․ սպասվում է, որ ".concat(tG(null != (c = e.origin) ? c : "արժեք"), " կունենա ").concat(n).concat(e.maximum.toString(), " ").concat(t)
                            }
                            return "Չափազանց մեծ արժեք․ սպասվում է, որ ".concat(tG(null != (o = e.origin) ? o : "արժեք"), " լինի ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) {
                                let t = tR(Number(e.minimum), r.unit.one, r.unit.many);
                                return "Չափազանց փոքր արժեք․ սպասվում է, որ ".concat(tG(e.origin), " կունենա ").concat(n).concat(e.minimum.toString(), " ").concat(t)
                            }
                            return "Չափազանց փոքր արժեք․ սպասվում է, որ ".concat(tG(e.origin), " լինի ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Սխալ տող․ պետք է սկսվի "'.concat(e.prefix, '"-ով');
                            if ("ends_with" === e.format) return 'Սխալ տող․ պետք է ավարտվի "'.concat(e.suffix, '"-ով');
                            if ("includes" === e.format) return 'Սխալ տող․ պետք է պարունակի "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Սխալ տող․ պետք է համապատասխանի ".concat(e.pattern, " ձևաչափին");
                            return "Սխալ ".concat(null != (u = n[e.format]) ? u : e.format);
                        case "not_multiple_of":
                            return "Սխալ թիվ․ պետք է բազմապատիկ լինի ".concat(e.divisor, "-ի");
                        case "unrecognized_keys":
                            return "Չճանաչված բանալի".concat(e.keys.length > 1 ? "ներ" : "", ". ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Սխալ բանալի ".concat(tG(e.origin), "-ում");
                        case "invalid_union":
                        default:
                            return "Սխալ մուտքագրում";
                        case "invalid_element":
                            return "Սխալ արժեք ".concat(tG(e.origin), "-ում")
                    }
                }
            })()
        }
    }, "id", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "karakter",
                        verb: "memiliki"
                    },
                    file: {
                        unit: "byte",
                        verb: "memiliki"
                    },
                    array: {
                        unit: "item",
                        verb: "memiliki"
                    },
                    set: {
                        unit: "item",
                        verb: "memiliki"
                    },
                    map: {
                        unit: "item",
                        verb: "memiliki"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "input",
                        email: "alamat email",
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
                        datetime: "tanggal dan waktu format ISO",
                        date: "tanggal format ISO",
                        time: "jam format ISO",
                        duration: "durasi format ISO",
                        ipv4: "alamat IPv4",
                        ipv6: "alamat IPv6",
                        mac: "alamat MAC",
                        cidrv4: "rentang alamat IPv4",
                        cidrv6: "rentang alamat IPv6",
                        base64: "string dengan enkode base64",
                        base64url: "string dengan enkode base64url",
                        json_string: "string JSON",
                        e164: "angka E.164",
                        credit_card: "nomor kartu kredit",
                        currency_code: "kode mata uang",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    r = {
                        nan: "NaN"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Input tidak valid: diharapkan instanceof ".concat(e.expected, ", diterima ").concat(o);
                            return "Input tidak valid: diharapkan ".concat(t, ", diterima ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Input tidak valid: diharapkan ".concat(et(e.values[0]));
                            return "Pilihan tidak valid: diharapkan salah satu dari ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Terlalu besar: diharapkan ".concat(null != (o = e.origin) ? o : "value", " memiliki ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "elemen");
                            return "Terlalu besar: diharapkan ".concat(null != (u = e.origin) ? u : "value", " menjadi ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Terlalu kecil: diharapkan ".concat(e.origin, " memiliki ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Terlalu kecil: diharapkan ".concat(e.origin, " menjadi ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'String tidak valid: harus dimulai dengan "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'String tidak valid: harus berakhir dengan "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'String tidak valid: harus menyertakan "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "String tidak valid: harus sesuai pola ".concat(e.pattern);
                            return "".concat(null != (l = n[e.format]) ? l : e.format, " tidak valid");
                        case "not_multiple_of":
                            return "Angka tidak valid: harus kelipatan dari ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Kunci tidak dikenali ".concat(e.keys.length > 1 ? "s" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Kunci tidak valid di ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Input tidak valid";
                        case "invalid_element":
                            return "Nilai tidak valid di ".concat(e.origin)
                    }
                }
            })()
        }
    }, "is", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "stafi",
                        verb: "að hafa"
                    },
                    file: {
                        unit: "bæti",
                        verb: "að hafa"
                    },
                    array: {
                        unit: "hluti",
                        verb: "að hafa"
                    },
                    set: {
                        unit: "hluti",
                        verb: "að hafa"
                    },
                    map: {
                        unit: "hluti",
                        verb: "að hafa"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "gildi",
                        email: "netfang",
                        url: "vefslóð",
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
                        datetime: "ISO dagsetning og tími",
                        date: "ISO dagsetning",
                        time: "ISO tími",
                        duration: "ISO tímalengd",
                        ipv4: "IPv4 address",
                        ipv6: "IPv6 address",
                        mac: "MAC address",
                        cidrv4: "IPv4 range",
                        cidrv6: "IPv6 range",
                        base64: "base64-encoded strengur",
                        base64url: "base64url-encoded strengur",
                        json_string: "JSON strengur",
                        e164: "E.164 tölugildi",
                        credit_card: "kreditkortanúmer",
                        currency_code: "gjaldmiðilskóði",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "gildi"
                    },
                    r = {
                        nan: "NaN",
                        number: "númer",
                        array: "fylki"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Rangt gildi: Þú slóst inn ".concat(o, " þar sem á að vera instanceof ").concat(e.expected);
                            return "Rangt gildi: Þú slóst inn ".concat(o, " þar sem á að vera ").concat(t)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Rangt gildi: gert ráð fyrir ".concat(et(e.values[0]));
                            return "Ógilt val: má vera eitt af eftirfarandi ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Of stórt: gert er ráð fyrir að ".concat(null != (o = e.origin) ? o : "gildi", " hafi ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "hluti");
                            return "Of stórt: gert er ráð fyrir að ".concat(null != (u = e.origin) ? u : "gildi", " sé ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Of lítið: gert er ráð fyrir að ".concat(e.origin, " hafi ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Of lítið: gert er ráð fyrir að ".concat(e.origin, " sé ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Ógildur strengur: verður að byrja á "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Ógildur strengur: verður að enda á "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Ógildur strengur: verður að innihalda "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Ógildur strengur: verður að fylgja mynstri ".concat(e.pattern);
                            return "Rangt ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "Röng tala: verður að vera margfeldi af ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Óþekkt ".concat(e.keys.length > 1 ? "ir lyklar" : "ur lykill", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Rangur lykill í ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Rangt gildi";
                        case "invalid_element":
                            return "Rangt gildi í ".concat(e.origin)
                    }
                }
            })()
        }
    }, "it", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "caratteri",
                        verb: "avere"
                    },
                    file: {
                        unit: "byte",
                        verb: "avere"
                    },
                    array: {
                        unit: "elementi",
                        verb: "avere"
                    },
                    set: {
                        unit: "elementi",
                        verb: "avere"
                    },
                    map: {
                        unit: "elementi",
                        verb: "avere"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "input",
                        email: "indirizzo email",
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
                        datetime: "data e ora ISO",
                        date: "data ISO",
                        time: "ora ISO",
                        duration: "durata ISO",
                        ipv4: "indirizzo IPv4",
                        ipv6: "indirizzo IPv6",
                        mac: "indirizzo MAC",
                        cidrv4: "intervallo IPv4",
                        cidrv6: "intervallo IPv6",
                        base64: "stringa codificata in base64",
                        base64url: "URL codificata in base64",
                        json_string: "stringa JSON",
                        e164: "numero E.164",
                        credit_card: "numero di carta di credito",
                        currency_code: "codice valuta",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    r = {
                        nan: "NaN",
                        number: "numero",
                        array: "vettore"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Input non valido: atteso instanceof ".concat(e.expected, ", ricevuto ").concat(o);
                            return "Input non valido: atteso ".concat(t, ", ricevuto ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Input non valido: atteso ".concat(et(e.values[0]));
                            return "Opzione non valida: atteso uno tra ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Troppo grande: ".concat(null != (o = e.origin) ? o : "valore", " deve avere ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "elementi");
                            return "Troppo grande: ".concat(null != (u = e.origin) ? u : "valore", " deve essere ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Troppo piccolo: ".concat(e.origin, " deve avere ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Troppo piccolo: ".concat(e.origin, " deve essere ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Stringa non valida: deve iniziare con "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Stringa non valida: deve terminare con "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Stringa non valida: deve includere "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Stringa non valida: deve corrispondere al pattern ".concat(e.pattern);
                            return "Input non valido: ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "Numero non valido: deve essere un multiplo di ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Chiav".concat(e.keys.length > 1 ? "i" : "e", " non riconosciut").concat(e.keys.length > 1 ? "e" : "a", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Chiave non valida in ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Input non valido";
                        case "invalid_element":
                            return "Valore non valido in ".concat(e.origin)
                    }
                }
            })()
        }
    }, "ja", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "文字",
                        verb: "である"
                    },
                    file: {
                        unit: "バイト",
                        verb: "である"
                    },
                    array: {
                        unit: "要素",
                        verb: "である"
                    },
                    set: {
                        unit: "要素",
                        verb: "である"
                    },
                    map: {
                        unit: "要素",
                        verb: "である"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "入力値",
                        email: "メールアドレス",
                        url: "URL",
                        emoji: "絵文字",
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
                        datetime: "ISO日時",
                        date: "ISO日付",
                        time: "ISO時刻",
                        duration: "ISO期間",
                        ipv4: "IPv4アドレス",
                        ipv6: "IPv6アドレス",
                        mac: "MACアドレス",
                        cidrv4: "IPv4範囲",
                        cidrv6: "IPv6範囲",
                        base64: "base64エンコード文字列",
                        base64url: "base64urlエンコード文字列",
                        json_string: "JSON文字列",
                        e164: "E.164番号",
                        credit_card: "クレジットカード番号",
                        currency_code: "通貨コード",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "入力値"
                    },
                    r = {
                        nan: "NaN",
                        number: "数値",
                        array: "配列"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "無効な入力: instanceof ".concat(e.expected, "が期待されましたが、").concat(o, "が入力されました");
                            return "無効な入力: ".concat(t, "が期待されましたが、").concat(o, "が入力されました")
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "無効な入力: ".concat(et(e.values[0]), "が期待されました");
                            return "無効な選択: ".concat(b(e.values, "、"), "のいずれかである必要があります");
                        case "too_big": {
                            let n = e.inclusive ? "以下である" : "より小さい",
                                r = t(e.origin);
                            if (r) return "大きすぎる値: ".concat(null != (o = e.origin) ? o : "値", "は").concat(e.maximum.toString()).concat(null != (c = r.unit) ? c : "要素").concat(n, "必要があります");
                            return "大きすぎる値: ".concat(null != (u = e.origin) ? u : "値", "は").concat(e.maximum.toString()).concat(n, "必要があります")
                        }
                        case "too_small": {
                            let n = e.inclusive ? "以上である" : "より大きい",
                                r = t(e.origin);
                            if (r) return "小さすぎる値: ".concat(e.origin, "は").concat(e.minimum.toString()).concat(r.unit).concat(n, "必要があります");
                            return "小さすぎる値: ".concat(e.origin, "は").concat(e.minimum.toString()).concat(n, "必要があります")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return '無効な文字列: "'.concat(e.prefix, '"で始まる必要があります');
                            if ("ends_with" === e.format) return '無効な文字列: "'.concat(e.suffix, '"で終わる必要があります');
                            if ("includes" === e.format) return '無効な文字列: "'.concat(e.includes, '"を含む必要があります');
                            if ("regex" === e.format) return "無効な文字列: パターン".concat(e.pattern, "に一致する必要があります");
                            return "無効な".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "無効な数値: ".concat(e.divisor, "の倍数である必要があります");
                        case "unrecognized_keys":
                            return "認識されていないキー".concat(e.keys.length > 1 ? "群" : "", ": ").concat(b(e.keys, "、"));
                        case "invalid_key":
                            return "".concat(e.origin, "内の無効なキー");
                        case "invalid_union":
                        default:
                            return "無効な入力";
                        case "invalid_element":
                            return "".concat(e.origin, "内の無効な値")
                    }
                }
            })()
        }
    }, "ka", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "სიმბოლო",
                        verb: "უნდა შეიცავდეს"
                    },
                    file: {
                        unit: "ბაიტი",
                        verb: "უნდა შეიცავდეს"
                    },
                    array: {
                        unit: "ელემენტი",
                        verb: "უნდა შეიცავდეს"
                    },
                    set: {
                        unit: "ელემენტი",
                        verb: "უნდა შეიცავდეს"
                    },
                    map: {
                        unit: "ელემენტი",
                        verb: "უნდა შეიცავდეს"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "შეყვანა",
                        email: "ელ-ფოსტის მისამართი",
                        url: "URL",
                        emoji: "ემოჯი",
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
                        datetime: "თარიღი-დრო",
                        date: "თარიღი",
                        time: "დრო",
                        duration: "ხანგრძლივობა",
                        ipv4: "IPv4 მისამართი",
                        ipv6: "IPv6 მისამართი",
                        mac: "MAC მისამართი",
                        cidrv4: "IPv4 დიაპაზონი",
                        cidrv6: "IPv6 დიაპაზონი",
                        base64: "base64-კოდირებული ველი",
                        base64url: "base64url-კოდირებული ველი",
                        json_string: "JSON ველი",
                        e164: "E.164 ნომერი",
                        credit_card: "საკრედიტო ბარათის ნომერი",
                        currency_code: "ვალუტის კოდი",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "შეყვანა"
                    },
                    r = {
                        nan: "NaN",
                        number: "რიცხვი",
                        string: "ველი",
                        boolean: "ბულეანი",
                        function: "ფუნქცია",
                        array: "მასივი"
                    };
                return e => {
                    var i, a, o, c, u;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "არასწორი შეყვანა: მოსალოდნელი instanceof ".concat(e.expected, ", მიღებული ").concat(o);
                            return "არასწორი შეყვანა: მოსალოდნელი ".concat(t, ", მიღებული ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "არასწორი შეყვანა: მოსალოდნელი ".concat(et(e.values[0]));
                            return "არასწორი ვარიანტი: მოსალოდნელია ერთ-ერთი ".concat(b(e.values, "|"), "-დან");
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "ზედმეტად დიდი: მოსალოდნელი ".concat(null != (o = e.origin) ? o : "მნიშვნელობა", " ").concat(r.verb, " ").concat(n).concat(e.maximum.toString(), " ").concat(r.unit);
                            return "ზედმეტად დიდი: მოსალოდნელი ".concat(null != (c = e.origin) ? c : "მნიშვნელობა", " იყოს ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "ზედმეტად პატარა: მოსალოდნელი ".concat(e.origin, " ").concat(r.verb, " ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "ზედმეტად პატარა: მოსალოდნელი ".concat(e.origin, " იყოს ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'არასწორი ველი: უნდა იწყებოდეს "'.concat(e.prefix, '"-ით');
                            if ("ends_with" === e.format) return 'არასწორი ველი: უნდა მთავრდებოდეს "'.concat(e.suffix, '"-ით');
                            if ("includes" === e.format) return 'არასწორი ველი: უნდა შეიცავდეს "'.concat(e.includes, '"-ს');
                            if ("regex" === e.format) return "არასწორი ველი: უნდა შეესაბამებოდეს შაბლონს ".concat(e.pattern);
                            return "არასწორი ".concat(null != (u = n[e.format]) ? u : e.format);
                        case "not_multiple_of":
                            return "არასწორი რიცხვი: უნდა იყოს ".concat(e.divisor, "-ის ჯერადი");
                        case "unrecognized_keys":
                            return "უცნობი გასაღებ".concat(e.keys.length > 1 ? "ები" : "ი", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "არასწორი გასაღები ".concat(e.origin, "-ში");
                        case "invalid_union":
                        default:
                            return "არასწორი შეყვანა";
                        case "invalid_element":
                            return "არასწორი მნიშვნელობა ".concat(e.origin, "-ში")
                    }
                }
            })()
        }
    }, "kh", 0, function() {
        return tJ()
    }, "km", 0, tJ, "kn", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "ಅಕ್ಷರಗಳು",
                        verb: "ಹೊಂದಲು"
                    },
                    file: {
                        unit: "ಬೈಟ್‌ಗಳು",
                        verb: "ಹೊಂದಲು"
                    },
                    array: {
                        unit: "ವಸ್ತುಗಳು",
                        verb: "ಹೊಂದಲು"
                    },
                    set: {
                        unit: "ವಸ್ತುಗಳು",
                        verb: "ಹೊಂದಲು"
                    },
                    map: {
                        unit: "entries",
                        verb: "ಹೊಂದಲು"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "ಇನ್ಪುಟ್",
                        email: "email ವಿಳಾಸ",
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
                        datetime: "ISO ದಿನಾಂಕದ ಸಮಯ",
                        date: "ISO ದಿನಾಂಕ",
                        time: "ISO ಸಮಯ",
                        duration: "ISO ಅವಧಿ",
                        ipv4: "IPv4 ವಿಳಾಸ",
                        ipv6: "IPv6 ವಿಳಾಸ",
                        mac: "MAC ವಿಳಾಸ",
                        cidrv4: "IPv4 ವ್ಯಾಪ್ತಿಯ",
                        cidrv6: "IPv6 ವ್ಯಾಪ್ತಿಯ",
                        base64: "base64-encodedಸ್ಟ್ರಿಂಗ್",
                        base64url: "base64url-encodedಸ್ಟ್ರಿಂಗ್",
                        json_string: "JSONಸ್ಟ್ರಿಂಗ್",
                        e164: "E.164 ಸಂಖ್ಯೆ",
                        credit_card: "ಕ್ರೆಡಿಟ್ ಕಾರ್ಡ್ ಸಂಖ್ಯೆ",
                        currency_code: "ಕರೆನ್ಸಿ ಕೋಡ್",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "ಇನ್ಪುಟ್"
                    },
                    r = {
                        nan: "NaN"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            return "ಅಮಾನ್ಯ ಇನ್‌ಪುಟ್: ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(t, ", ಸ್ವೀಕರಿಸಿದನು ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "ಅಮಾನ್ಯ ಇನ್‌ಪುಟ್: ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(et(e.values[0]));
                            return "ಅಮಾನ್ಯ ಆಯ್ಕೆ: ಇವುಗಳಲ್ಲಿ ಒಂದನ್ನು ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "ತುಂಬಾ ದೊಡ್ಡದು: ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(null != (o = e.origin) ? o : "value", " ಹೊಂದಲು ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "ಅಂಶಗಳು");
                            return "ತುಂಬಾ ದೊಡ್ಡದು: ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(null != (u = e.origin) ? u : "value", " ಎಂದು ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "ತುಂಬಾ ಚಿಕ್ಕದು: ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(e.origin, " ಹೊಂದಲು ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "ತುಂಬಾ ಚಿಕ್ಕದು: ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(e.origin, " ಎಂದು ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'ಅಮಾನ್ಯವಾದ ಸ್ಟ್ರಿಂಗ್: ಇದರೊಂದಿಗೆ ಪ್ರಾರಂಭಿಸಬೇಕು "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'ಅಮಾನ್ಯವಾದ ಸ್ಟ್ರಿಂಗ್: ಇದರೊಂದಿಗೆ ಕೊನೆಗೊಳ್ಳಬೇಕು "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'ಅಮಾನ್ಯ ಸ್ಟ್ರಿಂಗ್: ಒಳಗೊಂಡಿರಬೇಕು "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "ಅಮಾನ್ಯವಾದ ಸ್ಟ್ರಿಂಗ್: ಮಾದರಿಗೆ ಹೊಂದಿಕೆಯಾಗಬೇಕು ".concat(e.pattern);
                            return "ಅಮಾನ್ಯ ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "ಅಮಾನ್ಯ ಸಂಖ್ಯೆ: ಬಹುಸಂಖ್ಯೆಯಾಗಿರಬೇಕು ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "ಗುರುತಿಸಲಾಗದ ಕೀ ".concat(e.keys.length > 1 ? "s" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "ಅಮಾನ್ಯವಾದ ಕೀ ಇನ್ ".concat(e.origin);
                        case "invalid_union":
                            if (e.options && Array.isArray(e.options) && e.options.length > 0) {
                                let t = e.options.map(e => "'".concat(e, "'")).join(" | ");
                                return "ಅಮಾನ್ಯ ತಾರತಮ್ಯ ಮೌಲ್ಯ. ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(t)
                            }
                            return "ಅಮಾನ್ಯ ಇನ್‌ಪುಟ್";
                        case "invalid_element":
                            return "ರಲ್ಲಿ ಅಮಾನ್ಯ ಮೌಲ್ಯ ".concat(e.origin);
                        default:
                            return "ಅಮಾನ್ಯ ಇನ್‌ಪುಟ್"
                    }
                }
            })()
        }
    }, "ko", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "문자",
                        verb: "to have"
                    },
                    file: {
                        unit: "바이트",
                        verb: "to have"
                    },
                    array: {
                        unit: "개",
                        verb: "to have"
                    },
                    set: {
                        unit: "개",
                        verb: "to have"
                    },
                    map: {
                        unit: "개",
                        verb: "to have"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "입력",
                        email: "이메일 주소",
                        url: "URL",
                        emoji: "이모지",
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
                        datetime: "ISO 날짜시간",
                        date: "ISO 날짜",
                        time: "ISO 시간",
                        duration: "ISO 기간",
                        ipv4: "IPv4 주소",
                        ipv6: "IPv6 주소",
                        mac: "MAC 주소",
                        cidrv4: "IPv4 범위",
                        cidrv6: "IPv6 범위",
                        base64: "base64 인코딩 문자열",
                        base64url: "base64url 인코딩 문자열",
                        json_string: "JSON 문자열",
                        e164: "E.164 번호",
                        credit_card: "신용카드 번호",
                        currency_code: "통화 코드",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "입력"
                    },
                    r = {
                        nan: "NaN"
                    };
                return e => {
                    var i, a, o, c, u, l, s, d, m;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "잘못된 입력: 예상 타입은 instanceof ".concat(e.expected, ", 받은 타입은 ").concat(o, "입니다");
                            return "잘못된 입력: 예상 타입은 ".concat(t, ", 받은 타입은 ").concat(o, "입니다")
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "잘못된 입력: 값은 ".concat(et(e.values[0]), " 이어야 합니다");
                            return "잘못된 옵션: ".concat(b(e.values, "또는 "), " 중 하나여야 합니다");
                        case "too_big": {
                            let n = e.inclusive ? "이하" : "미만",
                                r = "미만" === n ? "이어야 합니다" : "여야 합니다",
                                i = t(e.origin),
                                a = null != (o = null == i ? void 0 : i.unit) ? o : "요소";
                            if (i) return "".concat(null != (c = e.origin) ? c : "값", "이 너무 큽니다: ").concat(e.maximum.toString()).concat(a, " ").concat(n).concat(r);
                            return "".concat(null != (u = e.origin) ? u : "값", "이 너무 큽니다: ").concat(e.maximum.toString(), " ").concat(n).concat(r)
                        }
                        case "too_small": {
                            let n = e.inclusive ? "이상" : "초과",
                                r = "이상" === n ? "이어야 합니다" : "여야 합니다",
                                i = t(e.origin),
                                a = null != (l = null == i ? void 0 : i.unit) ? l : "요소";
                            if (i) return "".concat(null != (d = e.origin) ? d : "값", "이 너무 작습니다: ").concat(e.minimum.toString()).concat(a, " ").concat(n).concat(r);
                            return "".concat(null != (s = e.origin) ? s : "값", "이 너무 작습니다: ").concat(e.minimum.toString(), " ").concat(n).concat(r)
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return '잘못된 문자열: "'.concat(e.prefix, '"(으)로 시작해야 합니다');
                            if ("ends_with" === e.format) return '잘못된 문자열: "'.concat(e.suffix, '"(으)로 끝나야 합니다');
                            if ("includes" === e.format) return '잘못된 문자열: "'.concat(e.includes, '"을(를) 포함해야 합니다');
                            if ("regex" === e.format) return "잘못된 문자열: 정규식 ".concat(e.pattern, " 패턴과 일치해야 합니다");
                            return "잘못된 ".concat(null != (m = n[e.format]) ? m : e.format);
                        case "not_multiple_of":
                            return "잘못된 숫자: ".concat(e.divisor, "의 배수여야 합니다");
                        case "unrecognized_keys":
                            return "인식할 수 없는 키: ".concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "잘못된 키: ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "잘못된 입력";
                        case "invalid_element":
                            return "잘못된 값: ".concat(e.origin)
                    }
                }
            })()
        }
    }, "lt", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: {
                            one: "simbolis",
                            few: "simboliai",
                            many: "simbolių"
                        },
                        verb: {
                            smaller: {
                                inclusive: "turi būti ne ilgesnė kaip",
                                notInclusive: "turi būti trumpesnė kaip"
                            },
                            bigger: {
                                inclusive: "turi būti ne trumpesnė kaip",
                                notInclusive: "turi būti ilgesnė kaip"
                            }
                        }
                    },
                    file: {
                        unit: {
                            one: "baitas",
                            few: "baitai",
                            many: "baitų"
                        },
                        verb: {
                            smaller: {
                                inclusive: "turi būti ne didesnis kaip",
                                notInclusive: "turi būti mažesnis kaip"
                            },
                            bigger: {
                                inclusive: "turi būti ne mažesnis kaip",
                                notInclusive: "turi būti didesnis kaip"
                            }
                        }
                    },
                    array: {
                        unit: {
                            one: "elementą",
                            few: "elementus",
                            many: "elementų"
                        },
                        verb: {
                            smaller: {
                                inclusive: "turi turėti ne daugiau kaip",
                                notInclusive: "turi turėti mažiau kaip"
                            },
                            bigger: {
                                inclusive: "turi turėti ne mažiau kaip",
                                notInclusive: "turi turėti daugiau kaip"
                            }
                        }
                    },
                    set: {
                        unit: {
                            one: "elementą",
                            few: "elementus",
                            many: "elementų"
                        },
                        verb: {
                            smaller: {
                                inclusive: "turi turėti ne daugiau kaip",
                                notInclusive: "turi turėti mažiau kaip"
                            },
                            bigger: {
                                inclusive: "turi turėti ne mažiau kaip",
                                notInclusive: "turi turėti daugiau kaip"
                            }
                        }
                    }
                };

                function t(t, n, r, i) {
                    var a;
                    let o = null != (a = e[t]) ? a : null;
                    return null === o ? o : {
                        unit: o.unit[n],
                        verb: o.verb[i][r ? "inclusive" : "notInclusive"]
                    }
                }
                let n = {
                        regex: "įvestis",
                        email: "el. pašto adresas",
                        url: "URL",
                        emoji: "jaustukas",
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
                        datetime: "ISO data ir laikas",
                        date: "ISO data",
                        time: "ISO laikas",
                        duration: "ISO trukmė",
                        ipv4: "IPv4 adresas",
                        ipv6: "IPv6 adresas",
                        mac: "MAC adresas",
                        cidrv4: "IPv4 tinklo prefiksas (CIDR)",
                        cidrv6: "IPv6 tinklo prefiksas (CIDR)",
                        base64: "base64 užkoduota eilutė",
                        base64url: "base64url užkoduota eilutė",
                        json_string: "JSON eilutė",
                        e164: "E.164 numeris",
                        credit_card: "kredito kortelės numeris",
                        currency_code: "valiutos kodas",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "įvestis"
                    },
                    r = {
                        nan: "NaN",
                        number: "skaičius",
                        bigint: "sveikasis skaičius",
                        string: "eilutė",
                        boolean: "loginė reikšmė",
                        undefined: "neapibrėžta reikšmė",
                        function: "funkcija",
                        symbol: "simbolis",
                        array: "masyvas",
                        object: "objektas",
                        null: "nulinė reikšmė"
                    };
                return e => {
                    var i, a, o, c, u, l, s, d, m, f, v, p, g, h, _;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Gautas tipas ".concat(o, ", o tikėtasi - instanceof ").concat(e.expected);
                            return "Gautas tipas ".concat(o, ", o tikėtasi - ").concat(t)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Privalo būti ".concat(et(e.values[0]));
                            return "Privalo būti vienas iš ".concat(b(e.values, "|"), " pasirinkimų");
                        case "too_big": {
                            let n = null != (o = r[e.origin]) ? o : e.origin,
                                i = t(e.origin, tM(Number(e.maximum)), null != (c = e.inclusive) && c, "smaller");
                            if (null == i ? void 0 : i.verb) return "".concat(tB(null != (u = null != n ? n : e.origin) ? u : "reikšmė"), " ").concat(i.verb, " ").concat(e.maximum.toString(), " ").concat(null != (l = i.unit) ? l : "elementų");
                            let a = e.inclusive ? "ne didesnis kaip" : "mažesnis kaip";
                            return "".concat(tB(null != (s = null != n ? n : e.origin) ? s : "reikšmė"), " turi būti ").concat(a, " ").concat(e.maximum.toString(), " ").concat(null == i ? void 0 : i.unit)
                        }
                        case "too_small": {
                            let n = null != (d = r[e.origin]) ? d : e.origin,
                                i = t(e.origin, tM(Number(e.minimum)), null != (m = e.inclusive) && m, "bigger");
                            if (null == i ? void 0 : i.verb) return "".concat(tB(null != (f = null != n ? n : e.origin) ? f : "reikšmė"), " ").concat(i.verb, " ").concat(e.minimum.toString(), " ").concat(null != (v = i.unit) ? v : "elementų");
                            let a = e.inclusive ? "ne mažesnis kaip" : "didesnis kaip";
                            return "".concat(tB(null != (p = null != n ? n : e.origin) ? p : "reikšmė"), " turi būti ").concat(a, " ").concat(e.minimum.toString(), " ").concat(null == i ? void 0 : i.unit)
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Eilutė privalo prasidėti "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Eilutė privalo pasibaigti "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Eilutė privalo įtraukti "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Eilutė privalo atitikti ".concat(e.pattern);
                            return "Neteisingas ".concat(null != (g = n[e.format]) ? g : e.format);
                        case "not_multiple_of":
                            return "Skaičius privalo būti ".concat(e.divisor, " kartotinis.");
                        case "unrecognized_keys":
                            return "Neatpažint".concat(e.keys.length > 1 ? "i" : "as", " rakt").concat(e.keys.length > 1 ? "ai" : "as", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Rastas klaidingas raktas";
                        case "invalid_union":
                        default:
                            return "Klaidinga įvestis";
                        case "invalid_element": {
                            let t = null != (h = r[e.origin]) ? h : e.origin;
                            return "".concat(tB(null != (_ = null != t ? t : e.origin) ? _ : "reikšmė"), " turi klaidingą įvestį")
                        }
                    }
                }
            })()
        }
    }, "mk", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "знаци",
                        verb: "да имаат"
                    },
                    file: {
                        unit: "бајти",
                        verb: "да имаат"
                    },
                    array: {
                        unit: "ставки",
                        verb: "да имаат"
                    },
                    set: {
                        unit: "ставки",
                        verb: "да имаат"
                    },
                    map: {
                        unit: "ставки",
                        verb: "да имаат"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "внес",
                        email: "адреса на е-пошта",
                        url: "URL",
                        emoji: "емоџи",
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
                        datetime: "ISO датум и време",
                        date: "ISO датум",
                        time: "ISO време",
                        duration: "ISO времетраење",
                        ipv4: "IPv4 адреса",
                        ipv6: "IPv6 адреса",
                        mac: "MAC адреса",
                        cidrv4: "IPv4 опсег",
                        cidrv6: "IPv6 опсег",
                        base64: "base64-енкодирана низа",
                        base64url: "base64url-енкодирана низа",
                        json_string: "JSON низа",
                        e164: "E.164 број",
                        credit_card: "број на кредитна картичка",
                        currency_code: "код на валута",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "внес"
                    },
                    r = {
                        nan: "NaN",
                        number: "број",
                        array: "низа"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Грешен внес: се очекува instanceof ".concat(e.expected, ", примено ").concat(o);
                            return "Грешен внес: се очекува ".concat(t, ", примено ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Invalid input: expected ".concat(et(e.values[0]));
                            return "Грешана опција: се очекува една ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Премногу голем: се очекува ".concat(null != (o = e.origin) ? o : "вредноста", " да има ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "елементи");
                            return "Премногу голем: се очекува ".concat(null != (u = e.origin) ? u : "вредноста", " да биде ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Премногу мал: се очекува ".concat(e.origin, " да има ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Премногу мал: се очекува ".concat(e.origin, " да биде ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Неважечка низа: мора да започнува со "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Неважечка низа: мора да завршува со "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Неважечка низа: мора да вклучува "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Неважечка низа: мора да одгоара на патернот ".concat(e.pattern);
                            return "Invalid ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "Грешен број: мора да биде делив со ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "".concat(e.keys.length > 1 ? "Непрепознаени клучеви" : "Непрепознаен клуч", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Грешен клуч во ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Грешен внес";
                        case "invalid_element":
                            return "Грешна вредност во ".concat(e.origin)
                    }
                }
            })()
        }
    }, "ms", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "aksara",
                        verb: "mempunyai"
                    },
                    file: {
                        unit: "bait",
                        verb: "mempunyai"
                    },
                    array: {
                        unit: "elemen",
                        verb: "mempunyai"
                    },
                    set: {
                        unit: "elemen",
                        verb: "mempunyai"
                    },
                    map: {
                        unit: "elemen",
                        verb: "mempunyai"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "input",
                        email: "alamat e-mel",
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
                        datetime: "tarikh masa ISO",
                        date: "tarikh ISO",
                        time: "masa ISO",
                        duration: "tempoh ISO",
                        ipv4: "alamat IPv4",
                        ipv6: "alamat IPv6",
                        mac: "alamat MAC",
                        cidrv4: "julat IPv4",
                        cidrv6: "julat IPv6",
                        base64: "string dikodkan base64",
                        base64url: "string dikodkan base64url",
                        json_string: "string JSON",
                        e164: "nombor E.164",
                        credit_card: "nombor kad kredit",
                        currency_code: "kod mata wang",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    r = {
                        nan: "NaN",
                        number: "nombor"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Input tidak sah: dijangka instanceof ".concat(e.expected, ", diterima ").concat(o);
                            return "Input tidak sah: dijangka ".concat(t, ", diterima ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Input tidak sah: dijangka ".concat(et(e.values[0]));
                            return "Pilihan tidak sah: dijangka salah satu daripada ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Terlalu besar: dijangka ".concat(null != (o = e.origin) ? o : "nilai", " ").concat(r.verb, " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "elemen");
                            return "Terlalu besar: dijangka ".concat(null != (u = e.origin) ? u : "nilai", " adalah ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Terlalu kecil: dijangka ".concat(e.origin, " ").concat(r.verb, " ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Terlalu kecil: dijangka ".concat(e.origin, " adalah ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'String tidak sah: mesti bermula dengan "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'String tidak sah: mesti berakhir dengan "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'String tidak sah: mesti mengandungi "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "String tidak sah: mesti sepadan dengan corak ".concat(e.pattern);
                            return "".concat(null != (l = n[e.format]) ? l : e.format, " tidak sah");
                        case "not_multiple_of":
                            return "Nombor tidak sah: perlu gandaan ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Kunci tidak dikenali: ".concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Kunci tidak sah dalam ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Input tidak sah";
                        case "invalid_element":
                            return "Nilai tidak sah dalam ".concat(e.origin)
                    }
                }
            })()
        }
    }, "ne", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "अक्षर",
                        verb: "हुनुपर्छ"
                    },
                    file: {
                        unit: "बाइट",
                        verb: "हुनुपर्छ"
                    },
                    array: {
                        unit: "तत्व",
                        verb: "हुनुपर्छ"
                    },
                    set: {
                        unit: "तत्व",
                        verb: "हुनुपर्छ"
                    },
                    map: {
                        unit: "प्रविष्टि",
                        verb: "हुनुपर्छ"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "इनपुट",
                        email: "इमेल ठेगाना",
                        url: "URL",
                        emoji: "इमोजी",
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
                        datetime: "ISO मिति र समय",
                        date: "ISO मिति",
                        time: "ISO समय",
                        duration: "ISO अवधि",
                        ipv4: "IPv4 ठेगाना",
                        ipv6: "IPv6 ठेगाना",
                        mac: "MAC ठेगाना",
                        cidrv4: "IPv4 दायरा",
                        cidrv6: "IPv6 दायरा",
                        base64: "base64-इन्कोड गरिएको स्ट्रिङ",
                        base64url: "base64url-इन्कोड गरिएको स्ट्रिङ",
                        json_string: "JSON स्ट्रिङ",
                        e164: "E.164 नम्बर",
                        credit_card: "क्रेडिट कार्ड नम्बर",
                        currency_code: "मुद्रा कोड",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "इनपुट"
                    },
                    r = {
                        nan: "NaN"
                    };
                return e => {
                    var i, a, o, c, u;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            return "अमान्य इनपुट: अपेक्षित ".concat(t, ", प्राप्त ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "अमान्य इनपुट: अपेक्षित ".concat(et(e.values[0]));
                            return "अमान्य विकल्प: अपेक्षित मानहरू मध्ये एक ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "धेरै ठूलो: ".concat(null != (o = e.origin) ? o : "मान", " मा ").concat(n).concat(e.maximum.toString(), " ").concat(r.unit, " ").concat(r.verb);
                            return "धेरै ठूलो: ".concat(null != (c = e.origin) ? c : "मान", " ").concat(n).concat(e.maximum.toString(), " हुनुपर्छ")
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "धेरै सानो: ".concat(e.origin, " मा ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit, " ").concat(r.verb);
                            return "धेरै सानो: ".concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " हुनुपर्छ")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'अमान्य स्ट्रिङ: "'.concat(e.prefix, '" बाट सुरु हुनुपर्छ');
                            if ("ends_with" === e.format) return 'अमान्य स्ट्रिङ: "'.concat(e.suffix, '" मा समाप्त हुनुपर्छ');
                            if ("includes" === e.format) return 'अमान्य स्ट्रिङ: "'.concat(e.includes, '" समावेश हुनुपर्छ');
                            if ("regex" === e.format) return "अमान्य स्ट्रिङ: ढाँचा ".concat(e.pattern, " सँग मेल खानुपर्छ");
                            return "अमान्य ".concat(null != (u = n[e.format]) ? u : e.format);
                        case "not_multiple_of":
                            return "अमान्य संख्या: ".concat(e.divisor, " को गुणज हुनुपर्छ");
                        case "unrecognized_keys":
                            return "अपरिचित कुञ्जी".concat(e.keys.length > 1 ? "हरू" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "अमान्य कुञ्जी: ".concat(e.origin, " मा");
                        case "invalid_union":
                            if (e.options && Array.isArray(e.options) && e.options.length > 0) {
                                let t = e.options.map(e => "'".concat(e, "'")).join(" | ");
                                return "अमान्य डिस्क्रिमिनेटर मान: अपेक्षित ".concat(t)
                            }
                            return "अमान्य इनपुट";
                        case "invalid_element":
                            return "अमान्य मान: ".concat(e.origin, " मा");
                        default:
                            return "अमान्य इनपुट"
                    }
                }
            })()
        }
    }, "nl", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "tekens",
                        verb: "heeft"
                    },
                    file: {
                        unit: "bytes",
                        verb: "heeft"
                    },
                    array: {
                        unit: "elementen",
                        verb: "heeft"
                    },
                    set: {
                        unit: "elementen",
                        verb: "heeft"
                    },
                    map: {
                        unit: "elementen",
                        verb: "heeft"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "invoer",
                        email: "emailadres",
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
                        datetime: "ISO datum en tijd",
                        date: "ISO datum",
                        time: "ISO tijd",
                        duration: "ISO duur",
                        ipv4: "IPv4-adres",
                        ipv6: "IPv6-adres",
                        mac: "MAC-adres",
                        cidrv4: "IPv4-bereik",
                        cidrv6: "IPv6-bereik",
                        base64: "base64-gecodeerde tekst",
                        base64url: "base64 URL-gecodeerde tekst",
                        json_string: "JSON string",
                        e164: "E.164-nummer",
                        credit_card: "creditcardnummer",
                        currency_code: "valutacode",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "invoer"
                    },
                    r = {
                        nan: "NaN",
                        number: "getal"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Ongeldige invoer: verwacht instanceof ".concat(e.expected, ", ontving ").concat(o);
                            return "Ongeldige invoer: verwacht ".concat(t, ", ontving ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Ongeldige invoer: verwacht ".concat(et(e.values[0]));
                            return "Ongeldige optie: verwacht één van ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin),
                                i = "date" === e.origin ? "laat" : "string" === e.origin ? "lang" : "groot";
                            if (r) return "Te ".concat(i, ": verwacht dat ").concat(null != (o = e.origin) ? o : "waarde", " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "elementen", " ").concat(r.verb);
                            return "Te ".concat(i, ": verwacht dat ").concat(null != (u = e.origin) ? u : "waarde", " ").concat(n).concat(e.maximum.toString(), " is")
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin),
                                i = "date" === e.origin ? "vroeg" : "string" === e.origin ? "kort" : "klein";
                            if (r) return "Te ".concat(i, ": verwacht dat ").concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit, " ").concat(r.verb);
                            return "Te ".concat(i, ": verwacht dat ").concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " is")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Ongeldige tekst: moet met "'.concat(e.prefix, '" beginnen');
                            if ("ends_with" === e.format) return 'Ongeldige tekst: moet op "'.concat(e.suffix, '" eindigen');
                            if ("includes" === e.format) return 'Ongeldige tekst: moet "'.concat(e.includes, '" bevatten');
                            if ("regex" === e.format) return "Ongeldige tekst: moet overeenkomen met patroon ".concat(e.pattern);
                            return "Ongeldig: ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "Ongeldig getal: moet een veelvoud van ".concat(e.divisor, " zijn");
                        case "unrecognized_keys":
                            return "Onbekende key".concat(e.keys.length > 1 ? "s" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Ongeldige key in ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Ongeldige invoer";
                        case "invalid_element":
                            return "Ongeldige waarde in ".concat(e.origin)
                    }
                }
            })()
        }
    }, "nn", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "teikn",
                        verb: "å ha"
                    },
                    file: {
                        unit: "bytes",
                        verb: "å ha"
                    },
                    array: {
                        unit: "element",
                        verb: "å innehalde"
                    },
                    set: {
                        unit: "element",
                        verb: "å innehalde"
                    },
                    map: {
                        unit: "element",
                        verb: "å innehalde"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "input",
                        email: "e-postadresse",
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
                        datetime: "ISO dato- og klokkeslett",
                        date: "ISO-dato",
                        time: "ISO-klokkeslett",
                        duration: "ISO-varigheit",
                        ipv4: "IPv4-adresse",
                        ipv6: "IPv6-adresse",
                        mac: "MAC-adresse",
                        cidrv4: "IPv4-spekter",
                        cidrv6: "IPv6-spekter",
                        base64: "base64-enkoda streng",
                        base64url: "base64url-enkoda streng",
                        json_string: "JSON-streng",
                        e164: "E.164-nummer",
                        credit_card: "kredittkortnummer",
                        currency_code: "valutakode",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    r = {
                        nan: "NaN",
                        number: "tal",
                        array: "liste"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Ugyldig input: forventa instanceof ".concat(e.expected, ", fekk ").concat(o);
                            return "Ugyldig input: forventa ".concat(t, ", fekk ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Ugyldig verdi: forventa ".concat(et(e.values[0]));
                            return "Ugyldig val: forventa eitt av ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "For stor(t): forventa ".concat(null != (o = e.origin) ? o : "value", " til å ha ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "element");
                            return "For stor(t): forventa ".concat(null != (u = e.origin) ? u : "value", " til å ha ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "For lite(n): forventa ".concat(e.origin, " til å ha ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "For lite(n): forventa ".concat(e.origin, " til å ha ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Ugyldig streng: må starte med "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Ugyldig streng: må slutte med "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Ugyldig streng: må innehalde "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Ugyldig streng: må matche mønsteret ".concat(e.pattern);
                            return "Ugyldig ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "Ugyldig tal: må vere eit multiplum av ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "".concat(e.keys.length > 1 ? "Ukjende nøklar" : "Ukjend nøkkel", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Ugyldig nøkkel i ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Ugyldig input";
                        case "invalid_element":
                            return "Ugyldig verdi i ".concat(e.origin)
                    }
                }
            })()
        }
    }, "no", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "tegn",
                        verb: "å ha"
                    },
                    file: {
                        unit: "bytes",
                        verb: "å ha"
                    },
                    array: {
                        unit: "elementer",
                        verb: "å inneholde"
                    },
                    set: {
                        unit: "elementer",
                        verb: "å inneholde"
                    },
                    map: {
                        unit: "elementer",
                        verb: "å inneholde"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "input",
                        email: "e-postadresse",
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
                        datetime: "ISO dato- og klokkeslett",
                        date: "ISO-dato",
                        time: "ISO-klokkeslett",
                        duration: "ISO-varighet",
                        ipv4: "IPv4-adresse",
                        ipv6: "IPv6-adresse",
                        mac: "MAC-adresse",
                        cidrv4: "IPv4-spekter",
                        cidrv6: "IPv6-spekter",
                        base64: "base64-enkodet streng",
                        base64url: "base64url-enkodet streng",
                        json_string: "JSON-streng",
                        e164: "E.164-nummer",
                        credit_card: "kredittkortnummer",
                        currency_code: "valutakode",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    r = {
                        nan: "NaN",
                        number: "tall",
                        array: "liste"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Ugyldig input: forventet instanceof ".concat(e.expected, ", fikk ").concat(o);
                            return "Ugyldig input: forventet ".concat(t, ", fikk ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Ugyldig verdi: forventet ".concat(et(e.values[0]));
                            return "Ugyldig valg: forventet en av ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "For stor(t): forventet ".concat(null != (o = e.origin) ? o : "value", " til å ha ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "elementer");
                            return "For stor(t): forventet ".concat(null != (u = e.origin) ? u : "value", " til å ha ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "For lite(n): forventet ".concat(e.origin, " til å ha ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "For lite(n): forventet ".concat(e.origin, " til å ha ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Ugyldig streng: må starte med "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Ugyldig streng: må ende med "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Ugyldig streng: må inneholde "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Ugyldig streng: må matche mønsteret ".concat(e.pattern);
                            return "Ugyldig ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "Ugyldig tall: må være et multiplum av ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "".concat(e.keys.length > 1 ? "Ukjente nøkler" : "Ukjent nøkkel", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Ugyldig nøkkel i ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Ugyldig input";
                        case "invalid_element":
                            return "Ugyldig verdi i ".concat(e.origin)
                    }
                }
            })()
        }
    }, "ota", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "harf",
                        verb: "olmalıdır"
                    },
                    file: {
                        unit: "bayt",
                        verb: "olmalıdır"
                    },
                    array: {
                        unit: "unsur",
                        verb: "olmalıdır"
                    },
                    set: {
                        unit: "unsur",
                        verb: "olmalıdır"
                    },
                    map: {
                        unit: "unsur",
                        verb: "olmalıdır"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "giren",
                        email: "epostagâh",
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
                        datetime: "ISO hengâmı",
                        date: "ISO tarihi",
                        time: "ISO zamanı",
                        duration: "ISO müddeti",
                        ipv4: "IPv4 nişânı",
                        ipv6: "IPv6 nişânı",
                        mac: "MAC nişânı",
                        cidrv4: "IPv4 menzili",
                        cidrv6: "IPv6 menzili",
                        base64: "base64-şifreli metin",
                        base64url: "base64url-şifreli metin",
                        json_string: "JSON metin",
                        e164: "E.164 sayısı",
                        credit_card: "i'tibâr kartı numarası",
                        currency_code: "para birimi kodu",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "giren"
                    },
                    r = {
                        nan: "NaN",
                        number: "numara",
                        array: "saf",
                        null: "gayb"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Fâsit giren: umulan instanceof ".concat(e.expected, ", alınan ").concat(o);
                            return "Fâsit giren: umulan ".concat(t, ", alınan ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Fâsit giren: umulan ".concat(et(e.values[0]));
                            return "Fâsit tercih: mûteberler ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Fazla büyük: ".concat(null != (o = e.origin) ? o : "value", ", ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "elements", " sahip olmalıydı.");
                            return "Fazla büyük: ".concat(null != (u = e.origin) ? u : "value", ", ").concat(n).concat(e.maximum.toString(), " olmalıydı.")
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Fazla küçük: ".concat(e.origin, ", ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit, " sahip olmalıydı.");
                            return "Fazla küçük: ".concat(e.origin, ", ").concat(n).concat(e.minimum.toString(), " olmalıydı.")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Fâsit metin: "'.concat(e.prefix, '" ile başlamalı.');
                            if ("ends_with" === e.format) return 'Fâsit metin: "'.concat(e.suffix, '" ile bitmeli.');
                            if ("includes" === e.format) return 'Fâsit metin: "'.concat(e.includes, '" ihtivâ etmeli.');
                            if ("regex" === e.format) return "Fâsit metin: ".concat(e.pattern, " nakşına uymalı.");
                            return "Fâsit ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "Fâsit sayı: ".concat(e.divisor, " katı olmalıydı.");
                        case "unrecognized_keys":
                            return "Tanınmayan anahtar ".concat(e.keys.length > 1 ? "s" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "".concat(e.origin, " için tanınmayan anahtar var.");
                        case "invalid_union":
                            return "Giren tanınamadı.";
                        case "invalid_element":
                            return "".concat(e.origin, " için tanınmayan kıymet var.");
                        default:
                            return "Kıymet tanınamadı."
                    }
                }
            })()
        }
    }, "pl", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "znaków",
                        verb: "mieć"
                    },
                    file: {
                        unit: "bajtów",
                        verb: "mieć"
                    },
                    array: {
                        unit: "elementów",
                        verb: "mieć"
                    },
                    set: {
                        unit: "elementów",
                        verb: "mieć"
                    },
                    map: {
                        unit: "elementów",
                        verb: "mieć"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "wyrażenie",
                        email: "adres email",
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
                        datetime: "data i godzina w formacie ISO",
                        date: "data w formacie ISO",
                        time: "godzina w formacie ISO",
                        duration: "czas trwania ISO",
                        ipv4: "adres IPv4",
                        ipv6: "adres IPv6",
                        mac: "adres MAC",
                        cidrv4: "zakres IPv4",
                        cidrv6: "zakres IPv6",
                        base64: "ciąg znaków zakodowany w formacie base64",
                        base64url: "ciąg znaków zakodowany w formacie base64url",
                        json_string: "ciąg znaków w formacie JSON",
                        e164: "liczba E.164",
                        credit_card: "numer karty kredytowej",
                        currency_code: "kod waluty",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "wejście"
                    },
                    r = {
                        nan: "NaN",
                        number: "liczba",
                        array: "tablica"
                    };
                return e => {
                    var i, a, o, c, u, l, s, d, m;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Nieprawidłowe dane wejściowe: oczekiwano instanceof ".concat(e.expected, ", otrzymano ").concat(o);
                            return "Nieprawidłowe dane wejściowe: oczekiwano ".concat(t, ", otrzymano ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Nieprawidłowe dane wejściowe: oczekiwano ".concat(et(e.values[0]));
                            return "Nieprawidłowa opcja: oczekiwano jednej z wartości ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Za duża wartość: oczekiwano, że ".concat(null != (c = e.origin) ? c : "wartość", " będzie mieć ").concat(n).concat(e.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "elementów");
                            return "Zbyt duż(y/a/e): oczekiwano, że ".concat(null != (o = e.origin) ? o : "wartość", " będzie wynosić ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Za mała wartość: oczekiwano, że ".concat(null != (s = e.origin) ? s : "wartość", " będzie mieć ").concat(n).concat(e.minimum.toString(), " ").concat(null != (d = r.unit) ? d : "elementów");
                            return "Zbyt mał(y/a/e): oczekiwano, że ".concat(null != (l = e.origin) ? l : "wartość", " będzie wynosić ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Nieprawidłowy ciąg znaków: musi zaczynać się od "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Nieprawidłowy ciąg znaków: musi kończyć się na "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Nieprawidłowy ciąg znaków: musi zawierać "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Nieprawidłowy ciąg znaków: musi odpowiadać wzorcowi ".concat(e.pattern);
                            return "Nieprawidłow(y/a/e) ".concat(null != (m = n[e.format]) ? m : e.format);
                        case "not_multiple_of":
                            return "Nieprawidłowa liczba: musi być wielokrotnością ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Nierozpoznane klucze".concat(e.keys.length > 1 ? "s" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Nieprawidłowy klucz w ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Nieprawidłowe dane wejściowe";
                        case "invalid_element":
                            return "Nieprawidłowa wartość w ".concat(e.origin)
                    }
                }
            })()
        }
    }, "ps", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "توکي",
                        verb: "ولري"
                    },
                    file: {
                        unit: "بایټس",
                        verb: "ولري"
                    },
                    array: {
                        unit: "توکي",
                        verb: "ولري"
                    },
                    set: {
                        unit: "توکي",
                        verb: "ولري"
                    },
                    map: {
                        unit: "توکي",
                        verb: "ولري"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "ورودي",
                        email: "بریښنالیک",
                        url: "یو آر ال",
                        emoji: "ایموجي",
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
                        datetime: "نیټه او وخت",
                        date: "نېټه",
                        time: "وخت",
                        duration: "موده",
                        ipv4: "د IPv4 پته",
                        ipv6: "د IPv6 پته",
                        mac: "د MAC پته",
                        cidrv4: "د IPv4 ساحه",
                        cidrv6: "د IPv6 ساحه",
                        base64: "base64-encoded متن",
                        base64url: "base64url-encoded متن",
                        json_string: "JSON متن",
                        e164: "د E.164 شمېره",
                        credit_card: "د کریډیټ کارت شمیره",
                        currency_code: "د اسعارو کوډ",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "ورودي"
                    },
                    r = {
                        nan: "NaN",
                        number: "عدد",
                        array: "ارې"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "ناسم ورودي: باید instanceof ".concat(e.expected, " وای, مګر ").concat(o, " ترلاسه شو");
                            return "ناسم ورودي: باید ".concat(t, " وای, مګر ").concat(o, " ترلاسه شو")
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "ناسم ورودي: باید ".concat(et(e.values[0]), " وای");
                            return "ناسم انتخاب: باید یو له ".concat(b(e.values, "|"), " څخه وای");
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "ډیر لوی: ".concat(null != (c = e.origin) ? c : "ارزښت", " باید ").concat(n).concat(e.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "عنصرونه", " ولري");
                            return "ډیر لوی: ".concat(null != (o = e.origin) ? o : "ارزښت", " باید ").concat(n).concat(e.maximum.toString(), " وي")
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "ډیر کوچنی: ".concat(e.origin, " باید ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit, " ولري");
                            return "ډیر کوچنی: ".concat(e.origin, " باید ").concat(n).concat(e.minimum.toString(), " وي")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'ناسم متن: باید د "'.concat(e.prefix, '" سره پیل شي');
                            if ("ends_with" === e.format) return 'ناسم متن: باید د "'.concat(e.suffix, '" سره پای ته ورسيږي');
                            if ("includes" === e.format) return 'ناسم متن: باید "'.concat(e.includes, '" ولري');
                            if ("regex" === e.format) return "ناسم متن: باید د ".concat(e.pattern, " سره مطابقت ولري");
                            return "".concat(null != (l = n[e.format]) ? l : e.format, " ناسم دی");
                        case "not_multiple_of":
                            return "ناسم عدد: باید د ".concat(e.divisor, " مضرب وي");
                        case "unrecognized_keys":
                            return "ناسم ".concat(e.keys.length > 1 ? "کلیډونه" : "کلیډ", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "ناسم کلیډ په ".concat(e.origin, " کې");
                        case "invalid_union":
                        default:
                            return "ناسمه ورودي";
                        case "invalid_element":
                            return "ناسم عنصر په ".concat(e.origin, " کې")
                    }
                }
            })()
        }
    }, "pt", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "caracteres"
                    },
                    file: {
                        unit: "bytes"
                    },
                    array: {
                        unit: "elementos"
                    },
                    set: {
                        unit: "elementos"
                    },
                    map: {
                        unit: "entradas"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "a entrada",
                        email: "o endereço de e-mail",
                        url: "o URL",
                        emoji: "o emoji",
                        uuid: "o UUID",
                        uuidv4: "o UUIDv4",
                        uuidv6: "o UUIDv6",
                        nanoid: "o nanoid",
                        guid: "o GUID",
                        cuid: "o cuid",
                        cuid2: "o cuid2",
                        ulid: "o ULID",
                        xid: "o XID",
                        ksuid: "o KSUID",
                        datetime: "a data e hora ISO",
                        date: "a data ISO",
                        time: "a hora ISO",
                        duration: "a duração ISO",
                        ipv4: "o endereço IPv4",
                        ipv6: "o endereço IPv6",
                        mac: "o endereço MAC",
                        cidrv4: "o intervalo de endereços IPv4",
                        cidrv6: "o intervalo de endereços IPv6",
                        base64: "o texto codificado em base64",
                        base64url: "o texto codificado em base64url",
                        json_string: "o texto JSON",
                        e164: "o número E.164",
                        credit_card: "o número de cartão de crédito",
                        currency_code: "o código de moeda",
                        iban: "o IBAN",
                        jwt: "o JWT",
                        template_literal: "a entrada"
                    },
                    r = {
                        definite: "o",
                        indefinite: "um"
                    },
                    i = {
                        definite: "a",
                        indefinite: "uma"
                    },
                    a = {
                        string: {
                            name: "texto",
                            articles: r
                        },
                        number: {
                            name: "número",
                            articles: r
                        },
                        int: {
                            name: "número inteiro",
                            articles: r
                        },
                        boolean: {
                            name: "valor booleano",
                            articles: r
                        },
                        bigint: {
                            name: "número bigint",
                            articles: r
                        },
                        symbol: {
                            name: "símbolo",
                            articles: r
                        },
                        undefined: {
                            name: 'valor "undefined"',
                            articles: r
                        },
                        null: {
                            name: 'valor "nulo"',
                            articles: r
                        },
                        never: {
                            name: 'valor "never"',
                            articles: r
                        },
                        void: {
                            name: 'valor "void"',
                            articles: r
                        },
                        date: {
                            name: "data",
                            articles: i
                        },
                        array: {
                            name: "vetor",
                            articles: r
                        },
                        object: {
                            name: "objeto",
                            articles: r
                        },
                        tuple: {
                            name: "tuplo",
                            articles: r
                        },
                        record: {
                            name: "registo",
                            articles: r
                        },
                        map: {
                            name: "mapa",
                            articles: r
                        },
                        set: {
                            name: "conjunto",
                            articles: r
                        },
                        file: {
                            name: "ficheiro",
                            articles: r
                        },
                        nonoptional: {
                            name: "valor não opcional",
                            articles: r
                        },
                        nan: {
                            name: 'valor "NaN"',
                            articles: r
                        },
                        function: {
                            name: "função",
                            articles: i
                        }
                    };

                function o(e, t) {
                    var n;
                    let i = null != (n = a[e]) ? n : {
                        name: 'valor "'.concat(e, '"'),
                        articles: r
                    };
                    return "".concat(i.articles[t], " ").concat(i.name)
                }
                return e => {
                    var r, i, a;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = o(e.expected, "indefinite"),
                                n = o(ex(e.input), "indefinite");
                            return "Entrada inválida: esperava ".concat(t, ", recebeu ").concat(n)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Entrada inválida: esperava ".concat(et(e.values[0]));
                            return "Opção inválida: esperava uma das seguintes opções: ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Demasiado grande: esperava que ".concat(o(e.origin, "definite"), " tivesse ").concat(n, " ").concat(e.maximum.toString(), " ").concat(null != (r = i.unit) ? r : "elementos");
                            return "Demasiado grande: esperava que ".concat(o(e.origin, "definite"), " fosse ").concat(n, " ").concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Demasiado pequeno: esperava que ".concat(o(e.origin, "definite"), " tivesse ").concat(n, " ").concat(e.minimum.toString(), " ").concat(null != (i = r.unit) ? i : "elementos");
                            return "Demasiado pequeno: esperava que ".concat(o(e.origin, "definite"), " fosse ").concat(n, " ").concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Texto inválido: deve começar por "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Texto inválido: deve terminar em "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Texto inválido: deve incluir "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Texto inválido: deve corresponder ao padrão ".concat(e.pattern);
                            return "Formato d".concat(null != (a = n[e.format]) ? a : e.format, " inválido");
                        case "not_multiple_of":
                            return "Número inválido: deve ser múltiplo de ".concat(e.divisor);
                        case "unrecognized_keys": {
                            let t = e.keys.length > 1 ? "s" : "";
                            return "Chave".concat(t, " inválida").concat(t, ": ").concat(b(e.keys, ", "))
                        }
                        case "invalid_key":
                        case "invalid_element":
                            return "Entrada inválida n".concat(o(e.origin, "definite"));
                        case "invalid_union":
                            if (e.options && Array.isArray(e.options) && e.options.length > 0) {
                                let t = e.options.map(e => "'".concat(e, "'")).join(" | ");
                                return "Valor de discriminação inválido. Esperava ".concat(t)
                            }
                            return "Entrada inválida";
                        default:
                            return "Entrada inválida"
                    }
                }
            })()
        }
    }, "ptBR", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "caracteres"
                    },
                    file: {
                        unit: "bytes"
                    },
                    array: {
                        unit: "elementos"
                    },
                    set: {
                        unit: "elementos"
                    },
                    map: {
                        unit: "entradas"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "a entrada",
                        email: "o endereço de e-mail",
                        url: "o URL",
                        emoji: "o emoji",
                        uuid: "o UUID",
                        uuidv4: "o UUIDv4",
                        uuidv6: "o UUIDv6",
                        nanoid: "o nanoid",
                        guid: "o GUID",
                        cuid: "o cuid",
                        cuid2: "o cuid2",
                        ulid: "o ULID",
                        xid: "o XID",
                        ksuid: "o KSUID",
                        datetime: "a data e hora ISO",
                        date: "a data ISO",
                        time: "a hora ISO",
                        duration: "a duração ISO",
                        ipv4: "o endereço IPv4",
                        ipv6: "o endereço IPv6",
                        mac: "o endereço MAC",
                        cidrv4: "a faixa de endereços IPv4",
                        cidrv6: "a faixa de endereços IPv6",
                        base64: "o texto codificado em base64",
                        base64url: "o texto codificado em base64url",
                        json_string: "o texto JSON",
                        e164: "o número E.164",
                        credit_card: "o número de cartão de crédito",
                        currency_code: "o código de moeda",
                        iban: "o IBAN",
                        jwt: "o JWT",
                        template_literal: "a entrada"
                    },
                    r = {
                        definite: "o",
                        indefinite: "um"
                    },
                    i = {
                        definite: "a",
                        indefinite: "uma"
                    },
                    a = {
                        string: {
                            name: "texto",
                            articles: r
                        },
                        number: {
                            name: "número",
                            articles: r
                        },
                        int: {
                            name: "número inteiro",
                            articles: r
                        },
                        boolean: {
                            name: "valor booleano",
                            articles: r
                        },
                        bigint: {
                            name: "número bigint",
                            articles: r
                        },
                        symbol: {
                            name: "símbolo",
                            articles: r
                        },
                        undefined: {
                            name: 'valor "undefined"',
                            articles: r
                        },
                        null: {
                            name: 'valor "nulo"',
                            articles: r
                        },
                        never: {
                            name: 'valor "never"',
                            articles: r
                        },
                        void: {
                            name: 'valor "void"',
                            articles: r
                        },
                        date: {
                            name: "data",
                            articles: i
                        },
                        array: {
                            name: "vetor",
                            articles: r
                        },
                        object: {
                            name: "objeto",
                            articles: r
                        },
                        tuple: {
                            name: "tupla",
                            articles: i
                        },
                        record: {
                            name: "registro",
                            articles: r
                        },
                        map: {
                            name: "mapa",
                            articles: r
                        },
                        set: {
                            name: "conjunto",
                            articles: r
                        },
                        file: {
                            name: "arquivo",
                            articles: r
                        },
                        nonoptional: {
                            name: "valor não opcional",
                            articles: r
                        },
                        nan: {
                            name: 'valor "NaN"',
                            articles: r
                        },
                        function: {
                            name: "função",
                            articles: i
                        }
                    };

                function o(e, t) {
                    var n;
                    let i = null != (n = a[e]) ? n : {
                        name: 'valor "'.concat(e, '"'),
                        articles: r
                    };
                    return "".concat(i.articles[t], " ").concat(i.name)
                }
                return e => {
                    var r, i, a;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = o(e.expected, "indefinite"),
                                n = o(ex(e.input), "indefinite");
                            return "Entrada inválida: esperava ".concat(t, ", recebeu ").concat(n)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Entrada inválida: esperava ".concat(et(e.values[0]));
                            return "Opção inválida: esperava uma das seguintes opções: ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Grande demais: esperava que ".concat(o(e.origin, "definite"), " tivesse ").concat(n, " ").concat(e.maximum.toString(), " ").concat(null != (r = i.unit) ? r : "elementos");
                            return "Grande demais: esperava que ".concat(o(e.origin, "definite"), " fosse ").concat(n, " ").concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Pequeno demais: esperava que ".concat(o(e.origin, "definite"), " tivesse ").concat(n, " ").concat(e.minimum.toString(), " ").concat(null != (i = r.unit) ? i : "elementos");
                            return "Pequeno demais: esperava que ".concat(o(e.origin, "definite"), " fosse ").concat(n, " ").concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Texto inválido: deve começar com "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Texto inválido: deve terminar com "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Texto inválido: deve incluir "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Texto inválido: deve corresponder ao padrão ".concat(e.pattern);
                            return "Formato d".concat(null != (a = n[e.format]) ? a : e.format, " inválido");
                        case "not_multiple_of":
                            return "Número inválido: deve ser múltiplo de ".concat(e.divisor);
                        case "unrecognized_keys": {
                            let t = e.keys.length > 1 ? "s" : "";
                            return "Chave".concat(t, " inválida").concat(t, ": ").concat(b(e.keys, ", "))
                        }
                        case "invalid_key":
                        case "invalid_element":
                            return "Entrada inválida n".concat(o(e.origin, "definite"));
                        case "invalid_union":
                            if (e.options && Array.isArray(e.options) && e.options.length > 0) {
                                let t = e.options.map(e => "'".concat(e, "'")).join(" | ");
                                return "Valor de discriminação inválido. Esperava ".concat(t)
                            }
                            return "Entrada inválida";
                        default:
                            return "Entrada inválida"
                    }
                }
            })()
        }
    }, "ro", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "caractere",
                        verb: "să aibă"
                    },
                    file: {
                        unit: "octeți",
                        verb: "să aibă"
                    },
                    array: {
                        unit: "elemente",
                        verb: "să aibă"
                    },
                    set: {
                        unit: "elemente",
                        verb: "să aibă"
                    },
                    map: {
                        unit: "intrări",
                        verb: "să aibă"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "intrare",
                        email: "adresă de email",
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
                        datetime: "dată și oră ISO",
                        date: "dată ISO",
                        time: "oră ISO",
                        duration: "durată ISO",
                        ipv4: "adresă IPv4",
                        ipv6: "adresă IPv6",
                        mac: "adresă MAC",
                        cidrv4: "interval IPv4",
                        cidrv6: "interval IPv6",
                        base64: "șir codat base64",
                        base64url: "șir codat base64url",
                        json_string: "șir JSON",
                        e164: "număr E.164",
                        credit_card: "număr de card de credit",
                        currency_code: "cod valutar",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "intrare"
                    },
                    r = {
                        nan: "NaN",
                        string: "șir",
                        number: "număr",
                        boolean: "boolean",
                        function: "funcție",
                        array: "matrice",
                        object: "obiect",
                        undefined: "nedefinit",
                        symbol: "simbol",
                        bigint: "număr mare",
                        void: "void",
                        never: "never",
                        map: "hartă",
                        set: "set"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            return "Intrare invalidă: așteptat ".concat(t, ", primit ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Intrare invalidă: așteptat ".concat(et(e.values[0]));
                            return "Opțiune invalidă: așteptat una dintre ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Prea mare: așteptat ca ".concat(null != (o = e.origin) ? o : "valoarea", " ").concat(r.verb, " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "elemente");
                            return "Prea mare: așteptat ca ".concat(null != (u = e.origin) ? u : "valoarea", " să fie ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Prea mic: așteptat ca ".concat(e.origin, " ").concat(r.verb, " ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Prea mic: așteptat ca ".concat(e.origin, " să fie ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Șir invalid: trebuie să înceapă cu "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Șir invalid: trebuie să se termine cu "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Șir invalid: trebuie să includă "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Șir invalid: trebuie să se potrivească cu modelul ".concat(e.pattern);
                            return "Format invalid: ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "Număr invalid: trebuie să fie multiplu de ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Chei nerecunoscute: ".concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Cheie invalidă în ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Intrare invalidă";
                        case "invalid_element":
                            return "Valoare invalidă în ".concat(e.origin)
                    }
                }
            })()
        }
    }, "ru", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: {
                            one: "символ",
                            few: "символа",
                            many: "символов"
                        },
                        verb: "иметь"
                    },
                    file: {
                        unit: {
                            one: "байт",
                            few: "байта",
                            many: "байт"
                        },
                        verb: "иметь"
                    },
                    array: {
                        unit: {
                            one: "элемент",
                            few: "элемента",
                            many: "элементов"
                        },
                        verb: "иметь"
                    },
                    set: {
                        unit: {
                            one: "элемент",
                            few: "элемента",
                            many: "элементов"
                        },
                        verb: "иметь"
                    },
                    map: {
                        unit: {
                            one: "элемент",
                            few: "элемента",
                            many: "элементов"
                        },
                        verb: "иметь"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "ввод",
                        email: "email адрес",
                        url: "URL",
                        emoji: "эмодзи",
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
                        datetime: "ISO дата и время",
                        date: "ISO дата",
                        time: "ISO время",
                        duration: "ISO длительность",
                        ipv4: "IPv4 адрес",
                        ipv6: "IPv6 адрес",
                        mac: "MAC адрес",
                        cidrv4: "IPv4 диапазон",
                        cidrv6: "IPv6 диапазон",
                        base64: "строка в формате base64",
                        base64url: "строка в формате base64url",
                        json_string: "JSON строка",
                        e164: "номер E.164",
                        credit_card: "номер кредитной карты",
                        currency_code: "код валюты",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "ввод"
                    },
                    r = {
                        nan: "NaN",
                        number: "число",
                        array: "массив"
                    };
                return e => {
                    var i, a, o, c, u;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Неверный ввод: ожидалось instanceof ".concat(e.expected, ", получено ").concat(o);
                            return "Неверный ввод: ожидалось ".concat(t, ", получено ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Неверный ввод: ожидалось ".concat(et(e.values[0]));
                            return "Неверный вариант: ожидалось одно из ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) {
                                let t = tF(Number(e.maximum), r.unit.one, r.unit.few, r.unit.many);
                                return "Слишком большое значение: ожидалось, что ".concat(null != (c = e.origin) ? c : "значение", " будет иметь ").concat(n).concat(e.maximum.toString(), " ").concat(t)
                            }
                            return "Слишком большое значение: ожидалось, что ".concat(null != (o = e.origin) ? o : "значение", " будет ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) {
                                let t = tF(Number(e.minimum), r.unit.one, r.unit.few, r.unit.many);
                                return "Слишком маленькое значение: ожидалось, что ".concat(e.origin, " будет иметь ").concat(n).concat(e.minimum.toString(), " ").concat(t)
                            }
                            return "Слишком маленькое значение: ожидалось, что ".concat(e.origin, " будет ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Неверная строка: должна начинаться с "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Неверная строка: должна заканчиваться на "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Неверная строка: должна содержать "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Неверная строка: должна соответствовать шаблону ".concat(e.pattern);
                            return "Неверный ".concat(null != (u = n[e.format]) ? u : e.format);
                        case "not_multiple_of":
                            return "Неверное число: должно быть кратным ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Нераспознанн".concat(e.keys.length > 1 ? "ые" : "ый", " ключ").concat(e.keys.length > 1 ? "и" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Неверный ключ в ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Неверные входные данные";
                        case "invalid_element":
                            return "Неверное значение в ".concat(e.origin)
                    }
                }
            })()
        }
    }, "sk", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "znakov",
                        verb: "mať"
                    },
                    file: {
                        unit: "bajtov",
                        verb: "mať"
                    },
                    array: {
                        unit: "prvkov",
                        verb: "mať"
                    },
                    set: {
                        unit: "prvkov",
                        verb: "mať"
                    },
                    map: {
                        unit: "položiek",
                        verb: "mať"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "regulárny výraz",
                        email: "e-mailová adresa",
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
                        datetime: "dátum a čas vo formáte ISO",
                        date: "dátum vo formáte ISO",
                        time: "čas vo formáte ISO",
                        duration: "doba trvania ISO",
                        ipv4: "IPv4 adresa",
                        ipv6: "IPv6 adresa",
                        mac: "MAC adresa",
                        cidrv4: "rozsah IPv4",
                        cidrv6: "rozsah IPv6",
                        base64: "reťazec zakódovaný vo formáte base64",
                        base64url: "reťazec zakódovaný vo formáte base64url",
                        json_string: "reťazec vo formáte JSON",
                        e164: "číslo E.164",
                        credit_card: "číslo kreditnej karty",
                        currency_code: "kód meny",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "vstup"
                    },
                    r = {
                        nan: "NaN",
                        number: "číslo",
                        string: "reťazec",
                        function: "funkcia",
                        array: "pole"
                    };
                return e => {
                    var i, a, o, c, u, l, s, d, m;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Neplatný vstup: očakávané instanceof ".concat(e.expected, ", obdržané ").concat(o);
                            return "Neplatný vstup: očakávané ".concat(t, ", obdržané ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Neplatný vstup: očakávané ".concat(et(e.values[0]));
                            return "Neplatný vstup: očakávaná jedna z hodnôt ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Hodnota je príliš veľká: ".concat(null != (c = e.origin) ? c : "hodnota", " musí mať ").concat(n).concat(e.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "prvkov");
                            return "Hodnota je príliš veľká: ".concat(null != (o = e.origin) ? o : "hodnota", " musí byť ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Hodnota je príliš malá: ".concat(null != (s = e.origin) ? s : "hodnota", " musí mať ").concat(n).concat(e.minimum.toString(), " ").concat(null != (d = r.unit) ? d : "prvkov");
                            return "Hodnota je príliš malá: ".concat(null != (l = e.origin) ? l : "hodnota", " musí byť ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Neplatný reťazec: musí začínať na "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Neplatný reťazec: musí končiť na "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Neplatný reťazec: musí obsahovať "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Neplatný reťazec: musí zodpovedať vzoru ".concat(e.pattern);
                            return "Neplatný formát ".concat(null != (m = n[e.format]) ? m : e.format);
                        case "not_multiple_of":
                            return "Neplatné číslo: musí byť násobkom ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Neznáme klúče: ".concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Neplatný klúč v ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Neplatný vstup";
                        case "invalid_element":
                            return "Neplatná hodnota v ".concat(e.origin)
                    }
                }
            })()
        }
    }, "sl", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "znakov",
                        verb: "imeti"
                    },
                    file: {
                        unit: "bajtov",
                        verb: "imeti"
                    },
                    array: {
                        unit: "elementov",
                        verb: "imeti"
                    },
                    set: {
                        unit: "elementov",
                        verb: "imeti"
                    },
                    map: {
                        unit: "elementov",
                        verb: "imeti"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "vnos",
                        email: "e-poštni naslov",
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
                        datetime: "ISO datum in čas",
                        date: "ISO datum",
                        time: "ISO čas",
                        duration: "ISO trajanje",
                        ipv4: "IPv4 naslov",
                        ipv6: "IPv6 naslov",
                        mac: "MAC naslov",
                        cidrv4: "obseg IPv4",
                        cidrv6: "obseg IPv6",
                        base64: "base64 kodiran niz",
                        base64url: "base64url kodiran niz",
                        json_string: "JSON niz",
                        e164: "E.164 številka",
                        credit_card: "številka kreditne kartice",
                        currency_code: "koda valute",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "vnos"
                    },
                    r = {
                        nan: "NaN",
                        number: "število",
                        array: "tabela"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Neveljaven vnos: pričakovano instanceof ".concat(e.expected, ", prejeto ").concat(o);
                            return "Neveljaven vnos: pričakovano ".concat(t, ", prejeto ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Neveljaven vnos: pričakovano ".concat(et(e.values[0]));
                            return "Neveljavna možnost: pričakovano eno izmed ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Preveliko: pričakovano, da bo ".concat(null != (o = e.origin) ? o : "vrednost", " imelo ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "elementov");
                            return "Preveliko: pričakovano, da bo ".concat(null != (u = e.origin) ? u : "vrednost", " ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Premajhno: pričakovano, da bo ".concat(e.origin, " imelo ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Premajhno: pričakovano, da bo ".concat(e.origin, " ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Neveljaven niz: mora se začeti z "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Neveljaven niz: mora se končati z "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Neveljaven niz: mora vsebovati "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Neveljaven niz: mora ustrezati vzorcu ".concat(e.pattern);
                            return "Neveljaven ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "Neveljavno število: mora biti večkratnik ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Neprepoznan".concat(e.keys.length > 1 ? "i ključi" : " ključ", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Neveljaven ključ v ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Neveljaven vnos";
                        case "invalid_element":
                            return "Neveljavna vrednost v ".concat(e.origin)
                    }
                }
            })()
        }
    }, "sv", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "tecken",
                        verb: "att ha"
                    },
                    file: {
                        unit: "bytes",
                        verb: "att ha"
                    },
                    array: {
                        unit: "objekt",
                        verb: "att innehålla"
                    },
                    set: {
                        unit: "objekt",
                        verb: "att innehålla"
                    },
                    map: {
                        unit: "objekt",
                        verb: "att innehålla"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "reguljärt uttryck",
                        email: "e-postadress",
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
                        datetime: "ISO-datum och tid",
                        date: "ISO-datum",
                        time: "ISO-tid",
                        duration: "ISO-varaktighet",
                        ipv4: "IPv4-adress",
                        ipv6: "IPv6-adress",
                        mac: "MAC-adress",
                        cidrv4: "IPv4-spektrum",
                        cidrv6: "IPv6-spektrum",
                        base64: "base64-kodad sträng",
                        base64url: "base64url-kodad sträng",
                        json_string: "JSON-sträng",
                        e164: "E.164-nummer",
                        credit_card: "kreditkortsnummer",
                        currency_code: "valutakod",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "mall-literal"
                    },
                    r = {
                        nan: "NaN",
                        number: "antal",
                        array: "lista"
                    };
                return e => {
                    var i, a, o, c, u, l, s, d, m, f;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Ogiltig inmatning: förväntat instanceof ".concat(e.expected, ", fick ").concat(o);
                            return "Ogiltig inmatning: förväntat ".concat(t, ", fick ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Ogiltig inmatning: förväntat ".concat(et(e.values[0]));
                            return "Ogiltigt val: förväntade en av ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "För stor(t): förväntade ".concat(null != (c = e.origin) ? c : "värdet", " att ha ").concat(n).concat(e.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "element");
                            return "För stor(t): förväntat ".concat(null != (o = e.origin) ? o : "värdet", " att ha ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "För lite(t): förväntade ".concat(null != (s = e.origin) ? s : "värdet", " att ha ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "För lite(t): förväntade ".concat(null != (l = e.origin) ? l : "värdet", " att ha ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Ogiltig sträng: måste börja med "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Ogiltig sträng: måste sluta med "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Ogiltig sträng: måste innehålla "'.concat(e.includes, '"');
                            if ("regex" === e.format) return 'Ogiltig sträng: måste matcha mönstret "'.concat(e.pattern, '"');
                            return "Ogiltig(t) ".concat(null != (d = n[e.format]) ? d : e.format);
                        case "not_multiple_of":
                            return "Ogiltigt tal: måste vara en multipel av ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "".concat(e.keys.length > 1 ? "Okända nycklar" : "Okänd nyckel", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Ogiltig nyckel i ".concat(null != (m = e.origin) ? m : "värdet");
                        case "invalid_union":
                        default:
                            return "Ogiltig input";
                        case "invalid_element":
                            return "Ogiltigt värde i ".concat(null != (f = e.origin) ? f : "värdet")
                    }
                }
            })()
        }
    }, "ta", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "எழுத்துக்கள்",
                        verb: "கொண்டிருக்க வேண்டும்"
                    },
                    file: {
                        unit: "பைட்டுகள்",
                        verb: "கொண்டிருக்க வேண்டும்"
                    },
                    array: {
                        unit: "உறுப்புகள்",
                        verb: "கொண்டிருக்க வேண்டும்"
                    },
                    set: {
                        unit: "உறுப்புகள்",
                        verb: "கொண்டிருக்க வேண்டும்"
                    },
                    map: {
                        unit: "உறுப்புகள்",
                        verb: "கொண்டிருக்க வேண்டும்"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "உள்ளீடு",
                        email: "மின்னஞ்சல் முகவரி",
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
                        datetime: "ISO தேதி நேரம்",
                        date: "ISO தேதி",
                        time: "ISO நேரம்",
                        duration: "ISO கால அளவு",
                        ipv4: "IPv4 முகவரி",
                        ipv6: "IPv6 முகவரி",
                        mac: "MAC முகவரி",
                        cidrv4: "IPv4 வரம்பு",
                        cidrv6: "IPv6 வரம்பு",
                        base64: "base64-encoded சரம்",
                        base64url: "base64url-encoded சரம்",
                        json_string: "JSON சரம்",
                        e164: "E.164 எண்",
                        credit_card: "கடன் அட்டை எண்",
                        currency_code: "நாணயக் குறியீடு",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    r = {
                        nan: "NaN",
                        number: "எண்",
                        array: "அணி",
                        null: "வெறுமை"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "தவறான உள்ளீடு: எதிர்பார்க்கப்பட்டது instanceof ".concat(e.expected, ", பெறப்பட்டது ").concat(o);
                            return "தவறான உள்ளீடு: எதிர்பார்க்கப்பட்டது ".concat(t, ", பெறப்பட்டது ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "தவறான உள்ளீடு: எதிர்பார்க்கப்பட்டது ".concat(et(e.values[0]));
                            return "தவறான விருப்பம்: எதிர்பார்க்கப்பட்டது ".concat(b(e.values, "|"), " இல் ஒன்று");
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "மிக பெரியது: எதிர்பார்க்கப்பட்டது ".concat(null != (c = e.origin) ? c : "மதிப்பு", " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "உறுப்புகள்", " ஆக இருக்க வேண்டும்");
                            return "மிக பெரியது: எதிர்பார்க்கப்பட்டது ".concat(null != (o = e.origin) ? o : "மதிப்பு", " ").concat(n).concat(e.maximum.toString(), " ஆக இருக்க வேண்டும்")
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "மிகச் சிறியது: எதிர்பார்க்கப்பட்டது ".concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit, " ஆக இருக்க வேண்டும்");
                            return "மிகச் சிறியது: எதிர்பார்க்கப்பட்டது ".concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " ஆக இருக்க வேண்டும்")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'தவறான சரம்: "'.concat(e.prefix, '" இல் தொடங்க வேண்டும்');
                            if ("ends_with" === e.format) return 'தவறான சரம்: "'.concat(e.suffix, '" இல் முடிவடைய வேண்டும்');
                            if ("includes" === e.format) return 'தவறான சரம்: "'.concat(e.includes, '" ஐ உள்ளடக்க வேண்டும்');
                            if ("regex" === e.format) return "தவறான சரம்: ".concat(e.pattern, " முறைபாட்டுடன் பொருந்த வேண்டும்");
                            return "தவறான ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "தவறான எண்: ".concat(e.divisor, " இன் பலமாக இருக்க வேண்டும்");
                        case "unrecognized_keys":
                            return "அடையாளம் தெரியாத விசை".concat(e.keys.length > 1 ? "கள்" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "".concat(e.origin, " இல் தவறான விசை");
                        case "invalid_union":
                        default:
                            return "தவறான உள்ளீடு";
                        case "invalid_element":
                            return "".concat(e.origin, " இல் தவறான மதிப்பு")
                    }
                }
            })()
        }
    }, "tg", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "аломат",
                        verb: "дошта бошад"
                    },
                    file: {
                        unit: "байт",
                        verb: "дошта бошад"
                    },
                    array: {
                        unit: "унсур",
                        verb: "дошта бошад"
                    },
                    set: {
                        unit: "унсур",
                        verb: "дошта бошад"
                    },
                    map: {
                        unit: "сабт",
                        verb: "дошта бошад"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "вуруд",
                        email: "суроғаи email",
                        url: "URL",
                        emoji: "эмоҷи",
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
                        datetime: "санаву вақти ISO",
                        date: "санаи ISO",
                        time: "вақти ISO",
                        duration: "давомнокии ISO",
                        ipv4: "суроғаи IPv4",
                        ipv6: "суроғаи IPv6",
                        mac: "суроғаи MAC",
                        cidrv4: "маҳдудаи IPv4",
                        cidrv6: "маҳдудаи IPv6",
                        base64: "сатри дар формати base64",
                        base64url: "сатри дар формати base64url",
                        json_string: "сатри JSON",
                        e164: "рақами E.164",
                        credit_card: "рақами корти кредитӣ",
                        currency_code: "рамзи асъор",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "вуруд"
                    },
                    r = {
                        nan: "NaN",
                        number: "рақам",
                        string: "сатр",
                        array: "массив",
                        object: "объект",
                        date: "сана"
                    };
                return e => {
                    var i, a, o, c, u;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            return "Вуруди нодуруст: ".concat(t, " интизор мерафт, ").concat(o, " гирифта шуд")
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Вуруди нодуруст: ".concat(et(e.values[0]), " интизор мерафт");
                            return "Интихоби нодуруст: яке аз ".concat(b(e.values, "|"), " интизор мерафт");
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Хеле калон: ".concat(null != (o = e.origin) ? o : "қимат", " бояд ").concat(n).concat(e.maximum.toString(), " ").concat(r.unit, " ").concat(r.verb);
                            return "Хеле калон: ".concat(null != (c = e.origin) ? c : "қимат", " бояд ").concat(n).concat(e.maximum.toString(), " бошад")
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Хеле хурд: ".concat(e.origin, " бояд ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit, " ").concat(r.verb);
                            return "Хеле хурд: ".concat(e.origin, " бояд ").concat(n).concat(e.minimum.toString(), " бошад")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Сатри нодуруст: бояд бо "'.concat(e.prefix, '" оғоз шавад');
                            if ("ends_with" === e.format) return 'Сатри нодуруст: бояд бо "'.concat(e.suffix, '" анҷом ёбад');
                            if ("includes" === e.format) return 'Сатри нодуруст: бояд "'.concat(e.includes, '"-ро дар бар гирад');
                            if ("regex" === e.format) return "Сатри нодуруст: бояд ба намунаи ".concat(e.pattern, " мувофиқат кунад");
                            return "".concat(null != (u = n[e.format]) ? u : e.format, "-и нодуруст");
                        case "not_multiple_of":
                            return "Рақами нодуруст: бояд ба ".concat(e.divisor, " бе бақия тақсим шавад");
                        case "unrecognized_keys":
                            return "Калид".concat(e.keys.length > 1 ? "ҳои" : "и", " номаълум: ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Калиди нодуруст дар ".concat(e.origin);
                        case "invalid_union":
                            if (e.options && Array.isArray(e.options) && e.options.length > 0) {
                                let t = e.options.map(e => "'".concat(e, "'")).join(" | ");
                                return "Қимати нодурусти дискриминатор: ".concat(t, " интизор мерафт")
                            }
                            return "Вуруди нодуруст";
                        case "invalid_element":
                            return "Қимати нодуруст дар ".concat(e.origin);
                        default:
                            return "Вуруди нодуруст"
                    }
                }
            })()
        }
    }, "th", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "ตัวอักษร",
                        verb: "ควรมี"
                    },
                    file: {
                        unit: "ไบต์",
                        verb: "ควรมี"
                    },
                    array: {
                        unit: "รายการ",
                        verb: "ควรมี"
                    },
                    set: {
                        unit: "รายการ",
                        verb: "ควรมี"
                    },
                    map: {
                        unit: "รายการ",
                        verb: "ควรมี"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "ข้อมูลที่ป้อน",
                        email: "ที่อยู่อีเมล",
                        url: "URL",
                        emoji: "อิโมจิ",
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
                        datetime: "วันที่เวลาแบบ ISO",
                        date: "วันที่แบบ ISO",
                        time: "เวลาแบบ ISO",
                        duration: "ช่วงเวลาแบบ ISO",
                        ipv4: "ที่อยู่ IPv4",
                        ipv6: "ที่อยู่ IPv6",
                        mac: "ที่อยู่ MAC",
                        cidrv4: "ช่วง IP แบบ IPv4",
                        cidrv6: "ช่วง IP แบบ IPv6",
                        base64: "ข้อความแบบ Base64",
                        base64url: "ข้อความแบบ Base64 สำหรับ URL",
                        json_string: "ข้อความแบบ JSON",
                        e164: "เบอร์โทรศัพท์ระหว่างประเทศ (E.164)",
                        credit_card: "หมายเลขบัตรเครดิต",
                        currency_code: "รหัสสกุลเงิน",
                        iban: "IBAN",
                        jwt: "โทเคน JWT",
                        template_literal: "ข้อมูลที่ป้อน"
                    },
                    r = {
                        nan: "NaN",
                        number: "ตัวเลข",
                        array: "อาร์เรย์ (Array)",
                        null: "ไม่มีค่า (null)"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "ประเภทข้อมูลไม่ถูกต้อง: ควรเป็น instanceof ".concat(e.expected, " แต่ได้รับ ").concat(o);
                            return "ประเภทข้อมูลไม่ถูกต้อง: ควรเป็น ".concat(t, " แต่ได้รับ ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "ค่าไม่ถูกต้อง: ควรเป็น ".concat(et(e.values[0]));
                            return "ตัวเลือกไม่ถูกต้อง: ควรเป็นหนึ่งใน ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "ไม่เกิน" : "น้อยกว่า",
                                r = t(e.origin);
                            if (r) return "เกินกำหนด: ".concat(null != (o = e.origin) ? o : "ค่า", " ควรมี").concat(n, " ").concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "รายการ");
                            return "เกินกำหนด: ".concat(null != (u = e.origin) ? u : "ค่า", " ควรมี").concat(n, " ").concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? "อย่างน้อย" : "มากกว่า",
                                r = t(e.origin);
                            if (r) return "น้อยกว่ากำหนด: ".concat(e.origin, " ควรมี").concat(n, " ").concat(e.minimum.toString(), " ").concat(r.unit);
                            return "น้อยกว่ากำหนด: ".concat(e.origin, " ควรมี").concat(n, " ").concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'รูปแบบไม่ถูกต้อง: ข้อความต้องขึ้นต้นด้วย "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'รูปแบบไม่ถูกต้อง: ข้อความต้องลงท้ายด้วย "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'รูปแบบไม่ถูกต้อง: ข้อความต้องมี "'.concat(e.includes, '" อยู่ในข้อความ');
                            if ("regex" === e.format) return "รูปแบบไม่ถูกต้อง: ต้องตรงกับรูปแบบที่กำหนด ".concat(e.pattern);
                            return "รูปแบบไม่ถูกต้อง: ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "ตัวเลขไม่ถูกต้อง: ต้องเป็นจำนวนที่หารด้วย ".concat(e.divisor, " ได้ลงตัว");
                        case "unrecognized_keys":
                            return "พบคีย์ที่ไม่รู้จัก: ".concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "คีย์ไม่ถูกต้องใน ".concat(e.origin);
                        case "invalid_union":
                            return "ข้อมูลไม่ถูกต้อง: ไม่ตรงกับรูปแบบยูเนียนที่กำหนดไว้";
                        case "invalid_element":
                            return "ข้อมูลไม่ถูกต้องใน ".concat(e.origin);
                        default:
                            return "ข้อมูลไม่ถูกต้อง"
                    }
                }
            })()
        }
    }, "tk", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "simwol",
                        verb: "bolmaly"
                    },
                    file: {
                        unit: "baýt",
                        verb: "bolmaly"
                    },
                    array: {
                        unit: "elementler",
                        verb: "bolmaly"
                    },
                    set: {
                        unit: "elementler",
                        verb: "bolmaly"
                    },
                    map: {
                        unit: "elementler",
                        verb: "bolmaly"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "giriş",
                        email: "e-poçta salgysy",
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
                        datetime: "ISO sene we wagt",
                        date: "ISO sene",
                        time: "ISO wagt",
                        duration: "ISO wagt aralygy",
                        ipv4: "IPv4 salgysy",
                        ipv6: "IPv6 salgysy",
                        mac: "MAC salgysy",
                        cidrv4: "IPv4 aralygy",
                        cidrv6: "IPv6 aralygy",
                        base64: "base64 bilen şifrlenen setir",
                        base64url: "base64url bilen şifrlenen setir",
                        json_string: "JSON setiri",
                        e164: "E.164 nomeri",
                        credit_card: "kredit kartynyň nomeri",
                        currency_code: "walýuta kody",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "şablon"
                    },
                    r = {
                        nan: "NaN"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            return "Nädogry baha: garaşylan ".concat(t, " ýerine ").concat(o, " alyndy")
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Nädogry baha: ".concat(et(e.values[0]), " bolmaly");
                            return "Nädogry saýlaw: aşakdakylardan biri bolmaly: ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Has uly: garaşylýan ".concat(null != (o = e.origin) ? o : "baha", " ").concat(n, " ").concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "element");
                            return "Has uly: garaşylýan ".concat(null != (u = e.origin) ? u : "baha", " ").concat(n, " ").concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Has kiçi: garaşylýan ".concat(e.origin, " ").concat(n, " ").concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Has kiçi: garaşylýan ".concat(e.origin, " ").concat(n, " ").concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Nädogry setir: "'.concat(e.prefix, '" bilen başlamaly');
                            if ("ends_with" === e.format) return 'Nädogry setir: "'.concat(e.suffix, '" bilen gutarmaly');
                            if ("includes" === e.format) return 'Nädogry setir: "'.concat(e.includes, '" saklamaly');
                            if ("regex" === e.format) return "Nädogry setir: ".concat(e.pattern, " nusga laýyk bolmaly");
                            return "Nädogry ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "Nädogry san: ".concat(e.divisor, " bilen galyndysyz bölünmeli");
                        case "unrecognized_keys":
                            return "Tanalmaýan açar".concat(e.keys.length > 1 ? "lar" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "".concat(e.origin, " içinde nädogry açar");
                        case "invalid_union":
                        default:
                            return "Nädogry baha";
                        case "invalid_element":
                            return "".concat(e.origin, " içinde nädogry baha")
                    }
                }
            })()
        }
    }, "tr", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "karakter",
                        verb: "olmalı"
                    },
                    file: {
                        unit: "bayt",
                        verb: "olmalı"
                    },
                    array: {
                        unit: "öğe",
                        verb: "olmalı"
                    },
                    set: {
                        unit: "öğe",
                        verb: "olmalı"
                    },
                    map: {
                        unit: "öğe",
                        verb: "olmalı"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "girdi",
                        email: "e-posta adresi",
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
                        datetime: "ISO tarih ve saat",
                        date: "ISO tarih",
                        time: "ISO saat",
                        duration: "ISO süre",
                        ipv4: "IPv4 adresi",
                        ipv6: "IPv6 adresi",
                        mac: "MAC adresi",
                        cidrv4: "IPv4 aralığı",
                        cidrv6: "IPv6 aralığı",
                        base64: "base64 ile şifrelenmiş metin",
                        base64url: "base64url ile şifrelenmiş metin",
                        json_string: "JSON dizesi",
                        e164: "E.164 sayısı",
                        credit_card: "kredi kartı numarası",
                        currency_code: "para birimi kodu",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "Şablon dizesi"
                    },
                    r = {
                        nan: "NaN"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Geçersiz değer: beklenen instanceof ".concat(e.expected, ", alınan ").concat(o);
                            return "Geçersiz değer: beklenen ".concat(t, ", alınan ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Geçersiz değer: beklenen ".concat(et(e.values[0]));
                            return "Geçersiz seçenek: aşağıdakilerden biri olmalı: ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Çok büyük: beklenen ".concat(null != (o = e.origin) ? o : "değer", " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "öğe");
                            return "Çok büyük: beklenen ".concat(null != (u = e.origin) ? u : "değer", " ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Çok küçük: beklenen ".concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Çok küçük: beklenen ".concat(e.origin, " ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Geçersiz metin: "'.concat(e.prefix, '" ile başlamalı');
                            if ("ends_with" === e.format) return 'Geçersiz metin: "'.concat(e.suffix, '" ile bitmeli');
                            if ("includes" === e.format) return 'Geçersiz metin: "'.concat(e.includes, '" içermeli');
                            if ("regex" === e.format) return "Geçersiz metin: ".concat(e.pattern, " desenine uymalı");
                            return "Geçersiz ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "Geçersiz sayı: ".concat(e.divisor, " ile tam bölünebilmeli");
                        case "unrecognized_keys":
                            return "Tanınmayan anahtar".concat(e.keys.length > 1 ? "lar" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "".concat(e.origin, " içinde geçersiz anahtar");
                        case "invalid_union":
                        default:
                            return "Geçersiz değer";
                        case "invalid_element":
                            return "".concat(e.origin, " içinde geçersiz değer")
                    }
                }
            })()
        }
    }, "ua", 0, function() {
        return tV()
    }, "uk", 0, tV, "ur", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "حروف",
                        verb: "ہونا"
                    },
                    file: {
                        unit: "بائٹس",
                        verb: "ہونا"
                    },
                    array: {
                        unit: "آئٹمز",
                        verb: "ہونا"
                    },
                    set: {
                        unit: "آئٹمز",
                        verb: "ہونا"
                    },
                    map: {
                        unit: "آئٹمز",
                        verb: "ہونا"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "ان پٹ",
                        email: "ای میل ایڈریس",
                        url: "یو آر ایل",
                        emoji: "ایموجی",
                        uuid: "یو یو آئی ڈی",
                        uuidv4: "یو یو آئی ڈی وی 4",
                        uuidv6: "یو یو آئی ڈی وی 6",
                        nanoid: "نینو آئی ڈی",
                        guid: "جی یو آئی ڈی",
                        cuid: "سی یو آئی ڈی",
                        cuid2: "سی یو آئی ڈی 2",
                        ulid: "یو ایل آئی ڈی",
                        xid: "ایکس آئی ڈی",
                        ksuid: "کے ایس یو آئی ڈی",
                        datetime: "آئی ایس او ڈیٹ ٹائم",
                        date: "آئی ایس او تاریخ",
                        time: "آئی ایس او وقت",
                        duration: "آئی ایس او مدت",
                        ipv4: "آئی پی وی 4 ایڈریس",
                        ipv6: "آئی پی وی 6 ایڈریس",
                        mac: "ایم اے سی ایڈریس",
                        cidrv4: "آئی پی وی 4 رینج",
                        cidrv6: "آئی پی وی 6 رینج",
                        base64: "بیس 64 ان کوڈڈ سٹرنگ",
                        base64url: "بیس 64 یو آر ایل ان کوڈڈ سٹرنگ",
                        json_string: "جے ایس او این سٹرنگ",
                        e164: "ای 164 نمبر",
                        credit_card: "کریڈٹ کارڈ نمبر",
                        currency_code: "کرنسی کوڈ",
                        iban: "IBAN",
                        jwt: "جے ڈبلیو ٹی",
                        template_literal: "ان پٹ"
                    },
                    r = {
                        nan: "NaN",
                        number: "نمبر",
                        array: "آرے",
                        null: "نل"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "غلط ان پٹ: instanceof ".concat(e.expected, " متوقع تھا، ").concat(o, " موصول ہوا");
                            return "غلط ان پٹ: ".concat(t, " متوقع تھا، ").concat(o, " موصول ہوا")
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "غلط ان پٹ: ".concat(et(e.values[0]), " متوقع تھا");
                            return "غلط آپشن: ".concat(b(e.values, "|"), " میں سے ایک متوقع تھا");
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "بہت بڑا: ".concat(null != (o = e.origin) ? o : "ویلیو", " کے ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "عناصر", " ہونے متوقع تھے");
                            return "بہت بڑا: ".concat(null != (u = e.origin) ? u : "ویلیو", " کا ").concat(n).concat(e.maximum.toString(), " ہونا متوقع تھا")
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "بہت چھوٹا: ".concat(e.origin, " کے ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit, " ہونے متوقع تھے");
                            return "بہت چھوٹا: ".concat(e.origin, " کا ").concat(n).concat(e.minimum.toString(), " ہونا متوقع تھا")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'غلط سٹرنگ: "'.concat(e.prefix, '" سے شروع ہونا چاہیے');
                            if ("ends_with" === e.format) return 'غلط سٹرنگ: "'.concat(e.suffix, '" پر ختم ہونا چاہیے');
                            if ("includes" === e.format) return 'غلط سٹرنگ: "'.concat(e.includes, '" شامل ہونا چاہیے');
                            if ("regex" === e.format) return "غلط سٹرنگ: پیٹرن ".concat(e.pattern, " سے میچ ہونا چاہیے");
                            return "غلط ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "غلط نمبر: ".concat(e.divisor, " کا مضاعف ہونا چاہیے");
                        case "unrecognized_keys":
                            return "غیر تسلیم شدہ کی".concat(e.keys.length > 1 ? "ز" : "", ": ").concat(b(e.keys, "، "));
                        case "invalid_key":
                            return "".concat(e.origin, " میں غلط کی");
                        case "invalid_union":
                        default:
                            return "غلط ان پٹ";
                        case "invalid_element":
                            return "".concat(e.origin, " میں غلط ویلیو")
                    }
                }
            })()
        }
    }, "uz", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "belgi",
                        verb: "bo‘lishi kerak"
                    },
                    file: {
                        unit: "bayt",
                        verb: "bo‘lishi kerak"
                    },
                    array: {
                        unit: "element",
                        verb: "bo‘lishi kerak"
                    },
                    set: {
                        unit: "element",
                        verb: "bo‘lishi kerak"
                    },
                    map: {
                        unit: "yozuv",
                        verb: "bo‘lishi kerak"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "kirish",
                        email: "elektron pochta manzili",
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
                        datetime: "ISO sana va vaqti",
                        date: "ISO sana",
                        time: "ISO vaqt",
                        duration: "ISO davomiylik",
                        ipv4: "IPv4 manzil",
                        ipv6: "IPv6 manzil",
                        mac: "MAC manzil",
                        cidrv4: "IPv4 diapazon",
                        cidrv6: "IPv6 diapazon",
                        base64: "base64 kodlangan satr",
                        base64url: "base64url kodlangan satr",
                        json_string: "JSON satr",
                        e164: "E.164 raqam",
                        credit_card: "kredit karta raqami",
                        currency_code: "valyuta kodi",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "kirish"
                    },
                    r = {
                        nan: "NaN",
                        number: "raqam",
                        array: "massiv"
                    };
                return e => {
                    var i, a, o, c, u;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Noto‘g‘ri kirish: kutilgan instanceof ".concat(e.expected, ", qabul qilingan ").concat(o);
                            return "Noto‘g‘ri kirish: kutilgan ".concat(t, ", qabul qilingan ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Noto‘g‘ri kirish: kutilgan ".concat(et(e.values[0]));
                            return "Noto‘g‘ri variant: quyidagilardan biri kutilgan ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Juda katta: kutilgan ".concat(null != (o = e.origin) ? o : "qiymat", " ").concat(n).concat(e.maximum.toString(), " ").concat(r.unit, " ").concat(r.verb);
                            return "Juda katta: kutilgan ".concat(null != (c = e.origin) ? c : "qiymat", " ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Juda kichik: kutilgan ".concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit, " ").concat(r.verb);
                            return "Juda kichik: kutilgan ".concat(e.origin, " ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Noto‘g‘ri satr: "'.concat(e.prefix, '" bilan boshlanishi kerak');
                            if ("ends_with" === e.format) return 'Noto‘g‘ri satr: "'.concat(e.suffix, '" bilan tugashi kerak');
                            if ("includes" === e.format) return 'Noto‘g‘ri satr: "'.concat(e.includes, '" ni o‘z ichiga olishi kerak');
                            if ("regex" === e.format) return "Noto‘g‘ri satr: ".concat(e.pattern, " shabloniga mos kelishi kerak");
                            return "Noto‘g‘ri ".concat(null != (u = n[e.format]) ? u : e.format);
                        case "not_multiple_of":
                            return "Noto‘g‘ri raqam: ".concat(e.divisor, " ning karralisi bo‘lishi kerak");
                        case "unrecognized_keys":
                            return "Noma’lum kalit".concat(e.keys.length > 1 ? "lar" : "", ": ").concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "".concat(e.origin, " dagi kalit noto‘g‘ri");
                        case "invalid_union":
                        default:
                            return "Noto‘g‘ri kirish";
                        case "invalid_element":
                            return "".concat(e.origin, " da noto‘g‘ri qiymat")
                    }
                }
            })()
        }
    }, "vi", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "ký tự",
                        verb: "có"
                    },
                    file: {
                        unit: "byte",
                        verb: "có"
                    },
                    array: {
                        unit: "phần tử",
                        verb: "có"
                    },
                    set: {
                        unit: "phần tử",
                        verb: "có"
                    },
                    map: {
                        unit: "phần tử",
                        verb: "có"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "đầu vào",
                        email: "địa chỉ email",
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
                        datetime: "ngày giờ ISO",
                        date: "ngày ISO",
                        time: "giờ ISO",
                        duration: "khoảng thời gian ISO",
                        ipv4: "địa chỉ IPv4",
                        ipv6: "địa chỉ IPv6",
                        mac: "địa chỉ MAC",
                        cidrv4: "dải IPv4",
                        cidrv6: "dải IPv6",
                        base64: "chuỗi mã hóa base64",
                        base64url: "chuỗi mã hóa base64url",
                        json_string: "chuỗi JSON",
                        e164: "số E.164",
                        credit_card: "số thẻ tín dụng",
                        currency_code: "mã tiền tệ",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "đầu vào"
                    },
                    r = {
                        nan: "NaN",
                        number: "số",
                        array: "mảng"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Đầu vào không hợp lệ: mong đợi instanceof ".concat(e.expected, ", nhận được ").concat(o);
                            return "Đầu vào không hợp lệ: mong đợi ".concat(t, ", nhận được ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Đầu vào không hợp lệ: mong đợi ".concat(et(e.values[0]));
                            return "Tùy chọn không hợp lệ: mong đợi một trong các giá trị ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Quá lớn: mong đợi ".concat(null != (o = e.origin) ? o : "giá trị", " ").concat(r.verb, " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "phần tử");
                            return "Quá lớn: mong đợi ".concat(null != (u = e.origin) ? u : "giá trị", " ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Quá nhỏ: mong đợi ".concat(e.origin, " ").concat(r.verb, " ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Quá nhỏ: mong đợi ".concat(e.origin, " ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Chuỗi không hợp lệ: phải bắt đầu bằng "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Chuỗi không hợp lệ: phải kết thúc bằng "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Chuỗi không hợp lệ: phải bao gồm "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Chuỗi không hợp lệ: phải khớp với mẫu ".concat(e.pattern);
                            return "".concat(null != (l = n[e.format]) ? l : e.format, " không hợp lệ");
                        case "not_multiple_of":
                            return "Số không hợp lệ: phải là bội số của ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Khóa không được nhận dạng: ".concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Khóa không hợp lệ trong ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Đầu vào không hợp lệ";
                        case "invalid_element":
                            return "Giá trị không hợp lệ trong ".concat(e.origin)
                    }
                }
            })()
        }
    }, "yo", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "àmi",
                        verb: "ní"
                    },
                    file: {
                        unit: "bytes",
                        verb: "ní"
                    },
                    array: {
                        unit: "nkan",
                        verb: "ní"
                    },
                    set: {
                        unit: "nkan",
                        verb: "ní"
                    },
                    map: {
                        unit: "nkan",
                        verb: "ní"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "ẹ̀rọ ìbáwọlé",
                        email: "àdírẹ́sì ìmẹ́lì",
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
                        datetime: "àkókò ISO",
                        date: "ọjọ́ ISO",
                        time: "àkókò ISO",
                        duration: "àkókò tó pé ISO",
                        ipv4: "àdírẹ́sì IPv4",
                        ipv6: "àdírẹ́sì IPv6",
                        mac: "àdírẹ́sì MAC",
                        cidrv4: "àgbègbè IPv4",
                        cidrv6: "àgbègbè IPv6",
                        base64: "ọ̀rọ̀ tí a kọ́ ní base64",
                        base64url: "ọ̀rọ̀ base64url",
                        json_string: "ọ̀rọ̀ JSON",
                        e164: "nọ́mbà E.164",
                        credit_card: "nọmba kaadi gbese",
                        currency_code: "koodu owó",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "ẹ̀rọ ìbáwọlé"
                    },
                    r = {
                        nan: "NaN",
                        number: "nọ́mbà",
                        array: "akopọ"
                    };
                return e => {
                    var i, a, o, c;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Ìbáwọlé aṣìṣe: a ní láti fi instanceof ".concat(e.expected, ", àmọ̀ a rí ").concat(o);
                            return "Ìbáwọlé aṣìṣe: a ní láti fi ".concat(t, ", àmọ̀ a rí ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Ìbáwọlé aṣìṣe: a ní láti fi ".concat(et(e.values[0]));
                            return "Àṣàyàn aṣìṣe: yan ọ̀kan lára ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Tó pọ̀ jù: a ní láti jẹ́ pé ".concat(null != (o = e.origin) ? o : "iye", " ").concat(r.verb, " ").concat(n).concat(e.maximum, " ").concat(r.unit);
                            return "Tó pọ̀ jù: a ní láti jẹ́ ".concat(n).concat(e.maximum)
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Kéré ju: a ní láti jẹ́ pé ".concat(e.origin, " ").concat(r.verb, " ").concat(n).concat(e.minimum, " ").concat(r.unit);
                            return "Kéré ju: a ní láti jẹ́ ".concat(n).concat(e.minimum)
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Ọ̀rọ̀ aṣìṣe: gbọ́dọ̀ bẹ̀rẹ̀ pẹ̀lú "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Ọ̀rọ̀ aṣìṣe: gbọ́dọ̀ parí pẹ̀lú "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Ọ̀rọ̀ aṣìṣe: gbọ́dọ̀ ní "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Ọ̀rọ̀ aṣìṣe: gbọ́dọ̀ bá àpẹẹrẹ mu ".concat(e.pattern);
                            return "Aṣìṣe: ".concat(null != (c = n[e.format]) ? c : e.format);
                        case "not_multiple_of":
                            return "Nọ́mbà aṣìṣe: gbọ́dọ̀ jẹ́ èyà pípín ti ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Bọtìnì àìmọ̀: ".concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "Bọtìnì aṣìṣe nínú ".concat(e.origin);
                        case "invalid_union":
                        default:
                            return "Ìbáwọlé aṣìṣe";
                        case "invalid_element":
                            return "Iye aṣìṣe nínú ".concat(e.origin)
                    }
                }
            })()
        }
    }, "zhCN", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "字符",
                        verb: "包含"
                    },
                    file: {
                        unit: "字节",
                        verb: "包含"
                    },
                    array: {
                        unit: "项",
                        verb: "包含"
                    },
                    set: {
                        unit: "项",
                        verb: "包含"
                    },
                    map: {
                        unit: "项",
                        verb: "包含"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "输入",
                        email: "电子邮件",
                        url: "URL",
                        emoji: "表情符号",
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
                        datetime: "ISO日期时间",
                        date: "ISO日期",
                        time: "ISO时间",
                        duration: "ISO时长",
                        ipv4: "IPv4地址",
                        ipv6: "IPv6地址",
                        mac: "MAC地址",
                        cidrv4: "IPv4网段",
                        cidrv6: "IPv6网段",
                        base64: "base64编码字符串",
                        base64url: "base64url编码字符串",
                        json_string: "JSON字符串",
                        e164: "E.164号码",
                        credit_card: "信用卡号",
                        currency_code: "货币代码",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "输入"
                    },
                    r = {
                        nan: "NaN",
                        number: "数字",
                        array: "数组",
                        null: "空值(null)"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "无效输入：期望 instanceof ".concat(e.expected, "，实际接收 ").concat(o);
                            return "无效输入：期望 ".concat(t, "，实际接收 ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "无效输入：期望 ".concat(et(e.values[0]));
                            return "无效选项：期望以下之一 ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "数值过大：期望 ".concat(null != (o = e.origin) ? o : "值", " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "个元素");
                            return "数值过大：期望 ".concat(null != (u = e.origin) ? u : "值", " ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "数值过小：期望 ".concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "数值过小：期望 ".concat(e.origin, " ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return '无效字符串：必须以 "'.concat(e.prefix, '" 开头');
                            if ("ends_with" === e.format) return '无效字符串：必须以 "'.concat(e.suffix, '" 结尾');
                            if ("includes" === e.format) return '无效字符串：必须包含 "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "无效字符串：必须满足正则表达式 ".concat(e.pattern);
                            return "无效".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "无效数字：必须是 ".concat(e.divisor, " 的倍数");
                        case "unrecognized_keys":
                            return "出现未知的键(key): ".concat(b(e.keys, ", "));
                        case "invalid_key":
                            return "".concat(e.origin, " 中的键(key)无效");
                        case "invalid_union":
                        default:
                            return "无效输入";
                        case "invalid_element":
                            return "".concat(e.origin, " 中包含无效值(value)")
                    }
                }
            })()
        }
    }, "zhTW", 0, function() {
        return {
            localeError: (() => {
                let e = {
                    string: {
                        unit: "字元",
                        verb: "擁有"
                    },
                    file: {
                        unit: "位元組",
                        verb: "擁有"
                    },
                    array: {
                        unit: "項目",
                        verb: "擁有"
                    },
                    set: {
                        unit: "項目",
                        verb: "擁有"
                    },
                    map: {
                        unit: "項目",
                        verb: "擁有"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "輸入",
                        email: "郵件地址",
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
                        datetime: "ISO 日期時間",
                        date: "ISO 日期",
                        time: "ISO 時間",
                        duration: "ISO 期間",
                        ipv4: "IPv4 位址",
                        ipv6: "IPv6 位址",
                        mac: "MAC 位址",
                        cidrv4: "IPv4 範圍",
                        cidrv6: "IPv6 範圍",
                        base64: "base64 編碼字串",
                        base64url: "base64url 編碼字串",
                        json_string: "JSON 字串",
                        e164: "E.164 數值",
                        credit_card: "信用卡號",
                        currency_code: "貨幣代碼",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "輸入"
                    },
                    r = {
                        nan: "NaN"
                    };
                return e => {
                    var i, a, o, c, u, l;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (i = r[e.expected]) ? i : e.expected,
                                n = ex(e.input),
                                o = null != (a = r[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "無效的輸入值：預期為 instanceof ".concat(e.expected, "，但收到 ").concat(o);
                            return "無效的輸入值：預期為 ".concat(t, "，但收到 ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "無效的輸入值：預期為 ".concat(et(e.values[0]));
                            return "無效的選項：預期為以下其中之一 ".concat(b(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "數值過大：預期 ".concat(null != (o = e.origin) ? o : "值", " 應為 ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "個元素");
                            return "數值過大：預期 ".concat(null != (u = e.origin) ? u : "值", " 應為 ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "數值過小：預期 ".concat(e.origin, " 應為 ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "數值過小：預期 ".concat(e.origin, " 應為 ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return '無效的字串：必須以 "'.concat(e.prefix, '" 開頭');
                            if ("ends_with" === e.format) return '無效的字串：必須以 "'.concat(e.suffix, '" 結尾');
                            if ("includes" === e.format) return '無效的字串：必須包含 "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "無效的字串：必須符合格式 ".concat(e.pattern);
                            return "無效的 ".concat(null != (l = n[e.format]) ? l : e.format);
                        case "not_multiple_of":
                            return "無效的數字：必須為 ".concat(e.divisor, " 的倍數");
                        case "unrecognized_keys":
                            return "無法識別的鍵值".concat(e.keys.length > 1 ? "們" : "", "：").concat(b(e.keys, "、"));
                        case "invalid_key":
                            return "".concat(e.origin, " 中有無效的鍵值");
                        case "invalid_union":
                        default:
                            return "無效的輸入值";
                        case "invalid_element":
                            return "".concat(e.origin, " 中有無效的值")
                    }
                }
            })()
        }
    }], 232360);
    var tq = e.i(232360);
    e.s([], 617130);
    var tK = e.i(617130);
    e.i(913785);
    let tW = {
            get: function() {
                let e = this._zod;
                return null != e.message || (e.message = JSON.stringify(e.def, y, 2)), e.message
            },
            set: function(e) {
                this._zod.message = e
            },
            enumerable: !0,
            configurable: !0
        },
        tX = {
            value: void 0,
            enumerable: !1
        },
        tH = new WeakSet([Object.prototype, Error.prototype]),
        tY = (e, t) => {
            e.name = "$ZodError", tX.value = t, Object.defineProperty(e, "issues", tX), tX.value = void 0, Object.defineProperty(e, "message", tW);
            let n = Object.getPrototypeOf(e);
            tH.has(n) || (tH.add(n), Object.defineProperty(n, "toString", {
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
        },
        tQ = o("$ZodError", tY),
        t0 = o("$ZodError", tY, void 0, {
            Parent: Error
        });

    function t4(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e => e.message,
            n = {},
            r = [];
        for (let o of e.issues)
            if (o.path.length > 0) {
                var i, a;
                (i = o.path[0], a = () => [], !Object.prototype.hasOwnProperty.call(n, i) && ("__proto__" === i ? Object.defineProperty(n, i, {
                    value: a(),
                    writable: !0,
                    enumerable: !0,
                    configurable: !0
                }) : n[i] = a()), n[i]).push(t(o))
            } else r.push(t(o));
        return {
            formErrors: r,
            fieldErrors: n
        }
    }

    function t1(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e => e.message,
            n = {
                _errors: []
            },
            r = function(e) {
                let i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [];
                for (let a of e.issues)
                    if ("invalid_union" === a.code && a.errors.length) a.errors.map(e => r({
                        issues: e
                    }, [...i, ...a.path]));
                    else if ("invalid_key" === a.code) r({
                    issues: a.issues
                }, [...i, ...a.path]);
                else if ("invalid_element" === a.code) r({
                    issues: a.issues
                }, [...i, ...a.path]);
                else {
                    let e = [...i, ...a.path];
                    if (0 === e.length) n._errors.push(t(a));
                    else {
                        let r = n,
                            i = 0;
                        for (; i < e.length;) {
                            let n = e[i],
                                o = i === e.length - 1;
                            if ("_errors" === n) {
                                o && r._errors.push(t(a)), i++;
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
                            let c = r[n];
                            o && c._errors.push(t(a)), r = c, i++
                        }
                    }
                }
            };
        return r(e), n
    }

    function t6(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e => e.message,
            n = {
                errors: []
            },
            r = function(e) {
                var i;
                let a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [];
                for (let o of e.issues)
                    if ("invalid_union" === o.code && o.errors.length) o.errors.map(e => r({
                        issues: e
                    }, [...a, ...o.path]));
                    else if ("invalid_key" === o.code) r({
                    issues: o.issues
                }, [...a, ...o.path]);
                else if ("invalid_element" === o.code) r({
                    issues: o.issues
                }, [...a, ...o.path]);
                else {
                    let e = [...a, ...o.path];
                    if (0 === e.length) {
                        n.errors.push(t(o));
                        continue
                    }
                    let r = n,
                        c = 0;
                    for (; c < e.length;) {
                        let n = e[c],
                            a = c === e.length - 1;
                        "string" == typeof n ? (null != r.properties || (r.properties = {}), Object.prototype.hasOwnProperty.call(r.properties, n) || Object.defineProperty(r.properties, n, {
                            value: {
                                errors: []
                            },
                            enumerable: !0,
                            writable: !0,
                            configurable: !0
                        }), r = r.properties[n]) : (null != r.items || (r.items = []), null != (i = r.items)[n] || (i[n] = {
                            errors: []
                        }), r = r.items[n]), a && r.errors.push(t(o)), c++
                    }
                }
            };
        return r(e), n
    }

    function t2(e) {
        let t = [];
        for (let n of e.map(e => "object" == typeof e ? e.key : e)) "number" == typeof n ? t.push("[".concat(n, "]")) : "symbol" == typeof n ? t.push("[".concat(JSON.stringify(String(n)), "]")) : /[^\w$]/.test(n) ? t.push("[".concat(JSON.stringify(n), "]")) : (t.length && t.push("."), t.push(n));
        return t.join("")
    }

    function t5(e) {
        let t = [];
        for (let r of [...e.issues].sort((e, t) => {
                var n, r;
                return (null != (n = e.path) ? n : []).length - (null != (r = t.path) ? r : []).length
            })) {
            var n;
            t.push("✖ ".concat(r.message)), (null == (n = r.path) ? void 0 : n.length) && t.push("  → at ".concat(t2(r.path)))
        }
        return t.join("\n")
    }

    function t3(e, t) {
        var n;
        return {
            callee: null != (n = null == t ? void 0 : t.callee) ? n : e,
            Err: null == t ? void 0 : t.Err
        }
    }
    e.s(["$ZodError", 0, tQ, "$ZodRealError", 0, t0, "flattenError", 0, t4, "formatError", 0, t1, "prettifyError", 0, t5, "toDotPath", 0, t2, "treeifyError", 0, t6], 40632);
    let t9 = e => {
            let t = (n, r, i, a) => {
                let o = i ? {
                        ...i,
                        async: !1
                    } : {
                        async: !1
                    },
                    c = n._zod.run({
                        value: r,
                        issues: []
                    }, o);
                if (c instanceof Promise) throw new u;
                if (c.issues.length) {
                    var l, s;
                    let n = new(null != (l = null == a ? void 0 : a.Err) ? l : e)(c.issues.map(e => eb(e, o, d())));
                    throw J(n, null != (s = null == a ? void 0 : a.callee) ? s : t), n
                }
                return c.value
            };
            return t
        },
        t8 = t9(t0),
        t7 = e => {
            let t = async (n, r, i, a) => {
                let o = i ? {
                        ...i,
                        async: !0
                    } : {
                        async: !0
                    },
                    c = n._zod.run({
                        value: r,
                        issues: []
                    }, o);
                if (c instanceof Promise && (c = await c), c.issues.length) {
                    var u, l;
                    let n = new(null != (u = null == a ? void 0 : a.Err) ? u : e)(c.issues.map(e => eb(e, o, d())));
                    throw J(n, null != (l = null == a ? void 0 : a.callee) ? l : t), n
                }
                return c.value
            };
            return t
        },
        ne = t7(t0),
        nt = e => (t, n, r) => {
            let i = r ? {
                    ...r,
                    async: !1
                } : {
                    async: !1
                },
                a = t._zod.run({
                    value: n,
                    issues: []
                }, i);
            if (a instanceof Promise) throw new u;
            return a.issues.length ? nr(e, a.issues, i) : {
                success: !0,
                data: a.value
            }
        },
        nn = nt(t0);

    function nr(e, t, n) {
        let r;
        return {
            success: !1,
            get error() {
                return r || (r = new e(t.map(e => eb(e, n, d()))), t = void 0, n = void 0), r
            },
            set error(e) {
                r = e, t = void 0, n = void 0
            }
        }
    }
    let ni = e => async (t, n, r) => {
        let i = r ? {
                ...r,
                async: !0
            } : {
                async: !0
            },
            a = t._zod.run({
                value: n,
                issues: []
            }, i);
        return a instanceof Promise && (a = await a), a.issues.length ? nr(e, a.issues, i) : {
            success: !0,
            data: a.value
        }
    }, na = ni(t0), no = Symbol.for("zod.compile.invalid"), nc = Symbol.for("zod.compile.fallback"), nu = (e, t, n) => {
        let r = e._zod.bag.validator;
        if (void 0 !== r) {
            if (r(t) !== no) return !0;
            if (!0 === r.definite && void 0 === n) return !1
        }
        var i = e,
            a = t,
            o = n;
        let c, l = o ? {
                ...o,
                async: !1,
                abortEarly: !0
            } : {
                async: !1,
                abortEarly: !0
            },
            s = i._zod.bag.fallbackRun;
        if (s ? (l[nc] = !0, c = s({
                value: a,
                issues: []
            }, l)) : c = i._zod.run({
                value: a,
                issues: []
            }, l), c instanceof Promise) throw new u;
        return 0 === c.issues.length
    }, nl = async (e, t, n) => {
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
    }, ns = e => {
        let t = t9(e),
            n = (e, r, i, a) => t(e, r, i ? {
                ...i,
                direction: "backward"
            } : {
                direction: "backward"
            }, t3(n, a));
        return n
    }, nd = ns(t0), nm = e => {
        let t = t9(e),
            n = (e, r, i, a) => t(e, r, i, t3(n, a));
        return n
    }, nf = nm(t0), nv = e => {
        let t = t7(e),
            n = async (e, r, i, a) => {
                let o = i ? {
                    ...i,
                    direction: "backward"
                } : {
                    direction: "backward"
                };
                return await t(e, r, o, t3(n, a))
            };
        return n
    }, np = nv(t0), ng = e => {
        let t = t7(e),
            n = async (e, r, i, a) => await t(e, r, i, t3(n, a));
        return n
    }, nh = ng(t0), n_ = e => (t, n, r) => {
        let i = r ? {
            ...r,
            direction: "backward"
        } : {
            direction: "backward"
        };
        return nt(e)(t, n, i)
    }, nb = n_(t0), ny = e => (t, n, r) => nt(e)(t, n, r), nI = ny(t0), nw = e => async (t, n, r) => {
        let i = r ? {
            ...r,
            direction: "backward"
        } : {
            direction: "backward"
        };
        return ni(e)(t, n, i)
    }, nk = nw(t0), nx = e => async (t, n, r) => ni(e)(t, n, r), nS = nx(t0);
    e.s(["_decode", 0, nm, "_decodeAsync", 0, ng, "_encode", 0, ns, "_encodeAsync", 0, nv, "_parse", 0, t9, "_parseAsync", 0, t7, "_safeDecode", 0, ny, "_safeDecodeAsync", 0, nx, "_safeEncode", 0, n_, "_safeEncodeAsync", 0, nw, "_safeParse", 0, nt, "_safeParseAsync", 0, ni, "decode", 0, nf, "decodeAsync", 0, nh, "encode", 0, nd, "encodeAsync", 0, np, "parse", 0, t8, "parseAsync", 0, ne, "safeDecode", 0, nI, "safeDecodeAsync", 0, nS, "safeEncode", 0, nb, "safeEncodeAsync", 0, nk, "safeParse", 0, nn, "safeParseAsync", 0, na, "validate", 0, nu, "validateAsync", 0, nl], 155281), e.i(155281), e.i(40632);
    let nz = o("$ZodCheck", (e, t) => {
            var n;
            null != e._zod || (e._zod = {}), e._zod.def = t, null != (n = e._zod).onattach || (n.onattach = [])
        }),
        nU = e => {
            let t = e.value;
            return !k(t) && void 0 !== t.size
        },
        nA = e => {
            let t = e.value;
            return !k(t) && void 0 !== t.length
        },
        nD = {
            number: "number",
            bigint: "bigint",
            object: "date"
        },
        nP = o("$ZodCheckLessThan", (e, t) => {
            nz.init(e, t);
            let n = nD[typeof t.value];
            e._zod.check = r => {
                var i;
                (t.inclusive ? r.value <= t.value : r.value < t.value) || r.issues.push({
                    origin: null != (i = nD[typeof r.value]) ? i : n,
                    code: "too_big",
                    maximum: "object" == typeof t.value ? t.value.getTime() : t.value,
                    input: r.value,
                    inclusive: t.inclusive,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        nN = o("$ZodCheckGreaterThan", (e, t) => {
            nz.init(e, t);
            let n = nD[typeof t.value];
            e._zod.check = r => {
                var i;
                (t.inclusive ? r.value >= t.value : r.value > t.value) || r.issues.push({
                    origin: null != (i = nD[typeof r.value]) ? i : n,
                    code: "too_small",
                    minimum: "object" == typeof t.value ? t.value.getTime() : t.value,
                    input: r.value,
                    inclusive: t.inclusive,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        nO = o("$ZodCheckMultipleOf", (e, t) => {
            nz.init(e, t), e._zod.check = n => {
                if (typeof n.value != typeof t.value) throw Error("Cannot mix number and bigint in multiple_of check.");
                ("bigint" == typeof n.value ? t.value !== BigInt(0) && n.value % t.value === BigInt(0) : 0 === S(n.value, t.value)) || n.issues.push({
                    origin: typeof n.value,
                    code: "not_multiple_of",
                    divisor: t.value,
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        nj = o("$ZodCheckNumberFormat", (e, t) => {
            var n;
            nz.init(e, t), t.format = t.format || "float64";
            let r = null == (n = t.format) ? void 0 : n.includes("int"),
                i = r ? "int" : "number",
                [a, o] = er[t.format];
            e._zod.check = n => {
                let c = n.value;
                if (r) {
                    if (!Number.isInteger(c)) return void n.issues.push({
                        expected: i,
                        format: t.format,
                        code: "invalid_type",
                        continue: !1,
                        input: c,
                        inst: e
                    });
                    if (!Number.isSafeInteger(c)) return void(c > 0 ? n.issues.push({
                        input: c,
                        code: "too_big",
                        maximum: Number.MAX_SAFE_INTEGER,
                        note: "Integers must be within the safe integer range.",
                        inst: e,
                        origin: i,
                        inclusive: !0,
                        continue: !t.abort
                    }) : n.issues.push({
                        input: c,
                        code: "too_small",
                        minimum: Number.MIN_SAFE_INTEGER,
                        note: "Integers must be within the safe integer range.",
                        inst: e,
                        origin: i,
                        inclusive: !0,
                        continue: !t.abort
                    }))
                }
                c < a && n.issues.push({
                    origin: "number",
                    input: c,
                    code: "too_small",
                    minimum: a,
                    inclusive: !0,
                    inst: e,
                    continue: !t.abort
                }), c > o && n.issues.push({
                    origin: "number",
                    input: c,
                    code: "too_big",
                    maximum: o,
                    inclusive: !0,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        nZ = o("$ZodCheckBigIntFormat", (e, t) => {
            nz.init(e, t);
            let [n, r] = ei[t.format];
            e._zod.check = i => {
                let a = i.value;
                a < n && i.issues.push({
                    origin: "bigint",
                    input: a,
                    code: "too_small",
                    minimum: n,
                    inclusive: !0,
                    inst: e,
                    continue: !t.abort
                }), a > r && i.issues.push({
                    origin: "bigint",
                    input: a,
                    code: "too_big",
                    maximum: r,
                    inclusive: !0,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        nT = o("$ZodCheckMaxSize", (e, t) => {
            var n;
            nz.init(e, t), null != (n = e._zod.def).when || (n.when = nU), e._zod.check = n => {
                let r = n.value;
                r.size <= t.maximum || n.issues.push({
                    origin: ey(r),
                    code: "too_big",
                    maximum: t.maximum,
                    inclusive: !0,
                    input: r,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        nE = o("$ZodCheckMinSize", (e, t) => {
            var n;
            nz.init(e, t), null != (n = e._zod.def).when || (n.when = nU), e._zod.check = n => {
                let r = n.value;
                r.size >= t.minimum || n.issues.push({
                    origin: ey(r),
                    code: "too_small",
                    minimum: t.minimum,
                    inclusive: !0,
                    input: r,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        nC = o("$ZodCheckSizeEquals", (e, t) => {
            var n;
            nz.init(e, t), null != (n = e._zod.def).when || (n.when = nU), e._zod.check = n => {
                let r = n.value,
                    i = r.size;
                if (i === t.size) return;
                let a = i > t.size;
                n.issues.push({
                    origin: ey(r),
                    ...a ? {
                        code: "too_big",
                        maximum: t.size
                    } : {
                        code: "too_small",
                        minimum: t.size
                    },
                    inclusive: !0,
                    exact: !0,
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        n$ = o("$ZodCheckMaxLength", (e, t) => {
            var n;
            nz.init(e, t), null != (n = e._zod.def).when || (n.when = nA), e._zod.check = n => {
                let r = n.value,
                    i = r.length;
                if (("string" == typeof r && i > t.maximum ? ew(r) : i) <= t.maximum) return;
                let a = ek(r);
                n.issues.push({
                    origin: a,
                    code: "too_big",
                    maximum: t.maximum,
                    inclusive: !0,
                    input: r,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        nL = o("$ZodCheckMinLength", (e, t) => {
            var n;
            nz.init(e, t), null != (n = e._zod.def).when || (n.when = nA), e._zod.check = n => {
                let r = n.value,
                    i = r.length;
                if (("string" == typeof r && i >= t.minimum && i < 2 * t.minimum ? ew(r) : i) >= t.minimum) return;
                let a = ek(r);
                n.issues.push({
                    origin: a,
                    code: "too_small",
                    minimum: t.minimum,
                    inclusive: !0,
                    input: r,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        nR = o("$ZodCheckLengthEquals", (e, t) => {
            var n;
            nz.init(e, t), null != (n = e._zod.def).when || (n.when = nA), e._zod.check = n => {
                let r = n.value,
                    i = r.length,
                    a = "string" == typeof r && i >= t.length && i <= 2 * t.length ? ew(r) : i;
                if (a === t.length) return;
                let o = ek(r),
                    c = a > t.length;
                n.issues.push({
                    origin: o,
                    ...c ? {
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
        nG = o("$ZodCheckStringFormat", (e, t) => {
            var n, r;
            nz.init(e, t), t.pattern ? null != (n = e._zod).check || (n.check = n => {
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
        nJ = o("$ZodCheckRegex", (e, t) => {
            nG.init(e, t), e._zod.check = n => {
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
        nB = o("$ZodCheckLowerCase", (e, t) => {
            null != t.pattern || (t.pattern = tk), nG.init(e, t)
        }),
        nM = o("$ZodCheckUpperCase", (e, t) => {
            null != t.pattern || (t.pattern = tx), nG.init(e, t)
        }),
        nF = o("$ZodCheckIncludes", (e, t) => {
            nz.init(e, t);
            let n = H(t.includes),
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
        nV = o("$ZodCheckStartsWith", (e, t) => {
            nz.init(e, t);
            let n = new RegExp("^".concat(H(t.prefix), ".*"));
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
        nq = o("$ZodCheckEndsWith", (e, t) => {
            nz.init(e, t);
            let n = new RegExp(".*".concat(H(t.suffix), "$"));
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
        });

    function nK(e, t, n) {
        e.issues.length && t.issues.push(...eg(n, e.issues))
    }
    let nW = o("$ZodCheckProperty", (e, t) => {
            nz.init(e, t), e._zod.check = e => {
                let n = t.schema._zod.run({
                    value: e.value[t.property],
                    issues: []
                }, {});
                if (n instanceof Promise) return n.then(n => nK(n, e, t.property));
                nK(n, e, t.property)
            }
        }),
        nX = o("$ZodCheckProperties", (e, t) => {
            let n;
            nz.init(e, t), eE(e, Symbol.iterator, function*() {
                yield e
            }), e._zod.check = r => {
                let i;
                if (null == r.value) return void r.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: r.value,
                    inst: e
                });
                null != n || (n = Reflect.ownKeys(t.shape).map(e => [e, t.shape[e]]));
                let a = r.value;
                for (let [e, t] of n) {
                    let n = t._zod.run({
                        value: a[e],
                        issues: []
                    }, {});
                    n instanceof Promise ? (null != i || (i = []), i.push(n.then(t => nK(t, r, e)))) : nK(n, r, e)
                }
                if (i) return Promise.all(i).then(() => void 0)
            }
        }),
        nH = o("$ZodCheckMimeType", (e, t) => {
            nz.init(e, t);
            let n = new Set(t.mime);
            e._zod.check = r => {
                n.has(r.value.type) || r.issues.push({
                    code: "invalid_value",
                    values: t.mime,
                    input: r.value.type,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        nY = o("$ZodCheckOverwrite", (e, t) => {
            nz.init(e, t), e._zod.check = e => {
                e.value = t.tx(e.value)
            }
        });
    e.s(["$ZodCheck", 0, nz, "$ZodCheckBigIntFormat", 0, nZ, "$ZodCheckEndsWith", 0, nq, "$ZodCheckGreaterThan", 0, nN, "$ZodCheckIncludes", 0, nF, "$ZodCheckLengthEquals", 0, nR, "$ZodCheckLessThan", 0, nP, "$ZodCheckLowerCase", 0, nB, "$ZodCheckMaxLength", 0, n$, "$ZodCheckMaxSize", 0, nT, "$ZodCheckMimeType", 0, nH, "$ZodCheckMinLength", 0, nL, "$ZodCheckMinSize", 0, nE, "$ZodCheckMultipleOf", 0, nO, "$ZodCheckNumberFormat", 0, nj, "$ZodCheckOverwrite", 0, nY, "$ZodCheckProperties", 0, nX, "$ZodCheckProperty", 0, nW, "$ZodCheckRegex", 0, nJ, "$ZodCheckSizeEquals", 0, nC, "$ZodCheckStartsWith", 0, nV, "$ZodCheckStringFormat", 0, nG, "$ZodCheckUpperCase", 0, nM], 862359);
    class nQ {
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
    e.s(["Doc", 0, nQ], 664508);
    let n0 = {
        major: 4,
        minor: 6,
        patch: 5
    };
    e.s(["version", 0, n0], 409437);
    let n4 = o("$ZodType", (e, t) => {
            var n, r;
            null != e || (e = {}), e._zod.def = t, e._zod.bag = e._zod.bag || {}, e._zod.version = n0;
            let i = e._zod.def.checks,
                a = e._zod.traits.has("$ZodCheck") ? [e, ...null != i ? i : []] : (null == i ? void 0 : i.length) ? [...i] : [];
            for (let t of a)
                for (let n of t._zod.onattach) n(e);
            if (0 === a.length) null != (n = e._zod).deferred || (n.deferred = []), null == (r = e._zod.deferred) || r.push(() => {
                e._zod.run = e._zod.parse
            });
            else {
                let t = (t, n, r) => {
                        let i;
                        if (t.memo) return t;
                        let a = ev(t);
                        for (let o of n) {
                            if (o._zod.def.when) {
                                if (ep(t) || !o._zod.def.when(t)) continue
                            } else if (a) continue;
                            let n = t.issues.length,
                                c = o._zod.check(t);
                            if (c instanceof Promise && (null == r ? void 0 : r.async) === !1) throw new u;
                            if (i || c instanceof Promise) i = (null != i ? i : Promise.resolve()).then(async () => {
                                await c, t.issues.length !== n && (e_(t.issues, n, e), a || (a = ev(t, n)))
                            });
                            else {
                                if (t.issues.length === n) continue;
                                e_(t.issues, n, e), a || (a = ev(t, n))
                            }
                        }
                        return i ? i.then(() => t) : t
                    },
                    n = (n, r, i) => {
                        if (ev(n)) return n.aborted = !0, n;
                        let o = t(r, a, i);
                        if (o instanceof Promise) {
                            if (!1 === i.async) throw new u;
                            return o.then(t => e._zod.parse(t, i))
                        }
                        return e._zod.parse(o, i)
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
                    let o = e._zod.parse(r, i);
                    if (o instanceof Promise) {
                        if (!1 === i.async) throw new u;
                        return o.then(e => t(e, a, i))
                    }
                    return t(o, a, i)
                }
            }
        }, {
            get "~standard"() {
                return eE(this, "~standard", n2(this))
            },
            set "~standard"(e) {
                eT(this, "~standard", e)
            }
        }),
        n1 = (e, t) => e.issues.length ? {
            issues: e.issues.map(e => eb(e, t, d()))
        } : {
            value: e.value
        };
    async function n6(e, t) {
        let n = {
            async: !0
        };
        return n1(await e._zod.run({
            value: t,
            issues: []
        }, n), n)
    }

    function n2(e) {
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
                    if (!(r instanceof Promise)) return n1(r, n)
                } catch (e) {}
                return n6(e, t)
            },
            vendor: "zod",
            version: 1
        }
    }
    let n5 = o("$ZodString", (e, t) => {
            var n;
            n4.init(e, t), e._zod.pattern = null != (n = t.pattern) ? n : tp, e._zod.parse = (n, r) => {
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
        n3 = o("$ZodStringFormat", (e, t) => {
            nG.init(e, t), n5.init(e, t)
        }),
        n9 = o("$ZodGUID", (e, t) => {
            null != t.pattern || (t.pattern = e4), n3.init(e, t)
        }),
        n8 = o("$ZodUUID", (e, t) => {
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
                null != t.pattern || (t.pattern = e1(e))
            } else null != t.pattern || (t.pattern = e1());
            n3.init(e, t)
        }),
        n7 = o("$ZodEmail", (e, t) => {
            null != t.pattern || (t.pattern = e3), n3.init(e, t)
        });

    function re(e) {
        try {
            if ("u" > typeof URL && "function" == typeof URL.canParse) return URL.canParse(e);
            return new URL(e), !0
        } catch (e) {
            return !1
        }
    }

    function rt(e, t) {
        return "normalize" in t || "hostname" in t || "protocol" in t ? rn(e, t) : re(e) || 2
    }

    function rn(e, t) {
        var n, r;
        if (!t.normalize && (null == (n = t.protocol) ? void 0 : n.source) === to.source && !/^https?:\/\//i.test(e)) return 1;
        try {
            if ("u" > typeof URL) {
                let t = URL;
                if ("function" == typeof t.parse) return null != (r = t.parse(e)) ? r : 2
            }
            return new URL(e)
        } catch (e) {
            return 2
        }
    }
    let rr = /[\t\n\r]/g;

    function ri(e) {
        return e.replace(rr, "")
    }

    function ra(e, t) {
        return t.lastIndex = 0, t.test(e.hostname)
    }

    function ro(e, t) {
        return t.lastIndex = 0, t.test(e.protocol.endsWith(":") ? e.protocol.slice(0, -1) : e.protocol)
    }
    let rc = o("$ZodURL", (e, t) => {
            n3.init(e, t), e._zod.check = n => {
                try {
                    let r = n.value.trim(),
                        i = rt(r, t);
                    if (1 === i) return void n.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid URL format",
                        input: n.value,
                        inst: e,
                        continue: !t.abort
                    });
                    if (2 === i) return void n.issues.push({
                        code: "invalid_format",
                        format: "url",
                        input: n.value,
                        inst: e,
                        continue: !t.abort
                    });
                    if (!0 === i) {
                        n.value = ri(r);
                        return
                    }
                    t.hostname && !ra(i, t.hostname) && n.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid hostname",
                        pattern: t.hostname.source,
                        input: n.value,
                        inst: e,
                        continue: !t.abort
                    }), t.protocol && !ro(i, t.protocol) && n.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid protocol",
                        pattern: t.protocol.source,
                        input: n.value,
                        inst: e,
                        continue: !t.abort
                    }), n.value = t.normalize ? i.href : ri(r);
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
        ru = o("$ZodEmoji", (e, t) => {
            null != t.pattern || (t.pattern = e8()), n3.init(e, t)
        }),
        rl = o("$ZodNanoID", (e, t) => {
            if (void 0 !== t.length && (!Number.isInteger(t.length) || t.length < 1)) throw Error("Invalid nanoid length: ".concat(t.length));
            null != t.pattern || (t.pattern = void 0 === t.length ? eY : eQ(t.length)), n3.init(e, t)
        }),
        rs = o("$ZodCUID", (e, t) => {
            null != t.pattern || (t.pattern = eq), n3.init(e, t)
        }),
        rd = o("$ZodCUID2", (e, t) => {
            null != t.pattern || (t.pattern = eK), n3.init(e, t)
        }),
        rm = o("$ZodULID", (e, t) => {
            null != t.pattern || (t.pattern = eW), n3.init(e, t)
        }),
        rf = o("$ZodXID", (e, t) => {
            null != t.pattern || (t.pattern = eX), n3.init(e, t)
        }),
        rv = o("$ZodKSUID", (e, t) => {
            null != t.pattern || (t.pattern = eH), n3.init(e, t)
        }),
        rp = o("$ZodISODateTime", (e, t) => {
            null != t.pattern || (t.pattern = tv(t)), n3.init(e, t)
        }),
        rg = o("$ZodISODate", (e, t) => {
            null != t.pattern || (t.pattern = td), n3.init(e, t)
        }),
        rh = o("$ZodISOTime", (e, t) => {
            null != t.pattern || (t.pattern = tf(t)), n3.init(e, t)
        }),
        r_ = o("$ZodISODuration", (e, t) => {
            null != t.pattern || (t.pattern = e0), n3.init(e, t)
        }),
        rb = o("$ZodIPv4", (e, t) => {
            null != t.pattern || (t.pattern = e7), n3.init(e, t)
        }),
        ry = /^[0-9a-fA-F:.]+$/;

    function rI(e) {
        return !!ry.test(e) && re("http://[".concat(e, "]"))
    }
    let rw = o("$ZodIPv6", (e, t) => {
            null != t.pattern || (t.pattern = te), n3.init(e, t), e._zod.check = n => {
                rI(n.value) || n.issues.push({
                    code: "invalid_format",
                    format: "ipv6",
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        rk = o("$ZodMAC", (e, t) => {
            null != t.pattern || (t.pattern = tt(t.delimiter)), n3.init(e, t)
        }),
        rx = o("$ZodCIDRv4", (e, t) => {
            null != t.pattern || (t.pattern = tn), n3.init(e, t)
        });

    function rS(e) {
        let t = e.split("/");
        if (2 !== t.length) return !1;
        let [n, r] = t;
        if (!r) return !1;
        let i = Number(r);
        return "".concat(i) === r && !(i < 0) && !(i > 128) && rI(n)
    }
    let rz = o("$ZodCIDRv6", (e, t) => {
        null != t.pattern || (t.pattern = tr), n3.init(e, t), e._zod.check = n => {
            rS(n.value) || n.issues.push({
                code: "invalid_format",
                format: "cidrv6",
                input: n.value,
                inst: e,
                continue: !t.abort
            })
        }
    });

    function rU(e) {
        if ("" === e) return !0;
        if (/\s/.test(e) || e.length % 4 != 0) return !1;
        try {
            return atob(e), !0
        } catch (e) {
            return !1
        }
    }
    let rA = /^[0-9a-zA-Z+/]*={0,2}$/,
        rD = o("$ZodBase64", (e, t) => {
            null != t.pattern || (t.pattern = rA), n3.init(e, t), e._zod.check = n => {
                rU(n.value) || n.issues.push({
                    code: "invalid_format",
                    format: "base64",
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        rP = /^[A-Za-z0-9_-]*$/;

    function rN(e) {
        if (!rP.test(e)) return !1;
        let t = e.replace(/[-_]/g, e => "-" === e ? "+" : "/");
        return rU(t.padEnd(4 * Math.ceil(t.length / 4), "="))
    }
    let rO = o("$ZodBase64URL", (e, t) => {
            null != t.pattern || (t.pattern = rP), n3.init(e, t), e._zod.check = n => {
                rN(n.value) || n.issues.push({
                    code: "invalid_format",
                    format: "base64url",
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        rj = o("$ZodE164", (e, t) => {
            null != t.pattern || (t.pattern = tc), n3.init(e, t)
        }),
        rZ = /[- ]/g;

    function rT(e) {
        return !!tu.test(e) && function(e) {
            let t = e.length,
                n = 1,
                r = 0;
            for (; t;) {
                let i = e.charCodeAt(--t) - 48;
                n ^= 1, r += n ? [0, 2, 4, 6, 8, 1, 3, 5, 7, 9][i] : i
            }
            return r % 10 == 0
        }(e.replace(rZ, ""))
    }
    let rE = o("$ZodCreditCard", (e, t) => {
        null != t.pattern || (t.pattern = tu), n3.init(e, t), e._zod.check = n => {
            rT(n.value) || n.issues.push({
                code: "invalid_format",
                format: "credit_card",
                input: n.value,
                inst: e,
                continue: !t.abort
            })
        }
    });

    function rC(e) {
        return !!tl.test(e) && function(e) {
            let t = 0,
                n = e.length;
            for (let r = 4; r < n; r++) {
                let n = e.charCodeAt(r);
                t = (n >= 65 ? 100 * t + (n - 55) : 10 * t + (n - 48)) % 97
            }
            for (let n = 0; n < 4; n++) {
                let r = e.charCodeAt(n);
                t = (r >= 65 ? 100 * t + (r - 55) : 10 * t + (r - 48)) % 97
            }
            return 1 === t
        }(e)
    }
    let r$ = o("$ZodIBAN", (e, t) => {
        null != t.pattern || (t.pattern = tl), n3.init(e, t), e._zod.check = n => {
            rC(n.value) || n.issues.push({
                code: "invalid_format",
                format: "iban",
                input: n.value,
                inst: e,
                continue: !t.abort
            })
        }
    });

    function rL(e) {
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
    }
    let rR = o("$ZodJWT", (e, t) => {
            n3.init(e, t), e._zod.check = n => {
                rL(n.value, t.alg) || n.issues.push({
                    code: "invalid_format",
                    format: "jwt",
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        rG = o("$ZodCustomStringFormat", (e, t) => {
            n3.init(e, t), e._zod.check = n => {
                t.fn(n.value) || n.issues.push({
                    code: "invalid_format",
                    format: t.format,
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        rJ = o("$ZodNumber", (e, t) => {
            n4.init(e, t), e._zod.pattern = tb, e._zod.parse = (n, r) => {
                if (t.coerce) try {
                    n.value = Number(n.value)
                } catch (e) {}
                let i = n.value;
                if ("number" == typeof i && !Number.isNaN(i) && Number.isFinite(i)) return n;
                let a = "number" == typeof i ? Number.isNaN(i) ? "NaN" : Number.isFinite(i) ? void 0 : String(i) : void 0;
                return n.issues.push({
                    expected: "number",
                    code: "invalid_type",
                    input: i,
                    inst: e,
                    ...a ? {
                        received: a
                    } : {}
                }), n
            }
        }),
        rB = o("$ZodNumberFormat", (e, t) => {
            nj.init(e, t), rJ.init(e, t)
        }),
        rM = o("$ZodBoolean", (e, t) => {
            n4.init(e, t), e._zod.pattern = ty, e._zod.parse = (n, r) => {
                if (t.coerce) try {
                    n.value = !!n.value
                } catch (e) {}
                let i = n.value;
                return "boolean" == typeof i || n.issues.push({
                    expected: "boolean",
                    code: "invalid_type",
                    input: i,
                    inst: e
                }), n
            }
        }),
        rF = o("$ZodBigInt", (e, t) => {
            n4.init(e, t), e._zod.pattern = th, e._zod.parse = (n, r) => {
                if (t.coerce) try {
                    n.value = BigInt(n.value)
                } catch (e) {}
                return "bigint" == typeof n.value || n.issues.push({
                    expected: "bigint",
                    code: "invalid_type",
                    input: n.value,
                    inst: e
                }), n
            }
        }),
        rV = o("$ZodBigIntFormat", (e, t) => {
            nZ.init(e, t), rF.init(e, t)
        }),
        rq = o("$ZodSymbol", (e, t) => {
            n4.init(e, t), e._zod.parse = (t, n) => {
                let r = t.value;
                return "symbol" == typeof r || t.issues.push({
                    expected: "symbol",
                    code: "invalid_type",
                    input: r,
                    inst: e
                }), t
            }
        }),
        rK = o("$ZodUndefined", (e, t) => {
            n4.init(e, t), e._zod.pattern = tw, e._zod.values = new Set([void 0]), e._zod.parse = (t, n) => {
                let r = t.value;
                return void 0 === r || t.issues.push({
                    expected: "undefined",
                    code: "invalid_type",
                    input: r,
                    inst: e
                }), t
            }
        }),
        rW = o("$ZodNull", (e, t) => {
            n4.init(e, t), e._zod.pattern = tI, e._zod.values = new Set([null]), e._zod.parse = (t, n) => {
                let r = t.value;
                return null === r || t.issues.push({
                    expected: "null",
                    code: "invalid_type",
                    input: r,
                    inst: e
                }), t
            }
        }),
        rX = o("$ZodAny", (e, t) => {
            n4.init(e, t), e._zod.parse = e => e
        }),
        rH = o("$ZodUnknown", (e, t) => {
            n4.init(e, t), e._zod.parse = e => e
        }),
        rY = o("$ZodNever", (e, t) => {
            n4.init(e, t), e._zod.parse = (t, n) => (t.issues.push({
                expected: "never",
                code: "invalid_type",
                input: t.value,
                inst: e
            }), t)
        }),
        rQ = o("$ZodVoid", (e, t) => {
            n4.init(e, t), e._zod.parse = (t, n) => {
                let r = t.value;
                return void 0 === r || t.issues.push({
                    expected: "void",
                    code: "invalid_type",
                    input: r,
                    inst: e
                }), t
            }
        }),
        r0 = o("$ZodDate", (e, t) => {
            n4.init(e, t), e._zod.parse = (n, r) => {
                if (t.coerce) try {
                    n.value = new Date(n.value)
                } catch (e) {}
                let i = n.value,
                    a = i instanceof Date;
                return a && !Number.isNaN(i.getTime()) || n.issues.push({
                    expected: "date",
                    code: "invalid_type",
                    input: i,
                    ...a ? {
                        received: "Invalid Date"
                    } : {},
                    inst: e
                }), n
            }
        });

    function r4(e, t, n) {
        e.issues.length && t.issues.push(...eg(n, e.issues)), t.value[n] = e.value
    }
    let r1 = o("$ZodArray", (e, t) => {
        n4.init(e, t);
        let n = s.memoizer;
        null == n || n.attach(e), e._zod.parse = (r, i) => {
            let a = r.value;
            if (!Array.isArray(a)) return r.issues.push({
                expected: "array",
                code: "invalid_type",
                input: a,
                inst: e
            }), r;
            r.value = n ? n.alloc(e, r, Array(a.length), i) : Array(a.length);
            let o = [],
                c = null == i ? void 0 : i.abortEarly;
            for (let e = 0; e < a.length; e++) {
                let n = a[e],
                    u = t.element._zod.run({
                        value: n,
                        issues: []
                    }, i);
                if (u instanceof Promise) o.push(u.then(t => r4(t, r, e)));
                else if (r4(u, r, e), c && 0 !== u.issues.length && ev(u)) break
            }
            return o.length ? Promise.all(o).then(() => r) : r
        }
    });

    function r6(e, t, n, r, i, a) {
        let o = n in r,
            c = "optional" === a;
        if (o || !c || "optional" !== i) {
            if (e.issues.length) {
                if (void 0 !== i && c && !o) return;
                t.issues.push(...eg(n, e.issues))
            }
            if (!o && void 0 === i) {
                e.issues.length || t.issues.push({
                    code: "invalid_type",
                    expected: "nonoptional",
                    input: void 0,
                    path: [n]
                });
                return
            }
            void 0 === e.value ? (o || "defaulted" === i && !c) && (t.value[n] = void 0) : t.value[n] = e.value
        }
    }
    let r2 = [];

    function r5(e) {
        let t = Object.keys(e.shape),
            n = Object.getOwnPropertySymbols(e.shape),
            r = n.length ? n : r2,
            i = r.length ? [...t, ...r] : t;
        for (let t of i) {
            var a, o, c, u;
            if (!(null == (u = e.shape) || null == (c = u[t]) || null == (o = c._zod) || null == (a = o.traits) ? void 0 : a.has("$ZodType"))) throw Error('Invalid element at key "'.concat(String(t), '": expected a Zod schema'))
        }
        let l = en(e.shape);
        return {
            ...e,
            allKeys: i,
            symbolKeys: r,
            keySet: new Set(t),
            numKeys: t.length,
            optionalKeys: new Set(l)
        }
    }

    function r3(e, t, n, r, i, a, o) {
        let c = [],
            u = i.keySet,
            l = i.catchall._zod,
            s = l.def.type,
            d = l.optin,
            m = l.optout,
            f = 0;
        for (let i in t) {
            if (o && n.issues.length !== f) {
                if (ev(n, f)) break;
                f = n.issues.length
            }
            if (u.has(i)) continue;
            if ("__proto__" === i) {
                "never" === s && c.push(i);
                continue
            }
            if ("never" === s) {
                c.push(i);
                continue
            }
            let a = l.run({
                value: t[i],
                issues: []
            }, r);
            a instanceof Promise ? e.push(a.then(e => r6(e, n, i, t, d, m))) : r6(a, n, i, t, d, m)
        }
        return (c.length && n.issues.push({
            code: "unrecognized_keys",
            keys: c,
            input: t,
            inst: a,
            continue: !0
        }), e.length) ? Promise.all(e).then(() => n) : n
    }
    let r9 = o("$ZodObject", (e, t) => {
            var n;
            let r;
            n4.init(e, t);
            let i = Object.getOwnPropertyDescriptor(t, "shape"),
                a = (null == i ? void 0 : i.get) ? i.get.raw : null != (n = t.shape) ? n : {};
            if (a) {
                let e = () => {
                    let n = {
                        ...a
                    };
                    return Object.defineProperty(t, "shape", {
                        value: n
                    }), e.raw = n, n
                };
                e.raw = a, Object.defineProperty(t, "shape", {
                    get: e
                })
            }
            let o = w(() => r5(t));
            eR(e, "propValues", e => {
                let t = e.def.shape,
                    n = {};
                for (let e in t) {
                    let r = t[e]._zod;
                    if (r.values) {
                        for (let t of (Object.prototype.hasOwnProperty.call(n, e) || D(n, e, new Set), r.values)) n[e].add(t);
                        void 0 !== r.optin && n[e].add(void 0)
                    }
                }
                return n
            });
            let c = t.catchall,
                u = s.memoizer;
            null == u || u.attach(e), e._zod.parse = (t, n) => {
                null != r || (r = o.value);
                let i = t.value;
                if (!B(i)) return t.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: i,
                    inst: e
                }), t;
                t.value = u ? u.alloc(e, t, {}, n) : {};
                let a = [],
                    l = r.shape,
                    s = null == n ? void 0 : n.abortEarly,
                    d = t.issues.length;
                for (let e of r.allKeys) {
                    if (s && t.issues.length !== d) {
                        if (ev(t, d)) break;
                        d = t.issues.length
                    }
                    if ("__proto__" === e) continue;
                    let r = l[e],
                        o = r._zod.optin,
                        c = r._zod.optout,
                        u = r._zod.run({
                            value: i[e],
                            issues: []
                        }, n);
                    u instanceof Promise ? a.push(u.then(n => r6(n, t, e, i, o, c))) : r6(u, t, e, i, o, c)
                }
                return c ? r3(a, i, t, n, o.value, e, !0 === s) : a.length ? Promise.all(a).then(() => t) : t
            }
        }),
        r8 = o("$ZodObjectJIT", (e, t) => {
            let n, r;
            r9.init(e, t);
            let i = e._zod.parse,
                a = w(() => r5(t)),
                o = s.memoizer,
                c = !s.jitless,
                u = c && M.value,
                l = t.catchall;
            e._zod.parse = (s, d) => {
                null != r || (r = a.value);
                let m = s.value;
                return B(m) ? c && u && (null == d ? void 0 : d.async) === !1 && !0 !== d.jitless ? (n || (n = (t => {
                    let n = a.value,
                        r = n.symbolKeys,
                        i = new nQ(["payload", "ctx"], {
                            shape: t,
                            inst: e,
                            memo: o,
                            syms: r
                        }),
                        c = e => "shape[".concat(e, "]._zod.run({ value: input[").concat(e, "], issues: [] }, ctx)"),
                        u = (e, t) => "\n          let ".concat(e, "_ab = false;\n          for (let i = 0; i < ").concat(e, ".issues.length; i++) {\n            const iss = ").concat(e, ".issues[i];\n            iss.path = iss.path ? [").concat(t, ", ...iss.path] : [").concat(t, "];\n            payload.issues.push(iss);\n            if (iss.continue !== true) ").concat(e, "_ab = true;\n          }\n          if (").concat(e, "_ab && ctx && ctx.abortEarly) {\n            payload.value = newResult;\n            return payload;\n          }");
                    i.write("const input = payload.value;");
                    let l = Object.create(null),
                        s = 0;
                    for (let e of n.allKeys) l[e] = "key_".concat(s++);
                    for (let e of (i.write(o ? "const newResult = memo.alloc(inst, payload, {}, ctx);" : "const newResult = {};"), n.allKeys)) {
                        var d, m;
                        if ("__proto__" === e) continue;
                        let n = l[e],
                            a = "symbol" == typeof e ? "syms[".concat(r.indexOf(e), "]") : R(e),
                            o = "".concat(a, " in input"),
                            s = t[e],
                            f = null == s || null == (d = s._zod) ? void 0 : d.optin,
                            v = void 0 !== f,
                            p = (null == s || null == (m = s._zod) ? void 0 : m.optout) === "optional";
                        if (i.write("const ".concat(n, " = ").concat(c(a), ";")), v && p) {
                            let e = "optional" === f ? "".concat(n, "_present") : "".concat(n, ".value !== undefined || ").concat(n, "_present");
                            i.write("\n        const ".concat(n, "_present = ").concat(o, ";\n        if (!").concat(n, ".issues.length || ").concat(n, "_present) {\n          if (").concat(n, ".issues.length) {").concat(u(n, a), "\n          }\n\n          if (").concat(e, ") {\n            newResult[").concat(a, "] = ").concat(n, ".value;\n          }\n        }\n\n      "))
                        } else v ? (i.write("\n        if (".concat(n, ".issues.length) {").concat(u(n, a), "\n        }\n      ")), "defaulted" === f ? i.write("newResult[".concat(a, "] = ").concat(n, ".value;")) : i.write("\n        if (".concat(n, ".value !== undefined || ").concat(o, ") {\n          newResult[").concat(a, "] = ").concat(n, ".value;\n        }\n      "))) : i.write("\n        const ".concat(n, "_present = ").concat(o, ";\n        if (").concat(n, ".issues.length) {").concat(u(n, a), "\n        }\n        if (!").concat(n, "_present && !").concat(n, '.issues.length) {\n          payload.issues.push({\n            code: "invalid_type",\n            expected: "nonoptional",\n            input: undefined,\n            path: [').concat(a, "]\n          });\n          if (ctx && ctx.abortEarly) {\n            payload.value = newResult;\n            return payload;\n          }\n        }\n\n        if (").concat(n, "_present) {\n          newResult[").concat(a, "] = ").concat(n, ".value;\n        }\n\n      "))
                    }
                    return i.write("payload.value = newResult;"), i.write("return payload;"), i.compile()
                })(t.shape)), s = n(s, d), l) ? r3([], m, s, d, r, e, (null == d ? void 0 : d.abortEarly) === !0) : s : i(s, d) : (s.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: m,
                    inst: e
                }), s)
            }
        });

    function r7(e, t, n, r) {
        for (let n of e)
            if (0 === n.issues.length) return t.value = n.value, t;
        let i = e.filter(e => !ev(e));
        return 1 === i.length ? (t.value = i[0].value, i[0]) : (t.issues.push({
            code: "invalid_union",
            input: t.value,
            inst: n,
            errors: e.map(e => e.issues.map(e => eb(e, r, d())))
        }), t)
    }
    let ie = o("$ZodUnion", (e, t) => {
        n4.init(e, t), eR(e, "optin", e => e.def.options.some(e => "defaulted" === e._zod.optin) ? "defaulted" : e.def.options.some(e => void 0 !== e._zod.optin) ? "optional" : void 0), eR(e, "optout", e => e.def.options.some(e => "optional" === e._zod.optout) ? "optional" : void 0), eR(e, "values", e => {
            if (e.def.options.every(e => e._zod.values)) return new Set(e.def.options.flatMap(e => Array.from(e._zod.values)))
        }), eR(e, "pattern", e => {
            if (e.def.options.every(e => e._zod.pattern)) {
                let t = e.def.options.map(e => e._zod.pattern);
                return new RegExp("^(".concat(t.map(e => x(e.source)).join("|"), ")$"))
            }
        });
        let n = 1 === t.options.length ? t.options[0]._zod.run : null;
        e._zod.parse = (r, i) => {
            if (n) return n(r, i);
            let a = !1,
                o = [];
            for (let e of t.options) {
                let t = e._zod.run({
                    value: r.value,
                    issues: []
                }, i);
                if (t instanceof Promise) o.push(t), a = !0;
                else {
                    if (0 === t.issues.length) return t;
                    o.push(t)
                }
            }
            return a ? Promise.all(o).then(t => r7(t, r, e, i)) : r7(o, r, e, i)
        }
    });

    function it(e, t, n, r) {
        let i = [];
        for (let t = 0; t < e.length; t++) 0 === e[t].issues.length && i.push(t);
        return 1 === i.length ? t.value = e[i[0]].value : 0 === i.length ? t.issues.push({
            code: "invalid_union",
            input: t.value,
            inst: n,
            errors: e.map(e => e.issues.map(e => eb(e, r, d())))
        }) : t.issues.push({
            code: "invalid_union",
            input: t.value,
            inst: n,
            errors: [],
            inclusive: !1,
            matches: i
        }), t
    }
    let ir = o("$ZodXor", (e, t) => {
        ie.init(e, t), t.inclusive = !1;
        let n = 1 === t.options.length ? t.options[0]._zod.run : null;
        e._zod.parse = (r, i) => {
            if (n) return n(r, i);
            let a = !1,
                o = [];
            for (let e of t.options) {
                let t = e._zod.run({
                    value: r.value,
                    issues: []
                }, i);
                t instanceof Promise ? (o.push(t), a = !0) : o.push(t)
            }
            return a ? Promise.all(o).then(t => it(t, r, e, i)) : it(o, r, e, i)
        }
    });

    function ii(e, t) {
        let n = e._zod,
            r = n.bag.optionsMap;
        r || (r = ia(n.def), n.bag.optionsMap = r);
        let i = r.get(t);
        if (null === i) throw Error('Ambiguous discriminator value "'.concat(String(t), '"'));
        return i
    }

    function ia(e) {
        let t = new Map;
        for (let r of e.options) {
            var n;
            let i = null == (n = r._zod.propValues) ? void 0 : n[e.discriminator];
            if (!i || 0 === i.size) throw Error('Invalid discriminated union option at index "'.concat(e.options.indexOf(r), '"'));
            for (let e of i)
                if (t.has(e)) {
                    if (void 0 !== e) throw Error('Duplicate discriminator value "'.concat(String(e), '"'));
                    t.set(e, null)
                } else t.set(e, r)
        }
        return t
    }
    let io = o("$ZodDiscriminatedUnion", (e, t) => {
            t.inclusive = !1, ie.init(e, t);
            let n = e._zod.parse;
            eR(e, "propValues", e => {
                var t, n;
                let r = {},
                    i = 0;
                for (let t of e.def.options) {
                    let a = t._zod.propValues;
                    if (!a || 0 === Object.keys(a).length) throw Error('Invalid discriminated union option at index "'.concat(e.def.options.indexOf(t), '"'));
                    for (let [t, o] of((null == (n = a[e.def.discriminator]) ? void 0 : n.has(void 0)) && i++, Object.entries(a)))
                        for (let e of (Object.prototype.hasOwnProperty.call(r, t) || D(r, t, new Set), o)) r[t].add(e)
                }
                return !e.def.unionFallback && i > 1 && (null == (t = r[e.def.discriminator]) || t.delete(void 0)), r
            }), t.options.forEach((e, n) => {
                let r = P(e._zod.def);
                if (r && !Object.prototype.hasOwnProperty.call(r, t.discriminator)) throw Error('Invalid discriminated union option at index "'.concat(n, '"'))
            });
            let r = w(() => ia(t));
            e._zod.parse = (i, a) => {
                let o = i.value;
                if (!B(o)) return i.issues.push({
                    code: "invalid_type",
                    expected: "object",
                    input: o,
                    inst: e
                }), i;
                let c = null == o ? void 0 : o[t.discriminator],
                    u = r.value.get(c);
                return u && (void 0 !== c || "backward" !== a.direction) ? u._zod.run(i, a) : t.unionFallback || "backward" === a.direction ? n(i, a) : (i.issues.push({
                    code: "invalid_union",
                    errors: [],
                    note: "No matching discriminator",
                    discriminator: t.discriminator,
                    options: Array.from(r.value.keys()).filter(e => null !== r.value.get(e)),
                    input: o,
                    path: [t.discriminator],
                    inst: e
                }), i)
            }
        }),
        ic = o("$ZodIntersection", (e, t) => {
            n4.init(e, t), e._zod.parse = (e, n) => {
                let r = e.value,
                    i = t.left._zod.run({
                        value: r,
                        issues: []
                    }, n),
                    a = t.right._zod.run({
                        value: r,
                        issues: []
                    }, n);
                return i instanceof Promise || a instanceof Promise ? Promise.all([i, a]).then(t => {
                    let [n, r] = t;
                    return il(e, n, r)
                }) : il(e, i, a)
            }
        });

    function iu(e, t) {
        if (e === t || e instanceof Date && t instanceof Date && +e == +t) return {
            valid: !0,
            data: e
        };
        if (F(e) && F(t)) {
            let n = Object.keys(t),
                r = Object.keys(e).filter(e => -1 !== n.indexOf(e)),
                i = {
                    ...e,
                    ...t
                };
            for (let n of (Object.prototype.hasOwnProperty.call(i, "__proto__") && delete i.__proto__, r)) {
                if ("__proto__" === n) continue;
                let r = iu(e[n], t[n]);
                if (!r.valid) return {
                    valid: !1,
                    mergeErrorPath: [n, ...r.mergeErrorPath]
                };
                i[n] = r.data
            }
            return {
                valid: !0,
                data: i
            }
        }
        if (Array.isArray(e) && Array.isArray(t)) {
            if (e.length !== t.length) return {
                valid: !1,
                mergeErrorPath: []
            };
            let n = [];
            for (let r = 0; r < e.length; r++) {
                let i = iu(e[r], t[r]);
                if (!i.valid) return {
                    valid: !1,
                    mergeErrorPath: [r, ...i.mergeErrorPath]
                };
                n.push(i.data)
            }
            return {
                valid: !0,
                data: n
            }
        }
        return {
            valid: !1,
            mergeErrorPath: []
        }
    }

    function il(e, t, n) {
        let r, i = new Map,
            a = new Map,
            o = (e, t) => {
                var n, o;
                let c;
                if ("unrecognized_keys" !== e.code || (null == (n = e.path) ? void 0 : n.length))
                    if ("invalid_key" !== e.code || "record" !== e.origin || (null == (o = e.path) ? void 0 : o.length) !== 1) return !1;
                    else {
                        let t = String(e.path[0]);
                        a.has(t) || a.set(t, e), c = [t]
                    }
                else null != r || (r = e), c = e.keys;
                for (let e of c) i.has(e) || i.set(e, {}), i.get(e)[t] = !0;
                return !0
            };
        for (let n of t.issues) o(n, "l") || e.issues.push(n);
        for (let t of n.issues) o(t, "r") || e.issues.push(t);
        let c = [...i].filter(e => {
            let [, t] = e;
            return t.l && t.r
        }).map(e => {
            let [t] = e;
            return t
        });
        if (c.length) {
            let t = r ? c.filter(e => r.keys.includes(e)) : [];
            for (let n of (t.length && e.issues.push({
                    ...r,
                    keys: t
                }), c)) !t.includes(n) && a.has(n) && e.issues.push(a.get(n))
        }
        let u = iu(t.value, n.value);
        if (!u.valid) {
            if (ev(e)) return e;
            throw Error("Unmergable intersection. Error path: " + "".concat(JSON.stringify(u.mergeErrorPath)))
        }
        return e.value = u.data, e
    }
    let is = o("$ZodTuple", (e, t) => {
        n4.init(e, t);
        let n = t.items,
            r = s.memoizer;
        null == r || r.attach(e), e._zod.parse = (i, a) => {
            let o = i.value;
            if (!Array.isArray(o)) return i.issues.push({
                input: o,
                inst: e,
                expected: "tuple",
                code: "invalid_type"
            }), i;
            i.value = r ? r.alloc(e, i, [], a) : [];
            let c = [],
                u = id(n, "optin"),
                l = id(n, "optout");
            if (!t.rest) {
                if (o.length < u) return i.issues.push({
                    code: "too_small",
                    minimum: u,
                    inclusive: !0,
                    input: o,
                    inst: e,
                    origin: "array"
                }), i;
                o.length > n.length && i.issues.push({
                    code: "too_big",
                    maximum: n.length,
                    inclusive: !0,
                    input: o,
                    inst: e,
                    origin: "array"
                })
            }
            let s = Array(n.length),
                d = t.rest ? null == a ? void 0 : a.abortEarly : void 0,
                m = !1;
            for (let e = 0; e < n.length; e++) {
                let t = n[e]._zod.run({
                    value: o[e],
                    issues: []
                }, a);
                t instanceof Promise ? c.push(t.then(t => {
                    s[e] = t
                })) : (s[e] = t, d && !m && t.issues.length && (m = ev(t)))
            }
            if (t.rest && !m) {
                let e = n.length - 1,
                    r = o.slice(n.length),
                    u = i.issues.length;
                for (let n of r) {
                    if (d && i.issues.length !== u) {
                        if (ev(i, u)) break;
                        u = i.issues.length
                    }
                    e++;
                    let r = t.rest._zod.run({
                        value: n,
                        issues: []
                    }, a);
                    r instanceof Promise ? c.push(r.then(t => im(t, i, e))) : im(r, i, e)
                }
            }
            return c.length ? Promise.all(c).then(() => iv(s, i, n, o, l)) : iv(s, i, n, o, l)
        }
    });

    function id(e, t) {
        for (let n = e.length - 1; n >= 0; n--)
            if (!("optin" === t ? void 0 !== e[n]._zod.optin : "optional" === e[n]._zod.optout)) return n + 1;
        return 0
    }

    function im(e, t, n) {
        e.issues.length && t.issues.push(...eg(n, e.issues)), t.value[n] = e.value
    }

    function iv(e, t, n, r, i) {
        for (let a = 0; a < n.length; a++) {
            let o = e[a],
                c = a < r.length;
            if (!c && a >= i && "optional" === n[a]._zod.optin) {
                t.value.length = a;
                break
            }
            if (o.issues.length) {
                if (!c && a >= i) {
                    t.value.length = a;
                    break
                }
                t.issues.push(...eg(a, o.issues))
            }
            t.value[a] = o.value
        }
        for (let e = t.value.length - 1; e >= r.length; e--)
            if ("optional" === n[e]._zod.optout && void 0 === t.value[e]) t.value.length = e;
            else break;
        return t
    }
    let ip = o("$ZodRecord", (e, t) => {
            n4.init(e, t);
            let n = s.memoizer;
            null == n || n.attach(e), e._zod.parse = (r, i) => {
                let a = r.value;
                if (!F(a)) return r.issues.push({
                    expected: "record",
                    code: "invalid_type",
                    input: a,
                    inst: e
                }), r;
                let o = [],
                    c = t.keyType._zod.values;
                if (c && !t.partial) {
                    let u;
                    r.value = n ? n.alloc(e, r, {}, i) : {};
                    let l = new Set;
                    for (let n of c)
                        if ("string" == typeof n || "number" == typeof n || "symbol" == typeof n) {
                            if (l.add("number" == typeof n ? n.toString() : n), "__proto__" === n) continue;
                            let c = t.keyType._zod.run({
                                value: n,
                                issues: []
                            }, i);
                            if (c instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                            if (c.issues.length) {
                                r.issues.push({
                                    code: "invalid_key",
                                    origin: "record",
                                    issues: c.issues.map(e => eb(e, i, d())),
                                    input: n,
                                    path: [n],
                                    inst: e
                                });
                                continue
                            }
                            let u = c.value;
                            if ("__proto__" === u) continue;
                            let s = t.valueType._zod.run({
                                value: a[n],
                                issues: []
                            }, i);
                            s instanceof Promise ? o.push(s.then(e => {
                                e.issues.length && r.issues.push(...eg(n, e.issues)), r.value[u] = e.value
                            })) : (s.issues.length && r.issues.push(...eg(n, s.issues)), r.value[u] = s.value)
                        } for (let e in a)
                        if (!l.has(e))
                            if ("loose" === t.mode) {
                                if ("__proto__" === e) continue;
                                r.value[e] = a[e]
                            } else(u = null != u ? u : []).push(e);
                    u && u.length > 0 && r.issues.push({
                        code: "unrecognized_keys",
                        input: a,
                        inst: e,
                        keys: u,
                        continue: !0
                    })
                } else {
                    let u;
                    for (let l of (r.value = n ? n.alloc(e, r, {}, i) : {}, Reflect.ownKeys(a))) {
                        if ("__proto__" === l || !Object.prototype.propertyIsEnumerable.call(a, l)) continue;
                        let n = t.keyType._zod.run({
                            value: l,
                            issues: []
                        }, i);
                        if (n instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                        if ("string" == typeof l && tb.test(l) && n.issues.length) {
                            let e = t.keyType._zod.run({
                                value: Number(l),
                                issues: []
                            }, i);
                            if (e instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                            0 === e.issues.length && (n = e)
                        }
                        if (n.issues.length) {
                            "loose" === t.mode ? r.value[l] = a[l] : c ? (u = null != u ? u : []).push(l) : r.issues.push({
                                code: "invalid_key",
                                origin: "record",
                                issues: n.issues.map(e => eb(e, i, d())),
                                input: l,
                                path: [l],
                                inst: e
                            });
                            continue
                        }
                        let s = n.value;
                        if ("__proto__" === s) continue;
                        let m = t.valueType._zod.run({
                            value: a[l],
                            issues: []
                        }, i);
                        m instanceof Promise ? o.push(m.then(e => {
                            e.issues.length && r.issues.push(...eg(l, e.issues)), r.value[s] = e.value
                        })) : (m.issues.length && r.issues.push(...eg(l, m.issues)), r.value[s] = m.value)
                    }
                    u && u.length > 0 && r.issues.push({
                        code: "unrecognized_keys",
                        input: a,
                        inst: e,
                        keys: u,
                        continue: !0
                    })
                }
                return o.length ? Promise.all(o).then(() => r) : r
            }
        }),
        ig = o("$ZodMap", (e, t) => {
            n4.init(e, t);
            let n = s.memoizer;
            null == n || n.attach(e), e._zod.parse = (r, i) => {
                let a = r.value;
                if (!(a instanceof Map)) return r.issues.push({
                    expected: "map",
                    code: "invalid_type",
                    input: a,
                    inst: e
                }), r;
                let o = [];
                r.value = n ? n.alloc(e, r, new Map, i) : new Map;
                let c = null == i ? void 0 : i.abortEarly,
                    u = r.issues.length;
                for (let [n, l] of a) {
                    if (c && r.issues.length !== u) {
                        if (ev(r, u)) break;
                        u = r.issues.length
                    }
                    let s = t.keyType._zod.run({
                            value: n,
                            issues: []
                        }, i),
                        d = t.valueType._zod.run({
                            value: l,
                            issues: []
                        }, i);
                    s instanceof Promise || d instanceof Promise ? o.push(Promise.all([s, d]).then(t => {
                        let [o, c] = t;
                        ih(o, c, r, n, a, e, i)
                    })) : ih(s, d, r, n, a, e, i)
                }
                return o.length ? Promise.all(o).then(() => r) : r
            }
        });

    function ih(e, t, n, r, i, a, o) {
        e.issues.length && (W.has(typeof r) ? n.issues.push(...eg(r, e.issues)) : n.issues.push({
            code: "invalid_key",
            origin: "map",
            input: i,
            inst: a,
            issues: e.issues.map(e => eb(e, o, d()))
        })), t.issues.length && (W.has(typeof r) ? n.issues.push(...eg(r, t.issues)) : n.issues.push({
            origin: "map",
            code: "invalid_element",
            input: i,
            inst: a,
            key: r,
            issues: t.issues.map(e => eb(e, o, d()))
        })), n.value.set(e.value, t.value)
    }
    let i_ = o("$ZodSet", (e, t) => {
        n4.init(e, t);
        let n = s.memoizer;
        null == n || n.attach(e), e._zod.parse = (r, i) => {
            let a = r.value;
            if (!(a instanceof Set)) return r.issues.push({
                input: a,
                inst: e,
                expected: "set",
                code: "invalid_type"
            }), r;
            let o = [];
            r.value = n ? n.alloc(e, r, new Set, i) : new Set;
            let c = null == i ? void 0 : i.abortEarly,
                u = r.issues.length;
            for (let e of a) {
                if (c && r.issues.length !== u) {
                    if (ev(r, u)) break;
                    u = r.issues.length
                }
                let n = t.valueType._zod.run({
                    value: e,
                    issues: []
                }, i);
                n instanceof Promise ? o.push(n.then(e => ib(e, r))) : ib(n, r)
            }
            return o.length ? Promise.all(o).then(() => r) : r
        }
    });

    function ib(e, t) {
        e.issues.length && t.issues.push(...e.issues), t.value.add(e.value)
    }
    let iy = o("$ZodEnum", (e, t) => {
            n4.init(e, t);
            let n = _(t.entries),
                r = new Set(n);
            e._zod.values = r, eR(e, "pattern", e => {
                let t = _(e.def.entries).filter(e => W.has(typeof e));
                return new RegExp(t.length ? "^(".concat(t.map(e => H(e.toString())).join("|"), ")$") : "^[^\\s\\S]$")
            }), e._zod.parse = (t, i) => {
                let a = t.value;
                return r.has(a) || t.issues.push({
                    code: "invalid_value",
                    values: n,
                    input: a,
                    inst: e
                }), t
            }
        }),
        iI = o("$ZodLiteral", (e, t) => {
            n4.init(e, t);
            let n = new Set(t.values);
            e._zod.values = n, eR(e, "pattern", e => {
                let t = e.def.values;
                return new RegExp(t.length ? "^(".concat(t.map(e => "string" == typeof e ? H(e) : e ? H(e.toString()) : String(e)).join("|"), ")$") : "^[^\\s\\S]$")
            }), e._zod.parse = (r, i) => {
                let a = r.value;
                return n.has(a) || r.issues.push({
                    code: "invalid_value",
                    values: t.values,
                    input: a,
                    inst: e
                }), r
            }
        }),
        iw = o("$ZodFile", (e, t) => {
            n4.init(e, t), e._zod.parse = (t, n) => {
                let r = t.value;
                return r instanceof File || t.issues.push({
                    expected: "file",
                    code: "invalid_type",
                    input: r,
                    inst: e
                }), t
            }
        }),
        ik = o("$ZodTransform", (e, t) => {
            var n;
            n4.init(e, t), e._zod.optin = "optional", null == (n = s.memoizer) || n.guard(e), e._zod.parse = (n, r) => {
                if ("backward" === r.direction) throw new l(e.constructor.name);
                let i = t.transform(n.value, n);
                if (r.async) return (i instanceof Promise ? i : Promise.resolve(i)).then(e => (n.value = e, n));
                if (i instanceof Promise) throw new u;
                return n.value = i, n
            }
        });

    function ix(e, t) {
        return e.value = t.issues.length ? void 0 : t.value, e
    }
    let iS = o("$ZodOptional", (e, t) => {
            n4.init(e, t), eR(e, "optin", e => "defaulted" === e.def.innerType._zod.optin ? "defaulted" : "optional"), e._zod.optout = "optional", eR(e, "values", e => {
                let t = e.def.innerType._zod.values;
                return t ? new Set([...t, void 0]) : void 0
            }), eR(e, "pattern", e => {
                let t = e.def.innerType._zod.pattern;
                return t ? new RegExp("^(".concat(x(t.source), ")?$")) : void 0
            }), e._zod.parse = (e, n) => {
                if (void 0 === e.value) {
                    if ("defaulted" !== t.innerType._zod.optin) return e;
                    let r = t.innerType._zod.run({
                        value: e.value,
                        issues: []
                    }, n);
                    return r instanceof Promise ? r.then(t => ix(e, t)) : ix(e, r)
                }
                return t.innerType._zod.run(e, n)
            }
        }),
        iz = o("$ZodExactOptional", (e, t) => {
            iS.init(e, t), eR(e, "values", e => e.def.innerType._zod.values), eR(e, "pattern", e => e.def.innerType._zod.pattern), e._zod.parse = (e, n) => t.innerType._zod.run(e, n)
        }),
        iU = o("$ZodNullable", (e, t) => {
            n4.init(e, t), eR(e, "optin", e => e.def.innerType._zod.optin), eR(e, "optout", e => e.def.innerType._zod.optout), eR(e, "pattern", e => {
                let t = e.def.innerType._zod.pattern;
                return t ? new RegExp("^(".concat(x(t.source), "|null)$")) : void 0
            }), eR(e, "values", e => e.def.innerType._zod.values ? new Set([...e.def.innerType._zod.values, null]) : void 0), e._zod.parse = (e, n) => null === e.value ? e : t.innerType._zod.run(e, n)
        }),
        iA = o("$ZodDefault", (e, t) => {
            n4.init(e, t), e._zod.optin = "defaulted", eR(e, "values", e => e.def.innerType._zod.values), e._zod.parse = (e, n) => {
                if ("backward" === n.direction) return t.innerType._zod.run(e, n);
                if (void 0 === e.value) return e.value = t.defaultValue, e;
                let r = t.innerType._zod.run(e, n);
                return r instanceof Promise ? r.then(e => iD(e, t)) : iD(r, t)
            }
        });

    function iD(e, t) {
        return void 0 === e.value && (e.value = t.defaultValue), e
    }
    let iP = o("$ZodPrefault", (e, t) => {
            n4.init(e, t), e._zod.optin = "defaulted", eR(e, "values", e => e.def.innerType._zod.values), e._zod.parse = (e, n) => ("backward" === n.direction || void 0 === e.value && (e.value = t.defaultValue), t.innerType._zod.run(e, n))
        }),
        iN = o("$ZodNonOptional", (e, t) => {
            n4.init(e, t), eR(e, "values", e => {
                let t = e.def.innerType._zod.values;
                return t ? new Set([...t].filter(e => void 0 !== e)) : void 0
            }), e._zod.parse = (n, r) => {
                let i = t.innerType._zod.run(n, r);
                return i instanceof Promise ? i.then(t => iO(t, e)) : iO(i, e)
            }
        });

    function iO(e, t) {
        return e.issues.length || void 0 !== e.value || e.issues.push({
            code: "invalid_type",
            expected: "nonoptional",
            input: e.value,
            inst: t
        }), e
    }
    let ij = o("$ZodSuccess", (e, t) => {
        n4.init(e, t), e._zod.parse = (e, n) => {
            if ("backward" === n.direction) throw new l("ZodSuccess");
            let r = t.innerType._zod.run(e, n);
            return r instanceof Promise ? r.then(t => (e.value = 0 === t.issues.length, e)) : (e.value = 0 === r.issues.length, e)
        }
    });

    function iZ(e, t, n, r) {
        return t.issues.length ? e.value = n.catchValue({
            ...t,
            value: e.value,
            error: {
                issues: t.issues.map(e => eb(e, r, d()))
            },
            input: e.value
        }) : (e.value = t.value, t.memo && (e.memo = !0)), e
    }
    let iT = o("$ZodCatch", (e, t) => {
            n4.init(e, t), eR(e, "optin", e => "defaulted" === e.def.innerType._zod.optin ? "defaulted" : "optional"), eR(e, "optout", e => e.def.innerType._zod.optout), eR(e, "values", e => e.def.innerType._zod.values), e._zod.parse = (e, n) => {
                if ("backward" === n.direction) return t.innerType._zod.run(e, n);
                let r = t.innerType._zod.run({
                    value: e.value,
                    issues: []
                }, n);
                return r instanceof Promise ? r.then(r => iZ(e, r, t, n)) : iZ(e, r, t, n)
            }
        }),
        iE = o("$ZodNaN", (e, t) => {
            n4.init(e, t), e._zod.parse = (t, n) => ("number" == typeof t.value && Number.isNaN(t.value) || t.issues.push({
                input: t.value,
                inst: e,
                expected: "nan",
                code: "invalid_type"
            }), t)
        }),
        iC = o("$ZodPipe", (e, t) => {
            n4.init(e, t), eR(e, "values", e => e.def.in._zod.values), eR(e, "optin", e => e.def.in._zod.optin), eR(e, "optout", e => e.def.out._zod.optout), eR(e, "propValues", e => e.def.in._zod.propValues), e._zod.parse = (e, n) => {
                if ("backward" === n.direction) {
                    let r = t.out._zod.run(e, n);
                    return r instanceof Promise ? r.then(e => i$(e, t.in, n)) : i$(r, t.in, n)
                }
                let r = t.in._zod.run(e, n);
                return r instanceof Promise ? r.then(e => i$(e, t.out, n)) : i$(r, t.out, n)
            }
        });

    function i$(e, t, n) {
        return e.issues.some(e => "unrecognized_keys" !== e.code) ? (e.aborted = !0, e) : t._zod.run({
            value: e.value,
            issues: e.issues
        }, n)
    }
    let iL = o("$ZodCodec", (e, t) => {
        n4.init(e, t), eR(e, "values", e => e.def.in._zod.values), eR(e, "optin", e => e.def.in._zod.optin), eR(e, "optout", e => e.def.out._zod.optout), eR(e, "propValues", e => e.def.in._zod.propValues), e._zod.parse = (e, n) => {
            if ("forward" === (n.direction || "forward")) {
                let r = t.in._zod.run(e, n);
                return r instanceof Promise ? r.then(e => iR(e, t, n)) : iR(r, t, n)
            } {
                let r = t.out._zod.run(e, n);
                return r instanceof Promise ? r.then(e => iR(e, t, n)) : iR(r, t, n)
            }
        }
    });

    function iR(e, t, n) {
        if (e.issues.length) return e.aborted = !0, e;
        if ("forward" === (n.direction || "forward")) {
            let r = t.transform(e.value, e);
            return r instanceof Promise ? r.then(r => iG(e, r, t.out, n)) : iG(e, r, t.out, n)
        } {
            let r = t.reverseTransform(e.value, e);
            return r instanceof Promise ? r.then(r => iG(e, r, t.in, n)) : iG(e, r, t.in, n)
        }
    }

    function iG(e, t, n, r) {
        return e.issues.length ? (e.aborted = !0, e) : n._zod.run({
            value: t,
            issues: e.issues
        }, r)
    }
    let iJ = o("$ZodPreprocess", (e, t) => {
            iC.init(e, t)
        }),
        iB = o("$ZodReadonly", (e, t) => {
            n4.init(e, t), eR(e, "propValues", e => e.def.innerType._zod.propValues), eR(e, "values", e => e.def.innerType._zod.values), eR(e, "optin", e => {
                var t, n;
                return null == (n = e.def.innerType) || null == (t = n._zod) ? void 0 : t.optin
            }), eR(e, "optout", e => {
                var t, n;
                return null == (n = e.def.innerType) || null == (t = n._zod) ? void 0 : t.optout
            }), e._zod.parse = (e, n) => {
                if ("backward" === n.direction) return t.innerType._zod.run(e, n);
                let r = t.innerType._zod.run(e, n);
                return r instanceof Promise ? r.then(iM) : iM(r)
            }
        });

    function iM(e) {
        return e.memo || (e.value = Object.freeze(e.value)), e
    }
    let iF = o("$ZodTemplateLiteral", (e, t) => {
            n4.init(e, t);
            let n = [];
            for (let e of t.parts)
                if ("object" == typeof e && null !== e) {
                    let t = function e(t) {
                        var n, r, i;
                        let a = t._zod.def,
                            o = null == (r = t._zod.pattern) ? void 0 : r.source,
                            c = null != (n = a.innerType) ? n : t._zod.innerType;
                        if (c) {
                            let t = null == (i = c._zod.pattern) ? void 0 : i.source,
                                n = e(c);
                            return o && t && n && n !== t ? o.replace(x(t), () => x(n)) : o
                        }
                        if (a.options) {
                            let t = a.options.map(e);
                            if (t.every(Boolean)) return "^(".concat(t.map(e => x(e)).join("|"), ")$")
                        }
                        return function(e) {
                            var t, n, r, i, a, o;
                            let c, u, l = e._zod.def,
                                s = l.pattern,
                                d = !!(null == (n = l.format) ? void 0 : n.includes("int"));
                            for (let e of null != (t = l.checks) ? t : []) {
                                let t = e._zod.def;
                                t.pattern && (s = t.pattern), d || (d = !!(null == (o = t.format) ? void 0 : o.includes("int")));
                                let n = null != (i = t.minimum) ? i : t.length,
                                    r = null != (a = t.maximum) ? a : t.length;
                                void 0 !== n && (void 0 === c || n > c) && (c = n), void 0 !== r && (void 0 === u || r < u) && (u = r)
                            }
                            if (s) return s.source;
                            if (void 0 !== c && void 0 !== u && c > u) return "(?!)";
                            if (void 0 !== c || void 0 !== u) return tg({
                                minimum: c,
                                maximum: u
                            }).source;
                            let m = e._zod.pattern;
                            return null == (r = d && m === tb ? t_ : m) ? void 0 : r.source
                        }(t)
                    }(e);
                    if (!t) throw Error("Invalid template literal part, no pattern found: ".concat([...e._zod.traits].shift()));
                    n.push(x(t))
                } else if (null === e || X.has(typeof e)) n.push(H("".concat(e)));
            else throw Error("Invalid template literal part: ".concat(e));
            e._zod.pattern = new RegExp("^".concat(n.join(""), "$")), e._zod.parse = (n, r) => {
                if ("string" != typeof n.value) return n.issues.push({
                    input: n.value,
                    inst: e,
                    expected: "string",
                    code: "invalid_type"
                }), n;
                if (e._zod.pattern.lastIndex = 0, !e._zod.pattern.test(n.value)) {
                    var i;
                    n.issues.push({
                        input: n.value,
                        inst: e,
                        code: "invalid_format",
                        format: null != (i = t.format) ? i : "template_literal",
                        pattern: e._zod.pattern.source
                    })
                }
                return n
            }
        }),
        iV = o("$ZodFunction", (e, t) => (n4.init(e, t), Object.defineProperty(e, "_def", {
            value: t
        }), e._zod.def = t, e.implement = t => {
            if ("function" != typeof t) throw Error("implement() must be called with a function");
            return Object.defineProperty(function() {
                for (var n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
                let a = Reflect.apply(t, this, e._def.input ? t8(e._def.input, r) : r);
                return e._def.output ? t8(e._def.output, a) : a
            }, "_zod", {
                value: e._zod,
                enumerable: !1
            })
        }, e.implementAsync = t => {
            if ("function" != typeof t) throw Error("implementAsync() must be called with a function");
            return Object.defineProperty(async function() {
                for (var n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
                let a = e._def.input ? await ne(e._def.input, r) : r,
                    o = await Reflect.apply(t, this, a);
                return e._def.output ? await ne(e._def.output, o) : o
            }, "_zod", {
                value: e._zod,
                enumerable: !1
            })
        }, e._zod.parse = (t, n) => ("function" != typeof t.value ? t.issues.push({
            code: "invalid_type",
            expected: "function",
            input: t.value,
            inst: e
        }) : e._def.output && "promise" === e._def.output._zod.def.type ? t.value = e.implementAsync(t.value) : t.value = e.implement(t.value), t), e.input = function() {
            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
            let i = e.constructor;
            return new i(Array.isArray(n[0]) ? {
                type: "function",
                input: new is({
                    type: "tuple",
                    items: n[0],
                    rest: n[1]
                }),
                output: e._def.output
            } : {
                type: "function",
                input: n[0],
                output: e._def.output
            })
        }, e.output = t => new e.constructor({
            type: "function",
            input: e._def.input,
            output: t
        }), e)),
        iq = o("$ZodPromise", (e, t) => {
            n4.init(e, t), e._zod.parse = (e, n) => Promise.resolve(e.value).then(e => t.innerType._zod.run({
                value: e,
                issues: []
            }, n))
        }),
        iK = o("$ZodLazy", (e, t) => {
            n4.init(e, t), U(e._zod, "innerType", () => (t._cachedInner || (t._cachedInner = t.getter()), t._cachedInner)), eR(e, "pattern", e => {
                var t, n;
                return null == (n = e.innerType) || null == (t = n._zod) ? void 0 : t.pattern
            }), eR(e, "propValues", e => {
                var t, n;
                return null == (n = e.innerType) || null == (t = n._zod) ? void 0 : t.propValues
            }), eR(e, "optin", e => {
                var t, n, r;
                return null != (t = null == (r = e.innerType) || null == (n = r._zod) ? void 0 : n.optin) ? t : void 0
            }), eR(e, "optout", e => {
                var t, n, r;
                return null != (t = null == (r = e.innerType) || null == (n = r._zod) ? void 0 : n.optout) ? t : void 0
            }), e._zod.parse = (t, n) => e._zod.innerType._zod.run(t, n)
        }),
        iW = o("$ZodCustom", (e, t) => {
            nz.init(e, t), n4.init(e, t), e._zod.parse = (e, t) => e, e._zod.check = n => {
                let r = n.value,
                    i = t.fn(r);
                if (i instanceof Promise) return i.then(t => iX(t, n, r, e));
                iX(i, n, r, e)
            }
        });

    function iX(e, t, n, r) {
        if (!e) {
            var i;
            let e = {
                code: "custom",
                input: n,
                inst: r,
                path: [...null != (i = r._zod.def.path) ? i : []],
                continue: !r._zod.def.abort
            };
            r._zod.def.params && (e.params = r._zod.def.params), t.issues.push(eS(e))
        }
    }
    e.s(["qc", 0, rX, "XK", 0, r1, "Z4", 0, rD, "Hw", 0, rO, "bk", 0, rF, "EX", 0, rV, "YU", 0, rM, "t5", 0, rx, "mZ", 0, rz, "KY", 0, rs, "xp", 0, rd, "$z", 0, iT, "R2", 0, iL, "MU", 0, rE, "vg", 0, iW, "hB", 0, rG, "o3", 0, r0, "Js", 0, iA, "VC", 0, io, "nv", 0, rj, "UE", 0, n7, "on", 0, ru, "rr", 0, iy, "xa", 0, iz, "K0", 0, iw, "z2", 0, iV, "x1", 0, n9, "pU", 0, r$, "QG", 0, rb, "PR", 0, rw, "k2", 0, rg, "JW", 0, rp, "Bs", 0, r_, "GV", 0, rh, "xf", 0, ic, "LU", 0, rR, "xE", 0, rv, "g9", 0, iK, "XF", 0, iI, "gR", 0, rk, "HZ", 0, ig, "Zo", 0, iE, "TX", 0, rl, "K", 0, rY, "Gn", 0, iN, "sq", 0, rW, "$B", 0, iU, "K1", 0, rJ, "Ep", 0, rB, "AI", 0, r9, "bn", 0, r8, "_U", 0, iS, "dL", 0, iC, "J9", 0, iP, "BN", 0, iJ, "fC", 0, iq, "Zc", 0, iB, "ey", 0, ip, "e2", 0, i_, "FA", 0, n5, "kd", 0, n3, "A1", 0, ij, "Ey", 0, rq, "ER", 0, iF, "vh", 0, ik, "iD", 0, is, "GX", 0, n4, "AQ", 0, rm, "m2", 0, rc, "ym", 0, n8, "QH", 0, rK, "LW", 0, ie, "t6", 0, rH, "v_", 0, rQ, "Ko", 0, rf, "al", 0, ir, "Gj", 0, 1, "wI", 0, 2, "iX", 0, rA, "oo", 0, rP, "zL", 0, re, "gL", 0, ii, "e", 0, rU, "VD", 0, rN, "uq", 0, rS, "rT", 0, rT, "Wi", 0, rC, "rS", 0, rI, "pN", 0, rL, "Fg", 0, iu, "Yr", 0, rn, "KK", 0, n2, "aO", 0, ri, "Ao", 0, ra, "qD", 0, ro, "wi", 0, rt], 644520), e.s(["$ZodAny", 0, rX, "$ZodArray", 0, r1, "$ZodBase64", 0, rD, "$ZodBase64URL", 0, rO, "$ZodBigInt", 0, rF, "$ZodBigIntFormat", 0, rV, "$ZodBoolean", 0, rM, "$ZodCIDRv4", 0, rx, "$ZodCIDRv6", 0, rz, "$ZodCUID", 0, rs, "$ZodCUID2", 0, rd, "$ZodCatch", 0, iT, "$ZodCodec", 0, iL, "$ZodCreditCard", 0, rE, "$ZodCustom", 0, iW, "$ZodCustomStringFormat", 0, rG, "$ZodDate", 0, r0, "$ZodDefault", 0, iA, "$ZodDiscriminatedUnion", 0, io, "$ZodE164", 0, rj, "$ZodEmail", 0, n7, "$ZodEmoji", 0, ru, "$ZodEnum", 0, iy, "$ZodExactOptional", 0, iz, "$ZodFile", 0, iw, "$ZodFunction", 0, iV, "$ZodGUID", 0, n9, "$ZodIBAN", 0, r$, "$ZodIPv4", 0, rb, "$ZodIPv6", 0, rw, "$ZodISODate", 0, rg, "$ZodISODateTime", 0, rp, "$ZodISODuration", 0, r_, "$ZodISOTime", 0, rh, "$ZodIntersection", 0, ic, "$ZodJWT", 0, rR, "$ZodKSUID", 0, rv, "$ZodLazy", 0, iK, "$ZodLiteral", 0, iI, "$ZodMAC", 0, rk, "$ZodMap", 0, ig, "$ZodNaN", 0, iE, "$ZodNanoID", 0, rl, "$ZodNever", 0, rY, "$ZodNonOptional", 0, iN, "$ZodNull", 0, rW, "$ZodNullable", 0, iU, "$ZodNumber", 0, rJ, "$ZodNumberFormat", 0, rB, "$ZodObject", 0, r9, "$ZodObjectJIT", 0, r8, "$ZodOptional", 0, iS, "$ZodPipe", 0, iC, "$ZodPrefault", 0, iP, "$ZodPreprocess", 0, iJ, "$ZodPromise", 0, iq, "$ZodReadonly", 0, iB, "$ZodRecord", 0, ip, "$ZodSet", 0, i_, "$ZodString", 0, n5, "$ZodStringFormat", 0, n3, "$ZodSuccess", 0, ij, "$ZodSymbol", 0, rq, "$ZodTemplateLiteral", 0, iF, "$ZodTransform", 0, ik, "$ZodTuple", 0, is, "$ZodType", 0, n4, "$ZodULID", 0, rm, "$ZodURL", 0, rc, "$ZodUUID", 0, n8, "$ZodUndefined", 0, rK, "$ZodUnion", 0, ie, "$ZodUnknown", 0, rH, "$ZodVoid", 0, rQ, "$ZodXID", 0, rf, "$ZodXor", 0, ir, "URL_BAD_FORMAT", 0, 1, "URL_UNPARSEABLE", 0, 2, "base64Charset", 0, rA, "base64urlCharset", 0, rP, "canParseURL", 0, re, "clone", 0, Y, "getDiscriminatedOption", 0, ii, "isValidBase64", 0, rU, "isValidBase64URL", 0, rN, "isValidCIDRv6", 0, rS, "isValidCreditCard", 0, rT, "isValidIBAN", 0, rC, "isValidIPv6", 0, rI, "isValidJWT", 0, rL, "mergeValues", 0, iu, "parseURLObject", 0, rn, "standardProps", 0, n2, "stripTabAndNewline", 0, ri, "urlHostnameOk", 0, ra, "urlProtocolOk", 0, ro, "validateURL", 0, rt], 146995), e.i(146995);
    class iH extends Error {
        constructor() {
            super("Cannot parse a reference cycle that closes through a transform"), this.name = "ZodCyclicError"
        }
    }
    let iY = "~memo",
        iQ = [];

    function i0(e) {
        return null !== e && "object" == typeof e
    }

    function i4(e) {
        return e.map(e => e.path ? {
            ...e,
            path: e.path.slice()
        } : {
            ...e
        })
    }
    let i1 = new WeakMap;

    function i6(e, t, n) {
        var r, i, a;
        let o = i1.get(e);
        if (void 0 !== o) return 2 * !!o;
        if (t.has(e)) return 2;
        t.add(e);
        let c = 0,
            u = e => {
                if (2 !== c && (null == e ? void 0 : e._zod)) {
                    let r = i6(e, t, n);
                    r > c && (c = r)
                }
            },
            l = e => {
                e > c && (c = e)
            },
            s = e._zod.def;
        switch (s.type) {
            case "object": {
                let e = P(s);
                l(e ? ((e, r) => {
                    let i = 0;
                    for (let o of Reflect.ownKeys(e)) {
                        var a;
                        let c = Object.getOwnPropertyDescriptor(e, o);
                        if (r && !c.enumerable) continue;
                        let u = c.get ? 1 : (null == (a = c.value) ? void 0 : a._zod) ? i6(c.value, t, n) : 0;
                        u > i && (i = u)
                    }
                    return i
                })(e, !0) : 1), u(s.catchall);
                break
            }
            case "array":
                u(s.element);
                break;
            case "tuple":
                for (let e of s.items) u(e);
                u(s.rest);
                break;
            case "record":
            case "map":
                u(s.keyType), u(s.valueType);
                break;
            case "set":
                u(s.valueType);
                break;
            case "union":
                for (let e of s.options) u(e);
                break;
            case "intersection":
                u(s.left), u(s.right);
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
                u(s.innerType);
                break;
            case "pipe":
                u(s.in), u(s.out);
                break;
            case "function":
                u(s.input), u(s.output);
                break;
            case "lazy": {
                let i = null != (r = s._cachedInner) ? r : n ? e._zod.innerType : void 0;
                l(i ? i6(i, t, !1) : 1);
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
                for (let e in s) {
                    let t = Object.getOwnPropertyDescriptor(s, e);
                    if (!t || t.get) continue;
                    let n = t.value;
                    if (n && "object" == typeof n) {
                        if (n._zod) u(n);
                        else if (Array.isArray(n))
                            for (let e of n) u(e)
                    }
                }
        }
        return t.delete(e), i = e, 1 !== (a = c) && i1.set(i, 2 === a), a
    }

    function i2(e) {
        return 0 !== i6(e, new Set, !0)
    }
    let i5 = [],
        i3 = {
            alloc(e, t, r) {
                let i = n;
                if (!i) return r;
                n = void 0;
                let a = {
                    value: r,
                    issues: null
                };
                return i.set(t.value, a), i5.push(a), r
            },
            guard(e) {
                var t;
                null != (t = e._zod).deferred || (t.deferred = []), e._zod.deferred.push(() => {
                    let t = e._zod.parse,
                        n = (e, n) => {
                            if ("backward" !== n.direction && i8(n, e.value)) throw new iH;
                            return t(e, n)
                        };
                    e._zod.parse = n, e._zod.run === t && (e._zod.run = n)
                })
            },
            attach(e) {
                var t;
                let r, i, a, o = !1;
                null != (t = e._zod).deferred || (t.deferred = []), e._zod.deferred.push(() => {
                    let t = e._zod.parse,
                        c = (u, l) => {
                            var s;
                            let d;
                            if (void 0 === r) {
                                let n = i6(e, new Set, !1);
                                if (0 === n) return e._zod.parse = t, e._zod.run === c && (e._zod.run = t), t(u, l);
                                2 === n || o ? r = !0 : o = !0
                            }
                            let m = u.value;
                            if (!i0(m)) return t(u, l);
                            let f = l[iY];
                            if (f || (f = {
                                    buckets: new WeakMap,
                                    backEdges: void 0
                                }, l[iY] = f), i === l) d = a;
                            else {
                                let t;
                                (t = (s = f).buckets.get(e)) || (t = new WeakMap, s.buckets.set(e, t)), d = t, i = l, a = d
                            }
                            let v = d.get(m);
                            if (v) return (u.value = v.value, v.issues) ? v.issues.length && u.issues.push(...i4(v.issues)) : (u.memo = !0, null != f.backEdges || (f.backEdges = new WeakSet), f.backEdges.add(v.value)), u;
                            n = d;
                            let p = i5.length,
                                g = t(u, l);
                            n = void 0;
                            let h = i5.length > p ? i5.pop() : void 0;
                            return g instanceof Promise ? g.then(e => (h && (h.issues = e.issues.length ? i4(e.issues) : iQ), e)) : (h && (h.issues = g.issues.length ? i4(g.issues) : iQ), g)
                        };
                    e._zod.parse = c, e._zod.run === t && (e._zod.run = c)
                })
            }
        };

    function i9() {
        return i3
    }

    function i8(e, t) {
        var n;
        let r = null == (n = e[iY]) ? void 0 : n.backEdges;
        return void 0 !== r && i0(t) && r.has(t)
    }
    e.s(["$ZodCyclicError", 0, iH, "isBackEdge", 0, i8, "isRecursiveSchema", 0, i2, "memoizer", 0, i9], 308644), e.i(308644), e.i(862359), e.i(409437);
    let i7 = Symbol("ZodOutput"),
        ae = Symbol("ZodInput");
    class at {
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
    }

    function an() {
        return new at
    }
    null != (eF = globalThis).__zod_globalRegistry || (eF.__zod_globalRegistry = an());
    let ar = globalThis.__zod_globalRegistry;
    e.s(["$ZodRegistry", 0, at, "$input", 0, ae, "$output", 0, i7, "globalRegistry", 0, ar, "registry", 0, an], 539930), e.i(539930), e.i(664508);
    let ai = Symbol.for("zod.compile.invalid"),
        aa = Symbol.for("zod.compile.fallback");
    class ao extends Error {
        constructor(e = "z.compile does not support async refinements, transforms, or checks") {
            super(e), this.name = "ZodCompileAsyncError"
        }
    }
    class ac extends Error {
        constructor(e, t = !0) {
            super("z.compile does not support ".concat(e, "; this schema must use the runtime parser")), this.name = "ZodCompileUnsupportedError", this.islandable = t
        }
    }

    function au(e, t) {
        try {
            let t = as(e),
                n = al(e, t);
            return n._zod.bag.validator = function(e, t) {
                try {
                    return as(e, {
                        assertOnly: !0
                    })
                } catch (e) {
                    return t
                }
            }(e, t), n
        } catch (n) {
            if (null == t ? void 0 : t.strict) throw n;
            return e
        }
    }

    function al(e, t) {
        var n;
        if (i2(e)) throw new ac("a schema whose subtree contains a reference cycle");
        let r = Y(e),
            i = e._zod.run,
            a = null != (n = i.__originalRun) ? n : i,
            o = (e, n) => {
                if ((null == n ? void 0 : n.async) || (null == n ? void 0 : n.direction) === "backward" || (null == n ? void 0 : n.skipChecks) || (null == n ? void 0 : n[aa]) || n && i8(n, e.value)) return a(e, n);
                let r = t(e.value);
                return r !== ai ? (e.value = r, e) : (n && (n[aa] = !0), a(e, n))
            };
        return o.__originalRun = a, r._zod.bag.fallbackRun = a, r._zod.bag.validator = t, r._zod.run = o, i.__originalRun || function(e, t, n) {
            if ("function" == typeof t.safeParse) {
                let r = t.safeParse;
                e.safeParse = (e, t) => {
                    let i = n(e);
                    return i !== ai ? {
                        success: !0,
                        data: i
                    } : r(e, t)
                }
            }
            if ("function" == typeof t.parse) {
                let r = t.parse;
                e.parse = (e, t) => {
                    let i = n(e);
                    return i !== ai ? i : r(e, t)
                }
            }
        }(r, e, t), r
    }

    function as(e, t) {
        let n, r = !0;
        try {
            r = i2(e)
        } catch (e) {}
        if (r) throw new ac("a schema whose subtree contains a reference cycle");
        let i = {
                constants: new Map,
                constantCounter: 0,
                varCounter: 0,
                definite: !0
            },
            a = new nQ(["input"]),
            o = aS(a, i, e, "input", !(null == t ? void 0 : t.assertOnly));
        a.write(null === o ? "return true;" : "return ".concat(o, ";"));
        let c = ["INVALID", ...i.constants.keys()],
            u = [ai, ...i.constants.values()],
            l = a.content.join("\n"),
            s = (null == t ? void 0 : t.debug) ? c.length > 0 ? "// Constants: ".concat(c.join(", "), "\n").concat(l) : l : "",
            d = Function;
        try {
            n = new d(...c, "return (input) => {\n".concat(l, "\n}"))(...u)
        } catch (e) {
            throw new ac("this schema (generated code failed to evaluate: ".concat(e.message, ")"))
        }
        return (null == t ? void 0 : t.debug) && (n.code = s), n.definite = i.definite, n
    }

    function ad(e, t) {
        for (let [n, r] of e.constants)
            if (r === t) return n;
        let n = "c".concat(e.constantCounter++);
        return e.constants.set(n, t), n
    }

    function am(e, t) {
        return e.definite = !1, ad(e, t)
    }

    function af(e) {
        return "v".concat(e.varCounter++)
    }

    function av(e, t) {
        let n = e._zod.run({
            value: t,
            issues: []
        }, {});
        return n && "function" == typeof n.then ? ai : 0 === n.issues.length ? n.value : ai
    }

    function ap(e, t, n, r) {
        let i = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4],
            a = e.content.length,
            o = t.constants.size,
            c = t.constantCounter,
            u = t.varCounter;
        try {
            return aS(e, t, n, r, i)
        } catch (p) {
            var l, s, d, m;
            let i, f, v;
            if (!(p instanceof ac) || !p.islandable) throw p;
            if (e.content.length = a, t.constants.size > o)
                for (let e of Array.from(t.constants.keys()).slice(o)) t.constants.delete(e);
            return t.constantCounter = c, t.varCounter = u, l = e, s = t, d = n, m = r, s.definite = !1, i = ad(s, d), f = ad(s, av), v = af(s), l.write("const ".concat(v, " = ").concat(f, "(").concat(i, ", ").concat(m, ");")), l.write("if (".concat(v, " === INVALID) return INVALID;")), v
        }
    }
    let ag = new Set(["max_size", "min_size", "size_equals", "max_length", "min_length", "length_equals"]);

    function ah(e, t, n, r) {
        let i = ad(t, ew),
            a = af(t);
        return e.write("const ".concat(a, " = typeof ").concat(n, ' === "string" && ').concat(r, " ? ").concat(i, "(").concat(n, ") : ").concat(n, ".length;")), a
    }

    function a_(e, t) {
        if ("number" != typeof e || !Number.isFinite(e)) throw new ac("".concat(t, " bound of type ").concat(typeof e));
        return "".concat(e)
    }

    function ab(e, t) {
        if ("bigint" == typeof t) return "".concat(t, "n");
        if ("number" == typeof t) {
            if (Number.isNaN(t)) throw new ac("comparison check with NaN bound");
            return "".concat(t)
        }
        if (t instanceof Date) {
            if (Number.isNaN(t.getTime())) throw new ac("comparison check with Invalid Date bound");
            return ad(e, t)
        }
        throw new ac("comparison check bound of type ".concat(typeof t))
    }

    function ay(e, t, n) {
        let r = t.format;
        switch (r) {
            case "safeint":
                e.write("if (!Number.isSafeInteger(".concat(n, ")) return INVALID;"));
                break;
            case "int32":
                e.write("if (!Number.isInteger(".concat(n, ") || ").concat(n, " < -2147483648 || ").concat(n, " > 2147483647) return INVALID;"));
                break;
            case "uint32":
                e.write("if (!Number.isInteger(".concat(n, ") || ").concat(n, " < 0 || ").concat(n, " > 4294967295) return INVALID;"));
                break;
            case "float32":
                e.write("if (!Number.isFinite(".concat(n, ") || ").concat(n, " < -3.4028234663852886e38 || ").concat(n, " > 3.4028234663852886e38) return INVALID;"));
                break;
            case "float64":
                e.write("if (!Number.isFinite(".concat(n, ")) return INVALID;"));
                break;
            default:
                throw new ac("number format ".concat(r))
        }
    }

    function aI() {
        throw new u
    }

    function aw(e) {
        this.issues.push(e)
    }
    let ak = new Set(["cidrv4", "cuid", "cuid2", "date", "datetime", "duration", "e164", "email", "emoji", "ends_with", "guid", "includes", "ipv4", "ksuid", "lowercase", "mac", "nanoid", "regex", "starts_with", "time", "ulid", "uppercase", "uuid", "xid"]);

    function ax(e, t, n, r) {
        let i = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4],
            a = n.format;
        if ("base64" === a) {
            let n = ad(t, rU);
            return e.write("if (!".concat(n, "(").concat(r, ")) return INVALID;")), r
        }
        if ("base64url" === a) {
            let n = ad(t, rN);
            return e.write("if (!".concat(n, "(").concat(r, ")) return INVALID;")), r
        }
        if ("jwt" === a) {
            var o;
            let i = ad(t, rL),
                a = ad(t, null != (o = n.alg) ? o : null);
            return e.write("if (!".concat(i, "(").concat(r, ", ").concat(a, ")) return INVALID;")), r
        }
        if ("ipv6" === a) {
            let n = ad(t, rI);
            return e.write("if (!".concat(n, "(").concat(r, ")) return INVALID;")), r
        }
        if ("cidrv6" === a) {
            let n = ad(t, rS);
            return e.write("if (!".concat(n, "(").concat(r, ")) return INVALID;")), r
        }
        if ("credit_card" === a) {
            let n = ad(t, rT);
            return e.write("if (!".concat(n, "(").concat(r, ")) return INVALID;")), r
        }
        if ("iban" === a) {
            let n = ad(t, rC);
            return e.write("if (!".concat(n, "(").concat(r, ")) return INVALID;")), r
        }
        if ("url" === a || "httpurl" === a || n.normalize || void 0 !== n.hostname || void 0 !== n.protocol) {
            let a = ad(t, rt),
                o = ad(t, n),
                c = af(t),
                u = af(t);
            if (e.write("const ".concat(c, " = ").concat(r, ".trim();")), e.write("const ".concat(u, " = ").concat(a, "(").concat(c, ", ").concat(o, ");")), e.write("if (typeof ".concat(u, ' === "number") return INVALID;')), void 0 !== n.hostname) {
                let n = ad(t, ra);
                e.write("if (!".concat(n, "(").concat(u, ", ").concat(o, ".hostname)) return INVALID;"))
            }
            if (void 0 !== n.protocol) {
                let n = ad(t, ro);
                e.write("if (!".concat(n, "(").concat(u, ", ").concat(o, ".protocol)) return INVALID;"))
            }
            if (!i) return null;
            let l = af(t),
                s = n.normalize ? "".concat(u, ".href") : "".concat(ad(t, ri), "(").concat(c, ")");
            return e.write("const ".concat(l, " = ").concat(s, ";")), l
        }
        let c = n.fn;
        if (c) {
            if (aN(c)) throw new ac("async string format ".concat(a));
            let n = ad(t, c);
            return e.write("if (!".concat(n, "(").concat(r, ")) return INVALID;")), r
        }
        if (ak.has(a) && n.pattern) {
            let i = ad(t, n.pattern);
            return e.write("".concat(i, ".lastIndex = 0;")), e.write("if (!".concat(i, ".test(").concat(r, ")) return INVALID;")), r
        }
        let u = n.format;
        switch (u) {
            case "regex":
                throw new ac("regex format without a pattern");
            case "lowercase":
                e.write("if (".concat(r, " !== ").concat(r, ".toLowerCase()) return INVALID;"));
                break;
            case "uppercase":
                e.write("if (".concat(r, " !== ").concat(r, ".toUpperCase()) return INVALID;"));
                break;
            case "includes":
                e.write("if (!".concat(r, ".includes(").concat(R(n.includes), ")) return INVALID;"));
                break;
            case "starts_with": {
                let t = n.prefix;
                e.write("if (".concat(r, ".slice(0, ").concat(t.length, ") !== ").concat(R(t), ") return INVALID;"));
                break
            }
            case "ends_with": {
                let t = n.suffix;
                e.write("if (".concat(r, ".slice(-").concat(t.length, ") !== ").concat(R(t), ") return INVALID;"));
                break
            }
            default:
                throw new ac("string format ".concat(u))
        }
        return r
    }

    function aS(e, t, n, r) {
        var i, a, o, c, u, l, s, d, m, f, v, p, g, h, _, b, y, I, w, k, x, z, U, A, D, P, N, O, j, Z, T, E, C, $, L, G, J, B, M, q;
        let K, W = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4],
            X = n._zod.def,
            H = X.type;
        if (X.coerce) throw new ac("coercion (z.coerce.".concat(H, "())"));
        let Y = W || !!(null == (i = X.checks) ? void 0 : i.length);
        switch (H) {
            case "string":
                K = function(e, t, n, r) {
                    let i = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4];
                    e.write("if (typeof ".concat(r, ' !== "string") return INVALID;'));
                    let a = n._zod.def;
                    return void 0 === a.format ? r : ax(e, t, a, r, i)
                }(e, t, n, r, Y);
                break;
            case "number":
                let Q;
                a = e, o = n, c = r, a.write("if (typeof ".concat(c, ' !== "number" || !Number.isFinite(').concat(c, ")) return INVALID;")), "number_format" === (Q = o._zod.def).check && Q.format && ay(a, {
                    format: Q.format
                }, c), K = c;
                break;
            case "boolean":
                u = e, l = r, u.write("if (typeof ".concat(l, ' !== "boolean") return INVALID;')), K = l;
                break;
            case "bigint":
                K = function(e, t, n) {
                    e.write("if (typeof ".concat(n, ' !== "bigint") return INVALID;'));
                    let r = t._zod.def;
                    if (r.format) switch (r.format) {
                        case "int64":
                            e.write("if (".concat(n, " < -9223372036854775808n || ").concat(n, " > 9223372036854775807n) return INVALID;"));
                            break;
                        case "uint64":
                            e.write("if (".concat(n, " < 0n || ").concat(n, " > 18446744073709551615n) return INVALID;"))
                    }
                    return n
                }(e, n, r);
                break;
            case "symbol":
                s = e, d = r, s.write("if (typeof ".concat(d, ' !== "symbol") return INVALID;')), K = d;
                break;
            case "undefined":
                m = e, f = r, m.write("if (".concat(f, " !== undefined) return INVALID;")), K = f;
                break;
            case "null":
                v = e, p = r, v.write("if (".concat(p, " !== null) return INVALID;")), K = p;
                break;
            case "any":
            case "unknown":
                K = r;
                break;
            case "never":
                e.write("return INVALID;"), K = r;
                break;
            case "void":
                g = e, h = r, g.write("if (".concat(h, " !== undefined) return INVALID;")), K = h;
                break;
            case "nan":
                _ = e, b = r, _.write("if (typeof ".concat(b, ' !== "number" || !Number.isNaN(').concat(b, ")) return INVALID;")), K = b;
                break;
            case "date":
                y = e, I = r, y.write("if (!(".concat(I, " instanceof Date) || Number.isNaN(").concat(I, ".getTime())) return INVALID;")), K = I;
                break;
            case "object":
                K = function(e, t, n, r) {
                    var i, a;
                    let o = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4],
                        c = n._zod.def;
                    e.write("if (typeof ".concat(r, ' !== "object" || ').concat(r, " === null || Array.isArray(").concat(r, ")) return INVALID;"));
                    let u = c.shape,
                        l = Object.keys(u),
                        s = Object.getOwnPropertySymbols(u),
                        d = s.length ? [...l, ...s] : l,
                        m = e => "symbol" == typeof e ? ad(t, e) : R(e);
                    if (l.includes("__proto__")) throw new ac('object shape key "__proto__"');
                    let f = new Map;
                    for (let n of d) {
                        let a = u[n],
                            c = m(n),
                            l = af(t);
                        if (e.write("const ".concat(l, " = ").concat(r, "[").concat(c, "];")), void 0 !== a._zod.optin) {
                            let i = af(t);
                            e.write("let ".concat(i, " = (() => {")), e.indented(e => {
                                let n = ap(e, t, a, l);
                                e.write("return ".concat(n, ";"))
                            }), e.write("})();"), "optional" === a._zod.optout ? (e.write("if (".concat(i, " === INVALID) {")), e.indented(e => {
                                e.write("if (".concat(c, " in ").concat(r, ") return INVALID;")), e.write("".concat(i, " = undefined;"))
                            }), e.write("}")) : e.write("if (".concat(i, " === INVALID) return INVALID;")), f.set(n, i)
                        } else {
                            void 0 === (i = a)._zod.optin && function e(t) {
                                var n, r;
                                if (t._zod.def.coerce) return !0;
                                let i = t._zod.def;
                                switch (i.type) {
                                    case "any":
                                    case "unknown":
                                    case "undefined":
                                    case "void":
                                    case "default":
                                    case "prefault":
                                    case "transform":
                                    case "custom":
                                    case "lazy":
                                    case "catch":
                                    default:
                                        return !0;
                                    case "string":
                                    case "number":
                                    case "boolean":
                                    case "bigint":
                                    case "symbol":
                                    case "null":
                                    case "never":
                                    case "nan":
                                    case "date":
                                    case "object":
                                    case "array":
                                    case "tuple":
                                    case "record":
                                    case "map":
                                    case "set":
                                    case "file":
                                    case "template_literal":
                                        return !1;
                                    case "nonoptional":
                                        return !!i.innerType && e(i.innerType);
                                    case "literal":
                                        return !!(null == (n = i.values) ? void 0 : n.includes(void 0));
                                    case "enum":
                                        return !!(null == (r = t._zod.values) ? void 0 : r.has(void 0));
                                    case "optional":
                                    case "nullable":
                                    case "readonly":
                                    case "success":
                                        return !i.innerType || e(i.innerType);
                                    case "union":
                                        return !i.options || i.options.some(e);
                                    case "intersection":
                                        if (!i.left || !i.right) return !0;
                                        return e(i.left) && e(i.right);
                                    case "pipe":
                                        return !i.in || e(i.in)
                                }
                            }(i) && e.write("if (!(".concat(c, " in ").concat(r, ")) return INVALID;"));
                            let u = ap(e, t, a, l, o);
                            null !== u && f.set(n, u)
                        }
                    }
                    let v = c.catchall,
                        p = "none";
                    if (v) {
                        let t = v._zod.def.type;
                        if ("never" === t) {
                            let t = l.map(e => "k !== ".concat(R(e))).join(" && ") || "true";
                            e.write("for (const k in ".concat(r, ") {")), e.indented(e => {
                                e.write("if (".concat(t, ") return INVALID;"))
                            }), e.write("}")
                        } else p = "unknown" !== t && "any" !== t || (null == (a = v._zod.def.checks) ? void 0 : a.length) ? "schema" : "passthrough"
                    }
                    let g = af(t),
                        h = d.some(e => aU(u[e]) || az(u[e]));
                    if (!o) {
                        if ("schema" === p) {
                            let n = l.length > 0 ? ad(t, new Set(l)) : null;
                            e.write("for (const k in ".concat(r, ") {")), e.indented(e => {
                                e.write('if (k === "__proto__") continue;'), n && e.write("if (".concat(n, ".has(k)) continue;"));
                                let i = af(t);
                                e.write("const ".concat(i, " = ").concat(r, "[k];")), ap(e, t, v, i, !1)
                            }), e.write("}")
                        }
                        return null
                    }
                    if (h)
                        for (let t of (e.write("const ".concat(g, " = {};")), d)) {
                            let n = m(t),
                                i = f.get(t);
                            az(u[t]) ? e.write("if (".concat(n, " in ").concat(r, ") ").concat(g, "[").concat(n, "] = ").concat(i, ";")) : aU(u[t]) ? e.write("if (".concat(i, " !== undefined || ").concat(n, " in ").concat(r, ") ").concat(g, "[").concat(n, "] = ").concat(i, ";")) : e.write("".concat(g, "[").concat(n, "] = ").concat(i, ";"))
                        } else {
                            let t = d.map(e => "".concat("symbol" == typeof e ? "[".concat(m(e), "]") : R(e), ": ").concat(f.get(e))).join(", ");
                            e.write("const ".concat(g, " = { ").concat(t, " };"))
                        }
                    if ("none" !== p) {
                        let n = l.length > 0 ? ad(t, new Set(l)) : null;
                        e.write("for (const k in ".concat(r, ") {")), e.indented(e => {
                            if (e.write('if (k === "__proto__") continue;'), n && e.write("if (".concat(n, ".has(k)) continue;")), "passthrough" === p) e.write("".concat(g, "[k] = ").concat(r, "[k];"));
                            else {
                                let n = af(t);
                                e.write("const ".concat(n, " = ").concat(r, "[k];"));
                                let i = ap(e, t, v, n);
                                e.write("".concat(g, "[k] = ").concat(i, ";"))
                            }
                        }), e.write("}")
                    }
                    return g
                }(e, t, n, r, Y);
                break;
            case "optional":
                K = function(e, t, n, r) {
                    var i;
                    let a = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4],
                        o = n._zod.def;
                    if ((null == (i = n._zod.traits) ? void 0 : i.has("$ZodExactOptional")) === !0) return aS(e, t, o.innerType, r, a);
                    if ("defaulted" === o.innerType._zod.optin) {
                        let n = af(t),
                            i = af(t);
                        return e.write("let ".concat(n, ";")), e.write("if (".concat(r, " === undefined) {")), e.indented(e => {
                            e.write("const ".concat(i, " = (() => {")), e.indented(e => {
                                let n = aS(e, t, o.innerType, r);
                                e.write("return ".concat(n, ";"))
                            }), e.write("})();"), e.write("if (".concat(i, " !== INVALID) ").concat(n, " = ").concat(i, ";"))
                        }), e.write("} else {"), e.indented(e => {
                            let i = aS(e, t, o.innerType, r);
                            e.write("".concat(n, " = ").concat(i, ";"))
                        }), e.write("}"), n
                    }
                    let c = a ? af(t) : null;
                    return c && e.write("let ".concat(c, ";")), e.write("if (".concat(r, " !== undefined) {")), e.indented(e => {
                        let n = aS(e, t, o.innerType, r, a);
                        c && null !== n && e.write("".concat(c, " = ").concat(n, ";"))
                    }), e.write("}"), c
                }(e, t, n, r, Y);
                break;
            case "nullable":
                K = function(e, t, n, r) {
                    let i = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4],
                        a = n._zod.def,
                        o = i ? af(t) : null;
                    return o && e.write("let ".concat(o, " = null;")), e.write("if (".concat(r, " !== null) {")), e.indented(e => {
                        let n = aS(e, t, a.innerType, r, i);
                        o && null !== n && e.write("".concat(o, " = ").concat(n, ";"))
                    }), e.write("}"), o
                }(e, t, n, r, Y);
                break;
            case "array":
                K = function(e, t, n, r) {
                    let i = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4],
                        a = n._zod.def;
                    e.write("if (!Array.isArray(".concat(r, ")) return INVALID;"));
                    let o = i ? af(t) : null,
                        c = af(t),
                        u = af(t);
                    return o && e.write("const ".concat(o, " = new Array(").concat(r, ".length);")), e.write("for (let ".concat(c, " = 0; ").concat(c, " < ").concat(r, ".length; ").concat(c, "++) {")), e.indented(e => {
                        e.write("const ".concat(u, " = ").concat(r, "[").concat(c, "];"));
                        let n = ap(e, t, a.element, u, i);
                        o && null !== n && e.write("".concat(o, "[").concat(c, "] = ").concat(n, ";"))
                    }), e.write("}"), o
                }(e, t, n, r, Y);
                break;
            case "literal":
                K = function(e, t, n, r) {
                    let i = n._zod.def.values;
                    if (1 !== i.length) {
                        let n = ad(t, new Set(i));
                        return e.write("if (!".concat(n, ".has(").concat(r, ")) return INVALID;")), r
                    }
                    let a = i[0];
                    if ("number" == typeof a && Number.isNaN(a)) {
                        let n = ad(t, new Set(i));
                        return e.write("if (!".concat(n, ".has(").concat(r, ")) return INVALID;")), r
                    }
                    if ("string" == typeof a) e.write("if (".concat(r, " !== ").concat(R(a), ") return INVALID;"));
                    else if ("number" == typeof a || "boolean" == typeof a) e.write("if (".concat(r, " !== ").concat(a, ") return INVALID;"));
                    else if (null === a) e.write("if (".concat(r, " !== null) return INVALID;"));
                    else if (void 0 === a) e.write("if (".concat(r, " !== undefined) return INVALID;"));
                    else if ("bigint" == typeof a) e.write("if (".concat(r, " !== ").concat(a, "n) return INVALID;"));
                    else throw new ac("literal type ".concat(typeof a));
                    return r
                }(e, t, n, r);
                break;
            case "enum":
                K = function(e, t, n, r) {
                    let i = n._zod.values;
                    if (!i) throw new ac("enum schema without enumerated values");
                    let a = ad(t, i);
                    return e.write("if (!".concat(a, ".has(").concat(r, ")) return INVALID;")), r
                }(e, t, n, r);
                break;
            case "readonly": {
                let i = aA(e, t, n, r),
                    a = af(t);
                e.write("const ".concat(a, " = Object.freeze(").concat(i, ");")), K = a;
                break
            }
            case "success":
                aA(e, t, n, r), K = "true";
                break;
            case "default":
            case "prefault":
                K = function(e, t, n, r) {
                    let i = n._zod.def,
                        a = Object.getOwnPropertyDescriptor(n._zod.def, "defaultValue") ? () => n._zod.def.defaultValue : void 0;
                    if ("prefault" === n._zod.def.type) {
                        if (!a) return aS(e, t, i.innerType, r);
                        let n = ad(t, a),
                            o = af(t);
                        return e.write("let ".concat(o, " = ").concat(r, ";")), e.write("if (".concat(r, " === undefined) ").concat(o, " = ").concat(n, "();")), aS(e, t, i.innerType, o)
                    }
                    let o = af(t);
                    if (a) {
                        let n = ad(t, a),
                            c = ad(t, V);
                        e.write("let ".concat(o, ";")), e.write("if (".concat(r, " === undefined) {")), e.indented(e => {
                            e.write("".concat(o, " = ").concat(c, "(").concat(n, "());"))
                        }), e.write("} else {"), e.indented(e => {
                            let a = aS(e, t, i.innerType, r);
                            e.write("".concat(o, " = ").concat(a, " === undefined ? ").concat(c, "(").concat(n, "()) : ").concat(a, ";"))
                        }), e.write("}")
                    } else e.write("let ".concat(o, ";")), e.write("if (".concat(r, " !== undefined) {")), e.indented(e => {
                        let n = aS(e, t, i.innerType, r);
                        e.write("".concat(o, " = ").concat(n, ";"))
                    }), e.write("}");
                    return o
                }(e, t, n, r);
                break;
            case "nonoptional":
                let ee, et;
                w = e, k = t, x = n, z = r, ee = aS(w, k, x._zod.def.innerType, z), et = af(k), w.write("const ".concat(et, " = ").concat(ee, ";")), w.write("if (".concat(et, " === undefined) return INVALID;")), K = et;
                break;
            case "tuple":
                K = function(e, t, n, r) {
                    let i = n._zod.def,
                        a = i.items,
                        o = i.rest;
                    e.write("if (!Array.isArray(".concat(r, ")) return INVALID;"));
                    let c = aD(a, "optin"),
                        u = aD(a, "optout");
                    o ? e.write("if (".concat(r, ".length < ").concat(c, ") return INVALID;")) : e.write("if (".concat(r, ".length < ").concat(c, " || ").concat(r, ".length > ").concat(a.length, ") return INVALID;"));
                    let l = af(t);
                    e.write("const ".concat(l, " = [];"));
                    for (let n = 0; n < a.length; n++) {
                        let i = a[n];
                        if (n >= u) e.write("if (".concat(l, ".length === ").concat(n, ") {")), e.indented(e => {
                            e.write("if (".concat(n, " < ").concat(r, ".length) {")), e.indented(e => {
                                let a = af(t);
                                e.write("const ".concat(a, " = ").concat(r, "[").concat(n, "];"));
                                let o = ap(e, t, i, a);
                                e.write("".concat(l, "[").concat(n, "] = ").concat(o, ";"))
                            }), e.write("} else {"), e.indented(e => {
                                if (az(i)) return void e.write("".concat(l, ".length = ").concat(n, ";"));
                                let r = af(t),
                                    a = af(t);
                                e.write("const ".concat(r, " = undefined;")), e.write("const ".concat(a, " = (() => {")), e.indented(e => {
                                    let n = ap(e, t, i, r);
                                    e.write("return ".concat(n, ";"))
                                }), e.write("})();"), e.write("if (".concat(a, " === INVALID || ").concat(a, " === undefined) ").concat(l, ".length = ").concat(n, ";")), e.write("else ".concat(l, "[").concat(n, "] = ").concat(a, ";"))
                            }), e.write("}")
                        }), e.write("}");
                        else {
                            let a = af(t);
                            e.write("const ".concat(a, " = ").concat(r, "[").concat(n, "];"));
                            let o = ap(e, t, i, a);
                            e.write("".concat(l, "[").concat(n, "] = ").concat(o, ";"))
                        }
                    }
                    if (o) {
                        let n = af(t),
                            i = af(t);
                        e.write("for (let ".concat(n, " = ").concat(a.length, "; ").concat(n, " < ").concat(r, ".length; ").concat(n, "++) {")), e.indented(e => {
                            e.write("const ".concat(i, " = ").concat(r, "[").concat(n, "];"));
                            let a = ap(e, t, o, i);
                            e.write("".concat(l, "[").concat(n, "] = ").concat(a, ";"))
                        }), e.write("}")
                    }
                    return l
                }(e, t, n, r);
                break;
            case "union":
                K = function(e, t, n, r) {
                    let i = n._zod.def,
                        a = i.options;
                    if (i.discriminator) return function(e, t, n, r) {
                        if (n.unionFallback) throw new ac("discriminated union with unionFallback");
                        if (0 === n.options.length) return e.write("return INVALID;"), r;
                        let i = af(t),
                            a = af(t);
                        e.write("const ".concat(i, " = ").concat(r, "?.[").concat(R(n.discriminator), "];")), e.write("let ".concat(a, ";"));
                        let o = !0,
                            c = new Set;
                        for (let l of n.options) {
                            var u;
                            let s = null == (u = l._zod.propValues) ? void 0 : u[n.discriminator];
                            if (!s || 0 === s.size) throw new ac("discriminated union option without static discriminator values");
                            for (let e of s) {
                                if (c.has(e)) throw new ac("duplicate discriminator value ".concat(String(e)));
                                c.add(e)
                            }
                            let d = Array.from(s, e => (function(e, t, n) {
                                    if ("string" == typeof n) return "".concat(t, " === ").concat(R(n));
                                    if ("number" == typeof n) return Number.isNaN(n) ? "Number.isNaN(".concat(t, ")") : "".concat(t, " === ").concat(n);
                                    if ("boolean" == typeof n) return "".concat(t, " === ").concat(n);
                                    if (null === n) return "".concat(t, " === null");
                                    if (void 0 === n) return "".concat(t, " === undefined");
                                    if ("bigint" == typeof n) return "".concat(t, " === ").concat(n, "n");
                                    if ("symbol" == typeof n) {
                                        let r = ad(e, n);
                                        return "".concat(t, " === ").concat(r)
                                    }
                                    throw new ac("literal discriminator value ".concat(String(n)))
                                })(t, i, e)),
                                m = o ? "if" : "else if";
                            e.write("".concat(m, " (").concat(d.join(" || "), ") {")), e.indented(e => {
                                let n = aS(e, t, l, r);
                                e.write("".concat(a, " = ").concat(n, ";"))
                            }), e.write("}"), o = !1
                        }
                        return e.write("else { return INVALID; }"), a
                    }(e, t, i, r);
                    if (!1 === i.inclusive) throw new ac("exclusive unions (z.xor)");
                    if (0 === a.length) return e.write("return INVALID;"), r;
                    if (1 === a.length) return aS(e, t, a[0], r);
                    if (a.every(e => {
                            var t;
                            return "literal" === e._zod.def.type && !(null == (t = e._zod.def.checks) ? void 0 : t.length)
                        })) {
                        let n = ad(t, new Set(a.flatMap(e => e._zod.def.values)));
                        return e.write("if (!".concat(n, ".has(").concat(r, ")) return INVALID;")), r
                    }
                    let o = af(t);
                    e.write("let ".concat(o, ";"));
                    for (let n = 0; n < a.length; n++) {
                        let i = a[n];
                        0 === n ? e.write("".concat(o, " = (() => {")) : e.write("if (".concat(o, " === INVALID) ").concat(o, " = (() => {")), e.indented(e => {
                            let n = aS(e, t, i, r);
                            e.write("return ".concat(n, ";"))
                        }), e.write("})();")
                    }
                    return e.write("if (".concat(o, " === INVALID) return INVALID;")), o
                }(e, t, n, r);
                break;
            case "intersection":
                let en, er, ei, ea, eo;
                U = e, A = t, D = n, P = r, en = D._zod.def, A.definite = !1, er = ap(U, A, en.left, P), ei = ap(U, A, en.right, P), ea = ad(A, iu), eo = af(A), U.write("const ".concat(eo, " = ").concat(ea, "(").concat(er, ", ").concat(ei, ");")), U.write("if (!".concat(eo, ".valid) return INVALID;")), K = "".concat(eo, ".data");
                break;
            case "record":
                K = function(e, t, n, r) {
                    var i, a, o, c;
                    let u = n._zod.def,
                        l = ad(t, F);
                    e.write("if (!".concat(l, "(").concat(r, ")) return INVALID;"));
                    let s = af(t),
                        d = af(t),
                        m = af(t);
                    e.write("const ".concat(s, " = {};"));
                    let f = u.partial ? void 0 : u.keyType._zod.values;
                    if (f) {
                        let n = [];
                        for (let i of f) {
                            if ("string" != typeof i && "number" != typeof i && "symbol" != typeof i) throw new ac("record key value ".concat(String(i)));
                            let a = "number" == typeof i ? i.toString() : i;
                            if ("__proto__" === a) throw new ac('record key "__proto__"');
                            n.push(a);
                            let l = ad(t, i),
                                d = aS(e, t, u.keyType, l),
                                m = af(t);
                            e.write("const ".concat(m, " = ").concat(r, "[").concat((o = t, "string" == typeof(c = a) ? R(c) : ad(o, c)), "];"));
                            let f = ap(e, t, u.valueType, m);
                            e.write("".concat(s, "[").concat(d, "] = ").concat(f, ";"))
                        }
                        let i = ad(t, new Set(n));
                        return e.write("for (const ".concat(d, " in ").concat(r, ") {")), e.indented(e => {
                            e.write("if (".concat(i, ".has(").concat(d, ")) continue;")), "loose" === u.mode ? e.write("if (".concat(d, ' !== "__proto__") ').concat(s, "[").concat(d, "] = ").concat(r, "[").concat(d, "];")) : e.write("return INVALID;")
                        }), e.write("}"), s
                    }
                    let v = u.keyType._zod.def;
                    if (!("string" === v.type && void 0 === v.format && !v.coerce && (null != (i = null == (a = v.checks) ? void 0 : a.length) ? i : 0) === 0)) {
                        let n = "loose" === u.mode,
                            i = as(u.keyType);
                        !1 === i.definite && (t.definite = !1);
                        let a = ad(t, i),
                            o = ad(t, tb),
                            c = af(t);
                        return aP(e, t, r, d, e => {
                            e.write("let ".concat(c, " = ").concat(a, "(").concat(d, ");")), e.write("if (".concat(c, " === INVALID && typeof ").concat(d, ' === "string" && ').concat(o, ".test(").concat(d, ")) ").concat(c, " = ").concat(a, "(Number(").concat(d, "));")), n ? e.write("if (".concat(c, " === INVALID) { ").concat(s, "[").concat(d, "] = ").concat(r, "[").concat(d, "]; continue; }")) : e.write("if (".concat(c, " === INVALID) return INVALID;")), e.write("if (".concat(c, ' === "__proto__") continue;'));
                            let i = af(t);
                            e.write("const ".concat(i, " = ").concat(r, "[").concat(d, "];"));
                            let l = ap(e, t, u.valueType, i);
                            e.write("".concat(s, "[").concat(c, "] = ").concat(l, ";"))
                        }), s
                    }
                    return aP(e, t, r, d, e => {
                        e.write("const ".concat(m, " = ").concat(r, "[").concat(d, "];"));
                        let n = ap(e, t, u.valueType, m);
                        e.write("".concat(s, "[").concat(d, "] = ").concat(n, ";"))
                    }, "return INVALID;"), s
                }(e, t, n, r);
                break;
            case "map":
                let ec, eu, el, es;
                N = e, O = t, j = n, Z = r, ec = j._zod.def, N.write("if (!(".concat(Z, " instanceof Map)) return INVALID;")), eu = af(O), el = af(O), es = af(O), N.write("const ".concat(eu, " = new Map();")), N.write("for (const [".concat(el, ", ").concat(es, "] of ").concat(Z, ") {")), N.indented(e => {
                    let t = aS(e, O, ec.keyType, el),
                        n = aS(e, O, ec.valueType, es);
                    e.write("".concat(eu, ".set(").concat(t, ", ").concat(n, ");"))
                }), N.write("}"), K = eu;
                break;
            case "set":
                let ed, em, ef;
                T = e, E = t, C = n, $ = r, ed = C._zod.def, T.write("if (!(".concat($, " instanceof Set)) return INVALID;")), em = af(E), ef = af(E), T.write("const ".concat(em, " = new Set();")), T.write("for (const ".concat(ef, " of ").concat($, ") {")), T.indented(e => {
                    let t = aS(e, E, ed.valueType, ef);
                    e.write("".concat(em, ".add(").concat(t, ");"))
                }), T.write("}"), K = em;
                break;
            case "file":
                L = e, G = r, L.write("if (!(".concat(G, " instanceof File)) return INVALID;")), K = G;
                break;
            case "template_literal":
                K = function(e, t, n, r) {
                    e.write("if (typeof ".concat(r, ' !== "string") return INVALID;'));
                    let i = n._zod.pattern;
                    if (i) {
                        let n = ad(t, i);
                        e.write("".concat(n, ".lastIndex = 0;")), e.write("if (!".concat(n, ".test(").concat(r, ")) return INVALID;"))
                    }
                    return r
                }(e, t, n, r);
                break;
            case "lazy":
                let ev, ep, eg;
                J = e, B = t, M = n, q = r, ev = am(B, M._zod.def.getter), ep = ad(B, {
                    parser: null
                }), J.write("if (!".concat(ep, ".parser) {")), J.indented(e => {
                    e.write("const inner = ".concat(ev, "();")), e.write("".concat(ep, ".parser = function(input) {")), e.indented(e => {
                        e.write("const result = inner._zod.run({ value: input, issues: [] }, {});"), e.write("return result.issues.length === 0 ? result.value : INVALID;")
                    }), e.write("};")
                }), J.write("}"), eg = af(B), J.write("const ".concat(eg, " = ").concat(ep, ".parser(").concat(q, ");")), J.write("if (".concat(eg, " === INVALID) return INVALID;")), K = eg;
                break;
            case "pipe":
                K = function(e, t, n, r) {
                    let i = n._zod.def,
                        a = aS(e, t, i.in, r);
                    if (!i.transform) return aS(e, t, i.out, a);
                    {
                        if (aN(i.transform)) throw new ao("z.compile: async transforms in pipes are not supported");
                        let n = i.transform,
                            r = am(t, e => {
                                let t = {
                                        value: e,
                                        issues: [],
                                        addIssue: aw
                                    },
                                    r = n(e, t);
                                return r instanceof Promise ? ai : 0 === t.issues.length ? r : ai
                            }),
                            o = af(t);
                        return e.write("const ".concat(o, " = ").concat(r, "(").concat(a, ");")), e.write("if (".concat(o, " === INVALID) return INVALID;")), aS(e, t, i.out, o)
                    }
                }(e, t, n, r);
                break;
            case "custom":
                K = function(e, t, n, r) {
                    let i = n._zod.def;
                    if (i.fn) {
                        if (aN(i.fn)) throw new ao("z.compile: async custom predicates are not supported");
                        let n = am(t, i.fn),
                            a = ad(t, aI),
                            o = af(t);
                        e.write("const ".concat(o, " = ").concat(n, "(").concat(r, ");")), e.write("if (".concat(o, " instanceof Promise) ").concat(a, "();")), e.write("if (!".concat(o, ") return INVALID;"))
                    } else throw new ac("custom schema without a predicate function");
                    return r
                }(e, t, n, r);
                break;
            case "transform":
                K = function(e, t, n, r) {
                    let i = n._zod.def;
                    if (i.transform) {
                        if (aN(i.transform)) throw new ao("z.compile: async transforms are not supported");
                        let n = i.transform,
                            a = am(t, e => {
                                let t = {
                                        value: e,
                                        issues: [],
                                        addIssue: aw
                                    },
                                    r = n(e, t);
                                return r instanceof Promise ? ai : 0 === t.issues.length ? r : ai
                            }),
                            o = af(t);
                        return e.write("const ".concat(o, " = ").concat(a, "(").concat(r, ");")), e.write("if (".concat(o, " === INVALID) return INVALID;")), o
                    }
                    return r
                }(e, t, n, r);
                break;
            case "catch":
                K = function(e, t, n, r) {
                    let i = n._zod.def;
                    if (!i.catchValue[eJ]) throw new ac("catch with a callback (only a constant catch value compiles)", !1);
                    let a = af(t);
                    e.write("let ".concat(a, " = (() => {")), e.indented(e => {
                        let n = ap(e, t, i.innerType, r);
                        e.write("return ".concat(n, ";"))
                    }), e.write("})();");
                    let o = ad(t, i.innerType),
                        c = am(t, i.catchValue),
                        u = ad(t, aO);
                    return e.write("if (".concat(a, " === INVALID) {")), e.indented(e => {
                        e.write("".concat(a, " = ").concat(u, "(").concat(o, ", ").concat(c, ", ").concat(r, ");")), e.write("if (".concat(a, " === INVALID) return INVALID;"))
                    }), e.write("}"), a
                }(e, t, n, r);
                break;
            default:
                throw new ac("schema type ".concat(H))
        }
        return null === K ? null : function(e, t, n, r) {
            let i = n._zod.def.checks;
            if (!i || 0 === i.length) return r;
            let a = r;
            for (let n of i) {
                let r = n._zod.def;
                if (r.when && !ag.has(r.check)) throw new ac('check with a custom "when" condition');
                switch (r.check) {
                    case "greater_than":
                        ! function(e, t, n, r) {
                            let i = n.inclusive ? "<" : "<=";
                            e.write("if (".concat(r, " ").concat(i, " ").concat(ab(t, n.value), ") return INVALID;"))
                        }(e, t, r, a);
                        break;
                    case "less_than":
                        ! function(e, t, n, r) {
                            let i = n.inclusive ? ">" : ">=";
                            e.write("if (".concat(r, " ").concat(i, " ").concat(ab(t, n.value), ") return INVALID;"))
                        }(e, t, r, a);
                        break;
                    case "multiple_of":
                        ! function(e, t, n, r) {
                            if ("bigint" == typeof n.value) {
                                if (n.value === BigInt(0)) throw new ac("multiple_of check with a zero divisor");
                                e.write("if (".concat(r, " % ").concat(n.value, "n !== 0n) return INVALID;"))
                            } else {
                                let i = ad(t, S);
                                e.write("if (".concat(i, "(").concat(r, ", ").concat(a_(n.value, "multiple_of"), ") !== 0) return INVALID;"))
                            }
                        }(e, t, r, a);
                        break;
                    case "number_format":
                        ay(e, r, a);
                        break;
                    case "min_length": {
                        let n = a_(r.minimum, "min_length"),
                            i = ah(e, t, a, "".concat(a, ".length >= ").concat(n, " && ").concat(a, ".length < ").concat(2 * r.minimum));
                        e.write("if (".concat(i, " < ").concat(n, ") return INVALID;"));
                        break
                    }
                    case "max_length": {
                        let n = a_(r.maximum, "max_length"),
                            i = ah(e, t, a, "".concat(a, ".length > ").concat(n));
                        e.write("if (".concat(i, " > ").concat(n, ") return INVALID;"));
                        break
                    }
                    case "length_equals": {
                        let n = a_(r.length, "length_equals"),
                            i = ah(e, t, a, "".concat(a, ".length >= ").concat(n, " && ").concat(a, ".length <= ").concat(2 * r.length));
                        e.write("if (".concat(i, " !== ").concat(n, ") return INVALID;"));
                        break
                    }
                    case "min_size":
                        e.write("if (".concat(a, ".size < ").concat(a_(r.minimum, "min_size"), ") return INVALID;"));
                        break;
                    case "max_size":
                        e.write("if (".concat(a, ".size > ").concat(a_(r.maximum, "max_size"), ") return INVALID;"));
                        break;
                    case "size_equals":
                        e.write("if (".concat(a, ".size !== ").concat(a_(r.size, "size_equals"), ") return INVALID;"));
                        break;
                    case "string_format":
                        a = ax(e, t, r, a);
                        break;
                    case "custom":
                        a = function(e, t, n, r) {
                            let i = n._zod.def;
                            if (i.fn) {
                                if (aN(i.fn)) throw new ao("z.compile: async .refine() predicates are not supported");
                                let n = am(t, i.fn),
                                    a = ad(t, aI),
                                    o = af(t);
                                return e.write("const ".concat(o, " = ").concat(n, "(").concat(r, ");")), e.write("if (".concat(o, " instanceof Promise) ").concat(a, "();")), e.write("if (!".concat(o, ") return INVALID;")), r
                            }
                            if (n._zod.check) {
                                if (aN(n._zod.check)) throw new ao("z.compile: async .superRefine() / check functions are not supported");
                                let i = n._zod.check,
                                    a = am(t, e => {
                                        let t = {
                                            value: e,
                                            issues: [],
                                            addIssue: aw
                                        };
                                        return i(t) instanceof Promise && aI(), 0 === t.issues.length ? t.value : ai
                                    }),
                                    o = af(t);
                                return e.write("const ".concat(o, " = ").concat(a, "(").concat(r, ");")), e.write("if (".concat(o, " === INVALID) return INVALID;")), o
                            }
                            throw new ac("custom check without a predicate or check function")
                        }(e, t, n, a);
                        break;
                    case "bigint_format":
                        ! function(e, t, n) {
                            let r = t.format;
                            if (r) switch (r) {
                                case "int64":
                                    e.write("if (".concat(n, " < -9223372036854775808n || ").concat(n, " > 9223372036854775807n) return INVALID;"));
                                    break;
                                case "uint64":
                                    e.write("if (".concat(n, " < 0n || ").concat(n, " > 18446744073709551615n) return INVALID;"));
                                    break;
                                default:
                                    throw new ac("bigint format ".concat(r))
                            }
                        }(e, r, a);
                        break;
                    case "mime_type":
                        ! function(e, t, n, r) {
                            let i = n.mime;
                            if (i && i.length > 0) {
                                let n = ad(t, new Set(i));
                                e.write("if (!".concat(n, ".has(").concat(r, ".type)) return INVALID;"))
                            }
                        }(e, t, r, a);
                        break;
                    case "property":
                        ! function(e, t, n, r) {
                            let i = "".concat(r, "[").concat(JSON.stringify(n.property), "]");
                            aS(e, t, n.schema, i)
                        }(e, t, r, a);
                        break;
                    case "properties":
                        ! function(e, t, n, r) {
                            if (n.when) throw new ac('check with a custom "when" condition');
                            e.write("if (".concat(r, " == null) return INVALID;"));
                            let i = n.shape;
                            for (let n of Reflect.ownKeys(i)) {
                                let a = "symbol" == typeof n ? ad(t, n) : R(n),
                                    o = af(t);
                                e.write("const ".concat(o, " = ").concat(r, "[").concat(a, "];")), ap(e, t, i[n], o, !1)
                            }
                        }(e, t, r, a);
                        break;
                    case "overwrite": {
                        let r = af(t);
                        (function(e, t, n, r, i) {
                            let a = n._zod.def.tx;
                            if (!a) throw new ac("overwrite check without a transform function");
                            if (aN(a)) throw new ao("z.compile: async overwrite transforms are not supported");
                            let o = ad(t, a);
                            e.write("const ".concat(i, " = ").concat(o, "(").concat(r, ");"))
                        })(e, t, n, a, r), a = r;
                        break
                    }
                    default:
                        throw new ac("check type ".concat(r.check))
                }
            }
            return a
        }(e, t, n, K)
    }

    function az(e) {
        return "optional" === e._zod.optin && "optional" === e._zod.optout
    }

    function aU(e) {
        return ("defaulted" !== e._zod.optin || "optional" === e._zod.optout) && function e(t) {
            var n, r;
            let i = t._zod.def;
            switch (i.type) {
                case "string":
                case "number":
                case "boolean":
                case "bigint":
                case "symbol":
                case "null":
                case "nan":
                case "date":
                case "object":
                case "array":
                case "tuple":
                case "record":
                case "map":
                case "set":
                case "file":
                case "template_literal":
                case "never":
                case "success":
                    return !1;
                case "literal":
                    return !!(null == (n = i.values) ? void 0 : n.includes(void 0));
                case "enum":
                    return !!(null == (r = t._zod.values) ? void 0 : r.has(void 0));
                case "optional":
                default:
                    return !0;
                case "nullable":
                case "readonly":
                case "nonoptional":
                    return !i.innerType || e(i.innerType);
                case "union":
                    return !i.options || i.options.some(e);
                case "intersection":
                    return !i.left || !i.right || e(i.left) || e(i.right);
                case "pipe":
                    return !i.out || e(i.out)
            }
        }(e)
    }

    function aA(e, t, n, r) {
        return aS(e, t, n._zod.def.innerType, r)
    }

    function aD(e, t) {
        for (let n = e.length - 1; n >= 0; n--)
            if (!("optin" === t ? void 0 !== e[n]._zod.optin : "optional" === e[n]._zod.optout)) return n + 1;
        return 0
    }

    function aP(e, t, n, r, i, a) {
        let o = ad(t, Object.prototype.propertyIsEnumerable),
            c = af(t),
            u = af(t),
            l = af(t);
        e.write("const ".concat(c, " = Object.getOwnPropertySymbols(").concat(n, ");")), e.write("const ".concat(u, " = Object.getOwnPropertyNames(").concat(n, ");")), e.write("for (let ".concat(l, " = 0; ").concat(l, " < ").concat(u, ".length; ").concat(l, "++) {")), e.indented(e => {
            e.write("const ".concat(r, " = ").concat(u, "[").concat(l, "];")), e.write("if (".concat(r, ' === "__proto__" || !').concat(o, ".call(").concat(n, ", ").concat(r, ")) continue;")), i(e)
        }), e.write("}"), e.write("for (let ".concat(l, " = 0; ").concat(l, " < ").concat(c, ".length; ").concat(l, "++) {")), e.indented(e => {
            e.write("const ".concat(r, " = ").concat(c, "[").concat(l, "];")), e.write("if (!".concat(o, ".call(").concat(n, ", ").concat(r, ")) continue;")), a ? e.write(a) : i(e)
        }), e.write("}")
    }

    function aN(e) {
        return "function" == typeof e && ("AsyncFunction" === e.constructor.name || "AsyncFunction" === e[Symbol.toStringTag])
    }

    function aO(e, t, n) {
        let r = e._zod.run({
            value: n,
            issues: []
        }, {});
        return r && "function" == typeof r.then ? ai : 0 === r.issues.length ? r.value : t()
    }

    function aj(e) {
        return e.checks && (e.checks = [...e.checks]), e
    }

    function aZ(e, t) {
        return new e(aj({
            type: "string",
            ...Q(t)
        }))
    }

    function aT(e, t) {
        return new e(aj({
            type: "string",
            coerce: !0,
            ...Q(t)
        }))
    }

    function aE(e, t) {
        return new e({
            type: "string",
            format: "email",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }

    function aC(e, t) {
        return new e({
            type: "string",
            format: "guid",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }

    function a$(e, t) {
        return new e({
            type: "string",
            format: "uuid",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }

    function aL(e, t) {
        return new e({
            type: "string",
            format: "uuid",
            check: "string_format",
            abort: !1,
            version: "v4",
            ...Q(t)
        })
    }

    function aR(e, t) {
        return new e({
            type: "string",
            format: "uuid",
            check: "string_format",
            abort: !1,
            version: "v6",
            ...Q(t)
        })
    }

    function aG(e, t) {
        return new e({
            type: "string",
            format: "uuid",
            check: "string_format",
            abort: !1,
            version: "v7",
            ...Q(t)
        })
    }

    function aJ(e, t) {
        return new e({
            type: "string",
            format: "url",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }

    function aB(e, t) {
        return new e({
            type: "string",
            format: "emoji",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }

    function aM(e, t) {
        return new e({
            type: "string",
            format: "nanoid",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }

    function aF(e, t) {
        return new e({
            type: "string",
            format: "cuid",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }

    function aV(e, t) {
        return new e({
            type: "string",
            format: "cuid2",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }

    function aq(e, t) {
        return new e({
            type: "string",
            format: "ulid",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }

    function aK(e, t) {
        return new e({
            type: "string",
            format: "xid",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }

    function aW(e, t) {
        return new e({
            type: "string",
            format: "ksuid",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }

    function aX(e, t) {
        return new e({
            type: "string",
            format: "ipv4",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }

    function aH(e, t) {
        return new e({
            type: "string",
            format: "ipv6",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }

    function aY(e, t) {
        return new e({
            type: "string",
            format: "mac",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }

    function aQ(e, t) {
        return new e({
            type: "string",
            format: "cidrv4",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }

    function a0(e, t) {
        return new e({
            type: "string",
            format: "cidrv6",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }

    function a4(e, t) {
        return new e({
            type: "string",
            format: "base64",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }

    function a1(e, t) {
        return new e({
            type: "string",
            format: "base64url",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }

    function a6(e, t) {
        return new e({
            type: "string",
            format: "e164",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }

    function a2(e, t) {
        return new e({
            type: "string",
            format: "credit_card",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }

    function a5(e, t) {
        return new e({
            type: "string",
            format: "iban",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }

    function a3(e, t) {
        return new e({
            type: "string",
            format: "jwt",
            check: "string_format",
            abort: !1,
            ...Q(t)
        })
    }
    e.s(["INVALID", 0, ai, "ZodCompileAsyncError", 0, ao, "ZodCompileUnsupportedError", 0, ac, "compile", 0, au, "compileFn", 0, as, "withParser", 0, al], 583787), e.i(583787);
    let a9 = {
        Any: null,
        Minute: -1,
        Second: 0,
        Millisecond: 3,
        Microsecond: 6
    };

    function a8(e, t) {
        return new e({
            type: "string",
            format: "datetime",
            check: "string_format",
            offset: !1,
            local: !1,
            precision: null,
            ...Q(t)
        })
    }

    function a7(e, t) {
        return new e({
            type: "string",
            format: "date",
            check: "string_format",
            ...Q(t)
        })
    }

    function oe(e, t) {
        return new e({
            type: "string",
            format: "time",
            check: "string_format",
            precision: null,
            ...Q(t)
        })
    }

    function ot(e, t) {
        return new e({
            type: "string",
            format: "duration",
            check: "string_format",
            ...Q(t)
        })
    }

    function on(e, t) {
        return new e(aj({
            type: "number",
            checks: [],
            ...Q(t)
        }))
    }

    function or(e, t) {
        return new e(aj({
            type: "number",
            coerce: !0,
            checks: [],
            ...Q(t)
        }))
    }

    function oi(e, t) {
        return new e({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "safeint",
            ...Q(t)
        })
    }

    function oa(e, t) {
        return new e({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "float32",
            ...Q(t)
        })
    }

    function oo(e, t) {
        return new e({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "float64",
            ...Q(t)
        })
    }

    function oc(e, t) {
        return new e({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "int32",
            ...Q(t)
        })
    }

    function ou(e, t) {
        return new e({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "uint32",
            ...Q(t)
        })
    }

    function ol(e, t) {
        return new e({
            type: "boolean",
            ...Q(t)
        })
    }

    function os(e, t) {
        return new e({
            type: "boolean",
            coerce: !0,
            ...Q(t)
        })
    }

    function od(e, t) {
        return new e({
            type: "bigint",
            ...Q(t)
        })
    }

    function om(e, t) {
        return new e({
            type: "bigint",
            coerce: !0,
            ...Q(t)
        })
    }

    function of(e, t) {
        return new e({
            type: "bigint",
            check: "bigint_format",
            abort: !1,
            format: "int64",
            ...Q(t)
        })
    }

    function ov(e, t) {
        return new e({
            type: "bigint",
            check: "bigint_format",
            abort: !1,
            format: "uint64",
            ...Q(t)
        })
    }

    function op(e, t) {
        return new e({
            type: "symbol",
            ...Q(t)
        })
    }

    function og(e, t) {
        return new e({
            type: "undefined",
            ...Q(t)
        })
    }

    function oh(e, t) {
        return new e({
            type: "null",
            ...Q(t)
        })
    }

    function o_(e) {
        return new e({
            type: "any"
        })
    }

    function ob(e) {
        return new e({
            type: "unknown"
        })
    }

    function oy(e, t) {
        return new e({
            type: "never",
            ...Q(t)
        })
    }

    function oI(e, t) {
        return new e({
            type: "void",
            ...Q(t)
        })
    }

    function ow(e, t) {
        return new e({
            type: "date",
            ...Q(t)
        })
    }

    function ok(e, t) {
        return new e({
            type: "date",
            coerce: !0,
            ...Q(t)
        })
    }

    function ox(e, t) {
        return new e({
            type: "nan",
            ...Q(t)
        })
    }

    function oS(e, t) {
        return new nP({
            check: "less_than",
            ...Q(t),
            value: e,
            inclusive: !1
        })
    }

    function oz(e, t) {
        return new nP({
            check: "less_than",
            ...Q(t),
            value: e,
            inclusive: !0
        })
    }

    function oU(e, t) {
        return new nN({
            check: "greater_than",
            ...Q(t),
            value: e,
            inclusive: !1
        })
    }

    function oA(e, t) {
        return new nN({
            check: "greater_than",
            ...Q(t),
            value: e,
            inclusive: !0
        })
    }

    function oD(e) {
        return oU(0, e)
    }

    function oP(e) {
        return oS(0, e)
    }

    function oN(e) {
        return oz(0, e)
    }

    function oO(e) {
        return oA(0, e)
    }

    function oj(e, t) {
        return new nO({
            check: "multiple_of",
            ...Q(t),
            value: e
        })
    }

    function oZ(e, t) {
        return new nT({
            check: "max_size",
            ...Q(t),
            maximum: e
        })
    }

    function oT(e, t) {
        return new nE({
            check: "min_size",
            ...Q(t),
            minimum: e
        })
    }

    function oE(e, t) {
        return new nC({
            check: "size_equals",
            ...Q(t),
            size: e
        })
    }

    function oC(e, t) {
        return new n$({
            check: "max_length",
            ...Q(t),
            maximum: e
        })
    }

    function o$(e, t) {
        return new nL({
            check: "min_length",
            ...Q(t),
            minimum: e
        })
    }

    function oL(e, t) {
        return new nR({
            check: "length_equals",
            ...Q(t),
            length: e
        })
    }

    function oR(e, t) {
        return new nJ({
            check: "string_format",
            format: "regex",
            ...Q(t),
            pattern: e
        })
    }

    function oG(e) {
        return new nB({
            check: "string_format",
            format: "lowercase",
            ...Q(e)
        })
    }

    function oJ(e) {
        return new nM({
            check: "string_format",
            format: "uppercase",
            ...Q(e)
        })
    }

    function oB(e, t) {
        return new nF({
            check: "string_format",
            format: "includes",
            ...Q(t),
            includes: e
        })
    }

    function oM(e, t) {
        return new nV({
            check: "string_format",
            format: "starts_with",
            ...Q(t),
            prefix: e
        })
    }

    function oF(e, t) {
        return new nq({
            check: "string_format",
            format: "ends_with",
            ...Q(t),
            suffix: e
        })
    }

    function oV(e, t, n) {
        return new nW({
            check: "property",
            property: e,
            schema: t,
            ...Q(n)
        })
    }

    function oq(e, t) {
        return new nX({
            check: "properties",
            shape: e,
            ...Q(t)
        })
    }

    function oK(e, t) {
        return new nH({
            check: "mime_type",
            mime: e,
            ...Q(t)
        })
    }

    function oW(e) {
        return new nY({
            check: "overwrite",
            tx: e
        })
    }

    function oX(e) {
        return oW(t => t.normalize(e))
    }

    function oH() {
        return oW(e => e.trim())
    }

    function oY() {
        return oW(e => e.toLowerCase())
    }

    function oQ() {
        return oW(e => e.toUpperCase())
    }

    function o0() {
        return oW(e => G(e))
    }

    function o4(e, t, n) {
        return new e({
            type: "array",
            element: t,
            ...Q(n)
        })
    }

    function o1(e, t, n) {
        return new e({
            type: "union",
            options: t,
            ...Q(n)
        })
    }

    function o6(e, t, n) {
        return new e({
            type: "union",
            options: t,
            inclusive: !1,
            ...Q(n)
        })
    }

    function o2(e, t, n, r) {
        return new e({
            type: "union",
            options: n,
            discriminator: t,
            ...Q(r)
        })
    }

    function o5(e, t, n) {
        return new e({
            type: "intersection",
            left: t,
            right: n
        })
    }

    function o3(e, t, n, r) {
        let i = n instanceof n4,
            a = i ? r : n;
        return new e({
            type: "tuple",
            items: t,
            rest: i ? n : null,
            ...Q(a)
        })
    }

    function o9(e, t, n, r) {
        return new e({
            type: "record",
            keyType: t,
            valueType: n,
            ...Q(r)
        })
    }

    function o8(e, t, n, r) {
        return new e({
            type: "map",
            keyType: t,
            valueType: n,
            ...Q(r)
        })
    }

    function o7(e, t, n) {
        return new e({
            type: "set",
            valueType: t,
            ...Q(n)
        })
    }

    function ce(e, t, n) {
        return new e({
            type: "enum",
            entries: Array.isArray(t) ? Object.fromEntries(t.map(e => [e, e])) : t,
            ...Q(n)
        })
    }

    function ct(e, t, n) {
        return new e({
            type: "enum",
            entries: t,
            ...Q(n)
        })
    }

    function cn(e, t, n) {
        return new e({
            type: "literal",
            values: Array.isArray(t) ? t : [t],
            ...Q(n)
        })
    }

    function cr(e, t) {
        return new e({
            type: "file",
            ...Q(t)
        })
    }

    function ci(e, t) {
        return new e({
            type: "transform",
            transform: t
        })
    }

    function ca(e, t) {
        return new e({
            type: "optional",
            innerType: t
        })
    }

    function co(e, t) {
        return new e({
            type: "nullable",
            innerType: t
        })
    }

    function cc(e, t, n) {
        return new e({
            type: "default",
            innerType: t,
            get defaultValue() {
                return "function" == typeof n ? n() : V(n)
            }
        })
    }

    function cu(e, t, n) {
        return new e({
            type: "nonoptional",
            innerType: t,
            ...Q(n)
        })
    }

    function cl(e, t) {
        return new e({
            type: "success",
            innerType: t
        })
    }

    function cs(e, t, n) {
        return new e({
            type: "catch",
            innerType: t,
            catchValue: "function" == typeof n ? n : eB(n)
        })
    }

    function cd(e, t, n) {
        return new e({
            type: "pipe",
            in: t,
            out: n
        })
    }

    function cm(e, t) {
        return new e({
            type: "readonly",
            innerType: t
        })
    }

    function cf(e, t, n) {
        return new e({
            type: "template_literal",
            parts: t,
            ...Q(n)
        })
    }

    function cv(e, t) {
        return new e({
            type: "lazy",
            getter: t
        })
    }

    function cp(e, t) {
        return new e({
            type: "promise",
            innerType: t
        })
    }

    function cg(e, t, n) {
        let r = Q(n);
        return null != r.abort || (r.abort = !0), new e({
            type: "custom",
            check: "custom",
            fn: t,
            ...r
        })
    }

    function ch(e, t, n) {
        return new e({
            type: "custom",
            check: "custom",
            fn: t,
            ...Q(n)
        })
    }

    function c_(e, t) {
        let n = cb(t => (t.addIssue = e => {
            if ("string" == typeof e) t.issues.push(eS(e, t.value, n._zod.def));
            else e.fatal && (e.continue = !1), null != e.code || (e.code = "custom"), "input" in e || (e.input = t.value), null != e.inst || (e.inst = n), null != e.continue || (e.continue = !n._zod.def.abort), t.issues.push(eS(e))
        }, e(t.value, t)), t);
        return n
    }

    function cb(e, t) {
        let n = new nz({
            check: "custom",
            ...Q(t)
        });
        return n._zod.check = e, n
    }

    function cy(e) {
        let t = new nz({
            check: "describe"
        });
        return t._zod.onattach = [t => {
            var n;
            let r = null != (n = ar.get(t)) ? n : {};
            ar.add(t, {
                ...r,
                description: e
            })
        }], t._zod.check = () => {}, t
    }

    function cI(e) {
        let t = new nz({
            check: "meta"
        });
        return t._zod.onattach = [t => {
            var n;
            let r = null != (n = ar.get(t)) ? n : {};
            ar.add(t, {
                ...r,
                ...e
            })
        }], t._zod.check = () => {}, t
    }

    function cw(e, t) {
        var n, r, i, a, o, c;
        let u = Q(t),
            l = null != (n = u.truthy) ? n : ["true", "1", "yes", "on", "y", "enabled"],
            s = null != (r = u.falsy) ? r : ["false", "0", "no", "off", "n", "disabled"];
        "sensitive" !== u.case && (l = l.map(e => "string" == typeof e ? e.toLowerCase() : e), s = s.map(e => "string" == typeof e ? e.toLowerCase() : e));
        let d = new Set(l),
            m = new Set(s),
            f = null != (i = e.Codec) ? i : iL,
            v = null != (a = e.Boolean) ? a : rM,
            p = new f({
                type: "pipe",
                in: new(null != (o = e.String) ? o : n5)({
                    type: "string",
                    error: u.error
                }),
                out: new v({
                    type: "boolean",
                    error: u.error
                }),
                transform: (e, t) => {
                    let n = e;
                    return "sensitive" !== u.case && (n = n.toLowerCase()), !!d.has(n) || !m.has(n) && (t.issues.push({
                        code: "invalid_value",
                        expected: "stringbool",
                        values: [...d, ...m],
                        input: t.value,
                        inst: p,
                        continue: !1
                    }), {})
                },
                reverseTransform: (e, t) => !0 === e ? l[0] || "true" : s[0] || "false",
                error: u.error
            });
        return p._zod.bag.truthy = l, p._zod.bag.falsy = s, p._zod.bag.case = null != (c = u.case) ? c : "insensitive", p
    }

    function ck(e, t, n) {
        let r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : {},
            i = {
                check: "string_format",
                type: "string",
                format: t,
                fn: "function" == typeof n ? n : e => n.test(e),
                ...Q(r)
            };
        return n instanceof RegExp && (i.pattern = n), new e(i)
    }

    function cx(e) {
        for (var t = arguments.length, n = Array(t > 1 ? t - 1 : 0), r = 1; r < t; r++) n[r - 1] = arguments[r];
        for (let t of n)
            for (let n of Reflect.ownKeys(t)) Object.prototype.propertyIsEnumerable.call(t, n) && D(e, n, t[n]);
        return e
    }

    function cS(e) {
        var t, n, r, i, a, o, c, u, l;
        let s = null != (t = null == e ? void 0 : e.target) ? t : "draft-2020-12";
        return "draft-4" === s && (s = "draft-04"), "draft-7" === s && (s = "draft-07"), {
            processors: null != (n = e.processors) ? n : {},
            metadataRegistry: null != (r = null == e ? void 0 : e.metadata) ? r : ar,
            target: s,
            unrepresentable: null != (i = null == e ? void 0 : e.unrepresentable) ? i : "throw",
            override: null != (a = null == e ? void 0 : e.override) ? a : () => {},
            io: null != (o = null == e ? void 0 : e.io) ? o : "output",
            counter: 0,
            seen: new Map,
            sharedDefsExtractedFor: void 0,
            sharedEmitDoneFor: void 0,
            cycles: null != (c = null == e ? void 0 : e.cycles) ? c : "ref",
            reused: null != (u = null == e ? void 0 : e.reused) ? u : "inline",
            intersections: [],
            deferred: [],
            external: null != (l = null == e ? void 0 : e.external) ? l : void 0
        }
    }

    function cz(e, t, n, r, i) {
        let a = "function" == typeof t.unrepresentable ? t.unrepresentable({
            zodSchema: e,
            path: r.path,
            message: i
        }) : t.unrepresentable;
        if ("any" === a) return !1;
        if (void 0 === a || "throw" === a) throw Error(i);
        return Object.assign(n, a), !0
    }

    function cU(e, t) {
        var n, r, i;
        let a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {
                path: [],
                schemaPath: []
            },
            o = e._zod.def,
            c = t.seen.get(e);
        if (c) return c.count++, a.schemaPath.includes(e) && (c.cycle = a.path), c.schema;
        let u = {
            schema: {},
            count: 1,
            cycle: void 0,
            path: a.path
        };
        t.seen.set(e, u), t.sharedDefsExtractedFor = void 0, t.sharedEmitDoneFor = void 0;
        let l = null == (n = (r = e._zod).toJSONSchema) ? void 0 : n.call(r);
        if (l) u.schema = l;
        else {
            let n = {
                ...a,
                schemaPath: [...a.schemaPath, e],
                path: a.path
            };
            if (e._zod.processJSONSchema) e._zod.processJSONSchema(t, u.schema, n);
            else {
                let r = u.schema,
                    i = t.processors[o.type];
                if (!i) throw Error("[toJSONSchema]: Non-representable type encountered: ".concat(o.type));
                i(e, t, r, n)
            }
            let r = e._zod.parent;
            r && (u.ref || (u.ref = r), cU(r, t, n), t.seen.get(r).isParent = !0)
        }
        let s = t.metadataRegistry.get(e);
        return s && cx(u.schema, s), "input" === t.io && function e(t, n) {
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
        }(e) && (delete u.schema.examples, delete u.schema.default), "input" === t.io && "_prefault" in u.schema && (null != (i = u.schema).default || (i.default = u.schema._prefault)), delete u.schema._prefault, t.seen.get(e).schema
    }

    function cA(e) {
        return e.replace(/~/g, "~0").replace(/\//g, "~1")
    }

    function cD(e, t) {
        var n, r, i, a;
        let o = e.seen.get(t);
        if (!o) throw Error("Unprocessed schema. This is a bug in Zod.");
        if (e.external && e.sharedDefsExtractedFor === e.external) return;
        let c = new Map;
        for (let t of e.seen.entries()) {
            let r = null == (n = e.metadataRegistry.get(t[0])) ? void 0 : n.id;
            if (r) {
                let e = c.get(r);
                if (e && e !== t[0]) throw Error('Duplicate schema id "'.concat(r, '" detected during JSON Schema conversion. Two different schemas cannot share the same id when converted together.'));
                c.set(r, t[0])
            }
        }
        let u = t => {
            if (t[1].schema.$ref) return;
            let n = t[1],
                {
                    ref: r,
                    defId: i
                } = (t => {
                    var n, r, i, a, c;
                    let u = "draft-2020-12" === e.target ? "$defs" : "definitions";
                    if (e.external) {
                        let n = null == (c = e.external.registry.get(t[0])) ? void 0 : c.id,
                            o = null != (r = e.external.uri) ? r : e => e;
                        if (n) return {
                            ref: o(n)
                        };
                        let l = null != (i = null != (a = t[1].defId) ? a : t[1].schema.id) ? i : "schema".concat(e.counter++);
                        return t[1].defId = l, {
                            defId: l,
                            ref: "".concat(o("__shared"), "#/").concat(u, "/").concat(cA(l))
                        }
                    }
                    let l = "".concat("#", "/").concat(u, "/");
                    if (t[1] === o && !t[1].schema.id) return {
                        ref: "#"
                    };
                    let s = null != (n = t[1].schema.id) ? n : "__schema".concat(e.counter++);
                    return {
                        defId: s,
                        ref: l + cA(s)
                    }
                })(t);
            n.def = {
                ...n.schema
            }, i && (n.defId = i);
            let a = n.schema;
            for (let e in a) delete a[e];
            a.$ref = r
        };
        if ("throw" === e.cycles)
            for (let t of e.seen.entries()) {
                let e = t[1];
                if (e.cycle) throw Error("Cycle detected: " + "#/".concat(null == (r = e.cycle) ? void 0 : r.join("/"), "/<root>") + '\n\nSet the `cycles` parameter to `"ref"` to resolve cyclical schemas with defs.')
            }
        for (let n of e.seen.entries()) {
            let r = n[1];
            if (t === n[0]) {
                u(n);
                continue
            }
            if (e.external) {
                let r = null == (a = e.external.registry.get(n[0])) ? void 0 : a.id;
                if (t !== n[0] && r) {
                    u(n);
                    continue
                }
            }
            if ((null == (i = e.metadataRegistry.get(n[0])) ? void 0 : i.id) || r.cycle) {
                u(n);
                continue
            }
            r.count > 1 && "ref" === e.reused && u(n)
        }
        e.external && (e.sharedDefsExtractedFor = e.external)
    }
    e.s(["TimePrecision", 0, a9, "_any", 0, o_, "_array", 0, o4, "_base64", 0, a4, "_base64url", 0, a1, "_bigint", 0, od, "_boolean", 0, ol, "_catch", 0, cs, "_check", 0, cb, "_cidrv4", 0, aQ, "_cidrv6", 0, a0, "_coercedBigint", 0, om, "_coercedBoolean", 0, os, "_coercedDate", 0, ok, "_coercedNumber", 0, or, "_coercedString", 0, aT, "_creditCard", 0, a2, "_cuid", 0, aF, "_cuid2", 0, aV, "_custom", 0, cg, "_date", 0, ow, "_default", 0, cc, "_discriminatedUnion", 0, o2, "_e164", 0, a6, "_email", 0, aE, "_emoji", 0, aB, "_endsWith", 0, oF, "_enum", 0, ce, "_file", 0, cr, "_float32", 0, oa, "_float64", 0, oo, "_gt", 0, oU, "_gte", 0, oA, "_guid", 0, aC, "_iban", 0, a5, "_includes", 0, oB, "_int", 0, oi, "_int32", 0, oc, "_int64", 0, of, "_intersection", 0, o5, "_ipv4", 0, aX, "_ipv6", 0, aH, "_isoDate", 0, a7, "_isoDateTime", 0, a8, "_isoDuration", 0, ot, "_isoTime", 0, oe, "_jwt", 0, a3, "_ksuid", 0, aW, "_lazy", 0, cv, "_length", 0, oL, "_literal", 0, cn, "_lowercase", 0, oG, "_lt", 0, oS, "_lte", 0, oz, "_mac", 0, aY, "_map", 0, o8, "_max", 0, oz, "_maxLength", 0, oC, "_maxSize", 0, oZ, "_mime", 0, oK, "_min", 0, oA, "_minLength", 0, o$, "_minSize", 0, oT, "_multipleOf", 0, oj, "_nan", 0, ox, "_nanoid", 0, aM, "_nativeEnum", 0, ct, "_negative", 0, oP, "_never", 0, oy, "_nonnegative", 0, oO, "_nonoptional", 0, cu, "_nonpositive", 0, oN, "_normalize", 0, oX, "_null", 0, oh, "_nullable", 0, co, "_number", 0, on, "_optional", 0, ca, "_overwrite", 0, oW, "_pipe", 0, cd, "_positive", 0, oD, "_promise", 0, cp, "_properties", 0, oq, "_property", 0, oV, "_readonly", 0, cm, "_record", 0, o9, "_refine", 0, ch, "_regex", 0, oR, "_set", 0, o7, "_size", 0, oE, "_slugify", 0, o0, "_startsWith", 0, oM, "_string", 0, aZ, "_stringFormat", 0, ck, "_stringbool", 0, cw, "_success", 0, cl, "_superRefine", 0, c_, "_symbol", 0, op, "_templateLiteral", 0, cf, "_toLowerCase", 0, oY, "_toUpperCase", 0, oQ, "_transform", 0, ci, "_trim", 0, oH, "_tuple", 0, o3, "_uint32", 0, ou, "_uint64", 0, ov, "_ulid", 0, aq, "_undefined", 0, og, "_union", 0, o1, "_unknown", 0, ob, "_uppercase", 0, oJ, "_url", 0, aJ, "_uuid", 0, a$, "_uuidv4", 0, aL, "_uuidv6", 0, aR, "_uuidv7", 0, aG, "_void", 0, oI, "_xid", 0, aK, "_xor", 0, o6, "describe", 0, cy, "meta", 0, cI], 880002), e.i(880002);
    let cP = new Set(["type", "properties", "required", "additionalProperties"]),
        cN = ["oneOf", "anyOf"];

    function cO(e) {
        let t = e.additionalProperties;
        return void 0 === t || !1 === t || "object" != typeof t || null === t ? null : Object.keys(t).length ? t : null
    }

    function cj(e) {
        let t = [];
        for (let n of e) {
            if ("object" != typeof n || "object" !== n.type) return null;
            for (let e in n)
                if (!cP.has(e)) return null;
            t.push(n)
        }
        let n = {},
            r = new Set;
        for (let e of t) {
            var i, a, o, c;
            for (let r in e.properties) {
                if (Object.prototype.hasOwnProperty.call(n, r)) continue;
                let e = [];
                for (let n of t) {
                    let t = null != (o = null == (c = n.properties) ? void 0 : c[r]) ? o : cO(n);
                    null != t && (e.some(e => JSON.stringify(e) === JSON.stringify(t)) || e.push(t))
                }
                D(n, r, 1 === e.length ? e[0] : null != (a = cj(e)) ? a : {
                    allOf: e
                })
            }
            for (let t of null != (i = e.required) ? i : []) r.add(t)
        }
        let u = {
            type: "object",
            properties: n
        };
        if (r.size && (u.required = [...r]), t.every(e => !1 === e.additionalProperties)) u.additionalProperties = !1;
        else {
            let e = [];
            for (let n of t) {
                let t = cO(n);
                t && !e.some(e => JSON.stringify(e) === JSON.stringify(t)) && e.push(t)
            }
            1 === e.length ? u.additionalProperties = e[0] : e.length > 1 && (u.additionalProperties = {
                allOf: e
            })
        }
        return u
    }

    function cZ(e, t) {
        var n, r, i, a, o, c, u, l;
        let s = e.seen.get(t);
        if (!s) throw Error("Unprocessed schema. This is a bug in Zod.");
        let d = t => {
            var n, r, i;
            let a = e.seen.get(t);
            if (null === a.ref) return;
            let o = null != (n = a.def) ? n : a.schema,
                c = {
                    ...o
                },
                u = a.ref;
            if (a.ref = null, u) {
                d(u);
                let n = e.seen.get(u),
                    r = n.schema;
                if (r.$ref && ("draft-07" === e.target || "draft-04" === e.target || "openapi-3.0" === e.target) ? (o.allOf = null != (i = o.allOf) ? i : [], o.allOf.push(r)) : cx(o, r), cx(o, c), t._zod.parent === u)
                    for (let e in o) "$ref" !== e && "allOf" !== e && (e in c || delete o[e]);
                if (r.$ref && n.def)
                    for (let e in o) "$ref" !== e && "allOf" !== e && e in n.def && JSON.stringify(o[e]) === JSON.stringify(n.def[e]) && delete o[e]
            }
            let l = t._zod.parent;
            if (l && l !== u) {
                d(l);
                let t = e.seen.get(l);
                if ((null == t ? void 0 : t.schema.$ref) && (o.$ref = t.schema.$ref, t.def))
                    for (let e in o) "$ref" !== e && "allOf" !== e && e in t.def && JSON.stringify(o[e]) === JSON.stringify(t.def[e]) && delete o[e]
            }
            e.override({
                zodSchema: t,
                jsonSchema: o,
                path: null != (r = a.path) ? r : []
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
                }(null != (c = t[1].def) ? c : t[1].schema);
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
                    for (let e of null != (u = t.get(n)) ? u : []) ! function(e) {
                        let t = e.allOf;
                        if (!Array.isArray(t) || t.length < 2) return;
                        for (let t of cP)
                            if (t in e) return;
                        let n = t.filter(e => cN.some(t => Array.isArray(e[t]))),
                            r = null;
                        if (n.length) {
                            let e = n[0],
                                i = cN.find(t => Array.isArray(e[t]));
                            if (1 !== Object.keys(e).length) return;
                            let a = t.filter(t => t !== e),
                                o = e[i].map(e => cj([...a, e]));
                            if (o.some(e => !e)) return;
                            r = {
                                [i]: o
                            }
                        } else r = cj(t);
                        r && (delete e.allOf, cx(e, r))
                    }(e)
            }
        }
        let m = {};
        if ("draft-2020-12" === e.target ? m.$schema = "https://json-schema.org/draft/2020-12/schema" : "draft-07" === e.target ? m.$schema = "http://json-schema.org/draft-07/schema#" : "draft-04" === e.target ? m.$schema = "http://json-schema.org/draft-04/schema#" : e.target, null == (i = e.external) ? void 0 : i.uri) {
            let n = null == (l = e.external.registry.get(t)) ? void 0 : l.id;
            if (!n) throw Error("Schema is missing an `id` property");
            m.$id = e.external.uri(n)
        }
        cx(m, s.defId ? s.schema : null != (n = s.def) ? n : s.schema);
        let f = null == (a = e.metadataRegistry.get(t)) ? void 0 : a.id;
        void 0 !== f && m.id === f && delete m.id;
        let v = null != (r = null == (o = e.external) ? void 0 : o.defs) ? r : {};
        if (!e.external || e.sharedEmitDoneFor !== e.external)
            for (let t of e.seen.entries()) {
                let e = t[1];
                e.def && e.defId && (e.def.id === e.defId && delete e.def.id, D(v, e.defId, e.def))
            }
        e.external && (e.sharedEmitDoneFor = e.external), e.external || Object.keys(v).length > 0 && ("draft-2020-12" === e.target ? m.$defs = v : m.definitions = v);
        try {
            let n = JSON.parse(JSON.stringify(m));
            return Object.defineProperty(n, "~standard", {
                value: {
                    ...t["~standard"],
                    jsonSchema: {
                        input: cE(t, "input", e.processors),
                        output: cE(t, "output", e.processors)
                    }
                },
                enumerable: !1,
                writable: !1
            }), n
        } catch (e) {
            throw Error("Error converting schema to JSON.")
        }
    }
    let cT = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return n => {
                let r = cS({
                    ...n,
                    processors: t
                });
                return cU(e, r), cD(r, e), cZ(r, e)
            }
        },
        cE = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
            return r => {
                let {
                    libraryOptions: i,
                    target: a
                } = null != r ? r : {}, o = cS({
                    ...null != i ? i : {},
                    target: a,
                    io: t,
                    processors: n
                });
                return cU(e, o), cD(o, e), cZ(o, e)
            }
        };
    e.s(["createStandardJSONSchemaMethod", 0, cE, "createToJSONSchemaMethod", 0, cT, "extractDefs", 0, cD, "finalize", 0, cZ, "handleUnrepresentable", 0, cz, "initializeContext", 0, cS, "process", 0, cU, "processSchema", 0, cU], 806499), e.i(806499);
    let cC = (e, t, n) => {
            (void 0 === e[t] || n > e[t]) && (e[t] = n)
        },
        c$ = (e, t, n) => {
            (void 0 === e[t] || n < e[t]) && (e[t] = n)
        },
        cL = (e, t) => {
            cC(e, "minimum", t), c$(e, "maximum", t)
        },
        cR = (e, t) => {
            null != e.multipleOf || (e.multipleOf = []), e.multipleOf.includes(t) || e.multipleOf.push(t)
        },
        cG = (e, t) => {
            null != e.patterns || (e.patterns = new Set), e.patterns.add(t)
        },
        cJ = (e, t) => {
            e.mime = e.mime ? e.mime.filter(e => t.includes(e)) : [...t]
        },
        cB = (e, t) => {
            e.format = t, t.includes("int") && (e.isInt = !0)
        },
        cM = (e, t) => cC(e, "minimum", t.minimum),
        cF = (e, t) => c$(e, "maximum", t.maximum),
        cV = e => (t, n) => {
            cB(t, n.format);
            let [r, i] = e[n.format];
            cC(t, "minimum", r), c$(t, "maximum", i)
        },
        cq = {
            greater_than: (e, t) => cC(e, t.inclusive ? "minimum" : "exclusiveMinimum", t.value),
            less_than: (e, t) => c$(e, t.inclusive ? "maximum" : "exclusiveMaximum", t.value),
            multiple_of: (e, t) => cR(e, t.value),
            number_format: cV(er),
            bigint_format: cV(ei),
            min_length: cM,
            max_length: cF,
            length_equals: (e, t) => cL(e, t.length),
            min_size: cM,
            max_size: cF,
            size_equals: (e, t) => cL(e, t.size),
            string_format: (e, t) => {
                cB(e, t.format), t.pattern && cG(e, t.pattern), ("base64" === t.format || "base64url" === t.format) && (e.contentEncoding = t.format), (t.local || -1 === t.precision) && (e.laxFormat = !0)
            },
            mime_type: (e, t) => cJ(e, t.mime)
        };

    function cK(e) {
        var t, n, r, i;
        let a = {},
            o = e._zod.def;
        for (let r of e._zod.traits.has("$ZodCheck") ? [e, ...null != (t = o.checks) ? t : []] : null != (n = o.checks) ? n : []) null == (i = cq[r._zod.def.check]) || i.call(cq, a, r._zod.def);
        let c = e._zod.bag;
        for (let e of (void 0 !== c.minimum && cC(a, "minimum", c.minimum), void 0 !== c.exclusiveMinimum && cC(a, "exclusiveMinimum", c.exclusiveMinimum), void 0 !== c.maximum && c$(a, "maximum", c.maximum), void 0 !== c.exclusiveMaximum && c$(a, "exclusiveMaximum", c.exclusiveMaximum), void 0 !== c.multipleOf && cR(a, c.multipleOf), void 0 !== c.format && (null != a.format || (a.format = c.format), c.format.includes("int") && (a.isInt = !0)), c.mime && cJ(a, c.mime), null != (r = c.patterns) ? r : [])) cG(a, e);
        return a
    }
    let cW = {
            guid: "uuid",
            url: "uri",
            datetime: "date-time",
            json_string: "json-string",
            regex: ""
        },
        cX = new Map([
            [rA, ti],
            [rP, ta]
        ]),
        cH = e => {
            var t;
            return null != (t = cX.get(e)) ? t : e
        },
        cY = (e, t, n, r) => {
            n.type = "string";
            let {
                minimum: i,
                maximum: a,
                format: o,
                patterns: c,
                contentEncoding: u,
                laxFormat: l
            } = cK(e);
            if ("number" == typeof i && (n.minLength = i), "number" == typeof a && (n.maxLength = a), o) {
                var s;
                n.format = null != (s = cW[o]) ? s : o, "" === n.format && delete n.format, ("time" === o || l) && delete n.format
            }
            if (u && (n.contentEncoding = u), c && c.size > 0) {
                let e = [...c].map(cH);
                1 === e.length ? n.pattern = e[0].source : e.length > 1 && (n.allOf = [...e.map(e => ({
                    ..."draft-07" === t.target || "draft-04" === t.target || "openapi-3.0" === t.target ? {
                        type: "string"
                    } : {},
                    pattern: e.source
                }))])
            }
        },
        cQ = (e, t, n, r) => {
            let {
                minimum: i,
                maximum: a,
                multipleOf: o,
                exclusiveMaximum: c,
                exclusiveMinimum: u,
                isInt: l
            } = cK(e);
            n.type = l ? "integer" : "number";
            let s = "number" == typeof u && u >= (null != i ? i : -1 / 0),
                d = "number" == typeof c && c <= (null != a ? a : 1 / 0),
                m = "draft-04" === t.target || "openapi-3.0" === t.target;
            if (s ? m ? (n.minimum = u, n.exclusiveMinimum = !0) : n.exclusiveMinimum = u : "number" == typeof i && (n.minimum = i), d ? m ? (n.maximum = c, n.exclusiveMaximum = !0) : n.exclusiveMaximum = c : "number" == typeof a && (n.maximum = a), o) {
                var f;
                let i = new Set;
                for (let a of o) Number.isFinite(a) && 0 !== a ? i.add(Math.abs(a)) : cz(e, t, n, r, "A multipleOf divisor of ".concat(a, " cannot be represented in JSON Schema"));
                let [a, ...c] = i;
                void 0 !== a && (n.multipleOf = a), c.length && (n.allOf = [...null != (f = n.allOf) ? f : [], ...c.map(e => ({
                    multipleOf: e
                }))])
            }
        },
        c0 = (e, t, n, r) => {
            n.type = "boolean"
        },
        c4 = (e, t, n, r) => {
            cz(e, t, n, r, "BigInt cannot be represented in JSON Schema")
        },
        c1 = (e, t, n, r) => {
            cz(e, t, n, r, "Symbols cannot be represented in JSON Schema")
        },
        c6 = (e, t, n, r) => {
            "openapi-3.0" === t.target ? (n.type = "string", n.nullable = !0, n.enum = [null]) : n.type = "null"
        },
        c2 = (e, t, n, r) => {
            cz(e, t, n, r, "Undefined cannot be represented in JSON Schema")
        },
        c5 = (e, t, n, r) => {
            cz(e, t, n, r, "Void cannot be represented in JSON Schema")
        },
        c3 = (e, t, n, r) => {
            n.not = {}
        },
        c9 = (e, t, n, r) => {},
        c8 = (e, t, n, r) => {},
        c7 = (e, t, n, r) => {
            cz(e, t, n, r, "Date cannot be represented in JSON Schema")
        },
        ue = (e, t, n, r) => {
            let i = _(e._zod.def.entries);
            if (0 === i.length) {
                n.not = {};
                return
            }
            i.every(e => "number" == typeof e) && (n.type = "number"), i.every(e => "string" == typeof e) && (n.type = "string"), n.enum = i
        },
        ut = (e, t, n, r) => {
            let i = e._zod.def;
            if (0 === i.values.length) {
                n.not = {};
                return
            }
            let a = [];
            for (let o of i.values)
                if (void 0 === o) {
                    if (cz(e, t, n, r, "Literal `undefined` cannot be represented in JSON Schema")) return
                } else if ("bigint" == typeof o) {
                if (cz(e, t, n, r, "BigInt literals cannot be represented in JSON Schema")) return;
                a.push(Number(o))
            } else a.push(o);
            if (0 === a.length);
            else if (1 === a.length) {
                let e = a[0];
                n.type = null === e ? "null" : typeof e, "draft-04" === t.target || "openapi-3.0" === t.target ? n.enum = [e] : n.const = e
            } else a.every(e => "number" == typeof e) && (n.type = "number"), a.every(e => "string" == typeof e) && (n.type = "string"), a.every(e => "boolean" == typeof e) && (n.type = "boolean"), a.every(e => null === e) && (n.type = "null"), n.enum = a
        },
        un = (e, t, n, r) => {
            cz(e, t, n, r, "NaN cannot be represented in JSON Schema")
        },
        ur = (e, t, n, r) => {
            let i = e._zod.pattern;
            if (!i) throw Error("Pattern not found in template literal");
            n.type = "string", n.pattern = i.source
        },
        ui = (e, t, n, r) => {
            n.type = "string", n.format = "binary", n.contentEncoding = "binary";
            let {
                minimum: i,
                maximum: a,
                mime: o
            } = cK(e);
            void 0 !== i && (n.minLength = i), void 0 !== a && (n.maxLength = a), o && (0 === o.length ? n.not = {} : 1 === o.length ? n.contentMediaType = o[0] : n.anyOf = o.map(e => ({
                contentMediaType: e
            })))
        },
        ua = (e, t, n, r) => {
            n.type = "boolean"
        },
        uo = (e, t, n, r) => {
            cz(e, t, n, r, "Custom types cannot be represented in JSON Schema")
        },
        uc = (e, t, n, r) => {
            cz(e, t, n, r, "Function types cannot be represented in JSON Schema")
        },
        uu = (e, t, n, r) => {
            cz(e, t, n, r, "Transforms cannot be represented in JSON Schema")
        },
        ul = (e, t, n, r) => {
            cz(e, t, n, r, "Map cannot be represented in JSON Schema")
        },
        us = (e, t, n, r) => {
            cz(e, t, n, r, "Set cannot be represented in JSON Schema")
        },
        ud = (e, t, n, r) => {
            let i = e._zod.def,
                {
                    minimum: a,
                    maximum: o
                } = cK(e);
            "number" == typeof a && (n.minItems = a), "number" == typeof o && (n.maxItems = o), n.type = "array", n.items = cU(i.element, t, {
                ...r,
                path: [...r.path, "items"]
            })
        };

    function um(e) {
        let t = e._zod.def;
        return "pipe" === t.type && t.in._zod.traits.has("$ZodTransform") ? um(t.out) : "catch" === t.type ? um(t.innerType) : e._zod.optin
    }
    let uf = (e, t, n, r) => {
            var i;
            let a = e._zod.def,
                o = a.shape;
            if (Object.getOwnPropertySymbols(o).length && cz(e, t, n, r, "Symbol keys cannot be represented in JSON Schema")) return;
            for (let e in n.type = "object", n.properties = {}, o) D(n.properties, e, cU(o[e], t, {
                ...r,
                path: [...r.path, "properties", e]
            }));
            let c = [];
            for (let e of Object.keys(o)) {
                let n = a.shape[e];
                ("input" === t.io ? void 0 === um(n) : void 0 === n._zod.optout) && c.push(e)
            }
            c.length > 0 && (n.required = c), (null == (i = a.catchall) ? void 0 : i._zod.def.type) === "never" ? n.additionalProperties = !1 : a.catchall ? a.catchall && (n.additionalProperties = cU(a.catchall, t, {
                ...r,
                path: [...r.path, "additionalProperties"]
            })) : "output" === t.io && (n.additionalProperties = !1)
        },
        uv = (e, t, n, r) => {
            let i = e._zod.def,
                a = !1 === i.inclusive,
                o = i.options.map((e, n) => cU(e, t, {
                    ...r,
                    path: [...r.path, a ? "oneOf" : "anyOf", n]
                }));
            a ? n.oneOf = o : n.anyOf = o
        },
        up = (e, t, n, r) => {
            let i = e._zod.def,
                a = cU(i.left, t, {
                    ...r,
                    path: [...r.path, "allOf", 0]
                }),
                o = cU(i.right, t, {
                    ...r,
                    path: [...r.path, "allOf", 1]
                }),
                c = e => "allOf" in e && 1 === Object.keys(e).length,
                u = [...c(a) ? a.allOf : [a], ...c(o) ? o.allOf : [o]];
            n.allOf = u, t.intersections.push(u)
        },
        ug = (e, t, n, r) => {
            let i = e._zod.def;
            n.type = "array";
            let a = "draft-2020-12" === t.target ? "prefixItems" : "items",
                o = "draft-2020-12" === t.target || "openapi-3.0" === t.target ? "items" : "additionalItems",
                c = i.items.map((e, n) => cU(e, t, {
                    ...r,
                    path: [...r.path, a, n]
                })),
                u = i.rest ? cU(i.rest, t, {
                    ...r,
                    path: [...r.path, o, ..."openapi-3.0" === t.target ? [i.items.length] : []]
                }) : null,
                l = i.items.length;
            for (; l > 0;) {
                let e = i.items[l - 1];
                if (!("input" === t.io ? void 0 !== um(e) : "optional" === e._zod.optout)) break;
                l--
            }
            let s = i.items.length,
                d = !i.rest;
            "draft-2020-12" === t.target ? (n.prefixItems = c, d ? n.items = !1 : u && (n.items = u)) : "openapi-3.0" === t.target ? (n.items = {
                anyOf: c
            }, u && n.items.anyOf.push(u)) : (n.items = c, d ? n.additionalItems = !1 : u && (n.additionalItems = u)), l > 0 && (n.minItems = l), d && (n.maxItems = s);
            let {
                minimum: m,
                maximum: f
            } = cK(e);
            "number" == typeof m && (n.minItems = m), "number" == typeof f && (n.maxItems = f)
        },
        uh = new WeakMap,
        u_ = (e, t, n, r) => {
            let i = e._zod.def;
            n.type = "object";
            let a = i.keyType,
                o = cK(a).patterns;
            if ("loose" === i.mode && o && o.size > 0) {
                let e = cU(i.valueType, t, {
                    ...r,
                    path: [...r.path, "patternProperties", "*"]
                });
                for (let t of (n.patternProperties = {}, o)) D(n.patternProperties, cH(t).source, e)
            } else {
                if ("draft-07" === t.target || "draft-2020-12" === t.target) {
                    n.propertyNames = cU(i.keyType, t, {
                        ...r,
                        path: [...r.path, "propertyNames"]
                    });
                    let a = uh.get(t);
                    a || (a = [], uh.set(t, a), t.deferred.push(() => (function(e) {
                        var t, n, r;
                        let i = new Map;
                        for (let t of e.seen.values()) t.def && !i.has(t.schema) && i.set(t.schema, t);
                        let a = new Map;
                        for (let o of null != (t = uh.get(e)) ? t : []) {
                            let t = e.seen.get(o),
                                c = null == (r = null != (n = null == t ? void 0 : t.def) ? n : null == t ? void 0 : t.schema) ? void 0 : r.propertyNames;
                            if (!c || !0 === c || a.has(c)) continue;
                            let u = function e(t, n, r) {
                                var i, a;
                                if (n.$ref) {
                                    if (r.has(n)) return n;
                                    r.add(n);
                                    let i = null == (a = t.get(n)) ? void 0 : a.def;
                                    if (!i) return n;
                                    let o = e(t, i, r);
                                    return o === i ? n : o
                                }
                                for (let i of ["anyOf", "oneOf"]) {
                                    let a = n[i];
                                    if (!Array.isArray(a)) continue;
                                    let o = a.map(n => e(t, n, r));
                                    o.some((e, t) => e !== a[t]) && (n = {
                                        ...n,
                                        [i]: o
                                    })
                                }
                                let o = Array.isArray(n.type) ? n.type : [n.type],
                                    c = !o.includes("string") && o.some(e => "number" === e || "integer" === e),
                                    u = null != (i = n.enum) ? i : void 0 !== n.const ? [n.const] : void 0;
                                if (!c && !(null == u ? void 0 : u.some(e => "number" == typeof e))) return n;
                                let {
                                    minimum: l,
                                    maximum: s,
                                    exclusiveMinimum: d,
                                    exclusiveMaximum: m,
                                    multipleOf: f,
                                    format: v,
                                    id: p,
                                    ...g
                                } = n;
                                return g.enum ? g.enum = g.enum.map(e => "number" == typeof e ? String(e) : e) : "number" == typeof g.const && (g.const = String(g.const)), c && (g.type = "string", u || (g.pattern = (o.includes("number") ? tb : t_).source)), g
                            }(i, c, new Set);
                            u !== c && a.set(c, u)
                        }
                        if (a.size)
                            for (let t of e.seen.values())
                                for (let e of [t.schema, t.def]) {
                                    let t = e && a.get(e.propertyNames);
                                    t && (e.propertyNames = t)
                                }
                    })(t))), a.push(e)
                }
                n.additionalProperties = cU(i.valueType, t, {
                    ...r,
                    path: [...r.path, "additionalProperties"]
                })
            }
            let c = a._zod.values,
                u = "input" === t.io && void 0 !== um(i.valueType);
            if (c && !i.partial && !u) {
                let e = [...c].filter(e => "string" == typeof e || "number" == typeof e);
                e.length > 0 && (n.required = e.map(String))
            }
        },
        ub = (e, t, n, r) => {
            let i = e._zod.def,
                a = cU(i.innerType, t, r),
                o = t.seen.get(e);
            "openapi-3.0" === t.target ? (o.ref = i.innerType, n.nullable = !0) : n.anyOf = [a, {
                type: "null"
            }]
        },
        uy = (e, t, n, r) => {
            let i = e._zod.def;
            cU(i.innerType, t, r), t.seen.get(e).ref = i.innerType
        },
        uI = Symbol();

    function uw(e, t, n, r, i) {
        let a = !1,
            o = JSON.stringify(e, (e, t) => "bigint" != typeof t ? t : (a = !0, null));
        return a ? (cz(t, n, r, i, "BigInt defaults cannot be represented in JSON Schema"), uI) : JSON.parse(o)
    }
    let uk = (e, t, n, r) => {
            let i = e._zod.def;
            cU(i.innerType, t, r), t.seen.get(e).ref = i.innerType;
            let a = uw(i.defaultValue, e, t, n, r);
            a !== uI && (n.default = a)
        },
        ux = (e, t, n, r) => {
            let i = e._zod.def;
            if (cU(i.innerType, t, r), t.seen.get(e).ref = i.innerType, "input" !== t.io) return;
            let a = uw(i.defaultValue, e, t, n, r);
            a !== uI && (n._prefault = a)
        },
        uS = (e, t, n, r) => {
            let i, a = e._zod.def;
            cU(a.innerType, t, r), t.seen.get(e).ref = a.innerType;
            try {
                i = a.catchValue(void 0)
            } catch (i) {
                cz(e, t, n, r, "Dynamic catch values are not supported in JSON Schema");
                return
            }
            n.default = i
        },
        uz = (e, t, n, r) => {
            let i = e._zod.def,
                a = i.in._zod.traits.has("$ZodTransform"),
                o = "input" === t.io ? a ? i.out : i.in : i.out;
            cU(o, t, r), t.seen.get(e).ref = o
        },
        uU = (e, t, n, r) => {
            let i = e._zod.def;
            cU(i.innerType, t, r), t.seen.get(e).ref = i.innerType, n.readOnly = !0
        },
        uA = (e, t, n, r) => {
            let i = e._zod.def;
            cU(i.innerType, t, r), t.seen.get(e).ref = i.innerType
        },
        uD = (e, t, n, r) => {
            let i = e._zod.def;
            cU(i.innerType, t, r), t.seen.get(e).ref = i.innerType
        },
        uP = (e, t, n, r) => {
            let i = e._zod.innerType;
            cU(i, t, r), t.seen.get(e).ref = i
        },
        uN = {
            string: cY,
            number: cQ,
            boolean: c0,
            bigint: c4,
            symbol: c1,
            null: c6,
            undefined: c2,
            void: c5,
            never: c3,
            any: c9,
            unknown: c8,
            date: c7,
            enum: ue,
            literal: ut,
            nan: un,
            template_literal: ur,
            file: ui,
            success: ua,
            custom: uo,
            function: uc,
            transform: uu,
            map: ul,
            set: us,
            array: ud,
            object: uf,
            union: uv,
            intersection: up,
            tuple: ug,
            record: u_,
            nullable: ub,
            nonoptional: uy,
            default: uk,
            prefault: ux,
            catch: uS,
            pipe: uz,
            readonly: uU,
            promise: uA,
            optional: uD,
            lazy: uP
        };

    function uO(e, t) {
        if ("_idmap" in e) {
            let n = cS({
                    ...t,
                    processors: uN
                }),
                r = {};
            for (let t of e._idmap.entries()) {
                let [e, r] = t;
                cU(r, n)
            }
            let i = {};
            for (let a of (n.external = {
                    registry: e,
                    uri: null == t ? void 0 : t.uri,
                    defs: r
                }, e._idmap.entries())) {
                let [e, t] = a;
                cD(n, t), D(i, e, cZ(n, t))
            }
            return Object.keys(r).length > 0 && (i.__shared = {
                ["draft-2020-12" === n.target ? "$defs" : "definitions"]: r
            }), {
                schemas: i
            }
        }
        let n = cS({
            ...t,
            processors: uN
        });
        return cU(e, n), cD(n, e), cZ(n, e)
    }
    e.s(["E", 0, cK, "O", 0, uN, "k", 0, c9, "G", 0, ud, "b", 0, c4, "c", 0, c0, "x", 0, uS, "t", 0, uo, "n", 0, c7, "u", 0, uk, "R", 0, ue, "B", 0, ui, "$", 0, uc, "y", 0, up, "i", 0, uP, "j", 0, ut, "v", 0, ul, "C", 0, un, "o", 0, c3, "l", 0, uy, "m", 0, c6, "e", 0, ub, "Y", 0, cQ, "L", 0, uf, "P", 0, uD, "w", 0, uz, "r", 0, ux, "F", 0, uA, "Q", 0, uU, "d", 0, u_, "H", 0, us, "D", 0, cY, "p", 0, ua, "q", 0, c1, "J", 0, ur, "z", 0, uO, "_", 0, uu, "N", 0, ug, "g", 0, c2, "A", 0, uv, "s", 0, c8, "I", 0, c5], 879376), e.s(["$ZodAny", 0, rX, "$ZodArray", 0, r1, "$ZodAsyncError", 0, u, "$ZodBase64", 0, rD, "$ZodBase64URL", 0, rO, "$ZodBigInt", 0, rF, "$ZodBigIntFormat", 0, rV, "$ZodBoolean", 0, rM, "$ZodCIDRv4", 0, rx, "$ZodCIDRv6", 0, rz, "$ZodCUID", 0, rs, "$ZodCUID2", 0, rd, "$ZodCatch", 0, iT, "$ZodCheck", 0, nz, "$ZodCheckBigIntFormat", 0, nZ, "$ZodCheckEndsWith", 0, nq, "$ZodCheckGreaterThan", 0, nN, "$ZodCheckIncludes", 0, nF, "$ZodCheckLengthEquals", 0, nR, "$ZodCheckLessThan", 0, nP, "$ZodCheckLowerCase", 0, nB, "$ZodCheckMaxLength", 0, n$, "$ZodCheckMaxSize", 0, nT, "$ZodCheckMimeType", 0, nH, "$ZodCheckMinLength", 0, nL, "$ZodCheckMinSize", 0, nE, "$ZodCheckMultipleOf", 0, nO, "$ZodCheckNumberFormat", 0, nj, "$ZodCheckOverwrite", 0, nY, "$ZodCheckProperties", 0, nX, "$ZodCheckProperty", 0, nW, "$ZodCheckRegex", 0, nJ, "$ZodCheckSizeEquals", 0, nC, "$ZodCheckStartsWith", 0, nV, "$ZodCheckStringFormat", 0, nG, "$ZodCheckUpperCase", 0, nM, "$ZodCodec", 0, iL, "$ZodCreditCard", 0, rE, "$ZodCustom", 0, iW, "$ZodCustomStringFormat", 0, rG, "$ZodCyclicError", 0, iH, "$ZodDate", 0, r0, "$ZodDefault", 0, iA, "$ZodDiscriminatedUnion", 0, io, "$ZodE164", 0, rj, "$ZodEmail", 0, n7, "$ZodEmoji", 0, ru, "$ZodEncodeError", 0, l, "$ZodEnum", 0, iy, "$ZodError", 0, tQ, "$ZodExactOptional", 0, iz, "$ZodFile", 0, iw, "$ZodFunction", 0, iV, "$ZodGUID", 0, n9, "$ZodIBAN", 0, r$, "$ZodIPv4", 0, rb, "$ZodIPv6", 0, rw, "$ZodISODate", 0, rg, "$ZodISODateTime", 0, rp, "$ZodISODuration", 0, r_, "$ZodISOTime", 0, rh, "$ZodIntersection", 0, ic, "$ZodJWT", 0, rR, "$ZodKSUID", 0, rv, "$ZodLazy", 0, iK, "$ZodLiteral", 0, iI, "$ZodMAC", 0, rk, "$ZodMap", 0, ig, "$ZodNaN", 0, iE, "$ZodNanoID", 0, rl, "$ZodNever", 0, rY, "$ZodNonOptional", 0, iN, "$ZodNull", 0, rW, "$ZodNullable", 0, iU, "$ZodNumber", 0, rJ, "$ZodNumberFormat", 0, rB, "$ZodObject", 0, r9, "$ZodObjectJIT", 0, r8, "$ZodOptional", 0, iS, "$ZodPipe", 0, iC, "$ZodPrefault", 0, iP, "$ZodPreprocess", 0, iJ, "$ZodPromise", 0, iq, "$ZodReadonly", 0, iB, "$ZodRealError", 0, t0, "$ZodRecord", 0, ip, "$ZodRegistry", 0, at, "$ZodSet", 0, i_, "$ZodString", 0, n5, "$ZodStringFormat", 0, n3, "$ZodSuccess", 0, ij, "$ZodSymbol", 0, rq, "$ZodTemplateLiteral", 0, iF, "$ZodTransform", 0, ik, "$ZodTuple", 0, is, "$ZodType", 0, n4, "$ZodULID", 0, rm, "$ZodURL", 0, rc, "$ZodUUID", 0, n8, "$ZodUndefined", 0, rK, "$ZodUnion", 0, ie, "$ZodUnknown", 0, rH, "$ZodVoid", 0, rQ, "$ZodXID", 0, rf, "$ZodXor", 0, ir, "$brand", 0, c, "$constructor", 0, o, "$input", 0, ae, "$output", 0, i7, "Doc", 0, nQ, "INVALID", 0, ai, "JSONSchema", 0, tK, "JSONSchemaGenerator", 0, class {
        get metadataRegistry() {
            return this.ctx.metadataRegistry
        }
        get target() {
            return this.ctx.target
        }
        get unrepresentable() {
            return this.ctx.unrepresentable
        }
        get override() {
            return this.ctx.override
        }
        get io() {
            return this.ctx.io
        }
        get counter() {
            return this.ctx.counter
        }
        set counter(e) {
            this.ctx.counter = e
        }
        get seen() {
            return this.ctx.seen
        }
        process(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {
                path: [],
                schemaPath: []
            };
            return cU(e, this.ctx, t)
        }
        emit(e, t) {
            t && (t.cycles && (this.ctx.cycles = t.cycles), t.reused && (this.ctx.reused = t.reused), t.external && (this.ctx.external = t.external)), this.ctx.sharedDefsExtractedFor = void 0, this.ctx.sharedEmitDoneFor = void 0, cD(this.ctx, e);
            let {
                "~standard": n,
                ...r
            } = cZ(this.ctx, e);
            return r
        }
        constructor(e) {
            var t;
            let n = null != (t = null == e ? void 0 : e.target) ? t : "draft-2020-12";
            "draft-4" === n && (n = "draft-04"), "draft-7" === n && (n = "draft-07"), this.ctx = cS({
                processors: uN,
                target: n,
                ...(null == e ? void 0 : e.metadata) && {
                    metadata: e.metadata
                },
                ...(null == e ? void 0 : e.unrepresentable) && {
                    unrepresentable: e.unrepresentable
                },
                ...(null == e ? void 0 : e.override) && {
                    override: e.override
                },
                ...(null == e ? void 0 : e.io) && {
                    io: e.io
                }
            })
        }
    }, "NEVER", 0, r, "TimePrecision", 0, a9, "URL_BAD_FORMAT", 0, 1, "URL_UNPARSEABLE", 0, 2, "ZodCompileAsyncError", 0, ao, "ZodCompileUnsupportedError", 0, ac, "_any", 0, o_, "_array", 0, o4, "_base64", 0, a4, "_base64url", 0, a1, "_bigint", 0, od, "_boolean", 0, ol, "_catch", 0, cs, "_check", 0, cb, "_cidrv4", 0, aQ, "_cidrv6", 0, a0, "_coercedBigint", 0, om, "_coercedBoolean", 0, os, "_coercedDate", 0, ok, "_coercedNumber", 0, or, "_coercedString", 0, aT, "_creditCard", 0, a2, "_cuid", 0, aF, "_cuid2", 0, aV, "_custom", 0, cg, "_date", 0, ow, "_decode", 0, nm, "_decodeAsync", 0, ng, "_default", 0, cc, "_discriminatedUnion", 0, o2, "_e164", 0, a6, "_email", 0, aE, "_emoji", 0, aB, "_encode", 0, ns, "_encodeAsync", 0, nv, "_endsWith", 0, oF, "_enum", 0, ce, "_file", 0, cr, "_float32", 0, oa, "_float64", 0, oo, "_gt", 0, oU, "_gte", 0, oA, "_guid", 0, aC, "_iban", 0, a5, "_includes", 0, oB, "_int", 0, oi, "_int32", 0, oc, "_int64", 0, of, "_intersection", 0, o5, "_ipv4", 0, aX, "_ipv6", 0, aH, "_isoDate", 0, a7, "_isoDateTime", 0, a8, "_isoDuration", 0, ot, "_isoTime", 0, oe, "_jwt", 0, a3, "_ksuid", 0, aW, "_lazy", 0, cv, "_length", 0, oL, "_literal", 0, cn, "_lowercase", 0, oG, "_lt", 0, oS, "_lte", 0, oz, "_mac", 0, aY, "_map", 0, o8, "_max", 0, oz, "_maxLength", 0, oC, "_maxSize", 0, oZ, "_mime", 0, oK, "_min", 0, oA, "_minLength", 0, o$, "_minSize", 0, oT, "_multipleOf", 0, oj, "_nan", 0, ox, "_nanoid", 0, aM, "_nativeEnum", 0, ct, "_negative", 0, oP, "_never", 0, oy, "_nonnegative", 0, oO, "_nonoptional", 0, cu, "_nonpositive", 0, oN, "_normalize", 0, oX, "_null", 0, oh, "_nullable", 0, co, "_number", 0, on, "_optional", 0, ca, "_overwrite", 0, oW, "_parse", 0, t9, "_parseAsync", 0, t7, "_pipe", 0, cd, "_positive", 0, oD, "_promise", 0, cp, "_properties", 0, oq, "_property", 0, oV, "_readonly", 0, cm, "_record", 0, o9, "_refine", 0, ch, "_regex", 0, oR, "_safeDecode", 0, ny, "_safeDecodeAsync", 0, nx, "_safeEncode", 0, n_, "_safeEncodeAsync", 0, nw, "_safeParse", 0, nt, "_safeParseAsync", 0, ni, "_set", 0, o7, "_size", 0, oE, "_slugify", 0, o0, "_startsWith", 0, oM, "_string", 0, aZ, "_stringFormat", 0, ck, "_stringbool", 0, cw, "_success", 0, cl, "_superRefine", 0, c_, "_symbol", 0, op, "_templateLiteral", 0, cf, "_toLowerCase", 0, oY, "_toUpperCase", 0, oQ, "_transform", 0, ci, "_trim", 0, oH, "_tuple", 0, o3, "_uint32", 0, ou, "_uint64", 0, ov, "_ulid", 0, aq, "_undefined", 0, og, "_union", 0, o1, "_unknown", 0, ob, "_uppercase", 0, oJ, "_url", 0, aJ, "_uuid", 0, a$, "_uuidv4", 0, aL, "_uuidv6", 0, aR, "_uuidv7", 0, aG, "_void", 0, oI, "_xid", 0, aK, "_xor", 0, o6, "base64Charset", 0, rA, "base64urlCharset", 0, rP, "canParseURL", 0, re, "clone", 0, Y, "compile", 0, au, "compileFn", 0, as, "config", 0, d, "createStandardJSONSchemaMethod", 0, cE, "createToJSONSchemaMethod", 0, cT, "decode", 0, nf, "decodeAsync", 0, nh, "describe", 0, cy, "encode", 0, nd, "encodeAsync", 0, np, "extractDefs", 0, cD, "finalize", 0, cZ, "flattenError", 0, t4, "formatError", 0, t1, "getDiscriminatedOption", 0, ii, "globalConfig", 0, s, "globalRegistry", 0, ar, "handleUnrepresentable", 0, cz, "initializeContext", 0, cS, "isBackEdge", 0, i8, "isRecursiveSchema", 0, i2, "isValidBase64", 0, rU, "isValidBase64URL", 0, rN, "isValidCIDRv6", 0, rS, "isValidCreditCard", 0, rT, "isValidIBAN", 0, rC, "isValidIPv6", 0, rI, "isValidJWT", 0, rL, "locales", 0, tq, "memoizer", 0, i9, "mergeValues", 0, iu, "meta", 0, cI, "parse", 0, t8, "parseAsync", 0, ne, "parseURLObject", 0, rn, "prettifyError", 0, t5, "process", 0, cU, "processSchema", 0, cU, "regexes", 0, tC, "registry", 0, an, "safeDecode", 0, nI, "safeDecodeAsync", 0, nS, "safeEncode", 0, nb, "safeEncodeAsync", 0, nk, "safeParse", 0, nn, "safeParseAsync", 0, na, "standardProps", 0, n2, "stripTabAndNewline", 0, ri, "toDotPath", 0, t2, "toJSONSchema", 0, uO, "toZod", 0, v, "treeifyError", 0, t6, "urlHostnameOk", 0, ra, "urlProtocolOk", 0, ro, "util", 0, eV, "validate", 0, nu, "validateAsync", 0, nl, "validateURL", 0, rt, "version", 0, n0, "withParser", 0, al], 895517), e.i(895517);
    var uj = tC;
    e.s(["f", 0, uj], 223280);
    var uj = tC,
        uZ = eV;
    e.s(["f", 0, uZ], 575177);
    var uZ = eV;
    e.s(["f", 0, o$], 620331);
    let uT = new WeakSet([Object.prototype, Error.prototype]);

    function uE(e, t, n) {
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
    let uC = o("ZodError", (e, t) => {
        tQ.init(e, t), e.name = "ZodError";
        let n = Object.getPrototypeOf(e);
        uT.has(n) || (uT.add(n), uE(n, "format", e => t => t1(e, t)), uE(n, "flatten", e => t => t4(e, t)), uE(n, "addIssue", e => t => {
            e.issues.push(t), e.message = JSON.stringify(e.issues, y, 2)
        }), uE(n, "addIssues", e => t => {
            e.issues.push(...t), e.message = JSON.stringify(e.issues, y, 2)
        }), Object.defineProperty(n, "isEmpty", {
            configurable: !0,
            enumerable: !1,
            get() {
                return 0 === this.issues.length
            }
        }))
    }, void 0, {
        Parent: Error
    });
    e.s(["ZodRealError", 0, uC], 726411);
    let u$ = t9(uC),
        uL = t7(uC),
        uR = nt(uC),
        uG = ni(uC),
        uJ = ns(uC),
        uB = nm(uC),
        uM = nv(uC),
        uF = ng(uC),
        uV = n_(uC),
        uq = ny(uC),
        uK = nw(uC),
        uW = nx(uC);

    function uX() {
        s.memoizer || d({
            memoizer: i9()
        })
    }
    e.s(["G", 0, uB, "a", 0, uF, "q", 0, uJ, "W", 0, uM, "x", 0, u$, "s", 0, uL, "$", 0, uq, "X", 0, uW, "f", 0, uV, "j", 0, uK, "p", 0, uR, "l", 0, uG], 702800);
    let uH = o("ZodType", (e, t) => (s.localeError || d(tL()), n4.init(e, t), e.def = t, e.type = t.type, e), {
            check() {
                for (var e, t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                let i = this.def;
                return this.clone(eV.mergeDefs(i, {
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
                return Y(this, e, t)
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
                    return ch(sn, e, t)
                }(e, t))
            },
            superRefine(e, t) {
                return this.check(c_(e, t))
            },
            overwrite(e) {
                return this.check(oW(e))
            },
            optional() {
                return lY(this)
            },
            exactOptional() {
                var e;
                return e = this, new lQ({
                    type: "optional",
                    innerType: e
                })
            },
            nullable() {
                return l4(this)
            },
            nullish() {
                return lY(l4(this))
            },
            nonoptional(e) {
                var t, n;
                return t = this, n = e, new l2({
                    type: "nonoptional",
                    innerType: t,
                    ...eV.normalizeParams(n)
                })
            },
            array() {
                return lZ(this)
            },
            or(e) {
                return lL([this, e])
            },
            and(e) {
                var t;
                return t = this, new lJ({
                    type: "intersection",
                    left: t,
                    right: e
                })
            },
            transform(e) {
                return l9(this, lX(e))
            },
            default (e) {
                var t, n;
                return t = this, n = e, new l1({
                    type: "default",
                    innerType: t,
                    get defaultValue() {
                        return "function" == typeof n ? n() : eV.shallowClone(n)
                    }
                })
            },
            prefault(e) {
                var t, n;
                return t = this, n = e, new l6({
                    type: "prefault",
                    innerType: t,
                    get defaultValue() {
                        return "function" == typeof n ? n() : eV.shallowClone(n)
                    }
                })
            },
            catch (e) {
                var t, n;
                return t = this, new l5({
                    type: "catch",
                    innerType: t,
                    catchValue: "function" == typeof(n = e) ? n : uZ.constantCatch(n)
                })
            },
            pipe(e) {
                return l9(this, e)
            },
            readonly() {
                var e;
                return e = this, new l7({
                    type: "readonly",
                    innerType: e
                })
            },
            describe(e) {
                let t = this.clone();
                return ar.add(t, {
                    description: e
                }), t
            },
            meta() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                if (0 === t.length) return ar.get(this);
                let r = this.clone();
                return ar.add(r, t[0]), r
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
                return eV.hide(this, "~standard", {
                    ...n2(this),
                    jsonSchema: {
                        input: cE(this, "input"),
                        output: cE(this, "output")
                    }
                })
            },
            set "~standard"(e) {
                eV.own(this, "~standard", e)
            },
            parse: function e(t, n) {
                return u$(this, t, n, {
                    callee: e
                })
            },
            parseAsync: async function e(t, n) {
                return await uL(this, t, n, {
                    callee: e
                })
            },
            safeParse(e, t) {
                return uR(this, e, t)
            },
            async safeParseAsync(e, t) {
                return uG(this, e, t)
            },
            get spa() {
                return null === this || void 0 === this ? void 0 : this.safeParseAsync
            },
            set spa(e) {
                eV.own(this, "spa", e)
            },
            validate(e, t) {
                return nu(this, e, t)
            },
            validateAsync(e, t) {
                return nl(this, e, t)
            },
            encode: function e(t, n) {
                return uJ(this, t, n, {
                    callee: e
                })
            },
            decode: function e(t, n) {
                return uB(this, t, n, {
                    callee: e
                })
            },
            encodeAsync: async function e(t, n) {
                return await uM(this, t, n, {
                    callee: e
                })
            },
            decodeAsync: async function e(t, n) {
                return await uF(this, t, n, {
                    callee: e
                })
            },
            safeEncode(e, t) {
                return uV(this, e, t)
            },
            safeDecode(e, t) {
                return uq(this, e, t)
            },
            async safeEncodeAsync(e, t) {
                return uK(this, e, t)
            },
            async safeDecodeAsync(e, t) {
                return uW(this, e, t)
            },
            toJSONSchema(e) {
                return cT(this, {})(e)
            },
            get description() {
                var e;
                return null == (e = ar.get(this)) ? void 0 : e.description
            },
            get _def() {
                return this._zod.def
            }
        }),
        uY = o("_ZodString", (e, t) => {
            n5.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => cY(e, t, n, r)
        }, eV.derived({
            format: e => {
                var t;
                return null != (t = cK(e).format) ? t : null
            },
            minLength: e => {
                var t;
                return null != (t = cK(e).minimum) ? t : null
            },
            maxLength: e => {
                var t;
                return null != (t = cK(e).maximum) ? t : null
            }
        }, {
            regex() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return this.check(oR(...t))
            },
            includes() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return this.check(oB(...t))
            },
            startsWith() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return this.check(oM(...t))
            },
            endsWith() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return this.check(oF(...t))
            },
            min() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return this.check(o$(...t))
            },
            max() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return this.check(oC(...t))
            },
            length() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return this.check(oL(...t))
            },
            nonempty() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return this.check(o$(1, ...t))
            },
            lowercase(e) {
                return this.check(oG(e))
            },
            uppercase(e) {
                return this.check(oJ(e))
            },
            trim() {
                return this.check(oH())
            },
            normalize() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return this.check(oX(...t))
            },
            toLowerCase() {
                return this.check(oY())
            },
            toUpperCase() {
                return this.check(oQ())
            },
            slugify() {
                return this.check(o0())
            }
        })),
        uQ = o("ZodString", (e, t) => {
            n5.init(e, t), uY.init(e, t)
        }, {
            email(e) {
                return this.check(aE(u3, e))
            },
            url(e) {
                return this.check(aJ(le, e))
            },
            jwt(e) {
                return this.check(a3(lp, e))
            },
            emoji(e) {
                return this.check(aB(lt, e))
            },
            guid(e) {
                return this.check(aC(u9, e))
            },
            uuid(e) {
                return this.check(a$(u8, e))
            },
            uuidv4(e) {
                return this.check(aL(u8, e))
            },
            uuidv6(e) {
                return this.check(aR(u8, e))
            },
            uuidv7(e) {
                return this.check(aG(u8, e))
            },
            nanoid(e) {
                return this.check(aM(ln, e))
            },
            cuid(e) {
                return this.check(aF(lr, e))
            },
            cuid2(e) {
                return this.check(aV(li, e))
            },
            ulid(e) {
                return this.check(aq(la, e))
            },
            base64(e) {
                return this.check(a4(lm, e))
            },
            base64url(e) {
                return this.check(a1(lf, e))
            },
            xid(e) {
                return this.check(aK(lo, e))
            },
            ksuid(e) {
                return this.check(aW(lc, e))
            },
            ipv4(e) {
                return this.check(aX(lu, e))
            },
            ipv6(e) {
                return this.check(aH(ll, e))
            },
            cidrv4(e) {
                return this.check(aQ(ls, e))
            },
            cidrv6(e) {
                return this.check(a0(ld, e))
            },
            e164(e) {
                return this.check(a6(lv, e))
            },
            datetime(e) {
                return this.check(a8(u1, e))
            },
            date(e) {
                return this.check(a7(u6, e))
            },
            time(e) {
                return this.check(oe(u2, e))
            },
            duration(e) {
                return this.check(ot(u5, e))
            }
        });

    function u0(e) {
        return aZ(uQ, e)
    }
    let u4 = o("ZodStringFormat", (e, t) => {
            n3.init(e, t), uY.init(e, t)
        }),
        u1 = o("ZodISODateTime", (e, t) => {
            rp.init(e, t), u4.init(e, t)
        }),
        u6 = o("ZodISODate", (e, t) => {
            rg.init(e, t), u4.init(e, t)
        }),
        u2 = o("ZodISOTime", (e, t) => {
            rh.init(e, t), u4.init(e, t)
        }),
        u5 = o("ZodISODuration", (e, t) => {
            r_.init(e, t), u4.init(e, t)
        }),
        u3 = o("ZodEmail", (e, t) => {
            n7.init(e, t), u4.init(e, t)
        }),
        u9 = o("ZodGUID", (e, t) => {
            n9.init(e, t), u4.init(e, t)
        }),
        u8 = o("ZodUUID", (e, t) => {
            n8.init(e, t), u4.init(e, t)
        });

    function u7(e) {
        return a$(u8, e)
    }
    let le = o("ZodURL", (e, t) => {
            rc.init(e, t), u4.init(e, t)
        }),
        lt = o("ZodEmoji", (e, t) => {
            ru.init(e, t), u4.init(e, t)
        }),
        ln = o("ZodNanoID", (e, t) => {
            rl.init(e, t), u4.init(e, t)
        }),
        lr = o("ZodCUID", (e, t) => {
            rs.init(e, t), u4.init(e, t)
        }),
        li = o("ZodCUID2", (e, t) => {
            rd.init(e, t), u4.init(e, t)
        }),
        la = o("ZodULID", (e, t) => {
            rm.init(e, t), u4.init(e, t)
        }),
        lo = o("ZodXID", (e, t) => {
            rf.init(e, t), u4.init(e, t)
        }),
        lc = o("ZodKSUID", (e, t) => {
            rv.init(e, t), u4.init(e, t)
        }),
        lu = o("ZodIPv4", (e, t) => {
            rb.init(e, t), u4.init(e, t)
        }),
        ll = o("ZodIPv6", (e, t) => {
            rw.init(e, t), u4.init(e, t)
        }),
        ls = o("ZodCIDRv4", (e, t) => {
            rx.init(e, t), u4.init(e, t)
        }),
        ld = o("ZodCIDRv6", (e, t) => {
            rz.init(e, t), u4.init(e, t)
        }),
        lm = o("ZodBase64", (e, t) => {
            rD.init(e, t), u4.init(e, t)
        }),
        lf = o("ZodBase64URL", (e, t) => {
            rO.init(e, t), u4.init(e, t)
        }),
        lv = o("ZodE164", (e, t) => {
            rj.init(e, t), u4.init(e, t)
        }),
        lp = o("ZodJWT", (e, t) => {
            rR.init(e, t), u4.init(e, t)
        }),
        lg = o("ZodNumber", (e, t) => {
            rJ.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => cQ(e, t, n, r), e.isFinite = !0
        }, eV.derived({
            minValue: e => {
                let {
                    minimum: t,
                    exclusiveMinimum: n
                } = cK(e);
                return Math.max(null != t ? t : -1 / 0, null != n ? n : -1 / 0)
            },
            maxValue: e => {
                let {
                    maximum: t,
                    exclusiveMaximum: n
                } = cK(e);
                return Math.min(null != t ? t : 1 / 0, null != n ? n : 1 / 0)
            },
            isInt: e => {
                let {
                    isInt: t,
                    multipleOf: n
                } = cK(e);
                return !!t || !!(null == n ? void 0 : n.some(Number.isSafeInteger))
            },
            format: e => {
                var t;
                return null != (t = cK(e).format) ? t : null
            }
        }, {
            gt(e, t) {
                return this.check(oU(e, t))
            },
            gte(e, t) {
                return this.check(oA(e, t))
            },
            min(e, t) {
                return this.check(oA(e, t))
            },
            lt(e, t) {
                return this.check(oS(e, t))
            },
            lte(e, t) {
                return this.check(oz(e, t))
            },
            max(e, t) {
                return this.check(oz(e, t))
            },
            int(e) {
                return this.check(lb(e))
            },
            safe(e) {
                return this.check(lb(e))
            },
            positive(e) {
                return this.check(oU(0, e))
            },
            nonnegative(e) {
                return this.check(oA(0, e))
            },
            negative(e) {
                return this.check(oS(0, e))
            },
            nonpositive(e) {
                return this.check(oz(0, e))
            },
            multipleOf(e, t) {
                return this.check(oj(e, t))
            },
            step(e, t) {
                return this.check(oj(e, t))
            },
            finite() {
                return this
            }
        }));

    function lh(e) {
        return on(lg, e)
    }
    let l_ = o("ZodNumberFormat", (e, t) => {
        rB.init(e, t), lg.init(e, t)
    });

    function lb(e) {
        return oi(l_, e)
    }
    let ly = o("ZodBoolean", (e, t) => {
        rM.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => c0(e, t, n, r)
    });

    function lI(e) {
        return ol(ly, e)
    }
    let lw = o("ZodBigInt", (e, t) => {
            rF.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => c4(e, t, n, r)
        }, eV.derived({
            minValue: e => {
                var t;
                return null != (t = cK(e).minimum) ? t : null
            },
            maxValue: e => {
                var t;
                return null != (t = cK(e).maximum) ? t : null
            },
            format: e => {
                var t;
                return null != (t = cK(e).format) ? t : null
            }
        }, {
            gte(e, t) {
                return this.check(oA(e, t))
            },
            min(e, t) {
                return this.check(oA(e, t))
            },
            gt(e, t) {
                return this.check(oU(e, t))
            },
            lt(e, t) {
                return this.check(oS(e, t))
            },
            lte(e, t) {
                return this.check(oz(e, t))
            },
            max(e, t) {
                return this.check(oz(e, t))
            },
            positive(e) {
                return this.check(oU(BigInt(0), e))
            },
            negative(e) {
                return this.check(oS(BigInt(0), e))
            },
            nonpositive(e) {
                return this.check(oz(BigInt(0), e))
            },
            nonnegative(e) {
                return this.check(oA(BigInt(0), e))
            },
            multipleOf(e, t) {
                return this.check(oj(e, t))
            }
        })),
        lk = o("ZodNull", (e, t) => {
            rW.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => c6(e, t, n, r)
        });

    function lx(e) {
        return oh(lk, e)
    }
    let lS = o("ZodAny", (e, t) => {
        rX.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => c9(e, t, n, r)
    });

    function lz() {
        return o_(lS)
    }
    let lU = o("ZodUnknown", (e, t) => {
        rH.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => c8(e, t, n, r)
    });

    function lA() {
        return ob(lU)
    }
    let lD = o("ZodNever", (e, t) => {
        rY.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => c3(e, t, n, r)
    });

    function lP(e) {
        return oy(lD, e)
    }
    let lN = o("ZodDate", (e, t) => {
        r0.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => c7(e, t, n, r), e.min = (t, n) => e.check(oA(t, n)), e.max = (t, n) => e.check(oz(t, n))
    }, eV.derived({
        minDate: e => {
            let {
                minimum: t
            } = cK(e);
            return t ? new Date(t) : null
        },
        maxDate: e => {
            let {
                maximum: t
            } = cK(e);
            return t ? new Date(t) : null
        }
    }, {}));

    function lO(e) {
        return ow(lN, e)
    }
    let lj = o("ZodArray", (e, t) => {
        uX(), r1.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => ud(e, t, n, r), e.element = t.element
    }, {
        min(e, t) {
            return this.check(o$(e, t))
        },
        nonempty(e) {
            return this.check(o$(1, e))
        },
        max(e, t) {
            return this.check(oC(e, t))
        },
        length(e, t) {
            return this.check(oL(e, t))
        },
        unwrap() {
            return this.element
        }
    });

    function lZ(e, t) {
        return o4(lj, e, t)
    }
    let lT = o("ZodObject", (e, t) => {
        uX(), r8.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => uf(e, t, n, r), eV.installLazyProp(e, "shape", e => e._zod.def.shape, !1)
    }, {
        keyof() {
            return lV(Object.keys(this._zod.def.shape))
        },
        catchall(e) {
            return this.clone(eV.mergeDefs(this._zod.def, {
                catchall: e
            }))
        },
        passthrough() {
            return this.clone(eV.mergeDefs(this._zod.def, {
                catchall: lA()
            }))
        },
        loose() {
            return this.clone(eV.mergeDefs(this._zod.def, {
                catchall: lA()
            }))
        },
        strict() {
            return this.clone(eV.mergeDefs(this._zod.def, {
                catchall: lP()
            }))
        },
        strip() {
            return this.clone(eV.mergeDefs(this._zod.def, {
                catchall: void 0
            }))
        },
        extend(e) {
            return eV.extend(this, e)
        },
        safeExtend(e) {
            return eV.safeExtend(this, e)
        },
        merge(e) {
            return eV.merge(this, e)
        },
        pick(e) {
            return eV.pick(this, e)
        },
        omit(e) {
            return eV.omit(this, e)
        },
        partial() {
            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
            return eV.partial(lH, this, t[0])
        },
        exactPartial() {
            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
            return eV.partial(lQ, this, t[0], "exactPartial")
        },
        required() {
            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
            return eV.required(l2, this, t[0])
        }
    });

    function lE(e, t) {
        return new lT({
            type: "object",
            shape: null != e ? e : {},
            ...eV.normalizeParams(t)
        })
    }

    function lC(e, t) {
        return new lT({
            type: "object",
            shape: e,
            catchall: lP(),
            ...eV.normalizeParams(t)
        })
    }
    let l$ = o("ZodUnion", (e, t) => {
        ie.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => uv(e, t, n, r), e.options = t.options
    });

    function lL(e, t) {
        return new l$({
            type: "union",
            options: e,
            ...eV.normalizeParams(t)
        })
    }
    let lR = o("ZodDiscriminatedUnion", (e, t) => {
        l$.init(e, t), io.init(e, t)
    });

    function lG(e, t, n) {
        return new lR({
            type: "union",
            options: t,
            discriminator: e,
            ...eV.normalizeParams(n)
        })
    }
    let lJ = o("ZodIntersection", (e, t) => {
            ic.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => up(e, t, n, r)
        }),
        lB = o("ZodRecord", (e, t) => {
            uX(), ip.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => u_(e, t, n, r), e.keyType = t.keyType, e.valueType = t.valueType
        });

    function lM(e, t, n) {
        return new lB(t && t._zod ? {
            type: "record",
            keyType: e,
            valueType: t,
            ...eV.normalizeParams(n)
        } : {
            type: "record",
            keyType: u0(),
            valueType: e,
            ...eV.normalizeParams(t)
        })
    }
    let lF = o("ZodEnum", (e, t) => {
        iy.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => ue(e, t, n, r), e.enum = t.entries, e.options = [...e._zod.values];
        let n = new Set(Object.keys(t.entries));
        e.extract = (e, r) => {
            let i = {};
            for (let r of e)
                if (n.has(r)) i[r] = t.entries[r];
                else throw Error("Key ".concat(r, " not found in enum"));
            return new lF({
                ...t,
                checks: [],
                ...eV.normalizeParams(r),
                entries: i
            })
        }, e.exclude = (e, r) => {
            let i = {
                ...t.entries
            };
            for (let t of e)
                if (n.has(t)) delete i[t];
                else throw Error("Key ".concat(t, " not found in enum"));
            return new lF({
                ...t,
                checks: [],
                ...eV.normalizeParams(r),
                entries: i
            })
        }
    });

    function lV(e, t) {
        return new lF({
            type: "enum",
            entries: Array.isArray(e) ? Object.fromEntries(e.map(e => [e, e])) : e,
            ...eV.normalizeParams(t)
        })
    }
    let lq = o("ZodLiteral", (e, t) => {
        iI.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => ut(e, t, n, r), e.values = new Set(t.values), Object.defineProperty(e, "value", {
            get() {
                if (t.values.length > 1) throw Error("This schema contains multiple valid literal values. Use `.values` instead.");
                return t.values[0]
            }
        })
    });

    function lK(e, t) {
        return new lq({
            type: "literal",
            values: Array.isArray(e) ? e : [e],
            ...eV.normalizeParams(t)
        })
    }
    let lW = o("ZodTransform", (e, t) => {
        uX(), ik.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => uu(e, t, n, r), e._zod.parse = (n, r) => {
            if ("backward" === r.direction) throw new l(e.constructor.name);
            n.addIssue = r => {
                if ("string" == typeof r) n.issues.push(eV.issue(r, n.value, t));
                else r.fatal && (r.continue = !1), null != r.code || (r.code = "custom"), "input" in r || (r.input = n.value), null != r.inst || (r.inst = e), n.issues.push(eV.issue(r))
            };
            let i = t.transform(n.value, n);
            return i instanceof Promise ? i.then(e => (n.value = e, n)) : (n.value = i, n)
        }
    });

    function lX(e) {
        return new lW({
            type: "transform",
            transform: e
        })
    }
    let lH = o("ZodOptional", (e, t) => {
        iS.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => uD(e, t, n, r), e.unwrap = () => e._zod.def.innerType
    });

    function lY(e) {
        return new lH({
            type: "optional",
            innerType: e
        })
    }
    let lQ = o("ZodExactOptional", (e, t) => {
            iz.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => uD(e, t, n, r), e.unwrap = () => e._zod.def.innerType
        }),
        l0 = o("ZodNullable", (e, t) => {
            iU.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => ub(e, t, n, r), e.unwrap = () => e._zod.def.innerType
        });

    function l4(e) {
        return new l0({
            type: "nullable",
            innerType: e
        })
    }
    let l1 = o("ZodDefault", (e, t) => {
            iA.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => uk(e, t, n, r), e.unwrap = () => e._zod.def.innerType, e.removeDefault = e.unwrap
        }),
        l6 = o("ZodPrefault", (e, t) => {
            iP.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => ux(e, t, n, r), e.unwrap = () => e._zod.def.innerType
        }),
        l2 = o("ZodNonOptional", (e, t) => {
            iN.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => uy(e, t, n, r), e.unwrap = () => e._zod.def.innerType
        }),
        l5 = o("ZodCatch", (e, t) => {
            iT.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => uS(e, t, n, r), e.unwrap = () => e._zod.def.innerType, e.removeCatch = e.unwrap
        }),
        l3 = o("ZodPipe", (e, t) => {
            iC.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => uz(e, t, n, r), e.in = t.in, e.out = t.out
        });

    function l9(e, t) {
        return new l3({
            type: "pipe",
            in: e,
            out: t
        })
    }
    let l8 = o("ZodPreprocess", (e, t) => {
            l3.init(e, t), iJ.init(e, t)
        }),
        l7 = o("ZodReadonly", (e, t) => {
            iB.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => uU(e, t, n, r), e.unwrap = () => e._zod.def.innerType
        }),
        se = o("ZodLazy", (e, t) => {
            iK.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => uP(e, t, n, r), e.unwrap = () => e._zod.def.getter()
        });

    function st(e) {
        return new se({
            type: "lazy",
            getter: e
        })
    }
    let sn = o("ZodCustom", (e, t) => {
        iW.init(e, t), uH.init(e, t), e._zod.processJSONSchema = (t, n, r) => uo(e, t, n, r)
    });

    function sr(e, t) {
        return cg(sn, null != e ? e : () => !0, t)
    }
    let si = o("ZodInstanceOf", (e, t) => {
        sn.init(e, t)
    }, {
        properties(e, t) {
            return this.check(oq(e, t))
        }
    });

    function sa(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
            n = new si({
                type: "custom",
                check: "custom",
                fn: t => t instanceof e,
                abort: !0,
                ...eV.normalizeParams(t)
            });
        return n._zod.bag.Class = e, n._zod.check = t => {
            if (!(t.value instanceof e)) {
                var r;
                t.issues.push({
                    code: "invalid_type",
                    expected: e.name,
                    input: t.value,
                    inst: n,
                    path: [...null != (r = n._zod.def.path) ? r : []]
                })
            }
        }, n
    }

    function so(e, t) {
        return new l8({
            type: "pipe",
            in: lX(e),
            out: t
        })
    }
    e.s(["ZodBigInt", 0, lw, "ZodBoolean", 0, ly, "ZodDate", 0, lN, "ZodISODate", 0, u6, "ZodISODateTime", 0, u1, "ZodISODuration", 0, u5, "ZodISOTime", 0, u2, "ZodNumber", 0, lg, "ZodString", 0, uQ, "any", 0, lz, "array", 0, lZ, "boolean", 0, lI, "custom", 0, sr, "date", 0, lO, "discriminatedUnion", 0, lG, "enum", 0, lV, "instanceof", 0, sa, "int", 0, lb, "lazy", 0, st, "literal", 0, lK, "never", 0, lP, "null", 0, lx, "number", 0, lh, "object", 0, lE, "optional", 0, lY, "preprocess", 0, so, "record", 0, lM, "strictObject", 0, lC, "string", 0, u0, "union", 0, lL, "unknown", 0, lA, "uuid", 0, u7], 677844), e.s(["ZodISODate", 0, u6, "ZodISODateTime", 0, u1, "ZodISODuration", 0, u5, "ZodISOTime", 0, u2, "date", 0, function(e) {
        return a7(u6, e)
    }, "datetime", 0, function(e) {
        return a8(u1, e)
    }, "duration", 0, function(e) {
        return ot(u5, e)
    }, "time", 0, function(e) {
        return oe(u2, e)
    }], 349441), e.i(349441), e.s(["bigint", 0, function(e) {
        return om(lw, e)
    }, "boolean", 0, function(e) {
        return os(ly, e)
    }, "date", 0, function(e) {
        return ok(lN, e)
    }, "number", 0, function(e) {
        return or(lg, e)
    }, "string", 0, function(e) {
        return aT(uQ, e)
    }], 645452), e.i(645452), e.i(677844), e.s([], 221295), e.i(221295), e.i(726411), e.s([], 495622), e.i(495622), e.s([], 652431), e.i(652431), e.s(["any", 0, lz, "array", 0, lZ, "boolean", 0, lI, "custom", 0, sr, "date", 0, lO, "discriminatedUnion", 0, lG, "enum", 0, lV, "instanceof", 0, sa, "int", 0, lb, "lazy", 0, st, "literal", 0, lK, "never", 0, lP, "null", 0, lx, "number", 0, lh, "object", 0, lE, "optional", 0, lY, "preprocess", 0, so, "record", 0, lM, "strictObject", 0, lC, "string", 0, u0, "union", 0, lL, "unknown", 0, lA, "uuid", 0, u7], 913826)
}, 576205, e => {
    "use strict";
    var t = e.i(913826);
    e.s(["z", 0, t])
}, 623054, e => {
    "use strict";
    var t = e.i(913826);
    e.s(["z", 0, t])
}, 132437, e => {
    "use strict";
    var t = e.i(913826);
    e.s(["z", 0, t])
}, 293021, e => {
    "use strict";
    var t = e.i(415858),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function r(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function r() {
            this.constructor = e
        }
        n(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
    }

    function i(e, t, n, r) {
        return new(n || (n = Promise))(function(i, a) {
            function o(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    a(e)
                }
            }

            function c(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    a(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(o, c)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function a(e, t) {
        var n, r, i, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = c(0), o.throw = c(1), o.return = c(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function c(c) {
            return function(u) {
                var l = [c, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, l[0] && (a = 0)), a;) try {
                    if (n = 1, r && (i = 2 & l[0] ? r.return : l[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, l[1])).done) return i;
                    switch (r = 0, i && (l = [2 & l[0], i.value]), l[0]) {
                        case 0:
                        case 1:
                            i = l;
                            break;
                        case 4:
                            return a.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            a.label++, r = l[1], l = [0];
                            continue;
                        case 7:
                            l = a.ops.pop(), a.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                a = 0;
                                continue
                            }
                            if (3 === l[0] && (!i || l[1] > i[0] && l[1] < i[3])) {
                                a.label = l[1];
                                break
                            }
                            if (6 === l[0] && a.label < i[1]) {
                                a.label = i[1], i = l;
                                break
                            }
                            if (i && a.label < i[2]) {
                                a.label = i[2], a.ops.push(l);
                                break
                            }
                            i[2] && a.ops.pop(), a.trys.pop();
                            continue
                    }
                    l = t.call(e, a)
                } catch (e) {
                    l = [6, e], r = 0
                } finally {
                    n = i = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function o(e) {
        var n;
        return null == (n = e) ? n : {
            targetId: (0, t.u)(n, "targetId") ? n.targetId : void 0,
            state: (0, t.u)(n, "state") ? n.state : void 0,
            imageUrl: (0, t.u)(n, "imageUrl") ? n.imageUrl : void 0,
            version: (0, t.u)(n, "version") ? n.version : void 0
        }
    }

    function c(e) {
        var n, r;
        return null == (n = e) ? n : {
            universeId: (0, t.u)(n, "universeId") ? n.universeId : void 0,
            error: (0, t.u)(n, "error") ? null == (r = n.error) ? r : {
                code: (0, t.u)(r, "code") ? r.code : void 0,
                message: (0, t.u)(r, "message") ? r.message : void 0,
                userFacingMessage: (0, t.u)(r, "userFacingMessage") ? r.userFacingMessage : void 0,
                field: (0, t.u)(r, "field") ? r.field : void 0,
                fieldData: (0, t.u)(r, "fieldData") ? r.fieldData : void 0
            } : void 0,
            thumbnails: (0, t.u)(n, "thumbnails") ? n.thumbnails.map(o) : void 0
        }
    }

    function u(e) {
        if (void 0 !== e) return null === e ? null : {
            requestId: e.requestId,
            targetId: e.targetId,
            token: e.token,
            alias: e.alias,
            type: e.type,
            size: e.size,
            format: e.format,
            isCircular: e.isCircular,
            accessContext: e.accessContext,
            headShape: e.headShape
        }
    }

    function l(e) {
        var n;
        return null == (n = e) ? n : {
            requestId: (0, t.u)(n, "requestId") ? n.requestId : void 0,
            errorCode: (0, t.u)(n, "errorCode") ? n.errorCode : void 0,
            errorMessage: (0, t.u)(n, "errorMessage") ? n.errorMessage : void 0,
            targetId: (0, t.u)(n, "targetId") ? n.targetId : void 0,
            state: (0, t.u)(n, "state") ? n.state : void 0,
            imageUrl: (0, t.u)(n, "imageUrl") ? n.imageUrl : void 0,
            version: (0, t.u)(n, "version") ? n.version : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function s(e, n) {
        return null == e ? e : {
            data: (0, t.u)(e, "data") ? e.data.map(o) : void 0
        }
    }
    var d = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1AssetThumbnailAnimatedGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, c;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetThumbnailAnimatedGet.");
                                return r = {}, void 0 !== e.assetId && (r.assetId = e.assetId), i = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (i["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/asset-thumbnail-animated",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return c = a.sent(), [2, new t.H(c, function(e) {
                                    return o(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1AssetThumbnailAnimatedGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetThumbnailAnimatedGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1AssetsGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetIds || void 0 === e.assetIds) throw new t.w("assetIds", "Required parameter requestParameters.assetIds was null or undefined when calling v1AssetsGet.");
                                return r = {}, e.assetIds && (r.assetIds = e.assetIds.join(t.G.csv)), void 0 !== e.returnPolicy && (r.returnPolicy = e.returnPolicy), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (i["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/assets",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return o = a.sent(), [2, new t.H(o, function(e) {
                                    return s(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1AssetsGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1AssetsThumbnail3dGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, c;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsThumbnail3dGet.");
                                return r = {}, void 0 !== e.assetId && (r.assetId = e.assetId), void 0 !== e.useGltf && (r.useGltf = e.useGltf), i = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (i["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/assets-thumbnail-3d",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return c = a.sent(), [2, new t.H(c, function(e) {
                                    return o(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1AssetsThumbnail3dGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsThumbnail3dGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._),
        m = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1UsersAvatar3dGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, c;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersAvatar3dGet.");
                                return r = {}, void 0 !== e.userId && (r.userId = e.userId), i = {}, [4, this.request({
                                    path: "/v1/users/avatar-3d",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return c = a.sent(), [2, new t.H(c, function(e) {
                                    return o(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1UsersAvatar3dGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UsersAvatar3dGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1UsersAvatarBustGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.userIds || void 0 === e.userIds) throw new t.w("userIds", "Required parameter requestParameters.userIds was null or undefined when calling v1UsersAvatarBustGet.");
                                return r = {}, e.userIds && (r.userIds = e.userIds.join(t.G.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/users/avatar-bust",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return o = a.sent(), [2, new t.H(o, function(e) {
                                    return s(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1UsersAvatarBustGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UsersAvatarBustGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1UsersAvatarGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.userIds || void 0 === e.userIds) throw new t.w("userIds", "Required parameter requestParameters.userIds was null or undefined when calling v1UsersAvatarGet.");
                                return r = {}, e.userIds && (r.userIds = e.userIds.join(t.G.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/users/avatar",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return o = a.sent(), [2, new t.H(o, function(e) {
                                    return s(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1UsersAvatarGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UsersAvatarGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1UsersAvatarHeadshotGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.userIds || void 0 === e.userIds) throw new t.w("userIds", "Required parameter requestParameters.userIds was null or undefined when calling v1UsersAvatarHeadshotGet.");
                                return r = {}, e.userIds && (r.userIds = e.userIds.join(t.G.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/users/avatar-headshot",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return o = a.sent(), [2, new t.H(o, function(e) {
                                    return s(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1UsersAvatarHeadshotGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UsersAvatarHeadshotGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._),
        f = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1BadgesIconsGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.badgeIds || void 0 === e.badgeIds) throw new t.w("badgeIds", "Required parameter requestParameters.badgeIds was null or undefined when calling v1BadgesIconsGet.");
                                return r = {}, e.badgeIds && (r.badgeIds = e.badgeIds.join(t.G.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/badges/icons",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return o = a.sent(), [2, new t.H(o, function(e) {
                                    return s(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1BadgesIconsGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1BadgesIconsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._),
        v = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1BatchPostRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.requests || void 0 === e.requests) throw new t.w("requests", "Required parameter requestParameters.requests was null or undefined when calling v1BatchPost.");
                                return r = {}, (i = {})["Content-Type"] = "application/json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (i["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/batch",
                                    method: "POST",
                                    headers: i,
                                    query: r,
                                    body: e.requests.map(u)
                                }, n)];
                            case 1:
                                return o = a.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.u)(e, "data") ? e.data.map(l) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.v1BatchPost = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1BatchPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._),
        p = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1BundlesThumbnailsGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.bundleIds || void 0 === e.bundleIds) throw new t.w("bundleIds", "Required parameter requestParameters.bundleIds was null or undefined when calling v1BundlesThumbnailsGet.");
                                return r = {}, e.bundleIds && (r.bundleIds = e.bundleIds.join(t.G.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/bundles/thumbnails",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return o = a.sent(), [2, new t.H(o, function(e) {
                                    return s(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1BundlesThumbnailsGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1BundlesThumbnailsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._),
        g = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1DeveloperProductsIconsGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.developerProductIds || void 0 === e.developerProductIds) throw new t.w("developerProductIds", "Required parameter requestParameters.developerProductIds was null or undefined when calling v1DeveloperProductsIconsGet.");
                                return r = {}, e.developerProductIds && (r.developerProductIds = e.developerProductIds.join(t.G.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/developer-products/icons",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return o = a.sent(), [2, new t.H(o, function(e) {
                                    return s(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1DeveloperProductsIconsGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1DeveloperProductsIconsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._),
        h = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1GamePassesGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.gamePassIds || void 0 === e.gamePassIds) throw new t.w("gamePassIds", "Required parameter requestParameters.gamePassIds was null or undefined when calling v1GamePassesGet.");
                                return r = {}, e.gamePassIds && (r.gamePassIds = e.gamePassIds.join(t.G.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/game-passes",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return o = a.sent(), [2, new t.H(o, function(e) {
                                    return s(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1GamePassesGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1GamePassesGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._),
        _ = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1GamesIconsGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeIds || void 0 === e.universeIds) throw new t.w("universeIds", "Required parameter requestParameters.universeIds was null or undefined when calling v1GamesIconsGet.");
                                return r = {}, e.universeIds && (r.universeIds = e.universeIds.join(t.G.csv)), void 0 !== e.returnPolicy && (r.returnPolicy = e.returnPolicy), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/games/icons",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return o = a.sent(), [2, new t.H(o, function(e) {
                                    return s(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1GamesIconsGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1GamesIconsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1GamesMultigetThumbnailsGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeIds || void 0 === e.universeIds) throw new t.w("universeIds", "Required parameter requestParameters.universeIds was null or undefined when calling v1GamesMultigetThumbnailsGet.");
                                return r = {}, e.universeIds && (r.universeIds = e.universeIds.join(t.G.csv)), void 0 !== e.countPerUniverse && (r.countPerUniverse = e.countPerUniverse), void 0 !== e.defaults && (r.defaults = e.defaults), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/games/multiget/thumbnails",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return o = a.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.u)(e, "data") ? e.data.map(c) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.v1GamesMultigetThumbnailsGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1GamesMultigetThumbnailsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1GamesUniverseIdThumbnailsGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdThumbnailsGet.");
                                if (null === e.thumbnailIds || void 0 === e.thumbnailIds) throw new t.w("thumbnailIds", "Required parameter requestParameters.thumbnailIds was null or undefined when calling v1GamesUniverseIdThumbnailsGet.");
                                return r = {}, e.thumbnailIds && (r.thumbnailIds = e.thumbnailIds.join(t.G.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/games/{universeId}/thumbnails".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return o = a.sent(), [2, new t.H(o, function(e) {
                                    return s(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1GamesUniverseIdThumbnailsGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1GamesUniverseIdThumbnailsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._),
        b = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1GroupsIconsGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.groupIds || void 0 === e.groupIds) throw new t.w("groupIds", "Required parameter requestParameters.groupIds was null or undefined when calling v1GroupsIconsGet.");
                                return r = {}, e.groupIds && (r.groupIds = e.groupIds.join(t.G.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/groups/icons",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return o = a.sent(), [2, new t.H(o, function(e) {
                                    return s(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1GroupsIconsGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1GroupsIconsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._),
        y = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1UsersOutfit3dGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, c;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.outfitId || void 0 === e.outfitId) throw new t.w("outfitId", "Required parameter requestParameters.outfitId was null or undefined when calling v1UsersOutfit3dGet.");
                                return r = {}, void 0 !== e.outfitId && (r.outfitId = e.outfitId), i = {}, [4, this.request({
                                    path: "/v1/users/outfit-3d",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return c = a.sent(), [2, new t.H(c, function(e) {
                                    return o(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1UsersOutfit3dGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UsersOutfit3dGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1UsersOutfitsGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.userOutfitIds || void 0 === e.userOutfitIds) throw new t.w("userOutfitIds", "Required parameter requestParameters.userOutfitIds was null or undefined when calling v1UsersOutfitsGet.");
                                return r = {}, e.userOutfitIds && (r.userOutfitIds = e.userOutfitIds.join(t.G.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/users/outfits",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return o = a.sent(), [2, new t.H(o, function(e) {
                                    return s(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1UsersOutfitsGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UsersOutfitsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._),
        I = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1PlacesGameiconsGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.placeIds || void 0 === e.placeIds) throw new t.w("placeIds", "Required parameter requestParameters.placeIds was null or undefined when calling v1PlacesGameiconsGet.");
                                return r = {}, e.placeIds && (r.placeIds = e.placeIds.join(t.G.csv)), void 0 !== e.returnPolicy && (r.returnPolicy = e.returnPolicy), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/places/gameicons",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return o = a.sent(), [2, new t.H(o, function(e) {
                                    return s(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1PlacesGameiconsGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PlacesGameiconsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._);
    e.s(["w", 0, d, "M", 0, m, "l", 0, f, "x", 0, v, "a", 0, p, "P", 0, g, "v", 0, h, "o", 0, _, "Y", 0, b, "X", 0, y, "y", 0, I, "z", 0, {
        Avatar: "Avatar",
        AvatarHeadShot: "AvatarHeadShot",
        GameIcon: "GameIcon",
        BadgeIcon: "BadgeIcon",
        GameThumbnail: "GameThumbnail",
        GamePass: "GamePass",
        Asset: "Asset",
        BundleThumbnail: "BundleThumbnail",
        Outfit: "Outfit",
        GroupIcon: "GroupIcon",
        DeveloperProduct: "DeveloperProduct",
        AvatarBust: "AvatarBust",
        AutoGeneratedAsset: "AutoGeneratedAsset",
        PlaceIcon: "PlaceIcon",
        AutoGeneratedGameIcon: "AutoGeneratedGameIcon",
        ForceAutoGeneratedGameIcon: "ForceAutoGeneratedGameIcon",
        Look: "Look",
        CreatorContextAsset: "CreatorContextAsset",
        Screenshot: "Screenshot"
    }, "G", 0, {
        Error: "Error",
        Completed: "Completed",
        InReview: "InReview",
        Pending: "Pending",
        Blocked: "Blocked",
        TemporarilyUnavailable: "TemporarilyUnavailable"
    }, "i", 0, {
        Error: "Error",
        Completed: "Completed",
        InReview: "InReview",
        Pending: "Pending",
        Blocked: "Blocked",
        TemporarilyUnavailable: "TemporarilyUnavailable"
    }, "J", 0, {
        Png: "Png",
        Jpeg: "Jpeg",
        Webp: "Webp"
    }, "E", 0, {
        True: !0,
        False: !1
    }, "R", 0, {
        PlaceHolder: "PlaceHolder",
        ForcePlaceHolder: "ForcePlaceHolder",
        AutoGenerated: "AutoGenerated",
        ForceAutoGenerated: "ForceAutoGenerated"
    }, "Z", 0, {
        _30x30: "30x30",
        _42x42: "42x42",
        _50x50: "50x50",
        _60x62: "60x62",
        _75x75: "75x75",
        _110x110: "110x110",
        _140x140: "140x140",
        _150x150: "150x150",
        _160x100: "160x100",
        _160x600: "160x600",
        _250x250: "250x250",
        _256x144: "256x144",
        _300x250: "300x250",
        _304x166: "304x166",
        _384x216: "384x216",
        _396x216: "396x216",
        _420x420: "420x420",
        _480x270: "480x270",
        _512x512: "512x512",
        _576x324: "576x324",
        _700x700: "700x700",
        _728x90: "728x90",
        _768x432: "768x432",
        _1200x80: "1200x80",
        _330x110: "330x110",
        _660x220: "660x220",
        _1320x440: "1320x440",
        _720x228: "720x228",
        _1440x456: "1440x456",
        _930x480: "930x480"
    }, "_", 0, {
        _150x150: "150x150"
    }, "m", 0, {
        _150x150: "150x150",
        _420x420: "420x420"
    }, "$", 0, {
        _150x150: "150x150",
        _420x420: "420x420"
    }, "N", 0, {
        _150x150: "150x150"
    }, "A", 0, {
        _50x50: "50x50",
        _128x128: "128x128",
        _150x150: "150x150",
        _256x256: "256x256",
        _420x420: "420x420",
        _512x512: "512x512"
    }, "B", 0, {
        _768x432: "768x432",
        _576x324: "576x324",
        _480x270: "480x270",
        _384x216: "384x216",
        _256x144: "256x144"
    }, "S", 0, {
        _768x432: "768x432",
        _576x324: "576x324",
        _480x270: "480x270",
        _384x216: "384x216",
        _256x144: "256x144"
    }, "c", 0, {
        _150x150: "150x150",
        _420x420: "420x420"
    }, "K", 0, {
        Png: "Png",
        Jpeg: "Jpeg",
        Webp: "Webp"
    }, "D", 0, {
        True: !0,
        False: !1
    }, "C", 0, {
        PlaceHolder: "PlaceHolder",
        ForcePlaceHolder: "ForcePlaceHolder",
        AutoGenerated: "AutoGenerated",
        ForceAutoGenerated: "ForceAutoGenerated"
    }, "n", 0, {
        _50x50: "50x50",
        _128x128: "128x128",
        _150x150: "150x150",
        _256x256: "256x256",
        _420x420: "420x420",
        _512x512: "512x512"
    }, "F", 0, {
        _30x30: "30x30",
        _48x48: "48x48",
        _60x60: "60x60",
        _75x75: "75x75",
        _100x100: "100x100",
        _110x110: "110x110",
        _140x140: "140x140",
        _150x150: "150x150",
        _150x200: "150x200",
        _180x180: "180x180",
        _250x250: "250x250",
        _352x352: "352x352",
        _420x420: "420x420",
        _720x720: "720x720"
    }, "H", 0, {
        _48x48: "48x48",
        _50x50: "50x50",
        _60x60: "60x60",
        _75x75: "75x75",
        _100x100: "100x100",
        _110x110: "110x110",
        _150x150: "150x150",
        _180x180: "180x180",
        _352x352: "352x352",
        _420x420: "420x420",
        _720x720: "720x720"
    }, "I", 0, {
        _150x150: "150x150",
        _420x420: "420x420"
    }])
}, 218701, e => {
    "use strict";
    var t = e.i(415858),
        n = e.i(293021),
        r = e.i(643766),
        i = e.i(67243),
        a = e.i(646555),
        o = e.i(95656),
        c = e.i(252842);

    function u() {
        if (void 0 === s) throw Error("Most call thumbnailsClient before using getThumbnailsClient");
        return s
    }(l = m || (m = {})).assetThumbnail = "assetThumbnail", l.avatarHeadshot = "avatarHeadshot", l.avatar = "avatar", l.bundleThumbnail = "bundleThumbnail", l.gameIcon = "gameIcon", l.groupIcon = "groupIcon", l.badgeIcon = "badgeIcon", l.gamePassIcon = "gamePassIcon", l.developerProductIcon = "developerProductIcon", l.userOutfit = "userOutfit", l.gameThumbnail = "gameThumbnail", l.universeThumbnail = "universeThumbnail", l.placeIcon = "placeIcon", l.autoGeneratedPlaceThumbnail = "autoGeneratedPlaceThumbnail", l.autoGeneratedPlaceIcon = "autoGeneratedPlaceIcon";
    var l, s, d, m, f, v, p, g = ((d = {})[m.assetThumbnail] = n.Z._150x150, d[m.avatarHeadshot] = n.H._150x150, d[m.avatar] = n.F._150x150, d[m.bundleThumbnail] = n.m._150x150, d[m.gameIcon] = n.A._150x150, d[m.groupIcon] = n.c._150x150, d[m.badgeIcon] = n._._150x150, d[m.gamePassIcon] = n.N._150x150, d[m.developerProductIcon] = n.$._150x150, d[m.userOutfit] = n.I._150x150, d[m.gameThumbnail] = n.S._576x324, d[m.universeThumbnail] = n.B._576x324, d[m.placeIcon] = n.n._150x150, d[m.autoGeneratedPlaceThumbnail] = n.S._768x432, d[m.autoGeneratedPlaceIcon] = n.A._512x512, d);

    function h(e, t, n, r) {
        return new(n || (n = Promise))(function(i, a) {
            function o(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    a(e)
                }
            }

            function c(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    a(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(o, c)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function _(e, t) {
        var n, r, i, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = c(0), o.throw = c(1), o.return = c(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function c(c) {
            return function(u) {
                var l = [c, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, l[0] && (a = 0)), a;) try {
                    if (n = 1, r && (i = 2 & l[0] ? r.return : l[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, l[1])).done) return i;
                    switch (r = 0, i && (l = [2 & l[0], i.value]), l[0]) {
                        case 0:
                        case 1:
                            i = l;
                            break;
                        case 4:
                            return a.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            a.label++, r = l[1], l = [0];
                            continue;
                        case 7:
                            l = a.ops.pop(), a.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                a = 0;
                                continue
                            }
                            if (3 === l[0] && (!i || l[1] > i[0] && l[1] < i[3])) {
                                a.label = l[1];
                                break
                            }
                            if (6 === l[0] && a.label < i[1]) {
                                a.label = i[1], i = l;
                                break
                            }
                            if (i && a.label < i[2]) {
                                a.label = i[2], a.ops.push(l);
                                break
                            }
                            i[2] && a.ops.pop(), a.trys.pop();
                            continue
                    }
                    l = t.call(e, a)
                } catch (e) {
                    l = [6, e], r = 0
                } finally {
                    n = i = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }(b = f || (f = {}))[b.maxRetryAttempts = 10] = "maxRetryAttempts", b[b.minCooldown = 1e3] = "minCooldown", b[b.maxCooldown = 3e4] = "maxCooldown", (y = v || (v = {})).png = "png", y.jpg = "jpg", y.jpeg = "jpeg", y.webp = "webp", (I = p || (p = {})).PlaceHolder = "PlaceHolder", I.AutoGenerated = "AutoGenerated", I.ForceAutoGenerated = "ForceAutoGenerated", I.ForcePlaceHolder = "ForcePlaceHolder", "function" == typeof SuppressedError && SuppressedError;
    var b, y, I, w, k, x = (0, i.f)()(function(e, t) {
            return {
                container: {
                    paddingTop: "".concat(100 * t.sizeRatio, "%"),
                    position: "relative",
                    height: "auto",
                    width: "100%",
                    overflow: "hidden"
                },
                background: {
                    backgroundColor: e.palette.action.focus
                },
                img: {
                    position: "absolute",
                    top: 0,
                    left: 0,
                    width: "100%",
                    height: "100%"
                },
                completed: {
                    transition: "opacity .5s ease",
                    opacity: 1
                },
                loading: {
                    opacity: 0
                }
            }
        }),
        S = "".concat("https://assets.create.roblox.com/a9649016bf1216e360c764a9aa40ecdf068cbc5a/assets", "/thumbnails"),
        z = "".concat(S, "/broken.svg"),
        U = "".concat(S, "/not_approved.svg"),
        A = "".concat(S, "/review_pending.svg"),
        D = "".concat(S, "/unavailable.svg");
    (w || (w = {})).Time = "time", (k || (k = {})).LoadThumbnail = "loadThumbnail";
    var P = function(e, t) {
            var n = t || "Grasshopper",
                r = new o.x({
                    baseUrl: "".concat(e, "/").concat(n)
                }),
                i = new o.P(r);
            return {
                sendEvent: function(e) {
                    var t = {
                        target: n,
                        eventType: e.eventType,
                        context: e.context,
                        localTime: new Date,
                        additionalProperties: e.additionalProperties
                    };
                    return i.sendEventViaImg(t)
                }
            }
        },
        N = (0, r.createContext)({});
    N.displayName = "ThumbnailsContext";
    var O, j = function(e) {
            var t = e.thumbnailUrl,
                i = e.thumbnailStatus,
                o = e.imgClassName,
                c = e.isPendingResponse,
                u = e.isPendingNewTarget,
                l = e.containerClass,
                s = e.alt,
                d = e.includeBackground,
                m = e.sizeRatio,
                f = e.startTime,
                v = e.skeletonVariant,
                p = e.onLoadThumbnailStatus,
                g = void 0 === p ? void 0 : p,
                h = x({
                    sizeRatio: m
                }),
                _ = h.classes,
                b = _.container,
                y = _.background,
                I = _.img,
                S = _.completed,
                P = _.loading,
                O = h.cx,
                j = O(b, l),
                Z = (0, r.useState)(!1),
                T = Z[0],
                E = Z[1],
                C = (0, r.useState)(!1),
                $ = C[0],
                L = C[1],
                R = (0, r.useContext)(N).eventTracker,
                G = (0, r.useMemo)(function() {
                    switch (i) {
                        case n.i.Error:
                            return z;
                        case n.i.Blocked:
                            return U;
                        case n.i.InReview:
                            return A;
                        case n.i.Pending:
                            return c ? "" : D;
                        case n.i.Completed:
                        default:
                            return ""
                    }
                }, [c, i]);
            return r.default.createElement("span", {
                className: O(j, u || c || !d ? "" : y)
            }, u || c ? r.default.createElement(a.f, {
                className: I,
                variant: void 0 === v ? "rectangular" : v,
                animate: !u
            }) : r.default.createElement("img", {
                className: O(I, o, T ? S : P),
                src: null != t ? t : G,
                alt: s,
                onLoad: function() {
                    var e;
                    if (E(!0), R && !$) {
                        var n = performance.now() - f;
                        R.sendEvent({
                            eventType: k.LoadThumbnail,
                            context: w.Time,
                            currentUrl: null == (e = null == window ? void 0 : window.location) ? void 0 : e.href,
                            additionalProperties: {
                                elapsedTime: n,
                                thumbnailStatus: i,
                                thumbnailUrl: null != t ? t : G,
                                sizeRatio: m
                            }
                        }), L(!0)
                    }
                    void 0 !== g && g(i)
                }
            }))
        },
        Z = function(e) {
            var t;
            return null != (t = null == e ? void 0 : e.toString()) ? t : ""
        },
        T = new c.Q,
        E = {
            getFailureCooldown: T.createExponentialBackoffCooldown(f.minCooldown, f.maxCooldown),
            maxRetryAttempts: f.maxRetryAttempts,
            batchSize: 50,
            processBatchWaitTime: 0
        },
        C = {},
        $ = {},
        L = function(e, t, n, r, i) {
            if (i && r && delete $[r], !(r in $)) {
                var a = function(e, t) {
                    if (t in C) return C[t];
                    var n = T.createRequestProcessor(e, Z, E);
                    return C[t] = n, n
                }(t, n);
                i && a.invalidateItem(e);
                var o = a.queueItem(e).catch(function(e) {
                    return Promise.reject(e)
                });
                $[r] = o
            }
            return $[r]
        },
        R = {},
        G = function(e, t, r, i, a, o) {
            void 0 === a && (a = v.webp), void 0 === o && (o = p.PlaceHolder);
            var l, s, d, f = (s = u(), (d = ((l = {})[m.assetThumbnail] = s.getAssets, l[m.avatarHeadshot] = s.getAvatarHeadshots, l[m.avatar] = s.getAvatars, l[m.bundleThumbnail] = s.getBundles, l[m.gameIcon] = s.getGameIcons, l[m.groupIcon] = s.getGroupIcons, l[m.badgeIcon] = s.getBadgeIcons, l[m.gamePassIcon] = s.getGamePassIcons, l[m.developerProductIcon] = s.getDeveloperProductIcons, l[m.userOutfit] = s.getUserOutfits, l[m.gameThumbnail] = s.getGameThumbnails, l[m.universeThumbnail] = s.getUniverseThumbnails, l[m.placeIcon] = s.getPlaceIcons, l[m.autoGeneratedPlaceThumbnail] = s.getAutoGeneratedPlaceImage, l[m.autoGeneratedPlaceIcon] = s.getAutoGeneratedPlaceImage, l)[r]) || console.debug("Missing urlConfig implementation for thumbnail type: ".concat(r)), d);
            return new Promise(function(u, l) {
                var s = t.map(function(e) {
                    return e.itemId
                });
                if (f) {
                    var d = (new Date).getTime(),
                        v = [];
                    v = r === m.assetThumbnail || r === m.gameIcon || r === m.placeIcon ? [s, o, i, a] : r === m.gameThumbnail ? [e, s, i, a] : [s, i, a], f.apply(null, v).then(function(e) {
                        var r, i = {};
                        (null != (r = null == e ? void 0 : e.data) ? r : []).forEach(function(e) {
                            i[Z(e.targetId)] = e
                        }), t.forEach(function(e) {
                            var t = e.itemId,
                                r = Z(t);
                            Object.prototype.hasOwnProperty.call(i, r) && i[r] ? i[r].state === n.i.Pending && (delete i[r], R[r] || (R[r] = {
                                startTime: d
                            })) : i[r] = {
                                targetId: t,
                                state: n.i.Error
                            }
                        }), u(i)
                    }).catch(function() {
                        u({})
                    })
                } else l(c.b.unretriableFailure)
            })
        },
        J = function(e, t, r, i, a, o, c) {
            void 0 === i && (i = v.webp), void 0 === a && (a = p.PlaceHolder), void 0 === c && (c = !1);
            var u, l, s, d, m = o || g[e] || n.H._150x150;
            if (!r) return new Promise(function(e, t) {
                t("TargetId can not be empty.")
            });
            if (!e) return new Promise(function(e, t) {
                t("ThumbnailType can not be empty.")
            });
            var f = (u = i, l = a, void 0 === u && (u = v.webp), void 0 === l && (l = p.PlaceHolder), "thumbnail_type:".concat(e, "_baseTargetId:").concat(t, "_targetId:").concat(r, "_requestedSize:").concat(m, "_format:").concat(u, "_returnPolicy:").concat(l));
            return L(r, function(n) {
                return G(t, n, e, m, i, a)
            }, (s = i, d = a, void 0 === s && (s = v.webp), void 0 === d && (d = p.PlaceHolder), "".concat(t, ":").concat(e, ":").concat(m, ":").concat(s, ":").concat(d)), f, c)
        },
        B = {
            getThumbnailImage: function(e, t, n, r, i) {
                return void 0 === n && (n = p.PlaceHolder), void 0 === r && (r = v.webp), J(e, 0, t, r, n, i)
            },
            reloadThumbnailImage: function(e, t, n, r, i) {
                return void 0 === n && (n = p.PlaceHolder), void 0 === r && (r = v.webp), J(e, 0, t, r, n, i, !0)
            },
            getThumbnailImageWithBaseTarget: function(e, t, n, r, i, a) {
                return void 0 === r && (r = p.PlaceHolder), void 0 === i && (i = v.webp), J(e, t, n, i, r, a)
            }
        },
        M = (0, r.forwardRef)(function(e, t) {
            var i = this,
                a = e.type,
                o = e.baseTargetId,
                c = void 0 === o ? 0 : o,
                u = e.targetId,
                l = e.imgClassName,
                s = void 0 === l ? "" : l,
                d = e.containerClass,
                f = e.returnPolicy,
                g = void 0 === f ? p.PlaceHolder : f,
                b = e.alt,
                y = e.skeletonVariant,
                I = e.isPendingNewTarget,
                w = e.includeBackground,
                k = e.size,
                x = e.onLoadThumbnailStatus,
                S = e.format,
                z = void 0 === S ? v.webp : S,
                U = (0, r.useState)(),
                A = U[0],
                D = U[1];
            (0, r.useEffect)(function() {
                var e = !0;
                return h(i, void 0, void 0, function() {
                        var t;
                        return _(this, function(n) {
                            switch (n.label) {
                                case 0:
                                    return z !== v.webp && D(z), [4, function() {
                                        return h(this, void 0, void 0, function() {
                                            return _(this, function(e) {
                                                return void 0 === O && (O = new Promise(function(e) {
                                                    try {
                                                        var t = new Image;
                                                        t.onload = function() {
                                                            return e(t.width > 0 && t.height > 0)
                                                        }, t.onerror = function() {
                                                            return e(!1)
                                                        }, t.src = "data:image/webp;base64,UklGRkoAAABXRUJQVlA4WAoAAAAQAAAAAAAAAAAAQUxQSAwAAAARBxAR/Q9ERP8DAABWUDggGAAAABQBAJ0BKgEAAQAAAP4AAA3AAP7mtQAAAA=="
                                                    } catch (t) {
                                                        e(!0)
                                                    }
                                                })), [2, O]
                                            })
                                        })
                                    }()];
                                case 1:
                                    return t = n.sent(), e && D(t ? z : v.png), [2]
                            }
                        })
                    }),
                    function() {
                        e = !1
                    }
            }, [z]);
            var P = (0, r.useState)(n.i.Pending),
                N = P[0],
                Z = P[1],
                T = (0, r.useState)(),
                E = T[0],
                C = T[1],
                $ = (0, r.useState)(!0),
                L = $[0],
                R = $[1],
                G = (0, r.useState)(performance.now())[0],
                J = (0, r.useMemo)(function() {
                    return a === m.gameThumbnail || a === m.universeThumbnail ? .5625 : 1
                }, [a]);
            return (0, r.useImperativeHandle)(t, function() {
                return {
                    refreshThumbnail: function() {
                        B.reloadThumbnailImage(a, u, g, A).then(function(e) {
                            var t = e.state,
                                r = e.imageUrl;
                            Z(null != t ? t : n.i.Pending), C(r)
                        }, function(e) {
                            console.log(e)
                        }).finally(function() {
                            R(!1)
                        })
                    }
                }
            }), (0, r.useEffect)(function() {
                var e = !1;
                return R(!0), void 0 === A || (c ? B.getThumbnailImageWithBaseTarget(a, c, u, g, A, k) : B.getThumbnailImage(a, u, g, A, k)).then(function(t) {
                        var r = t.state,
                            i = t.imageUrl;
                        e || (Z(null != r ? r : n.i.Pending), C(i))
                    }, function(e) {
                        console.log(e)
                    }).finally(function() {
                        e || R(!1)
                    }),
                    function() {
                        e = !0
                    }
            }, [a, c, u, s, A, g, k]), r.default.createElement(j, {
                thumbnailUrl: E,
                thumbnailStatus: N,
                skeletonVariant: y,
                imgClassName: s,
                isPendingResponse: L,
                isPendingNewTarget: void 0 !== I && I,
                containerClass: void 0 === d ? "" : d,
                alt: b,
                includeBackground: void 0 !== w && w,
                sizeRatio: J,
                startTime: G,
                onLoadThumbnailStatus: void 0 === x ? void 0 : x
            })
        });
    e.s(["X", 0, p, "x", 0, M, "O", 0, B, "f", 0, v, "V", 0, m, "z", 0, function(e) {
        var t = e.baseUrl,
            n = e.targetNamespace,
            i = e.children,
            a = (0, r.useMemo)(function() {
                return {
                    eventTracker: P(t, n)
                }
            }, [t, n]);
        return r.default.createElement(N.Provider, {
            value: a
        }, i)
    }, "g", 0, function(e) {
        var r = new n.w(new t.x({
                basePath: e,
                credentials: "include"
            })),
            i = new n.M(new t.x({
                basePath: e,
                credentials: "include"
            })),
            a = new n.l(new t.x({
                basePath: e,
                credentials: "include"
            })),
            o = new n.a(new t.x({
                basePath: e,
                credentials: "include"
            })),
            c = new n.P(new t.x({
                basePath: e,
                credentials: "include"
            })),
            u = new n.v(new t.x({
                basePath: e,
                credentials: "include"
            })),
            l = new n.o(new t.x({
                basePath: e,
                credentials: "include"
            })),
            d = new n.Y(new t.x({
                basePath: e,
                credentials: "include"
            })),
            m = new n.X(new t.x({
                basePath: e,
                credentials: "include"
            })),
            f = new n.y(new t.x({
                basePath: e,
                credentials: "include"
            })),
            v = new n.x(new t.x({
                basePath: e,
                credentials: "include"
            }));
        s = {
            getAssets: function(e, t, n, i, a) {
                return r.v1AssetsGet({
                    assetIds: e,
                    returnPolicy: t,
                    size: n,
                    format: i,
                    isCircular: a
                })
            },
            getAvatarHeadshots: function(e, t, n, r) {
                return i.v1UsersAvatarHeadshotGet({
                    userIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getAvatars: function(e, t, n, r) {
                return i.v1UsersAvatarGet({
                    userIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getBundles: function(e, t, n, r) {
                return o.v1BundlesThumbnailsGet({
                    bundleIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getGameIcons: function(e, t, n, r, i) {
                return l.v1GamesIconsGet({
                    universeIds: e,
                    returnPolicy: t,
                    size: n,
                    format: r,
                    isCircular: i
                })
            },
            getGroupIcons: function(e, t, n, r) {
                return d.v1GroupsIconsGet({
                    groupIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getBadgeIcons: function(e, t, n, r) {
                return a.v1BadgesIconsGet({
                    badgeIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getGamePassIcons: function(e, t, n, r) {
                return u.v1GamePassesGet({
                    gamePassIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getDeveloperProductIcons: function(e, t, n, r) {
                return c.v1DeveloperProductsIconsGet({
                    developerProductIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getUserOutfits: function(e, t, n, r) {
                return m.v1UsersOutfitsGet({
                    userOutfitIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getGameThumbnails: function(e, t, n, r, i) {
                return l.v1GamesUniverseIdThumbnailsGet({
                    universeId: e,
                    thumbnailIds: t,
                    size: n,
                    format: r,
                    isCircular: i
                })
            },
            getUniverseThumbnails: function(e, t, n, r) {
                return l.v1GamesMultigetThumbnailsGet({
                    universeIds: e,
                    countPerUniverse: 1,
                    defaults: !0,
                    size: t,
                    format: n,
                    isCircular: r
                }).then(function(e) {
                    var t, n = null == e ? void 0 : e.data;
                    return {
                        data: null != (t = null == n ? void 0 : n.map(function(e) {
                            var t, n = null == (t = e.thumbnails) ? void 0 : t[0];
                            return {
                                targetId: e.universeId,
                                state: null == n ? void 0 : n.state,
                                imageUrl: null == n ? void 0 : n.imageUrl
                            }
                        })) ? t : []
                    }
                })
            },
            getPlaceIcons: function(e, t, n, r, i) {
                return f.v1PlacesGameiconsGet({
                    placeIds: e,
                    returnPolicy: t,
                    size: n,
                    format: r,
                    isCircular: i
                })
            },
            getAutoGeneratedPlaceImage: function(e, t, r) {
                var i = e.map(function(e) {
                    return {
                        targetId: e,
                        type: n.z.GameIcon,
                        size: t,
                        format: r
                    }
                });
                return v.v1BatchPost({
                    requests: i
                })
            },
            getBatchThumbnails: function(e, t, n, r, i) {
                var a = e.map(function(e) {
                    return {
                        targetId: e,
                        type: t,
                        size: n,
                        format: r,
                        isCircular: i
                    }
                });
                return v.v1BatchPost({
                    requests: a
                })
            }
        }
    }, "A", 0, u])
}, 646555, e => {
    "use strict";
    let t, n, r, i;
    var a = e.i(856165),
        o = e.i(225226),
        c = e.i(643766),
        u = e.i(231543),
        l = e.i(130933),
        s = e.i(433659),
        d = e.i(179183),
        m = e.i(365434),
        f = e.i(677484),
        v = e.i(785517),
        p = e.i(678606),
        g = e.i(268953),
        h = e.i(397439);

    function _() {
        let e = (0, a._)(["\n  0% {\n    opacity: 1;\n  }\n\n  50% {\n    opacity: 0.4;\n  }\n\n  100% {\n    opacity: 1;\n  }\n"]);
        return _ = function() {
            return e
        }, e
    }

    function b() {
        let e = (0, a._)(["\n  0% {\n    transform: translateX(-100%);\n  }\n\n  50% {\n    /* +0.5s of delay between each loop */\n    transform: translateX(100%);\n  }\n\n  100% {\n    transform: translateX(100%);\n  }\n"]);
        return b = function() {
            return e
        }, e
    }

    function y() {
        let e = (0, a._)(["\n      animation: ", " 2s ease-in-out 0.5s infinite;\n    "]);
        return y = function() {
            return e
        }, e
    }

    function I() {
        let e = (0, a._)(["\n      position: relative;\n      overflow: hidden;\n\n      /* Fix bug in Safari https://bugs.webkit.org/show_bug.cgi?id=68196 */\n      -webkit-mask-image: -webkit-radial-gradient(white, black);\n\n      &::after {\n        animation: ", " 2s linear 0.5s infinite;\n        background: linear-gradient(\n          90deg,\n          transparent,\n          ", ",\n          transparent\n        );\n        content: '';\n        position: absolute;\n        transform: translateX(-100%); /* Avoid flash during server-side hydration */\n        bottom: 0;\n        left: 0;\n        right: 0;\n        top: 0;\n      }\n    "]);
        return I = function() {
            return e
        }, e
    }

    function w(e) {
        return (0, s.g)("MuiSkeleton", e)
    }(0, f.g)("MuiSkeleton", ["root", "text", "rectangular", "rounded", "circular", "pulse", "wave", "withChildren", "fitContent", "heightAuto"]);
    let k = ["animation", "className", "component", "height", "style", "variant", "width"],
        x = (0, h.q)(t || (t = _())),
        S = (0, h.q)(n || (n = b())),
        z = (0, m.s)("span", {
            name: "MuiSkeleton",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [t.root, t[n.variant], !1 !== n.animation && t[n.animation], n.hasChildren && t.withChildren, n.hasChildren && !n.width && t.fitContent, n.hasChildren && !n.height && t.heightAuto]
            }
        })(e => {
            let {
                theme: t,
                ownerState: n
            } = e, r = String(t.shape.borderRadius).match(/[\d.\-+]*\s*(.*)/)[1] || "px", i = parseFloat(t.shape.borderRadius);
            return (0, d._)({
                display: "block",
                backgroundColor: t.vars ? t.vars.palette.Skeleton.bg : (0, p.a)(t.palette.text.primary, "light" === t.palette.mode ? .11 : .13),
                height: "1.2em"
            }, "text" === n.variant && {
                marginTop: 0,
                marginBottom: 0,
                height: "auto",
                transformOrigin: "0 55%",
                transform: "scale(1, 0.60)",
                borderRadius: "".concat(i).concat(r, "/").concat(Math.round(i / .6 * 10) / 10).concat(r),
                "&:empty:before": {
                    content: '"\\00a0"'
                }
            }, "circular" === n.variant && {
                borderRadius: "50%"
            }, "rounded" === n.variant && {
                borderRadius: (t.vars || t).shape.borderRadius
            }, n.hasChildren && {
                "& > *": {
                    visibility: "hidden"
                }
            }, n.hasChildren && !n.width && {
                maxWidth: "fit-content"
            }, n.hasChildren && !n.height && {
                height: "auto"
            })
        }, e => {
            let {
                ownerState: t
            } = e;
            return "pulse" === t.animation && (0, h.m)(r || (r = y()), x)
        }, e => {
            let {
                ownerState: t,
                theme: n
            } = e;
            return "wave" === t.animation && (0, h.m)(i || (i = I()), S, (n.vars || n).palette.action.hover)
        }),
        U = c.forwardRef(function(e, t) {
            let n = (0, g.u)({
                    props: e,
                    name: "MuiSkeleton"
                }),
                {
                    animation: r = "pulse",
                    className: i,
                    component: a = "span",
                    height: o,
                    style: c,
                    variant: u = "text",
                    width: l
                } = n,
                f = (0, s._)(n, k),
                p = (0, d._)({}, n, {
                    animation: r,
                    component: a,
                    variant: u,
                    hasChildren: !!f.children
                }),
                h = (e => {
                    let {
                        classes: t,
                        variant: n,
                        animation: r,
                        hasChildren: i,
                        width: a,
                        height: o
                    } = e;
                    return (0, m.a)({
                        root: ["root", n, r, i && "withChildren", i && !a && "fitContent", i && !o && "heightAuto"]
                    }, w, t)
                })(p);
            return (0, v.jsx)(z, (0, d._)({
                as: a,
                ref: t,
                className: (0, m.c)(h.root, i),
                ownerState: p
            }, f, {
                style: (0, d._)({
                    width: l,
                    height: o
                }, c)
            }))
        });
    var A = (0, u.f)({
            name: "Skeleton"
        })(function(e) {
            return {
                root: {
                    backgroundColor: e.palette.states.hover
                },
                wave: {
                    backgroundColor: e.palette.states.focus
                },
                rectangular: (0, o._)({}, e.border.radius.large),
                square: {
                    borderRadius: "0px"
                }
            }
        }),
        D = {
            text: "text",
            rectangular: "rectangular",
            circular: "circular",
            square: "rectangular"
        },
        P = (0, c.forwardRef)(function(e, t) {
            var n, r = e.variant,
                i = void 0 === r ? "text" : r,
                a = e.animate,
                u = e.classes,
                s = e.className,
                d = (0, o.a)(e, ["variant", "animate", "classes", "className"]),
                m = A(void 0, {
                    props: {
                        classes: (0, l.f)(u, s)
                    }
                }),
                f = m.classes,
                v = f.square,
                p = f.rectangular,
                g = (0, o.a)(f, ["square", "rectangular"]),
                h = m.cx;
            return c.default.createElement(U, (0, o._)({}, d, {
                variant: D[i],
                animation: !!(void 0 !== a && a) && "wave",
                classes: (0, o._)((0, o._)({}, g), {
                    rectangular: h(p, ((n = {})[v] = "square" === i, n))
                }),
                ref: t
            }))
        });
    e.s(["f", 0, P], 646555)
}]);

//# debugId=1ab4c9a4-edd7-7378-cfb3-f1eae9447881
//# sourceMappingURL=38srua9x6jv4c.js.map