;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "c56f2dc6-c361-8e31-9e1e-9d77c29d42a8")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 230242, 489427, 254944, 777246, 379705, 350941, 169533, 728441, 361341, 79752, 163772, 823979, 193218, 220778, 785041, 912583, 619834, 937463, 228515, 688671, t => {
    "use strict";
    let e, n, i, r = "10.53.1",
        s = globalThis;

    function o() {
        return a(s), s
    }

    function a(t) {
        let e = t.__SENTRY__ = t.__SENTRY__ || {};
        return e.version = e.version || r, e[r] = e[r] || {}
    }

    function c(t, e) {
        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : s,
            i = n.__SENTRY__ = n.__SENTRY__ || {},
            o = i[r] = i[r] || {};
        return o[t] || (o[t] = e())
    }
    t.s(["GLOBAL_OBJ", 0, s], 489427), t.s(["getGlobalSingleton", 0, c, "getMainCarrier", 0, o, "getSentryCarrier", 0, a], 254944);
    let u = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;
    t.s(["DEBUG_BUILD", 0, u], 777246);
    let l = Object.prototype.toString;

    function h(t) {
        switch (l.call(t)) {
            case "[object Error]":
            case "[object Exception]":
            case "[object DOMException]":
            case "[object WebAssembly.Exception]":
                return !0;
            default:
                return b(t, Error)
        }
    }

    function _(t, e) {
        return l.call(t) === "[object ".concat(e, "]")
    }

    function p(t) {
        return _(t, "String")
    }

    function d(t) {
        return _(t, "Object")
    }

    function f(t) {
        return "u" > typeof Event && b(t, Event)
    }

    function g(t) {
        return "u" > typeof Element && b(t, Element)
    }

    function m(t) {
        return _(t, "RegExp")
    }

    function v(t) {
        return !!((null == t ? void 0 : t.then) && "function" == typeof t.then)
    }

    function b(t, e) {
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
            let n, i = t,
                r = [],
                o = 0,
                a = 0,
                c = Array.isArray(e) ? e : e.keyAttrs,
                u = !Array.isArray(e) && e.maxStringLength || 80;
            for (; i && o++ < 5 && (n = function(t, e) {
                    let n = [];
                    if (!(null == t ? void 0 : t.tagName)) return "";
                    if (s.HTMLElement && t instanceof HTMLElement && t.dataset) {
                        if (t.dataset.sentryComponent) return t.dataset.sentryComponent;
                        if (t.dataset.sentryElement) return t.dataset.sentryElement
                    }
                    n.push(t.tagName.toLowerCase());
                    let i = (null == e ? void 0 : e.length) ? e.filter(e => t.getAttribute(e)).map(e => [e, t.getAttribute(e)]) : null;
                    if (null == i ? void 0 : i.length) i.forEach(t => {
                        n.push("[".concat(t[0], '="').concat(t[1], '"]'))
                    });
                    else {
                        t.id && n.push("#".concat(t.id));
                        let e = t.className;
                        if (e && p(e))
                            for (let t of e.split(/\s+/)) n.push(".".concat(t))
                    }
                    for (let e of ["aria-label", "type", "name", "title", "alt"]) {
                        let i = t.getAttribute(e);
                        i && n.push("[".concat(e, '="').concat(i, '"]'))
                    }
                    return n.join("")
                }(i, c), "html" !== n && (!(o > 1) || !(a + 3 * r.length + n.length >= u)));) r.push(n), a += n.length, i = i.parentNode;
            return r.reverse().join(" > ")
        } catch (t) {
            return "<unknown>"
        }
    }
    t.s(["isElement", 0, g, "isError", 0, h, "isEvent", 0, f, "isInstanceOf", 0, b, "isPlainObject", 0, d, "isPrimitive", 0, function(t) {
        return null === t || "object" == typeof t && null !== t && "__sentry_template_string__" in t && "__sentry_template_values__" in t || "object" != typeof t && "function" != typeof t
    }, "isRegExp", 0, m, "isString", 0, p, "isSyntheticEvent", 0, function(t) {
        return d(t) && "nativeEvent" in t && "preventDefault" in t && "stopPropagation" in t
    }, "isThenable", 0, v, "isVueViewModel", 0, function(t) {
        return !!("object" == typeof t && null !== t && (t.__isVue || t._isVue || t.__v_isVNode))
    }], 379705), t.s(["getLocationHref", 0, function() {
        try {
            return s.document.location.href
        } catch (t) {
            return ""
        }
    }, "htmlTreeAsString", 0, y], 350941);
    let S = {};

    function x(t) {
        if (!("console" in s)) return t();
        let e = s.console,
            n = {},
            i = Object.keys(S);
        i.forEach(t => {
            let i = S[t];
            n[t] = e[t], e[t] = i
        });
        try {
            return t()
        } finally {
            i.forEach(t => {
                e[t] = n[t]
            })
        }
    }

    function E() {
        return A().enabled
    }

    function w(t) {
        for (var e = arguments.length, n = Array(e > 1 ? e - 1 : 0), i = 1; i < e; i++) n[i - 1] = arguments[i];
        u && E() && x(() => {
            s.console[t]("".concat("Sentry Logger ", "[").concat(t, "]:"), ...n)
        })
    }

    function A() {
        return u ? c("loggerSettings", () => ({
            enabled: !1
        })) : {
            enabled: !1
        }
    }
    let I = {
        enable: function() {
            A().enabled = !0
        },
        disable: function() {
            A().enabled = !1
        },
        isEnabled: E,
        log: function() {
            for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
            w("log", ...e)
        },
        warn: function() {
            for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
            w("warn", ...e)
        },
        error: function() {
            for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
            w("error", ...e)
        }
    };

    function L(t, e, n) {
        try {
            Object.defineProperty(t, e, {
                value: n,
                writable: !0,
                configurable: !0
            })
        } catch (n) {
            u && I.log('Failed to add non-enumerable property "'.concat(String(e), '" to object'), t)
        }
    }

    function C(t) {
        try {
            return g(t) ? y(t) : Object.prototype.toString.call(t)
        } catch (t) {
            return "<unknown>"
        }
    }

    function k(t) {
        return "object" == typeof t && null !== t ? Object.fromEntries(Object.entries(t)) : {}
    }

    function P(t) {
        if (void 0 !== e) return e ? e(t) : t();
        let n = Symbol.for("__SENTRY_SAFE_RANDOM_ID_WRAPPER__");
        return n in s && "function" == typeof s[n] ? (e = s[n])(t) : (e = null, t())
    }

    function N() {
        return P(() => Math.random())
    }

    function T() {
        return P(() => Date.now())
    }
    t.s(["consoleSandbox", 0, x, "debug", 0, I], 169533), t.s(["addNonEnumerableProperty", 0, L, "convertToPlainObject", 0, function(t) {
        if (h(t)) return {
            message: t.message,
            name: t.name,
            stack: t.stack,
            ...k(t)
        };
        if (!f(t)) return t;
        {
            let e = {
                type: t.type,
                target: C(t.target),
                currentTarget: C(t.currentTarget),
                ...k(t)
            };
            return "u" > typeof CustomEvent && b(t, CustomEvent) && (e.detail = t.detail), e
        }
    }, "getOriginalFunction", 0, function(t) {
        return t.__sentry_original__
    }, "markFunctionWrapped", 0, function(t, e) {
        try {
            let n = e.prototype || {};
            t.prototype = e.prototype = n, L(t, "__sentry_original__", e)
        } catch (t) {}
    }], 728441), t.s(["safeDateNow", 0, T, "safeMathRandom", 0, N, "withRandomSafeContext", 0, P], 361341);
    let j = "<anonymous>";

    function O(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
        return "string" != typeof t || 0 === e || t.length <= e ? t : "".concat(t.slice(0, e), "...")
    }

    function M() {
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : s.crypto || s.msCrypto;
        try {
            if (null == t ? void 0 : t.randomUUID) return P(() => t.randomUUID()).replace(/-/g, "")
        } catch (t) {}
        return n || (n = "10000000100040008000100000000000"), n.replace(/[018]/g, t => (t ^ (15 & 16 * N()) >> t / 4).toString(16))
    }

    function D() {
        return T() / 1e3
    }

    function R() {
        return (null != i ? i : i = function() {
            let {
                performance: t
            } = s;
            if (!(null == t ? void 0 : t.now) || !t.timeOrigin) return D;
            let e = t.timeOrigin;
            return () => (e + P(() => t.now())) / 1e3
        }())()
    }

    function V(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        if (e.user && (!t.ipAddress && e.user.ip_address && (t.ipAddress = e.user.ip_address), t.did || e.did || (t.did = e.user.id || e.user.email || e.user.username)), t.timestamp = e.timestamp || R(), e.abnormal_mechanism && (t.abnormal_mechanism = e.abnormal_mechanism), e.ignoreDuration && (t.ignoreDuration = e.ignoreDuration), e.sid && (t.sid = 32 === e.sid.length ? e.sid : M()), void 0 !== e.init && (t.init = e.init), !t.did && e.did && (t.did = "".concat(e.did)), "number" == typeof e.started && (t.started = e.started), t.ignoreDuration) t.duration = void 0;
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
        let i = {
            ...t
        };
        for (let t in e) Object.prototype.hasOwnProperty.call(e, t) && (i[t] = U(i[t], e[t], n - 1));
        return i
    }

    function B() {
        return M()
    }
    t.s(["getFunctionName", 0, function(t) {
        try {
            if (!t || "function" != typeof t) return j;
            return t.name || j
        } catch (t) {
            return j
        }
    }, "getVueInternalName", 0, function(t) {
        return "__v_isVNode" in t && t.__v_isVNode ? "[VueVNode]" : "[VueViewModel]"
    }, "normalizeStackTracePath", 0, function(t) {
        let e = (null == t ? void 0 : t.startsWith("file://")) ? t.slice(7) : t;
        return (null == e ? void 0 : e.match(/\/[A-Z]:/)) && (e = e.slice(1)), e
    }], 79752), t.s(["isMatchingPattern", 0, function(t, e) {
        let n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
        return !!p(t) && (m(e) ? e.test(t) : p(e) ? n ? t === e : t.includes(e) : "function" == typeof e && e(t))
    }, "snipLine", 0, function(t, e) {
        let n = t,
            i = n.length;
        if (i <= 150) return n;
        e > i && (e = i);
        let r = Math.max(e - 60, 0);
        r < 5 && (r = 0);
        let s = Math.min(r + 140, i);
        return s > i - 5 && (s = i), s === i && (r = Math.max(s - 140, 0)), n = n.slice(r, s), r > 0 && (n = "'{snip} ".concat(n)), s < i && (n += " {snip}"), n
    }, "truncate", 0, O], 163772), t.s(["addExceptionMechanism", 0, function(t, e) {
        var n, i;
        let r = null == (i = t.exception) || null == (n = i.values) ? void 0 : n[0];
        if (!r) return;
        let s = r.mechanism;
        if (r.mechanism = {
                type: "generic",
                handled: !0,
                ...s,
                ...e
            }, e && "data" in e) {
            let t = {
                ...null == s ? void 0 : s.data,
                ...e.data
            };
            r.mechanism.data = t
        }
    }, "addExceptionTypeValue", 0, function(t, e, n) {
        let i = t.exception = t.exception || {},
            r = i.values = i.values || [],
            s = r[0] = r[0] || {};
        s.value || (s.value = e || ""), s.type || (s.type = n || "Error")
    }, "uuid4", 0, M], 823979), t.s(["dateTimestampInSeconds", 0, D, "timestampInSeconds", 0, R], 193218), t.s(["closeSession", 0, function(t, e) {
        let n = {};
        e ? n = {
            status: e
        } : "ok" === t.status && (n = {
            status: "exited"
        }), V(t, n)
    }, "makeSession", 0, function(t) {
        let e = R(),
            n = {
                sid: M(),
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
        return t && V(n, t), n
    }, "updateSession", 0, V], 220778), t.s(["merge", 0, U], 785041), t.s(["generateSpanId", 0, function() {
        return M().substring(16)
    }, "generateTraceId", 0, B], 912583);
    let F = "_sentrySpan";

    function Y(t, e) {
        e ? L(t, F, e) : delete t[F]
    }

    function G(t) {
        return t[F]
    }
    t.s(["_getSpanForScope", 0, G, "_setSpanForScope", 0, Y], 619834);
    class W {
        clone() {
            let t = new W;
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
            }, t._client = this._client, t._lastEventId = this._lastEventId, t._conversationId = this._conversationId, Y(t, G(this)), t
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
            }, this._session && V(this._session, {
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
                    attributes: i,
                    extra: r,
                    user: s,
                    contexts: o,
                    level: a,
                    fingerprint: c = [],
                    propagationContext: u,
                    conversationId: l
                } = (e instanceof W ? e.getScopeData() : d(e) ? t : void 0) || {};
            return this._tags = {
                ...this._tags,
                ...n
            }, this._attributes = {
                ...this._attributes,
                ...i
            }, this._extra = {
                ...this._extra,
                ...r
            }, this._contexts = {
                ...this._contexts,
                ...o
            }, s && Object.keys(s).length && (this._user = s), a && (this._level = a), c.length && (this._fingerprint = c), u && (this._propagationContext = u), l && (this._conversationId = l), this
        }
        clear() {
            return this._breadcrumbs = [], this._tags = {}, this._attributes = {}, this._extra = {}, this._user = {}, this._contexts = {}, this._level = void 0, this._transactionName = void 0, this._fingerprint = void 0, this._session = void 0, this._conversationId = void 0, Y(this, void 0), this._attachments = [], this.setPropagationContext({
                traceId: B(),
                sampleRand: N()
            }), this._notifyScopeListeners(), this
        }
        addBreadcrumb(t, e) {
            let n = "number" == typeof e ? e : 100;
            if (n <= 0) return this;
            let i = {
                timestamp: D(),
                ...t,
                message: t.message ? O(t.message, 2048) : t.message
            };
            if (this._breadcrumbs.push(i), this._breadcrumbs.length > n) {
                var r;
                this._breadcrumbs = this._breadcrumbs.slice(-n), null == (r = this._client) || r.recordDroppedEvent("buffer_overflow", "log_item")
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
            let n = (null == e ? void 0 : e.event_id) || M();
            if (!this._client) return u && I.warn("No client configured on scope - will not capture exception!"), n;
            let i = Error("Sentry syntheticException");
            return this._client.captureException(t, {
                originalException: t,
                syntheticException: i,
                ...e,
                event_id: n
            }, this), n
        }
        captureMessage(t, e, n) {
            var i;
            let r = (null == n ? void 0 : n.event_id) || M();
            if (!this._client) return u && I.warn("No client configured on scope - will not capture message!"), r;
            let s = null != (i = null == n ? void 0 : n.syntheticException) ? i : Error(t);
            return this._client.captureMessage(t, e, {
                originalException: t,
                syntheticException: s,
                ...n,
                event_id: r
            }, this), r
        }
        captureEvent(t, e) {
            let n = t.event_id || (null == e ? void 0 : e.event_id) || M();
            return this._client ? this._client.captureEvent(t, {
                ...e,
                event_id: n
            }, this) : u && I.warn("No client configured on scope - will not capture event!"), n
        }
        _notifyScopeListeners() {
            this._notifyingListeners || (this._notifyingListeners = !0, this._scopeListeners.forEach(t => {
                t(this)
            }), this._notifyingListeners = !1)
        }
        constructor() {
            this._notifyingListeners = !1, this._scopeListeners = [], this._eventProcessors = [], this._breadcrumbs = [], this._attachments = [], this._user = {}, this._tags = {}, this._attributes = {}, this._extra = {}, this._contexts = {}, this._sdkProcessingMetadata = {}, this._propagationContext = {
                traceId: B(),
                sampleRand: N()
            }
        }
    }
    t.s(["Scope", 0, W], 937463);
    let H = t => t instanceof Promise && !t[K],
        K = Symbol("chained PromiseLike"),
        J = (t, e, n) => {
            let i = t.then(t => (e(t), t), t => {
                throw n(t), t
            });
            return H(i) && H(t) ? i : z(t, i)
        },
        z = (t, e) => {
            if (!e) return t;
            let n = !1;
            for (let i in t) {
                if (i in e) continue;
                n = !0;
                let r = t[i];
                "function" == typeof r ? Object.defineProperty(e, i, {
                    value: function() {
                        for (var e = arguments.length, n = Array(e), i = 0; i < e; i++) n[i] = arguments[i];
                        return r.apply(t, n)
                    },
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[i] = r
            }
            return n && Object.assign(e, {
                [K]: !0
            }), e
        };
    t.s(["chainAndCopyPromiseLike", 0, J], 228515);
    class Z {
        withScope(t) {
            let e, n = this._pushScope();
            try {
                e = t(n)
            } catch (t) {
                throw this._popScope(), t
            }
            return v(e) ? J(e, () => this._popScope(), () => this._popScope()) : (this._popScope(), e)
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
            let n, i;
            n = t || new W, i = e || new W, this._stack = [{
                scope: n
            }], this._isolationScope = i
        }
    }

    function q() {
        let t = a(o());
        return t.stack = t.stack || new Z(c("defaultCurrentScope", () => new W), c("defaultIsolationScope", () => new W))
    }

    function Q(t) {
        return q().withScope(t)
    }

    function X(t, e) {
        let n = q();
        return n.withScope(() => (n.getStackTop().scope = t, e(t)))
    }

    function $(t) {
        return q().withScope(() => t(q().getIsolationScope()))
    }

    function tt(t) {
        let e = a(t);
        return e.acs ? e.acs : {
            withIsolationScope: $,
            withScope: Q,
            withSetScope: X,
            withSetIsolationScope: (t, e) => $(e),
            getCurrentScope: () => q().getScope(),
            getIsolationScope: () => q().getIsolationScope()
        }
    }

    function te() {
        return tt(o()).getCurrentScope()
    }
    t.s(["getAsyncContextStrategy", 0, tt], 688671), t.s(["getClient", 0, function() {
        return te().getClient()
    }, "getCurrentScope", 0, te, "getGlobalScope", 0, function() {
        return c("globalScope", () => new W)
    }, "getIsolationScope", 0, function() {
        return tt(o()).getIsolationScope()
    }, "withIsolationScope", 0, function() {
        for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
        let i = tt(o());
        if (2 === e.length) {
            let [t, n] = e;
            return t ? i.withSetIsolationScope(t, n) : i.withIsolationScope(n)
        }
        return i.withIsolationScope(e[0])
    }, "withScope", 0, function() {
        for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
        let i = tt(o());
        if (2 === e.length) {
            let [t, n] = e;
            return t ? i.withSetScope(t, n) : i.withScope(n)
        }
        return i.withScope(e[0])
    }], 230242)
}]);

//# debugId=c56f2dc6-c361-8e31-9e1e-9d77c29d42a8
//# sourceMappingURL=3qjj-qfwtke_q.js.map