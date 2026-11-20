;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "01c124ae-4ed9-db8c-cbb0-7161a2981236")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 144674, 248951, e => {
    "use strict";
    var t = e.i(868275),
        r = e.i(357355),
        n = e.i(932598),
        a = e.i(341332),
        l = e.i(245837),
        i = e.i(621899),
        o = e.i(545819),
        s = e.i(682259),
        d = e.i(951605);
    let u = () => null != r.window && null != r.document,
        c = () => ({
            domain: `.${l.default.domain}`,
            maxAge: d.COOKIE_TIMESPAN
        });
    class m {
        save() {
            if (!u()) return;
            let e = `${this.purchaseFlowUuid??""},${this.triggeringContext??""}`,
                {
                    domain: t,
                    maxAge: r
                } = c();
            (0, o.set)(d.COOKIE_NAME, e, {
                domain: t,
                maxAge: r
            })
        }
        static stop() {
            if (!u()) return;
            let {
                domain: e
            } = c();
            (0, o.delete)(d.COOKIE_NAME, {
                domain: e
            })
        }
        static loadFromCookie() {
            if (!u()) return null;
            let e = (0, o.get)(d.COOKIE_NAME);
            if (null == e || "" === e.value) return null;
            let [t, r] = e.value.split(",");
            return new m("" === t ? void 0 : t, null != r && (0, s.isStringEnum)(d.TRIGGERING_CONTEXT, r) ? r : void 0)
        }
        constructor(e, r) {
            (0, t._)(this, "purchaseFlowUuid", void 0), (0, t._)(this, "triggeringContext", void 0), this.purchaseFlowUuid = e, this.triggeringContext = r
        }
    }
    var p = e.i(112269),
        f = e.i(333982);
    let h = (e, t) => {
        r.window?.Sentry?.captureException(e, t ? {
            tags: t
        } : void 0)
    };
    e.s(["captureException", 0, h], 248951);
    let E = {
            featureName: "PaymentsFlowAnalytics",
            team: "Economy > Payments & Fraud",
            features: {
                PaymentFlow: {
                    counters: ["UserPaymentFlowMidPurchaseStepTriggeredWithoutCtx", "UserPaymentFlowFlowEnded", {
                        name: "UserPaymentFlowEventSent",
                        dimensions: ["transport", "requestedTransport", "eventName"]
                    }, {
                        name: "UserPaymentFlowEventFetchFailed",
                        dimensions: ["eventName", "viewName", "platform", "visibility", "elapsed"]
                    }, {
                        name: "UserPaymentFlowEventImgFailed",
                        dimensions: ["eventName", "viewName", "platform", "visibility", "elapsed"]
                    }],
                    errors: ["UserPaymentFlowWrongUsageOfMethod", "UserPaymentFlowSendEventWithoutUuidOrCtx", "UserPaymentFlowLoadPreExistingCtxError", "UserPaymentFlowSendStatusEventError", "UserPaymentFlowSendUserEventError", "UserPaymentFlowStartFlowError", "UserPaymentFlowFlowEndedWithoutTriggerContext", "UserPaymentFlowSendEventKeepaliveError"]
                }
            }
        },
        g = (0, f.createFireTelemetryCounter)(E.featureName),
        {
            trackCounter: w,
            trackError: v
        } = (0, p.createTrackers)(E, {
            publish: g,
            captureException: h,
            featureName: E.featureName
        }),
        x = "__rbxPaymentsFlowListenersAttached",
        S = e => {
            let {
                currentTarget: t
            } = e;
            return null != t && "innerText" in t && "string" == typeof t.innerText ? t.innerText : ""
        },
        y = function() {
            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
            for (let e of t)
                if (null != e && "" !== e) return e;
            return ""
        },
        C = "__rbxPaymentsFlowUuid",
        _ = [{
            web: d.TRIGGERING_CONTEXT.WEB_ROBUX_PURCHASE,
            webview: d.TRIGGERING_CONTEXT.WEBVIEW_ROBUX_PURCHASE,
            mobileWeb: d.TRIGGERING_CONTEXT.MOBILE_WEB_ROBUX_PURCHASE
        }, {
            web: d.TRIGGERING_CONTEXT.WEB_PREMIUM_PURCHASE,
            webview: d.TRIGGERING_CONTEXT.WEBVIEW_PREMIUM_PURCHASE,
            mobileWeb: d.TRIGGERING_CONTEXT.MOBILE_WEB_PREMIUM_PURCHASE
        }, {
            web: d.TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE,
            webview: d.TRIGGERING_CONTEXT.WEBVIEW_ROBLOX_PLUS_PURCHASE,
            mobileWeb: d.TRIGGERING_CONTEXT.MOBILE_WEB_ROBLOX_PLUS_PURCHASE
        }],
        T = new i.Tracker(new i.Configuration({
            baseUrl: `https://ecsv2.${l.default.domain}/www`
        })),
        P = () => "function" == typeof r.window?.fetch,
        R = (e, t, n, a, l) => {
            var i;
            w(e, {
                eventName: t,
                viewName: n,
                platform: a,
                visibility: r.document?.visibilityState ?? "unknown",
                elapsed: (i = Date.now() - l) < 100 ? "lt100ms" : i < 1e3 ? "lt1s" : i < 1e4 ? "lt10s" : "gte10s"
            })
        };
    class U {
        loadOrStartPaymentFlow() {
            if (null != r.window) try {
                if (this.purchaseFlowUuid || this.tryLoadPreExistingCtx(), this.purchaseFlowUuid || this.adoptSharedFlowUuid(), !this.purchaseFlowUuid) {
                    let e = U.getUrlAnalyticId();
                    this.purchaseFlowUuid = e ?? (0, n.generateRandomUuid)(), this.writePaymentFlowContextIntoCookie()
                }
                this.publishSharedFlowUuid()
            } catch (e) {
                v("UserPaymentFlowStartFlowError", null, e)
            }
        }
        getPaymentFlowUuid() {
            return this.adoptSharedFlowUuid(), this.purchaseFlowUuid
        }
        setPaymentFlowUuid(e) {
            this.purchaseFlowUuid = e, this.publishSharedFlowUuid(), this.writePaymentFlowContextIntoCookie()
        }
        setWebStack(e) {
            u() && (this.webStack = e)
        }
        startRobuxUpsellFlow(e) {
            let {
                assetType: t,
                isReseller: r = !1,
                itemId: n = ""
            } = e;
            this.eventMetadata.item_type = t, this.eventMetadata.item_id = n, t === d.ASSET_TYPE.GAME_PASS ? this.triggerContext = d.TRIGGERING_CONTEXT.WEB_GAME_PASS_ROBUX_UPSELL : t === d.ASSET_TYPE.DEVELOPER_PRODUCT ? this.triggerContext = d.TRIGGERING_CONTEXT.WEB_DEVELOPER_PRODUCT_ROBUX_UPSELL : t === d.ASSET_TYPE.PLACE ? this.triggerContext = d.TRIGGERING_CONTEXT.WEB_PAID_GAME_ROBUX_UPSELL : t === d.ASSET_TYPE.PRIVATE_SERVER ? this.triggerContext = d.TRIGGERING_CONTEXT.WEB_PRIVATE_SERVER_ROBUX_UPSELL : t === d.ASSET_TYPE.BUNDLE || t === d.ASSET_TYPE.PACKAGE ? this.triggerContext = d.TRIGGERING_CONTEXT.WEB_CATALOG_BUNDLE_ITEM_ROBUX_UPSELL : r ? this.triggerContext = d.TRIGGERING_CONTEXT.WEB_CATALOG_COLLECTIVE_ITEM_ROBUX_UPSELL : this.triggerContext = d.TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, this.writePaymentFlowContextIntoCookie()
        }
        startRobloxPlusUpsellFlow(e) {
            let {
                assetType: t,
                isReseller: r = !1,
                itemId: n = ""
            } = e;
            if (this.eventMetadata.item_type = t, this.eventMetadata.item_id = n, r) this.triggerContext = d.TRIGGERING_CONTEXT.WEB_CATALOG_RESALE_ITEM_PLUS_UPSELL;
            else switch (t) {
                case d.ASSET_TYPE.GAME_PASS:
                    this.triggerContext = d.TRIGGERING_CONTEXT.WEB_GAME_PASS_PLUS_UPSELL;
                    break;
                case d.ASSET_TYPE.DEVELOPER_PRODUCT:
                    this.triggerContext = d.TRIGGERING_CONTEXT.WEB_DEVELOPER_PRODUCT_PLUS_UPSELL;
                    break;
                case d.ASSET_TYPE.PRIVATE_SERVER:
                    this.triggerContext = d.TRIGGERING_CONTEXT.WEB_PRIVATE_SERVER_PLUS_UPSELL;
                    break;
                case d.ASSET_TYPE.BUNDLE:
                case d.ASSET_TYPE.PACKAGE:
                    this.triggerContext = d.TRIGGERING_CONTEXT.WEB_CATALOG_BUNDLE_ITEM_PLUS_UPSELL;
                    break;
                case d.ASSET_TYPE.SUBSCRIPTION:
                    this.triggerContext = d.TRIGGERING_CONTEXT.WEB_DEVELOPER_SUBSCRIPTION_PLUS_UPSELL;
                    break;
                default:
                    this.triggerContext = d.TRIGGERING_CONTEXT.WEB_CATALOG_SINGLE_ITEM_PLUS_UPSELL
            }
            this.writePaymentFlowContextIntoCookie()
        }
        sendUserPurchaseFlowEvent(e) {
            this.sendFlowEvent(e, "img")
        }
        sendUserPurchaseFlowEventViaFetch(e) {
            this.sendFlowEvent(e, "fetch")
        }
        sendFlowEvent(e, t) {
            let {
                triggerContext: r,
                isMidPurchaseStep: n,
                viewName: a,
                purchaseEventType: l,
                viewMessage: i,
                eventMetadata: o = {},
                isTerminalView: s = !1
            } = e;
            if (u()) try {
                let e = U.reclassifyPlatformTriggeringContext({
                    triggerContext: r
                });
                if (this.eventMetadata = {
                        ...this.eventMetadata,
                        ...o
                    }, !a && !l && !i) return void v("UserPaymentFlowWrongUsageOfMethod");
                this.adoptSharedTriggerContext(), !this.triggerContext && (this.triggerContext = e, this.writePaymentFlowContextIntoCookie(), n && w("UserPaymentFlowMidPurchaseStepTriggeredWithoutCtx")), this.sendEvent({
                    eventName: d.EVENT_NAME.USER_PURCHASE_FLOW,
                    viewName: a,
                    purchaseEventType: l,
                    viewMessage: i
                }, t), s && this.handleTerminalPage(t)
            } catch (e) {
                v("UserPaymentFlowSendUserEventError", null, e)
            }
        }
        sendUserPurchaseStatusEvent(e) {
            this.sendStatusEvent(e, "img")
        }
        sendUserPurchaseStatusEventViaFetch(e) {
            this.sendStatusEvent(e, "fetch")
        }
        sendStatusEvent(e, t) {
            let {
                triggerContext: r,
                status: n,
                viewMessage: a,
                viewName: l
            } = e;
            if (u()) try {
                let e = U.reclassifyPlatformTriggeringContext({
                    triggerContext: r
                });
                if (!n && !a && !l) return void v("UserPaymentFlowWrongUsageOfMethod");
                this.adoptSharedTriggerContext(), this.triggerContext || (this.triggerContext = e, this.writePaymentFlowContextIntoCookie()), this.sendEvent({
                    eventName: d.EVENT_NAME.USER_PURCHASE_STATUS,
                    viewName: l,
                    viewMessage: a,
                    status: n
                }, t), U.isTerminalView(l) && this.handleTerminalPage(t)
            } catch (e) {
                v("UserPaymentFlowSendStatusEventError", null, e)
            }
        }
        adoptSharedTriggerContext() {
            if (this.triggerContext) return;
            this.adoptSharedFlowUuid();
            let e = m.loadFromCookie();
            e?.triggeringContext != null && e.purchaseFlowUuid === this.purchaseFlowUuid && (this.triggerContext = e.triggeringContext)
        }
        adoptSharedFlowUuid() {
            let e = r.window;
            if (null == e || !(C in e)) return;
            let t = e[C];
            "string" == typeof t && "" !== t && (this.purchaseFlowUuid = t)
        }
        publishSharedFlowUuid() {
            let e = r.window;
            null != e && this.purchaseFlowUuid && Object.assign(e, {
                [C]: this.purchaseFlowUuid
            })
        }
        writePaymentFlowContextIntoCookie() {
            this.adoptSharedFlowUuid(), new m(this.purchaseFlowUuid, this.triggerContext).save()
        }
        sendEvent(e, t) {
            var n;
            let l, i, o, s, d, {
                eventName: u,
                viewName: c,
                purchaseEventType: m,
                viewMessage: p,
                status: f
            } = e;
            if (this.adoptSharedFlowUuid(), !this.purchaseFlowUuid || !this.triggerContext) return void v("UserPaymentFlowSendEventWithoutUuidOrCtx");
            let h = r.window;
            if (null == h) return;
            let E = U.getReferralUrl(),
                g = U.extractView(E),
                x = U.extractView(h.location.href),
                S = "fetch" === t && P() ? "fetch" : "img",
                y = JSON.stringify({
                    ...this.eventMetadata,
                    ...void 0 === this.webStack ? {} : {
                        webStack: this.webStack
                    },
                    eventTransport: S
                });
            n = {
                target: "www",
                localTime: new Date,
                eventType: u,
                context: this.triggerContext,
                additionalProperties: {
                    purchase_flow_uuid: this.purchaseFlowUuid,
                    view_name: c,
                    purchase_event_type: m,
                    view_message: p,
                    status: f,
                    refurl: E.substring(0, 200),
                    prev_view_path: g,
                    current_view_path: x,
                    event_metadata: y
                }
            }, l = (0, a.getDeviceMeta)(), i = l?.isIosApp ? "iosApp" : l?.isAndroidApp ? "androidApp" : [l?.isInApp, l?.isAmazonApp, l?.isUWPApp, l?.isXboxApp, l?.isWin32App, l?.isUniversalApp, l?.isSamsungGalaxyStoreApp, l?.isPcGdkApp, l?.isStudio].some(e => !0 === e) ? "otherApp" : "browser", o = c ?? "", w("UserPaymentFlowEventSent", {
                transport: s = "fetch" === t && P() ? "fetch" : "img",
                requestedTransport: t,
                eventName: u
            }), d = Date.now(), "img" === s ? T.sendEventViaImg(n, e => {
                e || R("UserPaymentFlowEventImgFailed", u, o, i, d)
            }) : T.sendEventViaFetch(n, e => {
                e || R("UserPaymentFlowEventFetchFailed", u, o, i, d)
            }).catch(e => {
                v("UserPaymentFlowSendEventKeepaliveError", null, e)
            })
        }
        tryLoadPreExistingCtx() {
            let e = r.document,
                t = r.window;
            if (null != e && null != t) try {
                let {
                    referrer: r
                } = e, n = r && new URL(r).hostname.endsWith(l.default.domain), a = t.performance.getEntriesByType("navigation")[0], i = (e => {
                    if (null != e && "type" in e && "string" == typeof e.type) return e.type
                })(a);
                if (!n && "back_forward" !== i && "reload" !== i) return;
                let o = m.loadFromCookie();
                o && (o.purchaseFlowUuid && (this.purchaseFlowUuid = o.purchaseFlowUuid), o.triggeringContext && (this.triggerContext = o.triggeringContext))
            } catch (e) {
                v("UserPaymentFlowLoadPreExistingCtxError", null, e)
            }
        }
        static extractView(e) {
            if (!e) return "";
            let t = new URL(e);
            return t.hostname.endsWith(`.${l.default.domain}`) ? t.pathname : "External"
        }
        handleTerminalPage(e) {
            if (this.purchaseFlowUuid) {
                if (!this.triggerContext) return void v("UserPaymentFlowFlowEndedWithoutTriggerContext");
                m.stop(), this.sendStatusEvent({
                    triggerContext: this.triggerContext,
                    status: d.PURCHASE_STATUS.PAYMENT_FLOW_ENDED
                }, e), w("UserPaymentFlowFlowEnded")
            }
        }
        static isTerminalView(e) {
            return e === d.VIEW_NAME.CHECKOUT_SUCCESS
        }
        static getReferralUrl() {
            let e = r.document,
                t = r.window;
            if (null == e) return "";
            try {
                return y(e.referrer, t?.frames.top?.document.referrer)
            } catch {
                return e.referrer
            }
        }
        static getUrlAnalyticId() {
            let e = r.window;
            return null == e ? null : new URLSearchParams(e.location.search).get("analyticId")
        }
        static reclassifyPlatformTriggeringContext(e) {
            let {
                triggerContext: t
            } = e, r = (0, a.getDeviceMeta)(), n = [r?.isAmazonApp, r?.isUWPApp, r?.isIosApp, r?.isAndroidApp].some(e => !0 === e);
            for (let {
                    web: e,
                    webview: r,
                    mobileWeb: a
                }
                of _) {
                if (t === e || t === r) return n ? r : e;
                if (t === a) return n ? r : a
            }
            return t
        }
        constructor() {
            if ((0, t._)(this, "purchaseFlowUuid", ""), (0, t._)(this, "triggerContext", void 0), (0, t._)(this, "ENUM_TRIGGERING_CONTEXT", d.TRIGGERING_CONTEXT), (0, t._)(this, "ENUM_VIEW_NAME", d.VIEW_NAME), (0, t._)(this, "ENUM_PURCHASE_EVENT_TYPE", d.PURCHASE_EVENT_TYPE), (0, t._)(this, "ENUM_VIEW_MESSAGE", d.VIEW_MESSAGE), (0, t._)(this, "ENUM_PURCHASE_STATUS", d.PURCHASE_STATUS), (0, t._)(this, "ENUM_CUSTOM_EVENT", d.CUSTOM_EVENT), (0, t._)(this, "eventMetadata", {}), (0, t._)(this, "webStack", void 0), !u()) return;
            this.loadOrStartPaymentFlow()
        }
    }
    let b = new U;
    (e => {
        let t, n = r.document;
        if (null == n || null != (t = r.window) && (!0 === Reflect.get(t, x) || (Object.assign(t, {
                [x]: !0
            }), 0))) return;
        let a = () => {
            r.document?.querySelector("#header li a.robux-menu-btn")?.addEventListener("click", t => {
                e.sendUserPurchaseFlowEvent({
                    triggerContext: d.TRIGGERING_CONTEXT.WEB_ROBUX_PURCHASE,
                    isMidPurchaseStep: !1,
                    viewName: d.VIEW_NAME.NAVIGATION_MENU,
                    purchaseEventType: d.PURCHASE_EVENT_TYPE.USER_INPUT,
                    viewMessage: S(t)
                })
            }), r.document?.getElementById("display-price-container") == null && (r.document?.querySelector("#item-details #upgrade-button")?.addEventListener("click", () => {
                e.sendUserPurchaseFlowEvent({
                    triggerContext: d.TRIGGERING_CONTEXT.WEB_PREMIUM_PURCHASE,
                    isMidPurchaseStep: !1,
                    viewName: d.VIEW_NAME.PREMIUM_UPSELL,
                    purchaseEventType: d.PURCHASE_EVENT_TYPE.USER_INPUT,
                    viewMessage: d.VIEW_MESSAGE.GET_PREMIUM
                })
            }), r.document?.querySelector("#item-details .premium-prompt a")?.addEventListener("click", t => {
                e.sendUserPurchaseFlowEvent({
                    triggerContext: d.TRIGGERING_CONTEXT.WEB_PREMIUM_PURCHASE,
                    isMidPurchaseStep: !1,
                    viewName: d.VIEW_NAME.PREMIUM_UPSELL,
                    purchaseEventType: d.PURCHASE_EVENT_TYPE.USER_INPUT,
                    viewMessage: S(t)
                })
            }))
        };
        "loading" === n.readyState ? n.addEventListener("DOMContentLoaded", a) : a()
    })(b), e.s(["paymentFlowAnalyticsService", 0, b], 144674)
}, 215941, e => {
    "use strict";
    var t = e.i(371847),
        r = e.i(706888),
        n = e.i(422957),
        a = e.i(434205),
        l = e.i(809804),
        i = t.forwardRef((e, t) => {
            let {
                children: r,
                width: n = 10,
                height: i = 5,
                ...o
            } = e;
            return (0, l.jsx)(a.Primitive.svg, {
                ...o,
                ref: t,
                width: n,
                height: i,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? r : (0, l.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    i.displayName = "Arrow";
    var o = e.i(539181),
        s = e.i(734988),
        d = e.i(823499),
        u = e.i(13522),
        c = e.i(189192),
        m = "Popper",
        [p, f] = (0, s.createContextScope)(m),
        [h, E] = p(m),
        g = e => {
            let {
                __scopePopper: r,
                children: n
            } = e, [a, i] = t.useState(null);
            return (0, l.jsx)(h, {
                scope: r,
                anchor: a,
                onAnchorChange: i,
                children: n
            })
        };
    g.displayName = m;
    var w = "PopperAnchor",
        v = t.forwardRef((e, r) => {
            let {
                __scopePopper: n,
                virtualRef: i,
                ...s
            } = e, d = E(w, n), u = t.useRef(null), c = (0, o.useComposedRefs)(r, u);
            return t.useEffect(() => {
                d.onAnchorChange(i?.current || u.current)
            }), i ? null : (0, l.jsx)(a.Primitive.div, {
                ...s,
                ref: c
            })
        });
    v.displayName = w;
    var x = "PopperContent",
        [S, y] = p(x),
        C = t.forwardRef((e, i) => {
            let {
                __scopePopper: s,
                side: m = "bottom",
                sideOffset: p = 0,
                align: f = "center",
                alignOffset: h = 0,
                arrowPadding: g = 0,
                avoidCollisions: w = !0,
                collisionBoundary: v = [],
                collisionPadding: y = 0,
                sticky: C = "partial",
                hideWhenDetached: _ = !1,
                updatePositionStrategy: T = "optimized",
                onPlaced: P,
                ...N
            } = e, I = E(x, s), [A, L] = t.useState(null), M = (0, o.useComposedRefs)(i, e => L(e)), [F, O] = t.useState(null), G = (0, c.useSize)(F), k = G?.width ?? 0, B = G?.height ?? 0, W = "number" == typeof y ? y : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...y
            }, j = Array.isArray(v) ? v : [v], H = j.length > 0, V = {
                padding: W,
                boundary: j.filter(R),
                altBoundary: H
            }, {
                refs: X,
                floatingStyles: D,
                placement: K,
                isPositioned: Y,
                middlewareData: $
            } = (0, r.useFloating)({
                strategy: "fixed",
                placement: m + ("center" !== f ? "-" + f : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return (0, n.autoUpdate)(...t, {
                        animationFrame: "always" === T
                    })
                },
                elements: {
                    reference: I.anchor
                },
                middleware: [(0, r.offset)({
                    mainAxis: p + B,
                    alignmentAxis: h
                }), w && (0, r.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === C ? (0, r.limitShift)() : void 0,
                    ...V
                }), w && (0, r.flip)({
                    ...V
                }), (0, r.size)({
                    ...V,
                    apply: e => {
                        let {
                            elements: t,
                            rects: r,
                            availableWidth: n,
                            availableHeight: a
                        } = e, {
                            width: l,
                            height: i
                        } = r.reference, o = t.floating.style;
                        o.setProperty("--radix-popper-available-width", `${n}px`), o.setProperty("--radix-popper-available-height", `${a}px`), o.setProperty("--radix-popper-anchor-width", `${l}px`), o.setProperty("--radix-popper-anchor-height", `${i}px`)
                    }
                }), F && (0, r.arrow)({
                    element: F,
                    padding: g
                }), U({
                    arrowWidth: k,
                    arrowHeight: B
                }), _ && (0, r.hide)({
                    strategy: "referenceHidden",
                    ...V
                })]
            }), [z, q] = b(K), J = (0, d.useCallbackRef)(P);
            (0, u.useLayoutEffect)(() => {
                Y && J?.()
            }, [Y, J]);
            let Z = $.arrow?.x,
                Q = $.arrow?.y,
                ee = $.arrow?.centerOffset !== 0,
                [et, er] = t.useState();
            return (0, u.useLayoutEffect)(() => {
                A && er(window.getComputedStyle(A).zIndex)
            }, [A]), (0, l.jsx)("div", {
                ref: X.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...D,
                    transform: Y ? D.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: et,
                    "--radix-popper-transform-origin": [$.transformOrigin?.x, $.transformOrigin?.y].join(" "),
                    ...$.hide?.referenceHidden && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, l.jsx)(S, {
                    scope: s,
                    placedSide: z,
                    onArrowChange: O,
                    arrowX: Z,
                    arrowY: Q,
                    shouldHideArrow: ee,
                    children: (0, l.jsx)(a.Primitive.div, {
                        "data-side": z,
                        "data-align": q,
                        ...N,
                        ref: M,
                        style: {
                            ...N.style,
                            animation: Y ? void 0 : "none"
                        }
                    })
                })
            })
        });
    C.displayName = x;
    var _ = "PopperArrow",
        T = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        P = t.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...n
            } = e, a = y(_, r), o = T[a.placedSide];
            return (0, l.jsx)("span", {
                ref: a.onArrowChange,
                style: {
                    position: "absolute",
                    left: a.arrowX,
                    top: a.arrowY,
                    [o]: 0,
                    transformOrigin: {
                        top: "",
                        right: "0 0",
                        bottom: "center 0",
                        left: "100% 0"
                    } [a.placedSide],
                    transform: {
                        top: "translateY(100%)",
                        right: "translateY(50%) rotate(90deg) translateX(-50%)",
                        bottom: "rotate(180deg)",
                        left: "translateY(50%) rotate(-90deg) translateX(50%)"
                    } [a.placedSide],
                    visibility: a.shouldHideArrow ? "hidden" : void 0
                },
                children: (0, l.jsx)(i, {
                    ...n,
                    ref: t,
                    style: {
                        ...n.style,
                        display: "block"
                    }
                })
            })
        });

    function R(e) {
        return null !== e
    }
    P.displayName = _;
    var U = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            let {
                placement: r,
                rects: n,
                middlewareData: a
            } = t, l = a.arrow?.centerOffset !== 0, i = l ? 0 : e.arrowWidth, o = l ? 0 : e.arrowHeight, [s, d] = b(r), u = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [d], c = (a.arrow?.x ?? 0) + i / 2, m = (a.arrow?.y ?? 0) + o / 2, p = "", f = "";
            return "bottom" === s ? (p = l ? u : `${c}px`, f = `${-o}px`) : "top" === s ? (p = l ? u : `${c}px`, f = `${n.floating.height+o}px`) : "right" === s ? (p = `${-o}px`, f = l ? u : `${m}px`) : "left" === s && (p = `${n.floating.width+o}px`, f = l ? u : `${m}px`), {
                data: {
                    x: p,
                    y: f
                }
            }
        }
    });

    function b(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    e.s(["Anchor", 0, v, "Arrow", 0, P, "Content", 0, C, "Root", 0, g, "createPopperScope", 0, f], 215941)
}, 986377, e => {
    "use strict";
    var t = e.i(371847),
        r = e.i(734988),
        n = e.i(539181),
        a = e.i(354981),
        l = e.i(809804);
    e.s(["createCollection", 0, function(e) {
        let i = e + "CollectionProvider",
            [o, s] = (0, r.createContextScope)(i),
            [d, u] = o(i, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            c = e => {
                let {
                    scope: r,
                    children: n
                } = e, a = t.default.useRef(null), i = t.default.useRef(new Map).current;
                return (0, l.jsx)(d, {
                    scope: r,
                    itemMap: i,
                    collectionRef: a,
                    children: n
                })
            };
        c.displayName = i;
        let m = e + "CollectionSlot",
            p = (0, a.createSlot)(m),
            f = t.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: a
                } = e, i = u(m, r), o = (0, n.useComposedRefs)(t, i.collectionRef);
                return (0, l.jsx)(p, {
                    ref: o,
                    children: a
                })
            });
        f.displayName = m;
        let h = e + "CollectionItemSlot",
            E = "data-radix-collection-item",
            g = (0, a.createSlot)(h),
            w = t.default.forwardRef((e, r) => {
                let {
                    scope: a,
                    children: i,
                    ...o
                } = e, s = t.default.useRef(null), d = (0, n.useComposedRefs)(r, s), c = u(h, a);
                return t.default.useEffect(() => (c.itemMap.set(s, {
                    ref: s,
                    ...o
                }), () => void c.itemMap.delete(s))), (0, l.jsx)(g, {
                    ...{
                        [E]: ""
                    },
                    ref: d,
                    children: i
                })
            });
        return w.displayName = h, [{
            Provider: c,
            Slot: f,
            ItemSlot: w
        }, function(r) {
            let n = u(e + "CollectionConsumer", r);
            return t.default.useCallback(() => {
                let e = n.collectionRef.current;
                if (!e) return [];
                let t = Array.from(e.querySelectorAll(`[${E}]`));
                return Array.from(n.itemMap.values()).sort((e, r) => t.indexOf(e.ref.current) - t.indexOf(r.ref.current))
            }, [n.collectionRef, n.itemMap])
        }, s]
    }])
}, 726799, 713633, e => {
    "use strict";
    var t = e.i(885065),
        r = e.i(511336),
        n = e.i(790033),
        a = e.i(227801),
        l = e.i(7284),
        i = e.i(371847),
        o = e.i(652447),
        s = e.i(527069),
        d = e.i(775453),
        u = e.i(986377),
        c = e.i(539181),
        m = e.i(734988),
        p = e.i(274879),
        f = e.i(430781),
        h = e.i(653279),
        E = e.i(5872),
        g = e.i(481010),
        w = e.i(215941),
        v = e.i(337537),
        x = e.i(434205),
        S = e.i(354981),
        y = e.i(823499),
        C = e.i(494334),
        _ = e.i(13522),
        T = e.i(183901),
        P = e.i(809804),
        R = i.forwardRef((e, t) => (0, P.jsx)(x.Primitive.span, {
            ...e,
            ref: t,
            style: {
                position: "absolute",
                border: 0,
                width: 1,
                height: 1,
                padding: 0,
                margin: -1,
                overflow: "hidden",
                clip: "rect(0, 0, 0, 0)",
                whiteSpace: "nowrap",
                wordWrap: "normal",
                ...e.style
            }
        }));
    R.displayName = "VisuallyHidden";
    var U = e.i(73772),
        b = e.i(641501),
        N = [" ", "Enter", "ArrowUp", "ArrowDown"],
        I = [" ", "Enter"],
        A = "Select",
        [L, M, F] = (0, u.createCollection)(A),
        [O, G] = (0, m.createContextScope)(A, [F, w.createPopperScope]),
        k = (0, w.createPopperScope)(),
        [B, W] = O(A),
        [j, H] = O(A),
        V = e => {
            let {
                __scopeSelect: t,
                children: r,
                open: n,
                defaultOpen: a,
                onOpenChange: l,
                value: o,
                defaultValue: s,
                onValueChange: d,
                dir: u,
                name: c,
                autoComplete: m,
                disabled: f,
                required: h,
                form: E
            } = e, v = k(t), [x, S] = i.useState(null), [y, _] = i.useState(null), [T, R] = i.useState(!1), U = (0, p.useDirection)(u), [b = !1, N] = (0, C.useControllableState)({
                prop: n,
                defaultProp: a,
                onChange: l
            }), [I, A] = (0, C.useControllableState)({
                prop: o,
                defaultProp: s,
                onChange: d
            }), M = i.useRef(null), F = !x || E || !!x.closest("form"), [O, G] = i.useState(new Set), W = Array.from(O).map(e => e.props.value).join(";");
            return (0, P.jsx)(w.Root, {
                ...v,
                children: (0, P.jsxs)(B, {
                    required: h,
                    scope: t,
                    trigger: x,
                    onTriggerChange: S,
                    valueNode: y,
                    onValueNodeChange: _,
                    valueNodeHasChildren: T,
                    onValueNodeHasChildrenChange: R,
                    contentId: (0, g.useId)(),
                    value: I,
                    onValueChange: A,
                    open: b,
                    onOpenChange: N,
                    dir: U,
                    triggerPointerDownPosRef: M,
                    disabled: f,
                    children: [(0, P.jsx)(L.Provider, {
                        scope: t,
                        children: (0, P.jsx)(j, {
                            scope: e.__scopeSelect,
                            onNativeOptionAdd: i.useCallback(e => {
                                G(t => new Set(t).add(e))
                            }, []),
                            onNativeOptionRemove: i.useCallback(e => {
                                G(t => {
                                    let r = new Set(t);
                                    return r.delete(e), r
                                })
                            }, []),
                            children: r
                        })
                    }), F ? (0, P.jsxs)(e_, {
                        "aria-hidden": !0,
                        required: h,
                        tabIndex: -1,
                        name: c,
                        autoComplete: m,
                        value: I,
                        onChange: e => A(e.target.value),
                        disabled: f,
                        form: E,
                        children: [void 0 === I ? (0, P.jsx)("option", {
                            value: ""
                        }) : null, Array.from(O)]
                    }, W) : null]
                })
            })
        };
    V.displayName = A;
    var X = "SelectTrigger",
        D = i.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                disabled: n = !1,
                ...a
            } = e, l = k(r), o = W(X, r), s = o.disabled || n, u = (0, c.useComposedRefs)(t, o.onTriggerChange), m = M(r), p = i.useRef("touch"), [f, h, E] = eT(e => {
                let t = m().filter(e => !e.disabled),
                    r = t.find(e => e.value === o.value),
                    n = eP(t, e, r);
                void 0 !== n && o.onValueChange(n.value)
            }), g = e => {
                s || (o.onOpenChange(!0), E()), e && (o.triggerPointerDownPosRef.current = {
                    x: Math.round(e.pageX),
                    y: Math.round(e.pageY)
                })
            };
            return (0, P.jsx)(w.Anchor, {
                asChild: !0,
                ...l,
                children: (0, P.jsx)(x.Primitive.button, {
                    type: "button",
                    role: "combobox",
                    "aria-controls": o.contentId,
                    "aria-expanded": o.open,
                    "aria-required": o.required,
                    "aria-autocomplete": "none",
                    dir: o.dir,
                    "data-state": o.open ? "open" : "closed",
                    disabled: s,
                    "data-disabled": s ? "" : void 0,
                    "data-placeholder": eC(o.value) ? "" : void 0,
                    ...a,
                    ref: u,
                    onClick: (0, d.composeEventHandlers)(a.onClick, e => {
                        e.currentTarget.focus(), "mouse" !== p.current && g(e)
                    }),
                    onPointerDown: (0, d.composeEventHandlers)(a.onPointerDown, e => {
                        p.current = e.pointerType;
                        let t = e.target;
                        t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (g(e), e.preventDefault())
                    }),
                    onKeyDown: (0, d.composeEventHandlers)(a.onKeyDown, e => {
                        let t = "" !== f.current;
                        e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || h(e.key), (!t || " " !== e.key) && N.includes(e.key) && (g(), e.preventDefault())
                    })
                })
            })
        });
    D.displayName = X;
    var K = "SelectValue",
        Y = i.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                className: n,
                style: a,
                children: l,
                placeholder: i = "",
                ...o
            } = e, s = W(K, r), {
                onValueNodeHasChildrenChange: d
            } = s, u = void 0 !== l, m = (0, c.useComposedRefs)(t, s.onValueNodeChange);
            return (0, _.useLayoutEffect)(() => {
                d(u)
            }, [d, u]), (0, P.jsx)(x.Primitive.span, {
                ...o,
                ref: m,
                style: {
                    pointerEvents: "none"
                },
                children: eC(s.value) ? (0, P.jsx)(P.Fragment, {
                    children: i
                }) : l
            })
        });
    Y.displayName = K;
    var $ = i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            children: n,
            ...a
        } = e;
        return (0, P.jsx)(x.Primitive.span, {
            "aria-hidden": !0,
            ...a,
            ref: t,
            children: n || "▼"
        })
    });
    $.displayName = "SelectIcon";
    var z = e => (0, P.jsx)(v.Portal, {
        asChild: !0,
        ...e
    });
    z.displayName = "SelectPortal";
    var q = "SelectContent",
        J = i.forwardRef((e, t) => {
            let r = W(q, e.__scopeSelect),
                [n, a] = i.useState();
            return ((0, _.useLayoutEffect)(() => {
                a(new DocumentFragment)
            }, []), r.open) ? (0, P.jsx)(et, {
                ...e,
                ref: t
            }) : n ? o.createPortal((0, P.jsx)(Z, {
                scope: e.__scopeSelect,
                children: (0, P.jsx)(L.Slot, {
                    scope: e.__scopeSelect,
                    children: (0, P.jsx)("div", {
                        children: e.children
                    })
                })
            }), n) : null
        });
    J.displayName = q;
    var [Z, Q] = O(q), ee = (0, S.createSlot)("SelectContent.RemoveScroll"), et = i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            position: n = "item-aligned",
            onCloseAutoFocus: a,
            onEscapeKeyDown: l,
            onPointerDownOutside: o,
            side: s,
            sideOffset: u,
            align: m,
            alignOffset: p,
            arrowPadding: g,
            collisionBoundary: w,
            collisionPadding: v,
            sticky: x,
            hideWhenDetached: S,
            avoidCollisions: y,
            ...C
        } = e, _ = W(q, r), [T, R] = i.useState(null), [N, I] = i.useState(null), A = (0, c.useComposedRefs)(t, e => R(e)), [L, F] = i.useState(null), [O, G] = i.useState(null), k = M(r), [B, j] = i.useState(!1), H = i.useRef(!1);
        i.useEffect(() => {
            if (T) return (0, U.hideOthers)(T)
        }, [T]), (0, h.useFocusGuards)();
        let V = i.useCallback(e => {
                let [t, ...r] = k().map(e => e.ref.current), [n] = r.slice(-1), a = document.activeElement;
                for (let r of e)
                    if (r === a || (r?.scrollIntoView({
                            block: "nearest"
                        }), r === t && N && (N.scrollTop = 0), r === n && N && (N.scrollTop = N.scrollHeight), r?.focus(), document.activeElement !== a)) return
            }, [k, N]),
            X = i.useCallback(() => V([L, T]), [V, L, T]);
        i.useEffect(() => {
            B && X()
        }, [B, X]);
        let {
            onOpenChange: D,
            triggerPointerDownPosRef: K
        } = _;
        i.useEffect(() => {
            if (T) {
                let e = {
                        x: 0,
                        y: 0
                    },
                    t = t => {
                        e = {
                            x: Math.abs(Math.round(t.pageX) - (K.current?.x ?? 0)),
                            y: Math.abs(Math.round(t.pageY) - (K.current?.y ?? 0))
                        }
                    },
                    r = r => {
                        e.x <= 10 && e.y <= 10 ? r.preventDefault() : T.contains(r.target) || D(!1), document.removeEventListener("pointermove", t), K.current = null
                    };
                return null !== K.current && (document.addEventListener("pointermove", t), document.addEventListener("pointerup", r, {
                    capture: !0,
                    once: !0
                })), () => {
                    document.removeEventListener("pointermove", t), document.removeEventListener("pointerup", r, {
                        capture: !0
                    })
                }
            }
        }, [T, D, K]), i.useEffect(() => {
            let e = () => D(!1);
            return window.addEventListener("blur", e), window.addEventListener("resize", e), () => {
                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
            }
        }, [D]);
        let [Y, $] = eT(e => {
            let t = k().filter(e => !e.disabled),
                r = t.find(e => e.ref.current === document.activeElement),
                n = eP(t, e, r);
            n && setTimeout(() => n.ref.current.focus())
        }), z = i.useCallback((e, t, r) => {
            let n = !H.current && !r;
            (void 0 !== _.value && _.value === t || n) && (F(e), n && (H.current = !0))
        }, [_.value]), J = i.useCallback(() => T?.focus(), [T]), Q = i.useCallback((e, t, r) => {
            let n = !H.current && !r;
            (void 0 !== _.value && _.value === t || n) && G(e)
        }, [_.value]), et = "popper" === n ? en : er, ea = et === en ? {
            side: s,
            sideOffset: u,
            align: m,
            alignOffset: p,
            arrowPadding: g,
            collisionBoundary: w,
            collisionPadding: v,
            sticky: x,
            hideWhenDetached: S,
            avoidCollisions: y
        } : {};
        return (0, P.jsx)(Z, {
            scope: r,
            content: T,
            viewport: N,
            onViewportChange: I,
            itemRefCallback: z,
            selectedItem: L,
            onItemLeave: J,
            itemTextRefCallback: Q,
            focusSelectedItem: X,
            selectedItemText: O,
            position: n,
            isPositioned: B,
            searchRef: Y,
            children: (0, P.jsx)(b.RemoveScroll, {
                as: ee,
                allowPinchZoom: !0,
                children: (0, P.jsx)(E.FocusScope, {
                    asChild: !0,
                    trapped: _.open,
                    onMountAutoFocus: e => {
                        e.preventDefault()
                    },
                    onUnmountAutoFocus: (0, d.composeEventHandlers)(a, e => {
                        _.trigger?.focus({
                            preventScroll: !0
                        }), e.preventDefault()
                    }),
                    children: (0, P.jsx)(f.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !0,
                        onEscapeKeyDown: l,
                        onPointerDownOutside: o,
                        onFocusOutside: e => e.preventDefault(),
                        onDismiss: () => _.onOpenChange(!1),
                        children: (0, P.jsx)(et, {
                            role: "listbox",
                            id: _.contentId,
                            "data-state": _.open ? "open" : "closed",
                            dir: _.dir,
                            onContextMenu: e => e.preventDefault(),
                            ...C,
                            ...ea,
                            onPlaced: () => j(!0),
                            ref: A,
                            style: {
                                display: "flex",
                                flexDirection: "column",
                                outline: "none",
                                ...C.style
                            },
                            onKeyDown: (0, d.composeEventHandlers)(C.onKeyDown, e => {
                                let t = e.ctrlKey || e.altKey || e.metaKey;
                                if ("Tab" === e.key && e.preventDefault(), t || 1 !== e.key.length || $(e.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(e.key)) {
                                    let t = k().filter(e => !e.disabled).map(e => e.ref.current);
                                    if (["ArrowUp", "End"].includes(e.key) && (t = t.slice().reverse()), ["ArrowUp", "ArrowDown"].includes(e.key)) {
                                        let r = e.target,
                                            n = t.indexOf(r);
                                        t = t.slice(n + 1)
                                    }
                                    setTimeout(() => V(t)), e.preventDefault()
                                }
                            })
                        })
                    })
                })
            })
        })
    });
    et.displayName = "SelectContentImpl";
    var er = i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            onPlaced: n,
            ...a
        } = e, l = W(q, r), o = Q(q, r), [d, u] = i.useState(null), [m, p] = i.useState(null), f = (0, c.useComposedRefs)(t, e => p(e)), h = M(r), E = i.useRef(!1), g = i.useRef(!0), {
            viewport: w,
            selectedItem: v,
            selectedItemText: S,
            focusSelectedItem: y
        } = o, C = i.useCallback(() => {
            if (l.trigger && l.valueNode && d && m && w && v && S) {
                let e = l.trigger.getBoundingClientRect(),
                    t = m.getBoundingClientRect(),
                    r = l.valueNode.getBoundingClientRect(),
                    a = S.getBoundingClientRect();
                if ("rtl" !== l.dir) {
                    let n = a.left - t.left,
                        l = r.left - n,
                        i = e.left - l,
                        o = e.width + i,
                        u = Math.max(o, t.width),
                        c = window.innerWidth - 10,
                        m = (0, s.clamp)(l, [10, Math.max(10, c - u)]);
                    d.style.minWidth = o + "px", d.style.left = m + "px"
                } else {
                    let n = t.right - a.right,
                        l = window.innerWidth - r.right - n,
                        i = window.innerWidth - e.right - l,
                        o = e.width + i,
                        u = Math.max(o, t.width),
                        c = window.innerWidth - 10,
                        m = (0, s.clamp)(l, [10, Math.max(10, c - u)]);
                    d.style.minWidth = o + "px", d.style.right = m + "px"
                }
                let i = h(),
                    o = window.innerHeight - 20,
                    u = w.scrollHeight,
                    c = window.getComputedStyle(m),
                    p = parseInt(c.borderTopWidth, 10),
                    f = parseInt(c.paddingTop, 10),
                    g = parseInt(c.borderBottomWidth, 10),
                    x = p + f + u + parseInt(c.paddingBottom, 10) + g,
                    y = Math.min(5 * v.offsetHeight, x),
                    C = window.getComputedStyle(w),
                    _ = parseInt(C.paddingTop, 10),
                    T = parseInt(C.paddingBottom, 10),
                    P = e.top + e.height / 2 - 10,
                    R = v.offsetHeight / 2,
                    U = p + f + (v.offsetTop + R);
                if (U <= P) {
                    let e = i.length > 0 && v === i[i.length - 1].ref.current;
                    d.style.bottom = "0px";
                    let t = Math.max(o - P, R + (e ? T : 0) + (m.clientHeight - w.offsetTop - w.offsetHeight) + g);
                    d.style.height = U + t + "px"
                } else {
                    let e = i.length > 0 && v === i[0].ref.current;
                    d.style.top = "0px";
                    let t = Math.max(P, p + w.offsetTop + (e ? _ : 0) + R);
                    d.style.height = t + (x - U) + "px", w.scrollTop = U - P + w.offsetTop
                }
                d.style.margin = "10px 0", d.style.minHeight = y + "px", d.style.maxHeight = o + "px", n?.(), requestAnimationFrame(() => E.current = !0)
            }
        }, [h, l.trigger, l.valueNode, d, m, w, v, S, l.dir, n]);
        (0, _.useLayoutEffect)(() => C(), [C]);
        let [T, R] = i.useState();
        (0, _.useLayoutEffect)(() => {
            m && R(window.getComputedStyle(m).zIndex)
        }, [m]);
        let U = i.useCallback(e => {
            e && !0 === g.current && (C(), y?.(), g.current = !1)
        }, [C, y]);
        return (0, P.jsx)(ea, {
            scope: r,
            contentWrapper: d,
            shouldExpandOnScrollRef: E,
            onScrollButtonChange: U,
            children: (0, P.jsx)("div", {
                ref: u,
                style: {
                    display: "flex",
                    flexDirection: "column",
                    position: "fixed",
                    zIndex: T
                },
                children: (0, P.jsx)(x.Primitive.div, {
                    ...a,
                    ref: f,
                    style: {
                        boxSizing: "border-box",
                        maxHeight: "100%",
                        ...a.style
                    }
                })
            })
        })
    });
    er.displayName = "SelectItemAlignedPosition";
    var en = i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            align: n = "start",
            collisionPadding: a = 10,
            ...l
        } = e, i = k(r);
        return (0, P.jsx)(w.Content, {
            ...i,
            ...l,
            ref: t,
            align: n,
            collisionPadding: a,
            style: {
                boxSizing: "border-box",
                ...l.style,
                "--radix-select-content-transform-origin": "var(--radix-popper-transform-origin)",
                "--radix-select-content-available-width": "var(--radix-popper-available-width)",
                "--radix-select-content-available-height": "var(--radix-popper-available-height)",
                "--radix-select-trigger-width": "var(--radix-popper-anchor-width)",
                "--radix-select-trigger-height": "var(--radix-popper-anchor-height)"
            }
        })
    });
    en.displayName = "SelectPopperPosition";
    var [ea, el] = O(q, {}), ei = "SelectViewport", eo = i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            nonce: n,
            ...a
        } = e, l = Q(ei, r), o = el(ei, r), s = (0, c.useComposedRefs)(t, l.onViewportChange), u = i.useRef(0);
        return (0, P.jsxs)(P.Fragment, {
            children: [(0, P.jsx)("style", {
                dangerouslySetInnerHTML: {
                    __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                },
                nonce: n
            }), (0, P.jsx)(L.Slot, {
                scope: r,
                children: (0, P.jsx)(x.Primitive.div, {
                    "data-radix-select-viewport": "",
                    role: "presentation",
                    ...a,
                    ref: s,
                    style: {
                        position: "relative",
                        flex: 1,
                        overflow: "hidden auto",
                        ...a.style
                    },
                    onScroll: (0, d.composeEventHandlers)(a.onScroll, e => {
                        let t = e.currentTarget,
                            {
                                contentWrapper: r,
                                shouldExpandOnScrollRef: n
                            } = o;
                        if (n?.current && r) {
                            let e = Math.abs(u.current - t.scrollTop);
                            if (e > 0) {
                                let n = window.innerHeight - 20,
                                    a = Math.max(parseFloat(r.style.minHeight), parseFloat(r.style.height));
                                if (a < n) {
                                    let l = a + e,
                                        i = Math.min(n, l),
                                        o = l - i;
                                    r.style.height = i + "px", "0px" === r.style.bottom && (t.scrollTop = o > 0 ? o : 0, r.style.justifyContent = "flex-end")
                                }
                            }
                        }
                        u.current = t.scrollTop
                    })
                })
            })]
        })
    });
    eo.displayName = ei;
    var es = "SelectGroup",
        [ed, eu] = O(es);
    i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, a = (0, g.useId)();
        return (0, P.jsx)(ed, {
            scope: r,
            id: a,
            children: (0, P.jsx)(x.Primitive.div, {
                role: "group",
                "aria-labelledby": a,
                ...n,
                ref: t
            })
        })
    }).displayName = es;
    var ec = "SelectLabel";
    i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, a = eu(ec, r);
        return (0, P.jsx)(x.Primitive.div, {
            id: a.id,
            ...n,
            ref: t
        })
    }).displayName = ec;
    var em = "SelectItem",
        [ep, ef] = O(em),
        eh = i.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                value: n,
                disabled: a = !1,
                textValue: l,
                ...o
            } = e, s = W(em, r), u = Q(em, r), m = s.value === n, [p, f] = i.useState(l ?? ""), [h, E] = i.useState(!1), w = (0, c.useComposedRefs)(t, e => u.itemRefCallback?.(e, n, a)), v = (0, g.useId)(), S = i.useRef("touch"), y = () => {
                a || (s.onValueChange(n), s.onOpenChange(!1))
            };
            if ("" === n) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
            return (0, P.jsx)(ep, {
                scope: r,
                value: n,
                disabled: a,
                textId: v,
                isSelected: m,
                onItemTextChange: i.useCallback(e => {
                    f(t => t || (e?.textContent ?? "").trim())
                }, []),
                children: (0, P.jsx)(L.ItemSlot, {
                    scope: r,
                    value: n,
                    disabled: a,
                    textValue: p,
                    children: (0, P.jsx)(x.Primitive.div, {
                        role: "option",
                        "aria-labelledby": v,
                        "data-highlighted": h ? "" : void 0,
                        "aria-selected": m && h,
                        "data-state": m ? "checked" : "unchecked",
                        "aria-disabled": a || void 0,
                        "data-disabled": a ? "" : void 0,
                        tabIndex: a ? void 0 : -1,
                        ...o,
                        ref: w,
                        onFocus: (0, d.composeEventHandlers)(o.onFocus, () => E(!0)),
                        onBlur: (0, d.composeEventHandlers)(o.onBlur, () => E(!1)),
                        onClick: (0, d.composeEventHandlers)(o.onClick, () => {
                            "mouse" !== S.current && y()
                        }),
                        onPointerUp: (0, d.composeEventHandlers)(o.onPointerUp, () => {
                            "mouse" === S.current && y()
                        }),
                        onPointerDown: (0, d.composeEventHandlers)(o.onPointerDown, e => {
                            S.current = e.pointerType
                        }),
                        onPointerMove: (0, d.composeEventHandlers)(o.onPointerMove, e => {
                            S.current = e.pointerType, a ? u.onItemLeave?.() : "mouse" === S.current && e.currentTarget.focus({
                                preventScroll: !0
                            })
                        }),
                        onPointerLeave: (0, d.composeEventHandlers)(o.onPointerLeave, e => {
                            e.currentTarget === document.activeElement && u.onItemLeave?.()
                        }),
                        onKeyDown: (0, d.composeEventHandlers)(o.onKeyDown, e => {
                            (u.searchRef?.current === "" || " " !== e.key) && (I.includes(e.key) && y(), " " === e.key && e.preventDefault())
                        })
                    })
                })
            })
        });
    eh.displayName = em;
    var eE = "SelectItemText",
        eg = i.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                className: n,
                style: a,
                ...l
            } = e, s = W(eE, r), d = Q(eE, r), u = ef(eE, r), m = H(eE, r), [p, f] = i.useState(null), h = (0, c.useComposedRefs)(t, e => f(e), u.onItemTextChange, e => d.itemTextRefCallback?.(e, u.value, u.disabled)), E = p?.textContent, g = i.useMemo(() => (0, P.jsx)("option", {
                value: u.value,
                disabled: u.disabled,
                children: E
            }, u.value), [u.disabled, u.value, E]), {
                onNativeOptionAdd: w,
                onNativeOptionRemove: v
            } = m;
            return (0, _.useLayoutEffect)(() => (w(g), () => v(g)), [w, v, g]), (0, P.jsxs)(P.Fragment, {
                children: [(0, P.jsx)(x.Primitive.span, {
                    id: u.textId,
                    ...l,
                    ref: h
                }), u.isSelected && s.valueNode && !s.valueNodeHasChildren ? o.createPortal(l.children, s.valueNode) : null]
            })
        });
    eg.displayName = eE;
    var ew = "SelectItemIndicator";
    i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e;
        return ef(ew, r).isSelected ? (0, P.jsx)(x.Primitive.span, {
            "aria-hidden": !0,
            ...n,
            ref: t
        }) : null
    }).displayName = ew;
    var ev = "SelectScrollUpButton";
    i.forwardRef((e, t) => {
        let r = Q(ev, e.__scopeSelect),
            n = el(ev, e.__scopeSelect),
            [a, l] = i.useState(!1),
            o = (0, c.useComposedRefs)(t, n.onScrollButtonChange);
        return (0, _.useLayoutEffect)(() => {
            if (r.viewport && r.isPositioned) {
                let e = function() {
                        l(t.scrollTop > 0)
                    },
                    t = r.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [r.viewport, r.isPositioned]), a ? (0, P.jsx)(eS, {
            ...e,
            ref: o,
            onAutoScroll: () => {
                let {
                    viewport: e,
                    selectedItem: t
                } = r;
                e && t && (e.scrollTop = e.scrollTop - t.offsetHeight)
            }
        }) : null
    }).displayName = ev;
    var ex = "SelectScrollDownButton";
    i.forwardRef((e, t) => {
        let r = Q(ex, e.__scopeSelect),
            n = el(ex, e.__scopeSelect),
            [a, l] = i.useState(!1),
            o = (0, c.useComposedRefs)(t, n.onScrollButtonChange);
        return (0, _.useLayoutEffect)(() => {
            if (r.viewport && r.isPositioned) {
                let e = function() {
                        let e = t.scrollHeight - t.clientHeight;
                        l(Math.ceil(t.scrollTop) < e)
                    },
                    t = r.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [r.viewport, r.isPositioned]), a ? (0, P.jsx)(eS, {
            ...e,
            ref: o,
            onAutoScroll: () => {
                let {
                    viewport: e,
                    selectedItem: t
                } = r;
                e && t && (e.scrollTop = e.scrollTop + t.offsetHeight)
            }
        }) : null
    }).displayName = ex;
    var eS = i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            onAutoScroll: n,
            ...a
        } = e, l = Q("SelectScrollButton", r), o = i.useRef(null), s = M(r), u = i.useCallback(() => {
            null !== o.current && (window.clearInterval(o.current), o.current = null)
        }, []);
        return i.useEffect(() => () => u(), [u]), (0, _.useLayoutEffect)(() => {
            let e = s().find(e => e.ref.current === document.activeElement);
            e?.ref.current?.scrollIntoView({
                block: "nearest"
            })
        }, [s]), (0, P.jsx)(x.Primitive.div, {
            "aria-hidden": !0,
            ...a,
            ref: t,
            style: {
                flexShrink: 0,
                ...a.style
            },
            onPointerDown: (0, d.composeEventHandlers)(a.onPointerDown, () => {
                null === o.current && (o.current = window.setInterval(n, 50))
            }),
            onPointerMove: (0, d.composeEventHandlers)(a.onPointerMove, () => {
                l.onItemLeave?.(), null === o.current && (o.current = window.setInterval(n, 50))
            }),
            onPointerLeave: (0, d.composeEventHandlers)(a.onPointerLeave, () => {
                u()
            })
        })
    });
    i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e;
        return (0, P.jsx)(x.Primitive.div, {
            "aria-hidden": !0,
            ...n,
            ref: t
        })
    }).displayName = "SelectSeparator";
    var ey = "SelectArrow";

    function eC(e) {
        return "" === e || void 0 === e
    }
    i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, a = k(r), l = W(ey, r), i = Q(ey, r);
        return l.open && "popper" === i.position ? (0, P.jsx)(w.Arrow, {
            ...a,
            ...n,
            ref: t
        }) : null
    }).displayName = ey;
    var e_ = i.forwardRef((e, t) => {
        let {
            value: r,
            ...n
        } = e, a = i.useRef(null), l = (0, c.useComposedRefs)(t, a), o = (0, T.usePrevious)(r);
        return i.useEffect(() => {
            let e = a.current,
                t = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
            if (o !== r && t) {
                let n = new Event("change", {
                    bubbles: !0
                });
                t.call(e, r), e.dispatchEvent(n)
            }
        }, [o, r]), (0, P.jsx)(R, {
            asChild: !0,
            children: (0, P.jsx)("select", {
                ...n,
                ref: l,
                defaultValue: r
            })
        })
    });

    function eT(e) {
        let t = (0, y.useCallbackRef)(e),
            r = i.useRef(""),
            n = i.useRef(0),
            a = i.useCallback(e => {
                let a = r.current + e;
                t(a),
                    function e(t) {
                        r.current = t, window.clearTimeout(n.current), "" !== t && (n.current = window.setTimeout(() => e(""), 1e3))
                    }(a)
            }, [t]),
            l = i.useCallback(() => {
                r.current = "", window.clearTimeout(n.current)
            }, []);
        return i.useEffect(() => () => window.clearTimeout(n.current), []), [r, a, l]
    }

    function eP(e, t, r) {
        var n, a;
        let l = t.length > 1 && Array.from(t).every(e => e === t[0]) ? t[0] : t,
            i = r ? e.indexOf(r) : -1,
            o = (n = e, a = Math.max(i, 0), n.map((e, t) => n[(a + t) % n.length]));
        1 === l.length && (o = o.filter(e => e !== r));
        let s = o.find(e => e.textValue.toLowerCase().startsWith(l.toLowerCase()));
        return s !== r ? s : void 0
    }
    e_.displayName = "BubbleSelect";
    let eR = (0, i.createContext)(null),
        eU = {
            XSmall: "size-300",
            Small: "size-400",
            Medium: "size-500",
            Large: "size-600"
        },
        eb = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        eN = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        eI = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        eA = {
            XSmall: "gap-xsmall",
            Small: "gap-small",
            Medium: "gap-small",
            Large: "gap-small"
        },
        eL = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        eM = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        eF = (0, i.forwardRef)((e, o) => {
            let {
                label: s,
                labelTooltip: d,
                ariaLabelledBy: u,
                ariaLabel: c,
                className: m,
                size: p,
                variant: f = "Standard",
                value: h,
                placeholder: E,
                isDisabled: g,
                hasError: w,
                hint: v,
                onValueChange: x,
                onOpenChange: S,
                children: y
            } = e, C = (0, r.default)(), _ = (0, i.useMemo)(() => ({
                size: p
            }), [p]), T = s ? i.default.createElement("span", {
                id: C,
                className: (0, l.default)(eN[p], "content-emphasis")
            }, s) : null;
            return i.default.createElement(eR.Provider, {
                value: _
            }, i.default.createElement("div", {
                className: (0, l.default)("flex flex-col", g && ["opacity-[0.5]", "pointer-events-none"], eA[p], m)
            }, T && (d ? i.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, T, i.default.createElement(n.LabelTooltip, d)) : T), i.default.createElement(V, {
                value: h,
                disabled: g,
                onValueChange: x,
                onOpenChange: S
            }, i.default.createElement(D, {
                className: (0, l.default)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", a.INPUT_BACKGROUND_BY_VARIANT[f], a.INPUT_STROKE_BY_VARIANT[f], eL[p], eM[p], eb[p], eI[p], w ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === h ? "content-muted" : "content-default"),
                ref: o,
                "aria-labelledby": s ? C : u,
                "aria-label": c
            }, i.default.createElement(t.StateLayer, null), i.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, i.default.createElement(Y, {
                placeholder: E
            })), i.default.createElement($, {
                className: (0, l.default)(eU[p], "icon icon-regular-chevron-large-down content-default")
            })), i.default.createElement(z, null, i.default.createElement(J, {
                position: "popper",
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, y))), v && i.default.createElement("span", {
                className: (0, l.default)("text-caption-small", {
                    "content-system-alert": w,
                    "content-default": !w
                })
            }, v)))
        });
    eF.displayName = "Dropdown", e.s(["Dropdown", 0, eF, "DropdownContext", 0, eR], 713633);
    var eO = e.i(919403),
        eG = e.i(206983);
    let ek = {
            XSmall: "radius-medium",
            Small: "radius-large",
            Medium: "radius-large",
            Large: "radius-large"
        },
        eB = {
            XSmall: "padding-xsmall",
            Small: "padding-small",
            Medium: "padding-small",
            Large: "padding-small"
        },
        eW = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        ej = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-medium"
        },
        eH = {
            XSmall: "gap-x-medium",
            Small: "gap-x-medium",
            Medium: "gap-x-medium",
            Large: "gap-x-large"
        },
        eV = {
            XSmall: "gap-y-xxsmall",
            Small: "gap-y-xxsmall",
            Medium: "gap-y-xsmall",
            Large: "gap-y-xsmall"
        },
        eX = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        eD = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        eK = (0, i.createContext)(null),
        eY = () => {
            let e = (0, i.useContext)(eK);
            if (!e) throw Error("Menu components must be used within a Menu");
            return e
        };
    e.s(["Menu", 0, e => {
        let {
            children: t,
            className: r,
            size: n
        } = e, a = (0, i.useContext)(eR), o = a ? "dropdown" : "standalone", s = n ?? a?.size ?? "Medium", d = (0, i.useMemo)(() => ({
            size: s,
            mode: o
        }), [s, o]), u = (0, l.default)("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", ek[s], r), c = "standalone" === o ? i.default.createElement(eG.Root, {
            asChild: !0,
            orientation: "vertical",
            loop: !0
        }, i.default.createElement("div", {
            role: "menu",
            tabIndex: -1,
            className: u
        }, t)) : i.default.createElement("div", {
            className: u
        }, t);
        return i.default.createElement(eK.Provider, {
            value: d
        }, "dropdown" === o ? i.default.createElement(eo, {
            asChild: !0,
            style: {
                width: "var(--radix-popper-anchor-width)"
            }
        }, c) : c)
    }, "MenuItem", 0, e => {
        let r, {
                value: n,
                leading: a,
                title: o,
                description: s,
                trailing: d,
                disabled: u,
                className: c,
                onSelect: m,
                asChild: p,
                children: f,
                ...h
            } = e,
            {
                size: E,
                mode: g
            } = eY(),
            w = (0, l.default)(t.interactable, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", eX[E], eW[E], ej[E], eH[E], eD[E], u && "opacity-[0.5]", u && "pointer-events-none", c),
            v = i.default.createElement("span", {
                className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
            }, o);
        switch (g) {
            case "dropdown":
                v = i.default.createElement(eg, {
                    asChild: !0
                }, v);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", g)
        }
        let x = i.default.createElement(i.default.Fragment, null, !u && i.default.createElement(t.StateLayer, null), a, i.default.createElement("div", {
            className: (0, l.default)("grow-1 text-truncate-split flex flex-col", eV[E])
        }, v, s && i.default.createElement("div", {
            className: "foundation-web-menu-item-description content-muted"
        }, s)), d);
        if (p) {
            let {
                as: e,
                ...n
            } = h, a = i.default.Children.only(f), l = void 0 === o && a.props.children;
            r = i.default.createElement(eO.Slot, {
                ...n,
                role: "standalone" === g ? "menuitem" : void 0,
                "aria-disabled": u || void 0,
                className: w,
                style: {
                    outlineOffset: 0
                },
                onClick: u ? void 0 : m
            }, l ? i.default.cloneElement(a, {}, i.default.createElement(i.default.Fragment, null, !u && i.default.createElement(t.StateLayer, null), a.props.children)) : i.default.cloneElement(a, {}, x))
        } else if ("a" === h.as) {
            let {
                as: e,
                href: t,
                ...n
            } = h;
            r = i.default.createElement("a", {
                ...n,
                role: "standalone" === g ? "menuitem" : void 0,
                "aria-disabled": u,
                href: u ? void 0 : t,
                className: w,
                style: {
                    outlineOffset: 0,
                    textDecoration: "none"
                },
                onClick: u ? void 0 : m
            }, x)
        } else {
            let {
                as: e,
                ...t
            } = h;
            r = i.default.createElement("button", {
                type: "button",
                ...t,
                role: "standalone" === g ? "menuitem" : void 0,
                "aria-disabled": u,
                className: w,
                style: {
                    outlineOffset: 0
                },
                onClick: u ? void 0 : m
            }, x)
        }
        return "dropdown" === g ? i.default.createElement(eh, {
            value: n,
            disabled: u,
            asChild: !0
        }, r) : i.default.createElement(eG.Item, {
            asChild: !0,
            focusable: !0,
            tabStopId: n
        }, r)
    }, "MenuLabel", 0, e => {
        let {
            title: t,
            description: r,
            leading: n,
            trailing: a,
            disabled: o,
            className: s
        } = e, {
            size: d
        } = eY(), u = (0, l.default)("foundation-web-menu-label flex items-center content-default text-truncate-split text-align-x-left width-full", eX[d], eW[d], ej[d], eH[d], o && "opacity-[0.5]", s);
        return i.default.createElement("div", {
            role: "none",
            className: u
        }, n, i.default.createElement("div", {
            className: (0, l.default)("grow-1 text-truncate-split flex flex-col", eV[d])
        }, i.default.createElement("span", {
            className: "foundation-web-menu-label-title text-no-wrap text-truncate-split content-emphasis"
        }, t), r && i.default.createElement("div", {
            className: "foundation-web-menu-label-description content-muted"
        }, r)), a)
    }, "MenuSection", 0, e => {
        let {
            children: t,
            className: r
        } = e, {
            size: n
        } = eY();
        return i.default.createElement("div", {
            role: "group",
            className: (0, l.default)(eB[n], r)
        }, t)
    }, "MenuSeparator", 0, e => {
        let {
            className: t
        } = e;
        return i.default.createElement("div", {
            role: "separator",
            className: (0, l.default)("foundation-web-menu-separator", t)
        })
    }], 726799)
}, 380688, e => {
    "use strict";
    var t = e.i(809804),
        r = e.i(371847);
    let n = "__FN_nvfToKPAOuiV__",
        a = RegExp(`${n}(\\d+)\\|`);
    e.s(["translateHtml", 0, (e, l, i, o) => {
        let s = {
                ...o
            },
            d = {};
        i?.forEach((e, t) => {
            let r = t.toString(),
                a = `${n}${r}|`,
                l = `__FN_END_nvfToKPAOuiV__${r}|`;
            s[e.opening] = a, s[e.closing] = l, d[r] = {
                start: a,
                end: l,
                render: e.render,
                used: !1
            }
        });
        let u = e(l, s),
            c = e => {
                let t = [],
                    r = a.exec(e);
                if (!r) return [e];
                r.index > 0 && t.push(e.slice(0, r.index));
                let n = r[1] && d[r[1]];
                if (!n) return console.warn("Unexpected malformed segment", l), [];
                n.used = !0;
                let i = e.indexOf(n.end);
                if (-1 === i) return console.warn("Unexpected malformed segment", l), [];
                let o = e.slice(r.index + r[0].length, i),
                    s = n.render(c(o));
                Array.isArray(s) ? t.push(...s) : t.push(s);
                let u = e.slice(i + n.end.length);
                return u.length > 0 && t.push(...c(u)), t
            },
            m = c(u).filter(e => "" !== e);
        return Object.values(d).some(e => !e.used) ? (console.warn("Unused segments found", l), []) : m.map((e, n) => (0, t.jsx)(r.Fragment, {
            children: e
        }, n))
    }], 380688)
}]);

//# debugId=01c124ae-4ed9-db8c-cbb0-7161a2981236
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0u6y5x0bo31iw.js.map