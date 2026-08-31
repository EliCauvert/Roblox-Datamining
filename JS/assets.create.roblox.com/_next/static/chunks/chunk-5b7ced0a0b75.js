;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "db5984d9-4db2-94cb-2f6d-c4b858f5c097")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 97782, t => {
    "use strict";
    var n = t.i(730530),
        a = t.i(881670);
    let i = {
            path: "/monetization/overview",
            pathPattern: /\/monetization\/overview/,
            title: (0, n.translationKey)("Heading.Monetization", a.TranslationNamespace.Analytics)
        },
        r = {
            path: "/dashboard/analytics",
            pathPattern: /\/dashboard\/analytics/,
            title: (0, n.translationKey)("Heading.Analytics", a.TranslationNamespace.Navigation)
        },
        o = {
            path: "/experiments",
            pathPattern: /\/experiments(?!\/)/,
            title: (0, n.translationKey)("Heading.Experiments", a.TranslationNamespace.Navigation)
        },
        l = {
            path: "/monetization/developer-products",
            pathPattern: /\/monetization\/developer-products/,
            title: (0, n.translationKey)("Label.DeveloperProducts", a.TranslationNamespace.Navigation),
            group: i
        },
        s = {
            path: "/monetization/passes",
            pathPattern: /\/monetization\/passes/,
            title: (0, n.translationKey)("Label.GamePasses", a.TranslationNamespace.Navigation),
            group: i
        },
        c = {
            path: "/monetization/avatar-items",
            pathPattern: /\/monetization\/avatar-items/,
            title: (0, n.translationKey)("Label.ThirdPartyAvatarItemCommissions", a.TranslationNamespace.Navigation),
            group: i
        },
        u = {
            path: "/creations/catalog",
            pathPattern: /\/creations\/catalog/,
            title: (0, n.translationKey)("Heading.ItemAnalytics", a.TranslationNamespace.Analytics)
        },
        d = {
            path: "/monetization/immersive-ads",
            pathPattern: /\/monetization\/immersive-ads/,
            title: (0, n.translationKey)("Heading.Ads", a.TranslationNamespace.Navigation),
            group: i
        },
        p = {
            path: "/monetization/subscriptions",
            pathPattern: /\/monetization\/subscriptions/,
            title: (0, n.translationKey)("Heading.Subscriptions", a.TranslationNamespace.Navigation),
            group: i
        },
        f = {
            path: "/analytics/memory-stores",
            pathPattern: /\/analytics\/memory-stores/,
            title: (0, n.translationKey)("Heading.MemoryStores", a.TranslationNamespace.Navigation)
        },
        m = {
            path: "/analytics/data-stores",
            pathPattern: /\/analytics\/data-stores/,
            title: (0, n.translationKey)("Heading.DataStores", a.TranslationNamespace.Navigation)
        },
        v = {
            path: "/analytics/http-service",
            pathPattern: /\/analytics\/http-service/,
            title: (0, n.translationKey)("Heading.HttpService", a.TranslationNamespace.Navigation)
        },
        g = {
            path: "/analytics/messaging-service",
            pathPattern: /\/analytics\/messaging-service/,
            title: (0, n.translationKey)("Heading.MessagingService", a.TranslationNamespace.Navigation)
        },
        y = {
            path: "/analytics/speech-to-text",
            pathPattern: /\/analytics\/speech-to-text/,
            title: (0, n.translationKey)("Heading.SpeechToText", a.TranslationNamespace.Navigation)
        },
        h = {
            path: "/analytics/text-to-speech",
            pathPattern: /\/analytics\/text-to-speech/,
            title: (0, n.translationKey)("Heading.TextToSpeech", a.TranslationNamespace.Navigation)
        },
        N = {
            path: "/analytics/video-service",
            pathPattern: /\/analytics\/video-service/,
            title: (0, n.translationKey)("Heading.VideoService", a.TranslationNamespace.Navigation)
        },
        b = {
            path: "/monetization/creator-rewards",
            pathPattern: /\/monetization\/creator-rewards/,
            title: (0, n.translationKey)("Heading.CreatorRewards", a.TranslationNamespace.Navigation),
            group: i
        },
        E = {
            path: "/monetization/roblox-plus",
            pathPattern: /\/monetization\/roblox-plus/,
            title: (0, n.translationKey)("Heading.RobloxPlusDeveloperProgram", a.TranslationNamespace.Navigation),
            group: i
        },
        w = {
            path: "/analytics/performance",
            pathPattern: /\/analytics\/performance/,
            title: (0, n.translationKey)("Heading.Performance", a.TranslationNamespace.Navigation)
        },
        C = {
            path: "/analytics/crashes",
            pathPattern: /\/analytics\/crashes/,
            title: (0, n.translationKey)("Heading.Crashes", a.TranslationNamespace.Analytics)
        },
        P = {
            path: "/analytics/errors",
            pathPattern: /\/analytics\/errors/,
            title: (0, n.translationKey)("Heading.ErrorReport", a.TranslationNamespace.Navigation)
        },
        x = {
            path: "/analytics/audience",
            pathPattern: /\/analytics\/audience/,
            title: (0, n.translationKey)("Heading.Demographics", a.TranslationNamespace.Navigation)
        },
        T = {
            path: "/analytics/economy",
            pathPattern: /\/analytics\/economy/,
            title: (0, n.translationKey)("Heading.Economy", a.TranslationNamespace.Navigation)
        },
        I = {
            path: "/analytics/funnels",
            pathPattern: /\/analytics\/funnels/,
            title: (0, n.translationKey)("Heading.Funnels", a.TranslationNamespace.Navigation)
        },
        R = {
            path: "/analytics/explore",
            pathPattern: /\/analytics\/explore/,
            title: (0, n.translationKey)("Heading.Explore", a.TranslationNamespace.Navigation)
        },
        S = {
            path: "/analytics/dashboards",
            pathPattern: /\/analytics\/dashboards/,
            title: (0, n.translationKey)("Heading.CustomDashboards", a.TranslationNamespace.Navigation)
        },
        A = {
            path: "/analytics/retention",
            pathPattern: /\/analytics\/retention/,
            title: (0, n.translationKey)("Heading.Retention", a.TranslationNamespace.Navigation)
        },
        D = {
            path: "/analytics/engagement",
            pathPattern: /\/analytics\/engagement/,
            title: (0, n.translationKey)("Heading.Engagement", a.TranslationNamespace.Navigation)
        },
        M = {
            path: "/analytics/acquisition",
            pathPattern: /\/analytics\/acquisition/,
            title: (0, n.translationKey)("Heading.Acquisition", a.TranslationNamespace.Navigation),
            group: r
        },
        H = {
            path: "/analytics/acquisition?tab=homeRecommendations",
            pathPattern: /\/analytics\/acquisition\?tab=homeRecommendations/,
            title: (0, n.translationKey)("Heading.Acquisition", a.TranslationNamespace.Navigation),
            group: r
        },
        K = {
            path: "/analytics/custom",
            pathPattern: /\/analytics\/custom/,
            title: (0, n.translationKey)("Heading.CustomEvents", a.TranslationNamespace.Navigation)
        },
        k = {
            path: "/analytics/journeys",
            pathPattern: /\/analytics\/journeys/,
            title: (0, n.translationKey)("Heading.Journeys", a.TranslationNamespace.Navigation)
        },
        O = {
            path: "/analytics/journeys/create",
            pathPattern: /\/analytics\/journeys\/create/,
            title: (0, n.translationKey)("Heading.JourneyEventsConfigCreate", a.TranslationNamespace.Navigation)
        },
        j = {
            path: "/analytics/journeys/edit",
            pathPattern: /\/analytics\/journeys\/edit/,
            title: (0, n.translationKey)("Heading.JourneyEventsConfigCreate", a.TranslationNamespace.Navigation)
        },
        L = {
            path: "/analytics/journeys/view",
            pathPattern: /\/analytics\/journeys\/view/,
            title: (0, n.translationKey)("Heading.Journeys", a.TranslationNamespace.Navigation)
        },
        F = {
            path: "/feedback",
            pathPattern: /\/feedback/,
            title: (0, n.translationKey)("Heading.Feedback", a.TranslationNamespace.PlayerFeedback)
        },
        _ = {
            path: "/configs/history",
            pathPattern: /\/configs\/history/,
            title: (0, n.translationKey)("Heading.ConfigsHistory", a.TranslationNamespace.Navigation),
            titleOverrideForIAM2: (0, n.translationKey)("Heading.ConfigHistory", a.TranslationNamespace.Navigation)
        },
        W = {
            path: "/configs",
            pathPattern: /\/configs(?!\/)/,
            title: (0, n.translationKey)("Heading.Configs", a.TranslationNamespace.Navigation)
        },
        z = {
            path: "/configs/config-create",
            pathPattern: /\/configs\/config-create/,
            title: (0, n.translationKey)("Heading.ConfigCreate", a.TranslationNamespace.Navigation)
        },
        B = {
            path: "/alerts",
            pathPattern: /\/alerts(?!\/)/,
            title: (0, n.translationKey)("Heading.Alerts", a.TranslationNamespace.Navigation)
        },
        V = {
            path: "/alerts/create",
            pathPattern: /\/alerts\/create/,
            title: (0, n.translationKey)("Heading.CreateAlert", a.TranslationNamespace.ExperienceAlerts)
        },
        G = {
            path: "/alerts",
            pathPattern: /\/alerts\/\d+\/configure$/,
            title: (0, n.translationKey)("Heading.ConfigureAlert", a.TranslationNamespace.Navigation)
        },
        q = {
            path: "/matchmaking",
            pathPattern: /\/matchmaking/,
            title: (0, n.translationKey)("Heading.CustomMatchmaking", a.TranslationNamespace.Matchmaking)
        },
        U = {
            path: "/monetization/commerce",
            pathPattern: /\/monetization\/commerce/,
            title: (0, n.translationKey)("Heading.Commerce", a.TranslationNamespace.Navigation),
            group: i
        },
        J = {
            path: "/analytics/assistant",
            pathPattern: /\/analytics\/assistant/,
            title: (0, n.translationKey)("Heading.Assistant", a.TranslationNamespace.Analytics)
        },
        Z = {
            path: "/analytics/agent",
            pathPattern: /\/analytics\/agent/,
            title: (0, n.translationKey)("Heading.Assistant", a.TranslationNamespace.Analytics)
        },
        X = {
            path: "/analytics/ai-chat",
            pathPattern: /\/analytics\/ai-chat/,
            title: (0, n.translationKey)("Heading.Assistant", a.TranslationNamespace.Analytics)
        },
        Y = {
            path: "/experiments/experiment-create",
            pathPattern: /\/experiments\/experiment-create/,
            title: (0, n.translationKey)("Heading.ExperimentsCreate", a.TranslationNamespace.Navigation),
            titleOverrideForIAM2: (0, n.translationKeyWithoutNamespace)("Heading.Experimentation"),
            group: o
        },
        $ = {
            path: "/recommendation-service",
            pathPattern: /\/recommendation-service/,
            title: (0, n.translationKey)("Heading.RecommendationService", a.TranslationNamespace.Navigation)
        },
        Q = {
            path: "/safety/overview",
            pathPattern: /\/safety\/overview/,
            title: (0, n.translationKey)("Heading.SafetyOverview", a.TranslationNamespace.Analytics),
            titleOverrideForIAM2: (0, n.translationKey)("Heading.Safety", a.TranslationNamespace.Navigation)
        },
        ee = {
            path: "/overview",
            pathPattern: /\/overview(?![/\w])/,
            title: (0, n.translationKey)("Heading.Overview", a.TranslationNamespace.Navigation)
        },
        et = {
            path: "/thumbnails",
            pathPattern: /\/places\/\d+\/thumbnails$/,
            title: (0, n.translationKey)("Heading.Thumbnails", a.TranslationNamespace.Navigation)
        },
        en = {
            path: "/notifications",
            pathPattern: /\/notifications/,
            title: (0, n.translationKey)("Heading.Notifications", a.TranslationNamespace.Navigation)
        },
        ea = {
            path: "/experience-subscriptions",
            pathPattern: /\/experience-subscriptions/,
            title: (0, n.translationKey)("Heading.Subscriptions", a.TranslationNamespace.Navigation),
            group: i
        },
        ei = {
            path: "/analytics/generative-ai",
            pathPattern: /\/analytics\/generative-ai/,
            title: (0, n.translationKey)("Heading.GenerativeAI", a.TranslationNamespace.Navigation)
        },
        er = {
            path: "/monetization/avatar-creation-tokens",
            pathPattern: /\/monetization\/avatar-creation-tokens/,
            title: (0, n.translationKey)("Heading.AvatarCreationTokens", a.TranslationNamespace.AvatarAnalytics),
            titleOverrideForIAM2: (0, n.translationKey)("Heading.AvatarCreationTokens", a.TranslationNamespace.Navigation),
            group: i
        },
        eo = [H, M, D, A, i, l, s, c, u, d, p, f, m, v, g, y, h, N, ei, b, E, w, C, P, x, T, I, k, O, j, L, R, S, K, J, Z, X, F, _, W, z, q, U, Q, ee, r, o, Y, $, et, en, ea, V, G, B, er];
    t.s(["analyticsAgentNavigationItem", 0, Z, "analyticsAiChatNavigationItem", 0, X, "analyticsAlertConfifurationNavigationItem", 0, G, "analyticsAlertCreationNavigationItem", 0, V, "analyticsAlertsNavigationItem", 0, B, "analyticsAnalyticsHomeNavigationItem", 0, r, "analyticsAssistantNavigationItem", 0, J, "analyticsAudienceNavigationItem", 0, x, "analyticsAvatarCreationTokensNavigationItem", 0, er, "analyticsBountyPayoutsNavigationItem", 0, E, "analyticsCommerceNavigationItem", 0, U, "analyticsConfigsHistoryNavigationItem", 0, _, "analyticsConfigsNavigationItem", 0, W, "analyticsCrashesNavigationItem", 0, C, "analyticsCreationOverviewNavigationItem", 0, ee, "analyticsCustomDashboardsManageNavigationItem", 0, S, "analyticsCustomEventsNavigationItem", 0, K, "analyticsDataStoresNavigationItem", 0, m, "analyticsEngagementNavigationItem", 0, D, "analyticsErrorReportNavigationItem", 0, P, "analyticsExperienceCreatorRewardsNavigationItem", 0, b, "analyticsExperienceSubscriptionsNavigationItem", 0, ea, "analyticsExperimentsCreateNavigationItem", 0, Y, "analyticsExperimentsNavigationItem", 0, o, "analyticsExploreNavigationItem", 0, R, "analyticsFeedbackNavigationItem", 0, F, "analyticsGenerativeAINavigationItem", 0, ei, "analyticsHttpServiceNavigationItem", 0, v, "analyticsImmersiveAdsNavigationItem", 0, d, "analyticsItemMonetizationAvatarItemsNavigationItem", 0, c, "analyticsItemMonetizationDeveloperProductsNavigationItem", 0, l, "analyticsItemMonetizationPassesNavigationItem", 0, s, "analyticsMatchmakingNavigationItem", 0, q, "analyticsMemoryStoresNavigationItem", 0, f, "analyticsMessagingServiceNavigationItem", 0, g, "analyticsMonetizationNavigationItem", 0, i, "analyticsNotificationsNavigationItem", 0, en, "analyticsPerformanceNavigationItem", 0, w, "analyticsRecommendationServiceNavigationItem", 0, $, "analyticsRecommendedEventsEconomyNavigationItem", 0, T, "analyticsRecommendedEventsFunnelsNavigationItem", 0, I, "analyticsRecommendedEventsJourneyCreateNavigationItem", 0, O, "analyticsRecommendedEventsJourneyEditNavigationItem", 0, j, "analyticsRecommendedEventsJourneyNavigationItem", 0, k, "analyticsRecommendedEventsJourneyViewNavigationItem", 0, L, "analyticsRetentionNavigationItem", 0, A, "analyticsSafetyNavigationItem", 0, Q, "analyticsSpeechToTextNavigationItem", 0, y, "analyticsSubscriptionsNavigationItem", 0, p, "analyticsTextToSpeechNavigationItem", 0, h, "analyticsUserAcquisitionNavigationItem", 0, M, "analyticsVideoServiceNavigationItem", 0, N, "getAnalyticsNavigationItemFromPath", 0, function(t) {
        return eo.find(n => n.pathPattern.test(t))
    }])
}, 533968, t => {
    "use strict";
    var n = t.i(185915);
    t.s(["getResponseFromError", () => n.default])
}, 17829, t => {
    "use strict";
    var n, a = ((n = a || {}).User = "User", n.Group = "Group", n);
    t.s(["default", 0, a])
}, 114209, 559227, t => {
    "use strict";
    var n = t.i(221628),
        a = t.i(416340),
        i = t.i(237401),
        r = t.i(773057),
        o = t.i(392782);
    let l = (0, a.createContext)({
        isLoadingGame: !1,
        isErrorLoadingGame: !1,
        canConfigure: !1,
        gameDetails: null,
        refreshGameDetails: () => {
            throw Error("Not implemented")
        }
    });
    l.displayName = "Game", t.s(["default", 0, l], 559227);
    var s = t.i(721281),
        c = t.i(252842),
        u = t.i(533968);
    let d = new class {
        async getGameDetail(t, n) {
            var a, i, r;
            if (!n && this.gameDetailsMap.has(t)) return null != (a = this.gameDetailsMap.get(t)) ? a : null;
            try {
                let n = null != (i = null == (r = (await this.gamesClient.getDetails([t])).data) ? void 0 : r[0]) ? i : null;
                return n && this.gameDetailsMap.set(t, n), n
            } catch (a) {
                let n = (0, u.getResponseFromError)(a);
                if ((null == n ? void 0 : n.status) === c.StatusCodes.BAD_REQUEST) return null;
                throw console.log("Could not fetch game details for universeId ".concat(t)), a
            }
        }
        async getConfiguration(t, n) {
            if (!n && this.gameConfigurationMap.has(t)) {
                var a;
                return null != (a = this.gameConfigurationMap.get(t)) ? a : null
            }
            try {
                return await this.developClient.getUniverseConfiguration(t), this.gameConfigurationMap.set(t, !0), !0
            } catch (a) {
                let n = (0, u.getResponseFromError)(a);
                if ((null == n ? void 0 : n.status) === c.StatusCodes.FORBIDDEN) return this.gameConfigurationMap.set(t, !1), !1;
                return console.warn("Could not fetch game details for universeId ".concat(t)), null
            }
        }
        constructor(t, n) {
            (0, s._)(this, "gamesClient", void 0), (0, s._)(this, "developClient", void 0), (0, s._)(this, "gameDetailsMap", void 0), (0, s._)(this, "gameConfigurationMap", void 0), this.gamesClient = t, this.developClient = n, this.gameDetailsMap = new Map, this.gameConfigurationMap = new Map
        }
    }(o.default, r.default);
    t.s(["default", 0, t => {
        let {
            requestedGameId: r,
            children: o
        } = t, s = (0, i.useRouter)(), [c, u] = (0, a.useState)(!0), [p, f] = (0, a.useState)(null), [m, v] = (0, a.useState)(null), [g, y] = (0, a.useState)(!1), h = (0, a.useRef)(0), N = (0, a.useCallback)(async function(t) {
            let n = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                a = h.current += 1,
                i = d.getConfiguration(t),
                r = d.getGameDetail(t, n),
                [o, l] = await Promise.allSettled([i, r]);
            a === h.current && ("fulfilled" === o.status ? f(o.value) : f(null), "fulfilled" === l.status ? (y(!1), v(l.value)) : ("rejected" === l.status ? y(!0) : y(!1), v(null)), u(!1))
        }, []), b = (0, a.useMemo)(() => {
            let {
                id: t
            } = s.query;
            return r || ("string" == typeof t ? parseInt(t, 10) : void 0)
        }, [r, s.query]), E = (0, a.useCallback)(() => b ? N(b, !0) : Promise.reject(Error("Cannot refresh game details without a game ID")), [b, N]);
        (0, a.useEffect)(() => {
            try {
                if (void 0 !== b && !Number.isNaN(b) && b > 0) return void N(b);
                h.current += 1, f(null), v(null), y(!1), u(!1)
            } catch (t) {
                console.warn("Could not fetch game details for universeId ".concat(b))
            }
        }, [b, N]);
        let w = (0, a.useMemo)(() => ({
            isLoadingGame: c,
            canConfigure: p,
            gameDetails: m,
            isErrorLoadingGame: g,
            refreshGameDetails: E
        }), [c, p, m, g, E]);
        return (0, n.jsx)(l.Provider, {
            value: w,
            children: o
        })
    }, "useCurrentGame", 0, function() {
        let t = (0, a.useContext)(l);
        if (null === t) throw Error("useCurrentGame must be used within a GameProvider");
        return t
    }], 114209)
}, 425353, t => {
    "use strict";
    var n = t.i(416340),
        a = t.i(19655),
        i = t.i(78892),
        r = t.i(608652),
        o = t.i(40266),
        l = t.i(428156),
        s = t.i(598943),
        c = t.i(44265),
        u = t.i(763960),
        d = t.i(226972),
        p = t.i(594278),
        f = t.i(793808),
        m = t.i(813593),
        v = t.i(3300),
        g = t.i(699704),
        y = t.i(221628),
        h = "Dialog",
        [N, b] = (0, r.createContextScope)(h),
        [E, w] = N(h),
        C = t => {
            let {
                __scopeDialog: a,
                children: i,
                open: r,
                defaultOpen: s,
                onOpenChange: c,
                modal: u = !0
            } = t, d = n.useRef(null), p = n.useRef(null), [f = !1, m] = (0, l.useControllableState)({
                prop: r,
                defaultProp: s,
                onChange: c
            });
            return (0, y.jsx)(E, {
                scope: a,
                triggerRef: d,
                contentRef: p,
                contentId: (0, o.useId)(),
                titleId: (0, o.useId)(),
                descriptionId: (0, o.useId)(),
                open: f,
                onOpenChange: m,
                onOpenToggle: n.useCallback(() => m(t => !t), [m]),
                modal: u,
                children: i
            })
        };
    C.displayName = h;
    var P = "DialogTrigger",
        x = n.forwardRef((t, n) => {
            let {
                __scopeDialog: r,
                ...o
            } = t, l = w(P, r), s = (0, i.useComposedRefs)(n, l.triggerRef);
            return (0, y.jsx)(p.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": l.open,
                "aria-controls": l.contentId,
                "data-state": G(l.open),
                ...o,
                ref: s,
                onClick: (0, a.composeEventHandlers)(t.onClick, l.onOpenToggle)
            })
        });
    x.displayName = P;
    var T = "DialogPortal",
        [I, R] = N(T, {
            forceMount: void 0
        }),
        S = t => {
            let {
                __scopeDialog: a,
                forceMount: i,
                children: r,
                container: o
            } = t, l = w(T, a);
            return (0, y.jsx)(I, {
                scope: a,
                forceMount: i,
                children: n.Children.map(r, t => (0, y.jsx)(d.Presence, {
                    present: i || l.open,
                    children: (0, y.jsx)(u.Portal, {
                        asChild: !0,
                        container: o,
                        children: t
                    })
                }))
            })
        };
    S.displayName = T;
    var A = "DialogOverlay",
        D = n.forwardRef((t, n) => {
            let a = R(A, t.__scopeDialog),
                {
                    forceMount: i = a.forceMount,
                    ...r
                } = t,
                o = w(A, t.__scopeDialog);
            return o.modal ? (0, y.jsx)(d.Presence, {
                present: i || o.open,
                children: (0, y.jsx)(H, {
                    ...r,
                    ref: n
                })
            }) : null
        });
    D.displayName = A;
    var M = (0, g.createSlot)("DialogOverlay.RemoveScroll"),
        H = n.forwardRef((t, n) => {
            let {
                __scopeDialog: a,
                ...i
            } = t, r = w(A, a);
            return (0, y.jsx)(m.RemoveScroll, {
                as: M,
                allowPinchZoom: !0,
                shards: [r.contentRef],
                children: (0, y.jsx)(p.Primitive.div, {
                    "data-state": G(r.open),
                    ...i,
                    ref: n,
                    style: {
                        pointerEvents: "auto",
                        ...i.style
                    }
                })
            })
        }),
        K = "DialogContent",
        k = n.forwardRef((t, n) => {
            let a = R(K, t.__scopeDialog),
                {
                    forceMount: i = a.forceMount,
                    ...r
                } = t,
                o = w(K, t.__scopeDialog);
            return (0, y.jsx)(d.Presence, {
                present: i || o.open,
                children: o.modal ? (0, y.jsx)(O, {
                    ...r,
                    ref: n
                }) : (0, y.jsx)(j, {
                    ...r,
                    ref: n
                })
            })
        });
    k.displayName = K;
    var O = n.forwardRef((t, r) => {
            let o = w(K, t.__scopeDialog),
                l = n.useRef(null),
                s = (0, i.useComposedRefs)(r, o.contentRef, l);
            return n.useEffect(() => {
                let t = l.current;
                if (t) return (0, v.hideOthers)(t)
            }, []), (0, y.jsx)(L, {
                ...t,
                ref: s,
                trapFocus: o.open,
                disableOutsidePointerEvents: !0,
                onCloseAutoFocus: (0, a.composeEventHandlers)(t.onCloseAutoFocus, t => {
                    var n;
                    t.preventDefault(), null == (n = o.triggerRef.current) || n.focus()
                }),
                onPointerDownOutside: (0, a.composeEventHandlers)(t.onPointerDownOutside, t => {
                    let n = t.detail.originalEvent,
                        a = 0 === n.button && !0 === n.ctrlKey;
                    (2 === n.button || a) && t.preventDefault()
                }),
                onFocusOutside: (0, a.composeEventHandlers)(t.onFocusOutside, t => t.preventDefault())
            })
        }),
        j = n.forwardRef((t, a) => {
            let i = w(K, t.__scopeDialog),
                r = n.useRef(!1),
                o = n.useRef(!1);
            return (0, y.jsx)(L, {
                ...t,
                ref: a,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: n => {
                    var a, l;
                    null == (a = t.onCloseAutoFocus) || a.call(t, n), n.defaultPrevented || (r.current || null == (l = i.triggerRef.current) || l.focus(), n.preventDefault()), r.current = !1, o.current = !1
                },
                onInteractOutside: n => {
                    var a, l;
                    null == (a = t.onInteractOutside) || a.call(t, n), n.defaultPrevented || (r.current = !0, "pointerdown" === n.detail.originalEvent.type && (o.current = !0));
                    let s = n.target;
                    (null == (l = i.triggerRef.current) ? void 0 : l.contains(s)) && n.preventDefault(), "focusin" === n.detail.originalEvent.type && o.current && n.preventDefault()
                }
            })
        }),
        L = n.forwardRef((t, a) => {
            let {
                __scopeDialog: r,
                trapFocus: o,
                onOpenAutoFocus: l,
                onCloseAutoFocus: u,
                ...d
            } = t, p = w(K, r), m = n.useRef(null), v = (0, i.useComposedRefs)(a, m);
            return (0, f.useFocusGuards)(), (0, y.jsxs)(y.Fragment, {
                children: [(0, y.jsx)(c.FocusScope, {
                    asChild: !0,
                    loop: !0,
                    trapped: o,
                    onMountAutoFocus: l,
                    onUnmountAutoFocus: u,
                    children: (0, y.jsx)(s.DismissableLayer, {
                        role: "dialog",
                        id: p.contentId,
                        "aria-describedby": p.descriptionId,
                        "aria-labelledby": p.titleId,
                        "data-state": G(p.open),
                        ...d,
                        ref: v,
                        onDismiss: () => p.onOpenChange(!1)
                    })
                }), (0, y.jsxs)(y.Fragment, {
                    children: [(0, y.jsx)(Z, {
                        titleId: p.titleId
                    }), (0, y.jsx)(X, {
                        contentRef: m,
                        descriptionId: p.descriptionId
                    })]
                })]
            })
        }),
        F = "DialogTitle",
        _ = n.forwardRef((t, n) => {
            let {
                __scopeDialog: a,
                ...i
            } = t, r = w(F, a);
            return (0, y.jsx)(p.Primitive.h2, {
                id: r.titleId,
                ...i,
                ref: n
            })
        });
    _.displayName = F;
    var W = "DialogDescription",
        z = n.forwardRef((t, n) => {
            let {
                __scopeDialog: a,
                ...i
            } = t, r = w(W, a);
            return (0, y.jsx)(p.Primitive.p, {
                id: r.descriptionId,
                ...i,
                ref: n
            })
        });
    z.displayName = W;
    var B = "DialogClose",
        V = n.forwardRef((t, n) => {
            let {
                __scopeDialog: i,
                ...r
            } = t, o = w(B, i);
            return (0, y.jsx)(p.Primitive.button, {
                type: "button",
                ...r,
                ref: n,
                onClick: (0, a.composeEventHandlers)(t.onClick, () => o.onOpenChange(!1))
            })
        });

    function G(t) {
        return t ? "open" : "closed"
    }
    V.displayName = B;
    var q = "DialogTitleWarning",
        [U, J] = (0, r.createContext)(q, {
            contentName: K,
            titleName: F,
            docsSlug: "dialog"
        }),
        Z = t => {
            let {
                titleId: a
            } = t, i = J(q), r = "`".concat(i.contentName, "` requires a `").concat(i.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(i.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(i.docsSlug);
            return n.useEffect(() => {
                a && (document.getElementById(a) || console.error(r))
            }, [r, a]), null
        },
        X = t => {
            let {
                contentRef: a,
                descriptionId: i
            } = t, r = J("DialogDescriptionWarning"), o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(r.contentName, "}.");
            return n.useEffect(() => {
                var t;
                let n = null == (t = a.current) ? void 0 : t.getAttribute("aria-describedby");
                i && n && (document.getElementById(i) || console.warn(o))
            }, [o, a, i]), null
        };
    t.s(["Close", 0, V, "Content", 0, k, "Description", 0, z, "Overlay", 0, D, "Portal", 0, S, "Root", 0, C, "Title", 0, _, "Trigger", 0, x])
}, 199512, t => {
    "use strict";
    var n = t.i(416340);
    t.i(149285);
    var a = t.i(23342),
        i = t.i(221628),
        r = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((t, r) => {
            let o = (0, a.createSlot)("Primitive.".concat(r)),
                l = n.forwardRef((t, n) => {
                    let {
                        asChild: a,
                        ...l
                    } = t;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, i.jsx)(a ? o : r, {
                        ...l,
                        ref: n
                    })
                });
            return l.displayName = "Primitive.".concat(r), {
                ...t,
                [r]: l
            }
        }, {}),
        o = Object.freeze({
            position: "absolute",
            border: 0,
            width: 1,
            height: 1,
            padding: 0,
            margin: -1,
            overflow: "hidden",
            clip: "rect(0, 0, 0, 0)",
            whiteSpace: "nowrap",
            wordWrap: "normal"
        }),
        l = n.forwardRef((t, n) => (0, i.jsx)(r.span, {
            ...t,
            ref: n,
            style: {
                ...o,
                ...t.style
            }
        }));
    l.displayName = "VisuallyHidden", t.s(["VisuallyHidden", 0, l], 199512)
}, 62093, t => {
    "use strict";
    let n;
    var a = t.i(416340),
        i = t.i(149285),
        r = t.i(221628),
        o = t.i(440174);

    function l(t, n) {
        let {
            checkForDefaultPrevented: a = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(i) {
            if (null == t || t(i), !1 === a || !i.defaultPrevented) return null == n ? void 0 : n(i)
        }
    }

    function s(t, n) {
        if ("function" == typeof t) return t(n);
        null != t && (t.current = n)
    }

    function c() {
        for (var t = arguments.length, n = Array(t), a = 0; a < t; a++) n[a] = arguments[a];
        return t => {
            let a = !1,
                i = n.map(n => {
                    let i = s(n, t);
                    return a || "function" != typeof i || (a = !0), i
                });
            if (a) return () => {
                for (let t = 0; t < i.length; t++) {
                    let a = i[t];
                    "function" == typeof a ? a() : s(n[t], null)
                }
            }
        }
    }

    function u() {
        for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
        return a.useCallback(c(...n), n)
    }
    var d = Symbol("radix.slottable");

    function p(t) {
        return a.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === d
    }
    var f = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((t, n) => {
        var i, o;
        let l, s, u, d = (o = i = "Primitive.".concat(n), (l = a.forwardRef((t, n) => {
                let {
                    children: i,
                    ...r
                } = t;
                if (a.isValidElement(i)) {
                    var o, l;
                    let t, s = (t = null == (o = Object.getOwnPropertyDescriptor(i.props, "ref")) ? void 0 : o.get) && "isReactWarning" in t && t.isReactWarning ? i.ref : (t = null == (l = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : l.get) && "isReactWarning" in t && t.isReactWarning ? i.props.ref : i.props.ref || i.ref,
                        u = function(t, n) {
                            let a = {
                                ...n
                            };
                            for (let i in n) {
                                let r = t[i],
                                    o = n[i];
                                /^on[A-Z]/.test(i) ? r && o ? a[i] = function() {
                                    for (var t = arguments.length, n = Array(t), a = 0; a < t; a++) n[a] = arguments[a];
                                    o(...n), r(...n)
                                } : r && (a[i] = r) : "style" === i ? a[i] = {
                                    ...r,
                                    ...o
                                } : "className" === i && (a[i] = [r, o].filter(Boolean).join(" "))
                            }
                            return {
                                ...t,
                                ...a
                            }
                        }(r, i.props);
                    return i.type !== a.Fragment && (u.ref = n ? c(n, s) : s), a.cloneElement(i, u)
                }
                return a.Children.count(i) > 1 ? a.Children.only(null) : null
            })).displayName = "".concat(o, ".SlotClone"), s = l, (u = a.forwardRef((t, n) => {
                let {
                    children: i,
                    ...o
                } = t, l = a.Children.toArray(i), c = l.find(p);
                if (c) {
                    let t = c.props.children,
                        i = l.map(n => n === c ? a.Children.count(t) > 1 ? a.Children.only(null) : a.isValidElement(t) ? t.props.children : null : n);
                    return (0, r.jsx)(s, {
                        ...o,
                        ref: n,
                        children: a.isValidElement(t) ? a.cloneElement(t, void 0, i) : null
                    })
                }
                return (0, r.jsx)(s, {
                    ...o,
                    ref: n,
                    children: i
                })
            })).displayName = "".concat(i, ".Slot"), u),
            f = a.forwardRef((t, a) => {
                let {
                    asChild: i,
                    ...o
                } = t;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, r.jsx)(i ? d : n, {
                    ...o,
                    ref: a
                })
            });
        return f.displayName = "Primitive.".concat(n), {
            ...t,
            [n]: f
        }
    }, {});

    function m(t) {
        let n = a.useRef(t);
        return a.useEffect(() => {
            n.current = t
        }), a.useMemo(() => function() {
            for (var t, a = arguments.length, i = Array(a), r = 0; r < a; r++) i[r] = arguments[r];
            return null == (t = n.current) ? void 0 : t.call(n, ...i)
        }, [])
    }
    var v, g, y = "dismissableLayer.update",
        h = a.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        N = a.forwardRef((t, n) => {
            var i, o;
            let {
                disableOutsidePointerEvents: s = !1,
                onEscapeKeyDown: c,
                onPointerDownOutside: d,
                onFocusOutside: p,
                onInteractOutside: v,
                onDismiss: N,
                ...w
            } = t, C = a.useContext(h), [P, x] = a.useState(null), T = null != (i = null == P ? void 0 : P.ownerDocument) ? i : null == (o = globalThis) ? void 0 : o.document, [, I] = a.useState({}), R = u(n, t => x(t)), S = Array.from(C.layers), [A] = [...C.layersWithOutsidePointerEventsDisabled].slice(-1), D = S.indexOf(A), M = P ? S.indexOf(P) : -1, H = C.layersWithOutsidePointerEventsDisabled.size > 0, K = M >= D, k = function(t) {
                var n;
                let i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                    r = m(t),
                    o = a.useRef(!1),
                    l = a.useRef(() => {});
                return a.useEffect(() => {
                    let t = t => {
                            if (t.target && !o.current) {
                                let n = function() {
                                        E("dismissableLayer.pointerDownOutside", r, a, {
                                            discrete: !0
                                        })
                                    },
                                    a = {
                                        originalEvent: t
                                    };
                                "touch" === t.pointerType ? (i.removeEventListener("click", l.current), l.current = n, i.addEventListener("click", l.current, {
                                    once: !0
                                })) : n()
                            } else i.removeEventListener("click", l.current);
                            o.current = !1
                        },
                        n = window.setTimeout(() => {
                            i.addEventListener("pointerdown", t)
                        }, 0);
                    return () => {
                        window.clearTimeout(n), i.removeEventListener("pointerdown", t), i.removeEventListener("click", l.current)
                    }
                }, [i, r]), {
                    onPointerDownCapture: () => o.current = !0
                }
            }(t => {
                let n = t.target,
                    a = [...C.branches].some(t => t.contains(n));
                K && !a && (null == d || d(t), null == v || v(t), t.defaultPrevented || null == N || N())
            }, T), O = function(t) {
                var n;
                let i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                    r = m(t),
                    o = a.useRef(!1);
                return a.useEffect(() => {
                    let t = t => {
                        t.target && !o.current && E("dismissableLayer.focusOutside", r, {
                            originalEvent: t
                        }, {
                            discrete: !1
                        })
                    };
                    return i.addEventListener("focusin", t), () => i.removeEventListener("focusin", t)
                }, [i, r]), {
                    onFocusCapture: () => o.current = !0,
                    onBlurCapture: () => o.current = !1
                }
            }(t => {
                let n = t.target;
                [...C.branches].some(t => t.contains(n)) || (null == p || p(t), null == v || v(t), t.defaultPrevented || null == N || N())
            }, T);
            return function(t) {
                var n;
                let i, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                    o = (i = a.useRef(t), a.useEffect(() => {
                        i.current = t
                    }), a.useMemo(() => function() {
                        for (var t, n = arguments.length, a = Array(n), r = 0; r < n; r++) a[r] = arguments[r];
                        return null == (t = i.current) ? void 0 : t.call(i, ...a)
                    }, []));
                a.useEffect(() => {
                    let t = t => {
                        "Escape" === t.key && o(t)
                    };
                    return r.addEventListener("keydown", t, {
                        capture: !0
                    }), () => r.removeEventListener("keydown", t, {
                        capture: !0
                    })
                }, [o, r])
            }(t => {
                M === C.layers.size - 1 && (null == c || c(t), !t.defaultPrevented && N && (t.preventDefault(), N()))
            }, T), a.useEffect(() => {
                if (P) return s && (0 === C.layersWithOutsidePointerEventsDisabled.size && (g = T.body.style.pointerEvents, T.body.style.pointerEvents = "none"), C.layersWithOutsidePointerEventsDisabled.add(P)), C.layers.add(P), b(), () => {
                    s && 1 === C.layersWithOutsidePointerEventsDisabled.size && (T.body.style.pointerEvents = g)
                }
            }, [P, T, s, C]), a.useEffect(() => () => {
                P && (C.layers.delete(P), C.layersWithOutsidePointerEventsDisabled.delete(P), b())
            }, [P, C]), a.useEffect(() => {
                let t = () => I({});
                return document.addEventListener(y, t), () => document.removeEventListener(y, t)
            }, []), (0, r.jsx)(f.div, {
                ...w,
                ref: R,
                style: {
                    pointerEvents: H ? K ? "auto" : "none" : void 0,
                    ...t.style
                },
                onFocusCapture: l(t.onFocusCapture, O.onFocusCapture),
                onBlurCapture: l(t.onBlurCapture, O.onBlurCapture),
                onPointerDownCapture: l(t.onPointerDownCapture, k.onPointerDownCapture)
            })
        });

    function b() {
        let t = new CustomEvent(y);
        document.dispatchEvent(t)
    }

    function E(t, n, a, r) {
        let {
            discrete: o
        } = r, l = a.originalEvent.target, s = new CustomEvent(t, {
            bubbles: !1,
            cancelable: !0,
            detail: a
        });
        n && l.addEventListener(t, n, {
            once: !0
        }), o ? l && i.flushSync(() => l.dispatchEvent(s)) : l.dispatchEvent(s)
    }
    N.displayName = "DismissableLayer", a.forwardRef((t, n) => {
        let i = a.useContext(h),
            o = a.useRef(null),
            l = u(n, o);
        return a.useEffect(() => {
            let t = o.current;
            if (t) return i.branches.add(t), () => {
                i.branches.delete(t)
            }
        }, [i.branches]), (0, r.jsx)(f.div, {
            ...t,
            ref: l
        })
    }).displayName = "DismissableLayerBranch";
    var w = 0;

    function C() {
        let t = document.createElement("span");
        return t.setAttribute("data-radix-focus-guard", ""), t.tabIndex = 0, t.style.outline = "none", t.style.opacity = "0", t.style.position = "fixed", t.style.pointerEvents = "none", t
    }

    function P(t, n) {
        if ("function" == typeof t) return t(n);
        null != t && (t.current = n)
    }

    function x() {
        for (var t = arguments.length, n = Array(t), a = 0; a < t; a++) n[a] = arguments[a];
        return t => {
            let a = !1,
                i = n.map(n => {
                    let i = P(n, t);
                    return a || "function" != typeof i || (a = !0), i
                });
            if (a) return () => {
                for (let t = 0; t < i.length; t++) {
                    let a = i[t];
                    "function" == typeof a ? a() : P(n[t], null)
                }
            }
        }
    }
    var T = Symbol("radix.slottable");

    function I(t) {
        return a.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === T
    }
    var R = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((t, n) => {
        var i, o;
        let l, s, c, u = (o = i = "Primitive.".concat(n), (l = a.forwardRef((t, n) => {
                let {
                    children: i,
                    ...r
                } = t;
                if (a.isValidElement(i)) {
                    var o, l;
                    let t, s = (t = null == (o = Object.getOwnPropertyDescriptor(i.props, "ref")) ? void 0 : o.get) && "isReactWarning" in t && t.isReactWarning ? i.ref : (t = null == (l = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : l.get) && "isReactWarning" in t && t.isReactWarning ? i.props.ref : i.props.ref || i.ref,
                        c = function(t, n) {
                            let a = {
                                ...n
                            };
                            for (let i in n) {
                                let r = t[i],
                                    o = n[i];
                                /^on[A-Z]/.test(i) ? r && o ? a[i] = function() {
                                    for (var t = arguments.length, n = Array(t), a = 0; a < t; a++) n[a] = arguments[a];
                                    o(...n), r(...n)
                                } : r && (a[i] = r) : "style" === i ? a[i] = {
                                    ...r,
                                    ...o
                                } : "className" === i && (a[i] = [r, o].filter(Boolean).join(" "))
                            }
                            return {
                                ...t,
                                ...a
                            }
                        }(r, i.props);
                    return i.type !== a.Fragment && (c.ref = n ? x(n, s) : s), a.cloneElement(i, c)
                }
                return a.Children.count(i) > 1 ? a.Children.only(null) : null
            })).displayName = "".concat(o, ".SlotClone"), s = l, (c = a.forwardRef((t, n) => {
                let {
                    children: i,
                    ...o
                } = t, l = a.Children.toArray(i), c = l.find(I);
                if (c) {
                    let t = c.props.children,
                        i = l.map(n => n === c ? a.Children.count(t) > 1 ? a.Children.only(null) : a.isValidElement(t) ? t.props.children : null : n);
                    return (0, r.jsx)(s, {
                        ...o,
                        ref: n,
                        children: a.isValidElement(t) ? a.cloneElement(t, void 0, i) : null
                    })
                }
                return (0, r.jsx)(s, {
                    ...o,
                    ref: n,
                    children: i
                })
            })).displayName = "".concat(i, ".Slot"), c),
            d = a.forwardRef((t, a) => {
                let {
                    asChild: i,
                    ...o
                } = t;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, r.jsx)(i ? u : n, {
                    ...o,
                    ref: a
                })
            });
        return d.displayName = "Primitive.".concat(n), {
            ...t,
            [n]: d
        }
    }, {});

    function S(t) {
        let n = a.useRef(t);
        return a.useEffect(() => {
            n.current = t
        }), a.useMemo(() => function() {
            for (var t, a = arguments.length, i = Array(a), r = 0; r < a; r++) i[r] = arguments[r];
            return null == (t = n.current) ? void 0 : t.call(n, ...i)
        }, [])
    }
    var A = "focusScope.autoFocusOnMount",
        D = "focusScope.autoFocusOnUnmount",
        M = {
            bubbles: !1,
            cancelable: !0
        },
        H = a.forwardRef((t, n) => {
            let {
                loop: i = !1,
                trapped: o = !1,
                onMountAutoFocus: l,
                onUnmountAutoFocus: s,
                ...c
            } = t, [u, d] = a.useState(null), p = S(l), f = S(s), m = a.useRef(null), v = function() {
                for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
                return a.useCallback(x(...n), n)
            }(n, t => d(t)), g = a.useRef({
                paused: !1,
                pause() {
                    this.paused = !0
                },
                resume() {
                    this.paused = !1
                }
            }).current;
            a.useEffect(() => {
                if (o) {
                    let t = function(t) {
                            if (g.paused || !u) return;
                            let n = t.target;
                            u.contains(n) ? m.current = n : O(m.current, {
                                select: !0
                            })
                        },
                        n = function(t) {
                            if (g.paused || !u) return;
                            let n = t.relatedTarget;
                            null !== n && (u.contains(n) || O(m.current, {
                                select: !0
                            }))
                        };
                    document.addEventListener("focusin", t), document.addEventListener("focusout", n);
                    let a = new MutationObserver(function(t) {
                        if (document.activeElement === document.body)
                            for (let n of t) n.removedNodes.length > 0 && O(u)
                    });
                    return u && a.observe(u, {
                        childList: !0,
                        subtree: !0
                    }), () => {
                        document.removeEventListener("focusin", t), document.removeEventListener("focusout", n), a.disconnect()
                    }
                }
            }, [o, u, g.paused]), a.useEffect(() => {
                if (u) {
                    j.add(g);
                    let t = document.activeElement;
                    if (!u.contains(t)) {
                        let n = new CustomEvent(A, M);
                        u.addEventListener(A, p), u.dispatchEvent(n), n.defaultPrevented || (! function(t) {
                            let {
                                select: n = !1
                            } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, a = document.activeElement;
                            for (let i of t)
                                if (O(i, {
                                        select: n
                                    }), document.activeElement !== a) return
                        }(K(u).filter(t => "A" !== t.tagName), {
                            select: !0
                        }), document.activeElement === t && O(u))
                    }
                    return () => {
                        u.removeEventListener(A, p), setTimeout(() => {
                            let n = new CustomEvent(D, M);
                            u.addEventListener(D, f), u.dispatchEvent(n), n.defaultPrevented || O(null != t ? t : document.body, {
                                select: !0
                            }), u.removeEventListener(D, f), j.remove(g)
                        }, 0)
                    }
                }
            }, [u, p, f, g]);
            let y = a.useCallback(t => {
                if (!i && !o || g.paused) return;
                let n = "Tab" === t.key && !t.altKey && !t.ctrlKey && !t.metaKey,
                    a = document.activeElement;
                if (n && a) {
                    let n, r = t.currentTarget,
                        [o, l] = [k(n = K(r), r), k(n.reverse(), r)];
                    o && l ? t.shiftKey || a !== l ? t.shiftKey && a === o && (t.preventDefault(), i && O(l, {
                        select: !0
                    })) : (t.preventDefault(), i && O(o, {
                        select: !0
                    })) : a === r && t.preventDefault()
                }
            }, [i, o, g.paused]);
            return (0, r.jsx)(R.div, {
                tabIndex: -1,
                ...c,
                ref: v,
                onKeyDown: y
            })
        });

    function K(t) {
        let n = [],
            a = document.createTreeWalker(t, NodeFilter.SHOW_ELEMENT, {
                acceptNode: t => {
                    let n = "INPUT" === t.tagName && "hidden" === t.type;
                    return t.disabled || t.hidden || n ? NodeFilter.FILTER_SKIP : t.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                }
            });
        for (; a.nextNode();) n.push(a.currentNode);
        return n
    }

    function k(t, n) {
        for (let a of t)
            if (! function(t, n) {
                    let {
                        upTo: a
                    } = n;
                    if ("hidden" === getComputedStyle(t).visibility) return !0;
                    for (; t && (void 0 === a || t !== a);) {
                        if ("none" === getComputedStyle(t).display) return !0;
                        t = t.parentElement
                    }
                    return !1
                }(a, {
                    upTo: n
                })) return a
    }

    function O(t) {
        let {
            select: n = !1
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        if (t && t.focus) {
            var a;
            let i = document.activeElement;
            t.focus({
                preventScroll: !0
            }), t !== i && (a = t) instanceof HTMLInputElement && "select" in a && n && t.select()
        }
    }
    H.displayName = "FocusScope";
    var j = (n = [], {
        add(t) {
            let a = n[0];
            t !== a && (null == a || a.pause()), (n = L(n, t)).unshift(t)
        },
        remove(t) {
            var a;
            null == (a = (n = L(n, t))[0]) || a.resume()
        }
    });

    function L(t, n) {
        let a = [...t],
            i = a.indexOf(n);
        return -1 !== i && a.splice(i, 1), a
    }

    function F(t, n) {
        if ("function" == typeof t) return t(n);
        null != t && (t.current = n)
    }
    var _ = Symbol("radix.slottable");

    function W(t) {
        return a.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === _
    }
    var z = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((t, n) => {
            var i, o;
            let l, s, c, u = (o = i = "Primitive.".concat(n), (l = a.forwardRef((t, n) => {
                    let {
                        children: i,
                        ...r
                    } = t;
                    if (a.isValidElement(i)) {
                        var o, l;
                        let t, s = (t = null == (o = Object.getOwnPropertyDescriptor(i.props, "ref")) ? void 0 : o.get) && "isReactWarning" in t && t.isReactWarning ? i.ref : (t = null == (l = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : l.get) && "isReactWarning" in t && t.isReactWarning ? i.props.ref : i.props.ref || i.ref,
                            c = function(t, n) {
                                let a = {
                                    ...n
                                };
                                for (let i in n) {
                                    let r = t[i],
                                        o = n[i];
                                    /^on[A-Z]/.test(i) ? r && o ? a[i] = function() {
                                        for (var t = arguments.length, n = Array(t), a = 0; a < t; a++) n[a] = arguments[a];
                                        o(...n), r(...n)
                                    } : r && (a[i] = r) : "style" === i ? a[i] = {
                                        ...r,
                                        ...o
                                    } : "className" === i && (a[i] = [r, o].filter(Boolean).join(" "))
                                }
                                return {
                                    ...t,
                                    ...a
                                }
                            }(r, i.props);
                        return i.type !== a.Fragment && (c.ref = n ? function() {
                            for (var t = arguments.length, n = Array(t), a = 0; a < t; a++) n[a] = arguments[a];
                            return t => {
                                let a = !1,
                                    i = n.map(n => {
                                        let i = F(n, t);
                                        return a || "function" != typeof i || (a = !0), i
                                    });
                                if (a) return () => {
                                    for (let t = 0; t < i.length; t++) {
                                        let a = i[t];
                                        "function" == typeof a ? a() : F(n[t], null)
                                    }
                                }
                            }
                        }(n, s) : s), a.cloneElement(i, c)
                    }
                    return a.Children.count(i) > 1 ? a.Children.only(null) : null
                })).displayName = "".concat(o, ".SlotClone"), s = l, (c = a.forwardRef((t, n) => {
                    let {
                        children: i,
                        ...o
                    } = t, l = a.Children.toArray(i), c = l.find(W);
                    if (c) {
                        let t = c.props.children,
                            i = l.map(n => n === c ? a.Children.count(t) > 1 ? a.Children.only(null) : a.isValidElement(t) ? t.props.children : null : n);
                        return (0, r.jsx)(s, {
                            ...o,
                            ref: n,
                            children: a.isValidElement(t) ? a.cloneElement(t, void 0, i) : null
                        })
                    }
                    return (0, r.jsx)(s, {
                        ...o,
                        ref: n,
                        children: i
                    })
                })).displayName = "".concat(i, ".Slot"), c),
                d = a.forwardRef((t, a) => {
                    let {
                        asChild: i,
                        ...o
                    } = t;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, r.jsx)(i ? u : n, {
                        ...o,
                        ref: a
                    })
                });
            return d.displayName = "Primitive.".concat(n), {
                ...t,
                [n]: d
            }
        }, {}),
        B = (null == (v = globalThis) ? void 0 : v.document) ? a.useLayoutEffect : () => {},
        V = a.forwardRef((t, n) => {
            var o, l;
            let {
                container: s,
                ...c
            } = t, [u, d] = a.useState(!1);
            B(() => d(!0), []);
            let p = s || u && (null == (l = globalThis) || null == (o = l.document) ? void 0 : o.body);
            return p ? i.default.createPortal((0, r.jsx)(z.div, {
                ...c,
                ref: n
            }), p) : null
        });
    V.displayName = "Portal";
    var G = new WeakMap,
        q = new WeakMap,
        U = {},
        J = 0,
        Z = function(t) {
            return t && (t.host || Z(t.parentNode))
        },
        X = function(t, n, a, i) {
            var r = (Array.isArray(t) ? t : [t]).map(function(t) {
                if (n.contains(t)) return t;
                var a = Z(t);
                return a && n.contains(a) ? a : (console.error("aria-hidden", t, "in not contained inside", n, ". Doing nothing"), null)
            }).filter(function(t) {
                return !!t
            });
            U[a] || (U[a] = new WeakMap);
            var o = U[a],
                l = [],
                s = new Set,
                c = new Set(r),
                u = function(t) {
                    t && !s.has(t) && (s.add(t), u(t.parentNode))
                };
            r.forEach(u);
            var d = function(t) {
                t && !c.has(t) && Array.prototype.forEach.call(t.children, function(t) {
                    if (s.has(t)) d(t);
                    else try {
                        var n = t.getAttribute(i),
                            r = null !== n && "false" !== n,
                            c = (G.get(t) || 0) + 1,
                            u = (o.get(t) || 0) + 1;
                        G.set(t, c), o.set(t, u), l.push(t), 1 === c && r && q.set(t, !0), 1 === u && t.setAttribute(a, "true"), r || t.setAttribute(i, "true")
                    } catch (n) {
                        console.error("aria-hidden: cannot operate on ", t, n)
                    }
                })
            };
            return d(n), s.clear(), J++,
                function() {
                    l.forEach(function(t) {
                        var n = G.get(t) - 1,
                            r = o.get(t) - 1;
                        G.set(t, n), o.set(t, r), n || (q.has(t) || t.removeAttribute(i), q.delete(t)), r || t.removeAttribute(a)
                    }), --J || (G = new WeakMap, G = new WeakMap, q = new WeakMap, U = {})
                }
        },
        Y = "right-scroll-bar-position",
        $ = "width-before-scroll-bar";

    function Q(t, n) {
        return "function" == typeof t ? t(n) : t && (t.current = n), t
    }
    var ee = "u" > typeof window ? a.useLayoutEffect : a.useEffect,
        et = new WeakMap,
        en = function(t) {
            var n = t.sideCar,
                i = (0, o._)(t, ["sideCar"]);
            if (!n) throw Error("Sidecar: please provide `sideCar` property to import the right car");
            var r = n.read();
            if (!r) throw Error("Sidecar medium not found");
            return a.createElement(r, (0, o.a)({}, i))
        };
    en.isSideCarExport = !0;
    var ea = (void 0 === eN && (eN = {}), (void 0 === eb && (eb = function(t) {
            return t
        }), eE = [], ew = !1, eC = {
            read: function() {
                if (ew) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                return eE.length ? eE[eE.length - 1] : null
            },
            useMedium: function(t) {
                var n = eb(t, ew);
                return eE.push(n),
                    function() {
                        eE = eE.filter(function(t) {
                            return t !== n
                        })
                    }
            },
            assignSyncMedium: function(t) {
                for (ew = !0; eE.length;) {
                    var n = eE;
                    eE = [], n.forEach(t)
                }
                eE = {
                    push: function(n) {
                        return t(n)
                    },
                    filter: function() {
                        return eE
                    }
                }
            },
            assignMedium: function(t) {
                ew = !0;
                var n = [];
                if (eE.length) {
                    var a = eE;
                    eE = [], a.forEach(t), n = eE
                }
                var i = function() {
                        var a = n;
                        n = [], a.forEach(t)
                    },
                    r = function() {
                        return Promise.resolve().then(i)
                    };
                r(), eE = {
                    push: function(t) {
                        n.push(t), r()
                    },
                    filter: function(t) {
                        return n = n.filter(t), eE
                    }
                }
            }
        }).options = (0, o.a)({
            async: !0,
            ssr: !1
        }, eN), eC),
        ei = function() {},
        er = a.forwardRef(function(t, n) {
            var i, r, l, s, c = a.useRef(null),
                u = a.useState({
                    onScrollCapture: ei,
                    onWheelCapture: ei,
                    onTouchMoveCapture: ei
                }),
                d = u[0],
                p = u[1],
                f = t.forwardProps,
                m = t.children,
                v = t.className,
                g = t.removeScrollBar,
                y = t.enabled,
                h = t.shards,
                N = t.sideCar,
                b = t.noIsolation,
                E = t.inert,
                w = t.allowPinchZoom,
                C = t.as,
                P = t.gapMode,
                x = (0, o._)(t, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                T = (i = [c, n], r = function(t) {
                    return i.forEach(function(n) {
                        return Q(n, t)
                    })
                }, (l = (0, a.useState)(function() {
                    return {
                        value: null,
                        callback: r,
                        facade: {
                            get current() {
                                return l.value
                            },
                            set current(e) {
                                var t = l.value;
                                t !== e && (l.value = e, l.callback(e, t))
                            }
                        }
                    }
                })[0]).callback = r, s = l.facade, ee(function() {
                    var t = et.get(s);
                    if (t) {
                        var n = new Set(t),
                            a = new Set(i),
                            r = s.current;
                        n.forEach(function(t) {
                            a.has(t) || Q(t, null)
                        }), a.forEach(function(t) {
                            n.has(t) || Q(t, r)
                        })
                    }
                    et.set(s, i)
                }, [i]), s),
                I = (0, o.a)((0, o.a)({}, x), d);
            return a.createElement(a.Fragment, null, y && a.createElement(N, {
                sideCar: ea,
                removeScrollBar: g,
                shards: h,
                noIsolation: b,
                inert: E,
                setCallbacks: p,
                allowPinchZoom: !!w,
                lockRef: c,
                gapMode: P
            }), f ? a.cloneElement(a.Children.only(m), (0, o.a)((0, o.a)({}, I), {
                ref: T
            })) : a.createElement(void 0 === C ? "div" : C, (0, o.a)({}, I, {
                className: v,
                ref: T
            }), m))
        });
    er.defaultProps = {
        enabled: !0,
        removeScrollBar: !0,
        inert: !1
    }, er.classNames = {
        fullWidth: $,
        zeroRight: Y
    };
    var eo = function() {
            if ("u" > typeof __webpack_nonce__) return __webpack_nonce__
        },
        el = function() {
            var t = 0,
                n = null;
            return {
                add: function(a) {
                    var i, r;
                    0 == t && (n = function() {
                        if (!document) return null;
                        var t = document.createElement("style");
                        t.type = "text/css";
                        var n = eo();
                        return n && t.setAttribute("nonce", n), t
                    }()) && ((i = n).styleSheet ? i.styleSheet.cssText = a : i.appendChild(document.createTextNode(a)), r = n, (document.head || document.getElementsByTagName("head")[0]).appendChild(r)), t++
                },
                remove: function() {
                    --t || !n || (n.parentNode && n.parentNode.removeChild(n), n = null)
                }
            }
        },
        es = function() {
            var t, n = (t = el(), function(n, i) {
                a.useEffect(function() {
                    return t.add(n),
                        function() {
                            t.remove()
                        }
                }, [n && i])
            });
            return function(t) {
                return n(t.styles, t.dynamic), null
            }
        },
        ec = {
            left: 0,
            top: 0,
            right: 0,
            gap: 0
        },
        eu = function(t) {
            return parseInt(t || "", 10) || 0
        },
        ed = function(t) {
            if (void 0 === t && (t = "margin"), "u" < typeof window) return ec;
            var n, a, i, r, o, l = (n = t, i = (a = window.getComputedStyle(document.body))["padding" === n ? "paddingLeft" : "marginLeft"], r = a["padding" === n ? "paddingTop" : "marginTop"], o = a["padding" === n ? "paddingRight" : "marginRight"], [eu(i), eu(r), eu(o)]),
                s = document.documentElement.clientWidth,
                c = window.innerWidth;
            return {
                left: l[0],
                top: l[1],
                right: l[2],
                gap: Math.max(0, c - s + l[2] - l[0])
            }
        },
        ep = es(),
        ef = "data-scroll-locked",
        em = function(t, n, a, i) {
            var r = t.left,
                o = t.top,
                l = t.right,
                s = t.gap;
            return void 0 === a && (a = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(i, ";\n   padding-right: ").concat(s, "px ").concat(i, ";\n  }\n  body[").concat(ef, "] {\n    overflow: hidden ").concat(i, ";\n    overscroll-behavior: contain;\n    ").concat([n && "position: relative ".concat(i, ";"), "margin" === a && "\n    padding-left: ".concat(r, "px;\n    padding-top: ").concat(o, "px;\n    padding-right: ").concat(l, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(s, "px ").concat(i, ";\n    "), "padding" === a && "padding-right: ".concat(s, "px ").concat(i, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(Y, " {\n    right: ").concat(s, "px ").concat(i, ";\n  }\n  \n  .").concat($, " {\n    margin-right: ").concat(s, "px ").concat(i, ";\n  }\n  \n  .").concat(Y, " .").concat(Y, " {\n    right: 0 ").concat(i, ";\n  }\n  \n  .").concat($, " .").concat($, " {\n    margin-right: 0 ").concat(i, ";\n  }\n  \n  body[").concat(ef, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(s, "px;\n  }\n")
        },
        ev = function() {
            var t = parseInt(document.body.getAttribute(ef) || "0", 10);
            return isFinite(t) ? t : 0
        },
        eg = function(t) {
            var n = t.noRelative,
                i = t.noImportant,
                r = t.gapMode,
                o = void 0 === r ? "margin" : r;
            a.useEffect(function() {
                return document.body.setAttribute(ef, (ev() + 1).toString()),
                    function() {
                        var t = ev() - 1;
                        t <= 0 ? document.body.removeAttribute(ef) : document.body.setAttribute(ef, t.toString())
                    }
            }, []);
            var l = a.useMemo(function() {
                return ed(o)
            }, [o]);
            return a.createElement(ep, {
                styles: em(l, !n, o, i ? "" : "!important")
            })
        },
        ey = !1;
    if ("u" > typeof window) try {
        var eh = Object.defineProperty({}, "passive", {
            get: function() {
                return ey = !0, !0
            }
        });
        window.addEventListener("test", eh, eh), window.removeEventListener("test", eh, eh)
    } catch (t) {
        ey = !1
    }
    var eN, eb, eE, ew, eC, eP, ex = !!ey && {
            passive: !1
        },
        eT = function(t, n) {
            if (!(t instanceof Element)) return !1;
            var a = window.getComputedStyle(t);
            return "hidden" !== a[n] && (a.overflowY !== a.overflowX || "TEXTAREA" === t.tagName || "visible" !== a[n])
        },
        eI = function(t, n) {
            var a = n.ownerDocument,
                i = n;
            do {
                if ("u" > typeof ShadowRoot && i instanceof ShadowRoot && (i = i.host), eR(t, i)) {
                    var r = eS(t, i);
                    if (r[1] > r[2]) return !0
                }
                i = i.parentNode
            } while (i && i !== a.body) return !1
        },
        eR = function(t, n) {
            return "v" === t ? eT(n, "overflowY") : eT(n, "overflowX")
        },
        eS = function(t, n) {
            return "v" === t ? [n.scrollTop, n.scrollHeight, n.clientHeight] : [n.scrollLeft, n.scrollWidth, n.clientWidth]
        },
        eA = function(t, n, a, i, r) {
            var o, l = (o = window.getComputedStyle(n).direction, "h" === t && "rtl" === o ? -1 : 1),
                s = l * i,
                c = a.target,
                u = n.contains(c),
                d = !1,
                p = s > 0,
                f = 0,
                m = 0;
            do {
                var v = eS(t, c),
                    g = v[0],
                    y = v[1] - v[2] - l * g;
                (g || y) && eR(t, c) && (f += y, m += g), c = c instanceof ShadowRoot ? c.host : c.parentNode
            } while (!u && c !== document.body || u && (n.contains(c) || n === c)) return (p && (r && 1 > Math.abs(f) || !r && s > f) || !p && (r && 1 > Math.abs(m) || !r && -s > m)) && (d = !0), d
        },
        eD = function(t) {
            return "changedTouches" in t ? [t.changedTouches[0].clientX, t.changedTouches[0].clientY] : [0, 0]
        },
        eM = function(t) {
            return [t.deltaX, t.deltaY]
        },
        eH = function(t) {
            return t && "current" in t ? t.current : t
        },
        eK = 0,
        ek = [],
        eO = (eP = function(t) {
            var n = a.useRef([]),
                i = a.useRef([0, 0]),
                r = a.useRef(),
                l = a.useState(eK++)[0],
                s = a.useState(es)[0],
                c = a.useRef(t);
            a.useEffect(function() {
                c.current = t
            }, [t]), a.useEffect(function() {
                if (t.inert) {
                    document.body.classList.add("block-interactivity-".concat(l));
                    var n = (0, o.b)([t.lockRef.current], (t.shards || []).map(eH), !0).filter(Boolean);
                    return n.forEach(function(t) {
                            return t.classList.add("allow-interactivity-".concat(l))
                        }),
                        function() {
                            document.body.classList.remove("block-interactivity-".concat(l)), n.forEach(function(t) {
                                return t.classList.remove("allow-interactivity-".concat(l))
                            })
                        }
                }
            }, [t.inert, t.lockRef.current, t.shards]);
            var u = a.useCallback(function(t, n) {
                    if ("touches" in t && 2 === t.touches.length || "wheel" === t.type && t.ctrlKey) return !c.current.allowPinchZoom;
                    var a, o = eD(t),
                        l = i.current,
                        s = "deltaX" in t ? t.deltaX : l[0] - o[0],
                        u = "deltaY" in t ? t.deltaY : l[1] - o[1],
                        d = t.target,
                        p = Math.abs(s) > Math.abs(u) ? "h" : "v";
                    if ("touches" in t && "h" === p && "range" === d.type) return !1;
                    var f = eI(p, d);
                    if (!f) return !0;
                    if (f ? a = p : (a = "v" === p ? "h" : "v", f = eI(p, d)), !f) return !1;
                    if (!r.current && "changedTouches" in t && (s || u) && (r.current = a), !a) return !0;
                    var m = r.current || a;
                    return eA(m, n, t, "h" === m ? s : u, !0)
                }, []),
                d = a.useCallback(function(t) {
                    if (ek.length && ek[ek.length - 1] === s) {
                        var a = "deltaY" in t ? eM(t) : eD(t),
                            i = n.current.filter(function(n) {
                                var i;
                                return n.name === t.type && (n.target === t.target || t.target === n.shadowParent) && (i = n.delta, i[0] === a[0] && i[1] === a[1])
                            })[0];
                        if (i && i.should) t.cancelable && t.preventDefault();
                        else if (!i) {
                            var r = (c.current.shards || []).map(eH).filter(Boolean).filter(function(n) {
                                return n.contains(t.target)
                            });
                            (r.length > 0 ? u(t, r[0]) : !c.current.noIsolation) && t.cancelable && t.preventDefault()
                        }
                    }
                }, []),
                p = a.useCallback(function(t, a, i, r) {
                    var o = {
                        name: t,
                        delta: a,
                        target: i,
                        should: r,
                        shadowParent: function(t) {
                            for (var n = null; null !== t;) t instanceof ShadowRoot && (n = t.host, t = t.host), t = t.parentNode;
                            return n
                        }(i)
                    };
                    n.current.push(o), setTimeout(function() {
                        n.current = n.current.filter(function(t) {
                            return t !== o
                        })
                    }, 1)
                }, []),
                f = a.useCallback(function(t) {
                    i.current = eD(t), r.current = void 0
                }, []),
                m = a.useCallback(function(n) {
                    p(n.type, eM(n), n.target, u(n, t.lockRef.current))
                }, []),
                v = a.useCallback(function(n) {
                    p(n.type, eD(n), n.target, u(n, t.lockRef.current))
                }, []);
            a.useEffect(function() {
                return ek.push(s), t.setCallbacks({
                        onScrollCapture: m,
                        onWheelCapture: m,
                        onTouchMoveCapture: v
                    }), document.addEventListener("wheel", d, ex), document.addEventListener("touchmove", d, ex), document.addEventListener("touchstart", f, ex),
                    function() {
                        ek = ek.filter(function(t) {
                            return t !== s
                        }), document.removeEventListener("wheel", d, ex), document.removeEventListener("touchmove", d, ex), document.removeEventListener("touchstart", f, ex)
                    }
            }, []);
            var g = t.removeScrollBar,
                y = t.inert;
            return a.createElement(a.Fragment, null, y ? a.createElement(s, {
                styles: "\n  .block-interactivity-".concat(l, " {pointer-events: none;}\n  .allow-interactivity-").concat(l, " {pointer-events: all;}\n")
            }) : null, g ? a.createElement(eg, {
                gapMode: t.gapMode
            }) : null)
        }, ea.useMedium(eP), en),
        ej = a.forwardRef(function(t, n) {
            return a.createElement(er, (0, o.a)({}, t, {
                ref: n,
                sideCar: eO
            }))
        });
    ej.classNames = er.classNames, t.s(["D", 0, N, "F", 0, H, "P", 0, V, "R", 0, ej, "h", 0, function(t, n, a) {
        void 0 === a && (a = "data-aria-hidden");
        var i = Array.from(Array.isArray(t) ? t : [t]),
            r = n || ("u" < typeof document ? null : (Array.isArray(t) ? t[0] : t).ownerDocument.body);
        return r ? (i.push.apply(i, Array.from(r.querySelectorAll("[aria-live]"))), X(i, r, a, "aria-hidden")) : function() {
            return null
        }
    }, "u", 0, function() {
        a.useEffect(() => {
            var t, n;
            let a = document.querySelectorAll("[data-radix-focus-guard]");
            return document.body.insertAdjacentElement("afterbegin", null != (t = a[0]) ? t : C()), document.body.insertAdjacentElement("beforeend", null != (n = a[1]) ? n : C()), w++, () => {
                1 === w && document.querySelectorAll("[data-radix-focus-guard]").forEach(t => t.remove()), w--
            }
        }, [])
    }])
}, 57385, t => {
    "use strict";
    var n = t.i(440174),
        a = t.i(197649),
        i = t.i(416340),
        r = t.i(27393),
        o = t.i(348113);
    let l = {
            Small: "padding-xsmall",
            Medium: "padding-small",
            Large: "padding-medium"
        },
        s = {
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-100"
        };
    t.s(["CloseAffordance", 0, t => {
        var {
            variant: c,
            size: u,
            isCircular: d,
            className: p
        } = t, f = (0, n._)(t, ["variant", "size", "isCircular", "className"]);
        return i.default.createElement("button", Object.assign({
            type: "button",
            className: (0, a.default)("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", o.interactable, s[c], l[u], d && "radius-circle", p)
        }, f), i.default.createElement(o.StateLayer, null), i.default.createElement(r.Icon, {
            name: "icon-regular-x",
            size: u
        }))
    }])
}, 652670, t => {
    "use strict";
    var n, a = t.i(416340),
        i = (null == (n = globalThis) ? void 0 : n.document) ? a.useLayoutEffect : () => {},
        r = a[" useId ".trim().toString()] || (() => {}),
        o = 0;
    t.s(["u", 0, function(t) {
        let [n, l] = a.useState(r());
        return i(() => {
            t || l(t => null != t ? t : String(o++))
        }, [t]), t || (n ? "radix-".concat(n) : "")
    }])
}, 956728, t => {
    "use strict";
    var n = t.i(356407),
        a = t.i(197649),
        i = t.i(416340),
        r = t.i(425353),
        o = t.i(199512);
    let l = (0, i.createContext)({
            size: "Medium",
            isModal: !0,
            hasCloseAffordance: !1,
            hasMarginTop: !0,
            hasMarginBottom: !0,
            hasDescription: !1,
            type: "Default"
        }),
        s = () => {
            let t = (0, i.useContext)(l);
            if (!t) throw Error("Dialog components must be used within a Dialog");
            return t
        },
        c = {
            Small: "padding-x-large",
            Medium: "padding-x-xlarge",
            Large: "padding-x-xlarge"
        },
        u = {
            Small: "padding-top-large",
            Medium: "padding-top-xlarge",
            Large: "padding-top-xlarge"
        },
        d = {
            Small: "padding-bottom-large",
            Medium: "padding-bottom-xlarge",
            Large: "padding-bottom-xlarge"
        },
        p = t => {
            let {
                open: n,
                onOpenChange: a,
                children: o,
                size: s,
                type: c = "Default",
                isModal: u,
                hasCloseAffordance: d,
                closeLabel: p,
                hasMarginTop: f = !0,
                hasMarginBottom: m = !0,
                hasDescription: v = !1,
                experimentalDisablePointerEventsStylingOnBody: g = !1
            } = t, y = (0, i.useMemo)(() => ({
                size: s,
                isModal: u,
                type: c,
                hasCloseAffordance: d,
                closeLabel: p,
                hasMarginTop: f,
                hasMarginBottom: m,
                hasDescription: v
            }), [s, u, c, d, p, f, m, v]);
            return (0, i.useEffect)(() => {
                g && setTimeout(() => {
                    Object.assign(document.body.style, {
                        pointerEvents: "unset"
                    })
                }, 0)
            }, [g, n]), i.default.createElement(l.Provider, {
                value: y
            }, i.default.createElement(r.Root, {
                open: n,
                onOpenChange: a
            }, o))
        };
    p.displayName = "Dialog";
    let f = t => {
        let {
            children: o,
            className: l,
            style: c,
            overlayClassName: u,
            overlayStyle: d,
            onOpenAutoFocus: p,
            ...f
        } = t, {
            size: m,
            isModal: v,
            hasCloseAffordance: g,
            closeLabel: y,
            hasDescription: h
        } = s(), N = (0, a.default)("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", v && "bg-common-backdrop", u), b = (0, a.default)("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", l);
        return i.default.createElement(r.Portal, null, i.default.createElement(r.Overlay, {
            className: N,
            style: d
        }, i.default.createElement(r.Content, {
            className: b,
            "data-size": m,
            style: c,
            onOpenAutoFocus: p,
            ...!h && {
                "aria-describedby": void 0
            },
            ...f
        }, g && i.default.createElement("div", {
            className: "absolute foundation-web-dialog-close-container"
        }, i.default.createElement(r.Close, {
            asChild: !0
        }, i.default.createElement(n.CloseAffordance, {
            variant: "OverMedia",
            size: m,
            isCircular: !0,
            "aria-label": y
        }))), o)))
    };
    f.displayName = "DialogContent";
    let m = t => {
        let {
            children: n,
            className: r,
            ...o
        } = t, {
            size: l,
            hasMarginTop: p,
            hasMarginBottom: f
        } = s(), m = (0, a.default)(c[l], p && u[l], f && d[l], r);
        return i.default.createElement("div", {
            className: m,
            ...o
        }, n)
    };
    m.displayName = "DialogBody";
    let v = t => {
        let {
            children: n,
            className: a,
            hidden: l,
            ...s
        } = t, c = i.default.createElement(r.Title, {
            className: a,
            ...s
        }, n);
        return l ? i.default.createElement(o.VisuallyHidden, null, c) : c
    };
    v.displayName = "DialogTitle";
    let g = t => {
        let {
            children: n,
            className: r,
            ...o
        } = t, {
            size: l
        } = s(), u = (0, a.default)(c[l], d[l], r);
        return i.default.createElement("div", {
            className: u,
            ...o
        }, n)
    };
    g.displayName = "DialogFooter", t.s(["Dialog", 0, p, "DialogBody", 0, m, "DialogContent", 0, f, "DialogFooter", 0, g, "DialogTitle", 0, v])
}, 356407, t => {
    "use strict";
    var n = t.i(253923),
        a = t.i(605836),
        i = t.i(197649),
        r = t.i(416340);
    let o = {
            Small: "padding-xsmall",
            Medium: "padding-small",
            Large: "padding-medium"
        },
        l = {
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-100"
        };
    t.s(["CloseAffordance", 0, t => {
        let {
            variant: s,
            size: c,
            isCircular: u,
            className: d,
            ...p
        } = t;
        return r.default.createElement("button", {
            type: "button",
            className: (0, i.default)("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", n.interactable, l[s], o[c], u && "radius-circle", d),
            ...p
        }, r.default.createElement(n.StateLayer, null), r.default.createElement(a.Icon, {
            name: "icon-regular-x",
            size: c
        }))
    }])
}]);

//# debugId=db5984d9-4db2-94cb-2f6d-c4b858f5c097
//# sourceMappingURL=0jk_kp7wc5grp.js.map