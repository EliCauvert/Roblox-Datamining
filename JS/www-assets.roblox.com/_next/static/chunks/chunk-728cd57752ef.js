;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "8ad08a28-388d-b3b8-c588-606aba96ff1c")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 496283, e => {
    "use strict";
    e.s(["getInternalPageName", 0, () => {
        if ("u" < typeof document) return;
        let e = document.querySelector('meta[name="page-meta"]');
        return e?.dataset.internalPageName
    }])
}, 597737, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "BailoutToCSR", {
        enumerable: !0,
        get: function() {
            return a
        }
    });
    let r = e.r(397204);

    function a(e) {
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
        a = e.r(301775),
        l = e.r(14419),
        o = e.r(245770),
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
        let c = (0, i.getAssetTokenQuery)();
        return (0, r.jsx)(r.Fragment, {
            children: s.map(e => {
                let t = `${n.assetPrefix}/_next/${(0,o.encodeURIPath)(e)}${c}`;
                return e.endsWith(".css") ? (0, r.jsx)("link", {
                    precedence: "dynamic",
                    href: t,
                    rel: "stylesheet",
                    as: "style",
                    nonce: n.nonce
                }, e) : ((0, a.preload)(t, {
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
            return c
        }
    });
    let r = e.r(19836),
        a = e.r(420482),
        l = e.r(597737),
        o = e.r(936549);

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
        c = function(e) {
            let t = {
                    ...s,
                    ...e
                },
                n = (0, a.lazy)(() => t.loader().then(i)),
                c = t.loading;

            function u(e) {
                let i = c ? (0, r.jsx)(c, {
                        isLoading: !0,
                        pastDelay: !0,
                        error: null
                    }) : null,
                    s = !t.ssr || !!t.loading,
                    u = s ? a.Suspense : a.Fragment,
                    d = t.ssr ? (0, r.jsxs)(r.Fragment, {
                        children: ["u" < typeof window ? (0, r.jsx)(o.PreloadChunks, {
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
                return (0, r.jsx)(u, {
                    ...s ? {
                        fallback: i
                    } : {},
                    children: d
                })
            }
            return u.displayName = "LoadableComponent", u
        }
}, 750341, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "default", {
        enumerable: !0,
        get: function() {
            return a
        }
    });
    let r = e.r(481258)._(e.r(733015));

    function a(e, t) {
        let n = {};
        "function" == typeof e && (n.loader = e);
        let a = {
            ...n,
            ...t
        };
        return (0, r.default)({
            ...a,
            modules: a.loadableGenerated?.modules
        })
    }("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 679025, e => {
    "use strict";
    var t = e.i(695524),
        n = e.i(420546),
        r = e.i(285586),
        a = e.i(828873),
        l = e.i(563969),
        o = e.i(865607);
    e.s(["showReportDialog", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            i = o.WINDOW.document,
            s = i?.head || i?.body;
        if (!s) {
            l.DEBUG_BUILD && t.debug.error("[showReportDialog] Global document not defined");
            return
        }
        let c = (0, n.getCurrentScope)(),
            u = (0, n.getClient)(),
            d = u?.getDsn();
        if (!d) {
            l.DEBUG_BUILD && t.debug.error("[showReportDialog] DSN not configured");
            return
        }
        let p = {
                ...e,
                user: {
                    ...c.getUser(),
                    ...e.user
                },
                eventId: e.eventId || (0, r.lastEventId)()
            },
            m = o.WINDOW.document.createElement("script");
        m.async = !0, m.crossOrigin = "anonymous", m.src = (0, a.getReportDialogEndpoint)(d, p);
        let {
            onLoad: f,
            onClose: h
        } = p;
        if (f && (m.onload = f), h) {
            let e = t => {
                if ("__sentry_reportdialog_closed__" === t.data) try {
                    h()
                } finally {
                    o.WINDOW.removeEventListener("message", e)
                }
            };
            o.WINDOW.addEventListener("message", e)
        }
        s.appendChild(m)
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
        a = e.i(420482);

    function l(e, l, o) {
        let i, {
            componentStack: s
        } = l;
        if (null !== (i = a.version.match(/^([^.]+)/)) && parseInt(i[0]) >= 17 && (0, r.isError)(e) && s) {
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
        }), (0, n.captureException)(e, o)))
    }
    e.s(["captureReactException", 0, l, "reactErrorHandler", 0, function(e) {
        return (t, n) => {
            let r = !!e,
                a = l(t, n, {
                    mechanism: {
                        handled: r,
                        type: "auto.function.react.error_handler"
                    }
                });
            r && e(t, n, a)
        }
    }], 468512);
    let o = {
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
        c = Symbol.for("react.forward_ref"),
        u = Symbol.for("react.memo"),
        d = {};

    function p(e) {
        if ("object" == typeof e && null !== e && e.$$typeof === u) return s;
        let t = e.$$typeof;
        return t && d[t] || o
    }
    d[c] = {
        $$typeof: !0,
        render: !0,
        defaultProps: !0,
        displayName: !0,
        propTypes: !0
    }, d[u] = s;
    let m = Object.defineProperty.bind(Object),
        f = Object.getOwnPropertyNames.bind(Object),
        h = Object.getOwnPropertySymbols?.bind(Object),
        g = Object.getOwnPropertyDescriptor.bind(Object),
        b = Object.getPrototypeOf.bind(Object),
        y = Object.prototype;
    e.s(["hoistNonReactStatics", 0, function e(t, n, r) {
        if ("string" != typeof n) {
            if (y) {
                let r = b(n);
                r && r !== y && e(t, r)
            }
            let r = f(n);
            h && (r = r.concat(h(n)));
            let a = p(t),
                l = p(n);
            for (let e of r)
                if (!i[e] && !l?.[e] && !a?.[e] && !g(t, e)) {
                    let r = g(n, e);
                    if (r) try {
                        m(t, e, r)
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
        a = e.i(420482),
        l = e.i(302952),
        o = e.i(468512),
        i = e.i(793502);
    let s = {
        componentStack: null,
        error: null,
        eventId: null
    };
    class c extends a.Component {
        componentDidCatch(e, r) {
            let {
                componentStack: a
            } = r, {
                beforeCapture: l,
                onError: i,
                showDialog: s,
                dialogOptions: c
            } = this.props;
            (0, t.withScope)(t => {
                l && l(t, e, a);
                let u = null != this.props.handled ? this.props.handled : !!this.props.fallback,
                    d = (0, o.captureReactException)(e, r, {
                        mechanism: {
                            handled: u,
                            type: "auto.function.react.error_boundary"
                        }
                    });
                i && i(e, a, d), s && (this._lastEventId = d, this._openFallbackReportDialog && (0, n.showReportDialog)({
                    ...c,
                    eventId: d
                })), this.setState({
                    error: e,
                    componentStack: a,
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
            let o = "function" == typeof e ? a.createElement(e, {
                error: n.error,
                componentStack: n.componentStack,
                resetError: () => this.resetErrorBoundary(),
                eventId: n.eventId
            }) : e;
            return a.isValidElement(o) ? o : (e && l.DEBUG_BUILD && r.debug.warn("fallback did not produce a valid ReactElement"), null)
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
    e.s(["ErrorBoundary", 0, c, "withErrorBoundary", 0, function(e, t) {
        let n = e.displayName || e.name || "unknown",
            r = a.memo(n => a.createElement(c, {
                ...t
            }, a.createElement(e, {
                ...n
            })));
        return r.displayName = `errorBoundary(${n})`, (0, i.hoistNonReactStatics)(r, e), r
    }])
}, 981498, e => {
    "use strict";
    let t, n = {
        featureName: "AppShell",
        team: "User > Consumer Apps > Platforms - Web & Backend",
        features: {
            page: {
                counters: [{
                    name: "ShellStart",
                    dimensions: ["host", "page", "auth_state"]
                }, {
                    name: "PageHeartbeat",
                    dimensions: ["host", "page", "beat"]
                }]
            },
            presence: {
                counters: [{
                    name: "PresenceHeartbeat",
                    dimensions: ["host", "page", "outcome"]
                }]
            },
            navigation: {
                counters: [{
                    name: "NavLoad",
                    dimensions: ["host", "page", "outcome"]
                }]
            },
            realtime: {
                counters: [{
                    name: "RealtimeStart",
                    dimensions: ["host", "page", "outcome"]
                }]
            },
            chat: {
                counters: [{
                    name: "ChatLoad",
                    dimensions: ["host", "page", "outcome"]
                }]
            },
            gameLaunch: {
                counters: [{
                    name: "GameLaunch",
                    dimensions: ["host", "page", "outcome"]
                }]
            }
        }
    };
    var r = e.i(496283);
    let a = ["Messages", "Avatar"],
        l = (t = (0, e.i(942060).createNextJSFireTelemetryCounter)(n.featureName), (e, l) => {
            let o, i = Object.values(n.features).some(t => t.counters?.some(t => "string" != typeof t && t.name === e && t.dimensions?.includes("page") === !0));
            t(e, {
                ...i && null == l.page ? {
                    page: (o = (0, r.getInternalPageName)(), a.find(e => e === o) ?? "other")
                } : {},
                ...l,
                host: "nextjs"
            })
        });
    e.s(["trackAppShellCounter", 0, l], 981498)
}, 217827, e => {
    "use strict";
    let t, n;
    var r = e.i(420482),
        a = e.i(285586);
    e.i(350223);
    var l = e.i(874296),
        o = e.i(245837),
        i = e.i(646424),
        s = e.i(587541);
    let c = "PresenceBulkNotifications",
        u = l.looseObject({
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
        m = async e => {
            let t = s.Url.parse(o.default.presenceApi).getOrThrow().withPath("/v1/presence/users");
            return (await i.post(t, {
                userIds: e
            }, d, {
                credentials: "include"
            })).getOrThrow().userPresences
        };
    var f = e.i(126392),
        h = e.i(889375),
        g = e.i(981498),
        b = e.i(723941);
    let y = l.object({
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
        E = (e, t, n) => {
            h.eventStreamClientV1.sendEvent(e, t, n)
        },
        v = {
            SendEvent: E,
            SendEventWithTarget: E,
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
                            value: null == e ? null : b.deserialize(y, e).getOrNull()
                        }
                    }
                    return t.value
                })(),
                r = (0, f.getCurrentUser)()?.id;
            if (null == n || null == r) return null;
            let {
                default: a
            } = await e.A(860834);
            return a.Init({
                RealTimeSettings: n,
                CurrentUser: {
                    userId: r
                },
                EventStream: v
            }), a.GetClient()
        }, _ = () => n ??= S().then(e => (null != e && (0, g.trackAppShellCounter)("RealtimeStart", {
            outcome: "started"
        }), e), e => (n = void 0, (0, a.captureException)(e), (0, g.trackAppShellCounter)("RealtimeStart", {
            outcome: "failed"
        }), null));
    e.s(["getRealtimeClient", 0, _, "startRealtime", 0, () => {
        let e, t = !0;
        return _().then(n => {
            let r, a, l;
            t && null != n && (r = new Map, a = e => {
                let {
                    UserId: t,
                    SessionStarted: n
                } = e;
                if (!r.has(t)) return !0;
                let a = r.get(t);
                return "string" == typeof n && "string" == typeof a ? n > a : "number" == typeof n && "number" == typeof a && n > a
            }, l = e => {
                let t = new Map;
                for (let n of Array.isArray(e) ? e : []) {
                    let e = u.safeParse(n);
                    e.success && t.set(e.data.UserId, e.data)
                }
                let n = new Map,
                    l = [];
                for (let [e, o] of t) null != o.PresenceReport && a(o) ? (n.set(e, o.PresenceReport), r.set(e, o.SessionStarted)) : l.push(e);
                l.length > 0 && m(l).then(e => {
                    for (let t of e) n.set(t.userId, t)
                }).catch(e => {
                    console.error(e)
                }).finally(() => {
                    p(n)
                }), p(n)
            }, n.Subscribe(c, l), e = () => {
                n.Unsubscribe(c, l)
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
                a = e => {
                    n.current(e)
                };
            return _().then(n => {
                r && null != n && (n.Subscribe(e, a), t = () => {
                    n.Unsubscribe(e, a)
                })
            }), () => {
                r = !1, t?.()
            }
        }, [e])
    }], 217827)
}, 5673, 394752, e => {
    "use strict";
    let t = e.i(245837).default.domain.includes("sitetest") ? "//client.px-cloud.net/PXDU9eCzTY/main.min.js" : "//client.px-cloud.net/PXbf8PROpW/main.min.js",
        n = "captcha-v2-sensor",
        r = "px-captcha",
        a = "captcha-v2-block-script",
        l = "_px3";
    e.s(["BLOCK_SCRIPT_ID", 0, a, "CHALLENGE_ID_STORAGE_KEY", 0, "CaptchaV2ChallengeId", "DEFAULT_ACTION_TYPE", 0, "ACTION_TYPE_INVALID", "EVENT_CONSTANTS", 0, {
        eventName: "accountSecurityChallengeCaptchaV2Event",
        context: {
            challengeInitialized: "challengeInitialized",
            sensorFinished: "sensorFinished",
            challengeDisplayed: "challengeDisplayed",
            challengeCompleted: "challengeCompleted",
            challengeInvalidated: "challengeInvalidated",
            challengeAbandoned: "challengeAbandoned",
            abrLoaded: "abrLoaded",
            abrFailed: "abrFailed",
            abrSucceeded: "abrSucceeded",
            abrAccepted: "abrAccepted",
            abrRejected: "abrRejected"
        }
    }, "FEATURE_NAME", 0, "CaptchaV2", "METRICS_CONSTANTS", 0, {
        event: {
            challengeInitialized: "ChallengeInitialized",
            sensorFinished: "SensorFinished",
            challengeDisplayed: "ChallengeDisplayed",
            challengeCompleted: "ChallengeCompleted",
            challengeInvalidated: "ChallengeInvalidated",
            challengeAbandoned: "ChallengeAbandoned"
        },
        sequence: {
            challengeSolveTime: "ChallengeSolveTime",
            sensorFinishTime: "SensorFinishTime"
        }
    }, "PX_CAPTCHA_CONTAINER_ID", 0, r, "SENSOR_COOKIE_NAME", 0, l, "SENSOR_LOAD_DELAY", 0, 2e3, "SENSOR_POLL_INTERVAL", 0, 50, "SENSOR_SCRIPT_ID", 0, n, "SENSOR_SCRIPT_URL", 0, t, "TRANSLATION_NAMESPACES", 0, ["Feature.CaptchaV2Challenge"]], 394752);
    let o = {
            width: "100%",
            height: 40,
            backgroundColor: "#233679",
            fillColor: "#335FFF",
            borderColor: "#233679",
            borderWidth: 0,
            innerMargin: 0,
            textColor: "#FFFFFF",
            borderRadius: 8,
            css: ["https://cdn.foundation.roblox.com/current/human-captcha/challenge.css"],
            textFont: "Builder Sans, Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif",
            texSize: 14,
            fontWeight: 600,
            textTransform: "none",
            animation: !1
        },
        i = e => {
            if (null !== document.getElementById(n)) return void e?.();
            let r = document.createElement("script");
            r.id = n, r.type = "text/javascript", r.src = t, r.async = !0;
            let a = document.querySelector("script[nonce]")?.nonce;
            a && (r.nonce = a), e && (r.onload = e), document.head.appendChild(r)
        },
        s = () => document.cookie.split("; ").some(e => e.startsWith(`${l}=`));
    e.s(["clearCaptchaSuccessCallback", 0, () => {
        delete window._pxOnCaptchaSuccess
    }, "preloadSensor", 0, () => {
        let e = () => i();
        "function" == typeof window.requestIdleCallback ? window.requestIdleCallback(e) : window.setTimeout(e, 0)
    }, "setCaptchaSuccessCallback", 0, e => {
        window._pxOnCaptchaSuccess = e
    }, "startCustomChallenge", 0, (e, t) => {
        let {
            buttonLabel: n,
            onCaptchaEvent: l
        } = t, i = window;
        i._pxAppId = e.appId, i._pxJsClientSrc = e.jsClientSrc, i._pxFirstPartyEnabled = e.firstPartyEnabled, i._pxVid = e.vid, i._pxUuid = e.uuid, i._pxHostUrl = e.hostUrl, void 0 !== e.blockedUrl && (i._pxBlockedUrl = e.blockedUrl);
        let s = `_${e.appId}`;
        window[s] = {
            challenge: {
                view: {
                    ...o
                },
                translation: {
                    default: {
                        btn: n
                    }
                },
                context: {
                    failed: {
                        color: "transparent",
                        fontSize: "0px"
                    }
                }
            }
        };
        let c = `${e.appId}_asyncInit`;
        window[c] = e => {
            l && e.Events.on("captcha", l)
        }, document.getElementById(a)?.remove();
        let u = document.createElement("script");
        return u.id = a, u.type = "text/javascript", u.src = e.blockScript, u.async = !0, document.head.appendChild(u), () => {
            u.remove(), document.getElementById(r)?.replaceChildren(), delete i._pxAppId, delete i._pxJsClientSrc, delete i._pxFirstPartyEnabled, delete i._pxVid, delete i._pxUuid, delete i._pxHostUrl, delete i._pxBlockedUrl, Reflect.deleteProperty(window, s), Reflect.deleteProperty(window, c)
        }
    }, "waitForSensorReady", 0, e => {
        let t = 0,
            n = 0,
            r = !1,
            a = () => {
                window.clearInterval(t), window.clearTimeout(n)
            },
            l = t => {
                r || (r = !0, a(), e(t))
            };
        return n = window.setTimeout(l, 2e3, !1), i(() => {
            if (!r) {
                if (s()) return void l(!0);
                t = window.setInterval(() => {
                    s() && l(!0)
                }, 50)
            }
        }), a
    }], 5673)
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
    var a = e.i(874296),
        l = e.i(245837),
        o = e.i(357355),
        i = e.i(646424),
        s = e.i(587541);
    let c = ["click", "dblclick", "focus", "hover", "keypress", "mousedown", "mouseenter", "mouseover", "scroll", "touchmove", "touchstart"],
        u = ["blur"],
        d = a.object({
            isEnabled: a.optional(a.boolean()),
            rolloutPercentage: a.optional(a.number()),
            intervalTimeMs: a.optional(a.number())
        }),
        p = () => s.Url.parse(l.default.apiGatewayUrl).getOrThrow(),
        m = async e => {
            let t = await i.get(p().withPath("/guac-v2/v1/bundles/user-heartbeats"), d, {
                credentials: "include"
            });
            if (t.isErr()) return "configFailed";
            let n = t.value;
            return !0 !== n.isEnabled || e % 100 >= (n.rolloutPercentage ?? 0) ? "gatedOff" : n.intervalTimeMs ?? 3e4
        }, f = async () => (await i.postUntyped(p().withPath("/user-heartbeats-api/pulse"), {
            clientSideTimestampEpochMs: Date.now(),
            sessionInfo: {
                sessionId: /sessionid=([a-f0-9-]{36})/.exec(o.document?.cookie ?? "")?.[1] ?? "unknown"
            },
            locationInfo: {
                websiteLocationInfo: {
                    url: o.window?.location.href ?? ""
                }
            }
        }, {
            credentials: "include"
        })).isOk();
    var h = e.i(981498);
    e.s(["default", 0, function() {
        return (0, t.useEffect)(() => {
            var e;
            let t, a, l, i, s, d, p, g, b = (0, r.getCurrentUser)()?.id,
                y = null == b ? null : (0, n.parseInt)(b);
            return null == y ? void 0 : (e = e => {
                (0, h.trackAppShellCounter)("PresenceHeartbeat", {
                    outcome: e
                })
            }, a = !1, l = !1, i = !1, s = 3e4, d = () => {
                l = !0, i = !1, f().then(t => {
                    e?.(t ? "sent" : "failed")
                }), t = setTimeout(() => {
                    i ? d() : l = !1
                }, s)
            }, p = () => {
                l ? i = !0 : d()
            }, g = () => {
                i = !1
            }, m(y).then(t => {
                if (!a) {
                    if ("string" == typeof t) return void e?.(t);
                    s = t, e?.("started"), c.forEach(e => {
                        o.window?.addEventListener(e, p, {
                            passive: !0
                        })
                    }), u.forEach(e => {
                        o.window?.addEventListener(e, g)
                    }), d()
                }
            }), () => {
                a = !0, clearTimeout(t), c.forEach(e => {
                    o.window?.removeEventListener(e, p)
                }), u.forEach(e => {
                    o.window?.removeEventListener(e, g)
                })
            })
        }, []), null
    }], 206181)
}, 383924, e => {
    "use strict";
    var t = e.i(420482),
        n = e.i(126392),
        r = e.i(981498);
    let a = !1;
    e.s(["default", 0, function() {
        return (0, t.useEffect)(() => {
            a || (a = !0, (0, r.trackAppShellCounter)("ShellStart", {
                auth_state: null == (0, n.getCurrentUser)() ? "unauthenticated" : "authenticated"
            }))
        }, []), null
    }])
}, 724385, e => {
    "use strict";
    var t = e.i(19836),
        n = e.i(420482),
        r = e.i(301775),
        a = e.i(432464),
        l = e.i(645180);
    e.s(["default", 0, function() {
        return (0, n.useSyncExternalStore)(l.subscribe, l.getSnapshot, l.getServerSnapshot).map(e => {
            let {
                key: n,
                container: l,
                app: o
            } = e;
            return (0, r.createPortal)((0, t.jsx)(a.ErrorBoundary, {
                children: o
            }), l, String(n))
        })
    }])
}, 834591, e => {
    "use strict";
    var t = e.i(420482),
        n = e.i(357355),
        r = e.i(5673);
    let a = () => {
        if (null == n.document || null == n.window) return;
        if ("complete" === n.document.readyState) return void(0, r.preloadSensor)();
        let e = () => {
            (0, r.preloadSensor)()
        };
        return n.window.addEventListener("load", e, {
            once: !0
        }), () => {
            n.window?.removeEventListener("load", e)
        }
    };
    e.s(["default", 0, function() {
        return (0, t.useEffect)(a, []), null
    }], 834591)
}, 925195, e => {
    "use strict";
    var t = e.i(19836),
        n = e.i(420482),
        r = e.i(301775),
        a = e.i(750341),
        l = e.i(432464),
        o = e.i(55336);
    let i = (0, a.default)(() => e.A(80066), {
        loadableGenerated: {
            modules: [391651]
        },
        ssr: !1,
        loading: () => null
    });
    e.s(["default", 0, function() {
        return (0, n.useSyncExternalStore)(o.subscribe, o.getSnapshot, o.getServerSnapshot) ? (0, r.createPortal)((0, t.jsx)(l.ErrorBoundary, {
            children: (0, t.jsx)(i, {})
        }), document.body) : null
    }])
}, 860834, e => {
    e.v(t => Promise.all(["static/chunks/01sqoc6rh7hn6.js", "static/chunks/12q856wx2m25c.js"].map(t => e.l(t))).then(() => t(60484)))
}, 80066, e => {
    e.v(t => Promise.all(["static/chunks/0.4ilrloiu6s6.js", "static/chunks/0fvonw3nmr.y~.js", "static/chunks/01z.1fi120mxn.js"].map(t => e.l(t))).then(() => t(391651)))
}]);

//# debugId=8ad08a28-388d-b3b8-c588-606aba96ff1c
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/15hyt40dku-2a.js.map