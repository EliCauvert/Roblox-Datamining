;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "f258aadb-912d-f3e6-73b8-270a733f6f47")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 438641, 655831, 748089, 932471, 455162, 402171, 61856, 239523, 168722, 490742, 925633, 566387, 176860, t => {
    "use strict";
    let n, i;
    t.s(["BIGINT_FORMAT_RANGES", () => ea, "CONSTANT_CATCH", () => eV, "Class", () => ej, "NUMBER_FORMAT_RANGES", () => er, "aborted", () => ep, "allowsEval", () => B, "assert", () => y, "assertEqual", () => f, "assertIs", () => g, "assertNever", () => h, "assertNotEqual", () => v, "assignProp", () => O, "attachSchema", () => e_, "base64ToUint8Array", () => eN, "base64urlToUint8Array", () => eO, "cached", () => w, "captureStackTrace", () => V, "cleanEnum", () => eU, "cleanRegex", () => x, "clone", () => Q, "cloneDef", () => T, "codePointLength", () => ew, "constantCatch", () => eF, "createTransparentProxy", () => et, "defineLazy", () => N, "defineLazyInternal", () => eJ, "derived", () => eL, "esc", () => J, "escapeRegex", () => Y, "explicitlyAborted", () => eg, "extend", () => el, "finalizeIssue", () => eb, "floatSafeRemainder", () => z, "getElementAtPath", () => L, "getEnumValues", () => _, "getLengthableOrigin", () => eS, "getParsedType", () => X, "getSizableOrigin", () => ek, "hexToUint8Array", () => eA, "hide", () => eT, "installLazyProp", () => eM, "isObject", () => F, "isPlainObject", () => K, "issue", () => ez, "joinValues", () => b, "jsonStringifyReplacer", () => k, "members", () => e$, "merge", () => em, "mergeDefs", () => E, "normalizeParams", () => ee, "nullish", () => S, "numKeys", () => G, "objectClone", () => D, "omit", () => eu, "optionalKeys", () => ei, "own", () => eE, "parsedType", () => ex, "partial", () => ef, "pick", () => eo, "prefixIssues", () => eh, "primitiveTypes", () => H, "promiseAllObject", () => C, "propertyKeyTypes", () => q, "randomString", () => R, "rawShape", () => Z, "required", () => ev, "safeExtend", () => ed, "shallowClone", () => W, "slugify", () => M, "stringifyPrimitive", () => en, "toZod", () => p, "uint8ArrayToBase64", () => eD, "uint8ArrayToBase64url", () => eZ, "uint8ArrayToHex", () => eP, "unwrapMessage", () => ey], 748089), t.s(["$ZodAsyncError", () => l, "$ZodEncodeError", () => s, "$brand", () => u, "$constructor", () => c, "NEVER", () => r, "config", () => m, "globalConfig", () => d], 655831);
    let r = Object.freeze({
            status: "aborted"
        }),
        a = {
            value: void 0,
            enumerable: !1
        },
        o = "captureStackTrace" in Error ? Error : null;

    function c(t, n, i, r) {
        var c;

        function u(t) {
            this.def = t, this.constr = f, this.traits = new Set
        }
        u.prototype = {};
        let l = i && new WeakSet;

        function s(r, o) {
            if (r._zod) {
                if (r._zod.traits.has(t)) return
            } else {
                a.value = new u(o);
                try {
                    Object.defineProperty(r, "_zod", a)
                } finally {
                    a.value = void 0
                }
            }
            if (r._zod.traits.add(t), n(r, o), l) {
                let t = Object.getPrototypeOf(r),
                    n = r._zod.constr.prototype,
                    a = t;
                for (; a && a !== n;) a = Object.getPrototypeOf(a);
                let o = null != a ? a : t;
                l.has(o) || (l.add(o), e$(o, i))
            }
            let c = f.prototype;
            for (let t in c) Object.prototype.hasOwnProperty.call(c, t) && (t in r || (r[t] = c[t].bind(r)))
        }
        let d = null != (c = null == r ? void 0 : r.Parent) ? c : Object;
        class m extends d {}

        function f(t) {
            var n;
            let i = (null == r ? void 0 : r.Parent) ? function(t) {
                let n = o;
                if (n) {
                    let i = n.stackTraceLimit;
                    if ("number" == typeof i) {
                        try {
                            n.stackTraceLimit = 0
                        } catch (n) {
                            return o = null, new t
                        }
                        try {
                            return new t
                        } finally {
                            n.stackTraceLimit = i
                        }
                    }
                }
                return new t
            }(m) : this;
            s(i, t);
            let a = i._zod.deferred;
            if (a) {
                for (let t of a) t();
                i._zod.deferred = void 0
            }
            let c = null == (n = globalThis.__zod_globalConfig) ? void 0 : n.postProcessor;
            return c && c(i), i
        }
        return Object.defineProperty(m, "name", {
            value: t
        }), Object.defineProperty(f, "init", {
            value: s
        }), Object.defineProperty(f, Symbol.hasInstance, {
            value: n => {
                var i, a;
                return null != r && !!r.Parent && n instanceof r.Parent || (null == n || null == (a = n._zod) || null == (i = a.traits) ? void 0 : i.has(t))
            }
        }), Object.defineProperty(f, "name", {
            value: t
        }), f
    }
    let u = Symbol("zod_brand");
    class l extends Error {
        constructor() {
            super("Encountered Promise during synchronous parse. Use .parseAsync() instead.")
        }
    }
    class s extends Error {
        constructor(t) {
            super("Encountered unidirectional transform during encode: ".concat(t)), this.name = "ZodEncodeError"
        }
    }
    null != (eB = globalThis).__zod_globalConfig || (eB.__zod_globalConfig = {});
    let d = globalThis.__zod_globalConfig;

    function m(t) {
        return t && Object.assign(d, t), d
    }

    function f(t) {
        return t
    }

    function v(t) {
        return t
    }

    function p() {
        return t => t
    }

    function g(t) {}

    function h(t) {
        throw Error("Unexpected value in exhaustive check")
    }

    function y(t) {}

    function _(t) {
        let n = Object.values(t).filter(t => "number" == typeof t);
        return Object.entries(t).filter(t => {
            let [i, r] = t;
            return -1 === n.indexOf(+i)
        }).map(t => {
            let [n, i] = t;
            return i
        })
    }

    function b(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "|";
        return t.map(t => en(t)).join(n)
    }

    function k(t, n) {
        return "bigint" == typeof n ? n.toString() : n
    }
    class I {
        get value() {
            let t = this._getter;
            return void 0 !== t && (this._value = t(), this._getter = void 0), this._value
        }
        constructor(t) {
            this._getter = t, this._value = void 0
        }
    }

    function w(t) {
        return new I(t)
    }

    function S(t) {
        return null == t
    }

    function x(t) {
        let n = +!!t.startsWith("^"),
            i = t.endsWith("$") ? t.length - 1 : t.length;
        return t.slice(n, i)
    }

    function z(t, n) {
        let i = t / n,
            r = Math.round(i),
            a = 4 * Number.EPSILON * Math.max(Math.abs(i), 1);
        return Math.abs(i - r) < a ? 0 : i - r
    }
    let U = Symbol("evaluating");

    function N(t, n, i) {
        let r;
        Object.defineProperty(t, n, {
            get() {
                if (r !== U) return void 0 === r && (r = U, r = i()), r
            },
            set(i) {
                Object.defineProperty(t, n, {
                    value: i
                })
            },
            configurable: !0
        })
    }

    function D(t) {
        return Object.create(Object.getPrototypeOf(t), Object.getOwnPropertyDescriptors(t))
    }

    function O(t, n, i) {
        Object.defineProperty(t, n, {
            value: i,
            writable: !0,
            enumerable: !0,
            configurable: !0
        })
    }

    function Z(t) {
        let n = Object.getOwnPropertyDescriptor(t, "shape");
        return (null == n ? void 0 : n.get) ? n.get.raw : null == n ? void 0 : n.value
    }

    function A(t) {
        var n;
        return null != (n = Z(t._zod.def)) ? n : t._zod.def.shape
    }

    function P(t, n, i) {
        Object.defineProperty(t, n, {
            get() {
                let t = i();
                return O(this, n, t), t
            },
            enumerable: !0,
            configurable: !0
        })
    }

    function j(t, n, i) {
        n in t ? O(t, n, i) : t[n] = i
    }

    function $(t, n, i, r) {
        let a = A(n);
        for (let o of i) {
            let i = Object.getOwnPropertyDescriptor(a, o);
            i.enumerable && (i.get ? P(t, o, () => {
                let t = n._zod.def.shape[o];
                return r ? r(t, o) : t
            }) : j(t, o, r ? r(i.value, o) : i.value))
        }
    }

    function E() {
        for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
        let r = {};
        for (let t of n) Object.assign(r, Object.getOwnPropertyDescriptors(t));
        return Object.defineProperties({}, r)
    }

    function T(t) {
        return E(t._zod.def)
    }

    function L(t, n) {
        return n ? n.reduce((t, n) => null == t ? void 0 : t[n], t) : t
    }

    function C(t) {
        let n = Object.keys(t);
        return Promise.all(n.map(n => t[n])).then(t => {
            let i = {};
            for (let r = 0; r < n.length; r++) i[n[r]] = t[r];
            return i
        })
    }

    function R() {
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 10,
            n = "abcdefghijklmnopqrstuvwxyz",
            i = "";
        for (let r = 0; r < t; r++) i += n[Math.floor(Math.random() * n.length)];
        return i
    }

    function J(t) {
        return JSON.stringify(t)
    }

    function M(t) {
        return t.toLowerCase().trim().replace(/[^\w\s-]/g, "").replace(/[\s_-]+/g, "-").replace(/^-+|-+$/g, "")
    }
    let V = "captureStackTrace" in Error ? Error.captureStackTrace : function() {
        for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i]
    };

    function F(t) {
        return "object" == typeof t && null !== t && !Array.isArray(t)
    }
    let B = w(() => {
        var t, n;
        if (d.jitless || "u" > typeof navigator && (null == (n = navigator) || null == (t = n.userAgent) ? void 0 : t.includes("Cloudflare"))) return !1;
        try {
            return Function(""), !0
        } catch (t) {
            return !1
        }
    });

    function K(t) {
        if (!1 === F(t)) return !1;
        let n = t.constructor;
        if (void 0 === n || "function" != typeof n) return !0;
        let i = n.prototype;
        return !1 !== F(i) && !1 !== Object.prototype.hasOwnProperty.call(i, "isPrototypeOf")
    }

    function W(t) {
        return K(t) ? {
            ...t
        } : Array.isArray(t) ? [...t] : t instanceof Map ? new Map(t) : t instanceof Set ? new Set(t) : t
    }

    function G(t) {
        let n = 0;
        for (let i in t) Object.prototype.hasOwnProperty.call(t, i) && n++;
        return n
    }
    let X = t => {
            let n = typeof t;
            switch (n) {
                case "undefined":
                    return "undefined";
                case "string":
                    return "string";
                case "number":
                    return Number.isNaN(t) ? "nan" : "number";
                case "boolean":
                    return "boolean";
                case "function":
                    return "function";
                case "bigint":
                    return "bigint";
                case "symbol":
                    return "symbol";
                case "object":
                    if (Array.isArray(t)) return "array";
                    if (null === t) return "null";
                    if (t.then && "function" == typeof t.then && t.catch && "function" == typeof t.catch) return "promise";
                    if ("u" > typeof Map && t instanceof Map) return "map";
                    if ("u" > typeof Set && t instanceof Set) return "set";
                    if ("u" > typeof Date && t instanceof Date) return "date";
                    if ("u" > typeof File && t instanceof File) return "file";
                    return "object";
                default:
                    throw Error("Unknown data type: ".concat(n))
            }
        },
        q = new Set(["string", "number", "symbol"]),
        H = new Set(["string", "number", "bigint", "boolean", "symbol", "undefined"]);

    function Y(t) {
        return t.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
    }

    function Q(t, n, i) {
        let r = new t._zod.constr(null != n ? n : t._zod.def);
        return (!n || (null == i ? void 0 : i.parent)) && (r._zod.parent = t), r
    }

    function ee(t) {
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

    function et(t) {
        let n;
        return new Proxy({}, {
            get: (i, r, a) => (null != n || (n = t()), Reflect.get(n, r, a)),
            set: (i, r, a, o) => (null != n || (n = t()), Reflect.set(n, r, a, o)),
            has: (i, r) => (null != n || (n = t()), Reflect.has(n, r)),
            deleteProperty: (i, r) => (null != n || (n = t()), Reflect.deleteProperty(n, r)),
            ownKeys: i => (null != n || (n = t()), Reflect.ownKeys(n)),
            getOwnPropertyDescriptor: (i, r) => (null != n || (n = t()), Reflect.getOwnPropertyDescriptor(n, r)),
            defineProperty: (i, r, a) => (null != n || (n = t()), Reflect.defineProperty(n, r, a))
        })
    }

    function en(t) {
        return "bigint" == typeof t ? t.toString() + "n" : "string" == typeof t ? '"'.concat(t, '"') : "".concat(t)
    }

    function ei(t) {
        return Object.keys(t).filter(n => void 0 !== t[n]._zod.optin && "optional" === t[n]._zod.optout)
    }
    let er = {
            safeint: [Number.MIN_SAFE_INTEGER, Number.MAX_SAFE_INTEGER],
            int32: [-0x80000000, 0x7fffffff],
            uint32: [0, 0xffffffff],
            float32: [-34028234663852886e22, 34028234663852886e22],
            float64: [-Number.MAX_VALUE, Number.MAX_VALUE]
        },
        ea = {
            int64: [BigInt("-9223372036854775808"), BigInt("9223372036854775807")],
            uint64: [BigInt(0), BigInt("18446744073709551615")]
        };

    function eo(t, n) {
        let i = t._zod.def,
            r = i.checks;
        if (r && r.length > 0) throw Error(".pick() cannot be used on object schemas containing refinements");
        let a = {};
        return $(a, t, ec(t, n)), Q(t, E(i, {
            shape: a,
            checks: []
        }))
    }

    function ec(t, n) {
        let i = A(t),
            r = [];
        for (let t of Reflect.ownKeys(n)) {
            var a;
            if (!(null == (a = Object.getOwnPropertyDescriptor(i, t)) ? void 0 : a.enumerable)) throw Error('Unrecognized key: "'.concat(String(t), '"'));
            n[t] && r.push(t)
        }
        return r
    }

    function eu(t, n) {
        let i = t._zod.def,
            r = i.checks;
        if (r && r.length > 0) throw Error(".omit() cannot be used on object schemas containing refinements");
        let a = new Set(ec(t, n)),
            o = {};
        return $(o, t, Reflect.ownKeys(A(t)).filter(t => !a.has(t))), Q(t, E(i, {
            shape: o,
            checks: []
        }))
    }

    function el(t, n) {
        if (!K(n)) throw Error("Invalid input to extend: expected a plain object");
        let i = t._zod.def.checks;
        if (i && i.length > 0) {
            let i = A(t);
            for (let t of Reflect.ownKeys(n))
                if (void 0 !== Object.getOwnPropertyDescriptor(i, t)) throw Error("Cannot overwrite keys on object schemas containing refinements. Use `.safeExtend()` instead.")
        }
        return Q(t, E(t._zod.def, {
            shape: es(t, n)
        }))
    }

    function es(t, n) {
        let i = {};
        $(i, t, Reflect.ownKeys(A(t)));
        for (let t of Reflect.ownKeys(n)) {
            let r = Object.getOwnPropertyDescriptor(n, t);
            r.enumerable && (r.get ? P(i, t, () => n[t]) : j(i, t, r.value))
        }
        return i
    }

    function ed(t, n) {
        if (!K(n)) throw Error("Invalid input to safeExtend: expected a plain object");
        return Q(t, E(t._zod.def, {
            shape: es(t, n)
        }))
    }

    function em(t, n) {
        var i, r, a;
        if (!(null == n || null == (r = n._zod) ? void 0 : r.def)) throw Error("Invalid input to merge: expected an object schema. To merge a plain shape, use `.extend()`.");
        if (null == (a = t._zod.def.checks) ? void 0 : a.length) throw Error(".merge() cannot be used on object schemas containing refinements. Use .safeExtend() instead.");
        let o = {};
        $(o, t, Reflect.ownKeys(A(t))), $(o, n, Reflect.ownKeys(A(n)));
        let c = E(t._zod.def, {
            shape: o,
            get catchall() {
                return n._zod.def.catchall
            },
            checks: null != (i = n._zod.def.checks) ? i : []
        });
        return Q(t, c)
    }

    function ef(t, n, i) {
        let r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : "partial",
            a = n._zod.def.checks;
        if (a && a.length > 0) throw Error(".".concat(r, "() cannot be used on object schemas containing refinements"));
        let o = i ? new Set(ec(n, i)) : void 0,
            c = {};
        return $(c, n, Reflect.ownKeys(A(n)), t && ((n, i) => o && !o.has(i) ? n : new t({
            type: "optional",
            innerType: n
        }))), Q(n, E(n._zod.def, {
            shape: c,
            checks: []
        }))
    }

    function ev(t, n, i) {
        let r = i ? new Set(ec(n, i)) : void 0,
            a = {};
        return $(a, n, Reflect.ownKeys(A(n)), (n, i) => r && !r.has(i) ? n : new t({
            type: "nonoptional",
            innerType: n
        })), Q(n, E(n._zod.def, {
            shape: a
        }))
    }

    function ep(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
        if (!0 === t.aborted) return !0;
        for (let r = n; r < t.issues.length; r++) {
            var i;
            if ((null == (i = t.issues[r]) ? void 0 : i.continue) !== !0) return !0
        }
        return !1
    }

    function eg(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
        if (!0 === t.aborted) return !0;
        for (let r = n; r < t.issues.length; r++) {
            var i;
            if ((null == (i = t.issues[r]) ? void 0 : i.continue) === !1) return !0
        }
        return !1
    }

    function eh(t, n) {
        return n.map(n => (null != n.path || (n.path = []), n.path.unshift(t), n))
    }

    function ey(t) {
        return "string" == typeof t ? t : null == t ? void 0 : t.message
    }

    function e_(t, n, i) {
        var r;
        for (let a = n; a < t.length; a++) null != (r = t[a]).schema || (r.schema = i)
    }

    function eb(t, n, i) {
        var r, a, o, c, u, l, s, d, m, f, v, p, g, h, y;
        let _ = null == (s = t.inst) || null == (l = s._zod) ? void 0 : l.traits;
        (null == _ ? void 0 : _.has("$ZodType")) && (_.has("$ZodCheck") && null != t.schema || (t.schema = t.inst));
        let b = t.schema !== t.inst ? null == (m = t.schema) || null == (d = m._zod.def) ? void 0 : d.error : void 0,
            k = t.message ? t.message : null != (r = null != (a = null != (o = null != (c = null != (u = ey(null == (p = t.inst) || null == (v = p._zod.def) || null == (f = v.error) ? void 0 : f.call(v, t))) ? u : ey(null == b ? void 0 : b(t))) ? c : ey(null == n || null == (g = n.error) ? void 0 : g.call(n, t))) ? o : ey(null == (h = i.customError) ? void 0 : h.call(i, t))) ? a : ey(null == (y = i.localeError) ? void 0 : y.call(i, t))) ? r : "Invalid input",
            I = {};
        for (let n of Object.keys(t)) "inst" !== n && "schema" !== n && "continue" !== n && "input" !== n && "__proto__" !== n && (I[n] = t[n]);
        return null != I.path || (I.path = []), I.message = k, (null == n ? void 0 : n.reportInput) && (I.input = t.input), I
    }

    function ek(t) {
        return t instanceof Set ? "set" : t instanceof Map ? "map" : t instanceof File ? "file" : "unknown"
    }
    let eI = /[\uD800-\uDBFF]/;

    function ew(t) {
        let n = t.length;
        if (!eI.test(t)) return n;
        let i = n;
        for (let r = 0; r < n - 1; r++)(64512 & t.charCodeAt(r)) == 55296 && (64512 & t.charCodeAt(r + 1)) == 56320 && (i--, r++);
        return i
    }

    function eS(t) {
        return Array.isArray(t) ? "array" : "string" == typeof t ? "string" : "unknown"
    }

    function ex(t) {
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
    }

    function ez() {
        for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
        let [r, a, o] = n;
        return "string" == typeof r ? {
            message: r,
            code: "custom",
            input: a,
            inst: o
        } : {
            ...r
        }
    }

    function eU(t) {
        return Object.entries(t).filter(t => {
            let [n, i] = t;
            return Number.isNaN(Number.parseInt(n, 10))
        }).map(t => t[1])
    }

    function eN(t) {
        let n = atob(t),
            i = new Uint8Array(n.length);
        for (let t = 0; t < n.length; t++) i[t] = n.charCodeAt(t);
        return i
    }

    function eD(t) {
        let n = "";
        for (let i = 0; i < t.length; i++) n += String.fromCharCode(t[i]);
        return btoa(n)
    }

    function eO(t) {
        let n = t.replace(/-/g, "+").replace(/_/g, "/"),
            i = "=".repeat((4 - n.length % 4) % 4);
        return eN(n + i)
    }

    function eZ(t) {
        return eD(t).replace(/\+/g, "-").replace(/\//g, "_").replace(/=/g, "")
    }

    function eA(t) {
        let n = t.replace(/^0x/, "");
        if (n.length % 2 != 0) throw Error("Invalid hex string length");
        let i = new Uint8Array(n.length / 2);
        for (let t = 0; t < n.length; t += 2) i[t / 2] = Number.parseInt(n.slice(t, t + 2), 16);
        return i
    }

    function eP(t) {
        return Array.from(t).map(t => t.toString(16).padStart(2, "0")).join("")
    }
    class ej {
        constructor(...t) {}
    }

    function e$(t, n) {
        for (let i in n) {
            let r = Object.getOwnPropertyDescriptor(n, i);
            r.get ? Object.defineProperty(t, i, {
                ...r,
                enumerable: !1
            }) : function(t, n, i) {
                Object.defineProperty(t, n, {
                    configurable: !0,
                    get() {
                        return this == null ? i : eE(this, n, i.bind(this))
                    },
                    set(t) {
                        eE(this, n, t)
                    }
                })
            }(t, i, r.value)
        }
    }

    function eE(t, n, i) {
        let r = !(arguments.length > 3) || void 0 === arguments[3] || arguments[3];
        return Object.defineProperty(t, n, {
            configurable: !0,
            writable: !0,
            enumerable: r,
            value: i
        }), i
    }

    function eT(t, n, i) {
        return eE(t, n, i, !1)
    }

    function eL(t, n) {
        for (let i in t) {
            let r = t[i];
            Object.defineProperty(n, i, {
                configurable: !0,
                enumerable: !0,
                get() {
                    return eE(this, i, r(this))
                },
                set(t) {
                    eE(this, i, t)
                }
            })
        }
        return n
    }
    let eC = !1,
        eR = {
            configurable: !0,
            get() {
                eC = !0
            }
        };

    function eJ(t, i, r) {
        let a = Object.getPrototypeOf(t._zod);
        if (i in a && n !== t._zod) {
            n = void 0;
            return
        }
        n = t._zod, Object.defineProperty(a, i, {
            configurable: !0,
            get() {
                Object.defineProperty(this, i, eR);
                let t = eC;
                eC = !1;
                try {
                    let n = r(this);
                    return eC ? delete this[i] : Object.defineProperty(this, i, {
                        configurable: !0,
                        writable: !0,
                        value: n
                    }), eC = eC || t, n
                } catch (n) {
                    throw delete this[i], eC = eC || t, n
                }
            },
            set(t) {
                Object.defineProperty(this, i, {
                    configurable: !0,
                    writable: !0,
                    value: t
                })
            }
        })
    }

    function eM(t, n, i, r) {
        let a, o = n in (a = Object.getPrototypeOf(t)) ? void 0 : a;
        o && Object.defineProperty(o, n, {
            configurable: !0,
            get() {
                let t = {
                    configurable: !0,
                    writable: !0,
                    enumerable: r,
                    value: void 0
                };
                return Object.defineProperty(this, n, t), t.value = i(this), Object.defineProperty(this, n, t), t.value
            },
            set(t) {
                Object.defineProperty(this, n, {
                    configurable: !0,
                    writable: !0,
                    enumerable: r,
                    value: t
                })
            }
        })
    }
    let eV = "~constantCatch";

    function eF(t) {
        let n = () => t;
        return n[eV] = !0, n
    }
    var eB, eK, eW, eG = t.i(748089);
    let eX = /^[cC][0-9a-z]{6,}$/,
        eq = /^[0-9a-z]+$/,
        eH = /^[0-7][0-9A-HJKMNP-TV-Za-hjkmnp-tv-z]{25}$/,
        eY = /^[0-9a-vA-V]{20}$/,
        eQ = /^[A-Za-z0-9]{27}$/,
        e0 = /^[a-zA-Z0-9_-]{21}$/;

    function e4(t) {
        return new RegExp("^[a-zA-Z0-9_-]{".concat(t, "}$"))
    }
    let e6 = /^P(?:(\d+W)|(?!.*W)(?=\d|T\d)(\d+Y)?(\d+M)?(\d+D)?(T(?=\d)(\d+H)?(\d+M)?(\d+([.,]\d+)?S)?)?)$/,
        e1 = /^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})$/,
        e2 = t => t ? new RegExp("^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-".concat(t, "[0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12})$")) : /^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-8][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}|00000000-0000-0000-0000-000000000000|ffffffff-ffff-ffff-ffff-ffffffffffff)$/,
        e9 = e2(4),
        e3 = e2(6),
        e5 = e2(7),
        e7 = /^(?:[A-Za-z0-9_'+\-]+\.)*[A-Za-z0-9_'+\-]*[A-Za-z0-9_+-]@(?:[A-Za-z0-9][A-Za-z0-9\-]*\.)+[A-Za-z]{2,}$/,
        e8 = /^[^\s@"]{1,64}@[^\s@]{1,255}$/u;

    function te() {
        return RegExp("^(?=[\\s\\S]*[\\p{Extended_Pictographic}\\p{Regional_Indicator}\\u20E3])[\\p{Extended_Pictographic}\\p{Emoji_Component}]+$", "u")
    }
    let tt = /^(?:(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])$/,
        tn = /^(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))$/,
        ti = t => {
            let n = Y(null != t ? t : ":");
            return new RegExp("^(?:[0-9A-F]{2}".concat(n, "){5}[0-9A-F]{2}$|^(?:[0-9a-f]{2}").concat(n, "){5}[0-9a-f]{2}$"))
        },
        tr = /^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\/([0-9]|[1-2][0-9]|3[0-2])$/,
        ta = /^(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))\/(12[0-8]|1[01][0-9]|[1-9]?[0-9])$/,
        to = /^$|^(?:[0-9a-zA-Z+/]{4})*(?:(?:[0-9a-zA-Z+/]{2}==)|(?:[0-9a-zA-Z+/]{3}=))?$/,
        tc = /^(?:[A-Za-z0-9_-]{4})*(?:[A-Za-z0-9_-]{2,3})?$/,
        tu = /^(?=.{1,253}\.?$)[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[-0-9a-zA-Z]{0,61}[0-9a-zA-Z])?)*\.?$/,
        tl = /^(?=.{1,253}$)([a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,63}$/,
        ts = /^https?$/,
        td = /^\+[1-9]\d{6,14}$/,
        tm = /^\d(?:[ -]?\d){11,18}$/,
        tf = /^(?:AED|AFN|ALL|AMD|AOA|ARS|AUD|AWG|AZN|BAM|BBD|BDT|BHD|BIF|BMD|BND|BOB|BOV|BRL|BSD|BTN|BWP|BYN|BZD|CAD|CDF|CHE|CHF|CHW|CLF|CLP|CNY|COP|COU|CRC|CUP|CVE|CZK|DJF|DKK|DOP|DZD|EGP|ERN|ETB|EUR|FJD|FKP|GBP|GEL|GHS|GIP|GMD|GNF|GTQ|GYD|HKD|HNL|HTG|HUF|IDR|ILS|INR|IQD|IRR|ISK|JMD|JOD|JPY|KES|KGS|KHR|KMF|KPW|KRW|KWD|KYD|KZT|LAK|LBP|LKR|LRD|LSL|LYD|MAD|MDL|MGA|MKD|MMK|MNT|MOP|MRU|MUR|MVR|MWK|MXN|MXV|MYR|MZN|NAD|NGN|NIO|NOK|NPR|NZD|OMR|PAB|PEN|PGK|PHP|PKR|PLN|PYG|QAR|RON|RSD|RUB|RWF|SAR|SBD|SCR|SDG|SEK|SGD|SHP|SLE|SOS|SRD|SSP|STN|SVC|SYP|SZL|THB|TJS|TMT|TND|TOP|TRY|TTD|TWD|TZS|UAH|UGX|USD|USN|UYI|UYU|UYW|UZS|VED|VES|VND|VUV|WST|XAD|XAF|XAG|XAU|XBA|XBB|XBC|XBD|XCD|XCG|XDR|XOF|XPD|XPF|XPT|XSU|XTS|XUA|XXX|YER|ZAR|ZMW|ZWG)$/,
        tv = /^[A-Z]{2}(?!00|01|99)\d{2}[A-Z0-9]{11,30}$/,
        tp = "(?:(?:\\d\\d[2468][048]|\\d\\d[13579][26]|\\d\\d0[48]|[02468][048]00|[13579][26]00)-02-29|\\d{4}-(?:(?:0[13578]|1[02])-(?:0[1-9]|[12]\\d|3[01])|(?:0[469]|11)-(?:0[1-9]|[12]\\d|30)|(?:02)-(?:0[1-9]|1\\d|2[0-8])))",
        tg = new RegExp("^".concat(tp, "$"));

    function th(t) {
        let n = "(?:[01]\\d|2[0-3]):[0-5]\\d";
        return "number" == typeof t.precision ? -1 === t.precision ? "".concat(n) : 0 === t.precision ? "".concat(n, ":[0-5]\\d") : "".concat(n, ":[0-5]\\d\\.\\d{").concat(t.precision, "}") : t.seconds ? "".concat(n, ":[0-5]\\d(?:\\.\\d+)?") : "".concat(n, "(?::[0-5]\\d(?:\\.\\d+)?)?")
    }

    function ty(t) {
        return new RegExp("^".concat(th(t), "$"))
    }

    function t_(t) {
        let n = ["Z"];
        t.offset && n.push("([+-](?:[01]\\d|2[0-3]):[0-5]\\d)");
        let i = "".concat(th({
                precision: t.precision,
                seconds: !0
            }), "(?:").concat(n.join("|"), ")"),
            r = t.local ? "".concat(i, "|").concat(th({
                precision: t.precision
            })) : i;
        return new RegExp("^".concat(tp, "T(?:").concat(r, ")$"))
    }
    let tb = /^[\s\S]{0,}$/,
        tk = t => {
            var n, i;
            let r = t ? "[\\s\\S]{".concat(null != (n = null == t ? void 0 : t.minimum) ? n : 0, ",").concat(null != (i = null == t ? void 0 : t.maximum) ? i : "", "}") : "[\\s\\S]*";
            return new RegExp("^".concat(r, "$"))
        },
        tI = /^-?\d+n?$/,
        tw = /^-?\d+$/,
        tS = /^-?\d+(?:\.\d+)?$/,
        tx = /^(?:true|false)$/i,
        tz = /^null$/i,
        tU = /^undefined$/i,
        tN = /^[^A-Z]*$/,
        tD = /^[^a-z]*$/,
        tO = /^[0-9a-fA-F]*$/;

    function tZ(t, n) {
        return new RegExp("^[A-Za-z0-9+/]{".concat(t, "}").concat(n, "$"))
    }

    function tA(t) {
        return new RegExp("^[A-Za-z0-9_-]{".concat(t, "}$"))
    }
    let tP = tZ(22, "=="),
        tj = tA(22),
        t$ = tZ(27, "="),
        tE = tA(27),
        tT = tZ(43, "="),
        tL = tA(43),
        tC = tZ(64, ""),
        tR = tA(64),
        tJ = tZ(86, "=="),
        tM = tA(86);
    t.s(["anyString", 0, tb, "base64", 0, to, "base64url", 0, tc, "bigint", 0, tI, "boolean", 0, tx, "browserEmail", 0, /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/, "cidrv4", 0, tr, "cidrv6", 0, ta, "creditCard", 0, tm, "cuid", 0, eX, "cuid2", 0, eq, "currencyCode", 0, tf, "date", 0, tg, "datetime", 0, t_, "domain", 0, tl, "duration", 0, e6, "e164", 0, td, "email", 0, e7, "emoji", 0, te, "extendedDuration", 0, /^[-+]?P(?!$)(?:(?:[-+]?\d+Y)|(?:[-+]?\d+[.,]\d+Y$))?(?:(?:[-+]?\d+M)|(?:[-+]?\d+[.,]\d+M$))?(?:(?:[-+]?\d+W)|(?:[-+]?\d+[.,]\d+W$))?(?:(?:[-+]?\d+D)|(?:[-+]?\d+[.,]\d+D$))?(?:T(?=[\d+-])(?:(?:[-+]?\d+H)|(?:[-+]?\d+[.,]\d+H$))?(?:(?:[-+]?\d+M)|(?:[-+]?\d+[.,]\d+M$))?(?:[-+]?\d+(?:[.,]\d+)?S)?)??$/, "guid", 0, e1, "hex", 0, tO, "hostname", 0, tu, "html5Email", 0, /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/, "httpProtocol", 0, ts, "iban", 0, tv, "idnEmail", 0, e8, "integer", 0, tw, "ipv4", 0, tt, "ipv6", 0, tn, "ksuid", 0, eQ, "lowercase", 0, tN, "mac", 0, ti, "md5_base64", 0, tP, "md5_base64url", 0, tj, "md5_hex", 0, /^[0-9a-fA-F]{32}$/, "nanoid", 0, e0, "nanoidOfLength", 0, e4, "null", 0, tz, "number", 0, tS, "rfc5322Email", 0, /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/, "sha1_base64", 0, t$, "sha1_base64url", 0, tE, "sha1_hex", 0, /^[0-9a-fA-F]{40}$/, "sha256_base64", 0, tT, "sha256_base64url", 0, tL, "sha256_hex", 0, /^[0-9a-fA-F]{64}$/, "sha384_base64", 0, tC, "sha384_base64url", 0, tR, "sha384_hex", 0, /^[0-9a-fA-F]{96}$/, "sha512_base64", 0, tJ, "sha512_base64url", 0, tM, "sha512_hex", 0, /^[0-9a-fA-F]{128}$/, "string", 0, tk, "time", 0, ty, "ulid", 0, eH, "undefined", 0, tU, "unicodeEmail", 0, e8, "uppercase", 0, tD, "uuid", 0, e2, "uuid4", 0, e9, "uuid6", 0, e3, "uuid7", 0, e5, "xid", 0, eY], 559416);
    var tV = t.i(559416);

    function tF(t, n, i, r) {
        let a = Math.abs(t),
            o = a % 10,
            c = a % 100;
        return c >= 11 && c <= 19 ? r : 1 === o ? n : o >= 2 && o <= 4 ? i : r
    }

    function tB() {
        return {
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
                };

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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

                function a(t, n) {
                    var i;
                    return "number" !== t || "number" != typeof n || Number.isFinite(n) ? null != (i = r[t]) ? i : t : String(n)
                }
                return t => {
                    var r, o, c, u;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = a(t.expected),
                                i = a(ex(t.input), t.input);
                            return "Invalid input: expected ".concat(n, ", received ").concat(i)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Invalid input: expected ".concat(en(t.values[0]));
                            return "Invalid option: expected one of ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.exact ? "exactly " : t.inclusive ? "<=" : "<",
                                a = n(t.origin);
                            if (a) return "Too big: expected ".concat(null != (r = t.origin) ? r : "value", " to have ").concat(i).concat(t.maximum.toString(), " ").concat(null != (o = a.unit) ? o : "elements");
                            return "Too big: expected ".concat(null != (c = t.origin) ? c : "value", " to be ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.exact ? "exactly " : t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Too small: expected ".concat(t.origin, " to have ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "Too small: expected ".concat(t.origin, " to be ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Invalid string: must start with "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Invalid string: must end with "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Invalid string: must include "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Invalid string: must match pattern ".concat(t.pattern);
                            return "Invalid ".concat(null != (u = i[t.format]) ? u : t.format);
                        case "not_multiple_of":
                            return "Invalid number: must be a multiple of ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Unrecognized key".concat(t.keys.length > 1 ? "s" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Invalid key in ".concat(t.origin);
                        case "invalid_union":
                            if (t.options && Array.isArray(t.options) && t.options.length > 0) {
                                let n = t.options.map(t => "'".concat(t, "'")).join(" | ");
                                return "Invalid discriminator value. Expected ".concat(n)
                            }
                            if (!1 === t.inclusive) return "Invalid input: more than one option matched";
                            return "Invalid input";
                        case "invalid_element":
                            return "Invalid value in ".concat(t.origin);
                        default:
                            return "Invalid input"
                    }
                }
            })()
        }
    }

    function tK(t, n, i) {
        return 1 === Math.abs(t) ? n : i
    }

    function tW(t) {
        if (!t) return "";
        let n = t[t.length - 1];
        return t + (["ա", "ե", "ը", "ի", "ո", "ու", "օ"].includes(n) ? "ն" : "ը")
    }

    function tG() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "ទិន្នន័យបញ្ចូលមិនត្រឹមត្រូវ៖ ត្រូវការ instanceof ".concat(t.expected, " ប៉ុន្តែទទួលបាន ").concat(c);
                            return "ទិន្នន័យបញ្ចូលមិនត្រឹមត្រូវ៖ ត្រូវការ ".concat(n, " ប៉ុន្តែទទួលបាន ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "ទិន្នន័យបញ្ចូលមិនត្រឹមត្រូវ៖ ត្រូវការ ".concat(en(t.values[0]));
                            return "ជម្រើសមិនត្រឹមត្រូវ៖ ត្រូវជាមួយក្នុងចំណោម ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "ធំពេក៖ ត្រូវការ ".concat(null != (c = t.origin) ? c : "តម្លៃ", " ").concat(i, " ").concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "ធាតុ");
                            return "ធំពេក៖ ត្រូវការ ".concat(null != (l = t.origin) ? l : "តម្លៃ", " ").concat(i, " ").concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "តូចពេក៖ ត្រូវការ ".concat(t.origin, " ").concat(i, " ").concat(t.minimum.toString(), " ").concat(r.unit);
                            return "តូចពេក៖ ត្រូវការ ".concat(t.origin, " ").concat(i, " ").concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'ខ្សែអក្សរមិនត្រឹមត្រូវ៖ ត្រូវចាប់ផ្តើមដោយ "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'ខ្សែអក្សរមិនត្រឹមត្រូវ៖ ត្រូវបញ្ចប់ដោយ "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'ខ្សែអក្សរមិនត្រឹមត្រូវ៖ ត្រូវមាន "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "ខ្សែអក្សរមិនត្រឹមត្រូវ៖ ត្រូវតែផ្គូផ្គងនឹងទម្រង់ដែលបានកំណត់ ".concat(t.pattern);
                            return "មិនត្រឹមត្រូវ៖ ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "លេខមិនត្រឹមត្រូវ៖ ត្រូវតែជាពហុគុណនៃ ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "រកឃើញសោមិនស្គាល់៖ ".concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "សោមិនត្រឹមត្រូវនៅក្នុង ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "ទិន្នន័យមិនត្រឹមត្រូវ";
                        case "invalid_element":
                            return "ទិន្នន័យមិនត្រឹមត្រូវនៅក្នុង ".concat(t.origin)
                    }
                }
            })()
        }
    }
    t.s([], 372093), t.i(372093);
    let tX = t => t.charAt(0).toUpperCase() + t.slice(1);

    function tq(t) {
        let n = Math.abs(t),
            i = n % 10,
            r = n % 100;
        return r >= 11 && r <= 19 || 0 === i ? "many" : 1 === i ? "one" : "few"
    }

    function tH(t, n, i, r) {
        let a = Math.abs(t),
            o = a % 10,
            c = a % 100;
        return c >= 11 && c <= 19 ? r : 1 === o ? n : o >= 2 && o <= 4 ? i : r
    }

    function tY() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Неправильні вхідні дані: очікується instanceof ".concat(t.expected, ", отримано ").concat(c);
                            return "Неправильні вхідні дані: очікується ".concat(n, ", отримано ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Неправильні вхідні дані: очікується ".concat(en(t.values[0]));
                            return "Неправильна опція: очікується одне з ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Занадто велике: очікується, що ".concat(null != (c = t.origin) ? c : "значення", " ").concat(r.verb, " ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "елементів");
                            return "Занадто велике: очікується, що ".concat(null != (l = t.origin) ? l : "значення", " буде ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Занадто мале: очікується, що ".concat(t.origin, " ").concat(r.verb, " ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "Занадто мале: очікується, що ".concat(t.origin, " буде ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Неправильний рядок: повинен починатися з "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Неправильний рядок: повинен закінчуватися на "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Неправильний рядок: повинен містити "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Неправильний рядок: повинен відповідати шаблону ".concat(t.pattern);
                            return "Неправильний ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Неправильне число: повинно бути кратним ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Нерозпізнаний ключ".concat(t.keys.length > 1 ? "і" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Неправильний ключ у ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Неправильні вхідні дані";
                        case "invalid_element":
                            return "Неправильне значення у ".concat(t.origin)
                    }
                }
            })()
        }
    }
    t.s(["ar", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "مدخلات غير مقبولة: يفترض إدخال instanceof ".concat(t.expected, "، ولكن تم إدخال ").concat(c);
                            return "مدخلات غير مقبولة: يفترض إدخال ".concat(n, "، ولكن تم إدخال ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "مدخلات غير مقبولة: يفترض إدخال ".concat(en(t.values[0]));
                            return "اختيار غير مقبول: يتوقع انتقاء أحد هذه الخيارات: ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return " أكبر من اللازم: يفترض أن تكون ".concat(null != (c = t.origin) ? c : "القيمة", " ").concat(i, " ").concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "عنصر");
                            return "أكبر من اللازم: يفترض أن تكون ".concat(null != (l = t.origin) ? l : "القيمة", " ").concat(i, " ").concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "أصغر من اللازم: يفترض لـ ".concat(t.origin, " أن يكون ").concat(i, " ").concat(t.minimum.toString(), " ").concat(r.unit);
                            return "أصغر من اللازم: يفترض لـ ".concat(t.origin, " أن يكون ").concat(i, " ").concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'نَص غير مقبول: يجب أن يبدأ بـ "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'نَص غير مقبول: يجب أن ينتهي بـ "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'نَص غير مقبول: يجب أن يتضمَّن "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "نَص غير مقبول: يجب أن يطابق النمط ".concat(t.pattern);
                            return "".concat(null != (s = i[t.format]) ? s : t.format, " غير مقبول");
                        case "not_multiple_of":
                            return "رقم غير مقبول: يجب أن يكون من مضاعفات ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "معرف".concat(t.keys.length > 1 ? "ات" : "", " غريب").concat(t.keys.length > 1 ? "ة" : "", ": ").concat(b(t.keys, "، "));
                        case "invalid_key":
                            return "معرف غير مقبول في ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "مدخل غير مقبول";
                        case "invalid_element":
                            return "مدخل غير مقبول في ".concat(t.origin)
                    }
                }
            })()
        }
    }, "az", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Yanlış dəyər: gözlənilən instanceof ".concat(t.expected, ", daxil olan ").concat(c);
                            return "Yanlış dəyər: gözlənilən ".concat(n, ", daxil olan ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Yanlış dəyər: gözlənilən ".concat(en(t.values[0]));
                            return "Yanlış seçim: aşağıdakılardan biri olmalıdır: ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Çox böyük: gözlənilən ".concat(null != (c = t.origin) ? c : "dəyər", " ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "element");
                            return "Çox böyük: gözlənilən ".concat(null != (l = t.origin) ? l : "dəyər", " ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Çox kiçik: gözlənilən ".concat(t.origin, " ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "Çox kiçik: gözlənilən ".concat(t.origin, " ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Yanlış mətn: "'.concat(t.prefix, '" ilə başlamalıdır');
                            if ("ends_with" === t.format) return 'Yanlış mətn: "'.concat(t.suffix, '" ilə bitməlidir');
                            if ("includes" === t.format) return 'Yanlış mətn: "'.concat(t.includes, '" daxil olmalıdır');
                            if ("regex" === t.format) return "Yanlış mətn: ".concat(t.pattern, " şablonuna uyğun olmalıdır");
                            return "Yanlış ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Yanlış ədəd: ".concat(t.divisor, " ilə bölünə bilən olmalıdır");
                        case "unrecognized_keys":
                            return "Tanınmayan açar".concat(t.keys.length > 1 ? "lar" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "".concat(t.origin, " daxilində yanlış açar");
                        case "invalid_union":
                        default:
                            return "Yanlış dəyər";
                        case "invalid_element":
                            return "".concat(t.origin, " daxilində yanlış dəyər")
                    }
                }
            })()
        }
    }, "be", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Няправільны ўвод: чакаўся instanceof ".concat(t.expected, ", атрымана ").concat(c);
                            return "Няправільны ўвод: чакаўся ".concat(n, ", атрымана ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Няправільны ўвод: чакалася ".concat(en(t.values[0]));
                            return "Няправільны варыянт: чакаўся адзін з ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) {
                                let n = tF(Number(t.maximum), r.unit.one, r.unit.few, r.unit.many);
                                return "Занадта вялікі: чакалася, што ".concat(null != (u = t.origin) ? u : "значэнне", " павінна ").concat(r.verb, " ").concat(i).concat(t.maximum.toString(), " ").concat(n)
                            }
                            return "Занадта вялікі: чакалася, што ".concat(null != (c = t.origin) ? c : "значэнне", " павінна быць ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) {
                                let n = tF(Number(t.minimum), r.unit.one, r.unit.few, r.unit.many);
                                return "Занадта малы: чакалася, што ".concat(t.origin, " павінна ").concat(r.verb, " ").concat(i).concat(t.minimum.toString(), " ").concat(n)
                            }
                            return "Занадта малы: чакалася, што ".concat(t.origin, " павінна быць ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Няправільны радок: павінен пачынацца з "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Няправільны радок: павінен заканчвацца на "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Няправільны радок: павінен змяшчаць "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Няправільны радок: павінен адпавядаць шаблону ".concat(t.pattern);
                            return "Няправільны ".concat(null != (l = i[t.format]) ? l : t.format);
                        case "not_multiple_of":
                            return "Няправільны лік: павінен быць кратным ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Нераспазнаны ".concat(t.keys.length > 1 ? "ключы" : "ключ", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Няправільны ключ у ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Няправільны ўвод";
                        case "invalid_element":
                            return "Няправільнае значэнне ў ".concat(t.origin)
                    }
                }
            })()
        }
    }, "bg", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Невалиден вход: очакван instanceof ".concat(t.expected, ", получен ").concat(c);
                            return "Невалиден вход: очакван ".concat(n, ", получен ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Невалиден вход: очакван ".concat(en(t.values[0]));
                            return "Невалидна опция: очаквано едно от ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Твърде голямо: очаква се ".concat(null != (c = t.origin) ? c : "стойност", " да съдържа ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "елемента");
                            return "Твърде голямо: очаква се ".concat(null != (l = t.origin) ? l : "стойност", " да бъде ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Твърде малко: очаква се ".concat(t.origin, " да съдържа ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "Твърде малко: очаква се ".concat(t.origin, " да бъде ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format": {
                            if ("starts_with" === t.format) return 'Невалиден низ: трябва да започва с "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Невалиден низ: трябва да завършва с "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Невалиден низ: трябва да включва "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Невалиден низ: трябва да съвпада с ".concat(t.pattern);
                            let n = "Невалиден";
                            return "emoji" === t.format && (n = "Невалидно"), "datetime" === t.format && (n = "Невалидно"), "date" === t.format && (n = "Невалидна"), "time" === t.format && (n = "Невалидно"), "duration" === t.format && (n = "Невалидна"), "".concat(n, " ").concat(null != (s = i[t.format]) ? s : t.format)
                        }
                        case "not_multiple_of":
                            return "Невалидно число: трябва да бъде кратно на ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Неразпознат".concat(t.keys.length > 1 ? "и" : "", " ключ").concat(t.keys.length > 1 ? "ове" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Невалиден ключ в ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Невалиден вход";
                        case "invalid_element":
                            return "Невалидна стойност в ".concat(t.origin)
                    }
                }
            })()
        }
    }, "bn", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            return "অবৈধ ইনপুট: প্রত্যাশিত ".concat(n, ", প্রাপ্ত ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "অবৈধ ইনপুট: প্রত্যাশিত ".concat(en(t.values[0]));
                            return "অবৈধ অপশন: ".concat(b(t.values, " | "), " এর মধ্যে একটি প্রত্যাশিত");
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "অনেক বড়: ".concat(null != (c = t.origin) ? c : "মান", " ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "এলিমেন্ট", " হতে হবে");
                            return "অনেক বড়: ".concat(null != (l = t.origin) ? l : "মান", " ").concat(i).concat(t.maximum.toString(), " হতে হবে")
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "অনেক ছোট: ".concat(t.origin, " ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit, " হতে হবে");
                            return "অনেক ছোট: ".concat(t.origin, " ").concat(i).concat(t.minimum.toString(), " হতে হবে")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'অবৈধ স্ট্রিং: "'.concat(t.prefix, '" দিয়ে শুরু হতে হবে');
                            if ("ends_with" === t.format) return 'অবৈধ স্ট্রিং: "'.concat(t.suffix, '" দিয়ে শেষ হতে হবে');
                            if ("includes" === t.format) return 'অবৈধ স্ট্রিং: "'.concat(t.includes, '" অন্তর্ভুক্ত থাকতে হবে');
                            if ("regex" === t.format) return "অবৈধ স্ট্রিং: ".concat(t.pattern, " প্যাটার্ন মিলতে হবে");
                            return "অবৈধ ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "অবৈধ নম্বর: ".concat(t.divisor, " এর গুণিতক হতে হবে");
                        case "unrecognized_keys":
                            return "অচেনা কী".concat(t.keys.length > 1 ? "গুলো" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "".concat(t.origin, " এ অবৈধ কী");
                        case "invalid_union":
                            if (t.options && Array.isArray(t.options) && t.options.length > 0) {
                                let n = t.options.map(t => "'".concat(t, "'")).join(" | ");
                                return "অবৈধ ডিসক্রিমিনেটর মান। প্রত্যাশিত ".concat(n)
                            }
                            return "অবৈধ ইনপুট";
                        case "invalid_element":
                            return "".concat(t.origin, " এ অবৈধ মান");
                        default:
                            return "অবৈধ ইনপুট"
                    }
                }
            })()
        }
    }, "ca", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Tipus invàlid: s'esperava instanceof ".concat(t.expected, ", s'ha rebut ").concat(c);
                            return "Tipus invàlid: s'esperava ".concat(n, ", s'ha rebut ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Valor invàlid: s'esperava ".concat(en(t.values[0]));
                            return "Opció invàlida: s'esperava una de ".concat(b(t.values, " o "));
                        case "too_big": {
                            let i = t.inclusive ? "com a màxim" : "menys de",
                                r = n(t.origin);
                            if (r) return "Massa gran: s'esperava que ".concat(null != (c = t.origin) ? c : "el valor", " contingués ").concat(i, " ").concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "elements");
                            return "Massa gran: s'esperava que ".concat(null != (l = t.origin) ? l : "el valor", " fos ").concat(i, " ").concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? "com a mínim" : "més de",
                                r = n(t.origin);
                            if (r) return "Massa petit: s'esperava que ".concat(t.origin, " contingués ").concat(i, " ").concat(t.minimum.toString(), " ").concat(r.unit);
                            return "Massa petit: s'esperava que ".concat(t.origin, " fos ").concat(i, " ").concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Format invàlid: ha de començar amb "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return "Format invàlid: ha d'acabar amb \"".concat(t.suffix, '"');
                            if ("includes" === t.format) return "Format invàlid: ha d'incloure \"".concat(t.includes, '"');
                            if ("regex" === t.format) return "Format invàlid: ha de coincidir amb el patró ".concat(t.pattern);
                            return "Format invàlid per a ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Número invàlid: ha de ser múltiple de ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Clau".concat(t.keys.length > 1 ? "s" : "", " no reconeguda").concat(t.keys.length > 1 ? "s" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Clau invàlida a ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Entrada invàlida";
                        case "invalid_element":
                            return "Element invàlid a ".concat(t.origin)
                    }
                }
            })()
        }
    }, "ckb", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i,
                                u = ["ا", "و", "ۆ", "وو", "ە", "ی", "ێ"].some(t => c.endsWith(t)) ? "یە" : "ە",
                                l = /^[a-zA-Z]+$/.test(c);
                            if ("null" === i || "undefined" === i) return "داواکراوە";
                            return "چاوەڕوانکراوە ".concat(n, " بێت، بەڵام ").concat(c).concat(l ? "" : u)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "بەهاکە نادرووستە: چاوەڕوانکراوە ".concat(en(t.values[0]), " بێت");
                            return "هەڵبژاردەی نادروست: چاوەڕوانکراوە یەکێک بێت لە ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = n(t.origin);
                            if (i) return "پێویستە بە لایەنی زۆرەوە ".concat(t.maximum.toString(), " ").concat(i.unit, " ").concat(i.verb);
                            return "پێویستە بە لایەنی زۆرەوە ".concat(t.maximum.toString(), " بێت")
                        }
                        case "too_small": {
                            let i = n(t.origin);
                            if (i) return "پێویستە بە لایەنی کەمەوە ".concat(t.minimum.toString(), " ").concat(i.unit, " ").concat(i.verb);
                            return "پێویستە بە لایەنی کەمەوە ".concat(t.minimum.toString(), " بێت")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'دەقی نادروست: پێویستە دەستپێبکات بە "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'دەقی نادروست: پێویستە کۆتاییبێت بە "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'دەقی نادروست: پێویستە "'.concat(t.includes, '" لەخۆبگرێت');
                            if ("regex" === t.format) return "دەقی نادروست: پێویستە لەگەڵ پاتێرنی ".concat(t.pattern, " بگونجێت");
                            return "بەهای ".concat(null != (c = i[t.format]) ? c : t.format, " نادروستە");
                        case "not_multiple_of":
                            return "ژمارەی نادروست: دەبێت چەند هێندە بێت بۆ ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "کلیلی نەناسراو: ".concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "کلیلی نادروست لە ".concat(t.origin);
                        case "invalid_union":
                            if (t.options && Array.isArray(t.options) && t.options.length > 0) {
                                let n = t.options.map(t => "'".concat(t, "'")).join(" | ");
                                return "بەهای نەناسراو هەیە. بەهای چاوەڕوانکراو: ".concat(n)
                            }
                            return "یەکگرتنی نادروست";
                        case "invalid_element":
                            return "".concat(t.origin, " بەهاکە نادروستە");
                        default:
                            return "تێکردەی نادروست"
                    }
                }
            })()
        }
    }, "cs", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s, d, m, f;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Neplatný vstup: očekáváno instanceof ".concat(t.expected, ", obdrženo ").concat(c);
                            return "Neplatný vstup: očekáváno ".concat(n, ", obdrženo ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Neplatný vstup: očekáváno ".concat(en(t.values[0]));
                            return "Neplatná možnost: očekávána jedna z hodnot ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Hodnota je příliš velká: ".concat(null != (u = t.origin) ? u : "hodnota", " musí mít ").concat(i).concat(t.maximum.toString(), " ").concat(null != (l = r.unit) ? l : "prvků");
                            return "Hodnota je příliš velká: ".concat(null != (c = t.origin) ? c : "hodnota", " musí být ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Hodnota je příliš malá: ".concat(null != (d = t.origin) ? d : "hodnota", " musí mít ").concat(i).concat(t.minimum.toString(), " ").concat(null != (m = r.unit) ? m : "prvků");
                            return "Hodnota je příliš malá: ".concat(null != (s = t.origin) ? s : "hodnota", " musí být ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Neplatný řetězec: musí začínat na "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Neplatný řetězec: musí končit na "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Neplatný řetězec: musí obsahovat "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Neplatný řetězec: musí odpovídat vzoru ".concat(t.pattern);
                            return "Neplatný formát ".concat(null != (f = i[t.format]) ? f : t.format);
                        case "not_multiple_of":
                            return "Neplatné číslo: musí být násobkem ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Neznámé klíče: ".concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Neplatný klíč v ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Neplatný vstup";
                        case "invalid_element":
                            return "Neplatná hodnota v ".concat(t.origin)
                    }
                }
            })()
        }
    }, "da", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Ugyldigt input: forventede instanceof ".concat(t.expected, ", fik ").concat(c);
                            return "Ugyldigt input: forventede ".concat(n, ", fik ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Ugyldig værdi: forventede ".concat(en(t.values[0]));
                            return "Ugyldigt valg: forventede en af følgende ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                a = n(t.origin),
                                o = null != (c = r[t.origin]) ? c : t.origin;
                            if (a) return "For stor: forventede ".concat(null != o ? o : "value", " ").concat(a.verb, " ").concat(i, " ").concat(t.maximum.toString(), " ").concat(null != (u = a.unit) ? u : "elementer");
                            return "For stor: forventede ".concat(null != o ? o : "value", " havde ").concat(i, " ").concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                a = n(t.origin),
                                o = null != (l = r[t.origin]) ? l : t.origin;
                            if (a) return "For lille: forventede ".concat(o, " ").concat(a.verb, " ").concat(i, " ").concat(t.minimum.toString(), " ").concat(a.unit);
                            return "For lille: forventede ".concat(o, " havde ").concat(i, " ").concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Ugyldig streng: skal starte med "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Ugyldig streng: skal ende med "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Ugyldig streng: skal indeholde "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Ugyldig streng: skal matche mønsteret ".concat(t.pattern);
                            return "Ugyldig ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Ugyldigt tal: skal være deleligt med ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "".concat(t.keys.length > 1 ? "Ukendte nøgler" : "Ukendt nøgle", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Ugyldig nøgle i ".concat(t.origin);
                        case "invalid_union":
                            return "Ugyldigt input: matcher ingen af de tilladte typer";
                        case "invalid_element":
                            return "Ugyldig værdi i ".concat(t.origin);
                        default:
                            return "Ugyldigt input"
                    }
                }
            })()
        }
    }, "de", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Ungültige Eingabe: erwartet instanceof ".concat(t.expected, ", erhalten ").concat(c);
                            return "Ungültige Eingabe: erwartet ".concat(n, ", erhalten ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Ungültige Eingabe: erwartet ".concat(en(t.values[0]));
                            return "Ungültige Option: erwartet eine von ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Zu groß: erwartet, dass ".concat(null != (c = t.origin) ? c : "Wert", " ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "Elemente", " hat");
                            return "Zu groß: erwartet, dass ".concat(null != (l = t.origin) ? l : "Wert", " ").concat(i).concat(t.maximum.toString(), " ist")
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Zu klein: erwartet, dass ".concat(t.origin, " ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit, " hat");
                            return "Zu klein: erwartet, dass ".concat(t.origin, " ").concat(i).concat(t.minimum.toString(), " ist")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Ungültiger String: muss mit "'.concat(t.prefix, '" beginnen');
                            if ("ends_with" === t.format) return 'Ungültiger String: muss mit "'.concat(t.suffix, '" enden');
                            if ("includes" === t.format) return 'Ungültiger String: muss "'.concat(t.includes, '" enthalten');
                            if ("regex" === t.format) return "Ungültiger String: muss dem Muster ".concat(t.pattern, " entsprechen");
                            return "Ungültig: ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Ungültige Zahl: muss ein Vielfaches von ".concat(t.divisor, " sein");
                        case "unrecognized_keys":
                            return "".concat(t.keys.length > 1 ? "Unbekannte Schlüssel" : "Unbekannter Schlüssel", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Ungültiger Schlüssel in ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Ungültige Eingabe";
                        case "invalid_element":
                            return "Ungültiger Wert in ".concat(t.origin)
                    }
                }
            })()
        }
    }, "el", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if ("string" == typeof t.expected && /^[A-Z]/.test(t.expected)) return "Μη έγκυρη είσοδος: αναμενόταν instanceof ".concat(t.expected, ", λήφθηκε ").concat(c);
                            return "Μη έγκυρη είσοδος: αναμενόταν ".concat(n, ", λήφθηκε ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Μη έγκυρη είσοδος: αναμενόταν ".concat(en(t.values[0]));
                            return "Μη έγκυρη επιλογή: αναμενόταν ένα από ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Πολύ μεγάλο: αναμενόταν ".concat(null != (c = t.origin) ? c : "τιμή", " να έχει ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "στοιχεία");
                            return "Πολύ μεγάλο: αναμενόταν ".concat(null != (l = t.origin) ? l : "τιμή", " να είναι ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Πολύ μικρό: αναμενόταν ".concat(t.origin, " να έχει ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "Πολύ μικρό: αναμενόταν ".concat(t.origin, " να είναι ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Μη έγκυρη συμβολοσειρά: πρέπει να ξεκινά με "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Μη έγκυρη συμβολοσειρά: πρέπει να τελειώνει με "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Μη έγκυρη συμβολοσειρά: πρέπει να περιέχει "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Μη έγκυρη συμβολοσειρά: πρέπει να ταιριάζει με το μοτίβο ".concat(t.pattern);
                            return "Μη έγκυρο: ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Μη έγκυρος αριθμός: πρέπει να είναι πολλαπλάσιο του ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Άγνωστ".concat(t.keys.length > 1 ? "α" : "ο", " κλειδ").concat(t.keys.length > 1 ? "ιά" : "ί", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Μη έγκυρο κλειδί στο ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Μη έγκυρη είσοδος";
                        case "invalid_element":
                            return "Μη έγκυρη τιμή στο ".concat(t.origin)
                    }
                }
            })()
        }
    }, "en", 0, tB, "eo", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Nevalida enigo: atendiĝis instanceof ".concat(t.expected, ", riceviĝis ").concat(c);
                            return "Nevalida enigo: atendiĝis ".concat(n, ", riceviĝis ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Nevalida enigo: atendiĝis ".concat(en(t.values[0]));
                            return "Nevalida opcio: atendiĝis unu el ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Tro granda: atendiĝis ke ".concat(null != (c = t.origin) ? c : "valoro", " havu ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "elementojn");
                            return "Tro granda: atendiĝis ke ".concat(null != (l = t.origin) ? l : "valoro", " havu ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Tro malgranda: atendiĝis ke ".concat(t.origin, " havu ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "Tro malgranda: atendiĝis ke ".concat(t.origin, " estu ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Nevalida karaktraro: devas komenciĝi per "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Nevalida karaktraro: devas finiĝi per "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Nevalida karaktraro: devas inkluzivi "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Nevalida karaktraro: devas kongrui kun la modelo ".concat(t.pattern);
                            return "Nevalida ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Nevalida nombro: devas esti oblo de ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Nekonata".concat(t.keys.length > 1 ? "j" : "", " ŝlosilo").concat(t.keys.length > 1 ? "j" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Nevalida ŝlosilo en ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Nevalida enigo";
                        case "invalid_element":
                            return "Nevalida valoro en ".concat(t.origin)
                    }
                }
            })()
        }
    }, "es", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s, d, m;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Entrada inválida: se esperaba instanceof ".concat(t.expected, ", recibido ").concat(c);
                            return "Entrada inválida: se esperaba ".concat(n, ", recibido ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Entrada inválida: se esperaba ".concat(en(t.values[0]));
                            return "Opción inválida: se esperaba una de ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                a = n(t.origin),
                                o = null != (c = r[t.origin]) ? c : t.origin;
                            if (a) return "Demasiado grande: se esperaba que ".concat(null != o ? o : "valor", " tuviera ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = a.unit) ? u : "elementos");
                            return "Demasiado grande: se esperaba que ".concat(null != o ? o : "valor", " fuera ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                a = n(t.origin),
                                o = null != (l = r[t.origin]) ? l : t.origin;
                            if (a) return "Demasiado pequeño: se esperaba que ".concat(o, " tuviera ").concat(i).concat(t.minimum.toString(), " ").concat(a.unit);
                            return "Demasiado pequeño: se esperaba que ".concat(o, " fuera ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Cadena inválida: debe comenzar con "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Cadena inválida: debe terminar en "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Cadena inválida: debe incluir "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Cadena inválida: debe coincidir con el patrón ".concat(t.pattern);
                            return "Inválido ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Número inválido: debe ser múltiplo de ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Llave".concat(t.keys.length > 1 ? "s" : "", " desconocida").concat(t.keys.length > 1 ? "s" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Llave inválida en ".concat(null != (d = r[t.origin]) ? d : t.origin);
                        case "invalid_union":
                        default:
                            return "Entrada inválida";
                        case "invalid_element":
                            return "Valor inválido en ".concat(null != (m = r[t.origin]) ? m : t.origin)
                    }
                }
            })()
        }
    }, "fa", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "ورودی نامعتبر: می‌بایست instanceof ".concat(t.expected, " می‌بود، ").concat(c, " دریافت شد");
                            return "ورودی نامعتبر: می‌بایست ".concat(n, " می‌بود، ").concat(c, " دریافت شد")
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "ورودی نامعتبر: می‌بایست ".concat(en(t.values[0]), " می‌بود");
                            return "گزینه نامعتبر: می‌بایست یکی از ".concat(b(t.values, "|"), " می‌بود");
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "خیلی بزرگ: ".concat(null != (u = t.origin) ? u : "مقدار", " باید ").concat(i).concat(t.maximum.toString(), " ").concat(null != (l = r.unit) ? l : "عنصر", " باشد");
                            return "خیلی بزرگ: ".concat(null != (c = t.origin) ? c : "مقدار", " باید ").concat(i).concat(t.maximum.toString(), " باشد")
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "خیلی کوچک: ".concat(t.origin, " باید ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit, " باشد");
                            return "خیلی کوچک: ".concat(t.origin, " باید ").concat(i).concat(t.minimum.toString(), " باشد")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'رشته نامعتبر: باید با "'.concat(t.prefix, '" شروع شود');
                            if ("ends_with" === t.format) return 'رشته نامعتبر: باید با "'.concat(t.suffix, '" تمام شود');
                            if ("includes" === t.format) return 'رشته نامعتبر: باید شامل "'.concat(t.includes, '" باشد');
                            if ("regex" === t.format) return "رشته نامعتبر: باید با الگوی ".concat(t.pattern, " مطابقت داشته باشد");
                            return "".concat(null != (s = i[t.format]) ? s : t.format, " نامعتبر");
                        case "not_multiple_of":
                            return "عدد نامعتبر: باید مضرب ".concat(t.divisor, " باشد");
                        case "unrecognized_keys":
                            return "کلید".concat(t.keys.length > 1 ? "های" : "", " ناشناس: ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "کلید ناشناس در ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "ورودی نامعتبر";
                        case "invalid_element":
                            return "مقدار نامعتبر در ".concat(t.origin)
                    }
                }
            })()
        }
    }, "fi", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Virheellinen tyyppi: odotettiin instanceof ".concat(t.expected, ", oli ").concat(c);
                            return "Virheellinen tyyppi: odotettiin ".concat(n, ", oli ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Virheellinen syöte: täytyy olla ".concat(en(t.values[0]));
                            return "Virheellinen valinta: täytyy olla yksi seuraavista: ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Liian suuri: ".concat(r.subject, " täytyy olla ").concat(i).concat(t.maximum.toString(), " ").concat(r.unit).trim();
                            return "Liian suuri: arvon täytyy olla ".concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Liian pieni: ".concat(r.subject, " täytyy olla ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit).trim();
                            return "Liian pieni: arvon täytyy olla ".concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Virheellinen syöte: täytyy alkaa "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Virheellinen syöte: täytyy loppua "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Virheellinen syöte: täytyy sisältää "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Virheellinen syöte: täytyy vastata säännöllistä lauseketta ".concat(t.pattern);
                            return "Virheellinen ".concat(null != (c = i[t.format]) ? c : t.format);
                        case "not_multiple_of":
                            return "Virheellinen luku: täytyy olla luvun ".concat(t.divisor, " monikerta");
                        case "unrecognized_keys":
                            return "".concat(t.keys.length > 1 ? "Tuntemattomat avaimet" : "Tuntematon avain", ": ").concat(b(t.keys, ", "));
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
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s, d, m;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Entrée invalide : instance de ".concat(t.expected, " attendu, ").concat(c, " reçu");
                            return "Entrée invalide : ".concat(n, " attendu, ").concat(c, " reçu")
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Entrée invalide : ".concat(en(t.values[0]), " attendu");
                            return "Option invalide : une valeur parmi ".concat(b(t.values, "|"), " attendue");
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                a = n(t.origin);
                            if (a) return "Trop grand : ".concat(null != (c = r[t.origin]) ? c : "valeur", " doit ").concat(a.verb, " ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = a.unit) ? u : "élément(s)");
                            return "Trop grand : ".concat(null != (l = r[t.origin]) ? l : "valeur", " doit être ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                a = n(t.origin);
                            if (a) return "Trop petit : ".concat(null != (s = r[t.origin]) ? s : "valeur", " doit ").concat(a.verb, " ").concat(i).concat(t.minimum.toString(), " ").concat(a.unit);
                            return "Trop petit : ".concat(null != (d = r[t.origin]) ? d : "valeur", " doit être ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Chaîne de caractères invalide : doit commencer par "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Chaîne de caractères invalide : doit se terminer par "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Chaîne de caractères invalide : doit inclure "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Chaîne de caractères invalide : doit correspondre au motif ".concat(t.pattern);
                            return "".concat(null != (m = i[t.format]) ? m : t.format, " invalide");
                        case "not_multiple_of":
                            return "Nombre invalide : doit être un multiple de ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Clé".concat(t.keys.length > 1 ? "s" : "", " non reconnue").concat(t.keys.length > 1 ? "s" : "", " : ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Clé invalide dans ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Entrée invalide";
                        case "invalid_element":
                            return "Valeur invalide dans ".concat(t.origin)
                    }
                }
            })()
        }
    }, "frCA", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Entrée invalide : attendu instanceof ".concat(t.expected, ", reçu ").concat(c);
                            return "Entrée invalide : attendu ".concat(n, ", reçu ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Entrée invalide : attendu ".concat(en(t.values[0]));
                            return "Option invalide : attendu l'une des valeurs suivantes ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "≤" : "<",
                                r = n(t.origin);
                            if (r) return "Trop grand : attendu que ".concat(null != (c = t.origin) ? c : "la valeur", " ait ").concat(i).concat(t.maximum.toString(), " ").concat(r.unit);
                            return "Trop grand : attendu que ".concat(null != (u = t.origin) ? u : "la valeur", " soit ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? "≥" : ">",
                                r = n(t.origin);
                            if (r) return "Trop petit : attendu que ".concat(t.origin, " ait ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "Trop petit : attendu que ".concat(t.origin, " soit ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Chaîne invalide : doit commencer par "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Chaîne invalide : doit se terminer par "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Chaîne invalide : doit inclure "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Chaîne invalide : doit correspondre au motif ".concat(t.pattern);
                            return "".concat(null != (l = i[t.format]) ? l : t.format, " invalide");
                        case "not_multiple_of":
                            return "Nombre invalide : doit être un multiple de ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Clé".concat(t.keys.length > 1 ? "s" : "", " non reconnue").concat(t.keys.length > 1 ? "s" : "", " : ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Clé invalide dans ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Entrée invalide";
                        case "invalid_element":
                            return "Valeur invalide dans ".concat(t.origin)
                    }
                }
            })()
        }
    }, "gu", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            return "અમાન્ય ઇનપુટ: અપેક્ષિત ".concat(n, ", પ્રાપ્ત ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "અમાન્ય ઇનપુટ: અપેક્ષિત ".concat(en(t.values[0]));
                            return "અમાન્ય વિકલ્પ: ".concat(b(t.values, " | "), " માધ્યમથી એક અપેક્ષિત");
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "ખૂબ મોટું: ".concat(null != (c = t.origin) ? c : "મૂલ્ય", " ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "એલિમેન્ટ", " હોવા જોઈએ");
                            return "ખૂબ મોટું: ".concat(null != (l = t.origin) ? l : "મૂલ્ય", " ").concat(i).concat(t.maximum.toString(), " હોવું જોઈએ")
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "ખૂબ નાનું: ".concat(t.origin, " ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit, " હોવા જોઈએ");
                            return "ખૂબ નાનું: ".concat(t.origin, " ").concat(i).concat(t.minimum.toString(), " હોવું જોઈએ")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'અમાન્ય સ્ટ્રિંગ: "'.concat(t.prefix, '" થી શરૂ થવું જોઈએ');
                            if ("ends_with" === t.format) return 'અમાન્ય સ્ટ્રિંગ: "'.concat(t.suffix, '" પર સમાપ્ત થવું જોઈએ');
                            if ("includes" === t.format) return 'અમાન્ય સ્ટ્રિંગ: "'.concat(t.includes, '" શામેલ હોવું જોઈએ');
                            if ("regex" === t.format) return "અમાન્ય સ્ટ્રિંગ: પેટર્ન ".concat(t.pattern, " સાથે મેળ ખાવું જોઈએ");
                            return "અમાન્ય ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "અમાન્ય નંબર: ".concat(t.divisor, " નો ગુણાંક હોવો જોઈએ");
                        case "unrecognized_keys":
                            return "ઓળખી શકાતા નહીં તે કી".concat(t.keys.length > 1 ? "ઓ" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "".concat(t.origin, " માં અમાન્ય કી");
                        case "invalid_union":
                            if (t.options && Array.isArray(t.options) && t.options.length > 0) {
                                let n = t.options.map(t => "'".concat(t, "'")).join(" | ");
                                return "અમાન્ય ડિસ્ક્રિમિનેટર મૂલ્ય. અપેક્ષિત ".concat(n)
                            }
                            return "અમાન્ય ઇનપુટ";
                        case "invalid_element":
                            return "".concat(t.origin, " માં અમાન્ય મૂલ્ય");
                        default:
                            return "અમાન્ય ઇનપુટ"
                    }
                }
            })()
        }
    }, "he", 0, function() {
        let t, n, i, r, a, o, c, u, l;
        return {
            localeError: (t = {
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
            }, n = {
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
            }, i = n => n ? t[n] : void 0, r = n => {
                let r = i(n);
                return r ? r.label : null != n ? n : t.unknown.label
            }, a = t => "ה".concat(r(t)), o = t => {
                var n;
                let r = i(t);
                return "f" === (null != (n = null == r ? void 0 : r.gender) ? n : "m") ? "צריכה להיות" : "צריך להיות"
            }, c = t => {
                var i;
                return t && null != (i = n[t]) ? i : null
            }, u = {
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
            }, l = {
                nan: "NaN"
            }, n => {
                var i, s, d, m, f, v, p, g, h, y, _, k, I, w, S, x, z, U, N, D, O;
                switch (n.code) {
                    case "invalid_type": {
                        let a = n.expected,
                            o = null != (i = l[null != a ? a : ""]) ? i : r(a),
                            c = ex(n.input),
                            u = null != (s = null != (d = l[c]) ? d : null == (m = t[c]) ? void 0 : m.label) ? s : c;
                        if (/^[A-Z]/.test(n.expected)) return "קלט לא תקין: צריך להיות instanceof ".concat(n.expected, ", התקבל ").concat(u);
                        return "קלט לא תקין: צריך להיות ".concat(o, ", התקבל ").concat(u)
                    }
                    case "invalid_value": {
                        if (1 === n.values.length) return "ערך לא תקין: הערך חייב להיות ".concat(en(n.values[0]));
                        let t = n.values.map(t => en(t));
                        if (2 === n.values.length) return "ערך לא תקין: האפשרויות המתאימות הן ".concat(t[0], " או ").concat(t[1]);
                        let i = t[t.length - 1],
                            r = t.slice(0, -1).join(", ");
                        return "ערך לא תקין: האפשרויות המתאימות הן ".concat(r, " או ").concat(i)
                    }
                    case "too_big": {
                        let t = c(n.origin),
                            i = a(null != (f = n.origin) ? f : "value");
                        if ("string" === n.origin) return "".concat(null != (g = null == t ? void 0 : t.longLabel) ? g : "ארוך", " מדי: ").concat(i, " צריכה להכיל ").concat(n.maximum.toString(), " ").concat(null != (h = null == t ? void 0 : t.unit) ? h : "", " ").concat(n.inclusive ? "או פחות" : "לכל היותר").trim();
                        if ("number" === n.origin) {
                            let t = n.inclusive ? "קטן או שווה ל-".concat(n.maximum) : "קטן מ-".concat(n.maximum);
                            return "גדול מדי: ".concat(i, " צריך להיות ").concat(t)
                        }
                        if ("array" === n.origin || "set" === n.origin) {
                            let r = "set" === n.origin ? "צריכה" : "צריך",
                                a = n.inclusive ? "".concat(n.maximum, " ").concat(null != (y = null == t ? void 0 : t.unit) ? y : "", " או פחות") : "פחות מ-".concat(n.maximum, " ").concat(null != (_ = null == t ? void 0 : t.unit) ? _ : "");
                            return "גדול מדי: ".concat(i, " ").concat(r, " להכיל ").concat(a).trim()
                        }
                        let r = n.inclusive ? "<=" : "<",
                            u = o(null != (v = n.origin) ? v : "value");
                        if (null == t ? void 0 : t.unit) return "".concat(t.longLabel, " מדי: ").concat(i, " ").concat(u, " ").concat(r).concat(n.maximum.toString(), " ").concat(t.unit);
                        return "".concat(null != (p = null == t ? void 0 : t.longLabel) ? p : "גדול", " מדי: ").concat(i, " ").concat(u, " ").concat(r).concat(n.maximum.toString())
                    }
                    case "too_small": {
                        let t = c(n.origin),
                            i = a(null != (k = n.origin) ? k : "value");
                        if ("string" === n.origin) return "".concat(null != (S = null == t ? void 0 : t.shortLabel) ? S : "קצר", " מדי: ").concat(i, " צריכה להכיל ").concat(n.minimum.toString(), " ").concat(null != (x = null == t ? void 0 : t.unit) ? x : "", " ").concat(n.inclusive ? "או יותר" : "לפחות").trim();
                        if ("number" === n.origin) {
                            let t = n.inclusive ? "גדול או שווה ל-".concat(n.minimum) : "גדול מ-".concat(n.minimum);
                            return "קטן מדי: ".concat(i, " צריך להיות ").concat(t)
                        }
                        if ("array" === n.origin || "set" === n.origin) {
                            let r = "set" === n.origin ? "צריכה" : "צריך";
                            if (1 === n.minimum && n.inclusive) {
                                let t = (n.origin, "לפחות פריט אחד");
                                return "קטן מדי: ".concat(i, " ").concat(r, " להכיל ").concat(t)
                            }
                            let a = n.inclusive ? "".concat(n.minimum, " ").concat(null != (z = null == t ? void 0 : t.unit) ? z : "", " או יותר") : "יותר מ-".concat(n.minimum, " ").concat(null != (U = null == t ? void 0 : t.unit) ? U : "");
                            return "קטן מדי: ".concat(i, " ").concat(r, " להכיל ").concat(a).trim()
                        }
                        let r = n.inclusive ? ">=" : ">",
                            u = o(null != (I = n.origin) ? I : "value");
                        if (null == t ? void 0 : t.unit) return "".concat(t.shortLabel, " מדי: ").concat(i, " ").concat(u, " ").concat(r).concat(n.minimum.toString(), " ").concat(t.unit);
                        return "".concat(null != (w = null == t ? void 0 : t.shortLabel) ? w : "קטן", " מדי: ").concat(i, " ").concat(u, " ").concat(r).concat(n.minimum.toString())
                    }
                    case "invalid_format": {
                        if ("starts_with" === n.format) return 'המחרוזת חייבת להתחיל ב "'.concat(n.prefix, '"');
                        if ("ends_with" === n.format) return 'המחרוזת חייבת להסתיים ב "'.concat(n.suffix, '"');
                        if ("includes" === n.format) return 'המחרוזת חייבת לכלול "'.concat(n.includes, '"');
                        if ("regex" === n.format) return "המחרוזת חייבת להתאים לתבנית ".concat(n.pattern);
                        let t = u[n.format],
                            i = null != (N = null == t ? void 0 : t.label) ? N : n.format,
                            r = null != (D = null == t ? void 0 : t.gender) ? D : "m";
                        return "".concat(i, " לא ").concat("f" === r ? "תקינה" : "תקין")
                    }
                    case "not_multiple_of":
                        return "מספר לא תקין: חייב להיות מכפלה של ".concat(n.divisor);
                    case "unrecognized_keys":
                        return "מפתח".concat(n.keys.length > 1 ? "ות" : "", " לא מזוה").concat(n.keys.length > 1 ? "ים" : "ה", ": ").concat(b(n.keys, ", "));
                    case "invalid_key":
                        return "שדה לא תקין באובייקט";
                    case "invalid_union":
                    default:
                        return "קלט לא תקין";
                    case "invalid_element": {
                        let t = a(null != (O = n.origin) ? O : "array");
                        return "ערך לא תקין ב".concat(t)
                    }
                }
            })
        }
    }, "hi", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            return "अमान्य इनपुट: अपेक्षित ".concat(n, ", प्राप्त ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "अमान्य इनपुट: अपेक्षित ".concat(en(t.values[0]));
                            return "अमान्य विकल्प: अपेक्षित मानों में से एक ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "बहुत बड़ा: अपेक्षित था कि ".concat(null != (c = t.origin) ? c : "मान", " में ").concat(i).concat(t.maximum, " ").concat(r.unit, " हों");
                            return "बहुत बड़ा: अपेक्षित था कि ".concat(null != (u = t.origin) ? u : "मान", " ").concat(i).concat(t.maximum, " हो")
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "बहुत छोटा: अपेक्षित था कि ".concat(t.origin, " में ").concat(i).concat(t.minimum, " ").concat(r.unit, " हों");
                            return "बहुत छोटा: अपेक्षित था कि ".concat(t.origin, " ").concat(i).concat(t.minimum, " हो")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'अमान्य स्ट्रिंग: "'.concat(t.prefix, '" से शुरू होना चाहिए');
                            if ("ends_with" === t.format) return 'अमान्य स्ट्रिंग: "'.concat(t.suffix, '" पर समाप्त होना चाहिए');
                            if ("includes" === t.format) return 'अमान्य स्ट्रिंग: इसमें "'.concat(t.includes, '" शामिल होना चाहिए');
                            if ("regex" === t.format) return "अमान्य स्ट्रिंग: पैटर्न ".concat(t.pattern, " से मेल खाना चाहिए");
                            return "अमान्य ".concat(null != (l = i[t.format]) ? l : t.format);
                        case "not_multiple_of":
                            return "अमान्य संख्या: यह ".concat(t.divisor, " का गुणज होना चाहिए");
                        case "unrecognized_keys":
                            return "अपरिचित कुंजी".concat(t.keys.length > 1 ? "याँ" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "अमान्य कुंजी: ".concat(t.origin, " में");
                        case "invalid_union":
                            if (t.options && Array.isArray(t.options) && t.options.length > 0) {
                                let n = t.options.map(t => "'".concat(t, "'")).join(" | ");
                                return "अमान्य डिस्क्रिमिनेटर मान: अपेक्षित ".concat(n)
                            }
                            return "अमान्य इनपुट";
                        case "invalid_element":
                            return "अमान्य मान: ".concat(t.origin, " में");
                        default:
                            return "अमान्य इनपुट"
                    }
                }
            })()
        }
    }, "hr", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s, d, m;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Neispravan unos: očekuje se instanceof ".concat(t.expected, ", a primljeno je ").concat(c);
                            return "Neispravan unos: očekuje se ".concat(n, ", a primljeno je ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Neispravna vrijednost: očekivano ".concat(en(t.values[0]));
                            return "Neispravna opcija: očekivano jedno od ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                a = n(t.origin),
                                o = null != (c = r[t.origin]) ? c : t.origin;
                            if (a) return "Preveliko: očekivano da ".concat(null != o ? o : "vrijednost", " ima ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = a.unit) ? u : "elemenata");
                            return "Preveliko: očekivano da ".concat(null != o ? o : "vrijednost", " bude ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                a = n(t.origin),
                                o = null != (l = r[t.origin]) ? l : t.origin;
                            if (a) return "Premalo: očekivano da ".concat(o, " ima ").concat(i).concat(t.minimum.toString(), " ").concat(a.unit);
                            return "Premalo: očekivano da ".concat(o, " bude ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Neispravan tekst: mora započinjati s "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Neispravan tekst: mora završavati s "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Neispravan tekst: mora sadržavati "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Neispravan tekst: mora odgovarati uzorku ".concat(t.pattern);
                            return "Neispravna ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Neispravan broj: mora biti višekratnik od ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Neprepoznat".concat(t.keys.length > 1 ? "i ključevi" : " ključ", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Neispravan ključ u ".concat(null != (d = r[t.origin]) ? d : t.origin);
                        case "invalid_union":
                        default:
                            return "Neispravan unos";
                        case "invalid_element":
                            return "Neispravna vrijednost u ".concat(null != (m = r[t.origin]) ? m : t.origin)
                    }
                }
            })()
        }
    }, "hu", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Érvénytelen bemenet: a várt érték instanceof ".concat(t.expected, ", a kapott érték ").concat(c);
                            return "Érvénytelen bemenet: a várt érték ".concat(n, ", a kapott érték ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Érvénytelen bemenet: a várt érték ".concat(en(t.values[0]));
                            return "Érvénytelen opció: valamelyik érték várt ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Túl nagy: ".concat(null != (c = t.origin) ? c : "érték", " mérete túl nagy ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "elem");
                            return "Túl nagy: a bemeneti érték ".concat(null != (l = t.origin) ? l : "érték", " túl nagy: ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Túl kicsi: a bemeneti érték ".concat(t.origin, " mérete túl kicsi ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "Túl kicsi: a bemeneti érték ".concat(t.origin, " túl kicsi ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Érvénytelen string: "'.concat(t.prefix, '" értékkel kell kezdődnie');
                            if ("ends_with" === t.format) return 'Érvénytelen string: "'.concat(t.suffix, '" értékkel kell végződnie');
                            if ("includes" === t.format) return 'Érvénytelen string: "'.concat(t.includes, '" értéket kell tartalmaznia');
                            if ("regex" === t.format) return "Érvénytelen string: ".concat(t.pattern, " mintának kell megfelelnie");
                            return "Érvénytelen ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Érvénytelen szám: ".concat(t.divisor, " többszörösének kell lennie");
                        case "unrecognized_keys":
                            return "Ismeretlen kulcs".concat(t.keys.length > 1 ? "s" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Érvénytelen kulcs ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Érvénytelen bemenet";
                        case "invalid_element":
                            return "Érvénytelen érték: ".concat(t.origin)
                    }
                }
            })()
        }
    }, "hy", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Սխալ մուտքագրում․ սպասվում էր instanceof ".concat(t.expected, ", ստացվել է ").concat(c);
                            return "Սխալ մուտքագրում․ սպասվում էր ".concat(n, ", ստացվել է ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Սխալ մուտքագրում․ սպասվում էր ".concat(en(t.values[1]));
                            return "Սխալ տարբերակ․ սպասվում էր հետևյալներից մեկը՝ ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) {
                                let n = tK(Number(t.maximum), r.unit.one, r.unit.many);
                                return "Չափազանց մեծ արժեք․ սպասվում է, որ ".concat(tW(null != (u = t.origin) ? u : "արժեք"), " կունենա ").concat(i).concat(t.maximum.toString(), " ").concat(n)
                            }
                            return "Չափազանց մեծ արժեք․ սպասվում է, որ ".concat(tW(null != (c = t.origin) ? c : "արժեք"), " լինի ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) {
                                let n = tK(Number(t.minimum), r.unit.one, r.unit.many);
                                return "Չափազանց փոքր արժեք․ սպասվում է, որ ".concat(tW(t.origin), " կունենա ").concat(i).concat(t.minimum.toString(), " ").concat(n)
                            }
                            return "Չափազանց փոքր արժեք․ սպասվում է, որ ".concat(tW(t.origin), " լինի ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Սխալ տող․ պետք է սկսվի "'.concat(t.prefix, '"-ով');
                            if ("ends_with" === t.format) return 'Սխալ տող․ պետք է ավարտվի "'.concat(t.suffix, '"-ով');
                            if ("includes" === t.format) return 'Սխալ տող․ պետք է պարունակի "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Սխալ տող․ պետք է համապատասխանի ".concat(t.pattern, " ձևաչափին");
                            return "Սխալ ".concat(null != (l = i[t.format]) ? l : t.format);
                        case "not_multiple_of":
                            return "Սխալ թիվ․ պետք է բազմապատիկ լինի ".concat(t.divisor, "-ի");
                        case "unrecognized_keys":
                            return "Չճանաչված բանալի".concat(t.keys.length > 1 ? "ներ" : "", ". ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Սխալ բանալի ".concat(tW(t.origin), "-ում");
                        case "invalid_union":
                        default:
                            return "Սխալ մուտքագրում";
                        case "invalid_element":
                            return "Սխալ արժեք ".concat(tW(t.origin), "-ում")
                    }
                }
            })()
        }
    }, "id", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Input tidak valid: diharapkan instanceof ".concat(t.expected, ", diterima ").concat(c);
                            return "Input tidak valid: diharapkan ".concat(n, ", diterima ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Input tidak valid: diharapkan ".concat(en(t.values[0]));
                            return "Pilihan tidak valid: diharapkan salah satu dari ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Terlalu besar: diharapkan ".concat(null != (c = t.origin) ? c : "value", " memiliki ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "elemen");
                            return "Terlalu besar: diharapkan ".concat(null != (l = t.origin) ? l : "value", " menjadi ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Terlalu kecil: diharapkan ".concat(t.origin, " memiliki ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "Terlalu kecil: diharapkan ".concat(t.origin, " menjadi ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'String tidak valid: harus dimulai dengan "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'String tidak valid: harus berakhir dengan "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'String tidak valid: harus menyertakan "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "String tidak valid: harus sesuai pola ".concat(t.pattern);
                            return "".concat(null != (s = i[t.format]) ? s : t.format, " tidak valid");
                        case "not_multiple_of":
                            return "Angka tidak valid: harus kelipatan dari ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Kunci tidak dikenali ".concat(t.keys.length > 1 ? "s" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Kunci tidak valid di ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Input tidak valid";
                        case "invalid_element":
                            return "Nilai tidak valid di ".concat(t.origin)
                    }
                }
            })()
        }
    }, "is", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Rangt gildi: Þú slóst inn ".concat(c, " þar sem á að vera instanceof ").concat(t.expected);
                            return "Rangt gildi: Þú slóst inn ".concat(c, " þar sem á að vera ").concat(n)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Rangt gildi: gert ráð fyrir ".concat(en(t.values[0]));
                            return "Ógilt val: má vera eitt af eftirfarandi ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Of stórt: gert er ráð fyrir að ".concat(null != (c = t.origin) ? c : "gildi", " hafi ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "hluti");
                            return "Of stórt: gert er ráð fyrir að ".concat(null != (l = t.origin) ? l : "gildi", " sé ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Of lítið: gert er ráð fyrir að ".concat(t.origin, " hafi ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "Of lítið: gert er ráð fyrir að ".concat(t.origin, " sé ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Ógildur strengur: verður að byrja á "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Ógildur strengur: verður að enda á "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Ógildur strengur: verður að innihalda "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Ógildur strengur: verður að fylgja mynstri ".concat(t.pattern);
                            return "Rangt ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Röng tala: verður að vera margfeldi af ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Óþekkt ".concat(t.keys.length > 1 ? "ir lyklar" : "ur lykill", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Rangur lykill í ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Rangt gildi";
                        case "invalid_element":
                            return "Rangt gildi í ".concat(t.origin)
                    }
                }
            })()
        }
    }, "it", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Input non valido: atteso instanceof ".concat(t.expected, ", ricevuto ").concat(c);
                            return "Input non valido: atteso ".concat(n, ", ricevuto ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Input non valido: atteso ".concat(en(t.values[0]));
                            return "Opzione non valida: atteso uno tra ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Troppo grande: ".concat(null != (c = t.origin) ? c : "valore", " deve avere ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "elementi");
                            return "Troppo grande: ".concat(null != (l = t.origin) ? l : "valore", " deve essere ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Troppo piccolo: ".concat(t.origin, " deve avere ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "Troppo piccolo: ".concat(t.origin, " deve essere ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Stringa non valida: deve iniziare con "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Stringa non valida: deve terminare con "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Stringa non valida: deve includere "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Stringa non valida: deve corrispondere al pattern ".concat(t.pattern);
                            return "Input non valido: ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Numero non valido: deve essere un multiplo di ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Chiav".concat(t.keys.length > 1 ? "i" : "e", " non riconosciut").concat(t.keys.length > 1 ? "e" : "a", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Chiave non valida in ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Input non valido";
                        case "invalid_element":
                            return "Valore non valido in ".concat(t.origin)
                    }
                }
            })()
        }
    }, "ja", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "無効な入力: instanceof ".concat(t.expected, "が期待されましたが、").concat(c, "が入力されました");
                            return "無効な入力: ".concat(n, "が期待されましたが、").concat(c, "が入力されました")
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "無効な入力: ".concat(en(t.values[0]), "が期待されました");
                            return "無効な選択: ".concat(b(t.values, "、"), "のいずれかである必要があります");
                        case "too_big": {
                            let i = t.inclusive ? "以下である" : "より小さい",
                                r = n(t.origin);
                            if (r) return "大きすぎる値: ".concat(null != (c = t.origin) ? c : "値", "は").concat(t.maximum.toString()).concat(null != (u = r.unit) ? u : "要素").concat(i, "必要があります");
                            return "大きすぎる値: ".concat(null != (l = t.origin) ? l : "値", "は").concat(t.maximum.toString()).concat(i, "必要があります")
                        }
                        case "too_small": {
                            let i = t.inclusive ? "以上である" : "より大きい",
                                r = n(t.origin);
                            if (r) return "小さすぎる値: ".concat(t.origin, "は").concat(t.minimum.toString()).concat(r.unit).concat(i, "必要があります");
                            return "小さすぎる値: ".concat(t.origin, "は").concat(t.minimum.toString()).concat(i, "必要があります")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return '無効な文字列: "'.concat(t.prefix, '"で始まる必要があります');
                            if ("ends_with" === t.format) return '無効な文字列: "'.concat(t.suffix, '"で終わる必要があります');
                            if ("includes" === t.format) return '無効な文字列: "'.concat(t.includes, '"を含む必要があります');
                            if ("regex" === t.format) return "無効な文字列: パターン".concat(t.pattern, "に一致する必要があります");
                            return "無効な".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "無効な数値: ".concat(t.divisor, "の倍数である必要があります");
                        case "unrecognized_keys":
                            return "認識されていないキー".concat(t.keys.length > 1 ? "群" : "", ": ").concat(b(t.keys, "、"));
                        case "invalid_key":
                            return "".concat(t.origin, "内の無効なキー");
                        case "invalid_union":
                        default:
                            return "無効な入力";
                        case "invalid_element":
                            return "".concat(t.origin, "内の無効な値")
                    }
                }
            })()
        }
    }, "ka", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "არასწორი შეყვანა: მოსალოდნელი instanceof ".concat(t.expected, ", მიღებული ").concat(c);
                            return "არასწორი შეყვანა: მოსალოდნელი ".concat(n, ", მიღებული ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "არასწორი შეყვანა: მოსალოდნელი ".concat(en(t.values[0]));
                            return "არასწორი ვარიანტი: მოსალოდნელია ერთ-ერთი ".concat(b(t.values, "|"), "-დან");
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "ზედმეტად დიდი: მოსალოდნელი ".concat(null != (c = t.origin) ? c : "მნიშვნელობა", " ").concat(r.verb, " ").concat(i).concat(t.maximum.toString(), " ").concat(r.unit);
                            return "ზედმეტად დიდი: მოსალოდნელი ".concat(null != (u = t.origin) ? u : "მნიშვნელობა", " იყოს ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "ზედმეტად პატარა: მოსალოდნელი ".concat(t.origin, " ").concat(r.verb, " ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "ზედმეტად პატარა: მოსალოდნელი ".concat(t.origin, " იყოს ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'არასწორი ველი: უნდა იწყებოდეს "'.concat(t.prefix, '"-ით');
                            if ("ends_with" === t.format) return 'არასწორი ველი: უნდა მთავრდებოდეს "'.concat(t.suffix, '"-ით');
                            if ("includes" === t.format) return 'არასწორი ველი: უნდა შეიცავდეს "'.concat(t.includes, '"-ს');
                            if ("regex" === t.format) return "არასწორი ველი: უნდა შეესაბამებოდეს შაბლონს ".concat(t.pattern);
                            return "არასწორი ".concat(null != (l = i[t.format]) ? l : t.format);
                        case "not_multiple_of":
                            return "არასწორი რიცხვი: უნდა იყოს ".concat(t.divisor, "-ის ჯერადი");
                        case "unrecognized_keys":
                            return "უცნობი გასაღებ".concat(t.keys.length > 1 ? "ები" : "ი", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "არასწორი გასაღები ".concat(t.origin, "-ში");
                        case "invalid_union":
                        default:
                            return "არასწორი შეყვანა";
                        case "invalid_element":
                            return "არასწორი მნიშვნელობა ".concat(t.origin, "-ში")
                    }
                }
            })()
        }
    }, "kh", 0, function() {
        return tG()
    }, "km", 0, tG, "kn", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            return "ಅಮಾನ್ಯ ಇನ್‌ಪುಟ್: ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(n, ", ಸ್ವೀಕರಿಸಿದನು ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "ಅಮಾನ್ಯ ಇನ್‌ಪುಟ್: ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(en(t.values[0]));
                            return "ಅಮಾನ್ಯ ಆಯ್ಕೆ: ಇವುಗಳಲ್ಲಿ ಒಂದನ್ನು ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "ತುಂಬಾ ದೊಡ್ಡದು: ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(null != (c = t.origin) ? c : "value", " ಹೊಂದಲು ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "ಅಂಶಗಳು");
                            return "ತುಂಬಾ ದೊಡ್ಡದು: ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(null != (l = t.origin) ? l : "value", " ಎಂದು ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "ತುಂಬಾ ಚಿಕ್ಕದು: ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(t.origin, " ಹೊಂದಲು ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "ತುಂಬಾ ಚಿಕ್ಕದು: ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(t.origin, " ಎಂದು ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'ಅಮಾನ್ಯವಾದ ಸ್ಟ್ರಿಂಗ್: ಇದರೊಂದಿಗೆ ಪ್ರಾರಂಭಿಸಬೇಕು "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'ಅಮಾನ್ಯವಾದ ಸ್ಟ್ರಿಂಗ್: ಇದರೊಂದಿಗೆ ಕೊನೆಗೊಳ್ಳಬೇಕು "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'ಅಮಾನ್ಯ ಸ್ಟ್ರಿಂಗ್: ಒಳಗೊಂಡಿರಬೇಕು "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "ಅಮಾನ್ಯವಾದ ಸ್ಟ್ರಿಂಗ್: ಮಾದರಿಗೆ ಹೊಂದಿಕೆಯಾಗಬೇಕು ".concat(t.pattern);
                            return "ಅಮಾನ್ಯ ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "ಅಮಾನ್ಯ ಸಂಖ್ಯೆ: ಬಹುಸಂಖ್ಯೆಯಾಗಿರಬೇಕು ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "ಗುರುತಿಸಲಾಗದ ಕೀ ".concat(t.keys.length > 1 ? "s" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "ಅಮಾನ್ಯವಾದ ಕೀ ಇನ್ ".concat(t.origin);
                        case "invalid_union":
                            if (t.options && Array.isArray(t.options) && t.options.length > 0) {
                                let n = t.options.map(t => "'".concat(t, "'")).join(" | ");
                                return "ಅಮಾನ್ಯ ತಾರತಮ್ಯ ಮೌಲ್ಯ. ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(n)
                            }
                            return "ಅಮಾನ್ಯ ಇನ್‌ಪುಟ್";
                        case "invalid_element":
                            return "ರಲ್ಲಿ ಅಮಾನ್ಯ ಮೌಲ್ಯ ".concat(t.origin);
                        default:
                            return "ಅಮಾನ್ಯ ಇನ್‌ಪುಟ್"
                    }
                }
            })()
        }
    }, "ko", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s, d, m, f;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "잘못된 입력: 예상 타입은 instanceof ".concat(t.expected, ", 받은 타입은 ").concat(c, "입니다");
                            return "잘못된 입력: 예상 타입은 ".concat(n, ", 받은 타입은 ").concat(c, "입니다")
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "잘못된 입력: 값은 ".concat(en(t.values[0]), " 이어야 합니다");
                            return "잘못된 옵션: ".concat(b(t.values, "또는 "), " 중 하나여야 합니다");
                        case "too_big": {
                            let i = t.inclusive ? "이하" : "미만",
                                r = "미만" === i ? "이어야 합니다" : "여야 합니다",
                                a = n(t.origin),
                                o = null != (c = null == a ? void 0 : a.unit) ? c : "요소";
                            if (a) return "".concat(null != (u = t.origin) ? u : "값", "이 너무 큽니다: ").concat(t.maximum.toString()).concat(o, " ").concat(i).concat(r);
                            return "".concat(null != (l = t.origin) ? l : "값", "이 너무 큽니다: ").concat(t.maximum.toString(), " ").concat(i).concat(r)
                        }
                        case "too_small": {
                            let i = t.inclusive ? "이상" : "초과",
                                r = "이상" === i ? "이어야 합니다" : "여야 합니다",
                                a = n(t.origin),
                                o = null != (s = null == a ? void 0 : a.unit) ? s : "요소";
                            if (a) return "".concat(null != (m = t.origin) ? m : "값", "이 너무 작습니다: ").concat(t.minimum.toString()).concat(o, " ").concat(i).concat(r);
                            return "".concat(null != (d = t.origin) ? d : "값", "이 너무 작습니다: ").concat(t.minimum.toString(), " ").concat(i).concat(r)
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return '잘못된 문자열: "'.concat(t.prefix, '"(으)로 시작해야 합니다');
                            if ("ends_with" === t.format) return '잘못된 문자열: "'.concat(t.suffix, '"(으)로 끝나야 합니다');
                            if ("includes" === t.format) return '잘못된 문자열: "'.concat(t.includes, '"을(를) 포함해야 합니다');
                            if ("regex" === t.format) return "잘못된 문자열: 정규식 ".concat(t.pattern, " 패턴과 일치해야 합니다");
                            return "잘못된 ".concat(null != (f = i[t.format]) ? f : t.format);
                        case "not_multiple_of":
                            return "잘못된 숫자: ".concat(t.divisor, "의 배수여야 합니다");
                        case "unrecognized_keys":
                            return "인식할 수 없는 키: ".concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "잘못된 키: ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "잘못된 입력";
                        case "invalid_element":
                            return "잘못된 값: ".concat(t.origin)
                    }
                }
            })()
        }
    }, "lt", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n, i, r, a) {
                    var o;
                    let c = null != (o = t[n]) ? o : null;
                    return null === c ? c : {
                        unit: c.unit[i],
                        verb: c.verb[a][r ? "inclusive" : "notInclusive"]
                    }
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s, d, m, f, v, p, g, h, y, _;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Gautas tipas ".concat(c, ", o tikėtasi - instanceof ").concat(t.expected);
                            return "Gautas tipas ".concat(c, ", o tikėtasi - ").concat(n)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Privalo būti ".concat(en(t.values[0]));
                            return "Privalo būti vienas iš ".concat(b(t.values, "|"), " pasirinkimų");
                        case "too_big": {
                            let i = null != (c = r[t.origin]) ? c : t.origin,
                                a = n(t.origin, tq(Number(t.maximum)), null != (u = t.inclusive) && u, "smaller");
                            if (null == a ? void 0 : a.verb) return "".concat(tX(null != (l = null != i ? i : t.origin) ? l : "reikšmė"), " ").concat(a.verb, " ").concat(t.maximum.toString(), " ").concat(null != (s = a.unit) ? s : "elementų");
                            let o = t.inclusive ? "ne didesnis kaip" : "mažesnis kaip";
                            return "".concat(tX(null != (d = null != i ? i : t.origin) ? d : "reikšmė"), " turi būti ").concat(o, " ").concat(t.maximum.toString(), " ").concat(null == a ? void 0 : a.unit)
                        }
                        case "too_small": {
                            let i = null != (m = r[t.origin]) ? m : t.origin,
                                a = n(t.origin, tq(Number(t.minimum)), null != (f = t.inclusive) && f, "bigger");
                            if (null == a ? void 0 : a.verb) return "".concat(tX(null != (v = null != i ? i : t.origin) ? v : "reikšmė"), " ").concat(a.verb, " ").concat(t.minimum.toString(), " ").concat(null != (p = a.unit) ? p : "elementų");
                            let o = t.inclusive ? "ne mažesnis kaip" : "didesnis kaip";
                            return "".concat(tX(null != (g = null != i ? i : t.origin) ? g : "reikšmė"), " turi būti ").concat(o, " ").concat(t.minimum.toString(), " ").concat(null == a ? void 0 : a.unit)
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Eilutė privalo prasidėti "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Eilutė privalo pasibaigti "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Eilutė privalo įtraukti "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Eilutė privalo atitikti ".concat(t.pattern);
                            return "Neteisingas ".concat(null != (h = i[t.format]) ? h : t.format);
                        case "not_multiple_of":
                            return "Skaičius privalo būti ".concat(t.divisor, " kartotinis.");
                        case "unrecognized_keys":
                            return "Neatpažint".concat(t.keys.length > 1 ? "i" : "as", " rakt").concat(t.keys.length > 1 ? "ai" : "as", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Rastas klaidingas raktas";
                        case "invalid_union":
                        default:
                            return "Klaidinga įvestis";
                        case "invalid_element": {
                            let n = null != (y = r[t.origin]) ? y : t.origin;
                            return "".concat(tX(null != (_ = null != n ? n : t.origin) ? _ : "reikšmė"), " turi klaidingą įvestį")
                        }
                    }
                }
            })()
        }
    }, "mk", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Грешен внес: се очекува instanceof ".concat(t.expected, ", примено ").concat(c);
                            return "Грешен внес: се очекува ".concat(n, ", примено ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Invalid input: expected ".concat(en(t.values[0]));
                            return "Грешана опција: се очекува една ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Премногу голем: се очекува ".concat(null != (c = t.origin) ? c : "вредноста", " да има ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "елементи");
                            return "Премногу голем: се очекува ".concat(null != (l = t.origin) ? l : "вредноста", " да биде ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Премногу мал: се очекува ".concat(t.origin, " да има ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "Премногу мал: се очекува ".concat(t.origin, " да биде ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Неважечка низа: мора да започнува со "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Неважечка низа: мора да завршува со "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Неважечка низа: мора да вклучува "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Неважечка низа: мора да одгоара на патернот ".concat(t.pattern);
                            return "Invalid ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Грешен број: мора да биде делив со ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "".concat(t.keys.length > 1 ? "Непрепознаени клучеви" : "Непрепознаен клуч", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Грешен клуч во ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Грешен внес";
                        case "invalid_element":
                            return "Грешна вредност во ".concat(t.origin)
                    }
                }
            })()
        }
    }, "ms", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Input tidak sah: dijangka instanceof ".concat(t.expected, ", diterima ").concat(c);
                            return "Input tidak sah: dijangka ".concat(n, ", diterima ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Input tidak sah: dijangka ".concat(en(t.values[0]));
                            return "Pilihan tidak sah: dijangka salah satu daripada ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Terlalu besar: dijangka ".concat(null != (c = t.origin) ? c : "nilai", " ").concat(r.verb, " ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "elemen");
                            return "Terlalu besar: dijangka ".concat(null != (l = t.origin) ? l : "nilai", " adalah ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Terlalu kecil: dijangka ".concat(t.origin, " ").concat(r.verb, " ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "Terlalu kecil: dijangka ".concat(t.origin, " adalah ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'String tidak sah: mesti bermula dengan "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'String tidak sah: mesti berakhir dengan "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'String tidak sah: mesti mengandungi "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "String tidak sah: mesti sepadan dengan corak ".concat(t.pattern);
                            return "".concat(null != (s = i[t.format]) ? s : t.format, " tidak sah");
                        case "not_multiple_of":
                            return "Nombor tidak sah: perlu gandaan ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Kunci tidak dikenali: ".concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Kunci tidak sah dalam ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Input tidak sah";
                        case "invalid_element":
                            return "Nilai tidak sah dalam ".concat(t.origin)
                    }
                }
            })()
        }
    }, "ne", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            return "अमान्य इनपुट: अपेक्षित ".concat(n, ", प्राप्त ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "अमान्य इनपुट: अपेक्षित ".concat(en(t.values[0]));
                            return "अमान्य विकल्प: अपेक्षित मानहरू मध्ये एक ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "धेरै ठूलो: ".concat(null != (c = t.origin) ? c : "मान", " मा ").concat(i).concat(t.maximum.toString(), " ").concat(r.unit, " ").concat(r.verb);
                            return "धेरै ठूलो: ".concat(null != (u = t.origin) ? u : "मान", " ").concat(i).concat(t.maximum.toString(), " हुनुपर्छ")
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "धेरै सानो: ".concat(t.origin, " मा ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit, " ").concat(r.verb);
                            return "धेरै सानो: ".concat(t.origin, " ").concat(i).concat(t.minimum.toString(), " हुनुपर्छ")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'अमान्य स्ट्रिङ: "'.concat(t.prefix, '" बाट सुरु हुनुपर्छ');
                            if ("ends_with" === t.format) return 'अमान्य स्ट्रिङ: "'.concat(t.suffix, '" मा समाप्त हुनुपर्छ');
                            if ("includes" === t.format) return 'अमान्य स्ट्रिङ: "'.concat(t.includes, '" समावेश हुनुपर्छ');
                            if ("regex" === t.format) return "अमान्य स्ट्रिङ: ढाँचा ".concat(t.pattern, " सँग मेल खानुपर्छ");
                            return "अमान्य ".concat(null != (l = i[t.format]) ? l : t.format);
                        case "not_multiple_of":
                            return "अमान्य संख्या: ".concat(t.divisor, " को गुणज हुनुपर्छ");
                        case "unrecognized_keys":
                            return "अपरिचित कुञ्जी".concat(t.keys.length > 1 ? "हरू" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "अमान्य कुञ्जी: ".concat(t.origin, " मा");
                        case "invalid_union":
                            if (t.options && Array.isArray(t.options) && t.options.length > 0) {
                                let n = t.options.map(t => "'".concat(t, "'")).join(" | ");
                                return "अमान्य डिस्क्रिमिनेटर मान: अपेक्षित ".concat(n)
                            }
                            return "अमान्य इनपुट";
                        case "invalid_element":
                            return "अमान्य मान: ".concat(t.origin, " मा");
                        default:
                            return "अमान्य इनपुट"
                    }
                }
            })()
        }
    }, "nl", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Ongeldige invoer: verwacht instanceof ".concat(t.expected, ", ontving ").concat(c);
                            return "Ongeldige invoer: verwacht ".concat(n, ", ontving ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Ongeldige invoer: verwacht ".concat(en(t.values[0]));
                            return "Ongeldige optie: verwacht één van ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin),
                                a = "date" === t.origin ? "laat" : "string" === t.origin ? "lang" : "groot";
                            if (r) return "Te ".concat(a, ": verwacht dat ").concat(null != (c = t.origin) ? c : "waarde", " ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "elementen", " ").concat(r.verb);
                            return "Te ".concat(a, ": verwacht dat ").concat(null != (l = t.origin) ? l : "waarde", " ").concat(i).concat(t.maximum.toString(), " is")
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin),
                                a = "date" === t.origin ? "vroeg" : "string" === t.origin ? "kort" : "klein";
                            if (r) return "Te ".concat(a, ": verwacht dat ").concat(t.origin, " ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit, " ").concat(r.verb);
                            return "Te ".concat(a, ": verwacht dat ").concat(t.origin, " ").concat(i).concat(t.minimum.toString(), " is")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Ongeldige tekst: moet met "'.concat(t.prefix, '" beginnen');
                            if ("ends_with" === t.format) return 'Ongeldige tekst: moet op "'.concat(t.suffix, '" eindigen');
                            if ("includes" === t.format) return 'Ongeldige tekst: moet "'.concat(t.includes, '" bevatten');
                            if ("regex" === t.format) return "Ongeldige tekst: moet overeenkomen met patroon ".concat(t.pattern);
                            return "Ongeldig: ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Ongeldig getal: moet een veelvoud van ".concat(t.divisor, " zijn");
                        case "unrecognized_keys":
                            return "Onbekende key".concat(t.keys.length > 1 ? "s" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Ongeldige key in ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Ongeldige invoer";
                        case "invalid_element":
                            return "Ongeldige waarde in ".concat(t.origin)
                    }
                }
            })()
        }
    }, "nn", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Ugyldig input: forventa instanceof ".concat(t.expected, ", fekk ").concat(c);
                            return "Ugyldig input: forventa ".concat(n, ", fekk ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Ugyldig verdi: forventa ".concat(en(t.values[0]));
                            return "Ugyldig val: forventa eitt av ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "For stor(t): forventa ".concat(null != (c = t.origin) ? c : "value", " til å ha ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "element");
                            return "For stor(t): forventa ".concat(null != (l = t.origin) ? l : "value", " til å ha ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "For lite(n): forventa ".concat(t.origin, " til å ha ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "For lite(n): forventa ".concat(t.origin, " til å ha ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Ugyldig streng: må starte med "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Ugyldig streng: må slutte med "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Ugyldig streng: må innehalde "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Ugyldig streng: må matche mønsteret ".concat(t.pattern);
                            return "Ugyldig ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Ugyldig tal: må vere eit multiplum av ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "".concat(t.keys.length > 1 ? "Ukjende nøklar" : "Ukjend nøkkel", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Ugyldig nøkkel i ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Ugyldig input";
                        case "invalid_element":
                            return "Ugyldig verdi i ".concat(t.origin)
                    }
                }
            })()
        }
    }, "no", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Ugyldig input: forventet instanceof ".concat(t.expected, ", fikk ").concat(c);
                            return "Ugyldig input: forventet ".concat(n, ", fikk ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Ugyldig verdi: forventet ".concat(en(t.values[0]));
                            return "Ugyldig valg: forventet en av ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "For stor(t): forventet ".concat(null != (c = t.origin) ? c : "value", " til å ha ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "elementer");
                            return "For stor(t): forventet ".concat(null != (l = t.origin) ? l : "value", " til å ha ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "For lite(n): forventet ".concat(t.origin, " til å ha ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "For lite(n): forventet ".concat(t.origin, " til å ha ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Ugyldig streng: må starte med "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Ugyldig streng: må ende med "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Ugyldig streng: må inneholde "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Ugyldig streng: må matche mønsteret ".concat(t.pattern);
                            return "Ugyldig ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Ugyldig tall: må være et multiplum av ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "".concat(t.keys.length > 1 ? "Ukjente nøkler" : "Ukjent nøkkel", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Ugyldig nøkkel i ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Ugyldig input";
                        case "invalid_element":
                            return "Ugyldig verdi i ".concat(t.origin)
                    }
                }
            })()
        }
    }, "ota", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Fâsit giren: umulan instanceof ".concat(t.expected, ", alınan ").concat(c);
                            return "Fâsit giren: umulan ".concat(n, ", alınan ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Fâsit giren: umulan ".concat(en(t.values[0]));
                            return "Fâsit tercih: mûteberler ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Fazla büyük: ".concat(null != (c = t.origin) ? c : "value", ", ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "elements", " sahip olmalıydı.");
                            return "Fazla büyük: ".concat(null != (l = t.origin) ? l : "value", ", ").concat(i).concat(t.maximum.toString(), " olmalıydı.")
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Fazla küçük: ".concat(t.origin, ", ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit, " sahip olmalıydı.");
                            return "Fazla küçük: ".concat(t.origin, ", ").concat(i).concat(t.minimum.toString(), " olmalıydı.")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Fâsit metin: "'.concat(t.prefix, '" ile başlamalı.');
                            if ("ends_with" === t.format) return 'Fâsit metin: "'.concat(t.suffix, '" ile bitmeli.');
                            if ("includes" === t.format) return 'Fâsit metin: "'.concat(t.includes, '" ihtivâ etmeli.');
                            if ("regex" === t.format) return "Fâsit metin: ".concat(t.pattern, " nakşına uymalı.");
                            return "Fâsit ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Fâsit sayı: ".concat(t.divisor, " katı olmalıydı.");
                        case "unrecognized_keys":
                            return "Tanınmayan anahtar ".concat(t.keys.length > 1 ? "s" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "".concat(t.origin, " için tanınmayan anahtar var.");
                        case "invalid_union":
                            return "Giren tanınamadı.";
                        case "invalid_element":
                            return "".concat(t.origin, " için tanınmayan kıymet var.");
                        default:
                            return "Kıymet tanınamadı."
                    }
                }
            })()
        }
    }, "pl", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s, d, m, f;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Nieprawidłowe dane wejściowe: oczekiwano instanceof ".concat(t.expected, ", otrzymano ").concat(c);
                            return "Nieprawidłowe dane wejściowe: oczekiwano ".concat(n, ", otrzymano ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Nieprawidłowe dane wejściowe: oczekiwano ".concat(en(t.values[0]));
                            return "Nieprawidłowa opcja: oczekiwano jednej z wartości ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Za duża wartość: oczekiwano, że ".concat(null != (u = t.origin) ? u : "wartość", " będzie mieć ").concat(i).concat(t.maximum.toString(), " ").concat(null != (l = r.unit) ? l : "elementów");
                            return "Zbyt duż(y/a/e): oczekiwano, że ".concat(null != (c = t.origin) ? c : "wartość", " będzie wynosić ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Za mała wartość: oczekiwano, że ".concat(null != (d = t.origin) ? d : "wartość", " będzie mieć ").concat(i).concat(t.minimum.toString(), " ").concat(null != (m = r.unit) ? m : "elementów");
                            return "Zbyt mał(y/a/e): oczekiwano, że ".concat(null != (s = t.origin) ? s : "wartość", " będzie wynosić ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Nieprawidłowy ciąg znaków: musi zaczynać się od "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Nieprawidłowy ciąg znaków: musi kończyć się na "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Nieprawidłowy ciąg znaków: musi zawierać "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Nieprawidłowy ciąg znaków: musi odpowiadać wzorcowi ".concat(t.pattern);
                            return "Nieprawidłow(y/a/e) ".concat(null != (f = i[t.format]) ? f : t.format);
                        case "not_multiple_of":
                            return "Nieprawidłowa liczba: musi być wielokrotnością ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Nierozpoznane klucze".concat(t.keys.length > 1 ? "s" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Nieprawidłowy klucz w ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Nieprawidłowe dane wejściowe";
                        case "invalid_element":
                            return "Nieprawidłowa wartość w ".concat(t.origin)
                    }
                }
            })()
        }
    }, "ps", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "ناسم ورودي: باید instanceof ".concat(t.expected, " وای, مګر ").concat(c, " ترلاسه شو");
                            return "ناسم ورودي: باید ".concat(n, " وای, مګر ").concat(c, " ترلاسه شو")
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "ناسم ورودي: باید ".concat(en(t.values[0]), " وای");
                            return "ناسم انتخاب: باید یو له ".concat(b(t.values, "|"), " څخه وای");
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "ډیر لوی: ".concat(null != (u = t.origin) ? u : "ارزښت", " باید ").concat(i).concat(t.maximum.toString(), " ").concat(null != (l = r.unit) ? l : "عنصرونه", " ولري");
                            return "ډیر لوی: ".concat(null != (c = t.origin) ? c : "ارزښت", " باید ").concat(i).concat(t.maximum.toString(), " وي")
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "ډیر کوچنی: ".concat(t.origin, " باید ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit, " ولري");
                            return "ډیر کوچنی: ".concat(t.origin, " باید ").concat(i).concat(t.minimum.toString(), " وي")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'ناسم متن: باید د "'.concat(t.prefix, '" سره پیل شي');
                            if ("ends_with" === t.format) return 'ناسم متن: باید د "'.concat(t.suffix, '" سره پای ته ورسيږي');
                            if ("includes" === t.format) return 'ناسم متن: باید "'.concat(t.includes, '" ولري');
                            if ("regex" === t.format) return "ناسم متن: باید د ".concat(t.pattern, " سره مطابقت ولري");
                            return "".concat(null != (s = i[t.format]) ? s : t.format, " ناسم دی");
                        case "not_multiple_of":
                            return "ناسم عدد: باید د ".concat(t.divisor, " مضرب وي");
                        case "unrecognized_keys":
                            return "ناسم ".concat(t.keys.length > 1 ? "کلیډونه" : "کلیډ", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "ناسم کلیډ په ".concat(t.origin, " کې");
                        case "invalid_union":
                        default:
                            return "ناسمه ورودي";
                        case "invalid_element":
                            return "ناسم عنصر په ".concat(t.origin, " کې")
                    }
                }
            })()
        }
    }, "pt", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                    a = {
                        definite: "a",
                        indefinite: "uma"
                    },
                    o = {
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
                            articles: a
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
                            articles: a
                        }
                    };

                function c(t, n) {
                    var i;
                    let a = null != (i = o[t]) ? i : {
                        name: 'valor "'.concat(t, '"'),
                        articles: r
                    };
                    return "".concat(a.articles[n], " ").concat(a.name)
                }
                return t => {
                    var r, a, o;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = c(t.expected, "indefinite"),
                                i = c(ex(t.input), "indefinite");
                            return "Entrada inválida: esperava ".concat(n, ", recebeu ").concat(i)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Entrada inválida: esperava ".concat(en(t.values[0]));
                            return "Opção inválida: esperava uma das seguintes opções: ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                a = n(t.origin);
                            if (a) return "Demasiado grande: esperava que ".concat(c(t.origin, "definite"), " tivesse ").concat(i, " ").concat(t.maximum.toString(), " ").concat(null != (r = a.unit) ? r : "elementos");
                            return "Demasiado grande: esperava que ".concat(c(t.origin, "definite"), " fosse ").concat(i, " ").concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Demasiado pequeno: esperava que ".concat(c(t.origin, "definite"), " tivesse ").concat(i, " ").concat(t.minimum.toString(), " ").concat(null != (a = r.unit) ? a : "elementos");
                            return "Demasiado pequeno: esperava que ".concat(c(t.origin, "definite"), " fosse ").concat(i, " ").concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Texto inválido: deve começar por "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Texto inválido: deve terminar em "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Texto inválido: deve incluir "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Texto inválido: deve corresponder ao padrão ".concat(t.pattern);
                            return "Formato d".concat(null != (o = i[t.format]) ? o : t.format, " inválido");
                        case "not_multiple_of":
                            return "Número inválido: deve ser múltiplo de ".concat(t.divisor);
                        case "unrecognized_keys": {
                            let n = t.keys.length > 1 ? "s" : "";
                            return "Chave".concat(n, " inválida").concat(n, ": ").concat(b(t.keys, ", "))
                        }
                        case "invalid_key":
                        case "invalid_element":
                            return "Entrada inválida n".concat(c(t.origin, "definite"));
                        case "invalid_union":
                            if (t.options && Array.isArray(t.options) && t.options.length > 0) {
                                let n = t.options.map(t => "'".concat(t, "'")).join(" | ");
                                return "Valor de discriminação inválido. Esperava ".concat(n)
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
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                    a = {
                        definite: "a",
                        indefinite: "uma"
                    },
                    o = {
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
                            articles: a
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
                            articles: a
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
                            articles: a
                        }
                    };

                function c(t, n) {
                    var i;
                    let a = null != (i = o[t]) ? i : {
                        name: 'valor "'.concat(t, '"'),
                        articles: r
                    };
                    return "".concat(a.articles[n], " ").concat(a.name)
                }
                return t => {
                    var r, a, o;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = c(t.expected, "indefinite"),
                                i = c(ex(t.input), "indefinite");
                            return "Entrada inválida: esperava ".concat(n, ", recebeu ").concat(i)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Entrada inválida: esperava ".concat(en(t.values[0]));
                            return "Opção inválida: esperava uma das seguintes opções: ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                a = n(t.origin);
                            if (a) return "Grande demais: esperava que ".concat(c(t.origin, "definite"), " tivesse ").concat(i, " ").concat(t.maximum.toString(), " ").concat(null != (r = a.unit) ? r : "elementos");
                            return "Grande demais: esperava que ".concat(c(t.origin, "definite"), " fosse ").concat(i, " ").concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Pequeno demais: esperava que ".concat(c(t.origin, "definite"), " tivesse ").concat(i, " ").concat(t.minimum.toString(), " ").concat(null != (a = r.unit) ? a : "elementos");
                            return "Pequeno demais: esperava que ".concat(c(t.origin, "definite"), " fosse ").concat(i, " ").concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Texto inválido: deve começar com "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Texto inválido: deve terminar com "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Texto inválido: deve incluir "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Texto inválido: deve corresponder ao padrão ".concat(t.pattern);
                            return "Formato d".concat(null != (o = i[t.format]) ? o : t.format, " inválido");
                        case "not_multiple_of":
                            return "Número inválido: deve ser múltiplo de ".concat(t.divisor);
                        case "unrecognized_keys": {
                            let n = t.keys.length > 1 ? "s" : "";
                            return "Chave".concat(n, " inválida").concat(n, ": ").concat(b(t.keys, ", "))
                        }
                        case "invalid_key":
                        case "invalid_element":
                            return "Entrada inválida n".concat(c(t.origin, "definite"));
                        case "invalid_union":
                            if (t.options && Array.isArray(t.options) && t.options.length > 0) {
                                let n = t.options.map(t => "'".concat(t, "'")).join(" | ");
                                return "Valor de discriminação inválido. Esperava ".concat(n)
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
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            return "Intrare invalidă: așteptat ".concat(n, ", primit ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Intrare invalidă: așteptat ".concat(en(t.values[0]));
                            return "Opțiune invalidă: așteptat una dintre ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Prea mare: așteptat ca ".concat(null != (c = t.origin) ? c : "valoarea", " ").concat(r.verb, " ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "elemente");
                            return "Prea mare: așteptat ca ".concat(null != (l = t.origin) ? l : "valoarea", " să fie ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Prea mic: așteptat ca ".concat(t.origin, " ").concat(r.verb, " ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "Prea mic: așteptat ca ".concat(t.origin, " să fie ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Șir invalid: trebuie să înceapă cu "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Șir invalid: trebuie să se termine cu "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Șir invalid: trebuie să includă "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Șir invalid: trebuie să se potrivească cu modelul ".concat(t.pattern);
                            return "Format invalid: ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Număr invalid: trebuie să fie multiplu de ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Chei nerecunoscute: ".concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Cheie invalidă în ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Intrare invalidă";
                        case "invalid_element":
                            return "Valoare invalidă în ".concat(t.origin)
                    }
                }
            })()
        }
    }, "ru", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Неверный ввод: ожидалось instanceof ".concat(t.expected, ", получено ").concat(c);
                            return "Неверный ввод: ожидалось ".concat(n, ", получено ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Неверный ввод: ожидалось ".concat(en(t.values[0]));
                            return "Неверный вариант: ожидалось одно из ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) {
                                let n = tH(Number(t.maximum), r.unit.one, r.unit.few, r.unit.many);
                                return "Слишком большое значение: ожидалось, что ".concat(null != (u = t.origin) ? u : "значение", " будет иметь ").concat(i).concat(t.maximum.toString(), " ").concat(n)
                            }
                            return "Слишком большое значение: ожидалось, что ".concat(null != (c = t.origin) ? c : "значение", " будет ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) {
                                let n = tH(Number(t.minimum), r.unit.one, r.unit.few, r.unit.many);
                                return "Слишком маленькое значение: ожидалось, что ".concat(t.origin, " будет иметь ").concat(i).concat(t.minimum.toString(), " ").concat(n)
                            }
                            return "Слишком маленькое значение: ожидалось, что ".concat(t.origin, " будет ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Неверная строка: должна начинаться с "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Неверная строка: должна заканчиваться на "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Неверная строка: должна содержать "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Неверная строка: должна соответствовать шаблону ".concat(t.pattern);
                            return "Неверный ".concat(null != (l = i[t.format]) ? l : t.format);
                        case "not_multiple_of":
                            return "Неверное число: должно быть кратным ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Нераспознанн".concat(t.keys.length > 1 ? "ые" : "ый", " ключ").concat(t.keys.length > 1 ? "и" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Неверный ключ в ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Неверные входные данные";
                        case "invalid_element":
                            return "Неверное значение в ".concat(t.origin)
                    }
                }
            })()
        }
    }, "sk", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s, d, m, f;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Neplatný vstup: očakávané instanceof ".concat(t.expected, ", obdržané ").concat(c);
                            return "Neplatný vstup: očakávané ".concat(n, ", obdržané ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Neplatný vstup: očakávané ".concat(en(t.values[0]));
                            return "Neplatný vstup: očakávaná jedna z hodnôt ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Hodnota je príliš veľká: ".concat(null != (u = t.origin) ? u : "hodnota", " musí mať ").concat(i).concat(t.maximum.toString(), " ").concat(null != (l = r.unit) ? l : "prvkov");
                            return "Hodnota je príliš veľká: ".concat(null != (c = t.origin) ? c : "hodnota", " musí byť ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Hodnota je príliš malá: ".concat(null != (d = t.origin) ? d : "hodnota", " musí mať ").concat(i).concat(t.minimum.toString(), " ").concat(null != (m = r.unit) ? m : "prvkov");
                            return "Hodnota je príliš malá: ".concat(null != (s = t.origin) ? s : "hodnota", " musí byť ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Neplatný reťazec: musí začínať na "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Neplatný reťazec: musí končiť na "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Neplatný reťazec: musí obsahovať "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Neplatný reťazec: musí zodpovedať vzoru ".concat(t.pattern);
                            return "Neplatný formát ".concat(null != (f = i[t.format]) ? f : t.format);
                        case "not_multiple_of":
                            return "Neplatné číslo: musí byť násobkom ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Neznáme klúče: ".concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Neplatný klúč v ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Neplatný vstup";
                        case "invalid_element":
                            return "Neplatná hodnota v ".concat(t.origin)
                    }
                }
            })()
        }
    }, "sl", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Neveljaven vnos: pričakovano instanceof ".concat(t.expected, ", prejeto ").concat(c);
                            return "Neveljaven vnos: pričakovano ".concat(n, ", prejeto ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Neveljaven vnos: pričakovano ".concat(en(t.values[0]));
                            return "Neveljavna možnost: pričakovano eno izmed ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Preveliko: pričakovano, da bo ".concat(null != (c = t.origin) ? c : "vrednost", " imelo ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "elementov");
                            return "Preveliko: pričakovano, da bo ".concat(null != (l = t.origin) ? l : "vrednost", " ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Premajhno: pričakovano, da bo ".concat(t.origin, " imelo ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "Premajhno: pričakovano, da bo ".concat(t.origin, " ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Neveljaven niz: mora se začeti z "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Neveljaven niz: mora se končati z "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Neveljaven niz: mora vsebovati "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Neveljaven niz: mora ustrezati vzorcu ".concat(t.pattern);
                            return "Neveljaven ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Neveljavno število: mora biti večkratnik ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Neprepoznan".concat(t.keys.length > 1 ? "i ključi" : " ključ", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Neveljaven ključ v ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Neveljaven vnos";
                        case "invalid_element":
                            return "Neveljavna vrednost v ".concat(t.origin)
                    }
                }
            })()
        }
    }, "sv", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s, d, m, f, v;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Ogiltig inmatning: förväntat instanceof ".concat(t.expected, ", fick ").concat(c);
                            return "Ogiltig inmatning: förväntat ".concat(n, ", fick ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Ogiltig inmatning: förväntat ".concat(en(t.values[0]));
                            return "Ogiltigt val: förväntade en av ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "För stor(t): förväntade ".concat(null != (u = t.origin) ? u : "värdet", " att ha ").concat(i).concat(t.maximum.toString(), " ").concat(null != (l = r.unit) ? l : "element");
                            return "För stor(t): förväntat ".concat(null != (c = t.origin) ? c : "värdet", " att ha ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "För lite(t): förväntade ".concat(null != (d = t.origin) ? d : "värdet", " att ha ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "För lite(t): förväntade ".concat(null != (s = t.origin) ? s : "värdet", " att ha ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Ogiltig sträng: måste börja med "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Ogiltig sträng: måste sluta med "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Ogiltig sträng: måste innehålla "'.concat(t.includes, '"');
                            if ("regex" === t.format) return 'Ogiltig sträng: måste matcha mönstret "'.concat(t.pattern, '"');
                            return "Ogiltig(t) ".concat(null != (m = i[t.format]) ? m : t.format);
                        case "not_multiple_of":
                            return "Ogiltigt tal: måste vara en multipel av ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "".concat(t.keys.length > 1 ? "Okända nycklar" : "Okänd nyckel", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Ogiltig nyckel i ".concat(null != (f = t.origin) ? f : "värdet");
                        case "invalid_union":
                        default:
                            return "Ogiltig input";
                        case "invalid_element":
                            return "Ogiltigt värde i ".concat(null != (v = t.origin) ? v : "värdet")
                    }
                }
            })()
        }
    }, "ta", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "தவறான உள்ளீடு: எதிர்பார்க்கப்பட்டது instanceof ".concat(t.expected, ", பெறப்பட்டது ").concat(c);
                            return "தவறான உள்ளீடு: எதிர்பார்க்கப்பட்டது ".concat(n, ", பெறப்பட்டது ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "தவறான உள்ளீடு: எதிர்பார்க்கப்பட்டது ".concat(en(t.values[0]));
                            return "தவறான விருப்பம்: எதிர்பார்க்கப்பட்டது ".concat(b(t.values, "|"), " இல் ஒன்று");
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "மிக பெரியது: எதிர்பார்க்கப்பட்டது ".concat(null != (u = t.origin) ? u : "மதிப்பு", " ").concat(i).concat(t.maximum.toString(), " ").concat(null != (l = r.unit) ? l : "உறுப்புகள்", " ஆக இருக்க வேண்டும்");
                            return "மிக பெரியது: எதிர்பார்க்கப்பட்டது ".concat(null != (c = t.origin) ? c : "மதிப்பு", " ").concat(i).concat(t.maximum.toString(), " ஆக இருக்க வேண்டும்")
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "மிகச் சிறியது: எதிர்பார்க்கப்பட்டது ".concat(t.origin, " ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit, " ஆக இருக்க வேண்டும்");
                            return "மிகச் சிறியது: எதிர்பார்க்கப்பட்டது ".concat(t.origin, " ").concat(i).concat(t.minimum.toString(), " ஆக இருக்க வேண்டும்")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'தவறான சரம்: "'.concat(t.prefix, '" இல் தொடங்க வேண்டும்');
                            if ("ends_with" === t.format) return 'தவறான சரம்: "'.concat(t.suffix, '" இல் முடிவடைய வேண்டும்');
                            if ("includes" === t.format) return 'தவறான சரம்: "'.concat(t.includes, '" ஐ உள்ளடக்க வேண்டும்');
                            if ("regex" === t.format) return "தவறான சரம்: ".concat(t.pattern, " முறைபாட்டுடன் பொருந்த வேண்டும்");
                            return "தவறான ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "தவறான எண்: ".concat(t.divisor, " இன் பலமாக இருக்க வேண்டும்");
                        case "unrecognized_keys":
                            return "அடையாளம் தெரியாத விசை".concat(t.keys.length > 1 ? "கள்" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "".concat(t.origin, " இல் தவறான விசை");
                        case "invalid_union":
                        default:
                            return "தவறான உள்ளீடு";
                        case "invalid_element":
                            return "".concat(t.origin, " இல் தவறான மதிப்பு")
                    }
                }
            })()
        }
    }, "tg", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            return "Вуруди нодуруст: ".concat(n, " интизор мерафт, ").concat(c, " гирифта шуд")
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Вуруди нодуруст: ".concat(en(t.values[0]), " интизор мерафт");
                            return "Интихоби нодуруст: яке аз ".concat(b(t.values, "|"), " интизор мерафт");
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Хеле калон: ".concat(null != (c = t.origin) ? c : "қимат", " бояд ").concat(i).concat(t.maximum.toString(), " ").concat(r.unit, " ").concat(r.verb);
                            return "Хеле калон: ".concat(null != (u = t.origin) ? u : "қимат", " бояд ").concat(i).concat(t.maximum.toString(), " бошад")
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Хеле хурд: ".concat(t.origin, " бояд ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit, " ").concat(r.verb);
                            return "Хеле хурд: ".concat(t.origin, " бояд ").concat(i).concat(t.minimum.toString(), " бошад")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Сатри нодуруст: бояд бо "'.concat(t.prefix, '" оғоз шавад');
                            if ("ends_with" === t.format) return 'Сатри нодуруст: бояд бо "'.concat(t.suffix, '" анҷом ёбад');
                            if ("includes" === t.format) return 'Сатри нодуруст: бояд "'.concat(t.includes, '"-ро дар бар гирад');
                            if ("regex" === t.format) return "Сатри нодуруст: бояд ба намунаи ".concat(t.pattern, " мувофиқат кунад");
                            return "".concat(null != (l = i[t.format]) ? l : t.format, "-и нодуруст");
                        case "not_multiple_of":
                            return "Рақами нодуруст: бояд ба ".concat(t.divisor, " бе бақия тақсим шавад");
                        case "unrecognized_keys":
                            return "Калид".concat(t.keys.length > 1 ? "ҳои" : "и", " номаълум: ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Калиди нодуруст дар ".concat(t.origin);
                        case "invalid_union":
                            if (t.options && Array.isArray(t.options) && t.options.length > 0) {
                                let n = t.options.map(t => "'".concat(t, "'")).join(" | ");
                                return "Қимати нодурусти дискриминатор: ".concat(n, " интизор мерафт")
                            }
                            return "Вуруди нодуруст";
                        case "invalid_element":
                            return "Қимати нодуруст дар ".concat(t.origin);
                        default:
                            return "Вуруди нодуруст"
                    }
                }
            })()
        }
    }, "th", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "ประเภทข้อมูลไม่ถูกต้อง: ควรเป็น instanceof ".concat(t.expected, " แต่ได้รับ ").concat(c);
                            return "ประเภทข้อมูลไม่ถูกต้อง: ควรเป็น ".concat(n, " แต่ได้รับ ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "ค่าไม่ถูกต้อง: ควรเป็น ".concat(en(t.values[0]));
                            return "ตัวเลือกไม่ถูกต้อง: ควรเป็นหนึ่งใน ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "ไม่เกิน" : "น้อยกว่า",
                                r = n(t.origin);
                            if (r) return "เกินกำหนด: ".concat(null != (c = t.origin) ? c : "ค่า", " ควรมี").concat(i, " ").concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "รายการ");
                            return "เกินกำหนด: ".concat(null != (l = t.origin) ? l : "ค่า", " ควรมี").concat(i, " ").concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? "อย่างน้อย" : "มากกว่า",
                                r = n(t.origin);
                            if (r) return "น้อยกว่ากำหนด: ".concat(t.origin, " ควรมี").concat(i, " ").concat(t.minimum.toString(), " ").concat(r.unit);
                            return "น้อยกว่ากำหนด: ".concat(t.origin, " ควรมี").concat(i, " ").concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'รูปแบบไม่ถูกต้อง: ข้อความต้องขึ้นต้นด้วย "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'รูปแบบไม่ถูกต้อง: ข้อความต้องลงท้ายด้วย "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'รูปแบบไม่ถูกต้อง: ข้อความต้องมี "'.concat(t.includes, '" อยู่ในข้อความ');
                            if ("regex" === t.format) return "รูปแบบไม่ถูกต้อง: ต้องตรงกับรูปแบบที่กำหนด ".concat(t.pattern);
                            return "รูปแบบไม่ถูกต้อง: ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "ตัวเลขไม่ถูกต้อง: ต้องเป็นจำนวนที่หารด้วย ".concat(t.divisor, " ได้ลงตัว");
                        case "unrecognized_keys":
                            return "พบคีย์ที่ไม่รู้จัก: ".concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "คีย์ไม่ถูกต้องใน ".concat(t.origin);
                        case "invalid_union":
                            return "ข้อมูลไม่ถูกต้อง: ไม่ตรงกับรูปแบบยูเนียนที่กำหนดไว้";
                        case "invalid_element":
                            return "ข้อมูลไม่ถูกต้องใน ".concat(t.origin);
                        default:
                            return "ข้อมูลไม่ถูกต้อง"
                    }
                }
            })()
        }
    }, "tk", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            return "Nädogry baha: garaşylan ".concat(n, " ýerine ").concat(c, " alyndy")
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Nädogry baha: ".concat(en(t.values[0]), " bolmaly");
                            return "Nädogry saýlaw: aşakdakylardan biri bolmaly: ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Has uly: garaşylýan ".concat(null != (c = t.origin) ? c : "baha", " ").concat(i, " ").concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "element");
                            return "Has uly: garaşylýan ".concat(null != (l = t.origin) ? l : "baha", " ").concat(i, " ").concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Has kiçi: garaşylýan ".concat(t.origin, " ").concat(i, " ").concat(t.minimum.toString(), " ").concat(r.unit);
                            return "Has kiçi: garaşylýan ".concat(t.origin, " ").concat(i, " ").concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Nädogry setir: "'.concat(t.prefix, '" bilen başlamaly');
                            if ("ends_with" === t.format) return 'Nädogry setir: "'.concat(t.suffix, '" bilen gutarmaly');
                            if ("includes" === t.format) return 'Nädogry setir: "'.concat(t.includes, '" saklamaly');
                            if ("regex" === t.format) return "Nädogry setir: ".concat(t.pattern, " nusga laýyk bolmaly");
                            return "Nädogry ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Nädogry san: ".concat(t.divisor, " bilen galyndysyz bölünmeli");
                        case "unrecognized_keys":
                            return "Tanalmaýan açar".concat(t.keys.length > 1 ? "lar" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "".concat(t.origin, " içinde nädogry açar");
                        case "invalid_union":
                        default:
                            return "Nädogry baha";
                        case "invalid_element":
                            return "".concat(t.origin, " içinde nädogry baha")
                    }
                }
            })()
        }
    }, "tr", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Geçersiz değer: beklenen instanceof ".concat(t.expected, ", alınan ").concat(c);
                            return "Geçersiz değer: beklenen ".concat(n, ", alınan ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Geçersiz değer: beklenen ".concat(en(t.values[0]));
                            return "Geçersiz seçenek: aşağıdakilerden biri olmalı: ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Çok büyük: beklenen ".concat(null != (c = t.origin) ? c : "değer", " ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "öğe");
                            return "Çok büyük: beklenen ".concat(null != (l = t.origin) ? l : "değer", " ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Çok küçük: beklenen ".concat(t.origin, " ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "Çok küçük: beklenen ".concat(t.origin, " ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Geçersiz metin: "'.concat(t.prefix, '" ile başlamalı');
                            if ("ends_with" === t.format) return 'Geçersiz metin: "'.concat(t.suffix, '" ile bitmeli');
                            if ("includes" === t.format) return 'Geçersiz metin: "'.concat(t.includes, '" içermeli');
                            if ("regex" === t.format) return "Geçersiz metin: ".concat(t.pattern, " desenine uymalı");
                            return "Geçersiz ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Geçersiz sayı: ".concat(t.divisor, " ile tam bölünebilmeli");
                        case "unrecognized_keys":
                            return "Tanınmayan anahtar".concat(t.keys.length > 1 ? "lar" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "".concat(t.origin, " içinde geçersiz anahtar");
                        case "invalid_union":
                        default:
                            return "Geçersiz değer";
                        case "invalid_element":
                            return "".concat(t.origin, " içinde geçersiz değer")
                    }
                }
            })()
        }
    }, "ua", 0, function() {
        return tY()
    }, "uk", 0, tY, "ur", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "غلط ان پٹ: instanceof ".concat(t.expected, " متوقع تھا، ").concat(c, " موصول ہوا");
                            return "غلط ان پٹ: ".concat(n, " متوقع تھا، ").concat(c, " موصول ہوا")
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "غلط ان پٹ: ".concat(en(t.values[0]), " متوقع تھا");
                            return "غلط آپشن: ".concat(b(t.values, "|"), " میں سے ایک متوقع تھا");
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "بہت بڑا: ".concat(null != (c = t.origin) ? c : "ویلیو", " کے ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "عناصر", " ہونے متوقع تھے");
                            return "بہت بڑا: ".concat(null != (l = t.origin) ? l : "ویلیو", " کا ").concat(i).concat(t.maximum.toString(), " ہونا متوقع تھا")
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "بہت چھوٹا: ".concat(t.origin, " کے ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit, " ہونے متوقع تھے");
                            return "بہت چھوٹا: ".concat(t.origin, " کا ").concat(i).concat(t.minimum.toString(), " ہونا متوقع تھا")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'غلط سٹرنگ: "'.concat(t.prefix, '" سے شروع ہونا چاہیے');
                            if ("ends_with" === t.format) return 'غلط سٹرنگ: "'.concat(t.suffix, '" پر ختم ہونا چاہیے');
                            if ("includes" === t.format) return 'غلط سٹرنگ: "'.concat(t.includes, '" شامل ہونا چاہیے');
                            if ("regex" === t.format) return "غلط سٹرنگ: پیٹرن ".concat(t.pattern, " سے میچ ہونا چاہیے");
                            return "غلط ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "غلط نمبر: ".concat(t.divisor, " کا مضاعف ہونا چاہیے");
                        case "unrecognized_keys":
                            return "غیر تسلیم شدہ کی".concat(t.keys.length > 1 ? "ز" : "", ": ").concat(b(t.keys, "، "));
                        case "invalid_key":
                            return "".concat(t.origin, " میں غلط کی");
                        case "invalid_union":
                        default:
                            return "غلط ان پٹ";
                        case "invalid_element":
                            return "".concat(t.origin, " میں غلط ویلیو")
                    }
                }
            })()
        }
    }, "uz", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Noto‘g‘ri kirish: kutilgan instanceof ".concat(t.expected, ", qabul qilingan ").concat(c);
                            return "Noto‘g‘ri kirish: kutilgan ".concat(n, ", qabul qilingan ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Noto‘g‘ri kirish: kutilgan ".concat(en(t.values[0]));
                            return "Noto‘g‘ri variant: quyidagilardan biri kutilgan ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Juda katta: kutilgan ".concat(null != (c = t.origin) ? c : "qiymat", " ").concat(i).concat(t.maximum.toString(), " ").concat(r.unit, " ").concat(r.verb);
                            return "Juda katta: kutilgan ".concat(null != (u = t.origin) ? u : "qiymat", " ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Juda kichik: kutilgan ".concat(t.origin, " ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit, " ").concat(r.verb);
                            return "Juda kichik: kutilgan ".concat(t.origin, " ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Noto‘g‘ri satr: "'.concat(t.prefix, '" bilan boshlanishi kerak');
                            if ("ends_with" === t.format) return 'Noto‘g‘ri satr: "'.concat(t.suffix, '" bilan tugashi kerak');
                            if ("includes" === t.format) return 'Noto‘g‘ri satr: "'.concat(t.includes, '" ni o‘z ichiga olishi kerak');
                            if ("regex" === t.format) return "Noto‘g‘ri satr: ".concat(t.pattern, " shabloniga mos kelishi kerak");
                            return "Noto‘g‘ri ".concat(null != (l = i[t.format]) ? l : t.format);
                        case "not_multiple_of":
                            return "Noto‘g‘ri raqam: ".concat(t.divisor, " ning karralisi bo‘lishi kerak");
                        case "unrecognized_keys":
                            return "Noma’lum kalit".concat(t.keys.length > 1 ? "lar" : "", ": ").concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "".concat(t.origin, " dagi kalit noto‘g‘ri");
                        case "invalid_union":
                        default:
                            return "Noto‘g‘ri kirish";
                        case "invalid_element":
                            return "".concat(t.origin, " da noto‘g‘ri qiymat")
                    }
                }
            })()
        }
    }, "vi", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Đầu vào không hợp lệ: mong đợi instanceof ".concat(t.expected, ", nhận được ").concat(c);
                            return "Đầu vào không hợp lệ: mong đợi ".concat(n, ", nhận được ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Đầu vào không hợp lệ: mong đợi ".concat(en(t.values[0]));
                            return "Tùy chọn không hợp lệ: mong đợi một trong các giá trị ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Quá lớn: mong đợi ".concat(null != (c = t.origin) ? c : "giá trị", " ").concat(r.verb, " ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "phần tử");
                            return "Quá lớn: mong đợi ".concat(null != (l = t.origin) ? l : "giá trị", " ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Quá nhỏ: mong đợi ".concat(t.origin, " ").concat(r.verb, " ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "Quá nhỏ: mong đợi ".concat(t.origin, " ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Chuỗi không hợp lệ: phải bắt đầu bằng "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Chuỗi không hợp lệ: phải kết thúc bằng "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Chuỗi không hợp lệ: phải bao gồm "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Chuỗi không hợp lệ: phải khớp với mẫu ".concat(t.pattern);
                            return "".concat(null != (s = i[t.format]) ? s : t.format, " không hợp lệ");
                        case "not_multiple_of":
                            return "Số không hợp lệ: phải là bội số của ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Khóa không được nhận dạng: ".concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Khóa không hợp lệ trong ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Đầu vào không hợp lệ";
                        case "invalid_element":
                            return "Giá trị không hợp lệ trong ".concat(t.origin)
                    }
                }
            })()
        }
    }, "yo", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "Ìbáwọlé aṣìṣe: a ní láti fi instanceof ".concat(t.expected, ", àmọ̀ a rí ").concat(c);
                            return "Ìbáwọlé aṣìṣe: a ní láti fi ".concat(n, ", àmọ̀ a rí ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Ìbáwọlé aṣìṣe: a ní láti fi ".concat(en(t.values[0]));
                            return "Àṣàyàn aṣìṣe: yan ọ̀kan lára ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "Tó pọ̀ jù: a ní láti jẹ́ pé ".concat(null != (c = t.origin) ? c : "iye", " ").concat(r.verb, " ").concat(i).concat(t.maximum, " ").concat(r.unit);
                            return "Tó pọ̀ jù: a ní láti jẹ́ ".concat(i).concat(t.maximum)
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "Kéré ju: a ní láti jẹ́ pé ".concat(t.origin, " ").concat(r.verb, " ").concat(i).concat(t.minimum, " ").concat(r.unit);
                            return "Kéré ju: a ní láti jẹ́ ".concat(i).concat(t.minimum)
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Ọ̀rọ̀ aṣìṣe: gbọ́dọ̀ bẹ̀rẹ̀ pẹ̀lú "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Ọ̀rọ̀ aṣìṣe: gbọ́dọ̀ parí pẹ̀lú "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Ọ̀rọ̀ aṣìṣe: gbọ́dọ̀ ní "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Ọ̀rọ̀ aṣìṣe: gbọ́dọ̀ bá àpẹẹrẹ mu ".concat(t.pattern);
                            return "Aṣìṣe: ".concat(null != (u = i[t.format]) ? u : t.format);
                        case "not_multiple_of":
                            return "Nọ́mbà aṣìṣe: gbọ́dọ̀ jẹ́ èyà pípín ti ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Bọtìnì àìmọ̀: ".concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "Bọtìnì aṣìṣe nínú ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Ìbáwọlé aṣìṣe";
                        case "invalid_element":
                            return "Iye aṣìṣe nínú ".concat(t.origin)
                    }
                }
            })()
        }
    }, "zhCN", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "无效输入：期望 instanceof ".concat(t.expected, "，实际接收 ").concat(c);
                            return "无效输入：期望 ".concat(n, "，实际接收 ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "无效输入：期望 ".concat(en(t.values[0]));
                            return "无效选项：期望以下之一 ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "数值过大：期望 ".concat(null != (c = t.origin) ? c : "值", " ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "个元素");
                            return "数值过大：期望 ".concat(null != (l = t.origin) ? l : "值", " ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "数值过小：期望 ".concat(t.origin, " ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "数值过小：期望 ".concat(t.origin, " ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return '无效字符串：必须以 "'.concat(t.prefix, '" 开头');
                            if ("ends_with" === t.format) return '无效字符串：必须以 "'.concat(t.suffix, '" 结尾');
                            if ("includes" === t.format) return '无效字符串：必须包含 "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "无效字符串：必须满足正则表达式 ".concat(t.pattern);
                            return "无效".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "无效数字：必须是 ".concat(t.divisor, " 的倍数");
                        case "unrecognized_keys":
                            return "出现未知的键(key): ".concat(b(t.keys, ", "));
                        case "invalid_key":
                            return "".concat(t.origin, " 中的键(key)无效");
                        case "invalid_union":
                        default:
                            return "无效输入";
                        case "invalid_element":
                            return "".concat(t.origin, " 中包含无效值(value)")
                    }
                }
            })()
        }
    }, "zhTW", 0, function() {
        return {
            localeError: (() => {
                let t = {
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

                function n(n) {
                    var i;
                    return null != (i = t[n]) ? i : null
                }
                let i = {
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
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = r[t.expected]) ? a : t.expected,
                                i = ex(t.input),
                                c = null != (o = r[i]) ? o : i;
                            if (/^[A-Z]/.test(t.expected)) return "無效的輸入值：預期為 instanceof ".concat(t.expected, "，但收到 ").concat(c);
                            return "無效的輸入值：預期為 ".concat(n, "，但收到 ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "無效的輸入值：預期為 ".concat(en(t.values[0]));
                            return "無效的選項：預期為以下其中之一 ".concat(b(t.values, "|"));
                        case "too_big": {
                            let i = t.inclusive ? "<=" : "<",
                                r = n(t.origin);
                            if (r) return "數值過大：預期 ".concat(null != (c = t.origin) ? c : "值", " 應為 ").concat(i).concat(t.maximum.toString(), " ").concat(null != (u = r.unit) ? u : "個元素");
                            return "數值過大：預期 ".concat(null != (l = t.origin) ? l : "值", " 應為 ").concat(i).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let i = t.inclusive ? ">=" : ">",
                                r = n(t.origin);
                            if (r) return "數值過小：預期 ".concat(t.origin, " 應為 ").concat(i).concat(t.minimum.toString(), " ").concat(r.unit);
                            return "數值過小：預期 ".concat(t.origin, " 應為 ").concat(i).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return '無效的字串：必須以 "'.concat(t.prefix, '" 開頭');
                            if ("ends_with" === t.format) return '無效的字串：必須以 "'.concat(t.suffix, '" 結尾');
                            if ("includes" === t.format) return '無效的字串：必須包含 "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "無效的字串：必須符合格式 ".concat(t.pattern);
                            return "無效的 ".concat(null != (s = i[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "無效的數字：必須為 ".concat(t.divisor, " 的倍數");
                        case "unrecognized_keys":
                            return "無法識別的鍵值".concat(t.keys.length > 1 ? "們" : "", "：").concat(b(t.keys, "、"));
                        case "invalid_key":
                            return "".concat(t.origin, " 中有無效的鍵值");
                        case "invalid_union":
                        default:
                            return "無效的輸入值";
                        case "invalid_element":
                            return "".concat(t.origin, " 中有無效的值")
                    }
                }
            })()
        }
    }], 932471);
    var tQ = t.i(932471);
    t.s([], 745980);
    var t0 = t.i(745980);
    t.s([], 448274), t.i(448274), t.i(655831);
    let t4 = {
            get: function() {
                let t = this._zod;
                return null != t.message || (t.message = JSON.stringify(t.def, k, 2)), t.message
            },
            set: function(t) {
                this._zod.message = t
            },
            enumerable: !0,
            configurable: !0
        },
        t6 = {
            value: void 0,
            enumerable: !1
        },
        t1 = new WeakSet([Object.prototype, Error.prototype]),
        t2 = (t, n) => {
            t.name = "$ZodError", t6.value = n, Object.defineProperty(t, "issues", t6), t6.value = void 0, Object.defineProperty(t, "message", t4);
            let i = Object.getPrototypeOf(t);
            t1.has(i) || (t1.add(i), Object.defineProperty(i, "toString", {
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
        },
        t9 = c("$ZodError", t2),
        t3 = c("$ZodError", t2, void 0, {
            Parent: Error
        });

    function t5(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : t => t.message,
            i = {},
            r = [];
        for (let c of t.issues)
            if (c.path.length > 0) {
                var a, o;
                (a = c.path[0], o = () => [], !Object.prototype.hasOwnProperty.call(i, a) && ("__proto__" === a ? Object.defineProperty(i, a, {
                    value: o(),
                    writable: !0,
                    enumerable: !0,
                    configurable: !0
                }) : i[a] = o()), i[a]).push(n(c))
            } else r.push(n(c));
        return {
            formErrors: r,
            fieldErrors: i
        }
    }

    function t7(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : t => t.message,
            i = {
                _errors: []
            },
            r = function(t) {
                let a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [];
                for (let o of t.issues)
                    if ("invalid_union" === o.code && o.errors.length) o.errors.map(t => r({
                        issues: t
                    }, [...a, ...o.path]));
                    else if ("invalid_key" === o.code) r({
                    issues: o.issues
                }, [...a, ...o.path]);
                else if ("invalid_element" === o.code) r({
                    issues: o.issues
                }, [...a, ...o.path]);
                else {
                    let t = [...a, ...o.path];
                    if (0 === t.length) i._errors.push(n(o));
                    else {
                        let r = i,
                            a = 0;
                        for (; a < t.length;) {
                            let i = t[a],
                                c = a === t.length - 1;
                            if ("_errors" === i) {
                                c && r._errors.push(n(o)), a++;
                                continue
                            }
                            Object.prototype.hasOwnProperty.call(r, i) || Object.defineProperty(r, i, {
                                value: {
                                    _errors: []
                                },
                                enumerable: !0,
                                writable: !0,
                                configurable: !0
                            });
                            let u = r[i];
                            c && u._errors.push(n(o)), r = u, a++
                        }
                    }
                }
            };
        return r(t), i
    }

    function t8(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : t => t.message,
            i = {
                errors: []
            },
            r = function(t) {
                var a;
                let o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [];
                for (let c of t.issues)
                    if ("invalid_union" === c.code && c.errors.length) c.errors.map(t => r({
                        issues: t
                    }, [...o, ...c.path]));
                    else if ("invalid_key" === c.code) r({
                    issues: c.issues
                }, [...o, ...c.path]);
                else if ("invalid_element" === c.code) r({
                    issues: c.issues
                }, [...o, ...c.path]);
                else {
                    let t = [...o, ...c.path];
                    if (0 === t.length) {
                        i.errors.push(n(c));
                        continue
                    }
                    let r = i,
                        u = 0;
                    for (; u < t.length;) {
                        let i = t[u],
                            o = u === t.length - 1;
                        "string" == typeof i ? (null != r.properties || (r.properties = {}), Object.prototype.hasOwnProperty.call(r.properties, i) || Object.defineProperty(r.properties, i, {
                            value: {
                                errors: []
                            },
                            enumerable: !0,
                            writable: !0,
                            configurable: !0
                        }), r = r.properties[i]) : (null != r.items || (r.items = []), null != (a = r.items)[i] || (a[i] = {
                            errors: []
                        }), r = r.items[i]), o && r.errors.push(n(c)), u++
                    }
                }
            };
        return r(t), i
    }

    function ne(t) {
        let n = [];
        for (let i of t.map(t => "object" == typeof t ? t.key : t)) "number" == typeof i ? n.push("[".concat(i, "]")) : "symbol" == typeof i ? n.push("[".concat(JSON.stringify(String(i)), "]")) : /[^\w$]/.test(i) ? n.push("[".concat(JSON.stringify(i), "]")) : (n.length && n.push("."), n.push(i));
        return n.join("")
    }

    function nt(t) {
        let n = [];
        for (let r of [...t.issues].sort((t, n) => {
                var i, r;
                return (null != (i = t.path) ? i : []).length - (null != (r = n.path) ? r : []).length
            })) {
            var i;
            n.push("✖ ".concat(r.message)), (null == (i = r.path) ? void 0 : i.length) && n.push("  → at ".concat(ne(r.path)))
        }
        return n.join("\n")
    }

    function nn(t, n) {
        var i;
        return {
            callee: null != (i = null == n ? void 0 : n.callee) ? i : t,
            Err: null == n ? void 0 : n.Err
        }
    }
    t.s(["$ZodError", 0, t9, "$ZodRealError", 0, t3, "flattenError", 0, t5, "formatError", 0, t7, "prettifyError", 0, nt, "toDotPath", 0, ne, "treeifyError", 0, t8], 161105);
    let ni = t => {
            let n = (i, r, a, o) => {
                let c = a ? {
                        ...a,
                        async: !1
                    } : {
                        async: !1
                    },
                    u = i._zod.run({
                        value: r,
                        issues: []
                    }, c);
                if (u instanceof Promise) throw new l;
                if (u.issues.length) {
                    var s, d;
                    let i = new(null != (s = null == o ? void 0 : o.Err) ? s : t)(u.issues.map(t => eb(t, c, m())));
                    throw V(i, null != (d = null == o ? void 0 : o.callee) ? d : n), i
                }
                return u.value
            };
            return n
        },
        nr = ni(t3),
        na = t => {
            let n = async (i, r, a, o) => {
                let c = a ? {
                        ...a,
                        async: !0
                    } : {
                        async: !0
                    },
                    u = i._zod.run({
                        value: r,
                        issues: []
                    }, c);
                if (u instanceof Promise && (u = await u), u.issues.length) {
                    var l, s;
                    let i = new(null != (l = null == o ? void 0 : o.Err) ? l : t)(u.issues.map(t => eb(t, c, m())));
                    throw V(i, null != (s = null == o ? void 0 : o.callee) ? s : n), i
                }
                return u.value
            };
            return n
        },
        no = na(t3),
        nc = t => (n, i, r) => {
            let a = r ? {
                    ...r,
                    async: !1
                } : {
                    async: !1
                },
                o = n._zod.run({
                    value: i,
                    issues: []
                }, a);
            if (o instanceof Promise) throw new l;
            return o.issues.length ? nl(t, o.issues, a) : {
                success: !0,
                data: o.value
            }
        },
        nu = nc(t3);

    function nl(t, n, i) {
        let r;
        return {
            success: !1,
            get error() {
                return r || (r = new t(n.map(t => eb(t, i, m()))), n = void 0, i = void 0), r
            },
            set error(e) {
                r = e, n = void 0, i = void 0
            }
        }
    }
    let ns = t => async (n, i, r) => {
        let a = r ? {
                ...r,
                async: !0
            } : {
                async: !0
            },
            o = n._zod.run({
                value: i,
                issues: []
            }, a);
        return o instanceof Promise && (o = await o), o.issues.length ? nl(t, o.issues, a) : {
            success: !0,
            data: o.value
        }
    }, nd = ns(t3), nm = Symbol.for("zod.compile.invalid"), nf = Symbol.for("zod.compile.fallback"), nv = (t, n, i) => {
        let r = t._zod.bag.validator;
        if (void 0 !== r) {
            if (r(n) !== nm) return !0;
            if (!0 === r.definite && void 0 === i) return !1
        }
        var a = t,
            o = n,
            c = i;
        let u, s = c ? {
                ...c,
                async: !1,
                abortEarly: !0
            } : {
                async: !1,
                abortEarly: !0
            },
            d = a._zod.bag.fallbackRun;
        if (d ? (s[nf] = !0, u = d({
                value: o,
                issues: []
            }, s)) : u = a._zod.run({
                value: o,
                issues: []
            }, s), u instanceof Promise) throw new l;
        return 0 === u.issues.length
    }, np = async (t, n, i) => {
        let r = i ? {
                ...i,
                async: !0,
                abortEarly: !0
            } : {
                async: !0,
                abortEarly: !0
            },
            a = t._zod.run({
                value: n,
                issues: []
            }, r);
        return a instanceof Promise && (a = await a), 0 === a.issues.length
    }, ng = t => {
        let n = ni(t),
            i = (t, r, a, o) => n(t, r, a ? {
                ...a,
                direction: "backward"
            } : {
                direction: "backward"
            }, nn(i, o));
        return i
    }, nh = ng(t3), ny = t => {
        let n = ni(t),
            i = (t, r, a, o) => n(t, r, a, nn(i, o));
        return i
    }, n_ = ny(t3), nb = t => {
        let n = na(t),
            i = async (t, r, a, o) => {
                let c = a ? {
                    ...a,
                    direction: "backward"
                } : {
                    direction: "backward"
                };
                return await n(t, r, c, nn(i, o))
            };
        return i
    }, nk = nb(t3), nI = t => {
        let n = na(t),
            i = async (t, r, a, o) => await n(t, r, a, nn(i, o));
        return i
    }, nw = nI(t3), nS = t => (n, i, r) => {
        let a = r ? {
            ...r,
            direction: "backward"
        } : {
            direction: "backward"
        };
        return nc(t)(n, i, a)
    }, nx = nS(t3), nz = t => (n, i, r) => nc(t)(n, i, r), nU = nz(t3), nN = t => async (n, i, r) => {
        let a = r ? {
            ...r,
            direction: "backward"
        } : {
            direction: "backward"
        };
        return ns(t)(n, i, a)
    }, nD = nN(t3), nO = t => async (n, i, r) => ns(t)(n, i, r), nZ = nO(t3);
    t.s(["_decode", 0, ny, "_decodeAsync", 0, nI, "_encode", 0, ng, "_encodeAsync", 0, nb, "_parse", 0, ni, "_parseAsync", 0, na, "_safeDecode", 0, nz, "_safeDecodeAsync", 0, nO, "_safeEncode", 0, nS, "_safeEncodeAsync", 0, nN, "_safeParse", 0, nc, "_safeParseAsync", 0, ns, "decode", 0, n_, "decodeAsync", 0, nw, "encode", 0, nh, "encodeAsync", 0, nk, "parse", 0, nr, "parseAsync", 0, no, "safeDecode", 0, nU, "safeDecodeAsync", 0, nZ, "safeEncode", 0, nx, "safeEncodeAsync", 0, nD, "safeParse", 0, nu, "safeParseAsync", 0, nd, "validate", 0, nv, "validateAsync", 0, np], 455162), t.i(455162), t.i(161105);
    let nA = c("$ZodCheck", (t, n) => {
            var i;
            null != t._zod || (t._zod = {}), t._zod.def = n, null != (i = t._zod).onattach || (i.onattach = [])
        }),
        nP = t => {
            let n = t.value;
            return !S(n) && void 0 !== n.size
        },
        nj = t => {
            let n = t.value;
            return !S(n) && void 0 !== n.length
        },
        n$ = {
            number: "number",
            bigint: "bigint",
            object: "date"
        },
        nE = c("$ZodCheckLessThan", (t, n) => {
            nA.init(t, n);
            let i = n$[typeof n.value];
            t._zod.check = r => {
                var a;
                (n.inclusive ? r.value <= n.value : r.value < n.value) || r.issues.push({
                    origin: null != (a = n$[typeof r.value]) ? a : i,
                    code: "too_big",
                    maximum: "object" == typeof n.value ? n.value.getTime() : n.value,
                    input: r.value,
                    inclusive: n.inclusive,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nT = c("$ZodCheckGreaterThan", (t, n) => {
            nA.init(t, n);
            let i = n$[typeof n.value];
            t._zod.check = r => {
                var a;
                (n.inclusive ? r.value >= n.value : r.value > n.value) || r.issues.push({
                    origin: null != (a = n$[typeof r.value]) ? a : i,
                    code: "too_small",
                    minimum: "object" == typeof n.value ? n.value.getTime() : n.value,
                    input: r.value,
                    inclusive: n.inclusive,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nL = c("$ZodCheckMultipleOf", (t, n) => {
            nA.init(t, n), t._zod.check = i => {
                if (typeof i.value != typeof n.value) throw Error("Cannot mix number and bigint in multiple_of check.");
                ("bigint" == typeof i.value ? n.value !== BigInt(0) && i.value % n.value === BigInt(0) : 0 === z(i.value, n.value)) || i.issues.push({
                    origin: typeof i.value,
                    code: "not_multiple_of",
                    divisor: n.value,
                    input: i.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nC = c("$ZodCheckNumberFormat", (t, n) => {
            var i;
            nA.init(t, n), n.format = n.format || "float64";
            let r = null == (i = n.format) ? void 0 : i.includes("int"),
                a = r ? "int" : "number",
                [o, c] = er[n.format];
            t._zod.check = i => {
                let u = i.value;
                if (r) {
                    if (!Number.isInteger(u)) return void i.issues.push({
                        expected: a,
                        format: n.format,
                        code: "invalid_type",
                        continue: !1,
                        input: u,
                        inst: t
                    });
                    if (!Number.isSafeInteger(u)) return void(u > 0 ? i.issues.push({
                        input: u,
                        code: "too_big",
                        maximum: Number.MAX_SAFE_INTEGER,
                        note: "Integers must be within the safe integer range.",
                        inst: t,
                        origin: a,
                        inclusive: !0,
                        continue: !n.abort
                    }) : i.issues.push({
                        input: u,
                        code: "too_small",
                        minimum: Number.MIN_SAFE_INTEGER,
                        note: "Integers must be within the safe integer range.",
                        inst: t,
                        origin: a,
                        inclusive: !0,
                        continue: !n.abort
                    }))
                }
                u < o && i.issues.push({
                    origin: "number",
                    input: u,
                    code: "too_small",
                    minimum: o,
                    inclusive: !0,
                    inst: t,
                    continue: !n.abort
                }), u > c && i.issues.push({
                    origin: "number",
                    input: u,
                    code: "too_big",
                    maximum: c,
                    inclusive: !0,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nR = c("$ZodCheckBigIntFormat", (t, n) => {
            nA.init(t, n);
            let [i, r] = ea[n.format];
            t._zod.check = a => {
                let o = a.value;
                o < i && a.issues.push({
                    origin: "bigint",
                    input: o,
                    code: "too_small",
                    minimum: i,
                    inclusive: !0,
                    inst: t,
                    continue: !n.abort
                }), o > r && a.issues.push({
                    origin: "bigint",
                    input: o,
                    code: "too_big",
                    maximum: r,
                    inclusive: !0,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nJ = c("$ZodCheckMaxSize", (t, n) => {
            var i;
            nA.init(t, n), null != (i = t._zod.def).when || (i.when = nP), t._zod.check = i => {
                let r = i.value;
                r.size <= n.maximum || i.issues.push({
                    origin: ek(r),
                    code: "too_big",
                    maximum: n.maximum,
                    inclusive: !0,
                    input: r,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nM = c("$ZodCheckMinSize", (t, n) => {
            var i;
            nA.init(t, n), null != (i = t._zod.def).when || (i.when = nP), t._zod.check = i => {
                let r = i.value;
                r.size >= n.minimum || i.issues.push({
                    origin: ek(r),
                    code: "too_small",
                    minimum: n.minimum,
                    inclusive: !0,
                    input: r,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nV = c("$ZodCheckSizeEquals", (t, n) => {
            var i;
            nA.init(t, n), null != (i = t._zod.def).when || (i.when = nP), t._zod.check = i => {
                let r = i.value,
                    a = r.size;
                if (a === n.size) return;
                let o = a > n.size;
                i.issues.push({
                    origin: ek(r),
                    ...o ? {
                        code: "too_big",
                        maximum: n.size
                    } : {
                        code: "too_small",
                        minimum: n.size
                    },
                    inclusive: !0,
                    exact: !0,
                    input: i.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nF = c("$ZodCheckMaxLength", (t, n) => {
            var i;
            nA.init(t, n), null != (i = t._zod.def).when || (i.when = nj), t._zod.check = i => {
                let r = i.value,
                    a = r.length;
                if (("string" == typeof r && a > n.maximum ? ew(r) : a) <= n.maximum) return;
                let o = eS(r);
                i.issues.push({
                    origin: o,
                    code: "too_big",
                    maximum: n.maximum,
                    inclusive: !0,
                    input: r,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nB = c("$ZodCheckMinLength", (t, n) => {
            var i;
            nA.init(t, n), null != (i = t._zod.def).when || (i.when = nj), t._zod.check = i => {
                let r = i.value,
                    a = r.length;
                if (("string" == typeof r && a >= n.minimum && a < 2 * n.minimum ? ew(r) : a) >= n.minimum) return;
                let o = eS(r);
                i.issues.push({
                    origin: o,
                    code: "too_small",
                    minimum: n.minimum,
                    inclusive: !0,
                    input: r,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nK = c("$ZodCheckLengthEquals", (t, n) => {
            var i;
            nA.init(t, n), null != (i = t._zod.def).when || (i.when = nj), t._zod.check = i => {
                let r = i.value,
                    a = r.length,
                    o = "string" == typeof r && a >= n.length && a <= 2 * n.length ? ew(r) : a;
                if (o === n.length) return;
                let c = eS(r),
                    u = o > n.length;
                i.issues.push({
                    origin: c,
                    ...u ? {
                        code: "too_big",
                        maximum: n.length
                    } : {
                        code: "too_small",
                        minimum: n.length
                    },
                    inclusive: !0,
                    exact: !0,
                    input: i.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nW = c("$ZodCheckStringFormat", (t, n) => {
            var i, r;
            nA.init(t, n), n.pattern ? null != (i = t._zod).check || (i.check = i => {
                n.pattern.lastIndex = 0, n.pattern.test(i.value) || i.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: n.format,
                    input: i.value,
                    ...n.pattern ? {
                        pattern: n.pattern.toString()
                    } : {},
                    inst: t,
                    continue: !n.abort
                })
            }) : null != (r = t._zod).check || (r.check = () => {})
        }),
        nG = c("$ZodCheckRegex", (t, n) => {
            nW.init(t, n), t._zod.check = i => {
                n.pattern.lastIndex = 0, n.pattern.test(i.value) || i.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: "regex",
                    input: i.value,
                    pattern: n.pattern.toString(),
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nX = c("$ZodCheckLowerCase", (t, n) => {
            null != n.pattern || (n.pattern = tN), nW.init(t, n)
        }),
        nq = c("$ZodCheckUpperCase", (t, n) => {
            null != n.pattern || (n.pattern = tD), nW.init(t, n)
        }),
        nH = c("$ZodCheckIncludes", (t, n) => {
            nA.init(t, n);
            let i = Y(n.includes),
                r = new RegExp("number" == typeof n.position ? "^.{".concat(n.position, ",}").concat(i) : i);
            n.pattern = r, t._zod.check = i => {
                i.value.includes(n.includes, n.position) || i.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: "includes",
                    includes: n.includes,
                    input: i.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nY = c("$ZodCheckStartsWith", (t, n) => {
            nA.init(t, n);
            let i = new RegExp("^".concat(Y(n.prefix), ".*"));
            null != n.pattern || (n.pattern = i), t._zod.check = i => {
                i.value.startsWith(n.prefix) || i.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: "starts_with",
                    prefix: n.prefix,
                    input: i.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nQ = c("$ZodCheckEndsWith", (t, n) => {
            nA.init(t, n);
            let i = new RegExp(".*".concat(Y(n.suffix), "$"));
            null != n.pattern || (n.pattern = i), t._zod.check = i => {
                i.value.endsWith(n.suffix) || i.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: "ends_with",
                    suffix: n.suffix,
                    input: i.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        });

    function n0(t, n, i) {
        t.issues.length && n.issues.push(...eh(i, t.issues))
    }
    let n4 = c("$ZodCheckProperty", (t, n) => {
            nA.init(t, n), t._zod.check = t => {
                let i = n.schema._zod.run({
                    value: t.value[n.property],
                    issues: []
                }, {});
                if (i instanceof Promise) return i.then(i => n0(i, t, n.property));
                n0(i, t, n.property)
            }
        }),
        n6 = c("$ZodCheckProperties", (t, n) => {
            let i;
            nA.init(t, n), eT(t, Symbol.iterator, function*() {
                yield t
            }), t._zod.check = r => {
                let a;
                if (null == r.value) return void r.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: r.value,
                    inst: t
                });
                null != i || (i = Reflect.ownKeys(n.shape).map(t => [t, n.shape[t]]));
                let o = r.value;
                for (let [t, n] of i) {
                    let i = n._zod.run({
                        value: o[t],
                        issues: []
                    }, {});
                    i instanceof Promise ? (null != a || (a = []), a.push(i.then(n => n0(n, r, t)))) : n0(i, r, t)
                }
                if (a) return Promise.all(a).then(() => void 0)
            }
        }),
        n1 = c("$ZodCheckMimeType", (t, n) => {
            nA.init(t, n);
            let i = new Set(n.mime);
            t._zod.check = r => {
                i.has(r.value.type) || r.issues.push({
                    code: "invalid_value",
                    values: n.mime,
                    input: r.value.type,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        n2 = c("$ZodCheckOverwrite", (t, n) => {
            nA.init(t, n), t._zod.check = t => {
                t.value = n.tx(t.value)
            }
        });
    t.s(["$ZodCheck", 0, nA, "$ZodCheckBigIntFormat", 0, nR, "$ZodCheckEndsWith", 0, nQ, "$ZodCheckGreaterThan", 0, nT, "$ZodCheckIncludes", 0, nH, "$ZodCheckLengthEquals", 0, nK, "$ZodCheckLessThan", 0, nE, "$ZodCheckLowerCase", 0, nX, "$ZodCheckMaxLength", 0, nF, "$ZodCheckMaxSize", 0, nJ, "$ZodCheckMimeType", 0, n1, "$ZodCheckMinLength", 0, nB, "$ZodCheckMinSize", 0, nM, "$ZodCheckMultipleOf", 0, nL, "$ZodCheckNumberFormat", 0, nC, "$ZodCheckOverwrite", 0, n2, "$ZodCheckProperties", 0, n6, "$ZodCheckProperty", 0, n4, "$ZodCheckRegex", 0, nG, "$ZodCheckSizeEquals", 0, nV, "$ZodCheckStartsWith", 0, nY, "$ZodCheckStringFormat", 0, nW, "$ZodCheckUpperCase", 0, nq], 402171);
    class n9 {
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
                i = Math.min(...n.map(t => t.length - t.trimStart().length));
            for (let t of n.map(t => t.slice(i)).map(t => " ".repeat(2 * this.indent) + t)) this.content.push(t)
        }
        compile() {
            var t;
            let n = Function,
                i = null != (t = null === this || void 0 === this ? void 0 : this.content) ? t : [""];
            return new n(...Object.keys(this.closed), "return function (".concat(this.args.join(", "), ") {\n").concat(i.join("\n"), "\n};"))(...Object.values(this.closed))
        }
        constructor(t = [], n = {}) {
            this.content = [], this.indent = 0, this.args = t, this.closed = n
        }
    }
    t.s(["Doc", 0, n9], 990010);
    let n3 = {
        major: 4,
        minor: 6,
        patch: 5
    };
    t.s(["version", 0, n3], 437808);
    let n5 = c("$ZodType", (t, n) => {
            var i, r;
            null != t || (t = {}), t._zod.def = n, t._zod.bag = t._zod.bag || {}, t._zod.version = n3;
            let a = t._zod.def.checks,
                o = t._zod.traits.has("$ZodCheck") ? [t, ...null != a ? a : []] : (null == a ? void 0 : a.length) ? [...a] : [];
            for (let n of o)
                for (let i of n._zod.onattach) i(t);
            if (0 === o.length) null != (i = t._zod).deferred || (i.deferred = []), null == (r = t._zod.deferred) || r.push(() => {
                t._zod.run = t._zod.parse
            });
            else {
                let n = (n, i, r) => {
                        let a;
                        if (n.memo) return n;
                        let o = ep(n);
                        for (let c of i) {
                            if (c._zod.def.when) {
                                if (eg(n) || !c._zod.def.when(n)) continue
                            } else if (o) continue;
                            let i = n.issues.length,
                                u = c._zod.check(n);
                            if (u instanceof Promise && (null == r ? void 0 : r.async) === !1) throw new l;
                            if (a || u instanceof Promise) a = (null != a ? a : Promise.resolve()).then(async () => {
                                await u, n.issues.length !== i && (e_(n.issues, i, t), o || (o = ep(n, i)))
                            });
                            else {
                                if (n.issues.length === i) continue;
                                e_(n.issues, i, t), o || (o = ep(n, i))
                            }
                        }
                        return a ? a.then(() => n) : n
                    },
                    i = (i, r, a) => {
                        if (ep(i)) return i.aborted = !0, i;
                        let c = n(r, o, a);
                        if (c instanceof Promise) {
                            if (!1 === a.async) throw new l;
                            return c.then(n => t._zod.parse(n, a))
                        }
                        return t._zod.parse(c, a)
                    };
                t._zod.run = (r, a) => {
                    if (a.skipChecks) return t._zod.parse(r, a);
                    if ("backward" === a.direction) {
                        let n = t._zod.parse({
                            value: r.value,
                            issues: []
                        }, {
                            ...a,
                            skipChecks: !0
                        });
                        return n instanceof Promise ? n.then(t => i(t, r, a)) : i(n, r, a)
                    }
                    let c = t._zod.parse(r, a);
                    if (c instanceof Promise) {
                        if (!1 === a.async) throw new l;
                        return c.then(t => n(t, o, a))
                    }
                    return n(c, o, a)
                }
            }
        }, {
            get "~standard"() {
                return eT(this, "~standard", ie(this))
            },
            set "~standard"(value) {
                eE(this, "~standard", value)
            }
        }),
        n7 = (t, n) => t.issues.length ? {
            issues: t.issues.map(t => eb(t, n, m()))
        } : {
            value: t.value
        };
    async function n8(t, n) {
        let i = {
            async: !0
        };
        return n7(await t._zod.run({
            value: n,
            issues: []
        }, i), i)
    }

    function ie(t) {
        return {
            validate: n => {
                let i = {
                    async: !1
                };
                try {
                    let r = t._zod.run({
                        value: n,
                        issues: []
                    }, i);
                    if (!(r instanceof Promise)) return n7(r, i)
                } catch (t) {}
                return n8(t, n)
            },
            vendor: "zod",
            version: 1
        }
    }
    let it = c("$ZodString", (t, n) => {
            var i;
            n5.init(t, n), t._zod.pattern = null != (i = n.pattern) ? i : tb, t._zod.parse = (i, r) => {
                if (n.coerce) try {
                    i.value = String(i.value)
                } catch (t) {}
                return "string" == typeof i.value || i.issues.push({
                    expected: "string",
                    code: "invalid_type",
                    input: i.value,
                    inst: t
                }), i
            }
        }),
        ii = c("$ZodStringFormat", (t, n) => {
            nW.init(t, n), it.init(t, n)
        }),
        ir = c("$ZodGUID", (t, n) => {
            null != n.pattern || (n.pattern = e1), ii.init(t, n)
        }),
        ia = c("$ZodUUID", (t, n) => {
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
                null != n.pattern || (n.pattern = e2(t))
            } else null != n.pattern || (n.pattern = e2());
            ii.init(t, n)
        }),
        io = c("$ZodEmail", (t, n) => {
            null != n.pattern || (n.pattern = e7), ii.init(t, n)
        });

    function ic(t) {
        try {
            if ("u" > typeof URL && "function" == typeof URL.canParse) return URL.canParse(t);
            return new URL(t), !0
        } catch (t) {
            return !1
        }
    }

    function iu(t, n) {
        return "normalize" in n || "hostname" in n || "protocol" in n ? il(t, n) : ic(t) || 2
    }

    function il(t, n) {
        var i, r;
        if (!n.normalize && (null == (i = n.protocol) ? void 0 : i.source) === ts.source && !/^https?:\/\//i.test(t)) return 1;
        try {
            if ("u" > typeof URL) {
                let n = URL;
                if ("function" == typeof n.parse) return null != (r = n.parse(t)) ? r : 2
            }
            return new URL(t)
        } catch (t) {
            return 2
        }
    }
    let is = /[\t\n\r]/g;

    function id(t) {
        return t.replace(is, "")
    }

    function im(t, n) {
        return n.lastIndex = 0, n.test(t.hostname)
    }

    function iv(t, n) {
        return n.lastIndex = 0, n.test(t.protocol.endsWith(":") ? t.protocol.slice(0, -1) : t.protocol)
    }
    let ip = c("$ZodURL", (t, n) => {
            ii.init(t, n), t._zod.check = i => {
                try {
                    let r = i.value.trim(),
                        a = iu(r, n);
                    if (1 === a) return void i.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid URL format",
                        input: i.value,
                        inst: t,
                        continue: !n.abort
                    });
                    if (2 === a) return void i.issues.push({
                        code: "invalid_format",
                        format: "url",
                        input: i.value,
                        inst: t,
                        continue: !n.abort
                    });
                    if (!0 === a) {
                        i.value = id(r);
                        return
                    }
                    n.hostname && !im(a, n.hostname) && i.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid hostname",
                        pattern: n.hostname.source,
                        input: i.value,
                        inst: t,
                        continue: !n.abort
                    }), n.protocol && !iv(a, n.protocol) && i.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid protocol",
                        pattern: n.protocol.source,
                        input: i.value,
                        inst: t,
                        continue: !n.abort
                    }), i.value = n.normalize ? a.href : id(r);
                    return
                } catch (r) {
                    i.issues.push({
                        code: "invalid_format",
                        format: "url",
                        input: i.value,
                        inst: t,
                        continue: !n.abort
                    })
                }
            }
        }),
        ig = c("$ZodEmoji", (t, n) => {
            null != n.pattern || (n.pattern = te()), ii.init(t, n)
        }),
        ih = c("$ZodNanoID", (t, n) => {
            if (void 0 !== n.length && (!Number.isInteger(n.length) || n.length < 1)) throw Error("Invalid nanoid length: ".concat(n.length));
            null != n.pattern || (n.pattern = void 0 === n.length ? e0 : e4(n.length)), ii.init(t, n)
        }),
        iy = c("$ZodCUID", (t, n) => {
            null != n.pattern || (n.pattern = eX), ii.init(t, n)
        }),
        i_ = c("$ZodCUID2", (t, n) => {
            null != n.pattern || (n.pattern = eq), ii.init(t, n)
        }),
        ib = c("$ZodULID", (t, n) => {
            null != n.pattern || (n.pattern = eH), ii.init(t, n)
        }),
        ik = c("$ZodXID", (t, n) => {
            null != n.pattern || (n.pattern = eY), ii.init(t, n)
        }),
        iI = c("$ZodKSUID", (t, n) => {
            null != n.pattern || (n.pattern = eQ), ii.init(t, n)
        }),
        iw = c("$ZodISODateTime", (t, n) => {
            null != n.pattern || (n.pattern = t_(n)), ii.init(t, n)
        }),
        iS = c("$ZodISODate", (t, n) => {
            null != n.pattern || (n.pattern = tg), ii.init(t, n)
        }),
        ix = c("$ZodISOTime", (t, n) => {
            null != n.pattern || (n.pattern = ty(n)), ii.init(t, n)
        }),
        iz = c("$ZodISODuration", (t, n) => {
            null != n.pattern || (n.pattern = e6), ii.init(t, n)
        }),
        iU = c("$ZodIPv4", (t, n) => {
            null != n.pattern || (n.pattern = tt), ii.init(t, n)
        }),
        iN = /^[0-9a-fA-F:.]+$/;

    function iD(t) {
        return !!iN.test(t) && ic("http://[".concat(t, "]"))
    }
    let iO = c("$ZodIPv6", (t, n) => {
            null != n.pattern || (n.pattern = tn), ii.init(t, n), t._zod.check = i => {
                iD(i.value) || i.issues.push({
                    code: "invalid_format",
                    format: "ipv6",
                    input: i.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        iZ = c("$ZodMAC", (t, n) => {
            null != n.pattern || (n.pattern = ti(n.delimiter)), ii.init(t, n)
        }),
        iA = c("$ZodCIDRv4", (t, n) => {
            null != n.pattern || (n.pattern = tr), ii.init(t, n)
        });

    function iP(t) {
        let n = t.split("/");
        if (2 !== n.length) return !1;
        let [i, r] = n;
        if (!r) return !1;
        let a = Number(r);
        return "".concat(a) === r && !(a < 0) && !(a > 128) && iD(i)
    }
    let ij = c("$ZodCIDRv6", (t, n) => {
        null != n.pattern || (n.pattern = ta), ii.init(t, n), t._zod.check = i => {
            iP(i.value) || i.issues.push({
                code: "invalid_format",
                format: "cidrv6",
                input: i.value,
                inst: t,
                continue: !n.abort
            })
        }
    });

    function i$(t) {
        if ("" === t) return !0;
        if (/\s/.test(t) || t.length % 4 != 0) return !1;
        try {
            return atob(t), !0
        } catch (t) {
            return !1
        }
    }
    let iE = /^[0-9a-zA-Z+/]*={0,2}$/,
        iT = c("$ZodBase64", (t, n) => {
            null != n.pattern || (n.pattern = iE), ii.init(t, n), t._zod.check = i => {
                i$(i.value) || i.issues.push({
                    code: "invalid_format",
                    format: "base64",
                    input: i.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        iL = /^[A-Za-z0-9_-]*$/;

    function iC(t) {
        if (!iL.test(t)) return !1;
        let n = t.replace(/[-_]/g, t => "-" === t ? "+" : "/");
        return i$(n.padEnd(4 * Math.ceil(n.length / 4), "="))
    }
    let iR = c("$ZodBase64URL", (t, n) => {
            null != n.pattern || (n.pattern = iL), ii.init(t, n), t._zod.check = i => {
                iC(i.value) || i.issues.push({
                    code: "invalid_format",
                    format: "base64url",
                    input: i.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        iJ = c("$ZodE164", (t, n) => {
            null != n.pattern || (n.pattern = td), ii.init(t, n)
        }),
        iM = /[- ]/g;

    function iV(t) {
        return !!tm.test(t) && function(t) {
            let n = t.length,
                i = 1,
                r = 0;
            for (; n;) {
                let a = t.charCodeAt(--n) - 48;
                i ^= 1, r += i ? [0, 2, 4, 6, 8, 1, 3, 5, 7, 9][a] : a
            }
            return r % 10 == 0
        }(t.replace(iM, ""))
    }
    let iF = c("$ZodCreditCard", (t, n) => {
        null != n.pattern || (n.pattern = tm), ii.init(t, n), t._zod.check = i => {
            iV(i.value) || i.issues.push({
                code: "invalid_format",
                format: "credit_card",
                input: i.value,
                inst: t,
                continue: !n.abort
            })
        }
    });

    function iB(t) {
        return !!tv.test(t) && function(t) {
            let n = 0,
                i = t.length;
            for (let r = 4; r < i; r++) {
                let i = t.charCodeAt(r);
                n = (i >= 65 ? 100 * n + (i - 55) : 10 * n + (i - 48)) % 97
            }
            for (let i = 0; i < 4; i++) {
                let r = t.charCodeAt(i);
                n = (r >= 65 ? 100 * n + (r - 55) : 10 * n + (r - 48)) % 97
            }
            return 1 === n
        }(t)
    }
    let iK = c("$ZodIBAN", (t, n) => {
        null != n.pattern || (n.pattern = tv), ii.init(t, n), t._zod.check = i => {
            iB(i.value) || i.issues.push({
                code: "invalid_format",
                format: "iban",
                input: i.value,
                inst: t,
                continue: !n.abort
            })
        }
    });

    function iW(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null;
        try {
            let i = t.split(".");
            if (3 !== i.length) return !1;
            let [r] = i;
            if (!r) return !1;
            let a = JSON.parse(atob(r));
            if ("typ" in a && (null == a ? void 0 : a.typ) !== "JWT" || !a.alg || n && (!("alg" in a) || a.alg !== n)) return !1;
            return !0
        } catch (t) {
            return !1
        }
    }
    let iG = c("$ZodJWT", (t, n) => {
            ii.init(t, n), t._zod.check = i => {
                iW(i.value, n.alg) || i.issues.push({
                    code: "invalid_format",
                    format: "jwt",
                    input: i.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        iX = c("$ZodCustomStringFormat", (t, n) => {
            ii.init(t, n), t._zod.check = i => {
                n.fn(i.value) || i.issues.push({
                    code: "invalid_format",
                    format: n.format,
                    input: i.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        iq = c("$ZodNumber", (t, n) => {
            n5.init(t, n), t._zod.pattern = tS, t._zod.parse = (i, r) => {
                if (n.coerce) try {
                    i.value = Number(i.value)
                } catch (t) {}
                let a = i.value;
                if ("number" == typeof a && !Number.isNaN(a) && Number.isFinite(a)) return i;
                let o = "number" == typeof a ? Number.isNaN(a) ? "NaN" : Number.isFinite(a) ? void 0 : String(a) : void 0;
                return i.issues.push({
                    expected: "number",
                    code: "invalid_type",
                    input: a,
                    inst: t,
                    ...o ? {
                        received: o
                    } : {}
                }), i
            }
        }),
        iH = c("$ZodNumberFormat", (t, n) => {
            nC.init(t, n), iq.init(t, n)
        }),
        iY = c("$ZodBoolean", (t, n) => {
            n5.init(t, n), t._zod.pattern = tx, t._zod.parse = (i, r) => {
                if (n.coerce) try {
                    i.value = !!i.value
                } catch (t) {}
                let a = i.value;
                return "boolean" == typeof a || i.issues.push({
                    expected: "boolean",
                    code: "invalid_type",
                    input: a,
                    inst: t
                }), i
            }
        }),
        iQ = c("$ZodBigInt", (t, n) => {
            n5.init(t, n), t._zod.pattern = tI, t._zod.parse = (i, r) => {
                if (n.coerce) try {
                    i.value = BigInt(i.value)
                } catch (t) {}
                return "bigint" == typeof i.value || i.issues.push({
                    expected: "bigint",
                    code: "invalid_type",
                    input: i.value,
                    inst: t
                }), i
            }
        }),
        i0 = c("$ZodBigIntFormat", (t, n) => {
            nR.init(t, n), iQ.init(t, n)
        }),
        i4 = c("$ZodSymbol", (t, n) => {
            n5.init(t, n), t._zod.parse = (n, i) => {
                let r = n.value;
                return "symbol" == typeof r || n.issues.push({
                    expected: "symbol",
                    code: "invalid_type",
                    input: r,
                    inst: t
                }), n
            }
        }),
        i6 = c("$ZodUndefined", (t, n) => {
            n5.init(t, n), t._zod.pattern = tU, t._zod.values = new Set([void 0]), t._zod.parse = (n, i) => {
                let r = n.value;
                return void 0 === r || n.issues.push({
                    expected: "undefined",
                    code: "invalid_type",
                    input: r,
                    inst: t
                }), n
            }
        }),
        i1 = c("$ZodNull", (t, n) => {
            n5.init(t, n), t._zod.pattern = tz, t._zod.values = new Set([null]), t._zod.parse = (n, i) => {
                let r = n.value;
                return null === r || n.issues.push({
                    expected: "null",
                    code: "invalid_type",
                    input: r,
                    inst: t
                }), n
            }
        }),
        i2 = c("$ZodAny", (t, n) => {
            n5.init(t, n), t._zod.parse = t => t
        }),
        i9 = c("$ZodUnknown", (t, n) => {
            n5.init(t, n), t._zod.parse = t => t
        }),
        i3 = c("$ZodNever", (t, n) => {
            n5.init(t, n), t._zod.parse = (n, i) => (n.issues.push({
                expected: "never",
                code: "invalid_type",
                input: n.value,
                inst: t
            }), n)
        }),
        i5 = c("$ZodVoid", (t, n) => {
            n5.init(t, n), t._zod.parse = (n, i) => {
                let r = n.value;
                return void 0 === r || n.issues.push({
                    expected: "void",
                    code: "invalid_type",
                    input: r,
                    inst: t
                }), n
            }
        }),
        i7 = c("$ZodDate", (t, n) => {
            n5.init(t, n), t._zod.parse = (i, r) => {
                if (n.coerce) try {
                    i.value = new Date(i.value)
                } catch (t) {}
                let a = i.value,
                    o = a instanceof Date;
                return o && !Number.isNaN(a.getTime()) || i.issues.push({
                    expected: "date",
                    code: "invalid_type",
                    input: a,
                    ...o ? {
                        received: "Invalid Date"
                    } : {},
                    inst: t
                }), i
            }
        });

    function i8(t, n, i) {
        t.issues.length && n.issues.push(...eh(i, t.issues)), n.value[i] = t.value
    }
    let re = c("$ZodArray", (t, n) => {
        n5.init(t, n);
        let i = d.memoizer;
        null == i || i.attach(t), t._zod.parse = (r, a) => {
            let o = r.value;
            if (!Array.isArray(o)) return r.issues.push({
                expected: "array",
                code: "invalid_type",
                input: o,
                inst: t
            }), r;
            r.value = i ? i.alloc(t, r, Array(o.length), a) : Array(o.length);
            let c = [],
                u = null == a ? void 0 : a.abortEarly;
            for (let t = 0; t < o.length; t++) {
                let i = o[t],
                    l = n.element._zod.run({
                        value: i,
                        issues: []
                    }, a);
                if (l instanceof Promise) c.push(l.then(n => i8(n, r, t)));
                else if (i8(l, r, t), u && 0 !== l.issues.length && ep(l)) break
            }
            return c.length ? Promise.all(c).then(() => r) : r
        }
    });

    function rt(t, n, i, r, a, o) {
        let c = i in r,
            u = "optional" === o;
        if (c || !u || "optional" !== a) {
            if (t.issues.length) {
                if (void 0 !== a && u && !c) return;
                n.issues.push(...eh(i, t.issues))
            }
            if (!c && void 0 === a) {
                t.issues.length || n.issues.push({
                    code: "invalid_type",
                    expected: "nonoptional",
                    input: void 0,
                    path: [i]
                });
                return
            }
            void 0 === t.value ? (c || "defaulted" === a && !u) && (n.value[i] = void 0) : n.value[i] = t.value
        }
    }
    let rn = [];

    function ri(t) {
        let n = Object.keys(t.shape),
            i = Object.getOwnPropertySymbols(t.shape),
            r = i.length ? i : rn,
            a = r.length ? [...n, ...r] : n;
        for (let n of a) {
            var o, c, u, l;
            if (!(null == (l = t.shape) || null == (u = l[n]) || null == (c = u._zod) || null == (o = c.traits) ? void 0 : o.has("$ZodType"))) throw Error('Invalid element at key "'.concat(String(n), '": expected a Zod schema'))
        }
        let s = ei(t.shape);
        return {
            ...t,
            allKeys: a,
            symbolKeys: r,
            keySet: new Set(n),
            numKeys: n.length,
            optionalKeys: new Set(s)
        }
    }

    function rr(t, n, i, r, a, o, c) {
        let u = [],
            l = a.keySet,
            s = a.catchall._zod,
            d = s.def.type,
            m = s.optin,
            f = s.optout,
            v = 0;
        for (let a in n) {
            if (c && i.issues.length !== v) {
                if (ep(i, v)) break;
                v = i.issues.length
            }
            if (l.has(a)) continue;
            if ("__proto__" === a) {
                "never" === d && u.push(a);
                continue
            }
            if ("never" === d) {
                u.push(a);
                continue
            }
            let o = s.run({
                value: n[a],
                issues: []
            }, r);
            o instanceof Promise ? t.push(o.then(t => rt(t, i, a, n, m, f))) : rt(o, i, a, n, m, f)
        }
        return (u.length && i.issues.push({
            code: "unrecognized_keys",
            keys: u,
            input: n,
            inst: o,
            continue: !0
        }), t.length) ? Promise.all(t).then(() => i) : i
    }
    let ra = c("$ZodObject", (t, n) => {
            var i;
            let r;
            n5.init(t, n);
            let a = Object.getOwnPropertyDescriptor(n, "shape"),
                o = (null == a ? void 0 : a.get) ? a.get.raw : null != (i = n.shape) ? i : {};
            if (o) {
                let t = () => {
                    let i = {
                        ...o
                    };
                    return Object.defineProperty(n, "shape", {
                        value: i
                    }), t.raw = i, i
                };
                t.raw = o, Object.defineProperty(n, "shape", {
                    get: t
                })
            }
            let c = w(() => ri(n));
            eJ(t, "propValues", t => {
                let n = t.def.shape,
                    i = {};
                for (let t in n) {
                    let r = n[t]._zod;
                    if (r.values) {
                        for (let n of (Object.prototype.hasOwnProperty.call(i, t) || O(i, t, new Set), r.values)) i[t].add(n);
                        void 0 !== r.optin && i[t].add(void 0)
                    }
                }
                return i
            });
            let u = n.catchall,
                l = d.memoizer;
            null == l || l.attach(t), t._zod.parse = (n, i) => {
                null != r || (r = c.value);
                let a = n.value;
                if (!F(a)) return n.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: a,
                    inst: t
                }), n;
                n.value = l ? l.alloc(t, n, {}, i) : {};
                let o = [],
                    s = r.shape,
                    d = null == i ? void 0 : i.abortEarly,
                    m = n.issues.length;
                for (let t of r.allKeys) {
                    if (d && n.issues.length !== m) {
                        if (ep(n, m)) break;
                        m = n.issues.length
                    }
                    if ("__proto__" === t) continue;
                    let r = s[t],
                        c = r._zod.optin,
                        u = r._zod.optout,
                        l = r._zod.run({
                            value: a[t],
                            issues: []
                        }, i);
                    l instanceof Promise ? o.push(l.then(i => rt(i, n, t, a, c, u))) : rt(l, n, t, a, c, u)
                }
                return u ? rr(o, a, n, i, c.value, t, !0 === d) : o.length ? Promise.all(o).then(() => n) : n
            }
        }),
        ro = c("$ZodObjectJIT", (t, n) => {
            let i, r;
            ra.init(t, n);
            let a = t._zod.parse,
                o = w(() => ri(n)),
                c = d.memoizer,
                u = !d.jitless,
                l = u && B.value,
                s = n.catchall;
            t._zod.parse = (d, m) => {
                null != r || (r = o.value);
                let f = d.value;
                return F(f) ? u && l && (null == m ? void 0 : m.async) === !1 && !0 !== m.jitless ? (i || (i = (n => {
                    let i = o.value,
                        r = i.symbolKeys,
                        a = new n9(["payload", "ctx"], {
                            shape: n,
                            inst: t,
                            memo: c,
                            syms: r
                        }),
                        u = t => "shape[".concat(t, "]._zod.run({ value: input[").concat(t, "], issues: [] }, ctx)"),
                        l = (t, n) => "\n          let ".concat(t, "_ab = false;\n          for (let i = 0; i < ").concat(t, ".issues.length; i++) {\n            const iss = ").concat(t, ".issues[i];\n            iss.path = iss.path ? [").concat(n, ", ...iss.path] : [").concat(n, "];\n            payload.issues.push(iss);\n            if (iss.continue !== true) ").concat(t, "_ab = true;\n          }\n          if (").concat(t, "_ab && ctx && ctx.abortEarly) {\n            payload.value = newResult;\n            return payload;\n          }");
                    a.write("const input = payload.value;");
                    let s = Object.create(null),
                        d = 0;
                    for (let t of i.allKeys) s[t] = "key_".concat(d++);
                    for (let t of (a.write(c ? "const newResult = memo.alloc(inst, payload, {}, ctx);" : "const newResult = {};"), i.allKeys)) {
                        var m, f;
                        if ("__proto__" === t) continue;
                        let i = s[t],
                            o = "symbol" == typeof t ? "syms[".concat(r.indexOf(t), "]") : J(t),
                            c = "".concat(o, " in input"),
                            d = n[t],
                            v = null == d || null == (m = d._zod) ? void 0 : m.optin,
                            p = void 0 !== v,
                            g = (null == d || null == (f = d._zod) ? void 0 : f.optout) === "optional";
                        if (a.write("const ".concat(i, " = ").concat(u(o), ";")), p && g) {
                            let t = "optional" === v ? "".concat(i, "_present") : "".concat(i, ".value !== undefined || ").concat(i, "_present");
                            a.write("\n        const ".concat(i, "_present = ").concat(c, ";\n        if (!").concat(i, ".issues.length || ").concat(i, "_present) {\n          if (").concat(i, ".issues.length) {").concat(l(i, o), "\n          }\n\n          if (").concat(t, ") {\n            newResult[").concat(o, "] = ").concat(i, ".value;\n          }\n        }\n\n      "))
                        } else p ? (a.write("\n        if (".concat(i, ".issues.length) {").concat(l(i, o), "\n        }\n      ")), "defaulted" === v ? a.write("newResult[".concat(o, "] = ").concat(i, ".value;")) : a.write("\n        if (".concat(i, ".value !== undefined || ").concat(c, ") {\n          newResult[").concat(o, "] = ").concat(i, ".value;\n        }\n      "))) : a.write("\n        const ".concat(i, "_present = ").concat(c, ";\n        if (").concat(i, ".issues.length) {").concat(l(i, o), "\n        }\n        if (!").concat(i, "_present && !").concat(i, '.issues.length) {\n          payload.issues.push({\n            code: "invalid_type",\n            expected: "nonoptional",\n            input: undefined,\n            path: [').concat(o, "]\n          });\n          if (ctx && ctx.abortEarly) {\n            payload.value = newResult;\n            return payload;\n          }\n        }\n\n        if (").concat(i, "_present) {\n          newResult[").concat(o, "] = ").concat(i, ".value;\n        }\n\n      "))
                    }
                    return a.write("payload.value = newResult;"), a.write("return payload;"), a.compile()
                })(n.shape)), d = i(d, m), s) ? rr([], f, d, m, r, t, (null == m ? void 0 : m.abortEarly) === !0) : d : a(d, m) : (d.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: f,
                    inst: t
                }), d)
            }
        });

    function rc(t, n, i, r) {
        for (let i of t)
            if (0 === i.issues.length) return n.value = i.value, n;
        let a = t.filter(t => !ep(t));
        return 1 === a.length ? (n.value = a[0].value, a[0]) : (n.issues.push({
            code: "invalid_union",
            input: n.value,
            inst: i,
            errors: t.map(t => t.issues.map(t => eb(t, r, m())))
        }), n)
    }
    let ru = c("$ZodUnion", (t, n) => {
        n5.init(t, n), eJ(t, "optin", t => t.def.options.some(t => "defaulted" === t._zod.optin) ? "defaulted" : t.def.options.some(t => void 0 !== t._zod.optin) ? "optional" : void 0), eJ(t, "optout", t => t.def.options.some(t => "optional" === t._zod.optout) ? "optional" : void 0), eJ(t, "values", t => {
            if (t.def.options.every(t => t._zod.values)) return new Set(t.def.options.flatMap(t => Array.from(t._zod.values)))
        }), eJ(t, "pattern", t => {
            if (t.def.options.every(t => t._zod.pattern)) {
                let n = t.def.options.map(t => t._zod.pattern);
                return new RegExp("^(".concat(n.map(t => x(t.source)).join("|"), ")$"))
            }
        });
        let i = 1 === n.options.length ? n.options[0]._zod.run : null;
        t._zod.parse = (r, a) => {
            if (i) return i(r, a);
            let o = !1,
                c = [];
            for (let t of n.options) {
                let n = t._zod.run({
                    value: r.value,
                    issues: []
                }, a);
                if (n instanceof Promise) c.push(n), o = !0;
                else {
                    if (0 === n.issues.length) return n;
                    c.push(n)
                }
            }
            return o ? Promise.all(c).then(n => rc(n, r, t, a)) : rc(c, r, t, a)
        }
    });

    function rl(t, n, i, r) {
        let a = [];
        for (let n = 0; n < t.length; n++) 0 === t[n].issues.length && a.push(n);
        return 1 === a.length ? n.value = t[a[0]].value : 0 === a.length ? n.issues.push({
            code: "invalid_union",
            input: n.value,
            inst: i,
            errors: t.map(t => t.issues.map(t => eb(t, r, m())))
        }) : n.issues.push({
            code: "invalid_union",
            input: n.value,
            inst: i,
            errors: [],
            inclusive: !1,
            matches: a
        }), n
    }
    let rs = c("$ZodXor", (t, n) => {
        ru.init(t, n), n.inclusive = !1;
        let i = 1 === n.options.length ? n.options[0]._zod.run : null;
        t._zod.parse = (r, a) => {
            if (i) return i(r, a);
            let o = !1,
                c = [];
            for (let t of n.options) {
                let n = t._zod.run({
                    value: r.value,
                    issues: []
                }, a);
                n instanceof Promise ? (c.push(n), o = !0) : c.push(n)
            }
            return o ? Promise.all(c).then(n => rl(n, r, t, a)) : rl(c, r, t, a)
        }
    });

    function rd(t, n) {
        let i = t._zod,
            r = i.bag.optionsMap;
        r || (r = rm(i.def), i.bag.optionsMap = r);
        let a = r.get(n);
        if (null === a) throw Error('Ambiguous discriminator value "'.concat(String(n), '"'));
        return a
    }

    function rm(t) {
        let n = new Map;
        for (let r of t.options) {
            var i;
            let a = null == (i = r._zod.propValues) ? void 0 : i[t.discriminator];
            if (!a || 0 === a.size) throw Error('Invalid discriminated union option at index "'.concat(t.options.indexOf(r), '"'));
            for (let t of a)
                if (n.has(t)) {
                    if (void 0 !== t) throw Error('Duplicate discriminator value "'.concat(String(t), '"'));
                    n.set(t, null)
                } else n.set(t, r)
        }
        return n
    }
    let rf = c("$ZodDiscriminatedUnion", (t, n) => {
            n.inclusive = !1, ru.init(t, n);
            let i = t._zod.parse;
            eJ(t, "propValues", t => {
                var n, i;
                let r = {},
                    a = 0;
                for (let n of t.def.options) {
                    let o = n._zod.propValues;
                    if (!o || 0 === Object.keys(o).length) throw Error('Invalid discriminated union option at index "'.concat(t.def.options.indexOf(n), '"'));
                    for (let [n, c] of((null == (i = o[t.def.discriminator]) ? void 0 : i.has(void 0)) && a++, Object.entries(o)))
                        for (let t of (Object.prototype.hasOwnProperty.call(r, n) || O(r, n, new Set), c)) r[n].add(t)
                }
                return !t.def.unionFallback && a > 1 && (null == (n = r[t.def.discriminator]) || n.delete(void 0)), r
            }), n.options.forEach((t, i) => {
                let r = Z(t._zod.def);
                if (r && !Object.prototype.hasOwnProperty.call(r, n.discriminator)) throw Error('Invalid discriminated union option at index "'.concat(i, '"'))
            });
            let r = w(() => rm(n));
            t._zod.parse = (a, o) => {
                let c = a.value;
                if (!F(c)) return a.issues.push({
                    code: "invalid_type",
                    expected: "object",
                    input: c,
                    inst: t
                }), a;
                let u = null == c ? void 0 : c[n.discriminator],
                    l = r.value.get(u);
                return l && (void 0 !== u || "backward" !== o.direction) ? l._zod.run(a, o) : n.unionFallback || "backward" === o.direction ? i(a, o) : (a.issues.push({
                    code: "invalid_union",
                    errors: [],
                    note: "No matching discriminator",
                    discriminator: n.discriminator,
                    options: Array.from(r.value.keys()).filter(t => null !== r.value.get(t)),
                    input: c,
                    path: [n.discriminator],
                    inst: t
                }), a)
            }
        }),
        rv = c("$ZodIntersection", (t, n) => {
            n5.init(t, n), t._zod.parse = (t, i) => {
                let r = t.value,
                    a = n.left._zod.run({
                        value: r,
                        issues: []
                    }, i),
                    o = n.right._zod.run({
                        value: r,
                        issues: []
                    }, i);
                return a instanceof Promise || o instanceof Promise ? Promise.all([a, o]).then(n => {
                    let [i, r] = n;
                    return rg(t, i, r)
                }) : rg(t, a, o)
            }
        });

    function rp(t, n) {
        if (t === n || t instanceof Date && n instanceof Date && +t == +n) return {
            valid: !0,
            data: t
        };
        if (K(t) && K(n)) {
            let i = Object.keys(n),
                r = Object.keys(t).filter(t => -1 !== i.indexOf(t)),
                a = {
                    ...t,
                    ...n
                };
            for (let i of (Object.prototype.hasOwnProperty.call(a, "__proto__") && delete a.__proto__, r)) {
                if ("__proto__" === i) continue;
                let r = rp(t[i], n[i]);
                if (!r.valid) return {
                    valid: !1,
                    mergeErrorPath: [i, ...r.mergeErrorPath]
                };
                a[i] = r.data
            }
            return {
                valid: !0,
                data: a
            }
        }
        if (Array.isArray(t) && Array.isArray(n)) {
            if (t.length !== n.length) return {
                valid: !1,
                mergeErrorPath: []
            };
            let i = [];
            for (let r = 0; r < t.length; r++) {
                let a = rp(t[r], n[r]);
                if (!a.valid) return {
                    valid: !1,
                    mergeErrorPath: [r, ...a.mergeErrorPath]
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
    }

    function rg(t, n, i) {
        let r, a = new Map,
            o = new Map,
            c = (t, n) => {
                var i, c;
                let u;
                if ("unrecognized_keys" !== t.code || (null == (i = t.path) ? void 0 : i.length))
                    if ("invalid_key" !== t.code || "record" !== t.origin || (null == (c = t.path) ? void 0 : c.length) !== 1) return !1;
                    else {
                        let n = String(t.path[0]);
                        o.has(n) || o.set(n, t), u = [n]
                    }
                else null != r || (r = t), u = t.keys;
                for (let t of u) a.has(t) || a.set(t, {}), a.get(t)[n] = !0;
                return !0
            };
        for (let i of n.issues) c(i, "l") || t.issues.push(i);
        for (let n of i.issues) c(n, "r") || t.issues.push(n);
        let u = [...a].filter(t => {
            let [, n] = t;
            return n.l && n.r
        }).map(t => {
            let [n] = t;
            return n
        });
        if (u.length) {
            let n = r ? u.filter(t => r.keys.includes(t)) : [];
            for (let i of (n.length && t.issues.push({
                    ...r,
                    keys: n
                }), u)) !n.includes(i) && o.has(i) && t.issues.push(o.get(i))
        }
        let l = rp(n.value, i.value);
        if (!l.valid) {
            if (ep(t)) return t;
            throw Error("Unmergable intersection. Error path: " + "".concat(JSON.stringify(l.mergeErrorPath)))
        }
        return t.value = l.data, t
    }
    let rh = c("$ZodTuple", (t, n) => {
        n5.init(t, n);
        let i = n.items,
            r = d.memoizer;
        null == r || r.attach(t), t._zod.parse = (a, o) => {
            let c = a.value;
            if (!Array.isArray(c)) return a.issues.push({
                input: c,
                inst: t,
                expected: "tuple",
                code: "invalid_type"
            }), a;
            a.value = r ? r.alloc(t, a, [], o) : [];
            let u = [],
                l = ry(i, "optin"),
                s = ry(i, "optout");
            if (!n.rest) {
                if (c.length < l) return a.issues.push({
                    code: "too_small",
                    minimum: l,
                    inclusive: !0,
                    input: c,
                    inst: t,
                    origin: "array"
                }), a;
                c.length > i.length && a.issues.push({
                    code: "too_big",
                    maximum: i.length,
                    inclusive: !0,
                    input: c,
                    inst: t,
                    origin: "array"
                })
            }
            let d = Array(i.length),
                m = n.rest ? null == o ? void 0 : o.abortEarly : void 0,
                f = !1;
            for (let t = 0; t < i.length; t++) {
                let n = i[t]._zod.run({
                    value: c[t],
                    issues: []
                }, o);
                n instanceof Promise ? u.push(n.then(n => {
                    d[t] = n
                })) : (d[t] = n, m && !f && n.issues.length && (f = ep(n)))
            }
            if (n.rest && !f) {
                let t = i.length - 1,
                    r = c.slice(i.length),
                    l = a.issues.length;
                for (let i of r) {
                    if (m && a.issues.length !== l) {
                        if (ep(a, l)) break;
                        l = a.issues.length
                    }
                    t++;
                    let r = n.rest._zod.run({
                        value: i,
                        issues: []
                    }, o);
                    r instanceof Promise ? u.push(r.then(n => r_(n, a, t))) : r_(r, a, t)
                }
            }
            return u.length ? Promise.all(u).then(() => rb(d, a, i, c, s)) : rb(d, a, i, c, s)
        }
    });

    function ry(t, n) {
        for (let i = t.length - 1; i >= 0; i--)
            if (!("optin" === n ? void 0 !== t[i]._zod.optin : "optional" === t[i]._zod.optout)) return i + 1;
        return 0
    }

    function r_(t, n, i) {
        t.issues.length && n.issues.push(...eh(i, t.issues)), n.value[i] = t.value
    }

    function rb(t, n, i, r, a) {
        for (let o = 0; o < i.length; o++) {
            let c = t[o],
                u = o < r.length;
            if (!u && o >= a && "optional" === i[o]._zod.optin) {
                n.value.length = o;
                break
            }
            if (c.issues.length) {
                if (!u && o >= a) {
                    n.value.length = o;
                    break
                }
                n.issues.push(...eh(o, c.issues))
            }
            n.value[o] = c.value
        }
        for (let t = n.value.length - 1; t >= r.length; t--)
            if ("optional" === i[t]._zod.optout && void 0 === n.value[t]) n.value.length = t;
            else break;
        return n
    }
    let rk = c("$ZodRecord", (t, n) => {
            n5.init(t, n);
            let i = d.memoizer;
            null == i || i.attach(t), t._zod.parse = (r, a) => {
                let o = r.value;
                if (!K(o)) return r.issues.push({
                    expected: "record",
                    code: "invalid_type",
                    input: o,
                    inst: t
                }), r;
                let c = [],
                    u = n.keyType._zod.values;
                if (u && !n.partial) {
                    let l;
                    r.value = i ? i.alloc(t, r, {}, a) : {};
                    let s = new Set;
                    for (let i of u)
                        if ("string" == typeof i || "number" == typeof i || "symbol" == typeof i) {
                            if (s.add("number" == typeof i ? i.toString() : i), "__proto__" === i) continue;
                            let u = n.keyType._zod.run({
                                value: i,
                                issues: []
                            }, a);
                            if (u instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                            if (u.issues.length) {
                                r.issues.push({
                                    code: "invalid_key",
                                    origin: "record",
                                    issues: u.issues.map(t => eb(t, a, m())),
                                    input: i,
                                    path: [i],
                                    inst: t
                                });
                                continue
                            }
                            let l = u.value;
                            if ("__proto__" === l) continue;
                            let d = n.valueType._zod.run({
                                value: o[i],
                                issues: []
                            }, a);
                            d instanceof Promise ? c.push(d.then(t => {
                                t.issues.length && r.issues.push(...eh(i, t.issues)), r.value[l] = t.value
                            })) : (d.issues.length && r.issues.push(...eh(i, d.issues)), r.value[l] = d.value)
                        } for (let t in o)
                        if (!s.has(t))
                            if ("loose" === n.mode) {
                                if ("__proto__" === t) continue;
                                r.value[t] = o[t]
                            } else(l = null != l ? l : []).push(t);
                    l && l.length > 0 && r.issues.push({
                        code: "unrecognized_keys",
                        input: o,
                        inst: t,
                        keys: l,
                        continue: !0
                    })
                } else {
                    let l;
                    for (let s of (r.value = i ? i.alloc(t, r, {}, a) : {}, Reflect.ownKeys(o))) {
                        if ("__proto__" === s || !Object.prototype.propertyIsEnumerable.call(o, s)) continue;
                        let i = n.keyType._zod.run({
                            value: s,
                            issues: []
                        }, a);
                        if (i instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                        if ("string" == typeof s && tS.test(s) && i.issues.length) {
                            let t = n.keyType._zod.run({
                                value: Number(s),
                                issues: []
                            }, a);
                            if (t instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                            0 === t.issues.length && (i = t)
                        }
                        if (i.issues.length) {
                            "loose" === n.mode ? r.value[s] = o[s] : u ? (l = null != l ? l : []).push(s) : r.issues.push({
                                code: "invalid_key",
                                origin: "record",
                                issues: i.issues.map(t => eb(t, a, m())),
                                input: s,
                                path: [s],
                                inst: t
                            });
                            continue
                        }
                        let d = i.value;
                        if ("__proto__" === d) continue;
                        let f = n.valueType._zod.run({
                            value: o[s],
                            issues: []
                        }, a);
                        f instanceof Promise ? c.push(f.then(t => {
                            t.issues.length && r.issues.push(...eh(s, t.issues)), r.value[d] = t.value
                        })) : (f.issues.length && r.issues.push(...eh(s, f.issues)), r.value[d] = f.value)
                    }
                    l && l.length > 0 && r.issues.push({
                        code: "unrecognized_keys",
                        input: o,
                        inst: t,
                        keys: l,
                        continue: !0
                    })
                }
                return c.length ? Promise.all(c).then(() => r) : r
            }
        }),
        rI = c("$ZodMap", (t, n) => {
            n5.init(t, n);
            let i = d.memoizer;
            null == i || i.attach(t), t._zod.parse = (r, a) => {
                let o = r.value;
                if (!(o instanceof Map)) return r.issues.push({
                    expected: "map",
                    code: "invalid_type",
                    input: o,
                    inst: t
                }), r;
                let c = [];
                r.value = i ? i.alloc(t, r, new Map, a) : new Map;
                let u = null == a ? void 0 : a.abortEarly,
                    l = r.issues.length;
                for (let [i, s] of o) {
                    if (u && r.issues.length !== l) {
                        if (ep(r, l)) break;
                        l = r.issues.length
                    }
                    let d = n.keyType._zod.run({
                            value: i,
                            issues: []
                        }, a),
                        m = n.valueType._zod.run({
                            value: s,
                            issues: []
                        }, a);
                    d instanceof Promise || m instanceof Promise ? c.push(Promise.all([d, m]).then(n => {
                        let [c, u] = n;
                        rw(c, u, r, i, o, t, a)
                    })) : rw(d, m, r, i, o, t, a)
                }
                return c.length ? Promise.all(c).then(() => r) : r
            }
        });

    function rw(t, n, i, r, a, o, c) {
        t.issues.length && (q.has(typeof r) ? i.issues.push(...eh(r, t.issues)) : i.issues.push({
            code: "invalid_key",
            origin: "map",
            input: a,
            inst: o,
            issues: t.issues.map(t => eb(t, c, m()))
        })), n.issues.length && (q.has(typeof r) ? i.issues.push(...eh(r, n.issues)) : i.issues.push({
            origin: "map",
            code: "invalid_element",
            input: a,
            inst: o,
            key: r,
            issues: n.issues.map(t => eb(t, c, m()))
        })), i.value.set(t.value, n.value)
    }
    let rS = c("$ZodSet", (t, n) => {
        n5.init(t, n);
        let i = d.memoizer;
        null == i || i.attach(t), t._zod.parse = (r, a) => {
            let o = r.value;
            if (!(o instanceof Set)) return r.issues.push({
                input: o,
                inst: t,
                expected: "set",
                code: "invalid_type"
            }), r;
            let c = [];
            r.value = i ? i.alloc(t, r, new Set, a) : new Set;
            let u = null == a ? void 0 : a.abortEarly,
                l = r.issues.length;
            for (let t of o) {
                if (u && r.issues.length !== l) {
                    if (ep(r, l)) break;
                    l = r.issues.length
                }
                let i = n.valueType._zod.run({
                    value: t,
                    issues: []
                }, a);
                i instanceof Promise ? c.push(i.then(t => rx(t, r))) : rx(i, r)
            }
            return c.length ? Promise.all(c).then(() => r) : r
        }
    });

    function rx(t, n) {
        t.issues.length && n.issues.push(...t.issues), n.value.add(t.value)
    }
    let rz = c("$ZodEnum", (t, n) => {
            n5.init(t, n);
            let i = _(n.entries),
                r = new Set(i);
            t._zod.values = r, eJ(t, "pattern", t => {
                let n = _(t.def.entries).filter(t => q.has(typeof t));
                return new RegExp(n.length ? "^(".concat(n.map(t => Y(t.toString())).join("|"), ")$") : "^[^\\s\\S]$")
            }), t._zod.parse = (n, a) => {
                let o = n.value;
                return r.has(o) || n.issues.push({
                    code: "invalid_value",
                    values: i,
                    input: o,
                    inst: t
                }), n
            }
        }),
        rU = c("$ZodLiteral", (t, n) => {
            n5.init(t, n);
            let i = new Set(n.values);
            t._zod.values = i, eJ(t, "pattern", t => {
                let n = t.def.values;
                return new RegExp(n.length ? "^(".concat(n.map(t => "string" == typeof t ? Y(t) : t ? Y(t.toString()) : String(t)).join("|"), ")$") : "^[^\\s\\S]$")
            }), t._zod.parse = (r, a) => {
                let o = r.value;
                return i.has(o) || r.issues.push({
                    code: "invalid_value",
                    values: n.values,
                    input: o,
                    inst: t
                }), r
            }
        }),
        rN = c("$ZodFile", (t, n) => {
            n5.init(t, n), t._zod.parse = (n, i) => {
                let r = n.value;
                return r instanceof File || n.issues.push({
                    expected: "file",
                    code: "invalid_type",
                    input: r,
                    inst: t
                }), n
            }
        }),
        rD = c("$ZodTransform", (t, n) => {
            var i;
            n5.init(t, n), t._zod.optin = "optional", null == (i = d.memoizer) || i.guard(t), t._zod.parse = (i, r) => {
                if ("backward" === r.direction) throw new s(t.constructor.name);
                let a = n.transform(i.value, i);
                if (r.async) return (a instanceof Promise ? a : Promise.resolve(a)).then(t => (i.value = t, i));
                if (a instanceof Promise) throw new l;
                return i.value = a, i
            }
        });

    function rO(t, n) {
        return t.value = n.issues.length ? void 0 : n.value, t
    }
    let rZ = c("$ZodOptional", (t, n) => {
            n5.init(t, n), eJ(t, "optin", t => "defaulted" === t.def.innerType._zod.optin ? "defaulted" : "optional"), t._zod.optout = "optional", eJ(t, "values", t => {
                let n = t.def.innerType._zod.values;
                return n ? new Set([...n, void 0]) : void 0
            }), eJ(t, "pattern", t => {
                let n = t.def.innerType._zod.pattern;
                return n ? new RegExp("^(".concat(x(n.source), ")?$")) : void 0
            }), t._zod.parse = (t, i) => {
                if (void 0 === t.value) {
                    if ("defaulted" !== n.innerType._zod.optin) return t;
                    let r = n.innerType._zod.run({
                        value: t.value,
                        issues: []
                    }, i);
                    return r instanceof Promise ? r.then(n => rO(t, n)) : rO(t, r)
                }
                return n.innerType._zod.run(t, i)
            }
        }),
        rA = c("$ZodExactOptional", (t, n) => {
            rZ.init(t, n), eJ(t, "values", t => t.def.innerType._zod.values), eJ(t, "pattern", t => t.def.innerType._zod.pattern), t._zod.parse = (t, i) => n.innerType._zod.run(t, i)
        }),
        rP = c("$ZodNullable", (t, n) => {
            n5.init(t, n), eJ(t, "optin", t => t.def.innerType._zod.optin), eJ(t, "optout", t => t.def.innerType._zod.optout), eJ(t, "pattern", t => {
                let n = t.def.innerType._zod.pattern;
                return n ? new RegExp("^(".concat(x(n.source), "|null)$")) : void 0
            }), eJ(t, "values", t => t.def.innerType._zod.values ? new Set([...t.def.innerType._zod.values, null]) : void 0), t._zod.parse = (t, i) => null === t.value ? t : n.innerType._zod.run(t, i)
        }),
        rj = c("$ZodDefault", (t, n) => {
            n5.init(t, n), t._zod.optin = "defaulted", eJ(t, "values", t => t.def.innerType._zod.values), t._zod.parse = (t, i) => {
                if ("backward" === i.direction) return n.innerType._zod.run(t, i);
                if (void 0 === t.value) return t.value = n.defaultValue, t;
                let r = n.innerType._zod.run(t, i);
                return r instanceof Promise ? r.then(t => r$(t, n)) : r$(r, n)
            }
        });

    function r$(t, n) {
        return void 0 === t.value && (t.value = n.defaultValue), t
    }
    let rE = c("$ZodPrefault", (t, n) => {
            n5.init(t, n), t._zod.optin = "defaulted", eJ(t, "values", t => t.def.innerType._zod.values), t._zod.parse = (t, i) => ("backward" === i.direction || void 0 === t.value && (t.value = n.defaultValue), n.innerType._zod.run(t, i))
        }),
        rT = c("$ZodNonOptional", (t, n) => {
            n5.init(t, n), eJ(t, "values", t => {
                let n = t.def.innerType._zod.values;
                return n ? new Set([...n].filter(t => void 0 !== t)) : void 0
            }), t._zod.parse = (i, r) => {
                let a = n.innerType._zod.run(i, r);
                return a instanceof Promise ? a.then(n => rL(n, t)) : rL(a, t)
            }
        });

    function rL(t, n) {
        return t.issues.length || void 0 !== t.value || t.issues.push({
            code: "invalid_type",
            expected: "nonoptional",
            input: t.value,
            inst: n
        }), t
    }
    let rC = c("$ZodSuccess", (t, n) => {
        n5.init(t, n), t._zod.parse = (t, i) => {
            if ("backward" === i.direction) throw new s("ZodSuccess");
            let r = n.innerType._zod.run(t, i);
            return r instanceof Promise ? r.then(n => (t.value = 0 === n.issues.length, t)) : (t.value = 0 === r.issues.length, t)
        }
    });

    function rR(t, n, i, r) {
        return n.issues.length ? t.value = i.catchValue({
            ...n,
            value: t.value,
            error: {
                issues: n.issues.map(t => eb(t, r, m()))
            },
            input: t.value
        }) : (t.value = n.value, n.memo && (t.memo = !0)), t
    }
    let rJ = c("$ZodCatch", (t, n) => {
            n5.init(t, n), eJ(t, "optin", t => "defaulted" === t.def.innerType._zod.optin ? "defaulted" : "optional"), eJ(t, "optout", t => t.def.innerType._zod.optout), eJ(t, "values", t => t.def.innerType._zod.values), t._zod.parse = (t, i) => {
                if ("backward" === i.direction) return n.innerType._zod.run(t, i);
                let r = n.innerType._zod.run({
                    value: t.value,
                    issues: []
                }, i);
                return r instanceof Promise ? r.then(r => rR(t, r, n, i)) : rR(t, r, n, i)
            }
        }),
        rM = c("$ZodNaN", (t, n) => {
            n5.init(t, n), t._zod.parse = (n, i) => ("number" == typeof n.value && Number.isNaN(n.value) || n.issues.push({
                input: n.value,
                inst: t,
                expected: "nan",
                code: "invalid_type"
            }), n)
        }),
        rV = c("$ZodPipe", (t, n) => {
            n5.init(t, n), eJ(t, "values", t => t.def.in._zod.values), eJ(t, "optin", t => t.def.in._zod.optin), eJ(t, "optout", t => t.def.out._zod.optout), eJ(t, "propValues", t => t.def.in._zod.propValues), t._zod.parse = (t, i) => {
                if ("backward" === i.direction) {
                    let r = n.out._zod.run(t, i);
                    return r instanceof Promise ? r.then(t => rF(t, n.in, i)) : rF(r, n.in, i)
                }
                let r = n.in._zod.run(t, i);
                return r instanceof Promise ? r.then(t => rF(t, n.out, i)) : rF(r, n.out, i)
            }
        });

    function rF(t, n, i) {
        return t.issues.some(t => "unrecognized_keys" !== t.code) ? (t.aborted = !0, t) : n._zod.run({
            value: t.value,
            issues: t.issues
        }, i)
    }
    let rB = c("$ZodCodec", (t, n) => {
        n5.init(t, n), eJ(t, "values", t => t.def.in._zod.values), eJ(t, "optin", t => t.def.in._zod.optin), eJ(t, "optout", t => t.def.out._zod.optout), eJ(t, "propValues", t => t.def.in._zod.propValues), t._zod.parse = (t, i) => {
            if ("forward" === (i.direction || "forward")) {
                let r = n.in._zod.run(t, i);
                return r instanceof Promise ? r.then(t => rK(t, n, i)) : rK(r, n, i)
            } {
                let r = n.out._zod.run(t, i);
                return r instanceof Promise ? r.then(t => rK(t, n, i)) : rK(r, n, i)
            }
        }
    });

    function rK(t, n, i) {
        if (t.issues.length) return t.aborted = !0, t;
        if ("forward" === (i.direction || "forward")) {
            let r = n.transform(t.value, t);
            return r instanceof Promise ? r.then(r => rW(t, r, n.out, i)) : rW(t, r, n.out, i)
        } {
            let r = n.reverseTransform(t.value, t);
            return r instanceof Promise ? r.then(r => rW(t, r, n.in, i)) : rW(t, r, n.in, i)
        }
    }

    function rW(t, n, i, r) {
        return t.issues.length ? (t.aborted = !0, t) : i._zod.run({
            value: n,
            issues: t.issues
        }, r)
    }
    let rG = c("$ZodPreprocess", (t, n) => {
            rV.init(t, n)
        }),
        rX = c("$ZodReadonly", (t, n) => {
            n5.init(t, n), eJ(t, "propValues", t => t.def.innerType._zod.propValues), eJ(t, "values", t => t.def.innerType._zod.values), eJ(t, "optin", t => {
                var n, i;
                return null == (i = t.def.innerType) || null == (n = i._zod) ? void 0 : n.optin
            }), eJ(t, "optout", t => {
                var n, i;
                return null == (i = t.def.innerType) || null == (n = i._zod) ? void 0 : n.optout
            }), t._zod.parse = (t, i) => {
                if ("backward" === i.direction) return n.innerType._zod.run(t, i);
                let r = n.innerType._zod.run(t, i);
                return r instanceof Promise ? r.then(rq) : rq(r)
            }
        });

    function rq(t) {
        return t.memo || (t.value = Object.freeze(t.value)), t
    }
    let rH = c("$ZodTemplateLiteral", (t, n) => {
            n5.init(t, n);
            let i = [];
            for (let t of n.parts)
                if ("object" == typeof t && null !== t) {
                    let n = function t(n) {
                        var i, r, a;
                        let o = n._zod.def,
                            c = null == (r = n._zod.pattern) ? void 0 : r.source,
                            u = null != (i = o.innerType) ? i : n._zod.innerType;
                        if (u) {
                            let n = null == (a = u._zod.pattern) ? void 0 : a.source,
                                i = t(u);
                            return c && n && i && i !== n ? c.replace(x(n), () => x(i)) : c
                        }
                        if (o.options) {
                            let n = o.options.map(t);
                            if (n.every(Boolean)) return "^(".concat(n.map(t => x(t)).join("|"), ")$")
                        }
                        return function(t) {
                            var n, i, r, a, o, c;
                            let u, l, s = t._zod.def,
                                d = s.pattern,
                                m = !!(null == (i = s.format) ? void 0 : i.includes("int"));
                            for (let t of null != (n = s.checks) ? n : []) {
                                let n = t._zod.def;
                                n.pattern && (d = n.pattern), m || (m = !!(null == (c = n.format) ? void 0 : c.includes("int")));
                                let i = null != (a = n.minimum) ? a : n.length,
                                    r = null != (o = n.maximum) ? o : n.length;
                                void 0 !== i && (void 0 === u || i > u) && (u = i), void 0 !== r && (void 0 === l || r < l) && (l = r)
                            }
                            if (d) return d.source;
                            if (void 0 !== u && void 0 !== l && u > l) return "(?!)";
                            if (void 0 !== u || void 0 !== l) return tk({
                                minimum: u,
                                maximum: l
                            }).source;
                            let f = t._zod.pattern;
                            return null == (r = m && f === tS ? tw : f) ? void 0 : r.source
                        }(n)
                    }(t);
                    if (!n) throw Error("Invalid template literal part, no pattern found: ".concat([...t._zod.traits].shift()));
                    i.push(x(n))
                } else if (null === t || H.has(typeof t)) i.push(Y("".concat(t)));
            else throw Error("Invalid template literal part: ".concat(t));
            t._zod.pattern = new RegExp("^".concat(i.join(""), "$")), t._zod.parse = (i, r) => {
                if ("string" != typeof i.value) return i.issues.push({
                    input: i.value,
                    inst: t,
                    expected: "string",
                    code: "invalid_type"
                }), i;
                if (t._zod.pattern.lastIndex = 0, !t._zod.pattern.test(i.value)) {
                    var a;
                    i.issues.push({
                        input: i.value,
                        inst: t,
                        code: "invalid_format",
                        format: null != (a = n.format) ? a : "template_literal",
                        pattern: t._zod.pattern.source
                    })
                }
                return i
            }
        }),
        rY = c("$ZodFunction", (t, n) => (n5.init(t, n), Object.defineProperty(t, "_def", {
            value: n
        }), t._zod.def = n, t.implement = n => {
            if ("function" != typeof n) throw Error("implement() must be called with a function");
            return Object.defineProperty(function() {
                for (var i = arguments.length, r = Array(i), a = 0; a < i; a++) r[a] = arguments[a];
                let o = Reflect.apply(n, this, t._def.input ? nr(t._def.input, r) : r);
                return t._def.output ? nr(t._def.output, o) : o
            }, "_zod", {
                value: t._zod,
                enumerable: !1
            })
        }, t.implementAsync = n => {
            if ("function" != typeof n) throw Error("implementAsync() must be called with a function");
            return Object.defineProperty(async function() {
                for (var i = arguments.length, r = Array(i), a = 0; a < i; a++) r[a] = arguments[a];
                let o = t._def.input ? await no(t._def.input, r) : r,
                    c = await Reflect.apply(n, this, o);
                return t._def.output ? await no(t._def.output, c) : c
            }, "_zod", {
                value: t._zod,
                enumerable: !1
            })
        }, t._zod.parse = (n, i) => ("function" != typeof n.value ? n.issues.push({
            code: "invalid_type",
            expected: "function",
            input: n.value,
            inst: t
        }) : t._def.output && "promise" === t._def.output._zod.def.type ? n.value = t.implementAsync(n.value) : n.value = t.implement(n.value), n), t.input = function() {
            for (var n = arguments.length, i = Array(n), r = 0; r < n; r++) i[r] = arguments[r];
            let a = t.constructor;
            return new a(Array.isArray(i[0]) ? {
                type: "function",
                input: new rh({
                    type: "tuple",
                    items: i[0],
                    rest: i[1]
                }),
                output: t._def.output
            } : {
                type: "function",
                input: i[0],
                output: t._def.output
            })
        }, t.output = n => new t.constructor({
            type: "function",
            input: t._def.input,
            output: n
        }), t)),
        rQ = c("$ZodPromise", (t, n) => {
            n5.init(t, n), t._zod.parse = (t, i) => Promise.resolve(t.value).then(t => n.innerType._zod.run({
                value: t,
                issues: []
            }, i))
        }),
        r0 = c("$ZodLazy", (t, n) => {
            n5.init(t, n), N(t._zod, "innerType", () => (n._cachedInner || (n._cachedInner = n.getter()), n._cachedInner)), eJ(t, "pattern", t => {
                var n, i;
                return null == (i = t.innerType) || null == (n = i._zod) ? void 0 : n.pattern
            }), eJ(t, "propValues", t => {
                var n, i;
                return null == (i = t.innerType) || null == (n = i._zod) ? void 0 : n.propValues
            }), eJ(t, "optin", t => {
                var n, i, r;
                return null != (n = null == (r = t.innerType) || null == (i = r._zod) ? void 0 : i.optin) ? n : void 0
            }), eJ(t, "optout", t => {
                var n, i, r;
                return null != (n = null == (r = t.innerType) || null == (i = r._zod) ? void 0 : i.optout) ? n : void 0
            }), t._zod.parse = (n, i) => t._zod.innerType._zod.run(n, i)
        }),
        r4 = c("$ZodCustom", (t, n) => {
            nA.init(t, n), n5.init(t, n), t._zod.parse = (t, n) => t, t._zod.check = i => {
                let r = i.value,
                    a = n.fn(r);
                if (a instanceof Promise) return a.then(n => r6(n, i, r, t));
                r6(a, i, r, t)
            }
        });

    function r6(t, n, i, r) {
        if (!t) {
            var a;
            let t = {
                code: "custom",
                input: i,
                inst: r,
                path: [...null != (a = r._zod.def.path) ? a : []],
                continue: !r._zod.def.abort
            };
            r._zod.def.params && (t.params = r._zod.def.params), n.issues.push(ez(t))
        }
    }
    t.s(["$ZodAny", 0, i2, "$ZodArray", 0, re, "$ZodBase64", 0, iT, "$ZodBase64URL", 0, iR, "$ZodBigInt", 0, iQ, "$ZodBigIntFormat", 0, i0, "$ZodBoolean", 0, iY, "$ZodCIDRv4", 0, iA, "$ZodCIDRv6", 0, ij, "$ZodCUID", 0, iy, "$ZodCUID2", 0, i_, "$ZodCatch", 0, rJ, "$ZodCodec", 0, rB, "$ZodCreditCard", 0, iF, "$ZodCustom", 0, r4, "$ZodCustomStringFormat", 0, iX, "$ZodDate", 0, i7, "$ZodDefault", 0, rj, "$ZodDiscriminatedUnion", 0, rf, "$ZodE164", 0, iJ, "$ZodEmail", 0, io, "$ZodEmoji", 0, ig, "$ZodEnum", 0, rz, "$ZodExactOptional", 0, rA, "$ZodFile", 0, rN, "$ZodFunction", 0, rY, "$ZodGUID", 0, ir, "$ZodIBAN", 0, iK, "$ZodIPv4", 0, iU, "$ZodIPv6", 0, iO, "$ZodISODate", 0, iS, "$ZodISODateTime", 0, iw, "$ZodISODuration", 0, iz, "$ZodISOTime", 0, ix, "$ZodIntersection", 0, rv, "$ZodJWT", 0, iG, "$ZodKSUID", 0, iI, "$ZodLazy", 0, r0, "$ZodLiteral", 0, rU, "$ZodMAC", 0, iZ, "$ZodMap", 0, rI, "$ZodNaN", 0, rM, "$ZodNanoID", 0, ih, "$ZodNever", 0, i3, "$ZodNonOptional", 0, rT, "$ZodNull", 0, i1, "$ZodNullable", 0, rP, "$ZodNumber", 0, iq, "$ZodNumberFormat", 0, iH, "$ZodObject", 0, ra, "$ZodObjectJIT", 0, ro, "$ZodOptional", 0, rZ, "$ZodPipe", 0, rV, "$ZodPrefault", 0, rE, "$ZodPreprocess", 0, rG, "$ZodPromise", 0, rQ, "$ZodReadonly", 0, rX, "$ZodRecord", 0, rk, "$ZodSet", 0, rS, "$ZodString", 0, it, "$ZodStringFormat", 0, ii, "$ZodSuccess", 0, rC, "$ZodSymbol", 0, i4, "$ZodTemplateLiteral", 0, rH, "$ZodTransform", 0, rD, "$ZodTuple", 0, rh, "$ZodType", 0, n5, "$ZodULID", 0, ib, "$ZodURL", 0, ip, "$ZodUUID", 0, ia, "$ZodUndefined", 0, i6, "$ZodUnion", 0, ru, "$ZodUnknown", 0, i9, "$ZodVoid", 0, i5, "$ZodXID", 0, ik, "$ZodXor", 0, rs, "URL_BAD_FORMAT", 0, 1, "URL_UNPARSEABLE", 0, 2, "base64Charset", 0, iE, "base64urlCharset", 0, iL, "canParseURL", 0, ic, "getDiscriminatedOption", 0, rd, "isValidBase64", 0, i$, "isValidBase64URL", 0, iC, "isValidCIDRv6", 0, iP, "isValidCreditCard", 0, iV, "isValidIBAN", 0, iB, "isValidIPv6", 0, iD, "isValidJWT", 0, iW, "mergeValues", 0, rp, "parseURLObject", 0, il, "standardProps", 0, ie, "stripTabAndNewline", 0, id, "urlHostnameOk", 0, im, "urlProtocolOk", 0, iv, "validateURL", 0, iu], 61856), t.i(61856), t.s(["$ZodAny", 0, i2, "$ZodArray", 0, re, "$ZodBase64", 0, iT, "$ZodBase64URL", 0, iR, "$ZodBigInt", 0, iQ, "$ZodBigIntFormat", 0, i0, "$ZodBoolean", 0, iY, "$ZodCIDRv4", 0, iA, "$ZodCIDRv6", 0, ij, "$ZodCUID", 0, iy, "$ZodCUID2", 0, i_, "$ZodCatch", 0, rJ, "$ZodCodec", 0, rB, "$ZodCreditCard", 0, iF, "$ZodCustom", 0, r4, "$ZodCustomStringFormat", 0, iX, "$ZodDate", 0, i7, "$ZodDefault", 0, rj, "$ZodDiscriminatedUnion", 0, rf, "$ZodE164", 0, iJ, "$ZodEmail", 0, io, "$ZodEmoji", 0, ig, "$ZodEnum", 0, rz, "$ZodExactOptional", 0, rA, "$ZodFile", 0, rN, "$ZodFunction", 0, rY, "$ZodGUID", 0, ir, "$ZodIBAN", 0, iK, "$ZodIPv4", 0, iU, "$ZodIPv6", 0, iO, "$ZodISODate", 0, iS, "$ZodISODateTime", 0, iw, "$ZodISODuration", 0, iz, "$ZodISOTime", 0, ix, "$ZodIntersection", 0, rv, "$ZodJWT", 0, iG, "$ZodKSUID", 0, iI, "$ZodLazy", 0, r0, "$ZodLiteral", 0, rU, "$ZodMAC", 0, iZ, "$ZodMap", 0, rI, "$ZodNaN", 0, rM, "$ZodNanoID", 0, ih, "$ZodNever", 0, i3, "$ZodNonOptional", 0, rT, "$ZodNull", 0, i1, "$ZodNullable", 0, rP, "$ZodNumber", 0, iq, "$ZodNumberFormat", 0, iH, "$ZodObject", 0, ra, "$ZodObjectJIT", 0, ro, "$ZodOptional", 0, rZ, "$ZodPipe", 0, rV, "$ZodPrefault", 0, rE, "$ZodPreprocess", 0, rG, "$ZodPromise", 0, rQ, "$ZodReadonly", 0, rX, "$ZodRecord", 0, rk, "$ZodSet", 0, rS, "$ZodString", 0, it, "$ZodStringFormat", 0, ii, "$ZodSuccess", 0, rC, "$ZodSymbol", 0, i4, "$ZodTemplateLiteral", 0, rH, "$ZodTransform", 0, rD, "$ZodTuple", 0, rh, "$ZodType", 0, n5, "$ZodULID", 0, ib, "$ZodURL", 0, ip, "$ZodUUID", 0, ia, "$ZodUndefined", 0, i6, "$ZodUnion", 0, ru, "$ZodUnknown", 0, i9, "$ZodVoid", 0, i5, "$ZodXID", 0, ik, "$ZodXor", 0, rs, "URL_BAD_FORMAT", 0, 1, "URL_UNPARSEABLE", 0, 2, "base64Charset", 0, iE, "base64urlCharset", 0, iL, "canParseURL", 0, ic, "clone", 0, Q, "getDiscriminatedOption", 0, rd, "isValidBase64", 0, i$, "isValidBase64URL", 0, iC, "isValidCIDRv6", 0, iP, "isValidCreditCard", 0, iV, "isValidIBAN", 0, iB, "isValidIPv6", 0, iD, "isValidJWT", 0, iW, "mergeValues", 0, rp, "parseURLObject", 0, il, "standardProps", 0, ie, "stripTabAndNewline", 0, id, "urlHostnameOk", 0, im, "urlProtocolOk", 0, iv, "validateURL", 0, iu], 628160), t.i(628160);
    class r1 extends Error {
        constructor() {
            super("Cannot parse a reference cycle that closes through a transform"), this.name = "ZodCyclicError"
        }
    }
    let r2 = "~memo",
        r9 = [];

    function r3(t) {
        return null !== t && "object" == typeof t
    }

    function r5(t) {
        return t.map(t => t.path ? {
            ...t,
            path: t.path.slice()
        } : {
            ...t
        })
    }
    let r7 = new WeakMap;

    function r8(t, n, i) {
        var r, a, o;
        let c = r7.get(t);
        if (void 0 !== c) return 2 * !!c;
        if (n.has(t)) return 2;
        n.add(t);
        let u = 0,
            l = t => {
                if (2 !== u && (null == t ? void 0 : t._zod)) {
                    let r = r8(t, n, i);
                    r > u && (u = r)
                }
            },
            s = t => {
                t > u && (u = t)
            },
            d = t._zod.def;
        switch (d.type) {
            case "object": {
                let t = Z(d);
                s(t ? ((t, r) => {
                    let a = 0;
                    for (let c of Reflect.ownKeys(t)) {
                        var o;
                        let u = Object.getOwnPropertyDescriptor(t, c);
                        if (r && !u.enumerable) continue;
                        let l = u.get ? 1 : (null == (o = u.value) ? void 0 : o._zod) ? r8(u.value, n, i) : 0;
                        l > a && (a = l)
                    }
                    return a
                })(t, !0) : 1), l(d.catchall);
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
                let a = null != (r = d._cachedInner) ? r : i ? t._zod.innerType : void 0;
                s(a ? r8(a, n, !1) : 1);
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
                    let i = n.value;
                    if (i && "object" == typeof i) {
                        if (i._zod) l(i);
                        else if (Array.isArray(i))
                            for (let t of i) l(t)
                    }
                }
        }
        return n.delete(t), a = t, 1 !== (o = u) && r7.set(a, 2 === o), o
    }

    function ae(t) {
        return 0 !== r8(t, new Set, !0)
    }
    let at = [],
        an = {
            alloc(t, n, r) {
                let a = i;
                if (!a) return r;
                i = void 0;
                let o = {
                    value: r,
                    issues: null
                };
                return a.set(n.value, o), at.push(o), r
            },
            guard(t) {
                var n;
                null != (n = t._zod).deferred || (n.deferred = []), t._zod.deferred.push(() => {
                    let n = t._zod.parse,
                        i = (t, i) => {
                            if ("backward" !== i.direction && ar(i, t.value)) throw new r1;
                            return n(t, i)
                        };
                    t._zod.parse = i, t._zod.run === n && (t._zod.run = i)
                })
            },
            attach(t) {
                var n;
                let r, a, o, c = !1;
                null != (n = t._zod).deferred || (n.deferred = []), t._zod.deferred.push(() => {
                    let n = t._zod.parse,
                        u = (l, s) => {
                            var d;
                            let m;
                            if (void 0 === r) {
                                let i = r8(t, new Set, !1);
                                if (0 === i) return t._zod.parse = n, t._zod.run === u && (t._zod.run = n), n(l, s);
                                2 === i || c ? r = !0 : c = !0
                            }
                            let f = l.value;
                            if (!r3(f)) return n(l, s);
                            let v = s[r2];
                            if (v || (v = {
                                    buckets: new WeakMap,
                                    backEdges: void 0
                                }, s[r2] = v), a === s) m = o;
                            else {
                                let n;
                                (n = (d = v).buckets.get(t)) || (n = new WeakMap, d.buckets.set(t, n)), m = n, a = s, o = m
                            }
                            let p = m.get(f);
                            if (p) return (l.value = p.value, p.issues) ? p.issues.length && l.issues.push(...r5(p.issues)) : (l.memo = !0, null != v.backEdges || (v.backEdges = new WeakSet), v.backEdges.add(p.value)), l;
                            i = m;
                            let g = at.length,
                                h = n(l, s);
                            i = void 0;
                            let y = at.length > g ? at.pop() : void 0;
                            return h instanceof Promise ? h.then(t => (y && (y.issues = t.issues.length ? r5(t.issues) : r9), t)) : (y && (y.issues = h.issues.length ? r5(h.issues) : r9), h)
                        };
                    t._zod.parse = u, t._zod.run === n && (t._zod.run = u)
                })
            }
        };

    function ai() {
        return an
    }

    function ar(t, n) {
        var i;
        let r = null == (i = t[r2]) ? void 0 : i.backEdges;
        return void 0 !== r && r3(n) && r.has(n)
    }
    t.s(["$ZodCyclicError", 0, r1, "isBackEdge", 0, ar, "isRecursiveSchema", 0, ae, "memoizer", 0, ai], 511043), t.i(511043), t.i(402171), t.i(437808);
    let aa = Symbol("ZodOutput"),
        ao = Symbol("ZodInput");
    class ac {
        add(t) {
            for (var n = arguments.length, i = Array(n > 1 ? n - 1 : 0), r = 1; r < n; r++) i[r - 1] = arguments[r];
            let a = i[0];
            return this._map.set(t, a), a && "object" == typeof a && "id" in a && this._idmap.set(a.id, t), this
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
                var i;
                let r = {
                    ...null != (i = this.get(n)) ? i : {}
                };
                delete r.id;
                let a = {
                    ...r,
                    ...this._map.get(t)
                };
                return Object.keys(a).length ? a : void 0
            }
            return this._map.get(t)
        }
        has(t) {
            return this._map.has(t)
        }
        constructor() {
            this._map = new WeakMap, this._idmap = new Map
        }
    }

    function au() {
        return new ac
    }
    null != (eK = globalThis).__zod_globalRegistry || (eK.__zod_globalRegistry = au());
    let al = globalThis.__zod_globalRegistry;
    t.s(["$ZodRegistry", 0, ac, "$input", 0, ao, "$output", 0, aa, "globalRegistry", 0, al, "registry", 0, au], 207639), t.i(207639), t.i(990010);
    let as = Symbol.for("zod.compile.invalid"),
        ad = Symbol.for("zod.compile.fallback");
    class am extends Error {
        constructor(t = "z.compile does not support async refinements, transforms, or checks") {
            super(t), this.name = "ZodCompileAsyncError"
        }
    }
    class af extends Error {
        constructor(t, n = !0) {
            super("z.compile does not support ".concat(t, "; this schema must use the runtime parser")), this.name = "ZodCompileUnsupportedError", this.islandable = n
        }
    }

    function av(t, n) {
        try {
            let n = ag(t),
                i = ap(t, n);
            return i._zod.bag.validator = function(t, n) {
                try {
                    return ag(t, {
                        assertOnly: !0
                    })
                } catch (t) {
                    return n
                }
            }(t, n), i
        } catch (i) {
            if (null == n ? void 0 : n.strict) throw i;
            return t
        }
    }

    function ap(t, n) {
        var i;
        if (ae(t)) throw new af("a schema whose subtree contains a reference cycle");
        let r = Q(t),
            a = t._zod.run,
            o = null != (i = a.__originalRun) ? i : a,
            c = (t, i) => {
                if ((null == i ? void 0 : i.async) || (null == i ? void 0 : i.direction) === "backward" || (null == i ? void 0 : i.skipChecks) || (null == i ? void 0 : i[ad]) || i && ar(i, t.value)) return o(t, i);
                let r = n(t.value);
                return r !== as ? (t.value = r, t) : (i && (i[ad] = !0), o(t, i))
            };
        return c.__originalRun = o, r._zod.bag.fallbackRun = o, r._zod.bag.validator = n, r._zod.run = c, a.__originalRun || function(t, n, i) {
            if ("function" == typeof n.safeParse) {
                let r = n.safeParse;
                t.safeParse = (t, n) => {
                    let a = i(t);
                    return a !== as ? {
                        success: !0,
                        data: a
                    } : r(t, n)
                }
            }
            if ("function" == typeof n.parse) {
                let r = n.parse;
                t.parse = (t, n) => {
                    let a = i(t);
                    return a !== as ? a : r(t, n)
                }
            }
        }(r, t, n), r
    }

    function ag(t, n) {
        let i, r = !0;
        try {
            r = ae(t)
        } catch (t) {}
        if (r) throw new af("a schema whose subtree contains a reference cycle");
        let a = {
                constants: new Map,
                constantCounter: 0,
                varCounter: 0,
                definite: !0
            },
            o = new n9(["input"]),
            c = aZ(o, a, t, "input", !(null == n ? void 0 : n.assertOnly));
        o.write(null === c ? "return true;" : "return ".concat(c, ";"));
        let u = ["INVALID", ...a.constants.keys()],
            l = [as, ...a.constants.values()],
            s = o.content.join("\n"),
            d = (null == n ? void 0 : n.debug) ? u.length > 0 ? "// Constants: ".concat(u.join(", "), "\n").concat(s) : s : "",
            m = Function;
        try {
            i = new m(...u, "return (input) => {\n".concat(s, "\n}"))(...l)
        } catch (t) {
            throw new af("this schema (generated code failed to evaluate: ".concat(t.message, ")"))
        }
        return (null == n ? void 0 : n.debug) && (i.code = d), i.definite = a.definite, i
    }

    function ah(t, n) {
        for (let [i, r] of t.constants)
            if (r === n) return i;
        let i = "c".concat(t.constantCounter++);
        return t.constants.set(i, n), i
    }

    function ay(t, n) {
        return t.definite = !1, ah(t, n)
    }

    function a_(t) {
        return "v".concat(t.varCounter++)
    }

    function ab(t, n) {
        let i = t._zod.run({
            value: n,
            issues: []
        }, {});
        return i && "function" == typeof i.then ? as : 0 === i.issues.length ? i.value : as
    }

    function ak(t, n, i, r) {
        let a = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4],
            o = t.content.length,
            c = n.constants.size,
            u = n.constantCounter,
            l = n.varCounter;
        try {
            return aZ(t, n, i, r, a)
        } catch (g) {
            var s, d, m, f;
            let a, v, p;
            if (!(g instanceof af) || !g.islandable) throw g;
            if (t.content.length = o, n.constants.size > c)
                for (let t of Array.from(n.constants.keys()).slice(c)) n.constants.delete(t);
            return n.constantCounter = u, n.varCounter = l, s = t, d = n, m = i, f = r, d.definite = !1, a = ah(d, m), v = ah(d, ab), p = a_(d), s.write("const ".concat(p, " = ").concat(v, "(").concat(a, ", ").concat(f, ");")), s.write("if (".concat(p, " === INVALID) return INVALID;")), p
        }
    }
    let aI = new Set(["max_size", "min_size", "size_equals", "max_length", "min_length", "length_equals"]);

    function aw(t, n, i, r) {
        let a = ah(n, ew),
            o = a_(n);
        return t.write("const ".concat(o, " = typeof ").concat(i, ' === "string" && ').concat(r, " ? ").concat(a, "(").concat(i, ") : ").concat(i, ".length;")), o
    }

    function aS(t, n) {
        if ("number" != typeof t || !Number.isFinite(t)) throw new af("".concat(n, " bound of type ").concat(typeof t));
        return "".concat(t)
    }

    function ax(t, n) {
        if ("bigint" == typeof n) return "".concat(n, "n");
        if ("number" == typeof n) {
            if (Number.isNaN(n)) throw new af("comparison check with NaN bound");
            return "".concat(n)
        }
        if (n instanceof Date) {
            if (Number.isNaN(n.getTime())) throw new af("comparison check with Invalid Date bound");
            return ah(t, n)
        }
        throw new af("comparison check bound of type ".concat(typeof n))
    }

    function az(t, n, i) {
        let r = n.format;
        switch (r) {
            case "safeint":
                t.write("if (!Number.isSafeInteger(".concat(i, ")) return INVALID;"));
                break;
            case "int32":
                t.write("if (!Number.isInteger(".concat(i, ") || ").concat(i, " < -2147483648 || ").concat(i, " > 2147483647) return INVALID;"));
                break;
            case "uint32":
                t.write("if (!Number.isInteger(".concat(i, ") || ").concat(i, " < 0 || ").concat(i, " > 4294967295) return INVALID;"));
                break;
            case "float32":
                t.write("if (!Number.isFinite(".concat(i, ") || ").concat(i, " < -3.4028234663852886e38 || ").concat(i, " > 3.4028234663852886e38) return INVALID;"));
                break;
            case "float64":
                t.write("if (!Number.isFinite(".concat(i, ")) return INVALID;"));
                break;
            default:
                throw new af("number format ".concat(r))
        }
    }

    function aU() {
        throw new l
    }

    function aN(t) {
        this.issues.push(t)
    }
    let aD = new Set(["cidrv4", "cuid", "cuid2", "date", "datetime", "duration", "e164", "email", "emoji", "ends_with", "guid", "includes", "ipv4", "ksuid", "lowercase", "mac", "nanoid", "regex", "starts_with", "time", "ulid", "uppercase", "uuid", "xid"]);

    function aO(t, n, i, r) {
        let a = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4],
            o = i.format;
        if ("base64" === o) {
            let i = ah(n, i$);
            return t.write("if (!".concat(i, "(").concat(r, ")) return INVALID;")), r
        }
        if ("base64url" === o) {
            let i = ah(n, iC);
            return t.write("if (!".concat(i, "(").concat(r, ")) return INVALID;")), r
        }
        if ("jwt" === o) {
            var c;
            let a = ah(n, iW),
                o = ah(n, null != (c = i.alg) ? c : null);
            return t.write("if (!".concat(a, "(").concat(r, ", ").concat(o, ")) return INVALID;")), r
        }
        if ("ipv6" === o) {
            let i = ah(n, iD);
            return t.write("if (!".concat(i, "(").concat(r, ")) return INVALID;")), r
        }
        if ("cidrv6" === o) {
            let i = ah(n, iP);
            return t.write("if (!".concat(i, "(").concat(r, ")) return INVALID;")), r
        }
        if ("credit_card" === o) {
            let i = ah(n, iV);
            return t.write("if (!".concat(i, "(").concat(r, ")) return INVALID;")), r
        }
        if ("iban" === o) {
            let i = ah(n, iB);
            return t.write("if (!".concat(i, "(").concat(r, ")) return INVALID;")), r
        }
        if ("url" === o || "httpurl" === o || i.normalize || void 0 !== i.hostname || void 0 !== i.protocol) {
            let o = ah(n, iu),
                c = ah(n, i),
                u = a_(n),
                l = a_(n);
            if (t.write("const ".concat(u, " = ").concat(r, ".trim();")), t.write("const ".concat(l, " = ").concat(o, "(").concat(u, ", ").concat(c, ");")), t.write("if (typeof ".concat(l, ' === "number") return INVALID;')), void 0 !== i.hostname) {
                let i = ah(n, im);
                t.write("if (!".concat(i, "(").concat(l, ", ").concat(c, ".hostname)) return INVALID;"))
            }
            if (void 0 !== i.protocol) {
                let i = ah(n, iv);
                t.write("if (!".concat(i, "(").concat(l, ", ").concat(c, ".protocol)) return INVALID;"))
            }
            if (!a) return null;
            let s = a_(n),
                d = i.normalize ? "".concat(l, ".href") : "".concat(ah(n, id), "(").concat(u, ")");
            return t.write("const ".concat(s, " = ").concat(d, ";")), s
        }
        let u = i.fn;
        if (u) {
            if (aT(u)) throw new af("async string format ".concat(o));
            let i = ah(n, u);
            return t.write("if (!".concat(i, "(").concat(r, ")) return INVALID;")), r
        }
        if (aD.has(o) && i.pattern) {
            let a = ah(n, i.pattern);
            return t.write("".concat(a, ".lastIndex = 0;")), t.write("if (!".concat(a, ".test(").concat(r, ")) return INVALID;")), r
        }
        let l = i.format;
        switch (l) {
            case "regex":
                throw new af("regex format without a pattern");
            case "lowercase":
                t.write("if (".concat(r, " !== ").concat(r, ".toLowerCase()) return INVALID;"));
                break;
            case "uppercase":
                t.write("if (".concat(r, " !== ").concat(r, ".toUpperCase()) return INVALID;"));
                break;
            case "includes":
                t.write("if (!".concat(r, ".includes(").concat(J(i.includes), ")) return INVALID;"));
                break;
            case "starts_with": {
                let n = i.prefix;
                t.write("if (".concat(r, ".slice(0, ").concat(n.length, ") !== ").concat(J(n), ") return INVALID;"));
                break
            }
            case "ends_with": {
                let n = i.suffix;
                t.write("if (".concat(r, ".slice(-").concat(n.length, ") !== ").concat(J(n), ") return INVALID;"));
                break
            }
            default:
                throw new af("string format ".concat(l))
        }
        return r
    }

    function aZ(t, n, i, r) {
        var a, o, c, u, l, s, d, m, f, v, p, g, h, y, _, b, k, I, w, S, x, U, N, D, O, Z, A, P, j, $, E, T, L, C, R, M, V, F, B, G;
        let X, q = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4],
            H = i._zod.def,
            Y = H.type;
        if (H.coerce) throw new af("coercion (z.coerce.".concat(Y, "())"));
        let Q = q || !!(null == (a = H.checks) ? void 0 : a.length);
        switch (Y) {
            case "string":
                X = function(t, n, i, r) {
                    let a = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4];
                    t.write("if (typeof ".concat(r, ' !== "string") return INVALID;'));
                    let o = i._zod.def;
                    return void 0 === o.format ? r : aO(t, n, o, r, a)
                }(t, n, i, r, Q);
                break;
            case "number":
                let ee;
                o = t, c = i, u = r, o.write("if (typeof ".concat(u, ' !== "number" || !Number.isFinite(').concat(u, ")) return INVALID;")), "number_format" === (ee = c._zod.def).check && ee.format && az(o, {
                    format: ee.format
                }, u), X = u;
                break;
            case "boolean":
                l = t, s = r, l.write("if (typeof ".concat(s, ' !== "boolean") return INVALID;')), X = s;
                break;
            case "bigint":
                X = function(t, n, i) {
                    t.write("if (typeof ".concat(i, ' !== "bigint") return INVALID;'));
                    let r = n._zod.def;
                    if (r.format) switch (r.format) {
                        case "int64":
                            t.write("if (".concat(i, " < -9223372036854775808n || ").concat(i, " > 9223372036854775807n) return INVALID;"));
                            break;
                        case "uint64":
                            t.write("if (".concat(i, " < 0n || ").concat(i, " > 18446744073709551615n) return INVALID;"))
                    }
                    return i
                }(t, i, r);
                break;
            case "symbol":
                d = t, m = r, d.write("if (typeof ".concat(m, ' !== "symbol") return INVALID;')), X = m;
                break;
            case "undefined":
                f = t, v = r, f.write("if (".concat(v, " !== undefined) return INVALID;")), X = v;
                break;
            case "null":
                p = t, g = r, p.write("if (".concat(g, " !== null) return INVALID;")), X = g;
                break;
            case "any":
            case "unknown":
                X = r;
                break;
            case "never":
                t.write("return INVALID;"), X = r;
                break;
            case "void":
                h = t, y = r, h.write("if (".concat(y, " !== undefined) return INVALID;")), X = y;
                break;
            case "nan":
                _ = t, b = r, _.write("if (typeof ".concat(b, ' !== "number" || !Number.isNaN(').concat(b, ")) return INVALID;")), X = b;
                break;
            case "date":
                k = t, I = r, k.write("if (!(".concat(I, " instanceof Date) || Number.isNaN(").concat(I, ".getTime())) return INVALID;")), X = I;
                break;
            case "object":
                X = function(t, n, i, r) {
                    var a, o;
                    let c = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4],
                        u = i._zod.def;
                    t.write("if (typeof ".concat(r, ' !== "object" || ').concat(r, " === null || Array.isArray(").concat(r, ")) return INVALID;"));
                    let l = u.shape,
                        s = Object.keys(l),
                        d = Object.getOwnPropertySymbols(l),
                        m = d.length ? [...s, ...d] : s,
                        f = t => "symbol" == typeof t ? ah(n, t) : J(t);
                    if (s.includes("__proto__")) throw new af('object shape key "__proto__"');
                    let v = new Map;
                    for (let i of m) {
                        let o = l[i],
                            u = f(i),
                            s = a_(n);
                        if (t.write("const ".concat(s, " = ").concat(r, "[").concat(u, "];")), void 0 !== o._zod.optin) {
                            let a = a_(n);
                            t.write("let ".concat(a, " = (() => {")), t.indented(t => {
                                let i = ak(t, n, o, s);
                                t.write("return ".concat(i, ";"))
                            }), t.write("})();"), "optional" === o._zod.optout ? (t.write("if (".concat(a, " === INVALID) {")), t.indented(t => {
                                t.write("if (".concat(u, " in ").concat(r, ") return INVALID;")), t.write("".concat(a, " = undefined;"))
                            }), t.write("}")) : t.write("if (".concat(a, " === INVALID) return INVALID;")), v.set(i, a)
                        } else {
                            void 0 === (a = o)._zod.optin && function t(n) {
                                var i, r;
                                if (n._zod.def.coerce) return !0;
                                let a = n._zod.def;
                                switch (a.type) {
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
                                        return !!a.innerType && t(a.innerType);
                                    case "literal":
                                        return !!(null == (i = a.values) ? void 0 : i.includes(void 0));
                                    case "enum":
                                        return !!(null == (r = n._zod.values) ? void 0 : r.has(void 0));
                                    case "optional":
                                    case "nullable":
                                    case "readonly":
                                    case "success":
                                        return !a.innerType || t(a.innerType);
                                    case "union":
                                        return !a.options || a.options.some(t);
                                    case "intersection":
                                        if (!a.left || !a.right) return !0;
                                        return t(a.left) && t(a.right);
                                    case "pipe":
                                        return !a.in || t(a.in)
                                }
                            }(a) && t.write("if (!(".concat(u, " in ").concat(r, ")) return INVALID;"));
                            let l = ak(t, n, o, s, c);
                            null !== l && v.set(i, l)
                        }
                    }
                    let p = u.catchall,
                        g = "none";
                    if (p) {
                        let n = p._zod.def.type;
                        if ("never" === n) {
                            let n = s.map(t => "k !== ".concat(J(t))).join(" && ") || "true";
                            t.write("for (const k in ".concat(r, ") {")), t.indented(t => {
                                t.write("if (".concat(n, ") return INVALID;"))
                            }), t.write("}")
                        } else g = "unknown" !== n && "any" !== n || (null == (o = p._zod.def.checks) ? void 0 : o.length) ? "schema" : "passthrough"
                    }
                    let h = a_(n),
                        y = m.some(t => aP(l[t]) || aA(l[t]));
                    if (!c) {
                        if ("schema" === g) {
                            let i = s.length > 0 ? ah(n, new Set(s)) : null;
                            t.write("for (const k in ".concat(r, ") {")), t.indented(t => {
                                t.write('if (k === "__proto__") continue;'), i && t.write("if (".concat(i, ".has(k)) continue;"));
                                let a = a_(n);
                                t.write("const ".concat(a, " = ").concat(r, "[k];")), ak(t, n, p, a, !1)
                            }), t.write("}")
                        }
                        return null
                    }
                    if (y)
                        for (let n of (t.write("const ".concat(h, " = {};")), m)) {
                            let i = f(n),
                                a = v.get(n);
                            aA(l[n]) ? t.write("if (".concat(i, " in ").concat(r, ") ").concat(h, "[").concat(i, "] = ").concat(a, ";")) : aP(l[n]) ? t.write("if (".concat(a, " !== undefined || ").concat(i, " in ").concat(r, ") ").concat(h, "[").concat(i, "] = ").concat(a, ";")) : t.write("".concat(h, "[").concat(i, "] = ").concat(a, ";"))
                        } else {
                            let n = m.map(t => "".concat("symbol" == typeof t ? "[".concat(f(t), "]") : J(t), ": ").concat(v.get(t))).join(", ");
                            t.write("const ".concat(h, " = { ").concat(n, " };"))
                        }
                    if ("none" !== g) {
                        let i = s.length > 0 ? ah(n, new Set(s)) : null;
                        t.write("for (const k in ".concat(r, ") {")), t.indented(t => {
                            if (t.write('if (k === "__proto__") continue;'), i && t.write("if (".concat(i, ".has(k)) continue;")), "passthrough" === g) t.write("".concat(h, "[k] = ").concat(r, "[k];"));
                            else {
                                let i = a_(n);
                                t.write("const ".concat(i, " = ").concat(r, "[k];"));
                                let a = ak(t, n, p, i);
                                t.write("".concat(h, "[k] = ").concat(a, ";"))
                            }
                        }), t.write("}")
                    }
                    return h
                }(t, n, i, r, Q);
                break;
            case "optional":
                X = function(t, n, i, r) {
                    var a;
                    let o = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4],
                        c = i._zod.def;
                    if ((null == (a = i._zod.traits) ? void 0 : a.has("$ZodExactOptional")) === !0) return aZ(t, n, c.innerType, r, o);
                    if ("defaulted" === c.innerType._zod.optin) {
                        let i = a_(n),
                            a = a_(n);
                        return t.write("let ".concat(i, ";")), t.write("if (".concat(r, " === undefined) {")), t.indented(t => {
                            t.write("const ".concat(a, " = (() => {")), t.indented(t => {
                                let i = aZ(t, n, c.innerType, r);
                                t.write("return ".concat(i, ";"))
                            }), t.write("})();"), t.write("if (".concat(a, " !== INVALID) ").concat(i, " = ").concat(a, ";"))
                        }), t.write("} else {"), t.indented(t => {
                            let a = aZ(t, n, c.innerType, r);
                            t.write("".concat(i, " = ").concat(a, ";"))
                        }), t.write("}"), i
                    }
                    let u = o ? a_(n) : null;
                    return u && t.write("let ".concat(u, ";")), t.write("if (".concat(r, " !== undefined) {")), t.indented(t => {
                        let i = aZ(t, n, c.innerType, r, o);
                        u && null !== i && t.write("".concat(u, " = ").concat(i, ";"))
                    }), t.write("}"), u
                }(t, n, i, r, Q);
                break;
            case "nullable":
                X = function(t, n, i, r) {
                    let a = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4],
                        o = i._zod.def,
                        c = a ? a_(n) : null;
                    return c && t.write("let ".concat(c, " = null;")), t.write("if (".concat(r, " !== null) {")), t.indented(t => {
                        let i = aZ(t, n, o.innerType, r, a);
                        c && null !== i && t.write("".concat(c, " = ").concat(i, ";"))
                    }), t.write("}"), c
                }(t, n, i, r, Q);
                break;
            case "array":
                X = function(t, n, i, r) {
                    let a = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4],
                        o = i._zod.def;
                    t.write("if (!Array.isArray(".concat(r, ")) return INVALID;"));
                    let c = a ? a_(n) : null,
                        u = a_(n),
                        l = a_(n);
                    return c && t.write("const ".concat(c, " = new Array(").concat(r, ".length);")), t.write("for (let ".concat(u, " = 0; ").concat(u, " < ").concat(r, ".length; ").concat(u, "++) {")), t.indented(t => {
                        t.write("const ".concat(l, " = ").concat(r, "[").concat(u, "];"));
                        let i = ak(t, n, o.element, l, a);
                        c && null !== i && t.write("".concat(c, "[").concat(u, "] = ").concat(i, ";"))
                    }), t.write("}"), c
                }(t, n, i, r, Q);
                break;
            case "literal":
                X = function(t, n, i, r) {
                    let a = i._zod.def.values;
                    if (1 !== a.length) {
                        let i = ah(n, new Set(a));
                        return t.write("if (!".concat(i, ".has(").concat(r, ")) return INVALID;")), r
                    }
                    let o = a[0];
                    if ("number" == typeof o && Number.isNaN(o)) {
                        let i = ah(n, new Set(a));
                        return t.write("if (!".concat(i, ".has(").concat(r, ")) return INVALID;")), r
                    }
                    if ("string" == typeof o) t.write("if (".concat(r, " !== ").concat(J(o), ") return INVALID;"));
                    else if ("number" == typeof o || "boolean" == typeof o) t.write("if (".concat(r, " !== ").concat(o, ") return INVALID;"));
                    else if (null === o) t.write("if (".concat(r, " !== null) return INVALID;"));
                    else if (void 0 === o) t.write("if (".concat(r, " !== undefined) return INVALID;"));
                    else if ("bigint" == typeof o) t.write("if (".concat(r, " !== ").concat(o, "n) return INVALID;"));
                    else throw new af("literal type ".concat(typeof o));
                    return r
                }(t, n, i, r);
                break;
            case "enum":
                X = function(t, n, i, r) {
                    let a = i._zod.values;
                    if (!a) throw new af("enum schema without enumerated values");
                    let o = ah(n, a);
                    return t.write("if (!".concat(o, ".has(").concat(r, ")) return INVALID;")), r
                }(t, n, i, r);
                break;
            case "readonly": {
                let a = aj(t, n, i, r),
                    o = a_(n);
                t.write("const ".concat(o, " = Object.freeze(").concat(a, ");")), X = o;
                break
            }
            case "success":
                aj(t, n, i, r), X = "true";
                break;
            case "default":
            case "prefault":
                X = function(t, n, i, r) {
                    let a = i._zod.def,
                        o = Object.getOwnPropertyDescriptor(i._zod.def, "defaultValue") ? () => i._zod.def.defaultValue : void 0;
                    if ("prefault" === i._zod.def.type) {
                        if (!o) return aZ(t, n, a.innerType, r);
                        let i = ah(n, o),
                            c = a_(n);
                        return t.write("let ".concat(c, " = ").concat(r, ";")), t.write("if (".concat(r, " === undefined) ").concat(c, " = ").concat(i, "();")), aZ(t, n, a.innerType, c)
                    }
                    let c = a_(n);
                    if (o) {
                        let i = ah(n, o),
                            u = ah(n, W);
                        t.write("let ".concat(c, ";")), t.write("if (".concat(r, " === undefined) {")), t.indented(t => {
                            t.write("".concat(c, " = ").concat(u, "(").concat(i, "());"))
                        }), t.write("} else {"), t.indented(t => {
                            let o = aZ(t, n, a.innerType, r);
                            t.write("".concat(c, " = ").concat(o, " === undefined ? ").concat(u, "(").concat(i, "()) : ").concat(o, ";"))
                        }), t.write("}")
                    } else t.write("let ".concat(c, ";")), t.write("if (".concat(r, " !== undefined) {")), t.indented(t => {
                        let i = aZ(t, n, a.innerType, r);
                        t.write("".concat(c, " = ").concat(i, ";"))
                    }), t.write("}");
                    return c
                }(t, n, i, r);
                break;
            case "nonoptional":
                let et, en;
                w = t, S = n, x = i, U = r, et = aZ(w, S, x._zod.def.innerType, U), en = a_(S), w.write("const ".concat(en, " = ").concat(et, ";")), w.write("if (".concat(en, " === undefined) return INVALID;")), X = en;
                break;
            case "tuple":
                X = function(t, n, i, r) {
                    let a = i._zod.def,
                        o = a.items,
                        c = a.rest;
                    t.write("if (!Array.isArray(".concat(r, ")) return INVALID;"));
                    let u = a$(o, "optin"),
                        l = a$(o, "optout");
                    c ? t.write("if (".concat(r, ".length < ").concat(u, ") return INVALID;")) : t.write("if (".concat(r, ".length < ").concat(u, " || ").concat(r, ".length > ").concat(o.length, ") return INVALID;"));
                    let s = a_(n);
                    t.write("const ".concat(s, " = [];"));
                    for (let i = 0; i < o.length; i++) {
                        let a = o[i];
                        if (i >= l) t.write("if (".concat(s, ".length === ").concat(i, ") {")), t.indented(t => {
                            t.write("if (".concat(i, " < ").concat(r, ".length) {")), t.indented(t => {
                                let o = a_(n);
                                t.write("const ".concat(o, " = ").concat(r, "[").concat(i, "];"));
                                let c = ak(t, n, a, o);
                                t.write("".concat(s, "[").concat(i, "] = ").concat(c, ";"))
                            }), t.write("} else {"), t.indented(t => {
                                if (aA(a)) return void t.write("".concat(s, ".length = ").concat(i, ";"));
                                let r = a_(n),
                                    o = a_(n);
                                t.write("const ".concat(r, " = undefined;")), t.write("const ".concat(o, " = (() => {")), t.indented(t => {
                                    let i = ak(t, n, a, r);
                                    t.write("return ".concat(i, ";"))
                                }), t.write("})();"), t.write("if (".concat(o, " === INVALID || ").concat(o, " === undefined) ").concat(s, ".length = ").concat(i, ";")), t.write("else ".concat(s, "[").concat(i, "] = ").concat(o, ";"))
                            }), t.write("}")
                        }), t.write("}");
                        else {
                            let o = a_(n);
                            t.write("const ".concat(o, " = ").concat(r, "[").concat(i, "];"));
                            let c = ak(t, n, a, o);
                            t.write("".concat(s, "[").concat(i, "] = ").concat(c, ";"))
                        }
                    }
                    if (c) {
                        let i = a_(n),
                            a = a_(n);
                        t.write("for (let ".concat(i, " = ").concat(o.length, "; ").concat(i, " < ").concat(r, ".length; ").concat(i, "++) {")), t.indented(t => {
                            t.write("const ".concat(a, " = ").concat(r, "[").concat(i, "];"));
                            let o = ak(t, n, c, a);
                            t.write("".concat(s, "[").concat(i, "] = ").concat(o, ";"))
                        }), t.write("}")
                    }
                    return s
                }(t, n, i, r);
                break;
            case "union":
                X = function(t, n, i, r) {
                    let a = i._zod.def,
                        o = a.options;
                    if (a.discriminator) return function(t, n, i, r) {
                        if (i.unionFallback) throw new af("discriminated union with unionFallback");
                        if (0 === i.options.length) return t.write("return INVALID;"), r;
                        let a = a_(n),
                            o = a_(n);
                        t.write("const ".concat(a, " = ").concat(r, "?.[").concat(J(i.discriminator), "];")), t.write("let ".concat(o, ";"));
                        let c = !0,
                            u = new Set;
                        for (let s of i.options) {
                            var l;
                            let d = null == (l = s._zod.propValues) ? void 0 : l[i.discriminator];
                            if (!d || 0 === d.size) throw new af("discriminated union option without static discriminator values");
                            for (let t of d) {
                                if (u.has(t)) throw new af("duplicate discriminator value ".concat(String(t)));
                                u.add(t)
                            }
                            let m = Array.from(d, t => (function(t, n, i) {
                                    if ("string" == typeof i) return "".concat(n, " === ").concat(J(i));
                                    if ("number" == typeof i) return Number.isNaN(i) ? "Number.isNaN(".concat(n, ")") : "".concat(n, " === ").concat(i);
                                    if ("boolean" == typeof i) return "".concat(n, " === ").concat(i);
                                    if (null === i) return "".concat(n, " === null");
                                    if (void 0 === i) return "".concat(n, " === undefined");
                                    if ("bigint" == typeof i) return "".concat(n, " === ").concat(i, "n");
                                    if ("symbol" == typeof i) {
                                        let r = ah(t, i);
                                        return "".concat(n, " === ").concat(r)
                                    }
                                    throw new af("literal discriminator value ".concat(String(i)))
                                })(n, a, t)),
                                f = c ? "if" : "else if";
                            t.write("".concat(f, " (").concat(m.join(" || "), ") {")), t.indented(t => {
                                let i = aZ(t, n, s, r);
                                t.write("".concat(o, " = ").concat(i, ";"))
                            }), t.write("}"), c = !1
                        }
                        return t.write("else { return INVALID; }"), o
                    }(t, n, a, r);
                    if (!1 === a.inclusive) throw new af("exclusive unions (z.xor)");
                    if (0 === o.length) return t.write("return INVALID;"), r;
                    if (1 === o.length) return aZ(t, n, o[0], r);
                    if (o.every(t => {
                            var n;
                            return "literal" === t._zod.def.type && !(null == (n = t._zod.def.checks) ? void 0 : n.length)
                        })) {
                        let i = ah(n, new Set(o.flatMap(t => t._zod.def.values)));
                        return t.write("if (!".concat(i, ".has(").concat(r, ")) return INVALID;")), r
                    }
                    let c = a_(n);
                    t.write("let ".concat(c, ";"));
                    for (let i = 0; i < o.length; i++) {
                        let a = o[i];
                        0 === i ? t.write("".concat(c, " = (() => {")) : t.write("if (".concat(c, " === INVALID) ").concat(c, " = (() => {")), t.indented(t => {
                            let i = aZ(t, n, a, r);
                            t.write("return ".concat(i, ";"))
                        }), t.write("})();")
                    }
                    return t.write("if (".concat(c, " === INVALID) return INVALID;")), c
                }(t, n, i, r);
                break;
            case "intersection":
                let ei, er, ea, eo, ec;
                N = t, D = n, O = i, Z = r, ei = O._zod.def, D.definite = !1, er = ak(N, D, ei.left, Z), ea = ak(N, D, ei.right, Z), eo = ah(D, rp), ec = a_(D), N.write("const ".concat(ec, " = ").concat(eo, "(").concat(er, ", ").concat(ea, ");")), N.write("if (!".concat(ec, ".valid) return INVALID;")), X = "".concat(ec, ".data");
                break;
            case "record":
                X = function(t, n, i, r) {
                    var a, o, c, u;
                    let l = i._zod.def,
                        s = ah(n, K);
                    t.write("if (!".concat(s, "(").concat(r, ")) return INVALID;"));
                    let d = a_(n),
                        m = a_(n),
                        f = a_(n);
                    t.write("const ".concat(d, " = {};"));
                    let v = l.partial ? void 0 : l.keyType._zod.values;
                    if (v) {
                        let i = [];
                        for (let a of v) {
                            if ("string" != typeof a && "number" != typeof a && "symbol" != typeof a) throw new af("record key value ".concat(String(a)));
                            let o = "number" == typeof a ? a.toString() : a;
                            if ("__proto__" === o) throw new af('record key "__proto__"');
                            i.push(o);
                            let s = ah(n, a),
                                m = aZ(t, n, l.keyType, s),
                                f = a_(n);
                            t.write("const ".concat(f, " = ").concat(r, "[").concat((c = n, "string" == typeof(u = o) ? J(u) : ah(c, u)), "];"));
                            let v = ak(t, n, l.valueType, f);
                            t.write("".concat(d, "[").concat(m, "] = ").concat(v, ";"))
                        }
                        let a = ah(n, new Set(i));
                        return t.write("for (const ".concat(m, " in ").concat(r, ") {")), t.indented(t => {
                            t.write("if (".concat(a, ".has(").concat(m, ")) continue;")), "loose" === l.mode ? t.write("if (".concat(m, ' !== "__proto__") ').concat(d, "[").concat(m, "] = ").concat(r, "[").concat(m, "];")) : t.write("return INVALID;")
                        }), t.write("}"), d
                    }
                    let p = l.keyType._zod.def;
                    if (!("string" === p.type && void 0 === p.format && !p.coerce && (null != (a = null == (o = p.checks) ? void 0 : o.length) ? a : 0) === 0)) {
                        let i = "loose" === l.mode,
                            a = ag(l.keyType);
                        !1 === a.definite && (n.definite = !1);
                        let o = ah(n, a),
                            c = ah(n, tS),
                            u = a_(n);
                        return aE(t, n, r, m, t => {
                            t.write("let ".concat(u, " = ").concat(o, "(").concat(m, ");")), t.write("if (".concat(u, " === INVALID && typeof ").concat(m, ' === "string" && ').concat(c, ".test(").concat(m, ")) ").concat(u, " = ").concat(o, "(Number(").concat(m, "));")), i ? t.write("if (".concat(u, " === INVALID) { ").concat(d, "[").concat(m, "] = ").concat(r, "[").concat(m, "]; continue; }")) : t.write("if (".concat(u, " === INVALID) return INVALID;")), t.write("if (".concat(u, ' === "__proto__") continue;'));
                            let a = a_(n);
                            t.write("const ".concat(a, " = ").concat(r, "[").concat(m, "];"));
                            let s = ak(t, n, l.valueType, a);
                            t.write("".concat(d, "[").concat(u, "] = ").concat(s, ";"))
                        }), d
                    }
                    return aE(t, n, r, m, t => {
                        t.write("const ".concat(f, " = ").concat(r, "[").concat(m, "];"));
                        let i = ak(t, n, l.valueType, f);
                        t.write("".concat(d, "[").concat(m, "] = ").concat(i, ";"))
                    }, "return INVALID;"), d
                }(t, n, i, r);
                break;
            case "map":
                let eu, el, es, ed;
                A = t, P = n, j = i, $ = r, eu = j._zod.def, A.write("if (!(".concat($, " instanceof Map)) return INVALID;")), el = a_(P), es = a_(P), ed = a_(P), A.write("const ".concat(el, " = new Map();")), A.write("for (const [".concat(es, ", ").concat(ed, "] of ").concat($, ") {")), A.indented(t => {
                    let n = aZ(t, P, eu.keyType, es),
                        i = aZ(t, P, eu.valueType, ed);
                    t.write("".concat(el, ".set(").concat(n, ", ").concat(i, ");"))
                }), A.write("}"), X = el;
                break;
            case "set":
                let em, ef, ev;
                E = t, T = n, L = i, C = r, em = L._zod.def, E.write("if (!(".concat(C, " instanceof Set)) return INVALID;")), ef = a_(T), ev = a_(T), E.write("const ".concat(ef, " = new Set();")), E.write("for (const ".concat(ev, " of ").concat(C, ") {")), E.indented(t => {
                    let n = aZ(t, T, em.valueType, ev);
                    t.write("".concat(ef, ".add(").concat(n, ");"))
                }), E.write("}"), X = ef;
                break;
            case "file":
                R = t, M = r, R.write("if (!(".concat(M, " instanceof File)) return INVALID;")), X = M;
                break;
            case "template_literal":
                X = function(t, n, i, r) {
                    t.write("if (typeof ".concat(r, ' !== "string") return INVALID;'));
                    let a = i._zod.pattern;
                    if (a) {
                        let i = ah(n, a);
                        t.write("".concat(i, ".lastIndex = 0;")), t.write("if (!".concat(i, ".test(").concat(r, ")) return INVALID;"))
                    }
                    return r
                }(t, n, i, r);
                break;
            case "lazy":
                let ep, eg, eh;
                V = t, F = n, B = i, G = r, ep = ay(F, B._zod.def.getter), eg = ah(F, {
                    parser: null
                }), V.write("if (!".concat(eg, ".parser) {")), V.indented(t => {
                    t.write("const inner = ".concat(ep, "();")), t.write("".concat(eg, ".parser = function(input) {")), t.indented(t => {
                        t.write("const result = inner._zod.run({ value: input, issues: [] }, {});"), t.write("return result.issues.length === 0 ? result.value : INVALID;")
                    }), t.write("};")
                }), V.write("}"), eh = a_(F), V.write("const ".concat(eh, " = ").concat(eg, ".parser(").concat(G, ");")), V.write("if (".concat(eh, " === INVALID) return INVALID;")), X = eh;
                break;
            case "pipe":
                X = function(t, n, i, r) {
                    let a = i._zod.def,
                        o = aZ(t, n, a.in, r);
                    if (!a.transform) return aZ(t, n, a.out, o);
                    {
                        if (aT(a.transform)) throw new am("z.compile: async transforms in pipes are not supported");
                        let i = a.transform,
                            r = ay(n, t => {
                                let n = {
                                        value: t,
                                        issues: [],
                                        addIssue: aN
                                    },
                                    r = i(t, n);
                                return r instanceof Promise ? as : 0 === n.issues.length ? r : as
                            }),
                            c = a_(n);
                        return t.write("const ".concat(c, " = ").concat(r, "(").concat(o, ");")), t.write("if (".concat(c, " === INVALID) return INVALID;")), aZ(t, n, a.out, c)
                    }
                }(t, n, i, r);
                break;
            case "custom":
                X = function(t, n, i, r) {
                    let a = i._zod.def;
                    if (a.fn) {
                        if (aT(a.fn)) throw new am("z.compile: async custom predicates are not supported");
                        let i = ay(n, a.fn),
                            o = ah(n, aU),
                            c = a_(n);
                        t.write("const ".concat(c, " = ").concat(i, "(").concat(r, ");")), t.write("if (".concat(c, " instanceof Promise) ").concat(o, "();")), t.write("if (!".concat(c, ") return INVALID;"))
                    } else throw new af("custom schema without a predicate function");
                    return r
                }(t, n, i, r);
                break;
            case "transform":
                X = function(t, n, i, r) {
                    let a = i._zod.def;
                    if (a.transform) {
                        if (aT(a.transform)) throw new am("z.compile: async transforms are not supported");
                        let i = a.transform,
                            o = ay(n, t => {
                                let n = {
                                        value: t,
                                        issues: [],
                                        addIssue: aN
                                    },
                                    r = i(t, n);
                                return r instanceof Promise ? as : 0 === n.issues.length ? r : as
                            }),
                            c = a_(n);
                        return t.write("const ".concat(c, " = ").concat(o, "(").concat(r, ");")), t.write("if (".concat(c, " === INVALID) return INVALID;")), c
                    }
                    return r
                }(t, n, i, r);
                break;
            case "catch":
                X = function(t, n, i, r) {
                    let a = i._zod.def;
                    if (!a.catchValue[eV]) throw new af("catch with a callback (only a constant catch value compiles)", !1);
                    let o = a_(n);
                    t.write("let ".concat(o, " = (() => {")), t.indented(t => {
                        let i = ak(t, n, a.innerType, r);
                        t.write("return ".concat(i, ";"))
                    }), t.write("})();");
                    let c = ah(n, a.innerType),
                        u = ay(n, a.catchValue),
                        l = ah(n, aL);
                    return t.write("if (".concat(o, " === INVALID) {")), t.indented(t => {
                        t.write("".concat(o, " = ").concat(l, "(").concat(c, ", ").concat(u, ", ").concat(r, ");")), t.write("if (".concat(o, " === INVALID) return INVALID;"))
                    }), t.write("}"), o
                }(t, n, i, r);
                break;
            default:
                throw new af("schema type ".concat(Y))
        }
        return null === X ? null : function(t, n, i, r) {
            let a = i._zod.def.checks;
            if (!a || 0 === a.length) return r;
            let o = r;
            for (let i of a) {
                let r = i._zod.def;
                if (r.when && !aI.has(r.check)) throw new af('check with a custom "when" condition');
                switch (r.check) {
                    case "greater_than":
                        ! function(t, n, i, r) {
                            let a = i.inclusive ? "<" : "<=";
                            t.write("if (".concat(r, " ").concat(a, " ").concat(ax(n, i.value), ") return INVALID;"))
                        }(t, n, r, o);
                        break;
                    case "less_than":
                        ! function(t, n, i, r) {
                            let a = i.inclusive ? ">" : ">=";
                            t.write("if (".concat(r, " ").concat(a, " ").concat(ax(n, i.value), ") return INVALID;"))
                        }(t, n, r, o);
                        break;
                    case "multiple_of":
                        ! function(t, n, i, r) {
                            if ("bigint" == typeof i.value) {
                                if (i.value === BigInt(0)) throw new af("multiple_of check with a zero divisor");
                                t.write("if (".concat(r, " % ").concat(i.value, "n !== 0n) return INVALID;"))
                            } else {
                                let a = ah(n, z);
                                t.write("if (".concat(a, "(").concat(r, ", ").concat(aS(i.value, "multiple_of"), ") !== 0) return INVALID;"))
                            }
                        }(t, n, r, o);
                        break;
                    case "number_format":
                        az(t, r, o);
                        break;
                    case "min_length": {
                        let i = aS(r.minimum, "min_length"),
                            a = aw(t, n, o, "".concat(o, ".length >= ").concat(i, " && ").concat(o, ".length < ").concat(2 * r.minimum));
                        t.write("if (".concat(a, " < ").concat(i, ") return INVALID;"));
                        break
                    }
                    case "max_length": {
                        let i = aS(r.maximum, "max_length"),
                            a = aw(t, n, o, "".concat(o, ".length > ").concat(i));
                        t.write("if (".concat(a, " > ").concat(i, ") return INVALID;"));
                        break
                    }
                    case "length_equals": {
                        let i = aS(r.length, "length_equals"),
                            a = aw(t, n, o, "".concat(o, ".length >= ").concat(i, " && ").concat(o, ".length <= ").concat(2 * r.length));
                        t.write("if (".concat(a, " !== ").concat(i, ") return INVALID;"));
                        break
                    }
                    case "min_size":
                        t.write("if (".concat(o, ".size < ").concat(aS(r.minimum, "min_size"), ") return INVALID;"));
                        break;
                    case "max_size":
                        t.write("if (".concat(o, ".size > ").concat(aS(r.maximum, "max_size"), ") return INVALID;"));
                        break;
                    case "size_equals":
                        t.write("if (".concat(o, ".size !== ").concat(aS(r.size, "size_equals"), ") return INVALID;"));
                        break;
                    case "string_format":
                        o = aO(t, n, r, o);
                        break;
                    case "custom":
                        o = function(t, n, i, r) {
                            let a = i._zod.def;
                            if (a.fn) {
                                if (aT(a.fn)) throw new am("z.compile: async .refine() predicates are not supported");
                                let i = ay(n, a.fn),
                                    o = ah(n, aU),
                                    c = a_(n);
                                return t.write("const ".concat(c, " = ").concat(i, "(").concat(r, ");")), t.write("if (".concat(c, " instanceof Promise) ").concat(o, "();")), t.write("if (!".concat(c, ") return INVALID;")), r
                            }
                            if (i._zod.check) {
                                if (aT(i._zod.check)) throw new am("z.compile: async .superRefine() / check functions are not supported");
                                let a = i._zod.check,
                                    o = ay(n, t => {
                                        let n = {
                                            value: t,
                                            issues: [],
                                            addIssue: aN
                                        };
                                        return a(n) instanceof Promise && aU(), 0 === n.issues.length ? n.value : as
                                    }),
                                    c = a_(n);
                                return t.write("const ".concat(c, " = ").concat(o, "(").concat(r, ");")), t.write("if (".concat(c, " === INVALID) return INVALID;")), c
                            }
                            throw new af("custom check without a predicate or check function")
                        }(t, n, i, o);
                        break;
                    case "bigint_format":
                        ! function(t, n, i) {
                            let r = n.format;
                            if (r) switch (r) {
                                case "int64":
                                    t.write("if (".concat(i, " < -9223372036854775808n || ").concat(i, " > 9223372036854775807n) return INVALID;"));
                                    break;
                                case "uint64":
                                    t.write("if (".concat(i, " < 0n || ").concat(i, " > 18446744073709551615n) return INVALID;"));
                                    break;
                                default:
                                    throw new af("bigint format ".concat(r))
                            }
                        }(t, r, o);
                        break;
                    case "mime_type":
                        ! function(t, n, i, r) {
                            let a = i.mime;
                            if (a && a.length > 0) {
                                let i = ah(n, new Set(a));
                                t.write("if (!".concat(i, ".has(").concat(r, ".type)) return INVALID;"))
                            }
                        }(t, n, r, o);
                        break;
                    case "property":
                        ! function(t, n, i, r) {
                            let a = "".concat(r, "[").concat(JSON.stringify(i.property), "]");
                            aZ(t, n, i.schema, a)
                        }(t, n, r, o);
                        break;
                    case "properties":
                        ! function(t, n, i, r) {
                            if (i.when) throw new af('check with a custom "when" condition');
                            t.write("if (".concat(r, " == null) return INVALID;"));
                            let a = i.shape;
                            for (let i of Reflect.ownKeys(a)) {
                                let o = "symbol" == typeof i ? ah(n, i) : J(i),
                                    c = a_(n);
                                t.write("const ".concat(c, " = ").concat(r, "[").concat(o, "];")), ak(t, n, a[i], c, !1)
                            }
                        }(t, n, r, o);
                        break;
                    case "overwrite": {
                        let r = a_(n);
                        (function(t, n, i, r, a) {
                            let o = i._zod.def.tx;
                            if (!o) throw new af("overwrite check without a transform function");
                            if (aT(o)) throw new am("z.compile: async overwrite transforms are not supported");
                            let c = ah(n, o);
                            t.write("const ".concat(a, " = ").concat(c, "(").concat(r, ");"))
                        })(t, n, i, o, r), o = r;
                        break
                    }
                    default:
                        throw new af("check type ".concat(r.check))
                }
            }
            return o
        }(t, n, i, X)
    }

    function aA(t) {
        return "optional" === t._zod.optin && "optional" === t._zod.optout
    }

    function aP(t) {
        return ("defaulted" !== t._zod.optin || "optional" === t._zod.optout) && function t(n) {
            var i, r;
            let a = n._zod.def;
            switch (a.type) {
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
                    return !!(null == (i = a.values) ? void 0 : i.includes(void 0));
                case "enum":
                    return !!(null == (r = n._zod.values) ? void 0 : r.has(void 0));
                case "optional":
                default:
                    return !0;
                case "nullable":
                case "readonly":
                case "nonoptional":
                    return !a.innerType || t(a.innerType);
                case "union":
                    return !a.options || a.options.some(t);
                case "intersection":
                    return !a.left || !a.right || t(a.left) || t(a.right);
                case "pipe":
                    return !a.out || t(a.out)
            }
        }(t)
    }

    function aj(t, n, i, r) {
        return aZ(t, n, i._zod.def.innerType, r)
    }

    function a$(t, n) {
        for (let i = t.length - 1; i >= 0; i--)
            if (!("optin" === n ? void 0 !== t[i]._zod.optin : "optional" === t[i]._zod.optout)) return i + 1;
        return 0
    }

    function aE(t, n, i, r, a, o) {
        let c = ah(n, Object.prototype.propertyIsEnumerable),
            u = a_(n),
            l = a_(n),
            s = a_(n);
        t.write("const ".concat(u, " = Object.getOwnPropertySymbols(").concat(i, ");")), t.write("const ".concat(l, " = Object.getOwnPropertyNames(").concat(i, ");")), t.write("for (let ".concat(s, " = 0; ").concat(s, " < ").concat(l, ".length; ").concat(s, "++) {")), t.indented(t => {
            t.write("const ".concat(r, " = ").concat(l, "[").concat(s, "];")), t.write("if (".concat(r, ' === "__proto__" || !').concat(c, ".call(").concat(i, ", ").concat(r, ")) continue;")), a(t)
        }), t.write("}"), t.write("for (let ".concat(s, " = 0; ").concat(s, " < ").concat(u, ".length; ").concat(s, "++) {")), t.indented(t => {
            t.write("const ".concat(r, " = ").concat(u, "[").concat(s, "];")), t.write("if (!".concat(c, ".call(").concat(i, ", ").concat(r, ")) continue;")), o ? t.write(o) : a(t)
        }), t.write("}")
    }

    function aT(t) {
        return "function" == typeof t && ("AsyncFunction" === t.constructor.name || "AsyncFunction" === t[Symbol.toStringTag])
    }

    function aL(t, n, i) {
        let r = t._zod.run({
            value: i,
            issues: []
        }, {});
        return r && "function" == typeof r.then ? as : 0 === r.issues.length ? r.value : n()
    }

    function aC(t) {
        return t.checks && (t.checks = [...t.checks]), t
    }

    function aR(t, n) {
        return new t(aC({
            type: "string",
            ...ee(n)
        }))
    }

    function aJ(t, n) {
        return new t(aC({
            type: "string",
            coerce: !0,
            ...ee(n)
        }))
    }

    function aM(t, n) {
        return new t({
            type: "string",
            format: "email",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function aV(t, n) {
        return new t({
            type: "string",
            format: "guid",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function aF(t, n) {
        return new t({
            type: "string",
            format: "uuid",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function aB(t, n) {
        return new t({
            type: "string",
            format: "uuid",
            check: "string_format",
            abort: !1,
            version: "v4",
            ...ee(n)
        })
    }

    function aK(t, n) {
        return new t({
            type: "string",
            format: "uuid",
            check: "string_format",
            abort: !1,
            version: "v6",
            ...ee(n)
        })
    }

    function aW(t, n) {
        return new t({
            type: "string",
            format: "uuid",
            check: "string_format",
            abort: !1,
            version: "v7",
            ...ee(n)
        })
    }

    function aG(t, n) {
        return new t({
            type: "string",
            format: "url",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function aX(t, n) {
        return new t({
            type: "string",
            format: "emoji",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function aq(t, n) {
        return new t({
            type: "string",
            format: "nanoid",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function aH(t, n) {
        return new t({
            type: "string",
            format: "cuid",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function aY(t, n) {
        return new t({
            type: "string",
            format: "cuid2",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function aQ(t, n) {
        return new t({
            type: "string",
            format: "ulid",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function a0(t, n) {
        return new t({
            type: "string",
            format: "xid",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function a4(t, n) {
        return new t({
            type: "string",
            format: "ksuid",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function a6(t, n) {
        return new t({
            type: "string",
            format: "ipv4",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function a1(t, n) {
        return new t({
            type: "string",
            format: "ipv6",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function a2(t, n) {
        return new t({
            type: "string",
            format: "mac",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function a9(t, n) {
        return new t({
            type: "string",
            format: "cidrv4",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function a3(t, n) {
        return new t({
            type: "string",
            format: "cidrv6",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function a5(t, n) {
        return new t({
            type: "string",
            format: "base64",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function a7(t, n) {
        return new t({
            type: "string",
            format: "base64url",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function a8(t, n) {
        return new t({
            type: "string",
            format: "e164",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function oe(t, n) {
        return new t({
            type: "string",
            format: "credit_card",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function ot(t, n) {
        return new t({
            type: "string",
            format: "iban",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function on(t, n) {
        return new t({
            type: "string",
            format: "jwt",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }
    t.s(["INVALID", 0, as, "ZodCompileAsyncError", 0, am, "ZodCompileUnsupportedError", 0, af, "compile", 0, av, "compileFn", 0, ag, "withParser", 0, ap], 6e3), t.i(6e3);
    let oi = {
        Any: null,
        Minute: -1,
        Second: 0,
        Millisecond: 3,
        Microsecond: 6
    };

    function or(t, n) {
        return new t({
            type: "string",
            format: "datetime",
            check: "string_format",
            offset: !1,
            local: !1,
            precision: null,
            ...ee(n)
        })
    }

    function oa(t, n) {
        return new t({
            type: "string",
            format: "date",
            check: "string_format",
            ...ee(n)
        })
    }

    function oo(t, n) {
        return new t({
            type: "string",
            format: "time",
            check: "string_format",
            precision: null,
            ...ee(n)
        })
    }

    function oc(t, n) {
        return new t({
            type: "string",
            format: "duration",
            check: "string_format",
            ...ee(n)
        })
    }

    function ou(t, n) {
        return new t(aC({
            type: "number",
            checks: [],
            ...ee(n)
        }))
    }

    function ol(t, n) {
        return new t(aC({
            type: "number",
            coerce: !0,
            checks: [],
            ...ee(n)
        }))
    }

    function os(t, n) {
        return new t({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "safeint",
            ...ee(n)
        })
    }

    function od(t, n) {
        return new t({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "float32",
            ...ee(n)
        })
    }

    function om(t, n) {
        return new t({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "float64",
            ...ee(n)
        })
    }

    function of(t, n) {
        return new t({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "int32",
            ...ee(n)
        })
    }

    function ov(t, n) {
        return new t({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "uint32",
            ...ee(n)
        })
    }

    function op(t, n) {
        return new t({
            type: "boolean",
            ...ee(n)
        })
    }

    function og(t, n) {
        return new t({
            type: "boolean",
            coerce: !0,
            ...ee(n)
        })
    }

    function oh(t, n) {
        return new t({
            type: "bigint",
            ...ee(n)
        })
    }

    function oy(t, n) {
        return new t({
            type: "bigint",
            coerce: !0,
            ...ee(n)
        })
    }

    function o_(t, n) {
        return new t({
            type: "bigint",
            check: "bigint_format",
            abort: !1,
            format: "int64",
            ...ee(n)
        })
    }

    function ob(t, n) {
        return new t({
            type: "bigint",
            check: "bigint_format",
            abort: !1,
            format: "uint64",
            ...ee(n)
        })
    }

    function ok(t, n) {
        return new t({
            type: "symbol",
            ...ee(n)
        })
    }

    function oI(t, n) {
        return new t({
            type: "undefined",
            ...ee(n)
        })
    }

    function ow(t, n) {
        return new t({
            type: "null",
            ...ee(n)
        })
    }

    function oS(t) {
        return new t({
            type: "any"
        })
    }

    function ox(t) {
        return new t({
            type: "unknown"
        })
    }

    function oz(t, n) {
        return new t({
            type: "never",
            ...ee(n)
        })
    }

    function oU(t, n) {
        return new t({
            type: "void",
            ...ee(n)
        })
    }

    function oN(t, n) {
        return new t({
            type: "date",
            ...ee(n)
        })
    }

    function oD(t, n) {
        return new t({
            type: "date",
            coerce: !0,
            ...ee(n)
        })
    }

    function oO(t, n) {
        return new t({
            type: "nan",
            ...ee(n)
        })
    }

    function oZ(t, n) {
        return new nE({
            check: "less_than",
            ...ee(n),
            value: t,
            inclusive: !1
        })
    }

    function oA(t, n) {
        return new nE({
            check: "less_than",
            ...ee(n),
            value: t,
            inclusive: !0
        })
    }

    function oP(t, n) {
        return new nT({
            check: "greater_than",
            ...ee(n),
            value: t,
            inclusive: !1
        })
    }

    function oj(t, n) {
        return new nT({
            check: "greater_than",
            ...ee(n),
            value: t,
            inclusive: !0
        })
    }

    function o$(t) {
        return oP(0, t)
    }

    function oE(t) {
        return oZ(0, t)
    }

    function oT(t) {
        return oA(0, t)
    }

    function oL(t) {
        return oj(0, t)
    }

    function oC(t, n) {
        return new nL({
            check: "multiple_of",
            ...ee(n),
            value: t
        })
    }

    function oR(t, n) {
        return new nJ({
            check: "max_size",
            ...ee(n),
            maximum: t
        })
    }

    function oJ(t, n) {
        return new nM({
            check: "min_size",
            ...ee(n),
            minimum: t
        })
    }

    function oM(t, n) {
        return new nV({
            check: "size_equals",
            ...ee(n),
            size: t
        })
    }

    function oV(t, n) {
        return new nF({
            check: "max_length",
            ...ee(n),
            maximum: t
        })
    }

    function oF(t, n) {
        return new nB({
            check: "min_length",
            ...ee(n),
            minimum: t
        })
    }

    function oB(t, n) {
        return new nK({
            check: "length_equals",
            ...ee(n),
            length: t
        })
    }

    function oK(t, n) {
        return new nG({
            check: "string_format",
            format: "regex",
            ...ee(n),
            pattern: t
        })
    }

    function oW(t) {
        return new nX({
            check: "string_format",
            format: "lowercase",
            ...ee(t)
        })
    }

    function oG(t) {
        return new nq({
            check: "string_format",
            format: "uppercase",
            ...ee(t)
        })
    }

    function oX(t, n) {
        return new nH({
            check: "string_format",
            format: "includes",
            ...ee(n),
            includes: t
        })
    }

    function oq(t, n) {
        return new nY({
            check: "string_format",
            format: "starts_with",
            ...ee(n),
            prefix: t
        })
    }

    function oH(t, n) {
        return new nQ({
            check: "string_format",
            format: "ends_with",
            ...ee(n),
            suffix: t
        })
    }

    function oY(t, n, i) {
        return new n4({
            check: "property",
            property: t,
            schema: n,
            ...ee(i)
        })
    }

    function oQ(t, n) {
        return new n6({
            check: "properties",
            shape: t,
            ...ee(n)
        })
    }

    function o0(t, n) {
        return new n1({
            check: "mime_type",
            mime: t,
            ...ee(n)
        })
    }

    function o4(t) {
        return new n2({
            check: "overwrite",
            tx: t
        })
    }

    function o6(t) {
        return o4(n => n.normalize(t))
    }

    function o1() {
        return o4(t => t.trim())
    }

    function o2() {
        return o4(t => t.toLowerCase())
    }

    function o9() {
        return o4(t => t.toUpperCase())
    }

    function o3() {
        return o4(t => M(t))
    }

    function o5(t, n, i) {
        return new t({
            type: "array",
            element: n,
            ...ee(i)
        })
    }

    function o7(t, n, i) {
        return new t({
            type: "union",
            options: n,
            ...ee(i)
        })
    }

    function o8(t, n, i) {
        return new t({
            type: "union",
            options: n,
            inclusive: !1,
            ...ee(i)
        })
    }

    function ce(t, n, i, r) {
        return new t({
            type: "union",
            options: i,
            discriminator: n,
            ...ee(r)
        })
    }

    function ct(t, n, i) {
        return new t({
            type: "intersection",
            left: n,
            right: i
        })
    }

    function cn(t, n, i, r) {
        let a = i instanceof n5,
            o = a ? r : i;
        return new t({
            type: "tuple",
            items: n,
            rest: a ? i : null,
            ...ee(o)
        })
    }

    function ci(t, n, i, r) {
        return new t({
            type: "record",
            keyType: n,
            valueType: i,
            ...ee(r)
        })
    }

    function cr(t, n, i, r) {
        return new t({
            type: "map",
            keyType: n,
            valueType: i,
            ...ee(r)
        })
    }

    function ca(t, n, i) {
        return new t({
            type: "set",
            valueType: n,
            ...ee(i)
        })
    }

    function co(t, n, i) {
        return new t({
            type: "enum",
            entries: Array.isArray(n) ? Object.fromEntries(n.map(t => [t, t])) : n,
            ...ee(i)
        })
    }

    function cc(t, n, i) {
        return new t({
            type: "enum",
            entries: n,
            ...ee(i)
        })
    }

    function cu(t, n, i) {
        return new t({
            type: "literal",
            values: Array.isArray(n) ? n : [n],
            ...ee(i)
        })
    }

    function cl(t, n) {
        return new t({
            type: "file",
            ...ee(n)
        })
    }

    function cs(t, n) {
        return new t({
            type: "transform",
            transform: n
        })
    }

    function cd(t, n) {
        return new t({
            type: "optional",
            innerType: n
        })
    }

    function cm(t, n) {
        return new t({
            type: "nullable",
            innerType: n
        })
    }

    function cf(t, n, i) {
        return new t({
            type: "default",
            innerType: n,
            get defaultValue() {
                return "function" == typeof i ? i() : W(i)
            }
        })
    }

    function cv(t, n, i) {
        return new t({
            type: "nonoptional",
            innerType: n,
            ...ee(i)
        })
    }

    function cp(t, n) {
        return new t({
            type: "success",
            innerType: n
        })
    }

    function cg(t, n, i) {
        return new t({
            type: "catch",
            innerType: n,
            catchValue: "function" == typeof i ? i : eF(i)
        })
    }

    function ch(t, n, i) {
        return new t({
            type: "pipe",
            in: n,
            out: i
        })
    }

    function cy(t, n) {
        return new t({
            type: "readonly",
            innerType: n
        })
    }

    function c_(t, n, i) {
        return new t({
            type: "template_literal",
            parts: n,
            ...ee(i)
        })
    }

    function cb(t, n) {
        return new t({
            type: "lazy",
            getter: n
        })
    }

    function ck(t, n) {
        return new t({
            type: "promise",
            innerType: n
        })
    }

    function cI(t, n, i) {
        let r = ee(i);
        return null != r.abort || (r.abort = !0), new t({
            type: "custom",
            check: "custom",
            fn: n,
            ...r
        })
    }

    function cw(t, n, i) {
        return new t({
            type: "custom",
            check: "custom",
            fn: n,
            ...ee(i)
        })
    }

    function cS(t, n) {
        let i = cx(n => (n.addIssue = t => {
            if ("string" == typeof t) n.issues.push(ez(t, n.value, i._zod.def));
            else t.fatal && (t.continue = !1), null != t.code || (t.code = "custom"), "input" in t || (t.input = n.value), null != t.inst || (t.inst = i), null != t.continue || (t.continue = !i._zod.def.abort), n.issues.push(ez(t))
        }, t(n.value, n)), n);
        return i
    }

    function cx(t, n) {
        let i = new nA({
            check: "custom",
            ...ee(n)
        });
        return i._zod.check = t, i
    }

    function cz(t) {
        let n = new nA({
            check: "describe"
        });
        return n._zod.onattach = [n => {
            var i;
            let r = null != (i = al.get(n)) ? i : {};
            al.add(n, {
                ...r,
                description: t
            })
        }], n._zod.check = () => {}, n
    }

    function cU(t) {
        let n = new nA({
            check: "meta"
        });
        return n._zod.onattach = [n => {
            var i;
            let r = null != (i = al.get(n)) ? i : {};
            al.add(n, {
                ...r,
                ...t
            })
        }], n._zod.check = () => {}, n
    }

    function cN(t, n) {
        var i, r, a, o, c, u;
        let l = ee(n),
            s = null != (i = l.truthy) ? i : ["true", "1", "yes", "on", "y", "enabled"],
            d = null != (r = l.falsy) ? r : ["false", "0", "no", "off", "n", "disabled"];
        "sensitive" !== l.case && (s = s.map(t => "string" == typeof t ? t.toLowerCase() : t), d = d.map(t => "string" == typeof t ? t.toLowerCase() : t));
        let m = new Set(s),
            f = new Set(d),
            v = null != (a = t.Codec) ? a : rB,
            p = null != (o = t.Boolean) ? o : iY,
            g = new v({
                type: "pipe",
                in: new(null != (c = t.String) ? c : it)({
                    type: "string",
                    error: l.error
                }),
                out: new p({
                    type: "boolean",
                    error: l.error
                }),
                transform: (t, n) => {
                    let i = t;
                    return "sensitive" !== l.case && (i = i.toLowerCase()), !!m.has(i) || !f.has(i) && (n.issues.push({
                        code: "invalid_value",
                        expected: "stringbool",
                        values: [...m, ...f],
                        input: n.value,
                        inst: g,
                        continue: !1
                    }), {})
                },
                reverseTransform: (t, n) => !0 === t ? s[0] || "true" : d[0] || "false",
                error: l.error
            });
        return g._zod.bag.truthy = s, g._zod.bag.falsy = d, g._zod.bag.case = null != (u = l.case) ? u : "insensitive", g
    }

    function cD(t, n, i) {
        let r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : {},
            a = {
                check: "string_format",
                type: "string",
                format: n,
                fn: "function" == typeof i ? i : t => i.test(t),
                ...ee(r)
            };
        return i instanceof RegExp && (a.pattern = i), new t(a)
    }

    function cO(t) {
        for (var n = arguments.length, i = Array(n > 1 ? n - 1 : 0), r = 1; r < n; r++) i[r - 1] = arguments[r];
        for (let n of i)
            for (let i of Reflect.ownKeys(n)) Object.prototype.propertyIsEnumerable.call(n, i) && O(t, i, n[i]);
        return t
    }

    function cZ(t) {
        var n, i, r, a, o, c, u, l, s;
        let d = null != (n = null == t ? void 0 : t.target) ? n : "draft-2020-12";
        return "draft-4" === d && (d = "draft-04"), "draft-7" === d && (d = "draft-07"), {
            processors: null != (i = t.processors) ? i : {},
            metadataRegistry: null != (r = null == t ? void 0 : t.metadata) ? r : al,
            target: d,
            unrepresentable: null != (a = null == t ? void 0 : t.unrepresentable) ? a : "throw",
            override: null != (o = null == t ? void 0 : t.override) ? o : () => {},
            io: null != (c = null == t ? void 0 : t.io) ? c : "output",
            counter: 0,
            seen: new Map,
            sharedDefsExtractedFor: void 0,
            sharedEmitDoneFor: void 0,
            cycles: null != (u = null == t ? void 0 : t.cycles) ? u : "ref",
            reused: null != (l = null == t ? void 0 : t.reused) ? l : "inline",
            intersections: [],
            deferred: [],
            external: null != (s = null == t ? void 0 : t.external) ? s : void 0
        }
    }

    function cA(t, n, i, r, a) {
        let o = "function" == typeof n.unrepresentable ? n.unrepresentable({
            zodSchema: t,
            path: r.path,
            message: a
        }) : n.unrepresentable;
        if ("any" === o) return !1;
        if (void 0 === o || "throw" === o) throw Error(a);
        return Object.assign(i, o), !0
    }

    function cP(t, n) {
        var i, r, a;
        let o = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {
                path: [],
                schemaPath: []
            },
            c = t._zod.def,
            u = n.seen.get(t);
        if (u) return u.count++, o.schemaPath.includes(t) && (u.cycle = o.path), u.schema;
        let l = {
            schema: {},
            count: 1,
            cycle: void 0,
            path: o.path
        };
        n.seen.set(t, l), n.sharedDefsExtractedFor = void 0, n.sharedEmitDoneFor = void 0;
        let s = null == (i = (r = t._zod).toJSONSchema) ? void 0 : i.call(r);
        if (s) l.schema = s;
        else {
            let i = {
                ...o,
                schemaPath: [...o.schemaPath, t],
                path: o.path
            };
            if (t._zod.processJSONSchema) t._zod.processJSONSchema(n, l.schema, i);
            else {
                let r = l.schema,
                    a = n.processors[c.type];
                if (!a) throw Error("[toJSONSchema]: Non-representable type encountered: ".concat(c.type));
                a(t, n, r, i)
            }
            let r = t._zod.parent;
            r && (l.ref || (l.ref = r), cP(r, n, i), n.seen.get(r).isParent = !0)
        }
        let d = n.metadataRegistry.get(t);
        return d && cO(l.schema, d), "input" === n.io && function t(n, i) {
            let r = null != i ? i : {
                seen: new Set
            };
            if (r.seen.has(n)) return !1;
            r.seen.add(n);
            let a = n._zod.def;
            if ("transform" === a.type) return !0;
            if ("array" === a.type) return t(a.element, r);
            if ("set" === a.type) return t(a.valueType, r);
            if ("lazy" === a.type) return t(a.getter(), r);
            if ("promise" === a.type || "optional" === a.type || "nonoptional" === a.type || "nullable" === a.type || "readonly" === a.type || "default" === a.type || "prefault" === a.type || "catch" === a.type) return t(a.innerType, r);
            if ("intersection" === a.type) return t(a.left, r) || t(a.right, r);
            if ("record" === a.type || "map" === a.type) return t(a.keyType, r) || t(a.valueType, r);
            if ("pipe" === a.type) return !!n._zod.traits.has("$ZodCodec") || t(a.in, r) || t(a.out, r);
            if ("object" === a.type) {
                for (let n in a.shape)
                    if (t(a.shape[n], r)) return !0;
                return !1
            }
            if ("union" === a.type) {
                for (let n of a.options)
                    if (t(n, r)) return !0;
                return !1
            }
            if ("tuple" === a.type) {
                for (let n of a.items)
                    if (t(n, r)) return !0;
                if (a.rest && t(a.rest, r)) return !0
            }
            return !1
        }(t) && (delete l.schema.examples, delete l.schema.default), "input" === n.io && "_prefault" in l.schema && (null != (a = l.schema).default || (a.default = l.schema._prefault)), delete l.schema._prefault, n.seen.get(t).schema
    }

    function cj(t) {
        return t.replace(/~/g, "~0").replace(/\//g, "~1")
    }

    function c$(t, n) {
        var i, r, a, o;
        let c = t.seen.get(n);
        if (!c) throw Error("Unprocessed schema. This is a bug in Zod.");
        if (t.external && t.sharedDefsExtractedFor === t.external) return;
        let u = new Map;
        for (let n of t.seen.entries()) {
            let r = null == (i = t.metadataRegistry.get(n[0])) ? void 0 : i.id;
            if (r) {
                let t = u.get(r);
                if (t && t !== n[0]) throw Error('Duplicate schema id "'.concat(r, '" detected during JSON Schema conversion. Two different schemas cannot share the same id when converted together.'));
                u.set(r, n[0])
            }
        }
        let l = n => {
            if (n[1].schema.$ref) return;
            let i = n[1],
                {
                    ref: r,
                    defId: a
                } = (n => {
                    var i, r, a, o, u;
                    let l = "draft-2020-12" === t.target ? "$defs" : "definitions";
                    if (t.external) {
                        let i = null == (u = t.external.registry.get(n[0])) ? void 0 : u.id,
                            c = null != (r = t.external.uri) ? r : t => t;
                        if (i) return {
                            ref: c(i)
                        };
                        let s = null != (a = null != (o = n[1].defId) ? o : n[1].schema.id) ? a : "schema".concat(t.counter++);
                        return n[1].defId = s, {
                            defId: s,
                            ref: "".concat(c("__shared"), "#/").concat(l, "/").concat(cj(s))
                        }
                    }
                    let s = "".concat("#", "/").concat(l, "/");
                    if (n[1] === c && !n[1].schema.id) return {
                        ref: "#"
                    };
                    let d = null != (i = n[1].schema.id) ? i : "__schema".concat(t.counter++);
                    return {
                        defId: d,
                        ref: s + cj(d)
                    }
                })(n);
            i.def = {
                ...i.schema
            }, a && (i.defId = a);
            let o = i.schema;
            for (let t in o) delete o[t];
            o.$ref = r
        };
        if ("throw" === t.cycles)
            for (let n of t.seen.entries()) {
                let t = n[1];
                if (t.cycle) throw Error("Cycle detected: " + "#/".concat(null == (r = t.cycle) ? void 0 : r.join("/"), "/<root>") + '\n\nSet the `cycles` parameter to `"ref"` to resolve cyclical schemas with defs.')
            }
        for (let i of t.seen.entries()) {
            let r = i[1];
            if (n === i[0]) {
                l(i);
                continue
            }
            if (t.external) {
                let r = null == (o = t.external.registry.get(i[0])) ? void 0 : o.id;
                if (n !== i[0] && r) {
                    l(i);
                    continue
                }
            }
            if ((null == (a = t.metadataRegistry.get(i[0])) ? void 0 : a.id) || r.cycle) {
                l(i);
                continue
            }
            r.count > 1 && "ref" === t.reused && l(i)
        }
        t.external && (t.sharedDefsExtractedFor = t.external)
    }
    t.s(["TimePrecision", 0, oi, "_any", 0, oS, "_array", 0, o5, "_base64", 0, a5, "_base64url", 0, a7, "_bigint", 0, oh, "_boolean", 0, op, "_catch", 0, cg, "_check", 0, cx, "_cidrv4", 0, a9, "_cidrv6", 0, a3, "_coercedBigint", 0, oy, "_coercedBoolean", 0, og, "_coercedDate", 0, oD, "_coercedNumber", 0, ol, "_coercedString", 0, aJ, "_creditCard", 0, oe, "_cuid", 0, aH, "_cuid2", 0, aY, "_custom", 0, cI, "_date", 0, oN, "_default", 0, cf, "_discriminatedUnion", 0, ce, "_e164", 0, a8, "_email", 0, aM, "_emoji", 0, aX, "_endsWith", 0, oH, "_enum", 0, co, "_file", 0, cl, "_float32", 0, od, "_float64", 0, om, "_gt", 0, oP, "_gte", 0, oj, "_guid", 0, aV, "_iban", 0, ot, "_includes", 0, oX, "_int", 0, os, "_int32", 0, of, "_int64", 0, o_, "_intersection", 0, ct, "_ipv4", 0, a6, "_ipv6", 0, a1, "_isoDate", 0, oa, "_isoDateTime", 0, or, "_isoDuration", 0, oc, "_isoTime", 0, oo, "_jwt", 0, on, "_ksuid", 0, a4, "_lazy", 0, cb, "_length", 0, oB, "_literal", 0, cu, "_lowercase", 0, oW, "_lt", 0, oZ, "_lte", 0, oA, "_mac", 0, a2, "_map", 0, cr, "_max", 0, oA, "_maxLength", 0, oV, "_maxSize", 0, oR, "_mime", 0, o0, "_min", 0, oj, "_minLength", 0, oF, "_minSize", 0, oJ, "_multipleOf", 0, oC, "_nan", 0, oO, "_nanoid", 0, aq, "_nativeEnum", 0, cc, "_negative", 0, oE, "_never", 0, oz, "_nonnegative", 0, oL, "_nonoptional", 0, cv, "_nonpositive", 0, oT, "_normalize", 0, o6, "_null", 0, ow, "_nullable", 0, cm, "_number", 0, ou, "_optional", 0, cd, "_overwrite", 0, o4, "_pipe", 0, ch, "_positive", 0, o$, "_promise", 0, ck, "_properties", 0, oQ, "_property", 0, oY, "_readonly", 0, cy, "_record", 0, ci, "_refine", 0, cw, "_regex", 0, oK, "_set", 0, ca, "_size", 0, oM, "_slugify", 0, o3, "_startsWith", 0, oq, "_string", 0, aR, "_stringFormat", 0, cD, "_stringbool", 0, cN, "_success", 0, cp, "_superRefine", 0, cS, "_symbol", 0, ok, "_templateLiteral", 0, c_, "_toLowerCase", 0, o2, "_toUpperCase", 0, o9, "_transform", 0, cs, "_trim", 0, o1, "_tuple", 0, cn, "_uint32", 0, ov, "_uint64", 0, ob, "_ulid", 0, aQ, "_undefined", 0, oI, "_union", 0, o7, "_unknown", 0, ox, "_uppercase", 0, oG, "_url", 0, aG, "_uuid", 0, aF, "_uuidv4", 0, aB, "_uuidv6", 0, aK, "_uuidv7", 0, aW, "_void", 0, oU, "_xid", 0, a0, "_xor", 0, o8, "describe", 0, cz, "meta", 0, cU], 239523), t.i(239523);
    let cE = new Set(["type", "properties", "required", "additionalProperties"]),
        cT = ["oneOf", "anyOf"];

    function cL(t) {
        let n = t.additionalProperties;
        return void 0 === n || !1 === n || "object" != typeof n || null === n ? null : Object.keys(n).length ? n : null
    }

    function cC(t) {
        let n = [];
        for (let i of t) {
            if ("object" != typeof i || "object" !== i.type) return null;
            for (let t in i)
                if (!cE.has(t)) return null;
            n.push(i)
        }
        let i = {},
            r = new Set;
        for (let t of n) {
            var a, o, c, u;
            for (let r in t.properties) {
                if (Object.prototype.hasOwnProperty.call(i, r)) continue;
                let t = [];
                for (let i of n) {
                    let n = null != (c = null == (u = i.properties) ? void 0 : u[r]) ? c : cL(i);
                    null != n && (t.some(t => JSON.stringify(t) === JSON.stringify(n)) || t.push(n))
                }
                O(i, r, 1 === t.length ? t[0] : null != (o = cC(t)) ? o : {
                    allOf: t
                })
            }
            for (let n of null != (a = t.required) ? a : []) r.add(n)
        }
        let l = {
            type: "object",
            properties: i
        };
        if (r.size && (l.required = [...r]), n.every(t => !1 === t.additionalProperties)) l.additionalProperties = !1;
        else {
            let t = [];
            for (let i of n) {
                let n = cL(i);
                n && !t.some(t => JSON.stringify(t) === JSON.stringify(n)) && t.push(n)
            }
            1 === t.length ? l.additionalProperties = t[0] : t.length > 1 && (l.additionalProperties = {
                allOf: t
            })
        }
        return l
    }

    function cR(t, n) {
        var i, r, a, o, c, u, l, s;
        let d = t.seen.get(n);
        if (!d) throw Error("Unprocessed schema. This is a bug in Zod.");
        let m = n => {
            var i, r, a;
            let o = t.seen.get(n);
            if (null === o.ref) return;
            let c = null != (i = o.def) ? i : o.schema,
                u = {
                    ...c
                },
                l = o.ref;
            if (o.ref = null, l) {
                m(l);
                let i = t.seen.get(l),
                    r = i.schema;
                if (r.$ref && ("draft-07" === t.target || "draft-04" === t.target || "openapi-3.0" === t.target) ? (c.allOf = null != (a = c.allOf) ? a : [], c.allOf.push(r)) : cO(c, r), cO(c, u), n._zod.parent === l)
                    for (let t in c) "$ref" !== t && "allOf" !== t && (t in u || delete c[t]);
                if (r.$ref && i.def)
                    for (let t in c) "$ref" !== t && "allOf" !== t && t in i.def && JSON.stringify(c[t]) === JSON.stringify(i.def[t]) && delete c[t]
            }
            let s = n._zod.parent;
            if (s && s !== l) {
                m(s);
                let n = t.seen.get(s);
                if ((null == n ? void 0 : n.schema.$ref) && (c.$ref = n.schema.$ref, n.def))
                    for (let t in c) "$ref" !== t && "allOf" !== t && t in n.def && JSON.stringify(c[t]) === JSON.stringify(n.def[t]) && delete c[t]
            }
            t.override({
                zodSchema: n,
                jsonSchema: c,
                path: null != (r = o.path) ? r : []
            })
        };
        if (!t.external || t.sharedEmitDoneFor !== t.external) {
            for (let n of [...t.seen.entries()].reverse()) m(n[0]);
            if ("openapi-3.0" !== t.target)
                for (let n of t.seen.entries()) ! function t(n) {
                    let i = n.anyOf;
                    if (!Array.isArray(i) || 0 === i.length || void 0 !== n.type) return;
                    let r = [];
                    for (let n of i) {
                        if (!n || "object" != typeof n) return;
                        t(n);
                        let i = Object.keys(n);
                        if (1 !== i.length || "type" !== i[0]) return;
                        let a = n.type;
                        for (let t of Array.isArray(a) ? a : [a]) {
                            if ("string" != typeof t) return;
                            r.includes(t) || r.push(t)
                        }
                    }
                    delete n.anyOf, n.type = 1 === r.length ? r[0] : r
                }(null != (u = n[1].def) ? u : n[1].schema);
            for (let n of t.deferred) n();
            if (t.intersections.length) {
                let n = new Map;
                for (let i of t.seen.values())
                    for (let t of [i.schema, i.def]) {
                        let i = null == t ? void 0 : t.allOf;
                        if (!Array.isArray(i)) continue;
                        let r = n.get(i);
                        r ? r.push(t) : n.set(i, [t])
                    }
                for (let i of t.intersections)
                    for (let t of null != (l = n.get(i)) ? l : []) ! function(t) {
                        let n = t.allOf;
                        if (!Array.isArray(n) || n.length < 2) return;
                        for (let n of cE)
                            if (n in t) return;
                        let i = n.filter(t => cT.some(n => Array.isArray(t[n]))),
                            r = null;
                        if (i.length) {
                            let t = i[0],
                                a = cT.find(n => Array.isArray(t[n]));
                            if (1 !== Object.keys(t).length) return;
                            let o = n.filter(n => n !== t),
                                c = t[a].map(t => cC([...o, t]));
                            if (c.some(t => !t)) return;
                            r = {
                                [a]: c
                            }
                        } else r = cC(n);
                        r && (delete t.allOf, cO(t, r))
                    }(t)
            }
        }
        let f = {};
        if ("draft-2020-12" === t.target ? f.$schema = "https://json-schema.org/draft/2020-12/schema" : "draft-07" === t.target ? f.$schema = "http://json-schema.org/draft-07/schema#" : "draft-04" === t.target ? f.$schema = "http://json-schema.org/draft-04/schema#" : t.target, null == (a = t.external) ? void 0 : a.uri) {
            let i = null == (s = t.external.registry.get(n)) ? void 0 : s.id;
            if (!i) throw Error("Schema is missing an `id` property");
            f.$id = t.external.uri(i)
        }
        cO(f, d.defId ? d.schema : null != (i = d.def) ? i : d.schema);
        let v = null == (o = t.metadataRegistry.get(n)) ? void 0 : o.id;
        void 0 !== v && f.id === v && delete f.id;
        let p = null != (r = null == (c = t.external) ? void 0 : c.defs) ? r : {};
        if (!t.external || t.sharedEmitDoneFor !== t.external)
            for (let n of t.seen.entries()) {
                let t = n[1];
                t.def && t.defId && (t.def.id === t.defId && delete t.def.id, O(p, t.defId, t.def))
            }
        t.external && (t.sharedEmitDoneFor = t.external), t.external || Object.keys(p).length > 0 && ("draft-2020-12" === t.target ? f.$defs = p : f.definitions = p);
        try {
            let i = JSON.parse(JSON.stringify(f));
            return Object.defineProperty(i, "~standard", {
                value: {
                    ...n["~standard"],
                    jsonSchema: {
                        input: cM(n, "input", t.processors),
                        output: cM(n, "output", t.processors)
                    }
                },
                enumerable: !1,
                writable: !1
            }), i
        } catch (t) {
            throw Error("Error converting schema to JSON.")
        }
    }
    let cJ = function(t) {
            let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return i => {
                let r = cZ({
                    ...i,
                    processors: n
                });
                return cP(t, r), c$(r, t), cR(r, t)
            }
        },
        cM = function(t, n) {
            let i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
            return r => {
                let {
                    libraryOptions: a,
                    target: o
                } = null != r ? r : {}, c = cZ({
                    ...null != a ? a : {},
                    target: o,
                    io: n,
                    processors: i
                });
                return cP(t, c), c$(c, t), cR(c, t)
            }
        };
    t.s(["createStandardJSONSchemaMethod", 0, cM, "createToJSONSchemaMethod", 0, cJ, "extractDefs", 0, c$, "finalize", 0, cR, "handleUnrepresentable", 0, cA, "initializeContext", 0, cZ, "process", 0, cP, "processSchema", 0, cP], 674317), t.i(674317);
    let cV = (t, n, i) => {
            (void 0 === t[n] || i > t[n]) && (t[n] = i)
        },
        cF = (t, n, i) => {
            (void 0 === t[n] || i < t[n]) && (t[n] = i)
        },
        cB = (t, n) => {
            cV(t, "minimum", n), cF(t, "maximum", n)
        },
        cK = (t, n) => {
            null != t.multipleOf || (t.multipleOf = []), t.multipleOf.includes(n) || t.multipleOf.push(n)
        },
        cW = (t, n) => {
            null != t.patterns || (t.patterns = new Set), t.patterns.add(n)
        },
        cG = (t, n) => {
            t.mime = t.mime ? t.mime.filter(t => n.includes(t)) : [...n]
        },
        cX = (t, n) => {
            t.format = n, n.includes("int") && (t.isInt = !0)
        },
        cq = (t, n) => cV(t, "minimum", n.minimum),
        cH = (t, n) => cF(t, "maximum", n.maximum),
        cY = t => (n, i) => {
            cX(n, i.format);
            let [r, a] = t[i.format];
            cV(n, "minimum", r), cF(n, "maximum", a)
        },
        cQ = {
            greater_than: (t, n) => cV(t, n.inclusive ? "minimum" : "exclusiveMinimum", n.value),
            less_than: (t, n) => cF(t, n.inclusive ? "maximum" : "exclusiveMaximum", n.value),
            multiple_of: (t, n) => cK(t, n.value),
            number_format: cY(er),
            bigint_format: cY(ea),
            min_length: cq,
            max_length: cH,
            length_equals: (t, n) => cB(t, n.length),
            min_size: cq,
            max_size: cH,
            size_equals: (t, n) => cB(t, n.size),
            string_format: (t, n) => {
                cX(t, n.format), n.pattern && cW(t, n.pattern), ("base64" === n.format || "base64url" === n.format) && (t.contentEncoding = n.format), (n.local || -1 === n.precision) && (t.laxFormat = !0)
            },
            mime_type: (t, n) => cG(t, n.mime)
        };

    function c0(t) {
        var n, i, r, a;
        let o = {},
            c = t._zod.def;
        for (let r of t._zod.traits.has("$ZodCheck") ? [t, ...null != (n = c.checks) ? n : []] : null != (i = c.checks) ? i : []) null == (a = cQ[r._zod.def.check]) || a.call(cQ, o, r._zod.def);
        let u = t._zod.bag;
        for (let t of (void 0 !== u.minimum && cV(o, "minimum", u.minimum), void 0 !== u.exclusiveMinimum && cV(o, "exclusiveMinimum", u.exclusiveMinimum), void 0 !== u.maximum && cF(o, "maximum", u.maximum), void 0 !== u.exclusiveMaximum && cF(o, "exclusiveMaximum", u.exclusiveMaximum), void 0 !== u.multipleOf && cK(o, u.multipleOf), void 0 !== u.format && (null != o.format || (o.format = u.format), u.format.includes("int") && (o.isInt = !0)), u.mime && cG(o, u.mime), null != (r = u.patterns) ? r : [])) cW(o, t);
        return o
    }
    let c4 = {
            guid: "uuid",
            url: "uri",
            datetime: "date-time",
            json_string: "json-string",
            regex: ""
        },
        c6 = new Map([
            [iE, to],
            [iL, tc]
        ]),
        c1 = t => {
            var n;
            return null != (n = c6.get(t)) ? n : t
        },
        c2 = (t, n, i, r) => {
            i.type = "string";
            let {
                minimum: a,
                maximum: o,
                format: c,
                patterns: u,
                contentEncoding: l,
                laxFormat: s
            } = c0(t);
            if ("number" == typeof a && (i.minLength = a), "number" == typeof o && (i.maxLength = o), c) {
                var d;
                i.format = null != (d = c4[c]) ? d : c, "" === i.format && delete i.format, ("time" === c || s) && delete i.format
            }
            if (l && (i.contentEncoding = l), u && u.size > 0) {
                let t = [...u].map(c1);
                1 === t.length ? i.pattern = t[0].source : t.length > 1 && (i.allOf = [...t.map(t => ({
                    ..."draft-07" === n.target || "draft-04" === n.target || "openapi-3.0" === n.target ? {
                        type: "string"
                    } : {},
                    pattern: t.source
                }))])
            }
        },
        c9 = (t, n, i, r) => {
            let {
                minimum: a,
                maximum: o,
                multipleOf: c,
                exclusiveMaximum: u,
                exclusiveMinimum: l,
                isInt: s
            } = c0(t);
            i.type = s ? "integer" : "number";
            let d = "number" == typeof l && l >= (null != a ? a : -1 / 0),
                m = "number" == typeof u && u <= (null != o ? o : 1 / 0),
                f = "draft-04" === n.target || "openapi-3.0" === n.target;
            if (d ? f ? (i.minimum = l, i.exclusiveMinimum = !0) : i.exclusiveMinimum = l : "number" == typeof a && (i.minimum = a), m ? f ? (i.maximum = u, i.exclusiveMaximum = !0) : i.exclusiveMaximum = u : "number" == typeof o && (i.maximum = o), c) {
                var v;
                let a = new Set;
                for (let o of c) Number.isFinite(o) && 0 !== o ? a.add(Math.abs(o)) : cA(t, n, i, r, "A multipleOf divisor of ".concat(o, " cannot be represented in JSON Schema"));
                let [o, ...u] = a;
                void 0 !== o && (i.multipleOf = o), u.length && (i.allOf = [...null != (v = i.allOf) ? v : [], ...u.map(t => ({
                    multipleOf: t
                }))])
            }
        },
        c3 = (t, n, i, r) => {
            i.type = "boolean"
        },
        c5 = (t, n, i, r) => {
            cA(t, n, i, r, "BigInt cannot be represented in JSON Schema")
        },
        c7 = (t, n, i, r) => {
            cA(t, n, i, r, "Symbols cannot be represented in JSON Schema")
        },
        c8 = (t, n, i, r) => {
            "openapi-3.0" === n.target ? (i.type = "string", i.nullable = !0, i.enum = [null]) : i.type = "null"
        },
        ue = (t, n, i, r) => {
            cA(t, n, i, r, "Undefined cannot be represented in JSON Schema")
        },
        ut = (t, n, i, r) => {
            cA(t, n, i, r, "Void cannot be represented in JSON Schema")
        },
        un = (t, n, i, r) => {
            i.not = {}
        },
        ui = (t, n, i, r) => {},
        ur = (t, n, i, r) => {},
        ua = (t, n, i, r) => {
            cA(t, n, i, r, "Date cannot be represented in JSON Schema")
        },
        uo = (t, n, i, r) => {
            let a = _(t._zod.def.entries);
            if (0 === a.length) {
                i.not = {};
                return
            }
            a.every(t => "number" == typeof t) && (i.type = "number"), a.every(t => "string" == typeof t) && (i.type = "string"), i.enum = a
        },
        uc = (t, n, i, r) => {
            let a = t._zod.def;
            if (0 === a.values.length) {
                i.not = {};
                return
            }
            let o = [];
            for (let c of a.values)
                if (void 0 === c) {
                    if (cA(t, n, i, r, "Literal `undefined` cannot be represented in JSON Schema")) return
                } else if ("bigint" == typeof c) {
                if (cA(t, n, i, r, "BigInt literals cannot be represented in JSON Schema")) return;
                o.push(Number(c))
            } else o.push(c);
            if (0 === o.length);
            else if (1 === o.length) {
                let t = o[0];
                i.type = null === t ? "null" : typeof t, "draft-04" === n.target || "openapi-3.0" === n.target ? i.enum = [t] : i.const = t
            } else o.every(t => "number" == typeof t) && (i.type = "number"), o.every(t => "string" == typeof t) && (i.type = "string"), o.every(t => "boolean" == typeof t) && (i.type = "boolean"), o.every(t => null === t) && (i.type = "null"), i.enum = o
        },
        uu = (t, n, i, r) => {
            cA(t, n, i, r, "NaN cannot be represented in JSON Schema")
        },
        ul = (t, n, i, r) => {
            let a = t._zod.pattern;
            if (!a) throw Error("Pattern not found in template literal");
            i.type = "string", i.pattern = a.source
        },
        us = (t, n, i, r) => {
            i.type = "string", i.format = "binary", i.contentEncoding = "binary";
            let {
                minimum: a,
                maximum: o,
                mime: c
            } = c0(t);
            void 0 !== a && (i.minLength = a), void 0 !== o && (i.maxLength = o), c && (0 === c.length ? i.not = {} : 1 === c.length ? i.contentMediaType = c[0] : i.anyOf = c.map(t => ({
                contentMediaType: t
            })))
        },
        ud = (t, n, i, r) => {
            i.type = "boolean"
        },
        um = (t, n, i, r) => {
            cA(t, n, i, r, "Custom types cannot be represented in JSON Schema")
        },
        uf = (t, n, i, r) => {
            cA(t, n, i, r, "Function types cannot be represented in JSON Schema")
        },
        uv = (t, n, i, r) => {
            cA(t, n, i, r, "Transforms cannot be represented in JSON Schema")
        },
        up = (t, n, i, r) => {
            cA(t, n, i, r, "Map cannot be represented in JSON Schema")
        },
        ug = (t, n, i, r) => {
            cA(t, n, i, r, "Set cannot be represented in JSON Schema")
        },
        uh = (t, n, i, r) => {
            let a = t._zod.def,
                {
                    minimum: o,
                    maximum: c
                } = c0(t);
            "number" == typeof o && (i.minItems = o), "number" == typeof c && (i.maxItems = c), i.type = "array", i.items = cP(a.element, n, {
                ...r,
                path: [...r.path, "items"]
            })
        };

    function uy(t) {
        let n = t._zod.def;
        return "pipe" === n.type && n.in._zod.traits.has("$ZodTransform") ? uy(n.out) : "catch" === n.type ? uy(n.innerType) : t._zod.optin
    }
    let u_ = (t, n, i, r) => {
            var a;
            let o = t._zod.def,
                c = o.shape;
            if (Object.getOwnPropertySymbols(c).length && cA(t, n, i, r, "Symbol keys cannot be represented in JSON Schema")) return;
            for (let t in i.type = "object", i.properties = {}, c) O(i.properties, t, cP(c[t], n, {
                ...r,
                path: [...r.path, "properties", t]
            }));
            let u = [];
            for (let t of Object.keys(c)) {
                let i = o.shape[t];
                ("input" === n.io ? void 0 === uy(i) : void 0 === i._zod.optout) && u.push(t)
            }
            u.length > 0 && (i.required = u), (null == (a = o.catchall) ? void 0 : a._zod.def.type) === "never" ? i.additionalProperties = !1 : o.catchall ? o.catchall && (i.additionalProperties = cP(o.catchall, n, {
                ...r,
                path: [...r.path, "additionalProperties"]
            })) : "output" === n.io && (i.additionalProperties = !1)
        },
        ub = (t, n, i, r) => {
            let a = t._zod.def,
                o = !1 === a.inclusive,
                c = a.options.map((t, i) => cP(t, n, {
                    ...r,
                    path: [...r.path, o ? "oneOf" : "anyOf", i]
                }));
            o ? i.oneOf = c : i.anyOf = c
        },
        uk = (t, n, i, r) => {
            let a = t._zod.def,
                o = cP(a.left, n, {
                    ...r,
                    path: [...r.path, "allOf", 0]
                }),
                c = cP(a.right, n, {
                    ...r,
                    path: [...r.path, "allOf", 1]
                }),
                u = t => "allOf" in t && 1 === Object.keys(t).length,
                l = [...u(o) ? o.allOf : [o], ...u(c) ? c.allOf : [c]];
            i.allOf = l, n.intersections.push(l)
        },
        uI = (t, n, i, r) => {
            let a = t._zod.def;
            i.type = "array";
            let o = "draft-2020-12" === n.target ? "prefixItems" : "items",
                c = "draft-2020-12" === n.target || "openapi-3.0" === n.target ? "items" : "additionalItems",
                u = a.items.map((t, i) => cP(t, n, {
                    ...r,
                    path: [...r.path, o, i]
                })),
                l = a.rest ? cP(a.rest, n, {
                    ...r,
                    path: [...r.path, c, ..."openapi-3.0" === n.target ? [a.items.length] : []]
                }) : null,
                s = a.items.length;
            for (; s > 0;) {
                let t = a.items[s - 1];
                if (!("input" === n.io ? void 0 !== uy(t) : "optional" === t._zod.optout)) break;
                s--
            }
            let d = a.items.length,
                m = !a.rest;
            "draft-2020-12" === n.target ? (i.prefixItems = u, m ? i.items = !1 : l && (i.items = l)) : "openapi-3.0" === n.target ? (i.items = {
                anyOf: u
            }, l && i.items.anyOf.push(l)) : (i.items = u, m ? i.additionalItems = !1 : l && (i.additionalItems = l)), s > 0 && (i.minItems = s), m && (i.maxItems = d);
            let {
                minimum: f,
                maximum: v
            } = c0(t);
            "number" == typeof f && (i.minItems = f), "number" == typeof v && (i.maxItems = v)
        },
        uw = new WeakMap,
        uS = (t, n, i, r) => {
            let a = t._zod.def;
            i.type = "object";
            let o = a.keyType,
                c = c0(o).patterns;
            if ("loose" === a.mode && c && c.size > 0) {
                let t = cP(a.valueType, n, {
                    ...r,
                    path: [...r.path, "patternProperties", "*"]
                });
                for (let n of (i.patternProperties = {}, c)) O(i.patternProperties, c1(n).source, t)
            } else {
                if ("draft-07" === n.target || "draft-2020-12" === n.target) {
                    i.propertyNames = cP(a.keyType, n, {
                        ...r,
                        path: [...r.path, "propertyNames"]
                    });
                    let o = uw.get(n);
                    o || (o = [], uw.set(n, o), n.deferred.push(() => (function(t) {
                        var n, i, r;
                        let a = new Map;
                        for (let n of t.seen.values()) n.def && !a.has(n.schema) && a.set(n.schema, n);
                        let o = new Map;
                        for (let c of null != (n = uw.get(t)) ? n : []) {
                            let n = t.seen.get(c),
                                u = null == (r = null != (i = null == n ? void 0 : n.def) ? i : null == n ? void 0 : n.schema) ? void 0 : r.propertyNames;
                            if (!u || !0 === u || o.has(u)) continue;
                            let l = function t(n, i, r) {
                                var a, o;
                                if (i.$ref) {
                                    if (r.has(i)) return i;
                                    r.add(i);
                                    let a = null == (o = n.get(i)) ? void 0 : o.def;
                                    if (!a) return i;
                                    let c = t(n, a, r);
                                    return c === a ? i : c
                                }
                                for (let a of ["anyOf", "oneOf"]) {
                                    let o = i[a];
                                    if (!Array.isArray(o)) continue;
                                    let c = o.map(i => t(n, i, r));
                                    c.some((t, n) => t !== o[n]) && (i = {
                                        ...i,
                                        [a]: c
                                    })
                                }
                                let c = Array.isArray(i.type) ? i.type : [i.type],
                                    u = !c.includes("string") && c.some(t => "number" === t || "integer" === t),
                                    l = null != (a = i.enum) ? a : void 0 !== i.const ? [i.const] : void 0;
                                if (!u && !(null == l ? void 0 : l.some(t => "number" == typeof t))) return i;
                                let {
                                    minimum: s,
                                    maximum: d,
                                    exclusiveMinimum: m,
                                    exclusiveMaximum: f,
                                    multipleOf: v,
                                    format: p,
                                    id: g,
                                    ...h
                                } = i;
                                return h.enum ? h.enum = h.enum.map(t => "number" == typeof t ? String(t) : t) : "number" == typeof h.const && (h.const = String(h.const)), u && (h.type = "string", l || (h.pattern = (c.includes("number") ? tS : tw).source)), h
                            }(a, u, new Set);
                            l !== u && o.set(u, l)
                        }
                        if (o.size)
                            for (let n of t.seen.values())
                                for (let t of [n.schema, n.def]) {
                                    let n = t && o.get(t.propertyNames);
                                    n && (t.propertyNames = n)
                                }
                    })(n))), o.push(t)
                }
                i.additionalProperties = cP(a.valueType, n, {
                    ...r,
                    path: [...r.path, "additionalProperties"]
                })
            }
            let u = o._zod.values,
                l = "input" === n.io && void 0 !== uy(a.valueType);
            if (u && !a.partial && !l) {
                let t = [...u].filter(t => "string" == typeof t || "number" == typeof t);
                t.length > 0 && (i.required = t.map(String))
            }
        },
        ux = (t, n, i, r) => {
            let a = t._zod.def,
                o = cP(a.innerType, n, r),
                c = n.seen.get(t);
            "openapi-3.0" === n.target ? (c.ref = a.innerType, i.nullable = !0) : i.anyOf = [o, {
                type: "null"
            }]
        },
        uz = (t, n, i, r) => {
            let a = t._zod.def;
            cP(a.innerType, n, r), n.seen.get(t).ref = a.innerType
        },
        uU = Symbol();

    function uN(t, n, i, r, a) {
        let o = !1,
            c = JSON.stringify(t, (t, n) => "bigint" != typeof n ? n : (o = !0, null));
        return o ? (cA(n, i, r, a, "BigInt defaults cannot be represented in JSON Schema"), uU) : JSON.parse(c)
    }
    let uD = (t, n, i, r) => {
            let a = t._zod.def;
            cP(a.innerType, n, r), n.seen.get(t).ref = a.innerType;
            let o = uN(a.defaultValue, t, n, i, r);
            o !== uU && (i.default = o)
        },
        uO = (t, n, i, r) => {
            let a = t._zod.def;
            if (cP(a.innerType, n, r), n.seen.get(t).ref = a.innerType, "input" !== n.io) return;
            let o = uN(a.defaultValue, t, n, i, r);
            o !== uU && (i._prefault = o)
        },
        uZ = (t, n, i, r) => {
            let a, o = t._zod.def;
            cP(o.innerType, n, r), n.seen.get(t).ref = o.innerType;
            try {
                a = o.catchValue(void 0)
            } catch (a) {
                cA(t, n, i, r, "Dynamic catch values are not supported in JSON Schema");
                return
            }
            i.default = a
        },
        uA = (t, n, i, r) => {
            let a = t._zod.def,
                o = a.in._zod.traits.has("$ZodTransform"),
                c = "input" === n.io ? o ? a.out : a.in : a.out;
            cP(c, n, r), n.seen.get(t).ref = c
        },
        uP = (t, n, i, r) => {
            let a = t._zod.def;
            cP(a.innerType, n, r), n.seen.get(t).ref = a.innerType, i.readOnly = !0
        },
        uj = (t, n, i, r) => {
            let a = t._zod.def;
            cP(a.innerType, n, r), n.seen.get(t).ref = a.innerType
        },
        u$ = (t, n, i, r) => {
            let a = t._zod.def;
            cP(a.innerType, n, r), n.seen.get(t).ref = a.innerType
        },
        uE = (t, n, i, r) => {
            let a = t._zod.innerType;
            cP(a, n, r), n.seen.get(t).ref = a
        },
        uT = {
            string: c2,
            number: c9,
            boolean: c3,
            bigint: c5,
            symbol: c7,
            null: c8,
            undefined: ue,
            void: ut,
            never: un,
            any: ui,
            unknown: ur,
            date: ua,
            enum: uo,
            literal: uc,
            nan: uu,
            template_literal: ul,
            file: us,
            success: ud,
            custom: um,
            function: uf,
            transform: uv,
            map: up,
            set: ug,
            array: uh,
            object: u_,
            union: ub,
            intersection: uk,
            tuple: uI,
            record: uS,
            nullable: ux,
            nonoptional: uz,
            default: uD,
            prefault: uO,
            catch: uZ,
            pipe: uA,
            readonly: uP,
            promise: uj,
            optional: u$,
            lazy: uE
        };

    function uL(t, n) {
        if ("_idmap" in t) {
            let i = cZ({
                    ...n,
                    processors: uT
                }),
                r = {};
            for (let n of t._idmap.entries()) {
                let [t, r] = n;
                cP(r, i)
            }
            let a = {};
            for (let o of (i.external = {
                    registry: t,
                    uri: null == n ? void 0 : n.uri,
                    defs: r
                }, t._idmap.entries())) {
                let [t, n] = o;
                c$(i, n), O(a, t, cR(i, n))
            }
            return Object.keys(r).length > 0 && (a.__shared = {
                ["draft-2020-12" === i.target ? "$defs" : "definitions"]: r
            }), {
                schemas: a
            }
        }
        let i = cZ({
            ...n,
            processors: uT
        });
        return cP(t, i), c$(i, t), cR(i, t)
    }
    t.s(["aggregateChecks", 0, c0, "allProcessors", 0, uT, "anyProcessor", 0, ui, "arrayProcessor", 0, uh, "bigintProcessor", 0, c5, "booleanProcessor", 0, c3, "catchProcessor", 0, uZ, "customProcessor", 0, um, "dateProcessor", 0, ua, "defaultProcessor", 0, uD, "enumProcessor", 0, uo, "fileProcessor", 0, us, "functionProcessor", 0, uf, "intersectionProcessor", 0, uk, "lazyProcessor", 0, uE, "literalProcessor", 0, uc, "mapProcessor", 0, up, "nanProcessor", 0, uu, "neverProcessor", 0, un, "nonoptionalProcessor", 0, uz, "nullProcessor", 0, c8, "nullableProcessor", 0, ux, "numberProcessor", 0, c9, "objectProcessor", 0, u_, "optionalProcessor", 0, u$, "pipeProcessor", 0, uA, "prefaultProcessor", 0, uO, "promiseProcessor", 0, uj, "readonlyProcessor", 0, uP, "recordProcessor", 0, uS, "setProcessor", 0, ug, "stringProcessor", 0, c2, "successProcessor", 0, ud, "symbolProcessor", 0, c7, "templateLiteralProcessor", 0, ul, "toJSONSchema", 0, uL, "transformProcessor", 0, uv, "tupleProcessor", 0, uI, "undefinedProcessor", 0, ue, "unionProcessor", 0, ub, "unknownProcessor", 0, ur, "voidProcessor", 0, ut], 168722), t.s(["$ZodAny", 0, i2, "$ZodArray", 0, re, "$ZodAsyncError", 0, l, "$ZodBase64", 0, iT, "$ZodBase64URL", 0, iR, "$ZodBigInt", 0, iQ, "$ZodBigIntFormat", 0, i0, "$ZodBoolean", 0, iY, "$ZodCIDRv4", 0, iA, "$ZodCIDRv6", 0, ij, "$ZodCUID", 0, iy, "$ZodCUID2", 0, i_, "$ZodCatch", 0, rJ, "$ZodCheck", 0, nA, "$ZodCheckBigIntFormat", 0, nR, "$ZodCheckEndsWith", 0, nQ, "$ZodCheckGreaterThan", 0, nT, "$ZodCheckIncludes", 0, nH, "$ZodCheckLengthEquals", 0, nK, "$ZodCheckLessThan", 0, nE, "$ZodCheckLowerCase", 0, nX, "$ZodCheckMaxLength", 0, nF, "$ZodCheckMaxSize", 0, nJ, "$ZodCheckMimeType", 0, n1, "$ZodCheckMinLength", 0, nB, "$ZodCheckMinSize", 0, nM, "$ZodCheckMultipleOf", 0, nL, "$ZodCheckNumberFormat", 0, nC, "$ZodCheckOverwrite", 0, n2, "$ZodCheckProperties", 0, n6, "$ZodCheckProperty", 0, n4, "$ZodCheckRegex", 0, nG, "$ZodCheckSizeEquals", 0, nV, "$ZodCheckStartsWith", 0, nY, "$ZodCheckStringFormat", 0, nW, "$ZodCheckUpperCase", 0, nq, "$ZodCodec", 0, rB, "$ZodCreditCard", 0, iF, "$ZodCustom", 0, r4, "$ZodCustomStringFormat", 0, iX, "$ZodCyclicError", 0, r1, "$ZodDate", 0, i7, "$ZodDefault", 0, rj, "$ZodDiscriminatedUnion", 0, rf, "$ZodE164", 0, iJ, "$ZodEmail", 0, io, "$ZodEmoji", 0, ig, "$ZodEncodeError", 0, s, "$ZodEnum", 0, rz, "$ZodError", 0, t9, "$ZodExactOptional", 0, rA, "$ZodFile", 0, rN, "$ZodFunction", 0, rY, "$ZodGUID", 0, ir, "$ZodIBAN", 0, iK, "$ZodIPv4", 0, iU, "$ZodIPv6", 0, iO, "$ZodISODate", 0, iS, "$ZodISODateTime", 0, iw, "$ZodISODuration", 0, iz, "$ZodISOTime", 0, ix, "$ZodIntersection", 0, rv, "$ZodJWT", 0, iG, "$ZodKSUID", 0, iI, "$ZodLazy", 0, r0, "$ZodLiteral", 0, rU, "$ZodMAC", 0, iZ, "$ZodMap", 0, rI, "$ZodNaN", 0, rM, "$ZodNanoID", 0, ih, "$ZodNever", 0, i3, "$ZodNonOptional", 0, rT, "$ZodNull", 0, i1, "$ZodNullable", 0, rP, "$ZodNumber", 0, iq, "$ZodNumberFormat", 0, iH, "$ZodObject", 0, ra, "$ZodObjectJIT", 0, ro, "$ZodOptional", 0, rZ, "$ZodPipe", 0, rV, "$ZodPrefault", 0, rE, "$ZodPreprocess", 0, rG, "$ZodPromise", 0, rQ, "$ZodReadonly", 0, rX, "$ZodRealError", 0, t3, "$ZodRecord", 0, rk, "$ZodRegistry", 0, ac, "$ZodSet", 0, rS, "$ZodString", 0, it, "$ZodStringFormat", 0, ii, "$ZodSuccess", 0, rC, "$ZodSymbol", 0, i4, "$ZodTemplateLiteral", 0, rH, "$ZodTransform", 0, rD, "$ZodTuple", 0, rh, "$ZodType", 0, n5, "$ZodULID", 0, ib, "$ZodURL", 0, ip, "$ZodUUID", 0, ia, "$ZodUndefined", 0, i6, "$ZodUnion", 0, ru, "$ZodUnknown", 0, i9, "$ZodVoid", 0, i5, "$ZodXID", 0, ik, "$ZodXor", 0, rs, "$brand", 0, u, "$constructor", 0, c, "$input", 0, ao, "$output", 0, aa, "Doc", 0, n9, "INVALID", 0, as, "JSONSchema", 0, t0, "JSONSchemaGenerator", 0, class {
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
        set counter(t) {
            this.ctx.counter = t
        }
        get seen() {
            return this.ctx.seen
        }
        process(t) {
            let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {
                path: [],
                schemaPath: []
            };
            return cP(t, this.ctx, n)
        }
        emit(t, n) {
            n && (n.cycles && (this.ctx.cycles = n.cycles), n.reused && (this.ctx.reused = n.reused), n.external && (this.ctx.external = n.external)), this.ctx.sharedDefsExtractedFor = void 0, this.ctx.sharedEmitDoneFor = void 0, c$(this.ctx, t);
            let {
                "~standard": i,
                ...r
            } = cR(this.ctx, t);
            return r
        }
        constructor(t) {
            var n;
            let i = null != (n = null == t ? void 0 : t.target) ? n : "draft-2020-12";
            "draft-4" === i && (i = "draft-04"), "draft-7" === i && (i = "draft-07"), this.ctx = cZ({
                processors: uT,
                target: i,
                ...(null == t ? void 0 : t.metadata) && {
                    metadata: t.metadata
                },
                ...(null == t ? void 0 : t.unrepresentable) && {
                    unrepresentable: t.unrepresentable
                },
                ...(null == t ? void 0 : t.override) && {
                    override: t.override
                },
                ...(null == t ? void 0 : t.io) && {
                    io: t.io
                }
            })
        }
    }, "NEVER", 0, r, "TimePrecision", 0, oi, "URL_BAD_FORMAT", 0, 1, "URL_UNPARSEABLE", 0, 2, "ZodCompileAsyncError", 0, am, "ZodCompileUnsupportedError", 0, af, "_any", 0, oS, "_array", 0, o5, "_base64", 0, a5, "_base64url", 0, a7, "_bigint", 0, oh, "_boolean", 0, op, "_catch", 0, cg, "_check", 0, cx, "_cidrv4", 0, a9, "_cidrv6", 0, a3, "_coercedBigint", 0, oy, "_coercedBoolean", 0, og, "_coercedDate", 0, oD, "_coercedNumber", 0, ol, "_coercedString", 0, aJ, "_creditCard", 0, oe, "_cuid", 0, aH, "_cuid2", 0, aY, "_custom", 0, cI, "_date", 0, oN, "_decode", 0, ny, "_decodeAsync", 0, nI, "_default", 0, cf, "_discriminatedUnion", 0, ce, "_e164", 0, a8, "_email", 0, aM, "_emoji", 0, aX, "_encode", 0, ng, "_encodeAsync", 0, nb, "_endsWith", 0, oH, "_enum", 0, co, "_file", 0, cl, "_float32", 0, od, "_float64", 0, om, "_gt", 0, oP, "_gte", 0, oj, "_guid", 0, aV, "_iban", 0, ot, "_includes", 0, oX, "_int", 0, os, "_int32", 0, of, "_int64", 0, o_, "_intersection", 0, ct, "_ipv4", 0, a6, "_ipv6", 0, a1, "_isoDate", 0, oa, "_isoDateTime", 0, or, "_isoDuration", 0, oc, "_isoTime", 0, oo, "_jwt", 0, on, "_ksuid", 0, a4, "_lazy", 0, cb, "_length", 0, oB, "_literal", 0, cu, "_lowercase", 0, oW, "_lt", 0, oZ, "_lte", 0, oA, "_mac", 0, a2, "_map", 0, cr, "_max", 0, oA, "_maxLength", 0, oV, "_maxSize", 0, oR, "_mime", 0, o0, "_min", 0, oj, "_minLength", 0, oF, "_minSize", 0, oJ, "_multipleOf", 0, oC, "_nan", 0, oO, "_nanoid", 0, aq, "_nativeEnum", 0, cc, "_negative", 0, oE, "_never", 0, oz, "_nonnegative", 0, oL, "_nonoptional", 0, cv, "_nonpositive", 0, oT, "_normalize", 0, o6, "_null", 0, ow, "_nullable", 0, cm, "_number", 0, ou, "_optional", 0, cd, "_overwrite", 0, o4, "_parse", 0, ni, "_parseAsync", 0, na, "_pipe", 0, ch, "_positive", 0, o$, "_promise", 0, ck, "_properties", 0, oQ, "_property", 0, oY, "_readonly", 0, cy, "_record", 0, ci, "_refine", 0, cw, "_regex", 0, oK, "_safeDecode", 0, nz, "_safeDecodeAsync", 0, nO, "_safeEncode", 0, nS, "_safeEncodeAsync", 0, nN, "_safeParse", 0, nc, "_safeParseAsync", 0, ns, "_set", 0, ca, "_size", 0, oM, "_slugify", 0, o3, "_startsWith", 0, oq, "_string", 0, aR, "_stringFormat", 0, cD, "_stringbool", 0, cN, "_success", 0, cp, "_superRefine", 0, cS, "_symbol", 0, ok, "_templateLiteral", 0, c_, "_toLowerCase", 0, o2, "_toUpperCase", 0, o9, "_transform", 0, cs, "_trim", 0, o1, "_tuple", 0, cn, "_uint32", 0, ov, "_uint64", 0, ob, "_ulid", 0, aQ, "_undefined", 0, oI, "_union", 0, o7, "_unknown", 0, ox, "_uppercase", 0, oG, "_url", 0, aG, "_uuid", 0, aF, "_uuidv4", 0, aB, "_uuidv6", 0, aK, "_uuidv7", 0, aW, "_void", 0, oU, "_xid", 0, a0, "_xor", 0, o8, "base64Charset", 0, iE, "base64urlCharset", 0, iL, "canParseURL", 0, ic, "clone", 0, Q, "compile", 0, av, "compileFn", 0, ag, "config", 0, m, "createStandardJSONSchemaMethod", 0, cM, "createToJSONSchemaMethod", 0, cJ, "decode", 0, n_, "decodeAsync", 0, nw, "describe", 0, cz, "encode", 0, nh, "encodeAsync", 0, nk, "extractDefs", 0, c$, "finalize", 0, cR, "flattenError", 0, t5, "formatError", 0, t7, "getDiscriminatedOption", 0, rd, "globalConfig", 0, d, "globalRegistry", 0, al, "handleUnrepresentable", 0, cA, "initializeContext", 0, cZ, "isBackEdge", 0, ar, "isRecursiveSchema", 0, ae, "isValidBase64", 0, i$, "isValidBase64URL", 0, iC, "isValidCIDRv6", 0, iP, "isValidCreditCard", 0, iV, "isValidIBAN", 0, iB, "isValidIPv6", 0, iD, "isValidJWT", 0, iW, "locales", 0, tQ, "memoizer", 0, ai, "mergeValues", 0, rp, "meta", 0, cU, "parse", 0, nr, "parseAsync", 0, no, "parseURLObject", 0, il, "prettifyError", 0, nt, "process", 0, cP, "processSchema", 0, cP, "regexes", 0, tV, "registry", 0, au, "safeDecode", 0, nU, "safeDecodeAsync", 0, nZ, "safeEncode", 0, nx, "safeEncodeAsync", 0, nD, "safeParse", 0, nu, "safeParseAsync", 0, nd, "standardProps", 0, ie, "stripTabAndNewline", 0, id, "toDotPath", 0, ne, "toJSONSchema", 0, uL, "toZod", 0, p, "treeifyError", 0, t8, "urlHostnameOk", 0, im, "urlProtocolOk", 0, iv, "util", 0, eG, "validate", 0, nv, "validateAsync", 0, np, "validateURL", 0, iu, "version", 0, n3, "withParser", 0, ap], 676506);
    var uC = t.i(676506),
        uR = tV;
    t.s(["regexes", 0, uR], 490742);
    var uR = tV,
        uJ = eG;
    t.s(["util", 0, uJ], 925633);
    var uJ = eG;
    t.s(["minLength", 0, oF], 566387);
    let uM = new WeakSet([Object.prototype, Error.prototype]);

    function uV(t, n, i) {
        Object.defineProperty(t, n, {
            configurable: !0,
            enumerable: !1,
            get() {
                let t = i(this);
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
    let uF = (t, n) => {
            t9.init(t, n), t.name = "ZodError";
            let i = Object.getPrototypeOf(t);
            uM.has(i) || (uM.add(i), uV(i, "format", t => n => t7(t, n)), uV(i, "flatten", t => n => t5(t, n)), uV(i, "addIssue", t => n => {
                t.issues.push(n), t.message = JSON.stringify(t.issues, k, 2)
            }), uV(i, "addIssues", t => n => {
                t.issues.push(...n), t.message = JSON.stringify(t.issues, k, 2)
            }), Object.defineProperty(i, "isEmpty", {
                configurable: !0,
                enumerable: !1,
                get() {
                    return 0 === this.issues.length
                }
            }))
        },
        uB = c("ZodError", uF),
        uK = c("ZodError", uF, void 0, {
            Parent: Error
        });
    t.s(["ZodError", 0, uB, "ZodRealError", 0, uK], 355475);
    let uW = ni(uK),
        uG = na(uK),
        uX = nc(uK),
        uq = ns(uK),
        uH = ng(uK),
        uY = ny(uK),
        uQ = nb(uK),
        u0 = nI(uK),
        u4 = nS(uK),
        u6 = nz(uK),
        u1 = nN(uK),
        u2 = nO(uK);

    function u9() {
        d.memoizer || m({
            memoizer: ai()
        })
    }
    t.s(["decode", 0, uY, "decodeAsync", 0, u0, "encode", 0, uH, "encodeAsync", 0, uQ, "parse", 0, uW, "parseAsync", 0, uG, "safeDecode", 0, u6, "safeDecodeAsync", 0, u2, "safeEncode", 0, u4, "safeEncodeAsync", 0, u1, "safeParse", 0, uX, "safeParseAsync", 0, uq], 176860);
    let u3 = c("ZodType", (t, n) => (d.localeError || m(tB()), n5.init(t, n), t.def = n, t.type = n.type, t), {
            check() {
                for (var t, n = arguments.length, i = Array(n), r = 0; r < n; r++) i[r] = arguments[r];
                let a = this.def;
                return this.clone(uJ.mergeDefs(a, {
                    checks: [...null != (t = a.checks) ? t : [], ...i.map(t => "function" == typeof t ? {
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
                for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
                return this.check(...n)
            },
            clone(t, n) {
                return Q(this, t, n)
            },
            brand() {
                return this
            },
            register(t, n) {
                return t.add(this, n), this
            },
            refine(t, n) {
                return this.check(dE(t, n))
            },
            superRefine(t, n) {
                return this.check(dT(t, n))
            },
            overwrite(t) {
                return this.check(o4(t))
            },
            optional() {
                return s7(this)
            },
            exactOptional() {
                return de(this)
            },
            nullable() {
                return dn(this)
            },
            nullish() {
                return s7(dn(this))
            },
            nonoptional(t) {
                return ds(this, t)
            },
            array() {
                return sN(this)
            },
            or(t) {
                return s$([this, t])
            },
            and(t) {
                return sJ(this, t)
            },
            transform(t) {
                return dy(this, s3(t))
            },
            default (t) {
                return da(this, t)
            },
            prefault(t) {
                return du(this, t)
            },
            catch (t) {
                return dv(this, t)
            },
            pipe(t) {
                return dy(this, t)
            },
            readonly() {
                return dS(this)
            },
            describe(t) {
                let n = this.clone();
                return al.add(n, {
                    description: t
                }), n
            },
            meta() {
                for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
                if (0 === n.length) return al.get(this);
                let r = this.clone();
                return al.add(r, n[0]), r
            },
            isOptional() {
                return this.safeParse(void 0).success
            },
            isNullable() {
                return this.safeParse(null).success
            },
            apply(t) {
                for (var n = arguments.length, i = Array(n > 1 ? n - 1 : 0), r = 1; r < n; r++) i[r - 1] = arguments[r];
                return 0 === i.length ? t(this) : t(this, ...i)
            },
            get "~standard"() {
                return uJ.hide(this, "~standard", {
                    ...ie(this),
                    jsonSchema: {
                        input: cM(this, "input"),
                        output: cM(this, "output")
                    }
                })
            },
            set "~standard"(value) {
                uJ.own(this, "~standard", value)
            },
            parse: function t(n, i) {
                return uW(this, n, i, {
                    callee: t
                })
            },
            parseAsync: async function t(n, i) {
                return await uG(this, n, i, {
                    callee: t
                })
            },
            safeParse(t, n) {
                return uX(this, t, n)
            },
            async safeParseAsync(t, n) {
                return uq(this, t, n)
            },
            get spa() {
                return null === this || void 0 === this ? void 0 : this.safeParseAsync
            },
            set spa(value) {
                uJ.own(this, "spa", value)
            },
            validate(t, n) {
                return nv(this, t, n)
            },
            validateAsync(t, n) {
                return np(this, t, n)
            },
            encode: function t(n, i) {
                return uH(this, n, i, {
                    callee: t
                })
            },
            decode: function t(n, i) {
                return uY(this, n, i, {
                    callee: t
                })
            },
            encodeAsync: async function t(n, i) {
                return await uQ(this, n, i, {
                    callee: t
                })
            },
            decodeAsync: async function t(n, i) {
                return await u0(this, n, i, {
                    callee: t
                })
            },
            safeEncode(t, n) {
                return u4(this, t, n)
            },
            safeDecode(t, n) {
                return u6(this, t, n)
            },
            async safeEncodeAsync(t, n) {
                return u1(this, t, n)
            },
            async safeDecodeAsync(t, n) {
                return u2(this, t, n)
            },
            toJSONSchema(t) {
                return cJ(this, {})(t)
            },
            get description() {
                var u5;
                return null == (u5 = al.get(this)) ? void 0 : u5.description
            },
            get _def() {
                return this._zod.def
            }
        }),
        u7 = c("_ZodString", (t, n) => {
            it.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => c2(t, n, i, r)
        }, uJ.derived({
            format: t => {
                var n;
                return null != (n = c0(t).format) ? n : null
            },
            minLength: t => {
                var n;
                return null != (n = c0(t).minimum) ? n : null
            },
            maxLength: t => {
                var n;
                return null != (n = c0(t).maximum) ? n : null
            }
        }, {
            regex() {
                for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
                return this.check(oK(...n))
            },
            includes() {
                for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
                return this.check(oX(...n))
            },
            startsWith() {
                for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
                return this.check(oq(...n))
            },
            endsWith() {
                for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
                return this.check(oH(...n))
            },
            min() {
                for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
                return this.check(oF(...n))
            },
            max() {
                for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
                return this.check(oV(...n))
            },
            length() {
                for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
                return this.check(oB(...n))
            },
            nonempty() {
                for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
                return this.check(oF(1, ...n))
            },
            lowercase(t) {
                return this.check(oW(t))
            },
            uppercase(t) {
                return this.check(oG(t))
            },
            trim() {
                return this.check(o1())
            },
            normalize() {
                for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
                return this.check(o6(...n))
            },
            toLowerCase() {
                return this.check(o2())
            },
            toUpperCase() {
                return this.check(o9())
            },
            slugify() {
                return this.check(o3())
            }
        })),
        u8 = c("ZodString", (t, n) => {
            it.init(t, n), u7.init(t, n)
        }, {
            email(t) {
                return this.check(aM(lo, t))
            },
            url(t) {
                return this.check(aG(lp, t))
            },
            jwt(t) {
                return this.check(on(lY, t))
            },
            emoji(t) {
                return this.check(aX(ly, t))
            },
            guid(t) {
                return this.check(aV(lu, t))
            },
            uuid(t) {
                return this.check(aF(ls, t))
            },
            uuidv4(t) {
                return this.check(aB(ls, t))
            },
            uuidv6(t) {
                return this.check(aK(ls, t))
            },
            uuidv7(t) {
                return this.check(aW(ls, t))
            },
            nanoid(t) {
                return this.check(aq(lb, t))
            },
            cuid(t) {
                return this.check(aH(lI, t))
            },
            cuid2(t) {
                return this.check(aY(lS, t))
            },
            ulid(t) {
                return this.check(aQ(lz, t))
            },
            base64(t) {
                return this.check(a5(lM, t))
            },
            base64url(t) {
                return this.check(a7(lF, t))
            },
            xid(t) {
                return this.check(a0(lN, t))
            },
            ksuid(t) {
                return this.check(a4(lO, t))
            },
            ipv4(t) {
                return this.check(a6(lA, t))
            },
            ipv6(t) {
                return this.check(a1(lE, t))
            },
            cidrv4(t) {
                return this.check(a9(lL, t))
            },
            cidrv6(t) {
                return this.check(a3(lR, t))
            },
            e164(t) {
                return this.check(a8(lK, t))
            },
            datetime(t) {
                return this.check(or(ln, t))
            },
            date(t) {
                return this.check(oa(li, t))
            },
            time(t) {
                return this.check(oo(lr, t))
            },
            duration(t) {
                return this.check(oc(la, t))
            }
        });

    function le(t) {
        return aR(u8, t)
    }
    let lt = c("ZodStringFormat", (t, n) => {
            ii.init(t, n), u7.init(t, n)
        }),
        ln = c("ZodISODateTime", (t, n) => {
            iw.init(t, n), lt.init(t, n)
        }),
        li = c("ZodISODate", (t, n) => {
            iS.init(t, n), lt.init(t, n)
        }),
        lr = c("ZodISOTime", (t, n) => {
            ix.init(t, n), lt.init(t, n)
        }),
        la = c("ZodISODuration", (t, n) => {
            iz.init(t, n), lt.init(t, n)
        }),
        lo = c("ZodEmail", (t, n) => {
            io.init(t, n), lt.init(t, n)
        });

    function lc(t) {
        return aM(lo, t)
    }
    let lu = c("ZodGUID", (t, n) => {
        ir.init(t, n), lt.init(t, n)
    });

    function ll(t) {
        return aV(lu, t)
    }
    let ls = c("ZodUUID", (t, n) => {
        ia.init(t, n), lt.init(t, n)
    });

    function ld(t) {
        return aF(ls, t)
    }

    function lm(t) {
        return aB(ls, t)
    }

    function lf(t) {
        return aK(ls, t)
    }

    function lv(t) {
        return aW(ls, t)
    }
    let lp = c("ZodURL", (t, n) => {
        ip.init(t, n), lt.init(t, n)
    });

    function lg(t) {
        return aG(lp, t)
    }

    function lh(t) {
        return aG(lp, {
            protocol: ts,
            hostname: tl,
            ...uJ.normalizeParams(t)
        })
    }
    let ly = c("ZodEmoji", (t, n) => {
        ig.init(t, n), lt.init(t, n)
    });

    function l_(t) {
        return aX(ly, t)
    }
    let lb = c("ZodNanoID", (t, n) => {
        ih.init(t, n), lt.init(t, n)
    });

    function lk(t) {
        return aq(lb, t)
    }
    let lI = c("ZodCUID", (t, n) => {
        iy.init(t, n), lt.init(t, n)
    });

    function lw(t) {
        return aH(lI, t)
    }
    let lS = c("ZodCUID2", (t, n) => {
        i_.init(t, n), lt.init(t, n)
    });

    function lx(t) {
        return aY(lS, t)
    }
    let lz = c("ZodULID", (t, n) => {
        ib.init(t, n), lt.init(t, n)
    });

    function lU(t) {
        return aQ(lz, t)
    }
    let lN = c("ZodXID", (t, n) => {
        ik.init(t, n), lt.init(t, n)
    });

    function lD(t) {
        return a0(lN, t)
    }
    let lO = c("ZodKSUID", (t, n) => {
        iI.init(t, n), lt.init(t, n)
    });

    function lZ(t) {
        return a4(lO, t)
    }
    let lA = c("ZodIPv4", (t, n) => {
        iU.init(t, n), lt.init(t, n)
    });

    function lP(t) {
        return a6(lA, t)
    }
    let lj = c("ZodMAC", (t, n) => {
        iZ.init(t, n), lt.init(t, n)
    });

    function l$(t) {
        return a2(lj, t)
    }
    let lE = c("ZodIPv6", (t, n) => {
        iO.init(t, n), lt.init(t, n)
    });

    function lT(t) {
        return a1(lE, t)
    }
    let lL = c("ZodCIDRv4", (t, n) => {
        iA.init(t, n), lt.init(t, n)
    });

    function lC(t) {
        return a9(lL, t)
    }
    let lR = c("ZodCIDRv6", (t, n) => {
        ij.init(t, n), lt.init(t, n)
    });

    function lJ(t) {
        return a3(lR, t)
    }
    let lM = c("ZodBase64", (t, n) => {
        iT.init(t, n), lt.init(t, n)
    });

    function lV(t) {
        return a5(lM, t)
    }
    let lF = c("ZodBase64URL", (t, n) => {
        iR.init(t, n), lt.init(t, n)
    });

    function lB(t) {
        return a7(lF, t)
    }
    let lK = c("ZodE164", (t, n) => {
        iJ.init(t, n), lt.init(t, n)
    });

    function lW(t) {
        return a8(lK, t)
    }
    let lG = c("ZodCreditCard", (t, n) => {
        iF.init(t, n), lt.init(t, n)
    });

    function lX(t) {
        return oe(lG, t)
    }
    let lq = c("ZodIBAN", (t, n) => {
        iK.init(t, n), lt.init(t, n)
    });

    function lH(t) {
        return ot(lq, t)
    }
    let lY = c("ZodJWT", (t, n) => {
        iG.init(t, n), lt.init(t, n)
    });

    function lQ(t) {
        return on(lY, t)
    }
    let l0 = c("ZodCustomStringFormat", (t, n) => {
        iX.init(t, n), lt.init(t, n)
    });

    function l4(t, n) {
        let i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return cD(l0, t, n, i)
    }

    function l6(t) {
        return cD(l0, "hostname", tu, t)
    }

    function l1(t) {
        return cD(l0, "hex", tO, t)
    }

    function l2(t) {
        return cD(l0, "currency_code", tf, t)
    }

    function l9(t, n) {
        var i;
        let r = null != (i = null == n ? void 0 : n.enc) ? i : "hex",
            a = "".concat(t, "_").concat(r),
            o = uR[a];
        if (!o) throw Error("Unrecognized hash format: ".concat(a));
        return cD(l0, a, o, n)
    }
    let l3 = c("ZodNumber", (t, n) => {
        iq.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => c9(t, n, i, r), t.isFinite = !0
    }, uJ.derived({
        minValue: t => {
            let {
                minimum: n,
                exclusiveMinimum: i
            } = c0(t);
            return Math.max(null != n ? n : -1 / 0, null != i ? i : -1 / 0)
        },
        maxValue: t => {
            let {
                maximum: n,
                exclusiveMaximum: i
            } = c0(t);
            return Math.min(null != n ? n : 1 / 0, null != i ? i : 1 / 0)
        },
        isInt: t => {
            let {
                isInt: n,
                multipleOf: i
            } = c0(t);
            return !!n || !!(null == i ? void 0 : i.some(Number.isSafeInteger))
        },
        format: t => {
            var n;
            return null != (n = c0(t).format) ? n : null
        }
    }, {
        gt(t, n) {
            return this.check(oP(t, n))
        },
        gte(t, n) {
            return this.check(oj(t, n))
        },
        min(t, n) {
            return this.check(oj(t, n))
        },
        lt(t, n) {
            return this.check(oZ(t, n))
        },
        lte(t, n) {
            return this.check(oA(t, n))
        },
        max(t, n) {
            return this.check(oA(t, n))
        },
        int(t) {
            return this.check(l8(t))
        },
        safe(t) {
            return this.check(l8(t))
        },
        positive(t) {
            return this.check(oP(0, t))
        },
        nonnegative(t) {
            return this.check(oj(0, t))
        },
        negative(t) {
            return this.check(oZ(0, t))
        },
        nonpositive(t) {
            return this.check(oA(0, t))
        },
        multipleOf(t, n) {
            return this.check(oC(t, n))
        },
        step(t, n) {
            return this.check(oC(t, n))
        },
        finite() {
            return this
        }
    }));

    function l5(t) {
        return ou(l3, t)
    }
    let l7 = c("ZodNumberFormat", (t, n) => {
        iH.init(t, n), l3.init(t, n)
    });

    function l8(t) {
        return os(l7, t)
    }

    function se(t) {
        return od(l7, t)
    }

    function st(t) {
        return om(l7, t)
    }

    function sn(t) {
        return of(l7, t)
    }

    function si(t) {
        return ov(l7, t)
    }
    let sr = c("ZodBoolean", (t, n) => {
        iY.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => c3(t, n, i, r)
    });

    function sa(t) {
        return op(sr, t)
    }
    let so = c("ZodBigInt", (t, n) => {
        iQ.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => c5(t, n, i, r)
    }, uJ.derived({
        minValue: t => {
            var n;
            return null != (n = c0(t).minimum) ? n : null
        },
        maxValue: t => {
            var n;
            return null != (n = c0(t).maximum) ? n : null
        },
        format: t => {
            var n;
            return null != (n = c0(t).format) ? n : null
        }
    }, {
        gte(t, n) {
            return this.check(oj(t, n))
        },
        min(t, n) {
            return this.check(oj(t, n))
        },
        gt(t, n) {
            return this.check(oP(t, n))
        },
        lt(t, n) {
            return this.check(oZ(t, n))
        },
        lte(t, n) {
            return this.check(oA(t, n))
        },
        max(t, n) {
            return this.check(oA(t, n))
        },
        positive(t) {
            return this.check(oP(BigInt(0), t))
        },
        negative(t) {
            return this.check(oZ(BigInt(0), t))
        },
        nonpositive(t) {
            return this.check(oA(BigInt(0), t))
        },
        nonnegative(t) {
            return this.check(oj(BigInt(0), t))
        },
        multipleOf(t, n) {
            return this.check(oC(t, n))
        }
    }));

    function sc(t) {
        return oh(so, t)
    }
    let su = c("ZodBigIntFormat", (t, n) => {
        i0.init(t, n), so.init(t, n)
    });

    function sl(t) {
        return o_(su, t)
    }

    function ss(t) {
        return ob(su, t)
    }
    let sd = c("ZodSymbol", (t, n) => {
        i4.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => c7(t, n, i, r)
    });

    function sm(t) {
        return ok(sd, t)
    }
    let sf = c("ZodUndefined", (t, n) => {
        i6.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => ue(t, n, i, r)
    });

    function sv(t) {
        return oI(sf, t)
    }
    let sp = c("ZodNull", (t, n) => {
        i1.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => c8(t, n, i, r)
    });

    function sg(t) {
        return ow(sp, t)
    }
    let sh = c("ZodAny", (t, n) => {
        i2.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => ui(t, n, i, r)
    });

    function sy() {
        return oS(sh)
    }
    let s_ = c("ZodUnknown", (t, n) => {
        i9.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => ur(t, n, i, r)
    });

    function sb() {
        return ox(s_)
    }
    let sk = c("ZodNever", (t, n) => {
        i3.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => un(t, n, i, r)
    });

    function sI(t) {
        return oz(sk, t)
    }
    let sw = c("ZodVoid", (t, n) => {
        i5.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => ut(t, n, i, r)
    });

    function sS(t) {
        return oU(sw, t)
    }
    let sx = c("ZodDate", (t, n) => {
        i7.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => ua(t, n, i, r), t.min = (n, i) => t.check(oj(n, i)), t.max = (n, i) => t.check(oA(n, i))
    }, uJ.derived({
        minDate: t => {
            let {
                minimum: n
            } = c0(t);
            return n ? new Date(n) : null
        },
        maxDate: t => {
            let {
                maximum: n
            } = c0(t);
            return n ? new Date(n) : null
        }
    }, {}));

    function sz(t) {
        return oN(sx, t)
    }
    let sU = c("ZodArray", (t, n) => {
        u9(), re.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => uh(t, n, i, r), t.element = n.element
    }, {
        min(t, n) {
            return this.check(oF(t, n))
        },
        nonempty(t) {
            return this.check(oF(1, t))
        },
        max(t, n) {
            return this.check(oV(t, n))
        },
        length(t, n) {
            return this.check(oB(t, n))
        },
        unwrap() {
            return this.element
        }
    });

    function sN(t, n) {
        return o5(sU, t, n)
    }

    function sD(t) {
        return sQ(Object.keys(t._zod.def.shape))
    }
    let sO = c("ZodObject", (t, n) => {
        u9(), ro.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => u_(t, n, i, r), uJ.installLazyProp(t, "shape", t => t._zod.def.shape, !1)
    }, {
        keyof() {
            return sQ(Object.keys(this._zod.def.shape))
        },
        catchall(t) {
            return this.clone(uJ.mergeDefs(this._zod.def, {
                catchall: t
            }))
        },
        passthrough() {
            return this.clone(uJ.mergeDefs(this._zod.def, {
                catchall: sb()
            }))
        },
        loose() {
            return this.clone(uJ.mergeDefs(this._zod.def, {
                catchall: sb()
            }))
        },
        strict() {
            return this.clone(uJ.mergeDefs(this._zod.def, {
                catchall: sI()
            }))
        },
        strip() {
            return this.clone(uJ.mergeDefs(this._zod.def, {
                catchall: void 0
            }))
        },
        extend(t) {
            return uJ.extend(this, t)
        },
        safeExtend(t) {
            return uJ.safeExtend(this, t)
        },
        merge(t) {
            return uJ.merge(this, t)
        },
        pick(t) {
            return uJ.pick(this, t)
        },
        omit(t) {
            return uJ.omit(this, t)
        },
        partial() {
            for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
            return uJ.partial(s5, this, n[0])
        },
        exactPartial() {
            for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
            return uJ.partial(s8, this, n[0], "exactPartial")
        },
        required() {
            for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
            return uJ.required(dl, this, n[0])
        }
    });

    function sZ(t, n) {
        return new sO({
            type: "object",
            shape: null != t ? t : {},
            ...uJ.normalizeParams(n)
        })
    }

    function sA(t, n) {
        return new sO({
            type: "object",
            shape: t,
            catchall: sI(),
            ...uJ.normalizeParams(n)
        })
    }

    function sP(t, n) {
        return new sO({
            type: "object",
            shape: t,
            catchall: sb(),
            ...uJ.normalizeParams(n)
        })
    }
    let sj = c("ZodUnion", (t, n) => {
        ru.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => ub(t, n, i, r), t.options = n.options
    });

    function s$(t, n) {
        return new sj({
            type: "union",
            options: t,
            ...uJ.normalizeParams(n)
        })
    }
    let sE = c("ZodXor", (t, n) => {
        sj.init(t, n), rs.init(t, n), t._zod.processJSONSchema = (n, i, r) => ub(t, n, i, r), t.options = n.options
    });

    function sT(t, n) {
        return new sE({
            type: "union",
            options: t,
            inclusive: !1,
            ...uJ.normalizeParams(n)
        })
    }
    let sL = c("ZodDiscriminatedUnion", (t, n) => {
        sj.init(t, n), rf.init(t, n)
    });

    function sC(t, n, i) {
        return new sL({
            type: "union",
            options: n,
            discriminator: t,
            ...uJ.normalizeParams(i)
        })
    }
    let sR = c("ZodIntersection", (t, n) => {
        rv.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => uk(t, n, i, r)
    });

    function sJ(t, n) {
        return new sR({
            type: "intersection",
            left: t,
            right: n
        })
    }
    let sM = c("ZodTuple", (t, n) => {
        u9(), rh.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => uI(t, n, i, r)
    }, {
        rest(t) {
            return this.clone({
                ...this._zod.def,
                rest: t
            })
        },
        partial() {
            var t;
            let n = this._zod.def;
            if (null == (t = n.checks) ? void 0 : t.length) throw Error(".partial() cannot be used on tuple schemas containing refinements");
            return this.clone({
                ...n,
                items: n.items.map(t => new s5({
                    type: "optional",
                    innerType: t
                }))
            })
        }
    });

    function sV(t, n, i) {
        let r = n instanceof n5,
            a = r ? i : n;
        return new sM({
            type: "tuple",
            items: t,
            rest: r ? n : null,
            ...uJ.normalizeParams(a)
        })
    }
    let sF = c("ZodRecord", (t, n) => {
        u9(), rk.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => uS(t, n, i, r), t.keyType = n.keyType, t.valueType = n.valueType
    });

    function sB(t, n, i) {
        return new sF(n && n._zod ? {
            type: "record",
            keyType: t,
            valueType: n,
            ...uJ.normalizeParams(i)
        } : {
            type: "record",
            keyType: le(),
            valueType: t,
            ...uJ.normalizeParams(n)
        })
    }

    function sK(t, n, i) {
        return new sF({
            type: "record",
            keyType: t,
            valueType: n,
            ...uJ.normalizeParams(i),
            partial: !0
        })
    }

    function sW(t, n, i) {
        return new sF({
            type: "record",
            keyType: t,
            valueType: n,
            mode: "loose",
            ...uJ.normalizeParams(i)
        })
    }
    let sG = c("ZodMap", (t, n) => {
        u9(), rI.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => up(t, n, i, r), t.keyType = n.keyType, t.valueType = n.valueType, t.min = function() {
            for (var n = arguments.length, i = Array(n), r = 0; r < n; r++) i[r] = arguments[r];
            return t.check(oJ(...i))
        }, t.nonempty = n => t.check(oJ(1, n)), t.max = function() {
            for (var n = arguments.length, i = Array(n), r = 0; r < n; r++) i[r] = arguments[r];
            return t.check(oR(...i))
        }, t.size = function() {
            for (var n = arguments.length, i = Array(n), r = 0; r < n; r++) i[r] = arguments[r];
            return t.check(oM(...i))
        }
    });

    function sX(t, n, i) {
        return new sG({
            type: "map",
            keyType: t,
            valueType: n,
            ...uJ.normalizeParams(i)
        })
    }
    let sq = c("ZodSet", (t, n) => {
        u9(), rS.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => ug(t, n, i, r), t.min = function() {
            for (var n = arguments.length, i = Array(n), r = 0; r < n; r++) i[r] = arguments[r];
            return t.check(oJ(...i))
        }, t.nonempty = n => t.check(oJ(1, n)), t.max = function() {
            for (var n = arguments.length, i = Array(n), r = 0; r < n; r++) i[r] = arguments[r];
            return t.check(oR(...i))
        }, t.size = function() {
            for (var n = arguments.length, i = Array(n), r = 0; r < n; r++) i[r] = arguments[r];
            return t.check(oM(...i))
        }
    });

    function sH(t, n) {
        return new sq({
            type: "set",
            valueType: t,
            ...uJ.normalizeParams(n)
        })
    }
    let sY = c("ZodEnum", (t, n) => {
        rz.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => uo(t, n, i, r), t.enum = n.entries, t.options = [...t._zod.values];
        let i = new Set(Object.keys(n.entries));
        t.extract = (t, r) => {
            let a = {};
            for (let r of t)
                if (i.has(r)) a[r] = n.entries[r];
                else throw Error("Key ".concat(r, " not found in enum"));
            return new sY({
                ...n,
                checks: [],
                ...uJ.normalizeParams(r),
                entries: a
            })
        }, t.exclude = (t, r) => {
            let a = {
                ...n.entries
            };
            for (let n of t)
                if (i.has(n)) delete a[n];
                else throw Error("Key ".concat(n, " not found in enum"));
            return new sY({
                ...n,
                checks: [],
                ...uJ.normalizeParams(r),
                entries: a
            })
        }
    });

    function sQ(t, n) {
        return new sY({
            type: "enum",
            entries: Array.isArray(t) ? Object.fromEntries(t.map(t => [t, t])) : t,
            ...uJ.normalizeParams(n)
        })
    }

    function s0(t, n) {
        return new sY({
            type: "enum",
            entries: t,
            ...uJ.normalizeParams(n)
        })
    }
    let s4 = c("ZodLiteral", (t, n) => {
        rU.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => uc(t, n, i, r), t.values = new Set(n.values), Object.defineProperty(t, "value", {
            get() {
                if (n.values.length > 1) throw Error("This schema contains multiple valid literal values. Use `.values` instead.");
                return n.values[0]
            }
        })
    });

    function s6(t, n) {
        return new s4({
            type: "literal",
            values: Array.isArray(t) ? t : [t],
            ...uJ.normalizeParams(n)
        })
    }
    let s1 = c("ZodFile", (t, n) => {
        rN.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => us(t, n, i, r), t.min = (n, i) => t.check(oJ(n, i)), t.max = (n, i) => t.check(oR(n, i)), t.mime = (n, i) => t.check(o0(Array.isArray(n) ? n : [n], i))
    });

    function s2(t) {
        return cl(s1, t)
    }
    let s9 = c("ZodTransform", (t, n) => {
        u9(), rD.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => uv(t, n, i, r), t._zod.parse = (i, r) => {
            if ("backward" === r.direction) throw new s(t.constructor.name);
            i.addIssue = r => {
                if ("string" == typeof r) i.issues.push(uJ.issue(r, i.value, n));
                else r.fatal && (r.continue = !1), null != r.code || (r.code = "custom"), "input" in r || (r.input = i.value), null != r.inst || (r.inst = t), i.issues.push(uJ.issue(r))
            };
            let a = n.transform(i.value, i);
            return a instanceof Promise ? a.then(t => (i.value = t, i)) : (i.value = a, i)
        }
    });

    function s3(t) {
        return new s9({
            type: "transform",
            transform: t
        })
    }
    let s5 = c("ZodOptional", (t, n) => {
        rZ.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => u$(t, n, i, r), t.unwrap = () => t._zod.def.innerType
    });

    function s7(t) {
        return new s5({
            type: "optional",
            innerType: t
        })
    }
    let s8 = c("ZodExactOptional", (t, n) => {
        rA.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => u$(t, n, i, r), t.unwrap = () => t._zod.def.innerType
    });

    function de(t) {
        return new s8({
            type: "optional",
            innerType: t
        })
    }
    let dt = c("ZodNullable", (t, n) => {
        rP.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => ux(t, n, i, r), t.unwrap = () => t._zod.def.innerType
    });

    function dn(t) {
        return new dt({
            type: "nullable",
            innerType: t
        })
    }

    function di(t) {
        return s7(dn(t))
    }
    let dr = c("ZodDefault", (t, n) => {
        rj.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => uD(t, n, i, r), t.unwrap = () => t._zod.def.innerType, t.removeDefault = t.unwrap
    });

    function da(t, n) {
        return new dr({
            type: "default",
            innerType: t,
            get defaultValue() {
                return "function" == typeof n ? n() : uJ.shallowClone(n)
            }
        })
    }
    let dc = c("ZodPrefault", (t, n) => {
        rE.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => uO(t, n, i, r), t.unwrap = () => t._zod.def.innerType
    });

    function du(t, n) {
        return new dc({
            type: "prefault",
            innerType: t,
            get defaultValue() {
                return "function" == typeof n ? n() : uJ.shallowClone(n)
            }
        })
    }
    let dl = c("ZodNonOptional", (t, n) => {
        rT.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => uz(t, n, i, r), t.unwrap = () => t._zod.def.innerType
    });

    function ds(t, n) {
        return new dl({
            type: "nonoptional",
            innerType: t,
            ...uJ.normalizeParams(n)
        })
    }
    let dd = c("ZodSuccess", (t, n) => {
        rC.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => ud(t, n, i, r), t.unwrap = () => t._zod.def.innerType
    });

    function dm(t) {
        return new dd({
            type: "success",
            innerType: t
        })
    }
    let df = c("ZodCatch", (t, n) => {
        rJ.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => uZ(t, n, i, r), t.unwrap = () => t._zod.def.innerType, t.removeCatch = t.unwrap
    });

    function dv(t, n) {
        return new df({
            type: "catch",
            innerType: t,
            catchValue: "function" == typeof n ? n : uJ.constantCatch(n)
        })
    }
    let dp = c("ZodNaN", (t, n) => {
        rM.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => uu(t, n, i, r)
    });

    function dg(t) {
        return oO(dp, t)
    }
    let dh = c("ZodPipe", (t, n) => {
        rV.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => uA(t, n, i, r), t.in = n.in, t.out = n.out
    });

    function dy(t, n) {
        return new dh({
            type: "pipe",
            in: t,
            out: n
        })
    }
    let d_ = c("ZodCodec", (t, n) => {
        dh.init(t, n), rB.init(t, n)
    });

    function db(t, n, i) {
        return new d_({
            type: "pipe",
            in: t,
            out: n,
            transform: i.decode,
            reverseTransform: i.encode
        })
    }

    function dk(t) {
        let n = t._zod.def;
        return new d_({
            type: "pipe",
            in: n.out,
            out: n.in,
            transform: n.reverseTransform,
            reverseTransform: n.transform
        })
    }
    let dI = c("ZodPreprocess", (t, n) => {
            dh.init(t, n), rG.init(t, n)
        }),
        dw = c("ZodReadonly", (t, n) => {
            rX.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => uP(t, n, i, r), t.unwrap = () => t._zod.def.innerType
        });

    function dS(t) {
        return new dw({
            type: "readonly",
            innerType: t
        })
    }
    let dx = c("ZodTemplateLiteral", (t, n) => {
        rH.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => ul(t, n, i, r)
    });

    function dz(t, n) {
        return new dx({
            type: "template_literal",
            parts: t,
            ...uJ.normalizeParams(n)
        })
    }
    let dU = c("ZodLazy", (t, n) => {
        r0.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => uE(t, n, i, r), t.unwrap = () => t._zod.def.getter()
    });

    function dN(t) {
        return new dU({
            type: "lazy",
            getter: t
        })
    }
    let dD = c("ZodPromise", (t, n) => {
        rQ.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => uj(t, n, i, r), t.unwrap = () => t._zod.def.innerType
    });

    function dO(t) {
        return new dD({
            type: "promise",
            innerType: t
        })
    }
    let dZ = c("ZodFunction", (t, n) => {
        rY.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => uf(t, n, i, r)
    });

    function dA(t) {
        var n, i;
        return new dZ({
            type: "function",
            input: Array.isArray(null == t ? void 0 : t.input) ? sV(null == t ? void 0 : t.input) : null != (n = null == t ? void 0 : t.input) ? n : sN(sb()),
            output: null != (i = null == t ? void 0 : t.output) ? i : sb()
        })
    }
    let dP = c("ZodCustom", (t, n) => {
        r4.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, i, r) => um(t, n, i, r)
    });

    function dj(t) {
        let n = new nA({
            check: "custom"
        });
        return n._zod.check = t, n
    }

    function d$(t, n) {
        return cI(dP, null != t ? t : () => !0, n)
    }

    function dE(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        return cw(dP, t, n)
    }

    function dT(t, n) {
        return cS(t, n)
    }
    let dL = c("ZodInstanceOf", (t, n) => {
        dP.init(t, n)
    }, {
        properties(t, n) {
            return this.check(oQ(t, n))
        }
    });

    function dC(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
            i = new dL({
                type: "custom",
                check: "custom",
                fn: n => n instanceof t,
                abort: !0,
                ...uJ.normalizeParams(n)
            });
        return i._zod.bag.Class = t, i._zod.check = n => {
            if (!(n.value instanceof t)) {
                var r;
                n.issues.push({
                    code: "invalid_type",
                    expected: t.name,
                    input: n.value,
                    inst: i,
                    path: [...null != (r = i._zod.def.path) ? r : []]
                })
            }
        }, i
    }
    let dR = function() {
        for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
        return cN({
            Codec: d_,
            Boolean: sr,
            String: u8
        }, ...n)
    };

    function dJ(t) {
        let n = dN(() => s$([le(t), l5(), sa(), sg(), sN(n), sB(le(), n)]));
        return n
    }

    function dM(t, n) {
        return new dI({
            type: "pipe",
            in: s3(t),
            out: n
        })
    }

    function dV(t) {
        return or(ln, t)
    }

    function dF(t) {
        return oa(li, t)
    }

    function dB(t) {
        return oo(lr, t)
    }

    function dK(t) {
        return oc(la, t)
    }
    t.s(["ZodAny", 0, sh, "ZodArray", 0, sU, "ZodBase64", 0, lM, "ZodBase64URL", 0, lF, "ZodBigInt", 0, so, "ZodBigIntFormat", 0, su, "ZodBoolean", 0, sr, "ZodCIDRv4", 0, lL, "ZodCIDRv6", 0, lR, "ZodCUID", 0, lI, "ZodCUID2", 0, lS, "ZodCatch", 0, df, "ZodCodec", 0, d_, "ZodCreditCard", 0, lG, "ZodCustom", 0, dP, "ZodCustomStringFormat", 0, l0, "ZodDate", 0, sx, "ZodDefault", 0, dr, "ZodDiscriminatedUnion", 0, sL, "ZodE164", 0, lK, "ZodEmail", 0, lo, "ZodEmoji", 0, ly, "ZodEnum", 0, sY, "ZodExactOptional", 0, s8, "ZodFile", 0, s1, "ZodFunction", 0, dZ, "ZodGUID", 0, lu, "ZodIBAN", 0, lq, "ZodIPv4", 0, lA, "ZodIPv6", 0, lE, "ZodISODate", 0, li, "ZodISODateTime", 0, ln, "ZodISODuration", 0, la, "ZodISOTime", 0, lr, "ZodInstanceOf", 0, dL, "ZodIntersection", 0, sR, "ZodJWT", 0, lY, "ZodKSUID", 0, lO, "ZodLazy", 0, dU, "ZodLiteral", 0, s4, "ZodMAC", 0, lj, "ZodMap", 0, sG, "ZodNaN", 0, dp, "ZodNanoID", 0, lb, "ZodNever", 0, sk, "ZodNonOptional", 0, dl, "ZodNull", 0, sp, "ZodNullable", 0, dt, "ZodNumber", 0, l3, "ZodNumberFormat", 0, l7, "ZodObject", 0, sO, "ZodOptional", 0, s5, "ZodPipe", 0, dh, "ZodPrefault", 0, dc, "ZodPreprocess", 0, dI, "ZodPromise", 0, dD, "ZodReadonly", 0, dw, "ZodRecord", 0, sF, "ZodSet", 0, sq, "ZodString", 0, u8, "ZodStringFormat", 0, lt, "ZodSuccess", 0, dd, "ZodSymbol", 0, sd, "ZodTemplateLiteral", 0, dx, "ZodTransform", 0, s9, "ZodTuple", 0, sM, "ZodType", 0, u3, "ZodULID", 0, lz, "ZodURL", 0, lp, "ZodUUID", 0, ls, "ZodUndefined", 0, sf, "ZodUnion", 0, sj, "ZodUnknown", 0, s_, "ZodVoid", 0, sw, "ZodXID", 0, lN, "ZodXor", 0, sE, "_ZodString", 0, u7, "_default", 0, da, "_function", 0, dA, "any", 0, sy, "array", 0, sN, "base64", 0, lV, "base64url", 0, lB, "bigint", 0, sc, "boolean", 0, sa, "catch", 0, dv, "check", 0, dj, "cidrv4", 0, lC, "cidrv6", 0, lJ, "codec", 0, db, "creditCard", 0, lX, "cuid", 0, lw, "cuid2", 0, lx, "currencyCode", 0, l2, "custom", 0, d$, "date", 0, sz, "describe", 0, cz, "discriminatedUnion", 0, sC, "e164", 0, lW, "email", 0, lc, "emoji", 0, l_, "enum", 0, sQ, "exactOptional", 0, de, "file", 0, s2, "float32", 0, se, "float64", 0, st, "function", 0, dA, "guid", 0, ll, "hash", 0, l9, "hex", 0, l1, "hostname", 0, l6, "httpUrl", 0, lh, "iban", 0, lH, "instanceof", 0, dC, "int", 0, l8, "int32", 0, sn, "int64", 0, sl, "intersection", 0, sJ, "invertCodec", 0, dk, "ipv4", 0, lP, "ipv6", 0, lT, "json", 0, dJ, "jwt", 0, lQ, "keyof", 0, sD, "ksuid", 0, lZ, "lazy", 0, dN, "literal", 0, s6, "looseObject", 0, sP, "looseRecord", 0, sW, "mac", 0, l$, "map", 0, sX, "meta", 0, cU, "nan", 0, dg, "nanoid", 0, lk, "nativeEnum", 0, s0, "never", 0, sI, "nonoptional", 0, ds, "null", 0, sg, "nullable", 0, dn, "nullish", 0, di, "number", 0, l5, "object", 0, sZ, "optional", 0, s7, "partialRecord", 0, sK, "pipe", 0, dy, "prefault", 0, du, "preprocess", 0, dM, "promise", 0, dO, "readonly", 0, dS, "record", 0, sB, "refine", 0, dE, "set", 0, sH, "strictObject", 0, sA, "string", 0, le, "stringFormat", 0, l4, "stringbool", 0, dR, "success", 0, dm, "superRefine", 0, dT, "symbol", 0, sm, "templateLiteral", 0, dz, "transform", 0, s3, "tuple", 0, sV, "uint32", 0, si, "uint64", 0, ss, "ulid", 0, lU, "undefined", 0, sv, "union", 0, s$, "unknown", 0, sb, "url", 0, lg, "uuid", 0, ld, "uuidv4", 0, lm, "uuidv6", 0, lf, "uuidv7", 0, lv, "void", 0, sS, "xid", 0, lD, "xor", 0, sT], 141761), t.s(["date", 0, dF, "datetime", 0, dV, "duration", 0, dK, "time", 0, dB], 130462), t.i(130462), t.s(["ZodISODate", 0, li, "ZodISODateTime", 0, ln, "ZodISODuration", 0, la, "ZodISOTime", 0, lr, "date", 0, dF, "datetime", 0, dV, "duration", 0, dK, "time", 0, dB], 444537);
    var dW = t.i(444537);
    t.s(["bigint", 0, function(t) {
        return oy(so, t)
    }, "boolean", 0, function(t) {
        return og(sr, t)
    }, "date", 0, function(t) {
        return oD(sx, t)
    }, "number", 0, function(t) {
        return ol(l3, t)
    }, "string", 0, function(t) {
        return aJ(u8, t)
    }], 433808);
    var dG = t.i(433808);
    t.s([], 569297), t.i(569297);
    var dX = t.i(141761);
    t.s([], 959154), t.i(959154), t.s(["endsWith", 0, oH, "gt", 0, oP, "gte", 0, oj, "includes", 0, oX, "length", 0, oB, "lowercase", 0, oW, "lt", 0, oZ, "lte", 0, oA, "maxLength", 0, oV, "maxSize", 0, oR, "mime", 0, o0, "minLength", 0, oF, "minSize", 0, oJ, "multipleOf", 0, oC, "negative", 0, oE, "nonnegative", 0, oL, "nonpositive", 0, oT, "normalize", 0, o6, "overwrite", 0, o4, "positive", 0, o$, "properties", 0, oQ, "property", 0, oY, "regex", 0, oK, "size", 0, oM, "slugify", 0, o3, "startsWith", 0, oq, "toLowerCase", 0, o2, "toUpperCase", 0, o9, "trim", 0, o1, "uppercase", 0, oG], 294116);
    var dq = t.i(294116);
    t.i(355475), t.i(176860), t.s(["decode", 0, uY, "decodeAsync", 0, u0, "encode", 0, uH, "encodeAsync", 0, uQ, "parse", 0, uW, "parseAsync", 0, uG, "safeDecode", 0, u6, "safeDecodeAsync", 0, u2, "safeEncode", 0, u4, "safeEncodeAsync", 0, u1, "safeParse", 0, uX, "safeParseAsync", 0, uq, "validate", 0, nv, "validateAsync", 0, np], 918400), t.i(918400);
    let dH = {
        invalid_type: "invalid_type",
        too_big: "too_big",
        too_small: "too_small",
        invalid_format: "invalid_format",
        not_multiple_of: "not_multiple_of",
        unrecognized_keys: "unrecognized_keys",
        invalid_union: "invalid_union",
        invalid_key: "invalid_key",
        invalid_element: "invalid_element",
        invalid_value: "invalid_value",
        custom: "custom"
    };

    function dY(t) {
        m({
            customError: t
        })
    }

    function dQ() {
        return m().customError
    }
    eW || (eW = {}), t.s(["ZodFirstPartyTypeKind", 0, eW, "ZodIssueCode", 0, dH, "getErrorMap", 0, dQ, "setErrorMap", 0, dY], 450430), t.i(450430), t.s(["$brand", 0, u, "ZodFirstPartyTypeKind", 0, eW, "ZodIssueCode", 0, dH, "config", 0, m, "getErrorMap", 0, dQ, "setErrorMap", 0, dY], 690643), t.i(690643);
    var uR = tV,
        uJ = eG;
    let d0 = {
            ...dX,
            ...dq,
            iso: dW
        },
        d4 = new Set(["$schema", "$ref", "$defs", "definitions", "$id", "id", "$comment", "$anchor", "$vocabulary", "$dynamicRef", "$dynamicAnchor", "type", "enum", "const", "anyOf", "oneOf", "allOf", "not", "properties", "required", "additionalProperties", "patternProperties", "propertyNames", "minProperties", "maxProperties", "items", "prefixItems", "additionalItems", "minItems", "maxItems", "uniqueItems", "contains", "minContains", "maxContains", "minLength", "maxLength", "pattern", "format", "minimum", "maximum", "exclusiveMinimum", "exclusiveMaximum", "multipleOf", "description", "default", "contentEncoding", "contentMediaType", "contentSchema", "unevaluatedItems", "unevaluatedProperties", "if", "then", "else", "dependentSchemas", "dependentRequired", "nullable", "readOnly"]);

    function d6(t, n) {
        return t.map((t, i) => i < n ? t : t.optional())
    }
    let d1 = new Set(["items", "prefixItems", "additionalItems", "additionalProperties", "contains", "propertyNames", "not", "if", "then", "else", "allOf", "anyOf", "oneOf", "unevaluatedItems", "unevaluatedProperties", "contentSchema"]),
        d2 = new Set(["properties", "patternProperties", "dependentSchemas", "dependencies", "$defs", "definitions"]);

    function d9(t) {
        return "object" == typeof t && null !== t && (Array.isArray(t) ? t.some(d9) : "string" == typeof t.$ref || Object.entries(t).some(t => {
            let [n, i] = t;
            return d1.has(n) ? d9(i) : !!d2.has(n) && "object" == typeof i && null !== i && Object.values(i).some(d9)
        }))
    }

    function d3(t) {
        return 1 === t ? "element" : "elements"
    }

    function d5(t, n) {
        if (!1 !== t) return void 0 === t || !0 === t ? d0.any() : d8(t, n)
    }
    let d7 = /^(?:[01]\d|2[0-3]):[0-5]\d:[0-5]\d(?:\.\d+)?(?:Z|[+-](?:[01]\d|2[0-3]):[0-5]\d)$/;

    function d8(t, n) {
        if ("boolean" == typeof t) return t ? d0.any() : d0.never();
        let i = function t(n, i) {
                var r, a, o, c;
                let u;
                if (void 0 !== n.not) {
                    if ("object" == typeof n.not && 0 === Object.keys(n.not).length) return d0.never();
                    throw Error("not is not supported in Zod (except { not: {} } for never)")
                }
                if (void 0 !== n.unevaluatedItems) throw Error("unevaluatedItems is not supported");
                if (void 0 !== n.unevaluatedProperties) throw Error("unevaluatedProperties is not supported");
                if (void 0 !== n.if || void 0 !== n.then || void 0 !== n.else) throw Error("Conditional schemas (if/then/else) are not supported");
                if (void 0 !== n.dependentSchemas || void 0 !== n.dependentRequired) throw Error("dependentSchemas and dependentRequired are not supported");
                if (n.$ref) {
                    let t = n.$ref;
                    if (i.refs.has(t)) return i.refs.get(t);
                    if (i.processing.has(t)) return d0.lazy(() => {
                        if (!i.refs.has(t)) throw Error("Circular reference not resolved: ".concat(t));
                        return i.refs.get(t)
                    });
                    i.processing.add(t);
                    let r = d8(function(t, n) {
                        if (!t.startsWith("#")) throw Error("External $ref is not supported, only local refs (#/...) are allowed");
                        let i = t.slice(1).split("/").filter(Boolean);
                        if (0 === i.length) return n.rootSchema;
                        let r = "draft-2020-12" === n.version ? "$defs" : "definitions";
                        if (i[0] === r) {
                            let r = void 0 === i[1] ? void 0 : i[1].replace(/~1/g, "/").replace(/~0/g, "~");
                            if (!r || !n.defs[r]) throw Error("Reference not found: ".concat(t));
                            return n.defs[r]
                        }
                        throw Error("Reference not found: ".concat(t))
                    }(t, i), i);
                    return i.refs.set(t, r), i.processing.delete(t), r
                }
                if (void 0 !== n.enum) {
                    let t = n.enum;
                    if ("openapi-3.0" === i.version && !0 === n.nullable && 1 === t.length && null === t[0]) return d0.null();
                    if (0 === t.length) return d0.never();
                    if (1 === t.length) return d0.literal(t[0]);
                    if (t.every(t => "string" == typeof t)) return d0.enum(t);
                    let r = t.map(t => d0.literal(t));
                    return r.length < 2 ? r[0] : d0.union([r[0], r[1], ...r.slice(2)])
                }
                if (void 0 !== n.const) return d0.literal(n.const);
                let l = n.type;
                if (Array.isArray(l)) {
                    let r = l.map(r => t({
                        ...n,
                        type: r
                    }, i));
                    return 0 === r.length ? d0.never() : 1 === r.length ? r[0] : d0.union(r)
                }
                if (!l) return d0.any();
                switch (l) {
                    case "string": {
                        let t = d0.string();
                        if (n.format) {
                            let i = n.format;
                            "email" === i ? t = t.check(d0.email()) : "uri" === i || "uri-reference" === i ? t = t.check(d0.url()) : "uuid" === i || "guid" === i ? t = t.check(d0.uuid()) : "date-time" === i ? t = t.check(d0.iso.datetime({
                                offset: !0
                            })) : "date" === i ? t = t.check(d0.iso.date()) : "time" === i ? t = t.check(d0.regex(d7)) : "duration" === i ? t = t.check(d0.iso.duration()) : "hostname" === i ? t = t.check(d0.hostname()) : "ipv4" === i ? t = t.check(d0.ipv4()) : "ipv6" === i ? t = t.check(d0.ipv6()) : "mac" === i ? t = t.check(d0.mac()) : "cidr" === i ? t = t.check(d0.cidrv4()) : "cidr-v6" === i ? t = t.check(d0.cidrv6()) : "base64" === i ? t = t.check(d0.base64()) : "base64url" === i ? t = t.check(d0.base64url()) : "e164" === i ? t = t.check(d0.e164()) : "credit_card" === i ? t = t.check(d0.creditCard()) : "iban" === i ? t = t.check(d0.iban()) : "jwt" === i ? t = t.check(d0.jwt()) : "emoji" === i ? t = t.check(d0.emoji()) : "nanoid" === i ? t = t.check(d0.nanoid()) : "cuid" === i ? t = t.check(d0.cuid()) : "cuid2" === i ? t = t.check(d0.cuid2()) : "ulid" === i ? t = t.check(d0.ulid()) : "xid" === i ? t = t.check(d0.xid()) : "ksuid" === i && (t = t.check(d0.ksuid()))
                        }
                        "number" == typeof n.minLength && (t = t.min(n.minLength)), "number" == typeof n.maxLength && (t = t.max(n.maxLength)), n.pattern && (t = t.regex(new RegExp(n.pattern))), u = t;
                        break
                    }
                    case "number":
                    case "integer": {
                        let t = "integer" === l ? d0.number().int() : d0.number();
                        "number" == typeof n.minimum && !0 !== n.exclusiveMinimum && (t = t.min(n.minimum)), "number" == typeof n.maximum && !0 !== n.exclusiveMaximum && (t = t.max(n.maximum)), "number" == typeof n.exclusiveMinimum ? t = t.gt(n.exclusiveMinimum) : !0 === n.exclusiveMinimum && "number" == typeof n.minimum && (t = t.gt(n.minimum)), "number" == typeof n.exclusiveMaximum ? t = t.lt(n.exclusiveMaximum) : !0 === n.exclusiveMaximum && "number" == typeof n.maximum && (t = t.lt(n.maximum)), "number" == typeof n.multipleOf && (t = t.multipleOf(n.multipleOf)), u = t;
                        break
                    }
                    case "boolean":
                        u = d0.boolean();
                        break;
                    case "null":
                        u = d0.null();
                        break;
                    case "object": {
                        let t = {},
                            o = n.properties || {},
                            c = new Set(n.required || []),
                            l = "object" == typeof n.additionalProperties ? d8(n.additionalProperties, i) : void 0;
                        for (let [n, r] of Object.entries(o)) {
                            let a = d8(r, i);
                            O(t, n, c.has(n) ? a : a.optional())
                        }
                        if (n.patternProperties) {
                            let r = n.patternProperties,
                                a = Object.keys(r),
                                o = [];
                            for (let t of a) {
                                let n = d8(r[t], i),
                                    a = d0.string().regex(new RegExp(t));
                                o.push(d0.looseRecord(a, n))
                            }
                            let c = [];
                            if (Object.keys(t).length > 0 && c.push(d0.object(t).passthrough()), c.push(...o), 0 === c.length) u = d0.object({}).passthrough();
                            else if (1 === c.length) u = c[0];
                            else {
                                let t = d0.intersection(c[0], c[1]);
                                for (let n = 2; n < c.length; n++) t = d0.intersection(t, c[n]);
                                u = t
                            }
                            if (!1 === n.additionalProperties) {
                                let n = Object.keys(t),
                                    i = a.map(t => new RegExp(t)),
                                    r = u;
                                u = u.check(t => {
                                    if (!K(t.value)) return;
                                    let a = [];
                                    for (let r of Object.keys(t.value)) !n.includes(r) && (i.some(t => t.test(r)) || a.push(r));
                                    a.length && t.issues.push({
                                        code: "unrecognized_keys",
                                        keys: a,
                                        input: t.value,
                                        inst: r
                                    })
                                })
                            }
                        } else {
                            let i = d0.object(t);
                            u = !1 === n.additionalProperties ? i.strict() : l ? i.catchall(l) : i.passthrough()
                        }
                        let s = void 0 !== n.propertyNames && !0 !== n.propertyNames,
                            d = "number" == typeof n.minProperties ? n.minProperties : void 0,
                            m = "number" == typeof n.maxProperties ? n.maxProperties : void 0;
                        if (s || void 0 !== d || void 0 !== m) {
                            let t;
                            s && (t = d8("object" == typeof n.propertyNames && void 0 === n.propertyNames.type ? {
                                type: "string",
                                ...n.propertyNames
                            } : n.propertyNames, i)), r = u, a = {
                                keySchema: t,
                                minProperties: d,
                                maxProperties: m
                            }, u = d0.transform(t => t).check(t => {
                                let n = t.value;
                                if ("object" != typeof n || null === n || Array.isArray(n)) return;
                                let i = Object.getOwnPropertyNames(n);
                                if (void 0 !== a.minProperties && i.length < a.minProperties && t.issues.push({
                                        origin: "object",
                                        code: "too_small",
                                        minimum: a.minProperties,
                                        inclusive: !0,
                                        message: "Too small: expected object to have >=".concat(a.minProperties, " properties"),
                                        input: n,
                                        inst: r,
                                        continue: !0
                                    }), void 0 !== a.maxProperties && i.length > a.maxProperties && t.issues.push({
                                        origin: "object",
                                        code: "too_big",
                                        maximum: a.maxProperties,
                                        inclusive: !0,
                                        message: "Too big: expected object to have <=".concat(a.maxProperties, " properties"),
                                        input: n,
                                        inst: r,
                                        continue: !0
                                    }), a.keySchema)
                                    for (let n of i) {
                                        let i = a.keySchema.safeParse(n);
                                        i.success || t.issues.push({
                                            code: "invalid_key",
                                            origin: "record",
                                            issues: i.error.issues,
                                            input: n,
                                            path: [n],
                                            continue: !0
                                        })
                                    }
                            }).pipe(r)
                        }
                        break
                    }
                    case "array": {
                        let t = n.prefixItems,
                            r = n.items;
                        if (t && Array.isArray(t)) {
                            let a = "number" == typeof n.minItems ? n.minItems : 0,
                                o = d6(t.map(t => d8(t, i)), a),
                                c = Array.isArray(r) ? void 0 : d5(r, i),
                                l = d0.tuple(o);
                            u = c ? l.rest(c) : l, "number" == typeof n.minItems && (u = u.check(d0.minLength(n.minItems))), "number" == typeof n.maxItems && (u = u.check(d0.maxLength(n.maxItems)))
                        } else if (Array.isArray(r)) {
                            let t = "number" == typeof n.minItems ? n.minItems : 0,
                                a = d6(r.map(t => d8(t, i)), t),
                                o = d5(n.additionalItems, i),
                                c = d0.tuple(a);
                            u = o ? c.rest(o) : c, "number" == typeof n.minItems && (u = u.check(d0.minLength(n.minItems))), "number" == typeof n.maxItems && (u = u.check(d0.maxLength(n.maxItems)))
                        } else if (void 0 !== r) {
                            let t = d8(r, i),
                                a = d0.array(t);
                            "number" == typeof n.minItems && (a = a.min(n.minItems)), "number" == typeof n.maxItems && (a = a.max(n.maxItems)), u = a
                        } else u = d0.array(d0.any());
                        (!0 === n.uniqueItems || void 0 !== n.contains) && (o = u, c = {
                            uniqueItems: !0 === n.uniqueItems,
                            containsSchema: void 0 !== n.contains ? d8(n.contains, i) : void 0,
                            minContains: "number" == typeof n.minContains ? n.minContains : void 0,
                            maxContains: "number" == typeof n.maxContains ? n.maxContains : void 0
                        }, u = d0.transform(t => t).check(t => {
                            let n = t.value;
                            if (Array.isArray(n)) {
                                if (!0 === c.uniqueItems) {
                                    let i = new Map;
                                    for (let r = 0; r < n.length; r++) {
                                        let a = function t(n, i) {
                                            if (null === n) return "z";
                                            let r = typeof n;
                                            if ("object" !== r) {
                                                if ("number" === r && Number.isNaN(n)) return null;
                                                let t = String(n);
                                                return "".concat(r[0]).concat(t.length, ":").concat(t)
                                            }
                                            if (i.has(n)) return null;
                                            i.add(n);
                                            try {
                                                if (Array.isArray(n)) {
                                                    let r = [];
                                                    for (let a of n) {
                                                        let n = t(a, i);
                                                        if (null === n) return null;
                                                        r.push(n)
                                                    }
                                                    return "a".concat(r.length, ":[").concat(r.join(","), "]")
                                                }
                                                let r = Object.keys(n).sort(),
                                                    a = [];
                                                for (let o of r) {
                                                    let r = t(n[o], i);
                                                    if (null === r) return null;
                                                    a.push("".concat(o.length, ":").concat(o, "=").concat(r))
                                                }
                                                return "o".concat(a.length, ":{").concat(a.join(","), "}")
                                            } finally {
                                                i.delete(n)
                                            }
                                        }(n[r], new Set);
                                        if (null === a) continue;
                                        let o = i.get(a);
                                        if (void 0 === o) {
                                            i.set(a, r);
                                            continue
                                        }
                                        t.issues.push({
                                            code: "custom",
                                            message: "Array items must be unique: element at index ".concat(r, " duplicates the one at index ").concat(o),
                                            input: n,
                                            path: [r],
                                            continue: !0
                                        })
                                    }
                                }
                                if (c.containsSchema) {
                                    var i;
                                    let r = null != (i = c.minContains) ? i : 1,
                                        a = void 0 !== c.maxContains ? c.maxContains + 1 : 1 / 0,
                                        o = 0;
                                    for (let t of n)
                                        if (c.containsSchema.safeParse(t).success && ++o >= a) break;
                                    o < r && t.issues.push({
                                        code: "custom",
                                        message: "Array must contain at least ".concat(r, " matching ").concat(d3(r), "; found ").concat(o),
                                        input: n,
                                        continue: !0
                                    }), void 0 !== c.maxContains && o > c.maxContains && t.issues.push({
                                        code: "custom",
                                        message: "Array must contain at most ".concat(c.maxContains, " matching ").concat(d3(c.maxContains)),
                                        input: n,
                                        continue: !0
                                    })
                                }
                            }
                        }).pipe(o));
                        break
                    }
                    default:
                        throw Error("Unsupported type: ".concat(l))
                }
                return u
            }(t, n),
            r = t.type || void 0 !== t.enum || void 0 !== t.const;
        if (t.anyOf && Array.isArray(t.anyOf)) {
            let a = t.anyOf.map(t => d8(t, n)),
                o = d0.union(a);
            i = r ? d0.intersection(i, o) : o
        }
        if (t.oneOf && Array.isArray(t.oneOf)) {
            let a = t.oneOf.map(t => d8(t, n)),
                o = d0.xor(a);
            i = r ? d0.intersection(i, o) : o
        }
        if (t.allOf && Array.isArray(t.allOf))
            if (0 === t.allOf.length) i = r ? i : d0.any();
            else {
                let a = r ? i : d8(t.allOf[0], n),
                    o = +!r;
                for (let i = o; i < t.allOf.length; i++) a = d0.intersection(a, d8(t.allOf[i], n));
                i = a
            }! 0 === t.nullable && "openapi-3.0" === n.version && (i = d0.nullable(i)), !0 === t.readOnly && (i = d0.readonly(i)), void 0 !== t.default && (i = i.default(t.default));
        let a = {};
        for (let n of ["$id", "id", "$comment", "$anchor", "$vocabulary", "$dynamicRef", "$dynamicAnchor"]) n in t && (a[n] = t[n]);
        for (let n of ["contentEncoding", "contentMediaType", "contentSchema"]) n in t && (a[n] = t[n]);
        if ("object" === t.type && void 0 === t.$ref)
            for (let n of (void 0 === t.propertyNames || d9(t.propertyNames) || (a.propertyNames = t.propertyNames), ["minProperties", "maxProperties"])) void 0 !== t[n] && (a[n] = t[n]);
        if ("array" === t.type && void 0 === t.$ref)
            for (let n of (void 0 === t.contains || d9(t.contains) || (a.contains = t.contains), ["uniqueItems", "minContains", "maxContains"])) void 0 !== t[n] && (a[n] = t[n]);
        for (let n of Object.keys(t)) d4.has(n) || O(a, n, t[n]);
        return Object.keys(a).length > 0 && n.registry.add(i, a), t.description && (i = i.describe(t.description)), i
    }
    let me = Symbol("z.visit/resolving");

    function mt(t, n) {
        let i = "function" == typeof n ? n : (t, i) => {
                let r = n[t._zod.def.type];
                return r ? r(t, i) : t
            },
            r = new Map;
        return function t(n) {
            let a = r.get(n);
            if (a === me) return new r0({
                type: "lazy",
                getter: () => r.get(n)
            });
            if (void 0 !== a) return a;
            r.set(n, me);
            let o = function(n) {
                    let i = n._zod.def;
                    switch (i.type) {
                        case "object": {
                            let r = i.shape,
                                a = Object.keys(r),
                                o = !1,
                                c = {};
                            for (let n of a) {
                                let i = t(r[n]);
                                i !== r[n] && (o = !0), c[n] = i
                            }
                            let u = i.catchall;
                            return i.catchall && (u = t(i.catchall)) !== i.catchall && (o = !0), o ? Q(n, {
                                ...i,
                                shape: c,
                                catchall: u
                            }) : n
                        }
                        case "array": {
                            let r = t(i.element);
                            return r === i.element ? n : Q(n, {
                                ...i,
                                element: r
                            })
                        }
                        case "tuple": {
                            let r = i.items,
                                a = !1,
                                o = [];
                            for (let n of r) {
                                let i = t(n);
                                i !== n && (a = !0), o.push(i)
                            }
                            let c = i.rest;
                            return i.rest && (c = t(i.rest)) !== i.rest && (a = !0), a ? Q(n, {
                                ...i,
                                items: o,
                                rest: c
                            }) : n
                        }
                        case "record":
                        case "map": {
                            let r = t(i.keyType),
                                a = t(i.valueType);
                            return r === i.keyType && a === i.valueType ? n : Q(n, {
                                ...i,
                                keyType: r,
                                valueType: a
                            })
                        }
                        case "set": {
                            let r = t(i.valueType);
                            return r === i.valueType ? n : Q(n, {
                                ...i,
                                valueType: r
                            })
                        }
                        case "union": {
                            let r = i.options,
                                a = !1,
                                o = [];
                            for (let n of r) {
                                let i = t(n);
                                i !== n && (a = !0), o.push(i)
                            }
                            return a ? Q(n, {
                                ...i,
                                options: o
                            }) : n
                        }
                        case "intersection": {
                            let r = t(i.left),
                                a = t(i.right);
                            return r === i.left && a === i.right ? n : Q(n, {
                                ...i,
                                left: r,
                                right: a
                            })
                        }
                        case "optional":
                        case "nullable":
                        case "default":
                        case "prefault":
                        case "catch":
                        case "readonly":
                        case "nonoptional":
                        case "promise":
                        case "success": {
                            let r = t(i.innerType);
                            return r === i.innerType ? n : Q(n, {
                                ...i,
                                innerType: r
                            })
                        }
                        case "pipe": {
                            let r = t(i.in),
                                a = t(i.out);
                            return r === i.in && a === i.out ? n : Q(n, {
                                ...i,
                                in: r,
                                out: a
                            })
                        }
                        case "function": {
                            let r = t(i.input),
                                a = t(i.output);
                            return r === i.input && a === i.output ? n : Q(n, {
                                ...i,
                                input: r,
                                output: a
                            })
                        }
                        case "lazy": {
                            let r = i.getter,
                                {
                                    _cachedInner: a,
                                    ...o
                                } = i;
                            return Q(n, {
                                ...o,
                                getter: () => t(r())
                            })
                        }
                        default:
                            return n
                    }
                }(n),
                c = i(o, o !== n);
            return r.set(n, c), c
        }(t)
    }

    function mn(t) {
        return function(t, n) {
            var i;
            if (!(null == n ? void 0 : n.length)) return t;
            let r = t._zod.def;
            return Q(t, E(r, {
                checks: [...null != (i = r.checks) ? i : [], ...n]
            }), {
                parent: !0
            })
        }(t.out, t.checks)
    }
    t.s(["$brand", 0, u, "$input", 0, ao, "$output", 0, aa, "INVALID", 0, as, "NEVER", 0, r, "TimePrecision", 0, oi, "ZodAny", 0, sh, "ZodArray", 0, sU, "ZodBase64", 0, lM, "ZodBase64URL", 0, lF, "ZodBigInt", 0, so, "ZodBigIntFormat", 0, su, "ZodBoolean", 0, sr, "ZodCIDRv4", 0, lL, "ZodCIDRv6", 0, lR, "ZodCUID", 0, lI, "ZodCUID2", 0, lS, "ZodCatch", 0, df, "ZodCodec", 0, d_, "ZodCompileAsyncError", 0, am, "ZodCompileUnsupportedError", 0, af, "ZodCreditCard", 0, lG, "ZodCustom", 0, dP, "ZodCustomStringFormat", 0, l0, "ZodDate", 0, sx, "ZodDefault", 0, dr, "ZodDiscriminatedUnion", 0, sL, "ZodE164", 0, lK, "ZodEmail", 0, lo, "ZodEmoji", 0, ly, "ZodEnum", 0, sY, "ZodError", 0, uB, "ZodExactOptional", 0, s8, "ZodFile", 0, s1, "ZodFirstPartyTypeKind", 0, eW, "ZodFunction", 0, dZ, "ZodGUID", 0, lu, "ZodIBAN", 0, lq, "ZodIPv4", 0, lA, "ZodIPv6", 0, lE, "ZodISODate", 0, li, "ZodISODateTime", 0, ln, "ZodISODuration", 0, la, "ZodISOTime", 0, lr, "ZodInstanceOf", 0, dL, "ZodIntersection", 0, sR, "ZodIssueCode", 0, dH, "ZodJWT", 0, lY, "ZodKSUID", 0, lO, "ZodLazy", 0, dU, "ZodLiteral", 0, s4, "ZodMAC", 0, lj, "ZodMap", 0, sG, "ZodNaN", 0, dp, "ZodNanoID", 0, lb, "ZodNever", 0, sk, "ZodNonOptional", 0, dl, "ZodNull", 0, sp, "ZodNullable", 0, dt, "ZodNumber", 0, l3, "ZodNumberFormat", 0, l7, "ZodObject", 0, sO, "ZodOptional", 0, s5, "ZodPipe", 0, dh, "ZodPrefault", 0, dc, "ZodPreprocess", 0, dI, "ZodPromise", 0, dD, "ZodReadonly", 0, dw, "ZodRealError", 0, uK, "ZodRecord", 0, sF, "ZodSet", 0, sq, "ZodString", 0, u8, "ZodStringFormat", 0, lt, "ZodSuccess", 0, dd, "ZodSymbol", 0, sd, "ZodTemplateLiteral", 0, dx, "ZodTransform", 0, s9, "ZodTuple", 0, sM, "ZodType", 0, u3, "ZodULID", 0, lz, "ZodURL", 0, lp, "ZodUUID", 0, ls, "ZodUndefined", 0, sf, "ZodUnion", 0, sj, "ZodUnknown", 0, s_, "ZodVoid", 0, sw, "ZodXID", 0, lN, "ZodXor", 0, sE, "_ZodString", 0, u7, "_default", 0, da, "_function", 0, dA, "any", 0, sy, "array", 0, sN, "base64", 0, lV, "base64url", 0, lB, "bigint", 0, sc, "boolean", 0, sa, "catch", 0, dv, "check", 0, dj, "cidrv4", 0, lC, "cidrv6", 0, lJ, "clone", 0, Q, "codec", 0, db, "coerce", 0, dG, "compile", 0, av, "config", 0, m, "core", 0, uC, "creditCard", 0, lX, "cuid", 0, lw, "cuid2", 0, lx, "currencyCode", 0, l2, "custom", 0, d$, "date", 0, sz, "decode", 0, uY, "decodeAsync", 0, u0, "deepPartial", 0, function(t) {
        return mt(t, {
            object: t => t.partial(),
            union: t => {
                let n = t._zod.def;
                return void 0 === n.discriminator ? t : s$(n.options)
            }
        })
    }, "describe", 0, cz, "discriminatedUnion", 0, sC, "e164", 0, lW, "email", 0, lc, "emoji", 0, l_, "encode", 0, uH, "encodeAsync", 0, uQ, "endsWith", 0, oH, "enum", 0, sQ, "exactOptional", 0, de, "file", 0, s2, "flattenError", 0, t5, "float32", 0, se, "float64", 0, st, "formatError", 0, t7, "fromJSONSchema", 0, function(t, n) {
        var i, r, a;
        let o, c;
        if ("boolean" == typeof t) return t ? d0.any() : d0.never();
        try {
            o = JSON.parse(JSON.stringify(t))
        } catch (t) {
            throw Error("fromJSONSchema input is not valid JSON (possibly cyclic); use $defs/$ref for recursive schemas")
        }
        let u = {
            version: (r = o, a = null == n ? void 0 : n.defaultTarget, "https://json-schema.org/draft/2020-12/schema" === (c = r.$schema) ? "draft-2020-12" : "http://json-schema.org/draft-07/schema#" === c ? "draft-7" : "http://json-schema.org/draft-04/schema#" === c ? "draft-4" : null != a ? a : "draft-2020-12"),
            defs: o.$defs || o.definitions || {},
            refs: new Map,
            processing: new Set,
            rootSchema: o,
            registry: null != (i = null == n ? void 0 : n.registry) ? i : al
        };
        return d8(o, u)
    }, "function", 0, dA, "getDiscriminatedOption", 0, rd, "getErrorMap", 0, dQ, "globalRegistry", 0, al, "gt", 0, oP, "gte", 0, oj, "guid", 0, ll, "hash", 0, l9, "hex", 0, l1, "hostname", 0, l6, "httpUrl", 0, lh, "iban", 0, lH, "includes", 0, oX, "input", 0, function(t) {
        return mt(t, {
            pipe: t => {
                var n;
                return (n = t._zod.def).in._zod.traits.has("$ZodTransform") ? mn(n) : n.in
            },
            default: (t, n) => n ? s7(t._zod.def.innerType) : t,
            catch: (t, n) => n ? t._zod.def.innerType : t
        })
    }, "instanceof", 0, dC, "int", 0, l8, "int32", 0, sn, "int64", 0, sl, "intersection", 0, sJ, "invertCodec", 0, dk, "ipv4", 0, lP, "ipv6", 0, lT, "iso", 0, dW, "json", 0, dJ, "jwt", 0, lQ, "keyof", 0, sD, "ksuid", 0, lZ, "lazy", 0, dN, "length", 0, oB, "literal", 0, s6, "locales", 0, tQ, "looseObject", 0, sP, "looseRecord", 0, sW, "lowercase", 0, oW, "lt", 0, oZ, "lte", 0, oA, "mac", 0, l$, "map", 0, sX, "maxLength", 0, oV, "maxSize", 0, oR, "memoizer", 0, ai, "meta", 0, cU, "mime", 0, o0, "minLength", 0, oF, "minSize", 0, oJ, "multipleOf", 0, oC, "nan", 0, dg, "nanoid", 0, lk, "nativeEnum", 0, s0, "negative", 0, oE, "never", 0, sI, "nonnegative", 0, oL, "nonoptional", 0, ds, "nonpositive", 0, oT, "normalize", 0, o6, "null", 0, sg, "nullable", 0, dn, "nullish", 0, di, "number", 0, l5, "object", 0, sZ, "optional", 0, s7, "output", 0, function(t) {
        return mt(t, {
            pipe: t => mn(t._zod.def),
            prefault: (t, n) => n ? t._zod.def.innerType : t
        })
    }, "overwrite", 0, o4, "parse", 0, uW, "parseAsync", 0, uG, "partialRecord", 0, sK, "pipe", 0, dy, "positive", 0, o$, "prefault", 0, du, "preprocess", 0, dM, "prettifyError", 0, nt, "promise", 0, dO, "properties", 0, oQ, "property", 0, oY, "readonly", 0, dS, "record", 0, sB, "refine", 0, dE, "regex", 0, oK, "regexes", () => uR, "registry", 0, au, "safeDecode", 0, u6, "safeDecodeAsync", 0, u2, "safeEncode", 0, u4, "safeEncodeAsync", 0, u1, "safeParse", 0, uX, "safeParseAsync", 0, uq, "set", 0, sH, "setErrorMap", 0, dY, "size", 0, oM, "slugify", 0, o3, "startsWith", 0, oq, "strictObject", 0, sA, "string", 0, le, "stringFormat", 0, l4, "stringbool", 0, dR, "success", 0, dm, "superRefine", 0, dT, "symbol", 0, sm, "templateLiteral", 0, dz, "toJSONSchema", 0, uL, "toLowerCase", 0, o2, "toUpperCase", 0, o9, "toZod", 0, p, "transform", 0, s3, "treeifyError", 0, t8, "trim", 0, o1, "tuple", 0, sV, "uint32", 0, si, "uint64", 0, ss, "ulid", 0, lU, "undefined", 0, sv, "union", 0, s$, "unknown", 0, sb, "uppercase", 0, oG, "url", 0, lg, "util", () => uJ, "uuid", 0, ld, "uuidv4", 0, lm, "uuidv6", 0, lf, "uuidv7", 0, lv, "validate", 0, nv, "validateAsync", 0, np, "void", 0, sS, "withParser", 0, ap, "xid", 0, lD, "xor", 0, sT], 760829);
    var mi = t.i(760829);
    t.s(["z", 0, mi], 438641)
}]);

//# debugId=f258aadb-912d-f3e6-73b8-270a733f6f47
//# sourceMappingURL=08szium7vd1wo.js.map