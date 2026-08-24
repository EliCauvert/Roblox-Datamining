;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "51fd4ae8-1dae-e9eb-1987-1a480f583061")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 772738, 734341, 286840, 685104, 133017, 937793, 722380, 583555, 856326, 427542, 694257, 753895, e => {
    "use strict";
    let t = Object.freeze({
        status: "aborted"
    });

    function n(e, t, n) {
        var i;

        function r(n, i) {
            if (n._zod || Object.defineProperty(n, "_zod", {
                    value: {
                        def: i,
                        constr: c,
                        traits: new Set
                    },
                    enumerable: !1
                }), n._zod.traits.has(e)) return;
            n._zod.traits.add(e), t(n, i);
            let r = c.prototype,
                a = Object.keys(r);
            for (let e = 0; e < a.length; e++) {
                let t = a[e];
                t in n || (n[t] = r[t].bind(n))
            }
        }
        let a = null != (i = null == n ? void 0 : n.Parent) ? i : Object;
        class o extends a {}

        function c(e) {
            var t;
            let i = (null == n ? void 0 : n.Parent) ? new o : this;
            for (let n of (r(i, e), null != (t = i._zod).deferred || (t.deferred = []), i._zod.deferred)) n();
            return i
        }
        return Object.defineProperty(o, "name", {
            value: e
        }), Object.defineProperty(c, "init", {
            value: r
        }), Object.defineProperty(c, Symbol.hasInstance, {
            value: t => {
                var i, r;
                return null != n && !!n.Parent && t instanceof n.Parent || (null == t || null == (r = t._zod) || null == (i = r.traits) ? void 0 : i.has(e))
            }
        }), Object.defineProperty(c, "name", {
            value: e
        }), c
    }
    let i = Symbol("zod_brand");
    class r extends Error {
        constructor() {
            super("Encountered Promise during synchronous parse. Use .parseAsync() instead.")
        }
    }
    class a extends Error {
        constructor(e) {
            super("Encountered unidirectional transform during encode: ".concat(e)), this.name = "ZodEncodeError"
        }
    }
    null != (K = globalThis).__zod_globalConfig || (K.__zod_globalConfig = {});
    let o = globalThis.__zod_globalConfig;

    function c(e) {
        return e && Object.assign(o, e), o
    }

    function u(e) {
        let t = Object.values(e).filter(e => "number" == typeof e);
        return Object.entries(e).filter(e => {
            let [n, i] = e;
            return -1 === t.indexOf(+n)
        }).map(e => {
            let [t, n] = e;
            return n
        })
    }

    function l(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "|";
        return e.map(e => D(e)).join(t)
    }

    function s(e, t) {
        return "bigint" == typeof t ? t.toString() : t
    }

    function d(e) {
        return {
            get value() {
                {
                    let t = e();
                    return Object.defineProperty(this, "value", {
                        value: t
                    }), t
                }
            }
        }
    }

    function m(e) {
        return null == e
    }

    function f(e) {
        let t = +!!e.startsWith("^"),
            n = e.endsWith("$") ? e.length - 1 : e.length;
        return e.slice(t, n)
    }

    function v(e, t) {
        let n = e / t,
            i = Math.round(n),
            r = Number.EPSILON * Math.max(Math.abs(n), 1);
        return Math.abs(n - i) < r ? 0 : n - i
    }
    e.s(["$ZodAsyncError", 0, r, "$ZodEncodeError", 0, a, "$brand", 0, i, "$constructor", 0, n, "NEVER", 0, t, "config", 0, c, "globalConfig", 0, o], 734341);
    let p = Symbol("evaluating");

    function g(e, t, n) {
        let i;
        Object.defineProperty(e, t, {
            get() {
                if (i !== p) return void 0 === i && (i = p, i = n()), i
            },
            set(n) {
                Object.defineProperty(e, t, {
                    value: n
                })
            },
            configurable: !0
        })
    }

    function h(e, t, n) {
        Object.defineProperty(e, t, {
            value: n,
            writable: !0,
            enumerable: !0,
            configurable: !0
        })
    }

    function _() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        let i = {};
        for (let e of t) Object.assign(i, Object.getOwnPropertyDescriptors(e));
        return Object.defineProperties({}, i)
    }

    function y(e) {
        return JSON.stringify(e)
    }

    function b(e) {
        return e.toLowerCase().trim().replace(/[^\w\s-]/g, "").replace(/[\s_-]+/g, "-").replace(/^-+|-+$/g, "")
    }
    let k = "captureStackTrace" in Error ? Error.captureStackTrace : function() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n]
    };

    function I(e) {
        return "object" == typeof e && null !== e && !Array.isArray(e)
    }
    let x = d(() => {
        var e, t;
        if (o.jitless || "u" > typeof navigator && (null == (t = navigator) || null == (e = t.userAgent) ? void 0 : e.includes("Cloudflare"))) return !1;
        try {
            return Function(""), !0
        } catch (e) {
            return !1
        }
    });

    function S(e) {
        if (!1 === I(e)) return !1;
        let t = e.constructor;
        if (void 0 === t || "function" != typeof t) return !0;
        let n = t.prototype;
        return !1 !== I(n) && !1 !== Object.prototype.hasOwnProperty.call(n, "isPrototypeOf")
    }

    function w(e) {
        return S(e) ? {
            ...e
        } : Array.isArray(e) ? [...e] : e instanceof Map ? new Map(e) : e instanceof Set ? new Set(e) : e
    }
    let z = new Set(["string", "number", "symbol"]),
        Z = new Set(["string", "number", "bigint", "boolean", "symbol", "undefined"]);

    function U(e) {
        return e.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
    }

    function O(e, t, n) {
        let i = new e._zod.constr(null != t ? t : e._zod.def);
        return (!t || (null == n ? void 0 : n.parent)) && (i._zod.parent = e), i
    }

    function j(e) {
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

    function D(e) {
        return "bigint" == typeof e ? e.toString() + "n" : "string" == typeof e ? '"'.concat(e, '"') : "".concat(e)
    }

    function P(e) {
        return Object.keys(e).filter(t => "optional" === e[t]._zod.optin && "optional" === e[t]._zod.optout)
    }
    let $ = {
            safeint: [Number.MIN_SAFE_INTEGER, Number.MAX_SAFE_INTEGER],
            int32: [-0x80000000, 0x7fffffff],
            uint32: [0, 0xffffffff],
            float32: [-34028234663852886e22, 34028234663852886e22],
            float64: [-Number.MAX_VALUE, Number.MAX_VALUE]
        },
        N = {
            int64: [BigInt("-9223372036854775808"), BigInt("9223372036854775807")],
            uint64: [BigInt(0), BigInt("18446744073709551615")]
        };

    function E(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
        if (!0 === e.aborted) return !0;
        for (let i = t; i < e.issues.length; i++) {
            var n;
            if ((null == (n = e.issues[i]) ? void 0 : n.continue) !== !0) return !0
        }
        return !1
    }

    function T(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
        if (!0 === e.aborted) return !0;
        for (let i = t; i < e.issues.length; i++) {
            var n;
            if ((null == (n = e.issues[i]) ? void 0 : n.continue) === !1) return !0
        }
        return !1
    }

    function A(e, t) {
        return t.map(t => (null != t.path || (t.path = []), t.path.unshift(e), t))
    }

    function L(e) {
        return "string" == typeof e ? e : null == e ? void 0 : e.message
    }

    function C(e, t, n) {
        var i, r, a, o, c, u, l, s, d, m;
        let f = e.message ? e.message : null != (i = null != (r = null != (a = null != (o = L(null == (l = e.inst) || null == (u = l._zod.def) || null == (c = u.error) ? void 0 : c.call(u, e))) ? o : L(null == t || null == (s = t.error) ? void 0 : s.call(t, e))) ? a : L(null == (d = n.customError) ? void 0 : d.call(n, e))) ? r : L(null == (m = n.localeError) ? void 0 : m.call(n, e))) ? i : "Invalid input",
            {
                inst: v,
                continue: p,
                input: g,
                ...h
            } = e;
        return null != h.path || (h.path = []), h.message = f, (null == t ? void 0 : t.reportInput) && (h.input = g), h
    }

    function J(e) {
        return e instanceof Set ? "set" : e instanceof Map ? "map" : e instanceof File ? "file" : "unknown"
    }

    function R(e) {
        return Array.isArray(e) ? "array" : "string" == typeof e ? "string" : "unknown"
    }

    function F(e) {
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

    function M() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        let [i, r, a] = t;
        return "string" == typeof i ? {
            message: i,
            code: "custom",
            input: r,
            inst: a
        } : {
            ...i
        }
    }

    function W(e) {
        let t = atob(e),
            n = new Uint8Array(t.length);
        for (let e = 0; e < t.length; e++) n[e] = t.charCodeAt(e);
        return n
    }

    function G(e) {
        let t = "";
        for (let n = 0; n < e.length; n++) t += String.fromCharCode(e[n]);
        return btoa(t)
    }
    e.s(["BIGINT_FORMAT_RANGES", 0, N, "Class", 0, class {
        constructor(...e) {}
    }, "NUMBER_FORMAT_RANGES", 0, $, "aborted", 0, E, "allowsEval", 0, x, "assert", 0, function(e) {}, "assertEqual", 0, function(e) {
        return e
    }, "assertIs", 0, function(e) {}, "assertNever", 0, function(e) {
        throw Error("Unexpected value in exhaustive check")
    }, "assertNotEqual", 0, function(e) {
        return e
    }, "assignProp", 0, h, "base64ToUint8Array", 0, W, "base64urlToUint8Array", 0, function(e) {
        let t = e.replace(/-/g, "+").replace(/_/g, "/"),
            n = "=".repeat((4 - t.length % 4) % 4);
        return W(t + n)
    }, "cached", 0, d, "captureStackTrace", 0, k, "cleanEnum", 0, function(e) {
        return Object.entries(e).filter(e => {
            let [t, n] = e;
            return Number.isNaN(Number.parseInt(t, 10))
        }).map(e => e[1])
    }, "cleanRegex", 0, f, "clone", 0, O, "cloneDef", 0, function(e) {
        return _(e._zod.def)
    }, "createTransparentProxy", 0, function(e) {
        let t;
        return new Proxy({}, {
            get: (n, i, r) => (null != t || (t = e()), Reflect.get(t, i, r)),
            set: (n, i, r, a) => (null != t || (t = e()), Reflect.set(t, i, r, a)),
            has: (n, i) => (null != t || (t = e()), Reflect.has(t, i)),
            deleteProperty: (n, i) => (null != t || (t = e()), Reflect.deleteProperty(t, i)),
            ownKeys: n => (null != t || (t = e()), Reflect.ownKeys(t)),
            getOwnPropertyDescriptor: (n, i) => (null != t || (t = e()), Reflect.getOwnPropertyDescriptor(t, i)),
            defineProperty: (n, i, r) => (null != t || (t = e()), Reflect.defineProperty(t, i, r))
        })
    }, "defineLazy", 0, g, "esc", 0, y, "escapeRegex", 0, U, "explicitlyAborted", 0, T, "extend", 0, function(e, t) {
        if (!S(t)) throw Error("Invalid input to extend: expected a plain object");
        let n = e._zod.def.checks;
        if (n && n.length > 0) {
            let n = e._zod.def.shape;
            for (let e in t)
                if (void 0 !== Object.getOwnPropertyDescriptor(n, e)) throw Error("Cannot overwrite keys on object schemas containing refinements. Use `.safeExtend()` instead.")
        }
        let i = _(e._zod.def, {
            get shape() {
                let n = {
                    ...e._zod.def.shape,
                    ...t
                };
                return h(this, "shape", n), n
            }
        });
        return O(e, i)
    }, "finalizeIssue", 0, C, "floatSafeRemainder", 0, v, "getElementAtPath", 0, function(e, t) {
        return t ? t.reduce((e, t) => null == e ? void 0 : e[t], e) : e
    }, "getEnumValues", 0, u, "getLengthableOrigin", 0, R, "getParsedType", 0, e => {
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
    }, "getSizableOrigin", 0, J, "hexToUint8Array", 0, function(e) {
        let t = e.replace(/^0x/, "");
        if (t.length % 2 != 0) throw Error("Invalid hex string length");
        let n = new Uint8Array(t.length / 2);
        for (let e = 0; e < t.length; e += 2) n[e / 2] = Number.parseInt(t.slice(e, e + 2), 16);
        return n
    }, "isObject", 0, I, "isPlainObject", 0, S, "issue", 0, M, "joinValues", 0, l, "jsonStringifyReplacer", 0, s, "merge", 0, function(e, t) {
        var n, i;
        if (null == (i = e._zod.def.checks) ? void 0 : i.length) throw Error(".merge() cannot be used on object schemas containing refinements. Use .safeExtend() instead.");
        let r = _(e._zod.def, {
            get shape() {
                let n = {
                    ...e._zod.def.shape,
                    ...t._zod.def.shape
                };
                return h(this, "shape", n), n
            },
            get catchall() {
                return t._zod.def.catchall
            },
            checks: null != (n = t._zod.def.checks) ? n : []
        });
        return O(e, r)
    }, "mergeDefs", 0, _, "normalizeParams", 0, j, "nullish", 0, m, "numKeys", 0, function(e) {
        let t = 0;
        for (let n in e) Object.prototype.hasOwnProperty.call(e, n) && t++;
        return t
    }, "objectClone", 0, function(e) {
        return Object.create(Object.getPrototypeOf(e), Object.getOwnPropertyDescriptors(e))
    }, "omit", 0, function(e, t) {
        let n = e._zod.def,
            i = n.checks;
        if (i && i.length > 0) throw Error(".omit() cannot be used on object schemas containing refinements");
        let r = _(e._zod.def, {
            get shape() {
                let i = {
                    ...e._zod.def.shape
                };
                for (let e in t) {
                    if (!(e in n.shape)) throw Error('Unrecognized key: "'.concat(e, '"'));
                    t[e] && delete i[e]
                }
                return h(this, "shape", i), i
            },
            checks: []
        });
        return O(e, r)
    }, "optionalKeys", 0, P, "parsedType", 0, F, "partial", 0, function(e, t, n) {
        let i = t._zod.def.checks;
        if (i && i.length > 0) throw Error(".partial() cannot be used on object schemas containing refinements");
        let r = _(t._zod.def, {
            get shape() {
                let i = t._zod.def.shape,
                    r = {
                        ...i
                    };
                if (n)
                    for (let t in n) {
                        if (!(t in i)) throw Error('Unrecognized key: "'.concat(t, '"'));
                        n[t] && (r[t] = e ? new e({
                            type: "optional",
                            innerType: i[t]
                        }) : i[t])
                    } else
                        for (let t in i) r[t] = e ? new e({
                            type: "optional",
                            innerType: i[t]
                        }) : i[t];
                return h(this, "shape", r), r
            },
            checks: []
        });
        return O(t, r)
    }, "pick", 0, function(e, t) {
        let n = e._zod.def,
            i = n.checks;
        if (i && i.length > 0) throw Error(".pick() cannot be used on object schemas containing refinements");
        let r = _(e._zod.def, {
            get shape() {
                let e = {};
                for (let i in t) {
                    if (!(i in n.shape)) throw Error('Unrecognized key: "'.concat(i, '"'));
                    t[i] && (e[i] = n.shape[i])
                }
                return h(this, "shape", e), e
            },
            checks: []
        });
        return O(e, r)
    }, "prefixIssues", 0, A, "primitiveTypes", 0, Z, "promiseAllObject", 0, function(e) {
        let t = Object.keys(e);
        return Promise.all(t.map(t => e[t])).then(e => {
            let n = {};
            for (let i = 0; i < t.length; i++) n[t[i]] = e[i];
            return n
        })
    }, "propertyKeyTypes", 0, z, "randomString", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 10,
            t = "abcdefghijklmnopqrstuvwxyz",
            n = "";
        for (let i = 0; i < e; i++) n += t[Math.floor(Math.random() * t.length)];
        return n
    }, "required", 0, function(e, t, n) {
        let i = _(t._zod.def, {
            get shape() {
                let i = t._zod.def.shape,
                    r = {
                        ...i
                    };
                if (n)
                    for (let t in n) {
                        if (!(t in r)) throw Error('Unrecognized key: "'.concat(t, '"'));
                        n[t] && (r[t] = new e({
                            type: "nonoptional",
                            innerType: i[t]
                        }))
                    } else
                        for (let t in i) r[t] = new e({
                            type: "nonoptional",
                            innerType: i[t]
                        });
                return h(this, "shape", r), r
            }
        });
        return O(t, i)
    }, "safeExtend", 0, function(e, t) {
        if (!S(t)) throw Error("Invalid input to safeExtend: expected a plain object");
        let n = _(e._zod.def, {
            get shape() {
                let n = {
                    ...e._zod.def.shape,
                    ...t
                };
                return h(this, "shape", n), n
            }
        });
        return O(e, n)
    }, "shallowClone", 0, w, "slugify", 0, b, "stringifyPrimitive", 0, D, "uint8ArrayToBase64", 0, G, "uint8ArrayToBase64url", 0, function(e) {
        return G(e).replace(/\+/g, "-").replace(/\//g, "_").replace(/=/g, "")
    }, "uint8ArrayToHex", 0, function(e) {
        return Array.from(e).map(e => e.toString(16).padStart(2, "0")).join("")
    }, "unwrapMessage", 0, L], 286840);
    var K, B, V, X = e.i(286840);
    let q = /^[cC][0-9a-z]{6,}$/,
        Y = /^[0-9a-z]+$/,
        H = /^[0-9A-HJKMNP-TV-Za-hjkmnp-tv-z]{26}$/,
        Q = /^[0-9a-vA-V]{20}$/,
        ee = /^[A-Za-z0-9]{27}$/,
        et = /^[a-zA-Z0-9_-]{21}$/,
        en = /^P(?:(\d+W)|(?!.*W)(?=\d|T\d)(\d+Y)?(\d+M)?(\d+D)?(T(?=\d)(\d+H)?(\d+M)?(\d+([.,]\d+)?S)?)?)$/,
        ei = /^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})$/,
        er = e => e ? new RegExp("^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-".concat(e, "[0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12})$")) : /^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-8][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}|00000000-0000-0000-0000-000000000000|ffffffff-ffff-ffff-ffff-ffffffffffff)$/,
        ea = er(4),
        eo = er(6),
        ec = er(7),
        eu = /^(?!\.)(?!.*\.\.)([A-Za-z0-9_'+\-\.]*)[A-Za-z0-9_+-]@([A-Za-z0-9][A-Za-z0-9\-]*\.)+[A-Za-z]{2,}$/,
        el = /^[^\s@"]{1,64}@[^\s@]{1,255}$/u;

    function es() {
        return RegExp("^(\\p{Extended_Pictographic}|\\p{Emoji_Component})+$", "u")
    }
    let ed = /^(?:(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])$/,
        em = /^(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))$/,
        ef = e => {
            let t = U(null != e ? e : ":");
            return new RegExp("^(?:[0-9A-F]{2}".concat(t, "){5}[0-9A-F]{2}$|^(?:[0-9a-f]{2}").concat(t, "){5}[0-9a-f]{2}$"))
        },
        ev = /^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\/([0-9]|[1-2][0-9]|3[0-2])$/,
        ep = /^(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|::|([0-9a-fA-F]{1,4})?::([0-9a-fA-F]{1,4}:?){0,6})\/(12[0-8]|1[01][0-9]|[1-9]?[0-9])$/,
        eg = /^$|^(?:[0-9a-zA-Z+/]{4})*(?:(?:[0-9a-zA-Z+/]{2}==)|(?:[0-9a-zA-Z+/]{3}=))?$/,
        eh = /^[A-Za-z0-9_-]*$/,
        e_ = /^https?$/,
        ey = /^\+[1-9]\d{6,14}$/,
        eb = "(?:(?:\\d\\d[2468][048]|\\d\\d[13579][26]|\\d\\d0[48]|[02468][048]00|[13579][26]00)-02-29|\\d{4}-(?:(?:0[13578]|1[02])-(?:0[1-9]|[12]\\d|3[01])|(?:0[469]|11)-(?:0[1-9]|[12]\\d|30)|(?:02)-(?:0[1-9]|1\\d|2[0-8])))",
        ek = new RegExp("^".concat(eb, "$"));

    function eI(e) {
        let t = "(?:[01]\\d|2[0-3]):[0-5]\\d";
        return "number" == typeof e.precision ? -1 === e.precision ? "".concat(t) : 0 === e.precision ? "".concat(t, ":[0-5]\\d") : "".concat(t, ":[0-5]\\d\\.\\d{").concat(e.precision, "}") : "".concat(t, "(?::[0-5]\\d(?:\\.\\d+)?)?")
    }

    function ex(e) {
        return new RegExp("^".concat(eI(e), "$"))
    }

    function eS(e) {
        let t = eI({
                precision: e.precision
            }),
            n = ["Z"];
        e.local && n.push(""), e.offset && n.push("([+-](?:[01]\\d|2[0-3]):[0-5]\\d)");
        let i = "".concat(t, "(?:").concat(n.join("|"), ")");
        return new RegExp("^".concat(eb, "T(?:").concat(i, ")$"))
    }
    let ew = e => {
            var t, n;
            let i = e ? "[\\s\\S]{".concat(null != (t = null == e ? void 0 : e.minimum) ? t : 0, ",").concat(null != (n = null == e ? void 0 : e.maximum) ? n : "", "}") : "[\\s\\S]*";
            return new RegExp("^".concat(i, "$"))
        },
        ez = /^-?\d+n?$/,
        eZ = /^-?\d+$/,
        eU = /^-?\d+(?:\.\d+)?$/,
        eO = /^(?:true|false)$/i,
        ej = /^null$/i,
        eD = /^undefined$/i,
        eP = /^[^A-Z]*$/,
        e$ = /^[^a-z]*$/;

    function eN(e, t) {
        return new RegExp("^[A-Za-z0-9+/]{".concat(e, "}").concat(t, "$"))
    }

    function eE(e) {
        return new RegExp("^[A-Za-z0-9_-]{".concat(e, "}$"))
    }
    let eT = eN(22, "=="),
        eA = eE(22),
        eL = eN(27, "="),
        eC = eE(27),
        eJ = eN(43, "="),
        eR = eE(43),
        eF = eN(64, ""),
        eM = eE(64),
        eW = eN(86, "=="),
        eG = eE(86);
    e.s(["base64", 0, eg, "base64url", 0, eh, "bigint", 0, ez, "boolean", 0, eO, "browserEmail", 0, /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/, "cidrv4", 0, ev, "cidrv6", 0, ep, "cuid", 0, q, "cuid2", 0, Y, "date", 0, ek, "datetime", 0, eS, "domain", 0, /^([a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,}$/, "duration", 0, en, "e164", 0, ey, "email", 0, eu, "emoji", 0, es, "extendedDuration", 0, /^[-+]?P(?!$)(?:(?:[-+]?\d+Y)|(?:[-+]?\d+[.,]\d+Y$))?(?:(?:[-+]?\d+M)|(?:[-+]?\d+[.,]\d+M$))?(?:(?:[-+]?\d+W)|(?:[-+]?\d+[.,]\d+W$))?(?:(?:[-+]?\d+D)|(?:[-+]?\d+[.,]\d+D$))?(?:T(?=[\d+-])(?:(?:[-+]?\d+H)|(?:[-+]?\d+[.,]\d+H$))?(?:(?:[-+]?\d+M)|(?:[-+]?\d+[.,]\d+M$))?(?:[-+]?\d+(?:[.,]\d+)?S)?)??$/, "guid", 0, ei, "hex", 0, /^[0-9a-fA-F]*$/, "hostname", 0, /^(?=.{1,253}\.?$)[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[-0-9a-zA-Z]{0,61}[0-9a-zA-Z])?)*\.?$/, "html5Email", 0, /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/, "httpProtocol", 0, e_, "idnEmail", 0, el, "integer", 0, eZ, "ipv4", 0, ed, "ipv6", 0, em, "ksuid", 0, ee, "lowercase", 0, eP, "mac", 0, ef, "md5_base64", 0, eT, "md5_base64url", 0, eA, "md5_hex", 0, /^[0-9a-fA-F]{32}$/, "nanoid", 0, et, "null", 0, ej, "number", 0, eU, "rfc5322Email", 0, /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/, "sha1_base64", 0, eL, "sha1_base64url", 0, eC, "sha1_hex", 0, /^[0-9a-fA-F]{40}$/, "sha256_base64", 0, eJ, "sha256_base64url", 0, eR, "sha256_hex", 0, /^[0-9a-fA-F]{64}$/, "sha384_base64", 0, eF, "sha384_base64url", 0, eM, "sha384_hex", 0, /^[0-9a-fA-F]{96}$/, "sha512_base64", 0, eW, "sha512_base64url", 0, eG, "sha512_hex", 0, /^[0-9a-fA-F]{128}$/, "string", 0, ew, "time", 0, ex, "ulid", 0, H, "undefined", 0, eD, "unicodeEmail", 0, el, "uppercase", 0, e$, "uuid", 0, er, "uuid4", 0, ea, "uuid6", 0, eo, "uuid7", 0, ec, "xid", 0, Q], 699214);
    var eK = e.i(699214);

    function eB(e, t, n, i) {
        let r = Math.abs(e),
            a = r % 10,
            o = r % 100;
        return o >= 11 && o <= 19 ? i : 1 === a ? t : a >= 2 && a <= 4 ? n : i
    }

    function eV() {
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
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    i = {
                        nan: "NaN"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            return "Invalid input: expected ".concat(t, ", received ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Invalid input: expected ".concat(D(e.values[0]));
                            return "Invalid option: expected one of ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Too big: expected ".concat(null != (o = e.origin) ? o : "value", " to have ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "elements");
                            return "Too big: expected ".concat(null != (u = e.origin) ? u : "value", " to be ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Too small: expected ".concat(e.origin, " to have ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "Too small: expected ".concat(e.origin, " to be ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Invalid string: must start with "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Invalid string: must end with "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Invalid string: must include "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Invalid string: must match pattern ".concat(e.pattern);
                            return "Invalid ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "Invalid number: must be a multiple of ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Unrecognized key".concat(e.keys.length > 1 ? "s" : "", ": ").concat(l(e.keys, ", "));
                        case "invalid_key":
                            return "Invalid key in ".concat(e.origin);
                        case "invalid_union":
                            if (e.options && Array.isArray(e.options) && e.options.length > 0) {
                                let t = e.options.map(e => "'".concat(e, "'")).join(" | ");
                                return "Invalid discriminator value. Expected ".concat(t)
                            }
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

    function eX(e, t, n) {
        return 1 === Math.abs(e) ? t : n
    }

    function eq(e) {
        if (!e) return "";
        let t = e[e.length - 1];
        return e + (["ա", "ե", "ը", "ի", "ո", "ու", "օ"].includes(t) ? "ն" : "ը")
    }

    function eY() {
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
                        cidrv4: "ដែនអាសយដ្ឋាន IPv4",
                        cidrv6: "ដែនអាសយដ្ឋាន IPv6",
                        base64: "ខ្សែអក្សរអ៊ិកូដ base64",
                        base64url: "ខ្សែអក្សរអ៊ិកូដ base64url",
                        json_string: "ខ្សែអក្សរ JSON",
                        e164: "លេខ E.164",
                        jwt: "JWT",
                        template_literal: "ទិន្នន័យបញ្ចូល"
                    },
                    i = {
                        nan: "NaN",
                        number: "លេខ",
                        array: "អារេ (Array)",
                        null: "គ្មានតម្លៃ (null)"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "ទិន្នន័យបញ្ចូលមិនត្រឹមត្រូវ៖ ត្រូវការ instanceof ".concat(e.expected, " ប៉ុន្តែទទួលបាន ").concat(o);
                            return "ទិន្នន័យបញ្ចូលមិនត្រឹមត្រូវ៖ ត្រូវការ ".concat(t, " ប៉ុន្តែទទួលបាន ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "ទិន្នន័យបញ្ចូលមិនត្រឹមត្រូវ៖ ត្រូវការ ".concat(D(e.values[0]));
                            return "ជម្រើសមិនត្រឹមត្រូវ៖ ត្រូវជាមួយក្នុងចំណោម ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "ធំពេក៖ ត្រូវការ ".concat(null != (o = e.origin) ? o : "តម្លៃ", " ").concat(n, " ").concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "ធាតុ");
                            return "ធំពេក៖ ត្រូវការ ".concat(null != (u = e.origin) ? u : "តម្លៃ", " ").concat(n, " ").concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "តូចពេក៖ ត្រូវការ ".concat(e.origin, " ").concat(n, " ").concat(e.minimum.toString(), " ").concat(i.unit);
                            return "តូចពេក៖ ត្រូវការ ".concat(e.origin, " ").concat(n, " ").concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'ខ្សែអក្សរមិនត្រឹមត្រូវ៖ ត្រូវចាប់ផ្តើមដោយ "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'ខ្សែអក្សរមិនត្រឹមត្រូវ៖ ត្រូវបញ្ចប់ដោយ "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'ខ្សែអក្សរមិនត្រឹមត្រូវ៖ ត្រូវមាន "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "ខ្សែអក្សរមិនត្រឹមត្រូវ៖ ត្រូវតែផ្គូផ្គងនឹងទម្រង់ដែលបានកំណត់ ".concat(e.pattern);
                            return "មិនត្រឹមត្រូវ៖ ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "លេខមិនត្រឹមត្រូវ៖ ត្រូវតែជាពហុគុណនៃ ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "រកឃើញសោមិនស្គាល់៖ ".concat(l(e.keys, ", "));
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
    e.s([], 660024), e.i(660024);
    let eH = e => e.charAt(0).toUpperCase() + e.slice(1);

    function eQ(e) {
        let t = Math.abs(e),
            n = t % 10,
            i = t % 100;
        return i >= 11 && i <= 19 || 0 === n ? "many" : 1 === n ? "one" : "few"
    }

    function e0(e, t, n, i) {
        let r = Math.abs(e),
            a = r % 10,
            o = r % 100;
        return o >= 11 && o <= 19 ? i : 1 === a ? t : a >= 2 && a <= 4 ? n : i
    }

    function e4() {
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
                        cidrv4: "діапазон IPv4",
                        cidrv6: "діапазон IPv6",
                        base64: "рядок у кодуванні base64",
                        base64url: "рядок у кодуванні base64url",
                        json_string: "рядок JSON",
                        e164: "номер E.164",
                        jwt: "JWT",
                        template_literal: "вхідні дані"
                    },
                    i = {
                        nan: "NaN",
                        number: "число",
                        array: "масив"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Неправильні вхідні дані: очікується instanceof ".concat(e.expected, ", отримано ").concat(o);
                            return "Неправильні вхідні дані: очікується ".concat(t, ", отримано ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Неправильні вхідні дані: очікується ".concat(D(e.values[0]));
                            return "Неправильна опція: очікується одне з ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Занадто велике: очікується, що ".concat(null != (o = e.origin) ? o : "значення", " ").concat(i.verb, " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "елементів");
                            return "Занадто велике: очікується, що ".concat(null != (u = e.origin) ? u : "значення", " буде ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Занадто мале: очікується, що ".concat(e.origin, " ").concat(i.verb, " ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "Занадто мале: очікується, що ".concat(e.origin, " буде ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Неправильний рядок: повинен починатися з "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Неправильний рядок: повинен закінчуватися на "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Неправильний рядок: повинен містити "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Неправильний рядок: повинен відповідати шаблону ".concat(e.pattern);
                            return "Неправильний ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "Неправильне число: повинно бути кратним ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Нерозпізнаний ключ".concat(e.keys.length > 1 ? "і" : "", ": ").concat(l(e.keys, ", "));
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
                        cidrv4: "مدى عناوين بصيغة IPv4",
                        cidrv6: "مدى عناوين بصيغة IPv6",
                        base64: "نَص بترميز base64-encoded",
                        base64url: "نَص بترميز base64url-encoded",
                        json_string: "نَص على هيئة JSON",
                        e164: "رقم هاتف بمعيار E.164",
                        jwt: "JWT",
                        template_literal: "مدخل"
                    },
                    i = {
                        nan: "NaN"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "مدخلات غير مقبولة: يفترض إدخال instanceof ".concat(e.expected, "، ولكن تم إدخال ").concat(o);
                            return "مدخلات غير مقبولة: يفترض إدخال ".concat(t, "، ولكن تم إدخال ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "مدخلات غير مقبولة: يفترض إدخال ".concat(D(e.values[0]));
                            return "اختيار غير مقبول: يتوقع انتقاء أحد هذه الخيارات: ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return " أكبر من اللازم: يفترض أن تكون ".concat(null != (o = e.origin) ? o : "القيمة", " ").concat(n, " ").concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "عنصر");
                            return "أكبر من اللازم: يفترض أن تكون ".concat(null != (u = e.origin) ? u : "القيمة", " ").concat(n, " ").concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "أصغر من اللازم: يفترض لـ ".concat(e.origin, " أن يكون ").concat(n, " ").concat(e.minimum.toString(), " ").concat(i.unit);
                            return "أصغر من اللازم: يفترض لـ ".concat(e.origin, " أن يكون ").concat(n, " ").concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'نَص غير مقبول: يجب أن يبدأ بـ "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'نَص غير مقبول: يجب أن ينتهي بـ "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'نَص غير مقبول: يجب أن يتضمَّن "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "نَص غير مقبول: يجب أن يطابق النمط ".concat(e.pattern);
                            return "".concat(null != (s = n[e.format]) ? s : e.format, " غير مقبول");
                        case "not_multiple_of":
                            return "رقم غير مقبول: يجب أن يكون من مضاعفات ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "معرف".concat(e.keys.length > 1 ? "ات" : "", " غريب").concat(e.keys.length > 1 ? "ة" : "", ": ").concat(l(e.keys, "، "));
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
                        cidrv4: "IPv4 range",
                        cidrv6: "IPv6 range",
                        base64: "base64-encoded string",
                        base64url: "base64url-encoded string",
                        json_string: "JSON string",
                        e164: "E.164 number",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    i = {
                        nan: "NaN"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Yanlış dəyər: gözlənilən instanceof ".concat(e.expected, ", daxil olan ").concat(o);
                            return "Yanlış dəyər: gözlənilən ".concat(t, ", daxil olan ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Yanlış dəyər: gözlənilən ".concat(D(e.values[0]));
                            return "Yanlış seçim: aşağıdakılardan biri olmalıdır: ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Çox böyük: gözlənilən ".concat(null != (o = e.origin) ? o : "dəyər", " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "element");
                            return "Çox böyük: gözlənilən ".concat(null != (u = e.origin) ? u : "dəyər", " ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Çox kiçik: gözlənilən ".concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "Çox kiçik: gözlənilən ".concat(e.origin, " ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Yanlış mətn: "'.concat(e.prefix, '" ilə başlamalıdır');
                            if ("ends_with" === e.format) return 'Yanlış mətn: "'.concat(e.suffix, '" ilə bitməlidir');
                            if ("includes" === e.format) return 'Yanlış mətn: "'.concat(e.includes, '" daxil olmalıdır');
                            if ("regex" === e.format) return "Yanlış mətn: ".concat(e.pattern, " şablonuna uyğun olmalıdır");
                            return "Yanlış ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "Yanlış ədəd: ".concat(e.divisor, " ilə bölünə bilən olmalıdır");
                        case "unrecognized_keys":
                            return "Tanınmayan açar".concat(e.keys.length > 1 ? "lar" : "", ": ").concat(l(e.keys, ", "));
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
                        cidrv4: "IPv4 дыяпазон",
                        cidrv6: "IPv6 дыяпазон",
                        base64: "радок у фармаце base64",
                        base64url: "радок у фармаце base64url",
                        json_string: "JSON радок",
                        e164: "нумар E.164",
                        jwt: "JWT",
                        template_literal: "увод"
                    },
                    i = {
                        nan: "NaN",
                        number: "лік",
                        array: "масіў"
                    };
                return e => {
                    var r, a, o, c, u;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Няправільны ўвод: чакаўся instanceof ".concat(e.expected, ", атрымана ").concat(o);
                            return "Няправільны ўвод: чакаўся ".concat(t, ", атрымана ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Няправільны ўвод: чакалася ".concat(D(e.values[0]));
                            return "Няправільны варыянт: чакаўся адзін з ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) {
                                let t = eB(Number(e.maximum), i.unit.one, i.unit.few, i.unit.many);
                                return "Занадта вялікі: чакалася, што ".concat(null != (c = e.origin) ? c : "значэнне", " павінна ").concat(i.verb, " ").concat(n).concat(e.maximum.toString(), " ").concat(t)
                            }
                            return "Занадта вялікі: чакалася, што ".concat(null != (o = e.origin) ? o : "значэнне", " павінна быць ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) {
                                let t = eB(Number(e.minimum), i.unit.one, i.unit.few, i.unit.many);
                                return "Занадта малы: чакалася, што ".concat(e.origin, " павінна ").concat(i.verb, " ").concat(n).concat(e.minimum.toString(), " ").concat(t)
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
                            return "Нераспазнаны ".concat(e.keys.length > 1 ? "ключы" : "ключ", ": ").concat(l(e.keys, ", "));
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
                        cidrv4: "IPv4 диапазон",
                        cidrv6: "IPv6 диапазон",
                        base64: "base64-кодиран низ",
                        base64url: "base64url-кодиран низ",
                        json_string: "JSON низ",
                        e164: "E.164 номер",
                        jwt: "JWT",
                        template_literal: "вход"
                    },
                    i = {
                        nan: "NaN",
                        number: "число",
                        array: "масив"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Невалиден вход: очакван instanceof ".concat(e.expected, ", получен ").concat(o);
                            return "Невалиден вход: очакван ".concat(t, ", получен ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Невалиден вход: очакван ".concat(D(e.values[0]));
                            return "Невалидна опция: очаквано едно от ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Твърде голямо: очаква се ".concat(null != (o = e.origin) ? o : "стойност", " да съдържа ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "елемента");
                            return "Твърде голямо: очаква се ".concat(null != (u = e.origin) ? u : "стойност", " да бъде ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Твърде малко: очаква се ".concat(e.origin, " да съдържа ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "Твърде малко: очаква се ".concat(e.origin, " да бъде ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format": {
                            if ("starts_with" === e.format) return 'Невалиден низ: трябва да започва с "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Невалиден низ: трябва да завършва с "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Невалиден низ: трябва да включва "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Невалиден низ: трябва да съвпада с ".concat(e.pattern);
                            let t = "Невалиден";
                            return "emoji" === e.format && (t = "Невалидно"), "datetime" === e.format && (t = "Невалидно"), "date" === e.format && (t = "Невалидна"), "time" === e.format && (t = "Невалидно"), "duration" === e.format && (t = "Невалидна"), "".concat(t, " ").concat(null != (s = n[e.format]) ? s : e.format)
                        }
                        case "not_multiple_of":
                            return "Невалидно число: трябва да бъде кратно на ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Неразпознат".concat(e.keys.length > 1 ? "и" : "", " ключ").concat(e.keys.length > 1 ? "ове" : "", ": ").concat(l(e.keys, ", "));
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
                        cidrv4: "rang IPv4",
                        cidrv6: "rang IPv6",
                        base64: "cadena codificada en base64",
                        base64url: "cadena codificada en base64url",
                        json_string: "cadena JSON",
                        e164: "número E.164",
                        jwt: "JWT",
                        template_literal: "entrada"
                    },
                    i = {
                        nan: "NaN"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Tipus invàlid: s'esperava instanceof ".concat(e.expected, ", s'ha rebut ").concat(o);
                            return "Tipus invàlid: s'esperava ".concat(t, ", s'ha rebut ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Valor invàlid: s'esperava ".concat(D(e.values[0]));
                            return "Opció invàlida: s'esperava una de ".concat(l(e.values, " o "));
                        case "too_big": {
                            let n = e.inclusive ? "com a màxim" : "menys de",
                                i = t(e.origin);
                            if (i) return "Massa gran: s'esperava que ".concat(null != (o = e.origin) ? o : "el valor", " contingués ").concat(n, " ").concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "elements");
                            return "Massa gran: s'esperava que ".concat(null != (u = e.origin) ? u : "el valor", " fos ").concat(n, " ").concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? "com a mínim" : "més de",
                                i = t(e.origin);
                            if (i) return "Massa petit: s'esperava que ".concat(e.origin, " contingués ").concat(n, " ").concat(e.minimum.toString(), " ").concat(i.unit);
                            return "Massa petit: s'esperava que ".concat(e.origin, " fos ").concat(n, " ").concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Format invàlid: ha de començar amb "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return "Format invàlid: ha d'acabar amb \"".concat(e.suffix, '"');
                            if ("includes" === e.format) return "Format invàlid: ha d'incloure \"".concat(e.includes, '"');
                            if ("regex" === e.format) return "Format invàlid: ha de coincidir amb el patró ".concat(e.pattern);
                            return "Format invàlid per a ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "Número invàlid: ha de ser múltiple de ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Clau".concat(e.keys.length > 1 ? "s" : "", " no reconeguda").concat(e.keys.length > 1 ? "s" : "", ": ").concat(l(e.keys, ", "));
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
                        cidrv4: "rozsah IPv4",
                        cidrv6: "rozsah IPv6",
                        base64: "řetězec zakódovaný ve formátu base64",
                        base64url: "řetězec zakódovaný ve formátu base64url",
                        json_string: "řetězec ve formátu JSON",
                        e164: "číslo E.164",
                        jwt: "JWT",
                        template_literal: "vstup"
                    },
                    i = {
                        nan: "NaN",
                        number: "číslo",
                        string: "řetězec",
                        function: "funkce",
                        array: "pole"
                    };
                return e => {
                    var r, a, o, c, u, s, d, m, f;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Neplatný vstup: očekáváno instanceof ".concat(e.expected, ", obdrženo ").concat(o);
                            return "Neplatný vstup: očekáváno ".concat(t, ", obdrženo ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Neplatný vstup: očekáváno ".concat(D(e.values[0]));
                            return "Neplatná možnost: očekávána jedna z hodnot ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Hodnota je příliš velká: ".concat(null != (c = e.origin) ? c : "hodnota", " musí mít ").concat(n).concat(e.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "prvků");
                            return "Hodnota je příliš velká: ".concat(null != (o = e.origin) ? o : "hodnota", " musí být ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Hodnota je příliš malá: ".concat(null != (d = e.origin) ? d : "hodnota", " musí mít ").concat(n).concat(e.minimum.toString(), " ").concat(null != (m = i.unit) ? m : "prvků");
                            return "Hodnota je příliš malá: ".concat(null != (s = e.origin) ? s : "hodnota", " musí být ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Neplatný řetězec: musí začínat na "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Neplatný řetězec: musí končit na "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Neplatný řetězec: musí obsahovat "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Neplatný řetězec: musí odpovídat vzoru ".concat(e.pattern);
                            return "Neplatný formát ".concat(null != (f = n[e.format]) ? f : e.format);
                        case "not_multiple_of":
                            return "Neplatné číslo: musí být násobkem ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Neznámé klíče: ".concat(l(e.keys, ", "));
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
                        ipv4: "IPv4-område",
                        ipv6: "IPv6-område",
                        cidrv4: "IPv4-spektrum",
                        cidrv6: "IPv6-spektrum",
                        base64: "base64-kodet streng",
                        base64url: "base64url-kodet streng",
                        json_string: "JSON-streng",
                        e164: "E.164-nummer",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    i = {
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
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Ugyldigt input: forventede instanceof ".concat(e.expected, ", fik ").concat(o);
                            return "Ugyldigt input: forventede ".concat(t, ", fik ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Ugyldig værdi: forventede ".concat(D(e.values[0]));
                            return "Ugyldigt valg: forventede en af følgende ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin),
                                a = null != (o = i[e.origin]) ? o : e.origin;
                            if (r) return "For stor: forventede ".concat(null != a ? a : "value", " ").concat(r.verb, " ").concat(n, " ").concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "elementer");
                            return "For stor: forventede ".concat(null != a ? a : "value", " havde ").concat(n, " ").concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin),
                                a = null != (u = i[e.origin]) ? u : e.origin;
                            if (r) return "For lille: forventede ".concat(a, " ").concat(r.verb, " ").concat(n, " ").concat(e.minimum.toString(), " ").concat(r.unit);
                            return "For lille: forventede ".concat(a, " havde ").concat(n, " ").concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Ugyldig streng: skal starte med "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Ugyldig streng: skal ende med "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Ugyldig streng: skal indeholde "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Ugyldig streng: skal matche mønsteret ".concat(e.pattern);
                            return "Ugyldig ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "Ugyldigt tal: skal være deleligt med ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "".concat(e.keys.length > 1 ? "Ukendte nøgler" : "Ukendt nøgle", ": ").concat(l(e.keys, ", "));
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
                        cidrv4: "IPv4-Bereich",
                        cidrv6: "IPv6-Bereich",
                        base64: "Base64-codierter String",
                        base64url: "Base64-URL-codierter String",
                        json_string: "JSON-String",
                        e164: "E.164-Nummer",
                        jwt: "JWT",
                        template_literal: "Eingabe"
                    },
                    i = {
                        nan: "NaN",
                        number: "Zahl",
                        array: "Array"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Ungültige Eingabe: erwartet instanceof ".concat(e.expected, ", erhalten ").concat(o);
                            return "Ungültige Eingabe: erwartet ".concat(t, ", erhalten ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Ungültige Eingabe: erwartet ".concat(D(e.values[0]));
                            return "Ungültige Option: erwartet eine von ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Zu groß: erwartet, dass ".concat(null != (o = e.origin) ? o : "Wert", " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "Elemente", " hat");
                            return "Zu groß: erwartet, dass ".concat(null != (u = e.origin) ? u : "Wert", " ").concat(n).concat(e.maximum.toString(), " ist")
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Zu klein: erwartet, dass ".concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit, " hat");
                            return "Zu klein: erwartet, dass ".concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " ist")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Ungültiger String: muss mit "'.concat(e.prefix, '" beginnen');
                            if ("ends_with" === e.format) return 'Ungültiger String: muss mit "'.concat(e.suffix, '" enden');
                            if ("includes" === e.format) return 'Ungültiger String: muss "'.concat(e.includes, '" enthalten');
                            if ("regex" === e.format) return "Ungültiger String: muss dem Muster ".concat(e.pattern, " entsprechen");
                            return "Ungültig: ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "Ungültige Zahl: muss ein Vielfaches von ".concat(e.divisor, " sein");
                        case "unrecognized_keys":
                            return "".concat(e.keys.length > 1 ? "Unbekannte Schlüssel" : "Unbekannter Schlüssel", ": ").concat(l(e.keys, ", "));
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
                        jwt: "JWT",
                        template_literal: "είσοδος"
                    },
                    i = {
                        nan: "NaN"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if ("string" == typeof e.expected && /^[A-Z]/.test(e.expected)) return "Μη έγκυρη είσοδος: αναμενόταν instanceof ".concat(e.expected, ", λήφθηκε ").concat(o);
                            return "Μη έγκυρη είσοδος: αναμενόταν ".concat(t, ", λήφθηκε ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Μη έγκυρη είσοδος: αναμενόταν ".concat(D(e.values[0]));
                            return "Μη έγκυρη επιλογή: αναμενόταν ένα από ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Πολύ μεγάλο: αναμενόταν ".concat(null != (o = e.origin) ? o : "τιμή", " να έχει ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "στοιχεία");
                            return "Πολύ μεγάλο: αναμενόταν ".concat(null != (u = e.origin) ? u : "τιμή", " να είναι ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Πολύ μικρό: αναμενόταν ".concat(e.origin, " να έχει ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "Πολύ μικρό: αναμενόταν ".concat(e.origin, " να είναι ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Μη έγκυρη συμβολοσειρά: πρέπει να ξεκινά με "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Μη έγκυρη συμβολοσειρά: πρέπει να τελειώνει με "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Μη έγκυρη συμβολοσειρά: πρέπει να περιέχει "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Μη έγκυρη συμβολοσειρά: πρέπει να ταιριάζει με το μοτίβο ".concat(e.pattern);
                            return "Μη έγκυρο: ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "Μη έγκυρος αριθμός: πρέπει να είναι πολλαπλάσιο του ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Άγνωστ".concat(e.keys.length > 1 ? "α" : "ο", " κλειδ").concat(e.keys.length > 1 ? "ιά" : "ί", ": ").concat(l(e.keys, ", "));
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
    }, "en", 0, eV, "eo", 0, function() {
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
                        cidrv4: "IPv4-rango",
                        cidrv6: "IPv6-rango",
                        base64: "64-ume kodita karaktraro",
                        base64url: "URL-64-ume kodita karaktraro",
                        json_string: "JSON-karaktraro",
                        e164: "E.164-nombro",
                        jwt: "JWT",
                        template_literal: "enigo"
                    },
                    i = {
                        nan: "NaN",
                        number: "nombro",
                        array: "tabelo",
                        null: "senvalora"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Nevalida enigo: atendiĝis instanceof ".concat(e.expected, ", riceviĝis ").concat(o);
                            return "Nevalida enigo: atendiĝis ".concat(t, ", riceviĝis ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Nevalida enigo: atendiĝis ".concat(D(e.values[0]));
                            return "Nevalida opcio: atendiĝis unu el ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Tro granda: atendiĝis ke ".concat(null != (o = e.origin) ? o : "valoro", " havu ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "elementojn");
                            return "Tro granda: atendiĝis ke ".concat(null != (u = e.origin) ? u : "valoro", " havu ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Tro malgranda: atendiĝis ke ".concat(e.origin, " havu ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "Tro malgranda: atendiĝis ke ".concat(e.origin, " estu ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Nevalida karaktraro: devas komenciĝi per "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Nevalida karaktraro: devas finiĝi per "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Nevalida karaktraro: devas inkluzivi "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Nevalida karaktraro: devas kongrui kun la modelo ".concat(e.pattern);
                            return "Nevalida ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "Nevalida nombro: devas esti oblo de ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Nekonata".concat(e.keys.length > 1 ? "j" : "", " ŝlosilo").concat(e.keys.length > 1 ? "j" : "", ": ").concat(l(e.keys, ", "));
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
                        cidrv4: "rango IPv4",
                        cidrv6: "rango IPv6",
                        base64: "cadena codificada en base64",
                        base64url: "URL codificada en base64",
                        json_string: "cadena JSON",
                        e164: "número E.164",
                        jwt: "JWT",
                        template_literal: "entrada"
                    },
                    i = {
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
                    var r, a, o, c, u, s, d, m;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Entrada inválida: se esperaba instanceof ".concat(e.expected, ", recibido ").concat(o);
                            return "Entrada inválida: se esperaba ".concat(t, ", recibido ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Entrada inválida: se esperaba ".concat(D(e.values[0]));
                            return "Opción inválida: se esperaba una de ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin),
                                a = null != (o = i[e.origin]) ? o : e.origin;
                            if (r) return "Demasiado grande: se esperaba que ".concat(null != a ? a : "valor", " tuviera ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "elementos");
                            return "Demasiado grande: se esperaba que ".concat(null != a ? a : "valor", " fuera ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin),
                                a = null != (u = i[e.origin]) ? u : e.origin;
                            if (r) return "Demasiado pequeño: se esperaba que ".concat(a, " tuviera ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Demasiado pequeño: se esperaba que ".concat(a, " fuera ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Cadena inválida: debe comenzar con "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Cadena inválida: debe terminar en "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Cadena inválida: debe incluir "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Cadena inválida: debe coincidir con el patrón ".concat(e.pattern);
                            return "Inválido ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "Número inválido: debe ser múltiplo de ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Llave".concat(e.keys.length > 1 ? "s" : "", " desconocida").concat(e.keys.length > 1 ? "s" : "", ": ").concat(l(e.keys, ", "));
                        case "invalid_key":
                            return "Llave inválida en ".concat(null != (d = i[e.origin]) ? d : e.origin);
                        case "invalid_union":
                        default:
                            return "Entrada inválida";
                        case "invalid_element":
                            return "Valor inválido en ".concat(null != (m = i[e.origin]) ? m : e.origin)
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
                        cidrv4: "IPv4 دامنه",
                        cidrv6: "IPv6 دامنه",
                        base64: "base64-encoded رشته",
                        base64url: "base64url-encoded رشته",
                        json_string: "JSON رشته",
                        e164: "E.164 عدد",
                        jwt: "JWT",
                        template_literal: "ورودی"
                    },
                    i = {
                        nan: "NaN",
                        number: "عدد",
                        array: "آرایه"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "ورودی نامعتبر: می‌بایست instanceof ".concat(e.expected, " می‌بود، ").concat(o, " دریافت شد");
                            return "ورودی نامعتبر: می‌بایست ".concat(t, " می‌بود، ").concat(o, " دریافت شد")
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "ورودی نامعتبر: می‌بایست ".concat(D(e.values[0]), " می‌بود");
                            return "گزینه نامعتبر: می‌بایست یکی از ".concat(l(e.values, "|"), " می‌بود");
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "خیلی بزرگ: ".concat(null != (c = e.origin) ? c : "مقدار", " باید ").concat(n).concat(e.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "عنصر", " باشد");
                            return "خیلی بزرگ: ".concat(null != (o = e.origin) ? o : "مقدار", " باید ").concat(n).concat(e.maximum.toString(), " باشد")
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "خیلی کوچک: ".concat(e.origin, " باید ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit, " باشد");
                            return "خیلی کوچک: ".concat(e.origin, " باید ").concat(n).concat(e.minimum.toString(), " باشد")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'رشته نامعتبر: باید با "'.concat(e.prefix, '" شروع شود');
                            if ("ends_with" === e.format) return 'رشته نامعتبر: باید با "'.concat(e.suffix, '" تمام شود');
                            if ("includes" === e.format) return 'رشته نامعتبر: باید شامل "'.concat(e.includes, '" باشد');
                            if ("regex" === e.format) return "رشته نامعتبر: باید با الگوی ".concat(e.pattern, " مطابقت داشته باشد");
                            return "".concat(null != (s = n[e.format]) ? s : e.format, " نامعتبر");
                        case "not_multiple_of":
                            return "عدد نامعتبر: باید مضرب ".concat(e.divisor, " باشد");
                        case "unrecognized_keys":
                            return "کلید".concat(e.keys.length > 1 ? "های" : "", " ناشناس: ").concat(l(e.keys, ", "));
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
                        cidrv4: "IPv4-alue",
                        cidrv6: "IPv6-alue",
                        base64: "base64-koodattu merkkijono",
                        base64url: "base64url-koodattu merkkijono",
                        json_string: "JSON-merkkijono",
                        e164: "E.164-luku",
                        jwt: "JWT",
                        template_literal: "templaattimerkkijono"
                    },
                    i = {
                        nan: "NaN"
                    };
                return e => {
                    var r, a, o;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Virheellinen tyyppi: odotettiin instanceof ".concat(e.expected, ", oli ").concat(o);
                            return "Virheellinen tyyppi: odotettiin ".concat(t, ", oli ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Virheellinen syöte: täytyy olla ".concat(D(e.values[0]));
                            return "Virheellinen valinta: täytyy olla yksi seuraavista: ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Liian suuri: ".concat(i.subject, " täytyy olla ").concat(n).concat(e.maximum.toString(), " ").concat(i.unit).trim();
                            return "Liian suuri: arvon täytyy olla ".concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Liian pieni: ".concat(i.subject, " täytyy olla ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit).trim();
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
                            return "".concat(e.keys.length > 1 ? "Tuntemattomat avaimet" : "Tuntematon avain", ": ").concat(l(e.keys, ", "));
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
                        regex: "entrée",
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
                        cidrv4: "plage IPv4",
                        cidrv6: "plage IPv6",
                        base64: "chaîne encodée en base64",
                        base64url: "chaîne encodée en base64url",
                        json_string: "chaîne JSON",
                        e164: "numéro E.164",
                        jwt: "JWT",
                        template_literal: "entrée"
                    },
                    i = {
                        string: "chaîne",
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
                        record: "enregistrement",
                        map: "carte",
                        set: "ensemble",
                        file: "fichier",
                        nonoptional: "non-optionnel",
                        nan: "NaN",
                        function: "fonction"
                    };
                return e => {
                    var r, a, o, c, u, s, d, m;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Entrée invalide : instanceof ".concat(e.expected, " attendu, ").concat(o, " reçu");
                            return "Entrée invalide : ".concat(t, " attendu, ").concat(o, " reçu")
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Entrée invalide : ".concat(D(e.values[0]), " attendu");
                            return "Option invalide : une valeur parmi ".concat(l(e.values, "|"), " attendue");
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin);
                            if (r) return "Trop grand : ".concat(null != (o = i[e.origin]) ? o : "valeur", " doit ").concat(r.verb, " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "élément(s)");
                            return "Trop grand : ".concat(null != (u = i[e.origin]) ? u : "valeur", " doit être ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin);
                            if (r) return "Trop petit : ".concat(null != (s = i[e.origin]) ? s : "valeur", " doit ").concat(r.verb, " ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Trop petit : ".concat(null != (d = i[e.origin]) ? d : "valeur", " doit être ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Chaîne invalide : doit commencer par "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Chaîne invalide : doit se terminer par "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Chaîne invalide : doit inclure "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Chaîne invalide : doit correspondre au modèle ".concat(e.pattern);
                            return "".concat(null != (m = n[e.format]) ? m : e.format, " invalide");
                        case "not_multiple_of":
                            return "Nombre invalide : doit être un multiple de ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Clé".concat(e.keys.length > 1 ? "s" : "", " non reconnue").concat(e.keys.length > 1 ? "s" : "", " : ").concat(l(e.keys, ", "));
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
                        cidrv4: "plage IPv4",
                        cidrv6: "plage IPv6",
                        base64: "chaîne encodée en base64",
                        base64url: "chaîne encodée en base64url",
                        json_string: "chaîne JSON",
                        e164: "numéro E.164",
                        jwt: "JWT",
                        template_literal: "entrée"
                    },
                    i = {
                        nan: "NaN"
                    };
                return e => {
                    var r, a, o, c, u;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Entrée invalide : attendu instanceof ".concat(e.expected, ", reçu ").concat(o);
                            return "Entrée invalide : attendu ".concat(t, ", reçu ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Entrée invalide : attendu ".concat(D(e.values[0]));
                            return "Option invalide : attendu l'une des valeurs suivantes ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "≤" : "<",
                                i = t(e.origin);
                            if (i) return "Trop grand : attendu que ".concat(null != (o = e.origin) ? o : "la valeur", " ait ").concat(n).concat(e.maximum.toString(), " ").concat(i.unit);
                            return "Trop grand : attendu que ".concat(null != (c = e.origin) ? c : "la valeur", " soit ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? "≥" : ">",
                                i = t(e.origin);
                            if (i) return "Trop petit : attendu que ".concat(e.origin, " ait ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
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
                            return "Clé".concat(e.keys.length > 1 ? "s" : "", " non reconnue").concat(e.keys.length > 1 ? "s" : "", " : ").concat(l(e.keys, ", "));
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
    }, "he", 0, function() {
        let e, t, n, i, r, a, o, c, u;
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
            }, n = t => t ? e[t] : void 0, i = t => {
                let i = n(t);
                return i ? i.label : null != t ? t : e.unknown.label
            }, r = e => "ה".concat(i(e)), a = e => {
                var t;
                let i = n(e);
                return "f" === (null != (t = null == i ? void 0 : i.gender) ? t : "m") ? "צריכה להיות" : "צריך להיות"
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
                jwt: {
                    label: "JWT",
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
                var n, s, d, m, f, v, p, g, h, _, y, b, k, I, x, S, w, z, Z, U, O;
                switch (t.code) {
                    case "invalid_type": {
                        let r = t.expected,
                            a = null != (n = u[null != r ? r : ""]) ? n : i(r),
                            o = F(t.input),
                            c = null != (s = null != (d = u[o]) ? d : null == (m = e[o]) ? void 0 : m.label) ? s : o;
                        if (/^[A-Z]/.test(t.expected)) return "קלט לא תקין: צריך להיות instanceof ".concat(t.expected, ", התקבל ").concat(c);
                        return "קלט לא תקין: צריך להיות ".concat(a, ", התקבל ").concat(c)
                    }
                    case "invalid_value": {
                        if (1 === t.values.length) return "ערך לא תקין: הערך חייב להיות ".concat(D(t.values[0]));
                        let e = t.values.map(e => D(e));
                        if (2 === t.values.length) return "ערך לא תקין: האפשרויות המתאימות הן ".concat(e[0], " או ").concat(e[1]);
                        let n = e[e.length - 1],
                            i = e.slice(0, -1).join(", ");
                        return "ערך לא תקין: האפשרויות המתאימות הן ".concat(i, " או ").concat(n)
                    }
                    case "too_big": {
                        let e = o(t.origin),
                            n = r(null != (f = t.origin) ? f : "value");
                        if ("string" === t.origin) return "".concat(null != (g = null == e ? void 0 : e.longLabel) ? g : "ארוך", " מדי: ").concat(n, " צריכה להכיל ").concat(t.maximum.toString(), " ").concat(null != (h = null == e ? void 0 : e.unit) ? h : "", " ").concat(t.inclusive ? "או פחות" : "לכל היותר").trim();
                        if ("number" === t.origin) {
                            let e = t.inclusive ? "קטן או שווה ל-".concat(t.maximum) : "קטן מ-".concat(t.maximum);
                            return "גדול מדי: ".concat(n, " צריך להיות ").concat(e)
                        }
                        if ("array" === t.origin || "set" === t.origin) {
                            let i = "set" === t.origin ? "צריכה" : "צריך",
                                r = t.inclusive ? "".concat(t.maximum, " ").concat(null != (_ = null == e ? void 0 : e.unit) ? _ : "", " או פחות") : "פחות מ-".concat(t.maximum, " ").concat(null != (y = null == e ? void 0 : e.unit) ? y : "");
                            return "גדול מדי: ".concat(n, " ").concat(i, " להכיל ").concat(r).trim()
                        }
                        let i = t.inclusive ? "<=" : "<",
                            c = a(null != (v = t.origin) ? v : "value");
                        if (null == e ? void 0 : e.unit) return "".concat(e.longLabel, " מדי: ").concat(n, " ").concat(c, " ").concat(i).concat(t.maximum.toString(), " ").concat(e.unit);
                        return "".concat(null != (p = null == e ? void 0 : e.longLabel) ? p : "גדול", " מדי: ").concat(n, " ").concat(c, " ").concat(i).concat(t.maximum.toString())
                    }
                    case "too_small": {
                        let e = o(t.origin),
                            n = r(null != (b = t.origin) ? b : "value");
                        if ("string" === t.origin) return "".concat(null != (x = null == e ? void 0 : e.shortLabel) ? x : "קצר", " מדי: ").concat(n, " צריכה להכיל ").concat(t.minimum.toString(), " ").concat(null != (S = null == e ? void 0 : e.unit) ? S : "", " ").concat(t.inclusive ? "או יותר" : "לפחות").trim();
                        if ("number" === t.origin) {
                            let e = t.inclusive ? "גדול או שווה ל-".concat(t.minimum) : "גדול מ-".concat(t.minimum);
                            return "קטן מדי: ".concat(n, " צריך להיות ").concat(e)
                        }
                        if ("array" === t.origin || "set" === t.origin) {
                            let i = "set" === t.origin ? "צריכה" : "צריך";
                            if (1 === t.minimum && t.inclusive) {
                                let e = (t.origin, "לפחות פריט אחד");
                                return "קטן מדי: ".concat(n, " ").concat(i, " להכיל ").concat(e)
                            }
                            let r = t.inclusive ? "".concat(t.minimum, " ").concat(null != (w = null == e ? void 0 : e.unit) ? w : "", " או יותר") : "יותר מ-".concat(t.minimum, " ").concat(null != (z = null == e ? void 0 : e.unit) ? z : "");
                            return "קטן מדי: ".concat(n, " ").concat(i, " להכיל ").concat(r).trim()
                        }
                        let i = t.inclusive ? ">=" : ">",
                            c = a(null != (k = t.origin) ? k : "value");
                        if (null == e ? void 0 : e.unit) return "".concat(e.shortLabel, " מדי: ").concat(n, " ").concat(c, " ").concat(i).concat(t.minimum.toString(), " ").concat(e.unit);
                        return "".concat(null != (I = null == e ? void 0 : e.shortLabel) ? I : "קטן", " מדי: ").concat(n, " ").concat(c, " ").concat(i).concat(t.minimum.toString())
                    }
                    case "invalid_format": {
                        if ("starts_with" === t.format) return 'המחרוזת חייבת להתחיל ב "'.concat(t.prefix, '"');
                        if ("ends_with" === t.format) return 'המחרוזת חייבת להסתיים ב "'.concat(t.suffix, '"');
                        if ("includes" === t.format) return 'המחרוזת חייבת לכלול "'.concat(t.includes, '"');
                        if ("regex" === t.format) return "המחרוזת חייבת להתאים לתבנית ".concat(t.pattern);
                        let e = c[t.format],
                            n = null != (Z = null == e ? void 0 : e.label) ? Z : t.format,
                            i = null != (U = null == e ? void 0 : e.gender) ? U : "m";
                        return "".concat(n, " לא ").concat("f" === i ? "תקינה" : "תקין")
                    }
                    case "not_multiple_of":
                        return "מספר לא תקין: חייב להיות מכפלה של ".concat(t.divisor);
                    case "unrecognized_keys":
                        return "מפתח".concat(t.keys.length > 1 ? "ות" : "", " לא מזוה").concat(t.keys.length > 1 ? "ים" : "ה", ": ").concat(l(t.keys, ", "));
                    case "invalid_key":
                        return "שדה לא תקין באובייקט";
                    case "invalid_union":
                    default:
                        return "קלט לא תקין";
                    case "invalid_element": {
                        let e = r(null != (O = t.origin) ? O : "array");
                        return "ערך לא תקין ב".concat(e)
                    }
                }
            })
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
                        cidrv4: "IPv4 raspon",
                        cidrv6: "IPv6 raspon",
                        base64: "base64 kodirani tekst",
                        base64url: "base64url kodirani tekst",
                        json_string: "JSON tekst",
                        e164: "E.164 broj",
                        jwt: "JWT",
                        template_literal: "unos"
                    },
                    i = {
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
                    var r, a, o, c, u, s, d, m;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Neispravan unos: očekuje se instanceof ".concat(e.expected, ", a primljeno je ").concat(o);
                            return "Neispravan unos: očekuje se ".concat(t, ", a primljeno je ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Neispravna vrijednost: očekivano ".concat(D(e.values[0]));
                            return "Neispravna opcija: očekivano jedno od ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                r = t(e.origin),
                                a = null != (o = i[e.origin]) ? o : e.origin;
                            if (r) return "Preveliko: očekivano da ".concat(null != a ? a : "vrijednost", " ima ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = r.unit) ? c : "elemenata");
                            return "Preveliko: očekivano da ".concat(null != a ? a : "vrijednost", " bude ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                r = t(e.origin),
                                a = null != (u = i[e.origin]) ? u : e.origin;
                            if (r) return "Premalo: očekivano da ".concat(a, " ima ").concat(n).concat(e.minimum.toString(), " ").concat(r.unit);
                            return "Premalo: očekivano da ".concat(a, " bude ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Neispravan tekst: mora započinjati s "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Neispravan tekst: mora završavati s "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Neispravan tekst: mora sadržavati "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Neispravan tekst: mora odgovarati uzorku ".concat(e.pattern);
                            return "Neispravna ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "Neispravan broj: mora biti višekratnik od ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Neprepoznat".concat(e.keys.length > 1 ? "i ključevi" : " ključ", ": ").concat(l(e.keys, ", "));
                        case "invalid_key":
                            return "Neispravan ključ u ".concat(null != (d = i[e.origin]) ? d : e.origin);
                        case "invalid_union":
                        default:
                            return "Neispravan unos";
                        case "invalid_element":
                            return "Neispravna vrijednost u ".concat(null != (m = i[e.origin]) ? m : e.origin)
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
                        cidrv4: "IPv4 tartomány",
                        cidrv6: "IPv6 tartomány",
                        base64: "base64-kódolt string",
                        base64url: "base64url-kódolt string",
                        json_string: "JSON string",
                        e164: "E.164 szám",
                        jwt: "JWT",
                        template_literal: "bemenet"
                    },
                    i = {
                        nan: "NaN",
                        number: "szám",
                        array: "tömb"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Érvénytelen bemenet: a várt érték instanceof ".concat(e.expected, ", a kapott érték ").concat(o);
                            return "Érvénytelen bemenet: a várt érték ".concat(t, ", a kapott érték ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Érvénytelen bemenet: a várt érték ".concat(D(e.values[0]));
                            return "Érvénytelen opció: valamelyik érték várt ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Túl nagy: ".concat(null != (o = e.origin) ? o : "érték", " mérete túl nagy ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "elem");
                            return "Túl nagy: a bemeneti érték ".concat(null != (u = e.origin) ? u : "érték", " túl nagy: ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Túl kicsi: a bemeneti érték ".concat(e.origin, " mérete túl kicsi ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "Túl kicsi: a bemeneti érték ".concat(e.origin, " túl kicsi ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Érvénytelen string: "'.concat(e.prefix, '" értékkel kell kezdődnie');
                            if ("ends_with" === e.format) return 'Érvénytelen string: "'.concat(e.suffix, '" értékkel kell végződnie');
                            if ("includes" === e.format) return 'Érvénytelen string: "'.concat(e.includes, '" értéket kell tartalmaznia');
                            if ("regex" === e.format) return "Érvénytelen string: ".concat(e.pattern, " mintának kell megfelelnie");
                            return "Érvénytelen ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "Érvénytelen szám: ".concat(e.divisor, " többszörösének kell lennie");
                        case "unrecognized_keys":
                            return "Ismeretlen kulcs".concat(e.keys.length > 1 ? "s" : "", ": ").concat(l(e.keys, ", "));
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
                        cidrv4: "IPv4 միջակայք",
                        cidrv6: "IPv6 միջակայք",
                        base64: "base64 ձևաչափով տող",
                        base64url: "base64url ձևաչափով տող",
                        json_string: "JSON տող",
                        e164: "E.164 համար",
                        jwt: "JWT",
                        template_literal: "մուտք"
                    },
                    i = {
                        nan: "NaN",
                        number: "թիվ",
                        array: "զանգված"
                    };
                return e => {
                    var r, a, o, c, u;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Սխալ մուտքագրում․ սպասվում էր instanceof ".concat(e.expected, ", ստացվել է ").concat(o);
                            return "Սխալ մուտքագրում․ սպասվում էր ".concat(t, ", ստացվել է ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Սխալ մուտքագրում․ սպասվում էր ".concat(D(e.values[1]));
                            return "Սխալ տարբերակ․ սպասվում էր հետևյալներից մեկը՝ ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) {
                                let t = eX(Number(e.maximum), i.unit.one, i.unit.many);
                                return "Չափազանց մեծ արժեք․ սպասվում է, որ ".concat(eq(null != (c = e.origin) ? c : "արժեք"), " կունենա ").concat(n).concat(e.maximum.toString(), " ").concat(t)
                            }
                            return "Չափազանց մեծ արժեք․ սպասվում է, որ ".concat(eq(null != (o = e.origin) ? o : "արժեք"), " լինի ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) {
                                let t = eX(Number(e.minimum), i.unit.one, i.unit.many);
                                return "Չափազանց փոքր արժեք․ սպասվում է, որ ".concat(eq(e.origin), " կունենա ").concat(n).concat(e.minimum.toString(), " ").concat(t)
                            }
                            return "Չափազանց փոքր արժեք․ սպասվում է, որ ".concat(eq(e.origin), " լինի ").concat(n).concat(e.minimum.toString())
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
                            return "Չճանաչված բանալի".concat(e.keys.length > 1 ? "ներ" : "", ". ").concat(l(e.keys, ", "));
                        case "invalid_key":
                            return "Սխալ բանալի ".concat(eq(e.origin), "-ում");
                        case "invalid_union":
                        default:
                            return "Սխալ մուտքագրում";
                        case "invalid_element":
                            return "Սխալ արժեք ".concat(eq(e.origin), "-ում")
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
                        cidrv4: "rentang alamat IPv4",
                        cidrv6: "rentang alamat IPv6",
                        base64: "string dengan enkode base64",
                        base64url: "string dengan enkode base64url",
                        json_string: "string JSON",
                        e164: "angka E.164",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    i = {
                        nan: "NaN"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Input tidak valid: diharapkan instanceof ".concat(e.expected, ", diterima ").concat(o);
                            return "Input tidak valid: diharapkan ".concat(t, ", diterima ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Input tidak valid: diharapkan ".concat(D(e.values[0]));
                            return "Pilihan tidak valid: diharapkan salah satu dari ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Terlalu besar: diharapkan ".concat(null != (o = e.origin) ? o : "value", " memiliki ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "elemen");
                            return "Terlalu besar: diharapkan ".concat(null != (u = e.origin) ? u : "value", " menjadi ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Terlalu kecil: diharapkan ".concat(e.origin, " memiliki ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "Terlalu kecil: diharapkan ".concat(e.origin, " menjadi ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'String tidak valid: harus dimulai dengan "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'String tidak valid: harus berakhir dengan "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'String tidak valid: harus menyertakan "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "String tidak valid: harus sesuai pola ".concat(e.pattern);
                            return "".concat(null != (s = n[e.format]) ? s : e.format, " tidak valid");
                        case "not_multiple_of":
                            return "Angka tidak valid: harus kelipatan dari ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Kunci tidak dikenali ".concat(e.keys.length > 1 ? "s" : "", ": ").concat(l(e.keys, ", "));
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
                        cidrv4: "IPv4 range",
                        cidrv6: "IPv6 range",
                        base64: "base64-encoded strengur",
                        base64url: "base64url-encoded strengur",
                        json_string: "JSON strengur",
                        e164: "E.164 tölugildi",
                        jwt: "JWT",
                        template_literal: "gildi"
                    },
                    i = {
                        nan: "NaN",
                        number: "númer",
                        array: "fylki"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Rangt gildi: Þú slóst inn ".concat(o, " þar sem á að vera instanceof ").concat(e.expected);
                            return "Rangt gildi: Þú slóst inn ".concat(o, " þar sem á að vera ").concat(t)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Rangt gildi: gert ráð fyrir ".concat(D(e.values[0]));
                            return "Ógilt val: má vera eitt af eftirfarandi ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Of stórt: gert er ráð fyrir að ".concat(null != (o = e.origin) ? o : "gildi", " hafi ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "hluti");
                            return "Of stórt: gert er ráð fyrir að ".concat(null != (u = e.origin) ? u : "gildi", " sé ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Of lítið: gert er ráð fyrir að ".concat(e.origin, " hafi ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "Of lítið: gert er ráð fyrir að ".concat(e.origin, " sé ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Ógildur strengur: verður að byrja á "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Ógildur strengur: verður að enda á "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Ógildur strengur: verður að innihalda "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Ógildur strengur: verður að fylgja mynstri ".concat(e.pattern);
                            return "Rangt ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "Röng tala: verður að vera margfeldi af ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Óþekkt ".concat(e.keys.length > 1 ? "ir lyklar" : "ur lykill", ": ").concat(l(e.keys, ", "));
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
                        cidrv4: "intervallo IPv4",
                        cidrv6: "intervallo IPv6",
                        base64: "stringa codificata in base64",
                        base64url: "URL codificata in base64",
                        json_string: "stringa JSON",
                        e164: "numero E.164",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    i = {
                        nan: "NaN",
                        number: "numero",
                        array: "vettore"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Input non valido: atteso instanceof ".concat(e.expected, ", ricevuto ").concat(o);
                            return "Input non valido: atteso ".concat(t, ", ricevuto ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Input non valido: atteso ".concat(D(e.values[0]));
                            return "Opzione non valida: atteso uno tra ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Troppo grande: ".concat(null != (o = e.origin) ? o : "valore", " deve avere ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "elementi");
                            return "Troppo grande: ".concat(null != (u = e.origin) ? u : "valore", " deve essere ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Troppo piccolo: ".concat(e.origin, " deve avere ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "Troppo piccolo: ".concat(e.origin, " deve essere ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Stringa non valida: deve iniziare con "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Stringa non valida: deve terminare con "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Stringa non valida: deve includere "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Stringa non valida: deve corrispondere al pattern ".concat(e.pattern);
                            return "Input non valido: ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "Numero non valido: deve essere un multiplo di ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Chiav".concat(e.keys.length > 1 ? "i" : "e", " non riconosciut").concat(e.keys.length > 1 ? "e" : "a", ": ").concat(l(e.keys, ", "));
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
                        cidrv4: "IPv4範囲",
                        cidrv6: "IPv6範囲",
                        base64: "base64エンコード文字列",
                        base64url: "base64urlエンコード文字列",
                        json_string: "JSON文字列",
                        e164: "E.164番号",
                        jwt: "JWT",
                        template_literal: "入力値"
                    },
                    i = {
                        nan: "NaN",
                        number: "数値",
                        array: "配列"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "無効な入力: instanceof ".concat(e.expected, "が期待されましたが、").concat(o, "が入力されました");
                            return "無効な入力: ".concat(t, "が期待されましたが、").concat(o, "が入力されました")
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "無効な入力: ".concat(D(e.values[0]), "が期待されました");
                            return "無効な選択: ".concat(l(e.values, "、"), "のいずれかである必要があります");
                        case "too_big": {
                            let n = e.inclusive ? "以下である" : "より小さい",
                                i = t(e.origin);
                            if (i) return "大きすぎる値: ".concat(null != (o = e.origin) ? o : "値", "は").concat(e.maximum.toString()).concat(null != (c = i.unit) ? c : "要素").concat(n, "必要があります");
                            return "大きすぎる値: ".concat(null != (u = e.origin) ? u : "値", "は").concat(e.maximum.toString()).concat(n, "必要があります")
                        }
                        case "too_small": {
                            let n = e.inclusive ? "以上である" : "より大きい",
                                i = t(e.origin);
                            if (i) return "小さすぎる値: ".concat(e.origin, "は").concat(e.minimum.toString()).concat(i.unit).concat(n, "必要があります");
                            return "小さすぎる値: ".concat(e.origin, "は").concat(e.minimum.toString()).concat(n, "必要があります")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return '無効な文字列: "'.concat(e.prefix, '"で始まる必要があります');
                            if ("ends_with" === e.format) return '無効な文字列: "'.concat(e.suffix, '"で終わる必要があります');
                            if ("includes" === e.format) return '無効な文字列: "'.concat(e.includes, '"を含む必要があります');
                            if ("regex" === e.format) return "無効な文字列: パターン".concat(e.pattern, "に一致する必要があります");
                            return "無効な".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "無効な数値: ".concat(e.divisor, "の倍数である必要があります");
                        case "unrecognized_keys":
                            return "認識されていないキー".concat(e.keys.length > 1 ? "群" : "", ": ").concat(l(e.keys, "、"));
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
                        cidrv4: "IPv4 დიაპაზონი",
                        cidrv6: "IPv6 დიაპაზონი",
                        base64: "base64-კოდირებული ველი",
                        base64url: "base64url-კოდირებული ველი",
                        json_string: "JSON ველი",
                        e164: "E.164 ნომერი",
                        jwt: "JWT",
                        template_literal: "შეყვანა"
                    },
                    i = {
                        nan: "NaN",
                        number: "რიცხვი",
                        string: "ველი",
                        boolean: "ბულეანი",
                        function: "ფუნქცია",
                        array: "მასივი"
                    };
                return e => {
                    var r, a, o, c, u;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "არასწორი შეყვანა: მოსალოდნელი instanceof ".concat(e.expected, ", მიღებული ").concat(o);
                            return "არასწორი შეყვანა: მოსალოდნელი ".concat(t, ", მიღებული ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "არასწორი შეყვანა: მოსალოდნელი ".concat(D(e.values[0]));
                            return "არასწორი ვარიანტი: მოსალოდნელია ერთ-ერთი ".concat(l(e.values, "|"), "-დან");
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "ზედმეტად დიდი: მოსალოდნელი ".concat(null != (o = e.origin) ? o : "მნიშვნელობა", " ").concat(i.verb, " ").concat(n).concat(e.maximum.toString(), " ").concat(i.unit);
                            return "ზედმეტად დიდი: მოსალოდნელი ".concat(null != (c = e.origin) ? c : "მნიშვნელობა", " იყოს ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "ზედმეტად პატარა: მოსალოდნელი ".concat(e.origin, " ").concat(i.verb, " ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
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
                            return "უცნობი გასაღებ".concat(e.keys.length > 1 ? "ები" : "ი", ": ").concat(l(e.keys, ", "));
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
        return eY()
    }, "km", 0, eY, "ko", 0, function() {
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
                        cidrv4: "IPv4 범위",
                        cidrv6: "IPv6 범위",
                        base64: "base64 인코딩 문자열",
                        base64url: "base64url 인코딩 문자열",
                        json_string: "JSON 문자열",
                        e164: "E.164 번호",
                        jwt: "JWT",
                        template_literal: "입력"
                    },
                    i = {
                        nan: "NaN"
                    };
                return e => {
                    var r, a, o, c, u, s, d, m, f;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "잘못된 입력: 예상 타입은 instanceof ".concat(e.expected, ", 받은 타입은 ").concat(o, "입니다");
                            return "잘못된 입력: 예상 타입은 ".concat(t, ", 받은 타입은 ").concat(o, "입니다")
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "잘못된 입력: 값은 ".concat(D(e.values[0]), " 이어야 합니다");
                            return "잘못된 옵션: ".concat(l(e.values, "또는 "), " 중 하나여야 합니다");
                        case "too_big": {
                            let n = e.inclusive ? "이하" : "미만",
                                i = "미만" === n ? "이어야 합니다" : "여야 합니다",
                                r = t(e.origin),
                                a = null != (o = null == r ? void 0 : r.unit) ? o : "요소";
                            if (r) return "".concat(null != (c = e.origin) ? c : "값", "이 너무 큽니다: ").concat(e.maximum.toString()).concat(a, " ").concat(n).concat(i);
                            return "".concat(null != (u = e.origin) ? u : "값", "이 너무 큽니다: ").concat(e.maximum.toString(), " ").concat(n).concat(i)
                        }
                        case "too_small": {
                            let n = e.inclusive ? "이상" : "초과",
                                i = "이상" === n ? "이어야 합니다" : "여야 합니다",
                                r = t(e.origin),
                                a = null != (s = null == r ? void 0 : r.unit) ? s : "요소";
                            if (r) return "".concat(null != (m = e.origin) ? m : "값", "이 너무 작습니다: ").concat(e.minimum.toString()).concat(a, " ").concat(n).concat(i);
                            return "".concat(null != (d = e.origin) ? d : "값", "이 너무 작습니다: ").concat(e.minimum.toString(), " ").concat(n).concat(i)
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return '잘못된 문자열: "'.concat(e.prefix, '"(으)로 시작해야 합니다');
                            if ("ends_with" === e.format) return '잘못된 문자열: "'.concat(e.suffix, '"(으)로 끝나야 합니다');
                            if ("includes" === e.format) return '잘못된 문자열: "'.concat(e.includes, '"을(를) 포함해야 합니다');
                            if ("regex" === e.format) return "잘못된 문자열: 정규식 ".concat(e.pattern, " 패턴과 일치해야 합니다");
                            return "잘못된 ".concat(null != (f = n[e.format]) ? f : e.format);
                        case "not_multiple_of":
                            return "잘못된 숫자: ".concat(e.divisor, "의 배수여야 합니다");
                        case "unrecognized_keys":
                            return "인식할 수 없는 키: ".concat(l(e.keys, ", "));
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

                function t(t, n, i, r) {
                    var a;
                    let o = null != (a = e[t]) ? a : null;
                    return null === o ? o : {
                        unit: o.unit[n],
                        verb: o.verb[r][i ? "inclusive" : "notInclusive"]
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
                        cidrv4: "IPv4 tinklo prefiksas (CIDR)",
                        cidrv6: "IPv6 tinklo prefiksas (CIDR)",
                        base64: "base64 užkoduota eilutė",
                        base64url: "base64url užkoduota eilutė",
                        json_string: "JSON eilutė",
                        e164: "E.164 numeris",
                        jwt: "JWT",
                        template_literal: "įvestis"
                    },
                    i = {
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
                    var r, a, o, c, u, s, d, m, f, v, p, g, h, _, y;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Gautas tipas ".concat(o, ", o tikėtasi - instanceof ").concat(e.expected);
                            return "Gautas tipas ".concat(o, ", o tikėtasi - ").concat(t)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Privalo būti ".concat(D(e.values[0]));
                            return "Privalo būti vienas iš ".concat(l(e.values, "|"), " pasirinkimų");
                        case "too_big": {
                            let n = null != (o = i[e.origin]) ? o : e.origin,
                                r = t(e.origin, eQ(Number(e.maximum)), null != (c = e.inclusive) && c, "smaller");
                            if (null == r ? void 0 : r.verb) return "".concat(eH(null != (u = null != n ? n : e.origin) ? u : "reikšmė"), " ").concat(r.verb, " ").concat(e.maximum.toString(), " ").concat(null != (s = r.unit) ? s : "elementų");
                            let a = e.inclusive ? "ne didesnis kaip" : "mažesnis kaip";
                            return "".concat(eH(null != (d = null != n ? n : e.origin) ? d : "reikšmė"), " turi būti ").concat(a, " ").concat(e.maximum.toString(), " ").concat(null == r ? void 0 : r.unit)
                        }
                        case "too_small": {
                            let n = null != (m = i[e.origin]) ? m : e.origin,
                                r = t(e.origin, eQ(Number(e.minimum)), null != (f = e.inclusive) && f, "bigger");
                            if (null == r ? void 0 : r.verb) return "".concat(eH(null != (v = null != n ? n : e.origin) ? v : "reikšmė"), " ").concat(r.verb, " ").concat(e.minimum.toString(), " ").concat(null != (p = r.unit) ? p : "elementų");
                            let a = e.inclusive ? "ne mažesnis kaip" : "didesnis kaip";
                            return "".concat(eH(null != (g = null != n ? n : e.origin) ? g : "reikšmė"), " turi būti ").concat(a, " ").concat(e.minimum.toString(), " ").concat(null == r ? void 0 : r.unit)
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Eilutė privalo prasidėti "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Eilutė privalo pasibaigti "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Eilutė privalo įtraukti "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Eilutė privalo atitikti ".concat(e.pattern);
                            return "Neteisingas ".concat(null != (h = n[e.format]) ? h : e.format);
                        case "not_multiple_of":
                            return "Skaičius privalo būti ".concat(e.divisor, " kartotinis.");
                        case "unrecognized_keys":
                            return "Neatpažint".concat(e.keys.length > 1 ? "i" : "as", " rakt").concat(e.keys.length > 1 ? "ai" : "as", ": ").concat(l(e.keys, ", "));
                        case "invalid_key":
                            return "Rastas klaidingas raktas";
                        case "invalid_union":
                        default:
                            return "Klaidinga įvestis";
                        case "invalid_element": {
                            let t = null != (_ = i[e.origin]) ? _ : e.origin;
                            return "".concat(eH(null != (y = null != t ? t : e.origin) ? y : "reikšmė"), " turi klaidingą įvestį")
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
                        cidrv4: "IPv4 опсег",
                        cidrv6: "IPv6 опсег",
                        base64: "base64-енкодирана низа",
                        base64url: "base64url-енкодирана низа",
                        json_string: "JSON низа",
                        e164: "E.164 број",
                        jwt: "JWT",
                        template_literal: "внес"
                    },
                    i = {
                        nan: "NaN",
                        number: "број",
                        array: "низа"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Грешен внес: се очекува instanceof ".concat(e.expected, ", примено ").concat(o);
                            return "Грешен внес: се очекува ".concat(t, ", примено ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Invalid input: expected ".concat(D(e.values[0]));
                            return "Грешана опција: се очекува една ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Премногу голем: се очекува ".concat(null != (o = e.origin) ? o : "вредноста", " да има ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "елементи");
                            return "Премногу голем: се очекува ".concat(null != (u = e.origin) ? u : "вредноста", " да биде ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Премногу мал: се очекува ".concat(e.origin, " да има ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "Премногу мал: се очекува ".concat(e.origin, " да биде ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Неважечка низа: мора да започнува со "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Неважечка низа: мора да завршува со "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Неважечка низа: мора да вклучува "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Неважечка низа: мора да одгоара на патернот ".concat(e.pattern);
                            return "Invalid ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "Грешен број: мора да биде делив со ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "".concat(e.keys.length > 1 ? "Непрепознаени клучеви" : "Непрепознаен клуч", ": ").concat(l(e.keys, ", "));
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
                        cidrv4: "julat IPv4",
                        cidrv6: "julat IPv6",
                        base64: "string dikodkan base64",
                        base64url: "string dikodkan base64url",
                        json_string: "string JSON",
                        e164: "nombor E.164",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    i = {
                        nan: "NaN",
                        number: "nombor"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Input tidak sah: dijangka instanceof ".concat(e.expected, ", diterima ").concat(o);
                            return "Input tidak sah: dijangka ".concat(t, ", diterima ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Input tidak sah: dijangka ".concat(D(e.values[0]));
                            return "Pilihan tidak sah: dijangka salah satu daripada ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Terlalu besar: dijangka ".concat(null != (o = e.origin) ? o : "nilai", " ").concat(i.verb, " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "elemen");
                            return "Terlalu besar: dijangka ".concat(null != (u = e.origin) ? u : "nilai", " adalah ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Terlalu kecil: dijangka ".concat(e.origin, " ").concat(i.verb, " ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "Terlalu kecil: dijangka ".concat(e.origin, " adalah ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'String tidak sah: mesti bermula dengan "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'String tidak sah: mesti berakhir dengan "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'String tidak sah: mesti mengandungi "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "String tidak sah: mesti sepadan dengan corak ".concat(e.pattern);
                            return "".concat(null != (s = n[e.format]) ? s : e.format, " tidak sah");
                        case "not_multiple_of":
                            return "Nombor tidak sah: perlu gandaan ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Kunci tidak dikenali: ".concat(l(e.keys, ", "));
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
                        cidrv4: "IPv4-bereik",
                        cidrv6: "IPv6-bereik",
                        base64: "base64-gecodeerde tekst",
                        base64url: "base64 URL-gecodeerde tekst",
                        json_string: "JSON string",
                        e164: "E.164-nummer",
                        jwt: "JWT",
                        template_literal: "invoer"
                    },
                    i = {
                        nan: "NaN",
                        number: "getal"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Ongeldige invoer: verwacht instanceof ".concat(e.expected, ", ontving ").concat(o);
                            return "Ongeldige invoer: verwacht ".concat(t, ", ontving ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Ongeldige invoer: verwacht ".concat(D(e.values[0]));
                            return "Ongeldige optie: verwacht één van ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin),
                                r = "date" === e.origin ? "laat" : "string" === e.origin ? "lang" : "groot";
                            if (i) return "Te ".concat(r, ": verwacht dat ").concat(null != (o = e.origin) ? o : "waarde", " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "elementen", " ").concat(i.verb);
                            return "Te ".concat(r, ": verwacht dat ").concat(null != (u = e.origin) ? u : "waarde", " ").concat(n).concat(e.maximum.toString(), " is")
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin),
                                r = "date" === e.origin ? "vroeg" : "string" === e.origin ? "kort" : "klein";
                            if (i) return "Te ".concat(r, ": verwacht dat ").concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit, " ").concat(i.verb);
                            return "Te ".concat(r, ": verwacht dat ").concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " is")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Ongeldige tekst: moet met "'.concat(e.prefix, '" beginnen');
                            if ("ends_with" === e.format) return 'Ongeldige tekst: moet op "'.concat(e.suffix, '" eindigen');
                            if ("includes" === e.format) return 'Ongeldige tekst: moet "'.concat(e.includes, '" bevatten');
                            if ("regex" === e.format) return "Ongeldige tekst: moet overeenkomen met patroon ".concat(e.pattern);
                            return "Ongeldig: ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "Ongeldig getal: moet een veelvoud van ".concat(e.divisor, " zijn");
                        case "unrecognized_keys":
                            return "Onbekende key".concat(e.keys.length > 1 ? "s" : "", ": ").concat(l(e.keys, ", "));
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
                        ipv4: "IPv4-område",
                        ipv6: "IPv6-område",
                        cidrv4: "IPv4-spekter",
                        cidrv6: "IPv6-spekter",
                        base64: "base64-enkodet streng",
                        base64url: "base64url-enkodet streng",
                        json_string: "JSON-streng",
                        e164: "E.164-nummer",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    i = {
                        nan: "NaN",
                        number: "tall",
                        array: "liste"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Ugyldig input: forventet instanceof ".concat(e.expected, ", fikk ").concat(o);
                            return "Ugyldig input: forventet ".concat(t, ", fikk ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Ugyldig verdi: forventet ".concat(D(e.values[0]));
                            return "Ugyldig valg: forventet en av ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "For stor(t): forventet ".concat(null != (o = e.origin) ? o : "value", " til å ha ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "elementer");
                            return "For stor(t): forventet ".concat(null != (u = e.origin) ? u : "value", " til å ha ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "For lite(n): forventet ".concat(e.origin, " til å ha ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "For lite(n): forventet ".concat(e.origin, " til å ha ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Ugyldig streng: må starte med "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Ugyldig streng: må ende med "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Ugyldig streng: må inneholde "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Ugyldig streng: må matche mønsteret ".concat(e.pattern);
                            return "Ugyldig ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "Ugyldig tall: må være et multiplum av ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "".concat(e.keys.length > 1 ? "Ukjente nøkler" : "Ukjent nøkkel", ": ").concat(l(e.keys, ", "));
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
                        cidrv4: "IPv4 menzili",
                        cidrv6: "IPv6 menzili",
                        base64: "base64-şifreli metin",
                        base64url: "base64url-şifreli metin",
                        json_string: "JSON metin",
                        e164: "E.164 sayısı",
                        jwt: "JWT",
                        template_literal: "giren"
                    },
                    i = {
                        nan: "NaN",
                        number: "numara",
                        array: "saf",
                        null: "gayb"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Fâsit giren: umulan instanceof ".concat(e.expected, ", alınan ").concat(o);
                            return "Fâsit giren: umulan ".concat(t, ", alınan ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Fâsit giren: umulan ".concat(D(e.values[0]));
                            return "Fâsit tercih: mûteberler ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Fazla büyük: ".concat(null != (o = e.origin) ? o : "value", ", ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "elements", " sahip olmalıydı.");
                            return "Fazla büyük: ".concat(null != (u = e.origin) ? u : "value", ", ").concat(n).concat(e.maximum.toString(), " olmalıydı.")
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Fazla küçük: ".concat(e.origin, ", ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit, " sahip olmalıydı.");
                            return "Fazla küçük: ".concat(e.origin, ", ").concat(n).concat(e.minimum.toString(), " olmalıydı.")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Fâsit metin: "'.concat(e.prefix, '" ile başlamalı.');
                            if ("ends_with" === e.format) return 'Fâsit metin: "'.concat(e.suffix, '" ile bitmeli.');
                            if ("includes" === e.format) return 'Fâsit metin: "'.concat(e.includes, '" ihtivâ etmeli.');
                            if ("regex" === e.format) return "Fâsit metin: ".concat(e.pattern, " nakşına uymalı.");
                            return "Fâsit ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "Fâsit sayı: ".concat(e.divisor, " katı olmalıydı.");
                        case "unrecognized_keys":
                            return "Tanınmayan anahtar ".concat(e.keys.length > 1 ? "s" : "", ": ").concat(l(e.keys, ", "));
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
                        cidrv4: "zakres IPv4",
                        cidrv6: "zakres IPv6",
                        base64: "ciąg znaków zakodowany w formacie base64",
                        base64url: "ciąg znaków zakodowany w formacie base64url",
                        json_string: "ciąg znaków w formacie JSON",
                        e164: "liczba E.164",
                        jwt: "JWT",
                        template_literal: "wejście"
                    },
                    i = {
                        nan: "NaN",
                        number: "liczba",
                        array: "tablica"
                    };
                return e => {
                    var r, a, o, c, u, s, d, m, f;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Nieprawidłowe dane wejściowe: oczekiwano instanceof ".concat(e.expected, ", otrzymano ").concat(o);
                            return "Nieprawidłowe dane wejściowe: oczekiwano ".concat(t, ", otrzymano ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Nieprawidłowe dane wejściowe: oczekiwano ".concat(D(e.values[0]));
                            return "Nieprawidłowa opcja: oczekiwano jednej z wartości ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Za duża wartość: oczekiwano, że ".concat(null != (c = e.origin) ? c : "wartość", " będzie mieć ").concat(n).concat(e.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "elementów");
                            return "Zbyt duż(y/a/e): oczekiwano, że ".concat(null != (o = e.origin) ? o : "wartość", " będzie wynosić ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Za mała wartość: oczekiwano, że ".concat(null != (d = e.origin) ? d : "wartość", " będzie mieć ").concat(n).concat(e.minimum.toString(), " ").concat(null != (m = i.unit) ? m : "elementów");
                            return "Zbyt mał(y/a/e): oczekiwano, że ".concat(null != (s = e.origin) ? s : "wartość", " będzie wynosić ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Nieprawidłowy ciąg znaków: musi zaczynać się od "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Nieprawidłowy ciąg znaków: musi kończyć się na "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Nieprawidłowy ciąg znaków: musi zawierać "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Nieprawidłowy ciąg znaków: musi odpowiadać wzorcowi ".concat(e.pattern);
                            return "Nieprawidłow(y/a/e) ".concat(null != (f = n[e.format]) ? f : e.format);
                        case "not_multiple_of":
                            return "Nieprawidłowa liczba: musi być wielokrotnością ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Nierozpoznane klucze".concat(e.keys.length > 1 ? "s" : "", ": ").concat(l(e.keys, ", "));
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
                        cidrv4: "د IPv4 ساحه",
                        cidrv6: "د IPv6 ساحه",
                        base64: "base64-encoded متن",
                        base64url: "base64url-encoded متن",
                        json_string: "JSON متن",
                        e164: "د E.164 شمېره",
                        jwt: "JWT",
                        template_literal: "ورودي"
                    },
                    i = {
                        nan: "NaN",
                        number: "عدد",
                        array: "ارې"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "ناسم ورودي: باید instanceof ".concat(e.expected, " وای, مګر ").concat(o, " ترلاسه شو");
                            return "ناسم ورودي: باید ".concat(t, " وای, مګر ").concat(o, " ترلاسه شو")
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "ناسم ورودي: باید ".concat(D(e.values[0]), " وای");
                            return "ناسم انتخاب: باید یو له ".concat(l(e.values, "|"), " څخه وای");
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "ډیر لوی: ".concat(null != (c = e.origin) ? c : "ارزښت", " باید ").concat(n).concat(e.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "عنصرونه", " ولري");
                            return "ډیر لوی: ".concat(null != (o = e.origin) ? o : "ارزښت", " باید ").concat(n).concat(e.maximum.toString(), " وي")
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "ډیر کوچنی: ".concat(e.origin, " باید ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit, " ولري");
                            return "ډیر کوچنی: ".concat(e.origin, " باید ").concat(n).concat(e.minimum.toString(), " وي")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'ناسم متن: باید د "'.concat(e.prefix, '" سره پیل شي');
                            if ("ends_with" === e.format) return 'ناسم متن: باید د "'.concat(e.suffix, '" سره پای ته ورسيږي');
                            if ("includes" === e.format) return 'ناسم متن: باید "'.concat(e.includes, '" ولري');
                            if ("regex" === e.format) return "ناسم متن: باید د ".concat(e.pattern, " سره مطابقت ولري");
                            return "".concat(null != (s = n[e.format]) ? s : e.format, " ناسم دی");
                        case "not_multiple_of":
                            return "ناسم عدد: باید د ".concat(e.divisor, " مضرب وي");
                        case "unrecognized_keys":
                            return "ناسم ".concat(e.keys.length > 1 ? "کلیډونه" : "کلیډ", ": ").concat(l(e.keys, ", "));
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
                        unit: "caracteres",
                        verb: "ter"
                    },
                    file: {
                        unit: "bytes",
                        verb: "ter"
                    },
                    array: {
                        unit: "itens",
                        verb: "ter"
                    },
                    set: {
                        unit: "itens",
                        verb: "ter"
                    }
                };

                function t(t) {
                    var n;
                    return null != (n = e[t]) ? n : null
                }
                let n = {
                        regex: "padrão",
                        email: "endereço de e-mail",
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
                        datetime: "data e hora ISO",
                        date: "data ISO",
                        time: "hora ISO",
                        duration: "duração ISO",
                        ipv4: "endereço IPv4",
                        ipv6: "endereço IPv6",
                        cidrv4: "faixa de IPv4",
                        cidrv6: "faixa de IPv6",
                        base64: "texto codificado em base64",
                        base64url: "URL codificada em base64",
                        json_string: "texto JSON",
                        e164: "número E.164",
                        jwt: "JWT",
                        template_literal: "entrada"
                    },
                    i = {
                        nan: "NaN",
                        number: "número",
                        null: "nulo"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Tipo inválido: esperado instanceof ".concat(e.expected, ", recebido ").concat(o);
                            return "Tipo inválido: esperado ".concat(t, ", recebido ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Entrada inválida: esperado ".concat(D(e.values[0]));
                            return "Opção inválida: esperada uma das ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Muito grande: esperado que ".concat(null != (o = e.origin) ? o : "valor", " tivesse ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "elementos");
                            return "Muito grande: esperado que ".concat(null != (u = e.origin) ? u : "valor", " fosse ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Muito pequeno: esperado que ".concat(e.origin, " tivesse ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "Muito pequeno: esperado que ".concat(e.origin, " fosse ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Texto inválido: deve começar com "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Texto inválido: deve terminar com "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Texto inválido: deve incluir "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Texto inválido: deve corresponder ao padrão ".concat(e.pattern);
                            return "".concat(null != (s = n[e.format]) ? s : e.format, " inválido");
                        case "not_multiple_of":
                            return "Número inválido: deve ser múltiplo de ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Chave".concat(e.keys.length > 1 ? "s" : "", " desconhecida").concat(e.keys.length > 1 ? "s" : "", ": ").concat(l(e.keys, ", "));
                        case "invalid_key":
                            return "Chave inválida em ".concat(e.origin);
                        case "invalid_union":
                            return "Entrada inválida";
                        case "invalid_element":
                            return "Valor inválido em ".concat(e.origin);
                        default:
                            return "Campo inválido"
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
                        jwt: "JWT",
                        template_literal: "intrare"
                    },
                    i = {
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
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            return "Intrare invalidă: așteptat ".concat(t, ", primit ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Intrare invalidă: așteptat ".concat(D(e.values[0]));
                            return "Opțiune invalidă: așteptat una dintre ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Prea mare: așteptat ca ".concat(null != (o = e.origin) ? o : "valoarea", " ").concat(i.verb, " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "elemente");
                            return "Prea mare: așteptat ca ".concat(null != (u = e.origin) ? u : "valoarea", " să fie ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Prea mic: așteptat ca ".concat(e.origin, " ").concat(i.verb, " ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "Prea mic: așteptat ca ".concat(e.origin, " să fie ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Șir invalid: trebuie să înceapă cu "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Șir invalid: trebuie să se termine cu "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Șir invalid: trebuie să includă "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Șir invalid: trebuie să se potrivească cu modelul ".concat(e.pattern);
                            return "Format invalid: ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "Număr invalid: trebuie să fie multiplu de ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Chei nerecunoscute: ".concat(l(e.keys, ", "));
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
                        cidrv4: "IPv4 диапазон",
                        cidrv6: "IPv6 диапазон",
                        base64: "строка в формате base64",
                        base64url: "строка в формате base64url",
                        json_string: "JSON строка",
                        e164: "номер E.164",
                        jwt: "JWT",
                        template_literal: "ввод"
                    },
                    i = {
                        nan: "NaN",
                        number: "число",
                        array: "массив"
                    };
                return e => {
                    var r, a, o, c, u;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Неверный ввод: ожидалось instanceof ".concat(e.expected, ", получено ").concat(o);
                            return "Неверный ввод: ожидалось ".concat(t, ", получено ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Неверный ввод: ожидалось ".concat(D(e.values[0]));
                            return "Неверный вариант: ожидалось одно из ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) {
                                let t = e0(Number(e.maximum), i.unit.one, i.unit.few, i.unit.many);
                                return "Слишком большое значение: ожидалось, что ".concat(null != (c = e.origin) ? c : "значение", " будет иметь ").concat(n).concat(e.maximum.toString(), " ").concat(t)
                            }
                            return "Слишком большое значение: ожидалось, что ".concat(null != (o = e.origin) ? o : "значение", " будет ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) {
                                let t = e0(Number(e.minimum), i.unit.one, i.unit.few, i.unit.many);
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
                            return "Нераспознанн".concat(e.keys.length > 1 ? "ые" : "ый", " ключ").concat(e.keys.length > 1 ? "и" : "", ": ").concat(l(e.keys, ", "));
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
                        cidrv4: "obseg IPv4",
                        cidrv6: "obseg IPv6",
                        base64: "base64 kodiran niz",
                        base64url: "base64url kodiran niz",
                        json_string: "JSON niz",
                        e164: "E.164 številka",
                        jwt: "JWT",
                        template_literal: "vnos"
                    },
                    i = {
                        nan: "NaN",
                        number: "število",
                        array: "tabela"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Neveljaven vnos: pričakovano instanceof ".concat(e.expected, ", prejeto ").concat(o);
                            return "Neveljaven vnos: pričakovano ".concat(t, ", prejeto ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Neveljaven vnos: pričakovano ".concat(D(e.values[0]));
                            return "Neveljavna možnost: pričakovano eno izmed ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Preveliko: pričakovano, da bo ".concat(null != (o = e.origin) ? o : "vrednost", " imelo ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "elementov");
                            return "Preveliko: pričakovano, da bo ".concat(null != (u = e.origin) ? u : "vrednost", " ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Premajhno: pričakovano, da bo ".concat(e.origin, " imelo ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "Premajhno: pričakovano, da bo ".concat(e.origin, " ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Neveljaven niz: mora se začeti z "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Neveljaven niz: mora se končati z "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Neveljaven niz: mora vsebovati "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Neveljaven niz: mora ustrezati vzorcu ".concat(e.pattern);
                            return "Neveljaven ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "Neveljavno število: mora biti večkratnik ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Neprepoznan".concat(e.keys.length > 1 ? "i ključi" : " ključ", ": ").concat(l(e.keys, ", "));
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
                        ipv4: "IPv4-intervall",
                        ipv6: "IPv6-intervall",
                        cidrv4: "IPv4-spektrum",
                        cidrv6: "IPv6-spektrum",
                        base64: "base64-kodad sträng",
                        base64url: "base64url-kodad sträng",
                        json_string: "JSON-sträng",
                        e164: "E.164-nummer",
                        jwt: "JWT",
                        template_literal: "mall-literal"
                    },
                    i = {
                        nan: "NaN",
                        number: "antal",
                        array: "lista"
                    };
                return e => {
                    var r, a, o, c, u, s, d, m, f, v;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Ogiltig inmatning: förväntat instanceof ".concat(e.expected, ", fick ").concat(o);
                            return "Ogiltig inmatning: förväntat ".concat(t, ", fick ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Ogiltig inmatning: förväntat ".concat(D(e.values[0]));
                            return "Ogiltigt val: förväntade en av ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "För stor(t): förväntade ".concat(null != (c = e.origin) ? c : "värdet", " att ha ").concat(n).concat(e.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "element");
                            return "För stor(t): förväntat ".concat(null != (o = e.origin) ? o : "värdet", " att ha ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "För lite(t): förväntade ".concat(null != (d = e.origin) ? d : "värdet", " att ha ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "För lite(t): förväntade ".concat(null != (s = e.origin) ? s : "värdet", " att ha ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Ogiltig sträng: måste börja med "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Ogiltig sträng: måste sluta med "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Ogiltig sträng: måste innehålla "'.concat(e.includes, '"');
                            if ("regex" === e.format) return 'Ogiltig sträng: måste matcha mönstret "'.concat(e.pattern, '"');
                            return "Ogiltig(t) ".concat(null != (m = n[e.format]) ? m : e.format);
                        case "not_multiple_of":
                            return "Ogiltigt tal: måste vara en multipel av ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "".concat(e.keys.length > 1 ? "Okända nycklar" : "Okänd nyckel", ": ").concat(l(e.keys, ", "));
                        case "invalid_key":
                            return "Ogiltig nyckel i ".concat(null != (f = e.origin) ? f : "värdet");
                        case "invalid_union":
                        default:
                            return "Ogiltig input";
                        case "invalid_element":
                            return "Ogiltigt värde i ".concat(null != (v = e.origin) ? v : "värdet")
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
                        cidrv4: "IPv4 வரம்பு",
                        cidrv6: "IPv6 வரம்பு",
                        base64: "base64-encoded சரம்",
                        base64url: "base64url-encoded சரம்",
                        json_string: "JSON சரம்",
                        e164: "E.164 எண்",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    i = {
                        nan: "NaN",
                        number: "எண்",
                        array: "அணி",
                        null: "வெறுமை"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "தவறான உள்ளீடு: எதிர்பார்க்கப்பட்டது instanceof ".concat(e.expected, ", பெறப்பட்டது ").concat(o);
                            return "தவறான உள்ளீடு: எதிர்பார்க்கப்பட்டது ".concat(t, ", பெறப்பட்டது ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "தவறான உள்ளீடு: எதிர்பார்க்கப்பட்டது ".concat(D(e.values[0]));
                            return "தவறான விருப்பம்: எதிர்பார்க்கப்பட்டது ".concat(l(e.values, "|"), " இல் ஒன்று");
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "மிக பெரியது: எதிர்பார்க்கப்பட்டது ".concat(null != (c = e.origin) ? c : "மதிப்பு", " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "உறுப்புகள்", " ஆக இருக்க வேண்டும்");
                            return "மிக பெரியது: எதிர்பார்க்கப்பட்டது ".concat(null != (o = e.origin) ? o : "மதிப்பு", " ").concat(n).concat(e.maximum.toString(), " ஆக இருக்க வேண்டும்")
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "மிகச் சிறியது: எதிர்பார்க்கப்பட்டது ".concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit, " ஆக இருக்க வேண்டும்");
                            return "மிகச் சிறியது: எதிர்பார்க்கப்பட்டது ".concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " ஆக இருக்க வேண்டும்")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'தவறான சரம்: "'.concat(e.prefix, '" இல் தொடங்க வேண்டும்');
                            if ("ends_with" === e.format) return 'தவறான சரம்: "'.concat(e.suffix, '" இல் முடிவடைய வேண்டும்');
                            if ("includes" === e.format) return 'தவறான சரம்: "'.concat(e.includes, '" ஐ உள்ளடக்க வேண்டும்');
                            if ("regex" === e.format) return "தவறான சரம்: ".concat(e.pattern, " முறைபாட்டுடன் பொருந்த வேண்டும்");
                            return "தவறான ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "தவறான எண்: ".concat(e.divisor, " இன் பலமாக இருக்க வேண்டும்");
                        case "unrecognized_keys":
                            return "அடையாளம் தெரியாத விசை".concat(e.keys.length > 1 ? "கள்" : "", ": ").concat(l(e.keys, ", "));
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
                        cidrv4: "ช่วง IP แบบ IPv4",
                        cidrv6: "ช่วง IP แบบ IPv6",
                        base64: "ข้อความแบบ Base64",
                        base64url: "ข้อความแบบ Base64 สำหรับ URL",
                        json_string: "ข้อความแบบ JSON",
                        e164: "เบอร์โทรศัพท์ระหว่างประเทศ (E.164)",
                        jwt: "โทเคน JWT",
                        template_literal: "ข้อมูลที่ป้อน"
                    },
                    i = {
                        nan: "NaN",
                        number: "ตัวเลข",
                        array: "อาร์เรย์ (Array)",
                        null: "ไม่มีค่า (null)"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "ประเภทข้อมูลไม่ถูกต้อง: ควรเป็น instanceof ".concat(e.expected, " แต่ได้รับ ").concat(o);
                            return "ประเภทข้อมูลไม่ถูกต้อง: ควรเป็น ".concat(t, " แต่ได้รับ ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "ค่าไม่ถูกต้อง: ควรเป็น ".concat(D(e.values[0]));
                            return "ตัวเลือกไม่ถูกต้อง: ควรเป็นหนึ่งใน ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "ไม่เกิน" : "น้อยกว่า",
                                i = t(e.origin);
                            if (i) return "เกินกำหนด: ".concat(null != (o = e.origin) ? o : "ค่า", " ควรมี").concat(n, " ").concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "รายการ");
                            return "เกินกำหนด: ".concat(null != (u = e.origin) ? u : "ค่า", " ควรมี").concat(n, " ").concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? "อย่างน้อย" : "มากกว่า",
                                i = t(e.origin);
                            if (i) return "น้อยกว่ากำหนด: ".concat(e.origin, " ควรมี").concat(n, " ").concat(e.minimum.toString(), " ").concat(i.unit);
                            return "น้อยกว่ากำหนด: ".concat(e.origin, " ควรมี").concat(n, " ").concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'รูปแบบไม่ถูกต้อง: ข้อความต้องขึ้นต้นด้วย "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'รูปแบบไม่ถูกต้อง: ข้อความต้องลงท้ายด้วย "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'รูปแบบไม่ถูกต้อง: ข้อความต้องมี "'.concat(e.includes, '" อยู่ในข้อความ');
                            if ("regex" === e.format) return "รูปแบบไม่ถูกต้อง: ต้องตรงกับรูปแบบที่กำหนด ".concat(e.pattern);
                            return "รูปแบบไม่ถูกต้อง: ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "ตัวเลขไม่ถูกต้อง: ต้องเป็นจำนวนที่หารด้วย ".concat(e.divisor, " ได้ลงตัว");
                        case "unrecognized_keys":
                            return "พบคีย์ที่ไม่รู้จัก: ".concat(l(e.keys, ", "));
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
                        cidrv4: "IPv4 aralığı",
                        cidrv6: "IPv6 aralığı",
                        base64: "base64 ile şifrelenmiş metin",
                        base64url: "base64url ile şifrelenmiş metin",
                        json_string: "JSON dizesi",
                        e164: "E.164 sayısı",
                        jwt: "JWT",
                        template_literal: "Şablon dizesi"
                    },
                    i = {
                        nan: "NaN"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Geçersiz değer: beklenen instanceof ".concat(e.expected, ", alınan ").concat(o);
                            return "Geçersiz değer: beklenen ".concat(t, ", alınan ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Geçersiz değer: beklenen ".concat(D(e.values[0]));
                            return "Geçersiz seçenek: aşağıdakilerden biri olmalı: ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Çok büyük: beklenen ".concat(null != (o = e.origin) ? o : "değer", " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "öğe");
                            return "Çok büyük: beklenen ".concat(null != (u = e.origin) ? u : "değer", " ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Çok küçük: beklenen ".concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "Çok küçük: beklenen ".concat(e.origin, " ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Geçersiz metin: "'.concat(e.prefix, '" ile başlamalı');
                            if ("ends_with" === e.format) return 'Geçersiz metin: "'.concat(e.suffix, '" ile bitmeli');
                            if ("includes" === e.format) return 'Geçersiz metin: "'.concat(e.includes, '" içermeli');
                            if ("regex" === e.format) return "Geçersiz metin: ".concat(e.pattern, " desenine uymalı");
                            return "Geçersiz ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "Geçersiz sayı: ".concat(e.divisor, " ile tam bölünebilmeli");
                        case "unrecognized_keys":
                            return "Tanınmayan anahtar".concat(e.keys.length > 1 ? "lar" : "", ": ").concat(l(e.keys, ", "));
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
        return e4()
    }, "uk", 0, e4, "ur", 0, function() {
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
                        cidrv4: "آئی پی وی 4 رینج",
                        cidrv6: "آئی پی وی 6 رینج",
                        base64: "بیس 64 ان کوڈڈ سٹرنگ",
                        base64url: "بیس 64 یو آر ایل ان کوڈڈ سٹرنگ",
                        json_string: "جے ایس او این سٹرنگ",
                        e164: "ای 164 نمبر",
                        jwt: "جے ڈبلیو ٹی",
                        template_literal: "ان پٹ"
                    },
                    i = {
                        nan: "NaN",
                        number: "نمبر",
                        array: "آرے",
                        null: "نل"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "غلط ان پٹ: instanceof ".concat(e.expected, " متوقع تھا، ").concat(o, " موصول ہوا");
                            return "غلط ان پٹ: ".concat(t, " متوقع تھا، ").concat(o, " موصول ہوا")
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "غلط ان پٹ: ".concat(D(e.values[0]), " متوقع تھا");
                            return "غلط آپشن: ".concat(l(e.values, "|"), " میں سے ایک متوقع تھا");
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "بہت بڑا: ".concat(null != (o = e.origin) ? o : "ویلیو", " کے ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "عناصر", " ہونے متوقع تھے");
                            return "بہت بڑا: ".concat(null != (u = e.origin) ? u : "ویلیو", " کا ").concat(n).concat(e.maximum.toString(), " ہونا متوقع تھا")
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "بہت چھوٹا: ".concat(e.origin, " کے ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit, " ہونے متوقع تھے");
                            return "بہت چھوٹا: ".concat(e.origin, " کا ").concat(n).concat(e.minimum.toString(), " ہونا متوقع تھا")
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'غلط سٹرنگ: "'.concat(e.prefix, '" سے شروع ہونا چاہیے');
                            if ("ends_with" === e.format) return 'غلط سٹرنگ: "'.concat(e.suffix, '" پر ختم ہونا چاہیے');
                            if ("includes" === e.format) return 'غلط سٹرنگ: "'.concat(e.includes, '" شامل ہونا چاہیے');
                            if ("regex" === e.format) return "غلط سٹرنگ: پیٹرن ".concat(e.pattern, " سے میچ ہونا چاہیے");
                            return "غلط ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "غلط نمبر: ".concat(e.divisor, " کا مضاعف ہونا چاہیے");
                        case "unrecognized_keys":
                            return "غیر تسلیم شدہ کی".concat(e.keys.length > 1 ? "ز" : "", ": ").concat(l(e.keys, "، "));
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
                        jwt: "JWT",
                        template_literal: "kirish"
                    },
                    i = {
                        nan: "NaN",
                        number: "raqam",
                        array: "massiv"
                    };
                return e => {
                    var r, a, o, c, u;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Noto‘g‘ri kirish: kutilgan instanceof ".concat(e.expected, ", qabul qilingan ").concat(o);
                            return "Noto‘g‘ri kirish: kutilgan ".concat(t, ", qabul qilingan ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Noto‘g‘ri kirish: kutilgan ".concat(D(e.values[0]));
                            return "Noto‘g‘ri variant: quyidagilardan biri kutilgan ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Juda katta: kutilgan ".concat(null != (o = e.origin) ? o : "qiymat", " ").concat(n).concat(e.maximum.toString(), " ").concat(i.unit, " ").concat(i.verb);
                            return "Juda katta: kutilgan ".concat(null != (c = e.origin) ? c : "qiymat", " ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Juda kichik: kutilgan ".concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit, " ").concat(i.verb);
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
                            return "Noma’lum kalit".concat(e.keys.length > 1 ? "lar" : "", ": ").concat(l(e.keys, ", "));
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
                        cidrv4: "dải IPv4",
                        cidrv6: "dải IPv6",
                        base64: "chuỗi mã hóa base64",
                        base64url: "chuỗi mã hóa base64url",
                        json_string: "chuỗi JSON",
                        e164: "số E.164",
                        jwt: "JWT",
                        template_literal: "đầu vào"
                    },
                    i = {
                        nan: "NaN",
                        number: "số",
                        array: "mảng"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Đầu vào không hợp lệ: mong đợi instanceof ".concat(e.expected, ", nhận được ").concat(o);
                            return "Đầu vào không hợp lệ: mong đợi ".concat(t, ", nhận được ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Đầu vào không hợp lệ: mong đợi ".concat(D(e.values[0]));
                            return "Tùy chọn không hợp lệ: mong đợi một trong các giá trị ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Quá lớn: mong đợi ".concat(null != (o = e.origin) ? o : "giá trị", " ").concat(i.verb, " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "phần tử");
                            return "Quá lớn: mong đợi ".concat(null != (u = e.origin) ? u : "giá trị", " ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Quá nhỏ: mong đợi ".concat(e.origin, " ").concat(i.verb, " ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "Quá nhỏ: mong đợi ".concat(e.origin, " ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return 'Chuỗi không hợp lệ: phải bắt đầu bằng "'.concat(e.prefix, '"');
                            if ("ends_with" === e.format) return 'Chuỗi không hợp lệ: phải kết thúc bằng "'.concat(e.suffix, '"');
                            if ("includes" === e.format) return 'Chuỗi không hợp lệ: phải bao gồm "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "Chuỗi không hợp lệ: phải khớp với mẫu ".concat(e.pattern);
                            return "".concat(null != (s = n[e.format]) ? s : e.format, " không hợp lệ");
                        case "not_multiple_of":
                            return "Số không hợp lệ: phải là bội số của ".concat(e.divisor);
                        case "unrecognized_keys":
                            return "Khóa không được nhận dạng: ".concat(l(e.keys, ", "));
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
                        cidrv4: "àgbègbè IPv4",
                        cidrv6: "àgbègbè IPv6",
                        base64: "ọ̀rọ̀ tí a kọ́ ní base64",
                        base64url: "ọ̀rọ̀ base64url",
                        json_string: "ọ̀rọ̀ JSON",
                        e164: "nọ́mbà E.164",
                        jwt: "JWT",
                        template_literal: "ẹ̀rọ ìbáwọlé"
                    },
                    i = {
                        nan: "NaN",
                        number: "nọ́mbà",
                        array: "akopọ"
                    };
                return e => {
                    var r, a, o, c;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "Ìbáwọlé aṣìṣe: a ní láti fi instanceof ".concat(e.expected, ", àmọ̀ a rí ").concat(o);
                            return "Ìbáwọlé aṣìṣe: a ní láti fi ".concat(t, ", àmọ̀ a rí ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "Ìbáwọlé aṣìṣe: a ní láti fi ".concat(D(e.values[0]));
                            return "Àṣàyàn aṣìṣe: yan ọ̀kan lára ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "Tó pọ̀ jù: a ní láti jẹ́ pé ".concat(null != (o = e.origin) ? o : "iye", " ").concat(i.verb, " ").concat(n).concat(e.maximum, " ").concat(i.unit);
                            return "Tó pọ̀ jù: a ní láti jẹ́ ".concat(n).concat(e.maximum)
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "Kéré ju: a ní láti jẹ́ pé ".concat(e.origin, " ").concat(i.verb, " ").concat(n).concat(e.minimum, " ").concat(i.unit);
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
                            return "Bọtìnì àìmọ̀: ".concat(l(e.keys, ", "));
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
                        cidrv4: "IPv4网段",
                        cidrv6: "IPv6网段",
                        base64: "base64编码字符串",
                        base64url: "base64url编码字符串",
                        json_string: "JSON字符串",
                        e164: "E.164号码",
                        jwt: "JWT",
                        template_literal: "输入"
                    },
                    i = {
                        nan: "NaN",
                        number: "数字",
                        array: "数组",
                        null: "空值(null)"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "无效输入：期望 instanceof ".concat(e.expected, "，实际接收 ").concat(o);
                            return "无效输入：期望 ".concat(t, "，实际接收 ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "无效输入：期望 ".concat(D(e.values[0]));
                            return "无效选项：期望以下之一 ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "数值过大：期望 ".concat(null != (o = e.origin) ? o : "值", " ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "个元素");
                            return "数值过大：期望 ".concat(null != (u = e.origin) ? u : "值", " ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "数值过小：期望 ".concat(e.origin, " ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "数值过小：期望 ".concat(e.origin, " ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return '无效字符串：必须以 "'.concat(e.prefix, '" 开头');
                            if ("ends_with" === e.format) return '无效字符串：必须以 "'.concat(e.suffix, '" 结尾');
                            if ("includes" === e.format) return '无效字符串：必须包含 "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "无效字符串：必须满足正则表达式 ".concat(e.pattern);
                            return "无效".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "无效数字：必须是 ".concat(e.divisor, " 的倍数");
                        case "unrecognized_keys":
                            return "出现未知的键(key): ".concat(l(e.keys, ", "));
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
                        cidrv4: "IPv4 範圍",
                        cidrv6: "IPv6 範圍",
                        base64: "base64 編碼字串",
                        base64url: "base64url 編碼字串",
                        json_string: "JSON 字串",
                        e164: "E.164 數值",
                        jwt: "JWT",
                        template_literal: "輸入"
                    },
                    i = {
                        nan: "NaN"
                    };
                return e => {
                    var r, a, o, c, u, s;
                    switch (e.code) {
                        case "invalid_type": {
                            let t = null != (r = i[e.expected]) ? r : e.expected,
                                n = F(e.input),
                                o = null != (a = i[n]) ? a : n;
                            if (/^[A-Z]/.test(e.expected)) return "無效的輸入值：預期為 instanceof ".concat(e.expected, "，但收到 ").concat(o);
                            return "無效的輸入值：預期為 ".concat(t, "，但收到 ").concat(o)
                        }
                        case "invalid_value":
                            if (1 === e.values.length) return "無效的輸入值：預期為 ".concat(D(e.values[0]));
                            return "無效的選項：預期為以下其中之一 ".concat(l(e.values, "|"));
                        case "too_big": {
                            let n = e.inclusive ? "<=" : "<",
                                i = t(e.origin);
                            if (i) return "數值過大：預期 ".concat(null != (o = e.origin) ? o : "值", " 應為 ").concat(n).concat(e.maximum.toString(), " ").concat(null != (c = i.unit) ? c : "個元素");
                            return "數值過大：預期 ".concat(null != (u = e.origin) ? u : "值", " 應為 ").concat(n).concat(e.maximum.toString())
                        }
                        case "too_small": {
                            let n = e.inclusive ? ">=" : ">",
                                i = t(e.origin);
                            if (i) return "數值過小：預期 ".concat(e.origin, " 應為 ").concat(n).concat(e.minimum.toString(), " ").concat(i.unit);
                            return "數值過小：預期 ".concat(e.origin, " 應為 ").concat(n).concat(e.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return '無效的字串：必須以 "'.concat(e.prefix, '" 開頭');
                            if ("ends_with" === e.format) return '無效的字串：必須以 "'.concat(e.suffix, '" 結尾');
                            if ("includes" === e.format) return '無效的字串：必須包含 "'.concat(e.includes, '"');
                            if ("regex" === e.format) return "無效的字串：必須符合格式 ".concat(e.pattern);
                            return "無效的 ".concat(null != (s = n[e.format]) ? s : e.format);
                        case "not_multiple_of":
                            return "無效的數字：必須為 ".concat(e.divisor, " 的倍數");
                        case "unrecognized_keys":
                            return "無法識別的鍵值".concat(e.keys.length > 1 ? "們" : "", "：").concat(l(e.keys, "、"));
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
    }], 685104);
    var e6 = e.i(685104);
    e.s([], 783088);
    var e1 = e.i(783088);
    e.s([], 6940), e.i(6940), e.i(734341);
    let e2 = (e, t) => {
            e.name = "$ZodError", Object.defineProperty(e, "_zod", {
                value: e._zod,
                enumerable: !1
            }), Object.defineProperty(e, "issues", {
                value: t,
                enumerable: !1
            }), e.message = JSON.stringify(t, s, 2), Object.defineProperty(e, "toString", {
                value: () => e.message,
                enumerable: !1
            })
        },
        e9 = n("$ZodError", e2),
        e3 = n("$ZodError", e2, {
            Parent: Error
        });

    function e8(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e => e.message,
            n = {},
            i = [];
        for (let r of e.issues) r.path.length > 0 ? (n[r.path[0]] = n[r.path[0]] || [], n[r.path[0]].push(t(r))) : i.push(t(r));
        return {
            formErrors: i,
            fieldErrors: n
        }
    }

    function e7(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e => e.message,
            n = {
                _errors: []
            },
            i = function(e) {
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [];
                for (let a of e.issues)
                    if ("invalid_union" === a.code && a.errors.length) a.errors.map(e => i({
                        issues: e
                    }, [...r, ...a.path]));
                    else if ("invalid_key" === a.code) i({
                    issues: a.issues
                }, [...r, ...a.path]);
                else if ("invalid_element" === a.code) i({
                    issues: a.issues
                }, [...r, ...a.path]);
                else {
                    let e = [...r, ...a.path];
                    if (0 === e.length) n._errors.push(t(a));
                    else {
                        let i = n,
                            r = 0;
                        for (; r < e.length;) {
                            let n = e[r];
                            r === e.length - 1 ? (i[n] = i[n] || {
                                _errors: []
                            }, i[n]._errors.push(t(a))) : i[n] = i[n] || {
                                _errors: []
                            }, i = i[n], r++
                        }
                    }
                }
            };
        return i(e), n
    }

    function e5(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e => e.message,
            n = {
                errors: []
            },
            i = function(e) {
                var r, a;
                let o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [];
                for (let c of e.issues)
                    if ("invalid_union" === c.code && c.errors.length) c.errors.map(e => i({
                        issues: e
                    }, [...o, ...c.path]));
                    else if ("invalid_key" === c.code) i({
                    issues: c.issues
                }, [...o, ...c.path]);
                else if ("invalid_element" === c.code) i({
                    issues: c.issues
                }, [...o, ...c.path]);
                else {
                    let e = [...o, ...c.path];
                    if (0 === e.length) {
                        n.errors.push(t(c));
                        continue
                    }
                    let i = n,
                        u = 0;
                    for (; u < e.length;) {
                        let n = e[u],
                            o = u === e.length - 1;
                        "string" == typeof n ? (null != i.properties || (i.properties = {}), null != (r = i.properties)[n] || (r[n] = {
                            errors: []
                        }), i = i.properties[n]) : (null != i.items || (i.items = []), null != (a = i.items)[n] || (a[n] = {
                            errors: []
                        }), i = i.items[n]), o && i.errors.push(t(c)), u++
                    }
                }
            };
        return i(e), n
    }

    function te(e) {
        let t = [];
        for (let n of e.map(e => "object" == typeof e ? e.key : e)) "number" == typeof n ? t.push("[".concat(n, "]")) : "symbol" == typeof n ? t.push("[".concat(JSON.stringify(String(n)), "]")) : /[^\w$]/.test(n) ? t.push("[".concat(JSON.stringify(n), "]")) : (t.length && t.push("."), t.push(n));
        return t.join("")
    }

    function tt(e) {
        let t = [];
        for (let i of [...e.issues].sort((e, t) => {
                var n, i;
                return (null != (n = e.path) ? n : []).length - (null != (i = t.path) ? i : []).length
            })) {
            var n;
            t.push("✖ ".concat(i.message)), (null == (n = i.path) ? void 0 : n.length) && t.push("  → at ".concat(te(i.path)))
        }
        return t.join("\n")
    }
    e.s(["$ZodError", 0, e9, "$ZodRealError", 0, e3, "flattenError", 0, e8, "formatError", 0, e7, "prettifyError", 0, tt, "toDotPath", 0, te, "treeifyError", 0, e5], 783865);
    let tn = e => (t, n, i, a) => {
            let o = i ? {
                    ...i,
                    async: !1
                } : {
                    async: !1
                },
                u = t._zod.run({
                    value: n,
                    issues: []
                }, o);
            if (u instanceof Promise) throw new r;
            if (u.issues.length) {
                var l;
                let t = new(null != (l = null == a ? void 0 : a.Err) ? l : e)(u.issues.map(e => C(e, o, c())));
                throw k(t, null == a ? void 0 : a.callee), t
            }
            return u.value
        },
        ti = tn(e3),
        tr = e => async (t, n, i, r) => {
            let a = i ? {
                    ...i,
                    async: !0
                } : {
                    async: !0
                },
                o = t._zod.run({
                    value: n,
                    issues: []
                }, a);
            if (o instanceof Promise && (o = await o), o.issues.length) {
                var u;
                let t = new(null != (u = null == r ? void 0 : r.Err) ? u : e)(o.issues.map(e => C(e, a, c())));
                throw k(t, null == r ? void 0 : r.callee), t
            }
            return o.value
        }, ta = tr(e3), to = e => (t, n, i) => {
            let a = i ? {
                    ...i,
                    async: !1
                } : {
                    async: !1
                },
                o = t._zod.run({
                    value: n,
                    issues: []
                }, a);
            if (o instanceof Promise) throw new r;
            return o.issues.length ? {
                success: !1,
                error: new(null != e ? e : e9)(o.issues.map(e => C(e, a, c())))
            } : {
                success: !0,
                data: o.value
            }
        }, tc = to(e3), tu = e => async (t, n, i) => {
            let r = i ? {
                    ...i,
                    async: !0
                } : {
                    async: !0
                },
                a = t._zod.run({
                    value: n,
                    issues: []
                }, r);
            return a instanceof Promise && (a = await a), a.issues.length ? {
                success: !1,
                error: new e(a.issues.map(e => C(e, r, c())))
            } : {
                success: !0,
                data: a.value
            }
        }, tl = tu(e3), ts = e => (t, n, i) => {
            let r = i ? {
                ...i,
                direction: "backward"
            } : {
                direction: "backward"
            };
            return tn(e)(t, n, r)
        }, td = ts(e3), tm = e => (t, n, i) => tn(e)(t, n, i), tf = tm(e3), tv = e => async (t, n, i) => {
            let r = i ? {
                ...i,
                direction: "backward"
            } : {
                direction: "backward"
            };
            return tr(e)(t, n, r)
        }, tp = tv(e3), tg = e => async (t, n, i) => tr(e)(t, n, i), th = tg(e3), t_ = e => (t, n, i) => {
            let r = i ? {
                ...i,
                direction: "backward"
            } : {
                direction: "backward"
            };
            return to(e)(t, n, r)
        }, ty = t_(e3), tb = e => (t, n, i) => to(e)(t, n, i), tk = tb(e3), tI = e => async (t, n, i) => {
            let r = i ? {
                ...i,
                direction: "backward"
            } : {
                direction: "backward"
            };
            return tu(e)(t, n, r)
        }, tx = tI(e3), tS = e => async (t, n, i) => tu(e)(t, n, i), tw = tS(e3);
    e.s(["_decode", 0, tm, "_decodeAsync", 0, tg, "_encode", 0, ts, "_encodeAsync", 0, tv, "_parse", 0, tn, "_parseAsync", 0, tr, "_safeDecode", 0, tb, "_safeDecodeAsync", 0, tS, "_safeEncode", 0, t_, "_safeEncodeAsync", 0, tI, "_safeParse", 0, to, "_safeParseAsync", 0, tu, "decode", 0, tf, "decodeAsync", 0, th, "encode", 0, td, "encodeAsync", 0, tp, "parse", 0, ti, "parseAsync", 0, ta, "safeDecode", 0, tk, "safeDecodeAsync", 0, tw, "safeEncode", 0, ty, "safeEncodeAsync", 0, tx, "safeParse", 0, tc, "safeParseAsync", 0, tl], 133017), e.i(133017), e.i(783865);
    let tz = n("$ZodCheck", (e, t) => {
            var n;
            null != e._zod || (e._zod = {}), e._zod.def = t, null != (n = e._zod).onattach || (n.onattach = [])
        }),
        tZ = {
            number: "number",
            bigint: "bigint",
            object: "date"
        },
        tU = n("$ZodCheckLessThan", (e, t) => {
            tz.init(e, t);
            let n = tZ[typeof t.value];
            e._zod.onattach.push(e => {
                var n;
                let i = e._zod.bag,
                    r = null != (n = t.inclusive ? i.maximum : i.exclusiveMaximum) ? n : 1 / 0;
                t.value < r && (t.inclusive ? i.maximum = t.value : i.exclusiveMaximum = t.value)
            }), e._zod.check = i => {
                (t.inclusive ? i.value <= t.value : i.value < t.value) || i.issues.push({
                    origin: n,
                    code: "too_big",
                    maximum: "object" == typeof t.value ? t.value.getTime() : t.value,
                    input: i.value,
                    inclusive: t.inclusive,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tO = n("$ZodCheckGreaterThan", (e, t) => {
            tz.init(e, t);
            let n = tZ[typeof t.value];
            e._zod.onattach.push(e => {
                var n;
                let i = e._zod.bag,
                    r = null != (n = t.inclusive ? i.minimum : i.exclusiveMinimum) ? n : -1 / 0;
                t.value > r && (t.inclusive ? i.minimum = t.value : i.exclusiveMinimum = t.value)
            }), e._zod.check = i => {
                (t.inclusive ? i.value >= t.value : i.value > t.value) || i.issues.push({
                    origin: n,
                    code: "too_small",
                    minimum: "object" == typeof t.value ? t.value.getTime() : t.value,
                    input: i.value,
                    inclusive: t.inclusive,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tj = n("$ZodCheckMultipleOf", (e, t) => {
            tz.init(e, t), e._zod.onattach.push(e => {
                var n;
                null != (n = e._zod.bag).multipleOf || (n.multipleOf = t.value)
            }), e._zod.check = n => {
                if (typeof n.value != typeof t.value) throw Error("Cannot mix number and bigint in multiple_of check.");
                ("bigint" == typeof n.value ? n.value % t.value === BigInt(0) : 0 === v(n.value, t.value)) || n.issues.push({
                    origin: typeof n.value,
                    code: "not_multiple_of",
                    divisor: t.value,
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tD = n("$ZodCheckNumberFormat", (e, t) => {
            var n;
            tz.init(e, t), t.format = t.format || "float64";
            let i = null == (n = t.format) ? void 0 : n.includes("int"),
                r = i ? "int" : "number",
                [a, o] = $[t.format];
            e._zod.onattach.push(e => {
                let n = e._zod.bag;
                n.format = t.format, n.minimum = a, n.maximum = o, i && (n.pattern = eZ)
            }), e._zod.check = n => {
                let c = n.value;
                if (i) {
                    if (!Number.isInteger(c)) return void n.issues.push({
                        expected: r,
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
                        origin: r,
                        inclusive: !0,
                        continue: !t.abort
                    }) : n.issues.push({
                        input: c,
                        code: "too_small",
                        minimum: Number.MIN_SAFE_INTEGER,
                        note: "Integers must be within the safe integer range.",
                        inst: e,
                        origin: r,
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
        tP = n("$ZodCheckBigIntFormat", (e, t) => {
            tz.init(e, t);
            let [n, i] = N[t.format];
            e._zod.onattach.push(e => {
                let r = e._zod.bag;
                r.format = t.format, r.minimum = n, r.maximum = i
            }), e._zod.check = r => {
                let a = r.value;
                a < n && r.issues.push({
                    origin: "bigint",
                    input: a,
                    code: "too_small",
                    minimum: n,
                    inclusive: !0,
                    inst: e,
                    continue: !t.abort
                }), a > i && r.issues.push({
                    origin: "bigint",
                    input: a,
                    code: "too_big",
                    maximum: i,
                    inclusive: !0,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        t$ = n("$ZodCheckMaxSize", (e, t) => {
            var n;
            tz.init(e, t), null != (n = e._zod.def).when || (n.when = e => {
                let t = e.value;
                return !m(t) && void 0 !== t.size
            }), e._zod.onattach.push(e => {
                var n;
                let i = null != (n = e._zod.bag.maximum) ? n : 1 / 0;
                t.maximum < i && (e._zod.bag.maximum = t.maximum)
            }), e._zod.check = n => {
                let i = n.value;
                i.size <= t.maximum || n.issues.push({
                    origin: J(i),
                    code: "too_big",
                    maximum: t.maximum,
                    inclusive: !0,
                    input: i,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tN = n("$ZodCheckMinSize", (e, t) => {
            var n;
            tz.init(e, t), null != (n = e._zod.def).when || (n.when = e => {
                let t = e.value;
                return !m(t) && void 0 !== t.size
            }), e._zod.onattach.push(e => {
                var n;
                let i = null != (n = e._zod.bag.minimum) ? n : -1 / 0;
                t.minimum > i && (e._zod.bag.minimum = t.minimum)
            }), e._zod.check = n => {
                let i = n.value;
                i.size >= t.minimum || n.issues.push({
                    origin: J(i),
                    code: "too_small",
                    minimum: t.minimum,
                    inclusive: !0,
                    input: i,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tE = n("$ZodCheckSizeEquals", (e, t) => {
            var n;
            tz.init(e, t), null != (n = e._zod.def).when || (n.when = e => {
                let t = e.value;
                return !m(t) && void 0 !== t.size
            }), e._zod.onattach.push(e => {
                let n = e._zod.bag;
                n.minimum = t.size, n.maximum = t.size, n.size = t.size
            }), e._zod.check = n => {
                let i = n.value,
                    r = i.size;
                if (r === t.size) return;
                let a = r > t.size;
                n.issues.push({
                    origin: J(i),
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
        tT = n("$ZodCheckMaxLength", (e, t) => {
            var n;
            tz.init(e, t), null != (n = e._zod.def).when || (n.when = e => {
                let t = e.value;
                return !m(t) && void 0 !== t.length
            }), e._zod.onattach.push(e => {
                var n;
                let i = null != (n = e._zod.bag.maximum) ? n : 1 / 0;
                t.maximum < i && (e._zod.bag.maximum = t.maximum)
            }), e._zod.check = n => {
                let i = n.value;
                if (i.length <= t.maximum) return;
                let r = R(i);
                n.issues.push({
                    origin: r,
                    code: "too_big",
                    maximum: t.maximum,
                    inclusive: !0,
                    input: i,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tA = n("$ZodCheckMinLength", (e, t) => {
            var n;
            tz.init(e, t), null != (n = e._zod.def).when || (n.when = e => {
                let t = e.value;
                return !m(t) && void 0 !== t.length
            }), e._zod.onattach.push(e => {
                var n;
                let i = null != (n = e._zod.bag.minimum) ? n : -1 / 0;
                t.minimum > i && (e._zod.bag.minimum = t.minimum)
            }), e._zod.check = n => {
                let i = n.value;
                if (i.length >= t.minimum) return;
                let r = R(i);
                n.issues.push({
                    origin: r,
                    code: "too_small",
                    minimum: t.minimum,
                    inclusive: !0,
                    input: i,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tL = n("$ZodCheckLengthEquals", (e, t) => {
            var n;
            tz.init(e, t), null != (n = e._zod.def).when || (n.when = e => {
                let t = e.value;
                return !m(t) && void 0 !== t.length
            }), e._zod.onattach.push(e => {
                let n = e._zod.bag;
                n.minimum = t.length, n.maximum = t.length, n.length = t.length
            }), e._zod.check = n => {
                let i = n.value,
                    r = i.length;
                if (r === t.length) return;
                let a = R(i),
                    o = r > t.length;
                n.issues.push({
                    origin: a,
                    ...o ? {
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
        tC = n("$ZodCheckStringFormat", (e, t) => {
            var n, i;
            tz.init(e, t), e._zod.onattach.push(e => {
                let n = e._zod.bag;
                (n.format = t.format, t.pattern) && (null != n.patterns || (n.patterns = new Set), n.patterns.add(t.pattern))
            }), t.pattern ? null != (n = e._zod).check || (n.check = n => {
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
            }) : null != (i = e._zod).check || (i.check = () => {})
        }),
        tJ = n("$ZodCheckRegex", (e, t) => {
            tC.init(e, t), e._zod.check = n => {
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
        tR = n("$ZodCheckLowerCase", (e, t) => {
            null != t.pattern || (t.pattern = eP), tC.init(e, t)
        }),
        tF = n("$ZodCheckUpperCase", (e, t) => {
            null != t.pattern || (t.pattern = e$), tC.init(e, t)
        }),
        tM = n("$ZodCheckIncludes", (e, t) => {
            tz.init(e, t);
            let n = U(t.includes),
                i = new RegExp("number" == typeof t.position ? "^.{".concat(t.position, "}").concat(n) : n);
            t.pattern = i, e._zod.onattach.push(e => {
                let t = e._zod.bag;
                null != t.patterns || (t.patterns = new Set), t.patterns.add(i)
            }), e._zod.check = n => {
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
        tW = n("$ZodCheckStartsWith", (e, t) => {
            tz.init(e, t);
            let n = new RegExp("^".concat(U(t.prefix), ".*"));
            null != t.pattern || (t.pattern = n), e._zod.onattach.push(e => {
                let t = e._zod.bag;
                null != t.patterns || (t.patterns = new Set), t.patterns.add(n)
            }), e._zod.check = n => {
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
        tG = n("$ZodCheckEndsWith", (e, t) => {
            tz.init(e, t);
            let n = new RegExp(".*".concat(U(t.suffix), "$"));
            null != t.pattern || (t.pattern = n), e._zod.onattach.push(e => {
                let t = e._zod.bag;
                null != t.patterns || (t.patterns = new Set), t.patterns.add(n)
            }), e._zod.check = n => {
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

    function tK(e, t, n) {
        e.issues.length && t.issues.push(...A(n, e.issues))
    }
    let tB = n("$ZodCheckProperty", (e, t) => {
            tz.init(e, t), e._zod.check = e => {
                let n = t.schema._zod.run({
                    value: e.value[t.property],
                    issues: []
                }, {});
                if (n instanceof Promise) return n.then(n => tK(n, e, t.property));
                tK(n, e, t.property)
            }
        }),
        tV = n("$ZodCheckMimeType", (e, t) => {
            tz.init(e, t);
            let n = new Set(t.mime);
            e._zod.onattach.push(e => {
                e._zod.bag.mime = t.mime
            }), e._zod.check = i => {
                n.has(i.value.type) || i.issues.push({
                    code: "invalid_value",
                    values: t.mime,
                    input: i.value.type,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tX = n("$ZodCheckOverwrite", (e, t) => {
            tz.init(e, t), e._zod.check = e => {
                e.value = t.tx(e.value)
            }
        });
    e.s(["$ZodCheck", 0, tz, "$ZodCheckBigIntFormat", 0, tP, "$ZodCheckEndsWith", 0, tG, "$ZodCheckGreaterThan", 0, tO, "$ZodCheckIncludes", 0, tM, "$ZodCheckLengthEquals", 0, tL, "$ZodCheckLessThan", 0, tU, "$ZodCheckLowerCase", 0, tR, "$ZodCheckMaxLength", 0, tT, "$ZodCheckMaxSize", 0, t$, "$ZodCheckMimeType", 0, tV, "$ZodCheckMinLength", 0, tA, "$ZodCheckMinSize", 0, tN, "$ZodCheckMultipleOf", 0, tj, "$ZodCheckNumberFormat", 0, tD, "$ZodCheckOverwrite", 0, tX, "$ZodCheckProperty", 0, tB, "$ZodCheckRegex", 0, tJ, "$ZodCheckSizeEquals", 0, tE, "$ZodCheckStartsWith", 0, tW, "$ZodCheckStringFormat", 0, tC, "$ZodCheckUpperCase", 0, tF], 937793);
    class tq {
        indented(e) {
            this.indent += 1, e(this), this.indent -= 1
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
            return Function(...null === this || void 0 === this ? void 0 : this.args, [...(null != (e = null === this || void 0 === this ? void 0 : this.content) ? e : [""]).map(e => "  ".concat(e))].join("\n"))
        }
        constructor(e = []) {
            this.content = [], this.indent = 0, this && (this.args = e)
        }
    }
    e.s(["Doc", 0, tq], 706089);
    let tY = {
        major: 4,
        minor: 4,
        patch: 3
    };
    e.s(["version", 0, tY], 524219);
    let tH = n("$ZodType", (e, t) => {
            var n, i, a;
            null != e || (e = {}), e._zod.def = t, e._zod.bag = e._zod.bag || {}, e._zod.version = tY;
            let o = [...null != (n = e._zod.def.checks) ? n : []];
            for (let t of (e._zod.traits.has("$ZodCheck") && o.unshift(e), o))
                for (let n of t._zod.onattach) n(e);
            if (0 === o.length) null != (i = e._zod).deferred || (i.deferred = []), null == (a = e._zod.deferred) || a.push(() => {
                e._zod.run = e._zod.parse
            });
            else {
                let t = (e, t, n) => {
                        let i, a = E(e);
                        for (let o of t) {
                            if (o._zod.def.when) {
                                if (T(e) || !o._zod.def.when(e)) continue
                            } else if (a) continue;
                            let t = e.issues.length,
                                c = o._zod.check(e);
                            if (c instanceof Promise && (null == n ? void 0 : n.async) === !1) throw new r;
                            if (i || c instanceof Promise) i = (null != i ? i : Promise.resolve()).then(async () => {
                                await c, e.issues.length !== t && (a || (a = E(e, t)))
                            });
                            else {
                                if (e.issues.length === t) continue;
                                a || (a = E(e, t))
                            }
                        }
                        return i ? i.then(() => e) : e
                    },
                    n = (n, i, a) => {
                        if (E(n)) return n.aborted = !0, n;
                        let c = t(i, o, a);
                        if (c instanceof Promise) {
                            if (!1 === a.async) throw new r;
                            return c.then(t => e._zod.parse(t, a))
                        }
                        return e._zod.parse(c, a)
                    };
                e._zod.run = (i, a) => {
                    if (a.skipChecks) return e._zod.parse(i, a);
                    if ("backward" === a.direction) {
                        let t = e._zod.parse({
                            value: i.value,
                            issues: []
                        }, {
                            ...a,
                            skipChecks: !0
                        });
                        return t instanceof Promise ? t.then(e => n(e, i, a)) : n(t, i, a)
                    }
                    let c = e._zod.parse(i, a);
                    if (c instanceof Promise) {
                        if (!1 === a.async) throw new r;
                        return c.then(e => t(e, o, a))
                    }
                    return t(c, o, a)
                }
            }
            g(e, "~standard", () => ({
                validate: t => {
                    try {
                        var n;
                        let i = tc(e, t);
                        return i.success ? {
                            value: i.data
                        } : {
                            issues: null == (n = i.error) ? void 0 : n.issues
                        }
                    } catch (n) {
                        return tl(e, t).then(e => {
                            var t;
                            return e.success ? {
                                value: e.data
                            } : {
                                issues: null == (t = e.error) ? void 0 : t.issues
                            }
                        })
                    }
                },
                vendor: "zod",
                version: 1
            }))
        }),
        tQ = n("$ZodString", (e, t) => {
            var n, i, r;
            tH.init(e, t), e._zod.pattern = null != (n = [...null != (i = null == e || null == (r = e._zod.bag) ? void 0 : r.patterns) ? i : []].pop()) ? n : ew(e._zod.bag), e._zod.parse = (n, i) => {
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
        t0 = n("$ZodStringFormat", (e, t) => {
            tC.init(e, t), tQ.init(e, t)
        }),
        t4 = n("$ZodGUID", (e, t) => {
            null != t.pattern || (t.pattern = ei), t0.init(e, t)
        }),
        t6 = n("$ZodUUID", (e, t) => {
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
                null != t.pattern || (t.pattern = er(e))
            } else null != t.pattern || (t.pattern = er());
            t0.init(e, t)
        }),
        t1 = n("$ZodEmail", (e, t) => {
            null != t.pattern || (t.pattern = eu), t0.init(e, t)
        }),
        t2 = n("$ZodURL", (e, t) => {
            t0.init(e, t), e._zod.check = n => {
                try {
                    var i;
                    let r = n.value.trim();
                    if (!t.normalize && (null == (i = t.protocol) ? void 0 : i.source) === e_.source && !/^https?:\/\//i.test(r)) return void n.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid URL format",
                        input: n.value,
                        inst: e,
                        continue: !t.abort
                    });
                    let a = new URL(r);
                    t.hostname && (t.hostname.lastIndex = 0, t.hostname.test(a.hostname) || n.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid hostname",
                        pattern: t.hostname.source,
                        input: n.value,
                        inst: e,
                        continue: !t.abort
                    })), t.protocol && (t.protocol.lastIndex = 0, t.protocol.test(a.protocol.endsWith(":") ? a.protocol.slice(0, -1) : a.protocol) || n.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid protocol",
                        pattern: t.protocol.source,
                        input: n.value,
                        inst: e,
                        continue: !t.abort
                    })), t.normalize ? n.value = a.href : n.value = r;
                    return
                } catch (i) {
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
        t9 = n("$ZodEmoji", (e, t) => {
            null != t.pattern || (t.pattern = es()), t0.init(e, t)
        }),
        t3 = n("$ZodNanoID", (e, t) => {
            null != t.pattern || (t.pattern = et), t0.init(e, t)
        }),
        t8 = n("$ZodCUID", (e, t) => {
            null != t.pattern || (t.pattern = q), t0.init(e, t)
        }),
        t7 = n("$ZodCUID2", (e, t) => {
            null != t.pattern || (t.pattern = Y), t0.init(e, t)
        }),
        t5 = n("$ZodULID", (e, t) => {
            null != t.pattern || (t.pattern = H), t0.init(e, t)
        }),
        ne = n("$ZodXID", (e, t) => {
            null != t.pattern || (t.pattern = Q), t0.init(e, t)
        }),
        nt = n("$ZodKSUID", (e, t) => {
            null != t.pattern || (t.pattern = ee), t0.init(e, t)
        }),
        nn = n("$ZodISODateTime", (e, t) => {
            null != t.pattern || (t.pattern = eS(t)), t0.init(e, t)
        }),
        ni = n("$ZodISODate", (e, t) => {
            null != t.pattern || (t.pattern = ek), t0.init(e, t)
        }),
        nr = n("$ZodISOTime", (e, t) => {
            null != t.pattern || (t.pattern = ex(t)), t0.init(e, t)
        }),
        na = n("$ZodISODuration", (e, t) => {
            null != t.pattern || (t.pattern = en), t0.init(e, t)
        }),
        no = n("$ZodIPv4", (e, t) => {
            null != t.pattern || (t.pattern = ed), t0.init(e, t), e._zod.bag.format = "ipv4"
        }),
        nc = n("$ZodIPv6", (e, t) => {
            null != t.pattern || (t.pattern = em), t0.init(e, t), e._zod.bag.format = "ipv6", e._zod.check = n => {
                try {
                    new URL("http://[".concat(n.value, "]"))
                } catch (i) {
                    n.issues.push({
                        code: "invalid_format",
                        format: "ipv6",
                        input: n.value,
                        inst: e,
                        continue: !t.abort
                    })
                }
            }
        }),
        nu = n("$ZodMAC", (e, t) => {
            null != t.pattern || (t.pattern = ef(t.delimiter)), t0.init(e, t), e._zod.bag.format = "mac"
        }),
        nl = n("$ZodCIDRv4", (e, t) => {
            null != t.pattern || (t.pattern = ev), t0.init(e, t)
        }),
        ns = n("$ZodCIDRv6", (e, t) => {
            null != t.pattern || (t.pattern = ep), t0.init(e, t), e._zod.check = n => {
                let i = n.value.split("/");
                try {
                    if (2 !== i.length) throw Error();
                    let [e, t] = i;
                    if (!t) throw Error();
                    let n = Number(t);
                    if ("".concat(n) !== t || n < 0 || n > 128) throw Error();
                    new URL("http://[".concat(e, "]"))
                } catch (i) {
                    n.issues.push({
                        code: "invalid_format",
                        format: "cidrv6",
                        input: n.value,
                        inst: e,
                        continue: !t.abort
                    })
                }
            }
        });

    function nd(e) {
        if ("" === e) return !0;
        if (/\s/.test(e) || e.length % 4 != 0) return !1;
        try {
            return atob(e), !0
        } catch (e) {
            return !1
        }
    }
    let nm = n("$ZodBase64", (e, t) => {
        null != t.pattern || (t.pattern = eg), t0.init(e, t), e._zod.bag.contentEncoding = "base64", e._zod.check = n => {
            nd(n.value) || n.issues.push({
                code: "invalid_format",
                format: "base64",
                input: n.value,
                inst: e,
                continue: !t.abort
            })
        }
    });

    function nf(e) {
        if (!eh.test(e)) return !1;
        let t = e.replace(/[-_]/g, e => "-" === e ? "+" : "/");
        return nd(t.padEnd(4 * Math.ceil(t.length / 4), "="))
    }
    let nv = n("$ZodBase64URL", (e, t) => {
            null != t.pattern || (t.pattern = eh), t0.init(e, t), e._zod.bag.contentEncoding = "base64url", e._zod.check = n => {
                nf(n.value) || n.issues.push({
                    code: "invalid_format",
                    format: "base64url",
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        np = n("$ZodE164", (e, t) => {
            null != t.pattern || (t.pattern = ey), t0.init(e, t)
        });

    function ng(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null;
        try {
            let n = e.split(".");
            if (3 !== n.length) return !1;
            let [i] = n;
            if (!i) return !1;
            let r = JSON.parse(atob(i));
            if ("typ" in r && (null == r ? void 0 : r.typ) !== "JWT" || !r.alg || t && (!("alg" in r) || r.alg !== t)) return !1;
            return !0
        } catch (e) {
            return !1
        }
    }
    let nh = n("$ZodJWT", (e, t) => {
            t0.init(e, t), e._zod.check = n => {
                ng(n.value, t.alg) || n.issues.push({
                    code: "invalid_format",
                    format: "jwt",
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        n_ = n("$ZodCustomStringFormat", (e, t) => {
            t0.init(e, t), e._zod.check = n => {
                t.fn(n.value) || n.issues.push({
                    code: "invalid_format",
                    format: t.format,
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        ny = n("$ZodNumber", (e, t) => {
            var n;
            tH.init(e, t), e._zod.pattern = null != (n = e._zod.bag.pattern) ? n : eU, e._zod.parse = (n, i) => {
                if (t.coerce) try {
                    n.value = Number(n.value)
                } catch (e) {}
                let r = n.value;
                if ("number" == typeof r && !Number.isNaN(r) && Number.isFinite(r)) return n;
                let a = "number" == typeof r ? Number.isNaN(r) ? "NaN" : Number.isFinite(r) ? void 0 : "Infinity" : void 0;
                return n.issues.push({
                    expected: "number",
                    code: "invalid_type",
                    input: r,
                    inst: e,
                    ...a ? {
                        received: a
                    } : {}
                }), n
            }
        }),
        nb = n("$ZodNumberFormat", (e, t) => {
            tD.init(e, t), ny.init(e, t)
        }),
        nk = n("$ZodBoolean", (e, t) => {
            tH.init(e, t), e._zod.pattern = eO, e._zod.parse = (n, i) => {
                if (t.coerce) try {
                    n.value = !!n.value
                } catch (e) {}
                let r = n.value;
                return "boolean" == typeof r || n.issues.push({
                    expected: "boolean",
                    code: "invalid_type",
                    input: r,
                    inst: e
                }), n
            }
        }),
        nI = n("$ZodBigInt", (e, t) => {
            tH.init(e, t), e._zod.pattern = ez, e._zod.parse = (n, i) => {
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
        nx = n("$ZodBigIntFormat", (e, t) => {
            tP.init(e, t), nI.init(e, t)
        }),
        nS = n("$ZodSymbol", (e, t) => {
            tH.init(e, t), e._zod.parse = (t, n) => {
                let i = t.value;
                return "symbol" == typeof i || t.issues.push({
                    expected: "symbol",
                    code: "invalid_type",
                    input: i,
                    inst: e
                }), t
            }
        }),
        nw = n("$ZodUndefined", (e, t) => {
            tH.init(e, t), e._zod.pattern = eD, e._zod.values = new Set([void 0]), e._zod.parse = (t, n) => {
                let i = t.value;
                return void 0 === i || t.issues.push({
                    expected: "undefined",
                    code: "invalid_type",
                    input: i,
                    inst: e
                }), t
            }
        }),
        nz = n("$ZodNull", (e, t) => {
            tH.init(e, t), e._zod.pattern = ej, e._zod.values = new Set([null]), e._zod.parse = (t, n) => {
                let i = t.value;
                return null === i || t.issues.push({
                    expected: "null",
                    code: "invalid_type",
                    input: i,
                    inst: e
                }), t
            }
        }),
        nZ = n("$ZodAny", (e, t) => {
            tH.init(e, t), e._zod.parse = e => e
        }),
        nU = n("$ZodUnknown", (e, t) => {
            tH.init(e, t), e._zod.parse = e => e
        }),
        nO = n("$ZodNever", (e, t) => {
            tH.init(e, t), e._zod.parse = (t, n) => (t.issues.push({
                expected: "never",
                code: "invalid_type",
                input: t.value,
                inst: e
            }), t)
        }),
        nj = n("$ZodVoid", (e, t) => {
            tH.init(e, t), e._zod.parse = (t, n) => {
                let i = t.value;
                return void 0 === i || t.issues.push({
                    expected: "void",
                    code: "invalid_type",
                    input: i,
                    inst: e
                }), t
            }
        }),
        nD = n("$ZodDate", (e, t) => {
            tH.init(e, t), e._zod.parse = (n, i) => {
                if (t.coerce) try {
                    n.value = new Date(n.value)
                } catch (e) {}
                let r = n.value,
                    a = r instanceof Date;
                return a && !Number.isNaN(r.getTime()) || n.issues.push({
                    expected: "date",
                    code: "invalid_type",
                    input: r,
                    ...a ? {
                        received: "Invalid Date"
                    } : {},
                    inst: e
                }), n
            }
        });

    function nP(e, t, n) {
        e.issues.length && t.issues.push(...A(n, e.issues)), t.value[n] = e.value
    }
    let n$ = n("$ZodArray", (e, t) => {
        tH.init(e, t), e._zod.parse = (n, i) => {
            let r = n.value;
            if (!Array.isArray(r)) return n.issues.push({
                expected: "array",
                code: "invalid_type",
                input: r,
                inst: e
            }), n;
            n.value = Array(r.length);
            let a = [];
            for (let e = 0; e < r.length; e++) {
                let o = r[e],
                    c = t.element._zod.run({
                        value: o,
                        issues: []
                    }, i);
                c instanceof Promise ? a.push(c.then(t => nP(t, n, e))) : nP(c, n, e)
            }
            return a.length ? Promise.all(a).then(() => n) : n
        }
    });

    function nN(e, t, n, i, r, a) {
        let o = n in i;
        if (e.issues.length) {
            if (r && a && !o) return;
            t.issues.push(...A(n, e.issues))
        }
        if (!o && !r) {
            e.issues.length || t.issues.push({
                code: "invalid_type",
                expected: "nonoptional",
                input: void 0,
                path: [n]
            });
            return
        }
        void 0 === e.value ? o && (t.value[n] = void 0) : t.value[n] = e.value
    }

    function nE(e) {
        let t = Object.keys(e.shape);
        for (let o of t) {
            var n, i, r, a;
            if (!(null == (a = e.shape) || null == (r = a[o]) || null == (i = r._zod) || null == (n = i.traits) ? void 0 : n.has("$ZodType"))) throw Error('Invalid element at key "'.concat(o, '": expected a Zod schema'))
        }
        let o = P(e.shape);
        return {
            ...e,
            keys: t,
            keySet: new Set(t),
            numKeys: t.length,
            optionalKeys: new Set(o)
        }
    }

    function nT(e, t, n, i, r, a) {
        let o = [],
            c = r.keySet,
            u = r.catchall._zod,
            l = u.def.type,
            s = "optional" === u.optin,
            d = "optional" === u.optout;
        for (let r in t) {
            if ("__proto__" === r || c.has(r)) continue;
            if ("never" === l) {
                o.push(r);
                continue
            }
            let a = u.run({
                value: t[r],
                issues: []
            }, i);
            a instanceof Promise ? e.push(a.then(e => nN(e, n, r, t, s, d))) : nN(a, n, r, t, s, d)
        }
        return (o.length && n.issues.push({
            code: "unrecognized_keys",
            keys: o,
            input: t,
            inst: a
        }), e.length) ? Promise.all(e).then(() => n) : n
    }
    let nA = n("$ZodObject", (e, t) => {
            let n;
            tH.init(e, t);
            let i = Object.getOwnPropertyDescriptor(t, "shape");
            if (!(null == i ? void 0 : i.get)) {
                let e = t.shape;
                Object.defineProperty(t, "shape", {
                    get: () => {
                        let n = {
                            ...e
                        };
                        return Object.defineProperty(t, "shape", {
                            value: n
                        }), n
                    }
                })
            }
            let r = d(() => nE(t));
            g(e._zod, "propValues", () => {
                let e = t.shape,
                    n = {};
                for (let t in e) {
                    let i = e[t]._zod;
                    if (i.values) {
                        for (let e of (null != n[t] || (n[t] = new Set), i.values)) n[t].add(e)
                    }
                }
                return n
            });
            let a = t.catchall;
            e._zod.parse = (t, i) => {
                null != n || (n = r.value);
                let o = t.value;
                if (!I(o)) return t.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: o,
                    inst: e
                }), t;
                t.value = {};
                let c = [],
                    u = n.shape;
                for (let e of n.keys) {
                    let n = u[e],
                        r = "optional" === n._zod.optin,
                        a = "optional" === n._zod.optout,
                        l = n._zod.run({
                            value: o[e],
                            issues: []
                        }, i);
                    l instanceof Promise ? c.push(l.then(n => nN(n, t, e, o, r, a))) : nN(l, t, e, o, r, a)
                }
                return a ? nT(c, o, t, i, r.value, e) : c.length ? Promise.all(c).then(() => t) : t
            }
        }),
        nL = n("$ZodObjectJIT", (e, t) => {
            let n, i;
            nA.init(e, t);
            let r = e._zod.parse,
                a = d(() => nE(t)),
                c = !o.jitless,
                u = c && x.value,
                l = t.catchall;
            e._zod.parse = (o, s) => {
                null != i || (i = a.value);
                let d = o.value;
                return I(d) ? c && u && (null == s ? void 0 : s.async) === !1 && !0 !== s.jitless ? (n || (n = (e => {
                    let t = new tq(["shape", "payload", "ctx"]),
                        n = a.value,
                        i = e => {
                            let t = y(e);
                            return "shape[".concat(t, "]._zod.run({ value: input[").concat(t, "], issues: [] }, ctx)")
                        };
                    t.write("const input = payload.value;");
                    let r = Object.create(null),
                        o = 0;
                    for (let e of n.keys) r[e] = "key_".concat(o++);
                    for (let a of (t.write("const newResult = {};"), n.keys)) {
                        var c, u;
                        let n = r[a],
                            o = y(a),
                            l = e[a],
                            s = (null == l || null == (c = l._zod) ? void 0 : c.optin) === "optional",
                            d = (null == l || null == (u = l._zod) ? void 0 : u.optout) === "optional";
                        t.write("const ".concat(n, " = ").concat(i(a), ";")), s && d ? t.write("\n        if (".concat(n, ".issues.length) {\n          if (").concat(o, " in input) {\n            payload.issues = payload.issues.concat(").concat(n, ".issues.map(iss => ({\n              ...iss,\n              path: iss.path ? [").concat(o, ", ...iss.path] : [").concat(o, "]\n            })));\n          }\n        }\n        \n        if (").concat(n, ".value === undefined) {\n          if (").concat(o, " in input) {\n            newResult[").concat(o, "] = undefined;\n          }\n        } else {\n          newResult[").concat(o, "] = ").concat(n, ".value;\n        }\n        \n      ")) : s ? t.write("\n        if (".concat(n, ".issues.length) {\n          payload.issues = payload.issues.concat(").concat(n, ".issues.map(iss => ({\n            ...iss,\n            path: iss.path ? [").concat(o, ", ...iss.path] : [").concat(o, "]\n          })));\n        }\n        \n        if (").concat(n, ".value === undefined) {\n          if (").concat(o, " in input) {\n            newResult[").concat(o, "] = undefined;\n          }\n        } else {\n          newResult[").concat(o, "] = ").concat(n, ".value;\n        }\n        \n      ")) : t.write("\n        const ".concat(n, "_present = ").concat(o, " in input;\n        if (").concat(n, ".issues.length) {\n          payload.issues = payload.issues.concat(").concat(n, ".issues.map(iss => ({\n            ...iss,\n            path: iss.path ? [").concat(o, ", ...iss.path] : [").concat(o, "]\n          })));\n        }\n        if (!").concat(n, "_present && !").concat(n, '.issues.length) {\n          payload.issues.push({\n            code: "invalid_type",\n            expected: "nonoptional",\n            input: undefined,\n            path: [').concat(o, "]\n          });\n        }\n\n        if (").concat(n, "_present) {\n          if (").concat(n, ".value === undefined) {\n            newResult[").concat(o, "] = undefined;\n          } else {\n            newResult[").concat(o, "] = ").concat(n, ".value;\n          }\n        }\n\n      "))
                    }
                    t.write("payload.value = newResult;"), t.write("return payload;");
                    let l = t.compile();
                    return (t, n) => l(e, t, n)
                })(t.shape)), o = n(o, s), l) ? nT([], d, o, s, i, e) : o : r(o, s) : (o.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: d,
                    inst: e
                }), o)
            }
        });

    function nC(e, t, n, i) {
        for (let n of e)
            if (0 === n.issues.length) return t.value = n.value, t;
        let r = e.filter(e => !E(e));
        return 1 === r.length ? (t.value = r[0].value, r[0]) : (t.issues.push({
            code: "invalid_union",
            input: t.value,
            inst: n,
            errors: e.map(e => e.issues.map(e => C(e, i, c())))
        }), t)
    }
    let nJ = n("$ZodUnion", (e, t) => {
        tH.init(e, t), g(e._zod, "optin", () => t.options.some(e => "optional" === e._zod.optin) ? "optional" : void 0), g(e._zod, "optout", () => t.options.some(e => "optional" === e._zod.optout) ? "optional" : void 0), g(e._zod, "values", () => {
            if (t.options.every(e => e._zod.values)) return new Set(t.options.flatMap(e => Array.from(e._zod.values)))
        }), g(e._zod, "pattern", () => {
            if (t.options.every(e => e._zod.pattern)) {
                let e = t.options.map(e => e._zod.pattern);
                return new RegExp("^(".concat(e.map(e => f(e.source)).join("|"), ")$"))
            }
        });
        let n = 1 === t.options.length ? t.options[0]._zod.run : null;
        e._zod.parse = (i, r) => {
            if (n) return n(i, r);
            let a = !1,
                o = [];
            for (let e of t.options) {
                let t = e._zod.run({
                    value: i.value,
                    issues: []
                }, r);
                if (t instanceof Promise) o.push(t), a = !0;
                else {
                    if (0 === t.issues.length) return t;
                    o.push(t)
                }
            }
            return a ? Promise.all(o).then(t => nC(t, i, e, r)) : nC(o, i, e, r)
        }
    });

    function nR(e, t, n, i) {
        let r = e.filter(e => 0 === e.issues.length);
        return 1 === r.length ? t.value = r[0].value : 0 === r.length ? t.issues.push({
            code: "invalid_union",
            input: t.value,
            inst: n,
            errors: e.map(e => e.issues.map(e => C(e, i, c())))
        }) : t.issues.push({
            code: "invalid_union",
            input: t.value,
            inst: n,
            errors: [],
            inclusive: !1
        }), t
    }
    let nF = n("$ZodXor", (e, t) => {
            nJ.init(e, t), t.inclusive = !1;
            let n = 1 === t.options.length ? t.options[0]._zod.run : null;
            e._zod.parse = (i, r) => {
                if (n) return n(i, r);
                let a = !1,
                    o = [];
                for (let e of t.options) {
                    let t = e._zod.run({
                        value: i.value,
                        issues: []
                    }, r);
                    t instanceof Promise ? (o.push(t), a = !0) : o.push(t)
                }
                return a ? Promise.all(o).then(t => nR(t, i, e, r)) : nR(o, i, e, r)
            }
        }),
        nM = n("$ZodDiscriminatedUnion", (e, t) => {
            t.inclusive = !1, nJ.init(e, t);
            let n = e._zod.parse;
            g(e._zod, "propValues", () => {
                let e = {};
                for (let n of t.options) {
                    let i = n._zod.propValues;
                    if (!i || 0 === Object.keys(i).length) throw Error('Invalid discriminated union option at index "'.concat(t.options.indexOf(n), '"'));
                    for (let [t, n] of Object.entries(i))
                        for (let i of (e[t] || (e[t] = new Set), n)) e[t].add(i)
                }
                return e
            });
            let i = d(() => {
                let e = t.options,
                    n = new Map;
                for (let r of e) {
                    var i;
                    let e = null == (i = r._zod.propValues) ? void 0 : i[t.discriminator];
                    if (!e || 0 === e.size) throw Error('Invalid discriminated union option at index "'.concat(t.options.indexOf(r), '"'));
                    for (let t of e) {
                        if (n.has(t)) throw Error('Duplicate discriminator value "'.concat(String(t), '"'));
                        n.set(t, r)
                    }
                }
                return n
            });
            e._zod.parse = (r, a) => {
                let o = r.value;
                if (!I(o)) return r.issues.push({
                    code: "invalid_type",
                    expected: "object",
                    input: o,
                    inst: e
                }), r;
                let c = i.value.get(null == o ? void 0 : o[t.discriminator]);
                return c ? c._zod.run(r, a) : t.unionFallback || "backward" === a.direction ? n(r, a) : (r.issues.push({
                    code: "invalid_union",
                    errors: [],
                    note: "No matching discriminator",
                    discriminator: t.discriminator,
                    options: Array.from(i.value.keys()),
                    input: o,
                    path: [t.discriminator],
                    inst: e
                }), r)
            }
        }),
        nW = n("$ZodIntersection", (e, t) => {
            tH.init(e, t), e._zod.parse = (e, n) => {
                let i = e.value,
                    r = t.left._zod.run({
                        value: i,
                        issues: []
                    }, n),
                    a = t.right._zod.run({
                        value: i,
                        issues: []
                    }, n);
                return r instanceof Promise || a instanceof Promise ? Promise.all([r, a]).then(t => {
                    let [n, i] = t;
                    return nG(e, n, i)
                }) : nG(e, r, a)
            }
        });

    function nG(e, t, n) {
        let i, r = new Map;
        for (let n of t.issues)
            if ("unrecognized_keys" === n.code)
                for (let e of (null != i || (i = n), n.keys)) r.has(e) || r.set(e, {}), r.get(e).l = !0;
            else e.issues.push(n);
        for (let t of n.issues)
            if ("unrecognized_keys" === t.code)
                for (let e of t.keys) r.has(e) || r.set(e, {}), r.get(e).r = !0;
            else e.issues.push(t);
        let a = [...r].filter(e => {
            let [, t] = e;
            return t.l && t.r
        }).map(e => {
            let [t] = e;
            return t
        });
        if (a.length && i && e.issues.push({
                ...i,
                keys: a
            }), E(e)) return e;
        let o = function e(t, n) {
            if (t === n || t instanceof Date && n instanceof Date && +t == +n) return {
                valid: !0,
                data: t
            };
            if (S(t) && S(n)) {
                let i = Object.keys(n),
                    r = Object.keys(t).filter(e => -1 !== i.indexOf(e)),
                    a = {
                        ...t,
                        ...n
                    };
                for (let i of r) {
                    let r = e(t[i], n[i]);
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
                    let a = e(t[r], n[r]);
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
        }(t.value, n.value);
        if (!o.valid) throw Error("Unmergable intersection. Error path: " + "".concat(JSON.stringify(o.mergeErrorPath)));
        return e.value = o.data, e
    }
    let nK = n("$ZodTuple", (e, t) => {
        tH.init(e, t);
        let n = t.items;
        e._zod.parse = (i, r) => {
            let a = i.value;
            if (!Array.isArray(a)) return i.issues.push({
                input: a,
                inst: e,
                expected: "tuple",
                code: "invalid_type"
            }), i;
            i.value = [];
            let o = [],
                c = nB(n, "optin"),
                u = nB(n, "optout");
            if (!t.rest) {
                if (a.length < c) return i.issues.push({
                    code: "too_small",
                    minimum: c,
                    inclusive: !0,
                    input: a,
                    inst: e,
                    origin: "array"
                }), i;
                a.length > n.length && i.issues.push({
                    code: "too_big",
                    maximum: n.length,
                    inclusive: !0,
                    input: a,
                    inst: e,
                    origin: "array"
                })
            }
            let l = Array(n.length);
            for (let e = 0; e < n.length; e++) {
                let t = n[e]._zod.run({
                    value: a[e],
                    issues: []
                }, r);
                t instanceof Promise ? o.push(t.then(t => {
                    l[e] = t
                })) : l[e] = t
            }
            if (t.rest) {
                let e = n.length - 1;
                for (let c of a.slice(n.length)) {
                    e++;
                    let n = t.rest._zod.run({
                        value: c,
                        issues: []
                    }, r);
                    n instanceof Promise ? o.push(n.then(t => nV(t, i, e))) : nV(n, i, e)
                }
            }
            return o.length ? Promise.all(o).then(() => nX(l, i, n, a, u)) : nX(l, i, n, a, u)
        }
    });

    function nB(e, t) {
        for (let n = e.length - 1; n >= 0; n--)
            if ("optional" !== e[n]._zod[t]) return n + 1;
        return 0
    }

    function nV(e, t, n) {
        e.issues.length && t.issues.push(...A(n, e.issues)), t.value[n] = e.value
    }

    function nX(e, t, n, i, r) {
        for (let a = 0; a < n.length; a++) {
            let n = e[a],
                o = a < i.length;
            if (n.issues.length) {
                if (!o && a >= r) {
                    t.value.length = a;
                    break
                }
                t.issues.push(...A(a, n.issues))
            }
            t.value[a] = n.value
        }
        for (let e = t.value.length - 1; e >= i.length; e--)
            if ("optional" === n[e]._zod.optout && void 0 === t.value[e]) t.value.length = e;
            else break;
        return t
    }
    let nq = n("$ZodRecord", (e, t) => {
            tH.init(e, t), e._zod.parse = (n, i) => {
                let r = n.value;
                if (!S(r)) return n.issues.push({
                    expected: "record",
                    code: "invalid_type",
                    input: r,
                    inst: e
                }), n;
                let a = [],
                    o = t.keyType._zod.values;
                if (o) {
                    let u;
                    n.value = {};
                    let l = new Set;
                    for (let u of o)
                        if ("string" == typeof u || "number" == typeof u || "symbol" == typeof u) {
                            l.add("number" == typeof u ? u.toString() : u);
                            let o = t.keyType._zod.run({
                                value: u,
                                issues: []
                            }, i);
                            if (o instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                            if (o.issues.length) {
                                n.issues.push({
                                    code: "invalid_key",
                                    origin: "record",
                                    issues: o.issues.map(e => C(e, i, c())),
                                    input: u,
                                    path: [u],
                                    inst: e
                                });
                                continue
                            }
                            let s = o.value,
                                d = t.valueType._zod.run({
                                    value: r[u],
                                    issues: []
                                }, i);
                            d instanceof Promise ? a.push(d.then(e => {
                                e.issues.length && n.issues.push(...A(u, e.issues)), n.value[s] = e.value
                            })) : (d.issues.length && n.issues.push(...A(u, d.issues)), n.value[s] = d.value)
                        } for (let e in r) l.has(e) || (u = null != u ? u : []).push(e);
                    u && u.length > 0 && n.issues.push({
                        code: "unrecognized_keys",
                        input: r,
                        inst: e,
                        keys: u
                    })
                } else
                    for (let o of (n.value = {}, Reflect.ownKeys(r))) {
                        if ("__proto__" === o || !Object.prototype.propertyIsEnumerable.call(r, o)) continue;
                        let u = t.keyType._zod.run({
                            value: o,
                            issues: []
                        }, i);
                        if (u instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                        if ("string" == typeof o && eU.test(o) && u.issues.length) {
                            let e = t.keyType._zod.run({
                                value: Number(o),
                                issues: []
                            }, i);
                            if (e instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                            0 === e.issues.length && (u = e)
                        }
                        if (u.issues.length) {
                            "loose" === t.mode ? n.value[o] = r[o] : n.issues.push({
                                code: "invalid_key",
                                origin: "record",
                                issues: u.issues.map(e => C(e, i, c())),
                                input: o,
                                path: [o],
                                inst: e
                            });
                            continue
                        }
                        let l = t.valueType._zod.run({
                            value: r[o],
                            issues: []
                        }, i);
                        l instanceof Promise ? a.push(l.then(e => {
                            e.issues.length && n.issues.push(...A(o, e.issues)), n.value[u.value] = e.value
                        })) : (l.issues.length && n.issues.push(...A(o, l.issues)), n.value[u.value] = l.value)
                    }
                return a.length ? Promise.all(a).then(() => n) : n
            }
        }),
        nY = n("$ZodMap", (e, t) => {
            tH.init(e, t), e._zod.parse = (n, i) => {
                let r = n.value;
                if (!(r instanceof Map)) return n.issues.push({
                    expected: "map",
                    code: "invalid_type",
                    input: r,
                    inst: e
                }), n;
                let a = [];
                for (let [o, c] of(n.value = new Map, r)) {
                    let u = t.keyType._zod.run({
                            value: o,
                            issues: []
                        }, i),
                        l = t.valueType._zod.run({
                            value: c,
                            issues: []
                        }, i);
                    u instanceof Promise || l instanceof Promise ? a.push(Promise.all([u, l]).then(t => {
                        let [a, c] = t;
                        nH(a, c, n, o, r, e, i)
                    })) : nH(u, l, n, o, r, e, i)
                }
                return a.length ? Promise.all(a).then(() => n) : n
            }
        });

    function nH(e, t, n, i, r, a, o) {
        e.issues.length && (z.has(typeof i) ? n.issues.push(...A(i, e.issues)) : n.issues.push({
            code: "invalid_key",
            origin: "map",
            input: r,
            inst: a,
            issues: e.issues.map(e => C(e, o, c()))
        })), t.issues.length && (z.has(typeof i) ? n.issues.push(...A(i, t.issues)) : n.issues.push({
            origin: "map",
            code: "invalid_element",
            input: r,
            inst: a,
            key: i,
            issues: t.issues.map(e => C(e, o, c()))
        })), n.value.set(e.value, t.value)
    }
    let nQ = n("$ZodSet", (e, t) => {
        tH.init(e, t), e._zod.parse = (n, i) => {
            let r = n.value;
            if (!(r instanceof Set)) return n.issues.push({
                input: r,
                inst: e,
                expected: "set",
                code: "invalid_type"
            }), n;
            let a = [];
            for (let e of (n.value = new Set, r)) {
                let r = t.valueType._zod.run({
                    value: e,
                    issues: []
                }, i);
                r instanceof Promise ? a.push(r.then(e => n0(e, n))) : n0(r, n)
            }
            return a.length ? Promise.all(a).then(() => n) : n
        }
    });

    function n0(e, t) {
        e.issues.length && t.issues.push(...e.issues), t.value.add(e.value)
    }
    let n4 = n("$ZodEnum", (e, t) => {
            tH.init(e, t);
            let n = u(t.entries),
                i = new Set(n);
            e._zod.values = i, e._zod.pattern = new RegExp("^(".concat(n.filter(e => z.has(typeof e)).map(e => "string" == typeof e ? U(e) : e.toString()).join("|"), ")$")), e._zod.parse = (t, r) => {
                let a = t.value;
                return i.has(a) || t.issues.push({
                    code: "invalid_value",
                    values: n,
                    input: a,
                    inst: e
                }), t
            }
        }),
        n6 = n("$ZodLiteral", (e, t) => {
            if (tH.init(e, t), 0 === t.values.length) throw Error("Cannot create literal schema with no valid values");
            let n = new Set(t.values);
            e._zod.values = n, e._zod.pattern = new RegExp("^(".concat(t.values.map(e => "string" == typeof e ? U(e) : e ? U(e.toString()) : String(e)).join("|"), ")$")), e._zod.parse = (i, r) => {
                let a = i.value;
                return n.has(a) || i.issues.push({
                    code: "invalid_value",
                    values: t.values,
                    input: a,
                    inst: e
                }), i
            }
        }),
        n1 = n("$ZodFile", (e, t) => {
            tH.init(e, t), e._zod.parse = (t, n) => {
                let i = t.value;
                return i instanceof File || t.issues.push({
                    expected: "file",
                    code: "invalid_type",
                    input: i,
                    inst: e
                }), t
            }
        }),
        n2 = n("$ZodTransform", (e, t) => {
            tH.init(e, t), e._zod.optin = "optional", e._zod.parse = (n, i) => {
                if ("backward" === i.direction) throw new a(e.constructor.name);
                let o = t.transform(n.value, n);
                if (i.async) return (o instanceof Promise ? o : Promise.resolve(o)).then(e => (n.value = e, n.fallback = !0, n));
                if (o instanceof Promise) throw new r;
                return n.value = o, n.fallback = !0, n
            }
        });

    function n9(e, t) {
        return void 0 === t && (e.issues.length || e.fallback) ? {
            issues: [],
            value: void 0
        } : e
    }
    let n3 = n("$ZodOptional", (e, t) => {
            tH.init(e, t), e._zod.optin = "optional", e._zod.optout = "optional", g(e._zod, "values", () => t.innerType._zod.values ? new Set([...t.innerType._zod.values, void 0]) : void 0), g(e._zod, "pattern", () => {
                let e = t.innerType._zod.pattern;
                return e ? new RegExp("^(".concat(f(e.source), ")?$")) : void 0
            }), e._zod.parse = (e, n) => {
                if ("optional" === t.innerType._zod.optin) {
                    let i = e.value,
                        r = t.innerType._zod.run(e, n);
                    return r instanceof Promise ? r.then(e => n9(e, i)) : n9(r, i)
                }
                return void 0 === e.value ? e : t.innerType._zod.run(e, n)
            }
        }),
        n8 = n("$ZodExactOptional", (e, t) => {
            n3.init(e, t), g(e._zod, "values", () => t.innerType._zod.values), g(e._zod, "pattern", () => t.innerType._zod.pattern), e._zod.parse = (e, n) => t.innerType._zod.run(e, n)
        }),
        n7 = n("$ZodNullable", (e, t) => {
            tH.init(e, t), g(e._zod, "optin", () => t.innerType._zod.optin), g(e._zod, "optout", () => t.innerType._zod.optout), g(e._zod, "pattern", () => {
                let e = t.innerType._zod.pattern;
                return e ? new RegExp("^(".concat(f(e.source), "|null)$")) : void 0
            }), g(e._zod, "values", () => t.innerType._zod.values ? new Set([...t.innerType._zod.values, null]) : void 0), e._zod.parse = (e, n) => null === e.value ? e : t.innerType._zod.run(e, n)
        }),
        n5 = n("$ZodDefault", (e, t) => {
            tH.init(e, t), e._zod.optin = "optional", g(e._zod, "values", () => t.innerType._zod.values), e._zod.parse = (e, n) => {
                if ("backward" === n.direction) return t.innerType._zod.run(e, n);
                if (void 0 === e.value) return e.value = t.defaultValue, e;
                let i = t.innerType._zod.run(e, n);
                return i instanceof Promise ? i.then(e => ie(e, t)) : ie(i, t)
            }
        });

    function ie(e, t) {
        return void 0 === e.value && (e.value = t.defaultValue), e
    }
    let it = n("$ZodPrefault", (e, t) => {
            tH.init(e, t), e._zod.optin = "optional", g(e._zod, "values", () => t.innerType._zod.values), e._zod.parse = (e, n) => ("backward" === n.direction || void 0 === e.value && (e.value = t.defaultValue), t.innerType._zod.run(e, n))
        }),
        ii = n("$ZodNonOptional", (e, t) => {
            tH.init(e, t), g(e._zod, "values", () => {
                let e = t.innerType._zod.values;
                return e ? new Set([...e].filter(e => void 0 !== e)) : void 0
            }), e._zod.parse = (n, i) => {
                let r = t.innerType._zod.run(n, i);
                return r instanceof Promise ? r.then(t => ir(t, e)) : ir(r, e)
            }
        });

    function ir(e, t) {
        return e.issues.length || void 0 !== e.value || e.issues.push({
            code: "invalid_type",
            expected: "nonoptional",
            input: e.value,
            inst: t
        }), e
    }
    let ia = n("$ZodSuccess", (e, t) => {
            tH.init(e, t), e._zod.parse = (e, n) => {
                if ("backward" === n.direction) throw new a("ZodSuccess");
                let i = t.innerType._zod.run(e, n);
                return i instanceof Promise ? i.then(t => (e.value = 0 === t.issues.length, e)) : (e.value = 0 === i.issues.length, e)
            }
        }),
        io = n("$ZodCatch", (e, t) => {
            tH.init(e, t), e._zod.optin = "optional", g(e._zod, "optout", () => t.innerType._zod.optout), g(e._zod, "values", () => t.innerType._zod.values), e._zod.parse = (e, n) => {
                if ("backward" === n.direction) return t.innerType._zod.run(e, n);
                let i = t.innerType._zod.run(e, n);
                return i instanceof Promise ? i.then(i => (e.value = i.value, i.issues.length && (e.value = t.catchValue({
                    ...e,
                    error: {
                        issues: i.issues.map(e => C(e, n, c()))
                    },
                    input: e.value
                }), e.issues = [], e.fallback = !0), e)) : (e.value = i.value, i.issues.length && (e.value = t.catchValue({
                    ...e,
                    error: {
                        issues: i.issues.map(e => C(e, n, c()))
                    },
                    input: e.value
                }), e.issues = [], e.fallback = !0), e)
            }
        }),
        ic = n("$ZodNaN", (e, t) => {
            tH.init(e, t), e._zod.parse = (t, n) => ("number" == typeof t.value && Number.isNaN(t.value) || t.issues.push({
                input: t.value,
                inst: e,
                expected: "nan",
                code: "invalid_type"
            }), t)
        }),
        iu = n("$ZodPipe", (e, t) => {
            tH.init(e, t), g(e._zod, "values", () => t.in._zod.values), g(e._zod, "optin", () => t.in._zod.optin), g(e._zod, "optout", () => t.out._zod.optout), g(e._zod, "propValues", () => t.in._zod.propValues), e._zod.parse = (e, n) => {
                if ("backward" === n.direction) {
                    let i = t.out._zod.run(e, n);
                    return i instanceof Promise ? i.then(e => il(e, t.in, n)) : il(i, t.in, n)
                }
                let i = t.in._zod.run(e, n);
                return i instanceof Promise ? i.then(e => il(e, t.out, n)) : il(i, t.out, n)
            }
        });

    function il(e, t, n) {
        return e.issues.length ? (e.aborted = !0, e) : t._zod.run({
            value: e.value,
            issues: e.issues,
            fallback: e.fallback
        }, n)
    }
    let is = n("$ZodCodec", (e, t) => {
        tH.init(e, t), g(e._zod, "values", () => t.in._zod.values), g(e._zod, "optin", () => t.in._zod.optin), g(e._zod, "optout", () => t.out._zod.optout), g(e._zod, "propValues", () => t.in._zod.propValues), e._zod.parse = (e, n) => {
            if ("forward" === (n.direction || "forward")) {
                let i = t.in._zod.run(e, n);
                return i instanceof Promise ? i.then(e => id(e, t, n)) : id(i, t, n)
            } {
                let i = t.out._zod.run(e, n);
                return i instanceof Promise ? i.then(e => id(e, t, n)) : id(i, t, n)
            }
        }
    });

    function id(e, t, n) {
        if (e.issues.length) return e.aborted = !0, e;
        if ("forward" === (n.direction || "forward")) {
            let i = t.transform(e.value, e);
            return i instanceof Promise ? i.then(i => im(e, i, t.out, n)) : im(e, i, t.out, n)
        } {
            let i = t.reverseTransform(e.value, e);
            return i instanceof Promise ? i.then(i => im(e, i, t.in, n)) : im(e, i, t.in, n)
        }
    }

    function im(e, t, n, i) {
        return e.issues.length ? (e.aborted = !0, e) : n._zod.run({
            value: t,
            issues: e.issues
        }, i)
    }
    let iv = n("$ZodPreprocess", (e, t) => {
            iu.init(e, t)
        }),
        ip = n("$ZodReadonly", (e, t) => {
            tH.init(e, t), g(e._zod, "propValues", () => t.innerType._zod.propValues), g(e._zod, "values", () => t.innerType._zod.values), g(e._zod, "optin", () => {
                var e, n;
                return null == (n = t.innerType) || null == (e = n._zod) ? void 0 : e.optin
            }), g(e._zod, "optout", () => {
                var e, n;
                return null == (n = t.innerType) || null == (e = n._zod) ? void 0 : e.optout
            }), e._zod.parse = (e, n) => {
                if ("backward" === n.direction) return t.innerType._zod.run(e, n);
                let i = t.innerType._zod.run(e, n);
                return i instanceof Promise ? i.then(ig) : ig(i)
            }
        });

    function ig(e) {
        return e.value = Object.freeze(e.value), e
    }
    let ih = n("$ZodTemplateLiteral", (e, t) => {
            tH.init(e, t);
            let n = [];
            for (let e of t.parts)
                if ("object" == typeof e && null !== e) {
                    if (!e._zod.pattern) throw Error("Invalid template literal part, no pattern found: ".concat([...e._zod.traits].shift()));
                    let t = e._zod.pattern instanceof RegExp ? e._zod.pattern.source : e._zod.pattern;
                    if (!t) throw Error("Invalid template literal part: ".concat(e._zod.traits));
                    let i = +!!t.startsWith("^"),
                        r = t.endsWith("$") ? t.length - 1 : t.length;
                    n.push(t.slice(i, r))
                } else if (null === e || Z.has(typeof e)) n.push(U("".concat(e)));
            else throw Error("Invalid template literal part: ".concat(e));
            e._zod.pattern = new RegExp("^".concat(n.join(""), "$")), e._zod.parse = (n, i) => {
                if ("string" != typeof n.value) return n.issues.push({
                    input: n.value,
                    inst: e,
                    expected: "string",
                    code: "invalid_type"
                }), n;
                if (e._zod.pattern.lastIndex = 0, !e._zod.pattern.test(n.value)) {
                    var r;
                    n.issues.push({
                        input: n.value,
                        inst: e,
                        code: "invalid_format",
                        format: null != (r = t.format) ? r : "template_literal",
                        pattern: e._zod.pattern.source
                    })
                }
                return n
            }
        }),
        i_ = n("$ZodFunction", (e, t) => (tH.init(e, t), e._def = t, e._zod.def = t, e.implement = t => {
            if ("function" != typeof t) throw Error("implement() must be called with a function");
            return function() {
                for (var n = arguments.length, i = Array(n), r = 0; r < n; r++) i[r] = arguments[r];
                let a = Reflect.apply(t, this, e._def.input ? ti(e._def.input, i) : i);
                return e._def.output ? ti(e._def.output, a) : a
            }
        }, e.implementAsync = t => {
            if ("function" != typeof t) throw Error("implementAsync() must be called with a function");
            return async function() {
                for (var n = arguments.length, i = Array(n), r = 0; r < n; r++) i[r] = arguments[r];
                let a = e._def.input ? await ta(e._def.input, i) : i,
                    o = await Reflect.apply(t, this, a);
                return e._def.output ? await ta(e._def.output, o) : o
            }
        }, e._zod.parse = (t, n) => ("function" != typeof t.value ? t.issues.push({
            code: "invalid_type",
            expected: "function",
            input: t.value,
            inst: e
        }) : e._def.output && "promise" === e._def.output._zod.def.type ? t.value = e.implementAsync(t.value) : t.value = e.implement(t.value), t), e.input = function() {
            for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
            let r = e.constructor;
            return new r(Array.isArray(n[0]) ? {
                type: "function",
                input: new nK({
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
        iy = n("$ZodPromise", (e, t) => {
            tH.init(e, t), e._zod.parse = (e, n) => Promise.resolve(e.value).then(e => t.innerType._zod.run({
                value: e,
                issues: []
            }, n))
        }),
        ib = n("$ZodLazy", (e, t) => {
            tH.init(e, t), g(e._zod, "innerType", () => (t._cachedInner || (t._cachedInner = t.getter()), t._cachedInner)), g(e._zod, "pattern", () => {
                var t, n;
                return null == (n = e._zod.innerType) || null == (t = n._zod) ? void 0 : t.pattern
            }), g(e._zod, "propValues", () => {
                var t, n;
                return null == (n = e._zod.innerType) || null == (t = n._zod) ? void 0 : t.propValues
            }), g(e._zod, "optin", () => {
                var t, n, i;
                return null != (t = null == (i = e._zod.innerType) || null == (n = i._zod) ? void 0 : n.optin) ? t : void 0
            }), g(e._zod, "optout", () => {
                var t, n, i;
                return null != (t = null == (i = e._zod.innerType) || null == (n = i._zod) ? void 0 : n.optout) ? t : void 0
            }), e._zod.parse = (t, n) => e._zod.innerType._zod.run(t, n)
        }),
        ik = n("$ZodCustom", (e, t) => {
            tz.init(e, t), tH.init(e, t), e._zod.parse = (e, t) => e, e._zod.check = n => {
                let i = n.value,
                    r = t.fn(i);
                if (r instanceof Promise) return r.then(t => iI(t, n, i, e));
                iI(r, n, i, e)
            }
        });

    function iI(e, t, n, i) {
        if (!e) {
            var r;
            let e = {
                code: "custom",
                input: n,
                inst: i,
                path: [...null != (r = i._zod.def.path) ? r : []],
                continue: !i._zod.def.abort
            };
            i._zod.def.params && (e.params = i._zod.def.params), t.issues.push(M(e))
        }
    }
    e.s(["$ZodAny", 0, nZ, "$ZodArray", 0, n$, "$ZodBase64", 0, nm, "$ZodBase64URL", 0, nv, "$ZodBigInt", 0, nI, "$ZodBigIntFormat", 0, nx, "$ZodBoolean", 0, nk, "$ZodCIDRv4", 0, nl, "$ZodCIDRv6", 0, ns, "$ZodCUID", 0, t8, "$ZodCUID2", 0, t7, "$ZodCatch", 0, io, "$ZodCodec", 0, is, "$ZodCustom", 0, ik, "$ZodCustomStringFormat", 0, n_, "$ZodDate", 0, nD, "$ZodDefault", 0, n5, "$ZodDiscriminatedUnion", 0, nM, "$ZodE164", 0, np, "$ZodEmail", 0, t1, "$ZodEmoji", 0, t9, "$ZodEnum", 0, n4, "$ZodExactOptional", 0, n8, "$ZodFile", 0, n1, "$ZodFunction", 0, i_, "$ZodGUID", 0, t4, "$ZodIPv4", 0, no, "$ZodIPv6", 0, nc, "$ZodISODate", 0, ni, "$ZodISODateTime", 0, nn, "$ZodISODuration", 0, na, "$ZodISOTime", 0, nr, "$ZodIntersection", 0, nW, "$ZodJWT", 0, nh, "$ZodKSUID", 0, nt, "$ZodLazy", 0, ib, "$ZodLiteral", 0, n6, "$ZodMAC", 0, nu, "$ZodMap", 0, nY, "$ZodNaN", 0, ic, "$ZodNanoID", 0, t3, "$ZodNever", 0, nO, "$ZodNonOptional", 0, ii, "$ZodNull", 0, nz, "$ZodNullable", 0, n7, "$ZodNumber", 0, ny, "$ZodNumberFormat", 0, nb, "$ZodObject", 0, nA, "$ZodObjectJIT", 0, nL, "$ZodOptional", 0, n3, "$ZodPipe", 0, iu, "$ZodPrefault", 0, it, "$ZodPreprocess", 0, iv, "$ZodPromise", 0, iy, "$ZodReadonly", 0, ip, "$ZodRecord", 0, nq, "$ZodSet", 0, nQ, "$ZodString", 0, tQ, "$ZodStringFormat", 0, t0, "$ZodSuccess", 0, ia, "$ZodSymbol", 0, nS, "$ZodTemplateLiteral", 0, ih, "$ZodTransform", 0, n2, "$ZodTuple", 0, nK, "$ZodType", 0, tH, "$ZodULID", 0, t5, "$ZodURL", 0, t2, "$ZodUUID", 0, t6, "$ZodUndefined", 0, nw, "$ZodUnion", 0, nJ, "$ZodUnknown", 0, nU, "$ZodVoid", 0, nj, "$ZodXID", 0, ne, "$ZodXor", 0, nF, "isValidBase64", 0, nd, "isValidBase64URL", 0, nf, "isValidJWT", 0, ng], 722380), e.i(722380), e.s(["$ZodAny", 0, nZ, "$ZodArray", 0, n$, "$ZodBase64", 0, nm, "$ZodBase64URL", 0, nv, "$ZodBigInt", 0, nI, "$ZodBigIntFormat", 0, nx, "$ZodBoolean", 0, nk, "$ZodCIDRv4", 0, nl, "$ZodCIDRv6", 0, ns, "$ZodCUID", 0, t8, "$ZodCUID2", 0, t7, "$ZodCatch", 0, io, "$ZodCodec", 0, is, "$ZodCustom", 0, ik, "$ZodCustomStringFormat", 0, n_, "$ZodDate", 0, nD, "$ZodDefault", 0, n5, "$ZodDiscriminatedUnion", 0, nM, "$ZodE164", 0, np, "$ZodEmail", 0, t1, "$ZodEmoji", 0, t9, "$ZodEnum", 0, n4, "$ZodExactOptional", 0, n8, "$ZodFile", 0, n1, "$ZodFunction", 0, i_, "$ZodGUID", 0, t4, "$ZodIPv4", 0, no, "$ZodIPv6", 0, nc, "$ZodISODate", 0, ni, "$ZodISODateTime", 0, nn, "$ZodISODuration", 0, na, "$ZodISOTime", 0, nr, "$ZodIntersection", 0, nW, "$ZodJWT", 0, nh, "$ZodKSUID", 0, nt, "$ZodLazy", 0, ib, "$ZodLiteral", 0, n6, "$ZodMAC", 0, nu, "$ZodMap", 0, nY, "$ZodNaN", 0, ic, "$ZodNanoID", 0, t3, "$ZodNever", 0, nO, "$ZodNonOptional", 0, ii, "$ZodNull", 0, nz, "$ZodNullable", 0, n7, "$ZodNumber", 0, ny, "$ZodNumberFormat", 0, nb, "$ZodObject", 0, nA, "$ZodObjectJIT", 0, nL, "$ZodOptional", 0, n3, "$ZodPipe", 0, iu, "$ZodPrefault", 0, it, "$ZodPreprocess", 0, iv, "$ZodPromise", 0, iy, "$ZodReadonly", 0, ip, "$ZodRecord", 0, nq, "$ZodSet", 0, nQ, "$ZodString", 0, tQ, "$ZodStringFormat", 0, t0, "$ZodSuccess", 0, ia, "$ZodSymbol", 0, nS, "$ZodTemplateLiteral", 0, ih, "$ZodTransform", 0, n2, "$ZodTuple", 0, nK, "$ZodType", 0, tH, "$ZodULID", 0, t5, "$ZodURL", 0, t2, "$ZodUUID", 0, t6, "$ZodUndefined", 0, nw, "$ZodUnion", 0, nJ, "$ZodUnknown", 0, nU, "$ZodVoid", 0, nj, "$ZodXID", 0, ne, "$ZodXor", 0, nF, "clone", 0, O, "isValidBase64", 0, nd, "isValidBase64URL", 0, nf, "isValidJWT", 0, ng], 78019), e.i(78019), e.i(937793), e.i(524219);
    let ix = Symbol("ZodOutput"),
        iS = Symbol("ZodInput");
    class iw {
        add(e) {
            for (var t = arguments.length, n = Array(t > 1 ? t - 1 : 0), i = 1; i < t; i++) n[i - 1] = arguments[i];
            let r = n[0];
            return this._map.set(e, r), r && "object" == typeof r && "id" in r && this._idmap.set(r.id, e), this
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
                let i = {
                    ...null != (n = this.get(t)) ? n : {}
                };
                delete i.id;
                let r = {
                    ...i,
                    ...this._map.get(e)
                };
                return Object.keys(r).length ? r : void 0
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

    function iz() {
        return new iw
    }
    null != (B = globalThis).__zod_globalRegistry || (B.__zod_globalRegistry = iz());
    let iZ = globalThis.__zod_globalRegistry;

    function iU(e, t) {
        return new e({
            type: "string",
            ...j(t)
        })
    }

    function iO(e, t) {
        return new e({
            type: "string",
            coerce: !0,
            ...j(t)
        })
    }

    function ij(e, t) {
        return new e({
            type: "string",
            format: "email",
            check: "string_format",
            abort: !1,
            ...j(t)
        })
    }

    function iD(e, t) {
        return new e({
            type: "string",
            format: "guid",
            check: "string_format",
            abort: !1,
            ...j(t)
        })
    }

    function iP(e, t) {
        return new e({
            type: "string",
            format: "uuid",
            check: "string_format",
            abort: !1,
            ...j(t)
        })
    }

    function i$(e, t) {
        return new e({
            type: "string",
            format: "uuid",
            check: "string_format",
            abort: !1,
            version: "v4",
            ...j(t)
        })
    }

    function iN(e, t) {
        return new e({
            type: "string",
            format: "uuid",
            check: "string_format",
            abort: !1,
            version: "v6",
            ...j(t)
        })
    }

    function iE(e, t) {
        return new e({
            type: "string",
            format: "uuid",
            check: "string_format",
            abort: !1,
            version: "v7",
            ...j(t)
        })
    }

    function iT(e, t) {
        return new e({
            type: "string",
            format: "url",
            check: "string_format",
            abort: !1,
            ...j(t)
        })
    }

    function iA(e, t) {
        return new e({
            type: "string",
            format: "emoji",
            check: "string_format",
            abort: !1,
            ...j(t)
        })
    }

    function iL(e, t) {
        return new e({
            type: "string",
            format: "nanoid",
            check: "string_format",
            abort: !1,
            ...j(t)
        })
    }

    function iC(e, t) {
        return new e({
            type: "string",
            format: "cuid",
            check: "string_format",
            abort: !1,
            ...j(t)
        })
    }

    function iJ(e, t) {
        return new e({
            type: "string",
            format: "cuid2",
            check: "string_format",
            abort: !1,
            ...j(t)
        })
    }

    function iR(e, t) {
        return new e({
            type: "string",
            format: "ulid",
            check: "string_format",
            abort: !1,
            ...j(t)
        })
    }

    function iF(e, t) {
        return new e({
            type: "string",
            format: "xid",
            check: "string_format",
            abort: !1,
            ...j(t)
        })
    }

    function iM(e, t) {
        return new e({
            type: "string",
            format: "ksuid",
            check: "string_format",
            abort: !1,
            ...j(t)
        })
    }

    function iW(e, t) {
        return new e({
            type: "string",
            format: "ipv4",
            check: "string_format",
            abort: !1,
            ...j(t)
        })
    }

    function iG(e, t) {
        return new e({
            type: "string",
            format: "ipv6",
            check: "string_format",
            abort: !1,
            ...j(t)
        })
    }

    function iK(e, t) {
        return new e({
            type: "string",
            format: "mac",
            check: "string_format",
            abort: !1,
            ...j(t)
        })
    }

    function iB(e, t) {
        return new e({
            type: "string",
            format: "cidrv4",
            check: "string_format",
            abort: !1,
            ...j(t)
        })
    }

    function iV(e, t) {
        return new e({
            type: "string",
            format: "cidrv6",
            check: "string_format",
            abort: !1,
            ...j(t)
        })
    }

    function iX(e, t) {
        return new e({
            type: "string",
            format: "base64",
            check: "string_format",
            abort: !1,
            ...j(t)
        })
    }

    function iq(e, t) {
        return new e({
            type: "string",
            format: "base64url",
            check: "string_format",
            abort: !1,
            ...j(t)
        })
    }

    function iY(e, t) {
        return new e({
            type: "string",
            format: "e164",
            check: "string_format",
            abort: !1,
            ...j(t)
        })
    }

    function iH(e, t) {
        return new e({
            type: "string",
            format: "jwt",
            check: "string_format",
            abort: !1,
            ...j(t)
        })
    }
    e.s(["$ZodRegistry", 0, iw, "$input", 0, iS, "$output", 0, ix, "globalRegistry", 0, iZ, "registry", 0, iz], 774406), e.i(774406), e.i(706089);
    let iQ = {
        Any: null,
        Minute: -1,
        Second: 0,
        Millisecond: 3,
        Microsecond: 6
    };

    function i0(e, t) {
        return new e({
            type: "string",
            format: "datetime",
            check: "string_format",
            offset: !1,
            local: !1,
            precision: null,
            ...j(t)
        })
    }

    function i4(e, t) {
        return new e({
            type: "string",
            format: "date",
            check: "string_format",
            ...j(t)
        })
    }

    function i6(e, t) {
        return new e({
            type: "string",
            format: "time",
            check: "string_format",
            precision: null,
            ...j(t)
        })
    }

    function i1(e, t) {
        return new e({
            type: "string",
            format: "duration",
            check: "string_format",
            ...j(t)
        })
    }

    function i2(e, t) {
        return new e({
            type: "number",
            checks: [],
            ...j(t)
        })
    }

    function i9(e, t) {
        return new e({
            type: "number",
            coerce: !0,
            checks: [],
            ...j(t)
        })
    }

    function i3(e, t) {
        return new e({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "safeint",
            ...j(t)
        })
    }

    function i8(e, t) {
        return new e({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "float32",
            ...j(t)
        })
    }

    function i7(e, t) {
        return new e({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "float64",
            ...j(t)
        })
    }

    function i5(e, t) {
        return new e({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "int32",
            ...j(t)
        })
    }

    function re(e, t) {
        return new e({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "uint32",
            ...j(t)
        })
    }

    function rt(e, t) {
        return new e({
            type: "boolean",
            ...j(t)
        })
    }

    function rn(e, t) {
        return new e({
            type: "boolean",
            coerce: !0,
            ...j(t)
        })
    }

    function ri(e, t) {
        return new e({
            type: "bigint",
            ...j(t)
        })
    }

    function rr(e, t) {
        return new e({
            type: "bigint",
            coerce: !0,
            ...j(t)
        })
    }

    function ra(e, t) {
        return new e({
            type: "bigint",
            check: "bigint_format",
            abort: !1,
            format: "int64",
            ...j(t)
        })
    }

    function ro(e, t) {
        return new e({
            type: "bigint",
            check: "bigint_format",
            abort: !1,
            format: "uint64",
            ...j(t)
        })
    }

    function rc(e, t) {
        return new e({
            type: "symbol",
            ...j(t)
        })
    }

    function ru(e, t) {
        return new e({
            type: "undefined",
            ...j(t)
        })
    }

    function rl(e, t) {
        return new e({
            type: "null",
            ...j(t)
        })
    }

    function rs(e) {
        return new e({
            type: "any"
        })
    }

    function rd(e) {
        return new e({
            type: "unknown"
        })
    }

    function rm(e, t) {
        return new e({
            type: "never",
            ...j(t)
        })
    }

    function rf(e, t) {
        return new e({
            type: "void",
            ...j(t)
        })
    }

    function rv(e, t) {
        return new e({
            type: "date",
            ...j(t)
        })
    }

    function rp(e, t) {
        return new e({
            type: "date",
            coerce: !0,
            ...j(t)
        })
    }

    function rg(e, t) {
        return new e({
            type: "nan",
            ...j(t)
        })
    }

    function rh(e, t) {
        return new tU({
            check: "less_than",
            ...j(t),
            value: e,
            inclusive: !1
        })
    }

    function r_(e, t) {
        return new tU({
            check: "less_than",
            ...j(t),
            value: e,
            inclusive: !0
        })
    }

    function ry(e, t) {
        return new tO({
            check: "greater_than",
            ...j(t),
            value: e,
            inclusive: !1
        })
    }

    function rb(e, t) {
        return new tO({
            check: "greater_than",
            ...j(t),
            value: e,
            inclusive: !0
        })
    }

    function rk(e) {
        return ry(0, e)
    }

    function rI(e) {
        return rh(0, e)
    }

    function rx(e) {
        return r_(0, e)
    }

    function rS(e) {
        return rb(0, e)
    }

    function rw(e, t) {
        return new tj({
            check: "multiple_of",
            ...j(t),
            value: e
        })
    }

    function rz(e, t) {
        return new t$({
            check: "max_size",
            ...j(t),
            maximum: e
        })
    }

    function rZ(e, t) {
        return new tN({
            check: "min_size",
            ...j(t),
            minimum: e
        })
    }

    function rU(e, t) {
        return new tE({
            check: "size_equals",
            ...j(t),
            size: e
        })
    }

    function rO(e, t) {
        return new tT({
            check: "max_length",
            ...j(t),
            maximum: e
        })
    }

    function rj(e, t) {
        return new tA({
            check: "min_length",
            ...j(t),
            minimum: e
        })
    }

    function rD(e, t) {
        return new tL({
            check: "length_equals",
            ...j(t),
            length: e
        })
    }

    function rP(e, t) {
        return new tJ({
            check: "string_format",
            format: "regex",
            ...j(t),
            pattern: e
        })
    }

    function r$(e) {
        return new tR({
            check: "string_format",
            format: "lowercase",
            ...j(e)
        })
    }

    function rN(e) {
        return new tF({
            check: "string_format",
            format: "uppercase",
            ...j(e)
        })
    }

    function rE(e, t) {
        return new tM({
            check: "string_format",
            format: "includes",
            ...j(t),
            includes: e
        })
    }

    function rT(e, t) {
        return new tW({
            check: "string_format",
            format: "starts_with",
            ...j(t),
            prefix: e
        })
    }

    function rA(e, t) {
        return new tG({
            check: "string_format",
            format: "ends_with",
            ...j(t),
            suffix: e
        })
    }

    function rL(e, t, n) {
        return new tB({
            check: "property",
            property: e,
            schema: t,
            ...j(n)
        })
    }

    function rC(e, t) {
        return new tV({
            check: "mime_type",
            mime: e,
            ...j(t)
        })
    }

    function rJ(e) {
        return new tX({
            check: "overwrite",
            tx: e
        })
    }

    function rR(e) {
        return rJ(t => t.normalize(e))
    }

    function rF() {
        return rJ(e => e.trim())
    }

    function rM() {
        return rJ(e => e.toLowerCase())
    }

    function rW() {
        return rJ(e => e.toUpperCase())
    }

    function rG() {
        return rJ(e => b(e))
    }

    function rK(e, t, n) {
        return new e({
            type: "array",
            element: t,
            ...j(n)
        })
    }

    function rB(e, t, n) {
        return new e({
            type: "union",
            options: t,
            ...j(n)
        })
    }

    function rV(e, t, n) {
        return new e({
            type: "union",
            options: t,
            inclusive: !1,
            ...j(n)
        })
    }

    function rX(e, t, n, i) {
        return new e({
            type: "union",
            options: n,
            discriminator: t,
            ...j(i)
        })
    }

    function rq(e, t, n) {
        return new e({
            type: "intersection",
            left: t,
            right: n
        })
    }

    function rY(e, t, n, i) {
        let r = n instanceof tH,
            a = r ? i : n;
        return new e({
            type: "tuple",
            items: t,
            rest: r ? n : null,
            ...j(a)
        })
    }

    function rH(e, t, n, i) {
        return new e({
            type: "record",
            keyType: t,
            valueType: n,
            ...j(i)
        })
    }

    function rQ(e, t, n, i) {
        return new e({
            type: "map",
            keyType: t,
            valueType: n,
            ...j(i)
        })
    }

    function r0(e, t, n) {
        return new e({
            type: "set",
            valueType: t,
            ...j(n)
        })
    }

    function r4(e, t, n) {
        return new e({
            type: "enum",
            entries: Array.isArray(t) ? Object.fromEntries(t.map(e => [e, e])) : t,
            ...j(n)
        })
    }

    function r6(e, t, n) {
        return new e({
            type: "enum",
            entries: t,
            ...j(n)
        })
    }

    function r1(e, t, n) {
        return new e({
            type: "literal",
            values: Array.isArray(t) ? t : [t],
            ...j(n)
        })
    }

    function r2(e, t) {
        return new e({
            type: "file",
            ...j(t)
        })
    }

    function r9(e, t) {
        return new e({
            type: "transform",
            transform: t
        })
    }

    function r3(e, t) {
        return new e({
            type: "optional",
            innerType: t
        })
    }

    function r8(e, t) {
        return new e({
            type: "nullable",
            innerType: t
        })
    }

    function r7(e, t, n) {
        return new e({
            type: "default",
            innerType: t,
            get defaultValue() {
                return "function" == typeof n ? n() : w(n)
            }
        })
    }

    function r5(e, t, n) {
        return new e({
            type: "nonoptional",
            innerType: t,
            ...j(n)
        })
    }

    function ae(e, t) {
        return new e({
            type: "success",
            innerType: t
        })
    }

    function at(e, t, n) {
        return new e({
            type: "catch",
            innerType: t,
            catchValue: "function" == typeof n ? n : () => n
        })
    }

    function an(e, t, n) {
        return new e({
            type: "pipe",
            in: t,
            out: n
        })
    }

    function ai(e, t) {
        return new e({
            type: "readonly",
            innerType: t
        })
    }

    function ar(e, t, n) {
        return new e({
            type: "template_literal",
            parts: t,
            ...j(n)
        })
    }

    function aa(e, t) {
        return new e({
            type: "lazy",
            getter: t
        })
    }

    function ao(e, t) {
        return new e({
            type: "promise",
            innerType: t
        })
    }

    function ac(e, t, n) {
        let i = j(n);
        return null != i.abort || (i.abort = !0), new e({
            type: "custom",
            check: "custom",
            fn: t,
            ...i
        })
    }

    function au(e, t, n) {
        return new e({
            type: "custom",
            check: "custom",
            fn: t,
            ...j(n)
        })
    }

    function al(e, t) {
        let n = as(t => (t.addIssue = e => {
            if ("string" == typeof e) t.issues.push(M(e, t.value, n._zod.def));
            else e.fatal && (e.continue = !1), null != e.code || (e.code = "custom"), null != e.input || (e.input = t.value), null != e.inst || (e.inst = n), null != e.continue || (e.continue = !n._zod.def.abort), t.issues.push(M(e))
        }, e(t.value, t)), t);
        return n
    }

    function as(e, t) {
        let n = new tz({
            check: "custom",
            ...j(t)
        });
        return n._zod.check = e, n
    }

    function ad(e) {
        let t = new tz({
            check: "describe"
        });
        return t._zod.onattach = [t => {
            var n;
            let i = null != (n = iZ.get(t)) ? n : {};
            iZ.add(t, {
                ...i,
                description: e
            })
        }], t._zod.check = () => {}, t
    }

    function am(e) {
        let t = new tz({
            check: "meta"
        });
        return t._zod.onattach = [t => {
            var n;
            let i = null != (n = iZ.get(t)) ? n : {};
            iZ.add(t, {
                ...i,
                ...e
            })
        }], t._zod.check = () => {}, t
    }

    function af(e, t) {
        var n, i, r, a, o;
        let c = j(t),
            u = null != (n = c.truthy) ? n : ["true", "1", "yes", "on", "y", "enabled"],
            l = null != (i = c.falsy) ? i : ["false", "0", "no", "off", "n", "disabled"];
        "sensitive" !== c.case && (u = u.map(e => "string" == typeof e ? e.toLowerCase() : e), l = l.map(e => "string" == typeof e ? e.toLowerCase() : e));
        let s = new Set(u),
            d = new Set(l),
            m = null != (r = e.Codec) ? r : is,
            f = null != (a = e.Boolean) ? a : nk,
            v = new m({
                type: "pipe",
                in: new(null != (o = e.String) ? o : tQ)({
                    type: "string",
                    error: c.error
                }),
                out: new f({
                    type: "boolean",
                    error: c.error
                }),
                transform: (e, t) => {
                    let n = e;
                    return "sensitive" !== c.case && (n = n.toLowerCase()), !!s.has(n) || !d.has(n) && (t.issues.push({
                        code: "invalid_value",
                        expected: "stringbool",
                        values: [...s, ...d],
                        input: t.value,
                        inst: v,
                        continue: !1
                    }), {})
                },
                reverseTransform: (e, t) => !0 === e ? u[0] || "true" : l[0] || "false",
                error: c.error
            });
        return v
    }

    function av(e, t, n) {
        let i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : {},
            r = j(i),
            a = {
                ...j(i),
                check: "string_format",
                type: "string",
                format: t,
                fn: "function" == typeof n ? n : e => n.test(e),
                ...r
            };
        return n instanceof RegExp && (a.pattern = n), new e(a)
    }

    function ap(e) {
        var t, n, i, r, a, o, c, u, l;
        let s = null != (t = null == e ? void 0 : e.target) ? t : "draft-2020-12";
        return "draft-4" === s && (s = "draft-04"), "draft-7" === s && (s = "draft-07"), {
            processors: null != (n = e.processors) ? n : {},
            metadataRegistry: null != (i = null == e ? void 0 : e.metadata) ? i : iZ,
            target: s,
            unrepresentable: null != (r = null == e ? void 0 : e.unrepresentable) ? r : "throw",
            override: null != (a = null == e ? void 0 : e.override) ? a : () => {},
            io: null != (o = null == e ? void 0 : e.io) ? o : "output",
            counter: 0,
            seen: new Map,
            cycles: null != (c = null == e ? void 0 : e.cycles) ? c : "ref",
            reused: null != (u = null == e ? void 0 : e.reused) ? u : "inline",
            external: null != (l = null == e ? void 0 : e.external) ? l : void 0
        }
    }

    function ag(e, t) {
        var n, i, r;
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
        t.seen.set(e, u);
        let l = null == (n = (i = e._zod).toJSONSchema) ? void 0 : n.call(i);
        if (l) u.schema = l;
        else {
            let n = {
                ...a,
                schemaPath: [...a.schemaPath, e],
                path: a.path
            };
            if (e._zod.processJSONSchema) e._zod.processJSONSchema(t, u.schema, n);
            else {
                let i = u.schema,
                    r = t.processors[o.type];
                if (!r) throw Error("[toJSONSchema]: Non-representable type encountered: ".concat(o.type));
                r(e, t, i, n)
            }
            let i = e._zod.parent;
            i && (u.ref || (u.ref = i), ag(i, t, n), t.seen.get(i).isParent = !0)
        }
        let s = t.metadataRegistry.get(e);
        return s && Object.assign(u.schema, s), "input" === t.io && function e(t, n) {
            let i = null != n ? n : {
                seen: new Set
            };
            if (i.seen.has(t)) return !1;
            i.seen.add(t);
            let r = t._zod.def;
            if ("transform" === r.type) return !0;
            if ("array" === r.type) return e(r.element, i);
            if ("set" === r.type) return e(r.valueType, i);
            if ("lazy" === r.type) return e(r.getter(), i);
            if ("promise" === r.type || "optional" === r.type || "nonoptional" === r.type || "nullable" === r.type || "readonly" === r.type || "default" === r.type || "prefault" === r.type) return e(r.innerType, i);
            if ("intersection" === r.type) return e(r.left, i) || e(r.right, i);
            if ("record" === r.type || "map" === r.type) return e(r.keyType, i) || e(r.valueType, i);
            if ("pipe" === r.type) return !!t._zod.traits.has("$ZodCodec") || e(r.in, i) || e(r.out, i);
            if ("object" === r.type) {
                for (let t in r.shape)
                    if (e(r.shape[t], i)) return !0;
                return !1
            }
            if ("union" === r.type) {
                for (let t of r.options)
                    if (e(t, i)) return !0;
                return !1
            }
            if ("tuple" === r.type) {
                for (let t of r.items)
                    if (e(t, i)) return !0;
                if (r.rest && e(r.rest, i)) return !0
            }
            return !1
        }(e) && (delete u.schema.examples, delete u.schema.default), "input" === t.io && "_prefault" in u.schema && (null != (r = u.schema).default || (r.default = u.schema._prefault)), delete u.schema._prefault, t.seen.get(e).schema
    }

    function ah(e, t) {
        var n, i, r, a;
        let o = e.seen.get(t);
        if (!o) throw Error("Unprocessed schema. This is a bug in Zod.");
        let c = new Map;
        for (let t of e.seen.entries()) {
            let i = null == (n = e.metadataRegistry.get(t[0])) ? void 0 : n.id;
            if (i) {
                let e = c.get(i);
                if (e && e !== t[0]) throw Error('Duplicate schema id "'.concat(i, '" detected during JSON Schema conversion. Two different schemas cannot share the same id when converted together.'));
                c.set(i, t[0])
            }
        }
        let u = t => {
            if (t[1].schema.$ref) return;
            let n = t[1],
                {
                    ref: i,
                    defId: r
                } = (t => {
                    var n, i, r, a, c;
                    let u = "draft-2020-12" === e.target ? "$defs" : "definitions";
                    if (e.external) {
                        let n = null == (c = e.external.registry.get(t[0])) ? void 0 : c.id,
                            o = null != (i = e.external.uri) ? i : e => e;
                        if (n) return {
                            ref: o(n)
                        };
                        let l = null != (r = null != (a = t[1].defId) ? a : t[1].schema.id) ? r : "schema".concat(e.counter++);
                        return t[1].defId = l, {
                            defId: l,
                            ref: "".concat(o("__shared"), "#/").concat(u, "/").concat(l)
                        }
                    }
                    if (t[1] === o) return {
                        ref: "#"
                    };
                    let l = "".concat("#", "/").concat(u, "/"),
                        s = null != (n = t[1].schema.id) ? n : "__schema".concat(e.counter++);
                    return {
                        defId: s,
                        ref: l + s
                    }
                })(t);
            n.def = {
                ...n.schema
            }, r && (n.defId = r);
            let a = n.schema;
            for (let e in a) delete a[e];
            a.$ref = i
        };
        if ("throw" === e.cycles)
            for (let t of e.seen.entries()) {
                let e = t[1];
                if (e.cycle) throw Error("Cycle detected: " + "#/".concat(null == (i = e.cycle) ? void 0 : i.join("/"), "/<root>") + '\n\nSet the `cycles` parameter to `"ref"` to resolve cyclical schemas with defs.')
            }
        for (let n of e.seen.entries()) {
            let i = n[1];
            if (t === n[0]) {
                u(n);
                continue
            }
            if (e.external) {
                let i = null == (a = e.external.registry.get(n[0])) ? void 0 : a.id;
                if (t !== n[0] && i) {
                    u(n);
                    continue
                }
            }
            if ((null == (r = e.metadataRegistry.get(n[0])) ? void 0 : r.id) || i.cycle || i.count > 1 && "ref" === e.reused) {
                u(n);
                continue
            }
        }
    }

    function a_(e, t) {
        var n, i, r, a, o, c;
        let u = e.seen.get(t);
        if (!u) throw Error("Unprocessed schema. This is a bug in Zod.");
        let l = t => {
            var n, i, r;
            let a = e.seen.get(t);
            if (null === a.ref) return;
            let o = null != (n = a.def) ? n : a.schema,
                c = {
                    ...o
                },
                u = a.ref;
            if (a.ref = null, u) {
                l(u);
                let n = e.seen.get(u),
                    i = n.schema;
                if (i.$ref && ("draft-07" === e.target || "draft-04" === e.target || "openapi-3.0" === e.target) ? (o.allOf = null != (r = o.allOf) ? r : [], o.allOf.push(i)) : Object.assign(o, i), Object.assign(o, c), t._zod.parent === u)
                    for (let e in o) "$ref" !== e && "allOf" !== e && (e in c || delete o[e]);
                if (i.$ref && n.def)
                    for (let e in o) "$ref" !== e && "allOf" !== e && e in n.def && JSON.stringify(o[e]) === JSON.stringify(n.def[e]) && delete o[e]
            }
            let s = t._zod.parent;
            if (s && s !== u) {
                l(s);
                let t = e.seen.get(s);
                if ((null == t ? void 0 : t.schema.$ref) && (o.$ref = t.schema.$ref, t.def))
                    for (let e in o) "$ref" !== e && "allOf" !== e && e in t.def && JSON.stringify(o[e]) === JSON.stringify(t.def[e]) && delete o[e]
            }
            e.override({
                zodSchema: t,
                jsonSchema: o,
                path: null != (i = a.path) ? i : []
            })
        };
        for (let t of [...e.seen.entries()].reverse()) l(t[0]);
        let s = {};
        if ("draft-2020-12" === e.target ? s.$schema = "https://json-schema.org/draft/2020-12/schema" : "draft-07" === e.target ? s.$schema = "http://json-schema.org/draft-07/schema#" : "draft-04" === e.target ? s.$schema = "http://json-schema.org/draft-04/schema#" : e.target, null == (r = e.external) ? void 0 : r.uri) {
            let n = null == (c = e.external.registry.get(t)) ? void 0 : c.id;
            if (!n) throw Error("Schema is missing an `id` property");
            s.$id = e.external.uri(n)
        }
        Object.assign(s, null != (n = u.def) ? n : u.schema);
        let d = null == (a = e.metadataRegistry.get(t)) ? void 0 : a.id;
        void 0 !== d && s.id === d && delete s.id;
        let m = null != (i = null == (o = e.external) ? void 0 : o.defs) ? i : {};
        for (let t of e.seen.entries()) {
            let e = t[1];
            e.def && e.defId && (e.def.id === e.defId && delete e.def.id, m[e.defId] = e.def)
        }
        e.external || Object.keys(m).length > 0 && ("draft-2020-12" === e.target ? s.$defs = m : s.definitions = m);
        try {
            let n = JSON.parse(JSON.stringify(s));
            return Object.defineProperty(n, "~standard", {
                value: {
                    ...t["~standard"],
                    jsonSchema: {
                        input: ab(t, "input", e.processors),
                        output: ab(t, "output", e.processors)
                    }
                },
                enumerable: !1,
                writable: !1
            }), n
        } catch (e) {
            throw Error("Error converting schema to JSON.")
        }
    }
    e.s(["TimePrecision", 0, iQ, "_any", 0, rs, "_array", 0, rK, "_base64", 0, iX, "_base64url", 0, iq, "_bigint", 0, ri, "_boolean", 0, rt, "_catch", 0, at, "_check", 0, as, "_cidrv4", 0, iB, "_cidrv6", 0, iV, "_coercedBigint", 0, rr, "_coercedBoolean", 0, rn, "_coercedDate", 0, rp, "_coercedNumber", 0, i9, "_coercedString", 0, iO, "_cuid", 0, iC, "_cuid2", 0, iJ, "_custom", 0, ac, "_date", 0, rv, "_default", 0, r7, "_discriminatedUnion", 0, rX, "_e164", 0, iY, "_email", 0, ij, "_emoji", 0, iA, "_endsWith", 0, rA, "_enum", 0, r4, "_file", 0, r2, "_float32", 0, i8, "_float64", 0, i7, "_gt", 0, ry, "_gte", 0, rb, "_guid", 0, iD, "_includes", 0, rE, "_int", 0, i3, "_int32", 0, i5, "_int64", 0, ra, "_intersection", 0, rq, "_ipv4", 0, iW, "_ipv6", 0, iG, "_isoDate", 0, i4, "_isoDateTime", 0, i0, "_isoDuration", 0, i1, "_isoTime", 0, i6, "_jwt", 0, iH, "_ksuid", 0, iM, "_lazy", 0, aa, "_length", 0, rD, "_literal", 0, r1, "_lowercase", 0, r$, "_lt", 0, rh, "_lte", 0, r_, "_mac", 0, iK, "_map", 0, rQ, "_max", 0, r_, "_maxLength", 0, rO, "_maxSize", 0, rz, "_mime", 0, rC, "_min", 0, rb, "_minLength", 0, rj, "_minSize", 0, rZ, "_multipleOf", 0, rw, "_nan", 0, rg, "_nanoid", 0, iL, "_nativeEnum", 0, r6, "_negative", 0, rI, "_never", 0, rm, "_nonnegative", 0, rS, "_nonoptional", 0, r5, "_nonpositive", 0, rx, "_normalize", 0, rR, "_null", 0, rl, "_nullable", 0, r8, "_number", 0, i2, "_optional", 0, r3, "_overwrite", 0, rJ, "_pipe", 0, an, "_positive", 0, rk, "_promise", 0, ao, "_property", 0, rL, "_readonly", 0, ai, "_record", 0, rH, "_refine", 0, au, "_regex", 0, rP, "_set", 0, r0, "_size", 0, rU, "_slugify", 0, rG, "_startsWith", 0, rT, "_string", 0, iU, "_stringFormat", 0, av, "_stringbool", 0, af, "_success", 0, ae, "_superRefine", 0, al, "_symbol", 0, rc, "_templateLiteral", 0, ar, "_toLowerCase", 0, rM, "_toUpperCase", 0, rW, "_transform", 0, r9, "_trim", 0, rF, "_tuple", 0, rY, "_uint32", 0, re, "_uint64", 0, ro, "_ulid", 0, iR, "_undefined", 0, ru, "_union", 0, rB, "_unknown", 0, rd, "_uppercase", 0, rN, "_url", 0, iT, "_uuid", 0, iP, "_uuidv4", 0, i$, "_uuidv6", 0, iN, "_uuidv7", 0, iE, "_void", 0, rf, "_xid", 0, iF, "_xor", 0, rV, "describe", 0, ad, "meta", 0, am], 583555), e.i(583555);
    let ay = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return n => {
                let i = ap({
                    ...n,
                    processors: t
                });
                return ag(e, i), ah(i, e), a_(i, e)
            }
        },
        ab = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
            return i => {
                let {
                    libraryOptions: r,
                    target: a
                } = null != i ? i : {}, o = ap({
                    ...null != r ? r : {},
                    target: a,
                    io: t,
                    processors: n
                });
                return ag(e, o), ah(o, e), a_(o, e)
            }
        };
    e.s(["createStandardJSONSchemaMethod", 0, ab, "createToJSONSchemaMethod", 0, ay, "extractDefs", 0, ah, "finalize", 0, a_, "initializeContext", 0, ap, "process", 0, ag], 342235), e.i(342235);
    let ak = {
            guid: "uuid",
            url: "uri",
            datetime: "date-time",
            json_string: "json-string",
            regex: ""
        },
        aI = (e, t, n, i) => {
            n.type = "string";
            let {
                minimum: r,
                maximum: a,
                format: o,
                patterns: c,
                contentEncoding: u
            } = e._zod.bag;
            if ("number" == typeof r && (n.minLength = r), "number" == typeof a && (n.maxLength = a), o) {
                var l;
                n.format = null != (l = ak[o]) ? l : o, "" === n.format && delete n.format, "time" === o && delete n.format
            }
            if (u && (n.contentEncoding = u), c && c.size > 0) {
                let e = [...c];
                1 === e.length ? n.pattern = e[0].source : e.length > 1 && (n.allOf = [...e.map(e => ({
                    ..."draft-07" === t.target || "draft-04" === t.target || "openapi-3.0" === t.target ? {
                        type: "string"
                    } : {},
                    pattern: e.source
                }))])
            }
        },
        ax = (e, t, n, i) => {
            let {
                minimum: r,
                maximum: a,
                format: o,
                multipleOf: c,
                exclusiveMaximum: u,
                exclusiveMinimum: l
            } = e._zod.bag;
            "string" == typeof o && o.includes("int") ? n.type = "integer" : n.type = "number";
            let s = "number" == typeof l && l >= (null != r ? r : -1 / 0),
                d = "number" == typeof u && u <= (null != a ? a : 1 / 0),
                m = "draft-04" === t.target || "openapi-3.0" === t.target;
            s ? m ? (n.minimum = l, n.exclusiveMinimum = !0) : n.exclusiveMinimum = l : "number" == typeof r && (n.minimum = r), d ? m ? (n.maximum = u, n.exclusiveMaximum = !0) : n.exclusiveMaximum = u : "number" == typeof a && (n.maximum = a), "number" == typeof c && (n.multipleOf = c)
        },
        aS = (e, t, n, i) => {
            n.type = "boolean"
        },
        aw = (e, t, n, i) => {
            if ("throw" === t.unrepresentable) throw Error("BigInt cannot be represented in JSON Schema")
        },
        az = (e, t, n, i) => {
            if ("throw" === t.unrepresentable) throw Error("Symbols cannot be represented in JSON Schema")
        },
        aZ = (e, t, n, i) => {
            "openapi-3.0" === t.target ? (n.type = "string", n.nullable = !0, n.enum = [null]) : n.type = "null"
        },
        aU = (e, t, n, i) => {
            if ("throw" === t.unrepresentable) throw Error("Undefined cannot be represented in JSON Schema")
        },
        aO = (e, t, n, i) => {
            if ("throw" === t.unrepresentable) throw Error("Void cannot be represented in JSON Schema")
        },
        aj = (e, t, n, i) => {
            n.not = {}
        },
        aD = (e, t, n, i) => {},
        aP = (e, t, n, i) => {},
        a$ = (e, t, n, i) => {
            if ("throw" === t.unrepresentable) throw Error("Date cannot be represented in JSON Schema")
        },
        aN = (e, t, n, i) => {
            let r = u(e._zod.def.entries);
            r.every(e => "number" == typeof e) && (n.type = "number"), r.every(e => "string" == typeof e) && (n.type = "string"), n.enum = r
        },
        aE = (e, t, n, i) => {
            let r = e._zod.def,
                a = [];
            for (let e of r.values)
                if (void 0 === e) {
                    if ("throw" === t.unrepresentable) throw Error("Literal `undefined` cannot be represented in JSON Schema")
                } else if ("bigint" == typeof e)
                if ("throw" === t.unrepresentable) throw Error("BigInt literals cannot be represented in JSON Schema");
                else a.push(Number(e));
            else a.push(e);
            if (0 === a.length);
            else if (1 === a.length) {
                let e = a[0];
                n.type = null === e ? "null" : typeof e, "draft-04" === t.target || "openapi-3.0" === t.target ? n.enum = [e] : n.const = e
            } else a.every(e => "number" == typeof e) && (n.type = "number"), a.every(e => "string" == typeof e) && (n.type = "string"), a.every(e => "boolean" == typeof e) && (n.type = "boolean"), a.every(e => null === e) && (n.type = "null"), n.enum = a
        },
        aT = (e, t, n, i) => {
            if ("throw" === t.unrepresentable) throw Error("NaN cannot be represented in JSON Schema")
        },
        aA = (e, t, n, i) => {
            let r = e._zod.pattern;
            if (!r) throw Error("Pattern not found in template literal");
            n.type = "string", n.pattern = r.source
        },
        aL = (e, t, n, i) => {
            let r = {
                    type: "string",
                    format: "binary",
                    contentEncoding: "binary"
                },
                {
                    minimum: a,
                    maximum: o,
                    mime: c
                } = e._zod.bag;
            void 0 !== a && (r.minLength = a), void 0 !== o && (r.maxLength = o), c ? 1 === c.length ? (r.contentMediaType = c[0], Object.assign(n, r)) : (Object.assign(n, r), n.anyOf = c.map(e => ({
                contentMediaType: e
            }))) : Object.assign(n, r)
        },
        aC = (e, t, n, i) => {
            n.type = "boolean"
        },
        aJ = (e, t, n, i) => {
            if ("throw" === t.unrepresentable) throw Error("Custom types cannot be represented in JSON Schema")
        },
        aR = (e, t, n, i) => {
            if ("throw" === t.unrepresentable) throw Error("Function types cannot be represented in JSON Schema")
        },
        aF = (e, t, n, i) => {
            if ("throw" === t.unrepresentable) throw Error("Transforms cannot be represented in JSON Schema")
        },
        aM = (e, t, n, i) => {
            if ("throw" === t.unrepresentable) throw Error("Map cannot be represented in JSON Schema")
        },
        aW = (e, t, n, i) => {
            if ("throw" === t.unrepresentable) throw Error("Set cannot be represented in JSON Schema")
        },
        aG = (e, t, n, i) => {
            let r = e._zod.def,
                {
                    minimum: a,
                    maximum: o
                } = e._zod.bag;
            "number" == typeof a && (n.minItems = a), "number" == typeof o && (n.maxItems = o), n.type = "array", n.items = ag(r.element, t, {
                ...i,
                path: [...i.path, "items"]
            })
        },
        aK = (e, t, n, i) => {
            var r;
            let a = e._zod.def;
            n.type = "object", n.properties = {};
            let o = a.shape;
            for (let e in o) n.properties[e] = ag(o[e], t, {
                ...i,
                path: [...i.path, "properties", e]
            });
            let c = new Set([...new Set(Object.keys(o))].filter(e => {
                let n = a.shape[e]._zod;
                return "input" === t.io ? void 0 === n.optin : void 0 === n.optout
            }));
            c.size > 0 && (n.required = Array.from(c)), (null == (r = a.catchall) ? void 0 : r._zod.def.type) === "never" ? n.additionalProperties = !1 : a.catchall ? a.catchall && (n.additionalProperties = ag(a.catchall, t, {
                ...i,
                path: [...i.path, "additionalProperties"]
            })) : "output" === t.io && (n.additionalProperties = !1)
        },
        aB = (e, t, n, i) => {
            let r = e._zod.def,
                a = !1 === r.inclusive,
                o = r.options.map((e, n) => ag(e, t, {
                    ...i,
                    path: [...i.path, a ? "oneOf" : "anyOf", n]
                }));
            a ? n.oneOf = o : n.anyOf = o
        },
        aV = (e, t, n, i) => {
            let r = e._zod.def,
                a = ag(r.left, t, {
                    ...i,
                    path: [...i.path, "allOf", 0]
                }),
                o = ag(r.right, t, {
                    ...i,
                    path: [...i.path, "allOf", 1]
                }),
                c = e => "allOf" in e && 1 === Object.keys(e).length;
            n.allOf = [...c(a) ? a.allOf : [a], ...c(o) ? o.allOf : [o]]
        },
        aX = (e, t, n, i) => {
            let r = e._zod.def;
            n.type = "array";
            let a = "draft-2020-12" === t.target ? "prefixItems" : "items",
                o = "draft-2020-12" === t.target || "openapi-3.0" === t.target ? "items" : "additionalItems",
                c = r.items.map((e, n) => ag(e, t, {
                    ...i,
                    path: [...i.path, a, n]
                })),
                u = r.rest ? ag(r.rest, t, {
                    ...i,
                    path: [...i.path, o, ..."openapi-3.0" === t.target ? [r.items.length] : []]
                }) : null;
            "draft-2020-12" === t.target ? (n.prefixItems = c, u && (n.items = u)) : "openapi-3.0" === t.target ? (n.items = {
                anyOf: c
            }, u && n.items.anyOf.push(u), n.minItems = c.length, u || (n.maxItems = c.length)) : (n.items = c, u && (n.additionalItems = u));
            let {
                minimum: l,
                maximum: s
            } = e._zod.bag;
            "number" == typeof l && (n.minItems = l), "number" == typeof s && (n.maxItems = s)
        },
        aq = (e, t, n, i) => {
            let r = e._zod.def;
            n.type = "object";
            let a = r.keyType,
                o = a._zod.bag,
                c = null == o ? void 0 : o.patterns;
            if ("loose" === r.mode && c && c.size > 0) {
                let e = ag(r.valueType, t, {
                    ...i,
                    path: [...i.path, "patternProperties", "*"]
                });
                for (let t of (n.patternProperties = {}, c)) n.patternProperties[t.source] = e
            } else("draft-07" === t.target || "draft-2020-12" === t.target) && (n.propertyNames = ag(r.keyType, t, {
                ...i,
                path: [...i.path, "propertyNames"]
            })), n.additionalProperties = ag(r.valueType, t, {
                ...i,
                path: [...i.path, "additionalProperties"]
            });
            let u = a._zod.values;
            if (u) {
                let e = [...u].filter(e => "string" == typeof e || "number" == typeof e);
                e.length > 0 && (n.required = e)
            }
        },
        aY = (e, t, n, i) => {
            let r = e._zod.def,
                a = ag(r.innerType, t, i),
                o = t.seen.get(e);
            "openapi-3.0" === t.target ? (o.ref = r.innerType, n.nullable = !0) : n.anyOf = [a, {
                type: "null"
            }]
        },
        aH = (e, t, n, i) => {
            let r = e._zod.def;
            ag(r.innerType, t, i), t.seen.get(e).ref = r.innerType
        },
        aQ = (e, t, n, i) => {
            let r = e._zod.def;
            ag(r.innerType, t, i), t.seen.get(e).ref = r.innerType, n.default = JSON.parse(JSON.stringify(r.defaultValue))
        },
        a0 = (e, t, n, i) => {
            let r = e._zod.def;
            ag(r.innerType, t, i), t.seen.get(e).ref = r.innerType, "input" === t.io && (n._prefault = JSON.parse(JSON.stringify(r.defaultValue)))
        },
        a4 = (e, t, n, i) => {
            let r, a = e._zod.def;
            ag(a.innerType, t, i), t.seen.get(e).ref = a.innerType;
            try {
                r = a.catchValue(void 0)
            } catch (e) {
                throw Error("Dynamic catch values are not supported in JSON Schema")
            }
            n.default = r
        },
        a6 = (e, t, n, i) => {
            let r = e._zod.def,
                a = r.in._zod.traits.has("$ZodTransform"),
                o = "input" === t.io ? a ? r.out : r.in : r.out;
            ag(o, t, i), t.seen.get(e).ref = o
        },
        a1 = (e, t, n, i) => {
            let r = e._zod.def;
            ag(r.innerType, t, i), t.seen.get(e).ref = r.innerType, n.readOnly = !0
        },
        a2 = (e, t, n, i) => {
            let r = e._zod.def;
            ag(r.innerType, t, i), t.seen.get(e).ref = r.innerType
        },
        a9 = (e, t, n, i) => {
            let r = e._zod.def;
            ag(r.innerType, t, i), t.seen.get(e).ref = r.innerType
        },
        a3 = (e, t, n, i) => {
            let r = e._zod.innerType;
            ag(r, t, i), t.seen.get(e).ref = r
        },
        a8 = {
            string: aI,
            number: ax,
            boolean: aS,
            bigint: aw,
            symbol: az,
            null: aZ,
            undefined: aU,
            void: aO,
            never: aj,
            any: aD,
            unknown: aP,
            date: a$,
            enum: aN,
            literal: aE,
            nan: aT,
            template_literal: aA,
            file: aL,
            success: aC,
            custom: aJ,
            function: aR,
            transform: aF,
            map: aM,
            set: aW,
            array: aG,
            object: aK,
            union: aB,
            intersection: aV,
            tuple: aX,
            record: aq,
            nullable: aY,
            nonoptional: aH,
            default: aQ,
            prefault: a0,
            catch: a4,
            pipe: a6,
            readonly: a1,
            promise: a2,
            optional: a9,
            lazy: a3
        };

    function a7(e, t) {
        if ("_idmap" in e) {
            let n = ap({
                    ...t,
                    processors: a8
                }),
                i = {};
            for (let t of e._idmap.entries()) {
                let [e, i] = t;
                ag(i, n)
            }
            let r = {};
            for (let a of (n.external = {
                    registry: e,
                    uri: null == t ? void 0 : t.uri,
                    defs: i
                }, e._idmap.entries())) {
                let [e, t] = a;
                ah(n, t), r[e] = a_(n, t)
            }
            return Object.keys(i).length > 0 && (r.__shared = {
                ["draft-2020-12" === n.target ? "$defs" : "definitions"]: i
            }), {
                schemas: r
            }
        }
        let n = ap({
            ...t,
            processors: a8
        });
        return ag(e, n), ah(n, e), a_(n, e)
    }
    e.s(["allProcessors", 0, a8, "anyProcessor", 0, aD, "arrayProcessor", 0, aG, "bigintProcessor", 0, aw, "booleanProcessor", 0, aS, "catchProcessor", 0, a4, "customProcessor", 0, aJ, "dateProcessor", 0, a$, "defaultProcessor", 0, aQ, "enumProcessor", 0, aN, "fileProcessor", 0, aL, "functionProcessor", 0, aR, "intersectionProcessor", 0, aV, "lazyProcessor", 0, a3, "literalProcessor", 0, aE, "mapProcessor", 0, aM, "nanProcessor", 0, aT, "neverProcessor", 0, aj, "nonoptionalProcessor", 0, aH, "nullProcessor", 0, aZ, "nullableProcessor", 0, aY, "numberProcessor", 0, ax, "objectProcessor", 0, aK, "optionalProcessor", 0, a9, "pipeProcessor", 0, a6, "prefaultProcessor", 0, a0, "promiseProcessor", 0, a2, "readonlyProcessor", 0, a1, "recordProcessor", 0, aq, "setProcessor", 0, aW, "stringProcessor", 0, aI, "successProcessor", 0, aC, "symbolProcessor", 0, az, "templateLiteralProcessor", 0, aA, "toJSONSchema", 0, a7, "transformProcessor", 0, aF, "tupleProcessor", 0, aX, "undefinedProcessor", 0, aU, "unionProcessor", 0, aB, "unknownProcessor", 0, aP, "voidProcessor", 0, aO], 856326), e.s(["$ZodAny", 0, nZ, "$ZodArray", 0, n$, "$ZodAsyncError", 0, r, "$ZodBase64", 0, nm, "$ZodBase64URL", 0, nv, "$ZodBigInt", 0, nI, "$ZodBigIntFormat", 0, nx, "$ZodBoolean", 0, nk, "$ZodCIDRv4", 0, nl, "$ZodCIDRv6", 0, ns, "$ZodCUID", 0, t8, "$ZodCUID2", 0, t7, "$ZodCatch", 0, io, "$ZodCheck", 0, tz, "$ZodCheckBigIntFormat", 0, tP, "$ZodCheckEndsWith", 0, tG, "$ZodCheckGreaterThan", 0, tO, "$ZodCheckIncludes", 0, tM, "$ZodCheckLengthEquals", 0, tL, "$ZodCheckLessThan", 0, tU, "$ZodCheckLowerCase", 0, tR, "$ZodCheckMaxLength", 0, tT, "$ZodCheckMaxSize", 0, t$, "$ZodCheckMimeType", 0, tV, "$ZodCheckMinLength", 0, tA, "$ZodCheckMinSize", 0, tN, "$ZodCheckMultipleOf", 0, tj, "$ZodCheckNumberFormat", 0, tD, "$ZodCheckOverwrite", 0, tX, "$ZodCheckProperty", 0, tB, "$ZodCheckRegex", 0, tJ, "$ZodCheckSizeEquals", 0, tE, "$ZodCheckStartsWith", 0, tW, "$ZodCheckStringFormat", 0, tC, "$ZodCheckUpperCase", 0, tF, "$ZodCodec", 0, is, "$ZodCustom", 0, ik, "$ZodCustomStringFormat", 0, n_, "$ZodDate", 0, nD, "$ZodDefault", 0, n5, "$ZodDiscriminatedUnion", 0, nM, "$ZodE164", 0, np, "$ZodEmail", 0, t1, "$ZodEmoji", 0, t9, "$ZodEncodeError", 0, a, "$ZodEnum", 0, n4, "$ZodError", 0, e9, "$ZodExactOptional", 0, n8, "$ZodFile", 0, n1, "$ZodFunction", 0, i_, "$ZodGUID", 0, t4, "$ZodIPv4", 0, no, "$ZodIPv6", 0, nc, "$ZodISODate", 0, ni, "$ZodISODateTime", 0, nn, "$ZodISODuration", 0, na, "$ZodISOTime", 0, nr, "$ZodIntersection", 0, nW, "$ZodJWT", 0, nh, "$ZodKSUID", 0, nt, "$ZodLazy", 0, ib, "$ZodLiteral", 0, n6, "$ZodMAC", 0, nu, "$ZodMap", 0, nY, "$ZodNaN", 0, ic, "$ZodNanoID", 0, t3, "$ZodNever", 0, nO, "$ZodNonOptional", 0, ii, "$ZodNull", 0, nz, "$ZodNullable", 0, n7, "$ZodNumber", 0, ny, "$ZodNumberFormat", 0, nb, "$ZodObject", 0, nA, "$ZodObjectJIT", 0, nL, "$ZodOptional", 0, n3, "$ZodPipe", 0, iu, "$ZodPrefault", 0, it, "$ZodPreprocess", 0, iv, "$ZodPromise", 0, iy, "$ZodReadonly", 0, ip, "$ZodRealError", 0, e3, "$ZodRecord", 0, nq, "$ZodRegistry", 0, iw, "$ZodSet", 0, nQ, "$ZodString", 0, tQ, "$ZodStringFormat", 0, t0, "$ZodSuccess", 0, ia, "$ZodSymbol", 0, nS, "$ZodTemplateLiteral", 0, ih, "$ZodTransform", 0, n2, "$ZodTuple", 0, nK, "$ZodType", 0, tH, "$ZodULID", 0, t5, "$ZodURL", 0, t2, "$ZodUUID", 0, t6, "$ZodUndefined", 0, nw, "$ZodUnion", 0, nJ, "$ZodUnknown", 0, nU, "$ZodVoid", 0, nj, "$ZodXID", 0, ne, "$ZodXor", 0, nF, "$brand", 0, i, "$constructor", 0, n, "$input", 0, iS, "$output", 0, ix, "Doc", 0, tq, "JSONSchema", 0, e1, "JSONSchemaGenerator", 0, class {
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
            return ag(e, this.ctx, t)
        }
        emit(e, t) {
            t && (t.cycles && (this.ctx.cycles = t.cycles), t.reused && (this.ctx.reused = t.reused), t.external && (this.ctx.external = t.external)), ah(this.ctx, e);
            let {
                "~standard": n,
                ...i
            } = a_(this.ctx, e);
            return i
        }
        constructor(e) {
            var t;
            let n = null != (t = null == e ? void 0 : e.target) ? t : "draft-2020-12";
            "draft-4" === n && (n = "draft-04"), "draft-7" === n && (n = "draft-07"), this.ctx = ap({
                processors: a8,
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
    }, "NEVER", 0, t, "TimePrecision", 0, iQ, "_any", 0, rs, "_array", 0, rK, "_base64", 0, iX, "_base64url", 0, iq, "_bigint", 0, ri, "_boolean", 0, rt, "_catch", 0, at, "_check", 0, as, "_cidrv4", 0, iB, "_cidrv6", 0, iV, "_coercedBigint", 0, rr, "_coercedBoolean", 0, rn, "_coercedDate", 0, rp, "_coercedNumber", 0, i9, "_coercedString", 0, iO, "_cuid", 0, iC, "_cuid2", 0, iJ, "_custom", 0, ac, "_date", 0, rv, "_decode", 0, tm, "_decodeAsync", 0, tg, "_default", 0, r7, "_discriminatedUnion", 0, rX, "_e164", 0, iY, "_email", 0, ij, "_emoji", 0, iA, "_encode", 0, ts, "_encodeAsync", 0, tv, "_endsWith", 0, rA, "_enum", 0, r4, "_file", 0, r2, "_float32", 0, i8, "_float64", 0, i7, "_gt", 0, ry, "_gte", 0, rb, "_guid", 0, iD, "_includes", 0, rE, "_int", 0, i3, "_int32", 0, i5, "_int64", 0, ra, "_intersection", 0, rq, "_ipv4", 0, iW, "_ipv6", 0, iG, "_isoDate", 0, i4, "_isoDateTime", 0, i0, "_isoDuration", 0, i1, "_isoTime", 0, i6, "_jwt", 0, iH, "_ksuid", 0, iM, "_lazy", 0, aa, "_length", 0, rD, "_literal", 0, r1, "_lowercase", 0, r$, "_lt", 0, rh, "_lte", 0, r_, "_mac", 0, iK, "_map", 0, rQ, "_max", 0, r_, "_maxLength", 0, rO, "_maxSize", 0, rz, "_mime", 0, rC, "_min", 0, rb, "_minLength", 0, rj, "_minSize", 0, rZ, "_multipleOf", 0, rw, "_nan", 0, rg, "_nanoid", 0, iL, "_nativeEnum", 0, r6, "_negative", 0, rI, "_never", 0, rm, "_nonnegative", 0, rS, "_nonoptional", 0, r5, "_nonpositive", 0, rx, "_normalize", 0, rR, "_null", 0, rl, "_nullable", 0, r8, "_number", 0, i2, "_optional", 0, r3, "_overwrite", 0, rJ, "_parse", 0, tn, "_parseAsync", 0, tr, "_pipe", 0, an, "_positive", 0, rk, "_promise", 0, ao, "_property", 0, rL, "_readonly", 0, ai, "_record", 0, rH, "_refine", 0, au, "_regex", 0, rP, "_safeDecode", 0, tb, "_safeDecodeAsync", 0, tS, "_safeEncode", 0, t_, "_safeEncodeAsync", 0, tI, "_safeParse", 0, to, "_safeParseAsync", 0, tu, "_set", 0, r0, "_size", 0, rU, "_slugify", 0, rG, "_startsWith", 0, rT, "_string", 0, iU, "_stringFormat", 0, av, "_stringbool", 0, af, "_success", 0, ae, "_superRefine", 0, al, "_symbol", 0, rc, "_templateLiteral", 0, ar, "_toLowerCase", 0, rM, "_toUpperCase", 0, rW, "_transform", 0, r9, "_trim", 0, rF, "_tuple", 0, rY, "_uint32", 0, re, "_uint64", 0, ro, "_ulid", 0, iR, "_undefined", 0, ru, "_union", 0, rB, "_unknown", 0, rd, "_uppercase", 0, rN, "_url", 0, iT, "_uuid", 0, iP, "_uuidv4", 0, i$, "_uuidv6", 0, iN, "_uuidv7", 0, iE, "_void", 0, rf, "_xid", 0, iF, "_xor", 0, rV, "clone", 0, O, "config", 0, c, "createStandardJSONSchemaMethod", 0, ab, "createToJSONSchemaMethod", 0, ay, "decode", 0, tf, "decodeAsync", 0, th, "describe", 0, ad, "encode", 0, td, "encodeAsync", 0, tp, "extractDefs", 0, ah, "finalize", 0, a_, "flattenError", 0, e8, "formatError", 0, e7, "globalConfig", 0, o, "globalRegistry", 0, iZ, "initializeContext", 0, ap, "isValidBase64", 0, nd, "isValidBase64URL", 0, nf, "isValidJWT", 0, ng, "locales", 0, e6, "meta", 0, am, "parse", 0, ti, "parseAsync", 0, ta, "prettifyError", 0, tt, "process", 0, ag, "regexes", 0, eK, "registry", 0, iz, "safeDecode", 0, tk, "safeDecodeAsync", 0, tw, "safeEncode", 0, ty, "safeEncodeAsync", 0, tx, "safeParse", 0, tc, "safeParseAsync", 0, tl, "toDotPath", 0, te, "toJSONSchema", 0, a7, "treeifyError", 0, e5, "util", 0, X, "version", 0, tY], 304528);
    var a5 = e.i(304528);
    e.s(["ZodISODate", () => u2, "ZodISODateTime", () => u6, "ZodISODuration", () => u7, "ZodISOTime", () => u3, "date", () => u9, "datetime", () => u1, "duration", () => u5, "time", () => u8], 307138), e.s(["ZodAny", () => cj, "ZodArray", () => cJ, "ZodBase64", () => o3, "ZodBase64URL", () => o7, "ZodBigInt", () => cy, "ZodBigIntFormat", () => ck, "ZodBoolean", () => ch, "ZodCIDRv4", () => o6, "ZodCIDRv6", () => o2, "ZodCUID", () => oJ, "ZodCUID2", () => oF, "ZodCatch", () => uw, "ZodCodec", () => uD, "ZodCustom", () => uG, "ZodCustomStringFormat", () => cr, "ZodDate", () => cL, "ZodDefault", () => uh, "ZodDiscriminatedUnion", () => cY, "ZodE164", () => ce, "ZodEmail", () => oS, "ZodEmoji", () => oT, "ZodEnum", () => ut, "ZodExactOptional", () => um, "ZodFile", () => uo, "ZodFunction", () => uM, "ZodGUID", () => oz, "ZodIPv4", () => oq, "ZodIPv6", () => o0, "ZodIntersection", () => cQ, "ZodJWT", () => cn, "ZodKSUID", () => oV, "ZodLazy", () => uC, "ZodLiteral", () => ur, "ZodMAC", () => oH, "ZodMap", () => c8, "ZodNaN", () => uZ, "ZodNanoID", () => oL, "ZodNever", () => cN, "ZodNonOptional", () => uk, "ZodNull", () => cU, "ZodNullable", () => uv, "ZodNumber", () => cl, "ZodNumberFormat", () => cd, "ZodObject", () => cM, "ZodOptional", () => us, "ZodPipe", () => uO, "ZodPrefault", () => uy, "ZodPreprocess", () => uN, "ZodPromise", () => uR, "ZodReadonly", () => uE, "ZodRecord", () => c1, "ZodSet", () => c5, "ZodString", () => ok, "ZodStringFormat", () => ox, "ZodSuccess", () => ux, "ZodSymbol", () => cS, "ZodTemplateLiteral", () => uA, "ZodTransform", () => uu, "ZodTuple", () => c4, "ZodType", () => oy, "ZodULID", () => oW, "ZodURL", () => o$, "ZodUUID", () => oU, "ZodUndefined", () => cz, "ZodUnion", () => cB, "ZodUnknown", () => cP, "ZodVoid", () => cT, "ZodXID", () => oK, "ZodXor", () => cX, "_ZodString", () => ob, "_default", () => u_, "_function", () => uW, "any", () => cD, "array", () => cR, "base64", () => o8, "base64url", () => o5, "bigint", () => cb, "boolean", () => c_, "catch", () => uz, "check", () => uK, "cidrv4", () => o1, "cidrv6", () => o9, "codec", () => uP, "cuid", () => oR, "cuid2", () => oM, "custom", () => uB, "date", () => cC, "describe", () => uq, "discriminatedUnion", () => cH, "e164", () => ct, "email", () => ow, "emoji", () => oA, "enum", () => un, "exactOptional", () => uf, "file", () => uc, "float32", () => cf, "float64", () => cv, "function", () => uW, "guid", () => oZ, "hash", () => cu, "hex", () => cc, "hostname", () => co, "httpUrl", () => oE, "instanceof", () => uH, "int", () => cm, "int32", () => cp, "int64", () => cI, "intersection", () => c0, "invertCodec", () => u$, "ipv4", () => oY, "ipv6", () => o4, "json", () => u0, "jwt", () => ci, "keyof", () => cF, "ksuid", () => oX, "lazy", () => uJ, "literal", () => ua, "looseObject", () => cK, "looseRecord", () => c3, "mac", () => oQ, "map", () => c7, "meta", () => uY, "nan", () => uU, "nanoid", () => oC, "nativeEnum", () => ui, "never", () => cE, "nonoptional", () => uI, "null", () => cO, "nullable", () => up, "nullish", () => ug, "number", () => cs, "object", () => cW, "optional", () => ud, "partialRecord", () => c9, "pipe", () => uj, "prefault", () => ub, "preprocess", () => u4, "promise", () => uF, "readonly", () => uT, "record", () => c2, "refine", () => uV, "set", () => ue, "strictObject", () => cG, "string", () => oI, "stringFormat", () => ca, "stringbool", () => uQ, "success", () => uS, "superRefine", () => uX, "symbol", () => cw, "templateLiteral", () => uL, "transform", () => ul, "tuple", () => c6, "uint32", () => cg, "uint64", () => cx, "ulid", () => oG, "undefined", () => cZ, "union", () => cV, "unknown", () => c$, "url", () => oN, "uuid", () => oO, "uuidv4", () => oj, "uuidv6", () => oD, "uuidv7", () => oP, "void", () => cA, "xid", () => oB, "xor", () => cq], 298296);
    var oe = eK;
    e.s(["regexes", 0, oe], 427542);
    var oe = eK,
        ot = X;
    e.s(["minLength", 0, rj], 694257);
    let on = (e, t) => {
            e9.init(e, t), e.name = "ZodError", Object.defineProperties(e, {
                format: {
                    value: t => e7(e, t)
                },
                flatten: {
                    value: t => e8(e, t)
                },
                addIssue: {
                    value: t => {
                        e.issues.push(t), e.message = JSON.stringify(e.issues, s, 2)
                    }
                },
                addIssues: {
                    value: t => {
                        e.issues.push(...t), e.message = JSON.stringify(e.issues, s, 2)
                    }
                },
                isEmpty: {
                    get: () => 0 === e.issues.length
                }
            })
        },
        oi = n("ZodError", on),
        or = n("ZodError", on, {
            Parent: Error
        });
    e.s(["ZodError", 0, oi, "ZodRealError", 0, or], 985249);
    let oa = tn(or),
        oo = tr(or),
        oc = to(or),
        ou = tu(or),
        ol = ts(or),
        os = tm(or),
        od = tv(or),
        om = tg(or),
        of = t_(or),
        ov = tb(or),
        op = tI(or),
        og = tS(or);
    e.s(["decode", 0, os, "decodeAsync", 0, om, "encode", 0, ol, "encodeAsync", 0, od, "parse", 0, oa, "parseAsync", 0, oo, "safeDecode", 0, ov, "safeDecodeAsync", 0, og, "safeEncode", 0, of, "safeEncodeAsync", 0, op, "safeParse", 0, oc, "safeParseAsync", 0, ou], 753895);
    let oh = new WeakMap;

    function o_(e, t, n) {
        let i = Object.getPrototypeOf(e),
            r = oh.get(i);
        if (r || (r = new Set, oh.set(i, r)), !r.has(t))
            for (let e in r.add(t), n) {
                let t = n[e];
                Object.defineProperty(i, e, {
                    configurable: !0,
                    enumerable: !1,
                    get() {
                        let n = t.bind(this);
                        return Object.defineProperty(this, e, {
                            configurable: !0,
                            writable: !0,
                            enumerable: !0,
                            value: n
                        }), n
                    },
                    set(t) {
                        Object.defineProperty(this, e, {
                            configurable: !0,
                            writable: !0,
                            enumerable: !0,
                            value: t
                        })
                    }
                })
            }
    }
    let oy = n("ZodType", (e, t) => (tH.init(e, t), Object.assign(e["~standard"], {
            jsonSchema: {
                input: ab(e, "input"),
                output: ab(e, "output")
            }
        }), e.toJSONSchema = ay(e, {}), e.def = t, e.type = t.type, Object.defineProperty(e, "_def", {
            value: t
        }), e.parse = (t, n) => oa(e, t, n, {
            callee: e.parse
        }), e.safeParse = (t, n) => oc(e, t, n), e.parseAsync = async (t, n) => oo(e, t, n, {
            callee: e.parseAsync
        }), e.safeParseAsync = async (t, n) => ou(e, t, n), e.spa = e.safeParseAsync, e.encode = (t, n) => ol(e, t, n), e.decode = (t, n) => os(e, t, n), e.encodeAsync = async (t, n) => od(e, t, n), e.decodeAsync = async (t, n) => om(e, t, n), e.safeEncode = (t, n) => of(e, t, n), e.safeDecode = (t, n) => ov(e, t, n), e.safeEncodeAsync = async (t, n) => op(e, t, n), e.safeDecodeAsync = async (t, n) => og(e, t, n), o_(e, "ZodType", {
            check() {
                for (var e, t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
                let r = this.def;
                return this.clone(ot.mergeDefs(r, {
                    checks: [...null != (e = r.checks) ? e : [], ...n.map(e => "function" == typeof e ? {
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
                return O(this, e, t)
            },
            brand() {
                return this
            },
            register(e, t) {
                return e.add(this, t), this
            },
            refine(e, t) {
                return this.check(uV(e, t))
            },
            superRefine(e, t) {
                return this.check(uX(e, t))
            },
            overwrite(e) {
                return this.check(rJ(e))
            },
            optional() {
                return ud(this)
            },
            exactOptional() {
                return uf(this)
            },
            nullable() {
                return up(this)
            },
            nullish() {
                return ud(up(this))
            },
            nonoptional(e) {
                return uI(this, e)
            },
            array() {
                return cR(this)
            },
            or(e) {
                return cV([this, e])
            },
            and(e) {
                return c0(this, e)
            },
            transform(e) {
                return uj(this, ul(e))
            },
            default (e) {
                return u_(this, e)
            },
            prefault(e) {
                return ub(this, e)
            },
            catch (e) {
                return uz(this, e)
            },
            pipe(e) {
                return uj(this, e)
            },
            readonly() {
                return uT(this)
            },
            describe(e) {
                let t = this.clone();
                return iZ.add(t, {
                    description: e
                }), t
            },
            meta() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                if (0 === t.length) return iZ.get(this);
                let i = this.clone();
                return iZ.add(i, t[0]), i
            },
            isOptional() {
                return this.safeParse(void 0).success
            },
            isNullable() {
                return this.safeParse(null).success
            },
            apply(e) {
                return e(this)
            }
        }), Object.defineProperty(e, "description", {
            get() {
                var t;
                return null == (t = iZ.get(e)) ? void 0 : t.description
            },
            configurable: !0
        }), e)),
        ob = n("_ZodString", (e, t) => {
            var n, i, r;
            tQ.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aI(e, t, n, i);
            let a = e._zod.bag;
            e.format = null != (n = a.format) ? n : null, e.minLength = null != (i = a.minimum) ? i : null, e.maxLength = null != (r = a.maximum) ? r : null, o_(e, "_ZodString", {
                regex() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return this.check(rP(...t))
                },
                includes() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return this.check(rE(...t))
                },
                startsWith() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return this.check(rT(...t))
                },
                endsWith() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return this.check(rA(...t))
                },
                min() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return this.check(rj(...t))
                },
                max() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return this.check(rO(...t))
                },
                length() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return this.check(rD(...t))
                },
                nonempty() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return this.check(rj(1, ...t))
                },
                lowercase(e) {
                    return this.check(r$(e))
                },
                uppercase(e) {
                    return this.check(rN(e))
                },
                trim() {
                    return this.check(rF())
                },
                normalize() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return this.check(rR(...t))
                },
                toLowerCase() {
                    return this.check(rM())
                },
                toUpperCase() {
                    return this.check(rW())
                },
                slugify() {
                    return this.check(rG())
                }
            })
        }),
        ok = n("ZodString", (e, t) => {
            tQ.init(e, t), ob.init(e, t), e.email = t => e.check(ij(oS, t)), e.url = t => e.check(iT(o$, t)), e.jwt = t => e.check(iH(cn, t)), e.emoji = t => e.check(iA(oT, t)), e.guid = t => e.check(iD(oz, t)), e.uuid = t => e.check(iP(oU, t)), e.uuidv4 = t => e.check(i$(oU, t)), e.uuidv6 = t => e.check(iN(oU, t)), e.uuidv7 = t => e.check(iE(oU, t)), e.nanoid = t => e.check(iL(oL, t)), e.guid = t => e.check(iD(oz, t)), e.cuid = t => e.check(iC(oJ, t)), e.cuid2 = t => e.check(iJ(oF, t)), e.ulid = t => e.check(iR(oW, t)), e.base64 = t => e.check(iX(o3, t)), e.base64url = t => e.check(iq(o7, t)), e.xid = t => e.check(iF(oK, t)), e.ksuid = t => e.check(iM(oV, t)), e.ipv4 = t => e.check(iW(oq, t)), e.ipv6 = t => e.check(iG(o0, t)), e.cidrv4 = t => e.check(iB(o6, t)), e.cidrv6 = t => e.check(iV(o2, t)), e.e164 = t => e.check(iY(ce, t)), e.datetime = t => e.check(u1(t)), e.date = t => e.check(u9(t)), e.time = t => e.check(u8(t)), e.duration = t => e.check(u5(t))
        });

    function oI(e) {
        return iU(ok, e)
    }
    let ox = n("ZodStringFormat", (e, t) => {
            t0.init(e, t), ob.init(e, t)
        }),
        oS = n("ZodEmail", (e, t) => {
            t1.init(e, t), ox.init(e, t)
        });

    function ow(e) {
        return ij(oS, e)
    }
    let oz = n("ZodGUID", (e, t) => {
        t4.init(e, t), ox.init(e, t)
    });

    function oZ(e) {
        return iD(oz, e)
    }
    let oU = n("ZodUUID", (e, t) => {
        t6.init(e, t), ox.init(e, t)
    });

    function oO(e) {
        return iP(oU, e)
    }

    function oj(e) {
        return i$(oU, e)
    }

    function oD(e) {
        return iN(oU, e)
    }

    function oP(e) {
        return iE(oU, e)
    }
    let o$ = n("ZodURL", (e, t) => {
        t2.init(e, t), ox.init(e, t)
    });

    function oN(e) {
        return iT(o$, e)
    }

    function oE(e) {
        return iT(o$, {
            protocol: oe.httpProtocol,
            hostname: oe.domain,
            ...ot.normalizeParams(e)
        })
    }
    let oT = n("ZodEmoji", (e, t) => {
        t9.init(e, t), ox.init(e, t)
    });

    function oA(e) {
        return iA(oT, e)
    }
    let oL = n("ZodNanoID", (e, t) => {
        t3.init(e, t), ox.init(e, t)
    });

    function oC(e) {
        return iL(oL, e)
    }
    let oJ = n("ZodCUID", (e, t) => {
        t8.init(e, t), ox.init(e, t)
    });

    function oR(e) {
        return iC(oJ, e)
    }
    let oF = n("ZodCUID2", (e, t) => {
        t7.init(e, t), ox.init(e, t)
    });

    function oM(e) {
        return iJ(oF, e)
    }
    let oW = n("ZodULID", (e, t) => {
        t5.init(e, t), ox.init(e, t)
    });

    function oG(e) {
        return iR(oW, e)
    }
    let oK = n("ZodXID", (e, t) => {
        ne.init(e, t), ox.init(e, t)
    });

    function oB(e) {
        return iF(oK, e)
    }
    let oV = n("ZodKSUID", (e, t) => {
        nt.init(e, t), ox.init(e, t)
    });

    function oX(e) {
        return iM(oV, e)
    }
    let oq = n("ZodIPv4", (e, t) => {
        no.init(e, t), ox.init(e, t)
    });

    function oY(e) {
        return iW(oq, e)
    }
    let oH = n("ZodMAC", (e, t) => {
        nu.init(e, t), ox.init(e, t)
    });

    function oQ(e) {
        return iK(oH, e)
    }
    let o0 = n("ZodIPv6", (e, t) => {
        nc.init(e, t), ox.init(e, t)
    });

    function o4(e) {
        return iG(o0, e)
    }
    let o6 = n("ZodCIDRv4", (e, t) => {
        nl.init(e, t), ox.init(e, t)
    });

    function o1(e) {
        return iB(o6, e)
    }
    let o2 = n("ZodCIDRv6", (e, t) => {
        ns.init(e, t), ox.init(e, t)
    });

    function o9(e) {
        return iV(o2, e)
    }
    let o3 = n("ZodBase64", (e, t) => {
        nm.init(e, t), ox.init(e, t)
    });

    function o8(e) {
        return iX(o3, e)
    }
    let o7 = n("ZodBase64URL", (e, t) => {
        nv.init(e, t), ox.init(e, t)
    });

    function o5(e) {
        return iq(o7, e)
    }
    let ce = n("ZodE164", (e, t) => {
        np.init(e, t), ox.init(e, t)
    });

    function ct(e) {
        return iY(ce, e)
    }
    let cn = n("ZodJWT", (e, t) => {
        nh.init(e, t), ox.init(e, t)
    });

    function ci(e) {
        return iH(cn, e)
    }
    let cr = n("ZodCustomStringFormat", (e, t) => {
        n_.init(e, t), ox.init(e, t)
    });

    function ca(e, t) {
        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return av(cr, e, t, n)
    }

    function co(e) {
        return av(cr, "hostname", oe.hostname, e)
    }

    function cc(e) {
        return av(cr, "hex", oe.hex, e)
    }

    function cu(e, t) {
        var n;
        let i = null != (n = null == t ? void 0 : t.enc) ? n : "hex",
            r = "".concat(e, "_").concat(i),
            a = oe[r];
        if (!a) throw Error("Unrecognized hash format: ".concat(r));
        return av(cr, r, a, t)
    }
    let cl = n("ZodNumber", (e, t) => {
        var n, i, r, a, o, c, u, l, s;
        ny.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => ax(e, t, n, i), o_(e, "ZodNumber", {
            gt(e, t) {
                return this.check(ry(e, t))
            },
            gte(e, t) {
                return this.check(rb(e, t))
            },
            min(e, t) {
                return this.check(rb(e, t))
            },
            lt(e, t) {
                return this.check(rh(e, t))
            },
            lte(e, t) {
                return this.check(r_(e, t))
            },
            max(e, t) {
                return this.check(r_(e, t))
            },
            int(e) {
                return this.check(cm(e))
            },
            safe(e) {
                return this.check(cm(e))
            },
            positive(e) {
                return this.check(ry(0, e))
            },
            nonnegative(e) {
                return this.check(rb(0, e))
            },
            negative(e) {
                return this.check(rh(0, e))
            },
            nonpositive(e) {
                return this.check(r_(0, e))
            },
            multipleOf(e, t) {
                return this.check(rw(e, t))
            },
            step(e, t) {
                return this.check(rw(e, t))
            },
            finite() {
                return this
            }
        });
        let d = e._zod.bag;
        e.minValue = null != (n = Math.max(null != (i = d.minimum) ? i : -1 / 0, null != (r = d.exclusiveMinimum) ? r : -1 / 0)) ? n : null, e.maxValue = null != (a = Math.min(null != (o = d.maximum) ? o : 1 / 0, null != (c = d.exclusiveMaximum) ? c : 1 / 0)) ? a : null, e.isInt = (null != (u = d.format) ? u : "").includes("int") || Number.isSafeInteger(null != (l = d.multipleOf) ? l : .5), e.isFinite = !0, e.format = null != (s = d.format) ? s : null
    });

    function cs(e) {
        return i2(cl, e)
    }
    let cd = n("ZodNumberFormat", (e, t) => {
        nb.init(e, t), cl.init(e, t)
    });

    function cm(e) {
        return i3(cd, e)
    }

    function cf(e) {
        return i8(cd, e)
    }

    function cv(e) {
        return i7(cd, e)
    }

    function cp(e) {
        return i5(cd, e)
    }

    function cg(e) {
        return re(cd, e)
    }
    let ch = n("ZodBoolean", (e, t) => {
        nk.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aS(e, t, n, i)
    });

    function c_(e) {
        return rt(ch, e)
    }
    let cy = n("ZodBigInt", (e, t) => {
        var n, i, r;
        nI.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aw(e, t, n, i), e.gte = (t, n) => e.check(rb(t, n)), e.min = (t, n) => e.check(rb(t, n)), e.gt = (t, n) => e.check(ry(t, n)), e.gte = (t, n) => e.check(rb(t, n)), e.min = (t, n) => e.check(rb(t, n)), e.lt = (t, n) => e.check(rh(t, n)), e.lte = (t, n) => e.check(r_(t, n)), e.max = (t, n) => e.check(r_(t, n)), e.positive = t => e.check(ry(BigInt(0), t)), e.negative = t => e.check(rh(BigInt(0), t)), e.nonpositive = t => e.check(r_(BigInt(0), t)), e.nonnegative = t => e.check(rb(BigInt(0), t)), e.multipleOf = (t, n) => e.check(rw(t, n));
        let a = e._zod.bag;
        e.minValue = null != (n = a.minimum) ? n : null, e.maxValue = null != (i = a.maximum) ? i : null, e.format = null != (r = a.format) ? r : null
    });

    function cb(e) {
        return ri(cy, e)
    }
    let ck = n("ZodBigIntFormat", (e, t) => {
        nx.init(e, t), cy.init(e, t)
    });

    function cI(e) {
        return ra(ck, e)
    }

    function cx(e) {
        return ro(ck, e)
    }
    let cS = n("ZodSymbol", (e, t) => {
        nS.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => az(e, t, n, i)
    });

    function cw(e) {
        return rc(cS, e)
    }
    let cz = n("ZodUndefined", (e, t) => {
        nw.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aU(e, t, n, i)
    });

    function cZ(e) {
        return ru(cz, e)
    }
    let cU = n("ZodNull", (e, t) => {
        nz.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aZ(e, t, n, i)
    });

    function cO(e) {
        return rl(cU, e)
    }
    let cj = n("ZodAny", (e, t) => {
        nZ.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aD(e, t, n, i)
    });

    function cD() {
        return rs(cj)
    }
    let cP = n("ZodUnknown", (e, t) => {
        nU.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aP(e, t, n, i)
    });

    function c$() {
        return rd(cP)
    }
    let cN = n("ZodNever", (e, t) => {
        nO.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aj(e, t, n, i)
    });

    function cE(e) {
        return rm(cN, e)
    }
    let cT = n("ZodVoid", (e, t) => {
        nj.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aO(e, t, n, i)
    });

    function cA(e) {
        return rf(cT, e)
    }
    let cL = n("ZodDate", (e, t) => {
        nD.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => a$(e, t, n, i), e.min = (t, n) => e.check(rb(t, n)), e.max = (t, n) => e.check(r_(t, n));
        let n = e._zod.bag;
        e.minDate = n.minimum ? new Date(n.minimum) : null, e.maxDate = n.maximum ? new Date(n.maximum) : null
    });

    function cC(e) {
        return rv(cL, e)
    }
    let cJ = n("ZodArray", (e, t) => {
        n$.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aG(e, t, n, i), e.element = t.element, o_(e, "ZodArray", {
            min(e, t) {
                return this.check(rj(e, t))
            },
            nonempty(e) {
                return this.check(rj(1, e))
            },
            max(e, t) {
                return this.check(rO(e, t))
            },
            length(e, t) {
                return this.check(rD(e, t))
            },
            unwrap() {
                return this.element
            }
        })
    });

    function cR(e, t) {
        return rK(cJ, e, t)
    }

    function cF(e) {
        return un(Object.keys(e._zod.def.shape))
    }
    let cM = n("ZodObject", (e, t) => {
        nL.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aK(e, t, n, i), ot.defineLazy(e, "shape", () => t.shape), o_(e, "ZodObject", {
            keyof() {
                return un(Object.keys(this._zod.def.shape))
            },
            catchall(e) {
                return this.clone({
                    ...this._zod.def,
                    catchall: e
                })
            },
            passthrough() {
                return this.clone({
                    ...this._zod.def,
                    catchall: c$()
                })
            },
            loose() {
                return this.clone({
                    ...this._zod.def,
                    catchall: c$()
                })
            },
            strict() {
                return this.clone({
                    ...this._zod.def,
                    catchall: cE()
                })
            },
            strip() {
                return this.clone({
                    ...this._zod.def,
                    catchall: void 0
                })
            },
            extend(e) {
                return ot.extend(this, e)
            },
            safeExtend(e) {
                return ot.safeExtend(this, e)
            },
            merge(e) {
                return ot.merge(this, e)
            },
            pick(e) {
                return ot.pick(this, e)
            },
            omit(e) {
                return ot.omit(this, e)
            },
            partial() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return ot.partial(us, this, t[0])
            },
            required() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return ot.required(uk, this, t[0])
            }
        })
    });

    function cW(e, t) {
        return new cM({
            type: "object",
            shape: null != e ? e : {},
            ...ot.normalizeParams(t)
        })
    }

    function cG(e, t) {
        return new cM({
            type: "object",
            shape: e,
            catchall: cE(),
            ...ot.normalizeParams(t)
        })
    }

    function cK(e, t) {
        return new cM({
            type: "object",
            shape: e,
            catchall: c$(),
            ...ot.normalizeParams(t)
        })
    }
    let cB = n("ZodUnion", (e, t) => {
        nJ.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aB(e, t, n, i), e.options = t.options
    });

    function cV(e, t) {
        return new cB({
            type: "union",
            options: e,
            ...ot.normalizeParams(t)
        })
    }
    let cX = n("ZodXor", (e, t) => {
        cB.init(e, t), nF.init(e, t), e._zod.processJSONSchema = (t, n, i) => aB(e, t, n, i), e.options = t.options
    });

    function cq(e, t) {
        return new cX({
            type: "union",
            options: e,
            inclusive: !1,
            ...ot.normalizeParams(t)
        })
    }
    let cY = n("ZodDiscriminatedUnion", (e, t) => {
        cB.init(e, t), nM.init(e, t)
    });

    function cH(e, t, n) {
        return new cY({
            type: "union",
            options: t,
            discriminator: e,
            ...ot.normalizeParams(n)
        })
    }
    let cQ = n("ZodIntersection", (e, t) => {
        nW.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aV(e, t, n, i)
    });

    function c0(e, t) {
        return new cQ({
            type: "intersection",
            left: e,
            right: t
        })
    }
    let c4 = n("ZodTuple", (e, t) => {
        nK.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aX(e, t, n, i), e.rest = t => e.clone({
            ...e._zod.def,
            rest: t
        })
    });

    function c6(e, t, n) {
        let i = t instanceof tH,
            r = i ? n : t;
        return new c4({
            type: "tuple",
            items: e,
            rest: i ? t : null,
            ...ot.normalizeParams(r)
        })
    }
    let c1 = n("ZodRecord", (e, t) => {
        nq.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aq(e, t, n, i), e.keyType = t.keyType, e.valueType = t.valueType
    });

    function c2(e, t, n) {
        return new c1(t && t._zod ? {
            type: "record",
            keyType: e,
            valueType: t,
            ...ot.normalizeParams(n)
        } : {
            type: "record",
            keyType: oI(),
            valueType: e,
            ...ot.normalizeParams(t)
        })
    }

    function c9(e, t, n) {
        let i = O(e);
        return i._zod.values = void 0, new c1({
            type: "record",
            keyType: i,
            valueType: t,
            ...ot.normalizeParams(n)
        })
    }

    function c3(e, t, n) {
        return new c1({
            type: "record",
            keyType: e,
            valueType: t,
            mode: "loose",
            ...ot.normalizeParams(n)
        })
    }
    let c8 = n("ZodMap", (e, t) => {
        nY.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aM(e, t, n, i), e.keyType = t.keyType, e.valueType = t.valueType, e.min = function() {
            for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
            return e.check(rZ(...n))
        }, e.nonempty = t => e.check(rZ(1, t)), e.max = function() {
            for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
            return e.check(rz(...n))
        }, e.size = function() {
            for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
            return e.check(rU(...n))
        }
    });

    function c7(e, t, n) {
        return new c8({
            type: "map",
            keyType: e,
            valueType: t,
            ...ot.normalizeParams(n)
        })
    }
    let c5 = n("ZodSet", (e, t) => {
        nQ.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aW(e, t, n, i), e.min = function() {
            for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
            return e.check(rZ(...n))
        }, e.nonempty = t => e.check(rZ(1, t)), e.max = function() {
            for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
            return e.check(rz(...n))
        }, e.size = function() {
            for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
            return e.check(rU(...n))
        }
    });

    function ue(e, t) {
        return new c5({
            type: "set",
            valueType: e,
            ...ot.normalizeParams(t)
        })
    }
    let ut = n("ZodEnum", (e, t) => {
        n4.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aN(e, t, n, i), e.enum = t.entries, e.options = Object.values(t.entries);
        let n = new Set(Object.keys(t.entries));
        e.extract = (e, i) => {
            let r = {};
            for (let i of e)
                if (n.has(i)) r[i] = t.entries[i];
                else throw Error("Key ".concat(i, " not found in enum"));
            return new ut({
                ...t,
                checks: [],
                ...ot.normalizeParams(i),
                entries: r
            })
        }, e.exclude = (e, i) => {
            let r = {
                ...t.entries
            };
            for (let t of e)
                if (n.has(t)) delete r[t];
                else throw Error("Key ".concat(t, " not found in enum"));
            return new ut({
                ...t,
                checks: [],
                ...ot.normalizeParams(i),
                entries: r
            })
        }
    });

    function un(e, t) {
        return new ut({
            type: "enum",
            entries: Array.isArray(e) ? Object.fromEntries(e.map(e => [e, e])) : e,
            ...ot.normalizeParams(t)
        })
    }

    function ui(e, t) {
        return new ut({
            type: "enum",
            entries: e,
            ...ot.normalizeParams(t)
        })
    }
    let ur = n("ZodLiteral", (e, t) => {
        n6.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aE(e, t, n, i), e.values = new Set(t.values), Object.defineProperty(e, "value", {
            get() {
                if (t.values.length > 1) throw Error("This schema contains multiple valid literal values. Use `.values` instead.");
                return t.values[0]
            }
        })
    });

    function ua(e, t) {
        return new ur({
            type: "literal",
            values: Array.isArray(e) ? e : [e],
            ...ot.normalizeParams(t)
        })
    }
    let uo = n("ZodFile", (e, t) => {
        n1.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aL(e, t, n, i), e.min = (t, n) => e.check(rZ(t, n)), e.max = (t, n) => e.check(rz(t, n)), e.mime = (t, n) => e.check(rC(Array.isArray(t) ? t : [t], n))
    });

    function uc(e) {
        return r2(uo, e)
    }
    let uu = n("ZodTransform", (e, t) => {
        n2.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aF(e, t, n, i), e._zod.parse = (n, i) => {
            if ("backward" === i.direction) throw new a(e.constructor.name);
            n.addIssue = i => {
                if ("string" == typeof i) n.issues.push(ot.issue(i, n.value, t));
                else i.fatal && (i.continue = !1), null != i.code || (i.code = "custom"), null != i.input || (i.input = n.value), null != i.inst || (i.inst = e), n.issues.push(ot.issue(i))
            };
            let r = t.transform(n.value, n);
            return r instanceof Promise ? r.then(e => (n.value = e, n.fallback = !0, n)) : (n.value = r, n.fallback = !0, n)
        }
    });

    function ul(e) {
        return new uu({
            type: "transform",
            transform: e
        })
    }
    let us = n("ZodOptional", (e, t) => {
        n3.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => a9(e, t, n, i), e.unwrap = () => e._zod.def.innerType
    });

    function ud(e) {
        return new us({
            type: "optional",
            innerType: e
        })
    }
    let um = n("ZodExactOptional", (e, t) => {
        n8.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => a9(e, t, n, i), e.unwrap = () => e._zod.def.innerType
    });

    function uf(e) {
        return new um({
            type: "optional",
            innerType: e
        })
    }
    let uv = n("ZodNullable", (e, t) => {
        n7.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aY(e, t, n, i), e.unwrap = () => e._zod.def.innerType
    });

    function up(e) {
        return new uv({
            type: "nullable",
            innerType: e
        })
    }

    function ug(e) {
        return ud(up(e))
    }
    let uh = n("ZodDefault", (e, t) => {
        n5.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aQ(e, t, n, i), e.unwrap = () => e._zod.def.innerType, e.removeDefault = e.unwrap
    });

    function u_(e, t) {
        return new uh({
            type: "default",
            innerType: e,
            get defaultValue() {
                return "function" == typeof t ? t() : ot.shallowClone(t)
            }
        })
    }
    let uy = n("ZodPrefault", (e, t) => {
        it.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => a0(e, t, n, i), e.unwrap = () => e._zod.def.innerType
    });

    function ub(e, t) {
        return new uy({
            type: "prefault",
            innerType: e,
            get defaultValue() {
                return "function" == typeof t ? t() : ot.shallowClone(t)
            }
        })
    }
    let uk = n("ZodNonOptional", (e, t) => {
        ii.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aH(e, t, n, i), e.unwrap = () => e._zod.def.innerType
    });

    function uI(e, t) {
        return new uk({
            type: "nonoptional",
            innerType: e,
            ...ot.normalizeParams(t)
        })
    }
    let ux = n("ZodSuccess", (e, t) => {
        ia.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aC(e, t, n, i), e.unwrap = () => e._zod.def.innerType
    });

    function uS(e) {
        return new ux({
            type: "success",
            innerType: e
        })
    }
    let uw = n("ZodCatch", (e, t) => {
        io.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => a4(e, t, n, i), e.unwrap = () => e._zod.def.innerType, e.removeCatch = e.unwrap
    });

    function uz(e, t) {
        return new uw({
            type: "catch",
            innerType: e,
            catchValue: "function" == typeof t ? t : () => t
        })
    }
    let uZ = n("ZodNaN", (e, t) => {
        ic.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aT(e, t, n, i)
    });

    function uU(e) {
        return rg(uZ, e)
    }
    let uO = n("ZodPipe", (e, t) => {
        iu.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => a6(e, t, n, i), e.in = t.in, e.out = t.out
    });

    function uj(e, t) {
        return new uO({
            type: "pipe",
            in: e,
            out: t
        })
    }
    let uD = n("ZodCodec", (e, t) => {
        uO.init(e, t), is.init(e, t)
    });

    function uP(e, t, n) {
        return new uD({
            type: "pipe",
            in: e,
            out: t,
            transform: n.decode,
            reverseTransform: n.encode
        })
    }

    function u$(e) {
        let t = e._zod.def;
        return new uD({
            type: "pipe",
            in: t.out,
            out: t.in,
            transform: t.reverseTransform,
            reverseTransform: t.transform
        })
    }
    let uN = n("ZodPreprocess", (e, t) => {
            uO.init(e, t), iv.init(e, t)
        }),
        uE = n("ZodReadonly", (e, t) => {
            ip.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => a1(e, t, n, i), e.unwrap = () => e._zod.def.innerType
        });

    function uT(e) {
        return new uE({
            type: "readonly",
            innerType: e
        })
    }
    let uA = n("ZodTemplateLiteral", (e, t) => {
        ih.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aA(e, t, n, i)
    });

    function uL(e, t) {
        return new uA({
            type: "template_literal",
            parts: e,
            ...ot.normalizeParams(t)
        })
    }
    let uC = n("ZodLazy", (e, t) => {
        ib.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => a3(e, t, n, i), e.unwrap = () => e._zod.def.getter()
    });

    function uJ(e) {
        return new uC({
            type: "lazy",
            getter: e
        })
    }
    let uR = n("ZodPromise", (e, t) => {
        iy.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => a2(e, t, n, i), e.unwrap = () => e._zod.def.innerType
    });

    function uF(e) {
        return new uR({
            type: "promise",
            innerType: e
        })
    }
    let uM = n("ZodFunction", (e, t) => {
        i_.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aR(e, t, n, i)
    });

    function uW(e) {
        var t, n;
        return new uM({
            type: "function",
            input: Array.isArray(null == e ? void 0 : e.input) ? c6(null == e ? void 0 : e.input) : null != (t = null == e ? void 0 : e.input) ? t : cR(c$()),
            output: null != (n = null == e ? void 0 : e.output) ? n : c$()
        })
    }
    let uG = n("ZodCustom", (e, t) => {
        ik.init(e, t), oy.init(e, t), e._zod.processJSONSchema = (t, n, i) => aJ(e, t, n, i)
    });

    function uK(e) {
        let t = new tz({
            check: "custom"
        });
        return t._zod.check = e, t
    }

    function uB(e, t) {
        return ac(uG, null != e ? e : () => !0, t)
    }

    function uV(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        return au(uG, e, t)
    }

    function uX(e, t) {
        return al(e, t)
    }
    let uq = ad,
        uY = am;

    function uH(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
            n = new uG({
                type: "custom",
                check: "custom",
                fn: t => t instanceof e,
                abort: !0,
                ...ot.normalizeParams(t)
            });
        return n._zod.bag.Class = e, n._zod.check = t => {
            if (!(t.value instanceof e)) {
                var i;
                t.issues.push({
                    code: "invalid_type",
                    expected: e.name,
                    input: t.value,
                    inst: n,
                    path: [...null != (i = n._zod.def.path) ? i : []]
                })
            }
        }, n
    }
    let uQ = function() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return af({
            Codec: uD,
            Boolean: ch,
            String: ok
        }, ...t)
    };

    function u0(e) {
        let t = uJ(() => cV([oI(e), cs(), c_(), cO(), cR(t), c2(oI(), t)]));
        return t
    }

    function u4(e, t) {
        return new uN({
            type: "pipe",
            in: ul(e),
            out: t
        })
    }
    let u6 = n("ZodISODateTime", (e, t) => {
        nn.init(e, t), ox.init(e, t)
    });

    function u1(e) {
        return i0(u6, e)
    }
    let u2 = n("ZodISODate", (e, t) => {
        ni.init(e, t), ox.init(e, t)
    });

    function u9(e) {
        return i4(u2, e)
    }
    let u3 = n("ZodISOTime", (e, t) => {
        nr.init(e, t), ox.init(e, t)
    });

    function u8(e) {
        return i6(u3, e)
    }
    let u7 = n("ZodISODuration", (e, t) => {
        na.init(e, t), ox.init(e, t)
    });

    function u5(e) {
        return i1(u7, e)
    }
    var le = e.i(307138);
    e.s(["bigint", 0, function(e) {
        return rr(cy, e)
    }, "boolean", 0, function(e) {
        return rn(ch, e)
    }, "date", 0, function(e) {
        return rp(cL, e)
    }, "number", 0, function(e) {
        return i9(cl, e)
    }, "string", 0, function(e) {
        return iO(ok, e)
    }], 361780);
    var lt = e.i(361780);
    c(eV()), e.s([], 895430), e.i(895430);
    var ln = e.i(298296);
    e.s([], 473882), e.i(473882), e.s(["endsWith", 0, rA, "gt", 0, ry, "gte", 0, rb, "includes", 0, rE, "length", 0, rD, "lowercase", 0, r$, "lt", 0, rh, "lte", 0, r_, "maxLength", 0, rO, "maxSize", 0, rz, "mime", 0, rC, "minLength", 0, rj, "minSize", 0, rZ, "multipleOf", 0, rw, "negative", 0, rI, "nonnegative", 0, rS, "nonpositive", 0, rx, "normalize", 0, rR, "overwrite", 0, rJ, "positive", 0, rk, "property", 0, rL, "regex", 0, rP, "size", 0, rU, "slugify", 0, rG, "startsWith", 0, rT, "toLowerCase", 0, rM, "toUpperCase", 0, rW, "trim", 0, rF, "uppercase", 0, rN], 409044);
    var li = e.i(409044);
    e.i(985249), e.i(753895);
    let lr = {
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

    function la(e) {
        c({
            customError: e
        })
    }

    function lo() {
        return c().customError
    }
    V || (V = {}), e.s(["ZodFirstPartyTypeKind", 0, V, "ZodIssueCode", 0, lr, "getErrorMap", 0, lo, "setErrorMap", 0, la], 114007), e.i(114007), e.s(["$brand", 0, i, "ZodFirstPartyTypeKind", 0, V, "ZodIssueCode", 0, lr, "config", 0, c, "getErrorMap", 0, lo, "setErrorMap", 0, la], 986189), e.i(986189);
    var oe = eK,
        ot = X;
    let lc = {
            ...ln,
            ...li,
            iso: le
        },
        lu = new Set(["$schema", "$ref", "$defs", "definitions", "$id", "id", "$comment", "$anchor", "$vocabulary", "$dynamicRef", "$dynamicAnchor", "type", "enum", "const", "anyOf", "oneOf", "allOf", "not", "properties", "required", "additionalProperties", "patternProperties", "propertyNames", "minProperties", "maxProperties", "items", "prefixItems", "additionalItems", "minItems", "maxItems", "uniqueItems", "contains", "minContains", "maxContains", "minLength", "maxLength", "pattern", "format", "minimum", "maximum", "exclusiveMinimum", "exclusiveMaximum", "multipleOf", "description", "default", "contentEncoding", "contentMediaType", "contentSchema", "unevaluatedItems", "unevaluatedProperties", "if", "then", "else", "dependentSchemas", "dependentRequired", "nullable", "readOnly"]);
    e.s(["$brand", 0, i, "$input", 0, iS, "$output", 0, ix, "NEVER", 0, t, "TimePrecision", 0, iQ, "ZodAny", 0, cj, "ZodArray", 0, cJ, "ZodBase64", 0, o3, "ZodBase64URL", 0, o7, "ZodBigInt", 0, cy, "ZodBigIntFormat", 0, ck, "ZodBoolean", 0, ch, "ZodCIDRv4", 0, o6, "ZodCIDRv6", 0, o2, "ZodCUID", 0, oJ, "ZodCUID2", 0, oF, "ZodCatch", 0, uw, "ZodCodec", 0, uD, "ZodCustom", 0, uG, "ZodCustomStringFormat", 0, cr, "ZodDate", 0, cL, "ZodDefault", 0, uh, "ZodDiscriminatedUnion", 0, cY, "ZodE164", 0, ce, "ZodEmail", 0, oS, "ZodEmoji", 0, oT, "ZodEnum", 0, ut, "ZodError", 0, oi, "ZodExactOptional", 0, um, "ZodFile", 0, uo, "ZodFirstPartyTypeKind", 0, V, "ZodFunction", 0, uM, "ZodGUID", 0, oz, "ZodIPv4", 0, oq, "ZodIPv6", 0, o0, "ZodISODate", 0, u2, "ZodISODateTime", 0, u6, "ZodISODuration", 0, u7, "ZodISOTime", 0, u3, "ZodIntersection", 0, cQ, "ZodIssueCode", 0, lr, "ZodJWT", 0, cn, "ZodKSUID", 0, oV, "ZodLazy", 0, uC, "ZodLiteral", 0, ur, "ZodMAC", 0, oH, "ZodMap", 0, c8, "ZodNaN", 0, uZ, "ZodNanoID", 0, oL, "ZodNever", 0, cN, "ZodNonOptional", 0, uk, "ZodNull", 0, cU, "ZodNullable", 0, uv, "ZodNumber", 0, cl, "ZodNumberFormat", 0, cd, "ZodObject", 0, cM, "ZodOptional", 0, us, "ZodPipe", 0, uO, "ZodPrefault", 0, uy, "ZodPreprocess", 0, uN, "ZodPromise", 0, uR, "ZodReadonly", 0, uE, "ZodRealError", 0, or, "ZodRecord", 0, c1, "ZodSet", 0, c5, "ZodString", 0, ok, "ZodStringFormat", 0, ox, "ZodSuccess", 0, ux, "ZodSymbol", 0, cS, "ZodTemplateLiteral", 0, uA, "ZodTransform", 0, uu, "ZodTuple", 0, c4, "ZodType", 0, oy, "ZodULID", 0, oW, "ZodURL", 0, o$, "ZodUUID", 0, oU, "ZodUndefined", 0, cz, "ZodUnion", 0, cB, "ZodUnknown", 0, cP, "ZodVoid", 0, cT, "ZodXID", 0, oK, "ZodXor", 0, cX, "_ZodString", 0, ob, "_default", 0, u_, "_function", 0, uW, "any", 0, cD, "array", 0, cR, "base64", 0, o8, "base64url", 0, o5, "bigint", 0, cb, "boolean", 0, c_, "catch", 0, uz, "check", 0, uK, "cidrv4", 0, o1, "cidrv6", 0, o9, "clone", 0, O, "codec", 0, uP, "coerce", 0, lt, "config", 0, c, "core", 0, a5, "cuid", 0, oR, "cuid2", 0, oM, "custom", 0, uB, "date", 0, cC, "decode", 0, os, "decodeAsync", 0, om, "describe", 0, uq, "discriminatedUnion", 0, cH, "e164", 0, ct, "email", 0, ow, "emoji", 0, oA, "encode", 0, ol, "encodeAsync", 0, od, "endsWith", 0, rA, "enum", 0, un, "exactOptional", 0, uf, "file", 0, uc, "flattenError", 0, e8, "float32", 0, cf, "float64", 0, cv, "formatError", 0, e7, "fromJSONSchema", 0, function(e, t) {
        var n, i, r;
        let a, o;
        if ("boolean" == typeof e) return e ? lc.any() : lc.never();
        try {
            a = JSON.parse(JSON.stringify(e))
        } catch (e) {
            throw Error("fromJSONSchema input is not valid JSON (possibly cyclic); use $defs/$ref for recursive schemas")
        }
        let c = {
            version: (i = a, r = null == t ? void 0 : t.defaultTarget, "https://json-schema.org/draft/2020-12/schema" === (o = i.$schema) ? "draft-2020-12" : "http://json-schema.org/draft-07/schema#" === o ? "draft-7" : "http://json-schema.org/draft-04/schema#" === o ? "draft-4" : null != r ? r : "draft-2020-12"),
            defs: a.$defs || a.definitions || {},
            refs: new Map,
            processing: new Set,
            rootSchema: a,
            registry: null != (n = null == t ? void 0 : t.registry) ? n : iZ
        };
        return function e(t, n) {
            if ("boolean" == typeof t) return t ? lc.any() : lc.never();
            let i = function t(n, i) {
                    let r;
                    if (void 0 !== n.not) {
                        if ("object" == typeof n.not && 0 === Object.keys(n.not).length) return lc.never();
                        throw Error("not is not supported in Zod (except { not: {} } for never)")
                    }
                    if (void 0 !== n.unevaluatedItems) throw Error("unevaluatedItems is not supported");
                    if (void 0 !== n.unevaluatedProperties) throw Error("unevaluatedProperties is not supported");
                    if (void 0 !== n.if || void 0 !== n.then || void 0 !== n.else) throw Error("Conditional schemas (if/then/else) are not supported");
                    if (void 0 !== n.dependentSchemas || void 0 !== n.dependentRequired) throw Error("dependentSchemas and dependentRequired are not supported");
                    if (n.$ref) {
                        let t = n.$ref;
                        if (i.refs.has(t)) return i.refs.get(t);
                        if (i.processing.has(t)) return lc.lazy(() => {
                            if (!i.refs.has(t)) throw Error("Circular reference not resolved: ".concat(t));
                            return i.refs.get(t)
                        });
                        i.processing.add(t);
                        let r = e(function(e, t) {
                            if (!e.startsWith("#")) throw Error("External $ref is not supported, only local refs (#/...) are allowed");
                            let n = e.slice(1).split("/").filter(Boolean);
                            if (0 === n.length) return t.rootSchema;
                            let i = "draft-2020-12" === t.version ? "$defs" : "definitions";
                            if (n[0] === i) {
                                let i = n[1];
                                if (!i || !t.defs[i]) throw Error("Reference not found: ".concat(e));
                                return t.defs[i]
                            }
                            throw Error("Reference not found: ".concat(e))
                        }(t, i), i);
                        return i.refs.set(t, r), i.processing.delete(t), r
                    }
                    if (void 0 !== n.enum) {
                        let e = n.enum;
                        if ("openapi-3.0" === i.version && !0 === n.nullable && 1 === e.length && null === e[0]) return lc.null();
                        if (0 === e.length) return lc.never();
                        if (1 === e.length) return lc.literal(e[0]);
                        if (e.every(e => "string" == typeof e)) return lc.enum(e);
                        let t = e.map(e => lc.literal(e));
                        return t.length < 2 ? t[0] : lc.union([t[0], t[1], ...t.slice(2)])
                    }
                    if (void 0 !== n.const) return lc.literal(n.const);
                    let a = n.type;
                    if (Array.isArray(a)) {
                        let e = a.map(e => t({
                            ...n,
                            type: e
                        }, i));
                        return 0 === e.length ? lc.never() : 1 === e.length ? e[0] : lc.union(e)
                    }
                    if (!a) return lc.any();
                    switch (a) {
                        case "string": {
                            let e = lc.string();
                            if (n.format) {
                                let t = n.format;
                                "email" === t ? e = e.check(lc.email()) : "uri" === t || "uri-reference" === t ? e = e.check(lc.url()) : "uuid" === t || "guid" === t ? e = e.check(lc.uuid()) : "date-time" === t ? e = e.check(lc.iso.datetime()) : "date" === t ? e = e.check(lc.iso.date()) : "time" === t ? e = e.check(lc.iso.time()) : "duration" === t ? e = e.check(lc.iso.duration()) : "ipv4" === t ? e = e.check(lc.ipv4()) : "ipv6" === t ? e = e.check(lc.ipv6()) : "mac" === t ? e = e.check(lc.mac()) : "cidr" === t ? e = e.check(lc.cidrv4()) : "cidr-v6" === t ? e = e.check(lc.cidrv6()) : "base64" === t ? e = e.check(lc.base64()) : "base64url" === t ? e = e.check(lc.base64url()) : "e164" === t ? e = e.check(lc.e164()) : "jwt" === t ? e = e.check(lc.jwt()) : "emoji" === t ? e = e.check(lc.emoji()) : "nanoid" === t ? e = e.check(lc.nanoid()) : "cuid" === t ? e = e.check(lc.cuid()) : "cuid2" === t ? e = e.check(lc.cuid2()) : "ulid" === t ? e = e.check(lc.ulid()) : "xid" === t ? e = e.check(lc.xid()) : "ksuid" === t && (e = e.check(lc.ksuid()))
                            }
                            "number" == typeof n.minLength && (e = e.min(n.minLength)), "number" == typeof n.maxLength && (e = e.max(n.maxLength)), n.pattern && (e = e.regex(new RegExp(n.pattern))), r = e;
                            break
                        }
                        case "number":
                        case "integer": {
                            let e = "integer" === a ? lc.number().int() : lc.number();
                            "number" == typeof n.minimum && (e = e.min(n.minimum)), "number" == typeof n.maximum && (e = e.max(n.maximum)), "number" == typeof n.exclusiveMinimum ? e = e.gt(n.exclusiveMinimum) : !0 === n.exclusiveMinimum && "number" == typeof n.minimum && (e = e.gt(n.minimum)), "number" == typeof n.exclusiveMaximum ? e = e.lt(n.exclusiveMaximum) : !0 === n.exclusiveMaximum && "number" == typeof n.maximum && (e = e.lt(n.maximum)), "number" == typeof n.multipleOf && (e = e.multipleOf(n.multipleOf)), r = e;
                            break
                        }
                        case "boolean":
                            r = lc.boolean();
                            break;
                        case "null":
                            r = lc.null();
                            break;
                        case "object": {
                            let t = {},
                                a = n.properties || {},
                                o = new Set(n.required || []);
                            for (let [n, r] of Object.entries(a)) {
                                let a = e(r, i);
                                t[n] = o.has(n) ? a : a.optional()
                            }
                            if (n.propertyNames) {
                                let a = e(n.propertyNames, i),
                                    o = n.additionalProperties && "object" == typeof n.additionalProperties ? e(n.additionalProperties, i) : lc.any();
                                if (0 === Object.keys(t).length) {
                                    r = lc.record(a, o);
                                    break
                                }
                                let c = lc.object(t).passthrough(),
                                    u = lc.looseRecord(a, o);
                                r = lc.intersection(c, u);
                                break
                            }
                            if (n.patternProperties) {
                                let a = n.patternProperties,
                                    o = Object.keys(a),
                                    c = [];
                                for (let t of o) {
                                    let n = e(a[t], i),
                                        r = lc.string().regex(new RegExp(t));
                                    c.push(lc.looseRecord(r, n))
                                }
                                let u = [];
                                if (Object.keys(t).length > 0 && u.push(lc.object(t).passthrough()), u.push(...c), 0 === u.length) r = lc.object({}).passthrough();
                                else if (1 === u.length) r = u[0];
                                else {
                                    let e = lc.intersection(u[0], u[1]);
                                    for (let t = 2; t < u.length; t++) e = lc.intersection(e, u[t]);
                                    r = e
                                }
                                break
                            }
                            let c = lc.object(t);
                            r = !1 === n.additionalProperties ? c.strict() : "object" == typeof n.additionalProperties ? c.catchall(e(n.additionalProperties, i)) : c.passthrough();
                            break
                        }
                        case "array": {
                            let t = n.prefixItems,
                                a = n.items;
                            if (t && Array.isArray(t)) {
                                let o = t.map(t => e(t, i)),
                                    c = a && "object" == typeof a && !Array.isArray(a) ? e(a, i) : void 0;
                                r = c ? lc.tuple(o).rest(c) : lc.tuple(o), "number" == typeof n.minItems && (r = r.check(lc.minLength(n.minItems))), "number" == typeof n.maxItems && (r = r.check(lc.maxLength(n.maxItems)))
                            } else if (Array.isArray(a)) {
                                let t = a.map(t => e(t, i)),
                                    o = n.additionalItems && "object" == typeof n.additionalItems ? e(n.additionalItems, i) : void 0;
                                r = o ? lc.tuple(t).rest(o) : lc.tuple(t), "number" == typeof n.minItems && (r = r.check(lc.minLength(n.minItems))), "number" == typeof n.maxItems && (r = r.check(lc.maxLength(n.maxItems)))
                            } else if (void 0 !== a) {
                                let t = e(a, i),
                                    o = lc.array(t);
                                "number" == typeof n.minItems && (o = o.min(n.minItems)), "number" == typeof n.maxItems && (o = o.max(n.maxItems)), r = o
                            } else r = lc.array(lc.any());
                            break
                        }
                        default:
                            throw Error("Unsupported type: ".concat(a))
                    }
                    return r
                }(t, n),
                r = t.type || void 0 !== t.enum || void 0 !== t.const;
            if (t.anyOf && Array.isArray(t.anyOf)) {
                let a = t.anyOf.map(t => e(t, n)),
                    o = lc.union(a);
                i = r ? lc.intersection(i, o) : o
            }
            if (t.oneOf && Array.isArray(t.oneOf)) {
                let a = t.oneOf.map(t => e(t, n)),
                    o = lc.xor(a);
                i = r ? lc.intersection(i, o) : o
            }
            if (t.allOf && Array.isArray(t.allOf))
                if (0 === t.allOf.length) i = r ? i : lc.any();
                else {
                    let a = r ? i : e(t.allOf[0], n),
                        o = +!r;
                    for (let i = o; i < t.allOf.length; i++) a = lc.intersection(a, e(t.allOf[i], n));
                    i = a
                }! 0 === t.nullable && "openapi-3.0" === n.version && (i = lc.nullable(i)), !0 === t.readOnly && (i = lc.readonly(i)), void 0 !== t.default && (i = i.default(t.default));
            let a = {};
            for (let e of ["$id", "id", "$comment", "$anchor", "$vocabulary", "$dynamicRef", "$dynamicAnchor"]) e in t && (a[e] = t[e]);
            for (let e of ["contentEncoding", "contentMediaType", "contentSchema"]) e in t && (a[e] = t[e]);
            for (let e of Object.keys(t)) lu.has(e) || (a[e] = t[e]);
            return Object.keys(a).length > 0 && n.registry.add(i, a), t.description && (i = i.describe(t.description)), i
        }(a, c)
    }, "function", 0, uW, "getErrorMap", 0, lo, "globalRegistry", 0, iZ, "gt", 0, ry, "gte", 0, rb, "guid", 0, oZ, "hash", 0, cu, "hex", 0, cc, "hostname", 0, co, "httpUrl", 0, oE, "includes", 0, rE, "instanceof", 0, uH, "int", 0, cm, "int32", 0, cp, "int64", 0, cI, "intersection", 0, c0, "invertCodec", 0, u$, "ipv4", 0, oY, "ipv6", 0, o4, "iso", 0, le, "json", 0, u0, "jwt", 0, ci, "keyof", 0, cF, "ksuid", 0, oX, "lazy", 0, uJ, "length", 0, rD, "literal", 0, ua, "locales", 0, e6, "looseObject", 0, cK, "looseRecord", 0, c3, "lowercase", 0, r$, "lt", 0, rh, "lte", 0, r_, "mac", 0, oQ, "map", 0, c7, "maxLength", 0, rO, "maxSize", 0, rz, "meta", 0, uY, "mime", 0, rC, "minLength", 0, rj, "minSize", 0, rZ, "multipleOf", 0, rw, "nan", 0, uU, "nanoid", 0, oC, "nativeEnum", 0, ui, "negative", 0, rI, "never", 0, cE, "nonnegative", 0, rS, "nonoptional", 0, uI, "nonpositive", 0, rx, "normalize", 0, rR, "null", 0, cO, "nullable", 0, up, "nullish", 0, ug, "number", 0, cs, "object", 0, cW, "optional", 0, ud, "overwrite", 0, rJ, "parse", 0, oa, "parseAsync", 0, oo, "partialRecord", 0, c9, "pipe", 0, uj, "positive", 0, rk, "prefault", 0, ub, "preprocess", 0, u4, "prettifyError", 0, tt, "promise", 0, uF, "property", 0, rL, "readonly", 0, uT, "record", 0, c2, "refine", 0, uV, "regex", 0, rP, "regexes", () => oe, "registry", 0, iz, "safeDecode", 0, ov, "safeDecodeAsync", 0, og, "safeEncode", 0, of, "safeEncodeAsync", 0, op, "safeParse", 0, oc, "safeParseAsync", 0, ou, "set", 0, ue, "setErrorMap", 0, la, "size", 0, rU, "slugify", 0, rG, "startsWith", 0, rT, "strictObject", 0, cG, "string", 0, oI, "stringFormat", 0, ca, "stringbool", 0, uQ, "success", 0, uS, "superRefine", 0, uX, "symbol", 0, cw, "templateLiteral", 0, uL, "toJSONSchema", 0, a7, "toLowerCase", 0, rM, "toUpperCase", 0, rW, "transform", 0, ul, "treeifyError", 0, e5, "trim", 0, rF, "tuple", 0, c6, "uint32", 0, cg, "uint64", 0, cx, "ulid", 0, oG, "undefined", 0, cZ, "union", 0, cV, "unknown", 0, c$, "uppercase", 0, rN, "url", 0, oN, "util", () => ot, "uuid", 0, oO, "uuidv4", 0, oj, "uuidv6", 0, oD, "uuidv7", 0, oP, "void", 0, cA, "xid", 0, oB, "xor", 0, cq], 279798);
    var ll = e.i(279798);
    e.s(["z", 0, ll], 772738)
}]);

//# debugId=51fd4ae8-1dae-e9eb-1987-1a480f583061
//# sourceMappingURL=0gk36iqw_-7-x.js.map