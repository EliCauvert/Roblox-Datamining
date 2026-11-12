;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "b1b7e888-3298-f8dc-f772-6fe11eb49fa8")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 597737, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "BailoutToCSR", {
        enumerable: !0,
        get: function() {
            return o
        }
    });
    let r = e.r(397204);

    function o(e) {
        let {
            reason: t,
            children: n
        } = e;
        if ("u" < typeof window) throw Object.defineProperty(new r.BailoutToCSRError(t), "__NEXT_ERROR_CODE", {
            value: "E394",
            enumerable: !1,
            configurable: !0
        });
        return n
    }
}, 936549, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "PreloadChunks", {
        enumerable: !0,
        get: function() {
            return s
        }
    });
    let r = e.r(19836),
        o = e.r(301775),
        l = e.r(14419),
        a = e.r(245770),
        i = e.r(330903);

    function s(e) {
        let {
            moduleIds: t
        } = e;
        if ("u" > typeof window) return null;
        let n = l.workAsyncStorage.getStore();
        if (void 0 === n) return null;
        let s = [];
        if (n.reactLoadableManifest && t) {
            let e = n.reactLoadableManifest;
            for (let n of t) {
                if (!e[n]) continue;
                let t = e[n].files;
                s.push(...t)
            }
        }
        if (0 === s.length) return null;
        let u = (0, i.getAssetTokenQuery)();
        return (0, r.jsx)(r.Fragment, {
            children: s.map(e => {
                let t = `${n.assetPrefix}/_next/${(0,a.encodeURIPath)(e)}${u}`;
                return e.endsWith(".css") ? (0, r.jsx)("link", {
                    precedence: "dynamic",
                    href: t,
                    rel: "stylesheet",
                    as: "style",
                    nonce: n.nonce
                }, e) : ((0, o.preload)(t, {
                    as: "script",
                    fetchPriority: "low",
                    nonce: n.nonce
                }), null)
            })
        })
    }
}, 733015, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "default", {
        enumerable: !0,
        get: function() {
            return u
        }
    });
    let r = e.r(19836),
        o = e.r(420482),
        l = e.r(597737),
        a = e.r(936549);

    function i(e) {
        return {
            default: e && "default" in e ? e.default : e
        }
    }
    let s = {
            loader: () => Promise.resolve(i(() => null)),
            loading: null,
            ssr: !0
        },
        u = function(e) {
            let t = {
                    ...s,
                    ...e
                },
                n = (0, o.lazy)(() => t.loader().then(i)),
                u = t.loading;

            function c(e) {
                let i = u ? (0, r.jsx)(u, {
                        isLoading: !0,
                        pastDelay: !0,
                        error: null
                    }) : null,
                    s = !t.ssr || !!t.loading,
                    c = s ? o.Suspense : o.Fragment,
                    d = t.ssr ? (0, r.jsxs)(r.Fragment, {
                        children: ["u" < typeof window ? (0, r.jsx)(a.PreloadChunks, {
                            moduleIds: t.modules
                        }) : null, (0, r.jsx)(n, {
                            ...e
                        })]
                    }) : (0, r.jsx)(l.BailoutToCSR, {
                        reason: "next/dynamic",
                        children: (0, r.jsx)(n, {
                            ...e
                        })
                    });
                return (0, r.jsx)(c, {
                    ...s ? {
                        fallback: i
                    } : {},
                    children: d
                })
            }
            return c.displayName = "LoadableComponent", c
        }
}, 750341, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "default", {
        enumerable: !0,
        get: function() {
            return o
        }
    });
    let r = e.r(481258)._(e.r(733015));

    function o(e, t) {
        let n = {};
        "function" == typeof e && (n.loader = e);
        let o = {
            ...n,
            ...t
        };
        return (0, r.default)({
            ...o,
            modules: o.loadableGenerated?.modules
        })
    }("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 679025, e => {
    "use strict";
    var t = e.i(695524),
        n = e.i(420546),
        r = e.i(285586),
        o = e.i(828873),
        l = e.i(563969),
        a = e.i(865607);
    e.s(["showReportDialog", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            i = a.WINDOW.document,
            s = i?.head || i?.body;
        if (!s) {
            l.DEBUG_BUILD && t.debug.error("[showReportDialog] Global document not defined");
            return
        }
        let u = (0, n.getCurrentScope)(),
            c = (0, n.getClient)(),
            d = c?.getDsn();
        if (!d) {
            l.DEBUG_BUILD && t.debug.error("[showReportDialog] DSN not configured");
            return
        }
        let p = {
                ...e,
                user: {
                    ...u.getUser(),
                    ...e.user
                },
                eventId: e.eventId || (0, r.lastEventId)()
            },
            f = a.WINDOW.document.createElement("script");
        f.async = !0, f.crossOrigin = "anonymous", f.src = (0, o.getReportDialogEndpoint)(d, p);
        let {
            onLoad: h,
            onClose: m
        } = p;
        if (h && (f.onload = h), m) {
            let e = t => {
                if ("__sentry_reportdialog_closed__" === t.data) try {
                    m()
                } finally {
                    a.WINDOW.removeEventListener("message", e)
                }
            };
            a.WINDOW.addEventListener("message", e)
        }
        s.appendChild(f)
    }])
}, 302952, e => {
    "use strict";
    let t = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;
    e.s(["DEBUG_BUILD", 0, t])
}, 468512, 793502, e => {
    "use strict";
    var t = e.i(420546),
        n = e.i(285586),
        r = e.i(59172),
        o = e.i(420482);

    function l(e, l, a) {
        let i, {
            componentStack: s
        } = l;
        if (null !== (i = o.version.match(/^([^.]+)/)) && parseInt(i[0]) >= 17 && (0, r.isError)(e) && s) {
            let t, n = Error(e.message);
            n.name = `React ErrorBoundary ${e.name}`, n.stack = s, t = new WeakSet,
                function e(n, r) {
                    if (!t.has(n)) {
                        if (n.cause) return t.add(n), e(n.cause, r);
                        n.cause = r
                    }
                }(e, n)
        }
        return (0, t.withScope)(t => (t.setContext("react", {
            componentStack: s
        }), (0, n.captureException)(e, a)))
    }
    e.s(["captureReactException", 0, l, "reactErrorHandler", 0, function(e) {
        return (t, n) => {
            let r = !!e,
                o = l(t, n, {
                    mechanism: {
                        handled: r,
                        type: "auto.function.react.error_handler"
                    }
                });
            r && e(t, n, o)
        }
    }], 468512);
    let a = {
            childContextTypes: !0,
            contextType: !0,
            contextTypes: !0,
            defaultProps: !0,
            displayName: !0,
            getDefaultProps: !0,
            getDerivedStateFromError: !0,
            getDerivedStateFromProps: !0,
            mixins: !0,
            propTypes: !0,
            type: !0
        },
        i = {
            name: !0,
            length: !0,
            prototype: !0,
            caller: !0,
            callee: !0,
            arguments: !0,
            arity: !0
        },
        s = {
            $$typeof: !0,
            compare: !0,
            defaultProps: !0,
            displayName: !0,
            propTypes: !0,
            type: !0
        },
        u = Symbol.for("react.forward_ref"),
        c = Symbol.for("react.memo"),
        d = {};

    function p(e) {
        if ("object" == typeof e && null !== e && e.$$typeof === c) return s;
        let t = e.$$typeof;
        return t && d[t] || a
    }
    d[u] = {
        $$typeof: !0,
        render: !0,
        defaultProps: !0,
        displayName: !0,
        propTypes: !0
    }, d[c] = s;
    let f = Object.defineProperty.bind(Object),
        h = Object.getOwnPropertyNames.bind(Object),
        m = Object.getOwnPropertySymbols?.bind(Object),
        b = Object.getOwnPropertyDescriptor.bind(Object),
        y = Object.getPrototypeOf.bind(Object),
        g = Object.prototype;
    e.s(["hoistNonReactStatics", 0, function e(t, n, r) {
        if ("string" != typeof n) {
            if (g) {
                let r = y(n);
                r && r !== g && e(t, r)
            }
            let r = h(n);
            m && (r = r.concat(m(n)));
            let o = p(t),
                l = p(n);
            for (let e of r)
                if (!i[e] && !l?.[e] && !o?.[e] && !b(t, e)) {
                    let r = b(n, e);
                    if (r) try {
                        f(t, e, r)
                    } catch (e) {}
                }
        }
        return t
    }], 793502)
}, 432464, e => {
    "use strict";
    var t = e.i(420546),
        n = e.i(679025),
        r = e.i(695524),
        o = e.i(420482),
        l = e.i(302952),
        a = e.i(468512),
        i = e.i(793502);
    let s = {
        componentStack: null,
        error: null,
        eventId: null
    };
    class u extends o.Component {
        componentDidCatch(e, r) {
            let {
                componentStack: o
            } = r, {
                beforeCapture: l,
                onError: i,
                showDialog: s,
                dialogOptions: u
            } = this.props;
            (0, t.withScope)(t => {
                l && l(t, e, o);
                let c = null != this.props.handled ? this.props.handled : !!this.props.fallback,
                    d = (0, a.captureReactException)(e, r, {
                        mechanism: {
                            handled: c,
                            type: "auto.function.react.error_boundary"
                        }
                    });
                i && i(e, o, d), s && (this._lastEventId = d, this._openFallbackReportDialog && (0, n.showReportDialog)({
                    ...u,
                    eventId: d
                })), this.setState({
                    error: e,
                    componentStack: o,
                    eventId: d
                })
            })
        }
        componentDidMount() {
            let {
                onMount: e
            } = this.props;
            e && e()
        }
        componentWillUnmount() {
            let {
                error: e,
                componentStack: t,
                eventId: n
            } = this.state, {
                onUnmount: r
            } = this.props;
            r && (this.state === s ? r(null, null, null) : r(e, t, n)), this._cleanupHook && (this._cleanupHook(), this._cleanupHook = void 0)
        }
        resetErrorBoundary() {
            let {
                onReset: e
            } = this.props, {
                error: t,
                componentStack: n,
                eventId: r
            } = this.state;
            e && e(t, n, r), this.setState(s)
        }
        render() {
            let {
                fallback: e,
                children: t
            } = this.props, n = this.state;
            if (null === n.componentStack) return "function" == typeof t ? t() : t;
            let a = "function" == typeof e ? o.createElement(e, {
                error: n.error,
                componentStack: n.componentStack,
                resetError: () => this.resetErrorBoundary(),
                eventId: n.eventId
            }) : e;
            return o.isValidElement(a) ? a : (e && l.DEBUG_BUILD && r.debug.warn("fallback did not produce a valid ReactElement"), null)
        }
        constructor(e) {
            super(e), this.state = s, this._openFallbackReportDialog = !0;
            const r = (0, t.getClient)();
            r && e.showDialog && (this._openFallbackReportDialog = !1, this._cleanupHook = r.on("afterSendEvent", t => {
                !t.type && this._lastEventId && t.event_id === this._lastEventId && (0, n.showReportDialog)({
                    ...e.dialogOptions,
                    eventId: this._lastEventId
                })
            }))
        }
    }
    e.s(["ErrorBoundary", 0, u, "withErrorBoundary", 0, function(e, t) {
        let n = e.displayName || e.name || "unknown",
            r = o.memo(n => o.createElement(u, {
                ...t
            }, o.createElement(e, {
                ...n
            })));
        return r.displayName = `errorBoundary(${n})`, (0, i.hoistNonReactStatics)(r, e), r
    }])
}, 981498, e => {
    "use strict";
    let t, n = "AppShell",
        r = (t = (0, e.i(942060).createNextJSFireTelemetryCounter)(n), (e, n) => {
            t(e, {
                ...n,
                host: "nextjs"
            })
        });
    e.s(["trackAppShellCounter", 0, r], 981498)
}, 217827, e => {
    "use strict";
    let t, n;
    var r = e.i(420482),
        o = e.i(285586);
    e.i(350223);
    var l = e.i(874296),
        a = e.i(245837),
        i = e.i(646424),
        s = e.i(587541);
    let u = "PresenceBulkNotifications",
        c = l.looseObject({
            Type: l.literal("PresenceChanged"),
            UserId: l.number(),
            SessionStarted: l.unknown(),
            PresenceReport: l.optional(l.unknown())
        }),
        d = l.object({
            userPresences: l.array(l.looseObject({
                userId: l.number()
            }))
        }),
        p = e => {
            document.dispatchEvent(new CustomEvent("Roblox.Presence.Update", {
                detail: e
            }))
        },
        f = async e => {
            let t = s.Url.parse(a.default.presenceApi).getOrThrow().withPath("/v1/presence/users");
            return (await i.post(t, {
                userIds: e
            }, d, {
                credentials: "include"
            })).getOrThrow().userPresences
        };
    var h = e.i(126392),
        m = e.i(889375),
        b = e.i(981498),
        y = e.i(723941);
    let g = l.object({
            NotificationsEndpoint: l.string(),
            MaxConnectionTime: l.string(),
            IsEventPublishingEnabled: l.boolean(),
            IsDisconnectOnSlowConnectionDisabled: l.boolean(),
            IsSignalRClientTransportRestrictionEnabled: l.boolean(),
            IsLocalStorageInRealTimeEnabled: l.boolean(),
            IsDebuggerEnabled: l.string(),
            IsRealtimeWebAnalyticsEnabled: l.boolean(),
            IsRealtimeWebAnalyticsConnectionEventsEnabled: l.boolean(),
            IsRealtimeDurableReplayEnabled: l.boolean(),
            RealtimeMessageDedupeLruCacheSize: l.string(),
            IsRealtimeTailLossPollingEnabled: l.boolean(),
            IsRealtimeTailLossGapDetectionEnabled: l.boolean(),
            RealtimeTailLossPollingBaseIntervalMs: l.string(),
            RealtimeTailLossPollingMaxIntervalMs: l.string(),
            RealtimeTailLossPollingBackoffMultiplier: l.string(),
            RealtimeTailLossPollingRetryMaxAttempts: l.string()
        }),
        v = (e, t, n) => {
            m.eventStreamClientV1.sendEvent(e, t, n)
        },
        E = {
            SendEvent: v,
            SendEventWithTarget: v,
            TargetTypes: {
                WWW: "www"
            }
        },
        S = async () => {
            let n = (() => {
                    if ("u" < typeof document) return null;
                    if (null == t) {
                        let e = document.documentElement.dataset.realtimeSettings;
                        t = {
                            value: null == e ? null : y.deserialize(g, e).getOrNull()
                        }
                    }
                    return t.value
                })(),
                r = (0, h.getCurrentUser)()?.id;
            if (null == n || null == r) return null;
            let {
                default: o
            } = await e.A(860834);
            return o.Init({
                RealTimeSettings: n,
                CurrentUser: {
                    userId: r
                },
                EventStream: E
            }), o.GetClient()
        }, w = () => n ??= S().then(e => (null != e && (0, b.trackAppShellCounter)("RealtimeStart", {
            outcome: "started"
        }), e), e => (n = void 0, (0, o.captureException)(e), (0, b.trackAppShellCounter)("RealtimeStart", {
            outcome: "failed"
        }), null));
    e.s(["getRealtimeClient", 0, w, "startRealtime", 0, () => {
        let e, t = !0;
        return w().then(n => {
            let r, o, l;
            t && null != n && (r = new Map, o = e => {
                let {
                    UserId: t,
                    SessionStarted: n
                } = e;
                if (!r.has(t)) return !0;
                let o = r.get(t);
                return "string" == typeof n && "string" == typeof o ? n > o : "number" == typeof n && "number" == typeof o && n > o
            }, l = e => {
                let t = new Map;
                for (let n of Array.isArray(e) ? e : []) {
                    let e = c.safeParse(n);
                    e.success && t.set(e.data.UserId, e.data)
                }
                let n = new Map,
                    l = [];
                for (let [e, a] of t) null != a.PresenceReport && o(a) ? (n.set(e, a.PresenceReport), r.set(e, a.SessionStarted)) : l.push(e);
                l.length > 0 && f(l).then(e => {
                    for (let t of e) n.set(t.userId, t)
                }).catch(e => {
                    console.error(e)
                }).finally(() => {
                    p(n)
                }), p(n)
            }, n.Subscribe(u, l), e = () => {
                n.Unsubscribe(u, l)
            })
        }), () => {
            t = !1, e?.()
        }
    }, "useRealtimeNamespace", 0, (e, t) => {
        let n = (0, r.useRef)(t);
        (0, r.useEffect)(() => {
            n.current = t
        }), (0, r.useEffect)(() => {
            let t, r = !0,
                o = e => {
                    n.current(e)
                };
            return w().then(n => {
                r && null != n && (n.Subscribe(e, o), t = () => {
                    n.Unsubscribe(e, o)
                })
            }), () => {
                r = !1, t?.()
            }
        }, [e])
    }], 217827)
}, 178595, e => {
    "use strict";
    var t = e.i(420482),
        n = e.i(217827);
    e.s(["default", 0, function() {
        return (0, t.useEffect)(() => (0, n.startRealtime)(), []), null
    }])
}, 206181, e => {
    "use strict";
    var t = e.i(420482),
        n = e.i(645020),
        r = e.i(126392);
    e.i(350223);
    var o = e.i(874296),
        l = e.i(245837),
        a = e.i(357355),
        i = e.i(646424),
        s = e.i(587541);
    let u = ["click", "dblclick", "focus", "hover", "keypress", "mousedown", "mouseenter", "mouseover", "scroll", "touchmove", "touchstart"],
        c = ["blur"],
        d = o.object({
            isEnabled: o.optional(o.boolean()),
            rolloutPercentage: o.optional(o.number()),
            intervalTimeMs: o.optional(o.number())
        }),
        p = () => s.Url.parse(l.default.apiGatewayUrl).getOrThrow(),
        f = async e => {
            let t = await i.get(p().withPath("/guac-v2/v1/bundles/user-heartbeats"), d, {
                credentials: "include"
            });
            if (t.isErr()) return "configFailed";
            let n = t.value;
            return !0 !== n.isEnabled || e % 100 >= (n.rolloutPercentage ?? 0) ? "gatedOff" : n.intervalTimeMs ?? 3e4
        }, h = async () => (await i.postUntyped(p().withPath("/user-heartbeats-api/pulse"), {
            clientSideTimestampEpochMs: Date.now(),
            sessionInfo: {
                sessionId: /sessionid=([a-f0-9-]{36})/.exec(a.document?.cookie ?? "")?.[1] ?? "unknown"
            },
            locationInfo: {
                websiteLocationInfo: {
                    url: a.window?.location.href ?? ""
                }
            }
        }, {
            credentials: "include"
        })).isOk();
    var m = e.i(981498);
    e.s(["default", 0, function() {
        return (0, t.useEffect)(() => {
            var e;
            let t, o, l, i, s, d, p, b, y = (0, r.getCurrentUser)()?.id,
                g = null == y ? null : (0, n.parseInt)(y);
            return null == g ? void 0 : (e = e => {
                (0, m.trackAppShellCounter)("PresenceHeartbeat", {
                    outcome: e
                })
            }, o = !1, l = !1, i = !1, s = 3e4, d = () => {
                l = !0, i = !1, h().then(t => {
                    e?.(t ? "sent" : "failed")
                }), t = setTimeout(() => {
                    i ? d() : l = !1
                }, s)
            }, p = () => {
                l ? i = !0 : d()
            }, b = () => {
                i = !1
            }, f(g).then(t => {
                if (!o) {
                    if ("string" == typeof t) return void e?.(t);
                    s = t, e?.("started"), u.forEach(e => {
                        a.window?.addEventListener(e, p, {
                            passive: !0
                        })
                    }), c.forEach(e => {
                        a.window?.addEventListener(e, b)
                    }), d()
                }
            }), () => {
                o = !0, clearTimeout(t), u.forEach(e => {
                    a.window?.removeEventListener(e, p)
                }), c.forEach(e => {
                    a.window?.removeEventListener(e, b)
                })
            })
        }, []), null
    }], 206181)
}, 383924, e => {
    "use strict";
    var t = e.i(420482),
        n = e.i(126392),
        r = e.i(981498);
    let o = !1;
    e.s(["default", 0, function() {
        return (0, t.useEffect)(() => {
            o || (o = !0, (0, r.trackAppShellCounter)("ShellStart", {
                auth_state: null == (0, n.getCurrentUser)() ? "unauthenticated" : "authenticated"
            }))
        }, []), null
    }])
}, 724385, e => {
    "use strict";
    var t = e.i(19836),
        n = e.i(420482),
        r = e.i(301775),
        o = e.i(432464),
        l = e.i(645180);
    e.s(["default", 0, function() {
        return (0, n.useSyncExternalStore)(l.subscribe, l.getSnapshot, l.getServerSnapshot).map(e => {
            let {
                key: n,
                container: l,
                app: a
            } = e;
            return (0, r.createPortal)((0, t.jsx)(o.ErrorBoundary, {
                children: a
            }), l, String(n))
        })
    }])
}, 925195, e => {
    "use strict";
    var t = e.i(19836),
        n = e.i(420482),
        r = e.i(301775),
        o = e.i(750341),
        l = e.i(432464),
        a = e.i(55336);
    let i = (0, o.default)(() => e.A(80066), {
        loadableGenerated: {
            modules: [391651]
        },
        ssr: !1,
        loading: () => null
    });
    e.s(["default", 0, function() {
        return (0, n.useSyncExternalStore)(a.subscribe, a.getSnapshot, a.getServerSnapshot) ? (0, r.createPortal)((0, t.jsx)(l.ErrorBoundary, {
            children: (0, t.jsx)(i, {})
        }), document.body) : null
    }])
}, 860834, e => {
    e.v(t => Promise.all(["static/chunks/01sqoc6rh7hn6.js", "static/chunks/12q856wx2m25c.js"].map(t => e.l(t))).then(() => t(60484)))
}, 80066, e => {
    e.v(t => Promise.all(["static/chunks/0.4ilrloiu6s6.js", "static/chunks/0fvonw3nmr.y~.js", "static/chunks/0p~mrt-5eo3o9.js"].map(t => e.l(t))).then(() => t(391651)))
}]);

//# debugId=b1b7e888-3298-f8dc-f772-6fe11eb49fa8
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0260hrzgx41c1.js.map