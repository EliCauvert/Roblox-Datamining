;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "5ce1f4c1-da28-7a0d-0af9-bd0d304c4d54")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 80768, 489427, 379705, 350941, 600496, 728441, 823979, 230242, 127229, 873598, 359335, t => {
    "use strict";
    let e, n, r, i = "10.53.1",
        s = globalThis;

    function a() {
        return o(s), s
    }

    function o(t) {
        let e = t.__SENTRY__ = t.__SENTRY__ || {};
        return e.version = e.version || i, e[i] = e[i] || {}
    }

    function c(t, e) {
        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : s,
            r = n.__SENTRY__ = n.__SENTRY__ || {},
            a = r[i] = r[i] || {};
        return a[t] || (a[t] = e())
    }
    t.s(["GLOBAL_OBJ", 0, s], 489427);
    let u = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__,
        l = Object.prototype.toString;

    function p(t) {
        switch (l.call(t)) {
            case "[object Error]":
            case "[object Exception]":
            case "[object DOMException]":
            case "[object WebAssembly.Exception]":
                return !0;
            default:
                return v(t, Error)
        }
    }

    function d(t, e) {
        return l.call(t) === "[object ".concat(e, "]")
    }

    function h(t) {
        return d(t, "String")
    }

    function _(t) {
        return d(t, "Object")
    }

    function f(t) {
        return "u" > typeof Event && v(t, Event)
    }

    function m(t) {
        return "u" > typeof Element && v(t, Element)
    }

    function g(t) {
        return d(t, "RegExp")
    }

    function S(t) {
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
                        if (e && h(e))
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
    t.s(["isElement", 0, m, "isError", 0, p, "isEvent", 0, f, "isInstanceOf", 0, v, "isPlainObject", 0, _, "isPrimitive", 0, function(t) {
        return null === t || "object" == typeof t && null !== t && "__sentry_template_string__" in t && "__sentry_template_values__" in t || "object" != typeof t && "function" != typeof t
    }, "isRegExp", 0, g, "isString", 0, h, "isSyntheticEvent", 0, function(t) {
        return _(t) && "nativeEvent" in t && "preventDefault" in t && "stopPropagation" in t
    }, "isThenable", 0, S, "isVueViewModel", 0, function(t) {
        return !!("object" == typeof t && null !== t && (t.__isVue || t._isVue || t.__v_isVNode))
    }], 379705), t.s(["getLocationHref", 0, function() {
        try {
            return s.document.location.href
        } catch (t) {
            return ""
        }
    }, "htmlTreeAsString", 0, y], 350941);
    let b = {};

    function I(t) {
        if (!("console" in s)) return t();
        let e = s.console,
            n = {},
            r = Object.keys(b);
        r.forEach(t => {
            let r = b[t];
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

    function x() {
        return w().enabled
    }

    function E(t) {
        for (var e = arguments.length, n = Array(e > 1 ? e - 1 : 0), r = 1; r < e; r++) n[r - 1] = arguments[r];
        u && x() && I(() => {
            s.console[t]("".concat("Sentry Logger ", "[").concat(t, "]:"), ...n)
        })
    }

    function w() {
        return u ? c("loggerSettings", () => ({
            enabled: !1
        })) : {
            enabled: !1
        }
    }
    let T = {
        enable: function() {
            w().enabled = !0
        },
        disable: function() {
            w().enabled = !1
        },
        isEnabled: x,
        log: function() {
            for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
            E("log", ...e)
        },
        warn: function() {
            for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
            E("warn", ...e)
        },
        error: function() {
            for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
            E("error", ...e)
        }
    };

    function A(t, e, n) {
        try {
            Object.defineProperty(t, e, {
                value: n,
                writable: !0,
                configurable: !0
            })
        } catch (n) {
            u && T.log('Failed to add non-enumerable property "'.concat(String(e), '" to object'), t)
        }
    }

    function k(t) {
        try {
            return m(t) ? y(t) : Object.prototype.toString.call(t)
        } catch (t) {
            return "<unknown>"
        }
    }

    function C(t) {
        return "object" == typeof t && null !== t ? Object.fromEntries(Object.entries(t)) : {}
    }

    function R(t) {
        if (void 0 !== e) return e ? e(t) : t();
        let n = Symbol.for("__SENTRY_SAFE_RANDOM_ID_WRAPPER__");
        return n in s && "function" == typeof s[n] ? (e = s[n])(t) : (e = null, t())
    }

    function D() {
        return R(() => Math.random())
    }

    function N(t, e) {
        let n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
        return !!h(t) && (g(e) ? e.test(t) : h(e) ? n ? t === e : t.includes(e) : "function" == typeof e && e(t))
    }

    function O() {
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : s.crypto || s.msCrypto;
        try {
            if (null == t ? void 0 : t.randomUUID) return R(() => t.randomUUID()).replace(/-/g, "")
        } catch (t) {}
        return n || (n = "10000000100040008000100000000000"), n.replace(/[018]/g, t => (t ^ (15 & 16 * D()) >> t / 4).toString(16))
    }

    function P() {
        return R(() => Date.now()) / 1e3
    }

    function j() {
        return (null != r ? r : r = function() {
            let {
                performance: t
            } = s;
            if (!(null == t ? void 0 : t.now) || !t.timeOrigin) return P;
            let e = t.timeOrigin;
            return () => (e + R(() => t.now())) / 1e3
        }())()
    }
    t.s(["consoleSandbox", 0, I, "debug", 0, T], 600496), t.s(["addNonEnumerableProperty", 0, A, "convertToPlainObject", 0, function(t) {
        if (p(t)) return {
            message: t.message,
            name: t.name,
            stack: t.stack,
            ...C(t)
        };
        if (!f(t)) return t;
        {
            let e = {
                type: t.type,
                target: k(t.target),
                currentTarget: k(t.currentTarget),
                ...C(t)
            };
            return "u" > typeof CustomEvent && v(t, CustomEvent) && (e.detail = t.detail), e
        }
    }, "getOriginalFunction", 0, function(t) {
        return t.__sentry_original__
    }, "markFunctionWrapped", 0, function(t, e) {
        try {
            let n = e.prototype || {};
            t.prototype = e.prototype = n, A(t, "__sentry_original__", e)
        } catch (t) {}
    }], 728441), t.s(["addExceptionMechanism", 0, function(t, e) {
        var n, r;
        let i = null == (r = t.exception) || null == (n = r.values) ? void 0 : n[0];
        if (!i) return;
        let s = i.mechanism;
        if (i.mechanism = {
                type: "generic",
                handled: !0,
                ...s,
                ...e
            }, e && "data" in e) {
            let t = {
                ...null == s ? void 0 : s.data,
                ...e.data
            };
            i.mechanism.data = t
        }
    }, "addExceptionTypeValue", 0, function(t, e, n) {
        let r = t.exception = t.exception || {},
            i = r.values = r.values || [],
            s = i[0] = i[0] || {};
        s.value || (s.value = e || ""), s.type || (s.type = n || "Error")
    }, "uuid4", 0, O], 823979);

    function L() {
        return O().substring(16)
    }
    let M = "_sentrySpan";

    function U(t, e) {
        e ? A(t, M, e) : delete t[M]
    }
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
            }, t._client = this._client, t._lastEventId = this._lastEventId, t._conversationId = this._conversationId, U(t, this[M]), t
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
            }, this._session && function(t) {
                let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                if (e.user && (!t.ipAddress && e.user.ip_address && (t.ipAddress = e.user.ip_address), t.did || e.did || (t.did = e.user.id || e.user.email || e.user.username)), t.timestamp = e.timestamp || j(), e.abnormal_mechanism && (t.abnormal_mechanism = e.abnormal_mechanism), e.ignoreDuration && (t.ignoreDuration = e.ignoreDuration), e.sid && (t.sid = 32 === e.sid.length ? e.sid : O()), void 0 !== e.init && (t.init = e.init), !t.did && e.did && (t.did = "".concat(e.did)), "number" == typeof e.started && (t.started = e.started), t.ignoreDuration) t.duration = void 0;
                else if ("number" == typeof e.duration) t.duration = e.duration;
                else {
                    let e = t.timestamp - t.started;
                    t.duration = e >= 0 ? e : 0
                }
                e.release && (t.release = e.release), e.environment && (t.environment = e.environment), !t.ipAddress && e.ipAddress && (t.ipAddress = e.ipAddress), !t.userAgent && e.userAgent && (t.userAgent = e.userAgent), "number" == typeof e.errors && (t.errors = e.errors), e.status && (t.status = e.status)
            }(this._session, {
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
                } = (e instanceof F ? e.getScopeData() : _(e) ? t : void 0) || {};
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
            return this._breadcrumbs = [], this._tags = {}, this._attributes = {}, this._extra = {}, this._user = {}, this._contexts = {}, this._level = void 0, this._transactionName = void 0, this._fingerprint = void 0, this._session = void 0, this._conversationId = void 0, U(this, void 0), this._attachments = [], this.setPropagationContext({
                traceId: O(),
                sampleRand: D()
            }), this._notifyScopeListeners(), this
        }
        addBreadcrumb(t, e) {
            let n = "number" == typeof e ? e : 100;
            if (n <= 0) return this;
            let r = {
                timestamp: P(),
                ...t,
                message: t.message ? function(t) {
                    let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
                    return "string" != typeof t || 0 === e || t.length <= e ? t : "".concat(t.slice(0, e), "...")
                }(t.message, 2048) : t.message
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
                span: this[M],
                conversationId: this._conversationId
            }
        }
        setSDKProcessingMetadata(t) {
            return this._sdkProcessingMetadata = function t(e, n) {
                let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 2;
                if (!n || "object" != typeof n || r <= 0) return n;
                if (e && 0 === Object.keys(n).length) return e;
                let i = {
                    ...e
                };
                for (let e in n) Object.prototype.hasOwnProperty.call(n, e) && (i[e] = t(i[e], n[e], r - 1));
                return i
            }(this._sdkProcessingMetadata, t, 2), this
        }
        setPropagationContext(t) {
            return this._propagationContext = t, this
        }
        getPropagationContext() {
            return this._propagationContext
        }
        captureException(t, e) {
            let n = (null == e ? void 0 : e.event_id) || O();
            if (!this._client) return u && T.warn("No client configured on scope - will not capture exception!"), n;
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
            let i = (null == n ? void 0 : n.event_id) || O();
            if (!this._client) return u && T.warn("No client configured on scope - will not capture message!"), i;
            let s = null != (r = null == n ? void 0 : n.syntheticException) ? r : Error(t);
            return this._client.captureMessage(t, e, {
                originalException: t,
                syntheticException: s,
                ...n,
                event_id: i
            }, this), i
        }
        captureEvent(t, e) {
            let n = t.event_id || (null == e ? void 0 : e.event_id) || O();
            return this._client ? this._client.captureEvent(t, {
                ...e,
                event_id: n
            }, this) : u && T.warn("No client configured on scope - will not capture event!"), n
        }
        _notifyScopeListeners() {
            this._notifyingListeners || (this._notifyingListeners = !0, this._scopeListeners.forEach(t => {
                t(this)
            }), this._notifyingListeners = !1)
        }
        constructor() {
            this._notifyingListeners = !1, this._scopeListeners = [], this._eventProcessors = [], this._breadcrumbs = [], this._attachments = [], this._user = {}, this._tags = {}, this._attributes = {}, this._extra = {}, this._contexts = {}, this._sdkProcessingMetadata = {}, this._propagationContext = {
                traceId: O(),
                sampleRand: D()
            }
        }
    }
    let Y = t => t instanceof Promise && !t[B],
        B = Symbol("chained PromiseLike"),
        G = (t, e, n) => {
            let r = t.then(t => (e(t), t), t => {
                throw n(t), t
            });
            return Y(r) && Y(t) ? r : J(t, r)
        },
        J = (t, e) => {
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
                [B]: !0
            }), e
        };
    class K {
        withScope(t) {
            let e, n = this._pushScope();
            try {
                e = t(n)
            } catch (t) {
                throw this._popScope(), t
            }
            return S(e) ? G(e, () => this._popScope(), () => this._popScope()) : (this._popScope(), e)
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

    function W() {
        let t = o(a());
        return t.stack = t.stack || new K(c("defaultCurrentScope", () => new F), c("defaultIsolationScope", () => new F))
    }

    function V(t) {
        return W().withScope(t)
    }

    function z(t, e) {
        let n = W();
        return n.withScope(() => (n.getStackTop().scope = t, e(t)))
    }

    function H(t) {
        return W().withScope(() => t(W().getIsolationScope()))
    }

    function q(t) {
        let e = o(t);
        return e.acs ? e.acs : {
            withIsolationScope: H,
            withScope: V,
            withSetScope: z,
            withSetIsolationScope: (t, e) => H(e),
            getCurrentScope: () => W().getScope(),
            getIsolationScope: () => W().getIsolationScope()
        }
    }

    function $() {
        return q(a()).getCurrentScope()
    }

    function Q() {
        return q(a()).getIsolationScope()
    }

    function X() {
        for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
        let r = q(a());
        if (2 === e.length) {
            let [t, n] = e;
            return t ? r.withSetScope(t, n) : r.withScope(n)
        }
        return r.withScope(e[0])
    }

    function Z() {
        return $().getClient()
    }
    t.s(["getClient", 0, Z, "getCurrentScope", 0, $, "getGlobalScope", 0, function() {
        return c("globalScope", () => new F)
    }, "getIsolationScope", 0, Q, "withIsolationScope", 0, function() {
        for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
        let r = q(a());
        if (2 === e.length) {
            let [t, n] = e;
            return t ? r.withSetIsolationScope(t, n) : r.withIsolationScope(n)
        }
        return r.withIsolationScope(e[0])
    }, "withScope", 0, X], 230242);
    let tt = "sentry.source",
        te = "sentry.sample_rate",
        tn = "sentry.op",
        tr = "sentry.origin",
        ti = "sentry.custom_span_name",
        ts = "sentry-";

    function ta(t) {
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

    function to(t, e) {
        var n, r, i, s;
        let a, o = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : () => {},
            c = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : () => {};
        try {
            a = t()
        } catch (t) {
            throw e(t), o(), t
        }
        return n = a, r = e, i = o, s = c, S(n) ? G(n, t => {
            i(), s(t)
        }, t => {
            r(t), i()
        }) : (i(), s(n), n)
    }

    function tc(t) {
        var e;
        if ("boolean" == typeof __SENTRY_TRACING__ && !__SENTRY_TRACING__) return !1;
        let n = t || (null == (e = Z()) ? void 0 : e.getOptions());
        return !!n && (null != n.tracesSampleRate || !!n.tracesSampler)
    }

    function tu(t) {
        T.log("Ignoring span ".concat(t.op, " - ").concat(t.description, " because it matches `ignoreSpans`."))
    }

    function tl(t, e) {
        if (!(null == e ? void 0 : e.length)) return !1;
        for (let r of e) {
            var n;
            if ("string" == typeof(n = r) || n instanceof RegExp) {
                if (t.description && N(t.description, r)) return u && tu(t), !0;
                continue
            }
            let e = !!r.attributes && Object.keys(r.attributes).length > 0;
            if (!r.name && !r.op && !e) continue;
            let i = !r.name || t.description && N(t.description, r.name),
                s = !r.op || t.op && N(t.op, r.op),
                a = !r.attributes || Object.entries(r.attributes).every(e => {
                    var n;
                    let [r, i] = e;
                    return function(t, e) {
                        return "string" == typeof t && ("string" == typeof e || e instanceof RegExp) ? N(t, e) : Array.isArray(t) && Array.isArray(e) ? t.length === e.length && t.every((t, n) => t === e[n]) : t === e
                    }(null == (n = t.attributes) ? void 0 : n[r], i)
                });
            if (i && s && a) return u && tu(t), !0
        }
        return !1
    }

    function tp(t) {
        return "stream" === t.getOptions().traceLifecycle
    }

    function td(t) {
        if ("boolean" == typeof t) return Number(t);
        let e = "string" == typeof t ? parseFloat(t) : t;
        if (!("number" != typeof e || isNaN(e)) && !(e < 0) && !(e > 1)) return e
    }
    let th = "_sentryScope",
        t_ = "_sentryIsolationScope";

    function tf(t) {
        return {
            scope: t[th],
            isolationScope: function(t) {
                if (t) {
                    if ("object" == typeof t && "deref" in t && "function" == typeof t.deref) try {
                        return t.deref()
                    } catch (t) {
                        return
                    }
                    return t
                }
            }(t[t_])
        }
    }
    let tm = /^o(\d+)\./,
        tg = /^(?:(\w+):)\/\/(?:(\w+)(?::(\w+)?)?@)((?:\[[:.%\w]+\]|[\w.-]+))(?::(\d+))?\/(.+)/;

    function tS(t) {
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
    }

    function tv(t) {
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

    function ty(t) {
        let e, n = t.getOptions(),
            {
                host: r
            } = t.getDsn() || {};
        if (n.orgId) e = String(n.orgId);
        else {
            let t;
            r && (e = null == (t = r.match(tm)) ? void 0 : t[1])
        }
        return e
    }
    t.s(["dsnToString", 0, tS, "extractOrgIdFromClient", 0, ty, "makeDsn", 0, function(t) {
        let e = "string" == typeof t ? function(t) {
            let e = tg.exec(t);
            if (!e) return void I(() => {
                console.error("Invalid Sentry Dsn: ".concat(t))
            });
            let [n, r, i = "", s = "", a = "", o = ""] = e.slice(1), c = "", u = o, l = u.split("/");
            if (l.length > 1 && (c = l.slice(0, -1).join("/"), u = l.pop()), u) {
                let t = u.match(/^\d+/);
                t && (u = t[0])
            }
            return tv({
                host: s,
                pass: i,
                path: c,
                projectId: u,
                port: a,
                protocol: n,
                publicKey: r
            })
        }(t) : tv(t);
        if (e && function(t) {
                if (!u) return !0;
                let {
                    port: e,
                    projectId: n,
                    protocol: r
                } = t;
                return !["protocol", "publicKey", "host", "projectId"].find(e => !t[e] && (T.error("Invalid Sentry Dsn: ".concat(e, " missing")), !0)) && (n.match(/^\d+$/) ? "http" !== r && "https" !== r ? (T.error("Invalid Sentry Dsn: Invalid protocol ".concat(r)), !1) : !(e && isNaN(parseInt(e, 10))) || (T.error("Invalid Sentry Dsn: Invalid port ".concat(e)), !1) : (T.error("Invalid Sentry Dsn: Invalid projectId ".concat(n)), !1))
            }(e)) return e
    }], 127229), RegExp("^[ \\t]*([0-9a-f]{32})?-?([0-9a-f]{16})?-?([01])?[ \\t]*$");
    let tb = !1;

    function tI(t) {
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

    function tx(t) {
        return "number" == typeof t ? tE(t) : Array.isArray(t) ? t[0] + t[1] / 1e9 : t instanceof Date ? tE(t.getTime()) : j()
    }

    function tE(t) {
        return t > 0x2540be3ff ? t / 1e3 : t
    }

    function tw(t) {
        var e, n, r;
        if ("function" == typeof t.getSpanJSON) return t.getSpanJSON();
        let {
            spanId: i,
            traceId: s
        } = t.spanContext();
        if ((e = t).attributes && e.startTime && e.name && e.endTime && e.status) {
            let {
                attributes: e,
                startTime: a,
                name: o,
                endTime: c,
                status: u,
                links: l
            } = t;
            return {
                span_id: i,
                trace_id: s,
                data: e,
                description: o,
                parent_span_id: "parentSpanId" in (n = t) ? n.parentSpanId : "parentSpanContext" in n ? null == (r = n.parentSpanContext) ? void 0 : r.spanId : void 0,
                start_timestamp: tx(a),
                timestamp: tx(c) || void 0,
                status: tA(u),
                op: e[tn],
                origin: e[tr],
                links: tI(l)
            }
        }
        return {
            span_id: i,
            trace_id: s,
            start_timestamp: 0,
            data: {}
        }
    }

    function tT(t) {
        let {
            traceFlags: e
        } = t.spanContext();
        return 1 === e
    }

    function tA(t) {
        if (t && 0 !== t.code) return 1 === t.code ? "ok" : t.message || "internal_error"
    }
    let tk = "_sentryChildSpans",
        tC = "_sentryRootSpan";

    function tR(t, e) {
        let n = t[tC] || t;
        A(e, tC, n), t[tk] ? t[tk].add(e) : A(t, tk, new Set([e]))
    }
    let tD = function(t) {
            return t[tC] || t
        },
        tN = "_frozenDsc";

    function tO(t) {
        var e, n, r, i, s;
        let a = Z();
        if (!a) return {};
        let o = tD(t),
            c = tw(o),
            u = c.data,
            l = o.spanContext().traceState,
            p = null != (e = null != (n = null == l ? void 0 : l.get("sentry.sample_rate")) ? n : u[te]) ? e : u["sentry.previous_trace_sample_rate"];

        function d(t) {
            return ("number" == typeof p || "string" == typeof p) && (t.sample_rate = "".concat(p)), t
        }
        let _ = o[tN];
        if (_) return d(_);
        let f = null == l ? void 0 : l.get("sentry.dsc"),
            m = f && function(t) {
                let e = function(t) {
                    if (t && (h(t) || Array.isArray(t))) return Array.isArray(t) ? t.reduce((t, e) => (Object.entries(ta(e)).forEach(e => {
                        let [n, r] = e;
                        t[n] = r
                    }), t), {}) : ta(t)
                }(t);
                if (!e) return;
                let n = Object.entries(e).reduce((t, e) => {
                    let [n, r] = e;
                    return n.startsWith(ts) && (t[n.slice(ts.length)] = r), t
                }, {});
                return Object.keys(n).length > 0 ? n : void 0
            }(f);
        if (m) return d(m);
        let g = function(t, e) {
                let n = e.getOptions(),
                    {
                        publicKey: r
                    } = e.getDsn() || {},
                    i = {
                        environment: n.environment || "production",
                        release: n.release,
                        public_key: r,
                        trace_id: t,
                        org_id: ty(e)
                    };
                return e.emit("createDsc", i), i
            }(t.spanContext().traceId, a),
            S = null != (r = u[tt]) ? r : u["sentry.span.source"],
            v = c.description;
        return "url" !== S && v && (g.transaction = v), tc() && (g.sampled = String(tT(o)), g.sample_rand = null != (i = null == l ? void 0 : l.get("sentry.sample_rand")) ? i : null == (s = tf(o).scope) ? void 0 : s.getPropagationContext().sampleRand.toString()), d(g), a.emit("createDsc", g, o), g
    }
    class tP {
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
            this._traceId = t.traceId || O(), this._spanId = t.spanId || L(), this.dropReason = t.dropReason
        }
    }

    function tj(t) {
        if (!t || 0 === t.length) return;
        let e = {};
        return t.forEach(t => {
            let n = t.attributes || {},
                r = n["sentry.measurement_unit"],
                i = n["sentry.measurement_value"];
            "string" == typeof r && "number" == typeof i && (e[t.name] = {
                value: i,
                unit: r
            })
        }), e
    }
    t.s(["SentryNonRecordingSpan", 0, tP], 873598), Symbol.for("sentry.skipNormalization"), Symbol.for("sentry.overrideNormalizationDepth");
    class tL {
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
            this._startTime = tx(t)
        }
        setStatus(t) {
            return this._status = t, this
        }
        updateName(t) {
            return this._name = t, this.setAttribute(tt, "custom"), this
        }
        end(t) {
            this._endTime || (this._endTime = tx(t), function(t) {
                if (!u) return;
                let {
                    description: e = "< unknown name >",
                    op: n = "< unknown op >"
                } = tw(t), {
                    spanId: r
                } = t.spanContext(), i = tD(t) === t, s = '[Tracing] Finishing "'.concat(n, '" ').concat(i ? "root " : "", 'span "').concat(e, '" with ID ').concat(r);
                T.log(s)
            }(this), this._onSpanEnded())
        }
        getSpanJSON() {
            return {
                data: this._attributes,
                description: this._name,
                op: this._attributes[tn],
                parent_span_id: this._parentSpanId,
                span_id: this._spanId,
                start_timestamp: this._startTime,
                status: tA(this._status),
                timestamp: this._endTime,
                trace_id: this._traceId,
                origin: this._attributes[tr],
                profile_id: this._attributes["sentry.profile_id"],
                exclusive_time: this._attributes["sentry.exclusive_time"],
                measurements: tj(this._events),
                is_segment: this._isStandaloneSpan && tD(this) === this || void 0,
                segment_id: this._isStandaloneSpan ? tD(this).spanContext().spanId : void 0,
                links: tI(this._links)
            }
        }
        getStreamedSpanJSON() {
            var t, e, n, r;
            return {
                name: null != (t = this._name) ? t : "",
                span_id: this._spanId,
                trace_id: this._traceId,
                parent_span_id: this._parentSpanId,
                start_timestamp: this._startTime,
                end_timestamp: null != (e = this._endTime) ? e : this._startTime,
                is_segment: this._isStandaloneSpan || this === tD(this),
                status: (n = this._status) && 1 !== n.code && 0 !== n.code && "cancelled" !== n.message ? "error" : "ok",
                attributes: this._attributes,
                links: (null == (r = this._links) ? void 0 : r.length) ? r.map(t => {
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
        }
        isRecording() {
            return !this._endTime && !!this._sampled
        }
        addEvent(t, e, n) {
            u && T.log("[Tracing] Adding an event to span:", t);
            let r = tM(e) ? e : n || j(),
                i = tM(e) ? {} : e || {},
                s = {
                    name: t,
                    time: tx(r),
                    attributes: i
                };
            return this._events.push(s), this
        }
        isStandaloneSpan() {
            return !!this._isStandaloneSpan
        }
        _onSpanEnded() {
            let t = Z();
            if (t && (t.emit("spanEnd", this), this._isStandaloneSpan || t.emit("afterSpanEnd", this)), !(this._isStandaloneSpan || this === tD(this))) return;
            if (this._isStandaloneSpan) return void(this._sampled ? function(t) {
                let e = Z();
                if (!e) return;
                let n = t[1];
                n && 0 !== n.length ? e.sendEnvelope(t) : e.recordDroppedEvent("before_send", "span")
            }(function(t, e) {
                let n = tO(t[0]),
                    r = null == e ? void 0 : e.getDsn(),
                    i = null == e ? void 0 : e.getOptions().tunnel,
                    s = {
                        sent_at: new Date().toISOString(),
                        ...!!n.trace_id && !!n.public_key && {
                            trace: n
                        },
                        ...!!i && r && {
                            dsn: tS(r)
                        }
                    },
                    {
                        beforeSendSpan: a,
                        ignoreSpans: o
                    } = (null == e ? void 0 : e.getOptions()) || {},
                    c = (null == o ? void 0 : o.length) ? t.filter(t => {
                        let e = tw(t);
                        return !tl({
                            description: e.description,
                            op: e.op,
                            attributes: e.data
                        }, o)
                    }) : t,
                    u = t.length - c.length;
                u && (null == e || e.recordDroppedEvent("before_send", "span", u));
                let l = a ? t => {
                        let e = tw(t),
                            n = a && "function" == typeof a && "_streamed" in a && a._streamed ? e : a(e);
                        return n || (tb || (I(() => {
                            console.warn("[Sentry] Returning null from `beforeSendSpan` is disallowed. To drop certain spans, configure the respective integrations directly or use `ignoreSpans`.")
                        }), tb = !0), e)
                    } : tw,
                    p = [];
                for (let t of c) {
                    let e = l(t);
                    e && p.push([{
                        type: "span"
                    }, e])
                }
                return function(t) {
                    let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [];
                    return [t, e]
                }(s, p)
            }([this], t)) : (u && T.log("[Tracing] Discarding standalone span because its trace was not chosen to be sampled."), t && t.recordDroppedEvent("sample_rate", "span")));
            if (t && tp(t)) return void t.emit("afterSegmentSpanEnd", this);
            let e = this._convertSpanToTransaction();
            e && (tf(this).scope || $()).captureEvent(e)
        }
        _convertSpanToTransaction() {
            var t;
            let e;
            if (!tU(tw(this))) return;
            this._name || (u && T.warn("Transaction has no name, falling back to `<unlabeled transaction>`."), this._name = "<unlabeled transaction>");
            let {
                scope: n,
                isolationScope: r
            } = tf(this), i = null == n || null == (t = n.getScopeData().sdkProcessingMetadata) ? void 0 : t.normalizedRequest;
            if (!0 !== this._sampled) return;
            let s = (e = new Set, ! function t(n) {
                    if (!e.has(n) && tT(n))
                        for (let r of (e.add(n), n[tk] ? Array.from(n[tk]) : [])) t(r)
                }(this), Array.from(e)).filter(t => {
                    var e;
                    return t !== this && !((e = t) instanceof tL && e.isStandaloneSpan())
                }).map(t => tw(t)).filter(tU),
                a = this._attributes[tt];
            delete this._attributes[ti];
            let o = !1;
            s.forEach(t => {
                var e;
                delete t.data[ti], (null == (e = t.op) ? void 0 : e.startsWith("gen_ai.")) && (o = !0)
            });
            let c = {
                    contexts: {
                        trace: function(t) {
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
                            } = tw(t);
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
                        }(this)
                    },
                    spans: s.length > 1e3 ? s.sort((t, e) => t.start_timestamp - e.start_timestamp).slice(0, 1e3) : s,
                    start_timestamp: this._startTime,
                    timestamp: this._endTime,
                    transaction: this._name,
                    type: "transaction",
                    sdkProcessingMetadata: {
                        capturedSpanScope: n,
                        capturedSpanIsolationScope: r,
                        dynamicSamplingContext: tO(this),
                        hasGenAiSpans: o
                    },
                    request: i,
                    ...a && {
                        transaction_info: {
                            source: a
                        }
                    }
                },
                l = tj(this._events);
            return l && Object.keys(l).length && (u && T.log("[Measurements] Adding measurements to transaction event", JSON.stringify(l, void 0, 2)), c.measurements = l), c
        }
        constructor(t = {}) {
            this._traceId = t.traceId || O(), this._spanId = t.spanId || L(), this._startTime = t.startTimestamp || j(), this._links = t.links, this._attributes = {}, this.setAttributes({
                [tr]: "manual",
                [tn]: t.op,
                ...t.attributes
            }), this._name = t.name, t.parentSpanId && (this._parentSpanId = t.parentSpanId), "sampled" in t && (this._sampled = t.sampled), t.endTimestamp && (this._endTime = t.endTimestamp), this._events = [], this._isStandaloneSpan = t.isStandalone, this._endTime && this._onSpanEnded()
        }
    }

    function tM(t) {
        return t && "number" == typeof t || t instanceof Date || Array.isArray(t)
    }

    function tU(t) {
        return !!t.start_timestamp && !!t.timestamp && !!t.span_id && !!t.trace_id
    }

    function tF(t, e) {
        let n = tG();
        return n.withActiveSpan ? n.withActiveSpan(t, e) : X(n => (U(n, t || void 0), e(n)))
    }

    function tY(t) {
        var e, n, r, i, a;
        let o, c, {
            parentSpan: l,
            spanArguments: p,
            forceTransaction: d,
            scope: h
        } = t;
        if (!tc()) {
            let t = new tP;
            if (d || !l) {
                let e = {
                    sampled: "false",
                    sample_rate: "0",
                    transaction: p.name,
                    ...tO(t)
                };
                A(t, tN, e)
            }
            return t
        }
        let _ = Z();
        if (r = _, i = p, o = null == r ? void 0 : r.getOptions().ignoreSpans, r && tp(r) && (null == o ? void 0 : o.length) && tl({
                description: i.name || "",
                op: (null == (a = i.attributes) ? void 0 : a[tn]) || i.op,
                attributes: i.attributes
            }, o)) return tz(h) || null == _ || _.recordDroppedEvent("ignored", "span"), new tP({
            dropReason: "ignored",
            traceId: null != (e = null == l ? void 0 : l.spanContext().traceId) ? e : h.getPropagationContext().traceId
        });
        let f = Q();
        if (l && !d) c = function(t, e, n) {
            let {
                spanId: r,
                traceId: i
            } = t.spanContext(), s = tz(e), a = !s && tT(t), o = a ? new tL({
                ...n,
                parentSpanId: r,
                traceId: i,
                sampled: a
            }) : new tP({
                traceId: i
            });
            tR(t, o);
            let c = Z();
            return c && (tp(c) && o instanceof tP && (t instanceof tP && t.dropReason ? (o.dropReason = t.dropReason, c.recordDroppedEvent(t.dropReason, "span")) : s || (o.dropReason = "sample_rate", c.recordDroppedEvent("sample_rate", "span"))), c.emit("spanStart", o), n.endTimestamp && (c.emit("spanEnd", o), c.emit("afterSpanEnd", o))), o
        }(l, h, p), tR(l, c);
        else if (l) {
            let t = tO(l),
                {
                    traceId: e,
                    spanId: n
                } = l.spanContext(),
                r = tT(l);
            A(c = tJ({
                traceId: e,
                parentSpanId: n,
                ...p
            }, h, r), tN, t)
        } else {
            let {
                traceId: t,
                dsc: e,
                parentSpanId: n,
                sampled: r
            } = {
                ...f.getPropagationContext(),
                ...h.getPropagationContext()
            };
            c = tJ({
                traceId: t,
                parentSpanId: n,
                ...p
            }, h, r), e && A(c, tN, e)
        }
        return ! function(t) {
            if (!u) return;
            let {
                description: e = "< unknown name >",
                op: n = "< unknown op >",
                parent_span_id: r
            } = tw(t), {
                spanId: i
            } = t.spanContext(), s = tT(t), a = tD(t), o = a === t, c = "[Tracing] Starting ".concat(s ? "sampled" : "unsampled", " ").concat(o ? "root " : "", "span"), l = ["op: ".concat(n), "name: ".concat(e), "ID: ".concat(i)];
            if (r && l.push("parent ID: ".concat(r)), !o) {
                let {
                    op: t,
                    description: e
                } = tw(a);
                l.push("root ID: ".concat(a.spanContext().spanId)), t && l.push("root op: ".concat(t)), e && l.push("root description: ".concat(e))
            }
            T.log("".concat(c, "\n  ").concat(l.join("\n  ")))
        }(c), (n = c) && (A(n, t_, function(t) {
            try {
                let e = s.WeakRef;
                if ("function" == typeof e) return new e(t)
            } catch (t) {}
            return t
        }(f)), A(n, th, h)), c
    }

    function tB(t) {
        let e = {
            isStandalone: (t.experimental || {}).standalone,
            ...t
        };
        if (t.startTime) {
            let n = {
                ...e
            };
            return n.startTimestamp = tx(t.startTime), delete n.startTime, n
        }
        return e
    }

    function tG() {
        return q(a())
    }

    function tJ(t, e, n) {
        var r, i;
        let s = Z(),
            a = (null == s ? void 0 : s.getOptions()) || {},
            {
                name: o = ""
            } = t,
            c = {
                spanAttributes: {
                    ...t.attributes
                },
                spanName: o,
                parentSampled: n
            };
        null == s || s.emit("beforeSampling", c, {
            decision: !1
        });
        let l = null != (r = c.parentSampled) ? r : n,
            p = c.spanAttributes,
            d = e.getPropagationContext(),
            h = tz(e),
            [_, f, m] = h ? [!1] : function(t, e, n) {
                let r, i;
                if (!tc(t)) return [!1];
                "function" == typeof t.tracesSampler ? (r = t.tracesSampler({
                    ...e,
                    inheritOrSampleWith: t => "number" == typeof e.parentSampleRate ? e.parentSampleRate : "boolean" == typeof e.parentSampled ? Number(e.parentSampled) : t
                }), i = !0) : void 0 !== e.parentSampled ? r = e.parentSampled : void 0 !== t.tracesSampleRate && (r = t.tracesSampleRate, i = !0);
                let s = td(r);
                if (void 0 === s) return u && T.warn("[Tracing] Discarding root span because of invalid sample rate. Sample rate must be a boolean or a number between 0 and 1. Got ".concat(JSON.stringify(r), " of type ").concat(JSON.stringify(typeof r), ".")), [!1];
                if (!s) return u && T.log("[Tracing] Discarding transaction because ".concat("function" == typeof t.tracesSampler ? "tracesSampler returned 0 or false" : "a negative sampling decision was inherited or tracesSampleRate is set to 0")), [!1, s, i];
                let a = n < s;
                return !a && u && T.log("[Tracing] Discarding transaction because it's not included in the random sample (sampling rate = ".concat(Number(r), ")")), [a, s, i]
            }(a, {
                name: o,
                parentSampled: l,
                attributes: p,
                parentSampleRate: td(null == (i = d.dsc) ? void 0 : i.sample_rate)
            }, d.sampleRand),
            g = new tL({
                ...t,
                attributes: {
                    [tt]: "custom",
                    [te]: void 0 !== f && m ? f : void 0,
                    ...p
                },
                sampled: _
            });
        return _ || !s || h || (u && T.log("[Tracing] Discarding root span because its trace was not chosen to be sampled."), s.recordDroppedEvent("sample_rate", tp(s) ? "span" : "transaction")), s && s.emit("spanStart", g), g
    }

    function tK(t, e) {
        if (e) return e;
        if (null === e) return;
        let n = t[M];
        if (!n) return;
        let r = Z();
        return (r ? r.getOptions() : {}).parentSpanIsAlwaysRootSpan ? tD(n) : n
    }

    function tW(t) {
        return void 0 !== t ? e => tF(t, e) : t => t()
    }

    function tV(t) {
        return t instanceof tP && "ignored" === t.dropReason
    }

    function tz(t) {
        return !0 === t.getScopeData().sdkProcessingMetadata.__SENTRY_SUPPRESS_TRACING__
    }
    t.s(["startInactiveSpan", 0, function(t) {
        let e = tG();
        if (e.startInactiveSpan) return e.startInactiveSpan(t);
        let n = tB(t),
            {
                forceTransaction: r,
                parentSpan: i
            } = t;
        return (t.scope ? e => X(t.scope, e) : void 0 !== i ? t => tF(i, t) : t => t())(() => {
            let e = $(),
                s = tK(e, i),
                a = Z();
            return t.onlyIfParent && !s ? (null == a || a.recordDroppedEvent("no_parent_span", "span"), new tP) : tY({
                parentSpan: s,
                spanArguments: n,
                forceTransaction: r,
                scope: e
            })
        })
    }, "startNewTrace", 0, function(t) {
        let e = tG();
        return e.startNewTrace ? e.startNewTrace(t) : X(e => (e.setPropagationContext({
            traceId: O(),
            sampleRand: D()
        }), u && T.log("Starting a new trace with id ".concat(e.getPropagationContext().traceId)), tF(null, t)))
    }, "startSpan", 0, function(t, e) {
        let n = tG();
        if (n.startSpan) return n.startSpan(t, e);
        let r = tB(t),
            {
                forceTransaction: i,
                parentSpan: s,
                scope: a
            } = t;
        return X(null == a ? void 0 : a.clone(), () => tW(s)(() => {
            let n = $(),
                a = tK(n, s),
                o = Z(),
                c = t.onlyIfParent && !a,
                u = c ? new tP : tY({
                    parentSpan: a,
                    spanArguments: r,
                    forceTransaction: i,
                    scope: n
                });
            return c && (null == o || o.recordDroppedEvent("no_parent_span", "span")), tV(u) && a || U(n, u), to(() => e(u), () => {
                let {
                    status: t
                } = tw(u);
                u.isRecording() && (!t || "ok" === t) && u.setStatus({
                    code: 2,
                    message: "internal_error"
                })
            }, () => {
                u.end()
            })
        }))
    }, "startSpanManual", 0, function(t, e) {
        let n = tG();
        if (n.startSpanManual) return n.startSpanManual(t, e);
        let r = tB(t),
            {
                forceTransaction: i,
                parentSpan: s,
                scope: a
            } = t;
        return X(null == a ? void 0 : a.clone(), () => tW(s)(() => {
            let n = $(),
                a = tK(n, s),
                o = t.onlyIfParent && !a,
                c = o ? new tP : tY({
                    parentSpan: a,
                    spanArguments: r,
                    forceTransaction: i,
                    scope: n
                });
            if (o) {
                var u;
                null == (u = Z()) || u.recordDroppedEvent("no_parent_span", "span")
            }
            return tV(c) && a || U(n, c), to(() => e(c, () => c.end()), () => {
                let {
                    status: t
                } = tw(c);
                c.isRecording() && (!t || "ok" === t) && c.setStatus({
                    code: 2,
                    message: "internal_error"
                })
            })
        }))
    }], 359335);
    let tH = ["user", "level", "extra", "contexts", "tags", "fingerprint", "propagationContext"];
    t.s(["captureException", 0, function(t, e) {
        return $().captureException(t, function(t) {
            if (t) {
                var e;
                return (e = t) instanceof F || "function" == typeof e || Object.keys(t).some(t => tH.includes(t)) ? {
                    captureContext: t
                } : t
            }
        }(e))
    }, "captureMessage", 0, function(t, e) {
        let n = "string" == typeof e ? e : void 0,
            r = "string" != typeof e ? {
                captureContext: e
            } : void 0;
        return $().captureMessage(t, n, r)
    }, "lastEventId", 0, function() {
        return Q().lastEventId()
    }, "setTag", 0, function(t, e) {
        Q().setTag(t, e)
    }], 80768)
}]);

//# debugId=5ce1f4c1-da28-7a0d-0af9-bd0d304c4d54
//# sourceMappingURL=2bufc6byswb5s.js.map