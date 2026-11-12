;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "f6c85d46-79df-ee89-6bad-173b4d59c990")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 10955, 64583, 204078, 131810, t => {
    "use strict";
    let e = "10.50.0";
    t.s(["SDK_VERSION", 0, e], 64583);
    let n = globalThis;

    function r(t) {
        let n = t.__SENTRY__ = t.__SENTRY__ || {};
        return n.version = n.version || e, n[e] = n[e] || {}
    }
    t.s(["GLOBAL_OBJ", 0, n], 204078), t.s(["getGlobalSingleton", 0, function(t, r) {
        let i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : n,
            s = i.__SENTRY__ = i.__SENTRY__ || {},
            a = s[e] = s[e] || {};
        return a[t] || (a[t] = r())
    }, "getMainCarrier", 0, function() {
        return r(n), n
    }, "getSentryCarrier", 0, r], 10955);
    let i = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;
    t.s(["DEBUG_BUILD", 0, i], 131810)
}, 695524, t => {
    "use strict";
    var e = t.i(10955),
        n = t.i(131810),
        r = t.i(204078);
    let i = {};

    function s(t) {
        if (!("console" in r.GLOBAL_OBJ)) return t();
        let e = r.GLOBAL_OBJ.console,
            n = {},
            s = Object.keys(i);
        s.forEach(t => {
            let r = i[t];
            n[t] = e[t], e[t] = r
        });
        try {
            return t()
        } finally {
            s.forEach(t => {
                e[t] = n[t]
            })
        }
    }

    function a() {
        return u().enabled
    }

    function o(t) {
        for (var e = arguments.length, i = Array(e > 1 ? e - 1 : 0), o = 1; o < e; o++) i[o - 1] = arguments[o];
        n.DEBUG_BUILD && a() && s(() => {
            r.GLOBAL_OBJ.console[t](`Sentry Logger [${t}]:`, ...i)
        })
    }

    function u() {
        return n.DEBUG_BUILD ? (0, e.getGlobalSingleton)("loggerSettings", () => ({
            enabled: !1
        })) : {
            enabled: !1
        }
    }
    t.s(["CONSOLE_LEVELS", 0, ["debug", "info", "warn", "error", "log", "assert", "trace"], "consoleSandbox", 0, s, "debug", 0, {
        enable: function() {
            u().enabled = !0
        },
        disable: function() {
            u().enabled = !1
        },
        isEnabled: a,
        log: function() {
            for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
            o("log", ...e)
        },
        warn: function() {
            for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
            o("warn", ...e)
        },
        error: function() {
            for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
            o("error", ...e)
        }
    }, "originalConsoleMethods", 0, i])
}, 880985, 59172, t => {
    "use strict";
    let e = Object.prototype.toString;

    function n(t, n) {
        return e.call(t) === `[object ${n}]`
    }

    function r(t) {
        return n(t, "String")
    }

    function i(t) {
        return "object" == typeof t && null !== t && "__sentry_template_string__" in t && "__sentry_template_values__" in t
    }

    function s(t) {
        return n(t, "Object")
    }

    function a(t, e) {
        try {
            return t instanceof e
        } catch {
            return !1
        }
    }
    t.s(["isDOMError", 0, function(t) {
        return n(t, "DOMError")
    }, "isDOMException", 0, function(t) {
        return n(t, "DOMException")
    }, "isElement", 0, function(t) {
        return "u" > typeof Element && a(t, Element)
    }, "isError", 0, function(t) {
        switch (e.call(t)) {
            case "[object Error]":
            case "[object Exception]":
            case "[object DOMException]":
            case "[object WebAssembly.Exception]":
                return !0;
            default:
                return a(t, Error)
        }
    }, "isErrorEvent", 0, function(t) {
        return n(t, "ErrorEvent")
    }, "isEvent", 0, function(t) {
        return "u" > typeof Event && a(t, Event)
    }, "isInstanceOf", 0, a, "isParameterizedString", 0, i, "isPlainObject", 0, s, "isPrimitive", 0, function(t) {
        return null === t || i(t) || "object" != typeof t && "function" != typeof t
    }, "isRegExp", 0, function(t) {
        return n(t, "RegExp")
    }, "isRequest", 0, function(t) {
        return "u" > typeof Request && a(t, Request)
    }, "isString", 0, r, "isSyntheticEvent", 0, function(t) {
        return s(t) && "nativeEvent" in t && "preventDefault" in t && "stopPropagation" in t
    }, "isThenable", 0, function(t) {
        return !!(t?.then && "function" == typeof t.then)
    }, "isVueViewModel", 0, function(t) {
        return !!("object" == typeof t && null !== t && (t.__isVue || t._isVue || t.__v_isVNode))
    }], 59172);
    let o = t.i(204078).GLOBAL_OBJ;
    t.s(["getComponentName", 0, function(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 5;
        if (!o.HTMLElement) return null;
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
            return o.document.location.href
        } catch {
            return ""
        }
    }, "htmlTreeAsString", 0, function(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        if (!t) return "<unknown>";
        try {
            let n, i = t,
                s = [],
                a = 0,
                u = 0,
                c = Array.isArray(e) ? e : e.keyAttrs,
                l = !Array.isArray(e) && e.maxStringLength || 80;
            for (; i && a++ < 5 && (n = function(t, e) {
                    let n = [];
                    if (!t?.tagName) return "";
                    if (o.HTMLElement && t instanceof HTMLElement && t.dataset) {
                        if (t.dataset.sentryComponent) return t.dataset.sentryComponent;
                        if (t.dataset.sentryElement) return t.dataset.sentryElement
                    }
                    n.push(t.tagName.toLowerCase());
                    let i = e?.length ? e.filter(e => t.getAttribute(e)).map(e => [e, t.getAttribute(e)]) : null;
                    if (i?.length) i.forEach(t => {
                        n.push(`[${t[0]}="${t[1]}"]`)
                    });
                    else {
                        t.id && n.push(`#${t.id}`);
                        let e = t.className;
                        if (e && r(e))
                            for (let t of e.split(/\s+/)) n.push(`.${t}`)
                    }
                    for (let e of ["aria-label", "type", "name", "title", "alt"]) {
                        let r = t.getAttribute(e);
                        r && n.push(`[${e}="${r}"]`)
                    }
                    return n.join("")
                }(i, c), "html" !== n && (!(a > 1) || !(u + 3 * s.length + n.length >= l)));) s.push(n), u += n.length, i = i.parentNode;
            return s.reverse().join(" > ")
        } catch {
            return "<unknown>"
        }
    }], 880985)
}, 420546, 211429, 58833, 140332, 403770, 483e3, 557156, 271693, 626471, 135119, 867058, 120953, 981964, 454181, 499678, 587628, 220325, 658675, 672806, 121482, 295446, 174932, 737996, 551482, 47731, 950271, 358984, 901781, 486110, 785970, 100749, 227668, 718305, 139436, 950921, 459557, t => {
    "use strict";
    let e, n, r, i;
    var s = t.i(10955),
        a = t.i(131810),
        o = t.i(880985),
        u = t.i(695524),
        c = t.i(59172);

    function l(t, e, n) {
        try {
            Object.defineProperty(t, e, {
                value: n,
                writable: !0,
                configurable: !0
            })
        } catch {
            a.DEBUG_BUILD && u.debug.log(`Failed to add non-enumerable property "${e}" to object`, t)
        }
    }

    function p(t, e) {
        try {
            let n = e.prototype || {};
            t.prototype = e.prototype = n, l(t, "__sentry_original__", e)
        } catch {}
    }

    function d(t) {
        if ((0, c.isError)(t)) return {
            message: t.message,
            name: t.name,
            stack: t.stack,
            ...f(t)
        };
        if (!(0, c.isEvent)(t)) return t;
        {
            let e = {
                type: t.type,
                target: _(t.target),
                currentTarget: _(t.currentTarget),
                ...f(t)
            };
            return "u" > typeof CustomEvent && (0, c.isInstanceOf)(t, CustomEvent) && (e.detail = t.detail), e
        }
    }

    function _(t) {
        try {
            return (0, c.isElement)(t) ? (0, o.htmlTreeAsString)(t) : Object.prototype.toString.call(t)
        } catch {
            return "<unknown>"
        }
    }

    function f(t) {
        return "object" == typeof t && null !== t ? Object.fromEntries(Object.entries(t)) : {}
    }
    t.s(["addNonEnumerableProperty", 0, l, "convertToPlainObject", 0, d, "extractExceptionKeysForMessage", 0, function(t) {
        let e = Object.keys(d(t));
        return e.sort(), e[0] ? e.join(", ") : "[object has no keys]"
    }, "fill", 0, function(t, e, n) {
        if (!(e in t)) return;
        let r = t[e];
        if ("function" != typeof r) return;
        let i = n(r);
        "function" == typeof i && p(i, r);
        try {
            t[e] = i
        } catch {
            a.DEBUG_BUILD && u.debug.log(`Failed to replace method "${e}" in object`, t)
        }
    }, "getOriginalFunction", 0, function(t) {
        return t.__sentry_original__
    }, "markFunctionWrapped", 0, p], 211429);
    var h = t.i(204078);

    function g(t) {
        if (void 0 !== e) return e ? e(t) : t();
        let n = Symbol.for("__SENTRY_SAFE_RANDOM_ID_WRAPPER__"),
            r = h.GLOBAL_OBJ;
        return n in r && "function" == typeof r[n] ? (e = r[n])(t) : (e = null, t())
    }

    function m() {
        return g(() => Math.random())
    }

    function S() {
        return g(() => Date.now())
    }
    t.s(["safeDateNow", 0, S, "safeMathRandom", 0, m, "withRandomSafeContext", 0, g], 58833);
    let y = /\(error: (.*)\)/,
        E = /captureMessage|captureException/;

    function b() {
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
                let a = y.test(e) ? e.replace(y, "$1") : e;
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
            return /sentryWrapped/.test(v(o).function || "") && o.pop(), o.reverse(), E.test(v(o).function || "") && (o.pop(), E.test(v(o).function || "") && o.pop()), o.slice(0, 50).map(t => ({
                ...t,
                filename: t.filename || v(o).filename,
                function: t.function || "?"
            }))
        }
    }

    function v(t) {
        return t[t.length - 1] || {}
    }
    let T = "<anonymous>";

    function I(t) {
        try {
            if (!t || "function" != typeof t) return T;
            return t.name || T
        } catch {
            return T
        }
    }

    function A(t) {
        return "__v_isVNode" in t && t.__v_isVNode ? "[VueVNode]" : "[VueViewModel]"
    }

    function N(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
        return "string" != typeof t || 0 === e || t.length <= e ? t : `${t.slice(0,e)}...`
    }

    function C(t, e) {
        let n = t,
            r = n.length;
        if (r <= 150) return n;
        e > r && (e = r);
        let i = Math.max(e - 60, 0);
        i < 5 && (i = 0);
        let s = Math.min(i + 140, r);
        return s > r - 5 && (s = r), s === r && (i = Math.max(s - 140, 0)), n = n.slice(i, s), i > 0 && (n = `'{snip} ${n}`), s < r && (n += " {snip}"), n
    }

    function R(t, e) {
        let n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
        return !!(0, c.isString)(t) && ((0, c.isRegExp)(e) ? e.test(t) : (0, c.isString)(e) ? n ? t === e : t.includes(e) : "function" == typeof e && e(t))
    }

    function x() {
        let t, e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : (t = h.GLOBAL_OBJ).crypto || t.msCrypto;
        try {
            if (e?.randomUUID) return g(() => e.randomUUID()).replace(/-/g, "")
        } catch {}
        return n || (n = "10000000100040008000100000000000"), n.replace(/[018]/g, t => (t ^ (15 & 16 * m()) >> t / 4).toString(16))
    }

    function D(t) {
        return t.exception?.values?.[0]
    }

    function O(t) {
        try {
            return t.__sentry_captured__
        } catch {}
    }

    function k() {
        return S() / 1e3
    }

    function w() {
        return (r ?? (r = function() {
            let {
                performance: t
            } = h.GLOBAL_OBJ;
            if (!t?.now || !t.timeOrigin) return k;
            let e = t.timeOrigin;
            return () => (e + g(() => t.now())) / 1e3
        }()))()
    }
    t.s(["UNKNOWN_FUNCTION", 0, "?", "createStackParser", 0, b, "getFramesFromEvent", 0, function(t) {
        let e = t.exception;
        if (e) {
            let t = [];
            try {
                return e.values.forEach(e => {
                    e.stacktrace.frames && t.push(...e.stacktrace.frames)
                }), t
            } catch {}
        }
    }, "getFunctionName", 0, I, "getVueInternalName", 0, A, "normalizeStackTracePath", 0, function(t) {
        let e = t?.startsWith("file://") ? t.slice(7) : t;
        return e?.match(/\/[A-Z]:/) && (e = e.slice(1)), e
    }, "stackParserFromStackParserOptions", 0, function(t) {
        return Array.isArray(t) ? b(...t) : t
    }], 140332), t.s(["isMatchingPattern", 0, R, "safeJoin", 0, function(t, e) {
        if (!Array.isArray(t)) return "";
        let n = [];
        for (let e = 0; e < t.length; e++) {
            let r = t[e];
            try {
                (0, c.isVueViewModel)(r) ? n.push(A(r)): n.push(String(r))
            } catch {
                n.push("[value cannot be serialized]")
            }
        }
        return n.join(e)
    }, "snipLine", 0, C, "stringMatchesSomePattern", 0, function(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
        return e.some(e => R(t, e, n))
    }, "truncate", 0, N], 403770), t.s(["addContextToFrame", 0, function(t, e) {
        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 5;
        if (void 0 === e.lineno) return;
        let r = t.length,
            i = Math.max(Math.min(r - 1, e.lineno - 1), 0);
        e.pre_context = t.slice(Math.max(0, i - n), i).map(t => C(t, 0)), e.context_line = C(t[Math.min(r - 1, i)], e.colno || 0), e.post_context = t.slice(Math.min(i + 1, r), i + 1 + n).map(t => C(t, 0))
    }, "addExceptionMechanism", 0, function(t, e) {
        let n = D(t);
        if (!n) return;
        let r = n.mechanism;
        if (n.mechanism = {
                type: "generic",
                handled: !0,
                ...r,
                ...e
            }, e && "data" in e) {
            let t = {
                ...r?.data,
                ...e.data
            };
            n.mechanism.data = t
        }
    }, "addExceptionTypeValue", 0, function(t, e, n) {
        let r = t.exception = t.exception || {},
            i = r.values = r.values || [],
            s = i[0] = i[0] || {};
        s.value || (s.value = e || ""), s.type || (s.type = n || "Error")
    }, "checkOrSetAlreadyCaught", 0, function(t) {
        if (O(t)) return !0;
        try {
            l(t, "__sentry_captured__", !0)
        } catch {}
        return !1
    }, "getEventDescription", 0, function(t) {
        let {
            message: e,
            event_id: n
        } = t;
        if (e) return e;
        let r = D(t);
        return r ? r.type && r.value ? `${r.type}: ${r.value}` : r.type || r.value || n || "<unknown>" : n || "<unknown>"
    }, "isAlreadyCaptured", 0, O, "uuid4", 0, x], 483e3);
    let L = null;

    function M(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        if (e.user && (!t.ipAddress && e.user.ip_address && (t.ipAddress = e.user.ip_address), t.did || e.did || (t.did = e.user.id || e.user.email || e.user.username)), t.timestamp = e.timestamp || w(), e.abnormal_mechanism && (t.abnormal_mechanism = e.abnormal_mechanism), e.ignoreDuration && (t.ignoreDuration = e.ignoreDuration), e.sid && (t.sid = 32 === e.sid.length ? e.sid : x()), void 0 !== e.init && (t.init = e.init), !t.did && e.did && (t.did = `${e.did}`), "number" == typeof e.started && (t.started = e.started), t.ignoreDuration) t.duration = void 0;
        else if ("number" == typeof e.duration) t.duration = e.duration;
        else {
            let e = t.timestamp - t.started;
            t.duration = e >= 0 ? e : 0
        }
        e.release && (t.release = e.release), e.environment && (t.environment = e.environment), !t.ipAddress && e.ipAddress && (t.ipAddress = e.ipAddress), !t.userAgent && e.userAgent && (t.userAgent = e.userAgent), "number" == typeof e.errors && (t.errors = e.errors), e.status && (t.status = e.status)
    }

    function U(t, e) {
        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 2;
        if (!e || "object" != typeof e || n <= 0) return e;
        if (t && 0 === Object.keys(e).length) return t;
        let r = {
            ...t
        };
        for (let t in e) Object.prototype.hasOwnProperty.call(e, t) && (r[t] = U(r[t], e[t], n - 1));
        return r
    }

    function B() {
        return x()
    }

    function P() {
        return x().substring(16)
    }
    t.s(["browserPerformanceTimeOrigin", 0, function() {
        return null === L && (L = function() {
            let {
                performance: t
            } = h.GLOBAL_OBJ;
            if (!t?.now) return;
            let e = g(() => t.now()),
                n = S(),
                r = t.timeOrigin;
            if ("number" == typeof r && 3e5 > Math.abs(r + e - n)) return r;
            let i = t.timing?.navigationStart;
            return "number" == typeof i && 3e5 > Math.abs(i + e - n) ? i : n - e
        }()), L
    }, "dateTimestampInSeconds", 0, k, "timestampInSeconds", 0, w], 557156), t.s(["closeSession", 0, function(t, e) {
        let n = {};
        e ? n = {
            status: e
        } : "ok" === t.status && (n = {
            status: "exited"
        }), M(t, n)
    }, "makeSession", 0, function(t) {
        let e = w(),
            n = {
                sid: x(),
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
                        sid: `${t.sid}`,
                        init: t.init,
                        started: new Date(1e3 * t.started).toISOString(),
                        timestamp: new Date(1e3 * t.timestamp).toISOString(),
                        status: t.status,
                        errors: t.errors,
                        did: "number" == typeof t.did || "string" == typeof t.did ? `${t.did}` : void 0,
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
        return t && M(n, t), n
    }, "updateSession", 0, M], 271693), t.s(["merge", 0, U], 626471), t.s(["generateSpanId", 0, P, "generateTraceId", 0, B], 135119);
    let $ = "_sentrySpan";

    function j(t, e) {
        e ? l(t, $, e) : delete t[$]
    }

    function G(t) {
        return t[$]
    }
    t.s(["_getSpanForScope", 0, G, "_setSpanForScope", 0, j], 867058);
    class F {
        clone() {
            let t = new F;
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
            }, t._client = this._client, t._lastEventId = this._lastEventId, t._conversationId = this._conversationId, j(t, G(this)), t
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
            }, this._session && M(this._session, {
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
                    fingerprint: u = [],
                    propagationContext: l,
                    conversationId: p
                } = (e instanceof F ? e.getScopeData() : (0, c.isPlainObject)(e) ? t : void 0) || {};
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
            }, s && Object.keys(s).length && (this._user = s), o && (this._level = o), u.length && (this._fingerprint = u), l && (this._propagationContext = l), p && (this._conversationId = p), this
        }
        clear() {
            return this._breadcrumbs = [], this._tags = {}, this._attributes = {}, this._extra = {}, this._user = {}, this._contexts = {}, this._level = void 0, this._transactionName = void 0, this._fingerprint = void 0, this._session = void 0, this._conversationId = void 0, j(this, void 0), this._attachments = [], this.setPropagationContext({
                traceId: B(),
                sampleRand: m()
            }), this._notifyScopeListeners(), this
        }
        addBreadcrumb(t, e) {
            let n = "number" == typeof e ? e : 100;
            if (n <= 0) return this;
            let r = {
                timestamp: k(),
                ...t,
                message: t.message ? N(t.message, 2048) : t.message
            };
            return this._breadcrumbs.push(r), this._breadcrumbs.length > n && (this._breadcrumbs = this._breadcrumbs.slice(-n), this._client?.recordDroppedEvent("buffer_overflow", "log_item")), this._notifyScopeListeners(), this
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
                span: G(this),
                conversationId: this._conversationId
            }
        }
        setSDKProcessingMetadata(t) {
            return this._sdkProcessingMetadata = U(this._sdkProcessingMetadata, t, 2), this
        }
        setPropagationContext(t) {
            return this._propagationContext = t, this
        }
        getPropagationContext() {
            return this._propagationContext
        }
        captureException(t, e) {
            let n = e?.event_id || x();
            if (!this._client) return a.DEBUG_BUILD && u.debug.warn("No client configured on scope - will not capture exception!"), n;
            let r = Error("Sentry syntheticException");
            return this._client.captureException(t, {
                originalException: t,
                syntheticException: r,
                ...e,
                event_id: n
            }, this), n
        }
        captureMessage(t, e, n) {
            let r = n?.event_id || x();
            if (!this._client) return a.DEBUG_BUILD && u.debug.warn("No client configured on scope - will not capture message!"), r;
            let i = n?.syntheticException ?? Error(t);
            return this._client.captureMessage(t, e, {
                originalException: t,
                syntheticException: i,
                ...n,
                event_id: r
            }, this), r
        }
        captureEvent(t, e) {
            let n = t.event_id || e?.event_id || x();
            return this._client ? this._client.captureEvent(t, {
                ...e,
                event_id: n
            }, this) : a.DEBUG_BUILD && u.debug.warn("No client configured on scope - will not capture event!"), n
        }
        _notifyScopeListeners() {
            this._notifyingListeners || (this._notifyingListeners = !0, this._scopeListeners.forEach(t => {
                t(this)
            }), this._notifyingListeners = !1)
        }
        constructor() {
            this._notifyingListeners = !1, this._scopeListeners = [], this._eventProcessors = [], this._breadcrumbs = [], this._attachments = [], this._user = {}, this._tags = {}, this._attributes = {}, this._extra = {}, this._contexts = {}, this._sdkProcessingMetadata = {}, this._propagationContext = {
                traceId: B(),
                sampleRand: m()
            }
        }
    }
    t.s(["Scope", 0, F], 120953);
    let J = t => t instanceof Promise && !t[Y],
        Y = Symbol("chained PromiseLike"),
        V = (t, e, n) => {
            let r = t.then(t => (e(t), t), t => {
                throw n(t), t
            });
            return J(r) && J(t) ? r : H(t, r)
        },
        H = (t, e) => {
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
                [Y]: !0
            }), e
        };
    class z {
        withScope(t) {
            let e, n = this._pushScope();
            try {
                e = t(n)
            } catch (t) {
                throw this._popScope(), t
            }
            return (0, c.isThenable)(e) ? V(e, () => this._popScope(), () => this._popScope()) : (this._popScope(), e)
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
            n = t || new F, r = e || new F, this._stack = [{
                scope: n
            }], this._isolationScope = r
        }
    }

    function K() {
        let t = (0, s.getMainCarrier)(),
            e = (0, s.getSentryCarrier)(t);
        return e.stack = e.stack || new z((0, s.getGlobalSingleton)("defaultCurrentScope", () => new F), (0, s.getGlobalSingleton)("defaultIsolationScope", () => new F))
    }

    function W(t) {
        return K().withScope(t)
    }

    function q(t, e) {
        let n = K();
        return n.withScope(() => (n.getStackTop().scope = t, e(t)))
    }

    function X(t) {
        return K().withScope(() => t(K().getIsolationScope()))
    }

    function Q(t) {
        let e = (0, s.getSentryCarrier)(t);
        return e.acs ? e.acs : {
            withIsolationScope: X,
            withScope: W,
            withSetScope: q,
            withSetIsolationScope: (t, e) => X(e),
            getCurrentScope: () => K().getScope(),
            getIsolationScope: () => K().getIsolationScope()
        }
    }

    function Z() {
        return Q((0, s.getMainCarrier)()).getCurrentScope()
    }

    function tt() {
        return Q((0, s.getMainCarrier)()).getIsolationScope()
    }

    function te() {
        for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
        let r = Q((0, s.getMainCarrier)());
        if (2 === e.length) {
            let [t, n] = e;
            return t ? r.withSetScope(t, n) : r.withScope(n)
        }
        return r.withScope(e[0])
    }

    function tn() {
        return Z().getClient()
    }
    t.s(["getAsyncContextStrategy", 0, Q], 981964), t.s(["getClient", 0, tn, "getCurrentScope", 0, Z, "getGlobalScope", 0, function() {
        return (0, s.getGlobalSingleton)("globalScope", () => new F)
    }, "getIsolationScope", 0, tt, "getTraceContextFromScope", 0, function(t) {
        let e = i?.();
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
            span_id: s || P()
        };
        return r && (a.parent_span_id = r), a
    }, "hasExternalPropagationContext", 0, function() {
        return void 0 !== i
    }, "withIsolationScope", 0, function() {
        for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
        let r = Q((0, s.getMainCarrier)());
        if (2 === e.length) {
            let [t, n] = e;
            return t ? r.withSetIsolationScope(t, n) : r.withIsolationScope(n)
        }
        return r.withIsolationScope(e[0])
    }, "withScope", 0, te], 420546);
    let tr = "sentry.source",
        ti = "sentry.sample_rate",
        ts = "sentry.previous_trace_sample_rate",
        ta = "sentry.op",
        to = "sentry.origin",
        tu = "sentry.measurement_unit",
        tc = "sentry.measurement_value",
        tl = "sentry.custom_span_name",
        tp = "sentry.profile_id",
        td = "sentry.exclusive_time";
    t.s(["GEN_AI_CONVERSATION_ID_ATTRIBUTE", 0, "gen_ai.conversation.id", "SEMANTIC_ATTRIBUTE_EXCLUSIVE_TIME", 0, td, "SEMANTIC_ATTRIBUTE_HTTP_REQUEST_METHOD", 0, "http.request.method", "SEMANTIC_ATTRIBUTE_PROFILE_ID", 0, tp, "SEMANTIC_ATTRIBUTE_SENTRY_CUSTOM_SPAN_NAME", 0, tl, "SEMANTIC_ATTRIBUTE_SENTRY_ENVIRONMENT", 0, "sentry.environment", "SEMANTIC_ATTRIBUTE_SENTRY_IDLE_SPAN_FINISH_REASON", 0, "sentry.idle_span_finish_reason", "SEMANTIC_ATTRIBUTE_SENTRY_MEASUREMENT_UNIT", 0, tu, "SEMANTIC_ATTRIBUTE_SENTRY_MEASUREMENT_VALUE", 0, tc, "SEMANTIC_ATTRIBUTE_SENTRY_OP", 0, ta, "SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN", 0, to, "SEMANTIC_ATTRIBUTE_SENTRY_PREVIOUS_TRACE_SAMPLE_RATE", 0, ts, "SEMANTIC_ATTRIBUTE_SENTRY_RELEASE", 0, "sentry.release", "SEMANTIC_ATTRIBUTE_SENTRY_SAMPLE_RATE", 0, ti, "SEMANTIC_ATTRIBUTE_SENTRY_SDK_NAME", 0, "sentry.sdk.name", "SEMANTIC_ATTRIBUTE_SENTRY_SDK_VERSION", 0, "sentry.sdk.version", "SEMANTIC_ATTRIBUTE_SENTRY_SEGMENT_ID", 0, "sentry.segment.id", "SEMANTIC_ATTRIBUTE_SENTRY_SEGMENT_NAME", 0, "sentry.segment.name", "SEMANTIC_ATTRIBUTE_SENTRY_SOURCE", 0, tr, "SEMANTIC_ATTRIBUTE_URL_FULL", 0, "url.full", "SEMANTIC_ATTRIBUTE_USER_EMAIL", 0, "user.email", "SEMANTIC_ATTRIBUTE_USER_ID", 0, "user.id", "SEMANTIC_ATTRIBUTE_USER_IP_ADDRESS", 0, "user.ip_address", "SEMANTIC_ATTRIBUTE_USER_USERNAME", 0, "user.name", "SEMANTIC_LINK_ATTRIBUTE_LINK_TYPE", 0, "sentry.link.type"], 454181);
    let t_ = "sentry-";

    function tf(t) {
        let e = tg(t);
        if (!e) return;
        let n = Object.entries(e).reduce((t, e) => {
            let [n, r] = e;
            return n.startsWith(t_) && (t[n.slice(t_.length)] = r), t
        }, {});
        return Object.keys(n).length > 0 ? n : void 0
    }

    function th(t) {
        if (t) {
            var e = Object.entries(t).reduce((t, e) => {
                let [n, r] = e;
                return r && (t[`${t_}${n}`] = r), t
            }, {});
            return 0 !== Object.keys(e).length ? Object.entries(e).reduce((t, e, n) => {
                let [r, i] = e, s = `${encodeURIComponent(r)}=${encodeURIComponent(i)}`, o = 0 === n ? s : `${t},${s}`;
                return o.length > 8192 ? (a.DEBUG_BUILD && u.debug.warn(`Not adding key: ${r} with val: ${i} to baggage header due to exceeding baggage size limits.`), t) : o
            }, "") : void 0
        }
    }

    function tg(t) {
        if (t && ((0, c.isString)(t) || Array.isArray(t))) return Array.isArray(t) ? t.reduce((t, e) => (Object.entries(tm(e)).forEach(e => {
            let [n, r] = e;
            t[n] = r
        }), t), {}) : tm(t)
    }

    function tm(t) {
        return t.split(",").map(t => {
            let e = t.indexOf("=");
            return -1 === e ? [] : [t.slice(0, e), t.slice(e + 1)].map(t => {
                try {
                    return decodeURIComponent(t.trim())
                } catch {
                    return
                }
            })
        }).reduce((t, e) => {
            let [n, r] = e;
            return n && r && (t[n] = r), t
        }, {})
    }

    function tS(t, e) {
        var n, r, i, s;
        let a, o = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : () => {},
            u = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : () => {};
        try {
            a = t()
        } catch (t) {
            throw e(t), o(), t
        }
        return n = a, r = e, i = o, s = u, (0, c.isThenable)(n) ? V(n, t => {
            i(), s(t)
        }, t => {
            r(t), i()
        }) : (i(), s(n), n)
    }

    function ty(t) {
        if ("boolean" == typeof __SENTRY_TRACING__ && !__SENTRY_TRACING__) return !1;
        let e = t || tn()?.getOptions();
        return !!e && (null != e.tracesSampleRate || !!e.tracesSampler)
    }

    function tE(t) {
        u.debug.log(`Ignoring span ${t.op} - ${t.description} because it matches \`ignoreSpans\`.`)
    }

    function tb(t, e) {
        if (!e?.length || !t.description) return !1;
        for (let r of e) {
            var n;
            if ("string" == typeof(n = r) || n instanceof RegExp) {
                if (R(t.description, r)) return a.DEBUG_BUILD && tE(t), !0;
                continue
            }
            if (!r.name && !r.op) continue;
            let e = !r.name || R(t.description, r.name),
                i = !r.op || t.op && R(t.op, r.op);
            if (e && i) return a.DEBUG_BUILD && tE(t), !0
        }
        return !1
    }

    function tv(t) {
        return "stream" === t.getOptions().traceLifecycle
    }

    function tT(t) {
        if ("boolean" == typeof t) return Number(t);
        let e = "string" == typeof t ? parseFloat(t) : t;
        if (!("number" != typeof e || isNaN(e)) && !(e < 0) && !(e > 1)) return e
    }

    function tI(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            n = {};
        for (let [r, i] of Object.entries(t ?? {})) {
            let t = function(t, e) {
                let {
                    value: n,
                    unit: r
                } = "object" == typeof t && null != t && !Array.isArray(t) && Object.keys(t).includes("value") ? t : {
                    value: t,
                    unit: void 0
                }, i = function(t) {
                    let e = "string" == typeof t ? "string" : "boolean" == typeof t ? "boolean" : "number" != typeof t || Number.isNaN(t) ? null : Number.isInteger(t) ? "integer" : "double";
                    if (e) return {
                        value: t,
                        type: e
                    }
                }(n), s = r && "string" == typeof r ? {
                    unit: r
                } : {};
                if (i) return {
                    ...i,
                    ...s
                };
                if (!e || "skip-undefined" === e && void 0 === n) return;
                let a = "";
                try {
                    a = JSON.stringify(n) ?? ""
                } catch {}
                return {
                    value: a,
                    type: "string",
                    ...s
                }
            }(i, e);
            t && (n[r] = t)
        }
        return n
    }

    function tA(t) {
        return "string" == typeof t ? 2 * t.length : "boolean" == typeof t ? 4 : 8 * ("number" == typeof t)
    }

    function tN(t) {
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
    }
    t.s(["SENTRY_BAGGAGE_KEY_PREFIX", 0, t_, "baggageHeaderToDynamicSamplingContext", 0, tf, "dynamicSamplingContextToSentryBaggageHeader", 0, th, "parseBaggageHeader", 0, tg], 499678), t.s(["handleCallbackErrors", 0, tS], 587628), t.s(["hasSpansEnabled", 0, ty], 220325), t.s(["reparentChildSpans", 0, function(t, e) {
        let n = e.parent_span_id,
            r = e.span_id;
        if (n)
            for (let e of t) e.parent_span_id === r && (e.parent_span_id = n)
    }, "shouldIgnoreSpan", 0, tb], 658675), t.s(["hasSpanStreamingEnabled", 0, tv], 672806), t.s(["parseSampleRate", 0, tT], 121482), t.s(["estimateTypedAttributesSizeInBytes", 0, function(t) {
        if (!t) return 0;
        let e = 0;
        for (let [n, r] of Object.entries(t)) {
            e += 2 * n.length, e += 2 * r.type.length, e += (r.unit?.length ?? 0) * 2;
            let t = r.value;
            Array.isArray(t) ? e += tA(t[0]) * t.length : (0, c.isPrimitive)(t) ? e += tA(t) : e += 100
        }
        return e
    }, "serializeAttributes", 0, tI], 295446), t.s(["SPAN_STATUS_ERROR", 0, 2, "SPAN_STATUS_OK", 0, 1, "SPAN_STATUS_UNSET", 0, 0, "getSpanStatusFromHttpCode", 0, tN, "setHttpStatus", 0, function(t, e) {
        t.setAttribute("http.response.status_code", e);
        let n = tN(e);
        "unknown_error" !== n.message && t.setStatus(n)
    }], 174932);
    let tC = "_sentryScope",
        tR = "_sentryIsolationScope";

    function tx(t, e, n) {
        t && (l(t, tR, function(t) {
            try {
                let e = h.GLOBAL_OBJ.WeakRef;
                if ("function" == typeof e) return new e(t)
            } catch {}
            return t
        }(n)), l(t, tC, e))
    }

    function tD(t) {
        return {
            scope: t[tC],
            isolationScope: function(t) {
                if (t) {
                    if ("object" == typeof t && "deref" in t && "function" == typeof t.deref) try {
                        return t.deref()
                    } catch {
                        return
                    }
                    return t
                }
            }(t[tR])
        }
    }
    t.s(["getCapturedScopesOnSpan", 0, tD, "setCapturedScopesOnSpan", 0, tx], 737996);
    let tO = /^o(\d+)\./,
        tk = /^(?:(\w+):)\/\/(?:(\w+)(?::(\w+)?)?@)((?:\[[:.%\w]+\]|[\w.-]+))(?::(\d+))?\/(.+)/;

    function tw(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            {
                host: n,
                path: r,
                pass: i,
                port: s,
                projectId: a,
                protocol: o,
                publicKey: u
            } = t;
        return `${o}://${u}${e&&i?`:${i}`:""}@${n}${s?`:${s}`:""}/${r?`${r}/`:r}${a}`
    }

    function tL(t) {
        let e = tk.exec(t);
        if (!e) return void(0, u.consoleSandbox)(() => {
            console.error(`Invalid Sentry Dsn: ${t}`)
        });
        let [n, r, i = "", s = "", a = "", o = ""] = e.slice(1), c = "", l = o, p = l.split("/");
        if (p.length > 1 && (c = p.slice(0, -1).join("/"), l = p.pop()), l) {
            let t = l.match(/^\d+/);
            t && (l = t[0])
        }
        return tM({
            host: s,
            pass: i,
            path: c,
            projectId: l,
            port: a,
            protocol: n,
            publicKey: r
        })
    }

    function tM(t) {
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

    function tU(t) {
        let e, n = t.getOptions(),
            {
                host: r
            } = t.getDsn() || {};
        if (n.orgId) e = String(n.orgId);
        else {
            let t;
            r && (t = r.match(tO), e = t?.[1])
        }
        return e
    }
    t.s(["dsnFromString", 0, tL, "dsnToString", 0, tw, "extractOrgIdFromClient", 0, tU, "makeDsn", 0, function(t) {
        let e = "string" == typeof t ? tL(t) : tM(t);
        if (e && function(t) {
                if (!a.DEBUG_BUILD) return !0;
                let {
                    port: e,
                    projectId: n,
                    protocol: r
                } = t;
                return !["protocol", "publicKey", "host", "projectId"].find(e => !t[e] && (u.debug.error(`Invalid Sentry Dsn: ${e} missing`), !0)) && (n.match(/^\d+$/) ? "http" !== r && "https" !== r ? (u.debug.error(`Invalid Sentry Dsn: Invalid protocol ${r}`), !1) : !(e && isNaN(parseInt(e, 10))) || (u.debug.error(`Invalid Sentry Dsn: Invalid port ${e}`), !1) : (u.debug.error(`Invalid Sentry Dsn: Invalid projectId ${n}`), !1))
            }(e)) return e
    }], 551482);
    let tB = RegExp("^[ \\t]*([0-9a-f]{32})?-?([0-9a-f]{16})?-?([01])?[ \\t]*$");

    function tP(t) {
        let e;
        if (!t) return;
        let n = t.match(tB);
        if (n) return "1" === n[3] ? e = !0 : "0" === n[3] && (e = !1), {
            traceId: n[1],
            parentSampled: e,
            parentSpanId: n[2]
        }
    }

    function t$(t, e) {
        let n = tP(t),
            r = tf(e);
        if (!n?.traceId) return {
            traceId: B(),
            sampleRand: m()
        };
        let i = function(t, e) {
            let n = tT(e?.sample_rand);
            if (void 0 !== n) return n;
            let r = tT(e?.sample_rate);
            return r && t?.parentSampled !== void 0 ? t.parentSampled ? m() * r : r + m() * (1 - r) : m()
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
    }

    function tj() {
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : B(),
            e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : P(),
            n = arguments.length > 2 ? arguments[2] : void 0,
            r = "";
        return void 0 !== n && (r = n ? "-1" : "-0"), `${t}-${e}${r}`
    }

    function tG() {
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : B(),
            e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : P(),
            n = arguments.length > 2 ? arguments[2] : void 0;
        return `00-${t}-${e}-${n?"01":"00"}`
    }

    function tF(t, e) {
        let n = tU(t);
        return e && n && e !== n ? (u.debug.log(`Won't continue trace because org IDs don't match (incoming baggage: ${e}, SDK options: ${n})`), !1) : !t.getOptions().strictTraceContinuation || (!e || !!n) && (!!e || !n) || (u.debug.log(`Starting a new trace because strict trace continuation is enabled but one org ID is missing (incoming baggage: ${e}, Sentry client: ${n})`), !1)
    }
    t.s(["TRACEPARENT_REGEXP", 0, tB, "extractTraceparentData", 0, tP, "generateSentryTraceHeader", 0, tj, "generateTraceparentHeader", 0, tG, "propagationContextFromHeaders", 0, t$, "shouldContinueTrace", 0, tF], 47731);
    let tJ = !1;

    function tY(t) {
        let {
            spanId: e,
            traceId: n
        } = t.spanContext(), {
            data: r,
            op: i,
            parent_span_id: s,
            status: a,
            origin: o,
            links: u
        } = tW(t);
        return {
            parent_span_id: s,
            span_id: e,
            trace_id: n,
            data: r,
            op: i,
            status: a,
            origin: o,
            links: u
        }
    }

    function tV(t) {
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

    function tH(t) {
        return t?.length ? t.map(t => {
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

    function tz(t) {
        return "number" == typeof t ? tK(t) : Array.isArray(t) ? t[0] + t[1] / 1e9 : t instanceof Date ? tK(t.getTime()) : w()
    }

    function tK(t) {
        return t > 0x2540be3ff ? t / 1e3 : t
    }

    function tW(t) {
        if (tQ(t)) return t.getSpanJSON();
        let {
            spanId: e,
            traceId: n
        } = t.spanContext();
        if (tX(t)) {
            let {
                attributes: r,
                startTime: i,
                name: s,
                endTime: a,
                status: o,
                links: u
            } = t;
            return {
                span_id: e,
                trace_id: n,
                data: r,
                description: s,
                parent_span_id: tq(t),
                start_timestamp: tz(i),
                timestamp: tz(a) || void 0,
                status: t0(o),
                op: r[ta],
                origin: r[to],
                links: tV(u)
            }
        }
        return {
            span_id: e,
            trace_id: n,
            start_timestamp: 0,
            data: {}
        }
    }

    function tq(t) {
        return "parentSpanId" in t ? t.parentSpanId : "parentSpanContext" in t ? t.parentSpanContext?.spanId : void 0
    }

    function tX(t) {
        return !!t.attributes && !!t.startTime && !!t.name && !!t.endTime && !!t.status
    }

    function tQ(t) {
        return "function" == typeof t.getSpanJSON
    }

    function tZ(t) {
        let {
            traceFlags: e
        } = t.spanContext();
        return 1 === e
    }

    function t0(t) {
        if (t && 0 !== t.code) return 1 === t.code ? "ok" : t.message || "internal_error"
    }

    function t1(t) {
        return t && 1 !== t.code && 0 !== t.code && "cancelled" !== t.message ? "error" : "ok"
    }
    let t2 = "_sentryChildSpans",
        t5 = "_sentryRootSpan";

    function t4(t, e) {
        let n = t[t5] || t;
        l(e, t5, n), t[t2] ? t[t2].add(e) : l(t, t2, new Set([e]))
    }

    function t3(t) {
        let e = new Set;
        return ! function t(n) {
            if (!e.has(n) && tZ(n))
                for (let r of (e.add(n), n[t2] ? Array.from(n[t2]) : [])) t(r)
        }(t), Array.from(e)
    }
    let t8 = t9;

    function t9(t) {
        return t[t5] || t
    }

    function t7() {
        let t = Q((0, s.getMainCarrier)());
        return t.getActiveSpan ? t.getActiveSpan() : G(Z())
    }

    function t6() {
        tJ || ((0, u.consoleSandbox)(() => {
            console.warn("[Sentry] Returning null from `beforeSendSpan` is disallowed. To drop certain spans, configure the respective integrations directly or use `ignoreSpans`.")
        }), tJ = !0)
    }
    t.s(["INTERNAL_getSegmentSpan", 0, t9, "TRACE_FLAG_NONE", 0, 0, "TRACE_FLAG_SAMPLED", 0, 1, "addChildSpanToSpan", 0, t4, "convertSpanLinksForEnvelope", 0, tV, "getActiveSpan", 0, t7, "getRootSpan", 0, t8, "getSimpleStatusMessage", 0, t1, "getSpanDescendants", 0, t3, "getStatusMessage", 0, t0, "getStreamedSpanLinks", 0, tH, "removeChildSpanFromSpan", 0, function(t, e) {
        t[t2] && t[t2].delete(e)
    }, "showSpanDropWarning", 0, t6, "spanIsSampled", 0, tZ, "spanTimeInputToSeconds", 0, tz, "spanToJSON", 0, tW, "spanToStreamedSpanJSON", 0, function(t) {
        if (tQ(t)) return t.getStreamedSpanJSON();
        let {
            spanId: e,
            traceId: n
        } = t.spanContext();
        if (tX(t)) {
            let {
                attributes: r,
                startTime: i,
                name: s,
                endTime: a,
                status: o,
                links: u
            } = t;
            return {
                name: s,
                span_id: e,
                trace_id: n,
                parent_span_id: tq(t),
                start_timestamp: tz(i),
                end_timestamp: tz(a),
                is_segment: t === t9(t),
                status: t1(o),
                attributes: r,
                links: tH(u)
            }
        }
        return {
            span_id: e,
            trace_id: n,
            start_timestamp: 0,
            name: "",
            end_timestamp: 0,
            status: "ok",
            is_segment: t === t9(t)
        }
    }, "spanToTraceContext", 0, function(t) {
        let {
            spanId: e,
            traceId: n,
            isRemote: r
        } = t.spanContext(), i = r ? e : tW(t).parent_span_id, s = tD(t).scope;
        return {
            parent_span_id: i,
            span_id: r ? s?.getPropagationContext().propagationSpanId || P() : e,
            trace_id: n
        }
    }, "spanToTraceHeader", 0, function(t) {
        let {
            traceId: e,
            spanId: n
        } = t.spanContext();
        return tj(e, n, tZ(t))
    }, "spanToTraceparentHeader", 0, function(t) {
        let {
            traceId: e,
            spanId: n
        } = t.spanContext();
        return tG(e, n, tZ(t))
    }, "spanToTransactionTraceContext", 0, tY, "streamedSpanJsonToSerializedSpan", 0, function(t) {
        return {
            ...t,
            attributes: tI(t.attributes),
            links: t.links?.map(t => ({
                ...t,
                attributes: tI(t.attributes)
            }))
        }
    }, "updateSpanName", 0, function(t, e) {
        t.updateName(e), t.setAttributes({
            [tr]: "custom",
            [tl]: e
        })
    }], 950271);
    let et = "production";
    t.s(["DEFAULT_ENVIRONMENT", 0, et], 358984);
    let ee = "_frozenDsc";

    function en(t, e) {
        l(t, ee, e)
    }

    function er(t, e) {
        let n = e.getOptions(),
            {
                publicKey: r
            } = e.getDsn() || {},
            i = {
                environment: n.environment || et,
                release: n.release,
                public_key: r,
                trace_id: t,
                org_id: tU(e)
            };
        return e.emit("createDsc", i), i
    }

    function ei(t) {
        let e = tn();
        if (!e) return {};
        let n = t8(t),
            r = tW(n),
            i = r.data,
            s = n.spanContext().traceState,
            a = s?.get("sentry.sample_rate") ?? i[ti] ?? i[ts];

        function o(t) {
            return ("number" == typeof a || "string" == typeof a) && (t.sample_rate = `${a}`), t
        }
        let u = n[ee];
        if (u) return o(u);
        let c = s?.get("sentry.dsc"),
            l = c && tf(c);
        if (l) return o(l);
        let p = er(t.spanContext().traceId, e),
            d = i[tr] ?? i["sentry.span.source"],
            _ = r.description;
        return "url" !== d && _ && (p.transaction = _), ty() && (p.sampled = String(tZ(n)), p.sample_rand = s?.get("sentry.sample_rand") ?? tD(n).scope?.getPropagationContext().sampleRand.toString()), o(p), e.emit("createDsc", p, n), p
    }
    t.s(["freezeDscOnSpan", 0, en, "getDynamicSamplingContextFromScope", 0, function(t, e) {
        let n = e.getPropagationContext();
        return n.dsc || er(n.traceId, t)
    }, "getDynamicSamplingContextFromSpan", 0, ei, "spanToBaggageHeader", 0, function(t) {
        return th(ei(t))
    }], 901781);
    class es {
        spanContext() {
            return {
                spanId: this._spanId,
                traceId: this._traceId,
                traceFlags: 0
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
            this._traceId = t.traceId || B(), this._spanId = t.spanId || P(), this.dropReason = t.dropReason
        }
    }

    function ea(t) {
        return !!t && "function" == typeof t && "_streamed" in t && !!t._streamed
    }

    function eo(e) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 100,
            r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : Infinity;
        try {
            return function e(n, r) {
                let i, s = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : Infinity,
                    a = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : Infinity,
                    o = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : (i = new WeakSet, [function(t) {
                        return !!i.has(t) || (i.add(t), !1)
                    }, function(t) {
                        i.delete(t)
                    }]),
                    [u, l] = o;
                if (null == r || ["boolean", "string"].includes(typeof r) || "number" == typeof r && Number.isFinite(r)) return r;
                let p = function(e, n) {
                    try {
                        var r;
                        let i;
                        if ("domain" === e && n && "object" == typeof n && n._events) return "[Domain]";
                        if ("domainEmitter" === e) return "[DomainEmitter]";
                        if (n === t.g) return "[Global]";
                        if ("u" > typeof window && n === window) return "[Window]";
                        if ("u" > typeof document && n === document) return "[Document]";
                        if ((0, c.isVueViewModel)(n)) return A(n);
                        if ((0, c.isSyntheticEvent)(n)) return "[SyntheticEvent]";
                        if ("number" == typeof n && !Number.isFinite(n)) return `[${n}]`;
                        if ("function" == typeof n) return `[Function: ${I(n)}]`;
                        if ("symbol" == typeof n) return `[${String(n)}]`;
                        if ("bigint" == typeof n) return `[BigInt: ${String(n)}]`;
                        let s = (r = n, i = Object.getPrototypeOf(r), i?.constructor ? i.constructor.name : "null prototype");
                        if (/^HTML(\w*)Element$/.test(s)) return `[HTMLElement: ${s}]`;
                        return `[object ${s}]`
                    } catch (t) {
                        return `**non-serializable** (${t})`
                    }
                }(n, r);
                if (!p.startsWith("[object ")) return p;
                if (r.__sentry_skip_normalization__) return r;
                let _ = "number" == typeof r.__sentry_override_normalization_depth__ ? r.__sentry_override_normalization_depth__ : s;
                if (0 === _) return p.replace("object ", "");
                if (u(r)) return "[Circular ~]";
                if (r && "function" == typeof r.toJSON) try {
                    let t = r.toJSON();
                    return e("", t, _ - 1, a, o)
                } catch {}
                let f = Array.isArray(r) ? [] : {},
                    h = 0,
                    g = d(r);
                for (let t in g) {
                    if (!Object.prototype.hasOwnProperty.call(g, t)) continue;
                    if (h >= a) {
                        f[t] = "[MaxProperties ~]";
                        break
                    }
                    let n = g[t];
                    f[t] = e(t, n, _ - 1, a, o), h++
                }
                return l(r), f
            }("", e, n, r)
        } catch (t) {
            return {
                ERROR: `**non-serializable** (${t})`
            }
        }
    }

    function eu(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [];
        return [t, e]
    }

    function ec(t, e) {
        for (let n of t[1]) {
            let t = n[0].type;
            if (e(n, t)) return !0
        }
        return !1
    }

    function el(t) {
        let e = (0, s.getSentryCarrier)(h.GLOBAL_OBJ);
        return e.encodePolyfill ? e.encodePolyfill(t) : new TextEncoder().encode(t)
    }

    function ep(t) {
        return [{
            type: "span"
        }, t]
    }
    t.s(["SentryNonRecordingSpan", 0, es], 486110), t.s(["isStreamedBeforeSendSpanCallback", 0, ea, "withStreamedSpan", 0, function(t) {
        return l(t, "_streamed", !0), t
    }], 785970), t.s(["normalize", 0, eo, "normalizeToSize", 0, function t(e) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 3,
            r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 102400,
            i = eo(e, n);
        return ~-encodeURI(JSON.stringify(i)).split(/%..|./).length > r ? t(e, n - 1, r) : i
    }], 100749);
    let ed = {
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

    function e_(t) {
        if (!t?.sdk) return;
        let {
            name: e,
            version: n
        } = t.sdk;
        return {
            name: e,
            version: n
        }
    }

    function ef(t, e, n, r) {
        let i = t.sdkProcessingMetadata?.dynamicSamplingContext;
        return {
            event_id: t.event_id,
            sent_at: new Date().toISOString(),
            ...e && {
                sdk: e
            },
            ...!!n && r && {
                dsn: tw(r)
            },
            ...i && {
                trace: i
            }
        }
    }

    function eh(t, e) {
        let n = ei(t[0]),
            r = e?.getDsn(),
            i = e?.getOptions().tunnel,
            s = {
                sent_at: new Date().toISOString(),
                ...!!n.trace_id && !!n.public_key && {
                    trace: n
                },
                ...!!i && r && {
                    dsn: tw(r)
                }
            },
            {
                beforeSendSpan: a,
                ignoreSpans: o
            } = e?.getOptions() || {},
            u = o?.length ? t.filter(t => !tb(tW(t), o)) : t,
            c = t.length - u.length;
        c && e?.recordDroppedEvent("before_send", "span", c);
        let l = a ? t => {
                let e = tW(t),
                    n = ea(a) ? e : a(e);
                return n || (t6(), e)
            } : tW,
            p = [];
        for (let t of u) {
            let e = l(t);
            e && p.push(ep(e))
        }
        return eu(s, p)
    }

    function eg(t) {
        if (!t || 0 === t.length) return;
        let e = {};
        return t.forEach(t => {
            let n = t.attributes || {},
                r = n[tu],
                i = n[tc];
            "string" == typeof r && "number" == typeof i && (e[t.name] = {
                value: i,
                unit: r
            })
        }), e
    }
    t.s(["addItemToEnvelope", 0, function(t, e) {
        let [n, r] = t;
        return [n, [...r, e]]
    }, "createAttachmentEnvelopeItem", 0, function(t) {
        let e = "string" == typeof t.data ? el(t.data) : t.data;
        return [{
            type: "attachment",
            length: e.length,
            filename: t.filename,
            content_type: t.contentType,
            attachment_type: t.attachmentType
        }, e]
    }, "createEnvelope", 0, eu, "createEventEnvelopeHeaders", 0, ef, "createSpanEnvelopeItem", 0, ep, "envelopeContainsItemType", 0, function(t, e) {
        return ec(t, (t, n) => e.includes(n))
    }, "envelopeItemTypeToDataCategory", 0, function(t) {
        return t in ed ? ed[t] : t
    }, "forEachEnvelopeItem", 0, ec, "getSdkMetadataForEnvelopeHeader", 0, e_, "parseEnvelope", 0, function(t) {
        let e = "string" == typeof t ? el(t) : t;

        function n(t) {
            let n = e.subarray(0, t);
            return e = e.subarray(t + 1), n
        }

        function r() {
            var t;
            let r, i = e.indexOf(10);
            return i < 0 && (i = e.length), JSON.parse((t = n(i), (r = (0, s.getSentryCarrier)(h.GLOBAL_OBJ)).decodePolyfill ? r.decodePolyfill(t) : new TextDecoder().decode(t)))
        }
        let i = r(),
            a = [];
        for (; e.length;) {
            let t = r(),
                e = "number" == typeof t.length ? t.length : void 0;
            a.push([t, e ? n(e) : r()])
        }
        return [i, a]
    }, "serializeEnvelope", 0, function(t) {
        let [e, n] = t, r = JSON.stringify(e);

        function i(t) {
            "string" == typeof r ? r = "string" == typeof t ? r + t : [el(r), t] : r.push("string" == typeof t ? el(t) : t)
        }
        for (let t of n) {
            let [e, n] = t;
            if (i(`
${JSON.stringify(e)}
`), "string" == typeof n || n instanceof Uint8Array) i(n);
            else {
                let t;
                try {
                    t = JSON.stringify(n)
                } catch {
                    t = JSON.stringify(eo(n))
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
    }], 227668), t.s(["createEventEnvelope", 0, function(t, e, n, r) {
        let i = e_(n),
            s = t.type && "replay_event" !== t.type ? t.type : "event";
        ! function(t, e) {
            if (!e) return;
            let n = t.sdk || {};
            t.sdk = {
                ...n,
                name: n.name || e.name,
                version: n.version || e.version,
                integrations: [...t.sdk?.integrations || [], ...e.integrations || []],
                packages: [...t.sdk?.packages || [], ...e.packages || []],
                settings: t.sdk?.settings || e.settings ? {
                    ...t.sdk?.settings,
                    ...e.settings
                } : void 0
            }
        }(t, n?.sdk);
        let a = ef(t, i, r, e);
        return delete t.sdkProcessingMetadata, eu(a, [
            [{
                type: s
            }, t]
        ])
    }, "createSessionEnvelope", 0, function(t, e, n, r) {
        let i = e_(n);
        return eu({
            sent_at: new Date().toISOString(),
            ...i && {
                sdk: i
            },
            ...!!r && e && {
                dsn: tw(e)
            }
        }, ["aggregates" in t ? [{
            type: "sessions"
        }, t] : [{
            type: "session"
        }, t.toJSON()]])
    }, "createSpanEnvelope", 0, eh], 718305), t.s(["setMeasurement", 0, function(t, e, n) {
        let r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : t7(),
            i = r && t8(r);
        i && (a.DEBUG_BUILD && u.debug.log(`[Measurement] Setting measurement on root span: ${t} = ${e} ${n}`), i.addEvent(t, {
            [tc]: e,
            [tu]: n
        }))
    }, "timedEventsToMeasurements", 0, eg], 139436);
    class em {
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
                traceFlags: +!!n
            }
        }
        setAttribute(t, e) {
            return void 0 === e ? delete this._attributes[t] : this._attributes[t] = e, this
        }
        setAttributes(t) {
            return Object.keys(t).forEach(e => this.setAttribute(e, t[e])), this
        }
        updateStartTime(t) {
            this._startTime = tz(t)
        }
        setStatus(t) {
            return this._status = t, this
        }
        updateName(t) {
            return this._name = t, this.setAttribute(tr, "custom"), this
        }
        end(t) {
            this._endTime || (this._endTime = tz(t), function(t) {
                if (!a.DEBUG_BUILD) return;
                let {
                    description: e = "< unknown name >",
                    op: n = "< unknown op >"
                } = tW(t), {
                    spanId: r
                } = t.spanContext(), i = t8(t) === t, s = `[Tracing] Finishing "${n}" ${i?"root ":""}span "${e}" with ID ${r}`;
                u.debug.log(s)
            }(this), this._onSpanEnded())
        }
        getSpanJSON() {
            return {
                data: this._attributes,
                description: this._name,
                op: this._attributes[ta],
                parent_span_id: this._parentSpanId,
                span_id: this._spanId,
                start_timestamp: this._startTime,
                status: t0(this._status),
                timestamp: this._endTime,
                trace_id: this._traceId,
                origin: this._attributes[to],
                profile_id: this._attributes[tp],
                exclusive_time: this._attributes[td],
                measurements: eg(this._events),
                is_segment: this._isStandaloneSpan && t8(this) === this || void 0,
                segment_id: this._isStandaloneSpan ? t8(this).spanContext().spanId : void 0,
                links: tV(this._links)
            }
        }
        getStreamedSpanJSON() {
            return {
                name: this._name ?? "",
                span_id: this._spanId,
                trace_id: this._traceId,
                parent_span_id: this._parentSpanId,
                start_timestamp: this._startTime,
                end_timestamp: this._endTime ?? this._startTime,
                is_segment: this._isStandaloneSpan || this === t8(this),
                status: t1(this._status),
                attributes: this._attributes,
                links: tH(this._links)
            }
        }
        isRecording() {
            return !this._endTime && !!this._sampled
        }
        addEvent(t, e, n) {
            a.DEBUG_BUILD && u.debug.log("[Tracing] Adding an event to span:", t);
            let r = eS(e) ? e : n || w(),
                i = eS(e) ? {} : e || {},
                s = {
                    name: t,
                    time: tz(r),
                    attributes: i
                };
            return this._events.push(s), this
        }
        isStandaloneSpan() {
            return !!this._isStandaloneSpan
        }
        _onSpanEnded() {
            let t = tn();
            if (t && (t.emit("spanEnd", this), this._isStandaloneSpan || t.emit("afterSpanEnd", this)), !(this._isStandaloneSpan || this === t8(this))) return;
            if (this._isStandaloneSpan) return void(this._sampled ? function(t) {
                let e = tn();
                if (!e) return;
                let n = t[1];
                n && 0 !== n.length ? e.sendEnvelope(t) : e.recordDroppedEvent("before_send", "span")
            }(eh([this], t)) : (a.DEBUG_BUILD && u.debug.log("[Tracing] Discarding standalone span because its trace was not chosen to be sampled."), t && t.recordDroppedEvent("sample_rate", "span")));
            if (t && tv(t)) return void t.emit("afterSegmentSpanEnd", this);
            let e = this._convertSpanToTransaction();
            e && (tD(this).scope || Z()).captureEvent(e)
        }
        _convertSpanToTransaction() {
            if (!ey(tW(this))) return;
            this._name || (a.DEBUG_BUILD && u.debug.warn("Transaction has no name, falling back to `<unlabeled transaction>`."), this._name = "<unlabeled transaction>");
            let {
                scope: t,
                isolationScope: e
            } = tD(this), n = t?.getScopeData().sdkProcessingMetadata?.normalizedRequest;
            if (!0 !== this._sampled) return;
            let r = t3(this).filter(t => {
                    var e;
                    return t !== this && !((e = t) instanceof em && e.isStandaloneSpan())
                }).map(t => tW(t)).filter(ey),
                i = this._attributes[tr];
            delete this._attributes[tl], r.forEach(t => {
                delete t.data[tl]
            });
            let s = {
                    contexts: {
                        trace: tY(this)
                    },
                    spans: r.length > 1e3 ? r.sort((t, e) => t.start_timestamp - e.start_timestamp).slice(0, 1e3) : r,
                    start_timestamp: this._startTime,
                    timestamp: this._endTime,
                    transaction: this._name,
                    type: "transaction",
                    sdkProcessingMetadata: {
                        capturedSpanScope: t,
                        capturedSpanIsolationScope: e,
                        dynamicSamplingContext: ei(this)
                    },
                    request: n,
                    ...i && {
                        transaction_info: {
                            source: i
                        }
                    }
                },
                o = eg(this._events);
            return o && Object.keys(o).length && (a.DEBUG_BUILD && u.debug.log("[Measurements] Adding measurements to transaction event", JSON.stringify(o, void 0, 2)), s.measurements = o), s
        }
        constructor(t = {}) {
            this._traceId = t.traceId || B(), this._spanId = t.spanId || P(), this._startTime = t.startTimestamp || w(), this._links = t.links, this._attributes = {}, this.setAttributes({
                [to]: "manual",
                [ta]: t.op,
                ...t.attributes
            }), this._name = t.name, t.parentSpanId && (this._parentSpanId = t.parentSpanId), "sampled" in t && (this._sampled = t.sampled), t.endTimestamp && (this._endTime = t.endTimestamp), this._events = [], this._isStandaloneSpan = t.isStandalone, this._endTime && this._onSpanEnded()
        }
    }

    function eS(t) {
        return t && "number" == typeof t || t instanceof Date || Array.isArray(t)
    }

    function ey(t) {
        return !!t.start_timestamp && !!t.timestamp && !!t.span_id && !!t.trace_id
    }
    t.s(["SentrySpan", 0, em], 950921);
    let eE = "__SENTRY_SUPPRESS_TRACING__";

    function eb(t, e) {
        let n = eA();
        return n.withActiveSpan ? n.withActiveSpan(t, e) : te(n => (j(n, t || void 0), e(n)))
    }

    function ev(t) {
        let e = eA();
        return e.startNewTrace ? e.startNewTrace(t) : te(e => (e.setPropagationContext({
            traceId: B(),
            sampleRand: m()
        }), a.DEBUG_BUILD && u.debug.log(`Starting a new trace with id ${e.getPropagationContext().traceId}`), eb(null, t)))
    }

    function eT(t) {
        var e, n;
        let r, i, {
            parentSpan: s,
            spanArguments: o,
            forceTransaction: c,
            scope: l
        } = t;
        if (!ty()) {
            let t = new es;
            if (c || !s) {
                let e = {
                    sampled: "false",
                    sample_rate: "0",
                    transaction: o.name,
                    ...ei(t)
                };
                en(t, e)
            }
            return t
        }
        let p = tn();
        if (e = p, n = o, r = e?.getOptions().ignoreSpans, e && tv(e) && r?.length && tb({
                description: n.name || "",
                op: n.attributes?.[ta] || n.op
            }, r)) return eD(l) || p?.recordDroppedEvent("ignored", "span"), new es({
            dropReason: "ignored",
            traceId: s?.spanContext().traceId ?? l.getPropagationContext().traceId
        });
        let d = tt();
        if (s && !c) i = function(t, e, n) {
            let {
                spanId: r,
                traceId: i
            } = t.spanContext(), s = eD(e), a = !s && tZ(t), o = a ? new em({
                ...n,
                parentSpanId: r,
                traceId: i,
                sampled: a
            }) : new es({
                traceId: i
            });
            t4(t, o);
            let u = tn();
            return u && (tv(u) && o instanceof es && (t instanceof es && t.dropReason ? (o.dropReason = t.dropReason, u.recordDroppedEvent(t.dropReason, "span")) : s || (o.dropReason = "sample_rate", u.recordDroppedEvent("sample_rate", "span"))), u.emit("spanStart", o), n.endTimestamp && (u.emit("spanEnd", o), u.emit("afterSpanEnd", o))), o
        }(s, l, o), t4(s, i);
        else if (s) {
            let t = ei(s),
                {
                    traceId: e,
                    spanId: n
                } = s.spanContext(),
                r = tZ(s);
            en(i = eN({
                traceId: e,
                parentSpanId: n,
                ...o
            }, l, r), t)
        } else {
            let {
                traceId: t,
                dsc: e,
                parentSpanId: n,
                sampled: r
            } = {
                ...d.getPropagationContext(),
                ...l.getPropagationContext()
            };
            i = eN({
                traceId: t,
                parentSpanId: n,
                ...o
            }, l, r), e && en(i, e)
        }
        return ! function(t) {
            if (!a.DEBUG_BUILD) return;
            let {
                description: e = "< unknown name >",
                op: n = "< unknown op >",
                parent_span_id: r
            } = tW(t), {
                spanId: i
            } = t.spanContext(), s = tZ(t), o = t8(t), c = o === t, l = `[Tracing] Starting ${s?"sampled":"unsampled"} ${c?"root ":""}span`, p = [`op: ${n}`, `name: ${e}`, `ID: ${i}`];
            if (r && p.push(`parent ID: ${r}`), !c) {
                let {
                    op: t,
                    description: e
                } = tW(o);
                p.push(`root ID: ${o.spanContext().spanId}`), t && p.push(`root op: ${t}`), e && p.push(`root description: ${e}`)
            }
            u.debug.log(`${l}
  ${p.join("\n  ")}`)
        }(i), tx(i, l, d), i
    }

    function eI(t) {
        let e = {
            isStandalone: (t.experimental || {}).standalone,
            ...t
        };
        if (t.startTime) {
            let n = {
                ...e
            };
            return n.startTimestamp = tz(t.startTime), delete n.startTime, n
        }
        return e
    }

    function eA() {
        return Q((0, s.getMainCarrier)())
    }

    function eN(t, e, n) {
        let r = tn(),
            i = r?.getOptions() || {},
            {
                name: s = ""
            } = t,
            o = {
                spanAttributes: {
                    ...t.attributes
                },
                spanName: s,
                parentSampled: n
            };
        r?.emit("beforeSampling", o, {
            decision: !1
        });
        let c = o.parentSampled ?? n,
            l = o.spanAttributes,
            p = e.getPropagationContext(),
            d = eD(e),
            [_, f, h] = d ? [!1] : function(t, e, n) {
                let r, i;
                if (!ty(t)) return [!1];
                "function" == typeof t.tracesSampler ? (r = t.tracesSampler({
                    ...e,
                    inheritOrSampleWith: t => "number" == typeof e.parentSampleRate ? e.parentSampleRate : "boolean" == typeof e.parentSampled ? Number(e.parentSampled) : t
                }), i = !0) : void 0 !== e.parentSampled ? r = e.parentSampled : void 0 !== t.tracesSampleRate && (r = t.tracesSampleRate, i = !0);
                let s = tT(r);
                if (void 0 === s) return a.DEBUG_BUILD && u.debug.warn(`[Tracing] Discarding root span because of invalid sample rate. Sample rate must be a boolean or a number between 0 and 1. Got ${JSON.stringify(r)} of type ${JSON.stringify(typeof r)}.`), [!1];
                if (!s) return a.DEBUG_BUILD && u.debug.log(`[Tracing] Discarding transaction because ${"function"==typeof t.tracesSampler?"tracesSampler returned 0 or false":"a negative sampling decision was inherited or tracesSampleRate is set to 0"}`), [!1, s, i];
                let o = n < s;
                return !o && a.DEBUG_BUILD && u.debug.log(`[Tracing] Discarding transaction because it's not included in the random sample (sampling rate = ${Number(r)})`), [o, s, i]
            }(i, {
                name: s,
                parentSampled: c,
                attributes: l,
                parentSampleRate: tT(p.dsc?.sample_rate)
            }, p.sampleRand),
            g = new em({
                ...t,
                attributes: {
                    [tr]: "custom",
                    [ti]: void 0 !== f && h ? f : void 0,
                    ...l
                },
                sampled: _
            });
        return _ || !r || d || (a.DEBUG_BUILD && u.debug.log("[Tracing] Discarding root span because its trace was not chosen to be sampled."), r.recordDroppedEvent("sample_rate", tv(r) ? "span" : "transaction")), r && r.emit("spanStart", g), g
    }

    function eC(t, e) {
        if (e) return e;
        if (null === e) return;
        let n = G(t);
        if (!n) return;
        let r = tn();
        return (r ? r.getOptions() : {}).parentSpanIsAlwaysRootSpan ? t8(n) : n
    }

    function eR(t) {
        return void 0 !== t ? e => eb(t, e) : t => t()
    }

    function ex(t) {
        return t instanceof es && "ignored" === t.dropReason
    }

    function eD(t) {
        return !0 === t.getScopeData().sdkProcessingMetadata[eE]
    }
    t.s(["continueTrace", 0, (t, e) => {
        let n = Q((0, s.getMainCarrier)());
        if (n.continueTrace) return n.continueTrace(t, e);
        let {
            sentryTrace: r,
            baggage: i
        } = t, a = tn(), o = tf(i);
        return a && !tF(a, o?.org_id) ? ev(e) : te(t => {
            let n = t$(r, i);
            return t.setPropagationContext(n), j(t, void 0), e()
        })
    }, "startInactiveSpan", 0, function(t) {
        let e = eA();
        if (e.startInactiveSpan) return e.startInactiveSpan(t);
        let n = eI(t),
            {
                forceTransaction: r,
                parentSpan: i
            } = t;
        return (t.scope ? e => te(t.scope, e) : void 0 !== i ? t => eb(i, t) : t => t())(() => {
            let e = Z(),
                s = eC(e, i),
                a = tn();
            return t.onlyIfParent && !s ? (a?.recordDroppedEvent("no_parent_span", "span"), new es) : eT({
                parentSpan: s,
                spanArguments: n,
                forceTransaction: r,
                scope: e
            })
        })
    }, "startNewTrace", 0, ev, "startSpan", 0, function(t, e) {
        let n = eA();
        if (n.startSpan) return n.startSpan(t, e);
        let r = eI(t),
            {
                forceTransaction: i,
                parentSpan: s,
                scope: a
            } = t;
        return te(a?.clone(), () => eR(s)(() => {
            let n = Z(),
                a = eC(n, s),
                o = tn(),
                u = t.onlyIfParent && !a,
                c = u ? new es : eT({
                    parentSpan: a,
                    spanArguments: r,
                    forceTransaction: i,
                    scope: n
                });
            return u && o?.recordDroppedEvent("no_parent_span", "span"), ex(c) && a || j(n, c), tS(() => e(c), () => {
                let {
                    status: t
                } = tW(c);
                c.isRecording() && (!t || "ok" === t) && c.setStatus({
                    code: 2,
                    message: "internal_error"
                })
            }, () => {
                c.end()
            })
        }))
    }, "startSpanManual", 0, function(t, e) {
        let n = eA();
        if (n.startSpanManual) return n.startSpanManual(t, e);
        let r = eI(t),
            {
                forceTransaction: i,
                parentSpan: s,
                scope: a
            } = t;
        return te(a?.clone(), () => eR(s)(() => {
            let n = Z(),
                a = eC(n, s),
                o = t.onlyIfParent && !a,
                u = o ? new es : eT({
                    parentSpan: a,
                    spanArguments: r,
                    forceTransaction: i,
                    scope: n
                });
            return o && tn()?.recordDroppedEvent("no_parent_span", "span"), ex(u) && a || j(n, u), tS(() => e(u, () => u.end()), () => {
                let {
                    status: t
                } = tW(u);
                u.isRecording() && (!t || "ok" === t) && u.setStatus({
                    code: 2,
                    message: "internal_error"
                })
            })
        }))
    }, "suppressTracing", 0, function(t) {
        let e = eA();
        return e.suppressTracing ? e.suppressTracing(t) : te(e => {
            e.setSDKProcessingMetadata({
                [eE]: !0
            });
            let n = t();
            return e.setSDKProcessingMetadata({
                [eE]: void 0
            }), n
        })
    }, "withActiveSpan", 0, eb], 459557)
}]);

//# debugId=f6c85d46-79df-ee89-6bad-173b4d59c990
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0siq6~zje72jh.js.map