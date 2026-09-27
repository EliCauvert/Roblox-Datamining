;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "cffa6d9a-7909-c113-3830-b6fd3110e2aa")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 157700, t => {
    "use strict";
    let n, r, i, o, u, a, l, s, c, d, f;
    var p, h, m = t.i(459078);

    function v(t) {
        let n = Object.values(t).filter(t => "number" == typeof t);
        return Object.entries(t).filter(t => {
            let [r, i] = t;
            return -1 === n.indexOf(+r)
        }).map(t => {
            let [n, r] = t;
            return r
        })
    }

    function g(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "|";
        return t.map(t => D(t)).join(n)
    }

    function y(t, n) {
        return "bigint" == typeof n ? n.toString() : n
    }
    t.i(416340);
    class _ {
        get value() {
            let t = this._getter;
            return void 0 !== t && (this._value = t(), this._getter = void 0), this._value
        }
        constructor(t) {
            this._getter = t, this._value = void 0
        }
    }

    function b(t) {
        return new _(t)
    }

    function F(t) {
        let n = +!!t.startsWith("^"),
            r = t.endsWith("$") ? t.length - 1 : t.length;
        return t.slice(n, r)
    }

    function w(t, n, r) {
        Object.defineProperty(t, n, {
            value: r,
            writable: !0,
            enumerable: !0,
            configurable: !0
        })
    }

    function z(t) {
        let n = Object.getOwnPropertyDescriptor(t, "shape");
        return (null == n ? void 0 : n.get) ? n.get.raw : null == n ? void 0 : n.value
    }

    function k(t) {
        var n;
        return null != (n = z(t._zod.def)) ? n : t._zod.def.shape
    }

    function O(t, n, r) {
        Object.defineProperty(t, n, {
            get() {
                let t = r();
                return w(this, n, t), t
            },
            enumerable: !0,
            configurable: !0
        })
    }

    function A(t, n, r) {
        n in t ? w(t, n, r) : t[n] = r
    }

    function E(t, n, r, i) {
        let o = k(n);
        for (let u of r) {
            let r = Object.getOwnPropertyDescriptor(o, u);
            r.enumerable && (r.get ? O(t, u, () => {
                let t = n._zod.def.shape[u];
                return i ? i(t, u) : t
            }) : A(t, u, i ? i(r.value, u) : r.value))
        }
    }

    function S() {
        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
        let i = {};
        for (let t of n) Object.assign(i, Object.getOwnPropertyDescriptors(t));
        return Object.defineProperties({}, i)
    }
    let x = "captureStackTrace" in Error ? Error.captureStackTrace : function() {
        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r]
    };

    function j(t) {
        return "object" == typeof t && null !== t && !Array.isArray(t)
    }
    let P = b(() => {
        var t, n;
        if (es.jitless || "u" > typeof navigator && (null == (n = navigator) || null == (t = n.userAgent) ? void 0 : t.includes("Cloudflare"))) return !1;
        try {
            return Function(""), !0
        } catch (t) {
            return !1
        }
    });

    function Z(t) {
        if (!1 === j(t)) return !1;
        let n = t.constructor;
        if (void 0 === n || "function" != typeof n) return !0;
        let r = n.prototype;
        return !1 !== j(r) && !1 !== Object.prototype.hasOwnProperty.call(r, "isPrototypeOf")
    }

    function I(t) {
        return Z(t) ? {
            ...t
        } : Array.isArray(t) ? [...t] : t instanceof Map ? new Map(t) : t instanceof Set ? new Set(t) : t
    }
    let T = new Set(["string", "number", "symbol"]);

    function $(t) {
        return t.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
    }

    function N(t, n, r) {
        let i = new t._zod.constr(null != n ? n : t._zod.def);
        return (!n || (null == r ? void 0 : r.parent)) && (i._zod.parent = t), i
    }

    function C(t) {
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

    function D(t) {
        return "bigint" == typeof t ? t.toString() + "n" : "string" == typeof t ? '"'.concat(t, '"') : "".concat(t)
    }
    let B = {
            safeint: [Number.MIN_SAFE_INTEGER, Number.MAX_SAFE_INTEGER],
            int32: [-0x80000000, 0x7fffffff],
            uint32: [0, 0xffffffff],
            float32: [-34028234663852886e22, 34028234663852886e22],
            float64: [-Number.MAX_VALUE, Number.MAX_VALUE]
        },
        R = {
            int64: [BigInt("-9223372036854775808"), BigInt("9223372036854775807")],
            uint64: [BigInt(0), BigInt("18446744073709551615")]
        };

    function U(t, n) {
        let r = k(t),
            i = [];
        for (let t of Reflect.ownKeys(n)) {
            var o;
            if (!(null == (o = Object.getOwnPropertyDescriptor(r, t)) ? void 0 : o.enumerable)) throw Error('Unrecognized key: "'.concat(String(t), '"'));
            n[t] && i.push(t)
        }
        return i
    }

    function J(t, n) {
        let r = {};
        for (let i of (E(r, t, Reflect.ownKeys(k(t))), Reflect.ownKeys(n))) {
            let t = Object.getOwnPropertyDescriptor(n, i);
            t.enumerable && (t.get ? O(r, i, () => n[i]) : A(r, i, t.value))
        }
        return r
    }

    function M(t, n, r) {
        let i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : "partial",
            o = n._zod.def.checks;
        if (o && o.length > 0) throw Error(".".concat(i, "() cannot be used on object schemas containing refinements"));
        let u = r ? new Set(U(n, r)) : void 0,
            a = {};
        return E(a, n, Reflect.ownKeys(k(n)), t && ((n, r) => u && !u.has(r) ? n : new t({
            type: "optional",
            innerType: n
        }))), N(n, S(n._zod.def, {
            shape: a,
            checks: []
        }))
    }

    function L(t) {
        var n;
        let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
        if (!0 === t.aborted) return !0;
        for (let i = r; i < t.issues.length; i++)
            if ((null == (n = t.issues[i]) ? void 0 : n.continue) !== !0) return !0;
        return !1
    }

    function K(t, n) {
        return n.map(n => (null != n.path || (n.path = []), n.path.unshift(t), n))
    }

    function V(t) {
        return "string" == typeof t ? t : null == t ? void 0 : t.message
    }

    function W(t, n, r) {
        var i;
        for (let o = n; o < t.length; o++) null != (i = t[o]).schema || (i.schema = r)
    }

    function q(t, n, r) {
        var i, o, u, a, l, s, c, d, f, p, h, m, v, g, y;
        let _ = null == (c = t.inst) || null == (s = c._zod) ? void 0 : s.traits;
        (null == _ ? void 0 : _.has("$ZodType")) && (_.has("$ZodCheck") && null != t.schema || (t.schema = t.inst));
        let b = t.schema !== t.inst ? null == (f = t.schema) || null == (d = f._zod.def) ? void 0 : d.error : void 0,
            F = t.message ? t.message : null != (i = null != (o = null != (u = null != (a = null != (l = V(null == (m = t.inst) || null == (h = m._zod.def) || null == (p = h.error) ? void 0 : p.call(h, t))) ? l : V(null == b ? void 0 : b(t))) ? a : V(null == n || null == (v = n.error) ? void 0 : v.call(n, t))) ? u : V(null == (g = r.customError) ? void 0 : g.call(r, t))) ? o : V(null == (y = r.localeError) ? void 0 : y.call(r, t))) ? i : "Invalid input",
            w = {};
        for (let n of Object.keys(t)) "inst" !== n && "schema" !== n && "continue" !== n && "input" !== n && "__proto__" !== n && (w[n] = t[n]);
        return null != w.path || (w.path = []), w.message = F, (null == n ? void 0 : n.reportInput) && (w.input = t.input), w
    }
    let G = /[\uD800-\uDBFF]/;

    function X(t) {
        let n = t.length;
        if (!G.test(t)) return n;
        let r = n;
        for (let i = 0; i < n - 1; i++)(64512 & t.charCodeAt(i)) == 55296 && (64512 & t.charCodeAt(i + 1)) == 56320 && (r--, i++);
        return r
    }

    function H(t) {
        return Array.isArray(t) ? "array" : "string" == typeof t ? "string" : "unknown"
    }

    function Y() {
        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
        let [i, o, u] = n;
        return "string" == typeof i ? {
            message: i,
            code: "custom",
            input: o,
            inst: u
        } : {
            ...i
        }
    }

    function Q(t, n, r) {
        let i = !(arguments.length > 3) || void 0 === arguments[3] || arguments[3];
        return Object.defineProperty(t, n, {
            configurable: !0,
            writable: !0,
            enumerable: i,
            value: r
        }), r
    }

    function ee(t, n) {
        for (let r in t) {
            let i = t[r];
            Object.defineProperty(n, r, {
                configurable: !0,
                enumerable: !0,
                get() {
                    return Q(this, r, i(this))
                },
                set(t) {
                    Q(this, r, t)
                }
            })
        }
        return n
    }
    let et = !1,
        en = {
            configurable: !0,
            get() {
                et = !0
            }
        };

    function er(t, r, i) {
        let o = Object.getPrototypeOf(t._zod);
        if (r in o && n !== t._zod) {
            n = void 0;
            return
        }
        n = t._zod, Object.defineProperty(o, r, {
            configurable: !0,
            get() {
                Object.defineProperty(this, r, en);
                let t = et;
                et = !1;
                try {
                    let n = i(this);
                    return et ? delete this[r] : Object.defineProperty(this, r, {
                        configurable: !0,
                        writable: !0,
                        value: n
                    }), et = et || t, n
                } catch (n) {
                    throw delete this[r], et = et || t, n
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
    let ei = {
            value: void 0,
            enumerable: !1
        },
        eo = "captureStackTrace" in Error ? Error : null;

    function eu(t, n, r, i) {
        var o;

        function u(t) {
            this.def = t, this.constr = d, this.traits = new Set
        }
        u.prototype = {};
        let a = r && new WeakSet;

        function l(i, o) {
            if (i._zod) {
                if (i._zod.traits.has(t)) return
            } else {
                ei.value = new u(o);
                try {
                    Object.defineProperty(i, "_zod", ei)
                } finally {
                    ei.value = void 0
                }
            }
            if (i._zod.traits.add(t), n(i, o), a) {
                let t = Object.getPrototypeOf(i),
                    n = i._zod.constr.prototype,
                    o = t;
                for (; o && o !== n;) o = Object.getPrototypeOf(o);
                let u = null != o ? o : t;
                if (!a.has(u))
                    for (let t in a.add(u), r) {
                        let n = Object.getOwnPropertyDescriptor(r, t);
                        n.get ? Object.defineProperty(u, t, {
                            ...n,
                            enumerable: !1
                        }) : function(t, n, r) {
                            Object.defineProperty(t, n, {
                                configurable: !0,
                                get() {
                                    return this == null ? r : Q(this, n, r.bind(this))
                                },
                                set(t) {
                                    Q(this, n, t)
                                }
                            })
                        }(u, t, n.value)
                    }
            }
            let l = d.prototype;
            for (let t in l) Object.prototype.hasOwnProperty.call(l, t) && (t in i || (i[t] = l[t].bind(i)))
        }
        let s = null != (o = null == i ? void 0 : i.Parent) ? o : Object;
        class c extends s {}

        function d(t) {
            var n;
            let r = (null == i ? void 0 : i.Parent) ? function(t) {
                let n = eo;
                if (n) {
                    let r = n.stackTraceLimit;
                    if ("number" == typeof r) {
                        try {
                            n.stackTraceLimit = 0
                        } catch (n) {
                            return eo = null, new t
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
            l(r, t);
            let o = r._zod.deferred;
            if (o) {
                for (let t of o) t();
                r._zod.deferred = void 0
            }
            let u = null == (n = globalThis.__zod_globalConfig) ? void 0 : n.postProcessor;
            return u && u(r), r
        }
        return Object.defineProperty(c, "name", {
            value: t
        }), Object.defineProperty(d, "init", {
            value: l
        }), Object.defineProperty(d, Symbol.hasInstance, {
            value: n => {
                var r, o;
                return !!(null == i ? void 0 : i.Parent) && n instanceof i.Parent || (null == n || null == (o = n._zod) || null == (r = o.traits) ? void 0 : r.has(t))
            }
        }), Object.defineProperty(d, "name", {
            value: t
        }), d
    }
    class ea extends Error {
        constructor() {
            super("Encountered Promise during synchronous parse. Use .parseAsync() instead.")
        }
    }
    class el extends Error {
        constructor(t) {
            super("Encountered unidirectional transform during encode: ".concat(t)), this.name = "ZodEncodeError"
        }
    }
    null != (p = globalThis).__zod_globalConfig || (p.__zod_globalConfig = {});
    let es = globalThis.__zod_globalConfig;

    function ec(t) {
        return t && Object.assign(es, t), es
    }
    let ed = {
            get: function() {
                let t = this._zod;
                return null != t.message || (t.message = JSON.stringify(t.def, y, 2)), t.message
            },
            set: function(t) {
                this._zod.message = t
            },
            enumerable: !0,
            configurable: !0
        },
        ef = {
            value: void 0,
            enumerable: !1
        },
        ep = new WeakSet([Object.prototype, Error.prototype]),
        eh = eu("$ZodError", (t, n) => {
            t.name = "$ZodError", ef.value = n, Object.defineProperty(t, "issues", ef), ef.value = void 0, Object.defineProperty(t, "message", ed);
            let r = Object.getPrototypeOf(t);
            ep.has(r) || (ep.add(r), Object.defineProperty(r, "toString", {
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

    function em(t, n) {
        var r;
        return {
            callee: null != (r = null == n ? void 0 : n.callee) ? r : t,
            Err: null == n ? void 0 : n.Err
        }
    }
    let ev = t => {
            let n = (r, i, o, u) => {
                let a = o ? {
                        ...o,
                        async: !1
                    } : {
                        async: !1
                    },
                    l = r._zod.run({
                        value: i,
                        issues: []
                    }, a);
                if (l instanceof Promise) throw new ea;
                if (l.issues.length) {
                    var s, c;
                    let r = new(null != (s = null == u ? void 0 : u.Err) ? s : t)(l.issues.map(t => q(t, a, ec())));
                    throw x(r, null != (c = null == u ? void 0 : u.callee) ? c : n), r
                }
                return l.value
            };
            return n
        },
        eg = t => {
            let n = async (r, i, o, u) => {
                let a = o ? {
                        ...o,
                        async: !0
                    } : {
                        async: !0
                    },
                    l = r._zod.run({
                        value: i,
                        issues: []
                    }, a);
                if (l instanceof Promise && (l = await l), l.issues.length) {
                    var s, c;
                    let r = new(null != (s = null == u ? void 0 : u.Err) ? s : t)(l.issues.map(t => q(t, a, ec())));
                    throw x(r, null != (c = null == u ? void 0 : u.callee) ? c : n), r
                }
                return l.value
            };
            return n
        },
        ey = t => (n, r, i) => {
            let o = i ? {
                    ...i,
                    async: !1
                } : {
                    async: !1
                },
                u = n._zod.run({
                    value: r,
                    issues: []
                }, o);
            if (u instanceof Promise) throw new ea;
            return u.issues.length ? e_(t, u.issues, o) : {
                success: !0,
                data: u.value
            }
        };

    function e_(t, n, r) {
        let i;
        return {
            success: !1,
            get error() {
                return i || (i = new t(n.map(t => q(t, r, ec()))), n = void 0, r = void 0), i
            },
            set error(e) {
                i = e, n = void 0, r = void 0
            }
        }
    }
    let eb = t => async (n, r, i) => {
        let o = i ? {
                ...i,
                async: !0
            } : {
                async: !0
            },
            u = n._zod.run({
                value: r,
                issues: []
            }, o);
        return u instanceof Promise && (u = await u), u.issues.length ? e_(t, u.issues, o) : {
            success: !0,
            data: u.value
        }
    }, eF = Symbol.for("zod.compile.invalid"), ew = Symbol.for("zod.compile.fallback"), ez = async (t, n, r) => {
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
    }, ek = /^[cC][0-9a-z]{6,}$/, eO = /^[0-9a-z]+$/, eA = /^[0-7][0-9A-HJKMNP-TV-Za-hjkmnp-tv-z]{25}$/, eE = /^[0-9a-vA-V]{20}$/, eS = /^[A-Za-z0-9]{27}$/, ex = /^[a-zA-Z0-9_-]{21}$/, ej = /^P(?:(\d+W)|(?!.*W)(?=\d|T\d)(\d+Y)?(\d+M)?(\d+D)?(T(?=\d)(\d+H)?(\d+M)?(\d+([.,]\d+)?S)?)?)$/, eP = /^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})$/, eZ = t => t ? RegExp("^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-".concat(t, "[0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12})$")) : /^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-8][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}|00000000-0000-0000-0000-000000000000|ffffffff-ffff-ffff-ffff-ffffffffffff)$/, eI = /^(?:[A-Za-z0-9_'+\-]+\.)*[A-Za-z0-9_'+\-]*[A-Za-z0-9_+-]@(?:[A-Za-z0-9][A-Za-z0-9\-]*\.)+[A-Za-z]{2,}$/, eT = /^(?:(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])$/, e$ = /^(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))$/, eN = /^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\/([0-9]|[1-2][0-9]|3[0-2])$/, eC = /^(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))\/(12[0-8]|1[01][0-9]|[1-9]?[0-9])$/, eD = /^https?$/, eB = /^\+[1-9]\d{6,14}$/, eR = "(?:(?:\\d\\d[2468][048]|\\d\\d[13579][26]|\\d\\d0[48]|[02468][048]00|[13579][26]00)-02-29|\\d{4}-(?:(?:0[13578]|1[02])-(?:0[1-9]|[12]\\d|3[01])|(?:0[469]|11)-(?:0[1-9]|[12]\\d|30)|(?:02)-(?:0[1-9]|1\\d|2[0-8])))", eU = RegExp("^".concat(eR, "$"));

    function eJ(t) {
        let n = "(?:[01]\\d|2[0-3]):[0-5]\\d";
        return "number" == typeof t.precision ? -1 === t.precision ? "".concat(n) : 0 === t.precision ? "".concat(n, ":[0-5]\\d") : "".concat(n, ":[0-5]\\d\\.\\d{").concat(t.precision, "}") : t.seconds ? "".concat(n, ":[0-5]\\d(?:\\.\\d+)?") : "".concat(n, "(?::[0-5]\\d(?:\\.\\d+)?)?")
    }
    let eM = /^[\s\S]{0,}$/,
        eL = /^-?\d+$/,
        eK = /^-?\d+(?:\.\d+)?$/,
        eV = /^(?:true|false)$/i,
        eW = /^[^A-Z]*$/,
        eq = /^[^a-z]*$/,
        eG = eu("$ZodCheck", (t, n) => {
            var r;
            null != t._zod || (t._zod = {}), t._zod.def = n, null != (r = t._zod).onattach || (r.onattach = [])
        }),
        eX = t => {
            let n = t.value;
            return null != n && void 0 !== n.length
        },
        eH = {
            number: "number",
            bigint: "bigint",
            object: "date"
        },
        eY = eu("$ZodCheckLessThan", (t, n) => {
            eG.init(t, n);
            let r = eH[typeof n.value];
            t._zod.check = i => {
                var o;
                (n.inclusive ? i.value <= n.value : i.value < n.value) || i.issues.push({
                    origin: null != (o = eH[typeof i.value]) ? o : r,
                    code: "too_big",
                    maximum: "object" == typeof n.value ? n.value.getTime() : n.value,
                    input: i.value,
                    inclusive: n.inclusive,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        eQ = eu("$ZodCheckGreaterThan", (t, n) => {
            eG.init(t, n);
            let r = eH[typeof n.value];
            t._zod.check = i => {
                var o;
                (n.inclusive ? i.value >= n.value : i.value > n.value) || i.issues.push({
                    origin: null != (o = eH[typeof i.value]) ? o : r,
                    code: "too_small",
                    minimum: "object" == typeof n.value ? n.value.getTime() : n.value,
                    input: i.value,
                    inclusive: n.inclusive,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        e0 = eu("$ZodCheckMultipleOf", (t, n) => {
            eG.init(t, n), t._zod.check = r => {
                let i, o, u;
                if (typeof r.value != typeof n.value) throw Error("Cannot mix number and bigint in multiple_of check.");
                ("bigint" == typeof r.value ? n.value !== BigInt(0) && r.value % n.value === BigInt(0) : 0 == (o = Math.round(i = r.value / n.value), u = 4 * Number.EPSILON * Math.max(Math.abs(i), 1), Math.abs(i - o) < u ? 0 : i - o)) || r.issues.push({
                    origin: typeof r.value,
                    code: "not_multiple_of",
                    divisor: n.value,
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        e1 = eu("$ZodCheckNumberFormat", (t, n) => {
            var r;
            eG.init(t, n), n.format = n.format || "float64";
            let i = null == (r = n.format) ? void 0 : r.includes("int"),
                o = i ? "int" : "number",
                [u, a] = B[n.format];
            t._zod.check = r => {
                let l = r.value;
                if (i) {
                    if (!Number.isInteger(l)) return void r.issues.push({
                        expected: o,
                        format: n.format,
                        code: "invalid_type",
                        continue: !1,
                        input: l,
                        inst: t
                    });
                    if (!Number.isSafeInteger(l)) return void(l > 0 ? r.issues.push({
                        input: l,
                        code: "too_big",
                        maximum: Number.MAX_SAFE_INTEGER,
                        note: "Integers must be within the safe integer range.",
                        inst: t,
                        origin: o,
                        inclusive: !0,
                        continue: !n.abort
                    }) : r.issues.push({
                        input: l,
                        code: "too_small",
                        minimum: Number.MIN_SAFE_INTEGER,
                        note: "Integers must be within the safe integer range.",
                        inst: t,
                        origin: o,
                        inclusive: !0,
                        continue: !n.abort
                    }))
                }
                l < u && r.issues.push({
                    origin: "number",
                    input: l,
                    code: "too_small",
                    minimum: u,
                    inclusive: !0,
                    inst: t,
                    continue: !n.abort
                }), l > a && r.issues.push({
                    origin: "number",
                    input: l,
                    code: "too_big",
                    maximum: a,
                    inclusive: !0,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        e2 = eu("$ZodCheckMaxLength", (t, n) => {
            var r;
            eG.init(t, n), null != (r = t._zod.def).when || (r.when = eX), t._zod.check = r => {
                let i = r.value,
                    o = i.length;
                if (("string" == typeof i && o > n.maximum ? X(i) : o) <= n.maximum) return;
                let u = H(i);
                r.issues.push({
                    origin: u,
                    code: "too_big",
                    maximum: n.maximum,
                    inclusive: !0,
                    input: i,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        e6 = eu("$ZodCheckMinLength", (t, n) => {
            var r;
            eG.init(t, n), null != (r = t._zod.def).when || (r.when = eX), t._zod.check = r => {
                let i = r.value,
                    o = i.length;
                if (("string" == typeof i && o >= n.minimum && o < 2 * n.minimum ? X(i) : o) >= n.minimum) return;
                let u = H(i);
                r.issues.push({
                    origin: u,
                    code: "too_small",
                    minimum: n.minimum,
                    inclusive: !0,
                    input: i,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        e9 = eu("$ZodCheckLengthEquals", (t, n) => {
            var r;
            eG.init(t, n), null != (r = t._zod.def).when || (r.when = eX), t._zod.check = r => {
                let i = r.value,
                    o = i.length,
                    u = "string" == typeof i && o >= n.length && o <= 2 * n.length ? X(i) : o;
                if (u === n.length) return;
                let a = H(i),
                    l = u > n.length;
                r.issues.push({
                    origin: a,
                    ...l ? {
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
        e4 = eu("$ZodCheckStringFormat", (t, n) => {
            var r, i;
            eG.init(t, n), n.pattern ? null != (r = t._zod).check || (r.check = r => {
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
        e5 = eu("$ZodCheckRegex", (t, n) => {
            e4.init(t, n), t._zod.check = r => {
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
        e3 = eu("$ZodCheckLowerCase", (t, n) => {
            null != n.pattern || (n.pattern = eW), e4.init(t, n)
        }),
        e7 = eu("$ZodCheckUpperCase", (t, n) => {
            null != n.pattern || (n.pattern = eq), e4.init(t, n)
        }),
        e8 = eu("$ZodCheckIncludes", (t, n) => {
            eG.init(t, n);
            let r = $(n.includes),
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
        te = eu("$ZodCheckStartsWith", (t, n) => {
            eG.init(t, n);
            let r = RegExp("^".concat($(n.prefix), ".*"));
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
        tt = eu("$ZodCheckEndsWith", (t, n) => {
            eG.init(t, n);
            let r = RegExp(".*".concat($(n.suffix), "$"));
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
        tn = eu("$ZodCheckOverwrite", (t, n) => {
            eG.init(t, n), t._zod.check = t => {
                t.value = n.tx(t.value)
            }
        });
    class tr {
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
    let ti = {
            major: 4,
            minor: 6,
            patch: 5
        },
        to = eu("$ZodType", (t, n) => {
            var r, i;
            null != t || (t = {}), t._zod.def = n, t._zod.bag = t._zod.bag || {}, t._zod.version = ti;
            let o = t._zod.def.checks,
                u = t._zod.traits.has("$ZodCheck") ? [t, ...null != o ? o : []] : (null == o ? void 0 : o.length) ? [...o] : [];
            for (let n of u)
                for (let r of n._zod.onattach) r(t);
            if (0 === u.length) null != (i = t._zod).deferred || (i.deferred = []), null == (r = t._zod.deferred) || r.push(() => {
                t._zod.run = t._zod.parse
            });
            else {
                let n = (n, r, i) => {
                        let o;
                        if (n.memo) return n;
                        let u = L(n);
                        for (let a of r) {
                            if (a._zod.def.when) {
                                if (function(t) {
                                        var n;
                                        let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
                                        if (!0 === t.aborted) return !0;
                                        for (let i = r; i < t.issues.length; i++)
                                            if ((null == (n = t.issues[i]) ? void 0 : n.continue) === !1) return !0;
                                        return !1
                                    }(n) || !a._zod.def.when(n)) continue
                            } else if (u) continue;
                            let r = n.issues.length,
                                l = a._zod.check(n);
                            if (l instanceof Promise && (null == i ? void 0 : i.async) === !1) throw new ea;
                            if (o || l instanceof Promise) o = (null != o ? o : Promise.resolve()).then(async () => {
                                await l, n.issues.length !== r && (W(n.issues, r, t), u || (u = L(n, r)))
                            });
                            else {
                                if (n.issues.length === r) continue;
                                W(n.issues, r, t), u || (u = L(n, r))
                            }
                        }
                        return o ? o.then(() => n) : n
                    },
                    r = (r, i, o) => {
                        if (L(r)) return r.aborted = !0, r;
                        let a = n(i, u, o);
                        if (a instanceof Promise) {
                            if (!1 === o.async) throw new ea;
                            return a.then(n => t._zod.parse(n, o))
                        }
                        return t._zod.parse(a, o)
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
                    let a = t._zod.parse(i, o);
                    if (a instanceof Promise) {
                        if (!1 === o.async) throw new ea;
                        return a.then(t => n(t, u, o))
                    }
                    return n(a, u, o)
                }
            }
        }, {
            get "~standard"() {
                return Q(this, "~standard", tl(this), !1)
            },
            set "~standard"(value) {
                Q(this, "~standard", value)
            }
        }),
        tu = (t, n) => t.issues.length ? {
            issues: t.issues.map(t => q(t, n, ec()))
        } : {
            value: t.value
        };
    async function ta(t, n) {
        let r = {
            async: !0
        };
        return tu(await t._zod.run({
            value: n,
            issues: []
        }, r), r)
    }

    function tl(t) {
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
                    if (!(i instanceof Promise)) return tu(i, r)
                } catch (t) {}
                return ta(t, n)
            },
            vendor: "zod",
            version: 1
        }
    }
    let ts = eu("$ZodString", (t, n) => {
            var r;
            to.init(t, n), t._zod.pattern = null != (r = n.pattern) ? r : eM, t._zod.parse = (r, i) => {
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
        tc = eu("$ZodStringFormat", (t, n) => {
            e4.init(t, n), ts.init(t, n)
        }),
        td = eu("$ZodGUID", (t, n) => {
            null != n.pattern || (n.pattern = eP), tc.init(t, n)
        }),
        tf = eu("$ZodUUID", (t, n) => {
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
                null != n.pattern || (n.pattern = eZ(t))
            } else null != n.pattern || (n.pattern = eZ());
            tc.init(t, n)
        }),
        tp = eu("$ZodEmail", (t, n) => {
            null != n.pattern || (n.pattern = eI), tc.init(t, n)
        });

    function th(t) {
        try {
            if ("u" > typeof URL && "function" == typeof URL.canParse) return URL.canParse(t);
            return new URL(t), !0
        } catch (t) {
            return !1
        }
    }
    let tm = /[\t\n\r]/g;

    function tv(t) {
        return t.replace(tm, "")
    }
    let tg = eu("$ZodURL", (t, n) => {
            tc.init(t, n), t._zod.check = r => {
                try {
                    var i, o;
                    let u = r.value.trim(),
                        a = "normalize" in n || "hostname" in n || "protocol" in n ? function(t, n) {
                            var r, i;
                            if (!n.normalize && (null == (r = n.protocol) ? void 0 : r.source) === eD.source && !/^https?:\/\//i.test(t)) return 1;
                            try {
                                if ("u" > typeof URL) {
                                    let n = URL;
                                    if ("function" == typeof n.parse) return null != (i = n.parse(t)) ? i : 2
                                }
                                return new URL(t)
                            } catch (t) {
                                return 2
                            }
                        }(u, n) : th(u) || 2;
                    if (1 === a) return void r.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid URL format",
                        input: r.value,
                        inst: t,
                        continue: !n.abort
                    });
                    if (2 === a) return void r.issues.push({
                        code: "invalid_format",
                        format: "url",
                        input: r.value,
                        inst: t,
                        continue: !n.abort
                    });
                    if (!0 === a) {
                        r.value = tv(u);
                        return
                    }
                    n.hostname && ((i = n.hostname).lastIndex = 0, !i.test(a.hostname)) && r.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid hostname",
                        pattern: n.hostname.source,
                        input: r.value,
                        inst: t,
                        continue: !n.abort
                    }), n.protocol && ((o = n.protocol).lastIndex = 0, !o.test(a.protocol.endsWith(":") ? a.protocol.slice(0, -1) : a.protocol)) && r.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid protocol",
                        pattern: n.protocol.source,
                        input: r.value,
                        inst: t,
                        continue: !n.abort
                    }), r.value = n.normalize ? a.href : tv(u);
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
        ty = eu("$ZodEmoji", (t, n) => {
            null != n.pattern || (n.pattern = RegExp("^(?=[\\s\\S]*[\\u00A9\\u00AE\\u203C\\u2049\\u2122\\u2139\\u2194-\\u2199\\u21A9-\\u21AA\\u231A-\\u231B\\u2328\\u23CF\\u23E9-\\u23F3\\u23F8-\\u23FA\\u24C2\\u25AA-\\u25AB\\u25B6\\u25C0\\u25FB-\\u25FE\\u2600-\\u2604\\u260E\\u2611\\u2614-\\u2615\\u2618\\u261D\\u2620\\u2622-\\u2623\\u2626\\u262A\\u262E-\\u262F\\u2638-\\u263A\\u2640\\u2642\\u2648-\\u2653\\u265F-\\u2660\\u2663\\u2665-\\u2666\\u2668\\u267B\\u267E-\\u267F\\u2692-\\u2697\\u2699\\u269B-\\u269C\\u26A0-\\u26A1\\u26A7\\u26AA-\\u26AB\\u26B0-\\u26B1\\u26BD-\\u26BE\\u26C4-\\u26C5\\u26C8\\u26CE-\\u26CF\\u26D1\\u26D3-\\u26D4\\u26E9-\\u26EA\\u26F0-\\u26F5\\u26F7-\\u26FA\\u26FD\\u2702\\u2705\\u2708-\\u270D\\u270F\\u2712\\u2714\\u2716\\u271D\\u2721\\u2728\\u2733-\\u2734\\u2744\\u2747\\u274C\\u274E\\u2753-\\u2755\\u2757\\u2763-\\u2764\\u2795-\\u2797\\u27A1\\u27B0\\u27BF\\u2934-\\u2935\\u2B05-\\u2B07\\u2B1B-\\u2B1C\\u2B50\\u2B55\\u3030\\u303D\\u3297\\u3299\\u{1F004}\\u{1F02C}-\\u{1F02F}\\u{1F094}-\\u{1F09F}\\u{1F0AF}-\\u{1F0B0}\\u{1F0C0}\\u{1F0CF}-\\u{1F0D0}\\u{1F0F6}-\\u{1F0FF}\\u{1F170}-\\u{1F171}\\u{1F17E}-\\u{1F17F}\\u{1F18E}\\u{1F191}-\\u{1F19A}\\u{1F1AE}-\\u{1F1E5}\\u{1F201}-\\u{1F20F}\\u{1F21A}\\u{1F22F}\\u{1F232}-\\u{1F23A}\\u{1F23C}-\\u{1F23F}\\u{1F249}-\\u{1F25F}\\u{1F266}-\\u{1F321}\\u{1F324}-\\u{1F393}\\u{1F396}-\\u{1F397}\\u{1F399}-\\u{1F39B}\\u{1F39E}-\\u{1F3F0}\\u{1F3F3}-\\u{1F3F5}\\u{1F3F7}-\\u{1F3FA}\\u{1F400}-\\u{1F4FD}\\u{1F4FF}-\\u{1F53D}\\u{1F549}-\\u{1F54E}\\u{1F550}-\\u{1F567}\\u{1F56F}-\\u{1F570}\\u{1F573}-\\u{1F57A}\\u{1F587}\\u{1F58A}-\\u{1F58D}\\u{1F590}\\u{1F595}-\\u{1F596}\\u{1F5A4}-\\u{1F5A5}\\u{1F5A8}\\u{1F5B1}-\\u{1F5B2}\\u{1F5BC}\\u{1F5C2}-\\u{1F5C4}\\u{1F5D1}-\\u{1F5D3}\\u{1F5DC}-\\u{1F5DE}\\u{1F5E1}\\u{1F5E3}\\u{1F5E8}\\u{1F5EF}\\u{1F5F3}\\u{1F5FA}-\\u{1F64F}\\u{1F680}-\\u{1F6C5}\\u{1F6CB}-\\u{1F6D2}\\u{1F6D5}-\\u{1F6E5}\\u{1F6E9}\\u{1F6EB}-\\u{1F6F0}\\u{1F6F3}-\\u{1F6FF}\\u{1F7DA}-\\u{1F7FF}\\u{1F80C}-\\u{1F80F}\\u{1F848}-\\u{1F84F}\\u{1F85A}-\\u{1F85F}\\u{1F888}-\\u{1F88F}\\u{1F8AE}-\\u{1F8AF}\\u{1F8BC}-\\u{1F8BF}\\u{1F8C2}-\\u{1F8CF}\\u{1F8D9}-\\u{1F8FF}\\u{1F90C}-\\u{1F93A}\\u{1F93C}-\\u{1F945}\\u{1F947}-\\u{1F9FF}\\u{1FA58}-\\u{1FA5F}\\u{1FA6E}-\\u{1FAFF}\\u{1FC00}-\\u{1FFFD}\\u{1F1E6}-\\u{1F1FF}\\u20E3])[\\u00A9\\u00AE\\u203C\\u2049\\u2122\\u2139\\u2194-\\u2199\\u21A9-\\u21AA\\u231A-\\u231B\\u2328\\u23CF\\u23E9-\\u23F3\\u23F8-\\u23FA\\u24C2\\u25AA-\\u25AB\\u25B6\\u25C0\\u25FB-\\u25FE\\u2600-\\u2604\\u260E\\u2611\\u2614-\\u2615\\u2618\\u261D\\u2620\\u2622-\\u2623\\u2626\\u262A\\u262E-\\u262F\\u2638-\\u263A\\u2640\\u2642\\u2648-\\u2653\\u265F-\\u2660\\u2663\\u2665-\\u2666\\u2668\\u267B\\u267E-\\u267F\\u2692-\\u2697\\u2699\\u269B-\\u269C\\u26A0-\\u26A1\\u26A7\\u26AA-\\u26AB\\u26B0-\\u26B1\\u26BD-\\u26BE\\u26C4-\\u26C5\\u26C8\\u26CE-\\u26CF\\u26D1\\u26D3-\\u26D4\\u26E9-\\u26EA\\u26F0-\\u26F5\\u26F7-\\u26FA\\u26FD\\u2702\\u2705\\u2708-\\u270D\\u270F\\u2712\\u2714\\u2716\\u271D\\u2721\\u2728\\u2733-\\u2734\\u2744\\u2747\\u274C\\u274E\\u2753-\\u2755\\u2757\\u2763-\\u2764\\u2795-\\u2797\\u27A1\\u27B0\\u27BF\\u2934-\\u2935\\u2B05-\\u2B07\\u2B1B-\\u2B1C\\u2B50\\u2B55\\u3030\\u303D\\u3297\\u3299\\u{1F004}\\u{1F02C}-\\u{1F02F}\\u{1F094}-\\u{1F09F}\\u{1F0AF}-\\u{1F0B0}\\u{1F0C0}\\u{1F0CF}-\\u{1F0D0}\\u{1F0F6}-\\u{1F0FF}\\u{1F170}-\\u{1F171}\\u{1F17E}-\\u{1F17F}\\u{1F18E}\\u{1F191}-\\u{1F19A}\\u{1F1AE}-\\u{1F1E5}\\u{1F201}-\\u{1F20F}\\u{1F21A}\\u{1F22F}\\u{1F232}-\\u{1F23A}\\u{1F23C}-\\u{1F23F}\\u{1F249}-\\u{1F25F}\\u{1F266}-\\u{1F321}\\u{1F324}-\\u{1F393}\\u{1F396}-\\u{1F397}\\u{1F399}-\\u{1F39B}\\u{1F39E}-\\u{1F3F0}\\u{1F3F3}-\\u{1F3F5}\\u{1F3F7}-\\u{1F3FA}\\u{1F400}-\\u{1F4FD}\\u{1F4FF}-\\u{1F53D}\\u{1F549}-\\u{1F54E}\\u{1F550}-\\u{1F567}\\u{1F56F}-\\u{1F570}\\u{1F573}-\\u{1F57A}\\u{1F587}\\u{1F58A}-\\u{1F58D}\\u{1F590}\\u{1F595}-\\u{1F596}\\u{1F5A4}-\\u{1F5A5}\\u{1F5A8}\\u{1F5B1}-\\u{1F5B2}\\u{1F5BC}\\u{1F5C2}-\\u{1F5C4}\\u{1F5D1}-\\u{1F5D3}\\u{1F5DC}-\\u{1F5DE}\\u{1F5E1}\\u{1F5E3}\\u{1F5E8}\\u{1F5EF}\\u{1F5F3}\\u{1F5FA}-\\u{1F64F}\\u{1F680}-\\u{1F6C5}\\u{1F6CB}-\\u{1F6D2}\\u{1F6D5}-\\u{1F6E5}\\u{1F6E9}\\u{1F6EB}-\\u{1F6F0}\\u{1F6F3}-\\u{1F6FF}\\u{1F7DA}-\\u{1F7FF}\\u{1F80C}-\\u{1F80F}\\u{1F848}-\\u{1F84F}\\u{1F85A}-\\u{1F85F}\\u{1F888}-\\u{1F88F}\\u{1F8AE}-\\u{1F8AF}\\u{1F8BC}-\\u{1F8BF}\\u{1F8C2}-\\u{1F8CF}\\u{1F8D9}-\\u{1F8FF}\\u{1F90C}-\\u{1F93A}\\u{1F93C}-\\u{1F945}\\u{1F947}-\\u{1F9FF}\\u{1FA58}-\\u{1FA5F}\\u{1FA6E}-\\u{1FAFF}\\u{1FC00}-\\u{1FFFD}\\u0023\\u002A\\u0030-\\u0039\\u200D\\u20E3\\uFE0F\\u{1F1E6}-\\u{1F1FF}\\u{1F3FB}-\\u{1F3FF}\\u{1F9B0}-\\u{1F9B3}\\u{E0020}-\\u{E007F}]+$", "u")), tc.init(t, n)
        }),
        t_ = eu("$ZodNanoID", (t, n) => {
            var r;
            if (void 0 !== n.length && (!Number.isInteger(n.length) || n.length < 1)) throw Error("Invalid nanoid length: ".concat(n.length));
            null != n.pattern || (n.pattern = void 0 === n.length ? ex : (r = n.length, RegExp("^[a-zA-Z0-9_-]{".concat(r, "}$")))), tc.init(t, n)
        }),
        tb = eu("$ZodCUID", (t, n) => {
            null != n.pattern || (n.pattern = ek), tc.init(t, n)
        }),
        tF = eu("$ZodCUID2", (t, n) => {
            null != n.pattern || (n.pattern = eO), tc.init(t, n)
        }),
        tw = eu("$ZodULID", (t, n) => {
            null != n.pattern || (n.pattern = eA), tc.init(t, n)
        }),
        tz = eu("$ZodXID", (t, n) => {
            null != n.pattern || (n.pattern = eE), tc.init(t, n)
        }),
        tk = eu("$ZodKSUID", (t, n) => {
            null != n.pattern || (n.pattern = eS), tc.init(t, n)
        }),
        tO = eu("$ZodISODateTime", (t, n) => {
            let r, i, o;
            null != n.pattern || (r = ["Z"], n.offset && r.push("([+-](?:[01]\\d|2[0-3]):[0-5]\\d)"), i = "".concat(eJ({
                precision: n.precision,
                seconds: !0
            }), "(?:").concat(r.join("|"), ")"), o = n.local ? "".concat(i, "|").concat(eJ({
                precision: n.precision
            })) : i, n.pattern = RegExp("^".concat(eR, "T(?:").concat(o, ")$"))), tc.init(t, n)
        }),
        tA = eu("$ZodISODate", (t, n) => {
            null != n.pattern || (n.pattern = eU), tc.init(t, n)
        }),
        tE = eu("$ZodISOTime", (t, n) => {
            null != n.pattern || (n.pattern = RegExp("^".concat(eJ(n), "$"))), tc.init(t, n)
        }),
        tS = eu("$ZodISODuration", (t, n) => {
            null != n.pattern || (n.pattern = ej), tc.init(t, n)
        }),
        tx = eu("$ZodIPv4", (t, n) => {
            null != n.pattern || (n.pattern = eT), tc.init(t, n)
        }),
        tj = /^[0-9a-fA-F:.]+$/;

    function tP(t) {
        return !!tj.test(t) && th("http://[".concat(t, "]"))
    }
    let tZ = eu("$ZodIPv6", (t, n) => {
            null != n.pattern || (n.pattern = e$), tc.init(t, n), t._zod.check = r => {
                tP(r.value) || r.issues.push({
                    code: "invalid_format",
                    format: "ipv6",
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        tI = eu("$ZodCIDRv4", (t, n) => {
            null != n.pattern || (n.pattern = eN), tc.init(t, n)
        }),
        tT = eu("$ZodCIDRv6", (t, n) => {
            null != n.pattern || (n.pattern = eC), tc.init(t, n), t._zod.check = r => {
                ! function(t) {
                    let n = t.split("/");
                    if (2 !== n.length) return !1;
                    let [r, i] = n;
                    if (!i) return !1;
                    let o = Number(i);
                    return "".concat(o) === i && !(o < 0) && !(o > 128) && tP(r)
                }(r.value) && r.issues.push({
                    code: "invalid_format",
                    format: "cidrv6",
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        });

    function t$(t) {
        if ("" === t) return !0;
        if (/\s/.test(t) || t.length % 4 != 0) return !1;
        try {
            return atob(t), !0
        } catch (t) {
            return !1
        }
    }
    let tN = /^[0-9a-zA-Z+/]*={0,2}$/,
        tC = eu("$ZodBase64", (t, n) => {
            null != n.pattern || (n.pattern = tN), tc.init(t, n), t._zod.check = r => {
                t$(r.value) || r.issues.push({
                    code: "invalid_format",
                    format: "base64",
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        tD = /^[A-Za-z0-9_-]*$/,
        tB = eu("$ZodBase64URL", (t, n) => {
            null != n.pattern || (n.pattern = tD), tc.init(t, n), t._zod.check = r => {
                ! function(t) {
                    if (!tD.test(t)) return !1;
                    let n = t.replace(/[-_]/g, t => "-" === t ? "+" : "/");
                    return t$(n.padEnd(4 * Math.ceil(n.length / 4), "="))
                }(r.value) && r.issues.push({
                    code: "invalid_format",
                    format: "base64url",
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        tR = eu("$ZodE164", (t, n) => {
            null != n.pattern || (n.pattern = eB), tc.init(t, n)
        }),
        tU = eu("$ZodJWT", (t, n) => {
            tc.init(t, n), t._zod.check = r => {
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
        tJ = eu("$ZodNumber", (t, n) => {
            to.init(t, n), t._zod.pattern = eK, t._zod.parse = (r, i) => {
                if (n.coerce) try {
                    r.value = Number(r.value)
                } catch (t) {}
                let o = r.value;
                if ("number" == typeof o && !Number.isNaN(o) && Number.isFinite(o)) return r;
                let u = "number" == typeof o ? Number.isNaN(o) ? "NaN" : Number.isFinite(o) ? void 0 : String(o) : void 0;
                return r.issues.push({
                    expected: "number",
                    code: "invalid_type",
                    input: o,
                    inst: t,
                    ...u ? {
                        received: u
                    } : {}
                }), r
            }
        }),
        tM = eu("$ZodNumberFormat", (t, n) => {
            e1.init(t, n), tJ.init(t, n)
        }),
        tL = eu("$ZodBoolean", (t, n) => {
            to.init(t, n), t._zod.pattern = eV, t._zod.parse = (r, i) => {
                if (n.coerce) try {
                    r.value = !!r.value
                } catch (t) {}
                let o = r.value;
                return "boolean" == typeof o || r.issues.push({
                    expected: "boolean",
                    code: "invalid_type",
                    input: o,
                    inst: t
                }), r
            }
        }),
        tK = eu("$ZodUnknown", (t, n) => {
            to.init(t, n), t._zod.parse = t => t
        }),
        tV = eu("$ZodNever", (t, n) => {
            to.init(t, n), t._zod.parse = (n, r) => (n.issues.push({
                expected: "never",
                code: "invalid_type",
                input: n.value,
                inst: t
            }), n)
        });

    function tW(t, n, r) {
        t.issues.length && n.issues.push(...K(r, t.issues)), n.value[r] = t.value
    }
    let tq = eu("$ZodArray", (t, n) => {
        to.init(t, n);
        let r = es.memoizer;
        null == r || r.attach(t), t._zod.parse = (i, o) => {
            let u = i.value;
            if (!Array.isArray(u)) return i.issues.push({
                expected: "array",
                code: "invalid_type",
                input: u,
                inst: t
            }), i;
            i.value = r ? r.alloc(t, i, Array(u.length), o) : Array(u.length);
            let a = [],
                l = null == o ? void 0 : o.abortEarly;
            for (let t = 0; t < u.length; t++) {
                let r = u[t],
                    s = n.element._zod.run({
                        value: r,
                        issues: []
                    }, o);
                if (s instanceof Promise) a.push(s.then(n => tW(n, i, t)));
                else if (tW(s, i, t), l && 0 !== s.issues.length && L(s)) break
            }
            return a.length ? Promise.all(a).then(() => i) : i
        }
    });

    function tG(t, n, r, i, o, u) {
        let a = r in i,
            l = "optional" === u;
        if (a || !l || "optional" !== o) {
            if (t.issues.length) {
                if (void 0 !== o && l && !a) return;
                n.issues.push(...K(r, t.issues))
            }
            if (!a && void 0 === o) {
                t.issues.length || n.issues.push({
                    code: "invalid_type",
                    expected: "nonoptional",
                    input: void 0,
                    path: [r]
                });
                return
            }
            void 0 === t.value ? (a || "defaulted" === o && !l) && (n.value[r] = void 0) : n.value[r] = t.value
        }
    }
    let tX = [];

    function tH(t) {
        var n, r, i, o, u;
        let a = Object.keys(t.shape),
            l = Object.getOwnPropertySymbols(t.shape),
            s = l.length ? l : tX,
            c = s.length ? [...a, ...s] : a;
        for (let u of c)
            if (!(null == (o = t.shape) || null == (i = o[u]) || null == (r = i._zod) || null == (n = r.traits) ? void 0 : n.has("$ZodType"))) throw Error('Invalid element at key "'.concat(String(u), '": expected a Zod schema'));
        let d = Object.keys(u = t.shape).filter(t => void 0 !== u[t]._zod.optin && "optional" === u[t]._zod.optout);
        return {
            ...t,
            allKeys: c,
            symbolKeys: s,
            keySet: new Set(a),
            numKeys: a.length,
            optionalKeys: new Set(d)
        }
    }

    function tY(t, n, r, i, o, u, a) {
        let l = [],
            s = o.keySet,
            c = o.catchall._zod,
            d = c.def.type,
            f = c.optin,
            p = c.optout,
            h = 0;
        for (let o in n) {
            if (a && r.issues.length !== h) {
                if (L(r, h)) break;
                h = r.issues.length
            }
            if (s.has(o)) continue;
            if ("__proto__" === o) {
                "never" === d && l.push(o);
                continue
            }
            if ("never" === d) {
                l.push(o);
                continue
            }
            let u = c.run({
                value: n[o],
                issues: []
            }, i);
            u instanceof Promise ? t.push(u.then(t => tG(t, r, o, n, f, p))) : tG(u, r, o, n, f, p)
        }
        return (l.length && r.issues.push({
            code: "unrecognized_keys",
            keys: l,
            input: n,
            inst: u,
            continue: !0
        }), t.length) ? Promise.all(t).then(() => r) : r
    }
    let tQ = eu("$ZodObject", (t, n) => {
            var r;
            let i;
            to.init(t, n);
            let o = Object.getOwnPropertyDescriptor(n, "shape"),
                u = (null == o ? void 0 : o.get) ? o.get.raw : null != (r = n.shape) ? r : {};
            if (u) {
                let t = () => {
                    let r = {
                        ...u
                    };
                    return Object.defineProperty(n, "shape", {
                        value: r
                    }), t.raw = r, r
                };
                t.raw = u, Object.defineProperty(n, "shape", {
                    get: t
                })
            }
            let a = b(() => tH(n));
            er(t, "propValues", t => {
                let n = t.def.shape,
                    r = {};
                for (let t in n) {
                    let i = n[t]._zod;
                    if (i.values) {
                        for (let n of (Object.prototype.hasOwnProperty.call(r, t) || w(r, t, new Set), i.values)) r[t].add(n);
                        void 0 !== i.optin && r[t].add(void 0)
                    }
                }
                return r
            });
            let l = n.catchall,
                s = es.memoizer;
            null == s || s.attach(t), t._zod.parse = (n, r) => {
                null != i || (i = a.value);
                let o = n.value;
                if (!j(o)) return n.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: o,
                    inst: t
                }), n;
                n.value = s ? s.alloc(t, n, {}, r) : {};
                let u = [],
                    c = i.shape,
                    d = null == r ? void 0 : r.abortEarly,
                    f = n.issues.length;
                for (let t of i.allKeys) {
                    if (d && n.issues.length !== f) {
                        if (L(n, f)) break;
                        f = n.issues.length
                    }
                    if ("__proto__" === t) continue;
                    let i = c[t],
                        a = i._zod.optin,
                        l = i._zod.optout,
                        s = i._zod.run({
                            value: o[t],
                            issues: []
                        }, r);
                    s instanceof Promise ? u.push(s.then(r => tG(r, n, t, o, a, l))) : tG(s, n, t, o, a, l)
                }
                return l ? tY(u, o, n, r, a.value, t, !0 === d) : u.length ? Promise.all(u).then(() => n) : n
            }
        }),
        t0 = eu("$ZodObjectJIT", (t, n) => {
            let r, i;
            tQ.init(t, n);
            let o = t._zod.parse,
                u = b(() => tH(n)),
                a = es.memoizer,
                l = !es.jitless,
                s = l && P.value,
                c = n.catchall;
            t._zod.parse = (d, f) => {
                null != i || (i = u.value);
                let p = d.value;
                return j(p) ? l && s && (null == f ? void 0 : f.async) === !1 && !0 !== f.jitless ? (r || (r = (n => {
                    let r = u.value,
                        i = r.symbolKeys,
                        o = new tr(["payload", "ctx"], {
                            shape: n,
                            inst: t,
                            memo: a,
                            syms: i
                        }),
                        l = t => "shape[".concat(t, "]._zod.run({ value: input[").concat(t, "], issues: [] }, ctx)"),
                        s = (t, n) => "\n          let ".concat(t, "_ab = false;\n          for (let i = 0; i < ").concat(t, ".issues.length; i++) {\n            const iss = ").concat(t, ".issues[i];\n            iss.path = iss.path ? [").concat(n, ", ...iss.path] : [").concat(n, "];\n            payload.issues.push(iss);\n            if (iss.continue !== true) ").concat(t, "_ab = true;\n          }\n          if (").concat(t, "_ab && ctx && ctx.abortEarly) {\n            payload.value = newResult;\n            return payload;\n          }");
                    o.write("const input = payload.value;");
                    let c = Object.create(null),
                        d = 0;
                    for (let t of r.allKeys) c[t] = "key_".concat(d++);
                    for (let t of (o.write(a ? "const newResult = memo.alloc(inst, payload, {}, ctx);" : "const newResult = {};"), r.allKeys)) {
                        var f, p;
                        if ("__proto__" === t) continue;
                        let r = c[t],
                            u = "symbol" == typeof t ? "syms[".concat(i.indexOf(t), "]") : JSON.stringify(t),
                            a = "".concat(u, " in input"),
                            d = n[t],
                            h = null == d || null == (f = d._zod) ? void 0 : f.optin,
                            m = void 0 !== h,
                            v = (null == d || null == (p = d._zod) ? void 0 : p.optout) === "optional";
                        if (o.write("const ".concat(r, " = ").concat(l(u), ";")), m && v) {
                            let t = "optional" === h ? "".concat(r, "_present") : "".concat(r, ".value !== undefined || ").concat(r, "_present");
                            o.write("\n        const ".concat(r, "_present = ").concat(a, ";\n        if (!").concat(r, ".issues.length || ").concat(r, "_present) {\n          if (").concat(r, ".issues.length) {").concat(s(r, u), "\n          }\n\n          if (").concat(t, ") {\n            newResult[").concat(u, "] = ").concat(r, ".value;\n          }\n        }\n\n      "))
                        } else m ? (o.write("\n        if (".concat(r, ".issues.length) {").concat(s(r, u), "\n        }\n      ")), "defaulted" === h ? o.write("newResult[".concat(u, "] = ").concat(r, ".value;")) : o.write("\n        if (".concat(r, ".value !== undefined || ").concat(a, ") {\n          newResult[").concat(u, "] = ").concat(r, ".value;\n        }\n      "))) : o.write("\n        const ".concat(r, "_present = ").concat(a, ";\n        if (").concat(r, ".issues.length) {").concat(s(r, u), "\n        }\n        if (!").concat(r, "_present && !").concat(r, '.issues.length) {\n          payload.issues.push({\n            code: "invalid_type",\n            expected: "nonoptional",\n            input: undefined,\n            path: [').concat(u, "]\n          });\n          if (ctx && ctx.abortEarly) {\n            payload.value = newResult;\n            return payload;\n          }\n        }\n\n        if (").concat(r, "_present) {\n          newResult[").concat(u, "] = ").concat(r, ".value;\n        }\n\n      "))
                    }
                    return o.write("payload.value = newResult;"), o.write("return payload;"), o.compile()
                })(n.shape)), d = r(d, f), c) ? tY([], p, d, f, i, t, (null == f ? void 0 : f.abortEarly) === !0) : d : o(d, f) : (d.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: p,
                    inst: t
                }), d)
            }
        });

    function t1(t, n, r, i) {
        for (let r of t)
            if (0 === r.issues.length) return n.value = r.value, n;
        let o = t.filter(t => !L(t));
        return 1 === o.length ? (n.value = o[0].value, o[0]) : (n.issues.push({
            code: "invalid_union",
            input: n.value,
            inst: r,
            errors: t.map(t => t.issues.map(t => q(t, i, ec())))
        }), n)
    }
    let t2 = eu("$ZodUnion", (t, n) => {
        to.init(t, n), er(t, "optin", t => t.def.options.some(t => "defaulted" === t._zod.optin) ? "defaulted" : t.def.options.some(t => void 0 !== t._zod.optin) ? "optional" : void 0), er(t, "optout", t => t.def.options.some(t => "optional" === t._zod.optout) ? "optional" : void 0), er(t, "values", t => {
            if (t.def.options.every(t => t._zod.values)) return new Set(t.def.options.flatMap(t => Array.from(t._zod.values)))
        }), er(t, "pattern", t => {
            if (t.def.options.every(t => t._zod.pattern)) {
                let n = t.def.options.map(t => t._zod.pattern);
                return RegExp("^(".concat(n.map(t => F(t.source)).join("|"), ")$"))
            }
        });
        let r = 1 === n.options.length ? n.options[0]._zod.run : null;
        t._zod.parse = (i, o) => {
            if (r) return r(i, o);
            let u = !1,
                a = [];
            for (let t of n.options) {
                let n = t._zod.run({
                    value: i.value,
                    issues: []
                }, o);
                if (n instanceof Promise) a.push(n), u = !0;
                else {
                    if (0 === n.issues.length) return n;
                    a.push(n)
                }
            }
            return u ? Promise.all(a).then(n => t1(n, i, t, o)) : t1(a, i, t, o)
        }
    });

    function t6(t, n, r, i) {
        let o = [];
        for (let n = 0; n < t.length; n++) 0 === t[n].issues.length && o.push(n);
        return 1 === o.length ? n.value = t[o[0]].value : 0 === o.length ? n.issues.push({
            code: "invalid_union",
            input: n.value,
            inst: r,
            errors: t.map(t => t.issues.map(t => q(t, i, ec())))
        }) : n.issues.push({
            code: "invalid_union",
            input: n.value,
            inst: r,
            errors: [],
            inclusive: !1,
            matches: o
        }), n
    }
    let t9 = eu("$ZodXor", (t, n) => {
            t2.init(t, n), n.inclusive = !1;
            let r = 1 === n.options.length ? n.options[0]._zod.run : null;
            t._zod.parse = (i, o) => {
                if (r) return r(i, o);
                let u = !1,
                    a = [];
                for (let t of n.options) {
                    let n = t._zod.run({
                        value: i.value,
                        issues: []
                    }, o);
                    n instanceof Promise ? (a.push(n), u = !0) : a.push(n)
                }
                return u ? Promise.all(a).then(n => t6(n, i, t, o)) : t6(a, i, t, o)
            }
        }),
        t4 = eu("$ZodDiscriminatedUnion", (t, n) => {
            n.inclusive = !1, t2.init(t, n);
            let r = t._zod.parse;
            er(t, "propValues", t => {
                var n, r;
                let i = {},
                    o = 0;
                for (let n of t.def.options) {
                    let u = n._zod.propValues;
                    if (!u || 0 === Object.keys(u).length) throw Error('Invalid discriminated union option at index "'.concat(t.def.options.indexOf(n), '"'));
                    for (let [n, a] of((null == (r = u[t.def.discriminator]) ? void 0 : r.has(void 0)) && o++, Object.entries(u)))
                        for (let t of (Object.prototype.hasOwnProperty.call(i, n) || w(i, n, new Set), a)) i[n].add(t)
                }
                return !t.def.unionFallback && o > 1 && (null == (n = i[t.def.discriminator]) || n.delete(void 0)), i
            }), n.options.forEach((t, r) => {
                let i = z(t._zod.def);
                if (i && !Object.prototype.hasOwnProperty.call(i, n.discriminator)) throw Error('Invalid discriminated union option at index "'.concat(r, '"'))
            });
            let i = b(() => (function(t) {
                let n = new Map;
                for (let i of t.options) {
                    var r;
                    let o = null == (r = i._zod.propValues) ? void 0 : r[t.discriminator];
                    if (!o || 0 === o.size) throw Error('Invalid discriminated union option at index "'.concat(t.options.indexOf(i), '"'));
                    for (let t of o)
                        if (n.has(t)) {
                            if (void 0 !== t) throw Error('Duplicate discriminator value "'.concat(String(t), '"'));
                            n.set(t, null)
                        } else n.set(t, i)
                }
                return n
            })(n));
            t._zod.parse = (o, u) => {
                let a = o.value;
                if (!j(a)) return o.issues.push({
                    code: "invalid_type",
                    expected: "object",
                    input: a,
                    inst: t
                }), o;
                let l = null == a ? void 0 : a[n.discriminator],
                    s = i.value.get(l);
                return s && (void 0 !== l || "backward" !== u.direction) ? s._zod.run(o, u) : n.unionFallback || "backward" === u.direction ? r(o, u) : (o.issues.push({
                    code: "invalid_union",
                    errors: [],
                    note: "No matching discriminator",
                    discriminator: n.discriminator,
                    options: Array.from(i.value.keys()).filter(t => null !== i.value.get(t)),
                    input: a,
                    path: [n.discriminator],
                    inst: t
                }), o)
            }
        }),
        t5 = eu("$ZodIntersection", (t, n) => {
            to.init(t, n), t._zod.parse = (t, r) => {
                let i = t.value,
                    o = n.left._zod.run({
                        value: i,
                        issues: []
                    }, r),
                    u = n.right._zod.run({
                        value: i,
                        issues: []
                    }, r);
                return o instanceof Promise || u instanceof Promise ? Promise.all([o, u]).then(n => {
                    let [r, i] = n;
                    return t3(t, r, i)
                }) : t3(t, o, u)
            }
        });

    function t3(t, n, r) {
        let i, o = new Map,
            u = new Map,
            a = (t, n) => {
                var r, a;
                let l;
                if ("unrecognized_keys" !== t.code || (null == (r = t.path) ? void 0 : r.length))
                    if ("invalid_key" !== t.code || "record" !== t.origin || (null == (a = t.path) ? void 0 : a.length) !== 1) return !1;
                    else {
                        let n = String(t.path[0]);
                        u.has(n) || u.set(n, t), l = [n]
                    }
                else null != i || (i = t), l = t.keys;
                for (let t of l) o.has(t) || o.set(t, {}), o.get(t)[n] = !0;
                return !0
            };
        for (let r of n.issues) a(r, "l") || t.issues.push(r);
        for (let n of r.issues) a(n, "r") || t.issues.push(n);
        let l = [...o].filter(t => {
            let [, n] = t;
            return n.l && n.r
        }).map(t => {
            let [n] = t;
            return n
        });
        if (l.length) {
            let n = i ? l.filter(t => i.keys.includes(t)) : [];
            for (let r of (n.length && t.issues.push({
                    ...i,
                    keys: n
                }), l)) !n.includes(r) && u.has(r) && t.issues.push(u.get(r))
        }
        let s = function t(n, r) {
            if (n === r || n instanceof Date && r instanceof Date && +n == +r) return {
                valid: !0,
                data: n
            };
            if (Z(n) && Z(r)) {
                let i = Object.keys(r),
                    o = Object.keys(n).filter(t => -1 !== i.indexOf(t)),
                    u = {
                        ...n,
                        ...r
                    };
                for (let i of (Object.prototype.hasOwnProperty.call(u, "__proto__") && delete u.__proto__, o)) {
                    if ("__proto__" === i) continue;
                    let o = t(n[i], r[i]);
                    if (!o.valid) return {
                        valid: !1,
                        mergeErrorPath: [i, ...o.mergeErrorPath]
                    };
                    u[i] = o.data
                }
                return {
                    valid: !0,
                    data: u
                }
            }
            if (Array.isArray(n) && Array.isArray(r)) {
                if (n.length !== r.length) return {
                    valid: !1,
                    mergeErrorPath: []
                };
                let i = [];
                for (let o = 0; o < n.length; o++) {
                    let u = t(n[o], r[o]);
                    if (!u.valid) return {
                        valid: !1,
                        mergeErrorPath: [o, ...u.mergeErrorPath]
                    };
                    i.push(u.data)
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
        if (!s.valid) {
            if (L(t)) return t;
            throw Error("Unmergable intersection. Error path: ".concat(JSON.stringify(s.mergeErrorPath)))
        }
        return t.value = s.data, t
    }
    let t7 = eu("$ZodRecord", (t, n) => {
            to.init(t, n);
            let r = es.memoizer;
            null == r || r.attach(t), t._zod.parse = (i, o) => {
                let u = i.value;
                if (!Z(u)) return i.issues.push({
                    expected: "record",
                    code: "invalid_type",
                    input: u,
                    inst: t
                }), i;
                let a = [],
                    l = n.keyType._zod.values;
                if (l && !n.partial) {
                    let s;
                    i.value = r ? r.alloc(t, i, {}, o) : {};
                    let c = new Set;
                    for (let r of l)
                        if ("string" == typeof r || "number" == typeof r || "symbol" == typeof r) {
                            if (c.add("number" == typeof r ? r.toString() : r), "__proto__" === r) continue;
                            let l = n.keyType._zod.run({
                                value: r,
                                issues: []
                            }, o);
                            if (l instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                            if (l.issues.length) {
                                i.issues.push({
                                    code: "invalid_key",
                                    origin: "record",
                                    issues: l.issues.map(t => q(t, o, ec())),
                                    input: r,
                                    path: [r],
                                    inst: t
                                });
                                continue
                            }
                            let s = l.value;
                            if ("__proto__" === s) continue;
                            let d = n.valueType._zod.run({
                                value: u[r],
                                issues: []
                            }, o);
                            d instanceof Promise ? a.push(d.then(t => {
                                t.issues.length && i.issues.push(...K(r, t.issues)), i.value[s] = t.value
                            })) : (d.issues.length && i.issues.push(...K(r, d.issues)), i.value[s] = d.value)
                        } for (let t in u)
                        if (!c.has(t))
                            if ("loose" === n.mode) {
                                if ("__proto__" === t) continue;
                                i.value[t] = u[t]
                            } else(s = null != s ? s : []).push(t);
                    s && s.length > 0 && i.issues.push({
                        code: "unrecognized_keys",
                        input: u,
                        inst: t,
                        keys: s,
                        continue: !0
                    })
                } else {
                    let s;
                    for (let c of (i.value = r ? r.alloc(t, i, {}, o) : {}, Reflect.ownKeys(u))) {
                        if ("__proto__" === c || !Object.prototype.propertyIsEnumerable.call(u, c)) continue;
                        let r = n.keyType._zod.run({
                            value: c,
                            issues: []
                        }, o);
                        if (r instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                        if ("string" == typeof c && eK.test(c) && r.issues.length) {
                            let t = n.keyType._zod.run({
                                value: Number(c),
                                issues: []
                            }, o);
                            if (t instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                            0 === t.issues.length && (r = t)
                        }
                        if (r.issues.length) {
                            "loose" === n.mode ? i.value[c] = u[c] : l ? (s = null != s ? s : []).push(c) : i.issues.push({
                                code: "invalid_key",
                                origin: "record",
                                issues: r.issues.map(t => q(t, o, ec())),
                                input: c,
                                path: [c],
                                inst: t
                            });
                            continue
                        }
                        let d = r.value;
                        if ("__proto__" === d) continue;
                        let f = n.valueType._zod.run({
                            value: u[c],
                            issues: []
                        }, o);
                        f instanceof Promise ? a.push(f.then(t => {
                            t.issues.length && i.issues.push(...K(c, t.issues)), i.value[d] = t.value
                        })) : (f.issues.length && i.issues.push(...K(c, f.issues)), i.value[d] = f.value)
                    }
                    s && s.length > 0 && i.issues.push({
                        code: "unrecognized_keys",
                        input: u,
                        inst: t,
                        keys: s,
                        continue: !0
                    })
                }
                return a.length ? Promise.all(a).then(() => i) : i
            }
        }),
        t8 = eu("$ZodEnum", (t, n) => {
            to.init(t, n);
            let r = v(n.entries),
                i = new Set(r);
            t._zod.values = i, er(t, "pattern", t => {
                let n = v(t.def.entries).filter(t => T.has(typeof t));
                return new RegExp(n.length ? "^(".concat(n.map(t => $(t.toString())).join("|"), ")$") : "^[^\\s\\S]$")
            }), t._zod.parse = (n, o) => {
                let u = n.value;
                return i.has(u) || n.issues.push({
                    code: "invalid_value",
                    values: r,
                    input: u,
                    inst: t
                }), n
            }
        }),
        ne = eu("$ZodLiteral", (t, n) => {
            to.init(t, n);
            let r = new Set(n.values);
            t._zod.values = r, er(t, "pattern", t => {
                let n = t.def.values;
                return new RegExp(n.length ? "^(".concat(n.map(t => "string" == typeof t ? $(t) : t ? $(t.toString()) : String(t)).join("|"), ")$") : "^[^\\s\\S]$")
            }), t._zod.parse = (i, o) => {
                let u = i.value;
                return r.has(u) || i.issues.push({
                    code: "invalid_value",
                    values: n.values,
                    input: u,
                    inst: t
                }), i
            }
        }),
        nt = eu("$ZodTransform", (t, n) => {
            var r;
            to.init(t, n), t._zod.optin = "optional", null == (r = es.memoizer) || r.guard(t), t._zod.parse = (r, i) => {
                if ("backward" === i.direction) throw new el(t.constructor.name);
                let o = n.transform(r.value, r);
                if (i.async) return (o instanceof Promise ? o : Promise.resolve(o)).then(t => (r.value = t, r));
                if (o instanceof Promise) throw new ea;
                return r.value = o, r
            }
        });

    function nn(t, n) {
        return t.value = n.issues.length ? void 0 : n.value, t
    }
    let nr = eu("$ZodOptional", (t, n) => {
            to.init(t, n), er(t, "optin", t => "defaulted" === t.def.innerType._zod.optin ? "defaulted" : "optional"), t._zod.optout = "optional", er(t, "values", t => {
                let n = t.def.innerType._zod.values;
                return n ? new Set([...n, void 0]) : void 0
            }), er(t, "pattern", t => {
                let n = t.def.innerType._zod.pattern;
                return n ? RegExp("^(".concat(F(n.source), ")?$")) : void 0
            }), t._zod.parse = (t, r) => {
                if (void 0 === t.value) {
                    if ("defaulted" !== n.innerType._zod.optin) return t;
                    let i = n.innerType._zod.run({
                        value: t.value,
                        issues: []
                    }, r);
                    return i instanceof Promise ? i.then(n => nn(t, n)) : nn(t, i)
                }
                return n.innerType._zod.run(t, r)
            }
        }),
        ni = eu("$ZodExactOptional", (t, n) => {
            nr.init(t, n), er(t, "values", t => t.def.innerType._zod.values), er(t, "pattern", t => t.def.innerType._zod.pattern), t._zod.parse = (t, r) => n.innerType._zod.run(t, r)
        }),
        no = eu("$ZodNullable", (t, n) => {
            to.init(t, n), er(t, "optin", t => t.def.innerType._zod.optin), er(t, "optout", t => t.def.innerType._zod.optout), er(t, "pattern", t => {
                let n = t.def.innerType._zod.pattern;
                return n ? RegExp("^(".concat(F(n.source), "|null)$")) : void 0
            }), er(t, "values", t => t.def.innerType._zod.values ? new Set([...t.def.innerType._zod.values, null]) : void 0), t._zod.parse = (t, r) => null === t.value ? t : n.innerType._zod.run(t, r)
        }),
        nu = eu("$ZodDefault", (t, n) => {
            to.init(t, n), t._zod.optin = "defaulted", er(t, "values", t => t.def.innerType._zod.values), t._zod.parse = (t, r) => {
                if ("backward" === r.direction) return n.innerType._zod.run(t, r);
                if (void 0 === t.value) return t.value = n.defaultValue, t;
                let i = n.innerType._zod.run(t, r);
                return i instanceof Promise ? i.then(t => na(t, n)) : na(i, n)
            }
        });

    function na(t, n) {
        return void 0 === t.value && (t.value = n.defaultValue), t
    }
    let nl = eu("$ZodPrefault", (t, n) => {
            to.init(t, n), t._zod.optin = "defaulted", er(t, "values", t => t.def.innerType._zod.values), t._zod.parse = (t, r) => ("backward" === r.direction || void 0 === t.value && (t.value = n.defaultValue), n.innerType._zod.run(t, r))
        }),
        ns = eu("$ZodNonOptional", (t, n) => {
            to.init(t, n), er(t, "values", t => {
                let n = t.def.innerType._zod.values;
                return n ? new Set([...n].filter(t => void 0 !== t)) : void 0
            }), t._zod.parse = (r, i) => {
                let o = n.innerType._zod.run(r, i);
                return o instanceof Promise ? o.then(n => nc(n, t)) : nc(o, t)
            }
        });

    function nc(t, n) {
        return t.issues.length || void 0 !== t.value || t.issues.push({
            code: "invalid_type",
            expected: "nonoptional",
            input: t.value,
            inst: n
        }), t
    }

    function nd(t, n, r, i) {
        return n.issues.length ? t.value = r.catchValue({
            ...n,
            value: t.value,
            error: {
                issues: n.issues.map(t => q(t, i, ec()))
            },
            input: t.value
        }) : (t.value = n.value, n.memo && (t.memo = !0)), t
    }
    let nf = eu("$ZodCatch", (t, n) => {
            to.init(t, n), er(t, "optin", t => "defaulted" === t.def.innerType._zod.optin ? "defaulted" : "optional"), er(t, "optout", t => t.def.innerType._zod.optout), er(t, "values", t => t.def.innerType._zod.values), t._zod.parse = (t, r) => {
                if ("backward" === r.direction) return n.innerType._zod.run(t, r);
                let i = n.innerType._zod.run({
                    value: t.value,
                    issues: []
                }, r);
                return i instanceof Promise ? i.then(i => nd(t, i, n, r)) : nd(t, i, n, r)
            }
        }),
        np = eu("$ZodPipe", (t, n) => {
            to.init(t, n), er(t, "values", t => t.def.in._zod.values), er(t, "optin", t => t.def.in._zod.optin), er(t, "optout", t => t.def.out._zod.optout), er(t, "propValues", t => t.def.in._zod.propValues), t._zod.parse = (t, r) => {
                if ("backward" === r.direction) {
                    let i = n.out._zod.run(t, r);
                    return i instanceof Promise ? i.then(t => nh(t, n.in, r)) : nh(i, n.in, r)
                }
                let i = n.in._zod.run(t, r);
                return i instanceof Promise ? i.then(t => nh(t, n.out, r)) : nh(i, n.out, r)
            }
        });

    function nh(t, n, r) {
        return t.issues.some(t => "unrecognized_keys" !== t.code) ? (t.aborted = !0, t) : n._zod.run({
            value: t.value,
            issues: t.issues
        }, r)
    }
    let nm = eu("$ZodReadonly", (t, n) => {
        to.init(t, n), er(t, "propValues", t => t.def.innerType._zod.propValues), er(t, "values", t => t.def.innerType._zod.values), er(t, "optin", t => {
            var n, r;
            return null == (r = t.def.innerType) || null == (n = r._zod) ? void 0 : n.optin
        }), er(t, "optout", t => {
            var n, r;
            return null == (r = t.def.innerType) || null == (n = r._zod) ? void 0 : n.optout
        }), t._zod.parse = (t, r) => {
            if ("backward" === r.direction) return n.innerType._zod.run(t, r);
            let i = n.innerType._zod.run(t, r);
            return i instanceof Promise ? i.then(nv) : nv(i)
        }
    });

    function nv(t) {
        return t.memo || (t.value = Object.freeze(t.value)), t
    }
    let ng = eu("$ZodCustom", (t, n) => {
        eG.init(t, n), to.init(t, n), t._zod.parse = (t, n) => t, t._zod.check = r => {
            let i = r.value,
                o = n.fn(i);
            if (o instanceof Promise) return o.then(n => ny(n, r, i, t));
            ny(o, r, i, t)
        }
    });

    function ny(t, n, r, i) {
        if (!t) {
            var o;
            let t = {
                code: "custom",
                input: r,
                inst: i,
                path: [...null != (o = i._zod.def.path) ? o : []],
                continue: !i._zod.def.abort
            };
            i._zod.def.params && (t.params = i._zod.def.params), n.issues.push(Y(t))
        }
    }
    class n_ extends Error {
        constructor() {
            super("Cannot parse a reference cycle that closes through a transform"), this.name = "ZodCyclicError"
        }
    }
    let nb = "~memo",
        nF = [];

    function nw(t) {
        return null !== t && "object" == typeof t
    }

    function nz(t) {
        return t.map(t => t.path ? {
            ...t,
            path: t.path.slice()
        } : {
            ...t
        })
    }
    let nk = new WeakMap,
        nO = [],
        nA = {
            alloc(t, n, i) {
                let o = r;
                if (!o) return i;
                r = void 0;
                let u = {
                    value: i,
                    issues: null
                };
                return o.set(n.value, u), nO.push(u), i
            },
            guard(t) {
                var n;
                null != (n = t._zod).deferred || (n.deferred = []), t._zod.deferred.push(() => {
                    let n = t._zod.parse,
                        r = (t, r) => {
                            var i, o;
                            let u;
                            if ("backward" !== r.direction && (o = t.value, void 0 !== (u = null == (i = r[nb]) ? void 0 : i.backEdges) && nw(o) && u.has(o))) throw new n_;
                            return n(t, r)
                        };
                    t._zod.parse = r, t._zod.run === n && (t._zod.run = r)
                })
            },
            attach(t) {
                var n;
                let i, o, u, a = !1;
                null != (n = t._zod).deferred || (n.deferred = []), t._zod.deferred.push(() => {
                    let n = t._zod.parse,
                        l = (s, c) => {
                            var d;
                            let f;
                            if (void 0 === i) {
                                let r = function t(n, r, i) {
                                    var o, u;
                                    let a = nk.get(n);
                                    if (void 0 !== a) return 2 * !!a;
                                    if (r.has(n)) return 2;
                                    r.add(n);
                                    let l = 0,
                                        s = n => {
                                            if (2 !== l && (null == n ? void 0 : n._zod)) {
                                                let i = t(n, r);
                                                i > l && (l = i)
                                            }
                                        },
                                        c = t => {
                                            t > l && (l = t)
                                        },
                                        d = n._zod.def;
                                    switch (d.type) {
                                        case "object": {
                                            let n = z(d);
                                            c(n ? (n => {
                                                let i = 0;
                                                for (let u of Reflect.ownKeys(n)) {
                                                    var o;
                                                    let a = Object.getOwnPropertyDescriptor(n, u);
                                                    if (!a.enumerable) continue;
                                                    let l = a.get ? 1 : (null == (o = a.value) ? void 0 : o._zod) ? t(a.value, r) : 0;
                                                    l > i && (i = l)
                                                }
                                                return i
                                            })(n) : 1), s(d.catchall);
                                            break
                                        }
                                        case "array":
                                            s(d.element);
                                            break;
                                        case "tuple":
                                            for (let t of d.items) s(t);
                                            s(d.rest);
                                            break;
                                        case "record":
                                        case "map":
                                            s(d.keyType), s(d.valueType);
                                            break;
                                        case "set":
                                            s(d.valueType);
                                            break;
                                        case "union":
                                            for (let t of d.options) s(t);
                                            break;
                                        case "intersection":
                                            s(d.left), s(d.right);
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
                                            s(d.innerType);
                                            break;
                                        case "pipe":
                                            s(d.in), s(d.out);
                                            break;
                                        case "function":
                                            s(d.input), s(d.output);
                                            break;
                                        case "lazy": {
                                            let n = null != (u = d._cachedInner) ? u : void 0;
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
                                                    if (r._zod) s(r);
                                                    else if (Array.isArray(r))
                                                        for (let t of r) s(t)
                                                }
                                            }
                                    }
                                    return r.delete(n), 1 !== (o = l) && nk.set(n, 2 === o), o
                                }(t, new Set);
                                if (0 === r) return t._zod.parse = n, t._zod.run === l && (t._zod.run = n), n(s, c);
                                2 === r || a ? i = !0 : a = !0
                            }
                            let p = s.value;
                            if (!nw(p)) return n(s, c);
                            let h = c[nb];
                            if (h || (h = {
                                    buckets: new WeakMap,
                                    backEdges: void 0
                                }, c[nb] = h), o === c) f = u;
                            else {
                                let n;
                                (n = (d = h).buckets.get(t)) || (n = new WeakMap, d.buckets.set(t, n)), f = n, o = c, u = f
                            }
                            let m = f.get(p);
                            if (m) return s.value = m.value, m.issues ? m.issues.length && s.issues.push(...nz(m.issues)) : (s.memo = !0, null != h.backEdges || (h.backEdges = new WeakSet), h.backEdges.add(m.value)), s;
                            r = f;
                            let v = nO.length,
                                g = n(s, c);
                            r = void 0;
                            let y = nO.length > v ? nO.pop() : void 0;
                            return g instanceof Promise ? g.then(t => (y && (y.issues = t.issues.length ? nz(t.issues) : nF), t)) : (y && (y.issues = g.issues.length ? nz(g.issues) : nF), g)
                        };
                    t._zod.parse = l, t._zod.run === n && (t._zod.run = l)
                })
            }
        };
    null != (h = globalThis).__zod_globalRegistry || (h.__zod_globalRegistry = new class {
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
    let nE = globalThis.__zod_globalRegistry;

    function nS(t) {
        return t.checks && (t.checks = [...t.checks]), t
    }

    function nx(t, n) {
        return new t({
            type: "string",
            format: "date",
            check: "string_format",
            ...C(n)
        })
    }

    function nj(t, n) {
        return new eY({
            check: "less_than",
            ...C(n),
            value: t,
            inclusive: !1
        })
    }

    function nP(t, n) {
        return new eY({
            check: "less_than",
            ...C(n),
            value: t,
            inclusive: !0
        })
    }

    function nZ(t, n) {
        return new eQ({
            check: "greater_than",
            ...C(n),
            value: t,
            inclusive: !1
        })
    }

    function nI(t, n) {
        return new eQ({
            check: "greater_than",
            ...C(n),
            value: t,
            inclusive: !0
        })
    }

    function nT(t, n) {
        return new e0({
            check: "multiple_of",
            ...C(n),
            value: t
        })
    }

    function n$(t, n) {
        return new e2({
            check: "max_length",
            ...C(n),
            maximum: t
        })
    }

    function nN(t, n) {
        return new e6({
            check: "min_length",
            ...C(n),
            minimum: t
        })
    }

    function nC(t, n) {
        return new e9({
            check: "length_equals",
            ...C(n),
            length: t
        })
    }

    function nD(t) {
        return new tn({
            check: "overwrite",
            tx: t
        })
    }

    function nB(t) {
        for (var n = arguments.length, r = Array(n > 1 ? n - 1 : 0), i = 1; i < n; i++) r[i - 1] = arguments[i];
        for (let n of r)
            for (let r of Reflect.ownKeys(n)) Object.prototype.propertyIsEnumerable.call(n, r) && w(t, r, n[r]);
        return t
    }

    function nR(t) {
        var n, r, i, o, u, a, l, s, c;
        let d = null != (n = null == t ? void 0 : t.target) ? n : "draft-2020-12";
        return "draft-4" === d && (d = "draft-04"), "draft-7" === d && (d = "draft-07"), {
            processors: null != (r = t.processors) ? r : {},
            metadataRegistry: null != (i = null == t ? void 0 : t.metadata) ? i : nE,
            target: d,
            unrepresentable: null != (o = null == t ? void 0 : t.unrepresentable) ? o : "throw",
            override: null != (u = null == t ? void 0 : t.override) ? u : () => {},
            io: null != (a = null == t ? void 0 : t.io) ? a : "output",
            counter: 0,
            seen: new Map,
            sharedDefsExtractedFor: void 0,
            sharedEmitDoneFor: void 0,
            cycles: null != (l = null == t ? void 0 : t.cycles) ? l : "ref",
            reused: null != (s = null == t ? void 0 : t.reused) ? s : "inline",
            intersections: [],
            deferred: [],
            external: null != (c = null == t ? void 0 : t.external) ? c : void 0
        }
    }

    function nU(t, n, r, i, o) {
        let u = "function" == typeof n.unrepresentable ? n.unrepresentable({
            zodSchema: t,
            path: i.path,
            message: o
        }) : n.unrepresentable;
        if ("any" === u) return !1;
        if (void 0 === u || "throw" === u) throw Error(o);
        return Object.assign(r, u), !0
    }

    function nJ(t, n) {
        var r, i, o;
        let u = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {
                path: [],
                schemaPath: []
            },
            a = t._zod.def,
            l = n.seen.get(t);
        if (l) return l.count++, u.schemaPath.includes(t) && (l.cycle = u.path), l.schema;
        let s = {
            schema: {},
            count: 1,
            cycle: void 0,
            path: u.path
        };
        n.seen.set(t, s), n.sharedDefsExtractedFor = void 0, n.sharedEmitDoneFor = void 0;
        let c = null == (r = (i = t._zod).toJSONSchema) ? void 0 : r.call(i);
        if (c) s.schema = c;
        else {
            let r = {
                ...u,
                schemaPath: [...u.schemaPath, t],
                path: u.path
            };
            if (t._zod.processJSONSchema) t._zod.processJSONSchema(n, s.schema, r);
            else {
                let i = s.schema,
                    o = n.processors[a.type];
                if (!o) throw Error("[toJSONSchema]: Non-representable type encountered: ".concat(a.type));
                o(t, n, i, r)
            }
            let i = t._zod.parent;
            i && (s.ref || (s.ref = i), nJ(i, n, r), n.seen.get(i).isParent = !0)
        }
        let d = n.metadataRegistry.get(t);
        return d && nB(s.schema, d), "input" === n.io && function t(n, r) {
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
        }(t) && (delete s.schema.examples, delete s.schema.default), "input" === n.io && "_prefault" in s.schema && (null != (o = s.schema).default || (o.default = s.schema._prefault)), delete s.schema._prefault, n.seen.get(t).schema
    }

    function nM(t) {
        return t.replace(/~/g, "~0").replace(/\//g, "~1")
    }

    function nL(t, n) {
        var r, i, o, u;
        let a = t.seen.get(n);
        if (!a) throw Error("Unprocessed schema. This is a bug in Zod.");
        if (t.external && t.sharedDefsExtractedFor === t.external) return;
        let l = new Map;
        for (let n of t.seen.entries()) {
            let i = null == (r = t.metadataRegistry.get(n[0])) ? void 0 : r.id;
            if (i) {
                let t = l.get(i);
                if (t && t !== n[0]) throw Error('Duplicate schema id "'.concat(i, '" detected during JSON Schema conversion. Two different schemas cannot share the same id when converted together.'));
                l.set(i, n[0])
            }
        }
        let s = n => {
            if (n[1].schema.$ref) return;
            let r = n[1],
                {
                    ref: i,
                    defId: o
                } = (n => {
                    var r, i, o, u, l;
                    let s = "draft-2020-12" === t.target ? "$defs" : "definitions";
                    if (t.external) {
                        let r = null == (l = t.external.registry.get(n[0])) ? void 0 : l.id,
                            a = null != (i = t.external.uri) ? i : t => t;
                        if (r) return {
                            ref: a(r)
                        };
                        let c = null != (o = null != (u = n[1].defId) ? u : n[1].schema.id) ? o : "schema".concat(t.counter++);
                        return n[1].defId = c, {
                            defId: c,
                            ref: "".concat(a("__shared"), "#/").concat(s, "/").concat(nM(c))
                        }
                    }
                    let c = "#/".concat(s, "/");
                    if (n[1] === a && !n[1].schema.id) return {
                        ref: "#"
                    };
                    let d = null != (r = n[1].schema.id) ? r : "__schema".concat(t.counter++);
                    return {
                        defId: d,
                        ref: c + nM(d)
                    }
                })(n);
            r.def = {
                ...r.schema
            }, o && (r.defId = o);
            let u = r.schema;
            for (let t in u) delete u[t];
            u.$ref = i
        };
        if ("throw" === t.cycles)
            for (let n of t.seen.entries()) {
                let t = n[1];
                if (t.cycle) throw Error("Cycle detected: #/".concat(null == (i = t.cycle) ? void 0 : i.join("/"), '/<root>\n\nSet the `cycles` parameter to `"ref"` to resolve cyclical schemas with defs.'))
            }
        for (let r of t.seen.entries()) {
            let i = r[1];
            if (n === r[0]) {
                s(r);
                continue
            }
            if (t.external) {
                let i = null == (u = t.external.registry.get(r[0])) ? void 0 : u.id;
                if (n !== r[0] && i) {
                    s(r);
                    continue
                }
            }
            if ((null == (o = t.metadataRegistry.get(r[0])) ? void 0 : o.id) || i.cycle) {
                s(r);
                continue
            }
            i.count > 1 && "ref" === t.reused && s(r)
        }
        t.external && (t.sharedDefsExtractedFor = t.external)
    }
    let nK = new Set(["type", "properties", "required", "additionalProperties"]),
        nV = ["oneOf", "anyOf"];

    function nW(t) {
        let n = t.additionalProperties;
        return void 0 === n || !1 === n || "object" != typeof n || null === n ? null : Object.keys(n).length ? n : null
    }

    function nq(t) {
        let n = [];
        for (let r of t) {
            if ("object" != typeof r || "object" !== r.type) return null;
            for (let t in r)
                if (!nK.has(t)) return null;
            n.push(r)
        }
        let r = {},
            i = new Set;
        for (let t of n) {
            var o, u, a, l;
            for (let i in t.properties) {
                if (Object.prototype.hasOwnProperty.call(r, i)) continue;
                let t = [];
                for (let r of n) {
                    let n = null != (a = null == (l = r.properties) ? void 0 : l[i]) ? a : nW(r);
                    null != n && (t.some(t => JSON.stringify(t) === JSON.stringify(n)) || t.push(n))
                }
                w(r, i, 1 === t.length ? t[0] : null != (u = nq(t)) ? u : {
                    allOf: t
                })
            }
            for (let n of null != (o = t.required) ? o : []) i.add(n)
        }
        let s = {
            type: "object",
            properties: r
        };
        if (i.size && (s.required = [...i]), n.every(t => !1 === t.additionalProperties)) s.additionalProperties = !1;
        else {
            let t = [];
            for (let r of n) {
                let n = nW(r);
                n && !t.some(t => JSON.stringify(t) === JSON.stringify(n)) && t.push(n)
            }
            1 === t.length ? s.additionalProperties = t[0] : t.length > 1 && (s.additionalProperties = {
                allOf: t
            })
        }
        return s
    }

    function nG(t, n) {
        var r, i, o, u, a, l, s, c;
        let d = t.seen.get(n);
        if (!d) throw Error("Unprocessed schema. This is a bug in Zod.");
        let f = n => {
            var r, i, o;
            let u = t.seen.get(n);
            if (null === u.ref) return;
            let a = null != (r = u.def) ? r : u.schema,
                l = {
                    ...a
                },
                s = u.ref;
            if (u.ref = null, s) {
                f(s);
                let r = t.seen.get(s),
                    i = r.schema;
                if (i.$ref && ("draft-07" === t.target || "draft-04" === t.target || "openapi-3.0" === t.target) ? (a.allOf = null != (o = a.allOf) ? o : [], a.allOf.push(i)) : nB(a, i), nB(a, l), n._zod.parent === s)
                    for (let t in a) "$ref" !== t && "allOf" !== t && (t in l || delete a[t]);
                if (i.$ref && r.def)
                    for (let t in a) "$ref" !== t && "allOf" !== t && t in r.def && JSON.stringify(a[t]) === JSON.stringify(r.def[t]) && delete a[t]
            }
            let c = n._zod.parent;
            if (c && c !== s) {
                f(c);
                let n = t.seen.get(c);
                if ((null == n ? void 0 : n.schema.$ref) && (a.$ref = n.schema.$ref, n.def))
                    for (let t in a) "$ref" !== t && "allOf" !== t && t in n.def && JSON.stringify(a[t]) === JSON.stringify(n.def[t]) && delete a[t]
            }
            t.override({
                zodSchema: n,
                jsonSchema: a,
                path: null != (i = u.path) ? i : []
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
                }(null != (l = n[1].def) ? l : n[1].schema);
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
                    for (let t of null != (s = n.get(r)) ? s : []) ! function(t) {
                        let n = t.allOf;
                        if (!Array.isArray(n) || n.length < 2) return;
                        for (let n of nK)
                            if (n in t) return;
                        let r = n.filter(t => nV.some(n => Array.isArray(t[n]))),
                            i = null;
                        if (r.length) {
                            let t = r[0],
                                o = nV.find(n => Array.isArray(t[n]));
                            if (1 !== Object.keys(t).length) return;
                            let u = n.filter(n => n !== t),
                                a = t[o].map(t => nq([...u, t]));
                            if (a.some(t => !t)) return;
                            i = {
                                [o]: a
                            }
                        } else i = nq(n);
                        i && (delete t.allOf, nB(t, i))
                    }(t)
            }
        }
        let p = {};
        if ("draft-2020-12" === t.target ? p.$schema = "https://json-schema.org/draft/2020-12/schema" : "draft-07" === t.target ? p.$schema = "http://json-schema.org/draft-07/schema#" : "draft-04" === t.target ? p.$schema = "http://json-schema.org/draft-04/schema#" : t.target, null == (o = t.external) ? void 0 : o.uri) {
            let r = null == (c = t.external.registry.get(n)) ? void 0 : c.id;
            if (!r) throw Error("Schema is missing an `id` property");
            p.$id = t.external.uri(r)
        }
        nB(p, d.defId ? d.schema : null != (r = d.def) ? r : d.schema);
        let h = null == (u = t.metadataRegistry.get(n)) ? void 0 : u.id;
        void 0 !== h && p.id === h && delete p.id;
        let m = null != (i = null == (a = t.external) ? void 0 : a.defs) ? i : {};
        if (!t.external || t.sharedEmitDoneFor !== t.external)
            for (let n of t.seen.entries()) {
                let t = n[1];
                t.def && t.defId && (t.def.id === t.defId && delete t.def.id, w(m, t.defId, t.def))
            }
        t.external && (t.sharedEmitDoneFor = t.external), t.external || Object.keys(m).length > 0 && ("draft-2020-12" === t.target ? p.$defs = m : p.definitions = m);
        try {
            let r = JSON.parse(JSON.stringify(p));
            return Object.defineProperty(r, "~standard", {
                value: {
                    ...n["~standard"],
                    jsonSchema: {
                        input: nX(n, "input", t.processors),
                        output: nX(n, "output", t.processors)
                    }
                },
                enumerable: !1,
                writable: !1
            }), r
        } catch (t) {
            throw Error("Error converting schema to JSON.")
        }
    }
    let nX = function(t, n) {
            let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
            return i => {
                let {
                    libraryOptions: o,
                    target: u
                } = null != i ? i : {}, a = nR({
                    ...null != o ? o : {},
                    target: u,
                    io: n,
                    processors: r
                });
                return nJ(t, a), nL(a, t), nG(a, t)
            }
        },
        nH = (t, n, r) => {
            (void 0 === t[n] || r > t[n]) && (t[n] = r)
        },
        nY = (t, n, r) => {
            (void 0 === t[n] || r < t[n]) && (t[n] = r)
        },
        nQ = (t, n) => {
            nH(t, "minimum", n), nY(t, "maximum", n)
        },
        n0 = (t, n) => {
            null != t.multipleOf || (t.multipleOf = []), t.multipleOf.includes(n) || t.multipleOf.push(n)
        },
        n1 = (t, n) => {
            null != t.patterns || (t.patterns = new Set), t.patterns.add(n)
        },
        n2 = (t, n) => {
            t.mime = t.mime ? t.mime.filter(t => n.includes(t)) : [...n]
        },
        n6 = (t, n) => {
            t.format = n, n.includes("int") && (t.isInt = !0)
        },
        n9 = (t, n) => nH(t, "minimum", n.minimum),
        n4 = (t, n) => nY(t, "maximum", n.maximum),
        n5 = t => (n, r) => {
            n6(n, r.format);
            let [i, o] = t[r.format];
            nH(n, "minimum", i), nY(n, "maximum", o)
        },
        n3 = {
            greater_than: (t, n) => nH(t, n.inclusive ? "minimum" : "exclusiveMinimum", n.value),
            less_than: (t, n) => nY(t, n.inclusive ? "maximum" : "exclusiveMaximum", n.value),
            multiple_of: (t, n) => n0(t, n.value),
            number_format: n5(B),
            bigint_format: n5(R),
            min_length: n9,
            max_length: n4,
            length_equals: (t, n) => nQ(t, n.length),
            min_size: n9,
            max_size: n4,
            size_equals: (t, n) => nQ(t, n.size),
            string_format: (t, n) => {
                n6(t, n.format), n.pattern && n1(t, n.pattern), ("base64" === n.format || "base64url" === n.format) && (t.contentEncoding = n.format), (n.local || -1 === n.precision) && (t.laxFormat = !0)
            },
            mime_type: (t, n) => n2(t, n.mime)
        };

    function n7(t) {
        var n, r, i, o;
        let u = {},
            a = t._zod.def;
        for (let i of t._zod.traits.has("$ZodCheck") ? [t, ...null != (n = a.checks) ? n : []] : null != (r = a.checks) ? r : []) null == (o = n3[i._zod.def.check]) || o.call(n3, u, i._zod.def);
        let l = t._zod.bag;
        for (let t of (void 0 !== l.minimum && nH(u, "minimum", l.minimum), void 0 !== l.exclusiveMinimum && nH(u, "exclusiveMinimum", l.exclusiveMinimum), void 0 !== l.maximum && nY(u, "maximum", l.maximum), void 0 !== l.exclusiveMaximum && nY(u, "exclusiveMaximum", l.exclusiveMaximum), void 0 !== l.multipleOf && n0(u, l.multipleOf), void 0 !== l.format && (null != u.format || (u.format = l.format), l.format.includes("int") && (u.isInt = !0)), l.mime && n2(u, l.mime), null != (i = l.patterns) ? i : [])) n1(u, t);
        return u
    }
    let n8 = {
            guid: "uuid",
            url: "uri",
            datetime: "date-time",
            json_string: "json-string",
            regex: ""
        },
        re = new Map([
            [tN, /^$|^(?:[0-9a-zA-Z+/]{4})*(?:(?:[0-9a-zA-Z+/]{2}==)|(?:[0-9a-zA-Z+/]{3}=))?$/],
            [tD, /^(?:[A-Za-z0-9_-]{4})*(?:[A-Za-z0-9_-]{2,3})?$/]
        ]),
        rt = t => {
            var n;
            return null != (n = re.get(t)) ? n : t
        };

    function rn(t) {
        let n = t._zod.def;
        return "pipe" === n.type && n.in._zod.traits.has("$ZodTransform") ? rn(n.out) : "catch" === n.type ? rn(n.innerType) : t._zod.optin
    }
    let rr = (t, n, r, i) => {
            let o = t._zod.def,
                u = !1 === o.inclusive,
                a = o.options.map((t, r) => nJ(t, n, {
                    ...i,
                    path: [...i.path, u ? "oneOf" : "anyOf", r]
                }));
            u ? r.oneOf = a : r.anyOf = a
        },
        ri = new WeakMap,
        ro = Symbol();

    function ru(t, n, r, i, o) {
        let u = !1,
            a = JSON.stringify(t, (t, n) => "bigint" != typeof n ? n : (u = !0, null));
        return u ? (nU(n, r, i, o, "BigInt defaults cannot be represented in JSON Schema"), ro) : JSON.parse(a)
    }
    let ra = (t, n, r, i) => {
            let o = t._zod.def;
            nJ(o.innerType, n, i), n.seen.get(t).ref = o.innerType
        },
        rl = new WeakSet([Object.prototype, Error.prototype]);

    function rs(t, n, r) {
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
    let rc = eu("ZodError", (t, n) => {
            eh.init(t, n), t.name = "ZodError";
            let r = Object.getPrototypeOf(t);
            rl.has(r) || (rl.add(r), rs(r, "format", t => n => (function(t) {
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : t => t.message,
                    r = {
                        _errors: []
                    },
                    i = function(t) {
                        let o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [];
                        for (let u of t.issues)
                            if ("invalid_union" === u.code && u.errors.length) u.errors.map(t => i({
                                issues: t
                            }, [...o, ...u.path]));
                            else if ("invalid_key" === u.code) i({
                            issues: u.issues
                        }, [...o, ...u.path]);
                        else if ("invalid_element" === u.code) i({
                            issues: u.issues
                        }, [...o, ...u.path]);
                        else {
                            let t = [...o, ...u.path];
                            if (0 === t.length) r._errors.push(n(u));
                            else {
                                let i = r,
                                    o = 0;
                                for (; o < t.length;) {
                                    let r = t[o],
                                        a = o === t.length - 1;
                                    if ("_errors" === r) {
                                        a && i._errors.push(n(u)), o++;
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
                                    let l = i[r];
                                    a && l._errors.push(n(u)), i = l, o++
                                }
                            }
                        }
                    };
                return i(t), r
            })(t, n)), rs(r, "flatten", t => n => (function(t) {
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : t => t.message,
                    r = {},
                    i = [];
                for (let a of t.issues)
                    if (a.path.length > 0) {
                        var o, u;
                        (o = a.path[0], u = () => [], !Object.prototype.hasOwnProperty.call(r, o) && ("__proto__" === o ? Object.defineProperty(r, o, {
                            value: u(),
                            writable: !0,
                            enumerable: !0,
                            configurable: !0
                        }) : r[o] = u()), r[o]).push(n(a))
                    } else i.push(n(a));
                return {
                    formErrors: i,
                    fieldErrors: r
                }
            })(t, n)), rs(r, "addIssue", t => n => {
                t.issues.push(n), t.message = JSON.stringify(t.issues, y, 2)
            }), rs(r, "addIssues", t => n => {
                t.issues.push(...n), t.message = JSON.stringify(t.issues, y, 2)
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
        rd = ev(rc),
        rf = eg(rc),
        rp = ey(rc),
        rh = eb(rc),
        rm = (o = ev(rc), u = (t, n, r, i) => o(t, n, r ? {
            ...r,
            direction: "backward"
        } : {
            direction: "backward"
        }, em(u, i))),
        rv = (a = ev(rc), l = (t, n, r, i) => a(t, n, r, em(l, i))),
        rg = (s = eg(rc), c = async (t, n, r, i) => {
            let o = r ? {
                ...r,
                direction: "backward"
            } : {
                direction: "backward"
            };
            return await s(t, n, o, em(c, i))
        }),
        ry = (d = eg(rc), f = async (t, n, r, i) => await d(t, n, r, em(f, i))),
        r_ = async (t, n, r) => {
            let i = r ? {
                ...r,
                direction: "backward"
            } : {
                direction: "backward"
            };
            return eb(rc)(t, n, i)
        }, rb = async (t, n, r) => eb(rc)(t, n, r);

    function rF() {
        es.memoizer || ec({
            memoizer: nA
        })
    }
    let rw = eu("ZodType", (t, n) => (es.localeError || ec({
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
                    var o, u, a, l, s, c;
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
                            if (1 === r.values.length) return "Invalid input: expected ".concat(D(r.values[0]));
                            return "Invalid option: expected one of ".concat(g(r.values, "|"));
                        case "too_big": {
                            let n = r.exact ? "exactly " : r.inclusive ? "<=" : "<",
                                i = null != (o = t[r.origin]) ? o : null;
                            if (i) return "Too big: expected ".concat(null != (u = r.origin) ? u : "value", " to have ").concat(n).concat(r.maximum.toString(), " ").concat(null != (a = i.unit) ? a : "elements");
                            return "Too big: expected ".concat(null != (l = r.origin) ? l : "value", " to be ").concat(n).concat(r.maximum.toString())
                        }
                        case "too_small": {
                            let n = r.exact ? "exactly " : r.inclusive ? ">=" : ">",
                                i = null != (s = t[r.origin]) ? s : null;
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
                            return "Unrecognized key".concat(r.keys.length > 1 ? "s" : "", ": ").concat(g(r.keys, ", "));
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
        }), to.init(t, n), t.def = n, t.type = n.type, t), {
            check() {
                for (var t, n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
                let o = this.def;
                return this.clone(S(o, {
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
                return N(this, t, n)
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
                    return new iE({
                        type: "custom",
                        check: "custom",
                        fn: t,
                        ...C(n)
                    })
                }(t, n))
            },
            superRefine(t, n) {
                var r;
                let i, o;
                return this.check((r = n => (n.addIssue = t => {
                    "string" == typeof t ? n.issues.push(Y(t, n.value, i._zod.def)) : (t.fatal && (t.continue = !1), null != t.code || (t.code = "custom"), "input" in t || (t.input = n.value), null != t.inst || (t.inst = i), null != t.continue || (t.continue = !i._zod.def.abort), n.issues.push(Y(t)))
                }, t(n.value, n)), (o = new eG({
                    check: "custom",
                    ...C(n)
                }))._zod.check = r, i = o))
            },
            overwrite(t) {
                return this.check(nD(t))
            },
            optional() {
                return iv(this)
            },
            exactOptional() {
                return new ig({
                    type: "optional",
                    innerType: this
                })
            },
            nullable() {
                return i_(this)
            },
            nullish() {
                return iv(i_(this))
            },
            nonoptional(t) {
                return new iw({
                    type: "nonoptional",
                    innerType: this,
                    ...C(t)
                })
            },
            array() {
                return r7(this)
            },
            or(t) {
                return ii([this, t])
            },
            and(t) {
                return new ia({
                    type: "intersection",
                    left: this,
                    right: t
                })
            },
            transform(t) {
                return iO(this, new ih({
                    type: "transform",
                    transform: t
                }))
            },
            default (t) {
                return new ib({
                    type: "default",
                    innerType: this,
                    get defaultValue() {
                        return "function" == typeof t ? t() : I(t)
                    }
                })
            },
            prefault(t) {
                return new iF({
                    type: "prefault",
                    innerType: this,
                    get defaultValue() {
                        return "function" == typeof t ? t() : I(t)
                    }
                })
            },
            catch (t) {
                let n;
                return new iz({
                    type: "catch",
                    innerType: this,
                    catchValue: "function" == typeof t ? t : ((n = () => t)["~constantCatch"] = !0, n)
                })
            },
            pipe(t) {
                return iO(this, t)
            },
            readonly() {
                return new iA({
                    type: "readonly",
                    innerType: this
                })
            },
            describe(t) {
                let n = this.clone();
                return nE.add(n, {
                    description: t
                }), n
            },
            meta() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                if (0 === n.length) return nE.get(this);
                let i = this.clone();
                return nE.add(i, n[0]), i
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
                return Q(this, "~standard", {
                    ...tl(this),
                    jsonSchema: {
                        input: nX(this, "input"),
                        output: nX(this, "output")
                    }
                }, !1)
            },
            set "~standard"(value) {
                Q(this, "~standard", value)
            },
            parse: function t(n, r) {
                return rd(this, n, r, {
                    callee: t
                })
            },
            parseAsync: async function t(n, r) {
                return await rf(this, n, r, {
                    callee: t
                })
            },
            safeParse(t, n) {
                return rp(this, t, n)
            },
            async safeParseAsync(t, n) {
                return rh(this, t, n)
            },
            get spa() {
                return null === this || void 0 === this ? void 0 : this.safeParseAsync
            },
            set spa(value) {
                Q(this, "spa", value)
            },
            validate(t, n) {
                let r = this._zod.bag.validator;
                if (void 0 !== r) {
                    if (r(t) !== eF) return !0;
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
                        u = t._zod.bag.fallbackRun;
                    if (u ? (o[ew] = !0, i = u({
                            value: n,
                            issues: []
                        }, o)) : i = t._zod.run({
                            value: n,
                            issues: []
                        }, o), i instanceof Promise) throw new ea;
                    return 0 === i.issues.length
                }(this, t, n)
            },
            validateAsync(t, n) {
                return ez(this, t, n)
            },
            encode: function t(n, r) {
                return rm(this, n, r, {
                    callee: t
                })
            },
            decode: function t(n, r) {
                return rv(this, n, r, {
                    callee: t
                })
            },
            encodeAsync: async function t(n, r) {
                return await rg(this, n, r, {
                    callee: t
                })
            },
            decodeAsync: async function t(n, r) {
                return await ry(this, n, r, {
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
                }, ey(rc)(this, t, r)
            },
            safeDecode(t, n) {
                return ey(rc)(this, t, n)
            },
            async safeEncodeAsync(t, n) {
                return r_(this, t, n)
            },
            async safeDecodeAsync(t, n) {
                return rb(this, t, n)
            },
            toJSONSchema(t) {
                return (function(t) {
                    let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    return r => {
                        let i = nR({
                            ...r,
                            processors: n
                        });
                        return nJ(t, i), nL(i, t), nG(i, t)
                    }
                })(this, {})(t)
            },
            get description() {
                var rz;
                return null == (rz = nE.get(this)) ? void 0 : rz.description
            },
            get _def() {
                return this._zod.def
            }
        }),
        rk = eu("_ZodString", (t, n) => {
            ts.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (n, r, i) => ((t, n, r) => {
                var i;
                r.type = "string";
                let {
                    minimum: o,
                    maximum: u,
                    format: a,
                    patterns: l,
                    contentEncoding: s,
                    laxFormat: c
                } = n7(t);
                if ("number" == typeof o && (r.minLength = o), "number" == typeof u && (r.maxLength = u), a && (r.format = null != (i = n8[a]) ? i : a, "" === r.format && delete r.format, ("time" === a || c) && delete r.format), s && (r.contentEncoding = s), l && l.size > 0) {
                    let t = [...l].map(rt);
                    1 === t.length ? r.pattern = t[0].source : t.length > 1 && (r.allOf = [...t.map(t => ({
                        ..."draft-07" === n.target || "draft-04" === n.target || "openapi-3.0" === n.target ? {
                            type: "string"
                        } : {},
                        pattern: t.source
                    }))])
                }
            })(t, n, r)
        }, ee({
            format: t => {
                var n;
                return null != (n = n7(t).format) ? n : null
            },
            minLength: t => {
                var n;
                return null != (n = n7(t).minimum) ? n : null
            },
            maxLength: t => {
                var n;
                return null != (n = n7(t).maximum) ? n : null
            }
        }, {
            regex() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(function(t, n) {
                    return new e5({
                        check: "string_format",
                        format: "regex",
                        ...C(n),
                        pattern: t
                    })
                }(...n))
            },
            includes() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(function(t, n) {
                    return new e8({
                        check: "string_format",
                        format: "includes",
                        ...C(n),
                        includes: t
                    })
                }(...n))
            },
            startsWith() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(function(t, n) {
                    return new te({
                        check: "string_format",
                        format: "starts_with",
                        ...C(n),
                        prefix: t
                    })
                }(...n))
            },
            endsWith() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(function(t, n) {
                    return new tt({
                        check: "string_format",
                        format: "ends_with",
                        ...C(n),
                        suffix: t
                    })
                }(...n))
            },
            min() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(nN(...n))
            },
            max() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(n$(...n))
            },
            length() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(nC(...n))
            },
            nonempty() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(nN(1, ...n))
            },
            lowercase(t) {
                return this.check(new e3({
                    check: "string_format",
                    format: "lowercase",
                    ...C(t)
                }))
            },
            uppercase(t) {
                return this.check(new e7({
                    check: "string_format",
                    format: "uppercase",
                    ...C(t)
                }))
            },
            trim() {
                return this.check(nD(t => t.trim()))
            },
            normalize() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(function(t) {
                    return nD(n => n.normalize(t))
                }(...n))
            },
            toLowerCase() {
                return this.check(nD(t => t.toLowerCase()))
            },
            toUpperCase() {
                return this.check(nD(t => t.toUpperCase()))
            },
            slugify() {
                return this.check(nD(t => t.toLowerCase().trim().replace(/[^\w\s-]/g, "").replace(/[\s_-]+/g, "-").replace(/^-+|-+$/g, "")))
            }
        })),
        rO = eu("ZodString", (t, n) => {
            ts.init(t, n), rk.init(t, n)
        }, {
            email(t) {
                return this.check(new rZ({
                    type: "string",
                    format: "email",
                    check: "string_format",
                    abort: !1,
                    ...C(t)
                }))
            },
            url(t) {
                return this.check(new r$({
                    type: "string",
                    format: "url",
                    check: "string_format",
                    abort: !1,
                    ...C(t)
                }))
            },
            jwt(t) {
                return this.check(new rX({
                    type: "string",
                    format: "jwt",
                    check: "string_format",
                    abort: !1,
                    ...C(t)
                }))
            },
            emoji(t) {
                return this.check(new rN({
                    type: "string",
                    format: "emoji",
                    check: "string_format",
                    abort: !1,
                    ...C(t)
                }))
            },
            guid(t) {
                return this.check(new rI({
                    type: "string",
                    format: "guid",
                    check: "string_format",
                    abort: !1,
                    ...C(t)
                }))
            },
            uuid(t) {
                return this.check(new rT({
                    type: "string",
                    format: "uuid",
                    check: "string_format",
                    abort: !1,
                    ...C(t)
                }))
            },
            uuidv4(t) {
                return this.check(new rT({
                    type: "string",
                    format: "uuid",
                    check: "string_format",
                    abort: !1,
                    version: "v4",
                    ...C(t)
                }))
            },
            uuidv6(t) {
                return this.check(new rT({
                    type: "string",
                    format: "uuid",
                    check: "string_format",
                    abort: !1,
                    version: "v6",
                    ...C(t)
                }))
            },
            uuidv7(t) {
                return this.check(new rT({
                    type: "string",
                    format: "uuid",
                    check: "string_format",
                    abort: !1,
                    version: "v7",
                    ...C(t)
                }))
            },
            nanoid(t) {
                return this.check(new rC({
                    type: "string",
                    format: "nanoid",
                    check: "string_format",
                    abort: !1,
                    ...C(t)
                }))
            },
            cuid(t) {
                return this.check(new rD({
                    type: "string",
                    format: "cuid",
                    check: "string_format",
                    abort: !1,
                    ...C(t)
                }))
            },
            cuid2(t) {
                return this.check(new rB({
                    type: "string",
                    format: "cuid2",
                    check: "string_format",
                    abort: !1,
                    ...C(t)
                }))
            },
            ulid(t) {
                return this.check(new rR({
                    type: "string",
                    format: "ulid",
                    check: "string_format",
                    abort: !1,
                    ...C(t)
                }))
            },
            base64(t) {
                return this.check(new rW({
                    type: "string",
                    format: "base64",
                    check: "string_format",
                    abort: !1,
                    ...C(t)
                }))
            },
            base64url(t) {
                return this.check(new rq({
                    type: "string",
                    format: "base64url",
                    check: "string_format",
                    abort: !1,
                    ...C(t)
                }))
            },
            xid(t) {
                return this.check(new rU({
                    type: "string",
                    format: "xid",
                    check: "string_format",
                    abort: !1,
                    ...C(t)
                }))
            },
            ksuid(t) {
                return this.check(new rJ({
                    type: "string",
                    format: "ksuid",
                    check: "string_format",
                    abort: !1,
                    ...C(t)
                }))
            },
            ipv4(t) {
                return this.check(new rM({
                    type: "string",
                    format: "ipv4",
                    check: "string_format",
                    abort: !1,
                    ...C(t)
                }))
            },
            ipv6(t) {
                return this.check(new rL({
                    type: "string",
                    format: "ipv6",
                    check: "string_format",
                    abort: !1,
                    ...C(t)
                }))
            },
            cidrv4(t) {
                return this.check(new rK({
                    type: "string",
                    format: "cidrv4",
                    check: "string_format",
                    abort: !1,
                    ...C(t)
                }))
            },
            cidrv6(t) {
                return this.check(new rV({
                    type: "string",
                    format: "cidrv6",
                    check: "string_format",
                    abort: !1,
                    ...C(t)
                }))
            },
            e164(t) {
                return this.check(new rG({
                    type: "string",
                    format: "e164",
                    check: "string_format",
                    abort: !1,
                    ...C(t)
                }))
            },
            datetime(t) {
                return this.check(new rS({
                    type: "string",
                    format: "datetime",
                    check: "string_format",
                    offset: !1,
                    local: !1,
                    precision: null,
                    ...C(t)
                }))
            },
            date(t) {
                return this.check(nx(rx, t))
            },
            time(t) {
                return this.check(new rj({
                    type: "string",
                    format: "time",
                    check: "string_format",
                    precision: null,
                    ...C(t)
                }))
            },
            duration(t) {
                return this.check(new rP({
                    type: "string",
                    format: "duration",
                    check: "string_format",
                    ...C(t)
                }))
            }
        });

    function rA(t) {
        return new rO(nS({
            type: "string",
            ...C(t)
        }))
    }
    let rE = eu("ZodStringFormat", (t, n) => {
            tc.init(t, n), rk.init(t, n)
        }),
        rS = eu("ZodISODateTime", (t, n) => {
            tO.init(t, n), rE.init(t, n)
        }),
        rx = eu("ZodISODate", (t, n) => {
            tA.init(t, n), rE.init(t, n)
        }),
        rj = eu("ZodISOTime", (t, n) => {
            tE.init(t, n), rE.init(t, n)
        }),
        rP = eu("ZodISODuration", (t, n) => {
            tS.init(t, n), rE.init(t, n)
        }),
        rZ = eu("ZodEmail", (t, n) => {
            tp.init(t, n), rE.init(t, n)
        }),
        rI = eu("ZodGUID", (t, n) => {
            td.init(t, n), rE.init(t, n)
        }),
        rT = eu("ZodUUID", (t, n) => {
            tf.init(t, n), rE.init(t, n)
        }),
        r$ = eu("ZodURL", (t, n) => {
            tg.init(t, n), rE.init(t, n)
        }),
        rN = eu("ZodEmoji", (t, n) => {
            ty.init(t, n), rE.init(t, n)
        }),
        rC = eu("ZodNanoID", (t, n) => {
            t_.init(t, n), rE.init(t, n)
        }),
        rD = eu("ZodCUID", (t, n) => {
            tb.init(t, n), rE.init(t, n)
        }),
        rB = eu("ZodCUID2", (t, n) => {
            tF.init(t, n), rE.init(t, n)
        }),
        rR = eu("ZodULID", (t, n) => {
            tw.init(t, n), rE.init(t, n)
        }),
        rU = eu("ZodXID", (t, n) => {
            tz.init(t, n), rE.init(t, n)
        }),
        rJ = eu("ZodKSUID", (t, n) => {
            tk.init(t, n), rE.init(t, n)
        }),
        rM = eu("ZodIPv4", (t, n) => {
            tx.init(t, n), rE.init(t, n)
        }),
        rL = eu("ZodIPv6", (t, n) => {
            tZ.init(t, n), rE.init(t, n)
        }),
        rK = eu("ZodCIDRv4", (t, n) => {
            tI.init(t, n), rE.init(t, n)
        }),
        rV = eu("ZodCIDRv6", (t, n) => {
            tT.init(t, n), rE.init(t, n)
        }),
        rW = eu("ZodBase64", (t, n) => {
            tC.init(t, n), rE.init(t, n)
        }),
        rq = eu("ZodBase64URL", (t, n) => {
            tB.init(t, n), rE.init(t, n)
        }),
        rG = eu("ZodE164", (t, n) => {
            tR.init(t, n), rE.init(t, n)
        }),
        rX = eu("ZodJWT", (t, n) => {
            tU.init(t, n), rE.init(t, n)
        }),
        rH = eu("ZodNumber", (t, n) => {
            tJ.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (n, r, i) => ((t, n, r, i) => {
                let {
                    minimum: o,
                    maximum: u,
                    multipleOf: a,
                    exclusiveMaximum: l,
                    exclusiveMinimum: s,
                    isInt: c
                } = n7(t);
                r.type = c ? "integer" : "number";
                let d = "number" == typeof s && s >= (null != o ? o : -1 / 0),
                    f = "number" == typeof l && l <= (null != u ? u : 1 / 0),
                    p = "draft-04" === n.target || "openapi-3.0" === n.target;
                if (d ? p ? (r.minimum = s, r.exclusiveMinimum = !0) : r.exclusiveMinimum = s : "number" == typeof o && (r.minimum = o), f ? p ? (r.maximum = l, r.exclusiveMaximum = !0) : r.exclusiveMaximum = l : "number" == typeof u && (r.maximum = u), a) {
                    var h;
                    let o = new Set;
                    for (let u of a) Number.isFinite(u) && 0 !== u ? o.add(Math.abs(u)) : nU(t, n, r, i, "A multipleOf divisor of ".concat(u, " cannot be represented in JSON Schema"));
                    let [u, ...l] = o;
                    void 0 !== u && (r.multipleOf = u), l.length && (r.allOf = [...null != (h = r.allOf) ? h : [], ...l.map(t => ({
                        multipleOf: t
                    }))])
                }
            })(t, n, r, i), t.isFinite = !0
        }, ee({
            minValue: t => {
                let {
                    minimum: n,
                    exclusiveMinimum: r
                } = n7(t);
                return Math.max(null != n ? n : -1 / 0, null != r ? r : -1 / 0)
            },
            maxValue: t => {
                let {
                    maximum: n,
                    exclusiveMaximum: r
                } = n7(t);
                return Math.min(null != n ? n : 1 / 0, null != r ? r : 1 / 0)
            },
            isInt: t => {
                let {
                    isInt: n,
                    multipleOf: r
                } = n7(t);
                return !!n || !!(null == r ? void 0 : r.some(Number.isSafeInteger))
            },
            format: t => {
                var n;
                return null != (n = n7(t).format) ? n : null
            }
        }, {
            gt(t, n) {
                return this.check(nZ(t, n))
            },
            gte(t, n) {
                return this.check(nI(t, n))
            },
            min(t, n) {
                return this.check(nI(t, n))
            },
            lt(t, n) {
                return this.check(nj(t, n))
            },
            lte(t, n) {
                return this.check(nP(t, n))
            },
            max(t, n) {
                return this.check(nP(t, n))
            },
            int(t) {
                return this.check(r0(t))
            },
            safe(t) {
                return this.check(r0(t))
            },
            positive(t) {
                return this.check(nZ(0, t))
            },
            nonnegative(t) {
                return this.check(nI(0, t))
            },
            negative(t) {
                return this.check(nj(0, t))
            },
            nonpositive(t) {
                return this.check(nP(0, t))
            },
            multipleOf(t, n) {
                return this.check(nT(t, n))
            },
            step(t, n) {
                return this.check(nT(t, n))
            },
            finite() {
                return this
            }
        }));

    function rY(t) {
        return new rH(nS({
            type: "number",
            checks: [],
            ...C(t)
        }))
    }
    let rQ = eu("ZodNumberFormat", (t, n) => {
        tM.init(t, n), rH.init(t, n)
    });

    function r0(t) {
        return new rQ({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "safeint",
            ...C(t)
        })
    }
    let r1 = eu("ZodBoolean", (t, n) => {
        tL.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (t, n, r) => {
            n.type = "boolean"
        }
    });

    function r2(t) {
        return new r1({
            type: "boolean",
            ...C(t)
        })
    }
    let r6 = eu("ZodUnknown", (t, n) => {
        tK.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (t, n, r) => void 0
    });

    function r9() {
        return new r6({
            type: "unknown"
        })
    }
    let r4 = eu("ZodNever", (t, n) => {
        tV.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (t, n, r) => {
            n.not = {}
        }
    });

    function r5(t) {
        return new r4({
            type: "never",
            ...C(t)
        })
    }
    let r3 = eu("ZodArray", (t, n) => {
        rF(), tq.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (n, r, i) => ((t, n, r, i) => {
            let o = t._zod.def,
                {
                    minimum: u,
                    maximum: a
                } = n7(t);
            "number" == typeof u && (r.minItems = u), "number" == typeof a && (r.maxItems = a), r.type = "array", r.items = nJ(o.element, n, {
                ...i,
                path: [...i.path, "items"]
            })
        })(t, n, r, i), t.element = n.element
    }, {
        min(t, n) {
            return this.check(nN(t, n))
        },
        nonempty(t) {
            return this.check(nN(1, t))
        },
        max(t, n) {
            return this.check(n$(t, n))
        },
        length(t, n) {
            return this.check(nC(t, n))
        },
        unwrap() {
            return this.element
        }
    });

    function r7(t, n) {
        return new r3({
            type: "array",
            element: t,
            ...C(n)
        })
    }
    let r8 = eu("ZodObject", (t, n) => {
        var r;
        let i, o;
        rF(), t0.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (n, r, i) => ((t, n, r, i) => {
            var o;
            let u = t._zod.def,
                a = u.shape;
            if (Object.getOwnPropertySymbols(a).length && nU(t, n, r, i, "Symbol keys cannot be represented in JSON Schema")) return;
            for (let t in r.type = "object", r.properties = {}, a) w(r.properties, t, nJ(a[t], n, {
                ...i,
                path: [...i.path, "properties", t]
            }));
            let l = [];
            for (let t of Object.keys(a)) {
                let r = u.shape[t];
                ("input" === n.io ? void 0 === rn(r) : void 0 === r._zod.optout) && l.push(t)
            }
            l.length > 0 && (r.required = l), (null == (o = u.catchall) ? void 0 : o._zod.def.type) === "never" ? r.additionalProperties = !1 : u.catchall ? u.catchall && (r.additionalProperties = nJ(u.catchall, n, {
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
            return new ic({
                type: "enum",
                entries: Array.isArray(t = Object.keys(this._zod.def.shape)) ? Object.fromEntries(t.map(t => [t, t])) : t,
                ...C(void 0)
            })
        },
        catchall(t) {
            return this.clone(S(this._zod.def, {
                catchall: t
            }))
        },
        passthrough() {
            return this.clone(S(this._zod.def, {
                catchall: r9()
            }))
        },
        loose() {
            return this.clone(S(this._zod.def, {
                catchall: r9()
            }))
        },
        strict() {
            return this.clone(S(this._zod.def, {
                catchall: r5()
            }))
        },
        strip() {
            return this.clone(S(this._zod.def, {
                catchall: void 0
            }))
        },
        extend(t) {
            if (!Z(t)) throw Error("Invalid input to extend: expected a plain object");
            let n = this._zod.def.checks;
            if (n && n.length > 0) {
                let n = k(this);
                for (let r of Reflect.ownKeys(t))
                    if (void 0 !== Object.getOwnPropertyDescriptor(n, r)) throw Error("Cannot overwrite keys on object schemas containing refinements. Use `.safeExtend()` instead.")
            }
            return N(this, S(this._zod.def, {
                shape: J(this, t)
            }))
        },
        safeExtend(t) {
            if (!Z(t)) throw Error("Invalid input to safeExtend: expected a plain object");
            return N(this, S(this._zod.def, {
                shape: J(this, t)
            }))
        },
        merge(t) {
            var n, r, i;
            if (!(null == t || null == (r = t._zod) ? void 0 : r.def)) throw Error("Invalid input to merge: expected an object schema. To merge a plain shape, use `.extend()`.");
            if (null == (i = this._zod.def.checks) ? void 0 : i.length) throw Error(".merge() cannot be used on object schemas containing refinements. Use .safeExtend() instead.");
            let o = {};
            return E(o, this, Reflect.ownKeys(k(this))), E(o, t, Reflect.ownKeys(k(t))), N(this, S(this._zod.def, {
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
                return E(o, t, U(t, n)), N(t, S(r, {
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
                let o = new Set(U(t, n)),
                    u = {};
                return E(u, t, Reflect.ownKeys(k(t)).filter(t => !o.has(t))), N(t, S(r, {
                    shape: u,
                    checks: []
                }))
            }(this, t)
        },
        partial() {
            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
            return M(im, this, n[0])
        },
        exactPartial() {
            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
            return M(ig, this, n[0], "exactPartial")
        },
        required() {
            let t, n;
            for (var r, i = arguments.length, o = Array(i), u = 0; u < i; u++) o[u] = arguments[u];
            return t = (r = o[0]) ? new Set(U(this, r)) : void 0, E(n = {}, this, Reflect.ownKeys(k(this)), (n, r) => t && !t.has(r) ? n : new iw({
                type: "nonoptional",
                innerType: n
            })), N(this, S(this._zod.def, {
                shape: n
            }))
        }
    });

    function ie(t, n) {
        return new r8({
            type: "object",
            shape: null != t ? t : {},
            ...C(n)
        })
    }

    function it(t, n) {
        return new r8({
            type: "object",
            shape: t,
            catchall: r5(),
            ...C(n)
        })
    }
    let ir = eu("ZodUnion", (t, n) => {
        t2.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (n, r, i) => rr(t, n, r, i), t.options = n.options
    });

    function ii(t, n) {
        return new ir({
            type: "union",
            options: t,
            ...C(n)
        })
    }
    let io = eu("ZodXor", (t, n) => {
            ir.init(t, n), t9.init(t, n), t._zod.processJSONSchema = (n, r, i) => rr(t, n, r, i), t.options = n.options
        }),
        iu = eu("ZodDiscriminatedUnion", (t, n) => {
            ir.init(t, n), t4.init(t, n)
        }),
        ia = eu("ZodIntersection", (t, n) => {
            t5.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (n, r, i) => {
                let o, u, a, l, s;
                return u = nJ((o = t._zod.def).left, n, {
                    ...i,
                    path: [...i.path, "allOf", 0]
                }), a = nJ(o.right, n, {
                    ...i,
                    path: [...i.path, "allOf", 1]
                }), void(r.allOf = s = [...(l = t => "allOf" in t && 1 === Object.keys(t).length)(u) ? u.allOf : [u], ...l(a) ? a.allOf : [a]], n.intersections.push(s))
            }
        }),
        il = eu("ZodRecord", (t, n) => {
            rF(), t7.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (n, r, i) => ((t, n, r, i) => {
                let o = t._zod.def;
                r.type = "object";
                let u = o.keyType,
                    a = n7(u).patterns;
                if ("loose" === o.mode && a && a.size > 0) {
                    let t = nJ(o.valueType, n, {
                        ...i,
                        path: [...i.path, "patternProperties", "*"]
                    });
                    for (let n of (r.patternProperties = {}, a)) w(r.patternProperties, rt(n).source, t)
                } else {
                    if ("draft-07" === n.target || "draft-2020-12" === n.target) {
                        r.propertyNames = nJ(o.keyType, n, {
                            ...i,
                            path: [...i.path, "propertyNames"]
                        });
                        let u = ri.get(n);
                        u || (u = [], ri.set(n, u), n.deferred.push(() => (function(t) {
                            var n, r, i;
                            let o = new Map;
                            for (let n of t.seen.values()) n.def && !o.has(n.schema) && o.set(n.schema, n);
                            let u = new Map;
                            for (let a of null != (n = ri.get(t)) ? n : []) {
                                let n = t.seen.get(a),
                                    l = null == (i = null != (r = null == n ? void 0 : n.def) ? r : null == n ? void 0 : n.schema) ? void 0 : i.propertyNames;
                                if (!l || !0 === l || u.has(l)) continue;
                                let s = function t(n, r, i) {
                                    var o, u;
                                    if (r.$ref) {
                                        if (i.has(r)) return r;
                                        i.add(r);
                                        let o = null == (u = n.get(r)) ? void 0 : u.def;
                                        if (!o) return r;
                                        let a = t(n, o, i);
                                        return a === o ? r : a
                                    }
                                    for (let o of ["anyOf", "oneOf"]) {
                                        let u = r[o];
                                        if (!Array.isArray(u)) continue;
                                        let a = u.map(r => t(n, r, i));
                                        a.some((t, n) => t !== u[n]) && (r = {
                                            ...r,
                                            [o]: a
                                        })
                                    }
                                    let a = Array.isArray(r.type) ? r.type : [r.type],
                                        l = !a.includes("string") && a.some(t => "number" === t || "integer" === t),
                                        s = null != (o = r.enum) ? o : void 0 !== r.const ? [r.const] : void 0;
                                    if (!l && !(null == s ? void 0 : s.some(t => "number" == typeof t))) return r;
                                    let {
                                        minimum: c,
                                        maximum: d,
                                        exclusiveMinimum: f,
                                        exclusiveMaximum: p,
                                        multipleOf: h,
                                        format: m,
                                        id: v,
                                        ...g
                                    } = r;
                                    return g.enum ? g.enum = g.enum.map(t => "number" == typeof t ? String(t) : t) : "number" == typeof g.const && (g.const = String(g.const)), l && (g.type = "string", s || (g.pattern = (a.includes("number") ? eK : eL).source)), g
                                }(o, l, new Set);
                                s !== l && u.set(l, s)
                            }
                            if (u.size)
                                for (let n of t.seen.values())
                                    for (let t of [n.schema, n.def]) {
                                        let n = t && u.get(t.propertyNames);
                                        n && (t.propertyNames = n)
                                    }
                        })(n))), u.push(t)
                    }
                    r.additionalProperties = nJ(o.valueType, n, {
                        ...i,
                        path: [...i.path, "additionalProperties"]
                    })
                }
                let l = u._zod.values,
                    s = "input" === n.io && void 0 !== rn(o.valueType);
                if (l && !o.partial && !s) {
                    let t = [...l].filter(t => "string" == typeof t || "number" == typeof t);
                    t.length > 0 && (r.required = t.map(String))
                }
            })(t, n, r, i), t.keyType = n.keyType, t.valueType = n.valueType
        });

    function is(t, n, r) {
        return new il(n && n._zod ? {
            type: "record",
            keyType: t,
            valueType: n,
            ...C(r)
        } : {
            type: "record",
            keyType: rA(),
            valueType: t,
            ...C(n)
        })
    }
    let ic = eu("ZodEnum", (t, n) => {
            t8.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (n, r, i) => ((t, n) => {
                let r = v(t._zod.def.entries);
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
                return new ic({
                    ...n,
                    checks: [],
                    ...C(i),
                    entries: o
                })
            }, t.exclude = (t, i) => {
                let o = {
                    ...n.entries
                };
                for (let n of t)
                    if (r.has(n)) delete o[n];
                    else throw Error("Key ".concat(n, " not found in enum"));
                return new ic({
                    ...n,
                    checks: [],
                    ...C(i),
                    entries: o
                })
            }
        }),
        id = eu("ZodLiteral", (t, n) => {
            ne.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (n, r, i) => ((t, n, r, i) => {
                let o = t._zod.def;
                if (0 === o.values.length) {
                    r.not = {};
                    return
                }
                let u = [];
                for (let a of o.values)
                    if (void 0 === a) {
                        if (nU(t, n, r, i, "Literal `undefined` cannot be represented in JSON Schema")) return
                    } else if ("bigint" == typeof a) {
                    if (nU(t, n, r, i, "BigInt literals cannot be represented in JSON Schema")) return;
                    u.push(Number(a))
                } else u.push(a);
                if (0 === u.length);
                else if (1 === u.length) {
                    let t = u[0];
                    r.type = null === t ? "null" : typeof t, "draft-04" === n.target || "openapi-3.0" === n.target ? r.enum = [t] : r.const = t
                } else u.every(t => "number" == typeof t) && (r.type = "number"), u.every(t => "string" == typeof t) && (r.type = "string"), u.every(t => "boolean" == typeof t) && (r.type = "boolean"), u.every(t => null === t) && (r.type = "null"), r.enum = u
            })(t, n, r, i), t.values = new Set(n.values), Object.defineProperty(t, "value", {
                get() {
                    if (n.values.length > 1) throw Error("This schema contains multiple valid literal values. Use `.values` instead.");
                    return n.values[0]
                }
            })
        });

    function ip(t, n) {
        return new id({
            type: "literal",
            values: Array.isArray(t) ? t : [t],
            ...C(n)
        })
    }
    let ih = eu("ZodTransform", (t, n) => {
            rF(), nt.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (n, r, i) => {
                nU(t, n, r, i, "Transforms cannot be represented in JSON Schema")
            }, t._zod.parse = (r, i) => {
                if ("backward" === i.direction) throw new el(t.constructor.name);
                r.addIssue = i => {
                    "string" == typeof i ? r.issues.push(Y(i, r.value, n)) : (i.fatal && (i.continue = !1), null != i.code || (i.code = "custom"), "input" in i || (i.input = r.value), null != i.inst || (i.inst = t), r.issues.push(Y(i)))
                };
                let o = n.transform(r.value, r);
                return o instanceof Promise ? o.then(t => (r.value = t, r)) : (r.value = o, r)
            }
        }),
        im = eu("ZodOptional", (t, n) => {
            nr.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (n, r, i) => ra(t, n, r, i), t.unwrap = () => t._zod.def.innerType
        });

    function iv(t) {
        return new im({
            type: "optional",
            innerType: t
        })
    }
    let ig = eu("ZodExactOptional", (t, n) => {
            ni.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (n, r, i) => ra(t, n, r, i), t.unwrap = () => t._zod.def.innerType
        }),
        iy = eu("ZodNullable", (t, n) => {
            no.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (n, r, i) => {
                let o, u, a;
                return u = nJ((o = t._zod.def).innerType, n, i), a = n.seen.get(t), void("openapi-3.0" === n.target ? (a.ref = o.innerType, r.nullable = !0) : r.anyOf = [u, {
                    type: "null"
                }])
            }, t.unwrap = () => t._zod.def.innerType
        });

    function i_(t) {
        return new iy({
            type: "nullable",
            innerType: t
        })
    }
    let ib = eu("ZodDefault", (t, n) => {
            nu.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (n, r, i) => {
                let o, u;
                return nJ((o = t._zod.def).innerType, n, i), n.seen.get(t).ref = o.innerType, void((u = ru(o.defaultValue, t, n, r, i)) !== ro && (r.default = u))
            }, t.unwrap = () => t._zod.def.innerType, t.removeDefault = t.unwrap
        }),
        iF = eu("ZodPrefault", (t, n) => {
            nl.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (n, r, i) => ((t, n, r, i) => {
                let o = t._zod.def;
                if (nJ(o.innerType, n, i), n.seen.get(t).ref = o.innerType, "input" !== n.io) return;
                let u = ru(o.defaultValue, t, n, r, i);
                u !== ro && (r._prefault = u)
            })(t, n, r, i), t.unwrap = () => t._zod.def.innerType
        }),
        iw = eu("ZodNonOptional", (t, n) => {
            ns.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (n, r, i) => {
                let o;
                nJ((o = t._zod.def).innerType, n, i), n.seen.get(t).ref = o.innerType
            }, t.unwrap = () => t._zod.def.innerType
        }),
        iz = eu("ZodCatch", (t, n) => {
            nf.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (n, r, i) => ((t, n, r, i) => {
                let o, u = t._zod.def;
                nJ(u.innerType, n, i), n.seen.get(t).ref = u.innerType;
                try {
                    o = u.catchValue(void 0)
                } catch (o) {
                    nU(t, n, r, i, "Dynamic catch values are not supported in JSON Schema");
                    return
                }
                r.default = o
            })(t, n, r, i), t.unwrap = () => t._zod.def.innerType, t.removeCatch = t.unwrap
        }),
        ik = eu("ZodPipe", (t, n) => {
            np.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (n, r, i) => {
                let o, u, a;
                return u = (o = t._zod.def).in._zod.traits.has("$ZodTransform"), void(nJ(a = "input" === n.io ? u ? o.out : o.in : o.out, n, i), n.seen.get(t).ref = a)
            }, t.in = n.in, t.out = n.out
        });

    function iO(t, n) {
        return new ik({
            type: "pipe",
            in: t,
            out: n
        })
    }
    let iA = eu("ZodReadonly", (t, n) => {
            nm.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (n, r, i) => {
                let o;
                nJ((o = t._zod.def).innerType, n, i), n.seen.get(t).ref = o.innerType, r.readOnly = !0
            }, t.unwrap = () => t._zod.def.innerType
        }),
        iE = eu("ZodCustom", (t, n) => {
            ng.init(t, n), rw.init(t, n), t._zod.processJSONSchema = (n, r, i) => {
                nU(t, n, r, i, "Custom types cannot be represented in JSON Schema")
            }
        });

    function iS(t) {
        return ie({
            dev: t.optional(),
            staging: t.optional(),
            prod: t.optional()
        })
    }
    let ix = {
            userId: iS(r7(rY())).optional(),
            roleSet: iS(r7(rA())).optional()
        },
        ij = iS(r7(rY())),
        iP = ie({
            description: rA(),
            creationDate: nx(rx, void 0)
        }),
        iZ = new io({
            type: "union",
            options: [it({
                ...ix,
                universeId: ij
            }), it({
                ...ix,
                groupId: ij
            }), it({
                ...ix
            })],
            inclusive: !1,
            ...C(void 0)
        }),
        iI = ie({
            name: rA(),
            metadata: iP,
            filters: iZ.optional()
        }),
        iT = new iu({
            type: "union",
            options: [iI.extend({
                type: ip("boolean"),
                defaultValue: r2(),
                value: iS(r2()).optional()
            }), iI.extend({
                type: ip("number"),
                defaultValue: rY(),
                value: iS(rY()).optional()
            }), iI.extend({
                type: ip("string"),
                defaultValue: rA(),
                value: iS(rA()).optional()
            })],
            discriminator: "type",
            ...C(void 0)
        }),
        i$ = ii([r2(), rY(), rA()]),
        iN = ie({
            applicationId: rA(),
            namespace: rA()
        });
    ie({
        $schema: rA().optional(),
        name: rA(),
        owner: rA(),
        slack: rA(),
        slackNotificationChannel: rA().optional(),
        flags: r7(iT)
    });
    let iC = iN.extend({
            flags: is(rA(), i$)
        }),
        iD = ii([ie({
            universeId: is(rA(), i$)
        }), ie({
            groupId: is(rA(), i$)
        })]).transform(t => {
            let [n] = "universeId" in t ? Object.values(t.universeId) : Object.values(t.groupId);
            return n
        }).pipe(i$),
        iB = iN.extend({
            flags: is(rA(), ii([i$, iD]))
        }),
        iR = ie({
            isOverrideAllowed: r2(),
            override: r7(ie({
                namespace: rA(),
                flags: is(rA(), i$)
            })).optional()
        }),
        iU = "flag-overrides",
        iJ = null,
        iM = !1;

    function iL(t) {
        if (null === t) throw Error("@rbx/flags: needs to be initialized first!")
    }
    async function iK() {
        i = void 0;
        try {
            let t = (iL(iJ), iJ),
                n = new URL("/barista-feature-flags/v1/override-status", t.baseUrl),
                r = new URLSearchParams(window.location.search).get(iU);
            r && n.searchParams.set(iU, r);
            let o = await fetch(n, {
                credentials: "include"
            });
            if (!o.ok) return !1;
            let u = await o.json().then(t => iR.parseAsync(t));
            return i = u.override, u.isOverrideAllowed
        } catch (t) {
            return !1
        }
    }
    async function iV(t) {
        return i = void 0, !!("authorize" in t && await t.authorize().catch(() => !1) || t.useDefault && await iK()) && (iM = !0, (0, m.r)(i), !0)
    }
    async function iW(t) {
        if (iL(iJ), "development" === t.mode) throw Error("@rbx/flags: development overrides are enabled in a production build — is this intentional? Use 'authorized-only' mode with an authorize function for production.");
        if ("authorized-only" === t.mode) try {
            return await iV(t)
        } catch (t) {}
        return !1
    }
    let iq = new Map,
        iG = new Map;
    async function iX(t, n, r) {
        var i;
        let o = (iL(iJ), iJ),
            [u, a] = void 0 !== r && null != (i = Object.entries(r).pop()) ? i : [],
            l = void 0 !== u && void 0 !== a ? "".concat(t, ":").concat(u, ":").concat(a.toString()) : t,
            s = iq.get(l);
        if (void 0 === s) {
            let n = iG.get(l);
            if (void 0 === n) {
                let r = new URL("/barista-feature-flags/v1/applications/".concat(o.applicationId, "/namespaces/").concat(t, "/flags"), o.baseUrl);
                void 0 !== u && void 0 !== a && r.searchParams.set(u, a.toString()), n = fetch(r, {
                    method: "GET",
                    headers: {
                        Accept: "application/json"
                    },
                    credentials: "include"
                }).then(async n => {
                    if (!n.ok) throw Error("@rbx/flags: failed to fetch namespace ".concat(t));
                    let r = void 0 !== u ? iB : iC,
                        i = await n.json().then(t => r.parseAsync(t));
                    if (i.applicationId !== o.applicationId || i.namespace !== t) throw Error("@rbx/flags: mismatched response for ".concat(t));
                    return iq.set(l, i.flags), i.flags
                }).finally(() => {
                    iG.delete(l)
                }), iG.set(l, n)
            }
            s = await n
        }
        if (!(n in s)) throw Error("@rbx/flags: flag ".concat(t, "/").concat(n, " does not exist"));
        return s[n]
    }
    t.s(["defineFlag", 0, function(t) {
        let {
            namespace: n,
            name: r,
            defaultValue: i
        } = t, o, u, a = null;
        return t => {
            var l;
            let s = iM ? (0, m.g)(n, r) : void 0,
                c = t ? Object.values(t).pop() : void 0;
            return null !== a && s === o && c === u ? a : (o = s, u = c, a = null != (l = typeof s == typeof i ? Promise.resolve(s) : void 0 === c || c > 0 ? null : Promise.resolve(i)) ? l : iX(n, r, t).catch(() => i))
        }
    }, "initFlags", 0, function(t) {
        let {
            baseUrl: n,
            applicationId: r
        } = t;
        if (null !== iJ) throw Error("@rbx/flags: config has already been initialized!");
        if (! function(t) {
                try {
                    return new URL(t), !0
                } catch (t) {
                    return !1
                }
            }(n)) throw Error("@rbx/flags: base URL is invalid!");
        return iJ = {
            baseUrl: n,
            applicationId: r
        }, {
            enableOverrides: iW
        }
    }])
}, 459078, t => {
    "use strict";
    var n = t.i(416340);
    let r = "flags-override",
        i = "flags";

    function o(t, n) {
        return [i, t, n].join(":")
    }
    let u = 0;

    function a() {
        return u
    }

    function l() {
        u += 1, window.dispatchEvent(new CustomEvent(r))
    }

    function s(t) {
        var n;
        (null == (n = t.key) ? void 0 : n.startsWith("".concat(i, ":"))) && l()
    }

    function c(t) {
        return window.addEventListener("storage", s), window.addEventListener(r, t), () => {
            window.removeEventListener("storage", s), window.removeEventListener(r, t)
        }
    }
    let d = () => 0;
    t.s(["g", 0, function(t, n) {
        let r = localStorage.getItem(o(t, n));
        if (null !== r) try {
            return JSON.parse(r)
        } catch (t) {
            return
        }
    }, "r", 0, function(t) {
        window.rbxFlags = {
            set(t, n, r) {
                let i = o(t, n),
                    u = JSON.stringify(r);
                localStorage.getItem(i) !== u && (localStorage.setItem(i, u), l())
            },
            clear() {
                let t = Array.from({
                    length: localStorage.length
                }, (t, n) => localStorage.key(n)).filter(t => null != t && t.startsWith("".concat(i, ":")));
                t.forEach(t => localStorage.removeItem(t)), t.length > 0 && l()
            },
            delete(t, n) {
                let r = o(t, n);
                null !== localStorage.getItem(r) && (localStorage.removeItem(r), l())
            }
        }, null == t || t.forEach(t => {
            let {
                namespace: n,
                flags: r
            } = t;
            Object.entries(r).forEach(t => {
                let [r, i] = t;
                localStorage.setItem(o(n, r), JSON.stringify(i))
            })
        }), l()
    }, "s", 0, c, "u", 0, function() {
        for (var t = arguments.length, r = Array(t), i = 0; i < t; i++) r[i] = arguments[i];
        let [o, u] = (0, n.useState)(!1), [l, s] = (0, n.useState)(null), f = (0, n.useSyncExternalStore)(c, a, d), [p, h = {}] = r;
        return ((0, n.useEffect)(() => {
            let t = new AbortController;
            return async function() {
                try {
                    let n;
                    if (2 === r.length) {
                        let [t, i] = r;
                        n = await t(i)
                    } else {
                        let [t] = r;
                        n = await t()
                    }
                    if (t.signal.aborted) return;
                    s(n), u(!0)
                } catch (t) {}
            }(), () => {
                t.abort()
            }
        }, [p, Object.values(h).pop(), f]), o) ? {
            ready: o,
            value: l
        } : {
            ready: !1,
            value: null
        }
    }])
}, 692734, t => {
    "use strict";
    var n = t.i(459078);
    t.s(["useFlag", () => n.u])
}]);

//# debugId=cffa6d9a-7909-c113-3830-b6fd3110e2aa
//# sourceMappingURL=1vsy5aet96knx.js.map