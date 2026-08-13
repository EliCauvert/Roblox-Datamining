;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "d259cb05-575c-eec3-361d-f36eddb217df")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 293551, e => {
    "use strict";
    var t = e.i(416340);
    let n = "flags-override",
        r = "flags";

    function i(e, t) {
        return [r, e, t].join(":")
    }
    let o = 0;

    function a() {
        return o
    }

    function u() {
        o += 1, window.dispatchEvent(new CustomEvent(n))
    }

    function s(e) {
        var t;
        (null == (t = e.key) ? void 0 : t.startsWith("".concat(r, ":"))) && u()
    }

    function l(e) {
        return window.addEventListener("storage", s), window.addEventListener(n, e), () => {
            window.removeEventListener("storage", s), window.removeEventListener(n, e)
        }
    }
    let c = () => 0;
    e.s(["g", 0, function(e, t) {
        let n = localStorage.getItem(i(e, t));
        if (null !== n) try {
            return JSON.parse(n)
        } catch (e) {
            return
        }
    }, "r", 0, function(e) {
        window.rbxFlags = {
            set(e, t, n) {
                let r = i(e, t),
                    o = JSON.stringify(n);
                localStorage.getItem(r) !== o && (localStorage.setItem(r, o), u())
            },
            clear() {
                let e = Array.from({
                    length: localStorage.length
                }, (e, t) => localStorage.key(t)).filter(e => null != e && e.startsWith("".concat(r, ":")));
                e.forEach(e => localStorage.removeItem(e)), e.length > 0 && u()
            },
            delete(e, t) {
                let n = i(e, t);
                null !== localStorage.getItem(n) && (localStorage.removeItem(n), u())
            }
        }, null == e || e.forEach(e => {
            let {
                namespace: t,
                flags: n
            } = e;
            Object.entries(n).forEach(e => {
                let [n, r] = e;
                localStorage.setItem(i(t, n), JSON.stringify(r))
            })
        }), u()
    }, "s", 0, l, "u", 0, function() {
        for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
        let [i, o] = (0, t.useState)(!1), [u, s] = (0, t.useState)(null), d = (0, t.useSyncExternalStore)(l, a, c), [p, f = {}] = n;
        return ((0, t.useEffect)(() => {
            let e = new AbortController;
            return async function() {
                try {
                    let t;
                    if (2 === n.length) {
                        let [e, r] = n;
                        t = await e(r)
                    } else {
                        let [e] = n;
                        t = await e()
                    }
                    e.signal.throwIfAborted(), s(t), o(!0)
                } catch (e) {}
            }(), () => {
                e.abort()
            }
        }, [p, Object.values(f).pop(), d]), i) ? {
            ready: i,
            value: u
        } : {
            ready: !1,
            value: null
        }
    }])
}, 614505, 157700, e => {
    "use strict";
    let t;
    var n, r, i = e.i(293551);

    function o(e, t, n) {
        var r;

        function i(n, r) {
            if (n._zod || Object.defineProperty(n, "_zod", {
                    value: {
                        def: r,
                        constr: u,
                        traits: new Set
                    },
                    enumerable: !1
                }), n._zod.traits.has(e)) return;
            n._zod.traits.add(e), t(n, r);
            let i = u.prototype,
                o = Object.keys(i);
            for (let e = 0; e < o.length; e++) {
                let t = o[e];
                t in n || (n[t] = i[t].bind(n))
            }
        }
        let o = null != (r = null == n ? void 0 : n.Parent) ? r : Object;
        class a extends o {}

        function u(e) {
            var t;
            let r = (null == n ? void 0 : n.Parent) ? new a : this;
            for (let n of (i(r, e), null != (t = r._zod).deferred || (t.deferred = []), r._zod.deferred)) n();
            return r
        }
        return Object.defineProperty(a, "name", {
            value: e
        }), Object.defineProperty(u, "init", {
            value: i
        }), Object.defineProperty(u, Symbol.hasInstance, {
            value: t => {
                var r, i;
                return !!(null == n ? void 0 : n.Parent) && t instanceof n.Parent || (null == t || null == (i = t._zod) || null == (r = i.traits) ? void 0 : r.has(e))
            }
        }), Object.defineProperty(u, "name", {
            value: e
        }), u
    }
    e.s(["useFlag", () => i.u], 614505), e.i(416340);
    class a extends Error {
        constructor() {
            super("Encountered Promise during synchronous parse. Use .parseAsync() instead.")
        }
    }
    class u extends Error {
        constructor(e) {
            super("Encountered unidirectional transform during encode: ".concat(e)), this.name = "ZodEncodeError"
        }
    }
    null != (n = globalThis).__zod_globalConfig || (n.__zod_globalConfig = {});
    let s = globalThis.__zod_globalConfig;

    function l(e) {
        let t = Object.values(e).filter(e => "number" == typeof e);
        return Object.entries(e).filter(e => {
            let [n, r] = e;
            return -1 === t.indexOf(+n)
        }).map(e => {
            let [t, n] = e;
            return n
        })
    }

    function c(e, t) {
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

    function p(e) {
        let t = +!!e.startsWith("^"),
            n = e.endsWith("$") ? e.length - 1 : e.length;
        return e.slice(t, n)
    }
    let f = Symbol("evaluating");

    function h(e, t, n) {
        let r;
        Object.defineProperty(e, t, {
            get() {
                if (r !== f) return void 0 === r && (r = f, r = n()), r
            },
            set(n) {
                Object.defineProperty(e, t, {
                    value: n
                })
            },
            configurable: !0
        })
    }

    function m(e, t, n) {
        Object.defineProperty(e, t, {
            value: n,
            writable: !0,
            enumerable: !0,
            configurable: !0
        })
    }

    function v() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        let r = {};
        for (let e of t) Object.assign(r, Object.getOwnPropertyDescriptors(e));
        return Object.defineProperties({}, r)
    }

    function g(e) {
        return JSON.stringify(e)
    }
    let y = "captureStackTrace" in Error ? Error.captureStackTrace : function() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n]
    };

    function _(e) {
        return "object" == typeof e && null !== e && !Array.isArray(e)
    }
    let z = d(() => {
        var e, t;
        if (s.jitless || "u" > typeof navigator && (null == (t = navigator) || null == (e = t.userAgent) ? void 0 : e.includes("Cloudflare"))) return !1;
        try {
            return Function(""), !0
        } catch (e) {
            return !1
        }
    });

    function b(e) {
        if (!1 === _(e)) return !1;
        let t = e.constructor;
        if (void 0 === t || "function" != typeof t) return !0;
        let n = t.prototype;
        return !1 !== _(n) && !1 !== Object.prototype.hasOwnProperty.call(n, "isPrototypeOf")
    }

    function w(e) {
        return b(e) ? {
            ...e
        } : Array.isArray(e) ? [...e] : e instanceof Map ? new Map(e) : e instanceof Set ? new Set(e) : e
    }
    let k = new Set(["string", "number", "symbol"]);

    function F(e) {
        return e.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
    }

    function S(e, t, n) {
        let r = new e._zod.constr(null != t ? t : e._zod.def);
        return (!t || (null == n ? void 0 : n.parent)) && (r._zod.parent = e), r
    }

    function O(e) {
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
    let E = {
        safeint: [Number.MIN_SAFE_INTEGER, Number.MAX_SAFE_INTEGER],
        int32: [-0x80000000, 0x7fffffff],
        uint32: [0, 0xffffffff],
        float32: [-34028234663852886e22, 34028234663852886e22],
        float64: [-Number.MAX_VALUE, Number.MAX_VALUE]
    };

    function A(e) {
        var t;
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
        if (!0 === e.aborted) return !0;
        for (let r = n; r < e.issues.length; r++)
            if ((null == (t = e.issues[r]) ? void 0 : t.continue) !== !0) return !0;
        return !1
    }

    function x(e, t) {
        return t.map(t => (null != t.path || (t.path = []), t.path.unshift(e), t))
    }

    function Z(e) {
        return "string" == typeof e ? e : null == e ? void 0 : e.message
    }

    function $(e, t, n) {
        var r, i, o, a, u, s, l, c, d, p;
        let f = e.message ? e.message : null != (r = null != (i = null != (o = null != (a = Z(null == (l = e.inst) || null == (s = l._zod.def) || null == (u = s.error) ? void 0 : u.call(s, e))) ? a : Z(null == t || null == (c = t.error) ? void 0 : c.call(t, e))) ? o : Z(null == (d = n.customError) ? void 0 : d.call(n, e))) ? i : Z(null == (p = n.localeError) ? void 0 : p.call(n, e))) ? r : "Invalid input",
            {
                inst: h,
                continue: m,
                input: v,
                ...g
            } = e;
        return null != g.path || (g.path = []), g.message = f, (null == t ? void 0 : t.reportInput) && (g.input = v), g
    }

    function T(e) {
        return Array.isArray(e) ? "array" : "string" == typeof e ? "string" : "unknown"
    }

    function P() {
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
    let j = (e, t) => {
            e.name = "$ZodError", Object.defineProperty(e, "_zod", {
                value: e._zod,
                enumerable: !1
            }), Object.defineProperty(e, "issues", {
                value: t,
                enumerable: !1
            }), e.message = JSON.stringify(t, c, 2), Object.defineProperty(e, "toString", {
                value: () => e.message,
                enumerable: !1
            })
        },
        I = o("$ZodError", j),
        N = o("$ZodError", j, {
            Parent: Error
        }),
        C = e => (t, n, r, i) => {
            let o = r ? {
                    ...r,
                    async: !1
                } : {
                    async: !1
                },
                u = t._zod.run({
                    value: n,
                    issues: []
                }, o);
            if (u instanceof Promise) throw new a;
            if (u.issues.length) {
                var l;
                let t = new(null != (l = null == i ? void 0 : i.Err) ? l : e)(u.issues.map(e => $(e, o, s)));
                throw y(t, null == i ? void 0 : i.callee), t
            }
            return u.value
        },
        D = e => async (t, n, r, i) => {
            let o = r ? {
                    ...r,
                    async: !0
                } : {
                    async: !0
                },
                a = t._zod.run({
                    value: n,
                    issues: []
                }, o);
            if (a instanceof Promise && (a = await a), a.issues.length) {
                var u;
                let t = new(null != (u = null == i ? void 0 : i.Err) ? u : e)(a.issues.map(e => $(e, o, s)));
                throw y(t, null == i ? void 0 : i.callee), t
            }
            return a.value
        }, J = e => (t, n, r) => {
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
            if (o instanceof Promise) throw new a;
            return o.issues.length ? {
                success: !1,
                error: new(null != e ? e : I)(o.issues.map(e => $(e, i, s)))
            } : {
                success: !0,
                data: o.value
            }
        }, R = J(N), U = e => async (t, n, r) => {
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
            return o instanceof Promise && (o = await o), o.issues.length ? {
                success: !1,
                error: new e(o.issues.map(e => $(e, i, s)))
            } : {
                success: !0,
                data: o.value
            }
        }, M = U(N), B = /^[cC][0-9a-z]{6,}$/, L = /^[0-9a-z]+$/, V = /^[0-9A-HJKMNP-TV-Za-hjkmnp-tv-z]{26}$/, W = /^[0-9a-vA-V]{20}$/, K = /^[A-Za-z0-9]{27}$/, G = /^[a-zA-Z0-9_-]{21}$/, X = /^P(?:(\d+W)|(?!.*W)(?=\d|T\d)(\d+Y)?(\d+M)?(\d+D)?(T(?=\d)(\d+H)?(\d+M)?(\d+([.,]\d+)?S)?)?)$/, q = /^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})$/, H = e => e ? RegExp("^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-".concat(e, "[0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12})$")) : /^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-8][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}|00000000-0000-0000-0000-000000000000|ffffffff-ffff-ffff-ffff-ffffffffffff)$/, Y = /^(?!\.)(?!.*\.\.)([A-Za-z0-9_'+\-\.]*)[A-Za-z0-9_+-]@([A-Za-z0-9][A-Za-z0-9\-]*\.)+[A-Za-z]{2,}$/, Q = /^(?:(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])$/, ee = /^(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))$/, et = /^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\/([0-9]|[1-2][0-9]|3[0-2])$/, en = /^(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|::|([0-9a-fA-F]{1,4})?::([0-9a-fA-F]{1,4}:?){0,6})\/(12[0-8]|1[01][0-9]|[1-9]?[0-9])$/, er = /^$|^(?:[0-9a-zA-Z+/]{4})*(?:(?:[0-9a-zA-Z+/]{2}==)|(?:[0-9a-zA-Z+/]{3}=))?$/, ei = /^[A-Za-z0-9_-]*$/, eo = /^https?$/, ea = /^\+[1-9]\d{6,14}$/, eu = "(?:(?:\\d\\d[2468][048]|\\d\\d[13579][26]|\\d\\d0[48]|[02468][048]00|[13579][26]00)-02-29|\\d{4}-(?:(?:0[13578]|1[02])-(?:0[1-9]|[12]\\d|3[01])|(?:0[469]|11)-(?:0[1-9]|[12]\\d|30)|(?:02)-(?:0[1-9]|1\\d|2[0-8])))", es = RegExp("^".concat(eu, "$"));

    function el(e) {
        let t = "(?:[01]\\d|2[0-3]):[0-5]\\d";
        return "number" == typeof e.precision ? -1 === e.precision ? "".concat(t) : 0 === e.precision ? "".concat(t, ":[0-5]\\d") : "".concat(t, ":[0-5]\\d\\.\\d{").concat(e.precision, "}") : "".concat(t, "(?::[0-5]\\d(?:\\.\\d+)?)?")
    }
    let ec = /^-?\d+$/,
        ed = /^-?\d+(?:\.\d+)?$/,
        ep = /^(?:true|false)$/i,
        ef = /^[^A-Z]*$/,
        eh = /^[^a-z]*$/,
        em = o("$ZodCheck", (e, t) => {
            var n;
            null != e._zod || (e._zod = {}), e._zod.def = t, null != (n = e._zod).onattach || (n.onattach = [])
        }),
        ev = {
            number: "number",
            bigint: "bigint",
            object: "date"
        },
        eg = o("$ZodCheckLessThan", (e, t) => {
            em.init(e, t);
            let n = ev[typeof t.value];
            e._zod.onattach.push(e => {
                var n;
                let r = e._zod.bag,
                    i = null != (n = t.inclusive ? r.maximum : r.exclusiveMaximum) ? n : 1 / 0;
                t.value < i && (t.inclusive ? r.maximum = t.value : r.exclusiveMaximum = t.value)
            }), e._zod.check = r => {
                (t.inclusive ? r.value <= t.value : r.value < t.value) || r.issues.push({
                    origin: n,
                    code: "too_big",
                    maximum: "object" == typeof t.value ? t.value.getTime() : t.value,
                    input: r.value,
                    inclusive: t.inclusive,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        ey = o("$ZodCheckGreaterThan", (e, t) => {
            em.init(e, t);
            let n = ev[typeof t.value];
            e._zod.onattach.push(e => {
                var n;
                let r = e._zod.bag,
                    i = null != (n = t.inclusive ? r.minimum : r.exclusiveMinimum) ? n : -1 / 0;
                t.value > i && (t.inclusive ? r.minimum = t.value : r.exclusiveMinimum = t.value)
            }), e._zod.check = r => {
                (t.inclusive ? r.value >= t.value : r.value > t.value) || r.issues.push({
                    origin: n,
                    code: "too_small",
                    minimum: "object" == typeof t.value ? t.value.getTime() : t.value,
                    input: r.value,
                    inclusive: t.inclusive,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        e_ = o("$ZodCheckMultipleOf", (e, t) => {
            em.init(e, t), e._zod.onattach.push(e => {
                var n;
                null != (n = e._zod.bag).multipleOf || (n.multipleOf = t.value)
            }), e._zod.check = n => {
                let r, i, o;
                if (typeof n.value != typeof t.value) throw Error("Cannot mix number and bigint in multiple_of check.");
                ("bigint" == typeof n.value ? n.value % t.value === BigInt(0) : 0 == (i = Math.round(r = n.value / t.value), o = Number.EPSILON * Math.max(Math.abs(r), 1), Math.abs(r - i) < o ? 0 : r - i)) || n.issues.push({
                    origin: typeof n.value,
                    code: "not_multiple_of",
                    divisor: t.value,
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        ez = o("$ZodCheckNumberFormat", (e, t) => {
            var n;
            em.init(e, t), t.format = t.format || "float64";
            let r = null == (n = t.format) ? void 0 : n.includes("int"),
                i = r ? "int" : "number",
                [o, a] = E[t.format];
            e._zod.onattach.push(e => {
                let n = e._zod.bag;
                n.format = t.format, n.minimum = o, n.maximum = a, r && (n.pattern = ec)
            }), e._zod.check = n => {
                let u = n.value;
                if (r) {
                    if (!Number.isInteger(u)) return void n.issues.push({
                        expected: i,
                        format: t.format,
                        code: "invalid_type",
                        continue: !1,
                        input: u,
                        inst: e
                    });
                    if (!Number.isSafeInteger(u)) return void(u > 0 ? n.issues.push({
                        input: u,
                        code: "too_big",
                        maximum: Number.MAX_SAFE_INTEGER,
                        note: "Integers must be within the safe integer range.",
                        inst: e,
                        origin: i,
                        inclusive: !0,
                        continue: !t.abort
                    }) : n.issues.push({
                        input: u,
                        code: "too_small",
                        minimum: Number.MIN_SAFE_INTEGER,
                        note: "Integers must be within the safe integer range.",
                        inst: e,
                        origin: i,
                        inclusive: !0,
                        continue: !t.abort
                    }))
                }
                u < o && n.issues.push({
                    origin: "number",
                    input: u,
                    code: "too_small",
                    minimum: o,
                    inclusive: !0,
                    inst: e,
                    continue: !t.abort
                }), u > a && n.issues.push({
                    origin: "number",
                    input: u,
                    code: "too_big",
                    maximum: a,
                    inclusive: !0,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        eb = o("$ZodCheckMaxLength", (e, t) => {
            var n;
            em.init(e, t), null != (n = e._zod.def).when || (n.when = e => {
                let t = e.value;
                return null != t && void 0 !== t.length
            }), e._zod.onattach.push(e => {
                var n;
                let r = null != (n = e._zod.bag.maximum) ? n : 1 / 0;
                t.maximum < r && (e._zod.bag.maximum = t.maximum)
            }), e._zod.check = n => {
                let r = n.value;
                if (r.length <= t.maximum) return;
                let i = T(r);
                n.issues.push({
                    origin: i,
                    code: "too_big",
                    maximum: t.maximum,
                    inclusive: !0,
                    input: r,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        ew = o("$ZodCheckMinLength", (e, t) => {
            var n;
            em.init(e, t), null != (n = e._zod.def).when || (n.when = e => {
                let t = e.value;
                return null != t && void 0 !== t.length
            }), e._zod.onattach.push(e => {
                var n;
                let r = null != (n = e._zod.bag.minimum) ? n : -1 / 0;
                t.minimum > r && (e._zod.bag.minimum = t.minimum)
            }), e._zod.check = n => {
                let r = n.value;
                if (r.length >= t.minimum) return;
                let i = T(r);
                n.issues.push({
                    origin: i,
                    code: "too_small",
                    minimum: t.minimum,
                    inclusive: !0,
                    input: r,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        ek = o("$ZodCheckLengthEquals", (e, t) => {
            var n;
            em.init(e, t), null != (n = e._zod.def).when || (n.when = e => {
                let t = e.value;
                return null != t && void 0 !== t.length
            }), e._zod.onattach.push(e => {
                let n = e._zod.bag;
                n.minimum = t.length, n.maximum = t.length, n.length = t.length
            }), e._zod.check = n => {
                let r = n.value,
                    i = r.length;
                if (i === t.length) return;
                let o = T(r),
                    a = i > t.length;
                n.issues.push({
                    origin: o,
                    ...a ? {
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
        eF = o("$ZodCheckStringFormat", (e, t) => {
            var n, r;
            em.init(e, t), e._zod.onattach.push(e => {
                let n = e._zod.bag;
                n.format = t.format, t.pattern && (null != n.patterns || (n.patterns = new Set), n.patterns.add(t.pattern))
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
            }) : null != (r = e._zod).check || (r.check = () => {})
        }),
        eS = o("$ZodCheckRegex", (e, t) => {
            eF.init(e, t), e._zod.check = n => {
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
        eO = o("$ZodCheckLowerCase", (e, t) => {
            null != t.pattern || (t.pattern = ef), eF.init(e, t)
        }),
        eE = o("$ZodCheckUpperCase", (e, t) => {
            null != t.pattern || (t.pattern = eh), eF.init(e, t)
        }),
        eA = o("$ZodCheckIncludes", (e, t) => {
            em.init(e, t);
            let n = F(t.includes),
                r = new RegExp("number" == typeof t.position ? "^.{".concat(t.position, "}").concat(n) : n);
            t.pattern = r, e._zod.onattach.push(e => {
                let t = e._zod.bag;
                null != t.patterns || (t.patterns = new Set), t.patterns.add(r)
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
        ex = o("$ZodCheckStartsWith", (e, t) => {
            em.init(e, t);
            let n = RegExp("^".concat(F(t.prefix), ".*"));
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
        eZ = o("$ZodCheckEndsWith", (e, t) => {
            em.init(e, t);
            let n = RegExp(".*".concat(F(t.suffix), "$"));
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
        }),
        e$ = o("$ZodCheckOverwrite", (e, t) => {
            em.init(e, t), e._zod.check = e => {
                e.value = t.tx(e.value)
            }
        });
    class eT {
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
    let eP = {
            major: 4,
            minor: 4,
            patch: 3
        },
        ej = o("$ZodType", (e, t) => {
            var n, r, i;
            null != e || (e = {}), e._zod.def = t, e._zod.bag = e._zod.bag || {}, e._zod.version = eP;
            let o = [...null != (n = e._zod.def.checks) ? n : []];
            for (let t of (e._zod.traits.has("$ZodCheck") && o.unshift(e), o))
                for (let n of t._zod.onattach) n(e);
            if (0 === o.length) null != (i = e._zod).deferred || (i.deferred = []), null == (r = e._zod.deferred) || r.push(() => {
                e._zod.run = e._zod.parse
            });
            else {
                let t = (e, t, n) => {
                        let r, i = A(e);
                        for (let o of t) {
                            if (o._zod.def.when) {
                                if (function(e) {
                                        var t;
                                        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
                                        if (!0 === e.aborted) return !0;
                                        for (let r = n; r < e.issues.length; r++)
                                            if ((null == (t = e.issues[r]) ? void 0 : t.continue) === !1) return !0;
                                        return !1
                                    }(e) || !o._zod.def.when(e)) continue
                            } else if (i) continue;
                            let t = e.issues.length,
                                u = o._zod.check(e);
                            if (u instanceof Promise && (null == n ? void 0 : n.async) === !1) throw new a;
                            if (r || u instanceof Promise) r = (null != r ? r : Promise.resolve()).then(async () => {
                                await u, e.issues.length !== t && (i || (i = A(e, t)))
                            });
                            else {
                                if (e.issues.length === t) continue;
                                i || (i = A(e, t))
                            }
                        }
                        return r ? r.then(() => e) : e
                    },
                    n = (n, r, i) => {
                        if (A(n)) return n.aborted = !0, n;
                        let u = t(r, o, i);
                        if (u instanceof Promise) {
                            if (!1 === i.async) throw new a;
                            return u.then(t => e._zod.parse(t, i))
                        }
                        return e._zod.parse(u, i)
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
                    let u = e._zod.parse(r, i);
                    if (u instanceof Promise) {
                        if (!1 === i.async) throw new a;
                        return u.then(e => t(e, o, i))
                    }
                    return t(u, o, i)
                }
            }
            h(e, "~standard", () => ({
                validate: t => {
                    try {
                        var n;
                        let r = R(e, t);
                        return r.success ? {
                            value: r.data
                        } : {
                            issues: null == (n = r.error) ? void 0 : n.issues
                        }
                    } catch (n) {
                        return M(e, t).then(e => {
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
        eI = o("$ZodString", (e, t) => {
            var n, r, i, o, a, u;
            let s;
            ej.init(e, t), e._zod.pattern = null != (n = [...null != (r = null == e || null == (a = e._zod.bag) ? void 0 : a.patterns) ? r : []].pop()) ? n : (s = (u = e._zod.bag) ? "[\\s\\S]{".concat(null != (i = null == u ? void 0 : u.minimum) ? i : 0, ",").concat(null != (o = null == u ? void 0 : u.maximum) ? o : "", "}") : "[\\s\\S]*", RegExp("^".concat(s, "$"))), e._zod.parse = (n, r) => {
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
        eN = o("$ZodStringFormat", (e, t) => {
            eF.init(e, t), eI.init(e, t)
        }),
        eC = o("$ZodGUID", (e, t) => {
            null != t.pattern || (t.pattern = q), eN.init(e, t)
        }),
        eD = o("$ZodUUID", (e, t) => {
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
                null != t.pattern || (t.pattern = H(e))
            } else null != t.pattern || (t.pattern = H());
            eN.init(e, t)
        }),
        eJ = o("$ZodEmail", (e, t) => {
            null != t.pattern || (t.pattern = Y), eN.init(e, t)
        }),
        eR = o("$ZodURL", (e, t) => {
            eN.init(e, t), e._zod.check = n => {
                try {
                    var r;
                    let i = n.value.trim();
                    if (!t.normalize && (null == (r = t.protocol) ? void 0 : r.source) === eo.source && !/^https?:\/\//i.test(i)) return void n.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid URL format",
                        input: n.value,
                        inst: e,
                        continue: !t.abort
                    });
                    let o = new URL(i);
                    t.hostname && (t.hostname.lastIndex = 0, t.hostname.test(o.hostname) || n.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid hostname",
                        pattern: t.hostname.source,
                        input: n.value,
                        inst: e,
                        continue: !t.abort
                    })), t.protocol && (t.protocol.lastIndex = 0, t.protocol.test(o.protocol.endsWith(":") ? o.protocol.slice(0, -1) : o.protocol) || n.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid protocol",
                        pattern: t.protocol.source,
                        input: n.value,
                        inst: e,
                        continue: !t.abort
                    })), t.normalize ? n.value = o.href : n.value = i;
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
        eU = o("$ZodEmoji", (e, t) => {
            null != t.pattern || (t.pattern = RegExp("^([\\u00A9\\u00AE\\u203C\\u2049\\u2122\\u2139\\u2194-\\u2199\\u21A9-\\u21AA\\u231A-\\u231B\\u2328\\u23CF\\u23E9-\\u23F3\\u23F8-\\u23FA\\u24C2\\u25AA-\\u25AB\\u25B6\\u25C0\\u25FB-\\u25FE\\u2600-\\u2604\\u260E\\u2611\\u2614-\\u2615\\u2618\\u261D\\u2620\\u2622-\\u2623\\u2626\\u262A\\u262E-\\u262F\\u2638-\\u263A\\u2640\\u2642\\u2648-\\u2653\\u265F-\\u2660\\u2663\\u2665-\\u2666\\u2668\\u267B\\u267E-\\u267F\\u2692-\\u2697\\u2699\\u269B-\\u269C\\u26A0-\\u26A1\\u26A7\\u26AA-\\u26AB\\u26B0-\\u26B1\\u26BD-\\u26BE\\u26C4-\\u26C5\\u26C8\\u26CE-\\u26CF\\u26D1\\u26D3-\\u26D4\\u26E9-\\u26EA\\u26F0-\\u26F5\\u26F7-\\u26FA\\u26FD\\u2702\\u2705\\u2708-\\u270D\\u270F\\u2712\\u2714\\u2716\\u271D\\u2721\\u2728\\u2733-\\u2734\\u2744\\u2747\\u274C\\u274E\\u2753-\\u2755\\u2757\\u2763-\\u2764\\u2795-\\u2797\\u27A1\\u27B0\\u27BF\\u2934-\\u2935\\u2B05-\\u2B07\\u2B1B-\\u2B1C\\u2B50\\u2B55\\u3030\\u303D\\u3297\\u3299\\u{1F004}\\u{1F02C}-\\u{1F02F}\\u{1F094}-\\u{1F09F}\\u{1F0AF}-\\u{1F0B0}\\u{1F0C0}\\u{1F0CF}-\\u{1F0D0}\\u{1F0F6}-\\u{1F0FF}\\u{1F170}-\\u{1F171}\\u{1F17E}-\\u{1F17F}\\u{1F18E}\\u{1F191}-\\u{1F19A}\\u{1F1AE}-\\u{1F1E5}\\u{1F201}-\\u{1F20F}\\u{1F21A}\\u{1F22F}\\u{1F232}-\\u{1F23A}\\u{1F23C}-\\u{1F23F}\\u{1F249}-\\u{1F25F}\\u{1F266}-\\u{1F321}\\u{1F324}-\\u{1F393}\\u{1F396}-\\u{1F397}\\u{1F399}-\\u{1F39B}\\u{1F39E}-\\u{1F3F0}\\u{1F3F3}-\\u{1F3F5}\\u{1F3F7}-\\u{1F3FA}\\u{1F400}-\\u{1F4FD}\\u{1F4FF}-\\u{1F53D}\\u{1F549}-\\u{1F54E}\\u{1F550}-\\u{1F567}\\u{1F56F}-\\u{1F570}\\u{1F573}-\\u{1F57A}\\u{1F587}\\u{1F58A}-\\u{1F58D}\\u{1F590}\\u{1F595}-\\u{1F596}\\u{1F5A4}-\\u{1F5A5}\\u{1F5A8}\\u{1F5B1}-\\u{1F5B2}\\u{1F5BC}\\u{1F5C2}-\\u{1F5C4}\\u{1F5D1}-\\u{1F5D3}\\u{1F5DC}-\\u{1F5DE}\\u{1F5E1}\\u{1F5E3}\\u{1F5E8}\\u{1F5EF}\\u{1F5F3}\\u{1F5FA}-\\u{1F64F}\\u{1F680}-\\u{1F6C5}\\u{1F6CB}-\\u{1F6D2}\\u{1F6D5}-\\u{1F6E5}\\u{1F6E9}\\u{1F6EB}-\\u{1F6F0}\\u{1F6F3}-\\u{1F6FF}\\u{1F7DA}-\\u{1F7FF}\\u{1F80C}-\\u{1F80F}\\u{1F848}-\\u{1F84F}\\u{1F85A}-\\u{1F85F}\\u{1F888}-\\u{1F88F}\\u{1F8AE}-\\u{1F8AF}\\u{1F8BC}-\\u{1F8BF}\\u{1F8C2}-\\u{1F8CF}\\u{1F8D9}-\\u{1F8FF}\\u{1F90C}-\\u{1F93A}\\u{1F93C}-\\u{1F945}\\u{1F947}-\\u{1F9FF}\\u{1FA58}-\\u{1FA5F}\\u{1FA6E}-\\u{1FAFF}\\u{1FC00}-\\u{1FFFD}]|[\\u0023\\u002A\\u0030-\\u0039\\u200D\\u20E3\\uFE0F\\u{1F1E6}-\\u{1F1FF}\\u{1F3FB}-\\u{1F3FF}\\u{1F9B0}-\\u{1F9B3}\\u{E0020}-\\u{E007F}])+$", "u")), eN.init(e, t)
        }),
        eM = o("$ZodNanoID", (e, t) => {
            null != t.pattern || (t.pattern = G), eN.init(e, t)
        }),
        eB = o("$ZodCUID", (e, t) => {
            null != t.pattern || (t.pattern = B), eN.init(e, t)
        }),
        eL = o("$ZodCUID2", (e, t) => {
            null != t.pattern || (t.pattern = L), eN.init(e, t)
        }),
        eV = o("$ZodULID", (e, t) => {
            null != t.pattern || (t.pattern = V), eN.init(e, t)
        }),
        eW = o("$ZodXID", (e, t) => {
            null != t.pattern || (t.pattern = W), eN.init(e, t)
        }),
        eK = o("$ZodKSUID", (e, t) => {
            null != t.pattern || (t.pattern = K), eN.init(e, t)
        }),
        eG = o("$ZodISODateTime", (e, t) => {
            let n, r, i;
            null != t.pattern || (n = el({
                precision: t.precision
            }), r = ["Z"], t.local && r.push(""), t.offset && r.push("([+-](?:[01]\\d|2[0-3]):[0-5]\\d)"), i = "".concat(n, "(?:").concat(r.join("|"), ")"), t.pattern = RegExp("^".concat(eu, "T(?:").concat(i, ")$"))), eN.init(e, t)
        }),
        eX = o("$ZodISODate", (e, t) => {
            null != t.pattern || (t.pattern = es), eN.init(e, t)
        }),
        eq = o("$ZodISOTime", (e, t) => {
            null != t.pattern || (t.pattern = RegExp("^".concat(el(t), "$"))), eN.init(e, t)
        }),
        eH = o("$ZodISODuration", (e, t) => {
            null != t.pattern || (t.pattern = X), eN.init(e, t)
        }),
        eY = o("$ZodIPv4", (e, t) => {
            null != t.pattern || (t.pattern = Q), eN.init(e, t), e._zod.bag.format = "ipv4"
        }),
        eQ = o("$ZodIPv6", (e, t) => {
            null != t.pattern || (t.pattern = ee), eN.init(e, t), e._zod.bag.format = "ipv6", e._zod.check = n => {
                try {
                    new URL("http://[".concat(n.value, "]"))
                } catch (r) {
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
        e0 = o("$ZodCIDRv4", (e, t) => {
            null != t.pattern || (t.pattern = et), eN.init(e, t)
        }),
        e1 = o("$ZodCIDRv6", (e, t) => {
            null != t.pattern || (t.pattern = en), eN.init(e, t), e._zod.check = n => {
                let r = n.value.split("/");
                try {
                    if (2 !== r.length) throw Error();
                    let [e, t] = r;
                    if (!t) throw Error();
                    let n = Number(t);
                    if ("".concat(n) !== t || n < 0 || n > 128) throw Error();
                    new URL("http://[".concat(e, "]"))
                } catch (r) {
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

    function e2(e) {
        if ("" === e) return !0;
        if (/\s/.test(e) || e.length % 4 != 0) return !1;
        try {
            return atob(e), !0
        } catch (e) {
            return !1
        }
    }
    let e6 = o("$ZodBase64", (e, t) => {
            null != t.pattern || (t.pattern = er), eN.init(e, t), e._zod.bag.contentEncoding = "base64", e._zod.check = n => {
                e2(n.value) || n.issues.push({
                    code: "invalid_format",
                    format: "base64",
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        e9 = o("$ZodBase64URL", (e, t) => {
            null != t.pattern || (t.pattern = ei), eN.init(e, t), e._zod.bag.contentEncoding = "base64url", e._zod.check = n => {
                ! function(e) {
                    if (!ei.test(e)) return !1;
                    let t = e.replace(/[-_]/g, e => "-" === e ? "+" : "/");
                    return e2(t.padEnd(4 * Math.ceil(t.length / 4), "="))
                }(n.value) && n.issues.push({
                    code: "invalid_format",
                    format: "base64url",
                    input: n.value,
                    inst: e,
                    continue: !t.abort
                })
            }
        }),
        e4 = o("$ZodE164", (e, t) => {
            null != t.pattern || (t.pattern = ea), eN.init(e, t)
        }),
        e3 = o("$ZodJWT", (e, t) => {
            eN.init(e, t), e._zod.check = n => {
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
        e5 = o("$ZodNumber", (e, t) => {
            var n;
            ej.init(e, t), e._zod.pattern = null != (n = e._zod.bag.pattern) ? n : ed, e._zod.parse = (n, r) => {
                if (t.coerce) try {
                    n.value = Number(n.value)
                } catch (e) {}
                let i = n.value;
                if ("number" == typeof i && !Number.isNaN(i) && Number.isFinite(i)) return n;
                let o = "number" == typeof i ? Number.isNaN(i) ? "NaN" : Number.isFinite(i) ? void 0 : "Infinity" : void 0;
                return n.issues.push({
                    expected: "number",
                    code: "invalid_type",
                    input: i,
                    inst: e,
                    ...o ? {
                        received: o
                    } : {}
                }), n
            }
        }),
        e7 = o("$ZodNumberFormat", (e, t) => {
            ez.init(e, t), e5.init(e, t)
        }),
        e8 = o("$ZodBoolean", (e, t) => {
            ej.init(e, t), e._zod.pattern = ep, e._zod.parse = (n, r) => {
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
        te = o("$ZodUnknown", (e, t) => {
            ej.init(e, t), e._zod.parse = e => e
        }),
        tt = o("$ZodNever", (e, t) => {
            ej.init(e, t), e._zod.parse = (t, n) => (t.issues.push({
                expected: "never",
                code: "invalid_type",
                input: t.value,
                inst: e
            }), t)
        });

    function tn(e, t, n) {
        e.issues.length && t.issues.push(...x(n, e.issues)), t.value[n] = e.value
    }
    let tr = o("$ZodArray", (e, t) => {
        ej.init(e, t), e._zod.parse = (n, r) => {
            let i = n.value;
            if (!Array.isArray(i)) return n.issues.push({
                expected: "array",
                code: "invalid_type",
                input: i,
                inst: e
            }), n;
            n.value = Array(i.length);
            let o = [];
            for (let e = 0; e < i.length; e++) {
                let a = i[e],
                    u = t.element._zod.run({
                        value: a,
                        issues: []
                    }, r);
                u instanceof Promise ? o.push(u.then(t => tn(t, n, e))) : tn(u, n, e)
            }
            return o.length ? Promise.all(o).then(() => n) : n
        }
    });

    function ti(e, t, n, r, i, o) {
        let a = n in r;
        if (e.issues.length) {
            if (i && o && !a) return;
            t.issues.push(...x(n, e.issues))
        }
        if (!a && !i) {
            e.issues.length || t.issues.push({
                code: "invalid_type",
                expected: "nonoptional",
                input: void 0,
                path: [n]
            });
            return
        }
        void 0 === e.value ? a && (t.value[n] = void 0) : t.value[n] = e.value
    }

    function to(e) {
        var t, n, r, i, o;
        let a = Object.keys(e.shape);
        for (let o of a)
            if (!(null == (i = e.shape) || null == (r = i[o]) || null == (n = r._zod) || null == (t = n.traits) ? void 0 : t.has("$ZodType"))) throw Error('Invalid element at key "'.concat(o, '": expected a Zod schema'));
        let u = Object.keys(o = e.shape).filter(e => "optional" === o[e]._zod.optin && "optional" === o[e]._zod.optout);
        return {
            ...e,
            keys: a,
            keySet: new Set(a),
            numKeys: a.length,
            optionalKeys: new Set(u)
        }
    }

    function ta(e, t, n, r, i, o) {
        let a = [],
            u = i.keySet,
            s = i.catchall._zod,
            l = s.def.type,
            c = "optional" === s.optin,
            d = "optional" === s.optout;
        for (let i in t) {
            if ("__proto__" === i || u.has(i)) continue;
            if ("never" === l) {
                a.push(i);
                continue
            }
            let o = s.run({
                value: t[i],
                issues: []
            }, r);
            o instanceof Promise ? e.push(o.then(e => ti(e, n, i, t, c, d))) : ti(o, n, i, t, c, d)
        }
        return (a.length && n.issues.push({
            code: "unrecognized_keys",
            keys: a,
            input: t,
            inst: o
        }), e.length) ? Promise.all(e).then(() => n) : n
    }
    let tu = o("$ZodObject", (e, t) => {
            let n;
            ej.init(e, t);
            let r = Object.getOwnPropertyDescriptor(t, "shape");
            if (!(null == r ? void 0 : r.get)) {
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
            let i = d(() => to(t));
            h(e._zod, "propValues", () => {
                let e = t.shape,
                    n = {};
                for (let t in e) {
                    let r = e[t]._zod;
                    if (r.values)
                        for (let e of (null != n[t] || (n[t] = new Set), r.values)) n[t].add(e)
                }
                return n
            });
            let o = t.catchall;
            e._zod.parse = (t, r) => {
                null != n || (n = i.value);
                let a = t.value;
                if (!_(a)) return t.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: a,
                    inst: e
                }), t;
                t.value = {};
                let u = [],
                    s = n.shape;
                for (let e of n.keys) {
                    let n = s[e],
                        i = "optional" === n._zod.optin,
                        o = "optional" === n._zod.optout,
                        l = n._zod.run({
                            value: a[e],
                            issues: []
                        }, r);
                    l instanceof Promise ? u.push(l.then(n => ti(n, t, e, a, i, o))) : ti(l, t, e, a, i, o)
                }
                return o ? ta(u, a, t, r, i.value, e) : u.length ? Promise.all(u).then(() => t) : t
            }
        }),
        ts = o("$ZodObjectJIT", (e, t) => {
            let n, r;
            tu.init(e, t);
            let i = e._zod.parse,
                o = d(() => to(t)),
                a = !s.jitless,
                u = a && z.value,
                l = t.catchall;
            e._zod.parse = (s, c) => {
                null != r || (r = o.value);
                let d = s.value;
                return _(d) ? a && u && (null == c ? void 0 : c.async) === !1 && !0 !== c.jitless ? (n || (n = (e => {
                    let t = new eT(["shape", "payload", "ctx"]),
                        n = o.value,
                        r = e => {
                            let t = g(e);
                            return "shape[".concat(t, "]._zod.run({ value: input[").concat(t, "], issues: [] }, ctx)")
                        };
                    t.write("const input = payload.value;");
                    let i = Object.create(null),
                        a = 0;
                    for (let e of n.keys) i[e] = "key_".concat(a++);
                    for (let o of (t.write("const newResult = {};"), n.keys)) {
                        var u, s;
                        let n = i[o],
                            a = g(o),
                            l = e[o],
                            c = (null == l || null == (u = l._zod) ? void 0 : u.optin) === "optional",
                            d = (null == l || null == (s = l._zod) ? void 0 : s.optout) === "optional";
                        t.write("const ".concat(n, " = ").concat(r(o), ";")), c && d ? t.write("\n        if (".concat(n, ".issues.length) {\n          if (").concat(a, " in input) {\n            payload.issues = payload.issues.concat(").concat(n, ".issues.map(iss => ({\n              ...iss,\n              path: iss.path ? [").concat(a, ", ...iss.path] : [").concat(a, "]\n            })));\n          }\n        }\n        \n        if (").concat(n, ".value === undefined) {\n          if (").concat(a, " in input) {\n            newResult[").concat(a, "] = undefined;\n          }\n        } else {\n          newResult[").concat(a, "] = ").concat(n, ".value;\n        }\n        \n      ")) : c ? t.write("\n        if (".concat(n, ".issues.length) {\n          payload.issues = payload.issues.concat(").concat(n, ".issues.map(iss => ({\n            ...iss,\n            path: iss.path ? [").concat(a, ", ...iss.path] : [").concat(a, "]\n          })));\n        }\n        \n        if (").concat(n, ".value === undefined) {\n          if (").concat(a, " in input) {\n            newResult[").concat(a, "] = undefined;\n          }\n        } else {\n          newResult[").concat(a, "] = ").concat(n, ".value;\n        }\n        \n      ")) : t.write("\n        const ".concat(n, "_present = ").concat(a, " in input;\n        if (").concat(n, ".issues.length) {\n          payload.issues = payload.issues.concat(").concat(n, ".issues.map(iss => ({\n            ...iss,\n            path: iss.path ? [").concat(a, ", ...iss.path] : [").concat(a, "]\n          })));\n        }\n        if (!").concat(n, "_present && !").concat(n, '.issues.length) {\n          payload.issues.push({\n            code: "invalid_type",\n            expected: "nonoptional",\n            input: undefined,\n            path: [').concat(a, "]\n          });\n        }\n\n        if (").concat(n, "_present) {\n          if (").concat(n, ".value === undefined) {\n            newResult[").concat(a, "] = undefined;\n          } else {\n            newResult[").concat(a, "] = ").concat(n, ".value;\n          }\n        }\n\n      "))
                    }
                    t.write("payload.value = newResult;"), t.write("return payload;");
                    let l = t.compile();
                    return (t, n) => l(e, t, n)
                })(t.shape)), s = n(s, c), l) ? ta([], d, s, c, r, e) : s : i(s, c) : (s.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: d,
                    inst: e
                }), s)
            }
        });

    function tl(e, t, n, r) {
        for (let n of e)
            if (0 === n.issues.length) return t.value = n.value, t;
        let i = e.filter(e => !A(e));
        return 1 === i.length ? (t.value = i[0].value, i[0]) : (t.issues.push({
            code: "invalid_union",
            input: t.value,
            inst: n,
            errors: e.map(e => e.issues.map(e => $(e, r, s)))
        }), t)
    }
    let tc = o("$ZodUnion", (e, t) => {
        ej.init(e, t), h(e._zod, "optin", () => t.options.some(e => "optional" === e._zod.optin) ? "optional" : void 0), h(e._zod, "optout", () => t.options.some(e => "optional" === e._zod.optout) ? "optional" : void 0), h(e._zod, "values", () => {
            if (t.options.every(e => e._zod.values)) return new Set(t.options.flatMap(e => Array.from(e._zod.values)))
        }), h(e._zod, "pattern", () => {
            if (t.options.every(e => e._zod.pattern)) {
                let e = t.options.map(e => e._zod.pattern);
                return RegExp("^(".concat(e.map(e => p(e.source)).join("|"), ")$"))
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
            return o ? Promise.all(a).then(t => tl(t, r, e, i)) : tl(a, r, e, i)
        }
    });

    function td(e, t, n, r) {
        let i = e.filter(e => 0 === e.issues.length);
        return 1 === i.length ? t.value = i[0].value : 0 === i.length ? t.issues.push({
            code: "invalid_union",
            input: t.value,
            inst: n,
            errors: e.map(e => e.issues.map(e => $(e, r, s)))
        }) : t.issues.push({
            code: "invalid_union",
            input: t.value,
            inst: n,
            errors: [],
            inclusive: !1
        }), t
    }
    let tp = o("$ZodXor", (e, t) => {
            tc.init(e, t), t.inclusive = !1;
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
                    t instanceof Promise ? (a.push(t), o = !0) : a.push(t)
                }
                return o ? Promise.all(a).then(t => td(t, r, e, i)) : td(a, r, e, i)
            }
        }),
        tf = o("$ZodDiscriminatedUnion", (e, t) => {
            t.inclusive = !1, tc.init(e, t);
            let n = e._zod.parse;
            h(e._zod, "propValues", () => {
                let e = {};
                for (let n of t.options) {
                    let r = n._zod.propValues;
                    if (!r || 0 === Object.keys(r).length) throw Error('Invalid discriminated union option at index "'.concat(t.options.indexOf(n), '"'));
                    for (let [t, n] of Object.entries(r))
                        for (let r of (e[t] || (e[t] = new Set), n)) e[t].add(r)
                }
                return e
            });
            let r = d(() => {
                let e = t.options,
                    n = new Map;
                for (let i of e) {
                    var r;
                    let e = null == (r = i._zod.propValues) ? void 0 : r[t.discriminator];
                    if (!e || 0 === e.size) throw Error('Invalid discriminated union option at index "'.concat(t.options.indexOf(i), '"'));
                    for (let t of e) {
                        if (n.has(t)) throw Error('Duplicate discriminator value "'.concat(String(t), '"'));
                        n.set(t, i)
                    }
                }
                return n
            });
            e._zod.parse = (i, o) => {
                let a = i.value;
                if (!_(a)) return i.issues.push({
                    code: "invalid_type",
                    expected: "object",
                    input: a,
                    inst: e
                }), i;
                let u = r.value.get(null == a ? void 0 : a[t.discriminator]);
                return u ? u._zod.run(i, o) : t.unionFallback || "backward" === o.direction ? n(i, o) : (i.issues.push({
                    code: "invalid_union",
                    errors: [],
                    note: "No matching discriminator",
                    discriminator: t.discriminator,
                    options: Array.from(r.value.keys()),
                    input: a,
                    path: [t.discriminator],
                    inst: e
                }), i)
            }
        }),
        th = o("$ZodIntersection", (e, t) => {
            ej.init(e, t), e._zod.parse = (e, n) => {
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
                    return tm(e, n, r)
                }) : tm(e, i, o)
            }
        });

    function tm(e, t, n) {
        let r, i = new Map;
        for (let n of t.issues)
            if ("unrecognized_keys" === n.code)
                for (let e of (null != r || (r = n), n.keys)) i.has(e) || i.set(e, {}), i.get(e).l = !0;
            else e.issues.push(n);
        for (let t of n.issues)
            if ("unrecognized_keys" === t.code)
                for (let e of t.keys) i.has(e) || i.set(e, {}), i.get(e).r = !0;
            else e.issues.push(t);
        let o = [...i].filter(e => {
            let [, t] = e;
            return t.l && t.r
        }).map(e => {
            let [t] = e;
            return t
        });
        if (o.length && r && e.issues.push({
                ...r,
                keys: o
            }), A(e)) return e;
        let a = function e(t, n) {
            if (t === n || t instanceof Date && n instanceof Date && +t == +n) return {
                valid: !0,
                data: t
            };
            if (b(t) && b(n)) {
                let r = Object.keys(n),
                    i = Object.keys(t).filter(e => -1 !== r.indexOf(e)),
                    o = {
                        ...t,
                        ...n
                    };
                for (let r of i) {
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
        if (!a.valid) throw Error("Unmergable intersection. Error path: ".concat(JSON.stringify(a.mergeErrorPath)));
        return e.value = a.data, e
    }
    let tv = o("$ZodRecord", (e, t) => {
            ej.init(e, t), e._zod.parse = (n, r) => {
                let i = n.value;
                if (!b(i)) return n.issues.push({
                    expected: "record",
                    code: "invalid_type",
                    input: i,
                    inst: e
                }), n;
                let o = [],
                    a = t.keyType._zod.values;
                if (a) {
                    let u;
                    n.value = {};
                    let l = new Set;
                    for (let u of a)
                        if ("string" == typeof u || "number" == typeof u || "symbol" == typeof u) {
                            l.add("number" == typeof u ? u.toString() : u);
                            let a = t.keyType._zod.run({
                                value: u,
                                issues: []
                            }, r);
                            if (a instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                            if (a.issues.length) {
                                n.issues.push({
                                    code: "invalid_key",
                                    origin: "record",
                                    issues: a.issues.map(e => $(e, r, s)),
                                    input: u,
                                    path: [u],
                                    inst: e
                                });
                                continue
                            }
                            let c = a.value,
                                d = t.valueType._zod.run({
                                    value: i[u],
                                    issues: []
                                }, r);
                            d instanceof Promise ? o.push(d.then(e => {
                                e.issues.length && n.issues.push(...x(u, e.issues)), n.value[c] = e.value
                            })) : (d.issues.length && n.issues.push(...x(u, d.issues)), n.value[c] = d.value)
                        } for (let e in i) l.has(e) || (u = null != u ? u : []).push(e);
                    u && u.length > 0 && n.issues.push({
                        code: "unrecognized_keys",
                        input: i,
                        inst: e,
                        keys: u
                    })
                } else
                    for (let a of (n.value = {}, Reflect.ownKeys(i))) {
                        if ("__proto__" === a || !Object.prototype.propertyIsEnumerable.call(i, a)) continue;
                        let u = t.keyType._zod.run({
                            value: a,
                            issues: []
                        }, r);
                        if (u instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                        if ("string" == typeof a && ed.test(a) && u.issues.length) {
                            let e = t.keyType._zod.run({
                                value: Number(a),
                                issues: []
                            }, r);
                            if (e instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                            0 === e.issues.length && (u = e)
                        }
                        if (u.issues.length) {
                            "loose" === t.mode ? n.value[a] = i[a] : n.issues.push({
                                code: "invalid_key",
                                origin: "record",
                                issues: u.issues.map(e => $(e, r, s)),
                                input: a,
                                path: [a],
                                inst: e
                            });
                            continue
                        }
                        let l = t.valueType._zod.run({
                            value: i[a],
                            issues: []
                        }, r);
                        l instanceof Promise ? o.push(l.then(e => {
                            e.issues.length && n.issues.push(...x(a, e.issues)), n.value[u.value] = e.value
                        })) : (l.issues.length && n.issues.push(...x(a, l.issues)), n.value[u.value] = l.value)
                    }
                return o.length ? Promise.all(o).then(() => n) : n
            }
        }),
        tg = o("$ZodEnum", (e, t) => {
            ej.init(e, t);
            let n = l(t.entries),
                r = new Set(n);
            e._zod.values = r, e._zod.pattern = RegExp("^(".concat(n.filter(e => k.has(typeof e)).map(e => "string" == typeof e ? F(e) : e.toString()).join("|"), ")$")), e._zod.parse = (t, i) => {
                let o = t.value;
                return r.has(o) || t.issues.push({
                    code: "invalid_value",
                    values: n,
                    input: o,
                    inst: e
                }), t
            }
        }),
        ty = o("$ZodLiteral", (e, t) => {
            if (ej.init(e, t), 0 === t.values.length) throw Error("Cannot create literal schema with no valid values");
            let n = new Set(t.values);
            e._zod.values = n, e._zod.pattern = RegExp("^(".concat(t.values.map(e => "string" == typeof e ? F(e) : e ? F(e.toString()) : String(e)).join("|"), ")$")), e._zod.parse = (r, i) => {
                let o = r.value;
                return n.has(o) || r.issues.push({
                    code: "invalid_value",
                    values: t.values,
                    input: o,
                    inst: e
                }), r
            }
        }),
        t_ = o("$ZodTransform", (e, t) => {
            ej.init(e, t), e._zod.optin = "optional", e._zod.parse = (n, r) => {
                if ("backward" === r.direction) throw new u(e.constructor.name);
                let i = t.transform(n.value, n);
                if (r.async) return (i instanceof Promise ? i : Promise.resolve(i)).then(e => (n.value = e, n.fallback = !0, n));
                if (i instanceof Promise) throw new a;
                return n.value = i, n.fallback = !0, n
            }
        });

    function tz(e, t) {
        return void 0 === t && (e.issues.length || e.fallback) ? {
            issues: [],
            value: void 0
        } : e
    }
    let tb = o("$ZodOptional", (e, t) => {
            ej.init(e, t), e._zod.optin = "optional", e._zod.optout = "optional", h(e._zod, "values", () => t.innerType._zod.values ? new Set([...t.innerType._zod.values, void 0]) : void 0), h(e._zod, "pattern", () => {
                let e = t.innerType._zod.pattern;
                return e ? RegExp("^(".concat(p(e.source), ")?$")) : void 0
            }), e._zod.parse = (e, n) => {
                if ("optional" === t.innerType._zod.optin) {
                    let r = e.value,
                        i = t.innerType._zod.run(e, n);
                    return i instanceof Promise ? i.then(e => tz(e, r)) : tz(i, r)
                }
                return void 0 === e.value ? e : t.innerType._zod.run(e, n)
            }
        }),
        tw = o("$ZodExactOptional", (e, t) => {
            tb.init(e, t), h(e._zod, "values", () => t.innerType._zod.values), h(e._zod, "pattern", () => t.innerType._zod.pattern), e._zod.parse = (e, n) => t.innerType._zod.run(e, n)
        }),
        tk = o("$ZodNullable", (e, t) => {
            ej.init(e, t), h(e._zod, "optin", () => t.innerType._zod.optin), h(e._zod, "optout", () => t.innerType._zod.optout), h(e._zod, "pattern", () => {
                let e = t.innerType._zod.pattern;
                return e ? RegExp("^(".concat(p(e.source), "|null)$")) : void 0
            }), h(e._zod, "values", () => t.innerType._zod.values ? new Set([...t.innerType._zod.values, null]) : void 0), e._zod.parse = (e, n) => null === e.value ? e : t.innerType._zod.run(e, n)
        }),
        tF = o("$ZodDefault", (e, t) => {
            ej.init(e, t), e._zod.optin = "optional", h(e._zod, "values", () => t.innerType._zod.values), e._zod.parse = (e, n) => {
                if ("backward" === n.direction) return t.innerType._zod.run(e, n);
                if (void 0 === e.value) return e.value = t.defaultValue, e;
                let r = t.innerType._zod.run(e, n);
                return r instanceof Promise ? r.then(e => tS(e, t)) : tS(r, t)
            }
        });

    function tS(e, t) {
        return void 0 === e.value && (e.value = t.defaultValue), e
    }
    let tO = o("$ZodPrefault", (e, t) => {
            ej.init(e, t), e._zod.optin = "optional", h(e._zod, "values", () => t.innerType._zod.values), e._zod.parse = (e, n) => ("backward" === n.direction || void 0 === e.value && (e.value = t.defaultValue), t.innerType._zod.run(e, n))
        }),
        tE = o("$ZodNonOptional", (e, t) => {
            ej.init(e, t), h(e._zod, "values", () => {
                let e = t.innerType._zod.values;
                return e ? new Set([...e].filter(e => void 0 !== e)) : void 0
            }), e._zod.parse = (n, r) => {
                let i = t.innerType._zod.run(n, r);
                return i instanceof Promise ? i.then(t => tA(t, e)) : tA(i, e)
            }
        });

    function tA(e, t) {
        return e.issues.length || void 0 !== e.value || e.issues.push({
            code: "invalid_type",
            expected: "nonoptional",
            input: e.value,
            inst: t
        }), e
    }
    let tx = o("$ZodCatch", (e, t) => {
            ej.init(e, t), e._zod.optin = "optional", h(e._zod, "optout", () => t.innerType._zod.optout), h(e._zod, "values", () => t.innerType._zod.values), e._zod.parse = (e, n) => {
                if ("backward" === n.direction) return t.innerType._zod.run(e, n);
                let r = t.innerType._zod.run(e, n);
                return r instanceof Promise ? r.then(r => (e.value = r.value, r.issues.length && (e.value = t.catchValue({
                    ...e,
                    error: {
                        issues: r.issues.map(e => $(e, n, s))
                    },
                    input: e.value
                }), e.issues = [], e.fallback = !0), e)) : (e.value = r.value, r.issues.length && (e.value = t.catchValue({
                    ...e,
                    error: {
                        issues: r.issues.map(e => $(e, n, s))
                    },
                    input: e.value
                }), e.issues = [], e.fallback = !0), e)
            }
        }),
        tZ = o("$ZodPipe", (e, t) => {
            ej.init(e, t), h(e._zod, "values", () => t.in._zod.values), h(e._zod, "optin", () => t.in._zod.optin), h(e._zod, "optout", () => t.out._zod.optout), h(e._zod, "propValues", () => t.in._zod.propValues), e._zod.parse = (e, n) => {
                if ("backward" === n.direction) {
                    let r = t.out._zod.run(e, n);
                    return r instanceof Promise ? r.then(e => t$(e, t.in, n)) : t$(r, t.in, n)
                }
                let r = t.in._zod.run(e, n);
                return r instanceof Promise ? r.then(e => t$(e, t.out, n)) : t$(r, t.out, n)
            }
        });

    function t$(e, t, n) {
        return e.issues.length ? (e.aborted = !0, e) : t._zod.run({
            value: e.value,
            issues: e.issues,
            fallback: e.fallback
        }, n)
    }
    let tT = o("$ZodReadonly", (e, t) => {
        ej.init(e, t), h(e._zod, "propValues", () => t.innerType._zod.propValues), h(e._zod, "values", () => t.innerType._zod.values), h(e._zod, "optin", () => {
            var e, n;
            return null == (n = t.innerType) || null == (e = n._zod) ? void 0 : e.optin
        }), h(e._zod, "optout", () => {
            var e, n;
            return null == (n = t.innerType) || null == (e = n._zod) ? void 0 : e.optout
        }), e._zod.parse = (e, n) => {
            if ("backward" === n.direction) return t.innerType._zod.run(e, n);
            let r = t.innerType._zod.run(e, n);
            return r instanceof Promise ? r.then(tP) : tP(r)
        }
    });

    function tP(e) {
        return e.value = Object.freeze(e.value), e
    }
    let tj = o("$ZodCustom", (e, t) => {
        em.init(e, t), ej.init(e, t), e._zod.parse = (e, t) => e, e._zod.check = n => {
            let r = n.value,
                i = t.fn(r);
            if (i instanceof Promise) return i.then(t => tI(t, n, r, e));
            tI(i, n, r, e)
        }
    });

    function tI(e, t, n, r) {
        if (!e) {
            var i;
            let e = {
                code: "custom",
                input: n,
                inst: r,
                path: [...null != (i = r._zod.def.path) ? i : []],
                continue: !r._zod.def.abort
            };
            r._zod.def.params && (e.params = r._zod.def.params), t.issues.push(P(e))
        }
    }
    null != (r = globalThis).__zod_globalRegistry || (r.__zod_globalRegistry = new class {
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
    let tN = globalThis.__zod_globalRegistry;

    function tC(e, t) {
        return new e({
            type: "string",
            format: "guid",
            check: "string_format",
            abort: !1,
            ...O(t)
        })
    }

    function tD(e, t) {
        return new eg({
            check: "less_than",
            ...O(t),
            value: e,
            inclusive: !1
        })
    }

    function tJ(e, t) {
        return new eg({
            check: "less_than",
            ...O(t),
            value: e,
            inclusive: !0
        })
    }

    function tR(e, t) {
        return new ey({
            check: "greater_than",
            ...O(t),
            value: e,
            inclusive: !1
        })
    }

    function tU(e, t) {
        return new ey({
            check: "greater_than",
            ...O(t),
            value: e,
            inclusive: !0
        })
    }

    function tM(e, t) {
        return new e_({
            check: "multiple_of",
            ...O(t),
            value: e
        })
    }

    function tB(e, t) {
        return new eb({
            check: "max_length",
            ...O(t),
            maximum: e
        })
    }

    function tL(e, t) {
        return new ew({
            check: "min_length",
            ...O(t),
            minimum: e
        })
    }

    function tV(e, t) {
        return new ek({
            check: "length_equals",
            ...O(t),
            length: e
        })
    }

    function tW(e) {
        return new e$({
            check: "overwrite",
            tx: e
        })
    }

    function tK(e) {
        var t, n, r, i, o, a, u, s, l;
        let c = null != (t = null == e ? void 0 : e.target) ? t : "draft-2020-12";
        return "draft-4" === c && (c = "draft-04"), "draft-7" === c && (c = "draft-07"), {
            processors: null != (n = e.processors) ? n : {},
            metadataRegistry: null != (r = null == e ? void 0 : e.metadata) ? r : tN,
            target: c,
            unrepresentable: null != (i = null == e ? void 0 : e.unrepresentable) ? i : "throw",
            override: null != (o = null == e ? void 0 : e.override) ? o : () => {},
            io: null != (a = null == e ? void 0 : e.io) ? a : "output",
            counter: 0,
            seen: new Map,
            cycles: null != (u = null == e ? void 0 : e.cycles) ? u : "ref",
            reused: null != (s = null == e ? void 0 : e.reused) ? s : "inline",
            external: null != (l = null == e ? void 0 : e.external) ? l : void 0
        }
    }

    function tG(e, t) {
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
        t.seen.set(e, s);
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
            r && (s.ref || (s.ref = r), tG(r, t, n), t.seen.get(r).isParent = !0)
        }
        let c = t.metadataRegistry.get(e);
        return c && Object.assign(s.schema, c), "input" === t.io && function e(t, n) {
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
            if ("promise" === i.type || "optional" === i.type || "nonoptional" === i.type || "nullable" === i.type || "readonly" === i.type || "default" === i.type || "prefault" === i.type) return e(i.innerType, r);
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

    function tX(e, t) {
        var n, r, i, o;
        let a = e.seen.get(t);
        if (!a) throw Error("Unprocessed schema. This is a bug in Zod.");
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
                            ref: "".concat(a("__shared"), "#/").concat(s, "/").concat(l)
                        }
                    }
                    if (t[1] === a) return {
                        ref: "#"
                    };
                    let l = "#/".concat(s, "/"),
                        c = null != (n = t[1].schema.id) ? n : "__schema".concat(e.counter++);
                    return {
                        defId: c,
                        ref: l + c
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
            if ((null == (i = e.metadataRegistry.get(n[0])) ? void 0 : i.id) || r.cycle || r.count > 1 && "ref" === e.reused) {
                s(n);
                continue
            }
        }
    }

    function tq(e, t) {
        var n, r, i, o, a, u;
        let s = e.seen.get(t);
        if (!s) throw Error("Unprocessed schema. This is a bug in Zod.");
        let l = t => {
            var n, r, i;
            let o = e.seen.get(t);
            if (null === o.ref) return;
            let a = null != (n = o.def) ? n : o.schema,
                u = {
                    ...a
                },
                s = o.ref;
            if (o.ref = null, s) {
                l(s);
                let n = e.seen.get(s),
                    r = n.schema;
                if (r.$ref && ("draft-07" === e.target || "draft-04" === e.target || "openapi-3.0" === e.target) ? (a.allOf = null != (i = a.allOf) ? i : [], a.allOf.push(r)) : Object.assign(a, r), Object.assign(a, u), t._zod.parent === s)
                    for (let e in a) "$ref" !== e && "allOf" !== e && (e in u || delete a[e]);
                if (r.$ref && n.def)
                    for (let e in a) "$ref" !== e && "allOf" !== e && e in n.def && JSON.stringify(a[e]) === JSON.stringify(n.def[e]) && delete a[e]
            }
            let c = t._zod.parent;
            if (c && c !== s) {
                l(c);
                let t = e.seen.get(c);
                if ((null == t ? void 0 : t.schema.$ref) && (a.$ref = t.schema.$ref, t.def))
                    for (let e in a) "$ref" !== e && "allOf" !== e && e in t.def && JSON.stringify(a[e]) === JSON.stringify(t.def[e]) && delete a[e]
            }
            e.override({
                zodSchema: t,
                jsonSchema: a,
                path: null != (r = o.path) ? r : []
            })
        };
        for (let t of [...e.seen.entries()].reverse()) l(t[0]);
        let c = {};
        if ("draft-2020-12" === e.target ? c.$schema = "https://json-schema.org/draft/2020-12/schema" : "draft-07" === e.target ? c.$schema = "http://json-schema.org/draft-07/schema#" : "draft-04" === e.target ? c.$schema = "http://json-schema.org/draft-04/schema#" : e.target, null == (i = e.external) ? void 0 : i.uri) {
            let n = null == (u = e.external.registry.get(t)) ? void 0 : u.id;
            if (!n) throw Error("Schema is missing an `id` property");
            c.$id = e.external.uri(n)
        }
        Object.assign(c, null != (n = s.def) ? n : s.schema);
        let d = null == (o = e.metadataRegistry.get(t)) ? void 0 : o.id;
        void 0 !== d && c.id === d && delete c.id;
        let p = null != (r = null == (a = e.external) ? void 0 : a.defs) ? r : {};
        for (let t of e.seen.entries()) {
            let e = t[1];
            e.def && e.defId && (e.def.id === e.defId && delete e.def.id, p[e.defId] = e.def)
        }
        e.external || Object.keys(p).length > 0 && ("draft-2020-12" === e.target ? c.$defs = p : c.definitions = p);
        try {
            let n = JSON.parse(JSON.stringify(c));
            return Object.defineProperty(n, "~standard", {
                value: {
                    ...t["~standard"],
                    jsonSchema: {
                        input: tH(t, "input", e.processors),
                        output: tH(t, "output", e.processors)
                    }
                },
                enumerable: !1,
                writable: !1
            }), n
        } catch (e) {
            throw Error("Error converting schema to JSON.")
        }
    }
    let tH = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
            return r => {
                let {
                    libraryOptions: i,
                    target: o
                } = null != r ? r : {}, a = tK({
                    ...null != i ? i : {},
                    target: o,
                    io: t,
                    processors: n
                });
                return tG(e, a), tX(a, e), tq(a, e)
            }
        },
        tY = {
            guid: "uuid",
            url: "uri",
            datetime: "date-time",
            json_string: "json-string",
            regex: ""
        },
        tQ = (e, t, n, r) => {
            let i = e._zod.def,
                o = !1 === i.inclusive,
                a = i.options.map((e, n) => tG(e, t, {
                    ...r,
                    path: [...r.path, o ? "oneOf" : "anyOf", n]
                }));
            o ? n.oneOf = a : n.anyOf = a
        },
        t0 = (e, t, n, r) => {
            let i = e._zod.def;
            tG(i.innerType, t, r), t.seen.get(e).ref = i.innerType
        },
        t1 = o("ZodISODateTime", (e, t) => {
            eG.init(e, t), nd.init(e, t)
        }),
        t2 = o("ZodISODate", (e, t) => {
            eX.init(e, t), nd.init(e, t)
        });

    function t6(e) {
        return new t2({
            type: "string",
            format: "date",
            check: "string_format",
            ...O(e)
        })
    }
    let t9 = o("ZodISOTime", (e, t) => {
            eq.init(e, t), nd.init(e, t)
        }),
        t4 = o("ZodISODuration", (e, t) => {
            eH.init(e, t), nd.init(e, t)
        }),
        t3 = o("ZodError", (e, t) => {
            I.init(e, t), e.name = "ZodError", Object.defineProperties(e, {
                format: {
                    value: t => (function(e) {
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
                                            let n = e[i];
                                            i === e.length - 1 ? (r[n] = r[n] || {
                                                _errors: []
                                            }, r[n]._errors.push(t(o))) : r[n] = r[n] || {
                                                _errors: []
                                            }, r = r[n], i++
                                        }
                                    }
                                }
                            };
                        return r(e), n
                    })(e, t)
                },
                flatten: {
                    value: t => (function(e) {
                        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e => e.message,
                            n = {},
                            r = [];
                        for (let i of e.issues) i.path.length > 0 ? (n[i.path[0]] = n[i.path[0]] || [], n[i.path[0]].push(t(i))) : r.push(t(i));
                        return {
                            formErrors: r,
                            fieldErrors: n
                        }
                    })(e, t)
                },
                addIssue: {
                    value: t => {
                        e.issues.push(t), e.message = JSON.stringify(e.issues, c, 2)
                    }
                },
                addIssues: {
                    value: t => {
                        e.issues.push(...t), e.message = JSON.stringify(e.issues, c, 2)
                    }
                },
                isEmpty: {
                    get: () => 0 === e.issues.length
                }
            })
        }, {
            Parent: Error
        }),
        t5 = C(t3),
        t7 = D(t3),
        t8 = J(t3),
        ne = U(t3),
        nt = async (e, t, n) => {
            let r = n ? {
                ...n,
                direction: "backward"
            } : {
                direction: "backward"
            };
            return D(t3)(e, t, r)
        }, nn = async (e, t, n) => D(t3)(e, t, n), nr = async (e, t, n) => {
            let r = n ? {
                ...n,
                direction: "backward"
            } : {
                direction: "backward"
            };
            return U(t3)(e, t, r)
        }, ni = async (e, t, n) => U(t3)(e, t, n), no = new WeakMap;

    function na(e, t, n) {
        let r = Object.getPrototypeOf(e),
            i = no.get(r);
        if (i || (i = new Set, no.set(r, i)), !i.has(t))
            for (let e in i.add(t), n) {
                let t = n[e];
                Object.defineProperty(r, e, {
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
    let nu = o("ZodType", (e, t) => (ej.init(e, t), Object.assign(e["~standard"], {
            jsonSchema: {
                input: tH(e, "input"),
                output: tH(e, "output")
            }
        }), e.toJSONSchema = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return n => {
                let r = tK({
                    ...n,
                    processors: t
                });
                return tG(e, r), tX(r, e), tq(r, e)
            }
        }(e, {}), e.def = t, e.type = t.type, Object.defineProperty(e, "_def", {
            value: t
        }), e.parse = (t, n) => t5(e, t, n, {
            callee: e.parse
        }), e.safeParse = (t, n) => t8(e, t, n), e.parseAsync = async (t, n) => t7(e, t, n, {
            callee: e.parseAsync
        }), e.safeParseAsync = async (t, n) => ne(e, t, n), e.spa = e.safeParseAsync, e.encode = (t, n) => {
            let r;
            return r = n ? {
                ...n,
                direction: "backward"
            } : {
                direction: "backward"
            }, C(t3)(e, t, r)
        }, e.decode = (t, n) => C(t3)(e, t, n), e.encodeAsync = async (t, n) => nt(e, t, n), e.decodeAsync = async (t, n) => nn(e, t, n), e.safeEncode = (t, n) => {
            let r;
            return r = n ? {
                ...n,
                direction: "backward"
            } : {
                direction: "backward"
            }, J(t3)(e, t, r)
        }, e.safeDecode = (t, n) => J(t3)(e, t, n), e.safeEncodeAsync = async (t, n) => nr(e, t, n), e.safeDecodeAsync = async (t, n) => ni(e, t, n), na(e, "ZodType", {
            check() {
                for (var e, t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                let i = this.def;
                return this.clone(v(i, {
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
                return S(this, e, t)
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
                    return new ro({
                        type: "custom",
                        check: "custom",
                        fn: e,
                        ...O(t)
                    })
                }(e, t))
            },
            superRefine(e, t) {
                var n;
                let r, i;
                return this.check((n = t => (t.addIssue = e => {
                    "string" == typeof e ? t.issues.push(P(e, t.value, r._zod.def)) : (e.fatal && (e.continue = !1), null != e.code || (e.code = "custom"), null != e.input || (e.input = t.value), null != e.inst || (e.inst = r), null != e.continue || (e.continue = !r._zod.def.abort), t.issues.push(P(e)))
                }, e(t.value, t)), (i = new em({
                    check: "custom",
                    ...O(t)
                }))._zod.check = n, r = i))
            },
            overwrite(e) {
                return this.check(tW(e))
            },
            optional() {
                return n9(this)
            },
            exactOptional() {
                return new n4({
                    type: "optional",
                    innerType: this
                })
            },
            nullable() {
                return n5(this)
            },
            nullish() {
                return n9(n5(this))
            },
            nonoptional(e) {
                return new re({
                    type: "nonoptional",
                    innerType: this,
                    ...O(e)
                })
            },
            array() {
                return nM(this)
            },
            or(e) {
                return nK([this, e])
            },
            and(e) {
                return new nq({
                    type: "intersection",
                    left: this,
                    right: e
                })
            },
            transform(e) {
                return rr(this, new n2({
                    type: "transform",
                    transform: e
                }))
            },
            default (e) {
                return new n7({
                    type: "default",
                    innerType: this,
                    get defaultValue() {
                        return "function" == typeof e ? e() : w(e)
                    }
                })
            },
            prefault(e) {
                return new n8({
                    type: "prefault",
                    innerType: this,
                    get defaultValue() {
                        return "function" == typeof e ? e() : w(e)
                    }
                })
            },
            catch (e) {
                return new rt({
                    type: "catch",
                    innerType: this,
                    catchValue: "function" == typeof e ? e : () => e
                })
            },
            pipe(e) {
                return rr(this, e)
            },
            readonly() {
                return new ri({
                    type: "readonly",
                    innerType: this
                })
            },
            describe(e) {
                let t = this.clone();
                return tN.add(t, {
                    description: e
                }), t
            },
            meta() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                if (0 === t.length) return tN.get(this);
                let r = this.clone();
                return tN.add(r, t[0]), r
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
            get: () => {
                var t;
                return null == (t = tN.get(e)) ? void 0 : t.description
            },
            configurable: !0
        }), e)),
        ns = o("_ZodString", (e, t) => {
            var n, r, i;
            eI.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (t, n, r) => ((e, t, n) => {
                var r;
                n.type = "string";
                let {
                    minimum: i,
                    maximum: o,
                    format: a,
                    patterns: u,
                    contentEncoding: s
                } = e._zod.bag;
                if ("number" == typeof i && (n.minLength = i), "number" == typeof o && (n.maxLength = o), a && (n.format = null != (r = tY[a]) ? r : a, "" === n.format && delete n.format, "time" === a && delete n.format), s && (n.contentEncoding = s), u && u.size > 0) {
                    let e = [...u];
                    1 === e.length ? n.pattern = e[0].source : e.length > 1 && (n.allOf = [...e.map(e => ({
                        ..."draft-07" === t.target || "draft-04" === t.target || "openapi-3.0" === t.target ? {
                            type: "string"
                        } : {},
                        pattern: e.source
                    }))])
                }
            })(e, t, n);
            let o = e._zod.bag;
            e.format = null != (n = o.format) ? n : null, e.minLength = null != (r = o.minimum) ? r : null, e.maxLength = null != (i = o.maximum) ? i : null, na(e, "_ZodString", {
                regex() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return this.check(function(e, t) {
                        return new eS({
                            check: "string_format",
                            format: "regex",
                            ...O(t),
                            pattern: e
                        })
                    }(...t))
                },
                includes() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return this.check(function(e, t) {
                        return new eA({
                            check: "string_format",
                            format: "includes",
                            ...O(t),
                            includes: e
                        })
                    }(...t))
                },
                startsWith() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return this.check(function(e, t) {
                        return new ex({
                            check: "string_format",
                            format: "starts_with",
                            ...O(t),
                            prefix: e
                        })
                    }(...t))
                },
                endsWith() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return this.check(function(e, t) {
                        return new eZ({
                            check: "string_format",
                            format: "ends_with",
                            ...O(t),
                            suffix: e
                        })
                    }(...t))
                },
                min() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return this.check(tL(...t))
                },
                max() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return this.check(tB(...t))
                },
                length() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return this.check(tV(...t))
                },
                nonempty() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return this.check(tL(1, ...t))
                },
                lowercase(e) {
                    return this.check(new eO({
                        check: "string_format",
                        format: "lowercase",
                        ...O(e)
                    }))
                },
                uppercase(e) {
                    return this.check(new eE({
                        check: "string_format",
                        format: "uppercase",
                        ...O(e)
                    }))
                },
                trim() {
                    return this.check(tW(e => e.trim()))
                },
                normalize() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return this.check(function(e) {
                        return tW(t => t.normalize(e))
                    }(...t))
                },
                toLowerCase() {
                    return this.check(tW(e => e.toLowerCase()))
                },
                toUpperCase() {
                    return this.check(tW(e => e.toUpperCase()))
                },
                slugify() {
                    return this.check(tW(e => e.toLowerCase().trim().replace(/[^\w\s-]/g, "").replace(/[\s_-]+/g, "-").replace(/^-+|-+$/g, "")))
                }
            })
        }),
        nl = o("ZodString", (e, t) => {
            eI.init(e, t), ns.init(e, t), e.email = t => e.check(new np({
                type: "string",
                format: "email",
                check: "string_format",
                abort: !1,
                ...O(t)
            })), e.url = t => e.check(new nm({
                type: "string",
                format: "url",
                check: "string_format",
                abort: !1,
                ...O(t)
            })), e.jwt = t => e.check(new nZ({
                type: "string",
                format: "jwt",
                check: "string_format",
                abort: !1,
                ...O(t)
            })), e.emoji = t => e.check(new nv({
                type: "string",
                format: "emoji",
                check: "string_format",
                abort: !1,
                ...O(t)
            })), e.guid = t => e.check(tC(nf, t)), e.uuid = t => e.check(new nh({
                type: "string",
                format: "uuid",
                check: "string_format",
                abort: !1,
                ...O(t)
            })), e.uuidv4 = t => e.check(new nh({
                type: "string",
                format: "uuid",
                check: "string_format",
                abort: !1,
                version: "v4",
                ...O(t)
            })), e.uuidv6 = t => e.check(new nh({
                type: "string",
                format: "uuid",
                check: "string_format",
                abort: !1,
                version: "v6",
                ...O(t)
            })), e.uuidv7 = t => e.check(new nh({
                type: "string",
                format: "uuid",
                check: "string_format",
                abort: !1,
                version: "v7",
                ...O(t)
            })), e.nanoid = t => e.check(new ng({
                type: "string",
                format: "nanoid",
                check: "string_format",
                abort: !1,
                ...O(t)
            })), e.guid = t => e.check(tC(nf, t)), e.cuid = t => e.check(new ny({
                type: "string",
                format: "cuid",
                check: "string_format",
                abort: !1,
                ...O(t)
            })), e.cuid2 = t => e.check(new n_({
                type: "string",
                format: "cuid2",
                check: "string_format",
                abort: !1,
                ...O(t)
            })), e.ulid = t => e.check(new nz({
                type: "string",
                format: "ulid",
                check: "string_format",
                abort: !1,
                ...O(t)
            })), e.base64 = t => e.check(new nE({
                type: "string",
                format: "base64",
                check: "string_format",
                abort: !1,
                ...O(t)
            })), e.base64url = t => e.check(new nA({
                type: "string",
                format: "base64url",
                check: "string_format",
                abort: !1,
                ...O(t)
            })), e.xid = t => e.check(new nb({
                type: "string",
                format: "xid",
                check: "string_format",
                abort: !1,
                ...O(t)
            })), e.ksuid = t => e.check(new nw({
                type: "string",
                format: "ksuid",
                check: "string_format",
                abort: !1,
                ...O(t)
            })), e.ipv4 = t => e.check(new nk({
                type: "string",
                format: "ipv4",
                check: "string_format",
                abort: !1,
                ...O(t)
            })), e.ipv6 = t => e.check(new nF({
                type: "string",
                format: "ipv6",
                check: "string_format",
                abort: !1,
                ...O(t)
            })), e.cidrv4 = t => e.check(new nS({
                type: "string",
                format: "cidrv4",
                check: "string_format",
                abort: !1,
                ...O(t)
            })), e.cidrv6 = t => e.check(new nO({
                type: "string",
                format: "cidrv6",
                check: "string_format",
                abort: !1,
                ...O(t)
            })), e.e164 = t => e.check(new nx({
                type: "string",
                format: "e164",
                check: "string_format",
                abort: !1,
                ...O(t)
            })), e.datetime = t => e.check(new t1({
                type: "string",
                format: "datetime",
                check: "string_format",
                offset: !1,
                local: !1,
                precision: null,
                ...O(t)
            })), e.date = t => e.check(t6(t)), e.time = t => e.check(new t9({
                type: "string",
                format: "time",
                check: "string_format",
                precision: null,
                ...O(t)
            })), e.duration = t => e.check(new t4({
                type: "string",
                format: "duration",
                check: "string_format",
                ...O(t)
            }))
        });

    function nc(e) {
        return new nl({
            type: "string",
            ...O(e)
        })
    }
    let nd = o("ZodStringFormat", (e, t) => {
            eN.init(e, t), ns.init(e, t)
        }),
        np = o("ZodEmail", (e, t) => {
            eJ.init(e, t), nd.init(e, t)
        }),
        nf = o("ZodGUID", (e, t) => {
            eC.init(e, t), nd.init(e, t)
        }),
        nh = o("ZodUUID", (e, t) => {
            eD.init(e, t), nd.init(e, t)
        }),
        nm = o("ZodURL", (e, t) => {
            eR.init(e, t), nd.init(e, t)
        }),
        nv = o("ZodEmoji", (e, t) => {
            eU.init(e, t), nd.init(e, t)
        }),
        ng = o("ZodNanoID", (e, t) => {
            eM.init(e, t), nd.init(e, t)
        }),
        ny = o("ZodCUID", (e, t) => {
            eB.init(e, t), nd.init(e, t)
        }),
        n_ = o("ZodCUID2", (e, t) => {
            eL.init(e, t), nd.init(e, t)
        }),
        nz = o("ZodULID", (e, t) => {
            eV.init(e, t), nd.init(e, t)
        }),
        nb = o("ZodXID", (e, t) => {
            eW.init(e, t), nd.init(e, t)
        }),
        nw = o("ZodKSUID", (e, t) => {
            eK.init(e, t), nd.init(e, t)
        }),
        nk = o("ZodIPv4", (e, t) => {
            eY.init(e, t), nd.init(e, t)
        }),
        nF = o("ZodIPv6", (e, t) => {
            eQ.init(e, t), nd.init(e, t)
        }),
        nS = o("ZodCIDRv4", (e, t) => {
            e0.init(e, t), nd.init(e, t)
        }),
        nO = o("ZodCIDRv6", (e, t) => {
            e1.init(e, t), nd.init(e, t)
        }),
        nE = o("ZodBase64", (e, t) => {
            e6.init(e, t), nd.init(e, t)
        }),
        nA = o("ZodBase64URL", (e, t) => {
            e9.init(e, t), nd.init(e, t)
        }),
        nx = o("ZodE164", (e, t) => {
            e4.init(e, t), nd.init(e, t)
        }),
        nZ = o("ZodJWT", (e, t) => {
            e3.init(e, t), nd.init(e, t)
        }),
        n$ = o("ZodNumber", (e, t) => {
            var n, r, i, o, a, u, s, l, c;
            e5.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (t, n, r) => ((e, t, n) => {
                let {
                    minimum: r,
                    maximum: i,
                    format: o,
                    multipleOf: a,
                    exclusiveMaximum: u,
                    exclusiveMinimum: s
                } = e._zod.bag;
                "string" == typeof o && o.includes("int") ? n.type = "integer" : n.type = "number";
                let l = "number" == typeof s && s >= (null != r ? r : -1 / 0),
                    c = "number" == typeof u && u <= (null != i ? i : 1 / 0),
                    d = "draft-04" === t.target || "openapi-3.0" === t.target;
                l ? d ? (n.minimum = s, n.exclusiveMinimum = !0) : n.exclusiveMinimum = s : "number" == typeof r && (n.minimum = r), c ? d ? (n.maximum = u, n.exclusiveMaximum = !0) : n.exclusiveMaximum = u : "number" == typeof i && (n.maximum = i), "number" == typeof a && (n.multipleOf = a)
            })(e, t, n), na(e, "ZodNumber", {
                gt(e, t) {
                    return this.check(tR(e, t))
                },
                gte(e, t) {
                    return this.check(tU(e, t))
                },
                min(e, t) {
                    return this.check(tU(e, t))
                },
                lt(e, t) {
                    return this.check(tD(e, t))
                },
                lte(e, t) {
                    return this.check(tJ(e, t))
                },
                max(e, t) {
                    return this.check(tJ(e, t))
                },
                int(e) {
                    return this.check(nj(e))
                },
                safe(e) {
                    return this.check(nj(e))
                },
                positive(e) {
                    return this.check(tR(0, e))
                },
                nonnegative(e) {
                    return this.check(tU(0, e))
                },
                negative(e) {
                    return this.check(tD(0, e))
                },
                nonpositive(e) {
                    return this.check(tJ(0, e))
                },
                multipleOf(e, t) {
                    return this.check(tM(e, t))
                },
                step(e, t) {
                    return this.check(tM(e, t))
                },
                finite() {
                    return this
                }
            });
            let d = e._zod.bag;
            e.minValue = null != (n = Math.max(null != (r = d.minimum) ? r : -1 / 0, null != (i = d.exclusiveMinimum) ? i : -1 / 0)) ? n : null, e.maxValue = null != (o = Math.min(null != (a = d.maximum) ? a : 1 / 0, null != (u = d.exclusiveMaximum) ? u : 1 / 0)) ? o : null, e.isInt = (null != (s = d.format) ? s : "").includes("int") || Number.isSafeInteger(null != (l = d.multipleOf) ? l : .5), e.isFinite = !0, e.format = null != (c = d.format) ? c : null
        });

    function nT(e) {
        return new n$({
            type: "number",
            checks: [],
            ...O(e)
        })
    }
    let nP = o("ZodNumberFormat", (e, t) => {
        e7.init(e, t), n$.init(e, t)
    });

    function nj(e) {
        return new nP({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "safeint",
            ...O(e)
        })
    }
    let nI = o("ZodBoolean", (e, t) => {
        e8.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (e, t, n) => {
            t.type = "boolean"
        }
    });

    function nN(e) {
        return new nI({
            type: "boolean",
            ...O(e)
        })
    }
    let nC = o("ZodUnknown", (e, t) => {
        te.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (e, t, n) => void 0
    });

    function nD() {
        return new nC({
            type: "unknown"
        })
    }
    let nJ = o("ZodNever", (e, t) => {
        tt.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (e, t, n) => {
            t.not = {}
        }
    });

    function nR(e) {
        return new nJ({
            type: "never",
            ...O(e)
        })
    }
    let nU = o("ZodArray", (e, t) => {
        tr.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (t, n, r) => ((e, t, n, r) => {
            let i = e._zod.def,
                {
                    minimum: o,
                    maximum: a
                } = e._zod.bag;
            "number" == typeof o && (n.minItems = o), "number" == typeof a && (n.maxItems = a), n.type = "array", n.items = tG(i.element, t, {
                ...r,
                path: [...r.path, "items"]
            })
        })(e, t, n, r), e.element = t.element, na(e, "ZodArray", {
            min(e, t) {
                return this.check(tL(e, t))
            },
            nonempty(e) {
                return this.check(tL(1, e))
            },
            max(e, t) {
                return this.check(tB(e, t))
            },
            length(e, t) {
                return this.check(tV(e, t))
            },
            unwrap() {
                return this.element
            }
        })
    });

    function nM(e, t) {
        return new nU({
            type: "array",
            element: e,
            ...O(t)
        })
    }
    let nB = o("ZodObject", (e, t) => {
        ts.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (t, n, r) => ((e, t, n, r) => {
            var i;
            let o = e._zod.def;
            n.type = "object", n.properties = {};
            let a = o.shape;
            for (let e in a) n.properties[e] = tG(a[e], t, {
                ...r,
                path: [...r.path, "properties", e]
            });
            let u = new Set([...new Set(Object.keys(a))].filter(e => {
                let n = o.shape[e]._zod;
                return "input" === t.io ? void 0 === n.optin : void 0 === n.optout
            }));
            u.size > 0 && (n.required = Array.from(u)), (null == (i = o.catchall) ? void 0 : i._zod.def.type) === "never" ? n.additionalProperties = !1 : o.catchall ? o.catchall && (n.additionalProperties = tG(o.catchall, t, {
                ...r,
                path: [...r.path, "additionalProperties"]
            })) : "output" === t.io && (n.additionalProperties = !1)
        })(e, t, n, r), h(e, "shape", () => t.shape), na(e, "ZodObject", {
            keyof() {
                var e;
                return new nQ({
                    type: "enum",
                    entries: Array.isArray(e = Object.keys(this._zod.def.shape)) ? Object.fromEntries(e.map(e => [e, e])) : e,
                    ...O(void 0)
                })
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
                    catchall: nD()
                })
            },
            loose() {
                return this.clone({
                    ...this._zod.def,
                    catchall: nD()
                })
            },
            strict() {
                return this.clone({
                    ...this._zod.def,
                    catchall: nR()
                })
            },
            strip() {
                return this.clone({
                    ...this._zod.def,
                    catchall: void 0
                })
            },
            extend(e) {
                return function(e, t) {
                    if (!b(t)) throw Error("Invalid input to extend: expected a plain object");
                    let n = e._zod.def.checks;
                    if (n && n.length > 0) {
                        let n = e._zod.def.shape;
                        for (let e in t)
                            if (void 0 !== Object.getOwnPropertyDescriptor(n, e)) throw Error("Cannot overwrite keys on object schemas containing refinements. Use `.safeExtend()` instead.")
                    }
                    let r = v(e._zod.def, {
                        get shape() {
                            let n = {
                                ...e._zod.def.shape,
                                ...t
                            };
                            return m(this, "shape", n), n
                        }
                    });
                    return S(e, r)
                }(this, e)
            },
            safeExtend(e) {
                var t = this;
                if (!b(e)) throw Error("Invalid input to safeExtend: expected a plain object");
                let n = v(t._zod.def, {
                    get shape() {
                        let n = {
                            ...t._zod.def.shape,
                            ...e
                        };
                        return m(this, "shape", n), n
                    }
                });
                return S(t, n)
            },
            merge(e) {
                var t, n, r = this;
                if (null == (n = r._zod.def.checks) ? void 0 : n.length) throw Error(".merge() cannot be used on object schemas containing refinements. Use .safeExtend() instead.");
                let i = v(r._zod.def, {
                    get shape() {
                        let t = {
                            ...r._zod.def.shape,
                            ...e._zod.def.shape
                        };
                        return m(this, "shape", t), t
                    },
                    get catchall() {
                        return e._zod.def.catchall
                    },
                    checks: null != (t = e._zod.def.checks) ? t : []
                });
                return S(r, i)
            },
            pick(e) {
                return function(e, t) {
                    let n = e._zod.def,
                        r = n.checks;
                    if (r && r.length > 0) throw Error(".pick() cannot be used on object schemas containing refinements");
                    let i = v(e._zod.def, {
                        get shape() {
                            let e = {};
                            for (let r in t) {
                                if (!(r in n.shape)) throw Error('Unrecognized key: "'.concat(r, '"'));
                                t[r] && (e[r] = n.shape[r])
                            }
                            return m(this, "shape", e), e
                        },
                        checks: []
                    });
                    return S(e, i)
                }(this, e)
            },
            omit(e) {
                return function(e, t) {
                    let n = e._zod.def,
                        r = n.checks;
                    if (r && r.length > 0) throw Error(".omit() cannot be used on object schemas containing refinements");
                    let i = v(e._zod.def, {
                        get shape() {
                            let r = {
                                ...e._zod.def.shape
                            };
                            for (let e in t) {
                                if (!(e in n.shape)) throw Error('Unrecognized key: "'.concat(e, '"'));
                                t[e] && delete r[e]
                            }
                            return m(this, "shape", r), r
                        },
                        checks: []
                    });
                    return S(e, i)
                }(this, e)
            },
            partial() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e, t, n) {
                    let r = t._zod.def.checks;
                    if (r && r.length > 0) throw Error(".partial() cannot be used on object schemas containing refinements");
                    let i = v(t._zod.def, {
                        get shape() {
                            let r = t._zod.def.shape,
                                i = {
                                    ...r
                                };
                            if (n)
                                for (let t in n) {
                                    if (!(t in r)) throw Error('Unrecognized key: "'.concat(t, '"'));
                                    n[t] && (i[t] = e ? new e({
                                        type: "optional",
                                        innerType: r[t]
                                    }) : r[t])
                                } else
                                    for (let t in r) i[t] = e ? new e({
                                        type: "optional",
                                        innerType: r[t]
                                    }) : r[t];
                            return m(this, "shape", i), i
                        },
                        checks: []
                    });
                    return S(t, i)
                }(n6, this, t[0])
            },
            required() {
                let e;
                for (var t, n, r = arguments.length, i = Array(r), o = 0; o < r; o++) i[o] = arguments[o];
                return t = this, n = i[0], e = v(t._zod.def, {
                    get shape() {
                        let e = t._zod.def.shape,
                            r = {
                                ...e
                            };
                        if (n)
                            for (let t in n) {
                                if (!(t in r)) throw Error('Unrecognized key: "'.concat(t, '"'));
                                n[t] && (r[t] = new re({
                                    type: "nonoptional",
                                    innerType: e[t]
                                }))
                            } else
                                for (let t in e) r[t] = new re({
                                    type: "nonoptional",
                                    innerType: e[t]
                                });
                        return m(this, "shape", r), r
                    }
                }), S(t, e)
            }
        })
    });

    function nL(e, t) {
        return new nB({
            type: "object",
            shape: null != e ? e : {},
            ...O(t)
        })
    }

    function nV(e, t) {
        return new nB({
            type: "object",
            shape: e,
            catchall: nR(),
            ...O(t)
        })
    }
    let nW = o("ZodUnion", (e, t) => {
        tc.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (t, n, r) => tQ(e, t, n, r), e.options = t.options
    });

    function nK(e, t) {
        return new nW({
            type: "union",
            options: e,
            ...O(t)
        })
    }
    let nG = o("ZodXor", (e, t) => {
            nW.init(e, t), tp.init(e, t), e._zod.processJSONSchema = (t, n, r) => tQ(e, t, n, r), e.options = t.options
        }),
        nX = o("ZodDiscriminatedUnion", (e, t) => {
            nW.init(e, t), tf.init(e, t)
        }),
        nq = o("ZodIntersection", (e, t) => {
            th.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (t, n, r) => {
                let i, o, a, u;
                return o = tG((i = e._zod.def).left, t, {
                    ...r,
                    path: [...r.path, "allOf", 0]
                }), a = tG(i.right, t, {
                    ...r,
                    path: [...r.path, "allOf", 1]
                }), void(n.allOf = [...(u = e => "allOf" in e && 1 === Object.keys(e).length)(o) ? o.allOf : [o], ...u(a) ? a.allOf : [a]])
            }
        }),
        nH = o("ZodRecord", (e, t) => {
            tv.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (t, n, r) => ((e, t, n, r) => {
                let i = e._zod.def;
                n.type = "object";
                let o = i.keyType,
                    a = o._zod.bag,
                    u = null == a ? void 0 : a.patterns;
                if ("loose" === i.mode && u && u.size > 0) {
                    let e = tG(i.valueType, t, {
                        ...r,
                        path: [...r.path, "patternProperties", "*"]
                    });
                    for (let t of (n.patternProperties = {}, u)) n.patternProperties[t.source] = e
                } else("draft-07" === t.target || "draft-2020-12" === t.target) && (n.propertyNames = tG(i.keyType, t, {
                    ...r,
                    path: [...r.path, "propertyNames"]
                })), n.additionalProperties = tG(i.valueType, t, {
                    ...r,
                    path: [...r.path, "additionalProperties"]
                });
                let s = o._zod.values;
                if (s) {
                    let e = [...s].filter(e => "string" == typeof e || "number" == typeof e);
                    e.length > 0 && (n.required = e)
                }
            })(e, t, n, r), e.keyType = t.keyType, e.valueType = t.valueType
        });

    function nY(e, t, n) {
        return new nH(t && t._zod ? {
            type: "record",
            keyType: e,
            valueType: t,
            ...O(n)
        } : {
            type: "record",
            keyType: nc(),
            valueType: e,
            ...O(t)
        })
    }
    let nQ = o("ZodEnum", (e, t) => {
            tg.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (t, n, r) => {
                let i;
                (i = l(e._zod.def.entries)).every(e => "number" == typeof e) && (n.type = "number"), i.every(e => "string" == typeof e) && (n.type = "string"), n.enum = i
            }, e.enum = t.entries, e.options = Object.values(t.entries);
            let n = new Set(Object.keys(t.entries));
            e.extract = (e, r) => {
                let i = {};
                for (let r of e)
                    if (n.has(r)) i[r] = t.entries[r];
                    else throw Error("Key ".concat(r, " not found in enum"));
                return new nQ({
                    ...t,
                    checks: [],
                    ...O(r),
                    entries: i
                })
            }, e.exclude = (e, r) => {
                let i = {
                    ...t.entries
                };
                for (let t of e)
                    if (n.has(t)) delete i[t];
                    else throw Error("Key ".concat(t, " not found in enum"));
                return new nQ({
                    ...t,
                    checks: [],
                    ...O(r),
                    entries: i
                })
            }
        }),
        n0 = o("ZodLiteral", (e, t) => {
            ty.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (t, n, r) => ((e, t, n) => {
                let r = e._zod.def,
                    i = [];
                for (let e of r.values)
                    if (void 0 === e) {
                        if ("throw" === t.unrepresentable) throw Error("Literal `undefined` cannot be represented in JSON Schema")
                    } else if ("bigint" == typeof e)
                    if ("throw" === t.unrepresentable) throw Error("BigInt literals cannot be represented in JSON Schema");
                    else i.push(Number(e));
                else i.push(e);
                if (0 === i.length);
                else if (1 === i.length) {
                    let e = i[0];
                    n.type = null === e ? "null" : typeof e, "draft-04" === t.target || "openapi-3.0" === t.target ? n.enum = [e] : n.const = e
                } else i.every(e => "number" == typeof e) && (n.type = "number"), i.every(e => "string" == typeof e) && (n.type = "string"), i.every(e => "boolean" == typeof e) && (n.type = "boolean"), i.every(e => null === e) && (n.type = "null"), n.enum = i
            })(e, t, n), e.values = new Set(t.values), Object.defineProperty(e, "value", {
                get() {
                    if (t.values.length > 1) throw Error("This schema contains multiple valid literal values. Use `.values` instead.");
                    return t.values[0]
                }
            })
        });

    function n1(e, t) {
        return new n0({
            type: "literal",
            values: Array.isArray(e) ? e : [e],
            ...O(t)
        })
    }
    let n2 = o("ZodTransform", (e, t) => {
            t_.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (e, t, n) => (e => {
                if ("throw" === e.unrepresentable) throw Error("Transforms cannot be represented in JSON Schema")
            })(e), e._zod.parse = (n, r) => {
                if ("backward" === r.direction) throw new u(e.constructor.name);
                n.addIssue = r => {
                    "string" == typeof r ? n.issues.push(P(r, n.value, t)) : (r.fatal && (r.continue = !1), null != r.code || (r.code = "custom"), null != r.input || (r.input = n.value), null != r.inst || (r.inst = e), n.issues.push(P(r)))
                };
                let i = t.transform(n.value, n);
                return i instanceof Promise ? i.then(e => (n.value = e, n.fallback = !0, n)) : (n.value = i, n.fallback = !0, n)
            }
        }),
        n6 = o("ZodOptional", (e, t) => {
            tb.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (t, n, r) => t0(e, t, n, r), e.unwrap = () => e._zod.def.innerType
        });

    function n9(e) {
        return new n6({
            type: "optional",
            innerType: e
        })
    }
    let n4 = o("ZodExactOptional", (e, t) => {
            tw.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (t, n, r) => t0(e, t, n, r), e.unwrap = () => e._zod.def.innerType
        }),
        n3 = o("ZodNullable", (e, t) => {
            tk.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (t, n, r) => {
                let i, o, a;
                return o = tG((i = e._zod.def).innerType, t, r), a = t.seen.get(e), void("openapi-3.0" === t.target ? (a.ref = i.innerType, n.nullable = !0) : n.anyOf = [o, {
                    type: "null"
                }])
            }, e.unwrap = () => e._zod.def.innerType
        });

    function n5(e) {
        return new n3({
            type: "nullable",
            innerType: e
        })
    }
    let n7 = o("ZodDefault", (e, t) => {
            tF.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (t, n, r) => {
                let i;
                tG((i = e._zod.def).innerType, t, r), t.seen.get(e).ref = i.innerType, n.default = JSON.parse(JSON.stringify(i.defaultValue))
            }, e.unwrap = () => e._zod.def.innerType, e.removeDefault = e.unwrap
        }),
        n8 = o("ZodPrefault", (e, t) => {
            tO.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (t, n, r) => {
                let i;
                tG((i = e._zod.def).innerType, t, r), t.seen.get(e).ref = i.innerType, "input" === t.io && (n._prefault = JSON.parse(JSON.stringify(i.defaultValue)))
            }, e.unwrap = () => e._zod.def.innerType
        }),
        re = o("ZodNonOptional", (e, t) => {
            tE.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (t, n, r) => {
                let i;
                tG((i = e._zod.def).innerType, t, r), t.seen.get(e).ref = i.innerType
            }, e.unwrap = () => e._zod.def.innerType
        }),
        rt = o("ZodCatch", (e, t) => {
            tx.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (t, n, r) => ((e, t, n, r) => {
                let i, o = e._zod.def;
                tG(o.innerType, t, r), t.seen.get(e).ref = o.innerType;
                try {
                    i = o.catchValue(void 0)
                } catch (e) {
                    throw Error("Dynamic catch values are not supported in JSON Schema")
                }
                n.default = i
            })(e, t, n, r), e.unwrap = () => e._zod.def.innerType, e.removeCatch = e.unwrap
        }),
        rn = o("ZodPipe", (e, t) => {
            tZ.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (t, n, r) => {
                let i, o, a;
                return o = (i = e._zod.def).in._zod.traits.has("$ZodTransform"), void(tG(a = "input" === t.io ? o ? i.out : i.in : i.out, t, r), t.seen.get(e).ref = a)
            }, e.in = t.in, e.out = t.out
        });

    function rr(e, t) {
        return new rn({
            type: "pipe",
            in: e,
            out: t
        })
    }
    let ri = o("ZodReadonly", (e, t) => {
            tT.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (t, n, r) => {
                let i;
                tG((i = e._zod.def).innerType, t, r), t.seen.get(e).ref = i.innerType, n.readOnly = !0
            }, e.unwrap = () => e._zod.def.innerType
        }),
        ro = o("ZodCustom", (e, t) => {
            tj.init(e, t), nu.init(e, t), e._zod.processJSONSchema = (e, t, n) => (e => {
                if ("throw" === e.unrepresentable) throw Error("Custom types cannot be represented in JSON Schema")
            })(e)
        });

    function ra(e) {
        return nL({
            dev: e.optional(),
            staging: e.optional(),
            prod: e.optional()
        })
    }
    let ru = {
            userId: ra(nM(nT())).optional(),
            roleSet: ra(nM(nc())).optional()
        },
        rs = ra(nM(nT())),
        rl = nL({
            description: nc(),
            creationDate: t6()
        }),
        rc = new nG({
            type: "union",
            options: [nV({
                ...ru,
                universeId: rs
            }), nV({
                ...ru,
                groupId: rs
            }), nV({
                ...ru
            })],
            inclusive: !1,
            ...O(void 0)
        }),
        rd = nL({
            name: nc(),
            metadata: rl,
            filters: rc.optional()
        }),
        rp = new nX({
            type: "union",
            options: [rd.extend({
                type: n1("boolean"),
                defaultValue: nN(),
                value: ra(nN()).optional()
            }), rd.extend({
                type: n1("number"),
                defaultValue: nT(),
                value: ra(nT()).optional()
            }), rd.extend({
                type: n1("string"),
                defaultValue: nc(),
                value: ra(nc()).optional()
            })],
            discriminator: "type",
            ...O(void 0)
        }),
        rf = nK([nN(), nT(), nc()]),
        rh = nL({
            applicationId: nc(),
            namespace: nc()
        });
    nL({
        $schema: nc().optional(),
        name: nc(),
        owner: nc(),
        slack: nc(),
        slackNotificationChannel: nc().optional(),
        flags: nM(rp)
    });
    let rm = rh.extend({
            flags: nY(nc(), rf)
        }),
        rv = nK([nL({
            universeId: nY(nc(), rf)
        }), nL({
            groupId: nY(nc(), rf)
        })]).transform(e => {
            let [t] = "universeId" in e ? Object.values(e.universeId) : Object.values(e.groupId);
            return t
        }).pipe(rf),
        rg = rh.extend({
            flags: nY(nc(), nK([rf, rv]))
        }),
        ry = nL({
            isOverrideAllowed: nN(),
            override: nM(nL({
                namespace: nc(),
                flags: nY(nc(), rf)
            })).optional()
        }),
        r_ = "flag-overrides",
        rz = null,
        rb = !1;

    function rw(e) {
        if (null === e) throw Error("@rbx/flags: needs to be initialized first!")
    }
    async function rk() {
        t = void 0;
        try {
            let e = (rw(rz), rz),
                n = new URL("/barista-feature-flags/v1/override-status", e.baseUrl),
                r = new URLSearchParams(window.location.search).get(r_);
            r && n.searchParams.set(r_, r);
            let i = await fetch(n, {
                credentials: "include"
            });
            if (!i.ok) return !1;
            let o = await i.json().then(e => ry.parseAsync(e));
            return t = o.override, o.isOverrideAllowed
        } catch (e) {
            return !1
        }
    }
    async function rF(e) {
        return t = void 0, !!("authorize" in e && await e.authorize().catch(() => !1) || e.useDefault && await rk()) && (rb = !0, (0, i.r)(t), !0)
    }
    async function rS(e) {
        if (rw(rz), "development" === e.mode) throw Error("@rbx/flags: development overrides are enabled in a production build — is this intentional? Use 'authorized-only' mode with an authorize function for production.");
        if ("authorized-only" === e.mode) try {
            return await rF(e)
        } catch (e) {}
        return !1
    }
    let rO = new Map,
        rE = new Map;
    async function rA(e, t, n) {
        var r;
        let i = (rw(rz), rz),
            [o, a] = void 0 !== n && null != (r = Object.entries(n).pop()) ? r : [],
            u = void 0 !== o && void 0 !== a ? "".concat(e, ":").concat(o, ":").concat(a.toString()) : e,
            s = rO.get(u);
        if (void 0 === s) {
            let t = rE.get(u);
            if (void 0 === t) {
                let n = new URL("/barista-feature-flags/v1/applications/".concat(i.applicationId, "/namespaces/").concat(e, "/flags"), i.baseUrl);
                void 0 !== o && void 0 !== a && n.searchParams.set(o, a.toString()), t = fetch(n, {
                    method: "GET",
                    headers: {
                        Accept: "application/json"
                    },
                    credentials: "include"
                }).then(async t => {
                    if (!t.ok) throw Error("@rbx/flags: failed to fetch namespace ".concat(e));
                    let n = void 0 !== o ? rg : rm,
                        r = await t.json().then(e => n.parseAsync(e));
                    if (r.applicationId !== i.applicationId || r.namespace !== e) throw Error("@rbx/flags: mismatched response for ".concat(e));
                    return rO.set(u, r.flags), r.flags
                }).finally(() => {
                    rE.delete(u)
                }), rE.set(u, t)
            }
            s = await t
        }
        if (!(t in s)) throw Error("@rbx/flags: flag ".concat(e, "/").concat(t, " does not exist"));
        return s[t]
    }
    e.s(["defineFlag", 0, function(e) {
        let {
            namespace: t,
            name: n,
            defaultValue: r
        } = e, o, a, u = null;
        return e => {
            var s;
            let l = rb ? (0, i.g)(t, n) : void 0,
                c = e ? Object.values(e).pop() : void 0;
            return null !== u && l === o && c === a ? u : (o = l, a = c, u = null != (s = typeof l == typeof r ? Promise.resolve(l) : void 0 === c || c > 0 ? null : Promise.resolve(r)) ? s : rA(t, n, e).catch(() => r))
        }
    }, "initFlags", 0, function(e) {
        let {
            baseUrl: t,
            applicationId: n
        } = e;
        if (null !== rz) throw Error("@rbx/flags: config has already been initialized!");
        if (!URL.canParse(t)) throw Error("@rbx/flags: base URL is invalid!");
        return rz = {
            baseUrl: t,
            applicationId: n
        }, {
            enableOverrides: rS
        }
    }], 157700)
}]);

//# debugId=d259cb05-575c-eec3-361d-f36eddb217df
//# sourceMappingURL=3mrbkg049kkbb.js.map