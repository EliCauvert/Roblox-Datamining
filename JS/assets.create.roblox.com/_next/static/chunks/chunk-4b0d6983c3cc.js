;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "94ad8eb9-c95f-a00a-4ecb-075fb2797852")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 80768, 489427, 379705, 350941, 600496, 728441, 823979, 230242, 127229, t => {
    "use strict";
    let e, n, r, i = "10.53.1",
        s = globalThis;

    function o() {
        return a(s), s
    }

    function a(t) {
        let e = t.__SENTRY__ = t.__SENTRY__ || {};
        return e.version = e.version || i, e[i] = e[i] || {}
    }

    function c(t, e) {
        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : s,
            r = n.__SENTRY__ = n.__SENTRY__ || {},
            o = r[i] = r[i] || {};
        return o[t] || (o[t] = e())
    }
    t.s(["GLOBAL_OBJ", 0, s], 489427);
    let u = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__,
        l = Object.prototype.toString;

    function h(t) {
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

    function p(t, e) {
        return l.call(t) === "[object ".concat(e, "]")
    }

    function _(t) {
        return p(t, "String")
    }

    function d(t) {
        return p(t, "Object")
    }

    function f(t) {
        return "u" > typeof Event && v(t, Event)
    }

    function g(t) {
        return "u" > typeof Element && v(t, Element)
    }

    function m(t) {
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
                o = 0,
                a = 0,
                c = Array.isArray(e) ? e : e.keyAttrs,
                u = !Array.isArray(e) && e.maxStringLength || 80;
            for (; r && o++ < 5 && (n = function(t, e) {
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
                        if (e && _(e))
                            for (let t of e.split(/\s+/)) n.push(".".concat(t))
                    }
                    for (let e of ["aria-label", "type", "name", "title", "alt"]) {
                        let r = t.getAttribute(e);
                        r && n.push("[".concat(e, '="').concat(r, '"]'))
                    }
                    return n.join("")
                }(r, c), "html" !== n && (!(o > 1) || !(a + 3 * i.length + n.length >= u)));) i.push(n), a += n.length, r = r.parentNode;
            return i.reverse().join(" > ")
        } catch (t) {
            return "<unknown>"
        }
    }
    t.s(["isElement", 0, g, "isError", 0, h, "isEvent", 0, f, "isInstanceOf", 0, v, "isPlainObject", 0, d, "isPrimitive", 0, function(t) {
        return null === t || "object" == typeof t && null !== t && "__sentry_template_string__" in t && "__sentry_template_values__" in t || "object" != typeof t && "function" != typeof t
    }, "isRegExp", 0, function(t) {
        return p(t, "RegExp")
    }, "isString", 0, _, "isSyntheticEvent", 0, function(t) {
        return d(t) && "nativeEvent" in t && "preventDefault" in t && "stopPropagation" in t
    }, "isThenable", 0, m, "isVueViewModel", 0, function(t) {
        return !!("object" == typeof t && null !== t && (t.__isVue || t._isVue || t.__v_isVNode))
    }], 379705), t.s(["getLocationHref", 0, function() {
        try {
            return s.document.location.href
        } catch (t) {
            return ""
        }
    }, "htmlTreeAsString", 0, y], 350941);
    let b = {};

    function S(t) {
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
        return I().enabled
    }

    function E(t) {
        for (var e = arguments.length, n = Array(e > 1 ? e - 1 : 0), r = 1; r < e; r++) n[r - 1] = arguments[r];
        u && x() && S(() => {
            s.console[t]("".concat("Sentry Logger ", "[").concat(t, "]:"), ...n)
        })
    }

    function I() {
        return u ? c("loggerSettings", () => ({
            enabled: !1
        })) : {
            enabled: !1
        }
    }
    let w = {
        enable: function() {
            I().enabled = !0
        },
        disable: function() {
            I().enabled = !1
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
            u && w.log('Failed to add non-enumerable property "'.concat(String(e), '" to object'), t)
        }
    }

    function L(t) {
        try {
            return g(t) ? y(t) : Object.prototype.toString.call(t)
        } catch (t) {
            return "<unknown>"
        }
    }

    function j(t) {
        return "object" == typeof t && null !== t ? Object.fromEntries(Object.entries(t)) : {}
    }

    function C(t) {
        if (void 0 !== e) return e ? e(t) : t();
        let n = Symbol.for("__SENTRY_SAFE_RANDOM_ID_WRAPPER__");
        return n in s && "function" == typeof s[n] ? (e = s[n])(t) : (e = null, t())
    }

    function k() {
        return C(() => Math.random())
    }

    function P() {
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : s.crypto || s.msCrypto;
        try {
            if (null == t ? void 0 : t.randomUUID) return C(() => t.randomUUID()).replace(/-/g, "")
        } catch (t) {}
        return n || (n = "10000000100040008000100000000000"), n.replace(/[018]/g, t => (t ^ (15 & 16 * k()) >> t / 4).toString(16))
    }

    function T() {
        return C(() => Date.now()) / 1e3
    }
    t.s(["consoleSandbox", 0, S, "debug", 0, w], 600496), t.s(["addNonEnumerableProperty", 0, A, "convertToPlainObject", 0, function(t) {
        if (h(t)) return {
            message: t.message,
            name: t.name,
            stack: t.stack,
            ...j(t)
        };
        if (!f(t)) return t;
        {
            let e = {
                type: t.type,
                target: L(t.target),
                currentTarget: L(t.currentTarget),
                ...j(t)
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
    }, "uuid4", 0, P], 823979);
    let N = "_sentrySpan";

    function O(t, e) {
        e ? A(t, N, e) : delete t[N]
    }
    class D {
        clone() {
            let t = new D;
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
            }, t._client = this._client, t._lastEventId = this._lastEventId, t._conversationId = this._conversationId, O(t, this[N]), t
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
                if (e.user && (!t.ipAddress && e.user.ip_address && (t.ipAddress = e.user.ip_address), t.did || e.did || (t.did = e.user.id || e.user.email || e.user.username)), t.timestamp = e.timestamp || (null != r ? r : r = function() {
                        let {
                            performance: t
                        } = s;
                        if (!(null == t ? void 0 : t.now) || !t.timeOrigin) return T;
                        let e = t.timeOrigin;
                        return () => (e + C(() => t.now())) / 1e3
                    }())(), e.abnormal_mechanism && (t.abnormal_mechanism = e.abnormal_mechanism), e.ignoreDuration && (t.ignoreDuration = e.ignoreDuration), e.sid && (t.sid = 32 === e.sid.length ? e.sid : P()), void 0 !== e.init && (t.init = e.init), !t.did && e.did && (t.did = "".concat(e.did)), "number" == typeof e.started && (t.started = e.started), t.ignoreDuration) t.duration = void 0;
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
                    contexts: o,
                    level: a,
                    fingerprint: c = [],
                    propagationContext: u,
                    conversationId: l
                } = (e instanceof D ? e.getScopeData() : d(e) ? t : void 0) || {};
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
                ...o
            }, s && Object.keys(s).length && (this._user = s), a && (this._level = a), c.length && (this._fingerprint = c), u && (this._propagationContext = u), l && (this._conversationId = l), this
        }
        clear() {
            return this._breadcrumbs = [], this._tags = {}, this._attributes = {}, this._extra = {}, this._user = {}, this._contexts = {}, this._level = void 0, this._transactionName = void 0, this._fingerprint = void 0, this._session = void 0, this._conversationId = void 0, O(this, void 0), this._attachments = [], this.setPropagationContext({
                traceId: P(),
                sampleRand: k()
            }), this._notifyScopeListeners(), this
        }
        addBreadcrumb(t, e) {
            let n = "number" == typeof e ? e : 100;
            if (n <= 0) return this;
            let r = {
                timestamp: T(),
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
                span: this[N],
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
            let n = (null == e ? void 0 : e.event_id) || P();
            if (!this._client) return u && w.warn("No client configured on scope - will not capture exception!"), n;
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
            let i = (null == n ? void 0 : n.event_id) || P();
            if (!this._client) return u && w.warn("No client configured on scope - will not capture message!"), i;
            let s = null != (r = null == n ? void 0 : n.syntheticException) ? r : Error(t);
            return this._client.captureMessage(t, e, {
                originalException: t,
                syntheticException: s,
                ...n,
                event_id: i
            }, this), i
        }
        captureEvent(t, e) {
            let n = t.event_id || (null == e ? void 0 : e.event_id) || P();
            return this._client ? this._client.captureEvent(t, {
                ...e,
                event_id: n
            }, this) : u && w.warn("No client configured on scope - will not capture event!"), n
        }
        _notifyScopeListeners() {
            this._notifyingListeners || (this._notifyingListeners = !0, this._scopeListeners.forEach(t => {
                t(this)
            }), this._notifyingListeners = !1)
        }
        constructor() {
            this._notifyingListeners = !1, this._scopeListeners = [], this._eventProcessors = [], this._breadcrumbs = [], this._attachments = [], this._user = {}, this._tags = {}, this._attributes = {}, this._extra = {}, this._contexts = {}, this._sdkProcessingMetadata = {}, this._propagationContext = {
                traceId: P(),
                sampleRand: k()
            }
        }
    }
    let M = t => t instanceof Promise && !t[R],
        R = Symbol("chained PromiseLike");
    class U {
        withScope(t) {
            let e, n = this._pushScope();
            try {
                e = t(n)
            } catch (t) {
                throw this._popScope(), t
            }
            if (m(e)) {
                var r, i, s;
                let t;
                return r = e, i = () => this._popScope(), s = () => this._popScope(), M(t = r.then(t => (i(), t), t => {
                    throw s(), t
                })) && M(r) ? t : ((t, e) => {
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
                        [R]: !0
                    }), e
                })(r, t)
            }
            return this._popScope(), e
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
            n = t || new D, r = e || new D, this._stack = [{
                scope: n
            }], this._isolationScope = r
        }
    }

    function B() {
        let t = a(o());
        return t.stack = t.stack || new U(c("defaultCurrentScope", () => new D), c("defaultIsolationScope", () => new D))
    }

    function Y(t) {
        return B().withScope(t)
    }

    function F(t, e) {
        let n = B();
        return n.withScope(() => (n.getStackTop().scope = t, e(t)))
    }

    function K(t) {
        return B().withScope(() => t(B().getIsolationScope()))
    }

    function V(t) {
        let e = a(t);
        return e.acs ? e.acs : {
            withIsolationScope: K,
            withScope: Y,
            withSetScope: F,
            withSetIsolationScope: (t, e) => K(e),
            getCurrentScope: () => B().getScope(),
            getIsolationScope: () => B().getIsolationScope()
        }
    }

    function G() {
        return V(o()).getCurrentScope()
    }

    function H() {
        return V(o()).getIsolationScope()
    }
    t.s(["getClient", 0, function() {
        return G().getClient()
    }, "getCurrentScope", 0, G, "getGlobalScope", 0, function() {
        return c("globalScope", () => new D)
    }, "getIsolationScope", 0, H, "withIsolationScope", 0, function() {
        for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
        let r = V(o());
        if (2 === e.length) {
            let [t, n] = e;
            return t ? r.withSetIsolationScope(t, n) : r.withIsolationScope(n)
        }
        return r.withIsolationScope(e[0])
    }, "withScope", 0, function() {
        for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
        let r = V(o());
        if (2 === e.length) {
            let [t, n] = e;
            return t ? r.withSetScope(t, n) : r.withScope(n)
        }
        return r.withScope(e[0])
    }], 230242);
    let W = /^o(\d+)\./,
        z = /^(?:(\w+):)\/\/(?:(\w+)(?::(\w+)?)?@)((?:\[[:.%\w]+\]|[\w.-]+))(?::(\d+))?\/(.+)/;

    function $(t) {
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
    t.s(["dsnToString", 0, function(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            {
                host: n,
                path: r,
                pass: i,
                port: s,
                projectId: o,
                protocol: a,
                publicKey: c
            } = t;
        return "".concat(a, "://").concat(c).concat(e && i ? ":".concat(i) : "") + "@".concat(n).concat(s ? ":".concat(s) : "", "/").concat(r ? "".concat(r, "/") : r).concat(o)
    }, "extractOrgIdFromClient", 0, function(t) {
        let e, n = t.getOptions(),
            {
                host: r
            } = t.getDsn() || {};
        if (n.orgId) e = String(n.orgId);
        else {
            let t;
            r && (e = null == (t = r.match(W)) ? void 0 : t[1])
        }
        return e
    }, "makeDsn", 0, function(t) {
        let e = "string" == typeof t ? function(t) {
            let e = z.exec(t);
            if (!e) return void S(() => {
                console.error("Invalid Sentry Dsn: ".concat(t))
            });
            let [n, r, i = "", s = "", o = "", a = ""] = e.slice(1), c = "", u = a, l = u.split("/");
            if (l.length > 1 && (c = l.slice(0, -1).join("/"), u = l.pop()), u) {
                let t = u.match(/^\d+/);
                t && (u = t[0])
            }
            return $({
                host: s,
                pass: i,
                path: c,
                projectId: u,
                port: o,
                protocol: n,
                publicKey: r
            })
        }(t) : $(t);
        if (e && function(t) {
                if (!u) return !0;
                let {
                    port: e,
                    projectId: n,
                    protocol: r
                } = t;
                return !["protocol", "publicKey", "host", "projectId"].find(e => !t[e] && (w.error("Invalid Sentry Dsn: ".concat(e, " missing")), !0)) && (n.match(/^\d+$/) ? "http" !== r && "https" !== r ? (w.error("Invalid Sentry Dsn: Invalid protocol ".concat(r)), !1) : !(e && isNaN(parseInt(e, 10))) || (w.error("Invalid Sentry Dsn: Invalid port ".concat(e)), !1) : (w.error("Invalid Sentry Dsn: Invalid projectId ".concat(n)), !1))
            }(e)) return e
    }], 127229), RegExp("^[ \\t]*([0-9a-f]{32})?-?([0-9a-f]{16})?-?([01])?[ \\t]*$"), Symbol.for("sentry.skipNormalization"), Symbol.for("sentry.overrideNormalizationDepth");
    let J = ["user", "level", "extra", "contexts", "tags", "fingerprint", "propagationContext"];
    t.s(["captureException", 0, function(t, e) {
        return G().captureException(t, function(t) {
            if (t) {
                var e;
                return (e = t) instanceof D || "function" == typeof e || Object.keys(t).some(t => J.includes(t)) ? {
                    captureContext: t
                } : t
            }
        }(e))
    }, "captureMessage", 0, function(t, e) {
        let n = "string" == typeof e ? e : void 0,
            r = "string" != typeof e ? {
                captureContext: e
            } : void 0;
        return G().captureMessage(t, n, r)
    }, "lastEventId", 0, function() {
        return H().lastEventId()
    }, "setTag", 0, function(t, e) {
        H().setTag(t, e)
    }], 80768)
}]);

//# debugId=94ad8eb9-c95f-a00a-4ecb-075fb2797852
//# sourceMappingURL=2nd37fyh13_is.js.map