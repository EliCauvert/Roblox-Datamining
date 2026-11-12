;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "444df82d-3927-5473-1997-c87c16313284")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 350223, 189571, 874296, e => {
    "use strict";
    let t = Object.freeze({
        status: "aborted"
    });

    function i(e, t, i) {
        function n(i, n) {
            var r;
            for (let a in Object.defineProperty(i, "_zod", {
                    value: i._zod ?? {},
                    enumerable: !1
                }), (r = i._zod).traits ?? (r.traits = new Set), i._zod.traits.add(e), t(i, n), o.prototype) a in i || Object.defineProperty(i, a, {
                value: o.prototype[a].bind(i)
            });
            i._zod.constr = o, i._zod.def = n
        }
        let r = i?.Parent ?? Object;
        class a extends r {}

        function o(e) {
            var t;
            let r = i?.Parent ? new a : this;
            for (let i of (n(r, e), (t = r._zod).deferred ?? (t.deferred = []), r._zod.deferred)) i();
            return r
        }
        return Object.defineProperty(a, "name", {
            value: e
        }), Object.defineProperty(o, "init", {
            value: n
        }), Object.defineProperty(o, Symbol.hasInstance, {
            value: t => !!i?.Parent && t instanceof i.Parent || t?._zod?.traits?.has(e)
        }), Object.defineProperty(o, "name", {
            value: e
        }), o
    }
    let n = Symbol("zod_brand");
    class r extends Error {
        constructor() {
            super("Encountered Promise during synchronous parse. Use .parseAsync() instead.")
        }
    }
    class a extends Error {
        constructor(e) {
            super(`Encountered unidirectional transform during encode: ${e}`), this.name = "ZodEncodeError"
        }
    }
    let o = {};

    function u(e) {
        return e && Object.assign(o, e), o
    }

    function s(e) {
        let t = Object.values(e).filter(e => "number" == typeof e);
        return Object.entries(e).filter(e => {
            let [i, n] = e;
            return -1 === t.indexOf(+i)
        }).map(e => {
            let [t, i] = e;
            return i
        })
    }

    function l(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "|";
        return e.map(e => O(e)).join(t)
    }

    function d(e, t) {
        return "bigint" == typeof t ? t.toString() : t
    }

    function c(e) {
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
            i = e.endsWith("$") ? e.length - 1 : e.length;
        return e.slice(t, i)
    }

    function p(e, t) {
        let i = (e.toString().split(".")[1] || "").length,
            n = t.toString(),
            r = (n.split(".")[1] || "").length;
        if (0 === r && /\d?e-\d?/.test(n)) {
            let e = n.match(/\d?e-(\d?)/);
            e?.[1] && (r = Number.parseInt(e[1]))
        }
        let a = i > r ? i : r;
        return Number.parseInt(e.toFixed(a).replace(".", "")) % Number.parseInt(t.toFixed(a).replace(".", "")) / 10 ** a
    }
    e.s(["$ZodAsyncError", 0, r, "$ZodEncodeError", 0, a, "$brand", 0, n, "$constructor", 0, i, "NEVER", 0, t, "config", 0, u, "globalConfig", 0, o], 821160);
    let v = Symbol("evaluating");

    function g(e, t, i) {
        let n;
        Object.defineProperty(e, t, {
            get() {
                if (n !== v) return void 0 === n && (n = v, n = i()), n
            },
            set(i) {
                Object.defineProperty(e, t, {
                    value: i
                })
            },
            configurable: !0
        })
    }

    function $(e, t, i) {
        Object.defineProperty(e, t, {
            value: i,
            writable: !0,
            enumerable: !0,
            configurable: !0
        })
    }

    function h() {
        for (var e = arguments.length, t = Array(e), i = 0; i < e; i++) t[i] = arguments[i];
        let n = {};
        for (let e of t) Object.assign(n, Object.getOwnPropertyDescriptors(e));
        return Object.defineProperties({}, n)
    }

    function _(e) {
        return JSON.stringify(e)
    }
    let y = "captureStackTrace" in Error ? Error.captureStackTrace : function() {
        for (var e = arguments.length, t = Array(e), i = 0; i < e; i++) t[i] = arguments[i]
    };

    function b(e) {
        return "object" == typeof e && null !== e && !Array.isArray(e)
    }
    let x = c(() => {
        if ("u" > typeof navigator && navigator?.userAgent?.includes("Cloudflare")) return !1;
        try {
            return Function(""), !0
        } catch (e) {
            return !1
        }
    });

    function k(e) {
        if (!1 === b(e)) return !1;
        let t = e.constructor;
        if (void 0 === t) return !0;
        let i = t.prototype;
        return !1 !== b(i) && !1 !== Object.prototype.hasOwnProperty.call(i, "isPrototypeOf")
    }

    function I(e) {
        return k(e) ? {
            ...e
        } : Array.isArray(e) ? [...e] : e
    }
    let w = new Set(["string", "number", "symbol"]),
        z = new Set(["string", "number", "bigint", "boolean", "symbol", "undefined"]);

    function S(e) {
        return e.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
    }

    function Z(e, t, i) {
        let n = new e._zod.constr(t ?? e._zod.def);
        return (!t || i?.parent) && (n._zod.parent = e), n
    }

    function U(e) {
        if (!e) return {};
        if ("string" == typeof e) return {
            error: () => e
        };
        if (e?.message !== void 0) {
            if (e?.error !== void 0) throw Error("Cannot specify both `message` and `error` params");
            e.error = e.message
        }
        return (delete e.message, "string" == typeof e.error) ? {
            ...e,
            error: () => e.error
        } : e
    }

    function O(e) {
        return "bigint" == typeof e ? e.toString() + "n" : "string" == typeof e ? `"${e}"` : `${e}`
    }

    function j(e) {
        return Object.keys(e).filter(t => "optional" === e[t]._zod.optin && "optional" === e[t]._zod.optout)
    }
    let N = {
            safeint: [Number.MIN_SAFE_INTEGER, Number.MAX_SAFE_INTEGER],
            int32: [-0x80000000, 0x7fffffff],
            uint32: [0, 0xffffffff],
            float32: [-34028234663852886e22, 34028234663852886e22],
            float64: [-Number.MAX_VALUE, Number.MAX_VALUE]
        },
        D = {
            int64: [BigInt("-9223372036854775808"), BigInt("9223372036854775807")],
            uint64: [BigInt(0), BigInt("18446744073709551615")]
        };

    function P(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
        if (!0 === e.aborted) return !0;
        for (let i = t; i < e.issues.length; i++)
            if (e.issues[i]?.continue !== !0) return !0;
        return !1
    }

    function E(e, t) {
        return t.map(t => (t.path ?? (t.path = []), t.path.unshift(e), t))
    }

    function A(e) {
        return "string" == typeof e ? e : e?.message
    }

    function M(e, t, i) {
        let n = {
            ...e,
            path: e.path ?? []
        };
        return e.message || (n.message = A(e.inst?._zod.def?.error?.(e)) ?? A(t?.error?.(e)) ?? A(i.customError?.(e)) ?? A(i.localeError?.(e)) ?? "Invalid input"), delete n.inst, delete n.continue, t?.reportInput || delete n.input, n
    }

    function T(e) {
        return e instanceof Set ? "set" : e instanceof Map ? "map" : e instanceof File ? "file" : "unknown"
    }

    function C(e) {
        return Array.isArray(e) ? "array" : "string" == typeof e ? "string" : "unknown"
    }

    function L() {
        for (var e = arguments.length, t = Array(e), i = 0; i < e; i++) t[i] = arguments[i];
        let [n, r, a] = t;
        return "string" == typeof n ? {
            message: n,
            code: "custom",
            input: r,
            inst: a
        } : {
            ...n
        }
    }

    function R(e) {
        let t = atob(e),
            i = new Uint8Array(t.length);
        for (let e = 0; e < t.length; e++) i[e] = t.charCodeAt(e);
        return i
    }

    function F(e) {
        let t = "";
        for (let i = 0; i < e.length; i++) t += String.fromCharCode(e[i]);
        return btoa(t)
    }
    e.s(["BIGINT_FORMAT_RANGES", 0, D, "Class", 0, class {
        constructor(...e) {}
    }, "NUMBER_FORMAT_RANGES", 0, N, "aborted", 0, P, "allowsEval", 0, x, "assert", 0, function(e) {}, "assertEqual", 0, function(e) {
        return e
    }, "assertIs", 0, function(e) {}, "assertNever", 0, function(e) {
        throw Error()
    }, "assertNotEqual", 0, function(e) {
        return e
    }, "assignProp", 0, $, "base64ToUint8Array", 0, R, "base64urlToUint8Array", 0, function(e) {
        let t = e.replace(/-/g, "+").replace(/_/g, "/"),
            i = "=".repeat((4 - t.length % 4) % 4);
        return R(t + i)
    }, "cached", 0, c, "captureStackTrace", 0, y, "cleanEnum", 0, function(e) {
        return Object.entries(e).filter(e => {
            let [t, i] = e;
            return Number.isNaN(Number.parseInt(t, 10))
        }).map(e => e[1])
    }, "cleanRegex", 0, f, "clone", 0, Z, "cloneDef", 0, function(e) {
        return h(e._zod.def)
    }, "createTransparentProxy", 0, function(e) {
        let t;
        return new Proxy({}, {
            get: (i, n, r) => (t ?? (t = e()), Reflect.get(t, n, r)),
            set: (i, n, r, a) => (t ?? (t = e()), Reflect.set(t, n, r, a)),
            has: (i, n) => (t ?? (t = e()), Reflect.has(t, n)),
            deleteProperty: (i, n) => (t ?? (t = e()), Reflect.deleteProperty(t, n)),
            ownKeys: i => (t ?? (t = e()), Reflect.ownKeys(t)),
            getOwnPropertyDescriptor: (i, n) => (t ?? (t = e()), Reflect.getOwnPropertyDescriptor(t, n)),
            defineProperty: (i, n, r) => (t ?? (t = e()), Reflect.defineProperty(t, n, r))
        })
    }, "defineLazy", 0, g, "esc", 0, _, "escapeRegex", 0, S, "extend", 0, function(e, t) {
        if (!k(t)) throw Error("Invalid input to extend: expected a plain object");
        let i = e._zod.def.checks;
        if (i && i.length > 0) throw Error("Object schemas containing refinements cannot be extended. Use `.safeExtend()` instead.");
        let n = h(e._zod.def, {
            get shape() {
                let i = {
                    ...e._zod.def.shape,
                    ...t
                };
                return $(this, "shape", i), i
            },
            checks: []
        });
        return Z(e, n)
    }, "finalizeIssue", 0, M, "floatSafeRemainder", 0, p, "getElementAtPath", 0, function(e, t) {
        return t ? t.reduce((e, t) => e?.[t], e) : e
    }, "getEnumValues", 0, s, "getLengthableOrigin", 0, C, "getParsedType", 0, e => {
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
                throw Error(`Unknown data type: ${t}`)
        }
    }, "getSizableOrigin", 0, T, "hexToUint8Array", 0, function(e) {
        let t = e.replace(/^0x/, "");
        if (t.length % 2 != 0) throw Error("Invalid hex string length");
        let i = new Uint8Array(t.length / 2);
        for (let e = 0; e < t.length; e += 2) i[e / 2] = Number.parseInt(t.slice(e, e + 2), 16);
        return i
    }, "isObject", 0, b, "isPlainObject", 0, k, "issue", 0, L, "joinValues", 0, l, "jsonStringifyReplacer", 0, d, "merge", 0, function(e, t) {
        let i = h(e._zod.def, {
            get shape() {
                let i = {
                    ...e._zod.def.shape,
                    ...t._zod.def.shape
                };
                return $(this, "shape", i), i
            },
            get catchall() {
                return t._zod.def.catchall
            },
            checks: []
        });
        return Z(e, i)
    }, "mergeDefs", 0, h, "normalizeParams", 0, U, "nullish", 0, m, "numKeys", 0, function(e) {
        let t = 0;
        for (let i in e) Object.prototype.hasOwnProperty.call(e, i) && t++;
        return t
    }, "objectClone", 0, function(e) {
        return Object.create(Object.getPrototypeOf(e), Object.getOwnPropertyDescriptors(e))
    }, "omit", 0, function(e, t) {
        let i = e._zod.def,
            n = h(e._zod.def, {
                get shape() {
                    let n = {
                        ...e._zod.def.shape
                    };
                    for (let e in t) {
                        if (!(e in i.shape)) throw Error(`Unrecognized key: "${e}"`);
                        t[e] && delete n[e]
                    }
                    return $(this, "shape", n), n
                },
                checks: []
            });
        return Z(e, n)
    }, "optionalKeys", 0, j, "partial", 0, function(e, t, i) {
        let n = h(t._zod.def, {
            get shape() {
                let n = t._zod.def.shape,
                    r = {
                        ...n
                    };
                if (i)
                    for (let t in i) {
                        if (!(t in n)) throw Error(`Unrecognized key: "${t}"`);
                        i[t] && (r[t] = e ? new e({
                            type: "optional",
                            innerType: n[t]
                        }) : n[t])
                    } else
                        for (let t in n) r[t] = e ? new e({
                            type: "optional",
                            innerType: n[t]
                        }) : n[t];
                return $(this, "shape", r), r
            },
            checks: []
        });
        return Z(t, n)
    }, "pick", 0, function(e, t) {
        let i = e._zod.def,
            n = h(e._zod.def, {
                get shape() {
                    let e = {};
                    for (let n in t) {
                        if (!(n in i.shape)) throw Error(`Unrecognized key: "${n}"`);
                        t[n] && (e[n] = i.shape[n])
                    }
                    return $(this, "shape", e), e
                },
                checks: []
            });
        return Z(e, n)
    }, "prefixIssues", 0, E, "primitiveTypes", 0, z, "promiseAllObject", 0, function(e) {
        let t = Object.keys(e);
        return Promise.all(t.map(t => e[t])).then(e => {
            let i = {};
            for (let n = 0; n < t.length; n++) i[t[n]] = e[n];
            return i
        })
    }, "propertyKeyTypes", 0, w, "randomString", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 10,
            t = "abcdefghijklmnopqrstuvwxyz",
            i = "";
        for (let n = 0; n < e; n++) i += t[Math.floor(Math.random() * t.length)];
        return i
    }, "required", 0, function(e, t, i) {
        let n = h(t._zod.def, {
            get shape() {
                let n = t._zod.def.shape,
                    r = {
                        ...n
                    };
                if (i)
                    for (let t in i) {
                        if (!(t in r)) throw Error(`Unrecognized key: "${t}"`);
                        i[t] && (r[t] = new e({
                            type: "nonoptional",
                            innerType: n[t]
                        }))
                    } else
                        for (let t in n) r[t] = new e({
                            type: "nonoptional",
                            innerType: n[t]
                        });
                return $(this, "shape", r), r
            },
            checks: []
        });
        return Z(t, n)
    }, "safeExtend", 0, function(e, t) {
        if (!k(t)) throw Error("Invalid input to safeExtend: expected a plain object");
        let i = {
            ...e._zod.def,
            get shape() {
                let i = {
                    ...e._zod.def.shape,
                    ...t
                };
                return $(this, "shape", i), i
            },
            checks: e._zod.def.checks
        };
        return Z(e, i)
    }, "shallowClone", 0, I, "stringifyPrimitive", 0, O, "uint8ArrayToBase64", 0, F, "uint8ArrayToBase64url", 0, function(e) {
        return F(e).replace(/\+/g, "-").replace(/\//g, "_").replace(/=/g, "")
    }, "uint8ArrayToHex", 0, function(e) {
        return Array.from(e).map(e => e.toString(16).padStart(2, "0")).join("")
    }, "unwrapMessage", 0, A], 746334);
    let J = (e, t) => {
            e.name = "$ZodError", Object.defineProperty(e, "_zod", {
                value: e._zod,
                enumerable: !1
            }), Object.defineProperty(e, "issues", {
                value: t,
                enumerable: !1
            }), e.message = JSON.stringify(t, d, 2), Object.defineProperty(e, "toString", {
                value: () => e.message,
                enumerable: !1
            })
        },
        W = i("$ZodError", J),
        B = i("$ZodError", J, {
            Parent: Error
        });

    function G(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e => e.message,
            i = {},
            n = [];
        for (let r of e.issues) r.path.length > 0 ? (i[r.path[0]] = i[r.path[0]] || [], i[r.path[0]].push(t(r))) : n.push(t(r));
        return {
            formErrors: n,
            fieldErrors: i
        }
    }

    function K(e, t) {
        let i = t || function(e) {
                return e.message
            },
            n = {
                _errors: []
            },
            r = e => {
                for (let t of e.issues)
                    if ("invalid_union" === t.code && t.errors.length) t.errors.map(e => r({
                        issues: e
                    }));
                    else if ("invalid_key" === t.code) r({
                    issues: t.issues
                });
                else if ("invalid_element" === t.code) r({
                    issues: t.issues
                });
                else if (0 === t.path.length) n._errors.push(i(t));
                else {
                    let e = n,
                        r = 0;
                    for (; r < t.path.length;) {
                        let n = t.path[r];
                        r === t.path.length - 1 ? (e[n] = e[n] || {
                            _errors: []
                        }, e[n]._errors.push(i(t))) : e[n] = e[n] || {
                            _errors: []
                        }, e = e[n], r++
                    }
                }
            };
        return r(e), n
    }

    function V(e, t) {
        let i = t || function(e) {
                return e.message
            },
            n = {
                errors: []
            },
            r = function(e) {
                var t, a;
                let o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [];
                for (let u of e.issues)
                    if ("invalid_union" === u.code && u.errors.length) u.errors.map(e => r({
                        issues: e
                    }, u.path));
                    else if ("invalid_key" === u.code) r({
                    issues: u.issues
                }, u.path);
                else if ("invalid_element" === u.code) r({
                    issues: u.issues
                }, u.path);
                else {
                    let e = [...o, ...u.path];
                    if (0 === e.length) {
                        n.errors.push(i(u));
                        continue
                    }
                    let r = n,
                        s = 0;
                    for (; s < e.length;) {
                        let n = e[s],
                            o = s === e.length - 1;
                        "string" == typeof n ? (r.properties ?? (r.properties = {}), (t = r.properties)[n] ?? (t[n] = {
                            errors: []
                        }), r = r.properties[n]) : (r.items ?? (r.items = []), (a = r.items)[n] ?? (a[n] = {
                            errors: []
                        }), r = r.items[n]), o && r.errors.push(i(u)), s++
                    }
                }
            };
        return r(e), n
    }

    function X(e) {
        let t = [];
        for (let i of e.map(e => "object" == typeof e ? e.key : e)) "number" == typeof i ? t.push(`[${i}]`) : "symbol" == typeof i ? t.push(`[${JSON.stringify(String(i))}]`) : /[^\w$]/.test(i) ? t.push(`[${JSON.stringify(i)}]`) : (t.length && t.push("."), t.push(i));
        return t.join("")
    }

    function q(e) {
        let t = [];
        for (let i of [...e.issues].sort((e, t) => (e.path ?? []).length - (t.path ?? []).length)) t.push(`✖ ${i.message}`), i.path?.length && t.push(`  → at ${X(i.path)}`);
        return t.join("\n")
    }
    e.s(["$ZodError", 0, W, "$ZodRealError", 0, B, "flattenError", 0, G, "formatError", 0, K, "prettifyError", 0, q, "toDotPath", 0, X, "treeifyError", 0, V], 976220);
    let Y = e => (t, i, n, a) => {
            let o = n ? Object.assign(n, {
                    async: !1
                }) : {
                    async: !1
                },
                s = t._zod.run({
                    value: i,
                    issues: []
                }, o);
            if (s instanceof Promise) throw new r;
            if (s.issues.length) {
                let t = new(a?.Err ?? e)(s.issues.map(e => M(e, o, u())));
                throw y(t, a?.callee), t
            }
            return s.value
        },
        H = Y(B),
        Q = e => async (t, i, n, r) => {
            let a = n ? Object.assign(n, {
                    async: !0
                }) : {
                    async: !0
                },
                o = t._zod.run({
                    value: i,
                    issues: []
                }, a);
            if (o instanceof Promise && (o = await o), o.issues.length) {
                let t = new(r?.Err ?? e)(o.issues.map(e => M(e, a, u())));
                throw y(t, r?.callee), t
            }
            return o.value
        }, ee = Q(B), et = e => (t, i, n) => {
            let a = n ? {
                    ...n,
                    async: !1
                } : {
                    async: !1
                },
                o = t._zod.run({
                    value: i,
                    issues: []
                }, a);
            if (o instanceof Promise) throw new r;
            return o.issues.length ? {
                success: !1,
                error: new(e ?? W)(o.issues.map(e => M(e, a, u())))
            } : {
                success: !0,
                data: o.value
            }
        }, ei = et(B), en = e => async (t, i, n) => {
            let r = n ? Object.assign(n, {
                    async: !0
                }) : {
                    async: !0
                },
                a = t._zod.run({
                    value: i,
                    issues: []
                }, r);
            return a instanceof Promise && (a = await a), a.issues.length ? {
                success: !1,
                error: new e(a.issues.map(e => M(e, r, u())))
            } : {
                success: !0,
                data: a.value
            }
        }, er = en(B), ea = e => (t, i, n) => {
            let r = n ? Object.assign(n, {
                direction: "backward"
            }) : {
                direction: "backward"
            };
            return Y(e)(t, i, r)
        }, eo = ea(B), eu = e => (t, i, n) => Y(e)(t, i, n), es = eu(B), el = e => async (t, i, n) => {
            let r = n ? Object.assign(n, {
                direction: "backward"
            }) : {
                direction: "backward"
            };
            return Q(e)(t, i, r)
        }, ed = el(B), ec = e => async (t, i, n) => Q(e)(t, i, n), em = ec(B), ef = e => (t, i, n) => {
            let r = n ? Object.assign(n, {
                direction: "backward"
            }) : {
                direction: "backward"
            };
            return et(e)(t, i, r)
        }, ep = ef(B), ev = e => (t, i, n) => et(e)(t, i, n), eg = ev(B), e$ = e => async (t, i, n) => {
            let r = n ? Object.assign(n, {
                direction: "backward"
            }) : {
                direction: "backward"
            };
            return en(e)(t, i, r)
        }, eh = e$(B), e_ = e => async (t, i, n) => en(e)(t, i, n), ey = e_(B);
    e.s(["_decode", 0, eu, "_decodeAsync", 0, ec, "_encode", 0, ea, "_encodeAsync", 0, el, "_parse", 0, Y, "_parseAsync", 0, Q, "_safeDecode", 0, ev, "_safeDecodeAsync", 0, e_, "_safeEncode", 0, ef, "_safeEncodeAsync", 0, e$, "_safeParse", 0, et, "_safeParseAsync", 0, en, "decode", 0, es, "decodeAsync", 0, em, "encode", 0, eo, "encodeAsync", 0, ed, "parse", 0, H, "parseAsync", 0, ee, "safeDecode", 0, eg, "safeDecodeAsync", 0, ey, "safeEncode", 0, ep, "safeEncodeAsync", 0, eh, "safeParse", 0, ei, "safeParseAsync", 0, er], 315607);
    let eb = /^[cC][^\s-]{8,}$/,
        ex = /^[0-9a-z]+$/,
        ek = /^[0-9A-HJKMNP-TV-Za-hjkmnp-tv-z]{26}$/,
        eI = /^[0-9a-vA-V]{20}$/,
        ew = /^[A-Za-z0-9]{27}$/,
        ez = /^[a-zA-Z0-9_-]{21}$/,
        eS = /^P(?:(\d+W)|(?!.*W)(?=\d|T\d)(\d+Y)?(\d+M)?(\d+D)?(T(?=\d)(\d+H)?(\d+M)?(\d+([.,]\d+)?S)?)?)$/,
        eZ = /^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})$/,
        eU = e => e ? RegExp(`^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-${e}[0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12})$`) : /^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-8][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}|00000000-0000-0000-0000-000000000000|ffffffff-ffff-ffff-ffff-ffffffffffff)$/,
        eO = eU(4),
        ej = eU(6),
        eN = eU(7),
        eD = /^(?!\.)(?!.*\.\.)([A-Za-z0-9_'+\-\.]*)[A-Za-z0-9_+-]@([A-Za-z0-9][A-Za-z0-9\-]*\.)+[A-Za-z]{2,}$/,
        eP = /^[^\s@"]{1,64}@[^\s@]{1,255}$/u;

    function eE() {
        return RegExp("^(\\p{Extended_Pictographic}|\\p{Emoji_Component})+$", "u")
    }
    let eA = /^(?:(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])$/,
        eM = /^(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))$/,
        eT = /^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\/([0-9]|[1-2][0-9]|3[0-2])$/,
        eC = /^(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|::|([0-9a-fA-F]{1,4})?::([0-9a-fA-F]{1,4}:?){0,6})\/(12[0-8]|1[01][0-9]|[1-9]?[0-9])$/,
        eL = /^$|^(?:[0-9a-zA-Z+/]{4})*(?:(?:[0-9a-zA-Z+/]{2}==)|(?:[0-9a-zA-Z+/]{3}=))?$/,
        eR = /^[A-Za-z0-9_-]*$/,
        eF = /^(?=.{1,253}\.?$)[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[-0-9a-zA-Z]{0,61}[0-9a-zA-Z])?)*\.?$/,
        eJ = /^\+(?:[0-9]){6,14}[0-9]$/,
        eW = "(?:(?:\\d\\d[2468][048]|\\d\\d[13579][26]|\\d\\d0[48]|[02468][048]00|[13579][26]00)-02-29|\\d{4}-(?:(?:0[13578]|1[02])-(?:0[1-9]|[12]\\d|3[01])|(?:0[469]|11)-(?:0[1-9]|[12]\\d|30)|(?:02)-(?:0[1-9]|1\\d|2[0-8])))",
        eB = RegExp(`^${eW}$`);

    function eG(e) {
        let t = "(?:[01]\\d|2[0-3]):[0-5]\\d";
        return "number" == typeof e.precision ? -1 === e.precision ? `${t}` : 0 === e.precision ? `${t}:[0-5]\\d` : `${t}:[0-5]\\d\\.\\d{${e.precision}}` : `${t}(?::[0-5]\\d(?:\\.\\d+)?)?`
    }

    function eK(e) {
        return RegExp(`^${eG(e)}$`)
    }

    function eV(e) {
        let t = eG({
                precision: e.precision
            }),
            i = ["Z"];
        e.local && i.push(""), e.offset && i.push("([+-](?:[01]\\d|2[0-3]):[0-5]\\d)");
        let n = `${t}(?:${i.join("|")})`;
        return RegExp(`^${eW}T(?:${n})$`)
    }
    let eX = e => {
            let t = e ? `[\\s\\S]{${e?.minimum??0},${e?.maximum??""}}` : "[\\s\\S]*";
            return RegExp(`^${t}$`)
        },
        eq = /^-?\d+n?$/,
        eY = /^-?\d+$/,
        eH = /^-?\d+(?:\.\d+)?/,
        eQ = /^(?:true|false)$/i,
        e0 = /^null$/i,
        e4 = /^undefined$/i,
        e6 = /^[^A-Z]*$/,
        e1 = /^[^a-z]*$/;

    function e2(e, t) {
        return RegExp(`^[A-Za-z0-9+/]{${e}}${t}$`)
    }

    function e9(e) {
        return RegExp(`^[A-Za-z0-9_-]{${e}}$`)
    }
    let e3 = e2(22, "=="),
        e7 = e9(22),
        e5 = e2(27, "="),
        e8 = e9(27),
        te = e2(43, "="),
        tt = e9(43),
        ti = e2(64, ""),
        tn = e9(64),
        tr = e2(86, "=="),
        ta = e9(86);
    e.s(["base64", 0, eL, "base64url", 0, eR, "bigint", 0, eq, "boolean", 0, eQ, "browserEmail", 0, /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/, "cidrv4", 0, eT, "cidrv6", 0, eC, "cuid", 0, eb, "cuid2", 0, ex, "date", 0, eB, "datetime", 0, eV, "domain", 0, /^([a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,}$/, "duration", 0, eS, "e164", 0, eJ, "email", 0, eD, "emoji", 0, eE, "extendedDuration", 0, /^[-+]?P(?!$)(?:(?:[-+]?\d+Y)|(?:[-+]?\d+[.,]\d+Y$))?(?:(?:[-+]?\d+M)|(?:[-+]?\d+[.,]\d+M$))?(?:(?:[-+]?\d+W)|(?:[-+]?\d+[.,]\d+W$))?(?:(?:[-+]?\d+D)|(?:[-+]?\d+[.,]\d+D$))?(?:T(?=[\d+-])(?:(?:[-+]?\d+H)|(?:[-+]?\d+[.,]\d+H$))?(?:(?:[-+]?\d+M)|(?:[-+]?\d+[.,]\d+M$))?(?:[-+]?\d+(?:[.,]\d+)?S)?)??$/, "guid", 0, eZ, "hex", 0, /^[0-9a-fA-F]*$/, "hostname", 0, eF, "html5Email", 0, /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/, "idnEmail", 0, eP, "integer", 0, eY, "ipv4", 0, eA, "ipv6", 0, eM, "ksuid", 0, ew, "lowercase", 0, e6, "md5_base64", 0, e3, "md5_base64url", 0, e7, "md5_hex", 0, /^[0-9a-fA-F]{32}$/, "nanoid", 0, ez, "null", 0, e0, "number", 0, eH, "rfc5322Email", 0, /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/, "sha1_base64", 0, e5, "sha1_base64url", 0, e8, "sha1_hex", 0, /^[0-9a-fA-F]{40}$/, "sha256_base64", 0, te, "sha256_base64url", 0, tt, "sha256_hex", 0, /^[0-9a-fA-F]{64}$/, "sha384_base64", 0, ti, "sha384_base64url", 0, tn, "sha384_hex", 0, /^[0-9a-fA-F]{96}$/, "sha512_base64", 0, tr, "sha512_base64url", 0, ta, "sha512_hex", 0, /^[0-9a-fA-F]{128}$/, "string", 0, eX, "time", 0, eK, "ulid", 0, ek, "undefined", 0, e4, "unicodeEmail", 0, eP, "uppercase", 0, e1, "uuid", 0, eU, "uuid4", 0, eO, "uuid6", 0, ej, "uuid7", 0, eN, "xid", 0, eI], 61039);
    let to = i("$ZodCheck", (e, t) => {
            var i;
            e._zod ?? (e._zod = {}), e._zod.def = t, (i = e._zod).onattach ?? (i.onattach = [])
        }),
        tu = {
            number: "number",
            bigint: "bigint",
            object: "date"
        },
        ts = i("$ZodCheckLessThan", (e, t) => {
            to.init(e, t);
            let i = tu[typeof t.value];
            e._zod.onattach.push(e => {
                let i = e._zod.bag,
                    n = (t.inclusive ? i.maximum : i.exclusiveMaximum) ?? 1 / 0;
                t.value < n && (t.inclusive ? i.maximum = t.value : i.exclusiveMaximum = t.value)
            }), e._zod.check = n => {
                (t.inclusive ? n.value <= t.value : n.value < t.value) || n.issues.push({
                    origin: i,
                    code: "too_big",
                    maximum: t.value,
                    input: n.value,
                    inclusive: t.inclusive,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tl = i("$ZodCheckGreaterThan", (e, t) => {
            to.init(e, t);
            let i = tu[typeof t.value];
            e._zod.onattach.push(e => {
                let i = e._zod.bag,
                    n = (t.inclusive ? i.minimum : i.exclusiveMinimum) ?? -1 / 0;
                t.value > n && (t.inclusive ? i.minimum = t.value : i.exclusiveMinimum = t.value)
            }), e._zod.check = n => {
                (t.inclusive ? n.value >= t.value : n.value > t.value) || n.issues.push({
                    origin: i,
                    code: "too_small",
                    minimum: t.value,
                    input: n.value,
                    inclusive: t.inclusive,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        td = i("$ZodCheckMultipleOf", (e, t) => {
            to.init(e, t), e._zod.onattach.push(e => {
                var i;
                (i = e._zod.bag).multipleOf ?? (i.multipleOf = t.value)
            }), e._zod.check = i => {
                if (typeof i.value != typeof t.value) throw Error("Cannot mix number and bigint in multiple_of check.");
                ("bigint" == typeof i.value ? i.value % t.value === BigInt(0) : 0 === p(i.value, t.value)) || i.issues.push({
                    origin: typeof i.value,
                    code: "not_multiple_of",
                    divisor: t.value,
                    input: i.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tc = i("$ZodCheckNumberFormat", (e, t) => {
            to.init(e, t), t.format = t.format || "float64";
            let i = t.format?.includes("int"),
                n = i ? "int" : "number",
                [r, a] = N[t.format];
            e._zod.onattach.push(e => {
                let n = e._zod.bag;
                n.format = t.format, n.minimum = r, n.maximum = a, i && (n.pattern = eY)
            }), e._zod.check = o => {
                let u = o.value;
                if (i) {
                    if (!Number.isInteger(u)) return void o.issues.push({
                        expected: n,
                        format: t.format,
                        code: "invalid_type",
                        continue: !1,
                        input: u,
                        inst: e
                    });
                    if (!Number.isSafeInteger(u)) return void(u > 0 ? o.issues.push({
                        input: u,
                        code: "too_big",
                        maximum: Number.MAX_SAFE_INTEGER,
                        note: "Integers must be within the safe integer range.",
                        inst: e,
                        origin: n,
                        continue: !t.abort
                    }) : o.issues.push({
                        input: u,
                        code: "too_small",
                        minimum: Number.MIN_SAFE_INTEGER,
                        note: "Integers must be within the safe integer range.",
                        inst: e,
                        origin: n,
                        continue: !t.abort
                    }))
                }
                u < r && o.issues.push({
                    origin: "number",
                    input: u,
                    code: "too_small",
                    minimum: r,
                    inclusive: !0,
                    inst: e,
                    continue: !t.abort
                }), u > a && o.issues.push({
                    origin: "number",
                    input: u,
                    code: "too_big",
                    maximum: a,
                    inst: e
                })
            }
        }),
        tm = i("$ZodCheckBigIntFormat", (e, t) => {
            to.init(e, t);
            let [i, n] = D[t.format];
            e._zod.onattach.push(e => {
                let r = e._zod.bag;
                r.format = t.format, r.minimum = i, r.maximum = n
            }), e._zod.check = r => {
                let a = r.value;
                a < i && r.issues.push({
                    origin: "bigint",
                    input: a,
                    code: "too_small",
                    minimum: i,
                    inclusive: !0,
                    inst: e,
                    continue: !t.abort
                }), a > n && r.issues.push({
                    origin: "bigint",
                    input: a,
                    code: "too_big",
                    maximum: n,
                    inst: e
                })
            }
        }),
        tf = i("$ZodCheckMaxSize", (e, t) => {
            var i;
            to.init(e, t), (i = e._zod.def).when ?? (i.when = e => {
                let t = e.value;
                return !m(t) && void 0 !== t.size
            }), e._zod.onattach.push(e => {
                let i = e._zod.bag.maximum ?? 1 / 0;
                t.maximum < i && (e._zod.bag.maximum = t.maximum)
            }), e._zod.check = i => {
                let n = i.value;
                n.size <= t.maximum || i.issues.push({
                    origin: T(n),
                    code: "too_big",
                    maximum: t.maximum,
                    inclusive: !0,
                    input: n,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tp = i("$ZodCheckMinSize", (e, t) => {
            var i;
            to.init(e, t), (i = e._zod.def).when ?? (i.when = e => {
                let t = e.value;
                return !m(t) && void 0 !== t.size
            }), e._zod.onattach.push(e => {
                let i = e._zod.bag.minimum ?? -1 / 0;
                t.minimum > i && (e._zod.bag.minimum = t.minimum)
            }), e._zod.check = i => {
                let n = i.value;
                n.size >= t.minimum || i.issues.push({
                    origin: T(n),
                    code: "too_small",
                    minimum: t.minimum,
                    inclusive: !0,
                    input: n,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tv = i("$ZodCheckSizeEquals", (e, t) => {
            var i;
            to.init(e, t), (i = e._zod.def).when ?? (i.when = e => {
                let t = e.value;
                return !m(t) && void 0 !== t.size
            }), e._zod.onattach.push(e => {
                let i = e._zod.bag;
                i.minimum = t.size, i.maximum = t.size, i.size = t.size
            }), e._zod.check = i => {
                let n = i.value,
                    r = n.size;
                if (r === t.size) return;
                let a = r > t.size;
                i.issues.push({
                    origin: T(n),
                    ...a ? {
                        code: "too_big",
                        maximum: t.size
                    } : {
                        code: "too_small",
                        minimum: t.size
                    },
                    inclusive: !0,
                    exact: !0,
                    input: i.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tg = i("$ZodCheckMaxLength", (e, t) => {
            var i;
            to.init(e, t), (i = e._zod.def).when ?? (i.when = e => {
                let t = e.value;
                return !m(t) && void 0 !== t.length
            }), e._zod.onattach.push(e => {
                let i = e._zod.bag.maximum ?? 1 / 0;
                t.maximum < i && (e._zod.bag.maximum = t.maximum)
            }), e._zod.check = i => {
                let n = i.value;
                if (n.length <= t.maximum) return;
                let r = C(n);
                i.issues.push({
                    origin: r,
                    code: "too_big",
                    maximum: t.maximum,
                    inclusive: !0,
                    input: n,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        t$ = i("$ZodCheckMinLength", (e, t) => {
            var i;
            to.init(e, t), (i = e._zod.def).when ?? (i.when = e => {
                let t = e.value;
                return !m(t) && void 0 !== t.length
            }), e._zod.onattach.push(e => {
                let i = e._zod.bag.minimum ?? -1 / 0;
                t.minimum > i && (e._zod.bag.minimum = t.minimum)
            }), e._zod.check = i => {
                let n = i.value;
                if (n.length >= t.minimum) return;
                let r = C(n);
                i.issues.push({
                    origin: r,
                    code: "too_small",
                    minimum: t.minimum,
                    inclusive: !0,
                    input: n,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        th = i("$ZodCheckLengthEquals", (e, t) => {
            var i;
            to.init(e, t), (i = e._zod.def).when ?? (i.when = e => {
                let t = e.value;
                return !m(t) && void 0 !== t.length
            }), e._zod.onattach.push(e => {
                let i = e._zod.bag;
                i.minimum = t.length, i.maximum = t.length, i.length = t.length
            }), e._zod.check = i => {
                let n = i.value,
                    r = n.length;
                if (r === t.length) return;
                let a = C(n),
                    o = r > t.length;
                i.issues.push({
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
                    input: i.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        t_ = i("$ZodCheckStringFormat", (e, t) => {
            var i, n;
            to.init(e, t), e._zod.onattach.push(e => {
                let i = e._zod.bag;
                i.format = t.format, t.pattern && (i.patterns ?? (i.patterns = new Set), i.patterns.add(t.pattern))
            }), t.pattern ? (i = e._zod).check ?? (i.check = i => {
                t.pattern.lastIndex = 0, t.pattern.test(i.value) || i.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: t.format,
                    input: i.value,
                    ...t.pattern ? {
                        pattern: t.pattern.toString()
                    } : {},
                    inst: e,
                    continue: !t.abort
                })
            }) : (n = e._zod).check ?? (n.check = () => {})
        }),
        ty = i("$ZodCheckRegex", (e, t) => {
            t_.init(e, t), e._zod.check = i => {
                t.pattern.lastIndex = 0, t.pattern.test(i.value) || i.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: "regex",
                    input: i.value,
                    pattern: t.pattern.toString(),
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tb = i("$ZodCheckLowerCase", (e, t) => {
            t.pattern ?? (t.pattern = e6), t_.init(e, t)
        }),
        tx = i("$ZodCheckUpperCase", (e, t) => {
            t.pattern ?? (t.pattern = e1), t_.init(e, t)
        }),
        tk = i("$ZodCheckIncludes", (e, t) => {
            to.init(e, t);
            let i = S(t.includes),
                n = new RegExp("number" == typeof t.position ? `^.{${t.position}}${i}` : i);
            t.pattern = n, e._zod.onattach.push(e => {
                let t = e._zod.bag;
                t.patterns ?? (t.patterns = new Set), t.patterns.add(n)
            }), e._zod.check = i => {
                i.value.includes(t.includes, t.position) || i.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: "includes",
                    includes: t.includes,
                    input: i.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tI = i("$ZodCheckStartsWith", (e, t) => {
            to.init(e, t);
            let i = RegExp(`^${S(t.prefix)}.*`);
            t.pattern ?? (t.pattern = i), e._zod.onattach.push(e => {
                let t = e._zod.bag;
                t.patterns ?? (t.patterns = new Set), t.patterns.add(i)
            }), e._zod.check = i => {
                i.value.startsWith(t.prefix) || i.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: "starts_with",
                    prefix: t.prefix,
                    input: i.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tw = i("$ZodCheckEndsWith", (e, t) => {
            to.init(e, t);
            let i = RegExp(`.*${S(t.suffix)}$`);
            t.pattern ?? (t.pattern = i), e._zod.onattach.push(e => {
                let t = e._zod.bag;
                t.patterns ?? (t.patterns = new Set), t.patterns.add(i)
            }), e._zod.check = i => {
                i.value.endsWith(t.suffix) || i.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: "ends_with",
                    suffix: t.suffix,
                    input: i.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        });

    function tz(e, t, i) {
        e.issues.length && t.issues.push(...E(i, e.issues))
    }
    let tS = i("$ZodCheckProperty", (e, t) => {
            to.init(e, t), e._zod.check = e => {
                let i = t.schema._zod.run({
                    value: e.value[t.property],
                    issues: []
                }, {});
                if (i instanceof Promise) return i.then(i => tz(i, e, t.property));
                tz(i, e, t.property)
            }
        }),
        tZ = i("$ZodCheckMimeType", (e, t) => {
            to.init(e, t);
            let i = new Set(t.mime);
            e._zod.onattach.push(e => {
                e._zod.bag.mime = t.mime
            }), e._zod.check = n => {
                i.has(n.value.type) || n.issues.push({
                    code: "invalid_value",
                    values: t.mime,
                    input: n.value.type,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        tU = i("$ZodCheckOverwrite", (e, t) => {
            to.init(e, t), e._zod.check = e => {
                e.value = t.tx(e.value)
            }
        });
    e.s(["$ZodCheck", 0, to, "$ZodCheckBigIntFormat", 0, tm, "$ZodCheckEndsWith", 0, tw, "$ZodCheckGreaterThan", 0, tl, "$ZodCheckIncludes", 0, tk, "$ZodCheckLengthEquals", 0, th, "$ZodCheckLessThan", 0, ts, "$ZodCheckLowerCase", 0, tb, "$ZodCheckMaxLength", 0, tg, "$ZodCheckMaxSize", 0, tf, "$ZodCheckMimeType", 0, tZ, "$ZodCheckMinLength", 0, t$, "$ZodCheckMinSize", 0, tp, "$ZodCheckMultipleOf", 0, td, "$ZodCheckNumberFormat", 0, tc, "$ZodCheckOverwrite", 0, tU, "$ZodCheckProperty", 0, tS, "$ZodCheckRegex", 0, ty, "$ZodCheckSizeEquals", 0, tv, "$ZodCheckStartsWith", 0, tI, "$ZodCheckStringFormat", 0, t_, "$ZodCheckUpperCase", 0, tx], 305882);
    class tO {
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
                i = Math.min(...t.map(e => e.length - e.trimStart().length));
            for (let e of t.map(e => e.slice(i)).map(e => " ".repeat(2 * this.indent) + e)) this.content.push(e)
        }
        compile() {
            return Function(...this?.args, [...(this?.content ?? [""]).map(e => `  ${e}`)].join("\n"))
        }
        constructor(e = []) {
            this.content = [], this.indent = 0, this && (this.args = e)
        }
    }
    e.s(["Doc", 0, tO], 358749);
    let tj = {
        major: 4,
        minor: 1,
        patch: 11
    };
    e.s(["version", 0, tj], 157774);
    let tN = i("$ZodType", (e, t) => {
            var i;
            e ?? (e = {}), e._zod.def = t, e._zod.bag = e._zod.bag || {}, e._zod.version = tj;
            let n = [...e._zod.def.checks ?? []];
            for (let t of (e._zod.traits.has("$ZodCheck") && n.unshift(e), n))
                for (let i of t._zod.onattach) i(e);
            if (0 === n.length)(i = e._zod).deferred ?? (i.deferred = []), e._zod.deferred?.push(() => {
                e._zod.run = e._zod.parse
            });
            else {
                let t = (e, t, i) => {
                        let n, a = P(e);
                        for (let o of t) {
                            if (o._zod.def.when) {
                                if (!o._zod.def.when(e)) continue
                            } else if (a) continue;
                            let t = e.issues.length,
                                u = o._zod.check(e);
                            if (u instanceof Promise && i?.async === !1) throw new r;
                            if (n || u instanceof Promise) n = (n ?? Promise.resolve()).then(async () => {
                                await u, e.issues.length !== t && (a || (a = P(e, t)))
                            });
                            else {
                                if (e.issues.length === t) continue;
                                a || (a = P(e, t))
                            }
                        }
                        return n ? n.then(() => e) : e
                    },
                    i = (i, a, o) => {
                        if (P(i)) return i.aborted = !0, i;
                        let u = t(a, n, o);
                        if (u instanceof Promise) {
                            if (!1 === o.async) throw new r;
                            return u.then(t => e._zod.parse(t, o))
                        }
                        return e._zod.parse(u, o)
                    };
                e._zod.run = (a, o) => {
                    if (o.skipChecks) return e._zod.parse(a, o);
                    if ("backward" === o.direction) {
                        let t = e._zod.parse({
                            value: a.value,
                            issues: []
                        }, {
                            ...o,
                            skipChecks: !0
                        });
                        return t instanceof Promise ? t.then(e => i(e, a, o)) : i(t, a, o)
                    }
                    let u = e._zod.parse(a, o);
                    if (u instanceof Promise) {
                        if (!1 === o.async) throw new r;
                        return u.then(e => t(e, n, o))
                    }
                    return t(u, n, o)
                }
            }
            e["~standard"] = {
                validate: t => {
                    try {
                        let i = ei(e, t);
                        return i.success ? {
                            value: i.data
                        } : {
                            issues: i.error?.issues
                        }
                    } catch (i) {
                        return er(e, t).then(e => e.success ? {
                            value: e.data
                        } : {
                            issues: e.error?.issues
                        })
                    }
                },
                vendor: "zod",
                version: 1
            }
        }),
        tD = i("$ZodString", (e, t) => {
            tN.init(e, t), e._zod.pattern = [...e?._zod.bag?.patterns ?? []].pop() ?? eX(e._zod.bag), e._zod.parse = (i, n) => {
                if (t.coerce) try {
                    i.value = String(i.value)
                } catch (e) {}
                return "string" == typeof i.value || i.issues.push({
                    expected: "string",
                    code: "invalid_type",
                    input: i.value,
                    inst: e
                }), i
            }
        }),
        tP = i("$ZodStringFormat", (e, t) => {
            t_.init(e, t), tD.init(e, t)
        }),
        tE = i("$ZodGUID", (e, t) => {
            t.pattern ?? (t.pattern = eZ), tP.init(e, t)
        }),
        tA = i("$ZodUUID", (e, t) => {
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
                if (void 0 === e) throw Error(`Invalid UUID version: "${t.version}"`);
                t.pattern ?? (t.pattern = eU(e))
            } else t.pattern ?? (t.pattern = eU());
            tP.init(e, t)
        }),
        tM = i("$ZodEmail", (e, t) => {
            t.pattern ?? (t.pattern = eD), tP.init(e, t)
        }),
        tT = i("$ZodURL", (e, t) => {
            tP.init(e, t), e._zod.check = i => {
                try {
                    let n = i.value.trim(),
                        r = new URL(n);
                    t.hostname && (t.hostname.lastIndex = 0, t.hostname.test(r.hostname) || i.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid hostname",
                        pattern: eF.source,
                        input: i.value,
                        inst: e,
                        continue: !t.abort
                    })), t.protocol && (t.protocol.lastIndex = 0, t.protocol.test(r.protocol.endsWith(":") ? r.protocol.slice(0, -1) : r.protocol) || i.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid protocol",
                        pattern: t.protocol.source,
                        input: i.value,
                        inst: e,
                        continue: !t.abort
                    })), t.normalize ? i.value = r.href : i.value = n;
                    return
                } catch (n) {
                    i.issues.push({
                        code: "invalid_format",
                        format: "url",
                        input: i.value,
                        inst: e,
                        continue: !t.abort
                    })
                }
            }
        }),
        tC = i("$ZodEmoji", (e, t) => {
            t.pattern ?? (t.pattern = eE()), tP.init(e, t)
        }),
        tL = i("$ZodNanoID", (e, t) => {
            t.pattern ?? (t.pattern = ez), tP.init(e, t)
        }),
        tR = i("$ZodCUID", (e, t) => {
            t.pattern ?? (t.pattern = eb), tP.init(e, t)
        }),
        tF = i("$ZodCUID2", (e, t) => {
            t.pattern ?? (t.pattern = ex), tP.init(e, t)
        }),
        tJ = i("$ZodULID", (e, t) => {
            t.pattern ?? (t.pattern = ek), tP.init(e, t)
        }),
        tW = i("$ZodXID", (e, t) => {
            t.pattern ?? (t.pattern = eI), tP.init(e, t)
        }),
        tB = i("$ZodKSUID", (e, t) => {
            t.pattern ?? (t.pattern = ew), tP.init(e, t)
        }),
        tG = i("$ZodISODateTime", (e, t) => {
            t.pattern ?? (t.pattern = eV(t)), tP.init(e, t)
        }),
        tK = i("$ZodISODate", (e, t) => {
            t.pattern ?? (t.pattern = eB), tP.init(e, t)
        }),
        tV = i("$ZodISOTime", (e, t) => {
            t.pattern ?? (t.pattern = eK(t)), tP.init(e, t)
        }),
        tX = i("$ZodISODuration", (e, t) => {
            t.pattern ?? (t.pattern = eS), tP.init(e, t)
        }),
        tq = i("$ZodIPv4", (e, t) => {
            t.pattern ?? (t.pattern = eA), tP.init(e, t), e._zod.onattach.push(e => {
                e._zod.bag.format = "ipv4"
            })
        }),
        tY = i("$ZodIPv6", (e, t) => {
            t.pattern ?? (t.pattern = eM), tP.init(e, t), e._zod.onattach.push(e => {
                e._zod.bag.format = "ipv6"
            }), e._zod.check = i => {
                try {
                    new URL(`http://[${i.value}]`)
                } catch {
                    i.issues.push({
                        code: "invalid_format",
                        format: "ipv6",
                        input: i.value,
                        inst: e,
                        continue: !t.abort
                    })
                }
            }
        }),
        tH = i("$ZodCIDRv4", (e, t) => {
            t.pattern ?? (t.pattern = eT), tP.init(e, t)
        }),
        tQ = i("$ZodCIDRv6", (e, t) => {
            t.pattern ?? (t.pattern = eC), tP.init(e, t), e._zod.check = i => {
                let n = i.value.split("/");
                try {
                    if (2 !== n.length) throw Error();
                    let [e, t] = n;
                    if (!t) throw Error();
                    let i = Number(t);
                    if (`${i}` !== t || i < 0 || i > 128) throw Error();
                    new URL(`http://[${e}]`)
                } catch {
                    i.issues.push({
                        code: "invalid_format",
                        format: "cidrv6",
                        input: i.value,
                        inst: e,
                        continue: !t.abort
                    })
                }
            }
        });

    function t0(e) {
        if ("" === e) return !0;
        if (e.length % 4 != 0) return !1;
        try {
            return atob(e), !0
        } catch {
            return !1
        }
    }
    let t4 = i("$ZodBase64", (e, t) => {
        t.pattern ?? (t.pattern = eL), tP.init(e, t), e._zod.onattach.push(e => {
            e._zod.bag.contentEncoding = "base64"
        }), e._zod.check = i => {
            t0(i.value) || i.issues.push({
                code: "invalid_format",
                format: "base64",
                input: i.value,
                inst: e,
                continue: !t.abort
            })
        }
    });

    function t6(e) {
        if (!eR.test(e)) return !1;
        let t = e.replace(/[-_]/g, e => "-" === e ? "+" : "/");
        return t0(t.padEnd(4 * Math.ceil(t.length / 4), "="))
    }
    let t1 = i("$ZodBase64URL", (e, t) => {
            t.pattern ?? (t.pattern = eR), tP.init(e, t), e._zod.onattach.push(e => {
                e._zod.bag.contentEncoding = "base64url"
            }), e._zod.check = i => {
                t6(i.value) || i.issues.push({
                    code: "invalid_format",
                    format: "base64url",
                    input: i.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        t2 = i("$ZodE164", (e, t) => {
            t.pattern ?? (t.pattern = eJ), tP.init(e, t)
        });

    function t9(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null;
        try {
            let i = e.split(".");
            if (3 !== i.length) return !1;
            let [n] = i;
            if (!n) return !1;
            let r = JSON.parse(atob(n));
            if ("typ" in r && r?.typ !== "JWT" || !r.alg || t && (!("alg" in r) || r.alg !== t)) return !1;
            return !0
        } catch {
            return !1
        }
    }
    let t3 = i("$ZodJWT", (e, t) => {
            tP.init(e, t), e._zod.check = i => {
                t9(i.value, t.alg) || i.issues.push({
                    code: "invalid_format",
                    format: "jwt",
                    input: i.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        t7 = i("$ZodCustomStringFormat", (e, t) => {
            tP.init(e, t), e._zod.check = i => {
                t.fn(i.value) || i.issues.push({
                    code: "invalid_format",
                    format: t.format,
                    input: i.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        t5 = i("$ZodNumber", (e, t) => {
            tN.init(e, t), e._zod.pattern = e._zod.bag.pattern ?? eH, e._zod.parse = (i, n) => {
                if (t.coerce) try {
                    i.value = Number(i.value)
                } catch (e) {}
                let r = i.value;
                if ("number" == typeof r && !Number.isNaN(r) && Number.isFinite(r)) return i;
                let a = "number" == typeof r ? Number.isNaN(r) ? "NaN" : Number.isFinite(r) ? void 0 : "Infinity" : void 0;
                return i.issues.push({
                    expected: "number",
                    code: "invalid_type",
                    input: r,
                    inst: e,
                    ...a ? {
                        received: a
                    } : {}
                }), i
            }
        }),
        t8 = i("$ZodNumber", (e, t) => {
            tc.init(e, t), t5.init(e, t)
        }),
        ie = i("$ZodBoolean", (e, t) => {
            tN.init(e, t), e._zod.pattern = eQ, e._zod.parse = (i, n) => {
                if (t.coerce) try {
                    i.value = !!i.value
                } catch (e) {}
                let r = i.value;
                return "boolean" == typeof r || i.issues.push({
                    expected: "boolean",
                    code: "invalid_type",
                    input: r,
                    inst: e
                }), i
            }
        }),
        it = i("$ZodBigInt", (e, t) => {
            tN.init(e, t), e._zod.pattern = eq, e._zod.parse = (i, n) => {
                if (t.coerce) try {
                    i.value = BigInt(i.value)
                } catch (e) {}
                return "bigint" == typeof i.value || i.issues.push({
                    expected: "bigint",
                    code: "invalid_type",
                    input: i.value,
                    inst: e
                }), i
            }
        }),
        ii = i("$ZodBigInt", (e, t) => {
            tm.init(e, t), it.init(e, t)
        }),
        ir = i("$ZodSymbol", (e, t) => {
            tN.init(e, t), e._zod.parse = (t, i) => {
                let n = t.value;
                return "symbol" == typeof n || t.issues.push({
                    expected: "symbol",
                    code: "invalid_type",
                    input: n,
                    inst: e
                }), t
            }
        }),
        ia = i("$ZodUndefined", (e, t) => {
            tN.init(e, t), e._zod.pattern = e4, e._zod.values = new Set([void 0]), e._zod.optin = "optional", e._zod.optout = "optional", e._zod.parse = (t, i) => {
                let n = t.value;
                return void 0 === n || t.issues.push({
                    expected: "undefined",
                    code: "invalid_type",
                    input: n,
                    inst: e
                }), t
            }
        }),
        io = i("$ZodNull", (e, t) => {
            tN.init(e, t), e._zod.pattern = e0, e._zod.values = new Set([null]), e._zod.parse = (t, i) => {
                let n = t.value;
                return null === n || t.issues.push({
                    expected: "null",
                    code: "invalid_type",
                    input: n,
                    inst: e
                }), t
            }
        }),
        iu = i("$ZodAny", (e, t) => {
            tN.init(e, t), e._zod.parse = e => e
        }),
        is = i("$ZodUnknown", (e, t) => {
            tN.init(e, t), e._zod.parse = e => e
        }),
        il = i("$ZodNever", (e, t) => {
            tN.init(e, t), e._zod.parse = (t, i) => (t.issues.push({
                expected: "never",
                code: "invalid_type",
                input: t.value,
                inst: e
            }), t)
        }),
        id = i("$ZodVoid", (e, t) => {
            tN.init(e, t), e._zod.parse = (t, i) => {
                let n = t.value;
                return void 0 === n || t.issues.push({
                    expected: "void",
                    code: "invalid_type",
                    input: n,
                    inst: e
                }), t
            }
        }),
        ic = i("$ZodDate", (e, t) => {
            tN.init(e, t), e._zod.parse = (i, n) => {
                if (t.coerce) try {
                    i.value = new Date(i.value)
                } catch (e) {}
                let r = i.value,
                    a = r instanceof Date;
                return a && !Number.isNaN(r.getTime()) || i.issues.push({
                    expected: "date",
                    code: "invalid_type",
                    input: r,
                    ...a ? {
                        received: "Invalid Date"
                    } : {},
                    inst: e
                }), i
            }
        });

    function im(e, t, i) {
        e.issues.length && t.issues.push(...E(i, e.issues)), t.value[i] = e.value
    }
    let ip = i("$ZodArray", (e, t) => {
        tN.init(e, t), e._zod.parse = (i, n) => {
            let r = i.value;
            if (!Array.isArray(r)) return i.issues.push({
                expected: "array",
                code: "invalid_type",
                input: r,
                inst: e
            }), i;
            i.value = Array(r.length);
            let a = [];
            for (let e = 0; e < r.length; e++) {
                let o = r[e],
                    u = t.element._zod.run({
                        value: o,
                        issues: []
                    }, n);
                u instanceof Promise ? a.push(u.then(t => im(t, i, e))) : im(u, i, e)
            }
            return a.length ? Promise.all(a).then(() => i) : i
        }
    });

    function iv(e, t, i, n) {
        e.issues.length && t.issues.push(...E(i, e.issues)), void 0 === e.value ? i in n && (t.value[i] = void 0) : t.value[i] = e.value
    }

    function ig(e) {
        let t = Object.keys(e.shape);
        for (let i of t)
            if (!e.shape?.[i]?._zod?.traits?.has("$ZodType")) throw Error(`Invalid element at key "${i}": expected a Zod schema`);
        let i = j(e.shape);
        return {
            ...e,
            keys: t,
            keySet: new Set(t),
            numKeys: t.length,
            optionalKeys: new Set(i)
        }
    }

    function i$(e, t, i, n, r, a) {
        let o = [],
            u = r.keySet,
            s = r.catchall._zod,
            l = s.def.type;
        for (let r of Object.keys(t)) {
            if (u.has(r)) continue;
            if ("never" === l) {
                o.push(r);
                continue
            }
            let a = s.run({
                value: t[r],
                issues: []
            }, n);
            a instanceof Promise ? e.push(a.then(e => iv(e, i, r, t))) : iv(a, i, r, t)
        }
        return (o.length && i.issues.push({
            code: "unrecognized_keys",
            keys: o,
            input: t,
            inst: a
        }), e.length) ? Promise.all(e).then(() => i) : i
    }
    let ih = i("$ZodObject", (e, t) => {
            let i;
            tN.init(e, t);
            let n = Object.getOwnPropertyDescriptor(t, "shape");
            if (!n?.get) {
                let e = t.shape;
                Object.defineProperty(t, "shape", {
                    get: () => {
                        let i = {
                            ...e
                        };
                        return Object.defineProperty(t, "shape", {
                            value: i
                        }), i
                    }
                })
            }
            let r = c(() => ig(t));
            g(e._zod, "propValues", () => {
                let e = t.shape,
                    i = {};
                for (let t in e) {
                    let n = e[t]._zod;
                    if (n.values)
                        for (let e of (i[t] ?? (i[t] = new Set), n.values)) i[t].add(e)
                }
                return i
            });
            let a = t.catchall;
            e._zod.parse = (t, n) => {
                i ?? (i = r.value);
                let o = t.value;
                if (!b(o)) return t.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: o,
                    inst: e
                }), t;
                t.value = {};
                let u = [],
                    s = i.shape;
                for (let e of i.keys) {
                    let i = s[e]._zod.run({
                        value: o[e],
                        issues: []
                    }, n);
                    i instanceof Promise ? u.push(i.then(i => iv(i, t, e, o))) : iv(i, t, e, o)
                }
                return a ? i$(u, o, t, n, r.value, e) : u.length ? Promise.all(u).then(() => t) : t
            }
        }),
        i_ = i("$ZodObjectJIT", (e, t) => {
            let i, n;
            ih.init(e, t);
            let r = e._zod.parse,
                a = c(() => ig(t)),
                u = !o.jitless,
                s = u && x.value,
                l = t.catchall;
            e._zod.parse = (o, d) => {
                n ?? (n = a.value);
                let c = o.value;
                return b(c) ? u && s && d?.async === !1 && !0 !== d.jitless ? (i || (i = (e => {
                    let t = new tO(["shape", "payload", "ctx"]),
                        i = a.value,
                        n = e => {
                            let t = _(e);
                            return `shape[${t}]._zod.run({ value: input[${t}], issues: [] }, ctx)`
                        };
                    t.write("const input = payload.value;");
                    let r = Object.create(null),
                        o = 0;
                    for (let e of i.keys) r[e] = `key_${o++}`;
                    for (let e of (t.write("const newResult = {};"), i.keys)) {
                        let i = r[e],
                            a = _(e);
                        t.write(`const ${i} = ${n(e)};`), t.write(`
        if (${i}.issues.length) {
          payload.issues = payload.issues.concat(${i}.issues.map(iss => ({
            ...iss,
            path: iss.path ? [${a}, ...iss.path] : [${a}]
          })));
        }
        
        
        if (${i}.value === undefined) {
          if (${a} in input) {
            newResult[${a}] = undefined;
          }
        } else {
          newResult[${a}] = ${i}.value;
        }
        
      `)
                    }
                    t.write("payload.value = newResult;"), t.write("return payload;");
                    let u = t.compile();
                    return (t, i) => u(e, t, i)
                })(t.shape)), o = i(o, d), l) ? i$([], c, o, d, n, e) : o : r(o, d) : (o.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: c,
                    inst: e
                }), o)
            }
        });

    function iy(e, t, i, n) {
        for (let i of e)
            if (0 === i.issues.length) return t.value = i.value, t;
        let r = e.filter(e => !P(e));
        return 1 === r.length ? (t.value = r[0].value, r[0]) : (t.issues.push({
            code: "invalid_union",
            input: t.value,
            inst: i,
            errors: e.map(e => e.issues.map(e => M(e, n, u())))
        }), t)
    }
    let ib = i("$ZodUnion", (e, t) => {
            tN.init(e, t), g(e._zod, "optin", () => t.options.some(e => "optional" === e._zod.optin) ? "optional" : void 0), g(e._zod, "optout", () => t.options.some(e => "optional" === e._zod.optout) ? "optional" : void 0), g(e._zod, "values", () => {
                if (t.options.every(e => e._zod.values)) return new Set(t.options.flatMap(e => Array.from(e._zod.values)))
            }), g(e._zod, "pattern", () => {
                if (t.options.every(e => e._zod.pattern)) {
                    let e = t.options.map(e => e._zod.pattern);
                    return RegExp(`^(${e.map(e=>f(e.source)).join("|")})$`)
                }
            });
            let i = 1 === t.options.length,
                n = t.options[0]._zod.run;
            e._zod.parse = (r, a) => {
                if (i) return n(r, a);
                let o = !1,
                    u = [];
                for (let e of t.options) {
                    let t = e._zod.run({
                        value: r.value,
                        issues: []
                    }, a);
                    if (t instanceof Promise) u.push(t), o = !0;
                    else {
                        if (0 === t.issues.length) return t;
                        u.push(t)
                    }
                }
                return o ? Promise.all(u).then(t => iy(t, r, e, a)) : iy(u, r, e, a)
            }
        }),
        ix = i("$ZodDiscriminatedUnion", (e, t) => {
            ib.init(e, t);
            let i = e._zod.parse;
            g(e._zod, "propValues", () => {
                let e = {};
                for (let i of t.options) {
                    let n = i._zod.propValues;
                    if (!n || 0 === Object.keys(n).length) throw Error(`Invalid discriminated union option at index "${t.options.indexOf(i)}"`);
                    for (let [t, i] of Object.entries(n))
                        for (let n of (e[t] || (e[t] = new Set), i)) e[t].add(n)
                }
                return e
            });
            let n = c(() => {
                let e = t.options,
                    i = new Map;
                for (let n of e) {
                    let e = n._zod.propValues?.[t.discriminator];
                    if (!e || 0 === e.size) throw Error(`Invalid discriminated union option at index "${t.options.indexOf(n)}"`);
                    for (let t of e) {
                        if (i.has(t)) throw Error(`Duplicate discriminator value "${String(t)}"`);
                        i.set(t, n)
                    }
                }
                return i
            });
            e._zod.parse = (r, a) => {
                let o = r.value;
                if (!b(o)) return r.issues.push({
                    code: "invalid_type",
                    expected: "object",
                    input: o,
                    inst: e
                }), r;
                let u = n.value.get(o?.[t.discriminator]);
                return u ? u._zod.run(r, a) : t.unionFallback ? i(r, a) : (r.issues.push({
                    code: "invalid_union",
                    errors: [],
                    note: "No matching discriminator",
                    discriminator: t.discriminator,
                    input: o,
                    path: [t.discriminator],
                    inst: e
                }), r)
            }
        }),
        ik = i("$ZodIntersection", (e, t) => {
            tN.init(e, t), e._zod.parse = (e, i) => {
                let n = e.value,
                    r = t.left._zod.run({
                        value: n,
                        issues: []
                    }, i),
                    a = t.right._zod.run({
                        value: n,
                        issues: []
                    }, i);
                return r instanceof Promise || a instanceof Promise ? Promise.all([r, a]).then(t => {
                    let [i, n] = t;
                    return iI(e, i, n)
                }) : iI(e, r, a)
            }
        });

    function iI(e, t, i) {
        if (t.issues.length && e.issues.push(...t.issues), i.issues.length && e.issues.push(...i.issues), P(e)) return e;
        let n = function e(t, i) {
            if (t === i || t instanceof Date && i instanceof Date && +t == +i) return {
                valid: !0,
                data: t
            };
            if (k(t) && k(i)) {
                let n = Object.keys(i),
                    r = Object.keys(t).filter(e => -1 !== n.indexOf(e)),
                    a = {
                        ...t,
                        ...i
                    };
                for (let n of r) {
                    let r = e(t[n], i[n]);
                    if (!r.valid) return {
                        valid: !1,
                        mergeErrorPath: [n, ...r.mergeErrorPath]
                    };
                    a[n] = r.data
                }
                return {
                    valid: !0,
                    data: a
                }
            }
            if (Array.isArray(t) && Array.isArray(i)) {
                if (t.length !== i.length) return {
                    valid: !1,
                    mergeErrorPath: []
                };
                let n = [];
                for (let r = 0; r < t.length; r++) {
                    let a = e(t[r], i[r]);
                    if (!a.valid) return {
                        valid: !1,
                        mergeErrorPath: [r, ...a.mergeErrorPath]
                    };
                    n.push(a.data)
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
        }(t.value, i.value);
        if (!n.valid) throw Error(`Unmergable intersection. Error path: ${JSON.stringify(n.mergeErrorPath)}`);
        return e.value = n.data, e
    }
    let iw = i("$ZodTuple", (e, t) => {
        tN.init(e, t);
        let i = t.items,
            n = i.length - [...i].reverse().findIndex(e => "optional" !== e._zod.optin);
        e._zod.parse = (r, a) => {
            let o = r.value;
            if (!Array.isArray(o)) return r.issues.push({
                input: o,
                inst: e,
                expected: "tuple",
                code: "invalid_type"
            }), r;
            r.value = [];
            let u = [];
            if (!t.rest) {
                let t = o.length > i.length,
                    a = o.length < n - 1;
                if (t || a) return r.issues.push({
                    ...t ? {
                        code: "too_big",
                        maximum: i.length
                    } : {
                        code: "too_small",
                        minimum: i.length
                    },
                    input: o,
                    inst: e,
                    origin: "array"
                }), r
            }
            let s = -1;
            for (let e of i) {
                if (++s >= o.length && s >= n) continue;
                let t = e._zod.run({
                    value: o[s],
                    issues: []
                }, a);
                t instanceof Promise ? u.push(t.then(e => iz(e, r, s))) : iz(t, r, s)
            }
            if (t.rest)
                for (let e of o.slice(i.length)) {
                    s++;
                    let i = t.rest._zod.run({
                        value: e,
                        issues: []
                    }, a);
                    i instanceof Promise ? u.push(i.then(e => iz(e, r, s))) : iz(i, r, s)
                }
            return u.length ? Promise.all(u).then(() => r) : r
        }
    });

    function iz(e, t, i) {
        e.issues.length && t.issues.push(...E(i, e.issues)), t.value[i] = e.value
    }
    let iS = i("$ZodRecord", (e, t) => {
            tN.init(e, t), e._zod.parse = (i, n) => {
                let r = i.value;
                if (!k(r)) return i.issues.push({
                    expected: "record",
                    code: "invalid_type",
                    input: r,
                    inst: e
                }), i;
                let a = [];
                if (t.keyType._zod.values) {
                    let o, u = t.keyType._zod.values;
                    for (let e of (i.value = {}, u))
                        if ("string" == typeof e || "number" == typeof e || "symbol" == typeof e) {
                            let o = t.valueType._zod.run({
                                value: r[e],
                                issues: []
                            }, n);
                            o instanceof Promise ? a.push(o.then(t => {
                                t.issues.length && i.issues.push(...E(e, t.issues)), i.value[e] = t.value
                            })) : (o.issues.length && i.issues.push(...E(e, o.issues)), i.value[e] = o.value)
                        } for (let e in r) u.has(e) || (o = o ?? []).push(e);
                    o && o.length > 0 && i.issues.push({
                        code: "unrecognized_keys",
                        input: r,
                        inst: e,
                        keys: o
                    })
                } else
                    for (let o of (i.value = {}, Reflect.ownKeys(r))) {
                        if ("__proto__" === o) continue;
                        let s = t.keyType._zod.run({
                            value: o,
                            issues: []
                        }, n);
                        if (s instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                        if (s.issues.length) {
                            i.issues.push({
                                code: "invalid_key",
                                origin: "record",
                                issues: s.issues.map(e => M(e, n, u())),
                                input: o,
                                path: [o],
                                inst: e
                            }), i.value[s.value] = s.value;
                            continue
                        }
                        let l = t.valueType._zod.run({
                            value: r[o],
                            issues: []
                        }, n);
                        l instanceof Promise ? a.push(l.then(e => {
                            e.issues.length && i.issues.push(...E(o, e.issues)), i.value[s.value] = e.value
                        })) : (l.issues.length && i.issues.push(...E(o, l.issues)), i.value[s.value] = l.value)
                    }
                return a.length ? Promise.all(a).then(() => i) : i
            }
        }),
        iZ = i("$ZodMap", (e, t) => {
            tN.init(e, t), e._zod.parse = (i, n) => {
                let r = i.value;
                if (!(r instanceof Map)) return i.issues.push({
                    expected: "map",
                    code: "invalid_type",
                    input: r,
                    inst: e
                }), i;
                let a = [];
                for (let [o, u] of(i.value = new Map, r)) {
                    let s = t.keyType._zod.run({
                            value: o,
                            issues: []
                        }, n),
                        l = t.valueType._zod.run({
                            value: u,
                            issues: []
                        }, n);
                    s instanceof Promise || l instanceof Promise ? a.push(Promise.all([s, l]).then(t => {
                        let [a, u] = t;
                        iU(a, u, i, o, r, e, n)
                    })) : iU(s, l, i, o, r, e, n)
                }
                return a.length ? Promise.all(a).then(() => i) : i
            }
        });

    function iU(e, t, i, n, r, a, o) {
        e.issues.length && (w.has(typeof n) ? i.issues.push(...E(n, e.issues)) : i.issues.push({
            code: "invalid_key",
            origin: "map",
            input: r,
            inst: a,
            issues: e.issues.map(e => M(e, o, u()))
        })), t.issues.length && (w.has(typeof n) ? i.issues.push(...E(n, t.issues)) : i.issues.push({
            origin: "map",
            code: "invalid_element",
            input: r,
            inst: a,
            key: n,
            issues: t.issues.map(e => M(e, o, u()))
        })), i.value.set(e.value, t.value)
    }
    let iO = i("$ZodSet", (e, t) => {
        tN.init(e, t), e._zod.parse = (i, n) => {
            let r = i.value;
            if (!(r instanceof Set)) return i.issues.push({
                input: r,
                inst: e,
                expected: "set",
                code: "invalid_type"
            }), i;
            let a = [];
            for (let e of (i.value = new Set, r)) {
                let r = t.valueType._zod.run({
                    value: e,
                    issues: []
                }, n);
                r instanceof Promise ? a.push(r.then(e => ij(e, i))) : ij(r, i)
            }
            return a.length ? Promise.all(a).then(() => i) : i
        }
    });

    function ij(e, t) {
        e.issues.length && t.issues.push(...e.issues), t.value.add(e.value)
    }
    let iN = i("$ZodEnum", (e, t) => {
            tN.init(e, t);
            let i = s(t.entries),
                n = new Set(i);
            e._zod.values = n, e._zod.pattern = RegExp(`^(${i.filter(e=>w.has(typeof e)).map(e=>"string"==typeof e?S(e):e.toString()).join("|")})$`), e._zod.parse = (t, r) => {
                let a = t.value;
                return n.has(a) || t.issues.push({
                    code: "invalid_value",
                    values: i,
                    input: a,
                    inst: e
                }), t
            }
        }),
        iD = i("$ZodLiteral", (e, t) => {
            if (tN.init(e, t), 0 === t.values.length) throw Error("Cannot create literal schema with no valid values");
            e._zod.values = new Set(t.values), e._zod.pattern = RegExp(`^(${t.values.map(e=>"string"==typeof e?S(e):e?S(e.toString()):String(e)).join("|")})$`), e._zod.parse = (i, n) => {
                let r = i.value;
                return e._zod.values.has(r) || i.issues.push({
                    code: "invalid_value",
                    values: t.values,
                    input: r,
                    inst: e
                }), i
            }
        }),
        iP = i("$ZodFile", (e, t) => {
            tN.init(e, t), e._zod.parse = (t, i) => {
                let n = t.value;
                return n instanceof File || t.issues.push({
                    expected: "file",
                    code: "invalid_type",
                    input: n,
                    inst: e
                }), t
            }
        }),
        iE = i("$ZodTransform", (e, t) => {
            tN.init(e, t), e._zod.parse = (i, n) => {
                if ("backward" === n.direction) throw new a(e.constructor.name);
                let o = t.transform(i.value, i);
                if (n.async) return (o instanceof Promise ? o : Promise.resolve(o)).then(e => (i.value = e, i));
                if (o instanceof Promise) throw new r;
                return i.value = o, i
            }
        });

    function iA(e, t) {
        return e.issues.length && void 0 === t ? {
            issues: [],
            value: void 0
        } : e
    }
    let iM = i("$ZodOptional", (e, t) => {
            tN.init(e, t), e._zod.optin = "optional", e._zod.optout = "optional", g(e._zod, "values", () => t.innerType._zod.values ? new Set([...t.innerType._zod.values, void 0]) : void 0), g(e._zod, "pattern", () => {
                let e = t.innerType._zod.pattern;
                return e ? RegExp(`^(${f(e.source)})?$`) : void 0
            }), e._zod.parse = (e, i) => {
                if ("optional" === t.innerType._zod.optin) {
                    let n = t.innerType._zod.run(e, i);
                    return n instanceof Promise ? n.then(t => iA(t, e.value)) : iA(n, e.value)
                }
                return void 0 === e.value ? e : t.innerType._zod.run(e, i)
            }
        }),
        iT = i("$ZodNullable", (e, t) => {
            tN.init(e, t), g(e._zod, "optin", () => t.innerType._zod.optin), g(e._zod, "optout", () => t.innerType._zod.optout), g(e._zod, "pattern", () => {
                let e = t.innerType._zod.pattern;
                return e ? RegExp(`^(${f(e.source)}|null)$`) : void 0
            }), g(e._zod, "values", () => t.innerType._zod.values ? new Set([...t.innerType._zod.values, null]) : void 0), e._zod.parse = (e, i) => null === e.value ? e : t.innerType._zod.run(e, i)
        }),
        iC = i("$ZodDefault", (e, t) => {
            tN.init(e, t), e._zod.optin = "optional", g(e._zod, "values", () => t.innerType._zod.values), e._zod.parse = (e, i) => {
                if ("backward" === i.direction) return t.innerType._zod.run(e, i);
                if (void 0 === e.value) return e.value = t.defaultValue, e;
                let n = t.innerType._zod.run(e, i);
                return n instanceof Promise ? n.then(e => iL(e, t)) : iL(n, t)
            }
        });

    function iL(e, t) {
        return void 0 === e.value && (e.value = t.defaultValue), e
    }
    let iR = i("$ZodPrefault", (e, t) => {
            tN.init(e, t), e._zod.optin = "optional", g(e._zod, "values", () => t.innerType._zod.values), e._zod.parse = (e, i) => ("backward" === i.direction || void 0 === e.value && (e.value = t.defaultValue), t.innerType._zod.run(e, i))
        }),
        iF = i("$ZodNonOptional", (e, t) => {
            tN.init(e, t), g(e._zod, "values", () => {
                let e = t.innerType._zod.values;
                return e ? new Set([...e].filter(e => void 0 !== e)) : void 0
            }), e._zod.parse = (i, n) => {
                let r = t.innerType._zod.run(i, n);
                return r instanceof Promise ? r.then(t => iJ(t, e)) : iJ(r, e)
            }
        });

    function iJ(e, t) {
        return e.issues.length || void 0 !== e.value || e.issues.push({
            code: "invalid_type",
            expected: "nonoptional",
            input: e.value,
            inst: t
        }), e
    }
    let iW = i("$ZodSuccess", (e, t) => {
            tN.init(e, t), e._zod.parse = (e, i) => {
                if ("backward" === i.direction) throw new a("ZodSuccess");
                let n = t.innerType._zod.run(e, i);
                return n instanceof Promise ? n.then(t => (e.value = 0 === t.issues.length, e)) : (e.value = 0 === n.issues.length, e)
            }
        }),
        iB = i("$ZodCatch", (e, t) => {
            tN.init(e, t), g(e._zod, "optin", () => t.innerType._zod.optin), g(e._zod, "optout", () => t.innerType._zod.optout), g(e._zod, "values", () => t.innerType._zod.values), e._zod.parse = (e, i) => {
                if ("backward" === i.direction) return t.innerType._zod.run(e, i);
                let n = t.innerType._zod.run(e, i);
                return n instanceof Promise ? n.then(n => (e.value = n.value, n.issues.length && (e.value = t.catchValue({
                    ...e,
                    error: {
                        issues: n.issues.map(e => M(e, i, u()))
                    },
                    input: e.value
                }), e.issues = []), e)) : (e.value = n.value, n.issues.length && (e.value = t.catchValue({
                    ...e,
                    error: {
                        issues: n.issues.map(e => M(e, i, u()))
                    },
                    input: e.value
                }), e.issues = []), e)
            }
        }),
        iG = i("$ZodNaN", (e, t) => {
            tN.init(e, t), e._zod.parse = (t, i) => ("number" == typeof t.value && Number.isNaN(t.value) || t.issues.push({
                input: t.value,
                inst: e,
                expected: "nan",
                code: "invalid_type"
            }), t)
        }),
        iK = i("$ZodPipe", (e, t) => {
            tN.init(e, t), g(e._zod, "values", () => t.in._zod.values), g(e._zod, "optin", () => t.in._zod.optin), g(e._zod, "optout", () => t.out._zod.optout), g(e._zod, "propValues", () => t.in._zod.propValues), e._zod.parse = (e, i) => {
                if ("backward" === i.direction) {
                    let n = t.out._zod.run(e, i);
                    return n instanceof Promise ? n.then(e => iV(e, t.in, i)) : iV(n, t.in, i)
                }
                let n = t.in._zod.run(e, i);
                return n instanceof Promise ? n.then(e => iV(e, t.out, i)) : iV(n, t.out, i)
            }
        });

    function iV(e, t, i) {
        return e.issues.length ? (e.aborted = !0, e) : t._zod.run({
            value: e.value,
            issues: e.issues
        }, i)
    }
    let iX = i("$ZodCodec", (e, t) => {
        tN.init(e, t), g(e._zod, "values", () => t.in._zod.values), g(e._zod, "optin", () => t.in._zod.optin), g(e._zod, "optout", () => t.out._zod.optout), g(e._zod, "propValues", () => t.in._zod.propValues), e._zod.parse = (e, i) => {
            if ("forward" === (i.direction || "forward")) {
                let n = t.in._zod.run(e, i);
                return n instanceof Promise ? n.then(e => iq(e, t, i)) : iq(n, t, i)
            } {
                let n = t.out._zod.run(e, i);
                return n instanceof Promise ? n.then(e => iq(e, t, i)) : iq(n, t, i)
            }
        }
    });

    function iq(e, t, i) {
        if (e.issues.length) return e.aborted = !0, e;
        if ("forward" === (i.direction || "forward")) {
            let n = t.transform(e.value, e);
            return n instanceof Promise ? n.then(n => iY(e, n, t.out, i)) : iY(e, n, t.out, i)
        } {
            let n = t.reverseTransform(e.value, e);
            return n instanceof Promise ? n.then(n => iY(e, n, t.in, i)) : iY(e, n, t.in, i)
        }
    }

    function iY(e, t, i, n) {
        return e.issues.length ? (e.aborted = !0, e) : i._zod.run({
            value: t,
            issues: e.issues
        }, n)
    }
    let iH = i("$ZodReadonly", (e, t) => {
        tN.init(e, t), g(e._zod, "propValues", () => t.innerType._zod.propValues), g(e._zod, "values", () => t.innerType._zod.values), g(e._zod, "optin", () => t.innerType._zod.optin), g(e._zod, "optout", () => t.innerType._zod.optout), e._zod.parse = (e, i) => {
            if ("backward" === i.direction) return t.innerType._zod.run(e, i);
            let n = t.innerType._zod.run(e, i);
            return n instanceof Promise ? n.then(iQ) : iQ(n)
        }
    });

    function iQ(e) {
        return e.value = Object.freeze(e.value), e
    }
    let i0 = i("$ZodTemplateLiteral", (e, t) => {
            tN.init(e, t);
            let i = [];
            for (let e of t.parts)
                if ("object" == typeof e && null !== e) {
                    if (!e._zod.pattern) throw Error(`Invalid template literal part, no pattern found: ${[...e._zod.traits].shift()}`);
                    let t = e._zod.pattern instanceof RegExp ? e._zod.pattern.source : e._zod.pattern;
                    if (!t) throw Error(`Invalid template literal part: ${e._zod.traits}`);
                    let n = +!!t.startsWith("^"),
                        r = t.endsWith("$") ? t.length - 1 : t.length;
                    i.push(t.slice(n, r))
                } else if (null === e || z.has(typeof e)) i.push(S(`${e}`));
            else throw Error(`Invalid template literal part: ${e}`);
            e._zod.pattern = RegExp(`^${i.join("")}$`), e._zod.parse = (i, n) => ("string" != typeof i.value ? i.issues.push({
                input: i.value,
                inst: e,
                expected: "template_literal",
                code: "invalid_type"
            }) : (e._zod.pattern.lastIndex = 0, e._zod.pattern.test(i.value) || i.issues.push({
                input: i.value,
                inst: e,
                code: "invalid_format",
                format: t.format ?? "template_literal",
                pattern: e._zod.pattern.source
            })), i)
        }),
        i4 = i("$ZodFunction", (e, t) => (tN.init(e, t), e._def = t, e._zod.def = t, e.implement = t => {
            if ("function" != typeof t) throw Error("implement() must be called with a function");
            return function() {
                for (var i = arguments.length, n = Array(i), r = 0; r < i; r++) n[r] = arguments[r];
                let a = Reflect.apply(t, this, e._def.input ? H(e._def.input, n) : n);
                return e._def.output ? H(e._def.output, a) : a
            }
        }, e.implementAsync = t => {
            if ("function" != typeof t) throw Error("implementAsync() must be called with a function");
            return async function() {
                for (var i = arguments.length, n = Array(i), r = 0; r < i; r++) n[r] = arguments[r];
                let a = e._def.input ? await ee(e._def.input, n) : n,
                    o = await Reflect.apply(t, this, a);
                return e._def.output ? await ee(e._def.output, o) : o
            }
        }, e._zod.parse = (t, i) => ("function" != typeof t.value ? t.issues.push({
            code: "invalid_type",
            expected: "function",
            input: t.value,
            inst: e
        }) : e._def.output && "promise" === e._def.output._zod.def.type ? t.value = e.implementAsync(t.value) : t.value = e.implement(t.value), t), e.input = function() {
            for (var t = arguments.length, i = Array(t), n = 0; n < t; n++) i[n] = arguments[n];
            let r = e.constructor;
            return new r(Array.isArray(i[0]) ? {
                type: "function",
                input: new iw({
                    type: "tuple",
                    items: i[0],
                    rest: i[1]
                }),
                output: e._def.output
            } : {
                type: "function",
                input: i[0],
                output: e._def.output
            })
        }, e.output = t => new e.constructor({
            type: "function",
            input: e._def.input,
            output: t
        }), e)),
        i6 = i("$ZodPromise", (e, t) => {
            tN.init(e, t), e._zod.parse = (e, i) => Promise.resolve(e.value).then(e => t.innerType._zod.run({
                value: e,
                issues: []
            }, i))
        }),
        i1 = i("$ZodLazy", (e, t) => {
            tN.init(e, t), g(e._zod, "innerType", () => t.getter()), g(e._zod, "pattern", () => e._zod.innerType._zod.pattern), g(e._zod, "propValues", () => e._zod.innerType._zod.propValues), g(e._zod, "optin", () => e._zod.innerType._zod.optin ?? void 0), g(e._zod, "optout", () => e._zod.innerType._zod.optout ?? void 0), e._zod.parse = (t, i) => e._zod.innerType._zod.run(t, i)
        }),
        i2 = i("$ZodCustom", (e, t) => {
            to.init(e, t), tN.init(e, t), e._zod.parse = (e, t) => e, e._zod.check = i => {
                let n = i.value,
                    r = t.fn(n);
                if (r instanceof Promise) return r.then(t => i9(t, i, n, e));
                i9(r, i, n, e)
            }
        });

    function i9(e, t, i, n) {
        if (!e) {
            let e = {
                code: "custom",
                input: i,
                inst: n,
                path: [...n._zod.def.path ?? []],
                continue: !n._zod.def.abort
            };
            n._zod.def.params && (e.params = n._zod.def.params), t.issues.push(L(e))
        }
    }
    e.s(["$ZodAny", 0, iu, "$ZodArray", 0, ip, "$ZodBase64", 0, t4, "$ZodBase64URL", 0, t1, "$ZodBigInt", 0, it, "$ZodBigIntFormat", 0, ii, "$ZodBoolean", 0, ie, "$ZodCIDRv4", 0, tH, "$ZodCIDRv6", 0, tQ, "$ZodCUID", 0, tR, "$ZodCUID2", 0, tF, "$ZodCatch", 0, iB, "$ZodCodec", 0, iX, "$ZodCustom", 0, i2, "$ZodCustomStringFormat", 0, t7, "$ZodDate", 0, ic, "$ZodDefault", 0, iC, "$ZodDiscriminatedUnion", 0, ix, "$ZodE164", 0, t2, "$ZodEmail", 0, tM, "$ZodEmoji", 0, tC, "$ZodEnum", 0, iN, "$ZodFile", 0, iP, "$ZodFunction", 0, i4, "$ZodGUID", 0, tE, "$ZodIPv4", 0, tq, "$ZodIPv6", 0, tY, "$ZodISODate", 0, tK, "$ZodISODateTime", 0, tG, "$ZodISODuration", 0, tX, "$ZodISOTime", 0, tV, "$ZodIntersection", 0, ik, "$ZodJWT", 0, t3, "$ZodKSUID", 0, tB, "$ZodLazy", 0, i1, "$ZodLiteral", 0, iD, "$ZodMap", 0, iZ, "$ZodNaN", 0, iG, "$ZodNanoID", 0, tL, "$ZodNever", 0, il, "$ZodNonOptional", 0, iF, "$ZodNull", 0, io, "$ZodNullable", 0, iT, "$ZodNumber", 0, t5, "$ZodNumberFormat", 0, t8, "$ZodObject", 0, ih, "$ZodObjectJIT", 0, i_, "$ZodOptional", 0, iM, "$ZodPipe", 0, iK, "$ZodPrefault", 0, iR, "$ZodPromise", 0, i6, "$ZodReadonly", 0, iH, "$ZodRecord", 0, iS, "$ZodSet", 0, iO, "$ZodString", 0, tD, "$ZodStringFormat", 0, tP, "$ZodSuccess", 0, iW, "$ZodSymbol", 0, ir, "$ZodTemplateLiteral", 0, i0, "$ZodTransform", 0, iE, "$ZodTuple", 0, iw, "$ZodType", 0, tN, "$ZodULID", 0, tJ, "$ZodURL", 0, tT, "$ZodUUID", 0, tA, "$ZodUndefined", 0, ia, "$ZodUnion", 0, ib, "$ZodUnknown", 0, is, "$ZodVoid", 0, id, "$ZodXID", 0, tW, "isValidBase64", 0, t0, "isValidBase64URL", 0, t6, "isValidJWT", 0, t9], 222636);
    var i3 = e.i(746334),
        i7 = e.i(61039);

    function i5(e, t, i, n) {
        let r = Math.abs(e),
            a = r % 10,
            o = r % 100;
        return o >= 11 && o <= 19 ? n : 1 === a ? t : a >= 2 && a <= 4 ? i : n
    }

    function i8() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `ទិន្នន័យបញ្ចូលមិនត្រឹមត្រូវ៖ ត្រូវការ ${i.expected} ប៉ុន្តែទទួលបាន ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"មិនមែនជាលេខ (NaN)":"លេខ";case"object":if(Array.isArray(e))return"អារេ (Array)";if(null===e)return"គ្មានតម្លៃ (null)";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `ទិន្នន័យបញ្ចូលមិនត្រឹមត្រូវ៖ ត្រូវការ ${O(i.values[0])}`;
                        return `ជម្រើសមិនត្រឹមត្រូវ៖ ត្រូវជាមួយក្នុងចំណោម ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `ធំពេក៖ ត្រូវការ ${i.origin??"តម្លៃ"} ${t} ${i.maximum.toString()} ${n.unit??"ធាតុ"}`;
                        return `ធំពេក៖ ត្រូវការ ${i.origin??"តម្លៃ"} ${t} ${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `តូចពេក៖ ត្រូវការ ${i.origin} ${t} ${i.minimum.toString()} ${n.unit}`;
                        return `តូចពេក៖ ត្រូវការ ${i.origin} ${t} ${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `ខ្សែអក្សរមិនត្រឹមត្រូវ៖ ត្រូវចាប់ផ្តើមដោយ "${i.prefix}"`;
                        if ("ends_with" === i.format) return `ខ្សែអក្សរមិនត្រឹមត្រូវ៖ ត្រូវបញ្ចប់ដោយ "${i.suffix}"`;
                        if ("includes" === i.format) return `ខ្សែអក្សរមិនត្រឹមត្រូវ៖ ត្រូវមាន "${i.includes}"`;
                        if ("regex" === i.format) return `ខ្សែអក្សរមិនត្រឹមត្រូវ៖ ត្រូវតែផ្គូផ្គងនឹងទម្រង់ដែលបានកំណត់ ${i.pattern}`;
                        return `មិនត្រឹមត្រូវ៖ ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `លេខមិនត្រឹមត្រូវ៖ ត្រូវតែជាពហុគុណនៃ ${i.divisor}`;
                    case "unrecognized_keys":
                        return `រកឃើញសោមិនស្គាល់៖ ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `សោមិនត្រឹមត្រូវនៅក្នុង ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "ទិន្នន័យមិនត្រឹមត្រូវ";
                    case "invalid_element":
                        return `ទិន្នន័យមិនត្រឹមត្រូវនៅក្នុង ${i.origin}`
                }
            })
        }
    }
    let ne = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : void 0;
            switch (e) {
                case "number":
                    return Number.isNaN(t) ? "NaN" : "skaičius";
                case "bigint":
                    return "sveikasis skaičius";
                case "string":
                    return "eilutė";
                case "boolean":
                    return "loginė reikšmė";
                case "undefined":
                case "void":
                    return "neapibrėžta reikšmė";
                case "function":
                    return "funkcija";
                case "symbol":
                    return "simbolis";
                case "object":
                    if (void 0 === t) return "nežinomas objektas";
                    if (null === t) return "nulinė reikšmė";
                    if (Array.isArray(t)) return "masyvas";
                    if (Object.getPrototypeOf(t) !== Object.prototype && t.constructor) return t.constructor.name;
                    return "objektas";
                case "null":
                    return "nulinė reikšmė"
            }
            return e
        },
        nt = e => e.charAt(0).toUpperCase() + e.slice(1);

    function ni(e) {
        let t = Math.abs(e),
            i = t % 10,
            n = t % 100;
        return n >= 11 && n <= 19 || 0 === i ? "many" : 1 === i ? "one" : "few"
    }

    function nn(e, t, i, n) {
        let r = Math.abs(e),
            a = r % 10,
            o = r % 100;
        return o >= 11 && o <= 19 ? n : 1 === a ? t : a >= 2 && a <= 4 ? i : n
    }

    function nr() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Неправильні вхідні дані: очікується ${i.expected}, отримано ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"число";case"object":if(Array.isArray(e))return"масив";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Неправильні вхідні дані: очікується ${O(i.values[0])}`;
                        return `Неправильна опція: очікується одне з ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `Занадто велике: очікується, що ${i.origin??"значення"} ${n.verb} ${t}${i.maximum.toString()} ${n.unit??"елементів"}`;
                        return `Занадто велике: очікується, що ${i.origin??"значення"} буде ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `Занадто мале: очікується, що ${i.origin} ${n.verb} ${t}${i.minimum.toString()} ${n.unit}`;
                        return `Занадто мале: очікується, що ${i.origin} буде ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Неправильний рядок: повинен починатися з "${i.prefix}"`;
                        if ("ends_with" === i.format) return `Неправильний рядок: повинен закінчуватися на "${i.suffix}"`;
                        if ("includes" === i.format) return `Неправильний рядок: повинен містити "${i.includes}"`;
                        if ("regex" === i.format) return `Неправильний рядок: повинен відповідати шаблону ${i.pattern}`;
                        return `Неправильний ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `Неправильне число: повинно бути кратним ${i.divisor}`;
                    case "unrecognized_keys":
                        return `Нерозпізнаний ключ${i.keys.length>1?"і":""}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Неправильний ключ у ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Неправильні вхідні дані";
                    case "invalid_element":
                        return `Неправильне значення у ${i.origin}`
                }
            })
        }
    }
    e.s([], 916640), e.i(916640), e.s(["ar", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `مدخلات غير مقبولة: يفترض إدخال ${i.expected}، ولكن تم إدخال ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"number";case"object":if(Array.isArray(e))return"array";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `مدخلات غير مقبولة: يفترض إدخال ${O(i.values[0])}`;
                        return `اختيار غير مقبول: يتوقع انتقاء أحد هذه الخيارات: ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return ` أكبر من اللازم: يفترض أن تكون ${i.origin??"القيمة"} ${t} ${i.maximum.toString()} ${n.unit??"عنصر"}`;
                        return `أكبر من اللازم: يفترض أن تكون ${i.origin??"القيمة"} ${t} ${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `أصغر من اللازم: يفترض لـ ${i.origin} أن يكون ${t} ${i.minimum.toString()} ${n.unit}`;
                        return `أصغر من اللازم: يفترض لـ ${i.origin} أن يكون ${t} ${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `نَص غير مقبول: يجب أن يبدأ بـ "${i.prefix}"`;
                        if ("ends_with" === i.format) return `نَص غير مقبول: يجب أن ينتهي بـ "${i.suffix}"`;
                        if ("includes" === i.format) return `نَص غير مقبول: يجب أن يتضمَّن "${i.includes}"`;
                        if ("regex" === i.format) return `نَص غير مقبول: يجب أن يطابق النمط ${i.pattern}`;
                        return `${t[i.format]??i.format} غير مقبول`;
                    case "not_multiple_of":
                        return `رقم غير مقبول: يجب أن يكون من مضاعفات ${i.divisor}`;
                    case "unrecognized_keys":
                        return `معرف${i.keys.length>1?"ات":""} غريب${i.keys.length>1?"ة":""}: ${l(i.keys,"، ")}`;
                    case "invalid_key":
                        return `معرف غير مقبول في ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "مدخل غير مقبول";
                    case "invalid_element":
                        return `مدخل غير مقبول في ${i.origin}`
                }
            })
        }
    }, "az", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Yanlış dəyər: g\xf6zlənilən ${i.expected}, daxil olan ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"number";case"object":if(Array.isArray(e))return"array";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Yanlış dəyər: g\xf6zlənilən ${O(i.values[0])}`;
                        return `Yanlış se\xe7im: aşağıdakılardan biri olmalıdır: ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `\xc7ox b\xf6y\xfck: g\xf6zlənilən ${i.origin??"dəyər"} ${t}${i.maximum.toString()} ${n.unit??"element"}`;
                        return `\xc7ox b\xf6y\xfck: g\xf6zlənilən ${i.origin??"dəyər"} ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `\xc7ox ki\xe7ik: g\xf6zlənilən ${i.origin} ${t}${i.minimum.toString()} ${n.unit}`;
                        return `\xc7ox ki\xe7ik: g\xf6zlənilən ${i.origin} ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Yanlış mətn: "${i.prefix}" ilə başlamalıdır`;
                        if ("ends_with" === i.format) return `Yanlış mətn: "${i.suffix}" ilə bitməlidir`;
                        if ("includes" === i.format) return `Yanlış mətn: "${i.includes}" daxil olmalıdır`;
                        if ("regex" === i.format) return `Yanlış mətn: ${i.pattern} şablonuna uyğun olmalıdır`;
                        return `Yanlış ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `Yanlış ədəd: ${i.divisor} ilə b\xf6l\xfcnə bilən olmalıdır`;
                    case "unrecognized_keys":
                        return `Tanınmayan a\xe7ar${i.keys.length>1?"lar":""}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `${i.origin} daxilində yanlış a\xe7ar`;
                    case "invalid_union":
                    default:
                        return "Yanlış dəyər";
                    case "invalid_element":
                        return `${i.origin} daxilində yanlış dəyər`
                }
            })
        }
    }, "be", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Няправільны ўвод: чакаўся ${i.expected}, атрымана ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"лік";case"object":if(Array.isArray(e))return"масіў";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Няправільны ўвод: чакалася ${O(i.values[0])}`;
                        return `Няправільны варыянт: чакаўся адзін з ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) {
                            let e = i5(Number(i.maximum), n.unit.one, n.unit.few, n.unit.many);
                            return `Занадта вялікі: чакалася, што ${i.origin??"значэнне"} павінна ${n.verb} ${t}${i.maximum.toString()} ${e}`
                        }
                        return `Занадта вялікі: чакалася, што ${i.origin??"значэнне"} павінна быць ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) {
                            let e = i5(Number(i.minimum), n.unit.one, n.unit.few, n.unit.many);
                            return `Занадта малы: чакалася, што ${i.origin} павінна ${n.verb} ${t}${i.minimum.toString()} ${e}`
                        }
                        return `Занадта малы: чакалася, што ${i.origin} павінна быць ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Няправільны радок: павінен пачынацца з "${i.prefix}"`;
                        if ("ends_with" === i.format) return `Няправільны радок: павінен заканчвацца на "${i.suffix}"`;
                        if ("includes" === i.format) return `Няправільны радок: павінен змяшчаць "${i.includes}"`;
                        if ("regex" === i.format) return `Няправільны радок: павінен адпавядаць шаблону ${i.pattern}`;
                        return `Няправільны ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `Няправільны лік: павінен быць кратным ${i.divisor}`;
                    case "unrecognized_keys":
                        return `Нераспазнаны ${i.keys.length>1?"ключы":"ключ"}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Няправільны ключ у ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Няправільны ўвод";
                    case "invalid_element":
                        return `Няправільнае значэнне ў ${i.origin}`
                }
            })
        }
    }, "ca", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Tipus inv\xe0lid: s'esperava ${i.expected}, s'ha rebut ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"number";case"object":if(Array.isArray(e))return"array";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Valor inv\xe0lid: s'esperava ${O(i.values[0])}`;
                        return `Opci\xf3 inv\xe0lida: s'esperava una de ${l(i.values," o ")}`;
                    case "too_big": {
                        let t = i.inclusive ? "com a màxim" : "menys de",
                            n = e[i.origin] ?? null;
                        if (n) return `Massa gran: s'esperava que ${i.origin??"el valor"} contingu\xe9s ${t} ${i.maximum.toString()} ${n.unit??"elements"}`;
                        return `Massa gran: s'esperava que ${i.origin??"el valor"} fos ${t} ${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? "com a mínim" : "més de",
                            n = e[i.origin] ?? null;
                        if (n) return `Massa petit: s'esperava que ${i.origin} contingu\xe9s ${t} ${i.minimum.toString()} ${n.unit}`;
                        return `Massa petit: s'esperava que ${i.origin} fos ${t} ${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Format inv\xe0lid: ha de comen\xe7ar amb "${i.prefix}"`;
                        if ("ends_with" === i.format) return `Format inv\xe0lid: ha d'acabar amb "${i.suffix}"`;
                        if ("includes" === i.format) return `Format inv\xe0lid: ha d'incloure "${i.includes}"`;
                        if ("regex" === i.format) return `Format inv\xe0lid: ha de coincidir amb el patr\xf3 ${i.pattern}`;
                        return `Format inv\xe0lid per a ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `N\xfamero inv\xe0lid: ha de ser m\xfaltiple de ${i.divisor}`;
                    case "unrecognized_keys":
                        return `Clau${i.keys.length>1?"s":""} no reconeguda${i.keys.length>1?"s":""}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Clau inv\xe0lida a ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Entrada invàlida";
                    case "invalid_element":
                        return `Element inv\xe0lid a ${i.origin}`
                }
            })
        }
    }, "cs", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Neplatn\xfd vstup: oček\xe1v\xe1no ${i.expected}, obdrženo ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"číslo";case"string":return"řetězec";case"boolean":return"boolean";case"bigint":return"bigint";case"function":return"funkce";case"symbol":return"symbol";case"undefined":return"undefined";case"object":if(Array.isArray(e))return"pole";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Neplatn\xfd vstup: oček\xe1v\xe1no ${O(i.values[0])}`;
                        return `Neplatn\xe1 možnost: oček\xe1v\xe1na jedna z hodnot ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `Hodnota je př\xedliš velk\xe1: ${i.origin??"hodnota"} mus\xed m\xedt ${t}${i.maximum.toString()} ${n.unit??"prvků"}`;
                        return `Hodnota je př\xedliš velk\xe1: ${i.origin??"hodnota"} mus\xed b\xfdt ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `Hodnota je př\xedliš mal\xe1: ${i.origin??"hodnota"} mus\xed m\xedt ${t}${i.minimum.toString()} ${n.unit??"prvků"}`;
                        return `Hodnota je př\xedliš mal\xe1: ${i.origin??"hodnota"} mus\xed b\xfdt ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Neplatn\xfd řetězec: mus\xed zač\xednat na "${i.prefix}"`;
                        if ("ends_with" === i.format) return `Neplatn\xfd řetězec: mus\xed končit na "${i.suffix}"`;
                        if ("includes" === i.format) return `Neplatn\xfd řetězec: mus\xed obsahovat "${i.includes}"`;
                        if ("regex" === i.format) return `Neplatn\xfd řetězec: mus\xed odpov\xeddat vzoru ${i.pattern}`;
                        return `Neplatn\xfd form\xe1t ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `Neplatn\xe9 č\xedslo: mus\xed b\xfdt n\xe1sobkem ${i.divisor}`;
                    case "unrecognized_keys":
                        return `Nezn\xe1m\xe9 kl\xedče: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Neplatn\xfd kl\xedč v ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Neplatný vstup";
                    case "invalid_element":
                        return `Neplatn\xe1 hodnota v ${i.origin}`
                }
            })
        }
    }, "da", 0, function() {
        let e, t, i;
        return {
            localeError: (e = {
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
            }, t = {
                string: "streng",
                number: "tal",
                boolean: "boolean",
                array: "liste",
                object: "objekt",
                set: "sæt",
                file: "fil"
            }, i = {
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
            }, n => {
                var r, a, o, u;
                switch (n.code) {
                    case "invalid_type":
                        return `Ugyldigt input: forventede ${t[r=n.expected]??r}, fik ${t[a=(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"tal";case"object":if(Array.isArray(e))return"liste";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name;return"objekt"}return t})(n.input)]??a}`;
                    case "invalid_value":
                        if (1 === n.values.length) return `Ugyldig v\xe6rdi: forventede ${O(n.values[0])}`;
                        return `Ugyldigt valg: forventede en af f\xf8lgende ${l(n.values,"|")}`;
                    case "too_big": {
                        let i = n.inclusive ? "<=" : "<",
                            r = e[n.origin] ?? null,
                            a = t[o = n.origin] ?? o;
                        if (r) return `For stor: forventede ${a??"value"} ${r.verb} ${i} ${n.maximum.toString()} ${r.unit??"elementer"}`;
                        return `For stor: forventede ${a??"value"} havde ${i} ${n.maximum.toString()}`
                    }
                    case "too_small": {
                        let i = n.inclusive ? ">=" : ">",
                            r = e[n.origin] ?? null,
                            a = t[u = n.origin] ?? u;
                        if (r) return `For lille: forventede ${a} ${r.verb} ${i} ${n.minimum.toString()} ${r.unit}`;
                        return `For lille: forventede ${a} havde ${i} ${n.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === n.format) return `Ugyldig streng: skal starte med "${n.prefix}"`;
                        if ("ends_with" === n.format) return `Ugyldig streng: skal ende med "${n.suffix}"`;
                        if ("includes" === n.format) return `Ugyldig streng: skal indeholde "${n.includes}"`;
                        if ("regex" === n.format) return `Ugyldig streng: skal matche m\xf8nsteret ${n.pattern}`;
                        return `Ugyldig ${i[n.format]??n.format}`;
                    case "not_multiple_of":
                        return `Ugyldigt tal: skal v\xe6re deleligt med ${n.divisor}`;
                    case "unrecognized_keys":
                        return `${n.keys.length>1?"Ukendte nøgler":"Ukendt nøgle"}: ${l(n.keys,", ")}`;
                    case "invalid_key":
                        return `Ugyldig n\xf8gle i ${n.origin}`;
                    case "invalid_union":
                        return "Ugyldigt input: matcher ingen af de tilladte typer";
                    case "invalid_element":
                        return `Ugyldig v\xe6rdi i ${n.origin}`;
                    default:
                        return "Ugyldigt input"
                }
            })
        }
    }, "de", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Ung\xfcltige Eingabe: erwartet ${i.expected}, erhalten ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"Zahl";case"object":if(Array.isArray(e))return"Array";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Ung\xfcltige Eingabe: erwartet ${O(i.values[0])}`;
                        return `Ung\xfcltige Option: erwartet eine von ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `Zu gro\xdf: erwartet, dass ${i.origin??"Wert"} ${t}${i.maximum.toString()} ${n.unit??"Elemente"} hat`;
                        return `Zu gro\xdf: erwartet, dass ${i.origin??"Wert"} ${t}${i.maximum.toString()} ist`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `Zu klein: erwartet, dass ${i.origin} ${t}${i.minimum.toString()} ${n.unit} hat`;
                        return `Zu klein: erwartet, dass ${i.origin} ${t}${i.minimum.toString()} ist`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Ung\xfcltiger String: muss mit "${i.prefix}" beginnen`;
                        if ("ends_with" === i.format) return `Ung\xfcltiger String: muss mit "${i.suffix}" enden`;
                        if ("includes" === i.format) return `Ung\xfcltiger String: muss "${i.includes}" enthalten`;
                        if ("regex" === i.format) return `Ung\xfcltiger String: muss dem Muster ${i.pattern} entsprechen`;
                        return `Ung\xfcltig: ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `Ung\xfcltige Zahl: muss ein Vielfaches von ${i.divisor} sein`;
                    case "unrecognized_keys":
                        return `${i.keys.length>1?"Unbekannte Schlüssel":"Unbekannter Schlüssel"}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Ung\xfcltiger Schl\xfcssel in ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Ungültige Eingabe";
                    case "invalid_element":
                        return `Ung\xfcltiger Wert in ${i.origin}`
                }
            })
        }
    }, "en", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
                }
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Invalid input: expected ${i.expected}, received ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"number";case"object":if(Array.isArray(e))return"array";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Invalid input: expected ${O(i.values[0])}`;
                        return `Invalid option: expected one of ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `Too big: expected ${i.origin??"value"} to have ${t}${i.maximum.toString()} ${n.unit??"elements"}`;
                        return `Too big: expected ${i.origin??"value"} to be ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `Too small: expected ${i.origin} to have ${t}${i.minimum.toString()} ${n.unit}`;
                        return `Too small: expected ${i.origin} to be ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Invalid string: must start with "${i.prefix}"`;
                        if ("ends_with" === i.format) return `Invalid string: must end with "${i.suffix}"`;
                        if ("includes" === i.format) return `Invalid string: must include "${i.includes}"`;
                        if ("regex" === i.format) return `Invalid string: must match pattern ${i.pattern}`;
                        return `Invalid ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `Invalid number: must be a multiple of ${i.divisor}`;
                    case "unrecognized_keys":
                        return `Unrecognized key${i.keys.length>1?"s":""}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Invalid key in ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Invalid input";
                    case "invalid_element":
                        return `Invalid value in ${i.origin}`
                }
            })
        }
    }, "eo", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Nevalida enigo: atendiĝis ${i.expected}, riceviĝis ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"nombro";case"object":if(Array.isArray(e))return"tabelo";if(null===e)return"senvalora";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Nevalida enigo: atendiĝis ${O(i.values[0])}`;
                        return `Nevalida opcio: atendiĝis unu el ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `Tro granda: atendiĝis ke ${i.origin??"valoro"} havu ${t}${i.maximum.toString()} ${n.unit??"elementojn"}`;
                        return `Tro granda: atendiĝis ke ${i.origin??"valoro"} havu ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `Tro malgranda: atendiĝis ke ${i.origin} havu ${t}${i.minimum.toString()} ${n.unit}`;
                        return `Tro malgranda: atendiĝis ke ${i.origin} estu ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Nevalida karaktraro: devas komenciĝi per "${i.prefix}"`;
                        if ("ends_with" === i.format) return `Nevalida karaktraro: devas finiĝi per "${i.suffix}"`;
                        if ("includes" === i.format) return `Nevalida karaktraro: devas inkluzivi "${i.includes}"`;
                        if ("regex" === i.format) return `Nevalida karaktraro: devas kongrui kun la modelo ${i.pattern}`;
                        return `Nevalida ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `Nevalida nombro: devas esti oblo de ${i.divisor}`;
                    case "unrecognized_keys":
                        return `Nekonata${i.keys.length>1?"j":""} ŝlosilo${i.keys.length>1?"j":""}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Nevalida ŝlosilo en ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Nevalida enigo";
                    case "invalid_element":
                        return `Nevalida valoro en ${i.origin}`
                }
            })
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
                    },
                    t = {
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

                function i(e) {
                    return t[e] ?? e
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
                };
                return t => {
                    switch (t.code) {
                        case "invalid_type":
                            return `Entrada inv\xe1lida: se esperaba ${i(t.expected)}, recibido ${i((e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"number";case"object":if(Array.isArray(e))return"array";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype)return e.constructor.name;return"object"}return t})(t.input))}`;
                        case "invalid_value":
                            if (1 === t.values.length) return `Entrada inv\xe1lida: se esperaba ${O(t.values[0])}`;
                            return `Opci\xf3n inv\xe1lida: se esperaba una de ${l(t.values,"|")}`;
                        case "too_big": {
                            let n = t.inclusive ? "<=" : "<",
                                r = e[t.origin] ?? null,
                                a = i(t.origin);
                            if (r) return `Demasiado grande: se esperaba que ${a??"valor"} tuviera ${n}${t.maximum.toString()} ${r.unit??"elementos"}`;
                            return `Demasiado grande: se esperaba que ${a??"valor"} fuera ${n}${t.maximum.toString()}`
                        }
                        case "too_small": {
                            let n = t.inclusive ? ">=" : ">",
                                r = e[t.origin] ?? null,
                                a = i(t.origin);
                            if (r) return `Demasiado peque\xf1o: se esperaba que ${a} tuviera ${n}${t.minimum.toString()} ${r.unit}`;
                            return `Demasiado peque\xf1o: se esperaba que ${a} fuera ${n}${t.minimum.toString()}`
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return `Cadena inv\xe1lida: debe comenzar con "${t.prefix}"`;
                            if ("ends_with" === t.format) return `Cadena inv\xe1lida: debe terminar en "${t.suffix}"`;
                            if ("includes" === t.format) return `Cadena inv\xe1lida: debe incluir "${t.includes}"`;
                            if ("regex" === t.format) return `Cadena inv\xe1lida: debe coincidir con el patr\xf3n ${t.pattern}`;
                            return `Inv\xe1lido ${n[t.format]??t.format}`;
                        case "not_multiple_of":
                            return `N\xfamero inv\xe1lido: debe ser m\xfaltiplo de ${t.divisor}`;
                        case "unrecognized_keys":
                            return `Llave${t.keys.length>1?"s":""} desconocida${t.keys.length>1?"s":""}: ${l(t.keys,", ")}`;
                        case "invalid_key":
                            return `Llave inv\xe1lida en ${i(t.origin)}`;
                        case "invalid_union":
                        default:
                            return "Entrada inválida";
                        case "invalid_element":
                            return `Valor inv\xe1lido en ${i(t.origin)}`
                    }
                }
            })()
        }
    }, "fa", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `ورودی نامعتبر: می‌بایست ${i.expected} می‌بود، ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"عدد";case"object":if(Array.isArray(e))return"آرایه";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)} دریافت شد`;
                    case "invalid_value":
                        if (1 === i.values.length) return `ورودی نامعتبر: می‌بایست ${O(i.values[0])} می‌بود`;
                        return `گزینه نامعتبر: می‌بایست یکی از ${l(i.values,"|")} می‌بود`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `خیلی بزرگ: ${i.origin??"مقدار"} باید ${t}${i.maximum.toString()} ${n.unit??"عنصر"} باشد`;
                        return `خیلی بزرگ: ${i.origin??"مقدار"} باید ${t}${i.maximum.toString()} باشد`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `خیلی کوچک: ${i.origin} باید ${t}${i.minimum.toString()} ${n.unit} باشد`;
                        return `خیلی کوچک: ${i.origin} باید ${t}${i.minimum.toString()} باشد`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `رشته نامعتبر: باید با "${i.prefix}" شروع شود`;
                        if ("ends_with" === i.format) return `رشته نامعتبر: باید با "${i.suffix}" تمام شود`;
                        if ("includes" === i.format) return `رشته نامعتبر: باید شامل "${i.includes}" باشد`;
                        if ("regex" === i.format) return `رشته نامعتبر: باید با الگوی ${i.pattern} مطابقت داشته باشد`;
                        return `${t[i.format]??i.format} نامعتبر`;
                    case "not_multiple_of":
                        return `عدد نامعتبر: باید مضرب ${i.divisor} باشد`;
                    case "unrecognized_keys":
                        return `کلید${i.keys.length>1?"های":""} ناشناس: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `کلید ناشناس در ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "ورودی نامعتبر";
                    case "invalid_element":
                        return `مقدار نامعتبر در ${i.origin}`
                }
            })
        }
    }, "fi", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Virheellinen tyyppi: odotettiin ${i.expected}, oli ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"number";case"object":if(Array.isArray(e))return"array";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Virheellinen sy\xf6te: t\xe4ytyy olla ${O(i.values[0])}`;
                        return `Virheellinen valinta: t\xe4ytyy olla yksi seuraavista: ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `Liian suuri: ${n.subject} t\xe4ytyy olla ${t}${i.maximum.toString()} ${n.unit}`.trim();
                        return `Liian suuri: arvon t\xe4ytyy olla ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `Liian pieni: ${n.subject} t\xe4ytyy olla ${t}${i.minimum.toString()} ${n.unit}`.trim();
                        return `Liian pieni: arvon t\xe4ytyy olla ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Virheellinen sy\xf6te: t\xe4ytyy alkaa "${i.prefix}"`;
                        if ("ends_with" === i.format) return `Virheellinen sy\xf6te: t\xe4ytyy loppua "${i.suffix}"`;
                        if ("includes" === i.format) return `Virheellinen sy\xf6te: t\xe4ytyy sis\xe4lt\xe4\xe4 "${i.includes}"`;
                        if ("regex" === i.format) return `Virheellinen sy\xf6te: t\xe4ytyy vastata s\xe4\xe4nn\xf6llist\xe4 lauseketta ${i.pattern}`;
                        return `Virheellinen ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `Virheellinen luku: t\xe4ytyy olla luvun ${i.divisor} monikerta`;
                    case "unrecognized_keys":
                        return `${i.keys.length>1?"Tuntemattomat avaimet":"Tuntematon avain"}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return "Virheellinen avain tietueessa";
                    case "invalid_union":
                        return "Virheellinen unioni";
                    case "invalid_element":
                        return "Virheellinen arvo joukossa";
                    default:
                        return "Virheellinen syöte"
                }
            })
        }
    }, "fr", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Entr\xe9e invalide : ${i.expected} attendu, ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"nombre";case"object":if(Array.isArray(e))return"tableau";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)} re\xe7u`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Entr\xe9e invalide : ${O(i.values[0])} attendu`;
                        return `Option invalide : une valeur parmi ${l(i.values,"|")} attendue`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `Trop grand : ${i.origin??"valeur"} doit ${n.verb} ${t}${i.maximum.toString()} ${n.unit??"élément(s)"}`;
                        return `Trop grand : ${i.origin??"valeur"} doit \xeatre ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `Trop petit : ${i.origin} doit ${n.verb} ${t}${i.minimum.toString()} ${n.unit}`;
                        return `Trop petit : ${i.origin} doit \xeatre ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Cha\xeene invalide : doit commencer par "${i.prefix}"`;
                        if ("ends_with" === i.format) return `Cha\xeene invalide : doit se terminer par "${i.suffix}"`;
                        if ("includes" === i.format) return `Cha\xeene invalide : doit inclure "${i.includes}"`;
                        if ("regex" === i.format) return `Cha\xeene invalide : doit correspondre au mod\xe8le ${i.pattern}`;
                        return `${t[i.format]??i.format} invalide`;
                    case "not_multiple_of":
                        return `Nombre invalide : doit \xeatre un multiple de ${i.divisor}`;
                    case "unrecognized_keys":
                        return `Cl\xe9${i.keys.length>1?"s":""} non reconnue${i.keys.length>1?"s":""} : ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Cl\xe9 invalide dans ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Entrée invalide";
                    case "invalid_element":
                        return `Valeur invalide dans ${i.origin}`
                }
            })
        }
    }, "frCA", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Entr\xe9e invalide : attendu ${i.expected}, re\xe7u ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"number";case"object":if(Array.isArray(e))return"array";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Entr\xe9e invalide : attendu ${O(i.values[0])}`;
                        return `Option invalide : attendu l'une des valeurs suivantes ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "≤" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `Trop grand : attendu que ${i.origin??"la valeur"} ait ${t}${i.maximum.toString()} ${n.unit}`;
                        return `Trop grand : attendu que ${i.origin??"la valeur"} soit ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? "≥" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `Trop petit : attendu que ${i.origin} ait ${t}${i.minimum.toString()} ${n.unit}`;
                        return `Trop petit : attendu que ${i.origin} soit ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Cha\xeene invalide : doit commencer par "${i.prefix}"`;
                        if ("ends_with" === i.format) return `Cha\xeene invalide : doit se terminer par "${i.suffix}"`;
                        if ("includes" === i.format) return `Cha\xeene invalide : doit inclure "${i.includes}"`;
                        if ("regex" === i.format) return `Cha\xeene invalide : doit correspondre au motif ${i.pattern}`;
                        return `${t[i.format]??i.format} invalide`;
                    case "not_multiple_of":
                        return `Nombre invalide : doit \xeatre un multiple de ${i.divisor}`;
                    case "unrecognized_keys":
                        return `Cl\xe9${i.keys.length>1?"s":""} non reconnue${i.keys.length>1?"s":""} : ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Cl\xe9 invalide dans ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Entrée invalide";
                    case "invalid_element":
                        return `Valeur invalide dans ${i.origin}`
                }
            })
        }
    }, "he", 0, function() {
        let e, t;
        return {
            localeError: (e = {
                string: {
                    unit: "אותיות",
                    verb: "לכלול"
                },
                file: {
                    unit: "בייטים",
                    verb: "לכלול"
                },
                array: {
                    unit: "פריטים",
                    verb: "לכלול"
                },
                set: {
                    unit: "פריטים",
                    verb: "לכלול"
                }
            }, t = {
                regex: "קלט",
                email: "כתובת אימייל",
                url: "כתובת רשת",
                emoji: "אימוג'י",
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
                datetime: "תאריך וזמן ISO",
                date: "תאריך ISO",
                time: "זמן ISO",
                duration: "משך זמן ISO",
                ipv4: "כתובת IPv4",
                ipv6: "כתובת IPv6",
                cidrv4: "טווח IPv4",
                cidrv6: "טווח IPv6",
                base64: "מחרוזת בבסיס 64",
                base64url: "מחרוזת בבסיס 64 לכתובות רשת",
                json_string: "מחרוזת JSON",
                e164: "מספר E.164",
                jwt: "JWT",
                template_literal: "קלט"
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `קלט לא תקין: צריך ${i.expected}, התקבל ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"number";case"object":if(Array.isArray(e))return"array";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `קלט לא תקין: צריך ${O(i.values[0])}`;
                        return `קלט לא תקין: צריך אחת מהאפשרויות  ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `גדול מדי: ${i.origin??"value"} צריך להיות ${t}${i.maximum.toString()} ${n.unit??"elements"}`;
                        return `גדול מדי: ${i.origin??"value"} צריך להיות ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `קטן מדי: ${i.origin} צריך להיות ${t}${i.minimum.toString()} ${n.unit}`;
                        return `קטן מדי: ${i.origin} צריך להיות ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `מחרוזת לא תקינה: חייבת להתחיל ב"${i.prefix}"`;
                        if ("ends_with" === i.format) return `מחרוזת לא תקינה: חייבת להסתיים ב "${i.suffix}"`;
                        if ("includes" === i.format) return `מחרוזת לא תקינה: חייבת לכלול "${i.includes}"`;
                        if ("regex" === i.format) return `מחרוזת לא תקינה: חייבת להתאים לתבנית ${i.pattern}`;
                        return `${t[i.format]??i.format} לא תקין`;
                    case "not_multiple_of":
                        return `מספר לא תקין: חייב להיות מכפלה של ${i.divisor}`;
                    case "unrecognized_keys":
                        return `מפתח${i.keys.length>1?"ות":""} לא מזוה${i.keys.length>1?"ים":"ה"}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `מפתח לא תקין ב${i.origin}`;
                    case "invalid_union":
                    default:
                        return "קלט לא תקין";
                    case "invalid_element":
                        return `ערך לא תקין ב${i.origin}`
                }
            })
        }
    }, "hu", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `\xc9rv\xe9nytelen bemenet: a v\xe1rt \xe9rt\xe9k ${i.expected}, a kapott \xe9rt\xe9k ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"szám";case"object":if(Array.isArray(e))return"tömb";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `\xc9rv\xe9nytelen bemenet: a v\xe1rt \xe9rt\xe9k ${O(i.values[0])}`;
                        return `\xc9rv\xe9nytelen opci\xf3: valamelyik \xe9rt\xe9k v\xe1rt ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `T\xfal nagy: ${i.origin??"érték"} m\xe9rete t\xfal nagy ${t}${i.maximum.toString()} ${n.unit??"elem"}`;
                        return `T\xfal nagy: a bemeneti \xe9rt\xe9k ${i.origin??"érték"} t\xfal nagy: ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `T\xfal kicsi: a bemeneti \xe9rt\xe9k ${i.origin} m\xe9rete t\xfal kicsi ${t}${i.minimum.toString()} ${n.unit}`;
                        return `T\xfal kicsi: a bemeneti \xe9rt\xe9k ${i.origin} t\xfal kicsi ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `\xc9rv\xe9nytelen string: "${i.prefix}" \xe9rt\xe9kkel kell kezdődnie`;
                        if ("ends_with" === i.format) return `\xc9rv\xe9nytelen string: "${i.suffix}" \xe9rt\xe9kkel kell v\xe9gződnie`;
                        if ("includes" === i.format) return `\xc9rv\xe9nytelen string: "${i.includes}" \xe9rt\xe9ket kell tartalmaznia`;
                        if ("regex" === i.format) return `\xc9rv\xe9nytelen string: ${i.pattern} mint\xe1nak kell megfelelnie`;
                        return `\xc9rv\xe9nytelen ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `\xc9rv\xe9nytelen sz\xe1m: ${i.divisor} t\xf6bbsz\xf6r\xf6s\xe9nek kell lennie`;
                    case "unrecognized_keys":
                        return `Ismeretlen kulcs${i.keys.length>1?"s":""}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `\xc9rv\xe9nytelen kulcs ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Érvénytelen bemenet";
                    case "invalid_element":
                        return `\xc9rv\xe9nytelen \xe9rt\xe9k: ${i.origin}`
                }
            })
        }
    }, "id", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Input tidak valid: diharapkan ${i.expected}, diterima ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"number";case"object":if(Array.isArray(e))return"array";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Input tidak valid: diharapkan ${O(i.values[0])}`;
                        return `Pilihan tidak valid: diharapkan salah satu dari ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `Terlalu besar: diharapkan ${i.origin??"value"} memiliki ${t}${i.maximum.toString()} ${n.unit??"elemen"}`;
                        return `Terlalu besar: diharapkan ${i.origin??"value"} menjadi ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `Terlalu kecil: diharapkan ${i.origin} memiliki ${t}${i.minimum.toString()} ${n.unit}`;
                        return `Terlalu kecil: diharapkan ${i.origin} menjadi ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `String tidak valid: harus dimulai dengan "${i.prefix}"`;
                        if ("ends_with" === i.format) return `String tidak valid: harus berakhir dengan "${i.suffix}"`;
                        if ("includes" === i.format) return `String tidak valid: harus menyertakan "${i.includes}"`;
                        if ("regex" === i.format) return `String tidak valid: harus sesuai pola ${i.pattern}`;
                        return `${t[i.format]??i.format} tidak valid`;
                    case "not_multiple_of":
                        return `Angka tidak valid: harus kelipatan dari ${i.divisor}`;
                    case "unrecognized_keys":
                        return `Kunci tidak dikenali ${i.keys.length>1?"s":""}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Kunci tidak valid di ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Input tidak valid";
                    case "invalid_element":
                        return `Nilai tidak valid di ${i.origin}`
                }
            })
        }
    }, "is", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Rangt gildi: \xde\xfa sl\xf3st inn ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"númer";case"object":if(Array.isArray(e))return"fylki";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)} \xfear sem \xe1 a\xf0 vera ${i.expected}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Rangt gildi: gert r\xe1\xf0 fyrir ${O(i.values[0])}`;
                        return `\xd3gilt val: m\xe1 vera eitt af eftirfarandi ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `Of st\xf3rt: gert er r\xe1\xf0 fyrir a\xf0 ${i.origin??"gildi"} hafi ${t}${i.maximum.toString()} ${n.unit??"hluti"}`;
                        return `Of st\xf3rt: gert er r\xe1\xf0 fyrir a\xf0 ${i.origin??"gildi"} s\xe9 ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `Of l\xedti\xf0: gert er r\xe1\xf0 fyrir a\xf0 ${i.origin} hafi ${t}${i.minimum.toString()} ${n.unit}`;
                        return `Of l\xedti\xf0: gert er r\xe1\xf0 fyrir a\xf0 ${i.origin} s\xe9 ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `\xd3gildur strengur: ver\xf0ur a\xf0 byrja \xe1 "${i.prefix}"`;
                        if ("ends_with" === i.format) return `\xd3gildur strengur: ver\xf0ur a\xf0 enda \xe1 "${i.suffix}"`;
                        if ("includes" === i.format) return `\xd3gildur strengur: ver\xf0ur a\xf0 innihalda "${i.includes}"`;
                        if ("regex" === i.format) return `\xd3gildur strengur: ver\xf0ur a\xf0 fylgja mynstri ${i.pattern}`;
                        return `Rangt ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `R\xf6ng tala: ver\xf0ur a\xf0 vera margfeldi af ${i.divisor}`;
                    case "unrecognized_keys":
                        return `\xd3\xfeekkt ${i.keys.length>1?"ir lyklar":"ur lykill"}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Rangur lykill \xed ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Rangt gildi";
                    case "invalid_element":
                        return `Rangt gildi \xed ${i.origin}`
                }
            })
        }
    }, "it", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Input non valido: atteso ${i.expected}, ricevuto ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"numero";case"object":if(Array.isArray(e))return"vettore";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Input non valido: atteso ${O(i.values[0])}`;
                        return `Opzione non valida: atteso uno tra ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `Troppo grande: ${i.origin??"valore"} deve avere ${t}${i.maximum.toString()} ${n.unit??"elementi"}`;
                        return `Troppo grande: ${i.origin??"valore"} deve essere ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `Troppo piccolo: ${i.origin} deve avere ${t}${i.minimum.toString()} ${n.unit}`;
                        return `Troppo piccolo: ${i.origin} deve essere ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Stringa non valida: deve iniziare con "${i.prefix}"`;
                        if ("ends_with" === i.format) return `Stringa non valida: deve terminare con "${i.suffix}"`;
                        if ("includes" === i.format) return `Stringa non valida: deve includere "${i.includes}"`;
                        if ("regex" === i.format) return `Stringa non valida: deve corrispondere al pattern ${i.pattern}`;
                        return `Invalid ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `Numero non valido: deve essere un multiplo di ${i.divisor}`;
                    case "unrecognized_keys":
                        return `Chiav${i.keys.length>1?"i":"e"} non riconosciut${i.keys.length>1?"e":"a"}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Chiave non valida in ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Input non valido";
                    case "invalid_element":
                        return `Valore non valido in ${i.origin}`
                }
            })
        }
    }, "ja", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `無効な入力: ${i.expected}が期待されましたが、${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"数値";case"object":if(Array.isArray(e))return"配列";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}が入力されました`;
                    case "invalid_value":
                        if (1 === i.values.length) return `無効な入力: ${O(i.values[0])}が期待されました`;
                        return `無効な選択: ${l(i.values,"、")}のいずれかである必要があります`;
                    case "too_big": {
                        let t = i.inclusive ? "以下である" : "より小さい",
                            n = e[i.origin] ?? null;
                        if (n) return `大きすぎる値: ${i.origin??"値"}は${i.maximum.toString()}${n.unit??"要素"}${t}必要があります`;
                        return `大きすぎる値: ${i.origin??"値"}は${i.maximum.toString()}${t}必要があります`
                    }
                    case "too_small": {
                        let t = i.inclusive ? "以上である" : "より大きい",
                            n = e[i.origin] ?? null;
                        if (n) return `小さすぎる値: ${i.origin}は${i.minimum.toString()}${n.unit}${t}必要があります`;
                        return `小さすぎる値: ${i.origin}は${i.minimum.toString()}${t}必要があります`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `無効な文字列: "${i.prefix}"で始まる必要があります`;
                        if ("ends_with" === i.format) return `無効な文字列: "${i.suffix}"で終わる必要があります`;
                        if ("includes" === i.format) return `無効な文字列: "${i.includes}"を含む必要があります`;
                        if ("regex" === i.format) return `無効な文字列: パターン${i.pattern}に一致する必要があります`;
                        return `無効な${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `無効な数値: ${i.divisor}の倍数である必要があります`;
                    case "unrecognized_keys":
                        return `認識されていないキー${i.keys.length>1?"群":""}: ${l(i.keys,"、")}`;
                    case "invalid_key":
                        return `${i.origin}内の無効なキー`;
                    case "invalid_union":
                    default:
                        return "無効な入力";
                    case "invalid_element":
                        return `${i.origin}内の無効な値`
                }
            })
        }
    }, "ka", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
                base64: "base64-კოდირებული სტრინგი",
                base64url: "base64url-კოდირებული სტრინგი",
                json_string: "JSON სტრინგი",
                e164: "E.164 ნომერი",
                jwt: "JWT",
                template_literal: "შეყვანა"
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `არასწორი შეყვანა: მოსალოდნელი ${i.expected}, მიღებული ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"რიცხვი";case"object":if(Array.isArray(e))return"მასივი";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return({string:"სტრინგი",boolean:"ბულეანი",undefined:"undefined",bigint:"bigint",symbol:"symbol",function:"ფუნქცია"})[t]??t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `არასწორი შეყვანა: მოსალოდნელი ${O(i.values[0])}`;
                        return `არასწორი ვარიანტი: მოსალოდნელია ერთ-ერთი ${l(i.values,"|")}-დან`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `ზედმეტად დიდი: მოსალოდნელი ${i.origin??"მნიშვნელობა"} ${n.verb} ${t}${i.maximum.toString()} ${n.unit}`;
                        return `ზედმეტად დიდი: მოსალოდნელი ${i.origin??"მნიშვნელობა"} იყოს ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `ზედმეტად პატარა: მოსალოდნელი ${i.origin} ${n.verb} ${t}${i.minimum.toString()} ${n.unit}`;
                        return `ზედმეტად პატარა: მოსალოდნელი ${i.origin} იყოს ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `არასწორი სტრინგი: უნდა იწყებოდეს "${i.prefix}"-ით`;
                        if ("ends_with" === i.format) return `არასწორი სტრინგი: უნდა მთავრდებოდეს "${i.suffix}"-ით`;
                        if ("includes" === i.format) return `არასწორი სტრინგი: უნდა შეიცავდეს "${i.includes}"-ს`;
                        if ("regex" === i.format) return `არასწორი სტრინგი: უნდა შეესაბამებოდეს შაბლონს ${i.pattern}`;
                        return `არასწორი ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `არასწორი რიცხვი: უნდა იყოს ${i.divisor}-ის ჯერადი`;
                    case "unrecognized_keys":
                        return `უცნობი გასაღებ${i.keys.length>1?"ები":"ი"}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `არასწორი გასაღები ${i.origin}-ში`;
                    case "invalid_union":
                    default:
                        return "არასწორი შეყვანა";
                    case "invalid_element":
                        return `არასწორი მნიშვნელობა ${i.origin}-ში`
                }
            })
        }
    }, "kh", 0, function() {
        return i8()
    }, "km", 0, i8, "ko", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `잘못된 입력: 예상 타입은 ${i.expected}, 받은 타입은 ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"number";case"object":if(Array.isArray(e))return"array";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}입니다`;
                    case "invalid_value":
                        if (1 === i.values.length) return `잘못된 입력: 값은 ${O(i.values[0])} 이어야 합니다`;
                        return `잘못된 옵션: ${l(i.values,"또는 ")} 중 하나여야 합니다`;
                    case "too_big": {
                        let t = i.inclusive ? "이하" : "미만",
                            n = "미만" === t ? "이어야 합니다" : "여야 합니다",
                            r = e[i.origin] ?? null,
                            a = r?.unit ?? "요소";
                        if (r) return `${i.origin??"값"}이 너무 큽니다: ${i.maximum.toString()}${a} ${t}${n}`;
                        return `${i.origin??"값"}이 너무 큽니다: ${i.maximum.toString()} ${t}${n}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? "이상" : "초과",
                            n = "이상" === t ? "이어야 합니다" : "여야 합니다",
                            r = e[i.origin] ?? null,
                            a = r?.unit ?? "요소";
                        if (r) return `${i.origin??"값"}이 너무 작습니다: ${i.minimum.toString()}${a} ${t}${n}`;
                        return `${i.origin??"값"}이 너무 작습니다: ${i.minimum.toString()} ${t}${n}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `잘못된 문자열: "${i.prefix}"(으)로 시작해야 합니다`;
                        if ("ends_with" === i.format) return `잘못된 문자열: "${i.suffix}"(으)로 끝나야 합니다`;
                        if ("includes" === i.format) return `잘못된 문자열: "${i.includes}"을(를) 포함해야 합니다`;
                        if ("regex" === i.format) return `잘못된 문자열: 정규식 ${i.pattern} 패턴과 일치해야 합니다`;
                        return `잘못된 ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `잘못된 숫자: ${i.divisor}의 배수여야 합니다`;
                    case "unrecognized_keys":
                        return `인식할 수 없는 키: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `잘못된 키: ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "잘못된 입력";
                    case "invalid_element":
                        return `잘못된 값: ${i.origin}`
                }
            })
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

                function t(t, i, n, r) {
                    let a = e[t] ?? null;
                    return null === a ? a : {
                        unit: a.unit[i],
                        verb: a.verb[r][n ? "inclusive" : "notInclusive"]
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
                    cidrv4: "IPv4 tinklo prefiksas (CIDR)",
                    cidrv6: "IPv6 tinklo prefiksas (CIDR)",
                    base64: "base64 užkoduota eilutė",
                    base64url: "base64url užkoduota eilutė",
                    json_string: "JSON eilutė",
                    e164: "E.164 numeris",
                    jwt: "JWT",
                    template_literal: "įvestis"
                };
                return e => {
                    switch (e.code) {
                        case "invalid_type":
                            var n;
                            return `Gautas tipas ${ne(typeof(n=e.input),n)}, o tikėtasi - ${ne(e.expected)}`;
                        case "invalid_value":
                            if (1 === e.values.length) return `Privalo būti ${O(e.values[0])}`;
                            return `Privalo būti vienas iš ${l(e.values,"|")} pasirinkimų`;
                        case "too_big": {
                            let i = ne(e.origin),
                                n = t(e.origin, ni(Number(e.maximum)), e.inclusive ?? !1, "smaller");
                            if (n?.verb) return `${nt(i??e.origin??"reikšmė")} ${n.verb} ${e.maximum.toString()} ${n.unit??"elementų"}`;
                            let r = e.inclusive ? "ne didesnis kaip" : "mažesnis kaip";
                            return `${nt(i??e.origin??"reikšmė")} turi būti ${r} ${e.maximum.toString()} ${n?.unit}`
                        }
                        case "too_small": {
                            let i = ne(e.origin),
                                n = t(e.origin, ni(Number(e.minimum)), e.inclusive ?? !1, "bigger");
                            if (n?.verb) return `${nt(i??e.origin??"reikšmė")} ${n.verb} ${e.minimum.toString()} ${n.unit??"elementų"}`;
                            let r = e.inclusive ? "ne mažesnis kaip" : "didesnis kaip";
                            return `${nt(i??e.origin??"reikšmė")} turi būti ${r} ${e.minimum.toString()} ${n?.unit}`
                        }
                        case "invalid_format":
                            if ("starts_with" === e.format) return `Eilutė privalo prasidėti "${e.prefix}"`;
                            if ("ends_with" === e.format) return `Eilutė privalo pasibaigti "${e.suffix}"`;
                            if ("includes" === e.format) return `Eilutė privalo įtraukti "${e.includes}"`;
                            if ("regex" === e.format) return `Eilutė privalo atitikti ${e.pattern}`;
                            return `Neteisingas ${i[e.format]??e.format}`;
                        case "not_multiple_of":
                            return `Skaičius privalo būti ${e.divisor} kartotinis.`;
                        case "unrecognized_keys":
                            return `Neatpažint${e.keys.length>1?"i":"as"} rakt${e.keys.length>1?"ai":"as"}: ${l(e.keys,", ")}`;
                        case "invalid_key":
                            return "Rastas klaidingas raktas";
                        case "invalid_union":
                        default:
                            return "Klaidinga įvestis";
                        case "invalid_element": {
                            let t = ne(e.origin);
                            return `${nt(t??e.origin??"reikšmė")} turi klaidingą įvestį`
                        }
                    }
                }
            })()
        }
    }, "mk", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Грешен внес: се очекува ${i.expected}, примено ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"број";case"object":if(Array.isArray(e))return"низа";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Invalid input: expected ${O(i.values[0])}`;
                        return `Грешана опција: се очекува една ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `Премногу голем: се очекува ${i.origin??"вредноста"} да има ${t}${i.maximum.toString()} ${n.unit??"елементи"}`;
                        return `Премногу голем: се очекува ${i.origin??"вредноста"} да биде ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `Премногу мал: се очекува ${i.origin} да има ${t}${i.minimum.toString()} ${n.unit}`;
                        return `Премногу мал: се очекува ${i.origin} да биде ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Неважечка низа: мора да започнува со "${i.prefix}"`;
                        if ("ends_with" === i.format) return `Неважечка низа: мора да завршува со "${i.suffix}"`;
                        if ("includes" === i.format) return `Неважечка низа: мора да вклучува "${i.includes}"`;
                        if ("regex" === i.format) return `Неважечка низа: мора да одгоара на патернот ${i.pattern}`;
                        return `Invalid ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `Грешен број: мора да биде делив со ${i.divisor}`;
                    case "unrecognized_keys":
                        return `${i.keys.length>1?"Непрепознаени клучеви":"Непрепознаен клуч"}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Грешен клуч во ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Грешен внес";
                    case "invalid_element":
                        return `Грешна вредност во ${i.origin}`
                }
            })
        }
    }, "ms", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Input tidak sah: dijangka ${i.expected}, diterima ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"nombor";case"object":if(Array.isArray(e))return"array";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Input tidak sah: dijangka ${O(i.values[0])}`;
                        return `Pilihan tidak sah: dijangka salah satu daripada ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `Terlalu besar: dijangka ${i.origin??"nilai"} ${n.verb} ${t}${i.maximum.toString()} ${n.unit??"elemen"}`;
                        return `Terlalu besar: dijangka ${i.origin??"nilai"} adalah ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `Terlalu kecil: dijangka ${i.origin} ${n.verb} ${t}${i.minimum.toString()} ${n.unit}`;
                        return `Terlalu kecil: dijangka ${i.origin} adalah ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `String tidak sah: mesti bermula dengan "${i.prefix}"`;
                        if ("ends_with" === i.format) return `String tidak sah: mesti berakhir dengan "${i.suffix}"`;
                        if ("includes" === i.format) return `String tidak sah: mesti mengandungi "${i.includes}"`;
                        if ("regex" === i.format) return `String tidak sah: mesti sepadan dengan corak ${i.pattern}`;
                        return `${t[i.format]??i.format} tidak sah`;
                    case "not_multiple_of":
                        return `Nombor tidak sah: perlu gandaan ${i.divisor}`;
                    case "unrecognized_keys":
                        return `Kunci tidak dikenali: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Kunci tidak sah dalam ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Input tidak sah";
                    case "invalid_element":
                        return `Nilai tidak sah dalam ${i.origin}`
                }
            })
        }
    }, "nl", 0, function() {
        let e, t;
        return {
            localeError: (e = {
                string: {
                    unit: "tekens"
                },
                file: {
                    unit: "bytes"
                },
                array: {
                    unit: "elementen"
                },
                set: {
                    unit: "elementen"
                }
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Ongeldige invoer: verwacht ${i.expected}, ontving ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"getal";case"object":if(Array.isArray(e))return"array";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Ongeldige invoer: verwacht ${O(i.values[0])}`;
                        return `Ongeldige optie: verwacht \xe9\xe9n van ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `Te lang: verwacht dat ${i.origin??"waarde"} ${t}${i.maximum.toString()} ${n.unit??"elementen"} bevat`;
                        return `Te lang: verwacht dat ${i.origin??"waarde"} ${t}${i.maximum.toString()} is`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `Te kort: verwacht dat ${i.origin} ${t}${i.minimum.toString()} ${n.unit} bevat`;
                        return `Te kort: verwacht dat ${i.origin} ${t}${i.minimum.toString()} is`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Ongeldige tekst: moet met "${i.prefix}" beginnen`;
                        if ("ends_with" === i.format) return `Ongeldige tekst: moet op "${i.suffix}" eindigen`;
                        if ("includes" === i.format) return `Ongeldige tekst: moet "${i.includes}" bevatten`;
                        if ("regex" === i.format) return `Ongeldige tekst: moet overeenkomen met patroon ${i.pattern}`;
                        return `Ongeldig: ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `Ongeldig getal: moet een veelvoud van ${i.divisor} zijn`;
                    case "unrecognized_keys":
                        return `Onbekende key${i.keys.length>1?"s":""}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Ongeldige key in ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Ongeldige invoer";
                    case "invalid_element":
                        return `Ongeldige waarde in ${i.origin}`
                }
            })
        }
    }, "no", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Ugyldig input: forventet ${i.expected}, fikk ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"tall";case"object":if(Array.isArray(e))return"liste";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Ugyldig verdi: forventet ${O(i.values[0])}`;
                        return `Ugyldig valg: forventet en av ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `For stor(t): forventet ${i.origin??"value"} til \xe5 ha ${t}${i.maximum.toString()} ${n.unit??"elementer"}`;
                        return `For stor(t): forventet ${i.origin??"value"} til \xe5 ha ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `For lite(n): forventet ${i.origin} til \xe5 ha ${t}${i.minimum.toString()} ${n.unit}`;
                        return `For lite(n): forventet ${i.origin} til \xe5 ha ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Ugyldig streng: m\xe5 starte med "${i.prefix}"`;
                        if ("ends_with" === i.format) return `Ugyldig streng: m\xe5 ende med "${i.suffix}"`;
                        if ("includes" === i.format) return `Ugyldig streng: m\xe5 inneholde "${i.includes}"`;
                        if ("regex" === i.format) return `Ugyldig streng: m\xe5 matche m\xf8nsteret ${i.pattern}`;
                        return `Ugyldig ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `Ugyldig tall: m\xe5 v\xe6re et multiplum av ${i.divisor}`;
                    case "unrecognized_keys":
                        return `${i.keys.length>1?"Ukjente nøkler":"Ukjent nøkkel"}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Ugyldig n\xf8kkel i ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Ugyldig input";
                    case "invalid_element":
                        return `Ugyldig verdi i ${i.origin}`
                }
            })
        }
    }, "ota", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `F\xe2sit giren: umulan ${i.expected}, alınan ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"numara";case"object":if(Array.isArray(e))return"saf";if(null===e)return"gayb";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `F\xe2sit giren: umulan ${O(i.values[0])}`;
                        return `F\xe2sit tercih: m\xfbteberler ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `Fazla b\xfcy\xfck: ${i.origin??"value"}, ${t}${i.maximum.toString()} ${n.unit??"elements"} sahip olmalıydı.`;
                        return `Fazla b\xfcy\xfck: ${i.origin??"value"}, ${t}${i.maximum.toString()} olmalıydı.`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `Fazla k\xfc\xe7\xfck: ${i.origin}, ${t}${i.minimum.toString()} ${n.unit} sahip olmalıydı.`;
                        return `Fazla k\xfc\xe7\xfck: ${i.origin}, ${t}${i.minimum.toString()} olmalıydı.`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `F\xe2sit metin: "${i.prefix}" ile başlamalı.`;
                        if ("ends_with" === i.format) return `F\xe2sit metin: "${i.suffix}" ile bitmeli.`;
                        if ("includes" === i.format) return `F\xe2sit metin: "${i.includes}" ihtiv\xe2 etmeli.`;
                        if ("regex" === i.format) return `F\xe2sit metin: ${i.pattern} nakşına uymalı.`;
                        return `F\xe2sit ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `F\xe2sit sayı: ${i.divisor} katı olmalıydı.`;
                    case "unrecognized_keys":
                        return `Tanınmayan anahtar ${i.keys.length>1?"s":""}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `${i.origin} i\xe7in tanınmayan anahtar var.`;
                    case "invalid_union":
                        return "Giren tanınamadı.";
                    case "invalid_element":
                        return `${i.origin} i\xe7in tanınmayan kıymet var.`;
                    default:
                        return "Kıymet tanınamadı."
                }
            })
        }
    }, "pl", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Nieprawidłowe dane wejściowe: oczekiwano ${i.expected}, otrzymano ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"liczba";case"object":if(Array.isArray(e))return"tablica";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Nieprawidłowe dane wejściowe: oczekiwano ${O(i.values[0])}`;
                        return `Nieprawidłowa opcja: oczekiwano jednej z wartości ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `Za duża wartość: oczekiwano, że ${i.origin??"wartość"} będzie mieć ${t}${i.maximum.toString()} ${n.unit??"elementów"}`;
                        return `Zbyt duż(y/a/e): oczekiwano, że ${i.origin??"wartość"} będzie wynosić ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `Za mała wartość: oczekiwano, że ${i.origin??"wartość"} będzie mieć ${t}${i.minimum.toString()} ${n.unit??"elementów"}`;
                        return `Zbyt mał(y/a/e): oczekiwano, że ${i.origin??"wartość"} będzie wynosić ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Nieprawidłowy ciąg znak\xf3w: musi zaczynać się od "${i.prefix}"`;
                        if ("ends_with" === i.format) return `Nieprawidłowy ciąg znak\xf3w: musi kończyć się na "${i.suffix}"`;
                        if ("includes" === i.format) return `Nieprawidłowy ciąg znak\xf3w: musi zawierać "${i.includes}"`;
                        if ("regex" === i.format) return `Nieprawidłowy ciąg znak\xf3w: musi odpowiadać wzorcowi ${i.pattern}`;
                        return `Nieprawidłow(y/a/e) ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `Nieprawidłowa liczba: musi być wielokrotnością ${i.divisor}`;
                    case "unrecognized_keys":
                        return `Nierozpoznane klucze${i.keys.length>1?"s":""}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Nieprawidłowy klucz w ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Nieprawidłowe dane wejściowe";
                    case "invalid_element":
                        return `Nieprawidłowa wartość w ${i.origin}`
                }
            })
        }
    }, "ps", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `ناسم ورودي: باید ${i.expected} وای, مګر ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"عدد";case"object":if(Array.isArray(e))return"ارې";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)} ترلاسه شو`;
                    case "invalid_value":
                        if (1 === i.values.length) return `ناسم ورودي: باید ${O(i.values[0])} وای`;
                        return `ناسم انتخاب: باید یو له ${l(i.values,"|")} څخه وای`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `ډیر لوی: ${i.origin??"ارزښت"} باید ${t}${i.maximum.toString()} ${n.unit??"عنصرونه"} ولري`;
                        return `ډیر لوی: ${i.origin??"ارزښت"} باید ${t}${i.maximum.toString()} وي`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `ډیر کوچنی: ${i.origin} باید ${t}${i.minimum.toString()} ${n.unit} ولري`;
                        return `ډیر کوچنی: ${i.origin} باید ${t}${i.minimum.toString()} وي`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `ناسم متن: باید د "${i.prefix}" سره پیل شي`;
                        if ("ends_with" === i.format) return `ناسم متن: باید د "${i.suffix}" سره پای ته ورسيږي`;
                        if ("includes" === i.format) return `ناسم متن: باید "${i.includes}" ولري`;
                        if ("regex" === i.format) return `ناسم متن: باید د ${i.pattern} سره مطابقت ولري`;
                        return `${t[i.format]??i.format} ناسم دی`;
                    case "not_multiple_of":
                        return `ناسم عدد: باید د ${i.divisor} مضرب وي`;
                    case "unrecognized_keys":
                        return `ناسم ${i.keys.length>1?"کلیډونه":"کلیډ"}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `ناسم کلیډ په ${i.origin} کې`;
                    case "invalid_union":
                    default:
                        return "ناسمه ورودي";
                    case "invalid_element":
                        return `ناسم عنصر په ${i.origin} کې`
                }
            })
        }
    }, "pt", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Tipo inv\xe1lido: esperado ${i.expected}, recebido ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"número";case"object":if(Array.isArray(e))return"array";if(null===e)return"nulo";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Entrada inv\xe1lida: esperado ${O(i.values[0])}`;
                        return `Op\xe7\xe3o inv\xe1lida: esperada uma das ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `Muito grande: esperado que ${i.origin??"valor"} tivesse ${t}${i.maximum.toString()} ${n.unit??"elementos"}`;
                        return `Muito grande: esperado que ${i.origin??"valor"} fosse ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `Muito pequeno: esperado que ${i.origin} tivesse ${t}${i.minimum.toString()} ${n.unit}`;
                        return `Muito pequeno: esperado que ${i.origin} fosse ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Texto inv\xe1lido: deve come\xe7ar com "${i.prefix}"`;
                        if ("ends_with" === i.format) return `Texto inv\xe1lido: deve terminar com "${i.suffix}"`;
                        if ("includes" === i.format) return `Texto inv\xe1lido: deve incluir "${i.includes}"`;
                        if ("regex" === i.format) return `Texto inv\xe1lido: deve corresponder ao padr\xe3o ${i.pattern}`;
                        return `${t[i.format]??i.format} inv\xe1lido`;
                    case "not_multiple_of":
                        return `N\xfamero inv\xe1lido: deve ser m\xfaltiplo de ${i.divisor}`;
                    case "unrecognized_keys":
                        return `Chave${i.keys.length>1?"s":""} desconhecida${i.keys.length>1?"s":""}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Chave inv\xe1lida em ${i.origin}`;
                    case "invalid_union":
                        return "Entrada inválida";
                    case "invalid_element":
                        return `Valor inv\xe1lido em ${i.origin}`;
                    default:
                        return "Campo inválido"
                }
            })
        }
    }, "ru", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Неверный ввод: ожидалось ${i.expected}, получено ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"число";case"object":if(Array.isArray(e))return"массив";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Неверный ввод: ожидалось ${O(i.values[0])}`;
                        return `Неверный вариант: ожидалось одно из ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) {
                            let e = nn(Number(i.maximum), n.unit.one, n.unit.few, n.unit.many);
                            return `Слишком большое значение: ожидалось, что ${i.origin??"значение"} будет иметь ${t}${i.maximum.toString()} ${e}`
                        }
                        return `Слишком большое значение: ожидалось, что ${i.origin??"значение"} будет ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) {
                            let e = nn(Number(i.minimum), n.unit.one, n.unit.few, n.unit.many);
                            return `Слишком маленькое значение: ожидалось, что ${i.origin} будет иметь ${t}${i.minimum.toString()} ${e}`
                        }
                        return `Слишком маленькое значение: ожидалось, что ${i.origin} будет ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Неверная строка: должна начинаться с "${i.prefix}"`;
                        if ("ends_with" === i.format) return `Неверная строка: должна заканчиваться на "${i.suffix}"`;
                        if ("includes" === i.format) return `Неверная строка: должна содержать "${i.includes}"`;
                        if ("regex" === i.format) return `Неверная строка: должна соответствовать шаблону ${i.pattern}`;
                        return `Неверный ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `Неверное число: должно быть кратным ${i.divisor}`;
                    case "unrecognized_keys":
                        return `Нераспознанн${i.keys.length>1?"ые":"ый"} ключ${i.keys.length>1?"и":""}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Неверный ключ в ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Неверные входные данные";
                    case "invalid_element":
                        return `Неверное значение в ${i.origin}`
                }
            })
        }
    }, "sl", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Neveljaven vnos: pričakovano ${i.expected}, prejeto ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"število";case"object":if(Array.isArray(e))return"tabela";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Neveljaven vnos: pričakovano ${O(i.values[0])}`;
                        return `Neveljavna možnost: pričakovano eno izmed ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `Preveliko: pričakovano, da bo ${i.origin??"vrednost"} imelo ${t}${i.maximum.toString()} ${n.unit??"elementov"}`;
                        return `Preveliko: pričakovano, da bo ${i.origin??"vrednost"} ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `Premajhno: pričakovano, da bo ${i.origin} imelo ${t}${i.minimum.toString()} ${n.unit}`;
                        return `Premajhno: pričakovano, da bo ${i.origin} ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Neveljaven niz: mora se začeti z "${i.prefix}"`;
                        if ("ends_with" === i.format) return `Neveljaven niz: mora se končati z "${i.suffix}"`;
                        if ("includes" === i.format) return `Neveljaven niz: mora vsebovati "${i.includes}"`;
                        if ("regex" === i.format) return `Neveljaven niz: mora ustrezati vzorcu ${i.pattern}`;
                        return `Neveljaven ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `Neveljavno število: mora biti večkratnik ${i.divisor}`;
                    case "unrecognized_keys":
                        return `Neprepoznan${i.keys.length>1?"i ključi":" ključ"}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Neveljaven ključ v ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Neveljaven vnos";
                    case "invalid_element":
                        return `Neveljavna vrednost v ${i.origin}`
                }
            })
        }
    }, "sv", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Ogiltig inmatning: f\xf6rv\xe4ntat ${i.expected}, fick ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"antal";case"object":if(Array.isArray(e))return"lista";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Ogiltig inmatning: f\xf6rv\xe4ntat ${O(i.values[0])}`;
                        return `Ogiltigt val: f\xf6rv\xe4ntade en av ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `F\xf6r stor(t): f\xf6rv\xe4ntade ${i.origin??"värdet"} att ha ${t}${i.maximum.toString()} ${n.unit??"element"}`;
                        return `F\xf6r stor(t): f\xf6rv\xe4ntat ${i.origin??"värdet"} att ha ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `F\xf6r lite(t): f\xf6rv\xe4ntade ${i.origin??"värdet"} att ha ${t}${i.minimum.toString()} ${n.unit}`;
                        return `F\xf6r lite(t): f\xf6rv\xe4ntade ${i.origin??"värdet"} att ha ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Ogiltig str\xe4ng: m\xe5ste b\xf6rja med "${i.prefix}"`;
                        if ("ends_with" === i.format) return `Ogiltig str\xe4ng: m\xe5ste sluta med "${i.suffix}"`;
                        if ("includes" === i.format) return `Ogiltig str\xe4ng: m\xe5ste inneh\xe5lla "${i.includes}"`;
                        if ("regex" === i.format) return `Ogiltig str\xe4ng: m\xe5ste matcha m\xf6nstret "${i.pattern}"`;
                        return `Ogiltig(t) ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `Ogiltigt tal: m\xe5ste vara en multipel av ${i.divisor}`;
                    case "unrecognized_keys":
                        return `${i.keys.length>1?"Okända nycklar":"Okänd nyckel"}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Ogiltig nyckel i ${i.origin??"värdet"}`;
                    case "invalid_union":
                    default:
                        return "Ogiltig input";
                    case "invalid_element":
                        return `Ogiltigt v\xe4rde i ${i.origin??"värdet"}`
                }
            })
        }
    }, "ta", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `தவறான உள்ளீடு: எதிர்பார்க்கப்பட்டது ${i.expected}, பெறப்பட்டது ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"எண் அல்லாதது":"எண்";case"object":if(Array.isArray(e))return"அணி";if(null===e)return"வெறுமை";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `தவறான உள்ளீடு: எதிர்பார்க்கப்பட்டது ${O(i.values[0])}`;
                        return `தவறான விருப்பம்: எதிர்பார்க்கப்பட்டது ${l(i.values,"|")} இல் ஒன்று`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `மிக பெரியது: எதிர்பார்க்கப்பட்டது ${i.origin??"மதிப்பு"} ${t}${i.maximum.toString()} ${n.unit??"உறுப்புகள்"} ஆக இருக்க வேண்டும்`;
                        return `மிக பெரியது: எதிர்பார்க்கப்பட்டது ${i.origin??"மதிப்பு"} ${t}${i.maximum.toString()} ஆக இருக்க வேண்டும்`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `மிகச் சிறியது: எதிர்பார்க்கப்பட்டது ${i.origin} ${t}${i.minimum.toString()} ${n.unit} ஆக இருக்க வேண்டும்`;
                        return `மிகச் சிறியது: எதிர்பார்க்கப்பட்டது ${i.origin} ${t}${i.minimum.toString()} ஆக இருக்க வேண்டும்`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `தவறான சரம்: "${i.prefix}" இல் தொடங்க வேண்டும்`;
                        if ("ends_with" === i.format) return `தவறான சரம்: "${i.suffix}" இல் முடிவடைய வேண்டும்`;
                        if ("includes" === i.format) return `தவறான சரம்: "${i.includes}" ஐ உள்ளடக்க வேண்டும்`;
                        if ("regex" === i.format) return `தவறான சரம்: ${i.pattern} முறைபாட்டுடன் பொருந்த வேண்டும்`;
                        return `தவறான ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `தவறான எண்: ${i.divisor} இன் பலமாக இருக்க வேண்டும்`;
                    case "unrecognized_keys":
                        return `அடையாளம் தெரியாத விசை${i.keys.length>1?"கள்":""}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `${i.origin} இல் தவறான விசை`;
                    case "invalid_union":
                    default:
                        return "தவறான உள்ளீடு";
                    case "invalid_element":
                        return `${i.origin} இல் தவறான மதிப்பு`
                }
            })
        }
    }, "th", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `ประเภทข้อมูลไม่ถูกต้อง: ควรเป็น ${i.expected} แต่ได้รับ ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"ไม่ใช่ตัวเลข (NaN)":"ตัวเลข";case"object":if(Array.isArray(e))return"อาร์เรย์ (Array)";if(null===e)return"ไม่มีค่า (null)";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `ค่าไม่ถูกต้อง: ควรเป็น ${O(i.values[0])}`;
                        return `ตัวเลือกไม่ถูกต้อง: ควรเป็นหนึ่งใน ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "ไม่เกิน" : "น้อยกว่า",
                            n = e[i.origin] ?? null;
                        if (n) return `เกินกำหนด: ${i.origin??"ค่า"} ควรมี${t} ${i.maximum.toString()} ${n.unit??"รายการ"}`;
                        return `เกินกำหนด: ${i.origin??"ค่า"} ควรมี${t} ${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? "อย่างน้อย" : "มากกว่า",
                            n = e[i.origin] ?? null;
                        if (n) return `น้อยกว่ากำหนด: ${i.origin} ควรมี${t} ${i.minimum.toString()} ${n.unit}`;
                        return `น้อยกว่ากำหนด: ${i.origin} ควรมี${t} ${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `รูปแบบไม่ถูกต้อง: ข้อความต้องขึ้นต้นด้วย "${i.prefix}"`;
                        if ("ends_with" === i.format) return `รูปแบบไม่ถูกต้อง: ข้อความต้องลงท้ายด้วย "${i.suffix}"`;
                        if ("includes" === i.format) return `รูปแบบไม่ถูกต้อง: ข้อความต้องมี "${i.includes}" อยู่ในข้อความ`;
                        if ("regex" === i.format) return `รูปแบบไม่ถูกต้อง: ต้องตรงกับรูปแบบที่กำหนด ${i.pattern}`;
                        return `รูปแบบไม่ถูกต้อง: ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `ตัวเลขไม่ถูกต้อง: ต้องเป็นจำนวนที่หารด้วย ${i.divisor} ได้ลงตัว`;
                    case "unrecognized_keys":
                        return `พบคีย์ที่ไม่รู้จัก: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `คีย์ไม่ถูกต้องใน ${i.origin}`;
                    case "invalid_union":
                        return "ข้อมูลไม่ถูกต้อง: ไม่ตรงกับรูปแบบยูเนียนที่กำหนดไว้";
                    case "invalid_element":
                        return `ข้อมูลไม่ถูกต้องใน ${i.origin}`;
                    default:
                        return "ข้อมูลไม่ถูกต้อง"
                }
            })
        }
    }, "tr", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Ge\xe7ersiz değer: beklenen ${i.expected}, alınan ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"number";case"object":if(Array.isArray(e))return"array";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Ge\xe7ersiz değer: beklenen ${O(i.values[0])}`;
                        return `Ge\xe7ersiz se\xe7enek: aşağıdakilerden biri olmalı: ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `\xc7ok b\xfcy\xfck: beklenen ${i.origin??"değer"} ${t}${i.maximum.toString()} ${n.unit??"öğe"}`;
                        return `\xc7ok b\xfcy\xfck: beklenen ${i.origin??"değer"} ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `\xc7ok k\xfc\xe7\xfck: beklenen ${i.origin} ${t}${i.minimum.toString()} ${n.unit}`;
                        return `\xc7ok k\xfc\xe7\xfck: beklenen ${i.origin} ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Ge\xe7ersiz metin: "${i.prefix}" ile başlamalı`;
                        if ("ends_with" === i.format) return `Ge\xe7ersiz metin: "${i.suffix}" ile bitmeli`;
                        if ("includes" === i.format) return `Ge\xe7ersiz metin: "${i.includes}" i\xe7ermeli`;
                        if ("regex" === i.format) return `Ge\xe7ersiz metin: ${i.pattern} desenine uymalı`;
                        return `Ge\xe7ersiz ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `Ge\xe7ersiz sayı: ${i.divisor} ile tam b\xf6l\xfcnebilmeli`;
                    case "unrecognized_keys":
                        return `Tanınmayan anahtar${i.keys.length>1?"lar":""}: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `${i.origin} i\xe7inde ge\xe7ersiz anahtar`;
                    case "invalid_union":
                    default:
                        return "Geçersiz değer";
                    case "invalid_element":
                        return `${i.origin} i\xe7inde ge\xe7ersiz değer`
                }
            })
        }
    }, "ua", 0, function() {
        return nr()
    }, "uk", 0, nr, "ur", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `غلط ان پٹ: ${i.expected} متوقع تھا، ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"نمبر";case"object":if(Array.isArray(e))return"آرے";if(null===e)return"نل";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)} موصول ہوا`;
                    case "invalid_value":
                        if (1 === i.values.length) return `غلط ان پٹ: ${O(i.values[0])} متوقع تھا`;
                        return `غلط آپشن: ${l(i.values,"|")} میں سے ایک متوقع تھا`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `بہت بڑا: ${i.origin??"ویلیو"} کے ${t}${i.maximum.toString()} ${n.unit??"عناصر"} ہونے متوقع تھے`;
                        return `بہت بڑا: ${i.origin??"ویلیو"} کا ${t}${i.maximum.toString()} ہونا متوقع تھا`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `بہت چھوٹا: ${i.origin} کے ${t}${i.minimum.toString()} ${n.unit} ہونے متوقع تھے`;
                        return `بہت چھوٹا: ${i.origin} کا ${t}${i.minimum.toString()} ہونا متوقع تھا`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `غلط سٹرنگ: "${i.prefix}" سے شروع ہونا چاہیے`;
                        if ("ends_with" === i.format) return `غلط سٹرنگ: "${i.suffix}" پر ختم ہونا چاہیے`;
                        if ("includes" === i.format) return `غلط سٹرنگ: "${i.includes}" شامل ہونا چاہیے`;
                        if ("regex" === i.format) return `غلط سٹرنگ: پیٹرن ${i.pattern} سے میچ ہونا چاہیے`;
                        return `غلط ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `غلط نمبر: ${i.divisor} کا مضاعف ہونا چاہیے`;
                    case "unrecognized_keys":
                        return `غیر تسلیم شدہ کی${i.keys.length>1?"ز":""}: ${l(i.keys,"، ")}`;
                    case "invalid_key":
                        return `${i.origin} میں غلط کی`;
                    case "invalid_union":
                    default:
                        return "غلط ان پٹ";
                    case "invalid_element":
                        return `${i.origin} میں غلط ویلیو`
                }
            })
        }
    }, "vi", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `Đầu v\xe0o kh\xf4ng hợp lệ: mong đợi ${i.expected}, nhận được ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"số";case"object":if(Array.isArray(e))return"mảng";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `Đầu v\xe0o kh\xf4ng hợp lệ: mong đợi ${O(i.values[0])}`;
                        return `T\xf9y chọn kh\xf4ng hợp lệ: mong đợi một trong c\xe1c gi\xe1 trị ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `Qu\xe1 lớn: mong đợi ${i.origin??"giá trị"} ${n.verb} ${t}${i.maximum.toString()} ${n.unit??"phần tử"}`;
                        return `Qu\xe1 lớn: mong đợi ${i.origin??"giá trị"} ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `Qu\xe1 nhỏ: mong đợi ${i.origin} ${n.verb} ${t}${i.minimum.toString()} ${n.unit}`;
                        return `Qu\xe1 nhỏ: mong đợi ${i.origin} ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Chuỗi kh\xf4ng hợp lệ: phải bắt đầu bằng "${i.prefix}"`;
                        if ("ends_with" === i.format) return `Chuỗi kh\xf4ng hợp lệ: phải kết th\xfac bằng "${i.suffix}"`;
                        if ("includes" === i.format) return `Chuỗi kh\xf4ng hợp lệ: phải bao gồm "${i.includes}"`;
                        if ("regex" === i.format) return `Chuỗi kh\xf4ng hợp lệ: phải khớp với mẫu ${i.pattern}`;
                        return `${t[i.format]??i.format} kh\xf4ng hợp lệ`;
                    case "not_multiple_of":
                        return `Số kh\xf4ng hợp lệ: phải l\xe0 bội số của ${i.divisor}`;
                    case "unrecognized_keys":
                        return `Kh\xf3a kh\xf4ng được nhận dạng: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Kh\xf3a kh\xf4ng hợp lệ trong ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Đầu vào không hợp lệ";
                    case "invalid_element":
                        return `Gi\xe1 trị kh\xf4ng hợp lệ trong ${i.origin}`
                }
            })
        }
    }, "yo", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `\xccb\xe1wọl\xe9 aṣ\xecṣe: a n\xed l\xe1ti fi ${i.expected}, \xe0mọ̀ a r\xed ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"nọ́mbà";case"object":if(Array.isArray(e))return"akopọ";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `\xccb\xe1wọl\xe9 aṣ\xecṣe: a n\xed l\xe1ti fi ${O(i.values[0])}`;
                        return `\xc0ṣ\xe0y\xe0n aṣ\xecṣe: yan ọ̀kan l\xe1ra ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `T\xf3 pọ̀ j\xf9: a n\xed l\xe1ti jẹ́ p\xe9 ${i.origin??"iye"} ${n.verb} ${t}${i.maximum} ${n.unit}`;
                        return `T\xf3 pọ̀ j\xf9: a n\xed l\xe1ti jẹ́ ${t}${i.maximum}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `K\xe9r\xe9 ju: a n\xed l\xe1ti jẹ́ p\xe9 ${i.origin} ${n.verb} ${t}${i.minimum} ${n.unit}`;
                        return `K\xe9r\xe9 ju: a n\xed l\xe1ti jẹ́ ${t}${i.minimum}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `Ọ̀rọ̀ aṣ\xecṣe: gbọ́dọ̀ bẹ̀rẹ̀ pẹ̀l\xfa "${i.prefix}"`;
                        if ("ends_with" === i.format) return `Ọ̀rọ̀ aṣ\xecṣe: gbọ́dọ̀ par\xed pẹ̀l\xfa "${i.suffix}"`;
                        if ("includes" === i.format) return `Ọ̀rọ̀ aṣ\xecṣe: gbọ́dọ̀ n\xed "${i.includes}"`;
                        if ("regex" === i.format) return `Ọ̀rọ̀ aṣ\xecṣe: gbọ́dọ̀ b\xe1 \xe0pẹẹrẹ mu ${i.pattern}`;
                        return `Aṣ\xecṣe: ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `Nọ́mb\xe0 aṣ\xecṣe: gbọ́dọ̀ jẹ́ \xe8y\xe0 p\xedp\xedn ti ${i.divisor}`;
                    case "unrecognized_keys":
                        return `Bọt\xecn\xec \xe0\xecmọ̀: ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `Bọt\xecn\xec aṣ\xecṣe n\xedn\xfa ${i.origin}`;
                    case "invalid_union":
                    default:
                        return "Ìbáwọlé aṣìṣe";
                    case "invalid_element":
                        return `Iye aṣ\xecṣe n\xedn\xfa ${i.origin}`
                }
            })
        }
    }, "zhCN", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `无效输入：期望 ${i.expected}，实际接收 ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"非数字(NaN)":"数字";case"object":if(Array.isArray(e))return"数组";if(null===e)return"空值(null)";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `无效输入：期望 ${O(i.values[0])}`;
                        return `无效选项：期望以下之一 ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `数值过大：期望 ${i.origin??"值"} ${t}${i.maximum.toString()} ${n.unit??"个元素"}`;
                        return `数值过大：期望 ${i.origin??"值"} ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `数值过小：期望 ${i.origin} ${t}${i.minimum.toString()} ${n.unit}`;
                        return `数值过小：期望 ${i.origin} ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `无效字符串：必须以 "${i.prefix}" 开头`;
                        if ("ends_with" === i.format) return `无效字符串：必须以 "${i.suffix}" 结尾`;
                        if ("includes" === i.format) return `无效字符串：必须包含 "${i.includes}"`;
                        if ("regex" === i.format) return `无效字符串：必须满足正则表达式 ${i.pattern}`;
                        return `无效${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `无效数字：必须是 ${i.divisor} 的倍数`;
                    case "unrecognized_keys":
                        return `出现未知的键(key): ${l(i.keys,", ")}`;
                    case "invalid_key":
                        return `${i.origin} 中的键(key)无效`;
                    case "invalid_union":
                    default:
                        return "无效输入";
                    case "invalid_element":
                        return `${i.origin} 中包含无效值(value)`
                }
            })
        }
    }, "zhTW", 0, function() {
        let e, t;
        return {
            localeError: (e = {
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
            }, t = {
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
            }, i => {
                switch (i.code) {
                    case "invalid_type":
                        return `無效的輸入值：預期為 ${i.expected}，但收到 ${(e=>{let t=typeof e;switch(t){case"number":return Number.isNaN(e)?"NaN":"number";case"object":if(Array.isArray(e))return"array";if(null===e)return"null";if(Object.getPrototypeOf(e)!==Object.prototype&&e.constructor)return e.constructor.name}return t})(i.input)}`;
                    case "invalid_value":
                        if (1 === i.values.length) return `無效的輸入值：預期為 ${O(i.values[0])}`;
                        return `無效的選項：預期為以下其中之一 ${l(i.values,"|")}`;
                    case "too_big": {
                        let t = i.inclusive ? "<=" : "<",
                            n = e[i.origin] ?? null;
                        if (n) return `數值過大：預期 ${i.origin??"值"} 應為 ${t}${i.maximum.toString()} ${n.unit??"個元素"}`;
                        return `數值過大：預期 ${i.origin??"值"} 應為 ${t}${i.maximum.toString()}`
                    }
                    case "too_small": {
                        let t = i.inclusive ? ">=" : ">",
                            n = e[i.origin] ?? null;
                        if (n) return `數值過小：預期 ${i.origin} 應為 ${t}${i.minimum.toString()} ${n.unit}`;
                        return `數值過小：預期 ${i.origin} 應為 ${t}${i.minimum.toString()}`
                    }
                    case "invalid_format":
                        if ("starts_with" === i.format) return `無效的字串：必須以 "${i.prefix}" 開頭`;
                        if ("ends_with" === i.format) return `無效的字串：必須以 "${i.suffix}" 結尾`;
                        if ("includes" === i.format) return `無效的字串：必須包含 "${i.includes}"`;
                        if ("regex" === i.format) return `無效的字串：必須符合格式 ${i.pattern}`;
                        return `無效的 ${t[i.format]??i.format}`;
                    case "not_multiple_of":
                        return `無效的數字：必須為 ${i.divisor} 的倍數`;
                    case "unrecognized_keys":
                        return `無法識別的鍵值${i.keys.length>1?"們":""}：${l(i.keys,"、")}`;
                    case "invalid_key":
                        return `${i.origin} 中有無效的鍵值`;
                    case "invalid_union":
                    default:
                        return "無效的輸入值";
                    case "invalid_element":
                        return `${i.origin} 中有無效的值`
                }
            })
        }
    }], 955257);
    var na = e.i(955257);

    function no(e, t) {
        return new e({
            type: "string",
            ...U(t)
        })
    }

    function nu(e, t) {
        return new e({
            type: "string",
            coerce: !0,
            ...U(t)
        })
    }

    function ns(e, t) {
        return new e({
            type: "string",
            format: "email",
            check: "string_format",
            abort: !1,
            ...U(t)
        })
    }

    function nl(e, t) {
        return new e({
            type: "string",
            format: "guid",
            check: "string_format",
            abort: !1,
            ...U(t)
        })
    }

    function nd(e, t) {
        return new e({
            type: "string",
            format: "uuid",
            check: "string_format",
            abort: !1,
            ...U(t)
        })
    }

    function nc(e, t) {
        return new e({
            type: "string",
            format: "uuid",
            check: "string_format",
            abort: !1,
            version: "v4",
            ...U(t)
        })
    }

    function nm(e, t) {
        return new e({
            type: "string",
            format: "uuid",
            check: "string_format",
            abort: !1,
            version: "v6",
            ...U(t)
        })
    }

    function nf(e, t) {
        return new e({
            type: "string",
            format: "uuid",
            check: "string_format",
            abort: !1,
            version: "v7",
            ...U(t)
        })
    }

    function np(e, t) {
        return new e({
            type: "string",
            format: "url",
            check: "string_format",
            abort: !1,
            ...U(t)
        })
    }

    function nv(e, t) {
        return new e({
            type: "string",
            format: "emoji",
            check: "string_format",
            abort: !1,
            ...U(t)
        })
    }

    function ng(e, t) {
        return new e({
            type: "string",
            format: "nanoid",
            check: "string_format",
            abort: !1,
            ...U(t)
        })
    }

    function n$(e, t) {
        return new e({
            type: "string",
            format: "cuid",
            check: "string_format",
            abort: !1,
            ...U(t)
        })
    }

    function nh(e, t) {
        return new e({
            type: "string",
            format: "cuid2",
            check: "string_format",
            abort: !1,
            ...U(t)
        })
    }

    function n_(e, t) {
        return new e({
            type: "string",
            format: "ulid",
            check: "string_format",
            abort: !1,
            ...U(t)
        })
    }

    function ny(e, t) {
        return new e({
            type: "string",
            format: "xid",
            check: "string_format",
            abort: !1,
            ...U(t)
        })
    }

    function nb(e, t) {
        return new e({
            type: "string",
            format: "ksuid",
            check: "string_format",
            abort: !1,
            ...U(t)
        })
    }

    function nx(e, t) {
        return new e({
            type: "string",
            format: "ipv4",
            check: "string_format",
            abort: !1,
            ...U(t)
        })
    }

    function nk(e, t) {
        return new e({
            type: "string",
            format: "ipv6",
            check: "string_format",
            abort: !1,
            ...U(t)
        })
    }

    function nI(e, t) {
        return new e({
            type: "string",
            format: "cidrv4",
            check: "string_format",
            abort: !1,
            ...U(t)
        })
    }

    function nw(e, t) {
        return new e({
            type: "string",
            format: "cidrv6",
            check: "string_format",
            abort: !1,
            ...U(t)
        })
    }

    function nz(e, t) {
        return new e({
            type: "string",
            format: "base64",
            check: "string_format",
            abort: !1,
            ...U(t)
        })
    }

    function nS(e, t) {
        return new e({
            type: "string",
            format: "base64url",
            check: "string_format",
            abort: !1,
            ...U(t)
        })
    }

    function nZ(e, t) {
        return new e({
            type: "string",
            format: "e164",
            check: "string_format",
            abort: !1,
            ...U(t)
        })
    }

    function nU(e, t) {
        return new e({
            type: "string",
            format: "jwt",
            check: "string_format",
            abort: !1,
            ...U(t)
        })
    }
    let nO = {
        Any: null,
        Minute: -1,
        Second: 0,
        Millisecond: 3,
        Microsecond: 6
    };

    function nj(e, t) {
        return new e({
            type: "string",
            format: "datetime",
            check: "string_format",
            offset: !1,
            local: !1,
            precision: null,
            ...U(t)
        })
    }

    function nN(e, t) {
        return new e({
            type: "string",
            format: "date",
            check: "string_format",
            ...U(t)
        })
    }

    function nD(e, t) {
        return new e({
            type: "string",
            format: "time",
            check: "string_format",
            precision: null,
            ...U(t)
        })
    }

    function nP(e, t) {
        return new e({
            type: "string",
            format: "duration",
            check: "string_format",
            ...U(t)
        })
    }

    function nE(e, t) {
        return new e({
            type: "number",
            checks: [],
            ...U(t)
        })
    }

    function nA(e, t) {
        return new e({
            type: "number",
            coerce: !0,
            checks: [],
            ...U(t)
        })
    }

    function nM(e, t) {
        return new e({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "safeint",
            ...U(t)
        })
    }

    function nT(e, t) {
        return new e({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "float32",
            ...U(t)
        })
    }

    function nC(e, t) {
        return new e({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "float64",
            ...U(t)
        })
    }

    function nL(e, t) {
        return new e({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "int32",
            ...U(t)
        })
    }

    function nR(e, t) {
        return new e({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "uint32",
            ...U(t)
        })
    }

    function nF(e, t) {
        return new e({
            type: "boolean",
            ...U(t)
        })
    }

    function nJ(e, t) {
        return new e({
            type: "boolean",
            coerce: !0,
            ...U(t)
        })
    }

    function nW(e, t) {
        return new e({
            type: "bigint",
            ...U(t)
        })
    }

    function nB(e, t) {
        return new e({
            type: "bigint",
            coerce: !0,
            ...U(t)
        })
    }

    function nG(e, t) {
        return new e({
            type: "bigint",
            check: "bigint_format",
            abort: !1,
            format: "int64",
            ...U(t)
        })
    }

    function nK(e, t) {
        return new e({
            type: "bigint",
            check: "bigint_format",
            abort: !1,
            format: "uint64",
            ...U(t)
        })
    }

    function nV(e, t) {
        return new e({
            type: "symbol",
            ...U(t)
        })
    }

    function nX(e, t) {
        return new e({
            type: "undefined",
            ...U(t)
        })
    }

    function nq(e, t) {
        return new e({
            type: "null",
            ...U(t)
        })
    }

    function nY(e) {
        return new e({
            type: "any"
        })
    }

    function nH(e) {
        return new e({
            type: "unknown"
        })
    }

    function nQ(e, t) {
        return new e({
            type: "never",
            ...U(t)
        })
    }

    function n0(e, t) {
        return new e({
            type: "void",
            ...U(t)
        })
    }

    function n4(e, t) {
        return new e({
            type: "date",
            ...U(t)
        })
    }

    function n6(e, t) {
        return new e({
            type: "date",
            coerce: !0,
            ...U(t)
        })
    }

    function n1(e, t) {
        return new e({
            type: "nan",
            ...U(t)
        })
    }

    function n2(e, t) {
        return new ts({
            check: "less_than",
            ...U(t),
            value: e,
            inclusive: !1
        })
    }

    function n9(e, t) {
        return new ts({
            check: "less_than",
            ...U(t),
            value: e,
            inclusive: !0
        })
    }

    function n3(e, t) {
        return new tl({
            check: "greater_than",
            ...U(t),
            value: e,
            inclusive: !1
        })
    }

    function n7(e, t) {
        return new tl({
            check: "greater_than",
            ...U(t),
            value: e,
            inclusive: !0
        })
    }

    function n5(e) {
        return n3(0, e)
    }

    function n8(e) {
        return n2(0, e)
    }

    function re(e) {
        return n9(0, e)
    }

    function rt(e) {
        return n7(0, e)
    }

    function ri(e, t) {
        return new td({
            check: "multiple_of",
            ...U(t),
            value: e
        })
    }

    function rn(e, t) {
        return new tf({
            check: "max_size",
            ...U(t),
            maximum: e
        })
    }

    function rr(e, t) {
        return new tp({
            check: "min_size",
            ...U(t),
            minimum: e
        })
    }

    function ra(e, t) {
        return new tv({
            check: "size_equals",
            ...U(t),
            size: e
        })
    }

    function ro(e, t) {
        return new tg({
            check: "max_length",
            ...U(t),
            maximum: e
        })
    }

    function ru(e, t) {
        return new t$({
            check: "min_length",
            ...U(t),
            minimum: e
        })
    }

    function rs(e, t) {
        return new th({
            check: "length_equals",
            ...U(t),
            length: e
        })
    }

    function rl(e, t) {
        return new ty({
            check: "string_format",
            format: "regex",
            ...U(t),
            pattern: e
        })
    }

    function rd(e) {
        return new tb({
            check: "string_format",
            format: "lowercase",
            ...U(e)
        })
    }

    function rc(e) {
        return new tx({
            check: "string_format",
            format: "uppercase",
            ...U(e)
        })
    }

    function rm(e, t) {
        return new tk({
            check: "string_format",
            format: "includes",
            ...U(t),
            includes: e
        })
    }

    function rf(e, t) {
        return new tI({
            check: "string_format",
            format: "starts_with",
            ...U(t),
            prefix: e
        })
    }

    function rp(e, t) {
        return new tw({
            check: "string_format",
            format: "ends_with",
            ...U(t),
            suffix: e
        })
    }

    function rv(e, t, i) {
        return new tS({
            check: "property",
            property: e,
            schema: t,
            ...U(i)
        })
    }

    function rg(e, t) {
        return new tZ({
            check: "mime_type",
            mime: e,
            ...U(t)
        })
    }

    function r$(e) {
        return new tU({
            check: "overwrite",
            tx: e
        })
    }

    function rh(e) {
        return r$(t => t.normalize(e))
    }

    function r_() {
        return r$(e => e.trim())
    }

    function ry() {
        return r$(e => e.toLowerCase())
    }

    function rb() {
        return r$(e => e.toUpperCase())
    }

    function rx(e, t, i) {
        return new e({
            type: "array",
            element: t,
            ...U(i)
        })
    }

    function rk(e, t, i) {
        return new e({
            type: "union",
            options: t,
            ...U(i)
        })
    }

    function rI(e, t, i, n) {
        return new e({
            type: "union",
            options: i,
            discriminator: t,
            ...U(n)
        })
    }

    function rw(e, t, i) {
        return new e({
            type: "intersection",
            left: t,
            right: i
        })
    }

    function rz(e, t, i, n) {
        let r = i instanceof tN,
            a = r ? n : i;
        return new e({
            type: "tuple",
            items: t,
            rest: r ? i : null,
            ...U(a)
        })
    }

    function rS(e, t, i, n) {
        return new e({
            type: "record",
            keyType: t,
            valueType: i,
            ...U(n)
        })
    }

    function rZ(e, t, i, n) {
        return new e({
            type: "map",
            keyType: t,
            valueType: i,
            ...U(n)
        })
    }

    function rU(e, t, i) {
        return new e({
            type: "set",
            valueType: t,
            ...U(i)
        })
    }

    function rO(e, t, i) {
        return new e({
            type: "enum",
            entries: Array.isArray(t) ? Object.fromEntries(t.map(e => [e, e])) : t,
            ...U(i)
        })
    }

    function rj(e, t, i) {
        return new e({
            type: "enum",
            entries: t,
            ...U(i)
        })
    }

    function rN(e, t, i) {
        return new e({
            type: "literal",
            values: Array.isArray(t) ? t : [t],
            ...U(i)
        })
    }

    function rD(e, t) {
        return new e({
            type: "file",
            ...U(t)
        })
    }

    function rP(e, t) {
        return new e({
            type: "transform",
            transform: t
        })
    }

    function rE(e, t) {
        return new e({
            type: "optional",
            innerType: t
        })
    }

    function rA(e, t) {
        return new e({
            type: "nullable",
            innerType: t
        })
    }

    function rM(e, t, i) {
        return new e({
            type: "default",
            innerType: t,
            get defaultValue() {
                return "function" == typeof i ? i() : I(i)
            }
        })
    }

    function rT(e, t, i) {
        return new e({
            type: "nonoptional",
            innerType: t,
            ...U(i)
        })
    }

    function rC(e, t) {
        return new e({
            type: "success",
            innerType: t
        })
    }

    function rL(e, t, i) {
        return new e({
            type: "catch",
            innerType: t,
            catchValue: "function" == typeof i ? i : () => i
        })
    }

    function rR(e, t, i) {
        return new e({
            type: "pipe",
            in: t,
            out: i
        })
    }

    function rF(e, t) {
        return new e({
            type: "readonly",
            innerType: t
        })
    }

    function rJ(e, t, i) {
        return new e({
            type: "template_literal",
            parts: t,
            ...U(i)
        })
    }

    function rW(e, t) {
        return new e({
            type: "lazy",
            getter: t
        })
    }

    function rB(e, t) {
        return new e({
            type: "promise",
            innerType: t
        })
    }

    function rG(e, t, i) {
        let n = U(i);
        return n.abort ?? (n.abort = !0), new e({
            type: "custom",
            check: "custom",
            fn: t,
            ...n
        })
    }

    function rK(e, t, i) {
        return new e({
            type: "custom",
            check: "custom",
            fn: t,
            ...U(i)
        })
    }

    function rV(e) {
        let t = rX(i => (i.addIssue = e => {
            "string" == typeof e ? i.issues.push(L(e, i.value, t._zod.def)) : (e.fatal && (e.continue = !1), e.code ?? (e.code = "custom"), e.input ?? (e.input = i.value), e.inst ?? (e.inst = t), e.continue ?? (e.continue = !t._zod.def.abort), i.issues.push(L(e)))
        }, e(i.value, i)));
        return t
    }

    function rX(e, t) {
        let i = new to({
            check: "custom",
            ...U(t)
        });
        return i._zod.check = e, i
    }

    function rq(e, t) {
        let i = U(t),
            n = i.truthy ?? ["true", "1", "yes", "on", "y", "enabled"],
            r = i.falsy ?? ["false", "0", "no", "off", "n", "disabled"];
        "sensitive" !== i.case && (n = n.map(e => "string" == typeof e ? e.toLowerCase() : e), r = r.map(e => "string" == typeof e ? e.toLowerCase() : e));
        let a = new Set(n),
            o = new Set(r),
            u = e.Codec ?? iX,
            s = e.Boolean ?? ie,
            l = new u({
                type: "pipe",
                in: new(e.String ?? tD)({
                    type: "string",
                    error: i.error
                }),
                out: new s({
                    type: "boolean",
                    error: i.error
                }),
                transform: (e, t) => {
                    let n = e;
                    return "sensitive" !== i.case && (n = n.toLowerCase()), !!a.has(n) || !o.has(n) && (t.issues.push({
                        code: "invalid_value",
                        expected: "stringbool",
                        values: [...a, ...o],
                        input: t.value,
                        inst: l,
                        continue: !1
                    }), {})
                },
                reverseTransform: (e, t) => !0 === e ? n[0] || "true" : r[0] || "false",
                error: i.error
            });
        return l
    }

    function rY(e, t, i) {
        let n = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : {},
            r = U(n),
            a = {
                ...U(n),
                check: "string_format",
                type: "string",
                format: t,
                fn: "function" == typeof i ? i : e => i.test(e),
                ...r
            };
        return i instanceof RegExp && (a.pattern = i), new e(a)
    }
    e.s(["TimePrecision", 0, nO, "_any", 0, nY, "_array", 0, rx, "_base64", 0, nz, "_base64url", 0, nS, "_bigint", 0, nW, "_boolean", 0, nF, "_catch", 0, rL, "_check", 0, rX, "_cidrv4", 0, nI, "_cidrv6", 0, nw, "_coercedBigint", 0, nB, "_coercedBoolean", 0, nJ, "_coercedDate", 0, n6, "_coercedNumber", 0, nA, "_coercedString", 0, nu, "_cuid", 0, n$, "_cuid2", 0, nh, "_custom", 0, rG, "_date", 0, n4, "_default", 0, rM, "_discriminatedUnion", 0, rI, "_e164", 0, nZ, "_email", 0, ns, "_emoji", 0, nv, "_endsWith", 0, rp, "_enum", 0, rO, "_file", 0, rD, "_float32", 0, nT, "_float64", 0, nC, "_gt", 0, n3, "_gte", 0, n7, "_guid", 0, nl, "_includes", 0, rm, "_int", 0, nM, "_int32", 0, nL, "_int64", 0, nG, "_intersection", 0, rw, "_ipv4", 0, nx, "_ipv6", 0, nk, "_isoDate", 0, nN, "_isoDateTime", 0, nj, "_isoDuration", 0, nP, "_isoTime", 0, nD, "_jwt", 0, nU, "_ksuid", 0, nb, "_lazy", 0, rW, "_length", 0, rs, "_literal", 0, rN, "_lowercase", 0, rd, "_lt", 0, n2, "_lte", 0, n9, "_map", 0, rZ, "_max", 0, n9, "_maxLength", 0, ro, "_maxSize", 0, rn, "_mime", 0, rg, "_min", 0, n7, "_minLength", 0, ru, "_minSize", 0, rr, "_multipleOf", 0, ri, "_nan", 0, n1, "_nanoid", 0, ng, "_nativeEnum", 0, rj, "_negative", 0, n8, "_never", 0, nQ, "_nonnegative", 0, rt, "_nonoptional", 0, rT, "_nonpositive", 0, re, "_normalize", 0, rh, "_null", 0, nq, "_nullable", 0, rA, "_number", 0, nE, "_optional", 0, rE, "_overwrite", 0, r$, "_pipe", 0, rR, "_positive", 0, n5, "_promise", 0, rB, "_property", 0, rv, "_readonly", 0, rF, "_record", 0, rS, "_refine", 0, rK, "_regex", 0, rl, "_set", 0, rU, "_size", 0, ra, "_startsWith", 0, rf, "_string", 0, no, "_stringFormat", 0, rY, "_stringbool", 0, rq, "_success", 0, rC, "_superRefine", 0, rV, "_symbol", 0, nV, "_templateLiteral", 0, rJ, "_toLowerCase", 0, ry, "_toUpperCase", 0, rb, "_transform", 0, rP, "_trim", 0, r_, "_tuple", 0, rz, "_uint32", 0, nR, "_uint64", 0, nK, "_ulid", 0, n_, "_undefined", 0, nX, "_union", 0, rk, "_unknown", 0, nH, "_uppercase", 0, rc, "_url", 0, np, "_uuid", 0, nd, "_uuidv4", 0, nc, "_uuidv6", 0, nm, "_uuidv7", 0, nf, "_void", 0, n0, "_xid", 0, ny], 189571);
    let rH = Symbol("ZodOutput"),
        rQ = Symbol("ZodInput");
    class r0 {
        add(e) {
            for (var t = arguments.length, i = Array(t > 1 ? t - 1 : 0), n = 1; n < t; n++) i[n - 1] = arguments[n];
            let r = i[0];
            if (this._map.set(e, r), r && "object" == typeof r && "id" in r) {
                if (this._idmap.has(r.id)) throw Error(`ID ${r.id} already exists in the registry`);
                this._idmap.set(r.id, e)
            }
            return this
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
                let i = {
                    ...this.get(t) ?? {}
                };
                delete i.id;
                let n = {
                    ...i,
                    ...this._map.get(e)
                };
                return Object.keys(n).length ? n : void 0
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

    function r4() {
        return new r0
    }
    let r6 = r4();
    e.s(["$ZodRegistry", 0, r0, "$input", 0, rQ, "$output", 0, rH, "globalRegistry", 0, r6, "registry", 0, r4], 233541);
    class r1 {
        process(e) {
            var t;
            let i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {
                    path: [],
                    schemaPath: []
                },
                n = e._zod.def,
                r = this.seen.get(e);
            if (r) return r.count++, i.schemaPath.includes(e) && (r.cycle = i.path), r.schema;
            let a = {
                schema: {},
                count: 1,
                cycle: void 0,
                path: i.path
            };
            this.seen.set(e, a);
            let o = e._zod.toJSONSchema?.();
            if (o) a.schema = o;
            else {
                let t = {
                        ...i,
                        schemaPath: [...i.schemaPath, e],
                        path: i.path
                    },
                    r = e._zod.parent;
                if (r) a.ref = r, this.process(r, t), this.seen.get(r).isParent = !0;
                else {
                    let i = a.schema;
                    switch (n.type) {
                        case "string": {
                            i.type = "string";
                            let {
                                minimum: t,
                                maximum: n,
                                format: r,
                                patterns: o,
                                contentEncoding: u
                            } = e._zod.bag;
                            if ("number" == typeof t && (i.minLength = t), "number" == typeof n && (i.maxLength = n), r && (i.format = ({
                                    guid: "uuid",
                                    url: "uri",
                                    datetime: "date-time",
                                    json_string: "json-string",
                                    regex: ""
                                })[r] ?? r, "" === i.format && delete i.format), u && (i.contentEncoding = u), o && o.size > 0) {
                                let e = [...o];
                                1 === e.length ? i.pattern = e[0].source : e.length > 1 && (a.schema.allOf = [...e.map(e => ({
                                    ..."draft-7" === this.target || "draft-4" === this.target || "openapi-3.0" === this.target ? {
                                        type: "string"
                                    } : {},
                                    pattern: e.source
                                }))])
                            }
                            break
                        }
                        case "number": {
                            let {
                                minimum: t,
                                maximum: n,
                                format: r,
                                multipleOf: a,
                                exclusiveMaximum: o,
                                exclusiveMinimum: u
                            } = e._zod.bag;
                            "string" == typeof r && r.includes("int") ? i.type = "integer" : i.type = "number", "number" == typeof u && ("draft-4" === this.target || "openapi-3.0" === this.target ? (i.minimum = u, i.exclusiveMinimum = !0) : i.exclusiveMinimum = u), "number" == typeof t && (i.minimum = t, "number" == typeof u && "draft-4" !== this.target && (u >= t ? delete i.minimum : delete i.exclusiveMinimum)), "number" == typeof o && ("draft-4" === this.target || "openapi-3.0" === this.target ? (i.maximum = o, i.exclusiveMaximum = !0) : i.exclusiveMaximum = o), "number" == typeof n && (i.maximum = n, "number" == typeof o && "draft-4" !== this.target && (o <= n ? delete i.maximum : delete i.exclusiveMaximum)), "number" == typeof a && (i.multipleOf = a);
                            break
                        }
                        case "boolean":
                        case "success":
                            i.type = "boolean";
                            break;
                        case "bigint":
                            if ("throw" === this.unrepresentable) throw Error("BigInt cannot be represented in JSON Schema");
                            break;
                        case "symbol":
                            if ("throw" === this.unrepresentable) throw Error("Symbols cannot be represented in JSON Schema");
                            break;
                        case "null":
                            "openapi-3.0" === this.target ? (i.type = "string", i.nullable = !0, i.enum = [null]) : i.type = "null";
                            break;
                        case "any":
                        case "unknown":
                            break;
                        case "undefined":
                            if ("throw" === this.unrepresentable) throw Error("Undefined cannot be represented in JSON Schema");
                            break;
                        case "void":
                            if ("throw" === this.unrepresentable) throw Error("Void cannot be represented in JSON Schema");
                            break;
                        case "never":
                            i.not = {};
                            break;
                        case "date":
                            if ("throw" === this.unrepresentable) throw Error("Date cannot be represented in JSON Schema");
                            break;
                        case "array": {
                            let {
                                minimum: r,
                                maximum: a
                            } = e._zod.bag;
                            "number" == typeof r && (i.minItems = r), "number" == typeof a && (i.maxItems = a), i.type = "array", i.items = this.process(n.element, {
                                ...t,
                                path: [...t.path, "items"]
                            });
                            break
                        }
                        case "object": {
                            i.type = "object", i.properties = {};
                            let e = n.shape;
                            for (let n in e) i.properties[n] = this.process(e[n], {
                                ...t,
                                path: [...t.path, "properties", n]
                            });
                            let r = new Set([...new Set(Object.keys(e))].filter(e => {
                                let t = n.shape[e]._zod;
                                return "input" === this.io ? void 0 === t.optin : void 0 === t.optout
                            }));
                            r.size > 0 && (i.required = Array.from(r)), n.catchall?._zod.def.type === "never" ? i.additionalProperties = !1 : n.catchall ? n.catchall && (i.additionalProperties = this.process(n.catchall, {
                                ...t,
                                path: [...t.path, "additionalProperties"]
                            })) : "output" === this.io && (i.additionalProperties = !1);
                            break
                        }
                        case "union":
                            i.anyOf = n.options.map((e, i) => this.process(e, {
                                ...t,
                                path: [...t.path, "anyOf", i]
                            }));
                            break;
                        case "intersection": {
                            let e = this.process(n.left, {
                                    ...t,
                                    path: [...t.path, "allOf", 0]
                                }),
                                r = this.process(n.right, {
                                    ...t,
                                    path: [...t.path, "allOf", 1]
                                }),
                                a = e => "allOf" in e && 1 === Object.keys(e).length;
                            i.allOf = [...a(e) ? e.allOf : [e], ...a(r) ? r.allOf : [r]];
                            break
                        }
                        case "tuple": {
                            i.type = "array";
                            let r = "draft-2020-12" === this.target ? "prefixItems" : "items",
                                a = "draft-2020-12" === this.target || "openapi-3.0" === this.target ? "items" : "additionalItems",
                                o = n.items.map((e, i) => this.process(e, {
                                    ...t,
                                    path: [...t.path, r, i]
                                })),
                                u = n.rest ? this.process(n.rest, {
                                    ...t,
                                    path: [...t.path, a, ..."openapi-3.0" === this.target ? [n.items.length] : []]
                                }) : null;
                            "draft-2020-12" === this.target ? (i.prefixItems = o, u && (i.items = u)) : "openapi-3.0" === this.target ? (i.items = {
                                anyOf: o
                            }, u && i.items.anyOf.push(u), i.minItems = o.length, u || (i.maxItems = o.length)) : (i.items = o, u && (i.additionalItems = u));
                            let {
                                minimum: s,
                                maximum: l
                            } = e._zod.bag;
                            "number" == typeof s && (i.minItems = s), "number" == typeof l && (i.maxItems = l);
                            break
                        }
                        case "record":
                            i.type = "object", ("draft-7" === this.target || "draft-2020-12" === this.target) && (i.propertyNames = this.process(n.keyType, {
                                ...t,
                                path: [...t.path, "propertyNames"]
                            })), i.additionalProperties = this.process(n.valueType, {
                                ...t,
                                path: [...t.path, "additionalProperties"]
                            });
                            break;
                        case "map":
                            if ("throw" === this.unrepresentable) throw Error("Map cannot be represented in JSON Schema");
                            break;
                        case "set":
                            if ("throw" === this.unrepresentable) throw Error("Set cannot be represented in JSON Schema");
                            break;
                        case "enum": {
                            let e = s(n.entries);
                            e.every(e => "number" == typeof e) && (i.type = "number"), e.every(e => "string" == typeof e) && (i.type = "string"), i.enum = e;
                            break
                        }
                        case "literal": {
                            let e = [];
                            for (let t of n.values)
                                if (void 0 === t) {
                                    if ("throw" === this.unrepresentable) throw Error("Literal `undefined` cannot be represented in JSON Schema")
                                } else if ("bigint" == typeof t)
                                if ("throw" === this.unrepresentable) throw Error("BigInt literals cannot be represented in JSON Schema");
                                else e.push(Number(t));
                            else e.push(t);
                            if (0 === e.length);
                            else if (1 === e.length) {
                                let t = e[0];
                                i.type = null === t ? "null" : typeof t, "draft-4" === this.target || "openapi-3.0" === this.target ? i.enum = [t] : i.const = t
                            } else e.every(e => "number" == typeof e) && (i.type = "number"), e.every(e => "string" == typeof e) && (i.type = "string"), e.every(e => "boolean" == typeof e) && (i.type = "string"), e.every(e => null === e) && (i.type = "null"), i.enum = e;
                            break
                        }
                        case "file": {
                            let t = {
                                    type: "string",
                                    format: "binary",
                                    contentEncoding: "binary"
                                },
                                {
                                    minimum: n,
                                    maximum: r,
                                    mime: a
                                } = e._zod.bag;
                            void 0 !== n && (t.minLength = n), void 0 !== r && (t.maxLength = r), a ? 1 === a.length ? (t.contentMediaType = a[0], Object.assign(i, t)) : i.anyOf = a.map(e => ({
                                ...t,
                                contentMediaType: e
                            })) : Object.assign(i, t);
                            break
                        }
                        case "transform":
                            if ("throw" === this.unrepresentable) throw Error("Transforms cannot be represented in JSON Schema");
                            break;
                        case "nullable": {
                            let e = this.process(n.innerType, t);
                            "openapi-3.0" === this.target ? (a.ref = n.innerType, i.nullable = !0) : i.anyOf = [e, {
                                type: "null"
                            }];
                            break
                        }
                        case "nonoptional":
                        case "promise":
                        case "optional":
                            this.process(n.innerType, t), a.ref = n.innerType;
                            break;
                        case "default":
                            this.process(n.innerType, t), a.ref = n.innerType, i.default = JSON.parse(JSON.stringify(n.defaultValue));
                            break;
                        case "prefault":
                            this.process(n.innerType, t), a.ref = n.innerType, "input" === this.io && (i._prefault = JSON.parse(JSON.stringify(n.defaultValue)));
                            break;
                        case "catch": {
                            let e;
                            this.process(n.innerType, t), a.ref = n.innerType;
                            try {
                                e = n.catchValue(void 0)
                            } catch {
                                throw Error("Dynamic catch values are not supported in JSON Schema")
                            }
                            i.default = e;
                            break
                        }
                        case "nan":
                            if ("throw" === this.unrepresentable) throw Error("NaN cannot be represented in JSON Schema");
                            break;
                        case "template_literal": {
                            let t = e._zod.pattern;
                            if (!t) throw Error("Pattern not found in template literal");
                            i.type = "string", i.pattern = t.source;
                            break
                        }
                        case "pipe": {
                            let e = "input" === this.io ? "transform" === n.in._zod.def.type ? n.out : n.in : n.out;
                            this.process(e, t), a.ref = e;
                            break
                        }
                        case "readonly":
                            this.process(n.innerType, t), a.ref = n.innerType, i.readOnly = !0;
                            break;
                        case "lazy": {
                            let i = e._zod.innerType;
                            this.process(i, t), a.ref = i;
                            break
                        }
                        case "custom":
                            if ("throw" === this.unrepresentable) throw Error("Custom types cannot be represented in JSON Schema");
                            break;
                        case "function":
                            if ("throw" === this.unrepresentable) throw Error("Function types cannot be represented in JSON Schema")
                    }
                }
            }
            let u = this.metadataRegistry.get(e);
            return u && Object.assign(a.schema, u), "input" === this.io && function e(t, i) {
                let n = i ?? {
                    seen: new Set
                };
                if (n.seen.has(t)) return !1;
                n.seen.add(t);
                let r = t._zod.def;
                switch (r.type) {
                    case "string":
                    case "number":
                    case "bigint":
                    case "boolean":
                    case "date":
                    case "symbol":
                    case "undefined":
                    case "null":
                    case "any":
                    case "unknown":
                    case "never":
                    case "void":
                    case "literal":
                    case "enum":
                    case "nan":
                    case "file":
                    case "template_literal":
                    case "custom":
                    case "success":
                    case "catch":
                    case "function":
                        return !1;
                    case "array":
                        return e(r.element, n);
                    case "object":
                        for (let t in r.shape)
                            if (e(r.shape[t], n)) return !0;
                        return !1;
                    case "union":
                        for (let t of r.options)
                            if (e(t, n)) return !0;
                        return !1;
                    case "intersection":
                        return e(r.left, n) || e(r.right, n);
                    case "tuple":
                        for (let t of r.items)
                            if (e(t, n)) return !0;
                        if (r.rest && e(r.rest, n)) return !0;
                        return !1;
                    case "record":
                    case "map":
                        return e(r.keyType, n) || e(r.valueType, n);
                    case "set":
                        return e(r.valueType, n);
                    case "promise":
                    case "optional":
                    case "nonoptional":
                    case "nullable":
                    case "readonly":
                    case "default":
                    case "prefault":
                        return e(r.innerType, n);
                    case "lazy":
                        return e(r.getter(), n);
                    case "transform":
                        return !0;
                    case "pipe":
                        return e(r.in, n) || e(r.out, n)
                }
                throw Error(`Unknown schema type: ${r.type}`)
            }(e) && (delete a.schema.examples, delete a.schema.default), "input" === this.io && a.schema._prefault && ((t = a.schema).default ?? (t.default = a.schema._prefault)), delete a.schema._prefault, this.seen.get(e).schema
        }
        emit(e, t) {
            let i = {
                    cycles: t?.cycles ?? "ref",
                    reused: t?.reused ?? "inline",
                    external: t?.external ?? void 0
                },
                n = this.seen.get(e);
            if (!n) throw Error("Unprocessed schema. This is a bug in Zod.");
            let r = e => {
                    let t = "draft-2020-12" === this.target ? "$defs" : "definitions";
                    if (i.external) {
                        let n = i.external.registry.get(e[0])?.id,
                            r = i.external.uri ?? (e => e);
                        if (n) return {
                            ref: r(n)
                        };
                        let a = e[1].defId ?? e[1].schema.id ?? `schema${this.counter++}`;
                        return e[1].defId = a, {
                            defId: a,
                            ref: `${r("__shared")}#/${t}/${a}`
                        }
                    }
                    if (e[1] === n) return {
                        ref: "#"
                    };
                    let r = `#/${t}/`,
                        a = e[1].schema.id ?? `__schema${this.counter++}`;
                    return {
                        defId: a,
                        ref: r + a
                    }
                },
                a = e => {
                    if (e[1].schema.$ref) return;
                    let t = e[1],
                        {
                            ref: i,
                            defId: n
                        } = r(e);
                    t.def = {
                        ...t.schema
                    }, n && (t.defId = n);
                    let a = t.schema;
                    for (let e in a) delete a[e];
                    a.$ref = i
                };
            if ("throw" === i.cycles)
                for (let e of this.seen.entries()) {
                    let t = e[1];
                    if (t.cycle) throw Error(`Cycle detected: #/${t.cycle?.join("/")}/<root>

Set the \`cycles\` parameter to \`"ref"\` to resolve cyclical schemas with defs.`)
                }
            for (let t of this.seen.entries()) {
                let n = t[1];
                if (e === t[0]) {
                    a(t);
                    continue
                }
                if (i.external) {
                    let n = i.external.registry.get(t[0])?.id;
                    if (e !== t[0] && n) {
                        a(t);
                        continue
                    }
                }
                if (this.metadataRegistry.get(t[0])?.id || n.cycle || n.count > 1 && "ref" === i.reused) {
                    a(t);
                    continue
                }
            }
            let o = (e, t) => {
                let i = this.seen.get(e),
                    n = i.def ?? i.schema,
                    r = {
                        ...n
                    };
                if (null === i.ref) return;
                let a = i.ref;
                if (i.ref = null, a) {
                    o(a, t);
                    let e = this.seen.get(a).schema;
                    e.$ref && ("draft-7" === t.target || "draft-4" === t.target || "openapi-3.0" === t.target) ? (n.allOf = n.allOf ?? [], n.allOf.push(e)) : (Object.assign(n, e), Object.assign(n, r))
                }
                i.isParent || this.override({
                    zodSchema: e,
                    jsonSchema: n,
                    path: i.path ?? []
                })
            };
            for (let e of [...this.seen.entries()].reverse()) o(e[0], {
                target: this.target
            });
            let u = {};
            if ("draft-2020-12" === this.target ? u.$schema = "https://json-schema.org/draft/2020-12/schema" : "draft-7" === this.target ? u.$schema = "http://json-schema.org/draft-07/schema#" : "draft-4" === this.target ? u.$schema = "http://json-schema.org/draft-04/schema#" : "openapi-3.0" === this.target || console.warn(`Invalid target: ${this.target}`), i.external?.uri) {
                let t = i.external.registry.get(e)?.id;
                if (!t) throw Error("Schema is missing an `id` property");
                u.$id = i.external.uri(t)
            }
            Object.assign(u, n.def);
            let s = i.external?.defs ?? {};
            for (let e of this.seen.entries()) {
                let t = e[1];
                t.def && t.defId && (s[t.defId] = t.def)
            }
            i.external || Object.keys(s).length > 0 && ("draft-2020-12" === this.target ? u.$defs = s : u.definitions = s);
            try {
                return JSON.parse(JSON.stringify(u))
            } catch (e) {
                throw Error("Error converting schema to JSON.")
            }
        }
        constructor(e) {
            this.counter = 0, this.metadataRegistry = e?.metadata ?? r6, this.target = e?.target ?? "draft-2020-12", this.unrepresentable = e?.unrepresentable ?? "throw", this.override = e?.override ?? (() => {}), this.io = e?.io ?? "output", this.seen = new Map
        }
    }

    function r2(e, t) {
        if (e instanceof r0) {
            let i = new r1(t),
                n = {};
            for (let t of e._idmap.entries()) {
                let [e, n] = t;
                i.process(n)
            }
            let r = {},
                a = {
                    registry: e,
                    uri: t?.uri,
                    defs: n
                };
            for (let n of e._idmap.entries()) {
                let [e, o] = n;
                r[e] = i.emit(o, {
                    ...t,
                    external: a
                })
            }
            return Object.keys(n).length > 0 && (r.__shared = {
                ["draft-2020-12" === i.target ? "$defs" : "definitions"]: n
            }), {
                schemas: r
            }
        }
        let i = new r1(t);
        return i.process(e), i.emit(e, t)
    }
    e.s(["JSONSchemaGenerator", 0, r1, "toJSONSchema", 0, r2], 497198), e.s([], 444526);
    var r9 = e.i(444526);
    e.s([], 413451), e.i(413451), e.i(821160), e.i(315607), e.i(976220), e.i(222636), e.s(["$ZodAny", 0, iu, "$ZodArray", 0, ip, "$ZodBase64", 0, t4, "$ZodBase64URL", 0, t1, "$ZodBigInt", 0, it, "$ZodBigIntFormat", 0, ii, "$ZodBoolean", 0, ie, "$ZodCIDRv4", 0, tH, "$ZodCIDRv6", 0, tQ, "$ZodCUID", 0, tR, "$ZodCUID2", 0, tF, "$ZodCatch", 0, iB, "$ZodCodec", 0, iX, "$ZodCustom", 0, i2, "$ZodCustomStringFormat", 0, t7, "$ZodDate", 0, ic, "$ZodDefault", 0, iC, "$ZodDiscriminatedUnion", 0, ix, "$ZodE164", 0, t2, "$ZodEmail", 0, tM, "$ZodEmoji", 0, tC, "$ZodEnum", 0, iN, "$ZodFile", 0, iP, "$ZodFunction", 0, i4, "$ZodGUID", 0, tE, "$ZodIPv4", 0, tq, "$ZodIPv6", 0, tY, "$ZodISODate", 0, tK, "$ZodISODateTime", 0, tG, "$ZodISODuration", 0, tX, "$ZodISOTime", 0, tV, "$ZodIntersection", 0, ik, "$ZodJWT", 0, t3, "$ZodKSUID", 0, tB, "$ZodLazy", 0, i1, "$ZodLiteral", 0, iD, "$ZodMap", 0, iZ, "$ZodNaN", 0, iG, "$ZodNanoID", 0, tL, "$ZodNever", 0, il, "$ZodNonOptional", 0, iF, "$ZodNull", 0, io, "$ZodNullable", 0, iT, "$ZodNumber", 0, t5, "$ZodNumberFormat", 0, t8, "$ZodObject", 0, ih, "$ZodObjectJIT", 0, i_, "$ZodOptional", 0, iM, "$ZodPipe", 0, iK, "$ZodPrefault", 0, iR, "$ZodPromise", 0, i6, "$ZodReadonly", 0, iH, "$ZodRecord", 0, iS, "$ZodSet", 0, iO, "$ZodString", 0, tD, "$ZodStringFormat", 0, tP, "$ZodSuccess", 0, iW, "$ZodSymbol", 0, ir, "$ZodTemplateLiteral", 0, i0, "$ZodTransform", 0, iE, "$ZodTuple", 0, iw, "$ZodType", 0, tN, "$ZodULID", 0, tJ, "$ZodURL", 0, tT, "$ZodUUID", 0, tA, "$ZodUndefined", 0, ia, "$ZodUnion", 0, ib, "$ZodUnknown", 0, is, "$ZodVoid", 0, id, "$ZodXID", 0, tW, "clone", 0, Z, "isValidBase64", 0, t0, "isValidBase64URL", 0, t6, "isValidJWT", 0, t9], 491566), e.i(491566), e.i(305882), e.i(157774), e.i(233541), e.i(358749), e.i(189571), e.i(497198), e.s(["$ZodAny", 0, iu, "$ZodArray", 0, ip, "$ZodAsyncError", 0, r, "$ZodBase64", 0, t4, "$ZodBase64URL", 0, t1, "$ZodBigInt", 0, it, "$ZodBigIntFormat", 0, ii, "$ZodBoolean", 0, ie, "$ZodCIDRv4", 0, tH, "$ZodCIDRv6", 0, tQ, "$ZodCUID", 0, tR, "$ZodCUID2", 0, tF, "$ZodCatch", 0, iB, "$ZodCheck", 0, to, "$ZodCheckBigIntFormat", 0, tm, "$ZodCheckEndsWith", 0, tw, "$ZodCheckGreaterThan", 0, tl, "$ZodCheckIncludes", 0, tk, "$ZodCheckLengthEquals", 0, th, "$ZodCheckLessThan", 0, ts, "$ZodCheckLowerCase", 0, tb, "$ZodCheckMaxLength", 0, tg, "$ZodCheckMaxSize", 0, tf, "$ZodCheckMimeType", 0, tZ, "$ZodCheckMinLength", 0, t$, "$ZodCheckMinSize", 0, tp, "$ZodCheckMultipleOf", 0, td, "$ZodCheckNumberFormat", 0, tc, "$ZodCheckOverwrite", 0, tU, "$ZodCheckProperty", 0, tS, "$ZodCheckRegex", 0, ty, "$ZodCheckSizeEquals", 0, tv, "$ZodCheckStartsWith", 0, tI, "$ZodCheckStringFormat", 0, t_, "$ZodCheckUpperCase", 0, tx, "$ZodCodec", 0, iX, "$ZodCustom", 0, i2, "$ZodCustomStringFormat", 0, t7, "$ZodDate", 0, ic, "$ZodDefault", 0, iC, "$ZodDiscriminatedUnion", 0, ix, "$ZodE164", 0, t2, "$ZodEmail", 0, tM, "$ZodEmoji", 0, tC, "$ZodEncodeError", 0, a, "$ZodEnum", 0, iN, "$ZodError", 0, W, "$ZodFile", 0, iP, "$ZodFunction", 0, i4, "$ZodGUID", 0, tE, "$ZodIPv4", 0, tq, "$ZodIPv6", 0, tY, "$ZodISODate", 0, tK, "$ZodISODateTime", 0, tG, "$ZodISODuration", 0, tX, "$ZodISOTime", 0, tV, "$ZodIntersection", 0, ik, "$ZodJWT", 0, t3, "$ZodKSUID", 0, tB, "$ZodLazy", 0, i1, "$ZodLiteral", 0, iD, "$ZodMap", 0, iZ, "$ZodNaN", 0, iG, "$ZodNanoID", 0, tL, "$ZodNever", 0, il, "$ZodNonOptional", 0, iF, "$ZodNull", 0, io, "$ZodNullable", 0, iT, "$ZodNumber", 0, t5, "$ZodNumberFormat", 0, t8, "$ZodObject", 0, ih, "$ZodObjectJIT", 0, i_, "$ZodOptional", 0, iM, "$ZodPipe", 0, iK, "$ZodPrefault", 0, iR, "$ZodPromise", 0, i6, "$ZodReadonly", 0, iH, "$ZodRealError", 0, B, "$ZodRecord", 0, iS, "$ZodRegistry", 0, r0, "$ZodSet", 0, iO, "$ZodString", 0, tD, "$ZodStringFormat", 0, tP, "$ZodSuccess", 0, iW, "$ZodSymbol", 0, ir, "$ZodTemplateLiteral", 0, i0, "$ZodTransform", 0, iE, "$ZodTuple", 0, iw, "$ZodType", 0, tN, "$ZodULID", 0, tJ, "$ZodURL", 0, tT, "$ZodUUID", 0, tA, "$ZodUndefined", 0, ia, "$ZodUnion", 0, ib, "$ZodUnknown", 0, is, "$ZodVoid", 0, id, "$ZodXID", 0, tW, "$brand", 0, n, "$constructor", 0, i, "$input", 0, rQ, "$output", 0, rH, "Doc", 0, tO, "JSONSchema", 0, r9, "JSONSchemaGenerator", 0, r1, "NEVER", 0, t, "TimePrecision", 0, nO, "_any", 0, nY, "_array", 0, rx, "_base64", 0, nz, "_base64url", 0, nS, "_bigint", 0, nW, "_boolean", 0, nF, "_catch", 0, rL, "_check", 0, rX, "_cidrv4", 0, nI, "_cidrv6", 0, nw, "_coercedBigint", 0, nB, "_coercedBoolean", 0, nJ, "_coercedDate", 0, n6, "_coercedNumber", 0, nA, "_coercedString", 0, nu, "_cuid", 0, n$, "_cuid2", 0, nh, "_custom", 0, rG, "_date", 0, n4, "_decode", 0, eu, "_decodeAsync", 0, ec, "_default", 0, rM, "_discriminatedUnion", 0, rI, "_e164", 0, nZ, "_email", 0, ns, "_emoji", 0, nv, "_encode", 0, ea, "_encodeAsync", 0, el, "_endsWith", 0, rp, "_enum", 0, rO, "_file", 0, rD, "_float32", 0, nT, "_float64", 0, nC, "_gt", 0, n3, "_gte", 0, n7, "_guid", 0, nl, "_includes", 0, rm, "_int", 0, nM, "_int32", 0, nL, "_int64", 0, nG, "_intersection", 0, rw, "_ipv4", 0, nx, "_ipv6", 0, nk, "_isoDate", 0, nN, "_isoDateTime", 0, nj, "_isoDuration", 0, nP, "_isoTime", 0, nD, "_jwt", 0, nU, "_ksuid", 0, nb, "_lazy", 0, rW, "_length", 0, rs, "_literal", 0, rN, "_lowercase", 0, rd, "_lt", 0, n2, "_lte", 0, n9, "_map", 0, rZ, "_max", 0, n9, "_maxLength", 0, ro, "_maxSize", 0, rn, "_mime", 0, rg, "_min", 0, n7, "_minLength", 0, ru, "_minSize", 0, rr, "_multipleOf", 0, ri, "_nan", 0, n1, "_nanoid", 0, ng, "_nativeEnum", 0, rj, "_negative", 0, n8, "_never", 0, nQ, "_nonnegative", 0, rt, "_nonoptional", 0, rT, "_nonpositive", 0, re, "_normalize", 0, rh, "_null", 0, nq, "_nullable", 0, rA, "_number", 0, nE, "_optional", 0, rE, "_overwrite", 0, r$, "_parse", 0, Y, "_parseAsync", 0, Q, "_pipe", 0, rR, "_positive", 0, n5, "_promise", 0, rB, "_property", 0, rv, "_readonly", 0, rF, "_record", 0, rS, "_refine", 0, rK, "_regex", 0, rl, "_safeDecode", 0, ev, "_safeDecodeAsync", 0, e_, "_safeEncode", 0, ef, "_safeEncodeAsync", 0, e$, "_safeParse", 0, et, "_safeParseAsync", 0, en, "_set", 0, rU, "_size", 0, ra, "_startsWith", 0, rf, "_string", 0, no, "_stringFormat", 0, rY, "_stringbool", 0, rq, "_success", 0, rC, "_superRefine", 0, rV, "_symbol", 0, nV, "_templateLiteral", 0, rJ, "_toLowerCase", 0, ry, "_toUpperCase", 0, rb, "_transform", 0, rP, "_trim", 0, r_, "_tuple", 0, rz, "_uint32", 0, nR, "_uint64", 0, nK, "_ulid", 0, n_, "_undefined", 0, nX, "_union", 0, rk, "_unknown", 0, nH, "_uppercase", 0, rc, "_url", 0, np, "_uuid", 0, nd, "_uuidv4", 0, nc, "_uuidv6", 0, nm, "_uuidv7", 0, nf, "_void", 0, n0, "_xid", 0, ny, "clone", 0, Z, "config", 0, u, "decode", 0, es, "decodeAsync", 0, em, "encode", 0, eo, "encodeAsync", 0, ed, "flattenError", 0, G, "formatError", 0, K, "globalConfig", 0, o, "globalRegistry", 0, r6, "isValidBase64", 0, t0, "isValidBase64URL", 0, t6, "isValidJWT", 0, t9, "locales", 0, na, "parse", 0, H, "parseAsync", 0, ee, "prettifyError", 0, q, "regexes", 0, i7, "registry", 0, r4, "safeDecode", 0, eg, "safeDecodeAsync", 0, ey, "safeEncode", 0, ep, "safeEncodeAsync", 0, eh, "safeParse", 0, ei, "safeParseAsync", 0, er, "toDotPath", 0, X, "toJSONSchema", 0, r2, "treeifyError", 0, V, "util", 0, i3, "version", 0, tj], 72864);
    var r3 = e.i(72864);
    e.s([], 881695);
    var r7 = i7,
        r5 = i3;
    let r8 = i("ZodMiniType", (e, t) => {
            if (!e._zod) throw Error("Uninitialized schema in ZodMiniType.");
            tN.init(e, t), e.def = t, e.type = t.type, e.parse = (t, i) => H(e, t, i, {
                callee: e.parse
            }), e.safeParse = (t, i) => ei(e, t, i), e.parseAsync = async (t, i) => ee(e, t, i, {
                callee: e.parseAsync
            }), e.safeParseAsync = async (t, i) => er(e, t, i), e.check = function() {
                for (var i = arguments.length, n = Array(i), r = 0; r < i; r++) n[r] = arguments[r];
                return e.clone({
                    ...t,
                    checks: [...t.checks ?? [], ...n.map(e => "function" == typeof e ? {
                        _zod: {
                            check: e,
                            def: {
                                check: "custom"
                            },
                            onattach: []
                        }
                    } : e)]
                })
            }, e.clone = (t, i) => Z(e, t, i), e.brand = () => e, e.register = (t, i) => (t.add(e, i), e)
        }),
        ae = i("ZodMiniString", (e, t) => {
            tD.init(e, t), r8.init(e, t)
        });

    function at(e) {
        return no(ae, e)
    }
    let ai = i("ZodMiniStringFormat", (e, t) => {
            tP.init(e, t), ae.init(e, t)
        }),
        an = i("ZodMiniEmail", (e, t) => {
            tM.init(e, t), ai.init(e, t)
        });

    function ar(e) {
        return ns(an, e)
    }
    let aa = i("ZodMiniGUID", (e, t) => {
        tE.init(e, t), ai.init(e, t)
    });

    function ao(e) {
        return nl(aa, e)
    }
    let au = i("ZodMiniUUID", (e, t) => {
        tA.init(e, t), ai.init(e, t)
    });

    function as(e) {
        return nd(au, e)
    }

    function al(e) {
        return nc(au, e)
    }

    function ad(e) {
        return nm(au, e)
    }

    function ac(e) {
        return nf(au, e)
    }
    let am = i("ZodMiniURL", (e, t) => {
        tT.init(e, t), ai.init(e, t)
    });

    function af(e) {
        return np(am, e)
    }

    function ap(e) {
        return np(am, {
            protocol: /^https?$/,
            hostname: r7.domain,
            ...r5.normalizeParams(e)
        })
    }
    let av = i("ZodMiniEmoji", (e, t) => {
        tC.init(e, t), ai.init(e, t)
    });

    function ag(e) {
        return nv(av, e)
    }
    let a$ = i("ZodMiniNanoID", (e, t) => {
        tL.init(e, t), ai.init(e, t)
    });

    function ah(e) {
        return ng(a$, e)
    }
    let a_ = i("ZodMiniCUID", (e, t) => {
        tR.init(e, t), ai.init(e, t)
    });

    function ay(e) {
        return n$(a_, e)
    }
    let ab = i("ZodMiniCUID2", (e, t) => {
        tF.init(e, t), ai.init(e, t)
    });

    function ax(e) {
        return nh(ab, e)
    }
    let ak = i("ZodMiniULID", (e, t) => {
        tJ.init(e, t), ai.init(e, t)
    });

    function aI(e) {
        return n_(ak, e)
    }
    let aw = i("ZodMiniXID", (e, t) => {
        tW.init(e, t), ai.init(e, t)
    });

    function az(e) {
        return ny(aw, e)
    }
    let aS = i("ZodMiniKSUID", (e, t) => {
        tB.init(e, t), ai.init(e, t)
    });

    function aZ(e) {
        return nb(aS, e)
    }
    let aU = i("ZodMiniIPv4", (e, t) => {
        tq.init(e, t), ai.init(e, t)
    });

    function aO(e) {
        return nx(aU, e)
    }
    let aj = i("ZodMiniIPv6", (e, t) => {
        tY.init(e, t), ai.init(e, t)
    });

    function aN(e) {
        return nk(aj, e)
    }
    let aD = i("ZodMiniCIDRv4", (e, t) => {
        tH.init(e, t), ai.init(e, t)
    });

    function aP(e) {
        return nI(aD, e)
    }
    let aE = i("ZodMiniCIDRv6", (e, t) => {
        tQ.init(e, t), ai.init(e, t)
    });

    function aA(e) {
        return nw(aE, e)
    }
    let aM = i("ZodMiniBase64", (e, t) => {
        t4.init(e, t), ai.init(e, t)
    });

    function aT(e) {
        return nz(aM, e)
    }
    let aC = i("ZodMiniBase64URL", (e, t) => {
        t1.init(e, t), ai.init(e, t)
    });

    function aL(e) {
        return nS(aC, e)
    }
    let aR = i("ZodMiniE164", (e, t) => {
        t2.init(e, t), ai.init(e, t)
    });

    function aF(e) {
        return nZ(aR, e)
    }
    let aJ = i("ZodMiniJWT", (e, t) => {
        t3.init(e, t), ai.init(e, t)
    });

    function aW(e) {
        return nU(aJ, e)
    }
    let aB = i("ZodMiniCustomStringFormat", (e, t) => {
        t7.init(e, t), ai.init(e, t)
    });

    function aG(e, t) {
        let i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return rY(aB, e, t, i)
    }

    function aK(e) {
        return rY(aB, "hostname", r7.hostname, e)
    }

    function aV(e) {
        return rY(aB, "hex", r7.hex, e)
    }

    function aX(e, t) {
        let i = t?.enc ?? "hex",
            n = `${e}_${i}`,
            r = r7[n];
        if (!r) throw Error(`Unrecognized hash format: ${n}`);
        return rY(aB, n, r, t)
    }
    let aq = i("ZodMiniNumber", (e, t) => {
        t5.init(e, t), r8.init(e, t)
    });

    function aY(e) {
        return nE(aq, e)
    }
    let aH = i("ZodMiniNumberFormat", (e, t) => {
        t8.init(e, t), aq.init(e, t)
    });

    function aQ(e) {
        return nM(aH, e)
    }

    function a0(e) {
        return nT(aH, e)
    }

    function a4(e) {
        return nC(aH, e)
    }

    function a6(e) {
        return nL(aH, e)
    }

    function a1(e) {
        return nR(aH, e)
    }
    let a2 = i("ZodMiniBoolean", (e, t) => {
        ie.init(e, t), r8.init(e, t)
    });

    function a9(e) {
        return nF(a2, e)
    }
    let a3 = i("ZodMiniBigInt", (e, t) => {
        it.init(e, t), r8.init(e, t)
    });

    function a7(e) {
        return nW(a3, e)
    }
    let a5 = i("ZodMiniBigIntFormat", (e, t) => {
        ii.init(e, t), a3.init(e, t)
    });

    function a8(e) {
        return nG(a5, e)
    }

    function oe(e) {
        return nK(a5, e)
    }
    let ot = i("ZodMiniSymbol", (e, t) => {
        ir.init(e, t), r8.init(e, t)
    });

    function oi(e) {
        return nV(ot, e)
    }
    let on = i("ZodMiniUndefined", (e, t) => {
        ia.init(e, t), r8.init(e, t)
    });

    function or(e) {
        return nX(on, e)
    }
    let oa = i("ZodMiniNull", (e, t) => {
        io.init(e, t), r8.init(e, t)
    });

    function oo(e) {
        return nq(oa, e)
    }
    let ou = i("ZodMiniAny", (e, t) => {
        iu.init(e, t), r8.init(e, t)
    });

    function os() {
        return nY(ou)
    }
    let ol = i("ZodMiniUnknown", (e, t) => {
        is.init(e, t), r8.init(e, t)
    });

    function od() {
        return nH(ol)
    }
    let oc = i("ZodMiniNever", (e, t) => {
        il.init(e, t), r8.init(e, t)
    });

    function om(e) {
        return nQ(oc, e)
    }
    let of = i("ZodMiniVoid", (e, t) => {
        id.init(e, t), r8.init(e, t)
    });

    function op(e) {
        return n0(of, e)
    }
    let ov = i("ZodMiniDate", (e, t) => {
        ic.init(e, t), r8.init(e, t)
    });

    function og(e) {
        return n4(ov, e)
    }
    let o$ = i("ZodMiniArray", (e, t) => {
        ip.init(e, t), r8.init(e, t)
    });

    function oh(e, t) {
        return new o$({
            type: "array",
            element: e,
            ...r5.normalizeParams(t)
        })
    }

    function o_(e) {
        return oV(Object.keys(e._zod.def.shape))
    }
    let oy = i("ZodMiniObject", (e, t) => {
        ih.init(e, t), r8.init(e, t), r5.defineLazy(e, "shape", () => t.shape)
    });

    function ob(e, t) {
        return new oy({
            type: "object",
            shape: e ?? {},
            ...r5.normalizeParams(t)
        })
    }

    function ox(e, t) {
        return new oy({
            type: "object",
            shape: e,
            catchall: om(),
            ...r5.normalizeParams(t)
        })
    }

    function ok(e, t) {
        return new oy({
            type: "object",
            shape: e,
            catchall: od(),
            ...r5.normalizeParams(t)
        })
    }

    function oI(e, t) {
        return r5.extend(e, t)
    }

    function ow(e, t) {
        return r5.safeExtend(e, t)
    }

    function oz(e, t) {
        return r5.extend(e, t)
    }

    function oS(e, t) {
        return r5.pick(e, t)
    }

    function oZ(e, t) {
        return r5.omit(e, t)
    }

    function oU(e, t) {
        return r5.partial(o6, e, t)
    }

    function oO(e, t) {
        return r5.required(ut, e, t)
    }

    function oj(e, t) {
        return e.clone({
            ...e._zod.def,
            catchall: t
        })
    }
    let oN = i("ZodMiniUnion", (e, t) => {
        ib.init(e, t), r8.init(e, t)
    });

    function oD(e, t) {
        return new oN({
            type: "union",
            options: e,
            ...r5.normalizeParams(t)
        })
    }
    let oP = i("ZodMiniDiscriminatedUnion", (e, t) => {
        ix.init(e, t), r8.init(e, t)
    });

    function oE(e, t, i) {
        return new oP({
            type: "union",
            options: t,
            discriminator: e,
            ...r5.normalizeParams(i)
        })
    }
    let oA = i("ZodMiniIntersection", (e, t) => {
        ik.init(e, t), r8.init(e, t)
    });

    function oM(e, t) {
        return new oA({
            type: "intersection",
            left: e,
            right: t
        })
    }
    let oT = i("ZodMiniTuple", (e, t) => {
        iw.init(e, t), r8.init(e, t)
    });

    function oC(e, t, i) {
        let n = t instanceof tN,
            r = n ? i : t;
        return new oT({
            type: "tuple",
            items: e,
            rest: n ? t : null,
            ...r5.normalizeParams(r)
        })
    }
    let oL = i("ZodMiniRecord", (e, t) => {
        iS.init(e, t), r8.init(e, t)
    });

    function oR(e, t, i) {
        return new oL({
            type: "record",
            keyType: e,
            valueType: t,
            ...r5.normalizeParams(i)
        })
    }

    function oF(e, t, i) {
        let n = Z(e);
        return n._zod.values = void 0, new oL({
            type: "record",
            keyType: n,
            valueType: t,
            ...r5.normalizeParams(i)
        })
    }
    let oJ = i("ZodMiniMap", (e, t) => {
        iZ.init(e, t), r8.init(e, t)
    });

    function oW(e, t, i) {
        return new oJ({
            type: "map",
            keyType: e,
            valueType: t,
            ...r5.normalizeParams(i)
        })
    }
    let oB = i("ZodMiniSet", (e, t) => {
        iO.init(e, t), r8.init(e, t)
    });

    function oG(e, t) {
        return new oB({
            type: "set",
            valueType: e,
            ...r5.normalizeParams(t)
        })
    }
    let oK = i("ZodMiniEnum", (e, t) => {
        iN.init(e, t), r8.init(e, t), e.options = Object.values(t.entries)
    });

    function oV(e, t) {
        return new oK({
            type: "enum",
            entries: Array.isArray(e) ? Object.fromEntries(e.map(e => [e, e])) : e,
            ...r5.normalizeParams(t)
        })
    }

    function oX(e, t) {
        return new oK({
            type: "enum",
            entries: e,
            ...r5.normalizeParams(t)
        })
    }
    let oq = i("ZodMiniLiteral", (e, t) => {
        iD.init(e, t), r8.init(e, t)
    });

    function oY(e, t) {
        return new oq({
            type: "literal",
            values: Array.isArray(e) ? e : [e],
            ...r5.normalizeParams(t)
        })
    }
    let oH = i("ZodMiniFile", (e, t) => {
        iP.init(e, t), r8.init(e, t)
    });

    function oQ(e) {
        return rD(oH, e)
    }
    let o0 = i("ZodMiniTransform", (e, t) => {
        iE.init(e, t), r8.init(e, t)
    });

    function o4(e) {
        return new o0({
            type: "transform",
            transform: e
        })
    }
    let o6 = i("ZodMiniOptional", (e, t) => {
        iM.init(e, t), r8.init(e, t)
    });

    function o1(e) {
        return new o6({
            type: "optional",
            innerType: e
        })
    }
    let o2 = i("ZodMiniNullable", (e, t) => {
        iT.init(e, t), r8.init(e, t)
    });

    function o9(e) {
        return new o2({
            type: "nullable",
            innerType: e
        })
    }

    function o3(e) {
        return o1(o9(e))
    }
    let o7 = i("ZodMiniDefault", (e, t) => {
        iC.init(e, t), r8.init(e, t)
    });

    function o5(e, t) {
        return new o7({
            type: "default",
            innerType: e,
            get defaultValue() {
                return "function" == typeof t ? t() : r5.shallowClone(t)
            }
        })
    }
    let o8 = i("ZodMiniPrefault", (e, t) => {
        iR.init(e, t), r8.init(e, t)
    });

    function ue(e, t) {
        return new o8({
            type: "prefault",
            innerType: e,
            get defaultValue() {
                return "function" == typeof t ? t() : r5.shallowClone(t)
            }
        })
    }
    let ut = i("ZodMiniNonOptional", (e, t) => {
        iF.init(e, t), r8.init(e, t)
    });

    function ui(e, t) {
        return new ut({
            type: "nonoptional",
            innerType: e,
            ...r5.normalizeParams(t)
        })
    }
    let un = i("ZodMiniSuccess", (e, t) => {
        iW.init(e, t), r8.init(e, t)
    });

    function ur(e) {
        return new un({
            type: "success",
            innerType: e
        })
    }
    let ua = i("ZodMiniCatch", (e, t) => {
        iB.init(e, t), r8.init(e, t)
    });

    function uo(e, t) {
        return new ua({
            type: "catch",
            innerType: e,
            catchValue: "function" == typeof t ? t : () => t
        })
    }
    let uu = i("ZodMiniNaN", (e, t) => {
        iG.init(e, t), r8.init(e, t)
    });

    function us(e) {
        return n1(uu, e)
    }
    let ul = i("ZodMiniPipe", (e, t) => {
        iK.init(e, t), r8.init(e, t)
    });

    function ud(e, t) {
        return new ul({
            type: "pipe",
            in: e,
            out: t
        })
    }
    let uc = i("ZodMiniCodec", (e, t) => {
        ul.init(e, t), iX.init(e, t)
    });

    function um(e, t, i) {
        return new uc({
            type: "pipe",
            in: e,
            out: t,
            transform: i.decode,
            reverseTransform: i.encode
        })
    }
    let uf = i("ZodMiniReadonly", (e, t) => {
        iH.init(e, t), r8.init(e, t)
    });

    function up(e) {
        return new uf({
            type: "readonly",
            innerType: e
        })
    }
    let uv = i("ZodMiniTemplateLiteral", (e, t) => {
        i0.init(e, t), r8.init(e, t)
    });

    function ug(e, t) {
        return new uv({
            type: "template_literal",
            parts: e,
            ...r5.normalizeParams(t)
        })
    }
    let u$ = i("ZodMiniLazy", (e, t) => {
        i1.init(e, t), r8.init(e, t)
    });

    function uh(e) {
        return new u$({
            type: "lazy",
            getter: e
        })
    }
    let u_ = i("ZodMiniPromise", (e, t) => {
        i6.init(e, t), r8.init(e, t)
    });

    function uy(e) {
        return new u_({
            type: "promise",
            innerType: e
        })
    }
    let ub = i("ZodMiniCustom", (e, t) => {
        i2.init(e, t), r8.init(e, t)
    });

    function ux(e, t) {
        let i = new to({
            check: "custom",
            ...r5.normalizeParams(t)
        });
        return i._zod.check = e, i
    }

    function uk(e, t) {
        return rG(ub, e ?? (() => !0), t)
    }

    function uI(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        return rK(ub, e, t)
    }

    function uw(e) {
        return rV(e)
    }

    function uz(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {
                error: `Input not instance of ${e.name}`
            },
            i = uk(t => t instanceof e, t);
        return i._zod.bag.Class = e, i
    }
    let uS = function() {
        for (var e = arguments.length, t = Array(e), i = 0; i < e; i++) t[i] = arguments[i];
        return rq({
            Codec: uc,
            Boolean: a2,
            String: ae
        }, ...t)
    };

    function uZ() {
        let e = uh(() => oD([at(), aY(), a9(), oo(), oh(e), oR(at(), e)]));
        return e
    }
    let uU = i("ZodMiniFunction", (e, t) => {
        i4.init(e, t), r8.init(e, t)
    });

    function uO(e) {
        return new uU({
            type: "function",
            input: Array.isArray(e?.input) ? oC(e?.input) : e?.input ?? oh(od()),
            output: e?.output ?? od()
        })
    }
    e.s(["ZodMiniAny", 0, ou, "ZodMiniArray", 0, o$, "ZodMiniBase64", 0, aM, "ZodMiniBase64URL", 0, aC, "ZodMiniBigInt", 0, a3, "ZodMiniBigIntFormat", 0, a5, "ZodMiniBoolean", 0, a2, "ZodMiniCIDRv4", 0, aD, "ZodMiniCIDRv6", 0, aE, "ZodMiniCUID", 0, a_, "ZodMiniCUID2", 0, ab, "ZodMiniCatch", 0, ua, "ZodMiniCodec", 0, uc, "ZodMiniCustom", 0, ub, "ZodMiniCustomStringFormat", 0, aB, "ZodMiniDate", 0, ov, "ZodMiniDefault", 0, o7, "ZodMiniDiscriminatedUnion", 0, oP, "ZodMiniE164", 0, aR, "ZodMiniEmail", 0, an, "ZodMiniEmoji", 0, av, "ZodMiniEnum", 0, oK, "ZodMiniFile", 0, oH, "ZodMiniFunction", 0, uU, "ZodMiniGUID", 0, aa, "ZodMiniIPv4", 0, aU, "ZodMiniIPv6", 0, aj, "ZodMiniIntersection", 0, oA, "ZodMiniJWT", 0, aJ, "ZodMiniKSUID", 0, aS, "ZodMiniLazy", 0, u$, "ZodMiniLiteral", 0, oq, "ZodMiniMap", 0, oJ, "ZodMiniNaN", 0, uu, "ZodMiniNanoID", 0, a$, "ZodMiniNever", 0, oc, "ZodMiniNonOptional", 0, ut, "ZodMiniNull", 0, oa, "ZodMiniNullable", 0, o2, "ZodMiniNumber", 0, aq, "ZodMiniNumberFormat", 0, aH, "ZodMiniObject", 0, oy, "ZodMiniOptional", 0, o6, "ZodMiniPipe", 0, ul, "ZodMiniPrefault", 0, o8, "ZodMiniPromise", 0, u_, "ZodMiniReadonly", 0, uf, "ZodMiniRecord", 0, oL, "ZodMiniSet", 0, oB, "ZodMiniString", 0, ae, "ZodMiniStringFormat", 0, ai, "ZodMiniSuccess", 0, un, "ZodMiniSymbol", 0, ot, "ZodMiniTemplateLiteral", 0, uv, "ZodMiniTransform", 0, o0, "ZodMiniTuple", 0, oT, "ZodMiniType", 0, r8, "ZodMiniULID", 0, ak, "ZodMiniURL", 0, am, "ZodMiniUUID", 0, au, "ZodMiniUndefined", 0, on, "ZodMiniUnion", 0, oN, "ZodMiniUnknown", 0, ol, "ZodMiniVoid", 0, of, "ZodMiniXID", 0, aw, "_default", 0, o5, "_function", 0, uO, "any", 0, os, "array", 0, oh, "base64", 0, aT, "base64url", 0, aL, "bigint", 0, a7, "boolean", 0, a9, "catch", 0, uo, "catchall", 0, oj, "check", 0, ux, "cidrv4", 0, aP, "cidrv6", 0, aA, "codec", 0, um, "cuid", 0, ay, "cuid2", 0, ax, "custom", 0, uk, "date", 0, og, "discriminatedUnion", 0, oE, "e164", 0, aF, "email", 0, ar, "emoji", 0, ag, "enum", 0, oV, "extend", 0, oI, "file", 0, oQ, "float32", 0, a0, "float64", 0, a4, "function", 0, uO, "guid", 0, ao, "hash", 0, aX, "hex", 0, aV, "hostname", 0, aK, "httpUrl", 0, ap, "instanceof", 0, uz, "int", 0, aQ, "int32", 0, a6, "int64", 0, a8, "intersection", 0, oM, "ipv4", 0, aO, "ipv6", 0, aN, "json", 0, uZ, "jwt", 0, aW, "keyof", 0, o_, "ksuid", 0, aZ, "lazy", 0, uh, "literal", 0, oY, "looseObject", 0, ok, "map", 0, oW, "merge", 0, oz, "nan", 0, us, "nanoid", 0, ah, "nativeEnum", 0, oX, "never", 0, om, "nonoptional", 0, ui, "null", 0, oo, "nullable", 0, o9, "nullish", 0, o3, "number", 0, aY, "object", 0, ob, "omit", 0, oZ, "optional", 0, o1, "partial", 0, oU, "partialRecord", 0, oF, "pick", 0, oS, "pipe", 0, ud, "prefault", 0, ue, "promise", 0, uy, "readonly", 0, up, "record", 0, oR, "refine", 0, uI, "required", 0, oO, "safeExtend", 0, ow, "set", 0, oG, "strictObject", 0, ox, "string", 0, at, "stringFormat", 0, aG, "stringbool", 0, uS, "success", 0, ur, "superRefine", 0, uw, "symbol", 0, oi, "templateLiteral", 0, ug, "transform", 0, o4, "tuple", 0, oC, "uint32", 0, a1, "uint64", 0, oe, "ulid", 0, aI, "undefined", 0, or, "union", 0, oD, "unknown", 0, od, "url", 0, af, "uuid", 0, as, "uuidv4", 0, al, "uuidv6", 0, ad, "uuidv7", 0, ac, "void", 0, op, "xid", 0, az], 874296), e.s([], 873147);
    let uj = i("$ZodISODateTime", (e, t) => {
            tG.init(e, t), ai.init(e, t)
        }),
        uN = i("$ZodISODate", (e, t) => {
            tK.init(e, t), ai.init(e, t)
        }),
        uD = i("$ZodISOTime", (e, t) => {
            tV.init(e, t), ai.init(e, t)
        }),
        uP = i("$ZodISODuration", (e, t) => {
            tX.init(e, t), ai.init(e, t)
        });
    e.s(["ZodMiniISODate", 0, uN, "ZodMiniISODateTime", 0, uj, "ZodMiniISODuration", 0, uP, "ZodMiniISOTime", 0, uD, "date", 0, function(e) {
        return nN(uN, e)
    }, "datetime", 0, function(e) {
        return nj(uj, e)
    }, "duration", 0, function(e) {
        return nP(uP, e)
    }, "time", 0, function(e) {
        return nD(uD, e)
    }], 617562);
    var uE = e.i(617562);
    e.s(["bigint", 0, function(e) {
        return nB(a3, e)
    }, "boolean", 0, function(e) {
        return nJ(a2, e)
    }, "date", 0, function(e) {
        return n6(ov, e)
    }, "number", 0, function(e) {
        return nA(aq, e)
    }, "string", 0, function(e) {
        return nu(ae, e)
    }], 848612);
    var uA = e.i(848612);
    e.s([], 56164), e.i(56164), e.i(881695), e.s(["decode", 0, es, "decodeAsync", 0, em, "encode", 0, eo, "encodeAsync", 0, ed, "parse", 0, H, "parseAsync", 0, ee, "safeDecode", 0, eg, "safeDecodeAsync", 0, ey, "safeEncode", 0, ep, "safeEncodeAsync", 0, eh, "safeParse", 0, ei, "safeParseAsync", 0, er], 343558), e.i(343558), e.i(874296), e.i(873147), e.s(["endsWith", 0, rp, "gt", 0, n3, "gte", 0, n7, "includes", 0, rm, "length", 0, rs, "lowercase", 0, rd, "lt", 0, n2, "lte", 0, n9, "maxLength", 0, ro, "maxSize", 0, rn, "maximum", 0, n9, "mime", 0, rg, "minLength", 0, ru, "minSize", 0, rr, "minimum", 0, n7, "multipleOf", 0, ri, "negative", 0, n8, "nonnegative", 0, rt, "nonpositive", 0, re, "normalize", 0, rh, "overwrite", 0, r$, "positive", 0, n5, "property", 0, rv, "regex", 0, rl, "size", 0, ra, "startsWith", 0, rf, "toLowerCase", 0, ry, "toUpperCase", 0, rb, "trim", 0, r_, "uppercase", 0, rc], 534088), e.i(534088);
    var r7 = i7,
        r5 = i3;
    e.s(["$brand", 0, n, "$input", 0, rQ, "$output", 0, rH, "NEVER", 0, t, "TimePrecision", 0, nO, "ZodMiniAny", 0, ou, "ZodMiniArray", 0, o$, "ZodMiniBase64", 0, aM, "ZodMiniBase64URL", 0, aC, "ZodMiniBigInt", 0, a3, "ZodMiniBigIntFormat", 0, a5, "ZodMiniBoolean", 0, a2, "ZodMiniCIDRv4", 0, aD, "ZodMiniCIDRv6", 0, aE, "ZodMiniCUID", 0, a_, "ZodMiniCUID2", 0, ab, "ZodMiniCatch", 0, ua, "ZodMiniCodec", 0, uc, "ZodMiniCustom", 0, ub, "ZodMiniCustomStringFormat", 0, aB, "ZodMiniDate", 0, ov, "ZodMiniDefault", 0, o7, "ZodMiniDiscriminatedUnion", 0, oP, "ZodMiniE164", 0, aR, "ZodMiniEmail", 0, an, "ZodMiniEmoji", 0, av, "ZodMiniEnum", 0, oK, "ZodMiniFile", 0, oH, "ZodMiniFunction", 0, uU, "ZodMiniGUID", 0, aa, "ZodMiniIPv4", 0, aU, "ZodMiniIPv6", 0, aj, "ZodMiniISODate", 0, uN, "ZodMiniISODateTime", 0, uj, "ZodMiniISODuration", 0, uP, "ZodMiniISOTime", 0, uD, "ZodMiniIntersection", 0, oA, "ZodMiniJWT", 0, aJ, "ZodMiniKSUID", 0, aS, "ZodMiniLazy", 0, u$, "ZodMiniLiteral", 0, oq, "ZodMiniMap", 0, oJ, "ZodMiniNaN", 0, uu, "ZodMiniNanoID", 0, a$, "ZodMiniNever", 0, oc, "ZodMiniNonOptional", 0, ut, "ZodMiniNull", 0, oa, "ZodMiniNullable", 0, o2, "ZodMiniNumber", 0, aq, "ZodMiniNumberFormat", 0, aH, "ZodMiniObject", 0, oy, "ZodMiniOptional", 0, o6, "ZodMiniPipe", 0, ul, "ZodMiniPrefault", 0, o8, "ZodMiniPromise", 0, u_, "ZodMiniReadonly", 0, uf, "ZodMiniRecord", 0, oL, "ZodMiniSet", 0, oB, "ZodMiniString", 0, ae, "ZodMiniStringFormat", 0, ai, "ZodMiniSuccess", 0, un, "ZodMiniSymbol", 0, ot, "ZodMiniTemplateLiteral", 0, uv, "ZodMiniTransform", 0, o0, "ZodMiniTuple", 0, oT, "ZodMiniType", 0, r8, "ZodMiniULID", 0, ak, "ZodMiniURL", 0, am, "ZodMiniUUID", 0, au, "ZodMiniUndefined", 0, on, "ZodMiniUnion", 0, oN, "ZodMiniUnknown", 0, ol, "ZodMiniVoid", 0, of, "ZodMiniXID", 0, aw, "_default", 0, o5, "_function", 0, uO, "any", 0, os, "array", 0, oh, "base64", 0, aT, "base64url", 0, aL, "bigint", 0, a7, "boolean", 0, a9, "catch", 0, uo, "catchall", 0, oj, "check", 0, ux, "cidrv4", 0, aP, "cidrv6", 0, aA, "clone", 0, Z, "codec", 0, um, "coerce", 0, uA, "config", 0, u, "core", 0, r3, "cuid", 0, ay, "cuid2", 0, ax, "custom", 0, uk, "date", 0, og, "decode", 0, es, "decodeAsync", 0, em, "discriminatedUnion", 0, oE, "e164", 0, aF, "email", 0, ar, "emoji", 0, ag, "encode", 0, eo, "encodeAsync", 0, ed, "endsWith", 0, rp, "enum", 0, oV, "extend", 0, oI, "file", 0, oQ, "flattenError", 0, G, "float32", 0, a0, "float64", 0, a4, "formatError", 0, K, "function", 0, uO, "globalRegistry", 0, r6, "gt", 0, n3, "gte", 0, n7, "guid", 0, ao, "hash", 0, aX, "hex", 0, aV, "hostname", 0, aK, "httpUrl", 0, ap, "includes", 0, rm, "instanceof", 0, uz, "int", 0, aQ, "int32", 0, a6, "int64", 0, a8, "intersection", 0, oM, "ipv4", 0, aO, "ipv6", 0, aN, "iso", 0, uE, "json", 0, uZ, "jwt", 0, aW, "keyof", 0, o_, "ksuid", 0, aZ, "lazy", 0, uh, "length", 0, rs, "literal", 0, oY, "locales", 0, na, "looseObject", 0, ok, "lowercase", 0, rd, "lt", 0, n2, "lte", 0, n9, "map", 0, oW, "maxLength", 0, ro, "maxSize", 0, rn, "maximum", 0, n9, "merge", 0, oz, "mime", 0, rg, "minLength", 0, ru, "minSize", 0, rr, "minimum", 0, n7, "multipleOf", 0, ri, "nan", 0, us, "nanoid", 0, ah, "nativeEnum", 0, oX, "negative", 0, n8, "never", 0, om, "nonnegative", 0, rt, "nonoptional", 0, ui, "nonpositive", 0, re, "normalize", 0, rh, "null", 0, oo, "nullable", 0, o9, "nullish", 0, o3, "number", 0, aY, "object", 0, ob, "omit", 0, oZ, "optional", 0, o1, "overwrite", 0, r$, "parse", 0, H, "parseAsync", 0, ee, "partial", 0, oU, "partialRecord", 0, oF, "pick", 0, oS, "pipe", 0, ud, "positive", 0, n5, "prefault", 0, ue, "prettifyError", 0, q, "promise", 0, uy, "property", 0, rv, "readonly", 0, up, "record", 0, oR, "refine", 0, uI, "regex", 0, rl, "regexes", () => r7, "registry", 0, r4, "required", 0, oO, "safeDecode", 0, eg, "safeDecodeAsync", 0, ey, "safeEncode", 0, ep, "safeEncodeAsync", 0, eh, "safeExtend", 0, ow, "safeParse", 0, ei, "safeParseAsync", 0, er, "set", 0, oG, "size", 0, ra, "startsWith", 0, rf, "strictObject", 0, ox, "string", 0, at, "stringFormat", 0, aG, "stringbool", 0, uS, "success", 0, ur, "superRefine", 0, uw, "symbol", 0, oi, "templateLiteral", 0, ug, "toJSONSchema", 0, r2, "toLowerCase", 0, ry, "toUpperCase", 0, rb, "transform", 0, o4, "treeifyError", 0, V, "trim", 0, r_, "tuple", 0, oC, "uint32", 0, a1, "uint64", 0, oe, "ulid", 0, aI, "undefined", 0, or, "union", 0, oD, "unknown", 0, od, "uppercase", 0, rc, "url", 0, af, "util", () => r5, "uuid", 0, as, "uuidv4", 0, al, "uuidv6", 0, ad, "uuidv7", 0, ac, "void", 0, op, "xid", 0, az], 512447), e.i(512447), e.s([], 350223)
}]);

//# debugId=444df82d-3927-5473-1997-c87c16313284
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/03gevm5g2xdks.js.map