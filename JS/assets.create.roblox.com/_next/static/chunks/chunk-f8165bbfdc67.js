;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "049558f9-a419-14a4-4b0d-7b3d899ae54a")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 608045, 582741, 145821, t => {
    "use strict";
    t.i(379705), t.s(["serializeAttributes", 0, function(t) {
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
                }, a = function(t) {
                    let e = "string" == typeof t ? "string" : "boolean" == typeof t ? "boolean" : "number" != typeof t || Number.isNaN(t) ? null : Number.isInteger(t) ? "integer" : "double";
                    if (e) return {
                        value: t,
                        type: e
                    }
                }(r), s = i && "string" == typeof i ? {
                    unit: i
                } : {};
                if (a) return {
                    ...a,
                    ...s
                };
                if (!e || "skip-undefined" === e && void 0 === r) return;
                let o = "";
                try {
                    o = null != (n = JSON.stringify(r)) ? n : ""
                } catch (t) {}
                return {
                    value: o,
                    type: "string",
                    ...s
                }
            }(i, e);
            t && (n[r] = t)
        }
        return n
    }], 608045), t.s(["SPAN_STATUS_ERROR", 0, 2, "SPAN_STATUS_OK", 0, 1, "SPAN_STATUS_UNSET", 0, 0, "setHttpStatus", 0, function(t, e) {
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
    }], 582741);
    var e = t.i(728441),
        n = t.i(489427);
    let r = "_sentryScope",
        i = "_sentryIsolationScope";
    t.s(["getCapturedScopesOnSpan", 0, function(t) {
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
    }, "setCapturedScopesOnSpan", 0, function(t, a, s) {
        t && ((0, e.addNonEnumerableProperty)(t, i, function(t) {
            try {
                let e = n.GLOBAL_OBJ.WeakRef;
                if ("function" == typeof e) return new e(t)
            } catch (t) {}
            return t
        }(s)), (0, e.addNonEnumerableProperty)(t, r, a))
    }], 145821)
}, 230242, 24046, 489427, 254944, 777246, 379705, 350941, 169533, 728441, 361341, 79752, 163772, 823979, 193218, 220778, 785041, 912583, 619834, 937463, 228515, 688671, 28775, t => {
    "use strict";
    let e, n, r, i, a = "10.53.1";
    t.s(["SDK_VERSION", 0, a], 24046);
    let s = globalThis;

    function o() {
        return c(s), s
    }

    function c(t) {
        let e = t.__SENTRY__ = t.__SENTRY__ || {};
        return e.version = e.version || a, e[a] = e[a] || {}
    }

    function u(t, e) {
        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : s,
            r = n.__SENTRY__ = n.__SENTRY__ || {},
            i = r[a] = r[a] || {};
        return i[t] || (i[t] = e())
    }
    t.s(["GLOBAL_OBJ", 0, s], 489427), t.s(["getGlobalSingleton", 0, u, "getMainCarrier", 0, o, "getSentryCarrier", 0, c], 254944);
    let l = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;
    t.s(["DEBUG_BUILD", 0, l], 777246);
    let p = Object.prototype.toString;

    function d(t) {
        switch (p.call(t)) {
            case "[object Error]":
            case "[object Exception]":
            case "[object DOMException]":
            case "[object WebAssembly.Exception]":
                return !0;
            default:
                return v(t, Error)
        }
    }

    function _(t, e) {
        return p.call(t) === "[object ".concat(e, "]")
    }

    function g(t) {
        return _(t, "String")
    }

    function f(t) {
        return "object" == typeof t && null !== t && "__sentry_template_string__" in t && "__sentry_template_values__" in t
    }

    function h(t) {
        return _(t, "Object")
    }

    function S(t) {
        return "u" > typeof Event && v(t, Event)
    }

    function m(t) {
        return "u" > typeof Element && v(t, Element)
    }

    function T(t) {
        return _(t, "RegExp")
    }

    function E(t) {
        return !!((null == t ? void 0 : t.then) && "function" == typeof t.then)
    }

    function v(t, e) {
        try {
            return t instanceof e
        } catch (t) {
            return !1
        }
    }

    function y(t) {
        return !!("object" == typeof t && null !== t && (t.__isVue || t._isVue || t.__v_isVNode))
    }

    function b(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        if (!t) return "<unknown>";
        try {
            let n, r = t,
                i = [],
                a = 0,
                o = 0,
                c = Array.isArray(e) ? e : e.keyAttrs,
                u = !Array.isArray(e) && e.maxStringLength || 80;
            for (; r && a++ < 5 && (n = function(t, e) {
                    let n = [];
                    if (!(null == t ? void 0 : t.tagName)) return "";
                    if (s.HTMLElement && t instanceof HTMLElement && t.dataset) {
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
                        if (e && g(e))
                            for (let t of e.split(/\s+/)) n.push(".".concat(t))
                    }
                    for (let e of ["aria-label", "type", "name", "title", "alt"]) {
                        let r = t.getAttribute(e);
                        r && n.push("[".concat(e, '="').concat(r, '"]'))
                    }
                    return n.join("")
                }(r, c), "html" !== n && (!(a > 1) || !(o + 3 * i.length + n.length >= u)));) i.push(n), o += n.length, r = r.parentNode;
            return i.reverse().join(" > ")
        } catch (t) {
            return "<unknown>"
        }
    }
    t.s(["isDOMError", 0, function(t) {
        return _(t, "DOMError")
    }, "isDOMException", 0, function(t) {
        return _(t, "DOMException")
    }, "isElement", 0, m, "isError", 0, d, "isErrorEvent", 0, function(t) {
        return _(t, "ErrorEvent")
    }, "isEvent", 0, S, "isInstanceOf", 0, v, "isParameterizedString", 0, f, "isPlainObject", 0, h, "isPrimitive", 0, function(t) {
        return null === t || f(t) || "object" != typeof t && "function" != typeof t
    }, "isRegExp", 0, T, "isRequest", 0, function(t) {
        return "u" > typeof Request && v(t, Request)
    }, "isString", 0, g, "isSyntheticEvent", 0, function(t) {
        return h(t) && "nativeEvent" in t && "preventDefault" in t && "stopPropagation" in t
    }, "isThenable", 0, E, "isVueViewModel", 0, y], 379705), t.s(["getComponentName", 0, function(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 5;
        if (!s.HTMLElement) return null;
        let n = t;
        for (let t = 0; t < e && n; t++) {
            if (n instanceof HTMLElement) {
                if (n.dataset.sentryComponent) return n.dataset.sentryComponent;
                if (n.dataset.sentryElement) return n.dataset.sentryElement
            }
            n = n.parentNode
        }
        return null
    }, "getLocationHref", 0, function() {
        try {
            return s.document.location.href
        } catch (t) {
            return ""
        }
    }, "htmlTreeAsString", 0, b], 350941);
    let I = {};

    function A(t) {
        if (!("console" in s)) return t();
        let e = s.console,
            n = {},
            r = Object.keys(I);
        r.forEach(t => {
            let r = I[t];
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

    function N() {
        return C().enabled
    }

    function R(t) {
        for (var e = arguments.length, n = Array(e > 1 ? e - 1 : 0), r = 1; r < e; r++) n[r - 1] = arguments[r];
        l && N() && A(() => {
            s.console[t]("".concat("Sentry Logger ", "[").concat(t, "]:"), ...n)
        })
    }

    function C() {
        return l ? u("loggerSettings", () => ({
            enabled: !1
        })) : {
            enabled: !1
        }
    }
    let x = {
        enable: function() {
            C().enabled = !0
        },
        disable: function() {
            C().enabled = !1
        },
        isEnabled: N,
        log: function() {
            for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
            R("log", ...e)
        },
        warn: function() {
            for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
            R("warn", ...e)
        },
        error: function() {
            for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
            R("error", ...e)
        }
    };

    function O(t, e, n) {
        try {
            Object.defineProperty(t, e, {
                value: n,
                writable: !0,
                configurable: !0
            })
        } catch (n) {
            l && x.log('Failed to add non-enumerable property "'.concat(String(e), '" to object'), t)
        }
    }

    function M(t, e) {
        try {
            let n = e.prototype || {};
            t.prototype = e.prototype = n, O(t, "__sentry_original__", e)
        } catch (t) {}
    }

    function k(t) {
        if (d(t)) return {
            message: t.message,
            name: t.name,
            stack: t.stack,
            ...U(t)
        };
        if (!S(t)) return t;
        {
            let e = {
                type: t.type,
                target: D(t.target),
                currentTarget: D(t.currentTarget),
                ...U(t)
            };
            return "u" > typeof CustomEvent && v(t, CustomEvent) && (e.detail = t.detail), e
        }
    }

    function D(t) {
        try {
            return m(t) ? b(t) : Object.prototype.toString.call(t)
        } catch (t) {
            return "<unknown>"
        }
    }

    function U(t) {
        return "object" == typeof t && null !== t ? Object.fromEntries(Object.entries(t)) : {}
    }

    function P(t) {
        if (void 0 !== e) return e ? e(t) : t();
        let n = Symbol.for("__SENTRY_SAFE_RANDOM_ID_WRAPPER__");
        return n in s && "function" == typeof s[n] ? (e = s[n])(t) : (e = null, t())
    }

    function w() {
        return P(() => Math.random())
    }

    function L() {
        return P(() => Date.now())
    }
    t.s(["CONSOLE_LEVELS", 0, ["debug", "info", "warn", "error", "log", "assert", "trace"], "consoleSandbox", 0, A, "debug", 0, x, "originalConsoleMethods", 0, I], 169533), t.s(["addNonEnumerableProperty", 0, O, "convertToPlainObject", 0, k, "extractExceptionKeysForMessage", 0, function(t) {
        let e = Object.keys(k(t));
        return e.sort(), e[0] ? e.join(", ") : "[object has no keys]"
    }, "fill", 0, function(t, e, n) {
        if (!(e in t)) return;
        let r = t[e];
        if ("function" != typeof r) return;
        let i = n(r);
        "function" == typeof i && M(i, r);
        try {
            t[e] = i
        } catch (n) {
            l && x.log('Failed to replace method "'.concat(e, '" in object'), t)
        }
    }, "getOriginalFunction", 0, function(t) {
        return t.__sentry_original__
    }, "markFunctionWrapped", 0, M], 728441), t.s(["safeDateNow", 0, L, "safeMathRandom", 0, w, "withRandomSafeContext", 0, P], 361341);
    let B = /\(error: (.*)\)/,
        j = /captureMessage|captureException/;

    function F() {
        for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
        let r = e.sort((t, e) => t[0] - e[0]).map(t => t[1]);
        return function(t) {
            let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
                n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 0,
                i = [],
                a = t.split("\n");
            for (let t = e; t < a.length; t++) {
                let e = a[t];
                e.length > 1024 && (e = e.slice(0, 1024));
                let s = B.test(e) ? e.replace(B, "$1") : e;
                if (!s.includes("Error: ")) {
                    for (let t of r) {
                        let e = t(s);
                        if (e) {
                            i.push(e);
                            break
                        }
                    }
                    if (i.length >= 50 + n) break
                }
            }
            var s = i.slice(n);
            if (!s.length) return [];
            let o = Array.from(s);
            return /sentryWrapped/.test(G(o).function || "") && o.pop(), o.reverse(), j.test(G(o).function || "") && (o.pop(), j.test(G(o).function || "") && o.pop()), o.slice(0, 50).map(t => ({
                ...t,
                filename: t.filename || G(o).filename,
                function: t.function || "?"
            }))
        }
    }

    function G(t) {
        return t[t.length - 1] || {}
    }
    let Y = "<anonymous>";

    function J(t) {
        return "__v_isVNode" in t && t.__v_isVNode ? "[VueVNode]" : "[VueViewModel]"
    }

    function V(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
        return "string" != typeof t || 0 === e || t.length <= e ? t : "".concat(t.slice(0, e), "...")
    }

    function z(t, e) {
        let n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
        return !!g(t) && (T(e) ? e.test(t) : g(e) ? n ? t === e : t.includes(e) : "function" == typeof e && e(t))
    }

    function H() {
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : s.crypto || s.msCrypto;
        try {
            if (null == t ? void 0 : t.randomUUID) return P(() => t.randomUUID()).replace(/-/g, "")
        } catch (t) {}
        return n || (n = "10000000100040008000100000000000"), n.replace(/[018]/g, t => (t ^ (15 & 16 * w()) >> t / 4).toString(16))
    }

    function K(t) {
        var e, n;
        return null == (n = t.exception) || null == (e = n.values) ? void 0 : e[0]
    }

    function W() {
        return L() / 1e3
    }

    function q() {
        return (null != r ? r : r = function() {
            let {
                performance: t
            } = s;
            if (!(null == t ? void 0 : t.now) || !t.timeOrigin) return W;
            let e = t.timeOrigin;
            return () => (e + P(() => t.now())) / 1e3
        }())()
    }
    t.s(["UNKNOWN_FUNCTION", 0, "?", "createStackParser", 0, F, "getFramesFromEvent", 0, function(t) {
        let e = t.exception;
        if (e) {
            let t = [];
            try {
                return e.values.forEach(e => {
                    e.stacktrace.frames && t.push(...e.stacktrace.frames)
                }), t
            } catch (t) {}
        }
    }, "getFunctionName", 0, function(t) {
        try {
            if (!t || "function" != typeof t) return Y;
            return t.name || Y
        } catch (t) {
            return Y
        }
    }, "getVueInternalName", 0, J, "normalizeStackTracePath", 0, function(t) {
        let e = (null == t ? void 0 : t.startsWith("file://")) ? t.slice(7) : t;
        return (null == e ? void 0 : e.match(/\/[A-Z]:/)) && (e = e.slice(1)), e
    }, "stackParserFromStackParserOptions", 0, function(t) {
        return Array.isArray(t) ? F(...t) : t
    }], 79752), t.s(["isMatchingPattern", 0, z, "safeJoin", 0, function(t, e) {
        if (!Array.isArray(t)) return "";
        let n = [];
        for (let e = 0; e < t.length; e++) {
            let r = t[e];
            try {
                y(r) ? n.push(J(r)) : n.push(String(r))
            } catch (t) {
                n.push("[value cannot be serialized]")
            }
        }
        return n.join(e)
    }, "snipLine", 0, function(t, e) {
        let n = t,
            r = n.length;
        if (r <= 150) return n;
        e > r && (e = r);
        let i = Math.max(e - 60, 0);
        i < 5 && (i = 0);
        let a = Math.min(i + 140, r);
        return a > r - 5 && (a = r), a === r && (i = Math.max(a - 140, 0)), n = n.slice(i, a), i > 0 && (n = "'{snip} ".concat(n)), a < r && (n += " {snip}"), n
    }, "stringMatchesSomePattern", 0, function(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
        for (let r of e)
            if (z(t, r, n)) return !0;
        return !1
    }, "truncate", 0, V], 163772), t.s(["addExceptionMechanism", 0, function(t, e) {
        let n = K(t);
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
    }, "addExceptionTypeValue", 0, function(t, e, n) {
        let r = t.exception = t.exception || {},
            i = r.values = r.values || [],
            a = i[0] = i[0] || {};
        a.value || (a.value = e || ""), a.type || (a.type = n || "Error")
    }, "checkOrSetAlreadyCaught", 0, function(t) {
        if (function(t) {
                try {
                    return t.__sentry_captured__
                } catch (t) {}
            }(t)) return !0;
        try {
            O(t, "__sentry_captured__", !0)
        } catch (t) {}
        return !1
    }, "getEventDescription", 0, function(t) {
        let {
            message: e,
            event_id: n
        } = t;
        if (e) return e;
        let r = K(t);
        return r ? r.type && r.value ? "".concat(r.type, ": ").concat(r.value) : r.type || r.value || n || "<unknown>" : n || "<unknown>"
    }, "uuid4", 0, H], 823979);
    let X = null;

    function $(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        if (e.user && (!t.ipAddress && e.user.ip_address && (t.ipAddress = e.user.ip_address), t.did || e.did || (t.did = e.user.id || e.user.email || e.user.username)), t.timestamp = e.timestamp || q(), e.abnormal_mechanism && (t.abnormal_mechanism = e.abnormal_mechanism), e.ignoreDuration && (t.ignoreDuration = e.ignoreDuration), e.sid && (t.sid = 32 === e.sid.length ? e.sid : H()), void 0 !== e.init && (t.init = e.init), !t.did && e.did && (t.did = "".concat(e.did)), "number" == typeof e.started && (t.started = e.started), t.ignoreDuration) t.duration = void 0;
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

    function Z() {
        return H()
    }

    function tt() {
        return H().substring(16)
    }
    t.s(["browserPerformanceTimeOrigin", 0, function() {
        return null === X && (X = function() {
            var t;
            let {
                performance: e
            } = s;
            if (!(null == e ? void 0 : e.now)) return;
            let n = P(() => e.now()),
                r = L(),
                i = e.timeOrigin;
            if ("number" == typeof i && 3e5 > Math.abs(i + n - r)) return i;
            let a = null == (t = e.timing) ? void 0 : t.navigationStart;
            return "number" == typeof a && 3e5 > Math.abs(a + n - r) ? a : r - n
        }()), X
    }, "dateTimestampInSeconds", 0, W, "timestampInSeconds", 0, q], 193218), t.s(["closeSession", 0, function(t, e) {
        let n = {};
        e ? n = {
            status: e
        } : "ok" === t.status && (n = {
            status: "exited"
        }), $(t, n)
    }, "makeSession", 0, function(t) {
        let e = q(),
            n = {
                sid: H(),
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
    }, "updateSession", 0, $], 220778), t.s(["merge", 0, Q], 785041), t.s(["generateSpanId", 0, tt, "generateTraceId", 0, Z], 912583);
    let te = "_sentrySpan";

    function tn(t, e) {
        e ? O(t, te, e) : delete t[te]
    }

    function tr(t) {
        return t[te]
    }
    t.s(["_getSpanForScope", 0, tr, "_setSpanForScope", 0, tn], 619834);
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
                    user: a,
                    contexts: s,
                    level: o,
                    fingerprint: c = [],
                    propagationContext: u,
                    conversationId: l
                } = (e instanceof ti ? e.getScopeData() : h(e) ? t : void 0) || {};
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
                ...s
            }, a && Object.keys(a).length && (this._user = a), o && (this._level = o), c.length && (this._fingerprint = c), u && (this._propagationContext = u), l && (this._conversationId = l), this
        }
        clear() {
            return this._breadcrumbs = [], this._tags = {}, this._attributes = {}, this._extra = {}, this._user = {}, this._contexts = {}, this._level = void 0, this._transactionName = void 0, this._fingerprint = void 0, this._session = void 0, this._conversationId = void 0, tn(this, void 0), this._attachments = [], this.setPropagationContext({
                traceId: Z(),
                sampleRand: w()
            }), this._notifyScopeListeners(), this
        }
        addBreadcrumb(t, e) {
            let n = "number" == typeof e ? e : 100;
            if (n <= 0) return this;
            let r = {
                timestamp: W(),
                ...t,
                message: t.message ? V(t.message, 2048) : t.message
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
            let n = (null == e ? void 0 : e.event_id) || H();
            if (!this._client) return l && x.warn("No client configured on scope - will not capture exception!"), n;
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
            let i = (null == n ? void 0 : n.event_id) || H();
            if (!this._client) return l && x.warn("No client configured on scope - will not capture message!"), i;
            let a = null != (r = null == n ? void 0 : n.syntheticException) ? r : Error(t);
            return this._client.captureMessage(t, e, {
                originalException: t,
                syntheticException: a,
                ...n,
                event_id: i
            }, this), i
        }
        captureEvent(t, e) {
            let n = t.event_id || (null == e ? void 0 : e.event_id) || H();
            return this._client ? this._client.captureEvent(t, {
                ...e,
                event_id: n
            }, this) : l && x.warn("No client configured on scope - will not capture event!"), n
        }
        _notifyScopeListeners() {
            this._notifyingListeners || (this._notifyingListeners = !0, this._scopeListeners.forEach(t => {
                t(this)
            }), this._notifyingListeners = !1)
        }
        constructor() {
            this._notifyingListeners = !1, this._scopeListeners = [], this._eventProcessors = [], this._breadcrumbs = [], this._attachments = [], this._user = {}, this._tags = {}, this._attributes = {}, this._extra = {}, this._contexts = {}, this._sdkProcessingMetadata = {}, this._propagationContext = {
                traceId: Z(),
                sampleRand: w()
            }
        }
    }
    t.s(["Scope", 0, ti], 937463);
    let ta = t => t instanceof Promise && !t[ts],
        ts = Symbol("chained PromiseLike"),
        to = (t, e, n) => {
            let r = t.then(t => (e(t), t), t => {
                throw n(t), t
            });
            return ta(r) && ta(t) ? r : tc(t, r)
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
                [ts]: !0
            }), e
        };
    t.s(["chainAndCopyPromiseLike", 0, to], 228515);
    class tu {
        withScope(t) {
            let e, n = this._pushScope();
            try {
                e = t(n)
            } catch (t) {
                throw this._popScope(), t
            }
            return E(e) ? to(e, () => this._popScope(), () => this._popScope()) : (this._popScope(), e)
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

    function tp(t) {
        return tl().withScope(t)
    }

    function td(t, e) {
        let n = tl();
        return n.withScope(() => (n.getStackTop().scope = t, e(t)))
    }

    function t_(t) {
        return tl().withScope(() => t(tl().getIsolationScope()))
    }

    function tg(t) {
        let e = c(t);
        return e.acs ? e.acs : {
            withIsolationScope: t_,
            withScope: tp,
            withSetScope: td,
            withSetIsolationScope: (t, e) => t_(e),
            getCurrentScope: () => tl().getScope(),
            getIsolationScope: () => tl().getIsolationScope()
        }
    }

    function tf() {
        return tg(o()).getCurrentScope()
    }
    t.s(["getAsyncContextStrategy", 0, tg], 688671), t.s(["getClient", 0, function() {
        return tf().getClient()
    }, "getCurrentScope", 0, tf, "getGlobalScope", 0, function() {
        return u("globalScope", () => new ti)
    }, "getIsolationScope", 0, function() {
        return tg(o()).getIsolationScope()
    }, "getTraceContextFromScope", 0, function(t) {
        let e = null == i ? void 0 : i();
        if (e) return {
            trace_id: e.traceId,
            span_id: e.spanId
        };
        let {
            traceId: n,
            parentSpanId: r,
            propagationSpanId: a
        } = t.getPropagationContext(), s = {
            trace_id: n,
            span_id: a || tt()
        };
        return r && (s.parent_span_id = r), s
    }, "hasExternalPropagationContext", 0, function() {
        return void 0 !== i
    }, "withIsolationScope", 0, function() {
        for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
        let r = tg(o());
        if (2 === e.length) {
            let [t, n] = e;
            return t ? r.withSetIsolationScope(t, n) : r.withIsolationScope(n)
        }
        return r.withIsolationScope(e[0])
    }, "withScope", 0, function() {
        for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
        let r = tg(o());
        if (2 === e.length) {
            let [t, n] = e;
            return t ? r.withSetScope(t, n) : r.withScope(n)
        }
        return r.withScope(e[0])
    }], 230242), t.s(["GEN_AI_CONVERSATION_ID_ATTRIBUTE", 0, "gen_ai.conversation.id", "SEMANTIC_ATTRIBUTE_EXCLUSIVE_TIME", 0, "sentry.exclusive_time", "SEMANTIC_ATTRIBUTE_HTTP_REQUEST_METHOD", 0, "http.request.method", "SEMANTIC_ATTRIBUTE_PROFILE_ID", 0, "sentry.profile_id", "SEMANTIC_ATTRIBUTE_SENTRY_CUSTOM_SPAN_NAME", 0, "sentry.custom_span_name", "SEMANTIC_ATTRIBUTE_SENTRY_ENVIRONMENT", 0, "sentry.environment", "SEMANTIC_ATTRIBUTE_SENTRY_IDLE_SPAN_FINISH_REASON", 0, "sentry.idle_span_finish_reason", "SEMANTIC_ATTRIBUTE_SENTRY_MEASUREMENT_UNIT", 0, "sentry.measurement_unit", "SEMANTIC_ATTRIBUTE_SENTRY_MEASUREMENT_VALUE", 0, "sentry.measurement_value", "SEMANTIC_ATTRIBUTE_SENTRY_OP", 0, "sentry.op", "SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN", 0, "sentry.origin", "SEMANTIC_ATTRIBUTE_SENTRY_PREVIOUS_TRACE_SAMPLE_RATE", 0, "sentry.previous_trace_sample_rate", "SEMANTIC_ATTRIBUTE_SENTRY_RELEASE", 0, "sentry.release", "SEMANTIC_ATTRIBUTE_SENTRY_SAMPLE_RATE", 0, "sentry.sample_rate", "SEMANTIC_ATTRIBUTE_SENTRY_SDK_NAME", 0, "sentry.sdk.name", "SEMANTIC_ATTRIBUTE_SENTRY_SDK_VERSION", 0, "sentry.sdk.version", "SEMANTIC_ATTRIBUTE_SENTRY_SEGMENT_ID", 0, "sentry.segment.id", "SEMANTIC_ATTRIBUTE_SENTRY_SEGMENT_NAME", 0, "sentry.segment.name", "SEMANTIC_ATTRIBUTE_SENTRY_SOURCE", 0, "sentry.source", "SEMANTIC_ATTRIBUTE_URL_FULL", 0, "url.full", "SEMANTIC_ATTRIBUTE_USER_EMAIL", 0, "user.email", "SEMANTIC_ATTRIBUTE_USER_ID", 0, "user.id", "SEMANTIC_ATTRIBUTE_USER_IP_ADDRESS", 0, "user.ip_address", "SEMANTIC_ATTRIBUTE_USER_USERNAME", 0, "user.name", "SEMANTIC_LINK_ATTRIBUTE_LINK_TYPE", 0, "sentry.link.type"], 28775)
}, 80768, 359335, 328464, 841089, 768445, t => {
    "use strict";
    let e, n, r, i;
    var a = t.i(230242),
        s = t.i(777246),
        o = t.i(220778),
        c = t.i(688671),
        u = t.i(254944),
        l = t.i(28775);
    t.i(267905);
    var p = t.i(169533);
    t.i(563215);
    var d = t.i(499063),
        _ = t.i(814350),
        g = t.i(935183),
        f = t.i(370551),
        h = t.i(912583),
        S = t.i(361341),
        m = t.i(619834),
        T = t.i(5182);
    t.i(267617);
    var E = t.i(486899),
        v = t.i(842363),
        y = t.i(48038),
        b = t.i(873598),
        I = t.i(951059);
    t.i(582741);
    var A = t.i(145821);

    function N(t, e) {
        let n = R();
        return n.withActiveSpan ? n.withActiveSpan(t, e) : (0, a.withScope)(n => ((0, m._setSpanForScope)(n, t || void 0), e(n)))
    }

    function R() {
        let t = (0, u.getMainCarrier)();
        return (0, c.getAsyncContextStrategy)(t)
    }

    function C(t, e, n) {
        var r, i;
        let o = (0, a.getClient)(),
            c = (null == o ? void 0 : o.getOptions()) || {},
            {
                name: u = ""
            } = t,
            d = {
                spanAttributes: {
                    ...t.attributes
                },
                spanName: u,
                parentSampled: n
            };
        null == o || o.emit("beforeSampling", d, {
            decision: !1
        });
        let _ = null != (r = d.parentSampled) ? r : n,
            h = d.spanAttributes,
            S = e.getPropagationContext(),
            m = x(e),
            [T, E, v] = m ? [!1] : (0, y.sampleSpan)(c, {
                name: u,
                parentSampled: _,
                attributes: h,
                parentSampleRate: (0, f.parseSampleRate)(null == (i = S.dsc) ? void 0 : i.sample_rate)
            }, S.sampleRand),
            b = new I.SentrySpan({
                ...t,
                attributes: {
                    [l.SEMANTIC_ATTRIBUTE_SENTRY_SOURCE]: "custom",
                    [l.SEMANTIC_ATTRIBUTE_SENTRY_SAMPLE_RATE]: void 0 !== E && v ? E : void 0,
                    ...h
                },
                sampled: T
            });
        return T || !o || m || (s.DEBUG_BUILD && p.debug.log("[Tracing] Discarding root span because its trace was not chosen to be sampled."), o.recordDroppedEvent("sample_rate", (0, g.hasSpanStreamingEnabled)(o) ? "span" : "transaction")), o && o.emit("spanStart", b), b
    }

    function x(t) {
        return !0 === t.getScopeData().sdkProcessingMetadata.__SENTRY_SUPPRESS_TRACING__
    }
    t.s(["startInactiveSpan", 0, function(t) {
        let e = R();
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
                    return n.startTimestamp = (0, T.spanTimeInputToSeconds)(t.startTime), delete n.startTime, n
                }
                return e
            }(t),
            {
                forceTransaction: r,
                parentSpan: i
            } = t;
        return (t.scope ? e => (0, a.withScope)(t.scope, e) : void 0 !== i ? t => N(i, t) : t => t())(() => {
            let e = (0, a.getCurrentScope)(),
                s = function(t, e) {
                    if (e) return e;
                    if (null === e) return;
                    let n = (0, m._getSpanForScope)(t);
                    if (!n) return;
                    let r = (0, a.getClient)();
                    return (r ? r.getOptions() : {}).parentSpanIsAlwaysRootSpan ? (0, T.getRootSpan)(n) : n
                }(e, i),
                o = (0, a.getClient)();
            return t.onlyIfParent && !s ? (null == o || o.recordDroppedEvent("no_parent_span", "span"), new b.SentryNonRecordingSpan) : function(t) {
                var e, n, r, i;
                let s, o, {
                    parentSpan: c,
                    spanArguments: u,
                    forceTransaction: p,
                    scope: f
                } = t;
                if (!(0, d.hasSpansEnabled)()) {
                    let t = new b.SentryNonRecordingSpan;
                    if (p || !c) {
                        let e = {
                            sampled: "false",
                            sample_rate: "0",
                            transaction: u.name,
                            ...(0, E.getDynamicSamplingContextFromSpan)(t)
                        };
                        (0, E.freezeDscOnSpan)(t, e)
                    }
                    return t
                }
                let h = (0, a.getClient)();
                if (e = h, n = u, s = null == e ? void 0 : e.getOptions().ignoreSpans, e && (0, g.hasSpanStreamingEnabled)(e) && (null == s ? void 0 : s.length) && (0, _.shouldIgnoreSpan)({
                        description: n.name || "",
                        op: (null == (r = n.attributes) ? void 0 : r[l.SEMANTIC_ATTRIBUTE_SENTRY_OP]) || n.op,
                        attributes: n.attributes
                    }, s)) {
                    return x(f) || null == h || h.recordDroppedEvent("ignored", "span"), new b.SentryNonRecordingSpan({
                        dropReason: "ignored",
                        traceId: null != (i = null == c ? void 0 : c.spanContext().traceId) ? i : f.getPropagationContext().traceId
                    })
                }
                let S = (0, a.getIsolationScope)();
                if (c && !p) o = function(t, e, n) {
                    let {
                        spanId: r,
                        traceId: i
                    } = t.spanContext(), s = x(e), o = !s && (0, T.spanIsSampled)(t), c = o ? new I.SentrySpan({
                        ...n,
                        parentSpanId: r,
                        traceId: i,
                        sampled: o
                    }) : new b.SentryNonRecordingSpan({
                        traceId: i
                    });
                    (0, T.addChildSpanToSpan)(t, c);
                    let u = (0, a.getClient)();
                    return u && ((0, g.hasSpanStreamingEnabled)(u) && c instanceof b.SentryNonRecordingSpan && (t instanceof b.SentryNonRecordingSpan && t.dropReason ? (c.dropReason = t.dropReason, u.recordDroppedEvent(t.dropReason, "span")) : s || (c.dropReason = "sample_rate", u.recordDroppedEvent("sample_rate", "span"))), u.emit("spanStart", c), n.endTimestamp && (u.emit("spanEnd", c), u.emit("afterSpanEnd", c))), c
                }(c, f, u), (0, T.addChildSpanToSpan)(c, o);
                else if (c) {
                    let t = (0, E.getDynamicSamplingContextFromSpan)(c),
                        {
                            traceId: e,
                            spanId: n
                        } = c.spanContext(),
                        r = (0, T.spanIsSampled)(c);
                    o = C({
                        traceId: e,
                        parentSpanId: n,
                        ...u
                    }, f, r), (0, E.freezeDscOnSpan)(o, t)
                } else {
                    let {
                        traceId: t,
                        dsc: e,
                        parentSpanId: n,
                        sampled: r
                    } = {
                        ...S.getPropagationContext(),
                        ...f.getPropagationContext()
                    };
                    o = C({
                        traceId: t,
                        parentSpanId: n,
                        ...u
                    }, f, r), e && (0, E.freezeDscOnSpan)(o, e)
                }
                return (0, v.logSpanStart)(o), (0, A.setCapturedScopesOnSpan)(o, f, S), o
            }({
                parentSpan: s,
                spanArguments: n,
                forceTransaction: r,
                scope: e
            })
        })
    }, "startNewTrace", 0, function(t) {
        let e = R();
        return e.startNewTrace ? e.startNewTrace(t) : (0, a.withScope)(e => (e.setPropagationContext({
            traceId: (0, h.generateTraceId)(),
            sampleRand: (0, S.safeMathRandom)()
        }), s.DEBUG_BUILD && p.debug.log("Starting a new trace with id ".concat(e.getPropagationContext().traceId)), N(null, t)))
    }, "withActiveSpan", 0, N], 359335);
    var O = t.i(379705),
        M = t.i(823979),
        k = t.i(520952);

    function D(t) {
        return new P(e => {
            e(t)
        })
    }

    function U(t) {
        return new P((e, n) => {
            n(t)
        })
    }
    class P {
        then(t, e) {
            return new P((n, r) => {
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
            return new P((e, n) => {
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
                        if ((0, O.isThenable)(e)) return void e.then(n, r);
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
    t.s(["rejectedSyncPromise", 0, U, "resolvedSyncPromise", 0, D], 328464);
    var w = t.i(937463);
    t.i(79752);
    var L = t.i(489427),
        B = t.i(407977),
        j = t.i(785041);

    function F(t, e) {
        var n, r, i, a, s, o, c, u;
        let l, p, d, {
            fingerprint: _,
            span: g,
            breadcrumbs: f,
            sdkProcessingMetadata: h
        } = e;
        (function(t, e) {
            let {
                extra: n,
                tags: r,
                user: i,
                contexts: a,
                level: s,
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
            }), Object.keys(a).length && (t.contexts = {
                ...a,
                ...t.contexts
            }), s && (t.level = s), o && "transaction" !== t.type && (t.transaction = o)
        })(t, e), g && (n = t, r = g, n.contexts = {
            trace: (0, T.spanToTraceContext)(r),
            ...n.contexts
        }, n.sdkProcessingMetadata = {
            dynamicSamplingContext: (0, E.getDynamicSamplingContextFromSpan)(r),
            ...n.sdkProcessingMetadata
        }, l = (0, T.getRootSpan)(r), (p = (0, T.spanToJSON)(l).description) && !n.transaction && "transaction" === n.type && (n.transaction = p)), i = t, a = _, i.fingerprint = i.fingerprint ? Array.isArray(i.fingerprint) ? i.fingerprint : [i.fingerprint] : [], a && (i.fingerprint = i.fingerprint.concat(a)), i.fingerprint.length || delete i.fingerprint, s = t, o = f, d = [...s.breadcrumbs || [], ...o], s.breadcrumbs = d.length ? d : void 0, c = t, u = h, c.sdkProcessingMetadata = {
            ...c.sdkProcessingMetadata,
            ...u
        }
    }

    function G(t, e) {
        let {
            extra: n,
            tags: r,
            attributes: i,
            user: a,
            contexts: s,
            level: o,
            sdkProcessingMetadata: c,
            breadcrumbs: u,
            fingerprint: l,
            eventProcessors: p,
            attachments: d,
            propagationContext: _,
            transactionName: g,
            span: f
        } = e;
        Y(t, "extra", n), Y(t, "tags", r), Y(t, "attributes", i), Y(t, "user", a), Y(t, "contexts", s), t.sdkProcessingMetadata = (0, j.merge)(t.sdkProcessingMetadata, c, 2), o && (t.level = o), g && (t.transactionName = g), f && (t.span = f), u.length && (t.breadcrumbs = [...t.breadcrumbs, ...u]), l.length && (t.fingerprint = [...t.fingerprint, ...l]), p.length && (t.eventProcessors = [...t.eventProcessors, ...p]), d.length && (t.attachments = [...t.attachments, ...d]), t.propagationContext = {
            ...t.propagationContext,
            ..._
        }
    }

    function Y(t, e, n) {
        t[e] = (0, j.merge)(t[e], n, 1)
    }

    function J(t, e) {
        let n = (0, a.getGlobalScope)().getScopeData();
        return t && G(n, t.getScopeData()), e && G(n, e.getScopeData()), n
    }
    t.s(["applyScopeDataToEvent", 0, F, "getCombinedScopeData", 0, J], 841089);
    var V = t.i(163772),
        z = t.i(193218);

    function H(t) {
        if (t) {
            var e;
            return (e = t) instanceof w.Scope || "function" == typeof e || Object.keys(t).some(t => K.includes(t)) ? {
                captureContext: t
            } : t
        }
    }
    let K = ["user", "level", "extra", "contexts", "tags", "fingerprint", "propagationContext"];

    function W() {
        let t = (0, a.getIsolationScope)(),
            e = (0, a.getCurrentScope)().getSession() || t.getSession();
        e && (0, o.closeSession)(e), q(), t.setSession()
    }

    function q() {
        let t = (0, a.getIsolationScope)(),
            e = (0, a.getClient)(),
            n = t.getSession();
        n && e && e.captureSession(n)
    }
    t.s(["parseEventHintOrCaptureContext", 0, H, "prepareEvent", 0, function(t, a, o, c, u, l) {
        var d, _, g, f, h;
        let S, {
                normalizeDepth: m = 3,
                normalizeMaxBreadth: T = 1e3
            } = t,
            E = {
                ...a,
                event_id: a.event_id || o.event_id || (0, M.uuid4)(),
                timestamp: a.timestamp || (0, z.dateTimestampInSeconds)()
            },
            v = o.integrations || t.integrations.map(t => t.name);
        (function(t, e) {
            let {
                environment: n,
                release: r,
                dist: i,
                maxValueLength: a
            } = e;
            t.environment = t.environment || n || k.DEFAULT_ENVIRONMENT, !t.release && r && (t.release = r), !t.dist && i && (t.dist = i);
            let s = t.request;
            if ((null == s ? void 0 : s.url) && a && (s.url = (0, V.truncate)(s.url, a)), a) {
                var o, c;
                null == (c = t.exception) || null == (o = c.values) || o.forEach(t => {
                    t.value && (t.value = (0, V.truncate)(t.value, a))
                })
            }
        })(E, t), d = E, (_ = v).length > 0 && (d.sdk = d.sdk || {}, d.sdk.integrations = [...d.sdk.integrations || [], ..._]), u && u.emit("applyFrameMetadata", a), void 0 === a.type && (g = E, S = function(t) {
            let a = L.GLOBAL_OBJ._sentryDebugIds,
                s = L.GLOBAL_OBJ._debugIds;
            if (!a && !s) return {};
            let o = a ? Object.keys(a) : [],
                c = s ? Object.keys(s) : [];
            if (i && o.length === n && c.length === r) return i;
            n = o.length, r = c.length, i = {}, e || (e = {});
            let u = (n, r) => {
                for (let a of n) {
                    let n = r[a],
                        s = null == e ? void 0 : e[a];
                    if (s && i && n) i[s[0]] = n, e && (e[a] = [s[0], n]);
                    else if (n) {
                        let r = t(a);
                        for (let t = r.length - 1; t >= 0; t--) {
                            let s = r[t],
                                o = null == s ? void 0 : s.filename;
                            if (o && i && e) {
                                i[o] = n, e[a] = [o, n];
                                break
                            }
                        }
                    }
                }
            };
            return a && u(o, a), s && u(c, s), i
        }(t.stackParser), null == (h = g.exception) || null == (f = h.values) || f.forEach(t => {
            var e, n;
            null == (n = t.stacktrace) || null == (e = n.frames) || e.forEach(t => {
                t.filename && (t.debug_id = S[t.filename])
            })
        }));
        let y = function(t, e) {
            if (!e) return t;
            let n = t ? t.clone() : new w.Scope;
            return n.update(e), n
        }(c, o.captureContext);
        o.mechanism && (0, M.addExceptionMechanism)(E, o.mechanism);
        let b = u ? u.getEventProcessors() : [],
            I = J(l, y),
            A = [...o.attachments || [], ...I.attachments];
        A.length && (o.attachments = A), F(E, I);
        let N = [...b, ...I.eventProcessors];
        return (o.data && !0 === o.data.__sentry__ ? D(E) : function(t, e, n) {
            let r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : 0;
            try {
                let i = function t(e, n, r, i) {
                    let a = r[i];
                    if (!e || !a) return e;
                    let o = a({
                        ...e
                    }, n);
                    return (s.DEBUG_BUILD && null === o && p.debug.log('Event processor "'.concat(a.id || "?", '" dropped event')), (0, O.isThenable)(o)) ? o.then(e => t(e, n, r, i + 1)) : t(o, n, r, i + 1)
                }(e, n, t, r);
                return (0, O.isThenable)(i) ? i : D(i)
            } catch (t) {
                return U(t)
            }
        }(N, E, o)).then(t => (t && function(t) {
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
        }(t), "number" == typeof m && m > 0) ? function(t, e, n) {
            var r, i;
            if (!t) return null;
            let a = {
                ...t,
                ...t.breadcrumbs && {
                    breadcrumbs: t.breadcrumbs.map(t => ({
                        ...t,
                        ...t.data && {
                            data: (0, B.normalize)(t.data, e, n)
                        }
                    }))
                },
                ...t.user && {
                    user: (0, B.normalize)(t.user, e, n)
                },
                ...t.contexts && {
                    contexts: (0, B.normalize)(t.contexts, e, n)
                },
                ...t.extra && {
                    extra: (0, B.normalize)(t.extra, e, n)
                }
            };
            return (null == (r = t.contexts) ? void 0 : r.trace) && a.contexts && (a.contexts.trace = t.contexts.trace, t.contexts.trace.data && (a.contexts.trace.data = (0, B.normalize)(t.contexts.trace.data, e, n))), t.spans && (a.spans = t.spans.map(t => ({
                ...t,
                ...t.data && {
                    data: (0, B.normalize)(t.data, e, n)
                }
            }))), (null == (i = t.contexts) ? void 0 : i.flags) && a.contexts && (a.contexts.flags = (0, B.normalize)(t.contexts.flags, 3, n)), a
        }(t, m, T) : t)
    }], 768445), t.s(["addEventProcessor", 0, function(t) {
        (0, a.getIsolationScope)().addEventProcessor(t)
    }, "captureEvent", 0, function(t, e) {
        return (0, a.getCurrentScope)().captureEvent(t, e)
    }, "captureException", 0, function(t, e) {
        return (0, a.getCurrentScope)().captureException(t, H(e))
    }, "captureMessage", 0, function(t, e) {
        let n = "string" == typeof e ? e : void 0,
            r = "string" != typeof e ? {
                captureContext: e
            } : void 0;
        return (0, a.getCurrentScope)().captureMessage(t, n, r)
    }, "captureSession", 0, function() {
        let t = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
        t ? W() : q()
    }, "isEnabled", 0, function() {
        let t = (0, a.getClient)();
        return (null == t ? void 0 : t.getOptions().enabled) !== !1 && !!(null == t ? void 0 : t.getTransport())
    }, "lastEventId", 0, function() {
        return (0, a.getIsolationScope)().lastEventId()
    }, "setContext", 0, function(t, e) {
        (0, a.getIsolationScope)().setContext(t, e)
    }, "setTag", 0, function(t, e) {
        (0, a.getIsolationScope)().setTag(t, e)
    }, "startSession", 0, function(t) {
        let e = (0, a.getIsolationScope)(),
            {
                user: n
            } = J(e, (0, a.getCurrentScope)()),
            {
                userAgent: r
            } = L.GLOBAL_OBJ.navigator || {},
            i = (0, o.makeSession)({
                user: n,
                ...r && {
                    userAgent: r
                },
                ...t
            }),
            s = e.getSession();
        return (null == s ? void 0 : s.status) === "ok" && (0, o.updateSession)(s, {
            status: "exited"
        }), W(), e.setSession(i), i
    }], 80768)
}, 842363, t => {
    "use strict";
    var e = t.i(777246),
        n = t.i(169533),
        r = t.i(5182);
    t.s(["logSpanEnd", 0, function(t) {
        if (!e.DEBUG_BUILD) return;
        let {
            description: i = "< unknown name >",
            op: a = "< unknown op >"
        } = (0, r.spanToJSON)(t), {
            spanId: s
        } = t.spanContext(), o = (0, r.getRootSpan)(t) === t, c = '[Tracing] Finishing "'.concat(a, '" ').concat(o ? "root " : "", 'span "').concat(i, '" with ID ').concat(s);
        n.debug.log(c)
    }, "logSpanStart", 0, function(t) {
        if (!e.DEBUG_BUILD) return;
        let {
            description: i = "< unknown name >",
            op: a = "< unknown op >",
            parent_span_id: s
        } = (0, r.spanToJSON)(t), {
            spanId: o
        } = t.spanContext(), c = (0, r.spanIsSampled)(t), u = (0, r.getRootSpan)(t), l = u === t, p = "[Tracing] Starting ".concat(c ? "sampled" : "unsampled", " ").concat(l ? "root " : "", "span"), d = ["op: ".concat(a), "name: ".concat(i), "ID: ".concat(o)];
        if (s && d.push("parent ID: ".concat(s)), !l) {
            let {
                op: t,
                description: e
            } = (0, r.spanToJSON)(u);
            d.push("root ID: ".concat(u.spanContext().spanId)), t && d.push("root op: ".concat(t)), e && d.push("root description: ".concat(e))
        }
        n.debug.log("".concat(p, "\n  ").concat(d.join("\n  ")))
    }])
}, 269892, t => {
    "use strict";
    var e = t.i(777246),
        n = t.i(28775),
        r = t.i(169533),
        i = t.i(5182);
    t.s(["setMeasurement", 0, function(t, a, s) {
        let o = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : (0, i.getActiveSpan)(),
            c = o && (0, i.getRootSpan)(o);
        c && (e.DEBUG_BUILD && r.debug.log("[Measurement] Setting measurement on root span: ".concat(t, " = ").concat(a, " ").concat(s)), c.addEvent(t, {
            [n.SEMANTIC_ATTRIBUTE_SENTRY_MEASUREMENT_VALUE]: a,
            [n.SEMANTIC_ATTRIBUTE_SENTRY_MEASUREMENT_UNIT]: s
        }))
    }, "timedEventsToMeasurements", 0, function(t) {
        if (!t || 0 === t.length) return;
        let e = {};
        return t.forEach(t => {
            let r = t.attributes || {},
                i = r[n.SEMANTIC_ATTRIBUTE_SENTRY_MEASUREMENT_UNIT],
                a = r[n.SEMANTIC_ATTRIBUTE_SENTRY_MEASUREMENT_VALUE];
            "string" == typeof i && "number" == typeof a && (e[t.name] = {
                value: a,
                unit: i
            })
        }), e
    }])
}, 48038, t => {
    "use strict";
    var e = t.i(777246),
        n = t.i(169533),
        r = t.i(499063),
        i = t.i(370551);
    t.s(["sampleSpan", 0, function(t, a, s) {
        let o, c;
        if (!(0, r.hasSpansEnabled)(t)) return [!1];
        "function" == typeof t.tracesSampler ? (o = t.tracesSampler({
            ...a,
            inheritOrSampleWith: t => "number" == typeof a.parentSampleRate ? a.parentSampleRate : "boolean" == typeof a.parentSampled ? Number(a.parentSampled) : t
        }), c = !0) : void 0 !== a.parentSampled ? o = a.parentSampled : void 0 !== t.tracesSampleRate && (o = t.tracesSampleRate, c = !0);
        let u = (0, i.parseSampleRate)(o);
        if (void 0 === u) return e.DEBUG_BUILD && n.debug.warn("[Tracing] Discarding root span because of invalid sample rate. Sample rate must be a boolean or a number between 0 and 1. Got ".concat(JSON.stringify(o), " of type ").concat(JSON.stringify(typeof o), ".")), [!1];
        if (!u) return e.DEBUG_BUILD && n.debug.log("[Tracing] Discarding transaction because ".concat("function" == typeof t.tracesSampler ? "tracesSampler returned 0 or false" : "a negative sampling decision was inherited or tracesSampleRate is set to 0")), [!1, u, c];
        let l = s < u;
        return !l && e.DEBUG_BUILD && n.debug.log("[Tracing] Discarding transaction because it's not included in the random sample (sampling rate = ".concat(Number(o), ")")), [l, u, c]
    }])
}, 873598, 287688, 407977, 306787, 378451, t => {
    "use strict";
    var e = t.i(912583),
        n = t.i(5182);
    t.s(["SentryNonRecordingSpan", 0, class {
        spanContext() {
            return {
                spanId: this._spanId,
                traceId: this._traceId,
                traceFlags: n.TRACE_FLAG_NONE
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
            this._traceId = t.traceId || (0, e.generateTraceId)(), this._spanId = t.spanId || (0, e.generateSpanId)(), this.dropReason = t.dropReason
        }
    }], 873598);
    var r = t.i(486899),
        i = t.i(728441);

    function a(t) {
        return !!t && "function" == typeof t && "_streamed" in t && !!t._streamed
    }
    t.s(["isStreamedBeforeSendSpanCallback", 0, a], 287688);
    var s = t.i(127229),
        o = t.i(254944),
        c = t.i(379705);
    let u = Symbol.for("sentry.skipNormalization"),
        l = Symbol.for("sentry.overrideNormalizationDepth");
    var p = t.i(79752);

    function d(e) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 100,
            r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : Infinity;
        try {
            return function e(n, r) {
                let a, s, o = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : Infinity,
                    d = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : Infinity,
                    _ = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : (a = new WeakSet, [function(t) {
                        return !!a.has(t) || (a.add(t), !1)
                    }, function(t) {
                        a.delete(t)
                    }]),
                    [g, f] = _;
                if (null == r || ["boolean", "string"].includes(typeof r) || "number" == typeof r && Number.isFinite(r)) return r;
                let h = function(e, n) {
                    try {
                        var r;
                        let i;
                        if ("domain" === e && n && "object" == typeof n && n._events) return "[Domain]";
                        if ("domainEmitter" === e) return "[DomainEmitter]";
                        if (n === t.g) return "[Global]";
                        if ("u" > typeof window && n === window) return "[Window]";
                        if ("u" > typeof document && n === document) return "[Document]";
                        if ((0, c.isVueViewModel)(n)) return (0, p.getVueInternalName)(n);
                        if ((0, c.isSyntheticEvent)(n)) return "[SyntheticEvent]";
                        if ("number" == typeof n && !Number.isFinite(n)) return "[".concat(n, "]");
                        if ("function" == typeof n) return "[Function: ".concat((0, p.getFunctionName)(n), "]");
                        if ("symbol" == typeof n) return "[".concat(String(n), "]");
                        if ("bigint" == typeof n) return "[BigInt: ".concat(String(n), "]");
                        let a = (r = n, i = Object.getPrototypeOf(r), (null == i ? void 0 : i.constructor) ? i.constructor.name : "null prototype");
                        if (/^HTML(\w*)Element$/.test(a)) return "[HTMLElement: ".concat(a, "]");
                        return "[object ".concat(a, "]")
                    } catch (t) {
                        return "**non-serializable** (".concat(t, ")")
                    }
                }(n, r);
                if (!h.startsWith("[object ")) return h;
                if (r[u]) return r;
                let S = (s = r[l], "number" == typeof s ? s : void 0),
                    m = void 0 !== S ? S : o;
                if (0 === m) return h.replace("object ", "");
                if (g(r)) return "[Circular ~]";
                if (r && "function" == typeof r.toJSON) try {
                    let t = r.toJSON();
                    return e("", t, m - 1, d, _)
                } catch (t) {}
                let T = Array.isArray(r) ? [] : {},
                    E = 0,
                    v = (0, i.convertToPlainObject)(r);
                for (let t in v) {
                    if (!Object.prototype.hasOwnProperty.call(v, t)) continue;
                    if (E >= d) {
                        T[t] = "[MaxProperties ~]";
                        break
                    }
                    let n = v[t];
                    T[t] = e(t, n, m - 1, d, _), E++
                }
                return f(r), T
            }("", e, n, r)
        } catch (t) {
            return {
                ERROR: "**non-serializable** (".concat(t, ")")
            }
        }
    }
    t.s(["normalize", 0, d, "normalizeToSize", 0, function t(e) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 3,
            r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 102400,
            i = d(e, n);
        return ~-encodeURI(JSON.stringify(i)).split(/%..|./).length > r ? t(e, n - 1, r) : i
    }], 407977);
    var _ = t.i(489427);

    function g(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [];
        return [t, e]
    }

    function f(t, e) {
        for (let n of t[1]) {
            let t = n[0].type;
            if (e(n, t)) return !0
        }
        return !1
    }

    function h(t) {
        let e = (0, o.getSentryCarrier)(_.GLOBAL_OBJ);
        return e.encodePolyfill ? e.encodePolyfill(t) : new TextEncoder().encode(t)
    }

    function S(t) {
        return [{
            type: "span"
        }, t]
    }
    let m = {
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

    function T(t) {
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

    function E(t, e, n, r) {
        var i;
        let a = null == (i = t.sdkProcessingMetadata) ? void 0 : i.dynamicSamplingContext;
        return {
            event_id: t.event_id,
            sent_at: new Date().toISOString(),
            ...e && {
                sdk: e
            },
            ...!!n && r && {
                dsn: (0, s.dsnToString)(r)
            },
            ...a && {
                trace: a
            }
        }
    }
    t.s(["addItemToEnvelope", 0, function(t, e) {
        let [n, r] = t;
        return [n, [...r, e]]
    }, "createAttachmentEnvelopeItem", 0, function(t) {
        let e = "string" == typeof t.data ? h(t.data) : t.data;
        return [{
            type: "attachment",
            length: e.length,
            filename: t.filename,
            content_type: t.contentType,
            attachment_type: t.attachmentType
        }, e]
    }, "createEnvelope", 0, g, "createEventEnvelopeHeaders", 0, E, "createSpanEnvelopeItem", 0, S, "envelopeContainsItemType", 0, function(t, e) {
        return f(t, (t, n) => e.includes(n))
    }, "envelopeItemTypeToDataCategory", 0, function(t) {
        return t in m ? m[t] : t
    }, "forEachEnvelopeItem", 0, f, "getSdkMetadataForEnvelopeHeader", 0, T, "serializeEnvelope", 0, function(t) {
        let [e, n] = t, r = JSON.stringify(e);

        function i(t) {
            "string" == typeof r ? r = "string" == typeof t ? r + t : [h(r), t] : r.push("string" == typeof t ? h(t) : t)
        }
        for (let t of n) {
            let [e, n] = t;
            if (i("\n".concat(JSON.stringify(e), "\n")), "string" == typeof n || n instanceof Uint8Array) i(n);
            else {
                let t;
                try {
                    t = JSON.stringify(n)
                } catch (e) {
                    t = JSON.stringify(d(n))
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
    }], 306787);
    var v = t.i(814350);
    t.s(["createEventEnvelope", 0, function(t, e, n, r) {
        let i = T(n),
            a = t.type && "replay_event" !== t.type ? t.type : "event";
        ! function(t, e) {
            var n, r, i, a;
            if (!e) return;
            let s = t.sdk || {};
            t.sdk = {
                ...s,
                name: s.name || e.name,
                version: s.version || e.version,
                integrations: [...(null == (n = t.sdk) ? void 0 : n.integrations) || [], ...e.integrations || []],
                packages: [...(null == (r = t.sdk) ? void 0 : r.packages) || [], ...e.packages || []],
                settings: (null == (i = t.sdk) ? void 0 : i.settings) || e.settings ? {
                    ...null == (a = t.sdk) ? void 0 : a.settings,
                    ...e.settings
                } : void 0
            }
        }(t, null == n ? void 0 : n.sdk);
        let s = E(t, i, r, e);
        return delete t.sdkProcessingMetadata, g(s, [
            [{
                type: a
            }, t]
        ])
    }, "createSessionEnvelope", 0, function(t, e, n, r) {
        let i = T(n);
        return g({
            sent_at: new Date().toISOString(),
            ...i && {
                sdk: i
            },
            ...!!r && e && {
                dsn: (0, s.dsnToString)(e)
            }
        }, ["aggregates" in t ? [{
            type: "sessions"
        }, t] : [{
            type: "session"
        }, t.toJSON()]])
    }, "createSpanEnvelope", 0, function(t, e) {
        let i = (0, r.getDynamicSamplingContextFromSpan)(t[0]),
            o = null == e ? void 0 : e.getDsn(),
            c = null == e ? void 0 : e.getOptions().tunnel,
            u = {
                sent_at: new Date().toISOString(),
                ...!!i.trace_id && !!i.public_key && {
                    trace: i
                },
                ...!!c && o && {
                    dsn: (0, s.dsnToString)(o)
                }
            },
            {
                beforeSendSpan: l,
                ignoreSpans: p
            } = (null == e ? void 0 : e.getOptions()) || {},
            d = (null == p ? void 0 : p.length) ? t.filter(t => {
                let e = (0, n.spanToJSON)(t);
                return !(0, v.shouldIgnoreSpan)({
                    description: e.description,
                    op: e.op,
                    attributes: e.data
                }, p)
            }) : t,
            _ = t.length - d.length;
        _ && (null == e || e.recordDroppedEvent("before_send", "span", _));
        let f = l ? t => {
                let e = (0, n.spanToJSON)(t),
                    r = a(l) ? e : l(e);
                return r || ((0, n.showSpanDropWarning)(), e)
            } : n.spanToJSON,
            h = [];
        for (let t of d) {
            let e = f(t);
            e && h.push(S(e))
        }
        return g(u, h)
    }], 378451)
}, 951059, t => {
    "use strict";
    var e = t.i(230242),
        n = t.i(777246),
        r = t.i(378451),
        i = t.i(28775),
        a = t.i(169533),
        s = t.i(912583),
        o = t.i(5182),
        c = t.i(193218),
        u = t.i(486899),
        l = t.i(842363),
        p = t.i(269892),
        d = t.i(935183),
        _ = t.i(145821);

    function g(t) {
        return t && "number" == typeof t || t instanceof Date || Array.isArray(t)
    }

    function f(t) {
        return !!t.start_timestamp && !!t.timestamp && !!t.span_id && !!t.trace_id
    }
    t.s(["SentrySpan", 0, class t {
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
                traceFlags: n ? o.TRACE_FLAG_SAMPLED : o.TRACE_FLAG_NONE
            }
        }
        setAttribute(t, e) {
            return void 0 === e ? delete this._attributes[t] : this._attributes[t] = e, this
        }
        setAttributes(t) {
            return Object.keys(t).forEach(e => this.setAttribute(e, t[e])), this
        }
        updateStartTime(t) {
            this._startTime = (0, o.spanTimeInputToSeconds)(t)
        }
        setStatus(t) {
            return this._status = t, this
        }
        updateName(t) {
            return this._name = t, this.setAttribute(i.SEMANTIC_ATTRIBUTE_SENTRY_SOURCE, "custom"), this
        }
        end(t) {
            this._endTime || (this._endTime = (0, o.spanTimeInputToSeconds)(t), (0, l.logSpanEnd)(this), this._onSpanEnded())
        }
        getSpanJSON() {
            return {
                data: this._attributes,
                description: this._name,
                op: this._attributes[i.SEMANTIC_ATTRIBUTE_SENTRY_OP],
                parent_span_id: this._parentSpanId,
                span_id: this._spanId,
                start_timestamp: this._startTime,
                status: (0, o.getStatusMessage)(this._status),
                timestamp: this._endTime,
                trace_id: this._traceId,
                origin: this._attributes[i.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN],
                profile_id: this._attributes[i.SEMANTIC_ATTRIBUTE_PROFILE_ID],
                exclusive_time: this._attributes[i.SEMANTIC_ATTRIBUTE_EXCLUSIVE_TIME],
                measurements: (0, p.timedEventsToMeasurements)(this._events),
                is_segment: this._isStandaloneSpan && (0, o.getRootSpan)(this) === this || void 0,
                segment_id: this._isStandaloneSpan ? (0, o.getRootSpan)(this).spanContext().spanId : void 0,
                links: (0, o.convertSpanLinksForEnvelope)(this._links)
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
                is_segment: this._isStandaloneSpan || this === (0, o.getRootSpan)(this),
                status: (0, o.getSimpleStatusMessage)(this._status),
                attributes: this._attributes,
                links: (0, o.getStreamedSpanLinks)(this._links)
            }
        }
        isRecording() {
            return !this._endTime && !!this._sampled
        }
        addEvent(t, e, r) {
            n.DEBUG_BUILD && a.debug.log("[Tracing] Adding an event to span:", t);
            let i = g(e) ? e : r || (0, c.timestampInSeconds)(),
                s = g(e) ? {} : e || {},
                u = {
                    name: t,
                    time: (0, o.spanTimeInputToSeconds)(i),
                    attributes: s
                };
            return this._events.push(u), this
        }
        isStandaloneSpan() {
            return !!this._isStandaloneSpan
        }
        _onSpanEnded() {
            let t = (0, e.getClient)();
            if (t && (t.emit("spanEnd", this), this._isStandaloneSpan || t.emit("afterSpanEnd", this)), !(this._isStandaloneSpan || this === (0, o.getRootSpan)(this))) return;
            if (this._isStandaloneSpan) return void(this._sampled ? function(t) {
                let n = (0, e.getClient)();
                if (!n) return;
                let r = t[1];
                r && 0 !== r.length ? n.sendEnvelope(t) : n.recordDroppedEvent("before_send", "span")
            }((0, r.createSpanEnvelope)([this], t)) : (n.DEBUG_BUILD && a.debug.log("[Tracing] Discarding standalone span because its trace was not chosen to be sampled."), t && t.recordDroppedEvent("sample_rate", "span")));
            if (t && (0, d.hasSpanStreamingEnabled)(t)) return void t.emit("afterSegmentSpanEnd", this);
            let i = this._convertSpanToTransaction();
            i && ((0, _.getCapturedScopesOnSpan)(this).scope || (0, e.getCurrentScope)()).captureEvent(i)
        }
        _convertSpanToTransaction() {
            var e;
            if (!f((0, o.spanToJSON)(this))) return;
            this._name || (n.DEBUG_BUILD && a.debug.warn("Transaction has no name, falling back to `<unlabeled transaction>`."), this._name = "<unlabeled transaction>");
            let {
                scope: r,
                isolationScope: s
            } = (0, _.getCapturedScopesOnSpan)(this), c = null == r || null == (e = r.getScopeData().sdkProcessingMetadata) ? void 0 : e.normalizedRequest;
            if (!0 !== this._sampled) return;
            let l = (0, o.getSpanDescendants)(this).filter(e => {
                    var n;
                    return e !== this && !((n = e) instanceof t && n.isStandaloneSpan())
                }).map(t => (0, o.spanToJSON)(t)).filter(f),
                d = this._attributes[i.SEMANTIC_ATTRIBUTE_SENTRY_SOURCE];
            delete this._attributes[i.SEMANTIC_ATTRIBUTE_SENTRY_CUSTOM_SPAN_NAME];
            let g = !1;
            l.forEach(t => {
                var e;
                delete t.data[i.SEMANTIC_ATTRIBUTE_SENTRY_CUSTOM_SPAN_NAME], (null == (e = t.op) ? void 0 : e.startsWith("gen_ai.")) && (g = !0)
            });
            let h = {
                    contexts: {
                        trace: (0, o.spanToTransactionTraceContext)(this)
                    },
                    spans: l.length > 1e3 ? l.sort((t, e) => t.start_timestamp - e.start_timestamp).slice(0, 1e3) : l,
                    start_timestamp: this._startTime,
                    timestamp: this._endTime,
                    transaction: this._name,
                    type: "transaction",
                    sdkProcessingMetadata: {
                        capturedSpanScope: r,
                        capturedSpanIsolationScope: s,
                        dynamicSamplingContext: (0, u.getDynamicSamplingContextFromSpan)(this),
                        hasGenAiSpans: g
                    },
                    request: c,
                    ...d && {
                        transaction_info: {
                            source: d
                        }
                    }
                },
                S = (0, p.timedEventsToMeasurements)(this._events);
            return S && Object.keys(S).length && (n.DEBUG_BUILD && a.debug.log("[Measurements] Adding measurements to transaction event", JSON.stringify(S, void 0, 2)), h.measurements = S), h
        }
        constructor(t = {}) {
            this._traceId = t.traceId || (0, s.generateTraceId)(), this._spanId = t.spanId || (0, s.generateSpanId)(), this._startTime = t.startTimestamp || (0, c.timestampInSeconds)(), this._links = t.links, this._attributes = {}, this.setAttributes({
                [i.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: "manual",
                [i.SEMANTIC_ATTRIBUTE_SENTRY_OP]: t.op,
                ...t.attributes
            }), this._name = t.name, t.parentSpanId && (this._parentSpanId = t.parentSpanId), "sampled" in t && (this._sampled = t.sampled), t.endTimestamp && (this._endTime = t.endTimestamp), this._events = [], this._isStandaloneSpan = t.isStandalone, this._endTime && this._onSpanEnded()
        }
    }])
}, 935183, t => {
    "use strict";
    t.s(["hasSpanStreamingEnabled", 0, function(t) {
        return "stream" === t.getOptions().traceLifecycle
    }])
}, 267905, t => {
    "use strict";
    var e = t.i(777246),
        n = t.i(169533),
        r = t.i(379705);
    let i = "sentry-";

    function a(t) {
        if (t && ((0, r.isString)(t) || Array.isArray(t))) return Array.isArray(t) ? t.reduce((t, e) => (Object.entries(s(e)).forEach(e => {
            let [n, r] = e;
            t[n] = r
        }), t), {}) : s(t)
    }

    function s(t) {
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
    t.s(["SENTRY_BAGGAGE_KEY_PREFIX", 0, i, "baggageHeaderToDynamicSamplingContext", 0, function(t) {
        let e = a(t);
        if (!e) return;
        let n = Object.entries(e).reduce((t, e) => {
            let [n, r] = e;
            return n.startsWith(i) && (t[n.slice(i.length)] = r), t
        }, {});
        return Object.keys(n).length > 0 ? n : void 0
    }, "dynamicSamplingContextToSentryBaggageHeader", 0, function(t) {
        if (t) {
            var r = Object.entries(t).reduce((t, e) => {
                let [n, r] = e;
                return r && (t["".concat(i).concat(n)] = r), t
            }, {});
            return 0 !== Object.keys(r).length ? Object.entries(r).reduce((t, r, i) => {
                let [a, s] = r, o = "".concat(encodeURIComponent(a), "=").concat(encodeURIComponent(s)), c = 0 === i ? o : "".concat(t, ",").concat(o);
                return c.length > 8192 ? (e.DEBUG_BUILD && n.debug.warn("Not adding key: ".concat(a, " with val: ").concat(s, " to baggage header due to exceeding baggage size limits.")), t) : c
            }, "") : void 0
        }
    }, "parseBaggageHeader", 0, a])
}, 127229, t => {
    "use strict";
    var e = t.i(777246),
        n = t.i(169533);
    let r = /^o(\d+)\./,
        i = /^(?:(\w+):)\/\/(?:(\w+)(?::(\w+)?)?@)((?:\[[:.%\w]+\]|[\w.-]+))(?::(\d+))?\/(.+)/;

    function a(t) {
        let e = i.exec(t);
        if (!e) return void(0, n.consoleSandbox)(() => {
            console.error("Invalid Sentry Dsn: ".concat(t))
        });
        let [r, a, o = "", c = "", u = "", l = ""] = e.slice(1), p = "", d = l, _ = d.split("/");
        if (_.length > 1 && (p = _.slice(0, -1).join("/"), d = _.pop()), d) {
            let t = d.match(/^\d+/);
            t && (d = t[0])
        }
        return s({
            host: c,
            pass: o,
            path: p,
            projectId: d,
            port: u,
            protocol: r,
            publicKey: a
        })
    }

    function s(t) {
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
    t.s(["dsnFromString", 0, a, "dsnToString", 0, function(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            {
                host: n,
                path: r,
                pass: i,
                port: a,
                projectId: s,
                protocol: o,
                publicKey: c
            } = t;
        return "".concat(o, "://").concat(c).concat(e && i ? ":".concat(i) : "") + "@".concat(n).concat(a ? ":".concat(a) : "", "/").concat(r ? "".concat(r, "/") : r).concat(s)
    }, "extractOrgIdFromClient", 0, function(t) {
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
    }, "makeDsn", 0, function(t) {
        let r = "string" == typeof t ? a(t) : s(t);
        if (r && function(t) {
                if (!e.DEBUG_BUILD) return !0;
                let {
                    port: r,
                    projectId: i,
                    protocol: a
                } = t;
                return !["protocol", "publicKey", "host", "projectId"].find(e => !t[e] && (n.debug.error("Invalid Sentry Dsn: ".concat(e, " missing")), !0)) && (i.match(/^\d+$/) ? "http" !== a && "https" !== a ? (n.debug.error("Invalid Sentry Dsn: Invalid protocol ".concat(a)), !1) : !(r && isNaN(parseInt(r, 10))) || (n.debug.error("Invalid Sentry Dsn: Invalid port ".concat(r)), !1) : (n.debug.error("Invalid Sentry Dsn: Invalid projectId ".concat(i)), !1))
            }(r)) return r
    }])
}, 563215, t => {
    "use strict";
    var e = t.i(228515),
        n = t.i(379705);
    t.s(["handleCallbackErrors", 0, function(t, r) {
        var i, a, s, o;
        let c, u = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : () => {},
            l = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : () => {};
        try {
            c = t()
        } catch (t) {
            throw r(t), u(), t
        }
        return i = c, a = r, s = u, o = l, (0, n.isThenable)(i) ? (0, e.chainAndCopyPromiseLike)(i, t => {
            s(), o(t)
        }, t => {
            a(t), s()
        }) : (s(), o(i), i)
    }])
}, 499063, 814350, t => {
    "use strict";
    var e = t.i(230242);
    t.s(["hasSpansEnabled", 0, function(t) {
        var n;
        if ("boolean" == typeof __SENTRY_TRACING__ && !__SENTRY_TRACING__) return !1;
        let r = t || (null == (n = (0, e.getClient)()) ? void 0 : n.getOptions());
        return !!r && (null != r.tracesSampleRate || !!r.tracesSampler)
    }], 499063);
    var n = t.i(777246),
        r = t.i(169533),
        i = t.i(163772);

    function a(t) {
        r.debug.log("Ignoring span ".concat(t.op, " - ").concat(t.description, " because it matches `ignoreSpans`."))
    }
    t.s(["reparentChildSpans", 0, function(t, e) {
        let n = e.parent_span_id,
            r = e.span_id;
        if (n)
            for (let e of t) e.parent_span_id === r && (e.parent_span_id = n)
    }, "shouldIgnoreSpan", 0, function(t, e) {
        if (!(null == e ? void 0 : e.length)) return !1;
        for (let s of e) {
            var r;
            if ("string" == typeof(r = s) || r instanceof RegExp) {
                if (t.description && (0, i.isMatchingPattern)(t.description, s)) return n.DEBUG_BUILD && a(t), !0;
                continue
            }
            let e = !!s.attributes && Object.keys(s.attributes).length > 0;
            if (!s.name && !s.op && !e) continue;
            let o = !s.name || t.description && (0, i.isMatchingPattern)(t.description, s.name),
                c = !s.op || t.op && (0, i.isMatchingPattern)(t.op, s.op),
                u = !s.attributes || Object.entries(s.attributes).every(e => {
                    var n;
                    let [r, a] = e;
                    return function(t, e) {
                        return "string" == typeof t && ("string" == typeof e || e instanceof RegExp) ? (0, i.isMatchingPattern)(t, e) : Array.isArray(t) && Array.isArray(e) ? t.length === e.length && t.every((t, n) => t === e[n]) : t === e
                    }(null == (n = t.attributes) ? void 0 : n[r], a)
                });
            if (o && c && u) return n.DEBUG_BUILD && a(t), !0
        }
        return !1
    }], 814350)
}, 370551, t => {
    "use strict";
    t.s(["parseSampleRate", 0, function(t) {
        if ("boolean" == typeof t) return Number(t);
        let e = "string" == typeof t ? parseFloat(t) : t;
        if (!("number" != typeof e || isNaN(e)) && !(e < 0) && !(e > 1)) return e
    }])
}, 5182, 267617, 520952, 486899, t => {
    "use strict";
    var e = t.i(688671),
        n = t.i(608045),
        r = t.i(254944),
        i = t.i(230242),
        a = t.i(28775),
        s = t.i(582741),
        o = t.i(145821),
        c = t.i(728441),
        u = t.i(912583),
        l = t.i(193218),
        p = t.i(169533),
        d = t.i(267905),
        _ = t.i(127229),
        g = t.i(370551),
        f = t.i(361341);
    let h = RegExp("^[ \\t]*([0-9a-f]{32})?-?([0-9a-f]{16})?-?([01])?[ \\t]*$");

    function S() {
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : (0, u.generateTraceId)(),
            e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : (0, u.generateSpanId)(),
            n = arguments.length > 2 ? arguments[2] : void 0,
            r = "";
        return void 0 !== n && (r = n ? "-1" : "-0"), "".concat(t, "-").concat(e).concat(r)
    }

    function m() {
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : (0, u.generateTraceId)(),
            e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : (0, u.generateSpanId)(),
            n = arguments.length > 2 ? arguments[2] : void 0;
        return "00-".concat(t, "-").concat(e, "-").concat(n ? "01" : "00")
    }
    t.s(["TRACEPARENT_REGEXP", 0, h, "generateSentryTraceHeader", 0, S, "generateTraceparentHeader", 0, m, "propagationContextFromHeaders", 0, function(t, e) {
        let n = function(t) {
                let e;
                if (!t) return;
                let n = t.match(h);
                if (n) return "1" === n[3] ? e = !0 : "0" === n[3] && (e = !1), {
                    traceId: n[1],
                    parentSampled: e,
                    parentSpanId: n[2]
                }
            }(t),
            r = (0, d.baggageHeaderToDynamicSamplingContext)(e);
        if (!(null == n ? void 0 : n.traceId)) return {
            traceId: (0, u.generateTraceId)(),
            sampleRand: (0, f.safeMathRandom)()
        };
        let i = function(t, e) {
            let n = (0, g.parseSampleRate)(null == e ? void 0 : e.sample_rand);
            if (void 0 !== n) return n;
            let r = (0, g.parseSampleRate)(null == e ? void 0 : e.sample_rate);
            return r && (null == t ? void 0 : t.parentSampled) !== void 0 ? t.parentSampled ? (0, f.safeMathRandom)() * r : r + (0, f.safeMathRandom)() * (1 - r) : (0, f.safeMathRandom)()
        }(n, r);
        r && (r.sample_rand = i.toString());
        let {
            traceId: a,
            parentSpanId: s,
            parentSampled: o
        } = n;
        return {
            traceId: a,
            parentSpanId: s,
            sampled: o,
            dsc: r || {},
            sampleRand: i
        }
    }, "shouldContinueTrace", 0, function(t, e) {
        let n = (0, _.extractOrgIdFromClient)(t);
        return e && n && e !== n ? (p.debug.log("Won't continue trace because org IDs don't match (incoming baggage: ".concat(e, ", SDK options: ").concat(n, ")")), !1) : !t.getOptions().strictTraceContinuation || (!e || !!n) && (!!e || !n) || (p.debug.log("Starting a new trace because strict trace continuation is enabled but one org ID is missing (incoming baggage: ".concat(e, ", Sentry client: ").concat(n, ")")), !1)
    }], 267617);
    var T = t.i(619834);
    let E = !1;

    function v(t) {
        return t && t.length > 0 ? t.map(t => {
            let {
                context: {
                    spanId: e,
                    traceId: n,
                    traceFlags: r,
                    ...i
                },
                attributes: a
            } = t;
            return {
                span_id: e,
                trace_id: n,
                sampled: 1 === r,
                attributes: a,
                ...i
            }
        }) : void 0
    }

    function y(t) {
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

    function b(t) {
        return "number" == typeof t ? I(t) : Array.isArray(t) ? t[0] + t[1] / 1e9 : t instanceof Date ? I(t.getTime()) : (0, l.timestampInSeconds)()
    }

    function I(t) {
        return t > 0x2540be3ff ? t / 1e3 : t
    }

    function A(t) {
        if (C(t)) return t.getSpanJSON();
        let {
            spanId: e,
            traceId: n
        } = t.spanContext();
        if (R(t)) {
            let {
                attributes: r,
                startTime: i,
                name: s,
                endTime: o,
                status: c,
                links: u
            } = t;
            return {
                span_id: e,
                trace_id: n,
                data: r,
                description: s,
                parent_span_id: N(t),
                start_timestamp: b(i),
                timestamp: b(o) || void 0,
                status: O(c),
                op: r[a.SEMANTIC_ATTRIBUTE_SENTRY_OP],
                origin: r[a.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN],
                links: v(u)
            }
        }
        return {
            span_id: e,
            trace_id: n,
            start_timestamp: 0,
            data: {}
        }
    }

    function N(t) {
        var e;
        return "parentSpanId" in t ? t.parentSpanId : "parentSpanContext" in t ? null == (e = t.parentSpanContext) ? void 0 : e.spanId : void 0
    }

    function R(t) {
        return !!t.attributes && !!t.startTime && !!t.name && !!t.endTime && !!t.status
    }

    function C(t) {
        return "function" == typeof t.getSpanJSON
    }

    function x(t) {
        let {
            traceFlags: e
        } = t.spanContext();
        return 1 === e
    }

    function O(t) {
        if (t && t.code !== s.SPAN_STATUS_UNSET) return t.code === s.SPAN_STATUS_OK ? "ok" : t.message || "internal_error"
    }

    function M(t) {
        return t && t.code !== s.SPAN_STATUS_OK && t.code !== s.SPAN_STATUS_UNSET && "cancelled" !== t.message ? "error" : "ok"
    }
    let k = "_sentryChildSpans",
        D = "_sentryRootSpan",
        U = P;

    function P(t) {
        return t[D] || t
    }
    t.s(["INTERNAL_getSegmentSpan", 0, P, "TRACE_FLAG_NONE", 0, 0, "TRACE_FLAG_SAMPLED", 0, 1, "addChildSpanToSpan", 0, function(t, e) {
        let n = t[D] || t;
        (0, c.addNonEnumerableProperty)(e, D, n), t[k] ? t[k].add(e) : (0, c.addNonEnumerableProperty)(t, k, new Set([e]))
    }, "convertSpanLinksForEnvelope", 0, v, "getActiveSpan", 0, function() {
        let t = (0, r.getMainCarrier)(),
            n = (0, e.getAsyncContextStrategy)(t);
        return n.getActiveSpan ? n.getActiveSpan() : (0, T._getSpanForScope)((0, i.getCurrentScope)())
    }, "getRootSpan", 0, U, "getSimpleStatusMessage", 0, M, "getSpanDescendants", 0, function(t) {
        let e = new Set;
        return ! function t(n) {
            if (!e.has(n) && x(n))
                for (let r of (e.add(n), n[k] ? Array.from(n[k]) : [])) t(r)
        }(t), Array.from(e)
    }, "getStatusMessage", 0, O, "getStreamedSpanLinks", 0, y, "removeChildSpanFromSpan", 0, function(t, e) {
        t[k] && t[k].delete(e)
    }, "showSpanDropWarning", 0, function() {
        E || ((0, p.consoleSandbox)(() => {
            console.warn("[Sentry] Returning null from `beforeSendSpan` is disallowed. To drop certain spans, configure the respective integrations directly or use `ignoreSpans`.")
        }), E = !0)
    }, "spanIsSampled", 0, x, "spanTimeInputToSeconds", 0, b, "spanToJSON", 0, A, "spanToStreamedSpanJSON", 0, function(t) {
        if (C(t)) return t.getStreamedSpanJSON();
        let {
            spanId: e,
            traceId: n
        } = t.spanContext();
        if (R(t)) {
            let {
                attributes: r,
                startTime: i,
                name: a,
                endTime: s,
                status: o,
                links: c
            } = t;
            return {
                name: a,
                span_id: e,
                trace_id: n,
                parent_span_id: N(t),
                start_timestamp: b(i),
                end_timestamp: b(s),
                is_segment: t === P(t),
                status: M(o),
                attributes: r,
                links: y(c)
            }
        }
        return {
            span_id: e,
            trace_id: n,
            start_timestamp: 0,
            name: "",
            end_timestamp: 0,
            status: "ok",
            is_segment: t === P(t)
        }
    }, "spanToTraceContext", 0, function(t) {
        let {
            spanId: e,
            traceId: n,
            isRemote: r
        } = t.spanContext(), i = r ? e : A(t).parent_span_id, a = (0, o.getCapturedScopesOnSpan)(t).scope;
        return {
            parent_span_id: i,
            span_id: r ? (null == a ? void 0 : a.getPropagationContext().propagationSpanId) || (0, u.generateSpanId)() : e,
            trace_id: n
        }
    }, "spanToTraceHeader", 0, function(t) {
        let {
            traceId: e,
            spanId: n
        } = t.spanContext();
        return S(e, n, x(t))
    }, "spanToTraceparentHeader", 0, function(t) {
        let {
            traceId: e,
            spanId: n
        } = t.spanContext();
        return m(e, n, x(t))
    }, "spanToTransactionTraceContext", 0, function(t) {
        let {
            spanId: e,
            traceId: n
        } = t.spanContext(), {
            data: r,
            op: i,
            parent_span_id: a,
            status: s,
            origin: o,
            links: c
        } = A(t);
        return {
            parent_span_id: a,
            span_id: e,
            trace_id: n,
            data: r,
            op: i,
            status: s,
            origin: o,
            links: c
        }
    }, "streamedSpanJsonToSerializedSpan", 0, function(t) {
        var e;
        return {
            ...t,
            attributes: (0, n.serializeAttributes)(t.attributes),
            links: null == (e = t.links) ? void 0 : e.map(t => ({
                ...t,
                attributes: (0, n.serializeAttributes)(t.attributes)
            }))
        }
    }], 5182);
    let w = "production";
    t.s(["DEFAULT_ENVIRONMENT", 0, w], 520952);
    var L = t.i(499063);
    let B = "_frozenDsc";

    function j(t, e) {
        let n = e.getOptions(),
            {
                publicKey: r
            } = e.getDsn() || {},
            i = {
                environment: n.environment || w,
                release: n.release,
                public_key: r,
                trace_id: t,
                org_id: (0, _.extractOrgIdFromClient)(e)
            };
        return e.emit("createDsc", i), i
    }
    t.s(["freezeDscOnSpan", 0, function(t, e) {
        (0, c.addNonEnumerableProperty)(t, B, e)
    }, "getDynamicSamplingContextFromScope", 0, function(t, e) {
        let n = e.getPropagationContext();
        return n.dsc || j(n.traceId, t)
    }, "getDynamicSamplingContextFromSpan", 0, function(t) {
        var e, n, r, s, c;
        let u = (0, i.getClient)();
        if (!u) return {};
        let l = U(t),
            p = A(l),
            _ = p.data,
            g = l.spanContext().traceState,
            f = null != (e = null != (n = null == g ? void 0 : g.get("sentry.sample_rate")) ? n : _[a.SEMANTIC_ATTRIBUTE_SENTRY_SAMPLE_RATE]) ? e : _[a.SEMANTIC_ATTRIBUTE_SENTRY_PREVIOUS_TRACE_SAMPLE_RATE];

        function h(t) {
            return ("number" == typeof f || "string" == typeof f) && (t.sample_rate = "".concat(f)), t
        }
        let S = l[B];
        if (S) return h(S);
        let m = null == g ? void 0 : g.get("sentry.dsc"),
            T = m && (0, d.baggageHeaderToDynamicSamplingContext)(m);
        if (T) return h(T);
        let E = j(t.spanContext().traceId, u),
            v = null != (r = _[a.SEMANTIC_ATTRIBUTE_SENTRY_SOURCE]) ? r : _["sentry.span.source"],
            y = p.description;
        return "url" !== v && y && (E.transaction = y), (0, L.hasSpansEnabled)() && (E.sampled = String(x(l)), E.sample_rand = null != (s = null == g ? void 0 : g.get("sentry.sample_rand")) ? s : null == (c = (0, o.getCapturedScopesOnSpan)(l).scope) ? void 0 : c.getPropagationContext().sampleRand.toString()), h(E), u.emit("createDsc", E, l), E
    }], 486899)
}]);

//# debugId=049558f9-a419-14a4-4b0d-7b3d899ae54a
//# sourceMappingURL=25-wvbh13gpsq.js.map