! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "d1874a4ba39db3ec53b67feae6486d7a2d8fc69d"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "43a8e33e-6bb3-4894-92e2-ed59a94da2b6", e._sentryDebugIdIdentifier = "sentry-dbid-43a8e33e-6bb3-4894-92e2-ed59a94da2b6")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e, t, r, n, i, o, u, a, l, s, c, f, d, v, p = {},
        y = {};

    function h(e) {
        var t = y[e];
        if (void 0 !== t) return t.exports;
        var r = y[e] = {
            exports: {}
        };
        return p[e](r, r.exports, h), r.exports
    }

    function b(e, t, r, n, i, o, u) {
        try {
            var a = e[o](u),
                l = a.value
        } catch (e) {
            r(e);
            return
        }
        a.done ? t(l) : Promise.resolve(l).then(n, i)
    }

    function m(e) {
        return function() {
            var t = this,
                r = arguments;
            return new Promise(function(n, i) {
                var o = e.apply(t, r);

                function u(e) {
                    b(o, n, i, u, a, "next", e)
                }

                function a(e) {
                    b(o, n, i, u, a, "throw", e)
                }
                u(void 0)
            })
        }
    }

    function w(e, t) {
        var r, n, i, o = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
            a = Object.defineProperty;
        return a(u, "next", {
            value: l(0)
        }), a(u, "throw", {
            value: l(1)
        }), a(u, "return", {
            value: l(2)
        }), "function" == typeof Symbol && a(u, Symbol.iterator, {
            value: function() {
                return this
            }
        }), u;

        function l(a) {
            return function(l) {
                var s = [a, l];
                if (r) throw TypeError("Generator is already executing.");
                for (; u && (u = 0, s[0] && (o = 0)), o;) try {
                    if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                    switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                        case 0:
                        case 1:
                            i = s;
                            break;
                        case 4:
                            return o.label++, {
                                value: s[1],
                                done: !1
                            };
                        case 5:
                            o.label++, n = s[1], s = [0];
                            continue;
                        case 7:
                            s = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                o.label = s[1];
                                break
                            }
                            if (6 === s[0] && o.label < i[1]) {
                                o.label = i[1], i = s;
                                break
                            }
                            if (i && o.label < i[2]) {
                                o.label = i[2], o.ops.push(s);
                                break
                            }
                            i[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    s = t.call(e, o)
                } catch (e) {
                    s = [6, e], n = 0
                } finally {
                    r = i = 0
                }
                if (5 & s[0]) throw s[1];
                return {
                    value: s[0] ? s[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function g(e) {
        return (g = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
            return e.__proto__ || Object.getPrototypeOf(e)
        })(e)
    }

    function _() {
        try {
            var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
        } catch (e) {}
        return (_ = function() {
            return !!e
        })()
    }

    function O(e) {
        return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
    }

    function S(e, t, r) {
        t = g(t);
        var n = _() ? Reflect.construct(t, r || [], g(e).constructor) : t.apply(e, r);
        if (n && ("object" === O(n) || "function" == typeof n)) return n;
        if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
        return e
    }

    function z(e, t) {
        return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
    }

    function P(e, t) {
        if (!z(e, t)) throw TypeError("Cannot call a class as a function")
    }

    function j(e, t) {
        return (j = Object.setPrototypeOf || function(e, t) {
            return e.__proto__ = t, e
        })(e, t)
    }

    function k(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
        e.prototype = Object.create(t && t.prototype, {
            constructor: {
                value: e,
                writable: !0,
                configurable: !0
            }
        }), t && j(e, t)
    }

    function x(e, t, r) {
        return (x = _() ? Reflect.construct : function(e, t, r) {
            var n = [null];
            n.push.apply(n, t);
            var i = new(Function.bind.apply(e, n));
            return r && j(i, r.prototype), i
        }).apply(null, arguments)
    }

    function E(e) {
        var t = "function" == typeof Map ? new Map : void 0;
        return (E = function(e) {
            if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
            if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
            if (void 0 !== t) {
                if (t.has(e)) return t.get(e);
                t.set(e, r)
            }

            function r() {
                return x(e, arguments, g(this).constructor)
            }
            return r.prototype = Object.create(e.prototype, {
                constructor: {
                    value: r,
                    enumerable: !1,
                    writable: !0,
                    configurable: !0
                }
            }), j(r, e)
        })(e)
    }

    function T(e, t, r) {
        function n(r, n) {
            var i, o;
            for (var a in Object.defineProperty(r, "_zod", {
                    value: null != (i = r._zod) ? i : {},
                    enumerable: !1
                }), null != (o = r._zod).traits || (o.traits = new Set), r._zod.traits.add(e), t(r, n), u.prototype) a in r || Object.defineProperty(r, a, {
                value: u.prototype[a].bind(r)
            });
            r._zod.constr = u, r._zod.def = n
        }
        var i, o = function(e) {
            function t() {
                return P(this, t), S(this, t, arguments)
            }
            return k(t, e), t
        }(null != (i = null == r ? void 0 : r.Parent) ? i : Object);

        function u(e) {
            var t = (null == r ? void 0 : r.Parent) ? new o : this;
            n(t, e), null != (s = t._zod).deferred || (s.deferred = []);
            var i = !0,
                u = !1,
                a = void 0;
            try {
                for (var l, s, c, f = t._zod.deferred[Symbol.iterator](); !(i = (c = f.next()).done); i = !0)(0, c.value)()
            } catch (e) {
                u = !0, a = e
            } finally {
                try {
                    i || null == f.return || f.return()
                } finally {
                    if (u) throw a
                }
            }
            return t
        }
        return Object.defineProperty(o, "name", {
            value: e
        }), Object.defineProperty(u, "init", {
            value: n
        }), Object.defineProperty(u, Symbol.hasInstance, {
            value: function(t) {
                var n, i;
                return !!((null == r ? void 0 : r.Parent) && z(t, r.Parent)) || (null == t || null == (i = t._zod) || null == (n = i.traits) ? void 0 : n.has(e))
            }
        }), Object.defineProperty(u, "name", {
            value: e
        }), u
    }
    h.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return h.d(t, {
            a: t
        }), t
    }, h.d = function(e, t) {
        for (var r in t) h.o(t, r) && !h.o(e, r) && Object.defineProperty(e, r, {
            enumerable: !0,
            get: t[r]
        })
    }, h.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, h.rv = function() {
        return "1.7.12"
    }, h.ruid = "bundler=rspack@1.7.12", Object.freeze({
        status: "aborted"
    }), Symbol("zod_brand");
    var B = function(e) {
        function t() {
            return P(this, t), S(this, t, ["Encountered Promise during synchronous parse. Use .parseAsync() instead."])
        }
        return k(t, e), t
    }(E(Error));
    E(Error);
    var I = {};

    function N(e) {
        return e && Object.assign(I, e), I
    }

    function A(e, t, r) {
        return t in e ? Object.defineProperty(e, t, {
            value: r,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = r, e
    }

    function V(e) {
        for (var t = 1; t < arguments.length; t++) {
            var r = null != arguments[t] ? arguments[t] : {},
                n = Object.keys(r);
            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                return Object.getOwnPropertyDescriptor(r, e).enumerable
            }))), n.forEach(function(t) {
                A(e, t, r[t])
            })
        }
        return e
    }

    function M(e, t) {
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

    function Z(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function D(e, t) {
        if (e) {
            if ("string" == typeof e) return Z(e, t);
            var r = Object.prototype.toString.call(e).slice(8, -1);
            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return Z(e, t)
        }
    }

    function R(e) {
        return function(e) {
            if (Array.isArray(e)) return Z(e)
        }(e) || function(e) {
            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
        }(e) || D(e) || function() {
            throw TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function $(e, t) {
        return (void 0 === t ? "undefined" : O(t)) === "bigint" ? t.toString() : t
    }

    function C(e) {
        return {
            get value() {
                var t = e();
                return Object.defineProperty(this, "value", {
                    value: t
                }), t
            }
        }
    }
    var U = Symbol("evaluating");

    function L(e, t, r) {
        var n = void 0;
        Object.defineProperty(e, t, {
            get: function() {
                if (n !== U) return void 0 === n && (n = U, n = r()), n
            },
            set: function(r) {
                Object.defineProperty(e, t, {
                    value: r
                })
            },
            configurable: !0
        })
    }
    var F = "captureStackTrace" in Error ? Error.captureStackTrace : function() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r]
    };

    function G(e) {
        if (!e) return {};
        if ("string" == typeof e) return {
            error: function() {
                return e
            }
        };
        if ((null == e ? void 0 : e.message) !== void 0) {
            if ((null == e ? void 0 : e.error) !== void 0) throw Error("Cannot specify both `message` and `error` params");
            e.error = e.message
        }
        return (delete e.message, "string" == typeof e.error) ? M(V({}, e), {
            error: function() {
                return e.error
            }
        }) : e
    }

    function H(e) {
        var t, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
        if (!0 === e.aborted) return !0;
        for (var n = r; n < e.issues.length; n++)
            if ((null == (t = e.issues[n]) ? void 0 : t.continue) !== !0) return !0;
        return !1
    }

    function W(e) {
        return "string" == typeof e ? e : null == e ? void 0 : e.message
    }

    function q(e, t, r) {
        var n, i, o, u, a, l, s, c, f, d, v, p = M(V({}, e), {
            path: null != (n = e.path) ? n : []
        });
        return e.message || (p.message = null != (i = null != (o = null != (u = null != (a = W(null == (c = e.inst) || null == (s = c._zod.def) || null == (l = s.error) ? void 0 : l.call(s, e))) ? a : W(null == t || null == (f = t.error) ? void 0 : f.call(t, e))) ? u : W(null == (d = r.customError) ? void 0 : d.call(r, e))) ? o : W(null == (v = r.localeError) ? void 0 : v.call(r, e))) ? i : "Invalid input"), delete p.inst, delete p.continue, (null == t ? void 0 : t.reportInput) || delete p.input, p
    }
    C(function() {
        var e, t;
        if ("u" > typeof navigator && (null == (t = navigator) || null == (e = t.userAgent) ? void 0 : e.includes("Cloudflare"))) return !1;
        try {
            return Function(""), !0
        } catch (e) {
            return !1
        }
    });
    var K = function(e, t) {
            e.name = "$ZodError", Object.defineProperty(e, "_zod", {
                value: e._zod,
                enumerable: !1
            }), Object.defineProperty(e, "issues", {
                value: t,
                enumerable: !1
            }), e.message = JSON.stringify(t, $, 2), Object.defineProperty(e, "toString", {
                value: function() {
                    return e.message
                },
                enumerable: !1
            })
        },
        J = T("$ZodError", K),
        X = T("$ZodError", K, {
            Parent: Error
        }),
        Y = (e = X, function(t, r, n, i) {
            var o = n ? Object.assign(n, {
                    async: !1
                }) : {
                    async: !1
                },
                u = t._zod.run({
                    value: r,
                    issues: []
                }, o);
            if (z(u, Promise)) throw new B;
            if (u.issues.length) {
                var a, l = new(null != (a = null == i ? void 0 : i.Err) ? a : e)(u.issues.map(function(e) {
                    return q(e, o, N())
                }));
                throw F(l, null == i ? void 0 : i.callee), l
            }
            return u.value
        }),
        Q = (t = X, function(e, r, n, i) {
            return m(function() {
                var o, u, a, l;
                return w(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (o = n ? Object.assign(n, {
                                    async: !0
                                }) : {
                                    async: !0
                                }, !z(u = e._zod.run({
                                    value: r,
                                    issues: []
                                }, o), Promise)) return [3, 2];
                            return [4, u];
                        case 1:
                            u = s.sent(), s.label = 2;
                        case 2:
                            if (u.issues.length) throw F(l = new(null != (a = null == i ? void 0 : i.Err) ? a : t)(u.issues.map(function(e) {
                                return q(e, o, N())
                            })), null == i ? void 0 : i.callee), l;
                            return [2, u.value]
                    }
                })
            })()
        }),
        ee = (r = X, function(e, t, n) {
            var i = n ? M(V({}, n), {
                    async: !1
                }) : {
                    async: !1
                },
                o = e._zod.run({
                    value: t,
                    issues: []
                }, i);
            if (z(o, Promise)) throw new B;
            return o.issues.length ? {
                success: !1,
                error: new(null != r ? r : J)(o.issues.map(function(e) {
                    return q(e, i, N())
                }))
            } : {
                success: !0,
                data: o.value
            }
        }),
        et = (n = X, function(e, t, r) {
            return m(function() {
                var i, o;
                return w(this, function(u) {
                    switch (u.label) {
                        case 0:
                            if (i = r ? Object.assign(r, {
                                    async: !0
                                }) : {
                                    async: !0
                                }, !z(o = e._zod.run({
                                    value: t,
                                    issues: []
                                }, i), Promise)) return [3, 2];
                            return [4, o];
                        case 1:
                            o = u.sent(), u.label = 2;
                        case 2:
                            return [2, o.issues.length ? {
                                success: !1,
                                error: new n(o.issues.map(function(e) {
                                    return q(e, i, N())
                                }))
                            } : {
                                success: !0,
                                data: o.value
                            }]
                    }
                })
            })()
        });
    RegExp('^[^\\s@"]{1,64}@[^\\s@]{1,255}$', "u");
    var er = /^-?\d+(?:\.\d+)?/,
        en = /^(?:true|false)$/i,
        ei = {
            major: 4,
            minor: 1,
            patch: 11
        },
        eo = T("$ZodType", function(e, t) {
            null != e || (e = {}), e._zod.def = t, e._zod.bag = e._zod.bag || {}, e._zod.version = ei;
            var r, n = R(null != (a = e._zod.def.checks) ? a : []);
            e._zod.traits.has("$ZodCheck") && n.unshift(e);
            var i = !0,
                o = !1,
                u = void 0;
            try {
                for (var a, l, s, c = n[Symbol.iterator](); !(i = (s = c.next()).done); i = !0) {
                    var f = s.value,
                        d = !0,
                        v = !1,
                        p = void 0;
                    try {
                        for (var y, h = f._zod.onattach[Symbol.iterator](); !(d = (y = h.next()).done); d = !0)(0, y.value)(e)
                    } catch (e) {
                        v = !0, p = e
                    } finally {
                        try {
                            d || null == h.return || h.return()
                        } finally {
                            if (v) throw p
                        }
                    }
                }
            } catch (e) {
                o = !0, u = e
            } finally {
                try {
                    i || null == c.return || c.return()
                } finally {
                    if (o) throw u
                }
            }
            if (0 === n.length) null != (l = e._zod).deferred || (l.deferred = []), null == (r = e._zod.deferred) || r.push(function() {
                e._zod.run = e._zod.parse
            });
            else {
                var b = function(e, t, r) {
                        var n = H(e),
                            i = !0,
                            o = !1,
                            u = void 0;
                        try {
                            for (var a, l, s = t[Symbol.iterator](); !(i = (l = s.next()).done); i = !0) ! function() {
                                var t = l.value;
                                if (t._zod.def.when) {
                                    if (!t._zod.def.when(e)) return
                                } else if (n) return;
                                var i = e.issues.length,
                                    o = t._zod.check(e);
                                if (z(o, Promise) && (null == r ? void 0 : r.async) === !1) throw new B;
                                if (a || z(o, Promise)) a = (null != a ? a : Promise.resolve()).then(function() {
                                    return m(function() {
                                        return w(this, function(t) {
                                            switch (t.label) {
                                                case 0:
                                                    return [4, o];
                                                case 1:
                                                    if (t.sent(), e.issues.length === i) return [2];
                                                    return n || (n = H(e, i)), [2]
                                            }
                                        })
                                    })()
                                });
                                else {
                                    if (e.issues.length === i) return;
                                    n || (n = H(e, i))
                                }
                            }()
                        } catch (e) {
                            o = !0, u = e
                        } finally {
                            try {
                                i || null == s.return || s.return()
                            } finally {
                                if (o) throw u
                            }
                        }
                        return a ? a.then(function() {
                            return e
                        }) : e
                    },
                    g = function(t, r, i) {
                        if (H(t)) return t.aborted = !0, t;
                        var o = b(r, n, i);
                        if (z(o, Promise)) {
                            if (!1 === i.async) throw new B;
                            return o.then(function(t) {
                                return e._zod.parse(t, i)
                            })
                        }
                        return e._zod.parse(o, i)
                    };
                e._zod.run = function(t, r) {
                    if (r.skipChecks) return e._zod.parse(t, r);
                    if ("backward" === r.direction) {
                        var i = e._zod.parse({
                            value: t.value,
                            issues: []
                        }, M(V({}, r), {
                            skipChecks: !0
                        }));
                        return z(i, Promise) ? i.then(function(e) {
                            return g(e, t, r)
                        }) : g(i, t, r)
                    }
                    var o = e._zod.parse(t, r);
                    if (z(o, Promise)) {
                        if (!1 === r.async) throw new B;
                        return o.then(function(e) {
                            return b(e, n, r)
                        })
                    }
                    return b(o, n, r)
                }
            }
            e["~standard"] = {
                validate: function(t) {
                    try {
                        var r, n = ee(e, t);
                        return n.success ? {
                            value: n.data
                        } : {
                            issues: null == (r = n.error) ? void 0 : r.issues
                        }
                    } catch (r) {
                        return et(e, t).then(function(e) {
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
            }
        }),
        eu = T("$ZodNumber", function(e, t) {
            var r;
            eo.init(e, t), e._zod.pattern = null != (r = e._zod.bag.pattern) ? r : er, e._zod.parse = function(r, n) {
                if (t.coerce) try {
                    r.value = Number(r.value)
                } catch (e) {}
                var i = r.value;
                if ("number" == typeof i && !Number.isNaN(i) && Number.isFinite(i)) return r;
                var o = "number" == typeof i ? Number.isNaN(i) ? "NaN" : Number.isFinite(i) ? void 0 : "Infinity" : void 0;
                return r.issues.push(V({
                    expected: "number",
                    code: "invalid_type",
                    input: i,
                    inst: e
                }, o ? {
                    received: o
                } : {})), r
            }
        }),
        ea = T("$ZodBoolean", function(e, t) {
            eo.init(e, t), e._zod.pattern = en, e._zod.parse = function(r, n) {
                if (t.coerce) try {
                    r.value = !!r.value
                } catch (e) {}
                var i = r.value;
                return "boolean" == typeof i || r.issues.push({
                    expected: "boolean",
                    code: "invalid_type",
                    input: i,
                    inst: e
                }), r
            }
        });

    function el(e, t, r, n) {
        if (e.issues.length) {
            var i;
            (i = t.issues).push.apply(i, R(e.issues.map(function(e) {
                return null != e.path || (e.path = []), e.path.unshift(r), e
            })))
        }
        void 0 === e.value ? r in n && (t.value[r] = void 0) : t.value[r] = e.value
    }
    var es = T("$ZodObject", function(e, t) {
        eo.init(e, t);
        var r, n = Object.getOwnPropertyDescriptor(t, "shape");
        if (!(null == n ? void 0 : n.get)) {
            var i = t.shape;
            Object.defineProperty(t, "shape", {
                get: function() {
                    var e = V({}, i);
                    return Object.defineProperty(t, "shape", {
                        value: e
                    }), e
                }
            })
        }
        var o = C(function() {
            return function(e) {
                var t, r = Object.keys(e.shape),
                    n = !0,
                    i = !1,
                    o = void 0;
                try {
                    for (var u, a = r[Symbol.iterator](); !(n = (u = a.next()).done); n = !0) {
                        var l, s, c, f, d = u.value;
                        if (!(null == (f = e.shape) || null == (c = f[d]) || null == (s = c._zod) || null == (l = s.traits) ? void 0 : l.has("$ZodType"))) throw Error('Invalid element at key "'.concat(d, '": expected a Zod schema'))
                    }
                } catch (e) {
                    i = !0, o = e
                } finally {
                    try {
                        n || null == a.return || a.return()
                    } finally {
                        if (i) throw o
                    }
                }
                var v = Object.keys(t = e.shape).filter(function(e) {
                    return "optional" === t[e]._zod.optin && "optional" === t[e]._zod.optout
                });
                return M(V({}, e), {
                    keys: r,
                    keySet: new Set(r),
                    numKeys: r.length,
                    optionalKeys: new Set(v)
                })
            }(t)
        });
        L(e._zod, "propValues", function() {
            var e = t.shape,
                r = {};
            for (var n in e) {
                var i = e[n]._zod;
                if (i.values) {
                    null != r[n] || (r[n] = new Set);
                    var o = !0,
                        u = !1,
                        a = void 0;
                    try {
                        for (var l, s, c = i.values[Symbol.iterator](); !(o = (s = c.next()).done); o = !0) {
                            var f = s.value;
                            r[n].add(f)
                        }
                    } catch (e) {
                        u = !0, a = e
                    } finally {
                        try {
                            o || null == c.return || c.return()
                        } finally {
                            if (u) throw a
                        }
                    }
                }
            }
            return r
        });
        var u = t.catchall;
        e._zod.parse = function(t, n) {
            null != r || (r = o.value);
            var i = t.value;
            if (!((void 0 === (d = i) ? "undefined" : O(d)) === "object" && null !== d && !Array.isArray(d))) return t.issues.push({
                expected: "object",
                code: "invalid_type",
                input: i,
                inst: e
            }), t;
            t.value = {};
            var a = [],
                l = r.shape,
                s = !0,
                c = !1,
                f = void 0;
            try {
                for (var d, v, p = r.keys[Symbol.iterator](); !(s = (v = p.next()).done); s = !0) ! function() {
                    var e = v.value,
                        r = l[e]._zod.run({
                            value: i[e],
                            issues: []
                        }, n);
                    z(r, Promise) ? a.push(r.then(function(r) {
                        return el(r, t, e, i)
                    })) : el(r, t, e, i)
                }()
            } catch (e) {
                c = !0, f = e
            } finally {
                try {
                    s || null == p.return || p.return()
                } finally {
                    if (c) throw f
                }
            }
            return u ? function(e, t, r, n, i, o) {
                var u = [],
                    a = i.keySet,
                    l = i.catchall._zod,
                    s = l.def.type,
                    c = !0,
                    f = !1,
                    d = void 0;
                try {
                    for (var v, p = Object.keys(t)[Symbol.iterator](); !(c = (v = p.next()).done); c = !0) ! function() {
                        var i = v.value;
                        if (!a.has(i)) {
                            if ("never" === s) return u.push(i);
                            var o = l.run({
                                value: t[i],
                                issues: []
                            }, n);
                            z(o, Promise) ? e.push(o.then(function(e) {
                                return el(e, r, i, t)
                            })) : el(o, r, i, t)
                        }
                    }()
                } catch (e) {
                    f = !0, d = e
                } finally {
                    try {
                        c || null == p.return || p.return()
                    } finally {
                        if (f) throw d
                    }
                }
                return (u.length && r.issues.push({
                    code: "unrecognized_keys",
                    keys: u,
                    input: t,
                    inst: o
                }), e.length) ? Promise.all(e).then(function() {
                    return r
                }) : r
            }(a, i, t, n, o.value, e) : a.length ? Promise.all(a).then(function() {
                return t
            }) : t
        }
    });

    function ec(e, t) {
        return e.issues.length && void 0 === t ? {
            issues: [],
            value: void 0
        } : e
    }
    var ef = T("$ZodOptional", function(e, t) {
        eo.init(e, t), e._zod.optin = "optional", e._zod.optout = "optional", L(e._zod, "values", function() {
            return t.innerType._zod.values ? new Set(R(t.innerType._zod.values).concat([void 0])) : void 0
        }), L(e._zod, "pattern", function() {
            var e, r, n, i = t.innerType._zod.pattern;
            return i ? new RegExp("^(".concat((r = +!!(e = i.source).startsWith("^"), n = e.endsWith("$") ? e.length - 1 : e.length, e.slice(r, n)), ")?$")) : void 0
        }), e._zod.parse = function(e, r) {
            if ("optional" === t.innerType._zod.optin) {
                var n = t.innerType._zod.run(e, r);
                return z(n, Promise) ? n.then(function(t) {
                    return ec(t, e.value)
                }) : ec(n, e.value)
            }
            return void 0 === e.value ? e : t.innerType._zod.run(e, r)
        }
    });
    Symbol("ZodOutput"), Symbol("ZodInput");
    var ed = T("ZodMiniType", function(e, t) {
            if (!e._zod) throw Error("Uninitialized schema in ZodMiniType.");
            eo.init(e, t), e.def = t, e.type = t.type, e.parse = function(t, r) {
                return Y(e, t, r, {
                    callee: e.parse
                })
            }, e.safeParse = function(t, r) {
                return ee(e, t, r)
            }, e.parseAsync = function(t, r) {
                return m(function() {
                    return w(this, function(n) {
                        return [2, Q(e, t, r, {
                            callee: e.parseAsync
                        })]
                    })
                })()
            }, e.safeParseAsync = function(t, r) {
                return m(function() {
                    return w(this, function(n) {
                        return [2, et(e, t, r)]
                    })
                })()
            }, e.check = function() {
                for (var r, n = arguments.length, i = Array(n), o = 0; o < n; o++) i[o] = arguments[o];
                return e.clone(M(V({}, t), {
                    checks: R(null != (r = t.checks) ? r : []).concat(R(i.map(function(e) {
                        return "function" == typeof e ? {
                            _zod: {
                                check: e,
                                def: {
                                    check: "custom"
                                },
                                onattach: []
                            }
                        } : e
                    })))
                }))
            }, e.clone = function(t, r) {
                var n;
                return n = new e._zod.constr(null != t ? t : e._zod.def), (!t || (null == r ? void 0 : r.parent)) && (n._zod.parent = e), n
            }, e.brand = function() {
                return e
            }, e.register = function(t, r) {
                return t.add(e, r), e
            }
        }),
        ev = T("ZodMiniNumber", function(e, t) {
            eu.init(e, t), ed.init(e, t)
        });

    function ep(e) {
        return new ev(V({
            type: "number",
            checks: []
        }, G(e)))
    }
    var ey = T("ZodMiniBoolean", function(e, t) {
            ea.init(e, t), ed.init(e, t)
        }),
        eh = T("ZodMiniObject", function(e, t) {
            es.init(e, t), ed.init(e, t), L(e, "shape", function() {
                return t.shape
            })
        }),
        eb = T("ZodMiniOptional", function(e, t) {
            ef.init(e, t), ed.init(e, t)
        });

    function em(e) {
        return new eb({
            type: "optional",
            innerType: e
        })
    }
    var ew = window.Roblox["core-scripts"].environmentUrls,
        eg = h.n(ew),
        e_ = globalThis.window,
        eO = globalThis.document,
        eS = void 0 === e_ ? void 0 : e_,
        ez = void 0 === eO ? void 0 : eO,
        eP = window.Roblox["core-lib"].http.index,
        ej = window.Roblox["core-lib"].url.index,
        ek = ["click", "dblclick", "focus", "hover", "keypress", "mousedown", "mouseenter", "mouseover", "scroll", "touchmove", "touchstart"],
        ex = ["blur"],
        eE = (i = {
            isEnabled: em(new ey(V({
                type: "boolean"
            }, G(void 0)))),
            rolloutPercentage: em(ep()),
            intervalTimeMs: em(ep())
        }, new eh(V({
            type: "object",
            shape: null != i ? i : {}
        }, G(void 0)))),
        eT = function() {
            return ej.Url.parse(eg().apiGatewayUrl).getOrThrow()
        },
        eB = function() {
            var e, t, r;
            return null != (e = null == (r = /sessionid=([a-f0-9-]{36})/.exec(null != (t = null == ez ? void 0 : ez.cookie) ? t : "")) ? void 0 : r[1]) ? e : "unknown"
        },
        eI = function(e) {
            if (!e.trim()) return null;
            try {
                return BigInt(e)
            } catch (e) {
                return null
            }
        },
        eN = function(e) {
            return e > 0 && e <= Number.MAX_SAFE_INTEGER ? e.toString() : null
        },
        eA = function(e) {
            var t = eI(e);
            return null == t ? null : eN(t)
        },
        eV = "blackbird",
        eM = function(e) {
            var t, r, n, i, o = null != (t = e.userid) ? t : e.user,
                u = null == o ? void 0 : null != (r = eA(o)) ? r : void 0;
            if ("string" == typeof u) return {
                isAuthenticated: !0,
                id: u,
                userName: null != (n = e.name) ? n : e.userName,
                displayName: null != (i = e.displayname) ? i : e.userDisplayName,
                isPremiumUser: "true" === e.ispremiumuser || "true" === e.userIsPremium,
                membership: e.membership === eV || e.userMembership === eV ? eV : void 0,
                isVerified: "true" === e.hasverifiedbadge || "true" === e.userHasVerifiedBadge,
                isUnder13: "true" === e.isunder13 || "AgeUnder13" === e.userAgeBracket
            }
        };

    function eZ() {
        return null != d || (d = "".concat(eg().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), d
    }
    var eD = function() {},
        eR = function(e, t) {
            return e << 3 | t
        },
        e$ = eR(1, 2),
        eC = eR(2, 2),
        eU = eR(5, 2),
        eL = eR(6, 2),
        eF = eR(8, 2),
        eG = eR(1, 2),
        eH = eR(2, 1),
        eW = eR(3, 0),
        eq = eR(5, 2);
    eR(1, 2), eR(2, 1), eR(3, 0), eR(4, 2), eR(5, 2), eR(6, 0), eR(8, 2);
    var eK = eR(4, 0),
        eJ = eR(6, 2),
        eX = eR(7, 2);
    eR(1, 0), eR(2, 2);
    var eY = eR(1, 2),
        eQ = eR(2, 2),
        e0 = eR(1, 2);
    eR(1, 2), eR(2, 2), eR(1, 2);
    var e1 = new TextEncoder,
        e2 = function() {
            var e;

            function t() {
                P(this, t), A(this, "buf", [])
            }
            return e = [{
                    key: "writeVarint",
                    value: function(e) {
                        var t = (void 0 === e ? "undefined" : O(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                        for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                        this.buf.push(Number(t))
                    }
                }, {
                    key: "writeString",
                    value: function(e) {
                        var t = e1.encode(e);
                        this.writeVarint(t.length);
                        var r = !0,
                            n = !1,
                            i = void 0;
                        try {
                            for (var o, u = t[Symbol.iterator](); !(r = (o = u.next()).done); r = !0) {
                                var a = o.value;
                                this.buf.push(a)
                            }
                        } catch (e) {
                            n = !0, i = e
                        } finally {
                            try {
                                r || null == u.return || u.return()
                            } finally {
                                if (n) throw i
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
                            for (var i, o = e[Symbol.iterator](); !(t = (i = o.next()).done); t = !0) {
                                var u = i.value;
                                this.buf.push(u)
                            }
                        } catch (e) {
                            r = !0, n = e
                        } finally {
                            try {
                                t || null == o.return || o.return()
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

    function e3(e, t, r) {
        var n = new e2;
        return n.writeVarint(eR(1, 2)), n.writeString(e), n.writeVarint(t), r(n), n.toBytes()
    }

    function e4(e) {
        var t = new e2;
        if (t.writeVarint(eG), t.writeString(e.name), t.writeVarint(eH), t.writeDouble(e.value), t.writeVarint(eW), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
            var r = function(e) {
                var t = new e2,
                    r = !0,
                    n = !1,
                    i = void 0;
                try {
                    for (var o, u = Object.entries(e)[Symbol.iterator](); !(r = (o = u.next()).done); r = !0) ! function() {
                        var e, r = (e = o.value, function(e) {
                                if (Array.isArray(e)) return e
                            }(e) || function(e) {
                                var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != n) {
                                    var i = [],
                                        o = !0,
                                        u = !1;
                                    try {
                                        for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                                    } catch (e) {
                                        u = !0, r = e
                                    } finally {
                                        try {
                                            o || null == n.return || n.return()
                                        } finally {
                                            if (u) throw r
                                        }
                                    }
                                    return i
                                }
                            }(e) || D(e, 2) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()),
                            n = r[0],
                            i = r[1];
                        if ("string" == typeof i) {
                            var u = e3(n, eR(2, 2), function(e) {
                                e.writeString(i)
                            });
                            t.writeVarint(eU), t.writeBytes(u)
                        } else if ("boolean" == typeof i) {
                            var a = e3(n, eR(2, 0), function(e) {
                                e.writeVarint(+!!i)
                            });
                            t.writeVarint(eL), t.writeBytes(a)
                        } else if ((void 0 === i ? "undefined" : O(i)) === "bigint") {
                            var l = e3(n, eR(2, 0), function(e) {
                                e.writeVarint(i)
                            });
                            t.writeVarint(eC), t.writeBytes(l)
                        } else if ("number" == typeof i)
                            if (Number.isFinite(i))
                                if (Number.isInteger(i) && i >= -0x80000000 && i <= 0x7fffffff) {
                                    var s = e3(n, eR(2, 0), function(e) {
                                        e.writeVarint(i)
                                    });
                                    t.writeVarint(e$), t.writeBytes(s)
                                } else if (Number.isInteger(i)) {
                            var c = e3(n, eR(2, 0), function(e) {
                                e.writeVarint(BigInt(i))
                            });
                            t.writeVarint(eC), t.writeBytes(c)
                        } else {
                            var f = e3(n, eR(2, 1), function(e) {
                                e.writeDouble(i)
                            });
                            t.writeVarint(eF), t.writeBytes(f)
                        } else {
                            var d = e3(n, eR(2, 2), function(e) {
                                e.writeString(String(i))
                            });
                            t.writeVarint(eU), t.writeBytes(d)
                        }
                    }()
                } catch (e) {
                    n = !0, i = e
                } finally {
                    try {
                        r || null == u.return || u.return()
                    } finally {
                        if (n) throw i
                    }
                }
                return t.toBytes()
            }(e.attributes);
            t.writeVarint(eq), t.writeBytes(r)
        }
        return t.toBytes()
    }

    function e6(e, t, r) {
        var n = new e2;
        n.writeVarint(eK), n.writeVarint(r);
        var i = !0,
            o = !1,
            u = void 0;
        try {
            for (var a, l = e[Symbol.iterator](); !(i = (a = l.next()).done); i = !0) {
                var s = a.value;
                n.writeVarint(eJ), n.writeBytes(s)
            }
        } catch (e) {
            o = !0, u = e
        } finally {
            try {
                i || null == l.return || l.return()
            } finally {
                if (o) throw u
            }
        }
        var c = !0,
            f = !1,
            d = void 0;
        try {
            for (var v, p = t[Symbol.iterator](); !(c = (v = p.next()).done); c = !0) {
                var y = v.value;
                n.writeVarint(eX), n.writeBytes(y)
            }
        } catch (e) {
            f = !0, d = e
        } finally {
            try {
                c || null == p.return || p.return()
            } finally {
                if (f) throw d
            }
        }
        return n.toBytes()
    }

    function e8(e) {
        var t = new e2;
        t.writeVarint(eY), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(eQ), t.writeBytes(e);
        var r = t.toBytes(),
            n = new e2;
        return n.writeVarint(e0), n.writeBytes(r), n.toBytes()
    }
    var e9 = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

    function e5(e) {
        return e9.test(e)
    }
    var e7 = [],
        te = !1,
        tt = !1;

    function tr(e, t) {
        var r, n, i = e.map(function(e) {
                return {
                    name: e.name,
                    value: e.value,
                    timestampMs: e.timestampMs,
                    attributes: e.attributes
                }
            }),
            o = BigInt(Date.now());
        !0 === t || tt || "u" > typeof document && "hidden" === document.visibilityState ? (r = e8(e6(i.map(e4), [], o)).buffer, fetch("".concat(eZ()).concat("/v1/events/single"), {
            method: "POST",
            headers: {
                "Content-Type": "application/x-protobuf"
            },
            body: r,
            credentials: "include",
            keepalive: !0
        }).catch(eD)) : (n = e8(e6(i.map(e4), [], o)), m(function() {
            var e, t, r, i, o, u, a, l, s, c, f, d, v;
            return w(this, function(p) {
                switch (p.label) {
                    case 0:
                        if ("u" < typeof CompressionStream) return [2, {
                            body: n.buffer,
                            compressed: !1
                        }];
                        return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(n).catch(eD), t.close().catch(eD), r = [], [4, (i = e.readable.getReader()).read()];
                    case 1:
                        o = p.sent(), p.label = 2;
                    case 2:
                        if (o.done) return [3, 4];
                        return r.push(o.value), [4, i.read()];
                    case 3:
                        return o = p.sent(), [3, 2];
                    case 4:
                        u = new Uint8Array(r.reduce(function(e, t) {
                            return e + t.length
                        }, 0)), a = 0, l = !0, s = !1, c = void 0;
                        try {
                            for (f = r[Symbol.iterator](); !(l = (d = f.next()).done); l = !0) v = d.value, u.set(v, a), a += v.length
                        } catch (e) {
                            s = !0, c = e
                        } finally {
                            try {
                                l || null == f.return || f.return()
                            } finally {
                                if (s) throw c
                            }
                        }
                        return [2, {
                            body: u.buffer,
                            compressed: !0
                        }]
                }
            })
        })()).then(function(e) {
            var t = e.body,
                r = e.compressed,
                n = {
                    "Content-Type": "application/x-protobuf"
                };
            return r && (n["Content-Encoding"] = "gzip"), fetch("".concat(eZ()).concat("/v1/events/single"), {
                method: "POST",
                headers: n,
                body: t,
                credentials: "include",
                keepalive: !0
            })
        }).catch(eD)
    }

    function tn() {
        var e = !0,
            t = !1,
            r = void 0;
        try {
            for (var n, i = e7[Symbol.iterator](); !(e = (n = i.next()).done); e = !0) {
                var o = n.value.splice(0);
                0 !== o.length && tr(o, !0)
            }
        } catch (e) {
            t = !0, r = e
        } finally {
            try {
                e || null == i.return || i.return()
            } finally {
                if (t) throw r
            }
        }
    }
    var ti = new Map(["android", "ios", "xbox", "uwp", "amazon", "win32", "universalApp", "unknown"].map(function(e) {
            return [e.toLowerCase(), e]
        })),
        to = function(e) {
            var t, r;
            return null != (t = ti.get(null != (r = null == e ? void 0 : e.trim().toLowerCase()) ? r : "")) ? t : "unknown"
        },
        tu = function() {
            if ("u" > typeof document) {
                var e = document.querySelector('meta[name="page-meta"]');
                return null == e ? void 0 : e.dataset.internalPageName
            }
        },
        ta = ["Messages", "Avatar"],
        tl = function(e) {
            var t;
            return null != (t = ta.find(function(t) {
                return t === e
            })) ? t : "other"
        },
        ts = function() {
            var e;
            return to(null == ez || null == (e = ez.querySelector('meta[name="device-meta"]')) ? void 0 : e.dataset.appType)
        },
        tc = {
            featureName: "AppShell",
            team: "User > Consumer Apps > Platforms - Web & Backend",
            features: {
                page: {
                    counters: [{
                        name: "ShellStart",
                        dimensions: ["host", "page", "appType", "auth_state"]
                    }, {
                        name: "PageHeartbeat",
                        dimensions: ["host", "page", "appType", "beat"]
                    }]
                },
                presence: {
                    counters: [{
                        name: "PresenceHeartbeat",
                        dimensions: ["host", "page", "appType", "outcome"]
                    }]
                },
                navigation: {
                    counters: [{
                        name: "NavLoad",
                        dimensions: ["host", "page", "appType", "outcome"]
                    }]
                },
                realtime: {
                    counters: [{
                        name: "RealtimeStart",
                        dimensions: ["host", "page", "appType", "outcome"]
                    }]
                },
                chat: {
                    counters: [{
                        name: "ChatLoad",
                        dimensions: ["host", "page", "appType", "outcome"]
                    }]
                },
                gameLaunch: {
                    counters: [{
                        name: "GameLaunch",
                        dimensions: ["host", "page", "appType", "outcome"]
                    }]
                }
            }
        },
        tf = function(e, t, r) {
            var n = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : {},
                i = n.appType,
                o = void 0 !== i && i;
            return function(n, i) {
                var u = Object.values(e.features).some(function(e) {
                    var t;
                    return null == (t = e.counters) ? void 0 : t.some(function(e) {
                        var t;
                        return "string" != typeof e && e.name === n && (null == (t = e.dimensions) ? void 0 : t.includes("page")) === !0
                    })
                });
                t(n, V(M(V({}, u && null == i.page ? {
                    page: tl(tu())
                } : {}, i), {
                    host: r
                }), o ? {
                    appType: ts()
                } : {}))
            }
        }(tc, function(e) {
            var t, r = Math.max(1, 10),
                n = 250;

            function i(e, t) {
                console.error(e, t)
            }
            if (!e5(e)) return i('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                    name: e
                }),
                function() {};
            var o = [];
            return e7.push(o), te || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                    "hidden" === document.visibilityState && tn()
                }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                    tt = !0, tn()
                }), te = !0),
                function(u, a, l) {
                    var s = "".concat(e, "_").concat(u);
                    if (! function(e, t) {
                            if (!e5(e)) return !1;
                            if (t) {
                                var r = !0,
                                    n = !1,
                                    i = void 0;
                                try {
                                    for (var o, u = Object.keys(t)[Symbol.iterator](); !(r = (o = u.next()).done); r = !0) {
                                        var a = o.value;
                                        if (!e5(a)) return !1
                                    }
                                } catch (e) {
                                    n = !0, i = e
                                } finally {
                                    try {
                                        r || null == u.return || u.return()
                                    } finally {
                                        if (n) throw i
                                    }
                                }
                            }
                            return !0
                        }(s, a)) return void i("@rbx/web-telemetry: invalid event name or attribute key", {
                        name: u,
                        attributes: a
                    });
                    var c = null != l ? l : 1;
                    if (!Number.isFinite(c)) return void i("@rbx/web-telemetry: value must be a finite number", {
                        name: u,
                        attributes: a
                    });
                    var f = a && Object.keys(a).length > 0 ? a : void 0;
                    o.push({
                        name: s,
                        attributes: f,
                        value: c,
                        timestampMs: BigInt(Date.now())
                    }), o.length >= r ? (void 0 !== t && (clearTimeout(t), t = void 0), tr(o.splice(0, r))) : void 0 === t && (t = setTimeout(function() {
                        for (t = void 0; o.length > 0;) tr(o.splice(0, r))
                    }, n))
                }
        }(tc.featureName), "dotnet", {
            appType: !0
        }),
        td = null == (v = function() {
            if ("u" > typeof document) {
                var e, t;
                return eM(null != (e = null == (t = document.querySelector('meta[name="user-data"]')) ? void 0 : t.dataset) ? e : document.documentElement.dataset)
            }
        }()) ? void 0 : v.id,
        tv = null == td ? null : function(e) {
            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 10,
                r = Number.parseInt(e, t);
            return Number.isNaN(r) ? null : r
        }(td);
    null != tv && (o = function(e) {
        tf("PresenceHeartbeat", {
            outcome: e
        })
    }, u = !1, a = !1, l = 3e4, s = function() {
        u = !0, a = !1, m(function() {
            var e;
            return w(this, function(t) {
                switch (t.label) {
                    case 0:
                        return [4, eP.postUntyped(eT().withPath("/user-heartbeats-api/pulse"), {
                            clientSideTimestampEpochMs: Date.now(),
                            sessionInfo: {
                                sessionId: eB()
                            },
                            locationInfo: {
                                websiteLocationInfo: {
                                    url: null != (e = null == eS ? void 0 : eS.location.href) ? e : ""
                                }
                            }
                        }, {
                            credentials: "include"
                        })];
                    case 1:
                        return [2, t.sent().isOk()]
                }
            })
        })().then(function(e) {
            null == o || o(e ? "sent" : "failed")
        }), setTimeout(function() {
            a ? s() : u = !1
        }, l)
    }, c = function() {
        u ? a = !0 : s()
    }, f = function() {
        a = !1
    }, m(function() {
        var e, t, r, n;
        return w(this, function(i) {
            switch (i.label) {
                case 0:
                    return [4, eP.get(eT().withPath("/guac-v2/v1/bundles/user-heartbeats"), eE, {
                        credentials: "include"
                    })];
                case 1:
                    if ((r = i.sent()).isErr()) return [2, "configFailed"];
                    if (!0 !== (n = r.value).isEnabled || tv % 100 >= (null != (e = n.rolloutPercentage) ? e : 0)) return [2, "gatedOff"];
                    return [2, null != (t = n.intervalTimeMs) ? t : 3e4]
            }
        })
    })().then(function(e) {
        1;
        if ("string" == typeof e) {
            null == o || o(e);
            return
        }
        l = e, null == o || o("started"), ek.forEach(function(e) {
            null == eS || eS.addEventListener(e, c, {
                passive: !0
            })
        }), ex.forEach(function(e) {
            null == eS || eS.addEventListener(e, f)
        }), s()
    }))
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "PresenceRegistration");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/presenceRegistration-199ccb78e8ee48bb.js.map