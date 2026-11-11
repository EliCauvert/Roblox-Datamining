;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "20917ff1-3e82-5b06-4124-a738ace269f8")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 531428, 27472, 650220, t => {
    "use strict";
    t.i(53341), t.s(["f", 0, function(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            n = {};
        for (let [r, i] of Object.entries(null != t ? t : {})) {
            let t = function(t, e) {
                var n;
                let {
                    value: r,
                    unit: i
                } = "object" == typeof t && null != t && !Array.isArray(t) && Object.keys(t).includes("value") ? t : {
                    value: t,
                    unit: void 0
                }, s = function(t) {
                    let e = "string" == typeof t ? "string" : "boolean" == typeof t ? "boolean" : "number" != typeof t || Number.isNaN(t) ? null : Number.isInteger(t) ? "integer" : "double";
                    if (e) return {
                        value: t,
                        type: e
                    }
                }(r), a = i && "string" == typeof i ? {
                    unit: i
                } : {};
                if (s) return {
                    ...s,
                    ...a
                };
                if (!e || "skip-undefined" === e && void 0 === r) return;
                let o = "";
                try {
                    o = null != (n = JSON.stringify(r)) ? n : ""
                } catch (t) {}
                return {
                    value: o,
                    type: "string",
                    ...a
                }
            }(i, e);
            t && (n[r] = t)
        }
        return n
    }], 531428), t.s(["r", 0, 2, "b", 0, 1, "s", 0, 0, "x", 0, function(t, e) {
        t.setAttribute("http.response.status_code", e);
        let n = function(t) {
            if (t < 400 && t >= 100) return {
                code: 1
            };
            if (t >= 400 && t < 500) switch (t) {
                case 401:
                    return {
                        code: 2, message: "unauthenticated"
                    };
                case 403:
                    return {
                        code: 2, message: "permission_denied"
                    };
                case 404:
                    return {
                        code: 2, message: "not_found"
                    };
                case 409:
                    return {
                        code: 2, message: "already_exists"
                    };
                case 413:
                    return {
                        code: 2, message: "failed_precondition"
                    };
                case 429:
                    return {
                        code: 2, message: "resource_exhausted"
                    };
                case 499:
                    return {
                        code: 2, message: "cancelled"
                    };
                default:
                    return {
                        code: 2, message: "invalid_argument"
                    }
            }
            if (t >= 500 && t < 600) switch (t) {
                case 501:
                    return {
                        code: 2, message: "unimplemented"
                    };
                case 503:
                    return {
                        code: 2, message: "unavailable"
                    };
                case 504:
                    return {
                        code: 2, message: "deadline_exceeded"
                    }
            }
            return {
                code: 2,
                message: "internal_error"
            }
        }(e);
        "unknown_error" !== n.message && t.setStatus(n)
    }], 27472);
    var e = t.i(506929),
        n = t.i(242734);
    let r = "_sentryScope",
        i = "_sentryIsolationScope";
    t.s(["C", 0, function(t) {
        return {
            scope: t[r],
            isolationScope: function(t) {
                if (t) {
                    if ("object" == typeof t && "deref" in t && "function" == typeof t.deref) try {
                        return t.deref()
                    } catch (t) {
                        return
                    }
                    return t
                }
            }(t[i])
        }
    }, "q", 0, function(t, s, a) {
        t && ((0, e.O)(t, i, function(t) {
            try {
                let e = n.f.WeakRef;
                if ("function" == typeof e) return new e(t)
            } catch (t) {}
            return t
        }(a)), (0, e.O)(t, r, s))
    }], 650220)
}, 505099, 106408, 242734, 813705, 33098, 53341, 981676, 973716, 506929, 167178, 900403, 182133, 669043, 825142, 812268, 445228, 329282, 46870, 778824, 709660, 754177, 750672, t => {
    "use strict";
    let e, n, r, i, s = "10.53.1";
    t.s(["f", 0, s], 106408);
    let a = globalThis;

    function o() {
        return c(a), a
    }

    function c(t) {
        let e = t.__SENTRY__ = t.__SENTRY__ || {};
        return e.version = e.version || s, e[s] = e[s] || {}
    }

    function u(t, e) {
        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : a,
            r = n.__SENTRY__ = n.__SENTRY__ || {},
            i = r[s] = r[s] || {};
        return i[t] || (i[t] = e())
    }
    t.s(["f", 0, a], 242734), t.s(["u", 0, u, "t", 0, o, "y", 0, c], 813705);
    let l = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;
    t.s(["f", 0, l], 33098);
    let d = Object.prototype.toString;

    function p(t) {
        switch (d.call(t)) {
            case "[object Error]":
            case "[object Exception]":
            case "[object DOMException]":
            case "[object WebAssembly.Exception]":
                return !0;
            default:
                return S(t, Error)
        }
    }

    function f(t, e) {
        return d.call(t) === "[object ".concat(e, "]")
    }

    function h(t) {
        return f(t, "String")
    }

    function _(t) {
        return "object" == typeof t && null !== t && "__sentry_template_string__" in t && "__sentry_template_values__" in t
    }

    function g(t) {
        return f(t, "Object")
    }

    function m(t) {
        return "u" > typeof Event && S(t, Event)
    }

    function v(t) {
        return "u" > typeof Element && S(t, Element)
    }

    function y(t) {
        return f(t, "RegExp")
    }

    function b(t) {
        return !!((null == t ? void 0 : t.then) && "function" == typeof t.then)
    }

    function S(t, e) {
        try {
            return t instanceof e
        } catch (t) {
            return !1
        }
    }

    function x(t) {
        return !!("object" == typeof t && null !== t && (t.__isVue || t._isVue || t.__v_isVNode))
    }

    function k(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        if (!t) return "<unknown>";
        try {
            let n, r = t,
                i = [],
                s = 0,
                o = 0,
                c = Array.isArray(e) ? e : e.keyAttrs,
                u = !Array.isArray(e) && e.maxStringLength || 80;
            for (; r && s++ < 5 && (n = function(t, e) {
                    let n = [];
                    if (!(null == t ? void 0 : t.tagName)) return "";
                    if (a.HTMLElement && t instanceof HTMLElement && t.dataset) {
                        if (t.dataset.sentryComponent) return t.dataset.sentryComponent;
                        if (t.dataset.sentryElement) return t.dataset.sentryElement
                    }
                    n.push(t.tagName.toLowerCase());
                    let r = (null == e ? void 0 : e.length) ? e.filter(e => t.getAttribute(e)).map(e => [e, t.getAttribute(e)]) : null;
                    if (null == r ? void 0 : r.length) r.forEach(t => {
                        n.push("[".concat(t[0], '="').concat(t[1], '"]'))
                    });
                    else {
                        t.id && n.push("#".concat(t.id));
                        let e = t.className;
                        if (e && h(e))
                            for (let t of e.split(/\s+/)) n.push(".".concat(t))
                    }
                    for (let e of ["aria-label", "type", "name", "title", "alt"]) {
                        let r = t.getAttribute(e);
                        r && n.push("[".concat(e, '="').concat(r, '"]'))
                    }
                    return n.join("")
                }(r, c), "html" !== n && (!(s > 1) || !(o + 3 * i.length + n.length >= u)));) i.push(n), o += n.length, r = r.parentNode;
            return i.reverse().join(" > ")
        } catch (t) {
            return "<unknown>"
        }
    }
    t.s(["U", 0, function(t) {
        return f(t, "DOMError")
    }, "a", 0, function(t) {
        return f(t, "DOMException")
    }, "m", 0, v, "b", 0, p, "u", 0, function(t) {
        return f(t, "ErrorEvent")
    }, "z", 0, m, "v", 0, S, "S", 0, _, "d", 0, g, "n", 0, function(t) {
        return null === t || _(t) || "object" != typeof t && "function" != typeof t
    }, "C", 0, y, "G", 0, function(t) {
        return "u" > typeof Request && S(t, Request)
    }, "Z", 0, h, "f", 0, function(t) {
        return g(t) && "nativeEvent" in t && "preventDefault" in t && "stopPropagation" in t
    }, "l", 0, b, "c", 0, x], 53341), t.s(["w", 0, function(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 5;
        if (!a.HTMLElement) return null;
        let n = t;
        for (let t = 0; t < e && n; t++) {
            if (n instanceof HTMLElement) {
                if (n.dataset.sentryComponent) return n.dataset.sentryComponent;
                if (n.dataset.sentryElement) return n.dataset.sentryElement
            }
            n = n.parentNode
        }
        return null
    }, "s", 0, function() {
        try {
            return a.document.location.href
        } catch (t) {
            return ""
        }
    }, "I", 0, k], 981676);
    let E = {};

    function I(t) {
        if (!("console" in a)) return t();
        let e = a.console,
            n = {},
            r = Object.keys(E);
        r.forEach(t => {
            let r = E[t];
            n[t] = e[t], e[t] = r
        });
        try {
            return t()
        } finally {
            r.forEach(t => {
                e[t] = n[t]
            })
        }
    }

    function w() {
        return T().enabled
    }

    function O(t) {
        for (var e = arguments.length, n = Array(e > 1 ? e - 1 : 0), r = 1; r < e; r++) n[r - 1] = arguments[r];
        l && w() && I(() => {
            a.console[t]("".concat("Sentry Logger ", "[").concat(t, "]:"), ...n)
        })
    }

    function T() {
        return l ? u("loggerSettings", () => ({
            enabled: !1
        })) : {
            enabled: !1
        }
    }
    let A = {
        enable: function() {
            T().enabled = !0
        },
        disable: function() {
            T().enabled = !1
        },
        isEnabled: w,
        log: function() {
            for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
            O("log", ...e)
        },
        warn: function() {
            for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
            O("warn", ...e)
        },
        error: function() {
            for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
            O("error", ...e)
        }
    };

    function C(t, e, n) {
        try {
            Object.defineProperty(t, e, {
                value: n,
                writable: !0,
                configurable: !0
            })
        } catch (n) {
            l && A.log('Failed to add non-enumerable property "'.concat(String(e), '" to object'), t)
        }
    }

    function D(t, e) {
        try {
            let n = e.prototype || {};
            t.prototype = e.prototype = n, C(t, "__sentry_original__", e)
        } catch (t) {}
    }

    function N(t) {
        if (p(t)) return {
            message: t.message,
            name: t.name,
            stack: t.stack,
            ...P(t)
        };
        if (!m(t)) return t;
        {
            let e = {
                type: t.type,
                target: j(t.target),
                currentTarget: j(t.currentTarget),
                ...P(t)
            };
            return "u" > typeof CustomEvent && S(t, CustomEvent) && (e.detail = t.detail), e
        }
    }

    function j(t) {
        try {
            return v(t) ? k(t) : Object.prototype.toString.call(t)
        } catch (t) {
            return "<unknown>"
        }
    }

    function P(t) {
        return "object" == typeof t && null !== t ? Object.fromEntries(Object.entries(t)) : {}
    }

    function R(t) {
        if (void 0 !== e) return e ? e(t) : t();
        let n = Symbol.for("__SENTRY_SAFE_RANDOM_ID_WRAPPER__");
        return n in a && "function" == typeof a[n] ? (e = a[n])(t) : (e = null, t())
    }

    function M() {
        return R(() => Math.random())
    }

    function L() {
        return R(() => Date.now())
    }
    t.s(["u", 0, ["debug", "info", "warn", "error", "log", "assert", "trace"], "D", 0, I, "h", 0, A, "r", 0, E], 973716), t.s(["O", 0, C, "F", 0, N, "v", 0, function(t) {
        let e = Object.keys(N(t));
        return e.sort(), e[0] ? e.join(", ") : "[object has no keys]"
    }, "Q", 0, function(t, e, n) {
        if (!(e in t)) return;
        let r = t[e];
        if ("function" != typeof r) return;
        let i = n(r);
        "function" == typeof i && D(i, r);
        try {
            t[e] = i
        } catch (n) {
            l && A.log('Failed to replace method "'.concat(e, '" in object'), t)
        }
    }, "R", 0, function(t) {
        return t.__sentry_original__
    }, "u", 0, D], 506929), t.s(["D", 0, L, "T", 0, M, "j", 0, R], 167178);
    let U = /\(error: (.*)\)/,
        J = /captureMessage|captureException/;

    function V() {
        for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
        let r = e.sort((t, e) => t[0] - e[0]).map(t => t[1]);
        return function(t) {
            let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
                n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 0,
                i = [],
                s = t.split("\n");
            for (let t = e; t < s.length; t++) {
                let e = s[t];
                e.length > 1024 && (e = e.slice(0, 1024));
                let a = U.test(e) ? e.replace(U, "$1") : e;
                if (!a.includes("Error: ")) {
                    for (let t of r) {
                        let e = t(a);
                        if (e) {
                            i.push(e);
                            break
                        }
                    }
                    if (i.length >= 50 + n) break
                }
            }
            var a = i.slice(n);
            if (!a.length) return [];
            let o = Array.from(a);
            return /sentryWrapped/.test(F(o).function || "") && o.pop(), o.reverse(), J.test(F(o).function || "") && (o.pop(), J.test(F(o).function || "") && o.pop()), o.slice(0, 50).map(t => ({
                ...t,
                filename: t.filename || F(o).filename,
                function: t.function || "?"
            }))
        }
    }

    function F(t) {
        return t[t.length - 1] || {}
    }
    let z = "<anonymous>";

    function B(t) {
        return "__v_isVNode" in t && t.__v_isVNode ? "[VueVNode]" : "[VueViewModel]"
    }

    function Y(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
        return "string" != typeof t || 0 === e || t.length <= e ? t : "".concat(t.slice(0, e), "...")
    }

    function H(t, e) {
        let n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
        return !!h(t) && (y(e) ? e.test(t) : h(e) ? n ? t === e : t.includes(e) : "function" == typeof e && e(t))
    }

    function K() {
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : a.crypto || a.msCrypto;
        try {
            if (null == t ? void 0 : t.randomUUID) return R(() => t.randomUUID()).replace(/-/g, "")
        } catch (t) {}
        return n || (n = "10000000100040008000100000000000"), n.replace(/[018]/g, t => (t ^ (15 & 16 * M()) >> t / 4).toString(16))
    }

    function W(t) {
        var e, n;
        return null == (n = t.exception) || null == (e = n.values) ? void 0 : e[0]
    }

    function q() {
        return L() / 1e3
    }

    function G() {
        return (null != r ? r : r = function() {
            let {
                performance: t
            } = a;
            if (!(null == t ? void 0 : t.now) || !t.timeOrigin) return q;
            let e = t.timeOrigin;
            return () => (e + R(() => t.now())) / 1e3
        }())()
    }
    t.s(["z", 0, "?", "O", 0, V, "s", 0, function(t) {
        let e = t.exception;
        if (e) {
            let t = [];
            try {
                return e.values.forEach(e => {
                    e.stacktrace.frames && t.push(...e.stacktrace.frames)
                }), t
            } catch (t) {}
        }
    }, "n", 0, function(t) {
        try {
            if (!t || "function" != typeof t) return z;
            return t.name || z
        } catch (t) {
            return z
        }
    }, "f", 0, B, "y", 0, function(t) {
        let e = (null == t ? void 0 : t.startsWith("file://")) ? t.slice(7) : t;
        return (null == e ? void 0 : e.match(/\/[A-Z]:/)) && (e = e.slice(1)), e
    }, "E", 0, function(t) {
        return Array.isArray(t) ? V(...t) : t
    }], 900403), t.s(["w", 0, H, "c", 0, function(t, e) {
        if (!Array.isArray(t)) return "";
        let n = [];
        for (let e = 0; e < t.length; e++) {
            let r = t[e];
            try {
                x(r) ? n.push(B(r)) : n.push(String(r))
            } catch (t) {
                n.push("[value cannot be serialized]")
            }
        }
        return n.join(e)
    }, "u", 0, function(t, e) {
        let n = t,
            r = n.length;
        if (r <= 150) return n;
        e > r && (e = r);
        let i = Math.max(e - 60, 0);
        i < 5 && (i = 0);
        let s = Math.min(i + 140, r);
        return s > r - 5 && (s = r), s === r && (i = Math.max(s - 140, 0)), n = n.slice(i, s), i > 0 && (n = "'{snip} ".concat(n)), s < r && (n += " {snip}"), n
    }, "$", 0, function(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
        for (let r of e)
            if (H(t, r, n)) return !0;
        return !1
    }, "k", 0, Y], 182133), t.s(["o", 0, function(t, e) {
        let n = W(t);
        if (!n) return;
        let r = n.mechanism;
        if (n.mechanism = {
                type: "generic",
                handled: !0,
                ...r,
                ...e
            }, e && "data" in e) {
            let t = {
                ...null == r ? void 0 : r.data,
                ...e.data
            };
            n.mechanism.data = t
        }
    }, "T", 0, function(t, e, n) {
        let r = t.exception = t.exception || {},
            i = r.values = r.values || [],
            s = i[0] = i[0] || {};
        s.value || (s.value = e || ""), s.type || (s.type = n || "Error")
    }, "n", 0, function(t) {
        if (function(t) {
                try {
                    return t.__sentry_captured__
                } catch (t) {}
            }(t)) return !0;
        try {
            C(t, "__sentry_captured__", !0)
        } catch (t) {}
        return !1
    }, "N", 0, function(t) {
        let {
            message: e,
            event_id: n
        } = t;
        if (e) return e;
        let r = W(t);
        return r ? r.type && r.value ? "".concat(r.type, ": ").concat(r.value) : r.type || r.value || n || "<unknown>" : n || "<unknown>"
    }, "c", 0, K], 669043);
    let Z = null;

    function $(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        if (e.user && (!t.ipAddress && e.user.ip_address && (t.ipAddress = e.user.ip_address), t.did || e.did || (t.did = e.user.id || e.user.email || e.user.username)), t.timestamp = e.timestamp || G(), e.abnormal_mechanism && (t.abnormal_mechanism = e.abnormal_mechanism), e.ignoreDuration && (t.ignoreDuration = e.ignoreDuration), e.sid && (t.sid = 32 === e.sid.length ? e.sid : K()), void 0 !== e.init && (t.init = e.init), !t.did && e.did && (t.did = "".concat(e.did)), "number" == typeof e.started && (t.started = e.started), t.ignoreDuration) t.duration = void 0;
        else if ("number" == typeof e.duration) t.duration = e.duration;
        else {
            let e = t.timestamp - t.started;
            t.duration = e >= 0 ? e : 0
        }
        e.release && (t.release = e.release), e.environment && (t.environment = e.environment), !t.ipAddress && e.ipAddress && (t.ipAddress = e.ipAddress), !t.userAgent && e.userAgent && (t.userAgent = e.userAgent), "number" == typeof e.errors && (t.errors = e.errors), e.status && (t.status = e.status)
    }

    function Q(t, e) {
        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 2;
        if (!e || "object" != typeof e || n <= 0) return e;
        if (t && 0 === Object.keys(e).length) return t;
        let r = {
            ...t
        };
        for (let t in e) Object.prototype.hasOwnProperty.call(e, t) && (r[t] = Q(r[t], e[t], n - 1));
        return r
    }

    function X() {
        return K()
    }

    function tt() {
        return K().substring(16)
    }
    t.s(["D", 0, function() {
        return null === Z && (Z = function() {
            var t;
            let {
                performance: e
            } = a;
            if (!(null == e ? void 0 : e.now)) return;
            let n = R(() => e.now()),
                r = L(),
                i = e.timeOrigin;
            if ("number" == typeof i && 3e5 > Math.abs(i + n - r)) return i;
            let s = null == (t = e.timing) ? void 0 : t.navigationStart;
            return "number" == typeof s && 3e5 > Math.abs(s + n - r) ? s : r - n
        }()), Z
    }, "i", 0, q, "R", 0, G], 825142), t.s(["n", 0, function(t, e) {
        let n = {};
        e ? n = {
            status: e
        } : "ok" === t.status && (n = {
            status: "exited"
        }), $(t, n)
    }, "r", 0, function(t) {
        let e = G(),
            n = {
                sid: K(),
                init: !0,
                timestamp: e,
                started: e,
                duration: 0,
                status: "ok",
                errors: 0,
                ignoreDuration: !1,
                toJSON: () => {
                    var t;
                    return t = n, {
                        sid: "".concat(t.sid),
                        init: t.init,
                        started: new Date(1e3 * t.started).toISOString(),
                        timestamp: new Date(1e3 * t.timestamp).toISOString(),
                        status: t.status,
                        errors: t.errors,
                        did: "number" == typeof t.did || "string" == typeof t.did ? "".concat(t.did) : void 0,
                        duration: t.duration,
                        abnormal_mechanism: t.abnormal_mechanism,
                        attrs: {
                            release: t.release,
                            environment: t.environment,
                            ip_address: t.ipAddress,
                            user_agent: t.userAgent
                        }
                    }
                }
            };
        return t && $(n, t), n
    }, "d", 0, $], 812268), t.s(["f", 0, Q], 445228), t.s(["d", 0, tt, "u", 0, X], 329282);
    let te = "_sentrySpan";

    function tn(t, e) {
        e ? C(t, te, e) : delete t[te]
    }

    function tr(t) {
        return t[te]
    }
    t.s(["c", 0, tr, "_", 0, tn], 46870);
    class ti {
        clone() {
            let t = new ti;
            return t._breadcrumbs = [...this._breadcrumbs], t._tags = {
                ...this._tags
            }, t._attributes = {
                ...this._attributes
            }, t._extra = {
                ...this._extra
            }, t._contexts = {
                ...this._contexts
            }, this._contexts.flags && (t._contexts.flags = {
                values: [...this._contexts.flags.values]
            }), t._user = this._user, t._level = this._level, t._session = this._session, t._transactionName = this._transactionName, t._fingerprint = this._fingerprint, t._eventProcessors = [...this._eventProcessors], t._attachments = [...this._attachments], t._sdkProcessingMetadata = {
                ...this._sdkProcessingMetadata
            }, t._propagationContext = {
                ...this._propagationContext
            }, t._client = this._client, t._lastEventId = this._lastEventId, t._conversationId = this._conversationId, tn(t, tr(this)), t
        }
        setClient(t) {
            this._client = t
        }
        setLastEventId(t) {
            this._lastEventId = t
        }
        getClient() {
            return this._client
        }
        lastEventId() {
            return this._lastEventId
        }
        addScopeListener(t) {
            this._scopeListeners.push(t)
        }
        addEventProcessor(t) {
            return this._eventProcessors.push(t), this
        }
        setUser(t) {
            return this._user = t || {
                email: void 0,
                id: void 0,
                ip_address: void 0,
                username: void 0
            }, this._session && $(this._session, {
                user: t
            }), this._notifyScopeListeners(), this
        }
        getUser() {
            return this._user
        }
        setConversationId(t) {
            return this._conversationId = t || void 0, this._notifyScopeListeners(), this
        }
        setTags(t) {
            return this._tags = {
                ...this._tags,
                ...t
            }, this._notifyScopeListeners(), this
        }
        setTag(t, e) {
            return this.setTags({
                [t]: e
            })
        }
        setAttributes(t) {
            return this._attributes = {
                ...this._attributes,
                ...t
            }, this._notifyScopeListeners(), this
        }
        setAttribute(t, e) {
            return this.setAttributes({
                [t]: e
            })
        }
        removeAttribute(t) {
            return t in this._attributes && (delete this._attributes[t], this._notifyScopeListeners()), this
        }
        setExtras(t) {
            return this._extra = {
                ...this._extra,
                ...t
            }, this._notifyScopeListeners(), this
        }
        setExtra(t, e) {
            return this._extra = {
                ...this._extra,
                [t]: e
            }, this._notifyScopeListeners(), this
        }
        setFingerprint(t) {
            return this._fingerprint = t, this._notifyScopeListeners(), this
        }
        setLevel(t) {
            return this._level = t, this._notifyScopeListeners(), this
        }
        setTransactionName(t) {
            return this._transactionName = t, this._notifyScopeListeners(), this
        }
        setContext(t, e) {
            return null === e ? delete this._contexts[t] : this._contexts[t] = e, this._notifyScopeListeners(), this
        }
        setSession(t) {
            return t ? this._session = t : delete this._session, this._notifyScopeListeners(), this
        }
        getSession() {
            return this._session
        }
        update(t) {
            if (!t) return this;
            let e = "function" == typeof t ? t(this) : t,
                {
                    tags: n,
                    attributes: r,
                    extra: i,
                    user: s,
                    contexts: a,
                    level: o,
                    fingerprint: c = [],
                    propagationContext: u,
                    conversationId: l
                } = (e instanceof ti ? e.getScopeData() : g(e) ? t : void 0) || {};
            return this._tags = {
                ...this._tags,
                ...n
            }, this._attributes = {
                ...this._attributes,
                ...r
            }, this._extra = {
                ...this._extra,
                ...i
            }, this._contexts = {
                ...this._contexts,
                ...a
            }, s && Object.keys(s).length && (this._user = s), o && (this._level = o), c.length && (this._fingerprint = c), u && (this._propagationContext = u), l && (this._conversationId = l), this
        }
        clear() {
            return this._breadcrumbs = [], this._tags = {}, this._attributes = {}, this._extra = {}, this._user = {}, this._contexts = {}, this._level = void 0, this._transactionName = void 0, this._fingerprint = void 0, this._session = void 0, this._conversationId = void 0, tn(this, void 0), this._attachments = [], this.setPropagationContext({
                traceId: X(),
                sampleRand: M()
            }), this._notifyScopeListeners(), this
        }
        addBreadcrumb(t, e) {
            let n = "number" == typeof e ? e : 100;
            if (n <= 0) return this;
            let r = {
                timestamp: q(),
                ...t,
                message: t.message ? Y(t.message, 2048) : t.message
            };
            if (this._breadcrumbs.push(r), this._breadcrumbs.length > n) {
                var i;
                this._breadcrumbs = this._breadcrumbs.slice(-n), null == (i = this._client) || i.recordDroppedEvent("buffer_overflow", "log_item")
            }
            return this._notifyScopeListeners(), this
        }
        getLastBreadcrumb() {
            return this._breadcrumbs[this._breadcrumbs.length - 1]
        }
        clearBreadcrumbs() {
            return this._breadcrumbs = [], this._notifyScopeListeners(), this
        }
        addAttachment(t) {
            return this._attachments.push(t), this
        }
        clearAttachments() {
            return this._attachments = [], this
        }
        getScopeData() {
            return {
                breadcrumbs: this._breadcrumbs,
                attachments: this._attachments,
                contexts: this._contexts,
                tags: this._tags,
                attributes: this._attributes,
                extra: this._extra,
                user: this._user,
                level: this._level,
                fingerprint: this._fingerprint || [],
                eventProcessors: this._eventProcessors,
                propagationContext: this._propagationContext,
                sdkProcessingMetadata: this._sdkProcessingMetadata,
                transactionName: this._transactionName,
                span: tr(this),
                conversationId: this._conversationId
            }
        }
        setSDKProcessingMetadata(t) {
            return this._sdkProcessingMetadata = Q(this._sdkProcessingMetadata, t, 2), this
        }
        setPropagationContext(t) {
            return this._propagationContext = t, this
        }
        getPropagationContext() {
            return this._propagationContext
        }
        captureException(t, e) {
            let n = (null == e ? void 0 : e.event_id) || K();
            if (!this._client) return l && A.warn("No client configured on scope - will not capture exception!"), n;
            let r = Error("Sentry syntheticException");
            return this._client.captureException(t, {
                originalException: t,
                syntheticException: r,
                ...e,
                event_id: n
            }, this), n
        }
        captureMessage(t, e, n) {
            var r;
            let i = (null == n ? void 0 : n.event_id) || K();
            if (!this._client) return l && A.warn("No client configured on scope - will not capture message!"), i;
            let s = null != (r = null == n ? void 0 : n.syntheticException) ? r : Error(t);
            return this._client.captureMessage(t, e, {
                originalException: t,
                syntheticException: s,
                ...n,
                event_id: i
            }, this), i
        }
        captureEvent(t, e) {
            let n = t.event_id || (null == e ? void 0 : e.event_id) || K();
            return this._client ? this._client.captureEvent(t, {
                ...e,
                event_id: n
            }, this) : l && A.warn("No client configured on scope - will not capture event!"), n
        }
        _notifyScopeListeners() {
            this._notifyingListeners || (this._notifyingListeners = !0, this._scopeListeners.forEach(t => {
                t(this)
            }), this._notifyingListeners = !1)
        }
        constructor() {
            this._notifyingListeners = !1, this._scopeListeners = [], this._eventProcessors = [], this._breadcrumbs = [], this._attachments = [], this._user = {}, this._tags = {}, this._attributes = {}, this._extra = {}, this._contexts = {}, this._sdkProcessingMetadata = {}, this._propagationContext = {
                traceId: X(),
                sampleRand: M()
            }
        }
    }
    t.s(["f", 0, ti], 778824);
    let ts = t => t instanceof Promise && !t[ta],
        ta = Symbol("chained PromiseLike"),
        to = (t, e, n) => {
            let r = t.then(t => (e(t), t), t => {
                throw n(t), t
            });
            return ts(r) && ts(t) ? r : tc(t, r)
        },
        tc = (t, e) => {
            if (!e) return t;
            let n = !1;
            for (let r in t) {
                if (r in e) continue;
                n = !0;
                let i = t[r];
                "function" == typeof i ? Object.defineProperty(e, r, {
                    value: function() {
                        for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                        return i.apply(t, n)
                    },
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[r] = i
            }
            return n && Object.assign(e, {
                [ta]: !0
            }), e
        };
    t.s(["f", 0, to], 709660);
    class tu {
        withScope(t) {
            let e, n = this._pushScope();
            try {
                e = t(n)
            } catch (t) {
                throw this._popScope(), t
            }
            return b(e) ? to(e, () => this._popScope(), () => this._popScope()) : (this._popScope(), e)
        }
        getClient() {
            return this.getStackTop().client
        }
        getScope() {
            return this.getStackTop().scope
        }
        getIsolationScope() {
            return this._isolationScope
        }
        getStackTop() {
            return this._stack[this._stack.length - 1]
        }
        _pushScope() {
            let t = this.getScope().clone();
            return this._stack.push({
                client: this.getClient(),
                scope: t
            }), t
        }
        _popScope() {
            return !(this._stack.length <= 1) && !!this._stack.pop()
        }
        constructor(t, e) {
            let n, r;
            n = t || new ti, r = e || new ti, this._stack = [{
                scope: n
            }], this._isolationScope = r
        }
    }

    function tl() {
        let t = c(o());
        return t.stack = t.stack || new tu(u("defaultCurrentScope", () => new ti), u("defaultIsolationScope", () => new ti))
    }

    function td(t) {
        return tl().withScope(t)
    }

    function tp(t, e) {
        let n = tl();
        return n.withScope(() => (n.getStackTop().scope = t, e(t)))
    }

    function tf(t) {
        return tl().withScope(() => t(tl().getIsolationScope()))
    }

    function th(t) {
        let e = c(t);
        return e.acs ? e.acs : {
            withIsolationScope: tf,
            withScope: td,
            withSetScope: tp,
            withSetIsolationScope: (t, e) => tf(e),
            getCurrentScope: () => tl().getScope(),
            getIsolationScope: () => tl().getIsolationScope()
        }
    }

    function t_() {
        return th(o()).getCurrentScope()
    }
    t.s(["f", 0, th], 754177), t.s(["l", 0, function() {
        return t_().getClient()
    }, "d", 0, t_, "J", 0, function() {
        return u("globalScope", () => new ti)
    }, "V", 0, function() {
        return th(o()).getIsolationScope()
    }, "i", 0, function(t) {
        let e = null == i ? void 0 : i();
        if (e) return {
            trace_id: e.traceId,
            span_id: e.spanId
        };
        let {
            traceId: n,
            parentSpanId: r,
            propagationSpanId: s
        } = t.getPropagationContext(), a = {
            trace_id: n,
            span_id: s || tt()
        };
        return r && (a.parent_span_id = r), a
    }, "K", 0, function() {
        return void 0 !== i
    }, "L", 0, function() {
        for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
        let r = th(o());
        if (2 === e.length) {
            let [t, n] = e;
            return t ? r.withSetIsolationScope(t, n) : r.withIsolationScope(n)
        }
        return r.withIsolationScope(e[0])
    }, "h", 0, function() {
        for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
        let r = th(o());
        if (2 === e.length) {
            let [t, n] = e;
            return t ? r.withSetScope(t, n) : r.withScope(n)
        }
        return r.withScope(e[0])
    }], 505099), t.s(["E", 0, "gen_ai.conversation.id", "_", 0, "sentry.exclusive_time", "G", 0, "http.request.method", "q", 0, "sentry.profile_id", "j", 0, "sentry.custom_span_name", "F", 0, "sentry.environment", "i", 0, "sentry.idle_span_finish_reason", "B", 0, "sentry.measurement_unit", "x", 0, "sentry.measurement_value", "o", 0, "sentry.op", "u", 0, "sentry.origin", "t", 0, "sentry.previous_trace_sample_rate", "e", 0, "sentry.release", "s", 0, "sentry.sample_rate", "p", 0, "sentry.sdk.name", "z", 0, "sentry.sdk.version", "k", 0, "sentry.segment.id", "r", 0, "sentry.segment.name", "U", 0, "sentry.source", "g", 0, "url.full", "v", 0, "user.email", "J", 0, "user.id", "w", 0, "user.ip_address", "y", 0, "user.name", "S", 0, "sentry.link.type"], 750672)
}, 209754, 929559, 147540, 310586, 351591, t => {
    "use strict";
    let e, n, r, i;
    var s = t.i(505099),
        a = t.i(33098),
        o = t.i(812268),
        c = t.i(754177),
        u = t.i(813705),
        l = t.i(750672);
    t.i(179423);
    var d = t.i(973716);
    t.i(423703);
    var p = t.i(191329),
        f = t.i(334006),
        h = t.i(603820),
        _ = t.i(236716),
        g = t.i(329282),
        m = t.i(167178),
        v = t.i(46870),
        y = t.i(706854);
    t.i(445809);
    var b = t.i(439470),
        S = t.i(570326),
        x = t.i(538392),
        k = t.i(774959),
        E = t.i(882086);
    t.i(27472);
    var I = t.i(650220);

    function w(t, e) {
        let n = O();
        return n.withActiveSpan ? n.withActiveSpan(t, e) : (0, s.h)(n => ((0, v._)(n, t || void 0), e(n)))
    }

    function O() {
        let t = (0, u.t)();
        return (0, c.f)(t)
    }

    function T(t, e, n) {
        var r, i;
        let o = (0, s.l)(),
            c = (null == o ? void 0 : o.getOptions()) || {},
            {
                name: u = ""
            } = t,
            p = {
                spanAttributes: {
                    ...t.attributes
                },
                spanName: u,
                parentSampled: n
            };
        null == o || o.emit("beforeSampling", p, {
            decision: !1
        });
        let f = null != (r = p.parentSampled) ? r : n,
            g = p.spanAttributes,
            m = e.getPropagationContext(),
            v = A(e),
            [y, b, S] = v ? [!1] : (0, x.f)(c, {
                name: u,
                parentSampled: f,
                attributes: g,
                parentSampleRate: (0, _.f)(null == (i = m.dsc) ? void 0 : i.sample_rate)
            }, m.sampleRand),
            k = new E.f({
                ...t,
                attributes: {
                    [l.U]: "custom",
                    [l.s]: void 0 !== b && S ? b : void 0,
                    ...g
                },
                sampled: y
            });
        return y || !o || v || (a.f && d.h.log("[Tracing] Discarding root span because its trace was not chosen to be sampled."), o.recordDroppedEvent("sample_rate", (0, h.f)(o) ? "span" : "transaction")), o && o.emit("spanStart", k), k
    }

    function A(t) {
        return !0 === t.getScopeData().sdkProcessingMetadata.__SENTRY_SUPPRESS_TRACING__
    }
    t.s(["e", 0, function(t) {
        let e = O();
        if (e.startInactiveSpan) return e.startInactiveSpan(t);
        let n = function(t) {
                let e = {
                    isStandalone: (t.experimental || {}).standalone,
                    ...t
                };
                if (t.startTime) {
                    let n = {
                        ...e
                    };
                    return n.startTimestamp = (0, y.k)(t.startTime), delete n.startTime, n
                }
                return e
            }(t),
            {
                forceTransaction: r,
                parentSpan: i
            } = t;
        return (t.scope ? e => (0, s.h)(t.scope, e) : void 0 !== i ? t => w(i, t) : t => t())(() => {
            let e = (0, s.d)(),
                a = function(t, e) {
                    if (e) return e;
                    if (null === e) return;
                    let n = (0, v.c)(t);
                    if (!n) return;
                    let r = (0, s.l)();
                    return (r ? r.getOptions() : {}).parentSpanIsAlwaysRootSpan ? (0, y.e)(n) : n
                }(e, i),
                o = (0, s.l)();
            return t.onlyIfParent && !a ? (null == o || o.recordDroppedEvent("no_parent_span", "span"), new k.f) : function(t) {
                var e, n, r, i;
                let a, o, {
                    parentSpan: c,
                    spanArguments: u,
                    forceTransaction: d,
                    scope: _
                } = t;
                if (!(0, p.f)()) {
                    let t = new k.f;
                    if (d || !c) {
                        let e = {
                            sampled: "false",
                            sample_rate: "0",
                            transaction: u.name,
                            ...(0, b.O)(t)
                        };
                        (0, b.m)(t, e)
                    }
                    return t
                }
                let g = (0, s.l)();
                if (e = g, n = u, a = null == e ? void 0 : e.getOptions().ignoreSpans, e && (0, h.f)(e) && (null == a ? void 0 : a.length) && (0, f.s)({
                        description: n.name || "",
                        op: (null == (r = n.attributes) ? void 0 : r[l.o]) || n.op,
                        attributes: n.attributes
                    }, a)) {
                    return A(_) || null == g || g.recordDroppedEvent("ignored", "span"), new k.f({
                        dropReason: "ignored",
                        traceId: null != (i = null == c ? void 0 : c.spanContext().traceId) ? i : _.getPropagationContext().traceId
                    })
                }
                let m = (0, s.V)();
                if (c && !d) o = function(t, e, n) {
                    let {
                        spanId: r,
                        traceId: i
                    } = t.spanContext(), a = A(e), o = !a && (0, y.S)(t), c = o ? new E.f({
                        ...n,
                        parentSpanId: r,
                        traceId: i,
                        sampled: o
                    }) : new k.f({
                        traceId: i
                    });
                    (0, y.P)(t, c);
                    let u = (0, s.l)();
                    return u && ((0, h.f)(u) && c instanceof k.f && (t instanceof k.f && t.dropReason ? (c.dropReason = t.dropReason, u.recordDroppedEvent(t.dropReason, "span")) : a || (c.dropReason = "sample_rate", u.recordDroppedEvent("sample_rate", "span"))), u.emit("spanStart", c), n.endTimestamp && (u.emit("spanEnd", c), u.emit("afterSpanEnd", c))), c
                }(c, _, u), (0, y.P)(c, o);
                else if (c) {
                    let t = (0, b.O)(c),
                        {
                            traceId: e,
                            spanId: n
                        } = c.spanContext(),
                        r = (0, y.S)(c);
                    o = T({
                        traceId: e,
                        parentSpanId: n,
                        ...u
                    }, _, r), (0, b.m)(o, t)
                } else {
                    let {
                        traceId: t,
                        dsc: e,
                        parentSpanId: n,
                        sampled: r
                    } = {
                        ...m.getPropagationContext(),
                        ..._.getPropagationContext()
                    };
                    o = T({
                        traceId: t,
                        parentSpanId: n,
                        ...u
                    }, _, r), e && (0, b.m)(o, e)
                }
                return (0, S.h)(o), (0, I.q)(o, _, m), o
            }({
                parentSpan: a,
                spanArguments: n,
                forceTransaction: r,
                scope: e
            })
        })
    }, "A", 0, function(t) {
        let e = O();
        return e.startNewTrace ? e.startNewTrace(t) : (0, s.h)(e => (e.setPropagationContext({
            traceId: (0, g.u)(),
            sampleRand: (0, m.T)()
        }), a.f && d.h.log("Starting a new trace with id ".concat(e.getPropagationContext().traceId)), w(null, t)))
    }, "D", 0, w], 929559);
    var C = t.i(53341),
        D = t.i(669043),
        N = t.i(284207);

    function j(t) {
        return new R(e => {
            e(t)
        })
    }

    function P(t) {
        return new R((e, n) => {
            n(t)
        })
    }
    class R {
        then(t, e) {
            return new R((n, r) => {
                this._handlers.push([!1, e => {
                    if (t) try {
                        n(t(e))
                    } catch (t) {
                        r(t)
                    } else n(e)
                }, t => {
                    if (e) try {
                        n(e(t))
                    } catch (t) {
                        r(t)
                    } else r(t)
                }]), this._executeHandlers()
            })
        } catch (t) {
            return this.then(t => t, t)
        } finally(t) {
            return new R((e, n) => {
                let r, i;
                return this.then(e => {
                    i = !1, r = e, t && t()
                }, e => {
                    i = !0, r = e, t && t()
                }).then(() => {
                    i ? n(r) : e(r)
                })
            })
        }
        _executeHandlers() {
            if (0 === this._state) return;
            let t = this._handlers.slice();
            this._handlers = [], t.forEach(t => {
                t[0] || (1 === this._state && t[1](this._value), 2 === this._state && t[2](this._value), t[0] = !0)
            })
        }
        _runExecutor(t) {
            let e = (t, e) => {
                    if (0 === this._state) {
                        if ((0, C.l)(e)) return void e.then(n, r);
                        this._state = t, this._value = e, this._executeHandlers()
                    }
                },
                n = t => {
                    e(1, t)
                },
                r = t => {
                    e(2, t)
                };
            try {
                t(n, r)
            } catch (t) {
                r(t)
            }
        }
        constructor(t) {
            this._state = 0, this._handlers = [], this._runExecutor(t)
        }
    }
    t.s(["K", 0, P, "Y", 0, j], 147540);
    var M = t.i(778824);
    t.i(900403);
    var L = t.i(242734),
        U = t.i(521196),
        J = t.i(445228);

    function V(t, e) {
        var n, r, i, s, a, o, c, u;
        let l, d, p, {
            fingerprint: f,
            span: h,
            breadcrumbs: _,
            sdkProcessingMetadata: g
        } = e;
        (function(t, e) {
            let {
                extra: n,
                tags: r,
                user: i,
                contexts: s,
                level: a,
                transactionName: o
            } = e;
            Object.keys(n).length && (t.extra = {
                ...n,
                ...t.extra
            }), Object.keys(r).length && (t.tags = {
                ...r,
                ...t.tags
            }), Object.keys(i).length && (t.user = {
                ...i,
                ...t.user
            }), Object.keys(s).length && (t.contexts = {
                ...s,
                ...t.contexts
            }), a && (t.level = a), o && "transaction" !== t.type && (t.transaction = o)
        })(t, e), h && (n = t, r = h, n.contexts = {
            trace: (0, y.m)(r),
            ...n.contexts
        }, n.sdkProcessingMetadata = {
            dynamicSamplingContext: (0, b.O)(r),
            ...n.sdkProcessingMetadata
        }, l = (0, y.e)(r), (d = (0, y.l)(l).description) && !n.transaction && "transaction" === n.type && (n.transaction = d)), i = t, s = f, i.fingerprint = i.fingerprint ? Array.isArray(i.fingerprint) ? i.fingerprint : [i.fingerprint] : [], s && (i.fingerprint = i.fingerprint.concat(s)), i.fingerprint.length || delete i.fingerprint, a = t, o = _, p = [...a.breadcrumbs || [], ...o], a.breadcrumbs = p.length ? p : void 0, c = t, u = g, c.sdkProcessingMetadata = {
            ...c.sdkProcessingMetadata,
            ...u
        }
    }

    function F(t, e) {
        let {
            extra: n,
            tags: r,
            attributes: i,
            user: s,
            contexts: a,
            level: o,
            sdkProcessingMetadata: c,
            breadcrumbs: u,
            fingerprint: l,
            eventProcessors: d,
            attachments: p,
            propagationContext: f,
            transactionName: h,
            span: _
        } = e;
        z(t, "extra", n), z(t, "tags", r), z(t, "attributes", i), z(t, "user", s), z(t, "contexts", a), t.sdkProcessingMetadata = (0, J.f)(t.sdkProcessingMetadata, c, 2), o && (t.level = o), h && (t.transactionName = h), _ && (t.span = _), u.length && (t.breadcrumbs = [...t.breadcrumbs, ...u]), l.length && (t.fingerprint = [...t.fingerprint, ...l]), d.length && (t.eventProcessors = [...t.eventProcessors, ...d]), p.length && (t.attachments = [...t.attachments, ...p]), t.propagationContext = {
            ...t.propagationContext,
            ...f
        }
    }

    function z(t, e, n) {
        t[e] = (0, J.f)(t[e], n, 1)
    }

    function B(t, e) {
        let n = (0, s.J)().getScopeData();
        return t && F(n, t.getScopeData()), e && F(n, e.getScopeData()), n
    }
    t.s(["Y", 0, V, "Z", 0, B], 310586);
    var Y = t.i(182133),
        H = t.i(825142);

    function K(t) {
        if (t) {
            var e;
            return (e = t) instanceof M.f || "function" == typeof e || Object.keys(t).some(t => W.includes(t)) ? {
                captureContext: t
            } : t
        }
    }
    let W = ["user", "level", "extra", "contexts", "tags", "fingerprint", "propagationContext"];

    function q() {
        let t = (0, s.V)(),
            e = (0, s.d)().getSession() || t.getSession();
        e && (0, o.n)(e), G(), t.setSession()
    }

    function G() {
        let t = (0, s.V)(),
            e = (0, s.l)(),
            n = t.getSession();
        n && e && e.captureSession(n)
    }
    t.s(["a", 0, K, "H", 0, function(t, s, o, c, u, l) {
        var p, f, h, _, g;
        let m, {
                normalizeDepth: v = 3,
                normalizeMaxBreadth: y = 1e3
            } = t,
            b = {
                ...s,
                event_id: s.event_id || o.event_id || (0, D.c)(),
                timestamp: s.timestamp || (0, H.i)()
            },
            S = o.integrations || t.integrations.map(t => t.name);
        (function(t, e) {
            let {
                environment: n,
                release: r,
                dist: i,
                maxValueLength: s
            } = e;
            t.environment = t.environment || n || N.f, !t.release && r && (t.release = r), !t.dist && i && (t.dist = i);
            let a = t.request;
            if ((null == a ? void 0 : a.url) && s && (a.url = (0, Y.k)(a.url, s)), s) {
                var o, c;
                null == (c = t.exception) || null == (o = c.values) || o.forEach(t => {
                    t.value && (t.value = (0, Y.k)(t.value, s))
                })
            }
        })(b, t), p = b, (f = S).length > 0 && (p.sdk = p.sdk || {}, p.sdk.integrations = [...p.sdk.integrations || [], ...f]), u && u.emit("applyFrameMetadata", s), void 0 === s.type && (h = b, m = function(t) {
            let s = L.f._sentryDebugIds,
                a = L.f._debugIds;
            if (!s && !a) return {};
            let o = s ? Object.keys(s) : [],
                c = a ? Object.keys(a) : [];
            if (i && o.length === n && c.length === r) return i;
            n = o.length, r = c.length, i = {}, e || (e = {});
            let u = (n, r) => {
                for (let s of n) {
                    let n = r[s],
                        a = null == e ? void 0 : e[s];
                    if (a && i && n) i[a[0]] = n, e && (e[s] = [a[0], n]);
                    else if (n) {
                        let r = t(s);
                        for (let t = r.length - 1; t >= 0; t--) {
                            let a = r[t],
                                o = null == a ? void 0 : a.filename;
                            if (o && i && e) {
                                i[o] = n, e[s] = [o, n];
                                break
                            }
                        }
                    }
                }
            };
            return s && u(o, s), a && u(c, a), i
        }(t.stackParser), null == (g = h.exception) || null == (_ = g.values) || _.forEach(t => {
            var e, n;
            null == (n = t.stacktrace) || null == (e = n.frames) || e.forEach(t => {
                t.filename && (t.debug_id = m[t.filename])
            })
        }));
        let x = function(t, e) {
            if (!e) return t;
            let n = t ? t.clone() : new M.f;
            return n.update(e), n
        }(c, o.captureContext);
        o.mechanism && (0, D.o)(b, o.mechanism);
        let k = u ? u.getEventProcessors() : [],
            E = B(l, x),
            I = [...o.attachments || [], ...E.attachments];
        I.length && (o.attachments = I), V(b, E);
        let w = [...k, ...E.eventProcessors];
        return (o.data && !0 === o.data.__sentry__ ? j(b) : function(t, e, n) {
            let r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : 0;
            try {
                let i = function t(e, n, r, i) {
                    let s = r[i];
                    if (!e || !s) return e;
                    let o = s({
                        ...e
                    }, n);
                    return (a.f && null === o && d.h.log('Event processor "'.concat(s.id || "?", '" dropped event')), (0, C.l)(o)) ? o.then(e => t(e, n, r, i + 1)) : t(o, n, r, i + 1)
                }(e, n, t, r);
                return (0, C.l)(i) ? i : j(i)
            } catch (t) {
                return P(t)
            }
        }(w, b, o)).then(t => (t && function(t) {
            var e, n;
            let r = {};
            if (null == (n = t.exception) || null == (e = n.values) || e.forEach(t => {
                    var e, n;
                    null == (n = t.stacktrace) || null == (e = n.frames) || e.forEach(t => {
                        t.debug_id && (t.abs_path ? r[t.abs_path] = t.debug_id : t.filename && (r[t.filename] = t.debug_id), delete t.debug_id)
                    })
                }), 0 === Object.keys(r).length) return;
            t.debug_meta = t.debug_meta || {}, t.debug_meta.images = t.debug_meta.images || [];
            let i = t.debug_meta.images;
            Object.entries(r).forEach(t => {
                let [e, n] = t;
                i.push({
                    type: "sourcemap",
                    code_file: e,
                    debug_id: n
                })
            })
        }(t), "number" == typeof v && v > 0) ? function(t, e, n) {
            var r, i;
            if (!t) return null;
            let s = {
                ...t,
                ...t.breadcrumbs && {
                    breadcrumbs: t.breadcrumbs.map(t => ({
                        ...t,
                        ...t.data && {
                            data: (0, U.S)(t.data, e, n)
                        }
                    }))
                },
                ...t.user && {
                    user: (0, U.S)(t.user, e, n)
                },
                ...t.contexts && {
                    contexts: (0, U.S)(t.contexts, e, n)
                },
                ...t.extra && {
                    extra: (0, U.S)(t.extra, e, n)
                }
            };
            return (null == (r = t.contexts) ? void 0 : r.trace) && s.contexts && (s.contexts.trace = t.contexts.trace, t.contexts.trace.data && (s.contexts.trace.data = (0, U.S)(t.contexts.trace.data, e, n))), t.spans && (s.spans = t.spans.map(t => ({
                ...t,
                ...t.data && {
                    data: (0, U.S)(t.data, e, n)
                }
            }))), (null == (i = t.contexts) ? void 0 : i.flags) && s.contexts && (s.contexts.flags = (0, U.S)(t.contexts.flags, 3, n)), s
        }(t, v, y) : t)
    }], 351591), t.s(["A", 0, function(t) {
        (0, s.V)().addEventProcessor(t)
    }, "f", 0, function(t, e) {
        return (0, s.d)().captureEvent(t, e)
    }, "y", 0, function(t, e) {
        return (0, s.d)().captureException(t, K(e))
    }, "T", 0, function(t, e) {
        let n = "string" == typeof e ? e : void 0,
            r = "string" != typeof e ? {
                captureContext: e
            } : void 0;
        return (0, s.d)().captureMessage(t, n, r)
    }, "L", 0, function() {
        let t = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
        t ? q() : G()
    }, "B", 0, function() {
        let t = (0, s.l)();
        return (null == t ? void 0 : t.getOptions().enabled) !== !1 && !!(null == t ? void 0 : t.getTransport())
    }, "d", 0, function() {
        return (0, s.V)().lastEventId()
    }, "g", 0, function(t, e) {
        (0, s.V)().setContext(t, e)
    }, "z", 0, function(t, e) {
        (0, s.V)().setTag(t, e)
    }, "M", 0, function(t) {
        let e = (0, s.V)(),
            {
                user: n
            } = B(e, (0, s.d)()),
            {
                userAgent: r
            } = L.f.navigator || {},
            i = (0, o.r)({
                user: n,
                ...r && {
                    userAgent: r
                },
                ...t
            }),
            a = e.getSession();
        return (null == a ? void 0 : a.status) === "ok" && (0, o.d)(a, {
            status: "exited"
        }), q(), e.setSession(i), i
    }], 209754)
}, 570326, t => {
    "use strict";
    var e = t.i(33098),
        n = t.i(973716),
        r = t.i(706854);
    t.s(["j", 0, function(t) {
        if (!e.f) return;
        let {
            description: i = "< unknown name >",
            op: s = "< unknown op >"
        } = (0, r.l)(t), {
            spanId: a
        } = t.spanContext(), o = (0, r.e)(t) === t, c = '[Tracing] Finishing "'.concat(s, '" ').concat(o ? "root " : "", 'span "').concat(i, '" with ID ').concat(a);
        n.h.log(c)
    }, "h", 0, function(t) {
        if (!e.f) return;
        let {
            description: i = "< unknown name >",
            op: s = "< unknown op >",
            parent_span_id: a
        } = (0, r.l)(t), {
            spanId: o
        } = t.spanContext(), c = (0, r.S)(t), u = (0, r.e)(t), l = u === t, d = "[Tracing] Starting ".concat(c ? "sampled" : "unsampled", " ").concat(l ? "root " : "", "span"), p = ["op: ".concat(s), "name: ".concat(i), "ID: ".concat(o)];
        if (a && p.push("parent ID: ".concat(a)), !l) {
            let {
                op: t,
                description: e
            } = (0, r.l)(u);
            p.push("root ID: ".concat(u.spanContext().spanId)), t && p.push("root op: ".concat(t)), e && p.push("root description: ".concat(e))
        }
        n.h.log("".concat(d, "\n  ").concat(p.join("\n  ")))
    }])
}, 624695, t => {
    "use strict";
    var e = t.i(33098),
        n = t.i(750672),
        r = t.i(973716),
        i = t.i(706854);
    t.s(["Y", 0, function(t, s, a) {
        let o = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : (0, i.j)(),
            c = o && (0, i.e)(o);
        c && (e.f && r.h.log("[Measurement] Setting measurement on root span: ".concat(t, " = ").concat(s, " ").concat(a)), c.addEvent(t, {
            [n.x]: s,
            [n.B]: a
        }))
    }, "t", 0, function(t) {
        if (!t || 0 === t.length) return;
        let e = {};
        return t.forEach(t => {
            let r = t.attributes || {},
                i = r[n.B],
                s = r[n.x];
            "string" == typeof i && "number" == typeof s && (e[t.name] = {
                value: s,
                unit: i
            })
        }), e
    }])
}, 538392, t => {
    "use strict";
    var e = t.i(33098),
        n = t.i(973716),
        r = t.i(191329),
        i = t.i(236716);
    t.s(["f", 0, function(t, s, a) {
        let o, c;
        if (!(0, r.f)(t)) return [!1];
        "function" == typeof t.tracesSampler ? (o = t.tracesSampler({
            ...s,
            inheritOrSampleWith: t => "number" == typeof s.parentSampleRate ? s.parentSampleRate : "boolean" == typeof s.parentSampled ? Number(s.parentSampled) : t
        }), c = !0) : void 0 !== s.parentSampled ? o = s.parentSampled : void 0 !== t.tracesSampleRate && (o = t.tracesSampleRate, c = !0);
        let u = (0, i.f)(o);
        if (void 0 === u) return e.f && n.h.warn("[Tracing] Discarding root span because of invalid sample rate. Sample rate must be a boolean or a number between 0 and 1. Got ".concat(JSON.stringify(o), " of type ").concat(JSON.stringify(typeof o), ".")), [!1];
        if (!u) return e.f && n.h.log("[Tracing] Discarding transaction because ".concat("function" == typeof t.tracesSampler ? "tracesSampler returned 0 or false" : "a negative sampling decision was inherited or tracesSampleRate is set to 0")), [!1, u, c];
        let l = a < u;
        return !l && e.f && n.h.log("[Tracing] Discarding transaction because it's not included in the random sample (sampling rate = ".concat(Number(o), ")")), [l, u, c]
    }])
}, 774959, 633015, 521196, 322375, 284612, t => {
    "use strict";
    var e = t.i(329282),
        n = t.i(706854);
    t.s(["f", 0, class {
        spanContext() {
            return {
                spanId: this._spanId,
                traceId: this._traceId,
                traceFlags: n.i
            }
        }
        end(t) {}
        setAttribute(t, e) {
            return this
        }
        setAttributes(t) {
            return this
        }
        setStatus(t) {
            return this
        }
        updateName(t) {
            return this
        }
        isRecording() {
            return !1
        }
        addEvent(t, e, n) {
            return this
        }
        addLink(t) {
            return this
        }
        addLinks(t) {
            return this
        }
        recordException(t, e) {}
        constructor(t = {}) {
            this._traceId = t.traceId || (0, e.u)(), this._spanId = t.spanId || (0, e.d)(), this.dropReason = t.dropReason
        }
    }], 774959);
    var r = t.i(439470),
        i = t.i(506929);

    function s(t) {
        return !!t && "function" == typeof t && "_streamed" in t && !!t._streamed
    }
    t.s(["f", 0, s], 633015);
    var a = t.i(589699),
        o = t.i(813705),
        c = t.i(53341);
    let u = Symbol.for("sentry.skipNormalization"),
        l = Symbol.for("sentry.overrideNormalizationDepth");
    var d = t.i(900403);

    function p(e) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 100,
            r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 1 / 0;
        try {
            return function e(n, r) {
                let s, a, o = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 1 / 0,
                    p = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : 1 / 0,
                    f = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : (s = new WeakSet, [function(t) {
                        return !!s.has(t) || (s.add(t), !1)
                    }, function(t) {
                        s.delete(t)
                    }]),
                    [h, _] = f;
                if (null == r || ["boolean", "string"].includes(typeof r) || "number" == typeof r && Number.isFinite(r)) return r;
                let g = function(e, n) {
                    try {
                        var r;
                        let i;
                        if ("domain" === e && n && "object" == typeof n && n._events) return "[Domain]";
                        if ("domainEmitter" === e) return "[DomainEmitter]";
                        if (n === t.g) return "[Global]";
                        if ("u" > typeof window && n === window) return "[Window]";
                        if ("u" > typeof document && n === document) return "[Document]";
                        if ((0, c.c)(n)) return (0, d.f)(n);
                        if ((0, c.f)(n)) return "[SyntheticEvent]";
                        if ("number" == typeof n && !Number.isFinite(n)) return "[".concat(n, "]");
                        if ("function" == typeof n) return "[Function: ".concat((0, d.n)(n), "]");
                        if ("symbol" == typeof n) return "[".concat(String(n), "]");
                        if ("bigint" == typeof n) return "[BigInt: ".concat(String(n), "]");
                        let s = (r = n, i = Object.getPrototypeOf(r), (null == i ? void 0 : i.constructor) ? i.constructor.name : "null prototype");
                        if (/^HTML(\w*)Element$/.test(s)) return "[HTMLElement: ".concat(s, "]");
                        return "[object ".concat(s, "]")
                    } catch (t) {
                        return "**non-serializable** (".concat(t, ")")
                    }
                }(n, r);
                if (!g.startsWith("[object ")) return g;
                if (r[u]) return r;
                let m = "number" == typeof(a = r[l]) ? a : void 0,
                    v = void 0 !== m ? m : o;
                if (0 === v) return g.replace("object ", "");
                if (h(r)) return "[Circular ~]";
                if (r && "function" == typeof r.toJSON) try {
                    let t = r.toJSON();
                    return e("", t, v - 1, p, f)
                } catch (t) {}
                let y = Array.isArray(r) ? [] : {},
                    b = 0,
                    S = (0, i.F)(r);
                for (let t in S) {
                    if (!Object.prototype.hasOwnProperty.call(S, t)) continue;
                    if (b >= p) {
                        y[t] = "[MaxProperties ~]";
                        break
                    }
                    let n = S[t];
                    y[t] = e(t, n, v - 1, p, f), b++
                }
                return _(r), y
            }("", e, n, r)
        } catch (t) {
            return {
                ERROR: "**non-serializable** (".concat(t, ")")
            }
        }
    }
    t.s(["S", 0, p, "B", 0, function t(e) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 3,
            r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 102400,
            i = p(e, n);
        return ~-encodeURI(JSON.stringify(i)).split(/%..|./).length > r ? t(e, n - 1, r) : i
    }], 521196);
    var f = t.i(242734);

    function h(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [];
        return [t, e]
    }

    function _(t, e) {
        for (let n of t[1]) {
            let t = n[0].type;
            if (e(n, t)) return !0
        }
        return !1
    }

    function g(t) {
        let e = (0, o.y)(f.f);
        return e.encodePolyfill ? e.encodePolyfill(t) : new TextEncoder().encode(t)
    }

    function m(t) {
        return [{
            type: "span"
        }, t]
    }
    let v = {
        sessions: "session",
        event: "error",
        client_report: "internal",
        user_report: "default",
        profile_chunk: "profile",
        replay_event: "replay",
        replay_recording: "replay",
        check_in: "monitor",
        raw_security: "security",
        log: "log_item",
        trace_metric: "metric"
    };

    function y(t) {
        if (!(null == t ? void 0 : t.sdk)) return;
        let {
            name: e,
            version: n
        } = t.sdk;
        return {
            name: e,
            version: n
        }
    }

    function b(t, e, n, r) {
        var i;
        let s = null == (i = t.sdkProcessingMetadata) ? void 0 : i.dynamicSamplingContext;
        return {
            event_id: t.event_id,
            sent_at: new Date().toISOString(),
            ...e && {
                sdk: e
            },
            ...!!n && r && {
                dsn: (0, a._)(r)
            },
            ...s && {
                trace: s
            }
        }
    }
    t.s(["S", 0, function(t, e) {
        let [n, r] = t;
        return [n, [...r, e]]
    }, "i", 0, function(t) {
        let e = "string" == typeof t.data ? g(t.data) : t.data;
        return [{
            type: "attachment",
            length: e.length,
            filename: t.filename,
            content_type: t.contentType,
            attachment_type: t.attachmentType
        }, e]
    }, "H", 0, h, "w", 0, b, "q", 0, m, "Q", 0, function(t, e) {
        return _(t, (t, n) => e.includes(n))
    }, "h", 0, function(t) {
        return t in v ? v[t] : t
    }, "E", 0, _, "X", 0, y, "k", 0, function(t) {
        let [e, n] = t, r = JSON.stringify(e);

        function i(t) {
            "string" == typeof r ? r = "string" == typeof t ? r + t : [g(r), t] : r.push("string" == typeof t ? g(t) : t)
        }
        for (let t of n) {
            let [e, n] = t;
            if (i("\n".concat(JSON.stringify(e), "\n")), "string" == typeof n || n instanceof Uint8Array) i(n);
            else {
                let t;
                try {
                    t = JSON.stringify(n)
                } catch (e) {
                    t = JSON.stringify(p(n))
                }
                i(t)
            }
        }
        return "string" == typeof r ? r : function(t) {
            let e = new Uint8Array(t.reduce((t, e) => t + e.length, 0)),
                n = 0;
            for (let r of t) e.set(r, n), n += r.length;
            return e
        }(r)
    }], 322375);
    var S = t.i(334006);
    t.s(["D", 0, function(t, e, n, r) {
        let i = y(n),
            s = t.type && "replay_event" !== t.type ? t.type : "event";
        ! function(t, e) {
            var n, r, i, s;
            if (!e) return;
            let a = t.sdk || {};
            t.sdk = {
                ...a,
                name: a.name || e.name,
                version: a.version || e.version,
                integrations: [...(null == (n = t.sdk) ? void 0 : n.integrations) || [], ...e.integrations || []],
                packages: [...(null == (r = t.sdk) ? void 0 : r.packages) || [], ...e.packages || []],
                settings: (null == (i = t.sdk) ? void 0 : i.settings) || e.settings ? {
                    ...null == (s = t.sdk) ? void 0 : s.settings,
                    ...e.settings
                } : void 0
            }
        }(t, null == n ? void 0 : n.sdk);
        let a = b(t, i, r, e);
        return delete t.sdkProcessingMetadata, h(a, [
            [{
                type: s
            }, t]
        ])
    }, "E", 0, function(t, e, n, r) {
        let i = y(n);
        return h({
            sent_at: new Date().toISOString(),
            ...i && {
                sdk: i
            },
            ...!!r && e && {
                dsn: (0, a._)(e)
            }
        }, ["aggregates" in t ? [{
            type: "sessions"
        }, t] : [{
            type: "session"
        }, t.toJSON()]])
    }, "l", 0, function(t, e) {
        let i = (0, r.O)(t[0]),
            o = null == e ? void 0 : e.getDsn(),
            c = null == e ? void 0 : e.getOptions().tunnel,
            u = {
                sent_at: new Date().toISOString(),
                ...!!i.trace_id && !!i.public_key && {
                    trace: i
                },
                ...!!c && o && {
                    dsn: (0, a._)(o)
                }
            },
            {
                beforeSendSpan: l,
                ignoreSpans: d
            } = (null == e ? void 0 : e.getOptions()) || {},
            p = (null == d ? void 0 : d.length) ? t.filter(t => {
                let e = (0, n.l)(t);
                return !(0, S.s)({
                    description: e.description,
                    op: e.op,
                    attributes: e.data
                }, d)
            }) : t,
            f = t.length - p.length;
        f && (null == e || e.recordDroppedEvent("before_send", "span", f));
        let _ = l ? t => {
                let e = (0, n.l)(t),
                    r = s(l) ? e : l(e);
                return r || ((0, n.x)(), e)
            } : n.l,
            g = [];
        for (let t of p) {
            let e = _(t);
            e && g.push(m(e))
        }
        return h(u, g)
    }], 284612)
}, 882086, t => {
    "use strict";
    var e = t.i(505099),
        n = t.i(33098),
        r = t.i(284612),
        i = t.i(750672),
        s = t.i(973716),
        a = t.i(329282),
        o = t.i(706854),
        c = t.i(825142),
        u = t.i(439470),
        l = t.i(570326),
        d = t.i(624695),
        p = t.i(603820),
        f = t.i(650220);

    function h(t) {
        return t && "number" == typeof t || t instanceof Date || Array.isArray(t)
    }

    function _(t) {
        return !!t.start_timestamp && !!t.timestamp && !!t.span_id && !!t.trace_id
    }
    t.s(["f", 0, class t {
        addLink(t) {
            return this._links ? this._links.push(t) : this._links = [t], this
        }
        addLinks(t) {
            return this._links ? this._links.push(...t) : this._links = t, this
        }
        recordException(t, e) {}
        spanContext() {
            let {
                _spanId: t,
                _traceId: e,
                _sampled: n
            } = this;
            return {
                spanId: t,
                traceId: e,
                traceFlags: n ? o.n : o.i
            }
        }
        setAttribute(t, e) {
            return void 0 === e ? delete this._attributes[t] : this._attributes[t] = e, this
        }
        setAttributes(t) {
            return Object.keys(t).forEach(e => this.setAttribute(e, t[e])), this
        }
        updateStartTime(t) {
            this._startTime = (0, o.k)(t)
        }
        setStatus(t) {
            return this._status = t, this
        }
        updateName(t) {
            return this._name = t, this.setAttribute(i.U, "custom"), this
        }
        end(t) {
            this._endTime || (this._endTime = (0, o.k)(t), (0, l.j)(this), this._onSpanEnded())
        }
        getSpanJSON() {
            return {
                data: this._attributes,
                description: this._name,
                op: this._attributes[i.o],
                parent_span_id: this._parentSpanId,
                span_id: this._spanId,
                start_timestamp: this._startTime,
                status: (0, o.M)(this._status),
                timestamp: this._endTime,
                trace_id: this._traceId,
                origin: this._attributes[i.u],
                profile_id: this._attributes[i.q],
                exclusive_time: this._attributes[i._],
                measurements: (0, d.t)(this._events),
                is_segment: this._isStandaloneSpan && (0, o.e)(this) === this || void 0,
                segment_id: this._isStandaloneSpan ? (0, o.e)(this).spanContext().spanId : void 0,
                links: (0, o.Q)(this._links)
            }
        }
        getStreamedSpanJSON() {
            var t, e;
            return {
                name: null != (t = this._name) ? t : "",
                span_id: this._spanId,
                trace_id: this._traceId,
                parent_span_id: this._parentSpanId,
                start_timestamp: this._startTime,
                end_timestamp: null != (e = this._endTime) ? e : this._startTime,
                is_segment: this._isStandaloneSpan || this === (0, o.e)(this),
                status: (0, o.C)(this._status),
                attributes: this._attributes,
                links: (0, o.E)(this._links)
            }
        }
        isRecording() {
            return !this._endTime && !!this._sampled
        }
        addEvent(t, e, r) {
            n.f && s.h.log("[Tracing] Adding an event to span:", t);
            let i = h(e) ? e : r || (0, c.R)(),
                a = h(e) ? {} : e || {},
                u = {
                    name: t,
                    time: (0, o.k)(i),
                    attributes: a
                };
            return this._events.push(u), this
        }
        isStandaloneSpan() {
            return !!this._isStandaloneSpan
        }
        _onSpanEnded() {
            let t = (0, e.l)();
            if (t && (t.emit("spanEnd", this), this._isStandaloneSpan || t.emit("afterSpanEnd", this)), !(this._isStandaloneSpan || this === (0, o.e)(this))) return;
            if (this._isStandaloneSpan) return void(this._sampled ? function(t) {
                let n = (0, e.l)();
                if (!n) return;
                let r = t[1];
                r && 0 !== r.length ? n.sendEnvelope(t) : n.recordDroppedEvent("before_send", "span")
            }((0, r.l)([this], t)) : (n.f && s.h.log("[Tracing] Discarding standalone span because its trace was not chosen to be sampled."), t && t.recordDroppedEvent("sample_rate", "span")));
            if (t && (0, p.f)(t)) return void t.emit("afterSegmentSpanEnd", this);
            let i = this._convertSpanToTransaction();
            i && ((0, f.C)(this).scope || (0, e.d)()).captureEvent(i)
        }
        _convertSpanToTransaction() {
            var e;
            if (!_((0, o.l)(this))) return;
            this._name || (n.f && s.h.warn("Transaction has no name, falling back to `<unlabeled transaction>`."), this._name = "<unlabeled transaction>");
            let {
                scope: r,
                isolationScope: a
            } = (0, f.C)(this), c = null == r || null == (e = r.getScopeData().sdkProcessingMetadata) ? void 0 : e.normalizedRequest;
            if (!0 !== this._sampled) return;
            let l = (0, o.D)(this).filter(e => {
                    var n;
                    return e !== this && !((n = e) instanceof t && n.isStandaloneSpan())
                }).map(t => (0, o.l)(t)).filter(_),
                p = this._attributes[i.U];
            delete this._attributes[i.j];
            let h = !1;
            l.forEach(t => {
                var e;
                delete t.data[i.j], (null == (e = t.op) ? void 0 : e.startsWith("gen_ai.")) && (h = !0)
            });
            let g = {
                    contexts: {
                        trace: (0, o.K)(this)
                    },
                    spans: l.length > 1e3 ? l.sort((t, e) => t.start_timestamp - e.start_timestamp).slice(0, 1e3) : l,
                    start_timestamp: this._startTime,
                    timestamp: this._endTime,
                    transaction: this._name,
                    type: "transaction",
                    sdkProcessingMetadata: {
                        capturedSpanScope: r,
                        capturedSpanIsolationScope: a,
                        dynamicSamplingContext: (0, u.O)(this),
                        hasGenAiSpans: h
                    },
                    request: c,
                    ...p && {
                        transaction_info: {
                            source: p
                        }
                    }
                },
                m = (0, d.t)(this._events);
            return m && Object.keys(m).length && (n.f && s.h.log("[Measurements] Adding measurements to transaction event", JSON.stringify(m, void 0, 2)), g.measurements = m), g
        }
        constructor(t = {}) {
            this._traceId = t.traceId || (0, a.u)(), this._spanId = t.spanId || (0, a.d)(), this._startTime = t.startTimestamp || (0, c.R)(), this._links = t.links, this._attributes = {}, this.setAttributes({
                [i.u]: "manual",
                [i.o]: t.op,
                ...t.attributes
            }), this._name = t.name, t.parentSpanId && (this._parentSpanId = t.parentSpanId), "sampled" in t && (this._sampled = t.sampled), t.endTimestamp && (this._endTime = t.endTimestamp), this._events = [], this._isStandaloneSpan = t.isStandalone, this._endTime && this._onSpanEnded()
        }
    }])
}, 603820, t => {
    "use strict";
    t.s(["f", 0, function(t) {
        return "stream" === t.getOptions().traceLifecycle
    }])
}, 179423, t => {
    "use strict";
    var e = t.i(33098),
        n = t.i(973716),
        r = t.i(53341);
    let i = "sentry-";

    function s(t) {
        if (t && ((0, r.Z)(t) || Array.isArray(t))) return Array.isArray(t) ? t.reduce((t, e) => (Object.entries(a(e)).forEach(e => {
            let [n, r] = e;
            t[n] = r
        }), t), {}) : a(t)
    }

    function a(t) {
        return t.split(",").map(t => {
            let e = t.indexOf("=");
            return -1 === e ? [] : [t.slice(0, e), t.slice(e + 1)].map(t => {
                try {
                    return decodeURIComponent(t.trim())
                } catch (t) {
                    return
                }
            })
        }).reduce((t, e) => {
            let [n, r] = e;
            return n && r && (t[n] = r), t
        }, {})
    }
    t.s(["p", 0, i, "T", 0, function(t) {
        let e = s(t);
        if (!e) return;
        let n = Object.entries(e).reduce((t, e) => {
            let [n, r] = e;
            return n.startsWith(i) && (t[n.slice(i.length)] = r), t
        }, {});
        return Object.keys(n).length > 0 ? n : void 0
    }, "N", 0, function(t) {
        if (t) {
            var r = Object.entries(t).reduce((t, e) => {
                let [n, r] = e;
                return r && (t["".concat(i).concat(n)] = r), t
            }, {});
            return 0 !== Object.keys(r).length ? Object.entries(r).reduce((t, r, i) => {
                let [s, a] = r, o = "".concat(encodeURIComponent(s), "=").concat(encodeURIComponent(a)), c = 0 === i ? o : "".concat(t, ",").concat(o);
                return c.length > 8192 ? (e.f && n.h.warn("Not adding key: ".concat(s, " with val: ").concat(a, " to baggage header due to exceeding baggage size limits.")), t) : c
            }, "") : void 0
        }
    }, "O", 0, s])
}, 589699, t => {
    "use strict";
    var e = t.i(33098),
        n = t.i(973716);
    let r = /^o(\d+)\./,
        i = /^(?:(\w+):)\/\/(?:(\w+)(?::(\w+)?)?@)((?:\[[:.%\w]+\]|[\w.-]+))(?::(\d+))?\/(.+)/;

    function s(t) {
        let e = i.exec(t);
        if (!e) return void(0, n.D)(() => {
            console.error("Invalid Sentry Dsn: ".concat(t))
        });
        let [r, s, o = "", c = "", u = "", l = ""] = e.slice(1), d = "", p = l, f = p.split("/");
        if (f.length > 1 && (d = f.slice(0, -1).join("/"), p = f.pop()), p) {
            let t = p.match(/^\d+/);
            t && (p = t[0])
        }
        return a({
            host: c,
            pass: o,
            path: d,
            projectId: p,
            port: u,
            protocol: r,
            publicKey: s
        })
    }

    function a(t) {
        return {
            protocol: t.protocol,
            publicKey: t.publicKey || "",
            pass: t.pass || "",
            host: t.host,
            port: t.port || "",
            path: t.path || "",
            projectId: t.projectId
        }
    }
    t.s(["o", 0, s, "_", 0, function(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            {
                host: n,
                path: r,
                pass: i,
                port: s,
                projectId: a,
                protocol: o,
                publicKey: c
            } = t;
        return "".concat(o, "://").concat(c).concat(e && i ? ":".concat(i) : "") + "@".concat(n).concat(s ? ":".concat(s) : "", "/").concat(r ? "".concat(r, "/") : r).concat(a)
    }, "T", 0, function(t) {
        let e, n = t.getOptions(),
            {
                host: i
            } = t.getDsn() || {};
        if (n.orgId) e = String(n.orgId);
        else {
            let t;
            i && (e = null == (t = i.match(r)) ? void 0 : t[1])
        }
        return e
    }, "p", 0, function(t) {
        let r = "string" == typeof t ? s(t) : a(t);
        if (r && function(t) {
                if (!e.f) return !0;
                let {
                    port: r,
                    projectId: i,
                    protocol: s
                } = t;
                return !["protocol", "publicKey", "host", "projectId"].find(e => !t[e] && (n.h.error("Invalid Sentry Dsn: ".concat(e, " missing")), !0)) && (i.match(/^\d+$/) ? "http" !== s && "https" !== s ? (n.h.error("Invalid Sentry Dsn: Invalid protocol ".concat(s)), !1) : !(r && isNaN(parseInt(r, 10))) || (n.h.error("Invalid Sentry Dsn: Invalid port ".concat(r)), !1) : (n.h.error("Invalid Sentry Dsn: Invalid projectId ".concat(i)), !1))
            }(r)) return r
    }])
}, 423703, t => {
    "use strict";
    var e = t.i(709660),
        n = t.i(53341);
    t.s(["f", 0, function(t, r) {
        var i, s, a, o;
        let c, u = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : () => {},
            l = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : () => {};
        try {
            c = t()
        } catch (t) {
            throw r(t), u(), t
        }
        return i = c, s = r, a = u, o = l, (0, n.l)(i) ? (0, e.f)(i, t => {
            a(), o(t)
        }, t => {
            s(t), a()
        }) : (a(), o(i), i)
    }])
}, 191329, 334006, t => {
    "use strict";
    var e = t.i(505099);
    t.s(["f", 0, function(t) {
        var n;
        if ("boolean" == typeof __SENTRY_TRACING__ && !__SENTRY_TRACING__) return !1;
        let r = t || (null == (n = (0, e.l)()) ? void 0 : n.getOptions());
        return !!r && (null != r.tracesSampleRate || !!r.tracesSampler)
    }], 191329);
    var n = t.i(33098),
        r = t.i(973716),
        i = t.i(182133);

    function s(t) {
        r.h.log("Ignoring span ".concat(t.op, " - ").concat(t.description, " because it matches `ignoreSpans`."))
    }
    t.s(["v", 0, function(t, e) {
        let n = e.parent_span_id,
            r = e.span_id;
        if (n)
            for (let e of t) e.parent_span_id === r && (e.parent_span_id = n)
    }, "s", 0, function(t, e) {
        if (!(null == e ? void 0 : e.length)) return !1;
        for (let a of e) {
            var r;
            if ("string" == typeof(r = a) || r instanceof RegExp) {
                if (t.description && (0, i.w)(t.description, a)) return n.f && s(t), !0;
                continue
            }
            let e = !!a.attributes && Object.keys(a.attributes).length > 0;
            if (!a.name && !a.op && !e) continue;
            let o = !a.name || t.description && (0, i.w)(t.description, a.name),
                c = !a.op || t.op && (0, i.w)(t.op, a.op),
                u = !a.attributes || Object.entries(a.attributes).every(e => {
                    var n;
                    let [r, s] = e;
                    return function(t, e) {
                        return "string" == typeof t && ("string" == typeof e || e instanceof RegExp) ? (0, i.w)(t, e) : Array.isArray(t) && Array.isArray(e) ? t.length === e.length && t.every((t, n) => t === e[n]) : t === e
                    }(null == (n = t.attributes) ? void 0 : n[r], s)
                });
            if (o && c && u) return n.f && s(t), !0
        }
        return !1
    }], 334006)
}, 236716, t => {
    "use strict";
    t.s(["f", 0, function(t) {
        if ("boolean" == typeof t) return Number(t);
        let e = "string" == typeof t ? parseFloat(t) : t;
        if (!("number" != typeof e || isNaN(e)) && !(e < 0) && !(e > 1)) return e
    }])
}, 706854, 445809, 284207, 439470, t => {
    "use strict";
    var e = t.i(754177),
        n = t.i(531428),
        r = t.i(813705),
        i = t.i(505099),
        s = t.i(750672),
        a = t.i(27472),
        o = t.i(650220),
        c = t.i(506929),
        u = t.i(329282),
        l = t.i(825142),
        d = t.i(973716),
        p = t.i(179423),
        f = t.i(589699),
        h = t.i(236716),
        _ = t.i(167178);
    let g = RegExp("^[ \\t]*([0-9a-f]{32})?-?([0-9a-f]{16})?-?([01])?[ \\t]*$");

    function m() {
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : (0, u.u)(),
            e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : (0, u.d)(),
            n = arguments.length > 2 ? arguments[2] : void 0,
            r = "";
        return void 0 !== n && (r = n ? "-1" : "-0"), "".concat(t, "-").concat(e).concat(r)
    }

    function v() {
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : (0, u.u)(),
            e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : (0, u.d)(),
            n = arguments.length > 2 ? arguments[2] : void 0;
        return "00-".concat(t, "-").concat(e, "-").concat(n ? "01" : "00")
    }
    t.s(["v", 0, g, "J", 0, m, "z", 0, v, "C", 0, function(t, e) {
        let n = function(t) {
                let e;
                if (!t) return;
                let n = t.match(g);
                if (n) return "1" === n[3] ? e = !0 : "0" === n[3] && (e = !1), {
                    traceId: n[1],
                    parentSampled: e,
                    parentSpanId: n[2]
                }
            }(t),
            r = (0, p.T)(e);
        if (!(null == n ? void 0 : n.traceId)) return {
            traceId: (0, u.u)(),
            sampleRand: (0, _.T)()
        };
        let i = function(t, e) {
            let n = (0, h.f)(null == e ? void 0 : e.sample_rand);
            if (void 0 !== n) return n;
            let r = (0, h.f)(null == e ? void 0 : e.sample_rate);
            return r && (null == t ? void 0 : t.parentSampled) !== void 0 ? t.parentSampled ? (0, _.T)() * r : r + (0, _.T)() * (1 - r) : (0, _.T)()
        }(n, r);
        r && (r.sample_rand = i.toString());
        let {
            traceId: s,
            parentSpanId: a,
            parentSampled: o
        } = n;
        return {
            traceId: s,
            parentSpanId: a,
            sampled: o,
            dsc: r || {},
            sampleRand: i
        }
    }, "E", 0, function(t, e) {
        let n = (0, f.T)(t);
        return e && n && e !== n ? (d.h.log("Won't continue trace because org IDs don't match (incoming baggage: ".concat(e, ", SDK options: ").concat(n, ")")), !1) : !t.getOptions().strictTraceContinuation || (!e || !!n) && (!!e || !n) || (d.h.log("Starting a new trace because strict trace continuation is enabled but one org ID is missing (incoming baggage: ".concat(e, ", Sentry client: ").concat(n, ")")), !1)
    }], 445809);
    var y = t.i(46870);
    let b = !1;

    function S(t) {
        return t && t.length > 0 ? t.map(t => {
            let {
                context: {
                    spanId: e,
                    traceId: n,
                    traceFlags: r,
                    ...i
                },
                attributes: s
            } = t;
            return {
                span_id: e,
                trace_id: n,
                sampled: 1 === r,
                attributes: s,
                ...i
            }
        }) : void 0
    }

    function x(t) {
        return (null == t ? void 0 : t.length) ? t.map(t => {
            let {
                context: {
                    spanId: e,
                    traceId: n,
                    traceFlags: r
                },
                attributes: i
            } = t;
            return {
                span_id: e,
                trace_id: n,
                sampled: 1 === r,
                attributes: i
            }
        }) : void 0
    }

    function k(t) {
        return "number" == typeof t ? E(t) : Array.isArray(t) ? t[0] + t[1] / 1e9 : t instanceof Date ? E(t.getTime()) : (0, l.R)()
    }

    function E(t) {
        return t > 0x2540be3ff ? t / 1e3 : t
    }

    function I(t) {
        if (T(t)) return t.getSpanJSON();
        let {
            spanId: e,
            traceId: n
        } = t.spanContext();
        if (O(t)) {
            let {
                attributes: r,
                startTime: i,
                name: a,
                endTime: o,
                status: c,
                links: u
            } = t;
            return {
                span_id: e,
                trace_id: n,
                data: r,
                description: a,
                parent_span_id: w(t),
                start_timestamp: k(i),
                timestamp: k(o) || void 0,
                status: C(c),
                op: r[s.o],
                origin: r[s.u],
                links: S(u)
            }
        }
        return {
            span_id: e,
            trace_id: n,
            start_timestamp: 0,
            data: {}
        }
    }

    function w(t) {
        var e;
        return "parentSpanId" in t ? t.parentSpanId : "parentSpanContext" in t ? null == (e = t.parentSpanContext) ? void 0 : e.spanId : void 0
    }

    function O(t) {
        return !!t.attributes && !!t.startTime && !!t.name && !!t.endTime && !!t.status
    }

    function T(t) {
        return "function" == typeof t.getSpanJSON
    }

    function A(t) {
        let {
            traceFlags: e
        } = t.spanContext();
        return 1 === e
    }

    function C(t) {
        if (t && t.code !== a.s) return t.code === a.b ? "ok" : t.message || "internal_error"
    }

    function D(t) {
        return t && t.code !== a.b && t.code !== a.s && "cancelled" !== t.message ? "error" : "ok"
    }
    let N = "_sentryChildSpans",
        j = "_sentryRootSpan",
        P = R;

    function R(t) {
        return t[j] || t
    }
    t.s(["_", 0, R, "i", 0, 0, "n", 0, 1, "P", 0, function(t, e) {
        let n = t[j] || t;
        (0, c.O)(e, j, n), t[N] ? t[N].add(e) : (0, c.O)(t, N, new Set([e]))
    }, "Q", 0, S, "j", 0, function() {
        let t = (0, r.t)(),
            n = (0, e.f)(t);
        return n.getActiveSpan ? n.getActiveSpan() : (0, y.c)((0, i.d)())
    }, "e", 0, P, "C", 0, D, "D", 0, function(t) {
        let e = new Set;
        return ! function t(n) {
            if (!e.has(n) && A(n))
                for (let r of (e.add(n), n[N] ? Array.from(n[N]) : [])) t(r)
        }(t), Array.from(e)
    }, "M", 0, C, "E", 0, x, "V", 0, function(t, e) {
        t[N] && t[N].delete(e)
    }, "x", 0, function() {
        b || ((0, d.D)(() => {
            console.warn("[Sentry] Returning null from `beforeSendSpan` is disallowed. To drop certain spans, configure the respective integrations directly or use `ignoreSpans`.")
        }), b = !0)
    }, "S", 0, A, "k", 0, k, "l", 0, I, "Z", 0, function(t) {
        if (T(t)) return t.getStreamedSpanJSON();
        let {
            spanId: e,
            traceId: n
        } = t.spanContext();
        if (O(t)) {
            let {
                attributes: r,
                startTime: i,
                name: s,
                endTime: a,
                status: o,
                links: c
            } = t;
            return {
                name: s,
                span_id: e,
                trace_id: n,
                parent_span_id: w(t),
                start_timestamp: k(i),
                end_timestamp: k(a),
                is_segment: t === R(t),
                status: D(o),
                attributes: r,
                links: x(c)
            }
        }
        return {
            span_id: e,
            trace_id: n,
            start_timestamp: 0,
            name: "",
            end_timestamp: 0,
            status: "ok",
            is_segment: t === R(t)
        }
    }, "m", 0, function(t) {
        let {
            spanId: e,
            traceId: n,
            isRemote: r
        } = t.spanContext(), i = r ? e : I(t).parent_span_id, s = (0, o.C)(t).scope;
        return {
            parent_span_id: i,
            span_id: r ? (null == s ? void 0 : s.getPropagationContext().propagationSpanId) || (0, u.d)() : e,
            trace_id: n
        }
    }, "N", 0, function(t) {
        let {
            traceId: e,
            spanId: n
        } = t.spanContext();
        return m(e, n, A(t))
    }, "o", 0, function(t) {
        let {
            traceId: e,
            spanId: n
        } = t.spanContext();
        return v(e, n, A(t))
    }, "K", 0, function(t) {
        let {
            spanId: e,
            traceId: n
        } = t.spanContext(), {
            data: r,
            op: i,
            parent_span_id: s,
            status: a,
            origin: o,
            links: c
        } = I(t);
        return {
            parent_span_id: s,
            span_id: e,
            trace_id: n,
            data: r,
            op: i,
            status: a,
            origin: o,
            links: c
        }
    }, "g", 0, function(t) {
        var e;
        return {
            ...t,
            attributes: (0, n.f)(t.attributes),
            links: null == (e = t.links) ? void 0 : e.map(t => ({
                ...t,
                attributes: (0, n.f)(t.attributes)
            }))
        }
    }], 706854);
    let M = "production";
    t.s(["f", 0, M], 284207);
    var L = t.i(191329);
    let U = "_frozenDsc";

    function J(t, e) {
        let n = e.getOptions(),
            {
                publicKey: r
            } = e.getDsn() || {},
            i = {
                environment: n.environment || M,
                release: n.release,
                public_key: r,
                trace_id: t,
                org_id: (0, f.T)(e)
            };
        return e.emit("createDsc", i), i
    }
    t.s(["m", 0, function(t, e) {
        (0, c.O)(t, U, e)
    }, "H", 0, function(t, e) {
        let n = e.getPropagationContext();
        return n.dsc || J(n.traceId, t)
    }, "O", 0, function(t) {
        var e, n, r, a, c;
        let u = (0, i.l)();
        if (!u) return {};
        let l = P(t),
            d = I(l),
            f = d.data,
            h = l.spanContext().traceState,
            _ = null != (e = null != (n = null == h ? void 0 : h.get("sentry.sample_rate")) ? n : f[s.s]) ? e : f[s.t];

        function g(t) {
            return ("number" == typeof _ || "string" == typeof _) && (t.sample_rate = "".concat(_)), t
        }
        let m = l[U];
        if (m) return g(m);
        let v = null == h ? void 0 : h.get("sentry.dsc"),
            y = v && (0, p.T)(v);
        if (y) return g(y);
        let b = J(t.spanContext().traceId, u),
            S = null != (r = f[s.U]) ? r : f["sentry.span.source"],
            x = d.description;
        return "url" !== S && x && (b.transaction = x), (0, L.f)() && (b.sampled = String(A(l)), b.sample_rand = null != (a = null == h ? void 0 : h.get("sentry.sample_rand")) ? a : null == (c = (0, o.C)(l).scope) ? void 0 : c.getPropagationContext().sampleRand.toString()), g(b), u.emit("createDsc", b, l), b
    }], 439470)
}]);

//# debugId=20917ff1-3e82-5b06-4124-a738ace269f8
//# sourceMappingURL=1k-f6abzj472-.js.map